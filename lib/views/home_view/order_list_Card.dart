import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/consts.dart';


class OrderListCard extends StatelessWidget {
  const OrderListCard({Key? key,required this.color,required this.ref,required this.amount,required this.date}) : super(key: key);
  final Color color;
  final String ref;
  final String amount;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: WHITE,
          boxShadow: <BoxShadow>[
            BoxShadow(
                offset: const Offset(0.2, 0.2),
                blurRadius: 1,
                spreadRadius: 2,
                color: LIGHT_GREY.withOpacity(0.1)),
            BoxShadow(
                offset: const Offset(-0.2, -0.2),
                blurRadius: 1,
                spreadRadius: 2,
                color: LIGHT_GREY.withOpacity(0.1))
          ],
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 80,
            decoration:  BoxDecoration(
                borderRadius:const BorderRadius.horizontal(
                    left: Radius.circular(6)),
                color: color),
          ),
          smallHorizontalSpacing(),
          Expanded(
              child: Column(
                children: [
                  Row(
                    children:  [
                      Expanded(
                        flex: 2,
                        child: Text(ref,
                            style:const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      ),
                      Expanded(
                        child: Text('$naira$amount',
                            textAlign: TextAlign.end,
                            style:const TextStyle(
                                fontSize: 13,
                                color: GREY,
                                fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                  smallerVerticalSpacing(),
                  tinyVerticalSpacing(),
                  Row(
                    children:  [
                      Expanded(
                        flex: 2,
                        child: Text(date,
                            style:
                            const TextStyle(fontSize: 12, color: GREY)),
                      ),
                      const Expanded(
                        child: Text('2 days ago',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 12, color: PRIMARY_COLOR)),
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );

  }
}


