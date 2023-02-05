import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/data/models/char_model.dart';
import 'package:rick_and_morty/features/presentation/screens/char_page.dart';
import 'package:rick_and_morty/features/presentation/theme/colors.dart';
import 'package:rick_and_morty/features/presentation/theme/text_styles.dart';

class CharacterItem extends StatelessWidget {
  CharacterItem(
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
        height: 74,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: model.image ?? '',
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: 35,
                foregroundImage: imageProvider,
                backgroundColor: AppColors.textField,
              ),
              placeholder: (context, url) => const SizedBox(
                child: CircularProgressIndicator(),
                height: 70,
                width: 70,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(
              width: 18,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${model.status}',
                    style: AppText.Text16w500.copyWith(
                        color: model.status == 'Alive'
                            ? AppColors.cardStatusAlive
                            : AppColors.cardStatusDead),
                  ),
                  Text(
                    '${model.name}',
                    style: AppText.Text18w500,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ),
                  Text(
                    '${model.species}, ${model.gender}',
                    style:
                        AppText.Text14w400.copyWith(color: AppColors.cardInfo),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
