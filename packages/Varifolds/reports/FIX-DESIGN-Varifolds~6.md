# FIX-DESIGN-Varifolds~6: repair of the Varifolds design

Findings of REV-DESIGN-Varifolds~5: two, both P3. Both verified against the sources and applied.
Files edited: `packages/Varifolds/design/README.md`, `packages/Varifolds/design/plan.json`.
`packages/Varifolds/sources.toml` is unchanged (every locator used is in a recorded work).

## F01 (P3) — applied

Verified. 6.4's route went from "carried by Σ, densities exist" straight to ‖V‖ = θHᵏ⌞Σ. That step
needs a differentiation theorem: Simon1983 line 7713–7719 invokes his 4.7 there (Simon1983 line
1128–1143). The witness μ = H¹⌞L + δ_0 is carried by L and is not of the form θH¹⌞L.

Change (6.4 route): old "The density exists everywhere (6.3) and equals 1 for Hᵏ⌞Σ, so V = v(Σ, θ)
with θ = Θ^k(‖V‖, ·)" → new: in a C² chart, Θ^k finite everywhere gives ν(B̄_r(t)) ≤ c_t r^k.
`Besicovitch.ae_tendsto_rnDeriv` (Lebesgue against ν) then gives D = d(dt)/dν ≥ ω_k/c_t > 0 ν-a.e.
`MeasureTheory.Measure.setLIntegral_rnDeriv_le` gives ν ≪ dt, so ‖V‖ = θHᵏ⌞Σ and
V = v({θ > 0}, θ).

The repair differs from the suggested text in two places:

- It adds the Lebesgue-decomposition step that turns "D > 0 ν-a.e." into ν ≪ dt
  (∫_A D dν ≤ dt(A)). The suggested wording jumped over it.
- It no longer claims θ = Θ^k(‖V‖, ·), which the route never uses. The conclusion
  V = θ_0[Σ] already gives Θ^k = θ_0 on Σ.

Also changed:

- New 6.4 Check: the witness V' = v(L, 1) + δ_{(0,L)}, with computed values.
- 6.4 *Needs:* now lists both Mathlib names.
- Mathlib contract: `setLIntegral_rnDeriv_le` added with its file and content.
- Layer 6 Dependencies: Mathlib Besicovitch and Radon–Nikodym added.
- plan.json 6.4: two `mathlib:` prerequisites and the test "atom on a line".

The statement of 6.4 is unchanged.

Same-pattern search ("carried by"/"≪"/density ⇒ absolute continuity): the only other step of this
kind is 7.3. It goes through 3.3's first rectifiability theorem, which takes tangent spaces with
multiplicity at ‖V‖-a.e. point and so needs no separate differentiation step. No other occurrence.

## F02 (P3) — applied

Verified. Simon1983 line 3371–3372 says §19 assumes V = v(M, θ) rectifiable with generalised mean
curvature. The test field proves the theorem in general:
div_S X = kγ + γ'|P_S(y − ξ)|²/r ≥ kγ for every S.

Changes:

- 6.5 locator: old "(Simon1983 line 3373–3400, 19.1–19.2)" → new "(Simon1983 line 3371–3400,
  19.1–19.2, for rectifiable V with generalised mean curvature; the general case is this roadmap's,
  by the same test field)".
- 6.5 route: now states that C¹ γ is positive beyond R + ε, that X is compactly supported in E ∖ K,
  the exact divergence identity, and the step k ≥ 1 ⇒ ∫γ d‖V‖ = 0.
- The δ_{(0,P)} Check now notes that this varifold is not rectifiable.
- The closing locator and plan.json 6.5 are updated to match.

Same-pattern repair: every other Simon Chapter 4 locator (rectifiable setting) cited for a
general-varifold statement already sits next to a general-setting locator. These are 5.2 (16.4
beside 41.2(3)), 6.1 (17.2–17.5 beside 40.1–40.3; 18.1 beside 40.4), 6.3 (17.8 beside
AgnolettoCorreaHoyosDaSilvaNardulli2025 Corollary 2.27, which is stated for arbitrary V ∈ V_m(Mⁿ),
line 1448) and 7.2 (19.3 beside 42.1–42.3). Each is now marked "rectifiable case" in the README and
in plan.json. 6.3's lower bound and 5.1 are rectifiable statements already.

