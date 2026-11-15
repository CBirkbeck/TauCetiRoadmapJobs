# Review of AmenableTracesOnCStarAlgebras (pull request #2260 at aa781fb)

**Verdict:** accepted

No findings. This is an incremental re-review of 0 changed lines since `aa781fb`; the round checks the pull request's title and description against the head.

## Previous findings

- none: the previous review of `aa781fb` accepted with no finding of its own, and its three carried bullets (R01–R03) were all recorded as repaired at this same head.

## Verified sound

| Statement | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| §8.5 `subalgebra_isAF_simple` (cited by the description's "final layer" sentence) | `M₃` as a corner of `M₄ ⊆ CAR`; `A = 0`; `B = ℂ ⊕ ℂ`, `ι = id`, `τ_B = pr₁` | `c = ‖τ_CAR∘ι‖ = 3/4`, `c⁻¹·(3/4)tr₃ = tr₃`, value at `1` is `1`; `A = 0`: every functional has norm `0 ≠ 1`, excluded by `[Nontrivial A]`; `pr₁(0,1) = 0` on a nonzero positive, excluded by simplicity | Hypotheses `A ≠ 0` and simple are both in the Lean signature and both needed | none |
| §5.1 `IsNuclearMap` (cited by the description's "positive-scaling" sentence) | `θ = 2·id_ℂ`; `θ = −id_ℂ` | `C = 2, n = 1, α = β = id`: error `0`; for `−id`, `C·β(α(1)) ≥ 0` so error at `1` is at least `1` | Scale `C` is quantified before `F, ε` (`Suggested.lean:315–321`), as the description says | none |

The rows for all other statements stand as in the previous review, of `aa781fb`.

- Pull request text, read sentence by sentence against the head: 0 contradicted, 0 unstated changes. Checked: adds a new folder (not on main; 2921 insertions, README 2363 lines, `Suggested.lean` 557, `metadata.toml` 1); eight layers (`README.md:501–2148`); 46 declarations, of which 23 admitted theorems; the two non-statable headlines named in the docstring (`Suggested.lean:50–56`); no standing unitality or separability hypothesis (`README.md:138–140`); V0/V3 import of the matrix-trace state and uniqueness (`README.md:395–409`); `2·id_ℂ` nuclear (`README.md:1637`); the six suppliers are exactly the six `### From TauCetiRoadmap.*` headings (`README.md:353–480`); the consumers named are Part II roadmaps (`README.md:2314–2334`).
- Supplier citations named by the description resolved on main (`4d169a9`): CStarAlgebras C6.1 (`README.md:1272`) and C7.1 (`:1455`), VonNeumannAlgebras normalized trace (`:651`), CStarClassification §2.1, §3.4, §3.5 (`:351, :587, :616`), OperatorAlgebraDynamics D2.FreeGroups (`:1648`), FactorRigidity §2.2 (`:217`), BanachSpaceTheory B1 (`:54`). All six folders are on main; "Depends on: none" holds.
- Gate, run again on this head: every check `0`, `OK`. Worker's gate including the targeted build: passed.
- Dependency check output: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean` at the pins: exactly 23 `declaration uses sorry` warnings, no other warning or error. Imports are `Mathlib` and three `TauCeti.*` modules; no `set_option`.
- Changes outside the folder: none (`git diff --stat origin/main...HEAD` outside the folder is empty).
- Seeded sample: no sampled section lies in a changed passage (the folder diff is empty), so no locator was re-read this round; the locator checks of the previous reviews stand.
- Padding probe and `#check @name` signature comparison: not repeated, no declaration changed; they stand from the previous reviews.

Overlap check: read the scope of VonNeumannAlgebras (main and its open revision), CStarAlgebras, CStarClassification, CompactQuantumMetricSpaces, QuantumFoundations, BanachSpaceTheory and NoncompactQuantumSymmetry as listed by the overlap tool; no open pull request changes this folder, drops an id it cites, or defines an id it cites. Owners unchanged from the previous review: matrix-trace state, GNS and injectivity — VonNeumannAlgebras; nuclear maps, completely positive maps, tensor products, exactness — CStarAlgebras; AF and UHF — CStarClassification; convex closure — BanachSpaceTheory; amenable, quasidiagonal and uniform amenable traces — this roadmap.

Source independence: changed passages only; 0 passages changed, so 0 compared this round; largest share brown2006, 77 of 101 locators; no layer added, removed or reordered, so the arrangement comparison of the earlier review (independent) stands.

## Not verifiable

- brown-ozawa2008, Chapter 6: settled waiver; text not read.
- connes1976, Theorem 5.1: settled waiver; text not read.
- paulsen2002, Chapter 3: settled waiver; text not read.
- pedersen2018, Chapter 3: settled waiver; text not read.
- kirchberg1993, Theorem 7.5 and Proposition 7.1: settled uncertified; only the secondary record at brown2006 lines 1910–1917 was available.
- The description's "AI assistance" sentence: not checkable from the repository.

## Source issues

- none

## For the human reviewers

- Five cited texts (brown-ozawa2008, connes1976, paulsen2002, pedersen2018, kirchberg1993) are settled as waived or uncertified; wording was never compared against them. The largest source, brown2006, is readable and its contents were compared in an earlier review.
