import 'dart:io';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@collection
class PatientCollection {
  Id id = Isar.autoIncrement;

  @Index(caseSensitive: false)
  late String name;

  late int age;
  late String gender;
  late double height;
  late double weight;

  @Index(unique: true, replace: true, caseSensitive: false)
  late String passportNumber;

  late String nationality;
  late String bloodGroup;

  @Index()
  String? phone;

  String? email;
  String? photoPath;
  late DateTime createdAt;
  late DateTime updatedAt;
}

@embedded
class PatientInfoEmbed {
  String? name;
  int? age;
  String? gender;
  double? height;
  double? weight;
  String? passportNumber;
  String? nationality;
  String? bloodGroup;
  String? position;
  String? visaNumber;
  DateTime? issueDate;
  String? placeOfIssue;
  String? photoPath;
  String? phone;
  String? email;
}

@embedded
class MedicalExamEmbed {
  String? eyeRight;
  String? eyeLeft;
  String? eyeRemarks;
  String? earRight;
  String? earLeft;
  String? earRemarks;
  String? cardiovascular;
  String? bloodPressure;
  String? heart;
  String? respiratory;
  String? chestXRay;
  String? tuberculosis;
  String? gastroIntestinal;
  String? abdomen;
  String? hernia;
  String? varicoseVeins;
  String? extremities;
  String? deformities;
  String? skin;
  String? venerealDiseases;
  String? clinicalRemarks;
}

@embedded
class LabInvestigationEmbed {
  String? urineSugar;
  String? urineAlbumin;
  String? urineBilharziasis;
  String? stoolOva;
  String? stoolCyst;
  String? stoolBlood;
  String? stoolHelminthes;
  String? stoolGiardia;
  String? stoolBilharziasis;
  String? stoolSalmonella;
  String? stoolShigella;
  String? stoolCholera;
  double? bloodHemoglobin;
  double? bloodTlc;
  double? bloodWbc;
  double? bloodEsr;
  double? bloodSgpt;
  double? bloodUrea;
  double? bloodUricAcid;
  String? bloodMalaria;
  String? bloodMicroFilaria;
  double? serologyPp2bs;
  double? serologyFbs;
  String? serologyLft;
  double? serologyCreatinine;
  double? serologyPlateletCount;
  double? lipidCholesterol;
  double? lipidTry;
  double? lipidHdl;
  double? lipidLdl;
  String? lipidG6pd;
  String? elisaHiv;
  String? elisaHbsAg;
  String? elisaAntiHcv;
  String? elisaVdrl;
  String? elisaTpha;
}

@collection
class ReportCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String serialNumber;

  @Index()
  late DateTime examDate;

  @Index()
  late String status; // DRAFT, PENDING, COMPLETED, PRINTED

  @Index()
  late int patientId;

  late int doctorId;
  late int clinicId;
  String? templateId;
  String? remarks;
  String? pdfPath;
  late DateTime createdAt;
  late DateTime updatedAt;

  PatientInfoEmbed? patientInfo;
  MedicalExamEmbed? medicalExam;
  LabInvestigationEmbed? labInvestigation;
}

@collection
class DoctorCollection {
  Id id = Isar.autoIncrement;

  @Index(caseSensitive: false)
  late String name;

  late String qualifications;
  late String designation;
  String? signaturePath;
  late bool isActive;
}

@collection
class ClinicCollection {
  Id id = Isar.autoIncrement;

  late String name;
  String? subtitle;
  late String address;
  String? phone;
  String? email;
  String? logoPath;
  String? stampPath;
  String? registrationNumbers;
}

@collection
class TemplateCollection {
  Id id = Isar.autoIncrement;

  @Index(caseSensitive: false)
  late String name;

  String? description;
  late String type;
  late bool isDefault;
  late String layoutJson;
  late DateTime createdAt;
}

@collection
class SettingsCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String key;

  late String value;
}

@collection
class LabTestCollection {
  Id id = Isar.autoIncrement;

  @Index(caseSensitive: false)
  late String name;

  late String unit;
  late double referenceMin;
  late double referenceMax;
  late String category;
}

@collection
class MedicalSectionCollection {
  Id id = Isar.autoIncrement;

  late String name;
  late String fieldsJson;
  late int sortOrder;
}

@collection
class CompanyCollection {
  Id id = Isar.autoIncrement;

  @Index(caseSensitive: false)
  late String name;

  String? address;
  String? contactPerson;
  String? phone;
}

@collection
class AuditLogCollection {
  Id id = Isar.autoIncrement;

  @Index()
  late String action;

  @Index()
  late String entityType;

  late int entityId;
  late String userId;
  late String details;

  @Index()
  late DateTime timestamp;
}

@collection
class UserCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true, caseSensitive: false)
  late String username;

  late String passwordHash;
  late String role;
  late bool isActive;
}

@collection
class AttachmentCollection {
  Id id = Isar.autoIncrement;

  late String fileName;
  late String filePath;
  late String type;

  @Index()
  late String linkedEntityType;

  @Index()
  late int linkedEntityId;
}

/// Singleton Isar database service managing initialization and access across all 12 collections.
class IsarDatabase {
  static final IsarDatabase _instance = IsarDatabase._internal();
  factory IsarDatabase() => _instance;
  IsarDatabase._internal();

  Isar? _isar;
  Isar get instance {
    if (_isar == null || !_isar!.isOpen) {
      throw IsarError('IsarDatabase not initialized or closed. Call init() first.');
    }
    return _isar!;
  }

  Future<Isar> init() async {
    if (_isar != null && _isar!.isOpen) {
      return _isar!;
    }

    final dir = await getApplicationDocumentsDirectory();
    final dbPath = Directory('${dir.path}/MedicalReportSystem/db');
    if (!await dbPath.exists()) {
      await dbPath.create(recursive: true);
    }

    _isar = await Isar.open(
      [
        PatientCollectionSchema,
        ReportCollectionSchema,
        DoctorCollectionSchema,
        ClinicCollectionSchema,
        TemplateCollectionSchema,
        SettingsCollectionSchema,
        LabTestCollectionSchema,
        MedicalSectionCollectionSchema,
        CompanyCollectionSchema,
        AuditLogCollectionSchema,
        UserCollectionSchema,
        AttachmentCollectionSchema,
      ],
      directory: dbPath.path,
      name: 'medical_report_system',
      inspector: true,
    );

    return _isar!;
  }

  Future<void> close() async {
    if (_isar != null && _isar!.isOpen) {
      await _isar!.close();
      _isar = null;
    }
  }
}
