import 'package:flutter/material.dart';
import 'package:gmail_clone/constants/colors.dart';
import 'package:gmail_clone/constants/themes.dart';
import 'package:gmail_clone/models/mail.dart';
import 'package:gmail_clone/screens/components/list_of_emails.dart';
import 'package:gmail_clone/screens/components/mail_screen.dart';
import 'package:gmail_clone/screens/components/side_menu.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    bool _isDarkmode =
        Theme.of(context).brightness == appThemeData[AppTheme.Dark]!.brightness;
    return getValueForScreenType(
      context: context,
      mobile: Scaffold(
        body: [
          ListOfEmails(),
          Container(
            child: Center(
              child: Text("Chat"),
            ),
          ),
          Container(
            child: Center(
              child: Text("Rooms"),
            ),
          ),
          Container(
            child: Center(
              child: Text("Meet"),
            ),
          )
        ].elementAt(index),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          currentIndex: index,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: redColor,
          selectedIconTheme: IconThemeData(color: redColor),
          unselectedFontSize: 12,
          selectedFontSize: 14,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.mail,
                    color: _isDarkmode ? Colors.white : Colors.black54,
                    semanticLabel: "Mail"),
                activeIcon:
                    Icon(Icons.mail, color: redColor, semanticLabel: "Mail"),
                label: "Mail"),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat,
                    color: _isDarkmode ? Colors.white : Colors.black54,
                    semanticLabel: "Chat"),
                activeIcon:
                    Icon(Icons.chat, color: redColor, semanticLabel: "Chat"),
                label: "Chat"),
            BottomNavigationBarItem(
                icon: Icon(Icons.door_back,
                    color: _isDarkmode ? Colors.white : Colors.black54,
                    semanticLabel: "Rooms"),
                activeIcon: Icon(Icons.door_back,
                    color: redColor, semanticLabel: "Rooms"),
                label: "Rooms"),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_call,
                    color: _isDarkmode ? Colors.white : Colors.black54,
                    semanticLabel: "Meet"),
                activeIcon: Icon(Icons.video_call,
                    color: redColor, semanticLabel: "Meet"),
                label: "Meet")
          ],
        ),
      ),
      tablet: ChangeNotifierProvider<Mail>(
        create: (context) =>
            Mail(sender: "", title: "", content: "", sentAt: DateTime(2000)),
        builder: (context, child) => Row(
          children: [
            Flexible(
              child: ListOfEmails(),
              flex: 4,
            ),
            Flexible(
              child: Provider.of<Mail>(context).sender == ""
                  ? Container(
                      color: Theme.of(context).canvasColor,
                    )
                  : MailScreen(
                      mail: Provider.of<Mail>(context),
                    ),
              flex: 6,
            )
          ],
        ),
      ),
      desktop: ChangeNotifierProvider<Mail>(
        create: (context) =>
            Mail(sender: "", title: "", content: "", sentAt: DateTime(2000)),
        builder: (context, child) => Row(
          children: [
            Flexible(
              child: SideMenu(),
              flex: 3,
            ),
            Flexible(
              child: ListOfEmails(),
              flex: 5,
            ),
            Flexible(
              child: Provider.of<Mail>(context).sender == ""
                  ? Container(
                      color: Theme.of(context).canvasColor,
                    )
                  : MailScreen(
                      mail: Provider.of<Mail>(context),
                    ),
              flex: 6,
            ),
          ],
        ),
      ),
    );
  }
}
