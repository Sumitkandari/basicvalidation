import 'package:basicverification/pages/homepage.dart';
import 'package:basicverification/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInPage extends StatefulWidget {
  

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  moveToHome(BuildContext context) async {
    var validate = _formKey.currentState!.validate();
    print(validate);
        if(validate){
    setState(() {
      
     });
    

    await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>HomePage()), (route) => false);
      setState(() {
      
     });
    }
  }
   final _formKey = GlobalKey<FormState>();
  
 
  TextEditingController _emailcontroller=TextEditingController();
  TextEditingController _passwordcontroller=TextEditingController();
  bool circular=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        
        child: Form(
          key: _formKey,
          
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height:10),
              Image.asset("assets/undraw_secure_login_pdn4.png",
              
              height: 210,
              width: MediaQuery.of(context).size.width,
              ),
              //SizedBox(height:5),
              Text("Sign In",
              style:TextStyle(fontSize: 30,
              color:Colors.black,
              fontWeight: FontWeight.bold)
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical:16.0,horizontal: 50.0
                ),
          
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
                  Text("If you don't have an account?",style:TextStyle(color:Colors.black,fontSize:18)),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>SignUpPage()), (route) => false);
                      });
                    },
                                      child: Text(" Sign Up",style:TextStyle(
                      color:Colors.black,
                      fontSize:18,
                      fontWeight:FontWeight.bold,
                       decoration: TextDecoration.underline

                      )),
                  ),

                ],
              ),
              Text("Forgot Password" ,style:TextStyle(
                color:Colors.black,
                fontSize:18,
                fontWeight:FontWeight.bold,
                decoration: TextDecoration.underline
                
                )),

              Text("Or" ,style:TextStyle(color:Colors.black,fontSize:18)),
              buttonitem("assets/google.svg","Continue with Google"),
              SizedBox(height: 10,),
              buttonitem("assets/Facebook.svg","Continue with Facebook"),
              SizedBox(height: 15,),
             
            ],
          ),
        ),
      )
      
    );
  }

Widget buttonitem(String imagepath,String text){
  return  Container(
                width: MediaQuery.of(context).size.width-60,

                height:60,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(imagepath,height: 35,width: 25,),
                      SizedBox(width: 10,),
                      Text(text,style: TextStyle(color:Colors.black,fontSize: 20,fontWeight:FontWeight.bold),)
                       
                  

                    ],
                  ),
                ),
              );
}
Widget colorButton(){
  return Material(
                      color: Colors.blue[900],
                      borderRadius:
                          BorderRadius.circular(8),
                      child: InkWell(
                        splashColor: Colors.red,
                        onTap: ()async{
                         
                         
                            moveToHome(context);
                            _emailcontroller.clear();
                            _passwordcontroller.clear();
                        },
                        
                        child: Container(
                          
                          width: 200,
                          height: 40,
                          //color :Colors.blue[900],
                          alignment: Alignment.center,
                          child:  circular?CircularProgressIndicator():Text(
                                  "Sign In",
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