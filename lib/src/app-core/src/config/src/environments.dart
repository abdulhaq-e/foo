import 'package:flutter/material.dart';

enum Environment {
  development(
    envFile: 'development.env',
    bannerName: 'DEV',
    bannerColor: Colors.yellow,
  ),
  staging(
    envFile: 'staging.env',
    bannerName: 'STG',
    bannerColor: Colors.blue,
  ),

  local(
    envFile: 'local.env',
    bannerName: 'LOCAL',
    bannerColor: Colors.purple,
  ),

  production(
    envFile: 'production.env',
  );

  final String envFile;
  final String? bannerName;
  final Color? bannerColor;

  const Environment({
    required this.envFile,
    this.bannerName,
    this.bannerColor,
  });
}
