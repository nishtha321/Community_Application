import "package:flutter/material.dart";

class MessageTile extends StatefulWidget {
  final String message;
  final String sender;
  final bool sentByte;
  MessageTile({super.key, required this.message, required this.sender, required this.sentByte});

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return  Container(
      padding: EdgeInsets.only(
        top: 4, bottom: 4, left: widget.sentByte ? 0 : 24, right: widget.sentByte ? 24 : 0,
        
      ),
      alignment: widget.sentByte ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: widget.sentByte ?  const EdgeInsets.only(left: 30) : const EdgeInsets.only(right: 30),
        padding: const EdgeInsets.only(top: 17,bottom: 17,left: 20,right: 20),
        decoration: BoxDecoration(
          borderRadius: widget.sentByte ? const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft:  Radius.circular(20),
          ) : const  BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight:  Radius.circular(20),
          ),
          color: widget.sentByte ? Theme.of(context).primaryColor :Colors.grey[700],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.sender.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.white,letterSpacing: -0.5),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.message,
              textAlign: TextAlign.center,
              
              style: const TextStyle(fontSize: 16,color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
