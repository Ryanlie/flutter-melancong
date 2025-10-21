// file: lib/screens/splash_screen.dart

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location_service.dart';
import 'interest_selection_screen.dart'; // Ganti jika nama file berbeda

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LocationService _locationService = LocationService();
  String _statusMessage = "Memuat...";
  bool _showLocationButton = false;

  @override
  void initState() {
    super.initState();
    _checkInitialPermission();
  }

  // Cek apakah izin sudah ada saat aplikasi dibuka
  void _checkInitialPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      // Izin sudah ada, langsung lanjut ke proses loading
      _requestLocationAndContinue(isInitial: true);
    } else {
      // Izin belum ada atau ditolak
      setState(() {
        _statusMessage = "Kami perlu akses lokasi Anda.";
        _showLocationButton = true;
      });
    }
  }

  // Meminta lokasi dan melanjutkan navigasi
  void _requestLocationAndContinue({bool isInitial = false}) async {
    setState(() {
      _showLocationButton = false;
      _statusMessage = isInitial
          ? "Memperoleh lokasi..."
          : "Meminta izin lokasi...";
    });

    try {
      // Fungsi ini akan meminta izin jika belum ada, atau langsung mengambil posisi
      await _locationService.getCurrentLocation();

      // Sukses mendapatkan lokasi, navigasi ke layar berikutnya
      await Future.delayed(const Duration(milliseconds: 500)); // Simulasi splash time

      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const InterestSelectionScreen(),
          ),
        );
      }
    } catch (e) {
      // Gagal (misal: GPS mati, user menolak, atau ditolak permanen)
      setState(() {
        _statusMessage = "Gagal: ${e.toString()}. \nTekan tombol untuk coba lagi.";
        _showLocationButton = true;
      });
    }
  }

  void _continueToInterestSelection() {
    // Navigasi menggunakan Named Route yang baru
    Navigator.of(context).pushReplacementNamed('/interests');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.location_on, size: 80, color: Color(0xFFf25aa6)),
              const SizedBox(height: 24),
              Text(
                'Temukan Event di Sekitar Anda',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 32),

              if (!_showLocationButton)
                const CircularProgressIndicator(color: Color(0xFFf25aa6)),

              const SizedBox(height: 16),
              Text(
                _statusMessage,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              if (_showLocationButton)
                Column(
                  children: [
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () => _requestLocationAndContinue(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFf25aa6),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: const Text('Tentukan Lokasi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}