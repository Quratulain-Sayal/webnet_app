import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:webnet_app/components/responsive.dart';
import 'package:webnet_app/const/constants.dart';
import 'package:webnet_app/models/products_model.dart' as products_model;
import 'package:webnet_app/views/Home/components/components.dart';
import 'package:webnet_app/views/Home/components/sidemenu.dart';


class ProductsList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductsList> {
  late Future<products_model.ProductModel> _productsFuture;
  List<products_model.Data> _filteredProducts = []; // Filtered data to display
  List<products_model.Data> _allProducts = []; // Original data from API
  final TextEditingController _searchController = TextEditingController();
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    _productsFuture = fetchProducts();
  }

  Future<products_model.ProductModel> fetchProducts() async {
    final response = await http
        .get(Uri.parse('https://www.nasachemicals.com/api/get-products'));

    if (response.statusCode == 200) {
      final products =
          products_model.ProductModel.fromJson(json.decode(response.body));

      setState(() {
        _allProducts = products.data ?? [];
        _filteredProducts = List.from(_allProducts);
      });
      return products;
    } else {
      throw Exception(
          'Failed to load products. Status code: ${response.statusCode}');
    }
  }

  void _filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredProducts = List.from(_allProducts);
      } else {
        _filteredProducts = _allProducts.where((product) {
          final title = product.title ?? '';

          return title.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(
          child: Sidemenu(),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff782572),
          actions: const [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: appBar),
                  child: SvgIcon(
                    icon: SvgIconData('assets/images/notification.svg'),
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: appBar),
                    child: ProfileDropdown())
              ],
            ),
          ],
        ),
        body: FutureBuilder<products_model.ProductModel>(
            future: _productsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child:
                        CircularProgressIndicator()); // Loader while fetching
              } else if (snapshot.hasError) {
                return Center(
                    child: Text('Error: ${snapshot.error}')); // Error handling
              } else if (_filteredProducts.isEmpty) {
                return Center(
                    child: Text('No Products found.')); // No data case
              }

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        labelText: 'Search Products',
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: _filterProducts, // Use the method directly
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      child: Text(
                        'Products',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF797979),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Expanded(
                        child: SingleChildScrollView(
                      child: SizedBox(
                        // width: double.infinity,
                        child: Theme(
                          data: ThemeData.light().copyWith(
                              cardColor: Theme.of(context).canvasColor),
                          child: PaginatedDataTable(
                            headingRowColor: MaterialStateColor.resolveWith(
                                (states) => Colors.grey[300]!),
                            columns: [
                              DataColumn(
                                  label: Text('Image',
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF797979))))),
                              DataColumn(
                                  label: Text('Title',
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF797979))))),
                              DataColumn(
                                  label: Text('Slug',
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF797979))))),
                              DataColumn(
                                  label: Text('Brand',
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF797979))))),
                              DataColumn(
                                  label: Text('SKU',
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF797979))))),
                              // DataColumn(label: Text('Role', style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF797979))))),
                              DataColumn(
                                  label: Text('Weight',
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF797979))))),
                              DataColumn(
                                  label: Text('Qunatity',
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF797979))))),
                              DataColumn(
                                  label: Text('Price',
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF797979))))),
                              DataColumn(
                                  label: Text('Active',
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF797979))))),
                              DataColumn(
                                  label: Text('Created at',
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF797979))))),
                            ],
                            source: ProductDataTableSource(_filteredProducts),
                            header: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Products',
                                  style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF505458),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF188AE2),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    minimumSize: const Size(20, 40),
                                  ),
                                  child: Text(
                                    'Add Products',
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            columnSpacing: 10,
                            horizontalMargin: 10,
                            rowsPerPage: _rowsPerPage,
                            availableRowsPerPage: const [5, 10, 25, 50, 100],
                            onRowsPerPageChanged: (value) {
                              setState(() {
                                _rowsPerPage = value ??
                                    PaginatedDataTable.defaultRowsPerPage;
                              });
                            },
                            showFirstLastButtons:
                                false, // Enable first and last buttons
                          ),
                        ),
                      ),
                    )),
                    SizedBox(height: screenHeight * 0.03),
                    Divider(color: Colors.grey.withOpacity(0.3)),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      '2024 © Webnet Pakistan.',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF797979),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
         bottomNavigationBar: Responsive.isMobile(context)
          ? BottomNavigationBar(
              backgroundColor: Color(0xfff4f6f8),
              items: [
                BottomNavigationBarItem(
                  
                  icon: Image.asset(
                    "assets/images/dashboard.png",
                    height: 20,
                    width: 20,
                    color: Color(0xFF752376),
                  ),
                  label: 'Dashboard',
                
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/images/content-writing.png",
                    height: 20,
                    width: 20,
                    color: Color(0xFF752376),
                  ),
                  label: 'Cms',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/images/user.png",
                    height: 20,
                    width: 20,
                    color: Color(0xFF752376),
                  ),
                  label: 'Account',
                ),
              ],
              currentIndex: 0, // Set the initial index
              selectedItemColor: const Color(0xFF505458), // Active item color
              unselectedItemColor:
                  const Color(0xFF505458), // Inactive item color
              showSelectedLabels: true, // Show labels for selected items
              showUnselectedLabels: true, // Show labels for unselected items
              selectedLabelStyle: const TextStyle(
                fontFamily: 'Lato', // Specify Lato font family
                fontWeight: FontWeight.w400, // Bold for selected
                color: Color(0xFF505458),
                fontSize: 12,
                // Color for selected label
              ),
              unselectedLabelStyle: const TextStyle(
                  fontFamily: 'Lato', // Specify Lato font family
                  color: Color(0xFF505458),
                  fontWeight: FontWeight.w400,
                  fontSize: 12 // Color for unselected label
                  ),
              onTap: (index) {
                // Handle navigation here
              },
            )
          : null,
      ),
    );
  }
}

// DataTable source
class ProductDataTableSource extends DataTableSource {
  final List<products_model.Data> _products;

  ProductDataTableSource(this._products);

  @override
  DataRow getRow(int index) {
    final product = _products[index];
    return DataRow(cells: [
      DataCell(product.image != null
          ? Container(
              height: 50,
              width: 100,
              child: Image.network(product.image!)) // Display the image
          : Text('No Image')), // Placeholder for no image
      DataCell(Text(
        product.title ?? '',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
      )),
      DataCell(ConstrainedBox(
          constraints: BoxConstraints(), child: Text(product.slug ?? ''))),
      DataCell(Text(product.brandId ?? '')),
      DataCell(Text(product.sku ?? '')),
      DataCell(Text(product.weight.toString())),
      DataCell(Text(product.quantity.toString())),
      DataCell(Text(product.price.toString())),
      DataCell(Text(product.isActive == 1 ? 'Yes' : 'No')),
      DataCell(Text(product.createdAt ?? '')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _products.length;

  @override
  int get selectedRowCount => 0;
}
