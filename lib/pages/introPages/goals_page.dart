import 'package:flutter/material.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({super.key, required this.goal});

  final TextEditingController goal;

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  late TextEditingController goal;
  @override
  void initState() {
    goal = widget.goal;
    super.initState();
  }

  final List<String> activity = <String>[
    'WeightLoss',
    'I wannna be Fit',
    'Bodybuilding',
  ];
  final List<String> activityDescription = <String>[
    'Aiming for weightloss',
    'Aiming to be fit',
    'Aiming to build muscle and stay strong',
  ];
  final List<IconData> icon = <IconData>[
    Icons.chair_alt_outlined,
    Icons.man_3_rounded,
    Icons.directions_walk_rounded,
  ];
  final List<bool> isSelected = <bool>[true, false, false];
  @override
  Widget build(BuildContext context) {
    int i;
    for (i = 0; i < 3; i++) {
      if (isSelected[i]) {
        goal.text = i.toString();
        break;
      }
    }
    return Column(
      children: [
        const Center(
            child: Text(
          'How active are you?',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.all(10),
          height: 400,
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: activity.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: isSelected[index] ? Border.all() : const Border(),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 4,
                      blurRadius: 8,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                ),
                height: 80,
                child: ListTile(
                  onTap: () {
                    setState(() {
                      isSelected[(index + 1) % 3] = false;
                      isSelected[(index + 2) % 3] = false;
                      isSelected[index] = true;
                    });
                  },
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(211, 215, 215, 215),
                    child: Icon(
                      icon[index],
                      color: Colors.black,
                      size: 28,
                    ),
                  ),
                  title: Text(
                    activity[index],
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    activityDescription[index],
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 11,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 10,
            ),
          ),
        ),
      ],
    );
  }
}
