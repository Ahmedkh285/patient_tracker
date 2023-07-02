import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyStart extends StatefulWidget {
  MyStart({Key? key}) : super(key: key);

  @override
  _MyStartState createState() => _MyStartState();
}

class _MyStartState extends State<MyStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Stack(
        children: [
          Container(
            height: 165,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(60),bottomLeft: Radius.circular(60)),
              color: Color.fromRGBO(22, 75, 96,1),
            ),
            padding: const EdgeInsets.only(left: 80, top: 100),
            child:  Text(
              'Welcome Back',
              style: GoogleFonts.lato(color: Colors.white, fontSize: 33,fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 250,
                    ),
                     Material(
                       elevation: 10,
                       borderRadius: BorderRadius.circular(15),
                       child: Container(
                         height: 100,
                         width: double.infinity,
                         decoration: BoxDecoration(
                           color: Color.fromRGBO(22, 75, 96,1),                           borderRadius: BorderRadius.circular(15),
                         ),
                         child: Padding(
                           padding: const EdgeInsets.all(20),
                           child: Row(
                             children: [
                               Text('Login as a doctor',style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                               const Spacer(),
                               IconButton(onPressed: (){
                                 Navigator.pushNamed(context, 'dr_login');
                               }, icon: const Icon(Icons.chevron_right_outlined,size: 40,color: Colors.white,))
                             ],
                           ),
                         ),
                       ),
                     ),
                     const SizedBox(height: 40,),
                     Material(
                       elevation: 10,
                       borderRadius: BorderRadius.circular(15),
                       child: Container(
                         height: 100,
                         width: double.infinity,
                         decoration: BoxDecoration(
                           color: Color.fromRGBO(22, 75, 96,1),                           borderRadius: BorderRadius.circular(15),
                         ),
                         child: Padding(
                           padding: const EdgeInsets.all(20),
                           child: Row(
                             children: [
                               Text('Login as a patient',style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                               const Spacer(),
                               IconButton(onPressed: (){
                                 Navigator.pushNamed(context, 'pt_login');
                               }, icon: const Icon(Icons.chevron_right_outlined,size: 40,color: Colors.white,))
                             ],
                           ),
                         ),
                       ),
                     ),
                    const SizedBox(height: 40,),
                     Material(
                       elevation: 10,
                       borderRadius: BorderRadius.circular(15),
                       child: Container(
                         height: 100,
                         width: double.infinity,
                         decoration: BoxDecoration(
                           color: Color.fromRGBO(22, 75, 96,1),                           borderRadius: BorderRadius.circular(15),
                         ),
                         child: Padding(
                           padding: const EdgeInsets.all(20),
                           child: Row(
                             children: [
                               Text('Login as a admin',style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                               const Spacer(),
                               IconButton(onPressed: (){
                                 Navigator.pushNamed(context, 'ad_login');
                               }, icon: const Icon(Icons.chevron_right_outlined,size: 40,color: Colors.white,))
                             ],
                           ),
                         ),
                       ),
                     ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
