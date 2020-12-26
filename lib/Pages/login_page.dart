import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
  width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
           Container(
             decoration: BoxDecoration(
               boxShadow: [
                 BoxShadow(
                   color: Colors.greenAccent,
                   blurRadius: 30,
                   offset: Offset(10, 10),
                   spreadRadius: 0,
                 )
               ]
             ),
             margin: EdgeInsets.only(top: 50.0),
             child: Image(
                 image:AssetImage('assets/logo_round.png'),
               height: 130.0,width: 130.0,
             ),
           ),
            Container(
          margin: EdgeInsets.only(top: 30.0),
              child: Text(
               'Login',style: TextStyle(fontSize: 30.0,),

              ),


            ),
            Container(
          padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.only(top: 20.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
         border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'write email here',




                ),
                keyboardType: TextInputType.emailAddress,
              ),

              
            ),
            Container(
          padding: EdgeInsets.all(20.0),

              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
         border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'write Password here',




                ),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),


            ),
            InkWell(
              onTap: (){
                _signIn();
              },
              child: Container(
              decoration: BoxDecoration(

                gradient: LinearGradient(
                 colors: [
               Colors.greenAccent,Colors.lightGreen,


                 ]


                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 20.0),
                margin: EdgeInsets.symmetric(horizontal: 30.0,vertical: 20.0),
               child: Center(
                 child: Text('Login with email',style: TextStyle(color: Colors.white70),),
               ),




              ),
            ),
            FlatButton(
                onPressed:() {},
              child: Text('Sign up using email'),

            ),
            Wrap(
              children: [
                FlatButton.icon(
                    onPressed:(){},
                  icon: Icon(FontAwesomeIcons.google),
                  label: Text('Sign up using Gmail', style: TextStyle(color: Colors.red),
                  ),

                    ),
                FlatButton.icon(
                    onPressed:(){},
                  icon: Icon(FontAwesomeIcons.phone),
                  label: Text('Sign up using Phone', style: TextStyle(color: Colors.blue),
                  ),

                    ),




              ],


            ),


          ],


        ),


      ),


    );
  }
  void _signIn()async{
String email=_emailController.text.trim();
String Password=_passwordController.text;
if(email.isNotEmpty && Password.isNotEmpty){
  _auth.signInWithEmailAndPassword(email: email, password:Password).then((user) {
    showDialog(
      context: context,
      builder: (ctx){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),

          ),
          title: Text('Done'),
          content: Text('Sign in Success'),
          actions: [
            FlatButton(
              child: Text('Cancel'),
              onPressed:(){
                Navigator.of(ctx).pop();
              },
            ),
            FlatButton(
              child: Text('ok'),
              onPressed:(){
                _emailController.text='';
                _passwordController.text='';
                Navigator.of(ctx).pop();
              },
            ),



          ],

        );
      },
    );

  }




  ).catchError((e){
    showDialog(
      context: context,
      builder: (ctx){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),

          ),
          title: Text('Error'),
          content: Text('e'),
          actions: [
            FlatButton(
              child: Text('Cancel'),
              onPressed:(){
                Navigator.of(ctx).pop();
              },
            ),
            FlatButton(
              child: Text('ok'),
              onPressed:(){
                _emailController.text='';
                _passwordController.text='';
                Navigator.of(ctx).pop();
              },
            ),



          ],

        );
      },
    );

  }
  );

}else{
showDialog(
    context: context,
  builder: (ctx){
      return AlertDialog(
        shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(15.0),

        ),
      title: Text('Error'),
        content: Text('Provide  email and password'),
        actions: [
        FlatButton(
          child: Text('Cancel'),
            onPressed:(){
            Navigator.of(ctx).pop();
            },
            ),
        FlatButton(
          child: Text('ok'),
            onPressed:(){
            _emailController.text='';
            _passwordController.text='';
            Navigator.of(ctx).pop();
            },
            ),



        ],
        
      );
  },
);

}


  }
}
