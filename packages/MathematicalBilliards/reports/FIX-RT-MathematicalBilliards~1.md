# FIX-RT-MathematicalBilliards~1

Repair of red-team round 1 (passes a and b) on `packages/MathematicalBilliards`. Files changed: `packages/MathematicalBilliards/README.md`, `packages/MathematicalBilliards/Suggested.lean`. Unchanged: `sources.toml`, `metadata.toml`, `design/plan.json` (no supplier gap is needed).

## RT-MathematicalBilliards~1a/F01 (P2) — applied

Change: `Suggested.lean` Layer 12 gains `continuous_compMeasurePreserving_vadd` (the reviewer's signature, elaborated), listed in the module docstring. README §12.3 states it by name and lists it in the declaration list. The §12.3 route now gives the weak-convergence step that uses finiteness of `μ`. The scope paragraph contrasts it with Mathlib's continuous-action `MeasureTheory.Lp.compMeasurePreserving_continuous`.

Verification: the claim is true at this generality (proof checked; see the adversarial pass). Mathlib's `Lp.compMeasurePreserving_continuous` and `Lp.instContinuousSMulDomMulAct` need topology, R₁ Borel spaces and inner-regular measures, so the pins do not prove it.

## RT-MathematicalBilliards~1a/F02 (P2) — applied

Change: in §10.1, the groupoid we built ourselves through `Pregroupoid.groupoid` → `TauCeti.smulGroupoid (Multiplicative ℂ) ℂ`. The groupoid laws, restriction, `TauCeti.mem_smulGroupoid_iff` and the smoothness comparison are now consumed. This roadmap owns the derivative-one characterisation, plus the instance `ContMDiffConstSMul 𝓘(ℂ) ω (Multiplicative ℂ) ℂ`, which is missing at the pins. We added a Tau Ceti supplier bullet, fixed the Mathlib bullet and the scope wording, and §10.5 now uses `TauCeti.hasGroupoid_smulGroupoid_quotient_subgroup`.

Verification: in `TauCeti/Geometry/Manifold/SMulGroupoid.lean` the groupoid is the open partial homeomorphisms locally equal to `g • ·`. For translations, being locally a translation ⇔ having derivative 1 on the open source ⇔ being a translation on each component. The reviewer's repair left one thing out: `smulGroupoid_le_contMDiffGroupoid` needs `ContMDiffConstSMul`. That instance did not synthesize at the pins, and a two-line proof of it elaborates in a scratch probe. `ContinuousConstSMul (Multiplicative ℂ) ℂ` does synthesize (`IsIsometricSMul.to_continuousConstSMul`).

## RT-MathematicalBilliards~1a/F03 (P2) — applied

Change: §11.4 old: the trivial-stabiliser case only. New: for every `θ` there is `K_θ`, and `Π_θ : [h, x] ↦ (x, h⁻¹θ)` induces a flow conjugacy `S_P^θ/K_θ ≃ M_θ ∖ Σ`. The pushed area is `|K_θ| Σ_{v∈G·θ} Leb_P ⊗ δ_v`, with `ν_θ = (|G·θ| area P)⁻¹ Σ_v Leb_P ⊗ δ_v`. The trivial-stabiliser `Φ_θ` is kept as a special case. The square `θ = 1` Check was rewritten, and §12.6, the summary and the Lean docstring were extended.

Verification: relabelling by `k ∈ K_θ` acts in charts as `k` plus a translation, so it commutes with `φ_θ`. Its fixed points lie on side images parallel to `θ` between vertex classes, which are singular leaves, so the action is free on `S_P^θ`. The fibres of `h ↦ h⁻¹θ` are left `K_θ`-cosets. §12.6 for nontrivial `K_θ`: `χ + χ∘ρ` with `λ*` off the axis of `r` is a nonconstant invariant eigenfunction.

## RT-MathematicalBilliards~1a/F04 (P3) — applied

Change: §6.2 Check old: "if `F^m(x₀) = x₀ + (jℓ, 0)` with `m < q`, then `m | q`". New: `m` is the least positive return time, the return times form `mℤ`, so `m | q` and `(q/m) j = p`, and coprimality gives `m = q`. The excluded `m = j = 0` and the diameter values `m = q = 2`, `j = p = 1` are recorded.

Verification: the witness holds, since `m = 0` satisfies the old hypotheses and `0 ∤ 2`. The old Check was also wrong for a non-least positive `m` (return times `2` and `4` with `q = 6`: `4 ∤ 6`). Taking the least positive return fixes both.

## RT-MathematicalBilliards~1b/F01 (P2) — applied

Change: `ConvexTable.measurePreserving_billiardMap` loses `(hk : 2 ≤ k)`, and its docstring and the module docstring now say `k ≥ 1`. The §3.3 route is now: `Λ` carries `μ_A` to `dθ ⊗ Lebesgue`, and `T = I ∘ Λ⁻¹RΛ`. The Jacobian route is kept as a second proof for `k ≥ 2`. We added a `C¹` Check. The summary, the §2.2 Check, the §4.4 Check and §5.3 (continuous graph for every table) were updated to match.

Verification: for fixed `e`, `d(e × γ(s))/ds = e × τ(s) = −sin δ` needs only `C¹`. The shear `(s, δ) ↦ (s, δ + θ(s))` is a translation in each fibre. `Λ⁻¹RΛ = I∘T` is §1.4's third Check. On the unit circle at `δ = π/3`: `Λ(I T) = (exp(i(s+11π/6)), 1/2) = R(Λ)`. The Lipschitz theorem keeps `hk` (it needs the `C¹` twist).

## RT-MathematicalBilliards~1b/F02 (P3) — applied

Change: `ConvexTable.exists_two_periodic_orbits` loses `(hcop : p.Coprime q)`, and its docstring now reads "integers `0 < p < q`". §6.4 explains the reduction: a `(p/d, q/d)` configuration iterated `d` times is a `(p, q)` configuration. The route stays coprime, and we added a `(2, 4)` ellipse Check (doubled axes, gaps `ℓ/2`).

Verification: the conclusion `∀ m n, ∃ j, s' j ≠ s (j+m) + nℓ` does not involve `(p, q)`, and `IsPeriodicConfiguration` holds for `(dp', dq')` whenever it holds for `(p', q')`. Coprimality stays where it matters: in §6.2's least-period claim (the `(2,4)` doubled orbit has least period `2 ≠ 4`) and in §§6.1–6.4's route.

## RT-MathematicalBilliards~1b/F03 (P3) — applied

Change: §4.1 old: "isotopic to the identity, hence orientation preserving". New: the descended map preserves each boundary circle and its direction, because a boundary restriction is injective, continuous and `ℓ`-equivariant, hence increasing and onto. §5.2 old: "orientation-preserving homeomorphism". New: a lift `F` that commutes with the deck translation, identified with Herman's hypothesis. We added a Check excluding `(−x − y, y)`.

Verification: Herman1983 line 1150 assumes orientation preservation for a homeomorphism of `T¹ × [0, ∞)`. Such a map preserves the boundary circle, so it preserves orientation exactly when it has degree +1 on the core, that is, when its lift commutes with `x ↦ x + ℓ`. `(−x − y, y)` deviates the verticals (its images have slope −1) and has `F(x+1, y) = F(x, y) − (1, 0)`.

## RT-MathematicalBilliards~1b/F04 (P3) — applied

Change: §4.4 old: definition attributed to "Herman1983, Chapitre I, 3.4.3, lines 425–432". New: "the standard definition, stated here". The README now says Herman 3.4.3 assumes the set is the whole space, restated through open `U` with `f(U) ⊆ U`, without defining it. The `nonwanderingSet` docstring was changed the same way.

Verification: Herman1983 lines 425–432 name `Ω(f)`, assume `Ω(f) = X` and paraphrase that assumption. No neighbourhood-return definition appears there. No other citation of 3.4.3 for the definition remains (`Herman1983, 3.4.4, line 434` in §4.4's recurrence bullet is a separate, correct locator).

## Checks run

- **Elaboration** (`lake env lean packages/MathematicalBilliards/Suggested.lean`, run from the content checkout): it succeeded with exactly eight `declaration uses 'sorry'` warnings, one per theorem (lines 162, 202, 218, 246, 269, 281, 292, 311) and no errors. The only Tau Ceti import, `TauCeti.Analysis.Semigroups.Group.Unitary`, was already built; `TauCeti.Geometry.Manifold.SMulGroupoid` is cited in the README only and not imported.
- **Binder check**: I put `#check @name` for all 17 declarations into one scratch copy of the file and elaborated it once. Every elaborated type matches its README statement. `ConvexTable.measurePreserving_billiardMap` is now `∀ {k} {ℓ} [Fact (0 < ℓ)] (T : ConvexTable k ℓ), MeasurePreserving …`, with no `2 ≤ k`. `ConvexTable.exists_two_periodic_orbits` is `… {p q : ℕ}, 0 < p → p < q → ∃ s s', …`, with no coprimality. `continuous_compMeasurePreserving_vadd` carries `[MeasurableSpace X] [AddAction ℝ X] [MeasurableVAdd₂ ℝ X] (μ) [IsProbabilityMeasure μ] [VAddInvariantMeasure ℝ X μ] (f : Lp ℂ 2 μ)`. The file has no `variable` or `include` block, so no binder can drop out. `ConvexTable.exists_lipschitzWith_of_isRotationalInvariantCurve` still has `2 ≤ k`, as intended.
- **Dependency check** output: `depcheck: 227 roadmaps, 2051 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Citation resolver** on the edited README reports no cross-roadmap citations and no Lean names found nowhere. I checked every new Mathlib and Tau Ceti name at the pins by hand: `TauCeti.smulGroupoid`, `TauCeti.mem_smulGroupoid_iff`, `TauCeti.smul_mem_smulGroupoid`, `TauCeti.smulGroupoid_le_contMDiffGroupoid`, `TauCeti.isManifold_of_hasGroupoid_smulGroupoid`, `TauCeti.hasGroupoid_smulGroupoid_quotient_subgroup` (`TauCeti/Geometry/Manifold/SMulGroupoid.lean`), `TauCeti.contMDiffGroupoid` (`TauCeti/Geometry/Manifold/ContMDiff/Groupoid.lean`), `ClosedUnderRestriction`, `Multiplicative.mulAction`, `ofAdd_smul`, `ContMDiffConstSMul`, `MeasureTheory.Lp.compMeasurePreserving_continuous`.
- No gate failures were listed for this round.

## Ownership

- **Strong continuity for jointly measurable `ℝ`-actions** (§12.3): this roadmap is the owner. I searched by object on main and at the open heads (`MeasurableVAdd₂`, "jointly measurable", `compMeasurePreserving`, Koopman continuity). ProbabilisticAndMetricNumberTheory §4.9a and GeometryOfNumbersAndQuadraticArithmetic §4.2 (`scalarLpKoopman_strong`) prove it for continuous actions on R₁ Borel spaces with regular measures, and so does Mathlib (`Lp.compMeasurePreserving_continuous`, the `DomMulAct` instance on `Lp`). None of them covers measurable actions without topology. IncompressibleFlows is on the never-cite list and only lists false Koopman claims as negative tests.
- **Translation groupoid**: now owned by Tau Ceti (`TauCeti.smulGroupoid`); this roadmap owns only the derivative characterisation and the smoothness instance for translations.
- **Unfolding with stabiliser** (§11.4): no roadmap on main or at an open head plans the Katok–Zemlyakov unfolding; this roadmap owns it.
- The open heads were searched with the roadmap tool, which reads every open roadmap pull request at its head. No declaration of `Suggested.lean` has the fully qualified name of a declaration in another roadmap.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| `ConvexTable.measurePreserving_billiardMap`, now for `k ≥ 1` | unit circle at `δ = π/3`; `δ = π/2`; ellipse `(2cos u, sin u)` at `(2,0)`, `δ = π/4`; `C¹` circle–ellipse table; `k = 0` | `Λ = (e^{i(s+5π/6)}, −1/2)`, `Λ(IT) = (e^{i(s+11π/6)}, 1/2) = R(Λ)`, Jacobian `sin δ`; at `π/2`, `Λ(T) = R(Λ)` too (diameter, `I` fixes `π/2`); `sin δ₁·det = (5/√146)(√73/5) = 1/√2 = sin δ`; line-space route uses only `e × τ = −sin δ`; `k = 0` contradicts `one_le` | true; `hk` dropped; Check added with the `δ ≠ π/2` caveat |
| `continuous_compMeasurePreserving_vadd` | one point; translation on `AddCircle 1`, `e₁`; identity action; counting measure on `ℝ`; empty `X` | `‖U_t f − f‖ = 0`; `2|sin πt| → 0`; `0`; `√2` at every `t ≠ 0` (excluded: not a probability measure); empty `X` excluded by `IsProbabilityMeasure` | true; added |
| §12.3 route (averages) | `f = e₁` on the circle, `h = 1/2` | `A_h e₁ = ((e^{πi} − 1)/(πi)) e₁ = (2i/π) e₁`, norm `2/π ≤ 1`; `‖U_t A_h e₁ − A_h e₁‖ = (2/π)·2|sin πt| ≤ 4|t|` (bound `2|t|‖f‖/h = 4|t|`) | consistent |
| `ConvexTable.exists_two_periodic_orbits` without coprimality | `(2,4)` on the ellipse; `(2,4)` on the unit circle; `(1,2)`; `p = q`; `p = 0` | doubled axes, gaps `ℓ/2`, `s_{j+4} = s_j + 2ℓ`, vertex sets `{(±2,0)}` vs `{(0,±1)}`; circle offsets `0`, `π/2`: `π/2 = (m+2n)π` impossible; `W = 8, 4`; excluded by `hpq`, `hp` | true; `hcop` dropped; Check added |
| §6.2 least-period Check | diameter `(1,2)`; `m = j = 0`; doubled `(1,2)` as `(2,4)` | `m = 2`, `j = 1`, `(2/2)·1 = 1`; `0 ∤ 2`; least period `2 ≠ 4`, `(4/2)·1 = 2 = p` (coprimality needed) | Check repaired |
| §4.1 boundary direction | shear on `ℝ × [0,1]`; `(−x, y)` | boundary maps `x ↦ x`, `x ↦ x + 1`, increasing; `(−x, y)` violates `F(x+ℓ) = F(x) + ℓ` (`−x − ℓ ≠ −x + ℓ`) | statement replaced |
| §5.2 lift condition | shear; `(−x − y, y)`; rotation `(x + 1/4, y)` | `F(x+1,y) = F(x,y) + (1,0)`; `F(x+1,y) = F(x,y) − (1,0)`, image of a vertical has slope `−1`; rotation commutes but does not deviate | hypothesis made explicit; Check added |
| §5.3 continuous graph, every table | circle `δ = c`; `C¹` circle–ellipse; boundary circle `δ = 0` | constant `ψ = c ∈ (0, π)`; non-wandering by §3.3 at `k = 1`; `δ = 0` excluded by `C ⊆ A` | added |
| `nonwanderingSet` (locator only) | identity; `x ↦ x + 1` on `ℝ` | every point (`n = 1`); `U = (−1/4, 1/4)` never returns, empty | definition unchanged |
| §10.1 derivative characterisation | `z + 3i`; `2z`; `conj z`; `−z`; two half-planes with `0`, `1`; `exp` on a small disc | derivative `1`; `2`; difference `−2i Im z` nonconstant; `−1`; derivative `1` on each half, member; `exp′ = exp ≠ 1` off `2πiℤ`, not a member | true |
| `ContMDiffConstSMul 𝓘(ℂ) ω (Multiplicative ℂ) ℂ` | — | proved in two lines in a scratch probe (`contMDiff_iff_contDiff`, `contDiff_const.add contDiff_id`); not synthesized at the pins | target in §10.1 |
| §10.5 atlas via quotient instance | `Λ = ℤ + iℤ`; `Λ = {0}` | free, properly discontinuous; `ℂ` noncompact (not a lattice, excluded) | consistent |
| §11.4 general unfolding | square `θ = e^{iπ/6}`; square `θ = 1`; square `θ = i`; equilateral triangle `θ = 1` | `K` trivial, `|G·θ| = 4`; `K = {1, conj}`, `|G·θ| = 2`, `ν = ½(δ₁ + δ₋₁)⊗Leb`, carried mass `2·2 = 4 = |G| area P`, fixed set `Im z ≡ 0, 1 (mod 2)`; `K = {1, −conj}`, `|G·i| = 2`; `K = {1, conj}`, `|G·1| = 3`, `2·3 = 6 = |G|` | true; statement generalised, Check rewritten |
| §12.6 extension | square `θ = 1`; off-axis `λ* = (1+i)/2` | `exp(πiu)` has eigenvalue `1/2`, with `u = x` or `2 − x` matching at walls `x = 0, 1`; `χ + χ∘conj = 2e^{πix}cos(πy)`, eigenvalue `1/2`, nonconstant | true; extended; Check added |

## Notes for the maintainer

- Names changed in `Suggested.lean`: one theorem added (`continuous_compMeasurePreserving_vadd`) and two hypotheses removed (`hk` from `ConvexTable.measurePreserving_billiardMap`, `hcop` from `ConvexTable.exists_two_periodic_orbits`). No other roadmap cites these names (they are this package's own).
- No section, layer or target id was renumbered. §10.1 keeps its heading and now consumes Tau Ceti's groupoid.
- The source issues the reviewers report (Hochman2012 Theorem 6.6.1 proof, Herman1983 Lemma 11 misprint, Hochman2012 Lemma 6.1.6 misprint) concern steps this roadmap does not reproduce. No package text depends on them.
- No new source was needed; `needs-references.toml` was not written.
