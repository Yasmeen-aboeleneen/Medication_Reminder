import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:medication_reminder/Models/medicine.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalBloc {
  final BehaviorSubject<List<Medicine>> _medicineList$;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  GlobalBloc()
      : _medicineList$ = BehaviorSubject<List<Medicine>>.seeded([]),
        flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin() {
    makeMedicineList();
  }

  BehaviorSubject<List<Medicine>> get medicineList$ => _medicineList$;

  /// Removes a [Medicine] from the list and cancels its notifications.
  Future<void> removeMedicine(Medicine toBeRemoved) async {
    SharedPreferences sharedUser = await SharedPreferences.getInstance();

    // Remove the medicine from the current list
    var updatedList = List<Medicine>.from(_medicineList$.value);
    updatedList.removeWhere(
        (medicine) => medicine.medicineName == toBeRemoved.medicineName);

    // Cancel all notifications for the medicine
    for (var id in toBeRemoved.notificationIDs!) {
      await flutterLocalNotificationsPlugin.cancel(id); // Correct: ID is int
    }

    // Update SharedPreferences
    List<String> updatedJsonList =
        updatedList.map((medicine) => jsonEncode(medicine.toJson())).toList();
    await sharedUser.setStringList('medicines', updatedJsonList);

    // Update the BehaviorSubject with the new list
    _medicineList$.add(updatedList);
  }

  /// Adds a new [Medicine] to the list and updates shared preferences.
  Future<void> updateMedicineList(Medicine newMedicine) async {
    // Add the new medicine to the current list
    var updatedList = List<Medicine>.from(_medicineList$.value);
    updatedList.add(newMedicine);
    _medicineList$.add(updatedList); // Notify listeners

    // Save the new list to SharedPreferences
    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    List<String> updatedJsonList =
        updatedList.map((medicine) => jsonEncode(medicine.toJson())).toList();
    await sharedUser.setStringList('medicines', updatedJsonList);
  }

  /// Loads the medicine list from SharedPreferences.
  Future<void> makeMedicineList() async {
    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    List<String>? jsonList = sharedUser.getStringList('medicines');

    // Convert JSON list back to List<Medicine>
    List<Medicine> loadedList = [];
    if (jsonList != null) {
      loadedList = jsonList
          .map((jsonMedicine) => Medicine.fromJson(jsonDecode(jsonMedicine)))
          .toList();
    }

    // Add loaded list to the BehaviorSubject
    _medicineList$.add(loadedList);
  }

  /// Disposes the [GlobalBloc] and closes streams.
  void dispose() {
    _medicineList$.close();
  }
}
