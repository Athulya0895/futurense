import 'package:futurensemobileapp/models/user_model.dart';

class FilterModel {
  SkillsetModel? selectedSkillset;
  JobttileModel? selectedJobtitle;
  DomainExpertiseModel? selectedDomain;
  ExperienceModel? selectedExperience;
  FilterModel(
      {this.selectedSkillset,
      this.selectedJobtitle,
      this.selectedDomain,
      this.selectedExperience});
}
