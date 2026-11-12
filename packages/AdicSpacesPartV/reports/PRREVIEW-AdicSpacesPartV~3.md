# Review of AdicSpacesPartV (pull request #2133 at 5aa51b7)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/AdicSpacesPartV/` at the same head the previous review read (the folder has 0 changed lines). Two findings, both P3 wording repairs in the README; nothing blocking. The gate passes, the dependency check reports 0 problems, `Suggested.lean` elaborates with `sorry` as the only warning, and all fifteen sampled locators agree with their sources.

## R01 (P3) — §4.3: "affinoid domains" is used in a second sense, and the bullet is false in the first

**Location.** `TauCetiRoadmap/AdicSpacesPartV/README.md` line 744: "A finite injective map of affinoid domains sends Shilov points to Shilov points; use the integral finite map on canonical reductions and the componentwise dimension theorem."

**Claim.** An API bullet states its hypotheses and names the map. Elsewhere in this README "affinoid domain" means an affinoid subdomain (line 14 "affinoid domains and their algebra", line 278 "Every affinoid-domain inclusion Spa(B, B°) ⊆ Spa(A, A°)"), which is also the literature's meaning. Here it has to mean an affinoid algebra that is an integral domain, and the bullet does not say which map carries the points.

**Witness.** Read with spaces: the closed immersion Spa K → Spa K⟨T⟩ at T = 0 is finite and injective, and sends the Shilov point of Spa K to a classical point, which is not Shilov (line 756). Read with algebras that are not domains: K⟨T⟩ → K⟨T⟩ × K, T ↦ (T, 0), is finite and injective, and the point of the factor K is Shilov and maps to T = 0.

**Repair.** Replace the bullet by: "For a finite injective homomorphism A → B of K-affinoid algebras with B an integral domain, Spa B → Spa A sends Shilov points to Shilov points; use the finite injective map Ã → B̃ of canonical reductions and the equidimensionality of Ã and B̃." Tested: K⟨T⟩ → K is not injective and K⟨T⟩ × K is not a domain, so both witnesses are excluded; for T ↦ T² on K⟨T⟩ the Gauss point maps to the Gauss point. The statement is then true: Ã → B̃ is injective because Spa B → Spa A is surjective, both reductions are torsion-free over K̃[T₁,…,T_d] for a Noether normalization, so every minimal prime of B̃ contracts to a minimal prime of Ã.

## R02 (P3) — §5.4: "with the same underlying points" reads as bijectivity, and the route carries orphan labels

**Location.** README line 917: "For an arbitrary rigid T, resolving T_red gives a proper surjection onto T with the same underlying points, including when T is a fibre product of resolutions." README line 921: "(i) Surjectivity: … (iv) S irreducible ⇒ … it is dense in |S̃| by (i)".

**Claim.** The sentence says the proper surjection has the same underlying points as T. What is true is that T_red and T have the same underlying points. The route's labels (i) and (iv) refer to an enumeration the statement does not have; there is no (ii) or (iii).

**Witness.** The README's own Check, line 928: for Spa(K⟨X,Y⟩/(XY)) the resolution is two discs, with two points over the origin. So the surjection is not a bijection on points.

**Repair.** Line 917: "For an arbitrary rigid T, the resolution of T_red composed with the closed immersion T_red → T, which is a bijection on underlying points, is a proper surjection onto T, including when T is a fibre product of resolutions." Line 921: write "Surjectivity:" for "(i) Surjectivity:", "Connectedness:" for "(iv)", and "by the density just proved" for "by (i)". Tested on the node (two points over the origin, still surjective) and on the double point of line 930 (Spa K → T, surjective).

## Previous findings

