# Review of AdicSpacesPartV (pull request #2133 at 666eee7)

**Verdict:** needs changes

Nine findings: three P2 (all on declared supplier gaps), six P3. No P1. The gate passes, the dependency check shows no UPWARD or CYCLE line, and `Suggested.lean` elaborates with `sorry` as the only warning. No false statement was found in the README or in the Lean file.

## R01 (P2) — `gap:generically-reduced-functorial-resolution` asks for what the supplier on main already states

**Location.** `TauCetiRoadmap/AdicSpacesPartV/README.md` lines 142–146, and its uses at lines 155–156, 899 and 929. Line 142: "The quasi-excellent functor assigns to every reduced noetherian quasi-excellent ℚ-scheme a finite sequence in regular centres …"; line 144: "Extend its §§7.5–7.6 marked strong resolution functor from reduced to generically reduced …".

**Claim.** ResolutionOfSingularitiesCharacteristicZero §§7.5–7.6 cover only reduced schemes, so the generically reduced case is a gap.

**Witness.** On main, `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md` line 1100 (§7.5) states strong resolution "for every generically reduced noetherian quasi-excellent ℚ-scheme", and line 1116 (§7.6) states regular functoriality for the same class. Its §7.5 Check 2 computes `ℚ[x,e]/(e²,xe)` (x-chart `ℚ[x]`, empty e-chart), which is the example README line 156 says "needs" the gap.

**Repair.** Delete `gap:generically-reduced-functorial-resolution` from the README (line 144) and from the plan's `gaps`. In line 142 write "every generically reduced noetherian quasi-excellent ℚ-scheme" and drop "extension to generically reduced schemes" from the last sentence. In `gap:countable-resolution-invariants` (line 146) drop the word "reduced" so that it labels the steps of the §§7.5–7.6 functor as stated there. Line 155: keep (it only needs the countable gap). Line 156: replace "needs gap:generically-reduced-functorial-resolution" by "is covered by §7.5 as a generically reduced scheme". Line 899: drop the generically-reduced gap and the word "reduced" after "non-quasi-compact". Line 929: drop the slug. Tested on the refuting instance: `Spec K⟨x,y⟩/(y², xy)` is noetherian, quasi-excellent, over ℚ and generically reduced (`A[1/x] = K⟨x⟩[1/x]`), so §7.5 applies as stated and the x-chart `K⟨x⟩` of line 156 is its output.

## R02 (P2) — `gap:regular-map-composition-descent` is a compound contract

**Location.** README line 124: "if A → B and B → C are regular then A → C is regular, if A → C is regular and B → C is faithfully flat then A → B is regular, and A → B is regular as soon as A → B_n is regular for every maximal ideal n of B."

**Claim.** One gap, one `needs` sentence.

**Witness.** The sentence joins three independent statements, each its own Stacks lemma (More on Algebra 15.42.4, Tag 07QI; 15.42.7, Tag 07NT; 15.42.2, Tag 07C0 — all three read and confirmed). §0.5 uses them separately: the domain case uses only the second and third, the smooth and scalar-extension cases also the first.

**Repair.** Split into three gaps on SchemeAndStackFoundations §0.21, each with one sentence, in the README and in the plan: composition (B and C noetherian); descent of regularity of A → C to A → B along a faithfully flat B → C; locality on the maximal ideals of a noetherian B. Point each `*Needs:*` line (lines 273, 281, 295) at the clauses it uses.

## R03 (P2) — `gap:regular-local-flat-transfer`: the plan's sentence asks for a half Tau Ceti already proves

**Location.** README line 122 states only the ascent ("if R is regular and the closed fibre S/m_R S is a regular ring then S is regular"). The plan's `gaps` entry with the same slug reads "if S is regular then R is regular, and if R is regular and the closed fibre … then S is regular".

**Claim.** The gap as the intake reads it is minimal.

**Witness.** The descent half is `TauCeti.IsRegularLocalRing.of_flat_of_isLocalHom`, `TauCeti/RingTheory/RegularLocalRing/Descent.lean` line 55 at the pin (flat local hom, `S` regular ⟹ `R` regular, no noetherian hypothesis on `R`). README line 128 itself says so.

**Repair.** Replace the plan's `needs` for this slug by the README's sentence (line 122). The README needs no change here. Tested on the instance of line 132: `K[t]_(t) → K[[t]]` descends by the Tau Ceti theorem, and ascent with closed fibre `K` is the only thing left to ask.

