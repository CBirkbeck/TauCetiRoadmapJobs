# Review of GeometryOfNumbersAndQuadraticArithmetic (pull request #851 at 6143cad)

**Verdict:** needs changes

This is a full review: the folder changed by 571 lines since `da750f5`, the head the previous review read. The two commits since then delete the σ-finite Poisson theory and the stable stems (the previous R01), widen the maximal-lattice mass formula to `K = ℚ` (R02), fix the Layer 2 introduction and the §6.6a and §6.8 locators (R03–R05), and move Henk's and Davenport's counts, Howe–Moore, Moore ergodicity and Mahler's criterion out to SieveMethodsAndPrimePatterns §0.11a and ProbabilisticAndMetricNumberTheory §§4.9a–4.9b. All five previous findings are repaired (see *Previous findings*). The gate passes with the merge order the brief names, the dependency check reports no problem, `Suggested.lean` elaborates with 21 `sorry` warnings and no error, and none of its 21 theorems closes with one tactic.

Three findings remain: one two-owner overlap that the previous review recorded as a board matter but that the declared-gap mechanism settles (P2), a supplier citation in §3.3 whose target does not exist at the cited head (P3), and five §5.1a names presented as Lean declarations of a supplier that does not declare them (P3).

## R01 (P2) — The finite-`𝔽₂` Arf algebra has a second owner, GeometricTopology §4.3.1, and is neither cited nor declared as a gap

**Location.**
- `README.md` line 2751, *The Arf invariant*: "Over such a field prove that a nonsingular form is an orthogonal sum of hyperbolic planes and at most one anisotropic plane, that nonsingular forms of equal dimension are isometric exactly when their Arf invariants agree, and that a nonsingular form has a Lagrangian … exactly when its Arf invariant is zero"; the zero counts in the same paragraph; the Checks at lines 2756–2759 are all over `𝔽₂`.
- `Suggested.lean` lines 453–479: `finiteArfInvariant`, `finiteArfInvariant_eq_zero_iff_exists_lagrangian` and `quadraticMap_equivalent_iff_finiteArfInvariant`, stated for `[Finite K] [CharP K 2]`, so including `K = 𝔽₂`.
- Scope, line 23: "the Arf invariant in characteristic two".

**Claim.** This roadmap owns the Arf invariant, its classification theorem, the zero counts and the Lagrangian criterion over every finite field of characteristic two, `𝔽₂` included; no supplier is named for any part of it.

**Witness.** GeometricTopology at its open head (`rev/903`, README lines 3538–3570, *Finite quadratic Arf algebra*) constructs the Arf invariant for a finite-dimensional `𝔽₂`-space with a nonsingular quadratic form, proves basis independence, isometry invariance, orthogonal-sum additivity, the hyperbolic/anisotropic decomposition, "that dimension and Arf classify these forms", the zero count `2^(2m−1) + (−1)^Arf 2^(m−1)` and "that Arf zero is equivalent to a q-zero Lagrangian", and says "GeometricTopology owns this generic finite-F2 theory." TangentialBordism (open head `rev/942`, README lines 87–89, 308 and 322) consumes exactly this through the declared supplier gap `gap:finite-quadratic-arf` on GeometricTopology §4.3.1. The previous review left the overlap to a human because GeometricTopology on main has no Arf section and a revision cannot be cited. That reason does not hold: a declared gap on the supplier roadmap is the stated mechanism for a section that exists only in an open revision, and the board has already announced this object to GeometricTopology through TangentialBordism's gap. As written, the `𝔽₂` instances of the two Lean headlines are GeometricTopology §4.3.1's two headline facts.

**Repair.**
1. Under *Exact supplier contracts* add a GeometricTopology subsection with the contract "What GeometricTopology must provide (gap:finite-quadratic-arf): for a finite-dimensional `𝔽₂`-space with a quadratic form whose polar form is nondegenerate, the Arf invariant in `𝔽₂` with basis independence, isometry invariance, orthogonal-sum additivity, the classification by dimension and Arf, the zero counts and the Lagrangian criterion", the slug TangentialBordism uses, and record the same slug under `gaps` in the package's `design/plan.json` where the intake reads it.
2. In §6.8 keep the extension to `𝔽_{2^e}`, `e ≥ 2` (the trace identification `K/℘(K) ≅ 𝔽₂`, the decomposition, classification and counts over such `K`), say in one clause that the `𝔽₂` case is GeometricTopology §4.3.1's, and have `wallFormGroupArf` (line 2770), whose reductions are over `𝔽₂`, consume that supplier's classification instead of `quadraticMap_equivalent_iff_finiteArfInvariant`.
3. List the `𝔽₂` Arf algebra among the deferrals in *Scope and ownership* (line 43) with GeometricTopology §4.3.1 as its owner, and say in the two Lean docstrings that at `K = 𝔽₂` the statements are that supplier's.

*Tested:* the 𝔽₂ Checks of line 2756 (`xy` has three zeros and Arf 0, `x²+xy+y²` one zero and Arf 1) are GeometricTopology's Checks at `rev/903` lines 3597–3600 verbatim in content; the general-field Check over `𝔽₄` (seven zeros of `xy`, `4·7 > 16`) is not stated there, so the extension to `𝔽_{2^e}` is this roadmap's.

## R02 (P3) — §3.3 cites an ArithmeticGaloisRepresentations target that does not exist at its head

