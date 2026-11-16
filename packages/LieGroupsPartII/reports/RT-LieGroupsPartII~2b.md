<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17225#issuecomment-6904384574 -->
Red team round 2 pass b (claude) of 6666358

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) a Check and a contract line name library carriers that are not subgroups of `GL (Fin n) ℝ`

   - **Location.** `packages/LieGroupsPartII/README.md:656`: "`Sp_{2n}(ℝ)` (`Matrix.symplecticGroup`) and the real points of `SU(p, q)` … are self-adjoint linear groups." Also line 82: "`Matrix.SpecialLinearGroup`, `Matrix.orthogonalGroup` and `Matrix.symplecticGroup` give the matrix groups."
   - **Claim.** `IsSelfAdjointLinearGroup` takes `G : Subgroup (GL (Fin n) ℝ)` (`packages/LieGroupsPartII/Suggested.lean:79`). The Check applies it to a library object by name.
   - **Witness.** At the pin, `Mathlib/LinearAlgebra/SymplecticGroup.lean:102`: `def symplecticGroup : Submonoid (Matrix (l ⊕ l) (l ⊕ l) R)`. It is a submonoid of matrices indexed by `l ⊕ l`, so the predicate does not apply to it. `Matrix.SpecialLinearGroup` is likewise its own type.
   - **Repair.**
     - Line 656: replace "`Sp_{2n}(ℝ)` (`Matrix.symplecticGroup`)" by "`Sp_{2n}(ℝ)` (as `{g ∈ GL (Fin (2n)) ℝ : g J gᵀ = J}`; Mathlib's `Matrix.symplecticGroup` is a `Submonoid` of `Matrix (l ⊕ l) (l ⊕ l) ℝ` and is read through this subgroup after reindexing `l ⊕ l ≃ Fin (2n)`)".
     - Line 82: append "`Matrix.SpecialLinearGroup` is a separate type and `Matrix.symplecticGroup` a `Submonoid` of `Matrix (l ⊕ l) (l ⊕ l) R`; the statements of Layer 7 take the corresponding `Subgroup (GL (Fin n) ℝ)`, cut out by the same equations."
     - On the witness the repaired Check names a `Subgroup (GL (Fin (2n)) ℝ)`: closed, stable under transposition (`g J gᵀ = J` gives `gᵀ J g = J`), and connected. No Lean declaration changes.

One new finding, S01 (P3). The four round-1 repairs hold at this head and introduced no new error. The fifth round-1 finding (1b/F02) was marked not actionable; its reason holds and it is not re-raised.

## Round-1 findings at this head

| Id | Status | Witness at `packages/LieGroupsPartII/README.md` |
|---|---|---|
| 1a/F01 (P3) | repaired | Line 718: "For every subgroup `G` and subspace `𝔞` … subgroups of `K`, the first normal in the second … For closed `G` both groups are compact … For a self-adjoint linear group `G` with `IsMaximalAbelianSymmetric G 𝔞`, the quotient is `W_G`". On the rational rotations with `𝔞 = 0` nothing false is claimed. Lines 719–720 carry the same hypotheses; their negative controls (lines 746, 748) recompute correctly: `GL_2`, `𝔞 = 0`, `H₀ = 0` gives `M = O(2)`, `N = 1`, set `O(2) ∌ 2·1`; `O(1,1)`, `𝔞 = 0` gives `M = K`, one element per component. |
| 1b/F01 (P2) | repaired | Line 274 proves the coverage by `N_{K⁰}(𝔞)`: `H' = H + εH₁` is regular (`β(H) = 0` gives `β(H') = εβ(H₁) ≠ 0`), `w·Σ'⁺ = Σ⁺` gives `γ(wH) = β(H) ≥ 0`, and each `s_β` comes from §2.4's first statement. That statement uses only `Z_𝔭(𝔞) = 𝔞` and `B(⁅X, dθX⁆, H) = β(H)·B(X, dθX)` with `B(X, dθX) < 0`, so there is no cycle with §2.3. Line 109 no longer claims the Layer 9 coverage for a bare datum. |
| 1b/F02 (P3) | settled (not actionable) | RealSemisimpleLieGroups is still absent from `merge-order/ORDER.txt`; AutomorphicFormsOnReductiveGroups is on line 63, after this roadmap on line 62. The README cites AutomorphicFormsOnReductiveGroups in ownership prose only, never in a `*Needs:*` line, and the dependency check is clean. The repair's reason (placement is outside the package) holds. |
| 1b/F03 (P3) | repaired | Line 328: "RealSemisimpleLieGroups §§0.2 (`Int(𝔰_ℂ)` … adjoint `CartanInvolution` datum for the Cartan involution `τ`), 1.2, 2.3". Line 117: "Consumed in §§1.2, 2.5 and 6.3". Line 355 lists §0.2. The cited §0.2 does define `Int(𝔤₀)` and its adjoint datum. |
| 1b/F04 (P3) | repaired | Line 215 gives the subspace argument (generic `x ∈ 𝔰`, move into the chamber, conjugate the wall reflections) with "Bourbaki, Ch. V §3 no. 3". `sources.toml` and References (line 850) carry the locator. Recomputed: `A₁`, `𝔰 = 𝔞`, `x ≠ 0` gives `Stab(x) = 1`; `x = 0` would give `W`. `(α∘w)(x) = α(wx) = 0`. |

