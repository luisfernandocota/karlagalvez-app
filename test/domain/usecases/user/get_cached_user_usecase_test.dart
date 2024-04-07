import 'package:dartz/dartz.dart';
import 'package:karlagalvezapp/core/error/failures.dart';
import 'package:karlagalvezapp/core/usecases/usecase.dart';
import 'package:karlagalvezapp/domain/repositories/user_repository.dart';
import 'package:karlagalvezapp/domain/usecases/user/get_cached_user_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/constant_objects.dart';

class MockRepository extends Mock implements UserRepository {}

void main() {
  late GetCachedUserUseCase usecase;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    usecase = GetCachedUserUseCase(mockRepository);
  });

  test(
    'Should get User from the repository when User Repository return data successfully',
    () async {
      /// Arrange
      when(() => mockRepository.getCachedUser())
          .thenAnswer((_) async => const Right(tUserModel));

      /// Act
      final result = await usecase(NoParams());

      /// Assert
      expect(result, const Right(tUserModel));
      verify(() => mockRepository.getCachedUser());
      verifyNoMoreInteractions(mockRepository);
    },
  );

  test('should return a Failure from the repository', () async {
    /// Arrange
    final failure = NetworkFailure();
    when(() => mockRepository.getCachedUser())
        .thenAnswer((_) async => Left(failure));

    /// Act
    final result = await usecase(NoParams());

    /// Assert
    expect(result, Left(failure));
    verify(() => mockRepository.getCachedUser());
    verifyNoMoreInteractions(mockRepository);
  });
}
