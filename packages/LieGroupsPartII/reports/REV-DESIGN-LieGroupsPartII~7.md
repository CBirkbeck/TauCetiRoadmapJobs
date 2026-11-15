<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13792#issuecomment-6896564569 -->
Review (claude) of 75bc2ee

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) "Iwasawa datum" is used for two different objects and defined for neither

   **Location.** `packages/LieGroupsPartII/design/README.md` §2.1 ("the restricted root system of an Iwasawa datum"), §2.5 ("an Iwasawa datum `(D, 𝔞)` satisfies the **component condition**"), §3.1 ("Let `(D, 𝔞)` be an Iwasawa datum"), and the heading of §2.3 ("The base Iwasawa datum of an Iwasawa triple").

   **Claim.** Every term is the literature's, Mathlib's, or defined where it first appears.

   **Witness.** Conventions define only the Iwasawa triple `(D, 𝔞, Σ⁺)`. In §2.3 "Iwasawa datum" is LieGroups' `IwasawaData` (with `N`, `Σ⁺`, chamber); in §§2.5 and 3.1 it is the pair `(D, 𝔞)` with no `Σ⁺`. `design/plan.json` 2.1 repeats the term.

   **Exact repair.** In Conventions, after the first sentence of "Iwasawa triples", add: "An **Iwasawa pair** `(D, 𝔞)` is a reductive Cartan datum with a maximal abelian subspace `𝔞 ⊆ 𝔭`; `Σ`, `M`, `W_G` and the component condition depend on the pair only." Write "Iwasawa pair `(D, 𝔞)`" in §§2.5 and 3.1; in §2.1 and plan 2.1 write "of an Iwasawa triple" (the sentence uses `Σ⁺`). Test: after the change the only "Iwasawa datum" left is §2.3's, which is `IwasawaData`; §2.5 on `O(1,1)` reads the same for both positive systems (`Σ = ∅`), as a property of the pair should.

2. **F02** (P3) the component condition and axiom (v) carry only the locator of the section on `M`

   **Location.** `design/README.md` §2.5: "Prove (Knapp 2002, Ch. VII §5): … It holds whenever Knapp's axiom (v) holds". Same locator in `design/plan.json` targets 2.5 and 7.3.

   **Claim.** The locator leads to the statements listed under it.

   **Witness.** The README's own References entry places "reductive groups and their axioms" in Ch. VII §2 and gives §5 as "structure of `M`"; §1.1 cites §2 for axiom (v). RealSemisimpleLieGroups §2.3 cites "Knapp, Ch. VI, Thm. 6.57, and Ch. VII §2" for `W_G = W(Σ)` and the components of `M`. The book is uncertified and was not read.

   **Exact repair.** Write "(Knapp 2002, Ch. VII §§2, 5)" in §2.5, and "Ch. VII §§2, 5 (reductive groups and their axioms; structure of M)" in plan 2.5 and 7.3. Nothing is removed, so the locator cannot become wrong by the change. The manifest entry `knapp2002` already lists Ch. VII §§2 and 5 and needs no edit. Whoever holds the book confirms the section of the statement that `M` meets every component.

Two findings, both P3 (none blocking); each has a repair to apply, so the verdict asks for changes. The five round-6 findings are repaired. The repaired passages, the 15 sampled targets and the headline statements were recomputed; the dependency gate is clean; every cited supplier section and pinned declaration was resolved again. No gap is declared and none is needed. Only the two review deliverables were written. Elaboration: not available (this lane does not elaborate); the design stage has no `Suggested.lean`.

## Previous findings, checked individually

Identifiers are those of round 6. None was marked "not actionable in this package".

