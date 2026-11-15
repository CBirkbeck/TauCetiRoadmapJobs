<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13788#issuecomment-6899366419 -->
Review (claude) of 443e10b

Verdict: needs_changes

1. **F01** (P3) a section is written with `x` where the element of the extension is `t`

   **Location.** `packages/HochschildHomologyAndHKR/design/README.md` line 1128 (§3.5 Checks): "An
   algebra section would send `x` to some `x + c t²` with square `t² ≠ 0`".

   **Claim.** The image of `x` under a section of `k[t]/(t³) → k[x]/(x²)` is `x + c t²`.

   **Witness.** `x` is not an element of `A ⊕_f M ≅ k[t]/(t³)`; the same Check sets `t = (x,0)`, so a
   section sends `x` to `(x,c) = t + c t²`. README line 1184 (§3.6) and plan target 3.6 write
   `t + c t²`.

   **Repair.** Line 1128: replace "`x + c t²`" by "`t + c t²`". Tested on the instance:
   `(t + c t²)² = t² + 2c t³ = t² ≠ 0` for nonzero `k`, while `x² = 0`, so no section exists; the
   conclusion of the Check is unchanged.

One finding, P3 (a notation slip in one Check), with a one-token repair; no P1 or P2 finding. A
repair of any priority asks for changes, so the verdict is needs changes on R01 alone. The declared
gap `smooth-hkr-antisymmetrisation` (RefinedTraceMethods §1.9), used only in §6.4(d) and §7.6, is a
stated contract and no finding.

Files reviewed: `packages/HochschildHomologyAndHKR/design/README.md` (2137 lines, 8 layers, 37
targets), `packages/HochschildHomologyAndHKR/design/plan.json`,
`packages/HochschildHomologyAndHKR/sources.toml`. Pins read from the checked-out packages: Mathlib
`1b1ccf4b`, Tau Ceti `2fd255d9` (the same pins as round 10); roadmap main at `1a19c9f`. No maintainer
notes were supplied. This is a design: there is no `Suggested.lean`, and elaboration is not available
(this lane does not elaborate).

## Verification of the previous repair

| Round-10 finding | Repaired passage | Assessment |
| --- | --- | --- |
| F01 (P3): the contract for the pinned class criterion omits `IsScalarTower A Bᵐᵒᵖ M` | Lines 536–539: "Under the further hypotheses `Module Bᵐᵒᵖ M`, `IsCentralScalar B M`, `Module A M`, `IsScalarTower A B M` and `IsScalarTower A Bᵐᵒᵖ M` (the symmetric bimodule over `A`)" | **Repaired.** `TauCeti/RingTheory/Extension/SquareZero/Basic.lean:246–247`, `:364–365`, `:377–378` carry exactly these five; the `Zero` instance is at `:368`, the criterion at `:387`. |
| F02 (P3): the pinned `TauCeti.hochschildCohomology` is not named | Variants bullet, lines 151–158; contract, lines 488–508; §2.2 Needs, lines 926–933; §2.2 comparison bullet, lines 943–947: "induces `TauCeti.hochschildCohomology k A N n ≅ HH^n(A, A →ₗ[k] N)` in every degree, carrying `TauCeti.hochschildCohomology.mk` to the class map"; new Check, lines 969–979; Layer 2 Dependencies; plan target 2.2 | **Repaired.** `TauCeti/RingTheory/HochschildCohomology/Complex.lean:79, 91, 98, 124, 137, 166, 190, 207, 215, 248`; the pinned docstring at `:162–165` says the cohomology is `HHⁿ(A, Hom_R(A, M))`, not with coefficients in `M`. |
| F03 (P3): "class zero exactly for split extensions" attributed to DerivedModuleAlgebra §0.5 | Line 79: "the split trivial extension"; lines 184–186: "keeps them; Tau Ceti's `TauCeti.SquareZeroExtension.extensionClass_eq_zero_iff` proves that the class vanishes exactly for split extensions"; lines 106–109 (found by the repair) | **Repaired.** Main, `TauCetiRoadmap/DerivedModuleAlgebra/README.md` §0.5 starts at line 1339; the criterion is the pinned theorem at `Basic.lean:387`. |

The three repaired patterns were searched for in the rest of the design: no other list of the
five pinned hypotheses; no other pinned homology on a Hochschild carrier left unnamed (the cyclic
ones belong to the cyclic theory this roadmap leaves to KTheoryFiniteLocalFields §4.0 and
NoncommutativeGeometry N1; `TauCeti.cyclicCohomology.toHochschild` and
`TauCeti.hochschildCohomology.connesB` of `TauCeti/RingTheory/CyclicCohomology/Hochschild.lean`
are maps of that theory); no other statement attributed to a roadmap section that only the pin
makes.

