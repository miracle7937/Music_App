import 'package:music_app/Api/api.dart';
import 'package:music_app/model/music_model.dart';

class MusicDataLayer {
  static Future<AlbumModel> get() async {
    var responseData = await Request().post(
        uri:
            'http://ws.audioscrobbler.com/2.0/?method=album.search&album=believe&api_key=eab89dbf621865b747fe5467a7ee03cd&format=json');
    print(responseData["results"]["albummatches"]);

    return AlbumModel.fromJson(responseData["results"]["albummatches"]);
  }
}
