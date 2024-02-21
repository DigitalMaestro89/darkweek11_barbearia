import 'package:flutter/material.dart';

extension MediaQueryExt on BuildContext {
  Size get mediaQuerySize => MediaQuery.of(this).size;
  EdgeInsets get mediaQueryPadding => MediaQuery.of(this).padding;
  EdgeInsets get mediaQueryViewPadding => MediaQuery.of(this).viewPadding;
  EdgeInsets get mediaQueryViewInsets => MediaQuery.of(this).viewInsets;
  Brightness get platformBrightness => MediaQuery.of(this).platformBrightness;
  Orientation get orientation => MediaQuery.of(this).orientation;
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;
  TextScaler get textScaleFactor => MediaQuery.of(this).textScaler;
  double get mediaQueryShortestSide => mediaQuerySize.shortestSide;
  double get mediaQueryLongestSide => mediaQuerySize.longestSide;
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get topPadding => MediaQuery.of(this).padding.top;
  double get bottomPadding => MediaQuery.of(this).padding.bottom;
  double get statusBar => MediaQuery.of(this).viewPadding.top;
  double get appBarHeight => kToolbarHeight;
  double get bottomBarHeight => kBottomNavigationBarHeight;
  bool get isLandscape => orientation == Orientation.landscape;
  bool get isPortrait => orientation == Orientation.portrait;
  bool get alwaysUse24HourFormat => MediaQuery.of(this).alwaysUse24HourFormat;
  bool get isPhone => (mediaQueryShortestSide < 600);
  bool get isSmallTablet => (mediaQueryShortestSide >= 600);
  bool get isLargeTablet => (mediaQueryShortestSide >= 720);
  bool get isTablet => isSmallTablet || isLargeTablet;
  double percentWidth(double percent) => width * percent;
  double percentHeight(double percent) => height * percent;
}

extension NavigatorExt on BuildContext {
  Future<T?> push<T>(Route<T> route) => Navigator.push(this, route);
  void pop<T extends Object>([T? result]) => Navigator.pop(this, result);
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) =>
      Navigator.pushNamed<T?>(this, routeName, arguments: arguments);
  bool canPop() => Navigator.canPop(this);
  void popUntil(RoutePredicate predicate) =>
      Navigator.popUntil(this, predicate);
  void pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  void pushReplacement<T extends Object, TO extends Object>(Route<T> newRoute,
          [TO? result]) =>
      Navigator.pushReplacement(this, newRoute, result: result);
  void pushAndRemoveUntil<T extends Object, TO extends Object>(
          Route<T> newRoute, RoutePredicate predicate) =>
      Navigator.pushAndRemoveUntil(this, newRoute, predicate);
  void pushNamedAndRemoveUntil<T extends Object>(
          String newRouteName, RoutePredicate predicate, {Object? arguments}) =>
      Navigator.pushNamedAndRemoveUntil<T>(this, newRouteName, predicate,
          arguments: arguments);
  void popAndPushNamed<T extends Object?, TO extends Object?>(
       String newRoute, [TO? result]) => Navigator.popAndPushNamed(this, newRoute, result: result);          
}

extension ThemeExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get backgroundColor => Theme.of(this).colorScheme.background;
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;
  Color get canvasColor => Theme.of(this).canvasColor;
  Color get cardColor => Theme.of(this).cardColor;
  Color get dividerColor => Theme.of(this).dividerColor;
  Color get focusColor => Theme.of(this).focusColor;
  Color get hoverColor => Theme.of(this).hoverColor;
  Color get highlightColor => Theme.of(this).highlightColor;
  Color get splashColor => Theme.of(this).splashColor;
  //Color get selectedRowColor => Theme.of(this).selectedRowColor;
  Color get unselectedWidgetColor => Theme.of(this).unselectedWidgetColor;
  Color get disabledColor => Theme.of(this).disabledColor;
  //Color get toggleableActiveColor => Theme.of(this).toggleableActiveColor;
  Color get secondaryHeaderColor => Theme.of(this).secondaryHeaderColor;
  Color get dialogBackgroundColor => Theme.of(this).dialogBackgroundColor;
  Color get indicatorColor => Theme.of(this).indicatorColor;
  Color get hintColor => Theme.of(this).hintColor;
  Color get errorColor => Theme.of(this).colorScheme.error;
  Color get secondaryColor => Theme.of(this).secondaryHeaderColor;
  TextTheme get primaryTextTheme => Theme.of(this).primaryTextTheme;
  BottomAppBarTheme get bottomAppBarTheme => Theme.of(this).bottomAppBarTheme;
  BottomSheetThemeData get bottomSheetTheme => Theme.of(this).bottomSheetTheme;
  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;
  TextStyle? get headline1 => textTheme.displayLarge;
  TextStyle? get headline2 => textTheme.displayMedium;
  TextStyle? get headline3 => textTheme.displaySmall;
  TextStyle? get headline4 => textTheme.headlineMedium;
  TextStyle? get headline5 => textTheme.headlineSmall;
  TextStyle? get headline6 => textTheme.titleLarge;
  TextStyle? get subtitle1 => textTheme.titleMedium;
  TextStyle? get subtitle2 => textTheme.titleSmall;
  TextStyle? get bodyText1 => textTheme.bodyLarge;
  TextStyle? get bodyText2 => textTheme.bodyMedium;
  TextStyle? get caption => textTheme.bodySmall;
  TextStyle? get button => textTheme.labelLarge;
  TextStyle? get overline => textTheme.labelSmall;
}