## Verified sound

### Principles and shape

- **General library.** `k` is an arbitrary commutative ring in all 37 targets; flatness (§§1.4,
  6.3, 6.4), `k`-projectivity (§§1.4, 4.2, 4.4, 4.5, 5.4, 7.6) and smoothness (§§6.4(d), 7.6) are
  per-target hypotheses with negative controls, recomputed below for the sampled targets.
- **No re-planning, one direction of supply.** DGAInfinity, DerivedModuleAlgebra,
  NoncommutativeGeometry, BanachAlgebras, ZigzagPreprojective (main) and DerivedDeRhamCohomology,
  IntegralIwasawaTheory, LanglandsParameterStacks, KTheoryFiniteLocalFields,
  EulerSystemsAndKolyvaginSystems, RefinedTraceMethods (merge-order lines 23, 29, 80, 90, 104, 331)
  are cited by section; none is on the never-cite list.
- **Hygiene.** Searched and absent: LaTeX delimiters, `set_option`, `lemma`, pull-request numbers,
  job ids, round labels, machine paths, HTML anchors, "optional", "deferred", "for later",
  "removed", "current", a sentence saying the roadmap follows a source. No algorithm, no sorry'd
  data (no Lean file).
- **Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
  build, eight layers each ending with Examples and Dependencies (8 and 8), Downstream consumers,
  Worked examples, References. 37 Needs lines for 37 numbered subsections. `plan.json` parses: 8
  layers, 37 targets, one gap. Every definition or construction has at least three Checks; the
  targets with fewer are theorems (1.3, 1.4, 4.3, 4.4, 5.2, 5.3, 5.4, 8.4 with none; 3.2 with two).
- **Organisation.** Layers are named by their mathematics. The order is forced by the Needs lines:
  §2.1 needs §1.1; §3.5 needs §2.2; §4.3 needs §1.2; §5.4 needs §4.4; §6.1 needs §5.1; §7.5 needs
  §§6.2 and 6.4(a); §8.4 needs §§7.1, 7.4, 7.5.

### Adversarial table

`E_ij` are matrix units, `∂ = ∂_x`. Values computed this round. The sampled targets, the headlines
and the passages the repair changed are covered; for the targets not in this table the rows of the
round-10 table carry computed values and their text is unchanged since.

