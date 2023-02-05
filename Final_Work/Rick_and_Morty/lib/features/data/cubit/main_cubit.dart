import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rick_and_morty/features/data/models/char_model.dart';
import 'package:rick_and_morty/features/data/repository/char_repo.dart';

class CharacterCubit extends Cubit<CharState> {
  CharacterCubit({
    required this.repo,
  }) : super(InitialState(characters: []));

  final CharRepo repo;
  int currentPage = 0;
  int maxPage = 1;
  int searchMaxPage = 1;
  int searchCurrentPage = 0;
  String searchName = '';
  int filterMaxPage = 1;
  int filterCurrentPage = 0;
  List<String> filterName = ['', ''];

  List<CharacterModel> charList = [];
  List<CharacterModel> singleCharacter = [];

  getCharacter(String name) async {
    emit(LoadingState(characters: state.characters));

    try {
      if (currentPage < maxPage) {
        final result = await repo.getData(
          page: currentPage,
        );

        final CharacterInfoModel character =
            CharacterInfoModel.fromJson(result.data);
        if (currentPage == 0) {
          charList = character.results!;
        } else {
          charList = [...state.characters, ...character.results!];
        }

        maxPage = character.info?.pages ?? 1;
        if (currentPage == 0) {
          currentPage += 2;
        } else {
          currentPage++;
        }

        emit(SuccessState(
          characters: charList,
          charCount: character.info!.count,
        ));
      }
    } catch (e) {
      emit(ErrorState(characters: []));
    }
  }

  getCharacterSearch(
    String name,
  ) async {
    emit(LoadingState(characters: state.characters));
    try {
      if (searchName != name) {
        searchCurrentPage = 0;
        currentPage = 0;
      }
      if (searchCurrentPage < searchMaxPage) {
        final result = await repo.getData(name: name, page: searchCurrentPage);
        final CharacterInfoModel character =
            CharacterInfoModel.fromJson(result.data);
        if (searchCurrentPage == 0) {
          charList = character.results!;
        } else {
          charList = [...state.characters, ...character.results!];
        }

        searchMaxPage = character.info?.pages ?? 1;
        if (searchCurrentPage == 0) {
          searchCurrentPage += 2;
        } else {
          searchCurrentPage++;
        }

        searchName = name;

        emit(
          SuccessState(
            characters: charList,
            charCount: character.info!.count,
          ),
        );
      }
    } catch (e) {
      emit(ErrorState(characters: []));
    }
  }

  getCharacterFiltered(List<String> filters) async {
    if (filterName[0] != filters[0] || filterName[1] != filters[1]) {
      filterCurrentPage = 0;
    }
    if (filterCurrentPage < filterMaxPage) {
      try {
        emit(LoadingState(characters: state.characters));
        final result = await repo.getDataFiltered(
            page: filterCurrentPage, status: filters[0], gender: filters[1]);
        final CharacterInfoModel character =
            CharacterInfoModel.fromJson(result.data);

        if (filterCurrentPage == 0) {
          charList = character.results!;
        } else {
          charList = [...state.characters, ...character.results!];
        }
        filterMaxPage = character.info?.pages ?? 1;
        filterCurrentPage++;

        filterName[0] = filters[0];
        filterName[1] = filters[1];

        emit(SuccessState(
            characters: charList, charCount: character.info!.count));
      } catch (e) {
        emit(ErrorState(characters: []));
      }
    }
  }

  getSingleCharacter(int id) async {
    try {
      emit(
        LoadingState(characters: []),
      );
      final result = await repo.getSingleCharacter(
        id: id,
      );

      final CharacterModel character = CharacterModel.fromJson(result.data);
      log(character.name.toString());

      emit(SuccessState(characters: [character], charCount: 1));
    } catch (e) {
      emit(
        ErrorState(characters: []),
      );
    }
  }
}

abstract class CharState {
  final List<CharacterModel> characters;
  CharState({
    required this.characters,
  });
}

class InitialState extends CharState {
  final List<CharacterModel> characters;
  InitialState({
    required this.characters,
  }) : super(characters: characters);
}

class LoadingState extends CharState {
  final List<CharacterModel> characters;
  LoadingState({
    required this.characters,
  }) : super(characters: characters);
}

class SuccessState extends CharState {
  List<CharacterModel> characters;
  final int? charCount;
  SuccessState({
    required this.characters,
    required this.charCount,
  }) : super(characters: characters);
}

class ErrorState extends CharState {
  ErrorState({required List<CharacterModel> characters})
      : super(characters: characters);
}
