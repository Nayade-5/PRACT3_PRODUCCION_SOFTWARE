Feature: Gestión de gastos
  Como estudiante
  Quiero registrar mis gastos
  Para controlar cuánto dinero gasto

  Scenario: Crear un gasto y comprobar cual es el total que llevo gastado
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Café
    Then el total de dinero gastado debe ser 5 euros

  Scenario: Eliminar un gasto y comprobar cual es el total que llevo gastado
    Given un gestor con un gasto de 5 euros
    When elimino el gasto con id 1
    Then debe haber 0 gastos registrados

  Scenario: Crear y eliminar un gasto y comprobar que no he gastado dinero
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Café
    And elimino el gasto con id 1
    Then debe haber 0 gastos registrados

  Scenario: Crear dos gastos diferentes y comprobar que el total que llevo gastado es la suma de ambos
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Café
    And añado un gasto de 10 euros llamado Comida
    Then el total de dinero gastado debe ser 15 euros

  Scenario: Crear tres gastos diferentes que sumen 30 euros hace que el total sean 30 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Gasto1
    And añado un gasto de 10 euros llamado Gasto2
    And añado un gasto de 10 euros llamado Gasto3
    Then hace que el total sean 30 euros
  
  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado GastoA
    And añado un gasto de 30 euros llamado GastoB
    And añado un gasto de 30 euros llamado GastoC
    And elimino el gasto con id 3
    Then la suma son 40 euros
  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros

Scenario: Intentar añadir un gasto con cantidad negativa no debe alterar el total
    Given un gestor de gastos vacío
    When intento añadir un gasto negativo de -10 euros llamado Error
    Then debe haber 0 gastos registrados
    And el total de dinero gastado debe ser 0 euros

  Scenario: Intentar eliminar un gasto que no existe mantiene los datos intactos
    Given un gestor con un gasto de 20 euros
    When intento borrar un id inexistente como el 999
    Then debe haber 1 gastos registrados
    And el total de dinero gastado debe ser 20 euros

  Scenario: Añadir un gasto de 0 euros se registra en el historial pero no altera el total
    Given un gestor con un gasto de 30 euros
    When registro un gasto gratuito de 0 euros llamado MuestraGratis
    Then debe haber 2 gastos registrados
    And el total de dinero gastado debe ser 30 euros