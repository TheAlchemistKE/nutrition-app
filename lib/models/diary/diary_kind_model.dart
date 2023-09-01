import 'dart:convert';

import 'package:nutrinowapp/helper/diary_model_type.dart';

enum DiaryKindModelType {
  food,
  generic,
}

class DiaryKindModel {
  final int id;
  final String name;
  final String thumbnail;
  final String img;
  final String iconImg;
  final String overlayColor;
  final double overlayOpacity;
  final String nameColor;
  final double nameSize;
  final DiaryKindModelType type;

  final String updateButtonText;
  final String updateSectionTitleText;
  final String updateButtonCommitText;
  final String tipOfTheDay;
  final String tipOfTheDayIcon;
  final String quoteOfTheDay;

  DiaryKindModel({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.img,
    this.updateButtonText = '',
    this.updateSectionTitleText = '',
    this.updateButtonCommitText = '',
    this.tipOfTheDay = '',
    this.tipOfTheDayIcon = '',
    this.quoteOfTheDay = '',
    this.iconImg = '',
    this.overlayColor = '0x73000000',
    this.overlayOpacity = 0.6,
    this.nameColor = 'FFFFFF',
    this.nameSize = 18.0,
    this.type = DiaryKindModelType.generic,
  });

  factory DiaryKindModel.fromJson(Map<String, dynamic> json) => DiaryKindModel(
        id: json['id'],
        name: json['name'],
        thumbnail: json['thumbnail'],
        iconImg: json['icon_img'],
        img: json['img'],
        updateSectionTitleText: json['update_section_title_text'],
        updateButtonText: json['update_button_text'],
        updateButtonCommitText: json['update_button_commit_text'],
        tipOfTheDay: json['tip_of_the_day'],
        tipOfTheDayIcon: json['tip_of_the_day_icon'],
        quoteOfTheDay: json['quote_of_the_day'],
        overlayColor: json['overlay_color'],
        overlayOpacity: json['overlay_opacity'],
        nameColor: json['title_color'],
        nameSize: json['title_size'],
        type: DiaryModelTypeHelper.fromString(json['type']),
      );

  factory DiaryKindModel.fromString(String source) {
    return DiaryKindModel.fromJson(jsonDecode(source));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'thumbnail': thumbnail,
        'icon_img': iconImg,
        'img': img,
        'update_section_title_text': updateSectionTitleText,
        'update_button_text': updateButtonText,
        'update_button_commit_text': updateButtonCommitText,
        'tip_of_the_day': tipOfTheDay,
        'tip_of_the_day_icon': tipOfTheDayIcon,
        'quote_of_the_day': quoteOfTheDay,
        'overlay_color': overlayColor,
        'overlay_opacity': overlayOpacity,
        'title_color': nameColor,
        'title_size': nameSize,
        'type': type,
      };
}
