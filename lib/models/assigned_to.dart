class AssignedTo {
  final int idUser;
  final int idTask;
  final DateTime assignedDate;
  final bool isFinished;

  AssignedTo({
    required this.idUser,
    required this.idTask,
    required this.assignedDate,
    required this.isFinished,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_user': idUser,
      'id_task': idTask,
      'assigned_date': assignedDate,
      'is_finished': isFinished,
    };
  }
}