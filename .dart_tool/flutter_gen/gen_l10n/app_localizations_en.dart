import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get bottomNavHome => 'Home';

  @override
  String get bottomNavFavorite => 'Favorite';

  @override
  String get bottomNavSettings => 'Settings';

  @override
  String get titleOtherView => 'OtherView';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsFontSize => 'Font Size';
}