| Statement | Instances tried and values computed | Result |
| --- | --- | --- |
| 1.2 (sampled) | `A = M = k`: `δ^n = Σ_{i=0}^{n+1}(−1)^i` = `0` (n even), `1` (n odd); `HH⁰ = k`, `HH¹ = ker 1 = 0`, `HH² = k/k = 0`. `δδm(a,b) = a(bm − mb) − (abm − mab) + (am − ma)b = 0`. Wrong last sign: `2(mab − amb)`, at `(E₁₁,E₁₂,E₂₂)`: `mab = E₁₂`, `amb = 0`. | holds |
| 1.3 (sampled) | `φ = id`: both maps identities. `A = k → B` (structure map): `n ⊗ c₁ ⊗ ⋯ ↦ n ⊗ c₁1 ⊗ ⋯`, compatible with `b` since `φ(ab) = φ(a)φ(b)`; last face `φ(a_n)·n = a_n·n` in `φ*N` by definition. Zero ring `B = 0`: `N = 0`, both maps `0`. | holds |
| 1.5 | `b(1⊗x⊗1) = x⊗1 − 1⊗x + 1⊗x = x⊗1`; first-algebra-factor action on `b(1⊗1⊗1) = 1⊗1` gives `1⊗x`. | holds |
| 2.2 (repaired clause) | `n = 0`: pinned cocycles `χ(ab) = χ(ba)`; `Z⁰(A, A →ₗ N)`: `(a·g)(y) = g(ya)`, `(g·a)(y) = g(ay)`, same set; coboundaries `⊥` and `0`. `A = k[x]`, `N = k`, `φ(a₀,a₁) = (a₀∂a₁)(0)`: `bφ = (a₀a₁∂a₂ − a₀∂(a₁a₂) + a₂a₀∂a₁)(0) = 0`; `ψ(x)(1) = 1`. `N = k`, `x ↦ 0`: `HH⁰(k[x],k) = k`, pinned `H⁰ = Hom_k(k[x],k) ↠ k²`. `A = k`: both sides `N, 0, 0, …`. | holds |
| 3.2 (sampled) | `δm(a) = am − ma`; `B⁰ = 0`. `Mat₂`: `E₁₁E₁₂ − E₁₂E₁₁ = E₁₂ ≠ 0`; scalars central. Commutative `A = M`: `HH⁰ = A`. `k = 0`: `0 = 0`. | holds |
| 3.3 (sampled) | Section `a ↦ (a,Da)`: `(a,Da)(b,Db) = (ab, aDb + Da·b)`, unit `(1, D1) = (1,0)` since `D1 = 2D1`. `δE₁₁(E₁₂) = E₁₂E₁₁ − E₁₁E₁₂ = −E₁₂`; `innerDerivation E₁₁ (E₁₂) = +E₁₂`. `k[x]`: `Inn = 0`, `Der ≅ k[x]` by `D ↦ Dx`. Map `1 ↦ 1, x^j ↦ 0`: `D(1·1) = 1 ≠ 2`. | holds |
| 3.4 (sampled) | `b₁ = 0`; `b(1⊗a⊗c) = a⊗c − 1⊗ac + c⊗a`. `k[x]/(x²)`: `Ω¹ = R/(2x)`, dimension `2` over `𝔽₂`, `1` over `ℚ`. `𝔽_p/ℤ`: `b₂ = 1 − 1 + 1 = 1`, `HH₁ = 0 = Ω¹`. `R = k`: `b₂ = 1`, `HH₁ = 0 = Ω¹_{k/k}`. | holds |
| 3.5 (R01) | Associator `= −δf(a,b,c)`. Unit: `δf(1,1,a) = f(1,a) − f(1,1)a`, so `u = −f(1,1)`. Transport `f′ = f − δg`. `k[x]/(x²)`, `f(x,x) = 1`: `δf = 0` on the eight basis triples (each term has `x` acting by `0` or cancels in pairs); `t² = (0,1)`, `t³ = (x,0)(0,1) = 0`; section `t + ct²` squares to `t²`. `k[x]`, `f(x,x²) = 1`: `δf(x,x,x) = 0 − 0 + 1 − 0 = 1`; products `(x³,0)`, `(x³,1)`. | holds; notation R01 |
| 3.6 (repaired contract) | Section of `A ⊕_f M`: `(a,g a)(b,g b) = (ab, g(ab))` iff `f = −δg`; unit `g(1) = −f(1,1) = δg(1,1)` automatic. `ℤ/4 → 𝔽₂`: `δ¹ = 1`, `δ² = 0`, `HH² = 0`, additive maps `𝔽₂ → ℤ/4` land in `{0,2}`. Pinned: `extensionClass = 0 ↔ Nonempty Splitting` under the five hypotheses. | holds |
| 4.2 (sampled) | `B₀`: `(hμ + b′h)(a₁⊗a₂) = 1⊗a₁a₂ + a₁⊗a₂ − 1⊗a₁a₂`. `B₁`: five terms sum to `a₀⊗a₁⊗a₂`. `A = k`: `b′_n = Σ_{i=0}^{n}(−1)^i`, augmented complex exact. `h(x·(1⊗1)) = 1⊗x⊗1 ≠ x⊗1⊗1`. `A = 0`: all terms `0`. | holds |
| 4.3 (sampled) | `φ(b′(1⊗a⊗b⊗1)) = aφ(1⊗b⊗1) − φ(1⊗ab⊗1) + φ(1⊗a⊗1)b`: `δ` with no sign. `n = 0`: `φ ↦ φ(1⊗1) ∈ M`, `φ(b′(1⊗a⊗1)) = am − ma = δm(a)`. | holds |
| 4.4 (sampled) | `A = k = M = ℤ`: `δ¹ = id`, `Z¹ = 0`, `HH¹ = 0 = Ext¹_ℤ(ℤ,ℤ)`, not `C¹ = ℤ`. Degree 0: `M^A = Hom_{Aᵉ}(A,M)` by `m ↦ (a ↦ am)`. `k = ℤ`, `A = 𝔽₂` (not projective): `HH^n(𝔽₂,𝔽₂) = 0` for `n ≥ 1` and, with `Aᵉ = 𝔽₂`, `Ext^n = 0` too, so this instance does not separate the hypothesis; it is the route's (the bar complex is a projective resolution only for `k`-projective `A`). | holds as stated |
| 5.2 (sampled) | `f,g ∈ C¹`: `δ(f∪g)(a,b,c) = af(b)g(c) − f(ab)g(c) + f(a)g(bc) − f(a)g(b)c`; `(δf∪g − f∪δg)(a,b,c)`: `±f(a)bg(c)` cancel, same four terms. `x ∈ C⁰`: `δ(x∪g)(a,b) = axg(b) − xg(ab) + xg(a)b = (δx∪g + x∪δg)(a,b)`. | holds |
| 5.3 (sampled) | Existence of `f̃`: `ε_Q f̃₀ d = f d = 0`, so `f̃₀d` lands in `im d^Q`. `g f̃_q d^P = g d^Q f̃_{q+1} = 0`. `q = 0`: `g = ḡ ε_Q`, `f̃₀ ≫ g = f ≫ ḡ`, and `extMk_comp_mk₀` (`Projective/Ext.lean:234`) has no sign: `s(p,0) = 1`. | holds; closed form of `s` not stated |
| 5.4 | `f̃_q ≫ g = (−1)^{pq} a₀f(a₁,…,a_p)g(a_{p+1},…,a_{p+q})a_{p+q+1}`; so `θ[f∪g] = (−1)^{pq} s(p,q) Ext.comp(θf)(θg)`. `(0,0)`: composition in `Z(A)`. | holds |
| 6.2 (headline) | `(1,1)` expanded term by term: `f∘δg + δf∘g − δ(f∘g) = g(a)f(b) + f(a)g(b)`. `f = g = ∂`: `−δ(∂²)(a,b) = 2∂a∂b`. Ginz05 (6.6.3) would give `2 = −2` at `(x,x)`. | holds |
| 6.3 (sampled) | `A = k`: both complexes `k` with differentials `0,1,0,…`. `𝔽_p/ℤ`: classical `HH₂ = 0`; derived `𝔽_p` (RefinedTraceMethods §1.10 at its head: `HH_{2n}(𝔽_p/ℤ) = 𝔽_p·u^{[n]}`). `ν₀ = 1`; the other signs are an existence statement. | holds as stated |
| 6.4 | `π₂ε₂(dx∧dy) = 2dx∧dy`. `k[x]/(x²)` over a field: `Ω² = ⋀²` of a cyclic module `= 0`, `HH₂ = ker(2x) ≠ 0`. | holds; (d) rests on the gap |
| 7.2 (sampled) | `ℚ[x]/(x²)`: differentials `0, 2x`; `HH₁ = R/(x)`, `HH₂ = xR`; `HH²(R,ℚ) = ℚ`, `Hom_R(xR,ℚ) = ℚ`, `h₂(f)(x e₂) = x f(e₂) = 0`. `𝔽_p/ℤ`: `C_j = 𝔽_p`, `δ^i = 0, 1` alternately, all `h_i` bijective. `n = 1`: only `HH₀ = R` is required. Pin: `∀ j < n` (`UniversalCoefficient/Basic.lean:212–213`). | holds |
| 7.3 (sampled) | Types: `⋀^n P* → Hom(⋀^n P**, R) → Hom(⋀^n P, R)`. Determinants: `det(ev(v_j)(f_i)) = det(f_i(v_j))`, the transpose of `det(f_j(v_i))`. `P = R²`: `1`; transposed wedge `−1`. `P = 0`: `⋀⁰ = R`. `R^{(ℕ)}` over a field: image of `f∧g` has rank `≤ 2`, the form `Σ e*_{2i}∧e*_{2i+1}` has infinite rank. | holds |
| 7.4 (sampled) | `τ₂(∂_x∧∂_y)(dx∧dy) = det(I₂) = 1`. `τ₀ = id_R`. `K[a]/(a² − u)`, `char 2`: `D(a² − u) = 2aD(a) = 0`, `Der = R·∂`, `T² = 0`. `Ω¹` on `d` generators: `⋀^n = 0` for `n > d` (`ExteriorPower/Basic.lean:418`). | holds |
| 7.5 | `Σ_σ sgn(σ) Π_i D_{σ(i)}(r_i) = det(D_j(r_i))`. `δ(D₁D₂)(a,b) = −(D₁aD₂b + D₂aD₁b)`. Pairings with `1⊗x⊗y − 1⊗y⊗x`: `1 − (−1) = 2`, `1 − 0 = 1`. | holds |
| 7.6 (headline) | `Ψ_n` well defined through (1): `h_n[D₁∪⋯∪D_n](ε(r₀dr₁⋯)) = r₀det(D_j(r_i))`, alternating in the `D_j` (graded commutativity alone gives only `2[D∪D] = 0`). `ℤ[1/2]/ℤ`: `C^n = ℤ[1/2]`, `HH^n = 0 = T^n` for `n ≥ 1`. Inseparable: `Rᵉ = R[b]/(b − a)²`, Hom-differentials `0`, `HH² = R`, `T² = 0`. `𝔽₂[x,y]`: `[⟨∂_x,∂_y⟩] = 2Ψ₂ = 0`. | holds under smooth, `k`-projective and the gap |
| 8.4 (headline) | `t_i` acts by `0` on `R`: both Koszul complexes have zero differential. `h_n[∂_I](ε(dX_J)) = det(∂_{i_a}X_{j_b}) = δ_{IJ}`. `k = 0`: singleton families are bases of the zero module. | holds, no gap |
| 8.5 (sampled) | `(X₁², X₂)`: `det = 2X₁`, normalised `gX₁`. `m = 1`: `g∂`. `m = 0`, `k = ℤ`, `g = 2`: cochain, class and `Φ⁰` all `2`; `⟨g∂₁,…⟩` read as the empty family would give `1`. `𝔽₂`, `m = 2`: `⟨∂₁,∂₂⟩ = δ(∂₁∂₂) ≠ 0`. | holds |

