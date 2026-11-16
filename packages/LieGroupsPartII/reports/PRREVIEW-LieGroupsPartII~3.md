# Review of LieGroupsPartII (pull request #2427 at e515f2a)

**Verdict:** accepted

No findings. The previous review, of this same head, listed none to repair; the folder is unchanged since (0 lines).

## Verified sound

| Target | Instances tried | Values computed, statement side | Values computed, instance side | Result |
|---|---|---|---|---|
| §1.2 conjugacy of involutions | `ℝ ⋊ ℤ/2`, `θ_a(t, ε) = (−t + aε, ε)`; `ℝ × S¹`, `θ_c` | `g = lieExp(a/4)`: `c_g(t, ε) = (t + aε/2, ε)`, so `c_g θ_0 c_g⁻¹ = θ_a` | `θ_c² = id`, `𝔭_c = {(x, cx)}`; abelian group, so `θ_c ≠ θ_{c'}` are not conjugate | holds; equal split central part is needed |
| §2.1 subsystems, stabilizers | `BC₁`; `A₁` with `𝔰 = 𝔞` | `Σ⁺ = {λ, 2λ}`, `2λ = λ + λ`, so `Π = {λ}` | coroot of `2λ` is `½λ^∨`, outside the ℕ-span: no `RootPairing.Base`; `Stab(0) = W`, pointwise stabilizer `1` | holds; auxiliary point must be generic |
| §2.3 base `IwasawaData` | `GL₂`, `H = diag(0, 1)`; `SL₂` with all of `Σ` | `k = exp((π/2)(E₁₂ − E₂₁)) = ((0,1),(−1,0))`, `kHkᵀ = diag(1, 0)`, in the chamber | `𝔨 ⊕ 𝔞 ⊕ (𝔤^β ⊕ 𝔤^{−β})`: `1 + 1 + 2 = 4 > 3` | holds |
| §2.4 two Weyl groups | `O(1,1)`; `SL₂` | `d = diag(1, −1)`: `dYd = −Y`, so `|W_G| = 2`, `W(Σ) = 1` | `θ(g)⁻¹g = exp(2X)` normalizes `𝔞` ⇒ `[X, 𝔞] ⊆ 𝔞 ∩ 𝔨 = 0`; `N_G(𝔞) = N_K(𝔞)·A` | holds |
| §2.5 component condition | `O(1,1)`; `GL_n`; positive diagonals ⋊ swap | `G = N_K(𝔞)·G⁰` and `K ∩ G⁰ = K⁰` give `G = MG⁰ ⇔ N_K(𝔞) = M·N_{K⁰}(𝔞)` | `O(1,1)`: `M = {±1}`, 2 of 4 components; swap group: `M = 1`, 2 components; `GL_n`: `diag(−1, 1, …) ∈ M` | holds, both directions |
| §3.1 centralizers | `GL₃`, `𝔰 = ℝ·diag(1, 1, −2)` | `L = GL₂ × GL₁`, roots `±(e₁ − e₂)`, 4 components | `M` = 8 sign matrices, meeting all 4: condition inherited | holds |
| §3.4, `exists_conj_minimalParabolic` | `SL₂`, `±H₀`; `O(1,1)`, `±Y` | upper and lower triangular, conjugate by `((0,−1),(1,0)) ∈ SO(2) = K⁰` | `O(1,1)`: both give `P = {±exp(tY)}`, `k = 1 ∈ K⁰ = {1}` | holds without the condition |
| §4.1 fixed points | `SL₂`, `g = w`, `g = ((1,0),(1,1))`; `O(1,1)` | `Ad(w⁻¹)H = −H ∈ Lie(P)` | `g⁻¹Hg = ((1,0),(−2,−1)) ∉ Lie(P)`; fixed points `P, wP`; `O(1,1)`: `P, dP`, `|W_G| = 2` | holds |
| §4.2, `bruhat_decomposition_linear` | `SL₃`; `SU(2,1)`; `O(1,1)` | dimensions `5 + ℓ(w)`: `5, 6, 6, 7, 7, 8`; `5 + 2 + 1 = 8 = dim G` | `O(1,1)`: `G = P ⊔ dP`, both open; union over `W(Σ) = 1` is `P ≠ G` | holds over `W_G` |
| `doubleCoset_cell_coordinates` | `SL₂`, `k = ((0,−1),(1,0))`; `k = 1` | `u = ((1, a/c),(0,1))`, `p = ((c, d),(0, 1/c))` | `u·k·p = ((a, (ad − 1)/c),(c, d)) = g`; `k = 1`: `N ∩ N̄ = 1` forces `u = 1` | holds |
| §5.1 `⁰L` | `ℝ² ⋊ C₂`; `ℝ ⋊ C₂`; `GL_n` | `F = {(u, u)}`, `pr_F(3, 1) = (2, 2)`, residual `(1, −1)` | `ℓ(−t) = ℓ(t)` ⇒ `ℓ = 0`: `⁰L = L`, `F = 0`; `GL_n`: `{|det| = 1}` | holds; only `F` splits |
| §6.1, `conj_standardParabolic_le_iff` | `S = ∅`; rank one, `J = ∅`, `J' = S`, `g = 1` | both sides true for all `g` when `B = G` | LHS `B ⊆ G` true, RHS `∅ ⊆ S ∧ 1 ∈ G` true; `J' ⊆ J` would be false | holds; borel-tits1965 line 1931 |
| §6.2, `dynamicParabolic_eq_iUnion_doubleCoset` | `GL₂`, `X = diag(1,0)`; `O(1,1)`, `H₀ = Y` and `H₀ = 0`; `Aut(𝔰𝔩₃)` | conjugate `((a, e^{−t}b),(e^{t}c, d))`, bounded iff `c = 0` | `exp(−tY)·d·exp(tY) = exp(−2tY)·d` unbounded: `P`; `H₀ = 0`: both sides `G`; `diag(3,1,−4) ↦ diag(4,−1,−3)` | holds |
| §6.3 complexification criterion | `GL₂`, trace-zero upper triangular; `O(1,1)` | contains the Borel of `𝔰𝔩₂(ℂ)`, `1 ∉ 𝔮`, `dim 2 < dim 𝔮_∅ = 3` | not parabolic: centre clause needed; `O(1,1)`: criterion is `𝔮 ⊇ 𝔷` | holds |
| `dynamicLevi_decomposition` | `GL₂`, `X = diag(1,0)`; `OᵀSL₂(ℤ)O` | `((2,3),(0,5)) = diag(2,5)·((1, 3/2),(0,1))` | `OgOᵀ = ((2,3),(1,2))`, `(OlOᵀ)₁₂ = 3/2 ∉ ℤ`: factorization needs normalization; other clauses hold | holds as hypothesized |
| `minimalParabolic_langlands` | `SL₂`; `O(1,1)`; compact `G` | `((−2,3),(0,−½)) = (−1)·diag(2,½)·((1,−3/2),(0,1))` | `O(1,1)`: `G = K·P`, `K ∩ P = {±1} = M`; compact: `P = M = K = G` | holds |
| `exists_eq_nonnegEigenspaces_of_le` | `GL₂`, `H₀ = diag(2,1)`, `X = diag(1,0)`, `Y = 1`; `SL₃` | sums: upper triangular vs all matrices (unequal) | centralizers: diagonal vs all (unequal); `diag(1,1,−2)`, `diag(2,2,−4)`: both equal | iff holds both ways |
| `linearComponentCondition_iff` | `O(1,1)`; `GL₂` | condition false | `d` normalizes `N = 1`, `d ∉ M`; `dPd⁻¹ = P`, `d ∉ P`: all three false; `GL₂`: all true | holds |
| `eq_dynamicParabolic_of_le` | `GL₂`, `Q = G`; `O(1,1)` without `hc` | `Q = G` is the dynamic parabolic of `X = 1` | `0`, `Y`: same centralizer, parabolics `G ≠ P`: excluded by `hc` | holds; `hc` needed |
| `exists_titsSystem_linear` | `GL_n`; `O(1,1)` | `B ∩ N = P ∩ N_K(𝔞)A = MA`, normal in `N_G(𝔞)` | `GL_n`: `TauCeti.glTitsSystem ℝ (n − 1)`; `O(1,1)`: `P` normal, excluded by `hc` | holds |
| §7.4, `positiveCharacterKernel_mul_exp` | swap group; `O(1,1)`; `ℝ^×`; `n = 0` | `diag(e³, e) = diag(e, e⁻¹)·exp(2·1)`, `ab = 1` cuts `⁰G` on both components | `O(1,1)`: `F = 0`, `⁰G = G`; `ℝ^×`: `x = sgn(x)·exp(log|x|)`; `n = 0`: `1 = 1·exp(0)` | holds |
| §8.1, `isSelfAdjointLinearGroup_of_zeroLocus` | `SO(1,1)`; `O(1,1)`; `SO(2,1)` | `Gℂ ≅ ℂ^×` connected, `G = {±exp(tY)}`, `M = {±1}` meets both | `O(2, ℂ)` has two components: excluded; `SO(2,1)`: `M = {1, diag(1,−1,−1)}` | holds; borel-tits1965 line 3750 |
| §3.5 minimal parabolic datum | `ℝ × S¹`, `θ_0`, `θ_1` | RealSemisimpleLieGroups §3.1 lists conjugacy of all triples | fails here; README consumes single-datum statements only and states the restricted clause | consistent |

