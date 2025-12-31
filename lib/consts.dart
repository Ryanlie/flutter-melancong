// Flutter imports:
import 'package:flutter/material.dart';

const Set<String> interestList = {
  'Music',
  'Sports',
  'Food',
  'Relaxing',
  'Crowds',
  'Art',
  'Travel',
  'Tech',
  'Fashion',
  'Movies',
  'Gaming',
  'Books',
};

const colorBlack = Color(0xFF221019);
const colorWhite = Color(0xFFf8f6f7);
const colorPink = Color(0xFFf25aa6);
const colorBlackLighter = Color(0xFF2d1620);
const colorBlackText = Color(0xFF1b0d14);

final List<Map<String, dynamic>> categories = [
  {
    'label': 'Music',
    'icon': Icons.music_note,
    'color': const Color(0xFFFF6B9D),
  },
  {
    'label': 'Sports',
    'icon': Icons.sports_soccer,
    'color': const Color(0xFF6BCB77),
  },
  {'icon': Icons.restaurant, 'label': 'Food', 'color': const Color(0xFFFF9680)},
  {'icon': Icons.spa, 'label': 'Relaxing', 'color': const Color(0xFF36FFF5)},
  {
    'icon': Icons.people_alt,
    'label': 'Crowds',
    'color': const Color(0xFF2D40FF),
  },
  {'icon': Icons.palette, 'label': 'Art', 'color': const Color(0xFFF34AFF)},
  {'icon': Icons.flight, 'label': 'Travel', 'color': const Color(0xFFFFC744)},
  {'icon': Icons.memory, 'label': 'Tech', 'color': const Color(0xFF89FF7E)},
  {
    'icon': Icons.checkroom,
    'label': 'Fashion',
    'color': const Color(0xFFFFDFA8),
  },
  {'icon': Icons.movie, 'label': 'Movies', 'color': const Color(0xFF4D96FF)},
  {
    'icon': Icons.sports_esports,
    'label': 'Gaming',
    'color': const Color(0xFF9900E5),
  },
  {'icon': Icons.menu_book, 'label': 'Books', 'color': const Color(0xFFB05F07)},
];
