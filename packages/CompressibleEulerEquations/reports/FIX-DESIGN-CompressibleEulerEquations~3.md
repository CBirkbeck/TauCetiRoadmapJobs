# FIX-DESIGN-CompressibleEulerEquations~3

Repair round for the design of `CompressibleEulerEquations` (round 3). It resolves the fourteen
findings of `REV-DESIGN-CompressibleEulerEquations~2`, numbered R01–R14 there and qualified here
as `REV-DESIGN-CompressibleEulerEquations~2/Rnn`. Files edited:
`packages/CompressibleEulerEquations/design/README.md`,
`packages/CompressibleEulerEquations/design/plan.json` and
`packages/CompressibleEulerEquations/sources.toml`. The design stage has no `Suggested.lean`, so
no Lean statement changed and the `#check` comparison has no declaration to run on. Every finding
was checked against the mathematics and holds. For R12, one half is a change to the companion
design `packages/LorentzianGeometry`, which is outside this package (see that section).

## REV-DESIGN-CompressibleEulerEquations~2/R01 (P1) — applied

Verified: with `A⁰(u) = 1/(2+u)`, `U = sin(mx)`, `f = 1`, `W = (δ+t)(2+sin mx)` I get
`E₂ = (δ+t)²S_m` and `S_m ≥ πm⁴/3`. As `δ → 0` the bound forces `C(K) ≥ √(2/3)m²`.
Old → new (§5.3, plan 5.3): forcing coefficient `C(K)` → `C(1 + ‖U − Ū‖_{Hᵏ_Λ})`. `C` now depends
only on `K`, the system, `n`, `k` and `Λ`. The route rewrites the equation with `(A⁰)⁻¹`, names the
time commutator, and bounds `‖A⁰(U)⁻¹f‖_{Hᵏ}` by §4.3. It also proves `E_k ∈ C¹` (§4.4 added to
*Needs*). The witness is added as a Check.

## REV-DESIGN-CompressibleEulerEquations~2/R02 (P1) — applied

Verified: for `F(u) = u` and `U = eᵗ`, `∂_tU(0) = 1` while `∇U = 0`. Old → new (§5.3 bullet,
plan 5.3): `‖∂_tU‖_∞ ≤ C(K)‖∇U‖_∞` → `‖∂_tU‖_∞ ≤ C(‖F(U)‖_∞ + ‖∇U‖_∞) ≤ C(1 + ‖∇U‖_∞)`, with the
homogeneous form kept for `F = 0` (Euler). The tame-estimate route now says that its `1` absorbs
the source. A negative-control Check is added.

## REV-DESIGN-CompressibleEulerEquations~2/R03 (P2) — applied

Verified the reviewer's computation term by term. The four integrals are `2π`, `4π`, `π` and `0`,
so `E₂′(0) = 22πM`. Also `E₂(0) ≤ e(2π + 5π + 17π) = 24eπ`. Old → new (§5.4, plan 5.4):
"`C` depending on `λ₀`, `‖∂_tA⁰‖_∞`, …" → `C` depending also on `n, N, k, Λ` and the constant
matrices `Ā⁰, …, Āⁿ`, the spatial ones included. The witness is added as a Check. §5.1's `L²`
constant needs no change, because its identity has only derivatives of `Aⁱ` (`E₀′ = 0` on the
witness).

## REV-DESIGN-CompressibleEulerEquations~2/R04 (P2) — applied

Verified: `W = (1−x)⁻¹` and `χ = (1−|x|)₊` give `∫₀¹χW² = ∞`. Old → new (§5.2, plan 5.2):
- `{χ > 0}` must now be relatively compact modulo `Λ` in spacetime.
- `W` must be Λ-periodic, and `W` and the coefficients must be `C¹` near the closure of `{χ > 0}`.
- `E_χ` is stated to be finite and Lipschitz, with the reason.

The witness is added as a Check. To align §6.1 with these hypotheses, the lens-function
definition now asks for spacetime relative compactness, and local uniqueness now asks for
Λ-periodic solutions (see the maintainer notes for why this was necessary).

## REV-DESIGN-CompressibleEulerEquations~2/R05 (P2) — applied

