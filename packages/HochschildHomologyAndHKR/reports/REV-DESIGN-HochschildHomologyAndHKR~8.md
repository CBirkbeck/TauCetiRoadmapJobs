<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13788#issuecomment-6897385802 -->
Review (claude) of 12f1858

Verdict: needs_changes

1. **F01** (P2) The normalised chains of §2.1 share their complex case with NoncommutativeGeometry N1.Cyclic, with no ownership clause

   **Location.** `packages/HochschildHomologyAndHKR/design/README.md`, scope, lines 149–152: "the
   normalised chains of §2.1 differ from `TauCeti.normalizedHochschildChains` by allowing an arbitrary
   bimodule of coefficients and by their comparison with the unnormalised complex"; contract, lines
   455–456; §2.1, lines 814 and 834–842.

   **Claim.** §2.1 proves `N_n(A,M) ≅ M ⊗[k] Ā^{⊗n}` and, for `M = A`,
   `N_•(A,A) ≅ TauCeti.normalizedHochschildChains.chainComplex k A`, and the scope presents the
   comparison of the pinned chains with `A ⊗ Ā^{⊗n}` as stated nowhere else.

   **Witness.** On main, `TauCetiRoadmap/NoncommutativeGeometry/README.md` lines 608–610 (N1.Cyclic):
   for unital complex `A`, "construct the normalized form quotient `A⊗(A/ℂ1_A)^⊗n`, its comparison
   with the pinned normalized Hochschild chains". That is §2.1 at `k = ℂ`, `M = A`. The scope cites
   this sentence for cochains only (lines 159–161).

   **Why P2.** One object (the identification of `A ⊗ (A/ℂ·1)^{⊗n}` with the pinned normalised chains)
   has two owners, one of them on main, and the text names neither as owner. The round-6 repair
   settled the cochain half of the same sentence of N1.Cyclic with a "keeps that statement" clause;
   the chain half was left out.

   **Exact repair.** No statement changes and no supplier edge is added (a statement over `ℂ` cannot
   supply the statement over every `k`).

   - Scope, the variants bullet on §2.1 (line 152), after "under `A ⊗[k] A^{⊗n} ≅ ⨂[k]^{n+1} A`" add:
     "; NoncommutativeGeometry N1.Cyclic constructs, for a unital complex algebra, the normalised form
     quotient `A ⊗ (A/ℂ·1)^{⊗n}` and its comparison with the pinned normalised chains, the case
     `k = ℂ`, `M = A` of §2.1's identifications `N_n(A,A) ≅ A ⊗ Ā^{⊗n}` and
     `N_•(A,A) ≅ TauCeti.normalizedHochschildChains.chainComplex k A`, and keeps that statement".
   - Contract, line 455: replace "the pinned file compares these chains neither with the unnormalised
     complex nor with `A ⊗ Ā^{⊗n}`; §2.1 does both" by "the pinned file compares these chains neither
     with the unnormalised complex nor with `A ⊗ Ā^{⊗n}`; §2.1 does both over every `k`
     (NoncommutativeGeometry N1.Cyclic plans the second comparison for complex algebras)".
   - Layer 2 Dependencies (line 920): after "No roadmap supplier is used" add "; the complex case of
     the comparison with `A ⊗ Ā^{⊗n}` is also stated by NoncommutativeGeometry N1.Cyclic (Scope)".

   **Repair test.** `k = ℂ`, `A = ℂ[x]`, `n = 1`: both N1.Cyclic's quotient and §2.1's `N₁(A,A)` are
   `A ⊗ (A/ℂ)`, kill `x ⊗ 1` and keep `1 ⊗ x ≠ 0`; the new clause names this as the shared case.
   `k = ℤ`, `A = ℤ[x]`: N1.Cyclic (complex scalars from N1.Cyclic on, its README lines 16–18) says
   nothing, and §2.1 is the only owner, as the clause says. `k = ℤ`, `A = 𝔽₂`: `Ā = 0`, `N_n = 0` for
   `n ≥ 1`, outside N1.Cyclic's scope as well.

