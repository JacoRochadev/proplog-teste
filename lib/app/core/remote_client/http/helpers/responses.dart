class GetHttpServiceResponse<T> {
  final T? data;
  final int? status;

  const GetHttpServiceResponse({
    required this.data,
    this.status,
  });
}

class PostHttpServiceResponse<T> {
  final T? data;
  final int? status;

  const PostHttpServiceResponse({
    required this.data,
    required this.status,
  });
}

class DeleteHttpServiceResponse<T> {
  final T? data;

  const DeleteHttpServiceResponse({
    required this.data,
  });
}
