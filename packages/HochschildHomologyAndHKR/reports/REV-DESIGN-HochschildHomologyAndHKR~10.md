<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13788#issuecomment-6898665596 -->
Review (claude) of 7afe579

Verdict: needs_changes

1. **F01** (P3) The contract for the pinned class criterion omits one hypothesis

   **Location.** `packages/HochschildHomologyAndHKR/design/README.md` lines 524–527: "Under the further
   hypotheses `Module Bᵐᵒᵖ M`, `IsCentralScalar B M`, `Module A M` and `IsScalarTower A B M` (the
   symmetric bimodule over `A`), `TauCeti.Exal A B M` has the class of `TrivSqZeroExt B M` as its `0`".

   **Claim.** These four hypotheses are what the zero class and
   `TauCeti.SquareZeroExtension.extensionClass_eq_zero_iff` need.

   **Witness.** `TauCeti/RingTheory/Extension/SquareZero/Basic.lean:246–247`, `:364–365` and
   `:377–378`: each `variable` line continues with `[IsScalarTower A Bᵐᵒᵖ M]`; the `Zero` instance
   (`:368`) and the criterion (`:387`) are declared under all five.

   **Repair.** In the contract bullet, write "`Module Bᵐᵒᵖ M`, `IsCentralScalar B M`, `Module A M`,
   `IsScalarTower A B M` and `IsScalarTower A Bᵐᵒᵖ M`"; same list wherever plan target 3.6 states the
   hypotheses. Tested on the instance: in §3.6, `A = k`, `B = R`, and the bimodule convention (line
   224) already has `IsScalarTower k Rᵐᵒᵖ M`, so the comparison bullet needs no change.

