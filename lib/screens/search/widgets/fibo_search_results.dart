import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:flux_ui/flux_ui.dart';

import '../../../common/constants.dart';
import '../../../models/entities/category.dart';
import '../../../models/entities/product.dart';
import '../../../models/entities/tag.dart';
import '../../../models/fibo_search/index.dart';
import '../../../models/product_model.dart';
import '../../../widgets/common/expansion_info.dart';
import '../../../widgets/common/text_highlight.dart';
import '../../../widgets/product/action_button_mixin.dart';
import '../../../widgets/product/widgets/pricing.dart';

class FiboSearchResults extends StatefulWidget with ActionButtonMixin {
  final FiboSearchResponse searchResponse;
  final FiboSearchConfig config;
  final Function(String) onSubmit;

  const FiboSearchResults({
    super.key,
    required this.searchResponse,
    required this.config,
    required this.onSubmit,
  });

  @override
  State<FiboSearchResults> createState() => _FiboSearchResultsState();
}

class _FiboSearchResultsState extends State<FiboSearchResults> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final categories = widget.searchResponse.categories;
    final tags = widget.searchResponse.tags;
    final products = widget.searchResponse.products;
    final searchQuery = widget.searchResponse.searchQuery ?? '';
    final errorMessage = widget.searchResponse.errorMessage;
    final hasNoResults = categories.isEmpty && tags.isEmpty && products.isEmpty;
    final showMinCharsWarning = searchQuery.length < widget.config.minChars;

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification ||
            notification is ScrollEndNotification) {
          FocusScope.of(context).unfocus();
        }
        return true;
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).unfocus(),
          child: Card(
            elevation: 0,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: Theme.of(context).colorScheme.surface,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (errorMessage?.isNotEmpty ?? false) ...[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.warning_amber_rounded,
                          color: Theme.of(context).colorScheme.error,
                          size: 48,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          errorMessage!,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.error,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ] else if (showMinCharsWarning) ...[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      S.of(context).minCharacterMsg(widget.config.minChars),
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ] else if (hasNoResults) ...[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      widget.config.searchNoResultsText,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ] else ...[
                  if (widget.config.showMatchingCategories &&
                      categories.isNotEmpty)
                    _buildCategories(context, categories, searchQuery),
                  if (widget.config.showMatchingTags && tags.isNotEmpty)
                    _buildTags(context, tags, searchQuery),
                  if (products.isNotEmpty) ...[
                    _buildProducts(context, products, searchQuery),
                    if (products.length >= widget.config.limitChars)
                      InkWell(
                        onTap: _isLoading
                            ? null
                            : () async {
                                if (searchQuery.isNotEmpty) {
                                  setState(() => _isLoading = true);
                                  widget.onSubmit(searchQuery);
                                }
                              },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (_isLoading)
                                SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Theme.of(context).primaryColor,
                                    ),
                                  ),
                                )
                              else ...[
                                Text(
                                  widget.config.searchSeeAllResultsText,
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                                const SizedBox(width: 4),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 16,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                  ],
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategories(
    BuildContext context,
    List<Category> categories,
    String query,
  ) {
    return ExpansionInfo(
      title: S.of(context).categories.toUpperCase(),
      expand: true,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return ListTile(
              dense: true,
              title: TextHighlight(
                text: category.name.toString(),
                query: query,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: Text(
                '(${category.totalProduct})',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () => ProductModel.showList(
                cateName: category.name,
                cateId: category.id,
                context: context,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTags(BuildContext context, List<Tag> tags, String query) {
    return ExpansionInfo(
      title: S.of(context).tags.toUpperCase(),
      expand: true,
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tags.length,
          itemBuilder: (context, index) {
            final tag = tags[index];
            return ListTile(
              dense: true,
              title: TextHighlight(
                text: tag.name.toString(),
                query: query,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: Text(
                '(${tag.count})',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () => ProductModel.showList(tag: tag.id, context: context),
            );
          },
        ),
      ],
    );
  }

  Widget _buildProducts(
    BuildContext context,
    List<Product> products,
    String query,
  ) {
    return ExpansionInfo(
      title: S.of(context).products.toUpperCase(),
      expand: true,
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              leading:
                  widget.config.showProductImage &&
                      (product.imageFeature?.isNotNullAndNotEmpty ?? false)
                  ? SizedBox(
                      width: 50,
                      height: 50,
                      child: FluxImage(imageUrl: product.imageFeature!),
                    )
                  : null,
              title: TextHighlight(
                text: product.name ?? '',
                query: query,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.config.showProductSku &&
                        product.sku.isNotNullAndNotEmpty) ...[
                      TextHighlight(
                        text: '${S.of(context).sku}: ${product.sku}',
                        query: query,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 4),
                    ],
                    if (widget.config.showProductDesc) ...[
                      if (product.shortDescription.isNotNullAndNotEmpty)
                        TextHighlight(
                          text: product.shortDescription!,
                          query: query,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      else if (product.description.isNotNullAndNotEmpty)
                        TextHighlight(
                          text: product.description!,
                          query: query,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      const SizedBox(height: 4),
                    ],
                    ProductPricing(
                      hide: !widget.config.showProductPrice,
                      product: product,
                      showOnlyPrice: true,
                      priceTextStyle: Theme.of(context).textTheme.titleMedium!
                          .copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
              onTap: () => widget.onTapProduct(
                context,
                product: product,
                isFromSearchScreen: true,
              ),
            );
          },
        ),
      ],
    );
  }
}
