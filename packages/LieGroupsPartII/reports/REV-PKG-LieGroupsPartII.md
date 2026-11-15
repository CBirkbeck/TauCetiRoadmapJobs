<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17225#issuecomment-6900748215 -->
Review (claude) of 1caea46

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) Ownership of `P = MAN` runs against the roadmap's own supply chain

   **Location.** `packages/LieGroupsPartII/README.md` line 42: "Layer 3 owns the minimal parabolic subgroup `P = MAN` … RealSemisimpleLieGroups §3.1 states the same objects … Layer 3 does not use it and contains it as the connected, semisimple, finite-centre case." Also lines 113, 118 and 613.

   **Claim.** Layer 3 is the single owner of `P = MAN`; the classes of AutomorphicFormsOnReductiveGroups §2.3a and RealSemisimpleLieGroups §3.1 are special cases of it; RealSemisimpleLieGroups §3.1 is consumed only as a definition.

   **Witness.** RealSemisimpleLieGroups (open pull request 2229, head 9a938c5), `README.md` line 807: "AutomorphicFormsOnReductiveGroups §2.3a owns `M = Z_K(𝔞)`, `A`, `N`, the minimal parabolic subgroup `P = MAN` … this roadmap consumes it", and its §3.1 `*Needs:*` (line 839) and §2.3 `*Needs:*` (line 673) list AutomorphicFormsOnReductiveGroups §2.3a. This README consumes RealSemisimpleLieGroups §3.1 as a theorem in §6.3 (line 613, "its §3.1 supplies the minimal parabolic datum", and the `*Needs:*` of line 615) and its §2.3 real-points clause in §8.1. So AutomorphicFormsOnReductiveGroups §2.3a is upstream of this roadmap through RealSemisimpleLieGroups, although `merge-order/ORDER.txt` lists LieGroupsPartII (line 62) before it (line 63). One object then has three owners (this Layer 3, AutomorphicFormsOnReductiveGroups §2.3a at its line 373, RealSemisimpleLieGroups §3.1), the earliest of which is not the one this README names; were AutomorphicFormsOnReductiveGroups to cite Layer 3 as this paragraph invites, the three roadmaps would form a cycle. Line 118 ("§3.1: the definition of a minimal parabolic datum") and line 113 ("Only statements about a single such datum are consumed") also contradict line 613.

   **Repair.**

   1. Replace the first three sentences of the paragraph at line 42 by: "AutomorphicFormsOnReductiveGroups §2.3a owns `M`, `A`, `N`, the minimal parabolic subgroup `P = MAN` and its Langlands decomposition for the real points of connected reductive `ℝ`-groups, and RealSemisimpleLieGroups §3.1, built on it, owns them for connected groups with semisimple Lie algebra and finite centre. Layer 3 states the same facts for every reductive Cartan datum: finite central covers, Lie algebras with centre, disconnected groups and closed transpose-stable groups that are not real points of an algebraic group, without the component condition unless stated. On the two classes above its statements are theirs (Layer 8 for the first); its proofs work on the datum and use neither." Keep the last sentence of the paragraph. Adjust the sentence of §3.2 (line 384) and the Summary clause "and so supplies the minimal parabolic datum" accordingly; they already name both roadmaps.
   2. In §6.3 (line 613) replace "so that its §3.1 supplies the minimal parabolic datum" by "so that §3.5 here supplies its minimal parabolic datum (a connected group satisfies the component condition, §2.5)"; in the `*Needs:*` of line 615 replace "RealSemisimpleLieGroups §§0.2, 1.2, 3.1, 4.1, 4.4" by "RealSemisimpleLieGroups §§0.2, 1.2, 4.1, 4.4" and add "§§2.5, 3.5"; drop "3.1" from the RealSemisimpleLieGroups item of the Layer 6 `### Dependencies`. Then lines 113 and 118 are true as written.

   Tested on the refuting instance: with (1) no roadmap is asked to cite a later one (AutomorphicFormsOnReductiveGroups → RealSemisimpleLieGroups → LieGroupsPartII is one direction); with (2), for `Int(𝔰𝔩_2(ℝ)) = PSL_2(ℝ)`, connected, §3.5 gives the datum with `P` the image of the upper triangular group, and §6.3 no longer needs the theorem of RealSemisimpleLieGroups §3.1. For the worker: at submission the roadmap has to sit after RealSemisimpleLieGroups, hence after AutomorphicFormsOnReductiveGroups; the dependency check cannot see this because RealSemisimpleLieGroups is not in the order file.

