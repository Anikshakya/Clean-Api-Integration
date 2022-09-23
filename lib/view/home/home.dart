import 'package:api_integration/controller/home_controller.dart';
import 'package:api_integration/view/catagory/view/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    initialize();
  }

  initialize()async{
    await homeController.getItems();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Integration"),
        backgroundColor: Colors.black,
        actions: [
          IconButton(icon: const Text("Catagory"),onPressed: ()=>Get.to(()=>const MyHomePage())),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder(
              init: HomeController(),
              builder: (_){
                return Obx(
                  ()=> homeController.loading.value
                  ?SizedBox(
                    height: MediaQuery.of(context).size.height - kToolbarHeight,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
                  )
                  :ListView.builder(
                    itemCount: homeController.userData.length,
                    itemBuilder: (context, index){
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width /2,
                                child: Text(homeController.userData[index].title.toString()),
                              ),
                              ElevatedButton(
                                onPressed: (){},
                                child: const Text('Favourite'),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.5),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
                                  primary: Colors.black,
                                  onPrimary: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

