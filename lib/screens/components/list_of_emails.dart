import 'package:flutter/material.dart';
import 'package:gmail_clone/constants/colors.dart';
import 'package:gmail_clone/constants/db.dart';
import 'package:gmail_clone/screens/components/mail_tile.dart';
import 'package:gmail_clone/screens/components/side_menu.dart';
import 'package:gmail_clone/translations/locale_keys.g.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:easy_localization/easy_localization.dart';

class ListOfEmails extends StatefulWidget {
  const ListOfEmails({Key? key}) : super(key: key);

  @override
  _ListOfEmailsState createState() => _ListOfEmailsState();
}

class _ListOfEmailsState extends State<ListOfEmails> {
  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);

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
        hint: LocaleKeys.search_mail.tr(),
        transition: ExpandingFloatingSearchBarTransition(),
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
          child: FloatingSearchBarScrollNotifier(
            child: ListView.builder(
              itemCount: mails.length + 1,
              itemBuilder: (context, index) => index == 0
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 8),
                      child: Text(
                        LocaleKeys.Inbox.tr(),
                        style: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                    )
                  : MailTile(
                      mail: mails[index - 1],
                    ),
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
