import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../firebase_helper/fireBaseHelper.dart';
import '../provider/my_provider.dart';

class DrPatients extends StatefulWidget {
  DrPatients({Key? key}) : super(key: key);

  @override
  _DrPatientsState createState() => _DrPatientsState();
}

class _DrPatientsState extends State<DrPatients> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.keyboard_arrow_left,size: 30,),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(22, 75, 96,1),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Patients',style: GoogleFonts.lato( color: const Color.fromRGBO(22, 75, 96,1),fontWeight: FontWeight.bold),),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Material(
                  elevation: 5,
                  borderOnForeground: false,
                  borderRadius: BorderRadius.circular(10),
                  child: TextField(

                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    decoration:  InputDecoration(
                      enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: 'Search by email',
                      prefixIcon: const Icon(Icons.search),
                      border: InputBorder.none,

                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                    ),
                  ),
                ),
              ),
            ),
            _searchQuery.isNotEmpty
                ? StreamBuilder(
                    stream: FireBaseHelper()
                        .getFilteredPatient(context, _searchQuery),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong try again');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return snapshot.data!.size == 0
                          ? const Text(
                              'No patients found',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 33),
                            )
                          : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          reverse: true,
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {},
                                    child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 8.0),
                                                      child: Text(
                                                        snapshot.data!
                                                                .docs[index]
                                                            ['name'],
                                                        style: const TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      snapshot.data!.docs[index]
                                                          ['email'],
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.grey[600],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          Provider.of<MyProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .startChattingWithPatient(
                                                                  snapshot,
                                                                  index,
                                                                  context);
                                                        },
                                                        icon: const Icon(
                                                            Icons.chat))
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )));
                              });
                    },
                  )
                : StreamBuilder(
                    stream: FireBaseHelper().getPatient(context),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong try again');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return snapshot.data!.size == 0
                          ? Container(
                              padding: const EdgeInsets.only(left: 35, top: 80),
                              child: const Text(
                                '     No patients found',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 33),
                              ),
                            )
                          : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          reverse: true,
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Card(
                                      color: Color.fromRGBO(22, 75, 96,1),
                                      elevation: 10,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: Text(
                                                    snapshot.data!
                                                            .docs[index]
                                                        ['name'],
                                                    style: GoogleFonts.lato(
                                                      color: Colors.white,
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  snapshot.data!.docs[index]
                                                      ['email'],
                                                  style: GoogleFonts.lato(
                                                    fontSize: 16.0,
                                                    color: Colors.grey[500],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      Provider.of<MyProvider>(
                                                              context,
                                                              listen: false)
                                                          .startChattingWithPatient(
                                                              snapshot,
                                                              index,
                                                              context);
                                                    },
                                                    icon: const Icon(
                                                        Icons.chat,color: Colors.white,))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ));
                              });
                    },
                  )
          ],
        ),
      ),
    );
  }
}
