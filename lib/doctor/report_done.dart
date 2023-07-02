import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient_tracker/doctor/dr_home.dart';

class ReportDone extends StatelessWidget {
  const ReportDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('Report Add Successfully',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),),

        ],
      ),
        floatingActionButton:FloatingActionButton(
          onPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>DrHome()), (route) => false);
          },
child: Icon(Icons.home),
        )
    );
  }
}
