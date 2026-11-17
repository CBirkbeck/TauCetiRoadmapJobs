# Review of AlgebraicGromovWittenTheory (pull request #1998 at fcd2977)

**Verdict:** accepted

No findings. Incremental re-review of the 5 lines changed since `cb8f1b1` (one Check of §1.2).

## Previous findings

- R01 — repaired: `README.md:307–310` "On `ℙ¹`, changing the ample line bundle from `𝒪(1)` to `𝒪(2)` changes the period of `Qⁿ` from `n` to `2n` and leaves its exponent and coefficient fixed. … the bounds `3/2` and `3` both retain just `a₀ + a₁Q`." §1.2 has three computed Checks; none names a Lean declaration.

## Verified sound

| Statement | Instances | Roadmap side | Independent value | Result |
|---|---|---|---|---|
| §1.2 Check 3 (lines 307–310), periods | `ℙ¹`, `NE = ℕ`, `A = 𝒪(1)`, `𝒪(2)`; `n = 0, 1, 2` | period of `Qⁿ`: `n`, then `2n` | `ω_{𝒪(d)}(n) = d·n`: `0, 1, 2` and `0, 2, 4` | true |
| §1.2 Check 3, truncations | `B = 3/2`; `B = 1`; `B = 0` | truncation at `B` for `𝒪(1)` equals truncation at `2B` for `𝒪(2)`; `3/2`, `3` keep `a₀ + a₁Q` | `n ≤ B ⇔ 2n ≤ 2B`; `n ≤ 3/2 ⇔ n ∈ {0,1}`; `2n ≤ 3 ⇔ n ∈ {0,1}`; `B = 1`: `{0,1}` both; `B = 0`: `{0}` both | true |
| §1.2 Check 3 against the rescaling contract (lines 160–162) | `c = 2`, `N = ω_{𝒪(1)}` | exponent and coefficient fixed | `TauCeti/RingTheory/NovikovSeries/Equiv.lean:192`: target period `c • N`, built on `AddEquiv.refl H`; `:196`: `coeff h` unchanged | true; excludes the wrong model `Q ↦ Q²` |
| §1.2 Check 3 against §1.1 Check 3 (line 286) | `𝒪(2)`, bound 3 | classes `0, 1` | `2β ≤ 3 ⇔ β ∈ {0,1}`, the same set as the new Check's | consistent |

The rows for untouched statements stand as in the previous review, of `cb8f1b1`.

- Source locators: the diff adds or changes none; no target of the seeded sample falls in the changed passage (§1.2 Checks).
- Library declarations opened at the pin: 2 — `TauCeti/RingTheory/NovikovSeries/Equiv.lean:192` (`rescaleContinuousAlgEquiv`), `:196` (`coeff_rescaleContinuousAlgEquiv`).
- Cross-roadmap citations: the changed lines contain none; the overlap listing reports no dropped id, no other pull request changing this folder and no second copy on main.
- Gate: the worker's gate at `fcd2977` passes every check, the build included. Dependency check: `depcheck: 249 roadmaps, 2577 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changes outside the folder.
- Elaboration: `lake env lean` on `TauCetiRoadmap/AlgebraicGromovWittenTheory/Suggested.lean` exits 0 with no output; the file is unchanged and declares nothing, so the `#check` comparison and the one-tactic probe do not apply.
- Pull-request text: the title and description agree with this head; the change adds no supplier, section or declaration they would have to state.
- Overlap check: read GromovWittenTheory, StableReduction, AnalyticStableMaps, VirtualFundamentalClass, VirtualFundamentalClassPartII, MotivicStructuresInModuliOfCurves, StableReductionPartII; nothing shared (as in the previous review; the diff adds no object).
- Source independence: changed passages only; 1 added passage (a computed `ℙ¹` Check with no source locator), not set beside a source text in this round, since it cites none and is arithmetic of the roadmap's own; largest share iritani-2008, 10 of 52 locators (previous review); no layer added, removed or reordered, so the arrangement was not compared again.
- Research link: the headline targets are the stable-map virtual class of Behrend 1997 and Behrend–Fantechi 1997, the axioms, splitting and WDVV of Kontsevich–Manin 1994 and 1998, and the quantum `D`-module of Iritani 2008 on which mirror-symmetry statements are built; rests on the README's Summary and References.

## Not verifiable

- Fulton, *Intersection Theory*: not open access; cited in References without a locator.
- Dubrovin 1996 and Behrend–Fantechi: cited in References without a locator, so nothing to check.

## Source issues

- none

## For the human reviewers

- **Licence.** `kock-psi-notes` is an unpublished set of notes read from the author's page (cited in README §§5.1, 6.1–6.2, 6.5); the general-target statements it supports are also cited to Kontsevich–Manin 1998.
- **Licence.** The description discloses that the roadmap and its text were drafted with OpenAI Codex under the author's direction.
