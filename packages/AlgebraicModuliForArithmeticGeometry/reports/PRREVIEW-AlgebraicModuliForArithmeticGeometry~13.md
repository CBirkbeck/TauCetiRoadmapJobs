# Review of AlgebraicModuliForArithmeticGeometry (pull request #3027 at 71bbefa)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 63 changed lines since `aecb53a`. I checked the new §9.12 (Ein–Lazarsfeld global division) against Ein–Lazarsfeld 1999 and Ein–Lazarsfeld–Smith 2001, along with its Checks, its route and *Needs:* line, the sentences elsewhere that cite it, the new docstring sentence of `Suggested.lean` and the previous review's findings. The statement of §9.12 matches Proposition 1.2 (ii) hypothesis for hypothesis, and all three Checks are true. One finding blocks. The proof sketch asserts that every term of the twisted Koszul complex carries a nonnegative power of `N`. That is false when there are more than `n + 1` sections, so the route does not cover the `n + k` branch of its own hypothesis. There are two small corrections and no format notes. Nothing is left for a human to decide. The deferred two-way supply with Part II is resolved at this head.

## R01 (P2) — The route of §9.12 asserts that every term of the twisted complex has a nonnegative power of `N`, which fails when `m > n + 1`

The text says: "Its terms are sums of sheaves `O_Y(K_Y) ⊗ f^*O_X(A − ℓD) ⊗ N^{⊗i}` with `i ≥ 0` in the stated range of `ℓ`, whose higher cohomology vanishes by `algebraicAdjointVanishing`" (§9.12, lines 10176–10178). An implementer who follows this for the branch `ℓ ≥ n + k` of the hypothesis, with `m > n + 1` sections, meets terms whose higher cohomology does not vanish. The sketch does not say why they do no harm, so it proves only the branch `ℓ ≥ m + k − 1`.

The term in homological degree `p` (`1 ≤ p ≤ m`) is a sum of copies of `O_Y(K_Y) ⊗ f^*O_X(A − ℓD) ⊗ N^{⊗(ℓ−k−p+1)}`. With `ℓ = n + k` the exponent is negative for `p ≥ n + 2`. Take `X = ℙ¹`, `J = O_X`, `L = O(1)`, the three sections `x, y, x + y`, `k = 1`, `ℓ = 2 = min(3, 2)` and `A` of degree 3. Twisted by `O(K_X + A) = O(1)`, the Koszul complex is `0 → O(−2) → O(−1)³ → O³ → O(1) → 0`. Its last term is `K_X ⊗ O(A − 2D) ⊗ N^{−1}`, with `i = −1`, and `H¹(ℙ¹, O(−2)) = ℂ ≠ 0`. The theorem survives because the diagram chase needs only `H^{p−1}` of the degree-`p` term, and on the `n`-dimensional `Y` that vanishes for `p ≥ n + 2`. Ein and Lazarsfeld make exactly this cut: the vanishing (***) in their proof of Proposition 1.1 (ii) is required only for `0 < j ≤ min(m − 1, n)` (p. 11).

A repair would replace the quoted sentence with: "The chase needs only `H^{p−1}` of the term in homological degree `p`. For `p ≥ n + 2` this vanishes because `dim Y = n`. For `2 ≤ p ≤ min(m, n + 1)` the term is a sum of sheaves `O_Y(K_Y) ⊗ f^*O_X(A − ℓD) ⊗ N^{⊗i}` with `i = ℓ − k − p + 1 ≥ 0`, whose higher cohomology vanishes by `algebraicAdjointVanishing`."

## C01 — The route for `k ≥ 2` uses a Schur-power resolution that nothing provides, and is not needed

For `k ≥ 2` the route resolves the kernel of `S^k(⊕_j O_Y(−D′_j)) → O_Y` by Schur powers. Ein and Lazarsfeld take this from Green 1984, (1.a.10). No section here, no supplier and nothing in the pins provides it. The *Needs:* line (line 10181) names neither it nor the Koszul complex.

Iterating the case `k = 1` gives every `k` under the same hypothesis. Apply `k = 1` to `(A, ℓ)`, then the case `k − 1` to `(A − D, ℓ − 1)`. The bound `ℓ − 1 ≥ min(m + k − 2, n + k − 1)` is `ℓ ≥ min(m + k − 1, n + k)`, and `(A − D) − (ℓ − 1)D = A − ℓD` stays nef and big. The parenthesis could read "(for `k ≥ 2`, iterate the case `k = 1`)". The *Needs:* line would then add the Koszul complex: Tau Ceti `TauCeti.koszulComplex` (`TauCeti/RingTheory/KoszulComplex/Basic.lean`), or DerivedModuleAlgebra §0.K.1, a roadmap this one already uses as a supplier.

## C02 — The guide to the layers makes the division theorem rest on numerical boundedness

