import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../Utils.dart';
import '../firebase_helper/fireBaseHelper.dart';
import '../provider/my_provider.dart';

class DrRegister extends StatefulWidget {
  const DrRegister({Key? key}) : super(key: key);

  @override
  _DrRegisterState createState() => _DrRegisterState();
}

class _DrRegisterState extends State<DrRegister> {
  final ImagePicker _picker = ImagePicker();
  var name = "";
  var spec = "";
  var email = "";
  var password = "";
  var cardUrl = "";
  late BuildContext dialogContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Container(
              padding: const EdgeInsets.only(left: 35, top: 10),
              child:  Text(
                'Create Account',
                style: GoogleFonts.lato( color: const Color.fromRGBO(22, 75, 96,1), fontSize: 33,fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03,
                  left: 35,
                  right: 35,
                ),
                child: Column(
                  children: [
                    Material(
                      
                      child: TextField(

                        onChanged: (val) {
                          name = val;
                        },
                        decoration: InputDecoration(
                          filled: true,

                          fillColor: Colors.grey.shade200,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Name",
                          hintStyle:
                              const TextStyle( color: Color.fromRGBO(22, 75, 96,1),),
                          border: OutlineInputBorder(

                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      child: TextField(
                        onChanged: (val) {
                          spec = val;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                            BorderSide.none,
                          ),
                          hintText: "Specialization",
                          hintStyle:
                              const TextStyle( color: Color.fromRGBO(22, 75, 96,1),),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      child: TextField(
                        onChanged: (val) {
                          email = val;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Email",
                          hintStyle:
                              const TextStyle( color: Color.fromRGBO(22, 75, 96,1),),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Material(
elevation: 5,
                      borderRadius: BorderRadius.circular(15),
                      child: TextField(
                        onChanged: (val) {
                          password = val;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Password",
                          hintStyle:
                              const TextStyle( color: Color.fromRGBO(22, 75, 96,1),),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                         color: const Color.fromRGBO(22, 75, 96,1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text('Upload your card',style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:    InkWell(
                              onTap: () async {
                                final status = await Permission.storage.request();
                                if (status == PermissionStatus.granted) {
                                  final XFile? photo = await _picker.pickImage(
                                      source: ImageSource.camera);
                                  UploadTask uploadTask = FireBaseHelper()
                                      .getRefFromStorageForUploadImages(
                                      photo, "", context);
                                  uploadFile("", "image", uploadTask, context);
                                } else {
                                  await Permission.storage.request();
                                }
                              },
                              child: SizedBox(
                                  width: 100,
                                  child: cardUrl.isEmpty
                                      ? Image.asset('assets/images/card.png')
                                      : Image.network(cardUrl)),
                            ),

                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor:  const Color.fromRGBO(22, 75, 96,1),
                          child: IconButton(
                            color: Colors.white,
                            onPressed: () {
                              if (email.isEmpty ||
                                  password.isEmpty ||
                                  name.isEmpty ||
                                  spec.isEmpty) {
                                buildShowSnackBar(
                                    context, "please check your info.");
                              } else if (cardUrl.isEmpty) {
                                buildShowSnackBar(
                                    context, "please upload your card.");
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
                                        context, 'dr_login');
                                    Provider.of<MyProvider>(context,
                                            listen: false)
                                        .auth
                                        .currentUser!
                                        .updateDisplayName(
                                            name.trim().toString());
                                    FireBaseHelper().addDoctor(
                                        Provider.of<MyProvider>(context,
                                                listen: false)
                                            .auth
                                            .currentUser!
                                            .uid,
                                        name,
                                        email,
                                        spec,
                                        cardUrl);
                                    buildShowSnackBar(
                                        context, "admin review your account");
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
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'dr_login');
                          },
                          child: const Text(
                            "I have an account",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Color.fromRGBO(22, 75, 96,1),
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

  void uploadFile(String fileName, String fileType, UploadTask uploadTask,
      BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          dialogContext = context;
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    uploadTask.whenComplete(() => {
          Navigator.of(dialogContext).pop(),
          uploadTask.then((fileUrl) {
            fileUrl.ref.getDownloadURL().then((value) {
              setState(() {
                cardUrl = value;
              });
            });
          })
        });
  }
}
