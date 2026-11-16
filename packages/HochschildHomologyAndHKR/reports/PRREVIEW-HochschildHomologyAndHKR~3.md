# Review of HochschildHomologyAndHKR (pull request #2447 at 2c1724c)

**Verdict:** accepted

Conditional on the declared gap `gap:smooth-hkr-antisymmetrisation` (RefinedTraceMethods §1.9). The previous review, of this same head, listed no finding, so there is nothing to check as repaired.

## Verified sound

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| §1.1 chain complex | `A = M = k`; `Mat₂(k)` | `b_n = Σ_{i=0}^n (−1)^i` = `0` (odd), `1` (even `≥ 2`) ⇒ `HH₀ = k`, `HH_n = 0`; `b(E₁₂⊗E₂₁) = E₁₁ − E₂₂` | formula is Ginz05 lines 973–976 |
| §1.2 non-commuting actions | `Mat₂(ℤ)`, `op b • m = bᵀm`, `a = b = E₁₂`, `m = 1` | `δδm(a,b) = (bᵀa − abᵀ)m = E₂₂ − E₁₁ ≠ 0` | `SMulCommClass` needed for `B ⊆ Z`, as stated |
| §1.3 functoriality | `k`-linear, non-multiplicative `φ` on `k[x]` | image of `b(1⊗x⊗x)` is `2x⊗x`; `b(1⊗φx⊗φx) = 2x⊗x − 1⊗x²` | differ by `1⊗x²`; multiplicativity needed |
| §2.2 / `exists_homotopyEquiv_normalizedHochschildCochainComplexι` | `A = N = k` | pinned differentials `Σ_{i=0}^{n+1}(−1)^i = 0,1,0,1,…`; `H⁰ = k`, `Hⁿ = 0`; normalised complex `k,0,0,…` | equivalence holds; zeroth slot must stay free |
| §3.3 derivations, `HH¹` | `Mat₂(k)`, `m = E₁₁`, `a = E₁₂` | `δm(a) = E₁₂E₁₁ − E₁₁E₁₂ = −E₁₂`; `innerDerivation` gives `+E₁₂`; Ginz05 line 404 `ad m = ma − am` | `innerDerivation = −δ`; `D(1) = 2D(1)` |
| §3.4 / `homology_one_linearEquiv_kaehler` | `k[x]`; `ℤ → 𝔽_p` | `b(1⊗x⊗x) = 2x⊗x − 1⊗x²` ↔ `d(x²) = 2x dx`; `x⊗1 = b(x⊗1⊗1) ↦ x d1 = 0`; `b₂ = 1` on `𝔽_p` | well defined; slot `0` is the coefficient |
| §3.5 twisted extension | general `f`; `k[x]/(x²)`, `f(x,x)=1`; `k[x]`, `f(x,x²)=1` | `(1,u)(a,m) = (a, m+ua+f(1,1)a)` ⇒ `u = −f(1,1)`; shift gives `f′ = f − δg`; `t² = (0,1)`, `t³ = 0`; `δf(x,x,x) = 1` | associativity ⇔ `δf = 0` |
| §4.1 enveloping algebra | `Mat₂(k)` | `(E₁₂⊗op E₂₁)·E₂₂ = E₁₁`, reversed order `0`; right rule: `E₂₁E₁₂ = E₂₂` vs `E₁₁` for the left rule | agrees with Ginz05 lines 752, 963–966 |
| §4.3 bar cochains | `A = k = M = ℤ`, degree 1 | `C¹ = ℤ`, `δ¹ = Σ_{i=0}^{2}(−1)^i = 1` ⇒ `Z¹ = 0 = Ext¹` | no sign; Ginz05 lines 1039–1046, HKR62 lines 480–489 |
| §4.4 / `nonempty_linearEquiv_ext` | `A = k`; `Mat₂(k)`, `n = 0` | `HHⁿ(k,M) = M, 0, 0, …` = `Extⁿ_k(k,M)`; `HH⁰ = k·1 = End_{Aᵉ}(A)` | holds; `Module.Projective k A` in the signature |
| §4.5 flatness needed | `k = ℤ`, `A = ℤ[x]/(px)`, `M = 𝔽_p` | `Ann(x−y) = pℤ`, `Ann(p) = (x,y)`; `Tor₂ = 𝔽_p`; `HH₂(A,𝔽_p) = HH₂(𝔽_p[x],𝔽_p) = 0` | `𝔽_p ≠ 0`: hypothesis cannot be dropped |
| §5.1 `cupProduct` | `k[x,y]`; reversed product on `Mat₂(k)`, `x = E₁₁`, `(a,b) = (E₂₁,E₁₂)` | `(∂x∪∂y)(x,y) = 1`, `(∂y∪∂x)(x,y) = 0`; Leibniz defect `bax − bxa + abx − axb = E₁₁ − E₂₂` | order fixed; the file's `example` closes by `simp` |
| §§5.3–5.4 Yoneda product | `p = 1` lift on `a₀⊗a₁⊗a₂⊗a₃`; `p = 0`; `q = 0` | unsigned: `f̃₀b′ = −b′f̃₁`; signed: `f̃_q ≫ g = (−1)^{pq} f∪g`; `s(p,0) = s(0,q) = 1` | matches `extMk_comp_mk₀`, `mk₀_comp_extMk` |
| §6.1 sign dictionary | `n = 0, 1, 2`; `f(a,b) = a∂b` at `(1,x,1)` | signs `−1, +1, −1 = (−1)^{n+1}`; `δf(a,b,c) = ab∂c`; unsigned model gives `2 ≠ 0` | explicit and consistent |
| §6.2 / `cupProduct_graded_comm` | `(1,1)`, `(1,0)`, `(0,1)`, `(0,0)`; `k[x]` | `δ(D₁D₂) = −(D₁∪D₂ + D₂∪D₁)`; `(1,0)`: both `y f(a) − f(a)y`; `(0,0)`: `gf − fg = 0`; `−δ(∂^{[2]})(x,x) = 1` | holds; antisymmetrised form is the pinned Leibniz rule |
| §6.4 antisymmetrisation | `n = 2`, `W` of three orderings; `𝔽₂[x,y]` over `ℤ` | 12 terms, 6 cancel, rest `Alt(r₀a;c,r) − Alt(r₀;ac,r) + Alt(r₀c;a,r)`; `π₂ε₂(dx∧dy) = 2dx∧dy` | (a)–(c) need no flatness |
| §7.2 evaluation pairing | `ℚ[x]/(x²)`, `M = ℚ`; same over `𝔽₂` | differentials `0, 2x`: `HH₁ = R/(x)`, `HH₂ = xR`; `HH² = ℚ = Hom(xR,ℚ)`, `h₂ = 0`; over `𝔽₂` all `R` | projectivity of `HH₁` needed in degree 2 |
| §7.3 pairing on finite projectives | `P = R²` | `(e₁*∧e₂*)(e₁∧e₂) = 1`; bidual evaluation `det(f_i(v_j))` = transpose, same determinant | bijective by EulerSystemsAndKolyvaginSystems §6.1 |
| §7.4 polyvector fields | `k[x,y]`; `𝔽₂(u)[a]/(a² − u)` | `τ₂(∂x∧∂y)(dx∧dy) = det I₂ = 1`; `Der = R∂`, `T² = ⋀²R = 0` | index convention `det(D_j(r_i))` |
| §7.5 / `detCochain_sub_factorial_smul_cupDerivations_mem` | `n = 0, 1, 2` | `1 − 0!·1 = 0 ∈ ⊥`; `D − D = 0`; `det − 2·cup = −(D₁∪D₂ + D₂∪D₁) = δ(D₁D₂)` | true for every commutative `R`; row `i` is `(D_j r_i)_j` |
| §7.6 / `cohomological_hkr_hom_kaehler` | `n = 0`; `n = 1`; `𝔽₂[x,y]`; `ℤ[1/2]` | sum over `Perm (Fin 0)` is `f() = m`; `D ↦ (dr ↦ Dr)`; cup pairs to `1`, determinant to `2 = 0`; both sides `0` | values on `dr₁∧⋯∧dr_n` determine `e` |
| §7.6 / `cohomological_hkr` | `n = 0`; `k[x]`, `n = 2`; inseparable `𝔽₂(u)[a]/(a²−u)` | `r·1 ↦ [r]`, `HH⁰ = R`; `T² = 0` and `∂∪∂ = −δ(∂^{[2]})`; non-smooth: `T² = 0`, `HH² = R` | alternation holds under smoothness only |
| §8.4 / `homological_hkr_mvPolynomial` | `m = 1, n = 2`; `m = 0`; unsigned chain | `b(1⊗X⊗X⊗X) = 1⊗X⊗X² − 1⊗X²⊗X`; `Ω⁰ = k = HH₀`; unsigned boundary `2(X₁⊗X₂ + X₂⊗X₁ − 1⊗X₁X₂)` | true over every `k`, without the gap |
| §8.3 comparison map | `j = 2` | `b′ι(e₁∧e₂) = t₁·(1⊗X₂⊗1) − t₂·(1⊗X₁⊗1)`; unsigned defect `2(X₂⊗X₁⊗1 + 1⊗X₂⊗X₁ − 1⊗X₁X₂⊗1)` | chain map with the sign of `σ` |
| §8.5 Jacobian determinant | `m = 2`, `(X₁², X₂)`; `m = 0`, `g = 2` | `det = 2X₁`, normalised `gX₁`; `g·⟨⟩ = 2 ∈ HH⁰(ℤ,ℤ)` | covers `m = 0` |
| Declared gap | RefinedTraceMethods §1.9 at its open head; `plan.json` | §1.9 has `π_nε_n = n!`, `ε₁` iso, formality only for `ℚ ⊆ k`; slug in `plan.json` with targets 6.4, 7.6 | precise, minimal, declared in both places |

