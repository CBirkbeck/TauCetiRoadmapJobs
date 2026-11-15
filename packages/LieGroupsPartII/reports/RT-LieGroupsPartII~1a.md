<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17225#issuecomment-6903401264 -->
Red team round 1 pass a (claude) of 87b4701

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) an API bullet of §7.3 claims compactness and `W_G` with no hypothesis on `G`

   - **Location.** `packages/LieGroupsPartII/README.md:715`: "`orthogonalCentralizer G 𝔞` is a compact
     subgroup of `G`, normal in the compact subgroup `orthogonalNormalizer G 𝔞` of `K`; the quotient
     acts faithfully on `𝔞` by `H ↦ kHkᵀ` and is `W_G` (§2.4)."
   - **Claim.** The API list of §7.3 is for "`G`, a subspace `𝔞`" (line 699) and its other bullets
     carry their own hypothesis ("For closed `G`", "For a self-adjoint linear group"); this one
     carries none.
   - **Witness.** `G = SO(2) ∩ GL_2(ℚ)` (rotations with rational entries), `𝔞 = 0`:
     `orthogonalCentralizer G 0 = orthogonalNormalizer G 0 = G`, countable and dense in `SO(2)`, so
     not compact. `W_G` is defined only for the datum of §7.1.
   - **Repair.** Replace the bullet by: "For closed `G`, `orthogonalCentralizer G 𝔞` is a compact
     subgroup of `G`, normal in the compact subgroup `orthogonalNormalizer G 𝔞` of `K`. For a
     self-adjoint linear group `G` and `IsMaximalAbelianSymmetric G 𝔞`, the quotient acts faithfully
     on `𝔞` by `H ↦ kHkᵀ` and is `W_G` (§2.4). For `k ∈ K`, `kHkᵀ ∈ 𝔞` for all `H ∈ 𝔞` already gives
     `k𝔞kᵀ = 𝔞`, by dimension." On the witness `G` is not closed, so nothing is claimed. No Lean
     declaration changes.

One P3 finding (R01). Every Lean statement was computed on the instances in the table below and
held; every cross-roadmap citation and every pinned declaration named in the README was resolved
at main, at the open heads, or at the pins. The four uncertified books (Knapp, Warner, Wallach,
Bourbaki) could not be read, so their locators are listed under `## Not verifiable`.

## The adversarial pass: record

Notation: `Y = ((0,1),(1,0))`, `d = diag(1,−1)`, `J = ((0,1),(−1,0))`, `τ = σ·Ad(w₀)` in
`Aut(𝔰𝔩₃(ℝ))`. "LCC" is `LinearComponentCondition`. Each row gives the values computed on both
sides.

### Suggested.lean (26 declarations: 13 definitions, 13 theorems)

