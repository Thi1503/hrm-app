class CheckInRequest {
  final double latitude;
  final double longitude;
  final String deviceInfo;

  CheckInRequest({
    required this.latitude,
    required this.longitude,
    required this.deviceInfo,
  });

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'deviceInfo': deviceInfo,
    };
  }
}
