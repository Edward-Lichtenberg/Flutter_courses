import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
//import 'package:rick_and_morty/features/presentation/cubit/cubit.dart';
import 'package:rick_and_morty/features/data/repository/char_repo.dart';
import 'package:rick_and_morty/features/presentation/theme/colors.dart';
import 'package:rick_and_morty/features/presentation/theme/model/model_theme.dart';

import '../../data/cubit/main_cubit.dart';
part 'model/char_page_item.dart';

class CharPage extends StatefulWidget {
  const CharPage({
    required this.id,
    Key? key,
  }) : super(key: key);

  final int id;

  @override
  State<CharPage> createState() => _CharPageState();
}

class _CharPageState extends State<CharPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: BlocProvider.value(
            value:
                CharacterCubit(repo: RepositoryProvider.of<CharRepo>(context))
                  ..getSingleCharacter(widget.id),
            child: BlocBuilder<CharacterCubit, CharState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is SuccessState) {
                  return ListView(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 218,
                            width: double.infinity,
                            child: ImageFiltered(
                              imageFilter:
                                  ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          '${state.characters.first.image}'),
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.low),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 130,
                              ),
                              Align(
                                alignment: AlignmentDirectional.center,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 8,
                                      color: themeNotifier.isDark
                                          ? const Color(0xff0B1E2D)
                                          : const Color(0xffF2F2F2),
                                    ),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        state.characters.first.image ?? '',
                                    imageBuilder: (context, imageProvider) =>
                                        CircleAvatar(
                                      radius: 90,
                                      foregroundImage: imageProvider,
                                      backgroundColor: themeNotifier.isDark
                                          ? const Color(0xff0B1E2D)
                                          : const Color(0xffF2F2F2),
                                    ),
                                    placeholder: (context, url) =>
                                        const SizedBox(
                                      child: CircularProgressIndicator(),
                                      height: 70,
                                      width: 70,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              state.characters.first.name!,
                              style: const TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              state.characters.first.status!,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.iconsActiveColor),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            // Text(
                            //   state.characters.first.created!,
                            //   style: const TextStyle(
                            //     fontSize: 17,
                            //     fontWeight: FontWeight.w400,
                            //   ),
                            // ),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    _CharPageItem(
                                      title: 'Gender',
                                      info: state.characters.first.gender!,
                                    ),
                                    const SizedBox(
                                      width: 100,
                                    ),
                                    _CharPageItem(
                                      title: 'Race',
                                      info: state.characters.first.species!,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                _CharPageItem(
                                    info: state.characters.first.origin!.name!,
                                    title: 'Origin'),
                                const SizedBox(
                                  height: 20,
                                ),
                                _CharPageItem(
                                    info:
                                        state.characters.first.location!.name!,
                                    title: 'Location'),
                              ],
                            ),
                            const SizedBox(height: 36),
                            const Divider(
                              color: Color(0xff152A3A),
                              thickness: 2,
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Episodes',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'All episodes',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff5B6975)),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ListView.separated(
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 20,
                                  );
                                },
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    state.characters.first.episode!.length,
                                itemBuilder: (contex, index) {
                                  return ListTile(
                                      title: Text(
                                        state.characters.first.episode![index],
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      leading: const CircleAvatar(
                                        radius: 20,
                                        foregroundImage: NetworkImage(
                                            'https://static.itapemafm.com.br/s3fs-public/graphql-upload-files/rick%20and%20morty%20temporada%205_1.jpg?z1sRbxXGbXcXa8e08OiN81SmU5t7g1Zb'),
                                      ));
                                })
                          ],
                        ),
                      )
                    ],
                  );
                }
                return const Text('');
              },
            ),
          ),
        ),
      );
    });
  }
}
