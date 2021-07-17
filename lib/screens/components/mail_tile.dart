import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:gmail_clone/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gmail_clone/models/mail.dart';
import 'package:gmail_clone/screens/components/mail_screen.dart';
import 'package:gmail_clone/translations/locale_keys.g.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MailTile extends StatefulWidget {
  final Mail mail;
  const MailTile({Key? key, required this.mail}) : super(key: key);

  @override
  _MailTileState createState() => _MailTileState();
}

class _MailTileState extends State<MailTile> {
  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);

    return InkWell(
      onTap: () {
        if (deviceType != DeviceScreenType.mobile) {
          Provider.of<Mail>(context, listen: false).newValue(widget.mail);
        }
      },
      child: OpenContainer(
        closedColor: Theme.of(context).canvasColor,
        tappable: deviceType == DeviceScreenType.mobile,
        openBuilder: (context, action) => MailScreen(mail: widget.mail),
        closedBuilder: (context, action) => Dismissible(
          onDismissed: (direction) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("1 ${LocaleKeys.archived.tr()}"),
              action: SnackBarAction(
                  label: LocaleKeys.Cancel.tr(), onPressed: () {}),
            ));
          },
          key: UniqueKey(),
          background: Container(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.archive,
                  ),
                  Icon(
                    Icons.archive,
                  )
                ],
              ),
            ),
          ),
          child: ListTile(
            isThreeLine: true,
            title: Text(
              widget.mail.sender,
              maxLines: 1,
              style: TextStyle(
                  fontWeight: widget.mail.isOpend
                      ? FontWeight.normal
                      : FontWeight.bold),
            ),
            subtitle: Text(
              "${widget.mail.title}\n${widget.mail.content}",
              maxLines: 2,
            ),
            leading: CircleAvatar(
              child: Text(
                widget.mail.sender[0],
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor:
                  getProfileColor(widget.mail), // TODO: handle this
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "${widget.mail.sentAt.day} ${DateFormat.MMMM().format(widget.mail.sentAt).substring(0, 3)}",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: widget.mail.isOpend
                          ? FontWeight.normal
                          : FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.mail.isStarred = !widget.mail.isStarred;
                    });
                  },
                  child: Icon(
                    widget.mail.isStarred ? Icons.star : Icons.star_outline,
                    color: widget.mail.isStarred ? Colors.amber : Colors.grey,
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
