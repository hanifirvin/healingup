import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';
import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';
import '/breath_exercise/breathe/breathe_widget.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const NavBarPage() : const WelcomeWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const WelcomeWidget(),
        ),
        FFRoute(
          name: 'welcome',
          path: '/welcome',
          builder: (context, params) => const WelcomeWidget(),
        ),
        FFRoute(
          name: 'loginPage',
          path: '/loginPage',
          builder: (context, params) => const LoginPageWidget(),
        ),
        FFRoute(
          name: 'registerPage',
          path: '/registerPage',
          builder: (context, params) => const RegisterPageWidget(),
        ),
        FFRoute(
          name: 'homePage',
          path: '/homePage',
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'errorPage',
          path: '/errorPage',
          builder: (context, params) => const ErrorPageWidget(),
        ),
        FFRoute(
          name: 'pengukuran_page',
          path: '/pengukuranPage',
          builder: (context, params) => const PengukuranPageWidget(),
        ),
        FFRoute(
          name: 'quiz1',
          path: '/quiz',
          builder: (context, params) => const Quiz1Widget(),
        ),
        FFRoute(
          name: 'quiz2',
          path: '/quiz2',
          builder: (context, params) => const Quiz2Widget(),
        ),
        FFRoute(
          name: 'quiz3',
          path: '/quiz3',
          builder: (context, params) => const Quiz3Widget(),
        ),
        FFRoute(
          name: 'quiz4',
          path: '/quiz4',
          builder: (context, params) => const Quiz4Widget(),
        ),
        FFRoute(
          name: 'quiz5',
          path: '/quiz5',
          builder: (context, params) => const Quiz5Widget(),
        ),
        FFRoute(
          name: 'quiz6',
          path: '/quiz6',
          builder: (context, params) => const Quiz6Widget(),
        ),
        FFRoute(
          name: 'quiz7',
          path: '/quiz7',
          builder: (context, params) => const Quiz7Widget(),
        ),
        FFRoute(
          name: 'quiz8',
          path: '/quiz8',
          builder: (context, params) => const Quiz8Widget(),
        ),
        FFRoute(
          name: 'quiz9',
          path: '/quiz9',
          builder: (context, params) => const Quiz9Widget(),
        ),
        FFRoute(
          name: 'quiz10',
          path: '/quiz10',
          builder: (context, params) => const Quiz10Widget(),
        ),
        FFRoute(
          name: 'hasil_pengukuran_page',
          path: '/hasilPengukuranPage',
          builder: (context, params) => const HasilPengukuranPageWidget(),
        ),
        FFRoute(
          name: 'profile_page',
          path: '/profile_page',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'profile_page')
              : const ProfilePageWidget(),
        ),
        FFRoute(
          name: 'edit_profile',
          path: '/editProfile',
          builder: (context, params) => const EditProfileWidget(),
        ),
        FFRoute(
          name: 'Syarat_Ketentuan_Page',
          path: '/syaratKetentuanPage',
          builder: (context, params) => const SyaratKetentuanPageWidget(),
        ),
        FFRoute(
          name: 'jurnal_page',
          path: '/jurnalPage',
          builder: (context, params) => const JurnalPageWidget(),
        ),
        FFRoute(
          name: 'riwayat_page',
          path: '/riwayatPage',
          builder: (context, params) => const RiwayatPageWidget(),
        ),
        FFRoute(
          name: 'tambah_jurnal_page',
          path: '/tambahJurnalPage',
          builder: (context, params) => const TambahJurnalPageWidget(),
        ),
        FFRoute(
          name: 'calling_pages',
          path: '/callingPages',
          builder: (context, params) => const CallingPagesWidget(),
        ),
        FFRoute(
          name: 'edit_jurnal_page',
          path: '/editJurnalPage',
          builder: (context, params) => EditJurnalPageWidget(
            judulJurnal: params.getParam(
              'judulJurnal',
              ParamType.String,
            ),
            detailJurnal: params.getParam(
              'detailJurnal',
              ParamType.String,
            ),
            sliderJurnal: params.getParam(
              'sliderJurnal',
              ParamType.double,
            ),
            createdJurnal: params.getParam(
              'createdJurnal',
              ParamType.DateTime,
            ),
            jurnalRef: params.getParam(
              'jurnalRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['jurnal'],
            ),
          ),
        ),
        FFRoute(
          name: 'daftar_pasien',
          path: '/daftarPasien',
          builder: (context, params) => const DaftarPasienWidget(),
        ),
        FFRoute(
          name: 'konseling_baru',
          path: '/konselingBaru',
          builder: (context, params) => const KonselingBaruWidget(),
        ),
        FFRoute(
          name: 'after_booking_baru',
          path: '/afterBookingBaru',
          builder: (context, params) => AfterBookingBaruWidget(
            bookingId: params.getParam(
              'bookingId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'riwayat_konseling',
          path: '/riwayatKonseling',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'riwayat_konseling')
              : const RiwayatKonselingWidget(),
        ),
        FFRoute(
          name: 'detail_sesi_booking',
          path: '/detailSesiBooking',
          builder: (context, params) => DetailSesiBookingWidget(
            bookingId: params.getParam(
              'bookingId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'detail_riwayat_page',
          path: '/detailRiwayatPage',
          builder: (context, params) => DetailRiwayatPageWidget(
            sessionId: params.getParam(
              'sessionId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'pilih_dokter_ajukan_jadwal',
          path: '/pilihDokterAjukanJadwal',
          builder: (context, params) => const PilihDokterAjukanJadwalWidget(),
        ),
        FFRoute(
          name: 'dokter_page_utama',
          path: '/dokterPageUtama',
          builder: (context, params) => const DokterPageUtamaWidget(),
        ),
        FFRoute(
          name: 'tentukan_jadwal_konseling_baru',
          path: '/tentukanJadwalKonselingBaru',
          builder: (context, params) => TentukanJadwalKonselingBaruWidget(
            doctorId: params.getParam(
              'doctorId',
              ParamType.String,
            ),
            doctorName: params.getParam(
              'doctorName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'atur_jadwal_dokter_baru',
          path: '/aturJadwalDokterBaru',
          builder: (context, params) => const AturJadwalDokterBaruWidget(),
        ),
        FFRoute(
          name: 'edit_profile_dokter_baru',
          path: '/editProfileDokterBaru',
          builder: (context, params) => const EditProfileDokterBaruWidget(),
        ),
        FFRoute(
          name: 'profile_pilih_dokter_dan_rating',
          path: '/profilePilihDokterDanRating',
          builder: (context, params) => ProfilePilihDokterDanRatingWidget(
            doctorId: params.getParam(
              'doctorId',
              ParamType.String,
            ),
            doctorName: params.getParam(
              'doctorName',
              ParamType.String,
            ),
            doctorExperience: params.getParam(
              'doctorExperience',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'detail_pasien_baru',
          path: '/detailPasienBaru',
          builder: (context, params) => DetailPasienBaruWidget(
            bookingID: params.getParam(
              'bookingID',
              ParamType.String,
            ),
            patientId: params.getParam(
              'patientId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'riwayat_jurnal_pasien',
          path: '/riwayatJurnalPasien',
          builder: (context, params) => RiwayatJurnalPasienWidget(
            patientID: params.getParam(
              'patientID',
              ParamType.String,
            ),
            bookingRef: params.getParam(
              'bookingRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['booking'],
            ),
          ),
        ),
        FFRoute(
          name: 'home_dashboard_baru',
          path: '/homeDashboardBaru',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'home_dashboard_baru')
              : const HomeDashboardBaruWidget(),
        ),
        FFRoute(
          name: 'riwayat_kessler_pasien',
          path: '/riwayatKesslerPasien',
          builder: (context, params) => RiwayatKesslerPasienWidget(
            patientID: params.getParam(
              'patientID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'isi_jurnal_pasien',
          path: '/isiJurnalPasien',
          builder: (context, params) => IsiJurnalPasienWidget(
            jurnalID: params.getParam(
              'jurnalID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['jurnal'],
            ),
          ),
        ),
        FFRoute(
          name: 'detail_sesi_dokter',
          path: '/detailSesiDokter',
          builder: (context, params) => DetailSesiDokterWidget(
            bookingId: params.getParam(
              'bookingId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'latihan_pernapasan',
          path: '/latihanPernapasan',
          builder: (context, params) => const BreatheWidget(),
        ),
        FFRoute(
          name: 'begin_breath_equal',
          path: '/beginBreathEqual',
          builder: (context, params) => BeginBreathEqualWidget(
            initialCycles: params.getParam(
              'initialCycles',
              ParamType.int,
            ),
            breathType: params.getParam(
              'breathType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'begin_breath_box',
          path: '/beginBreathBox',
          builder: (context, params) => BeginBreathBoxWidget(
            initialCycles: params.getParam(
              'initialCycles',
              ParamType.int,
            ),
            breathType: params.getParam(
              'breathType',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'breathe',
          path: '/breathe',
          builder: (context, params) => const BreatheWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/welcome';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
