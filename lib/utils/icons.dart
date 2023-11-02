class AppIcons {
  static String about = "about".path;
  static String add = "add".path;
  static String apps = "apps".path;
  static String book = "book".path;
  static String comments = "comments".path;
  static String hashtag = "hashtag".path;
  static String like = "like".path;
  static String likes = "likes".path;
  static String more = "more".path;
  static String navigation = "nav".path;
  static String notification = "notif".path;
  static String organize = "organize".path;
  static String posts = "posts".path;
  static String profile = "profile".path;
  static String queen = "queen".path;
  static String reference = "reference".path;
  static String share = "share".path;
  static String zaddy = "zaddy".path;
  static String search = "search".path;
  static String leading = "leading".path;
  static String filter = "filter".path;
  static String comment = "comment".path;
  static String favorite = "favorite".path;
  static String flag = "flag".path;
  static String emoji = "emoji".path;
}

extension on String {
  String get path => "assets/icons/$this.svg";
}
