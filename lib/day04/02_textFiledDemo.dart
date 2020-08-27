import 'package:flutter/material.dart';
class TextFieldDemo extends StatelessWidget {


  final TextEditingController usernameTextEditController;
  final TextEditingController passwordTextEditController;

  const TextFieldDemo({Key key, this.usernameTextEditController, this.passwordTextEditController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor: Colors.red
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: usernameTextEditController,
              decoration: InputDecoration(
//        labelText: 'userName',
                  icon: Icon(Icons.people),
                  hintText: '请输入用户名',
                  border:OutlineInputBorder(),
                  fillColor: Colors.cyan,
                  filled: true
              ),
              onChanged: (value){
                print('onchange:$value');
              },
              onSubmitted: (value){
                print('onSubmitted$value');
              },
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordTextEditController,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                hintText: '请输入密码',
                border:OutlineInputBorder(),
              ),
              onChanged: (value){
                print('onchange:$value');
              },
              onSubmitted: (value){
                print('onSubmitted$value');
              },
            ),
            SizedBox(height: 40,),
            Container(
              width: 200,
              height: 32,
              child: FlatButton(
                child: Text('登陆',style: TextStyle(fontSize: 20,color: Colors.white),),
                color: Colors.cyan,
                onPressed: (){
                  final userName = usernameTextEditController.text;
                  final passWord = passwordTextEditController.text;
                  print('userName:$userName,password:$passWord');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
