import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:webnet_app/components/responsive.dart';
import 'package:webnet_app/const/constants.dart';
import 'package:webnet_app/models/pages_model.dart' as pages_model;
import 'package:webnet_app/views/Home/components/components.dart';
import 'package:webnet_app/views/Home/components/sidemenu.dart';

class PagesList extends StatefulWidget {
  @override
  _PagesListState createState() => _PagesListState();
}

class _PagesListState extends State<PagesList> {
  late Future<pages_model.PagesModel> _pagesFuture;
  List<pages_model.Data> _filteredPages = []; // Filtered data to display
  List<pages_model.Data> _allPages = []; // Original data from API

  final TextEditingController _searchController = TextEditingController();
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  void _clearSearch() {
    setState(() {
      _searchController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    _pagesFuture = fetchPages();
  }

  Future<pages_model.PagesModel> fetchPages() async {
    final response =
        await http.get(Uri.parse('https://taazagosht.pk/api/get-pages'));

    if (response.statusCode == 200) {
      final parsedJson = json.decode(response.body);
      final pages = pages_model.PagesModel.fromJson(parsedJson);

      setState(() {
        _allPages = pages.data ?? [];

        _filteredPages = List.from(_allPages);
      });
      return pages;
    } else {
      throw Exception(
          'Failed to load pages. Status code: ${response.statusCode}');
    }
  }

  void _filterPages(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredPages = List.from(_allPages);
      } else {
        _filteredPages = _allPages.where((pages) {
          final title = pages.title ?? '';

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
        drawer: Sidemenu(),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Color(0xff782572),
          actions: const [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: SvgIcon(
                    icon: SvgIconData('assets/images/notification.svg'),
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ProfileDropdown())
              ],
            ),
          ],
        ),
        body: FutureBuilder<pages_model.PagesModel>(
            future: _pagesFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const  Center(
                    child:
                        CircularProgressIndicator()); // Loader while fetching
              } else if (snapshot.hasError) {
                return Center(
                    child: Text('Error: ${snapshot.error}')); // Error handling
              } else if (_filteredPages.isEmpty) {
                return Center(child: Text('No Pages found.')); // No data case
              }

              return Padding(
                padding: const EdgeInsets.all(defaultpadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xfff4f6f8),
                            hintText: "Search pages",
                            hintStyle: GoogleFonts.lato(color: Colors.black),
                            prefixIcon: Icon(Icons.search, color: Colors.black),
                            suffixIcon: _searchController.text.isNotEmpty
                                ? IconButton(
                                    icon: const Icon(Icons.clear,
                                        color: Colors.black),
                                    onPressed: _clearSearch,
                                  )
                                : null,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 14.0),
                          ),
                          onChanged: _filterPages),
                    ),
                    SizedBox(height: screenHeight*0.02,),
                    Padding(
                      padding: const EdgeInsets.all(defaultpadding),
                      child: Text(
                        'Pages',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF797979),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight*0.01,),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(defaultpadding),
                        child: SizedBox(
                          child: Theme(
                            data: ThemeData.light().copyWith(
                                cardColor: Theme.of(context).canvasColor),
                            child: PaginatedDataTable(
                              headingRowColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.grey[300]!),
                              columns: [
                                DataColumn(
                                    label: Text('Title',
                                        style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF797979))))),
                                // DataColumn(
                                //     label: Text('URL',
                                //         style: GoogleFonts.lato(
                                //             textStyle: const TextStyle(
                                //                 fontSize: 14,
                                //                 fontWeight: FontWeight.bold,
                                //                 color: Color(0xFF797979))))),
                                DataColumn(
                                    label: Text('Created at',
                                        style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF797979))))),
                              ],
                              source: PagesDataTableSource(_filteredPages),
                              header: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Pages',
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
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      minimumSize: const Size(20, 40),
                                    ),
                                    child: Text(
                                      'New',
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
                              columnSpacing: 40,
                              horizontalMargin: 40,
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
                      ),
                    )),
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
class PagesDataTableSource extends DataTableSource {
  final List<pages_model.Data> _pages;

  PagesDataTableSource(this._pages);

  @override
  DataRow getRow(int index) {
    final pages = _pages[index];
    return DataRow(cells: [
      DataCell(Text(pages.title ?? '')),
      //     DataCell(Row(children: [
      //       Text(pages.slug ?? ''), IconButton(
      //         icon: Icon(Icons.link, color: Colors.blue), // Link icon
      // onPressed: () async {
      //   // Using the null-aware operator ?. to safely access the url
      //   final url = pages.seo?.canonical;

      //   if (url != null && await canLaunchUrl(Uri.parse(url))) {
      //     await launchUrl(Uri.parse(url));  // Open the link in the browser
      //   } else {
      //    // You can handle the error appropriately
      //   }
      // },
      //       ), ])),
      
      DataCell(Text(pages.createdAt ?? '')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _pages.length;

  @override
  int get selectedRowCount => 0;
}
