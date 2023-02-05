import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/presentation/theme/assets_imag.dart';
import 'package:rick_and_morty/features/presentation/widgets/bottom_navigation.dart';
import 'package:rick_and_morty/features/presentation/widgets/char_item.dart';
import 'package:rick_and_morty/features/presentation/widgets/char_item_grid.dart';
//import 'package:rick_and_morty/features/presentation/cubit/cubit.dart';
import 'package:rick_and_morty/features/presentation/theme/model/debouncer.dart';
import 'package:rick_and_morty/features/presentation/screens/filter_screen.dart';
import 'package:rick_and_morty/features/presentation/theme/colors.dart';
import 'package:rick_and_morty/features/presentation/theme/text_styles.dart';
import 'package:rick_and_morty/features/presentation/widgets/count_bar.dart';
import 'package:rick_and_morty/features/presentation/widgets/search_bar.dart';

import '../../data/cubit/main_cubit.dart';

class CharactersList extends StatefulWidget {
  const CharactersList({Key? key}) : super(key: key);

  @override
  State<CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  final _debouncer = Debouncer(milliseconds: 500);
  bool isGridOrList = true;
  bool canLoad = false;
  int? charCount = 0;
  String search = '';
  bool isChecked = false;
  List<String> filters = [
    '',
    '',
  ];
  final List<bool> filtersIsChecked = [
    false,
    false,
    false,
    false,
    false,
    false,
    true
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(
        currentIndex: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              SearchBar(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FilterPage(
                              filtersIsChecked: filtersIsChecked,
                              filters: filters,
                            )),
                  );
                  BlocProvider.of<CharacterCubit>(context)
                      .getCharacterFiltered(filters);
                },
                onChanged: (String value) {
                  _debouncer.run(() {
                    search = value;
                    BlocProvider.of<CharacterCubit>(context).getCharacterSearch(
                      search,
                    );
                  });
                },
              ),
              BlocConsumer<CharacterCubit, CharState>(
                listener: (context, state) {
                  if (state is SuccessState) {
                    charCount = state.charCount;
                  }
                },
                builder: (context, state) {
                  return CountBar(
                    searched: search == '' ? false : true,
                    count: charCount,
                    view: isGridOrList,
                    onPressed: () {
                      isGridOrList = !isGridOrList;
                      setState(() {});
                    },
                  );
                },
              ),
              Expanded(
                child: BlocBuilder<CharacterCubit, CharState>(
                    builder: (context, state) {
                  if (state is SuccessState) {
                    charCount = state.charCount;
                    canLoad = true;
                  }
                  if (state is ErrorState) {
                    return ListView(
                      children: [
                        const SizedBox(height: 60),
                        SizedBox(
                          width: 151,
                          height: 251,
                          child: Image.asset(
                            AppImages.unfound,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Персонаж с таким именем \n не найден',
                          style: AppText.Text16w400.copyWith(
                            color: AppColors.color5B6975,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  }
                  return NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification notification) {
                      final current = notification.metrics.pixels + 500;
                      final max = notification.metrics.maxScrollExtent;
                      if (current >= max) {
                        if (canLoad) {
                          if (filters[0].isNotEmpty || filters[1].isNotEmpty) {
                            BlocProvider.of<CharacterCubit>(context)
                                .getCharacterFiltered(filters);
                          } else if (search.isEmpty) {
                            BlocProvider.of<CharacterCubit>(context)
                                .getCharacter('');
                          } else {
                            BlocProvider.of<CharacterCubit>(context)
                                .getCharacterSearch(search);
                          }
                        }
                        canLoad = false;
                      }
                      return false;
                    },
                    child: CustomScrollView(
                      scrollDirection: Axis.vertical,
                      slivers: [
                        isGridOrList
                            ? SliverFixedExtentList(
                                itemExtent: 100,
                                delegate: SliverChildBuilderDelegate(
                                    (context, index) => CharacterItem(
                                        model: state.characters[index],
                                        index: index),
                                    childCount: state.characters.length),
                              )
                            : SliverPadding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                sliver: SliverGrid(
                                  delegate: SliverChildBuilderDelegate(
                                      (context, index) => CharacterItemGrid(
                                          model: state.characters[index],
                                          index: index),
                                      childCount: state.characters.length),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.9,
                                          mainAxisSpacing: 10),
                                ),
                              )
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
