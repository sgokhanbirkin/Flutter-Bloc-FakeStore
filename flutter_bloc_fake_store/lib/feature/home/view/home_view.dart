import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_fake_store/feature/home/cubit/home_cubit.dart';
import 'package:flutter_bloc_fake_store/feature/home/service/home_service.dart';
import 'package:flutter_bloc_fake_store/product/widgets/loading_center_widget.dart';
import 'package:flutter_bloc_fake_store/product/widgets/product_card.dart';
import 'package:flutter_bloc_fake_store/product/widgets/product_dropdown_widget.dart';
import 'package:kartal/kartal.dart';

import '../../../product/constant/application_constants.dart';
import '../../../product/network/product_network_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _scrollController = ScrollController();

  void _listenScroll(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        context.read<HomeCubit>().fetchNewItems();
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeService(ProductNetworkManager())),
      child: Scaffold(
        appBar: AppBar(
          title: _dropdownProject(),
          centerTitle: false,
          actions: [
            _loadingCenter(),
          ],
        ),
        body: _bodyListView(),
      ),
    );
  }

  Widget _dropdownProject() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ProductDropDown(
          items: state.categories ?? [],
          onSelected: (String data) {
            context.read<HomeCubit>().selecetedCategory(data);
          },
        );
      },
    );
  }

  Widget _bodyListView() {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.isInitial) {
          _listenScroll(context);
        }
      },
      builder: (context, state) {
        return ListView.builder(
            controller: _scrollController,
            itemCount: state.selectItems?.length ?? kZero.toInt(),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  ProductCard(model: state.items?.elementAt(index)),
                  state.selectItems.isNotNullOrEmpty && index == state.selectItems!.length - 1
                      ? const LoadingCenter()
                      : const SizedBox.shrink(),
                  _dummyPlus(context, index, state),
                ],
              );
            });
      },
    );
  }

  TextButton _dummyPlus(BuildContext context, int index, HomeState state) {
    return TextButton(
        onPressed: () {
          context.read<HomeCubit>().updateList(index, state.selectItems?[index]);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${state.selectItems?[index].price ?? kZero}'),
            const Icon(Icons.add),
          ],
        ));
  }

  Widget _loadingCenter() {
    return BlocSelector<HomeCubit, HomeState, bool>(
      selector: (state) {
        return state.isLoading ?? false;
      },
      builder: (context, state) {
        return AnimatedOpacity(
          duration: context.durationLow,
          opacity: state ? kOne : kZero,
          child: const LoadingCenter(),
        );
      },
    );
  }
}
