import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app_flutter/models/category_filter_model.dart';
import 'package:food_delivery_app_flutter/models/models.dart';
import 'package:food_delivery_app_flutter/models/price_filter_model.dart';

part 'filters_event.dart';
part 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  FiltersBloc() : super(FiltersInitial()) {
    on<FilterLoad>(_onLoadFilter);
    on<CategoryFilterUpdated>(_onUpdateCategoryFilter);
    on<PriceFilterUpdated>(_onUpdatePriceFilter);
  }

  void _onLoadFilter(
    FilterLoad event,
    Emitter<FiltersState> emit,
  ) async {
    emit(FiltersLoading());
    await Future.delayed(const Duration(seconds: 1));
    emit(
      FiltersLoaded(
        filter: Filter(
          categoryFilters: CategoryFilter.filters,
          priceFilters: PriceFilter.filters,
        ),
      ),
    );
  }

  void _onUpdateCategoryFilter(
    CategoryFilterUpdated event,
    Emitter<FiltersState> emit,
  ) async {
    final cateFilters = (state as FiltersLoaded).filter.categoryFilters;
    final priceFilter = (state as FiltersLoaded).filter.priceFilters;
    final List<CategoryFilter> updatedCategoryFilters =
        cateFilters.map((categoryFilter) {
      return categoryFilter.id == event.categoryFilter.id
          ? event.categoryFilter
          : categoryFilter;
    }).toList();

    emit(
      FiltersLoaded(
        filter: Filter(
          categoryFilters: updatedCategoryFilters,
          priceFilters: priceFilter,
        ),
      ),
    );
  }

  void _onUpdatePriceFilter(
    PriceFilterUpdated event,
    Emitter<FiltersState> emit,
  ) async {
    final cateFilters = (state as FiltersLoaded).filter.categoryFilters;
    final priceFilter = (state as FiltersLoaded).filter.priceFilters;
    final List<PriceFilter> updatePriceFilter = priceFilter.map((priceFilter) {
      return priceFilter.id == event.priceFilter.id
          ? event.priceFilter
          : priceFilter;
    }).toList();

    emit(
      FiltersLoaded(
        filter: Filter(
          categoryFilters: cateFilters,
          priceFilters: updatePriceFilter,
        ),
      ),
    );
  }
}
