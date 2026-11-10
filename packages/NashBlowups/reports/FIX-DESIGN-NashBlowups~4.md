# FIX-DESIGN-NashBlowups~4: repair of the design review

Review settled: `REV-DESIGN-NashBlowups~3`, two findings, both P3. Files edited:
`packages/NashBlowups/design/README.md`, `packages/NashBlowups/design/plan.json` and
`packages/NashBlowups/sources.toml`. There is no `Suggested.lean` at the design stage.

## REV-DESIGN-NashBlowups~3/F01 (P3) — applied differently

Verified. stacksVarieties line 2256 (0C3N) proves the result for every separable `K/k`. Its proof (lines 2278–2280)
needs exactly the normality of `A′ ⊗_k K` (0C3M, line 1049, via stacksAlgebra 0C30, line 21510, and 06DF, line 21516).
Nothing owns that fact: `roadmaps grep` found it on no main roadmap and no open head (searches: geometric
normality, 0C3M/0C30/0C3N/06DF, normality under separable extension). The board packages and the pins (Mathlib,
Tau Ceti) do not have it either.

Old → new: §6.3 base change, "finite separable `k'/k`" → "`k'/k` separable (`Algebra.IsTranscendentalSeparable`)".
The general route uses `normalizationDesc`, Tau Ceti `isIso_normalizationDesc_iff` and 035Q(3)/0H7D; the smooth
route is kept for finite separable extensions. A new target §0.7 states normality ascent for every normal `k`-scheme.
There is a new Conventions bullet on separability and a new Check over `ℚ(u)`.

Why differently:
- **Where the normality fact lives.** It is the general §0.7, for any normal `k`-scheme and any separable
  extension, with no finiteness or Noetherian hypothesis. The review suggested an API bullet in §6.1 limited to
  `X̄*`; the general statement has the same proof, and a version for `X̄*` only would be a route-specific shortcut.
- **The carrier is `Algebra.IsTranscendentalSeparable`.** Mathlib states it at
  `Mathlib/FieldTheory/TranscendentalSeparable.lean:72` as Stacks 030O part 2. The other candidate,
  `Algebra.IsSeparable`, forces the extension to be algebraic, so it would exclude the review's own witness
  `ℚ(t)/ℚ`.
- **The route uses pinned declarations.** Besides citing 035Q(3), it goes through Mathlib's
  `Scheme.Hom.normalizationDesc` (`Normalization.lean:371`) and Tau Ceti's `Scheme.Hom.isIso_normalizationDesc_iff`
  (`Normalization/IsIso.lean:114`).

Supporting edits:
- Scope and ownership names §0.7.
- The supplier contracts gain Mathlib's `normalizationDesc` and `IsTranscendentalSeparable`, and Tau Ceti's
  `isIso_normalizationDesc_iff`.
- "How to read the build" and the Layer 0 and Layer 6 Dependencies are updated.
- `plan.json` gains target 0.7 with four tests; target 6.3 gets a new statement, hypotheses, locator,
  prerequisites and four tests.
- `sources.toml`: the `cited_for` of stacksVarieties (0C3M, line 1064), stacksAlgebra (030O, 0C30, 06DF) and
  stacksNormalization (035Q(3), 0H7D) are updated.

Pattern (statements narrower than their source without saying so):
- §0.5: 00TU allows any finitely generated separable `κ`. One clause now says that injectivity holds in that
  generality, while the isomorphism needs `Ω_{κ/k} = 0` (dimension `trdeg_k κ`, line 17680), that is, `κ` finite
  separable.
- §6.2: 035Q(4) needs `Z` only normal. One clause now says that the locally Noetherian hypothesis comes from the
  setting of AlgebraicModuliForArithmeticGeometry §5.4, whose lifting bullet the route uses. The density sentence
  is corrected: density follows from the generic points alone, with no finiteness of components needed.
- `plan.json` locators of 0.5 and 6.2 are updated to match.

## REV-DESIGN-NashBlowups~3/F02 (P3) — applied

Verified. alperModuli line 2979 and line 2985 assume `S` Noetherian, and the vanishing-locus step cites Exercise 0.3.21
(line 1202), which is also stated for Noetherian `S` and coherent sheaves on `ℙⁿ_S`. The step itself is
Noetherian-free; the proof is below.

Old → new: §0.4 now says that the source assumes `S` Noetherian and works on `ℙⁿ_S`, as does the exercise it
cites, and that the step used needs neither. The zero-locus description now has a proof sketch (the ideal of the
coordinate maps, right exactness of pullback). Three Checks were added: the review's non-Noetherian witness, `p`
the identity, and `r = 2`. `plan.json` 0.4 gets a matching locator note and three tests.

The review asked for no `plan.json` change. The tests were added so that the README Checks and the plan's tests
stay in step.

Pattern: the same defect affects every Nash-blowup source. Each works over an algebraically closed field or over `ℂ`:
- nobile1975, line 29
- gonzalezSprinberg1982, lines 78 and 82
- nashModificationNotes2024, lines 143, 153, 232, 445 and 505
- duarteNunezBetancourt2020, line 103
- castilloDuarteLeytonLiendo2026, lines 13–14 and 58

