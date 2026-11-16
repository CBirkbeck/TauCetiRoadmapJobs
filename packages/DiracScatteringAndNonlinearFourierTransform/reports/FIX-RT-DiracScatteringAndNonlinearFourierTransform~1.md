# Repair round FIX-RT-DiracScatteringAndNonlinearFourierTransform~1

Files changed: `packages/DiracScatteringAndNonlinearFourierTransform/README.md` and
`packages/DiracScatteringAndNonlinearFourierTransform/sources.toml` (the romanov2014 locator names §0's
matrix `J`). `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged: no finding touches a
Lean statement and no supplier gap is added.

## RT-DiracScatteringAndNonlinearFourierTransform~1a/F01 (P2) — applied

Both declarations exist at the pins (Mathlib `LebesgueDifferentiationThm.lean` line 67, complete real target;
Tau Ceti `AbsolutelyContinuousFun.lean` line 240, any real normed target). Old "built from the constancy and
Lebesgue differentiation theorems" → contracts for both; §1.1, §1.2 `*Needs:*`, Layer 1 Dependencies and the
deferral list cite them. Pattern: `VitaliFamily.ae_tendsto_average`, now unused, left the contracts.

## RT-DiracScatteringAndNonlinearFourierTransform~1a/F02 (P3) — applied

§6.7 barrier Check: "the potential of §6.5's Checks" → "the instance `c = 0.7`, `T = 1.3` of the real
constant potential on `[0, T]` of §6.5's second Check". Recomputed: `Im m(i) = 0.5375390`,
`2T − 2 log|E(T, i)| = −0.9184663`, `klDiv = 0.4560053`, bound `0.1582930`; the Check's digits stand.

## RT-DiracScatteringAndNonlinearFourierTransform~1a/F03, RT-DiracScatteringAndNonlinearFourierTransform~1b/F03 (P3) — applied

Both names occurred only in the contracts (grep of the README). Deleted the
`TauCeti.PhragmenLindelof.upper_half_plane_of_isBounded` bullet, the words naming `Besicovitch.ae_tendsto_rnDeriv`,
the scope clause "the half-plane Phragmén–Lindelöf principle for bounded functions," and "Phragmén–Lindelöf"
from the Summary's list of Tau Ceti modules. The Vitali row now says it serves §2.4. Mathlib's
Phragmén–Lindelöf row (§2.7) stays.

## RT-DiracScatteringAndNonlinearFourierTransform~1a/F04 (P3) — applied

Old → new: §6.8 `*Needs:*` gains §4.1 (`E = e^{−itz}(a + b)`, `|a|² − |b|² = 1` on `ℝ`); §9.6 gains §4.1
(`b/a = (E − iẼ)/(E + iẼ)`); Layer 3 Dependencies gain §1.2. Pattern: a script compared every `*Needs:*` line
with its layer's Dependencies; only cross-roadmap sections remain unmatched, and no forward reference exists.

## RT-DiracScatteringAndNonlinearFourierTransform~1b/F01 (P3) — applied

romanov2014 line 160–164: `J = −Ω`, so `JX′ + QX = λX` is `ΩX′ = (−λ)X − (−Q)X`. Old "Romanov's … and
Denisov's … up to the sign of `Q`" → Denisov alone up to that sign; Romanov is the present system for
`Q = −Q_q`, `λ = −z`, the §4.8 dictionary. Its cited identities were rechecked in present `z`.

## RT-DiracScatteringAndNonlinearFourierTransform~1b/F02 (P3) — applied

Confirmed: the pinned Jensen bound asks analyticity on the closed disc. §2.5 now applies it at radii `r < 1`,
then Fatou (`MeasureTheory.lintegral_liminf_le`, added to `*Needs:*`) with `k log rₙ → 0`. Correction to
the reviewer's test: for `e^{−i/z}` the sides at `i` are `−1 < 0`, singularity at `w = −1`; recorded in its Check.

## RT-DiracScatteringAndNonlinearFourierTransform~1b/F04 (P3) — applied differently

Confirmed: PDE and StochasticCalculus on main do not consume this roadmap. The suggested text calls PDE §6.2
"the continuous-in-time case", but its coefficients are bounded measurable in time. New bullet names no
roadmap: coefficients integrable but not essentially bounded in time (the bounded case is Tau Ceti's
Carathéodory theorem); §1.1, §1.2, §1.7.

## RT-DiracScatteringAndNonlinearFourierTransform~1b/F05 (P3) — applied

AutomorphicSpectralTheory §1.6 (open head) records `euclidean_paley_wiener`: smooth functions in a ball ↔
rapidly decreasing entire `ĥ` of exponential type. New Scope paragraph: §2.7 is the `L²` theorem on `ℝ`;
`2 sin(tz)/z ∈ PW_t` is `O(1/|x|)` on `ℝ`, outside the smooth theorem; neither contains the other.

## Checks run

- Elaboration: `lake env lean packages/DiracScatteringAndNonlinearFourierTransform/Suggested.lean` (from the
  content checkout): 9 warnings "declaration uses `sorry`" (lines 51, 127, 140, 155, 182, 191, 206, 221, 242),
  no errors. The file is unchanged and imports only `Mathlib`.
- Binder check: a scratch file with `#check @name` for all 25 declarations and structure fields, elaborated
  once; every elaborated type carries the hypotheses its README statement names (for example
  `szego_condition` keeps `MemLp q 2 (volume.restrict (Ioi 0))`, `tendsto_truncation_of_isResonanceFree` its
  real `f`, `L²` hypothesis and `AEStronglyMeasurable F`). Nothing changed.
