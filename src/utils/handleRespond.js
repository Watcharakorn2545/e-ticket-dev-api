export default function handleResponse(
  res,
  code,
  result,
  message,
  data,
  option = {}
) {
  const responsePayload = {
    code,
    result,
    message,
    data,
    ...option,
  };
  res.status(code === 204 ? 200 : code).send(responsePayload);
  return responsePayload;
}