## Adversarial pass: `Suggested.lean` (26 declarations)

The only section variable is `{n : ℕ}` (section `Linear`). `scratch/signatures.md` shows every elaborated type with its own binders, none lost. I ran no Lean.

| Declaration | Instances tried | Values computed | Result |
|---|---|---|---|
| `conj_standardParabolic_le_iff` | `S = ∅`; rank one, `g ∈ BsB`; `J = ∅`, `J' = S`, `g = 1`; proof step 2 | `S = ∅`: `B = G`, both sides true. Rank one: LHS is `gBg⁻¹ ⊆ B`, false by `sBs ≠ B`; RHS `g ∈ B`, false. `J = ∅ ⊆ S`, `1 ∈ G`: both true. `BwB·Bw⁻¹B ⊇ BsB·BsB = B ∪ BsB`. | holds; not a one-lemma consequence of `normalizer_eq_of_subgroupB_le` |
| `IsSelfAdjointLinearGroup` | `{diag(2^k, 2^{−k})}`; unitriangular group; `G = K·exp 𝔭` | Discrete group: infinitely many components, excluded. Unitriangular: not transpose-stable. Polar: `(gᵀg)^m = e^{2mX} ∈ G⁰` gives `X ∈ 𝔭`, so the three fields suffice. | determines the class |
| `linearLieAlgebra` | `G = 1 ≤ GL_2`, `X = 2π·((0,−1),(1,0))` | `exp X = 1`, `exp(X/4) ∉ G`: excluded by "every real `t`". | holds |
| `IsMaximalAbelianSymmetric` | `GL_2` diagonal; `ℝ·diag(1,−1)`; compact `G`, `𝔞 = 0` | Diagonal: holds. Line: `1` commutes and is outside, fails. Compact: `𝔭 = 0`, holds. | holds |
| `IsRegularElement` | `GL_2`: `diag(1,0)`, `1`; `O(1,1)`: `0` | `diag(1,0)`: centralizer diagonal, regular. `1`: `E₁₂` commutes with `1`, not with `diag(1,0)`, fails. `O(1,1)`: `Σ = ∅`, `0` regular. | holds |
| `orthogonalCentralizer`, `orthogonalNormalizer` | `SL_2`, `𝔞 = ℝ·diag(1,−1)` | `R_φ` sends `diag(1,−1)` to `((cos 2φ, sin 2φ),(sin 2φ, −cos 2φ))`: `M = {±1}`, `N_K` of order 4. | holds |
| `dynamicParabolic`, `dynamicUnipotent`, `dynamicLevi` | `GL_2`, `X = diag(1,0)`; `X = 0`; skew `X` | Entries `a, e^{−t}b, e^{t}c, d`: upper triangular, unitriangular, diagonal. `X = 0`: `G`, `1`, `G`. | holds |
| `minimalParabolic` | `SL_2`, `H₀ = ±diag(1,−1)`; `O(1,1)`; compact | Upper and lower triangular; `{±exp(tY)}`; `G`. | holds |
| `LinearComponentCondition` | `GL_n`; `O(1,1)`; `O(p,q)` | `diag(−1,1,…)` in `M`; `M = {±1}` meets 2 of 4; block determinants `(Πε·det k', Πε)`, all four iff `p ≠ q`. | holds |
| `nonnegEigenspaces` | `Y = diag(1,0)`; `diag(1,1,−2)` on `𝔰𝔩_3` | Eigenvalues `1, −1, 0, 0`: upper triangular. `0,0,3,3,−3,−3`: dimension 6. | holds |
| `positiveCharacterKernel` | `ℝ^×`; `O(1,1)`; swap-extended diagonal group | `{±1}`; `G` (`χ(exp tY) = χ(exp −tY)`); `exp(V₀)` with the antidiagonal `ab = 1`. | holds |
| `dynamicLevi_decomposition` | Block form in an orthonormal eigenbasis; `OᵀSL_2(ℤ)O`; `n = 0` | Bounded iff `g_ij = 0` for `λ_i < λ_j`. `Q ∩ θQ` is block diagonal. `O g Oᵀ = ((2,3),(1,2))`, `(O l Oᵀ)₁₂ = 3/2`: the limit leaves `G`, so the factorization needs the normalization hypothesis, which the statement has. | holds |
| `minimalParabolic_langlands` | `SL_2`; `O(1,1)`; finite `G`; `n = 0` | `((−2,3),(0,−1/2)) = (−1)·diag(2,1/2)·((1,−3/2),(0,1))`. `O(1,1)`: `G = K·P`, `K ∩ P = {±1}`. Finite: `P = M = G`. | holds |
| `exists_conj_minimalParabolic` | `SL_2`, `±H₀`; `O(1,1)`; `GL_2`, two `𝔞` | `((0,−1),(1,0)) ∈ SO(2)`; `k = 1`; `R_{π/4}`. | holds |
| `bruhat_decomposition_linear` | `O(1,1)`; `Aut(𝔰𝔩_3(ℝ))` | `G = P ⊔ dP`; cells meet only for `k⁻¹k' ∈ K ∩ P = M`. Twelve cells. | holds |
| `doubleCoset_cell_coordinates` | `SL_2`, `k = ((0,−1),(1,0))`; `k = 1` | `u = ((1,a/c),(0,1))`, `p = ((c,d),(0,1/c))`, `u k p = ((a,(ad−1)/c),(c,d)) = g`. `k = 1`: `N ∩ N̄ = 1`. | holds |
| `dynamicParabolic_eq_iUnion_doubleCoset` | `O(1,1)`, `H₀ = Y` and `H₀ = 0`; `Aut(𝔰𝔩_3)` | `Y`: only `±1` commute, union `P`; `exp(−tY) d exp(tY) = exp(−2tY) d` unbounded. `0`: union `G`. `σ·Ad(w₀)` fixes `diag(1,0,−1)`. | holds |
| `exists_eq_nonnegEigenspaces_of_le` | `GL_2`; `Σ = ∅`; `SL_3`, `X = diag(1,1,−2)`, `Y = 2X` | `2^{n−1}` block algebras. Same zero set of roots iff same centralizer. | holds |
| `linearComponentCondition_iff` | `O(1,1)`; compact `G` | `d` normalizes `N = 1`, `dPd⁻¹ = P`, `d ∉ M`, `d ∉ P`: all three sides false. Compact: all true. | holds |
| `eq_dynamicParabolic_of_le` | `GL_2`; central `X` under the condition; `O(1,1)` | Under the condition `M` fixes `𝔷_𝔭`, so a central `X` gives `G`. Without it, `0` and `Y` have equal centralizers and parabolics `G ≠ P`. | holds; the hypothesis is needed |
| `exists_titsSystem_linear` | `SO(1,1)(ℝ)` (rank 0); `GL_n` | `B = N = G`, simple set empty, quotient trivial. `P ∩ N_G(𝔞) = MA`. | holds |
| `positiveCharacterKernel_mul_exp` | `GL_n`; `O(1,1)`; swap group | `g = (|det g|^{−1/n} g)·exp((log|det g|/n)·1)`. `F = 0`, `⁰G = G`. `diag(e³,e) = diag(e,e^{−1})·exp(2·1)`. | holds |
| `isSelfAdjointLinearGroup_of_zeroLocus` | `S = ∅`; `SO(1,1)`; `O(1,1)`; unitriangular; `SO(n)` | `GL_n`. `Gℂ ≅ ℂ^×` connected, `G` has two components, `M = {±1}` meets both. `O(2,ℂ)` disconnected, excluded. Not transpose-stable, excluded. Compact, `𝔞 = 0`. | holds |

