
package hooks;

import com.intuit.karate.RuntimeHook;
import com.intuit.karate.core.ScenarioRuntime;
import com.intuit.karate.core.Tag;
import java.util.List;
import java.util.stream.Collectors;

public class CustomExecutionHook implements RuntimeHook {

    @Override
    public void afterScenario(ScenarioRuntime sr) {
        System.out.println("\n=========================================");
        System.out.println("🛠️ HOOK NATIVO JAVA EJECUTÁNDOSE...");
        System.out.println("Escenario finalizado: " + sr.scenario.getName());

        // Verificamos si la prueba falló
        if (sr.isFailed()) {
            System.out.println("❌ ESTADO: FALLÓ.");
        } else {
            System.out.println("✅ ESTADO: ÉXITO TOTAL.");

            // ==============================================================
            // MÉTODOS DE ÉXITO (Solo entran aquí si la prueba NO falló)
            // ==============================================================

            // 1. Extraemos los tags de Karate y los convertimos a una lista de texto (Strings)
            List<String> tagsDelEscenario = sr.scenario.getTags() == null
                    ? java.util.Collections.emptyList()
                    : sr.scenario.getTags().stream().map(Tag::getName).collect(Collectors.toList());

            // 2. Evaluamos usando nuestra nueva lista (sin el símbolo @)
            if (tagsDelEscenario.contains("auditoria")) {
                System.out.println("🚨 ALERTA DE AUDITORÍA: Este escenario modificó la base de datos de usuarios.");
            }

            if (tagsDelEscenario.contains("negativo")) {
                System.out.println("🛡️ PRUEBA NEGATIVA OK: El sistema bloqueó los datos incorrectos exitosamente.");
            }

            if (tagsDelEscenario.contains("contrato")) {
                System.out.println("📜 CONTRATO OK: La estructura y los tipos de datos cumplen exitosamente.");
            }

            if (tagsDelEscenario.contains("userData")) {
                System.out.println("💾 DATA OK: La data fue cargada y procesada exitosamente.");
            }

            if (tagsDelEscenario.contains("masivo")) {
                System.out.println("🔄 BUCLE MASIVO OK: La lista de usuarios dinámicos se procesó a la perfección.");
            }
        }

        System.out.println("=========================================\n");
    }
}