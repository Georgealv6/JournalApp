import 'package:journalapp/colors/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WrittenNotes extends StatefulWidget {
  const WrittenNotes({Key? key}) : super(key: key);

  @override
  _WrittenNotesPage createState() => _WrittenNotesPage();
}

class _WrittenNotesPage extends State<WrittenNotes> {
  String title = 'AlertDialog';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Journal'd",
          style: TextStyle(color: kPrimaryColor2),
        ),
        backgroundColor: kBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 18.5,
                bottom: 10,
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Weekly Challenge",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    TextSpan(
                      text: "\nCompliment a stranger",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "I Am Grateful For...",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.brown[600]),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 50,
                left: 50,
                bottom: 10,
              ),
              child: TextFormField(
                style: const TextStyle(color: Colors.brown),
                cursorColor: Colors.brown,
                decoration: const InputDecoration(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 50,
                left: 50,
                bottom: 10,
              ),
              child: TextFormField(
                style: const TextStyle(color: Colors.brown),
                cursorColor: Colors.brown,
                decoration: const InputDecoration(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 50,
                left: 50,
                bottom: 15,
              ),
              child: TextFormField(
                style: const TextStyle(color: Colors.brown),
                cursorColor: Colors.brown,
                decoration: const InputDecoration(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "What Would Make Today Great?",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.brown[600]),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 50,
                left: 50,
                bottom: 10,
              ),
              child: TextFormField(
                style: const TextStyle(color: Colors.brown),
                cursorColor: Colors.brown,
                decoration: const InputDecoration(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 50,
                left: 50,
                bottom: 5,
              ),
              child: TextFormField(
                style: const TextStyle(color: Colors.brown),
                cursorColor: Colors.brown,
                decoration: const InputDecoration(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 50,
                left: 50,
                bottom: 5,
              ),
              child: TextFormField(
                style: const TextStyle(color: Colors.brown),
                cursorColor: Colors.brown,
                decoration: const InputDecoration(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Daily Affirmations, I am..",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.brown[600]),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 50,
                left: 50,
                bottom: 27,
              ),
              child: TextFormField(
                style: const TextStyle(color: Colors.brown),
                cursorColor: Colors.brown,
                decoration: const InputDecoration(),
              ),
            ),
            Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                      color: Colors.grey,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Good Things That Happened Today",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 90,
                    right: 50,
                    left: 50,
                  ),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    right: 50,
                    left: 50,
                  ),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 170,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "How Could I Have Made Today Better",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 195,
                    right: 50,
                    left: 50,
                  ),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 250,
                    right: 50,
                    left: 50,
                    bottom: 40,
                  ),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
