import 'package:flutter/material.dart';
//import 'colors.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Icon(
                  Icons.blur_on,
                  size: 100.0,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text('Vocabulary'),
              ],
            ),
            SizedBox(
              height: 120.0,
            ),
            AccentColorOverride(
              color: theme.cursorColor,
              child: TextField(
                decoration: InputDecoration(
                  //filled: true,
                  labelText: 'Username',
                ),
                controller: _userNameController,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            AccentColorOverride(
              color: theme.cursorColor,
              child: TextField(
                decoration: InputDecoration(
                  //filled: true,
                  labelText: 'Password',
                ),
                obscureText: true,
                controller: _passwordController,
              ),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('Cancel'),
                  //Icon(Icons.clear, size: 60.0,),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  onPressed: () {
                    _userNameController.clear();
                    _passwordController.clear();
                  },
                ),
                RaisedButton(
                  child:
                      Text('Next'), //Icon(Icons.navigate_next, size: 65.0, ),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  elevation: 8.0,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AccentColorOverride extends StatelessWidget {
  const AccentColorOverride({Key key, this.color, this.child})
      : super(key: key);
  final color;
  final child;
  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context)
          .copyWith(accentColor: color, brightness: Brightness.dark),
    );
  }
}
