import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_tracker/doctor/write_report.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddReport extends StatefulWidget {
  @override
  State<AddReport> createState() => _AddReportState();
}

class _AddReportState extends State<AddReport> {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var textController = TextEditingController();

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
        title: Text('Add Report',style: GoogleFonts.lato( color: const Color.fromRGBO(22, 75, 96,1),fontWeight: FontWeight.bold),),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(),
                    gradient: const LinearGradient(
                      colors: [Color.fromRGBO(22, 75, 96,1),Colors.black87],
                    ),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          'Add the user id here',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This field must not be empty';
                              }
                              return null;
                            },

                            controller: textController,
                            decoration: InputDecoration(

                                label:  Text(
                                  'Add the user id here',
                                  style: GoogleFonts.lato(color: Colors.white),
                                ),
                                floatingLabelStyle:
                                    const TextStyle(color: Colors.black87),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 1)))),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: InkWell(
                              child: Container(
                                  height: 50,
                                  width: 280,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                       Text(
                                        'Next',
                                        style: GoogleFonts.lato(
                                            color: Colors.black,
                                            fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )),
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  FirebaseFirestore.instance
                                      .collection('patients')
                                      .doc(textController.text)
                                      .get()
                                      .then(
                                          (DocumentSnapshot documentSnapshot) {
                                    if (documentSnapshot.exists) {
                                      // Document with the given ID exists
                                      // Navigate to another page
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WriteReport(textController.text)),
                                      );
                                    } else {
                                      // No document with the given ID
                                      // Show a dialog or alert to notify the user
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('No Document Found'),
                                            content: const Text(
                                                'No document with this ID exists.'),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text('OK'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  });
                                }
                              }),
                        )
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