extension ScaffoldExt on BuildContext {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
          SnackBar snackbar) =>
      ScaffoldMessenger.of(this).showSnackBar(snackbar);
  void removeCurrentSnackBar(SnackBarClosedReason reason) =>
      ScaffoldMessenger.of(this).removeCurrentSnackBar(reason: reason);
  void hideCurrentSnackBar(SnackBarClosedReason reason) =>
      ScaffoldMessenger.of(this).hideCurrentSnackBar(reason: reason);
  void openDrawer() => Scaffold.of(this).openDrawer();
  void openEndDrawer() => Scaffold.of(this).openEndDrawer();
  void closeDrawer() => Scaffold.of(this).openDrawer();
  void closeEndDrawer() => Scaffold.of(this).closeEndDrawer();
  void closeDrawerOrEndDrawer() {
    if (Scaffold.of(this).hasEndDrawer) {
      closeEndDrawer();
    } else {
      closeDrawer();
    }
  }

  void showBottomSheet(
    WidgetBuilder builder, {
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehaviour,
  }) =>
      Scaffold.of(this).showBottomSheet(
        builder,
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: shape,
        clipBehavior: clipBehaviour,
      );
}

class FormContext {
  FormContext(this._context);
  final BuildContext _context;
  bool validate() => Form.of(_context).validate();
  void reset() => Form.of(_context).reset();
  void save() => Form.of(_context).save();
}

extension FormExt on BuildContext {
  FormContext get form => FormContext(this);
}

class FocusScopeContext {
  const FocusScopeContext(this._context);
  final BuildContext _context;
  FocusScopeNode _node() => FocusScope.of(_context);
  bool get hasFocus => _node().hasFocus;
  bool get isFirstFocus => _node().isFirstFocus;
  bool get hasPrimaryFocus => _node().hasPrimaryFocus;
  bool get canRequestFocus => _node().canRequestFocus;
  bool consumeKeyboardToken() => _node().consumeKeyboardToken();
  void nextFocus() => _node().nextFocus();
  void requestFocus([FocusNode? node]) => _node().requestFocus(node);
  void previousFocus() => _node().previousFocus();
  void unfocus([bool focusPrevious = false]) => _node().unfocus();
  void setFirstFocus(FocusScopeNode scope) => _node().setFirstFocus(scope);
  void closeKeyboard() => _node().requestFocus(FocusNode());
}

extension ModalRouteExt<T> on BuildContext {
  ModalRoute<T>? get modalRoute => ModalRoute.of<T>(this);
  RouteSettings? get routeSettings => modalRoute?.settings;
  bool get canPop => modalRoute?.canPop ?? false;
  bool get isActive => modalRoute?.isActive ?? false;
  bool get isCurrent => modalRoute?.isCurrent ?? false;
}

extension FocusScopeExt on BuildContext {
  FocusScopeContext get focusScope => FocusScopeContext(this);
}

extension PlatformExt on BuildContext {
  TargetPlatform get platform => Theme.of(this).platform;
  bool get isAndroid => platform == TargetPlatform.android;
  bool get isIOS => platform == TargetPlatform.iOS;
  bool get isFuchsia => platform == TargetPlatform.fuchsia;
  bool get isLinux => platform == TargetPlatform.linux;
  bool get isMacOS => platform == TargetPlatform.macOS;
  bool get isWindows => platform == TargetPlatform.windows;
}
