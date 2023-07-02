import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Utils.dart';
import '../firebase_helper/fireBaseHelper.dart';
import '../provider/my_provider.dart';

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.white;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
} //checkbox not working can you find the error please?

class PtRegister extends StatefulWidget {
  const PtRegister({Key? key}) : super(key: key);

  @override
  _PtRegisterState createState() => _PtRegisterState();
}

class _PtRegisterState extends State<PtRegister> {
  var name = "";
  var email = "";
  var password = "";
  late BuildContext dialogContext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('   Register Now',style: GoogleFonts.lato(               color: Color.fromRGBO(83, 113, 136,1), fontWeight: FontWeight.bold,fontSize: 35),),
            ),
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.09,
                    left: 35,
                    right: 35,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        elevation:5,
                        borderRadius: BorderRadius.circular(10),
                        child: TextField(
                          onChanged: (val) {
                            name = val;
                          },
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
                            hintText: "Name",
                            hintStyle: const TextStyle(               color: Color.fromRGBO(83, 113, 136,1),),
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
                          onChanged: (val) {
                            email = val;
                          },
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
                            hintText: "Email",
                            hintStyle: const TextStyle(               color: Color.fromRGBO(83, 113, 136,1),
                            ),
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
                          onChanged: (val) {
                            password = val;
                          },
                          obscureText: true,
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
                            hintText: "Password",
                            hintStyle: const TextStyle(              color: Color.fromRGBO(83, 113, 136,1),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Spacer(),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor:  Color.fromRGBO(83, 113, 136,1),


                  child: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                if (email.isEmpty ||
                                    password.isEmpty ||
                                    name.isEmpty) {
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
                                      .signUp(
                                          email: email.trim().toString(),
                                          password: password.trim().toString())
                                      .then((result) {
                                    if (result == "true") {
                                      Navigator.pushReplacementNamed(
                                          context, 'pt_login');
                                      Provider.of<MyProvider>(context,
                                              listen: false)
                                          .auth
                                          .currentUser!
                                          .updateDisplayName(
                                              name.trim().toString());
                                      FireBaseHelper().addPatient(
                                        Provider.of<MyProvider>(context,
                                                listen: false)
                                            .auth
                                            .currentUser!
                                            .uid,
                                        name,
                                        email,
                                        "0",
                                      );
                                      buildShowSnackBar(
                                          context, "Now You Can Login");
                                    } else if (result != null) {
                                      buildShowSnackBar(context, result);
                                      Navigator.pop(dialogContext);
                                    } else {
                                      Navigator.pop(dialogContext);
                                      buildShowSnackBar(context, "Try again.");
                                    }
                                  }).catchError((e) {
                                    Navigator.pop(dialogContext);
                                    buildShowSnackBar(context, e.toString());
                                  });
                                }
                              },
                              icon: const Icon(
                                Icons.arrow_forward,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'pt_login');
                        },
                        child:  Text(
                          "I have an account",
                          style: GoogleFonts.lato(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Color.fromRGBO(83, 113, 136,1),

                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
