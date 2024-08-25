part of 'auth_cubit_cubit.dart';

@immutable
sealed class AuthCubitState {}

final class AuthCubitInitial extends AuthCubitState {}

final class SignInSuccess extends AuthCubitState {}
final class SignInFaluier extends AuthCubitState {
  final String massege;

  SignInFaluier({required this.massege});

}
final class SignInLoading extends AuthCubitState {}

