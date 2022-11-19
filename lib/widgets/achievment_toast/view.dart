import 'package:flutter/material.dart';
import 'package:flutter_updated_boilerplate/widgets/achievment_toast/widget.dart';

class AchievementView {
  final BuildContext _context;
  final AlignmentGeometry alignment;
  final Duration duration;
  final GestureTapCallback? onTap;
  final Function(AchievementState)? listener;
  final bool isCircle;
  final Widget icon;
  final AnimationTypeAchievement typeAnimationContent;
  final double borderRadius;
  final Color color;
  final TextStyle? textStyleTitle;
  final TextStyle? textStyleSubTitle;
  final String title;
  final String subTitle;
  final double elevation;

  OverlayEntry? _overlayEntry;

  AchievementView(
    this._context, {
    this.elevation = 2,
    this.onTap,
    this.listener,
    this.isCircle = false,
    this.icon = const Icon(
      Icons.insert_emoticon,
      color: Colors.white,
    ),
    this.typeAnimationContent = AnimationTypeAchievement.fadeSlideToUp,
    this.borderRadius = 5.0,
    this.color = Colors.blueGrey,
    this.textStyleTitle,
    this.textStyleSubTitle,
    this.alignment = Alignment.topCenter,
    this.duration = const Duration(seconds: 3),
    this.title = "My Title",
    this.subTitle = "My subtitle with max 1 line",
  });

  OverlayEntry _buildOverlay() {
    return OverlayEntry(builder: (context) {
      return Align(
        alignment: alignment,
        child: AchievementWidget(
          title: title,
          subTitle: subTitle,
          duration: duration,
          listener: listener,
          onTap: onTap,
          isCircle: isCircle,
          elevation: elevation,
          textStyleSubTitle: textStyleSubTitle,
          textStyleTitle: textStyleTitle,
          icon: icon,
          typeAnimationContent: typeAnimationContent,
          borderRadius: borderRadius,
          color: color,
          finish: () {
            _hide();
          },
        ),
      );
    });
  }

  void show() {
    if (_overlayEntry == null) {
      _overlayEntry = _buildOverlay();
      Overlay.of(_context)!.insert(_overlayEntry!);
    }
  }

  void _hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}