2. **F02** (P2) The cell coordinates of the Bruhat headline are statable and absent

   **Location.** `packages/LieGroupsPartII/README.md` line 3: "proves the Bruhat decomposition `G = ⨆_{w ∈ W_G} P n_w P` with its cell coordinates for every Iwasawa triple"; line 15; §4.2 second bullet (line 486). `packages/LieGroupsPartII/Suggested.lean` line 237.

   **Claim.** The module docstring lists the Bruhat decomposition over `N_K(𝔞)/Z_K(𝔞)` as stated.

   **Witness.** `bruhat_decomposition_linear` states coverage and disjointness only. The coordinates `N_w × P → P n_w P`, `N_w = N ∩ n_w N̄ n_w⁻¹`, need no new carrier: `N̄ = dynamicUnipotent G (−H₀)`. The docstring does not name them as not statable.

   **Repair.** Add to `Suggested.lean`, after `bruhat_decomposition_linear` (inside `section Linear`), and a matching bullet in README §7.3 after the `bruhat_decomposition_linear` bullet ("`doubleCoset_cell_coordinates`: for `k ∈ N_K(𝔞)`, every element of `P k P` is `u·k·p` for unique `u ∈ N` with `k⁻¹uk ∈ dynamicUnipotent G (−H₀)` and `p ∈ P` (§4.2, cell coordinates)"); add it to the docstring list:

   ```lean
   /-- **§7.3. Cell coordinates.** With no component condition: for `k ∈ N_K(𝔞)`, every element of the
   double coset `P k P` is `u·k·p` for a unique `u ∈ N ∩ k N̄ k⁻¹` and a unique `p ∈ P`, where
   `N̄ = dynamicUnipotent G (−H₀)` (Knapp 2002, Ch. VII §4). -/
   theorem doubleCoset_cell_coordinates (G : Subgroup (GL (Fin n) ℝ))
       (hG : IsSelfAdjointLinearGroup G) (𝔞 : Submodule ℝ (Matrix (Fin n) (Fin n) ℝ))
       (h𝔞 : IsMaximalAbelianSymmetric G 𝔞) (H₀ : Matrix (Fin n) (Fin n) ℝ)
       (hH₀ : IsRegularElement G 𝔞 H₀) :
       ∀ k ∈ orthogonalNormalizer G 𝔞,
         ∀ g ∈ DoubleCoset.doubleCoset k (minimalParabolic G 𝔞 H₀) (minimalParabolic G 𝔞 H₀),
           ∃! x : GL (Fin n) ℝ × GL (Fin n) ℝ,
             x.1 ∈ dynamicUnipotent G H₀ ∧ k⁻¹ * x.1 * k ∈ dynamicUnipotent G (-H₀) ∧
             x.2 ∈ minimalParabolic G 𝔞 H₀ ∧ g = x.1 * k * x.2 := by
     sorry
   ```

   Tested: this elaborates on a scratch copy at the pins (`sorry` the only warning). Values: `SL_2(ℝ)`, `k = ((0, −1), (1, 0))`: `kN̄k⁻¹ = N`, so `u` ranges over `N` and `{g : g₂₁ ≠ 0} = N·k·P`, dimension `1 + 2 = 3`; `k = 1`: `N ∩ N̄ = 1`, `u = 1`, `p = g`; `O(1,1)`: `N = 1`, `g = k·p`. Uniqueness in general: `u k p = u' k p'` gives `k⁻¹u'⁻¹uk ∈ N̄ ∩ P = 1`.

