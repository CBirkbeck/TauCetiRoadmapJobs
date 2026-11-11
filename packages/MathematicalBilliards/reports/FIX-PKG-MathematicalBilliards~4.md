# FIX-PKG-MathematicalBilliards~4

Repair of the three findings of `REV-PKG-MathematicalBilliards~3` (package, round 4). Only `packages/MathematicalBilliards/README.md` changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged. No Lean statement is touched, no source is added (the Herman1983 locator already covers 2.4), and no supplier gap is needed.

## F01 (P2) — applied

Verified. Herman1983 line 285 (2.4.3, printed p. 10) settles the irrational case by quoting Herman's earlier memoir. The README route treated only equal rational rotation numbers. The pinned `Mathlib/Dynamics/Circle/RotationNumber/TranslationNumber.lean` has only `translationNumber_mono` (line 695) and no strict form.

Change (§5.4):
- Main statement: "the inequality is strict" becomes "strict when `ρ(C₁)` or `ρ(C₂)` is irrational; … strict in all cases". The citation "2.4.2 and 2.4.4" becomes "2.4.2–2.4.4".
- New API bullet: strict comparison of continuous circle lifts at irrational values, in both directions, with its route.
- Route: irrational case → API bullet (no `C¹`, no measure); remaining case `p/q` → region argument.
- Two Checks added. Four pinned names added to *Needs* and the supplier contracts.

Proof checked. Let `ε = min(g₂ − g₁)`, which is positive because `g₂ − g₁` is continuous and periodic. Pick `0 < p − qα < ε`.
- `translationNumber_pow` (line 643) gives `τ(g₁^q) = qα`.
- The contrapositive of `translationNumber_le_of_le_add` (line 704) gives a point `x` with `g₁^q x > x + p − ε`.
- Induction uses only that `g₂` is monotone: `g₂^q x ≥ g₁^q x + ε > x + p`.
- `le_translationNumber_of_add_int_le` (line 718) then gives `τ(g₂) ≥ p/q > α`.
- The `β` case is symmetric, through `le_translationNumber_of_add_le` (line 707) and `translationNumber_le_of_le_add_int` (line 710).

I also placed the irrational clause in the main statement, because it is what the route proves for every positive twist lift.

## F02 (P3) — applied

Verified. §5.1 defines the components inside the open annulus. For `C = {y = c}` the lower component is `AddCircle ℓ × (a, c)`. That is a surface without boundary, so it is not homeomorphic to `AddCircle ℓ × [0, 1)`, which Herman1983 lines 1150–1154 require.

Change (§5.3 route): "the lower component `U` of §5.1" → `U` = the lower boundary circle ∪ the lower component. The new route gives each property with its reason:
- open, because the component contains `AddCircle ℓ × (a, a′)`;
- relatively compact, with closure `U ∪ C ⊆ AddCircle ℓ × [a, b′]`;
- `H`-invariant;
- inside the non-wandering set of the restriction to the open subspace `AddCircle ℓ × [a, b)`;
- homeomorphic to `AddCircle ℓ × [0, 1)` by the annulus theorem.

Added a Check: `C = {y = c}`.

## F03 (P3) — applied

Verified. A chart `φ` goes from an open set of `X` to `ℂ`, so a measure on `X` cannot be pulled back along it. §10.3 also had no API list, although §11.4 uses `area(S_P) = |G| area P > 0`.

Change (§10.3):
- Chart condition: "pullback … is Lebesgue measure" → "image under `φ` of `area_X` restricted to the source of `φ` is Lebesgue measure restricted to its target".
- New API list:
  - positivity on nonempty open sets;
  - the cone-disc area `πr^{2k}/k`, for `r` up to the radius of the chart disc (a restriction the suggested wording lacked);
  - invariance under translation-surface isomorphisms;
  - area of a surface glued from polygonal regions, holes allowed.
- New Checks: the octagon cone disc, which pins the exponent, and four unit squares.

§11.4 now derives `area(S_P) = |G| area P` from §10.3, and §10.3 is added to its *Needs*.

## Checks run

- **Elaboration.** `lake env lean packages/MathematicalBilliards/Suggested.lean` from the content checkout: exit 0, `declaration uses sorry` at lines 154, 193, 209, 235, 257, 268, 287 and nothing else. The file is unchanged and its `TauCeti.*` import was already built.
- **Binders.** I put `#check @name` for all 16 declarations into one scratch file and elaborated it once. Each elaborated type matches its README statement and the worker's signature listing, and no binder is lost. Nothing changed, because the Lean file did not change.
- **Pinned names.** Every Mathlib name added was opened at the pin in `Mathlib/Dynamics/Circle/RotationNumber/TranslationNumber.lean`, inside `namespace CircleDeg1Lift` (line 132): `translationNumber_pow` 643, `translationNumber_le_of_le_add` 704, `le_translationNumber_of_add_le` 707, `translationNumber_le_of_le_add_int` 710, `le_translationNumber_of_add_int_le` 718. `CircleDeg1Lift` extends `ℝ →o ℝ`, so lifts are monotone; monoid powers are iterates.
- **Citations.** `roadmaps resolve` found no cross-roadmap citation and no roadmap-local Lean name missing. Mathlib names were not checked by the tool on this host, so I checked them by hand (above).
- **Dependency check.** Output:

