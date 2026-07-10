import 'package:dofus_buddy/app/core/error/error.dart';
import 'package:dofus_buddy/app/core/error/result.dart';
import 'package:dofus_buddy/app/domain/items/entities/item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../factories/entities/item_factory.dart';
import '../../../../factories/use_cases_factories.dart';
import '../../../../mocks/repositories_mocks.dart';

void main() {
  test('returns items from the repository on success', () async {
    final repository = MockItemsRepository();
    final useCase = UseCaseFactories.createSearchItemsUseCase(itemsRepository: repository);
    final item = ItemFactory.create();
    when(() => repository.searchItems(query: 'atcham')).thenAnswer((_) async => Success([item]));

    final searchResult = await useCase(query: 'atcham');

    expect(searchResult, Success<DBError, List<Item>>([item]));
  });

  test('returns the failure from the repository on error', () async {
    final repository = MockItemsRepository();
    final useCase = UseCaseFactories.createSearchItemsUseCase(itemsRepository: repository);
    when(() => repository.searchItems(query: 'atcham')).thenAnswer((_) async => const Failed(NetworkError()));

    final searchResult = await useCase(query: 'atcham');

    expect(searchResult, const Failed<DBError, List<Item>>(NetworkError()));
  });
}
