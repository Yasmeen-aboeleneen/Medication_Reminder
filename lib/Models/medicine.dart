class Medicine {
  final List<int>? notificationIDs;
  final String? medicineName;
  final int? dosage;
  final String? medicineType;
  final int? interval;
  final String? startTime;

  Medicine({
    required this.notificationIDs,
    required this.medicineName,
    required this.dosage,
    required this.medicineType,
    required this.interval,
    required this.startTime,
  });

  // Getters
  List<int> get getIDs => notificationIDs ?? [];
  String get getName => medicineName ?? '';
  int get getDosage => dosage ?? 0;
  String get getType => medicineType ?? '';
  int get getInterval => interval ?? 0;
  String get getStartTime => startTime ?? '';

  Map<String, dynamic> toJson() {
    return {
      'ids': notificationIDs,
      'name': medicineName,
      'dosage': dosage,
      'type': medicineType,
      'interval': interval,
      'time': startTime,
    };
  }

  factory Medicine.fromJson(Map<String, dynamic> parsedJson) {
    return Medicine(
      notificationIDs: (parsedJson['ids'] as List<dynamic>?)
          ?.map((id) => id as int)
          .toList(),
      medicineName: parsedJson['name'] as String?,
      dosage: parsedJson['dosage'] as int?,
      medicineType: parsedJson['type'] as String?,
      interval: parsedJson['interval'] as int?,
      startTime: parsedJson['time'] as String?,
    );
  }
}
