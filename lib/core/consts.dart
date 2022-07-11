import 'package:flutter/material.dart';

const SIDE_PADDING = 22.0;
const TOP_PADDING = 45.0;
const String naira = '₦';

//MediaQuery Width
double width(BuildContext context) => MediaQuery.of(context).size.width;

//MediaQuery Height
double height(BuildContext context) => MediaQuery.of(context).size.height;

verticalSpace(context, percentage) => SizedBox(height:height(context) * percentage);

horizontalSpace(context, percentage) => SizedBox(width:width(context) * percentage);

SizedBox mediumVerticalSpacing() => const SizedBox(height: 30);
SizedBox mediumHorizontalSpacing() => const SizedBox(width: 30);

SizedBox smallVerticalSpacing() => const SizedBox(height: 20);
SizedBox smallHorizontalSpacing() => const SizedBox(width: 20);

SizedBox smallerVerticalSpacing() => const SizedBox(height: 10);
SizedBox smallerHorizontalSpacing() => const SizedBox(width: 10);

SizedBox tinyVerticalSpacing() => const SizedBox(height: 5);
SizedBox tinyHorizontalSpacing() => const SizedBox(width: 5);