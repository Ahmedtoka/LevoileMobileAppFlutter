// REMOVED BEFORE RELEASE — kept as a stub only because the file could not be
// deleted from this working copy. Delete it with:
//
//     git rm lib/services/lv_web_bridge.dart
//
// It held a bridge that pulled commerce actions out of the Sara's Outfits
// webview and into the app's own cart. Two review passes found 18 defects in
// it, six of which emptied the customer's basket and told them nothing. It is
// worth rebuilding — see CLAUDE.md, "The lookbook webview has its own cart" —
// but as its own change with a real-device test, not inside the release that
// has to clear Play's 31 Aug targetSdk deadline.
