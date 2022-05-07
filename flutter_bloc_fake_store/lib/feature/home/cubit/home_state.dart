// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState(
      {this.items,
      this.isLoading,
      this.categories,
      this.isInitial = false,
      this.pageNumber,
      this.selectItems,
      this.isUpdated});

  final List<ProductModel>? items;
  final List<ProductModel>? selectItems;
  final bool? isLoading;
  final List<String>? categories;
  final bool? isUpdated;

  final bool isInitial;
  final int? pageNumber;

  @override
  List<Object?> get props => [items, isLoading, categories, pageNumber, selectItems, isUpdated];

  HomeState copyWith({
    List<ProductModel>? items,
    List<ProductModel>? selectItems,
    bool? isUpdated,
    bool? isLoading,
    List<String>? categories,
    int? pageNumber,
  }) {
    return HomeState(
      items: items ?? this.items,
      isUpdated: isUpdated ?? this.isUpdated,
      selectItems: selectItems ?? this.selectItems,
      isLoading: isLoading ?? this.isLoading,
      categories: categories ?? this.categories,
      pageNumber: pageNumber ?? this.pageNumber,
    );
  }
}
