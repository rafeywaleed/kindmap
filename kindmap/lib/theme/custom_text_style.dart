import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeGray40004 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray40004,
      );
  static get bodyLargeTelexPrimary => theme.textTheme.bodyLarge!.telex.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
      );
  static get bodySmallGray700a2 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray700A2,
      );
  // Display text style
  static get displayMediumStaatliches =>
      theme.textTheme.displayMedium!.staatliches.copyWith(
        fontSize: 40.fSize,
        fontWeight: FontWeight.w400,
      );
  static get displayMediumStaatlichesWhiteA70001 =>
      theme.textTheme.displayMedium!.staatliches.copyWith(
        color: appTheme.whiteA70001,
        fontSize: 40.fSize,
        fontWeight: FontWeight.w400,
      );
  // Headline text style
  static get headlineLarge32 => theme.textTheme.headlineLarge!.copyWith(
        fontSize: 32.fSize,
      );
  static get headlineLargePrimary => theme.textTheme.headlineLarge!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
      );
  static get headlineLargeSmoochSansPrimary =>
      theme.textTheme.headlineLarge!.smoochSans.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
  static get headlineSmall25 => theme.textTheme.headlineSmall!.copyWith(
        fontSize: 25.fSize,
      );
  static get headlineSmallBlack900 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.black900,
      );
  static get headlineSmallBluegray700 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.blueGray700,
        fontWeight: FontWeight.w500,
      );
  static get headlineSmallDeeporangeA400 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.deepOrangeA400,
      );
  static get headlineSmallGray200 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.gray200,
        fontSize: 25.fSize,
      );
  static get headlineSmallOnErrorContainer =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontSize: 25.fSize,
      );
  static get headlineSmallPrimary => theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
      );
  static get headlineSmallRedA700 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.redA700,
      );
  // Title text style
  static get titleLargeBluegray10002 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.blueGray10002,
        fontSize: 20.fSize,
      );
  static get titleLargeBluegray10003 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.blueGray10003,
        fontSize: 20.fSize,
      );
  static get titleLargeGray40007 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray40007,
        fontSize: 20.fSize,
      );
  static get titleLargeGray50 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray50,
      );
  static get titleLargeGray70002 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray70002,
        fontSize: 20.fSize,
      );
  static get titleLargePoppinsGray90004 =>
      theme.textTheme.titleLarge!.poppins.copyWith(
        color: appTheme.gray90004,
        fontSize: 23.fSize,
        fontWeight: FontWeight.w400,
      );
  static get titleLargePoppinsWhiteA70001 =>
      theme.textTheme.titleLarge!.poppins.copyWith(
        color: appTheme.whiteA70001,
        fontSize: 23.fSize,
        fontWeight: FontWeight.w400,
      );
  static get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontSize: 20.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleLargePrimary20 => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontSize: 20.fSize,
      );
  static get titleLargePrimaryRegular => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
      );
  static get titleLargePrimaryRegular20 => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.6),
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeSmoochSansPrimary =>
      theme.textTheme.titleLarge!.smoochSans.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 20.fSize,
      );
  static get titleLargeWhiteA70001 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA70001,
        fontSize: 20.fSize,
      );
  static get titleLargeWhiteA70001Regular =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA70001,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeWhiteA70001_1 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA70001,
      );
  static get titleMediumBluegray900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumGray100 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray100,
        fontSize: 16.fSize,
      );
  static get titleMediumGray50ed => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray50Ed,
      );
  static get titleMediumRed500 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.red500,
        fontSize: 16.fSize,
      );
  static get titleMediumWhiteA70001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA70001,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallBluegray10001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray10001,
      );
  static get titleSmallBluegray10006 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray10006,
      );
  static get titleSmallGray40001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray40001,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallGray40005 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray40005,
      );
  static get titleSmallGray70004 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray70004,
      );
  static get titleSmallGray90002 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray90002,
      );
  static get titleSmallPoppinsGray800 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.gray800,
      );
  static get titleSmallPoppinsOnError =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: theme.colorScheme.onError,
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontWeight: FontWeight.w700,
      );
  static get titleSmallPrimaryBold => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
        fontSize: 14.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallPrimary_1 => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary.withOpacity(1),
      );
}

extension on TextStyle {
  TextStyle get telex {
    return copyWith(
      fontFamily: 'Telex',
    );
  }

  TextStyle get lexendDeca {
    return copyWith(
      fontFamily: 'Lexend Deca',
    );
  }

  TextStyle get smoochSans {
    return copyWith(
      fontFamily: 'Smooch Sans',
    );
  }

  TextStyle get plusJakartaSans {
    return copyWith(
      fontFamily: 'Plus Jakarta Sans',
    );
  }

  TextStyle get staatliches {
    return copyWith(
      fontFamily: 'Staatliches',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
