import 'package:medication_reminder/Core/Utils/Classes/medicine_type.dart';
import 'package:rxdart/rxdart.dart';

import '../../Models/errors.dart';

class NewEntryBloc {
  BehaviorSubject<MedicineType>? _selectedMedicineType$;
  ValueStream<MedicineType>? get selectedMedicineType =>
      _selectedMedicineType$!.stream;

  BehaviorSubject<int>? _selectedIntervals$;
  BehaviorSubject<int>? get selectedIntervals => _selectedIntervals$;

  BehaviorSubject<String>? _selectedTimeOfDay$;
  BehaviorSubject<String>? get selectedTimeOfDay => _selectedTimeOfDay$;

  //errorState
  BehaviorSubject<EntryError>? _errorState$;
  BehaviorSubject<EntryError>? get errorState => _errorState$;

  NewEntryBloc() {
    _selectedMedicineType$ =
        BehaviorSubject<MedicineType>.seeded(MedicineType.none);
    _selectedTimeOfDay$ = BehaviorSubject<String>.seeded('none');
    _selectedIntervals$ = BehaviorSubject<int>.seeded(0);
    _errorState$ = BehaviorSubject<EntryError>();
  }

  void dispose() {
  _selectedMedicineType$!.close();
  _selectedTimeOfDay$!.close();
  _selectedIntervals$!.close();
  _errorState$!.close(); 
}

  void submitError(EntryError error) {
    _errorState$!.add(error);
  }

  void updateInterval(int interval) {
    _selectedIntervals$!.add(interval);
  }

  void updateTime(String time) {
    _selectedTimeOfDay$!.add(time);
  }

  void updateSelectedMedicine(MedicineType type) {
    MedicineType currentType = _selectedMedicineType$!.value;
    if (currentType == type) {
      _selectedMedicineType$!.add(MedicineType.none);
    } else {
      _selectedMedicineType$!.add(type);
    }
  }
}
