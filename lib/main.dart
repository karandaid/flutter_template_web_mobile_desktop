import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:karandeepsingh/apps_screen.dart';
import 'package:karandeepsingh/dashboard_screen.dart';
import 'package:karandeepsingh/footer_screen.dart';
import 'package:karandeepsingh/ideas_screen.dart';
import 'package:karandeepsingh/legal/articlewriting.dart';
import 'package:karandeepsingh/legal/cookie.dart';
import 'package:karandeepsingh/legal/privacy.dart';
import 'package:karandeepsingh/startup_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'LoginScreen.dart';
import 'automation_screen.dart';
import 'legal/datadeletion.dart';
import 'legal/terms.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Karandeep Singh',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black))),
      home: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return const MyHomePage(title: 'Karandeep Singh');
        },
      ),
      routes: {
        // When navigating to the "/second" route, build the SecondScreen widget.
        PrivacyScreen.routeName: (context) => const PrivacyScreen(),
        TermsScreen.routeName: (context) => const TermsScreen(),
        CookieScreen.routeName: (context) => const CookieScreen(),
        DataDeletionScreen.routeName: (context) => const DataDeletionScreen(),
        ArticleWriting.routeName: (context) => const ArticleWriting(),
      },
      onGenerateRoute: (RouteSettings settings) {
        var uri = Uri.parse('${settings.name}');
        print('uri = $uri');
        if (settings.arguments != null) {
          final map = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (_) => DocRead(
              map: map,
            ),
            settings: RouteSettings(name: '${settings.name}'),
          );
        }
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  My_HomePageState createState() => My_HomePageState();
}

class My_HomePageState extends State<MyHomePage> {
  Widget _page = DashboardScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Container(
          width: MediaQuery.of(context).size.width * .5,
          child: _buildDrawerList(context),
        ),
      ),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Colors.blue,
          expandedHeight: 200,
          pinned: true,
          leading: Device.boxConstraints.maxWidth < 800
              ? Builder(
                  builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  },
                )
              : Container(),
          flexibleSpace: FlexibleSpaceBar(
            // background: Image.asset(
            //   'images/background.jpg',
            //   fit: BoxFit.cover,
            // ),
            title: Text(
              widget.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
              ),
            ),
            centerTitle: true,
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _page = LoginScreen();
                });
              },
              icon: const Icon(
                Icons.login_rounded,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 10.h,
            ),
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Device.boxConstraints.maxWidth > 800
                    ? Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.grey[100],
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildMenuItem(
                                    widget: const DashboardScreen(),
                                    icon: Icons.home,
                                    text: 'Home',
                                  ),
                                  _buildMenuItem(
                                    widget: const IdeasScreen(),
                                    icon: Icons.auto_awesome,
                                    text: 'Ideas',
                                  ),
                                  _buildMenuItem(
                                    widget: const StartupScreen(),
                                    icon: Icons.baby_changing_station,
                                    text: 'Startups',
                                  ),
                                  _buildMenuItem(
                                    widget: const AppsScreen(),
                                    icon: Icons.mobile_friendly,
                                    text: 'Apps+',
                                  ),
                                  _buildMenuItem(
                                    widget: const AutomationScreen(),
                                    icon: Icons.android,
                                    text: 'Automation',
                                  ),
                                  _buildMenuItem(
                                    widget: const AutomationScreen(),
                                    icon: Icons.message,
                                    text: 'Message Me',
                                  ),
                                  const Divider(),
                                  AboutListTile(
                                    applicationName: 'Me',
                                    child: const Text('Learn about me'),
                                    aboutBoxChildren: [
                                      IconButton(
                                        onPressed: () {
                                          print('a');
                                        },
                                        icon: const FaIcon(
                                          FontAwesomeIcons.linkedin,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      TextButton.icon(
                                        onPressed: () {
                                          print('a');
                                        },
                                        icon: const FaIcon(
                                          FontAwesomeIcons.certificate,
                                          color: Colors.blue,
                                        ),
                                        label: const Text('My Certifications'),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(),
                Expanded(
                  flex: 4,
                  child: _page,
                ),
              ],
            ),
            FooterScreen(),
          ]),
        ),
      ]),
    );
  }

  Widget _buildMenuItem(
      {required String text, required Widget widget, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
        vertical: 10.0,
      ),
      child: TextButton.icon(
        onPressed: () {
          setState(() {
            _page = widget;
          });
        },
        icon: Icon(icon),
        label: Text(text),
      ),
    );
  }

  Widget _buildDrawerList(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              image: AssetImage('images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Text(''),
        ),
        ListTile(
          leading: const Icon(
            Icons.home,
            color: Colors.black,
          ),
          title: const Text('Home'),
          onTap: () {
            setState(() {
              _page = DashboardScreen();
            });
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.auto_awesome,
            color: Colors.black,
          ),
          title: const Text('Ideas'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            setState(() {
              _page = IdeasScreen();
            });
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.baby_changing_station,
            color: Colors.black,
          ),
          title: const Text('Startups'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            setState(() {
              _page = StartupScreen();
            });

            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.mobile_friendly,
            color: Colors.black,
          ),
          title: const Text('Apps+'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            setState(() {
              _page = AppsScreen();
            });

            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.android,
            color: Colors.black,
          ),
          title: const Text('Automation'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            setState(() {
              _page = AutomationScreen();
            });

            Navigator.pop(context);
          },
        ),
        const Divider(),
        const AboutListTile(
          applicationName: 'Me',
        )
      ],
    );
  }
}