| Round-6 finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P3), §2.3 needed the later §2.6 | Layer 2 now runs 2.1 subsystems, 2.2 conjugacy, "2.3 The base Iwasawa datum of an Iwasawa triple", "2.4 The two Weyl groups", "2.5 The component condition", "2.6 Conjugacy of Iwasawa triples". Plan: 2.3 ← 1.1; 2.4 ← 1.1, 2.1, 2.2, 2.3; 2.5 ← 1.1, 2.2, 2.4; 2.6 ← 1.2, 2.2, 2.4, 2.5. A scan of all 33 targets finds no forward and no missing `target:` prerequisite. | Repaired |
| F02 (P3), Layer 9's `Ad(K)𝔞 = 𝔭` described with an `IwasawaData` restriction | Scope: "beside Layer 9's `Ad(K)𝔞 = 𝔭`, §2.2 proves the form under `K⁰`, the conjugacy of two maximal abelian subspaces and the factorizations"; contract: "no `IwasawaData` is presupposed, so §2.3 uses the coverage to prove the field `chamber_normalizer_cover`"; §2.2 and plan 2.2, 2.3 agree. | Repaired |
| F03 (P3), axiom (v) clause without route or inputs | §2.5 has "Proof sketch for axiom (v)" in four steps (compact form and polar decomposition of `Int(𝔰_ℂ)`; `Ad(n)|_{𝔰_ℂ} ∈ Int(𝔲)`; adjustment by `m ∈ M⁰`; free Weyl action), `*Needs:*` with LieGroups Layers 6, 7, 9, and two Checks. | Repaired; the route is correct (table) |
| F04 (P3), base datum built without its reductivity fields | §1.1 API "Reductivity criterion" with the `𝔟` Check; §7.1 "Prove the two reductivity fields: … `(ad X)ᵀ = ad(Xᵀ)`"; §3.1 "Its global model is the restriction of the covering `π : G → H` of `C` to `L = π⁻¹(Z_H(dπ 𝔰))`"; §5.1 and the `G⁰` restriction name their fields. | Repaired |
| F05 (P3), `Bornology.IsBounded` on matrices | §7.2: "there is `C` with `|(… ) i j| ≤ C` for all `t ≥ 0` and all `i, j`"; contract: "`Matrix` has no `Bornology` instance at the pin … boundedness of a family of matrices is stated entrywise"; `Bornology.IsBounded` is gone from the README and the plan. | Repaired |

The repaired patterns in the rest of the design. A forward prerequisite (F01): none in any layer. A supplier cited beyond what it states (F02, F04): every Layer 6 and Layer 9 claim of the contract was read against LieGroups on main, and each RealSemisimpleLieGroups bullet against its section; all hold. A clause without a route (F03): the clauses "connected" and "compact" of §2.5 are immediate (`G = G⁰`; `𝔭 = 0`, `M = K = G`); no other unrouted clause was found. A carrier missing at the pin (F05): `Filter.Tendsto` on `Matrix` elaborates through the topology instance of `Mathlib/Topology/Instances/Matrix.lean:48`; `NormedSpace.exp` needs no norm instance.

## Verified sound

### Coverage

All 776 lines of the README, the 33 plan targets and the 8 manifest entries were read. No maintainer notes exist. Pattern search over the README: no process word, pull-request number, machine path, HTML anchor, LaTeX delimiter, `lemma`, "optional" or "deferred". No sentence says the roadmap follows a source; the eight layers are named by their mathematics and each ends with Examples and Dependencies. Every definition (§§1.1, 2.5, 3.2, 3.4, 5.1, 6.2, 6.3, 7.1, 7.2, 7.3) has at least three Checks; the plan has between 2 and 7 tests per target. No route-specific shortcut, algorithm, sorry'd data or `set_option`.

### Adversarial table

