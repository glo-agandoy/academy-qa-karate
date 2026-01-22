# Karate API Automation Project

![Karate DSL](https://img.shields.io/badge/Framework-Karate%20DSL-orange)
![Java](https://img.shields.io/badge/Java-11%2B-blue)
![Maven](https://img.shields.io/badge/Build-Maven-red)

A robust API automation framework built using **Karate DSL**, **Java**, and **Maven**. This project demonstrates best practices for end-to-end API testing, including environment switching, custom hooks, and automated reporting.

---

## 🛠 Prerequisites

Before running the tests, ensure you have the following installed:

* **Java JDK 11+**: [Download here](https://www.oracle.com/java/technologies/downloads/)
* **Maven 3.6+**: [Download here](https://maven.apache.org/download.cgi)
* **IDE**: IntelliJ IDEA (recommended), VSCode, or Eclipse.

Verify your installation:
```bash
java -version
mvn -version
```
---

## 📂 Project Structure

This project follows the standard Maven convention for Karate. Below is the directory map and the purpose of each key folder.

```text
.
├── src/
│   └── test/
│       ├── java/
│       │   ├── hooks/        # Custom Karate hooks (before/after scenario, reporting)
│       │   └── runners/      # JUnit5 Test Runners used to execute the test suite
│       └── resources/
│           └── features/     # Gherkin .feature files (where you write your tests)
├── karate-config.js          # Main configuration file (URLs, Environments, Global Vars)
├── pom.xml                   # Maven Project Object Model (Dependencies & Plugins)
└── README.md                 # Project documentation
```
---
## ⚙️ Environment Configuration
This project uses karate-config.js to manage environment-specific variables like base URLs and user credentials.

Example karate-config.js:
```js
function fn() {
  const env = karate.env || 'local';

  const config = {
    local: {
      apiUrl: 'http://my-karate:1234',
      users: {
        agent: { email: 'karate@demo.dev', password: 'karate_demo' }
      }
    }
  };

  return config[env];
}
```
---
## 🚀 How to Run Tests
Via Terminal (Maven)
Run the entire suite:
```bash
mvn test
mvn test -Dkarate.options="classpath:features/auth.feature"
mvn test -Dkarate.env=local
```
Via IDE
Navigate to src/test/java/runners/TestRunner.java.

Right-click the file or the class name.

Select Run 'TestRunner' (JUnit 5).
---
## 📝 Development Guide
Adding a New Feature
Create a .feature file in src/test/resources/features/.

Write scenarios using Karate's Gherkin syntax:
```bash
Scenario: Verify API Property
  Given url apiUrl
  And path '/property'
  When method get
  Then status 200
  ```
Register the new feature in your TestRunner.java list if required by your custom runner logic.
---
### ⚓ Hooks & Custom Logic
Located in src/test/java/hooks/, custom hooks allow you to:

Execute code before/after every scenario.

Log additional data for debugging.

Jira Integration: Automatically upload test results to Jira via API calls.

---

## 💡Tips

Fast Debugging: Use the Karate plugin in your IDE to run individual scenarios by clicking the "Play" button in the gutter.

Naming: Keep scenario names descriptive; they serve as documentation for the API behavior.

Clean Code: Store reusable JSON payloads in separate files and use the read() function to keep feature files clean.

## 📚 Resources & Media

Access essential learning materials and official documentation to master this framework.

### 🎓 Recommended Training
> [!IMPORTANT]
> **Karate: De Principiante a Experto (Udemy)** > A comprehensive 7-hour masterclass designed to take you from zero to hero.  
> [**Access Course on Udemy** 📺](https://globant.udemy.com/course/karate-testing-de-principiante-a-experto/)

### 📚 Official Resources
| Resource | Description | Link |
| :--- | :--- | :--- |
| 🚀 **Getting Started** | The official "Why Karate" guide and setup instructions. | [Check Doc 📖](https://docs.karatelabs.io/getting-started/why-karate) |
| 🛠️ **Official Repo** | The core repository. **Best place to find code examples.** | [Check Repo 🛠️](https://github.com/karatelabs/karate) |
| 🧪 **Karate Demos** | Collection of real-world scenarios (UI, API, Mocks). | [View Examples 🧪](https://github.com/karatelabs/karate/tree/master/karate-demo) |

---

### 💡 Quick Navigation Tips
* **Search First:** Use `CTRL + F` on the [Official Repo](https://github.com/karatelabs/karate) page to find specific keywords like `auth`, `headers`, or `JSON path`.
* **Study Examples:** The `karate-demo` folder in the official repo contains 90% of the use cases you will encounter in this project.
* **Stay Updated:** Karate updates frequently; always refer to the **New Karate Doc** link above for the latest syntax improvements.

---
