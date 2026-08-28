import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/tools/flash.dart';
import '../../common/tools/price_tools.dart';
import '../../models/app_model.dart';
import '../../models/cart/cart_item_meta_data.dart';
// ⚠️ Imported directly: models/index.dart exports cart_model.dart, which only
// re-exports cart_base.dart — the concrete cart models are imported there for
// the CartInject factory and never exported. `CartModel` resolves without this;
// `CartModelShopify` does not.
import '../../models/cart/cart_model_shopify.dart';
import '../../models/index.dart';
import '../../services/services.dart';
import '../../widgets/product/lv_purchase_limit.dart';

/// Le Voile — "Shop the look".
///
/// ── Why this screen exists ───────────────────────────────────────────────────
///
/// The lookbook used to be a Shopify page opened in a webview, so every "shop
/// the look" purchase went into SHOPIFY'S OWN basket — a different cart from
/// the app's, invisible to the cart badge, to My Coupons, to the Thank-You
/// receipt and to Analytics (CLAUDE.md, "The lookbook webview has its own
/// cart"). Built natively, the pieces land in the app's own cart and everything
/// downstream keeps working.
///
/// ── Why prices are fetched instead of sent ───────────────────────────────────
///
/// 🔴 The dashboard sends identity only — which variant, of which product. Every
/// amount on this screen is read live from Shopify, so an outfit can never
/// advertise a total the checkout will not charge. That failure has already had
/// to be fixed twice in this project.
class LvOutfitsScreen extends StatelessWidget {
  const LvOutfitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final raw = Provider.of<AppModel>(context).appConfig?.settings.lvOutfits;
    final config = raw is Map ? raw : const {};

    final title = '${config['title'] ?? ''}'.trim();
    final subtitle = '${config['subtitle'] ?? ''}'.trim();
    final items = (config['items'] as List?) ?? const [];

