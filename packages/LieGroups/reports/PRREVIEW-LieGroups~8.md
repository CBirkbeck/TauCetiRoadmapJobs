# Review of LieGroups (pull request #2642 at 244e782)
Folder: `TauCetiRoadmap/RepresentationTheory/LieGroups/`
**Verdict:** accepted

**Summary.** Accepted, with no findings: every Check, convention witness and Lean statement was recomputed and none is false, the file elaborates with `sorry` as its only warning, and the supplier order has no upward or cyclic edge. This head is the one the previous review read, so its six small corrections and its format note still stand; this review confirms each of them independently and adds one (§6.3 names no source). There are seven small corrections and one format note, none blocking. One of them corrects a repair the previous review offered: the uniqueness of the middle `KAK` factor must be stated modulo the normalizer of `𝔞` in `K`, not as equality in the chamber. The human reviewers are left the uncertified Bump, Bröcker–tom Dieck and Hall locators.

## C01 — `exists_holomorphic_extension` is its hypothesis `huniv` applied to `GL(V)`, so as a target it asks for nothing

As an acceptance test this declaration (`Suggested.lean` line 332; README §7.11, lines 1516–1518) only asks an implementer to apply its own hypothesis. `huniv` says that every continuous homomorphism of `G` into a complex Lie group factors through `ι` by a holomorphic one, and `(V →L[ℂ] V)ˣ` is such a group. With all universes equal, a copy of the statement without `CompactSpace G`, `ConnectedSpace G`, `T2Space G`, the boundaryless hypothesis and `hι` is closed by

`obtain ⟨ψ, ⟨hψ, hcomp⟩, -⟩ := huniv (V →L[ℂ] V) inferInstance inferInstance inferInstance (V →L[ℂ] V) inferInstance 𝓘(ℂ, V →L[ℂ] V) ((V →L[ℂ] V)ˣ) inferInstance inferInstance inferInstance inferInstance ρ hρ; exact ⟨ψ, hcomp, Units.contMDiff_val.comp hψ⟩`

and elaborates without a warning. With the file's distinct universes the only extra work is moving `GL(V)` into the universes `huniv` quantifies over (through `GL_n(ℂ)` and `ULift`).

Would either mark it as a sanity check of the universal property, or state in its place what compactness adds in §7.11 (for instance: every `ρc(Gc)`-invariant subspace of `V` has an invariant complement), or leave the extension half to `exists_complexification` and the README.

## C02 — The module docstring calls two results not statable at the pins, and both are statable

The docstring's list (`Suggested.lean` lines 42–48 and 53–55) includes the compact real form of a complex semisimple Lie algebra and the uniqueness of the middle `KAK` factor. Every carrier of both exists: the first needs only `[LieAlgebra.IsKilling ℂ L]`, an additive bracket-preserving conjugate-linear involution `τ` of `L`, and `0 < (−killingForm ℂ L x (τ x)).re` for `x ≠ 0`; the second needs only the file's own `IwasawaData` and `TauCeti.Lie.Ad`, already used together in the field `chamber_normalizer_cover`.