### Sources: the seeded sample

No locator is flagged unverified by the author. Read this round in the cached extractions:

| Target | Locator read | Outcome |
| --- | --- | --- |
| 1.2 | Ginz05 lines 1055–1062 | Coboundary formula with the signs of the conventions; lines 1049–1053 misprint (see Source issues). |
| 1.3 | Loday98, Weibel94 | Not readable (settled uncertified); the statement is recomputed above. |
| 3.2 | Ginz05 lines 1066–1069 | §5.3: degree-zero cocycles are the central elements; `HH⁰(A) = Z(A)`. |
| 3.3 | Ginz05 lines 398–411 and 1075–1085 | §3.1 derivations, inner derivations and the exact sequence (3.1.1); §5.4 `HH¹ = Der/Inn` and (5.4.1). |
| 3.4 | Ginz05 lines 1914–1926 | Definition 8.1.1 and `Ω¹ ≃ HH₁`. |
| 4.2 | Ginz05 lines 747–782; HKR62 lines 414–447 | Bar complex, homotopy and its check on two tensor factors; right-linear homotopy and projectivity from `K`-projective `R`. |
| 4.3 | Ginz05 lines 1033–1062; HKR62 lines 480–489 | Bimodule maps out of the bar complex as multilinear maps. |
| 4.4 | Ginz05 lines 984–988; HKR62 lines 337–351 | The source defines `HH^•` as `Ext_{Aᵉ}(A,M)`; derivations as `Ext¹` for commutative `R`. |
| 5.2 | Ginz05 lines 1342–1350 | Leibniz rule with `(−1)^{deg f}`, descent to cohomology, Yoneda product. |
| 5.3 | HKR62 lines 425–431 | The product on `Ext_S(R,−)`. CE56 not readable. |
| 6.3 | Ginz05 lines 963–976 | Identification of the terms and the boundary. Loday98 not readable. |
| 7.2 | HKR62 lines 301–330 | Lemma 4.1: `Tor_i` projective for `i < k` gives isomorphisms for `i ≤ k`. |
| 7.3 | HKR62 lines 531–535 | Dual of the exterior algebra of a finitely generated projective module. |
| 7.4 | Ginz05 lines 1130–1140; HKR62 line 548 | §6.1 polyvector fields; Theorem 5.2 over a perfect field. Mat86 not readable. |
| 8.5 | Ginz05 lines 2142–2156; HKR62 lines 495 and 548 | Alternation map and `π ∘ alt = p!`; product formula; Theorem 5.2. |