## R04 (P3) — §1.7 Riemann extension: no route for existence, a dangling "separate target", primary sources not cited

**Location.** README lines 440–446. Line 444: "The bounded-extension existence theorem is a separate substantial target; it does not follow from uniqueness …".

**Claim.** §1.7 has a proof route and a locator for the extension theorem.

**Witness.** The route names no input for existence (it says to prove it "as in" a theorem CONRAD10 only states). No other target in the README states bounded extension, so "separate substantial target" points nowhere. CONRAD10 lines 155–159 attribute the theorem to Lütkebohmert (Thm 1.6, geometrically normal case) and Bartenwerfer (§3, general case), and sketch the reduction of the general case to the geometrically normal one.

**Repair.** Replace the last sentence of line 444 by a route with inputs: either Bartenwerfer's direct proof, or the reduction CONRAD10 lines 157–159 describes (geometrically normal case, ground-field extension as in CONRAD99 §3, affinoid excellence from RigidAnalyticGeometry §1.2). Add the two primary references with the locators CONRAD10 gives, recorded as uncertified if they cannot be read. Extend `*Needs:*` (line 446) with RigidAnalyticGeometry §§1.2–1.3 if the reduction route is kept.

## R05 (P3) — "field-valued functor" is not the object meant

**Location.** README lines 21, 596, 598, 605, 622, for example line 596: "point classes of any covariant field-valued functor on finite K-extensions".

**Claim.** Standard vocabulary.

**Witness.** The functor takes a finite extension L/K to the set X(L); its values are sets, not fields (line 620 itself writes "X(L) is the set of pairs (x, ι)").

**Repair.** Write "set-valued functor on the category of finite extensions of K" throughout.

## R06 (P3) — §1.1 uses two symbols for the normalization, one of which is the canonical reduction's

**Location.** README line 301 ("let Ã^ν be the integral closure of A_red …"), line 308 ("X^ν = Spa(A^ν, A^ν°) with A^ν the integral closure …"), line 317 (Ã^ν again).

**Witness.** Line 678 and the Conventions fix Ã = A°/A°° for the canonical reduction; in §1.1 the same letter with a tilde is the normalization, and the API bullet calls the same ring A^ν.

**Repair.** Write A^ν in lines 301 and 317.

## R07 (P3) — §5.4 is named after a source's use, not after its mathematics

**Location.** README line 906: "### 5.4 Properties of the resolution used by Howe–Klevdal".

**Repair.** Rename, for instance "### 5.4 Surjectivity, density and connectedness of the resolution". The target name *resolution-consequences* and the locators stay.

## R08 (P3) — §1.6: the HK2 line number points at a different step of the proof

**Location.** README line 424: "HK2 line 2602, proof of Theorem 9.1.3, p. 58".

**Witness.** HK2 line 2602 is the constant-rank paragraph. The full-dimension step (a connected Zariski closed subvariety of full dimension at a point is the connected component) is HK2 lines 2624–2629, same proof, same page.

**Repair.** Cite "HK2 lines 2624–2629, proof of Theorem 9.1.3, p. 58".

## R09 (P3) — pull-request description: two named roadmaps are neither on main nor consumers

**Location.** Description: "Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Witness.** README line 16 cites DiamondsAndVStacks D6.9 and line 18 cites AbelianSchemesAndArithmeticModuliPartII B2.10. Neither roadmap is on main (both exist only at open heads), and neither is a consumer: each is named as the owner of a neighbouring statement that §5.3 and §6.1 differ from.

**Repair.** Add to that sentence that DiamondsAndVStacks D6.9 and AbelianSchemesAndArithmeticModuliPartII B2.10 are cited in Scope for comparison only, are in open pull requests, and are not prerequisites.

## Verified sound

**Gate and dependency check.** The worker's gate at 666eee7 passes every check (text scanners, depcheck, targeted build). I reran the dependency check: `depcheck: 235 roadmaps, 2132 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The pull request changes nothing outside `TauCetiRoadmap/AdicSpacesPartV`. `scratch/overlaps.md` lists no dropped or revision-only id and no other pull request changing this folder.

**Lean.** `lake env lean` on `Suggested.lean`: three `declaration uses sorry` warnings, nothing else. The `module` / `public import` form is the one 37 `Suggested.lean` files on main use. The elaborated signatures (`scratch/signatures.md`) were compared with README §§3.4, 6.1, 6.6: every binder is in the declaration's own signature; nothing was lost. One-tactic probe on a scratch copy: `simp`, `rfl`, `infer_instance`, `trivial` each fail on all three theorems; none is padding. `IsUnitGaussPoint` has a real body and is needed to state the first headline. Note, not a finding: in `analytic_constantRank` the hypothesis `hkn : k ≤ n` is not used by the statement and follows from `hrank`; it is harmless.

