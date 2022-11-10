import 'package:cubit_flutter/cubit_internet.dart';
import 'package:cubit_flutter/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state is InternetStateActive) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Internet Connected"),
                  backgroundColor: Colors.green,
                ));
              } else if (state is InternetStateInactive) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Internet Unavailable"),backgroundColor: Colors.red,));
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("Loading...")));
              }
            },
            builder: (context, state) {
              if (state is InternetStateActive) {
               return Text("Connected to Internet");
              } else if (state is InternetStateInactive) {
                return Text("Internet Unavailable");
              }
              else{
              return Text("Loading...");
              }



            },
          ),
        ),
      ),
    );
  }
}
