import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app_flutter/blocs/filters/filters_bloc.dart';

class CustomCategoryFilter extends StatelessWidget {
  const CustomCategoryFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(
      builder: (context, state) {
        if (state is FilterLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FiltersLoaded) {
          final cateFilter = state.filter.categoryFilters;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: cateFilter.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cateFilter[index].category.name,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 5,
                      child: Checkbox(
                        value: cateFilter[index].value,
                        activeColor: Theme.of(context).colorScheme.secondary,
                        onChanged: (bool? newValue) {
                          context.read<FiltersBloc>().add(
                                CategoryFilterUpdated(
                                  categoryFilter: cateFilter[index].copyWith(
                                      value: !cateFilter[index].value),
                                ),
                              );
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          );
        } else {
          return const Text('Some thing went wrong');
        }
      },
    );
  }
}
