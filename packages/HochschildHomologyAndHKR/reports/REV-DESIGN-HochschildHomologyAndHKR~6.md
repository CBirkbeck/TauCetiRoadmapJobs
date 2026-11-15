<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13788#issuecomment-6895111537 -->
Review (claude) of f893f2a

Verdict: needs_changes

1. **F01** (P3) The pinned normalised cochain complex is not accounted for

   **Location.** `packages/HochschildHomologyAndHKR/design/README.md` lines 131–155 (the list of kept
   variants) and §2.2, lines 796–821: "Define the normalised Hochschild cochain complex `N^•(A,M)` as
   the subcomplex of `C^•(A,M)` of cochains `f` with `f(a₁,…,a_n) = 0` whenever some `a_i = 1`". The
   same in plan target 2.2.

   **Claim.** The scope names every pinned object that a target here varies, and says how the target
   differs (it does so for the normalised chains, lines 142–145, since round 5).

   **Witness.** `TauCeti/RingTheory/CyclicCohomology/Normalized/Basic.lean:41`
   (`TauCeti.normalizedHochschildCochains`: vanishing when a noninitial argument is `1`), `:278`
   (`normalizedHochschildCochainComplex`), `:300` (its inclusion into `hochschildCochainComplex`). The
   README names none of the three.

   **Exact repair.**

   - Scope, variants list: add "the normalised cochains of §2.2 differ from
     `TauCeti.normalizedHochschildCochains` (with `TauCeti.normalizedHochschildCochainComplex` and its
     inclusion `TauCeti.normalizedHochschildCochainComplexι`) by allowing an arbitrary bimodule of
     coefficients and by the homotopy equivalence with the full complex; for the dual bimodule
     `A →ₗ[k] N` of `TauCeti.DualBimodule`, §2.2 identifies the two under
     `TauCeti.multilinearCurryFirstEquiv`".
   - §2.2, one API bullet: "For a `k`-module `N` and `M = (A →ₗ[k] N)` with the dual bimodule
     structure, currying the first argument, `φ ↦ ((a₁,…,a_n) ↦ (x ↦ φ(x, a₁,…,a_n)))`, restricts to an
     isomorphism of `TauCeti.normalizedHochschildCochains k A N n` onto `N^n(A, A →ₗ[k] N)`, commuting
     with the differentials (`TauCeti.multilinearCurryFirstEquiv_hochschildCoboundary`) and with the
     inclusions into the full complexes."
   - §2.2 Needs, the Tau Ceti contract, Layer 2 Dependencies and plan 2.2 (prerequisites, one API
     entry, one test): add the four names.
   - §2.2, one Check: the instance below.

   **Repair test.** `A = k[x]`, `N = k`, `n = 1`, `φ(a₀,a₁) = (a₀ ∂_x a₁)(0)`. `φ(a₀,1) = 0`, so `φ` is
   in the pinned submodule; its curried form `ψ(a₁) = (x ↦ φ(x,a₁))` has `ψ(1) = 0`, so `ψ ∈ N¹`.
   Currying the last argument instead gives `ψ′(a)(y) = φ(a,y)` with `ψ′(1)(x) = φ(1,x) = 1 ≠ 0` for
   nonzero `k`: the wrong slot is excluded. At `n = 0` both sides are everything
   (`normalizedHochschildCochains_zero`, line 59, and `N⁰ = M`).

