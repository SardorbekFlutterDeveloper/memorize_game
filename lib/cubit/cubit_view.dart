import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorize_game/cubit/cubit_game.dart';
import 'package:memorize_game/cubit/cubit_state.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MemorizeCubit(),
      child: BlocConsumer<MemorizeCubit, MemorizeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return myScaffold(context);
        },
      ),
    );
  }

  Scaffold myScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Memorize Game",
          style: TextStyle(fontSize: 30, color: Colors.green),
        ),
      ),
      backgroundColor: Colors.greenAccent,
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(10.0),
            child: InkWell(
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.green,
                child: context.watch<MemorizeCubit>().isVisible
                    ? Text(
                        context
                            .watch<MemorizeCubit>()
                            .randoms[index]
                            .toString(),
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )
                    : const Text(""),
              ),
              onTap: () {
                context.read<MemorizeCubit>().ochir(index);
              },
            ),
          );
        },
        itemCount: context.watch<MemorizeCubit>().randoms.length,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: FloatingActionButton(
              
              onPressed: () {
                context.read<MemorizeCubit>().makeRandom();
              },
              child: Icon(Icons.reviews),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<MemorizeCubit>().showRandoms();
            },
            child: Icon(Icons.open_in_browser),
          ),
        ],
      ),
    );
  }
}
