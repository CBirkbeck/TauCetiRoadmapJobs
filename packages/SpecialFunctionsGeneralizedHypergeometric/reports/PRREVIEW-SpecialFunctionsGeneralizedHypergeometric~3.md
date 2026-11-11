# Review of SpecialFunctionsGeneralizedHypergeometric (pull request #2136 at e3df809)

**Verdict:** needs changes

## R01 (P1) — The repaired bilateral sum fails at an allowed terminating parameter

**Location:** `TauCetiRoadmap/SpecialFunctionsGeneralizedHypergeometric/README.md:789–795`: “Pochhammer symbol at negative `k` given by `(x)ₖ = Γ(x + k)/Γ(x)`”; “with reciprocal Gamma factors, so that the case `b = d` is covered”.
**Claim:** The expanded hypothesis allows `a = 0, b = d = ½, c = 2`. Under the stated negative-index definition and pinned Gamma convention, the bilateral sum is 1 but the asserted Gamma product is 0.
**Witness:** Here `Re(c+d−a−b)=2`; all four required arguments avoid poles. The zero-index term is 1; every other term is 0. The right side contains `Γ(0)⁻¹=0` (Mathlib `Analysis/SpecialFunctions/Gamma/Basic.lean:340`).
**Repair:** Define `(x)_{−m} = (−1)^m/(1−x)ₘ` for positive natural `m`, retaining the Gamma quotient only where valid. Keep the general summation hypotheses and add this Check: at the witness, terms of indices 0 and −1 are 1 and −1; all others vanish, giving 0 on both sides.

## Previous findings

- R01 — repaired: README 4.2 states terminating Watson and Džrbasjan with explicit hypotheses; `terminatingSum_watson_even` and `terminatingSum_dzrbasjan` elaborate and match those statements.
- R02 — repaired: README 4.1 makes balancedness independent of ordering, displays the well-poised ordering, and adds the Pfaff–Saalschütz and Watson Checks.
- R03 — partly repaired: README 4.5 now includes reciprocal Gamma factors and three Checks, but its expanded pole cases expose the negative-index definition defect in this report’s R01.
- R04 — repaired: README 1.5 supplies the reversal hypotheses; 7.1 attaches the Lean name to pointwise convergence; the downstream Struve name has no broken relative link.

## Verified sound

