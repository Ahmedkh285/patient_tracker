import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient_tracker/widget/receiver_message_card.dart';
import 'package:patient_tracker/widget/sender_message_card.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../Utils.dart';
import '../provider/my_provider.dart';
import '../firebase_helper/fireBaseHelper.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {



   @override
  Widget build(BuildContext context) {
     return StreamBuilder(
      stream:FireBaseHelper().getMessages(context,chatId: Provider.of<MyProvider>(context,listen: false).getChatId(context)),
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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(child: Text('No messages')),
          ],
        ):
          ListView.builder(
              reverse: true,
              shrinkWrap: true ,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                if (Provider.of<MyProvider>(context,listen: false).auth.currentUser!.uid
                    == snapshot.data!.docs[index]['senderId'].toString()) {
                  return InkWell(
                     onTap: (){

                     },
                    child: SenderMessageCard(
                        snapshot.data!.docs[index]['fileName'].toString(),
                        snapshot.data!.docs[index]['msgType'].toString(),
                        snapshot.data!.docs[index]['message'].toString(),
                        snapshot.data!.docs[index]['msgTime']==null?
                        DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse(Timestamp.now().toDate().toString())):
                        DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse(snapshot.data!.docs[index]['msgTime'].toDate().toString()))
                    ),
                  );
                } else {
                  return InkWell(
                    onTap: (){

                    },
                    child: ReceiverMessageCard(
                        snapshot.data!.docs[index]['fileName'].toString(),
                        snapshot.data!.docs[index]['msgType'].toString(),
                        snapshot.data!.docs[index]['message'].toString(),
                        snapshot.data!.docs[index]['msgTime']==null?
                        DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse(Timestamp.now().toDate().toString())):
                        DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse(snapshot.data!.docs[index]['msgTime'].toDate().toString()))
                    ),
                  );
                }
              });
      },
    );
  }
}