2. **F02** (P3) The negative control of the first §6.2 Check gives the misprinted identity the true value

   **Location.** `packages/HochschildHomologyAndHKR/design/README.md` §6.2 Checks, line 1456: "and
   indeed `−δ(∂²)(a,b) = 2∂a ∂b`; Ginz05 (6.6.3) would give `δ(∂²) = −2∂a∂b` instead". Plan target
   6.2, first test (`plan.json` line 1214), same wording.

   **Claim.** The identity printed at Ginz05 line 1368 predicts a value different from the true one.

   **Witness.** `δ(∂²)(a,b) = a∂²b − ∂²(ab) + (∂²a)b = −2∂a∂b` is the true value, the one the same
   sentence has just derived. Ginz05 line 1368 at `f = g = ∂` (`p = q = 1`, `δ∂ = 0`) reads
   `2(∂ ∪ ∂) = δ(∂²)`, that is `δ(∂²)(a,b) = +2∂a∂b`.

   **Exact repair.** README line 1456: replace "Ginz05 (6.6.3) would give `δ(∂²) = −2∂a∂b` instead"
   by "Ginz05 (6.6.3) would read `2(∂ ∪ ∂) = δ(∂²)`, that is `2∂a∂b = −2∂a∂b`, which fails at
   `(a,b) = (x,x)` unless `4 = 0` in `k`". Plan 6.2, first test: replace "whereas Ginz05 (6.6.3) would
   give δ(∂²)=−2∂a∂b" by "whereas Ginz05 (6.6.3) would read 2(∂∪∂)=δ(∂²), i.e. 2=−2 at (x,x), false
   unless 4=0 in k".

   **Repair test.** `k = ℤ`, `(a,b) = (x,x)`: `2(∂ ∪ ∂)(x,x) = 2`, `δ(∂²)(x,x) = x·0 − ∂²(x²) + 0·x = −2`;
   the roadmap's identity gives `2 = −(−2)`, the printed one `2 = −2`, false. `k = 𝔽₂` or `ℤ/4`: both
   sides agree (`0 = 0`, `2 = −2`), which the reworded control now says.

Two findings: R01 (P2) and R02 (P3). Both repairs are a sentence each; no statement of the roadmap
is false. The declared gap `smooth-hkr-antisymmetrisation` (supplier RefinedTraceMethods §1.9) is
no finding: it is precise, minimal, and declared under the same slug in
`packages/HochschildHomologyAndHKR/design/README.md` (lines 622–629) and in the `gaps` list of
`packages/HochschildHomologyAndHKR/design/plan.json`.

Files reviewed: `packages/HochschildHomologyAndHKR/design/README.md` (2021 lines, 37 targets in 8
layers), `packages/HochschildHomologyAndHKR/design/plan.json`,
`packages/HochschildHomologyAndHKR/sources.toml`. Pins, read from the checked-out packages and
equal to the plan's `baseline`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti
`2fd255d997f47c0b5d834ee416c7015d55444ce5`. Roadmap main at `1a19c9f`. No maintainer notes were
supplied. This is a design: there is no `Suggested.lean`, and elaboration is not available (this
lane does not elaborate).

## Verification of the previous repairs

Round-7 review: two findings, F01 and F02, both P3, repair report
`packages/HochschildHomologyAndHKR/reports/FIX-DESIGN-HochschildHomologyAndHKR~8.md`.

| Round-7 finding | Repaired passage (README) | Assessment |
| --- | --- | --- |
| F01: pinned bimodule and enveloping-algebra declarations not accounted for in §4.1 | Contract, lines 386–404: "the restricted actions `a • m = (a ⊗ 1) • m` and `b • m = (1 ⊗ b) • m` (abbreviations, not instances) … neither pinned library has the two round trips or the equivalence of categories, which §4.1 adds"; scope lines 106–113 and 168–172; §4.1 lines 1104–1123; Layer 4 Dependencies lines 1236–1243; plan 4.1 (eight `tauceti:` prerequisites) | **Repaired.** Opened at the pin: `TauCeti/Algebra/TensorProduct/Module.lean:47` (`moduleLeft`, `abbrev`, `Module.compHom` along `includeLeft`), `:51`, `:55–62` (both `rfl`), `:65`, `:80`, `:88` (under `[Module k M] [IsScalarTower k (A ⊗[k] B) M]`), `:103` (`linearMapOfFactors`, hypotheses `hleft`, `hright`); `TauCeti/Algebra/CentralSimple/Bimodule.lean:110` (`@[expose] def Bimodule (_f : B →ₐ[K] A) : Type _ := A`), `:133` (`toEnd = (AlgHom.mulLeftRight K A).comp (map f id)`), `:142` (the instance), `:184` (`smul_of`: `f b * x * a.unop`); `Mathlib/Algebra/Azumaya/Defs.lean:39, 43, 52`. The pin's `CommSemiring`/`Semiring` are wider than the README's "commutative ring", so the README is true as written. |
| F02: the locators of §8.1 do not contain the statement | Lines 1801–1806: "the statement over every commutative `k` is proved by the route below; Loday98 §3.2 …; neither of the other sources names the `t_i`: HKR62 lines 268–271 obtain, by citation, a regular sequence generating a prime ideal with regular quotient of a regular local ring, and Ginz05 §9.3, lines 2193–2196, asserts without proof …"; §8.4 line 1907; plan 8.1 `locator` (Loday98); `sources.toml` Loday98 `cited_for` has "§8.1" | **Repaired.** HKR62 lines 263–271: regular local `L`, prime `J` with `L/J` regular, sequence by citation, unnamed. Ginz05 lines 2193–2196: `R = A ⊗ A`, `J` the diagonal ideal, regular sequence asserted for smooth `X`; lines 96–97 fix the ground field. The wording now matches both. |