| Declaration | Context | Instances and computed values | Result |
|---|---|---|---|
| `conj_standardParabolic_le_iff` | `{G} [Group G] (T) (J J') (g)` | `S = ∅`: `P_∅ = G`, both sides true. Rank one, `J = J' = ∅`, `g ∈ BsB`: left false by the axiom `sBs ≠ B`, right false (`g ∉ B`). `J = ∅, J' = S, g = 1`: both true; the reversed inclusion `J' ⊆ J` would be false here. Induction of the sketch: `BwB·Bw⁻¹B ⊇ BsB·BsB = B ∪ BsB` checked. | true |
| `IsSelfAdjointLinearGroup` | `{n}` | `GL_n`: closed, stable, 2 components (1 at `n = 0`). `{diag(2^k, 2^{−k})}`: closed, stable, infinitely many components, fails third clause. `{((1,t),(0,1))}`: fails second clause. | determines its object |
| `linearLieAlgebra` | `{n}` | `G = {1} ≤ GL_2`, `X = 2πJ`: `exp(X) = 1 ∈ G` but `exp(X/4) = J ∉ G`, so `X` excluded. `SL_n`: `E₁₁` excluded, `det exp(tE₁₁) = e^t`. | determines its object |
| `IsMaximalAbelianSymmetric` | `{n}` | `GL_2`: diagonal accepted; `ℝ·d` rejected (`1` symmetric, commutes, not in it). Finite `G`: only `𝔞 = 0`. | determines its object |
| `IsRegularElement` | `{n}` | `GL_2`, diagonal `𝔞`: `diag(1,0)` regular; `1` not (`E₁₂` commutes with `1`, not with `diag(1,0)`). `O(1,1)`: `0` regular since `Σ = ∅`. | determines its object |
| `orthogonalCentralizer` | `{n}` | `SL_2`: `Ad(R_φ)d = ((cos 2φ, sin 2φ),(sin 2φ, −cos 2φ))`, equal to `d` iff `R_φ = ±1`. `𝔞 = 0`: `M = K`. | determines its object |
| `orthogonalNormalizer` | `{n}` | `SL_2`: `{±1, ±((0,−1),(1,0))}`; `R_{π/4}` sends `d` to `Y ∉ 𝔞`. `O(1,1)`: all four elements of `K`. | determines its object |
| `dynamicParabolic` | `{n}` | `GL_2`, `X = diag(1,0)`: entries `a, e^{−t}b, e^{t}c, d`; bounded iff `c = 0`. `X = diag(0,1)`: lower triangular. `X = J`: all of `G`. | sign pinned |
| `dynamicUnipotent` | `{n}` | Same `X = diag(1,0)`: limit `1` iff `a = d = 1, c = 0`. `X = J`: periodic family, so `{1}`. `X = 0`: `{1}`. | sign pinned |
| `dynamicLevi` | `{n}` | `X = diag(1,0)`: diagonal group. `X = 0`: `G`. | ok |
| `minimalParabolic` | `{n}` | `SL_2`, `H₀ = d`: upper triangular; `((−2,3),(0,−1/2)) = (−1)·diag(2,1/2)·((1,−3/2),(0,1))` recomputed. `−H₀`: lower triangular. `O(1,1)`: `{±exp(tY)}`, index 2. Compact `G`: `P = G`. | sign pinned |
| `LinearComponentCondition` | `{n}` | `GL_n`, `n ≥ 1`: `diag(−1,1,…,1) ∈ M`, holds. `O(1,1)`: `M = {±1}` meets 2 of 4 components, fails. `O(p,q)`: block determinants of `M` are `(Πε·det k', Πε)`; all four values iff `p ≠ q`. | determines its object |
| `nonnegEigenspaces` | `{n}` | `Y = diag(1,0)`: eigenvalues `1, −1, 0, 0` on `E₁₂, E₂₁, E₁₁, E₂₂`; sum is upper triangular. `Y = diag(1,1,−2)`: `0,0,3,3,−3,−3`; meets `𝔰𝔩₃` in dimension 6. | sign pinned |
| `positiveCharacterKernel` | `{n}` | `GL_1`: `{±1}`. `GL_n`: `{|det| = 1}`. `O(1,1)`: `χ(exp tY) = χ(d exp(tY) d) = χ(exp(−tY))`, so all of `G`. | determines its object |
| `dynamicLevi_decomposition` | `G` closed, `hGt`, `hX : Xᵀ = X`; normalization only in the last clause | In an orthonormal eigenbasis the three sets are `G ∩` block triangular, block unipotent, block diagonal. `GL_2`, `diag(1,0)`: `((2,3),(0,5)) = diag(2,5)·((1,3/2),(0,1))`. `X = J` (not symmetric): parabolic `G`, unipotent `{1}`, fails, so `hX` needed. `G = OᵀSL_2(ℤ)O`, `O` rotation by `π/6`, `g = ((2+√3,2),(0,2−√3))`: recomputed `OgOᵀ = ((2,3),(1,2)) ∈ SL_2(ℤ)` and `(O·diag(2+√3,2−√3)·Oᵀ)₁₂ = 3/2`, so the limit leaves `G`; the normalization hypothesis is needed and the Lean has it. | true |
| `minimalParabolic_langlands` | `hG, h𝔞, hH₀` | `O(1,1)`: `G = K·P`, `K ∩ P = {±1} = M`. Compact or finite `G`: `𝔞 = 0`, `N = {1}`, `P = M = K = G`. `n = 0`: trivial group, all four clauses hold. Uniqueness: `M ∩ exp 𝔞 = 1` (orthogonal and positive definite), `M exp(𝔞) ∩ N = 1` (block diagonal and block unipotent). | true |
| `exists_conj_minimalParabolic` | `hG, h𝔞, h𝔞', hH₀, hH₀'` | `SL_2`, `(ℝd, d)` and `(ℝd, −d)`: `k = ((0,−1),(1,0)) ∈ SO(2)`. `O(1,1)`, `K⁰ = 1`: `(ℝY, ±Y)` give the same `P`, `k = 1`. `GL_2`: `R_{−π/4}` carries `ℝ·1 ⊕ ℝY` onto the diagonal. | true |
| `bruhat_decomposition_linear` | `hG, h𝔞, hH₀` | `O(1,1)`: `G = P ⊔ dP`; cells meet only if `k⁻¹k' ∈ {±1}`. `Aut(𝔰𝔩₃(ℝ))`: 12 cells for `|W_G| = 12`. Compact `G`: one cell. | true without LCC |
| `doubleCoset_cell_coordinates` | `hG, h𝔞, hH₀` | `SL_2`, `k = ((0,−1),(1,0))`, `g = ((a,b),(c,d))`, `c ≠ 0`: `u = ((1,a/c),(0,1))`, `p = ((c,d),(0,1/c))`, product recomputed with `ad − bc = 1`. `k = 1`: `N ∩ N̄ = 1`. Uniqueness uses `N̄ ∩ P = 1` (block lower unipotent and block upper triangular). | true |
| `dynamicParabolic_eq_iUnion_doubleCoset` | `hG, h𝔞, hH₀` | `⊆`: `g = u k p`, so `k` is orthogonal and block upper triangular, hence block diagonal. `Aut(𝔰𝔩₃)`, `H₀ = ad diag(1,0,−1)`: `τ` fixes it (`−w₀(1,0,−1) = (1,0,−1)`), union is `P ⊔ τP`. `diag(3,1,−4)`: `τ` gives `(4,−1,−3)`, not a permutation of `(3,1,−4)`, union is `P`. | true |
| `exists_eq_nonnegEigenspaces_of_le` | `hG, h𝔞, hH₀` | `GL_n`: `2^{n−1}` block algebras. `SL_3`: `diag(1,1,−2)` and `diag(2,2,−4)` same centralizer, same sum. `GL_2`: `0` and `1` same centralizer, same sum `𝔤`. `O(1,1)`: `𝔮₀ = 𝔤`. The hypothesis `𝔮₀ ⊆ nonnegEigenspaces X` forces `β(X) ≥ 0` on `Σ⁺`. | true without LCC |
| `linearComponentCondition_iff` | `hG, h𝔞, hH₀` | `O(1,1)`: LCC false; `d` normalizes `N = 1` and `d ∉ M`; `dPd⁻¹ = P`, `d ∉ P`: all three false. `GL_2`: all three true. Both directions of `G = MG⁰ ⟺ Stab(Σ⁺) = M` rederived from `G = N_K(𝔞)G⁰` and simple transitivity. | true |
| `eq_dynamicParabolic_of_le` | adds `hc` | `O(1,1)` (no LCC): `0` and `Y` have the same centralizer and parabolics `G ≠ P`, so `hc` is needed. `Aut(𝔰𝔩₃)`: first clause fails without `hc`. `Σ = ∅` with LCC: `P = G`. | true |
| `exists_titsSystem_linear` | adds `hc` | `O(1,1)`: `P` normal, no Tits system, excluded by `hc`. `Σ = ∅` with LCC (compact `G`, `ℝ^×`): `B = N = G`, `S = ∅`, the pinned structure admits it. | true |
| `positiveCharacterKernel_mul_exp` | `hG` | `GL_n`: `g = (|det g|^{−1/n} g)·exp((log|det g|/n)·1)`, `n ≥ 1`. Swap-extended positive diagonal group: `diag(e³,e) = diag(e,e⁻¹)·exp(2·1)`. `O(1,1)`: `F = 0`. Uniqueness: `exp(F) ∩ ⁰G = 1` through `ℓ ∘ h`. | true |
| `isSelfAdjointLinearGroup_of_zeroLocus` | own binders, outside the section | `SO(1,1)`: complex points `≅ ℂ^×` connected, real points 2 components, `M = {±1}` meets both. `O(1,1)`: complex points `O(2,ℂ)` disconnected, excluded. `SO(2,2)`: `M ∋ diag(ε,ε)` with block determinants `(−1,−1)`. `S` containing a nonzero constant: no `Gℂ`, vacuous. | true |

