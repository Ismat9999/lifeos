import 'package:flutter/material.dart';

import '../../../core/services/utils_service.dart';

Widget itemOfLanguageTranslate(BuildContext context) {
  String currentLang = Utils().getCurrentLangCode(context);

  return PopupMenuButton<String>(
    onSelected: (String lang) {
      Utils().changeLanguage(context, lang);
    },
    color: Colors.white,
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Icon(Icons.language, color: Color.fromRGBO(20,120,40,1),),
        SizedBox(width: 6),
        Text(
          currentLang.toUpperCase(),
          style: TextStyle(
            color: Color.fromRGBO(20,120,40,1),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Icon(Icons.arrow_drop_down, color: Color.fromRGBO(20,120,40,1),)
      ],
    ),

// Popup menyu itemlari
    itemBuilder: (context) => [
      buildLanguageMenuItem("Uzbek", "uz", currentLang),
      buildLanguageMenuItem("Русский", "ru", currentLang),
      buildLanguageMenuItem("English", "en", currentLang),
    ],
  );
}

// Popup Menu Item Builder
PopupMenuItem<String> buildLanguageMenuItem(
    String label, String lang, String currentLang) {
  bool isActive = currentLang == lang;

  return PopupMenuItem<String>(
    value: lang,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: isActive ? Color.fromRGBO(20,120,40,1) : Colors.black87,
          ),
        ),

// Active til belgisini ko'rsatish
        if (isActive)
          Icon(
            Icons.check,
            color: Color.fromRGBO(20,120,40,1),
            size: 20,
          ),
      ],
    ),
  );
}

Widget buildLanguageButton(
    BuildContext context,
    String label,
    String lang,
    ) {
  bool isActive = Utils().getCurrentLangCode(context) == lang;
  return ElevatedButton(
    onPressed: () => Utils().changeLanguage(context, lang),
    style: ElevatedButton.styleFrom(
      backgroundColor: isActive ? Color.fromRGBO(20,120,40,1) : Colors.white,
      foregroundColor: isActive ? Colors.white : Color.fromRGBO(20,120,40,1),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Color.fromRGBO(20,120,40,1),
          width: 2,
        ),
      ),
      elevation: isActive ? 5 : 0,
    ),
    child: Text(
      label,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}