Neither is a headline of the overview, so keeping them in the README is the author's choice; the docstring would then say that, not that a carrier is missing. If the `KAK` uniqueness is stated, its conclusion has to be "`X' = Ad k X` for some `k ∈ D.K` with `Ad k 𝔞 ⊆ 𝔞`", as §9.5 says (modulo `N_K(𝔞)/Z_K(𝔞)`), and not `X = X'` for `X, X'` in the chamber: for the datum `ℝ ⋊ {±1}` that §9.2 admits (line 1886) there are no restricted roots, the chamber is all of `𝔞`, and `swap · exp X · swap = exp(−X)`.

## C03 — The field `chamber_normalizer_cover` of `IwasawaData` assumes a step that §9.5 sets as a target

The field (`Suggested.lean` lines 493–496) says that the normalizer of `𝔞` in `K` carries every element of `𝔞` into the chamber. §9.5 (lines 1993–1995) asks to prove exactly this ("every orbit meets this closed chamber"), and §9.4 (lines 1946–1950) describes the structure as carrying only "the closed positive chamber". Since `chamber_root_inequalities` and `chamber_subset` already determine the chamber, the field is a consequence of the other data for a genuine datum; with it, `kakDecomposition` does not test the chamber step, and whoever builds an `IwasawaData` to use `iwasawaDecomposition` must prove it first.

Would either drop the field, or say in §9.4 that the datum carries the covering and that §9.5 constructs it for every Cartan datum.

## C04 — Three Kirillov theorem numbers in Layers 0–2 point at statements other than the ones cited for

- §0.3 (line 229) cites Thm. 3.7 for the classification of one-parameter subgroups. Thm. 3.7 (kirillov2008 line 704) lists properties of `exp`; the bijection between `x ∈ 𝔤` and Lie-group morphisms `ℝ → G` is Prop. 3.1 (line 663, p. 21), for smooth morphisms. The continuous case is the pinned `existsUnique_eq_oneParameterSubgroup`.
- §1.2 (line 304) cites Thm. 3.7(5) for `d(Ad)_1 = ad`. Item (5) (line 711) is `g exp(y) g⁻¹ = exp(Ad g · y)`, the statement of §1.3; the derivative statement is Lemma 3.14(1) (line 826, p. 24).
- §2.2 (lines 422–424) attaches Thm. 2.8 to the sequence criterion. Thm. 2.8 (line 234) states that closed subgroups are Lie subgroups, with the proof left to another book; it has no sequence criterion.

Would read "Prop. 3.1" in §0.3, "Lemma 3.14(1)" in §1.2, and move the Thm. 2.8 locator to the first sentence of §2.2.

## C05 — Layer 9 does not cite the pinned matrix Iwasawa and `KAK` theorems that its examples describe

A reader of §9.4 ("For `GL_n(ℝ)` and `SL_n(ℝ)` this is Gram–Schmidt", line 1969) and of the Check of §9.5 (lines 2003–2006) cannot tell that these cases are proved. The pinned Tau Ceti has `Matrix.GeneralLinearGroup.existsUnique_iwasawa` and `TauCeti.iwasawaHomeomorph` (`LinearAlgebra/Matrix/GeneralLinearGroup/Iwasawa.lean`, lines 280 and 224), `Matrix.SpecialLinearGroup.existsUnique_iwasawa` (`SpecialLinearGroup/Iwasawa.lean`, line 213), the `KAK` theorem with a unique decreasing positive diagonal `Matrix.GeneralLinearGroup.existsUnique_pos_antitone_and_eq_unitary_mul_diagonal_mul_unitary` (`GeneralLinearGroup/Cartan.lean`, line 65) with its `SL_n` form (`SpecialLinearGroup/Cartan.lean`, line 49), and `TauCeti.unitaryNormalizerPosDiagonalQuotientMulEquivPerm` (`GeneralLinearGroup/RestrictedWeylGroup.lean`). The Layer 9 line of "Already in the library" (lines 2107–2110) lists only the polar decomposition.

Would add them to the Tau Ceti contracts and to that line, and point the two `GL_n` sentences at them. They are special cases, so no target changes.

## C06 — The downstream-consumers sentence says FormalConnectionsOpers uses the lower analytic dictionary of §7.9

Lines 2060–2061 say FormalConnectionsOpers §4.3 uses "Layer 7's complexification, compact real forms and lower analytic dictionary". On main, its LieGroups contract (its lines 431–438) takes from Layer 7 only the complexification of compact groups and the compact real form, and its §4.3 takes `G(ℂ)` from ReductiveGroups §3A.5e (its lines 91–93). Would read "Layer 7's complexification and compact real forms, in its §4.3".

## C07 — §6.3 names no source, and the description says every section does

The section that proves conjugacy, exhaustion and surjectivity of `lieExp` (lines 970–993) has no locator, while the three declarations it lists cite "Bröcker–tom Dieck, Ch. IV, §1" in their docstrings (`Suggested.lean` lines 200, 206). The description's sentence "Every section without a locator now names its source from the old reference list", with the exceptions §5.4, §2.1 and the library-supplied sections, does not hold for it. Would add the locator to §6.3; the description then needs no change.

## N01 — Varadarajan and Serre are listed under References and cited nowhere

Neither name occurs before the reference list (lines 2409–2413). Would cite them where they are used, or drop the two entries.

## Questions for the author

- §§8.4, 8.6 and 8.7 give "Bump, Parts I–III" for the equivariant GAGA comparison, the relative rank-one reflection shift with the Leray spectral sequence, and the Borel–Weil–Bott deduction. Does Bump's text contain these, or only Borel–Weil in degree zero? The book is recorded as uncertified, so this could not be checked; if it does not, a source for Bott's theorem by reflection shifts (Demazure's short proof, or Jantzen II.5) would serve.
- §7.9 and §7.2 give "Knapp, Chs. I, IV–VII" for statements about the complex points of an algebraic group and about realification of complex Lie groups. Knapp's Ch. VII, §1–2 were read and support §7.10; no passage for the algebraic-group dictionary of §7.9 was found there. Which section is meant?

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| §0.4 matrix and circle forms (sample) | `X = diag(1,0)`, `Y = E₁₂`; `X = [[0,−π],[π,0]]` | `exp(X+Y) = [[e,e−1],[0,1]]`, `exp X exp Y = [[e,e],[0,1]]`; `exp X = −1` | sound; Hall uncertified |
| §1.2 infinitesimal adjoint (sample) | `GL_n`: `d/ds exp(sX)Y exp(−sX)` | `XY − YX`; reversed conjugation `YX − XY`; Kirillov Lemma 3.14(1) line 826, not Thm. 3.7(5) | sound; locator C04 |
| §1.3 conjugation and exponential (sample) | `X = diag(1,0)`, `Y = E₁₂` | `Ad(exp X)Y = eE₁₂ = exp(ad X)Y`; `exp(−ad X)` gives `e⁻¹`; Kirillov Thm. 3.7(5), Lemma 3.14(2) | sound |
| §1.4 `mfderiv_lieExp_eq_integral` | same `X, Y`; `GL₁`; `ad X = 0` | both `(1−e⁻¹)E₁₂`; `+s` sign or right translation `(e−1)E₁₂`; factor 1 | sound |
| §2.1 `mem_lieSubalgebraOfSubgroup_iff` | `ℚ ⊂ ℝ`; `SL₂(ℤ)`; `K = ⊥`; route | `𝔨 = 0`; `exp E₁₂ ∈ K`, `exp(E₁₂/2) ∉ K`; patch tangent `= L_*V` by `Ad(K₀)`-invariance | sound; neeb2015 lines 1924, 3337 |
| §2.2 closed-subgroup theorem (sample) | `ℚ`, `tₙ = 1/n`, `Xₙ = 1`; `diag(eᵗ,e²ᵗ)` | right side holds, `1 ∉ 𝔨 = 0`; `Lie(K) = ℝ·diag(1,2)`; Thm. 2.8 line 234 | sound; locator C04 |
| §2.4 `simplyConnectedSpace_SU2` (sample) | `[[a,−b̄],[b,ā]]`; pin | `det = |a|²+|b|²`; `S³ ⊂ ℂ²`, rank 4 > 2; no `SU(2)` statement at the pin | sound; Hall uncertified |
| §3.2 injectivity (sample) | `ℤ/2ℤ`: identity vs trivial | both differentials 0, maps differ; Thm. 3.17 line 855, Cor. 2.9(1) line 244 | sound |
| §3.3 BCH | Heisenberg `E₁₂, E₂₃` | `exp X exp Y = 1+E₁₂+E₂₃+E₁₃ = exp(X+Y+½E₁₃)`; `−½` gives (1,3) entry 0 | sound |
| §4.1 `exists_immersedLieSubgroup_lieSubalgebra` (sample) | `𝔥 = 0`, `𝔤`; `ℝ(1,√2)`; `ℚ`; discrete `G` | `⊥`; `G⁰`; dense line; countable ⇒ point; `G⁰` second countable | sound; Thms. 3.43, 3.46 lines 1137, 1178 |
| §4.2 `exists_simplyConnected_lieGroup` | `L = 0`, `ℝ`, `𝔰𝔩₂(ℝ)` | point; `ℝ` not Circle; universal cover, `π₁(SL₂ℝ) = ℤ`; Thm. 3.48 line 1214 | sound |
| §4.3 `exists_monoidHom_of_lieHom` | `ℝ → Circle`; `Circle → Circle` | every `c`; only `c ∈ ℤ`; Thm. 3.38 line 1113, Cor. 3.50 line 1233 | sound |
| §5.2 centres (sample) | `SU(2)`; Heisenberg; `Q₈`; `𝔰𝔩₂(ℝ)` | `ker Ad = {±1}`; `H/Z ≅ ℝ²`; `ker Ad = Q₈ ≠ {±1}`; `SL₂ = U/2ℤ`; Thm. 3.32 line 1029, Cor. 3.49 line 1223 | sound |
| §5.3 `lieExp_surjective_of_isNilpotent` | Heisenberg; `ℝ/ℤ`; `SL₂(ℝ)` | (1,3) entry `c + ab/2`; onto, not injective; `diag(−2,−½)` missed; pin has the commutative case only | sound |
| §5A.1 metric | `SU(2)`, `λ = (1,2,3)` | `[e₁,e₂] = −2e₃`, `[e₁,e₃] = 2e₂`; `−6` vs `4`; average `2`; `κ(e₁,e₁) = −8` | sound |
| §6.3 conjugacy and exhaustion (sample) | curve derivative; parity; `O(2)`; `U(n)` | `Ad_g((Ad_{t⁻¹}−1)X + Y)`; real blocks `(−2)^{even}`, pairs `|λ⁻¹−1|² > 0`; reflections in no torus | sound; no locator (C07) |
| §6.4, §6.7 normalizer, centralizer | `n = cg`; `SO(3)`, `u = diag(1,−1,−1)` | `n t n⁻¹ = c u c⁻¹ = u`; `C(u) = S(O(1)×O(2)) ≅ O(2)`; `c g c⁻¹ = g ∈ T` | sound |
| §6.5 compact roots (sample), §6.6 | `SU(2)`, `α∨ = diag(i,−i)`; `ν(e^w) = exp(−iwα∨)` | `χ_α = z²`, `α(α∨) = 2`; `dν(1) = −iα∨`, `iα(−iα∨) = 2` | sound; source uncertified |
| §6.9 Weyl integration, pushforward | `SU(2)`; `G = T`; `f = 1`; `f = 1/sin²θ` | `2−2cos 2θ = 4sin²θ`, mean `2 = |W|`; `D = 1`; mass 1; `∫_G f = 2` | sound |
| §7.1 compact form | `𝔰𝔩₂`: `τ`, `H_τ`; `σ` entrywise | `H_τ(e,e) = 4`, `H_τ(h,h) = 8`; `ad(e)† = ad(f)`; `στ = −Xᵀ`; knapp2002 Thm. 6.16 line 14985 | sound |
| §7.3 `exists_connected_complexification` | `ℝ`; Circle; cover of `SL₂(ℝ)`; universes | `ℂ`; `ℂˣ`; `SL₂(ℂ)`, kernel `ℤ`; model types exist in each universe by `ULift`; heins2025 line 413 | sound |
| §7.5 faithful representations (sample) | Circle; `SO(3)` | `P = U(1)·ℝ_{>0} = ℂˣ`; `SO₃(ℂ)`, `π₁ = ℤ/2` both | sound; Bump uncertified |
| §7.6 `exists_complexification` | `U(1) ⊂ SL₂(ℂ)`; `Sp(n)` | weight-one character does not extend; `X̄J + JX̄ᵀ = 0` from `XᵀJ + JX = 0` | sound |
| §7.8 real forms | `ℂ/(ℤ + (√2+i)ℤ)`, `ℝ/ℤ` | `ℝ ∩ Λ = ℤ`; `√2 − i ∈ Λ` forces `b = −1`, `a = 2√2 ∉ ℤ` | sound |
| §7.10 compact forms of reductive groups (sample) | `σ = ττ'`; `ℂ/(ℤ+iℤ)`; `SL₂(ℂ)` | `H_τ(σx,x) = H_{τ'}(x,x) > 0`; `σ^{−1/2}τσ^{1/2} = σ⁻¹τ = τ'`; kernel `≅ ℤ`; Cor. 6.20 line 15047 | sound |
| §7.11 `exists_holomorphic_extension` (sample) | equal universes, hypotheses removed | closed by `huniv` at `GL(V)`; compactness unused | true; padding (C01) |
| §7.12 pairs | conjugation by `diag(2,½)` | `[[0,−1],[1,0]] ↦ [[0,−4],[¼,0]]`, not unitary | sound |
| §8.1 flag manifold (sample), §8.2 | `SL₂`; `GL_n`; `GL₂(𝔽₃)×C₂` | `ℙ¹ = S²`; dimension `n(n−1)/2`; `|T| = 4`, `|B∩N| = 8`, `|N/T| = 4`, 2 double cosets | sound; Bump, Humphreys uncertified |
| §8.3, §8.5 line conventions | `SL₂`, `(g,z) ↦ z·g e₁`; `φ(gB⁺) = g n₀B⁻`; `GL₃`, `λ = (1,0,0)` | `E₁ = O(−1)`; `φ*E⁻_κ = E_{w₀κ}`; SchubertGeometry S3.1 fibre character `λ`; `−w₀λ = (0,0,−1)` | sound |
| §8.6 reflection shift (sample), §8.7 | `μ = 0`; `m = −1`; `μ = −3` | `s_α·0 = −2`, `H⁰(O) ≅ H¹(O(−2))`; none; `s_α(μ+ρ) − ρ = 1`, `dim H¹(O(−3)) = 2` | sound; Bump uncertified |
| §9.2 `cartan_polar_decomposition` | `GL₁`; `S¹` with identity, with inversion; finite-component `H`; motion group | `±eᵗ`; `K = S¹`, `𝔭 = 0`; no model (symmetric compact ⇒ involutions); `p^{1/2} = exp(Y/2N)`; `n = 1` datum exists | sound; knapp2002 Prop. 7.14 line 18482 |
| §9.3 triangular exponential | `m = 0, 1, 2`; `diag(−1,1)` | `[[eᵃ, x(eᵃ−eᵇ)/(a−b)],[0,eᵇ]]`; at `(1,0,1)`: `[[e,e−1],[0,1]]`; not reached | sound |
| §9.4 `iwasawaDecomposition` | `SL₂(ℝ)`: `N₊`, `N⁻`; `2^ℤ ⊂ ℝ_{>0}`; compact `G` | both admissible; fails `N_connected`; `𝔞 = 0`, `N = 1`; `B_𝔰(X_λ,X_{−λ}) = λ(H)⁻¹B_𝔰(H,[X_λ,X_{−λ}]) = 0` | sound; Thm. 6.46 line 15739 |
| §9.5 `kakDecomposition` | `GL_n`; `ℝ ⋊ {±1}` | SVD with `a₁ ≥ … ≥ aₙ`; no roots, chamber `= 𝔞`, `swap·exp X·swap = exp(−X)` | sound; uniqueness only mod `N_K(𝔞)` (C02); Thm. 7.39 line 19084 |