Verified: for `u = 1` on `2πℤ`, `J_εu = 1` and both norms equal `√(2π)`. Old → new (§4.4, plan
4.4 `gain_loss`): `‖J_εu‖_{Hᵏ⁺¹} ≤ Cε⁻¹‖u‖_{Hᵏ}` → `≤ C(1 + ε⁻¹)‖u‖_{Hᵏ}` for every `ε > 0`, and
`≤ 2Cε⁻¹‖u‖_{Hᵏ}` for `0 < ε ≤ 1`. The proof reason is added. The construction now says "for
`ε > 0`". The loss bound holds for every `ε > 0` (its constant covers large `ε`). Constant-mode
Check added.

## REV-DESIGN-CompressibleEulerEquations~2/R06 (P2) — applied

Verified: `0/0` exponents occur at `k = 0`. For `Φ ≡ 1` and `u = Ū = 0` the left side is `∞` and the
right side `0`. Old → new:
- §4.3 Gagliardo–Nirenberg: `0 ≤ i ≤ k` → `k ≥ 1`, `1 ≤ i ≤ k`, with the `i = 0` endpoint stated.
- Top-derivative composition bound: now stated only for `k ≥ 1`.
- §4.2 interpolation: now for `k ≥ 1`, with `k = 0` spelled out as the identity on `L²_Λ`.

Both endpoint Checks are added. Plan 4.2, 4.3 and 4.3.2 are synchronised.

## REV-DESIGN-CompressibleEulerEquations~2/R07 (P2) — applied

Verified at the pinned `TauCeti/Analysis/Sobolev/Wkp/Basic.lean` docstring. The norm squared at
order `k+2` is the norm squared one order lower plus the highest field in operator norm. For
`n = 1` every field is a scalar. Old → new (§4.1, plan `eq_wkp`): "equal … exactly when `k ≤ 1`"
→ "equal in particular when `k ≤ 1`, and at every order when `n = 1`". The local-Hessian Check is
replaced by integrated values, `5π` against `(7/2 + 8e⁻²)π`, and an `n = 1` Check with value
`5√(π/2)` is added.

## REV-DESIGN-CompressibleEulerEquations~2/R08 (P1) — applied

Verified: for `n = 1` and `ζ = dx`, `ker dx` is the time axis and `g = −τ²` there. Old → new
(§3.1, plan `covector_classification`): "timelike (`g` indefinite on it)" → "`g` nondegenerate
with exactly one negative square, equivalently `ker ζ` contains a timelike vector; indefinite for
`n ≥ 2`, negative definite for `n = 1`". Check added with values `−1` and `−4`. The §8.4 Check on
`{|x| < 1 − t/2}` has `n = 1` and is now correctly called timelike.

## REV-DESIGN-CompressibleEulerEquations~2/R09 (P2) — applied

Verified: the empty family's union `∅` has slice `∅ ≠ {0} × S`. Old → new (§8.2, plan 8.2.1):
"any pairwise compatible family" → "any nonempty pairwise compatible family", with the empty
family noted as the case `S = ∅`. The maximal-development route now goes through
`zorn_le_nonempty₀` on nonempty chains, and §3.3's inextendible-extension route is changed the same
way. Empty-family and singleton Checks are added.

## REV-DESIGN-CompressibleEulerEquations~2/R10 (P3) — applied

Verified: LukNotes line 1617 has `f·∂ᵢg` on its left, and Chrusciel2011 lines 1843–1848 use
timelike curves (line 1859 names the causal variant `D⁺_J`). Old → new:
- §4.3 products: the LukNotes Lemma 6.9 citation is removed. The product bound now cites
  Majda1984 §2.1 and carries its own Leibniz/Hölder/GN route (plan 4.3.1 locator updated).
- §3.3: Chruściel's definition is labelled as the timelike variant. Minguzzi's definitions are
  qualified (piecewise `C¹`; closed cone structure, closed achronal `S`).

`sources.toml` locators were adjusted; no key changed.

## REV-DESIGN-CompressibleEulerEquations~2/R11 (P2) — applied

Verified: for `N = 0` the determinant is `1` and has no root. At `n = 1`, `ζ = (0,1)`, the symbol has
eigenvalues `±1`. Old → new (§2.1, plan 2.1):
- `κ`: the largest-root recipe is stated for `N > 0`, with why it dominates, and `κ = (1, 0)` for
  `N = 0`.
- Wave Check: "eigenvalues `ζ₀ ± |ζ′|` and `ζ₀`" → "`ζ₀` with multiplicity `n − 1`, absent at
  `n = 1`" (characteristic polynomial `λ² − 1`).

A size-zero Check is added.

## REV-DESIGN-CompressibleEulerEquations~2/R12 (P2) — applied

