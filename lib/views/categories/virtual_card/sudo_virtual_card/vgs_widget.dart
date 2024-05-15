// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// class VgsIntegrationWidget extends StatefulWidget {
//   final String token, cardId;

//   const VgsIntegrationWidget({
//     Key? key,
//     required this.token,
//     required this.cardId,
//   }) : super(key: key);

//   @override
//   _VgsIntegrationWidgetState createState() => _VgsIntegrationWidgetState();
// }

// class _VgsIntegrationWidgetState extends State<VgsIntegrationWidget> {
//   InAppWebViewController? webView;
//   bool isLoading = true;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         InAppWebView(
//           initialUrlRequest: URLRequest(
//             url: Uri.dataFromString(
//               '''
//              <!DOCTYPE html>
// <html>
// <head>
//     <meta charSet="utf-8">
//     <title></title>
//     <style>
//     html{
//       font-size: 80px !important;
//     }
//         iframe {
//             height: 30px;
//             width:500px;
//             font-size: 80px !important;
//             transform: scale(2.8);
//             padding-left: 260px;
//         }
//         #cvv2{
//             display: none;
//         }
//         .cvv{
//             display: none;
//         }
       



//     </style>
// </head>
// <body>
  
// <label class="cvv">Card Number:</label>
// <div id="cardNumber"></div>
  
// <label class="cvv">CVV2:</label>
// <div id="cvv2"></div>

// <script type="text/javascript" src="https://js.verygoodvault.com/vgs-show/1.5/ACiWvWF9tYAez4BitGpSE68f.js"></script>
// <script type="text/javascript">
//     const show = VGSShow.create('tntbuyt0v9u');
//     const cardToken = "${widget.token}";
//     const cardId = "${widget.cardId}";

//     const cvv2iframe = show.request({
//             name: 'cvv-text',
//             method: 'GET',
//             path: '/cards/' + cardId + '/secure-data/cvv2',
//             headers: {
//                 "Authorization": "Bearer " + cardToken
//             },
//             htmlWrapper: 'text',
//             jsonPathSelector: 'data.cvv2'
//         });
//     cvv2iframe.render('#cvv2');

  
//     const cardNumberIframe = show.request({
//             name: 'pan-text',
//             method: 'GET',
//             path: '/cards/' +cardId + '/secure-data/number',
//             headers: {
//                 "Authorization": "Bearer " + cardToken
//             },
//             htmlWrapper: 'text',
//             jsonPathSelector: 'data.number'
//         });
//     cardNumberIframe.render('#cardNumber');
  
//   const pinIframe = show.request({
//             name: 'pin-text',
//             method: 'GET',
//             path: '/cards/'+ cardId + '/secure-data/defaultPin',
//             headers: {
//                 "Authorization": "Bearer " + cardToken
//             },
//             htmlWrapper: 'text',
//             jsonPathSelector: 'data.defaultPin'
//         });
//     pinIframe.render('#pin');
// </script>
// </body>
// </html>
//               ''',
//               mimeType: 'text/html',
//               encoding: Encoding.getByName('utf-8'),
//             ),
//           ),
//           onWebViewCreated: (controller) {
//             webView = controller;
//           },
//           onLoadStop: (controller, url) {
//             setState(() {
//               isLoading = false;
//             });
//           },
//         ),
//         if (isLoading)
//           Center(
//             child: CircularProgressIndicator(),
//           ),
//       ],
//     );
//   }
// }
