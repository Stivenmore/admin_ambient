import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserModel {
  final String nombre;
  final String email;
  final String? dayregister;
  final String? monthregister;
  final String? yearsregister;
  final String? lastlogin;
  final String? img;
  final String? id;
  final bool? activate;
  final List<Transaction> transaction;
  final List<RecyclerModel> recycler;
  final List<Point> points;

  UserModel(
      {required this.nombre,
      required this.email,
      required this.transaction,
      this.img =
          'https://firebasestorage.googleapis.com/v0/b/ambient-ec3df.appspot.com/o/Img%2Fno-image.jpg?alt=media&token=cc289889-ea88-48a7-86ce-00e0ac3ce197',
      this.dayregister,
      this.lastlogin,
      this.monthregister,
      this.yearsregister,
      required this.recycler,
      required this.id,
      required this.points,
      this.activate = false});

  factory UserModel.fromFirebase(Map<String, dynamic> map) {
    return UserModel(
        nombre: map["name"] as String? ?? "",
        email: map["email"] as String? ?? "",
        img: map["img"] as String? ??
            "https://firebasestorage.googleapis.com/v0/b/ambient-ec3df.appspot.com/o/Img%2Fno-image.jpg?alt=media&token=cc289889-ea88-48a7-86ce-00e0ac3ce197",
        dayregister: map["dayregister"] as String? ?? "",
        monthregister: map["monthregister"] as String? ?? "",
        yearsregister: map["yearsregister"] as String? ?? "",
        lastlogin: map["lastlogin"] as String? ?? "",
        transaction: map["pointList"] != null
            ? (map["pointList"] as Iterable)
                .map((e) => Transaction.fromJson(e))
                .toList()
            : <Transaction>[],
        recycler: map["recycler"] != null
            ? (map["recycler"] as Iterable)
                .map((e) => RecyclerModel.fromJson(e))
                .toList()
            : <RecyclerModel>[],
        id: map["id"] as String? ?? "",
        activate: map["activate"] ?? false,
        points: map["pointList"] != null
            ? (map["pointList"] as Iterable)
                .map((e) => Point.fromJson(e))
                .toList()
            : <Point>[],);
  }
}

class Transaction {
  final int point;
  final String time;
  final Icon icon;
  final Color color;

  Transaction(
      {required this.icon,
      required this.point,
      required this.time,
      required this.color});

  factory Transaction.fromJson(Map map) {
    final type = {
      "up": const Icon(
        Icons.airline_stops_rounded,
        color: Colors.green,
      ),
      "down": const Icon(
        Icons.arrow_downward_sharp,
        color: Colors.red,
      ),
      "none": Icon(
        Icons.anchor_outlined,
        color: UniCodes.blueperformance,
      )
    };

    final color = {
      "up": Colors.green,
      "down": Colors.red,
      "none": UniCodes.blueperformance
    };
    return Transaction(
        point: map["point"] as int? ?? 0,
        time: map["time"] as String? ?? "",
        icon: type[(map["type"] as String? ?? "none")]!,
        color: color[(map["type"] as String? ?? "none")]!);
  }
}

class RecyclerModel {
  final String time;
  final int carton;
  final int metal;
  final int papel;
  final int plastico;
  final int vidrio;
  bool isExpanded;

  RecyclerModel(
      {required this.time,
      required this.carton,
      required this.metal,
      required this.papel,
      required this.plastico,
      required this.vidrio,
      this.isExpanded = false});

  factory RecyclerModel.fromJson(Map map) {
    return RecyclerModel(
      carton: map["carton"] as int? ?? 0,
      metal: map["metal"] as int? ?? 0,
      papel: map["papel"] as int? ?? 0,
      plastico: map["plastico"] as int? ?? 0,
      vidrio: map["vidrio"] as int? ?? 0,
      time: map["time"] as String? ?? "...",
    );
  }
}

class Point {
  final String time;
  final int point;
  final String type;

  Point({required this.time, required this.point, required this.type});

  factory Point.fromJson(Map map) {
    return Point(
      point: map["point"] as int? ?? 0,
      type: map["type"] as String? ?? "none",
      time: map["time"] as String? ??
          DateFormat('yyyy-MM-dd').format(DateTime.now()),
    );
  }
}
