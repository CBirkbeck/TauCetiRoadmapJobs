# Review of HochschildHomologyAndHKR (pull request #2447 at e98ebdb)

**Verdict:** accepted

**Summary.** Accepted: no finding. The new Layer 9 (homological HKR for every smooth algebra by étale localisation from the polynomial case, and the cohomological theorem from it) is sound: every Check was recomputed, the route's library inputs exist at the pin, and RefinedTraceMethods §1.8 states the étale base change it consumes. There are two small corrections (the supplier requirement on §1.8 that replaced the old gap is recorded only as an assumption, and the pull request's description still describes the earlier head) and one format note, none blocking. One point is left for the human reviewers: smooth homological HKR is now a target both here and, in a weaker form, in KTheoryFiniteLocalFields §4.0 on main.

The previous review, of head 2c1724c, listed no finding, so there is nothing to check as repaired.

## C01 — The route of §9.1 needs the étale base-change isomorphism of RefinedTraceMethods §1.8 to be a specific map, which §1.8 does not name, while the design plan still asks §1.9 for a statement this roadmap now proves itself

Step (a) of §9.1 (README lines 1850–1857) transports `B ⊗_A ε^cl_{A,n}` to `ε^cl_{B,n}`, which requires the isomorphism `B ⊗_A HH_n(A/k) ≅ HH_n(B/k)` to be the `B`-linear extension of the map induced by `A → B`. The supplier contract says so ("Assumed of it: the isomorphism is inverse to the `B`-linear extension…", line 2671), but RefinedTraceMethods §1.8 at its open head (*Étale base change (Weibel–Geller)*) states only `HH_*(B/k) ≅ B ⊗_A HH_*(A/k)` for `k`-flat `A`, `B`, with no map. This is the situation that the earlier head handled by a declared gap for KTheoryFiniteLocalFields §4.0's unnamed HKR isomorphism. Meanwhile `packages/HochschildHomologyAndHKR/design/plan.json` still lists `gap:smooth-hkr-antisymmetrisation` on RefinedTraceMethods §1.9, asking for the bijectivity of `ε_n` for smooth `A`, which §9.1 now proves here; the README no longer states that gap.

The smallest change: state the requirement on §1.8 as what RefinedTraceMethods must provide (that the isomorphism of §1.8 is the base change of the map induced by `A → B`), under the RefinedTraceMethods contract, and replace the stale gap in the plan by it, so that the supplier is told. The mathematics of §9.1 is unaffected: Weibel–Geller's theorem is about that map.

## C02 — The pull request's description describes the head before Layer 9 was added

A reader of the description is told of eight layers, a gap and section numbers that the head does not have. It lists "Layer 7, polyvector fields and the cohomological HKR theorem" and "Layer 8, polynomial algebras", where the head has Layer 7 *Polyvector fields and the HKR maps*, Layer 8, and a new Layer 9 *The HKR theorems for smooth algebras* (§9.1 homological, §9.2 cohomological). It says "Declared gap `gap:smooth-hkr-antisymmetrisation` on RefinedTraceMethods §1.9 … Only §6.4(d), and the cohomological HKR theorem of §7.6 through it, use it": the head has no §6.4(d), no §7.6 and no gap, and proves the statement in §9.1. Its supplier list gives "RefinedTraceMethods §§1.1 and 1.9", where the head also consumes §1.8 (étale base change), and it lists EulerSystemsAndKolyvaginSystems and KTheoryFiniteLocalFields as open pull requests although both are on main. The summary block does not mention the headline the head adds, `homological_hkr`: for every smooth `R` over every `k` the antisymmetrisation `Ω^n_{R/k} → HH_n(R,R)` is an isomorphism, with no projectivity over `k`.

The text that would be right: nine layers with Layer 9 as above; suppliers RefinedTraceMethods §§1.1, 1.8 and 1.9 (the only one still open); no declared gap; and in the summary, the homological HKR theorem for smooth algebras, deduced from the polynomial case by étale localisation, with the cohomological theorem deduced from it under `k`-projectivity.

