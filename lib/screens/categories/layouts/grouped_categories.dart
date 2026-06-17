import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:provider/provider.dart';

import '../../../common/constants.dart';
import '../../../models/index.dart' show AppModel, BackDropArguments;
import '../../../routes/flux_navigate.dart';
import '../../../widgets/common/refresh_scroll_physics.dart';

/// Le Voile: the Categories tab, built straight from the dashboard Categories
/// Tree (order, titles, images, and parent/child grouping all come from the
/// `remapCategories` config — including label-only groups like "Offers" that
/// aren't Shopify collections).
class GroupedCategories extends StatefulWidget {
  static const String type = 'grouped';

  final ScrollController? scrollController;

  const GroupedCategories({super.key, this.scrollController});

  @override
  State<GroupedCategories> createState() => _GroupedCategoriesState();
}

class _GroupedCategoriesState extends State<GroupedCategories> {
  late final ScrollController _controller =
      widget.scrollController ?? ScrollController();

  /// Columns per section based on how many sub-categories it has.
  int _columnsFor(int n) {
    switch (n) {
      case 1:
        return 1;
      case 2:
        return 2;
      case 3:
        return 3;
      case 4:
        return 2;
      case 5:
        return 3;
      case 6:
        return 2;
      default:
        return n.isEven ? 2 : 3;
    }
  }

  /// A real (tappable) Shopify collection ends in /Collection/<digits>.
  bool _isRealCollection(String id) =>
      RegExp(r'/Collection/\d+$').hasMatch(id);

  void _open(BuildContext context, String id, String name) {
    FluxNavigate.pushNamed(
      RouteList.backdrop,
      arguments: BackDropArguments(
        cateId: id,
        cateName: name,
        allowFilterMultipleCategory: false,
      ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);
    final remap = appModel.remapCategories ?? const <Map>[];

    if (remap.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    String parentOf(Map e) => e['parent']?.toString() ?? '';
    String keyOf(Map e) => e['category']?.toString() ?? '';

    final roots = remap.where((e) => parentOf(e).isEmpty).toList();

    final sections = <Widget>[];
    for (final root in roots) {
      final rootKey = keyOf(root);
      final children =
          remap.where((e) => parentOf(e) == rootKey).toList();
      if (children.isEmpty) continue;

      final title = root['name']?.toString() ?? '';
      if (title.isNotEmpty) {
        sections.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 18, 14, 8),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 18,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      }

      final cols = _columnsFor(children.length);
      sections.add(
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: children.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: cols,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: cols == 3 ? 0.82 : 1.1,
          ),
          itemBuilder: (context, i) {
            final child = children[i];
            final id = keyOf(child);
            final name = child['name']?.toString() ?? '';
            final image = child['image']?.toString() ?? '';
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: GestureDetector(
                onTap: _isRealCollection(id)
                    ? () => _open(context, id, name)
                    : null,
                child: _CategoryTile(image: image, name: name),
              ),
            );
          },
        ),
      );
    }

    if (sections.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return RefreshIndicator(
      onRefresh: () async {
        await Provider.of<AppModel>(context, listen: false).loadAppConfig();
      },
      child: ListView(
        controller: _controller,
        physics: const RefreshScrollPhysics(),
        children: [...sections, const SizedBox(height: 24)],
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({required this.image, required this.name});
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (image.isNotEmpty)
          LayoutBuilder(
            builder: (context, c) => FluxImage(
              imageUrl: image,
              fit: BoxFit.cover,
              width: c.maxWidth,
            ),
          )
        else
          Container(color: Colors.grey.shade200),
        Container(
          color: const Color.fromRGBO(0, 0, 0, 0.4),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
