import 'package:flutter/material.dart';

import 'package:baloo/core/constants/routes.dart';

// Models
import 'package:baloo/core/models/community.dart';


class CommunityListItem extends StatelessWidget {
  CommunityListItem({ @required this.community });

  final Community community;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 32.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            RoutePaths.CommunityDetail,
            arguments: community,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _communityImage(imageURL: community.getBanner()),
            _name(name: community.getName()),
            _location(location: community.getLocation()),
          ],
        ),
      ),
    );
  }
}

class _communityImage extends StatelessWidget {
  _communityImage({ @required this.imageURL });

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 161,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('$imageURL'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}

class _name extends StatelessWidget {
  _name({ @required this.name });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      child: Text(
        '$name',
        style: TextStyle(
          color: Color(0xFF2F2F33),
          fontFamily: 'Muli',
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
    );
  }
}

class _location extends StatelessWidget {
  _location({ @required this.location });

  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4.0),
      child: Text(
        '$location',
        style: TextStyle(
          color: Color(0xFF595959),
          fontFamily: 'Muli',
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}
