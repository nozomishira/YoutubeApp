import 'package:flutter/material.dart';
import 'package:youtube_app/video_watching_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final items = List<String>.generate(10000, (i) => "Item $i");
  bool registerChannel = false;
  void registerFunction(String buttonName) {
    if (buttonName == "register") {
      if (registerChannel == false) {
        registerChannel = true;
      } else {
        registerChannel = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.videocam),
          title: const Text(
            'YoutubeChannel',
            textAlign: TextAlign.start,
          ),
          actions: <Widget>[
            SizedBox(
              width: 40,
              child: FlatButton(
                child: Icon(Icons.search),
                onPressed: () {
                  //to do anything
                },
              ),
            ),
            SizedBox(
              width: 44,
              child: FlatButton(
                child: Icon(Icons.more_vert),
                onPressed: () {
                  //to do anything
                },
              ),
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white30,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.network(
                        'https://everydayicons.jp/wp/wp-content/themes/everydayicons/icons/thumbs/ei-child_face.png',
                        height: 60.0,
                        width: 60.0,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: <Widget>[
                        const Text(
                          'Youtubeアカウント',
                        ),
                        FlatButton(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.video_call,
                                color:
                                    registerChannel ? Colors.red : Colors.blue,
                              ),
                              Text('登録する')
                            ],
                          ),
                          onPressed: () {
                            //to do anything
                            registerFunction("register");
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 20,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 160.0,
                      height: 10,
                      color: Colors.red,
                      child: Text(
                        'Home',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      height: 3,
                      color: Colors.blue,
                      child: Text(
                        '動画',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      height: 3,
                      color: Colors.green,
                      child: Text(
                        '再生リスト',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      height: 3,
                      color: Colors.yellow,
                      child: Text(
                        'コミュニティ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      height: 3,
                      color: Colors.orange,
                      child: Text(
                        'チャンネル',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      height: 3,
                      color: Colors.deepPurpleAccent,
                      child: Text(
                        '概要',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoPlayerPage()),
                        );
                      },
                      contentPadding: EdgeInsets.all(8),
                      leading: Image.network(
                        'https://everydayicons.jp/wp/wp-content/themes/everydayicons/icons/thumbs/ei-child_face.png',
                        height: 40.0,
                        width: 40.0,
                      ),
                      title: Column(
                        children: <Widget>[
                          Text(
                            'Flutte入門講座${[index]}アプリ開発超初心者向け',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                '300回再生',
                                style: TextStyle(fontSize: 13),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '2日前',
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          )
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
