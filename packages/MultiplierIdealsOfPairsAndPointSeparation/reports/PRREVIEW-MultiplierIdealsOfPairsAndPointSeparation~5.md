# Review of MultiplierIdealsOfPairsAndPointSeparation (pull request #2911 at afb1edc)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/MultiplierIdealsOfPairsAndPointSeparation/`
**Verdict:** needs changes

**Summary.** Changes are needed for one point: the isolated non-klt centre theorem 9.12 is stated without `dim X ≥ 1` and is false when `X` is a point, while the text presents `n ≥ 1` as a restriction of the formal proof only. Everything else checked out: the locators into Kollár, Esnault–Viehweg and the Stacks project, the formal-proof declarations, the supplier sections, the Checks and the Lean statement. There are three small corrections, two format notes and one question, none blocking; four items are left to the human reviewers.

## R01 (P2) — 9.12 is false for `dim X = 0`, and the text says the hypothesis `n ≥ 1` is not needed

The statement of 9.12 (line 192) takes "a projective klt pair" with `c_1, …, c_n` and no lower bound on `n = dim X`, and line 198 lists `n ≥ 1` among the features of "the form … that the family uses", which the Conventions (lines 17–20) describe as restrictions the roadmap's own wider form does not have. An implementer is thereby told to prove the theorem for `n = 0`.

Take `X = Spec ℂ`, `Δ = 0`, `N = 0`, `x` the point. The pair is klt (there is no divisor over `X`), `N` is nef, there are no `c_d`, the sum `Σ_{d=1}^{0} d/c_d` is `0 ≤ 1`, and there is no subvariety of positive dimension, so every hypothesis holds. The only divisor on `X` is `D = 0`, and `(X, 0)` is klt at `x`, so no `D` with "(X, Δ + D) … not klt at `x`" exists. The route also needs `n ≥ 1`: it takes bigness of `N` from `(N^n · X) > c_n^n`, which is a hypothesis only when `X` itself is a subvariety of positive dimension. (9.12b and 9.12c are true for `n = 0`, and 9.12a already says `n ≥ 1`.)

The smallest change: write "a projective klt pair of dimension `n ≥ 1`" in 9.12, and drop `n ≥ 1` from the list of what distinguishes the formal form in line 198 (real `c_d` and `N` nef and big remain).

## C01 — 9.10a (c) does not say what is invariant under an étale morphism or under a field extension

Line 47 asks to prove that "klt and lc are invariant under étale morphisms and under extension of the base field". For an étale `g : X′ → X` the intended statement is presumably pointwise: `(X′, g^*Δ)` is klt (lc) at `x′` iff `(X, Δ)` is at `g(x′)`; the global form needs `g` surjective in one direction. For a field extension `k′/k`, `X_{k′}` is normal but need not be integral (`X = 𝔸¹_{ℚ(i)}` as a `ℚ`-variety becomes two lines over `ℚ(i)`), so it is not a pair in the sense of 9.10a's first sentence. ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.14 consumes the étale invariance, so the statement should be one an implementer can match. Writing the pointwise étale form, and "on each connected component of `X_{k′}`" (or `X` geometrically integral) for the field extension, would do.

## C02 — The description's list of targets that name the formal proof is that of an earlier head

The description says: "Here the targets 9.10a–9.10c, 9.12, 9.12a, 9.13 and 9.13b name the corresponding statements of the formal proof". At this head 9.12b (the smooth case `GlobalTheory.EffGen.core_gen`), 9.12c (the two-point form `GlobalTheory.TwoPoint.SeparatesOnSmooth`, with the statement that the `ℓ`-point form is not in the formal proof) and 9.13a (`FilMono`, `KerRes`, `res_onto`, over number fields) do so as well. The last paragraph before the AI-assistance line says that the project's automatic checks complain of two things (that the family index files lie outside the roadmap folder, and that the roadmap is not yet in the merge order); neither complaint occurs at this head, so a reader would look for problems that are not there. Text that would be right: "the targets 9.10a–9.10c, 9.12–9.12c, 9.13, 9.13a and 9.13b record the corresponding statements of the formal proof and their hypotheses (number fields for 9.13 and 9.13a; two points over `ℂ` for 9.12c)", and that paragraph removed or brought up to date.