2. **F02** (P3) The pinned cohomology `TauCeti.hochschildCohomology` is not named

   **Location.** README lines 151–156 (variants bullet on §1.2), 485–496 (contract for
   `TauCeti.hochschildCochainComplex`) and 924–934 (§2.2 comparison bullet).

   **Claim.** The contract lists what the pin has for cochains with values in a `k`-module: the
   complex, the normalised subcomplex and its inclusion.

   **Witness.** `TauCeti/RingTheory/HochschildCohomology/Complex.lean:166`: `abbrev
   hochschildCohomology`, the homology of that complex, with `hochschildCocycles` (`:79`),
   `hochschildCoboundaries` (`:91`), `hochschildCohomology.mk` (`:190`), `mk_surjective` (`:207`),
   `mk_eq_zero_iff` (`:215`), `desc` (`:248`). It is `HH^n(A, A →ₗ[k] N)`, a case of §1.2's `HH^n`.

   **Repair.** Add these names to the contract bullet at line 485 and to the scope sentence at line
   154; add to §2.2's comparison bullet: "hence `TauCeti.hochschildCohomology k A N n ≅
   HH^n(A, A →ₗ[k] N)`, carrying `TauCeti.hochschildCohomology.mk` to the class map"; add the names to
   §2.2's Needs line and plan target 2.2. Tested: `A = k[x]`, `N = k`, the Check's `φ(a₀,a₁) =
   (a₀∂a₁)(0)` is a pinned 1-cocycle whose class goes to `[ψ]`, `ψ(a)(y) = (y∂a)(0)`; in degree 0 the
   pinned cocycles are the traces (`:124`), and `HH⁰(A, A →ₗ[k] N)` is `{g | g(xa) = g(ax)}`, the same.

3. **F03** (P3) "Class zero exactly for split extensions" is attributed to DerivedModuleAlgebra §0.5

   **Location.** README lines 77–80: "§0.5: square-zero extensions … their isomorphism classes `Exal`
   with the Baer sum, the vanishing of the class exactly for split extensions"; lines 179–183: "keeps
   them with the criterion that the class vanishes exactly for split extensions".

   **Claim.** §0.5 states the criterion.

   **Witness.** Main, `TauCetiRoadmap/DerivedModuleAlgebra/README.md` lines 1341–1351: §0.5 says the
   trivial extension "is split", defines `Exal_A(B, M)` and the Baer sum, and states the
   derivation–section bijection; no "if and only if" for the class. The criterion is the pinned
   `extensionClass_eq_zero_iff` (`Basic.lean:387`).

   **Repair.** Line 79: replace "the vanishing of the class exactly for split extensions" by "the
   split trivial extension". Lines 182–183: "…and keeps them; Tau Ceti's
   `TauCeti.SquareZeroExtension.extensionClass_eq_zero_iff` proves that the class vanishes exactly for
   split extensions". Tested on the repair's own instance: `ℤ/4 → 𝔽₂` has no splitting and nonzero
   pinned class, which is what the pinned theorem, not §0.5's text, gives.

Three findings, all P3 (contract wording around the passages the last repair added, and one pinned
name left uncited), none blocking. No statement of the roadmap is false and none is missing a
hypothesis; each finding carries a repair to apply, so the review asks for changes. The declared gap
`smooth-hkr-antisymmetrisation` (RefinedTraceMethods §1.9) is precise, minimal and declared
under the same slug in the README and in `plan.json`; it is not a finding.

Files reviewed: `packages/HochschildHomologyAndHKR/design/README.md` (2107 lines, 8 layers, 37
targets), `packages/HochschildHomologyAndHKR/design/plan.json`,
`packages/HochschildHomologyAndHKR/sources.toml`. Pins read from the checked-out packages: Mathlib
`1b1ccf4b`, Tau Ceti `2fd255d9`; roadmap main at `1a19c9f`. No maintainer notes were supplied. This
is a design: there is no `Suggested.lean`, and elaboration is not available (this lane does not
elaborate).

## Verification of the previous repair

| Round-9 finding | Repaired passage | Assessment |
| --- | --- | --- |
| F01 (P2): the commutative case of §3.6 is the pinned `TauCeti.SquareZeroExtension` (DerivedModuleAlgebra §0.5), uncited | Scope, lines 105–109: "Tau Ceti's commutative square-zero extensions `TauCeti.SquareZeroExtension` with their morphisms … and the criterion `TauCeti.SquareZeroExtension.extensionClass_eq_zero_iff` (the objects of DerivedModuleAlgebra §0.5)"; variants bullet, lines 179–186; contract bullet, lines 514–530; §3.6 Needs, API bullet and Check, lines 1121–1138 and 1151–1163; Layer 3 Dependencies, lines 1176–1179; plan target 3.6 | **Repaired.** The eight pinned names exist (`TauCeti/RingTheory/Extension/SquareZero/Basic.lean:69, 108, 122, 211, 317, 325, 387, 399`). The comparison was recomputed (table below). Two wording slips in the added text are R01 and R03 (P3). |
| Same pattern in §3.3 (found by the repair) | Lines 1025–1028 and variants bullet 187–190; contract lines 358–362 | **Repaired.** `derivationToSquareZeroEquivLift` is at `Mathlib/RingTheory/Derivation/ToSquareZero.lean:116` with the hypotheses the contract states (`CommSemiring R`, `CommSemiring A`, `CommRing B`, `IsScalarTower R A B`, `I ^ 2 = ⊥`). |

The repaired pattern (a pinned or main-branch owner of a special case, not named) was searched for
again by object in the pins: it gives R02 (`TauCeti.hochschildCohomology`). Nothing else was found
(searches: every Tau Ceti file mentioning Hochschild, 60 files; codegeneracies; bar resolutions;
cup products on these carriers).

## Verified sound

### Principles and shape

- **General library.** `k` is an arbitrary commutative ring in all 37 targets; flatness
  (§§1.4, 6.3, 6.4), `k`-projectivity (§§1.4, 4.2, 4.4, 4.5, 5.4, 7.6) and smoothness (§§6.4(d),
  7.6) are per-target hypotheses, each with a negative control that I recomputed.
- **No re-planning, one direction of supply.** DGAInfinity, DerivedModuleAlgebra (main),
  IntegralIwasawaTheory, KTheoryFiniteLocalFields, EulerSystemsAndKolyvaginSystems,
  RefinedTraceMethods (merge-order lines 29, 90, 104, 331) are imported by section; none is on the
  never-cite list.
- **Hygiene.** Searched and absent: LaTeX delimiters, `set_option`, pull-request numbers, job ids,
  round labels, machine paths, HTML anchors, `lemma`, "optional", "deferred", "for later", a
  sentence saying the roadmap follows a source. No algorithm, no sorry'd data (no Lean file).
- **Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
  build, eight layers each ending with Examples and Dependencies, Downstream consumers, Worked
  examples, References. 37 Needs lines for 37 targets. `plan.json` parses: 8 layers, 37 targets,
  one gap; every definition or construction has at least three tests (13 targets, 3–4 each); the
  targets with no tests are theorems (1.3, 1.4, 4.3, 4.4, 5.2, 5.3, 5.4, 8.4). Every target has a
  locator in the README.
- **Organisation.** Layers are named by their mathematics; the order Layer 1 → 2 → 3 is forced by
  the Needs lines (§2.1 needs §1.1; §3.5 needs §2.2), Layer 4 by §4.3 needing §1.2, Layer 7 by
  §7.5 needing §§6.2 and 6.4(a), Layer 8 by §8.4 needing §§7.1, 7.4, 7.5.

### Adversarial table

`E_ij` are matrix units, `∂ = ∂_x`. Values were computed this round.

| Statement | Instances tried and values computed | Result |
| --- | --- | --- |
| 1.2 (sampled) | `A = M = k`: `δ^n = Σ_{i=0}^{n+1}(−1)^i` is `0` (n even), `1` (n odd); `HH⁰ = k`, `HH¹ = ker 1 = 0`, `HH² = k/k = 0`. Wrong last sign: `δδm(a,b) = 2(mab − amb)`, at `(E₁₁,E₁₂,E₂₂)`: `mab = E₁₂`, `amb = 0`, value `2E₁₂`. Dropping `δ⁰`: kernel `0` at `a = 1`. | holds |
| 1.5 | `b(1⊗x⊗1) = x⊗1 − 1⊗x + 1⊗x = x⊗1`; first-factor action on `b(1⊗1⊗1) = 1⊗1` gives `1⊗x`. `Mat₂`: `b(E₁₂⊗E₂₁) = E₁₁ − E₂₂`, `E₁₁·(E₁₁ − E₂₂) = E₁₁`. | holds |
| 2.1 (sampled) | `b(m⊗1⊗1) = m⊗1 − m⊗1 + m⊗1 = m⊗1`. `b(1⊗x⊗x) = 2x⊗x − 1⊗x²`. `A = k`: `Ā = 0`, `N_n = 0` for `n ≥ 1`. Slot comparison: image of `s_j` has `1` in slot `j+1`; last face `a_{n+1}a₀⊗…` with sign `(−1)^{n+1}` on both sides. | holds |
| 2.2 (sampled; R02) | `g(1) = 1`, `g(x^j) = 0`: `δg(1,1) = 1 − 1 + 1 = 1`. Pinned `φ(a₀,a₁) = (a₀∂a₁)(0)`: `bφ = (a₀a₁∂a₂ − a₀∂(a₁a₂) + a₂a₀∂a₁)(0) = 0`; `ψ(ab)(y) = (ya∂b + yb∂a)(0) = (a·ψ(b) + ψ(a)·b)(y)`; other slot: `ψ′(1)(x) = φ(1,x) = 1`. | holds |
| 3.1 (sampled) | `[E_ij,E_jj] = E_ij` (`i ≠ j`); `E₁₂E₂₁ − E₂₁E₁₂ = E₁₁ − E₂₂`; span = trace zero, quotient `k`. `Mat₀`: zero ring, `HH₀ = 0 ≠ k`. Commutative symmetric: `[A,M] = 0`. | holds |
| 3.2 (sampled) | `E₁₁E₁₂ − E₁₂E₁₁ = E₁₂ ≠ 0`; `δm = 0` iff `am = ma` for all `a`; `B⁰ = 0`. | holds |
| 3.4 (sampled) | `b₁ = 0`; `b(1⊗a⊗c) = a⊗c − 1⊗ac + c⊗a`, so `[1⊗ac] = a[1⊗c] + c[1⊗a]`. `k[x]/(x²)`: `Ω¹ = R/(2x)`, dimension `2` over `𝔽₂`, `1` over `ℚ`. `𝔽_p/ℤ`: `b₂ = 1 − 1 + 1 = 1`, `HH₁ = 0 = Ω¹`. | holds |
| 3.5 (sampled) | Associator of `A ⊕_f M` = `−δf(a,b,c)`. `δf(1,1,a) = f(1,a) − f(1,1)a`; `(1,u)(a,m) = (a, m + ua + f(1,1)a)`, so `u = −f(1,1)`. Transport: `f′ = f + g(aa′) − a g(a′) − g(a)a′ = f − δg`. `k[x]`, `f(x,x²) = 1`: `δf(x,x,x) = 0 − 0 + 1 − 0 = 1`; products `(x³,0)` and `(x³,1)`. `f = δg`: `f(1,x) = g(x) − g(x) + g(1)x = x`. | holds |
| 3.6 (sampled; repaired; R01, R03) | Commutator in `R ⊕_f M`: `(0, f(a,b) − f(b,a))`. `mul_ι`: `(a,m″)(0,m) = (0, am + f(a,0)) = (0,am)`. `δg(a,b) = ag(b) − g(ab) + bg(a)` symmetric. `k[x]/(x²)`, `f(x,x) = 1`: `(x,c)² = (0,1) ≠ 0`, no splitting. `ℤ/4 → 𝔽₂`: `x·2m = 2(x mod 2)m`; additive maps `𝔽₂ → ℤ/4` land in `{0,2}`; `δ¹ = 1`, `δ² = 0`, `HH² = 0`. `∂_x∪∂_y`: `f(x,y) − f(y,x) = 1`, an invariant of the class. | holds |
| 4.1 (sampled) | `(E₁₂⊗op E₂₁)·E₂₂ = E₁₂E₂₂E₂₁ = E₁₁`; reversed `E₂₁E₂₂E₁₂ = 0`. In `M ⊗_{Aᵉ} A`: `m⊗x = mx⊗1 = xm⊗1`. | holds |
| 4.2 (sampled) | `B₀`: `hμ + b′h = 1⊗a₁a₂ + a₁⊗a₂ − 1⊗a₁a₂`. `B₁`: the five terms sum to `a₀⊗a₁⊗a₂`. `A = k`: `b′_n = Σ_{i=0}^{n}(−1)^i`, exact. `h(x⊗1) = 1⊗x⊗1 ≠ x⊗1⊗1`. | holds |
| 4.3 (sampled) | `φ∘b′(1⊗a⊗b⊗1) = aφ(b) − φ(ab) + φ(a)b`: the `δ` of the conventions with no sign. | holds |
| 4.5 | `m⊗(aa₀⊗…⊗a_{n+1}b) ↦ a_{n+1}b·m·aa₀⊗…`, equal to the image of `(bma)⊗(a₀⊗…)`. Wrong structure: `E₂₁E₁₂ = E₂₂` against `E₁₁`. | holds |
| 5.1 (sampled) | `(∂_x∪∂_y)(x,y) = 1`, `(∂_y∪∂_x)(x,y) = 0`. Reversed cup, Leibniz defect at `x = E₁₁`, `g = id`, `(E₂₁,E₁₂)`: `E₁₁ − 0 + 0 − E₂₂`. | holds |
| 5.2 | `(δf∪g − f∪δg)(a,b,c)`: the two terms `±f(a)bg(c)` cancel, leaving the four terms of `δ(f∪g)`. | holds |
| 5.4 | Lift: `f̃₀b′ = a₀a₁f(a₂)⊗a₃ − a₀f(a₁a₂)⊗a₃ + a₀f(a₁)⊗a₂a₃ = −a₀f(a₁)a₂⊗a₃ + a₀f(a₁)⊗a₂a₃ = b′f̃₁` with the sign `(−1)^{pi}`; `f̃_q ≫ g = (−1)^{pq} f∪g`. | holds |
| 6.1 | `n = 2`: `[m,Θf] = s(f(a,b)c − af(b,c) + f(ab,c) − f(a,bc)) = −Θ(δf)`. `f(a,b) = a∂b`: `δf = ab∂c`; model without `(−1)^q` gives `2a(∂b)c − ab∂c`, `2` at `(1,x,1)`. Cup sign `(−1)^{p(q−1)}` at `(0,0), (0,1), (1,0), (1,1), (2,1), (1,2)`: `+, +, −, +, +, −`, each from the Koszul rule. | holds |
| 6.2 (headline) | `(1,1)`: all terms expanded, `δf∘g + f∘δg − δ(f∘g) = f∪g + g∪f`. `(1,0)`: right side reduces to `yf(a) − f(a)y`. `(0,1)`: `δx∘g = g(a)x − xg(a)`. `δ(∂²)(a,b) = −2∂a∂b`; `δ(∂^{[2]})(x,x) = −1`. | holds |
| 6.3 (sampled) | `A = k`: both complexes `k` with differentials `0,1,0,…`. `𝔽_p/ℤ`: classical `HH₂ = 0`, derived `𝔽_p` (RefinedTraceMethods §1.10 at its head). Only `ν₀ = 1` is fixed; the rest is an existence statement. | holds as stated |
| 6.4 | Cycle: sign of the last term of the cyclic shift is `sgn(σ)(−1)^{n−1}(−1)^n = −sgn(σ)`. `π₂ε₂(dx∧dy) = 2dx∧dy`. `k[x]/(x²)`: `Ω² = 0`, `HH₂ = ker(2x) ≠ 0`. | holds; (d) rests on the gap |
| 7.2 | `ℚ[x]/(x²)`: differentials `0, 2x`; `HH₁ = R/(x)`, `HH₂ = xR`; `HH²(R,ℚ) = ℚ`, `Hom_R(xR,ℚ) = ℚ`, `h₂ = 0`. `𝔽_p/ℤ`: `δ^i = 0, 1` alternately, all `h_i` bijective. Pin: `∀ j < n` in `kronecker_bijective_of_projective_homology_lt` (`UniversalCoefficient/Basic.lean:212`). | holds |
| 7.3 | `P = R²`: both maps give `det(I₂) = 1`, transposed wedge `−1`. Composite types: `⋀^n P* → Hom(⋀^n P**, R) → Hom(⋀^n P, R)`. | holds |
| 7.4 (sampled) | `τ₂(∂_x∧∂_y)(dx∧dy) = det(I₂) = 1`. Inseparable `K[a]/(a² − u)`: `D(a² − u) = 2aD(a) = 0`, `Der = R·∂`, `T² = 0`. `Ω¹` on `d` generators: `Ω^n = 0` for `n > d`. | holds |
| 7.5 | Multi-derivation, `n = 2`: `δf` cancels in three pairs. `δ(D₁D₂)(a,b) = −(D₁aD₂b + D₂aD₁b)`. Pairings with `1⊗x⊗y − 1⊗y⊗x`: `1 − (−1) = 2` and `1 − 0 = 1`. Injectivity into `C^n`: `τ_n` bijective, `dr₁∧…∧dr_n` generate. | holds |
| 7.6 (sampled, headline) | `Ψ_n` well defined through `h_n`, `ε^cl_n`, `τ_n`: `h_n[D₁∪⋯∪D_n](ε(r₀dr₁…)) = r₀det(D_j(r_i))`, alternating in the `D_j`. `ℤ[1/2]`: `C^n = ℤ[1/2]`, `HH^n = 0 = T^n` for `n ≥ 1`. Inseparable: `b² − u = (b − a)²`, Hom-differentials `0`, `HH² = R`, `T² = 0`. `𝔽₂[x,y]`: `[⟨∂_x,∂_y⟩] = 2Ψ₂ = 0`. | holds under smooth, `k`-projective and the gap |
| 8.3 | `b′ι(e₁∧e₂) = t₁·(1⊗X₂⊗1) − t₂·(1⊗X₁⊗1)`; unsigned defect `2(X₂⊗X₁⊗1 + 1⊗X₂⊗X₁ − 1⊗X₁X₂⊗1)`. | holds |
| 8.4 (headline) | `t_i` acts by `0` on `R`: both Koszul complexes have zero differential. `∂_I` on `ι(e_J)`: `det(∂_{i_a}X_{j_b}) = δ_{IJ}`, dual bases. `k = 0`: singleton families are bases of the zero module. | holds, no gap |
| 8.5 | `(X₁²,X₂)`: `det = 2X₁`. `m = 0`, `g = 2`: cochain, class and `Φ⁰` all `2`. | holds |

### Sources: the seeded sample

No locator is flagged unverified by the author. Read this round in the cached extractions:

| Target | Locator read | Outcome |
| --- | --- | --- |
| 1.2 | Ginz05 lines 1055–1062 | The coboundary formula, the same signs as the conventions. |
| 2.1 | Ginz05 lines 894–931 | §4.5, reduced bar complex, `Ā = A/k`; the README says the source's field is algebraically closed of characteristic zero (lines 96–97). Loday98 not readable. |
| 2.2 | Ginz05 lines 1120–1128 | §5.7, reduced cochains as `Hom_k(Ā^{⊗n}, M)`. |
| 3.1 | Ginz05 lines 941–953 | Commutator quotient and `HH₀`. |
| 3.2 | Ginz05 lines 1066–1069 | §5.3, degree-zero cocycles are central elements. |
| 3.4 | Ginz05 lines 1914–1926 | Definition 8.1.1 and `Ω¹ ≃ HH₁`. |
| 3.5 | Ginz05 lines 1088–1106 | §5.5: product twisted by a 2-cochain, associative iff cocycle, isomorphic iff cohomologous. |
| 3.6 | Ginz05 lines 1088–1111 | The same, and Remark 5.5.1 on unital extensions and the reduced complex. Weibel94 not readable. |
| 4.1 | Ginz05 lines 751–752, 934–947 | `(a₁⊗a₂ᵒᵖ)m = a₁ma₂`; left and right `Aᵉ`-modules; `M ⊗_{Aᵉ} A = M/[M,A]`. |
| 4.2 | Ginz05 lines 747–782; HKR62 lines 414–447 | Bar complex, homotopy, the check in the piece the source calls degree 2; right-linear homotopy and projectivity from `K`-projective `R`. |
| 4.3 | Ginz05 lines 1033–1062; HKR62 lines 480–489 | Bimodule maps out of the bar complex as multilinear maps. |
| 5.1 | Ginz05 lines 1335–1341 (inside §6.6, which starts at line 1327); HKR62 lines 479–484 | Cup product formula; value-wise product of cochains. |
| 6.3 | Ginz05 lines 963–976 | Identification of the terms and the boundary. Loday98 not readable. |
| 7.4 | Ginz05 lines 1130–1140; HKR62 line 548 | §6.1 polyvector fields; Theorem 5.2 over a perfect field. Mat86 not readable. |
| 7.6 | HKR62 lines 301–330, 495, 522–526, 528–546, 548; AV20 line 70; Ginz05 line 2086 | Lemma 4.1 (projective below `k` gives isomorphisms for `i ≤ k`); product formula; Theorem 5.1 for `K`-projective `R`; the deduction; Theorem 5.2; Proposition 1.2 over a commutative ring; Theorem 9.1.3. |

All nine cited works have exactly one manifest entry; `sources.toml` was not changed and no
`needs-references.toml` was written.

### Pinned declarations and library claims

All 251 backticked identifiers of the README were checked against the pins by declaration name;
those not found by name are mathematical symbols (`C_n`, `h_n`, …) and
`TauCeti.StarkSystems.toExteriorBidual`, which is IntegralIwasawaTheory §12.6's target and is cited
as such. Opened this round: `TauCeti/RingTheory/Extension/SquareZero/Basic.lean:69, 108, 122, 211,
246, 317, 325, 364, 377, 387, 399`; `TauCeti/RingTheory/HochschildCohomology/Complex.lean:79, 124,
137, 166`; `Coboundary.lean:226, 282, 303, 318, 345, 351, 359, 371, 382, 396`; `Dual.lean:50, 138`;
`TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean:212, 234`;
`TauCeti/Algebra/Homology/DG/Algebra/Defs.lean:116, 206`;
`TauCeti/Algebra/Homology/AInfinity/Algebra/DG.lean:143`, `Coderivation.lean:74`;
`TauCeti/RingTheory/MvPolynomial/RegularSequence.lean:44`;
`TauCeti/RingTheory/KoszulComplex/Basic.lean:399`, `Regular.lean:140`;
`Mathlib/RingTheory/Derivation/ToSquareZero.lean:116`; `Mathlib/Algebra/Azumaya/Defs.lean:39`;
`Mathlib/Algebra/TrivSqZeroExt/Basic.lean:853`;
`Mathlib/CategoryTheory/Abelian/Projective/Ext.lean:234, 255, 286`;
`Mathlib/Algebra/Homology/DerivedCategory/Ext/Linear.lean:88`;
`Mathlib/Algebra/Homology/HomologySequence.lean:293, 299, 314`;
`Mathlib/Algebra/Homology/Embedding/Basic.lean:226`;
`Mathlib/LinearAlgebra/ExteriorPower/Pairing.lean:64` (`⋀^n(M*) → (⋀^n M)*`, the direction §7.3
uses), `Basis.lean:182`, `Basic.lean:418`; `Mathlib/RingTheory/Regular/RegularSequence.lean:190`;
`Mathlib/RingTheory/Smooth/Basic.lean:71`; `Mathlib/Algebra/Category/ModuleCat/Projective.lean:27`;
`Mathlib/LinearAlgebra/Dimension/Basic.lean:168`. "Mathlib has no Hochschild complex": the only
Mathlib files matching are on universal enveloping algebras, pre-Lie algebras and group cohomology.

### Duplication, citations and overlaps

| Citation | Where it resolves now | Agreement |
| --- | --- | --- |
| DGAInfinity Layers 0, 1, 8 | main, README lines 263, 293, 520 | Layer 8: chains and cochains, normalised versions, `[m,−]`, braces, deformations. |
| DerivedModuleAlgebra §0.K.1, §0.5 | main, lines 649, 1339; contract row line 126 | §0.K.1 as cited; §0.5 see R03. |
| NoncommutativeGeometry N1.Cyclic; BanachAlgebras Layer 6; ZigzagPreprojective Layer 7 | main, lines 610; 1379; 1047 | Scope clauses. |
| RefinedTraceMethods §§1.1, 1.9, 1.10 | open head, lines 84, 115–117, 404–443, 445–470 | Target names "The cyclic enhancement of supplied derived Hochschild chains" and "The antisymmetrisation map and the HKR projection" exist; `ε` over `σ⁻¹`, `πε = n!`, `ε₁`; smooth case only with `ℚ ⊆ k`; `HH₂(𝔽_p/ℤ) = 𝔽_p`. |
| KTheoryFiniteLocalFields §4.0 | open head, lines 663, 675–683 | "Cyclic homology foundations": derived chains on DGAInfinity Layer 8, `HH₀(A) = A/[A,A]`, smooth HKR with the map unnamed. |
| EulerSystemsAndKolyvaginSystems §6.1; IntegralIwasawaTheory §12.6 | open heads, lines 3943–3966; 1846–1848 | "This map is an isomorphism for finite projective X"; carrier in `TauCeti.StarkSystems`, arguments `R, r, M`, determinant formula. |
| DerivedDeRhamCohomology Layer 2; LanglandsParameterStacks §1.17 | open heads, lines 3044; 527 | Scope deferrals. |

`roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
`scratch/overlaps.md`: no other pull request changes this roadmap, no dropped id, no id only an
open revision defines. No `HochschildHomologyAndHKR` folder on main or at an open head (search by
name: no match), and it is not in the board-packages index: no second copy. Searches over all
roadmaps for "Hochschild–Kostant", "polyvector", "Koszul bimodule": no match; "bar resolution":
group-cohomological and monadic uses only; "normalised Hochschild": DGAInfinity Layer 8 imports and
NoncommutativeGeometry line 610, both already cited. CyclicHomologyLieHomologyAndQuasiFreeAlgebras
§4.1 (head, lines 631–660) uses `Ext²_{Aᵉ}(A,M)` from Mathlib directly, defines quasi-freeness by
lifting and leaves Hochschild chains to KTheoryFiniteLocalFields §4.0; it owns no Hochschild
complex, no `HH²` classification and no HKR statement.

