import 'package:flutter/material.dart';
import 'package:inspireui/inspireui.dart';

import '../../core/localization/localization.dart';
import '../../core/tools/tools.dart';
import 'countdown_timer.dart';

class HeaderView extends StatelessWidget {
  final String? headerText;
  final VoidCallback? callback;
  final bool showSeeAll;
  final bool showCountdown;
  final Duration countdownDuration;
  final String? actionTitle;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const HeaderView({
    this.headerText,
    this.showSeeAll = false,
    super.key,
    this.callback,
    this.showCountdown = false,
    this.countdownDuration = const Duration(),
    this.actionTitle,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    var isDesktop = Tools.isDisplayDesktop(context);

    return SizedBox(
      width: screenSize.width,
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        margin: margin ?? const EdgeInsets.only(top: 6),
        padding:
            padding ??
            const EdgeInsetsDirectional.only(
              start: 16.0,
              top: 6,
              end: 8.0,
              bottom: 6,
            ),
        child: Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isDesktop) ...[const SizedBox(height: 16)],
                  Text(
                    headerText ?? '',
                    style: isDesktop
                        ? Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.w700,
                          )
                        : Theme.of(context).textTheme.titleLarge,
                  ),
                  if (showCountdown)
                    CountDownTimer(
                      countdownDuration,
                      builder: (context, countdownWidget, isEnd) {
                        if (isEnd) {
                          return const SizedBox();
                        }
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              F.of(context).endsIn('').toUpperCase(),
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withValueOpacity(0.8),
                                  )
                                  .apply(fontSizeFactor: 0.6),
                            ),
                            countdownWidget,
                          ],
                        );
                      },
                    ),
                  if (isDesktop) const SizedBox(height: 8),
                ],
              ),
            ),
            if (showSeeAll)
              InkResponse(
                onTap: callback,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    actionTitle ?? F.of(context).seeAll,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
