import 'dart:ffi';

import 'package:flutter/material.dart';

class AdHome extends StatefulWidget {
  AdHome({Key? key}) : super(key: key);

  @override
  _AdHomeState createState() => _AdHomeState();
}

class _AdHomeState extends State<AdHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/black2.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/black.jpg'),
                  ),
                  color: Colors.white,
                ),
                child: Text(''),
              ),
              ListTile(
                title: const Text('My Profile'),
                onTap: () {
                  Navigator.pushNamed(context, 'dr_profile');
                },
              ),
              ListTile(
                title: const Text('My Patients'),
                onTap: () {
                  Navigator.pushNamed(context, 'dr_patients');
                },
              ),
              ListTile(
                title: const Text('Sign out'),
                onTap: () {
                  Navigator.pushNamed(context, 'start');
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 80),
              child: Text(
                'Hello admin!',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Next doctors are waiting                                  for verification.',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 200)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      padding: const EdgeInsets.all(16.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'ad_doctors');
                    },
                    child: Text(
                      "                     doctors                    ",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 411,
                        height: 210,
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
