import 'package:baloo/core/models/community.dart';
import 'package:baloo/core/models/impact_action.dart';
import 'package:baloo/core/models/user_impact.dart';


class AppData {
  List<Community> userCommunities;
  List<Community> communitySearchResults;
  List<ImpactAction> pendingActions;
  UserImpact userImpact;

  AppData();
}


class Api {
  AppData appData = AppData();

  Api() {
    _initializeAppData();
  }

  List<Community> getUserCommunities() {
    return appData.userCommunities;
  }

  List<Community> searchCommunities() {
    return appData.communitySearchResults;
  }

  List<ImpactAction> getPendingActions() {
    return appData.pendingActions;
  }

  UserImpact getUserImpact() {
    return appData.userImpact;
  }

  void _initializeAppData() {
    appData.pendingActions = [];
    appData.userImpact = new UserImpact(
      46458.5,
      158.8,
      260,
    );

    appData.userCommunities = [
      new Community(
        101,
        "Grand View Farmer's Market",
        '888 members',
        'Los Angeles, CA',
        'assets/images/default_community.jpg',
        'About text',
      ),
    ];

    appData.communitySearchResults = [
      new Community(
        104,
        'Heal the Bay',
        '14.2K members',
        'Los Angeles, CA',
        'assets/images/default_community.jpg',
        'About text',
      ),
      new Community(
        103,
        'The Sierra Club',
        '67.8K members',
        'Oakland, CA',
        'assets/images/sierraclub.jpg',
        "The Sierra Club is the most enduring and influential grassroots environmental organization in the United States. We amplify the power of our 3.5+ million members and supporters to defend everyone’s right to a healthy world.",
      ),
      new Community(
        102,
        'Surfrider Foundation',
        '683 members',
        'Santa Monica, CA',
        'assets/images/default_community.jpg',
        'About text',
      ),
      new Community(
        101,
        "Grand View Farmer's Market",
        '888 members',
        'Los Angeles, CA',
        'assets/images/default_community.jpg',
        'About text',
      ),
      new Community(
        105,
        'National Parks Conservation Association',
        '268K',
        'Washington, DC',
        'assets/images/npca.jpg',
        'About text',
      ),
      new Community(
        106,
        'TreePeople',
        '5.8K',
        'Beverly Hills, CA',
        'assets/images/treepeople.jpg',
        'About text',
      ),
    ];
  }
}