The README said so only at §§2.3, 4.5 and 5.4. A new Conventions bullet ("Ground fields of the sources") now gives
these locators and says that the targets are over an arbitrary field. It also says that every property of `k` a
route uses is a hypothesis of the target.

I checked that claim route by route where a step comes from inside one of these proofs:
- §2.7: the iterates are only a definition.
- §3.2: the `∧^dΩ ⊗ Q(A)` argument works over any field.
- §4.1: separability of `κ` is a hypothesis.
- §5.1: the `R^p`-linearity holds for every derivation in characteristic `p`. DNB line 280 invokes algebraic
  closedness here, but the step does not need it.
- §§5.2–5.3: `k` perfect is a hypothesis.
- §§2.5 and 6.4: the routes are field-independent.

Hamann's Lemma 0.1 (§4.3) has exactly the hypotheses stated in the README (Noetherian, containing `ℚ`).
`sources.toml` gains a Conventions `cited_for` entry with these lines in each of the five sources.

## Adversarial pass on added or changed statements

| statement | instances tried | values computed | result / change |
|---|---|---|---|
| Conventions: separable | `ℚ(u)/ℚ`; `𝔽_p(t)(s)/𝔽_p(t)`; `𝔽_p(t^{1/p})/𝔽_p(t)`; perfect `k` | separating basis `{u}`; `{s}`; `t^{1/p}` has minimal polynomial `T^p − t`, not separable; Mathlib instance `[PerfectField k] : IsTranscendentalSeparable k K` | separable, separable but not algebraic (`IsSeparable` fails), not separable, always separable |
| §0.7 | `W = Spec ℚ(i)`, `k' = ℚ(i)` | `ℚ(i)[x]/((x−i)(x+i)) ≅ ℚ(i)²`: two points, stalks fields | normal, not integral; Check added |
| §0.7 | `C : x^p+y²+t` over `𝔽_p(t)`, `p > 2`, `k' = k(t^{1/p})` | on `C`, `m = (y)` at `y = 0` (`x^p + t = −y²`); on `C_{k'}`, `u^p + y²` lies in `m²` at `u = y = 0`, so `dim m/m² = 2 > 1`; integral (`−u^p` not a square); normalisation `s ↦ (−s², s^p)`, `(−s²)^p + s^{2p} = 0` | separability needed; Check |
| §0.7 | `W = Spec k[y]`, `k' = k(s)` over `𝔽_p(t)` | `k(s)[y]` is a PID | normal; `IsSeparable` carrier would exclude; Check |
| §0.7 | `W = Spec ℚ̄`, `k' = ℚ̄` | `colim_L ℚ̄^{[L:ℚ]}`, absolutely flat, not Noetherian | normal; no Noetherian hypothesis; Check |
| §0.7 degenerate | `W = ∅`; `k' = k`; `W = Spec k` | `∅`; `W`; `Spec k'` | all normal, consistent |
| §6.3 base change | cusp over `ℚ`, `k' = ℚ(i)` | `X̄* = 𝔸¹`, both sides `𝔸¹_{ℚ(i)}` | sound, both routes |
| §6.3 | cusp over `ℚ`, `k' = ℚ(u)` | `(X̄*)_{k'} = 𝔸¹_{ℚ(u)}`; cusp over `ℚ(u)` in char 0 has `X* = X̄* = 𝔸¹_{ℚ(u)}` (§2.1) | sound; `Spec ℚ(u) → Spec ℚ` not of finite type, so only the general route reaches it; Check added |
| §6.3 | `C` over `𝔽_p(t)`, `k' = k(t^{1/p})` | `Ω = (dx, dy)/(2y dy)`, free quotient `dx ↦ 1`, so `(C_{k'})* = C_{k'}`; `(C_{k'})̄* = 𝔸¹`; comparison `s ↦ (−s² − t^{1/p}, s^p)` bijective, not iso | separability needed; Check rewritten |
| §6.3 | `C` over `𝔽_p(t)`, `k' = k(s)` | `C_{k'}` normal by §0.7, `ν` iso, so both sides are `C_{k'}` | consistent |
| §6.3 degenerate | `k' = k`; `X` smooth; `X = Spec L`, `L/k` finite separable, `d = 0` | identity; `X̄* = X`, both sides `X_{k'}`; `L ⊗_k k' ≅ k'[x]/(f)` with `f` separable, a finite product of fields, both sides | sound |
| §6.3 route | flat projections; `U₀ = ν⁻¹(X_sm)` | generizations lift along flat maps, so generic points go to generic points, which lie in the dense opens `U₀`, `η⁻¹U₀` of Noetherian `X*`, `X̄*`; `η_{k'}` is iso over `(U₀)_{k'}` | the inclusion of generic points factors through the finite `η_{k'}` |
| §6.3 route | affine `U ⊆ (X*)_{k'}`, `B = Γ(η_{k'}⁻¹U)` | `B` normal Noetherian = `∏` normal domains; `B → ∏ κ(ξ') = Q(B)` injective (reduced); integral over `Γ(U)` implies integral over `B`, hence in `B` | `isIso_normalizationDesc_iff` holds |
| §0.4 | `S = Spec k[x_1, x_2, …]`, `O² → O`, `(a,b) ↦ a`, `r = 1` | quotients killing `e_2`: `[λ(e_1) : λ(e_2)] = [1 : 0]`, ideal `(second coordinate)`; kernel convention `[0 : 1]` | closed, non-Noetherian; Check |
| §0.4 | `p = id`; `r = 2`; `r = 0` | `K = 0`, identity; `Gr_2(O) = ∅ ⊂ Gr_2(O²) = S`; `Gr_0(E) = Gr_0(E') = S`, the zero quotient kills `K` | sound; first two are Checks |
| §0.4 zero locus | `f : T' → T`, `c_i : h*K → O_T` | image of `f*c_i` is `I_i·O_{T'}` by right exactness; `f*c = 0` iff `f` factors through `V(ΣI_i)`; ideal `= im(h*K ⊗ Q^∨ → O_T)`, independent of trivialisation | sound without Noetherian |
| §0.5 clause | `R = k[x,y]_{(y)}`, `κ = k(x)` (finitely generated separable, `trdeg 1`) | `m/m² = κ·ȳ`, `κ ⊗ Ω = κ dx ⊕ κ dy`, `ȳ ↦ dy` injective, `dx` not hit | injective, not surjective: the clause is right |
| §6.2 clause | normal `Z = Spec ∏_ℕ k` (infinitely many components) | every point is closed and generic, so any set containing the generic points is everything | density needs no finiteness; the route sentence is corrected |
| Conventions: ground fields | each cited line re-read | nobile 29; G-S 78, 82; notes 143, 153, 232, 445, 505; DNB 103; CDLL 13–14, 58 | all state an algebraically closed field or `ℂ` |
| §5.1 (pattern) | DNB line 280 | `∂(r^p f) = p r^{p−1}∂(r) f + r^p ∂f = r^p ∂f` in char `p` for any `k` | algebraic closedness unused |