    return Scaffold(
      appBar: AppBar(
        title: Text(title.isEmpty ? 'Shop the Look' : title),
        centerTitle: true,
      ),
      body: items.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Text(
                  'Nothing here yet — check back soon.',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : CustomScrollView(
              slivers: [
                if (subtitle.isNotEmpty)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
                      child: Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.66,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, i) {
                        final item = items[i];
                        return _OutfitCard(
                          config: item is Map ? item : const {},
                        );
                      },
                      childCount: items.length,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class _OutfitCard extends StatelessWidget {
  const _OutfitCard({required this.config});

  final Map config;

  @override
  Widget build(BuildContext context) {
    final image = '${config['image'] ?? ''}'.trim();

    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (image.isNotEmpty)
            Image.network(
              image,
              fit: BoxFit.cover,
              // A lookbook photo that fails to load must not take the card —
              // and its button — down with it.
              errorBuilder: (_, _, _) => Container(color: Colors.grey.shade200),
            )
          else
            Container(color: Colors.grey.shade200),
          Positioned(
            left: 10,
            right: 10,
            bottom: 10,
            child: Material(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => _OutfitSheet(config: config),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'SHOP THE LOOK',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// One resolved piece: the product Shopify returned plus the exact variant.
class _Piece {
  _Piece(this.product, this.variation);

  final Product product;
  final ProductVariation variation;

  double get price =>
      double.tryParse('${variation.price ?? product.price ?? ''}') ?? 0;
}

class _OutfitSheet extends StatefulWidget {
  const _OutfitSheet({required this.config});

  final Map config;

  @override
  State<_OutfitSheet> createState() => _OutfitSheetState();
}

class _OutfitSheetState extends State<_OutfitSheet> {
  bool _loading = true;
  bool _adding = false;
  List<_Piece> _pieces = const [];

  /// Pieces the outfit lists that Shopify would not sell — unpublished,
  /// deleted, or a variant that no longer exists. Counted rather than hidden:
  /// a customer being quietly given four items when the photo shows five would
  /// find out at the till.
  int _missing = 0;

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  Future<void> _load() async {
    final products = (widget.config['products'] as List?) ?? const [];
    final found = <_Piece>[];
    var missing = 0;

    for (final entry in products) {
      if (entry is! Map) continue;
      final handle = '${entry['handle'] ?? ''}'.trim();
      final variantId = '${entry['variant'] ?? ''}'.trim();
      if (handle.isEmpty) {
        missing++;
        continue;
      }

      // Per piece, so one unpublished product cannot empty the whole outfit.
      // 🔴 getProductByPermalink THROWS on an unknown handle rather than
      // returning null — Product.fromShopify takes a non-nullable Map.
      try {
        final product = await Services().api.getProductByPermalink(
          '/products/$handle',
        );
        final variation = _match(product, variantId);
        if (product == null || variation == null) {
          missing++;
          continue;
        }
        found.add(_Piece(product, variation));
      } catch (_) {
        missing++;
      }
    }

    if (!mounted) return;
    setState(() {
      _pieces = found;
      _missing = missing;
      _loading = false;
    });
  }

  /// The variant whose Shopify GID matches, and only that one.
  ///
  /// 🔴 Never falls back to "the first one". An outfit is a specific colour in
  /// a specific size; handing the cart a different variant would put the wrong
  /// piece in the customer's bag with nothing on screen to show for it.
  ProductVariation? _match(Product? product, String variantId) {
    final variations = product?.variations;
    if (variations == null || variations.isEmpty) return null;
    if (variantId.isEmpty) return null;

    final numeric = variantId.split('/').last;
    for (final v in variations) {
      final id = '${v.id ?? ''}';
      if (id == variantId || id.endsWith('/$numeric')) return v;
    }
    return null;
  }

  Future<void> _addAll() async {
    if (_pieces.isEmpty || _adding) return;
    setState(() => _adding = true);

    final cartModel = Provider.of<CartModel>(context, listen: false);

    // 🔴 Read BEFORE the loop. Every successful add ends with
    // `setCartDataShopify(null)` to force the totals to be recomputed, so
    // reading this afterwards always found null — and the "your coupon was
    // replaced" sentence, the whole point of tracking it, could never print.
    final hadCoupon = cartModel is CartModelShopify
        ? cartModel.cartDataShopify?.discountCodeApplied
        : null;

    var added = 0;
    var refused = 0;

    for (final piece in _pieces) {
      // The app cart enforces the real per-variant stock (LvPurchaseLimit), so
      // a piece the shop cannot send is refused here rather than at checkout.
      final (ok, _) = await cartModel.addProductToCart(
        context: context,
        product: piece.product,
        quantity: 1,
        cartItemMetaData: CartItemMetaData(variation: piece.variation),
      );
      ok ? added++ : refused++;
      if (!mounted) return;
    }

    final coupon = '${widget.config['coupon'] ?? ''}'.trim();
    var couponNote = '';

    if (added > 0 && coupon.isNotEmpty) {
      // ⚠️ A Shopify cart holds ONE discount code, and Le Voile's rules are set
      // not to combine. Applying the outfit's code therefore replaces whatever
      // the customer had — so it is said out loud rather than done in silence.
      //
      // 🔴 The try is not optional. applyCoupon only catches `on Exception`,
      // and the Shopify service throws bare enum values (`throw
      // ErrorType.unknownError`) which are NOT Exceptions — so a failure there
      // escapes to here, the sheet never pops, `_adding` stays true, and the
      // spinner sticks for ever with the pieces already in the bag.
      try {
        await Services().widget.applyCoupon(
          context,
          code: coupon,
          success: (_) {
            couponNote = hadCoupon != null &&
                    hadCoupon.toLowerCase() != coupon.toLowerCase()
                ? ' The outfit offer replaced code $hadCoupon.'
                : '';
          },
          // A failed outfit code must not read as a failed add: the pieces ARE
          // in the bag, they simply cost full price.
          error: (_) => couponNote = ' The outfit offer could not be applied.',
        );
      } catch (_) {
        couponNote = ' The outfit offer could not be applied.';
      }
    }

    if (!mounted) return;
    Navigator.of(context).pop();

    if (added == 0) {
      unawaited(FlashHelper.errorMessage(
        context,
        message: 'None of these pieces are available right now.',
      ));
      return;
    }

    final shortfall = refused + _missing;
    unawaited(FlashHelper.message(
      context,
      message: shortfall > 0
          ? '$added piece(s) added — $shortfall are unavailable.$couponNote'
          : 'The full outfit is in your bag.$couponNote',
    ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // `currencyCode` / `currencyRates` — the pair every other screen formats
    // with. CartModel has no `currency`.
    final cart = Provider.of<CartModel>(context, listen: false);
    final currency = cart.currencyCode;
    final rates = Provider.of<AppModel>(context, listen: false).currencyRate;

    final total = _pieces.fold<double>(0, (sum, p) => sum + p.price);

    return DraggableScrollableSheet(
      initialChildSize: 0.72,
      minChildSize: 0.4,
      maxChildSize: 0.92,
      expand: false,
      builder: (context, controller) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close_rounded),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            if (_loading)
              const Expanded(
                child: Center(child: CircularProgressIndicator()),
              )
            else
              Expanded(
                child: ListView.separated(
                  controller: controller,
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                  itemCount: _pieces.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 18),
                  itemBuilder: (context, i) =>
                      _row(_pieces[i], rates, currency),
                ),
              ),
            if (!_loading) ...[
              if (_missing > 0)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '$_missing piece(s) from this look are no longer available.',
                    style: TextStyle(
                      fontSize: 11.5,
                      color: theme.colorScheme.error,
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  20,
                  12,
                  20,
                  20 + MediaQuery.of(context).padding.bottom,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Total', style: theme.textTheme.bodyMedium),
                        const Spacer(),
                        Text(
                          PriceTools.getCurrencyFormatted(
                                total,
                                rates,
                                currency: currency,
                              ) ??
                              '',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    // ⚠️ The total above is the plain sum of the pieces. The
                    // outfit's discount code is a real Shopify code and is only
                    // applied once the pieces are in the cart, so the saving
                    // cannot be shown here without quoting a number this screen
                    // has not verified — the exact habit that has already had
                    // to be corrected twice in this project. Say it is coming
                    // instead of guessing what it will be.
                    if ('${widget.config['coupon'] ?? ''}'.trim().isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          'Your outfit offer is applied in the cart.',
                          style: TextStyle(
                            fontSize: 11.5,
                            color: theme.primaryColor,
                          ),
                        ),
                      ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _pieces.isEmpty || _adding ? null : _addAll,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.primaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: _adding
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                'ADD FULL OUTFIT TO CART',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.8,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _row(_Piece piece, rates, String? currency) {
    final image = (piece.variation.imageFeature?.isNotEmpty ?? false)
        ? piece.variation.imageFeature
        : piece.product.imageFeature;

    // The colour/size the outfit specifies, so the customer can see they are
    // getting the exact piece in the photo.
    //
    // ⚠️ Built from `attributes`, not from a `title` — ProductVariation has no
    // title field. This is how the product page labels a variant too.
    final variantLabel = piece.variation.attributes
        .map((a) => '${a.option ?? ''}'.trim())
        .where((s) => s.isNotEmpty)
        .join(' / ');

    // Shown so a piece the shop is short of is visible before the tap, not
    // after — the button adds what it can and says what it could not.
    final limit = LvPurchaseLimit.resolve(
      variation: piece.variation,
      product: piece.product,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: SizedBox(
            width: 60,
            height: 78,
            child: image != null
                ? Image.network(
                    image,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) =>
                        Container(color: Colors.grey.shade200),
                  )
                : Container(color: Colors.grey.shade200),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (piece.product.name ?? '').toUpperCase(),
                style: const TextStyle(
                  fontSize: 12.5,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (variantLabel.isNotEmpty) ...[
                const SizedBox(height: 3),
                Text(
                  variantLabel,
                  style: TextStyle(fontSize: 11.5, color: Colors.grey.shade600),
                ),
              ],
              const SizedBox(height: 6),
              Text(
                PriceTools.getCurrencyFormatted(
                      piece.price,
                      rates,
                      currency: currency,
                    ) ??
                    '',
                style: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (limit != null && limit <= 0) ...[
                const SizedBox(height: 3),
                Text(
                  'Sold out',
                  style: TextStyle(
                    fontSize: 11,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
