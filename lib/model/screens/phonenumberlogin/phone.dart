import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);
static String verify= "";
  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
TextEditingController countrycode= TextEditingController();
var phone="";
@override
  void initState() {
    countrycode.text="+92";
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
body: Container(
  margin: EdgeInsets.only(left: 25,right: 25),
  alignment: Alignment.center,
  child: SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Phone verification',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),),
        Text('We need to register before getting started',
        style: TextStyle(
          fontSize: 16
        ),
        textAlign:TextAlign.center ,
        ),
       SizedBox(
         height: 20,
       ),
    Container(
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: Colors.grey),
        borderRadius: BorderRadius.circular(10)
      ),
      child:    Row(
        children: [
          SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 40,
            child: TextField(
              controller:countrycode,
decoration: InputDecoration(
  border: InputBorder.none,
  hintText: ""
),
            ),
          ),

          Text("|",style: TextStyle(
            fontSize: 33,
            color: Colors.grey
          ),),
          Expanded(

            child: TextField(
              keyboardType: TextInputType.phone,
onChanged: (value){
  phone=value;
},
              decoration: InputDecoration(
                  border: InputBorder.none,
                hintText: "Phone"
              ),
            ),
          )
        ],
      ),
    ),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: SizedBox(
           height: 45,
           width: double.infinity,
           child:  ElevatedButton(onPressed: () async{
             await FirebaseAuth.instance.verifyPhoneNumber(
               phoneNumber: '${countrycode.text + phone}',
               verificationCompleted: (PhoneAuthCredential credential) {},
               verificationFailed: (FirebaseAuthException e) {},
               codeSent: (String verificationId, int? resendToken) {
                 MyPhone.verify=verificationId;
                 Navigator.pushNamed(context, "otp");
               },
               codeAutoRetrievalTimeout: (String verificationId) {},
             );


           }, child:Text("Send the code"),
             style: ElevatedButton.styleFrom(primary: Colors.green.shade600,
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10)
                 )),

           ),
         ),
       )
      ],
    ),
  ),
),
    );
  }
}
