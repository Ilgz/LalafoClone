import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lalafo/blocs/home_bloc.dart';
import 'package:lalafo/pages/detail_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(padding:EdgeInsets.only(left: 10),margin:EdgeInsets.symmetric(horizontal: 10,vertical: 10),decoration:BoxDecoration(borderRadius:BorderRadius.circular(5),border: Border.all(color:Colors.blue,style: BorderStyle.solid)),height:50,width:double.infinity,child: Row(
              children: [
                Icon(Icons.search_outlined,size: 22,),
                SizedBox(width: 10,),
                Expanded(child: TextField(onSubmitted:(text){
                  context.read<HomeBloc>().add(HomeBlocSearchProductsEvent(text));
                },textCapitalization:TextCapitalization.sentences,decoration: InputDecoration(hintText:"Поиск..."),)),
              ],
            ),),
            BlocBuilder<HomeBloc,HomeBlocState>(buildWhen:(context,state){
                 if(state is HomeBlocLoadProductsSuccess||state is HomeBlocSearchProductsSuccess||state is HomeBlocProductsLoading){
                  return true;
                 }
                 return false;
            },builder: (context, state) {
              if (state is HomeBlocLoadProductsSuccess) {
                return              Expanded(
                    child: buildGridView(state));
              }else if(state is HomeBlocSearchProductsSuccess){
                return Expanded(child: buildGridView(state),);
              }
              else if(state is HomeBlocProductsLoading){
                return Center(child: CircularProgressIndicator(),);
              }
              return Center(child: CircularProgressIndicator());
            })
          ],
        ),
      ),
    );
  }

  GridView buildGridView(state) {
    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.8),
                      itemCount: state.productList.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailPage(product:state.productList[index])));
                          },
                          child: Card(
                            elevation: 5,
                            clipBehavior: Clip.antiAlias,
                            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                            child: Column(
                              crossAxisAlignment:CrossAxisAlignment.start,children: [
                              Expanded(child: Image.network(state.productList[index].picture,height: double.infinity,width: double.infinity,fit: BoxFit.cover,)),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0,top:4),
                                child: Text("${state.productList[index].price} ${state.productList[index].currency}",overflow:TextOverflow.ellipsis,maxLines: 2,style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                              Padding( padding: const EdgeInsets.only(left: 4.0,top: 4,bottom: 4),child: Text("${state.productList[index].product}\n",overflow:TextOverflow.ellipsis,maxLines: 2,)),

                            ],),
                          ),
                        );
                      }));
  }
}