3. **F03** (P3) Borel–Tits Théorème 4.15 is cited for a boundedness description it does not contain

   **Location.** `packages/LieGroupsPartII/README.md` line 591: "The boundedness description is the Lie-group form of Borel–Tits 1965, Théorème 4.15 (pp. 90–91), and of `TauCeti.Cocharacter.parabolic`".

   **Witness.** borel-tits1965 lines 1488–1497 (printed pp. 90–91): 4.15 describes parabolic `k`-subgroups by an order on the roots of a split torus, with Levi subgroup the centralizer of the torus; no limit or boundedness appears.

   **Repair.** Replace the sentence by: "Under the component condition `Q(X) = Z_G(X)·N(X)`, with `N(X)` the exponential of the root spaces positive on `X` (part (ii)); this is the Lie-group counterpart of the description of parabolic subgroups by an order on the roots of a split torus in Borel–Tits 1965, Théorème 4.15 (pp. 90–91). The boundedness formulation is that of `TauCeti.Cocharacter.parabolic` (Knapp 2002, Ch. VII §7)." Change the manifest's `cited_for` of that entry only if the section label changes (it does not).

4. **F04** (P3) §3.5 has no source locator

   **Location.** `packages/LieGroupsPartII/README.md` lines 439–446 (§3.5): two "Prove" bullets, no citation; `sources.toml` line 63 lists `knapp2002` as cited for "3.5".

   **Repair.** End the paragraph after the two bullets with "(Knapp 2002, Ch. VI §§4–5 and Ch. VII §§2, 7, for the facts collected; the restriction to `G⁰` uses only §1.1.)".

5. **F05** (P3) Manifest slips

   **Location and witness.** `packages/LieGroupsPartII/sources.toml` line 122: title "A general Cayley correspondence and higher Teichmüller spaces", and line 136: "title there omits the words 'general' and 'rank'". bradlow-collier-garciaprada-gothen-oliveira2024 lines 6–7 (arXiv v2, page 1) carry both words, as does README line 845. Line 117: `brown-rodriguezhertz-wang2022` is recorded as cited for "7.3f", but neither README §7.3 nor the docstring of `exists_eq_nonnegEigenspaces_of_le` cites it.

   **Repair.** Set `title = "A general Cayley correspondence and higher rank Teichmüller spaces"` and `version_note = "arXiv v2 read; its title agrees with the published one; published as Annals of Math. 200 (2024), no. 3, 803–892"`. Remove "7.3f" from line 117 (or cite the paper at the README bullet of `exists_eq_nonnegEigenspaces_of_le` for the classification after its equation (1), §1.2).

6. **F06** (P3) Heading runs into the preceding list

   **Location.** `packages/LieGroupsPartII/README.md` lines 657–658: the last Check of §7.1 is followed directly by `### 7.2 The dynamic subgroups of a symmetric element`.

   **Repair.** Insert a blank line before the heading, as before every other `###`.

Six findings: two blocking (P2), four P3. No previous review of the package and no maintainer notes. The mathematics of the statements held up under the adversarial pass (table below); the findings are about ownership against the supply chain, one statable headline clause missing from `Suggested.lean`, two locators and the source manifest.

## Adversarial table

