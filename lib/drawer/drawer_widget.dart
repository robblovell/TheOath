import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'drawer/blocs.dart';

class DrawerWidget extends StatelessWidget {
  final String accountName;
  final String accountEmail;
  final List<_NavigationItem> _listItems = [
    _NavigationItem(true, null, null, null),
    _NavigationItem(false, DrawerItem.page_one, "First Page", Icons.looks_one),
    _NavigationItem(false, DrawerItem.page_two, "Second Page", Icons.looks_two),
    _NavigationItem(false, DrawerItem.page_three, "Third Page", Icons.looks_3),
    _NavigationItem(false, DrawerItem.page_four, "Fourth Page", Icons.looks_4),
    _NavigationItem(false, DrawerItem.page_five, "Fifth Page", Icons.looks_5),
    _NavigationItem(false, DrawerItem.page_six, "Sixth Page", Icons.looks_6),
  ];
  DrawerWidget(this.accountName, this.accountEmail);
  @override
  Widget build(BuildContext context) => Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
      child: Container(
        color: Colors.brown, //CoreColors.background,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: _listItems.length,
            itemBuilder: (BuildContext context, int index) =>
                BlocBuilder<DrawerBloc, DrawerState>(
                  builder: (BuildContext context, DrawerState state) =>
                      _buildItem(_listItems[index], state),
                )),
      ));
  Widget _buildItem(_NavigationItem data, DrawerState state) => data.header
  // if the item is a header return the header widget
      ? _makeHeaderItem()
  // otherwise build and return the default list item
      : _makeListItem(data, state);
  Widget _makeHeaderItem() => UserAccountsDrawerHeader(
    accountName: Text(accountName, style: TextStyle(color: Colors.white)),
    accountEmail: Text(accountEmail, style: TextStyle(color: Colors.white)),
    decoration: BoxDecoration(color: Colors.blueGrey),
    currentAccountPicture: CircleAvatar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.amber,
      child: Icon(
        Icons.person,
        size: 54,
      ),
    ),
  );
  Widget _makeListItem(_NavigationItem data, DrawerState state) => Card(
    color: data.item == state.selectedItem
        ? Colors.orange
        : Colors.brown,
      // ? CoreColors.selectedDrawerItemRow
      // : CoreColors.background,
    shape: ContinuousRectangleBorder(borderRadius: BorderRadius.zero),
    // So we see the selected highlight
    borderOnForeground: true,
    elevation: 0,
    margin: EdgeInsets.zero,
    child: Builder(
      builder: (BuildContext context) => ListTile(
        title: Text(
          data.title,
          style: TextStyle(
            color: data.item == state.selectedItem
                ? Colors.blue
                : Colors.blueGrey,
          ),
        ),
        leading: Icon(
          data.icon,
          // if it's selected change the color
          color: data.item == state.selectedItem
              ? Colors.blue
              : Colors.blueGrey,
        ),
        onTap: () => _handleItemClick(context, data.item),
      ),
    ),
  );
  void _handleItemClick(BuildContext context, DrawerItem item) {
    BlocProvider.of<DrawerBloc>(context).add(NavigateTo(item));
    Navigator.pop(context);
  }
}
// helper class used to represent navigation list items
class _NavigationItem {
  final bool header;
  final DrawerItem item;
  final String title;
  final IconData icon;
  _NavigationItem(this.header, this.item, this.title, this.icon);
}