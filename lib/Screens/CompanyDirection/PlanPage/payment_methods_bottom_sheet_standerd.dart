import 'package:flutter/material.dart';
import 'package:untitled1/Screens/CompanyDirection/PlanPage/payment_methods_list_view_standard.dart';

class PaymentMethodsBottomSheetStandard extends StatelessWidget {
  const PaymentMethodsBottomSheetStandard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16,
          ),
          PaymentMethodsListViewStandard(),
        ],
      ),
    );
  }
}
