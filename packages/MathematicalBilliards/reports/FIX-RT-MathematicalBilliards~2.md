# Repair of red-team round 2 of MathematicalBilliards

Six findings from two reviews. Five sections below, because 2a/F03 and 2b/F02 are the same defect. Every finding was checked against the README, the cached sources and the pinned libraries, and every one holds. All were applied in the README and `sources.toml`. `Suggested.lean` is unchanged.

## RT-MathematicalBilliards~2a/F01 (P3) — applied

Verified: the identity was only the third Check of §1.4, which comes before `T` and `I` are defined. §2.4 now states it as a target, with a route and `*Needs:* §1.4, §2.1`.

Old → new:
- §3.3: "`Λ⁻¹ ∘ R ∘ Λ = I ∘ T` (§1.4)" → "(§2.4)".
- §2.4: new target "`Λ ∘ I ∘ T = R ∘ Λ` on `A`". The route uses `τ(s₁) = exp(iδ₁)e` and `γ(s₁) − γ(s) = Le`.
- §2.4: new unit-circle Check, with the value at `(0, π/3)` and a negative control without `I`.
- §1.4 API: the map is now named `Λ`.

The same pattern appeared in two other places, and both are repaired:
- §5.3, both billiard paragraphs: these took "every point of `Ā` is non-wandering for `T̄`" from §4.4, where it is only a Check. The real input, the invariant measure of §3.3, was missing from both `*Needs:*` lines. The step is now derived from §3.3 and the two §4.4 API bullets, and §3.3 is added to both `*Needs:*` lines.
- §3.3: "as `I` does (§2.4)" pointed at a §2.4 Check. It now gives the reason, "since `sin(π − δ) = sin δ`".

## RT-MathematicalBilliards~2a/F02 (P2) — applied

Verified: the §12.1 API bullet had no hypotheses and no route, and its `*Needs:*` named only Mathlib. Hochman2012 lines 2627–2669 end their proof with ergodicity of the second factor. For `ℝ` that step needs §12.4.1 at `a = 0` on the Koopman group of §12.3, and both come after §12.1.

Old → new:
- §12.1: the bullet is removed. A sentence says the multiplier property is a target of §12.5.
- §12.5: new target, with these hypotheses:
  - `MeasurableVAdd₂` on `X` and on `Y`;
  - probability measures that are `VAddInvariantMeasure`;
  - the diagonal action `Prod.addAction`;
  - `IsWeaklyMixing μ` and `ErgodicVAdd ℝ Y ν`.
- Its conclusion is `ErgodicVAdd ℝ (X × Y) (μ.prod ν)`. It has a full route, `*Needs:* §12.1, §12.3, §12.4.1`, and three Checks.
- Scope now lists the multiplier property. The Mathlib supplier contracts gain `Prod.addAction`.

How this differs from the suggested repair: I renamed the correlations from `a(t), b(t)` to `c₁(t), c₂(t)`. The old names clashed with the frequency `a` of §12.4.1, which the same route uses at `a = 0`. I also added a third Check, a two-point `Y` under the trivial action, showing that ergodicity of `Y` is needed.

## RT-MathematicalBilliards~2a/F03, RT-MathematicalBilliards~2b/F02 (P3) — applied

Verified: §10.1 and §10.5 list Tau Ceti groupoid declarations in their `*Needs:*`, and §10.2 uses the groupoid through §10.1. Both files exist at the pin.

Old → new: Layer 10 Dependencies "Mathlib manifolds." → "Mathlib manifolds and measure theory; Tau Ceti's structure groupoid of a group action … (`TauCeti/Geometry/Manifold/SMulGroupoid.lean`), and its groupoid `TauCeti.contMDiffGroupoid` … (`TauCeti/Geometry/Manifold/ContMDiff/Groupoid.lean`), in §§10.1, 10.2 and 10.5."

Measure theory is added because §§10.3–10.4 use it. I compared every other layer's Dependencies line with the `*Needs:*` lines of its subsections, and none has an omission.

## RT-MathematicalBilliards~2a/F04 (P3) — applied

Verified against Herman1983:
- Section 4.3 starts at line 718, and the Remarque at lines 762–769 falls inside it, before 4.4 at line 770.
- The footer "26" at line 756 ends printed p. 26, so the Remarque is on printed p. 27, as the README says.
- No target and no Lean docstring cites section 3.1 (checked by grep).

