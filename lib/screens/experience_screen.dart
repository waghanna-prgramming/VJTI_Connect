// import 'package:demo_connect/screens/select_company.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../providers/experience_provider.dart';
// import '../widgets/domain_card.dart';
//
// class Experience extends StatefulWidget {
//   final String domain, drive, domainID, driveID, companyName, title;
//   const Experience(
//       {required this.drive,
//         required this.driveID,
//         required this.domain,
//         required this.domainID,
//       required this.companyName,
//       required this.title});
//
//   @override
//   State<Experience> createState() => _ExperienceState();
// }
//
// class _ExperienceState extends State<Experience> {
//
//   late ExperienceProvider experienceProvider;
//
//   Future<void> _launchUrl(Uri url) async {
//     if (!await launchUrl(url)) {
//       throw Exception('Could not launch $url');
//     }
//   }
//
//   @override
//   void initState() {
//     ExperienceProvider experienceProvider = Provider.of(context, listen: false);
//     experienceProvider.fetchExperience(
//         drive: widget.drive,
//         domain: widget.domain,
//         driveID: widget.driveID,
//         domainID: widget.domainID);
//     // print('Fetching data');
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     experienceProvider = Provider.of(context);
//     Map<String, String>? dataMap = experienceProvider.getExperience(widget.companyName);
//     // print(dataMap?.length);
//
//     return Scaffold(
//       backgroundColor: const Color(0xFFF1F4F8),
//       // key: scaffoldKey,
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFF1F4F8),
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back_rounded,
//             color: Color(0xFF14181B),
//             size: 30,
//           ),
//           onPressed: () {
//             print('IconButton pressed ...');
//             Navigator.of(context).pushReplacement(
//               MaterialPageRoute(
//                 builder: (context) => SelectCompany(
//                     drive: widget.drive,
//                     driveID: widget.driveID,
//                     domain: widget.domain,
//                     domainID: widget.domainID,
//                     title: widget.title),
//               ),
//             );
//           },
//         ),
//         centerTitle: true,
//         title: Text('Interview Exp'),
//         titleTextStyle: TextStyle(
//           fontFamily: 'Sora',
//           color: Color(0xFF14181B),
//           fontSize: 36,
//           fontWeight: FontWeight.bold,
//         ),
//         actions: [],
//         elevation: 0,
//       ),
//
//       body: ListView.builder(
//           itemCount: 1,
//           itemBuilder: (context, index) {
//             // print(dataMap?.length);
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Column(
//                   children: dataMap!.keys.map((name) {
//                     return GestureDetector(
//                       child: DomainCard(domainName: name),
//                       onTap: () {
//                         _launchUrl(
//                           Uri.parse(dataMap[name]!),
//                         );
//                       },
//                     );
//                   }).toList(),
//                 ),
//               ],
//             );
//           }),
//     );
//   }
// }
