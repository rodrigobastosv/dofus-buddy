import 'package:dofus_buddy/app/data/items/items_repository.dart';
import 'package:dofus_buddy/app/domain/items/use_cases/search_items_use_case.dart';

import '../mocks/repositories_mocks.dart';

abstract class UseCaseFactories {
  static SearchItemsUseCase createSearchItemsUseCase({ItemsRepository? itemsRepository}) =>
      SearchItemsUseCase(itemsRepository: itemsRepository ?? MockItemsRepository());
}
