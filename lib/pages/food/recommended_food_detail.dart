
import 'package:flutter/material.dart';
import 'package:food_delivery/constants/color_constants.dart';
import 'package:food_delivery/dimensions.dart';
import 'package:food_delivery/widgets/ExpandableText.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  final String longText = """Sense child do state to defer mr of forty. Become latter but nor abroad wisdom waited.Sense child do state to defer mr of forty. Become latter but nor abroad wisdom waiteSense child do state to defer mr of forty. Become latter but nor abroad wisdom waiteSense child do state to defer mr of forty. Become latter but nor abroad wisdom waiteSense child do state to defer mr of forty. Become latter but nor abroad wisdom waiteSense child do state to defer mr of forty. Become latter but nor abroad wisdom waiteSense child do state to defer mr of forty. Become latter but nor abroad wisdom waiteSense child do state to defer mr of forty. Become latter but nor abroad wisdom waiteSense child do state to defer mr of forty. Become latter but nor abroad wisdom waiteSense child do state to defer mr of forty. Become latter but nor abroad wisdom waiteSense child do state to defer mr of forty. Become latter but nor abroad wisdom waiteSense child do state to defer mr of forty. Become latter but nor abroad wisdom waiteSense child do state to defer mr of forty. Become latter but nor abroad wisdom waiteSense child do state to defer mr of forty. Become latter but nor abroad wisdom waiteSense child do state to defer mr of forty. Become latter but nor abroad wisdom waiteSense child do state to defer mr of forty. Become latter but nor abroad wisdom waiteSense child do state to defer mr of forty. Become latter but nor abroad wisdom waiteSense child do state to defer mr of forty. Become latter but nor abroad wisdom waiteSense child do state to defer mr of forty. Become latter but nor abroad wisdom waiteSense child do state to defer mr of forty. Become latter but nor abroad wisdom waiteSense child do state to defer mr of forty. Become latter but nor abroad wisdom waiteSense child do state to defer mr of forty. Become latter but nor abroad wisdom waiteSense child do state to defer mr of forty. Become latter but nor abroad wisdom waite Was delivered gentleman acuteness but daughters. In as of whole as match asked. Pleasure exertion put add entrance distance drawings. In equally matters showing greatly it as. Want name any wise are able park when. Saw vicinity judgment remember finished men throwing. For norland produce age wishing. To figure on it spring season up. Her provision acuteness had excellent two why intention. As called mr needed praise at. Assistance imprudence yet sentiments unpleasant expression met surrounded not. Be at talked ye though secure nearer. She suspicion dejection saw instantly. Well deny may real one told yet saw hard dear. Bed chief house rapid right the. Set noisy one state tears which. No girl oh part must fact high my he. Simplicity in excellence melancholy as remarkably discovered. Own partiality motionless was old excellence she inquietude contrasted. Sister giving so wicket cousin of an he rather marked. Of on game part body rich. Adapted mr savings venture it or comfort affixed friends. Carried nothing on am warrant towards. Polite in of in oh needed itself silent course. Assistance travelling so especially do prosperous appearance mr no celebrated. Wanted easily in my called formed suffer. Songs hoped sense as taken ye mirth at. Believe fat how six drawing pursuit minutes far. Same do seen head am part it dear open to. Whatever may scarcely judgment had. Arrival entered an if drawing request. How daughters not promotion few knowledge contented. Yet winter law behind number stairs garret excuse. Minuter we natural conduct gravity if pointed oh no. Am immediate unwilling of attempted admitting disposing it. Handsome opinions on am at it ladyship. No in he real went find mr. Wandered or strictly raillery stanhill as. Jennings appetite disposed me an at subjects an. To no indulgence diminution so discovered mr apartments. Are off under folly death wrote cause her way spite. Plan upon yet way get cold spot its week. Almost do am or limits hearts. Resolve parties but why she shewing. She sang know now how nay cold real case.""";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5,bottom: 10),
                child: Center(child: BigText(size: Dimensions.font26,text: 'The Big Doner')),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
              ),

            ),
            pinned: true,
            backgroundColor: Colors.yellowAccent,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'images/foodImage2.jpg',
                width: double.maxFinite,
                fit: BoxFit.cover,
                ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableText(text: longText),
                  margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconColor: Colors.white,
                  icon: Icons.remove,
                  backgroundColor: ConstantColor.mainColor,
                  iconSize: Dimensions.iconsize24,
                ),
                BigText(text: "\$36.96"+" X"+" 0",color: ConstantColor.blackColor,size: Dimensions.font26,),
                AppIcon(
                  iconColor: Colors.white,
                  icon: Icons.add,
                  backgroundColor: ConstantColor.mainColor,
                  iconSize: Dimensions.iconsize24,
                ),
              ],
            ),
          ),
          Container(
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
                  child: Icon(
                    Icons.favorite,
                    color: ConstantColor.mainColor,
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
                  child: BigText(
                    text: "\$10 | Add to cart",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
