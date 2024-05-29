library simple_id_card;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class IdCardScreen extends StatefulWidget {
  final String photoUrl;
  final String nameUser;
  final String idNumber;
  final String lastNameUser;
  final String nationality;
  final String birthDate;
  final String expirationDate;

  const IdCardScreen(
      {super.key,
      required this.photoUrl,
      required this.nameUser,
      required this.idNumber,
      required this.lastNameUser,
      required this.nationality,
      required this.birthDate,
      required this.expirationDate});

  @override
  State<IdCardScreen> createState() => _IdCardScreenState();
}

class _IdCardScreenState extends State<IdCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("ID",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: Colors.white,
          shadowColor: Colors.grey,
          centerTitle: false,
          automaticallyImplyLeading: false,
          elevation: 0.1,
          titleSpacing: 0.0,
          leading: MaterialButton(
            onPressed: () => Navigator.of(context).pop(),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            textColor: Colors.black,
            shape: const CircleBorder(),
            child: const Icon(
              Icons.arrow_back,
              size: 20,
              color: Colors.black,
            ),
          )),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        children: [
          Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        widget.photoUrl,
                    placeholder: (context, url) => const SizedBox(
                      width: 180,
                      height: 180,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                      ),
                    ),
                    errorWidget: (context, url, error) {
                      return GestureDetector(
                        onTap: () {},
                        child: const CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 180,
                          child: Text(
                            "dummy",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                      );
                    },
                    imageBuilder: (context, image) => Hero(
                      tag: 'setting_user_photo',
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16.0)),
                          image: DecorationImage(
                            image: image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: QrImageView(
                            data: widget.idNumber,
                            version: 1,
                            size: 320,
                            gapless: false,
                            errorStateBuilder: (cxt, err) {
                              return const Center(
                                child: Text(
                                  'Uh oh! Something went wrong...',
                                  textAlign: TextAlign.center,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "VALID",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: Text(
                    'Name',
                    style: TextStyle(color: Colors.black),
                  )),
                  Expanded(
                      child: Text(
                    'ID Number',
                    style: TextStyle(color: Colors.black),
                  ))
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: Text(
                    widget.nameUser,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
                  Expanded(
                      child: Text(
                    widget.idNumber,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: Text(
                    'Last Name',
                    style: TextStyle(color: Colors.black),
                  )),
                  Expanded(
                      child: Text(
                    'Nationality',
                    style: TextStyle(color: Colors.black),
                  ))
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: Text(
                    widget.lastNameUser,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
                  Expanded(
                      child: Text(
                    widget.nationality,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: Text(
                    'Birth Date',
                    style: TextStyle(color: Colors.black),
                  )),
                  Expanded(
                      child: Text(
                    'Expiration Date',
                    style: TextStyle(color: Colors.black),
                  ))
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: Text(
                    widget.birthDate,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
                  Expanded(
                      child: Text(
                    widget.expirationDate,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ))
                ],
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: _btnAddWallet(),
    );
  }

  Widget _btnAddWallet() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
        child: OutlinedButton(
          onPressed: () async => {},
          style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(46),
              side: const BorderSide(color: Colors.black26),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              backgroundColor: const Color(0xFFE6E5E5)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.wallet_travel, color: Colors.black),
              SizedBox(
                width: 6,
              ),
              Text(
                "Add to Wallet",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      );
}
