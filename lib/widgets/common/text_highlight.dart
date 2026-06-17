import 'package:flutter/material.dart';

class TextHighlight extends StatelessWidget {
  final String text;
  final String query;
  final TextStyle? style;
  final TextStyle? highlightStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const TextHighlight({
    super.key,
    required this.text,
    required this.query,
    this.style,
    this.highlightStyle,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    if (query.isEmpty) {
      return Text(
        text,
        style: style,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );
    }

    // Build regex pattern from query (supports multiple words)
    final searchTerms = query
        .trim()
        .split(RegExp(r'\s+'))
        .where((q) => q.isNotEmpty)
        .map((q) => RegExp.escape(q))
        .join('|');

    if (searchTerms.isEmpty) {
      return Text(
        text,
        style: style,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );
    }

    // Find all matches using single regex
    final regex = RegExp(searchTerms, caseSensitive: false);
    final matches = regex.allMatches(text).toList();

    if (matches.isEmpty) {
      return Text(
        text,
        style: style,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );
    }

    // Build spans with highlights
    final spans = <TextSpan>[];
    var lastIndex = 0;

    for (final match in matches) {
      // Add text before match
      if (match.start > lastIndex) {
        spans.add(
          TextSpan(text: text.substring(lastIndex, match.start), style: style),
        );
      }

      // Add highlighted match
      spans.add(
        TextSpan(
          text: text.substring(match.start, match.end),
          style: highlightStyle ?? style?.copyWith(fontWeight: FontWeight.w900),
        ),
      );

      lastIndex = match.end;
    }

    // Add remaining text
    if (lastIndex < text.length) {
      spans.add(TextSpan(text: text.substring(lastIndex), style: style));
    }

    return Text.rich(
      TextSpan(children: spans),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