Adversarial pass on the changed passages: rows 4.1 and 8.1 of the table. The repaired patterns were
searched for in the rest of the design. The F01 pattern (an existing object a target contains,
without a citation), searched by object in the pins and in the roadmaps on main, gave R01. The F02
pattern (a locator that does not contain its statement) was tested on the 14 readable sampled
targets and gave nothing; the source-related slip found is R02.

## Verified sound

### Principles and shape

- **General library.** `k` is an arbitrary commutative ring in all 37 targets; flatness,
  projectivity and smoothness are per-target hypotheses, each with a negative control (rows 1.4,
  7.6); characteristic two and the zero ring are treated.
- **Nothing re-planned, single direction of supply.** Citation table and gate below; R01 is the one
  shared object.
- **Hygiene.** Searched and absent in the README: LaTeX delimiters, `set_option`, pull-request
  numbers, process words, machine paths, HTML anchors, a statement that the roadmap follows a
  source. The hits of "round" are "round trips" and "ground ring"; no `lemma` keyword is used.
- **Shape.** 37 targets, each with a Needs line and a locator; all eight layers end with Examples
  and Dependencies. Checks per definition or construction, counted in the README: 1.1: 3, 1.2: 3,
  1.5: 3, 2.1: 4, 2.2: 4, 3.3: 4, 3.5: 4, 4.1: 3, 4.2: 3, 4.5: 4, 5.1: 3, 6.1: 4, 7.1: 3, 7.3: 3,
  7.4: 3, 7.5: 4, 8.2: 4, 8.3: 3. No backticked identifier is presented as this roadmap's own Lean
  declaration.
- **Plan.** `plan.json` parses: 8 layers, 37 targets, one gap; the entries for 1.4, 4.1, 7.6, 8.1
  and 8.5 were read against the README and agree (hypotheses, prerequisites, tests).

### Adversarial table

Values computed in this round. `E_ij` are matrix units, `∂ = ∂_x`.

