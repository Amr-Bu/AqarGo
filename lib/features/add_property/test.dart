//
// BlocProvider(
// create: (_) => AddPropertyCubit(),
// child: Scaffold(
// body: Padding(
// padding: const EdgeInsets.all(10.0),
// child: SingleChildScrollView(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// SizedBox(height: screenHeight(context) * 0.01),
//
// CircleIcon(
// icon: Icons.arrow_back_ios_new,
// iconOnTap: () {
// navigatPop(context: context);
// },
// ),
// SizedBox(height: screenHeight(context) * 0.01),
// SectionComponent(title: "Property Image:"),
// SizedBox(height: screenHeight(context) * 0.01),
// BlocBuilder<AddPropertyCubit, AddPropertyState>(
// builder: (context, state) {
// final cubit = AddPropertyCubit.get(context);
//
// return Center(
// child: Wrap(
// spacing: 10,
// runSpacing: 10,
// children: List.generate(4, (index) {
// final image = cubit.images[index];
// return GestureDetector(
// onTap: () {
// if (cubit.images[index] == null) {
// cubit.pickImage(index);
// } else {
// showDialog(
// context: context,
// builder:
// (_) => AlertDialog(
// title: Text("تنبيه"),
// content: Text(
// "هل تريد حذف هذه الصورة؟",
// ),
// actions: [
// TextButton(
// onPressed:
// () => Navigator.pop(context),
// child: Text("لا"),
// ),
// TextButton(
// onPressed: () {
// cubit.removeImage(index);
// Navigator.pop(context);
// },
// child: Text("نعم"),
// ),
// ],
// ),
// );
// }
// },
// child: Stack(
// children: [
// Container(
// height: screenHeight(context) * 0.25,
// width: screenWidth(context) * 0.35,
// child: Card(
// child:
// image != null
// ? ClipRRect(
// borderRadius:
// BorderRadius.circular(8),
// child: Image.file(
// File(image.path),
// fit: BoxFit.cover,
// ),
// )
//     : Center(
// child: Icon(
// Icons.add_a_photo_outlined,
// color: mainColor2.withOpacity(
// 0.5,
// ),
// size: 60,
// ),
// ),
// ),
// ),
// // if (image != null)
// //   Positioned(
// //     top: 0,
// //     right: 0,
// //     child: IconButton(
// //       icon: Icon(
// //           Icons.close, color: Colors.red),
// //       onPressed: () => cubit.removeImage(index),
// //     ),
// //   ),
// ],
// ),
// );
// }),
// ),
// );
// },
// ),
//
// SizedBox(height: screenHeight(context) * 0.05),
// SectionComponent(title: 'Property Type:'),
// SizedBox(height: screenHeight(context) * 0.01),
//
// BlocBuilder<AddPropertyCubit, AddPropertyState>(
// builder: (context, state) {
// final cubit = AddPropertyCubit.get(context);
//
// return Wrap(
// spacing: 5,
// runSpacing: 5,
// children: List.generate(cubit.propertyTypes.length, (
// index,
// ) {
// return GestureDetector(
// onTap: () {
// cubit.choosePropertyType(
// type: cubit.propertyTypes[index],
// );
// },
// child: Container(
// decoration: BoxDecoration(
// color:
// cubit.propertyTypes[index] ==
// cubit.propertyType
// ? mainColor2
//     : Theme.of(
// context,
// ).scaffoldBackgroundColor,
// borderRadius: BorderRadius.circular(40),
// border: Border.all(color: mainColor2, width: 2),
// ),
// padding: EdgeInsets.symmetric(
// horizontal: 10,
// vertical: 5,
// ),
// child: Text(
// cubit.propertyTypes[index],
// style: Theme.of(
// context,
// ).textTheme.bodyMedium?.copyWith(
// color:
// cubit.propertyTypes[index] ==
// cubit.propertyType
// ? whitColor
//     : mainColor2,
// ),
// ),
// ),
// );
// }),
// );
// },
// ),
//
// SizedBox(height: screenHeight(context) * 0.05),
// SectionComponent(title: 'Property category:'),
// SizedBox(height: screenHeight(context) * 0.01),
//
// BlocBuilder<AddPropertyCubit, AddPropertyState>(
// builder: (context, state) {
// final cubit = AddPropertyCubit.get(context);
//
// return Wrap(
// spacing: 5,
// runSpacing: 5,
// children: List.generate(cubit.propertyCategories.length, (
// index,
// ) {
// return GestureDetector(
// onTap: () {
// cubit.choosePropertyCategory(
// category: cubit.propertyCategories[index],
// );
// },
// child: Container(
// decoration: BoxDecoration(
// color:
// cubit.propertyCategories[index] ==
// cubit.propertyCategory
// ? mainColor2
//     : Theme.of(
// context,
// ).scaffoldBackgroundColor,
// borderRadius: BorderRadius.circular(40),
// border: Border.all(color: mainColor2, width: 2),
// ),
// padding: EdgeInsets.symmetric(
// horizontal: 10,
// vertical: 5,
// ),
// child: Text(
// cubit.propertyCategories[index],
// style: Theme.of(
// context,
// ).textTheme.bodyMedium?.copyWith(
// color:
// cubit.propertyCategories[index] ==
// cubit.propertyCategory
// ? whitColor
//     : mainColor2,
// ),
// ),
// ),
// );
// }),
// );
// },
// ),
//
// SizedBox(height: screenHeight(context) * 0.05),
// SectionComponent(title: 'الموقع - المحافظة والمنطقة:'),
// SizedBox(height: screenHeight(context) * 0.01),
//
// BlocBuilder<AddPropertyCubit, AddPropertyState>(
// builder: (context, state) {
// final cubit = AddPropertyCubit.get(context);
//
// return Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// DropdownButtonFormField<String>(
// value:
// cubit.selectedGovernorate.isEmpty
// ? null
//     : cubit.selectedGovernorate,
// menuMaxHeight: screenHeight(context) * 0.6,
// decoration: InputDecoration(
// filled: true,
// fillColor: Colors.grey.shade100,
// // labelText: 'اختر المحافظة',
// // labelStyle: Theme.of(context)
// //     .textTheme
// //     .bodyMedium
// //     ?.copyWith(color: mainColor2),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(12),
// ),
// contentPadding: EdgeInsets.symmetric(
// horizontal: 16,
// vertical: 12,
// ),
// ),
// items:
// cubit.governorates.map((gov) {
// return DropdownMenuItem(
// value: gov,
// child: Text(
// gov,
// style: Theme.of(
// context,
// ).textTheme.bodyMedium?.copyWith(
// color:
// gov == 'اختر المحافظة'
// ? Colors.grey
//     : mainColor2,
// ),
// ),
// );
// }).toList(),
// onChanged: (value) {
// if (value != null) cubit.selectGovernorate(value);
// },
// ),
//
// SizedBox(height: screenHeight(context) * 0.04),
//
// if (cubit.selectedGovernorate.isNotEmpty &&
// cubit.selectedGovernorate != 'اختر المحافظة')
// DropdownButtonFormField<String>(
// value:
// cubit.selectedArea.isEmpty
// ? null
//     : cubit.selectedArea,
// menuMaxHeight: screenHeight(context) * 0.6,
// decoration: InputDecoration(
// filled: true,
// fillColor: Colors.grey.shade100,
// labelText: 'اختر المنطقة',
// labelStyle: Theme.of(context).textTheme.bodyMedium
//     ?.copyWith(color: mainColor2),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(12),
// ),
// contentPadding: EdgeInsets.symmetric(
// horizontal: 16,
// vertical: 12,
// ),
// ),
// items:
// cubit.areasMap[cubit.selectedGovernorate]!
//     .map(
// (area) => DropdownMenuItem(
// value: area,
// child: Text(
// area,
// style: Theme.of(context)
//     .textTheme
//     .bodyMedium
//     ?.copyWith(color: mainColor2),
// ),
// ),
// )
//     .toList(),
// onChanged: (value) {
// if (value != null) cubit.selectArea(value);
// },
// ),
// ],
// );
// },
// ),
// SizedBox(height: screenHeight(context) * 0.05),
// SectionComponent(title: "location description:"),
// SizedBox(height: screenHeight(context) * 0.01),
// TextFromFildeComponent(
// hintText: 'location description',
// //  suffixIcon: Icons.home,
// maxLines: 3,
// controller: descController,
// ),
//
// SizedBox(height: screenHeight(context) * 0.05),
//
// SectionComponent(title: 'Contract Type:'),
// SizedBox(height: screenHeight(context) * 0.01),
//
// BlocBuilder<AddPropertyCubit, AddPropertyState>(
// builder: (context, state) {
// final cubit = AddPropertyCubit.get(context);
//
// return Wrap(
// spacing: 5,
// runSpacing: 5,
// children: List.generate(cubit.contractTypes.length, (
// index,
// ) {
// return GestureDetector(
// onTap: () {
// cubit.chooseContractType(
// type: cubit.contractTypes[index],
// );
// },
// child: Container(
// decoration: BoxDecoration(
// color:
// cubit.contractTypes[index] ==
// cubit.contractType
// ? mainColor2
//     : Theme.of(
// context,
// ).scaffoldBackgroundColor,
// borderRadius: BorderRadius.circular(40),
// border: Border.all(color: mainColor2, width: 2),
// ),
// padding: EdgeInsets.symmetric(
// horizontal: 10,
// vertical: 5,
// ),
// child: Text(
// cubit.contractTypes[index],
// style: Theme.of(
// context,
// ).textTheme.bodyMedium?.copyWith(
// color:
// cubit.contractTypes[index] ==
// cubit.contractType
// ? whitColor
//     : mainColor2,
// ),
// ),
// ),
// );
// }),
// );
// },
// ),
// SizedBox(height: screenHeight(context) * 0.05),
// SectionComponent(title: "Property price:"),
// SizedBox(height: screenHeight(context) * 0.01),
// BlocBuilder<AddPropertyCubit, AddPropertyState>(
// builder: (context, state) {
// var cubit = AddPropertyCubit.get(context);
// return Row(
// children: [
// Expanded(
// child: TextFromFildeComponent(
// hintText: 'price',
// //  suffixIcon: Icons.monetization_on_outlined,
// keyboardType: TextInputType.number,
// controller: priceController,
// ),
// ),
// SizedBox(width: 5),
//
// Text(
// '/\$',
// style: Theme.of(context).textTheme.titleSmall,
// ),
// SizedBox(width: 5),
// if (cubit.contractType == 'rent')
// Text(
// 'per month',
// style: Theme.of(context).textTheme.titleSmall,
// ),
// ],
// );
// },
// ),
// SizedBox(height: screenHeight(context) * 0.05),
// SectionComponent(title: "Property Space:"),
// SizedBox(height: screenHeight(context) * 0.01),
// Row(
// children: [
// Expanded(
// child: TextFromFildeComponent(
// hintText: 'space',
// keyboardType: TextInputType.number,
// controller: spaceController,
// ),
// ),
// SizedBox(width: 5),
// Text(
// '/meter^2',
// style: Theme.of(context).textTheme.titleSmall,
// ),
// ],
// ),
// SizedBox(height: screenHeight(context) * 0.05),
// SectionComponent(title: "Property description:"),
// SizedBox(height: screenHeight(context) * 0.01),
// TextFromFildeComponent(
// hintText: 'description',
// //  suffixIcon: Icons.home,
// maxLines: 3,
// controller: descController,
// ),
//
// SizedBox(height: screenHeight(context) * 0.05),
// BlocBuilder<AddPropertyCubit,AddPropertyState>(builder:(context,state){
// return Column(
// children: [
// Row(
// children: [
// Text("Choose your offices:",style: Theme.of(context).textTheme.titleSmall,),
// Spacer(),
// Text('2/3',style: Theme.of(context).textTheme.titleSmall,),
// ],
// ),
// Text('you must choose the offices you want to publish your property .you can choose up to 3',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),),
// SizedBox(height: screenHeight(context)*0.01,),
// Wrap(
// spacing: 5,
// runSpacing: 5,
// children:List.generate(10, (index){
// return Container(
// decoration:BoxDecoration(
// border: Border.all(color: mainColor1),
// borderRadius: BorderRadius.circular(10),
// color: cardColor
// ),
// width:screenWidth(context)*0.3,
// height:screenHeight(context)*0.2,
// padding:EdgeInsets.all(3),
// child: Column(
// children: [
// Container(
//
// height:screenHeight(context)*0.13,
//
// decoration: BoxDecoration(
//
// borderRadius: BorderRadius.circular(10),
// ),
// clipBehavior: Clip.hardEdge,
// child: Image.asset('assets/images/test1.jpg',fit: BoxFit.cover,)),
// SizedBox(height: 5,),
// Expanded(child: Text('test',style: Theme.of(context).textTheme.bodyMedium,overflow: TextOverflow.ellipsis,))
// ],
// ),
// );
// })
// )
//
// ],
// );
// }),
// SizedBox(height: screenHeight(context) * 0.01),
// SizedBox(height: screenHeight(context) * 0.05),
// SizedBox(
// width: double.infinity,
// child: ButtomComponent(
// text: 'send',
// onPressed: () {},
// icon: Icons.add,
// ),
// ),
//
// SizedBox(height: screenHeight(context) * 0.05),
// ],
// ),
// ),
// ),
// ),
// )
//
// SingleChildScrollView(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// SizedBox(height: screenHeight(context) * 0.01),
//
// CircleIcon(
// icon: Icons.arrow_back_ios_new,
// iconOnTap: () {
// navigatPop(context: context);
// },
// ),
// SizedBox(height: screenHeight(context) * 0.01),
// SectionComponent(title: "Property Image:"),
// SizedBox(height: screenHeight(context) * 0.01),
// BlocBuilder<AddPropertyCubit, AddPropertyState>(
// builder: (context, state) {
// final cubit = AddPropertyCubit.get(context);
//
// return Center(
// child: Wrap(
// spacing: 10,
// runSpacing: 10,
// children: List.generate(4, (index) {
// final image = cubit.images[index];
// return GestureDetector(
// onTap: () {
// if (cubit.images[index] == null) {
// cubit.pickImage(index);
// } else {
// showDialog(
// context: context,
// builder:
// (_) => AlertDialog(
// title: Text("تنبيه"),
// content: Text(
// "هل تريد حذف هذه الصورة؟",
// ),
// actions: [
// TextButton(
// onPressed:
// () => Navigator.pop(context),
// child: Text("لا"),
// ),
// TextButton(
// onPressed: () {
// cubit.removeImage(index);
// Navigator.pop(context);
// },
// child: Text("نعم"),
// ),
// ],
// ),
// );
// }
// },
// child: Stack(
// children: [
// Container(
// height: screenHeight(context) * 0.25,
// width: screenWidth(context) * 0.35,
// child: Card(
// child:
// image != null
// ? ClipRRect(
// borderRadius:
// BorderRadius.circular(8),
// child: Image.file(
// File(image.path),
// fit: BoxFit.cover,
// ),
// )
//     : Center(
// child: Icon(
// Icons.add_a_photo_outlined,
// color: mainColor2.withOpacity(
// 0.5,
// ),
// size: 60,
// ),
// ),
// ),
// ),
// // if (image != null)
// //   Positioned(
// //     top: 0,
// //     right: 0,
// //     child: IconButton(
// //       icon: Icon(
// //           Icons.close, color: Colors.red),
// //       onPressed: () => cubit.removeImage(index),
// //     ),
// //   ),
// ],
// ),
// );
// }),
// ),
// );
// },
// ),
//
// SizedBox(height: screenHeight(context) * 0.05),
// SectionComponent(title: 'Property Type:'),
// SizedBox(height: screenHeight(context) * 0.01),
//
// BlocBuilder<AddPropertyCubit, AddPropertyState>(
// builder: (context, state) {
// final cubit = AddPropertyCubit.get(context);
//
// return Wrap(
// spacing: 5,
// runSpacing: 5,
// children: List.generate(cubit.propertyTypes.length, (
// index,
// ) {
// return GestureDetector(
// onTap: () {
// cubit.choosePropertyType(
// type: cubit.propertyTypes[index],
// );
// },
// child: Container(
// decoration: BoxDecoration(
// color:
// cubit.propertyTypes[index] ==
// cubit.propertyType
// ? mainColor2
//     : Theme.of(
// context,
// ).scaffoldBackgroundColor,
// borderRadius: BorderRadius.circular(40),
// border: Border.all(color: mainColor2, width: 2),
// ),
// padding: EdgeInsets.symmetric(
// horizontal: 10,
// vertical: 5,
// ),
// child: Text(
// cubit.propertyTypes[index],
// style: Theme.of(
// context,
// ).textTheme.bodyMedium?.copyWith(
// color:
// cubit.propertyTypes[index] ==
// cubit.propertyType
// ? whitColor
//     : mainColor2,
// ),
// ),
// ),
// );
// }),
// );
// },
// ),
//
// SizedBox(height: screenHeight(context) * 0.05),
// SectionComponent(title: 'Property category:'),
// SizedBox(height: screenHeight(context) * 0.01),
//
// BlocBuilder<AddPropertyCubit, AddPropertyState>(
// builder: (context, state) {
// final cubit = AddPropertyCubit.get(context);
//
// return Wrap(
// spacing: 5,
// runSpacing: 5,
// children: List.generate(cubit.propertyCategories.length, (
// index,
// ) {
// return GestureDetector(
// onTap: () {
// cubit.choosePropertyCategory(
// category: cubit.propertyCategories[index],
// );
// },
// child: Container(
// decoration: BoxDecoration(
// color:
// cubit.propertyCategories[index] ==
// cubit.propertyCategory
// ? mainColor2
//     : Theme.of(
// context,
// ).scaffoldBackgroundColor,
// borderRadius: BorderRadius.circular(40),
// border: Border.all(color: mainColor2, width: 2),
// ),
// padding: EdgeInsets.symmetric(
// horizontal: 10,
// vertical: 5,
// ),
// child: Text(
// cubit.propertyCategories[index],
// style: Theme.of(
// context,
// ).textTheme.bodyMedium?.copyWith(
// color:
// cubit.propertyCategories[index] ==
// cubit.propertyCategory
// ? whitColor
//     : mainColor2,
// ),
// ),
// ),
// );
// }),
// );
// },
// ),
//
// SizedBox(height: screenHeight(context) * 0.05),
// SectionComponent(title: 'الموقع - المحافظة والمنطقة:'),
// SizedBox(height: screenHeight(context) * 0.01),
//
// BlocBuilder<AddPropertyCubit, AddPropertyState>(
// builder: (context, state) {
// final cubit = AddPropertyCubit.get(context);
//
// return Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// DropdownButtonFormField<String>(
// value:
// cubit.selectedGovernorate.isEmpty
// ? null
//     : cubit.selectedGovernorate,
// menuMaxHeight: screenHeight(context) * 0.6,
// decoration: InputDecoration(
// filled: true,
// fillColor: Colors.grey.shade100,
// // labelText: 'اختر المحافظة',
// // labelStyle: Theme.of(context)
// //     .textTheme
// //     .bodyMedium
// //     ?.copyWith(color: mainColor2),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(12),
// ),
// contentPadding: EdgeInsets.symmetric(
// horizontal: 16,
// vertical: 12,
// ),
// ),
// items:
// cubit.governorates.map((gov) {
// return DropdownMenuItem(
// value: gov,
// child: Text(
// gov,
// style: Theme.of(
// context,
// ).textTheme.bodyMedium?.copyWith(
// color:
// gov == 'اختر المحافظة'
// ? Colors.grey
//     : mainColor2,
// ),
// ),
// );
// }).toList(),
// onChanged: (value) {
// if (value != null) cubit.selectGovernorate(value);
// },
// ),
//
// SizedBox(height: screenHeight(context) * 0.04),
//
// if (cubit.selectedGovernorate.isNotEmpty &&
// cubit.selectedGovernorate != 'اختر المحافظة')
// DropdownButtonFormField<String>(
// value:
// cubit.selectedArea.isEmpty
// ? null
//     : cubit.selectedArea,
// menuMaxHeight: screenHeight(context) * 0.6,
// decoration: InputDecoration(
// filled: true,
// fillColor: Colors.grey.shade100,
// labelText: 'اختر المنطقة',
// labelStyle: Theme.of(context).textTheme.bodyMedium
//     ?.copyWith(color: mainColor2),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(12),
// ),
// contentPadding: EdgeInsets.symmetric(
// horizontal: 16,
// vertical: 12,
// ),
// ),
// items:
// cubit.areasMap[cubit.selectedGovernorate]!
//     .map(
// (area) => DropdownMenuItem(
// value: area,
// child: Text(
// area,
// style: Theme.of(context)
//     .textTheme
//     .bodyMedium
//     ?.copyWith(color: mainColor2),
// ),
// ),
// )
//     .toList(),
// onChanged: (value) {
// if (value != null) cubit.selectArea(value);
// },
// ),
// ],
// );
// },
// ),
// SizedBox(height: screenHeight(context) * 0.05),
// SectionComponent(title: "location description:"),
// SizedBox(height: screenHeight(context) * 0.01),
// TextFromFildeComponent(
// hintText: 'location description',
// //  suffixIcon: Icons.home,
// maxLines: 3,
// controller: descController,
// ),
//
// SizedBox(height: screenHeight(context) * 0.05),
//
// SectionComponent(title: 'Contract Type:'),
// SizedBox(height: screenHeight(context) * 0.01),
//
// BlocBuilder<AddPropertyCubit, AddPropertyState>(
// builder: (context, state) {
// final cubit = AddPropertyCubit.get(context);
//
// return Wrap(
// spacing: 5,
// runSpacing: 5,
// children: List.generate(cubit.contractTypes.length, (
// index,
// ) {
// return GestureDetector(
// onTap: () {
// cubit.chooseContractType(
// type: cubit.contractTypes[index],
// );
// },
// child: Container(
// decoration: BoxDecoration(
// color:
// cubit.contractTypes[index] ==
// cubit.contractType
// ? mainColor2
//     : Theme.of(
// context,
// ).scaffoldBackgroundColor,
// borderRadius: BorderRadius.circular(40),
// border: Border.all(color: mainColor2, width: 2),
// ),
// padding: EdgeInsets.symmetric(
// horizontal: 10,
// vertical: 5,
// ),
// child: Text(
// cubit.contractTypes[index],
// style: Theme.of(
// context,
// ).textTheme.bodyMedium?.copyWith(
// color:
// cubit.contractTypes[index] ==
// cubit.contractType
// ? whitColor
//     : mainColor2,
// ),
// ),
// ),
// );
// }),
// );
// },
// ),
// SizedBox(height: screenHeight(context) * 0.05),
// SectionComponent(title: "Property price:"),
// SizedBox(height: screenHeight(context) * 0.01),
// BlocBuilder<AddPropertyCubit, AddPropertyState>(
// builder: (context, state) {
// var cubit = AddPropertyCubit.get(context);
// return Row(
// children: [
// Expanded(
// child: TextFromFildeComponent(
// hintText: 'price',
// //  suffixIcon: Icons.monetization_on_outlined,
// keyboardType: TextInputType.number,
// controller: priceController,
// ),
// ),
// SizedBox(width: 5),
//
// Text(
// '/\$',
// style: Theme.of(context).textTheme.titleSmall,
// ),
// SizedBox(width: 5),
// if (cubit.contractType == 'rent')
// Text(
// 'per month',
// style: Theme.of(context).textTheme.titleSmall,
// ),
// ],
// );
// },
// ),
// SizedBox(height: screenHeight(context) * 0.05),
// SectionComponent(title: "Property Space:"),
// SizedBox(height: screenHeight(context) * 0.01),
// Row(
// children: [
// Expanded(
// child: TextFromFildeComponent(
// hintText: 'space',
// keyboardType: TextInputType.number,
// controller: spaceController,
// ),
// ),
// SizedBox(width: 5),
// Text(
// '/meter^2',
// style: Theme.of(context).textTheme.titleSmall,
// ),
// ],
// ),
// SizedBox(height: screenHeight(context) * 0.05),
// SectionComponent(title: "Property description:"),
// SizedBox(height: screenHeight(context) * 0.01),
// TextFromFildeComponent(
// hintText: 'description',
// //  suffixIcon: Icons.home,
// maxLines: 3,
// controller: descController,
// ),
//
// SizedBox(height: screenHeight(context) * 0.05),
// BlocBuilder<AddPropertyCubit,AddPropertyState>(builder:(context,state){
// return Column(
// children: [
// Row(
// children: [
// Text("Choose your offices:",style: Theme.of(context).textTheme.titleSmall,),
// Spacer(),
// Text('2/3',style: Theme.of(context).textTheme.titleSmall,),
// ],
// ),
// Text('you must choose the offices you want to publish your property .you can choose up to 3',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),),
// SizedBox(height: screenHeight(context)*0.01,),
// Wrap(
// spacing: 5,
// runSpacing: 5,
// children:List.generate(10, (index){
// return Container(
// decoration:BoxDecoration(
// border: Border.all(color: mainColor1),
// borderRadius: BorderRadius.circular(10),
// color: cardColor
// ),
// width:screenWidth(context)*0.3,
// height:screenHeight(context)*0.2,
// padding:EdgeInsets.all(3),
// child: Column(
// children: [
// Container(
//
// height:screenHeight(context)*0.13,
//
// decoration: BoxDecoration(
//
// borderRadius: BorderRadius.circular(10),
// ),
// clipBehavior: Clip.hardEdge,
// child: Image.asset('assets/images/test1.jpg',fit: BoxFit.cover,)),
// SizedBox(height: 5,),
// Expanded(child: Text('test',style: Theme.of(context).textTheme.bodyMedium,overflow: TextOverflow.ellipsis,))
// ],
// ),
// );
// })
// )
//
// ],
// );
// }),
// SizedBox(height: screenHeight(context) * 0.01),
// SizedBox(height: screenHeight(context) * 0.05),
// SizedBox(
// width: double.infinity,
// child: ButtomComponent(
// text: 'send',
// onPressed: () {},
// icon: Icons.add,
// ),
// ),
//
// SizedBox(height: screenHeight(context) * 0.05),
// ],
// ),
// )