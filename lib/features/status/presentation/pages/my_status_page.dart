import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as time_ago;
import 'package:whatsapp_clone_flutter/features/app/global/widgets/my_status_content.dart';
import 'package:whatsapp_clone_flutter/features/app/global/widgets/user_image.dart';
import 'package:whatsapp_clone_flutter/features/app/theme/style.dart';

class MyStatusPage extends StatefulWidget {
  const MyStatusPage({super.key});

  @override
  State<MyStatusPage> createState() => _MyStatusPageState();
}

class _MyStatusPageState extends State<MyStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Status",
          style: TextStyle(color: textColor),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
        child: Column(
          children: [
            MyStatusContent(
                title: time_ago.format(DateTime.now()
                    .subtract(Duration(seconds: DateTime.now().second))),
                value: "Delete",
                titleValue: "Delete",
                onTap: () {},
                onSelected: (value) {}),
          ],
        ),
      ),
    );
  }
}
