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
* concentration b = c(B)
* concentration ratio r = a / b ***(eq1)***
* total concentration a + b = 1 ***(eq2)***


## Concentration in terms of *r*
from ***(eq3)***
```
a = r * b (eq3)
b = a / r (e14)
```

***(eq4)*** in ***(eq2)***
```
a + a/r = 1
a (1 + 1/r) = 1
a = 1 / (1 + 1/r)
```

***(eq3)*** in ***(eq2)***
```
r * b + b = 1
b (1 + r) = 1
b = 1 / (1 / (1 + r))
```


## Relative concentrations of configurations
The stochastic composition of tetramers follows the mass action law:
```
aaaa = a * a * a * a
aaai = a * a * a * i
aaii = a * a * i * i
aiii = a * i * i * i
iiii = i * i * i * i
```


## Two allostery models
1. The allosteric effect is linked to the tetrameric state and therefore
  constant in all 5 possible configurations (see above).
2. The allosteric effect is linked to the number of A (active) monomers
  and therefore linearly decreasing with the ratio *r*.


