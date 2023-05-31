import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Layout/cubit/cubit.dart';
import 'package:shopping/Layout/cubit/state.dart';
import 'package:shopping/models/model_search.dart';
import 'package:shopping/models/models_favortesGet.dart';
import 'package:shopping/shered/components/components.dart';
import 'package:shopping/shered/constant/color/colors.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit,LayoutStates>(
      listener: (context,state){},
        builder: (context,state){
        var cubit=LayoutCubit.get(context);
        return ConditionalBuilder(
          condition:state is! GetFavoritesLoadingState && cubit.modelGetFavort != null,
          builder:(context)=> ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=>builderItems(cubit.modelGetFavort!.data.data[index].product,context),
            separatorBuilder: (context,index)=>Container(
              color: Colors.grey[300],
              height: 1.0,
            ),
            itemCount: cubit.modelGetFavort!.data.data.length,
          ),
          fallback: (context)=>Center(child: CircularProgressIndicator(),),

        );
        },

    );
  }


/*  Widget builderItem(Product model,context){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 150.0,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage('${model.image}'),
                //  height: 200.0,
                  // fit: BoxFit.cover,
                ),
                if(model.discount != 0)
                Container(
                  color: Colors.red,
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 8.0),
                  child: Text(
                    'Discount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                    ),
                  ),
                ),


              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model.name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0,
                      height: 2.9,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        '${model.price}',
                        style: TextStyle(
                          fontSize: 13.0,
                          color: defaultColor,
                        ),

                      ),
                      const SizedBox(width: 10.0,),
                        if(model.discount != 0)
                      Text(
                        '${model.oldPrice}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13.0,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Spacer(),
                      MaterialButton(onPressed: (){
                        LayoutCubit.get(context).postFavorites(model.id);
                      },
                        padding: EdgeInsets.zero,
                        height: 1.0,
                        minWidth: 1.0,
                        child:LayoutCubit.get(context).favorites[model.id]==true ?Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border_outlined) ,
                      ),
                      *//*   IconButton(
                        padding: EdgeInsets.zero,
                          onPressed: (){},
                          icon: Icon(Icons.favorite_border_outlined),
                      ),*//*
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }*/
}