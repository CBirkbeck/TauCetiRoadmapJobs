# FIX-PKG-DimerModelsAndLozengeTilings~2

Repair round for the review `REV-PKG-DimerModelsAndLozengeTilings` (four findings, all P3). All four
were verified against the cited texts, the pinned Mathlib and the open head of the cited roadmap,
and applied. No statement, hypothesis or Lean signature changed: the edits are a scope clause, a
docstring name and locators.

## F01 (P3) — applied

README Scope and ownership, Bernoulli bullet: "… which FactorRigidity §8.3 builds;" → "…, and the
Bernoulli action of a countable discrete group `G` on `G → α` for any measurable `α` and probability
law, with its mixing for infinite `G`, which ClassicalErgodicTheory §0.3 (item 2) and §1.4 (item 2)
build;". Deferral only: no `*Needs:*`, no supplier contract.

## F02 (P3) — applied

`Suggested.lean`, docstring of `Subshift`: "Mathlib's `SymbolicDynamics.FullShift.Subshift` is the
case `I = Γ`" → "Mathlib's `SymbolicDynamics.FullShift.MulSubshift` (additively
`SymbolicDynamics.FullShift.Subshift`) is the case `I = Γ`". No statement changed; the README
already said `MulSubshift`.

## F03 (P3) — applied

README 5.4: "(gorin2021 Definition 13.6 and Lemma 13.7 …; kenyon2009 …)" → "(sheffield2005 Lemma
3.2.2, lines 1367–1371, for the face property and the equivalence; georgii2011 Theorem 14.15;
gorin2021 …, and kenyon2009 …, for the two notions of ergodicity)". Docstrings:
`lozengeGibbsInvariant_isExtreme` Gorin → sheffield2005/georgii2011; `lozengeGibbs_extreme_iff_ergodic`
adds sheffield2005 Lemma 3.2.2.

## F04 (P3) — applied

6.2: "gorin2021 lines 4638–4642" → "gorin2021 Exercises 13.3 and 13.9, lines 4520–4526 and
4583–4585". 1.6 and 6.3: the locator now attaches to the definition: "extreme slopes in the sense
of gorin2021 lines 4638–4642". No other occurrence of the locator in the README or the Lean file.

## Verification of the findings

- F01: ClassicalErgodicTheory (open, new roadmap; head read through `roadmaps show`) §0.3 item 2
  constructs, for every countable discrete `G`, the Bernoulli action on `G → α` with
  `(g • x) h = x (g⁻¹ h)` and any probability `p` on a measurable `α`; §1.4 item 2 proves mixing of
  Bernoulli actions of infinite countable groups. 4.3 remains a kept variant (several orbits, any
  law including point masses, tail triviality).
- F02: pinned Mathlib `Mathlib/Dynamics/SymbolicDynamics/Basic.lean` line 233
  `structure Subshift … [AddMonoid G]` (additive `shift`), line 253 `structure MulSubshift`
  (`[Monoid G]`, `mulShift`), both in namespace `SymbolicDynamics.FullShift` (lines 112, 114).
- F03: gorin2021 Lemma 13.7 (lines 4561–4562) says only that an extreme Gibbs translation-invariant
  measure is trivial on invariant events; the face statement is sheffield2005 line 1370 in Lemma
  3.2.2, which itself cites Georgii's Theorem 14.15 (line 1366), and its first sentence (lines
  1367–1369) is the equivalence of extremality and ergodicity. Pattern: README 4.6 and 5.3 already
  cite sheffield2005 Lemma 3.2.2 next to gorin2021 Lemma 13.7, whose proof supports the conditioning
  clause they also state; unchanged.
- F04: gorin2021 lines 4638–4642 define an extreme slope (one proportion zero); Exercise 13.3
  (lines 4520–4526) is the equal mixture of the three frozen tilings and Exercise 13.9 (lines
  4583–4585) its decomposition into ergodic Gibbs translation-invariant measures. kenyon2009 line
  891 is Exercise 13 (boundary slopes, corners first).

## Other edits

`sources.toml` `cited_for` updated to match: sheffield2005 adds 5.4; georgii2011 adds 5.4; gorin2021
says "the two notions of ergodicity" instead of "its face property" for 5.2–5.4, and "6.1-6.3 slope,
extreme slopes, the frozen measures of Exercises 13.3 and 13.9" instead of "6.1-6.2 slope". No new
manifest key; no text requested (`needs-references.toml` not written).

