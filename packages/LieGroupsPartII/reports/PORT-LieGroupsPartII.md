# PORT-LieGroupsPartII

- **Branch:** `roadmap/lie-groups-part-ii`, from main at `51d880d`.
- **Head commit:** `aa066e23` ("LieGroupsPartII: roadmap (README, Suggested.lean, metadata)"). It touches only `TauCetiRoadmap/LieGroupsPartII/{README.md,Suggested.lean,metadata.toml}`.
- **Build** (`lake build TauCetiRoadmap.LieGroupsPartII.Suggested`, run on the committed head): `Build completed successfully (18254 jobs).` There are 13 warnings, all `declaration uses 'sorry'`, one for each of the 13 theorems, and no other warning or error.
- **Gate:** `gate LieGroupsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- **Dependency check** (`gate --depcheck … --movable`), run after the last edit: `depcheck: 239 roadmaps, 2251 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Citation resolver** (`roadmaps resolve` on `TauCetiRoadmap/LieGroupsPartII/README.md`): no unresolved cross-roadmap citation and no unresolved Lean name. The two leads in the worker's list, `LocallySymmetric.realPoints_lieGroup` and `LocallySymmetric.IsCartanInvolution.transposeInverse`, are ArithmeticLocallySymmetricSpaces' planned names. Its README on main names both (ALS.F.1 "The API" paragraph, line 599; ALS.0.1, line 1187). They are roadmap names, not pinned declarations, and the README cites them as ALS targets.

## Draft pull request body

Adds `LieGroupsPartII`, the second part of LieGroups. LieGroups Layer 9 stops at the Cartan, Iwasawa and `KAK` decompositions, the restricted root system and the restricted Weyl group `N_K(𝔞)/Z_K(𝔞)` of a real reductive group. This part continues the structure theory on the same carrier, LieGroups' `CartanInvolution` with its finite central matrix-cover model, for groups that need not be connected, semisimple, linear or of finite centre. It equips that datum with a compatible invariant form. It proves conjugacy of Cartan involutions and of Iwasawa triples with a common split centre, by an element of the identity component. It compares `W_G = N_K(𝔞)/Z_K(𝔞)` with the Weyl group of the restricted roots and characterizes their equality, the component condition. Without that condition it builds the minimal parabolic subgroup `P = MAN` with its Langlands decomposition, the Bruhat decomposition over `W_G` with its cell coordinates, the group `⁰L` and the split component of a datum whose components move its split centre, the dynamical description of a regular one-parameter subgroup, and the complexification criterion for parabolic subalgebras of a reductive Lie algebra with centre. Under the component condition every Iwasawa triple becomes a minimal parabolic datum, so RealSemisimpleLieGroups' Tits system and parabolic theory apply to it. The roadmap also proves one abstract fact about Tits systems that Tau Ceti lacks: an element conjugating a standard parabolic into another lies in the larger one, so conjugate standard parabolics are equal. The headline theorems are pinned in Lean on self-adjoint matrix groups: closed, transpose-stable subgroups of `GL_n(ℝ)` with finitely many components, which include the real points of connected reductive `ℝ`-groups. `O(1,1)` and `Aut(𝔰𝔩_3(ℝ))` mark where the component condition is needed and where it is not. Why it matters: the principal series of real reductive groups, rank-one geometry (Kleinian and Fuchsian groups) and homogeneous dynamics use `P`, its Langlands decomposition and the Bruhat decomposition on groups outside the connected semisimple finite-centre class that RealSemisimpleLieGroups covers.

## Roadmaps this one depends on that are still pull requests

- **RealSemisimpleLieGroups**, a new-roadmap pull request by another author. It is consumed for §§0.2, 1.2, 2.3, 3.1–3.3 and 4.1–4.4; each section was read at its head and makes the statement cited for it. It is not in the merge order.
- **Placement in the merge order.** RealSemisimpleLieGroups itself consumes AutomorphicFormsOnReductiveGroups §2.3a (its §§2.3 and 3.1, *Needs* lines). The merge order lists AutomorphicFormsOnReductiveGroups on the line right after this roadmap. So this roadmap cannot merge before AutomorphicFormsOnReductiveGroups and RealSemisimpleLieGroups have.
  - This README does not consume AutomorphicFormsOnReductiveGroups: no *Needs* line, supplier contract or dependency line names it. It names it only as the owner of `P = MAN` for the real points of connected reductive `ℝ`-groups (Scope, §3.2, Downstream consumers). The depcheck therefore reports nothing.
  - The worker should place this roadmap after both when it submits.

