import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return getValueForScreenType(
      context: context,
      mobile: ListOfEmails(),
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