`θ` is transpose-inverse in matrix examples; `S = ((0,1),(1,0))`, `J = ((0,1),(−1,0))`, `d = diag(1,−1)`, `R_φ = ((cos φ, −sin φ),(sin φ, cos φ))`.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §1.1 reductivity criterion (new) | general; `𝔤𝔩_2`; `𝔟`; `B_θ` | `⟨[x,y],i⟩ = ⟨y,[x',i]⟩ = 0` for `y ∈ I^⊥`; `tr([X,Y]Zᵀ) = tr(XYZᵀ) − tr(YXZᵀ) = tr(Y[Xᵀ,Z]ᵀ)`; on `𝔟`: `ad E₁₂` sends `E₁₁ ↦ −E₁₂`, `E₂₂ ↦ E₁₂`, so its adjoint sends `E₁₂ ↦ E₂₂ − E₁₁`; `B_θ([X,Y],Z) = −B_θ(Y,[dθX,Z])` | Holds; hypothesis and conclusion fail together on `𝔟` |
| §1.1 restriction to `G⁰` (new clause) | `O(1,1)`; `ℝ^×` | `π(G⁰)` open connected, so `H⁰`; `K ∩ G⁰`: `{1}` of 4, `{1}` of 2 | Holds |
| §1.2 | step 2; `GL_n`; `SL_2` | `θ'(k') = τ(k)·exp(−Y) = k·exp(Y)` gives `τ(k) = k·exp(2Y)`; `½ log(g²) = log g = X + Z`; `c_aθc_a⁻¹ = c_{aaᵀ}θ`, `h² = diag(4, 1/4)` | Holds |
| §2.1 | `BC₁`; `BC₂` | `2λ = λ + λ`, so `Π = {λ}`; coroot of `2λ` is half that of `λ`, outside the closure required by `RootPairing.Base` (`Base.lean:75`); `Σ ∩ span(e₂) = {±e₂, ±2e₂}` | Holds |
| §2.2 | `GL_2`; scalar `H`; `O(1,1)` | `R_φ S R_φᵀ = ((−sin 2φ, cos 2φ),(cos 2φ, sin 2φ))`, paired with `d`: `−2 sin 2φ`, maximum 2 at `φ = −π/4`, value `d`; `tr S = 0` constant; `K = K·{1}` | Holds |
| §2.3 | `SL_2`; `GL_2`; compact | `1 + 1 + 2 = 4 > 3`; chamber `h₁ ≥ h₂` contains `±1`; chamber `{0}` | Fields covered; Layer 9 builds `N₊` and its closedness (LieGroups README, "Iwasawa decomposition") |
| §2.4 | `SL_2`; `O(1,1)`; normalizer | `exp(−(π/2)J) = ((0,−1),(1,0))`; `(|W_G|, |W(Σ)|) = (2, 1)`; `e^{2 ad X}` positive and preserving `𝔞` gives `⁅X,𝔞⁆ ⊆ 𝔞 ∩ 𝔨 = 0` | Holds |
| §2.5 equivalences | `O(1,1)`, `GL_n`, `Aut(𝔰𝔩_3)`, `O(4)`, `Σ = ∅` | `(|W_G|, |W(Σ)|)`: `(2,1)`, `(n!,n!)`, `(12,6)`, `(1,1)`; `S/M ≅ W_G/W(Σ)` for the stabilizer `S` of `Σ⁺`; stabilizer of `∅` is `N_K(𝔞)` | Both directions agree |
| §2.5 axiom (v) (new) | general; `GL_2`; `𝔰 = 0`; `O(1,1)`, `O(4)` | for `u = k + ip` commuting with `𝔱_𝔲`: `i[k,a] − [p,a] = 0` splits into `i𝔭` and `𝔨` parts, so `k ∈ 𝔪 ∩ 𝔰`, `p ∈ 𝔞 ∩ 𝔰`, then `k ∈ 𝔱` since `𝔱 = (𝔷∩𝔨) ⊕ (𝔱∩𝔰)`; `GL_2`: `𝔱_𝔲 = iℝd`, `Ad(diag(−1,1))d = d`; `𝔰 = 0`: `Ad(n) = 1`; `O(1,1)`: `Ad(d) = −1` with every `e^{ad Z} = 1`; `O(4)`: (v) fails, condition holds | Holds; strictly weaker, as stated |
| §2.6 | `SL_3`; `ℝ^×` forms `xy`, `2xy` | 6 systems; `g = 1` with `1 ≠ 2`; solutions form one coset of the stabilizer | Holds |
| §3.1 (new model) | general; `GL_3`, `𝔰 = ℝ·diag(1,1,−2)`; `E₁₂` | `dπ(Ad(g)s) = Ad(π(g))dπ(s)`; `dπ(dθX) = −dπ(X)ᵀ`, so `dπ𝔭` symmetric; `exp(2X)` commuting with symmetric `S` forces `X` to; `dim L = 4 + 1 = 5`, 4 components; `Z(E₁₂) = {a + bE₁₂}` not transpose-stable | Holds; symmetry of `dπ𝔰` is what is used |
| §3.1 component condition | general | `k = m·k₀`, `k₁k₀ ∈ N_{K⁰}(𝔞) ∩ L` acts by an element of `W(Σ)` fixing `𝔰`, a product of `s_β` with `β|_𝔰 = 0`, realized by `lieExp(c(X + dθX))`, `X ∈ 𝔤^β ⊆ 𝔩` | Holds |
| §3.2 | `SL_2`; centre | `(−1)·diag(2, ½)·((1, −3/2),(0,1)) = ((−2, 3),(0, −½))`; central `z = k·exp X` has `exp(2X)` central, `X ∈ 𝔷_𝔭`, `k ∈ M` | Holds |
| §3.3 | `𝔤𝔩_2`; `O(1,1)`; `Σ = ∅` | nilradical dim 2 against `𝔫` dim 1; `dim 𝔫 = dim 𝔤 − dim Lie(P)`; `[G:P] = 2`; under the condition `K⁰ ⊆ M` and `K = M` | Holds; condition needed in (f) |
| §3.5 | `GL_2`; `O(1,1)` | `Z_{K⁰}(𝔞) = SO(2) ∩ diagonal = {±1}`; `P ∩ G⁰ = A = G⁰` | Holds |
| §4.1 | general; `SL_3`; `O(1,1)` | `dθX = −X` gives `2m + n + dθn = 0` in `𝔪 ⊕ 𝔫 ⊕ 𝔫̄`; 6 fixed flags; 2 fixed points | Holds |
| §4.2 | `SL_3`; `SU(2,1)`; `O(1,1)`; `Aut(𝔰𝔩_3)`; compact | `5 + ℓ(w)`: `5,6,6,7,7,8`; `5 + 2 + 1 = 8`; open cells = `|Stab(Σ⁺)|`: `2`, `2`, `1` | Holds over `W_G` |
| §5.1 | `GL_n`; `ℝ ⋊ C₂`; `ℝ² ⋊ C₂` | `h = (log|det|/n)·1`; `ℓ(−t) = ℓ(t)` gives `F = 0`; `(3,1) ↦ (2,2)`, residual `(1,−1)`; `exp F` central since `Ad(l)f = f` | Holds |
| §6.1 | from the first bullet; `GL_2(𝔽₂) ≅ S₃` | `g ∈ P_{J'}` then `P_J ⊆ P_{J'}`; `B` of order 2 is self-normalizing in `S₃` | Holds; not in Tau Ceti (`Parabolic/Normalizer.lean` has only normalizer statements) |
| §6.2 (i) | `Aut(𝔰𝔩_3)`, `X₀ = diag(1,0,−1)`, `X₁ = diag(3,1,−4)` | `−w₀X₀ = X₀`; `−w₀X₁ = diag(4,−1,−3)`; `n_w ↦ n_w·exp(t(X − w⁻¹X))`; stabilizer of `X₀` in `W_G` has order 2 | Holds |
| §6.3 | `𝔤𝔩_2`; `O(1,1)`; `Aut(𝔰𝔩_3)` | dim 2 against 3 and 4, `1 ∉ 𝔮`; criterion reads `𝔮 ⊇ 𝔷`; `σ𝔮_{{α₁}} = Ad(w₀)𝔮_{{α₂}}` | Both sides agree |
| §7.1 | `𝔟`; `ℝE₁₂`; discrete group | `ℝ·1 ⊕ ℝE₁₂` of dim 2 < 3; abelian, reductive; tangent algebra 0 | Holds |
| §7.2 (entrywise) | `GL_2`, `X = diag(1,0)`; skew `X`; products | entries `a, e^{−t}b, e^{t}c, d`, bounded by `max(|a|,|b|,|d|)` iff `c = 0`; rotations: Frobenius norm at most `2·max|g_ij|`; `|(AB)_ij| ≤ n·max|A|·max|B|`, inverse by Cayley–Hamilton | Holds |
| §7.3 headlines | `SL_3`; `O(p,q)`; `O(1,1)`; rank 0 | `ad diag(1,1,−2)`: `0,0,3,3,−3,−3`, sum of dim `2 + 2 + 2 = 6`; block determinants: 4 of 4 for `p > q ≥ 1`, 2 of 4 for `p = q`; `exp(−tY)·d·exp(tY) = exp(−2tY)·d`; `Σ = ∅` with the condition: `P = N_G(𝔞) = G`, `S = ∅` | All five hold; both "iff" clauses in each direction |
| §8.1 | `SO(2,1)`; `𝔾_m × SO(2)` | `k = diag(A, ε)` commuting with `E₂₃ + E₃₂` forces `A = diag(1, ε)`: `M = {1, diag(1,−1,−1)}`, the second reversing `x₃`; only `c = 0` is algebraic | Holds |

