enum HttpMethod {
  get('GET'),
  post('POST'),
  delete('DELETE'),
  put('PUT'),
  patch('PATCH');

  const HttpMethod(this.methodName);

  final String methodName;
}
