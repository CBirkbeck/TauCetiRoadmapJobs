# FIX-RT-Varifolds~1: repair of red-team round 1 of Varifolds

There were two reviews, `RT-Varifolds~1a` and `RT-Varifolds~1b`, with five findings each, all P3.
Three pairs overlap and are settled together, which leaves seven distinct issues. Every issue was
checked against the sources and the pins, and all seven are applied. Files changed:
`packages/Varifolds/README.md`, `packages/Varifolds/Suggested.lean` and
`packages/Varifolds/sources.toml` (`cited_for` only). `metadata.toml` and `design/plan.json` are
unchanged: no supplier gap is needed.

## RT-Varifolds~1a/F01, RT-Varifolds~1b/F01 (P3) — applied

In 5.2, the Check "V = 0 gives 0 = 0; for k = 0 both sides vanish" is replaced by two Checks on the
unit cylinder of ℝ³:

- the first uses a vertical line and the horizontal circle. It shows that the trace is over S and
  not over T_xM, and it fixes the sign of the curvature term. It also shows that the bound
  ‖δ(ι_#V)‖ ≤ ι_*(‖δV‖ + k|B_M|‖V‖) is attained;
- the second uses the helix, where `tr_S B_M = −cos²α ν`.

The Layer 5 Examples now list these curves. The great-sphere Check and the affine Check (B_M = 0, a
degenerate case) are kept.

Evidence. Let ν = (x₁, x₂, 0) and τ = (−x₂, x₁, 0). Then:

- B(τ, τ) = (D_τ τ)^⊥ = −ν, and B(τ, e₃) = B(e₃, e₃) = 0;
- for the vertical line, tr_S B = 0, while the full trace gives −ν;
- for the circle, H_{ι_#V} = 0 + (−ν), which is the curvature vector γ'' of the unit circle; the
  opposite sign would give +ν;
- for the helix γ(t) = (cos t, sin t, t tan α), |γ'|² = sec²α and γ'' = −ν, so the curvature
  vector is −cos²α ν. This equals B(u, u) for u = cos α τ + sin α e₃.

All three curves are properly embedded geodesics of the cylinder, so H_V = 0 and σ_V = 0.

Pattern: no other Check in the README is of the form "0 = 0".

## RT-Varifolds~1a/F02 (P3) — applied

`grassmannBundle.instBorelSpace` (`⟨rfl⟩`) is deleted from `Suggested.lean`. In README §1.2,
"(`grassmannBundle.instMeasurableSpace`, `grassmannBundle.instBorelSpace`)" becomes
"(`grassmannBundle.instMeasurableSpace`; it is a Borel space by definition)".

Evidence: the file still elaborates without it. The `#check` run shows that every remaining type is
identical to its type before the change, so no statement used the instance. No roadmap on main or
at an open head names it (`roadmaps grep --fixed instBorelSpace`).

## RT-Varifolds~1a/F03, RT-Varifolds~1b/F05 (P3) — applied

The sentence "All types live in a single universe." is deleted from the Conventions.

Evidence: `Suggested.lean` binds `E`, `H`, `M`, `F` and `N` with `Type*`, and `#check @constancy`
shows the universes `u_1` to `u_4`. The polymorphic statements are the more general reading, and
nothing in the README relied on the sentence.

## RT-Varifolds~1a/F04, RT-Varifolds~1b/F04 (P3) — applied

The inequality is now credited to Scharrer2022 Lemma 3.3 and Remark 3.4. In README §6.2, the
locator "AgnolettoCorreaHoyosDaSilvaNardulli2025 line 542, Lemma 2.22" now reads: "a differential
form for a weighted, mollified mass ratio, under a two-sided bound |sec| ≤ K and for radii below a
ρ_0(r_0, K), is AgnolettoCorreaHoyosDaSilvaNardulli2025 line 524 and 542–640, Lemma 2.22". The
docstring of `monotonicity_inequality` says the same, after "compare".

Evidence:

- AgnolettoCorreaHoyosDaSilvaNardulli2025 line 524 assumes |sec| ≤ K.
- Its lines 542–640 bound the σ-derivative of `σ^{−m}∫ h φ_ε(u_y/σ) d‖V‖`, with constants
  c(σ, ±K).
- Scharrer2022 line 1120–1127 (Lemma 3.3) and line 1184–1203 (Remark 3.4, which gives
  `m√b ‖V‖(B̄_t)`) state the integrated inequality.

One detail of 1a's witness is wrong: "it has no first-variation term". Lemma 2.22 has the term
`δ_gV(X_{h,ε,σ})/σ^{m+1}` (line 591 and line 640). The conclusion of the finding is unaffected.

Pattern: no other place cites Lemma 2.22.

## RT-Varifolds~1a/F05 (P3) — applied

Summary, first sentence: "in the generality of Allard's theory as presented in Chapter 8 of
Simon's lectures:" becomes "in the generality of Allard's theory:". The line "The theorems of
Allard's paper and of Simon's Chapter 8 are the case W ⊆ E" becomes "The Euclidean theorems of the
literature (Allard1972; Simon1983, §§38–42) are the case W ⊆ E".

Pattern, two more places:

- Conventions: "Simon's Chapter 4 convention" becomes a locator (Simon1983 line 2898–2902, §15).
  That passage defines the weight-convergence convention.
- Module docstring of `Suggested.lean`: "as in Allard's paper and Simon's Chapter 8" becomes
  "(Allard1972, Section 3; Simon1983, §38)".

`sources.toml`: "Summary" and "Conventions" are added to the `cited_for` lists of Simon1983 and
Allard1972. The References entry "Chapter 8 §§38–42" is a bibliographic locator and is kept.

## RT-Varifolds~1b/F02 (P3) — applied

- `Euclidean.IsVarifoldTangent`: "(Simon1983, 42.1)" becomes "(Simon1983, 42.3)".
- `Euclidean.IsVarifoldTangent.isStationary`: "(Simon1983, 42.3)" becomes "(Simon1983,
  42.1–42.3)".

Evidence, in Simon1983:

- line 7736 (42.1) gives the hypotheses at x;
- line 7738–7745 gives stationarity and the ball masses (*);
- line 7763 (42.2) gives the dilation invariance;
- line 7768–7771 (42.3) defines VarTan.

The docstring of `exists_isVarifoldTangent` cites "42.1, with 4.4". That is right, because the
subsequence is chosen at line 7738–7740, right after 42.1. It is kept.

## RT-Varifolds~1b/F03 (P3) — applied

In the supplier contracts, `InnerProductSpace.euclideanHausdorffMeasure_eq_volume` now sits next to
`MeasureTheory.Measure.euclideanHausdorffMeasure`, attributed to
`Mathlib/Geometry/Euclidean/Volume/Measure.lean` ("equals Lebesgue measure on a d-dimensional real
inner product space"). `normDet`, `normDet_comp` and
`euclideanHausdorffMeasure_image_eq_normDet_mul_volume` stay with `NormDet.lean`.

Evidence at the pin:

- the theorem is at `Mathlib/Geometry/Euclidean/Volume/Measure.lean:191`;
- `NormDet.lean:436` only uses it;
- `normDet` is at `NormDet.lean:69`, `normDet_comp` at line 324, and the image formula at line 433.

Pattern: every name/file pairing of the supplier contracts was checked mechanically. Two more
attributions were ambiguous and are now explicit:

- `HasBesicovitchCovering` is defined in `Mathlib/MeasureTheory/Covering/Besicovitch.lean:155`;
  its instance is in `BesicovitchVectorSpace.lean`;
- `TauCeti.Manifold.exists_isNormalDomain_ball` is in `…/Geodesic/Normal/Basic.lean:163`. Its gloss
  now says what the theorem states: some tangent ball of positive radius is a normal domain.

All other pairings resolve, including the "same file" references.

## Checks

**Elaboration.** `lake env lean packages/Varifolds/Suggested.lean`, run from the content checkout:
15 warnings "declaration uses `sorry`" (one per theorem), no errors and no other messages. No
`TauCeti.*` module needed building.

**Signatures.** A scratch copy of the file ended with `#check @name` for each of its 39
declarations and was elaborated once. Each elaborated type was compared mechanically with the
recorded pre-edit type. All 39 are identical, and `grassmannBundle.instBorelSpace` no longer
appears. No README statement changed, so README and Lean still agree.

The 18 "dropped binder" leads are unchanged. All of them are definitions or instances whose bodies
do not use the dropped class, as both reviews found, and every theorem keeps the full variable
block. Every name declared in `Suggested.lean` occurs in the README.

**Dependency check**, output:

```
depcheck: 250 roadmaps, 2363 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Citations.** `roadmaps resolve packages/Varifolds/README.md` reports no cross-roadmap citation and
no Lean name that is found nowhere. Before the repair it listed 10 leads, all of them this
roadmap's own `Euclidean.*` names declared in `Suggested.lean`.

**Ownership.** No construction, target or supplier was added, so ownership is unchanged. The
overlap file lists no open pull request that changes this roadmap and no dropped id.

**Sources.** No new source. The only locators added are in Simon1983 and Scharrer2022 (both
certified, read in the cache), in AgnolettoCorreaHoyosDaSilvaNardulli2025 (read), and in Allard1972
(uncertified, cited by locator). No `needs-references.toml` was written.

**Gate failure (tex=5).** In the 5.2 cylinder and helix Checks, five formulas with a braced
subscript stood outside code spans: `tr_{T_xM} B_M = −ν`, `H_{ι_#V} = 0`, `H_{ι_#V} = −ν`,
`‖δ(ι_#V)‖ = |H_{ι_#V}| H¹⌞circle = H¹⌞circle = k|B_M| ‖V‖` and `H_{ι_#V}`. Each is now in a code
span, as the README writes them everywhere else. The mathematics and the wording are unchanged. A
scan of the README with code spans removed finds no braced subscript or superscript, no `$`, and
no `\(`, `\[` or backslash command. Suggested.lean is unchanged. The dependency check, run again,
gives the same output.

## Adversarial pass on new and changed text

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 5.2 Check: cylinder, vertical line | k = 1, S = span(e₃) | tr_S B = 0, H_{ι_#V} = 0; full trace −ν; ½·full trace −ν/2 | formula right; wrong models refuted |
| 5.2 Check: cylinder, circle {x₃ = 0} | S = span(τ) | H_{ι_#V} = 0 + (−ν) = γ''; opposite sign +ν; ‖δ(ι_#V)‖ = H¹⌞C = 1·1·‖V‖ | sign fixed; bound attained |
| 5.2 Check: helix | α → 0, α = π/4, α → π/2 | −cos²α ν: −ν (circle), −ν/2, 0 (line); γ''/\|γ'\|² = −ν·cos²α | agrees at both limits with the other Check; constant-c models give −cν for every α |
| 5.2 first consequence on the helix | α = π/4 | ‖δV‖ = 0 ≤ ‖δ(ι_#V)‖ = ½H¹; ½H¹ ≤ k\|B_M\|‖V‖ = H¹ | strict, consistent |
| \|B_M\| on the cylinder | u = aτ + be₃, a² + b² = 1 | \|B(u, u)\| = a² ≤ 1, maximum 1 at u = τ | \|B_M\| = 1 |
| README 1.2: Borel by definition | `instMeasurableSpace := borel _` | `BorelSpace` holds by `rfl` (the deleted instance elaborated with `⟨rfl⟩`) | true |
| Supplier: `euclideanHausdorffMeasure_eq_volume` | V of dimension 0; V = EuclideanSpace ℝ (Fin d) | pin statement `μHE[finrank ℝ V] = volume` for every finite-dimensional V; d = 0 gives the Dirac measure on both sides | the gloss matches the pin |
| Supplier: `exists_isNormalDomain_ball` | pin statement | `∃ r > 0, IsNormalDomain I M p (ball 0 r)` | gloss corrected to "some ball" |
| 6.2 citation of Lemma 2.22 | line 524, 542–640 | hypothesis \|sec\| ≤ K; σ-derivative of the mollified ratio, coefficients c(σ, ±K), ρ_0(r_0, K) | description accurate |
| Docstrings 42.1/42.3 | Simon1983 line 7736, 7763, 7768 | 42.1 hypotheses, 42.2 invariance, 42.3 definition | locators right |
| Summary and Conventions locators | Simon1983 line 2898–2902; §§38–42 | the weight-convergence definition of §15; §38–42 are Chapter 8 | locators right |

## For the maintainer

- `design/plan.json`'s `summary` field still says "in the generality of Allard and Simon's
  Chapter 8". This job may edit only the `gaps` list of that file, so the field is unchanged. The
  README Summary, which is the roadmap, no longer says it.
- Deleted name: `TauCetiRoadmap.Varifolds.grassmannBundle.instBorelSpace`. No roadmap on main or at
  an open head cites it. No other name changed.
- Neither review's "For the human reviewers" section led to any edit.
