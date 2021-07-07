import 'package:basicverification/pages/homepage.dart';
import 'package:basicverification/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class SignUpPage extends StatefulWidget {
  

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
   TextEditingController _emailcontroller=TextEditingController();
  TextEditingController _passwordcontroller=TextEditingController();
  bool circular =false;
  moveToLogin(BuildContext context) async {
    var validate = _formKey.currentState!.validate();
    print(validate);
        if(validate){
    setState(() {
      
     });
    

    await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>SignInPage()), (route) => false);
      setState(() {
      
     });
    }
  }
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Form(
          key: _formKey,
                  child: Container(
            //height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/login.png",
                
                height: 210,
                width: MediaQuery.of(context).size.width,
                ),
                //SizedBox(height:5),
                Text("Sign Up",
                style:TextStyle(fontSize: 30,
                color:Colors.black,
                fontWeight: FontWeight.bold)
                ),
                Container(
                  width: MediaQuery.of(context).size.width-70,

                
                  child:Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _emailcontroller,
                        
                        decoration: InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                        ),
                        validator: (value) {
                        if(value!.isEmpty){
                          return "Username cannot be empty" ;
                        }
                        return null;
                      },
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: _passwordcontroller,
                  
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                          validator: (value){
                        if(value!.isEmpty){
                          return "Password cannot be empty";
                        }
                        else if(value.length<6){
                          return "Password length must be Greater  than 6";
                        }
                        return null;
                      },
                ),
                SizedBox(height: 10,),
                TextFormField(
                 
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                  
                       
                        decoration: InputDecoration(
                          
                          hintText: "Enter Phone nmuber",
                          labelText: "Mobile no.",
                          
                        ),
                          validator: (value){
                        if(value!.isEmpty){
                          return "Number cannot be empty";
                        }
                        else if(value.length<10){
                          return "Please enter valid number";
                        }
                        return null;
                      },
                ),
                    ],
                  )
                ),
                SizedBox(
                  height:15,
                ),
                colorButton(),
                SizedBox(
                  height:15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("If you already have an account?",style:TextStyle(color:Colors.black,fontSize:18)),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>SignInPage()), (route) => false);
                        });
                      },
                      child: Text(" Login",style:TextStyle(color:Colors.black,fontSize:18,fontWeight:FontWeight.bold))),

                  ],
                ),
               
               
               
               
                             
              ],
            ),
          ),
        ),
      )
      
    );
  }
Widget colorButton(){
  return Material(
                      color: Colors.blue[900],
                      borderRadius:
                          BorderRadius.circular(8),
                      child: InkWell(
                        splashColor: Colors.red,
                        onTap: (){
                            moveToLogin(context);

                          
                         
                        },
                        child: Container(
                          
                          width: 200,
                          height: 40,
                          //color :Colors.blue[900],
                          alignment: Alignment.center,
                          child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                        ),
                      ),
                    );

    }
}