## N01 — Three lines of `Suggested.lean` exceed 100 characters

Lines 19, 101 (138 characters, in the docstring of `hochschildBimoduleCocycles`) and 264.

## Questions for the author

- §9.1 (line 1842) and the docstring of `cohomological_hkr` read "Loday98 §3.4, Theorem 3.4.4, and Weibel94 §9.4, Theorem 9.4.7, over a field". Is Loday's Theorem 3.4.4 not stated for a smooth algebra over a commutative (Noetherian) ring, so that "over a field" should attach to Weibel's theorem only? I could not read either text (both are cited by locator only).

## Verified sound

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| §1.1 chain complex | `A = M = k`; `Mat₂(k)` | `b_n = Σ_{i=0}^n (−1)^i` = `0` odd, `1` even `≥ 2`; `b(E₁₂⊗E₂₁) = E₁₁ − E₂₂` | Ginz05 lines 973–976 |
| §1.2 cochain complex | sign variant; `op b • m = bᵀm` on `Mat₂(ℤ)` | variant `δδm(a,b) = 2(mab − amb) = 2E₁₂`; `δδ1(E₁₂,E₁₂) = E₂₂ − E₁₁` | Ginz05 lines 1055–1062; `SMulCommClass` needed |
| §1.3 functoriality | non-multiplicative `φ` on `k[x]`; `k[x] → k[x]/(x²)` | images differ by `1⊗x²`; `p ↦ p′` sends `x²` to `2x ≠ 0` | holds; sources not readable |
| §1.4 exact sequences | `ℤ[ε]/(ε²,2ε)`, `0→ℤ→ℤ→ℤ/2→0` | `2·(1⊗ε) = 1⊗2ε = 0`; `ε ↦ 1` has no lift to `ℤ` | hypotheses needed |
| §2.1 normalised chains | `m⊗1`; `A = k`; `k[x]` | `b(m⊗1⊗1) = m⊗1`; `N_n = 0`, `n ≥ 1`; `b(1⊗x⊗x) = 2x⊗x − 1⊗x²` | Ginz05 lines 894–931 (reduced bar complex) |
| §2.2 / `exists_homotopyEquiv_…ι` | `A = N = k`; `φ(a₀,a₁) = (a₀∂a₁)(0)` | differentials `0,1,0,1,…`, normalised complex `k,0,0,…`; `bφ = 0` | equivalence holds |
| §3.4 / `homology_one_linearEquiv_kaehler` | `k[x]`; `k[x]/(x²)` over `𝔽₂`, `ℚ` | `[1⊗x²] = 2[x⊗x]` ↔ `d(x²) = 2x dx`; dimensions `2`, `1` both sides | well defined |
| §3.5–3.6 extensions | `k[x]/(x²)`, `f(x,x)=1`; `k[x]`, `f(x,x²)=1`; `ℤ/4 → 𝔽₂` | unit `(1,−f(1,1))`; `t² = (0,1)`, `t³ = 0`; `δf(x,x,x) = 1`; `HH²(𝔽₂,𝔽₂) = 0` over `ℤ` | associativity ⇔ `δf = 0` |
| §4.1 enveloping algebra | `Mat₂(k)` | `(E₁₂⊗op E₂₁)·E₂₂ = E₁₁`, reversed `0`; `m⊗a = ma⊗1` | Ginz05 lines 751–752, 934–947, 963–966 |
| §4.2 bar resolution | `B₀`, `B₁`; `A = k` | `(hμ + b′h)(a₁⊗a₂) = a₁⊗a₂`; `(b′h + hb′)(a₀⊗a₁⊗a₂) = a₀⊗a₁⊗a₂` | Ginz05 lines 747–782; HKR62 lines 434–447 |
| §4.4 / `nonempty_linearEquiv_ext` | `A = k = M = ℤ`, degree 1 | `δ¹ = 1`, `Z¹ = 0 = Ext¹` | `Module.Projective k A` in signature |
| §4.5 Tor | `ℤ[x]/(px)`, `M = 𝔽_p` | `Ann(x−y) = pℤ`, `Ann(p) = (x,y)`; `Tor₂ = 𝔽_p`; `HH₂ = HH₂(𝔽_p[x],𝔽_p) = 0` | flatness needed; Ginz05 lines 944–976 |
| §5.1 `cupProduct` | `k[x,y]`; `Mat₂(k)`, `x = E₁₁`, `m = E₁₂` | `(∂x∪∂y)(x,y) = 1`, `(∂y∪∂x)(x,y) = 0`; `(δx∪δm)(E₂₁,E₁₁) = E₂₂` | Ginz05 lines 1335–1341; HKR62 lines 479–484 |
| §§5.3–5.4 Yoneda product | lift `f̃_i`, `p = 0`, `q = 0` | `f̃_q ≫ g = (−1)^{pq} f∪g`; `s(p,0) = s(0,q) = 1` | Ginz05 lines 1348–1350; HKR62 lines 425–431 |
| §6.1 sign dictionary | `n = 0, 1, 2` | signs `−1, +1, −1 = (−1)^{n+1}` | Ginz05 lines 1351–1375 |
| §6.2 / `cupProduct_graded_comm` | `(1,1)`, `(1,0)`, `(0,1)`, `(0,0)` | `(1,1)`: `f∘δg + δf∘g − δ(f∘g) = f∪g + g∪f`, the other 10 terms cancel; `(0,1)`: both `g(a)x − xg(a)`; `(0,0)`: `gf − fg = 0 ∈ B⁰` | holds |
| §6.4 antisymmetrisation | `n = 2`, `W` of three orderings | `b(W)`: 12 terms, 6 cancel, rest `Alt(r₀a;c,r) − Alt(r₀;ac,r) + Alt(r₀c;a,r)` | (a)–(c) need no flatness |
| §7.2 evaluation pairing | `ℚ[x]/(x²)`, `M = ℚ` | `HH₁ = R/(x)`, `HH₂ = xR`; `HH² = ℚ = Hom(xR,ℚ)`, `h₂ = 0` | projectivity of `HH₁` needed |
| §7.4 polyvector fields | `k[x,y]`; `𝔽₂(u)[a]/(a²−u)` | `τ₂(∂x∧∂y)(dx∧dy) = 1`; `T² = ⋀²R = 0` | Ginz05 lines 1130–1140; HKR62 line 548 |
| §7.5 / `detCochain_sub_factorial_smul_cupDerivations_mem` | `n = 0, 1, 2` | `1 − 1 = 0 ∈ ⊥`; `D − D = 0`; `det − 2·cup = −(D₁∪D₂ + D₂∪D₁) = δ(D₁D₂)` | true for every commutative `R` |
| §8.1 diagonal | `m = 1`; `k[x]/(x²)` | `1⊗X − X⊗1 ↦ X`, multiplication = evaluation at `0`; `t(x⊗1 + 1⊗x) = 0` | HKR62 lines 268–271, Ginz05 lines 2193–2196 as described |
| §8.3 comparison map | `j = 2` | `b′ι(e₁∧e₂) = t₁(1⊗X₂⊗1) − t₂(1⊗X₁⊗1)`; unsigned defect `2(X₂⊗X₁⊗1 + 1⊗X₂⊗X₁ − 1⊗X₁X₂⊗1)` | chain map with `sgn σ` |
| §8.4 / `homological_hkr_mvPolynomial` | `m = 1, n = 2`; `m = 0` | `Alt(1;X,X²) = b(1⊗X⊗X⊗X)`; `Ω⁰ = k = HH₀` | holds over every `k` |
| §9.1 / `homological_hkr` | `ℤ[1/2]` over `ℤ`; `k[x,x⁻¹]`; `k[x] → k`; `n = 0`; `k = 0` | `C_n = R`, `b_n = 1` (even `≥ 2`), `0` (odd): `HH_n = 0 = Ω^n`; `b(x⁻¹⊗x⊗x⁻¹) = 1⊗x⁻¹ − x⁻¹⊗1 + x⁻²⊗x`; `k ⊗ HH₁(k[x]) = k ≠ 0 = HH₁(k)` | route (a)–(c) closes; AV20 line 70 |
| §9.2 / `cohomological_hkr_hom_kaehler` | `n = 0`; `n = 1`; `𝔽₂[x,y]` | sum over `Perm (Fin 0)` is `f() = m`; `D ↦ (dr ↦ Dr)`; cup pairs to `1`, determinant to `2 = 0` | values on `dr₁∧⋯∧dr_n` determine `e` |
| §9.2 / `cohomological_hkr`, `normalized_hkr` | `k[x]`, `n = 2`; `𝔽₂(u)[a]/(a²−u)`; `ℤ[1/2]` | `T² = 0`, `∂∪∂ = −δ(∂^{[2]})`; non-smooth: `T² = 0`, `HH² = R/(2a) = R`; `[Φ(ξ)] = (1/n!)·n!·Ψ(ξ)` | HKR62 lines 301, 495, 522, 528–548; Ginz05 line 2086 |
| RefinedTraceMethods §1.8 contract | open head of the supplier | states `HH_*(B/k) ≅ B ⊗_A HH_*(A/k)` for étale `A → B`, `k`-flat; map not named | C01 |
| Pull request text | description against head | 8 layers / gap / §7.6 in text; 9 layers, no gap, §9.2 at head | C02 |