### Sources and the seeded sample

| Target | Outcome |
| --- | --- |
| 1.1, 2.2, 2.3, 2.4, 2.6, 3.1, 3.2, 3.5, 4.1, 4.2, 5.1, 7.1, 7.2, 8.1 | Locators are `knapp2002`, `warner1972`, `wallach1988` by chapter and section: uncertified, not readable. The statements were checked mathematically (table). |
| 2.1 | `bourbaki-lie4-6` Ch. VI §1: uncertified. Checked on `BC₁`, `BC₂`. |
| Conventions | `brown-rodriguezhertz-wang2022` lines 136–141: formula (1) with the span of `Π′`; lines 142–144: classification. `brown-fisher-hurtado2022` lines 513–519: the span of `−Π′`. As cited. |
| 6.1, 6.2 | `borel-tits1965` line 1931 (Corollaire 5.18 (ii), scan page 48, printed 101) and line 1488 (Théorème 4.15, scan page 37, printed 90, continuing on 91). As cited. |
| Consumers | `bradlow-collier-garciaprada-gothen-oliveira2024` lines 72–74. As cited. |

The author flagged no locator as unverified. No source was fetched and no request file was written; the manifest is unchanged, and its `cited_for` lists agree with the renumbered Layer 2.

### Library declarations opened at the pins

Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (`lake-manifest.json`). Mathlib: `LinearMap.IsSymmetric.directSum_isInternal_of_pairwise_commute` (`Analysis/InnerProductSpace/JointEigenspace.lean:137`), `Matrix.exp_transpose`, `Matrix.exp_conj` (`Analysis/Normed/Algebra/MatrixExponential.lean:113, 185`), `unitarySubgroup` (`Algebra/Star/Unitary.lean:273`), `Matrix.orthogonalGroup` (`LinearAlgebra/UnitaryGroup.lean:318`), `Matrix.symplecticGroup` (`LinearAlgebra/SymplecticGroup.lean:102`), `DoubleCoset.doubleCoset`, `DoubleCoset.Quotient` (`GroupTheory/DoubleCoset.lean:37, 79`), `RootPairing.Base` with `coroot_mem_or_neg_mem` (`LinearAlgebra/RootSystem/Base.lean:68, 75`), `Module.End.eigenspace` (`LinearAlgebra/Eigenspace/Basic.lean:423`), `connectedComponentIn` (`Topology/Connected/Basic.lean:505`). `Matrix` is a plain `def` (`LinearAlgebra/Matrix/Defs.lean:55`) with a topology (`Topology/Instances/Matrix.lean:48`) and no `Bornology` instance (`Analysis/CStarAlgebra/CStarMatrix.lean:733`; the norms of `Analysis/Matrix/Normed.lean` are local or scoped, lines 82, 192, 215).

