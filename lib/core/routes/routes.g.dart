// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $publicPageRoute,
  $createCompanyPageRoute,
  $notFoundPageRoute,
  $loginPageRoute,
  $homePageRoute,
  $customersPageRoute,
  $assetsPageRoute,
  $tripsPageRoute,
];

RouteBase get $publicPageRoute => GoRouteData.$route(
  path: '/public',

  factory: $PublicPageRouteExtension._fromState,
);

extension $PublicPageRouteExtension on PublicPageRoute {
  static PublicPageRoute _fromState(GoRouterState state) => PublicPageRoute();

  String get location => GoRouteData.$location('/public');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $createCompanyPageRoute => GoRouteData.$route(
  path: '/create-company',

  factory: $CreateCompanyPageRouteExtension._fromState,
);

extension $CreateCompanyPageRouteExtension on CreateCompanyPageRoute {
  static CreateCompanyPageRoute _fromState(GoRouterState state) =>
      CreateCompanyPageRoute();

  String get location => GoRouteData.$location('/create-company');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $notFoundPageRoute => GoRouteData.$route(
  path: '/not-found',

  factory: $NotFoundPageRouteExtension._fromState,
);

extension $NotFoundPageRouteExtension on NotFoundPageRoute {
  static NotFoundPageRoute _fromState(GoRouterState state) =>
      NotFoundPageRoute();

  String get location => GoRouteData.$location('/not-found');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginPageRoute => GoRouteData.$route(
  path: '/login',

  factory: $LoginPageRouteExtension._fromState,
);

extension $LoginPageRouteExtension on LoginPageRoute {
  static LoginPageRoute _fromState(GoRouterState state) => LoginPageRoute();

  String get location => GoRouteData.$location('/login');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homePageRoute =>
    GoRouteData.$route(path: '/', factory: $HomePageRouteExtension._fromState);

extension $HomePageRouteExtension on HomePageRoute {
  static HomePageRoute _fromState(GoRouterState state) => HomePageRoute();

  String get location => GoRouteData.$location('/');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $customersPageRoute => GoRouteData.$route(
  path: '/customers',

  factory: $CustomersPageRouteExtension._fromState,
);

extension $CustomersPageRouteExtension on CustomersPageRoute {
  static CustomersPageRoute _fromState(GoRouterState state) =>
      CustomersPageRoute();

  String get location => GoRouteData.$location('/customers');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $assetsPageRoute => GoRouteData.$route(
  path: '/assets',

  factory: $AssetsPageRouteExtension._fromState,
);

extension $AssetsPageRouteExtension on AssetsPageRoute {
  static AssetsPageRoute _fromState(GoRouterState state) => AssetsPageRoute();

  String get location => GoRouteData.$location('/assets');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $tripsPageRoute => GoRouteData.$route(
  path: '/routes',

  factory: $TripsPageRouteExtension._fromState,
);

extension $TripsPageRouteExtension on TripsPageRoute {
  static TripsPageRoute _fromState(GoRouterState state) => TripsPageRoute();

  String get location => GoRouteData.$location('/routes');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
