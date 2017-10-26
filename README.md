# Allosteric Mixtures 

## Posits
1. We consider a mixture of two components A (active) and I (inactive).
2. The components form exclusively tetramers.
3. The composition of tetramers is purely stochastic.
4. The mixture is defined by the ratio of the concentrations of A and I.


## Configurations
We have 5 possible configurations, not counting any permutations:
AAAA, AAAI, AAII, AIII, IIII


## Nomenclature:
* concentration a = c(A)
* concentration i = c(I)
* concentration ratio r = a / i ***(eq1)***
* total concentration a + i = C ***(eq2)***


## Concentration in terms of *r*
from ***(eq3)***
```
a = r * i (eq3)
i = a / r (eq4)
```

***(eq4)*** in ***(eq2)***
```
a + (a / r) = C
a (1 + (1 / r)) = C
a = C / (1 + (1 / r))
```

***(eq3)*** in ***(eq2)***
```
r * i + i = C
i (1 + r) = C
i = C / (1 + r)
```


## Relative concentrations of configurations
The stochastic composition of tetramers follows the mass action law and
combinatorial rules:
```
aaaa = a * a * a * a
aaai = 4 * a * a * a * i
aaii = 6 * a * a * i * i
aiii = 4 * a * i * i * i
iiii = i * i * i * i
```

## Total concentration
```
C = aaaa + aaai + aaii + aiii + iiii;
```


## Two allostery models
1. The allosteric effect is linked to the tetrameric state and therefore
  constant in all 5 possible configurations (see above).
2. The allosteric effect is linked to the number of A (active) monomers
  and therefore linearly decreasing with the ratio *r*.


## Enzymatic activity
The key effect of the allosteric interaction is not the binding in this case
(we assume fully formed tetramers), but the enzymatic activity.
In this model we set the enzymatic activity propostional to the number of
active monomers in the tetramer and the concentration of the tetramer:
```
aaaa_ea = 4/4 * aaaa
aaai_ea = 3/4 * aaai
aaii_ea = 2/4 * aaii
aiii_ea = 1/4 * aiii
iiii_ea = 0/4 * iiii
```
That yields a linear decrease of the enzymaic activity with increasing concentration
of inactive monomers.

The allosteric component of the model is added with the *allosteric coefficient (AC)*
as an exponent, similar to the Hill coefficient:
```
AC = 4; # allostery coefficient
aaaa_ea = (4/4)^AC;
aaai_ea = (3/4)^AC;
aaii_ea = (2/4);
aiii_ea = (1/4);
iiii_ea = (0/4);
```
The model shown here depicts already the behaviour seen in Jamie's data, where the
allosteric effect disappears below an A/I ratio r = 0.5.



