import 'package:flutter/material.dart';
import 'package:marvel_nav_bar/marvel_nav_bar.dart';

var colors =  Color.fromARGB(255,97, 57, 117);

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: 'Marvel-Nav',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromARGB(255,97, 57, 117),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'marvel_nav_bar'),
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
  var colors =  Color.fromARGB(255,97, 57, 117);


  List<Widget>_listItem=
  [
    Container(child: Center(child: Column(children: <Widget>[
      SizedBox(height: 100,),
      Icon(Icons.settings,size: 60,),
      Text('Setting'),
    ],),),),
    Container(child: Center(child: Column(children: <Widget>[
      SizedBox(height: 100,),
      Icon(Icons.home,size: 60,),
      Text('Home'),
    ],),),),
    Container(child: Center(child: Column(children: <Widget>[
      SizedBox(height: 100,),
      Icon(Icons.person,size: 60,),
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
      bottomNavigationBar:
      MarvelNavBar(
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
          selectedItemLabelColor: colors,
          showSelectedItemShadow: true,
          unselectedItemBackgroundColor: Colors.transparent,
          selectedItemIconColor: Colors.white,
          selectedItemBackgroundColor: colors,
          unselectedItemLabelColor: Colors.white,
          barBackgroundColor: Colors.white,
          selectedItemTextStyle:TextStyle(
              fontSize: 13.0,
              color: colors,
              fontWeight: FontWeight.bold,
              height: 1.2),),
        selectedIndex: currentIndex,
        onSelectTab: (index) {
          onSelectedTab(index);
        },
      ),
      body:
      Center(
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
