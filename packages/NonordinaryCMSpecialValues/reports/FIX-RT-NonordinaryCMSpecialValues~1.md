# FIX-RT-NonordinaryCMSpecialValues~1: repair of red-team round 1 (passes a and b)

Thirteen findings, twelve sections (1a/F06 and 1b/F01 are the same defect). Eleven applied, two applied differently, none disputed.

## RT-NonordinaryCMSpecialValues~1a/F01 (P1) — applied

Right: `V_{d,C}` allows multiplicity above one (FINIS06 lines 481–483), and `(u + iv)† = u − iv`. Old §4.3 API: `ϑ† = γϑ` for every eigenfunction. New §4.3: `†` preserves eigenspaces, and `ϑ† = ε_ϑ ϑ`, `|ε_ϑ| = 1`, only on one-dimensional (primitive) eigenspaces. The counterexample is a Check; the §4.4 nonvanishing Check is restricted to `V^{prim}`.

## RT-NonordinaryCMSpecialValues~1a/F02 (P2) — applied

Right: (14) (FINIS06 lines 898–902) needs `T^{int}`, `F*_ℓ` and `b_ar`, which come later. The definition of `b_ℓ`, with its well-definedness, vanishing, API and three Checks, moves from §4.1 to §4.4, after them. §4.1 refers forward to it, and §5.2 *Needs* gains §4.4.

## RT-NonordinaryCMSpecialValues~1a/F03 (P1) — applied differently