Tau Ceti: `map_lieExp` (`Geometry/Lie/Functor.lean:315`), `lieMap_injective` (`Geometry/Lie/Faithfulness.lean:50`, `[PreconnectedSpace G]`), `TitsSystem` (`GroupTheory/TitsSystem/Basic.lean:50`), `bruhatCell` (`Bruhat/Basic.lean:100`), `standardParabolic`, `mem_standardParabolic_iff` (`Parabolic/Basic.lean:48, 152`), `standardParabolicOrderIso` (`Parabolic/Classification.lean:146`), `normalizer_standardParabolic` (`Parabolic/Normalizer.lean:77`), `parabolicDoubleCosetEquiv` (`Parabolic/DoubleCoset.lean:199`), `coxeterSystem` (`Coxeter.lean:178`), `stabilizer_eq_closure_wallReflections` (`LinearAlgebra/RootSystem/FundamentalDomain.lean:201`), `borelSubalgebra` (`Algebra/Lie/Weights/Borel.lean:439`), `glTitsSystem` (`…/Diagonal/TitsSystem.lean:195`, `[Field k] [Nontrivial kˣ]` at line 58), `existsUnique_iwasawa` (`…/Iwasawa.lean:280`), `maximal_isCompact_iff` (`…/MaximalCompact.lean:158`), the KAK and polar theorems (`…/Cartan.lean:65`, `Analysis/Matrix/Polar.lean:76`), `upperTriangularGroup` (`…/UpperTriangular/Basic.lean:55`), `Cocharacter.parabolic`, `limit` (`Algebra/AlgebraicGroup/Dynamic/Parabolic.lean:154, 208`).

