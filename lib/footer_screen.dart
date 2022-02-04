import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
                    ? _buildTabletFooter()
                    : _buildMobileFooter()
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildMobileFooter() {
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

  _buildTabletFooter() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FlutterLogo(size: 100),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text('Privacy Policy'),
              Text('Terms and Conditions'),
              Text('Cookie Policy'),
              Text('Data Deletion Policy'),
              Text('Article Guidelines'),
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
