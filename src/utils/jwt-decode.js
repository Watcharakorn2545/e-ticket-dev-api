import { verify } from 'jsonwebtoken';

// Function to decode JWT token
function decodeJWT(token) {
  try {
    const decoded = verify(token, process.env.JWT_SECRET);
    return decoded;
  } catch (error) {
    console.error('Error decoding JWT token:', error.message);
    return null;
  }
}

// Export the decoding function
export default decodeJWT;
