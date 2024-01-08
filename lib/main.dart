/*
 * Copyright 2018, 2019, 2020, 2021 Dooboolab.
 *
 * This file is part of Flutter-Sound.
 *
 * Flutter-Sound is free software: you can redistribute it and/or modify
 * it under the terms of the Mozilla Public License version 2 (MPL2.0),
 * as published by the Mozilla organization.
 *
 * Flutter-Sound is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * MPL General Public License for more details.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'demo/demo.dart';
import 'livePlaybackWithBackPressure/live_playback_with_back_pressure.dart';
import 'livePlaybackWithoutBackPressure/live_playback_without_back_pressure.dart';
import 'multi_playback/multi_playback.dart';
import 'play_from_mic/play_from_mic.dart';
import 'recordToStream/record_to_stream_example.dart';
import 'simple_playback/simple_playback.dart';
import 'simple_recorder/simple_recorder.dart';
import 'soundEffect/sound_effect.dart';
import 'streamLoop/stream_loop.dart';
import 'loglevel/loglevel.dart';
import 'volume_control/volume_control.dart';
import 'speed_control/speed_control.dart';
import 'player_onProgress/player_onProgress.dart';
import 'recorder_onProgress/recorder_onProgress.dart';
import 'seek/seek.dart';
import 'streamLoop_justAudio/stream_loop_just_audio.dart';

/*
    This APP is just a driver to call the various Flutter Sound examples.
    Please refer to the examples/README.md and all the examples located under the examples/lib directory.
*/

void main() {
  runApp(ExamplesApp());
}

///
const int tNotWeb = 1;

///
class Example {
  ///
  final String? title;

  ///
  final String? subTitle;

  ///
  final String? description;

  ///
  final WidgetBuilder? route;

  ///
  final int? flags;

  ///
  /* ctor */ Example(
      {this.title, this.subTitle, this.description, this.flags, this.route});

  ///
  void go(BuildContext context) =>
      Navigator.push(context, MaterialPageRoute<void>(builder: route!));
}