## Checks run

Gate, run after the last edit:

```
candidate: NashBlowups is not in the merge order yet; checked as if placed after DeformationAndDerivedPatchingAlgebra (the intake inserts it when its design is accepted)
depcheck: 234 roadmaps, 2113 edges, 0 problem(s)
```

The gate shows no UPWARD or CYCLE line.

`roadmaps resolve` on the README found no cross-roadmap citation and no Lean name that resolves nowhere. The tool
did not check Lean names outside TauCetiRoadmap because no pinned Lake packages are on this host. I opened the new
library names at the pins myself:
- `Algebra.IsTranscendentalSeparable`: `Mathlib/FieldTheory/TranscendentalSeparable.lean:72`
- `Algebra.isSeparable_iff_isTranscendentalSeparable_and_isAlgebraic`: same file, `:76`
- the `PerfectField` instance: same file, `:91`
- `Scheme.Hom.normalizationDesc`: `Mathlib/AlgebraicGeometry/Normalization.lean:371`
- `AlgebraicGeometry.Scheme.Hom.isIso_normalizationDesc_iff`: `TauCeti/AlgebraicGeometry/Normalization/IsIso.lean:114`
- `TauCeti.AlgebraicGeometry.IsNormalScheme`: `TauCeti/AlgebraicGeometry/Scheme/Normal.lean:84`, cited through
  SchemeAndStackFoundations §0.30 on main

`plan.json` now has 38 targets and 115 tests, up from 37 and 107. The new and changed targets match the README:
§0.4 has 3 Checks and 3 tests, §0.7 has 4 and 4, §6.3 has 4 and 4. The `*Needs:*` lines of §§0.7 and 6.3 match
the plan's prerequisites.

No Lean file exists at the design stage, so nothing was elaborated and the `#check` comparison did not apply. No
text is missing, and no `needs-references.toml` was written: every source cited is in the manifest, and every
locator was read in the cached text.

## For the maintainer

- **New id, no renumbering.** §0.7 (*isNormalScheme_pullback_of_isTranscendentalSeparable*) is new. No existing id
  moved, and no roadmap on main, at an open head or in a board package cites NashBlowups.
- **Ownership.** This roadmap owns the ascent of normality along separable extensions of the ground field, because
  no supplier states it. I checked this against main, the open heads in the index (2026-11-10T20:00:51Z), the
  board packages and the pins. AlgebraicModuliForArithmeticGeometryPartII, CrystallineCohomologyPartII and
  StableReductionPartII use geometric normality only as a hypothesis or property.
- **Overlaps.** No open pull request changes this roadmap or drops an id it cites. The closest roadmaps by
  vocabulary are five revisions of SchemeAndStackFoundations; none is a dependency.
- **Source issue to report.** duarteNunezBetancourt2020 line 280 invokes algebraic closedness for the
  `R^p`-linearity of derivations, which holds for every ground field of characteristic `p`. This affects nothing
  here.
- No text read in the review, the sources or the sibling roadmaps asked for any action.
