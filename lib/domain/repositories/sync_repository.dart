import 'package:flutter/material.dart';

abstract class SyncRepository {
  Future<void> syncAutopartsOfSeller(BuildContext context);
  Future<void> syncSales(BuildContext context);
  Future<void> syncBuys(BuildContext context);
  Future<void> syncGeneral(BuildContext context);
}
