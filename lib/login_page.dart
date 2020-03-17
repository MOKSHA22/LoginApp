import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _LoginPageState();

}

class _LoginPageState  extends State<LoginPage>{

  final formKey = new GlobalKey<FormState>();
  //final focus = FocusNode();
  String _email;
  String _mobile;
  String _password;
  //String _passwordConfirm;

  void validateAndSave() {
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      print('Form is Valid: $_email, $_mobile, $_password');
      //print(' $_email, $_mobile, $_password');
    }
    else
      print('Form is Invalid');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text('Flutter Login App Demo'),
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          key: formKey,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Email'),
                validator: (value)=> value.isEmpty? 'Email can\'t be empty': null,
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => _email=value,
                // textInputAction: TextInputAction.next,
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Mobile'),
                validator: (value)=> value.isEmpty? 'Mobile number can\'t be empty': null,
                keyboardType: TextInputType.phone,
                onSaved: (value) => _mobile= value,
//                  onFieldSubmitted: (v){
//                    FocusScope.of(context).requestFocus(focus);
//                  },
              ),
              new TextFormField(
                  decoration: new InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value)=> value.isEmpty? 'Password can\'t be empty': null,
                  onSaved: (value) => _password= value,
                  textInputAction: TextInputAction.done
              ),
//                new TextFormField(
//                  decoration: new InputDecoration(labelText: 'PasswordConfirm'),
//                  obscureText: true,
//                  validator: (value)=> value.isEmpty? 'Password Confirmation can\'t be empty': null,
//                ),
              new RaisedButton(
                child: new Text('Login',style: new TextStyle(fontSize: 20.0),),
                onPressed: validateAndSave, // calling validateAndSave(){}
              )
            ],
          ),
        ),
      ),
    );
  }

}