# Review of SelmerIwasawaCohomology (pull request #869 at ebadda3)

**Verdict:** needs changes

## R01 (P3) — Name the Kummer existence statement as such

**Location:** `TauCetiRoadmap/SelmerIwasawaCohomology/Suggested.lean:73–75`, `theorem padicKummer_equiv` concludes `Nonempty` of a linear equivalence.
**Claim:** The theorem name violates the gate's naming rule for existence of an isomorphism.
**Witness:** Both the supplied gate and the fresh gate report `statement-hygiene=1` at line 74; the name lacks the required `nonempty_` prefix.
**Repair:** Keep this existence corollary as `nonempty_padicKummer_equiv`, updating its reference in `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:224`. Alternatively, state the canonical map with its isomorphism property. The naming-only repair preserves the computed Kummer instance below.

## R02 (P3) — State that the PR adds a new roadmap

**Location:** PR description, `scratch/pull-request.md:26`: “Roadmap folder `TauCetiRoadmap/SelmerIwasawaCohomology`”.
**Claim:** Neither the title nor the description identifies whether the PR adds a roadmap or revises one on main.
**Witness:** `origin/main` has no such folder; the base diff adds 2,892 lines across three files and 17 Lean declarations, with no deletions (`scratch/pull-request.md:52–58`).
**Repair:** Begin that paragraph: “This pull request adds the new roadmap `TauCetiRoadmap/SelmerIwasawaCohomology`, comprising `README.md`, `Suggested.lean` and `metadata.toml`.”

## R03 (P3) — Correct the dependency paragraph

**Location:** PR description, `scratch/pull-request.md:28`: “Roadmaps already on main that the README cites (SchemeAndStackFoundations, PadicMeasuresIwasawaAlgebras, AdicSpacesPartII, RigidAnalyticGeometry and the older roadmaps)”; “consumers of this roadmap are listed in the merge-order block”.
**Claim:** The prose names two uncited suppliers and directs readers to a predecessor-only block for consumers.
**Witness:** The README has zero occurrences of `AdicSpacesPartII` or `RigidAnalyticGeometry`. Its consumers are at lines 2615–2621; the description's `merge-order` block ends at this PR and names none of those consumers.
**Repair:** Replace the paragraph with: “Dependencies are cited in the README by roadmap name and section; the Lean imports none of those roadmaps. The task list and merge-order block identify open predecessors. Main-branch suppliers include SchemeAndStackFoundations and PadicMeasuresIwasawaAlgebras. Downstream consumers are listed in the README's ‘Downstream consumers’ section.”

## Previous findings

- R01 — repaired: `README.md:1358–1360` now requires continuous addition and finite index for every open normal subgroup, exactly the hypotheses of the pinned `continuous_map`; profinite groups satisfy the added condition.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| §3.0 continuity hypothesis | `Γ=ℤ₃`, `U=3ⁿℤ₃`, `n=0,1,2`; discrete `ℤ`, `U=0` | Quotient sizes `1,3,9`; index `∞` for discrete `ℤ/0`. | Profinite instances included; discrete counter-instance excluded. |
| §3.0 involution and §3.2 inverse action | `γ=1+X`, modulo `X³`; modulo `(3,X²)` | `ι(X)=−X+X²`; `ι²(X)=X`; inverse units `1+ε`, `1−ε` differ by `2ε`. | Added hypothesis preserves both conventions. |
| §3.0 finite-group and zero-rank case | `d=0`, `Δ=C₃=⟨g⟩`; `Δ=1` | `ι(g)=g²`, `ι²(g)=g⁴=g`; trivial group gives `ι(1)=1`. | Matches supplied sharp involution. |
| §3.0 character twist | `κ(γ)=4` over `ℤ₃` | `ι Tw_κ ι(γ)=γ/4=Tw_{κ⁻¹}(γ)`; `Tw_κ(X)=3+4X`. | Distinct from generator substitution, whose constant term is `0`. |
| §0.8 Kummer existence, R01 | `K=𝔽₇`, `p=3` | `H¹=ℤ₃/(7−1)ℤ₃≅ℤ/3`; each power quotient of `C₆` is `C₃`; limit `C₃`. | Both sides have order `3`; naming repair leaves statement intact. |

Untouched statement rows stand as in the previous review of `3f518a0`.

- 1 changed passage checked against 5 pinned declarations: `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Map.lean:149,157,171,195,205`; §3.0 is the seeded target intersecting the diff.
- 4 relevant supplier citations resolved: ProfiniteProPGroups Layer 9; PadicMeasuresIwasawaAlgebras §§1.7, 4.4, 6.1. No external-source locator changed.
- 17 elaborated `#check @name` signatures inspected; no binder changes, including Kummer's `NeZero`, integral lifting's finite/free hypotheses, and both Gamma theorems' finite dimension.
- 1 targeted build, 1 direct elaboration and the naming-repair probe passed; each reports only the 6 expected `sorry` warnings.
- Gate: FAIL solely on `statement-hygiene=1` (R01); all other reported counters zero. Dependency output: `depcheck: 245 roadmaps, 2219 edges, 0 problem(s)`.
- 1 title and the description's prose, including `roadmap-summary`, checked against the base diff and head; 0 changed files outside the folder; checkout clean.

Overlap check: read ArithmeticGaloisDuality (continuous cochains and duality), EulerSystemsAndKolyvaginSystems (system carriers and bounds), NoncommutativeAndEquivariantIwasawa (lattice Selmer fibres and noncommutative algebra), ModularIwasawaMainConjectures and ModularIwasawaMainConjecturesPartII (modular and CM applications), PadicMeasuresIwasawaAlgebras (measure comparison, one-variable algebra and sharp involution), ProfiniteCohomology (discrete cohomology), and ProfiniteProPGroups (completed-group-algebra interface). The changed clause consumes Tau Ceti's existing map; it introduces no second owner. Supplied overlap data lists no conflicting head or dropped citation.

Source independence: changed passages only; 1 passage compared with 1 pinned library source, with no copied exposition or reused material. Largest share among changed source-bearing passages: Tau Ceti, 1 of 1. No external-source locator or layer arrangement changed; the contents comparison is not reopened.

## Not verifiable

- none within the changed passage; external-source locators outside the diff were not reopened in this incremental review.

## Source issues

- none

## For the human reviewers

- none
