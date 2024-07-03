import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/features/app/global/widgets/list_tile_content.dart';
import 'package:whatsapp_clone_flutter/features/app/global/widgets/profile_widget.dart';
import 'package:whatsapp_clone_flutter/features/app/theme/style.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Contacts", style: TextStyle(color: textColor),),
      ),
      body: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return const ListTileContent(
              title: "Username",
              subTitleWidget: Text("Hey there! I'm using WhatsApp"),
            );
          }),
    );
  }
}