2. **F02** (P3) A Check of §4.2 is labelled with the source's degree, not the roadmap's

   **Location.** `packages/HochschildHomologyAndHKR/design/README.md` line 1059: "In degree two,
   `(h b′ + b′ h)(a₁ ⊗ a₂) = 1 ⊗ a₁a₂ + a₁ ⊗ a₂ − 1 ⊗ a₁a₂ = a₁ ⊗ a₂`". Plan target 4.2, test
   `bar_degree_two`, and its API entry "`b'∘h + h∘b' = id` in positive degrees and `μ∘h=id` in degree
   zero".

   **Claim.** The Check is an instance of the identities of §4.2 in the degree it names.

   **Witness.** §4.2 sets `B_n(A) = A ⊗ A^{⊗n} ⊗ A` (line 1039), so `a₁ ⊗ a₂ ∈ B₀(A)`, and line 1054
   states the identity there as `b′ ∘ h + h ∘ μ = id`. Ginz05 line 774 counts tensor factors (its
   "degree 2 piece" is `A^{⊗2}`); `B₂(A)` here is `A^{⊗4}`.

   **Exact repair.** README line 1059: "On `B₀(A) = A ⊗ A`,
   `(h μ + b′ h)(a₁ ⊗ a₂) = 1 ⊗ a₁a₂ + a₁ ⊗ a₂ − 1 ⊗ a₁a₂ = a₁ ⊗ a₂` (Ginz05 lines 774–782, where this
   term is called the degree-two piece)." Plan 4.2: rename the test `bar_degree_zero` with the same
   statement, and write the API entry as "`b′∘h + h∘b′ = id` on `B_n(A)` for `n ≥ 1`, `b′∘h + h∘μ = id`
   on `B₀(A)`, `μ∘h = id` on `A`".

   **Repair test.** On `B₀(A)`: `hμ(a₁ ⊗ a₂) = 1 ⊗ a₁a₂` and `b′h(a₁ ⊗ a₂) = a₁ ⊗ a₂ − 1 ⊗ a₁a₂`, sum
   `a₁ ⊗ a₂`. On `B₁(A)`, the first degree where `h b′` is the right term:
   `(b′h + hb′)(a₀ ⊗ a₁ ⊗ a₂) = (a₀⊗a₁⊗a₂ − 1⊗a₀a₁⊗a₂ + 1⊗a₀⊗a₁a₂) + (1⊗a₀a₁⊗a₂ − 1⊗a₀⊗a₁a₂) = a₀⊗a₁⊗a₂`.

Two findings, R01 and R02, both P3 (no P1, no P2). Each carries a repair, so the verdict asks for
changes: a fix round applies them. The declared gap `smooth-hkr-antisymmetrisation` (supplier
RefinedTraceMethods §1.9) is no finding: it is precise, minimal and declared under the same slug
in `packages/HochschildHomologyAndHKR/design/README.md` (lines 560–567) and in the `gaps` list of
`packages/HochschildHomologyAndHKR/design/plan.json`.

Files reviewed: `packages/HochschildHomologyAndHKR/design/README.md` (1910 lines, 37 targets in 8
layers), `packages/HochschildHomologyAndHKR/design/plan.json`,
`packages/HochschildHomologyAndHKR/sources.toml`. Pins: Mathlib
`1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`
(read from the content repository's `lake-manifest.json`; the plan's `baseline` agrees; both are
the pins of round 5). Roadmap main at `1a19c9f`. No maintainer notes were supplied. This is a
design: there is no `Suggested.lean`, and elaboration is not available (this lane does not
elaborate).

## Verification of the previous repairs

Round-5 review: three findings F01–F03, all P3. Each was checked against the design and the repair
report `packages/HochschildHomologyAndHKR/reports/FIX-DESIGN-HochschildHomologyAndHKR~6.md`.

| Round-5 finding | Repaired passage (README) | Assessment |
| --- | --- | --- |
| F01: a Check credited Ginz05 Theorem 9.1.3 with every field | Lines 1654–1658: "the theorem is then HKR62 Theorem 5.2 when `k` is perfect, and Ginz05 Theorem 9.1.3 when `k` is algebraically closed of characteristic zero"; lines 754–755, 802, 1636–1637, 1798–1799, 1891 state Ginzburg's ground field | **Repaired.** Ginz05 lines 96–97 fix an algebraically closed field of characteristic zero; line 2086 is Theorem 9.1.3 for a smooth affine variety; HKR62 line 548 is Theorem 5.2 over a perfect field. `𝔽₂[x,y]`: only HKR62 applies. |
| F02: Needs lines omitted exterior-power declarations | §8.2 lines 1721–1722: "free, with basis the wedges `e_I = e_{i₁} ∧ ⋯ ∧ e_{i_j}`"; Needs lines 1414–1416, 1588–1590, 1729, 1764, 1803; Check lines 1752–1755 | **Repaired.** At the pin: `Mathlib/LinearAlgebra/ExteriorPower/Basis.lean:95` (`Module.Basis.exteriorPower`), `Basic.lean:56, 212`; `Mathlib/RingTheory/Kaehler/Polynomial.lean:63`; `Mathlib/LinearAlgebra/Basis/Defs.lean:507`; `Mathlib/LinearAlgebra/Dimension/Basic.lean:168` (`rank_subsingleton`: rank `1` over the zero ring, as the new Check says). |
| F03: agreement with the pinned normalised chains asserted, not a target | §2.1 lines 772–780: "carries `D_n` onto `TauCeti.degenerateHochschildChains k A n` … induces an isomorphism of chain complexes `N_•(A,A) ≅ TauCeti.normalizedHochschildChains.chainComplex k A`"; Check lines 790–794; contract lines 404–416 | **Repaired.** `TauCeti/RingTheory/CyclicCohomology/Normalized/Chains.lean:53` (span of tensors with `1` in a slot `i ≠ 0`), `:69`, `:242`, `:250` (`b_tensor`: `Σ_i (−1)^i` of `hochschildFace i`), `:361`. The contract says "for a ring `A`"; the pinned `b` is stated for `NonAssocRing A` (line 237) and `chainComplex` for `Ring A` (line 342), so the contract is true as written. |