No citation uses an id that only an open revision defines. The ReductiveGroups revision keeps the Layer 7 and Layer 7C headings this README cites.

## What moved from the Lean file to the README

Nothing. The package's `Suggested.lean` already met the form rules, so it was kept apart from one docstring repair:
- It has one `import Mathlib` and one Tau Ceti module, `TauCeti.GroupTheory.TitsSystem.Parabolic.Basic`, which exists at the pin and is used.
- It contains 13 headline theorems and the 13 simple definitions they need, all with real bodies on native carriers. There is no sorry'd data, `set_option`, `example`, `#eval`, `lemma` or padding.
- **The docstring repair.** The module docstring gave two reasons the §6.3 complexification criterion cannot be stated at the pins. One was too strong: it said no Killing structure is attached at the pins, but Mathlib has `LieAlgebra.HasTrivialRadical.instIsKilling` (`Mathlib/Algebra/Lie/CartanCriterion.lean:257`). It now names what is missing:
  - there is no base change of a Lie subalgebra. Mathlib has `LieSubmodule.baseChange` (`Mathlib/Algebra/Lie/BaseChange.lean:185`) and `Submodule.baseChange` (`Mathlib/LinearAlgebra/TensorProduct/Tower.lean:827`), and the latter forgets the bracket;
  - `TauCeti.borelSubalgebra` (`TauCeti/Algebra/Lie/Weights/Borel.lean:439`) lives in a Lie algebra with `[LieAlgebra.IsKilling K L]`, a splitting Cartan subalgebra and a base;
  - matrices are not a Lie ring by instance search at the pins: `LieRing.ofAssociativeRing` is a local instance only (`Mathlib/Algebra/Lie/OfAssociative.lean:47, 63`).

  The decision itself, that §6.3 is not stated, is the package's, accepted in review, and is kept. A statement would need an ad hoc model of `[𝔤, 𝔤] ⊗ ℂ` as a Lie subalgebra of complex matrices with its Killing structure assumed.
- **Signature check.** I appended `#check @TauCetiRoadmap.LieGroupsPartII.<name>` for all 26 declarations to a scratch copy of the final file and elaborated it once: 13 `sorry` warnings, no error. Each elaborated type was compared with its README statement, and generality agrees.
  - The only section `variable` is `{n : ℕ}`, and every hypothesis is an explicit binder. No declaration lost a binder.
  - `dynamicLevi_decomposition` carries exactly "closed, transpose-stable, `X` symmetric", with normalization only for the factorization, as §7.2 says.
  - `isSelfAdjointLinearGroup_of_zeroLocus` puts connectedness on `Gℂ`, not on `G`, as §8.1 says.
  - Nothing changed in any statement.
- **Name clashes.** None of the 26 names occurs in another roadmap's Lean file, on main or at any open head (`roadmaps grep --lean-only`).

## Supplier replacements and duplication removals

