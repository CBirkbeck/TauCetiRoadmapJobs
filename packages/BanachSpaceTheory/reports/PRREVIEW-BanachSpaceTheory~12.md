# Review of BanachSpaceTheory (pull request #1854 at 473bbf7)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/BanachSpaceTheory/` at `473bbf7`, against the pins Mathlib `1b1ccf4` and Tau Ceti `2fd255d`. The folder changed by 3601 lines since `81fee5f`. The status of each previous finding is under "Repairs of the previous review" in `## Verified sound`.

## R01 (P2) — Two statable headline theorems are missing from `Suggested.lean`

**Location.**
- `README.md:19–20`: "John's bound `d(E, ℓ₂ⁿ) ≤ √n`, the Kadec–Snobar and Garling–Gordon projection theorems". Garling–Gordon is stated at `README.md:1685–1688`.
- `README.md:478–482`: "Prove James's theorem (`james`): for a nonempty norm-closed bounded convex subset `A` … weak compactness is equivalent to attainment … Deduce … the form stated in `Suggested.lean`."

**Claim.**
- **Garling–Gordon.** The Summary names it as a theorem this roadmap builds, and SNumbers on main consumes it from B7. `Suggested.lean` does not state it, and its module docstring does not list it as unstatable. Every carrier it needs is native.
- **James.** The README attaches the name `james` to the convex-set theorem. `Suggested.lean:60` states only its unit-ball corollary, so the Lean statement is narrower than the README's. The convex-set form can be stated at the pins.

**Witness.** Both statements in the repair elaborate at the pins in a scratch probe, with `sorry` as the only warning. SNumbers consumes Garling–Gordon at `TauCetiRoadmap/SNumbers/README.md:108,324` and `SNumbers/Suggested.lean:463` on main.

**Repair.**
- Add Garling–Gordon to the Layer 7 section of `Suggested.lean`:
  `theorem garling_gordon (M : Submodule 𝕜 E) (hM : IsClosed (M : Set E)) [FiniteDimensional 𝕜 (E ⧸ M)] (ε : ℝ) (hε : 0 < ε) : ∃ P : E →L[𝕜] E, P.comp P = P ∧ LinearMap.ker P.toLinearMap = M ∧ ‖P‖ ≤ Real.sqrt (Module.finrank 𝕜 (E ⧸ M)) + ε`.
- Add the convex-set James theorem to the Layer 2 section:
  `[CompleteSpace E] [Module ℝ E] [IsScalarTower ℝ 𝕜 E] (A : Set E) (hne : A.Nonempty) (hc : IsClosed A) (hb : Bornology.IsBounded A) (hconv : Convex ℝ A) : IsCompact (toWeakSpace 𝕜 E '' A) ↔ ∀ f : StrongDual 𝕜 E, ∃ a ∈ A, ∀ b ∈ A, RCLike.re (f b) ≤ RCLike.re (f a)`.
- Give it the name `james`, and rename the present unit-ball theorem, keeping it as the corollary. Alternatively, move the backticked `james` at `README.md:478` onto the corollary sentence and give the convex-set theorem a new name in both files.

**Tested.**
- Garling–Gordon at `M = ⊤`: `P = 0` has `‖P‖ = 0 ≤ ε`.
- Garling–Gordon at `M = ker f` with `‖f‖ = 1`: take `P x = f(x) x₀` with `f(x₀) = 1` and `‖x₀‖ < 1 + ε`. Then `‖P‖ < 1 + ε = √1 + ε`.
- `hM` is needed: when `f` is a discontinuous functional, `ker f` has codimension 1 but is not the kernel of any continuous projection.
- `hne` is needed: at `A = ∅` the left side is true and the right side is false.
- On the closed unit ball of `ℓ¹`, both sides of the James equivalence are false, witnessed by `f = Σ (1 − 1/n) xₙ`.

## R02 (P2) — §7.1's trace-duality identity is asserted for every Banach space, but its route proves it only under MAP, and §4.4 and §7.1 cite each other

**Location.**
- `README.md:1648–1650`: "deduce for every real or complex Banach space `E` and every `u` in the completed `E* ⊗̂π E` that `‖u‖π` equals the supremum of `|⟨u, S⟩|` over `S` in the unit ball of `L(E)`". Line 1653 adds "prove that density from local reflexivity on finite tensors".
- `README.md:691`: "for general `X` it is §7.1".

**Claim.**
- The pinned local reflexivity, `LinearIsometry.exists_continuousLinearMap_of_doubleDual`, returns a map `R` defined on a finite-dimensional `V ⊆ E**`.
- A norming `T ∈ L(E, E**)` generally has infinite rank, so `R ∘ T` is not defined on `E`.
- Reducing to a finite-rank `T` needs finite-rank contractions converging to `I`, which is exactly the MAP of `E`.
- So the route proves the identity only for spaces with the MAP. That is also the only case §4.4 uses, in the direction from MAP to isometry. No source is given for the general statement.
- The coupling also creates a coarse cycle. Layer 4's Dependencies (`README.md:1065–1066`) cite §7.1, and Layer 7's (`README.md:1763`) cite §4.4. "How to read the build" (`README.md:343–345`) omits §7.1 from Layer 4.