- Dependency check:

```
depcheck: 251 roadmaps, 2383 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the edited README: no cross-roadmap citation and no Lean name found nowhere.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Mathlib contract: `IntervalIntegrable.ae_hasDerivAt_integral` | `a = b`; `f = 1_{[0,1]}` on `[0, 2]`, `c = 0` | `uIcc a a` null, statement vacuous; `∫₀ᵗ f = min(t, 1)` has derivative `1 = f(x)` at every `x ∈ (0, 1)`, `0` at `x ∈ (1, 2)`, fails only at `x = 1` (null) | holds as restated (complete real normed target, a.e. `x`, every `c`) | added |
| "an AC curve is determined by its value at one point and its derivative a.e." | `Y₁ = Y₂ + const`; `Y` the Cantor function | difference of AC curves with equal a.e. derivatives is AC with derivative `0` a.e., hence constant (`const_of_ae_hasDerivAt_zero`), so equal if equal at one point; Cantor function has derivative `0` a.e. but is not AC, value `0` at `0` and `1` at `1` | holds; AC is necessary | added |
| Tau Ceti contract: `…absolutelyContinuousOnInterval_intervalIntegral'` | `V = E →L[𝕜] E` (infinite-dimensional); `c ∉ uIcc a b` | no finiteness or completeness asked; base point outside the interval excluded by `hc`, as stated | holds | added |
| §1.1 `*Needs:*` (real case) | `β = 1_{[0,1]}`, `u = 2e^{min(t,1)}` | `v′ = βu` a.e. from `ae_hasDerivAt_integral` with `E = ℝ`; `v(t) = 2e^{min(t,1)} − 2` | consistent with the equality Check | changed |
| §2.5 Jensen route at `r < 1` | `F = e^{−i/z}`; `F = (z − i)/(z + i)`; `F ≡ c ≠ 0` | `g(w) = exp(−(1 − w)/(1 + w))`, `log|g(0)| = −1`, `log|g*| = 0`, bound `−1 ≤ 0`; `g(w) = w`, `k = 1`, `τ = 1`, `log|τ| = 0 ≤ ∫ log|g*| = 0`, while `F(i) = 0`; constant: `log|c| = log|c|` | holds; integrability from `log|τ| > −∞` | changed |
| Fatou step | `hₙ = log⁺ S − log|g(rₙζ)| ≥ 0` | `∫ liminf hₙ ≤ liminf ∫ hₙ ≤ log⁺ S − log|τ| − lim k log rₙ = log⁺ S − log|τ|` | gives `log|τ| ≤ ∫ log|g*|` | added |
| §2.5 Check on `e^{−i/z}` | `w = 0`; `|w| = 1` | `Re(−(1 − w)/(1 + w)) = −(1 − |w|²)/|1 + w|²`: `−1` at `0`, `0` on the circle | strict inequality, not outer | extended |
| Romanov dictionary | `Q = 0`, `λ = −z`; `λ = z` | `X′ = −ΩzX` from `(1, 0)`: `(cos tz, sin tz) = Θ(t, z)`; `λ = z`: `(cos tz, −sin tz) = Θ(t, −z)` | `λ = −z` is right | changed |
| Romanov (12) in present `z` | derivative of `M(λ)*ΩM(z)` | `M′ = −Ω(z − Q)M`, `Ω^TΩ = 1`: derivative `(z − conj λ)M(λ)*M(z)` | matches §3.1 | none |
| Romanov (15) in present `z` | `E = A − iC`, `E# = A + iC` | `|E|² − |E#|² = 4 Im(conj A · C) = 4 Im z ∫|Θ|²`; free case `2 sinh 2ty` both sides | matches §3.3 | none |
| §6.2 kernel from (12) at `λ = w` | upper-left entry | `∫Θ(w)*Θ(z) = (A(z) conj C(w) − C(z) conj A(w))/(conj w − z)`, equal to the de Branges kernel of `E = A − iC` times `π` | matches §3.2, §6.1 | none |
| Denisov comparison | `Q_D = [[−b, −a], [−a, b]]`, `J = Ω` | `ΩX′ = λX + Q_q X` against `ΩX′ = zX − Q_q X` | differs by the sign of `Q` only | kept |
| Paley–Wiener scope paragraph | `φ = 1_{[−t,t]}`; smooth `φ` | `∫_{−t}^{t} e^{isz} ds = 2 sin(tz)/z`, `|2 sin(tx)/x| ~ 2/|x|`, not rapidly decreasing; smooth `φ` gives rapid decay on `ℝ`, which the `L²` theorem does not detect | neither contains the other | added |
| §6.7 barrier Check | `c = 0.7`, `T = 1.3`, `z = i` | `0.5375390`, `−0.9184663`, `0.4560053 > 0.1582930` | holds | wording |
| §6.8 route with §4.1 | `f = c` on `[0, T]`, `x = 0` | `|E(T, 0)| = e^{cT} ≤ 2 cosh cT = 2|a(T, 0)|` | holds | `*Needs:*` |
| §9.6 limit constant | `β = −i`, `w = w̃ = 1` | `(1 − 1)/(1 + 1) = 0`; denominator modulus² `1/w + 1/w̃ + 2 = 4` | holds | `*Needs:*` |
| Downstream bullet | `P(t) = t^{−1/2}` on `(0, 1]` | `‖P‖` integrable, not essentially bounded; Tau Ceti's theorem needs the bound | the bullet's class is non-empty | changed |

## Notes for the maintainer

- Ownership: the repairs add no target. The new scope paragraph places §2.7 against AutomorphicSpectralTheory
  §1.6 (open head, earlier in the merge order). `roadmaps grep` for "Paley–Wiener" on main and the open heads
  finds no other owner of the `L²` theorem on `ℝ` (StochasticCalculus on main mentions only the
  Paley–Wiener–Zygmund argument for Brownian paths). Pinned Mathlib and Tau Ceti have no Paley–Wiener theorem.
- No section, layer or target id changed; no name another roadmap cites changed.
- `design/plan.json` still lists `mathlib:VitaliFamily.ae_tendsto_average` among the prerequisites of 1.1. This
  job may edit only its `gaps` list, so the README is now the more accurate record.
- Nothing in the reviews was suspicious as an instruction.
