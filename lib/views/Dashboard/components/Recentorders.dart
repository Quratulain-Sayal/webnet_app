import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; 
import 'package:webnet_app/const/constants.dart';
import 'package:webnet_app/models/recentorders.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(defaultpadding),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Table Title
          
            // Table Data with Scroll
            Container(
             // height: 300, // Fixed height for table container
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 20,  // Reduced spacing between columns
                    dataRowHeight: 70,   // Reduced row height
                    columns:  [
                      DataColumn(
                        label: Text("Order", style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold) ),),
                      ),
                      DataColumn(
                        label: Text("Amount", style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold) ),),
                      ),
                      DataColumn(
                        label: Text("Date", style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold) ),),
                      ),
                    ],
                    rows: List.generate(
                      demoRecentFiles.length,
                      (index) => recentFileDataRow(demoRecentFiles[index]),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Updating the DataRow function
DataRow recentFileDataRow(RecentOrderInfo orderInfo) {
  return DataRow(
    cells: [
      DataCell(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Minimize column height
          children: [
            Row(
              children: [
                Text(orderInfo.orderNo!),
              ],
            ),
            Row(
              children: [
                Text(orderInfo.title!),
              ],
            ),
          ],
        ),
      ),
      DataCell(Text(orderInfo.amount!)),
      DataCell(Text(orderInfo.date!)),
    ],
  );
}
