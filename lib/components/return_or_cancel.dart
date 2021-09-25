import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';
import 'package:socialbennett/components/querysuccess.dart';
import 'package:socialbennett/services/order_services.dart';
import 'package:socialbennett/services/product_services.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../constants.dart';
import '../size_config.dart';
import 'default_button.dart';

class ReturnCancel extends StatefulWidget {
  final String formname;
  final String orderId;
  ReturnCancel({@required this.formname, @required this.orderId});
  @override
  _ReturnCancelState createState() => _ReturnCancelState();
}

class _ReturnCancelState extends State<ReturnCancel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.02), // 4%
                  Text(widget.formname, style: headingStyle),
                  Text(
                    "Please tell us why",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  ReturnCancelForm(
                    formname: widget.formname,
                    orderId: widget.orderId,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  Text(
                    'By continuing your confirm that you agree \nwith our Term and Condition',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ReturnCancelForm extends StatefulWidget {
  final String formname;
  final String orderId;
  ReturnCancelForm({@required this.formname, @required this.orderId});
  @override
  _ReturnCancelFormState createState() => _ReturnCancelFormState();
}

class _ReturnCancelFormState extends State<ReturnCancelForm>
    with ChangeNotifier {
  List<String> Returnkeys = <String>[
    'Quality',
    'Delivery',
    'Payments & Pricing',
    'Other'
  ];
  List<String> Cancelkeys = <String>[
    'Quality',
    'Delivery',
    'Payments & Pricing',
    'Other'
  ];

  final _formKey = GlobalKey<FormState>();
  @override
  String message = "";

  String selectedKey;

  @override
  void initState() {
    selectedKey = widget.formname == "Return Form"
        ? "Reason for Return/Replacment"
        : "Reason for Cancel";
    super.initState();
  }

  Widget build(BuildContext context) {
    final Widget normalChildButton = Container(
      height: getProportionateScreenHeight(getProportionateScreenHeight(90)),
      child: Padding(
        padding: EdgeInsets.only(
            top: getProportionateScreenHeight(20),
            bottom: getProportionateScreenHeight(20),
            left: getProportionateScreenWidth(40),
            right: getProportionateScreenWidth(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
                child: Text(selectedKey,
                    style: TextStyle(fontSize: getProportionateScreenWidth(13)),
                    overflow: TextOverflow.ellipsis)),
            FittedBox(
              fit: BoxFit.fill,
              child: Icon(
                Icons.arrow_drop_down,
                // color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );

    changeOrderStatus() {
      OrderServices _services = new OrderServices();
      var values = {
        "orderStatus":
            widget.formname == "Return Form" ? "Returning" : "Canceled"
      };
      _services.updateOrder(values, widget.orderId);
    }

    final RoundedLoadingButtonController _btnController =
        RoundedLoadingButtonController();

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            MenuButton<String>(
              // itemBackgroundColor: Colors.transparent,
              menuButtonBackgroundColor: Colors.transparent,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: kTextColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(28))),
              child: normalChildButton,
              items: widget.formname == "Return Form" ? Returnkeys : Cancelkeys,
              itemBuilder: (String value) => Container(
                height: getProportionateScreenHeight(
                    getProportionateScreenHeight(90)),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(20),
                    horizontal: getProportionateScreenWidth(40)),
                child: Text(value,
                    style: TextStyle(fontSize: getProportionateScreenWidth(13)),
                    overflow: TextOverflow.ellipsis),
              ),
              toggledChild: Container(
                child: normalChildButton,
              ),
              onItemSelected: (String value) {
                setState(() {
                  selectedKey = value;
                });
              },
              onMenuButtonToggle: (bool isToggle) {
                print(isToggle);
              },
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            MessageFormField(),
            SizedBox(height: getProportionateScreenHeight(40)),
            RoundedLoadingButton(
              successColor: kPrimaryColor,
              duration: Duration(milliseconds: 1300),
              width: getProportionateScreenWidth(500),
              height: getProportionateScreenHeight(56),
              color: kPrimaryColor2,
              child: Text("Continue",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      color: Colors.white)),
              controller: _btnController,
              onPressed: () {
                changeOrderStatus();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuerySuccess(
                            queryname: widget.formname == "Return Form"
                                ? "Return"
                                : "Cancel",
                          )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  TextFormField MessageFormField() {
    return TextFormField(
      maxLines: 5,
      onChanged: (value) {
        message = value;
      },
      decoration: InputDecoration(
        labelText: widget.formname == "Return Form"
            ? "Return/Replacement Message"
            : "Cancellation Message",
        hintText: "Please enter your message ... ",
        hintStyle: TextStyle(fontSize: getProportionateScreenWidth(13)),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
