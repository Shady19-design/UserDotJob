import 'package:flutter/material.dart';

import '../globals.dart';
import '../back_button.dart';

class PersonalDetailsPage extends StatefulWidget {
  const PersonalDetailsPage({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsPage> createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  Color myColor = const Color(0xFF139487);
  var myTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: const Color(0xFF139487).withOpacity(0.8),
  );

  final GlobalKey<FormState> personalDetailsFormKey = GlobalKey<FormState>();

  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();

  bool? maritalStatues;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        leading: backButton(context),
        backgroundColor: const Color(0xFF139487),
        title: const Text("Personal Details"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 18,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color(0xffEDEDED),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(30),
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20, top: 30),
                      child: Form(
                        key: personalDetailsFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("DOB", style: myTextStyle),
                            SizedBox(height: height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter your Date of Birth First...";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.dateOfBirth = val;
                                });
                              },
                              keyboardType: TextInputType.datetime,
                              controller: dateOfBirthController,
                              decoration: const InputDecoration(
                                hintText: "DD/MM/YYYY",
                                alignLabelWithHint: true,
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: height * 0.015),
                            Text("Marital Status", style: myTextStyle),
                            RadioListTile(
                              title: const Text("Single"),
                              value: "Single",
                              contentPadding: const EdgeInsets.all(0),
                              groupValue: Global.maritalStatus,
                              onChanged: (val) {
                                setState(() {
                                  Global.maritalStatus = val.toString();
                                });
                              },
                            ),
                            RadioListTile(
                              title: const Text("Married"),
                              value: "Married",
                              contentPadding: const EdgeInsets.all(0),
                              groupValue: Global.maritalStatus,
                              onChanged: (val) {
                                setState(() {
                                  Global.maritalStatus = val.toString();
                                });
                              },
                            ),
                            Text("Languages Known", style: myTextStyle),
                            SizedBox(height: height * 0.01),
                            //Check Box
                            Row(
                              children: [
                                Checkbox(
                                    value: Global.englishCheckBox,
                                    onChanged: (val) {
                                      setState(() {
                                        Global.englishCheckBox = val!;
                                      });
                                    }),
                                const SizedBox(width: 10),
                                const Text("English")
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: Global.hindiCheckBox,
                                    onChanged: (val) {
                                      setState(() {
                                        Global.hindiCheckBox = val!;
                                      });
                                    }),
                                const SizedBox(width: 10),
                                const Text("German")
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                    value: Global.gujratiCheckBox,
                                    onChanged: (val) {
                                      setState(() {
                                        Global.gujratiCheckBox = val!;
                                      });
                                    }),
                                const SizedBox(width: 10),
                                const Text("Franch"),
                              ],
                            ),
                            SizedBox(height: height * 0.015),
                            Text("Nationality", style: myTextStyle),
                            SizedBox(height: height * 0.015),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "Enter your Nationality First...";
                                }
                                return null;
                              },
                              onSaved: (val) {
                                setState(() {
                                  Global.nationality = val;
                                });
                              },
                              controller: nationalityController,
                              decoration: const InputDecoration(
                                hintText: "Egyption",
                                alignLabelWithHint: true,
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (personalDetailsFormKey.currentState!
                                .validate()) {
                              personalDetailsFormKey.currentState!.save();
                              setState(() => Navigator.of(context).pop());
                            }
                            print("${Global.englishCheckBox}");
                            print("${Global.hindiCheckBox}");
                            print("${Global.gujratiCheckBox}");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: myColor,
                          ),
                          child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            personalDetailsFormKey.currentState!.reset();

                            dateOfBirthController.clear();
                            nationalityController.clear();
                            setState(() {
                              Global.dateOfBirth = null;
                              Global.maritalStatus = null;
                              Global.nationality = null;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: myColor,
                          ),
                          child: const Text(
                            "Clear",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
