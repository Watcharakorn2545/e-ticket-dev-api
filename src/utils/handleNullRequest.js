export default function handleNullRequest(res, body, requiredKeys) {
  for (let key of requiredKeys) {
    if (body[key] === null || body[key] === "" || body[key] === undefined) {
      return `${key} is required`;
    }
  }
}