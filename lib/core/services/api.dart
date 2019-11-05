import 'package:baloo/core/models/community.dart';
import 'package:baloo/core/models/impact_action.dart';
import 'package:baloo/core/models/action_data.dart';
import 'package:baloo/core/models/user_impact.dart';


class AppData {
  List<Community> userCommunities;
  List<Community> communitySearchResults;
  List<ImpactAction> pendingActions;
  List<ImpactAction> actionSearchResults;
  UserImpact userImpact;
  ImpactAction userWeeklyAction;

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

  /* TODO mjf: Community API Endpoints
  void joinCommunity(community) {
    app.userCommunities.insert(app.userCommunities.length, community);
  }

  void leaveCommunity(community) {
    app.userCommunities.insert(app.userCommunities.length, community);
  }
  */

  List<Community> searchCommunities([String query, String filter]) {
    return appData.communitySearchResults;
  }

  List<ImpactAction> getPendingActions() {
    return appData.pendingActions;
  }

  UserImpact getUserImpact() {
    return appData.userImpact;
  }

  ImpactAction getWeeklyAction() {
    return appData.userWeeklyAction;
  }

  List<ImpactAction> getActionSearchResults() {
    return appData.actionSearchResults;
  }

  void _initializeAppData() {
    appData.pendingActions = [];
    appData.userImpact = new UserImpact(
      46458.5,
      158.8,
      260,
    );
    appData.userWeeklyAction = new ImpactAction([
        new ActionData(
          'water',
          627.81,
        ),
        new ActionData(
          'co2',
          0.63,
        ),
      ],
      true,
      'I ate a plant-based meal',
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
        '268K members',
        'Washington, DC',
        'assets/images/npca.jpg',
        'About text',
      ),
      new Community(
        106,
        'TreePeople',
        '5.8K members',
        'Beverly Hills, CA',
        'assets/images/treepeople.jpg',
        'About text',
      ),
    ];

    appData.actionSearchResults = [
      new ImpactAction(
        [
          new ActionData(
            'water',
            627.81,
          ),
          new ActionData(
            'co2',
            0.63,
          ),
        ],
        false,
        'Eat a plant-based meal',
      ),
      new ImpactAction(
        [
          new ActionData(
            'co2',
            0.1859,
          ),
        ],
        false,
        'Wash your clothes in cold water',
      ),
      new ImpactAction(
        [],
        false,
        'Use a reusable shopping bag when shopping',
      ),
      new ImpactAction(
        [
          new ActionData(
            'co2',
            2.4363,
          ),
        ],
        false,
        'Skip the straw',
      ),
      new ImpactAction(
        [
          new ActionData(
            'co2',
            0.569,
          ),
        ],
        false,
        'Use a personal mug or tumbler instead of a disposable cup',
      ),
    ];
  }
}
