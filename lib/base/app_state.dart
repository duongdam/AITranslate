part of 'app_cubit.dart';

class AppState extends Equatable {
  final Locale? locale;

  const AppState({
    this.locale,
  });

  AppState copyWith({
    Locale? locale,
  }) {
    return AppState(
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object?> get props => [
        locale,
      ];
}
