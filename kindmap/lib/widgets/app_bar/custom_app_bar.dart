import 'package:flutter/material.dart';
import 'package:kindmap/core/app_export.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(
          key: key,
        );

  final double? height;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 56.v,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        SizeUtils.width,
        height ?? 56.v,
      );
  _getStyle() {
    switch (styleType) {
      case Style.bgFill_1:
        return Container(
          height: 72.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.gray100,
          ),
        );
      case Style.bgFill_2:
        return Container(
          height: 63.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.gray60001,
          ),
        );
      case Style.bgFill_3:
        return Container(
          height: SizeUtils.height,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.gray80003,
          ),
        );
      case Style.bgFill:
        return Container(
          height: SizeUtils.height,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: appTheme.blueGray50,
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgFill_1,
  bgFill_2,
  bgFill_3,
  bgFill,
}
