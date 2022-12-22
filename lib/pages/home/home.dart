import 'package:flutter/material.dart';
import 'package:phuoc_duc_baithi/domain/api_clients/api_client.dart';
import 'package:phuoc_duc_baithi/widgets/products/product_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: DataOwnerStatefullState());
  }
}

class DataOwnerStatefullState extends StatefulWidget {
  const DataOwnerStatefullState({Key? key}) : super(key: key);

  @override
  _DataOwnerStatefullStateState createState() =>
      _DataOwnerStatefullStateState();
}

class _DataOwnerStatefullStateState extends State<DataOwnerStatefullState> {
  late List<dynamic> _value;
  late List<dynamic> _prod;
  int _currentId = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _basicValue();
  }

  void _basicValue() async {
    _value = await ApiClient().getCategories();
    _prod = await ApiClient().getProducts();
    isLoading = false;
    setState(() {});
  }

  void _currentCategoryItems() async {
    _prod = await ApiClient().getCategoryItems(id: _currentId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.only(left: 16),
                child: SizedBox(
                  height: 32,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: _value.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(right: 8),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _currentId = _value[index].id;
                              });

                              _currentCategoryItems();
                            },
                            child: Text(
                              _value[index].name,
                              style: TextStyle(
                                  color: _currentId == _value[index].id
                                      ? Colors.black
                                      : Colors.grey[600],
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: _currentId == _value[index].id
                                    ? Color.fromRGBO(255, 185, 5, 1)
                                    : Colors.grey[300],
                                minimumSize: Size(50, 32),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                onPrimary: Colors.yellow),
                          ),
                        );
                      }),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 16, top: 24),
                child: Text(
                  'Recommanded for you',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Expanded(child: MyProd()),
            ],
          );
  }
}

class MyProd extends StatefulWidget {
  const MyProd({Key? key}) : super(key: key);

  @override
  _MyProdState createState() => _MyProdState();
}

class _MyProdState extends State<MyProd> {
  @override
  Widget build(BuildContext context) {
    final value = context
        .findAncestorStateOfType<_DataOwnerStatefullStateState>()
        ?._prod as List;
    return ProductsGrid(productitem: value);
  }
}
