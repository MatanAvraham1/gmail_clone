import 'package:flutter/material.dart';
import 'package:gmail_clone/constants/colors.dart';
import 'package:gmail_clone/constants/themes.dart';
import 'package:gmail_clone/main.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
            _buildSideMenuTile("Inbox", Icons.inbox),
            _buildSideMenuTile("Archive", Icons.archive),
            _buildSideMenuTile("Starred", Icons.star),
            _buildSideMenuTile("Trash", Icons.delete),
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
          ],
        ),
      ),
    );
  }
}
