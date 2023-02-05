import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:provider/provider.dart';
//import 'package:rick_and_morty/features/presentation/cubit/cubit.dart';
import 'package:rick_and_morty/features/data/dio_settings.dart';
import 'package:rick_and_morty/features/data/repository/char_repo.dart';
import 'package:rick_and_morty/features/presentation/screens/characters_list.dart';
import 'package:rick_and_morty/features/presentation/theme/model/model_theme.dart';

import 'features/data/cubit/main_cubit.dart';

// Future void main() async  {
//   WidgetsFlutterBinding.ensureInitialized();

// await UserPferences.init();
//   runApp(const MyApp());
// }
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) =>
              CharRepo(dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
      ],
      child: MultiProvider(
        providers: [
          BlocProvider(
            create: (context) => CharacterCubit(
              repo: RepositoryProvider.of<CharRepo>(context),
            )..getCharacter(''),
          ),
        ],
        child: ChangeNotifierProvider(
          create: (_) => ModelTheme(),
          child: Consumer<ModelTheme>(
              builder: (context, ModelTheme themeNotifier, child) {
            return MaterialApp(
              theme: themeNotifier.isDark
                  ? ThemeData(
                      primarySwatch: generateMaterialColor(
                        color: const Color(0xff0B1E2D),
                      ),
                      scaffoldBackgroundColor: const Color(0xff0B1E2D),
                      textTheme: Theme.of(context).textTheme.apply(
                            bodyColor: const Color(0xffFFFFFF),
                            displayColor: const Color(0xffFFFFFF),
                          ))
                  : ThemeData(
                      primarySwatch: generateMaterialColor(
                        color: const Color(0xffF2F2F2),
                      ),
                      scaffoldBackgroundColor: const Color(0xffF2F2F2),
                      textTheme: Theme.of(context).textTheme.apply(
                            bodyColor: const Color(0xff0B1E2D),
                            displayColor: const Color(0xff0B1E2D),
                          ),
                    ),
              debugShowCheckedModeBanner: false,
              home: const CharactersList(),
            );
          }),
        ),
      ),
    );
  }
}