Values computed in this review. "LCC" is the component condition.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `conj_standardParabolic_le_iff` (§6.1) | `S = ∅`; rank one, `g ∈ BsB`, `J = J' = ∅`; `J = ∅`, `J' = S`, `g = 1`; reversed inclusion | `B = G`: both sides true. Rank one: left is `gBg⁻¹ ⊆ B`, false by `sBs ≠ B`; right `g ∈ B` false. `(∅, S, 1)`: both true; `J' ⊆ J` version false there. Proof route: `BwB·Bw⁻¹B ⊇ BsB·BsB = B ∪ BsB` checked step by step | holds; not at the pin (searched `GroupTheory/TitsSystem/`, only `normalizer_standardParabolic`) |
| `dynamicLevi_decomposition` (§7.2) | `GL_2`, `X = diag(1,0)`; `X = 0`; skew `X`; `OᵀSL_2(ℤ)O` | Eigenbasis: entries `g_ij e^{−t(λ_i−λ_j)}`, bounded iff block upper triangular; `((2,3),(0,5)) = diag(2,5)·((1,3/2),(0,1))`. `O g Oᵀ = ((2,3),(1,2))`, det 1; `(O l Oᵀ)₁₂ = 3/2 ∉ ℤ` | holds; normalization hypothesis needed, as stated |
| `minimalParabolic_langlands` (§§3.3, 7.3) | `SL_2`; `O(1,1)`; `n = 0`; compact | `((−2,3),(0,−1/2)) = (−1)·diag(2,1/2)·((1,−3/2),(0,1))`. `O(1,1)`: `N = 1`, `P = {±exp tY}`, `K ∩ P = {±1} = M`, `G = K·P`. `n = 0`: all groups trivial | holds without LCC |
| `N(X) = N` for regular `X` (§6.2 (i)), used to define `minimalParabolic` | `O(1,1)`, `X = Y`; general argument | `exp(−tY)·d·exp(tY) = exp(−2tY)d` unbounded; commuting elements constant, so `N(Y) = 1`. General: `g = u n_w p`, middle factor `n_w exp(t(X − w⁻¹X))` converges iff `wX = X`, then `n_w ∈ K ∩ MA = M` | holds |
| `exists_conj_minimalParabolic` | `SL_2`, `(𝔞, ±H₀)`; `GL_2`, diagonal `𝔞` and `ℝ1 ⊕ ℝS` | `k = ((0,−1),(1,0)) ∈ SO(2)`; `Ad(R_{−π/4})S = diag(1,−1)`, `B(Ad(R_φ)S, H) = −2 sin 2φ` | holds |
| `bruhat_decomposition_linear` (§4.2) | `SL_3`; `SU(2,1)`; `O(1,1)`; `Aut(𝔰𝔩_3(ℝ))` | Dimensions `5 + ℓ(w)` = 5,6,6,7,7,8. `5 + 3 = 8`. `O(1,1)`: `P ⊔ dP`, two open cells. `Aut(𝔰𝔩_3)`: `K = SO(3) × ⟨σ⟩`, `σ = −1` on `𝔞`, `−1 ∉ W(A₂)`, `|W_G| = 12`. Disjointness: `a_t u a_{−t} → 1` as `t → −∞` | holds without LCC |
| `dynamicParabolic_eq_iUnion_doubleCoset` | `Aut(𝔰𝔩_3)`, `X₀ = diag(1,0,−1)`, `X₁ = diag(3,1,−4)` | `σAd(w₀)`: `X₀ ↦ −(−1,0,1) = X₀`; `X₁ ↦ (4,−1,−3) ≠ X₁`. Stabilizers of order 2 and 1 | holds |
| `exists_eq_nonnegEigenspaces_of_le` | `𝔰𝔩_3`, `X = diag(1,1,−2)`, `Y = 2X`; `GL_2`, `Y = 0` and `1` | `ad X` eigenvalues on `E₁₂,E₂₁,E₁₃,E₂₃,E₃₁,E₃₂`: 0,0,3,3,−3,−3; sum of dimension 6; same centralizer for `X`, `2X` | holds |
| `linearComponentCondition_iff` (§2.5) | `GL_n`; `O(1,1)`; `O(p,q)`; `O(4)` | `M ∋ diag(−1,1,…)`. `O(1,1)`: `d` normalizes `N = 1`, `d ∉ M`; `dPd⁻¹ = P`, `d ∉ P`. `O(p,q)`: block determinants `(Πε·det k', Πε)`, four values iff `p > q`. Equivalence re-derived from `K = N_K(𝔞)K⁰` and `N_{K⁰}(𝔞)/Z_{K⁰}(𝔞) = W(Σ)` | holds, both directions |
| `eq_dynamicParabolic_of_le`, `exists_titsSystem_linear` (LCC) | `O(1,1)` as control; `Σ = ∅` with LCC (`SO(1,1)`, compact) | `O(1,1)`: `Q(0) = G`, `Q(Y) = P`, same centralizer; `P` normal so `sBs ≠ B` fails. `Σ = ∅` with LCC: `P = G`, `B = N = G`, `S = ∅` satisfies the pinned structure | hold under LCC; LCC needed |
| `positiveCharacterKernel_mul_exp` (§§5.1, 7.4) | `ℝ^×`; `GL_n`; `O(1,1)`; diagonal ⋊ swap; `ℝ ⋊ C₂` | `x = sgn x·exp(log|x|)`. `h(g) = (log|det g|/n)·1`. `O(1,1)`: `F = 0`, `⁰G = G`. `diag(e³,e) = diag(e,e⁻¹)·exp(2·1)`, average of `(3,1)` is `(2,2)`. `h` checked to be a homomorphism using `pr_F ∘ Ad(k) = pr_F` | holds; only `F` splits off |
| `isSelfAdjointLinearGroup_of_zeroLocus` (§8.1) | `S = ∅`; `SO(1,1)`; `O(1,1)`; `SO(2,1)`; `diag(x, x⁻¹)` | `GL_n(ℂ)` connected. `SO(1,1)(ℂ) ≅ ℂ^×`, real points two components, `M = {±1}` meets both. `O(2,ℂ)` has two components, excluded. `SO(2,1)`: `M = {1, diag(1,−1,−1)}` computed from `gH = Hg`. Reductivity from stability under conjugate transpose | holds; hypothesis is on `Gℂ` |
| §1.2 conjugacy of involutions | `ℝ × S¹`, `θ_c`; `ℝ ⋊ ℤ/2`, `θ_a`; `SL_2`, `h = diag(2,1/2)` | `θ_c² = id`, `𝔭_c = {(x, cx)}`. `θ_a` multiplicative in all four parity cases; `c_{(a/4,0)} θ_0 c⁻¹ = θ_a`. `c_aθc_a⁻¹ = c_{aaᵀ}θ`; `exp(X)exp(Z) = exp(Z)exp(X)` since `Z` is central | holds; equal split centre needed |
| §2.2 conjugacy under `K⁰` | `GL_2`; `O(1,1)` | as in row 5; `K⁰ = 1`, `𝔞 = 𝔭` | holds |
| §2.3 `IwasawaData` fields | `SL_2`, `GL_2`, compact | chamber `{diag(t,−t), t ≥ 0}` spans; `1+1+2 = 4 > 3` for `Σ` in place of `Σ⁺`; chamber `{0}` for `𝔞 = 0` | fields match the pinned-roadmap structure read at LieGroups `Suggested.lean` lines 509–589 |
| §2.4 reflections in `K⁰`, `N_G(𝔞) = N_K(𝔞)A` | `SL_2` | `exp(c(E₁₂ − E₂₁))` at `c = −π/2` is `((0,−1),(1,0))`; `e^{−2 ad X}` preserving `𝔞` forces `X ∈ 𝔞` | holds |
| §2.5 axiom (v) ⟹ LCC | `GL_2`; `O(4)`; `O(1,1)` | `𝔱_𝔲 = iℝ·diag(1,−1)` fixed by `diag(−1,1)`; `O(4)`: LCC holds, (v) fails; `Ad(d) = −1` on abelian `𝔤_ℂ` | holds |
| §2.6, §3.4 | `ℝ × S¹`; rank one | `P = G` for all `c`, involutions not conjugate; two parabolics `P`, `θ(P)` through `MA` | holds |
| §3.1 centralizers | `GL_3`, `𝔰 = ℝ·diag(1,1,−2)` | `L = GL_2 × GL_1`, four components; LCC inheritance re-derived via §§2.1, 2.2, 2.4 | holds |
| §3.3 (e), (f) | `GL_2`; `O(1,1)` | nilradical of `Lie(P)` is 2-dimensional, `B`-orthogonal is `ℝE₁₂`; `N_G(P) = G ≠ P` without LCC | holds |
| §4.1 | `X = m + a + n ∈ 𝔭` | `2m + n + dθn = 0` | holds |
| §7.2 transport | `X = ((1,1),(0,0))`, `g = 1 + X` | `θ(g) = ((1/2,0),(−1/2,1))`, in the eigenbasis `((0,1),(−1/2,3/2))`, upper-right entry `e^t` | Check correct |
| Conventions: signs | `GL_2`, `X = diag(1,0)`; `λ(t) = diag(t,1)` | `((a, e^{−t}b),(e^t c, d))`; `((a, tb),(t⁻¹c, d))`, `t = e^{−s}` | conventions agree |
| R02 repair | `SL_2`, `O(1,1)` | see R02 | holds |

