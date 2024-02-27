import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;

class CustomBadge extends Badge {
  CustomBadge({
    super.key,
    super.child,
    super.badgeContent,
    super.showBadge
  }) : super(
          position: BadgePosition.topStart(start: -4, top: -4),
          stackFit: StackFit.passthrough,
          badgeStyle: const BadgeStyle(
            badgeColor: Colors.white,
          ),
        );
}
