import 'package:dofus_buddy/app/domain/items/use_cases/search_items_use_case.dart';
import 'package:dofus_buddy/app/presentation/pages/item_search/cubit/item_search_cubit.dart';

import '../mocks/use_cases_mocks.dart';

abstract class CubitFactories {
  static ItemSearchCubit createItemSearchCubit({SearchItemsUseCase? searchItemsUseCase}) =>
      ItemSearchCubit(searchItemsUseCase ?? MockSearchItemsUseCase());
}