- **Previous review** (same head): its C01–C06 and N01 are not repaired, the head being unchanged; each was checked again here and is carried as C01–C06 and N01. Its suggested equality form of `KAK` uniqueness is withdrawn in C02.
- **Source locators** read against the text (25): kirillov2008 Thms. 2.5, 2.8, 2.25, 3.7, 3.17, 3.32, 3.34, 3.38, 3.43, 3.46, 3.48, Prop. 3.1, Lemma 3.14, Cors. 2.9, 3.49, 3.50 and contents (lines 13–45); neeb2015 Rem. II.6.5, Problem IV.1; heins2025 Prop. 2.1; knapp2002 contents (lines 125–150), Thms. 6.16, 6.31, 6.46, 7.39, Cor. 6.20, Props. 7.5, 7.14.
- **Library declarations opened at the pins** (16): `IsTorus`, `IsMaximalTorus` (`Geometry/Lie/Subgroup/Torus.lean` 82, 88), `weylDensity` (`Weyl/Density.lean` 64), `lieSubalgebraOfSubgroup` (`Subgroup/LieAlgebra.lean` 277), `ImmersedLieSubgroupData` (`Immersed/Basic.lean` 59), `mem_centralizer_iff_forall_Ad_apply_eq_self` (`Subgroup/Commutative.lean` 110), `existsUnique_eq_oneParameterSubgroup` (`Exponential/Classification.lean` 338), `lieMap_injective` (`Faithfulness.lean` 50), `simplyConnectedSpace_sphere` (`AlgebraicTopology/Sphere/SimplyConnected.lean` 389), the commutative `lieExp` surjectivity (`Exponential/CommutativeGroup/Basic.lean` 175), the five matrix theorems of C05, Mathlib `Matrix.BlockTriangular.exp` (`Analysis/Normed/Algebra/MatrixExponential.lean` 101). A scripted pass over the README's 365 identifier code spans found each at the pins except this file's own declarations, its field names and notation.
- **Cross-roadmap citations resolved on main** (38 sections of 17 roadmaps): ReductiveGroups 3A.5e (line 2014) and Layers 0–4, 6, 7, 7C, 10; SchemeAndStackFoundations 1.15, 1.16, 2.2, 2.6; ComplexComparisonPartII C-1.1, C0.1, C0.3–C0.5, C1.9; DifferentialGeometry 2.3, 3.2, 3.3, 4.3, 4.4, 10.2–10.5; SmoothBundlesConnections B1.1, B1.4; CompactGroups 0.1, 0.2, 1.2, 5.2, 6.2, E.1–E.4; LieHighestWeight 7.1; AdoIwasawa Layers 5, 9; ComplexManifolds Milestone 1; ComplexKahlerGeometry Layer 1, 5.10, 6.1; HopfRinow Layer 3; RiemannianGeometry R4.5; CotangentLagrangian C2.0, C2.1; SchubertGeometry S3.1, S9.8, S2, S7; HamiltonianReduction R2; ConvexityToric T1; FormalConnectionsOpers 4.3.
- **Dependency check:** `depcheck: 199 roadmaps, 2201 edges, 0 problem(s)`; no UPWARD or CYCLE line. Every supplier is on main. The change touches only the two files of the folder.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with 22 `sorry` warnings and nothing else. The one-tactic probe (`first | rfl | simp | infer_instance | assumption | trivial`) closes none of the 22 theorems. The `#check` types were compared with the README: three binders are absent (`T2Space` on `FiniteCartanMatrixModel`; `FiniteDimensional` on `CartanInvolution` and `IsRealReductive`), no field uses them, and each theorem about these structures carries them.
- **Headlines:** Lie's third theorem, integration of homomorphisms, subalgebra–subgroup correspondence, torus conjugacy, exhaustion, surjectivity of `lieExp`, Weyl integration, connected and compact complexification, Cartan, Iwasawa and `KAK` are stated; Borel–Weil, the global BCH series and the Weyl-group comparison are named in the docstring with the missing carrier.
- **Duplication by object:** no theorem of `Suggested.lean` is proved at the pin; the pinned commutative exponential surjectivity and the matrix decompositions are special cases (C05).
- **Description:** its counts and lists agree with the head (116 Checks; the nine removed declarations are all named; no supplier still open), except the sentence quoted in C07.

