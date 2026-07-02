package runners;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;
import hooks.CustomExecutionHook;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

class TestRunner {

    @Test
    void testParallel() {
        // 1. Ejecutamos Karate indicando la carpeta y le pedimos que genere un JSON
        Results results = Runner.path("classpath:features")
                .hook(new CustomExecutionHook())
                .outputCucumberJson(true)
                .parallel(1);

        // 2. Llamamos a nuestro método para crear el reporte visual
        generateReport(results.getReportDir());

        // 3. Validamos que si alguna prueba falla, IntelliJ lo marque en rojo
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    // Método que toma el JSON de Karate y dibuja un reporte HTML
    public static void generateReport(String karateOutputPath) {
        java.util.logging.Logger.getLogger("net.masterthought").setLevel(java.util.logging.Level.OFF);
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "Proyecto GoRest");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}