# FIX-RT-HyperbolicDynamicsAndThermodynamicFormalism~2

This round repairs red-team round 2, passes a and b, of `packages/HyperbolicDynamicsAndThermodynamicFormalism`. There are four P3 findings and none of them overlap. All four were verified and applied.

Files changed:
- `README.md`
- `Suggested.lean`
- `sources.toml` (the locator of one source)
- `design/plan.json` (only the `needs` sentence of the existing gap `connection-map-jacobi-derivative`)

`metadata.toml` is unchanged. No gap was added or removed, and no supplier changed.

## RT-HyperbolicDynamicsAndThermodynamicFormalism~2a/F01 (P3) — applied

The finding is right. Step (v) of §9.3 needs v ↦ (P_v, Q_v) to be continuous. The gap contract, however, stated K only as a map, so the blocks read through K at v and at g¹v could fail to vary continuously.

What changed. Supplier contract and plan `needs`: K is now a smooth vector-bundle map over π : TM → M, and ξ ↦ (Dπ ξ, K ξ) is a smooth isomorphism onto π*(TM ⊕ TM). §9.3(v) now says why the blocks are continuous and sets B = max‖L‖ + a e^(−a)/sinh a.

## RT-HyperbolicDynamicsAndThermodynamicFormalism~2a/F02 (P3) — applied

The finding is right.
- The README never defined the global set W^u(p), "C-dense" or "M(ε)-delayed specification". It defines only the local sets W^u_δ (§6.1).
- The route glues so that the next start exceeds the previous end by M + 1 steps of σ². At ε′ = 2^(−k−1), compatibility needs t₀ − (L − 1) ≥ k + 2, so the constant is M = k + 1, not k + 2.

What changed in §6.3:
- Item 1 defines C-dense: W^u(p) = {y : d(f⁻ⁿy, f⁻ⁿp) → 0}.
- Item 2 spells out ordered integer intervals with a_(i+1) − b_i > M(ε), periodic y with d(fⁿy, fⁿx_i) < ε on [a_i, b_i] (Theorem 2.10).
- Check 5: M = k + 1, 2k + 6, k + 3, k ≥ 4.

## RT-HyperbolicDynamicsAndThermodynamicFormalism~2b/F01 (P3) — applied

The finding is right. These declarations exist at the Tau Ceti pin `2fd255d`:
- `Homeomorph.conjFlow` (`Conjugacy.lean:58`)
- `Homeomorph.isSemiconjugacy_conjFlow` (`:70`)
- `Flow.periods` (`ClosedOrbit.lean:100`), `Flow.minimalPeriod` (`:140`), `Flow.minimalPeriod_pos_iff` (`:200`)
- `Flow.stableSet` (`Stable.lean:61`)

The README used these objects without citing them.

What changed:
- New Tau Ceti contract bullet. It says `Flow.stableSet` is not the W^s_δ of §6.5.
- `Homeomorph.conjFlow` is cited in the API of §§2.1, 2.2, 7.2 and 8.5 and in their *Needs:* lines.
- `Flow.periods` is cited in §6.6.
- τ_Λ in §8.3 is restated through `Flow.minimalPeriod`.
- Both objects are added to the Scope library list.

## RT-HyperbolicDynamicsAndThermodynamicFormalism~2b/F02 (P3) — applied

The finding is right. `HasLowerGibbsProperty` is this roadmap's own definition (README §5.1; Scope, Layer 5), but it sat under `/-! ## Supplied notions, restated -/`. The module docstring correctly leaves it out of the list of restated notions.

What changed. The declaration has moved unchanged out of `section MetricNotions` into a new `section LowerGibbs`, placed right after the Layer 5 comment. Its binders are `[PseudoMetricSpace X] [MeasurableSpace X]`. Its elaborated type is identical to the one before the move.

## Pattern searches

- **2a/F01.** The README has only one supplier gap. The plan's other gap, `sphere-bundle-embedding`, appears only in `design/plan.json`. Nothing else names the connection map.
- **2a/F02.** I searched the README for other undefined Bowen vocabulary. "Axiom A*" is defined in §6.1 and "strong specification" in the Conventions. "C-dense" also appears in the second Check of §6.3, which now uses the defined term. No other source term is used undefined.
- **2b/F01.** Other flow conjugacies appear in the Checks of §§4.1 and 6.7, and the contract bullet names them. Periods also appear in a §9.2 Check, which needs no citation. Of the other pinned flow API, `Flow.unstableSet` is the same kind of object as `Flow.stableSet`. Neither is consumed.
- **2b/F02.** "Supplied notions, restated" now contains only the 15 notions the docstring lists. `toralEndomorphism`, a restated ClassicalErgodicTheory notion, sits in Layer 10 where it is used, under a heading that claims nothing false. I left it there.

## Checks run

