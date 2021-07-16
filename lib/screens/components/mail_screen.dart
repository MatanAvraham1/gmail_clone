import 'package:flutter/material.dart';
import 'package:gmail_clone/main.dart';
import 'package:gmail_clone/models/mail.dart';

class MailScreen extends StatefulWidget {
  final Mail mail;
  const MailScreen({Key? key, required this.mail}) : super(key: key);

  @override
  _MailScreenState createState() => _MailScreenState();
}

class _MailScreenState extends State<MailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        actionsIconTheme: Theme.of(context).iconTheme,
        iconTheme: Theme.of(context).iconTheme,
        actions: [
          Visibility(
            visible: !widget.mail.isDeleted,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.archive_outlined),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.delete_outline),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          IconButton(icon: Icon(Icons.mail_outline), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              widget.mail.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            trailing: Visibility(
              visible: !widget.mail.isDeleted,
              child: GestureDetector(
                child: Icon(
                  widget.mail.isStarred ? Icons.star : Icons.star_border,
                  color: widget.mail.isStarred ? Colors.amber : Colors.black45,
                ),
                onTap: () {
                  setState(() {
                    widget.mail.isStarred = !widget.mail.isStarred;
                  });
                },
              ),
            ),
            subtitle: Text("Inbox"),
          ),
          ListTile(
            title: Text(widget.mail.sender),
            subtitle: Text("אל אני"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.reply),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            ),
            leading: CircleAvatar(
              radius: 22,
              child: Text(
                widget.mail.sender[0],
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              backgroundColor:
                  getProfileColor(widget.mail), // TODO: handle this
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.mail.content,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: Icon(Icons.reply),
                  onPressed: () {},
                ),
                TextButton(
                  child: Icon(Icons.reply_all),
                  onPressed: () {},
                ),
                TextButton(
                  child: Icon(Icons.forward),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
