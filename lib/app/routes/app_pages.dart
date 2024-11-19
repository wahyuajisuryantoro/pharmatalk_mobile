import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/materi/bindings/materi_binding.dart';
import '../modules/materi/views/materi_view.dart';
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
import '../modules/visual/bindings/visual_binding.dart';
import '../modules/visual/views/visual_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.REGISTER;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
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
  ];
}
