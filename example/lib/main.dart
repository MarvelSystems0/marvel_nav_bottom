import 'package:flutter/material.dart';
import 'package:marvel_nav_bar/marvel_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel-Nav',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex=1;
  PageController pageController;




  List<Widget>_listItem=
  [
    Container(child: Center(child: Column(children: <Widget>[
      Icon(Icons.settings),
      Text('Setting'),
    ],),),),
    Container(child: Center(child: Column(children: <Widget>[
      Icon(Icons.home),
      Text('Home'),
    ],),),),
    Container(child: Center(child: Column(children: <Widget>[
      Icon(Icons.person),
      Text('Profile'),
    ],),),),
  ];

  @override
  void initState() {
    super.initState();
    pageController = new PageController(initialPage: currentIndex);
  }
  @override
  Widget build(BuildContext context) {
    return Material(child:
        Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: MarvelNavBar(
        items: [
          MarvelNavItem(iconData: Icons.settings,label: 'setting',),
          MarvelNavItem(iconData: Icons.home,label: 'home',),
          MarvelNavItem(iconData: Icons.person,label: 'profile',),
        ],
        theme:
        MarvelNavTheme(
          unselectedItemIconColor: Colors.black45,
          unselectedItemTextStyle: TextStyle(
              fontSize: 1.0,
              color: Colors.black45,
              fontWeight: FontWeight.normal,
              height: 0),
          selectedItemLabelColor: Colors.blue,
          showSelectedItemShadow: true,
          unselectedItemBackgroundColor: Colors.transparent,
          selectedItemIconColor: Colors.white,
          selectedItemBackgroundColor: Colors.blue,
          unselectedItemLabelColor: Colors.white,
          barBackgroundColor: Colors.white,
          selectedItemTextStyle:TextStyle(
              fontSize: 13.0,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              height: 1.2),),
        selectedIndex: currentIndex,
        onSelectTab: (index) {
          onSelectedTab(index);
        },
      ),
      body: Center(
        child:PageView(children:_listItem,onPageChanged: onSelectedTab,
        controller: pageController,),
      ),
    ));
  }

  onSelectedTab(int index)
  {
    setState(() {
      currentIndex=index;
      pageController.jumpToPage(index);
    });
  }
}
