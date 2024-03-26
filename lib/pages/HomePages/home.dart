import 'package:fit_pal/models/food.dart';
import 'package:fit_pal/models/food_card.dart';
import 'package:fit_pal/utility/GlassMorphism.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:fit_pal/utility/date_picker_widget.dart';
import 'package:fit_pal/pages/HomePages/segmentedcontrol.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Food> today = [
    Food('BreakFast', 1000, 10, 22, 33, 100),
    Food('Lunch', 3090, 33, 22, 53, 1000),
    Food('Dinner', 8003, 99, 82, 33, 99),
    Food('Supper', 1500, 18, 92, 33, 700)
  ];
  final PageController _pages1 = PageController();
  final TextStyle _slider = TextStyle(
      fontFamily: 'Roboto', fontSize: 15, fontWeight: FontWeight.w500);
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      // duration: Duration(seconds: 1),
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(
          gradient: RadialGradient(
        radius: 1.2,
        // center: Alignment(0, _pos.value),
        center: Alignment(0, -1),
        // radius:0.5,
        colors: [Color.fromARGB(255, 123, 69, 232), Colors.white],
        stops: [0.0, 1.0],
      )),
      // color: Colors.blue,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
              child: DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: Colors.black,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    // _selectedValue = date;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // page view for calorie intake and exit with an indicator
            Container(
              // color: Colors.blue,
              // color: Colors.blue,
              height: 250,
              child: PageView(
                controller: _pages1,
                children: [
                  Container(
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            '1286',
                            style: TextStyle(
                              height: 0.8,
                              // fontFamily: 'Bebas_Neue',
                              letterSpacing: -10,
                              fontSize: 130,
                              color: Colors.white.withOpacity(0.9),
                              // backgroundColor: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Kcal left',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GlassMorphism(
                                    blur: 50,
                                    // margin: EdgeInsets.all(10),
                                    // color: Colors.blue,
                                    // height: 80,
                                    // width: 90,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Protein',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              // color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '32%',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              Expanded(
                                child: GlassMorphism(
                                    blur: 50,
                                    // margin: EdgeInsets.all(10),
                                    // color: Colors.red,
                                    // height: 80,
                                    // width: 90,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Carbs',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              // color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '44%',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              Expanded(
                                child: GlassMorphism(
                                    blur: 50,
                                    // margin: EdgeInsets.all(10),
                                    // color: Colors.green,
                                    // height: 80,
                                    // width: 90,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Fat',
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              // color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '28%',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            '1444',
                            style: TextStyle(
                              // fontFamily: 'Bebas_Neue',
                              height: 0.8,
                              letterSpacing: -10,
                              fontSize: 130,
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Kcal to burn',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            SmoothPageIndicator(
                controller: _pages1,
                count: 2,
                effect: const ScrollingDotsEffect(
                  // border: Border.all(color: Colors.grey,width: 1),
                  dotColor: Colors.white,
                  activeDotColor: Color.fromARGB(255, 169, 131, 239),
                  activeStrokeWidth: 2.6,
                  activeDotScale: 1.0,
                  maxVisibleDots: 5,
                  radius: 8,
                  spacing: 10,
                  dotHeight: 9,
                  dotWidth: 9,
                )),
            Container(
              padding: EdgeInsets.only(left: 30, top: 12),
              alignment: Alignment.centerLeft,
              child: Text(
                textAlign: TextAlign.left,
                "Daily Meals",
                style: TextStyle(
                  fontFamily: "roboto",
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Container(
            //   child: SegmentedControl(),
            // ),
            const SizedBox(
              height: 10,
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              // color: Colors.blue,
              // width: 500,
              child: CustomSlidingSegmentedControl<int>(
                // fixedWidth: 130,
                // height: 50,
                isStretch: true,
                initialValue: _page,
                children: {
                  0: Text(
                    'Meals',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: _page == 0 ? Colors.black : Colors.grey[700],
                        fontWeight: FontWeight.w500),
                  ),
                  1: Text(
                    'Activity',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: _page == 1 ? Colors.black : Colors.grey[700],
                        fontWeight: FontWeight.w500),
                  ),
                  2: Text(
                    'Water',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: _page == 2 ? Colors.black : Colors.grey[700],
                        fontWeight: FontWeight.w500),
                  ),
                },
                decoration: BoxDecoration(
                  // color: CupertinoColors.lightBackgroundGray,
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                thumbDecoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      blurRadius: 4.0,
                      spreadRadius: 1.0,
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                    ),
                  ],
                ),
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
                onValueChanged: (v) {
                  setState(() {
                    _page = v;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment,
              children: List.generate(today.length, (index) {
                return FoodCard(food: today[index]);
              }),
            ),

            // A tab view for meals, activity, water.
          ],
        ),
      ),
    );
  }
}
