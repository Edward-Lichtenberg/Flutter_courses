//import '../style/images.dart';

import 'package:flutter__lesson_14_authorization/style/images.dart';

class CategoryModel {
  final String image;
  final String title;
  final String subtitle;

  CategoryModel(
      {required this.image, required this.title, required this.subtitle});
}

List<CategoryModel> categories = [
  CategoryModel(
      image: AppImages.hand, title: 'Реклама', subtitle: '106 кампаний'),
  CategoryModel(
      image: AppImages.phone, title: 'Взаимопиар', subtitle: '56 заявок'),
  CategoryModel(image: AppImages.like, title: 'Бартер', subtitle: '245 заявок')
];
