import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Utils.dart';
import '../firebase_helper/fireBaseHelper.dart';
import '../provider/my_provider.dart';
import 'dr_home.dart';

class DrLogin extends StatefulWidget {
  DrLogin({Key? key}) : super(key: key);

  @override
  _DrLoginState createState() => _DrLoginState();
}

class _DrLoginState extends State<DrLogin> {
  var email = "";
  var password = "";
  late BuildContext dialogContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(60),bottomLeft: Radius.circular(60)),
              color: Color.fromRGBO(22, 75, 96,1),
            ),
            padding: const EdgeInsets.only(left: 80, top: 50),
            child:  Text(
              'Welcome Back',
              style: GoogleFonts.lato(color: Colors.white, fontSize: 33,fontWeight: FontWeight.bold),
            ),
          ),
          const Positioned(
            left: 100,
              top: 100,
              child: Image(image: AssetImage('assets/images/doc.png'))),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.48,
                left: 35,
                right: 35,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(15),
                    child: TextField(
                      onChanged: (val) {
                        email = val;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        hintText: "(Doctor)Email",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(15),
                    elevation: 5,
                    child: TextField(
                      onChanged: (val) {
                        password = val;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child:  Text(
                      "Forgot Password",
                      style: GoogleFonts.lato(
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                        color: Color.fromRGBO(22, 75, 96,1),                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Spacer(),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor:   Color.fromRGBO(22, 75, 96,1),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            if (email.isEmpty || password.isEmpty) {
                              buildShowSnackBar(
                                  context, "please check your info.");
                            } else {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    dialogContext = context;
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  });
                              FireBaseHelper()
                                  .signIn(
                                      email: email.trim().toString(),
                                      password: password.trim().toString())
                                  .then((result) async {
                                if (result == "Welcome") {
                                  var collection = FirebaseFirestore.instance
                                      .collection('doctors');
                                  var docSnapshot = await collection
                                      .doc(Provider.of<MyProvider>(context,
                                              listen: false)
                                          .auth
                                          .currentUser!
                                          .uid)
                                      .get();
                                  if (docSnapshot.exists) {
                                    Map<String, dynamic> data =
                                        docSnapshot.data()!;

                                    data.forEach((key, value) {
                                      if (key.contains("verified")) {
                                        print("bego012${value}");
                                        if (value == "1") {
                                          Navigator.pop(dialogContext);

                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DrHome()),
                                          );
                                        } else {
                                          Navigator.pop(dialogContext);

                                          buildShowSnackBar(context,
                                              "admin review your account");
                                        }
                                      }
                                    });
                                  }
                                } else if (result != null) {
                                  buildShowSnackBar(context, result);
                                  Navigator.pop(dialogContext);
                                } else {
                                  Navigator.pop(dialogContext);
                                  buildShowSnackBar(context, "Try again.");
                                }
                              }).catchError((e) {
                                Navigator.pop(dialogContext);
                              });
                            }
                          },
                          icon: const Icon(
                            Icons.arrow_forward,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'dr_register');
                            },
                            child:  Text(
                              "Sing Up",
                              style: GoogleFonts.lato(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                color: CupertinoColors.white,
                              ),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(22, 75, 96,1),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        width: 100,
                        height: 55,
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
