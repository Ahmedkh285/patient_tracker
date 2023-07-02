import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_tracker/patient/reports.dart';
import 'package:provider/provider.dart';

import '../doctor/add_report.dart';
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
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color.fromRGBO(83, 113, 136, 1)),
        title: Text(
          'Welcome,  ${Provider.of<MyProvider>(context, listen: false).auth.currentUser!.displayName}',
          style: GoogleFonts.lato(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color.fromRGBO(83, 113, 136, 1),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(83, 113, 136, 1),
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(('assets/images/70.jpg')),
                              fit: BoxFit.cover)),
                      height: 80,
                      width: 80,
                    ),
                    Text(
                      'Welcome,  ${Provider.of<MyProvider>(context, listen: false).auth.currentUser!.displayName}',
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromRGBO(83, 113, 136, 1),
                      ),
                    ),
                    Text(
                      '${Provider.of<MyProvider>(context, listen: false).auth.currentUser!.email}',
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        color: const Color.fromRGBO(83, 113, 136, 1),
                      ),
                    ),
                  ],
                )),
            ListTile(
              title: Text(
                'My Profile',
                style: GoogleFonts.lato(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'pt_profile');
              },
            ),
            ListTile(
              title: Text(
                'My Doctors',
                style: GoogleFonts.lato(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'pt_doctors');
              },
            ),
            ListTile(
              title: Text('Sign out',
                  style: GoogleFonts.lato(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pushNamed(context, 'start');
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Chat',
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: const Color.fromRGBO(83, 113, 136, 1)),
            ),
            const SizedBox(
              height: 20,
            ),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [Color.fromRGBO(83, 113, 136, 1), Colors.black87],
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: PatientRecentChats(),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Reports()));
              },
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [Color.fromRGBO(83, 113, 136, 1), Colors.black87],
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'View Report',
                          style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        CupertinoIcons.news,
                        size: 24,
                        color: Colors.white,
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.chevron_right_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'pt_med_his');
              },
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [Color.fromRGBO(83, 113, 136, 1), Colors.black87],
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Medical history',
                          style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.history,
                        size: 24,
                        color: Colors.white,
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.chevron_right_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'pt_info');
              },
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [Color.fromRGBO(83, 113, 136, 1), Colors.black87],
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'My Personal Information',
                          style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.history,
                        size: 24,
                        color: Colors.white,
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.chevron_right_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
