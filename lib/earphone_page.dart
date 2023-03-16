import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:headphone_ui/earphone_list.dart';

class EarphonePage extends StatefulWidget {
  const EarphonePage({super.key});

  @override
  State<EarphonePage> createState() => _EarphonePageState();
}

class _EarphonePageState extends State<EarphonePage>
    with SingleTickerProviderStateMixin {
  late final TabController controller = TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => ZoomDrawer.of(context)!.toggle(),
          child: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Headphone',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.qr_code_scanner,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
        ],
        elevation: 0,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: size.height * 0.07,
          // color: Colors.yellow,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search here',
                  filled: true,
                  fillColor: const Color.fromRGBO(240, 246, 246, 1),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          width: 1, color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          width: 1, color: Colors.transparent)),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.keyboard_voice_outlined,
              size: 30,
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Choose brand',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
        Container(
            height: size.height * 0.16,
            // color: Colors.yellow,
            margin: const EdgeInsets.only(left: 10),
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemCount: headphoneBrands.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final brand = headphoneBrands[index];
                return Container(
                  width: size.width * 0.28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(240, 246, 246, 1),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/${brand['image']}',
                          height: size.height * 0.1,
                          width: size.width * 0.15,
                        ),
                        Text(
                          brand['name'],
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ]),
                );
              },
            )),
        Container(
          height: size.height * 0.05,
          child: TabBar(
            controller: controller,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.transparent,
            isScrollable: true,
            tabs: ['Popular', 'Discount', 'Exclusive']
                .map((e) => Text(e))
                .toList(),
          ),
        ),
        Expanded(
          child: TabBarView(controller: controller, children: [
            Container(
              child: const PopularHeadphones(),
            ),
            Container(
              child: Center(child: Text('Discount')),
            ),
            Container(
              child: Center(child: Text('Exclusive')),
            ),
          ]),
        ),
      ]),
    );
  }
}

class PopularHeadphones extends StatelessWidget {
  const PopularHeadphones({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 3 / 4.5),
        itemCount: headphones.length,
        itemBuilder: (context, index) {
          final headphone = headphones[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: size.height * 0.27,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(240, 246, 246, 1),
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/${headphone['image']}',
                  height: size.height * 0.2,
                  width: size.height * 0.25,
                ),
              ),
              Text(
                headphone['name'],
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '\$${headphone['price']}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          );
        },
      ),
    ); // create earphone lists
  }
}
