import 'package:c_linked/widgets/checklist.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          dailyChecklistCard(),
        ],
      ),
    );
  }

  SizedBox dailyChecklistCard() {
    return const SizedBox(
      width: 500,
      height: 500,
      child: Card(
        color: Color.fromARGB(255, 78, 23, 129),
        child: Column(children: [
          Text("Dailies"),
          CheckList(),
        ]),
      ),
    );
  }
}