**Witness.** In `daws04`, Theorem 2.3.14 (lines 1717–1727, printed pp. 43–44) shows that the pairing with finite-rank operators reproduces `‖u‖π` exactly when `E` has the MAP. That is the step the route needs.

**Repair.**
- In §4.4, prove "MAP ⇒ `‖Θ_X u‖ = ‖u‖π`" directly:
  1. Take a finite `u = Σ fᵢ ⊗ xᵢ` and a `T` in the unit ball of `L(X, X**)` that norms `u`.
  2. By MAP, choose a finite-rank `F` with `‖F‖ ≤ 1` and `‖F xᵢ − xᵢ‖ < δ`.
  3. Apply the pinned local reflexivity to the range of `T ∘ F` and `G = span fᵢ`. This gives `S = R ∘ T ∘ F`, of finite rank, with `‖S‖ ≤ 1 + ε` and `|⟨u, S⟩| ≥ |⟨u, T⟩| − δ Σ ‖fᵢ‖`.
  4. Extend to the completion using that `Θ_X` is a contraction.
- Delete "and for general `X` it is §7.1" (`README.md:691`).
- Remove §7.1 from §4.4's *Needs:* line (`README.md:823`) and from Layer 4's Dependencies.
- In §7.1, either restrict the identity to spaces `E` with the MAP, or cite a theorem that proves it for every Banach space.

**Tested.**
- For reflexive `E`, `S = J⁻¹ ∘ T` attains the supremum.
- For `E = 𝕜`, both sides equal `|u|`.
- After the repair, the section graph has only §7.1 → §4.4 and no edge back.

## R03 (P3) — The push gate still fails on files outside the folder

**Location.** The gate at this head reports `outside-folder=2`: `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`.

**Claim.** The pull request edits two roadmap folders that are not among its own. This is unchanged since the previous review's R05, and no review can accept while the gate fails.

**Witness.** `git diff --stat origin/main...HEAD`, excluding this pull request's 17 folders, lists exactly these two files (4 insertions, 4 deletions).

**Repair.** Move the ArithmeticDirichletSeries and SymplecticGeometry loop cuts into a pull request whose folders include them. Alternatively, have both folders recorded as this pull request's own, so that each gets its own review.

## R04 (P3) — Layer 5 targets need later targets: §5.4 needs §5.7, and §5.7 and §5.9 need each other

**Location.**
- `README.md:1229–1230`: "For the reverse inequality, use the density construction of §5.7 at `ν = |μ|`".
- `README.md:1364`: §5.7 *Needs:* "§§5.4, 5.6, 5.9".
- `README.md:1497`: §5.9 uses "the Radon–Nikodym comparison of §5.7".
- `README.md:1521`: §5.9 *Needs:* "§§1.3, 5.6, 5.7".

**Claim.** Three dependencies run against the build order, and two of them form cycles between sections:
- The Riesz norm equality of §5.4 uses the density construction placed in §5.7.
- The Dunford–Pettis property of `C(K)` in §5.7 uses `M(K) ≅ C(K)*` from §5.4.
- The Dunford–Pettis property of `L¹` in §5.7 uses `L∞ ≅ C(K_μ)` from §5.9.
- The Yosida–Hewitt identification in §5.9 uses §5.7.

Each *Needs:* line covers targets with different needs.

**Witness.** The *Needs:* lines at `README.md:1267` (§5.4: "§5.7's density construction"), `:1364` and `:1521`.

**Repair.**
- Move the general density construction from §5.7 into §5.4, ahead of the Riesz theorem. This is `README.md:1338–1343`: `h = rnDeriv(re μ, ν) + I · rnDeriv(im μ, ν)`, `μ = ν.withDensityᵥ h`, and `|h| = 1` `|μ|`-a.e.
- Have §5.7 and §5.9 cite §5.4 for it, and change §5.9's *Needs:* to "§§1.3, 5.4, 5.6".

**Tested.** After the move, the order 5.4 → 5.6 → 5.9 → 5.7 satisfies every *Needs:* line.

## R05 (P3) — Renamed layer headings break anchor links on main, and no old → new line is given

**Location.** `README.md:347` "## Layer 1: duality and weak topologies (B1)", and likewise `:474`, `:582` and `:1068`. These replace the headings `## B1. …`, `## B2. …`, `## B4. …` and `## B5. …`.

