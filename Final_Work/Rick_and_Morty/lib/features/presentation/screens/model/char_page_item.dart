part of '../char_page.dart';

class _CharPageItem extends StatelessWidget {
  const _CharPageItem({Key? key, required this.info, required this.title})
      : super(key: key);

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff5B6975)),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(info, style: const TextStyle(fontSize: 18))
      ],
    );
  }
}
