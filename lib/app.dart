import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'backdrop.dart';
import 'model/product.dart';
import 'category_menu_page.dart';
import 'theme.dart';

class VocabApp extends StatefulWidget {
  @override
  _VocabAppState createState() {
    return new _VocabAppState();
  }
}

class _VocabAppState extends State<VocabApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeBloc themeBloc = ThemeBloc();

    return StreamBuilder<ThemeData>(
      initialData: themeBloc.initialTheme().data,
      stream: themeBloc.themeDataStream,
      builder: (BuildContext context, AsyncSnapshot<ThemeData> snapshot) {
        return MaterialApp(
          title: 'Vocabulary',
          home: Backdrop(
            themeBloc: themeBloc,
            currentCategory: Category.all,
            frontLayer: HomePage(
              category: _currentCategory,
            ),
            backLayer: CategoryMenuPage(
              currentCategory: _currentCategory,
              onCategoryTap: _onCategoryTap,
            ),
            frontTitle: Text('Vocabulary'),
            backTitle: Text('Menu'),
          ),
          initialRoute: '/login',
          onGenerateRoute: _getRoute,
          theme: snapshot.data,
          
        );
      },
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}