Elaborated types: `scratch/signatures.md` (26 entries) was compared line by line with the README
statements; every hypothesis is an explicit binder, none depends on a section variable other than
`{n : ℕ}`, and no type differs from the README. I ran no Lean.

### README targets (33 plan targets, §§1.1–8.1)

| Target | Instances and computed values | Result |
|---|---|---|
| §1.1 datum, reductivity criterion | `𝔟 ⊆ 𝔤𝔩₂`: adjoint of `ad E₁₂` sends `E₁₂ ↦ E₂₂ − E₁₁`, `⁅E₁₂, diag(1,0)⁆ = −E₁₂`. `SU(2)`: `exp(πJ) = −1 ∈ K`. Polar decomposition for finitely many components rederived: `exp(2mX₀) ∈ G⁰` forces `X₀ ∈ 𝔭`. | ok |
| §1.2 conjugacy | `ℝ ⋊ ℤ/2`: `θ_a` is an automorphism (all four parity cases), `K_a = {(0,0),(a/2,1)}`, `(a/4,0)(0,1)(−a/4,0) = (a/2,1)`. `ℝ × S¹`: `θ_c² = 1`, `𝔭_c = {(x,cx)}`. `SL_2`: `c_aθc_a⁻¹ = c_{aaᵀ}θ`. `exp(X)exp(Z) = exp(Z)exp(X)` since `Z` is central. | ok |
| §2.1 | `BC₁`: no `RootPairing.Base` (coroot of `2λ` is half that of `λ`). `BC₂`: `Σ_{{e₂}} = {±e₂, ±2e₂}`. | ok |
| §2.2 | `Ad(R_φ)Y = ((−sin 2φ, cos 2φ),(cos 2φ, sin 2φ))`, `B(·, d) = −2 sin 2φ`, maximal at `−π/4`. | ok |
| §§2.3–2.4 | `exp(c(E₁₂ − E₂₁))` at `c = −π/2` is `((0,−1),(1,0))`. `N_G(𝔞) = N_K(𝔞)A` argument rechecked. | ok |
| §2.5 | Four equivalent forms rederived. Axiom (v) route: maximality of `𝔱_𝔲` recomputed from `[a + ib, iH]`. `O(4)`: holds, (v) fails. | ok |
| §§2.6, 3.1–3.5 | `GL_3`, `𝔰 = ℝ·diag(1,1,−2)`: `L = GL_2 × GL_1`. `GL_2`: nilradical of `Lie(P)` is 2-dimensional, `B`-orthogonal is `ℝE₁₂`. `O(1,1)`: `N_G(P) = G ≠ P`. | ok |
| §§4.1–4.2 | Dimensions `5,6,6,7,7,8` for `SL_3`; `SU(2,1)`: `5 + 3 = 8`. Limit argument for disjointness rechecked. | ok |
| §5.1 | `ℝ² ⋊ C₂`: `(3,1) ↦ (2,2)`. `h` is a homomorphism on `G⁰` since `G_ss T ∩ exp V = 1`. | ok |
| §§6.1–6.3 | See the Lean rows. `GL_2`, trace-zero upper triangular `𝔮`: Borel condition holds, `1 ∉ 𝔮`, not parabolic. | ok |
| §§7.1–7.4, 8.1 | Transport without symmetry: `θ(g) = ((1/2,0),(−1/2,1))`, `S⁻¹θ(g)S = ((0,1),(−1/2,3/2))`. `SO(2,1)`: `M = {1, diag(1,−1,−1)}`. | ok, except R01 |

