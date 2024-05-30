class AssignedTo {
  final int idUser;
  final int idTask;
  final String assignedDate;

  AssignedTo({
    required this.idUser,
    required this.idTask,
    required this.assignedDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_user': idUser,
      'id_task': idTask,
      'assignedDate': assignedDate,
    };
  }
}