class EmployeeProject {
  final int empID;
  final int projectID;
  final DateTime dateFrom;
  final DateTime dateTo;

  EmployeeProject({
    required this.empID,
    required this.projectID,
    required this.dateFrom,
    required this.dateTo,
  });
}

Map<String, int> findDaysWorkedTogether(List<EmployeeProject> data) {
  final pairs = <String, int>{};

  for (int i = 0; i < data.length; i++) {
    for (int j = i + 1; j < data.length; j++) {
      if (data[i].projectID == data[j].projectID) {
        final dateFrom1 = data[i].dateFrom;
        final dateTo1 = data[i].dateTo;
        final dateFrom2 = data[j].dateFrom;
        final dateTo2 = data[j].dateTo;

        // Calculate the overlap between date ranges
        final overlapStart =
            dateFrom1.isBefore(dateFrom2) ? dateFrom2 : dateFrom1;
        final overlapEnd = dateTo1.isBefore(dateTo2) ? dateTo1 : dateTo2;

        if (overlapStart.isBefore(overlapEnd)) {
          // Calculate the number of days worked together
          final daysWorked = overlapEnd.difference(overlapStart).inDays;

          final pairKey = '${data[i].empID}-${data[j].empID}';

          if (!pairs.containsKey(pairKey) || pairs[pairKey]! < daysWorked) {
            pairs[pairKey] = daysWorked;
          }
        }
      }
    }
  }

  return pairs;
}

void main() {
  final data = [
    EmployeeProject(
        empID: 143,
        projectID: 12,
        dateFrom: DateTime(2013, 11, 1),
        dateTo: DateTime(2014, 1, 5)),
    // EmployeeProject(empID: 218, projectID: 10, dateFrom: DateTime(2012, 5, 16), dateTo: null),
    EmployeeProject(
        empID: 143,
        projectID: 10,
        dateFrom: DateTime(2009, 1, 1),
        dateTo: DateTime(2011, 4, 27)),
  ];

  final result = findDaysWorkedTogether(data);
  print(result);
}
