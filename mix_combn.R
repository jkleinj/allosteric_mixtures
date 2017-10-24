#! /usr/bin/R
#================================================================================
# combinatorics of mixtures
# Copyright (C) 2017 Jens Kleinjung
#================================================================================

## see the README file for an explanation of the computations

#_______________________________________________________________________________
## monomer concentrations
C = 1;

rs = seq(10, 0, by = -0.1);

result.ea = sapply(rs, function(r) {
	a = N / (1 + 1 / r);
	i = N / (1 + r);

	#print(paste("r", r, "; C", C));
	#print(paste("a", a, "; i", i));

	sum(a + i);

	#_______________________________________________________________________________
	## tetramer concentrations
	aaaa = a^4;
	aaai = 4 * a^3 * i;
	aaii = 6 * a^2 * i^2;
	aiii = 4 * a * i^3;
	iiii = i^4;

	sum(aaaa + aaai + aaii + aiii + iiii);

	#_______________________________________________________________________________
	## enzymatic activities
	aaaa_ea = 4/4;
	aaai_ea = 3/4;
	aaii_ea = 2/4;
	aiii_ea = 1/4;
	iiii_ea = 0/4;


	total_ea =	aaaa * aaaa_ea +
				aaai * aaai_ea +
				aaii * aaii_ea +
				aiii * aiii_ea +
				iiii * iiii_ea;

	#print(paste("aaaa", aaaa, "; aaai", aaai, "; aaii", aaii, "; aiii", aiii, "; iiii", iiii));
	c(r, total_ea);
});

result.ea.mat = as.matrix(t(result_ea));

#_______________________________________________________________________________
## plot results
plot(abs(result.ea.mat[ ,1]), result.ea.mat[ ,2]);


