/**
 * Reference: https://docs.karatelabs.io/core-syntax/configuration/
 * Karate configuration function.
 *
 * This function is automatically executed by Karate at the start of a test run.
 * It sets up environment-specific settings such as API URLs, users, and timeouts.
 *
 * @returns {Object} The configuration object for the current environment.
 *
 */
function fn() {
    /** Timeout for HTTP requests in milliseconds */
    const TIMEOUT = 5000;

    /** Environment-specific configuration */
    const config = {
         apiUrl: "https://jsonplaceholder.typicode.com/"
    };

    // Configure Karate HTTP timeouts
    karate.configure('connectTimeout', TIMEOUT);
    karate.configure('readTimeout', TIMEOUT);

    // Return configuration for the selected environment
    return config
}
