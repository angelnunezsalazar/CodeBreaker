Feature: Jugador Comienza Juego

	Como Jugador necesito que el juego me indique
	que comenc´e a jugar para saber que ya puedo jugar
	
	Scenario: HomePage
		Given I go to "/"
		Then I should see "Bienvenido a Codebreaker"
		And I should see "Ingrese su conjetura:"
