import 'package:flutter/material.dart';
import 'package:flutter_espresso/core/presentation/theme/text_theme.dart';
import 'package:flutter_espresso/features/coffees/domain/entities/coffee.dart';

class CoffeeDetailsScreen extends StatelessWidget {
  const CoffeeDetailsScreen({
    super.key,
    required this.coffee,
  });
  final Coffee coffee;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Detail',
          style: AppTextStyle.title.copyWith(color: const Color(0xFF2F2D2C), fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 226,
                    width: double.maxFinite,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(image: NetworkImage(coffee.image!), fit: BoxFit.cover)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            coffee.title!,
                            style: AppTextStyle.title.copyWith(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'with Chocolate',
                            style: AppTextStyle.bodySmall.copyWith(color: const Color(0xFF9B9B9B)),
                          ),
                          const SizedBox(height: 14),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Color(0xFFFBBE21), size: 16.0),
                              const SizedBox(width: 4.0),
                              Row(
                                children: [
                                  Text(
                                    '4.5',
                                    style: AppTextStyle.bodyLarge
                                        .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '(230)',
                                    style: AppTextStyle.bodySmall.copyWith(color: const Color(0xFF808080)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFFFF0F0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/icons/coffee_bean.png',
                                width: 24,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFFFF0F0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/icons/milk.png',
                                width: 24,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Divider(),
                  ),
                  Text(
                    'Description',
                    style: AppTextStyle.bodyXLarge.copyWith(fontWeight: FontWeight.w700, color: Colors.black),
                  ),
                  const SizedBox(height: 14),
                  RichText(
                    text: TextSpan(
                        text: '${coffee.description!.substring(0, 130)}..',
                        style: AppTextStyle.bodyMedium.copyWith(color: const Color(0xFF9B9B9B)),
                        children: [
                          TextSpan(
                            text: 'Read more',
                            style: AppTextStyle.bodyMedium
                                .copyWith(color: const Color(0xFFC67C4E), fontWeight: FontWeight.w600),
                          ),
                        ]),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Size',
                    style: AppTextStyle.bodyXLarge.copyWith(fontWeight: FontWeight.w700, color: Colors.black),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1, color: const Color(0xFFDEDEDE)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                              child: Text(
                                'S',
                                style: AppTextStyle.bodyMedium.copyWith(color: const Color(0xFF2F2D2C)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: const Color(0xFFC67C4E).withOpacity(0.01),
                            border: Border.all(width: 1, color: const Color(0xFFC67C4E)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                              child: Text(
                                'M',
                                style: AppTextStyle.bodyMedium.copyWith(color: const Color(0xFFC67C4E)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1, color: const Color(0xFFDEDEDE)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                              child: Text(
                                'L',
                                style: AppTextStyle.bodyMedium.copyWith(color: const Color(0xFF2F2D2C)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, -0.3),
              ),
            ],
            color: Color(0xFFF9F9F9),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 45.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price',
                            style: AppTextStyle.bodyMedium.copyWith(
                              color: const Color(0xFF9B9B9B),
                            ),
                          ),
                          Text(
                            '\$${coffee.price!.toStringAsFixed(2)}',
                            style: AppTextStyle.bodyXLarge
                                .copyWith(color: const Color(0xFFC67C4E), fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: DecoratedBox(
                        decoration:
                            BoxDecoration(color: const Color(0xFFC67C4E), borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: Center(
                            child: Text(
                              'Buy Now',
                              style: AppTextStyle.bodyLarge.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
