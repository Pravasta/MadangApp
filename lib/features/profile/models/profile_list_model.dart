import 'package:flutter/material.dart';

class ProfileListModel {
  static final List<Map<String, dynamic>> _account = [
    {
      'icon': Icons.payment,
      'label': 'Payment Method',
    },
    {
      'icon': Icons.shopping_cart,
      'label': 'My Cart',
    },
    {
      'icon': Icons.help,
      'label': 'Help & Report',
    },
    {
      'icon': Icons.language,
      'label': 'Language',
    },
    {
      'icon': Icons.notifications,
      'label': 'Notification',
    },
  ];

  static List<Map<String, dynamic>> get account => _account;

  static List<Map<String, dynamic>> get moreInfo => _moreInfo;

  static final List<Map<String, dynamic>> _moreInfo = [
    {
      'icon': Icons.privacy_tip,
      'label': 'Privacy Policy',
    },
    {
      'icon': Icons.newspaper,
      'label': 'News & Services',
    },
    {
      'icon': Icons.star,
      'label': 'Give Rating',
    },
  ];
}
