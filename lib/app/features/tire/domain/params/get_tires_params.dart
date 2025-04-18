class GetTiresParams {
  final int branchOfficesId;
  final int pageSize;
  final int pageNumber;
  final bool? showLoading;
  GetTiresParams({
    required this.branchOfficesId,
    required this.pageSize,
    required this.pageNumber,
    this.showLoading = true,
  });
}
