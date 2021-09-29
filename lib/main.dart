import 'package:flutter/material.dart';
import 'package:music_app/contoller/music_controller.dart';
import 'package:music_app/model/music_model.dart' as i;
import 'package:music_app/ultils.dart';
import 'package:provider/provider.dart';

import 'component/costom_listTile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MusicAppController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget with ViewState {
  @override
  Widget build(BuildContext context) {
    MusicAppController provider = Provider.of<MusicAppController>(context)
      ..setView = this
      ..fetchAlbum();
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 226, 225, 1),
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: provider.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onChanged: (v) => provider.searchAlbum(v),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Search Music",
                          labelStyle: TextStyle(color: Colors.black),
                          hintStyle: TextStyle(color: Colors.grey),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffbfc9da))),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemCount: provider.album?.length ?? 0,
                      itemBuilder: (v, i) => InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DetailPage(
                                      album: provider.album[i],
                                    ))),
                        child: CustomListTile(
                          album: provider.album[i],
                        ),
                      ),
                    ))
                  ],
                )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  error(String v) {
    print("error");
  }

  @override
  success(String v) {
    print("sucess");
  }
}

class DetailPage extends StatelessWidget {
  final i.Album album;

  const DetailPage({Key key, this.album}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Image.network(
                    album.image[3].text,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Artist: ${album.artist}",
                style: TextStyle(fontSize: 10),
              ),
              SizedBox(
                height: 10,
              ),
              Text(desc),
            ],
          ),
        ),
      ),
    );
  }
}