Overlap check: read CyclicHomologyLieHomologyAndQuasiFreeAlgebras, RefinedTraceMethods (scope and
Layer 1), DGAInfinity, NoncommutativeGeometry, DerivedModuleAlgebra, and RationalHomotopyModels,
SpectralSequencesAndConvergencePartII, CohomologyOfGroups by search; shared: commutative
square-zero extensions, owner DerivedModuleAlgebra §0.5 (this roadmap owns the noncommutative
`k`-split case and cites it); the normalised quotient over `ℂ`, kept by NoncommutativeGeometry
N1.Cyclic and cited; antisymmetrisation and derived chains, RefinedTraceMethods and
KTheoryFiniteLocalFields, imported; braces and bracket, DGAInfinity, imported; Koszul complex,
DerivedModuleAlgebra §0.K.1, imported. Nothing has two owners.

### Supplier order

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2245 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Edges inside the roadmap run forward only; §8.4 needs §6.4(a), not
§6.4(d), §7.2 or §7.6, so the polynomial case does not use the gap.

### Gap

`smooth-hkr-antisymmetrisation` (RefinedTraceMethods §1.9): one statement with its hypotheses
(every commutative `k`, every smooth commutative `A`, every `n`). Not already provided: §1.9 at
its head gives the smooth case only for `ℚ ⊆ k` (lines 430–434), and `π_nε_n = n!` gives nothing
when `n! = 0` (`𝔽₂[x,y]`, `n = 2`); §4.0 names no map. Same slug in the README (lines 669–674) and
in the plan's `gaps`. It asks for nothing this roadmap proves: §8.4 covers polynomial algebras
only.

