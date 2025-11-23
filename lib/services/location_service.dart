// file: lib/services/location_service.dart

import 'package:geolocator/geolocator.dart';

class LocationService {
  /// Meminta izin lokasi dan mendapatkan posisi saat ini.
  Future<Position> getCurrentLocation() async {
    // 1. Cek apakah layanan lokasi (GPS) aktif
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Jika GPS mati
      return Future.error('Location services are disabled.');
    }

    // 2. Cek status izin aplikasi
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Minta izin lokasi dari user
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Jika user menolak izin
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Izin ditolak permanen
      return Future.error(
        'Location permissions are permanently denied, please enable it from settings.',
      );
    }

    // 3. Jika izin diberikan, ambil posisi saat ini
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
