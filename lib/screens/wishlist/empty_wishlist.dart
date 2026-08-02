import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';

// Le Voile: flux_ui (FluxImage), common/config.dart (kWishListConfig) and
// image_tools.dart went with the heart illustration. constants.dart stays —
// it carries kGrey200/kGrey400 AND re-exports inspireui's
// `getColorBasedOnBackground`, used on the Start Shopping button below.
import '../../common/constants.dart';

class EmptyWishlist extends StatelessWidget {
  final VoidCallback onShowHome;
  final VoidCallback onSearchForItem;

  const EmptyWishlist({
    super.key,
    required this.onShowHome,
    required this.onSearchForItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          // Le Voile: the template's green heart illustration
          // (assets/images/empty_wishlist.png, via kWishListConfig.emptyImage)
          // was removed — it is off-brand green on a magenta app. The copy
          // already says "tap any heart", so nothing is lost by dropping it.
          const SizedBox(height: 80),
          Text(
            S.of(context).noFavoritesYet,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Text(
            S.of(context).emptyWishlistSubtitle,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: ButtonTheme(
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: onShowHome,
                    child: Text(
                      S.of(context).startShopping.toUpperCase(),
                      style: TextStyle(
                        color: Theme.of(
                          context,
                        ).primaryColor.getColorBasedOnBackground,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ButtonTheme(
                  height: 44,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: kGrey400,
                      backgroundColor: kGrey200,
                    ),
                    onPressed: onSearchForItem,
                    child: Text(S.of(context).searchForItems.toUpperCase()),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
