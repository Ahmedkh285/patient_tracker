import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Utils.dart';

class AdDoctors extends StatefulWidget {
  AdDoctors(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot<Object?>? doc;
  @override
  _AdDoctorsState createState() => _AdDoctorsState();
}

class _AdDoctorsState extends State<AdDoctors> {
  late BuildContext dialogContext;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/4907157.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/black.jpg'),
                  ),
                  color: Colors.white,
                ),
                child: Text(''),
              ),
              ListTile(
                title: const Text('My Profile'),
                onTap: () {
                  Navigator.pushNamed(context, 'dr_profile');
                },
              ),
              ListTile(
                title: const Text('My Patients'),
                onTap: () {
                  Navigator.pushNamed(context, 'dr_patients');
                },
              ),
              ListTile(
                title: const Text('Sign out'),
                onTap: () {
                  Navigator.pushNamed(context, 'start');
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 80),
              child: Text(
                'Dr ${widget.doc!["name"]}',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                '${widget.doc!["spec"]}.',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 200)),
                  SizedBox(
                      height: 200,
                      child: Image.network(widget.doc!["cardUrl"])),
                  SizedBox(
                    height: 20,
                  ),
                  widget.doc!["verified"] == "0"
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            padding: const EdgeInsets.all(16.0),
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  dialogContext = context;
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                });
                            FirebaseFirestore.instance
                                .collection('doctors')
                                .doc(widget.doc!["userId"])
                                .update({'verified': '1'}).then((_) {
                              buildShowSnackBar(context, "Accepted success");
                              Navigator.pop(context);
                              Navigator.pop(dialogContext);
                            }).catchError((error) {
                              buildShowSnackBar(context, "error");
                            });
                          },
                          child: Text(
                            "                     Accept                  ",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: 20,
                  ),
                  widget.doc!["verified"] == "0"
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            padding: const EdgeInsets.all(16.0),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "                    Decline                   ",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 25,
                              color: Colors.red,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
