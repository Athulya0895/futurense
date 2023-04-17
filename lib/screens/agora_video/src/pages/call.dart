import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

import 'package:flutter/material.dart';
import 'package:futurensemobileapp/base/base_page.dart';
import 'package:futurensemobileapp/components/dialogue_callpage/call_dialogue.dart';
import 'package:futurensemobileapp/models/mentor_model.dart';
import 'package:futurensemobileapp/screens/agora_video/src/pages/call_vm.dart';

import 'package:lottie/lottie.dart';

import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

import '../utils/settings.dart';

class CallPage extends StatefulWidget {
  /// non-modifiable channel name of the page
  final String? channelName;
  final String? tokenAgora;
  final String? userRole;

  /// non-modifiable client role of the page
  final ClientRole? role;

  //bool varialble to understand call is cut
  bool? callIscut = false;

  final MeetingModel? mentor;
  final String? meetingMode;

  /// Creates a call page with given channel name.
  CallPage(
      {Key? key,
      this.channelName,
      required this.tokenAgora,
      this.role,
      this.callIscut,
      this.mentor,
      this.meetingMode,
      required this.userRole})
      : super(key: key);

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> with BasePage<CallPageVM> {
  final _users = <int>[];
  final _infoStrings = <String>[];
  bool muted = false;
  late RtcEngine _engine;

  @override
  void dispose() {
    // clear users
    _users.clear();
    _dispose();
    super.dispose();
  }

  Future<void> _dispose() async {
    // destroy sdk
    await _engine.leaveChannel();
    await _engine.destroy();
  }

  @override
  void initState() {
    super.initState();
    // initialize agora sdk
    widget.mentor?.communicationMode == 'Video Call'
        ? initialize()
        : setupVoiceSDKEngine();
  }

  Future<void> initialize() async {
    if (appId.isEmpty) {
      setState(() {
        _infoStrings.add(
          'APP_ID missing, please provide your APP_ID in settings.dart',
        );
        _infoStrings.add('Agora Engine is not starting');
      });
      return;
    }

    // widget.mentor?.communicationMode == 'Video Call'
    await _initAgoraRtcEngine();
    // : await _initAudioAgoraRtcEngine();
    _addAgoraEventHandlers();
    VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    configuration.dimensions = const VideoDimensions(width: 1920, height: 1080);
    await _engine.setVideoEncoderConfiguration(configuration);
    await _engine.joinChannel(widget.tokenAgora, widget.channelName!, null, 0);
  }

  //agora audio call initialize
  Future<void> setupVoiceSDKEngine() async {
    if (appId.isEmpty) {
      setState(() {
        _infoStrings.add(
          'APP_ID missing, please provide your APP_ID in settings.dart',
        );
        _infoStrings.add('Agora Engine is not starting');
      });
      return;
    }
    await _initAudioAgoraRtcEngine();
    _addAgoraEventHandlers();
    // retrieve or request microphone permission
    // await [Permission.microphone].request();
    VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    configuration.dimensions = const VideoDimensions(width: 1920, height: 1080);
    await _engine.setVideoEncoderConfiguration(configuration);
    await _engine.joinChannel(widget.tokenAgora, widget.channelName!, null, 0);
  }

  /// Create agora sdk instance and initialize
  Future<void> _initAgoraRtcEngine() async {
    // print("Video Call");
    _engine = await RtcEngine.create(appId);
    print("meeting modecallpage = ${widget.mentor?.communicationMode}");
    // print(widget.meetingMode);

    await _engine.enableVideo();
    // if (widget.mentor?.communicationMode == 'Audio Call') {
    //   await _engine.disableVideo();
    // }
    // widget.mentor?.communicationMode == 'Audio Call'
    //     ? await _engine.disableVideo()
    //     : await _engine.enableVideo();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(widget.role!);
  }

  //Audio Call
  /// Create agora sdk instance and initialize
  Future<void> _initAudioAgoraRtcEngine() async {
    // print("Audio Call");
    _engine = await RtcEngine.create(appId);
    print("meeting modecallpage = ${widget.mentor?.communicationMode}");
    // print(widget.meetingMode);

    await _engine.disableVideo();

    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(widget.role!);
  }

  // Add agora event handlers
  void _addAgoraEventHandlers() {
    _engine.setEventHandler(RtcEngineEventHandler(error: (code) {
      setState(() {
        final info = 'onError: $code';
        _infoStrings.add(info);
      });
    }, joinChannelSuccess: (channel, uid, elapsed) {
      // setState(() {
      //   final info = 'onJoinChannel: $channel, uid: ${widget.mentor?.userName}';
      //   _infoStrings.add(info);
      // });
    }, leaveChannel: (stats) {
      setState(() {
        _infoStrings.add('onLeaveChannel');
        _users.clear();
      });
    }, userJoined: (uid, elapsed) {
      setState(() {
        final info = 'userJoined: ${widget.mentor?.userName}';
        _infoStrings.add(info);
        _users.add(uid);
      });
    }, userOffline: (uid, elapsed) {
      setState(() {
        // final info = 'userOffline: ${widget.mentor?.userName}';
        final info = '${widget.mentor?.userName} Leave the Meeting';
        _infoStrings.add(info);
        _users.remove(uid);
      });
    }, firstRemoteVideoFrame: (uid, width, height, elapsed) {
      setState(() {
        // final info = 'firstRemoteVideo: $uid ${width}x $height';
        // _infoStrings.add(info);
      });
    }));
  }

  /// Helper function to get list of native views
  List<Widget> _getRenderViews() {
    final List<StatefulWidget> list = [];
    if (widget.role == ClientRole.Broadcaster) {
      list.add(const RtcLocalView.SurfaceView());
    }
    _users.forEach((int uid) => list.add(
        RtcRemoteView.SurfaceView(channelId: widget.channelName!, uid: uid)));
    return list;
  }

  /// Video view wrapper
  Widget _videoView(view) {
    return Expanded(child: Container(child: view));
  }

  /// Video view row wrapper
  Widget _expandedVideoRow(List<Widget> views) {
    final wrappedViews = views.map<Widget>(_videoView).toList();
    return Expanded(
      child: Row(
        children: wrappedViews,
      ),
    );
  }

  /// Video layout wrapper
  Widget _viewRows() {
    final views = _getRenderViews();
    switch (views.length) {
      case 1:
        return Container(
            child: Column(
          children: <Widget>[_videoView(views[0])],
        ));
      case 2:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow([views[0]]),
            _expandedVideoRow([views[1]])
          ],
        ));
      case 3:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 3))
          ],
        ));
      case 4:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 4))
          ],
        ));
      default:
    }
    return Container();
  }

  /// Toolbar layout
  Widget _toolbar() {
    bool resume = true;
    if (widget.role == ClientRole.Audience) return Container();
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: _onToggleMute,
            shape: const CircleBorder(),
            elevation: 2.0,
            fillColor: muted ? Colors.blueAccent : Colors.white,
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              muted ? Icons.mic_off : Icons.mic,
              color: muted ? Colors.white : Colors.blueAccent,
              size: 20.0,
            ),
          ),
          RawMaterialButton(
            onPressed: () async {
              //working
              var resShow = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return AlertDialog(
                    //   title: const Text(
                    //       'Hey ,'), // To display the title it is optional
                    //   content: const Text(
                    //       'Did you want to continue the call Click on Resume.or else click on Sharefeedback'), // Message which will be pop up on the screen
                    //   // Action widget which will provide the user to acknowledge the choice
                    //   actions: [
                    //     MaterialButton(
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(25),
                    //       ),
                    //       color: Color(0xffFDBA2F),
                    //       // FlatButton widget is used to make a text to work like a button
                    //       textColor: Colors.white,
                    //       onPressed: () {
                    //         print(" Resume call");
                    //         Navigator.pop(context);
                    //       }, // function used to perform after pressing the button
                    //       child: Text('Resume call'),
                    //     ),
                    //     MaterialButton(
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(25),
                    //       ),
                    //       color: Colors.redAccent,
                    //       textColor: Colors.white,
                    //       onPressed: () async {
                    //         Wakelock.disable();
                    //         print("Pressed endcall");
                    //         Navigator.pop(context, true);
                    //       },
                    //       child: Text('End Call'),
                    //     ),
                    //   ],
                    // );
                    return MyDialogWidget(
                      shouldShowButton: true,
                      text:
                          "Hey!\nIf you have finished the meeting, click on End Call. Else you're free to resume your meeting",
                      lottieWidget: Lottie.asset(
                        'assets/question.json',
                        width: 120,
                        height: 120,
                      ),
                      buttonpressResume: () {
                        print("resume");
                        Navigator.pop(context);
                      },
                      buttonpressEndcall: () {
                        Wakelock.disable();
                        print("Pressed endcall");
                        Navigator.pop(context, true);
                      },
                    );
                  });
              // print("Click on call end");
              if (resShow == true) {
                // _onCallEnd(context);
                // Navigator.pop(context);

                // Navigator.pop(context);

                //Here need to call api for end call
                await provider
                    .checkEndCall(widget.mentor!.channelName.toString());

                provider.checkLeaveReview(widget.mentor!.channelName.toString(),
                    widget.userRole.toString(), context);
              }
            },
            shape: const CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.redAccent,
            padding: const EdgeInsets.all(15.0),
            child: const Icon(
              Icons.call_end,
              color: Colors.white,
              size: 35.0,
            ),
          ),
          RawMaterialButton(
            onPressed: _onSwitchCamera,
            shape: const CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(12.0),
            child: const Icon(
              Icons.switch_camera,
              color: Colors.blueAccent,
              size: 20.0,
            ),
          )
        ],
      ),
    );
  }

  /// Info panel to show logs
  Widget _panel() {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return widget.mentor?.communicationMode == 'Video Call'
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 48),
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              heightFactor: 0.5,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 48),
                child: ListView.builder(
                  reverse: true,
                  itemCount: _infoStrings.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (_infoStrings.isEmpty) {
                      return const Text(
                          "null"); // return type can't be null, a widget was required
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 5,
                              ),
                              decoration: BoxDecoration(
                                color:const Color(0xffFDBA2F),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                _infoStrings[index],
                                style: const TextStyle(color: Colors.blueGrey),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        : Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff0c0c0c),
                  Color(0xff4834d4),
                  Color(0xff00264D),
                ],
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.mentor!.userName.toString(),
                        style: textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: size.height * 0.014),
                      Text(
                        // context.select((VoiceCallerCubit value) =>
                        //         value.isRemoteJoined)
                        //     ? elapsedTime
                        //     :
                        "Calling",
                        style: textTheme.subtitle2!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                // Expanded(
                //   flex: 4,
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           Column(
                //             children: [
                //               IconButton(
                //                 onPressed: () {},
                //                 icon: const Icon(
                //                   Icons.dialer_sip_sharp,
                //                   color: Colors.white,
                //                 ),
                //               ),
                //               Text(
                //                 "Keypad",
                //                 style: textTheme.subtitle2!.copyWith(
                //                   color: Colors.white,
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //       SizedBox(height: size.height * 0.02),
                //       CallerButtonBuilder(
                //         firstOnPressed: () {},
                //         firstTitle: "Record",
                //         firstIcon: const Icon(
                //           Icons.voicemail,
                //           color: Colors.white,
                //         ),
                //         secondOnPressed: () {},
                //         secondTitle: "On hold",
                //         secondIcon: const Icon(
                //           Icons.play_circle_fill,
                //           color: Colors.white,
                //         ),
                //         thirdOnPressed: () {
                //           // context.read<VoiceCallerCubit>().switchMicrophone();
                //         },
                //         thirdTitle: "Mute",
                //         thirdIcon: Icon(
                //           // context.select(
                //           //         (VoiceCallerCubit state) => state.isMicMute)
                //           //     ? Icons.mic
                //           // :
                //           Icons.mic_off,
                //           color: Colors.white,
                //         ),
                //       ),
                //       SizedBox(height: size.height * 0.02),
                //       CallerButtonBuilder(
                //         firstOnPressed: () {},
                //         firstTitle: "Add call",
                //         firstIcon: const Icon(
                //           Icons.add_box,
                //           color: Colors.white,
                //         ),
                //         secondOnPressed: () {},
                //         secondTitle: "Contact",
                //         secondIcon: const Icon(
                //           Icons.perm_contact_cal,
                //           color: Colors.white,
                //         ),
                //         thirdOnPressed: () {
                //           // context.read<VoiceCallerCubit>().switchSpeakerphone();
                //         },
                //         thirdTitle: "Speaker",
                //         thirdIcon: Icon(
                //           // context.select((VoiceCallerCubit state) =>
                //           //         state.isSpeakerOpen)
                //           //     ? Icons.volume_up
                //           //     :
                //           Icons.volume_down,
                //           color: Colors.white,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // Expanded(
                //   flex: 2,
                //   child: IconButton(
                //     onPressed: () {
                //       // final _isJoined = context
                //       //     .select((VoiceCallerCubit state) => state.isJoined);
                //       // if (_isJoined) {
                //       //   context.read<VoiceCallerCubit>().leaveChannel();
                //       //   Navigator.pop(context);
                //       // }
                //     },
                //     icon: const Icon(
                //       Icons.call_end_sharp,
                //       color: Colors.red,
                //       size: 42.0,
                //     ),
                //   ),
                // ),
              ],
            ),
          );
  }

  void _onCallEnd(BuildContext context) {
    Navigator.pop(context);
  }

  void _onToggleMute() {
    setState(() {
      muted = !muted;
    });
    _engine.muteLocalAudioStream(muted);
  }

  void _onSwitchCamera() {
    _engine.switchCamera();
  }

  @override
  Widget build(BuildContext context) {
    return builder(() => Scaffold(
          // appBar: AppBar(
          //   title: Text('Agora Flutter QuickStart'),
          // ),
          backgroundColor: Colors.black,
          body: Center(
            child: Stack(
              children: <Widget>[
                _viewRows(),
                _panel(),
                _toolbar(),
              ],
            ),
          ),
        ));

    //
  }

  @override
  CallPageVM create() => CallPageVM();

  @override
  void initialise(BuildContext context) {
    // TODO: implement initialise
    provider.mentor = widget.mentor;
  }
}