- **Suppliers checked at the pins.** Every Tau Ceti and Mathlib declaration the README names was found at Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, the pins of this worktree's manifest. Among them:
  - `map_lieExp` (`Geometry/Lie/Functor.lean:315`), `lieMap_injective` (`Geometry/Lie/Faithfulness.lean:50`) and `conj_lieExp` (`Geometry/Lie/Adjoint/Exponential/Basic.lean:110`);
  - `TitsSystem` (`GroupTheory/TitsSystem/Basic.lean:50`) and `bruhatCell` (`Bruhat/Basic.lean:100`);
  - `standardParabolic`, `mem_standardParabolic_iff` and `standardParabolic_empty` (`Parabolic/Basic.lean:48, 152, 190`);
  - `bruhatCell_subset_standardParabolic_iff` and `standardParabolic_le_standardParabolic_iff` (`Parabolic/Classification.lean:130, 139`), and `normalizer_standardParabolic` (`Parabolic/Normalizer.lean:77`);
  - `existsUnique_mem_bruhatCell` (`Bruhat/Uniqueness.lean:111`), `bruhatCell_mul_eq_of_wordLength_le` and `_right` (`Bruhat/Length.lean:73, 231`), and `coxeterSystem` (`Coxeter.lean:178`);
  - `stabilizer_eq_closure_wallReflections` and `existsUnique_mem_orbit_inter_dominantChamber` (`LinearAlgebra/RootSystem/FundamentalDomain.lean:201, 247`);
  - `glTitsSystem` and `glTitsSystemWeylGroupMulEquivPerm` (`…/Diagonal/TitsSystem.lean:195, 270`), `iwasawaHomeomorph` and `existsUnique_iwasawa` (`…/Iwasawa.lean:224, 280`), `unitaryNormalizerPosDiagonalQuotientMulEquivPerm` (`…/RestrictedWeylGroup.lean:230`);
  - `unitriangularInversionGroup`, `mem_doubleCoset_permutationGL_iff` and `eq_and_eq_of_mul_permutationGL_mul_eq` (`…/UpperUnitriangular/BruhatCell.lean:100, 347, 382`), `GL2Borel.mem_doubleCoset_weyl_iff` (`…/Bruhat.lean:218`);
  - `Cocharacter.parabolic` and `Cocharacter.limit` (`Algebra/AlgebraicGroup/Dynamic/Parabolic.lean:154, 208`), `borelSubalgebra` (`Algebra/Lie/Weights/Borel.lean:439`);
  - `Lie.unitsLieAlgebraLieEquiv` (`Geometry/Lie/Adjoint/Units/Basic.lean:182`), `Lie.unitsLieAlgebraEquiv_Ad` (same file, `:160`), `Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff` (`Geometry/Lie/Subgroup/Units.lean:58`), `expUnit_coe` (`Geometry/Lie/Exponential/Units/Basic.lean:64`);
  - Mathlib's `Matrix.exp_transpose` and `Matrix.exp_conj` (`MatrixExponential.lean:113, 185`), `LinearMap.IsSymmetric.directSum_isInternal_of_pairwise_commute` (`JointEigenspace.lean:137`), `unitarySubgroup` (`Algebra/Star/Unitary.lean:273`, with `StarMul Rˣ` at `Algebra/Star/Basic.lean:466`), `Matrix.SpecialLinearGroup.range_toGL_eq_ker_det` (`GeneralLinearGroup/Defs.lean:394`), `Matrix.symplecticGroup` and `SymplecticGroup.transpose_mem` (`SymplecticGroup.lean:102, 164`), and `DoubleCoset.doubleCoset` (`GroupTheory/DoubleCoset.lean:37`).

  No restatement of a supplier was found, so none was deleted.
- **§6.1 is not at the pin.** `TauCeti/GroupTheory/TitsSystem/Parabolic/` has `normalizer_eq_of_subgroupB_le` (`Normalizer.lean:66`), `normalizer_standardParabolic` and `normalizer_subgroupB`, but nothing on conjugating `B` or `P_J` into `P_{J'}`.
- **Roadmap citations resolved.**
  - On main: LieGroups Layers 0–9, whose Layer 9 says what the contracts attribute to it, and whose names `CartanInvolution`, `IwasawaData`, `FiniteCartanMatrixModel`, `cartan_polar_decomposition`, `iwasawaDecomposition`, `kakDecomposition`, `IsIwasawaTriple`, `global_model`, `chamber_normalizer_cover`, `Nplus`, `isEmbeddedLieSubgroup_of_isClosed`, `isConj_of_isMaximalTorus` and `weylGroup` occur in its README or `Suggested.lean`. Also ArithmeticLocallySymmetricSpaces ALS.F.1, ALS.0.1 and ALS.0.2; FlagVarieties §§3.1, 3.2, 5.2; RootSystems "Exact supplier contracts"; AdelicAlgebraicGroups §2.1; ReductiveGroups Layers 7 and 7C; FuchsianOrbifolds Layer 3.
  - At open heads: RealSemisimpleLieGroups (sections above); AutomorphicFormsOnReductiveGroups §2.3a; AutomorphicSpectralTheoryPartII §1.5, which induces from `P = MAN`; KleinianGroups Layer 3.
- **Citation changes.**
  - ALS.0.3 was named in the scope bullet and the ArithmeticLocallySymmetricSpaces contract, but nothing in the README consumes it. §8.1 *Needs* and Dependencies list ALS.F.1, ALS.0.1 and ALS.0.2. The two places now name exactly those three, each with what it supplies.
  - The consumer citation "FuchsianOrbifoldsPartII" became FuchsianOrbifolds Layer 3 (parabolic fixed points and cusps), on main, and KleinianGroups now carries its section, Layer 3 (Bianchi groups, their parabolic elements and cusps). FuchsianOrbifoldsPartII is about Nielsen cores and does not treat parabolic elements.
