import 'package:flutter/material.dart';
import 'package:gmail_clone/constants/colors.dart';
import 'package:gmail_clone/constants/themes.dart';
import 'package:gmail_clone/main.dart';
import 'package:gmail_clone/translations/locale_keys.g.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:easy_localization/easy_localization.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  Widget _buildSideMenuTile(
    String title,
    IconData icon,
  ) {
    return ListTile(
      title: Text(title),
      trailing: Icon(
        icon,
        color: redColor,
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    bool _isDarkmode =
        Theme.of(context).brightness == appThemeData[AppTheme.Dark]!.brightness;

    return Material(
      child: Container(
        width: 250,
        child: ListView(
          children: [
            ListTile(
              title: Text(
                "Gmail",
                style: TextStyle(
                    color: redColor, fontWeight: FontWeight.bold, fontSize: 20),
              ),
              trailing:
                  deviceType == DeviceScreenType.desktop ? null : CloseButton(),
            ),
            Divider(),
            _buildSideMenuTile(LocaleKeys.Inbox.tr(), Icons.inbox),
            _buildSideMenuTile(LocaleKeys.Archive.tr(), Icons.archive),
            _buildSideMenuTile(LocaleKeys.Starred.tr(), Icons.star),
            _buildSideMenuTile(LocaleKeys.Trash.tr(), Icons.delete),
            Divider(),
            SwitchListTile(
              value: _isDarkmode,
              secondary: Icon(Icons.dark_mode),
              onChanged: (value) {
                setState(() {
                  _isDarkmode = value;
                });

                if (_isDarkmode) {
                  MyApp.of(context)!.setTheme(ThemeMode.dark);
                } else {
                  MyApp.of(context)!.setTheme(ThemeMode.light);
                }
              },
            ),
            TextButton(
                onPressed: () {
                  context.setLocale(Locale('en'));
                },
                child: Text("English")),
            TextButton(
                onPressed: () {
                  context.setLocale(Locale('he'));
                },
                child: Text("עברית"))
          ],
        ),
      ),
    );
  }
}
