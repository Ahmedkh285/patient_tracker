import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/my_provider.dart';

class DrProfile extends StatefulWidget {
  DrProfile({Key? key}) : super(key: key);

  @override
  _DrProfileState createState() => _DrProfileState();
}

class _DrProfileState extends State<DrProfile> {
  // show the dialog

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 30,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(22, 75, 96, 1),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Profile',
          style: GoogleFonts.lato(
              color: const Color.fromRGBO(22, 75, 96, 1),
              fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [Color.fromRGBO(22, 75, 96, 1), Colors.black87],
                        ),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                    top: -60,
                    left: 40,
                    child: Image(image: AssetImage('assets/images/12.png'))),
                Positioned(
                  top: 140,
                  left: 50,
                  child: Text(
                    'Dr:  ${Provider.of<MyProvider>(context,listen: false).auth.currentUser!.displayName}',
                    style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white,),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  InkWell(
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                            colors: [Color.fromRGBO(22, 75, 96, 1), Colors.black87],
                          ),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text('My Patients',style: GoogleFonts.lato(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                              const SizedBox(height: 20,),
                              const Icon(Icons.people,size: 60,color: Colors.white,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.pushNamed(context, 'dr_patients');
                    },
                  ),
                  const Spacer(),
                  InkWell(
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                            colors: [Color.fromRGBO(22, 75, 96, 1), Colors.black87],
                          ),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text('Edit My Profile',style: GoogleFonts.lato(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                              const SizedBox(height: 25,),
                              const Icon(Icons.edit,size: 60,color: Colors.white,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.pushNamed(context, 'dr_profile');
                    },
                  ),

                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 60,
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
                      padding: const EdgeInsets.only(left:20),
                      child: Text('Delete My Account',style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: (){
                          Widget cancelButton = TextButton(
                            child: const Text("No"),
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                          );
                          Widget continueButton = TextButton(
                            child: const Text("Yes"),
                            onPressed: () {
                              Navigator.pushNamed(context, 'start');
                            },
                          );

                          // set up the AlertDialog
                          AlertDialog alert = AlertDialog(
                            title: const Text("Your account will be deleted"),
                            content: const Text(
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
                        icon: const Icon(Icons.delete,color: Colors.red,size: 30,))
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: IconButton(
                    //padding: EdgeInsets.only(top: 50),
                    color: const Color.fromRGBO(22, 75, 96,1),
                    onPressed: () {
                      Navigator.pushNamed(context, 'dr_chats');
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
                    color: const Color.fromRGBO(22, 75, 96,1),                              onPressed: () {
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
                    color: const Color.fromRGBO(22, 75, 96,1),                              onPressed: () {
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
    );
  }
}
