
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:shopping/Layout/cubit/cubit.dart';
import 'package:shopping/models/model_search.dart';
import 'package:shopping/shered/constant/color/colors.dart';

Widget defaultTextButton({
  required Function function,
  required String text,

}){
  return TextButton(
      onPressed: ()=>function(),
      child: Text(
          text.toUpperCase(),

      ),
  );
}


Widget defaultMaterialButton({
  required Function function,
  required String text,
  //context,
}){
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: defaultColor,
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: MaterialButton(
        onPressed: ()=>function(),
        child:Text(
          text.toUpperCase(),
         // style: Theme.of(context).textTheme.headlineMedium!.copyWith(
           // color: Colors.white,
          //),
        ) ,
    ),
  );
}



Widget defaultTextFromFiled({
  required TextEditingController controller,
  required String label,
  required TextInputType type,
  required Function validator,
  required IconData prefixIcon,
  IconData? suffixIcon,
  Function?  onFieldSubmitted,
  Function?  onChanged,
  Function?  onTap,
  Function?  suffix,
  bool isShowPassword=false,


}){

  return TextFormField(
     controller:controller ,
     keyboardType:type ,
     obscureText: isShowPassword,
    onTap: onTap!=null ?()=>onTap():null,
    onChanged: onChanged!=null?(String value)=>onChanged(value):null,
    onFieldSubmitted: onFieldSubmitted!=null ? (String value)=>onFieldSubmitted(value):null,
    validator: (value){
       return validator(value);
    },
    decoration: InputDecoration(
      prefixIcon: Icon(prefixIcon),
      label: Text(label),
      suffixIcon:suffixIcon!=null ? IconButton(
        icon: Icon(suffixIcon),
        onPressed:()=>suffix!(),
      ): null,

    ),

  );
}


Future<bool?> defaultToastShow({
  required String text,
  required ToastState state,
}){

  return Fluttertoast.showToast(
      msg: text,
      timeInSecForIosWeb: 5,
      toastLength: Toast.LENGTH_LONG,
      textColor: Colors.white,
      fontSize: 16.0,
      backgroundColor:chooseColorState(state),
      gravity: ToastGravity.BOTTOM,
  );
}

enum ToastState{Sucess,Error}


Color chooseColorState(ToastState state){

  Color color;
  switch(state){

    case ToastState.Sucess:
      color=Colors.green;
      break;
    case ToastState.Error:
      color=Colors.red;
    break;

  }
  return color;
}


Widget builderItems( model,context,{
  bool search=true,
}){
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
                height: 150.0,
                width: 150.0,
                //  height: 200.0,
                // fit: BoxFit.cover,
              ),

              if(model.discount != 0 && search)
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
                    if(model.discount != 0 && search)
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
                      LayoutCubit.get(context).postFavorites(model.id!);
                    },
                      padding: EdgeInsets.zero,
                      height: 1.0,
                      minWidth: 1.0,
                      child:LayoutCubit.get(context).favorites[model.id]==true ?Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border_outlined) ,
                    ),
                    /*   IconButton(
                        padding: EdgeInsets.zero,
                          onPressed: (){},
                          icon: Icon(Icons.favorite_border_outlined),
                      ),*/
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    ),
  );
}