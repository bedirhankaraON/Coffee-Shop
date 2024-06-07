import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_espresso/core/constants/app_icons.dart';
import 'package:flutter_espresso/core/presentation/theme/text_theme.dart';
import 'package:flutter_espresso/features/coffees/domain/entities/coffee.dart';
import 'package:flutter_espresso/features/coffees/presentation/coffee_details/coffee_details_screen.dart';
import 'package:flutter_espresso/features/coffees/presentation/coffees/cubit/coffees_cubit.dart';

class CoffeesScreen extends StatelessWidget {
  const CoffeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<CoffeesCubit, CoffeesState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          switch (state.status) {
            case CoffeesStatus.initial:
            case CoffeesStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case CoffeesStatus.success:
              return SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Stack(
                  children: [
                    const BackgroundWidget(),
                    SafeArea(
                      child: Column(
                        children: [
                          const SizedBox(height: 18),
                          const HeaderWidget(),
                          const SizedBox(height: 26),
                          const SearchField(),
                          const SizedBox(height: 26),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Image.asset(
                              'assets/promo.png',
                              height: 140,
                              width: double.maxFinite,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const SizedBox(height: 26),
                          const CategoriesWidget(),
                          const CoffeeListWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            case CoffeesStatus.failure:
              return const SizedBox();
          }
        },
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 270,
          width: MediaQuery.of(context).size.width,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xFF313131),
                  Color(0xFF131313),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: const Color(0xFFF9F9F9),
      indicatorColor: Colors.transparent,
      elevation: 0,
      destinations: const [
        NavigationDestination(
          icon: AppIcon(AppIcons.home),
          label: '',
        ),
        NavigationDestination(
          icon: AppIcon(AppIcons.heart),
          label: '',
        ),
        NavigationDestination(
          icon: AppIcon(AppIcons.bag),
          label: '',
        ),
        NavigationDestination(
          icon: AppIcon(AppIcons.notification),
          label: '',
        ),
      ],
    );
  }
}

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: AppTextStyle.bodyMedium,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        'Bilzen,Tanjungbalai',
                        style: AppTextStyle.bodyLarge.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    )
                  ],
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/avatar.png',
            width: 44,
            height: 44,
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CoffeesCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        onChanged: (value) => cubit.searchCoffees(filter: value),
        style: AppTextStyle.bodyMedium,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
          hintStyle: AppTextStyle.bodyMedium.copyWith(color: const Color(0xFF989898)),
          hintText: 'Search coffee',
          fillColor: const Color(0xFF313131),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Colors.transparent)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Colors.transparent)),
          suffixIcon: SizedBox(
            height: 44,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xFFC67C4E),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: AppIcon(
                    AppIcons.furniturIcon,
                  ),
                ),
              ),
            ),
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 21, right: 12),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  TextStyle get selectedTextStyle => AppTextStyle.bodyMedium.copyWith(fontWeight: FontWeight.bold);
  TextStyle get unSelectedTextStyle => AppTextStyle.bodyMedium.copyWith(color: const Color(0xFF2F4B4E));
  Color get selectedColor => const Color(0xFFC67C4E);
  Color get unSelectedColor => const Color(0xFFF3F3F3);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeesCubit, CoffeesState>(
      builder: (context, state) {
        return SizedBox(
          height: 38,
          child: ListView(
            padding: const EdgeInsets.only(left: 30),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: state.coffees
                .map((e) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: e.id == 1 ? selectedColor : unSelectedColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                          child: Text(
                            e.title!,
                            style: e.id == 1 ? selectedTextStyle : unSelectedTextStyle,
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}

class CoffeeListWidget extends StatelessWidget {
  const CoffeeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeesCubit, CoffeesState>(
      buildWhen: (previous, current) => previous.filteredCofees != current.filteredCofees,
      builder: (context, state) {
        return GridView.builder(
          itemCount: state.filteredCofees.length,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            childAspectRatio: 0.62,
          ),
          itemBuilder: (context, index) => CoffeeCard(coffee: state.filteredCofees[index]),
        );
      },
    );
  }
}

class CoffeeCard extends StatelessWidget {
  const CoffeeCard({
    super.key,
    required this.coffee,
  });
  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CoffeeDetailsScreen(coffee: coffee)));
      },
      child: Card(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    child: Image.network(
                      coffee.image!,
                      height: 132.0,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8.0,
                  left: 8.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Color(0xFFFBBE21), size: 16.0),
                        const SizedBox(width: 4.0),
                        Text(
                          '4.5',
                          style: AppTextStyle.bodyMedium.copyWith(fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffee.title!,
                    style: AppTextStyle.bodyLarge.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Text(
                    'with Chocolate',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${coffee.price}',
                        style: AppTextStyle.bodyLarge.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFC67C4E),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