Also read: HKR62 lines 210–214, 268–279, 522–546, 569–582; AV20 lines 70–71 and 237–243; Ginz05
lines 96–97, 1088–1111, 1335–1341, 1358–1380, 2086–2088, 2187–2197; StacksSmooth lines 16920
(Tag 00T2) and 17399 (Tag 00TN). All nine cited works have exactly one manifest entry;
`sources.toml` was not changed and no `needs-references.toml` was written.

### Pinned declarations and library claims

Opened this round, all in the pinned copies:
`TauCeti/RingTheory/Extension/SquareZero/Basic.lean:69, 108, 122, 211, 246–247, 317, 325, 364–365,
368, 377–378, 387, 399`; `TauCeti/RingTheory/HochschildCohomology/Complex.lean:79, 91, 98, 124, 137,
166, 190, 207, 215, 248`; `Coboundary.lean:226, 282, 303, 318, 345, 351, 359, 371, 382, 396`;
`Dual.lean:138`; `TauCeti/RingTheory/Derivation/Bimodule.lean:41, 84, 89, 101` (no module structure
on `BimoduleDerivation`, as the contract says); `TauCeti/Algebra/Homology/Kronecker.lean:106`;
`TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean:212, 234`;
`TauCeti/LinearAlgebra/ExteriorPower/Basic.lean:145`;
`Mathlib/CategoryTheory/Abelian/Projective/Ext.lean:139, 154, 188, 196, 209, 224, 234, 255, 286`;
`Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:171`, `Ext/Linear.lean:88`;
`Mathlib/Algebra/Category/ModuleCat/Basic.lean:437`; `ModuleCat/Projective.lean:27`;
`Mathlib/Algebra/Homology/Embedding/Basic.lean:226`; `Mathlib/CategoryTheory/Abelian/Ext.lean:56`;
`Mathlib/CategoryTheory/Abelian/LeftDerived.lean:109`;
`Mathlib/AlgebraicTopology/DoldKan/Degeneracies.lean:180`, `HomotopyEquivalence.lean:81`,
`ExtraDegeneracy.lean:74`; `Mathlib/LinearAlgebra/ExteriorPower/Pairing.lean:64, 71`,
`Basis.lean:182`, `Basic.lean:418`; `Mathlib/LinearAlgebra/Dual/Lemmas.lean:141, 145`,
`Dual/Defs.lean:216`; `Mathlib/RingTheory/Smooth/Basic.lean:71`, `Smooth/Flat.lean:57`;
`Mathlib/RingTheory/Extension/Cotangent/Basic.lean:521`;
`Mathlib/RingTheory/Derivation/Basic.lean:278`, `Derivation/ToSquareZero.lean:116`;
`Mathlib/Algebra/Azumaya/Defs.lean:39`; `Mathlib/RingTheory/Regular/RegularSequence.lean:190`;
`Mathlib/RingTheory/MvPolynomial/Ideal.lean:63`.

