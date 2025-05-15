/**
 * The custom logic attached to the Games entity to validate game data before creating or updating a game record.
 * @Before(event = { "CREATE","UPDATE" }, entity = "tabla_multiplicarSrv.Games")
 * @param {cds.Request} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(request) {
  const { Players } = cds.entities;
  const { playerId, lives, score } = request.data;

  // Check if playerId is defined
  if (playerId === undefined) {
    return request.reject(400, 'Player ID is required.');
  }

  // Validate playerId exists in Players entity
  const playerExists = await SELECT.one.from(Players).where({ ID: playerId });
  if (!playerExists) {
    return request.reject(404, `Player with ID ${playerId} does not exist.`);
  }

  // Validate lives and score are non-negative
  if (lives !== undefined && lives < 0) {
    return request.reject(400, 'Lives must be a non-negative integer.');
  }

  if (score !== undefined && score < 0) {
    return request.reject(400, 'Score must be a non-negative integer.');
  }
};
