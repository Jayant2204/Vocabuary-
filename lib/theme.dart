import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'colors.dart';
import 'supplemental/cut_corners_border.dart';


class SelectTheme{
  final String name;
  final ThemeData data;
  const SelectTheme(this.name, this.data);
}

class ThemeBloc {
  final Stream<ThemeData> themeDataStream;
  final Sink<SelectTheme> selectedTheme; 
  factory ThemeBloc() {
    final selectedTheme = PublishSubject<SelectTheme>();
    final themeDataStream = selectedTheme.distinct().map((theme) => theme.data);
    return ThemeBloc._(themeDataStream, selectedTheme );    
  }
    
  const ThemeBloc._(this.themeDataStream, this.selectedTheme);

  SelectTheme initialTheme() {
    return SelectTheme(
      'initial', defaultTheme(), 
      );
  }
  void dispose() { 
    selectedTheme.close();
  }
}


ThemeData defaultTheme() {
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
    textTheme: defaultTextTheme(base.textTheme),
    primaryTextTheme: defaultTextTheme(base.primaryTextTheme),
    accentTextTheme: defaultTextTheme(base.accentTextTheme),
    primaryIconTheme: base.iconTheme.copyWith(
      color: kVocabBrown900,
    ),
     cursorColor: kVocabBrown900,
    inputDecorationTheme: InputDecorationTheme(border: CutCornersBorder()),
    
  );
}

TextTheme defaultTextTheme(TextTheme base) {
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
