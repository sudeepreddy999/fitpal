import 'dart:async';

//hello
import 'package:fit_pal/models/excercises.dart';
import 'package:fit_pal/pages/end_workout.dart';
import 'package:fit_pal/pages/interval_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:video_player/video_player.dart';

class PerformWorkoutCard extends StatefulWidget {
  const PerformWorkoutCard(
      {super.key,
      required this.excersise,
      required this.nextpage,
      required this.pagenumber,
      required this.lastpage,
      required this.XP});
  final Excersise excersise;
  final VoidCallback nextpage;
  final int pagenumber;
  final int lastpage;
  final int XP;

  @override
  State<PerformWorkoutCard> createState() => _PerformWorkoutCardState();
}

class _PerformWorkoutCardState extends State<PerformWorkoutCard> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late Excersise excersise;
  late int time;
  late int three;
  late Timer _timer;
  late Timer _timer3;
  late VoidCallback nextpage;
  bool isrun = false;

  void startTimer1() {
    Future.delayed(Duration.zero, () {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return CustomDialog(); // Display custom stateful dialog box
        },
      );
    });
    Future.delayed(Duration(seconds: 4), () {
      startTimer();
    });
  }

  void startTimer() {
    setState(() {
      isrun = true;
    });
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSecond,
      (Timer timer) {
        if (time == 0) {
          setState(() {
            timer.cancel();
            isrun = false;
          });
          if (widget.lastpage - 1 == widget.pagenumber) {
            print("page equal");
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return EndWorkout(
                XP: widget.XP,
              );
            }));
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return IntervalPage(nextpage: nextpage);
            }));
          }

          // nextpage();
        } else {
          setState(() {
            time--;
          });
        }
      },
    );
  }

  late bool ismin = true;
  // late bool isdash;
  @override
  void initState() {
    // isdash = excersise.returnBool()!;
    // print(isdash);
    nextpage = widget.nextpage;
    three = 3;
    excersise = widget.excersise;
    time = excersise.reps;
    // TODO: implement initState
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.asset(
        widget.excersise.VideoPath() ?? 'assets/videos/Runninginplace.mp4');

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
    if (excersise.returnBool()!) {
      startTimer1();
    }

    super.initState();
  }

  void pausetimer() {
    setState(() {
      isrun = false;
    });
    _timer.cancel();
  }

  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    _timer.cancel();

    super.dispose();
  }
  // int time =

  @override
  Widget build(BuildContext context) {
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return CustomDialog(); // Display custom stateful dialog box
    //   },
    // );
    // print(excersise.returnBool());
    _controller.play();
    if (excersise.returnBool()!) {
      return Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.pop(context);
                    pausetimer();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Exitcard(
                          start: startTimer,
                        ); // Display custom stateful dialog box
                      },
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 75,
                child: Container(
                  color: Colors.white,
                )),
            Container(
              color: Colors.white10,
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            Expanded(
                flex: 100,
                child: Container(
                  color: Colors.white,
                )),
            Expanded(
                flex: 300,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            widget.excersise.name,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                fontSize: 24),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Text(
                        //   three.toString(),
                        //   style: TextStyle(color: Colors.white, fontSize: 80),
                        // ),
                        Text(
                          time.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 80),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (isrun) {
                                    _timer.cancel();
                                    setState(() {
                                      isrun = false;
                                      // _controller.pause();
                                    });
                                  } else {
                                    startTimer();
                                    setState(() {
                                      isrun = true;
                                      // _controller.play();
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  width: 130,
                                  height: 50,
                                  child: isrun
                                      ? Icon(
                                          Icons.pause_rounded,
                                          color: Colors.white,
                                          size: 45,
                                        )
                                      : Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                          size: 45,
                                        ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _timer.cancel();
                                  if (widget.lastpage - 1 ==
                                      widget.pagenumber) {
                                    print("page equal");
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return EndWorkout(
                                        XP: widget.XP,
                                      );
                                    }));
                                  } else {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return IntervalPage(nextpage: nextpage);
                                    }));
                                  }
                                },
                                child: CircleAvatar(
                                    backgroundColor: Colors.black26,
                                    child: Icon(
                                      Icons.skip_next,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      );
    } else {
      // for rep type excercises

      return Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.pop(context);

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Exitcard1(); // Display custom stateful dialog box
                      },
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                )),
            Container(
              color: Colors.white10,
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                )),
            Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            widget.excersise.name,
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                fontSize: 24),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Text(
                        //   three.toString(),
                        //   style: TextStyle(color: Colors.white, fontSize: 80),
                        // ),
                        Text(
                          'X ${excersise.reps}',
                          style: TextStyle(color: Colors.white, fontSize: 80),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (widget.lastpage - 1 ==
                                      widget.pagenumber) {
                                    print("page equal");
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return EndWorkout(
                                        XP: widget.XP,
                                      );
                                    }));
                                  } else {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return IntervalPage(nextpage: nextpage);
                                    }));
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  width: 130,
                                  height: 50,
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 45,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (widget.lastpage - 1 ==
                                      widget.pagenumber) {
                                    print("page equal");
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return EndWorkout(
                                        XP: widget.XP,
                                      );
                                    }));
                                  } else {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return IntervalPage(nextpage: nextpage);
                                    }));
                                  }
                                },
                                child: CircleAvatar(
                                    backgroundColor: Colors.black26,
                                    child: Icon(
                                      Icons.skip_next,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      );
    }
  }
}