**Headlines.** From the Summary: Gauss-point closure (stated), functorial rigid resolution and connectedness of the resolution of an irreducible space (docstring: not statable), analytic manifolds of rational points and the submersion theorem (docstring), constant-rank normal form (stated), subfield identity theorem in coordinates (stated) and on G(C) (docstring). The docstring's reasons hold at the pin: the `AdicSpace` folder of Tau Ceti has no proper, smooth or étale morphism, no coherent ideal sheaf, no blow-up and no normalization.

**Adversarial table** (values computed on each side).

| Statement | Instances | Values | Result |
|---|---|---|---|
| `gaussPoint_mem_closure_rationalPoints` | `x` ranges over `spa (powerBoundedSubring K)`; n = 0; K = ℚ_p, n = 1 | Spa(K, K°) is one point for a rank-one complete K (K° is a maximal subring, the trivial valuation is not continuous), so ∀x is harmless. n = 0: one point, it is both the evaluation point and the Gauss point. ℚ_p: Gauss norm of Tᵖ − T is 1, but \|aᵖ − a\| ≤ 1/p for a ∈ ℤ_p, so {1 ≤ \|Tᵖ − T\|} separates; the `Infinite` hypothesis excludes this | true as stated; hypothesis needed |
| `IsUnitGaussPoint` | wrong model: evaluation point T = 0; direction of `vle` | f = T, g = p: at T = 0, `vle` holds (0 ≤ \|p\|) while Gauss norms give 1 ≤ 1/p, false: excluded. f = p, g = 1: Gauss 1/p ≤ 1 true and `vle p 1` is the plus-ring condition of `spa`: same direction | determines the class |
| `analytic_constantRank` | (x,y) ↦ (x,x²) on ℚ_p²; m = n = k = 0; Tᵖ in characteristic p | k = 1, ψ(u,v) = (u, v − u²): ψ(f(x,y)) = (x, 0), matching "j < k ↦ φ x j, else 0". Empty coordinates: trivial. Tᵖ: derivative 0, k = 0 would force f locally constant, but πⁿ ↦ π^(np) ≠ 0: `CharZero` needed | true; convention pinned |
| `analytic_germ_eq_zero_of_subfield` | m = 0; z(z − a), a ∈ C ∖ E; zᵖ over 𝔽_p((t)) | m = 0: f(0) = 0 both sides. z(z − a): zero at 0 only, hypothesis fails on every E-neighbourhood. zᵖ: value t^(kp) ≠ 0 at t^k, hypothesis fails. `NormedAlgebra E C` with C a normed field gives ‖algebraMap e‖ = ‖e‖. Proof route recomputed: Σ P_n(y)tⁿ = 0 for small t ∈ E forces P_n(y) = 0, then P_n = 0 over infinite E | true without completeness or characteristic |
| 0.1 Zariski closed | V(T), V(T(T−1)), K⟨T⟩/(T²), closed subdisc | {0}; {0, 1} (Gauss value 1 ≠ 0); V(T) = whole one-point space; closure of {\|T\| ≤ \|ϖ\|} contains an open, so Zariski closed would force the whole disc | consistent |
| 0.2 local dimension | Spa(K × K⟨T⟩); plane ∪ line; ∅; Spa(K, K⁺) rank two | 0 at the point, 1 on the disc, sup = 1 = dim(K × K⟨T⟩). At the meeting point: min over neighbourhoods = 2 = dim of the local ring. ∅: ⊥ on all three sides. Rank two: chain of length 1 vs ringKrullDim K = 0, outside the hypothesis | consistent |
| 0.3 (a)–(e) | Z = V(Y) in XY = 0; Z = X ≠ ∅; X = ∅ | V(Y): I = (Y) lies in the minimal prime (Y); dim_z Z = 1 = dim_z X: all five fail. Z = X: all fail. ∅: all hold. (e) recomputed: I in no minimal prime gives dim A/I < dim A | equivalence holds both ways |
| 1.1 normalization | cusp; XY = 0; K⟨T⟩/(T²) | K⟨t⟩ with t² = X, t³ = Y, bijective; two discs, two points over the origin; Spa K (closure of A_red, not of A) | consistent |
| 1.4 components | XY = 0; nodal cubic; two discs | 2 components, connected; 1 global component, 2 local branches, t = ±1 over the node; 2 components though locally irreducible | consistent with 1.3, 1.5 |
| 1.6 full dimension | M = two discs, Y = first disc; V(XY) in the bidisc | dim_y Y = 1 = dim_y M and Y is the component through y, not M; dim 1 < 2 so proper | consistent with 0.3(e), 1.5 |
| 1.7 Riemann extension | 1/T on the punctured disc; t = Y/X on the cusp | \|1/T\| = \|π\|^(−n) at πⁿ: unbounded, no extension. t² = X so \|t\| ≤ 1, bounded, t ∉ K⟨t²,t³⟩: normality needed | statement matches CONRAD10 Theorem 2.1.1; route: R04 |
| 2.1 singular locus | cusp in characteristic 2 and 3; K⟨T⟩/(T²) | Off the origin the curve is the punctured disc, regular in every characteristic; origin has embedding dimension 2. Double point: Sing = whole space, reducedness needed for nowhere density | consistent |
| 2.3 tangent spaces | T ↦ T²; cusp; K⟨T⟩/(T²) | df_a = 2a; dim T = 2 > 1; T_x = K with dim X = 0 | consistent with 2.2 |
| 2.4 stratification | plane ∪ line in the tridisc; reduced dimension 0 | d = 2: Y₁ = one point, Y₂ = ∅, within d + 1 = 3 steps. d = 0: Y₁ = ∅ | consistent |
| 3.2 point classes | X = Spa L, L/K Galois of degree n | X(L) = Hom_K(L, L) has n elements = pairs (x, ι) with n embeddings; one class; one classical point | bijection holds |
| 3.4 Gauss closure | L̃ = F̄_p, {\|T\| ≥ 1} ∩ {\|T − 1\| ≥ 1}; L = ℚ_p | ζ of order prime to p, ζ ≠ 1: \|ζ\| = \|ζ − 1\| = 1, in the neighbourhood. ℚ_p: as in row 1 | consistent with the Lean headline |
| 3.3 (used by 3.4) | ℤ_p closed in the ℚ_p-disc; rank-two point below η towards 0 | {\|p\| ≤ \|T²\|} ∩ {\|T − u\| ≥ 1, u = 1..p−1} contains that point and no element of ℤ_p | Check correct |
| 4.3 Shilov points | disc; XY = c; L finite; zero algebra; p + T² | 1 (η); 2 with (\|X\|,\|Y\|) = (1,\|c\|), (\|c\|,1); 1; 0; sup = max(\|p\|, 1) = 1 = value at η | consistent with 4.1, 4.2 |
| 4.7 avoidance | classical point of the disc; isolated point of Spa(K⟨T⟩ × K) | trdeg 0 < 1 = dim_x: not weakly Shilov, and {x} is nowhere dense. Isolated point: 0 = 0, weakly Shilov, and {x} is open, not nowhere dense | consistent with 0.3, 4.6 |
| 5.3 rigid resolution | cusp; K[ε]/(ε²); K⟨x,y⟩/(y², xy); curves y² = x^(2n+1) | Cusp: the only regular centre inside Sing is the origin, after which Sing = ∅: exactly one stage. Double point: nonreduced locus is everything, excluded by hypothesis. (y², xy): x-chart K⟨x⟩ (x²u = 0 kills u modulo x-torsion), y-chart empty (y² = 0). Exponent drops by 2 per stage: n stages | statement matches TEMKIN12 5.2.2 and 5.3.2; gap wording: R01 |
| Regularity contracts (R02, R03) | K[t]_(t) → K[[t]]; cusp B → B[1/x] | closed fibre K, both regular of dimension 1; K → B[1/x] regular and B → B[1/x] flat but not surjective on spectra, K → B not regular at the origin | Checks correct; faithful flatness needed |
| 6.4 algebraic-point atlas | G_m over ℝ ⊆ ℂ; GL₂; μ₃ | inversion in the coordinate w = z − 1 is −w/(1 + w), derivative −1. \|h_ij\| < 1/8: \|det − 1\| < 1/4 + 2/64 = 9/32 < 1. μ₃: d = 0, identity chart a singleton over ℝ and ℂ | consistent |
| Imported inversion contract | T + T² | inverse y − y² + 2y³ − 5y⁴ …; matches "T − T² + 2T³" | consistent |