Verified: `packages/LorentzianGeometry/design/README.md` line 17, §1.9 (line 210) and line 661 also
construct `a_{c,v}` and name this roadmap as their consumer. LorentzianGeometry is not on main and
not earlier in the merge order, so this roadmap cannot consume it and owns the concrete form. Old →
new (Scope, Downstream consumers, plan `consumers`): "a general Lorentzian roadmap, when it
exists…" → LorentzianGeometry §1.9/§2.5 named as a consumer that owns the identification. The
zero-vector convention is stated in Scope, §3.1 and the consumer entry. LorentzianGeometry's own
reverse supply is outside this package.

## REV-DESIGN-CompressibleEulerEquations~2/R13 (P3) — applied

Verified: for `a = −1`, `p = ρ` gives `c = 1`. Old → new (§1.1 Check, plan test `isothermal_abs`):
"constant sound speed `a`" → "`a ≠ 0` has `c = |a|` (for `a = −1`, `c = 1`, not `−1`); `a = 0`
gives `p′ = 0` and is excluded".

## REV-DESIGN-CompressibleEulerEquations~2/R14 (P2) — applied

Verified: I recomputed the commutator as
`½[(φ̂(3ε/2) − φ̂(ε))sin(3x/2) − (φ̂(ε/2) − φ̂(ε))sin(x/2)]`. Its values at `π` and `3π` are
`±μ₂ε²/8 + o(ε²)`. Old → new (§4.4, plan `friedrichs_lemma`): "for `a` bounded and Lipschitz" →
"bounded, Lipschitz and Λ-periodic (any bounded Lipschitz `a` for `Λ = 0`)", with the bound valid
for every `ε > 0`. Non-periodic Check added. Pattern check: the other §4.3/§4.4 factors lie in
`Hᵏ_Λ` and are periodic by definition. §5.4 and §5.3 apply the lemma to Λ-periodic `Aⁱ`, `Mⁱ(U)`.

## Checks