## Verified sound

- **Declarations read:** 26 of 26. **Targets read:** 33 of 33, with every line of the README.
- **Checks tested:** 127 Check bullets read, about 60 recomputed, none false. Every definition has
  at least three discriminating Checks.
- **Pinned declarations:** 40 Tau Ceti names and 11 Mathlib names of the supplier contracts resolved
  at the pins, with the stated files and hypotheses. Confirmed in particular:
  `LieRing.ofAssociativeRing` is a `def` used as a local instance; nothing in
  `GroupTheory/TitsSystem/` proves the containment form of §6.1; no `CartanInvolution` or
  `IwasawaData` at the pins; no base change of a Lie subalgebra.
- **Sibling citations checked:** 28 section citations and 20 declaration names, all found.
  - LieGroups on main: Layers 0–9 and the 14 names cited.
  - RealSemisimpleLieGroups at its open head: §§0.2, 1.2, 1.3, 2.3, 3.1–3.3, 4.1–4.5, 5.4,
    `exists_conj_cartanInvolution`, `exists_titsSystem`, `dynamicalParabolic`, `nonnegEigenSubmodule`.
  - AutomorphicFormsOnReductiveGroups §2.3a; ArithmeticLocallySymmetricSpaces ALS.F.1, ALS.0.1–0.3
    with the two names of `scratch/citations.md`, both present in its README.
  - AdelicAlgebraicGroups §2.1; FlagVarieties §§3.1, 3.2, 5.2; ReductiveGroups Layers 7 and 7C;
    RootSystems "Exact supplier contracts"; AutomorphicSpectralTheoryPartII §1.5.