### Headline theorems and Lean

Headlines of the summary: normalisation over every `k` (2.1, 2.2); the low degrees and the `HH²`
classification (3.1–3.6); `HH^n ≅ Ext^n` and `HH_n ≅ Tor_n` for `k`-projective `A` (4.4, 4.5); cup
equals Yoneda up to sign (5.4); the homotopy formula and graded commutativity (6.2); the
cohomological HKR theorem with `[⟨D₁,…,D_n⟩] = n!·Ψ_n` (7.6); polynomial algebras (8.4, 8.5). There
is no `Suggested.lean` at the design stage, so the padding probe, the binder audit and the import
check do not apply yet.

### Copyright and arrangement

- **Wording.** The passages at the locators of the sample (22 passages in Ginz05, HKR62 and AV20)
  and six further ones (§3.5's statement against Ginz05 lines 1095–1106, the §3.4 route against
  lines 1917–1926, the §4.2 Check against lines 774–782, the §7.2 statement against HKR62 lines
  301–310, the §7.6 route against lines 528–546, the §4.5 map against Ginz05 lines 963–966) were
  set beside the sources. Nothing is shared beyond formulae and standard names.
- **Arrangement.** Ginz05 has the largest share (46 of 122 source mentions). Its sections run §3
  derivations, §4 bar and reduced bar complex, §5 Hochschild theory defined as `Tor` and `Ext`
  with the low degrees and reduced cochains, §6 Gerstenhaber structures, §8 Kähler differentials,
  §9 HKR. The roadmap builds the complexes from simplicial modules first, normalises before the
  low degrees and puts both before the bar resolution; Layers 2, 6 and 8 have no counterpart
  section. No one-to-one run.
- **Reuse.** No table, figure, exercise list or data set is taken from a source.

Source independence: 28 passages compared with 3 sources (Ginz05, HKR62, AV20), none shared;
largest share Ginz05, 46 of 122 locators; contents compared with Ginz05: independent. Loday98,
Weibel94, CE56, Ger63 and Mat86 could not be read (settled uncertified).

## Not verifiable

- Loday98, Ger63, Weibel94, CE56, Mat86: settled uncertified; their section and theorem numbers
  were not checked against the texts. In the sample this covers the Loday98 locators of 1.2, 2.1,
  2.2, 3.1, 3.2, 3.4, 4.2, 5.1, 6.3 and 7.6, the Weibel94 locators of 1.2, 3.5, 3.6, 4.2 and 7.6,
  the CE56 locator of 1.2, the Ger63 locator of 5.1 and the Mat86 locator of 7.4.
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

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7afe579657b8fc7979b3d747bfb6f8a0750c23f8", "job": "REV-DESIGN-HochschildHomologyAndHKR~10", "model": "fable", "worker": "chris-x30"} -->