Old → new:
- References: "(1.2, 2.2, 2.4, 3.1, 3.4, 5.2)" → "(1.2, 2.2, 2.4, 3.4, 4.3, 5.2)".
- Same pattern in the manifest: the `sources.toml` locator listed sections that nothing cites. "Chapitre I (1.2, 2.1, 2.2, 2.4, 3.1–3.6, 4.3, 5.2) …, lines 69–1287" → "Chapitre I (1.2, 2.2, 2.4, 3.4, 4.3, 5.2) …, lines 149–1287".
- The other References entries match their citations.

## RT-MathematicalBilliards~2b/F01 (P2) — applied

Verified, with the unit square:
- §11.1 glues `(g, x) ∼ (gσ_S, x)` on closed sides, vertices included. §7.2 identifies `(x, v) ∼ (x, σ_S v)` only on relative interiors.
- `[id, 0] = [conj, 0]` in `S_P`, but the formula gives `(0, exp(iπ/6)) ≠ (0, exp(−iπ/6))` in `Z_P`.

Old → new, in §11.4:
- `Π_θ : S_P → Z_P` → `Π_θ` defined on the complement of the vertex classes, with the reason given at interior, side and vertex points.
- `S_P^θ` now excludes the vertex classes explicitly.
- Relabelling: "(it permutes the vertex classes)" is added.
- The pushforward is stated for the restriction of `area_{S_P}` to the conull domain (§10.3).
- New negative-control Check.

The other maps defined on `S_P` by representatives are fine at vertices: the relabelling of §11.1, the charts of §11.2 (stated near relative-interior points) and `ρ` in §12.6.

## Checks run

- **Elaboration** (`lake env lean packages/MathematicalBilliards/Suggested.lean`, run from the content checkout): 8 warnings "declaration uses `sorry`", at lines 162, 202, 218, 246, 269, 281, 292 and 311. No errors. The file is unchanged this round.
- **Binders**: I put `#check @name` for all 17 declarations in one scratch file and elaborated it once. Each elaborated type matches its README statement, for example:
  - `measurePreserving_billiardMap`: no `2 ≤ k`;
  - `exists_lipschitzWith_of_isRotationalInvariantCurve`: `2 ≤ k`;
  - `exists_two_periodic_orbits`: `0 < p`, `p < q`;
  - Layer 12 theorems: `MeasurableVAdd₂`, `IsProbabilityMeasure` and `VAddInvariantMeasure`, plus `[CompleteSpace H]` and `U.IsUnitary` on `exists_tendsto_twistedAverage`.

  Nothing changed. I also checked at the pin:
  - `Prod.addAction` exists;
  - `t +ᵥ (x, y) = (t +ᵥ x, t +ᵥ y)` holds by `rfl`;
  - `ErgodicVAdd` and `MeasureTheory.MeasurePreserving.prod` exist with the expected types.
- **Dependency check**, output: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Citation resolver** (`roadmaps resolve` on the README): no cross-roadmap citations and no Lean names found nowhere.
- **Gate failures**: none were listed for this round.
- **Supplier gaps**: none needed. `design/plan.json` is unchanged (`"gaps": []`).
- **Sources**: no new source was fetched, and `needs-references.toml` was not written. The new citations reuse existing keys:
  - Hochman2012 line 2627, printed p. 59 (line 2573 is the page header);
  - ChaikaForni2026 lines 95–98;
  - BialyMironov2022 lines 172–176, added to `cited_for` as "2.4".

## Ownership

