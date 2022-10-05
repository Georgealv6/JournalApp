// ignore_for_file: unnecessary_const

import 'package:journalapp/colors/constants.dart';
import 'package:flutter/material.dart';
import 'package:journalapp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [coverImage(), profile(context)],
      ),
    );
  }
}

Widget coverImage() {
  return Container(
    height: 200,
    decoration: const BoxDecoration(
      color: kBackgroundColor,
      image: const DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/typewriter_01.jpg"),
      ),
    ),
  );
}

Widget profile(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Text(
            "View Your Entries Here",
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      TextButton(
        child: const Text(
          "Back",
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {
          Navigator.pop(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Welcome();
              },
            ),
          );
        },
      ),
    ]),
  );
}
