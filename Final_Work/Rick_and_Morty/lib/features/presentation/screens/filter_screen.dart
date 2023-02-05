import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/presentation/theme/assets_imag.dart';
import 'package:rick_and_morty/features/presentation/theme/colors.dart';
part 'model/parameters_checkbox.dart';

class FilterPage extends StatefulWidget {
  FilterPage({
    required this.filters,
    required this.filtersIsChecked,
    Key? key,
  }) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
  final List<String> filters;
  List<bool> filtersIsChecked;
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Column(
            children: [
              Container(
                color: AppColors.dartTheme,
              ),
              AppBar(
                title: const Text(
                  'Filters',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(
                      [widget.filters, widget.filtersIsChecked],
                    );
                  },
                ),
              ),
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sort',
              style: TextStyle(
                color: Color(0xff5B6975),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'By alphabet',
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: [
                    IconButton(
                      splashRadius: 1,
                      onPressed: () {
                        widget.filtersIsChecked[6] = true;
                        setState(() {});
                      },
                      icon: Image.asset(
                        AppImages.az,
                        width: 25,
                        height: 25,
                        color: widget.filtersIsChecked[6]
                            ? const Color(0xff22A2BD)
                            : const Color(0xff5B6975),
                      ),
                    ),
                    IconButton(
                      splashRadius: 1,
                      onPressed: () {
                        widget.filtersIsChecked[6] = false;
                        setState(() {});
                      },
                      icon: Image.asset(
                        AppImages.za,
                        width: 25,
                        height: 25,
                        color: widget.filtersIsChecked[6]
                            ? const Color(0xff5B6975)
                            : const Color(0xff22A2BD),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 25),
            const Divider(
              thickness: 2,
              color: Color(0xff152A3A),
            ),
            const SizedBox(height: 30),
            const Text(
              'STATUS',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            _ParametersCheckBox(
              isChecked: widget.filtersIsChecked[0],
              filterName: 'Alive',
              filters: widget.filters,
              filterValue: 0,
              index: 0,
              filtersIsChecked: widget.filtersIsChecked,
            ),
            _ParametersCheckBox(
              isChecked: widget.filtersIsChecked[1],
              filterName: 'Dead',
              filters: widget.filters,
              filterValue: 0,
              index: 1,
              filtersIsChecked: widget.filtersIsChecked,
            ),
            _ParametersCheckBox(
              isChecked: widget.filtersIsChecked[2],
              filterName: 'Unknown',
              filters: widget.filters,
              filterValue: 0,
              index: 2,
              filtersIsChecked: widget.filtersIsChecked,
            ),
            const SizedBox(height: 25),
            const Divider(
              thickness: 2,
              color: Color(0xff152A3A),
            ),
            const SizedBox(height: 30),
            const Text(
              'GENDER',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff5B6975),
              ),
            ),
            _ParametersCheckBox(
              isChecked: widget.filtersIsChecked[3],
              filterName: 'Male',
              filters: widget.filters,
              filterValue: 1,
              index: 3,
              filtersIsChecked: widget.filtersIsChecked,
            ),
            _ParametersCheckBox(
              isChecked: widget.filtersIsChecked[4],
              filterName: 'Female',
              filters: widget.filters,
              filterValue: 1,
              index: 4,
              filtersIsChecked: widget.filtersIsChecked,
            ),
            _ParametersCheckBox(
              isChecked: widget.filtersIsChecked[5],
              filterName: 'Genderless',
              filters: widget.filters,
              filterValue: 1,
              index: 5,
              filtersIsChecked: widget.filtersIsChecked,
            )
          ],
        ),
      ),
    );
  }
}
