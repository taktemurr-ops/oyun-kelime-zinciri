import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kelime_zinciri/oyun_kelime_zinciri.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kelimeZinciriConfig.title.length, 33);
    expect(kelimeZinciriConfig.tagline.length, 33);
    for (final s in kelimeZinciriConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kelimeZinciriConfig.gameId, kelimeZinciriId);
    expect(kelimeZinciriRules.gameId, kelimeZinciriId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kelimeZinciriRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kelimeZinciriId, optionalMechanics: kelimeZinciriRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      kelimeZinciriRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(kelimeZinciriRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
