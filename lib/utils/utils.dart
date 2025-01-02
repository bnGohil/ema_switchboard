library utils;

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:switchboard/app/login/route/login_route.dart';
import 'package:switchboard/app/onboarding_page/route/onboarding_route.dart';
import 'package:switchboard/app/tab_page/route/tab_route.dart';


import '../app/lending/route/lending_route.dart';
import '../base/base.dart';
import '../theme/theme.dart';




part './sizer/size_util.dart';
part './sizer/size_widget.dart';
part './sizer/size_extension.dart';

part './extension/string.dart';


part 'exceptions.dart';
part '../routes/routing.dart';
part 'user_prefs.dart';
part 'base_notifier.dart';
part 'print.dart';
part 'navigation_context.dart';
part 'image_custom_view.dart';
part 'loading_view.dart';