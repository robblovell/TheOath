// this is the state the user is expected to see
class DrawerState {
  final DrawerItem selectedItem;
  const DrawerState(this.selectedItem);
}

enum DrawerItem {
  page_one,
  page_two,
  page_three,
  page_four,
  page_five,
  page_six,
}