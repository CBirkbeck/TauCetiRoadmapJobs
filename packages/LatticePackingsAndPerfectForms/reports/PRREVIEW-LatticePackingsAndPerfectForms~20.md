# Review of LatticePackingsAndPerfectForms (pull request #1723 at 5efad72)

**Verdict:** accepted

Incremental re-review of 0 changed lines since `5efad72`; this round reads the pull request's title and description, as they stand now, against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "perfect/eutactic/extreme forms with Voronoi's theorem, Voronoi's neighbour relation and the perfect-form classifications through rank eight"; "certificates" no longer occurs in it.

## Verified sound

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| Description (repaired clause): "Voronoi's neighbour relation" (4.9, `isPerfect_voronoiNeighbour`, `min_voronoiNeighbour`) | A₂ (min 2), a facet normal N; rank 1 | A₂ is the only perfect class in rank 2: neighbour `A₂ + ρN` is `GL₂(ℤ)`-equivalent to A₂, min 2 = 2; rank 1: no facet normal, both statements hold vacuously | Pass |
| Description (repaired clause): "perfect-form classifications through rank eight" (4.10) | ranks 4–8 | README counts 2, 3, 7, 33, 10916; dsv2007 line 107 (Theorem 1.1): 10916 in rank 8 | Pass |
| Summary block: "Kitaoka's tensor minimum theorem" (7.2, `PosDefForm.min_tensor_kitaoka`) | n = 0; m = 0; n = 1, A = [a]; A₂ ⊗ A₂ | n = 0 or m = 0: C has rank 0, `C.min = 0 = A.min · B.min`; n = 1: `min(aB) = a · min B`; A₂ ⊗ A₂: pure tensor of minimal vectors has norm 2·2 = 4 = min; `hn : n ≤ 43` present | Pass |
| Description: "8 layers (Layers 0–7) and 47 numbered sections" | headings of `README.md` | `## Layer` headings: 8; `### k.n` per layer: 5 + 9 + 3 + 4 + 10 + 7 + 4 + 5 = 47 | Pass |
| Description: "the revisions … which are the ones the branch and main pin" | `lake-manifest.json` at the head and at `origin/main` | both: Tau Ceti `2fd255d997f4`, Mathlib `1b1ccf4b088b`; `README.md:288–289` names the same two | Pass |
| Description: "universality with the 15 and 290 theorems" (6.3, 6.4) | `Suggested.lean:615`, `:619` | `isUniversal_iff_fifteen` carries `hL : L.IsPosDef`; `isHalfUniversal_iff_twoNinety` carries `hL` and `he : L.IsEven`; x² + y² + z² misses 7 ≤ 15, so not universal on both sides | Pass |

The rows of the earlier reviews, of `5efad72`, stand for every statement of the folder: no statement changed.

- Title and description: 14 sentences and bullets read against the head; none contradicted. The title ("roadmap for …") and the file list agree with the change: the folder is not on main; 3 files added, 2854 insertions, no heading or declaration removed; `metadata.toml` has `topic = "math.MG"`.
- Suppliers named in the summary block ("supplied Poisson summation and modularity") resolve to `README.md:303–308` (ThetaSeries Layer 1, Layer 5, Layer 7); the two carriers of the description are `Matrix.PosDef` forms and `TauCeti.IntegralLattice` (`TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63` at the pin).
- Remark, no change asked: the summary block's "using the existing sphere packing formalisation" is read with `README.md:180` ("the migration source named in 4.11"), provenance and not a prerequisite.
- Remark, no change asked: Layer 4's numbering passes from 4.7 to 4.9; no text cites a 4.8.
- Gate at this head (the worker's): every check 0, including `build=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`; OK.
- Dependency check, run this round: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Candidate lines: GeometryOfNumbersAndQuadraticArithmetic 55, ProbabilisticAndMetricNumberTheory 64, WeightsInEtaleCohomology 150, this roadmap 151.
- Elaboration, run this round: `lake env lean` on `Suggested.lean` exits 0 with 53 messages, all `declaration uses sorry`. `git diff --stat origin/main...HEAD` outside the folder: empty. `citations.md`: no unresolved cross-roadmap citation; the 12 Lean-name leads are 5 dotted names `Suggested.lean` declares and 7 LMFDB knowl ids.
- Overlap check: read IntegralLattices, GeometryOfNumbersAndQuadraticArithmetic, OrthogonalTamagawaAndLatticeMass, ThetaSeries, SuccessiveMinima, Rank24LatticeConstructions as compared in the earlier rounds; nothing shared (the folder did not change; `overlaps.md` lists no pull request changing this roadmap, no dropped or revision-only id, and no roadmap close in results or headings).
- Source independence: changed passages only; the folder changed by 0 lines, so 0 passages compared with 0 sources; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts": a statement about other pull requests, outside what this review reads.
- Conway–Sloane, *SPLAG*, Ch. 23 and Ch. 25: paywalled, cited by locator, as in the earlier reports.
- The LMFDB record `3.4.8.1.2` for `A₃`: only the label prefix was checked, as in the earlier reports.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md:180` names `math-inc/Sphere-Packing-Lean` as "the migration source named in 4.11", and `README.md:2141` lists it under References; its licence was not read. `Suggested.lean` states only `hermiteConstant_twentyFour` from 4.11.