### Suppliers, ownership and overlap

- **RealSemisimpleLieGroups (open, new folder).** Read at its current head: Scope, "From other roadmaps", and §§0.2, 1.2, 1.3, 2.3, 3.1, 3.2, 3.3, 4.1, 4.2, 4.3, 4.4, 5.4. Each contract bullet matches its section: `exists_conj_cartanInvolution` with `Z ∈ 𝔭_θ` (§0.2); simple transitivity and sign-coherent expansions (§1.2); `W_G = W(Σ)` when `M` meets every component and the statement for `𝐆(ℝ)` (§2.3); the minimal parabolic datum (§3.1); the Tits system, cells and `exists_titsSystem` (§§3.2–3.3); `nonnegEigenSubmodule` (§4.1); `M_{Π'} = ⋂ ker|χ|` (§4.3); `dynamicalParabolic` and the Borel criterion (§4.4). It does not cite this roadmap: no cycle.
- **LieGroups (main).** Layer 6 ("The Weyl group": identification with the root-pairing Weyl group, "the geometric Weyl action on chambers is free", transitivity), Layer 9 ("Global real-reductive inputs": the model for a connected semisimple group with finite centre, used for `Int(𝔰_ℂ)`; "Restricted roots and KAK": `Ad(K)a=p`, reflection representatives, chamber coverage, with no `IwasawaData` hypothesis; "Iwasawa decomposition": the root-generated `N₊`), and `FiniteCartanMatrixModel`, `CartanInvolution`, `IwasawaData` in its `Suggested.lean` (fields `reductive_compl`, `derived_semisimple`, `compact_preimage_fixed` as the design uses them).
- **RootSystems (main).** "Exact supplier contracts" exists (its README line 123).
- **ArithmeticLocallySymmetricSpaces (open).** ALS.F.1, ALS.0.1, ALS.0.2, ALS.0.3 exist with the cited names; the two leads of the citation check are its planned names, not library names: resolved.
- **AutomorphicFormsOnReductiveGroups (open).** §2.3a exists; cited for ownership only.
- **ReductiveGroups, LieGroups Layer 8 (main).** "Layer 7" and "Layer 7C" of ReductiveGroups and Layer 8 of LieGroups exist as cited in the exclusions.
- **Gaps.** None declared; none needed.
- **Own objects.** `roadmaps grep` for `IsSelfAdjointLinearGroup`, `dynamicParabolic`, "reductive Cartan datum" and the reductivity criterion finds no other owner on main or at an open head. The two board packages that name this roadmap (SurfaceGroupCharacterVarieties, and the target note RealReductiveGroupsStructure, which is this roadmap's own) cite Layer 1 only.
- **Overlap list.** No other pull request changes this roadmap, no dropped id, no id defined only by a revision, no second copy.

Overlap check: read RealSemisimpleLieGroups, AutomorphicFormsOnReductiveGroups, ArithmeticLocallySymmetricSpaces, LieGroups, FlagVarieties, ReductiveGroups and RootSystems; shared with RealSemisimpleLieGroups: the parabolic theory of a minimal parabolic datum under the component condition, owner RealSemisimpleLieGroups (imported), and conjugacy of maximal abelian subspaces, owner RealSemisimpleLieGroups §1.3 for the Lie-algebra form and this roadmap §2.2 for the `K⁰` group form; shared with LieGroups: `Ad(K)𝔞 = 𝔭`, the restricted Weyl quotient and chamber coverage, owner LieGroups; shared with AutomorphicFormsOnReductiveGroups: the minimal parabolic of its algebraic class, owner AutomorphicFormsOnReductiveGroups; nothing shared with ArithmeticLocallySymmetricSpaces, FlagVarieties, ReductiveGroups or RootSystems. ShimuraData was not read this round.

Dependency gate, verbatim:

```text
candidate: LieGroupsPartII is not in the merge order yet; checked as if placed after ArithmeticLocallySymmetricSpaces (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2232 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Headlines and the Lean file

There is no `Suggested.lean` at the design stage, so no elaboration, no `#check` comparison and no one-tactic probe. Headline theorems of the README: conjugacy of involutions and Iwasawa triples with equal split centre; the component condition and its equivalents; `P = MAN` with its Langlands decomposition; the Bruhat decomposition over `W_G`; `⁰L`; the regular dynamical description; the complexification criterion with centre. Their pinned forms on `Subgroup (GL (Fin n) ℝ)` are `dynamicLevi_decomposition`, `bruhat_decomposition_linear`, `exists_eq_nonnegEigenspaces_of_le`, `minimalParabolic_langlands`, `eq_dynamicParabolic_of_le` and `exists_titsSystem_linear`, with `IsSelfAdjointLinearGroup`, `linearLieAlgebra`, the three dynamic subgroups and `LinearComponentCondition` as definitions with real bodies on carriers that exist at the pins. By reading, none of the six closes with one tactic or one library lemma. Every backticked name of this roadmap's own is one of these twelve and agrees with the plan. For the package: plan target 6.1 is named in the `TauCeti.TitsSystem` namespace; in `Suggested.lean` it sits under `TauCetiRoadmap.LieGroupsPartII` (no pinned declaration has that name).

### Copyright, licences and scope

Six passages were put beside their sources: the positive-system and simple-root convention (`brown-rodriguezhertz-wang2022` lines 130–135; the README's definition by a regular `H₀` and by sums of two positive roots is its own), the formula for `𝔮_{Π'}` (same source, lines 138–141; a formula), the remark on the span of `−Π'` (`brown-fisher-hurtado2022` lines 513–519), the three statements of §6.1 (`borel-tits1965` lines 1930–1932; a different form, with `B` in place of a parabolic and the opposite indexing), the boundedness sentence of §6.2 (`borel-tits1965` lines 1488–1489; the wording is the roadmap's) and the consumer bullet on `P_Θ` (`bradlow-collier-garciaprada-gothen-oliveira2024` lines 72–74). No run of words is shared beyond the formula. No table, figure or list is taken over. The prose of the other sections cites the four uncertified books and could not be compared.

