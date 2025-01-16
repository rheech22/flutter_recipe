import 'package:flutter_recipe/core/domain/error/error.dart';

enum SaveRecipeError implements BaseError {
  notFound,
  saveFailed,
  unknown;

  @override
  String toString() => switch (this) {
        SaveRecipeError.notFound => '레시피를 찾을 수 없습니다',
        SaveRecipeError.saveFailed => '북마크 저장을 실패했습니다',
        SaveRecipeError.unknown => '알 수 없는 오류가 발생했습니다',
      };
}
