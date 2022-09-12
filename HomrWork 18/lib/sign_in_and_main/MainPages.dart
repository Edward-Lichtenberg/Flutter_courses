import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter__lesson_14_authorization/style/images.dart';
import 'package:flutter__lesson_14_authorization/style/colors.dart';
import 'package:flutter__lesson_14_authorization/style/text_styles.dart';

import 'decoration/category.dart';
import 'decoration/category_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleColors.color9F8A8A,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              width: double.maxFinite,
              child: Image.asset(
                AppImages.glassEffect,
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 22,
                    ),
                    Text(
                      'Главная',
                      style: TextStyles.muller16w400,
                    ),
                    const SizedBox(height: 20),
                    // Padding(
                    // padding: const EdgeInsets.symmetric(horizontal: 10),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.only(
                          left: 28, bottom: 22, right: 28, top: 18),
                      //color: Colors.black,
                      decoration: BoxDecoration(
                          color: StyleColors.colorFFFFFF,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset.zero,
                                blurRadius: 14,
                                color:
                                    StyleColors.color45006F.withOpacity(0.35))
                          ]),

                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: StyleColors.colorFFD541,
                                borderRadius: BorderRadius.circular(50)),
                            child: Image.asset(AppImages.roundButtonVector),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Начните зарабатывать!',
                                style: TextStyles.muller15w700,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Приобретите тариф Behype-PRO\nи начните свою карьеру!',
                                style: TextStyles.muller10w400,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 44),
                    Container(
                      width: double.maxFinite,
                      height: 579,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        color: StyleColors.colorF9F8FF,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 25),
                            Text(
                              'Категории',
                              style: TextStyles.muller15w700,
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 150,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: categories.length,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(width: 16),
                                  itemBuilder: (context, indax) => Category(
                                        model: categories[indax],
                                        // image: categories[indax].image,
                                        // title: categories[indax].title,
                                        // subtitle: categories[indax].subtitle,
                                      )),
                            ),
                            const SizedBox(height: 49.41),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Рекламные кампании',
                                  style: TextStyles.muller18w700,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    log('Tapped All button');
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 3, horizontal: 8),
                                    width: 38,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: StyleColors.colorF90640,
                                    ),
                                    child: Text('Все',
                                        style: TextStyles.muller12w500),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 34,
                            ),
                            GestureDetector(
                              onTap: () {
                                log('Tapped "in new updating"');
                              },
                              child: Container(
                                  width: 170,
                                  height: 162,
                                  decoration: Category.Box,
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 11),
                                      Image.asset(AppImages.editText,
                                          width: 140, height: 110),
                                      const SizedBox(height: 3),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 12),
                                        width: double.maxFinite,
                                        height: 38,
                                        decoration: Category.BottomBox,
                                        child: Text('В новом обновлении',
                                            style: TextStyles.muller13w700),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
