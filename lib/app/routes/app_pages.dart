import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/latihan/bindings/latihan_binding.dart';
import '../modules/latihan/views/latihan_view.dart';
import '../modules/latihan_match_text/bindings/latihan_match_text_binding.dart';
import '../modules/latihan_match_text/views/latihan_match_text_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/materi/bindings/materi_binding.dart';
import '../modules/materi/views/materi_view.dart';
import '../modules/materi_ar/bindings/materi_ar_binding.dart';
import '../modules/materi_ar/views/materi_ar_view.dart';
import '../modules/materi_drug/bindings/materi_drug_binding.dart';
import '../modules/materi_drug/views/materi_drug_view.dart';
import '../modules/pengucapan/bindings/pengucapan_binding.dart';
import '../modules/pengucapan/views/pengucapan_view.dart';
import '../modules/pengucapan_gambar/bindings/pengucapan_gambar_binding.dart';
import '../modules/pengucapan_gambar/views/pengucapan_gambar_view.dart';
import '../modules/pengucapan_penjelasan/bindings/pengucapan_penjelasan_binding.dart';
import '../modules/pengucapan_penjelasan/views/pengucapan_penjelasan_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/riwayat/bindings/riwayat_binding.dart';
import '../modules/riwayat/views/riwayat_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';
import '../modules/starter/bindings/starter_binding.dart';
import '../modules/starter/views/starter_view.dart';
import '../modules/tentang/bindings/tentang_binding.dart';
import '../modules/tentang/views/tentang_view.dart';
import '../modules/visual/bindings/visual_binding.dart';
import '../modules/visual/views/visual_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn, // Efek transisi untuk Home
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.VISUAL,
      page: () => const VisualView(),
      binding: VisualBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.MATERI,
      page: () => const MateriView(),
      binding: MateriBinding(),
    ),
    GetPage(
      name: _Paths.MATERI_DRUG,
      page: () => const MateriDrugView(),
      binding: MateriDrugBinding(),
    ),
    GetPage(
      name: _Paths.PENGUCAPAN,
      page: () => const PengucapanView(),
      binding: PengucapanBinding(),
    ),
    GetPage(
      name: _Paths.PENGUCAPAN_GAMBAR,
      page: () => const PengucapanGambarView(),
      binding: PengucapanGambarBinding(),
    ),
    GetPage(
      name: _Paths.PENGUCAPAN_PENJELASAN,
      page: () => const PengucapanPenjelasanView(),
      binding: PengucapanPenjelasanBinding(),
    ),
    GetPage(
      name: _Paths.LATIHAN,
      page: () => const LatihanView(),
      binding: LatihanBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.LATIHAN_MATCH_TEXT,
      page: () => const LatihanMatchTextView(),
      binding: LatihanMatchTextBinding(),
    ),
    GetPage(
      name: _Paths.MATERI_AR,
      page: () => MateriArView(),
      binding: MateriArBinding(),
     
    ),
    GetPage(
      name: _Paths.STARTER,
      page: () => const StarterView(),
      binding: StarterBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.TENTANG,
      page: () => const TentangView(),
      binding: TentangBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.RIWAYAT,
      page: () => const RiwayatView(),
      binding: RiwayatBinding(),
    ),
  ];
}
