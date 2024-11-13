import 'dart:developer';

import 'package:health/health.dart';

class HealthDataService {
  final Health _health = Health();

  Future<int> getTodayStepCount(
      {List<RecordingMethod> recordingMethodsToFilter = const []}) async {
    int? steps;

    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);
    bool stepsPermission =
        await _health.hasPermissions([HealthDataType.STEPS]) ?? false;
    if (!stepsPermission) {
      stepsPermission =
          await _health.requestAuthorization([HealthDataType.STEPS]);
    }
    if (stepsPermission) {
      try {
        steps = await _health.getTotalStepsInInterval(
          midnight,
          now,
          includeManualEntry:
              !recordingMethodsToFilter.contains(RecordingMethod.manual),
        );
      } catch (error) {
        log("Exception in getTotalStepsInInterval: $error");
      }
    } else {
      log("Authorization not granted - error in authorization");
    }
    return steps ?? 0;
  }

  Future<int> getEnergyBurnedForTheDay(
      {List<RecordingMethod> recordingMethodsToFilter = const []}) async {
    int? energyBurned;

    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);
    bool energyPermission =
        await _health.hasPermissions([HealthDataType.ACTIVE_ENERGY_BURNED]) ??
            false;
    if (!energyPermission) {
      energyPermission = await _health
          .requestAuthorization([HealthDataType.ACTIVE_ENERGY_BURNED]);
    }
    if (energyPermission) {
      try {
        energyBurned = await _health.getTotalStepsInInterval(
          midnight,
          now,
          includeManualEntry:
              !recordingMethodsToFilter.contains(RecordingMethod.manual),
        );
      } catch (error) {
        log("Exception in getTotalStepsInInterval: $error");
      }
    } else {
      log("Authorization not granted - error in authorization");
    }
    return energyBurned ?? 0;
  }
}
