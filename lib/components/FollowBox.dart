import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:kindmap/components/BoxHandle.dart';
import 'package:kindmap/components/SocialTile.dart';
import 'package:kindmap/themes/KMTheme.dart';

class FollowBox extends StatefulWidget {
  final String s_media;
  FollowBox({super.key, required this.s_media});

  @override
  State<FollowBox> createState() => FollowBoxState();
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

class FollowBoxState extends State<FollowBox> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: KMTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Color(0x3B1D2429),
              offset: Offset(
                0.0,
                -3,
              ),
            )
          ],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            BoxHandle(context),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.s_media == "instagram") ...[
                    SocialTile(context, "Abdul Rafey Waleed", "instagram",
                        "https://www.instagram.com/rafeywaleed_a5"),
                    SocialTile(context, "Mohammed Azim Moula", "instagram",
                        "https://www.instagram.com/Azim"),
                    SocialTile(context, "Syeda Arriyan Fatima", "instagram",
                        "https://www.instagram.com/rArriyan"),
                  ] else if (widget.s_media == "facebook") ...[
                    SocialTile(context, "Abdul Rafey Waleed", "facebook",
                        "https://www.facebook.com/rafeywaleed_a5"),
                    SocialTile(context, "Mohammed Azim Moula", "facebook",
                        "https://www.facebook.com/azimM"),
                    SocialTile(context, "Syeda Arriyan Fatima", "facebook",
                        "https://www.facebook.com/arriyanF"),
                  ] else ...[
                    SocialTile(context, "Abdul Rafey Waleed", "linkedin",
                        "https://www.linkedin.com/in/abdul-rafey-waleed-516052282/"),
                    SocialTile(context, "Mohammed Azim Moula", "linkedin",
                        "https://www.linkedin.com/in/mohammed-azim-moula-7b07b4279/"),
                    SocialTile(context, "Syeda Arriyan Fatima", "linkedin",
                        "https://www.linkedin.com/in/syeda-arriyan-fatima-a71346301/"),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//  if (follow == 0)
//                   {
//                     showMenu(
//                         context: context,
//                         position:
//                             RelativeRect.fromLTRB(0, 0, 0, size.height - 200),
//                         items: [
//                           const PopupMenuItem(
//                             value:
//                                 'https://www.linkedin.com/in/abdul-rafey-waleed-516052282/',
//                             child: ListTile(
//                               leading: Icon(FontAwesomeIcons.linkedin),
//                               title: Text('Abdul Rafey Waleed'),
//                             ),
//                           ),
//                           const PopupMenuItem(
//                             value:
//                                 'https://www.linkedin.com/in/mohammed-azim-moula-7b07b4279/',
//                             child: ListTile(
//                               leading: Icon(FontAwesomeIcons.linkedin),
//                               title: Text('Mohammed Azim Moula'),
//                             ),
//                           ),
//                           const PopupMenuItem(
//                             value:
//                                 'https://www.linkedin.com/in/syeda-arriyan-fatima-a71346301/',
//                             child: ListTile(
//                               leading: Icon(FontAwesomeIcons.linkedin),
//                               title: Text('Arriyan Fatima'),
//                             ),
//                           ),
//                         ]).then<void>((String? itemSelected) {
//                       if (itemSelected == null) return;
//                       launch(itemSelected);
//                     }),
//                     print('IconButton pressed ...'),
//                   }
//                 else if (follow == 1)
//                   {
//                     showMenu(
//                         context: context,
//                         position:
//                             RelativeRect.fromLTRB(0, 0, 160, size.height * 0.6),
//                         items: [
//                           const PopupMenuItem(
//                             value:
//                                 'https://www.linkedin.com/in/abdul-rafey-waleed-516052282/',
//                             child: ListTile(
//                               leading: Icon(FontAwesomeIcons.linkedin),
//                               title: Text('Abdul Rafey Waleed'),
//                             ),
//                           ),
//                           const PopupMenuItem(
//                             value:
//                                 'https://www.linkedin.com/in/mohammed-azim-moula-7b07b4279/',
//                             child: ListTile(
//                               leading: Icon(FontAwesomeIcons.linkedin),
//                               title: Text('Mohammed Azim Moula'),
//                             ),
//                           ),
//                           const PopupMenuItem(
//                             value:
//                                 'https://www.linkedin.com/in/syeda-arriyan-fatima-a71346301/',
//                             child: ListTile(
//                               leading: Icon(FontAwesomeIcons.linkedin),
//                               title: Text('Arriyan Fatima'),
//                             ),
//                           ),
//                         ]).then<void>((String? itemSelected) {
//                       if (itemSelected == null) return;
//                       launch(itemSelected);
//                     }),
//                     print('IconButton pressed ...'),
//                   }
//                 else if (follow == 2)
//                   {
//                     showMenu(
//                         color: KMTheme.of(context).secondaryBackground,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(16)),
//                         context: context,
//                         position: RelativeRect.fromLTRB(
//                             size.width * 2,
//                             size.height * 0.99,
//                             size.width * 0.2,
//                             size.height * 0),
//                         items: [
//                           const PopupMenuItem(
//                             value:
//                                 'https://www.linkedin.com/in/abdul-rafey-waleed-516052282/',
//                             child: ListTile(
//                               leading: Icon(FontAwesomeIcons.linkedin),
//                               title: Text('Abdul Rafey Waleed'),
//                             ),
//                           ),
//                           const PopupMenuItem(
//                             value:
//                                 'https://www.linkedin.com/in/mohammed-azim-moula-7b07b4279/',
//                             child: ListTile(
//                               leading: Icon(FontAwesomeIcons.linkedin),
//                               title: Text('Mohammed Azim Moula'),
//                             ),
//                           ),
//                           const PopupMenuItem(
//                             value:
//                                 'https://www.linkedin.com/in/syeda-arriyan-fatima-a71346301/',
//                             child: ListTile(
//                               leading: Icon(FontAwesomeIcons.linkedin),
//                               title: Text('Arriyan Fatima'),
//                             ),
//                           ),
//                         ]).then<void>((String? itemSelected) {
//                       if (itemSelected == null) return;
//                       launch(itemSelected);
//                     }),
//                     print('IconButton pressed ...'),
//                   }