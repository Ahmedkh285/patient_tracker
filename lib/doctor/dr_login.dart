import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/black2.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Welcome\nBack',
                style: TextStyle(color: Colors.white, fontSize: 33),
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
                  children: [
                    TextField(
                      onChanged: (val){
                        email = val;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        filled: true,
                        hintText: "(Doctor)Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      onChanged: (val){
                        password = val;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        filled: true,
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sing In',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.w700),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xff4c505b),
                          child: IconButton(
                            color: Colors.white,
                            onPressed: () {
                              if(email.isEmpty || password.isEmpty ){
                                buildShowSnackBar(context, "please check your info.");
                              }else {
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      dialogContext = context;
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                );
                                FireBaseHelper()
                                    .signIn(email: email.trim().toString(), password: password.trim().toString())
                                    .then((result) async {

                                  if(result == "Welcome"){
                                    var collection = FirebaseFirestore.instance.collection('doctors');
                                    var docSnapshot = await collection.doc(Provider.of<MyProvider>(context,listen: false).auth.currentUser!.uid).get();
                                    if (docSnapshot.exists) {
                                      Map<String, dynamic> data = docSnapshot.data()!;

                                      data.forEach((key, value) {
                                        if(key.contains("verified")) {
                                          print("bego012${value}");
                                          if (value == "1") {
                                            Navigator.pop(dialogContext);

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => DrHome()),
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
                                  }
                                  else {
                                    Navigator.pop(dialogContext);
                                    buildShowSnackBar(context, "Try again.");
                                  }
                                }).catchError((e) {
                                  Navigator.pop(dialogContext);
                                });
                              }
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'dr_register');
                          },
                          child: Text(
                            "Sing Up",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Colors.white,
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
      ),
    );
  }
}
