import 'dart:async';

import 'package:collection/collection.dart';

import '../common/constants.dart';
import 'entities/paging_response.dart';
import 'entities/tag.dart';
import 'mixins/language_mixin.dart';
import 'paging_data_model.dart';

class TagPayload {
  final String? categoryIds;
  final String? brandIds;
  final List<String>? includeIds;

  const TagPayload({this.categoryIds, this.brandIds, this.includeIds});
}

class TagModel extends PagingDataModel<Tag> with LanguageMixin {
  String? message;

  StreamSubscription? _subLanguageChange;

  int _limit = apiPageSize;

  TagPayload? _payload;

  TagModel([int? limit]) {
    _subLanguageChange = eventBus.on<EventChangeLanguage>().listen((event) {
      getTags(payload: _payload);
    });

    if (limit != null) {
      _limit = limit;
    }
  }

  UnmodifiableListView<Tag> get tagList => data;

  /// Used to store initial tags loaded by IDs to avoid showing only IDs
  List<Tag>? _customTagList;

  Iterable<Tag>? get listVisibleTag =>
      data.where((element) => element.isVisible);

  String getTagName(String? tagId) {
    if (tagId == null) return '';
    return [
          ...tagList,
          ...?_customTagList,
        ].firstWhereOrNull((element) => element.id == tagId)?.name ??
        tagId;
  }

  @override
  void dispose() {
    _subLanguageChange?.cancel();
    super.dispose();
  }

  Future<void> getTags({TagPayload? payload}) async {
    _payload = payload;

    await refresh(autoGetData: false);
    await getData();
  }

  Future<void> loadMoreTags() async {
    await getData();
  }

  Future<void> loadAndAppendTagsByIds(List<String>? tagIds) async {
    if (tagIds == null || tagIds.isEmpty) {
      return;
    }
    final existingTagIds = data.map((e) => e.id).toSet();
    final idsToFetch = tagIds
        .where((id) => !existingTagIds.contains(id))
        .toList();
    if (idsToFetch.isEmpty) {
      return;
    }
    final response = await api.getTagsByPage(
      limit: idsToFetch.length,
      page: 1,
      includeIds: idsToFetch,
    );
    if (response.data?.isNotEmpty == true) {
      _customTagList ??= [];
      _customTagList!.merge(response.data!);
      notifyListeners();
    }
  }

  @override
  Future<PagingResponse<Tag>> Function(dynamic p1) get requestApi =>
      (page) => api.getTagsByPage(
        limit: _limit,
        page: page,
        categoryIds: _payload?.categoryIds,
        brandIds: _payload?.brandIds,
        includeIds: _payload?.includeIds,
      );
}