///
final List<Example> exampleTable = [
  // If you update the following test, please update also the Examples/README.md file and the comment inside the dart file.

  Example(
      title: 'Demo',
      subTitle: 'Flutter Sound capabilities（录制功能）',
      flags: 0,
      route: (_) => Demo(),
      description:
      '''这是一个演示 Flutter Sound 可以做什么的演示。
这个演示应用程序的代码并不那么简单，不幸的是不是很干净:-(。

Flutter Sound 初学者：您可能应该查看“[SimplePlayback]”和“[SimpleRecorder]”

这个Demo最大的看点在于它展示了Flutter Sound的大部分功能：

- 使用各种编解码器从各种媒体播放
- 使用各种编解码器记录到各种媒体
- 录制或播放的暂停和恢复控制
- 展示如何使用 Stream 来获取播放（或重新编码）事件
- 展示如何在播放终止时指定回调函数，
- 展示如何录制到流或从流中播放
- 可以在 iOS 或 Android 锁屏上显示控件
- ...

该演示没有使用 Flutter Sound UI Widgets。

如果有人很快重写这个演示，那就太好了'''),

  Example(
    title: 'simplePlayback（单条播放）',
    subTitle: 'A very simple example',
    flags: 0,
    route: (_) => SimplePlayback(),
    description: '''
对于 Flutter Sound 初学者来说，这是一个非常简单的示例，
显示如何播放远程文件。

这个例子非常基础。
''',
  ),

  Example(
    title: 'simpleRecorder（简单录制功能）',
    subTitle: 'A very simple example',
    flags: 0,
    route: (_) => SimpleRecorder(),
    description: '''
对于 Flutter Sound 初学者来说，这是一个非常简单的示例，
显示如何录制然后播放文件。

这个例子非常基础。
''',
  ),

  Example(
    title: 'multiPlayback（多重播放）',
    subTitle: 'Playing several sound at the same time',
    flags: 0,
    route: (_) => MultiPlayback(),
    description: '''
这是一个同时播放多个声音的简单示例。
''',
  ),

  Example(
    title: 'Volume Control（音量控制）',
    subTitle: 'Volume Control',
    flags: 0,
    route: (_) => VolumeControl(),
    description: '''
这是一个非常简单的示例，展示了如何在播放期间设置音量。

这个例子非常基础。
''',
  ),

  Example(
    title: 'Speed Control（速度控制）',
    subTitle: 'Speed Control',
    flags: 0,
    route: (_) => SpeedControl(),
    description: '''
这是一个非常简单的示例，展示了如何调整播放速度。

这个例子非常基础。
''',
  ),

  Example(
    title: 'Seek Player',
    subTitle: 'Seek Player',
    flags: 0,
    route: (_) => Seek(),
    description: '''
这是一个非常简单的示例，展示了如何调整播放速度。

这个例子非常基础。
''',
  ),

  Example(
    title: 'Player onProgress',
    subTitle: 'Player onProgress',
    flags: 0,
    route: (_) => PlayerOnProgress(),
    description: '''
这是一个非常简单的示例，展示了如何在播放器上调用 `setSubscriptionDuration() 并使用 onProgress()。

''',
  ),

  Example(
    title: 'Recorder onProgress（记录进度）',
    subTitle: 'Recorder onProgress',
    flags: 0,
    route: (_) => RecorderOnProgress(),
    description: '''
这是一个非常简单的示例，展示了如何在记录器上调用 `setSubscriptionDuration() 并使用 onProgress()。

''',
  ),

  Example(
    title: 'Play from Mic（从麦克风播放）',
    subTitle: 'Play from microphone',
    flags: tNotWeb,
    route: (_) => PlayFromMic(),
    description: '''
在蓝牙耳机上播放麦克风录制的内容。
这个例子非常简单。

>>> 请确保您的耳机已通过蓝牙正确连接
''',
  ),

  Example(
    title: 'recordToStream（录制到 Stream 的示例）',
    subTitle: 'Example of recording to Stream',
    flags: tNotWeb,
    route: (_) => RecordToStreamExample(),
    description: '''
这是一个展示如何记录到 Dart Stream 的示例。
它将所有记录的数据从 Stream 写入文件，这是完全愚蠢的：
如果应用程序想要将某些内容记录到文件中，则不得使用 Streams。

记录到流的真正好处是例如为语音转文本引擎提供数据，或者实时处理 Dart 中的实时数据。
''',
  ),

  Example(
    title: 'livePlaybackWithoutBackPressure（无背压实时播放）',
    subTitle: 'Live Playback without BackPressure',
    flags: tNotWeb,
    route: (_) => LivePlaybackWithoutBackPressure(),
    description:
    '''一个非常简单的例子，展示了如何在没有背压的情况下播放实时数据。
一个非常简单的示例，展示了如何在没有背压的情况下播放实时数据。
它提供实时流，无需等待每个区块的期货完成。
这更简单，因为应用程序不需要在播放另一块之前等待每个块的播放。


这个例子从资产文件中获取数据，这是完全愚蠢的：
如果应用程序想要播放资产文件，他必须使用“StartPlayerFromBuffer()”。

在没有背压的情况下馈送 Flutter Sound 非常简单，但您可能会遇到两个问题：
- 如果您的应用程序传输音频通道的速度太快，则可能会出现使用的流内存问题。
- 应用程序不知道所提供的块何时真正播放。
如果他执行“stopPlayer()”，它将丢失所有缓冲的数据。

此示例使用“foodEvent”对象在执行“stop()”之前重新同步输出流
''',
  ),

  Example(
    title: 'livePlaybackWithBackPressure',
    subTitle: 'Live Playback with BackPressure',
    flags: tNotWeb,
    route: (_) => LivePlaybackWithBackPressure(),
    description: '''
一个非常简单的示例，展示了如何使用背压播放实时数据。
它提供实时流，等待每个区块的期货完成。

这个例子从资产文件中获取数据，这是完全愚蠢的：
如果应用程序想要播放资产文件，他必须使用“StartPlayerFromBuffer()”。

如果您不需要任何背压，您可以看到另一个简单的示例：“LivePlaybackWithoutBackPressure.dart”。
这个另一个例子稍微简单一些，因为应用程序不需要在播放之前等待每个块的播放
播放另一首。
''',
  ),

  Example(
    title: 'soundEffect',
    subTitle: 'Sound Effect',
    flags: tNotWeb,
    route: (_) => SoundEffect(),
    description: '''
```startPlayerFromStream()``` 可以非常高效的播放音效。 例如在游戏应用程序中。
应用程序打开音频会话并在初始化期间调用“startPlayerFromStream()”。
当它想要播放噪音时，只需调用动词“feed”即可
''',
  ),

  Example(
    title: 'streamLoop',
    subTitle: 'Loop from recorder to player',
    flags: tNotWeb,
    route: (_) => StreamLoop(),
    description: '''
```streamLoop()``` 是一个非常简单的例子，它连接 FlutterSoundRecorder 接收器
到 FlutterSoundPlayer 流。

当然，我们不会开扩音器播放，以避免出现非常令人不快的拉森效应。

本例没有使用新的StreamController，而是直接使用`foodStreamController`
来自 flutter_sound_player.dart。
''',
  ),

  Example(
    title: 'setLogLevel()',
    subTitle: 'Dynamically change the log level',
    flags: 0,
    route: (_) => LogLevel(),
    description: '''
````
演示如何在音频会话期间更改日志级别。
''',
  ),

  Example(
    title: 'StreamLoopJustAudio()',
    subTitle: 'JustAudio cohabitation',
    flags: tNotWeb,
    route: (_) => StreamLoopJustAudio(),
    description: '''
````
     测试 StreamLoop 与 JustAudio 的共存。
     ''',
  ),
];

