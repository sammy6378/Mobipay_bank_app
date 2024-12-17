class SettingsModel {
  final bool darkMode;
  final bool offlineMode;
  final String audioQuality;
  final bool autoDownload;
  final bool dataSaver;

  SettingsModel({
    this.darkMode = false,
    this.offlineMode = false,
    this.audioQuality = 'high',
    this.autoDownload = false,
    this.dataSaver = false,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
      darkMode: json['darkMode'] ?? false,
      offlineMode: json['offlineMode'] ?? false,
      audioQuality: json['audioQuality'] ?? 'high',
      autoDownload: json['autoDownload'] ?? false,
      dataSaver: json['dataSaver'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'darkMode': darkMode,
      'offlineMode': offlineMode,
      'audioQuality': audioQuality,
      'autoDownload': autoDownload,
      'dataSaver': dataSaver,
    };
  }

  SettingsModel copyWith({
    bool? darkMode,
    bool? offlineMode,
    String? audioQuality,
    bool? autoDownload,
    bool? dataSaver,
  }) {
    return SettingsModel(
      darkMode: darkMode ?? this.darkMode,
      offlineMode: offlineMode ?? this.offlineMode,
      audioQuality: audioQuality ?? this.audioQuality,
      autoDownload: autoDownload ?? this.autoDownload,
      dataSaver: dataSaver ?? this.dataSaver,
    );
  }
}