**Claim.** When this merges, these links on main break:
- `VonNeumannAlgebras/README.md:196` (`#b1-duality-and-weak-topologies`).
- `VonNeumannAlgebras/README.md:199` (`#b2-weak-compactness-and-reflexivity`).
- `VonNeumannAlgebras/README.md:200` and `:1013` (`#b4-approximation-and-banach-tensor-products`).
- `OperatorTheory/ToeplitzOperators/README.md:30` (`#b5-function-spaces-and-weak-compactness`).

The ids B1–B7 survive in the heading text, but not as anchors. Hyperfunctions links a fixed commit and is unaffected.

**Witness.** The overlap report for this roadmap lists these four dropped anchors. `grep` of main confirms the five relative links at the lines above.

**Repair.** Keep the four anchors live by placing `<a id="b1-duality-and-weak-topologies"></a>` (and the B2, B4 and B5 equivalents) directly above the Layer 1, 2, 4 and 5 headings. Alternatively, add one old → new line per anchor under `## Scope and ownership`.

## R06 (P3) — Headline theorems and eight sampled subsections carry no source locator; John and Kadec–Snobar over ℂ cite a real-only source

**Location.**
- No source is cited in §5.2 (`README.md:1104–1151`), §5.4 (`:1206–1267`) or §5.6 (`:1289–1314`). These sections own the headlines `hilbertBasis_lift_mk_eq`, `nonempty_linearIsometryEquiv_iff_lift_mk_eq`, `exists_linearIsometryEquiv_hilbertBasis`, `exists_unique_vectorMeasure_regular`, `exists_lpInftyDualEquiv` and `exists_lpDualEquiv`.
- No locator in §1.2, §3.1 (the ambient small-perturbation theorem), §4.3, §5.1, §5.3, §5.9 (Yosida–Hewitt) or §7.1.

**Claim.**
- Every theorem needs a locator at the claim. Eight of the fifteen sampled subsections have none: 1.2, 3.1, 4.3, 5.1, 5.3, 5.4, 5.9 and 7.1.
- §7.2 cites Ball for John's theorem over `𝕜`, but Ball's theorem is real. Albiac–Kalton is uncertified, so nothing checkable covers `𝕜 = ℂ` for `banachMazurDist_euclideanSpace_le_sqrt` or `kadec_snobar`.

**Witness.** `ball97` lines 567–573 (Theorem 3.1, p. 13) state John's theorem for convex bodies in `ℝⁿ`.

**Repair.**
- Add a theorem-and-page locator at each of these claims, from a standard text recorded in the manifest. Candidates are Rudin's *Real and Complex Analysis*, Chapter 6, for §5.4 and §5.6 (the pinned `ScalarIntegral.lean` already cites it), and Yosida–Hewitt (1952) for §5.9.
- Cite a source that treats complex scalars for the `𝕜 = ℂ` case of John's theorem and Kadec–Snobar.

## R07 (P3) — §7.3 and §5.2 restate results that are pinned in Tau Ceti

**Location.**
- `README.md:1715–1722`: "Build … normalized spherical measure, rotation invariance … Prove its radial/directional independence and the normalized direction's spherical distribution".
- `README.md:1735`: "Use the Rademacher convexity inequality".
- `README.md:1131–1132`: "Conversely transport a Hilbert basis along a unitary".

**Claim.** All of these exist at the pinned Tau Ceti. None is named in the supplier contract or in a *Needs:* line.

**Witness.**
- `TauCeti.Probability.uniformSphereMeasure` (`Probability/Distributions/Uniform/Sphere/Basic.lean:77`).
- `LinearIsometryEquiv.map_uniformSphereMeasure` (`:138`).
- `TauCeti.Probability.stdGaussian_map_sphereDirection_prod_norm` (`:237`).
- `Finset.sup'_norm_le_integral_norm_sum_smul_rademacher` (`Probability/Distributions/Rademacher/Norm.lean:98`).
- `HilbertBasis.mapₗᵢ` (`Analysis/InnerProductSpace/HilbertBasis/Map.lean:32`).

**Repair.**
- Replace the restated items with citations of these names.
- Add them to the Layer 5 and Layer 7 `From Tau Ceti` contracts and to the *Needs:* lines of §5.2 and §7.3.
- Also cite `TauCeti.Probability.stdGaussian_map_sphereDirection` (`:251`) and `ProbabilityTheory.HasLaw.indepFun_sphereDirection_norm_stdGaussian` (`:277`).
- Name Mathlib's `ProbabilityTheory.stdGaussian` (`Probability/Distributions/Gaussian/Multivariate.lean:65`) as the carrier of §6.1's finite Gaussian model.

## R08 (P3) — The definitions of §4.5, the normalized trace of §4.4 and §5.3's Fourier bases have no Checks

**Location.**
- §4.5 (`README.md:826–1054`) defines the Bourgain–Delbaen construction, rapidly increasing sequences, exact pairs, spreading models, Krivine sets, thin families, the Schreier family `S₁` and the `(D, d)` property. Its only Checks (`:1044–1050`) are the parameter arithmetic.
- §4.4 defines `Tr̃(M, T)` (`:786–787`) without a Check.
- §5.3's unitaries and real trigonometric basis (`:1155–1161`) have none.

