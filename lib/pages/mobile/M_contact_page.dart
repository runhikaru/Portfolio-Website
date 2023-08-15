import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../utils.dart';

class MobileContactPage extends StatefulWidget {
  const MobileContactPage({super.key});

  @override
  State<MobileContactPage> createState() => _MobileContactPageState();
}

class _MobileContactPageState extends State<MobileContactPage> {
  //* コンタクト
  late final nameCont = TextEditingController();
  late final emailCont = TextEditingController();
  final messageCont = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final namefocus = FocusNode();
  final agefocus = FocusNode();

  final String resetText = "";

  void resetContact() {
    nameCont.text = resetText;
    emailCont.text = resetText;
    messageCont.text = resetText;
  }

  @override
  Widget build(BuildContext context) {
    double? deviceWidth;
    deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white60,
            elevation: 12,
            title: const Text(
              "Mizuno Hikaru",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 27,
                  color: Colors.black),
            ),
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black),
            leading: BackButton(
            ),
            actions: [  GestureDetector(
                onTap: () {
                  GithubURL();
                },
                child: Image.asset('assets/app/github_icon.png')),
          
              GestureDetector(
                  onTap: () {
                    storeAppleURL();
                  },
                  child: Image.asset('assets/app/apple_store_icon.png')),
              GestureDetector(
                  onTap: () {
                    storeAndroidURL();
                  },
                  child: Image.asset('assets/app/play_storeicon.png')),
            ],
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: deviceWidth * 0.05,
                        ),
                        const Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: [
                            Text(
                              "Contact",
                              style: TextStyle(
                                  fontSize: 57,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(43, 235, 192, 255)),
                            ),
                            Text(
                              "Contact",
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 86, 86, 86)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  // MContactPage(deviceWidth),

                  // Mail
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceWidth * 0.05, vertical: 10),
                    child: buildTextField(
                        title: 'お名前',
                        controller: nameCont,
                        hint: '山田太郎　または　会社名'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceWidth * 0.05, vertical: 10),
                    child: emailTextField(
                        title: 'メールアドレス',
                        controller: emailCont,
                        hint: 'example@mail.com'),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(
                  //       horizontal: deviceWidth * 0.05, vertical: 10),
                  //   child: buildTextField(
                  //       title: '件名', controller: subjectCont, hint: 'アプリ開発の依頼'),
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceWidth * 0.05, vertical: 10),
                    child: contentTextField(
                        title: '内容', controller: messageCont, hint: ''),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: deviceWidth * 0.3, vertical: 20),
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              sendEmail(
                                  name: nameCont.text,
                                  email: emailCont.text,
                                  message: messageCont.text);
                            });
                            // showSnackBar();
                            resetContact();
                          }
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: 48,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              gradient: const LinearGradient(colors: [
                                Color.fromARGB(255, 235, 192, 255),
                                Color.fromARGB(255, 210, 114, 255),
                              ]),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 235, 192, 255)
                                        .withOpacity(.6),
                                    spreadRadius: 1,
                                    blurRadius: 16,
                                    offset: const Offset(8, 8))
                              ]),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "送信",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ));
  }

  //* コンタクト
  Future sendEmail(
      {required String name,
      required String email,
      required String message}) async {
    const serviceId = 'service_1cwqwpt';
    const tempateId = 'template_1i08wn1';
    const userId = 'user_QJq7e6a5biy5mQMKpkqSs';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': tempateId,
          'user_id': userId,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'to_email': 'mizuno.hikaru.01@gmail.com',
            'user_subject': "俺のウェブサイトから...",
            'user_message': message
          }
        }));
  }

  Widget buildTextField(
          {required String title,
          required String hint,
          required TextEditingController controller,
          int maxLines = 1}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(children: [
            const TextSpan(text: "必須   ", style: TextStyle(color: Colors.red)),
            TextSpan(
              text: title,
              style: const TextStyle(
                  color: Color.fromARGB(255, 96, 96, 96),
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ])),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            autofocus: true,
            validator: (value) {
              if (value!.isEmpty) {
                return '入力してください';
              }
              return null;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey),
              errorStyle: const TextStyle(
                  color: Color.fromARGB(255, 250, 88, 76), fontSize: 13),
            ),
            controller: controller,
            enabled: true,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.name],
          ),
        ],
      );

  Widget emailTextField(
          {required String title,
          required String hint,
          required TextEditingController controller,
          int maxLines = 1}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(children: [
            const TextSpan(text: "必須   ", style: TextStyle(color: Colors.red)),
            TextSpan(
              text: title,
              style: const TextStyle(
                  color: Color.fromARGB(255, 96, 96, 96),
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ])),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
              hintText: 'example@mail.com',
              hintStyle: const TextStyle(color: Colors.grey),
              errorStyle: const TextStyle(
                  color: Color.fromARGB(255, 250, 88, 76), fontSize: 13),
            ),
            validator: (value) {
              const pattern =
                  r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
              final regExp = RegExp(pattern);

              if (value!.isEmpty) {
                return '入力してください';
              } else if (!regExp.hasMatch(value)) {
                return '無効なメールアドレスです';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.email],
          )
        ],
      );

  Widget contentTextField(
          {required String title,
          required String hint,
          required TextEditingController controller,
          int maxLines = 5}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(children: [
            const TextSpan(text: "必須   ", style: TextStyle(color: Colors.red)),
            TextSpan(
              text: title,
              style: const TextStyle(
                  color: Color.fromARGB(255, 96, 96, 96),
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ])),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
              controller: controller,
              maxLines: maxLines,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                hintText: '〇月〇日〇時にお話しできる。\n⬜️のようなアプリ',
                hintStyle: const TextStyle(color: Colors.grey),
                errorStyle: const TextStyle(
                    color: Color.fromARGB(255, 250, 88, 76), fontSize: 13),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return '入力してください';
                }
                return null;
              },
              textInputAction: TextInputAction.done)
        ],
      );
}
