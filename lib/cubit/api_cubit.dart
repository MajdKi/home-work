import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:homework/cubit/api_state.dart';
import 'package:http/http.dart' as http;

// ريم مليكة - بتول بوسف - رهام سليمان

class ApiCubit extends Cubit<ApiState> {
  ApiCubit() : super(ApiInitial());

  Future<void> fetchData() async {
    emit(ApiLoading());
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        emit(ApiLoaded(data: json.decode(response.body)));
      } else {
        print(11);

        emit(ApiError(message: "error"));
      }
    } catch (_) {
      print(1);
      emit(ApiError(message: "error"));
    }
  }
}