Overlap check: read LieGroupsPartII, RealSemisimpleLieGroups, ReductiveGroups, LieGroupoidsPoisson and AdoIwasawa on main and CompactGroupsPartII at its open head. Shared objects and owners: the complex Lie group `G(ℂ)` is ReductiveGroups §3A.5e's, cited here; `CartanInvolution`, `IwasawaData`, the restricted roots and the decompositions of Layer 9 are this roadmap's, cited by LieGroupsPartII and RealSemisimpleLieGroups; the compact structure theory of Layers 5A–7 is this roadmap's, cited by CompactGroupsPartII; Ado's theorem is AdoIwasawa's, cited here. Nothing else is shared.

Source independence: 27 passages compared with 4 sources (kirillov2008, neeb2015, knapp2002, heins2025), none shared beyond forced terms (longest common run 4 words, "smallest closed complex subgroup", heins2025 line 424, and "is an integral subgroup", neeb2015 line 3340); largest share kirillov2008, 14 of about 58 locators; contents compared with kirillov2008 and knapp2002: independent (Layers 0–4 draw on Kirillov §§2.1, 3.1, 3.3, 3.6–3.8 out of order, with §§1.4, 2.1, 2.3–2.4, 5.3 added; the Cartan → Iwasawa → `KAK` order is forced by the Needs lines of §§9.4–9.5). Bump, Bröcker–tom Dieck and Hall could not be read.

