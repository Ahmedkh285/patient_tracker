import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_tracker/doctor/add_report.dart';
import 'package:patient_tracker/provider/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../provider/my_provider.dart';
import '../widget/doctors_recent_chats.dart';

class DrHome extends StatefulWidget {
  DrHome({Key? key}) : super(key: key);

  @override
  _DrHomeState createState() => _DrHomeState();
}

class _DrHomeState extends State<DrHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor:   Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color:  Color.fromRGBO(22, 75, 96,1),
        ),
        title:
        Text(
          'Welcome dr, ${Provider.of<MyProvider>(context,listen: false).auth.currentUser!.displayName}',
          style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.bold,color: const Color.fromRGBO(22, 75, 96,1),),
        ),

      ),
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(22, 75, 96,1),
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(
               curve: Curves.easeInCirc,
               padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(image: AssetImage('assets/images/12.png')),
                  SizedBox(width: 10,),
                  Text(
                    'Dr, ${Provider.of<MyProvider>(context,listen: false).auth.currentUser!.displayName}',
                    style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.bold,color: const Color.fromRGBO(22, 75, 96,1),),
                  ),

                ],
              ),
            ),
            ListTile(
              title:  Text('My Profile',style: GoogleFonts.lato(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
              onTap: () {
                Navigator.pushNamed(context, 'dr_profile');
              },
            ),
            ListTile(
              title:  Text('My Patients',style: GoogleFonts.lato(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
              onTap: () {
                Navigator.pushNamed(context, 'dr_patients');
              },
            ),
            ListTile(
              title:  Text('Sign out',style: GoogleFonts.lato(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
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
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Recent Chat',style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 30, color: const Color.fromRGBO(22, 75, 96,1),),),
              const SizedBox(height: 20,),
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [Color.fromRGBO(22, 75, 96,1),Colors.black87],
                    ),
                  ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: DoctorsRecentChats(),
                    )
                ),
              ),
              const SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AddReport()));

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
                            colors: [Color.fromRGBO(22, 75, 96,1),Colors.black87],
                        ),

                      ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('Add Report',style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                        ),
                        const SizedBox(width: 10,),
                        const Icon(CupertinoIcons.news,size: 24,color: Colors.white,),
                        const Spacer(),
                        const Icon(Icons.chevron_right_outlined,color: Colors.white,size: 30,),
                        const SizedBox(width: 10,),

                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, 'add_patient');

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
                            colors: [Color.fromRGBO(22, 75, 96,1),Colors.black87],
                        ),

                      ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('Add New Patient',style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                        ),
                        const SizedBox(width: 10,),
                        const Icon(Icons.person_add,size: 24,color: Colors.white,),
                        const Spacer(),
                        const Icon(Icons.chevron_right_outlined,color: Colors.white,size: 30,),
                        const SizedBox(width: 10,),

                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, 'dr_patients');

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
                            colors: [Color.fromRGBO(22, 75, 96,1),Colors.black87],
                        ),

                      ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text('Patients',style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                        ),
                        const SizedBox(width: 10,),
                        const Icon(Icons.people_alt,size: 24,color: Colors.white,),
                        const Spacer(),
                        const Icon(Icons.chevron_right_outlined,color: Colors.white,size: 30,),
                        const SizedBox(width: 10,),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
