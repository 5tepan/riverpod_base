import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  /// Базовые цвета
  static const Color black = Color(0xFF000000);
  static const Color lightBlack = Color(0xFF121B35);
  static const Color white = Color(0xFFFFFFFF);
  static const Color green = Color(0xFF46C201);
  static const Color red = Color(0xFFDC4E2F);
  static const Color orange = Colors.orange;
  static const Color yellow = Colors.yellow;
  static const Color lightGrey = Color.fromRGBO(238, 238, 238, 1);
  static const Color grey = Colors.grey;
  static const Color midGrey = Color(0xFFC4C4C4);
  static const Color lightPlatinum = Color(0xFFF1F1F2);
  static const Color darkGrey = Color(0xFF586077);
  static const Color blue = Colors.blue;
  static const Color lightBlue = Colors.lightBlue;
  static const Color cyan = Colors.cyan;

  /// Основной цвет, который чаще всего отображается на экранах и компонентах
  /// приложения.
  static const Color primaryColor = blue;

  static const Color primaryLight = Color(0xFFDCE8FF);

  /// Цвет, который используется для контраста основного цвета (например в
  /// Notification(System) bar'е).
  static const Color primaryVariantColor = Color(0xFF2167F3);

  /// Вторичный цвет для FAB'ов, селекторов, слайдеров, переключателей,
  /// подсветки выделенного текста, прогрессбаров, ссылок и заголовков.
  static const Color secondaryColor = Color(0xFF4656B3);

  /// Цвет, который используется для контраста вторичного цвета (например
  /// текст внутри кнопки)
  static const Color secondaryVariantColor = Color(0xFF3846A2);

  /// Цвет фона отображается за скролящимся содержимым.
  static const Color backgroundColor = white;

  /// Цвет поверхности используется на карточках, bottomSheet и меню.
  static const Color surfaceColor = white;

  /// Цвет ошибки указывает на ошибки в компонентах, например недопустимый
  /// текст в текстовом поле.
  static const Color errorColor = red;

  /// Цвет [Scaffold] background.
  static const Color scaffoldBackgroundColor = white;

  /// The background color of [Dialog] elements.
  static const Color dialogBackground = white;

  /// Background theme color for the [AppBar].
  static const Color appBarBackground = primaryColor;

  /// Background theme color for the [ProgressIndicator],
  /// [CircularProgressIndicator], [RefreshIndicator], [CupertinoActivityIndicator].
  static const Color updatingIndicatorColor = primaryColor;

  /// Цвета «on*» в основном применяются к тексту, значкам и штрихам.
  /// Иногда их наносят на поверхности.
  /// Такие цвета используются для того, чтобы элементы, использующие их, были
  /// четкими и разборчивыми по сравнению с цветами за ними.
  static const Color onPrimaryColor = white;
  static const Color onSecondaryColor = black;
  static const Color onBackgroundColor = black;
  static const Color onSurfaceColor = black;
  static const Color onErrorColor = white;

  /// Цвета для элементов
  static const Color defaultText = darkGrey;
  static const Color divider = Color(0xFFCED2DC);
  static const Color border = Color.fromRGBO(203, 215, 222, 1.0);
  static const Color disabledBorder = Color(0xFFB9BECB);
  static const Color hint = Color(0xB58C95E6);
  static const Color pinKeyboardColor = Color(0xFF03A8B4);
  static const Color pinKeyboardPressedColor = Color(0xFF0B485A);
  static const Color pinCodeFieldColor = Color(0xFFC4C4C4);
  static const Color pinCodeFieldFilledColor = Color(0xFF0B485A);
  static const Color iosAlertButtonTextColor = Color(0xFF007AFF);
}

class AppTextStyle {
  static const TextStyle extraTitle = TextStyle(
    fontSize: 28,
    color: AppColors.onSecondaryColor,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle title = TextStyle(
    fontSize: 18,
    color: AppColors.onSecondaryColor,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle body = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.onSecondaryColor,
  );

  static TextStyle hyperLink = const TextStyle(
    fontSize: 15,
    decoration: TextDecoration.underline,
    color: AppColors.secondaryColor,
  );
}

/// Класс для формирования "визуальной темы" приложения
/// - внешний вид текстов
/// - внешний вид кнопок
/// - внешний вид полей ввода
/// - и т.д.
/// Позволяет в одном месте задать внешний вид бОльшей части стандарных
/// компонентов Flutter, и потом не дублировать код для их визуальной настройки.
class ThemeBuilder {
  static SystemUiOverlayStyle get systemUiOverlayStyle =>
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      );