The repaired patterns were then searched for in the rest of the design. The F03 pattern (a pinned
variant of an object defined here, without the clause saying how the target differs) gave R01, its
cochain counterpart. The F01 pattern (a source credited beyond its setting) and the F02 pattern (a
declaration a statement uses that no Needs line names) gave nothing further: every Ginz05 locator
attached to a statement over general `k` now carries the field restriction or sits beside Loday98,
Weibel94 or HKR62, and every target that maps out of, or takes a basis of, an exterior power names
the declaration.

## Verified sound

### Principles and shape

- **General library.** `k` is an arbitrary commutative ring in every target; characteristic two
  is kept (the theorem is for `Ψ`, the determinant map is `n!` times it); the zero ring is covered
  by a convention; flat, projective and smooth hypotheses are stated per target.
- **Nothing re-planned.** Brackets and braces (DGAInfinity Layers 0, 8), derived chains
  (KTheoryFiniteLocalFields §4.0), antisymmetrisation (RefinedTraceMethods §1.9), the Koszul
  complex (DerivedModuleAlgebra §0.K.1) and the exterior bidual (IntegralIwasawaTheory §12.6,
  EulerSystemsAndKolyvaginSystems §6.1) are imported by section.
- **Searched and absent:** LaTeX delimiters, `set_option`, process words, pull-request numbers,
  dates, HTML anchors, machine paths. The seven hits of "lemma" are names of results in sources.
- **Organisation.** No layer is named after a source; the README does not say it follows one.
- **Shape.** 37 targets, each with a Needs line and a locator; every layer ends with Examples and
  Dependencies; every definition has at least three Checks (counts of round 5 re-read; §2.1 now
  has 4, §8.2 has 4).

### Adversarial table

Values computed in this round. `E_ij` are matrix units; `∂ = ∂_x`.

