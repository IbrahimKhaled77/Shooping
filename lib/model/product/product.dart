

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Layout/cubit/cubit.dart';
import 'package:shopping/Layout/cubit/state.dart';
import 'package:shopping/models/models_Gategories.dart';
import 'package:shopping/models/models_Home.dart';
import 'package:shopping/shered/components/components.dart';
import 'package:shopping/shered/constant/color/colors.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit,LayoutStates>(
      listener: (context,state){
        if(state is PostFavoritesSuccessState){
          if(!state.modle.status!){
            defaultToastShow(text:state.modle.message! ,state: ToastState.Error);
          }
        }
      },
      builder: (context,state){
        var cubit=LayoutCubit.get(context);
        return  ConditionalBuilder(
          condition:cubit.modelHome!= null && cubit.modelGategors !=null,
          builder: (context)=>buildItem(cubit.modelHome!,cubit.modelGategors!,context),
          fallback: (context)=>Center(child: CircularProgressIndicator()),
        );
      },


    ) ;
  }

  Widget buildItem(ModelHome model,ModelGategor modelGategors,context){
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          CarouselSlider(
              items: model.data.banners.map((e) {
                return Image(
                    image:e.image != null? NetworkImage('${e.image}'):NetworkImage('https://student.valuxapps.com/storage/uploads/banners/1680057346A0jc4.41.PNG'),
                   //width: double.infinity,
                    fit: BoxFit.cover,
                );
              }).toList(),
              options: CarouselOptions(
                height: 250.0,
                initialPage: 0,
                reverse: false,
                scrollDirection: Axis.horizontal,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                viewportFraction: 1.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(seconds: 3),
              ),
          ),
          SizedBox(height:20.0,),
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: SizedBox(
             height: 100.0,
             child: ListView.separated(
               shrinkWrap: true,
               physics: BouncingScrollPhysics(),
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (context,index)=>buildGatgor(modelGategors.data.data[index]),
                 separatorBuilder: (context,index)=>SizedBox(
                   width: 8.0,
                 ),
                 itemCount: modelGategors.data.data.length,
             ),
           ),
         ),
          SizedBox(height:20.0,),
          Container(
            color: Colors.white,
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 1/1.55,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                       model.data.products.length,
                      (index) =>buildProducts(model.data.products[index],context),
              ),
            ),
          ),
        ],
      ),
    );

  }

  Widget buildProducts(ModelProducts model,context){
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
                image: NetworkImage('${model.image}'),
                height: 200.0,
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
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model.name}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.0,
                  height: 1.3,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
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
                  child:LayoutCubit.get(context).favorites[model.id]==true ?Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border_outlined) ,
                    padding: EdgeInsets.zero,
                    height: 1.0,
                    minWidth: 1.0,
                  ),

                ],
              ),
            ],
          ),
        ),

      ],
    );
  }


  Widget buildGatgor(ModelData2 model){
    return  Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image(
          image: NetworkImage('${model.image}'),
          height: 100.0,
          width: 100.0,
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.black.withOpacity(0.8),
          width: 100.0,
          child: Text(
            '${model.name}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            ),
          ),
        ),
      ],
    );
  }

}