Line 69 says that Layer 9 "constructs algebraic vanishing and numerical boundedness, and on them the Ein–Lazarsfeld global division theorem (§9.12)". §9.12 uses §§9.10 and 9.4 only, as its *Needs:* line and the Dependencies paragraph (line 10214) say, and not §9.11. "…numerical boundedness, and on the vanishing theorems the Ein–Lazarsfeld global division theorem (§9.12)" would be exact.

## Previous findings

- R01 — deferred as D01; resolved at this head (below).
- R02 — repaired by removal. The isolated non-klt centre theorem and its route have left this folder. They are now AlgebraicModuliForArithmeticGeometryPartII §6.5, with inversion of adjunction, general members and families at its §6.4, and that folder's review covers them.
- R03 — repaired by removal. The Angehrn–Siu theorem is AlgebraicModuliForArithmeticGeometryPartII §6.8, stated in that roadmap's `Suggested.lean` as `PointSeparation.angehrnSiuPointSeparation`.
- C01 — repaired. The docstring now names the one Layer 9 theorem this pull request adds and what it lacks: "The Ein–Lazarsfeld global division theorem (§9.12) needs the multiplier ideals of an ideal and nef and big divisors."
- C02 — repaired. The description now says that the first part "still cites Part II nowhere", and the README cites AlgebraicModuliForArithmeticGeometryPartII nowhere, as on main.

## Deferred findings

- D01 — resolved: §§9.10a–9.12c moved to AlgebraicModuliForArithmeticGeometryPartII Layer 6 (§§6.1–6.8). This README cites Part II nowhere, so supply runs one way.

## Verified sound

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| §9.12 against its source | E–L Prop. 1.2 (ii), p. 12; Prop. 1.1 (ii), p. 10 | Source: X projective, `ℓ ≥ min(m+k−1, n+k)`, `A−ℓD` ample or big and nef; README identical; `k=1` gives `min(m, n+1)` in both | Agree; none |
| §9.12, `m = 1` | `s` generates `L⊗J`, so `J ≅ L⁻¹` invertible | `I_ℓ = J^ℓ`; `s^k`: `O(K+A−kD)⊗J^{ℓ−k} ≅ O(K+A)⊗J^ℓ`; onto with no positivity; bound `ℓ ≥ k` | True; none |
| §9.12, bound from the chase | Koszul (`k=1`), Schur complex (`k≥2`), degree `p` | needs `ℓ−k−p+1 ≥ 0` for `2 ≤ p ≤ min(m, n+1)`, i.e. `ℓ ≥ min(m+k−1, n+k)` | Bound matches; none |
| §9.12, image lies in `I_ℓ` | `J^k·I_{ℓ−k} ⊆ I_ℓ` | on Y, `O(−kF)·O(K_{Y/X}−(ℓ−k)F) = O(K_{Y/X}−ℓF)` | True; none |
| `I_ℓ` against §9.10 `algebraicMultiplierIdeal` | `c = ℓ` an integer; `ℓ = 0`; `J = O_X` | `⌊ℓF⌋ = ℓF`; `I_0 = f_*O(K_{Y/X}) = O_X` (E–L line 341); `F = 0`, `I_ℓ = O_X` | Consistent; none |
| Check 1 (ℙ¹, `x, y`, `k=1`, `ℓ=2`) | `a = 3`, `a = 2` | `a=3`: degree-1 forms are `x·c₁+y·c₂`; `a=2`: `H⁰(O)=ℂ`, `H⁰(O(−1))=0`, `A−2D=O` nef, not big | True; none |
| Check 2 (ℙ¹, `J=I_P`, `m=1`, `k=ℓ=1`) | `j = 0`, `j = 1` | `min(1,2)=1`; `I_1=I_P`, `I_0=O`; `j=0`: `0=s·0`; `j=1`: linear form vanishing at P is `c·s` | True; none |
| Check 3 (reduced points) | `n=2`, `k=1`, `ℓ=2`; blow-up of Z | `K_{Y/X}=(n−1)E`; `I_ℓ = μ_*O(−(ℓ+1−n)E) = 𝔪^{ℓ+1−n}` (ELS lines 295–300); `m=n` gives `ℓ=n+k−1`, `I_{n−1}=O` | True; none |
| Route term claim (R01) | ℙ¹, `x, y, x+y`, `k=1`, `ℓ=2`, `a=3` | last term `O(−2)`, `i=−1`, `h¹=1≠0`; its needed `H²` is 0 by dimension | Sentence false; R01 |
| Iteration of `k=1` (C01) | step from `k−1` to `k` | `ℓ−1 ≥ min(m+k−2, n+k−1)` iff `ℓ ≥ min(m+k−1, n+k)`; `(A−D)−(ℓ−1)D = A−ℓD` | Same bound; C01 |
| Family 9.13a (i) as a case of §9.12 | `A = L_A+(j+a)L`, `k=a`, `ℓ=D+a−1`, `m=n=D` | `A−ℓD = L_A+(j−D+1)L`, nef and big for `j ≥ D−1`; `I_ℓ=I_Z^a`, `I_{ℓ−k}=O` | Consistent; none |
| Docstring: pins lack nef, big, multiplier ideals | grep of Mathlib and Tau Ceti at the pins | none (Tau Ceti "nef" is only for dual graphs, `Curves/DualGraph/Forget.lean:23`); `AlgebraicCycle` at `AlgebraicCycle/Basic.lean:44` | True; none |
| D01 two-way supply | README at the merge base and at the head | 0 citations of Part II in either; Part II §6 cites §§9.4, 9.7, 9.10 here; Part II scope (line 1565) names §9.12 as this roadmap's | Resolved |
| Seeded sample (15 targets) | location | all in Layers 1, 3, 4, 7 and §9.3, which the change neither alters nor cites | Not re-checked (untouched) |

