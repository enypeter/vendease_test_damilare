import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendease_text/core/app_assets.dart';
import 'package:vendease_text/core/app_colors.dart';
import 'package:vendease_text/core/consts.dart';
import '../cart_view/cart.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    SIDE_PADDING, 10, SIDE_PADDING, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: RichText(
                              text: const TextSpan(
                                  style: TextStyle(
                                      color: DARK_GREY,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                  children: [
                                TextSpan(text: 'Welcome, '),
                                TextSpan(
                                  text: 'Mhiday',
                                  style: TextStyle(color: PRIMARY_COLOR),
                                ),
                              ])),
                        ),
                        Row(
                          children: [
                            Image.asset(
                                'assets/images/ayo-ogunseinde-6W4F62sN_yI-unsplash 7.png',
                                height: 26),
                            smallHorizontalSpacing(),
                            InkWell(onTap:()=>Get.to(()=> CartsScreen()),child: Image.asset(CART, height: 24))
                          ],
                        )
                      ],
                    ),
                    tinyVerticalSpacing(),
                    const Text(
                      'What are you looking for today?',
                      style: TextStyle(color: DARK_GREY),
                    )
                  ],
                ),
              ),
              smallerVerticalSpacing(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: SIDE_PADDING),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            RichText(
                                text: const TextSpan(
                                    style: TextStyle(color: DARK_GREY, fontSize: 12),
                                    children: [
                                  TextSpan(text: 'Show: '),
                                  TextSpan(
                                    text: 'This week',
                                    style: TextStyle(color: PRIMARY_COLOR),
                                  ),
                                ])),
                            const Icon(Icons.arrow_drop_down)
                          ],
                        ),
                        const Text(
                          'View more',
                          style: TextStyle(color: PRIMARY_COLOR, fontSize: 12),
                        ),
                      ],
                    ),
                    smallerVerticalSpacing(),

                    Container(
                      height: 130,
                      decoration: BoxDecoration(
                          color: LIGHT_ORANGE, borderRadius: BorderRadius.circular(5)),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Total Orders',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)
                          ),
                          smallVerticalSpacing(),
                          const Text(
                            '200',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: DEEP_ORANGE)
                          ),
                          smallVerticalSpacing(),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              dot(WHITE),
                              dot(DEEP_ORANGE),
                              dot(WHITE),
                              dot(WHITE),
                            ],
                          ),
                        ],
                      ),
                    ),
                    mediumVerticalSpacing(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Product categories',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'See all',
                          style: TextStyle(color: PRIMARY_COLOR),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              smallVerticalSpacing(),

              SizedBox(
                  height: 150,
                  child: ListView.separated(
                      padding: const EdgeInsets.only(left: SIDE_PADDING),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (c, i) => categoryContainer(),
                      separatorBuilder: (c, i) => smallHorizontalSpacing(),
                      itemCount: 4)),
              mediumVerticalSpacing(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: SIDE_PADDING),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Recent order list',
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  smallVerticalSpacing(),
                  ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (c, i) => orderListWidget(),
                      separatorBuilder: (c, i) => smallVerticalSpacing(),
                      itemCount: 4),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container orderListWidget() {
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
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(6)),
                            color: GREEN),
                      ),
                      smallHorizontalSpacing(),
                      Expanded(
                          child: Column(
                        children: [
                          Row(
                            children: const [
                              Expanded(
                                flex: 2,
                                child: Text('P01687638GH68',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                              ),
                              Expanded(
                                child: Text('${naira}8,000',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: GREY,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ],
                          ),
                          smallerVerticalSpacing(),
                          tinyVerticalSpacing(),
                          Row(
                            children: const [
                              Expanded(
                                flex: 2,
                                child: Text('Jan 3, 2021 10:11AM',
                                    style:
                                        TextStyle(fontSize: 12, color: GREY)),
                              ),
                              Expanded(
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

  Container categoryContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      height: 146,
      width: 128,
      decoration: BoxDecoration(
          color: LIGHT_BLUE, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/drinks.png',
            height: 65,
          ),
          tinyVerticalSpacing(),
          const Text(
            'Drinks',
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }

  Widget dot(color) => Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          height: 6,
          width: 6,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
      );
}