## Verified sound

- **Elaboration.** `lake env lean` on `packages/LieGroupsPartII/Suggested.lean` from the content checkout: exit 0, twelve `declaration uses sorry` warnings, nothing else. No `set_option`, no sorried data, `theorem` only, one `import Mathlib` and one used `TauCeti` module (`TauCeti.GroupTheory.TitsSystem.Parabolic.Basic`).
- **Padding probe.** All 12 sorried theorems tried with `rfl`, `simp`, `infer_instance`, `tauto`, `constructor <;> simp` on a scratch copy: none closes. None restates a definition or mirrors a Check.
- **Signatures.** The 25 elaborated types compared with the README statements: the only section variable is `{n : ℕ}`; every hypothesis is an explicit binder; README and Lean generality agree (closed and transpose-stable only for `dynamicLevi_decomposition`, no component condition in the six statements that claim none).
- **README names.** The 25 backticked names the README attributes to this roadmap are the 25 declarations. The two leads of the citation resolver (`LocallySymmetric.realPoints_lieGroup`, `LocallySymmetric.IsCartanInvolution.transposeInverse`) are refuted: both are named in ArithmeticLocallySymmetricSpaces ALS.F.1 and ALS.0.1 at its open head.
- **Pinned declarations opened** (Mathlib 1b1ccf4, Tau Ceti 2fd255d; about 60 names, each checked with `#check` or opened at its file and line): `TauCeti.TitsSystem` (`GroupTheory/TitsSystem/Basic.lean:50`), `standardParabolic` (`Parabolic/Basic.lean:48`), `mem_standardParabolic_iff` (`:152`), `standardParabolic_empty` (`:190`), `existsUnique_mem_bruhatCell` (`Bruhat/Uniqueness.lean:111`), `standardParabolic_le_standardParabolic_iff` (`Parabolic/Classification.lean:139`), `bruhatCell_subset_standardParabolic_iff` (`:130`), `normalizer_standardParabolic` (`Parabolic/Normalizer.lean:77`), `bruhatCell_mul_eq_of_wordLength_le` and `…_right` (`Bruhat/Length.lean:73, 231`), `bruhatCell_mul_self_eq_union_of_mem_simple` (`Bruhat/Basic.lean:296`), `coxeterSystem` (`Coxeter.lean:178`), `TauCeti.stabilizer_eq_closure_wallReflections` (`LinearAlgebra/RootSystem/FundamentalDomain.lean:201`, hypotheses at `:148`), `TauCeti.glTitsSystem` (`…/Diagonal/TitsSystem.lean:195`, `[Field k] [Nontrivial kˣ]`), `map_lieExp` (`Geometry/Lie/Functor.lean:315`), `lieMap_injective` (`Geometry/Lie/Faithfulness.lean:50`, preconnected source), `TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff` (`Geometry/Lie/Subgroup/Units.lean:58`, closed `K`), `TauCeti.expUnit_coe`, `TauCeti.Lie.conj_lieExp`, `TauCeti.Lie.tangentAd_mulInvariantExp_apply`, `TauCeti.Cocharacter.parabolic` and `.limit` (`Algebra/AlgebraicGroup/Dynamic/Parabolic.lean:154, 208`), `TauCeti.borelSubalgebra` (`Algebra/Lie/Weights/Borel.lean:439`, `IsKilling`), the `GL_n` Iwasawa, Cartan, polar, Bruhat and restricted-Weyl declarations, and the Mathlib names of the contracts. The three library claims hold: no `LieRing` and no `Bornology` instance on `Matrix (Fin 2) (Fin 2) ℝ` (instance search fails), `LieRing.ofAssociativeRing` is a `def` with local instances (`Mathlib/Algebra/Lie/OfAssociative.lean:47, 63`), and only `LieSubmodule.baseChange` exists (`Mathlib/Algebra/Lie/BaseChange.lean:185`). `CartanInvolution` and `IwasawaData` are absent from the pinned Tau Ceti, as the docstring says.
- **Cross-roadmap citations resolved.** LieGroups on main: Layer 9 text and `CartanInvolution`, `FiniteCartanMatrixModel`, `IwasawaData` (all fields quoted in §2.3), `IsIwasawaTriple`, `iwasawaDecomposition`, `kakDecomposition`, `cartan_polar_decomposition`, `isConj_of_isMaximalTorus`, `weylGroup`, `exists_monoidHom_of_lieHom`. RealSemisimpleLieGroups at its open head: §§0.2, 1.2, 1.3, 2.3, 3.1–3.3, 4.1–4.5, 5.4 and `exists_conj_cartanInvolution`, `exists_titsSystem`, `dynamicalParabolic`, `nonnegEigenSubmodule`; each statement cited here is made there. ArithmeticLocallySymmetricSpaces ALS.F.1, ALS.0.1–0.3; AutomorphicFormsOnReductiveGroups §2.3a; AutomorphicSpectralTheoryPartII §1.5; RootSystems "Exact supplier contracts" (on main and at its open revision); ReductiveGroups Layers 7 and 7C. No roadmap cites LieGroupsPartII. No declaration name of `Suggested.lean` occurs in another roadmap.
- **Dependency check.** Output: `depcheck: 245 roadmaps, 2242 edges, 0 problem(s)`; no UPWARD or CYCLE line. It does not see the chain of R01.
- **Sources read at their locators** (3 certified texts, 1 consumer reference): borel-tits1965 Corollaire 5.18 (ii) at line 1931, printed p. 101, supports §6.1 once its reversed indexing is translated; Théorème 4.15 at lines 1488–1497, pp. 90–91 (see R03); brown-rodriguezhertz-wang2022 §1.2 equation (1) at lines 136–141, p. 3; brown-fisher-hurtado2022 §3.1 equation (1) at lines 515–519, pp. 11–12, with `Span(−Π')`, as the Conventions say; bradlow-collier-garciaprada-gothen-oliveira2024 lines 72–74, p. 2.
- **Shape.** Summary, scope, conventions, contracts, build paragraph, eight layers each with Examples and Dependencies, consumers, worked examples, references. Every definition has at least three Checks; no LaTeX delimiters, no process words, no machine paths; the baseline hashes equal the pins. Every theorem has a locator except §3.5 (R04).
- **Duplication.** Why this roadmap owns §6.1: the pinned Tits-system files stop at self-normalization and no roadmap states the containment form. `Overlap check: read RealSemisimpleLieGroups, AutomorphicFormsOnReductiveGroups, ArithmeticLocallySymmetricSpaces, ShimuraData, CompactGroupsPartII, LieGroups, FlagVarieties, ReductiveGroups; shared object: the minimal parabolic P = MAN with its Langlands decomposition, owner AutomorphicFormsOnReductiveGroups §2.3a for real points and RealSemisimpleLieGroups §3.1 for connected semisimple groups of finite centre (R01); nothing else shared.`
- **Copyright.** `Source independence: 7 passages compared with 4 sources, none shared; largest share knapp2002, 21 of 37 locators; contents compared with knapp2002 through the README's own section locators only (text not readable): the layers cite Ch. VI §2/VII §2, VI §§4–5/VII §§2, 5, VII §§2, 7, VII §4, VII §2, VII §7 in that order, which is not a run of its sections: independent.` The near-identical API sentences of §3.2 and AutomorphicFormsOnReductiveGroups §2.3a are project text, part of R01.