- **Duplication sweep**, by object, over main and all 449 open heads (`roadmaps grep`), after the edits. Searched: conjugation into or equality of standard parabolics of a Tits system; self-adjoint linear or matrix groups; the component condition; `⁰G`/`⁰L`; `N_K(𝔞)/Z_K(𝔞)`; dynamic or dynamical parabolics; Knapp's axiom (v); reductive Cartan data.
  - The only real owners found are RealSemisimpleLieGroups, AutomorphicFormsOnReductiveGroups and LieGroups. The Scope section already names each, with the clause that separates it.
  - The other hits are unrelated: "component condition" in AdicSpacesPartIII, AlgebraicTopology and others; `H⁰L` in DerivedModuleAlgebra and the prismatic roadmaps; NoncompactQuantumSymmetry and BallQuotientsAndComplexHyperbolicLattices consume LieGroups Layer 9's `W` and do not own it.
  - ShimuraData, CompactGroupsPartII and the ReductiveGroups revision own none of `P = MAN`, the Bruhat decomposition over `W_G` or the self-adjoint model.
  - No removal was needed, so "Scope and ownership" lists no new deferral.
- **Ownership against open pull requests** was checked through `roadmaps grep` and `roadmaps show` over every open head. RealSemisimpleLieGroups and AutomorphicFormsOnReductiveGroups were read in full at their heads, although neither is among the 233 sibling checkouts. This roadmap owns the general-datum statements: P, Bruhat over `W_G` without the component condition, `⁰L` for moving split centres, §6.1 for arbitrary Tits systems, and the self-adjoint matrix model. No other roadmap states them at that generality.

## Fixes from the final read

1. **§8.1 Check, `𝐇 = 𝔾_m × SO(2)`.** It identified transpose-inverse on the real points `ℝ^× × S¹` with "the `c = 0` datum of §1.2", but §1.2's group is the connected `ℝ × S¹`. It now says that on the identity component `ℝ_{>0} × S¹ ≅ ℝ × S¹` (by `log`) it is the `c = 0` datum, and writes the tilts on the whole group as `(x, s) ↦ (x⁻¹, s − 2c·log|x|)`, with fixed group `{±1} × S¹`. Computed: this is a homomorphism because `log|xy| = log|x| + log|y|`; it is involutive because `s − 2c log|x| − 2c log|x⁻¹| = s`; with `t = log x` it restricts to `θ_c(t, s) = (−t, s − 2ct)`.
2. **Tau Ceti `TitsSystem` axiom.** The contract described the last axiom as `sBs ≠ B`; the pinned field `exists_conj_not_mem` (`TauCeti/GroupTheory/TitsSystem/Basic.lean:84`) is `rBr⁻¹ ⊄ B` for a representative `r`. It now quotes the field and adds why the two agree. If `sBs⁻¹ ⊆ B` and `s² ∈ B`, then `s⁻¹Bs = s⁻²(sBs⁻¹)s² ⊆ B`, so `sBs⁻¹ = B`; and `sBs = sBs⁻¹` because `Bs⁻² = B`.
3. **§6.1 Check on `GL_3(k)`.** It now states that `TauCeti.glTitsSystem` requires a field `k` with `kˣ` nontrivial, so `𝔽₂` is excluded.
4. **ArithmeticLocallySymmetricSpaces citations.** ALS.0.3 was cited but never consumed; the scope bullet and the contract now name exactly ALS.F.1, ALS.0.1 and ALS.0.2.
5. **Consumer citations** now name sections (above).
6. **`API:` labels.** The six bare `API:` field labels became prose ("Prove the following API."), and "Future roadmaps" became "Further consumers", which reads as timeless.
7. **Duplicated contract bullet.** The Mathlib contract had two bullets on `Matrix.orthogonalGroup`; they were merged into one, with its file and the `kᵀk = 1` convention.

No other passage was found wrong, vacuous or unsourced. The README and Lean texts were scanned for LaTeX delimiters, process words, pull-request numbers, machine paths and target-numbering tables, and none was found.

## Adversarial pass

