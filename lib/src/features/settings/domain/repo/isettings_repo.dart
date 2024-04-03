
import 'package:dartz/dartz.dart';
import 'package:habita/core/failures/ifailure.dart';

abstract interface class ISettingsRepo{
   Future<Either<Failure,void>> signOut();
}