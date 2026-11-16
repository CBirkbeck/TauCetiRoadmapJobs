# Review of LieGroupsPartII (pull request #2427 at aa066e2)

**Verdict:** needs changes

## R01 (P3) — Pinned Tau Ceti declarations supplied as LieGroups targets

**Location** `TauCetiRoadmap/LieGroupsPartII/README.md:107`: "Layers 0–3: `lieExp`, `oneParameterSubgroup`, `Ad`, … `lieSubalgebraOfSubgroup`, `isEmbeddedLieSubgroup_of_isClosed`, `lieMap`". The Dependencies and *Needs:* lines 205, 374, 390, 426, 479, 650 and 784 repeat "LieGroups … Layer 2 (`isEmbeddedLieSubgroup_of_isClosed`)" and similar.

**Claim** All six exist at the pinned Tau Ceti. The supplier contract has to cite them there, by name and file, not as LieGroups targets.

**Witness** `TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed` (`TauCeti/Geometry/Lie/Subgroup/Embedded.lean:157`), `TauCeti.Lie.lieSubalgebraOfSubgroup` (`Subgroup/LieAlgebra.lean:277`), `TauCeti.Lie.Ad` (`Adjoint/Derivation.lean:62`), `lieExp` and `oneParameterSubgroup` (`Exponential/Basic.lean:140, 187`), and `lieMap` (`Functor.lean:184`).

**Repair**
- Add this bullet under "From Tau Ceti": "`lieExp` and `oneParameterSubgroup` (`TauCeti/Geometry/Lie/Exponential/Basic.lean`), `TauCeti.Lie.Ad` (`TauCeti/Geometry/Lie/Adjoint/Derivation.lean`), `lieMap` (`TauCeti/Geometry/Lie/Functor.lean`), `TauCeti.Lie.lieSubalgebraOfSubgroup` (`TauCeti/Geometry/Lie/Subgroup/LieAlgebra.lean`) and the closed-subgroup theorem `TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed` (`TauCeti/Geometry/Lie/Subgroup/Embedded.lean`) are the exponential, the adjoint action, the Lie functor and the Lie algebra of a closed subgroup."
- In line 107, keep from LieGroups Layers 0–3 only the `𝔤`-form of `Ad(lieExp X) = exp(ad X)` and the matrix shadows.
- In the listed *Needs:* and Dependencies lines, replace "LieGroups Layer 2 (`isEmbeddedLieSubgroup_of_isClosed`)" with "Tau Ceti `TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed`". Treat `lieExp`, `Ad`, `lieMap` and `lieSubalgebraOfSubgroup` the same way.

## R02 (P3) — Knapp and Wallach cited for the case they do not cover

**Location** `TauCetiRoadmap/LieGroupsPartII/Suggested.lean:357–359`: "the components of `G` may move the split centre, and only its `G`-fixed part `F` splits off (Knapp 2002, Ch. VII §2; Wallach 1988, Ch. 2 §2.2)". The same pairing appears at `README.md:527`, where Knapp is given without any restriction.

**Claim** Neither source covers a datum whose components move the split centre, so the general statement has no source. The docstring is attached to exactly that general statement.

**Witness** README §5.1 (line 527) itself limits Wallach to "the trivial-action specialization". README §2.5 has Knapp's axiom (v) imply the component condition, and the last bullet of §5.1 gives `F = V` under that condition. So in Knapp's class, `F = V` always holds.

**Repair** In both places, write: "(Knapp 2002, Ch. VII §2, and Wallach 1988, Ch. 2 §2.2, for data whose components fix `𝔷(𝔩) ∩ 𝔭_L`; the general case is proved here by the averaging route of §5.1)".

## R03 (P3) — Description promises a dependency list it does not give and misclassifies AutomorphicFormsOnReductiveGroups

**Location** Pull-request description, third and fourth paragraphs:
- "Dependencies (the roadmaps the README cites by name and section, and what they in turn need; the Lean imports none of them)."
- "everything else named in the README is a consumer, not a prerequisite."

**Claim** No list follows the first sentence. The second is false for AutomorphicFormsOnReductiveGroups: the README names it at lines 3, 14, 43, 390, 418 and 819. It is not on main, and it consumes nothing here.