Library claims rechecked by object: the only Mathlib file matching "Hochschild" is on group
cohomology (Hochschild–Serre); Tau Ceti has no codegeneracies for the bimodule cochains, no bar
resolution of an algebra over its enveloping algebra (the matches are group-homological), and no
bijectivity of `exteriorPower.pairingDual` beyond Mathlib's free case.
`TauCeti/RepresentationTheory/Quiver/PathAlgebra/BimoduleResolution.lean` is the length-one
bimodule resolution of a path algebra, on the path-algebra carrier; for one vertex and one loop it
is the `m = 1` case of §8.2 on a different carrier, and nothing of §8.2 restates it.

The worker's lead `TauCeti.StarkSystems.toExteriorBidual` (README line 1752): not at the pin, and
not claimed to be; it is IntegralIwasawaTheory §12.6's target (head, line 1848: namespace
`TauCeti.StarkSystems`, arguments `R, r, M`, determinant formula), cited as such.

### Duplication, citations and overlaps

| Citation | Where it resolves now | Agreement |
| --- | --- | --- |
| DGAInfinity Layers 0, 1, 8 | main, README lines 263, 293, 520–533 | Layer 8: chains and cochains, normalised versions, `[m,−]`, braces, deformations. |
| DerivedModuleAlgebra §0.K.1, §0.5 | main, lines 649, 1339 | As cited after the F03 repair. |
| NoncommutativeGeometry N1, N1.Cyclic; BanachAlgebras Layer 6; ZigzagPreprojective Layer 7 | main (N1.Cyclic at lines 18, 28, 119; Layer 6 at 1379; Layer 7 at 1047) | Scope clauses. |
| RefinedTraceMethods §§1.1, 1.9, 1.10 | open head, lines 84, 115, 404–443, 445–470 | Targets "The cyclic enhancement of supplied derived Hochschild chains" (flat: `(C_•(A/k), b)`; non-flat example `𝔽_p/ℤ`) and "The antisymmetrisation map and the HKR projection" (`ε` over `σ⁻¹`, `πε = n!`, `ε₁`) exist; the smooth case only for `ℚ ⊆ k` (line 433). |
| KTheoryFiniteLocalFields §4.0 | open head, lines 663, 675 | Target "Cyclic homology foundations": derived chains on DGAInfinity Layer 8, smooth HKR with the map unnamed. |
| EulerSystemsAndKolyvaginSystems §6.1; IntegralIwasawaTheory §12.6 | open heads, lines 3943–3962; 1846–1848 | "This map is an isomorphism for finite projective X"; carrier and determinant formula. |
| DerivedDeRhamCohomology Layer 2; LanglandsParameterStacks §1.17 | open heads, lines 3044; 527–528 | Scope deferrals. |

