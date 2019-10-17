class Accomplishment {
  final DateTime started;
  final DateTime completed;
  final double water;
  final double co2;
  final double plastic;
  final int actionCount;

  Accomplishment(
    this.started,
    this.completed,
    this.water,
    this.co2,
    this.plastic,
    this.actionCount,
  );

  DateTime getStartDate() {
    return started;
  }

  DateTime getCompletedDate() {
    return completed;
  }

  double getWaterSaved() {
    return water;
  }

  double getCO2Saved() {
    return co2;
  }

  double getPlasticSaved() {
    return plastic;
  }

  int getActionCount() {
    return actionCount;
  }
}