```text
depcheck: 237 roadmaps, 2139 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

## Ownership

I searched main and the 440 indexed open heads by object:
- **Rotation and translation numbers.** Two hits, neither owning this object. HypergeometricMotives 1.8 uses "rotation number" for a cyclotomic datum, a different notion. SymplecticGeometry/IntegrableSystems line 418 has a sign criterion for boundary lifts, not strict comparison.
- **Translation surfaces, flat area, cone points.** UnboundedOperators builds one translation surface as an example; it owns no general area theory.

This roadmap stays the owner of §5.4's strict comparison and §10.3's flat area. No declaration of `Suggested.lean` changed.

## Adversarial pass

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §5.4 API: strict comparison, `α` irrational | `g₁ = x + √2/2`, `g₂ = g₁ + 1/10`; `ε ≥ 1` (`g₂ = g₁ + 2`) | `q = 7`, `p = 5`: `5 − 4.9497 = 0.0503 < 0.1`, bound `5/7 = 0.714 > 0.707`, true `0.807`; `q = 1`, `p = 1`: `0.293 < 2`, bound `1 > 0.707`, true `2.707` | holds | added |
| same, `β` irrational | `g₂ = x + √2/2`, `g₁ = g₂ − 1/10` | `q = 10`, `p = 7`: `7.0711 − 7 = 0.0711 < 0.1`; `g₁^{10} x = x + 6.071 < x + 7`, bound `0.7 < 0.7071`, true `0.6071` | holds | added |
| same, rational values (negative control) | `x + sin(2πx)/20 − 1/50 < x + sin(2πx)/20` | derivative `≥ 1 − π/10 = 0.686 > 0`; fixed points at `sin 2πx = 0.4` and `0`; both `τ = 0` | strictness fails; hypothesis needed | Check |
| §5.4 main: strict when one `ρ` irrational | circular table `δ = π/3` against `δ = π√2/2`; `δ = π/3` against `π/2` | `1/3 < 0.707`; `1/3 < 1/2` (rational: needs the measure, which `sin δ dδ ds` supplies) | holds | clause added |
| §5.4 rescaling | `G(x) = g(ℓx)/ℓ` | `g₁ < g₂` ⇔ `G₁ < G₂`; `ε` rescales by `1/ℓ` | holds | none |
| §5.3 region `U` | `C = {y = c}`; graph `C = {y = ψ(x)}`; lower component alone | `U = AddCircle ℓ × [a, c)`, frontier `{y = c}`; `(x, y) ↦ (x, (y − a)/(ψ(x) − a))` maps `U` onto `AddCircle ℓ × [0, 1)`; `AddCircle ℓ × (a, c)` has no boundary points | old `U` fails §5.2's hypothesis; new `U` satisfies it | repaired |
| §5.3 non-wandering on the restriction | point of `AddCircle ℓ × [a, b)` | relative neighbourhoods are neighbourhoods in the closed annulus (open subspace), same iterates | holds | stated |
| §10.3 chart condition | `ℂ/(ℤ + iℤ)`, chart = inverse of the projection on an open unit square | image of `area` on the source = Lebesgue on the square, total `1` = covolume | holds | reworded |
| §10.3 cone disc `πr^{2k}/k` | `k = 1`; octagon `k = 3`, flat radius `ρ`, `r = (3ρ)^{1/3}` | `πr²`; `π·9ρ²/3 = 3πρ²` against `8·(3π/8)ρ² = 3πρ²`; wrong `πr² = π(3ρ)^{2/3}`, `πr^{2k} = 9πρ²` | holds | API + Check |
| §10.3 positivity | nonempty open `W` | `W ∖ Σ_X ≠ ∅` (finite `Σ_X`, surface), contains part of a chart source, image open, Lebesgue `> 0` | holds | API |
| §10.3 isomorphism invariance | translation of `ℂ/Λ`; non-example `z ↦ 2z` from `ℂ/Λ` to `ℂ/2Λ` | Haar preserved; area multiplied by `4` (not a translation in charts) | holds; hypothesis needed | API |
| §10.3 polygon gluing | octagon side `1`; four unit squares; `π/8` triangle unfolded | `2(1 + √2) = 4.828`; `4` = covolume of `2ℤ + 2iℤ`; `16 · tan(π/8)/2 = 8(√2 − 1) = 3.314` (the §11.4 Check) | holds | API + Check |
| §11.4 `area(S_P) = #G · area P` | unit square; L-shaped hexagon made of three unit squares (`#G = 4`, §9.1 order `4`) | `4·1 = 4`; `4·3 = 12`; copies `gP` with `g ∈ O(2)` keep area | holds | tied to §10.3 |

## For the maintainer

- No Lean name changed, and no id that another roadmap cites moved: the §5.4, §5.3, §10.3 and §11.4 headings are unchanged.
- I found no suspicious instruction in the review text.
- The review's two source issues in Hochman2012 (lines 3029 and 3065–3073) affect no statement of this roadmap; nothing changed for them.
