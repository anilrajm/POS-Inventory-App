import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:quircks_task/productData.dart';
import 'home.dart';



class Login extends StatelessWidget {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) { Provider.of<ProductData>(context, listen: false).getProducts();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
    width: double.infinity,
    height: double.infinity,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
      Color(0xff03a9f4),
      Color(0xff4caf50),
      Color(0xff9c27b0)
    ], begin: Alignment.bottomLeft, end: FractionalOffset.topRight)),
    child: Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.play_arrow_outlined,
              color: Colors.red,
              size: 50,
            ),
            Text(
              "Code",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Flaare",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontStyle: FontStyle.italic,
                  fontSize: 25),
            )
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.7,
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade900,
                    offset: Offset(1, 2),
                    blurRadius: 3,
                    spreadRadius: 1)
              ]),
          child: Form(
            key: _form, //assigning key to form
            child: ListView(
              children: <Widget>[Center(child: Text("Login",style: TextStyle(fontSize: 40),)),
                SizedBox(height: 50,),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: userName,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone_android),
                      labelText: 'Phone number',
                    ),
                    validator: (userName) {
                      if (!(userName == "admin")) {
                        return "Enter a valid email address!";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    obscureText: true,
                    controller: password,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      helperText:
                          "                                                                                                         Forgot Password ?",
                      labelText: 'Password',
                    ),
                    validator: (password) {
                      if (!(password == "admin")) {
                        return "Entered password is wrong";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: ElevatedButton(
                      child: Text('Sign in'),
                      onPressed: () {
                        final isValid = _form.currentState!.validate();
                        if (isValid) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home()));
                        } else {
                          Fluttertoast.showToast(
                              msg: "Username / Password is Incorrect",
                              gravity: ToastGravity.BOTTOM,
                              fontSize: 16.0);
                        }
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: ElevatedButton(
                      child: Text('Register'),
                      onPressed: () {
                        final isValid = _form.currentState!.validate();
                        if (isValid) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home()));
                        } else {
                          Fluttertoast.showToast(
                              msg: "Username / Password is Incorrect",
                              gravity: ToastGravity.BOTTOM,
                              fontSize: 16.0);
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "www.codeflaare.com",
          style: TextStyle(color: Colors.white),
        )
      ],
    ),
      ),
    );
  }
}
