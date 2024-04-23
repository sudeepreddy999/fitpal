import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_pal/Controllers/hero_dialog_route.dart';
import 'package:fit_pal/DataBaseServices/Intialziedata.dart';
import 'package:fit_pal/models/custom_workouts.dart';
import 'package:fit_pal/models/excercises.dart';
import 'package:fit_pal/pages/create_playlist.dart';
import 'package:fit_pal/pages/workout_start_page.dart';
import 'package:fit_pal/DataWorkout/assignworkout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WorkoutSelect extends StatefulWidget {
  const WorkoutSelect({Key? key}) : super(key: key);

  @override
  State<WorkoutSelect> createState() => _WorkoutSelectState();
}

class _WorkoutSelectState extends State<WorkoutSelect> {
  late String uid;
  late List<Excersise> today = [];
  late List<CustomPlaylist> custom = [];

  @override
  void initState() {
    super.initState();
    retrieveUID();
    fetchTodayWorkouts();
    fetchTodayCustomWorkouts();
  }

  void retrieveUID() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    uid = user?.uid ?? '';
  }

  void fetchTodayWorkouts() async {
    InitializeWorkout initializeWorkout = InitializeWorkout(uid: uid);
    List<Workout> todayWorkouts =
        await initializeWorkout.getWorkoutsForCurrentDay();

    List<Excersise> convertedWorkouts = todayWorkouts.map((workout) {
      // Convert each Workout object to Exercise object
      return Excersise(name: workout.name, reps: workout.reps);
    }).toList();

    setState(() {
      today = convertedWorkouts;
    });
    print(today);
  }

  int time = 0;

  int findtime() {
    int time = 0;
    for (int i = 0; i < today.length; i++) {
      time += today[i].returntime() ?? 0; // Ensure totalxp() returns double
    }
    return time;
  }

  int findxp() {
    int s = 0;
    for (int i = 0; i < today.length; i++) {
      s += today[i].totalxp().toInt() ?? 0; // Ensure totalxp() returns double
    }
    return s;
  }

  int XP = 0;

  // int time = 0;

  // int findtime() {
  //   int time = 0;
  //   for (int i = 0; i < today.length; i++) {
  //     time += today[i].returntime() ?? 0; // Ensure totalxp() returns double
  //   }
  //   return time;
  // }

  // int findxp() {
  //   int s = 0;
  //   for (int i = 0; i < today.length; i++) {
  //     s += today[i].totalxp().toInt() ?? 0; // Ensure totalxp() returns double
  //   }
  //   return s;
  // }

  // int XP = 0;

  void fetchTodayCustomWorkouts() async {
    InitializeWorkout initializeWorkout = InitializeWorkout(uid: uid);
    Map<String, List<Map<String, dynamic>>> Hii =
        await initializeWorkout.getPlaylistsAndExercises();

    List<CustomPlaylist> holaa =
        await initializeWorkout.convertMapToCustomPlaylist(Hii);
    setState(() {
      custom = holaa;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(custom.length);
    return Container(
      color: Colors.white,
      height: double.infinity,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                // todays workouts(only 1 set)
                // Align(
                //     alignment: Alignment.topLeft, child: Text('Todays Workouts')),
                const SizedBox(
                  height: 20,
                ),
                Hero(
                  tag: 'today-workout',
                  child: Material(
                    color: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(HeroDialogRoute(builder: (context) {
                          return WorkoutStart(
                            excercises: today,
                            XP: XP,
                          );
                        }));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/back_image.jpeg'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Todays Workout',
                                          style: TextStyle(
                                            fontSize: 24,
                                          ),
                                        )),
                                    Spacer(),
                                    Text('X${today.length}'),
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('${time}'),
                                          ),
                                        )),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.bolt,
                                            color: Colors.yellow[900],
                                          ),
                                          Text(
                                            '${XP}',
                                            style: TextStyle(
                                                // color: Colors.white,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // cutomized workouts
                Row(
                  children: [
                    Text(
                      "Custom Workouts",
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreatePlaylist()));
                      },
                      child: CircleAvatar(
                        child: Icon(Icons.add),
                        backgroundColor: Colors.grey[200],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: List.generate(custom.length, (index) {
                    return CustomPlaylistCard(custom: custom[index]);
                  }),
                ),
                SizedBox(
                  height: 76,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