- Source locators checked against the text: ein_lazarsfeld_nullstellensatz (arXiv v3) lines 320–378 (setup, pp. 8–9), 382–403 (Prop. 1.1, p. 10), 404–452 (proof, (***), p. 11), 461–494 (Prop. 1.2 and sketch, pp. 11–12); els_symbolic_powers (arXiv v3) lines 281–300 (Theorem 2.2 and proof, pp. 7–8); arXiv versions and dates of both new reference lines.
- Library declarations opened at the pins: `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44`; `TauCeti/RingTheory/KoszulComplex/Basic.lean:219` (`koszulComplex`) and `Regular.lean:140` (`exactAt_of_isWeaklyRegular`); `TauCeti/AlgebraicGeometry/Curves/DualGraph/Forget.lean:23`.
- Cross-roadmap citations resolved: AlgebraicModuliForArithmeticGeometryPartII Layer 6 headings and scope (line 1565); MultiplierIdealsOfPairsAndPointSeparation lines 7 and 584 (*Corollary of:* §9.12); ComplexComparisonPartII C7.6; DerivedModuleAlgebra §0.K.1 on main.
- Record: comparing the merge-base README with the head gives 9 layers, none removed or retitled, and one heading added, §9.12, a new id (main ends Layer 9 at §9.11). Seven README lines and one docstring line are extended in place. No Lean declaration is added, removed or restated.
- Automatic checks: all passed at this head. Dependency check with `--movable`: `depcheck: 132 roadmaps, 1467 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: five `sorry` warnings (lines 50, 75, 89, 121, 133), nothing else. No declaration changed, and the elaborated signatures show no lost binder.
- Overlap check: read ComplexComparisonPartII, AlgebraicModuliForArithmeticGeometryPartII, MultiplierIdealsOfPairsAndPointSeparation, ResolutionOfSingularitiesCharacteristicZero (main and open head), SchemeAndStackFoundations (main and both open heads), StableReductionPartII, FunctionFieldArithmeticPartII and FunctorOfPoints. Shared objects and their owners:
  - The global algebraic division theorem belongs to this roadmap (§9.12). Part II's scope names this roadmap as its owner, and the family states 9.13a as a corollary of it.
  - ComplexComparisonPartII C7.6 is Skoda's local analytic division on pseudoconvex domains, a different theorem.
  - Principalization belongs to ResolutionOfSingularitiesCharacteristicZero, consumed through §9.4.
  - None of the other closest roadmaps mentions multiplier ideals or division.
- Source independence: changed passages only. I compared four passages with two sources, all independent:
  - the statement of §9.12 with ein_lazarsfeld_nullstellensatz lines 473–483;
  - its `k = 1` locator with lines 393–403;
  - the route with lines 357–360 and 404–452;
  - Check 3 with els_symbolic_powers lines 287–300.

  The longest shared run is about nine words of hypothesis ("A a divisor on X such that A − ℓD is"), which the mathematics forces. Among the changed passages, Ein–Lazarsfeld 1999 has the largest share, 2 of 4 locators. The arrangement was not compared, since no layer is added, removed or reordered.
- Research link: §9.12 is Ein–Lazarsfeld's global division theorem (1999, Proposition 1.2), the algebraic Skoda theorem behind their geometric effective Nullstellensatz. MultiplierIdealsOfPairsAndPointSeparation deduces its 9.13a division by sections with simple common zeros from it. This rests on the README and the sources read.

## Not verifiable

- Lazarsfeld 2004, *Positivity in Algebraic Geometry II*, §9.6 (the secondary locator of §9.12): a Springer book behind a paywall.
- Numbering of the published Inventiones versions of Ein–Lazarsfeld 1999 and Ein–Lazarsfeld–Smith 2001: read in their arXiv v3 versions, which the reference lines name.

## Source issues

- none

## For the human reviewers

- none