- Source locators checked against the cached texts: 51 (Ginz05 30, HKR62 17, AV20 2, StacksSmooth 2: Tag 00T2 at line 16920, Tag 00TN at line 17399). Each supports its statement, with the hypotheses the README attributes to it (Ginz05 lines 96–97; HKR62 line 522 `K`-projective, line 548 perfect field).
- Library declarations opened at the pins: 46 in Mathlib, among them `Mathlib/Algebra/Azumaya/Defs.lean:39` and `:52`, `Mathlib/CategoryTheory/Abelian/Projective/Ext.lean:209, 224, 234, 255, 286`, `Mathlib/LinearAlgebra/ExteriorPower/Basis.lean:182` (free and finite only), `Mathlib/RingTheory/Smooth/Flat.lean:57`, `Mathlib/LinearAlgebra/Dimension/Basic.lean:168`; 44 in Tau Ceti, among them `TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean:212`, `TauCeti/RingTheory/HochschildCohomology/Coboundary.lean:282, 345`, `TauCeti/RingTheory/CyclicCohomology/Normalized/Chains.lean:75, 250, 361, 369`. Mathlib has no Hochschild or Koszul complex at the pin, and Tau Ceti has no homotopy equivalence, cup product or Kähler comparison for its Hochschild complexes.
- Cross-roadmap citations resolved: 15. On main (5ff4294): DGAInfinity Layers 0, 1, 8; DerivedModuleAlgebra §§0.K.1, 0.5; IntegralIwasawaTheory §12.6; DerivedDeRhamCohomology Layer 2; NoncommutativeGeometry N1.Cyclic; BanachAlgebras Layer 6; ZigzagPreprojective Layer 7. At open heads: RefinedTraceMethods §§1.1, 1.9, 1.10; KTheoryFiniteLocalFields §4.0; EulerSystemsAndKolyvaginSystems §6.1; LanglandsParameterStacks §1.17. `TauCeti.StarkSystems.toExteriorBidual` is a target of IntegralIwasawaTheory §12.6, not a pinned declaration, as the contract says.
- Gate: my run reports every check `0` (`OK`); the worker's gate reports `build=0`. Dependency check: `depcheck: 257 roadmaps, 2447 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. Nothing is changed outside the folder.
- Elaboration: `lake env lean` on `TauCetiRoadmap/HochschildHomologyAndHKR/Suggested.lean` gives 8 `sorry` warnings and nothing else. The 14 elaborated signatures were compared with their README statements: no binder lost, generality equal. One-tactic probe (`rfl`, `infer_instance`, `simp`) on a scratch copy: 0 of 8 theorems close.
- Headline theorems: the README's end theorems (§7.6 (1)–(2), §7.5's `n!` identity, §8.4) and the statable intermediate results (§§2.2, 3.4, 4.4, 6.2) are stated; §§2.1, 3.6, 4.5, 5.4 are named in the module docstring with the missing carrier.
- Pull request text: the title, the summary block, the eight layers, the supplier list by section, the gap paragraph and the statement that no roadmap cites this one all agree with the head (`roadmaps grep` finds no citation of HochschildHomologyAndHKR).