- **Source locators checked against the text: 5.** borel-tits1965 line 1488 (Théorème 4.15, pp. 90–91), line 1931 (Corollaire 5.18 (ii), p. 101); brown-fisher-hurtado2022 line 518 (§3.1); brown-rodriguezhertz-wang2022 lines 138–141 (§1.2, equation (1)); bradlow-collier-garciaprada-gothen-oliveira2024 line 72 (Introduction). brown-rodriguezhertz-wang2022 lines 143–144 corroborate the numbering of Knapp's Proposition 7.76 and Lemma 7.73.
- **Library declarations opened at the pins: 53.** All Tau Ceti names of the supplier contracts exist, among them `TauCeti/GroupTheory/TitsSystem/Basic.lean:50`, `Bruhat/Length.lean:73, 231`, `Bruhat/Basic.lean:296`, `Bruhat/Uniqueness.lean:111`, `Parabolic/Classification.lean:130, 139`, `Parabolic/Normalizer.lean:77`, `Algebra/Lie/Weights/Borel.lean:439`, `Geometry/Lie/Faithfulness.lean:50`. Mathlib: `LinearAlgebra/RootSystem/Base.lean:68`, `Algebra/Lie/OfAssociative.lean:47, 63` (a `def`, local instance only), `Algebra/Lie/BaseChange.lean:185`, `Analysis/InnerProductSpace/JointEigenspace.lean:137`. `LieRing` and `Bornology` on `Matrix (Fin 2) (Fin 2) ℝ` fail to synthesize, as the README says.
- **No pinned declaration proves §6.1.** `Parabolic/Normalizer.lean:66–83` gives only the case `gPg⁻¹ = P`; `CartanInvolution` and `IwasawaData` occur nowhere at the pins, and no base change of a `LieSubalgebra` exists, as the module docstring says.
- **Cross-roadmap citations resolved: 32.** LieGroups on main (Layers 6–9 and 16 names); RealSemisimpleLieGroups at its open head (§§0.2, 1.2, 1.3, 2.3, 3.1–3.3, 4.1–4.5, 5.4; `exists_conj_cartanInvolution`, `exists_titsSystem`, `dynamicalParabolic`, `nonnegEigenSubmodule`); AutomorphicFormsOnReductiveGroups §2.3a; ArithmeticLocallySymmetricSpaces ALS.F.1, ALS.0.1, ALS.0.2 (the two names the citation tool lists are at its `README.md:581` and `:1187`); FlagVarieties §§3.1, 3.2, 5.2; AdelicAlgebraicGroups §2.1; ReductiveGroups Layers 7, 7C; KleinianGroups and FuchsianOrbifolds Layer 3; AutomorphicSpectralTheoryPartII §1.5; RootSystems "Exact supplier contracts".
- **Gate: every check passes.** Dependency check: `depcheck: 249 roadmaps, 2363 edges, 0 problem(s)`; no change outside the folder.
- **Elaboration: 13 `sorry` warnings and nothing else.** The 26 `#check @` types agree with the README statements; the only section variable is `{n : ℕ}`, kept everywhere. One-tactic probe (`simp`, `rfl`, `infer_instance`, `simp_all`, `aesop`): none of the 13 theorems closes. No `Suggested.lean` name of this folder occurs in another roadmap.
- **Headlines.** Stated: §6.1, §§7.2–7.4, §8.1. Named as not statable: §§1.2, 2.4–2.6, 3.3–3.5, 4.2, 5.1, 6.2 (carrier `CartanInvolution`, `IwasawaData`) and §6.3 (complexified subalgebra).
- **Pull request text.** Title and description read against the head: suppliers, sections and the "adds a roadmap" statement agree with it.

