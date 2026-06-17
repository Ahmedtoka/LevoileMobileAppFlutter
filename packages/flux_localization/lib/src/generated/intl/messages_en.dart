// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(x) => "Active for ${x}";

  static String m1(amount) => "Add ${amount} points";

  static String m2(length) =>
      "Media added to the playlist. ${length} new item(s) added.";

  static String m3(attribute) => "Any ${attribute}";

  static String m4(point) => "Your available points: ${point}";

  static String m5(name) => "Successfully placed a bid for \'${name}\'";

  static String m6(id) => "Booking #${id}";

  static String m7(date) => "Booking requested on: ${date}";

  static String m8(amount) => "Buy now for ${amount}";

  static String m9(author) => "Author: ${author}";

  static String m10(fieldName) =>
      "${fieldName} length must not be less than 3.";

  static String m11(currency) => "Changed currency to ${currency}";

  static String m12(number) => "${number} characters remaining";

  static String m13(date) => "Check-in: ${date}";

  static String m14(date) => "Check-out: ${date}";

  static String m15(priceRate, pointRate) =>
      "${priceRate} = ${pointRate} Points";

  static String m16(count) => "${count} Guest";

  static String m17(count) => "${count} Guests";

  static String m18(count) => "${count} item";

  static String m19(count) => "${count} items";

  static String m20(count) => "${count} item";

  static String m21(count) => "${count} items";

  static String m22(count) => "${count} Ticket";

  static String m23(count) => "${count} Tickets";

  static String m24(country) => "${country} country is not supported";

  static String m25(currency) => "${currency} is not supported";

  static String m26(currency) =>
      "Currency ${currency} is not supported by your Razorpay account. Please contact support to enable international payments or change to a supported currency.";

  static String m27(total) => "~${total} km";

  static String m28(timeLeft) => "Ends in ${timeLeft}";

  static String m29(captcha) => "Enter ${captcha} to confirm:";

  static String m30(message) => "Error: ${message}";

  static String m31(message) => "Error: ${message}";

  static String m32(error) => "An error occurred: ${error}";

  static String m33(date) => "Event Date: ${date}";

  static String m34(time) => "Expiring in ${time}";

  static String m35(total) => ">${total} km";

  static String m36(currentBalance) =>
      "You only have ${currentBalance} left in your wallet";

  static String m37(message) =>
      "There is an issue with the app during the data request. Please contact admin to fix the issues: ${message}";

  static String m38(currency, amount) =>
      "The maximum amount for using this payment is ${currency} ${amount}";

  static String m39(size) => "Maximum file size: ${size} MB";

  static String m40(maxQuantity) =>
      "The maximum quantity allowed in the cart is ${maxQuantity}";

  static String m41(name, formattedPrice) => "${name}: ${formattedPrice}";

  static String m42(currency, amount) =>
      "The minimum amount for using this payment is ${currency} ${amount}";

  static String m43(count) => "Minimum ${count} characters required";

  static String m44(storeName, minOrderAmount) =>
      "Minimum order amount for ${storeName} is ${minOrderAmount}. Please add few more items from this store!";

  static String m45(amount) =>
      "This coupon requires a minimum purchase of ${amount}.";

  static String m46(value) => "Min transaction: ${value}";

  static String m47(store) => "More from ${store}";

  static String m48(number) => "Must be bought in groups of ${number}";

  static String m49(itemCount) => "${itemCount} items";

  static String m50(amount) => "Pay ${amount}";

  static String m51(date) => "Payment due: ${date}";

  static String m52(name) => "${name} have been added to cart successfully";

  static String m53(total) => "Qty: ${total}";

  static String m54(name) => "Received money from ${name}";

  static String m55(count) =>
      "Do you want to remove ${count} item(s) from your wishlist?";

  static String m56(percent) => "${percent}% Off";

  static String m57(keyword, count) => "${keyword} (${count} item)";

  static String m58(keyword, count) => "${keyword} (${count} items)";

  static String m59(totalCartQuantity) =>
      "Shopping cart, ${totalCartQuantity} items";

  static String m60(numberOfUnitsSold) => "Sold: ${numberOfUnitsSold}";

  static String m61(price) => "Starts from ${price}";

  static String m62(fieldName) => "The ${fieldName} field is required";

  static String m63(total) => "${total} products";

  static String m64(name) => "Transfer money to ${name}";

  static String m65(price) => "Up to ${price}";

  static String m66(amount) => "Use ${amount} points";

  static String m67(maxPointDiscount, maxPriceDiscount) =>
      "Use maximum ${maxPointDiscount} Points for a ${maxPriceDiscount} discount on this order!";

  static String m68(time) => "Valid until: ${time}";

  static String m69(date) => "Valid until ${date}";

  static String m70(number) => "Version ${number}";

  static String m71(balance) => "Wallet balance: ${balance}";

  static String m72(message) => "Warning: ${message}";

  static String m73(defaultCurrency) =>
      "The currently selected currency is not available for the Wallet feature, please change it to ${defaultCurrency}";

  static String m74(week) => "Week ${week}";

  static String m75(name) => "Welcome ${name}";

  static String m76(count) => "You are selecting ${count} item(s)";

  static String m77(type) => "You have passed ${type}";

  static String m78(point) => "You have ${point} points";

  static String m79(price) => "You saved ${price}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "aboutUs": MessageLookupByLibrary.simpleMessage("About Us"),
    "account": MessageLookupByLibrary.simpleMessage("Account"),
    "accountApprovalTitle": MessageLookupByLibrary.simpleMessage(
      "Under Approval",
    ),
    "accountDeleteDescription": MessageLookupByLibrary.simpleMessage(
      "Deleting your account removes personal information from our database.",
    ),
    "accountIsPendingApproval": MessageLookupByLibrary.simpleMessage(
      "The account is pending approval.",
    ),
    "accountNumber": MessageLookupByLibrary.simpleMessage("Account Number"),
    "accountSecurity": MessageLookupByLibrary.simpleMessage("Account Security"),
    "accountSecurityDescription": MessageLookupByLibrary.simpleMessage(
      "Changing your password regularly helps protect your account",
    ),
    "accountSetup": MessageLookupByLibrary.simpleMessage("Account setup"),
    "active": MessageLookupByLibrary.simpleMessage("Active"),
    "activeFor": m0,
    "activeLongAgo": MessageLookupByLibrary.simpleMessage(
      "Active a long time ago",
    ),
    "activeNow": MessageLookupByLibrary.simpleMessage("Active now"),
    "add": MessageLookupByLibrary.simpleMessage("add"),
    "addAName": MessageLookupByLibrary.simpleMessage("Add a name"),
    "addANewPost": MessageLookupByLibrary.simpleMessage("Add A New Post"),
    "addASlug": MessageLookupByLibrary.simpleMessage("Add a slug"),
    "addAmountPoints": m1,
    "addAnAttr": MessageLookupByLibrary.simpleMessage("Add an attribute"),
    "addListing": MessageLookupByLibrary.simpleMessage("Add Listing"),
    "addMediaToPlaylist": MessageLookupByLibrary.simpleMessage(
      "Add Media to Playlist",
    ),
    "addMediaToPlaylistFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to add media to the playlist.",
    ),
    "addMediaToPlaylistSuccess": MessageLookupByLibrary.simpleMessage(
      "Media added to the playlist successfully.",
    ),
    "addMediaToPlaylistSuccessWithCount": m2,
    "addMessage": MessageLookupByLibrary.simpleMessage("Add a message"),
    "addNew": MessageLookupByLibrary.simpleMessage("Add new"),
    "addNewAddress": MessageLookupByLibrary.simpleMessage("Add New Address"),
    "addNewBlog": MessageLookupByLibrary.simpleMessage("Add New Blog"),
    "addNewPost": MessageLookupByLibrary.simpleMessage("Create New Post"),
    "addOrUsePointsSuccessMsg": MessageLookupByLibrary.simpleMessage(
      "Congratulations! Points have been successfully added or redeemed.",
    ),
    "addPoint": MessageLookupByLibrary.simpleMessage("Add Point"),
    "addPoints": MessageLookupByLibrary.simpleMessage("Add points"),
    "addProduct": MessageLookupByLibrary.simpleMessage("Add Product"),
    "addToCart": MessageLookupByLibrary.simpleMessage("Add to Cart"),
    "addToCartMaximum": MessageLookupByLibrary.simpleMessage(
      "The maximum quantity has been exceeded",
    ),
    "addToCartSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Added to cart successfully",
    ),
    "addToQuoteRequest": MessageLookupByLibrary.simpleMessage(
      "Add to quote request",
    ),
    "addToWishlist": MessageLookupByLibrary.simpleMessage("Add to Wishlist"),
    "added": MessageLookupByLibrary.simpleMessage("Added"),
    "addedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Added Successfully",
    ),
    "addedToCart": MessageLookupByLibrary.simpleMessage("Added to cart"),
    "addingYourImage": MessageLookupByLibrary.simpleMessage(
      "Adding your image",
    ),
    "additionalInformation": MessageLookupByLibrary.simpleMessage(
      "Additional Information",
    ),
    "additionalServices": MessageLookupByLibrary.simpleMessage(
      "Additional services",
    ),
    "address": MessageLookupByLibrary.simpleMessage("Address"),
    "addressAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Address added successfully",
    ),
    "addressManagement": MessageLookupByLibrary.simpleMessage(
      "Address Management",
    ),
    "addressManagementSubtitle": MessageLookupByLibrary.simpleMessage(
      "Add, edit shipping addresses",
    ),
    "addressNotFound": MessageLookupByLibrary.simpleMessage(
      "Address not found",
    ),
    "addressUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Address updated successfully",
    ),
    "adults": MessageLookupByLibrary.simpleMessage("Adults"),
    "advanceAmount": MessageLookupByLibrary.simpleMessage("Advance amount"),
    "advancePayment": MessageLookupByLibrary.simpleMessage("Advance payment"),
    "afternoon": MessageLookupByLibrary.simpleMessage("Afternoon"),
    "agree": MessageLookupByLibrary.simpleMessage("Agree"),
    "agreeWithPrivacy": MessageLookupByLibrary.simpleMessage(
      "Privacy and Terms",
    ),
    "all": MessageLookupByLibrary.simpleMessage("All"),
    "allBrands": MessageLookupByLibrary.simpleMessage("All Brands"),
    "allDeliveryOrders": MessageLookupByLibrary.simpleMessage("All Orders"),
    "allOrders": MessageLookupByLibrary.simpleMessage("Latest Sales"),
    "allProducts": MessageLookupByLibrary.simpleMessage("All Products"),
    "allowCameraAccess": MessageLookupByLibrary.simpleMessage(
      "Allow Camera access?",
    ),
    "almostSoldOut": MessageLookupByLibrary.simpleMessage("Almost sold out"),
    "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Already have an account?",
    ),
    "amazing": MessageLookupByLibrary.simpleMessage("Amazing"),
    "amount": MessageLookupByLibrary.simpleMessage("Amount"),
    "amountExceedsAvailablePoints": MessageLookupByLibrary.simpleMessage(
      "Amount exceeds available points",
    ),
    "anyAttr": m3,
    "appTrackingRequest": MessageLookupByLibrary.simpleMessage(
      "This identifier will be used to deliver personalized ads to you. \n\"Cancel\" will limit Advertisement network\'s ability to deliver relevant ads to you but will not reduce the number of ads you receive.\nBecause the device is restricted, tracking is disabled and the system can\'t show a request dialog. \"Open Settings\" and allow the app to track your activity across other companies\' apps and websites?",
    ),
    "appTrackingTransparency": MessageLookupByLibrary.simpleMessage(
      "App Tracking Transparency",
    ),
    "appearance": MessageLookupByLibrary.simpleMessage("Appearance"),
    "apply": MessageLookupByLibrary.simpleMessage("Apply"),
    "appointmentStartInvalidDay": MessageLookupByLibrary.simpleMessage(
      "Sorry, appointments cannot start on this day.",
    ),
    "approve": MessageLookupByLibrary.simpleMessage("Approve"),
    "approved": MessageLookupByLibrary.simpleMessage("Approved"),
    "approvedPaid": MessageLookupByLibrary.simpleMessage("Approved - Paid"),
    "approvedRequests": MessageLookupByLibrary.simpleMessage(
      "Approved Requests",
    ),
    "approvedUnpaid": MessageLookupByLibrary.simpleMessage("Approved - Unpaid"),
    "areYouSure": MessageLookupByLibrary.simpleMessage("Are you sure?"),
    "areYouSureCancelOrder": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to cancel this order?",
    ),
    "areYouSureDeleteAccount": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete your account?",
    ),
    "areYouSureEndChat": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to end this chat?",
    ),
    "areYouSureLogOut": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to logout?",
    ),
    "areYouSureRefundOrder": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to refund this order?",
    ),
    "areYouWantToExit": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to exit?",
    ),
    "assigned": MessageLookupByLibrary.simpleMessage("Assigned"),
    "atLeast8Characters": MessageLookupByLibrary.simpleMessage(
      "• At least 8 characters",
    ),
    "atLeastThreeCharacters": MessageLookupByLibrary.simpleMessage(
      "At least 3 characters...",
    ),
    "attribute": MessageLookupByLibrary.simpleMessage("Attribute"),
    "attributeAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "Attribute already exists",
    ),
    "attributes": MessageLookupByLibrary.simpleMessage("Attributes"),
    "auction": MessageLookupByLibrary.simpleMessage("Auction"),
    "auctionDates": MessageLookupByLibrary.simpleMessage("Auction Dates"),
    "auctionEnded": MessageLookupByLibrary.simpleMessage("Auction Ended"),
    "auctionEnds": MessageLookupByLibrary.simpleMessage("Auction ends"),
    "auctionHistory": MessageLookupByLibrary.simpleMessage("Auction History"),
    "auctionItemDidNotMakeItToReservePrice":
        MessageLookupByLibrary.simpleMessage(
          "Auction item did not make it to reserve price",
        ),
    "auctionStarts": MessageLookupByLibrary.simpleMessage("Auction starts"),
    "auctionStartsIn": MessageLookupByLibrary.simpleMessage(
      "Auction starts in",
    ),
    "auctionType": MessageLookupByLibrary.simpleMessage("Auction type"),
    "audioDetected": MessageLookupByLibrary.simpleMessage(
      "Audio item(s) detected. Do you want to add to Audio Player?",
    ),
    "availability": MessageLookupByLibrary.simpleMessage("Availability"),
    "availabilityProduct": MessageLookupByLibrary.simpleMessage(
      "Availability:",
    ),
    "available": MessageLookupByLibrary.simpleMessage("Available"),
    "availableForTiers": MessageLookupByLibrary.simpleMessage(
      "Available For Tiers",
    ),
    "availablePoints": m4,
    "averageRating": MessageLookupByLibrary.simpleMessage("Average Rating"),
    "b2bKingRegisterMsg": MessageLookupByLibrary.simpleMessage(
      "Please contact the administrator to approve your registration.",
    ),
    "back": MessageLookupByLibrary.simpleMessage("Back"),
    "backOrder": MessageLookupByLibrary.simpleMessage("On backorder"),
    "backToShop": MessageLookupByLibrary.simpleMessage("Back to Shop"),
    "backToWallet": MessageLookupByLibrary.simpleMessage("Back to Wallet"),
    "balance": MessageLookupByLibrary.simpleMessage("Balance"),
    "bank": MessageLookupByLibrary.simpleMessage("Bank"),
    "banner": MessageLookupByLibrary.simpleMessage("Banner"),
    "bannerListType": MessageLookupByLibrary.simpleMessage("Banner List Type"),
    "bannerType": MessageLookupByLibrary.simpleMessage("Banner Type"),
    "bannerYoutubeURL": MessageLookupByLibrary.simpleMessage(
      "Banner Youtube URL",
    ),
    "basicInformation": MessageLookupByLibrary.simpleMessage(
      "Basic Information",
    ),
    "becomeADelivery": MessageLookupByLibrary.simpleMessage(
      "Become a Delivery",
    ),
    "becomeAVendor": MessageLookupByLibrary.simpleMessage("Become a Vendor"),
    "becomeAnOwner": MessageLookupByLibrary.simpleMessage("Become an Owner"),
    "becomeDifferentRole": MessageLookupByLibrary.simpleMessage(
      "Become a different role",
    ),
    "benefits": MessageLookupByLibrary.simpleMessage("Benefits"),
    "bid": MessageLookupByLibrary.simpleMessage("Bid"),
    "bidIncrement": MessageLookupByLibrary.simpleMessage("Bid increment"),
    "bidSuccessMessage": m5,
    "billingAddress": MessageLookupByLibrary.simpleMessage("Billing Address"),
    "block": MessageLookupByLibrary.simpleMessage("Block"),
    "blockUser": MessageLookupByLibrary.simpleMessage("Block user"),
    "blog": MessageLookupByLibrary.simpleMessage("Blog"),
    "booked": MessageLookupByLibrary.simpleMessage("Already booked"),
    "booking": MessageLookupByLibrary.simpleMessage("Booking"),
    "bookingCancelled": MessageLookupByLibrary.simpleMessage(
      "Booking Cancelled",
    ),
    "bookingCancelledSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Booking cancelled successfully",
    ),
    "bookingConfirm": MessageLookupByLibrary.simpleMessage("Confirmed"),
    "bookingConfirmation": MessageLookupByLibrary.simpleMessage(
      "Booking Confirmation",
    ),
    "bookingDate": MessageLookupByLibrary.simpleMessage("Booking Date"),
    "bookingDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Booking deleted successfully",
    ),
    "bookingDetails": MessageLookupByLibrary.simpleMessage("Booking Details"),
    "bookingHistory": MessageLookupByLibrary.simpleMessage("Booking History"),
    "bookingID": m6,
    "bookingLocation": MessageLookupByLibrary.simpleMessage("Booking Location"),
    "bookingNotFound": MessageLookupByLibrary.simpleMessage(
      "Booking not found.",
    ),
    "bookingNow": MessageLookupByLibrary.simpleMessage("Book Now"),
    "bookingRequestedOn": m7,
    "bookingSuccess": MessageLookupByLibrary.simpleMessage(
      "Successfully Booked",
    ),
    "bookingUnavailable": MessageLookupByLibrary.simpleMessage(
      "Booking is unavailable",
    ),
    "branch": MessageLookupByLibrary.simpleMessage("Branch"),
    "branchChangeWarning": MessageLookupByLibrary.simpleMessage(
      "Sorry, the shopping cart will be emptied due to the change of region. We are happy to contact you if you need assistance.",
    ),
    "brand": MessageLookupByLibrary.simpleMessage("Brand"),
    "brands": MessageLookupByLibrary.simpleMessage("Brands"),
    "bronze": MessageLookupByLibrary.simpleMessage("Bronze"),
    "bronzePriority": MessageLookupByLibrary.simpleMessage("Bronze Priority"),
    "buyItNowPrice": MessageLookupByLibrary.simpleMessage("Buy it now price"),
    "buyNow": MessageLookupByLibrary.simpleMessage("Buy Now"),
    "buyNowFor": m8,
    "by": MessageLookupByLibrary.simpleMessage("by"),
    "byAppointmentOnly": MessageLookupByLibrary.simpleMessage(
      "By Appointment Only",
    ),
    "byAuthor": m9,
    "byCategory": MessageLookupByLibrary.simpleMessage("By Category"),
    "byPrice": MessageLookupByLibrary.simpleMessage("By Price"),
    "bySignup": MessageLookupByLibrary.simpleMessage(
      "By signing up, you agree to our",
    ),
    "call": MessageLookupByLibrary.simpleMessage("Call"),
    "callTo": MessageLookupByLibrary.simpleMessage("Make a Call To"),
    "callToVendor": MessageLookupByLibrary.simpleMessage("Call Store Owner"),
    "camera": MessageLookupByLibrary.simpleMessage("Camera"),
    "canNotCreateOrder": MessageLookupByLibrary.simpleMessage(
      "Cannot create order",
    ),
    "canNotCreateUser": MessageLookupByLibrary.simpleMessage(
      "Cannot create the user.",
    ),
    "canNotGetPayments": MessageLookupByLibrary.simpleMessage(
      "Cannot get payment methods",
    ),
    "canNotGetShipping": MessageLookupByLibrary.simpleMessage(
      "Cannot get shipping methods",
    ),
    "canNotGetToken": MessageLookupByLibrary.simpleMessage(
      "Cannot get token information.",
    ),
    "canNotLaunch": MessageLookupByLibrary.simpleMessage(
      "Cannot launch this app. Make sure your settings in config.dart are correct",
    ),
    "canNotLoadThisLink": MessageLookupByLibrary.simpleMessage(
      "This link is currently unavailable on this site.",
    ),
    "canNotPlayVideo": MessageLookupByLibrary.simpleMessage(
      "Sorry, this video cannot be played.",
    ),
    "canNotSaveOrder": MessageLookupByLibrary.simpleMessage(
      "Cannot save the order to the website",
    ),
    "canNotUpdateInfo": MessageLookupByLibrary.simpleMessage(
      "Cannot update user info.",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cancelBooking": MessageLookupByLibrary.simpleMessage("Cancel Booking"),
    "cancelBookingFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to cancel the booking.",
    ),
    "cancelOrder": MessageLookupByLibrary.simpleMessage("Cancel Order"),
    "cancelOrderFailed": MessageLookupByLibrary.simpleMessage(
      "The cancel request was unsuccessful",
    ),
    "cancelOrderSuccess": MessageLookupByLibrary.simpleMessage(
      "Your cancel request has been submitted successfully!",
    ),
    "canceledReversal": MessageLookupByLibrary.simpleMessage(
      "Canceled Reversal",
    ),
    "cancelled": MessageLookupByLibrary.simpleMessage("Cancelled"),
    "cancelledRequests": MessageLookupByLibrary.simpleMessage(
      "Cancelled Requests",
    ),
    "cannotChangePassword": MessageLookupByLibrary.simpleMessage(
      "Cannot change password. Please try again.",
    ),
    "cannotDeleteAccount": MessageLookupByLibrary.simpleMessage(
      "This account can\'t delete",
    ),
    "cannotGetPaymentURL": MessageLookupByLibrary.simpleMessage(
      "Cannot get payment URL",
    ),
    "cannotLessThreeLength": m10,
    "cannotSendMessage": MessageLookupByLibrary.simpleMessage(
      "You can\'t send messages",
    ),
    "cantCreateRazorpayInvoice": MessageLookupByLibrary.simpleMessage(
      "Can\'t create invoice for Razorpay",
    ),
    "cantCreateRazorpayOrder": MessageLookupByLibrary.simpleMessage(
      "Can\'t create order for Razorpay",
    ),
    "cantFindThisOrderId": MessageLookupByLibrary.simpleMessage(
      "Can\'t find this order ID",
    ),
    "cantPickDateInThePast": MessageLookupByLibrary.simpleMessage(
      "Date in the past is not allowed",
    ),
    "card": MessageLookupByLibrary.simpleMessage("Card"),
    "cardHolder": MessageLookupByLibrary.simpleMessage("Card Holder"),
    "cardNumber": MessageLookupByLibrary.simpleMessage("Card Number"),
    "cart": MessageLookupByLibrary.simpleMessage("Cart"),
    "cartDiscount": MessageLookupByLibrary.simpleMessage("Cart Discount"),
    "cartNotAvailable": MessageLookupByLibrary.simpleMessage(
      "Cart is not available. Please add some items to your cart.",
    ),
    "cartNotReadyForCheckout": MessageLookupByLibrary.simpleMessage(
      "Your cart is still being processed. Please wait a moment.",
    ),
    "categories": MessageLookupByLibrary.simpleMessage("Categories"),
    "category": MessageLookupByLibrary.simpleMessage("Category"),
    "change": MessageLookupByLibrary.simpleMessage("Change"),
    "changeLanguage": MessageLookupByLibrary.simpleMessage("Change language"),
    "changePassword": MessageLookupByLibrary.simpleMessage("Change Password"),
    "changePasswordSubtitle": MessageLookupByLibrary.simpleMessage(
      "Update security password",
    ),
    "changePasswordSuccess": MessageLookupByLibrary.simpleMessage(
      "Password changed successfully",
    ),
    "changedCurrencyTo": m11,
    "characterRemain": m12,
    "chargeBack": MessageLookupByLibrary.simpleMessage("Charge Back"),
    "chat": MessageLookupByLibrary.simpleMessage("Chat"),
    "chatEnded": MessageLookupByLibrary.simpleMessage(
      "The chat has been ended. Please start a new chat.",
    ),
    "chatListScreen": MessageLookupByLibrary.simpleMessage("Messages"),
    "chatNow": MessageLookupByLibrary.simpleMessage("Chat Now"),
    "chatViaFacebook": MessageLookupByLibrary.simpleMessage(
      "Chat via Facebook Messenger",
    ),
    "chatViaWhatApp": MessageLookupByLibrary.simpleMessage("Chat via WhatsApp"),
    "chatWithStoreOwner": MessageLookupByLibrary.simpleMessage(
      "Chat with Store Owner",
    ),
    "checkConfirmLink": MessageLookupByLibrary.simpleMessage(
      "Check your email for confirmation link",
    ),
    "checkIn": m13,
    "checkOut": m14,
    "checking": MessageLookupByLibrary.simpleMessage("Checking..."),
    "checkout": MessageLookupByLibrary.simpleMessage("Checkout"),
    "chooseBranch": MessageLookupByLibrary.simpleMessage("Choose the branch"),
    "chooseCategory": MessageLookupByLibrary.simpleMessage("Choose category"),
    "chooseFromGallery": MessageLookupByLibrary.simpleMessage(
      "Choose From Gallery",
    ),
    "choosePlan": MessageLookupByLibrary.simpleMessage("Choose Plan"),
    "chooseStaff": MessageLookupByLibrary.simpleMessage("Choose Staff"),
    "chooseType": MessageLookupByLibrary.simpleMessage("Choose type"),
    "chooseYourPaymentMethod": MessageLookupByLibrary.simpleMessage(
      "Choose your payment method",
    ),
    "city": MessageLookupByLibrary.simpleMessage("City"),
    "claim": MessageLookupByLibrary.simpleMessage("Claim"),
    "claimed": MessageLookupByLibrary.simpleMessage("Claimed"),
    "classifieds": MessageLookupByLibrary.simpleMessage("Classifieds"),
    "classifiedsCategories": MessageLookupByLibrary.simpleMessage(
      "Classifieds Categories",
    ),
    "clear": MessageLookupByLibrary.simpleMessage("Clear"),
    "clearCart": MessageLookupByLibrary.simpleMessage("Clear Cart"),
    "clearCartAndAddNew": MessageLookupByLibrary.simpleMessage(
      "Clear Cart and Add New",
    ),
    "clearConversation": MessageLookupByLibrary.simpleMessage(
      "Clear conversation",
    ),
    "close": MessageLookupByLibrary.simpleMessage("Close"),
    "closeNow": MessageLookupByLibrary.simpleMessage("Closed now"),
    "closed": MessageLookupByLibrary.simpleMessage("Closed"),
    "codExtraFee": MessageLookupByLibrary.simpleMessage("COD Extra Fee"),
    "color": MessageLookupByLibrary.simpleMessage("Color"),
    "columns": MessageLookupByLibrary.simpleMessage("Columns"),
    "comment": MessageLookupByLibrary.simpleMessage("Comment"),
    "commentFailed": MessageLookupByLibrary.simpleMessage("Comment Failed!"),
    "commentFirst": MessageLookupByLibrary.simpleMessage(
      "Please write your comment",
    ),
    "commentSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Comment submitted successfully, please wait until your comment is approved",
    ),
    "company": MessageLookupByLibrary.simpleMessage("Company"),
    "completed": MessageLookupByLibrary.simpleMessage("Completed"),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmAccountDeletion": MessageLookupByLibrary.simpleMessage(
      "Confirm Account Deletion",
    ),
    "confirmCancelBooking": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to cancel this booking?",
    ),
    "confirmClearCartWhenTopUp": MessageLookupByLibrary.simpleMessage(
      "The cart will be cleared when topping up.",
    ),
    "confirmClearTheCart": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to clear the cart?",
    ),
    "confirmDelete": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this? This action cannot be undone.",
    ),
    "confirmDeleteBooking": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this booking?",
    ),
    "confirmDeleteItem": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this item?",
    ),
    "confirmNewPassword": MessageLookupByLibrary.simpleMessage(
      "Confirm New Password",
    ),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("Confirm password"),
    "confirmPasswordDoesNotMatch": MessageLookupByLibrary.simpleMessage(
      "Confirm password does not match",
    ),
    "confirmPasswordIsRequired": MessageLookupByLibrary.simpleMessage(
      "The Confirm password field is required",
    ),
    "confirmRemoveProductInCart": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to remove this product?",
    ),
    "connect": MessageLookupByLibrary.simpleMessage("Connect"),
    "contact": MessageLookupByLibrary.simpleMessage("Contact"),
    "contactInformation": MessageLookupByLibrary.simpleMessage(
      "Contact Information",
    ),
    "content": MessageLookupByLibrary.simpleMessage("Content"),
    "continueShopping": MessageLookupByLibrary.simpleMessage(
      "Continue Shopping",
    ),
    "continueToPayment": MessageLookupByLibrary.simpleMessage(
      "Continue to Payment",
    ),
    "continueToPreview": MessageLookupByLibrary.simpleMessage(
      "Continue to Preview",
    ),
    "continueToSelectItem": MessageLookupByLibrary.simpleMessage(
      "Continue to select item",
    ),
    "continueToShipping": MessageLookupByLibrary.simpleMessage(
      "Continue to Shipping",
    ),
    "continues": MessageLookupByLibrary.simpleMessage("Continue"),
    "conversations": MessageLookupByLibrary.simpleMessage("Conversations"),
    "convertPoint": m15,
    "copied": MessageLookupByLibrary.simpleMessage("Copied"),
    "copyright": MessageLookupByLibrary.simpleMessage(
      "© 2024 InspireUI All rights reserved.",
    ),
    "countGuest": m16,
    "countGuests": m17,
    "countItem": m18,
    "countItems": m19,
    "countProduct": m20,
    "countProducts": m21,
    "countTicket": m22,
    "countTickets": m23,
    "countries": MessageLookupByLibrary.simpleMessage("countries"),
    "country": MessageLookupByLibrary.simpleMessage("Country"),
    "countryCodeIsRequired": MessageLookupByLibrary.simpleMessage(
      "Country code is required",
    ),
    "countryIsNotSupported": m24,
    "couponCode": MessageLookupByLibrary.simpleMessage("Coupon Code"),
    "couponHasBeenSavedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Coupon has been saved successfully.",
    ),
    "couponInvalid": MessageLookupByLibrary.simpleMessage(
      "Your coupon code is invalid",
    ),
    "couponMsgSuccess": MessageLookupByLibrary.simpleMessage(
      "Congratulations! Coupon code applied successfully",
    ),
    "couponRemove": MessageLookupByLibrary.simpleMessage(
      "Coupon removed successfully",
    ),
    "couponsDedicatedForYou": MessageLookupByLibrary.simpleMessage(
      "Coupons dedicated for you",
    ),
    "couponsManagement": MessageLookupByLibrary.simpleMessage(
      "Coupons management",
    ),
    "create": MessageLookupByLibrary.simpleMessage("Create"),
    "createAnAccount": MessageLookupByLibrary.simpleMessage(
      "Create an account",
    ),
    "createIndex": MessageLookupByLibrary.simpleMessage("Create Index"),
    "createProduct": MessageLookupByLibrary.simpleMessage("Create Product"),
    "createReviewSuccess": MessageLookupByLibrary.simpleMessage(
      "Thank you for your review",
    ),
    "createReviewSuccessMsg": MessageLookupByLibrary.simpleMessage(
      "We truly appreciate your input and value your contribution in helping us improve",
    ),
    "createVariants": MessageLookupByLibrary.simpleMessage(
      "Create all variants",
    ),
    "createdOn": MessageLookupByLibrary.simpleMessage("Created on:"),
    "currencies": MessageLookupByLibrary.simpleMessage("Currencies"),
    "currencyIsNotSupported": m25,
    "currencyNotSupportedRazorpayMessage": m26,
    "currentBid": MessageLookupByLibrary.simpleMessage("Current bid"),
    "currentPassword": MessageLookupByLibrary.simpleMessage("Current Password"),
    "currentPasswordSection": MessageLookupByLibrary.simpleMessage(
      "Current Password",
    ),
    "currentlyWeOnlyHave": MessageLookupByLibrary.simpleMessage(
      "Currently we only have",
    ),
    "customer": MessageLookupByLibrary.simpleMessage("Customer"),
    "customerDetail": MessageLookupByLibrary.simpleMessage("Customer details"),
    "customerNote": MessageLookupByLibrary.simpleMessage("Customer note"),
    "customerRoleDescription": MessageLookupByLibrary.simpleMessage(
      "This user role allows to make bookings, send private messages to other users and review listings.",
    ),
    "cvv": MessageLookupByLibrary.simpleMessage("CVV"),
    "darkTheme": MessageLookupByLibrary.simpleMessage("Dark Theme"),
    "dashboard": MessageLookupByLibrary.simpleMessage("Dashboard"),
    "dataEmpty": MessageLookupByLibrary.simpleMessage("No Data"),
    "date": MessageLookupByLibrary.simpleMessage("Date"),
    "dateBooking": MessageLookupByLibrary.simpleMessage("Date Booking"),
    "dateEnd": MessageLookupByLibrary.simpleMessage("End Date"),
    "dateLatest": MessageLookupByLibrary.simpleMessage("Date: Latest"),
    "dateOldest": MessageLookupByLibrary.simpleMessage("Date: Oldest"),
    "dateStart": MessageLookupByLibrary.simpleMessage("Start Date"),
    "dateWiseClose": MessageLookupByLibrary.simpleMessage("Date wise close"),
    "debit": MessageLookupByLibrary.simpleMessage("Debit"),
    "defaultAddress": MessageLookupByLibrary.simpleMessage("Default Address"),
    "defaultAddressUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Default address updated successfully",
    ),
    "defaultLabel": MessageLookupByLibrary.simpleMessage("Default"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteAccount": MessageLookupByLibrary.simpleMessage("Delete Account"),
    "deleteAccountMsg": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete your account? Please read how account deletion will affect you.",
    ),
    "deleteAccountSuccess": MessageLookupByLibrary.simpleMessage(
      "Account deleted successfully. Your session has expired.",
    ),
    "deleteAll": MessageLookupByLibrary.simpleMessage("Delete all"),
    "deleteBooking": MessageLookupByLibrary.simpleMessage("Delete Booking"),
    "deleteBookingFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to delete the booking.",
    ),
    "deleteConversation": MessageLookupByLibrary.simpleMessage(
      "Delete conversation",
    ),
    "delivered": MessageLookupByLibrary.simpleMessage("Delivered"),
    "deliveredTo": MessageLookupByLibrary.simpleMessage("Delivered to"),
    "delivering": MessageLookupByLibrary.simpleMessage("Delivering"),
    "deliveryBoy": MessageLookupByLibrary.simpleMessage("Delivery Boy"),
    "deliveryDate": MessageLookupByLibrary.simpleMessage("Delivery Date"),
    "deliveryDetails": MessageLookupByLibrary.simpleMessage("Delivery Details"),
    "deliveryManagement": MessageLookupByLibrary.simpleMessage("Delivery"),
    "deliveryNotificationError": MessageLookupByLibrary.simpleMessage(
      "No Data.\nThis order has been removed.",
    ),
    "denied": MessageLookupByLibrary.simpleMessage("Denied"),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "descriptionEnterVoucher": MessageLookupByLibrary.simpleMessage(
      "Please enter or select a voucher for your order.",
    ),
    "didntReceiveCode": MessageLookupByLibrary.simpleMessage(
      "Didn\'t receive the code?",
    ),
    "direction": MessageLookupByLibrary.simpleMessage("Direction"),
    "disablePurchase": MessageLookupByLibrary.simpleMessage("Disable purchase"),
    "discount": MessageLookupByLibrary.simpleMessage("Discount"),
    "displayName": MessageLookupByLibrary.simpleMessage("Display Name"),
    "displayNameDescription": MessageLookupByLibrary.simpleMessage(
      "Display name is automatically generated from first and last name",
    ),
    "distance": m27,
    "doNotAnyTransactions": MessageLookupByLibrary.simpleMessage(
      "You don\'t have any transactions yet",
    ),
    "doYouWantToExitApp": MessageLookupByLibrary.simpleMessage(
      "Do you want to exit the app?",
    ),
    "doYouWantToLeaveWithoutSubmit": MessageLookupByLibrary.simpleMessage(
      "Do you want to leave without submitting your review?",
    ),
    "doYouWantToLogout": MessageLookupByLibrary.simpleMessage(
      "Do you want to log out?",
    ),
    "doYouWantToUnblock": MessageLookupByLibrary.simpleMessage(
      "Do you want to unblock this user?",
    ),
    "doesNotSupportApplePay": MessageLookupByLibrary.simpleMessage(
      "Apple Pay is not available on this device!",
    ),
    "done": MessageLookupByLibrary.simpleMessage("Done"),
    "dontHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account?",
    ),
    "download": MessageLookupByLibrary.simpleMessage("Download"),
    "downloadApp": MessageLookupByLibrary.simpleMessage("Download App"),
    "downloadingImages": MessageLookupByLibrary.simpleMessage(
      "Downloading images...",
    ),
    "draft": MessageLookupByLibrary.simpleMessage("Draft"),
    "driverAssigned": MessageLookupByLibrary.simpleMessage("Driver Assigned"),
    "duration": MessageLookupByLibrary.simpleMessage("Duration"),
    "earnings": MessageLookupByLibrary.simpleMessage("Earnings"),
    "edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "editAddress": MessageLookupByLibrary.simpleMessage("Edit Address"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailAddressInvalid": MessageLookupByLibrary.simpleMessage(
      "E-mail address is invalid",
    ),
    "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
      "Email already in use!",
    ),
    "emailDeleteDescription": MessageLookupByLibrary.simpleMessage(
      "Deleting your account will unsubscribe you from all mailing lists.",
    ),
    "emailDoesNotExist": MessageLookupByLibrary.simpleMessage(
      "The email account you entered does not exist. Please try again.",
    ),
    "emailIsRequired": MessageLookupByLibrary.simpleMessage(
      "Email is required",
    ),
    "emailSubscription": MessageLookupByLibrary.simpleMessage(
      "Email Subscription",
    ),
    "emptyBookingHistoryMsg": MessageLookupByLibrary.simpleMessage(
      "Looks like you haven\'t made any bookings yet. \nStart exploring and make your first booking!",
    ),
    "emptyCart": MessageLookupByLibrary.simpleMessage("Empty cart"),
    "emptyCartSubtitle": MessageLookupByLibrary.simpleMessage(
      "Looks like you haven\'t added any items to your bag yet. Start shopping to fill it up.",
    ),
    "emptyCartSubtitle02": MessageLookupByLibrary.simpleMessage(
      "Oops! Your cart is feeling a bit light. \n\nReady to shop for something fabulous?",
    ),
    "emptySearch": MessageLookupByLibrary.simpleMessage(
      "You haven\'t searched for items yet. Let\'s start now - we\'ll help you.",
    ),
    "emptyShippingMsg": MessageLookupByLibrary.simpleMessage(
      "No shipping options are available. Please ensure your address has been entered correctly, or contact us if you need assistance.",
    ),
    "emptyUsername": MessageLookupByLibrary.simpleMessage(
      "Username/Email is empty",
    ),
    "emptyWishlist": MessageLookupByLibrary.simpleMessage("Empty wishlist"),
    "emptyWishlistSubtitle": MessageLookupByLibrary.simpleMessage(
      "Tap any heart next to a product to add it to your favorites. We\'ll save them for you here!",
    ),
    "emptyWishlistSubtitle02": MessageLookupByLibrary.simpleMessage(
      "Your wishlist is currently empty.\nStart adding products now!",
    ),
    "enableForCheckout": MessageLookupByLibrary.simpleMessage(
      "Enable for Checkout",
    ),
    "enableForLogin": MessageLookupByLibrary.simpleMessage("Enable for Login"),
    "enableForWallet": MessageLookupByLibrary.simpleMessage(
      "Enable for Wallet",
    ),
    "enableVacationMode": MessageLookupByLibrary.simpleMessage(
      "Enable vacation mode",
    ),
    "endChat": MessageLookupByLibrary.simpleMessage("End Chat"),
    "endDateCantBeAfterFirstDate": MessageLookupByLibrary.simpleMessage(
      "Please select a date after first date",
    ),
    "endsIn": m28,
    "enterAmount": MessageLookupByLibrary.simpleMessage("Enter amount"),
    "enterCaptcha": m29,
    "enterDescription": MessageLookupByLibrary.simpleMessage(
      "Enter description",
    ),
    "enterEmailEachRecipient": MessageLookupByLibrary.simpleMessage(
      "Enter an email address for each recipient",
    ),
    "enterPoint": MessageLookupByLibrary.simpleMessage("Enter point"),
    "enterPrice": MessageLookupByLibrary.simpleMessage("Enter price"),
    "enterSentCode": MessageLookupByLibrary.simpleMessage(
      "Enter the code sent to",
    ),
    "enterVoucherCode": MessageLookupByLibrary.simpleMessage(
      "Enter voucher code",
    ),
    "enterYourAddressInformation": MessageLookupByLibrary.simpleMessage(
      "Enter your address information",
    ),
    "enterYourCurrentLocation": MessageLookupByLibrary.simpleMessage(
      "Enter your current location",
    ),
    "enterYourEmail": MessageLookupByLibrary.simpleMessage("Enter your email"),
    "enterYourEmailOrUsername": MessageLookupByLibrary.simpleMessage(
      "Enter your email or username",
    ),
    "enterYourFirstName": MessageLookupByLibrary.simpleMessage(
      "Enter your first name",
    ),
    "enterYourLastName": MessageLookupByLibrary.simpleMessage(
      "Enter your last name",
    ),
    "enterYourMobile": MessageLookupByLibrary.simpleMessage(
      "Please enter your mobile number",
    ),
    "enterYourName": MessageLookupByLibrary.simpleMessage("Enter your name"),
    "enterYourNote": MessageLookupByLibrary.simpleMessage("Enter your note"),
    "enterYourPassword": MessageLookupByLibrary.simpleMessage(
      "Enter your password",
    ),
    "enterYourPhone": MessageLookupByLibrary.simpleMessage(
      "Enter your phone number to get started.",
    ),
    "enterYourPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "Enter your phone number",
    ),
    "enterYourReview": MessageLookupByLibrary.simpleMessage(
      "Enter your review",
    ),
    "enterYourReviewHint": MessageLookupByLibrary.simpleMessage(
      "Share more thoughts on the product to help other buyers.",
    ),
    "enterYourUsername": MessageLookupByLibrary.simpleMessage(
      "Enter your username",
    ),
    "error": m30,
    "errorEmailFormat": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email address.",
    ),
    "errorMsg": m31,
    "errorOccurred": m32,
    "errorOnGettingPost": MessageLookupByLibrary.simpleMessage(
      "Error on getting post!",
    ),
    "errorPasswordFormat": MessageLookupByLibrary.simpleMessage(
      "Please enter a password of at least 8 characters",
    ),
    "errorPrefix": MessageLookupByLibrary.simpleMessage("Error"),
    "evening": MessageLookupByLibrary.simpleMessage("Evening"),
    "event": MessageLookupByLibrary.simpleMessage("Event"),
    "eventDate": m33,
    "events": MessageLookupByLibrary.simpleMessage("Events"),
    "eventsCategories": MessageLookupByLibrary.simpleMessage(
      "Events Categories",
    ),
    "expectedDeliveryDate": MessageLookupByLibrary.simpleMessage(
      "Expected Delivery Date",
    ),
    "expired": MessageLookupByLibrary.simpleMessage("Expired"),
    "expiredDate": MessageLookupByLibrary.simpleMessage("Expiration Date"),
    "expiredDateHint": MessageLookupByLibrary.simpleMessage("MM/YY"),
    "expiringInTime": m34,
    "exploreNow": MessageLookupByLibrary.simpleMessage("Explore Now"),
    "extraServices": MessageLookupByLibrary.simpleMessage("Extra Services"),
    "failToAssign": MessageLookupByLibrary.simpleMessage(
      "Failed to assign User",
    ),
    "failed": MessageLookupByLibrary.simpleMessage("Failed"),
    "failedToCreateReview": MessageLookupByLibrary.simpleMessage(
      "Failed to create review",
    ),
    "failedToGenerateLink": MessageLookupByLibrary.simpleMessage(
      "Failed to generate link",
    ),
    "failedToLoadAppConfig": MessageLookupByLibrary.simpleMessage(
      "Failed to load application configuration. Please try again or restart your application.",
    ),
    "failedToLoadImage": MessageLookupByLibrary.simpleMessage(
      "Failed to load image",
    ),
    "failedToSaveImage": MessageLookupByLibrary.simpleMessage(
      "Failed to save image",
    ),
    "failedToUpdateDefaultAddress": MessageLookupByLibrary.simpleMessage(
      "Failed to update default address",
    ),
    "fair": MessageLookupByLibrary.simpleMessage("Fair"),
    "fax": MessageLookupByLibrary.simpleMessage("Fax"),
    "feature": MessageLookupByLibrary.simpleMessage("Feature"),
    "featureImage": MessageLookupByLibrary.simpleMessage("Featured Image"),
    "featureNotAvailable": MessageLookupByLibrary.simpleMessage(
      "Feature not available",
    ),
    "featured": MessageLookupByLibrary.simpleMessage("Featured"),
    "features": MessageLookupByLibrary.simpleMessage("Features"),
    "fileIsTooBig": MessageLookupByLibrary.simpleMessage(
      "The file is too big. Please choose a smaller file!",
    ),
    "fileUploadFailed": MessageLookupByLibrary.simpleMessage(
      "File upload failed!",
    ),
    "files": MessageLookupByLibrary.simpleMessage("Files"),
    "filter": MessageLookupByLibrary.simpleMessage("Filter"),
    "finalCost": MessageLookupByLibrary.simpleMessage("Final cost"),
    "fingerprintsTouchID": MessageLookupByLibrary.simpleMessage(
      "Fingerprints, Touch ID",
    ),
    "firstName": MessageLookupByLibrary.simpleMessage("First Name"),
    "firstNameIsRequired": MessageLookupByLibrary.simpleMessage(
      "First name is required",
    ),
    "firstRenewal": MessageLookupByLibrary.simpleMessage("First Renewal"),
    "fixedCartDiscount": MessageLookupByLibrary.simpleMessage(
      "Fixed Cart Discount",
    ),
    "fixedProductDiscount": MessageLookupByLibrary.simpleMessage(
      "Fixed Product Discount",
    ),
    "forThisProduct": MessageLookupByLibrary.simpleMessage("of this product"),
    "free": MessageLookupByLibrary.simpleMessage("Free"),
    "freeOfCharge": MessageLookupByLibrary.simpleMessage("Free of charge"),
    "friday": MessageLookupByLibrary.simpleMessage("Friday"),
    "from": MessageLookupByLibrary.simpleMessage("From"),
    "fullName": MessageLookupByLibrary.simpleMessage("Full name"),
    "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
    "generalError": MessageLookupByLibrary.simpleMessage(
      "Something went wrong. Please try again.",
    ),
    "generalSetting": MessageLookupByLibrary.simpleMessage("General Settings"),
    "generatingLink": MessageLookupByLibrary.simpleMessage(
      "Generating link...",
    ),
    "getNotification": MessageLookupByLibrary.simpleMessage(
      "Get Notifications",
    ),
    "getNotified": MessageLookupByLibrary.simpleMessage("Get notified!"),
    "getPasswordLink": MessageLookupByLibrary.simpleMessage(
      "Get password link",
    ),
    "getStarted": MessageLookupByLibrary.simpleMessage("Get Started"),
    "getTicket": MessageLookupByLibrary.simpleMessage("Get Ticket"),
    "goBack": MessageLookupByLibrary.simpleMessage("Go back"),
    "goBackHomePage": MessageLookupByLibrary.simpleMessage(
      "Go back to home page",
    ),
    "goBackToAddress": MessageLookupByLibrary.simpleMessage("Back to Address"),
    "goBackToShipping": MessageLookupByLibrary.simpleMessage(
      "Back to Shipping",
    ),
    "gold": MessageLookupByLibrary.simpleMessage("Gold"),
    "goldPriority": MessageLookupByLibrary.simpleMessage("Gold Priority"),
    "good": MessageLookupByLibrary.simpleMessage("Good"),
    "graphqlError": MessageLookupByLibrary.simpleMessage(
      "Something went wrong when trying to do this action. Please double check",
    ),
    "greaterDistance": m35,
    "grossSales": MessageLookupByLibrary.simpleMessage("Gross Sales"),
    "grouped": MessageLookupByLibrary.simpleMessage("Grouped"),
    "guests": MessageLookupByLibrary.simpleMessage("Guests"),
    "hasBeenDeleted": MessageLookupByLibrary.simpleMessage("has been deleted"),
    "haveACoupon": MessageLookupByLibrary.simpleMessage("Have a coupon?"),
    "haveYouGotQuestion": MessageLookupByLibrary.simpleMessage(
      "Have you got a question? Write to us!",
    ),
    "hideAbout": MessageLookupByLibrary.simpleMessage("Hide About"),
    "hideAddress": MessageLookupByLibrary.simpleMessage("Hide Address"),
    "hideEmail": MessageLookupByLibrary.simpleMessage("Hide Email"),
    "hideMap": MessageLookupByLibrary.simpleMessage("Hide Map"),
    "hidePhone": MessageLookupByLibrary.simpleMessage("Hide Phone"),
    "hidePolicy": MessageLookupByLibrary.simpleMessage("Hide Policy"),
    "history": MessageLookupByLibrary.simpleMessage("History"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "horizontal": MessageLookupByLibrary.simpleMessage("Horizontal"),
    "hour": MessageLookupByLibrary.simpleMessage("Hour"),
    "howToEarnPoints": MessageLookupByLibrary.simpleMessage(
      "How to earn points?",
    ),
    "iAgree": MessageLookupByLibrary.simpleMessage("I agree to the"),
    "imIn": MessageLookupByLibrary.simpleMessage("I\'m in"),
    "imageGallery": MessageLookupByLibrary.simpleMessage("Image Gallery"),
    "imageNetwork": MessageLookupByLibrary.simpleMessage("Image Network"),
    "images": MessageLookupByLibrary.simpleMessage("Images"),
    "inStock": MessageLookupByLibrary.simpleMessage("In Stock"),
    "incorrectPassword": MessageLookupByLibrary.simpleMessage(
      "Incorrect password",
    ),
    "informationTable": MessageLookupByLibrary.simpleMessage(
      "Information Table",
    ),
    "installDigitsPlugin": MessageLookupByLibrary.simpleMessage(
      "Please install the DIGITS: Wordpress Mobile Number Signup and Login plugin",
    ),
    "instantlyClose": MessageLookupByLibrary.simpleMessage("Instantly close"),
    "insufficientBalanceMessage": m36,
    "invalidAddress": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid address",
    ),
    "invalidBooking": MessageLookupByLibrary.simpleMessage("Invalid booking."),
    "invalidCity": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid city name",
    ),
    "invalidCountry": MessageLookupByLibrary.simpleMessage(
      "Please select a valid country",
    ),
    "invalidCountryCode": MessageLookupByLibrary.simpleMessage(
      "Please select a valid country code",
    ),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email address",
    ),
    "invalidPhone": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid phone number",
    ),
    "invalidPhoneNumber": MessageLookupByLibrary.simpleMessage(
      "Invalid Phone Number",
    ),
    "invalidPostalCode": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid postal code",
    ),
    "invalidProvince": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid province/state",
    ),
    "invalidQRCode": MessageLookupByLibrary.simpleMessage("Invalid QR code"),
    "invalidQRCodeMsg": MessageLookupByLibrary.simpleMessage(
      "The scanned QR code is not valid. Please check and try again.",
    ),
    "invalidSMSCode": MessageLookupByLibrary.simpleMessage(
      "Invalid SMS Verification Code",
    ),
    "invalidUrl": MessageLookupByLibrary.simpleMessage(
      "Oops! We couldn’t open this link.",
    ),
    "invalidYearOfBirth": MessageLookupByLibrary.simpleMessage(
      "Invalid Year of Birth",
    ),
    "isEverythingSet": MessageLookupByLibrary.simpleMessage(
      "Is everything set...?",
    ),
    "isRequired": MessageLookupByLibrary.simpleMessage("is required"),
    "item": MessageLookupByLibrary.simpleMessage("Item"),
    "itemCondition": MessageLookupByLibrary.simpleMessage("Item condition"),
    "itemConditionNew": MessageLookupByLibrary.simpleMessage("New"),
    "itemTotal": MessageLookupByLibrary.simpleMessage("Item total:"),
    "items": MessageLookupByLibrary.simpleMessage("items"),
    "itsOrdered": MessageLookupByLibrary.simpleMessage("Order Placed!"),
    "iwantToCreateAccount": MessageLookupByLibrary.simpleMessage(
      "I want to create an account",
    ),
    "keep": MessageLookupByLibrary.simpleMessage("Keep"),
    "language": MessageLookupByLibrary.simpleMessage("Languages"),
    "languageSuccess": MessageLookupByLibrary.simpleMessage(
      "Language updated successfully",
    ),
    "lastName": MessageLookupByLibrary.simpleMessage("Last Name"),
    "lastNameIsRequired": MessageLookupByLibrary.simpleMessage(
      "Last name is required",
    ),
    "lastTransactions": MessageLookupByLibrary.simpleMessage(
      "Last Transactions",
    ),
    "latestProducts": MessageLookupByLibrary.simpleMessage("Latest Products"),
    "layout": MessageLookupByLibrary.simpleMessage("Layouts"),
    "lightTheme": MessageLookupByLibrary.simpleMessage("Light Theme"),
    "link": MessageLookupByLibrary.simpleMessage("Link"),
    "list": MessageLookupByLibrary.simpleMessage("List"),
    "listBannerType": MessageLookupByLibrary.simpleMessage("List Banner Type"),
    "listBannerVideo": MessageLookupByLibrary.simpleMessage(
      "List Banner Video",
    ),
    "listMessages": MessageLookupByLibrary.simpleMessage(
      "Notification Messages",
    ),
    "listTile": MessageLookupByLibrary.simpleMessage("List Tile"),
    "liveChat": MessageLookupByLibrary.simpleMessage("Live Chat"),
    "loadFail": MessageLookupByLibrary.simpleMessage("Load Failed!"),
    "loadFailed": MessageLookupByLibrary.simpleMessage("Load failed!"),
    "loading": MessageLookupByLibrary.simpleMessage("Loading..."),
    "loadingLink": MessageLookupByLibrary.simpleMessage("Loading link..."),
    "location": MessageLookupByLibrary.simpleMessage("Location"),
    "lockScreenAndSecurity": MessageLookupByLibrary.simpleMessage(
      "Lock screen and security",
    ),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "loginCanceled": MessageLookupByLibrary.simpleMessage("Login cancelled"),
    "loginErrorServiceProvider": m37,
    "loginFailed": MessageLookupByLibrary.simpleMessage("Login failed!"),
    "loginInvalid": MessageLookupByLibrary.simpleMessage(
      "You are not allowed to use this app.",
    ),
    "loginRequired": MessageLookupByLibrary.simpleMessage("Login Required"),
    "loginSuccess": MessageLookupByLibrary.simpleMessage("Login successful!"),
    "loginToComment": MessageLookupByLibrary.simpleMessage(
      "Please Login To Comment",
    ),
    "loginToContinue": MessageLookupByLibrary.simpleMessage(
      "Please log in to continue",
    ),
    "loginToReview": MessageLookupByLibrary.simpleMessage(
      "Please login to review",
    ),
    "loginToYourAccount": MessageLookupByLibrary.simpleMessage(
      "Login to your account",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "loyaltyVoucher": MessageLookupByLibrary.simpleMessage("Loyalty Voucher"),
    "manageApiKey": MessageLookupByLibrary.simpleMessage("Manage API Key"),
    "manageStock": MessageLookupByLibrary.simpleMessage("Manage Stock"),
    "map": MessageLookupByLibrary.simpleMessage("Map"),
    "markAsRead": MessageLookupByLibrary.simpleMessage("Mark as read"),
    "markAsShipped": MessageLookupByLibrary.simpleMessage("Mark as shipped"),
    "markAsUnread": MessageLookupByLibrary.simpleMessage("Mark as unread"),
    "maxAmountForPayment": m38,
    "maximumFileSizeMb": m39,
    "maximumQuantityAllowed": m40,
    "maybeLater": MessageLookupByLibrary.simpleMessage("Maybe Later"),
    "menuOrder": MessageLookupByLibrary.simpleMessage("Menu order"),
    "menuServiceItems": m41,
    "menus": MessageLookupByLibrary.simpleMessage("Menus"),
    "message": MessageLookupByLibrary.simpleMessage("Message"),
    "messageTo": MessageLookupByLibrary.simpleMessage("Send Message To"),
    "messageToListingOwner": MessageLookupByLibrary.simpleMessage(
      "Your short message to the listing owner (optional)",
    ),
    "minAmountForPayment": m42,
    "minCharacterMsg": m43,
    "minOrderAmount": m44,
    "minTotalCouponInvalidMsg": m45,
    "minTransaction": m46,
    "minimumQuantityIs": MessageLookupByLibrary.simpleMessage(
      "Minimum quantity is",
    ),
    "missingFirestoreIndexDescription": MessageLookupByLibrary.simpleMessage(
      "This query requires an index. Please log in to the Firebase console and create the index by clicking the button below. You need to wait a moment for it to be enabled.",
    ),
    "missingFirestoreIndexTitle": MessageLookupByLibrary.simpleMessage(
      "Missing Firestore index detected!",
    ),
    "mobile": MessageLookupByLibrary.simpleMessage("Mobile"),
    "mobileIsRequired": MessageLookupByLibrary.simpleMessage(
      "Mobile is required",
    ),
    "mobileNumberInUse": MessageLookupByLibrary.simpleMessage(
      "Mobile Number already in use!",
    ),
    "mobileNumberIsNotRegistered": MessageLookupByLibrary.simpleMessage(
      "Phone number is not registered!",
    ),
    "mobileVerification": MessageLookupByLibrary.simpleMessage(
      "Mobile Verification",
    ),
    "monday": MessageLookupByLibrary.simpleMessage("Monday"),
    "more": MessageLookupByLibrary.simpleMessage("...more"),
    "moreFromStore": m47,
    "moreInformation": MessageLookupByLibrary.simpleMessage("More information"),
    "morning": MessageLookupByLibrary.simpleMessage("Morning"),
    "multipleSellersDetected": MessageLookupByLibrary.simpleMessage(
      "Multiple Sellers Detected",
    ),
    "multipleSellersDetectedAndDisableMultiVendorCheckoutContent":
        MessageLookupByLibrary.simpleMessage(
          "You\'re trying to add a product from a new seller to your cart. Please note that you can only purchase from one seller at a time.",
        ),
    "multipleSellersDetectedAndEnableMultiVendorCheckoutContent":
        MessageLookupByLibrary.simpleMessage(
          "You\'re trying to add a product from a new seller to your cart. Do you want to continue?",
        ),
    "mustBeBoughtInGroupsOf": m48,
    "mustSelectOneItem": MessageLookupByLibrary.simpleMessage(
      "You must select 1 item",
    ),
    "myCart": MessageLookupByLibrary.simpleMessage("My Cart"),
    "myCoupons": MessageLookupByLibrary.simpleMessage("My coupons"),
    "myOrder": MessageLookupByLibrary.simpleMessage("My Orders"),
    "myPoints": MessageLookupByLibrary.simpleMessage("My Points"),
    "myProducts": MessageLookupByLibrary.simpleMessage("My Products"),
    "myProductsEmpty": MessageLookupByLibrary.simpleMessage(
      "You don\'t have any products. Try creating one!",
    ),
    "myQRCode": MessageLookupByLibrary.simpleMessage("My QRCode"),
    "myQRCodeNote": MessageLookupByLibrary.simpleMessage(
      "Provide this code to staff to",
    ),
    "myRating": MessageLookupByLibrary.simpleMessage("My Rating"),
    "myReviews": MessageLookupByLibrary.simpleMessage("My Reviews"),
    "myWallet": MessageLookupByLibrary.simpleMessage("My Wallet"),
    "myWishList": MessageLookupByLibrary.simpleMessage("My Wishlist"),
    "nItems": m49,
    "name": MessageLookupByLibrary.simpleMessage("Name"),
    "nameIsRequired": MessageLookupByLibrary.simpleMessage("Name is required"),
    "nameOnCard": MessageLookupByLibrary.simpleMessage("Name on Card"),
    "nearbyPlaces": MessageLookupByLibrary.simpleMessage("Nearby Places"),
    "needHelp": MessageLookupByLibrary.simpleMessage("Need help?"),
    "needToLoginAgain": MessageLookupByLibrary.simpleMessage(
      "You need to log in again to apply the update",
    ),
    "network": MessageLookupByLibrary.simpleMessage("Network"),
    "networkError": MessageLookupByLibrary.simpleMessage(
      "Please double check your network",
    ),
    "newAppConfig": MessageLookupByLibrary.simpleMessage(
      "New content available!",
    ),
    "newPassword": MessageLookupByLibrary.simpleMessage("New Password"),
    "newPasswordSection": MessageLookupByLibrary.simpleMessage("New Password"),
    "newVariation": MessageLookupByLibrary.simpleMessage("New variation"),
    "next": MessageLookupByLibrary.simpleMessage("Next"),
    "no": MessageLookupByLibrary.simpleMessage("No"),
    "noAddressHaveBeenSaved": MessageLookupByLibrary.simpleMessage(
      "No addresses have been saved yet",
    ),
    "noAddressesFound": MessageLookupByLibrary.simpleMessage(
      "No addresses found",
    ),
    "noCameraPermissionIsGranted": MessageLookupByLibrary.simpleMessage(
      "No camera permission has been granted. Please grant it in your device\'s Settings.",
    ),
    "noComments": MessageLookupByLibrary.simpleMessage("No Comments"),
    "noConversation": MessageLookupByLibrary.simpleMessage(
      "No conversation yet",
    ),
    "noConversationDescription": MessageLookupByLibrary.simpleMessage(
      "It will appear when someone starts chatting with you",
    ),
    "noData": MessageLookupByLibrary.simpleMessage("No more data"),
    "noDisplayName": MessageLookupByLibrary.simpleMessage("No display name"),
    "noFavoritesYet": MessageLookupByLibrary.simpleMessage("No favorites yet"),
    "noFileToDownload": MessageLookupByLibrary.simpleMessage(
      "No file to download.",
    ),
    "noInternetConnection": MessageLookupByLibrary.simpleMessage(
      "No Internet Connection",
    ),
    "noInternetReconnectToContinue": MessageLookupByLibrary.simpleMessage(
      "⚠️ No internet. Reconnect to continue shopping.",
    ),
    "noListingNearby": MessageLookupByLibrary.simpleMessage(
      "No listings nearby!",
    ),
    "noMembershipPlans": MessageLookupByLibrary.simpleMessage(
      "No membership plans available",
    ),
    "noNotification": MessageLookupByLibrary.simpleMessage(
      "No notifications yet",
    ),
    "noOrders": MessageLookupByLibrary.simpleMessage("No Orders"),
    "noPaymentMethodsAvailable": MessageLookupByLibrary.simpleMessage(
      "No payment methods are available.",
    ),
    "noPendingDeliveryOrder": MessageLookupByLibrary.simpleMessage(
      "No pending orders to deliver",
    ),
    "noPermissionForCurrentRole": MessageLookupByLibrary.simpleMessage(
      "Sorry, this product is not accessible for your current role.",
    ),
    "noPermissionToViewProduct": MessageLookupByLibrary.simpleMessage(
      "This product is available for users with specific roles.",
    ),
    "noPermissionToViewProductMsg": MessageLookupByLibrary.simpleMessage(
      "Please log in with the appropriate credentials to access this product or contact us for more information.",
    ),
    "noPost": MessageLookupByLibrary.simpleMessage(
      "Oops, this page no longer exists!",
    ),
    "noProduct": MessageLookupByLibrary.simpleMessage("No Products"),
    "noProductsFoundInOrder": MessageLookupByLibrary.simpleMessage(
      "No products found in this order",
    ),
    "noResultFound": MessageLookupByLibrary.simpleMessage("No Results Found"),
    "noReviews": MessageLookupByLibrary.simpleMessage("No Reviews"),
    "noSlotAvailable": MessageLookupByLibrary.simpleMessage(
      "No slot available",
    ),
    "noStoreInformation": MessageLookupByLibrary.simpleMessage(
      "No store information available",
    ),
    "noStoreNearby": MessageLookupByLibrary.simpleMessage("No stores nearby!"),
    "noSuggestionSearch": MessageLookupByLibrary.simpleMessage(
      "No suggestions found",
    ),
    "noThanks": MessageLookupByLibrary.simpleMessage("No thanks"),
    "noTransactionsMsg": MessageLookupByLibrary.simpleMessage(
      "Sorry, no transactions were found!",
    ),
    "noVideoFound": MessageLookupByLibrary.simpleMessage(
      "Sorry, no videos found.",
    ),
    "none": MessageLookupByLibrary.simpleMessage("None"),
    "normal": MessageLookupByLibrary.simpleMessage("Normal"),
    "notFindResult": MessageLookupByLibrary.simpleMessage(
      "Sorry, we couldn\'t find any results.",
    ),
    "notFound": MessageLookupByLibrary.simpleMessage("Not Found"),
    "notLoggedInLiveChatWarning": MessageLookupByLibrary.simpleMessage(
      "You are not logged in, the chat will expire if you exit.",
    ),
    "notRated": MessageLookupByLibrary.simpleMessage("Not rated"),
    "note": MessageLookupByLibrary.simpleMessage("Order Note"),
    "noteMessage": MessageLookupByLibrary.simpleMessage("note"),
    "noteOptional": MessageLookupByLibrary.simpleMessage("Note (optional)"),
    "notice": MessageLookupByLibrary.simpleMessage("Notice"),
    "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "notifyLatestOffer": MessageLookupByLibrary.simpleMessage(
      "Notify latest offers & product availability",
    ),
    "ofThisProduct": MessageLookupByLibrary.simpleMessage("of this product"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "on": MessageLookupByLibrary.simpleMessage("on"),
    "onHold": MessageLookupByLibrary.simpleMessage("On Hold"),
    "onSale": MessageLookupByLibrary.simpleMessage("On Sale"),
    "onVacation": MessageLookupByLibrary.simpleMessage("On vacation"),
    "oneEachRecipient": MessageLookupByLibrary.simpleMessage(
      "1 to each recipient",
    ),
    "online": MessageLookupByLibrary.simpleMessage("Online"),
    "open24Hours": MessageLookupByLibrary.simpleMessage("Open 24h"),
    "openMap": MessageLookupByLibrary.simpleMessage("Open Map"),
    "openNow": MessageLookupByLibrary.simpleMessage("Open now"),
    "openSettings": MessageLookupByLibrary.simpleMessage("Open settings"),
    "openingHours": MessageLookupByLibrary.simpleMessage("Opening Hours"),
    "optional": MessageLookupByLibrary.simpleMessage("optional"),
    "options": MessageLookupByLibrary.simpleMessage("Options"),
    "or": MessageLookupByLibrary.simpleMessage("OR"),
    "orLoginWith": MessageLookupByLibrary.simpleMessage("or login with"),
    "orderDate": MessageLookupByLibrary.simpleMessage("Order Date"),
    "orderDetail": MessageLookupByLibrary.simpleMessage("Order Details"),
    "orderHistory": MessageLookupByLibrary.simpleMessage("Order History"),
    "orderId": MessageLookupByLibrary.simpleMessage("Order ID:"),
    "orderNo": MessageLookupByLibrary.simpleMessage("Order No."),
    "orderNotes": MessageLookupByLibrary.simpleMessage("Order Notes"),
    "orderSuccessMsg1": MessageLookupByLibrary.simpleMessage(
      "You can check the status of your order using our delivery status feature. You will receive an order confirmation email with details of your order and a link to track its progress.",
    ),
    "orderSuccessMsg2": MessageLookupByLibrary.simpleMessage(
      "You can log into your account using your email and password. On your account you can edit your profile data, check transaction history, and edit newsletter subscription.",
    ),
    "orderSuccessTitle1": MessageLookupByLibrary.simpleMessage(
      "You\'ve successfully placed your order",
    ),
    "orderSuccessTitle2": MessageLookupByLibrary.simpleMessage("Your Account"),
    "orderSummary": MessageLookupByLibrary.simpleMessage("Order Summary"),
    "orderTotal": MessageLookupByLibrary.simpleMessage("Order Total"),
    "orderTracking": MessageLookupByLibrary.simpleMessage("Order tracking"),
    "originalAddressNotFound": MessageLookupByLibrary.simpleMessage(
      "Original address not found",
    ),
    "otherAddress": MessageLookupByLibrary.simpleMessage("Other Address"),
    "otpVerification": MessageLookupByLibrary.simpleMessage("OTP Verification"),
    "ourBankDetails": MessageLookupByLibrary.simpleMessage("Our bank details"),
    "outOfStock": MessageLookupByLibrary.simpleMessage("Out of Stock"),
    "owner": MessageLookupByLibrary.simpleMessage("Owner"),
    "ownerRoleDescription": MessageLookupByLibrary.simpleMessage(
      "This user role allows to add listings and booking services and manage them. Owners can\'t review other listings.",
    ),
    "paid": MessageLookupByLibrary.simpleMessage("Paid"),
    "paidStatus": MessageLookupByLibrary.simpleMessage("Paid status"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordIsRequired": MessageLookupByLibrary.simpleMessage(
      "The Password field is required",
    ),
    "passwordMustBeAtLeast8Characters": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 8 characters",
    ),
    "passwordTips": MessageLookupByLibrary.simpleMessage("Password tips:"),
    "passwordsDoNotMatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "pasteYourImageUrl": MessageLookupByLibrary.simpleMessage(
      "Paste your image URL",
    ),
    "payByWallet": MessageLookupByLibrary.simpleMessage("Pay by wallet"),
    "payNow": MessageLookupByLibrary.simpleMessage("Pay Now"),
    "payWithAmount": m50,
    "payment": MessageLookupByLibrary.simpleMessage("Payment"),
    "paymentCancelled": MessageLookupByLibrary.simpleMessage(
      "Payment cancelled",
    ),
    "paymentDetailsChangedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Payment details changed successfully.",
    ),
    "paymentDue": m51,
    "paymentMethod": MessageLookupByLibrary.simpleMessage("Payment Method"),
    "paymentMethodIsNotSupported": MessageLookupByLibrary.simpleMessage(
      "This payment method is not supported",
    ),
    "paymentMethods": MessageLookupByLibrary.simpleMessage("Payment Methods"),
    "paymentSettings": MessageLookupByLibrary.simpleMessage("Payment Settings"),
    "paymentSuccessful": MessageLookupByLibrary.simpleMessage(
      "Payment successful",
    ),
    "pending": MessageLookupByLibrary.simpleMessage("Pending"),
    "pendingPayment": MessageLookupByLibrary.simpleMessage("Pending Payment"),
    "pendingReviews": MessageLookupByLibrary.simpleMessage("Pending Reviews"),
    "personalInformation": MessageLookupByLibrary.simpleMessage(
      "Personal Information",
    ),
    "personalInformationSubtitle": MessageLookupByLibrary.simpleMessage(
      "Update name, phone number",
    ),
    "phone": MessageLookupByLibrary.simpleMessage("Phone"),
    "phoneEmpty": MessageLookupByLibrary.simpleMessage("Phone number is empty"),
    "phoneHintFormat": MessageLookupByLibrary.simpleMessage(
      "Format: +84123456789",
    ),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "phoneNumberVerification": MessageLookupByLibrary.simpleMessage(
      "Phone Number Verification",
    ),
    "pickADate": MessageLookupByLibrary.simpleMessage("Pick date & time"),
    "pickVoucherToApply": MessageLookupByLibrary.simpleMessage(
      "Pick a voucher to apply.",
    ),
    "picking": MessageLookupByLibrary.simpleMessage("Picking"),
    "placeMyOrder": MessageLookupByLibrary.simpleMessage("Place Order"),
    "platinum": MessageLookupByLibrary.simpleMessage("Platinum"),
    "platinumPriority": MessageLookupByLibrary.simpleMessage(
      "Platinum Priority",
    ),
    "playAll": MessageLookupByLibrary.simpleMessage("Play All"),
    "pleaseAddAddressFirst": MessageLookupByLibrary.simpleMessage(
      "Please add an address first",
    ),
    "pleaseAddPrice": MessageLookupByLibrary.simpleMessage("Please add price"),
    "pleaseAdjustYourCart": MessageLookupByLibrary.simpleMessage(
      "Please adjust your cart before proceeding to checkout.",
    ),
    "pleaseAgreeTerms": MessageLookupByLibrary.simpleMessage(
      "Please agree to our terms",
    ),
    "pleaseAllowAccessLocation": MessageLookupByLibrary.simpleMessage(
      "Please allow access to the location",
    ),
    "pleaseCheckFollowingIssues": MessageLookupByLibrary.simpleMessage(
      "Please check the following issues:",
    ),
    "pleaseCheckInternet": MessageLookupByLibrary.simpleMessage(
      "Please check your internet connection!",
    ),
    "pleaseChooseBranch": MessageLookupByLibrary.simpleMessage(
      "Please choose a branch",
    ),
    "pleaseChooseCategory": MessageLookupByLibrary.simpleMessage(
      "Please choose category",
    ),
    "pleaseConfirmNewPassword": MessageLookupByLibrary.simpleMessage(
      "Please confirm your new password",
    ),
    "pleaseEnterCurrentPassword": MessageLookupByLibrary.simpleMessage(
      "Please enter your current password",
    ),
    "pleaseEnterFirstName": MessageLookupByLibrary.simpleMessage(
      "Please enter first name",
    ),
    "pleaseEnterLastName": MessageLookupByLibrary.simpleMessage(
      "Please enter last name",
    ),
    "pleaseEnterNewPassword": MessageLookupByLibrary.simpleMessage(
      "Please enter your new password",
    ),
    "pleaseEnterProductName": MessageLookupByLibrary.simpleMessage(
      "Please enter the product name",
    ),
    "pleaseFillCode": MessageLookupByLibrary.simpleMessage(
      "Please enter your code",
    ),
    "pleaseFillUpAllCellsProperly": MessageLookupByLibrary.simpleMessage(
      "Please fill in all cells properly",
    ),
    "pleaseIncreaseOrDecreaseTheQuantity": MessageLookupByLibrary.simpleMessage(
      "Please increase or decrease the quantity to continue.",
    ),
    "pleaseInput": MessageLookupByLibrary.simpleMessage(
      "Please fill in all required fields",
    ),
    "pleaseInputFillAllFields": MessageLookupByLibrary.simpleMessage(
      "Please fill in all fields",
    ),
    "pleaseSelectADate": MessageLookupByLibrary.simpleMessage(
      "Please select a booking date",
    ),
    "pleaseSelectAllAttributes": MessageLookupByLibrary.simpleMessage(
      "Please choose an option for each attribute of the product",
    ),
    "pleaseSelectAttr": MessageLookupByLibrary.simpleMessage(
      "Please select at least 1 option for each active attribute",
    ),
    "pleaseSelectRequiredOptions": MessageLookupByLibrary.simpleMessage(
      "Please select the required options!",
    ),
    "pleaseSignInBeforeUploading": MessageLookupByLibrary.simpleMessage(
      "Please sign in to your account before uploading any files.",
    ),
    "point": MessageLookupByLibrary.simpleMessage("Point"),
    "pointHistory": MessageLookupByLibrary.simpleMessage("Point history"),
    "pointMsgConfigNotFound": MessageLookupByLibrary.simpleMessage(
      "No discount point configuration has been found on the server",
    ),
    "pointMsgEnter": MessageLookupByLibrary.simpleMessage(
      "Please enter discount point",
    ),
    "pointMsgMaximumDiscountPoint": MessageLookupByLibrary.simpleMessage(
      "Maximum discount point",
    ),
    "pointMsgNotEnough": MessageLookupByLibrary.simpleMessage(
      "You don\'t have enough discount points. Your total discount point is",
    ),
    "pointMsgOverMaximumDiscountPoint": MessageLookupByLibrary.simpleMessage(
      "You have reached the maximum discount point",
    ),
    "pointMsgOverTotalBill": MessageLookupByLibrary.simpleMessage(
      "The total discount value exceeds the bill total",
    ),
    "pointMsgRemove": MessageLookupByLibrary.simpleMessage(
      "Discount point removed",
    ),
    "pointMsgSuccess": MessageLookupByLibrary.simpleMessage(
      "Discount point applied successfully",
    ),
    "pointRewardMessage": MessageLookupByLibrary.simpleMessage(
      "There is a Discount Rule for applying your points to Cart",
    ),
    "points": MessageLookupByLibrary.simpleMessage("Points"),
    "pointsAddedMsg": MessageLookupByLibrary.simpleMessage(
      "Points have been added to the user’s account.",
    ),
    "pointsAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Points added successfully",
    ),
    "pointsRedeemedMsg": MessageLookupByLibrary.simpleMessage(
      "Points have been redeemed from the user’s account.",
    ),
    "pointsRedeemedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Points redeemed successfully",
    ),
    "poor": MessageLookupByLibrary.simpleMessage("Poor"),
    "popular": MessageLookupByLibrary.simpleMessage("Popular"),
    "popularity": MessageLookupByLibrary.simpleMessage("Popularity"),
    "postFail": MessageLookupByLibrary.simpleMessage(
      "Your post could not be created",
    ),
    "postManagement": MessageLookupByLibrary.simpleMessage("Post Management"),
    "postProduct": MessageLookupByLibrary.simpleMessage("Post Product"),
    "postSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Your post has been created successfully",
    ),
    "prepaid": MessageLookupByLibrary.simpleMessage("Prepaid"),
    "pressBackButtonAgainToExit": MessageLookupByLibrary.simpleMessage(
      "Press again to exit",
    ),
    "prev": MessageLookupByLibrary.simpleMessage("Previous"),
    "preview": MessageLookupByLibrary.simpleMessage("Preview"),
    "price": MessageLookupByLibrary.simpleMessage("Price"),
    "priceHighToLow": MessageLookupByLibrary.simpleMessage(
      "Price: High to Low",
    ),
    "priceLowToHigh": MessageLookupByLibrary.simpleMessage(
      "Price: Low to High",
    ),
    "prices": MessageLookupByLibrary.simpleMessage("Prices"),
    "privacyAndTerm": MessageLookupByLibrary.simpleMessage("Privacy and Terms"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "privacyTerms": MessageLookupByLibrary.simpleMessage("Privacy & Terms"),
    "private": MessageLookupByLibrary.simpleMessage("Private"),
    "processed": MessageLookupByLibrary.simpleMessage("Processed"),
    "processing": MessageLookupByLibrary.simpleMessage("Processing"),
    "product": MessageLookupByLibrary.simpleMessage("Product"),
    "productAddToCart": m52,
    "productCreateReview": MessageLookupByLibrary.simpleMessage(
      "Your product will appear after review.",
    ),
    "productExpired": MessageLookupByLibrary.simpleMessage(
      "Sorry, this product cannot be accessed as it has expired.",
    ),
    "productName": MessageLookupByLibrary.simpleMessage("Product Name"),
    "productNameCanNotEmpty": MessageLookupByLibrary.simpleMessage(
      "Product name cannot be empty",
    ),
    "productNeedAtLeastOneVariation": MessageLookupByLibrary.simpleMessage(
      "Product type variable needs at least one variant",
    ),
    "productNeedNameAndPrice": MessageLookupByLibrary.simpleMessage(
      "Product type simple needs the name and regular price",
    ),
    "productNotFound": MessageLookupByLibrary.simpleMessage(
      "Product not found",
    ),
    "productNotReadyForReorder": MessageLookupByLibrary.simpleMessage(
      "Product not ready for reorder",
    ),
    "productOutOfStock": MessageLookupByLibrary.simpleMessage(
      "This product is out of stock",
    ),
    "productOverview": MessageLookupByLibrary.simpleMessage("Product Overview"),
    "productReview": MessageLookupByLibrary.simpleMessage("Product Review"),
    "productType": MessageLookupByLibrary.simpleMessage("Product Type"),
    "productVariationsNotAvailable": MessageLookupByLibrary.simpleMessage(
      "Product variations not available",
    ),
    "products": MessageLookupByLibrary.simpleMessage("Products"),
    "promptPayID": MessageLookupByLibrary.simpleMessage("PromptPay ID:"),
    "promptPayName": MessageLookupByLibrary.simpleMessage("PromptPay Name:"),
    "promptPayType": MessageLookupByLibrary.simpleMessage("PromptPay Type:"),
    "publish": MessageLookupByLibrary.simpleMessage("Publish"),
    "pullToLoadMore": MessageLookupByLibrary.simpleMessage("Pull to load more"),
    "pullToRefresh": MessageLookupByLibrary.simpleMessage("Pull to refresh"),
    "pullUpLoad": MessageLookupByLibrary.simpleMessage("Pull up to load more"),
    "qRCodeMsgSuccess": MessageLookupByLibrary.simpleMessage(
      "QR code has been saved successfully.",
    ),
    "qRCodeSaveFailure": MessageLookupByLibrary.simpleMessage(
      "Failed to Save QR Code",
    ),
    "qty": MessageLookupByLibrary.simpleMessage("Qty"),
    "qtyTotal": m53,
    "quantity": MessageLookupByLibrary.simpleMessage("Quantity"),
    "quantityMustBeGreaterThanZero": MessageLookupByLibrary.simpleMessage(
      "Quantity must be greater than zero",
    ),
    "quantityProductExceedInStock": MessageLookupByLibrary.simpleMessage(
      "The current quantity is more than the quantity in stock",
    ),
    "random": MessageLookupByLibrary.simpleMessage("Random"),
    "rankDetails": MessageLookupByLibrary.simpleMessage("Rank details"),
    "rankDetailsMsg": MessageLookupByLibrary.simpleMessage(
      "You are currently a member of this rank",
    ),
    "rate": MessageLookupByLibrary.simpleMessage("Rate"),
    "rateProduct": MessageLookupByLibrary.simpleMessage("Rate Product"),
    "rateTheApp": MessageLookupByLibrary.simpleMessage("Rate the App"),
    "rateThisApp": MessageLookupByLibrary.simpleMessage("Rate this app"),
    "rateThisAppDescription": MessageLookupByLibrary.simpleMessage(
      "If you like this app, please take a moment to review it!\nIt really helps us and shouldn\'t take more than a minute.",
    ),
    "rating": MessageLookupByLibrary.simpleMessage("Rating"),
    "ratingFirst": MessageLookupByLibrary.simpleMessage(
      "Please rate before you send your comment",
    ),
    "reOrder": MessageLookupByLibrary.simpleMessage("Re-order"),
    "readyToPick": MessageLookupByLibrary.simpleMessage("Ready to pick"),
    "received": MessageLookupByLibrary.simpleMessage("Received"),
    "receivedMoney": MessageLookupByLibrary.simpleMessage("Received money"),
    "receivedMoneyFrom": m54,
    "receiver": MessageLookupByLibrary.simpleMessage("Receiver"),
    "recent": MessageLookupByLibrary.simpleMessage("Recent"),
    "recentSearches": MessageLookupByLibrary.simpleMessage("Recent Searches"),
    "recentView": MessageLookupByLibrary.simpleMessage("Your Recent Views"),
    "recentlyViewed": MessageLookupByLibrary.simpleMessage("Recently Viewed"),
    "recommended": MessageLookupByLibrary.simpleMessage("Recommended"),
    "recurringTotals": MessageLookupByLibrary.simpleMessage("Recurring Totals"),
    "redeem": MessageLookupByLibrary.simpleMessage("redeem"),
    "redeemPoints": MessageLookupByLibrary.simpleMessage("Redeem points"),
    "redeemRewards": MessageLookupByLibrary.simpleMessage("Redeem rewards"),
    "redeemed": MessageLookupByLibrary.simpleMessage("Redeemed"),
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "refreshCompleted": MessageLookupByLibrary.simpleMessage(
      "Refresh completed",
    ),
    "refreshing": MessageLookupByLibrary.simpleMessage("Refreshing..."),
    "refund": MessageLookupByLibrary.simpleMessage("Refund"),
    "refundOrderFailed": MessageLookupByLibrary.simpleMessage(
      "The refund request was unsuccessful",
    ),
    "refundOrderSuccess": MessageLookupByLibrary.simpleMessage(
      "Your refund request has been submitted successfully!",
    ),
    "refundRequest": MessageLookupByLibrary.simpleMessage("Refund Request"),
    "refundRequested": MessageLookupByLibrary.simpleMessage("Refund Requested"),
    "refunded": MessageLookupByLibrary.simpleMessage("Refunded"),
    "refunds": MessageLookupByLibrary.simpleMessage("refunds"),
    "regions": MessageLookupByLibrary.simpleMessage("Regions"),
    "registerAs": MessageLookupByLibrary.simpleMessage("Register as"),
    "registerAsVendor": MessageLookupByLibrary.simpleMessage(
      "Register as Vendor",
    ),
    "registerErrorSyncAccount": MessageLookupByLibrary.simpleMessage(
      "Unable to sync account with server",
    ),
    "registerFailed": MessageLookupByLibrary.simpleMessage(
      "Registration failed",
    ),
    "registerInvalid": MessageLookupByLibrary.simpleMessage(
      "The registration is invalid",
    ),
    "registerSuccess": MessageLookupByLibrary.simpleMessage(
      "Registration successful",
    ),
    "regularPrice": MessageLookupByLibrary.simpleMessage("Regular Price"),
    "relatedLayoutTitle": MessageLookupByLibrary.simpleMessage(
      "Things You Might Love",
    ),
    "releaseToLoadMore": MessageLookupByLibrary.simpleMessage(
      "Release to load more",
    ),
    "releaseToRefresh": MessageLookupByLibrary.simpleMessage(
      "Release to refresh",
    ),
    "relevance": MessageLookupByLibrary.simpleMessage("Relevance"),
    "remainingAmountCod": MessageLookupByLibrary.simpleMessage(
      "Remaining amount to pay upon delivery",
    ),
    "remove": MessageLookupByLibrary.simpleMessage("Remove"),
    "removeFromWishList": MessageLookupByLibrary.simpleMessage(
      "Remove from Wishlist",
    ),
    "removeWishlist": MessageLookupByLibrary.simpleMessage(
      "Remove from Wishlist",
    ),
    "removeWishlistContent": m55,
    "rental": MessageLookupByLibrary.simpleMessage("Rental"),
    "rentalDates": MessageLookupByLibrary.simpleMessage("Rental dates"),
    "rentalsCategories": MessageLookupByLibrary.simpleMessage(
      "Rentals Categories",
    ),
    "requestBooking": MessageLookupByLibrary.simpleMessage("Request Booking"),
    "requestTooMany": MessageLookupByLibrary.simpleMessage(
      "You have requested too many codes in a short time. Please try again later.",
    ),
    "resend": MessageLookupByLibrary.simpleMessage("Resend"),
    "reservePrice": MessageLookupByLibrary.simpleMessage("Reserve price"),
    "reservePriceHasBeenMet": MessageLookupByLibrary.simpleMessage(
      "Reserve price has been met",
    ),
    "reservePriceHasNotBeenMet": MessageLookupByLibrary.simpleMessage(
      "Reserve price has not been met",
    ),
    "reset": MessageLookupByLibrary.simpleMessage("Reset"),
    "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
    "resetYourPassword": MessageLookupByLibrary.simpleMessage(
      "Reset Your Password",
    ),
    "results": MessageLookupByLibrary.simpleMessage("Results"),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "reverse": MessageLookupByLibrary.simpleMessage("Reverse"),
    "reversed": MessageLookupByLibrary.simpleMessage("Reversed"),
    "review": MessageLookupByLibrary.simpleMessage("Review"),
    "reviewApproval": MessageLookupByLibrary.simpleMessage("Review Approval"),
    "reviewPendingApproval": MessageLookupByLibrary.simpleMessage(
      "Your review has been submitted and is awaiting approval!",
    ),
    "reviewSent": MessageLookupByLibrary.simpleMessage(
      "Your review has been submitted!",
    ),
    "reviews": MessageLookupByLibrary.simpleMessage("Reviews"),
    "rewards": MessageLookupByLibrary.simpleMessage("Rewards"),
    "sale": m56,
    "salePrice": MessageLookupByLibrary.simpleMessage("Sale Price"),
    "saturday": MessageLookupByLibrary.simpleMessage("Saturday"),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "saveAddress": MessageLookupByLibrary.simpleMessage("Save Address"),
    "saveAddressSuccess": MessageLookupByLibrary.simpleMessage(
      "Address saved successfully",
    ),
    "saveForLater": MessageLookupByLibrary.simpleMessage("Save For Later"),
    "saveQRCode": MessageLookupByLibrary.simpleMessage("Save QR Code"),
    "saveToWishList": MessageLookupByLibrary.simpleMessage("Save to Wishlist"),
    "savedAddresses": MessageLookupByLibrary.simpleMessage("Saved Addresses"),
    "savedToGallery": MessageLookupByLibrary.simpleMessage("Saved to gallery"),
    "scanPoints": MessageLookupByLibrary.simpleMessage("Scan Points"),
    "scanQRCode": MessageLookupByLibrary.simpleMessage("Scan QR Code"),
    "scannerCannotScan": MessageLookupByLibrary.simpleMessage(
      "This item cannot be scanned",
    ),
    "scannerLoginFirst": MessageLookupByLibrary.simpleMessage(
      "To scan an order, you need to log in first",
    ),
    "scannerOnlyForProduct": MessageLookupByLibrary.simpleMessage(
      "QR Scanner only supports product search",
    ),
    "scannerOrderAvailable": MessageLookupByLibrary.simpleMessage(
      "This order is not available for your account",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "searchByCountryNameOrDialCode": MessageLookupByLibrary.simpleMessage(
      "Search by country name or dial code",
    ),
    "searchByName": MessageLookupByLibrary.simpleMessage("Search with Name..."),
    "searchCountries": MessageLookupByLibrary.simpleMessage(
      "Search countries...",
    ),
    "searchEmptyDataMessage": MessageLookupByLibrary.simpleMessage(
      "Oops! No results match your search criteria",
    ),
    "searchForItems": MessageLookupByLibrary.simpleMessage("Search for items"),
    "searchOrderId": MessageLookupByLibrary.simpleMessage(
      "Search with Order ID...",
    ),
    "searchPlace": MessageLookupByLibrary.simpleMessage("Search Place"),
    "searchResultItem": m57,
    "searchResultItems": m58,
    "searchingAddress": MessageLookupByLibrary.simpleMessage("Search Address"),
    "seeAll": MessageLookupByLibrary.simpleMessage("See All"),
    "seeNewAppConfig": MessageLookupByLibrary.simpleMessage(
      "Continue to see new content on your app.",
    ),
    "seeOrder": MessageLookupByLibrary.simpleMessage("See Order"),
    "seeReviews": MessageLookupByLibrary.simpleMessage("See reviews"),
    "select": MessageLookupByLibrary.simpleMessage("Select"),
    "selectAddress": MessageLookupByLibrary.simpleMessage("Select Address"),
    "selectAll": MessageLookupByLibrary.simpleMessage("Select all"),
    "selectDate": MessageLookupByLibrary.simpleMessage("Select date"),
    "selectDates": MessageLookupByLibrary.simpleMessage("Select dates"),
    "selectFileCancelled": MessageLookupByLibrary.simpleMessage(
      "File selection cancelled!",
    ),
    "selectImage": MessageLookupByLibrary.simpleMessage("Select Image"),
    "selectItem": MessageLookupByLibrary.simpleMessage("Select item"),
    "selectNone": MessageLookupByLibrary.simpleMessage("Select none"),
    "selectRole": MessageLookupByLibrary.simpleMessage("Select Role"),
    "selectStore": MessageLookupByLibrary.simpleMessage("Select Store"),
    "selectTheColor": MessageLookupByLibrary.simpleMessage("Select color"),
    "selectTheFile": MessageLookupByLibrary.simpleMessage("Select file"),
    "selectTheQuantity": MessageLookupByLibrary.simpleMessage(
      "Select quantity",
    ),
    "selectTheSize": MessageLookupByLibrary.simpleMessage("Select size"),
    "selectType": MessageLookupByLibrary.simpleMessage("Select Type"),
    "selectVoucher": MessageLookupByLibrary.simpleMessage("Select Voucher"),
    "send": MessageLookupByLibrary.simpleMessage("Send"),
    "sendBack": MessageLookupByLibrary.simpleMessage("Send back"),
    "sendOrderViaWhatsApp": MessageLookupByLibrary.simpleMessage(
      "Send order via WhatsApp",
    ),
    "sendOrderViaWhatsAppMsg": MessageLookupByLibrary.simpleMessage(
      "Your order is received in the system and you can send the same order via WhatsApp.",
    ),
    "sendSMSCode": MessageLookupByLibrary.simpleMessage("Get Code"),
    "sendSMStoVendor": MessageLookupByLibrary.simpleMessage(
      "Send SMS to Store Owner",
    ),
    "sendTo": MessageLookupByLibrary.simpleMessage(
      "The account you want to transfer to (email)",
    ),
    "separateMultipleEmailWithComma": MessageLookupByLibrary.simpleMessage(
      "Separate multiple email addresses with a comma.",
    ),
    "service": MessageLookupByLibrary.simpleMessage("Service"),
    "serviceCategories": MessageLookupByLibrary.simpleMessage(
      "Service Categories",
    ),
    "sessionExpired": MessageLookupByLibrary.simpleMessage(
      "Your session has expired. Please login again to continue.",
    ),
    "setAsDefault": MessageLookupByLibrary.simpleMessage("Set as Default"),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "setup": MessageLookupByLibrary.simpleMessage("Set up"),
    "share": MessageLookupByLibrary.simpleMessage("Share"),
    "shareProductData": MessageLookupByLibrary.simpleMessage(
      "Share Product Data",
    ),
    "shareProductLink": MessageLookupByLibrary.simpleMessage(
      "Share Product Link",
    ),
    "shipped": MessageLookupByLibrary.simpleMessage("Shipped"),
    "shipping": MessageLookupByLibrary.simpleMessage("Shipping"),
    "shippingAddress": MessageLookupByLibrary.simpleMessage("Shipping Address"),
    "shippingFee": MessageLookupByLibrary.simpleMessage("Shipping Fee"),
    "shippingMethod": MessageLookupByLibrary.simpleMessage("Shipping Method"),
    "shop": MessageLookupByLibrary.simpleMessage("Shop"),
    "shopEmail": MessageLookupByLibrary.simpleMessage("Shop email"),
    "shopName": MessageLookupByLibrary.simpleMessage("Shop name"),
    "shopOrders": MessageLookupByLibrary.simpleMessage("Shop Orders"),
    "shopPhone": MessageLookupByLibrary.simpleMessage("Shop phone"),
    "shopSlug": MessageLookupByLibrary.simpleMessage("Shop slug"),
    "shopifyAccountManagement": MessageLookupByLibrary.simpleMessage(
      "Shopify Account Management",
    ),
    "shopifyMember": MessageLookupByLibrary.simpleMessage("Shopify Member"),
    "shoppingCartItems": m59,
    "shortDescription": MessageLookupByLibrary.simpleMessage(
      "Short Description",
    ),
    "shouldContainNumbersSpecialChars": MessageLookupByLibrary.simpleMessage(
      "• Should contain numbers and special characters",
    ),
    "shouldContainUpperLowercase": MessageLookupByLibrary.simpleMessage(
      "• Should contain uppercase and lowercase letters",
    ),
    "showAllMyOrdered": MessageLookupByLibrary.simpleMessage(
      "Show All My Orders",
    ),
    "showDetails": MessageLookupByLibrary.simpleMessage("Show Details"),
    "showGallery": MessageLookupByLibrary.simpleMessage("Show Gallery"),
    "showLess": MessageLookupByLibrary.simpleMessage("Show Less"),
    "showMore": MessageLookupByLibrary.simpleMessage("Show More"),
    "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
    "signInWithEmail": MessageLookupByLibrary.simpleMessage(
      "Sign in with email",
    ),
    "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "signup": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "silver": MessageLookupByLibrary.simpleMessage("Silver"),
    "silverPriority": MessageLookupByLibrary.simpleMessage("Silver Priority"),
    "simple": MessageLookupByLibrary.simpleMessage("Simple"),
    "simpleList": MessageLookupByLibrary.simpleMessage("Simple List"),
    "size": MessageLookupByLibrary.simpleMessage("Size"),
    "sizeGuide": MessageLookupByLibrary.simpleMessage("Size Guide"),
    "skip": MessageLookupByLibrary.simpleMessage("Skip"),
    "sku": MessageLookupByLibrary.simpleMessage("SKU"),
    "smsCodeExpired": MessageLookupByLibrary.simpleMessage(
      "The SMS code has expired. Please resend the verification code to try again.",
    ),
    "sold": m60,
    "soldBy": MessageLookupByLibrary.simpleMessage("Sold by"),
    "somethingWrong": MessageLookupByLibrary.simpleMessage(
      "Something went wrong. Please try again later.",
    ),
    "sortBy": MessageLookupByLibrary.simpleMessage("Sort by"),
    "sortCode": MessageLookupByLibrary.simpleMessage("Sort Code"),
    "speechNotAvailable": MessageLookupByLibrary.simpleMessage(
      "Speech not available",
    ),
    "spendAtLeast": MessageLookupByLibrary.simpleMessage("Spend At Least"),
    "startChat": MessageLookupByLibrary.simpleMessage("Start Chat"),
    "startExploring": MessageLookupByLibrary.simpleMessage("Start Exploring"),
    "startPrice": MessageLookupByLibrary.simpleMessage("Start Price"),
    "startShopping": MessageLookupByLibrary.simpleMessage("Start Shopping"),
    "startingBid": MessageLookupByLibrary.simpleMessage("Starting bid"),
    "startsFrom": m61,
    "stateProvince": MessageLookupByLibrary.simpleMessage("State/Province"),
    "status": MessageLookupByLibrary.simpleMessage("Status"),
    "stock": MessageLookupByLibrary.simpleMessage("Stock"),
    "stockQuantity": MessageLookupByLibrary.simpleMessage("Stock Quantity"),
    "stop": MessageLookupByLibrary.simpleMessage("Stop"),
    "store": MessageLookupByLibrary.simpleMessage("Store"),
    "storeAddress": MessageLookupByLibrary.simpleMessage("Shop Address"),
    "storeBrand": MessageLookupByLibrary.simpleMessage("Store Brand"),
    "storeClosed": MessageLookupByLibrary.simpleMessage(
      "The store is closed now",
    ),
    "storeEmail": MessageLookupByLibrary.simpleMessage("Shop Email"),
    "storeInformation": MessageLookupByLibrary.simpleMessage(
      "Store Information",
    ),
    "storeListBanner": MessageLookupByLibrary.simpleMessage(
      "Store List Banner",
    ),
    "storeLocation": MessageLookupByLibrary.simpleMessage("Store Location"),
    "storeLocatorSearchPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Enter address / city",
    ),
    "storeLogo": MessageLookupByLibrary.simpleMessage("Store Logo"),
    "storeMobileBanner": MessageLookupByLibrary.simpleMessage(
      "Store Mobile Banner",
    ),
    "storeSettings": MessageLookupByLibrary.simpleMessage("Store Settings"),
    "storeSliderBanner": MessageLookupByLibrary.simpleMessage(
      "Store Slider Banner",
    ),
    "storeStaticBanner": MessageLookupByLibrary.simpleMessage(
      "Store Static Banner",
    ),
    "storeVacation": MessageLookupByLibrary.simpleMessage("Store vacation"),
    "stores": MessageLookupByLibrary.simpleMessage("Stores"),
    "street": MessageLookupByLibrary.simpleMessage("Street"),
    "street2": MessageLookupByLibrary.simpleMessage("Street 2"),
    "streetName": MessageLookupByLibrary.simpleMessage("Street Name"),
    "streetNameApartment": MessageLookupByLibrary.simpleMessage("Apartment"),
    "streetNameBlock": MessageLookupByLibrary.simpleMessage("Block"),
    "subTitleOrderConfirmed": MessageLookupByLibrary.simpleMessage(
      "Thanks for your order. We\'re quickly processing it and will send you a confirmation email shortly.",
    ),
    "submit": MessageLookupByLibrary.simpleMessage("Submit"),
    "subtotal": MessageLookupByLibrary.simpleMessage("Subtotal"),
    "successful": MessageLookupByLibrary.simpleMessage("Successful"),
    "sunday": MessageLookupByLibrary.simpleMessage("Sunday"),
    "support": MessageLookupByLibrary.simpleMessage("Support"),
    "tag": MessageLookupByLibrary.simpleMessage("Tag"),
    "tagNotExist": MessageLookupByLibrary.simpleMessage(
      "This tag does not exist",
    ),
    "tags": MessageLookupByLibrary.simpleMessage("Tags"),
    "takePicture": MessageLookupByLibrary.simpleMessage("Take Picture"),
    "tapSelectLocation": MessageLookupByLibrary.simpleMessage(
      "Tap to select this location",
    ),
    "tapTheMicToTalk": MessageLookupByLibrary.simpleMessage(
      "Tap the mic to talk",
    ),
    "tax": MessageLookupByLibrary.simpleMessage("Tax"),
    "teraWallet": MessageLookupByLibrary.simpleMessage("TeraWallet"),
    "terrible": MessageLookupByLibrary.simpleMessage("Terrible"),
    "theFieldIsRequired": m62,
    "thisDateIsNotAvailable": MessageLookupByLibrary.simpleMessage(
      "This date is not available",
    ),
    "thisIsCustomerRole": MessageLookupByLibrary.simpleMessage(
      "This is customer role",
    ),
    "thisIsDeliveryrRole": MessageLookupByLibrary.simpleMessage(
      "This is delivery role",
    ),
    "thisIsSealedBidAuction": MessageLookupByLibrary.simpleMessage(
      "This is sealed bid auction.",
    ),
    "thisIsVendorRole": MessageLookupByLibrary.simpleMessage(
      "This is vendor role",
    ),
    "thisItemIsSold": MessageLookupByLibrary.simpleMessage("This item is sold"),
    "thursday": MessageLookupByLibrary.simpleMessage("Thursday"),
    "tickets": MessageLookupByLibrary.simpleMessage("Tickets"),
    "time": MessageLookupByLibrary.simpleMessage("Time"),
    "timeLeft": MessageLookupByLibrary.simpleMessage("Time left"),
    "tips": MessageLookupByLibrary.simpleMessage("Tips:"),
    "title": MessageLookupByLibrary.simpleMessage("Title"),
    "titleAToZ": MessageLookupByLibrary.simpleMessage("Title: A to Z"),
    "titleFirst": MessageLookupByLibrary.simpleMessage("Please add the title"),
    "titleZToA": MessageLookupByLibrary.simpleMessage("Title: Z to A"),
    "to": MessageLookupByLibrary.simpleMessage("To"),
    "toRate": MessageLookupByLibrary.simpleMessage("To Rate"),
    "tooManyFailedLogin": MessageLookupByLibrary.simpleMessage(
      "Too many failed login attempts. Please try again later.",
    ),
    "topBrands": MessageLookupByLibrary.simpleMessage("Top Brands"),
    "topUp": MessageLookupByLibrary.simpleMessage("Top Up"),
    "total": MessageLookupByLibrary.simpleMessage("Total"),
    "totalAmount": MessageLookupByLibrary.simpleMessage("Total amount"),
    "totalCartValue": MessageLookupByLibrary.simpleMessage(
      "Total order value must be at least",
    ),
    "totalCost": MessageLookupByLibrary.simpleMessage("Total cost"),
    "totalPoints": MessageLookupByLibrary.simpleMessage("Total points"),
    "totalPrice": MessageLookupByLibrary.simpleMessage("Total Price"),
    "totalProducts": m63,
    "totalTax": MessageLookupByLibrary.simpleMessage("Total Tax"),
    "trackingNumberIs": MessageLookupByLibrary.simpleMessage(
      "Tracking number is",
    ),
    "trackingPage": MessageLookupByLibrary.simpleMessage("Tracking Page"),
    "transactionCancelled": MessageLookupByLibrary.simpleMessage(
      "Transaction cancelled",
    ),
    "transactionDetail": MessageLookupByLibrary.simpleMessage(
      "Transaction detail",
    ),
    "transactionFailed": MessageLookupByLibrary.simpleMessage(
      "Transaction failed",
    ),
    "transactionFee": MessageLookupByLibrary.simpleMessage("Transaction fee"),
    "transactionResult": MessageLookupByLibrary.simpleMessage(
      "Transaction Result",
    ),
    "transfer": MessageLookupByLibrary.simpleMessage("Transfer"),
    "transferConfirm": MessageLookupByLibrary.simpleMessage(
      "Transfer Confirmation",
    ),
    "transferErrorMessage": MessageLookupByLibrary.simpleMessage(
      "You can\'t transfer to this user",
    ),
    "transferFailed": MessageLookupByLibrary.simpleMessage("Transfer failed!"),
    "transferMoneyTo": m64,
    "transferSuccess": MessageLookupByLibrary.simpleMessage(
      "Transfer successful",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Try again"),
    "tuesday": MessageLookupByLibrary.simpleMessage("Tuesday"),
    "typeAMessage": MessageLookupByLibrary.simpleMessage("Type a message..."),
    "types": MessageLookupByLibrary.simpleMessage("Types"),
    "typing": MessageLookupByLibrary.simpleMessage("Typing..."),
    "unavailable": MessageLookupByLibrary.simpleMessage("Unavailable"),
    "unblock": MessageLookupByLibrary.simpleMessage("Unblock"),
    "unblockUser": MessageLookupByLibrary.simpleMessage("Unblock user"),
    "undefined": MessageLookupByLibrary.simpleMessage("Undefined"),
    "undo": MessageLookupByLibrary.simpleMessage("Undo"),
    "unexpectedError": MessageLookupByLibrary.simpleMessage(
      "An unexpected error occurred. Please try again.",
    ),
    "unknown": MessageLookupByLibrary.simpleMessage("Unknown"),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "Something went wrong, unknown error has been appear",
    ),
    "unnamedLocation": MessageLookupByLibrary.simpleMessage("Unnamed location"),
    "unpaid": MessageLookupByLibrary.simpleMessage("Unpaid"),
    "upRankNote1": MessageLookupByLibrary.simpleMessage("Earn more"),
    "upRankNote2": MessageLookupByLibrary.simpleMessage(
      "points to move up this rank.",
    ),
    "upTo": m65,
    "update": MessageLookupByLibrary.simpleMessage("Update"),
    "updateAddress": MessageLookupByLibrary.simpleMessage("Update Address"),
    "updateFailed": MessageLookupByLibrary.simpleMessage("Update failed!"),
    "updateInfo": MessageLookupByLibrary.simpleMessage("Update Info"),
    "updateInformation": MessageLookupByLibrary.simpleMessage(
      "Update Information",
    ),
    "updateInformationSuccess": MessageLookupByLibrary.simpleMessage(
      "Information updated successfully",
    ),
    "updateStatus": MessageLookupByLibrary.simpleMessage("Update Status"),
    "updateSuccess": MessageLookupByLibrary.simpleMessage("Update successful!"),
    "updateUserFailed": MessageLookupByLibrary.simpleMessage(
      "Update user failed",
    ),
    "updateUserInfor": MessageLookupByLibrary.simpleMessage("Update Profile"),
    "updateYourAddressInformation": MessageLookupByLibrary.simpleMessage(
      "Update your address information",
    ),
    "uploadFile": MessageLookupByLibrary.simpleMessage("Upload file"),
    "uploadImage": MessageLookupByLibrary.simpleMessage("Upload image"),
    "uploadProduct": MessageLookupByLibrary.simpleMessage("Upload Product"),
    "uploading": MessageLookupByLibrary.simpleMessage("Uploading"),
    "useAmountPoints": m66,
    "useMaximumPointDiscount": m67,
    "useNow": MessageLookupByLibrary.simpleMessage("Use Now"),
    "usePoint": MessageLookupByLibrary.simpleMessage("Use Point"),
    "useThisImage": MessageLookupByLibrary.simpleMessage("Use this Image"),
    "used": MessageLookupByLibrary.simpleMessage("Used"),
    "user": MessageLookupByLibrary.simpleMessage("User"),
    "userExists": MessageLookupByLibrary.simpleMessage(
      "This username/email is not available.",
    ),
    "userHasBeenBlocked": MessageLookupByLibrary.simpleMessage(
      "User has been blocked",
    ),
    "userNameInCorrect": MessageLookupByLibrary.simpleMessage(
      "The username or password is incorrect.",
    ),
    "userNotFound": MessageLookupByLibrary.simpleMessage(
      "The user is not found",
    ),
    "username": MessageLookupByLibrary.simpleMessage("Username"),
    "usernameAlreadyInUse": MessageLookupByLibrary.simpleMessage(
      "Username already in use!",
    ),
    "usernameAndPasswordRequired": MessageLookupByLibrary.simpleMessage(
      "Username and password are required",
    ),
    "usernameInvalid": MessageLookupByLibrary.simpleMessage(
      "Username is invalid",
    ),
    "usernameIsRequired": MessageLookupByLibrary.simpleMessage(
      "Username is required",
    ),
    "vacationMessage": MessageLookupByLibrary.simpleMessage("Vacation Message"),
    "vacationType": MessageLookupByLibrary.simpleMessage("Vacation type"),
    "validUntil": m68,
    "validUntilDate": m69,
    "validationError": MessageLookupByLibrary.simpleMessage("Validation Error"),
    "validationTips": MessageLookupByLibrary.simpleMessage(
      "• Use 2-letter state codes (CA, NY, TX)\n• Use 2-letter country codes (US, CA, GB)\n• Check ZIP/postal code format\n• Ensure all required fields are filled",
    ),
    "variable": MessageLookupByLibrary.simpleMessage("Variable"),
    "variation": MessageLookupByLibrary.simpleMessage("Variation"),
    "vendor": MessageLookupByLibrary.simpleMessage("Vendor"),
    "vendorAdmin": MessageLookupByLibrary.simpleMessage("Vendor Admin"),
    "verificationCode": MessageLookupByLibrary.simpleMessage(
      "Verification code (6 digits)",
    ),
    "verifySMSCode": MessageLookupByLibrary.simpleMessage("Verify"),
    "version": m70,
    "viaWallet": MessageLookupByLibrary.simpleMessage("Via wallet"),
    "video": MessageLookupByLibrary.simpleMessage("Video"),
    "view": MessageLookupByLibrary.simpleMessage("View"),
    "viewAll": MessageLookupByLibrary.simpleMessage("View all"),
    "viewCart": MessageLookupByLibrary.simpleMessage("View cart"),
    "viewDetail": MessageLookupByLibrary.simpleMessage("View detail"),
    "viewMore": MessageLookupByLibrary.simpleMessage("View More"),
    "viewOnGoogleMaps": MessageLookupByLibrary.simpleMessage(
      "View on Google Maps",
    ),
    "viewOrder": MessageLookupByLibrary.simpleMessage("View Order"),
    "viewPointHistory": MessageLookupByLibrary.simpleMessage(
      "View point history",
    ),
    "viewRecentTransactions": MessageLookupByLibrary.simpleMessage(
      "View recent transactions",
    ),
    "visible": MessageLookupByLibrary.simpleMessage("Visible"),
    "visitStore": MessageLookupByLibrary.simpleMessage("Visit Store"),
    "voided": MessageLookupByLibrary.simpleMessage("Voided"),
    "waitForLoad": MessageLookupByLibrary.simpleMessage(
      "Waiting for image to load",
    ),
    "waitForPost": MessageLookupByLibrary.simpleMessage(
      "Waiting for product to post",
    ),
    "waiting": MessageLookupByLibrary.simpleMessage("Waiting"),
    "waitingForConfirmation": MessageLookupByLibrary.simpleMessage(
      "Waiting for confirmation",
    ),
    "waitingOwnerConfirmation": MessageLookupByLibrary.simpleMessage(
      "Waiting for owner confirmation",
    ),
    "walletBalance": MessageLookupByLibrary.simpleMessage("Wallet balance"),
    "walletBalanceWithValue": m71,
    "walletName": MessageLookupByLibrary.simpleMessage("Wallet name"),
    "warning": m72,
    "warningCurrencyMessageForWallet": m73,
    "weFoundBlogs": MessageLookupByLibrary.simpleMessage("We Found Blog(s)"),
    "weNeedCameraAccessTo": MessageLookupByLibrary.simpleMessage(
      "We need camera access to scan for QR code or Bar code.",
    ),
    "weSentAnOTPTo": MessageLookupByLibrary.simpleMessage(
      "An authentication code has been sent to",
    ),
    "weWillSendYouNotification": MessageLookupByLibrary.simpleMessage(
      "We will send you notifications when new products are available or offers are available. You can always turn it off in the settings.",
    ),
    "webView": MessageLookupByLibrary.simpleMessage("Web View"),
    "website": MessageLookupByLibrary.simpleMessage("Website"),
    "wednesday": MessageLookupByLibrary.simpleMessage("Wednesday"),
    "week": m74,
    "welcome": MessageLookupByLibrary.simpleMessage("Welcome"),
    "welcomeBack": MessageLookupByLibrary.simpleMessage("Welcome back"),
    "welcomeRegister": MessageLookupByLibrary.simpleMessage(
      "Start your shopping journey with us now",
    ),
    "welcomeUser": m75,
    "whichLanguageDoYouPrefer": MessageLookupByLibrary.simpleMessage(
      "Which language do you prefer?",
    ),
    "wholesaleRegisterMsg": MessageLookupByLibrary.simpleMessage(
      "Please contact the administrator to approve your registration.",
    ),
    "willNotSendAndReceiveMessage": MessageLookupByLibrary.simpleMessage(
      "You won\'t be able to send and receive messages from this user.",
    ),
    "winningBid": MessageLookupByLibrary.simpleMessage("Winning Bid"),
    "withdrawAmount": MessageLookupByLibrary.simpleMessage("Withdraw Amount"),
    "withdrawRequest": MessageLookupByLibrary.simpleMessage("Withdraw Request"),
    "withdrawal": MessageLookupByLibrary.simpleMessage("Withdrawal"),
    "writeComment": MessageLookupByLibrary.simpleMessage("Write your comment"),
    "writeTitle": MessageLookupByLibrary.simpleMessage("Write your title"),
    "writeTitleOptional": MessageLookupByLibrary.simpleMessage(
      "Write your title (Optional)",
    ),
    "writeYourNote": MessageLookupByLibrary.simpleMessage("Write your note"),
    "yes": MessageLookupByLibrary.simpleMessage("Yes"),
    "youAreOur": MessageLookupByLibrary.simpleMessage("You\'re our"),
    "youAreSelecting": m76,
    "youCanOnlyOrderSingleStore": MessageLookupByLibrary.simpleMessage(
      "You can only purchase from a single store.",
    ),
    "youCanOnlyPurchase": MessageLookupByLibrary.simpleMessage(
      "You can only purchase",
    ),
    "youDontHaveAnyCoupons": MessageLookupByLibrary.simpleMessage(
      "You don\'t have any coupons.",
    ),
    "youDontHavePermissionToCreatePost": MessageLookupByLibrary.simpleMessage(
      "You don\'t have permission to create Post",
    ),
    "youHave": MessageLookupByLibrary.simpleMessage("You have"),
    "youHaveNoPost": MessageLookupByLibrary.simpleMessage("You have no posts"),
    "youHavePassed": m77,
    "youHavePoints": m78,
    "youMightAlsoLike": MessageLookupByLibrary.simpleMessage(
      "You might also like",
    ),
    "youNeedToLoginToSeeAddresses": MessageLookupByLibrary.simpleMessage(
      "You need to login to see addresses",
    ),
    "youNotBeAsked": MessageLookupByLibrary.simpleMessage(
      "You won\'t be asked next time after completion",
    ),
    "youSaved": m79,
    "yourAccountIsUnderReview": MessageLookupByLibrary.simpleMessage(
      "Your account is under review. Please contact the administrator if you need any help.",
    ),
    "yourAddressExistYourLocal": MessageLookupByLibrary.simpleMessage(
      "Address exists in your local storage",
    ),
    "yourAddressHasBeenSaved": MessageLookupByLibrary.simpleMessage(
      "The address has been saved to your local storage",
    ),
    "yourBagIsEmpty": MessageLookupByLibrary.simpleMessage("Your bag is empty"),
    "yourBookingDetail": MessageLookupByLibrary.simpleMessage(
      "Your booking details",
    ),
    "yourEarningsThisMonth": MessageLookupByLibrary.simpleMessage(
      "Your earnings this month",
    ),
    "yourNote": MessageLookupByLibrary.simpleMessage("Your Note"),
    "yourOrderHasBeenAdded": MessageLookupByLibrary.simpleMessage(
      "Your order has been added",
    ),
    "yourOrderIsConfirmed": MessageLookupByLibrary.simpleMessage(
      "Your Order is Confirmed!",
    ),
    "yourOrderIsEmpty": MessageLookupByLibrary.simpleMessage(
      "Your order is empty",
    ),
    "yourOrderIsEmptyMsg": MessageLookupByLibrary.simpleMessage(
      "Looks like you haven\'t added any items.\nStart shopping to fill it in.",
    ),
    "yourOrders": MessageLookupByLibrary.simpleMessage("Your Orders"),
    "yourProductIsUnderReview": MessageLookupByLibrary.simpleMessage(
      "Your product is under review",
    ),
    "yourRating": MessageLookupByLibrary.simpleMessage("Your Rating"),
    "yourUsernameEmail": MessageLookupByLibrary.simpleMessage(
      "Your username or email",
    ),
    "zipCode": MessageLookupByLibrary.simpleMessage("ZIP Code"),
  };
}
