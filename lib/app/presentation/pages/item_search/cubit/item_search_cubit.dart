import 'package:dofus_buddy/app/domain/items/use_cases/search_items_use_case.dart';
import 'package:dofus_buddy/app/presentation/pages/item_search/cubit/item_search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemSearchCubit extends Cubit<ItemSearchState> {
  ItemSearchCubit(this._searchItemsUseCase) : super(const ItemSearchState());

  final SearchItemsUseCase _searchItemsUseCase;

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      emit(const ItemSearchState());
      return;
    }

    emit(state.copyWith(status: .loading));

    final searchResult = await _searchItemsUseCase(query: query);
    searchResult.when((error) {
      emit(state.copyWith(status: .failure));
    }, (items) => emit(state.copyWith(status: .success, items: items)));
  }
}