Overlap check: read CyclicHomologyLieHomologyAndQuasiFreeAlgebras, DGAInfinity, NoncommutativeGeometry, DerivedModuleAlgebra (the results-and-headings list is empty). Shared objects and owners: Hochschild cochains, cup product, braces and bracket of an algebra in degree zero, DGAInfinity Layer 8, cited (the bimodule-coefficient complex is kept here); commutative square-zero extensions and the Koszul complex, DerivedModuleAlgebra §§0.5 and 0.K.1, cited; normalised scalar cochains over `ℂ`, NoncommutativeGeometry N1.Cyclic, cited; quasi-free algebras and `Ext²_{Aᵉ}` vanishing, CyclicHomologyLieHomologyAndQuasiFreeAlgebras Layer 4, which builds no Hochschild complex.

Source independence: 18 passages compared with 3 sources (Ginz05, HKR62, AV20), none shared; largest share Ginz05, 46 of 126 locators; contents compared with Ginz05 (§§3–9): independent. Layers 3, 4 and 5 draw on its §§5.3–5.5, 4.2 and 6.6 in a different order and with other scope; Layers 1, 2, 6, 7 and 8 have no counterpart section.

## Not verifiable

- Loday98 §§1.1, 1.3, 1.5, 3.2, 3.4 (Theorem 3.4.4): uncertified, no legal text cached; §1.3's locators rest on it and on Weibel94 alone.
- Weibel94 §§2.2, 2.6, 3.2, 9.1–9.4 (Theorem 9.4.7): uncertified.
- CE56 Chapters IX and XI (§§1.1–1.4, 3.3, 4.4, 5.3, 5.4): uncertified.
- Ger63 §7 (§§5.1, 5.2, 6.1, 6.2): uncertified.
- Mat86 §25 (§7.4): uncertified.

## Source issues

- **Error** in Ginz05 at (6.6.3), p. 29 (line 1368): the source says f∪g − (−1)^{pq} g∪f = d(f∘g) − df∘g − (−1)^p f∘dg; with the coboundary of line 1058, f = g = d/dx on k[x] at (x,x) gives 2 = −2; it should be g∪f − (−1)^{pq} f∪g = df∘g + (−1)^q (d(f∘g) − f∘dg); affects the proof.
- **Misprint** in Ginz05 at (6.6.2), p. 29 (line 1363): the source says the inserted g takes the arguments a_i through a_{i+q}; it should be a_i through a_{i+q−1}; affects nothing.
- **Misprint** in Ginz05 at §9.2, p. 45 (line 2146): the source says the alternation carries the sign (−1) to the power sign σ; it should be sign σ itself; affects nothing.
- **Misprint** in Ginz05 at §3.1, p. 9 (line 404): the source says ad m is a map from M to M giving a derivation of M; it should be a map from A to M, a derivation of A into M; affects nothing.
- **Misprint** in Ginz05 at §5.2, p. 22 (lines 1049–1053): the source says the recalled chain differential has inner terms without signs; it should be the inner terms with (−1)^j, as at lines 973–976; affects nothing.

## For the human reviewers

- none
