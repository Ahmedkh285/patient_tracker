import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_tracker/doctor/report_done.dart';

class WriteReport extends StatelessWidget {
  final id;
  WriteReport(this.id);
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var reportController = TextEditingController();

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
              Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  height: 600,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color.fromRGBO(22, 75, 96,1),Colors.black87],
                    ),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          'Write report here',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(

                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Report must not empty';
                              }
                            },
                            maxLines:12,

                            controller: reportController,
                            decoration:  InputDecoration(
                              errorBorder:const OutlineInputBorder(
                                borderSide:
                                BorderSide(color: CupertinoColors.systemBlue),

                              ) ,
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color:  Colors.white,
                                ),

                              ),

                              focusedBorder: const OutlineInputBorder(

                                borderSide:
                                BorderSide(  width: 2,
                                    color:  Colors.white,),

                              ),
                              alignLabelWithHint: true,
                              label: Text(
                                'Add report here...',
                                style: GoogleFonts.lato(color: Colors.white,),
                              ),
                              floatingLabelStyle:
                              const TextStyle(color:  CupertinoColors.systemBlue),
                            )),
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
                                            fontSize: 20),
                                      ),
                                    ],
                                  )),
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  DocumentSnapshot snapshot = await FirebaseFirestore.instance
                                      .collection("patients")  // Replace with your collection name
                                      .doc(id)
                                      .get();
                                  // Create a map with the current time and the report text
                                  List<Map<String, dynamic>> existingReports = [];
                                  if (snapshot.exists) {
                                    existingReports = List<Map<String, dynamic>>.from(snapshot['reports']);
                                  }

                                  // Create a map with the current time and the report text
                                  Map<String, dynamic> reportData = {
                                    'date': DateTime.now(),
                                    'text': reportController.text,
                                  };

                                  // Add the new report to the existing list
                                  existingReports.add(reportData);

                                  // Update the document with the updated list of reports
                                  await FirebaseFirestore.instance
                                      .collection('patients')  // Replace with your collection name
                                      .doc(id)
                                      .set({
                                    'reports': existingReports,
                                  }, SetOptions(merge: true)); // Use merge option to preserve existing fields

                                  print('Data added to Firebase successfully.');
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const ReportDone()), (route) => false);
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
    );  }
}
