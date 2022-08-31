import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class HomeSessions extends StatefulWidget {
  @override
  State<HomeSessions> createState() => _HomeSessionsState();
}

class _HomeSessionsState extends State<HomeSessions> {
  late Query ref;

  @override
  void initState() {
    super.initState();
    ref = FirebaseDatabase.instance
        .reference()
        .child('sessions')
        .child('30-05-2022');
  }

  Widget _buildSessionItem({required Map session}) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person,
            size: 20,
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            session['name'],
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FirebaseAnimatedList(
      query: ref,
      itemBuilder: (BuildContext context, DataSnapshot snapshot,
          Animation<double> animation, int index) {
            Map session = snapshot.value as Map;
            print("I am here!" + session.toString());
            return _buildSessionItem(session: session);
      },
    );
  }
}
