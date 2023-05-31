import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Layout/cubit/cubit.dart';
import 'package:shopping/Layout/cubit/state.dart';
import 'package:shopping/models/models_Gategories.dart';

class Cateogries extends StatelessWidget {
  const Cateogries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit,LayoutStates>(
        listener: (context,state){},
      builder: (context,state){
          var cubit=LayoutCubit.get(context).modelGategors;
          return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=>buildItem(cubit.data.data[index]),
            separatorBuilder: (context,index)=>Padding(
              padding:EdgeInsetsDirectional.symmetric(horizontal: 8.0),
              child: Container(
                color: Colors.grey[300],
                height: 1.0,
              ),
            ),
            itemCount: cubit!.data.data.length,
          );
      },
    );
  }
}


Widget buildItem(ModelData2 model){
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Row(
          children: [
            Image(
              image:NetworkImage('${model.image}'),
              fit: BoxFit.cover,
              width: 100.0,
              height: 100.0,
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Row(
                children: [
                  Text(
                    '${model.name}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}