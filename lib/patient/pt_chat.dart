import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../firebase_helper/fireBaseHelper.dart';
import '../provider/my_provider.dart';
import '../widget/message_compose.dart';
import '../widget/messages_list.dart';
import '../widget/patient_sub_title_app_bar.dart';

class PtChat extends StatefulWidget {
  PtChat({Key? key}) : super(key: key);

  @override
  _PtChatState createState() => _PtChatState();
}

class _PtChatState extends State<PtChat> with WidgetsBindingObserver{
  late MyProvider _appProvider;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    FireBaseHelper().updatePatientStatus("Online",Provider.of<MyProvider>(context,listen: false).auth.currentUser!.uid);
    // updatePeerDevice(Provider.of<MyProvider>(context,listen: false).auth.currentUser!.email, Provider.of<MyProvider>(context,listen: false).peerUserData!["email"]);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _appProvider = Provider.of<MyProvider>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    FireBaseHelper().updatePatientStatus(FieldValue.serverTimestamp(),_appProvider.auth.currentUser!.uid);
    // updatePeerDevice(_appProvider.auth.currentUser!.email, "0");
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch(state)
    {
      case AppLifecycleState.paused:
        FireBaseHelper().updatePatientStatus(FieldValue.serverTimestamp(),Provider.of<MyProvider>(context,listen: false).auth.currentUser!.uid);
        // updatePeerDevice(Provider.of<MyProvider>(context,listen: false).auth.currentUser!.email, "0");
        break;
      case AppLifecycleState.inactive:
        FireBaseHelper().updatePatientStatus(FieldValue.serverTimestamp(),Provider.of<MyProvider>(context,listen: false).auth.currentUser!.uid);
        // updatePeerDevice(Provider.of<MyProvider>(context,listen: false).auth.currentUser!.email, "0");
        break;
      case AppLifecycleState.detached:
        FireBaseHelper().updatePatientStatus(FieldValue.serverTimestamp(),Provider.of<MyProvider>(context,listen: false).auth.currentUser!.uid);
        // updatePeerDevice(Provider.of<MyProvider>(context,listen: false).auth.currentUser!.email, "0");
        break;
      case AppLifecycleState.resumed:
        FireBaseHelper().updatePatientStatus("Online",Provider.of<MyProvider>(context,listen: false).auth.currentUser!.uid);
        // updatePeerDevice(Provider.of<MyProvider>(context,listen: false).auth.currentUser!.email, Provider.of<MyProvider>(context,listen: false).peerUserData!["email"]);
        break;
    }    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Color.fromRGBO(83, 113, 136,1),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.chevron_left,size: 30,),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Provider.of<MyProvider>(context,listen: false).peerUserData!["name"],
                  style:  GoogleFonts.lato(fontSize: 18.5, fontWeight: FontWeight.bold)),
              const PatientSubTitleAppBar(),
            ],
          ),
        ),
        body:Column(
          children:  const [
            Expanded(child: Messages(),),
            MessagesCompose(),
          ],
        )

    );
  }
}
