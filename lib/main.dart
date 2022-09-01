import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/blocs/bloc/names_bloc.dart';
import 'package:practice/blocs/productBloc/bloc/product_bloc.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NamesBloc()..add(LoadCounter())),
        BlocProvider(create: (_) => ProductBloc()..add(LoadProductEvent())),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: // NamesBlocWidget(),
          BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProductsLoaded) {
            return ListView.separated(
              itemCount: state.products.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) => ListTile(
                title: Text(state.products[index].nombre),
                trailing: SizedBox(
                  width: size.width * 0.25,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          icon: const Icon(Icons.delete), onPressed: () {}),
                      IconButton(
                          icon: const Icon(Icons.edit), onPressed: () {}),
                    ],
                  ),
                ),
              ),
            );
          }
          return Text("sí");
        },
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<NamesBloc>().add(const AddName(name: "Gilmour"));
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class NamesBlocWidget extends StatelessWidget {
  const NamesBlocWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NamesBloc, NamesState>(
      builder: (_, state) {
        if (state is NamesInitial) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.indigo,
            ),
          );
        }
        if (state is NamesLoaded) {
          return (state.names.isNotEmpty)
              ? SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.from(
                        state.names.map((e) => ListTile(title: Text(e)))),
                  ),
                )
              : const Center(child: Text("No hay nada"));
        }
        return const Text("Hola");
      },
    );
  }
}
