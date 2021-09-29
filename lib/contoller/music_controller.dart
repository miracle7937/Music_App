import 'package:flutter/cupertino.dart';
import 'package:music_app/Api/repository.dart';
import 'package:music_app/model/music_model.dart';

class MusicAppController extends ChangeNotifier {
  List<Album> get album => _data;
  List<Album> _data = [];
  List<Album> _stored = [];

  bool isLoading = true;
  ViewState _view;
  set album(album) {
    _data = album;
  }

  set setView(ViewState view) {
    this._view = view;
  }

  fetchAlbum() {
    if (isLoading) {
      try {
        MusicDataLayer.get().then((value) {
          isLoading = false;

          _data = value.album;
          _stored = value.album;
          isLoading = false;
          notifyListeners();
          _view.success("success");
        });
      } catch (e) {
        isLoading = false;
        notifyListeners();
        print(e.toString());
        _view.error(e.toString());
      }
    }
  }

  searchAlbum(String v) {
    print(v.length >= 2);
    if (v.length >= 2) {
      print(v);
      album = _data.where((element) {
        return element.name.toLowerCase().contains(v.toLowerCase());
      }).toList();
      notifyListeners();
    } else {
      _data = _stored;
      notifyListeners();
    }
    print(_data.length);
    print(album.length);
  }
}

abstract class ViewState {
  error(String v);
  success(String v);
}