**Claim.** Each definition needs at least three discriminating Checks, so that a wrong definition fails one of them.

**Witness.** The three Checks at `README.md:1045–1050` concern `(4, 16)`, `2^288` and the inequality `δm/(192C) > ‖T‖`. None of them involves these definitions.

**Repair.** Add Checks such as the following.
- **Thin families.** `{{1}, {1,2}}` is not thin; `{{1,2}, {1,3}}` is thin.
- **Schreier family, 1-based.** `{2,3} ∈ S₁` and `{1,2} ∉ S₁`. Under 0-based `ℕ`, `{0} ∉ S₁`, which is why the README's `n ↦ n + 1` convention is needed.
- **Krivine sets.** The unit-vector basis of `ℓᵖ` has Krivine set `{p}`, and that of `c₀` has `{∞}`.
- **Normalized trace.** `Tr̃(M, I) = 1`. With `M = {e₁, …, e_t}` and the coordinate projection onto `e₁`, `Tr̃ = 1/t` while the unnormalized trace is `1`.
- **Trigonometric basis.** `‖√2 cos 2πt‖₂ = 1`, `⟨√2 cos 2πt, √2 sin 2πt⟩ = 0`, and `√2 cos 2πnt = (eₙ + e₋ₙ)/√2`.

## Verified sound

**Repairs of the previous review (`81fee5f`).**
- **R01 (P2): repaired.**
  - `README.md:55–56` now reads "From B5: the scalar-measure integration layer. Its five items … are Tau Ceti's at the pin, and this roadmap and SelfAdjointSpectralTheory both consume them there".
  - B5.BoundedApprox is pinned after all, as `MeasureTheory.exists_continuous_norm_le_forall_integral_norm_sub_le` (`ContinuousApproximation.lean:87`) and `…exists_seq_continuous_norm_le_tendsto_integral_norm_sub` (`:119`). The previous review was wrong to call it absent.
- **R02 (P2): repaired.**
  - The headlines `exists_unique_vectorMeasure_regular` (`Suggested.lean:149`), `isCompact_closure_toWeakSpace_lp_one_iff` (`:175`) and `banachMazurDist_euclideanSpace_le_sqrt` (`:241`) are added.
  - The Pietsch bullet is gone.
  - The tensor bullet now names the missing `Θ_X` (`:34–37`).
- **R03 (P2): repaired.** `kadec_snobar (F : Submodule 𝕜 E)` (`:248`).
- **R04 (P2): repaired.** `README.md:1560–1562` uses the `n`-fold family, and the Check at `:1576–1579` explains that the two-point family excludes only constant 1.
- **R05 (P3): not repaired.** Raised again as R03.
- **R06 (P3): repaired.** The eight declarations are deleted, and the module docstring (`:21–25`) lists them as consumed.
- **R07 (P3): repaired.**
  - The six carriers and the three theorems built on them are deleted.
  - `cotype2_summing_bound` is stated on `ContinuousLinearMap.summingENorm`.
  - Enflo is stated with `¬ TauCeti.HasApproximationProperty ℝ E`.
- **R08 (P3): settled.** B5.BoundedApprox is cited at the pin, so it needs neither a locator nor Checks here.
- **R09 (P3): repaired.** `README.md:1167–1168` reads "PDE Layer 1 §1.1 (A1)'s identification", and `:1377` reads "`StrongDual 𝕜 (MeasureTheory.Lp 𝕜 1 μ)`".
- **R10 (P3): repaired except for R08 above.** The README now has the house shape: Summary, Scope and ownership, Conventions, supplier contracts, How to read the build, Layers with `### k.n` subsections, *Needs:* lines, Examples, Dependencies, Downstream consumers and References.

**Gate, dependencies and elaboration.**
- **Gate.** My re-run reports `outside-folder=38` without excluding the pull request's folders. After excluding them, two files remain (R03). Every other check is 0.
- **Dependency check.** `depcheck: 236 roadmaps, 2270 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. BanachSpaceTheory is on main and therefore not in the merge order.
- **Elaboration.** `lake env lean …/Suggested.lean` produced 22 `declaration uses 'sorry'` warnings and nothing else.
- **Signatures.** I put `#check @name` for all 24 declarations in one scratch file and elaborated it once. Every type carries its binders. The two leads of the signature report are binders inside `∃`, so they are false positives.
- **Padding probe.** I replaced each `sorry` with `first | (simp; done) | rfl | infer_instance | trivial | (aesop; done)`. None of the 22 theorems closed, so nothing is padding.
- **Form.**
  - Imports are `import Mathlib` plus six Tau Ceti modules, each of them used.
  - There is no `set_option`, no sorry'd data and no `lemma`.
  - There is one module docstring, every declaration has a docstring, and the layer comments follow README order.
  - All 24 Lean names appear in the README.

