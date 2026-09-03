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
///
/// `remapCategories` is a flat list where each entry names its own immediate
/// parent (an adjacency list), so it can already express any depth — this
/// widget only ever rendered ONE level of it (root sections + their direct
/// children) and silently dropped anything past that. A grid can't nest
/// sections inline past a level or two and stay usable, so instead: a child
/// tile that itself has children pushes a new screen ([_CategorySubtree])
/// showing THAT tile's own children, reusing the exact same grid — tapping
/// through nests to whatever depth the dashboard tree actually has.
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

  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);
    // Drop any entry that names itself as its own parent — this happens when
    // a category is duplicated as "sub of its parent" but reuses the
    // parent's collection id, so the duplicate's `parent` ends up equal to
    // its own `category` id. Left in, it matches as its own child forever:
    // every screen you drill into shows the same single tile leading back
    // into itself, an infinite navigation loop with no way to reach products.
    final remap = (appModel.remapCategories ?? const <Map>[])
        .where((e) => !_isSelfLoop(e))
        .toList();

    if (remap.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    final roots = remap.where((e) => _parentOf(e).isEmpty).toList();

    final sections = <Widget>[];
    for (final root in roots) {
      final rootKey = _keyOf(root);
      final children = remap.where((e) => _parentOf(e) == rootKey).toList();
      // A root with no subcategories isn't necessarily empty — it can still
      // be its own tappable collection. Only drop it if it's neither (a
      // pure label group with nothing under it).
      final tiles = children.isNotEmpty
          ? children
          : (_isRealCollection(rootKey) ? [root] : const <Map>[]);
      if (tiles.isEmpty) continue;

      final title = root['name']?.toString() ?? '';
      if (title.isNotEmpty) {
        sections.add(_SectionHeading(title: title));
      }

      sections.add(_CategoryGrid(remap: remap, children: tiles));
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

String _parentOf(Map e) => e['parent']?.toString() ?? '';
String _keyOf(Map e) => e['category']?.toString() ?? '';

/// True when an entry lists itself as its own parent (directly, or via a
/// duplicate that reused an ancestor's collection id) — a cycle of length
/// one that would otherwise match as its own child forever.
bool _isSelfLoop(Map e) {
  final key = _keyOf(e);
  return key.isNotEmpty && key == _parentOf(e);
}

/// A real (tappable) Shopify collection ends in `/Collection/<digits>`.
bool _isRealCollection(String id) => RegExp(r'/Collection/\d+$').hasMatch(id);

void _openProducts(BuildContext context, String id, String name) {
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

/// One tile's tap: drill down if it has its own children, otherwise open its
/// products if it is a real collection, otherwise do nothing (a label-only
/// leaf with no children opens nothing today either).
void _onTapChild(BuildContext context, List<Map> remap, Map child) {
  final id = _keyOf(child);
  final name = child['name']?.toString() ?? '';
  final hasChildren = remap.any((e) => _parentOf(e) == id);

  if (hasChildren) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => _CategorySubtree(remap: remap, parentKey: id, title: name),
      ),
    );
  } else if (_isRealCollection(id)) {
    _openProducts(context, id, name);
  }
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

/// The grid of tiles for one parent's direct children — shared by the top
/// level (one grid per root section) and by [_CategorySubtree] (one grid for
/// whatever node the customer drilled into).
class _CategoryGrid extends StatelessWidget {
  const _CategoryGrid({required this.remap, required this.children});

  final List<Map> remap;
  final List<Map> children;

  /// Columns per section based on how many sub-categories it has.
  static int _columnsFor(int n) {
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

  @override
  Widget build(BuildContext context) {
    final cols = _columnsFor(children.length);
    return GridView.builder(
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
        final name = child['name']?.toString() ?? '';
        final image = child['image']?.toString() ?? '';
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: GestureDetector(
            onTap: () => _onTapChild(context, remap, child),
            child: _CategoryTile(image: image, name: name),
          ),
        );
      },
    );
  }
}

/// One level down the tree, reached by tapping a tile that itself has
/// children — a plain screen with a back button, showing that tile's own
/// children in the same grid. Tapping further keeps pushing more of these, so
/// the drawer follows the dashboard tree to whatever depth it actually has.
class _CategorySubtree extends StatelessWidget {
  const _CategorySubtree({
    required this.remap,
    required this.parentKey,
    required this.title,
  });

  final List<Map> remap;
  final String parentKey;
  final String title;

  @override
  Widget build(BuildContext context) {
    final children = remap.where((e) => _parentOf(e) == parentKey).toList();

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: children.isEmpty
            ? const SizedBox()
            : ListView(
                padding: const EdgeInsets.only(bottom: 24),
                children: [
                  const SizedBox(height: 8),
                  _CategoryGrid(remap: remap, children: children),
                ],
              ),
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
