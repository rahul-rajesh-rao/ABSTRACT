import 'package:abstract_mp/packages/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';



class SignIn extends StatefulWidget {



  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#012A4A"),
        appBar: AppBar(
          backgroundColor:HexColor("#012A4A"),
          elevation: 0,
        ),

        body:Form(
            key:_formKey,
            child:Container(
                margin:EdgeInsets.symmetric(horizontal:25.0,),
                child:Column(
                  children: [
                    SizedBox(height:230,),
                    new TextFormField(

                      validator:(val){return val.isEmpty ? "Enter the Email": null; },
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(15.0),),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5),
                        hintText: "Email",
                        fillColor: Color(0xF5F1F1).withOpacity(0.4),
                      ),
                      onChanged: (val){email=val;},     ),
                    SizedBox(height: 7,),
                    new TextFormField(

                      validator:(val){return val.isEmpty ? "Enter the Password": null; },
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(15.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5),
                        hintText: "Password",
                        fillColor: Color(0xF5F1F1).withOpacity(0.4),),
                      onChanged: (val){password=val;},),
                    SizedBox(height:3 ,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 205, 5),
                      child: TextButton(onPressed: (){}, child: Text("Forgot Password",
                        style: TextStyle(color:Colors.white,fontSize:18,fontWeight: FontWeight.bold,),
                      ),
                      ),
                    ),
                    SizedBox(height:140),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text("Dont have an account?",style: TextStyle(color: Colors.grey,fontSize: 18,),),
                        ),
                        TextButton(onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignUp()));
                        }, child: Text("Sign Up",
                          style: TextStyle(color:Colors.white,fontSize:18,fontWeight: FontWeight.bold,),
                        ))
                      ],
                    ),
                    SizedBox(height:2),
                    MaterialButton(
                      height: 58,
                      minWidth: 370,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30)),
                      onPressed: () { },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      color: Colors.white,)],)
            )
        )
    );


  }


}


