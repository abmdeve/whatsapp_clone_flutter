import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:whatsapp_clone_flutter/features/app/theme/style.dart';

class MessageLayout extends StatelessWidget {
  final Color? messageColor;
  final Alignment? alignment;
  final DateTime? createAt;
  //final Timestamp? createAt;
  final Function(DragUpdateDetails)? onSwipe;
  //final double? rightPadding;
  final String? message;
  final bool? isShowTick;
  final bool? isSeen;
  final VoidCallback? onLongPress;

  const MessageLayout({
    super.key,
    this.alignment,
    this.message,
    this.createAt,
    this.messageColor,
    //this.rightPadding,
    this.isShowTick,
    this.isSeen,
    this.onLongPress,
    this.onSwipe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: SwipeTo(
        onRightSwipe: onSwipe,
        child: GestureDetector(
          onLongPress: onLongPress,
          child: Container(
            alignment: alignment,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.only(
                          left: 5,
                          right: 90,
                          top: 5,
                          bottom: 5,
                      ),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.80),
                      decoration: BoxDecoration(
                        color: messageColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "$message",
                        style: const TextStyle(
                          color: textColor,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(height: 3,),
                  ],
                ),

                Positioned(
                  bottom: 4,
                    right: 10,
                    child: Row(
                      children: [
                        Text(
                          DateFormat.jm().format(createAt!),
                          //DateFormat.jm().format(createAt!.toDate()),
                          style: const TextStyle(
                            fontSize: 12,
                            color: lightGreyColor,
                          ),
                        ),
                        const SizedBox(width: 5,),
                        isShowTick == true
                        ? Icon(
                          isSeen == true ? Icons.done_all : Icons.done,
                          size: 16,
                          color: isSeen == true ? Colors.blue : lightGreyColor,
                        ) : Container(),
                      ],
                    ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
