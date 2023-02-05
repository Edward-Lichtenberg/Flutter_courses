part of '../filter_screen.dart';

class _ParametersCheckBox extends StatefulWidget {
  _ParametersCheckBox(
      {Key? key,
      required this.isChecked,
      required this.filterName,
      required this.filters,
      required this.filterValue,
      required this.index,
      required this.filtersIsChecked})
      : super(key: key);

  @override
  State<_ParametersCheckBox> createState() => _ParametersCheckBoxState();
  bool isChecked = false;
  final String filterName;
  final List<String> filters;
  final int filterValue;
  final int index;
  final List<bool> filtersIsChecked;
}

class _ParametersCheckBoxState extends State<_ParametersCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                  side: const BorderSide(
                    color: Color(0xff5B6975),
                  ),
                  value: widget.isChecked,
                  onChanged: (bool? newValue) {
                    widget.isChecked = newValue!;
                    if (newValue == true) {
                      widget.filters[widget.filterValue] = widget.filterName;
                    } else {
                      widget.filters[widget.filterValue] = '';
                    }
                    widget.filtersIsChecked[widget.index] = widget.isChecked;
                    setState(() {});
                  }),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              widget.filterName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ],
    );
  }
}
