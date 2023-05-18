import 'package:flutter/material.dart';

class FindDoctor extends StatefulWidget {
  const FindDoctor({Key? key}) : super(key: key);

  @override
  _FindDoctorState createState() => _FindDoctorState();
}

class _FindDoctorState extends State<FindDoctor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/black2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 10),
              child: Text(
                'Find \nA Doctor',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.14,
                  left: 35,
                  right: 35,
                ),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintText: "Doctor username (ID)",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 350,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: IconButton(
                            //padding: EdgeInsets.only(top: 50),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pushNamed(context, 'pt_chat');
                            },
                            icon: Icon(
                              Icons.chat,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: IconButton(
                            //padding: EdgeInsets.only(top: 50),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pushNamed(context, 'pt_home');
                            },
                            icon: Icon(
                              Icons.home,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: IconButton(
                            //padding: EdgeInsets.only(top: 50),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pushNamed(context, 'pt_profile');
                            },
                            icon: Icon(
                              Icons.account_box,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: IconButton(
                            //padding: EdgeInsets.only(top: 50),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pushNamed(context, 'pt_profile');
                            },
                            icon: Icon(
                              Icons.alarm,
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