///
class ExamplesApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sound Examples',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ExamplesAppHomePage(title: 'Flutter Sound Examples'),
    );
  }
}

///
class ExamplesAppHomePage extends StatefulWidget {
  ///
  ExamplesAppHomePage({Key? key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  ///
  final String? title;

  @override
  _ExamplesHomePageState createState() => _ExamplesHomePageState();
}

class _ExamplesHomePageState extends State<ExamplesAppHomePage> {
  Example? selectedExample;

  @override
  void initState() {
    selectedExample = exampleTable[0];
    super.initState();
    //_scrollController = ScrollController( );
  }

  @override
  Widget build(BuildContext context) {
    Widget cardBuilder(BuildContext context, int index) {
      var isSelected = (exampleTable[index] == selectedExample);
      return GestureDetector(
        onTap: () => setState(() {
          selectedExample = exampleTable[index];
        }),
        child: Card(
          shape: RoundedRectangleBorder(),
          borderOnForeground: false,
          elevation: 3.0,
          child: Container(
            // height: 50,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: isSelected ? Colors.indigo : Color(0xFFFAF0E6),
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
            ),

            //color: isSelected ? Colors.indigo : Colors.cyanAccent,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(exampleTable[index].title!,
                  style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black)),
              Text(exampleTable[index].subTitle!,
                  style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black)),
            ]),
          ),
        ),
      );
    }

    Widget makeBody() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Color(0xFFFAF0E6),
                border: Border.all(
                  color: Colors.indigo,
                  width: 3,
                ),
              ),
              child: ListView.builder(
                  itemCount: exampleTable.length, itemBuilder: cardBuilder),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Color(0xFFFAF0E6),
                border: Border.all(
                  color: Colors.indigo,
                  width: 3,
                ),
              ),
              child: SingleChildScrollView(
                child: Text(selectedExample!.description!),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: makeBody(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Container(
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFFFAF0E6),
              border: Border.all(
                color: Colors.indigo,
                width: 3,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text((kIsWeb && (selectedExample!.flags! & tNotWeb != 0))
                    ? 'Not supported on Flutter Web '
                    : ''),
                ElevatedButton(
                  onPressed:
                      (kIsWeb && (selectedExample!.flags! & tNotWeb != 0))
                          ? null
                          : () => selectedExample!.go(context),
                  //color: Colors.indigo,
                  child: Text(
                    'GO',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
