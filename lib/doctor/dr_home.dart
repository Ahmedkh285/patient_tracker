import 'package:flutter/material.dart';

class DrHome extends StatefulWidget {
  DrHome({Key? key}) : super(key: key);

  @override
  _DrHomeState createState() => _DrHomeState();
}

class _DrHomeState extends State<DrHome> {
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
                'Hello doctor!',
                style: TextStyle(color: Colors.white, fontSize: 33),
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
                      Navigator.pushNamed(context, 'dr_patients');
                    },
                    child: Text(
                      "                     Patients                    ",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      padding: const EdgeInsets.all(16.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'add_patient');
                    },
                    child: Text(
                      "             Add a new patient           ",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: IconButton(
                          //padding: EdgeInsets.only(top: 50),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pushNamed(context, 'dr_chats');
                          },
                          icon: Icon(
                            Icons.chat,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: IconButton(
                          //padding: EdgeInsets.only(top: 50),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pushNamed(context, 'dr_home');
                          },
                          icon: Icon(
                            Icons.home,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: IconButton(
                          //padding: EdgeInsets.only(top: 50),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pushNamed(context, 'dr_profile');
                          },
                          icon: Icon(
                            Icons.account_box,
                          ),
                        ),
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