**Location.** `README.md` line 1116: "(Source: LFunctions Layers 3 and 5, and ArithmeticGaloisRepresentations §2.7, [Finite-order Hecke functional equation](../ArithmeticGaloisRepresentations/README.md#finite-order-hecke-functional-equation), for the trivial and quadratic characters; …)", the source line of `completedDedekindZeta_eq_factor_mul`.

**Claim.** ArithmeticGaloisRepresentations §2.7 supplies the functional equation of finite-order Hecke `L`-functions.

**Witness.** At its open head (`roadmaps show ArithmeticGaloisRepresentations`), §2.7 is *Local constants* (show line 2203); its scope paragraph (show lines 155–167) says that "continuation and functional equations of Hecke L-functions are LFunctions Layers 0, 5–6 and AutomorphicLFunctionsAndLocalFactors AL.1, which this roadmap does not consume", that the Artin functional equation belongs to its Part II, and that AutomorphicLFunctionsAndLocalFactors AL.1 owns `hecke-l-functional-equation`. No heading or anchor *Finite-order Hecke functional equation* exists in that README. The target's own route needs only `completedDedekindZeta_one_sub` for `E` and `K`, since `ζ_E = ζ_K · L(χ_{E/K})`.

**Repair.** Delete the ArithmeticGaloisRepresentations clause and its link; cite LFunctions Layer 3 (the two Dedekind functional equations, already in the `*Needs:*` line) and, for the character form, LFunctions Layer 5, *finite-order Hecke L-functions* (main, line 929).

## R03 (P3) — The §5.1a entropy names are presented as Lean declarations of ProbabilisticAndMetricNumberTheory, which declares none of them

**Location.** `README.md` line 217: "§5.1a supplies `labelEntropy` and `condLabelEntropy` with the chain rule `labelEntropy_pair_eq_add`, the alphabet bound `labelEntropy_nonneg_le_log_card` and additivity for independent labels `labelEntropy_pair_of_indepFun` … All these Lean names are in the namespace `TauCetiRoadmap.ProbabilisticAndMetricNumberTheory.MetricNumberTheory`"; the table row at line 251; line 1346.

**Claim.** The five entropy names are declarations of the supplier's `Suggested.lean` in that namespace.

**Witness.** ProbabilisticAndMetricNumberTheory at its head (`rev/1421`): `Suggested.lean` contains no `labelEntropy` or `condLabelEntropy` (0 occurrences); its README §5.1a (lines 6705–6715) names them in prose, not in backticks, as targets. The §4.9a–4.9b names are declared (`howe_moore_of_cartan` 604, `howe_moore` 629, `moore_ergodicity` 637, `mahler_relativelyCompact_iff` 654, all inside `namespace MetricNumberTheory`).

**Repair.** Cite the §5.1a targets by their prose names and restrict the namespace sentence to `howe_moore_of_cartan`, `howe_moore`, `moore_ergodicity` and `mahler_relativelyCompact_iff`.

## Previous findings

- **R01 (P2, σ-finite Poisson and stable stems): repaired.** Scope line 23 now owns only "the finite Poisson samples used by the pointwise ergodic theorem, with their point measures, counts, restrictions to disjoint windows and expected sums", and line 43 excludes "Poisson random measures whose intensity has infinite total mass, with their laws, Campbell measures of general random measures, and the stable stems of spheres". Line 1318 adds the two window statements (restriction to a measurable `B` has the law of `finitePoissonConfiguration a (μ.restrict B)`; restrictions to disjoint windows are independent) with their proof through the multinomial–Poisson mixing, and line 1330 cites them in place of the σ-finite theorems. The AlgebraicTopology supplier subsection, the stable-stems paragraph and `Suggested.lean` lines 326–388 are gone; `stableStem`, `sphereSpectrum`, `IsPoissonRandomMeasure`, `campbellMeasure`, `poissonLaw`, `intensityMeasure`, `Kallenberg`, `TopCat.sphere`, `AddCommGrpCat`, `kanCubical`, `Hatcher`, `Toda` and `AlgebraicTopology` have 0 occurrences.
- **R02 (P3, `K = ℚ` in 3.3.5): repaired.** Line 1139 reads "Let K be a totally real number field of degree d≥1, K=ℚ included"; line 1141 says Kirschmer's `n ≥ 2` "belongs to his enumeration and is not used by the formula" and cites Gan–Hanke–Yu §7, p.118, and Propositions 7.4–7.5; line 1148 adds the `ℤ³` Check with `1/24` on both sides.
- **R03 (P3, characteristic in the Layer 2 introduction): repaired.** Line 461 reads "Voight's atomic normal forms over a DVR of any characteristic, dyadic and characteristic-two cases included (2.6)".
- **R04 (P3, §6.6a locators): repaired.** Lines 2504, 2512 and 2522 read "Schlichting §8.2, p.141"; line 2496 keeps "§8.1, printed p.140" for `SFiltering`.
- **R05 (P3, §6.8 and Campbell locators): repaired.** Line 2742 cites Ranicki, *Foundations of algebraic surgery*, arXiv:math/0111315v1, §2, pp.5–6; line 2752 cites Elman–Karpenko–Merkurjev §13 p.61, Example 13.5(2), Lemma 13.4, Proposition 13.2, Corollary 13.3 (p.62) and Example 7.6 (p.41), and Cameron Theorem 6.7 (p.84), §6.4 (p.89), Theorem 6.10(a) (p.86), Exercise 3 (p.88), Table 6.1 (p.93) and Theorem 6.13 (p.94); line 2762 cites Ranicki §2 pp.6–7; line 2771 cites Ranicki §5, Example, p.15. The Kallenberg citation is gone. Every one of these locators was read (below).

