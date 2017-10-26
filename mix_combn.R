#! /usr/bin/R
#================================================================================
# combinatorics of mixtures
# see the README file for an explanation of the computations
# Copyright (C) 2017 Jens Kleinjung
#================================================================================

## monomer concentrations
C = 1;

## enzymatic activities of tetramers
AC = 4; # allostery coefficient
aaaa_ea = (4/4)^AC;
aaai_ea = (3/4)^AC;
aaii_ea = (2/4);
aiii_ea = (1/4);
iiii_ea = (0/4);
#aaaa_ea = aaai_ea = aaii_ea = aiii_ea = iiii_ea = 1;

rs = seq(0.1, 10, by = 0.01);

result.ea = lapply(rs, function(r) {
	a = C / (1 + 1 / r);
	i = C / (1 + r);
	sum(a + i);

	#_______________________________________________________________________________
	## tetramer concentrations
	aaaa = a^4;
	aaai = 4 * a^3 * i;
	aaii = 6 * a^2 * i^2;
	aiii = 4 * a * i^3;
	iiii = i^4;
	stopifnot(isTRUE(all.equal(sum(aaaa + aaai + aaii + aiii + iiii), 1)));

	#_______________________________________________________________________________
	## total enzymatic activity of tetramer mixture
	total_ea =	aaaa * aaaa_ea +
				aaai * aaai_ea +
				aaii * aaii_ea +
				aiii * aiii_ea +
				iiii * iiii_ea;

	c(i, total_ea);
});

result.ea.df = do.call(rbind.data.frame, result.ea);
colnames(result.ea.df) = c("i", "total_ea");
plot(abs(result.ea.df[ ,1]), result.ea.df[ ,2]);

