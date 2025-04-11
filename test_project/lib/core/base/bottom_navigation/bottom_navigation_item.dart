import 'package:flutter/material.dart';

enum BottomNavigationItem {
  catalog,
  profile,
  cart;

  IconData get tabIcon {
    return switch (this) {
      BottomNavigationItem.catalog => Icons.storefront,
      BottomNavigationItem.cart => Icons.shopping_cart,
      BottomNavigationItem.profile => Icons.person,
    };
  }

  String get tabLabel {
    return switch (this) {
      BottomNavigationItem.catalog => 'Каталог',
      BottomNavigationItem.cart => 'Корзина',
      BottomNavigationItem.profile => 'Профиль',
    };
  }

  String get location {
    return switch (this) {
      BottomNavigationItem.catalog => '/catalog',
      BottomNavigationItem.cart => '/cart',
      BottomNavigationItem.profile => '/profile',
    };
  }

  int get value {
    return index;
  }

  static BottomNavigationItem fromIndex(int index) {
    return BottomNavigationItem.values[index];
  }
}