## Adversarial pass on the changed text

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 6.4 a.c. step: Θ^k < ∞ everywhere ⇒ ‖V‖ ≪ Hᵏ⌞Σ | V' = v(L,1) + δ_{(0,L)} on ℝ² | ν(B̄_r(0)) = 2r + 1; ratio 2r/(2r+1) → 0 on {0}, ν({0}) = 1; Θ¹(‖V'‖,0) = lim (2ρ+1)/(2ρ) = ∞ | hypothesis fails, conclusion fails: consistent |
| same | v(L, θ), θ > 0 continuous | ν(B̄_r(t)) = ∫_{t−r}^{t+r} θ ≈ 2rθ(t); ratio → 1/θ(t) > 0 | ν ≪ dt, density θ: consistent |
| same, bound | Lipschitz chart, L | ν(B̄_r(t)) ≤ ‖V‖(B̄_{Lr}(x_t)) ≤ (Θ+1)ω_k L^k r^k ⇒ D(t) ≥ 1/((Θ+1)L^k) | positive |
| `setLIntegral_rnDeriv_le` use | dt(A) = 0 | ∫_A D dν ≤ 0 with D > 0 ν-a.e. on A ⇒ ν(A) = 0 | holds for arbitrary measures (Lebesgue.lean:203 `withDensity_rnDeriv_le` has no instance argument) |
| V' not stationary | X = ψ(y) y_1 e_1, ψ = 1 near 0 | line: ∫∂_t(ψ(t,0)t)dt = 0; atom: tr(P_L(e_1⊗e_1)) = 1 ⇒ δV'(X) = 1 | not stationary, as the theorem needs |
| 6.4 conclusion unaffected | g = e^{2t}dt² on ℝ | θ̃ = 1, w = e^t, δV(X) = ∫(e^tX)'dt = 0 | existing Check still holds |
| 6.5 divergence | X = γ(r)(y − ξ) | ∇X = γI + γ'(y−ξ)⊗(y−ξ)/r ⇒ tr(P_S∇X) = kγ + γ'\|P_S(y−ξ)\|²/r | ≥ kγ for every S, no rectifiability |
| 6.5 support of X | γ = 0 on [0, R+ε] | spt X ⊆ spt ψ ∩ {r ≥ R+ε}, disjoint from K ⊆ B̄_R(ξ) | admissible test field |
| 6.5, k = 0 | div_0 X = tr(0) = 0 | every 0-varifold stationary; hull property false | excluded by Layer 6's k ≥ 1, used explicitly in the route |
| 6.5, K = ∅ | two disjoint balls | spt ⊆ B̄_{R+ε}(ξ_1) ∩ B̄_{R+ε}(ξ_2) = ∅ | V = 0 |
| 6.5, non-rectifiable | δ_{(0,P)}, k ≥ 1 | weight δ_0, Hᵏ({0}) = 0 ⇒ not rectifiable; tests vanish near 0 ⇒ δV = 0 off {0}; spt = {0} = hull{0} | general case is needed and holds |
| 6.5 counterexample check | circle, K = {0} | H = −y ≠ 0, conclusion spt ⊆ {0} fails | consistent |

## Checks run

- Dependency check:

      candidate: Varifolds is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
      depcheck: 245 roadmaps, 2229 edges, 0 problem(s)

  No UPWARD or CYCLE line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. The
  tool did not check Mathlib names, so I opened both new names at the Mathlib pin `1b1ccf4b`
  (checked against the content repository's `lake-manifest.json`):
  - `Besicovitch.ae_tendsto_rnDeriv` (`Mathlib/MeasureTheory/Covering/Besicovitch.lean:1077`, two
    locally finite measures on a second-countable space with `HasBesicovitchCovering`).
  - `MeasureTheory.Measure.setLIntegral_rnDeriv_le`
    (`Mathlib/MeasureTheory/Measure/Decomposition/RadonNikodym.lean:319`, any two measures).
- `plan.json` parses. It still has 34 targets and an empty `gaps` list, and no prerequisite was
  added on a later target.
- Style sweep of the README: no LaTeX delimiters, machine paths, "optional" or "deferred".
- No `Suggested.lean` exists at the design stage, so there was no `#check` comparison and no
  elaboration.
- No source was fetched. No `needs-references.toml` was written: every locator is in a work
  `sources.toml` records.

## Gate failures

None were listed for this round.

## Notes for the maintainer

- No identifier, section or target number changed, and no name that other roadmaps cite was renamed.
- The only new cross-library dependency is the Mathlib lemma
  `MeasureTheory.Measure.setLIntegral_rnDeriv_le`.
- No supplier gap was declared, and ownership is unchanged.
- No suspicious instruction was found in the review text.
