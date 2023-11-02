class AppImages {
  static String profile = "profile".png;
  static String bg = "bg".png;
  static String more = "more".png;
  static String user1 = "user1".png;
  static String user2 = "user2".png;
  static String user3 = "user3".png;
  static String user4 = "user4".png;
  static String user5 = "user5".png;
}

extension on String {
  String get png => "assets/images/$this.png";
}