**Witness** RealSemisimpleLieGroups §3.1 (README at its head, line 839) has "*Needs:* … AutomorphicFormsOnReductiveGroups §2.3a". So that roadmap is a transitive prerequisite. `roadmaps grep --fixed LieGroupsPartII` finds no roadmap citing this one.

**Repair** Replace both sentences with:

> Dependencies: LieGroups (main; Layers 0–3, 6, 7, 9), RootSystems (main; its supplier-contract record only), ArithmeticLocallySymmetricSpaces (main; ALS.F.1, ALS.0.1, ALS.0.2) and RealSemisimpleLieGroups (#2229; §§0.2, 1.2, 2.3, 3.1–3.3, 4.1–4.4). RealSemisimpleLieGroups §§2.3, 3.1 and 4.5 in turn need AutomorphicFormsOnReductiveGroups §2.3a (#1037), so #1037 merges before #2229 and both merge before this one. AutomorphicFormsOnReductiveGroups is also named as the owner of `P = MAN` for real points and is not consumed here. KleinianGroups, FuchsianOrbifolds and AutomorphicSpectralTheoryPartII are named as consumers.

## Verified sound

| Target | Instances tried | Statement side | Values computed on the instance | Result |
|---|---|---|---|---|
| §1.1 reductive Cartan datum | `GL₂`; `SU(2)`, `θ = Ad(diag(i,−i))` | `B` positive on `𝔭`, negative on `𝔨`; polar map injective | `B(diag(1,−1),diag(1,−1)) = 2`, `B(J,J) = −2`; `SU(2)`: `lieExp(πY) = −1 ∈ K`, so `(1,πY)` and `(−1,0)` collide | holds; `SU(2)` excluded |
| §1.2 conjugacy, equal split centre | `SL₂`, `h = diag(2,½)`; `ℝ ⋊ ℤ/2`; `ℝ × S¹` | `θ′ = c_g θ c_g⁻¹`, `g = lieExp X·lieExp Z ∈ G⁰` | `c_hθc_h⁻¹ = c_{diag(4,¼)}∘θ`, `g = h`; `c_{(a/4,0)}θ₀c⁻¹(t,ε) = (−t+aε,ε) = θ_a`; `θ_c²=id`, `𝔭_c = {(x,cx)}` | holds; non-conjugacy control correct |
| §2.4 two Weyl groups | `O(1,1)`; `SL₂` | `N_G(𝔞) = N_K(𝔞)·A`, `W(Σ) ⊴ W_G` | `O(1,1)`: `W(Σ)=1`, `diag(1,−1)` acts by `−1`, `|W_G| = 2`, `M = {±1}`; `SL₂`: `((0,−1),(1,0))` sends `diag(1,−1) ↦ −diag(1,−1)` | holds |
| §2.5 component condition | `O(p,q)`; `Aut(𝔰𝔩₃(ℝ))`; `O(4)` | condition ⟺ `W_G = W(Σ)`; (v) ⟹ condition | `M = {diag(ε,k′,ε)}`, block dets `(Πε·det k′, Πε)`: four values iff `p > q`; `σAd(w₀)`: `diag(h) ↦ −diag(h₃,h₂,h₁)`, `|W_G| = 12`; `O(4)`: (v) fails, condition holds | holds; strictness witnessed |
| §3.2 `M`, `N`, `P` | `SL₂`; `SL₂(ℂ)` | `P = MAN`, `Z(G) ⊆ MA` | `(sgn a)·diag(|a|,|a|⁻¹)·((1,b/a),(0,1)) = ((a,b),(0,a⁻¹))`; `M`-factor of `((−2,3),(0,−½))` is `−1`; `dim N = 2 = m_α` | holds |
| §3.3 Langlands (a)–(f) | `GL₂`; `O(1,1)` | (e) `𝔫 = Lie(P)^⊥`; (f) `P = N_G(P)` under the condition | `𝔟^⊥ = ℝE₁₂` since `B(𝔤^β,𝔤^γ) = 0` unless `β+γ = 0`; nilradical `ℝE₁₂ ⊕ ℝ1`, dim 2; `O(1,1)`: `N_G(P) = G ≠ P` | holds; (f) hypothesis needed |
| §3.4 one conjugacy class | rank one; `ℝ × S¹` | single `G⁰`-class, equal split centre | `W_G ⊆ {±1}` on one-dimensional `𝔞`, so minimal parabolics `⊇ MA` are `P, θ(P)`; `ℝ × S¹`: `P = G` for every `c` | holds |
| §5.1 `⁰L` and split component | `ℝ² ⋊ C₂` (swap); `GL_n`; `ℝ ⋊ C₂` | `⁰L × lieExp(F) ≅ L` | `(3,1) = (2,2)+(1,−1)`, `h = (2,2)`, `⁰L = V₀ ⋊ C₂`; `h(g) = (log|det g|/n)·1`; `ℓ(−t) = ℓ(t)` gives `F = 0` | holds; locator R02 |
| §6.1 / `conj_standardParabolic_le_iff` | `S = ∅`; rank one; induction step | `gP_Jg⁻¹ ⊆ P_{J′}` ⟺ `J ⊆ J′ ∧ g ∈ P_{J′}` | `S = ∅`: `W = 1`, `B = G`; `J = ∅, J′ = S, g = 1`: reversed inclusion `S ⊆ ∅` false; `BwB·Bw⁻¹B ⊇ BsB·BsB = B ∪ BsB` | holds; matches Borel–Tits 5.18(ii) |
| §6.2 dynamical description | `GL₂`, `X = diag(1,0)`; `Aut(𝔰𝔩₃)`, `X₀`, `X₁` | regular `Q(X) = ⨆ PkP` over `wX = X` | conjugate entries `a, e^{−t}b, e^{t}c, d`; `σAd(w₀)X₀ = X₀`; `X₁ = diag(3,1,−4) ↦ diag(4,−1,−3) ≠ X₁` | holds |
| §6.3 complexification criterion | `GL₂`, `𝔮 = 𝔟 ∩ 𝔰𝔩₂`; `Aut(𝔰𝔩₃)` | parabolic ⟺ `𝔮 ⊇ 𝔷` and Borel `⊆ 𝔮_ℂ ∩ [𝔤,𝔤]_ℂ` | Borel holds, `1 ∉ 𝔮`, `dim 2 ∉ {3,4}`; `σ(𝔮_{α₁}) = {X₁₃ = X₂₃ = 0} = Ad(w₀)𝔮_{α₂}` | holds; centre clause necessary |
| §7.1 self-adjoint linear groups | `{1} ⊂ GL₂`, `X = 2πJ`; `⟨diag(2,½)⟩` | `𝔤` tests all real `t`; finiteness field | `exp X = 1`, `exp(X/4) = J ∉ G`; discrete group: `𝔤 = 0`, `K = {1}`, polar image `{1} ≠ G` | holds; fields necessary |
| §7.2 / `dynamicLevi_decomposition` | `OᵀSL₂(ℤ)O`, `X = diag(1,0)`; `X = ((1,1),(0,0))`; skew `X` | factorization needs normalization; same-`G` transport needs symmetry | `OgOᵀ = ((2,3),(1,2))`; `(OlOᵀ)₁₂ = 1.5`, so `l ∉ G`; `S⁻¹θ(g)S = ((0,1),(−½,3/2))`, entry `2.72, 148.4` at `t = 1, 5` | holds |
| `minimalParabolic_langlands` | compact `G`; `GL₂` with `𝔞 = 0`; `O(1,1)` | unique `m·exp H·u`; `G = KP`; `K ∩ P = M` | compact: `P = M = G`; `𝔞 = 0`: `P = O(2) ∌ 2·1` (maximality hypothesis present); `O(1,1)`: `K ∩ P = {±1}` | holds |
| `exists_conj_minimalParabolic` | `SL₂`, `(𝔞, ±H₀)`; `GL₂`, two `𝔞` | `k ∈ K⁰`, `k𝔞kᵀ ⊆ 𝔞′`, `P′ = kPk⁻¹` | `((0,−1),(1,0))` swaps upper and lower triangular; `R_{π/4}diag(1,−1)R_{π/4}ᵀ = ((0,1),(1,0))` | holds |
| `bruhat_decomposition_linear` | `O(1,1)`; `Aut(𝔰𝔩₃)` | `G = ⋃ PkP`; cells disjoint modulo `M` | `G = P ⊔ dP`, `k⁻¹k′ ∈ K ∩ P = {±1}`; disjointness: `a_t·ukP → kP` as `t → −∞` in Hausdorff `G/P` | holds without condition |
| `doubleCoset_cell_coordinates` | `SL₂`, `k = ((0,−1),(1,0))`; `k = 1` | unique `(u,p)`, `k⁻¹uk ∈ N̄` | `u = ((1,a/c),(0,1))`, `p = ((c,d),(0,1/c))`, `ukp = ((a,(ad−1)/c),(c,d)) = g`; `N ∩ N̄ = {1}` | holds |
| `dynamicParabolic_eq_iUnion_doubleCoset` | general `w`; `Aut(𝔰𝔩₃)`, `X₀` | union over `k` commuting with `H₀` | `exp(−tH₀)n_w exp(tH₀) = n_w exp(t(H₀ − w⁻¹H₀))`; bounded ⟹ `≤ 0` with trace `0`, so `= 0` | holds |
| `exists_eq_nonnegEigenspaces_of_le` | `SL₃`: `diag(1,1,−2)`, its double, `diag(1,0,−1)`; `O(1,1)` | equal sums ⟺ equal centralizers | first two: same centralizer, sum of dim `2+2+2 = 6`; third differs; `O(1,1)`: `𝔮₀ = 𝔤` | holds |
| `linearComponentCondition_iff` | `O(1,1)`; compact `G` | three forms equivalent | `O(1,1)`: `d` normalizes `N = {1}`, `d ∉ M`; `dPd⁻¹ = P`, `d ∉ P`: all three false; compact: all true | holds |
| `eq_dynamicParabolic_of_le` | `O(1,1)` (no condition); `GL_n` | under condition: `dynPar(H₀) = P`, overgroups, centralizer criterion | `Z_𝔤(0) = Z_𝔤(Y) = 𝔤` but `dynPar(Y) = P ≠ G = dynPar(0)`; `GL_n`: `2^{n−1}` block parabolics | holds; hypothesis needed |
| `exists_titsSystem_linear` | compact `G`; `Aut(𝔰𝔩₃)` | `B = P`, `N = N_G(𝔞)` | compact: `B = N = G`, simple reflections `∅`, `W = 1`; `Aut`: quotient of order `12`, simple reflections generate `6` | holds; condition needed |
| §7.4 / `positiveCharacterKernel_mul_exp` | `O(1,1)`; `ℝ^× × ℝ^×`; swap group | `g = l·exp X`, unique, `X ∈ F` | `F = 0`, `⁰G = G`; `diag(2,½) = 1·exp(diag(log 2, −log 2))`; `diag(e³,e) = diag(e,e⁻¹)·exp(2·1)` | holds; locator R02 |
| §8.1 / `isSelfAdjointLinearGroup_of_zeroLocus` | `SO(1,1)`; `O(1,1)`; `SO(2,1)` | connected `Gℂ` ⟹ condition | `Gℂ ≅ ℂ^×`, `G` has two components, `M = {±1}`; `O(2,ℂ)` disconnected, excluded; `M = {1, diag(1,−1,−1)}` | holds |
| Supplier contract line 107 (R01) | pinned Tau Ceti | "LieGroups Layers 0–3" supply `lieExp`, `Ad`, `lieMap`, closed-subgroup theorem | all six declarations found at the pin, files as in R01 | R01 |

- **Source locators checked against the text: 5 of 5 readable, all supporting the statements as written.** borel-tits1965 line 1488 (Théorème 4.15, pp. 90–91) and line 1930 (Corollaire 5.18 (ii), p. 101); brown-fisher-hurtado2022 line 518 (§3.1, eq. (1)); brown-rodriguezhertz-wang2022 line 140 (§1.2, eq. (1)); bradlow-collier-garciaprada-gothen-oliveira2024 line 73 (Introduction).
- **Library declarations opened at the pins: 46 in Tau Ceti and 17 in Mathlib, every cited name present.** "Lacks" claims confirmed: no conjugation lemma in `GroupTheory/TitsSystem/`, no `Bornology (Matrix …)`, and `LieRing.ofAssociativeRing` is a `def` (`OfAssociative.lean:47`).
- **Cross-roadmap citations resolved: 32.** RealSemisimpleLieGroups §§0.2, 1.2, 1.3, 2.3, 3.1–3.3, 4.1–4.5, 5.4 and its four Lean names, at the head of #2229. LieGroups Layers 0–3, 6, 7, 9 and the `IwasawaData` fields of its `Suggested.lean`. ALS.F.1, ALS.0.1, ALS.0.2. FlagVarieties §§3.1, 3.2, 5.2. RootSystems contracts (lines 325–331). AutomorphicFormsOnReductiveGroups §2.3a. The two resolver leads are names planned in the ArithmeticLocallySymmetricSpaces README (lines 581, 1187).
- **Gate: every check OK at aa066e2.** Depcheck output: `depcheck: 241 roadmaps, 2261 edges, 0 problem(s)`. RealSemisimpleLieGroups §§2.3 and 3.1 need AutomorphicFormsOnReductiveGroups §2.3a, which `ORDER.txt` lists right after this roadmap, so this roadmap is placed after both. That placement is by rule, not a defect.
- **Elaboration: `lake env lean` gives 13 `sorry` warnings and nothing else.** All 26 elaborated `#check` types match their README statements; no binder was lost and nothing changed.
- **One-tactic probe: `simp`, `rfl` and `infer_instance` fail on all 13 theorems; no padding.**
- **7 Checks recomputed numerically:** `OᵀSL₂(ℤ)O`, the transport without symmetry, the §2.2 rotation maximum, §2.2(e) at `c = −π/2, −π/4`, the cell coordinates, and the two Langlands witnesses.

Overlap check: read RealSemisimpleLieGroups, SurfaceGroupCharacterVarieties, BallQuotientsAndComplexHyperbolicLattices, AutomorphicFormsOnReductiveGroups, ShimuraData, LieGroups, FlagVarieties and ReductiveGroups. Each shared object is owned in a different generality, and this roadmap states its variant with the difference spelled out:
- **`P = MAN` and its Langlands decomposition:** AutomorphicFormsOnReductiveGroups §2.3a for real points, RealSemisimpleLieGroups §3.1 for connected semisimple groups with finite centre, here §§3.2–3.4 for every datum.
- **Bruhat decomposition, dynamical parabolics, complexification criterion:** RealSemisimpleLieGroups §§3.3 and 4.4 under the component condition, here §§4.2, 6.2 and 6.3 without it.
- **Conjugate standard parabolics:** FlagVarieties §§3.1, 3.2 and 5.2 for algebraic groups, here §6.1 for any Tits system.
- **Nothing is shared** with SurfaceGroupCharacterVarieties, BallQuotients, ShimuraData or ReductiveGroups.

Source independence: 10 passages compared with 4 sources, none shared beyond formulas and standard names. The largest share is knapp2002, with 22 of 41 README locators, and its text is unreadable. Against the section titles the README cites, the arrangement is independent: Layer 3 ↔ VII §7 comes before Layer 4 ↔ VII §4, Layer 5 returns to VII §2, and Layers 7–8 have no counterpart.

## Not verifiable

- knapp2002 (Ch. VI §§2, 4–5; Ch. VII §§2, 4, 5, 7) for the sampled targets 1.1, 1.2, 2.4, 2.5, 3.2, 3.3, 3.4, 5.1, 6.2, 6.3, 7.1, 7.2, 7.4 and 8.1: settled as uncertified, and the sources cache has no text.
- warner1972 Ch. 1 §1.2 (targets 3.3 and 4.2): settled as uncertified, no text.
- wallach1988 Ch. 2 §§2.1–2.2 (targets 5.1, 7.1 and 7.4): settled as uncertified, no text.
- bourbaki-lie4-6 Ch. IV §2 nos. 5–6, Ch. V §3 no. 3 and Ch. VI §1 (targets 2.1, 6.1 and 7.3): settled as uncertified, no text.

## Source issues

- **Misprint** in brown-rodriguezhertz-wang2022 at §1.2, p. 3 (arXiv v2): the source says a positive root is simple when it is not a linear combination of other positive roots; it should say not a nonnegative combination of other positive roots (equivalently, not a sum of two); affects nothing.

## For the human reviewers

- Not tested: knapp2002 supplies 22 of 41 README locators and is uncertified and unread. Wording (part 1) was not compared with it, and contents (part 2) only against the section titles the README cites.
- Not tested: warner1972, wallach1988 and bourbaki-lie4-6 (11 locators) are also uncertified and unread, so the README's wording was not compared with them.
