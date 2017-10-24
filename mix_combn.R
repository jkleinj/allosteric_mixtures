#! /usr/bin/R
#===============================================================================
# combinatorics of mixtures
# Copyright (C) 2017 Jens Kleinjung
#===============================================================================

## We consider a mixture of two components A (active) and I (inactive).
## The components form exclusively tetramers.
## The composition of tetramers is purely stochastic.
## The mixture is defined by the ratio of the concentrations of A and I.

## We have 5 possible configurations, not counting any permutations:
##   AAAA, AAAI, AAII, AIII, IIII

## Nomenclature:
## concentration a = c(A)
## concentration b = c(B)
## concentration ratio r = a / b
## total concentration a + b = 1


