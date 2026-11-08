# Review of ErdosProgressionPowers (pull request #1336 at aaab8ad)

**Verdict:** needs changes

This is an incremental re-review of the 59 lines changed since 4b475b9. The previous finding is repaired, and the other change of this head, handing the finite Gram inequalities to SieveMethodsAndPrimePatterns §0.4, resolves correctly against that roadmap's head. There is one finding, P2, outside the diff: a supplier the untouched text cites five times, ComputationalNumberTheory §4.22, no longer exists at the supplier's head, because that roadmap moved the content to ExplicitZetaBounds. It is raised as supplier drift that arose since the citation was last resolved, not as a re-litigation of text an earlier review passed; the exact repair is below. The gate passes at this head (re-run here, build included), `lake env lean` gives only the eight `sorry` warnings, the dependency check reports 0 problems, and nothing changed outside the folder.

## R01 (P2) — ComputationalNumberTheory §4.22 no longer exists at its head; the zero-line clause now lives in ExplicitZetaBounds §§0.2–0.4

**Location.** `TauCetiRoadmap/ErdosProgressionPowers/README.md:84` ("ComputationalNumberTheory §4.22 owns the bounded-height zero-line verification for primitive characters of small modulus"), l.622 and l.626 (the `ModEightFiniteInput` row and the sentence after the table), l.673–683 (the contract `### From TauCetiRoadmap.ComputationalNumberTheory`, "Consume §4.22 at the primitive conductors 1, 4 and 8"), l.898 and l.928 (§0.9 prose and *Needs:*), l.2376 (the Platt2013v1 reference, "consumed from ComputationalNumberTheory").

**Claim.** ComputationalNumberTheory §4.22 states that every zero of the continued L-function of a primitive character of modulus q ≤ 400 000 with 0 < Re s < 1 and |Im s| ≤ H(q) lies on Re s = 1/2, with H(q) ≥ 10⁸/q, so that the zero-line clause of AnalyticNumberTheoryPartI §0.16's `ModEightFiniteInput` is supplied at the conductors 1, 4 and 8.

**Witness.** `roadmaps show ComputationalNumberTheory --pr 1408` (index of 2026-11-08T14:43Z): the Layer 4 headings run `### 4.21a Argument counts and Turing comparison` (l.2423) then `### 4.25 Entrywise lower bounds on effective vectors` (l.2513); the string "4.22" occurs nowhere in the file. Its scope paragraph (l.121–124) now says that ExplicitZetaBounds §§0.3 and 0.4b own Platt's finite-conductor material, the heights `plattHeight`, the records `PlattRecord` and `PlattCentralRecord` and `LFunction_ne_zero_of_platt`, and that ComputationalNumberTheory "states none of them". At the r3 review of 2026-11-07 the section still existed (l.2491 of that head). ExplicitZetaBounds at its head (`roadmaps show ExplicitZetaBounds --pr 1954`) states the content: §0.2 (l.437) defines `RH(H)` and `GRH(q, H)` and proves the passage to imprimitive characters (zeros of χ in the open strip are those of its primitive character, the Euler factors at p | q vanishing only on Re s = 0); §0.3 (l.498) takes `GRH(q, H(q))` for 2 ≤ q ≤ 400 000 as the record `PlattRecord` and proves the corollaries `GRH(q, 10 000)` for 2 ≤ q ≤ 13 and `GRH(8, 10 000)`; §0.4 (l.538) records `RH(10⁹)` and `RH(3·10¹²)` for ζ. In the merge order ExplicitZetaBounds is line 266 and this roadmap line 273, so the citation is downward. One detail of the present contract is also corrected by the owner: §0.3 (l.510–513 and the Check at l.530–534) says that q = 1 is not part of Platt's record, so "H(1) ≥ 10⁸" from Platt's theorem (l.676–677) is not what the supplier states; `RH(10 000)` for the conductor-1 clause comes from the §0.4 records by antitonicity.

