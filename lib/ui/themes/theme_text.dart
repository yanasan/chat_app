import 'dart:io';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class _ThemeText extends StatelessWidget {
  const _ThemeText(
    this.text,
    this.size, {
    super.key,
    required this.color,
    required this.weight,
    this.overflow,
    this.maxLines,
  });

  final String text;
  final Color color;
  final double size;
  final FontWeight weight;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    // bool isAndroid = Platform.isAndroid || text.contains('アンドロイド');
    final isAndroid = Platform.isAndroid;

    // notoとhiraginoのフォントそのもののPadding差を埋める（だいたいFontSizeの1/15ぐらいがちょうど）
    // https://github.com/kamo-it/nekochan/issues/27#issuecomment-1304944359
    final fixPadding = size.toInt() ~/ 15;

    return Padding(
      padding: EdgeInsets.only(
        top: isAndroid ? 0 : fixPadding.toDouble(),
        bottom: isAndroid ? fixPadding.toDouble() * 2 : fixPadding.toDouble(),
      ),
      child: Text(
        text,
        maxLines: maxLines,
        style: TextStyle(
          fontWeight: weight,
          color: color,
          fontSize: size,
          height: 1.5,
          overflow: overflow,
        ),
      ),
    );
  }
}

class Black1Text extends _ThemeText {
  const Black1Text(
    super.text,
    super.size, {
    super.key,
    super.overflow,
  }) : super(color: AppColors.black1, weight: FontWeight.w400);

  const Black1Text.bold(
    super.text,
    super.size, {
    super.key,
  }) : super(color: AppColors.black1, weight: FontWeight.w700);
}

class Black2Text extends _ThemeText {
  const Black2Text(
    super.text,
    super.size, {
    super.key,
  }) : super(color: AppColors.black2, weight: FontWeight.w400);

  const Black2Text.bold(
    super.text,
    super.size, {
    super.key,
  }) : super(color: AppColors.black2, weight: FontWeight.w700);
}

class Gray1Text extends _ThemeText {
  const Gray1Text(
    super.text,
    super.size, {
    super.key,
  }) : super(color: AppColors.gray1, weight: FontWeight.w400);

  const Gray1Text.bold(
    super.text,
    super.size, {
    super.key,
  }) : super(color: AppColors.gray1, weight: FontWeight.w700);
}

class Gray2Text extends _ThemeText {
  const Gray2Text(
    super.text,
    super.size, {
    super.key,
  }) : super(color: AppColors.gray2, weight: FontWeight.w400);

  const Gray2Text.bold(
    super.text,
    super.size, {
    super.key,
  }) : super(color: AppColors.gray2, weight: FontWeight.w700);
}

class ErrorText extends _ThemeText {
  const ErrorText(
    super.text,
    super.size, {
    super.key,
  }) : super(color: AppColors.error, weight: FontWeight.w400);

  const ErrorText.bold(
    super.text,
    super.size, {
    super.key,
  }) : super(color: AppColors.error, weight: FontWeight.w700);
}

class WhiteText extends _ThemeText {
  const WhiteText(
    super.text,
    super.size, {
    super.key,
  }) : super(color: AppColors.white, weight: FontWeight.w400);

  const WhiteText.bold(
    super.text,
    super.size, {
    super.key,
  }) : super(color: AppColors.white, weight: FontWeight.w700);
}

class CustomText extends _ThemeText {
  const CustomText(
    super.text,
    super.size, {
    super.key,
    required super.color,
    super.overflow,
    super.maxLines,
  }) : super(weight: FontWeight.w400);

  const CustomText.bold(
    super.text,
    super.size, {
    super.key,
    required super.color,
    super.overflow,
    super.maxLines,
  }) : super(weight: FontWeight.w700);
}
