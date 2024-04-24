import 'package:fit_pal/models/custom_workouts.dart';
import 'package:fit_pal/models/excercise_card.dart';
import 'package:fit_pal/pages/perform_workout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkoutStartCustom extends StatefulWidget {
  const WorkoutStartCustom({super.key, required this.custom});
  final CustomPlaylist custom;

  @override
  State<WorkoutStartCustom> createState() => _WorkoutStartCustomState();
}

class _WorkoutStartCustomState extends State<WorkoutStartCustom> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    custom = widget.custom;
    cal = totalCal();
    time = findtime();
    XP = findxp();
  }

  int findxp() {
    int s = 0;
    for (int i = 0; i < custom.set.length; i++) {
      s += custom.set[i].totalxp().toInt() ??
          0; // Ensure totalxp() returns double
    }
    return s;
  }

  int XP = 0;
  int time = 0;

  int findtime() {
    int time = 0;
    for (int i = 0; i < custom.set.length; i++) {
      time +=
          custom.set[i].returntime() ?? 0; // Ensure totalxp() returns double
    }
    return time;
  }

  double totalCal() {
    double s = 0;
    for (int i = 0; i < custom.set.length; i++) {
      s += custom.set[i].gettotcal()!;
    }
    return s;
  }

  double cal = 0;

  Widget buildStatsCard(
      String title, String value, IconData icon, Color iconColor) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1)),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Icon(icon, size: 30, color: iconColor),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(title, style: TextStyle(fontSize: 16, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  late CustomPlaylist custom;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Hero(
          tag: custom.name,
          child: Material(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomScrollView(slivers: <Widget>[
                  SliverAppBar(
                    stretch: true,
                    surfaceTintColor: Colors.white,
                    backgroundColor: Colors.white,
                    // title: Text(
                    //   'Todays Workouts',
                    //   style: TextStyle(color: Colors.black),
                    // ),
                    leading: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back)),
                    pinned: true,
                    floating: true,
                    expandedHeight: 160,
                    flexibleSpace: FlexibleSpaceBar(
                      background: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 50),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Workout \n${custom.name}',
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // borderRadius: BorderRadius.circular(20),
                      ),
                      // height: 1000,
                      width: double.infinity,
                      child: Column(
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 20.0),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //     children: [
                          //       Column(
                          //         children: [
                          //           Text(
                          //             '18 min',
                          //             style: TextStyle(
                          //                 color: Colors.black, fontSize: 18),
                          //           ),
                          //           Text(
                          //             'Time',
                          //             style: TextStyle(
                          //                 color: Colors.black.withOpacity(0.5)),
                          //           ),
                          //         ],
                          //       ),
                          //       VerticalDivider(
                          //         color: Colors.black,
                          //         thickness: 3,
                          //       ),
                          //       Column(
                          //         children: [
                          //           Text(
                          //             '+30',
                          //             style: TextStyle(
                          //                 color: Colors.black, fontSize: 18),
                          //           ),
                          //           Text(
                          //             'XP',
                          //             style: TextStyle(
                          //                 color: Colors.black.withOpacity(0.5)),
                          //           ),
                          //         ],
                          //       ),
                          //       VerticalDivider(
                          //         color: Colors.black,
                          //         thickness: 3,
                          //       ),
                          //       Column(
                          //         children: [
                          //           Text(
                          //             '500',
                          //             style: TextStyle(
                          //                 color: Colors.black, fontSize: 18),
                          //           ),
                          //           Text(
                          //             'KCal',
                          //             style: TextStyle(
                          //                 color: Colors.black.withOpacity(0.5)),
                          //           ),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildStatsCard("Time", '${time}',
                                  CupertinoIcons.clock, Colors.brown),
                              buildStatsCard("XP", '${XP}', CupertinoIcons.bolt,
                                  Colors.yellow.shade900),
                              buildStatsCard("Cal", cal.toStringAsFixed(0),
                                  CupertinoIcons.flame, Colors.red),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                  'Exercises (${custom.set.length})',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              )),
                          Column(
                            children: List.generate(
                                custom.set.length,
                                (index) => ExcerciseCard(
                                    excersise: custom.set[index])),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
                Positioned(
                    // left: 100,
                    bottom: 70,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return PerformWorkout(
                              excercises: custom.set,
                              XP: XP,
                            );
                          }));
                        },
                        child: Container(
                          width: 250,
                          height: 40,
                          // width: double.infinity,
                          // width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              "Start",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