**Repair.** Replace every "ComputationalNumberTheory §4.22" by the ExplicitZetaBounds sections, and rename the contract. At l.84: "ExplicitZetaBounds §§0.2–0.4 own the bounded-height Riemann hypotheses `RH(H)` and `GRH(q, H)`, Platt's finite-conductor theorem in that form and the recorded verifications for ζ." At l.622 and l.626: "the zero-line clause is ExplicitZetaBounds §0.3's `GRH(8, 10 000)` with §0.4's `RH(10⁹)` and §0.2's passage to imprimitive characters". Replace l.673–683 by `### From TauCetiRoadmap.ExplicitZetaBounds` with: "Consume §0.2's `RH(H)` and `GRH(q, H)` and its passage to imprimitive characters: every character modulo 8 has its zeros with 0 < Re s < 1 and |Im s| ≤ H on Re s = 1/2 as soon as `GRH(f, H)` holds for f ∈ {1, 2, 4, 8}. Consume §0.3's corollaries `GRH(8, 10 000)` and `GRH(4, 10 000)` of the record `PlattRecord` (Platt2013v1, Theorem 7.1), `GRH(2, H)` being vacuous, and §0.4's record `RH(10⁹)`, hence `RH(10 000)` by antitonicity. Together these give the zero-line clause of AnalyticNumberTheoryPartI §0.16's `ModEightFiniteInput`, used in §0.9." At l.898, l.928 and l.2376 write "ExplicitZetaBounds §§0.2–0.4" in place of "ComputationalNumberTheory §4.22". Nothing in `Suggested.lean` changes. The pull request's supplier list then names ExplicitZetaBounds as a direct supplier. I checked the repaired contract against the owner's text: `GRH(8, 10 000)` and `GRH(q, 10 000)` for 2 ≤ q ≤ 13 are stated at ExplicitZetaBounds l.503–504, `RH(10⁹)` as the second record of §0.4 (l.545), the imprimitive passage at l.454–462, and the depcheck direction (266 < 273) is downward.

## Previous findings

- R01 — repaired: l.57–62 now reads "The Frey–Hellegouarch curve Y²=X(X−A)(X+B) of EllipticCurves §Worked examples is formalised at the pin as Tau Ceti `TauCeti.freyCurve`, with the same coefficients over any commutative ring … this roadmap consumes both from the pins", and l.365–368 "formalised at the pin as `TauCeti.freyCurve` (From Tau Ceti), with the same coefficients (0,B−A,0,−AB,0)". Both agree with EllipticCurves `README.md:1507` (the heading "Worked examples") and l.1583–1585 (y² = x(x − A)(x + B), a₂ = B − A, a₄ = −A·B over any `CommRing`), its `Suggested.lean:1164`–1169, and the pinned `FreyCurve/Basic.lean:115`–120. The repair introduced no new problem.

## Verified sound

**Gate, build, dependencies.** I re-ran the gate on this head with the build:

```text
gate ErdosProgressionPowers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The dependency check (`--movable`, against the content repository's main) printed:

```text
depcheck: 234 roadmaps, 2418 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. In the merge order SieveMethodsAndPrimePatterns is line 55, ComputationalNumberTheory 265, ExplicitZetaBounds 266, EllipticCurveModularityPartII 272 and this roadmap 273. `git diff --stat origin/main...HEAD` outside the folder is empty. Since 4b475b9 only `README.md` changed (35 insertions, 24 deletions); `Suggested.lean` is byte-identical, so the 16 elaborated signatures of the previous report stand. `lake env lean` on `Suggested.lean` took 5 s and gave exactly eight `declaration uses sorry` warnings (l.94, 105, 130, 143, 149, 155, 164, 172), nothing else. The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`; both `TauCeti.*` imports have object files.

**The SieveMethodsAndPrimePatterns hand-off (the other change of this head).** SieveMethodsAndPrimePatterns is on no branch of main; it is the open pull request #1495 (head f07c3fe9), a new roadmap, named in this pull request's supplier list, and at merge-order line 55, before this roadmap. At that head:
- `README.md:436` is `### 0.4 finite Gram inequalities`; l.484, 496 and 508 state the uniform, maximum-row and diagonal/off-diagonal forms, each with its locator "BENNETT-SIKSEK-2020, Theorem 7, p.379" (l.488, 500, 512), and l.4291 is the same Annals paper this roadmap cites as BS20.
- `Suggested.lean:40` opens `namespace TauCetiRoadmap.SieveMethodsAndPrimePatterns`, l.45 `namespace SieveGram`; l.57 `sum_norm_inner_sq_le_of_row_le (y : ι → E) (x : E) {C : ℝ} (hC : 0 ≤ C) (hrow : ∀ i, ∑ j, ‖⟪y i, y j⟫‖ ≤ C) : ∑ i, ‖⟪x, y i⟫‖ ^ 2 ≤ C * ‖x‖ ^ 2`; l.62 `sum_norm_inner_sq_le_max_row [Nonempty ι]` with `Finset.univ.sup'` of the row sums; l.69 `sum_norm_inner_sq_le_of_diag_offdiag` with `(hDO : 0 ≤ D + O) (hdiag : ∀ i, ‖y i‖ ^ 2 ≤ D) (hoff : ∀ i, ∑ j ∈ Finset.univ.erase i, ‖⟪y i, y j⟫‖ ≤ O)` and conclusion `≤ (D + O) * ‖x‖ ^ 2`. The variables are `[RCLike 𝕜] [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [Fintype ι]`, so "real or complex inner-product space", "finite, possibly empty family" and "for a nonempty family" at README l.687–693 are exactly the supplier's hypotheses. The three names at l.689, 691, 692 are therefore the supplier's declarations (the resolver flags them only because it looks for Lean names in the pinned libraries).
- The three deleted Checks and the Gram paragraph of §3.1 (previous l.1455–1460, 1487) are not cited anywhere else: `roadmaps grep --fixed 'ErdosProgressionPowers §3.1'` and `… 'ErdosProgressionPowers Layer 3'` find no match on main or in any open pull request, so no consumer breaks. `roadmaps grep 'sum_norm_inner_sq'` finds the names only at #1495 and here, and `roadmaps grep -i --readme-only 'Gram row'` finds no second owner (CalibratedGeometry's hit is a Gram matrix of a calibration, a different object). The pinned Mathlib has `NumberTheory/SelbergSieve.lean` (the sieve, not the Gram inequality) and no Bombieri–Selberg Gram inequality, so SieveMethodsAndPrimePatterns is the earliest owner.
- The remaining mentions (l.108, 1432, 1522, 1524, 1534, 2288–2289) all say "SieveMethodsAndPrimePatterns §0.4" and the diagonal/off-diagonal form, consistently; the §3.1 *Needs:* line dropped "finite inner-product spaces" accordingly.

