import 'package:flutter/material.dart';
import 'package:music_app/model/music_model.dart' as i;

class CustomListTile extends StatelessWidget {
  final i.Album album;

  const CustomListTile({Key key, this.album}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Container(
        height: MediaQuery.of(context).size.width * 0.3,
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Image.network(
                album.image[2].text,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: new Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      "Album: ${album.name}",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Artist: ${album.artist}",
                  style: TextStyle(fontSize: 10),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
