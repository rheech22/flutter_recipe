import 'package:freezed_annotation/freezed_annotation.dart';
import 'error.dart';

part 'result.freezed.dart';

// TODO: sealed 클래스에 대해 공부하기
@freezed
sealed class Result<D, E extends BaseError> with _$Result<D, E> {
  const factory Result.success(D data) =
      ResultSuccess; // TODO: 여기 freezed 문법 좀 공부하기
  const factory Result.error(E error) = ResultError;
}
