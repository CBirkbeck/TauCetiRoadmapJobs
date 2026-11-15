# Review of GeometryOfNumbersAndQuadraticArithmetic (pull request #851 at 3b084ef)

**Verdict:** accepted

Incremental re-review of 0 changed lines since `3b084ef`. The folder is unchanged; this round read the pull request's title and description, rewritten since the previous review, against the head. No finding.

## Previous findings

- R01 — repaired: the description now lists the successive-minima calculus, the lower half of Minkowski's second theorem and the linear-forms theorem as imports from SuccessiveMinima (Layers 0–2) and the upper half from Tau Ceti; "ArithmeticHeights" is gone.
- R02 — repaired: "Henk's lattice-point bounds and Davenport's estimate from SieveMethodsAndPrimePatterns §0.11a; Howe–Moore, Moore ergodicity, Mahler's compactness criterion … from ProbabilisticAndMetricNumberTheory §§4.9a, 4.9b and 5.1a"; the summary block names them as supplied.
- R03 — repaired: "the SuccessiveMinima, QuadraticFormInvariants, GlobalQuadraticForms, IntegralLattices and GrothendieckEulerForms roadmaps"; the eight missing suppliers are in the dependencies paragraph; ArithmeticGaloisDuality reads "R02.3.1 and R02.4.1–R02.4.4".
- R04 — repaired: PointProcesses, HomotopySpheres and AlgebraicTopology no longer occur; "The finite Poisson samples used in §4.2 are this roadmap's own targets"; LFunctions is listed as a supplier (Layers 0, 3 and 5).
- R05 — repaired: both sentences are deleted; "The open pull requests that must merge first are in the merge order below" is kept.

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| `sqSuccessiveMin_eq_sq_successiveMin` (description: "comparison of real with squared-norm successive minima"; `Suggested.lean` line 103) | `ℤ²` with `x²+y²`; rank 1 with `B(x,x) = 2x²`; rank 0 | `ℤ²`: squared minima (1,1), real minima (1,1), `1 = 1²`. Rank 1: squared minimum 2, real minimum √2, `2 = (√2)²`. Rank 0: `Fin 0` empty | holds; without the square the rank-1 case gives 2 ≠ √2 |
| `finiteArfInvariant_eq_zero_iff_exists_lagrangian` (description: "the Arf invariant over finite fields of characteristic two"; line 466) | `𝔽₂²` with `xy` and `x²+xy+y²`; `𝔽₄²` with `xy` and `x²+xy+ωy²`; `V = 0` | `xy/𝔽₂`: 3 zeros, 2·3 = 6 > 4, class 0, line `y = 0` is Lagrangian. `x²+xy+y²`: 1 zero, 2 < 4, class 1, no isotropic line. `𝔽₄`: 7 zeros, 28 > 16, class 0; anisotropic 1 zero, 4 < 16, class 1. `V = 0`: 2 > 1, class 0, `L = 0` | both directions hold in each instance |
| Description against the README, by supplier and section | each roadmap and section id the dependencies paragraph names | 35 supplier names, each with a contract heading or table row (README lines 120–265) carrying the same layers or sections; every `### From` heading and every roadmap of "Other supplier contracts" is named in the description | agrees |

The rows for every statement of the folder stand as in the previous review, of `3b084ef`: the folder has not changed.

- Description against the head: title equals the README's title; "adds the roadmap folder" (not on `origin/main`, 3 files, 0 deletions); the end theorems of the summary block are those of README line 7; the Part II exclusion is line 45; the §3.3 supply to OrthogonalTamagawaAndLatticeMass is line 41; "metric number theory draws on its homogeneous dynamics" is line 3128.
- Remark, no change asked: README line 196 also uses StableHomotopyKTheory §4.15 (the right/left-module comparison), which the description's "§§3.15, 3.25, 3.28 and 4.14" does not list; the description defers to the README's contracts as the definitive list.
- Folder change since the previous review: 0 lines. Changes outside the folder against `origin/main`: none. Seeded sample: no changed passage, so no sampled target falls in the change; the README flags no locator as unverified.
- Gate: the worker's run at this head passes every check, `build=0 OK`. A rerun of the plain gate command prints `depcheck=3` with UPWARD lines to ArithmeticGaloisDuality, ProbabilisticAndMetricNumberTheory and SieveMethodsAndPrimePatterns against the unmoved order; these are the suppliers the moved order places before this roadmap (the `moved:` case), not a finding.
- Dependency check with the moved order, verbatim: `depcheck: 245 roadmaps, 2224 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: 21 `declaration uses sorry` warnings, no error, no other warning.
- Cross-roadmap names resolved: 31 supplier folders found on main (25 under `TauCetiRoadmap/`; LieGroups, LieHighestWeight and SpinRepresentations under `RepresentationTheory/`; IntegralLattices, RealAlgebraicGeometry and AlgebraicCodingTheory under `Completed/`); ArithmeticGaloisDuality, GeneralAlgebraicKTheory, ProbabilisticAndMetricNumberTheory and SieveMethodsAndPrimePatterns at their open heads, earlier in the moved order; OrthogonalTamagawaAndLatticeMass open, a consumer.
- Overlap check: read LatticePackingsAndPerfectForms and GeometryOfNumbersAndQuadraticArithmeticPartII (open; both cite this roadmap's §4 and §6 as suppliers, and share none of its 35 Lean declaration names) and SuccessiveMinima (main; owner of the successive-minima calculus, cited at README line 27); nothing shared. The head of HermitianKTheoryOfPoincareCategories is not among the checkouts given and was not read.
- Source independence: changed passages only; 0 passages compared with 0 sources, since the folder did not change; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- The not-verifiable items of the earlier reports are unchanged (Weil 1964, Siegel 1945, Banaszczyk 1993, Siegel 1935, Iwaniec 1987, Wall §13A, Kervaire–Milnor, Axler–Bourdon–Ramey and the unsampled sources); nothing in this round depends on them.
- The generated `depends-on` and `merge-order` blocks of the description were not checked.

## Source issues

- none

## For the human reviewers

- none
