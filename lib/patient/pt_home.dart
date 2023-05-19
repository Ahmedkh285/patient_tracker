import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/my_provider.dart';
import '../widget/patient_recent_chats.dart';

class PtHome extends StatefulWidget {
  PtHome({Key? key}) : super(key: key);

  @override
  _PtHomeState createState() => _PtHomeState();
}

class _PtHomeState extends State<PtHome> {
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
          actions: [
            IconButton(onPressed: (){
              Navigator.pushNamed(context, 'pt_doctors');

            }, icon: Icon(Icons.people))
          ],
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
                  Navigator.pushNamed(context, 'pt_profile');
                },
              ),
              ListTile(
                title: const Text('My Doctors'),
                onTap: () {
                  Navigator.pushNamed(context, 'pt_doctors');
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
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 80),
              child: Text(
                'Hello ${Provider.of<MyProvider>(context,listen: false).auth.currentUser!.displayName}',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            PatientRecentChats(),
          ],
        ),
      ),
    );
  }
}