## Verified sound

**Gate, dependency check, build.**
- The gate rerun with the merge order the brief names (`--order …/merge-order-moved.txt --build`) prints `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. Without `--order` the gate reads the unmoved order, places this roadmap at #52 and reports three `UPWARD` lines (to ArithmeticGaloisDuality #60, ProbabilisticAndMetricNumberTheory #61, SieveMethodsAndPrimePatterns #56); the moved order lists them at 59, 60 and 55 and this roadmap at 61, so those lines are the known artefact of the worker's move, not a defect.
- The dependency check, verbatim: `depcheck: 235 roadmaps, 2437 edges, 0 problem(s)`.
- `git diff --stat origin/main...HEAD` outside the folder is empty; the folder has README.md, Suggested.lean and `metadata.toml` (`topic = "math.NT"`) only.
- `lake env lean` on the file: 21 `declaration uses sorry` warnings (lines 69, 79, 102, 128, 154, 202, 211, 222, 242, 256, 269, 275, 290, 300, 348, 380, 392, 405, 439, 464, 472), no error.

**Padding probe and signatures.**
- On a scratch copy every `sorry` was replaced by `first | rfl | infer_instance | (simp; done) | (norm_num; done) | trivial | (positivity; done) | (aesop; done) | exact le_rfl | decide`; all 21 theorems fail (errors at the same 21 lines). No declaration restates a definition, mirrors a Check or computes a small value. The 14 definitions (`euclideanUnitBall`, `IsAtomicIntegralQuadraticForm`, `hermitianEmbeddingCount`, `ternaryShell`, `latticeCoveringRadius`, `StarBody` and its two predicates, `criticalDeterminant`, `siegelTransform`, `siegelTransformNonneg`, `lllCoefficient`, `IsLLLReduced`, `finiteArfInvariant`) are all used by a headline.
- `#check @name` for all 35 declarations, appended inside the namespace of a scratch copy, elaborates with no error; each type was compared with its README statement. The 10 "looks dropped" leads of `signatures.md` are false positives: the Ratner, Dani–Margulis and Siegel hypotheses `hρ`, `hμ`, `hU`, `hΓ` are present as anonymous arrows, and `latticeCoveringRadius`, `StarBody`, `StarBody.admissible`, `StarBody.IsFiniteType` do not use the flagged instances (the theorems about them carry `[InnerProductSpace ℝ E] [FiniteDimensional ℝ E]`).

**Supplier citations resolved** (on main unless stated; `show` lines are `roadmaps show` lines).
- SieveMethodsAndPrimePatterns §0.11a at `rev/1495`: README 998–1031; `Suggested.lean` 102–157 declares `SieveLattice.lattice_count_lt_successive_minima` (with `2 ≤ finrank ℝ E`, symmetric body, `0` interior, zero-based `ZLattice.successiveMin`), `SemialgebraicMultiset`, `multisetLatticeCount`, `multisetVolume`, `davenport_multiset_estimate`, identical in content to the statements this head deletes.
- ProbabilisticAndMetricNumberTheory at `rev/1421`: §4.9a (README 6309), §4.9b (6383), §5.1a (6703); `howe_moore` (Suggested 629: `LieGroup J ∞ L`, connected, finite centre, `LieAlgebra.IsSimple ℝ (LeftInvariantDerivation J L)`, strong continuity explicit, no noncompactness hypothesis), `moore_ergodicity` (637), `howe_moore_of_cartan` (604), `mahler_relativelyCompact_iff` (654: every `n`, max norm on `Fin n → ℝ`), as the supplier rows at lines 249–250 say. The `√n` comparison of line 1878 holds: `‖·‖_∞ ≤ ‖·‖₂ ≤ √n ‖·‖_∞`.
- ArithmeticGaloisDuality (open head): R02.3.1 (show 1839), *Localisation maps and the modified local groups* (2009), R02.4.1 (2888), R02.4.2 (3119), R02.4.3 *Poitou–Tate duality* with the target *Poitou–Tate duality and the nine-term exact sequence* (3037, 3437), R02.4.4 *Finiteness, cohomological dimension and the Euler characteristic* (3506).
- StableHomotopyKTheory (open head): §3.15 (show 1172), §3.25 `IsPlusConstruction.lift` (1289–1291), §3.28 `IsPlusConstruction.hSpaceRecognition` (1327–1329), §4.14 (1648), §4.15 (1668); its consumer table names this roadmap's §6.10 `plusConstructionComparison` (2841).
- GeneralAlgebraicKTheory (open head): §§1.5, 1.7, 2.1, 3.12, 4.7, 4.8, 11.5, 12.10, 13.8a–13.8c (show 157, 205, 261, 616, 782, 800, 2476, 2822, 2994–3028).
- LFunctions (main): `mixedFourier_harmonicFactor_mul_archGaussian` (line 1243); Layers 0, 3, 5 (*finite-order Hecke L-functions*), 6 (346, 730, 929, 1100).
- DifferentialGeometry (main): `riemannianDensity` (924), `integral_riemannianVolume_eq_integralDensity` (927). ThetaSeries (main): 3D (616). IntegralLattices (main): 2A (772), 2C (785), 2G (813), B2 (1032), B4 (1125), B5 (1167), 6A (1643), 7E (1869; the `overlaps.md` lead that only the open revision defines §7E is false). RealAlgebraicGeometry (open head): Layer 5 (show 375), Layer 6 with `stack_connected` (438–445).
- OrthogonalTamagawaAndLatticeMass at `rev/1222` consumes §§2.4/3.3 from here (`orthogonalTamagawa_two`, the gauge targets, §3.3.7, the proper mass identity: its lines 60–62, 157, 213, 232); HermitianKTheoryOfPoincareCategories (open, merge order 62, read with `roadmaps show --pr 1266`) consumes §6.8a, §6.9, §6.10a and §6.10b from here (its lines 12–22, 50, 119, 125, 141) and owns the surgery/connectivity and short-complex comparisons; GeometryOfNumbersAndQuadraticArithmeticPartII at `rev/1691` says where this roadmap stops (its line 7) and consumes §§6.2–6.5, 6.8a–6.9, 6.10a (lines 12–14, 113). LatticePackingsAndPerfectForms at `rev/1723` consumes `polynomialLaplacian`, `criticalDeterminant`, 4.5.8, `IsLLLReduced`, `lll_short_vector_factor` and §1.3 (its lines 93, 108, 265); this README keeps 4.5.8 and §1.3 as pointers (lines 1878, 37–39), so those citations still resolve.
- Ownership against open work: no second owner of the orthogonal Tamagawa number, the mass formula, the hermitian K-theory of exact categories or the Poincaré-category foundations was found. Two overlaps remain outside the findings: (i) R01 above; (ii) §6.8's Wall forms, formations and `wallLGroup` duplicate HomotopySpheres §§7B.2–7B.4 and 7C.1–7C.3 at `rev/1287`; HomotopySpheres is on the never-cite list, its consumer list no longer names this roadmap (grep: 0), and `integralLTheoryCalculations` (line 3031) needs these objects, so this roadmap is their owner unless a human decides otherwise.

