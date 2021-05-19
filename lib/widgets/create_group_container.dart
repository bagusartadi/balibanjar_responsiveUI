import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/artadot.dart';
import 'package:flutter_facebook_responsive_ui/models/group_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/zwidgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GroupContainer extends StatelessWidget {
  final Group groups;
  final Function press;

  const GroupContainer({Key key, this.groups, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final bool isDesktop = Responsive.isDesktop(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 3.0),
      child: GestureDetector(
        onTap: press,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
          ),
          child: _GroupHeader(groups: groups),
        ),
      ),
    );
  }
}

class _GroupHeader extends StatelessWidget {
  final Group groups;

  const _GroupHeader({
    Key key,
    @required this.groups,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: groups.imageUrl),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'GROUP ${groups.caption}',
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              Row(
                children: [
                  Text(
                    'Created: ${groups.createdOn} • by ${groups.userCreator} • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  )
                ],
              ),
            ],
          ),
        ),
        IconButton(
          color: WarnaArtadi.balibanjar,
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            print('\npin/sort/edit/delete\nmaks 3 groups pinned');
          },
        ),
        IconButton(
            color: WarnaArtadi.balibanjar,
            icon: Icon(MdiIcons.pin),
            onPressed: () => print('pinned'))
      ],
    );
  }
}
