import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils.dart';
import '../firebase_helper/fireBaseHelper.dart';

class PtLogin extends StatefulWidget {
  PtLogin({Key? key}) : super(key: key);

  @override
  _PtLoginState createState() => _PtLoginState();
}

class _PtLoginState extends State<PtLogin> {
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
            height: 170,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(83, 113, 136,1),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(120))
            ),

            child: Center(
              child: Text(
                'Welcome Back',
                style: GoogleFonts.lato(color: Colors.white, fontSize: 33,fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.5,
                left: 35,
                right: 35,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: TextField(
                      onChanged: (val) {
                        email = val;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        hintText: "(Patient)Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
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
                        fillColor: Colors.grey[200],
                        filled: true,
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
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
                        fontSize: 12,
                        color: Color.fromRGBO(83, 113, 136,1),

                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor:            Color.fromRGBO(83, 113, 136,1),

              child: IconButton(
                          color: Colors.black,
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
                                  Navigator.pushReplacementNamed(
                                      context, 'pt_home');
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
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'pt_register');
                        },
                        child:  Text(
                          "Sing Up",
                          style: GoogleFonts.lato(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Color.fromRGBO(83, 113, 136,1),

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
