import 'package:flutter/material.dart';

class DrProfile extends StatefulWidget {
  DrProfile({Key? key}) : super(key: key);

  @override
  _DrProfileState createState() => _DrProfileState();
}

class _DrProfileState extends State<DrProfile> {
  // show the dialog

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
              width: 200,
              height: 200,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                //backgroundImage: AssetImage('assets/images/tota.JPG'),
              ),
              padding: EdgeInsets.only(left: 0, top: 30),
            ),
            Container(
              padding: EdgeInsets.only(left: 250, top: 120),
              child: Text(
                'Doctor\nName',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 300,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      padding: const EdgeInsets.all(16.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'dr_patients');
                    },
                    child: Text(
                      "                 My Patients                 ",
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
                      Navigator.pushNamed(context, 'dr_profile');
                    },
                    child: Text(
                      "                 Edit my profile             ",
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
                      Widget cancelButton = TextButton(
                        child: Text("No"),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      );
                      Widget continueButton = TextButton(
                        child: Text("Yes"),
                        onPressed: () {
                          Navigator.pushNamed(context, 'start');
                        },
                      );

                      // set up the AlertDialog
                      AlertDialog alert = AlertDialog(
                        title: Text("Your account will be deleted"),
                        content: Text(
                            "Are you sure you want to delete your account?"),
                        actions: [
                          cancelButton,
                          continueButton,
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    },
                    child: Text(
                      "            Delete my account          ",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 25,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
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
