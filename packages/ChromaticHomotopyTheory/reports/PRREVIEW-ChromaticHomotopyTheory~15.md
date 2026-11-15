# Review of ChromaticHomotopyTheory (pull request #1643 at 815443c)

**Verdict:** accepted

Incremental re-review of 0 changed lines in the folder since 8ecccd2. This round checks the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: the summary block now reads "deducing the sharp bound m=n+1 in periodic vanishing and the weak-ring height criterion"; the ko→KO clause is gone and the real Bott comparison is listed as "owned by GeneralAlgebraicKTheoryPartII".
- R02 — repaired: "GeneralAlgebraicKTheoryPartII supplies this roadmap, not the reverse. From it Layers 0–5 consume periodic homotopy groups (§4.2), ring acyclicity (§4.4) …"; the list equals `TauCetiRoadmap/ChromaticHomotopyTheory/README.md:129` and README:449.
- R03 — repaired: "`Suggested.lean` declares nothing: its docstring names the six headline theorems (§§3.1, 4.1, 4.2, 4.3, 4.4, 5.1) as not statable at the pins"; "the targeted Lake build succeeds with no Lean diagnostic on the file".
- R04 — repaired: "Mathlib's `FormalGroup` and Tau Ceti's `WeierstrassCurve.formalGroup` carry the formal laws".

No repair introduced a new problem.

## Verified sound

The diff changes no statement; the rows are for statements the description cites.

| Statement | Instances | Values on each side | Result / change |
| --- | --- | --- | --- |
| §4.1, π₀((KU_p^∧)^tC_p)=ℚ_p(ζ_p) (description, summary block; README:333–335) | p=2; p=3 | p=2: ((1+z)²−1)/z=z+2, so z=−2 inverted gives ℤ₂[1/2]=ℚ₂=ℚ₂(ζ₂). p=3: z²+3z+3 Eisenstein, norm of z is 3, so ℤ₃[ζ₃][1/z]=ℚ₃(ζ₃) | Pass |
| §4.2, Σ∞₊f a T(n)-equivalence for π-finite n-connected fibers (description; README:355) | n=0, A=BG; n=1, fiber BC_p (0- but not 1-connected) | n=0: H_*(BG;ℚ)=ℚ, equivalence. n=1, BC_p: K(1)_*BC_p has rank p≠1, not an equivalence, and the hypothesis excludes it | Pass |
| §5.1, TMF[1/N]→TMF(N) faithful GL₂(ℤ/N)-Galois for every N≥1 (description; README:455) | N=1; N=2 | N=1: trivial group, identity map. N=2: group of order 6, non-abelian, cover a stack; description says "Levels 1 and 2 stay stacks", README:455 "N=1,2 retain their automorphisms" | Pass |
| Description's list of sections consumed from GeneralAlgebraicKTheoryPartII | every citation of that roadmap in README:139–496 | Description: §§4.2, 4.4, 4.5, 4.14, 4.15–4.16, 4.20, 4.22, 4.24. README layers: §§4.2, 4.4, 4.14, 4.15, 4.16, 4.20, 4.22, 4.24, and 4.5 in README:449; no §§4.10–4.12, 4.25–4.33 | Pass |
| Description's list of the other suppliers | the `### From TauCetiRoadmap.*` headings, README:75–127 | Ten named on each side: GeneralizedCohomology, BordismFormalGroups, EnhancedDerivedSheaves, StableHomotopyKTheory, AlgebraicTopology, DGFloer, EllipticCohomology, ModularCurves, RefinedTraceMethods, StableHomotopyKTheoryPartII | Pass |

Rows for every other statement stand as in the previous review, of 8ecccd2.

- Description sentences checked against the head: every sentence of the summary block and of the four prose paragraphs (the layers, the supply direction, `Suggested.lean`, the validation line); none is contradicted. The description states that the pull request adds the folder (README, `Suggested.lean`, `metadata.toml`), which is what the head shows: 569 insertions, 34 headings added, 0 Lean declarations.
- Cross-roadmap citations resolved at the supplier's open head (GeneralAlgebraicKTheoryPartII, b519c2f): headings 4.2, 4.4, 4.5, 4.14, 4.15, 4.16, 4.20, 4.22, 4.24 and 4.30a exist (README:682, 722, 738, 912, 929, 945, 1009, 1044, 1082, 1208); §4.20 states the equality of the Bousfield classes of T(1) and K(1) at README:1011.
- Source locators: none added or changed; the seeded sample (§§3.1, 4.1–4.4, 5.1) falls in no changed passage.
- Gate at 815443c: every counter 0, `build=0`, `OK`.
- Dependency check, in full: `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ChromaticHomotopyTheory/Suggested.lean`, exit 0, no output; the file has no declaration, so no `#check @name` comparison and no one-tactic probe apply.
- Outside the folder: the diff against `origin/main` is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Overlap check: read GeneralAlgebraicKTheoryPartII, BordismFormalGroups, EllipticCohomology (ownership as stated at README:7–11 and at the supplier's head for the sections above); the folder did not change; nothing shared.
- Source independence: 0 passages compared with 0 sources (changed passages only: the folder has no changed passage); largest share and contents not compared again, the diff adds, removes and reorders no layer.

## Not verifiable

- HL13, Proposition 3.4.3, behind csy Lemma 5.1.7, is not in the source cache (unchanged).
- Ravenel–Wilson, Theorem 9.2, read only through csy line 3655 (unchanged).
- The description's sentence on AI assistance (the number of review and red-team rounds) was not checked.

## Source issues

- none

## For the human reviewers

- none
