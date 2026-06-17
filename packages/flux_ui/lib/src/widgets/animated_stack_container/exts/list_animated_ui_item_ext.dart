import '../entities/animated_state.dart';
import '../entities/animated_ui_item.dart';

/// Extension on `List<AnimatedProperty>` to provide methods for sorting and filtering animated properties.
extension AnimatedPropertyListExtension on List<AnimatedUiItem> {
  /// Method to sort the list of animated properties by position.
  /// Returns a new list of animated properties sorted by position.
  List<AnimatedUiItem> sortPosition() {
    final listData = List<AnimatedUiItem>.from(this);

    /// Check if there are more than one animated position state.
    var isMorePosition =
        listData
            .where(
              (element) => element.script.startState is AnimatedPositionState,
            )
            .length >
        1;

    /// Remove position state when there are more than one.
    while (isMorePosition) {
      for (var i = 0; i < listData.length - 1; i++) {
        final item = listData[i];
        if (item.script.startState is AnimatedPositionState) {
          listData.removeAt(i);
          break;
        }
      }

      /// Check again if there are more than one animated position state.
      isMorePosition =
          listData
              .where(
                (element) => element.script.startState is AnimatedPositionState,
              )
              .length >
          1;
    }

    // Sort the list of animated properties by position.
    listData.sort((a, b) {
      final aIsPosition =
          a.script.startState is AnimatedPositionState ||
          b.script.startState is AnimatedPositionState;
      final bIsPosition = b.script.startState is AnimatedPositionState;

      // If the current item is a position state and the next item is not,
      // move the current item to the end.
      if (aIsPosition && !bIsPosition) {
        return 1;
      } else if (!aIsPosition && bIsPosition) {
        return -1;
      }

      /// If both items are position states, sort them by position.
      return 0;
    });

    return listData;
  }
}