**Sources read at their locators** (15 sampled targets, plus the contracts): HK2 lines 220 (p. 5), 691 and 699 (p. 15), 722–727 (p. 16), 1458 (p. 32), 1598 (p. 35), 2581, 2590 (p. 57), 2602–2629 (p. 58), 2663 (p. 59), 2708–2735 (p. 60). CONRAD99 lines 274, 329, 384, 406, 435, 451–462, 498, 528–548, 554, 599–606, 653–660, 673–680, 725–737, 801–805, 1008–1011, with pages 6–17 and 21 as cited. CONRAD10 lines 154–161, 189, 211 (pp. 4–5). BH22 lines 228, 235–246, 310–352 (pp. 6–8), 567–574 (p. 13). TEMKIN12 lines 99–108 (p. 3), 428–434 (p. 10), 1504–1575 (pp. 33–34): the hypothesis "nowhere dense non-reduced locus", regular centres, countable hypersequence and the single proper morphism are as §5.3 states them. CONRAD06 lines 1937–1960 (printed pp. 1096–1097). POINEAU13 lines 182–184 (p. 271), 705 (p. 284), 857 (p. 287), 893–897 (p. 288). STACKS line 3743 (Lemma 37.21 of Morphisms, Tag 054L, p. 83). The Stacks tags of README line 128 were fetched and read: 00OF (10.110.9), 031E (10.112.8), 07C0 (15.42.2), 07QI (15.42.4), 07NT (15.42.7), 07PM (15.50.2); each says what the README attributes to it. Apart from R04 and R08, every sampled locator, page and hypothesis agrees with the text.

