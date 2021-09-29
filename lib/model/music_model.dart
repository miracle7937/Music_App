class AlbumModel {
  List<Album> album;

  AlbumModel({this.album});

  AlbumModel.fromJson(Map<String, dynamic> json) {
    if (json['album'] != null) {
      album = new List<Album>();
      json['album'].forEach((v) {
        album.add(new Album.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.album != null) {
      data['album'] = this.album.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Album {
  String name;
  String artist;
  String url;
  List<Image> image;
  String streamable;
  String mbid;

  Album(
      {this.name,
      this.artist,
      this.url,
      this.image,
      this.streamable,
      this.mbid});

  Album.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    artist = json['artist'];
    url = json['url'];
    if (json['image'] != null) {
      image = new List<Image>();
      json['image'].forEach((v) {
        image.add(new Image.fromJson(v));
      });
    }
    streamable = json['streamable'];
    mbid = json['mbid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['artist'] = this.artist;
    data['url'] = this.url;
    if (this.image != null) {
      data['image'] = this.image.map((v) => v.toJson()).toList();
    }
    data['streamable'] = this.streamable;
    data['mbid'] = this.mbid;
    return data;
  }
}

class Image {
  String text;
  String size;

  Image({this.text, this.size});

  Image.fromJson(Map<String, dynamic> json) {
    text = json['#text'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['#text'] = this.text;
    data['size'] = this.size;
    return data;
  }
}
