import 'package:flutter/material.dart';
import 'package:vocab/theme.dart';
import 'colors.dart';
import 'supplemental/cut_corners_border.dart';



class ThemeSelector extends StatelessWidget {
  final ThemeBloc themeBloc;

  ThemeSelector({Key key, this.themeBloc}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Theme'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  
                  themeBloc.selectedTheme.add(_buildLightTheme());
                },
                shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                child: Text('Light'),
              ),
              SizedBox(height: 15.0,),
              RaisedButton(
                onPressed: () {
                  themeBloc.selectedTheme.add(_buildDarkTheme());
                },
                shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                child: Text('Dark'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

ThemeData kDarkTheme = _darkTheme();
ThemeData kLightTheme = _lightTheme();

SelectTheme _buildDarkTheme() => SelectTheme('dark', kDarkTheme);
SelectTheme _buildLightTheme() => SelectTheme('light', kLightTheme);

ThemeData _darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    accentColor: kVocabDarkGrey,
    primaryColor: kVocabDarkGrey,
    brightness: Brightness.dark,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: kVocabYellow,
      textTheme: ButtonTextTheme.normal,
    ),
    scaffoldBackgroundColor: kVocabDarkGrey,
    cardColor: kVocabDarkGrey,
    textSelectionColor: kVocabPink100,
    errorColor: kVocabErrorRed,
    textTheme: _darkTextTheme(base.textTheme),
    primaryTextTheme: _darkTextTheme(base.primaryTextTheme),
    accentTextTheme: _darkTextTheme(base.accentTextTheme),
    primaryIconTheme: base.iconTheme.copyWith(color: kVocabYellow),
    cursorColor: kVocabYellow,
    textSelectionHandleColor: kVocabSurfaceWhite.withAlpha(153),
    inputDecorationTheme: InputDecorationTheme(
      border: CutCornersBorder(),
    ),
  );
}

TextTheme _darkTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: kVocabSurfaceWhite,
        bodyColor: kVocabSurfaceWhite,
      );
}

ThemeData _lightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kVocabBrown900,
    primaryColor: kVocabPink100,
    brightness: Brightness.light,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: kVocabPink100,
      textTheme: ButtonTextTheme.normal,
    ),
    scaffoldBackgroundColor: kVocabBackgroundWhite,
    cardColor: kVocabBackgroundWhite,
    textSelectionColor: kVocabPink100,
    errorColor: kVocabErrorRed,
    textTheme: _lightTextTheme(base.textTheme),
    primaryTextTheme: _lightTextTheme(base.primaryTextTheme),
    accentTextTheme: _lightTextTheme(base.accentTextTheme),
    primaryIconTheme: base.iconTheme.copyWith(
      color: kVocabBrown900,
    ),
    cursorColor: kVocabBrown900,
    textSelectionHandleColor: kVocabBrown900.withAlpha(153),
    inputDecorationTheme: InputDecorationTheme(border: CutCornersBorder()),
  );
}

TextTheme _lightTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: kVocabBrown900,
        bodyColor: kVocabBrown900,
      );
}
