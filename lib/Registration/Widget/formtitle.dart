import 'package:flutter/material.dart';
import 'package:helioz/common/widgets/text_style.dart';

class FormTitle extends StatelessWidget {
  final String formtitle;
   FormTitle({
    Key? key, required this.formtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Text(
       formtitle,
        style: heading,
      ),
    );
  }
}
//"Name of Beneficiary/Recipient/Customer:"