## Adversarial pass: README targets

| Target | Instances | Values | Result |
|---|---|---|---|
| §1.1 reductivity criterion | `𝔤𝔩_2`; upper triangular `𝔟`; `𝔥 = 0` | `tr(⁅X,Y⁆Zᵀ) = tr(Y⁅Xᵀ,Z⁆ᵀ)`. In `𝔟`: adjoint of `ad E₁₂` sends `E₁₂` to `E₂₂ − E₁₁`; `⁅E₁₂, diag(1,0)⁆ = −E₁₂`. | holds |
| §1.2 conjugacy | `ℝ × S¹`; `ℝ ⋊ C₂`; `SL_2`, `h = diag(2,1/2)` | `θ_c² = id`, `𝔭_c = {(x,cx)}`. `c_{(a/4,0)}(0,1) = (a/2,1)`. `c_aθc_a⁻¹ = c_{aaᵀ}θ`. The map `K' → K` is a bijective homomorphism, so the cocycle is defined on `K`. | holds |
| §2.1 | `BC₁`, `BC₂`, `A₁`, `A₂` | `BC₁` has no `RootPairing.Base` (coroot of `2λ` is half that of `λ`). `Σ_{{e₂}} = {±e₂, ±2e₂}`. | holds |
| §2.2 | `GL_2`, `S` | `Ad(R_φ)S = ((−sin 2φ, cos 2φ),(cos 2φ, sin 2φ))`, `B(·,H) = −2 sin 2φ`. | holds |
| §2.3 | `GL_2`, `H = diag(0,1)` | `exp((π/2)(E₁₂ − E₂₁)) = ((0,1),(−1,0))` carries it to `diag(1,0)`. | holds |
| §2.4 | `O(1,1)`; `N_G(𝔞)` proof | `W_G = ℤ/2`, `W(Σ) = 1`. `e^{2 ad X}` positive and preserving `𝔞` gives `⁅X,𝔞⁆ ⊆ 𝔞 ∩ 𝔨 = 0`. | holds |
| §2.5 | Both directions of the equivalence; `Aut(𝔰𝔩_3)`; `O(4)` | `Stab(Σ⁺) = M` gives `K = MK⁰`, and conversely. `−w₀` fixes `diag(1,0,−1)`, so it is outside `S₃`; `|W_G| = 12`. | holds |
| §2.6, §3.4 | `ℝ × S¹`; rank one | Non-conjugate for `c ≠ c'`; exactly `P` and `θP` contain `MA`. | holds |
| §3.1 | `GL_3`, `𝔰 = ℝ·diag(1,1,−2)`; component-condition step | `L = GL_2 × GL_1`. `k₀ ∈ (K ∩ L)⁰·M`. | holds |
| §3.3 | (c), (e), (f); `O(1,1)`; `GL_2` | `Lie(P)^⊥ = 𝔫`; nilradical of `Lie(P)` is `ℝE₁₂ ⊕ ℝ·1`. `P = G` iff `Σ = ∅` uses `K = MK⁰`. | holds |
| §3.5 | `ℝ × S¹`; `O(1,1)` | Conjugacy only for equal split centres, as stated. | holds |
| §4.1 | `X = m + a + n ∈ 𝔭` | `2m + n + dθn = 0`. `Ad(k⁻¹)H₀ ∈ 𝔞` gives `k ∈ N_K(𝔞)` by dimension. | holds |
| §4.2 | `SL_3`; `SU(2,1)`; `O(1,1)`; `Aut(𝔰𝔩_3)` | Dimensions `5,6,6,7,7,8`. `5 + 3 = 8`. Two open cells, none dense. | holds |
| §5.1 | `ℝ ⋊ C₂`; `ℝ² ⋊ C₂`; `GL_n` | `L = exp(V) ⋊ L₁`; characters are the `L₁`-invariant functionals on `V`; `(3,1) ↦ (2,2)`. | holds |
| §6.1 | Borel–Tits indexing | Source has `θ' ⊆ θ`; the README's `J ⊆ J'` is the Tau Ceti indexing. Check `J = ∅`, `J' = S`, `g = 1` pins it. | holds |
| §6.2 | `GL_2`; `Aut(𝔰𝔩_3)`, `X₁ = diag(3,1,−4)` | `−diag(−4,1,3) = diag(4,−1,−3) ≠ X₁`. | holds |
| §6.3 | `GL_2`, trace-zero upper triangular; `O(1,1)`; `SU(2)` | Borel condition holds but `1 ∉ 𝔮`. `𝔮_ℂ ⊇ 𝔟 + τ𝔟 = 𝔤_ℂ`. | holds |
| §7.2 transport | `X = ((1,1),(0,0))`, `g = I + X` | `gX = Xg = ((2,2),(0,0))`. `θ(g) = ((1/2,0),(−1/2,1))`. `S⁻¹θ(g)S = ((0,1),(−1/2,3/2))`. | holds |
| §8.1 | `SO(2,1)` | `M = {1, diag(1,−1,−1)}`, which meets both components. | holds |
| Sign conventions | `GL_2`, `λ(t) = diag(t,1)` | `λ(e^{−s}) = exp(−sX_λ)`; both conventions give `c = 0`. RealSemisimpleLieGroups' `dynamicalParabolic` has the same sign. | holds |

