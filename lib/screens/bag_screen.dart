import 'package:dro_store/store/mystore.dart';
import 'package:flutter/material.dart';
import 'package:dro_store/responsive_parent_widget.dart';
import 'package:provider/provider.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[InkWell(
          onTap: (){
            // moves to bag screen

          },
          child: Text(store.getBagQuantity().toString(),),),],
      ),
      body: ResponsiveSafeArea(
        responsiveBuilder: (context, size) {
          return ListView.builder(
            itemCount: store.bag.length,
            itemBuilder: (context, i){
              return Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child:
                    FadeInImage.assetNetwork(
                      width: 150.0,
                      height: 150.0,
                      placeholder: '',
                      image: store.bag[i].productImage.toString(),),),
                  Expanded(
                    flex: 2,
                    child: Text(store.bag[i].productName.toString()),),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)
                      ),
                      child: Row(
                        children: <Widget>[

                          IconButton(
                            onPressed: (){
                              store.addItemToBag(store.bag[i]) ;
                            },
                            icon: const Icon(Icons.add),
                          ),
                          Text(store.bag[i].productQuantity.toString()),
                          IconButton(
                            onPressed: (){
                              store.removeItemFromBag(store.bag[i]) ;
                            },
                            icon: const Icon(Icons.remove),
                          ),
                        ],
                      ),
                    )),
                ],
              );
            });
        },
      ),
    );
  }
}