| Statement | Instances tried and values computed | Result |
| --- | --- | --- |
| §2.1 comparison (added in round 6) | `n = 1`: `D₁ = span{m ⊗ 1}`; pinned span: tensors `a₀ ⊗ 1` (slot `1 ≠ 0`). Boundary `2 → 1`: ours `a₀a₁⊗a₂ − a₀⊗a₁a₂ + a₂a₀⊗a₁`; pinned faces `0, 1, 2` with signs `+, −, +`, the last `(a₂a₀, a₁)`. `A = k`: both `0` above degree `0`. | holds |
| §8.2 basis (reworded in round 6) | `m = 2`: `K₁` basis `e₁, e₂`; `K₂` basis `e₁∧e₂`; `d(e₁∧e₂) = t₁e₂ − t₂e₁`. `m = 0`: `K₀ = Rᵉ = k`. `k = 0`: bases of the zero module; Mathlib rank `1`. | holds |
| §7.6 field Check (reworded) | `𝔽₂[x,y]`: HKR62 Thm 5.2 applies, Ginz05 does not. `ℂ[x]`: both. `𝔽₂(u)[x]`: neither is claimed. | holds |
| 1.2 | `A = M = k`: `δ^n = Σ_{i=0}^{n+1}(−1)^i`, so `δ⁰ = 0`, `δ¹ = 1`, `δ² = 0`. Wrong last sign: `δδE₁₁(E₁₂,E₂₂) = 2(E₁₁E₁₂E₂₂ − E₁₂E₁₁E₂₂) = 2E₁₂`. | holds |
| 1.5 | `b(1⊗x⊗1) = x⊗1 − 1⊗x + 1⊗x = x⊗1`; action through the first algebra slot on `b(1⊗1⊗1) = 1⊗1` gives `1⊗x`. `b(E₁₁E₁₂⊗E₂₁) = E₁₁ − E₂₂`, `E₁₁·b(E₁₂⊗E₂₁) = E₁₁`. | holds |
| 2.1 | `b(m⊗1⊗1) = m⊗1`. `b(1⊗x⊗x) = x⊗x − 1⊗x² + x⊗x`. | holds |
| 2.2 | `g(1) = 1`, `g(x^j) = 0`: `δg(1,1) = 1 − 1 + 1 = 1`. Dual-bimodule instance of R01: `φ(a₀,1) = 0`, `ψ(1) = 0`, wrong slot gives `1`. | holds; R01 |
| 3.3 | `δE₁₁(E₁₂) = E₁₂E₁₁ − E₁₁E₁₂ = −E₁₂`; pinned `innerDerivation E₁₁ (E₁₂) = +E₁₂`. Section `a ↦ (a,Da)`: `(a,Da)(b,Db) = (ab, aDb + Da·b)`. | holds |
| 3.5 | `k[x]/(x²)`, `f(x,x) = 1`: `δf(x,x,x) = 0`, `δf(1,x,x) = 1 − 1 = 0`; `t² = (0,1)`, `t³ = (0,1)(x,0) = 0`. `k[x]`, `f(x,x²) = 1`: `δf(x,x,x) = 1`; products `(x³,0)` and `(x³,1)`. `f = δg`: `f(1,1) = 1`, `f(1,x) = x`. | holds |
| 3.6 | `k = ℤ`, `A = M = 𝔽₂`: `δ¹ = 1`, `δ² = 0`, `HH² = 𝔽₂/𝔽₂ = 0`; `ℤ/4` not `ℤ`-split. Section `a ↦ (a,g(a))` multiplicative iff `f = −δg`, then `g(1) = −f(1,1)`. | holds |
| 4.2 | `B₀`: `hμ + b′h = id` (values under R02). `B₁`: the six terms cancel to `a₀⊗a₁⊗a₂`. `h(x·(1⊗1)) = 1⊗x⊗1`, `x·h(1⊗1) = x⊗1⊗1`. | holds; R02 |
| 4.3 | `(φ∘b′)(1⊗a⊗b⊗1) = a f(b) − f(ab) + f(a) b = δf(a,b)`. | holds, no sign |
| 4.4 | `A = k = M = ℤ`: `Z¹ = ker(δ¹ = 1) = 0`, `HH¹ = 0`. Degree one: `a₀⊗a₁⊗a₂ ↦ a₀D(a₁)a₂`. | holds |
| 4.5 | `m ⊗ (a₀⊗…⊗a_{n+1}) = m·(a₀ ⊗ op a_{n+1}) ⊗ (1⊗…⊗1) = a_{n+1} m a₀ ⊗ …`. Non-structure: `(1·(E₁₂⊗1))·(E₂₁⊗1) = E₂₁E₁₂ = E₂₂` against `E₁₁`. | holds |
| 5.1 | `(∂_x∪∂_y)(x,y) = 1`, `(∂_y∪∂_x)(x,y) = 0`. Reversed product, defect at `(E₂₁,E₁₂)`, `x = E₁₁`: `E₁₁ − E₂₂`. | holds |
| 5.3, 5.4 | `f̃_q` then `g`: `(−1)^{pq} a₀ f(a₁..a_p) g(a_{p+1}..a_{p+q}) a_{p+q+1}`, so `θ[f∪g] = (−1)^{pq} s(p,q)·comp`. `q = 0`: pinned `extMk_comp_mk₀` has no sign, so `s(p,0) = 1`. | consistent |
| 6.1 | `n = 0`: `[m,Θx](sa) = s(xa − ax) = −Θ(δx)(sa)`. `n = 2`: `[m,Θf] = s(f(a,b)c − a f(b,c) + f(ab,c) − f(a,bc)) = −Θ(δf)`. `f(a,b) = a∂b` at `(1,x,1)`: `δf = 0`, unsigned model `2`. Pinned signatures: `brace G F g q`, `gerstenhaberBracket G p q F g`, `hochschildDifferential q F`. | holds |
| 6.2 (headline) | `(1,1)`: right side `g(a)f(b) + f(a)g(b)`, all eight other terms cancel. `(1,0)`: both `y f(a) − f(a) y`. `(0,1)`: both `g(a)x − x g(a)`; at `E₁₁, id, E₁₂`: `−E₁₂`. `−δ(∂^{[2]})(x,x) = −(0 − 1 + 0) = 1`. | holds |
| 6.4 | `π₂ε₂(dx∧dy) = 2 dx∧dy`. `k[x]/(x²)` over `ℚ`: `Ω² = ⋀²(R/x) = 0`, `HH₂ = xR`. `𝔽_p` over `ℤ`: `b₂ = 1`, `HH₁ = HH₂ = 0`. | holds; (d) rests on the gap |
| 7.1 | Asymmetric bimodule `k` on `k[x]` (`x` by `1` left, `0` right): `δm(x) = m`, transpose of `b₁ = 0` gives `0`. `h₁(∂)([1⊗x]) = 1`. | holds |
| 7.2 | `ℚ[x]/(x²)`: `R ⊗ −` of the periodic resolution has differentials `0, 2x, 0`: `HH₁ = R/(x)`, `HH₂ = xR`; `HH²(R,ℚ) = ℚ`, `Hom_R(xR,ℚ) = ℚ`, `h₂(f)(x·e₂) = x·f(e₂) = 0`. `𝔽_p` over `ℤ`: `δ^i = 0` (even), `1` (odd). | holds |
| 7.3 | `toExteriorBidual(f₁∧f₂)(ev v₁ ∧ ev v₂) = det(f_i(v_j))`; `pairingDual` gives `det(f_j(v_i))`; transposes. | holds |
| 7.5 | `δ(D₁D₂)(a,b) = −(D₁a·D₂b + D₂a·D₁b)`. Evaluation on `ε₂(dx∧dy)`: determinant cocycle `1 − (−1) = 2`, cup product `1 − 0 = 1`. Injectivity: `⟨ξ⟩(r) = τ_n(ξ)(dr₁∧…∧dr_n)`, and the `dr₁∧…∧dr_n` span `Ω^n` over `R`. | holds |
| 7.6 (headline) | `𝔽₂[x,y]`: `Ψ₂` pairs to `1`, determinant class `2Ψ₂ = 0`. `ℤ[1/2]`: `C^n = ℤ[1/2]`, `HH^n = 0 = T^n` for `n ≥ 1`. Inseparable: `(a⊗1 − 1⊗a)² = 2u − 2a⊗a = 0`, `HH² = R`, `T² = 0`. Alternation of `Ψ`: `h_n[D∪D∪…]` on `ε_n` is a determinant with two equal columns. | holds under smooth, `k`-projective and the gap |
| 8.2 | `t_i` acts by `0` on `R`, so both vanishing hypotheses of `extLinearEquiv` hold in every degree. `m = 1`: `0 → Rᵉ –t→ Rᵉ → R`. | holds |
| 8.3 | `j = 2`: both sides `X₁⊗X₂⊗1 + 1⊗X₁⊗X₂ − X₂⊗X₁⊗1 − 1⊗X₂⊗X₁`. General `j`: first face `Σ_a (−1)^{a−1} X_{i_a} ⊗ …`, last face `−Σ_a (−1)^{a−1} … ⊗ X_{i_a}`, total `Σ_a (−1)^{a−1} t_{i_a}·ι(e_{I∖a})`. | holds |
| 8.4 (headline) | `h_n[∂_J∪](ε_n(dX_I)) = det(∂_{j_b}X_{i_a}) = δ_{IJ}`. `m = 0`: `HH₀ = HH⁰ = k`. | holds, no gap |
| 8.5 | `(X₁², X₂)`: `det = 2X₁`. `m = 0`, `g = 2`: `2`. | holds |

