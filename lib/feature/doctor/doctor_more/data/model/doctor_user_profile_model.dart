// class DoctorUserProfileModel {
//   final String name;
//   final String age;
//   final String weight;
//   final String height;
//   final String bloodGroup;
//   final String about;
//
//   DoctorUserProfileModel({
//     required this.name,
//     required this.age,
//     required this.weight,
//     required this.height,
//     required this.bloodGroup,
//     required this.about,
//   });
//
//   factory DoctorUserProfileModel.fromJson(Map<String, dynamic> json) {
//     return DoctorUserProfileModel(
//       name: json['name'] as String,
//       age: json['age'] as String,
//       weight: json['weight'] == null ? '' : json['weight'] as String,
//       height: json['height'] == null ? '' : json['height'] as String,
//       bloodGroup: json['bloodGroup'] == null ? '' : json['bloodGroup'] as String,
//       about: json['about'] == null ? '' : json['about'] as String,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'age': age,
//       'weight': weight,
//       'height': height,
//       'bloodGroup': bloodGroup,
//       'about': about,
//     };
//   }
// }

class DoctorUserProfileModel {
  final String name;
  final String age;
  final String weight;
  final String height;
  final String bloodGroup;
  final String about;

  DoctorUserProfileModel({
    required this.name,
    required this.age,
    required this.weight,
    required this.height,
    required this.bloodGroup,
    required this.about,
  });

  factory DoctorUserProfileModel.fromJson(Map<String, dynamic> json) {
    return DoctorUserProfileModel(
      name: json['name'] ?? '',
      age: json['age']?.toString() ?? '',
      weight: json['weight']?.toString() ?? '',
      height: json['height']?.toString() ?? '',
      bloodGroup: json['bloodGroup'] is List
          ? (json['bloodGroup'].isNotEmpty ? json['bloodGroup'][0].toString() : '')
          : (json['bloodGroup']?.toString() ?? ''),
      about: json['about'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'weight': weight,
      'height': height,
      'bloodGroup': bloodGroup,
      'about': about,
    };
  }
}
