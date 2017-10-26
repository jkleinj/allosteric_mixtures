#! /usr/bin/R
#================================================================================
# combinatorics of mixtures
# Copyright (C) 2017 Jens Kleinjung
#================================================================================

## see the README file for an explanation of the computations

#_______________________________________________________________________________
## monomer concentrations
C = 1;

## enzymatic activities of tetramers
AC = 2; # allostery coefficient
aaaa_ea = 4^AC/4;
aaai_ea = 3^AC/4;
aaii_ea = 2^AC/4;
aiii_ea = 1^AC/4;
iiii_ea = 0^AC/4;
#aaaa_ea = aaai_ea = aaii_ea = aiii_ea = iiii_ea = 1;

rs = seq(0.1, 10, by = 0.1);

result.ea = lapply(rs, function(r) {
	a = C / (1 + 1 / r);
	i = C / (1 + r);

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

	stopifnot(isTRUE(all.equal(sum(aaaa + aaai + aaii + aiii + iiii), 1)));

	#_______________________________________________________________________________
	## total enzymatic activity of tetramer mixture
	total_ea =	aaaa * aaaa_ea +
				aaai * aaai_ea +
				aaii * aaii_ea +
				aiii * aiii_ea +
				iiii * iiii_ea;

	#print(paste("aaaa", aaaa, "; aaai", aaai, "; aaii", aaii, "; aiii", aiii, "; iiii", iiii));
	c(i, total_ea);
});

result.ea.df = do.call(rbind.data.frame, result.ea);
colnames(result.ea.df) = c("i", "total_ea");


#_______________________________________________________________________________
## plot results
plot(abs(result.ea.df[ ,1]), result.ea.df[ ,2]);


