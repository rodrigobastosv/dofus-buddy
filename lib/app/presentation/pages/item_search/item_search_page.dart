import 'package:dofus_buddy/app/core/di/dependencies.dart';
import 'package:dofus_buddy/app/design_system/components/general/db_empty_state.dart';
import 'package:dofus_buddy/app/design_system/components/general/db_error_state.dart';
import 'package:dofus_buddy/app/design_system/components/general/db_gap.dart';
import 'package:dofus_buddy/app/design_system/components/general/db_loading_indicator.dart';
import 'package:dofus_buddy/app/design_system/components/text_fields/db_search_field.dart';
import 'package:dofus_buddy/app/design_system/tokens/db_spacing.dart';
import 'package:dofus_buddy/app/presentation/general/db_page.dart';
import 'package:dofus_buddy/app/presentation/pages/item_search/cubit/item_search_cubit.dart';
import 'package:dofus_buddy/app/presentation/pages/item_search/cubit/item_search_state.dart';
import 'package:dofus_buddy/app/presentation/pages/item_search/widgets/item_search_tile.dart';
import 'package:dofus_buddy/l10n/arb/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemSearchPage extends StatelessWidget {
  const ItemSearchPage({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocProvider<ItemSearchCubit>(create: (context) => ItemSearchCubit(G()), child: const _ItemSearchView());
}

class _ItemSearchView extends StatefulWidget {
  const _ItemSearchView();

  @override
  State<_ItemSearchView> createState() => _ItemSearchViewState();
}

class _ItemSearchViewState extends State<_ItemSearchView> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return DBPage<ItemSearchCubit, ItemSearchState>(
      builder: (context, cubit, state) => Scaffold(
        appBar: AppBar(title: Text(l10n.itemsFeatureTitle)),
        body: Padding(
          padding: const EdgeInsets.all(DBSpacing.m),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              DBSearchField(controller: _controller, hintText: l10n.itemSearchHint, onSubmitted: cubit.search),
              const DBGap.m(),
              Expanded(
                child: switch (state.status) {
                  .initial => DBEmptyState(
                    icon: Icons.travel_explore,
                    title: l10n.itemSearchInitialTitle,
                    message: l10n.itemSearchInitialMessage,
                  ),
                  .loading => const DBLoadingIndicator(),
                  .failure => DBErrorState(message: l10n.errorGenericMessage, onRetry: () => cubit.search(_controller.text)),
                  .success when state.items.isEmpty => DBEmptyState(title: l10n.itemSearchEmptyTitle, message: l10n.itemSearchEmptyMessage),
                  .success => ListView.separated(
                    itemCount: state.items.length,
                    separatorBuilder: (context, index) => const DBGap.s(),
                    itemBuilder: (context, index) => ItemSearchTile(item: state.items[index]),
                  ),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
