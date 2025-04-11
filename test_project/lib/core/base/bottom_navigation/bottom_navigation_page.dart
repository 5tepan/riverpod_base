import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project/core/base/bottom_navigation/bottom_navigation_item.dart';

final bottomNavIndexProvider =
    StateProvider<int>((ref) => BottomNavigationItem.catalog.value);

class BottomNavigationPage extends ConsumerWidget {
  final Widget child;

  const BottomNavigationPage({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocation = GoRouterState.of(context).uri.toString();
    final currentIndex = BottomNavigationItem.values
        .indexWhere((item) => currentLocation.startsWith(item.location));
    if (currentIndex == -1) {
      ref.read(bottomNavIndexProvider.notifier).state =
          BottomNavigationItem.catalog.value;
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => _onTabTapped(context, ref, index),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: _navBarItems(),
      ),
    );
  }

  void _onTabTapped(BuildContext context, WidgetRef ref, int index) {
    ref.read(bottomNavIndexProvider.notifier).state = index;
    final target = BottomNavigationItem.fromIndex(index).location;
    final current = GoRouterState.of(context).uri.toString();
    if (current != target) {
      context.go(target);
    }
  }

  List<BottomNavigationBarItem> _navBarItems() {
    return BottomNavigationItem.values.map((item) {
      return BottomNavigationBarItem(
        icon: Icon(item.tabIcon),
        label: item.tabLabel,
      );
    }).toList();
  }
}
