import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picked/app_router.dart';
import 'package:picked/core/extension/build_context_extension.dart';
import 'package:picked/data/models/quote_model.dart';
import 'package:picked/features/explore/bloc/explore_bloc.dart';
import 'package:picked/features/explore/widgets/quote_card.dart';
import 'package:picked/injection.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ExploreBloc>()..add(LoadTags()),
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: context.systemUiOverlayStyle,
          surfaceTintColor: Colors.transparent,
          leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: const Text(
            'Explore',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          actions: [
            IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 60,
              child: BlocBuilder<ExploreBloc, ExploreState>(
                buildWhen: (previous, current) =>
                    current is TagsLoaded || current is TagsLoading,
                builder: (context, state) {
                  return switch (state) {
                    TagsLoading() => Skeletonizer(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (_, __) => const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: Chip(label: Text('Loading')),
                          ),
                        ),
                      ),
                    TagsLoaded() => ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.tags.length,
                        itemBuilder: (context, index) {
                          final tag = state.tags[index];
                          final isSelected = tag.name == state.selectedTag ||
                              (tag.name == 'All' && state.selectedTag == null);
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: ChoiceChip(
                              label: Text(tag.name),
                              selected: isSelected,
                              selectedColor: Colors.grey[300],
                              onSelected: (selected) {
                                if (selected) {
                                  context
                                      .read<ExploreBloc>()
                                      .add(SelectTag(tag.name));
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
                      builder: (context, state, fetchNextPage) =>
                          PagedMasonryGridView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
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