**Seeded sample.** Of the fifteen seeded targets none falls in the diff; the one locator the diff touches is BS20, Theorem 7, p. 379 (l.696). In the publisher text (BS20 cache, page 25 = printed p. 379, line 1046): "Theorem 7. If x, y₁,…,y_m are vectors in an inner product space, then Σ|x·yᵢ|² ≤ ‖x‖²·max_i Σ_j |yᵢ·yⱼ|", attributed to Bombieri, Proposition 1 of [6], after Selberg; (32)–(34) at lines 1060–1075 apply it with x = (Λ(m)) and y_a = (χ_a(m)) on k/2 < m ≤ k, as §3.3 (l.1522) says. The other seeded targets were verified in r4 and r5 and are untouched.

**Computed adversarial pass.** Rows marked (r4) or (r5) carry forward the previous reports' computations for statements the diff leaves untouched; the rest are new for the changed passages.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| Uniform Gram-row form (l.689–690) | x = y₁ = y₂ = e (unit); x = e₁, y = (e₁, e₂) orthonormal; empty family with C = 0 | rows r₁ = r₂ = 2, left 1+1 = 2 ≤ C‖x‖² = 2; rows 1, left 1 ≤ 1; left 0 ≤ 0 | holds with equality on repeated vectors, so off-diagonal terms cannot be dropped |
| Maximum-row form (l.691) | x = 1, y = (1, 2) in ℝ | rows 3 and 6, left 1+4 = 5 ≤ ‖x‖²·6 = 6 | holds; empty family has no maximum, which is why the uniform form carries C ≥ 0 |
| Diagonal/off-diagonal form (l.692–694) | equal unit pair D = 1, O = 1; orthonormal pair D = 1, O = 0; empty family D = −1, O = 0 | 2 ≤ 2; 1 ≤ 1; D+O = −1 < 0 excluded, otherwise 0 ≤ −‖x‖² would fail for x ≠ 0 | the hypothesis D+O ≥ 0 is needed exactly for the empty family |
| §3.3 application (l.1521–1522) | x_m = Λ(m), y_a = χ_a on (k/2, k], |B| > 17 log k | ‖y_a‖² ≤ ⌈k/2⌉ ≤ (k+1)/2 = D; off-diagonal row ≤ (|B|−1)k^{1−c₃} ≤ |B|k^{1−c₃} = O; mean over B ≤ ((k+1)/(34 log k) + k^{1−c₃})‖x‖²; ‖x‖² = Σ Λ(m)² = k log k/2 + O(k); product (k log k/2)(k/(34 log k)) = k²/68 | matches l.1521; 1/68 = 0.014706 < 0.1239² = 0.015351 |
| Frey curve sentence (l.57–62, 365–368) | A = 1, B = 3; A = 1, B = 2 | pinned `freyCurve A B`: (a₂, a₄) = (B−A, −AB) = (2, −3); (1, −2); EllipticCurves l.1584 gives the same formulas | the two roadmaps and the pin state one curve |
| ComputationalNumberTheory §4.22 heights (l.676–677), re-resolved | q = 1, 4, 8 | 10⁸/q = 10⁸, 2.5·10⁷, 1.25·10⁷, all > 10⁴; but the owner's §0.3 excludes q = 1 from Platt's record; `RH(10⁹)` is a §0.4 record | arithmetic right, owner moved: R01 |
| §1.2 `progressionFreyCurve` (r5) | (1,1,0,1,2); (2,1,0,1,2); (−3,2,0,1,2) | (a₂,a₄) = (2,−3); (1,−2); (4,3); `a₂ = 3` refuted | Checks hold |
| §1.2 degenerate (r5) | n = d = 0 | g = 0, a = c = 0, y² = x³ singular; excluded by gcd = 1 | matches |
| §1.12 `HasFullRationalTwoTorsion` (r5) | X(X−1)(X+3); X³−2; X(X²+1) | 4, 1, 2 | Check correct; ↔ `FullRationalTwo` by `Iff.rfl` |
| §1.12 singular Frey curves (r5) | `freyCurve 0 1`, `freyCurve 1 (−1)` | nonsingular 2-torsion count 2, 2 | no junk positive |
| §1.12 `comparison_curve` (r5) | σ = id; ℓ = 0, 1; F := E_a | identity clause trivial; ℓ = 0, 1 outside H; F := E_a fails N_{E_a} = M_a when a prime is deleted | not vacuous; seven one-tactic probes fail |
| §0.1 `primitive_solution`, `H` (r4) | (1,24,3,35,2); (−3,2,4,3,2); (4,2,1,2,2); k = 0; k = 2 | 1225 = 35²; 9 = 3²; gcd 2; `0<0` false; `10⁸ ≤ 2` false | keep |
| §0.4 `smallPart` (r4) | (3,64), (2,27), (5,−12), (5,60), (5,0) | 64; 1; 12; 12; 1 | keep |
| §0.5 `A(k)` (r4) | k = 0,1,2,3,5 | ∅, ∅, ∅, {(0,1,2)}, 4 elements | keep |
| §0.6 `κ` (r4) | (0,1,1,2), (0,1,2,3), (1,2,2,3); (0,1,1,3) | −1, −2, −1; 2 ≠ 3 | keep |
| §0.8 (r4) | n=1, d=2, k=6, r=3; r=1000, n=1000, k=3 | I₃ = {1,4}, 2 ≤ 3; +1 needed | keep |
| §1.3 invariants (r4) | n = d = 1, (0,1,2) | 16(abc)² = 2304; c₄ = 208 | source's 64(abc)² is the misprint |
| §1.7 `deletionLevel` (r4) | 11a1 at ℓ = 5, 3; M = 33, 99 at ℓ = 3; ℓ = 0 | 1, 11; 11; 9; no deletion | keep |
| §1.9 headline (r4) | p = k prime; k = 10⁸ | p = k admitted; log(2⁷e^{1.000081k}) ≪ 10^k | keep |
| §1.11 (r4) | N = 1, 11 | μ(11) = 12, μ(44) = 72, F_K(11) = 9, G_K(11) = 169; F_K(1) = 1, G_K(1) = 4 | keep |
| §2.3 (r4) | ε = 0.002811 | (1−3ε)/8 = 0.123945875 > 0.1239 | keep |
| §2.4 (r4) | 𝔽₅, λ = 4 | #F_λ = 8, #F′_λ = 4 | keep |
| §2.7 `oddPart`, headline (r4) | N = 12, 16, 24, 48, 0; k = 5 | 3, 1, 3, 3, 0; `Ioc 2 5` = {3,4,5} | keep |
| §3.1 conductor comparison (r4) | N = 8, 24, 16 | 8 = 4·e^{θ(2)}; 24 = 4·e^{θ(3)}; 16 > 8 | keep |
| §3.3 margin (r4) | — | 1/68 = 0.014706 < 0.015351 | keep |
| §4.1 (r4) | δ = 10⁻⁵ | 9 149 543 ∈ (10⁶, 10⁷) | keep |
| §5.7 (r4) | x = 64 | 8·64^{7/2} = 64⁴ = 16 777 216 | keep |
| §5.8 (r4) | N = 120; 3, 5, 1 | 15 = 120/8; 5 ≥ 2.47 | keep |
| §6.2 headline (r4) | d = 0; n = 0 | y·d = 0; y = 0 | keep |
| §6.3 range (r4) | (3,4),(4,3),(5,2),(4,2),(3,3),(3,2) | 2g−2 = 4, 18, 8, 0, 0, −2 | keep |
| §6.3 signed boundary (r4) | (−3,2), k = 4 | product 9 = 3² | keep |
| §7.1 headline (r4) | n = 1, k = 2; n = 4, k = 1 | 2 not a power; k = 1 excluded | keep |
| §7.3 (r4) | b = 2, n = d = y = 1, k = ℓ = 2; b = 0 | 2 = 2·1²; b = 0 excluded | keep |

