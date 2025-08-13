import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:picked/app_router.dart';
import 'package:picked/core/extension/build_context_extension.dart';
import 'package:picked/data/models/quote_model.dart';
import 'package:picked/features/explore/bloc/explore_bloc.dart';
import 'package:picked/features/explore/widgets/quote_card.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return BlocProvider(
      create: (context) => ExploreBloc.init..add(LoadTags()),
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: context.systemUiOverlayStyle,
          surfaceTintColor: Colors.transparent,
          backgroundColor: theme.scaffoldBackgroundColor,
          elevation: 0,
          title: const Text(
            'Explore',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                padding: const EdgeInsets.all(14.0),
                icon: const Icon(LucideIcons.heart, size: 30),
                onPressed: () => AutoRouter.of(context).push(const FavoritesRoute()),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 60,
              child: BlocBuilder<ExploreBloc, ExploreState>(
                buildWhen: (previous, current) => current is TagsLoaded || current is TagsLoading,
                builder: (context, state) {
                  return switch (state) {
                    TagsLoading() => Skeletonizer(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (_, __) => const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: Chip(label: Text('loading...')),
                          ),
                        ),
                      ),
                    TagsLoaded() => ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.tags.length,
                        itemBuilder: (context, index) {
                          final tag = state.tags[index];
                          final isSelected = tag.name == state.selectedTag ||
                              (tag.name == 'All' && state.selectedTag == null);
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: ChoiceChip(
                              label: Text(tag.name),
                              selected: isSelected,
                              selectedColor: Colors.grey[300],
                              onSelected: (selected) {
                                if (selected) {
                                  context.read<ExploreBloc>().add(SelectTag(tag.name));
                                }
                              },
                            ),
                          );
                        },
                      ),
                    _ => const SizedBox.shrink(),
                  };
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<ExploreBloc, ExploreState>(
                builder: (context, state) {
                  final bloc = context.read<ExploreBloc>();
                  return RefreshIndicator(
                    onRefresh: () => Future.sync(
                      () => bloc.pagingController.refresh(),
                    ),
                    child: PagingListener(
                      controller: bloc.pagingController,
                      builder: (context, state, fetchNextPage) => PagedMasonryGridView(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        gridDelegateBuilder: (index) {
                          return const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          );
                        },
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 10,
                        state: state,
                        fetchNextPage: fetchNextPage,
                        builderDelegate: PagedChildBuilderDelegate<QuoteModel>(
                          itemBuilder: (context, item, index) => Hero(
                            tag: item.id + index.toString(),
                            child: QuoteCard(
                              quote: item,
                              onTap: () {
                                AutoRouter.of(context)
                                    .push(QuoteDetailRoute(quote: item, index: index));
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