- R01 of the previous review (the plan's `needs` for `countable-resolution-invariants` reads "§§7.5–7.6 reduced resolution functor", README line 140 reads "§§7.5–7.6 resolution functor") — not repaired: `packages/AdicSpacesPartV/design/plan.json` is unchanged. I do not carry it as a finding against this folder. The README sentence is the correct one and needs no change; the plan is not a file of the pull request; the slug is declared in both places; and the supplier's functor is identified by its section numbers, §§7.5–7.6 on main, which state one functor, for generically reduced schemes. The discrepancy is recorded here for the intake: the sentence to announce to the supplier is README line 140.

## Verified sound

**Gate, dependency check, Lean.** Gate rerun at this head: every scanner 0, ending `outside-folder=0 source-material=0 OK`; the worker's gate adds `build=0 OK`. Dependency check: `depcheck: 235 roadmaps, 2133 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. `lake env lean` on `Suggested.lean`: three `declaration uses sorry` warnings, nothing else. `#check @` on the four declarations in a scratch copy gives the types of `scratch/signatures.md`; every binder is explicit in each signature and none is lost (the `of` entry there is a parsing artefact). `git diff --stat origin/main...HEAD` outside the folder is empty. `scratch/overlaps.md`: no other pull request changes this folder, no cited id is dropped.

**One-tactic probe.** On scratch copies, each of the three theorems was tried with `simp`, `rfl`, `infer_instance`, `intros; simp_all` and `aesop`: 15 attempts, 15 failures. For `analytic_germ_eq_zero_of_subfield` the nearest library lemma, `AnalyticAt.eventually_eq_zero_or_eventually_ne_zero`, is one-variable and does not give the statement for general m. No padding.

**Headlines.** The Summary lists seven end theorems. Stated: Gauss-point closure (`gaussPoint_mem_closure_rationalPoints` with `IsUnitGaussPoint`), the constant-rank normal form (`analytic_constantRank`), the coordinate subfield identity (`analytic_germ_eq_zero_of_subfield`). Named in the module docstring as not statable, each with its missing carrier: functorial resolution and connectedness of the resolution (no smooth or proper morphism of adic spaces, no coherent ideal, no blow-up at the pins), the manifold of rational points and the submersion theorem (charted-space data), the group form on G(C) (needs the §6.4 atlas; Mathlib's `Units` atlas covers GL_n only, and stating that case alone would be a stand-in). README and Lean agree in generality: line 944 against `analytic_constantRank` (complete, characteristic 0, k ≤ m, k ≤ n, rank k near a, no separation axiom); line 1042 against the germ theorem (no completeness, no characteristic); line 661 against the closure theorem (infinite residue field, every n).

**Sources: the seeded sample (15 targets), each read at its locator.**
- §0.5: CONRAD99 lines 414–417 (proof of Corollary 1.2.3, p. 9: A_n → A′_m faithfully flat by isomorphic completions, hence A → A′ flat); TEMKIN12 line 1513 (p. 33, the restriction maps are regular); Tags 031E, 07C0, 07NT, 07QI, 07PM as read in the previous round.
- §1.1: CONRAD99 line 406 (Corollary 1.2.3, p. 9), line 435 (Lemma 2.1.1, pp. 9–10: stalk map is a normalization, product over the fibre at line 442).
- §1.2: CONRAD99 lines 459–464 (Theorem 2.1.2, p. 10: reduced objects, finite, Y normal, Z and f⁻¹(Z) nowhere dense, isomorphism over X − Z; Z the support of the cokernel), line 469 (non-normal locus).
- §1.3: CONRAD99 lines 528–550 (pp. 11–12: idempotent criterion, chains of connected affinoids, local finiteness, clopen unions).
- §1.4: CONRAD99 line 599 (Lemma 2.2.1, p. 13), line 673 (Theorem 2.2.4, p. 14), lines 725–737 (Corollaries 2.2.7–2.2.8, p. 15), lines 653–655 (constant dimension); CONRAD10 line 189 (Lemma 2.1.3, pp. 4–5).
- §1.5: CONRAD99 lines 658–660 (Lemma 2.2.3, p. 14: nonempty X; both characterizations).
- §1.6: CONRAD99 lines 725–732 (Corollary 2.2.7 and proof, p. 15); HK2 lines 2624–2629 (p. 58).
- §1.8: CONRAD10 line 211 (p. 5: complement of a proper analytic set in a connected normal space is connected, by Theorem 2.1.1 applied to idempotents); CONRAD99 lines 801–805 (p. 17).
- §2.4: HK2 lines 2581–2582 (p. 57); BH22 line 346 (Corollary 2.10, p. 8).
- §3.3: HK2 lines 2723–2728 (p. 60: D^n(L′) with its subspace topology is homeomorphic to O_L′^n, complete metric).
- §3.4: HK2 lines 2730–2734 (p. 60); BH22 line 228 (Example 2.1, p. 6). HK2 uses an algebraically closed residue field at this step; the README's infinite-residue statement is its own and is proved in its route.
- §4.5: POINEAU13 lines 182–184 (Notations, p. 271: s(x) + t(x) ≤ dim_x X); BH22 line 329 (Proposition 2.9, p. 8).
- §4.7: BH22 lines 346–348 (Corollary 2.10, p. 8); HK2 lines 2710–2718 (Lemma 9.3.5, p. 60).
- §5.1: CONRAD06 lines 1937–1960 (Definition 4.1.1, pp. 1096–1097: Proj^an of the Rees algebra, proper, invertible pullback, universal property, flat base change and analytification).
- §6.4: STACKS line 3743 (Tag 054L, numbered 37.21 in the Morphisms chapter, p. 83: smooth at x gives an affine open U and an étale U → 𝔸^d_V).

Also read outside the sample: CONRAD10 lines 155–160; BH22 lines 235–252, 295–345, 570–573; POINEAU13 lines 705, 857, 893; HK2 lines 218–221, 691–702, 722–727, 1458–1462, 1598–1599, 2590–2607, 2663–2665; TEMKIN12 lines 99–103, 428–434, 1504–1520, 1534–1540, 1563–1575; CONRAD99 lines 274–278, 329–333, 1008–1012, 1192–1195. All agree with the README's use.

**Library declarations opened at the pins** (file and line; 24 names). Tau Ceti: `classicalPoint` (`AlgebraicGeometry/AdicSpace/Spa/Polydisc/Basic.lean:247`), `classicalPoint_injective_of_isField` (`:281`), `closedPolydisc` (`:115`), `gaussPoint` (`Polydisc/GaussPoint.lean:595`, one variable only), `MvPowerSeries.IsRestricted.gaussNorm_mul` (`RingTheory/MvPowerSeries/TateAlgebra/Basic.lean:567`), `restrictedMvPowerSeriesGaussEquiv` (`RingTheory/Huber/Restricted/GaussNorm.lean:107`), `IsAffinoidAlgebra` (`RingTheory/Affinoid/Basic.lean:30`), `AdicSpace` (`PreAdicSpace/Adic.lean:249`), `PreAdicSpace.LocallyOfFiniteType` (`LocallyOfFiniteType/Basic.lean:85`), `RegularAlgebraMap` (`RingTheory/RegularLocalRing/RegularAlgebraMap.lean:54`), `regularLocus` (`Locus.lean:61`), `isRegularLocalRing_iff_of_flat_of_map_maximalIdeal_eq` (`Flat.lean:54`), `IsRegularLocalRing.of_flat_of_isLocalHom` (`Descent.lean:55`), `isRegularRing_iff_localization_maximal` (`Maximal.lean:31`), `IsNoetherianRing.of_faithfullyFlat` (`RingTheory/Flat/Noetherian.lean:25`), `PointTopology.topology` (`Topology/Algebra/PointTopology/Basic.lean:83`), `SchemePointTopology.topology` (`Scheme.lean:127`). Mathlib, by `#check`: `Manifold.IsSubmersionAt`, `Manifold.IsImmersionAt`, `AnalyticAt.hasStrictFDerivAt`, `HasStrictFDerivAt.toOpenPartialHomeomorph`, `OpenPartialHomeomorph.hasFPowerSeriesAt_symm`, `MvPolynomial.funext` (needs a domain and `Infinite`), `TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system`, `Ideal.height_eq_height_add_of_liesOver_of_hasGoingDown`, `Module.flat_of_isLocalized_maximal`; and the `Units` instances at `Geometry/Manifold/Instances/UnitsOfNormedAlgebra.lean:42, 55, 64`.

**Cross-roadmap citations resolved on main** (10 suppliers, all on main): RigidAnalyticGeometry §§1.2, 2.3, 6.2, 7.3, 7.4, 8.1, 8.3 (headings at lines 205, 355, 479, 617, 640, 690, 738); AdicSpacesPartII R0.19.1–R0.19.2 (line 290), R1.9 (line 10509); AdicSpacesPartIII R2.4, R2.5, R3.6, R3.9 (lines 4986, 5342, 10472, 12470) with `specialisationLimitHomeomorph` (line 5019), `admissibleBlowUp.isProper_surjective_specialFibre` (line 5390), *proper-relatively-compact-covers* (line 5795), `Huber.GelfandSpectrum`, `GelfandSpectrum.compactSpace_nonempty`, `GelfandSpectrum.smoothingFun_eq_sSup` (line 661) — the four names of `scratch/citations.md` are supplier names and resolve there; AdicEtaleGeometry A2.6 (line 7401); SchemeAndStackFoundations §§0.3, 0.8 `etale_coordinates`, 0.20 *IsNagata.integralClosure_finite*, 0.21 `regular_map_completion` and `Excellence.IsQuasiExcellentRing.isNagata`, 4.11 (lines 695, 996, 1486, 1568, 1490, 5820); StableReduction Layer 4 (line 529, Rees algebra and blow-up at 531–532); ResolutionOfSingularitiesCharacteristicZero §§7.0, 7.1, 7.5–7.8 (lines 959–1150; §7.5 states "generically reduced"); ReductiveGroups Layer 3 (line 1262); ReductiveGroupsPartII RG2.0.2 *smooth-group-analytic-charts* (lines 432, 590); LieGroupoidsPoisson G0.1. Comparison-only citations: DiamondsAndVStacks D6.9 (heading and its use of the resolution supplier, at its open head) and AbelianSchemesAndArithmeticModuliPartII B2.10 (heading "Real constant-rank theorem", at its open head).

**Ownership.** Searched main and every open head by object for weakly Shilov points, the Riemann extension theorem, global normalization and irreducible components of rigid spaces, rigid blow-ups, Temkin's rigid resolution, Gauss-point closure and the analytic constant-rank theorem. Other roadmaps cite the same sources or consume these targets (AdmissiblePairsAndPadicHodgeStructures and ClassicalAdicEtaleCohomologyPartII cite RZ.k / name ids that all exist here); none states them. No `Suggested.lean` declares a name of this file.

**Declared gaps.** Five slugs, the same in the README and the plan, each with a named supplier on main and a single statement. Spot-checked against the suppliers on main: ReductiveGroups Layer 3 has the fppf quotient and no smoothness of the quotient map; SchemeAndStackFoundations has formal smoothness only in §4.1, for schemes; ResolutionOfSingularitiesCharacteristicZero has no countability statement; AdicSpacesPartIII R3.6 takes Kiehl-properness as a hypothesis.

**Adversarial table.**

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| `gaussPoint_mem_closure_rationalPoints`, §3.4 | residue field infinite; 𝔽_q with q = 2, 3; n = 0 | Neighbourhood of η with g = T(T − 1): ḡ(ā) ≠ 0 for ā ∉ {0, 1}, which exists when the residue field has more than 2 elements; then \|g(a)\| = 1. Over 𝔽_q: \|T^q − T\| = 1 at η and < 1 at every a ∈ K°, so the closure misses η. n = 0: one point, Gauss norm of a constant is its norm | true; `Infinite` needed for n ≥ 1 |
| `IsUnitGaussPoint` | π + T at η and at T = 0 | 1 = max(\|π\|, 1) at η; \|π\| at T = 0, so the evaluation point fails the comparison with the constant 1 | determines the class |
| `analytic_constantRank`, §6.1 | (x, y) ↦ (x, 0); x ↦ x² at 0; Tᵖ in characteristic p; m = n = k = 0 | First: rank 1, already normal. Second: rank 0 at 0 and 1 nearby, hypothesis fails. Third: rank 0 everywhere, value π^(np) ≠ 0 at πⁿ, normal form (0) would force local constancy. Fourth: empty coordinates | true; `CharZero` and the neighbourhood hypothesis needed |
| `analytic_germ_eq_zero_of_subfield`, §6.6 | Σ c_n zⁿ zero on pᵏℤ_p; z(z − a), a ∉ E; m = 0; zᵖ over 𝔽_p((t)) | First: lowest coefficient c_k = lim f(t)/tᵏ = 0, so all vanish. Second: zero at 0 only, hypothesis fails. Third: f(0) = 0 on both sides. Fourth: value t^(kp) ≠ 0, hypothesis fails | true with no completeness or characteristic |
| §0.5 *affinoid-localization-regular* | K⟨T⟩ → K⟨T, T⁻¹⟩ at (T − 1); K⟨T⟩ → K; K → K(a^(1/p)) | First: both completions K[[T − 1]]. Second: K is T-torsion, not flat. Third: fibre K(a^(1/p))[ε]/(εᵖ), not reduced | consistent |
| §1.1 *rigid-normalization* | cusp; K⟨T⟩/(T²); XY = 0; origin → XY = 0 | Cusp: A^ν = K⟨t⟩, t² ∈ A. Second: A_red = K, A^ν = K. Third: two discs, 2 points over the origin. Fourth: preimage of the nowhere dense origin is the whole point, 2 lifts | consistent; hypothesis of the universal property needed |
| §1.2 *normalization-characterisation* | cusp map; one axis ↪ XY = 0; X ⊔ Spa K → X | First: Z = {0}, both sides true. Second: Z must contain the other axis, not nowhere dense: criterion false, and the normalization has 2 components. Third: f⁻¹(Z) contains an open point: false, and the source is not X^ν | iff holds on all three |
| §1.3 *connected-components* | K × K; ∅; XY = 0; countably many discs | 2 components; 0 components, preconnected, not connected; idempotent is 0 or 1 on each axis with equal value at the origin, so 1 component; an affinoid meets finitely many | consistent with Mathlib's notions |
| §1.4 *irreducible-components* | XY = 0; nodal cubic; two disjoint discs; ∅ | X^ν has 2, 1, 2, 0 connected components; node has t = ±1 over it and x = t² − 1, y = t(t² − 1) gives y² = x²(x + 1) | consistent |
| §1.5 *irreducibility-criterion* | XY = 0; disc; Spa K[ε]/(ε²) | First: (a), (b), (c) all false: union of axes, and {\|X\| = 1} ⊆ V(Y). Second and third: all true | iff holds |
| §1.6 *full-dimensional-closed-subset* | disc with Z = V(T); two discs with Y the first; bidisc V(XY) | 0 < 1; dim_y Y = 1 = dim_y M and Y is the component, not M; 1 < 2 | consistent |
| §1.8 *dense-open-connected* | punctured disc; nodal cubic minus node; XY = 0 minus origin | Normalizations of the complements: punctured disc, line minus {±1}, two punctured discs: 1, 1, 2 components; the third is not irreducible | consistent |
| §2.4 *singular-stratification* | cusp (d = 1); plane ∪ line (d = 2); K(a^(1/p)) over imperfect K | Y₁ = {0}, Y₂ = ∅: 2 strata ≤ d + 1; Y₁ = point, Y₂ = ∅; regular, Ω of rank 1 ≠ 0, not smooth | consistent; perfect K needed |
| §3.3 *polydisc-points-topology* | ℤ_p in the disc; n = 0 | For a ∈ ℤ_p: \|a² − p\| is 1 or \|p\|, never ≤ \|p\|²; \|aᵖ − a\| < 1 against 1 at η; n = 0 one point | consistent |
| §4.3 Shilov API, line 744 | Spa K → disc; K⟨T⟩ → K⟨T⟩ × K; T ↦ T² | Shilov point ↦ classical point in the first two; Gauss ↦ Gauss in the third | R01 |
| §4.5 *abhyankar-bound* | Gauss point of Dⁿ; classical point; irrational radius; Spa L | n ≤ n; 0 ≤ n; 0 ≤ 1; 0 ≤ 0 | consistent |
| §4.7 *weakly-shilov-avoid-nowhere-dense* | V(T) in the disc; isolated point of Spa(K⟨T⟩ × K); V(Y) in XY = 0 | 0 ≠ 1, avoided; the isolated point is weakly Shilov (0 = 0) and open, not nowhere dense; V(Y) contains the Gauss point of its axis and is not nowhere dense | nowhere density needed |
| §5.1 *rigid-blow-up* | disc at (T); zero ideal; unit ideal; K⟨x,y⟩/(y², xy) at (x, y) | Isomorphism; ∅; X; x-chart K⟨x⟩ (x²u = 0 forces u = 0), y-chart 0 (y² = 0 with y a nonzerodivisor) | consistent |
| §5.2 hypersequence | y² = x^(2n+1) | y = xu gives u² = x^(2n−1): n steps, 0 for n = 0 | consistent |
| §5.4 *resolution-consequences* | cusp; XY = 0; K[ε]/(ε²); nodal cubic | Bijective; 2 points over the origin and disconnected; Spa K → T; connected | R02 |
| §6.4 *algebraic-point-atlas* | G_m over ℝ ⊆ ℂ; GL₂; μ₃ over ℝ | Inversion w ↦ −w/(1 + w), derivative −1; \|det g − 1\| < 1/8 + 1/8 + 1/64 + 1/64 = 9/32; d = 0, 1 real point and 3 complex points, chart a singleton | consistent |
| Inversion contract | T + T² | (T − T² + 2T³) + (T − T² + 2T³)² = T + O(T⁴) | consistent |
| `gap:countable-resolution-invariants` | README line 140 against the plan | "resolution functor" against "reduced resolution functor"; §7.5 on main is one functor on generically reduced schemes | README correct |

**Lean context.** `gaussPoint_mem_closure_rationalPoints` quantifies over a point x of `spa (powerBoundedSubring K)`, which is a single point for a rank-one K, so the quantifier adds nothing. `analytic_constantRank` assumes `ContMDiffAt … ω f a`, which gives analyticity on a neighbourhood of a, so `mfderiv` takes no junk value in `hrank`. In `analytic_germ_eq_zero_of_subfield`, `NormedAlgebra E C` between normed fields makes `algebraMap` isometric.

## Not verifiable

- SCHNEIDER11 (§§5–9), BARTENWERFER76 (§3) and LUTKEBOHMERT74 (Theorem 1.6) are recorded as uncertified and were not read. The two attributions for §1.7 are checked against CONRAD10 lines 155–156 only.
- The bodies of DiamondsAndVStacks D6.9 and AbelianSchemesAndArithmeticModuliPartII B2.10, cited for comparison in Scope and ownership, were checked at their headings and summaries, not line by line.
- The proofs of POINEAU13 Lemme 4.4 and Corollaires 4.15 and 4.18 were not followed; their statements match the use in §4.6.

## Source issues

- **Misprint** in BH22 at proof of Proposition 2.2, p. 6 (line 243): the source says the open bounded subalgebra A₀ is contained in A₀; it should be contained in A°, as six lines later; affects nothing.
- **Misprint** in HK2 at §1.1, p. 5 (line 219): the source says a closed set V meets each affinoid open U in a vanishing locus, but writes the intersection with an undefined C; it should be V ∩ U; affects nothing.
- **Misprint** in HK2 at proof of Theorem 9.1.3, p. 58 (line 2600): the source says the orbit K₀·y is an element of V(C); it should be a subset of V(C); affects nothing.
