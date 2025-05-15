/**
 * The custom logic attached to the Games entity to start a game with a player and initialize lives and points.
 * @On(event = { "start" }, entity = "tabla_multiplicarSrv.Games")
 * @param {cds.Request} request - User information, tenant-specific CDS model, headers and query parameters
 */
module.exports = async function(request) {
  const { Games } = cds.entities;
  
  // Extract playerId from the request data
  const { playerId } = request.data;
  
  // Ensure playerId is defined
  if (!playerId) {
    return request.reject(400, 'Player ID is required to start a game.');
  }

  // Initialize game properties
  const initialLives = 3;
  const initialScore = 0;

  // Insert a new game record with initial values
  await INSERT.into(Games).columns('playerId', 'lives', 'score').values(playerId, initialLives, initialScore);

  // Return success message
  return { message: 'Game started successfully with initial lives and score.' };
}