## Adversarial pass (changed text only)

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| F01 scope clause: ClassicalErgodicTheory's action is the `I = Γ` case of 4.3 | `G = ℤ`, `x = 1_{0}`, `g = 1` | CET: `(1•x)(h) = x(h − 1)`, so `1•x = 1_{1}`; 4.3: `(γω)(i) = ω(i − 1)`, same `1_{1}` | same action; 4.3 still differs (several orbits, tail triviality, `δ_a` allowed) | clause added |
| F02 `Subshift` with `I = Γ` vs `MulSubshift` | `Γ = ℤ` written multiplicatively, `ω = 1_{0}`, `g` the generator | ours: `ω(g⁻¹ i)` = `1_{g}`; `mulShift g ω = (h ↦ ω(g h))` = `1_{g⁻¹}` = action of `g⁻¹`; as `g` runs over `Γ` so does `g⁻¹`, same closure condition; `Subshift` needs `[AddMonoid G]`, not available for a `[Group Γ]` | docstring name was wrong | fixed |
| F03 face property, lozenge case | `ν₃ = (δ_{M₁} + δ_{M₂} + δ_{M₃})/3` (5.4 Check) | `ν₃ ∈ 𝒢_inv`; face ⇒ each `δ_{M_i} ∈ 𝒢_inv` (agrees with 5.4 Check 3: completion sets are singletons); invariant event `{M = M₁}` has `ν₃`-mass `1/3`, so `ν₃` not ergodic and not extreme (sheffield2005 3.2.2 equivalence) | consistent | locator only |
| F03 equivalence direction from gorin2021 13.7 | same `ν₃` | gorin: extreme ⇒ invariant events in `{0,1}`; contrapositive with `1/3` gives `ν₃` not extreme; converse needs the face property | gorin supports one direction only | sheffield added to the iff docstring |
| F04 corners ergodic Gibbs (6.2) | `δ_{M₁}`, `δ_{M₂}`, `δ_{M₃}` | slopes `(1,0)`, `(0,1)`, `(0,0)`; Exercise 13.9's decomposition of `ν₃` has exactly these three EGTI components | supported by the exercises | locator replaced |
| F04 "extreme slope" on the edges (1.6, 6.3) | slopes `(s,0)`, `(0,t)`, `(s,1−s)`, `(1/3,1/3)` | type proportions `(s, t, 1−s−t)`: `(s,0,1−s)`, `(0,t,1−t)`, `(s,1−s,0)` each have a zero, so extreme; `(1/3,1/3,1/3)` none, non-extreme | the three edges are exactly Gorin's extreme slopes | wording attached to the definition |

## Checks

- Elaboration: `lake env lean packages/DimerModelsAndLozengeTilings/Suggested.lean` from the content
  repository: exit 0; 17 warnings, each `declaration uses sorry`, at lines 115, 168, 184, 198, 234,
  245, 331, 343, 375, 387, 409, 422, 453, 490, 503, 523, 553; no other message.
- Signatures: a scratch copy with `#check @Subshift`, `#check @lozengeGibbsInvariant_isExtreme`,
  `#check @lozengeGibbs_extreme_iff_ergodic` (the three declarations whose docstrings changed)
  elaborated; the types are as before (`Subshift : (Γ I S) → [Group Γ] → [MulAction Γ I] →
  [TopologicalSpace S] → Type`; the two lozenge theorems unchanged, hypothesis `μ ∈
  lozengeGibbsInvariant` kept). No binder lost; nothing else in the Lean file changed.
- Dependency check (`gate --depcheck … --movable`):

      depcheck: 246 roadmaps, 2241 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.

## For the maintainer

- ClassicalErgodicTheory is an open, draft new-roadmap pull request; it is not among the 240 listed
  in the brief's open-pull-request file. Its head was read through `roadmaps show`. It is named only
  as a scope deferral (it also builds the `I = Γ` case of 4.3), not as a supplier, so it adds no
  dependency; the dependency check confirms this.
- No Lean name changed; no other roadmap is affected. `design/plan.json` gaps unchanged (`[]`).
- The review's "For the human reviewers" section (licence of gorin2021, shape of
  `Specification.comp_eq`, Part II scope, the 3 × 3 hexagon matrix) was left to the humans, as the
  brief requires.