**Library declarations opened at the pins.**
- **Tau Ceti.** All 145 Tau Ceti names in the supplier contract resolve at the file and line the README gives. I checked them with a namespace-aware index of the pinned tree; for example `lp.dualEquiv` is at `Analysis/Normed/Lp/Dual.lean:175`, and `banachMazurDist` at `BanachMazur.lean:69`.
  - The text was read for `lp.dualEquiv` (`Dual.lean:175`, where `q ≠ ∞` covers `(ℓ¹)* = ℓ∞` at `q = 1`).
  - The text was read for `exists_continuous_norm_le_forall_integral_norm_sub_le` (`ContinuousApproximation.lean:87`, on a normal Borel space with finite weakly regular measures and a radial retraction at most doubling errors).
  - The text was read for `MeasureTheory.Lp.toDual` (`Duality.lean:431`, an isometry for σ-finite measures) and `dualOneEquiv` (`L1Space/Dual.lean:102`, finite measures only). So `exists_lpInftyDualEquiv` is a genuine extension.
  - The text was read for `HasDunfordPettisProperty` and `hasDunfordPettisProperty_iff` (`DunfordPettis/Basic.lean:247,296`). The pinned DPP instance is only for discrete `ι` (`DunfordPettis/Dual.lean:97`), so the `C(K)` and `L¹` statements are genuine targets.
  - The text was read for `banachMazurDist` (`:69`, junk value 0 when no equivalence exists; at `n = 0` the bound is `0 ≤ 0`).
  - The text was read for `HasApproximationProperty` (`ApproximationProperty/Basic.lean:47`) and `summingENorm` (`AbsolutelySumming/Basic.lean:99`, with `p : ℝ≥0∞`).
  - The text was read for `sqrt_log_card_div_le_integral_sup'_abs` (`Gaussian/Maximum.lean:83`, constant `1/32` as in §7.3), `exists_finset_isCover_sphere` (`CoveringNumber.lean:168`, net size `(1 + 2/η)^dim`) and local reflexivity (`LocalReflexivity.lean:228`).
  - The text was read for the complex action on `Complexification` (`Complexification.lean:136,140`, giving `i·⟨x,y⟩ = ⟨−y, x⟩`).
- **Mathlib.** All Mathlib names in the README resolve with `#check`, for example `ComplexMeasure.integrable_rnDeriv` (`Decomposition/Lebesgue.lean:434`), `SchauderBasis.nnnormProjBound` (`Bases.lean:336`) and `stdGaussian` (`Multivariate.lean:65`).
- **Not at the pins, so genuine targets:** James, Hilbert dimension, Riesz representation of `C(K, 𝕜)*`, both `Lᵖ` dualities, the Dunford–Pettis criterion and property, Banach–Stone, cotype, Grothendieck's theorem for `L¹`, John, Kadec–Snobar, Dvoretzky, Enflo, Argyros–Haydon, the complexification dual and the general scalar density of §5.7.

**Cross-roadmap citations resolved on main (`623f5d6`).**
- OperatorIdeals OI-A01 (`:125`), OI-A25–A28 (`:172–179`), OI-B29 and OI-B30 (`:349–350`).
- AmenableGroups Layer 7 (`:415`) and item 1 (`:438`).
- PDE Layer 1 §1.1 (A1) (`:677`).
- PseudodifferentialOperators Layer 5 (P5) (`:927`).
- SelfAdjointSpectralTheory at this head cites B5.ScalarIntegral and the other B5 ids, which the scope list keeps.
- The two leads of the citation report, `LocalHaarDual` and `Cotype2`, are target ids `B5.LocalHaarDual` and `B6.Cotype2`, not Lean names; the gate's `readme-ids-missing=0` agrees.

