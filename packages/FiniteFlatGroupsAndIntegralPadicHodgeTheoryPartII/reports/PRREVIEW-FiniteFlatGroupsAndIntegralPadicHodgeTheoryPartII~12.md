# Review of FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (pull request #1843 at 006b950)

**Verdict:** needs changes

Incremental re-review: the folder is unchanged since the review of `006b950` (0 lines). This round reads the pull request's title and description against the head. Both findings are in the description; the folder's files need no edit.

## R01 (P3) — The description restricts Layer 0 to p>2 and to p-frames

**Location:** pull-request description, summary block: "Over complete Noetherian local rings with perfect residue field and p>2, it constructs the Zink ring Ŵ(R), p-frames with an invariant tilde functor, and contravariant Dieudonné displays anti-equivalent to p-divisible groups".

**Claim:** The head states all of Layer 0 at every prime, on frames with an arbitrary frame constant θ; p>2 begins at Layer 1.

**Witness:** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md` line 26: "Layer 0 holds for every prime p, including p=2"; line 392 (§0.13): "For every prime p"; line 198: D_(ℤ₂) "is a frame that is not a p-frame".

**Repair:** Replace the sentence by: "Over complete Noetherian local rings with perfect residue field, at every prime, it constructs the Zink ring Ŵ(R), frames with frame constant θ (p-frames for odd p) with an invariant tilde functor, and contravariant Dieudonné displays anti-equivalent to p-divisible groups; the perfect-ring classification also holds at every prime. From Layer 1 on, p>2." In the prose paragraph, replace "Layer 0 builds Zink's coefficient ring Ŵ(R), p-frames," by "Layer 0 builds, at every prime, Zink's coefficient ring Ŵ(R), frames,".

## R02 (P3) — The description counts fourteen supplier contracts; the head has fifteen

**Location:** pull-request description, prose paragraph: "Fourteen supplier extensions that this roadmap needs from earlier roadmaps are stated as exact contracts with locators."

**Claim:** The README states fifteen contracts.

**Witness:** README lines 50, 68, 76, 78, 80, 88, 90, 92, 94, 102, 104, 106, 108, 118, 124 each open "What … must provide (gap:…)": 1+1+3+4+4+1+1 = 15.

**Repair:** Replace "Fourteen" by "Fifteen".

## Previous findings

- R01 — not repaired, settled as before: the plan's `gaps` list still has 11 slugs and none of the four GeometricSatakeAndFusion contracts of README lines 102–108. It is outside the folder; see "For the human reviewers".
- R02 — not repaired: the description still reads "perfect residue field and p>2 … p-frames" and "Fourteen supplier extensions". This round checks the description, so it is raised as R01 and R02 above.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §0.3/§0.13, frame constant at p=2 (R01) | D_R for R=ℤ₂; R=ℤ/4; odd p | θ=2−[4], ghost components 2−4^(2ⁿ) = −2, −14, −254; θ=2 iff 4R=0; θ=p for odd p | README covers p=2 with θ≠p; the description's "p>2, p-frames" excludes it | description only (R01) |
| Supplier contracts (R02) | count by supplier | FiniteFlatGroups 1, PadicPeriodRings 1, SchemeAndStackFoundations 3, ReductiveGroupsPartII 4, GeometricSatakeAndFusion 4, PadicHodgeTheory 1, ShimuraVarieties 1; total 15 | description says 14 | description only (R02) |
| Headline groups in `Suggested.lean` | docstring bullets | 21 bullets, 0 declarations | agrees with "none of the 21 headline theorem groups" | none |

The rows for the untouched statements stand as in the previous review, of `006b950`.

- Description sentences read against the head, 17; 15 agree. Those checked include: Gabber–Lau at every prime (§0.2); c not determined by the Frobenius square (§1.3); very-goodness and adaptedness defined independently of the quotient (§§2.9–2.10, line 130); adapted iff factoring through R_G (§4.12); purity in place of the explicit H¹ vanishing (line 658, contract line 90); no very-goodness in the ordinary lift (§6.4); J_b(ℚ_p) by self-quasi-isogenies (§6.5); the downstream sentence (line 1647).
- The title "…: roadmap" and "This pull request adds" agree with the change: the folder is not on `origin/main`, 1747 insertions, 0 deletions, 120 headings added, 0 Lean declarations.
- Remark: the description's "the targeted Lake build succeeds with `sorry` as the only warning" holds vacuously; the file declares nothing and elaborates with no warning.
- Gate at `006b950` (the worker's run): every counter 0, `build=0 OK`.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/Suggested.lean`: exit 0, no output.
- Outside-folder diff against `origin/main`: empty. `scratch/overlaps.md`: no open pull request changes this roadmap, no cited id dropped, none defined only by an open revision.
- The two leads of `scratch/citations.md` (`Crystalline.fontaineEnvelope_initial`, `Crystalline.fontaineEnvelope_periodPDEnvelope`) are DerivedDeRhamCohomology §PD.7's names, as resolved in the previous review.
- Overlap check: not re-read this round (no changed passage); stands as in the previous review, of `006b950`.
- Source independence: changed passages only; the folder diff is empty, so 0 passages compared and the arrangement was not compared again.

## Not verifiable

- No source was opened this round: the folder has no changed passage, and the seeded sample stands as read in the previous review of the same head.
- The description's "4 independent review rounds and 2 red-team rounds" is a statement about the job board, not checkable against the head.
- The generated blocks of the description (`depends-on`, `merge-order`) are outside this check.

## Source issues

- none

## For the human reviewers

- `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/design/plan.json` lists 11 gaps; README lines 102–108 state four further contracts on GeometricSatakeAndFusion (§§4.17, 0.29) whose slugs the plan lacks, so the intake does not announce them.
- The plan's `needs` sentences for `full-fixer-cutting-tensors` and `ordinary-levi-full-fixer` are older than the README's at lines 88 and 94.
