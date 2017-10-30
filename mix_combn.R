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

## linear model
#aaaa_ea = aaai_ea = aaii_ea = aiii_ea = iiii_ea = 1;

## ad-hoc model
aaaa_ea = (4/4)^AC;
aaai_ea = (3/4)^AC;
aaii_ea = (2/4);
aiii_ea = (1/4);
iiii_ea = (0/4);

## pair model: number of possible active pairs
#aaaa_ea = 3^AC;
#aaai_ea = 2^AC;
#aaii_ea = 1^AC;
#aiii_ea = (1/4);
#iiii_ea = (0/4);

rs = seq(0.1, 10, by = 0.01);

eval.ea = lapply(rs, function(r) {
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

	c(i, aaaa, aaai, aaii, aiii, iiii, total_ea);
});

eval.ea.df = do.call(rbind.data.frame, eval.ea);
colnames(eval.ea.df) = c("i", "aaaa", "aaai", "aaii", "aiii", "iiii", "total_ea");
plot(abs(eval.ea.df[ ,1]), eval.ea.df[ ,2], col = "blue4",
			xlim = c(0, 1), ylim = c(0, 1),
			xlab = c("i"), ylab = ("concentration || EA"));
points(abs(eval.ea.df[ ,1]), eval.ea.df[ ,3], col = "blue1");
points(abs(eval.ea.df[ ,1]), eval.ea.df[ ,4], col = "grey");
points(abs(eval.ea.df[ ,1]), eval.ea.df[ ,5], col = "orange1");
points(abs(eval.ea.df[ ,1]), eval.ea.df[ ,6], col = "orange4");
points(abs(eval.ea.df[ ,1]), eval.ea.df[ ,7], col = "black");

