// widget AppBar
import 'package:flutter/material.dart';

import '../mode/user_pferences.dart';

AppBar bilderAppBar(BuildContext context) {
  final user = UserPferences.getUser();
  return AppBar(
    leading: BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
