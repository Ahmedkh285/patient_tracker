import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({Key? key}) : super(key: key);

  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.keyboard_arrow_left,size: 30,),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(22, 75, 96,1),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Add New Patient',style: GoogleFonts.lato( color: const Color.fromRGBO(22, 75, 96,1),fontWeight: FontWeight.bold),),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                left: 35,
                right: 35,
              ),
              child: Column(
                children: [
                  Material(
                    child: TextField(

                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Patient ID",
                        hintStyle: const TextStyle(color: Color.fromRGBO(22, 75, 96,1),),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "(Patient) Name",
                        hintStyle: const TextStyle(   color: Color.fromRGBO(22, 75, 96,1),),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                        ),
                        hintText: "(Patient) Age",
                        hintStyle: const TextStyle(     color: Color.fromRGBO(22, 75, 96,1),),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:BorderSide.none,
                        ),
                        hintText: "(Patient) Email",
                        hintStyle: const TextStyle(     color: Color.fromRGBO(22, 75, 96,1),),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 70,
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
                           child: Text(
                            'Add Patient',
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 27,
                                fontWeight: FontWeight.w700),
                        ),
                         ),
                        const Spacer(),
                        IconButton(onPressed:(){
                          Navigator.pushNamed(context, 'dr_home');
                        }, icon: Icon(Icons.chevron_right_outlined,color: Colors.white,size: 30,)),
                        SizedBox(width: 5,),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: IconButton(
                          //padding: EdgeInsets.only(top: 50),
                          color: Color.fromRGBO(22, 75, 96,1),
                          onPressed: () {
                            Navigator.pushNamed(context, 'dr_patients');
                          },
                          icon: const Icon(
                            Icons.chat,
                            size: 30,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: IconButton(
                          //padding: EdgeInsets.only(top: 50),
                          color: Color.fromRGBO(22, 75, 96,1),
                          onPressed: () {
                            Navigator.pushNamed(context, 'dr_home');
                          },
                          icon: const Icon(
                            Icons.home,
                            size: 30,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: IconButton(
                          //padding: EdgeInsets.only(top: 50),
                          color: Color.fromRGBO(22, 75, 96,1),
                          onPressed: () {
                            Navigator.pushNamed(context, 'dr_profile');
                          },
                          icon: const Icon(
                            Icons.account_box,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
