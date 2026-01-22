package runners;

import com.intuit.karate.core.Feature;
import com.intuit.karate.junit5.Karate;

/**
 * TestRunner class to execute Karate tests with JUnit 5.
 */
public class TestRunner {

    /**
     * Main Karate test runner method.
     * <p>
     * This method runs all specified feature files.
     * You can add multiple features to the {@code crudFeatures} list to run them
     * sequentially.
     * </p>
     *
     * @return a {@link Karate} object configured with features and hooks
     */
    @Karate.Test
    public Karate testRunner() {
        return Karate.run().features(Feature.read("classpath:features/example.feature"));
    }
}
