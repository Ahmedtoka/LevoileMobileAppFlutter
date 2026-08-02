import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/app_model.dart';

class SearchBox extends StatefulWidget {
  final double? width;
  final bool showCancelButton;
  final bool autoFocus;

  /// ⚠️ Accepted but NOT honoured.
  ///
  /// The stock field drew its own magnifier and a QR button; Le Voile's version
  /// always shows the magnifier and never shows QR (the camera permission was
  /// removed for store review). They stay in the signature only because
  /// `category_search_screen.dart` and `home_blog_search_screen.dart` still
  /// pass them — deleting them here is a compile error in those callers.
  final bool showSearchIcon;
  final bool showQRCode;

  final String? initText;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final Function()? onCancel;
  final Function(String value)? onChanged;
  final Function(String value)? onSubmitted;

  const SearchBox({
    super.key,
    this.focusNode,
    this.onCancel,
    this.width,
    this.onChanged,
    this.controller,
    this.initText,
    this.onSubmitted,
    this.autoFocus = false,
    this.showSearchIcon = true,
    this.showCancelButton = true,
    this.showQRCode = true,
  });

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController? _textController;

  String _oldSearchText = '';
  Timer? _debounceQuery;

  Function(String value)? get onChanged => widget.onChanged;

  @override
  void initState() {
    super.initState();
    _textController =
        widget.controller ?? TextEditingController(text: widget.initText ?? '');
    _textController!.addListener(_onSearchTextChange);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _textController!.dispose();
    }
    super.dispose();
  }

  void _onSearchTextChange() {
    if (_oldSearchText != _textController!.text) {
      if (_textController!.text.isEmpty) {
        _oldSearchText = '';
        if (_debounceQuery?.isActive ?? false) {
          _debounceQuery!.cancel();
        }
        widget.onChanged?.call('');
        setState(() {});
        return;
      }

      if (_debounceQuery?.isActive ?? false) _debounceQuery!.cancel();
      _debounceQuery = Timer(const Duration(milliseconds: 800), () {
        if (_textController!.text.isNotEmpty) {
          _oldSearchText = _textController!.text;
          widget.onChanged?.call(_textController!.text);
        }
      });
    }
  }

  void _onCancelText() {
    _textController!.clear();
    _oldSearchText = '';
    widget.onCancel?.call();
  }

  /// Le Voile: the placeholder is dashboard-driven, so the wording can change
  /// with the season without an app release. Falls back to CupertinoSearchTextField's
  /// own default when the key is missing.
  String? _placeholder(BuildContext context) {
    try {
      final raw = Provider.of<AppModel>(context, listen: false)
          .appConfig
          ?.settings
          .lvSearch['placeholder'];
      final value = raw?.toString().trim() ?? '';
      return value.isEmpty ? null : value;
    } catch (_) {
      // Config not loaded yet — the stock placeholder is fine.
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var canPop = Navigator.of(context).canPop() && widget.showCancelButton;
    final primary = Theme.of(context).primaryColor;
    final placeholder = _placeholder(context);

    return Container(
      width: widget.width,
      constraints: const BoxConstraints(minHeight: 48),
      padding: const EdgeInsets.fromLTRB(10, 6, 12, 6),
      child: Row(
        children: [
          if (canPop)
            GestureDetector(
              onTap: () {
                var currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
                Navigator.of(context).pop();
              },
              behavior: HitTestBehavior.opaque,
              child: Container(
                width: 36,
                height: 36,
                margin: const EdgeInsetsDirectional.only(end: 8),
                decoration: const BoxDecoration(
                  color: Color(0xFFF7E9E4),
                  shape: BoxShape.circle,
                ),
                // Directional, so it points the right way in Arabic.
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 15,
                  color: primary,
                ),
              ),
            ),
          Expanded(
            // Le Voile: the pill outline from the design. The Cupertino field
            // draws its own grey rounded background, so it is overridden here
            // rather than wrapped — two nested pills looked like a bug.
            child: CupertinoSearchTextField(
              autocorrect: false,
              controller: _textController,
              autofocus: widget.autoFocus,
              focusNode: widget.focusNode,
              placeholder: placeholder,
              itemColor: primary,
              padding: const EdgeInsetsDirectional.fromSTEB(10, 11, 8, 11),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border.all(color: primary, width: 1.2),
                borderRadius: BorderRadius.circular(26),
              ),
              style: Theme.of(context).textTheme.titleMedium,
              placeholderStyle: Theme.of(context).textTheme.titleMedium
                  ?.copyWith(color: const Color(0xFFB2A6AC)),
              onSubmitted: (value) => widget.onSubmitted?.call(value),
              onSuffixTap: _onCancelText,
            ),
          ),
          // Le Voile: QR/barcode scanner removed (camera not used) — keeps the
          // app off the camera permission for store review.
        ],
      ),
    );
  }
}