class CustomDialog extends StatefulWidget {
  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  int _dialogCounter = 3; // Initial countdown value for the dialog box

  @override
  void initState() {
    super.initState();
    startDialogCountdown();
  }

  void startDialogCountdown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_dialogCounter > 0) {
          _dialogCounter--;
        } else {
          timer.cancel(); // Stop the timer when it reaches 0
          Navigator.of(context)
              .pop(); // Close the dialog when countdown finishes
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent, // Make the background transparent
      content: Container(
        width: 200, // Set the width of the content
        height: 200, // Set the height of the content
        decoration: BoxDecoration(
          shape: BoxShape.circle, // Use BoxShape.circle for circular shape
          color: Colors.transparent, // Set the color of the circular container
        ),
        child: Center(
          child: Text(
            " $_dialogCounter ",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 100),
          ),
        ),
      ),
    );
  }
}

class Exitcard extends StatefulWidget {
  const Exitcard({super.key, required this.start});
  final VoidCallback start;

  @override
  State<Exitcard> createState() => _ExitcardState();
}

class _ExitcardState extends State<Exitcard> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Are you sure you want to exit?",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
      icon: Icon(
        Icons.warning,
        color: Colors.red,
        size: 36,
      ),
      content: Container(
        height: 160,
        child: Column(
          children: [
            Text(
              "Any unsaved progress will be lost",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Exit the app or pop back stack
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Container(
                height: 35,
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'Exit',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Close the dialog and resume
                Navigator.pop(context);
              },
              child: Container(
                height: 35,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Center(
                  child: Text(
                    'Resume',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Exitcard1 extends StatefulWidget {
  const Exitcard1({super.key});

  @override
  State<Exitcard1> createState() => _Exitcard1State();
}

class _Exitcard1State extends State<Exitcard1> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Are you sure you want to exit?",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
      icon: Icon(
        Icons.warning,
        color: Colors.red,
        size: 36,
      ),
      content: Container(
        height: 160,
        child: Column(
          children: [
            Text(
              "Any unsaved progress will be lost",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Exit the app or pop back stack
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Container(
                height: 35,
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'Exit',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Close the dialog and resume
                Navigator.pop(context);
              },
              child: Container(
                height: 35,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Center(
                  child: Text(
                    'Resume',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
