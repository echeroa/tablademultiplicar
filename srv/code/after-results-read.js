/**
 * The custom logic attached to the Results entity to perform calculations or transformations after reading results.
 * @After(event = { "READ" }, entity = "tabla_multiplicarSrv.Results")
 * @param {(Object|Object[])} results - For the After phase only: the results of the event processing
 * @param {cds.Request} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(results, request) {
    // Ensure results is an array for consistent processing
    if (!Array.isArray(results)) {
        results = [results];
    }

    // Perform calculations or transformations on each result
    for (const result of results) {
        if (result && result.score !== undefined) {
            // Example transformation: Add a new field 'scoreCategory' based on the score
            if (result.score >= 100) {
                result.scoreCategory = 'High';
            } else if (result.score >= 50) {
                result.scoreCategory = 'Medium';
            } else {
                result.scoreCategory = 'Low';
            }
        }
    }
};