**Library declarations opened at the pins** (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`).
- `TauCeti.hurwitzClassNumber_eq_zero_of_mod_four_eq_one_or_two` (`NumberTheory/HurwitzClassNumber.lean` 104), `hurwitzClassNumber_three/four/twelve/sixteen` (113, 116, 126, 130: `1/3, 1/2, 4/3, 3/2`); `TauCeti.cohomologicalDimensionAt_le_iff_forall_finite` (`…/CohomologicalDimension/ExponentP.lean`, `SingleDegree.lean`); `ProbabilityTheory.poissonMeasure` (`Mathlib/Probability/Distributions/Poisson/Basic.lean`); `Lp.compMeasurePreservingₗᵢ` (`MeasureTheory/Function/LpSpace/Basic.lean`); `ProbabilityTheory.condDistrib` (`Probability/Kernel/CondDistrib.lean`); the declarations listed in the previous review (real model, squared-norm minima, theta series, spinor norms, `ZLattice.covolume_dual`, `WittRing`, exact structures) were not re-opened: the folder's uses of them are unchanged since `da750f5`.

**Sources read at their locators** (ids are manifest keys or cache ids; lines are into the line-numbered extractions).
- `LastPenrose2017`: Proposition 3.5 (mixed binomial process with Poisson mixing is a Poisson process), line 1225, printed p.21; Theorem 5.2 (restriction theorem), line 2090, p.39. Both support line 1318.
- `RanickiFoundations2001`: §2 *Forms and formations*, lines 228–292 (printed pp.5–7): `(−)^i`-quadratic forms with `μ`, nonsingularity, lagrangians, the hyperbolic criterion, `L_{2i}` as stable isomorphism classes, formations and `L_{2i+1}`, all on f.g. free modules; §5 Example, lines 689–728 (p.15): `L^n(ℤ) = ℤ, ℤ₂, 0, 0` and `L_n(ℤ) = ℤ, 0, ℤ₂, 0`.
- `ElmanKarpenkoMerkurjev2008`: §13 *The discriminant*, line 3320 (printed p.61: the centre of `C₀(φ)`); Example 13.1, Proposition 13.2, Corollary 13.3, Lemma 13.4, Example 13.5(2) "often called the Arf invariant", lines 3332–3381 (p.62); Example 7.6, line 2281 (p.41: `[1,a]` isotropic iff `a ∈ ℘(F)`).
- `Cameron2000`: Theorem 6.7, line 807 (p.84); Theorem 6.10(a), line 932 (p.86); Exercise 3, line 1081 (p.88); the rank identification "meets each hyperbolic line in at most a point", lines 1136–1141 (p.89, §6.4 begins at line 1097, p.88); Table 6.1, line 1879 (p.93); Theorem 6.13, lines 1959–1968 (p.94): `(q^r−1)(q^(r+ε)+1)/(q−1)` points; with `ε = −1` (hyperbolic) and `+1` (elliptic) this gives, times `q−1` plus one, `Q^(2m−1) ± (Q−1)Q^(m−1)`.
- `GanHankeYu2001`: §7 begins line 803 (printed p.118) with "k is a totally real number field" and no degree restriction (line 70: "of degree d over Q"); Proposition 7.5 and the `λ_v` tables, lines 845–875 (pp.119–120), agree with `maximalLocalMassFactor`.
- `Kirschmer2013`: §2, line 63 (p.2) "degree n ≥ 2"; Definition 3.1, Proposition 3.2 and Theorem 3.3, lines 159–200 (p.4), with `γ_G`, `L(G)` and `dim G` as in 3.3.5.
- `Regev2004` (6 pages, read in full): Definition 2 and Example 1 (line 54, p.2), Claim 3 (63), equations (1)–(2) (84–87), Lemma 5 (92, p.3), Lemma 6 (133), Lemma 7 (163, p.4, proof constant `2e^(−3π/4)`), Corollary 8 (236, p.5), Lemma 9 (248), Theorem 4 (77, proof 261–268, pp.5–6). 4.4.14's lower bound `1/2` follows from Claim 3 and 4.4.3.
- `Schlichting2010`: §8.2 *The exact quotient*, lines 1529–1557 (p.141); §9.1 conditions (a)–(b) of the cone diagrams, lines 2174–2184 (p.154); Definition 9.1, line 2242 (p.155); Lemma 9.2 (2269, p.156), Lemma 9.3 (2384, p.158), Lemma 9.4 (2419, p.159), Lemma 9.5 and the swindle `T` (2474–2519, pp.160–161), Corollary 9.6 (2520, p.161), Definition 9.10, Theorem 9.11, Remark 9.12 (2549–2569, p.162).
- `CDHIII2026v4` (printed = PDF page): 1.1.4 (545, p.12), 1.1.13 (641, p.14), 1.2.12 (811, p.18), 1.2.22 (958, p.21), 1.3.9 (1380, p.30), 1.3.14 (1443, p.31), 1.3.16 (1459, p.32), 2.2.2 (1690, p.37), 2.2.4 (1717, p.38), 2.2.5 (1765, p.39), 2.3.13 (2110, p.46), 3.1.4 (2340, p.50), 3.1.7 (2404, p.51), 3.1.11 (2462, p.53), 3.1.13 (2490, p.53: `n`-truncated mod 2 implies `(n−1)`-truncated `Lgs → Ls`), 3.1.14 (2516, p.54), §3.2 integer tables (2542–2560, pp.54–55: `π₀GW^s_cl(ℤ) = ℤ ⊕ ℤ` on `⟨1⟩, ⟨−1⟩`, symplectic `ℤ` on `H^{−s}`).
- `KurinczukSkodlerackStevens2020`: Lemma 3.1 (457, p.10), §3.2 (521, p.12), §3.3 (610, p.13), §3.4 and Proposition 3.12 (632–660, p.14: order 4, `C₂×C₂` iff `−1 ∈ N_F`), Propositions 3.13–3.14 (694–712, p.15).
- `Evertse2023`: Lemma 2.8 (409, p.23), Theorem 2.20 (698, p.32, proof to p.33). `Henk2002`: the simultaneous basis statement before (2.1), lines 140–145 (p.3); Theorem 1.5 (109, p.3); Lemma 2.1 (154, p.4). `Benoist2019`: Fact 1.5 (171, p.7), Fact 3.3 (771, p.20), Fact 3.4 (787, p.20: for all `T > 0`). `DutourSikiricSchurmannVallentin2009`: packing radius, line 23 (p.1).
- Mahler 1946 (cache `ed79da4f`, OCR): Definitions 3–4 (216, 226; pp.156–157), Definitions 5–6 and Theorem 4 (244–248, p.157), Theorems 6–7 (284–294, p.158), Definition 7 and Theorem 8 with (7.1)–(7.3) (300–331, p.159).
- Li–Zhang (cache `7db1843f`): §1.7 (295–319, p.8: fundamental invariants, `val`, `t`, vertex lattices), §3.1 (599–613, pp.15–16: `Den` with `q^(N·n(2m−n))`), (3.2.0.1) (618, p.16), weights `m(a;X)` and Theorem 3.5.1 (680–694, p.17; proof p.18 with the radical dimension `a`).
- Couveignes, Annals (cache `8d63bd3a`): p.493 (267–268: `L` and `L^⊥` have the same volume for unimodular `V_ℤ`), p.494 (314–335: Hadamard, ball volume `> 2^ℓ ℓ^(−ℓ/2)`, ordered product with `ℓ+1−i` roots).
- Horesh–Karasik, ISTA version of record (cache `f2a50802`): Proposition A.1 (1174, p.1284), Corollaries A.2–A.3 (1187–1188, p.1285), Proposition B.4 (1375, p.1290), Proposition B.5, Corollary B.6, Remark B.7 (1391–1400, p.1291).
- Voight, v1.0.7u of 5 August 2026 (cache `a9316b83`): Definition 9.3.1 (6066, p.137), Lemma 9.4.6 and Corollary 9.4.7 (6198–6214, p.140), Lemma 9.5.3 (6302, p.142), Definition 9.7.13 (6447, p.146), Definition 9.8.1, Example 9.8.2 (6486–6499, p.147), Proposition 9.8.4 (6511, pp.147–148).
- Schlichting, derived equivalences, arXiv:1209.0848v3 (cache `f18bf8e3`): Definitions 1.24, 1.26, 1.29 (873, 905, 992; pp.18–20), Example 1.30 (1002, p.21), §1.11 (1047, p.22), Definition 1.35 (1149, p.24), Proposition 4.9, Lemma 4.10, Corollary 4.11 (2389–2480, pp.47–49), Proposition 5.6 (2702, p.53), Theorem 6.1 (2863, p.57), Theorem 6.2 (2915, p.58).
- `CDHI2021v3`: 1.1.1 (472, p.10), 1.1.9–1.1.10 (583–602, p.12), 1.2.1 (839, p.17), 2.1.1 (1438, p.30), 3.2.5, 3.2.6, 3.2.8 (2531–2558, pp.52–53). `CDHII2025v5`: 1.1.7 (852, p.17), 3.5.6, 3.5.8 (4220–4241, p.87), 3.6.5 (4338, p.89), 3.6.7 (4359, p.90), 3.6.10 (4443, p.92), 4.1.1 (4701, p.97), 4.2.1 (4768, p.98).
- Kleinbock–Margulis (cache `40f6d408`): Lemma 3.1, Proposition 3.2 (262–267, p.6), Theorem 4.1 (526, p.11), Lemma 5.1 and Theorem 5.2 (708–730, p.14), Theorem 5.3 (770, p.15). Morris (cache `4c0936b5`, printed = PDF − 16): Theorem 20.1.3 and Remark 20.1.4 (16981–16992, p.406), Corollary 20.2.5 (17141, pp.410–411), Definition 20.3.2, Theorems 20.3.3 and 20.3.4 (17226–17271, pp.412–413), Theorem 4.5.1 (p.56), Theorem A4.9 (p.436).
- Ranicki 1981, Edinburgh archive (fetched into a scratch manifest; image-only scan, read as rendered pages): §4.3 *Integral and rational L-theory* with the signature and de Rham invariant (printed p.418) and Proposition 4.3.1 with the four invariant maps (p.419), as 6.10a states.

**Adversarial table.** One row per statement; values computed on each side.

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| 0.3.1 `covolume_projection` | `ℤ²`, `W = ℝ(1,1)`; `2ℤe₁ ⊕ 3ℤe₂`, `W = ℝe₁`; `W = E`; `W = 0` | `P = ℤ(½,−½)`, `1/√2 = 1/√2`; `3 = 6/2`; `1 = covΔ/covΔ`; `covΔ = covΔ/1` | holds |
| 0.3.3 `primitive_orthogonal_covolume` | `ℤ²`, `W = ℝ(1,2)`; `ℤe₁ ⊕ 2ℤe₂`, `W = ℝe₁` | `√5 = √5`; `2 ≠ 1` | self-duality load-bearing |
| 1.1.1–1.1.2 | `(1,2,4)`; `(½,2)`; `(4,1)` | `1, 4, 4 ≤ 8`, last root exponent `1`; `2 > 1`; `16 > 4` | both hypotheses load-bearing |
| 1.1.5 | `n = 1, 2, 4` | `2 ≤ 2`; `2 ≤ π`; `1 ≤ π²/2` | holds |
| 1.2.14 `sqSuccessiveMin_eq_sq_successiveMin` | Gram `[4]`; `diag(1,4)`; `I₂`; rank 0 | `4 = 2²`; `(1,4) = (1²,2²)`; `(1,1)`; empty index | holds |
| 2.2.3–2.2.4 | `ℤ ⊆ 6ℤ` at `2, 3, 5` | `1/6 ∉ ℤ_(2), ℤ_(3)`; `6` a unit at `5` | holds |
| 2.4.6 reflection | `ℤ₂`, `q = xy`, `v = (1,1)`; `v = (1,2)` | `B(v,(a,b)) = a+b`, `s_v(a,b) = (−b,−a)`, det `−1`; `s_v(0,1) = (−½,0)` | least valuation load-bearing |
| 2.6.1/2.6.11 | `[1,1,1]` over `ℤ₂`; `x²+ty²` over `𝔽₂[[t]]` | `v(b)=0 < v(2a)=1 ≤ v(2c)=1`; polar `0`, blocks `⟨1⟩ ⊥ t⟨1⟩` | holds |
| E12 | `(x,y) ↦ (x+y/3, y/3)` on `[1,1,1]` | `x² + xy + y²/3`, `1/3 ∈ ℤ₂` | `[1,1,1] ≅ [1,1,1/3]` |
| 2.9.1/2.9.4 | `ℚ₃(√3)`; `ℚ₅(√5)` | `a² − 3b² ≡ a² ≢ −1 (3)` → `C₄`; `N(2+√5) = −1` → `C₂×C₂` | holds |
| 3.1.3 `finite_hermitian_isometry_formula` | `q = 2`: `(n,m,a) = (1,1,0),(1,2,0),(1,3,0),(1,1,1)` | `2·(3/2) = 3`; `8·(3/4) = 6`; `32·(9/8) = 36`; factor `(1−1) = 0` | matches the Check |
| 3.1.1 / 3.2.1 | `ℤ/3`, `x² = 1`, `N = 0, 1` | raw `2`; `2/3` | holds |
| 3.2.5 | `a = 0, 1, 2` | `1`; `1−X`, weight `1`; `(1−X)(1+qX)`, weight `1+q` | holds |
| 3.2 Gaussian/Fourier | `q = 2`, `e = 0,1,2`; `F₄`, `N(x) = 1`; `T = 0` | `1, −½, ¼`; `1 + (−1)(−½) = 3/2`; `1 − ½ = ½` | holds |
| 3.3 trace form | `ℚ(√5)`, `Q = x²` | `2a² + 2ab + 3b²`, det `5`, polar det `20` | holds |
| 3.3 gauges | `V₂, V₃, V₄`; `γ_odd(1), γ_odd(2), γ_even(2)` | `2π, 8π², 16π⁴`; `1/(4π²), 6/(2π)⁶, 1/(2π)⁴`; `V₃ = 2/γ_odd(1)`, `V₄ = 1/γ_even(2)` | holds |
| 3.3.5 at `K = ℚ` | `x²+y²+z²`: `c = 1`, `d_Q = −1`, `ω = (−1,−1)₂ = −1`, type `I` | `λ₂ = 3/6 = ½`; RHS `2·(1/(4π²))·(π²/6)·½ = 1/24`; LHS `2/48` | holds at `d = 1` |
| 3.3.6 | rank one | `O = {±1}`, mass `½`, proper mass `1 = 2·½` | holds |
| 3.3.7 Witt sign | ranks `5, 2, 3` | `c(−1,−1)`, `c`, `c(−1,d_Q)` | matches the Check |
| 3.3.8 | `q = 2, r = 1` odd `I, II±`; `q = 3, r = 2` even `I, II, III` | `½, 3/2, ½`; `2, 5, ½` | matches GHY Proposition 7.5 |
| `finiteOrthogonalOrder` | `q = 2`, `SO₄^±` | `4·3·3 = 36`; `4·5·3 = 60` | holds |
| 3.3 `ℚ₃`, `x²+y²+3z²` | `O₂⁻(𝔽₃)` order `8`, `N_H = 1`, order `24` | `λ = (24/3)/8 = 1` | holds |
| 3.4.1 | `ℤ`; `ℤ²`; rank 0 | coefficients `2,0,0,2`; `4,4`; `1` | holds |
| 4.2 exterior extension | `h = diag(1/10,10)`, `Δ = ℤe₁`, `v = e₁`; `v = e₂`; `v = 2e₂` | `1/10 > 1/50`; `1 ≤ 2`; `2/2 = 1` | rank increase load-bearing |
| 4.2 rescaling | `u(a/ε) g_ε u(−a/(ε(1+a)))`, `a = 1`, `ε = ½` | `[[1+a,0],[ε,(1+a)⁻¹]] = [[2,0],[½,½]]` | holds |
| 4.2 finite Poisson windows | two points, counting measure, `a = 2`; `a = 1`, `B = {0}`; `μ(B) = 0` | independent `Poisson(2)` counts, total `Poisson(4)`; parameter `1 = aμ(B)`; empty configuration a.s. | holds; fixed `n = 2` gives binomial `(2,½)` |
| Kac | two-point flip, `A = {0}`; identity on two points | return time `2`, `∫_A = 1`; `∫_A = ½` | ergodicity load-bearing |
| entropy | Haar on `SL₂(ℝ)/SL₂(ℤ)`, `s = diag(e^t,e^(−t))` | `s⁻¹ w s` scales `W⁻` by `e^(2t)`, `log = 2t = h_μ(s)` | holds |
| 4.2.3 `dani_margulis_nondivergence` | identity flow; `n = 1` excluded | proportion `1`; `2 ≤ n` | holds |
| 4.2.4–4.2.6 Ratner | `U = ⊥`; periodic unipotent orbit | `L = ⊥`, `ν = δ_x`; closure is the circle | holds; Morris 20.1.3 allows finitely many components, the connected `L` is its identity component |
| `oppenheim_values` | `x²−(3+2√2)y²`; `x²+y²−z²` | `|N|(a+αb)/(a−α′b) ≥ 1`; `hirr` fails | hypotheses load-bearing |
| `three_square_hurwitz` | `n = 1, 2, 3, 4, 5, 6, 7, 8` | `12(½−0) = 6`; `12·1 = 12`; `12(4/3−2/3) = 8`; `12(3/2−1) = 6`; `12·2 = 24`; `12·2 = 24`; `12(2−2) = 0`; `12(3−2) = 12` | equals the direct counts `6,12,8,6,24,24,0,12` |
| `signedThreeSquareCount` | `n = 1, 2, 3, 7` | `6`; `6·(−1)·(−2) = 12`; `12 − 4 = 8`; `12 − 12 = 0` | holds |
| 4.3 harmonic polynomial | `Σx_i⁴ − (3/5)(Σx_i²)²` | Laplacians `12r²` and `20r²`; `n = 1` coefficient `6·(2/5) = 12/5` | holds |
| half-integral Kloosterman | `K₀(0,0;4)`, `K₁(0,0;4)`, `K₀(1,1;4)` | `1−i`, `1+i`, `−1+i` | holds |
| Kronecker kernel at `q = 0` | `T(1/3,2/3,3/4), T(1/3,3/4,2/3), T(2/3,3/4,1/3)`; `C(0,0,0), C(0,0,½), C(1/3,2/3,3/4)`; summand at `(q,x,y,z) = (½,1/3,2/3,3/4)` | `2, 27/10, 9/2`; `2, 8/3, 27/10`; `3/2, 4/5, −3` | matches the Checks |
| 4.4.13 `euclidean_dual_transference_upper` | `(1,0),(0,k)`; hexagonal | reversed products `1·1`, `k·(1/k)`; same-index `k > 2`; `2/√3 ∈ (1, 2]` | reversal load-bearing |
| 4.4.14 `covering_dual_transference` | `aℤ`; `ℤⁿ`; `(1,0),(0,4)` | `½`; `√n/2`; `√17/8 ≥ ½`, with the last dual minimum `√17/2 > 2` | first dual minimum is the right one |
| 4.4 constants | `c = 2e^(−3π/4)`; `b(¾)³`; `e^(−π/3) + c³` | `0.1896 < ¼`; `0.1484 < 0.15`; `0.3577 < 0.4` | holds |
| 4.5.2/4.5.9 | `p = |x|`; `p = |x|/2`; `c·x⁺`; rank 0 | `Δ = 1`; `Δ = 2`; no admissible lattice; `Δ = 1` | holds |
| 4.6.1 | `ℤ`, indicator of `[−½,½]`; of `[−1,1]` | transform `0` vs integral `1`; transform `2` | `n = 1` excluded |
| 5.1 | `((1,0),(½,1))`; `((2,0),(0,1))`; `((2,0),(1,1))`; `μ = ½`, lengths `1, ½` | `μ₁₀ = ½`, Lovász `½ ≤ 1`; `3 ≤ 1` fails; `2 ≤ 1` fails; `1 = 2·½` | holds |
| `finiteArfInvariant` | `𝔽₂`: `xy`, `x²+xy+y²`; `𝔽₄`: `xy`; dim 0; `x²` on `𝔽₂²` | `2·3 > 4 → 0`; `2·1 < 4 → 1`; `4·7 > 16 → 0`; `2 > 1 → 0`; `4 = 4 → 1` | matches Arf; Cameron 6.13 gives `Q^(2m−1) ± (Q−1)Q^(m−1)` |
| Wall Checks | `H₋₁(ℤ)`, `μ(e)=μ(f)=1`; `ℤ(e+2f)`; `ℤ/4`, `[[2,1],[−1,2]]` | `a²+ab+b²` odd for coprime `a,b`; `μ = 2 ≡ 0`, index `2`; det `5`, `λ(e₁,e₁) = 2 ≠ 0` | holds |
| `rationalFormationParity` | `H(ℚ)` coordinate Lagrangians; their sum | `1 − 0 = 1`; `2 − 0 = 0` | holds |
| `wallLGroup`, 6.10a, 6.11.10 | `n = 0..3`; `C₁, C₀, C₋₁` | `ℤ, 0, ℤ/2, 0` (Ranicki 1981 4.3.1, Foundations p.15); `ℤ/2, ℤ/8, ℤ/2` | holds |
| 6.2 / 6.6a | `H(ℤ)`; `⟨2⟩⊥⟨3⟩`; free groups with `2 : ℤ → ℤ`; finite groups with `ℤ ↠ ℤ/2` | even unimodular; det `6`; (d) fails; (c) fails | matches §8.1 |
| 6.7.1 cone conditions | Schlichting (18)(a)–(b) | forward inflations with cokernel in `A`, backward deflations with kernel in `A`, uniform `k` | matches |
| E17 (6.8a sign) | `X = ℚ[0]`, `Y = (ℚ → ℚ)`, `f⁰ = id` | `D(δf)^(−1) = −id` with `(−1)^(j(j−i))`, `+id` with the printed `(−1)^(i(j−i))`; `δ(Df)^(−1) = −id` | printed sign breaks the chain-map law |

## Not verifiable

- **Siegel 1945 (4.6.1).** JSTOR, paywalled; not in the cache. **Banaszczyk 1993 (4.4.13).** Springer, paywalled. **Siegel 1935 (4.3).** Not fetched this round. **Iwaniec 1987 (4.3).** The cached text (`ebcb8686`) is a table of contents only.
- **Wall, *Surgery on Compact Manifolds* §13A, and Kervaire–Milnor 1963 (§6.8, 6.10a).** Books and JSTOR; the values they are cited for were read in Ranicki 1981 and Ranicki 2001 instead.
- **Ranicki 1981.** Fetched from the Edinburgh archive into a scratch manifest only (the board manifest is unchanged); the scan is image-only and OCR is not installed, so pp.418–419 were read from rendered page images.
- **Axler–Bourdon–Ramey (4.3).** The cached extraction (`4e64124f`) has zero pages.
- **Lindenstrauss 2001, Margulis–Tomanov 1994, Weil 1964/1965, Sansuc, Gross–Gan, Dani–Margulis 1993, Platonov–Rapinchuk–Rapinchuk, Quillen 1972/1973, Waldhausen, Segal, McDuff–Segal, Rognes–Weibel, Friedlander, Conway–Sloane.** Outside the sampled targets and not fetched.

## Source issues

- **Misprint** in Couveignes2020 at §3, printed p.494: the source calls the set of points of norm at most one a sphere; it should say ball; affects nothing.
- **Error** in Voight2026 at Example 9.8.2, printed p.147: the source asserts that the normalized atomic representative `[a,1,c]` of an isometry class over `ℤ₂` is unique; `[1,1,1] ≅ [1,1,1/3]` via `(x,y) ↦ (x+y/3, y/3)`; affects a stated result.
- **Misprint** in Schlichting, *Hermitian K-theory, derived equivalences and Karoubi's fundamental theorem* (arXiv:1209.0848v3), at Example 1.30, printed p.21: the component sign of the dual of `f : M^i → N^j` is printed as `(−1)^(i(j−i))`; §1.11's rule `g ↦ (−1)^(|g||f|) g f` gives `(−1)^(j(j−i))`, and the printed sign breaks the chain-map law on the two-term complex above; affects a stated result.
