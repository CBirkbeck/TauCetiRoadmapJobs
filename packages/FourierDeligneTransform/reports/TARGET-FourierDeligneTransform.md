# Triage report: TARGET-FourierDeligneTransform

**Verdict:** `design`, name `FourierDeligneTransform`, no base. The deliverable is `packages/FourierDeligneTransform/target.md` and the manifest is `packages/FourierDeligneTransform/sources.toml`.

## What was searched

- **Board, for consolidation.** I compared all 38 open targets and designs listed in the brief by mathematical object. None concerns étale sheaves, character sheaves, kernel transforms or the ℓ-adic Fourier transform. The closest, DESIGN-GaloisActionOnEtaleCohomology, is about Galois actions on the cohomology of geometric fibres and shares only a supplier. So there is no merge. The board's package index lists three packages under review, none related.
- **Roadmaps.** On main and at the 458 open roadmap heads, I ran `roadmaps grep` for: Fourier–Deligne, Laumon, Fourier near sheaf, perverse and Artin–Schreier vocabulary, Lang isogeny and torsor, kernel transforms, trace functions and Weil complexes. Hits that were examined:
  - CohomologicalPointCounting (#196) excludes Fourier–Deligne transforms from its scope.
  - ClassicalAdicEtaleCohomology (#875) mentions only a future general-base item.
  - SheafConvolutionOnAbelianVarieties (#1809) owns a Fourier–Mellin and a D-module Fourier–Mukai transform, not the ℓ-adic one.
  - CharacterSumsOverFiniteFields (#1712) explicitly owns no sheaf.
  - CongruenceSpectralGap (#1504) §4.2b consumes an Artin–Schreier sheaf contract it attributes to DeligneWeightsAndPurity. DeligneWeightsAndPurity (#929) does not contain one.
  - EtaleCohomologyFoundations, as revised in #1891, assigns kernel transforms, Artin–Schreier and Kummer sheaves and the transform to a consumer named FourierDeligneTransform. It keeps the torsor-and-character construction in its §F.0.3.
- **Libraries.** Pinned Tau Ceti has Artin–Schreier field theory (function fields, places, differents) but no sheaves. Pinned Mathlib has `AddChar`, finite abelian Fourier analysis and `ZMod` Fourier analysis, but no étale transform.
- **Supplier READMEs, read at their heads.**
  - EtaleCohomologyFoundations on main and at #1891: §§0.7–0.8, F.0.3, F.2.4–F.2.7, F.3, F.5, F.8 and F.10.
  - DeligneWeightsAndPurity #929: scope, Layers 5–6 and the section list.
  - EtaleDualityAndPerverseSheaves #1040: scope and §2.7.
  - DeligneWeightsAndPurityPartII #1760: scope.
  - LefschetzPencilsAndVanishingCycles #873: layer list.
  - InverseGaloisAndArithmeticFundamentalGroups #850: §§IG.0.T2–IG.0.T3.
  - CongruenceSpectralGap #1504: §4.2b.
  - CharacterSumsOverFiniteFields #1712: scope.
  - ReductiveGroupsPartII on main: §RG2.3.7, Lang's theorem.
  - AlgebraicVectorBundles on main: §L2B, geometric vector bundles.
- **Merge order** (`merge-order/ORDER.txt`):

  | Roadmap | Line |
  | --- | --- |
  | ArithmeticGaloisRepresentations | 42 |
  | InverseGaloisAndArithmeticFundamentalGroups | 44 |
  | LefschetzPencilsAndVanishingCycles | 52 |
  | DeligneWeightsAndPurity | 78 |
  | EtaleDualityAndPerverseSheaves | 96 |
  | CongruenceSpectralGap | 146 |
  | CharacterSumsOverFiniteFields | 147 |
  | SpringerResolutionAndCharacteristicCycles | 250 |
  | SheafConvolutionOnAbelianVarieties | 302 |

  FourierDeligneTransform is not yet in the file.
- **Design issue TauCetiRoadmap#1888**, read with `gh issue view` and treated as data. It records the maintainer's route decision (Weil II via Laumon's transform) and recommends a new roadmap of this name.
- **`roadmaps resolve`** on the written `target.md` finds no unresolved cross-roadmap citation.

## Why `design`, and the main judgement

Nothing owns the transform, so the verdict is a new roadmap rather than a duplicate or a Part II. The filed target extends no single roadmap in its own direction.

The filed scope cannot stand as written. It consumes DeligneWeightsAndPurity §§0 and 5 and supplies DeligneWeightsAndPurity §§6–7, which is a cycle at roadmap granularity. The curve estimate it calls "Laumon's theorem" is already planned as DeligneWeightsAndPurity §6.5. I broke the cycle by moving the weight half (ι-purity of the transform on the line and the curve estimate) into DeligneWeightsAndPurity Layer 6. That is where #1888 itself says Laumon's argument goes. This roadmap keeps every weight-free statement and is ordered after LefschetzPencilsAndVanishingCycles and before DeligneWeightsAndPurity.

Reading LAU87 §4.4, KATZ01 Lecture IV and LAU87 (1.3.2.3) showed a further dependency. The Fourier proofs of the estimate use perverse `t`-exactness on the line, which rests on BBD 4.1.1, 4.1.2 and 4.2.5. Those are owned today by EtaleDualityAndPerverseSheaves §2.7, which sits after DeligneWeightsAndPurity. `target.md` Risk 1 recommends moving those theorems into EtaleCohomologyFoundations §F.8 and gives two fallbacks. That choice is the maintainers'.

## Corrections made to the filed statement

- The base is any scheme over `𝔽_p` (the kernel needs `𝔾_{a,𝔽_p}`). Kernel transforms keep a general base, now between arbitrary compactifiable schemes rather than vector bundles only.
- Character sheaves need `G` smooth and connected.
- Torsion coefficients need a nondegenerate `ψ`.
- Inversion is `FT^{E^∨} ∘ FT^E ≅ [−1]^*(−r)`, with no `[−2r]`.
- Weight 0 of character sheaves is stated weight-free.
- Locators corrected:
  - Laumon's Weil II proof is LAU87 §4, not §3.
  - Katz–Laumon's title is "Transformation de Fourier …", pp. 145–202.
  - Brylinski's chapter is Ch. IX.
  - LAU96 is a coherent D-module transform and is cited only as a boundary.
- Local Fourier transforms are defined here and computed in the tame case. The stationary-phase theorem, the product formula, relative perversity and the weight theorems of KL85 (2.2.1) go to a continuation ordered after DeligneWeightsAndPurity.

## Sources

Fetched through the sources service:

| Key | Access | Status |
| --- | --- | --- |
| LAU87, KL85, WII, BRY86 | Numdam | certified |
| LAU96 | arXiv | certified |
| KATZ01, ESDE | author's page | certified |
| SGA45-ST, KW01 | paywalled | uncertified, cited by locator only |

Every final target has an open locator. No text is missing, so the job has no `needs-references.toml`. Two failed first attempts (a wrong DOI for KATZ01, a title-only citation for SGA45-ST) wrote stale `[[missing]]` entries. Both works were then settled, so I deleted that file. The manifest passes `sources check` with no problems.

## Untrusted text

Nothing in the fetched papers, pull-request READMEs or issue #1888 asked for an action outside this job. The issue's execution plan (per-roadmap edit units, phases) was read as planning data only. No command, credential or service request was acted on.

## Not done

- No Lean was written or elaborated. This job writes no `Suggested.lean`.
- The ownership moves in Risks 1, 4 and 5 are recommendations for other roadmaps' owners. This job made no edits outside its package.