## Dependency check

    depcheck: 235 roadmaps, 2231 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

## Headline theorems and padding

- **Stated.** §6.1 and the matrix forms of §§2.2, 2.5, 3.3, 3.4, 4.2, 5.1, 6.2, 7.2–7.4 and 8.1 are stated.
- **Not statable.** The module docstring names the abstract forms of Layers 1–5 and §6.2 (carrier: LieGroups' `CartanInvolution` and `IwasawaData`, absent from the pins) and §6.3 (no base change of a Lie subalgebra; `LieRing.ofAssociativeRing` is a `def` with a local instance at the pin, confirmed at `Mathlib/Algebra/Lie/OfAssociative.lean:47,63`).
- **Padding.** None found. All 13 definitions are used by a stated theorem, and no theorem follows from one library lemma.
- **Form.** No `lemma`, `set_option`, `#eval`, `True` placeholder or sorry'd data. Imports are `import Mathlib` and one existing Tau Ceti module.

## Verified sound

- **Declarations read:** 26 of 26 (13 definitions, 13 theorems), each against its README statement and its elaborated type in `scratch/signatures.md`.
- **README targets read:** all of Layers 1–8, Conventions, supplier contracts, Downstream consumers and Worked examples (854 lines).
- **Locators verified against text:** 4.
  - `borel-tits1965` line 1488 (Théorème 4.15, pp. 90–91) and line 1930 (Corollaire 5.18 (ii), p. 101).
  - `brown-fisher-hurtado2022` lines 513–521 (§3.1, equation (1), `Σ⁺ ∪ Span(−Π′)`).
  - `brown-rodriguezhertz-wang2022` lines 132–143 (§1.2, equation (1), `Σ⁺ ∪ Span(Π′)`).
  - `bradlow-collier-garciaprada-gothen-oliveira2024` line 73 (Introduction, `P_Θ`).
- **Checks tested by computation:** about 70, across §§1.1–8.1 (the values are in the two tables above); all correct except the carrier named in S01.
- **Pinned declarations resolved:** 39 Tau Ceti names and 11 Mathlib names, with files; the stated hypotheses of `glTitsSystem` (`[Field k] [Nontrivial kˣ]`), `lieMap_injective` (preconnected source) and `RootPairing.Base` (root and coroot monoid conditions) agree with the pin.
- **Sibling citations checked:** 24.
  - RealSemisimpleLieGroups §§0.2, 1.2, 2.3 and 3.1 read in full against what this README says they state; §§1.3, 3.2–3.3, 4.1–4.5 and 5.4 confirmed to exist under those numbers with that subject, not read line by line; and the names `exists_conj_cartanInvolution`, `exists_titsSystem`, `dynamicalParabolic`, `nonnegEigenSubmodule`, at its open head.
  - AutomorphicFormsOnReductiveGroups §2.3a, at its open head.
  - On main: LieGroups Layers 8–9 with `CartanInvolution`, `FiniteCartanMatrixModel`, `IwasawaData`, `chamber_normalizer_cover`, `iwasawaDecomposition`, `kakDecomposition`, `cartan_polar_decomposition`, `isConj_of_isMaximalTorus`, `exists_monoidHom_of_lieHom`; FlagVarieties §§3.1, 3.2, 5.2; AdelicAlgebraicGroups §2.1; ArithmeticLocallySymmetricSpaces ALS.F.1, ALS.0.1–0.3 with their planned names.
  - The two leads of `scratch/citations.md` (`LocallySymmetric.IsCartanInvolution.transposeInverse`, `LocallySymmetric.realPoints_lieGroup`) are planned names in the ArithmeticLocallySymmetricSpaces README (lines 1187, 581), not missing.
- **Ownership.** `scratch/overlaps.md` lists no second copy, no dropped id and no other pull request changing this roadmap. LieGroups Layer 9 plans the closedness of `N₊` and the Lie-algebra Iwasawa decomposition as targets, so §2.3's use of them is not circular. No `Suggested.lean` name here has the fully qualified name of a declaration in a roadmap I read.
- **Policy.** The pull request changes only `packages/LieGroupsPartII/`. No process words, pull-request numbers or machine paths in the README or docstrings. Every definition has at least three Checks. No gap is declared (`design/plan.json` has `gaps = []`), and none is needed.

## Not verifiable

- `knapp2002`, `bourbaki-lie4-6`, `warner1972`, `wallach1988`: uncertified, text not readable. Their 32 locators (Knapp Ch. VI §§2, 4–5, Ch. VII §§2, 4–5, 7, Lemma 7.73, Proposition 7.76; Bourbaki Ch. IV §2, Ch. V §3 no. 3, Ch. VI §1; Warner Ch. 1 §1.2; Wallach Ch. 2 §§2.1–2.2) are checked only for plausibility. `brown-fisher-hurtado2022` line 521 independently attributes the classification to Knapp's Proposition 7.76.
- Elaboration was not rerun (read-only pass); I relied on `scratch/signatures.md`.
- AutomorphicSpectralTheoryPartII §1.5, KleinianGroups, FuchsianOrbifoldsPartII and ReductiveGroups Layers 7 and 7C are consumer or scope mentions; I relied on `roadmaps resolve` (nothing missing) and did not read those sections in full.

## Source issues

- none

Source independence: 6 passages compared with 4 sources, none shared (longest common run under 8 words, all standard terms); largest share knapp2002, 22 of 41 locators; contents of knapp2002 could not be read, so the arrangement was compared through the README's own locators only (Layer 1 ↔ VI §2, VII §2; Layer 2 ↔ VI §§4–5, VII §§2, 5; Layer 3 ↔ VI §§4–5, VII §§2, 7; Layer 4 ↔ VII §4; Layer 5 ↔ VII §2; Layer 6 ↔ VII §7): not one to one and not in the source's order, independent.

## For the human reviewers

- **Not tested.** `knapp2002` has the largest share of the locators (22 of 41) and its text and table of contents are not in the sources cache. Wording and arrangement were not compared against it, nor against `bourbaki-lie4-6`, `warner1972` and `wallach1988`.
- **Merge order.** RealSemisimpleLieGroups, a supplier in most layers, is an open pull request absent from `merge-order/ORDER.txt`; its §§2.3 and 3.1 need AutomorphicFormsOnReductiveGroups §2.3a (line 63), which follows this roadmap (line 62).
- **Two owners.** AutomorphicFormsOnReductiveGroups §2.3a (open, later in the order) and Layer 3 here both state `P = MAN` with its Langlands decomposition, the latter for a wider class. `packages/LieGroupsPartII/README.md:43` says so; which roadmap cites the other is a placement decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "66663585c710950438646297e8a1267c87f74e89", "job": "RT-LieGroupsPartII~2b", "model": "fable", "worker": "chris-x89"} -->
