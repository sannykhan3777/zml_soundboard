import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

typedef void OnError(Exception exception);

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Duration _duration = Duration();
  Duration _position = Duration();
  AudioPlayer player;
  AudioCache audioCache;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    player = AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: player);

    // player.onDurationChanged.listen((d) {
    //   setState(() {
    //     _duration = d;
    //   });
    // });
    //
    // player.onDurationChanged.listen((p) {
    //   setState(() {
    //     _position = p;
    //   });
    // });
  }

  // String Path;

  // Widget slider() {
  //   return Slider(
  //       activeColor: Colors.black,
  //       inactiveColor: Colors.pink,
  //       value: _position.inSeconds.toDouble(),
  //       min: 0.0,
  //       max: _duration.inSeconds.toDouble(),
  //       onChanged: (double value) {
  //         setState(() {
  //           seekToSecond(value.toInt());
  //           value = value;
  //         });
  //       });
  // }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    player.seek(newDuration);
  }

  Widget _btn1({String path}) {
    return IconButton(
        icon: Icon(
          Icons.play_circle_filled,
          size: 35.0,
          color: Color(0xFF003C66),
        ),
        onPressed: () {
          audioCache.play(path);
        });
  }

  Widget _btn2() {
    return IconButton(
        icon: Icon(
          Icons.pause_circle_filled,
          size: 35.0,
          color: Color(0xFF003C66),
        ),
        onPressed: () {
          player.pause();
        });
  }

  Widget _btn3() {
    return IconButton(
        icon: Icon(
          Icons.stop_circle_outlined,
          size: 35.0,
          color: Color(0xFF003C66),
        ),
        onPressed: () {
          player.stop();
        });
  }

  Widget buttonSounds({String name, String pathh}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
          child: Column(
            children: [
              Text(
                "$name",
                overflow: TextOverflow.clip,
                maxLines: 1,
                softWrap: false,
                style: TextStyle(color: Colors.grey.shade800, fontSize: 18.0),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _btn1(path: pathh),
                  _btn2(),
                  _btn3(),
                ],
              ),

              // Row(
              //   children: [
              //     slider(),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text("ZML Soundboard"),
        centerTitle: true,
        backgroundColor: Color(0xFF003C66),
      ),
      // backgroundColor: Color(0xFF033472),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 15.0,
              ),
              buttonSounds(
                  pathh: "Chapeau - Sybrand Buma.m4a",
                  name: "Chapeau - Sybrand Buma"),
              buttonSounds(
                  pathh: "Dat is toch niet te geloven dat is echt erg.m4a",
                  name: "Dat is toch niet"),
              buttonSounds(pathh: "Flats - Mark Rutte.m4a", name: "Flats - Mark Rutte"),
              buttonSounds(pathh: "Geert.m4a", name: "Geert"),
              buttonSounds(
                  pathh: "Ik houd van brood....m4a",
                  name: "Ik houd van brood..."),
              buttonSounds(
                  pathh: "Ik houd van brood - Remix.m4a",
                  name: "Ik houd van brood - Remix"),
              buttonSounds(
                  pathh: "Mark Zuckerberg.m4a", name: "Mark Zuckerberg"),
              buttonSounds(
                  pathh: "Meneer Lubach - Mark Rutte.m4a",
                  name: "Meneer Lubach - Mark Rutte"),
              buttonSounds(pathh: "Nou jawel.m4a", name: "Nou jawel"),
              buttonSounds(
                  pathh: "Omdat_ omdat het prachtig is - Eric Wiebes.m4a",
                  name: "Omdat_ omdat het - Eric Wiebes"),
              buttonSounds(pathh: "TEAM VLEES!.m4a", name: "TEAM VLEES!"),
              buttonSounds(
                  pathh: "Toedeledokie ga dan! - Mark Rutte.m4a",
                  name: "Toedeledokie ga dan! - Mark Rutte"),
              buttonSounds(pathh: "vriendenpeople.m4a", name: "vriendenpeople"),
            ],
          ),
        ),
      ),
    );
  }
}
