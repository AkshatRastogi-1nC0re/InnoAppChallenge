import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_choices/search_choices.dart';
import 'package:socialbennett/components/default_button.dart';
import 'package:socialbennett/components/form_error.dart';
import 'package:socialbennett/screens/home/home_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'city_and_states.dart';

class AddressForm extends StatefulWidget {
  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> with ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  String password;
  String conform_password;
  bool remember = false;
  String phone;
  String Name;
  List<String> errors = [];
  List<int> selectedItemsMultiDialog = [];
  final FirebaseAuth auth = FirebaseAuth.instance;
  String selectedValueSingleDialog = "";
  String selected_batch = "";
  String selected_interest = "";
  String user_key;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(30)),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(20),
                horizontal: getProportionateScreenWidth(13)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Color(0xff565656),
              ),
            ),
            child: SearchChoices.single(
              onClear: () {
                setState(() {
                  selected_batch = "";
                });
              },
              underline: NotGiven(),
              selectedValueWidgetFn: (item) {
                return Container(
                    transform: Matrix4.translationValues(-10, 0, 0),
                    alignment: Alignment.centerLeft,
                    child: (Text(item.toString())));
              },
              items: batch(),
              value: selected_batch,
              hint: "Search for your Batch",
              padding: 30,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selected_batch = value;
                  });
                }
              },
              isExpanded: true,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Container(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(20),
                  horizontal: getProportionateScreenWidth(13)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Color(0xff565656),
                ),
              ),
              child: SearchChoices.multiple(
                underline: NotGiven(),
                items: interest(),
                selectedItems: selectedItemsMultiDialog,
                hint: Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(18)),
                  child: Text("Select any Interest"),
                ),
                searchHint: "Select any Interest",
                onChanged: (value) {
                  setState(() {
                    selectedItemsMultiDialog = value;
                  });
                },
                closeButton: (selectedItems) {},
                isExpanded: true,
              )),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            color: Color(0xff212544),
            press: () async {
              errors = [];
              if (_formKey.currentState.validate() &&
                  selected_batch != "" &&
                  selectedItemsMultiDialog.isNotEmpty) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
