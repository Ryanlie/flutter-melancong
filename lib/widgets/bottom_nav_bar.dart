// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:fluterproject/consts.dart';

class BottomNavBar extends StatelessWidget {
  final String current;
  final Color? overrideBg;

  const BottomNavBar({super.key, required this.current, this.overrideBg});

  @override
  Widget build(BuildContext context) {
    final primaryColor = colorPink;
    final textColor = colorBlack;

    return Container(
      decoration: BoxDecoration(
        color:
            overrideBg ??
            (colorWhite.withValues(alpha: 0.9)),
        border: Border(
          top: BorderSide(
            color: primaryColor.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                Icons.home,
                'Home',
                '/home',
                primaryColor,
                textColor,
                context,
              ),
              _buildNavItem(
                Icons.confirmation_number,
                'Events',
                '/events',
                primaryColor,
                textColor,
                context,
              ),
              _buildNavItem(
                Icons.edit_calendar,
                'RSVP',
                '/rsvp',
                primaryColor,
                textColor,
                context,
              ),
              _buildNavItem(
                Icons.person,
                'Profile',
                '/profile',
                primaryColor,
                textColor,
                context,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    String index,
    Color primaryColor,
    Color textColor,
    BuildContext context,
  ) {
    final isSelected = current == index;
    return GestureDetector(
      onTap: () {
        _onNavTap(context, index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? primaryColor : textColor.withValues(alpha: 0.6),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected
                  ? primaryColor
                  : textColor.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  void _onNavTap(BuildContext context, String dest) {
    if (current == dest) {
      return;
    } else {
      Navigator.pushReplacementNamed(context, dest);
      
    }

    //
    // switch (dest) {
    //   case 0:
    //     Navigator.pushReplacementNamed(context, '/home');
    //     break;
    //   case 1:
    //     Navigator.pushReplacementNamed(context, '/events');
    //     break;
    //   case 2:
    //     Navigator.pushReplacementNamed(context, '/profile');
    //     break;
    // }
  }
}
