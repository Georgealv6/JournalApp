class Journal {
  List<Journal> entries;
  String entry;
  String note;
  bool completed;
  int journalId;

  Journal(this.completed, this.journalId, this.note, this.entry);
}
