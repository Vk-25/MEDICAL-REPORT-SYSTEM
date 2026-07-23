import 'database.dart';

enum ReportStatus { draft, pending, completed, printed }

class Patient {
  final int? id;
  final String name;
  final int age;
  final String gender;
  final double height;
  final double weight;
  final String passportNumber;
  final String nationality;
  final String bloodGroup;
  final String? phone;
  final String? email;
  final String? photoPath;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Patient({
    this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.passportNumber,
    required this.nationality,
    required this.bloodGroup,
    this.phone,
    this.email,
    this.photoPath,
    required this.createdAt,
    required this.updatedAt,
  });

  Patient copyWith({
    int? id,
    String? name,
    int? age,
    String? gender,
    double? height,
    double? weight,
    String? passportNumber,
    String? nationality,
    String? bloodGroup,
    String? phone,
    String? email,
    String? photoPath,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Patient(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      passportNumber: passportNumber ?? this.passportNumber,
      nationality: nationality ?? this.nationality,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      photoPath: photoPath ?? this.photoPath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Patient.fromCollection(PatientCollection col) {
    return Patient(
      id: col.id,
      name: col.name,
      age: col.age,
      gender: col.gender,
      height: col.height,
      weight: col.weight,
      passportNumber: col.passportNumber,
      nationality: col.nationality,
      bloodGroup: col.bloodGroup,
      phone: col.phone,
      email: col.email,
      photoPath: col.photoPath,
      createdAt: col.createdAt,
      updatedAt: col.updatedAt,
    );
  }

  PatientCollection toCollection() {
    final col = PatientCollection()
      ..name = name
      ..age = age
      ..gender = gender
      ..height = height
      ..weight = weight
      ..passportNumber = passportNumber
      ..nationality = nationality
      ..bloodGroup = bloodGroup
      ..phone = phone
      ..email = email
      ..photoPath = photoPath
      ..createdAt = createdAt
      ..updatedAt = updatedAt;
    if (id != null) col.id = id!;
    return col;
  }

  String get fullName => name;
}

class PatientInfo {
  final String? name;
  final int? age;
  final String? gender;
  final double? height;
  final double? weight;
  final String? passportNumber;
  final String? nationality;
  final String? bloodGroup;
  final String? position;
  final String? visaNumber;
  final DateTime? issueDate;
  final String? placeOfIssue;
  final String? photoPath;
  final String? phone;
  final String? email;

  const PatientInfo({
    this.name,
    this.age,
    this.gender,
    this.height,
    this.weight,
    this.passportNumber,
    this.nationality,
    this.bloodGroup,
    this.position,
    this.visaNumber,
    this.issueDate,
    this.placeOfIssue,
    this.photoPath,
    this.phone,
    this.email,
  });

  factory PatientInfo.fromEmbed(PatientInfoEmbed? embed) {
    if (embed == null) return const PatientInfo();
    return PatientInfo(
      name: embed.name,
      age: embed.age,
      gender: embed.gender,
      height: embed.height,
      weight: embed.weight,
      passportNumber: embed.passportNumber,
      nationality: embed.nationality,
      bloodGroup: embed.bloodGroup,
      position: embed.position,
      visaNumber: embed.visaNumber,
      issueDate: embed.issueDate,
      placeOfIssue: embed.placeOfIssue,
      photoPath: embed.photoPath,
      phone: embed.phone,
      email: embed.email,
    );
  }

  PatientInfo copyWith({
    String? name,
    int? age,
    String? gender,
    double? height,
    double? weight,
    String? passportNumber,
    String? nationality,
    String? bloodGroup,
    String? position,
    String? visaNumber,
    DateTime? issueDate,
    String? placeOfIssue,
    String? photoPath,
    String? phone,
    String? email,
  }) {
    return PatientInfo(
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      passportNumber: passportNumber ?? this.passportNumber,
      nationality: nationality ?? this.nationality,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      position: position ?? this.position,
      visaNumber: visaNumber ?? this.visaNumber,
      issueDate: issueDate ?? this.issueDate,
      placeOfIssue: placeOfIssue ?? this.placeOfIssue,
      photoPath: photoPath ?? this.photoPath,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  PatientInfoEmbed toEmbed() {
    return PatientInfoEmbed()
      ..name = name
      ..age = age
      ..gender = gender
      ..height = height
      ..weight = weight
      ..passportNumber = passportNumber
      ..nationality = nationality
      ..bloodGroup = bloodGroup
      ..position = position
      ..visaNumber = visaNumber
      ..issueDate = issueDate
      ..placeOfIssue = placeOfIssue
      ..photoPath = photoPath
      ..phone = phone
      ..email = email;
  }
}

class MedicalExam {
  final String? eyeRight;
  final String? eyeLeft;
  final String? eyeRemarks;
  final String? earRight;
  final String? earLeft;
  final String? earRemarks;
  final String? cardiovascular;
  final String? bloodPressure;
  final String? heart;
  final String? respiratory;
  final String? chestXRay;
  final String? tuberculosis;
  final String? gastroIntestinal;
  final String? abdomen;
  final String? hernia;
  final String? varicoseVeins;
  final String? extremities;
  final String? deformities;
  final String? skin;
  final String? venerealDiseases;
  final String? clinicalRemarks;

  const MedicalExam({
    this.eyeRight,
    this.eyeLeft,
    this.eyeRemarks,
    this.earRight,
    this.earLeft,
    this.earRemarks,
    this.cardiovascular,
    this.bloodPressure,
    this.heart,
    this.respiratory,
    this.chestXRay,
    this.tuberculosis,
    this.gastroIntestinal,
    this.abdomen,
    this.hernia,
    this.varicoseVeins,
    this.extremities,
    this.deformities,
    this.skin,
    this.venerealDiseases,
    this.clinicalRemarks,
  });

  // Convenience getters mapping to standard GAMCA fields
  String? get eyeVisionRight => eyeRight;
  String? get eyeVisionLeft => eyeLeft;
  String? get colorVision => eyeRemarks;
  String? get centralNervousSystem => clinicalRemarks;
  String? get psychiatric => venerealDiseases;
  String? get gastrointestinal => gastroIntestinal;

  factory MedicalExam.fromEmbed(MedicalExamEmbed? embed) {
    if (embed == null) return const MedicalExam();
    return MedicalExam(
      eyeRight: embed.eyeRight,
      eyeLeft: embed.eyeLeft,
      eyeRemarks: embed.eyeRemarks,
      earRight: embed.earRight,
      earLeft: embed.earLeft,
      earRemarks: embed.earRemarks,
      cardiovascular: embed.cardiovascular,
      bloodPressure: embed.bloodPressure,
      heart: embed.heart,
      respiratory: embed.respiratory,
      chestXRay: embed.chestXRay,
      tuberculosis: embed.tuberculosis,
      gastroIntestinal: embed.gastroIntestinal,
      abdomen: embed.abdomen,
      hernia: embed.hernia,
      varicoseVeins: embed.varicoseVeins,
      extremities: embed.extremities,
      deformities: embed.deformities,
      skin: embed.skin,
      venerealDiseases: embed.venerealDiseases,
      clinicalRemarks: embed.clinicalRemarks,
    );
  }

  MedicalExam copyWith({
    String? eyeRight,
    String? eyeLeft,
    String? eyeRemarks,
    String? earRight,
    String? earLeft,
    String? earRemarks,
    String? cardiovascular,
    String? bloodPressure,
    String? heart,
    String? respiratory,
    String? chestXRay,
    String? tuberculosis,
    String? gastroIntestinal,
    String? abdomen,
    String? hernia,
    String? varicoseVeins,
    String? extremities,
    String? deformities,
    String? skin,
    String? venerealDiseases,
    String? clinicalRemarks,
    // Convenience aliases
    String? eyeVisionRight,
    String? eyeVisionLeft,
    String? colorVision,
    String? centralNervousSystem,
    String? psychiatric,
    String? gastrointestinal,
  }) {
    return MedicalExam(
      eyeRight: eyeVisionRight ?? eyeRight ?? this.eyeRight,
      eyeLeft: eyeVisionLeft ?? eyeLeft ?? this.eyeLeft,
      eyeRemarks: colorVision ?? eyeRemarks ?? this.eyeRemarks,
      earRight: earRight ?? this.earRight,
      earLeft: earLeft ?? this.earLeft,
      earRemarks: earRemarks ?? this.earRemarks,
      cardiovascular: cardiovascular ?? this.cardiovascular,
      bloodPressure: bloodPressure ?? this.bloodPressure,
      heart: heart ?? this.heart,
      respiratory: respiratory ?? this.respiratory,
      chestXRay: chestXRay ?? this.chestXRay,
      tuberculosis: tuberculosis ?? this.tuberculosis,
      gastroIntestinal: gastrointestinal ?? gastroIntestinal ?? this.gastroIntestinal,
      abdomen: abdomen ?? this.abdomen,
      hernia: hernia ?? this.hernia,
      varicoseVeins: varicoseVeins ?? this.varicoseVeins,
      extremities: extremities ?? this.extremities,
      deformities: deformities ?? this.deformities,
      skin: skin ?? this.skin,
      venerealDiseases: psychiatric ?? venerealDiseases ?? this.venerealDiseases,
      clinicalRemarks: centralNervousSystem ?? clinicalRemarks ?? this.clinicalRemarks,
    );
  }

  MedicalExamEmbed toEmbed() {
    return MedicalExamEmbed()
      ..eyeRight = eyeRight
      ..eyeLeft = eyeLeft
      ..eyeRemarks = eyeRemarks
      ..earRight = earRight
      ..earLeft = earLeft
      ..earRemarks = earRemarks
      ..cardiovascular = cardiovascular
      ..bloodPressure = bloodPressure
      ..heart = heart
      ..respiratory = respiratory
      ..chestXRay = chestXRay
      ..tuberculosis = tuberculosis
      ..gastroIntestinal = gastroIntestinal
      ..abdomen = abdomen
      ..hernia = hernia
      ..varicoseVeins = varicoseVeins
      ..extremities = extremities
      ..deformities = deformities
      ..skin = skin
      ..venerealDiseases = venerealDiseases
      ..clinicalRemarks = clinicalRemarks;
  }
}

class LabInvestigation {
  final String? urineSugar;
  final String? urineAlbumin;
  final String? urineBilharziasis;
  final String? stoolOva;
  final String? stoolCyst;
  final String? stoolBlood;
  final String? stoolHelminthes;
  final String? stoolGiardia;
  final String? stoolBilharziasis;
  final String? stoolSalmonella;
  final String? stoolShigella;
  final String? stoolCholera;
  final double? bloodHemoglobin;
  final double? bloodTlc;
  final double? bloodWbc;
  final double? bloodEsr;
  final double? bloodSgpt;
  final double? bloodUrea;
  final double? bloodUricAcid;
  final String? bloodMalaria;
  final String? bloodMicroFilaria;
  final double? serologyPp2bs;
  final double? serologyFbs;
  final String? serologyLft;
  final double? serologyCreatinine;
  final double? serologyPlateletCount;
  final double? lipidCholesterol;
  final double? lipidTry;
  final double? lipidHdl;
  final double? lipidLdl;
  final String? lipidG6pd;
  final String? elisaHiv;
  final String? elisaHbsAg;
  final String? elisaAntiHcv;
  final String? elisaVdrl;
  final String? elisaTpha;

  const LabInvestigation({
    this.urineSugar,
    this.urineAlbumin,
    this.urineBilharziasis,
    this.stoolOva,
    this.stoolCyst,
    this.stoolBlood,
    this.stoolHelminthes,
    this.stoolGiardia,
    this.stoolBilharziasis,
    this.stoolSalmonella,
    this.stoolShigella,
    this.stoolCholera,
    this.bloodHemoglobin,
    this.bloodTlc,
    this.bloodWbc,
    this.bloodEsr,
    this.bloodSgpt,
    this.bloodUrea,
    this.bloodUricAcid,
    this.bloodMalaria,
    this.bloodMicroFilaria,
    this.serologyPp2bs,
    this.serologyFbs,
    this.serologyLft,
    this.serologyCreatinine,
    this.serologyPlateletCount,
    this.lipidCholesterol,
    this.lipidTry,
    this.lipidHdl,
    this.lipidLdl,
    this.lipidG6pd,
    this.elisaHiv,
    this.elisaHbsAg,
    this.elisaAntiHcv,
    this.elisaVdrl,
    this.elisaTpha,
  });

  // Convenience getters mapping to standard GAMCA fields
  String? get urineProtein => urineAlbumin;
  String? get urineMicroscopic => urineBilharziasis;
  String? get stoolHelminths => stoolHelminthes;
  String? get stoolProtozoa => stoolGiardia;
  double? get bloodGlucose => serologyFbs;
  double? get liverSgot => bloodUrea;
  double? get liverSgpt => bloodSgpt;
  double? get kidneyCreatinine => serologyCreatinine;
  String? get hivElisa => elisaHiv;
  String? get hbsagElisa => elisaHbsAg;
  String? get hcvElisa => elisaAntiHcv;
  String? get vdrl => elisaVdrl;
  String? get malaria => bloodMalaria;
  String? get microfilaria => bloodMicroFilaria;
  String? get chestXray => serologyLft;

  factory LabInvestigation.fromEmbed(LabInvestigationEmbed? embed) {
    if (embed == null) return const LabInvestigation();
    return LabInvestigation(
      urineSugar: embed.urineSugar,
      urineAlbumin: embed.urineAlbumin,
      urineBilharziasis: embed.urineBilharziasis,
      stoolOva: embed.stoolOva,
      stoolCyst: embed.stoolCyst,
      stoolBlood: embed.stoolBlood,
      stoolHelminthes: embed.stoolHelminthes,
      stoolGiardia: embed.stoolGiardia,
      stoolBilharziasis: embed.stoolBilharziasis,
      stoolSalmonella: embed.stoolSalmonella,
      stoolShigella: embed.stoolShigella,
      stoolCholera: embed.stoolCholera,
      bloodHemoglobin: embed.bloodHemoglobin,
      bloodTlc: embed.bloodTlc,
      bloodWbc: embed.bloodWbc,
      bloodEsr: embed.bloodEsr,
      bloodSgpt: embed.bloodSgpt,
      bloodUrea: embed.bloodUrea,
      bloodUricAcid: embed.bloodUricAcid,
      bloodMalaria: embed.bloodMalaria,
      bloodMicroFilaria: embed.bloodMicroFilaria,
      serologyPp2bs: embed.serologyPp2bs,
      serologyFbs: embed.serologyFbs,
      serologyLft: embed.serologyLft,
      serologyCreatinine: embed.serologyCreatinine,
      serologyPlateletCount: embed.serologyPlateletCount,
      lipidCholesterol: embed.lipidCholesterol,
      lipidTry: embed.lipidTry,
      lipidHdl: embed.lipidHdl,
      lipidLdl: embed.lipidLdl,
      lipidG6pd: embed.lipidG6pd,
      elisaHiv: embed.elisaHiv,
      elisaHbsAg: embed.elisaHbsAg,
      elisaAntiHcv: embed.elisaAntiHcv,
      elisaVdrl: embed.elisaVdrl,
      elisaTpha: embed.elisaTpha,
    );
  }

  LabInvestigation copyWith({
    String? urineSugar,
    String? urineAlbumin,
    String? urineBilharziasis,
    String? stoolOva,
    String? stoolCyst,
    String? stoolBlood,
    String? stoolHelminthes,
    String? stoolGiardia,
    String? stoolBilharziasis,
    String? stoolSalmonella,
    String? stoolShigella,
    String? stoolCholera,
    double? bloodHemoglobin,
    double? bloodTlc,
    double? bloodWbc,
    double? bloodEsr,
    double? bloodSgpt,
    double? bloodUrea,
    double? bloodUricAcid,
    String? bloodMalaria,
    String? bloodMicroFilaria,
    double? serologyPp2bs,
    double? serologyFbs,
    String? serologyLft,
    double? serologyCreatinine,
    double? serologyPlateletCount,
    double? lipidCholesterol,
    double? lipidTry,
    double? lipidHdl,
    double? lipidLdl,
    String? lipidG6pd,
    String? elisaHiv,
    String? elisaHbsAg,
    String? elisaAntiHcv,
    String? elisaVdrl,
    String? elisaTpha,
    // Convenience aliases
    String? urineProtein,
    String? urineMicroscopic,
    String? stoolHelminths,
    String? stoolProtozoa,
    double? bloodGlucose,
    double? liverSgot,
    double? liverSgpt,
    double? kidneyCreatinine,
    String? hivElisa,
    String? hbsagElisa,
    String? hcvElisa,
    String? vdrl,
    String? malaria,
    String? microfilaria,
    String? chestXray,
  }) {
    return LabInvestigation(
      urineSugar: urineSugar ?? this.urineSugar,
      urineAlbumin: urineProtein ?? urineAlbumin ?? this.urineAlbumin,
      urineBilharziasis: urineMicroscopic ?? urineBilharziasis ?? this.urineBilharziasis,
      stoolOva: stoolOva ?? this.stoolOva,
      stoolCyst: stoolCyst ?? this.stoolCyst,
      stoolBlood: stoolBlood ?? this.stoolBlood,
      stoolHelminthes: stoolHelminths ?? stoolHelminthes ?? this.stoolHelminthes,
      stoolGiardia: stoolProtozoa ?? stoolGiardia ?? this.stoolGiardia,
      stoolBilharziasis: stoolBilharziasis ?? this.stoolBilharziasis,
      stoolSalmonella: stoolSalmonella ?? this.stoolSalmonella,
      stoolShigella: stoolShigella ?? this.stoolShigella,
      stoolCholera: stoolCholera ?? this.stoolCholera,
      bloodHemoglobin: bloodHemoglobin ?? this.bloodHemoglobin,
      bloodTlc: bloodTlc ?? this.bloodTlc,
      bloodWbc: bloodWbc ?? this.bloodWbc,
      bloodEsr: bloodEsr ?? this.bloodEsr,
      bloodSgpt: liverSgpt ?? bloodSgpt ?? this.bloodSgpt,
      bloodUrea: liverSgot ?? bloodUrea ?? this.bloodUrea,
      bloodUricAcid: bloodUricAcid ?? this.bloodUricAcid,
      bloodMalaria: malaria ?? bloodMalaria ?? this.bloodMalaria,
      bloodMicroFilaria: microfilaria ?? bloodMicroFilaria ?? this.bloodMicroFilaria,
      serologyPp2bs: serologyPp2bs ?? this.serologyPp2bs,
      serologyFbs: bloodGlucose ?? serologyFbs ?? this.serologyFbs,
      serologyLft: chestXray ?? serologyLft ?? this.serologyLft,
      serologyCreatinine: kidneyCreatinine ?? serologyCreatinine ?? this.serologyCreatinine,
      serologyPlateletCount: serologyPlateletCount ?? this.serologyPlateletCount,
      lipidCholesterol: lipidCholesterol ?? this.lipidCholesterol,
      lipidTry: lipidTry ?? this.lipidTry,
      lipidHdl: lipidHdl ?? this.lipidHdl,
      lipidLdl: lipidLdl ?? this.lipidLdl,
      lipidG6pd: lipidG6pd ?? this.lipidG6pd,
      elisaHiv: hivElisa ?? elisaHiv ?? this.elisaHiv,
      elisaHbsAg: hbsagElisa ?? elisaHbsAg ?? this.elisaHbsAg,
      elisaAntiHcv: hcvElisa ?? elisaAntiHcv ?? this.elisaAntiHcv,
      elisaVdrl: vdrl ?? elisaVdrl ?? this.elisaVdrl,
      elisaTpha: elisaTpha ?? this.elisaTpha,
    );
  }

  LabInvestigationEmbed toEmbed() {
    return LabInvestigationEmbed()
      ..urineSugar = urineSugar
      ..urineAlbumin = urineAlbumin
      ..urineBilharziasis = urineBilharziasis
      ..stoolOva = stoolOva
      ..stoolCyst = stoolCyst
      ..stoolBlood = stoolBlood
      ..stoolHelminthes = stoolHelminthes
      ..stoolGiardia = stoolGiardia
      ..stoolBilharziasis = stoolBilharziasis
      ..stoolSalmonella = stoolSalmonella
      ..stoolShigella = stoolShigella
      ..stoolCholera = stoolCholera
      ..bloodHemoglobin = bloodHemoglobin
      ..bloodTlc = bloodTlc
      ..bloodWbc = bloodWbc
      ..bloodEsr = bloodEsr
      ..bloodSgpt = bloodSgpt
      ..bloodUrea = bloodUrea
      ..bloodUricAcid = bloodUricAcid
      ..bloodMalaria = bloodMalaria
      ..bloodMicroFilaria = bloodMicroFilaria
      ..serologyPp2bs = serologyPp2bs
      ..serologyFbs = serologyFbs
      ..serologyLft = serologyLft
      ..serologyCreatinine = serologyCreatinine
      ..serologyPlateletCount = serologyPlateletCount
      ..lipidCholesterol = lipidCholesterol
      ..lipidTry = lipidTry
      ..lipidHdl = lipidHdl
      ..lipidLdl = lipidLdl
      ..lipidG6pd = lipidG6pd
      ..elisaHiv = elisaHiv
      ..elisaHbsAg = elisaHbsAg
      ..elisaAntiHcv = elisaAntiHcv
      ..elisaVdrl = elisaVdrl
      ..elisaTpha = elisaTpha;
  }
}

class Report {
  final int? id;
  final String serialNumber;
  final DateTime examDate;
  final ReportStatus status;
  final int patientId;
  final int doctorId;
  final int clinicId;
  final String? templateId;
  final String? remarks;
  final String? pdfPath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final PatientInfo patientInfo;
  final MedicalExam medicalExam;
  final LabInvestigation labInvestigation;

  Report({
    this.id,
    required this.serialNumber,
    required this.examDate,
    this.status = ReportStatus.draft,
    this.patientId = 0,
    this.doctorId = 0,
    this.clinicId = 0,
    this.templateId,
    this.remarks,
    this.pdfPath,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.patientInfo = const PatientInfo(),
    this.medicalExam = const MedicalExam(),
    this.labInvestigation = const LabInvestigation(),
  })  : createdAt = createdAt ?? examDate,
        updatedAt = updatedAt ?? examDate;

  Report copyWith({
    int? id,
    String? serialNumber,
    DateTime? examDate,
    ReportStatus? status,
    int? patientId,
    int? doctorId,
    int? clinicId,
    String? templateId,
    String? remarks,
    String? pdfPath,
    DateTime? createdAt,
    DateTime? updatedAt,
    PatientInfo? patientInfo,
    MedicalExam? medicalExam,
    LabInvestigation? labInvestigation,
  }) {
    return Report(
      id: id ?? this.id,
      serialNumber: serialNumber ?? this.serialNumber,
      examDate: examDate ?? this.examDate,
      status: status ?? this.status,
      patientId: patientId ?? this.patientId,
      doctorId: doctorId ?? this.doctorId,
      clinicId: clinicId ?? this.clinicId,
      templateId: templateId ?? this.templateId,
      remarks: remarks ?? this.remarks,
      pdfPath: pdfPath ?? this.pdfPath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      patientInfo: patientInfo ?? this.patientInfo,
      medicalExam: medicalExam ?? this.medicalExam,
      labInvestigation: labInvestigation ?? this.labInvestigation,
    );
  }

  factory Report.fromCollection(ReportCollection col) {
    return Report(
      id: col.id,
      serialNumber: col.serialNumber,
      examDate: col.examDate,
      status: ReportStatus.values.firstWhere(
        (e) => e.name.toUpperCase() == col.status.toUpperCase(),
        orElse: () => ReportStatus.draft,
      ),
      patientId: col.patientId,
      doctorId: col.doctorId,
      clinicId: col.clinicId,
      templateId: col.templateId,
      remarks: col.remarks,
      pdfPath: col.pdfPath,
      createdAt: col.createdAt,
      updatedAt: col.updatedAt,
      patientInfo: PatientInfo.fromEmbed(col.patientInfo),
      medicalExam: MedicalExam.fromEmbed(col.medicalExam),
      labInvestigation: LabInvestigation.fromEmbed(col.labInvestigation),
    );
  }

  ReportCollection toCollection() {
    final col = ReportCollection()
      ..serialNumber = serialNumber
      ..examDate = examDate
      ..status = status.name.toUpperCase()
      ..patientId = patientId
      ..doctorId = doctorId
      ..clinicId = clinicId
      ..templateId = templateId
      ..remarks = remarks
      ..pdfPath = pdfPath
      ..createdAt = createdAt
      ..updatedAt = updatedAt
      ..patientInfo = patientInfo.toEmbed()
      ..medicalExam = medicalExam.toEmbed()
      ..labInvestigation = labInvestigation.toEmbed();
    if (id != null) col.id = id!;
    return col;
  }

  DateTime get examinationDate => examDate;
  String? get patientName => patientInfo.name;
  String? get passportNumber => patientInfo.passportNumber;
  String? get finalStatus {
    if (remarks != null && remarks!.isNotEmpty) {
      if (remarks!.toUpperCase().contains('FIT') || remarks!.toUpperCase().contains('NORMAL')) return 'FIT';
      if (remarks!.toUpperCase().contains('UNFIT') || remarks!.toUpperCase().contains('ABNORMAL')) return 'UNFIT';
      return remarks;
    }
    return status == ReportStatus.completed || status == ReportStatus.printed ? 'FIT' : 'PENDING';
  }
}

typedef MedicalReport = Report;

class Doctor {
  final int? id;
  final String name;
  final String qualifications;
  final String designation;
  final String? signaturePath;
  final bool isActive;

  const Doctor({
    this.id,
    required this.name,
    required this.qualifications,
    required this.designation,
    this.signaturePath,
    required this.isActive,
  });

  factory Doctor.fromCollection(DoctorCollection col) {
    return Doctor(
      id: col.id,
      name: col.name,
      qualifications: col.qualifications,
      designation: col.designation,
      signaturePath: col.signaturePath,
      isActive: col.isActive,
    );
  }

  DoctorCollection toCollection() {
    final col = DoctorCollection()
      ..name = name
      ..qualifications = qualifications
      ..designation = designation
      ..signaturePath = signaturePath
      ..isActive = isActive;
    if (id != null) col.id = id!;
    return col;
  }
}

class Clinic {
  final int? id;
  final String name;
  final String? subtitle;
  final String address;
  final String? phone;
  final String? email;
  final String? logoPath;
  final String? stampPath;
  final String? registrationNumbers;

  const Clinic({
    this.id,
    required this.name,
    this.subtitle,
    required this.address,
    this.phone,
    this.email,
    this.logoPath,
    this.stampPath,
    this.registrationNumbers,
  });

  factory Clinic.fromCollection(ClinicCollection col) {
    return Clinic(
      id: col.id,
      name: col.name,
      subtitle: col.subtitle,
      address: col.address,
      phone: col.phone,
      email: col.email,
      logoPath: col.logoPath,
      stampPath: col.stampPath,
      registrationNumbers: col.registrationNumbers,
    );
  }

  ClinicCollection toCollection() {
    final col = ClinicCollection()
      ..name = name
      ..subtitle = subtitle
      ..address = address
      ..phone = phone
      ..email = email
      ..logoPath = logoPath
      ..stampPath = stampPath
      ..registrationNumbers = registrationNumbers;
    if (id != null) col.id = id!;
    return col;
  }
}

class Template {
  final int? id;
  final String name;
  final String? description;
  final String type;
  final bool isDefault;
  final String layoutJson;
  final DateTime createdAt;

  const Template({
    this.id,
    required this.name,
    this.description,
    required this.type,
    required this.isDefault,
    required this.layoutJson,
    required this.createdAt,
  });

  factory Template.fromCollection(TemplateCollection col) {
    return Template(
      id: col.id,
      name: col.name,
      description: col.description,
      type: col.type,
      isDefault: col.isDefault,
      layoutJson: col.layoutJson,
      createdAt: col.createdAt,
    );
  }

  TemplateCollection toCollection() {
    final col = TemplateCollection()
      ..name = name
      ..description = description
      ..type = type
      ..isDefault = isDefault
      ..layoutJson = layoutJson
      ..createdAt = createdAt;
    if (id != null) col.id = id!;
    return col;
  }

  Template copyWith({
    int? id,
    String? name,
    String? description,
    String? type,
    bool? isDefault,
    String? layoutJson,
    DateTime? createdAt,
  }) {
    return Template(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      isDefault: isDefault ?? this.isDefault,
      layoutJson: layoutJson ?? this.layoutJson,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class LabTest {
  final int? id;
  final String name;
  final String unit;
  final double referenceMin;
  final double referenceMax;
  final String category;

  const LabTest({
    this.id,
    required this.name,
    required this.unit,
    required this.referenceMin,
    required this.referenceMax,
    required this.category,
  });

  factory LabTest.fromCollection(LabTestCollection col) {
    return LabTest(
      id: col.id,
      name: col.name,
      unit: col.unit,
      referenceMin: col.referenceMin,
      referenceMax: col.referenceMax,
      category: col.category,
    );
  }

  LabTestCollection toCollection() {
    final col = LabTestCollection()
      ..name = name
      ..unit = unit
      ..referenceMin = referenceMin
      ..referenceMax = referenceMax
      ..category = category;
    if (id != null) col.id = id!;
    return col;
  }
}

typedef LabTestDefinition = LabTest;

extension LabTestHelper on LabTest {
  String get referenceRange => '$referenceMin - $referenceMax';
  String get defaultUnit => unit;
  bool get isMandatory => true;
}

class MasterDataSetup {
  final String? id;
  final List<String> medicalHistoryOptions;
  final List<String> physicalExamParameters;
  final List<LabTestDefinition> labTests;

  const MasterDataSetup({
    this.id,
    required this.medicalHistoryOptions,
    required this.physicalExamParameters,
    required this.labTests,
  });

  factory MasterDataSetup.defaults() {
    return const MasterDataSetup(
      id: 'default',
      medicalHistoryOptions: [
        'Tuberculosis / Pulmonary Disease',
        'Hypertension / Cardiac Illness',
        'Diabetes Mellitus / Endocrine Disorder',
        'Epilepsy / Neurological Disorder',
        'Psychiatric / Mental Illness',
        'Leprosy / Skin Disease',
        'Sexually Transmitted Infection (STI)',
        'Allergy / Drug Sensitivity',
        'Major Surgery / Hospitalization',
      ],
      physicalExamParameters: [
        'General Appearance & Nutrition',
        'Cardiovascular System (CVS)',
        'Respiratory System (Chest)',
        'Gastrointestinal System (Abdomen)',
        'Central Nervous System (CNS)',
        'Musculoskeletal System & Spine',
        'Skin & Lymph Nodes',
        'Visual Acuity & Color Vision',
        'Hearing & Ear Examination',
      ],
      labTests: [
        LabTest(id: 1, name: 'Hemoglobin (Hb)', unit: 'g/dL', referenceMin: 12.0, referenceMax: 18.0, category: 'Hematology'),
        LabTest(id: 2, name: 'WBC Count', unit: '/cu mm', referenceMin: 4000.0, referenceMax: 11000.0, category: 'Hematology'),
        LabTest(id: 3, name: 'Fasting Blood Sugar (FBS)', unit: 'mg/dL', referenceMin: 70.0, referenceMax: 110.0, category: 'Biochemistry'),
        LabTest(id: 4, name: 'SGPT / ALT', unit: 'U/L', referenceMin: 5.0, referenceMax: 40.0, category: 'Biochemistry'),
        LabTest(id: 5, name: 'Serum Creatinine', unit: 'mg/dL', referenceMin: 0.6, referenceMax: 1.3, category: 'Biochemistry'),
        LabTest(id: 6, name: 'HIV 1 & 2 ELISA', unit: 'Index', referenceMin: 0.0, referenceMax: 0.99, category: 'Serology'),
        LabTest(id: 7, name: 'HBsAg ELISA', unit: 'Index', referenceMin: 0.0, referenceMax: 0.99, category: 'Serology'),
        LabTest(id: 8, name: 'Anti-HCV ELISA', unit: 'Index', referenceMin: 0.0, referenceMax: 0.99, category: 'Serology'),
        LabTest(id: 9, name: 'VDRL / RPR', unit: 'Titer', referenceMin: 0.0, referenceMax: 0.0, category: 'Serology'),
        LabTest(id: 10, name: 'Urine Albumin', unit: '-', referenceMin: 0.0, referenceMax: 0.0, category: 'Urine Analysis'),
        LabTest(id: 11, name: 'Urine Sugar', unit: '-', referenceMin: 0.0, referenceMax: 0.0, category: 'Urine Analysis'),
      ],
    );
  }

  MasterDataSetup copyWith({
    String? id,
    List<String>? medicalHistoryOptions,
    List<String>? physicalExamParameters,
    List<LabTestDefinition>? labTests,
  }) {
    return MasterDataSetup(
      id: id ?? this.id,
      medicalHistoryOptions: medicalHistoryOptions ?? this.medicalHistoryOptions,
      physicalExamParameters: physicalExamParameters ?? this.physicalExamParameters,
      labTests: labTests ?? this.labTests,
    );
  }
}

class MedicalSection {
  final int? id;
  final String name;
  final String fieldsJson;
  final int sortOrder;

  const MedicalSection({
    this.id,
    required this.name,
    required this.fieldsJson,
    required this.sortOrder,
  });

  factory MedicalSection.fromCollection(MedicalSectionCollection col) {
    return MedicalSection(
      id: col.id,
      name: col.name,
      fieldsJson: col.fieldsJson,
      sortOrder: col.sortOrder,
    );
  }

  MedicalSectionCollection toCollection() {
    final col = MedicalSectionCollection()
      ..name = name
      ..fieldsJson = fieldsJson
      ..sortOrder = sortOrder;
    if (id != null) col.id = id!;
    return col;
  }
}

class Company {
  final int? id;
  final String name;
  final String? address;
  final String? contactPerson;
  final String? phone;

  const Company({
    this.id,
    required this.name,
    this.address,
    this.contactPerson,
    this.phone,
  });

  factory Company.fromCollection(CompanyCollection col) {
    return Company(
      id: col.id,
      name: col.name,
      address: col.address,
      contactPerson: col.contactPerson,
      phone: col.phone,
    );
  }

  CompanyCollection toCollection() {
    final col = CompanyCollection()
      ..name = name
      ..address = address
      ..contactPerson = contactPerson
      ..phone = phone;
    if (id != null) col.id = id!;
    return col;
  }
}

class AuditLog {
  final int? id;
  final String action;
  final String entityType;
  final int entityId;
  final String userId;
  final String details;
  final DateTime timestamp;

  const AuditLog({
    this.id,
    required this.action,
    required this.entityType,
    required this.entityId,
    required this.userId,
    required this.details,
    required this.timestamp,
  });

  factory AuditLog.fromCollection(AuditLogCollection col) {
    return AuditLog(
      id: col.id,
      action: col.action,
      entityType: col.entityType,
      entityId: col.entityId,
      userId: col.userId,
      details: col.details,
      timestamp: col.timestamp,
    );
  }

  AuditLogCollection toCollection() {
    final col = AuditLogCollection()
      ..action = action
      ..entityType = entityType
      ..entityId = entityId
      ..userId = userId
      ..details = details
      ..timestamp = timestamp;
    if (id != null) col.id = id!;
    return col;
  }
}

enum ReportLayoutType { standard, compact, detailed }

class ReportTemplate {
  final String id;
  final String name;
  final ReportLayoutType layoutType;
  final String headerTitle;
  final String clinicName;
  final String clinicAddress;
  final String clinicPhone;
  final bool isDefault;
  final DateTime createdAt;

  const ReportTemplate({
    required this.id,
    required this.name,
    required this.layoutType,
    required this.headerTitle,
    required this.clinicName,
    required this.clinicAddress,
    required this.clinicPhone,
    required this.isDefault,
    required this.createdAt,
  });

  Template toTemplate() {
    return Template(
      id: int.tryParse(id),
      name: name,
      description: '$headerTitle|$clinicName|$clinicAddress|$clinicPhone',
      type: layoutType.name,
      isDefault: isDefault,
      layoutJson: '{"layoutType":"${layoutType.name}"}',
      createdAt: createdAt,
    );
  }

  factory ReportTemplate.fromTemplate(Template t) {
    final parts = (t.description ?? '').split('|');
    ReportLayoutType lType = ReportLayoutType.standard;
    if (t.type == 'compact') lType = ReportLayoutType.compact;
    if (t.type == 'detailed') lType = ReportLayoutType.detailed;

    return ReportTemplate(
      id: t.id?.toString() ?? '0',
      name: t.name,
      layoutType: lType,
      headerTitle: parts.isNotEmpty ? parts[0] : 'MEDICAL EXAMINATION REPORT',
      clinicName: parts.length > 1 ? parts[1] : 'SHANTI CLINIC',
      clinicAddress: parts.length > 2 ? parts[2] : '',
      clinicPhone: parts.length > 3 ? parts[3] : '',
      isDefault: t.isDefault,
      createdAt: t.createdAt,
    );
  }

  ReportTemplate copyWith({
    String? id,
    String? name,
    ReportLayoutType? layoutType,
    String? headerTitle,
    String? clinicName,
    String? clinicAddress,
    String? clinicPhone,
    bool? isDefault,
    DateTime? createdAt,
  }) {
    return ReportTemplate(
      id: id ?? this.id,
      name: name ?? this.name,
      layoutType: layoutType ?? this.layoutType,
      headerTitle: headerTitle ?? this.headerTitle,
      clinicName: clinicName ?? this.clinicName,
      clinicAddress: clinicAddress ?? this.clinicAddress,
      clinicPhone: clinicPhone ?? this.clinicPhone,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class AppSettings {
  final String serialPrefix;
  final int nextSerialNumber;
  final String clinicName;
  final String clinicAddress;
  final String defaultDoctorName;
  final String doctorQualifications;
  final bool enableAutoBackup;
  final String themeMode;

  const AppSettings({
    required this.serialPrefix,
    required this.nextSerialNumber,
    required this.clinicName,
    required this.clinicAddress,
    required this.defaultDoctorName,
    required this.doctorQualifications,
    required this.enableAutoBackup,
    this.themeMode = 'light',
  });

  factory AppSettings.defaults() => const AppSettings(
        serialPrefix: '2026/',
        nextSerialNumber: 1001,
        clinicName: 'SHANTI CLINIC',
        clinicAddress: '123 Medical Center Way, Health District',
        defaultDoctorName: 'Dr. Rajesh Sharma',
        doctorQualifications: 'MBBS, MD (General Medicine)',
        enableAutoBackup: true,
        themeMode: 'light',
      );

  AppSettings copyWith({
    String? serialPrefix,
    int? nextSerialNumber,
    String? clinicName,
    String? clinicAddress,
    String? defaultDoctorName,
    String? doctorQualifications,
    bool? enableAutoBackup,
    String? themeMode,
  }) {
    return AppSettings(
      serialPrefix: serialPrefix ?? this.serialPrefix,
      nextSerialNumber: nextSerialNumber ?? this.nextSerialNumber,
      clinicName: clinicName ?? this.clinicName,
      clinicAddress: clinicAddress ?? this.clinicAddress,
      defaultDoctorName: defaultDoctorName ?? this.defaultDoctorName,
      doctorQualifications: doctorQualifications ?? this.doctorQualifications,
      enableAutoBackup: enableAutoBackup ?? this.enableAutoBackup,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
