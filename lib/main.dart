import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/cubit/api_cubit.dart';

import 'package:homework/cubit/api_state.dart';
import 'package:homework/loading_widget.dart';
// مجد كيخيا - صبا يوسف -  سدرة دياب
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ApiCubit>(
        create: (context) => ApiCubit(),
        child: const Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<Home> {
  late ApiCubit apiCubit;

  @override
  void initState() {
    super.initState();
    apiCubit = context.read<ApiCubit>();
    apiCubit.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ApiCubit, ApiState>(
        builder: (context, state) {
          if (state is ApiInitial) {
            return const LoadingWidget();
          } else if (state is ApiLoading) {
            return const LoadingWidget();
          } else if (state is ApiLoaded) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.data[index]['title']),
                  subtitle: Text(state.data[index]['body'].substring(0, 50)),
                );
              },
            );
          } else if (state is ApiError) {
            return ErrorWidget(state.message);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
