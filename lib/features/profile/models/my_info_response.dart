class MyInfoResponse {
  final int id;
  final String fullName;
  final String jobPosition;
  final DateTime dateOfBirth;
  final String gender;
  final String idNumber;
  final String phone;
  final String personalEmail;
  final String address;
  final String employeeCode;
  final String department;
  final String position;
  final String seniority;
  final String companyEmail;
  final DateTime joinDate;
  final String avatarUrl;

  MyInfoResponse({
    required this.id,
    required this.fullName,
    required this.jobPosition,
    required this.dateOfBirth,
    required this.gender,
    required this.idNumber,
    required this.phone,
    required this.personalEmail,
    required this.address,
    required this.employeeCode,
    required this.department,
    required this.position,
    required this.seniority,
    required this.companyEmail,
    required this.joinDate,
    required this.avatarUrl,
  });

  factory MyInfoResponse.fromJson(Map<String, dynamic> json) {
    return MyInfoResponse(
      id: json['id'] ?? 0,
      fullName: json['fullName'] ?? "",
      jobPosition: json['jobPosition'] ?? "",
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      gender: json['gender'] ?? "",
      idNumber: json['idNumber'] ?? "",
      phone: json['phone'] ?? "",
      personalEmail: json['personalEmail'] ?? "",
      address: json['address'] ?? "",
      employeeCode: json['employeeCode'] ?? "",
      department: json['department'] ?? "",
      position: json['position'] ?? "",
      seniority: json['seniority'] ?? "",
      companyEmail: json['companyEmail'] ?? "",
      joinDate: DateTime.parse(json['joinDate']),
      avatarUrl: json['avatarUrl'] ?? "",
    );
  }
}