Research link: §7.3's period-quotient complexification is the realization Heins (2025, Prop. 2.1) uses for entire functions on Lie groups; §2.1 is the finite-dimensional case of Neeb's Problem IV.1 (2006); Layer 9 is Knapp's (2002) Cartan, Iwasawa and `KAK` theory, consumed by RealSemisimpleLieGroups and LieGroupsPartII. Rests on the README, heins2025, neeb2015, knapp2002.

## Not verifiable

- Sampled targets 0.4, 1.3 and 2.4 (Hall), 6.5 (Bröcker–tom Dieck), 7.5, 7.11, 8.1 and 8.6 (Bump): the cited books are settled as uncertified, so the locators were not read; the mathematics of each section was recomputed (table above), and 1.3 is supported by kirillov2008 Thm. 3.7(5) and Lemma 3.14(2).
- Humphreys §29.1, Lee Thm. 9.12 and Hall Thm. 5.4: uncertified, not read.
- LieGroupsPartII, RealSemisimpleLieGroups, LieGroupoidsPoisson and AdoIwasawa were read on main; no checkout of an open head of these was available, so ownership against those open heads was not checked.
- The two statements C02 calls statable were decided by reading the carriers at the pins, not by elaborating them.

## Source issues

- **Misprint** in neeb2015 at Remark II.6.5(b), p. 39 (line 1925): the source says Yamabe's theorem describes the arc-component of the ambient group `G`; it should be the arc-component of the subgroup `H`, as Problem IV.1 uses it; affects nothing.
- **Misprint** in kirillov2008 at Theorem 3.32, proof, p. 29 (lines 1032–1033): the source says `g` commutes with the one-parameter subgroup of `x` iff `Ad g.x = 0`; it should be `Ad g.x = x`; affects nothing.

## For the human reviewers

- Not tested: wording and arrangement were not compared with Bump (12 of about 58 locators), Bröcker–tom Dieck (9) or Hall (6), all recorded as uncertified; kirillov2008 (largest share) and knapp2002 were read.
- Scope: Layers 6–8 cite Bump and Bröcker–tom Dieck only at the level of parts and chapters (for example README lines 1361, 1716, 1764); whether part-level locators suffice for uncertified books is yours to decide.
