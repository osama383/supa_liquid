import 'dart:async';

// import 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:supa_liquid/core/models/company/company.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

// import '../../../core/models/email/email.dart';
// import '../../../core/models/failure/failure.dart';
// import '../../../core/models/password/password.dart';
import '../../../core/models/email/email.dart';
import '../../../core/models/failure/failure.dart';
import '../../../core/models/password/password.dart';
import '../../../core/models/user/user.dart';

@singleton
class Auth {
  final Supabase supabase;

  User? _currentUser;
  User? get currentUser => _currentUser;

  bool get userIsLoggedIn => _currentUser != null;
  bool get userIsLoggedOut => _currentUser == null;

  Company? _company;
  Company get company =>
      _company == null ? throw StateError('company is null') : _company!;

  bool get userHasCompany => false;

  final StreamController<User?> _currentUserStreamController =
      StreamController.broadcast();
  late final Stream<User?> currentUserStream;

  Auth(this.supabase) {
    currentUserStream = _currentUserStreamController.stream.asBroadcastStream();
    currentUserStream.listen((user) => _currentUser = user);
  }

  Future<void> started() async {
    final session = supabase.client.auth.currentSession;
    if (session == null) {
      _currentUser = null;
      return;
    }

    final supabaseUser = supabase.client.auth.currentUser!;
    final result =
        await supabase.client
            .from('users')
            .select()
            .eq('id', supabaseUser.id)
            .single();

    if (result.isEmpty) {
      _currentUser = null;
      return;
    }
    _currentUser = UserMapper.fromMap(result);

    final companyUser = await supabase.client
        .from('company_users')
        .stream(primaryKey: ['userId'])
        .listen((e) {
          print(e);
        });
  }

  Future<Either<Failure, Unit>> signUpWithEmailAndPassword({
    required EmailAddress email,
    required Password password,
  }) async {
    try {
      final AuthResponse response = await supabase.client.auth.signUp(
        email: email.getOrCrash,
        password: password.getOrCrash,
      );
      if (response.session == null) return left(SignupFailure());

      await supabase.client
          .from('users')
          .insert(User(id: response.user!.id, email: email).toMap());

      final result = await supabase.client
          .from('users')
          .select()
          .eq('id', supabase.client.auth.currentUser!.id)
          .limit(1);
      if (result.isEmpty) return left(UserNotFound());

      _currentUserStreamController.sink.add(UserMapper.fromMap(result.first));
      return right(unit);
    } catch (e) {
      return left(SignupFailure());
    }
  }

  Future<Either<Failure, Unit>> signInWithEmailAndPassword({
    required EmailAddress email,
    required Password password,
  }) async {
    try {
      final AuthResponse response = await supabase.client.auth
          .signInWithPassword(
            email: email.getOrCrash,
            password: password.getOrCrash,
          );
      if (response.session == null) return left(SigninFailure());

      final result = await supabase.client
          .from('users')
          .select()
          .eq('id', response.user!.id);
      if (result.isEmpty) return left(UserNotFound());

      _currentUserStreamController.sink.add(UserMapper.fromMap(result.first));
      return right(unit);
    } catch (e) {
      return left(SigninFailure());
    }
  }

  void userUpdated(User user) {
    assert(user.id == _currentUser!.id);
    _currentUserStreamController.sink.add(user);
  }

  void logout() {
    _currentUserStreamController.sink.add(null);
    supabase.client.auth.signOut();
  }
}