### Sources: the seeded sample

No locator is flagged as unverified by the author. Read in the cached extractions:

| Target | Locator read | Outcome |
| --- | --- | --- |
| 1.2 | Ginz05 lines 1055–1062 | Coboundary in degrees 0, 1 and `n`, the formula of the conventions. |
| 1.5 | Ginz05 lines 2161–2166 | Action of the centre on the coefficient factor, commuting with the differential. |
| 2.1 | Ginz05 lines 894–931 | Reduced bar complex and Corollary 4.5.2; field setting, as the README says. |
| 3.3 | Ginz05 lines 398–411, 1075–1085 | Derivations, inner derivations, sequences (3.1.1) and (5.4.1). |
| 4.2 | Ginz05 lines 747–782; HKR62 lines 414–447 | Bar complex, homotopy `h`; HKR62 lines 433–447 give the resolution `Y` for `K`-projective `R` with a right-linear homotopy. |
| 4.3 | Ginz05 lines 1033–1062; HKR62 lines 480–489 | `Hom_{Aᵉ}(A^{⊗(n+2)}, M) ≅ Hom_k(A^{⊗n}, M)`; `x₀ ζ(x₁) x₂`. |
| 4.4 | Ginz05 lines 984–988; HKR62 lines 337–351 | Definition as `Ext`; derivations as `Ext¹`. |
| 5.1 | Ginz05 lines 1335–1341; HKR62 lines 479–484 | Cup formula; value-wise product. |
| 5.3 | HKR62 lines 425–431 | The product on `Ext` and its independence of the resolution. |
| 6.4 | Ginz05 lines 2142–2156; AV20 lines 237–243 | Alternation map, projection, composite `p!`; the factorial remark. |
| 7.1 | HKR62 lines 284–298, 352–364 | The map `h`; identity in degree 0; its degree-one form. |
| 7.2 | HKR62 lines 301–330 | Lemma 4.1: projective for `i < k` gives isomorphisms for `i ≤ k`. |
| 7.5 | Ginz05 lines 2101–2156; HKR62 lines 509–521; AV20 lines 237–243 | Present. |
| 7.6 | HKR62 lines 301, 495, 522, 528–546, 548, 569–582; AV20 line 70; Ginz05 line 2086 | Theorem 5.1 assumes `K`-projective `R`; Theorem 5.2 a perfect field; Proposition 1.2 any commutative `k`, smooth `R`. |
| 8.2 | HKR62 lines 268–279; Ginz05 lines 2187–2197 | Koszul resolution with zero differential after tensoring; Lemma 9.3.1, proof omitted there. |

