import 'package:flutter/material.dart';
import 'package:food_delivery/constants/app_constants.dart';
import 'package:food_delivery/constants/color_constants.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import '../../dimensions.dart';
import '../../widgets/ExpandableText.dart';
import 'package:get/get.dart';



class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({
    Key? key,
    required this.pageId
  }) : super(key: key);

  final String longText = """Sense child do state to defer mr of forty. Become latter but nor abroad wisdom waited. Was delivered gentleman acuteness but daughters. In as of whole as match asked. Pleasure exertion put add entrance distance drawings. In equally matters showing greatly it as. Want name any wise are able park when. Saw vicinity judgment remember finished men throwing. For norland produce age wishing. To figure on it spring season up. Her provision acuteness had excellent two why intention. As called mr needed praise at. Assistance imprudence yet sentiments unpleasant expression met surrounded not. Be at talked ye though secure nearer. She suspicion dejection saw instantly. Well deny may real one told yet saw hard dear. Bed chief house rapid right the. Set noisy one state tears which. No girl oh part must fact high my he. Simplicity in excellence melancholy as remarkably discovered. Own partiality motionless was old excellence she inquietude contrasted. Sister giving so wicket cousin of an he rather marked. Of on game part body rich. Adapted mr savings venture it or comfort affixed friends. Carried nothing on am warrant towards. Polite in of in oh needed itself silent course. Assistance travelling so especially do prosperous appearance mr no celebrated. Wanted easily in my called formed suffer. Songs hoped sense as taken ye mirth at. Believe fat how six drawing pursuit minutes far. Same do seen head am part it dear open to. Whatever may scarcely judgment had. Arrival entered an if drawing request. How daughters not promotion few knowledge contented. Yet winter law behind number stairs garret excuse. Minuter we natural conduct gravity if pointed oh no. Am immediate unwilling of attempted admitting disposing it. Handsome opinions on am at it ladyship. No in he real went find mr. Wandered or strictly raillery stanhill as. Jennings appetite disposed me an at subjects an. To no indulgence diminution so discovered mr apartments. Are off under folly death wrote cause her way spite. Plan upon yet way get cold spot its week. Almost do am or limits hearts. Resolve parties but why she shewing. She sang know now how nay cold real case.""";

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 350,
              decoration:  BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      AppConstants.BASE_URL+AppConstants.UPLOADS_URL+product.img!,
                    ),
                  ),
              ),
            ),
          ),
          // Top icons
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:   [
                GestureDetector(
                  onTap: (){
                    Get.to(()=>MainFoodPage());
                  },
                    child: AppIcon(icon: Icons.arrow_back_ios)),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          // Introduction of food | Expandable text
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.height(350 - 20),
            child: Container(
              padding: EdgeInsets.only(left: Dimensions.width(20), right: Dimensions.width(20), top: Dimensions.height(20)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius(20)),
                  topRight: Radius.circular(Dimensions.radius(20)),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    AppColumn(text: product.name!),
                  SizedBox(height: Dimensions.height(20),),
                   BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height(20),),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(text: product.description!),
                    ),
                  ),
                  SizedBox(height: Dimensions.height(20),),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
        return Container(
          height: Dimensions.height(120),
          padding: EdgeInsets.only(
            top: Dimensions.height(30),
            bottom: Dimensions.height(30),
            left: Dimensions.width(20),
            right: Dimensions.width(20),
          ),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(Dimensions.radius(30)),
              topLeft: Radius.circular(Dimensions.radius(30)),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height(10),
                  bottom: Dimensions.height(10),
                  left: Dimensions.width(10),
                  right: Dimensions.width(10),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius(20)),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          popularProduct.setQuantity(false);
                          },
                        child: Icon(Icons.remove, color: ConstantColor.mainColor,)),
                    SizedBox(width: Dimensions.height(10) / 2,),
                    BigText(text: popularProduct.inCartItems .toString()),
                    SizedBox(width: Dimensions.height(10) / 2,),
                    GestureDetector(
                        onTap:(){
                          popularProduct.setQuantity(true);
                        } ,
                        child: Icon(Icons.add, color: ConstantColor.mainColor,)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height(10),
                  bottom: Dimensions.height(10),
                  left: Dimensions.width(10),
                  right: Dimensions.width(10),
                ),
                decoration: BoxDecoration(
                  color: ConstantColor.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius(20)),
                ),
                child: GestureDetector(
                  onTap: (){
                    popularProduct.addItem(product);
                  },
                  child: BigText(
                    text: "\$ ${product.price!} | Add to cart",
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      ),
    );
  }
}