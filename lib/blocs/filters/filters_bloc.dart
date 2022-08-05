import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/models.dart';

part 'filters_event.dart';

part 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  FiltersBloc() : super(FiltersLoading()) {
    on<LoadFilter>(_onLoadFilter);
    on<UpdateCategoryFilter>(_onUpdateCategoryFilter);
    on<UpdatePriceFilter>(_onUpdatePriceFilter);
  }

  FutureOr<void> _onLoadFilter(LoadFilter event, Emitter<FiltersState> emit) {
    emit(
      FiltersLoaded(
        filter: Filter(
          categoryFilters: CategoryFilter.filters,
          priceFilters: PriceFilter.filters,
        ),
      ),
    );
  }

  FutureOr<void> _onUpdateCategoryFilter(
      UpdateCategoryFilter event, Emitter<FiltersState> emit) {
    final state = this.state;
    if (state is FiltersLoaded) {
      final List<CategoryFilter> updateCategoryFilters =
          state.filter.categoryFilters.map((categoryFilter) {
        return categoryFilter.id == event.categoryFilter.id
            ? event.categoryFilter
            : categoryFilter;
      }).toList();
      emit(
        FiltersLoaded(
          filter: Filter(
            categoryFilters: updateCategoryFilters,
            priceFilters: state.filter.priceFilters,
          ),
        ),
      );
    }
  }

  FutureOr<void> _onUpdatePriceFilter(
      UpdatePriceFilter event, Emitter<FiltersState> emit) {
    final state = this.state;
    if (state is FiltersLoaded) {
      final List<PriceFilter> updatePriceFilters =
          state.filter.priceFilters.map((priceFilter) {
        return priceFilter.id == event.priceFilter.id
            ? event.priceFilter
            : priceFilter;
      }).toList();

      emit(
        FiltersLoaded(
          filter: Filter(
            categoryFilters: state.filter.categoryFilters,
            priceFilters: updatePriceFilters,
          ),
        ),
      );
    }
  }
}
