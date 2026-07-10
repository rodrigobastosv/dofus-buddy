import 'package:bloc_test/bloc_test.dart';
import 'package:dofus_buddy/app/core/error/error.dart';
import 'package:dofus_buddy/app/core/error/result.dart';
import 'package:dofus_buddy/app/presentation/pages/item_search/cubit/item_search_cubit.dart';
import 'package:dofus_buddy/app/presentation/pages/item_search/cubit/item_search_state.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../factories/cubits_factories.dart';
import '../../../../../factories/entities/item_factory.dart';
import '../../../../../mocks/use_cases_mocks.dart';

void main() {
  final item = ItemFactory.create();

  blocTest<ItemSearchCubit, ItemSearchState>(
    'emits loading then success when the search succeeds',
    build: () {
      final searchItemsUseCase = MockSearchItemsUseCase();
      when(() => searchItemsUseCase(query: 'atcham')).thenAnswer((_) async => Success([item]));
      return CubitFactories.createItemSearchCubit(searchItemsUseCase: searchItemsUseCase);
    },
    act: (cubit) => cubit.search('atcham'),
    expect: () => [
      const ItemSearchState(status: ItemSearchStatus.loading),
      ItemSearchState(status: ItemSearchStatus.success, items: [item]),
    ],
  );

  blocTest<ItemSearchCubit, ItemSearchState>(
    'emits loading then failure when the search fails',
    build: () {
      final searchItemsUseCase = MockSearchItemsUseCase();
      when(() => searchItemsUseCase(query: 'atcham')).thenAnswer((_) async => const Error(NetworkError()));
      return CubitFactories.createItemSearchCubit(searchItemsUseCase: searchItemsUseCase);
    },
    act: (cubit) => cubit.search('atcham'),
    expect: () => [const ItemSearchState(status: ItemSearchStatus.loading), const ItemSearchState(status: ItemSearchStatus.failure)],
  );

  final emptyQueryUseCase = MockSearchItemsUseCase();
  blocTest<ItemSearchCubit, ItemSearchState>(
    'resets to initial state when the query is empty',
    build: () => CubitFactories.createItemSearchCubit(searchItemsUseCase: emptyQueryUseCase),
    seed: () => ItemSearchState(status: ItemSearchStatus.success, items: [item]),
    act: (cubit) => cubit.search(''),
    expect: () => [const ItemSearchState()],
    verify: (_) => verifyNever(() => emptyQueryUseCase(query: any(named: 'query'))),
  );
}