## C03 — The description names only one of the objects shared with AbundanceStatement

The description says the pullback of `ℚ`-Cartier Weil divisors "is also planned by AbundanceStatement (Layer 1)". The open AbundanceStatement also plans, in its Layer 2, canonical divisors of normal varieties from differentials and, in its Layer 3, discrepancies and klt for zero boundary with "smooth implies klt", which are the `Δ = 0` case of 9.10a and of its clause (c). A reader deciding the order of the two pull requests needs the full list: add Layers 2 and 3 to that sentence.

## N01 — 9.12c gives no theorem number in Angehrn–Siu

Line 321 cites "Angehrn and Siu 1995" for the `ℓ`-point statement with the constant `½n(n + 2ℓ − 1)` and gives no theorem or page; every other target with a published source has one. Add the theorem number (and the page) of the statement used.

## N02 — `canonicalBundle` shares its short name with a different Tau Ceti declaration

The pinned Tau Ceti has `TauCeti.AlgebraicGeometry.InvertibleSheaf.canonicalBundle` (`AlgebraicGeometry/LineBundle/SerreDuality.lean`, line 65): a line bundle on a curve built from Weil differentials, whose module docstring says it is not yet identified with Kähler differentials. The roadmap's `canonicalBundle` is `det Ω_{X/k}` in any dimension. One clause in its docstring saying that it is not that declaration would spare an implementer the search.

## Questions for the author

