
function isTokenExpired(token,JWT) {
    try {
      const decodedToken = JWT.decode(token);
      const expirationTime = new Date(decodedToken.exp * 1000); // Convert expiration timestamp to milliseconds
      const currentTime = new Date();
      return currentTime > expirationTime;
    } catch (error) {
      // Handle invalid or malformed token
      return true;
    }
}