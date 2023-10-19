import 'package:c_linked/widgets/checklist.dart';
import 'package:c_linked/widgets/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          dailyChecklistCard(),
          signOutBtn(context),
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

  ElevatedButton signOutBtn(context) {
    return ElevatedButton(
        onPressed: () => {
              FirebaseAuth.instance.signOut().then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  )))
            },
        child: const Text("Sign Out"));
  }
}