Dependency check (after all edits):

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after QuasiregularMaps (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2132 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. Naming LorentzianGeometry as a consumer creates no edge.

`roadmaps resolve` on the README found no cross-roadmap citation and no Lean name that is missing
everywhere. It did not check Lean names outside TauCetiRoadmap, because the pinned Lake packages
are not on this host. I checked the Tau Ceti and Mathlib names used here by reading the pinned
files: `Wkp/Basic.lean` docstring, `IteratedGradient.lean`, and `Mathlib/Order/Zorn.lean:126`
`zorn_le_nonempty₀`, whose hypothesis quantifies over chains containing some `y`.

`plan.json` parses as JSON and `sources.toml` parses as TOML. The brief listed no gate failures.

Elaboration and the `#check` comparison were not run, because the design has no `Suggested.lean`.

Ownership: I ran `roadmaps grep -i --readme-only 'acoustical (form|metric)'`. It finds no match on
main or in any open roadmap pull request. On the board only this package and LorentzianGeometry
mention the object, which is settled under R12. No other new construction was added.

## Adversarial pass on the changed and added statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §5.3 linear estimate, forcing coefficient | `U = sin(mx)`, `A⁰ = 1/(2+u)`, `f = 1`, `W = (δ+t)r`, `k = 2` | `E₂ = δ²S_m`, `E₂′ = 2δS_m`, `S_m ≥ πm⁴/3`; need `C₁ ≥ √(2/3)m²`; `‖sin mx‖_{H²} = √(π(1+m²+m⁴))`, `√S_m ≤ ‖r‖_{H²} = √(8π + π(1+m²+m⁴))` | old false; new holds with `C = O(1)` | coefficient `C(1+‖U−Ū‖)` |
| §5.3 forcing term `A⁰(U)⁻¹f` | `Φ = (A⁰)⁻¹`, `Φ(U) − Φ(Ū) ∈ Hᵏ` | `‖Φ(U)f‖ ≤ C(‖f‖_{Hᵏ} + ‖Φ(U)−Φ(Ū)‖_∞‖f‖_{Hᵏ} + ‖Φ(U)−Φ(Ū)‖_{Hᵏ}‖f‖_∞) ≤ C(1+R)‖f‖_{Hᵏ}` | linear in `R` | route stated |
| §5.3 `E_k` coefficient | commutator with `Mⁱ(U)`, `2k > n+2` | `C(‖∇U‖_∞ + R)‖W‖_{Hᵏ}`, `‖∇U‖_∞ ≤ CR`; `∂_tA⁰` term `C‖∂_tU‖_∞` | `C(1 + ‖∂_tU‖_∞ + R)` | unchanged form |
| §5.3 `E_k ∈ C¹` | `W ∈ C(Hᵏ) ∩ C¹(Hᵏ⁻¹)`, `|α| = k` | `∂^αW ∈ C(L²)` only; `J_ε∂^αW ∈ C¹(L²) ∩ C(H¹)`; `[J_ε, Mⁱ]∂ᵢ∂^αW → 0` in `L²` | integrated identity with continuous integrand | route + *Needs* §4.4 |
| §5.3 tame estimate | `F(Ū) = 0`, `Φ = (A⁰)⁻¹F`, `Φ(Ū) = 0`; Burgers | `‖Φ(U)‖_{Hᵏ} ≤ C‖U−Ū‖_{Hᵏ}`; commutator `C‖∇U‖_∞‖U−Ū‖`; Burgers `(‖u_x‖²)′ = −∫u_x³` | `C(1+‖∇U‖_∞)E_k`, no `R` | route stated |
| §5.3 `‖∂_tU‖_∞` bound | `F(u) = u`, `U = eᵗ`, `K = [0,2]`; Euler `F = 0` | `1 ≤ C·0` fails; `1 ≤ C(1+0)` holds; Euler: `∂_tU = −(A⁰)⁻¹Aⁱ∂ᵢU` | new bound true | source added |
| §5.4 constant | `A⁰ = e^{sin x}`, `A¹ = M`, `w = sin x + sin 2x` | integrals `2π, 4π, π, 0`; `E₂′ = 22πM`; `E₂ ≤ 24eπ` | needs `|Ā¹|` | dependence added |
| §5.1 `L²` constant (pattern) | same witness, `k = 0` | `E₀′ = −2M∫ww′ = 0` | no `Āⁱ` needed | none |
| §5.2 weighted energy | `χ = (1−|x|)₊`, `W = (1−x)⁻¹`; periodised cone | `∫₀¹(1−x)⁻¹ = ∞`; cone lens inside translates of `[0,T] × B(x₀, R+|w|T)` | old hypothesis admits infinite energy; new excludes it, cones satisfy it | hypotheses replaced |
| §6.1 local uniqueness, Λ ≠ 0 | `Λ = ℤ`, `φ = 1 − t`, `A¹ = diag(z²,0)`, `u = g(t + 1/x)1_{x<0}`, `z = x` | `u_t + x²u_x = g′(1 − 1) = 0`; `u(0,·) = 0`; `u(0.9, −1/0.3) = g(0.6) ≠ 0`; `σ(U; −dt) = −I` | old (non-periodic solutions) false; new requires Λ-periodic | hypothesis added, Check |
| §6.1 lens definition | moving cone; slicewise-only bumps escaping as `t → t₂` | cone image mod `Λ` relatively compact; escaping bumps: each slice compact, union unbounded | spacetime relative compactness needed by §5.2 | definition replaced |
| §6.2 route | `Λ = 0` single cones | no periodicity needed of `U₁`, `U₂`; cones compact | consistent with §6.1 | `Λ = 0` stated |
| §4.4 gain | `u = 1`, `Λ = 2πℤ`, `ε = 2C`; `ε ≤ 1` | `1 ≤ 1/2` fails; `1 ≤ C(1+ε⁻¹)`; `1 + ε⁻¹ ≤ 2ε⁻¹` | new true | `C(1+ε⁻¹)` |
| §4.4 loss, large `ε` | `k ≥ 1`, `‖J_εv − v‖ ≤ ε∫|y|φ ‖∇v‖` | valid for all `ε` | true | "every `ε > 0`" |
| §4.4 Friedrichs | `a = sin(x/2)`, `sin x`, constant; `u = sin x` | commutator at `π`: `μ₂ε²/8`, at `3π`: `−μ₂ε²/8`; `a = sin x`: periodic; constant: `0` | periodic `a` needed | hypothesis added |
| §4.3 GN endpoints | `k = i = 0`; `k = i = 1` | `0/0`; `‖Du‖ ≤ ‖u‖_{H¹}` | statement from `k, i ≥ 1` | restricted |
| §4.3 composition, top order | `Φ ≡ 1`, `u = Ū = 0`, `k = 0`; `Φ = u²`, `k = 1` | `∞ ≤ 0` fails; centred `0 ≤ 0`; `‖2uu′‖ ≤ 2‖u‖_∞‖u′‖` | `k ≥ 1` | restricted |
| §4.3 product route | `β = 0`, `β = α`, `0 < β < α` | extremes `‖f‖_∞‖g‖_{Hᵏ}`, `‖f‖_{Hᵏ}‖g‖_∞`; middle `(‖f‖_∞‖g‖_H)^{1−θ}(‖f‖_H‖g‖_∞)^θ`, `θ = |β|/|α|` | Young gives the sum | route written |
| §4.2 interpolation | `k = 0`; `j = 1`, `k = 2`, Gaussian | `0/0`; `2√(π/2) ≤ √5·√(π/2)` | `k ≥ 1` | restricted |
| §4.1 Wkp comparison | `n = 2`, `k = 2`, `e^{−|x|²}`; `n = 1`, `k = 2`, `e^{−x²}` | `H²`: `π/2 + π + 7π/2 = 5π`; Wkp: `π/2 + π + (2 + 8e⁻²)π`; `n = 1`: both `5√(π/2)` | differ (`n = 2`), equal (`n = 1`) | claim corrected |
| §3.1 timelike hyperplane | `n = 1`, `dx`; `n = 2`, `ζ = (0,1,0)`, `c = 1`, `v = 0` | `−τ²`: `−1, −4`; `n = 2`: `ker = span{(1,0,0),(0,0,1)}`, `g = diag(−1, 1)`, indefinite | one negative square in both | definition replaced |
| §3.1 zero vector | `X = 0` | `g(0,0) = 0 ≤ 0`; `|0 − 0| ≤ c·0` | causal here, excluded in LorentzianGeometry | convention stated |
| §2.1 `κ` | `N = 0`; `N > 0`, `ζ₀ ≥ (1+λ)|ζ′|` | `det = 1`, no root; `σ ≥ (ζ₀ − λ|ζ′|)A⁰ ≥ |ζ′|A⁰ ≥ 0`; `λ ≥ 0` by `ω ↦ −ω` | dominates | split by `N` |
| §2.1 wave Check | `n = 1`, `ζ = (0,1)`; `n = 2`, `ζ = (0,1,0)` | `λ² − 1`: `±1`; `n = 2`: `[[0,−1,0],[−1,0,0],[0,0,0]]`: `−1, 0, 1` | `ζ₀` multiplicity `n − 1` | corrected |
| §8.2 union | empty family, `S = (−1,1)`; singleton; `S = ∅` | slice `∅ ≠ {0} × S`; singleton slice `{0} × S`; `(∅, ∅)` | nonempty needed unless `S = ∅` | hypothesis added |
| §8.2 / §3.3 Zorn | `zorn_le_nonempty₀` hypothesis | upper bounds needed only for chains containing some `y`; empty chain handled by the start point | fits nonempty unions | route stated |
| §1.1 isothermal | `a = −1`, `a = 2`, `a = 0` | `c = 1`, `c = 2`, `p′ = 0` | `c = |a|`, `a ≠ 0` | corrected |

## For the maintainer

- §6.1 local uniqueness now requires the two solutions to be Λ-periodic. The previous statement,
  with a Λ-periodic lens and arbitrary solutions, is false when `Λ ≠ 0`; the counterexample is now
  a Check in §6.1. No consumer in this roadmap used the non-periodic form: §6.2 uses `Λ = 0`, and
  §8.4 uses solutions periodic under the data's period group.
- The other half of R12 belongs to the LorentzianGeometry design and should be decided before both
  designs are accepted. Line 17 of its README should drop "this roadmap proves the … statements
  about the acoustical form that it imports". Its Downstream-consumers entry for
  CompressibleEulerEquations (line 661) should go. Its §1.9 should import the concrete acoustical
  form from CompressibleEulerEquations §3.1 and keep only the identification with its general
  Lorentzian scalar products, on nonzero vectors.
- No name that another roadmap cites changed: this roadmap has no consumers on main, and no
  section was renumbered.
- The reviewer's source issues are recorded as data. LukNotes Lemma 6.9 as printed loses a
  derivative and is no longer cited. The ChristodoulouMiao2014 §2.1.2 claim is already stated
  here as false, with a counterexample (§8.2).
- Ownership against the open pull requests whose files the brief supplies was checked for the
  acoustical form with `roadmaps grep`, as described above. Nothing else new was introduced.
