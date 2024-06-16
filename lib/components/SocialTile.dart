import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kindmap/themes/KMTheme.dart';
import 'package:url_launcher/url_launcher.dart';

Widget SocialTile(
    BuildContext context, String name, String platform, String link) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        color: KMTheme.of(context).secondaryBackground,
      ),
      child: Row(
        children: [
          Icon(
            platform == "instagram"
                ? FontAwesomeIcons.instagram
                : platform == "facebook"
                    ? FontAwesomeIcons.facebook
                    : FontAwesomeIcons.linkedin,
            color: KMTheme.of(context).primaryText,
          ),
          SizedBox(width: 8),
          InkWell(
            onTap: () async {
              if (await canLaunch(link)) {
                await launch(link);
              } else {
                throw 'Could not launch $link';
              }
            },
            child: Text(
              name,
              style: KMTheme.of(context).bodyText1,
            ),
          ),
        ],
      ),
    ),
  );
}

class SocialMediaIconButton extends StatelessWidget {
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;
  final double buttonSize;
  final Color fillColor;
  final Widget icon;
  final VoidCallback onPressed;

  SocialMediaIconButton({
    required this.borderColor,
    required this.borderRadius,
    required this.borderWidth,
    required this.buttonSize,
    required this.fillColor,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: IconButton(
        icon: icon,
        iconSize: buttonSize,
        onPressed: onPressed,
      ),
    );
  }
}
