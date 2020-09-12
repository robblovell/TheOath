// this import is needed to import NavItem, 
// which we'll use to represent the item the user has selected
import 'drawer_state.dart';

abstract class DrawerEvent {
  const DrawerEvent();
}
// this is the event that's triggered when the user
// wants to change pages
class NavigateTo extends DrawerEvent {
  final DrawerItem destination;
  const NavigateTo(this.destination);
}