- **Ownership:** no declaration of `Suggested.lean` shares a name with any roadmap on main or at an
  open head. The matrix definitions are stated in the README as readings of
  RealSemisimpleLieGroups' Lie-group objects, in a different namespace.
- **Locators verified against text:** 5. `borel-tits1965` line 1488 (Théorème 4.15, pp. 90–91) and
  line 1930 (Corollaire 5.18 (ii), p. 101); `brown-rodriguezhertz-wang2022` lines 132–144 (§1.2,
  equation (1)); `brown-fisher-hurtado2022` lines 499–521 (§3.1);
  `bradlow-collier-garciaprada-gothen-oliveira2024` lines 71–76 (Introduction).
- **Headlines and padding:** the 13 theorems are the statable headlines; none follows from one
  pinned lemma. The module docstring names the abstract forms of Layers 1–5 and §6.2, and §6.3, as
  not statable, with the missing carriers; both reasons hold at the pins.
- **Policy:** the pull request changes only `packages/LieGroupsPartII/`; no `lemma`, `set_option`,
  `#eval`, pull-request number or process narrative; imports are `import Mathlib` and one existing
  Tau Ceti module. No gaps are declared and `design/plan.json` has `"gaps": []`.
- **Dependency check output:** `depcheck: 237 roadmaps, 2244 edges, 0 problem(s)`.

## Not verifiable

- `knapp2002`, `warner1972`, `wallach1988`, `bourbaki-lie4-6` are uncertified: 31 locators (22, 2,
  3, 4) were not checked against text. The Knapp chapter and section numbers agree with the
  book's published contents listing as I recall it; that is not a text check.
- Merge order: RealSemisimpleLieGroups is not in `merge-order/ORDER.txt`, so the dependency check
  cannot see its edges. At its open head its §§2.3, 3.1 and 4.5 need
  AutomorphicFormsOnReductiveGroups §2.3a, which the order lists at line 63, after this roadmap at
  line 62. There is no cycle: neither of those two cites this roadmap. This roadmap can merge only
  after both.
- Whether RealSemisimpleLieGroups §3.1 counts the conjugacy of all triples as part of a "minimal
  parabolic datum" is not settled by its text. The README's §3.5 states its own clause (equal split
  central parts) and consumes only single-datum statements; I found no consumed statement that
  needs the stronger clause.

## Source issues

- **Misprint** in brown-rodriguezhertz-wang2022 at §1.2, preprint p. 3 (line 133): the source says a positive root is simple when it is not a linear combination of other positive roots; it should be: when it is not a sum of two positive roots (in `A₂`, `α₁ = (α₁+α₂) − α₂`); affects nothing.

Source independence: 8 passages compared with 4 sources, none shared; largest share knapp2002, 22 of 39 locators; contents compared with knapp2002 by the cited section numbers only (its text could not be read): independent, since Ch. VII §2 recurs in five layers and §7 material precedes §4 material.

## For the human reviewers

- **Not tested.** `knapp2002` has the largest share of the locators (22 of 39) and is uncertified
  in `packages/LieGroupsPartII/sources.toml`: wording and arrangement were not checked against its
  text.
- **Scope.** The statements without the component condition (README §§4.2, 5.1, 6.2 (i), 7.3
  `linearComponentCondition_iff`) cite Knapp and Wallach for the special case and are proved by the
  roadmap's own arguments; I located no refereed source stating the general forms.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "87b47010b16138a26337fd0bb36974e5e2ba4060", "job": "RT-LieGroupsPartII~1a", "model": "fable", "worker": "chris-x79"} -->
