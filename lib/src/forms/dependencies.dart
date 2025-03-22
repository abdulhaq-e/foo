abstract class FormSubmissionDelegate<Response> {
  void onSubmissionSuccess(Response response);
}

class FormSubmissionDelegateWrapper<Response>
    implements FormSubmissionDelegate<Response> {
  void Function(Response) callback;
  FormSubmissionDelegateWrapper(void Function(Response) this.callback);

  @override
  void onSubmissionSuccess(Response response) {
    callback(response);
  }
}
