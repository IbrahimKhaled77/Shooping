import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Layout/cubit/cubit.dart';
import 'package:shopping/Layout/cubit/state.dart';
import 'package:shopping/model/search/search.dart';


class LayoutHome extends StatelessWidget {
  const LayoutHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit,LayoutStates>(
      listener: (context,state){},
      builder: (context,state){
      var  cubit=LayoutCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            title: const Text('salle'),
            titleSpacing: 0.0,
            actions: [
              IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
              },
              icon: Icon(Icons.search),
          ),
            ],
          ),
          body:cubit.screen[cubit.count] ,
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.items,
            currentIndex: cubit.count,
            onTap: (int index){
              cubit.changeNavigationBottom(index);
            },
          ),
        );
      },

    );
  }
}
