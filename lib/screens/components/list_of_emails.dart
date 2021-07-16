import 'package:flutter/material.dart';
import 'package:gmail_clone/constants/colors.dart';
import 'package:gmail_clone/constants/db.dart';
import 'package:gmail_clone/screens/components/mail_tile.dart';
import 'package:gmail_clone/screens/components/side_menu.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ListOfEmails extends StatefulWidget {
  const ListOfEmails({Key? key}) : super(key: key);

  @override
  _ListOfEmailsState createState() => _ListOfEmailsState();
}

class _ListOfEmailsState extends State<ListOfEmails> {
  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);

    // return Scaffold(
    //   drawer: deviceType == DeviceScreenType.desktop ? null : SideMenu(),
    //   appBar: AppBar(),
    //   body: ListView.builder(
    //     itemCount: mails.length,
    //     itemBuilder: (context, index) => MailTile(
    //       mail: mails[index],
    //     ),
    //   ),
    // );

    return Scaffold(
      drawer: deviceType == DeviceScreenType.desktop ? null : SideMenu(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.edit,
          color: redColor,
        ),
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: FloatingSearchBar(
        hint: 'Search...',
        transition: CircularFloatingSearchBarTransition(),
        actions: [
          FloatingSearchBarAction(
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.red[900],
              child: CircularButton(
                onPressed: () {},
                icon: Text(
                  "M",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          FloatingSearchBarAction.icon(
            icon: Icon(Icons.mic),
            onTap: () {},
            showIfClosed: false,
            showIfOpened: true,
          ),
        ],
        body: Padding(
          padding: const EdgeInsets.only(top: 55),
          child: ListView.builder(
            itemCount: mails.length,
            itemBuilder: (context, index) => MailTile(
              mail: mails[index],
            ),
          ),
        ),
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.white,
              elevation: 4.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: Colors.accents.map((color) {
                  return Container(height: 112, color: color);
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
