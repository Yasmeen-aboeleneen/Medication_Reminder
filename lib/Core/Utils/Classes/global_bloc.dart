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

  Future<void> removeMedicine(Medicine tobeRemoved) async {
    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    List<String> medicineJsonList = [];

    var blockList = _medicineList$.value;
    blockList.removeWhere((medicine) => medicine.medicineName == tobeRemoved.medicineName);

    for (var id in tobeRemoved.notificationIDs!) {
      await flutterLocalNotificationsPlugin.cancel(int.parse(id as String));
    }

    if (blockList.isNotEmpty) {
      medicineJsonList = blockList.map((medicine) => jsonEncode(medicine.toJson())).toList();
    }

    await sharedUser.setStringList('medicines', medicineJsonList);
    _medicineList$.add(blockList);
  }

  Future<void> updateMedicineList(Medicine newMedicine) async {
    var blocList = _medicineList$.value;
    blocList.add(newMedicine);
    _medicineList$.add(blocList);

    String newMedicineJson = jsonEncode(newMedicine.toJson());
    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    List<String> medicineJsonList = sharedUser.getStringList('medicines') ?? [];
    medicineJsonList.add(newMedicineJson);
    await sharedUser.setStringList('medicines', medicineJsonList);
  }

  Future<void> makeMedicineList() async {
    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    List<String>? jsonList = sharedUser.getStringList('medicines');
    List<Medicine> prefList = [];

    if (jsonList != null) {
      prefList = jsonList.map((jsonMedicine) {
        final userMap = jsonDecode(jsonMedicine);
        return Medicine.fromJson(userMap);
      }).toList();
    }

    _medicineList$.add(prefList);
  }

  void dispose() {
    _medicineList$.close();
  }
}
