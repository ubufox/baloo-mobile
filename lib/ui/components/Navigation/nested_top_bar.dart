import 'package:flutter/material.dart';


class NestedTopBar extends StatelessWidget implements PreferredSizeWidget{
  @override
  build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        tooltip: 'Back',
        onPressed: () {
          Navigator.pop(context, true);
        },
      ),
      title: Text('Back'),
    );
  }

  @override
  Size get preferredSize{
    new Size.fromHeight(48.0);
  }
}