**Library declarations opened at the pins** (22). Tau Ceti: `closedPolydisc` (`AlgebraicGeometry/AdicSpace/Spa/Polydisc/Basic.lean:115`), `classicalPoint` (:247), `classicalPoint_vle` (:255), `classicalPoint_injective_of_isField` (:281), `spa` (`Spa/Basic.lean:105`), `gaussPoint` (`Spa/Polydisc/GaussPoint.lean:595`, one variable, 0 < r ≤ 1; no closure statement about classical points exists in the Polydisc folder), `weightedRestrictedSubring` (`RingTheory/Huber/WeightedRestrictedSeries/Basic.lean:675`), `MvPowerSeries.IsRestricted.gaussNorm_mul` (`RingTheory/MvPowerSeries/TateAlgebra/Basic.lean:567`), `restrictedMvPowerSeriesGaussEquiv` (`RingTheory/Huber/Restricted/GaussNorm.lean:107`), `RegularAlgebraMap` (`RingTheory/RegularLocalRing/RegularAlgebraMap.lean:54`; the file has no composition or descent theorem, so R02's three clauses are not provided), `GeometricallyRegular` (:70), `IsGRing` (`GRing.lean:57`), `regularLocus` (`Locus.lean`), `IsRegularLocalRing.of_flat_of_isLocalHom` (`Descent.lean:55`), `isRegularLocalRing_iff_of_flat_of_map_maximalIdeal_eq` (`Flat.lean:54`, both rings noetherian), `IsAffinoidAlgebra` (`RingTheory/Affinoid/Basic.lean:30`), `AdicSpace` (`PreAdicSpace/Adic.lean:249`), `PointTopology.topology` (`Topology/Algebra/PointTopology/Basic.lean:83`), `SchemePointTopology.topology` (`Scheme.lean:127`). Mathlib: `MvPowerSeries.gaussNorm` (`RingTheory/MvPowerSeries/GaussNorm.lean:58`, a supremum, junk value when unbounded; restricted series are bounded), `OpenPartialHomeomorph.hasFPowerSeriesAt_symm` (`Analysis/Analytic/Inverse.lean:657`), `AnalyticAt.hasStrictFDerivAt` (`Analysis/Calculus/FDeriv/Analytic.lean:145`), `HasStrictFDerivAt.toOpenPartialHomeomorph` (`InverseFunctionTheorem/FDeriv.lean:118`), the `IsManifold` and `LieGroup` instances on units (`Geometry/Manifold/Instances/UnitsOfNormedAlgebra.lean:55, 64`), `MvPolynomial.funext` (`Algebra/MvPolynomial/Funext.lean:83`), `topologicalKrullDim` (`Topology/KrullDimension.lean:37`). The four names `scratch/citations.md` lists as found nowhere are roadmap names of AdicSpacesPartIII and resolve there (below).

**Cross-roadmap citations resolved** (on main unless said). RigidAnalyticGeometry §§1.1–1.3, 2.1–2.3, Layers 3–4, 6.2, 7.3, 7.4, 8.1–8.3 (headings at lines 177–738; §7.3 has the identity principle, §8.1 the component comparison). AdicSpacesPartII R0.6–R0.17, R0.19.1–R0.19.2, R1.1–R1.9 (R1.9 at line 10509 has *rigid-identity-principle*). AdicEtaleGeometry A2.6 (line 7401, `topologicalKrullDim`, dim ∅ = ⊥). AdicSpacesPartIII R2.4 (v) with `specialisationLimitHomeomorph` (line 5019), R2.5 with `admissibleBlowUp.isProper_surjective_specialFibre` (line 5390), R3.6 *proper-relatively-compact-covers* (line 10962; lines 5794 and 10752 confirm that Kiehl-properness is a hypothesis there for non-discrete K, so `gap:adic-proper-kiehl-proper` is not already provided), R3.9 *gelfand-spectrum-banach-ring* with the three `GelfandSpectrum` names (lines 661, 12480–12489). SchemeAndStackFoundations §§0.3, 0.8 (`etale_coordinates`, line 996), 0.20 (*IsNagata.integralClosure_finite*, line 1486), 0.21 (`regular_map_completion`, `Excellence.IsQuasiExcellentRing.isNagata`; no composition, descent, ascent or formal-smoothness statement), 4.11. StableReduction Layer 4. ResolutionOfSingularitiesCharacteristicZero §§7.1, 7.5–7.8 (see R01; no countability statement, so `gap:countable-resolution-invariants` stands). ReductiveGroups Layer 3 (fppf homogeneous quotient; smoothness of G → G/H for non-normal H is not stated). ReductiveGroupsPartII RG2.0.2 *smooth-group-analytic-charts* (line 640: nondiscrete locally compact, characteristic zero, affine — as §6.4 says). LieGroupoidsPoisson G0.1 (line 299). At open heads: DiamondsAndVStacks D6.9, AbelianSchemesAndArithmeticModuliPartII B2.10.

**Ownership.** Searched main and the open heads with `roadmaps grep` for weakly Shilov and Shilov points, Riemann extension, normalization and irreducible components of rigid spaces, rigid blow-ups, the constant-rank theorem and Gauss-point closure. No other roadmap states these objects for rigid spaces; AdmissiblePairsAndPadicHodgeStructures and ClassicalAdicEtaleCohomologyPartII cite them from this roadmap by RZ label. The kept variants (§5.3 against D6.9, §6.1 against G0.1 and B2.10, §6.4 against RG2.0) each say in one clause how they differ. ClassicalAdicEtaleCohomologyPartII declares two gaps on this roadmap (finite branched covers, proper generic smoothness); they are that roadmap's declared contracts and do not conflict with the scope exclusion here, which concerns arbitrary maps.

**Declared gaps.** `adic-proper-kiehl-proper`, `formal-affinoid-localization`, `countable-resolution-invariants`, `represented-smooth-homogeneous-quotient` and `complete-local-formal-smoothness-regular` are precise, single statements, not provided by their suppliers or the pins, and stated in the README under the supplier's subsection with the plan's slug. The other three are R01–R03.

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, seven layers each ending with Examples and Dependencies, Downstream consumers, Worked examples, References. Every definition (0.1, 0.2, 1.1, 1.3, 1.4, 2.1, 2.3, 3.1, 4.1, 4.3, 4.4, 5.1, 5.2, 6.3, 6.4) has an API list and at least four Checks. No LaTeX delimiters, no process narrative, no algorithm.

## Not verifiable

- SCHNEIDER11 (§§5–9, Corollary 5.8, Propositions 5.9 and 9.3, Lemma 9.2, Remark 9.4): the manifest records it as uncertified; cited by locator only, not read.
- The primary sources of the Riemann extension theorem (Bartenwerfer; Lütkebohmert) are not in the manifest and were not read; R04 relies only on how CONRAD10 lines 155–159 describe them.
- The BGR and Bosch statements that BH22 and CONRAD99 invoke inside the proofs cited for §§4.1, 4.2 and 4.6 were not opened; the README consumes them through RigidAnalyticGeometry and AdicSpacesPartIII.
- Truth of the heavy README targets (Layers 0–2, 4, 5) was checked against the sources' statements and on the instances in the table, not proved.

## Source issues

- none
