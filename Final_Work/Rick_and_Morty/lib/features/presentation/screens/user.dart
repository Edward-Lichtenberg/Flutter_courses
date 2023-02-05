import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/presentation/theme/assets_imag.dart';
import 'package:rick_and_morty/features/presentation/theme/colors.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final _isSelected = ValueNotifier<int>(2);
  final _selectedType = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CircleAvatar(
              maxRadius: 150,
              // if error will this
              backgroundImage: NetworkImage(
                AppImages.unfound,
              ),
              foregroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Изменить фото',
              style: TextStyle(color: AppColors.text),
            ),
            SizedBox(height: 40),
            Text('data'),
            // Text(
            //   'Profil',
            //   style:  TextStyle(fontStyle: AppText.Text16w500),
            // ),
            // Text('FIO', style: TextStyle(fontSize: AppText.Text24w500)),
            SizedBox(height: 20),
            //Button Gender
            SizedBox(
              height: 25,
              width: double.infinity,
              child: ValueListenableBuilder(
                valueListenable: _isSelected,
                builder: (context, _, __) {
                  return Row(
                    children: [
                      Expanded(
                        child: _AppButton(
                          child: Icon(Icons.woman), //can write Text('Woman')
                          borderType: ButtonBorderType.noRight,
                          onTap: (() {
                            _isSelected.value = 1;
                            _selectedType.value = 'WOMAN';
                          }),
                          isActive: _isSelected.value == 1,
                        ),
                      ),
                      Expanded(
                        child: _AppButton(
                            child: Icon(Icons.man), //can write Text('Man')
                            borderType: ButtonBorderType.noLeft,
                            onTap: (() {
                              _isSelected.value = 2;
                              _selectedType.value = 'MAN';
                            }),
                            isActive: _isSelected.value == 2),
                      ),
                      // Expanded(
                      //   child: SizedBox(
                      //     child: ElevatedButton(
                      //         style: ElevatedButton.styleFrom(
                      //             backgroundColor: AppColors.text),
                      //         onPressed: () {},
                      //         child: Text(
                      //           'SAVE',
                      //           style: TextStyle(color: AppColors.text),
                      //         )),
                      //   ),
                      // ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            //button save
            Expanded(
              child: SizedBox(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.text),
                    onPressed: () {},
                    child: Text(
                      'SAVE',
                      style: TextStyle(color: AppColors.text),
                    )),
              ),
            ),
            //for check after delet
            ValueListenableBuilder(
                valueListenable: _selectedType,
                builder: (context, _, __) {
                  return Text('${_selectedType.value} data');
                }),
          ],
        ),
      ),
    );
  }

//Always Close listen controller
  @override
  void dispose() {
    _isSelected.dispose();
    _selectedType.dispose();
    super.dispose();
  }
}

//WIDGET ButtonBorderType
enum ButtonBorderType { noRight, noLeft, both }

class _AppButton extends StatefulWidget {
  const _AppButton(
      {required this.child,
      required this.onTap,
      required this.borderType,
      required this.isActive});

  final Widget child;
  final VoidCallback onTap;
  final ButtonBorderType borderType;
  final bool isActive;

  @override
  State<_AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<_AppButton> {
  Border borderType() {
    switch (widget.borderType) {
      case ButtonBorderType.noRight:
        return Border(
          bottom: BorderSide(color: Colors.indigo),
          left: BorderSide(color: Colors.indigo, width: 0),
          top: BorderSide(color: Colors.indigo),
          right: BorderSide(color: Colors.indigo),
        );
      case ButtonBorderType.noLeft:
        return Border(
          bottom: BorderSide(color: Colors.indigo),
          left: BorderSide(color: Colors.indigo),
          top: BorderSide(color: Colors.indigo),
          right: BorderSide(color: Colors.indigo, width: 0.5),
        );
      default:
        return Border(
          bottom: BorderSide(color: Colors.indigo),
          left: BorderSide(color: Colors.indigo, width: 0.5),
          top: BorderSide(color: Colors.indigo),
          right: BorderSide(color: Colors.indigo, width: 0.5),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        decoration: BoxDecoration(border: borderType()),
        child: ElevatedButton(
          onPressed: widget.onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.isActive
                ? Colors.greenAccent.shade700
                : Colors.greenAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topRight: Radius.circular(0),
              ),
            ),
          ),
          child: widget.child,
        ));
  }
}
