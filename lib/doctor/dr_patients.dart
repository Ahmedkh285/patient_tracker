import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/black2.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Patients"),
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
        body: Column(

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child:  TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search by email',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                ),
              ),
            ),
                _searchQuery.isNotEmpty?
               StreamBuilder(
                 stream:FireBaseHelper().getFilteredPatient(context,_searchQuery),
                 builder:(BuildContext context,
                     AsyncSnapshot<QuerySnapshot> snapshot) {
                   if (snapshot.hasError) {
                     return const Text('Something went wrong try again');
                   }
                   if (snapshot.connectionState == ConnectionState.waiting) {
                     return const Center(
                       child: CircularProgressIndicator(),
                     );
                   }

                   return snapshot.data!.size == 0?
                   const Text(
                     'No patients found',
                     style: TextStyle(color: Colors.white, fontSize: 33),
                   ):
                   ListView.builder(
                       reverse: true,
                       shrinkWrap: true ,
                       itemCount: snapshot.data!.docs.length,
                       itemBuilder: (context, index) {

                         return InkWell(
                             onTap: (){


                             },
                             child:Padding(
                                 padding: const EdgeInsets.all(16.0),
                                 child:Card(
                                   child: Padding(
                                     padding: const EdgeInsets.all(16.0),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [


                                         Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only(right: 8.0),
                                               child: Text(
                                                 snapshot.data!.docs[index]['name'],
                                                 style: const TextStyle(
                                                   fontSize: 20.0,
                                                   fontWeight: FontWeight.bold,
                                                 ),
                                               ),
                                             ),
                                             Text(
                                               snapshot.data!.docs[index]['email'],
                                               style: TextStyle(
                                                 fontSize: 16.0,
                                                 color: Colors.grey[600],
                                               ),
                                             ),
                                           ],
                                         ),
                                         Column(
                                           children: [


                                             IconButton(onPressed: (){
                                               Provider.of<MyProvider>(context,listen: false).startChattingWithPatient(snapshot, index, context);
                                             }, icon: const Icon(Icons.chat))
                                           ],
                                         ) ,
                                       ],
                                     ),
                                   ),
                                 )
                             )
                         );

                       });
                 },
               )
                   :StreamBuilder(
                 stream:FireBaseHelper().getPatient(context),
                 builder:(BuildContext context,
                     AsyncSnapshot<QuerySnapshot> snapshot) {
                   if (snapshot.hasError) {
                     return const Text('Something went wrong try again');
                   }
                   if (snapshot.connectionState == ConnectionState.waiting) {
                     return const Center(
                       child: CircularProgressIndicator(),
                     );
                   }

                   return snapshot.data!.size == 0?
                   Container(
                     padding: const EdgeInsets.only(left: 35, top: 80),
                     child: const Text(
                       '     No patients found',
                       style: TextStyle(color: Colors.white, fontSize: 33),
                     ),
                   ):
                   ListView.builder(
                       reverse: true,
                       shrinkWrap: true ,
                       itemCount: snapshot.data!.docs.length,
                       itemBuilder: (context, index) {

                         return InkWell(
                             onTap: (){


                             },
                             child:Padding(
                                 padding: const EdgeInsets.all(16.0),
                                 child:Card(
                                   child: Padding(
                                     padding: const EdgeInsets.all(16.0),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [


                                         Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Padding(
                                               padding: const EdgeInsets.only(right: 8.0),
                                               child: Text(
                                                 snapshot.data!.docs[index]['name'],
                                                 style: const TextStyle(
                                                   fontSize: 20.0,
                                                   fontWeight: FontWeight.bold,
                                                 ),
                                               ),
                                             ),
                                             Text(
                                               snapshot.data!.docs[index]['email'],
                                               style: TextStyle(
                                                 fontSize: 16.0,
                                                 color: Colors.grey[600],
                                               ),
                                             ),
                                           ],
                                         ),
                                         Column(
                                           children: [


                                             IconButton(onPressed: (){
                                               Provider.of<MyProvider>(context,listen: false).startChattingWithPatient(snapshot, index, context);
                                             }, icon: const Icon(Icons.chat))
                                           ],
                                         ) ,
                                       ],
                                     ),
                                   ),
                                 )
                             )
                         );

                       });
                 },
               )


          ],
        ),
      ),
    );
  }
}
