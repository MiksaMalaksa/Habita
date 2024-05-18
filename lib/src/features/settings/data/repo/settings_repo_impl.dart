import 'package:habita/src/features/settings/data/datasources/isettings_datasource.dart';
import 'package:habita/src/features/settings/domain/repo/isettings_repo.dart';

class SettingsRepoImpl implements ISettingsRepo {
  final ISettingsDataSource datasource;

  const SettingsRepoImpl({required this.datasource});
}