Arrangement: `knapp2002` has 20 of the 35 locators. Its contents page was not read. By the README's own locators the layers cite Ch. VII §2 and Ch. VI §2 (Layer 1), Ch. VI §§4, 5 and Ch. VII §5 (Layer 2), Ch. VII §§2, 7 and Ch. VI §§4, 5 (Layer 3), Ch. VII §4 (Layer 4), Ch. VII §2 (Layer 5), Ch. VII §7 (Layer 6), Ch. VII §§2, 4–5, 7 (Layer 7): not monotone, and no layer corresponds to one section.

Source independence: 6 passages compared with 4 sources, none shared beyond a formula; largest share knapp2002, 20 of 35 locators; contents compared with knapp2002 through the README's section locators only, its text and contents page not having been read: independent as far as that shows.

## Not verifiable

- **knapp2002**, **bourbaki-lie4-6**, **warner1972**, **wallach1988**: settled as uncertified; their sections, pages and hypotheses were not read. Fourteen of the fifteen sampled targets have only these as locators. R02 rests on the README's own reference list and a sibling roadmap, not on the book.
- Lean elaboration, the `#check` comparison and the padding probe: not available in this lane, and there is no Lean file.
- RealSemisimpleLieGroups was read at the head the tools index holds; a later head may renumber the cited sections.

## Source issues

- **Misprint** in brown-rodriguezhertz-wang2022 at §1.2, arXiv v2 printed p. 3 (lines 133–134): the source says a simple root is a positive root that is not a linear combination of other positive roots; it should be not a sum of two positive roots; affects nothing.

## For the human reviewers

- **Not tested.** `knapp2002` carries 20 of 35 locators; neither its text nor its contents page was read, so wording and arrangement were not compared with it directly.
- **Merge order.** RealSemisimpleLieGroups (open, new folder) is a supplier but absent from `merge-order/ORDER.txt`; it consumes AutomorphicFormsOnReductiveGroups §2.3a (line 59). The gate placed this roadmap after line 58 and saw neither edge.
- **Ownership.** The division with RealSemisimpleLieGroups (it owns the parabolic theory under the component condition, this roadmap what lies beyond) is stated only in `design/README.md`, "Scope and ownership"; no maintainer note records it.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "75bc2eecbf50b70f9e42ad6e0a5d624cb77ed15a", "job": "REV-DESIGN-LieGroupsPartII~7", "model": "fable", "worker": "chris-x52"} -->
