import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app_flutter/blocs/autocomplete/autocomplete_bloc.dart';

class LocationSearchBox extends StatelessWidget {
  const LocationSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<AutocompleteBloc, AutocompleteState>(
        builder: (context, state) {
          if (state is AutocompleteLoaded) {
            return TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter a location',
                suffixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.only(left: 20, bottom: 5, right: 5),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (newValue) {
                context.read<AutocompleteBloc>().add(
                      LoadAutocomplete(searchInput: newValue),
                    );
              },
            );
          }
          return TextField(
            controller: _controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Enter a location',
              suffixIcon: const Icon(Icons.search),
              contentPadding: const EdgeInsets.only(left: 20, bottom: 5, right: 5),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: (newValue) {},
          );
        },
      ),
    );
  }
}
