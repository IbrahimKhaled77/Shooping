import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Layout/cubit/cubit.dart';
import 'package:shopping/model/search/cubit/cubit.dart';
import 'package:shopping/model/search/cubit/states.dart';
import 'package:shopping/shered/components/components.dart';
import 'package:shopping/shered/constant/color/colors.dart';

class Search extends StatelessWidget {
   Search({Key? key}) : super(key: key);
  var searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>SearchCubit(),
      child: BlocConsumer<SearchCubit,SearchStates>(
        listener: (context,state){},
        builder: (context,state) {
          var cubit=SearchCubit.get(context);

          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),

                child: Column(
                  children: [
                    if(state is SearchLoadingSearchState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultTextFromFiled(
                      controller: searchController,
                      label: 'search',
                      type: TextInputType.text,
                      validator: (String? value){
                        if(value!.isEmpty){
                          return('pleas enter search');
                        }
                      },
                      onFieldSubmitted: (String value){
                        cubit.postSearch(text: value.toString());
                      },
                      prefixIcon: Icons.search,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    if(state is SearchSuccessSearchState)
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context,index)=>builderItems(cubit.model!.data.data[index],context,search: false),
                      separatorBuilder: (context,index)=>Padding(
                        padding: EdgeInsetsDirectional.all(10.0),
                        child: Container(
                          color: Colors.grey[300],
                          height: 1.0,
                        ),
                      ),
                      itemCount: cubit.model!.data.data.length,
                    ),
                  ],
                ),
              ),
            ),

          );
        }
      ),
    );


  }
  /*Widget builderItem(model,context){
    return Container(
      height: 120.0,
      width: 120.0,
      child: Row(
        children: [
          Image(
            image: NetworkImage('${model.image}'),
            width: 120.0,
            height: 120.0,
            // fit: BoxFit.cover,
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
                    height: 1.9,
                  ),
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
                    Spacer(),
                    MaterialButton(onPressed: (){
                     LayoutCubit.get(context).postFavorites(model.id);
                    },
                      padding: EdgeInsets.zero,
                      height: 1.0,
                      minWidth: 1.0,
                      child:LayoutCubit.get(context).favorites[model.id]==true ?Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border_outlined) ,
                    ),

                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }*/
}