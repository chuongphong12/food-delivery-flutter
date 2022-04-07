import 'package:flutter/material.dart';

class PromoBox extends StatelessWidget {
  const PromoBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).primaryColor,
            image: const DecorationImage(
              image: NetworkImage(
                  'https://images.pexels.com/photos/140134/pexels-photo-140134.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 125),
          margin: const EdgeInsets.only(right: 5),
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FREE DELIVERY on your first 3 orders',
                style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Place an order of \$10 or more and the delivery fee is waived',
                style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
