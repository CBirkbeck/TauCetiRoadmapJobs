# Review of GromovWittenTheory (pull request #990 at c3c6033)

**Verdict:** accepted

:robot: Independent AI review, incremental pass: 0 lines changed in the folder since `c3c6033`. This round reads the pull request's title and description, as rewritten since the previous review, against the head. No finding.

## Previous findings

- R01 — repaired: “Validation: `Suggested.lean` declares nothing. None of the four headline theorems … is statable at the pinned Mathlib and Tau Ceti, and the module docstring names what each lacks”. Matches `Suggested.lean:27–50`, `:62–66`.
- R02 — repaired: “Suppliers, as the README's supplier contracts name them: … PseudoholomorphicCurveAnalysis (PH1, PH3.2, PH6.1, PH6.3) and PDE (§1.6) … HamiltonianFloerOperations, on main, is a consumer of Layers G0 and G5–G7.” Matches `README.md:77–138`, `:807`.
- R03 — repaired: “The algebraic theory of smooth projective varieties … is the separate roadmap AlgebraicGromovWittenTheory (#1998), in its own folder; neither roadmap consumes the other.” No open pull request shares this folder.

## Verified sound

### The title and description against the head

- **Title** (“Add Gromov–Witten theory roadmap”): the folder is not on main; the change is 885 insertions, 0 deletions, 0 Lean declarations.
- **Suppliers sentence**: the twelve roadmaps named are exactly the twelve `### From TauCetiRoadmap.*` headings (`README.md:77–136`). AnalyticStableMaps (#987) and ImplicitAtlases (#974) are open, new-roadmap pull requests; the other ten folders exist on main. No contract names MorseNovikov; `README.md:36` identifies `TauCeti.NovikovSeries` with the ring MorseNovikov N1 plans, as the description says.
- **“ImplicitAtlases §7.4 leaves the splitting, divisor, unit and forgetful diagrams to applications”**: §7.4 “Application interface” exists at the head of ImplicitAtlases (`8352e53`) and says application roadmaps construct these inputs; `README.md:26` assigns them to Layers 5–6.
- **Consumer sentence**: HamiltonianFloerOperations on main cites “GromovWittenTheory G0/G5–G7” (its `README.md:17`) and “G7” (`:3`); the labels G0–G8 are in this README's layer headings.
- **Validation paragraph**: four headlines (`Suggested.lean:12–25`); the four missing carriers it lists are those of `Suggested.lean:29–42` and `:48–50`. Gate, dependency check and elaboration results below.
- **Folder-name paragraph**: AlgebraicGromovWittenTheory at `9b70e32` is over a field of characteristic zero, with the numerical Chow ring as state space, and says “The symplectic Gromov–Witten roadmap owns the analytic stable-map theory”; neither README lists the other as a supplier.
- **Summary block and the two prose paragraphs**: each sentence has its counterpart at the head: the unique class defined by the weighted pairing (`README.md:294`), no Čech/singular comparison on the coarse map space (`:298`), the scalar Hodge family and master concordance (`:18`), the forget-compatible collection (`:25`), clutching transfers and Koszul signs (`:19`, `:53`), map-stable versus pointed-stable ranges (`:28`, `:243`), punctured, bordered and Lagrangian theories as possible consumers (`:808`).
- **“Only … `{README.md,Suggested.lean,metadata.toml}` changes, topic `math.SG`”**: the diff outside the folder is empty; `metadata.toml` reads `topic = "math.SG"`.

### Adversarial pass

The diff changes no statement. The rows are for statements the description cites, recomputed this round.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Conventions degree formula against §2.2's degree `r = t − d + s` | `ℂP¹`, `(g,n,A) = (0,3,ℓ)`, three point insertions | Conventions: `6 + 2(0−1)·1 − 2·2 = 0`. §2.2: `d = 2((1)(1−3) + 2 + 3) = 6`, `t = 0`, `s = 6`, `r = 0 − 6 + 6 = 0` | Agree; class in `H⁰(M̄_(0,3))` |
| §7.2, associativity and grading of the quantum product | `ℂP¹`, `H⋆H = q`, `deg q = 2c₁(ℓ) = 4` | `(H⋆H)⋆H = q·H`; `H⋆(H⋆H) = H⋆q = q·H`; degrees `2 + 2 = 4 = deg q` | Correct |
| §8.4, string equation | point target, `⟨τ₀τ₁τ₀τ₀⟩_(0,4)` | left `∫_(M̄_(0,4)) ψ = 1`; right `⟨τ₀³⟩_(0,3) = 1` | Correct |
| §8.4, dilaton equation | point target, `⟨τ₁τ₀³⟩_(0,4)` | left `1`; right `(2g − 2 + n)⟨τ₀³⟩ = (−2 + 3)·1 = 1` | Correct |

The rows for every other statement stand as in the previous review, of `c3c6033`.

### Counts

- **Gate**, rerun at `c3c6033` with `--base origin/main`: every counter `0`, `OK`, exit 0; the worker's run also has `build=0`.
- **Dependency check**: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- **Elaboration**: `lake env lean` on `TauCetiRoadmap/GromovWittenTheory/Suggested.lean` exits 0 with no output. The file declares nothing, so there is no `#check @name` comparison and no padding probe.
- **Pins opened**: Tau Ceti `2fd255d` (the README's heading agrees with `lake-manifest.json`); `NovikovSeries` at `TauCeti/RingTheory/NovikovSeries/Basic.lean:92`, its `gradeBy` at `Grading.lean:92`; `NovikovModule` at `TauCeti/RingTheory/NovikovModule/Basic.lean:53`, its `gradeBy` at `Grading.lean:55`.
- **Cross-roadmap citations**: the worker's resolver lists none unresolved; this round re-resolved ImplicitAtlases §7.4 at `8352e53`, HamiltonianFloerOperations `README.md:3`, `:17` and MorseNovikov `README.md:1534` on main, and AlgebraicGromovWittenTheory at `9b70e32`.
- **Overlaps**: no other open pull request changes this folder; no cited id is dropped; no id is defined only by an open revision.
- **Sources**: the seeded sample (15 targets) lies in unchanged text whose locators the earlier reviews read; no locator was re-read.
- **Headlines**: four, none statable at the pins, each named in the docstring with its missing carrier; unchanged.

Overlap check: read AlgebraicGromovWittenTheory, ImplicitAtlases, HamiltonianFloerOperations, MorseNovikov; nothing shared. AlgebraicGromovWittenTheory owns the Behrend–Fantechi theory on numerical Chow groups of projective varieties and leaves the analytic stable-map theory to the symplectic roadmap.

Source independence: changed passages only; the folder changed by 0 lines, so 0 passages compared; largest share Kontsevich–Manin (the 1994 and 1998 papers together, 26 of 43 source mentions in the layers, as counted in the previous review); contents not compared again, no layer added, removed or reordered.

## Not verifiable

- “Closes #984”: the issue was not read.
- AnalyticStableMaps, ComplexCurveModuli, FukayaTheory (#1045) and HeegaardFloer, also on the closest-roadmap lists, were not re-read for scope this round.
- The generated `depends-on` and `merge-order` blocks are outside this check.

## Source issues

- none

## For the human reviewers

- **Licence.** Kock's *Notes on psi classes* is cited as a “preliminary version of 6 June 2001” from the author's page (`README.md`, References): unpublished notes, used for locators in Layer 8 beside the published Kontsevich–Manin 1998 paper.
- **Not tested.** No source text was re-read this round; the locators of the Kontsevich–Manin papers, Kock's notes and Deligne–Mumford rest on the earlier reviews of `c3c6033`.
