import 'dart:async';
import 'package:flutter/material.dart';

class SenderMessageCard extends StatefulWidget {
    const SenderMessageCard( this.fileName,this.msgType,this.msg, this.time, {Key? key}) : super(key: key);

   final String msg;
   final String time;
    final String msgType;
    final String fileName;

  @override
  State<SenderMessageCard> createState() => _SenderMessageCardState();
}

class _SenderMessageCardState extends State<SenderMessageCard> {

    int? bufferDelay;
   Widget messageBuilder(context){
     Widget body = Container();
     if(widget.msgType == "image"){
       body = Padding(
         padding: const EdgeInsets.only(top: 5,bottom: 5),
         child:SizedBox(
           width: 250,
           height: 250,
           child: InkWell(
             onTap: (){
               showDialog(
                   context: context,
                   builder: (context) {
                     return  Center(
                       child: InteractiveViewer(
                         panEnabled: false,
                         boundaryMargin: const EdgeInsets.all(50),
                         minScale: 0.5,
                         maxScale: 2,
                         child: FadeInImage.assetNetwork(
                           placeholder: 'assets/images/Fading lines.gif',
                           image: widget.msg,
                         ),
                       ),
                     );
                   }
               );
             },
             child: FadeInImage.assetNetwork(
               placeholder: 'assets/images/Fading lines.gif',
               image: widget.msg,
             ),
           ),
         ),
       );
     }
     else if(widget.msgType == "text"){
       body = Padding(
         padding: const EdgeInsets.only(
             left: 10, right: 20, top: 5,bottom: 5),
         child: SelectableText(
           widget.msg,
           style: const TextStyle(
               fontSize: 16,
               color: Colors.white
           ),
         ),
       );
     }
     return body;
   }


    @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Colors.blue,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                messageBuilder(context),

                Padding(
                 padding: const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                 child: Text(widget.time,
                  style:
                  const TextStyle(fontSize: 13, color: Colors.white)),
            )
          ]),
        ));
  }



}