**Ownership against open pull requests.**
- I searched open heads and main with `roadmaps grep` for Banach–Stone, Kadec–Snobar, Dvoretzky, John, Garling–Gordon, Dunford–Pettis, Hilbert dimension, James, Enflo, Argyros–Haydon, Yosida–Hewitt and cotype.
- I found only consumers: UnboundedOperators (#1027), VonNeumannAlgebras (#1041), QuantumFoundations (#1771), and SNumbers and NoncommutativeIntegration on main.
- The overlap report lists no other open pull request that changes this roadmap and no cited id that an open pull request drops. The ids this pull request drops are the anchors of R05.

**Sources (seeded sample).**
- §4.4: `daws04` Theorem 2.3.14 (lines 1717–1727, printed pp. 43–44) and Theorem 2.3.23 (lines 1804–1818, pp. 46–47). The README's locator "pp. 43–47" is correct.
  - Daws's trace pairing `λ(x)µ(y)` matches `Θ(f⊗x)(y⊗g) = f(y)g(x)` after renaming.
  - Daws's chain `‖T‖π ≤ ‖T‖_N ≤ ‖T′′‖ ≤ ‖T′‖ = ‖T‖π` matches `README.md:729–731`.
- §5.5: `garridojaramillo02` §2, Theorem 2 (line 161, printed p. 355) and Theorem 4 (line 193, p. 355).
  - Isometries there are bijections (line 96), which matches `≃ₗᵢ`. The scalars are real, as the README notes.
- §5.8: `bdlhv08` Appendix C.5 (lines 14607–14627, printed pp. 383–384). Locally Borel and locally null sets, `L∞` modulo locally null functions, and the bilinear pairing `∫ f φ` match `README.md:1368–1380`.
- §6.1: `pisier12gt` Definition 9.6 (lines 1591–1598, printed p. 31) and the cotype-`p` variant (line 1604–1605, p. 32). These match `HasCotype`.
- Also checked (§7.2, §4.5):
  - `ball97` Theorem 3.1 (line 567, p. 13) and `B ⊆ K ⊆ √n B` (line 560). It is real only (R06).
  - `argyroshaydon11` Lemma 2.2 (lines 92–98) matches `README.md:838–841`.
  - Assumption 2.3 and the base sequence `(2^(2^j), 2^(2^(j²+1)))` (lines 138–143) match `README.md:849–854`.

**Adversarial table.**

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| `james` | `E = 0`; `ℓ¹` with `f = Σ(1−1/n)xₙ`; Hilbert `f = ⟪y,·⟫` | `0`: J onto, `x = 0` gives `‖0‖ = 0 = ‖f‖`. `ℓ¹`: `‖f‖ = 1` but `|f(x)| < 1` on the ball, and J is not onto (pinned `lp.not_surjective…_one`). Hilbert: attained at `y/‖y‖` | holds | R01 (convex-set form) |
| convex-set James (absent) | `A = ∅`; unit ball of `ℓ¹` | `∅`: compact (true), but `∃ a ∈ ∅` is false. `ℓ¹` ball: false / false | needs `A.Nonempty` | R01 |
| Garling–Gordon (absent) | `M = ⊤`; `M = ker f` with `‖f‖ = 1`; non-closed `ker` | `‖0‖ = 0 ≤ ε`; `‖P‖ = ‖x₀‖ < 1 + ε`; no continuous `P` | statable, needs `IsClosed` | R01 |
| `hasApproximationProperty_iff_injective…` | `E = 𝕜`; `E = 0` | `F ⊗̂π 𝕜 ≅ F ≅ F ⊗̂ε 𝕜`, the map is `id`, injective, AP true; `0`: true / true | holds | none |
| `hasMetricApproximationProperty_of_surjective…` | `E = 0`; `ℓ²` | `T = 0`, `‖0‖ = 0 ≤ 1`; `Pₙ` with `‖Pₙ‖ = 1`, `Pₙx → x` | holds; completeness follows from reflexivity | none |
| metric criterion and §7.1 identity | `X = 𝕜`; `ℓ²ₙ` with `u = Σ eᵢ*⊗eᵢ`; transposed convention | `𝕜`: identity. `ℓ²ₙ`: `Θu(Σ eⱼ⊗eⱼ*) = Σδᵢⱼ = n = ‖u‖π`, with `‖v‖ε = 1`. `e₁*,e₂,e₁,e₂*`: `f(y)g(x) = 1`, while `f(x)g(y) = 0`. Non-MAP `E`: the route needs a finite-rank `T` | true under MAP | R02 |
| `exists_complexificationStrongDualEquiv` | `E = ℝ`, `⟨g,h⟩ = ⟨id,0⟩`; `i·⟨x,y⟩ = ⟨−y,x⟩` | `x + iy` = identity; `φ(−y,x) = −gy − hx + i(gx − hy) = i·φ(x,y)`; `e⟨−h,g⟩ = i·e⟨g,h⟩` | holds | none |
| `hilbertBasis_lift_mk_eq` and classification | `H = 0`; `ℝ` against `ℝ²`; `ℓ²(ℕ)`, `ℓ²(ℤ)` | `0 = 0`; `1 ≠ 2` and no isometry; `ℵ₀ = ℵ₀` via `ℕ ≃ ℤ`, while the Hamel rank is `𝔠` | holds | R06 (locator) |
| `exists_unique_vectorMeasure_regular` | `K` a point; `[0,1]` with `φ = ev₀ − ev₁`; `K = ∅` | `‖cδ‖ = |c|`; `‖φ‖ = 2` at `f = 1 − 2t`, `|δ₀ − δ₁|([0,1]) = 2`; `φ = 0`, `μ = 0` unique | holds | R04, R06 |
| `exists_lpInftyDualEquiv` | `μ = ∞·δ_a`; `μ = 0` | `L¹ = 0`, `L∞ = 𝕜`, so no equivalence, which `SigmaFinite` excludes; `0 ≅ 0` | holds | R06 |
| `exists_lpDualEquiv` | counting on `{1,2}`, `p = 3`, `g = (1,1)`; `ℂ`, `p = 2` | `sup |f₁+f₂|` over `‖f‖₃ ≤ 1` is `2^(2/3) = ‖g‖_(3/2)`; `∫fg` is `ℂ`-linear, while `∫f·conj g` is antilinear | holds | R06 |
| `isCompact_closure_toWeakSpace_lp_one_iff` | `fₙ = n1_[0,1/n]`; `δ_a` with `S = {n·1}`; `μ = 0` | norm 1 but `∫_[0,1/n] fₙ = 1`: false / false; unbounded: false / false; true / true | holds | none |
| DPP of `C(K)` and `L¹` | `K = ∅`; `L¹` of counting measure | `C(∅) = 0`; `ℓ¹` is Schur and pinned to have DPP | holds; route checked | R04 |
| `banach_stone` | `C({1,2}) = 𝕜²` with `(a,b) ↦ (b,−a)`; `((a+b)/2, (a−b)/2)`; `K = ∅ ≠ L` | `φ` = swap, `h = (1,−1)`; `(1,0) ↦ (½,½)`, norm `½`, not isometric; no `T` exists | holds | none |
| `rademacherSecondMoment` | `n = 0`; `n = 1`; Hilbert `(y,y)` | `0/1 = 0`; `(‖y‖²+‖−y‖²)/2 = ‖y‖²`; `(4+0+0+4)‖y‖²/4 = 2‖y‖² = Σ‖yᵢ‖²` | holds | none |
| `HasCotype` | `c₀`, `e₁…eₙ`; `ℓ¹`; sides swapped | `n^(1/q) ≤ C·1` fails; `√n ≤ C·n` holds; swapping would give `c₀` cotype 2 | discriminates | none |
| type and cotype exclusion (§6.1) | `p = 4`, `C = 2^(1/4)`: pair `(y,y)` and `n = 16` | pair: `√2‖y‖ = √2‖y‖`; `n = 16`: `4‖y‖` against `2.378‖y‖`, which fails | holds as repaired | none |
| `cotype2_summing_bound` | `Y = ℝ`, `C = 1`; `n = 0`; `C < 1` | `π₂ = ‖u‖ = R₂` needs `K ≥ 1`; `t(1) = 2.05` since `E[g²1_{|g|>2.05}] = 0.2404 ≤ ¼`, so `K = 4.1`; `0 ≤ 0`; cotype fails for `Y ≠ 0` | holds | none |
| `summingENorm_one_le_of_lp_one` | `Tf = ∫f` on `L¹[0,1]`; `id` on `ℓ²ₙ` | `π₁ = ‖T‖ = 1 ≤ 16`; weak-1 norm `√n` against `Σ‖eᵢ‖ = n`, so the `L¹` domain matters | holds | none |
| `banachMazurDist_euclideanSpace_le_sqrt` | `n = 0`; `n = 1`; `ℓ₁ⁿ` | junk inf `0·0 = 0 ≤ 0`; `1 ≤ 1`; `d(ℓ₁ⁿ, ℓ₂ⁿ) = √n` attained | holds | R06 (ℂ locator) |
| `kadec_snobar` | `F = ⊥`; `dim F = 1` over `ℂ` | `‖0‖ = 0 ≤ 0`; `Px = φ(x)e`, `‖P‖ = 1 ≤ 1` by Hahn–Banach | holds | R06 |
| `dvoretzky_finite`, `dvoretzky` | `k = 0`; `k = 1`; `ε ≥ 1` | `T = 0`; `Tt = te`, `N = 1`; the lower bound is `≤ 0`, trivial | holds | none |
| §1.1 shifts | `⟨R_p e₀, e₁⟩`, `⟨e₀, L_q e₁⟩`, `⟨e₀, R_q e₁⟩` | `1 = 1`; `0`, so `(R_p)* ≠ R_q` | holds | none |
| §1.2 naturality and norming | `Tx = (xₙ/2ⁿ)` on `c₀`; `e₁*` at `e₂` in `ℓ²` | `T**1 = (2⁻ⁿ) ∈ J(c₀)`; `0` against `sup = 1` | holds | R06 |
| §3.1 perturbation | `xₙ = e₂ₙ`, `yₙ = e₂ₙ + 2^(−n−2)e₂ₙ₊₁`; summing basis | `θ = Σ2^(−n−2) = ½`, `‖U‖ = √(17/16) ≈ 1.03 ≤ 1.5`; `Σ(1/(n+1) + 1/(n+2)) = ∞` | holds | R06 |
| §3.2 Haar | level `j`; `P₂(t)`; `p = 3/2` | `‖h‖_p = 2^(−j/p)`; averages `¼, ¾`; `max(1.5, 3) − 1 = 2` | holds | none |
| §4.2 Schmidt series and nuclear norm | `id` on `ℓ²ₙ`; `diag(1/j²)`; `diag(1/j)` | `ν = n`, `‖·‖ = 1`; `π²/6 ≈ 1.645`; `Σ1/j = ∞`, not nuclear | holds | none |
| §4.4 Krawtchouk | `n = 3`; `n = 4`; integral route | `5, 1, 3` with bound 5; `14, 4, 6, 0` with bound 14; `256/(4π) ≈ 20.37 > 14` | holds | none |
| §4.5 parameters | `j = 1, 2`; contradiction | `n₂ = 2³² = 2⁸·2²⁴`; `2¹⁰²⁴ ≥ 2²⁸⁸`; `δm‖z‖/(192C) ≤ δ/(4m)` and `256/192 > 1` | holds | R08 |
| §5.1 `D_S` | `(2^(−n−1))` in `ℓ²(ℕ)`; uncountable `S` | `‖·‖² = 1/3`, infinite support; `‖eₛ − eₜ‖ = √2` | holds | R06 |
| §5.3 little Hölder and operators | `t^α`; `t^β` with `β > α`; `tⁿ`; `sin(nt)/n` | quotient `= 1`, not in `h^(0,α)`; `≤ |x−y|^(β−α) → 0`; `1/(n+1)` against `1`; ratio `n/(n+1) → 1` | holds | R06, R08 |
| §5.4 `M(K)` | `λ − δ_½` | `μ([0,1]) = 0`, `‖μ‖ = 2` | holds | none |
| §5.8 local Haar | `ℝ_d × ℝ`, `L = ℝ_d × {0}`; uncountable discrete group | `μ(L) = Σ2εₓ = ∞` so `‖1_L‖∞ = 1`, but compacts in `L` are finite, so `L` is locally null; local quotient is `ℓ∞(G)` | holds | none |
| §5.9 charges | `δ_a`; `1_A − 1_B`; the `ℓ∞/c₀` functional on `ℕ` | variation `|c|`; `2` against `sup|ν(E)| = 1`; `ν(ℕ) = 1 ≠ Σν({n}) = 0` | holds | R04, R06 |
| §7.1 identity | `E = 𝕜`; `f⊗x`; reflexive `E` | `|u| = |u|`; `‖f‖‖x‖` on both sides; `S = J⁻¹T` | holds; general case unsupported | R02 |
| §7.2 John | cube, `cᵢ = ½` at `±eᵢ`; `n = 1` | `Σcᵢeᵢ⊗eᵢ = I`, `Σcᵢ = n`, corners `√n`; `1 ≤ 1` | holds | none |
| §7.3 constants | Dvoretzky–Rogers at `j = 1`, `m`; `n = 4` | `½`, exponent `< 2` so `≥ ¼`; `log 2 = 0.693 ≥ 0.462 = (log 4)/3` | holds | R07 |

## Not verifiable

- **Uncertified sources, cited by locator only.** I looked in the sources cache and in `sources.toml`; these are settled as uncertified and have no readable text:
  - `megginson98` 2.9.3–2.9.4 (§2.1 James, sampled).
  - `albiackalton06` 6.1.3–6.1.7 (§3.2, sampled), §5.2, §5.4, 8.1.3, 12.3.13, 13.1.5, 13.1.7 and 13.3.2–13.3.7.
  - `ryan02` Chapter 4 (§4.2, sampled).
  - `enflo73` §§1–4 (§4.4, sampled).
  - `hewittross63` Theorem 12.18 (§5.8, sampled). Its content agrees with `bdlhv08` C.5.
  - `garlinggordon71`.
- **Pisier, *Factorization of Linear Operators and Geometry of Banach Spaces*, CBMS 60, §3** (§6.1). The manifest has no key for it, and I know of no legal open copy. I checked the absorption route mathematically instead: `G₂ ≤ tR₂ + G₂/2`, then `π₂ ≤ C·G₂` by Gaussian cotype and the ideal property.
- **Sampled subsections with no locator** (1.2, 3.1, 4.3, 5.1, 5.3, 5.4, 5.9, 7.1): there is nothing to check against a text (R06). The mathematics was checked directly in the table above.
- **Not sampled and not read against a text:** `aost05`, `dosz09`, `emmanuele93`, `runde02`.

## Source issues

- **Misprint** in garridojaramillo02 at the proof of Theorem 2, printed p. 356: the source says the evaluation functionals at `k_α` converge to the evaluation functionals at `k_α`; it should be `δ_{h(k_α)}` converging weak-star to `δ_{h(k)}`; affects nothing.
- **Misprint** in argyroshaydon11 at Lemma 2.4, printed p. 4: the case split is written in a variable `i` that does not occur in the statement; it should be the weight index `h` (cases `h < j₀` and `h ≥ j₀`); affects nothing.