- Source locators checked against the cached texts: 34 (Ginz05 19, HKR62 13, AV20 2); each supports its statement with the hypotheses the README attributes to it (Ginz05 lines 96–97 ground field; HKR62 line 523 `K`-projective, line 548 perfect field, lines 85–87 affine algebra, lines 569–582 the characteristic-two example).
- Library declarations opened at the pin for the new layer: `Mathlib/RingTheory/Smooth/StandardSmoothOfFree.lean:155`, `Mathlib/RingTheory/RingHom/StandardSmooth.lean:257`, `Mathlib/RingTheory/Smooth/Flat.lean:57`, `Mathlib/RingTheory/Etale/Basic.lean:251`, `Mathlib/RingTheory/Etale/Kaehler.lean:36`, `Mathlib/LinearAlgebra/ExteriorAlgebra/BaseChange.lean:88, 94`, `Mathlib/RingTheory/LocalProperties/Exactness.lean:166`, `Mathlib/RingTheory/Localization/BaseChange.lean:21`, `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean:212`, `Mathlib/RingTheory/MvPolynomial/Ideal.lean:63`, `Mathlib/RingTheory/Regular/RegularSequence.lean:190`, `Mathlib/RingTheory/TensorProduct/MvPolynomial.lean:95`. All exist with the statements the README gives.
- Cross-roadmap citations resolved: on main (890b66d) DGAInfinity Layers 0, 1, 8; DerivedModuleAlgebra §§0.K.1, 0.5; IntegralIwasawaTheory §12.6 (`toExteriorBidual` is its target, as the contract says); EulerSystemsAndKolyvaginSystems §6.1; KTheoryFiniteLocalFields §4.0. At the open head of RefinedTraceMethods: §§1.1, 1.8, 1.9, 1.10. No roadmap cites this one.
- Dependency check: `depcheck: 199 roadmaps, 2188 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Nothing is changed outside the folder. The automatic checks all passed.
- Elaboration: `lake env lean` on `TauCetiRoadmap/HochschildHomologyAndHKR/Suggested.lean` gives 10 `sorry` warnings and nothing else; the file has no `variable` line, so no binder can be lost, and the 18 signatures agree with their README statements. One-tactic probe (`rfl`, `simp`, `infer_instance`, anonymous constructor) on a scratch copy: 0 of 10 theorems close.
- Headline theorems: §9.1, §9.2 (1), (2), (4), §7.5's `n!` identity, §8.4 in homology, §§2.2, 3.4, 4.4, 6.2 are stated; §§2.1, 3.6, 4.5, 5.4 are named in the module docstring with the missing carrier; §9.2 (3), (5) and §8.4 in cohomology are named there as consequences.
- Declared gap: the README states none; the plan's `gap:smooth-hkr-antisymmetrisation` is superseded by §9.1 (C01).

Overlap check: read CyclicHomologyLieHomologyAndQuasiFreeAlgebras, DGAInfinity, NoncommutativeGeometry, DerivedModuleAlgebra (the results-and-headings list is empty), and KTheoryFiniteLocalFields §4.0 and RefinedTraceMethods Layer 1 as suppliers. Shared objects and owners: Hochschild cochains, cup product, braces and bracket of an algebra in degree zero, DGAInfinity Layer 8, cited; commutative square-zero extensions and the Koszul complex, DerivedModuleAlgebra §§0.5 and 0.K.1, cited; normalised scalar cochains over `ℂ`, NoncommutativeGeometry N1.Cyclic, cited; quasi-free algebras, CyclicHomologyLieHomologyAndQuasiFreeAlgebras Layer 4, which builds no Hochschild complex; the smooth HKR comparison on derived chains, KTheoryFiniteLocalFields §4.0, cited, with §9.1 kept here as the variant that names the map on the classical complex (see the human reviewers' section).

Source independence: 20 passages compared with 3 sources (Ginz05, HKR62, AV20), none shared; largest share Ginz05, 47 of 133 locators; contents compared with Ginz05 (§§3–9): independent. Layers 3, 4 and 5 draw on its §§5.3–5.5, 4.2 and 6.6 in another order and with other scope; Layers 1, 2, 6, 7, 8 and 9 have no counterpart section.

Research link: the headline targets are the theorem of Hochschild, Kostant and Rosenberg (1962, Theorems 5.1–5.2) and its integral form used by Antieau and Vezzosi (2020, Proposition 1.2) for HKR in characteristic p; Gerstenhaber (1963) for the cup product. Rests on the README's sources HKR62 and AV20, which I read.

## Not verifiable

- Loday98 §§1.1, 1.3, 1.5, 3.2, 3.4 (Theorem 3.4.4): cited by locator only, no legal text available; the locators of §1.3 rest on it and on Weibel94 alone.
- Weibel94 §§2.2, 2.6, 3.2, 9.1–9.4 (Theorem 9.4.7): cited by locator only.
- CE56 Chapters IX and XI (§§1.1–1.4, 3.3, 4.4, 5.3, 5.4): cited by locator only.
- Ger63 §7 (§§5.1, 5.2, 6.1, 6.2): cited by locator only.
- Mat86 §25 (§7.4): cited by locator only.

## Source issues

- **Error** in Ginz05 at (6.6.3), p. 29 (line 1368): the source says f∪g − (−1)^{pq} g∪f = d(f∘g) − df∘g − (−1)^p f∘dg; with its coboundary, f = g = d/dx on k[x] at (x,x) gives 2 = −2; it should be g∪f − (−1)^{pq} f∪g = df∘g + (−1)^q (d(f∘g) − f∘dg); affects the proof.
- **Misprint** in Ginz05 at (6.6.2), p. 29 (line 1363): the source says the inserted g takes the arguments a_i through a_{i+q}; it should be a_i through a_{i+q−1}; affects nothing.
- **Misprint** in Ginz05 at §9.2, p. 45 (line 2146): the source says the alternation carries the sign (−1) to the power sign σ; it should be sign σ itself; affects nothing.

## For the human reviewers

- Scope: KTheoryFiniteLocalFields §4.0 on main (README line 674) has the target `HH_n(A/k) ≅ Ω^n_{A/k}` for smooth `A`, map unnamed, on derived chains; §9.1 here proves it for the antisymmetrisation on the classical complex, as a stated variant.
- The design plan (`packages/HochschildHomologyAndHKR/design/plan.json`) still lists `gap:smooth-hkr-antisymmetrisation` on RefinedTraceMethods §1.9, which the README no longer declares or needs (C01).
