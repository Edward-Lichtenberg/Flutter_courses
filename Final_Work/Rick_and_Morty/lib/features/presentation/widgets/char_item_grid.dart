import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/data/models/char_model.dart';
import 'package:rick_and_morty/features/presentation/screens/char_page.dart';
import 'package:rick_and_morty/features/presentation/theme/colors.dart';
import 'package:rick_and_morty/features/presentation/theme/text_styles.dart';

class CharacterItemGrid extends StatelessWidget {
  CharacterItemGrid(
      {required this.model,
      required this.index,
      this.lifeStatus = false,
      Key? key})
      : super(key: key);

  final CharacterModel model;
  final int index;
  bool lifeStatus;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharPage(
              id: model.id ?? 1,
            ),
          ),
        );
      },
      child: SizedBox(
        height: 210,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: model.image ?? '',
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: 60,
                foregroundImage: imageProvider,
                backgroundColor: AppColors.textField,
              ),
              placeholder: (context, url) => const SizedBox(
                child: CircularProgressIndicator(),
                height: 80,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Text(
              '${model.status}',
              style: AppText.Text16w500.copyWith(
                  color: model.status == 'Alive'
                      ? AppColors.cardStatusAlive
                      : AppColors.cardStatusDead),
              textAlign: TextAlign.center,
            ),
            Text('${model.name}',
                style: AppText.Text18w500, textAlign: TextAlign.center),
            Text('${model.species}, ${model.gender}',
                style: AppText.Text14w400.copyWith(color: AppColors.cardInfo),
                textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
