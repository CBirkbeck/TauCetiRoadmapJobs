# Review of ClassFieldTheory (pull request #3177 at 5a08539)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 7 changed lines since `7e8e228`. The change is two sentences added to the *Coefficients* item of 5.1, saying that the cohomology of a discrete `A : GalRep n F` is that of the discrete `ℤ`-module on `A.V`; I checked the cited declaration at the pin, the cited convention at this head, and the finiteness, duality and Euler-characteristic statements the sentences refer to, and found them consistent. Accepted, with no finding, no small correction and one format note, not blocking. Nothing is left for a human to decide.

## N01 — The description says Layer 5 gains "one sentence"; the head adds two

In 5.1 (README lines 673–678) the change adds the sentence on the groups and their cardinalities and a second one beginning "So the finiteness and Euler-characteristic statements below". "ClassFieldTheory Layer 5 gains two sentences" would match.

<details><summary>What was checked</summary>

- **Scope:** the 7 changed lines (README 5.1, *Coefficients*, lines 673–678) and the untouched statements they refer to: finiteness, Tate duality and the Euler characteristic in 5.1 (lines 699–715). No heading, layer or Lean declaration changes.
- **Automatic checks:** all passed at this head. The dependency check reports no problem.
- **Build:** `Suggested.lean` elaborates with `sorry` warnings only.
- **Earlier findings:** the previous report read another pull request (#3170), which also revises this roadmap; it had no finding. Its one small correction and two format notes concern text of that pull request (the Layer 8 Galois connection and its supplier row) that this head does not contain, so they do not apply here.
- **Other open work:** #3170 changes this README in five other places (hunks at lines 43, 1151, 2040, 2069, 2397); none overlaps lines 673–678, and a trial merge of the two heads conflicts only in files outside this folder that this pull request does not change.
- **Not re-checked:** untouched passages the change does not affect, and the uncertified and waived locators elsewhere in the README.

</details>

## Verified sound

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| New: `Hⁱ` of discrete `A : GalRep n F` is `Hⁱ` of `ofDiscreteModule ℤ G_F A.V`, so cardinalities agree (lines 673–676) | declaration at pin; `n = 0`, `n = 1`, `A = 0` | `ofDiscreteModuleRestrictScalarsIntEquiv X n : continuousCohomology n (ofDiscreteModule ℤ G X.V) ≃+ continuousCohomology n X`, needs `[DiscreteTopology X.V]`; `≃+` gives equal `Nat.card`. `n = 1`, `A = 0`: both sides trivial | holds | none |
| New: "`ℤ`-object of a finite smooth discrete `G_F`-module killed by `n`" (lines 677–678) | `n = 0`, `1`, `p`; converse direction | `ZMod n`-module ⇒ `n·A = 0`; `n·M = 0` ⇒ `ZMod n`-module. `n = 0`: `ZMod 0 = ℤ`, no condition, both sides all modules. `n = 1`: zero module both sides | holds both directions | none |
| Cited by the change: `eulerCharacteristic_mixed`, `#H¹ = #H⁰ · #H² · p^{[F:ℚ_p] v_p(#A)}` (line 709) | `A = 𝔽_p` trivial over `ℚ_p`, `p` odd; `p = 2`; `#A` prime to `p` | `p` odd: `#H⁰ = p`, `#H² = #μ_p(ℚ_p) = 1`, `#H¹ = p²`; right side `p·1·p = p²`. `p = 2`: `2·2·2 = 8 = #H¹` (the README's Check). Prime to `p`: exponent 0 | holds | none |
| Cited by the change: rank form `eulerCharacteristic_finrank_fp` read on the `ℤ`-object | same `A`, `p = 2`, `3` | `p = 3`: `2 = 1 + 0 + 1·1`. `p = 2`: `3 = 1 + 1 + 1·1`. Additive maps of `𝔽_p`-spaces are linear, so ranks transfer along `≃+` | consistent | none |
| Locators of 5.1 the new sentence relies on: milne-adt I Thm 2.1, Cor. 2.3 (pp. 26–28), Thm 2.8 (p. 31) | milne-adt lines 1048, 1073, 1138, 1211, 1227–1229 | §2 opens under head "26"; Thm 2.1 on that page; Cor. 2.3 two pages on (28); Thm 2.8 under head "31": `χ(G, M) = (R : mR)⁻¹`, `#M` prime to `char K` | pages as cited; formula agrees with line 709 | none |

- Source locators checked against the text: 3 (milne-adt lines 1073, 1138, 1227, with page heads at lines 1048 and 1211).
- Library declarations opened at the pin: `TauCeti/RepresentationTheory/Homological/ContCohomology/RestrictScalars.lean` lines 632–658 (namespace `TauCeti.ContCohomology`); `.../SmoothDiscrete/Basic.lean` line 223 (`ofDiscreteModule`); `TauCeti/NumberTheory/ClassFieldTheory/MuNRep.lean` line 130 (`GalRep`); `.../FiniteCohomology/Basic.lean` lines 107–121; `.../Local/EulerCharacteristic/Theorem.lean` lines 98–118.
- Cross-roadmap citations resolved: 1, "ProfiniteCohomology Conventions, *Coefficient rings*", at `TauCetiRoadmap/ProfiniteCohomology/README.md` line 109 of this head (added by this pull request; it names the same declaration).
- Overlap check: read ArithmeticGaloisDuality (open, at this head), FilteredLocalGaloisGroups and FunctionFieldArithmetic (main); the change adds no object. The convention it cites is owned by ProfiniteCohomology; ArithmeticGaloisDuality owns the equal-characteristic and global Euler characteristics and consumes the local one of Layer 5, unchanged.
- Dependency check, verbatim: `depcheck: 100 roadmaps, 1139 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ClassFieldTheory/Suggested.lean` gives six ``declaration uses `sorry` `` warnings (lines 81, 97, 130, 145, 156, 170) and nothing else; the file is unchanged from `main`, so no signature was re-compared and no one-tactic probe rerun.
- Changes outside the folder: `git diff --stat` against the base lists only this folder and the three other folders the pull request names.
- Merge-base comparison: 0 headings removed, 0 layers removed or retitled, 0 Lean declarations removed.

Source independence: 1 passage (the two added sentences) compared with 1 source, milne-adt (I §2, Thm 2.1–2.8), none shared; changed passages only. Largest share of locators milne-cft, about 24 of 71 source mentions, as counted in the earlier review; contents not compared, since no layer is added, removed or reordered.

Research link: local and global class field theory in the cohomological form of Artin–Tate (2009) and Milne's notes, with local Tate duality and the local Euler characteristic (Milne 2006; Neukirch–Schmidt–Wingberg 2008), which ArithmeticGaloisDuality and FunctionFieldArithmetic consume; this rests on the README's overview and References.

## Not verifiable

- None for the change.
- The uncertified and waived locators elsewhere in the README (serre-local-fields, neukirch-ant, nsw, artin-tate) are settled in the manifest and untouched by this change.

## Source issues

- none

## For the human reviewers

- none
