part of 'check_in_page.dart';

extension CheckInWidget on CheckInPage {
  Widget _buildBody() {
    return Obx(() {
      if (controller.isLoadingLocation.value) {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Đang lấy vị trí GPS...'),
            ],
          ),
        );
      }

      final position = controller.currentPosition.value;

      if (position == null) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_off, size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              const Text(
                'Không thể lấy vị trí',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('Vui lòng bật GPS và cấp quyền truy cập vị trí'),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () => controller.getCurrentLocation(),
                icon: const Icon(Icons.refresh),
                label: const Text('Thử lại'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary2,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        );
      }

      return Column(
        children: [
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(position.latitude!, position.longitude!),
                initialZoom: 16.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://mt1.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                  userAgentPackageName: 'com.example.do_an_application',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(position.latitude!, position.longitude!),
                      width: 60,
                      height: 60,
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 50,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _buildLocationInfo(),
        ],
      );
    });
  }

  Widget _buildLocationInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          )
        ],
      ),
      child: Obx(() {
        final position = controller.currentPosition.value;
        if (position == null) return const SizedBox();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.red, size: 20),
                const SizedBox(width: 8),
                const Text(
                  'Vị trí hiện tại',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Vĩ độ: ${position.latitude!.toStringAsFixed(6)}',
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              'Kinh độ: ${position.longitude!.toStringAsFixed(6)}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              'Thiết bị: ${controller.deviceInfo.value}',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Text(
              'Độ chính xác: ${position.accuracy!.toStringAsFixed(1)}m',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildBottomAction() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => Get.back(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Hủy',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: ElevatedButton.icon(
              onPressed: () {
                if (isCheckOut) {
                  controller.checkOut();
                } else {
                  controller.checkIn();
                }
              },
              icon: Icon(isCheckOut ? Icons.logout : Icons.login),
              label: Text(
                isCheckOut ? 'Check-out' : 'Check-in',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary2,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