Values were computed in this pass. "LCC" is the component condition. `J = ((0, −1), (1, 0))`, `S = Y = ((0, 1), (1, 0))`, `d = diag(1, −1)`, `τ = σ·Ad(w₀)` on `Aut(𝔰𝔩_3(ℝ))`.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Convention: root spaces | `GL_2`, `H = diag(h₁, h₂)` | `⁅H, E₁₂⁆ = (h₁ − h₂)E₁₂` | holds | none |
| Convention: Langlands order `m·a·n` | `SL_2`, `((a, b), (0, a⁻¹))` | `sgn(a)·diag(|a|, |a|⁻¹)·((1, b/a), (0, 1))` has entry `(1, 2) = sgn(a)·|a|·b/a = b` and entry `(2, 2) = sgn(a)/|a| = 1/a` | holds | none |
| Convention: dynamical sign vs `TauCeti.Cocharacter.parabolic` | `GL_2`, `X = diag(1, 0)`, `λ(t) = diag(t, 1)` | conjugates under `X`: `(a, e^{−t}b, e^{t}c, d)`; under `λ`: `(a, tb, t⁻¹c, d)`; `t = e^{−s}`; both bounded or extending iff `c = 0` | agree | none |
| Convention: `s_α(H) = H − α(H)H_α` | `SL_2`, `H = diag(h, −h)` | `α(H) = 2h`, `H_α = diag(1, −1)`, so `s_α(H) = −H` | holds | none |
| Convention: standard parabolic `Σ⁺ ∪ Σ_{Π'}` | `SL_3`, `Π' = {e₁ − e₂}` | adds `e₂ − e₁`; zero entries `(3, 1), (3, 2)`: `(2, 1)` blocks | holds | none |
| `IsSelfAdjointLinearGroup` | `GL_2`; `{diag(2^k, 2^{−k})}`; `{((1, t), (0, 1))}`; `n = 0` | 2 components, holds; `ℤ` components, `K = 1`, `𝔭 = 0`, polar image `{1} ≠ G`, so finiteness is needed; `E₁₂ᵀ = E₂₁ ∉ ℝE₁₂`, so the transpose field is needed; trivial group, holds | discriminates | none |
| `linearLieAlgebra` | `G = 1 ≤ GL_2`, `X = 2πJ`; `SL_n` | `exp X = 1`, but `exp(X/4) = J ∉ G`, so every real `t` is needed; `det exp(tE₁₁) = e^t ≠ 1` | discriminates | none |
| `IsMaximalAbelianSymmetric` | `GL_2`; `SL_2`; `𝔰𝔬(2)` | `ℝ·diag(1, −1)` misses `1`; `[diag(1, −1), S] = 2·((0, 1), (−1, 0)) ≠ 0`; the skew line fails symmetry | discriminates | none |
| `IsRegularElement` | `GL_2`; `SL_3`; `O(1,1)` | `diag(1, 0)` regular, `1` not (`E₁₂`); `diag(1, 0, −1)` regular; `diag(1, 1, −2)` commutes with `E₁₂`, and `E₁₂·diag(1, −1, 0) − diag(1, −1, 0)·E₁₂ = −2E₁₂ ≠ 0`; `Σ = ∅`, so `0` is regular | holds | none |
| `orthogonalCentralizer` (`M`) | `SL_2`, `R_φ` | `R_φ diag(1, −1) R_φᵀ = ((cos 2φ, sin 2φ), (sin 2φ, −cos 2φ))`; equal iff `cos 2φ = 1`, so `M = {±1}`; `φ = π/2` gives `−diag(1, −1)`, in `N_K` but not `M` | holds | none |
| `orthogonalNormalizer` | `GL_3`; `SL_2` | `2³·3! = 48` signed permutations, `48/8 = 6 = |S₃|`; `{±1, ±J}`; `R_{π/4}` sends `diag(1, −1)` to `S ∉ 𝔞` | holds | none |
| `dynamicParabolic`/`Unipotent`/`Levi` | `GL_2`, `X = diag(1, 0)`, `diag(0, 1)`, skew `X` | `(a, e^{−t}b, e^{t}c, d)`: upper / unitriangular / diagonal; reversed: lower; rotation conjugates have entries `≤ ‖g‖_op ≤ 2·max|g_ij|`, so the parabolic is `G`, the unipotent is `{1}`, the Levi is `{aI + bX}` | holds | none |
| `minimalParabolic` | `SL_2`, `±H₀`; `GL_2`, `𝔞 = 0`, `H₀ = 0` | `(−1)·diag(2, 1/2)·((1, −3/2), (0, 1)) = ((−2, 3), (0, −1/2))`; `−H₀` gives lower triangular; set `= O(2)`, missing the central `2·1` | maximality of `𝔞` needed | none |
| `LinearComponentCondition` | `GL_n`; `O(1,1)`; `O(p, q)`; `O(1,1)` with `𝔞 = 0` | `det diag(−1, 1, …) = −1`, holds; `M = {±1}` meets 2 of 4 components, fails; block determinants `(Πε·det k', Πε)`: 4 values for `p > q ≥ 1`, 2 for `p = q ≥ 1`; `M = K` meets all 4 | as stated; maximality needed for independence | none |
| `nonnegEigenspaces` | `Y = diag(1, 0)`; `𝔰𝔩_3`, `X = diag(1, 1, −2)` | `ad Y`: `1` on `E₁₂`, `−1` on `E₂₁`, `0` on the diagonal, giving the upper triangular matrices; eigenvalues `0, 0, 3, 3, −3, −3` on `E₁₂, E₂₁, E₁₃, E₂₃, E₃₁, E₃₂`, so `dim = 2 + 2 + 2 = 6` | holds | none |
| `positiveCharacterKernel` | `ℝ^×`; `GL_n`; `O(1,1)` | `χ = s·log|x|`, kernel `{±1}`; `{|det| = 1}`; `χ(exp tY) = χ(d·exp(tY)·d) = χ(exp(−tY))`, so `χ = 0` on `exp(ℝY)` and `⁰G = G` | holds | none |
| `conj_standardParabolic_le_iff` | `S = ∅`; rank one, `g ∈ BsB`; `J = ∅`, `J' = S`, `g = 1`; `GL_3(k)`, `J = {s₁}`, `J' = {s₂}` | `B = G`: both sides true; left false (`exists_conj_not_mem`), right false (`g ∉ B`); both true, while a reversed `J' ⊆ J` would be false; right false, left false (`P_{(1,2)}` acts irreducibly on `k³/⟨e₁⟩`, so it stabilizes no plane) | holds in both directions | Check 3 scoped to `kˣ ≠ 1` |
| `dynamicLevi_decomposition` | `GL_2`, `X = diag(1, 0)`; non-symmetric `X = ((1, 1), (0, 0))`; `OᵀSL_2(ℤ)O`; `SL_2` with `X = diag(1, 0)`; `n = 0` | `diag(2, 5)·((1, 3/2), (0, 1)) = ((2, 3), (0, 5))`, while the order `u·l` gives `((1, 3/5), (0, 1))`; `gX = Xg = ((2, 2), (0, 0))`, `θ(g) = ((1/2, 0), (−1/2, 1))`, `S⁻¹θ(g)S = ((0, 1), (−1/2, 3/2))`, so entry `(1, 2)` grows as `e^t`; `OgOᵀ = ((2, 3), (1, 2))` (computed: `¼((8, 12), (4, 8))`), `(OlOᵀ)₁₂ = √3·2√3/4 = 3/2 ∉ ℤ`; `diag(a, a⁻¹)·((1, b/a), (0, 1))`; trivial | holds; symmetry and normalization needed | none |
| `minimalParabolic_langlands` | `O(1,1)`; compact `SO(2)`; `n = 0` | `K = {±1, ±d}`, `P = {±exp tY}`, `K ∩ P = {±1} = M`, `G = P ⊔ dP = K·P`; `𝔞 = 0`, `P = M = K = G`; trivial | holds without LCC | none |
| `exists_conj_minimalParabolic` | `GL_2`, `𝔞' = ℝ1 ⊕ ℝS`; `SL_2`, `±H₀`; `O(1,1)` | `R_φSR_φᵀ = ((−sin 2φ, cos 2φ), (cos 2φ, sin 2φ))`, `tr(·diag(1, −1)) = −2 sin 2φ`, so `φ = −π/4` gives `diag(1, −1)`; `J·((a, b), (0, c))·J⁻¹ = ((c, 0), (−b, a))`; `K⁰ = 1`, and both give the same `P` | holds | none |
| `bruhat_decomposition_linear` | `SL_2`; `O(1,1)`; `Aut(𝔰𝔩_3(ℝ))` | `G = P ⊔ PJP`, `PJP = {g₂₁ ≠ 0}`; `G = P ⊔ dP`, `k⁻¹k' ∈ K ∩ P = {±1}`; 12 cells, 2 open (the coset `w₀·{1, τ}`) | holds without LCC | none |
| `doubleCoset_cell_coordinates` | `SL_2`, `k = J`, `c ≠ 0`; `k = 1` | `u = ((1, a/c), (0, 1))`, `p = ((c, d), (0, 1/c))`, `ukp = ((a, (ad − 1)/c), (c, d)) = g`; `N_1 = N ∩ N̄ = 1`; without the `N̄` clause, `g = u·(u⁻¹g)` for every `u ∈ N` | holds; clause needed | none |
| `dynamicParabolic_eq_iUnion_doubleCoset` | `O(1,1)`, `H₀ = Y`; `Aut(𝔰𝔩_3)`, `X₀ = ad diag(1, 0, −1)`; `GL_2`, `diag(2, 1)` | `exp(−tY)·d·exp(tY) = exp(−2tY)·d`, entries `±cosh 2t`, `±sinh 2t`, unbounded, so the union over `{±1}` is `P`; `−w₀X₀ = −diag(−1, 0, 1) = X₀`, union `P ⊔ τP`; commuting elements of `N_K` are `M`, union `P` | holds | none |
| `exists_eq_nonnegEigenspaces_of_le` | `GL_2`; `𝔰𝔩_3`, `X = diag(1, 1, −2)`, `Y = 2X`; `O(1,1)` | over-algebras of `𝔟` are `𝔟 = 𝔤 ∩ nn(diag(1, 0))` and `𝔤 = 𝔤 ∩ nn(0)`, `2 = 2^{n−1}`; same centralizer and same sum; `ad Y` kills `ℝY`, so `𝔮₀ = 𝔤` and both sides are trivial | holds in both directions | none |
| `linearComponentCondition_iff` | `O(1,1)`; `GL_2` | `d ∈ N_K` normalizes `N = 1`, `d ∉ M`; `d·exp(tY)·d = exp(−tY)`, so `dPd⁻¹ = P` with `d ∉ P`: both right sides fail with LCC; the signed permutations fixing `Σ⁺` are the diagonal signs `= M`: all hold | holds, both forms | none |
| `eq_dynamicParabolic_of_le` | `GL_2`; `SL_3`; `Aut(𝔰𝔩_3)` | over-groups of `B`: `B = Q(diag(1, 0))`, `G = Q(0)`, with centralizers (diagonal vs `𝔤`) and parabolics both differing; `diag(1, 1, −2)` vs `2·` itself: same; `Q(H₀) = P ⊔ τP ≠ P` without LCC | holds; LCC needed | none |
| `exists_titsSystem_linear` | `GL_n`; `ℝ^×`; `O(1,1)` | `TauCeti.glTitsSystem ℝ (n − 1)` for `n ≥ 1`; `Σ = ∅`, `B = N = G`, `simple = ∅`; `P` normal of index 2: `simple = {d̄}` fails `exists_conj_not_mem`, `simple = ∅` fails `closure_simple` | holds; LCC needed | none |
| `positiveCharacterKernel_mul_exp` | `GL_n`; diagonal ⋊ swap; `O(1,1)`; `ℝ^× × ℝ^×` | `g = (|det g|^{−1/n}g)·exp((log|det g|/n)·1)`, `n ≥ 1`; `diag(e³, e) = diag(e, e⁻¹)·exp(2·1)`, antidiagonal `(a, b)` lies in `⁰G` iff `ab = 1`; `F = 0`, `⁰G = G`; `diag(2, 1/2) = 1·exp(diag(log 2, −log 2))` | holds | none |
| `isSelfAdjointLinearGroup_of_zeroLocus` | `S = ∅`; `SO(1,1)`; `O(1,1)`; `SO(2,1)`; transpose closure | `GL_n`; `{a² − b² = 1} ≅ ℂ^×` via `a + b`, real points `±exp(tY)`, `M = {±1}` meets both; `O(2, ℂ)` has 2 components, excluded; `M = {diag(1, ε, ε)}` with `det = 1`, so `M = {1, diag(1, −1, −1)}`; `g ∈ G` gives `gᵀ ∈ Gℂ` real, so `gᵀ ∈ G` | holds; hypothesis on `Gℂ` | none |
| §1.1 datum and reductivity criterion | `GL_2`; `SU(2)`; `S¹`; `𝔟` | `B(diag(1, −1), diag(1, −1)) = 2`, `tr(J²) = −2`; `lieExp(πY) = −1 ∈ K`, polar collision; `lieExp(1) = 0`; `⁅E₁₂, diag(1, 0)⁆ = −E₁₂`, `ℝ1 ⊕ ℝE₁₂ ≠ 𝔟` | discriminates | none |
| §1.2 conjugacy | `ℝ × S¹`; `ℝ ⋊ ℤ/2`; `SL_2` | `θ_c² = id`, `𝔭_c = {(x, cx)}`; homomorphism check at `ε = ε' = 1`: `0 = a − a`; `(a/4, 0)` conjugates `(t, ε) ↦ (t + aε/2, ε)` and carries `θ_0` to `θ_a`; `c_aθc_a⁻¹ = c_{aaᵀ}∘θ`, so `θ' = c_{diag(4, 1/4)}∘θ` and the square root is `h` | holds | none |
| §2.1 subsystems and stabilizers | `BC₂`, `Π' = {e₂}`; `A₁`, `𝔰 = 𝔞` | `Σ ∩ span(e₂) = {±e₂, ±2e₂}`; `Stab(0) = W` vs pointwise stabilizer `{1}` | holds | none |
| §2.2 (a), (b), (e) | `GL_2`, `SL_2` | max of `−2 sin 2φ` at `φ = −π/4`; `⁅E₁₂, −E₂₁⁆ = −diag(1, −1)`, `|X|² = 1`, `ω² = 2·1·2 = 4`, `c = −π/2` gives `J`, `Ad J: diag(1, −1) ↦ −diag(1, −1)`; `c = −π/4` gives `R_{π/4}`, image `S ∉ 𝔞` | holds | none |
| §2.3 `IwasawaData` | `SL_2` with all of `Σ`; `GL_2` | `1 + 1 + 2 = 4 > 3`; `−1` lies in the chamber; `((0, 1), (−1, 0))·diag(0, 1)·((0, −1), (1, 0)) = diag(1, 0)` | Checks discriminate | none |
| §§2.4–2.5 Weyl groups and LCC | `O(1,1)`; `Aut(𝔰𝔩_3)`; `O(4)` | `W_G = ℤ/2`, `W(Σ) = 1`; `τ` acts by `−w₀`, `(e₁ − e₂)∘τ = e₂ − e₃`, `τ² = Ad(w₀)² = 1`, `|W_G| = 12`; reflection outer on `𝔰𝔬(4, ℂ)`, axiom (v) fails while LCC holds | holds | none |
| §3.1 centralizers | `GL_3`, `𝔰 = ℝ·diag(1, 1, −2)` | `L = GL_2 × GL_1`, 4 components, centre of dimension 2, derived algebra `𝔰𝔩_2` | holds | none |
| §3.3 (e), (f) | `GL_2`; `O(1,1)` | nilradical of `𝔟` is `ℝE₁₂ ⊕ ℝ1`, dimension 2; the `B`-orthogonal of `𝔟`, `Y = ((p, q), (r, s))` with `p = s = r = 0`, is `ℝE₁₂`; `N_G(P) = G ≠ P`, `Σ = ∅` | (f) needs LCC, as stated | none |
| §4.1 | `X = m + a + n ∈ 𝔭` | `dθX = m − a + dθn = −X`, so `2m + n + dθn = 0` and `m = n = 0` | holds | none |
| §4.2 cells | `SL_3`; `SU(2,1)` | `dim P = 0 + 2 + 3 = 5`, cells `5 … 8`; `dim 𝔪 = 8 − 1 − 6 = 1`, `dim P = 5`, `5 + 2 + 1 = 8` | holds | none |
| §5.1 `⁰L` | `ℝ² ⋊ C₂`; `ℝ ⋊ C₂` | `pr_F(3, 1) = (2, 2)`, residual `(1, −1)`; `ℓ(−t) = ℓ(t)` forces `ℓ = 0`, so `F = 0` | holds | none |
| §6.2 | `GL_2`, `X = diag(1, 0)`; `X₁ = diag(3, 1, −4)` | `I + e^{t}E₂₁` unbounded, `I + e^{−t}E₁₂ → I`; `−w₀X₁ = diag(4, −1, −3) ≠ X₁` | holds | none |
| §6.3 criterion | `GL_2`, trace-zero upper triangular `𝔮`; `O(1,1)` | Borel condition holds, `1 ∉ 𝔮`, `dim 𝔮 = 2 ∉ {3, 4}`; `[𝔤, 𝔤] = 0`, reduces to `𝔮 ⊇ 𝔷` | centre clause needed | none |
| §8.1 `𝔾_m × SO(2)` | real points `ℝ^× × S¹` | §1.2's group is the connected `ℝ × S¹`; tilt `(x, s) ↦ (x⁻¹, s − 2c·log|x|)`: homomorphism, involutive, fixed group `{±1} × S¹`, restricts to `θ_c` | was imprecise | fixed (fix 1) |
| Tau Ceti `TitsSystem` contract | `exists_conj_not_mem` | field is `rBr⁻¹ ⊄ B`; with `r² ∈ B`, `⊄` is equivalent to `≠` | was paraphrased | fixed (fix 2) |

## Unresolved

- **Merge-order placement.** RealSemisimpleLieGroups, a supplier, consumes AutomorphicFormsOnReductiveGroups §2.3a, which the merge order lists after this roadmap. See the dependency section above for what the worker needs to do.
- **Unread sources.** knapp2002, warner1972, wallach1988 and bourbaki-lie4-6 are uncertified in `packages/LieGroupsPartII/sources.toml` and were not read. Their locators are by chapter and section, and the statements that rest on them were checked mathematically, in the table above.
- **No suspicious text.** Nothing in the issues, reviews, roadmaps or sources read for this job gave an instruction.


Pull request: #2427 (roadmap/lie-groups-part-ii at aa066e2)