- **Elaboration.** `lake env lean packages/HyperbolicDynamicsAndThermodynamicFormalism/Suggested.lean`, run from the content checkout. It gives 15 `declaration uses 'sorry'` warnings (lines 195, 226, 238, 301, 317, 421, 479, 490, 554, 573, 608, 619, 635, 686, 704) and no errors. The `TauCeti` import's object file was present.
- **Signatures.** I ran `#check @name` for all 50 declarations in one scratch copy and elaborated it once. I compared each elaborated type mechanically, after whitespace normalisation, with the job's signature listing. All 50 are identical, including `HasLowerGibbsProperty` (`{X} → [PseudoMetricSpace X] → [MeasurableSpace X] → Flow ℝ X → C(X, ℝ) → ProbabilityMeasure X → ℝ → Prop`). The listing's two other entries are parser artefacts from the module docstring and not declarations. No binder changed, and the nine leads of the listing are as both reviews describe: definitions that do not use the instance.
- **Dependency check**, as run after the last edit:

      depcheck: 251 roadmaps, 2384 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` reports no cross-roadmap citation and no roadmap Lean name found nowhere. It did not check Lean names outside TauCetiRoadmap, so I opened each new Mathlib and Tau Ceti name at the pin myself (files and lines above, plus `Flow.IsSemiconjugacy` at `Mathlib/Dynamics/Flow.lean:267`).
- **Ownership.** No new object or target was introduced, only citations of pinned declarations and a sharper statement of an existing gap. So no new ownership question arises. The gap's supplier (RiemannianGeometry, as a Part II) is unchanged. Ownership against open pull requests was not re-checked beyond `roadmaps resolve`.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result, change |
|---|---|---|---|
| Gap: K a smooth bundle map, (Dπ, K) an isomorphism | flat ℝⁿ; K = 0; K fibrewise only | flat: K(x, v; a, b) = b, (Dπ, K) = id, Dg^t(a, b) = (a + tb, b) = (J(t), D_tJ(t)) with J = a + tb; K = 0 is not an isomorphism (vertical part not identified); a fibrewise-only K allows discontinuous blocks | the stated laws exclude both wrong models |
| §9.3(v), B = max‖L‖ + a e^(−a)/sinh a | curvature −1, a = 1 | L = −coth 1 = −1.3130, U = −1, \|U − L\| = 0.3130 = e^(−1)/sinh 1 (0.3679/1.1752); B = 1.6261 ≥ ‖U‖ = 1 | holds |
| C-dense through W^u(p) | full 2-shift, p = 0^ℤ; swap; identity of an n-point set; two disjoint shifts | W^u(0^ℤ) = sequences that are 0 far left, dense; swap: W^u(a) = {a}, not dense, pieces {a}, {b} with f² C-dense (m = 2, as Check 1); identity: n singleton pieces, transitive iff n = 1; two shifts: W^u(p) lies in one, not dense (as Check 3) | consistent with every §6.3 Check |
| §6.3 item 2, delayed specification | full shift at ε = 2^(−k); adjacent intervals (a₂ = b₁ + 1); k = 1; one-point space | windows [a₁ − k, b₁ + k] and [a₂ − k, …] are disjoint iff a₂ − b₁ ≥ 2k + 1, so M = 2k; adjacent intervals overlap for k ≥ 1 and are excluded by the delay; k = 1 needs no delay and has a periodic point of large period; one point: M = 0 | holds |
| §6.3 Check 5, M = k + 1 | k = 3, 4, 5 | the windows [−k−1, 2(L−1)+k+1] and [2t₀−k−1, …] are disjoint iff t₀ − (L−1) ≥ k+2, so M = k+1; gluing times lie in [2k+2, 2k+5] ⊆ [0, 2k+6] and are ≥ 2k; M + m = 6, 7, 8 against 2k = 6, 8, 10: not below at k = 3, below at k = 4 and 5 | corrected as stated |
| §6.6 period T′ ∈ `Flow.periods` g z | closing near an orbit of period p with T ≈ 2p | z on the orbit, T′ = 2p is a period, minimal period p, \|p − 2p\| > ε | `Flow.periods`, not `Flow.minimalPeriod`, is the right object |
| §8.3 τ_Λ ≤ `Flow.minimalPeriod` | periodic orbit of period p; nonperiodic point; rest point; cat suspension | p: τ_Λ ≤ p is equivalent to no fixed s ∈ (0, τ_Λ); nonperiodic: minimal period 0, periods {0}; rest point: minimal period 0 although every s fixes it, so the equivalence needs no rest point, which holds because X ≠ 0 on Λ; cat suspension: minimal periods are positive integers, τ_Λ = 1 | holds |
| §7.2 C¹ conjugacy through `Homeomorph.conjFlow` | diag(2, 1/2) suspension under a linear C¹ h | generator Dh X ≠ 0; constants change by sup‖Dh‖·sup‖Dh⁻¹‖ over the compact Λ and h(Λ); rate κ unchanged | holds |
| `HasLowerGibbsProperty` after the move | elaborated type | identical to before (pseudometric, measurable) | holds |

## For the maintainer

- No declaration name changed, so the names other roadmaps cite are unaffected.
- The request to RiemannianGeometry (gap `connection-map-jacobi-derivative`) now asks for a smooth connection map and the smooth bundle isomorphism T(TM) ≅ π*(TM ⊕ TM). That is the standard object, slightly more than the earlier wording.
- `design/plan.json` still declares `sphere-bundle-embedding`, which the README no longer uses. Both reviews raise this for the humans and not as a finding, so it was not changed here.
