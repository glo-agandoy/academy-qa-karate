# 🚀 Ejercicios de Automatización con Karate DSL

Este proyecto contiene una serie de desafíos prácticos para aprender y dominar las pruebas de API utilizando el framework **Karate**.
Por favor, no hagas uso de la IA, ya que el objetivo de este ejercicio es que aprendas las bases de Karate.
Recuerda que para esta actividad puedes hacer uso de la doc de Karate: https://docs.karatelabs.io/http-requests/making-requests

Junto a esta actividad también vamos a practicar GitFlow, para eso tendrás que descargarte el proyecto
desde un repositorio: git@github.com:glo-agandoy/academy-qa-karate.git, en caso de no tener configurado SSH en este mismo repoisotiro hay un documento
que se llama CONFIG_SSH.md para configurarlo correctamente, ¡CUIDADO! ya que te descargarás la rama principal main, recuerda que cada actividad/ejercicio que hagas
tendrás que hacaerlo en una rama independiente (no uses commit desde el IDE, tiene que ser por comandos, eso os ayudará a entender cómo funcionan),
cada rama que crees tendrá el siguiente formato: nombre-apellidos-título-de-la-actividad, para apoyaros os comaparto cómo funciona gitflow: https://globant.udemy.com/course/git-y-github-completo-desde-cero/
## 🟢 Nivel 1 – Peticiones básicas (GET)

### 1️⃣ Obtener todos los usuarios
**📌 Objetivo:** Aprender a realizar una petición `GET` simple y validar la estructura básica de la respuesta.

#### **Enunciado**
Realiza una petición al endpoint `/users` y aplica las siguientes aserciones:
1. **Código de estado:** Validar que la respuesta sea `200 OK`.
2. **Tipo de dato:** Verificar que el cuerpo de la respuesta sea un arreglo (`array`).
3. **Longitud:** Validar que el listado contenga **al menos 10 posts**.

---
## 🟡 Nivel 2 – Filtros y Validaciones

En este nivel se profundiza en el uso de parámetros de consulta (`query params`), validación de tipos de datos y comparación de valores específicos.

### 4️⃣ Obtener posts de un usuario específico
**📌 Objetivo:** Aprender a usar parámetros de consulta para filtrar resultados.

#### **Enunciado**
Realiza una petición **GET** al endpoint `/posts?userId=1` y valida que:
* El **código de respuesta** sea `200`.
* **Integridad de datos:** Todos los posts devueltos en el arreglo deben tener el campo `userId` igual a `1`.

---

### 5️⃣ Validar un post específico
**📌 Objetivo:** Comparar valores exactos y tipos de datos en un objeto único.

#### **Enunciado**
Realiza una petición **GET** al endpoint `/posts/10` y valida que:
* El **código de respuesta** sea `200`.
* El campo `id` sea exactamente `10`.
* El campo `title` sea de tipo **string**.

---

## 🟠 Nivel 3 – Peticiones POST

En este nivel aprenderás a enviar información al servidor mediante el cuerpo de la petición (`payload`) y a validar la creación exitosa de recursos.

### 6️⃣ Crear un nuevo post
**📌 Objetivo:** Aprender a enviar un cuerpo JSON en una petición `POST`.

#### **Enunciado**
Realiza una petición **POST** al endpoint `/posts` enviando un objeto JSON (este objeto json tiene que ser .json que esté alojado en la carpeta /data) 
que contenga los campos `userId`, `title` y `body`. Luego, valida que:
* El **código de respuesta** sea `201` (Created).
* La respuesta contenga un campo `id` generado.
* El campo `title` devuelto sea idéntico al que enviaste.

---

### 7️⃣ Crear un comentario para un post
**📌 Objetivo:** Validar respuestas de creación y formatos específicos.

#### **Enunciado**
Realiza una petición **POST** al endpoint `/comments` enviando los datos del comentario. Valida que:
* El **código de respuesta** sea `201`.
* El campo `email` tenga un **formato de correo válido**.
* El campo `postId` coincida con el valor enviado en la petición.

---
## 🔵 Nivel 4 – PUT y DELETE

En este nivel final, aprenderás a gestionar el ciclo de vida completo de un recurso mediante la actualización total de datos y la eliminación de registros.

### 8️⃣ Actualizar un post existente
**📌 Objetivo:** Utilizar el método `PUT` para modificar información existente.

#### **Enunciado**
Realiza una petición **PUT** al endpoint `/posts/1` enviando un nuevo cuerpo de datos. Valida que:
* El **código de respuesta** sea `200` (OK).
* Los campos `title` y `body` reflejen los nuevos valores enviados.
* El campo `id` permanezca inalterado (valor `1`).

---

### 9️⃣ Eliminar un post
**📌 Objetivo:** Probar la eliminación de recursos mediante el método `DELETE`.

#### **Enunciado**
Realiza una petición **DELETE** al endpoint `/posts/1` y valida que:
* El **código de respuesta** sea `200` (o `204 No Content`, dependiendo de la API).
* La **respuesta** sea un objeto vacío `{}` o no contenga cuerpo, confirmando la ejecución.

---
## 🥋 Ejercicio Final

**🎯 Objetivo:** Implementar técnicas avanzadas de automatización para optimizar la mantenibilidad y escalabilidad del framework.

### El Desafío de Integración
Debes crear un flujo de pruebas que utilice:

1.  **`Scenario Outline` y `Examples`**: Para probar el endpoint de `/users` con múltiples IDs y nombres esperados en una sola estructura.
2.  **`call`**: Para reutilizar la lógica de creación de un post (Nivel 3) antes de intentar comentarlo o editarlo.
3.  **`tags`**: Para categorizar las pruebas (ej: `@smoke`, `@regression`) y permitir ejecuciones selectivas.

---

### 🛠️ Ejemplo de Implementación Avanzada

A continuación, se muestra cómo estructurar estas funcionalidades:

#### **Reutilización (create-post.feature)**
Este archivo servirá para ser llamado por otros escenarios.
```cucumber
@ignore
Feature: Reusable Post Creator
  Scenario:
    Given url apiUrl
    And path 'posts'
    And request { title: 'Post Base', body: 'Contenido', userId: 1 }
    When method POST
    Then status 201