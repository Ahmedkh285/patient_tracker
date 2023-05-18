import 'package:flutter/material.dart';
import 'doctor/dr_login.dart';
import 'doctor/dr_register.dart';
import 'doctor/dr_home.dart';
import 'doctor/add_patient.dart';
import 'doctor/dr_patients.dart';
import 'doctor/dr_chat.dart';
import 'doctor/dr_profile.dart';
import 'patient/pt_login.dart';
import 'patient/pt_register.dart';
import 'patient/pt_chat.dart';
import 'patient/pt_profile.dart';
import 'patient/pt_home.dart';
import 'patient/pt_doctors.dart';
import 'patient/find_doctor.dart';
import 'admin/ad_login.dart';
import 'admin/ad_home.dart';
import 'admin/ad_doctors.dart';

import 'start.dart';

void main() {
  runApp(const PatientTracker());
}

class PatientTracker extends StatelessWidget {
  const PatientTracker({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'start',
      routes: {
        //routes refers to pages/screens
        'start': (context) => MyStart(),
        'dr_login': (context) => DrLogin(),
        'dr_register': (context) => DrRegister(),
        'pt_login': (context) => PtLogin(),
        'pt_register': (context) => PtRegister(),
        'dr_home': (context) => DrHome(),
        'add_patient': (context) => AddPatient(),
        'dr_patients': (context) => DrPatients(),
        'dr_chats': (context) => DrChats(),
        'dr_profile': (context) => DrProfile(),
        'ad_login': (context) => AdLogin(),
        'ad_home': (context) => AdHome(),
        'ad_doctors': (context) => AdDoctors(),
        'pt_chat': (context) => PtChat(),
        'pt_profile': (context) => PtProfile(),
        'pt_home': (context) => PtHome(),
        'pt_doctors': (context) => PtDoctors(),
        'find_doctor': (context) => FindDoctor(),
      },
    );
  }
}
