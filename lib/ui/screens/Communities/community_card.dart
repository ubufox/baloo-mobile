import 'package:flutter/material.dart';

import 'package:baloo/core/constants/routes.dart';

// Models
import 'package:baloo/core/models/community.dart';


class CommunityCard extends StatelessWidget{
  CommunityCard({
    @required this.community,
  });

  final Community community;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            RoutePaths.CommunityDetail,
            arguments: community,
          );
        },
        child: Container(
          height: 200,
          width: 200,
          margin: new EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              new BoxShadow(
                color: Color(0x0F000000),
                offset: new Offset(0.0, 4.0),
                blurRadius: 12.0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _nameAndMembers(
                name: community.name,
                members: community.members,
              ),
              _location(location: community.location),
            ]
          ),
        ),
      ),
    );
  }
}


class _nameAndMembers extends StatelessWidget {
  _nameAndMembers({
    @required this.name,
    @required this.members,
  });

  final String name;
  final String members;

  @override
  Widget build(BuildContext) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _name(name: '$name'),
          _members(members: '$members'),
        ],
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
      margin: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 4.0),
      child: Text(
        '$name',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Color(0xFF2F2F33),
          fontFamily: 'Muli',
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
    );
  }
}

class _members extends StatelessWidget {
  _members({ @required this.members });

  final String members;

  @override
  Widget build(BuildContext) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
      child: Text(
        '$members',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Color(0xFF979797),
          fontFamily: 'Muli',
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
    );
  }
}

class _location extends StatelessWidget {
  _location({ @required this.location });

  final String location;

  @override
  Widget build(BuildContext) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 20.0),
      child: Text(
        '$location',
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Color(0xFF595959),
          fontFamily: 'Muli',
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}