`scratch/overlaps.md`: no other pull request changes this roadmap, no dropped id, no id only an
open revision defines. No `HochschildHomologyAndHKR` folder on main or at an open head (search by
name: no match), and it is not in the board-packages index: no second copy. Searches over main
and the open heads: "Kostant.Rosenberg", "polyvector", "Koszul bimodule": no match; "normalised
Hochschild": AInfCohomology, RefinedTraceMethods and main (DGAInfinity, NoncommutativeGeometry),
imports or already cited; "`HH²` … square-zero": LanglandsParameterStacks §1.17 only, already
cited; "Yoneda product", "extMk": uses of Mathlib's `Ext.comp`, no statement of §5.3.
CyclicHomologyLieHomologyAndQuasiFreeAlgebras (head, scope lines 36–50, 85–88, and §4.1, lines
630–651) defines quasi-freeness by lifting, uses `Ext²_{Aᵉ}(A,M)` from Mathlib directly and leaves
Hochschild chains to KTheoryFiniteLocalFields §4.0; it owns no Hochschild complex, no `HH²`
classification and no HKR statement, and does not cite this roadmap.

Overlap check: read CyclicHomologyLieHomologyAndQuasiFreeAlgebras, RefinedTraceMethods,
SpectralSequencesAndConvergencePartII, RationalHomotopyModels, CohomologyOfGroups (open), DGAInfinity,
NoncommutativeGeometry, DerivedModuleAlgebra (main); shared: commutative square-zero extensions,
owner DerivedModuleAlgebra §0.5 (this roadmap owns the noncommutative `k`-split case and cites it);
the normalised quotient over `ℂ`, owner NoncommutativeGeometry N1.Cyclic, cited; antisymmetrisation
and derived chains, owners RefinedTraceMethods §1.9 and KTheoryFiniteLocalFields §4.0, imported;
braces and bracket, owner DGAInfinity Layers 0 and 8, imported; Koszul complex, owner
DerivedModuleAlgebra §0.K.1, imported; the universal coefficient sequence that
SpectralSequencesAndConvergencePartII and CohomologyOfGroups cite is the pinned Tau Ceti one, which
this roadmap cites too. Nothing has two owners.

### Supplier order

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2245 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Edges inside the roadmap run forward only; §8.4 needs §6.4(a), not
§6.4(d), §7.2 or §7.6, so the polynomial case does not use the gap.

### Gap

`smooth-hkr-antisymmetrisation` (supplier RefinedTraceMethods, §1.9): one statement with its
hypotheses (every commutative `k`, every smooth commutative `A`, every `n`). Not already provided:
§1.9 at its head gives the smooth case only for `ℚ ⊆ k`, and `π_nε_n = n!` gives nothing when
`n! = 0` (`𝔽₂[x,y]`, `n = 2`); §4.0 names no map; §8.4 here covers polynomial algebras only. Same
slug in the README (lines 679–686) and in the plan's `gaps` (`supplier` RefinedTraceMethods,
`section` §1.9, `neededBy` 6.4 and 7.6).

### Headline theorems and Lean

Headlines of the summary: normalisation over every `k` (2.1, 2.2); the low degrees and the `HH²`
classification (3.1–3.6); `HH^n ≅ Ext^n` and `HH_n ≅ Tor_n` for `k`-projective `A` (4.4, 4.5); cup
equals Yoneda up to sign (5.4); the homotopy formula and graded commutativity (6.2); the
cohomological HKR theorem with `[⟨D₁,…,D_n⟩] = n!·Ψ_n` (7.6); polynomial algebras (8.4, 8.5). There
is no `Suggested.lean` at the design stage, so the padding probe, the binder audit and the import
check do not apply yet.

### Copyright and arrangement

