import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'marvel_bar_theme.dart';
import 'marvel_bar_item.dart';

export 'marvel_bar_theme.dart';
export 'marvel_bar_item.dart';

class MarvelNavBar extends StatefulWidget {
  final  Function onSelectTab;
  final List<MarvelNavItem> items;
  final MarvelNavTheme theme;

  final int selectedIndex;

  MarvelNavBar({
    Key key,
    this.selectedIndex = 0,
    @required this.onSelectTab,
    @required this.items,
    @required this.theme,
  }) {
    assert(items != null);
    assert(items.length >= 2 && items.length <= 5);
    assert (onSelectTab !=  null );
  }

  @override
  _MarvelNavBarState createState() =>
      _MarvelNavBarState(selectedIndex: selectedIndex);
}

class _MarvelNavBarState extends State<MarvelNavBar> {
  int selectedIndex;
  _MarvelNavBarState({this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final MarvelNavTheme theme = widget.theme;
    final bgColor =
        theme.barBackgroundColor ?? Theme.of(context).bottomAppBarColor;

    return MultiProvider(
      providers: [
        Provider<MarvelNavTheme>.value(value: theme),
        Provider<int>.value(value: widget.selectedIndex),
      ],
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          boxShadow: [
            const BoxShadow(
                color: Colors.black12,
                blurRadius :  2.0
            ),
          ],
        ),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: theme.barHeight,
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: widget.items.map((item) {
                var index = widget.items.indexOf(item);
                item.setIndex(index);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      widget. onSelectTab (index);
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width /
                          widget.items.length,
                      height: theme.barHeight,
                      child: item,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}