import 'package:navigation_bar/model/friend_row_vo.dart';

class FriendAction {
  static List<FriendRowVo> getFriendList() {
    return [
      FriendRowVo("JeffHsu", ["承暉資訊-研發部"]),
      FriendRowVo("Lin Tsai", ["承暉資訊-研發部", "承暉娛樂-坤特"]),
      FriendRowVo("Hacky Lo", ["承暉資訊-研發部", "承暉娛樂-傳說"]),
    ];
  }
}