| Statement | Instances tried and values computed | Result |
| --- | --- | --- |
| 1.1 (sampled) | `b∘b(m ⊗ a ⊗ c) = mac − cma − (mac − acm) + cma − acm = 0`. `A = M = k`: `b_n = Σ_{i=0}^n (−1)^i`: `b₁ = 0`, `b₂ = 1`, so `HH₀ = k`, `HH₁ = k/k = 0`, `HH₂ = ker 1 = 0`. `b(E₁₂ ⊗ E₂₁) = E₁₁ − E₂₂`; with `m a_n` in the last face, `ma − ma = 0`. | holds |
| 1.4 (sampled) | `k = ℤ`, `A = ℤ × 𝔽₂` (not flat), `0 → ℤ →2→ ℤ → 𝔽₂ → 0` with `A` acting through `ℤ` (not `ℤ`-split): degree one of chains is `ℤ ⊕ 𝔽₂ → ℤ ⊕ 𝔽₂`, `(2, 0)`, kernel `0 ⊕ 𝔽₂ ≠ 0`. Cochains: `Hom_ℤ(A, ℤ) = ℤ → Hom_ℤ(A, 𝔽₂) = 𝔽₂²`, image of dimension one. Both hypotheses are needed. Degree `0`: the sequence itself. `A = ℤ[x]` (free): `− ⊗ A^{⊗n}` and `Hom(A^{⊗n}, −)` exact. | holds |
| 1.5 (sampled) | `b(1 ⊗ x ⊗ 1) = x ⊗ 1 − 1 ⊗ x + 1 ⊗ x = x ⊗ 1`; first-factor action on `b(1 ⊗ 1 ⊗ 1) = 1 ⊗ 1` gives `1 ⊗ x ≠ x ⊗ 1`. `Mat₂`: `b(E₁₁E₁₂ ⊗ E₂₁) = E₁₁ − E₂₂`, `E₁₁ b(E₁₂ ⊗ E₂₁) = E₁₁`. `R = k`: `k`-structure. | holds |
| 2.1 (R01) | `b(m ⊗ 1 ⊗ 1) = m ⊗ 1`; `b(1 ⊗ x ⊗ x) = 2x ⊗ x − 1 ⊗ x²`. `k = ℤ`, `A = 𝔽₂`: `Ā = 0`, `N_n = 0` for `n ≥ 1`, and `HH_n(𝔽₂,𝔽₂) = 0` for `n ≥ 1` from `b_n = 0, 1, 0, …`. `k = ℂ`, `A = ℂ[x]`: `N₁ = A ⊗ A/ℂ`, the quotient of N1.Cyclic. | holds; R01 |
| 2.2 (sampled) | `φ(a₀,a₁) = (a₀∂a₁)(0)`: `bφ(a₀,a₁,a₂) = (a₀a₁∂a₂ − a₀∂(a₁a₂) + a₂a₀∂a₁)(0) = 0`. Curried `ψ(ab)(y) = (ya∂b + yb∂a)(0) = ψ(b)(ya) + ψ(a)(by) = (a·ψ(b) + ψ(a)·b)(y)`. Last slot: `ψ′(1)(x) = φ(1,x) = 1 ≠ 0`. `δg(1,1) = g(1) − g(1) + g(1) = 1`. | holds |
| 3.3 (sampled) | `δE₁₁(E₁₂) = E₁₂E₁₁ − E₁₁E₁₂ = −E₁₂`; `innerDerivation E₁₁ (E₁₂) = E₁₁E₁₂ − E₁₂E₁₁ = E₁₂`. `D(1) = 2D(1)`. `k[x]`: `Inn = 0`, `D ↦ D(x)`. Exactness at `M`: `ker(m ↦ δm) = M^A`. | holds |
| 3.4 (sampled) | Well defined: `b(a ⊗ b ⊗ c) = ab ⊗ c − a ⊗ bc + ca ⊗ b ↦ ab dc − a d(bc) + ca db = 0`. `k[x]/(x²)`: `Ω¹ = R dx/(2x dx)`, dimension `2` over `𝔽₂`, `1` over `ℚ`. `𝔽_p/ℤ`: `b₂ = 1 − 1 + 1 = 1`, `HH₁ = 0 = Ω¹`. | holds |
| 3.5 (sampled) | `k[x]/(x²)`, `f(x,x) = 1`: `δf(x,x,x) = x·1 − f(0,x) + f(x,0) − 1·x = 0`; `t² = (0,1)`, `t³ = (0, 1·x + f(0,x)) = 0`. `k[x]`, `f(x,x²) = 1`: `δf(x,x,x) = 0 − 0 + 1 − 0 = 1`; products `(x³, f(x²,x)) = (x³,0)` and `(x³, f(x,x²)) = (x³,1)`. `f = δg`, `g(1) = 1`: `f(1,1) = 1`, `f(1,x) = x`, `(1,−1)(a,m) = (a, m − a + f(1,a)) = (a,m)`. | holds |
| 4.1 (sampled; changed in round 8) | `(E₁₂ ⊗ op E₂₁)·E₂₂ = E₁₂E₂₂E₂₁ = E₁₁`; reversed `E₂₁E₂₂E₁₂ = 0`. `moduleLeft`: `(E₁₂ ⊗ 1)·E₂₂ = E₁₂`; `moduleRight`: `(1 ⊗ op E₂₁)·E₂₂ = E₂₂E₂₁ = E₂₁ = m·b`. Round trip: `(a ⊗ op b)·m = (a ⊗ 1)(1 ⊗ op b)·m = a(mb)`. Right structure on `Aᵉ`: `(x ⊗ op y)·(a ⊗ op b) = bx ⊗ op(ya)`, left multiplication by `b ⊗ op a`. | holds |
| 4.2 (sampled) | `A = k`: `b′ : B₁ → B₀` is `1 − 1 = 0`, `B₂ → B₁` is `1`, `μ = 1`: `⋯ →1→ k →0→ k →1→ k → 0` exact. `B₀`: `hμ + b′h = 1 ⊗ a₁a₂ + a₁ ⊗ a₂ − 1 ⊗ a₁a₂`. `h(x·(1 ⊗ 1)) = 1 ⊗ x ⊗ 1 ≠ x ⊗ 1 ⊗ 1`; `h((1 ⊗ 1)·x) = 1 ⊗ 1 ⊗ x = h(1 ⊗ 1)·x`. | holds |
| 5.2 (sampled) | `(0,1)`: `δ(x ∪ g)(a,b) = axg(b) − xg(ab) + xg(a)b`; `(δx ∪ g + x ∪ δg)(a,b) = (ax − xa)g(b) + x(ag(b) − g(ab) + g(a)b)`, equal. `(1,1)`: `δf ∪ g − f ∪ δg` cancels `±f(a)bg(c)` and leaves the four terms of `δ(f ∪ g)`. | holds |
| 5.4 | `g ∘ f̃_q = (−1)^{pq} a₀ f(a₁,…,a_p) g(a_{p+1},…,a_{p+q}) a_{p+q+1}`, so `comp = s(p,q)(−1)^{pq} θ[f ∪ g]`; `q = 0`: sign `1`, `extMk_comp_mk₀`. | holds |
| 6.2 (sampled, headline; R02) | `(0,0)`: both sides `yx − xy`. `(1,0)`: `δf∘y + δ(f(y)) − f∘δy = yf(a) − f(ya) + f(y)a − af(y) + f(ay) − f(a)y + af(y) − f(y)a − f(ay) + f(ya) = yf(a) − f(a)y`. `(0,1)`: `δx∘g = g(a)x − xg(a)`. `(1,1)`: twelve terms, ten cancel, `g(a)f(b) + f(a)g(b)`. Antisymmetrised: `δ{f,g} = {f,δg} − (−1)^q{δf,g}`, coefficients of `δg∘f` and `g∘δf` matched with `(−1)^{pq+p+q} = −(−1)^{(p−1)(q−1)}`; under `Θ` it is `(−1)^{q+1}Θ{δf,g} + Θ{f,δg}`, the pinned Leibniz rule. `δ(∂²)(x,x) = −2`; `−δ(∂^{[2]})(x,x) = 1`. | holds; R02 |
| 6.4 | `π₂ε₂(dx ∧ dy) = 2 dx ∧ dy`. `k[x]/(x²)`: `Ω² = 0` (cyclic `Ω¹`), `HH₂ = ker(2x) ≠ 0`. | holds; (d) rests on the gap |
| 7.1 (sampled) | `(f∘b)(r₀ ⊗ r₁ ⊗ r₂) = r₀r₁f(r₂) − r₀f(r₁r₂) + r₂r₀f(r₁) = r₀ δf(r₁,r₂)` for symmetric `M`. Asymmetric `k` on `k[x]` (`x ↦ 1` left, `0` right): `δm(x) = m`, transpose of `b₁ = 0`. `h₁(∂)([1 ⊗ x]) = 1`. | holds |
| 7.2 | `ℚ[x]/(x²)`: differentials `0`, `2x`; `HH₁ = R/(x)`, `HH₂ = xR`; `HH²(R,ℚ) = ℚ`, `h₂(f)(xe₂) = xf(e₂) = 0`; `h₁ : ℚ → Hom(R/(x), ℚ) = ℚ` bijective. Splitting argument: `B_j ⊂ Z_j ⊂ X_j` summands for `j < n`, so every map `B_{n−1} → Y` extends to `X_{n−1}`. | holds |
| 7.6 (sampled, headline) | `𝔽₂[x,y]`: `[∂_x ∪ ∂_y]` pairs to `1 − 0 = 1` with `1 ⊗ x ⊗ y − 1 ⊗ y ⊗ x`; determinant class `2·1 = 0`. `ℤ[1/2]`: `C^n = Hom_ℤ(ℤ[1/2], ℤ[1/2]) = ℤ[1/2]`, `δ = 0, 1, 0, …`, `HH^n = 0 = T^n` for `n ≥ 1`. Inseparable `K[a]/(a² − u)`: Hom-differentials `0`, `2a = 0`, `HH² = R`, `T² = 0`; HKR62 lines 573–577 give `h*(α)(ζ,ζ) = a`. Clause (5): `Ω^n = 0` for `n > d`. | holds under smooth, `k`-projective and the gap |
| 8.1 (sampled; changed in round 8) | `m = 1`, `k = ℤ/4`: `t = −Y` monic in `k[X][Y]`, regular, kernel of `Y ↦ 0` is `(Y)`. `m = 0`: `Rᵉ = k`, kernel `0`. `k[x]/(x²)`: `t(x ⊗ 1 + 1 ⊗ x) = 0`. `(t₁,…,t_j) = (Y₁,…,Y_j)` as ideals. | holds |
| 8.3 | `b′ι(e₁ ∧ e₂) = X₁⊗X₂⊗1 + 1⊗X₁⊗X₂ − X₂⊗X₁⊗1 − 1⊗X₂⊗X₁ = t₁·(1⊗X₂⊗1) − t₂·(1⊗X₁⊗1)`; unsigned defect `2(X₂⊗X₁⊗1 + 1⊗X₂⊗X₁ − 1⊗X₁X₂⊗1)`. | holds |
| 8.4 (headline) | `(∂_{i₁} ∪ ⋯ ∪ ∂_{i_n})(ι e_J) = Σ_σ sgn(σ) Π_a ∂_{i_a}X_{j_{σ(a)}} = δ_{IJ}`: dual bases, so `h_n` is bijective here without §7.2 or the gap. | holds, no gap |
| 8.5 (sampled) | `(X₁², X₂)`: `det = 2X₁·1 − 0 = 2X₁`, normalised `gX₁`. `m = 1`: `g∂`, `1! = 1`. `m = 0`, `g = 2`: cochain, class and `Φ⁰` all `2`. Zero ring: `HH^m = 0` has a one-element basis, rank `1` (`Module.rank` of a module over the zero ring). | holds |
| Gap `smooth-hkr-antisymmetrisation` | `𝔽₂[x,y]`: `π₂ε₂ = 2 = 0`, so `π_nε_n = n!` gives no injectivity. RefinedTraceMethods §1.9 at its head: smooth quasi-isomorphism only for `ℚ ⊆ k`. KTheoryFiniteLocalFields §4.0: isomorphism asserted, map unnamed. | precise and minimal |