Right: inertia at `v | p` acts by `c ∈ μ_{w_K}`, `c ≡ 1 mod g^{(v)}`, and for `f_0 = O_K` there is no constraint (`Q(i)`, `g = (7)`: image `μ_4`, bad reduction). Old: good reduction everywhere. New §2.5: base change to `K'' = K'(E[N])` (§5.1a), which is disjoint from `K(p^∞f)`, then descent by restriction (not the review's trace).

## RT-NonordinaryCMSpecialValues~1a/F04 (P2) — applied

Right: "rank-one realisation" fixed no lattice. The Conventions now fix `T_φ|_{G_H} = T_pE ⊗_{O_Φ} R` (BKO21 lines 409–411), which makes `T_φ^∨` the dual Betti lattice, part of the period datum. A new §2.4 target proves, via a prime-to-`p` isogeny `E_f → E`, that `γ` generates it (three Checks); §2.7 cites it.

## RT-NonordinaryCMSpecialValues~1a/F05 (P3) — applied

Right: with `P = ∅` the condition over `P` is empty, so `M(2, 1/2) = 1`. The §6.1 Check now distinguishes nonempty `P` (count `0`) from `P = ∅`, where `M(q, t) = (2⌊t⌋ + 1)²` and both theorems hold vacuously with `Q = 2`. The Lean statements are unchanged.

## RT-NonordinaryCMSpecialValues~1a/F06, RT-NonordinaryCMSpecialValues~1b/F01 (P1) — applied

Confirmed at the supplier's head: CM §4.2 treats `A/K` and `A/Q`, not `E/H` with `h_K > 1`. §3.4 now reads the Frobenius from CM §4.1 (`φ(N_{H/K}w) = −p`). §6.3 builds `θ_η` from GL2 R17.4.16, R16.2.13, R16.6.1 and R16.5.3. §4.2 is removed from the scope list, contracts and dependencies, since nothing consumes it.

## RT-NonordinaryCMSpecialValues~1a/F07 (P3) — applied

Right: `(1 − 0)⁻¹ = 1`, and only four characters have order `5`. The new §0.3 Checks test dropping the ramification test (a value `≠ 1` depending on `ϖ`) and an imprimitive modulus (`7/8` against `1`). The new §6.5 Check tests the infinite families `c = 2k` (sign `+`) and `c = 2k + 1` (value `0`).

## RT-NonordinaryCMSpecialValues~1b/F02 (P2) — applied differently

Right: §§4.2–4.3 matched FINIS06 §§2–3 in scope and title. Layer 4 is regrouped by object: theta spaces and lattices (§4.2), Shintani representation and `†` (§4.3), central-value formula with `b_ℓ` (§4.4), then §§4.5–4.7. Differences: `b_ℓ` goes in §4.4 (per 1a/F02), not §4.1; the unread sources are not added, since Finis's own stated results are cited.

## RT-NonordinaryCMSpecialValues~1b/F03 (P3) — applied

Confirmed at the AutomorphicLFunctionsAndLocalFactors head: the product `W_H(ω) = ∏_v ε_v` is AL.1.6.1. AL.1.6.2 maps to AnalyticNumberTheoryPartI §2.3a, the functional equation. The contract now cites both separately. The *Needs* of §§1.1, 1.2 and 1.3 cite AL.1.6.1. The cites of AL.1.6.2 for the functional equation (§§0.3, 1.4, 6.2) stay.

## RT-NonordinaryCMSpecialValues~1b/F04 (P3) — applied

Right, more generally: a finite-order anticyclotomic character is trivial on `A_Q×`, so `ν((p)) = 1` without oddness. `hνodd` is deleted from `centralValue_parity_dichotomy`, and "odd" from §§0.2, 1.3, 6.4, 6.5 and two Lean docstrings. It is kept in §§1.2 and 0.6. Added Checks: the `Q(√−15)` genus character and `φN^{−1/2}`.

## RT-NonordinaryCMSpecialValues~1b/F05 (P3) — applied

Right. §6.1 now names `factPrime`, the local instance `Fact (p : ℕ).Prime` for `p : Nat.Primes` that makes `ℤ_[p]` defined.

## RT-NonordinaryCMSpecialValues~1b/F06 (P3) — applied

Right. The scope list now reads "ArithmeticDirichletSeries Layers 3 and 5", matching §0.3's *Needs* and the dependency lines.

## Checks run

- **Elaboration** (`lake env lean packages/NonordinaryCMSpecialValues/Suggested.lean` from the content checkout): exit 0. The only messages are three `declaration uses 'sorry'` warnings, at lines 131, 141 and 167 (the three theorems). No `TauCeti.*` module needed building.
- **Signatures**: a scratch file with `#check @name` for all 11 declarations (6 definitions, `factPrime`, `rohrlichCount` and 3 theorems) elaborated once. Every elaborated type matches its README statement and keeps its binders (`[IsCMField K]`, `[Algebra.IsQuadraticExtension ℚ K]`, `[Fact (Nat.Prime p)]`). The only change from the previous signatures is that `centralValue_parity_dichotomy` no longer has `Odd (orderOf ν)`.
- **Dependency check** (command of the brief): `depcheck: 239 roadmaps, 2170 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- **Citations** (`roadmaps resolve` on the README): "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."

## Adversarial pass on changed and added statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.2: a finite-order anticyclotomic character is trivial on `A_Q×` | genus character of `Q(√−15)` (order 2); class character of `Q(√−31)` (order 3); `φN^{−1/2}` over `Q(i)` | values on rational ideals: `1`; `1`; at `(7)`: `κ(7)·7·7⁻¹ = −1` | true; finite order is necessary | added Check |
| §0.2: `ν((p)) = 1` for finite-order `ν` unramified at `p` | genus character of `Q(√−15)`, `p = 7`; order-5 character of `Q(√−7)` | `(7)` principal, so `1`; conductor `25`, so no value at `(5)` | true; ramified case excluded | bullet generalised |
| §0.3 ramified factor | `φ` of `y² = x³ − x` at `(1 + i)`; at `(7)`, `s = 1` | definition `1`, model without the test `(1 − φ(ϖ)2^{−s})⁻¹ ≠ 1`; `7/8` against `1` from the imprimitive modulus | discriminates | Checks replaced |
| §1.3 for `ν` of any finite order | `Q(√−15)`, `p = 7` (`−15 ≡ 6`, not a square mod 7), genus `ν` | `(φν)((7))/7 = −1`; signs for `c = 0, 2, 3` are `+, +, −` times `W(φν)` | true | Check added; §1.2 removed from *Needs* |
| `centralValue_parity_dichotomy` without `hνodd` | `Q(√−7)`, `p = 5`, `ν = 1`; `Q(√−15)`, `p = 7`, genus `ν`; `p = 3` ramified in `Q(√−15)`; `p = 2` | `c = 0, 2, 3, 4` give `+, +, −, +`; both parities are infinite (§0.2); `(3)` is not prime, so `hv` fails; `hp` excludes `p = 2` | no counterexample; `ε` is determined | Lean hypothesis deleted |
| §2.4 integral dictionary | `Q(√−7)`, `p = 5`, `f = (√−7)`; `y = 1/√−7` and `y = 5/√−7`; `p⁻¹T_φ`; `Ω ↦ −Ω` | degree `1` against `25` (pullback `= 5·`lattice); dual `pT^∨ ∌ γ`; `γ ↦ −γ` | prime-to-`p` degree and the fixed lattice are both needed | new target, 3 Checks |
| §2.5 good reduction at `v ∣ p` | `Q(i)`, `p = 7`, `g = (7)`; `Q(i)`, `p = 5`, `g = (40)`; `K'' = K'(E[3])` | inertia image `μ_4`; `7`-torsion valuation `1/48 ∉ (1/12)Z`; units distinct mod `8(2 + i)`, so good; units distinct mod `3`, so `c = 1` | the old claim is false, the new criterion holds | route replaced, Check added |
| §2.5 linear disjointness | `Q(i)`, `p = 7`, `f = g = (7)`, `N = 3` | `21O + 7^{n+1}O = 7(3 + 7^n)O = 7O = g` | `K'' ∩ K(7^∞) = K(7)` | stated |
| §3.4 via CM §4.1 | `Q(√−23)` (`h = 3`), `p = 5`; `Q(i)`, `p = 7` | `φ((5)) = −5`; `−7` and `(1 + 7T)²` | true | Check added |
| §4.1 `Q_{>0}/N(K×) ≅ W` | `Q(√−7)`: `r = 2`, `r = 3` | `2 = N((1 + √−7)/2)` gives the trivial system, `(2/7) = 1`; `ω_3(3) = −1`, `(3/7) = −1`, product `1` | consistent | stated as a target |
| §4.3 `†` on eigenspaces | 2-dimensional eigenspace; `iϑ`; `c ∣ 2` in `Q(√−7)` | `(u + iv)† = u − iv`; `ε_{iϑ} = −ε_ϑ`; `λ(c)λ(c̄) = 1/2 = |λ(c)|²` | proportionality only in dimension one | target restricted, 3 Checks |
| §4.4 `b_ℓ` (14) | `ℓ = 5` inert unramified in `Q(√−7)`; `ℓT^{int}`; dropping `D^{1/4}` at `ℓ = 7` | minimum `0`, so `b = 0`; `b − 2`; shift `1/4` | discriminates | definition moved, 3 Checks |
| (13) homogeneity | `ϑ_λ ↦ 5ϑ_λ` | `l²` and `b_ar` both scale by `25` | invariant | Check added |
| §6.1 Check, `c < 0` | `P = ∅`, `q = 2`, `c = −1`; `P = {5}` | `M = 1`; `M = 0` | corrected | Check rewritten |
| §6.3 `θ_η` | `θ = η|·|^{1/2}` | `θ_∞ = (z/|z|)⁻¹`, giving `D_2`; central character `κ_K·κ_K = 1`; `L(θ_η, s + 1/2) = L(η, s + 1/2)` | weight 2, trivial character | route replaced |
| §6.5 Check | `Q(√−7)`, `p = 5` | `c = 2k` (orders `5^{2k−1}`) have sign `+`; `c = 2k + 1` have sign `−` and value `0`; 4 characters of order 5 | tests the infinite family | Check rewritten |
| AL.1.6.1 citation | §1.1, `Q(√−7)` | AL.1 factors `(i, −i)`, product `1 = (2/7)` | AL.1.6.1 is the product statement | citations corrected |

## For the maintainer

- **Renumbering in Layer 4.** Old §4.4 is now §4.5, old §4.5 is §4.6, old §4.6 is §4.7, and the content of old §§4.2–4.3 is regrouped into §§4.2–4.4. No other roadmap cites NonordinaryCMSpecialValues §4.x: I searched main, every open head (`roadmaps grep`) and the board's packages. Internal references (Layers 4–5) and `sources.toml` `cited_for` (FINIS06 adds 4.7; BOXALL92 4.4 → 4.5; YANG97 4.2 → 4.4) are updated.
- **Lean signature changed.** `centralValue_parity_dichotomy` lost `hνodd`, so it is strictly more general. Its consumer, InertAnticyclotomicCMMainConjecture (§§6.4–6.5), is unaffected.
- **Supplier edges.**
  - Dropped: ComplexMultiplicationAndExplicitReciprocity §4.2.
  - Added: GL2AutomorphicRepresentationsAndTransfer R16.2.13, R16.5.3 and R16.6.1; NeronModelsAndSemistableAbelianVarieties §5.1a; AL.1.6.1. All are earlier in the merge order and already suppliers.
  - No gap was added or changed in `design/plan.json`.
- **Source errors the README now records.** KATO04 lines 5492–5494 infer good reduction of the canonical pair from `g ⊂ f`, which fails for `f_0 = O_K`. FINIS06 Lemma 3.5(4), line 860, states the `†`-proportionality on all of `V_{d,C}`. Both are worked around in the text.
- **Ownership.** I searched for the new objects (the integral Betti lattice of the period datum, base-change good reduction of the canonical pair, `†` on Shintani eigenspaces) on main, at the open heads and in the board's packages. No other owner was found; they are parts of this roadmap's own §§2.4, 2.5 and 4.3.
- **Sources.** No source was fetched and `needs-references.toml` was not written.
