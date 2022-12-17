import 'package:firebasepractice_app/model/screens/phonenumberlogin/phone.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safetynet_attestation/safetynet_attestation.dart';
class MyOtp extends StatefulWidget {
  const MyOtp({Key? key}) : super(key: key);

  @override
  State<MyOtp> createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {
final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    var code ="";
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);

          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25,right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Phone verification',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),),
              const Text('We need to register before getting started',
                style: TextStyle(
                    fontSize: 16
                ),
                textAlign:TextAlign.center ,
              ),
              const SizedBox(
                height: 20,
              ),
            Pinput(
              length: 6,
              showCursor: true,
  onChanged: (value){
                code=value;
  },
  //             defaultPinTheme: defaultPinTheme,
  //             focusedPinTheme: focusedPinTheme,
  //             submittedPinTheme: submittedPinTheme,
  //             validator: (s) {
  //               return s == '2222' ? null : 'Pin is incorrect';
  //             },
  //             pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
  //             showCursor: true,
  //             onCompleted: (pin) => print(pin),
  ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child:  ElevatedButton(onPressed: () async {

                   try{
                     // Create a PhoneAuthCredential with the code
                     PhoneAuthCredential credential =
                     PhoneAuthProvider.credential(verificationId: MyPhone.verify,
                         smsCode: code);

                     // Sign the user in (or link) with the credential
                     await auth.signInWithCredential(credential);
                     Navigator.pushNamedAndRemoveUntil(context,"homeopt",
                             (route) => false);
                   }
                   catch(e){
print('wrong otp');
                   }

                  },
                    style: ElevatedButton.styleFrom(primary: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )), child:const Text("Verify Phone Number"),

                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                TextButton(onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(
                      context,'phone', (route) => false);
                }, child:const Text("Edit phone number ?",
                  style: TextStyle(
                    color: Colors.black,
                  ),


                ))

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