Every cited work has exactly one manifest entry. `sources.toml` was not changed and no
`needs-references.toml` was written.

### Pinned declarations

The pins are those of round 5, whose report resolved all 232 library names of the README to
declaring lines. Opened again this round, with file and line:

- `Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean:814`; `Mathlib/LinearAlgebra/TensorPower/Basic.lean:75, 97`;
  `Mathlib/LinearAlgebra/ExteriorPower/Basis.lean:95`, `Basic.lean:56, 212, 418`, `Pairing.lean:64, 71`;
  `Mathlib/RingTheory/Kaehler/Polynomial.lean:63`; `Mathlib/LinearAlgebra/Basis/Defs.lean:507`;
  `Mathlib/Algebra/Homology/Embedding/Basic.lean:226`; `Mathlib/RingTheory/Derivation/Basic.lean:278`;
  `Mathlib/AlgebraicTopology/DoldKan/Degeneracies.lean:148, 180`, `HomotopyEquivalence.lean:81`;
  `Mathlib/RingTheory/MvPolynomial/Ideal.lean:63`; `Mathlib/RingTheory/Regular/RegularSequence.lean:190`;
  `Mathlib/Algebra/Azumaya/Defs.lean:39, 52`;
  `Mathlib/CategoryTheory/Abelian/Projective/Ext.lean:139, 154, 188, 196, 209, 224, 234, 255, 286`
  (`extMk_comp_mk₀` carries no sign; `mk₀_comp_extMk` takes a `Hom R' R g`);
  `Mathlib/Algebra/Homology/DerivedCategory/Ext/Linear.lean:88`; `Mathlib/RingTheory/Smooth/Flat.lean:57`;
  `Mathlib/Algebra/Category/ModuleCat/Projective.lean:27`; `Mathlib/Algebra/GradedMonoid.lean:215`;
  `Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean:85`; `Mathlib/LinearAlgebra/Dimension/Basic.lean:168`.