- **Wording.** 24 passages set beside the sources at their locators: the 18 locators of the
  sample table in Ginz05 and HKR62, and six further ones (§3.5's statement against Ginz05 lines
  1095–1106; §6.4's route against Ginz05 lines 2142–2156 and AV20 lines 237–243; §7.6's route
  against HKR62 lines 528–546; §7.6's statement against AV20 lines 70–71; §8.1's remark against
  Ginz05 lines 2193–2196; §8.4's locator note against HKR62 lines 268–279). Nothing is shared
  beyond formulae and standard names.
- **Arrangement.** Ginz05 has the largest share (46 of 122 source mentions). Its sections run §3
  derivations, §4 bar and reduced bar complex, §5 Hochschild theory defined as `Tor` and `Ext`
  with the low degrees and reduced cochains, §6 Gerstenhaber structures, §8 Kähler differentials,
  §9 HKR. The roadmap builds the complexes from simplicial modules first, normalises before the
  low degrees and puts both before the bar resolution; Layers 2, 6 and 8 have no counterpart
  section. No one-to-one run.
- **Reuse.** No table, figure, exercise list or data set is taken from a source.

Source independence: 24 passages compared with 3 sources (Ginz05, HKR62, AV20), none shared;
largest share Ginz05, 46 of 122 locators; contents compared with Ginz05: independent. Loday98,
Weibel94, CE56, Ger63 and Mat86 could not be read (settled uncertified).

## Not verifiable

- Loday98, Ger63, Weibel94, CE56, Mat86: settled uncertified; their section and theorem numbers
  were not checked against the texts. In the sample this covers the Loday98 locators of 1.2, 1.3,
  3.2, 3.4, 4.2, 5.2, 6.3 and 7.6, the Weibel94 locators of 1.2, 1.3, 3.3, 4.2, 4.4 and 7.6, the
  CE56 locators of 1.2, 3.3, 4.4 and 5.3, the Ger63 locator of 5.2 and the Mat86 locator of 7.4.
- Lean elaboration and the one-tactic probe: no Lean file at this stage, and this lane does not
  elaborate.
- The closed form of `s(p,q)` (§5.3) for `p, q ≥ 1` and the signs `ν_n` (§6.3) for `n ≥ 1`: the
  design states their existence; they depend on Mathlib's shift conventions and on DGAInfinity
  Layer 8's chain differential, a roadmap section and not a pinned declaration.
- The declared gap is a contract on RefinedTraceMethods §1.9, not a statement that exists today.

## Source issues

- **Error** in Ginz05 at §6.6, identity (6.6.3), p. 29 (line 1368): the source says the graded commutator of cup products is `d(f∘g) − df∘g − (−1)^p f∘dg`; it should be, for the coboundary of line 1058, `g∪f − (−1)^{pq} f∪g = df∘g + (−1)^q(d(f∘g) − f∘dg)`; affects a stated result.
- **Misprint** in Ginz05 at §3.1, p. 9 (line 404): the source says `ad m` maps `M → M` and is a derivation of `M`, for `m ∈ m`; it should be a map `A → M`, a derivation from `A` to `M`, for `m ∈ M`; affects nothing.
- **Misprint** in Ginz05 at §6.6, formula (6.6.2), p. 29 (line 1363): the source says the inner cochain takes the arguments `a_i,…,a_{i+q}`; it should be `a_i,…,a_{i+q−1}`, `q` arguments; affects nothing.
- **Misprint** in Ginz05 at §5.2, p. 22 (lines 1049–1053): the source says the inner terms of the recalled chain boundary carry no sign; it should be `(−1)^j` on the `j`-th term, as at lines 973–976; affects nothing.
- **Misprint** in Ginz05 at §5.2, p. 22 (line 1038): the source says the rank-one free bimodule `A⊗A` is a left module over `A ⊗ Aᵉ`; it should be a left module over `Aᵉ`; affects nothing.
- **Misprint** in Ginz05 at §5.3, p. 22 (line 1068): the source says the set of `m` with `am = ma` is the centre of the module `A`; it should be the centre of the bimodule `M`; affects nothing.
- **Gap** in Ginz05 at §9.3, proof of Theorem 9.1.3, p. 46 (lines 2193–2196): the source says the diagonal ideal of `A ⊗ A` is generated by a regular sequence when `X` is smooth; it should be claimed only after localising at points of the diagonal; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "443e10bdf764ad0640b512eeaab6642f7dec07ab", "job": "REV-DESIGN-HochschildHomologyAndHKR~11", "model": "fable", "worker": "chris-x55"} -->
