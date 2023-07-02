import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/my_provider.dart';

class PtProfile extends StatefulWidget {
  PtProfile({Key? key}) : super(key: key);

  @override
  _PtProfileState createState() => _PtProfileState();
}

class _PtProfileState extends State<PtProfile> {
  // show the dialog

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left,size: 30,),
        ),
        titleSpacing: 0,
        backgroundColor:   Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
            color: Color.fromRGBO(83, 113, 136,1)
        ),
        title:
        Text('Profile',style: GoogleFonts.lato(color:Color.fromRGBO(83, 113, 136,1)),),

      ),
      backgroundColor: Colors.white,
      body: Column(

        children: [
          SizedBox(height: 20,),
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
                      gradient:  const LinearGradient(
                        colors: [ Color.fromRGBO(83, 113, 136,1),Colors.black87],
                      ),
                    ),
                  ),
                ),
              ),
               Positioned(
                  top: -10,
                  left: 40,
                  child:   Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,

                        image: DecorationImage(image: AssetImage(('assets/images/70.jpg')),fit: BoxFit.cover)
                    ),
                    height: 120,
                    width: 120,
                  ),

              ),
              Positioned(
                top: 140,
                left: 50,
                child: Text(
                  'Name:  ${Provider.of<MyProvider>(context,listen: false).auth.currentUser!.displayName}',
                  style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white,),
                ),
              ),
              Positioned(
                top: 170,
                left: 50,
                child: Text(
                  'Email:  ${Provider.of<MyProvider>(context,listen: false).auth.currentUser!.email}',
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
                        gradient:  const LinearGradient(
                          colors: [ Color.fromRGBO(83, 113, 136,1),Colors.black87],
                        ),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text('My Doctors',style: GoogleFonts.lato(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                            const SizedBox(height: 20,),
                            const Icon(Icons.people,size: 60,color: Colors.white,)
                          ],
                        ),
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, 'pt_doctors');
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
                        gradient:  const LinearGradient(
                          colors: [ Color.fromRGBO(83, 113, 136,1),Colors.black87],
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
                    Navigator.pushNamed(context, 'pt_profile');
                  },
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient:  const LinearGradient(
                  colors: [ Color.fromRGBO(83, 113, 136,1),Colors.black87],
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
                          child: Text("No"),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                        );
                        Widget continueButton = TextButton(
                          child: Text("Yes"),
                          onPressed: () {
                            Navigator.pushNamed(context, 'start');
                          },
                        );

                        // set up the AlertDialog
                        AlertDialog alert = AlertDialog(
                          title: Text("Your account will be deleted"),
                          content: Text(
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
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: IconButton(
                  //padding: EdgeInsets.only(top: 50),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pushNamed(context, 'pt_chats');
                  },
                  icon: Icon(
                    Icons.chat,
                    size: 30,
                    color: Color.fromRGBO(83, 113, 136,1),
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: IconButton(
                  //padding: EdgeInsets.only(top: 50),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pushNamed(context, 'pt_home');
                  },
                  icon: Icon(
                    Icons.home,
                    size: 30,
                    color: Color.fromRGBO(83, 113, 136,1),
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: IconButton(
                  //padding: EdgeInsets.only(top: 50),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pushNamed(context, 'pt_profile');
                  },
                  icon: Icon(
                    Icons.account_box,
                    color: Color.fromRGBO(83, 113, 136,1),
                    size: 30,
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: IconButton(
                  //padding: EdgeInsets.only(top: 50),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pushNamed(context, 'pt_med_his');
                  },
                  icon: Icon(
                    Icons.medical_services_rounded,
                    size: 30,
                    color: Color.fromRGBO(83, 113, 136,1),
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
