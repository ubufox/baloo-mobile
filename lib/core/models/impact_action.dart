import 'package:baloo/core/models/action_data.dart';


class ImpactAction {
  final String message;
  final List<ActionData> impact;

  const ImpactAction({
    this.message,
    this.impact,
  });
}

final actions = [
  new ImpactAction(
    message: "I ate a plant-based meal",
    impact: [
      new ActionData(
        material: 'water',
        amount: 165.85,
        unit: 'gal',
      ),
      new ActionData(
        material: 'CO2',
        amount: 0.63,
        unit: 'kg',
      ),
    ],
  ),
]