## Not verifiable

- knapp2002, warner1972, wallach1988, bourbaki-lie4-6: recorded as uncertified (paywalled); not read. Of the sampled targets, 1.2, 2.1, 2.2, 2.3, 2.5, 2.6, 3.4, 4.1, 5.1, 6.3, 7.1, 7.3 and 8.1 cite only these, by chapter and section, so theorem numbers, pages and hypotheses in the sources were not checked; the statements were checked mathematically instead (table). The sampled 6.1 and 6.2 were checked against borel-tits1965.
- The wording and arrangement comparison against knapp2002 (largest share of locators) was not possible against its text.
- Proof routes inside RealSemisimpleLieGroups §§3.2–4.4 were read as stated there, not re-proved.

## Source issues

- **Error** in brown-rodriguezhertz-wang2022 at §1.2, printed p. 3: the source says a positive root is simple when it is not a linear combination of other positive roots; it should be: not a sum of two positive roots (in a non-reduced system `λ = ½·2λ`); affects nothing.

## For the human reviewers

- **Not tested.** knapp2002 carries 21 of the README's 37 source locators and its text and contents page could not be read (uncertified in `packages/LieGroupsPartII/sources.toml`): wording and arrangement were not compared with it.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1caea464f4e270d23d014641bb0b40d15805441b", "job": "REV-PKG-LieGroupsPartII", "model": "fable", "worker": "chris-x29"} -->
