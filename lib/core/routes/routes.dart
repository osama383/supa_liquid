import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supa_liquid/features/public/view/public_page.dart';
import 'package:supa_liquid/features/trips/view/index/trips_page.dart';
import 'package:supa_liquid/injection.dart';

import '../../features/assets/view/assets_page.dart';
import '../../features/auth/data/auth.dart';
import '../../features/auth/view/auth_page.dart';
import '../../features/create_company/view/create_company_page.dart';
import '../../features/customers/view/index/customers_page.dart';
import '../../features/home/view/home_page.dart';
import '../../navigator_key.dart';
import '../not_found/not_found_page.dart';

part 'routes.g.dart';

// FutureOr<String?> defaultPermissionRedirect(
//   BuildContext context,
//   GoRouterState state,
//   Permission permission,
// ) {
//   return sl<Auth>().currentUser!.permissions.contains(permission) ? null : '/';
// }

@TypedGoRoute<PublicPageRoute>(path: '/public')
@immutable
class PublicPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PublicPage();
  }
}

@TypedGoRoute<CreateCompanyPageRoute>(path: '/create-company')
@immutable
class CreateCompanyPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CreateCompanyPage();
  }
}

@TypedGoRoute<NotFoundPageRoute>(path: '/not-found')
@immutable
class NotFoundPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NotFoundPage();
  }
}

@TypedGoRoute<LoginPageRoute>(path: '/login')
@immutable
class LoginPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AuthPage();
  }
}

@TypedGoRoute<HomePageRoute>(path: '/')
@immutable
class HomePageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomePage(sl());
  }
}

@TypedGoRoute<CustomersPageRoute>(path: '/customers')
@immutable
class CustomersPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CustomersPage(sl());
  }
}

@TypedGoRoute<AssetsPageRoute>(path: '/assets')
@immutable
class AssetsPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AssetsPage(sl());
  }
}

@TypedGoRoute<TripsPageRoute>(path: '/routes')
@immutable
class TripsPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TripsPage(sl());
  }
}

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  navigatorKey: navigatorKey,
  errorBuilder: (context, state) => const NotFoundPage(),
  observers: [],
  routes: $appRoutes,
  redirect: (BuildContext context, GoRouterState state) async {
    final auth = sl<Auth>();
    if (auth.userIsLoggedOut) {
      return state.matchedLocation == '/login' ? null : '/login';
    }
    if (auth.userHasCompany) {
      return state.matchedLocation == '/login' ? '/' : null;
    }
    return state.matchedLocation == '/login' ? '/create-company' : null;
  },
);

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder:
        (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
  );
}

Page<dynamic> Function(BuildContext, GoRouterState) defaultPageBuilder<T>(
  Widget child,
) => (BuildContext context, GoRouterState state) {
  return buildPageWithDefaultTransition<T>(
    context: context,
    state: state,
    child: child,
  );
};
