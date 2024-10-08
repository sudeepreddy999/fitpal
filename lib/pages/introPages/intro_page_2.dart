import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_pal/Controllers/initializationController.dart';
import 'package:fit_pal/DataBaseServices/Intialziedata.dart';
import 'package:fit_pal/DataBaseServices/useruid.dart';
import 'package:fit_pal/pages/introPages/goals_page.dart';
import 'package:fit_pal/pages/introPages/gender_page.dart';
import 'package:fit_pal/pages/introPages/metrics_page.dart';
import 'package:fit_pal/pages/introPages/name_page.dart';
import 'package:fit_pal/pages/introPages/weightmetrics.dart';
import 'package:fit_pal/pages/introPages/activity_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2({super.key});

  @override
  State<IntroPage2> createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _con = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    ani = Tween(begin: 0.0, end: 1.0).animate(_con!);
    super.initState();
  }

  bool check_name() {
    print('name');
    print(name.text);
    if (name.text == "") {
      print('entered');
      setState(() {
        entered_name = false;
      });
      return false;
    } else {
      setState(() {
        entered_name = true;
      });
      return true;
    }
  }

  bool isFirstTime = true;
  bool entered_name = true;
  final TextEditingController name = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController height = TextEditingController();
  final TextEditingController weight = TextEditingController();
  final TextEditingController activity = TextEditingController();
  final TextEditingController goal = TextEditingController();
  AnimationController? _con;
  late Animation<double> ani;
  final PageController _pages = PageController();
  bool onlastPage = false;

  final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
      minimumSize: Size(327, 50),
      backgroundColor: Colors.black,
      elevation: 0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50))));
  @override
  Widget build(BuildContext context) {
    print('sending bool');
    print(entered_name);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            physics: entered_name
                ? const BouncingScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                isFirstTime = false;
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
                if (index == 5) {
                  onlastPage = true;
                  _con?.forward();
                } else {
                  onlastPage = false;
                }
              });
            },
            controller: _pages,
            children: [
              // const DescriptionPage(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (!isFirstTime) {
                      check_name();
                    }
                  });
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: NamePage(
                  name: name,
                  entered_name: entered_name,
                  isFirstTime: isFirstTime,
                  age: age,
                ),
              ),
              GenderPage(genders: gender),
              MetricsPage(height: height),
              WeightMetrics(weight: weight),
              ActivityPage(activity: activity),
              GoalsPage(goal: goal)
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.85),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: !onlastPage
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SmoothPageIndicator(
                            // effect: WormEffect(),
                            controller: _pages,
                            count: 6,
                            // effect: SlideEffect(),
                            effect: const ScrollingDotsEffect(
                              activeDotColor: Colors.black,
                              activeStrokeWidth: 2.6,
                              activeDotScale: 1.3,
                              maxVisibleDots: 5,
                              radius: 8,
                              spacing: 10,
                              dotHeight: 12,
                              dotWidth: 12,
                            )),
                        ElevatedButton(
                          onPressed: () {
                            // print(name.text);
                            if (check_name()) {
                              setState(() {
                                _pages.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            // shape: CircleBorder(),
                            padding: const EdgeInsets.all(8),
                            backgroundColor: Colors.black,
                          ),
                          child: const Icon(
                            Iconsax.arrow_right_1,
                            color: Colors.white,
                            size: 30,
                          ),
                        )
                      ],
                    )
                  : FadeTransition(
                      opacity: ani,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ElevatedButton(
                            onPressed: () {
                              print(name.text);
                              print(age.text);
                              print(gender.text);
                              print(height.text);
                              print(weight.text);
                              print(activity.text);
                              // String? uid = AuthService.getUID();
                              String? uid;
                              final FirebaseAuth _auth = FirebaseAuth.instance;
                              final User? user = _auth.currentUser;
                              uid = user?.uid;

                              if (uid == null) {
                                print("null is uid");
                              } else {
                                print("uid");
                              }
                              if (uid != null) {
                                print(uid);
                                Dataservices dataservices =
                                    Dataservices(uid: uid);
                                dataservices.initializeData(
                                  name: name.text,
                                  age: int.tryParse(age.text) ?? 0,
                                  gender: gender.text,
                                  height: int.tryParse(height.text) ?? 0,
                                  weight: double.tryParse(weight.text) ?? 0.0,
                                  check: int.tryParse(activity.text) ?? 0,
                                  count: 1,
                                  goal: int.tryParse(goal.text) ?? 0,
                                );
                                print("done");
                              }
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return InitializationController();
                              }));
                            },
                            style: buttonPrimary,
                            child: const Text(
                              'Done',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  color: Colors.white),
                            )),
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