**Headlines.** Unchanged since r5: the eight headline theorems of README l.696–700 (§1.9, §1.12, §2.7, §6.2, §6.3 twice, §6.5, §7.1) are stated in `Suggested.lean`; the docstring names §1.10 (the residual Artin conductor) as not statable at the pins. No padding probe was rerun because the Lean file is unchanged; the r5 probes on `comparison_curve` and the r4 probes on the other seven stand.

**Library declarations opened at the pins.** `TauCeti.freyCurve` (`AlgebraicGeometry/EllipticCurve/FreyCurve/Basic.lean:115`–120): a₁ = 0, a₂ = B − A, a₃ = 0, a₄ = −(A·B), a₆ = 0 over any `CommRing`, with the simp lemmas `freyCurve_a₁`…`freyCurve_a₆` at l.124–128, as l.57–62 and l.365–368 say. `Mathlib/NumberTheory/SelbergSieve.lean` exists and is the Selberg sieve, not the Gram inequality.

**Other cross-roadmap citations resolved this round.** EllipticCurves on main: `README.md:1507` heading "Worked examples (acceptance criteria, keeping the theory honest)", l.1583–1585 the Frey–Hellegouarch worked example, `Suggested.lean:1164` `def freyCurve`. SieveMethodsAndPrimePatterns #1495 as above. ExplicitZetaBounds #1954 §§0.2–0.4 as in R01. ComputationalNumberTheory #1408 as in R01. The resolver's seven other leads are untouched text and resolve as before: `ComputationalNumberTheory §4.22` is R01; "ErdosSelfridge1975, §2.1" is a source locator, not a roadmap; `IntegralModel.residualSS`, `Conductor.artinConductor`, `Conductor.artinConductorNat`, `Conductor.primeToPConductor` are ArithmeticGaloisRepresentations README API names at #856 (`README.md:1226`, 2715, 2845), and `ContinuousRep.exists_stable_lattice_iff` is EtaleCohomologyFoundations `Suggested.lean:275` on main.

