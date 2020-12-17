import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:share/share.dart';
import 'package:launch_review/launch_review.dart';

import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  final FirebaseUser user;

  SettingsPage({Key key, this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with SingleTickerProviderStateMixin {
  sharePage() async {
    Share.share(
        "Hey I just invited you to download this amazing app to manage your task :)");
  }

  _launchURL() async {
    const url = 'https://twitter.com/arfaz_92';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          new Column(
            children: <Widget>[
              _getToolbar(context),
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Task',
                              style: new TextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Settings',
                              style: new TextStyle(
                                  fontSize: 28.0, color: Colors.grey),
                            ),
                          ],
                        )),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.0),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  color: Colors.white,
                  elevation: 2.0,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          FontAwesomeIcons.cogs,
                          color: Colors.grey,
                        ),
                        title: Text("Version"),
                        trailing: Text("1.0.0"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(
                          height: 5,
                          color: Colors.grey,
                        ),
                      ),
                      ListTile(
                        onTap: _launchURL,
                        leading: Icon(
                          FontAwesomeIcons.twitter,
                          color: Colors.blue,
                        ),
                        title: Text("Twitter"),
                        trailing: Icon(Icons.arrow_right),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(
                          height: 5,
                          color: Colors.grey,
                        ),
                      ),
                      ListTile(
                        onTap: sharePage,
                        leading: Icon(
                          FontAwesomeIcons.shareAlt,
                          color: Colors.blue,
                        ),
                        title: Text("Share Taskist"),
                        trailing: Icon(Icons.arrow_right),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  Padding _getToolbar(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
      child: new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        new Image(
            width: 40.0,
            height: 40.0,
            fit: BoxFit.cover,
            image: new AssetImage('assets/list.png')),
      ]),
    );
  }
}
