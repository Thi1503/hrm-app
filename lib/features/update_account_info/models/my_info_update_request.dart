import 'package:do_an_application/features/profile/models/gender_enum.dart';
import 'package:do_an_application/utils/date_utils.dart';

class MyInfoUpdateRequest {
  final String fullName;
  final String citizenId;
  final Gender gender;
  final DateTime dateOfBirth;
  final String phoneNumber;
  final String email;
  final String address;

  MyInfoUpdateRequest({
    required this.fullName,
    required this.citizenId,
    required this.gender,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.email,
    required this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'citizenId': citizenId,
      'gender': gender.value,
      'dateOfBirth': convertDateToStringDefault(dateOfBirth),
      'phoneNumber': phoneNumber,
      'email': email,
      'address': address,
    };
  }
}
