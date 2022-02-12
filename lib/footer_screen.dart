import 'package:flutter/material.dart';
import 'package:karandeepsingh/legal/articlewriting.dart';
import 'package:karandeepsingh/legal/cookie.dart';
import 'package:karandeepsingh/legal/datadeletion.dart';
import 'package:karandeepsingh/legal/terms.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'legal/privacy.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      width: MediaQuery.of(context).size.width * .2,
      height: MediaQuery.of(context).size.height * .2,
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Device.boxConstraints.maxWidth > 800
                    ? _buildTabletFooter(context)
                    : _buildMobileFooter(context)
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildMobileFooter(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FlutterLogo(size: 100),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('iOS'),
              Text('Android'),
              Text('App Store'),
              Divider(
                indent: 10.w,
                endIndent: 10.w,
                color: Colors.white,
              ),
              Text('Privacy Policy'),
              Text('Terms and Conditions'),
              Text('Cookie Policy'),
              Text('Data Deletion Policy'),
              Text('Article Guidelines'),
            ],
          ),
        ],
      ),
    );
  }

  _buildTheLegalLink(
      {required BuildContext context,
      required String name,
      required String url}) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(
          context,
          url,
        );
      },
      child: Text(name),
    );
  }

  _buildTabletFooter(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FlutterLogo(size: 100),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildTheLegalLink(
                context: context,
                name: 'Privacy Policy',
                url: PrivacyScreen.routeName,
              ),
              _buildTheLegalLink(
                context: context,
                name: 'Terms and Conditions',
                url: TermsScreen.routeName,
              ),
              _buildTheLegalLink(
                context: context,
                name: 'Cookie Policy',
                url: CookieScreen.routeName,
              ),
              _buildTheLegalLink(
                context: context,
                name: 'Data Deletion Policy',
                url: DataDeletionScreen.routeName,
              ),
              _buildTheLegalLink(
                context: context,
                name: 'Article Writing Guidelines',
                url: ArticleWriting.routeName,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('iOS'),
              Text('Android'),
              Text('App Store'),
            ],
          ),
        ],
      ),
    );
  }
}
