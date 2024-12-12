import 'package:flutter/material.dart';
import 'package:sajid_bazaar/app.dart';
import 'package:sajid_bazaar/secrete/secrete.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: Secrete.supabaseUrl,
    anonKey: Secrete.supabaseAnonKey,
  );
  runApp(const SajidBazaar());
}
