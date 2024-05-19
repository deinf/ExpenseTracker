import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> transactionData = [
  {
    'icon': const FaIcon(
      FontAwesomeIcons.burger,
      color: Colors.white,
      size: 20,
    ),
    'color': Colors.yellow[700],
    'name': "Food",
    'totalAmount': "-Rp. 45.000",
    'date': "Today"
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.shop,
      color: Colors.white,
      size: 20,
    ),
    'color': Colors.purple,
    'name': "Shopping",
    'totalAmount': "-Rp. 15.000",
    'date': "Today"
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.heartCircleCheck,
      color: Colors.white,
      size: 20,
    ),
    'color': Colors.green,
    'name': "Health",
    'totalAmount': "-Rp. 50.000",
    'date': "Yesterday"
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.plane,
      color: Colors.white,
      size: 20,
    ),
    'color': Colors.blue,
    'name': "Travel",
    'totalAmount': "-Rp. 100.000",
    'date': "Yesterday"
  },
];
