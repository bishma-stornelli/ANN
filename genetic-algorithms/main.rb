require "./gabil"
begin

	g1 = gabil.new(fitness_threshold, n_features, 690)
	g2 = gabil.new(fitness_threshold, n_features, 690)
	r = 0.0

	P1 = g1.inicializePopulation()
	g1.fitness = g1.fitness(P1)
	while g1.fitness_threshold > max(g1.fitness)
		Pf = g1.fatherSelection1(P1, r)
		recombine(Pf)
		mutate(Pf)
		g1.fitness = g1.fitness(Pf)
		P1 = survivorSelection1(Pf)
	end

	P2 = g1.inicializePopulation()
	g2.fitness = g2.fitness(P2)
	while g2.fitness_threshold > max(g2.fitness)
		Pf = g2.fatherSelection2(P2)
		recombine(Pf)
		mutate(Pf)
		g2.fitness = g2.fitness(Pf)
		P2 = survivorSelection1(Pf)
	end


end