Overlap check: read RealSemisimpleLieGroups, SurfaceGroupCharacterVarieties, BallQuotientsAndComplexHyperbolicLattices, AutomorphicFormsOnReductiveGroups, ShimuraData, LieGroups, FlagVarieties, ReductiveGroups. `P = MAN`: AutomorphicFormsOnReductiveGroups §2.3a (real points) and RealSemisimpleLieGroups §3.1 (connected, semisimple, finite centre), cited; this roadmap owns the remaining data. Tits system, standard parabolics and Langlands decompositions under the component condition: RealSemisimpleLieGroups §§3.3, 4.1–4.4, consumed. Conjugate parabolics of algebraic groups: FlagVarieties; of an arbitrary Tits system: here. SurfaceGroupCharacterVarieties consumes §§7, 8; nothing shared with BallQuotientsAndComplexHyperbolicLattices or ShimuraData.

Source independence: 7 passages compared with 4 sources (borel-tits1965, brown-fisher-hurtado2022, brown-rodriguezhertz-wang2022, bradlow-collier-garciaprada-gothen-oliveira2024), none shared; largest share knapp2002, 22 of 37 locators; knapp2002 is uncertified, its text and table of contents were not read, and contents were compared only through the sections the README cites (Layer 1 ↔ VI §2, VII §2; Layer 2 ↔ VI §§4–5, VII §§2, 5; Layer 3 ↔ VII §2, VI §§4–5, VII §7; Layer 4 ↔ VII §4; Layer 5 ↔ VII §2; Layer 6 ↔ VII §7): not one to one and not in order.

## Not verifiable

- knapp2002 (22 locators: Ch. VI §§2, 4, 5; Ch. VII §§2, 4, 5, 7; Lemma 7.73, Proposition 7.76), in every sampled target: settled as uncertified, no text in the sources cache.
- warner1972 Ch. 1 §1.2 (§§3.3, 4.2) and wallach1988 Ch. 2 §§2.1–2.2 (§§5.1, 7.1, 7.4): uncertified, no text.
- bourbaki-lie4-6 Ch. IV §2 nos. 5–6, Ch. V §3 no. 3, Ch. VI §1 (§§2.1, 4.2, 6.1, 7.3): uncertified, no text.

## Source issues

- none

## For the human reviewers

- Not tested: knapp2002 carries 22 of 37 README locators and is uncertified; neither its wording nor its table of contents was compared with `TauCetiRoadmap/LieGroupsPartII/README.md`.
- Not tested: warner1972, wallach1988 and bourbaki-lie4-6 (10 locators) are uncertified; the README's wording was not compared with them.