**Ownership and overlap.** `scratch/overlaps.md` lists no other pull request changing this roadmap, no cited id an open revision drops, and no id this pull request drops. The ComputationalNumberTheory drop of R01 is not in that list because ComputationalNumberTheory is itself a new-roadmap pull request, not a revision of a roadmap on main. The deleted Gram target was cited by no other roadmap (greps above).

**Remarks on untouched text (no change requested).** The reference entry `Bombieri1987` (l.2375) is cited by no target at this head, and was cited by none at 4b475b9 either.

## Not verifiable

- **Green2026**: no legal source is known. It is consumed only through AnalyticNumberTheoryPartI §0.34c and is untouched by the diff.
- **Waived and uncertified texts.** IwaniecKowalski2004, RosserSchoenfeld1962, Tenenbaum1995 and RahmanRoth are waived and cited by locator; Mazur1978 is uncertified; Faltings1983 is in the cache as an unreadable scan. None is touched by the diff.
- **Gap registration.** The board package has no `design/plan.json`, so whether the four `gap:` slugs of the AnalyticNumberTheoryPartI contract are announced on the supplier's job could not be checked. They are unchanged by the diff.

## Source issues

- **Misprint** in BS20 at Lemma 3.2, printed p. 361 (line 283): the source gives the discriminant of Y² = X(X−a)(X+c) as 64(abc)²; it should be 16(abc)², the Weierstrass discriminant of that model; affects a stated result.
