class RouteConstants {
  static const String index = '/';
  static const String login = '/login';
  static const String loginWithPassword = '/login/password';
  static const String splash = '/splash';
  static const String main = '/main';
  static const String onboarding = '/onboarding';

  static const String userQrCode = "/user/qr-code";
  static const String userScanner = "/user/scanner";

  static const String userMe = "/user/me";
  static const String userProfile = "/user/profile";
  static const String userProfileView = "/user/profile/view";
  static const String userGifts = "/user/gifts";
  
  static const String userSetting = "/user/setting";
  static const String myAlbum = "/user/my-album";
  static const String albumViewer = "/user/album-viewer";
  static const String userEditNickname = "/user/edit/nickname";
  static const String userEditBio = "/user/edit/bio";
  static const String userSettingAccounts = "/user/setting/accounts";
  static const String userSettingNotification = "/user/setting/notification";
  static const String userSettingPrivacy = "/user/setting/privacy";
  static const String userRelationships = "/user/relationships";
  static const String searchUser = "/user/search";

  static const String vexWallet = "/wallet/vex";
  static const String deposit = "/wallet/deposit";
  static const String diamonds = "/wallet/diamonds";
  static const String history = "/wallet/history";

  static const String channels = "channels";
  static const String channelMessagesDualInfo = "/channels/messages/dual/info";
  static const String channelMessagesGroupInfo =
      "/channels/messages/group/info";
  static const String channelMessagesGroupMember =
      "/channels/messages/group/member";
  static const String channelMessagesDetail = "/channels/messages/details";

  static const String feed = "/feed";
  static const String addHastag = "/add-hastag";
  static const String postDetail = "/post/:postId";
  static const String commentReplies = "/post/:postId/comment/:commentId/replies";
  static const String postLikes = "/post/:postId/likes";
  static const String notifications = "/notifications";
  static const String hashtag = "/hashtag/:hashtagId";
}