- The route of 9.10c (line 143) cites "Kollár–Mori 2.70" beside Lazarsfeld 9.4.17. As I recall it, Kollár–Mori Theorem 2.70 is Kawamata–Viehweg vanishing for a klt pair in its dual form (`H^i(X, O_X(−N)) = 0` for `i < dim X`), with no multiplier ideal. Is that the statement meant, or is Kollár 1997, Theorem 2.16 (which is Nadel vanishing for pairs as 9.10c states it, and is in the references already) the better locator? I had no legal copy of Kollár–Mori to check.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 9.10a discrepancies, klt, lc | `(𝔸², cL)`; cusp; cones over cubic and conic | line: `a = −c`; cusp: `1−2c, 2−3c, 4−6c`, all `> −1` iff `c < 5/6`; cone of degree `d`: `a = 2 − d`, so `−1` and `0` | Checks true; first-blow-up variant gives `c < 1` | C01 on (c) |
| 9.10a pullback `f^*D` | Stacks 02OO case (2); two presentations `(r, A)`, `(r′, A′)` | STACKS-DIVISORS line 1064: integral, dominant; `r′A = rA′` by injectivity (PartII §0.7, read) | supported | none |
| 9.10b `J(X, Δ)` | `(𝔸², cL)`; cusp; cone over cubic; smooth `X`, `Δ = cD` | `O(−⌊c⌋L)`; `m` for `5/6 ≤ c < 1`; `f_*O(−E) = m`; `⌈K_Y − f^*(K_X + cD)⌉ = K_{Y/X} − ⌊c f^*D⌋` | true; agrees with AMAG §9.10 formula | none |
| 9.10c Nadel vanishing (headline 1) | `ℙ²`, `Δ = cL₀`, `O(k)`; elliptic curve; smooth case in AMAG §9.10 | degree `k + 3 − c > 0` iff `k ≥ −2` (`c < 1`), `k ≥ −1` (`c = 1`); `H²(O(k)) ≠ 0` iff `k ≤ −3`; `a⊗M = O`, `L − K_X − Δ` nef big | true; KOL97 line 538 (Thm 2.16) states it for normal proper `X` | none |
| 9.10d (a) asymptotic Riemann–Roch | `ℙ^d`, `O(1)`; `d = 2` | `binom(m+d, d) = m^d/d! + O(m^{d−1})`; `(m+1)(m+2)/2` | STACKS-VARIETIES line 4868 (0BJ8): proper, ample, `c = deg/d!` | none |
| 9.10d (b) Kodaira's lemma | blow-up of `ℙ²`; `ℙ¹×ℙ¹`, `O(1,0)` | `(2h−e)·e = 1`, `(2h−e)(h−e) = 1`, `(2h−e)² = 3`; `O(ν−a, −b)` has fibre degree `−b ≤ 0` | ESVI92 line 1735 (5.4 d), printed p. 44) | none |
| 9.12 isolated non-klt centre | `X = Spec ℂ`; rational `c_d`, `(1−ε)N`; smooth point | `n = 0`: hypotheses hold, no `D`; margin `≥ 1/q` in `(1/q)ℤ`; blow-up discrepancy `n − 1 − mult < −1` | false at `n = 0`; KOL97 lines 1555–1567 (6.4, p. 35) give `D ≡ N` | R01 |
| 9.12a two-point separation (headline 4) | `ℙ¹`, `O(a)`; uniform `c(e)`; formal statement | `2/c(1) ≤ 1`, `a > c(1)` gives `a ≥ 3`; `Σ 2^{1/e}e ≤ Σ(e+1) = ½n(n+3)`; route step (2) keeps class `qN₀/m′ = N` | KOL97 lines 1362–1374, 1572–1581; formal `PointSeparationPair` has the same hypotheses | none |
| 9.12b global generation (headline 2) | `ℙ¹`, `c_1 = 1`; `c_d = ½n(n+1)`; `(ℙ¹, −½p)`; `n = 0` | `a > 1`, `O(a−2)` generated iff `a ≥ 2`; `Σ d/c_d = 1`; `K + Δ + N = K + q`, degree `−1`; point: `M ≅ O` | KOL97 lines 1349–1360 (5.8, p. 30), 1392–1397 (5.10) | none |
| 9.12c and `adjoint_separates_points` (headline 3) | `ℙ¹`, `ℓ = 2`; genus `g` curve, any `ℓ`; `n = 0`; `ℓ = 0, 1`; reduction to `ℂ` | threshold `2`, `a ≥ 3`; `a > ℓ` gives `deg(K+L−Σx_i) > 2g−2`; `Σ ℓ^{1/k}k ≤ ½n(n+2ℓ−1)`; `Σ m_i(L^d·Z_i) ≥` one term | Lean equals README; threshold in `ℚ` (no truncated subtraction); 0BES at STACKS-VARIETIES line 4784 | N01 |
| `selfIntersection` | `r = 1`; polynomial of degree `≤ d`; other roadmaps' definitions | `χ(a) − χ(O)`; `d`-th difference `= d!·`leading coefficient; equals the diagonal of DynamicalDegreesOfRationalMaps `numericalIntersection` | determines `(L^d·Z)`; truncation at `r + 1` sums `i ≤ r` | none |
| `canonicalBundle` | `ℙ¹`; rank `0`; Tau Ceti's curve declaration | `O(−2)`; `O`; different object and namespace | real body, no lost binder | N02 |
| 9.13 Bertini | `ℙ¹`, `O(d)`, `U = ℙ¹ ∖ [1:0]`; `dim V = D + 1` | resultant, `Q = disc·`(coefficient of `x^d`), `s(1,0) =` that coefficient; `X = ℙ^D`, `δ = 1`, `f_X = det` | true; Koszul length `= D`-th difference `= (L^D)`; formal `Bertini` is over number fields as stated | none |
| 9.13a division | `ℙ¹`, `D = 1`; `Z = ∅` on `ℙ¹×ℙ²` with `s = (x, x, y)`; Koszul ranges | `H⁰(O(j))` vanishing at `P` is `s·H⁰(O(j−1))`, `j ≥ 0`; needs `H^{p−1}(F⊗L^{j+1−p}) = 0`, `p ≤ D`, i.e. `j ≥ D − 1` | true for `j ≥ D − 1`, all `a`; formal `FilMono` has `j ≥ D`, `KerRes` `l + 1 ≥ D` as stated | none |
| 9.13b bound for sections | `ℙ^d`; `ℙ¹×ℙ¹`, `O(1,1)`; `ℙ²`, `O(2)`; `(L^d) = 0`; `ℙ¹`, `O(2) = O(1)(P)` | `binom(b+d,d)` equality; `(a+1)(a+2)` equality at `(a, a+1)`; `(2a+3)(a+1) ≤ 2(a+2)(a+1)`; hypothesis forces `(B·L^{d−1}) < 0`, `h⁰ = 0`; `b + 1 ≤ a + 1` | true; (b): each replacement adds `(L′^i·L^{d−1−i}·P) ≥ 0` | none |
| Conventions: `(L^d·Z)` | Stacks 0BEP; `ℚ`-Cartier scaling | coefficient of `n_1⋯n_d`, STACKS-VARIETIES line 4754; `r^{−d}(O(rN)^d·Z)` | agrees with CyclotomicClassGroupsAndStickelberger §4.3 and DynamicalDegreesOfRationalMaps §2.2 | none |

