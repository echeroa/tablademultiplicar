/**
 * The custom logic attached to the Players entity to validate player data before creating or updating a player record.
 * @Before(event = { "CREATE","UPDATE" }, entity = "tabla_multiplicarSrv.Players")
 * @param {cds.Request} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(request) {
    const { Players } = cds.entities;
    const { name } = request.data;

    if (!name) {
        request.reject(400, 'Player name is mandatory.');
        return;
    }

    const existingPlayer = await SELECT.one.from(Players).where({ name });

    if (existingPlayer && existingPlayer.ID !== request.data.ID) {
        request.reject(400, `Player with name '${name}' already exists.`);
    }
}
