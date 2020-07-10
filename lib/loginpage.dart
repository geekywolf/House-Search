import 'package:flutter/material.dart';
import 'utils/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  final _formkey = GlobalKey<FormState>();

  @override
  // ignore: must_call_super
  void initState() {
    _emailController = new TextEditingController(text: "");
    _passwordController = new TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Stack( 
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("Assets/login.jpg"),
            fit: BoxFit.cover,
            color: Colors.white54,
            colorBlendMode: BlendMode.lighten,
            
          ),
          Center(
                child: SingleChildScrollView(
                  child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Container(
                    //   height: 110,
                    //   width: 110,
                    //   child: Image(
                    //     image: new AssetImage("Assets/house.png"),
                    //     fit: BoxFit.fill,
                    //     // color: Colors.deepPurple,
                    //     colorBlendMode: BlendMode.lighten,
                    //   ),
                    // ),
                    Container(
                      padding: EdgeInsets.only(top:150, right: 170),
                      child: Text("Sign In",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                      ),
                    ),
                    SizedBox(height: 10),
                    new Form(
                      key: _formkey,
                      child: Theme(
                        data: ThemeData(
                          brightness: Brightness.light,
                          primarySwatch: Colors.deepPurple,
                          inputDecorationTheme: InputDecorationTheme(
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(30.0),
                          child: new Column(
                            children: <Widget>[
                              TextFormField(
                                controller: _emailController,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                                decoration: new InputDecoration(
                                  hintText: "Enter Email",
                                  prefixIcon: Icon(Icons.email),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                // ignore: missing_return
                                validator: (value){
                                  if(value.isEmpty){
                                    return "Please enter your Email Email";
                                  }
                                },
                                // validator: ,
                              ),
                              TextFormField(
                                controller: _passwordController,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                                decoration: new InputDecoration(
                                  hintText: "Enter Password",
                                  prefixIcon: Icon(Icons.remove_red_eye),
                                ),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                // ignore: missing_return
                                validator: (value){
                                  if(value.isEmpty){
                                    return "Please enter your Password";
                                  }
                                  if(value.length < 6){
                                    return "Password must contain more than 6 characters";
                                  }
                                },
                              ),
                              SizedBox(height: 5.0),

                               Container(
                                 padding: EdgeInsets.only(left:150),
                                 
                                 child: InkWell(
                                      onTap: (){},
                                      splashColor: Colors.purple,
                                      child: Container(
                                          width: 150,
                                          height: 30,
                                          alignment: Alignment(0.5, 0.0),
                                          padding: EdgeInsets.only(top:10.0, left: 20.0),
                                          child: Text(
                                          "Forgot password?",
                                          style: TextStyle(
                                            color: Colors.deepPurple,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 15.0,
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ),
                               ),
                              const SizedBox(height: 20.0),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),),
                                height: 40.0,
                                minWidth: 1000.0,
                                color: Colors.deepPurple,
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 22,
                                      color: Colors.white),
                                ),
                                onPressed: () async{
                                    _formkey.currentState.validate();
                                    bool res = await AuthProvider().signInWithEmail(
                                          _emailController.text,
                                          _passwordController.text);
                                          if(res){
                                            print("Login Successful");
                                          }
                                },
                              ),
                              const SizedBox(height: 30.0),
                              Container(
                                child: Text(
                                  "OR",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: Colors.deepPurple,  width: 1, style: BorderStyle.solid,),
                                  ),
                                
                                height: 40.0,
                                minWidth: 1000.0,
                                // color: Colors.white10,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget> [
                                      Container(
                                        // padding: EdgeInsets.only(right: 5,),
                                        // child: Text("G",
                                        // style: TextStyle(
                                        //   color: Colors.deepPurple,
                                        //   fontStyle: FontStyle.normal,
                                        //   fontSize: 35,
                                        //   fontWeight: FontWeight.bold,),),
                                        child: Image.asset('Assets/google logo.png',
                                        height: 45,),
                                      ),
                                      SizedBox(width: 15,),
                                      Center(
                                      child: Text(
                                      "LOGIN WITH GOOGLE",
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15,
                                          color: Colors.deepPurple),
                                  ),
                                    ),
                                ],
                                ),
                                // ignore: missing_return
                                onPressed: () async {
                                 bool res = await AuthProvider().loginwithgoogle();
                                 if(!res){
                                   return "Error logging in with Google";
                                 }
                                },
                              ),
                                
                            ],
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height:20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                        Text(
                          "Don't have an account."
                          ),
                        SizedBox(width: 5.0,),
                        InkWell(
                          onTap: (){},
                          child: Text("Register",
                          style: TextStyle(
                            color: Colors.deepPurple,
                          ),),
                        )
                    ],
                  )
                  ],
                ),
          ),
        ),
        ],
      ),
    );
  }
}
