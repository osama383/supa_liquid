part of 'assets_bloc.dart';

@freezed
class AssetsState with _$AssetsState {
  const factory AssetsState({
    required List<Depot> depots,
    required Option<Either<Failure, List<Vehicle>>> vehiclesOrFailureOption,
    required Option<Either<Failure, List<Container>>> containersOrFailureOption,
  }) = _AssetsState;

  factory AssetsState.initial() => _AssetsState(
    depots: [],
    vehiclesOrFailureOption: none(),
    containersOrFailureOption: none(),
  );
}