The multiplier property for `ℝ`-actions is owned here.
- ClassicalErgodicTheory, an open roadmap, states the discrete version for a single map (`WeakMixing.ergodic_prodMap_of_ergodic`, its Layer 1.1). It imports the `ℝ`-action version from this roadmap ("From TauCetiRoadmap.MathematicalBilliards — §§12.1–12.5").
- No other roadmap, on main or at an open head, states it: `roadmaps grep` for the object found nothing else.
- ClassicalErgodicTheory is not an allowed supplier for this roadmap, so the discrete statement is not cited as a supplier.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §2.4 `Λ ∘ I ∘ T = R ∘ Λ` | unit circle general; `(0, π/3)`; `(0, π/2)`; ellipse `(2cos u, sin u)` at `(2, 0)`, `δ = π/4`; without `I` | `Λ(s, δ) = (exp(i(s+δ+π/2)), −cos δ)`, both sides `(−exp(i(s+δ+π/2)), cos δ)`; `(exp(11πi/6), 1/2)`; `Λ(0, π/2) = (−1, 0)`, `Λ(I T(0, π/2)) = Λ(π, π/2) = (1, 0)`; ellipse: `e = exp(3πi/4)`, `c = −√2`, exit `(6/5, 4/5)`, `L = 4√2/5`, `(−e) × γ(s₁) = √2 = −c`, `⟨−e, τ(s₁)⟩ = −11/√146 = cos(π − δ₁)`, `τ(s₁) × (−e) = 5/√146 = sin δ₁ > 0`; `Λ(T(0, π/3)) = (−i, −1/2) ≠ (exp(11πi/6), 1/2)` | true; the two sides agree on all of `A` |
| §2.4 involution consequence | circle | `(I T)²(s, δ) = (s + 2Rδ + 2R(π − δ), δ) = (s + ℓ, δ)`; consistent with the §2.1 Check and with `T⁻¹ = I T I` | consistent |
| §5.3 non-wandering step | circle; `(x, y²)` on `AddCircle 1 × [0, 1]` (§4.4 Check); boundary of `Ā` | `μ_A(A) = 2ℓ`, full support; `(0, 1/2)` moves to heights `(1/2)^{2ⁿ} → 0`, wandering, with no invariant full-support measure; boundary circles fixed by `T̄` | the measure of §3.3 is a genuine input, now in `*Needs:*` |
| §11.4 domain of `Π_θ` | square, `θ = exp(iπ/6)`, vertex `0`; side point `(1/2, 0)`; interior point; `θ = 1`; `π/8` triangle vertex classes | vertex: 4 representatives give 4 directions `θ, conj θ, −θ, −conj θ`; side: `(x, θ) ∼ (x, conj θ)` in `Z_P`; interior: one representative; masses `4 = |G| area P` for `θ = exp(iπ/6)` (`|K| = 1`, 4 directions) and for `θ = 1` (`|K| = 2`, 2 directions); `π/8`: classes `4, 1, 1` are permuted by relabelling (cosets `gD_v ↦ kgD_v`) | true as restated |
| §12.5 multiplier property | `X` a point; `Y = X` weakly mixing; `X = Y = AddCircle 1`; `Y` two points, trivial action; one-point `Y` with `g₁ = i`, `g₂ = 1` | `c₁ = α` exactly; `X × X` ergodic, as ClassicalErgodicTheory §3.2 uses; `exp(2πi(x − y))` invariant, `|c₁ − α| = 1`; invariant point of measure `1/2`; `c₂ = conj(i) = −i = β` | true; both hypotheses are needed; the inner-product convention matches §12.1 |
| Layer 10 Dependencies | §§10.1–10.5 `*Needs:*` | Tau Ceti in §§10.1, 10.2 (via §10.1), 10.5; measure theory in §§10.3, 10.4 | complete |
| Herman1983 entry | every README and Lean citation | sections 1.2 (149–155), 2.2 (188–251), 2.4 (277–319), 3.4 (425–434), 4.3 (762–769), 5.2 (803–807), Appendice (1130–1287); 3.1 cited nowhere | matches |

## For the maintainer

- **Consequence for ClassicalErgodicTheory.** It cites this roadmap's §12.1 for "ergodicity of the product of a weakly mixing action and an ergodic one", and in its §3.2 route uses "MathematicalBilliards §§12.1–12.2" for the same fact. That statement is now a target of §12.5. §12.1 keeps a sentence pointing to §12.5, and ClassicalErgodicTheory's `*Needs:*` range §§12.1–12.5 still covers it. Its citation should name §12.5.
- No declaration of `Suggested.lean` was renamed, added or deleted. No section, layer or target id was dropped.
- The repairs use `Λ` for the oriented-line homeomorphism in §§1.4, 2.4 and 3.3, and Layers 10–12 use `Λ` for lattices. Each use is defined where it appears.
