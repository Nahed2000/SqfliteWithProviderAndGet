abstract class CrudEvent {}

class CreateEvent<T> extends CrudEvent {
  final T object;

  CreateEvent(this.object);
}

class DeleteEvent extends CrudEvent {
  final int id;

  DeleteEvent(this.id);
}

class UpdateEvent<T> extends CrudEvent {
  final T object;

  UpdateEvent(this.object);
}

class ReadEvent extends CrudEvent {}

class LoadingEvent extends CrudEvent {}
class DefaultEvent extends CrudEvent {}