- `TauCeti/LinearAlgebra/TensorCoalgebra/Brace.lean:94, 160, 330, 340, 354`;
  `TauCeti/Algebra/Homology/AInfinity/Algebra/Hochschild/Basic.lean:75, 86, 166, 183`,
  `Complex.lean:49, 103`, `Cohomology.lean:197, 213, 228`, `Normalized.lean:311`;
  `TauCeti/RingTheory/CyclicCohomology/Normalized/Chains.lean:53, 69, 242, 250, 361`,
  `Normalized/Basic.lean:41, 278, 300`; `TauCeti/RingTheory/CyclicCohomology/Cochain.lean:215`;
  `TauCeti/RingTheory/HochschildCohomology/Dual.lean:113, 138`, `Coboundary.lean:226, 282, 303, 318, 345, 351, 359, 371, 382`,
  `Complex.lean:137, 166`.
- By object: Mathlib mentions Hochschild only in the group-cohomology docstring. In Tau Ceti the
  Hochschild objects are the bimodule coboundary, the dual-coefficient complex, the normalised
  chains and cochains of the cyclic theory, the positive-arity `A∞` complex, its analogue for `A∞`
  categories, and the bounded theory of normed algebras. None is a chain complex with bimodule
  coefficients, a bar resolution over `Aᵉ`, a cup product, or a twisted square-zero extension
  (searched for each). The one pinned object the README does not account for is R01.

No backticked identifier is presented as this roadmap's own Lean declaration.
`TauCeti.StarkSystems.toExteriorBidual` (the one lead of the citation resolver) is a target of
IntegralIwasawaTheory §12.6, named there with the argument order `R, r, M`; it is a supplier's
name, not a library name, and the README presents it so.

### Duplication, citations and overlaps

Each citation was resolved now, on main or at the supplier's open head:

| Citation | Where it resolves | Agreement |
| --- | --- | --- |
| DGAInfinity Layers 0, 1, 8 | main, `TauCetiRoadmap/DGAInfinity/README.md:263, 293, 520` | Headings exist. |
| DerivedModuleAlgebra §0.K.1 | main, `TauCetiRoadmap/DerivedModuleAlgebra/README.md:649`; contract row at line 126 | Names the same pinned Koszul declarations. |
| NoncommutativeGeometry N1; BanachAlgebras Layer 6; ZigzagPreprojective Layer 7 | main, lines 479; 1379; 1047 | Scope deferrals only. |
| KTheoryFiniteLocalFields §4.0 | open head, README line 663, paragraph "Cyclic homology foundations" | Derived chains on DGAInfinity Layer 8; smooth HKR comparison asserted, map unnamed. |
| RefinedTraceMethods §§1.1, 1.9, 1.10 | open head, README lines 115–139, 404–432, 445–457 | §1.1: for `k`-flat `A` the derived object is `(C_•(A/k), b)`; `𝔽_p` over `ℤ` differs. §1.9: `ε_n`, `π_n ε_n = n!`, `ε₁`; smooth quasi-isomorphism only for `ℚ ⊆ k`. §1.10: `HH_{2n}(𝔽_p/ℤ) = 𝔽_p`. |
| EulerSystemsAndKolyvaginSystems §6.1 | open head, README lines 3943, 3955, 3961 | "This map is an isomorphism for finite projective X." |
| IntegralIwasawaTheory §12.6 | open head, README line 1848 | Owns `exteriorBidual`, `toExteriorBidual` in `TauCeti.StarkSystems`. |
| DerivedDeRhamCohomology Layer 2; LanglandsParameterStacks §1.17 | open heads, README lines 3044; 527 | Scope deferrals only. |

The overlaps report lists no other pull request changing this roadmap, no dropped id and no id
defined only by an open revision. No `HochschildHomologyAndHKR` folder exists on main, in an open
pull request or as another board package: no second copy. Searched main and the open heads for
polyvector fields, a Hochschild–Kostant–Rosenberg theorem, a bar resolution over the enveloping
algebra and the `HH²` classification of square-zero extensions: no other owner.
CyclicHomologyLieHomologyAndQuasiFreeAlgebras §4.1 uses `Ext²` over `Aᵉ` through Mathlib's
`instModuleTensorProductMop` to characterise quasi-free algebras and takes its Hochschild homology
from RefinedTraceMethods and KTheoryFiniteLocalFields; it defines no Hochschild complex with
bimodule coefficients and hands nothing to this roadmap.