| Statement | Instances tried | Left side / computed data | Right side / comparison | Result; change |
|---|---|---|---|---|
| 1.5, 16.2.4 | `a=.3, b=1.4, z=.7; m=0,1,2` | `1; 1.15; 1.1784375` | `1; 1.15; 1.1784375` | Agrees; hypotheses supplied |
| 4.1, well-poised and very well-poised | `a=1.3,n=3;(b,c,d,f)=(.4,.5,.3,5.4)`, reordered as stated | All six paired sums `2.3`; first difference `1` | `a+1=2.3`; required difference `1` | Agrees |
| 4.1, 2-balanced | Same ₇F₆ | `Σtops+2=8.55`; top `−3` | `Σbottoms=8.55` | Agrees; permutation independent |
| 4.1, Dixon Check | `a=2,b=.3,c=.4`; tops `[b,c,a]` | Paired sums `3,3`; first difference `−2.4` | `a+1=3`; very well-poised requires `1` | Well-poised only |
| 4.1, Pfaff–Saalschütz Check | `n=1,a=b=½,c=3/2,d=−½` | `Σtops+1=1; Σtops+2=2` | `Σbottoms=1` | 1-balanced, not 2-balanced |
| 4.1, Watson Check | Tops `.3,.5,.9`; bottoms `.9,1.8` | Pair-sum equation forces unpaired top `.8` | `.8 ∉ {.3,.5,.9}` | No well-poised ordering |
| 4.2, terminating Watson | `n=0,2;b=.5,c=−1.4`; `n=4,b=.3+.2i,c=−2.6+.1i` | `1; 2.555555555556; 1.626123852610+.868361575823i` | Same three values | Agrees; new headline |
| 4.2, odd Watson | `n=1,3;b=.5,c=−1.4` | `0;0` | `0;0` | Agrees |
| 4.2, Watson denominator argument | `k=1,b=.5,c=−1.4` | `((b−1)/2)₂=−3/16; (2c)₂=5.04` | `−((1−b)/2)₁(1−(1−b)/2)=−3/16; 4c(c+½)=5.04` | Factors nonzero |
| 4.2, Džrbasjan | `a=.3+.2i,d=1.4−.1i;n=0,1,3` | `1; 1.071004407534+.031934828317i; 1.096049222405+.042171338585i` | Same three values | Agrees; new headline |
| 4.2, Džrbasjan denominator identities | Same `d;n=3`; shift index `2` | `(1−d−6)₂=34.55−1.18i; (d/2)₃((d+1)/2)₃=26.723794296875−5.395395281250i` | Signed shifted product and `(d)₆/64` give the same values | Agrees |
| 4.2, distinction from 16.4.7 | `n=0,a=d=½` | Terminating 16.4.8 gives `1` | Continued Gamma expression in 16.4.7 gives `2` | Distinct; source error below |
| 4.5, reciprocal Gamma cancellation | `a=.3,c=2.9,b=d=.5` | Positive tail `1.1875`; negative tail `−1.1875`; total `0` | `0` | Original Check now included |
| 4.5, negative-index Check | `a=.3,c=2.9;k=−1` | `−2.714285714286` | `(c−1)/(a−1)=−19/7` | Agrees away from poles |
| 4.5, complex bilateral Check | `(a,b,c,d)=(.3+.1i,−.4+.2i,1.7−.3i,1.2+.5i)` | 200,000 terms per tail: `1.130726102665+.443532570209i` | `1.130726102661+.443532570211i` | Difference below `5×10⁻¹²` |
| 4.5, newly allowed pole case | `(a,b,c,d)=(0,½,2,½)` | Stated definition: `1`; repaired definition: `1−1=0` | `0` | Fails as written; R01 |
| 7.1, pointwise confluence | Empty original lists; `z=.5; α=10,100,1000` | `1.670182570115;1.650790365065;1.648927442471` | `exp(.5)=1.648721270700` | Converging; Lean/prose agree |
| 7.1, coefficient bound | `α=10,n=2` | `(α)₂/α²=1.1` | `(1+n/|α|)ⁿ=1.44` | Bound holds |

Untouched statement checks stand as in the previous review of `3c765c9`.

- 9 changed-passage source locators read: DLMF-16.2 line 318; DLMF-16.4 lines 73, 94–101, 351–383, 452, 539, 851, 881–883; DLMF-16.8 lines 458–462.
- 6 pinned declarations opened: Mathlib `Analysis/SpecialFunctions/Gamma/Basic.lean:340,344`, `Analysis/SpecialFunctions/RegularizedHypergeometric.lean:75,93`; Tau Ceti `Analysis/SpecialFunctions/OrdinaryHypergeometric.lean:36,56`; four pole-semantics probes elaborate.
- 14 supplier locators resolved on main: SpecialFunctionsHypergeometric Conventions, 1.2–1.4, 4.2, 4.3, 5.1, 6.3, 7.3; ZerosOfLFunctions 1.2–1.3; AsymptoticExpansions 8.2, 8.6–8.7.
- 2 added headlines checked for ownership by object against pinned libraries and indexed roadmaps; no competing owner found. Open #2166 excludes these univariate functions; #2129 consumes the entire series.
- 65 elaborated signatures checked mechanically; the 2 added signatures and the confluence signature match the README. Both new theorems resist `rfl`, `simp [terminatingSum]`, and `infer_instance`.
- 1 targeted build and direct elaboration pass; 58 warnings, all `declaration uses sorry`. Worker gate passes; rerun has only `depcheck: NOT IN ORDER: SpecialFunctionsGeneralizedHypergeometric (insert it after its last supplier)`, explicitly exempted by the brief.
- Dependency output: `depcheck: 237 roadmaps, 2140 edges, 0 problem(s)`; no UPWARD or CYCLE.
- 0 outside-folder changes; 0 overlaps reported; PR title and description checked against the new-folder diff, 58 headlines, scope and three suppliers.

## Not verifiable

- None among the changed passages’ source locators; untouched-source limitations remain those of the previous review.

## Source issues

- **Error** in DLMF Release 1.2.8 at 16.4.8, §16.4(ii), DLMF-16.4 line 448 (unpaginated): the source says Džrbasjan’s sum is Whipple’s sum at `c=−n`; it should be a separate terminating identity: at `n=0,a=d=½` their right sides are respectively 1 and 2; affects nothing.
