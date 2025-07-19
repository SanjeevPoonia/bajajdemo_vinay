
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResponseTab extends StatefulWidget
{
  ResponseState createState()=>ResponseState();
}
class ResponseState extends State<ResponseTab>
{
  late PageController _pageController;
  int activePage = 1;

  @override
  Widget build(BuildContext context) {
    return    Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7), // Color of the shadow
                spreadRadius: 0, // Spread radius of the shadow
                blurRadius: 5, // Blur radius of the shadow
                offset: Offset(0, 0), // Offset of the shadow
              ),
            ],
          ),
          //  width: MediaQuery.of(context).size.width,
          height: 170,
          child: PageView.builder(
              itemCount: 3,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return slider(pagePosition, active);
              }),
        ),
        Container(
          height: 195,
          child: Column(
            children: [
              Spacer(),
              Container(
                transform:
                Matrix4.translationValues(0.0, -35.0, 0.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    indicators(3, activePage)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(viewportFraction: 1.0, initialPage: 1);

  }
  GestureDetector slider(pagePosition, active) {
    double margin = active ? 8 : 8;

    return GestureDetector(
      onTap: (){

      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          color: Colors.white,
           ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 10),
            Text('Considering 101 customers responded to the satisfaction question...',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.5),
                )),


            SizedBox(height: 15),
            Text('17.82%',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.green,
                )),
            SizedBox(height: 15),

            Row(
              children: [

                Image.asset("assets/check_ic.png"),
                SizedBox(width: 5),

                Text('Customers are likely to recommend us',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.5),
                    )),



              ],
            ),



          ],
        ),


      ),
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(5),
        width: 8,
        height: 8,
        decoration: BoxDecoration(
            color: currentIndex == index
                ?  Color(0xFF00ADEF)
                : Colors.black.withOpacity(0.45),
            shape: BoxShape.circle),
      );
    });
  }
}