  static ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      dialogBackgroundColor: AppColors.dialogBackground,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      primaryColor: AppColors.primaryColor,
      textSelectionTheme: _buildTextSelectionThemeData(),
      appBarTheme: _buildAppBarTheme(),
      textTheme: _buildTextTheme(),
      elevatedButtonTheme: _buildElevatedButtonThemeData(),
      textButtonTheme: _buildTextButtonThemeData(),
      inputDecorationTheme: _buildInputDecorationTheme(_buildTextTheme()),
      floatingActionButtonTheme: _buildFloatingActionButtonThemeData(),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColors.primaryColor,
        secondary: AppColors.secondaryColor,
        brightness: Brightness.light,
        error: AppColors.errorColor,
        onError: AppColors.onErrorColor,
        surface: AppColors.surfaceColor,
        onPrimary: AppColors.onPrimaryColor,
        onSecondary: AppColors.onSecondaryColor,
        onSurface: AppColors.onSurfaceColor,
        primaryContainer: AppColors.primaryVariantColor,
        secondaryContainer: AppColors.secondaryVariantColor,
      ),
    );
  }

  static TextTheme _buildTextTheme() {
    const textColor = AppColors.defaultText;
    return const TextTheme(
      displayLarge: TextStyle(
        fontSize: 45,
        color: textColor,
      ),
      displayMedium: TextStyle(
        fontSize: 40,
        color: textColor,
      ),
      displaySmall: TextStyle(
        fontSize: 33,
        color: textColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 22,
        color: textColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        color: textColor,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      labelLarge: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.normal,
        color: textColor,
      ),
    );
  }

  static TextSelectionThemeData _buildTextSelectionThemeData() {
    return TextSelectionThemeData(
      cursorColor: AppColors.secondaryColor,
      selectionHandleColor: AppColors.secondaryColor.withValues(alpha: 0.7),
    );
  }

  static AppBarTheme _buildAppBarTheme() {
    return const AppBarTheme(
      backgroundColor: AppColors.appBarBackground,
      elevation: 0,
    );
  }

  static ElevatedButtonThemeData _buildElevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(12)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return AppColors.blue;
          }
          if (states.contains(WidgetState.disabled)) {
            return AppColors.grey;
          }
          return AppColors.blue;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return AppColors.onPrimaryColor;
          }
          if (states.contains(WidgetState.disabled)) {
            return AppColors.onPrimaryColor;
          }
          return AppColors.onPrimaryColor;
        }),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 19.0),
        ),
      ),
    );
  }

  static TextButtonThemeData _buildTextButtonThemeData() {
    return TextButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(4)),
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 19.0),
        ),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.secondaryColor;
          }
          if (states.contains(WidgetState.pressed)) {
            return AppColors.secondaryColor;
          }
          return AppColors.secondaryColor;
        }),
        splashFactory: NoSplash.splashFactory,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }

  static InputDecorationTheme _buildInputDecorationTheme(TextTheme textTheme) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        color: AppColors.border,
      ),
    );
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      border: border,
      counterStyle: textTheme.bodyMedium?.copyWith(color: AppColors.border),
      enabledBorder: border,
      disabledBorder: border.copyWith(
        borderSide: border.borderSide.copyWith(color: AppColors.disabledBorder),
      ),
      errorBorder: border.copyWith(
        borderSide: border.borderSide.copyWith(color: AppColors.errorColor),
      ),
      focusedBorder: border.copyWith(
        borderSide: border.borderSide.copyWith(color: AppColors.primaryColor),
      ),
      hintStyle: textTheme.bodyMedium?.copyWith(color: AppColors.hint),
      labelStyle: textTheme.bodyMedium,
      errorStyle: textTheme.bodyMedium?.copyWith(color: AppColors.errorColor),
      contentPadding: const EdgeInsets.all(10),
    );
  }

  static FloatingActionButtonThemeData _buildFloatingActionButtonThemeData() {
    return const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: AppColors.secondaryColor,
    );
  }

  static InputDecoration buildSearchInputDecoration() {
    return const InputDecoration(
      filled: true,
      fillColor: AppColors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
      border: InputBorder.none,
      hintStyle: TextStyle(color: AppColors.hint),
      errorMaxLines: 1,
    );
  }

  static Theme buildDatePickerTheme({
    required Widget child,
  }) {
    return Theme(
      data: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: AppColors.primaryColor,
          outlineVariant: AppColors.blue,
        ),
        primaryColor: AppColors.primaryColor,
      ),
      child: child,
    );
  }
}