### Sources: the seeded sample

No locator is flagged as unverified by the author. Read in the cached extractions:

| Target | Locator read | Outcome |
| --- | --- | --- |
| 1.1 | Ginz05 lines 973–976 (§5.1 begins at line 934) | The boundary with last term `(−1)^n a_n m ⊗ …`; agrees. |
| 1.4 | Weibel94 §9.1; CE56 Chapter IX | Not readable (settled uncertified). |
| 1.5 | Ginz05 lines 2161–2166 | Action of the centre on `HH_p(M)` through the coefficient; agrees. |
| 2.2 | Ginz05 lines 1120–1128 | Reduced cochains as `Hom_k(Ā^{⊗n}, M)`; field setting, as stated. |
| 3.3 | Ginz05 lines 398–411, 1075–1085 | Derivations, inner derivations, sequences (3.1.1) and (5.4.1); line 404 has `ma − am`, as the conventions say. |
| 3.4 | Ginz05 lines 1914–1926 | `Ω¹_com(A) ≃ HH₁(A)` from the degree-two boundary. |
| 3.5 | Ginz05 lines 1088–1106 | Product twisted by `β`, associativity iff `dβ = 0`, isomorphic iff cohomologous. |
| 4.1 | Ginz05 lines 751–752, 934–947 | `(a₁ ⊗ a₂ᵒᵖ)m = a₁ma₂`; left and right `Aᵉ`-modules; `M ⊗_{Aᵉ} A = M/[M,A]`. |
| 4.2 | Ginz05 lines 747–782; HKR62 lines 414–447 | Bar complex, `B_iA`, homotopy `h`, the check on `A^{⊗2}`; HKR62 lines 433–447: resolution `Y`, right-linear homotopy, projectivity from `K`-projective `R`. |
| 5.2 | Ginz05 lines 1342–1350 | Leibniz rule, descent, Yoneda product. |
| 6.2 | Ginz05 lines 1368, 1379 | (6.6.3) and Proposition 6.6.4; (6.6.3) fails as the README says (R02 concerns the README's wording of the failure). |
| 7.1 | HKR62 lines 284–298, 352–364 | The map `h`, identity in degree 0, its form on differentials in degree one. |
| 7.6 | HKR62 lines 301, 495, 522–548, 569–582; AV20 line 70; Ginz05 lines 96–97, 2086 | Lemma 4.1, the product formula, Theorem 5.1 with `K`-projective `R`, the deduction, Theorem 5.2 for a perfect field, the characteristic-two example; Proposition 1.2; Theorem 9.1.3. |
| 8.1 | HKR62 lines 263–271; Ginz05 lines 2187–2196 | As the repaired wording says. |
| 8.5 | Ginz05 lines 2142–2156; HKR62 lines 495, 548 | Alternation map, projection, `p!`; product formula; Theorem 5.2. |

Every cited work has exactly one manifest entry (9 entries); `sources.toml` was not changed and no
`needs-references.toml` was written.

### Pinned declarations

Opened this round, file and line at the pin: the eleven declarations of the F01 row;
`TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean:212, 234`;
`TauCeti/RingTheory/MvPolynomial/RegularSequence.lean:44`;
`TauCeti/LinearAlgebra/ExteriorPower/Basic.lean:145`;
`TauCeti/RingTheory/CyclicCohomology/Normalized/Chains.lean:69, 250`;
`TauCeti/RingTheory/HochschildCohomology/Coboundary.lean:359`;
`TauCeti/Algebra/Homology/Ext/ProjectiveResolution.lean:107`;
`TauCeti/Algebra/Homology/AInfinity/Algebra/Hochschild/Cohomology.lean:228`;
`Mathlib/RingTheory/Regular/RegularSequence.lean:190`; `Mathlib/RingTheory/MvPolynomial/Ideal.lean:63`;
`Mathlib/CategoryTheory/Abelian/Projective/Ext.lean:209, 286`;
`Mathlib/LinearAlgebra/TensorPower/Pairing.lean:56`; `Mathlib/LinearAlgebra/ExteriorPower/Basis.lean:182`;
`Mathlib/Algebra/Category/ModuleCat/Projective.lean:27`;
`Mathlib/AlgebraicTopology/DoldKan/Degeneracies.lean:180`;
`Mathlib/Algebra/Homology/Embedding/Basic.lean:226`; `Mathlib/LinearAlgebra/Dimension/Basic.lean:168`.
The other library names were resolved in round 7 (216 of 219, with the three leftovers explained
there) and are unchanged; the citation resolver, run again, lists no name found nowhere but did
not check names outside TauCetiRoadmap on this host.

### Duplication, citations and overlaps

Each citation was resolved now, on main or at the supplier's open head:

| Citation | Where it resolves | Agreement |
| --- | --- | --- |
| DGAInfinity Layers 0, 1, 8; DerivedModuleAlgebra §0.K.1 | main, headings and the contract row at `TauCetiRoadmap/DerivedModuleAlgebra/README.md:126` | As cited. |
| NoncommutativeGeometry N1, N1.Cyclic | main, README lines 479, 582, 608–612 | Cochain half cited; chain half is R01. |
| BanachAlgebras Layer 6; ZigzagPreprojective Layer 7 | main, README lines 1379; 1047 | Scope deferrals. |
| RefinedTraceMethods §§1.1, 1.9, 1.10 | open head, README lines 84–139 (paragraph "The cyclic enhancement of supplied derived Hochschild chains"), 404–443, 445–457 | §1.1: flat `A` gives `(C_•(A/k), b)`; `HH₂(𝔽_p/ℤ) = 𝔽_p`. §1.9: `ε_n` summed over `σ⁻¹` (same chain), `π_nε_n = n!`, `ε₁`; smooth case only for `ℚ ⊆ k`. |
| KTheoryFiniteLocalFields §4.0 | open head, README lines 663, 675, 679 | Derived chains on DGAInfinity Layer 8; `HH₀(A) = A/[A,A]`; smooth HKR asserted. |
| EulerSystemsAndKolyvaginSystems §6.1; IntegralIwasawaTheory §12.6 | open heads, README lines 3943–3962; 1846–1848 | "isomorphism for finite projective X"; `toExteriorBidual` in `TauCeti.StarkSystems`, arguments `R, r, M`. |
| DerivedDeRhamCohomology Layer 2; LanglandsParameterStacks §1.17 | open heads, README lines 3044; 24, 122 | Scope deferrals only. |

The overlaps report lists no other pull request changing this roadmap, no dropped id and no id only
an open revision defines. No `HochschildHomologyAndHKR` folder exists on main (199 folders read) or
in the open pull requests: no second copy. Searched main and the open heads by object:
"Kostant" (hits are Kostant's Lie-theoretic results only), "polyvector" (none), "bar resolution",
"enveloping algebra" (universal enveloping algebras), normalised Hochschild complexes (R01, and
RefinedTraceMethods and AInfCohomology for derived and topological variants), `HH²` (DGAInfinity,
LanglandsParameterStacks: the cited deferrals). CyclicHomologyLieHomologyAndQuasiFreeAlgebras §4.1
characterises quasi-free algebras by `Ext²_{Aᵉ}(A, M) = 0` through `instModuleTensorProductMop`,
over a field; it defines no complex with bimodule coefficients and no `HH²` classification.

Overlap check: read CyclicHomologyLieHomologyAndQuasiFreeAlgebras, RefinedTraceMethods,
RationalHomotopyModels, SpectralSequencesAndConvergencePartII, CohomologyOfGroups (the last three by
search: no Hochschild object beyond "Hochschild–Serre"), DGAInfinity, NoncommutativeGeometry,
DerivedModuleAlgebra; shared: the normalised quotient `A ⊗ (A/ℂ·1)^{⊗n}` with its comparison to the
pinned normalised chains, owner NoncommutativeGeometry N1.Cyclic for complex algebras and this
roadmap for every `k` once R01 is applied; the normalised scalar cochains over `ℂ`, kept by
NoncommutativeGeometry N1.Cyclic as stated; antisymmetrisation and derived chains,
RefinedTraceMethods and KTheoryFiniteLocalFields, imported; brackets and braces, DGAInfinity,
imported; Koszul complex, DerivedModuleAlgebra, imported.

### Supplier order

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2237 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Suppliers: DGAInfinity and DerivedModuleAlgebra (main);
IntegralIwasawaTheory, KTheoryFiniteLocalFields, EulerSystemsAndKolyvaginSystems and
RefinedTraceMethods (earlier in the merge order). None is on the never-cite list. Needs lines were
read against the statements: edges inside the roadmap run forward only; §8.4 needs §§6.2, 6.4(a),
7.1, 7.4, 7.5 and not §6.4(d), §7.2 or §7.6, so the polynomial case is free of the gap.

### Headline theorems and Lean

Headlines of the summary: normalisation over every `k` (2.1, 2.2); the low-degree identifications
and the `HH²` classification (3.1–3.6); `HH^n ≅ Ext^n` and `HH_n ≅ Tor_n` for `k`-projective `A`
(4.4, 4.5); cup equals Yoneda up to sign (5.4); the sign dictionary, homotopy formula and graded
commutativity (6.1, 6.2); the cohomological HKR theorem with `[⟨D₁,…,D_n⟩] = n! Ψ_n` (7.6); the
polynomial bases and the top degree (8.4, 8.5). There is no `Suggested.lean` at the design stage,
so the padding probe, the binder audit and the import check do not apply yet.

### Copyright and arrangement

- **Wording.** The 24 passages of the sampled locators and five further ones were set beside the
  sources: the `Tor` convention (Ginz05 lines 963–966), the route of §6.4 (lines 2147–2156), §7.3
  (HKR62 lines 531–535), §8.2 (HKR62 lines 272–278) and the §7.6 Check (HKR62 lines 569–582).
  Nothing is shared beyond formulae and standard names.
- **Arrangement.** Ginz05 has the largest share (46 of 122 source mentions). Its sections run §3
  derivations, §4 bar complex, §5 Hochschild theory defined as `Tor` and `Ext` with the low degrees
  inside, §6 Gerstenhaber structures, §8 Kähler differentials, §9 HKR. The roadmap builds the
  complexes from simplicial modules (Layer 1), puts the low degrees before the bar resolution
  (Layer 3 before Layer 4), and Layers 2, 6 and 8 have no counterpart section. No one-to-one run.
- **Reuse.** No table, figure, exercise list or data set is taken from a source.

Source independence: 29 passages compared with 3 sources (Ginz05, HKR62, AV20), none shared;
largest share Ginz05, 46 of 122 locators; contents compared with Ginz05: independent. Loday98,
Weibel94, CE56, Ger63 and Mat86 could not be read (settled uncertified).

## Not verifiable

- Loday98, Ger63, Weibel94, CE56, Mat86: settled uncertified; their section and theorem numbers
  were not checked against the texts. This covers the only locators of the sampled target 1.4 and
  the primary locator of 8.1.
- Lean elaboration and the one-tactic probe: no Lean file at this stage, and this lane does not
  elaborate.
- The closed form of the sign `s(p,q)` of §5.3 for `p, q ≥ 1`: the design makes its existence a
  target; only `s(p,0) = 1` is fixed by a pinned declaration.
- The signs `ν_n` of §6.3: they depend on DGAInfinity Layer 8's chain differential, a roadmap
  section and not a pinned declaration.
- The declared gap is a contract on RefinedTraceMethods §1.9, not a statement that exists today.

## Source issues

- **Error** in Ginz05 at §6.6, identity (6.6.3), p. 29 (line 1368): the source says the graded commutator of cup products is `d(f∘g) − df∘g − (−1)^p f∘dg`; it should be, for the coboundary of line 1058, `g∪f − (−1)^{pq} f∪g = df∘g + (−1)^q(d(f∘g) − f∘dg)`; affects a stated result.
- **Misprint** in Ginz05 at §3.1, p. 9 (line 404): the source says `ad m` maps `M → M` and is a derivation of `M`, for `m ∈ m`; it should be a map `A → M`, a derivation from `A` to `M`, for `m ∈ M`; affects nothing.
- **Misprint** in Ginz05 at §6.6, formula (6.6.2), p. 29 (line 1363): the source says the inner cochain takes the arguments `a_i,…,a_{i+q}`; it should be `a_i,…,a_{i+q−1}`, `q` arguments; affects nothing.
- **Gap** in Ginz05 at §9.3, proof of Theorem 9.1.3, p. 46 (lines 2193–2196): the source says the diagonal ideal of `A ⊗ A` is generated by a regular sequence when `X` is smooth; it should be claimed only after localising at points of the diagonal; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "12f18585766329e7c116a659d589fd99053d300c", "job": "REV-DESIGN-HochschildHomologyAndHKR~8", "model": "fable", "worker": "chris-x83"} -->