- Source locators checked against the text: 15 (KOL97: Theorems 2.16, 5.8, 5.9, 5.10, 6.4, 6.5, 6.6.1, 6.7.1, 6.8.1, 7.8, with pages 30, 31, 35; ESVI92 5.4 d) p. 44; Stacks 01WV, 02OO, 0BEP, 0BES, 0BJ8).
- Formal-proof declarations opened in the public repository: 21 files located, 14 statements read (`IsolatedNonKltDivisor`, `PointSeparationPair`, `nadelVanishing`, `DivOver`, `core_gen`, `SeparatesOnSmooth`, `Bertini`, `KerRes`, `FilMono`, `res_onto`, `interNum_cons_le`, `globalSections_dim_le_of_intersection_bound`, `IsNef`, `IsBig`); each has the hypotheses the README records.
- Library declarations opened at the pin: `eulerCharBelow` (`AlgebraicGeometry/Cohomology/EulerCharacteristic.lean`, line 105), `InvertibleSheaf.canonicalBundle` (`AlgebraicGeometry/LineBundle/SerreDuality.lean`, line 65), `LineBundleClass.intersectionNumber` (`AlgebraicGeometry/IntersectionNumber/Basic.lean`, line 111), `bijective_cohomologyBaseChange` and `finrank_cohomology_pullback_eq_of_isPullback` (`AlgebraicGeometry/Cohomology/FlatBaseChange.lean`, lines 185, 277), `koszulComplex.exactAt_of_isWeaklyRegular` (`RingTheory/KoszulComplex/Regular.lean`, line 140), `koszulComplex.smulHomotopy` (`RingTheory/KoszulComplex/Basic.lean`, line 331), `isRegularLocalRing_stalk_of_smooth` (`AlgebraicGeometry/Morphisms/Smooth/Regular.lean`, line 43), `IsRegularLocalRing.isCohenMacaulay` (`RingTheory/RegularLocalRing/CohenMacaulay.lean`, line 125), `Module.IsCohenMacaulay.isRegular_of_le_radical` (`RingTheory/CohenMacaulay/RegularSequence.lean`, line 187), `SchemeWeilDivisor` (`AlgebraicGeometry/WeilDivisor/Scheme/Basic.lean`, line 45).
- Cross-roadmap citations resolved: 25 (AlgebraicModuliForArithmeticGeometry §§1.5, 1.6, 9.10 with five declaration names; PartII §§0.7, 1.5, 1.6, 1.7 (ii), (v), 3.3; CyclotomicClassGroupsAndStickelberger §4.3; ResolutionOfSingularitiesCharacteristicZero §§5.1, 5.5, 5.6, 7.7; SchemeAndStackFoundations §§0.9, 2.2, 2.6, 3.4, 4.12, 4.13, 4.17, 5.2, 5.3 with eight declaration names; ArakelovGeometryAndAbelianHeightsPartII §0.3 (1′) and DynamicalDegreesOfRationalMaps §2.2 at their open heads). AlgebraicModuliForArithmeticGeometry Layer 9 ends at §9.11, so the ids here are new.
- Dependency check: `depcheck: 170 roadmaps, 1989 edges, 0 problem(s)`; no upward or cyclic edge; the two open suppliers stand directly before this roadmap in the order. No change outside the folder other than the family index.
- Elaboration: `Suggested.lean` elaborates with `sorry` on `adjoint_separates_points` as the only warning; the three elaborated types were compared with the README (no binder lost). One-tactic probe on a scratch copy (`simp`, `rfl`, `infer_instance`): the goal stays open, so the theorem is not padding. Headlines 1, 2 and 4 need `ℚ`-Weil divisors, klt pairs and `J(X, Δ)`, absent at the pins, and the module docstring says so for each.
- Automatic checks: all passed at this head.
- Overlap check: read ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, DynamicalDegreesOfRationalMaps, ChowFormsAndHeightsOfSubvarieties, HeightsForLogSingularMetrics, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, AlgebraicModuliForArithmeticGeometryPartII, AlgebraicModuliForArithmeticGeometry (and, by object, SingularHermitianMetricsAndL2Methods and AbundanceStatement); numerical intersections: CyclotomicClassGroupsAndStickelberger §4.3 with DynamicalDegreesOfRationalMaps §2.2, cited; multiplier ideals of ideals on smooth varieties and Kawamata–Viehweg: AlgebraicModuliForArithmeticGeometry §9.10, cited; analytic multiplier ideals and their comparison: SingularHermitianMetricsAndL2Methods, which cites 9.10b; Kodaira's lemma: this roadmap (SingularHermitianMetricsAndL2Methods uses it inside a route only); Chow forms: AlgebraicModuliForArithmeticGeometry §1.6, cited (ChowFormsAndHeightsOfSubvarieties states the hyperplane-section rule for cycles over number fields, a different statement from the factorisation 9.13 (iii)); canonical divisors, pullback of `ℚ`-Cartier Weil divisors and zero-boundary klt: also planned by the open AbundanceStatement, which may not be cited as a supplier, so the order is left to the human reviewers.

