import 'package:flutter/material.dart';

const bookIdParam = '/:bookId';
const userIdParam = '/:userId';

enum RouterPage {
  /// Init all of router page for projects

  root("/", "/","/"),
  /// Home router
  home("home", "home", "/home"),

  /// chat router
  chatBook("chat", "chat$bookIdParam", "/home/chat$bookIdParam"),
  chatBookSearch(
      "chat-x", "chat-x$bookIdParam", "/home/search/chat-x$bookIdParam"),
  searchBook("search", "search", "/home/search"),

  /// User router
  user("user", "user", "/home/user"),
  packages("purchase", "purchase", "/home/purchase"),
  userPackages("purchase-x", "purchase-x", "/home/user/purchase-x"),
  purchaseHistories(
      "purchase-history", "purchase-history", "/home/user/purchase-history"),
  ///Market router
  market("market", "market", "/home/market"),
  trending("trending", "trending", "/home/market/trending"),
  bookDetailMarket("book-detail-market", "book-detail-market", "/home/market/book-detail-market"),

  
  /// Extra pages router
  notFoundPage("not-found-page", "not-found-page", "/not-found-page"),

  /// Dialog chat
  dialogUploadImageFile("upload-image-file", "upload-image-file", "/home/chat$bookIdParam/upload-image-file"),
  dialogUploadImageFileX("upload-image-file-x", "upload-image-file-x", "/home/search/chat-x$bookIdParam/upload-image-file-x"),

  /// Gems pay
  payGemsFromChat("pay-gems-from-chat", "pay-gems-from-chat", "/home/chat$bookIdParam/pay-gems-from-chat"),
  payGemsFromChatX("pay-gems-from-chat-x", "pay-gems-from-chat-x", "/home/search/chat-x$bookIdParam/pay-gems-from-chat-x"),

  /// Dialog Gems pay
  dialogPurchaseGemsFromChat("dialog-purchase-gems-from-chat", "dialog-purchase-gems-from-chat", "/home/chat$bookIdParam/dialog-purchase-gems-from-chat"),
  dialogPurchaseGemsFromChatX("dialog-purchase-gems-from-chat-x", "dialog-purchase-gems-from-chat-x", "/home/search/chat-x$bookIdParam/dialog-purchase-gems-from-chat-x"),

  /// Dialog router
  dialogConfirmDelete("confirm-delete-account", "confirm-delete-account", "/home/user/confirm-delete-account"),
  dialogSignOut("sign-out", "sign-out", "/home/user/sign-out"),
  dialogRemoveItem("remove-item", "remove-item", "/home/remove-item"),
  ///DialogUpdateUserAvatar
  dialogUpdateUserAvatar("update-avatar", "update-avatar", "/home/user/update-avatar"),

  ///DialogMarket
  dialogBuyBook("buy-book-from-market", "buy-book-from-market", "/home/market/buy-book-from-market"),
  /// Dialog update item
  dialogUpdateItem("update-item", "update-item", "/home/update-item"),
  dialogCreateBooks("create-item", "create-item", "/home/create-item");



  final String routerName;
  final String routerPath;
  final String navPath;

  const RouterPage(
    this.routerName,
    this.routerPath,
    this.navPath,
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream._();

  static GoRouterRefreshStream? _instance;

  static GoRouterRefreshStream get instance =>
      _instance ??= GoRouterRefreshStream._();

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnTokenChange = true; // Init value

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnTokenChange = notify;

  void refreshRouter() {
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnTokenChange) {
      notifyListeners();
    }
  }
}
