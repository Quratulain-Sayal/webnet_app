

class CloudStorageInfo {
  final String?  title;
  final String? orders;
  

  CloudStorageInfo({
    this.orders,
    this.title,
    
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Total Orders",
    orders: '1858'
    
  ),
  CloudStorageInfo(
    title: "Total Customers ",
    orders: '1350'
   
  ),
  CloudStorageInfo(
    title: "Pending Orders",
   orders: '781'
  ),
  CloudStorageInfo(
    title: "Todays Orders",
    orders: '0'
  ),
    CloudStorageInfo(
    title: "Total Products",
    orders: '23'
  ),
    CloudStorageInfo(
    title: "Total Brands",
    orders: '0'
   
  ),
];
