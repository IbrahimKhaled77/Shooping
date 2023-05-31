import 'package:flutter/material.dart';
import 'package:shopping/model/login/login_Screen.dart';
import 'package:shopping/shered/constant/color/colors.dart';
import 'package:shopping/shered/constant/end_point/end_ponit.dart';
import 'package:shopping/shered/network/remot/sharedpreferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Items{
  String? title;
  String? body;
  String? image;


  Items({
    required this.title,
    required this.body,
    required this.image,
  });

}






class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  List<Items>item=[
    Items(title:'On Board 1 Title' ,body:'On Board 1 body' ,image: 'assets/images/g1.jpg',),
    Items(title:'On Board 2 Title' ,body:'On Board 2 body' ,image: 'assets/images/g2.jpg',),
    Items(title:'On Board 3 Title' ,body:'On Board 3 body' ,image: 'assets/images/g3.jpg',),
  ];
  bool? isEnd;

  var boardController=PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            textColor: defaultColor,
              onPressed: (){
                SharedPreference.saveData(key: 'OnBoard', value: true).then((value) {

                    onBorders=SharedPreference.getData(key: 'OnBoard');
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Login()), (route) => false);


                });
              },
              child: const Text(
                'Skip',
              ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const  BouncingScrollPhysics(),
                  controller:boardController ,
                  onPageChanged: (int index){
                  if(index == item.length-1 ){
                    setState(() {
                      isEnd=true;
                    });
                  }else{
                    setState(() {
                      isEnd=false;
                    });
                  }

                  },
                  itemCount:item.length ,
                  itemBuilder: (context, index)=>buildItems(item[index]),

              ),
            ),
            SizedBox(height: 40.0,),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: item.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: defaultColor,
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 5.0,
                    spacing: 5.0,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                    onPressed: (){
                      if(isEnd!){
                        SharedPreference.saveData(key: 'OnBoard', value: true).then((value) {
                          if(value){
                            onBorders=SharedPreference.getData(key: 'OnBoard');
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> Login()), (route) => false);
                          }

                        });
                      }else{
                        boardController.nextPage(
                          duration: Duration(
                            milliseconds: 600,
                          ),
                          curve: Curves.fastOutSlowIn,
                        );

                      }



                    },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }



  Widget buildItems(Items item)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image:AssetImage('${item.image}'),

        ),
      ),
      SizedBox(
        height: 10.0,
      ),
      Text(
        '${item.title}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),

      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        '${item.body}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),

      ),
    ],
  );
}