Source independence: 9 passages compared with 4 sources (KOL97, ESVI92, STACKS-VARIETIES, STACKS-DIVISORS), none shared; largest share KOL97, 10 of 19 locators; contents compared with KOL97: independent (its §§2, 3, 5, 6 meet 9.10c, 9.10a, 9.12a–b, 9.12 in another order, and 9.10b, 9.10d, 9.12c, 9.13–9.13b have no section there). LAZ04, ANGSIU95 and Kollár–Mori could not be read.

Research link: 9.12–9.12c are the effective freeness and point separation theorems of Angehrn–Siu (1995) in the algebraic form of Kollár (1997, Theorems 5.8, 5.9, 6.4, 6.5), built on multiplier ideals as in Lazarsfeld (2004); the README's references say Alpöge's formal proof (2026) uses them. Rests on KOL97 and the README.

## Not verifiable

- Lazarsfeld, *Positivity II*, 9.1.22, 9.2.19, 9.4.17 (routes of 9.10b, 9.10c): paywalled book, cited by locator only.
- Angehrn–Siu 1995 (9.12c, the `ℓ`-point statement and its constant): paywalled article, cited without a theorem number; the constant was checked only for consistency (`ℓ = 1, 2` against Kollár 5.10 and 5.9, and `Σ ℓ^{1/k}k ≤ ½n(n + 2ℓ − 1)`).
- Kollár–Mori 2.31 and 2.70 (routes of 9.10a, 9.10c): no legal copy among the texts available to this review.
- The routes of 9.12a steps (3)–(5) and of 9.12c over `ℂ` were read for consistency of their numbers (the count `|P|·binom(M + e − 1, e)` against `h^e(N^e·Z) > |P|e^e`), not checked step by step against Kollár §6 beyond 6.6.1, 6.7.1 and 6.8.1.

## Source issues

- none

## For the human reviewers

- **Scope.** 9.13, 9.13a and 9.13b cite no published statement; the README (lines 24–25) calls them its own formulations. Their only external form is in [FormalProof] and [Announcement] (README lines 563–564), neither refereed.
- **Licence.** [FormalProof] (README line 563) is a repository whose own README says it was published without a licence. The roadmap cites its file paths and declaration names; `adjoint_separates_points` is not a statement of that repository.
- **Not tested.** LAZ04 and ANGSIU95 are cited by locator without their text, and Kollár–Mori was not read; wording and locators were not compared against them.
- **Ownership.** The open AbundanceStatement (Layers 1–3) plans canonical divisors, pullback of `ℚ`-Cartier Weil divisors and zero-boundary klt, the `Δ = 0` case of 9.10a; it is not citable as a supplier, so which pull request yields is a human decision.
