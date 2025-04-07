import 'package:flutter/material.dart';
import 'package:supa_liquid/core/localization/localization_labels.dart';
import 'package:supa_liquid/core/util/extensions/extensions.dart';

final navigatorKey = GlobalKey<NavigatorState>();
LocalizationLabels get labels =>
    navigatorKey.currentContext!.localizationLabels;
