import 'package:flutter_test/flutter_test.dart';
import 'package:gesco/domain/calculations/weighted_average.dart';

void main() {
  group('weightedAverage', () {
    test('calcule une moyenne pondérée', () {
      final result = weightedAverage(const [
        GradeEntry(score: 12, coefficient: 2),
        GradeEntry(score: 16, coefficient: 1),
      ]);
      expect(result, closeTo(13.333333, 0.00001));
    });

    test('ignore les notes non saisies', () {
      final result = weightedAverage(const [
        GradeEntry(score: null, coefficient: 3),
        GradeEntry(score: 14, coefficient: 2),
      ]);
      expect(result, 14);
    });

    test('renvoie null si aucune note existe', () {
      expect(weightedAverage(const [
        GradeEntry(score: null, coefficient: 1),
      ]), isNull);
    });

    test('refuse une note ou un coefficient invalide', () {
      expect(
        () => weightedAverage(const [
          GradeEntry(score: -1, coefficient: 1),
        ]),
        throwsArgumentError,
      );
    });
  });
}
