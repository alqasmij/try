import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'aboutUs.dart';
import 'categoriesPage.dart';
import 'discoverypage.dart';
import 'contactUsPage.dart';
import 'allPostsPage.dart';
import 'package:citylolo/tools//toolsUtilities.dart';

class StarterPage extends StatefulWidget {
  @override
  _StarterPageState createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
  int _page = 2;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    List<Widget> tabs = [
      AboutUs(),
      CategoriesPage(),
      DiscoveryPage(),
      AllPostsPage(),
      ContactUsPage()
    ];

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: 2,
            height: 50.0,
            items: <Widget>[
              Icon(Icons.info,color: ToolsUtilities.whiteColor, size: 20),
              Icon(Icons.category,color: ToolsUtilities.whiteColor, size: 20),
              Icon(Icons.home,color: ToolsUtilities.whiteColor, size: 20),
              Icon(Icons.branding_watermark,color: ToolsUtilities.whiteColor, size: 20),
              Icon(Icons.email,color: ToolsUtilities.whiteColor, size: 20),
            ],
            color: ToolsUtilities.mainColor,
            buttonBackgroundColor: ToolsUtilities.mainColor,
            backgroundColor: ToolsUtilities.whiteColor,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds:200),
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
          ),
          body: tabs[_page],

        )
    );
  }
}