Overlap check: read CyclicHomologyLieHomologyAndQuasiFreeAlgebras, RefinedTraceMethods,
RationalHomotopyModels, SpectralSequencesAndConvergencePartII, CohomologyOfGroups (the last three:
no Hochschild object; the name occurs only in "Hochschild–Serre"), DGAInfinity,
NoncommutativeGeometry, DerivedModuleAlgebra; nothing shared (antisymmetrisation and derived
chains: RefinedTraceMethods and KTheoryFiniteLocalFields, imported; brackets, braces and graded
cochains: DGAInfinity, imported; Koszul complex: DerivedModuleAlgebra, imported; the ungraded
complexes with bimodule coefficients, the `Ext` and `Tor` comparison and the cohomological HKR
theorem: this roadmap).

### Supplier order

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2233 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Suppliers: DGAInfinity and DerivedModuleAlgebra (main);
IntegralIwasawaTheory, KTheoryFiniteLocalFields, EulerSystemsAndKolyvaginSystems and
RefinedTraceMethods (all in the list of earlier roadmaps). None is on the never-cite list. Every
Needs line was read: edges inside the roadmap run forward only, and Layer 8 uses §6.4(a), not
§6.4(d) or §7.6, so the polynomial case does not depend on the gap.

### Headline theorems and Lean

Headlines of the summary: normalisation over every `k`; the low-degree identifications and the
`HH²` classification; `HH^n ≅ Ext^n` and `HH_n ≅ Tor_n` for `k`-projective `A`; cup equals Yoneda up
to sign; the sign dictionary, the homotopy formula and graded commutativity; the cohomological HKR
theorem with `[⟨D₁,…,D_n⟩] = n! Ψ_n`; the polynomial bases and the top-degree formula. There is no
`Suggested.lean` at the design stage, so the padding probe, the binder audit and the import check
do not apply yet.

### Copyright and arrangement

- **Wording.** The 15 sampled locators and six further passages were set beside the sources:
  the boundary convention (Ginz05 lines 973–976), §3.5 (lines 1088–1106), the §4.2 Check (lines
  774–782), §7.2's transport (HKR62 lines 311–330), §8.1's route (HKR62 lines 268–279) and the
  inseparable Check of §7.6 (HKR62 lines 569–582). Nothing is shared beyond formulae and standard
  names. The §4.2 Check repeats a two-term computation the source also makes; it is a formula, and
  R02 concerns only its label.
- **Arrangement.** Ginz05 has the largest share (46 of 121 source mentions). Its contents run
  §3 derivations, §4 bar complex, §5 Hochschild theory defined as `Tor` and `Ext` and then low
  degrees, §6 Gerstenhaber structures, §8 Kähler differentials, §9 HKR. The roadmap builds the
  complexes from simplicial modules first (Layers 1–2), puts the low degrees before the bar
  resolution (Layer 3 before Layer 4), and Layers 2, 6 and 8 have no counterpart section there.
  No one-to-one run of layers and sections exists.
- **Reuse.** No table, figure, exercise list or data set is taken from a source.

Source independence: 21 passages compared with 3 sources (Ginz05, HKR62, AV20), none shared;
largest share Ginz05, 46 of 121 locators; contents compared with Ginz05: independent. Loday98,
Weibel94, CE56, Ger63 and Mat86 could not be read (settled uncertified).

## Not verifiable

- Loday98, Ger63, Weibel94, CE56, Mat86: settled uncertified; their section and theorem numbers
  were not checked against the texts.
- Lean elaboration and the one-tactic probe: no Lean file at this stage, and this lane does not
  elaborate.
- The closed form of the sign `s(p,q)` of §5.3 for `p, q ≥ 1`: the design makes its existence a
  target; only `s(p,0) = 1` was checked at the pin.
- The signs `ν_n` of §6.3: they depend on DGAInfinity Layer 8's chain differential, a roadmap
  section and not a pinned declaration.
- The declared gap is a contract on RefinedTraceMethods §1.9, not a statement that exists today.

## Source issues

- none

The issues recorded in earlier rounds (Ginz05 lines 404, 1049–1053, 1363, 1364, 1368 and
2147–2150) were re-read and stand as recorded.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f893f2a58733515c2b1229943bbd474f6794a1f0", "job": "REV-DESIGN-HochschildHomologyAndHKR~6", "model": "fable", "worker": "chris-x79"} -->
