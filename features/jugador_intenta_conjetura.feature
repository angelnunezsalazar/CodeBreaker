Feature: Jugador Intenta Conjetura

	Como jugador quiero que el sistema me muestre el resultado y mi ´ultima jugada
	con el objetivo de saber si estoy adivinando el c´odigo
	
	Scenario Outline: Intento de Conjetura
		Given I go to "/"
		And The secret code is "1234"
		When I fill "conjetura" with "<conjetura>"
		And I press "Ok"
		Then I should see "El resultado de su ultima jugada \(<conjetura>\) es: <resultado>"
		
	Scenarios: 
		|conjetura|resultado|
		|5555||
		|1234|XXXX|
		|4321|____|
