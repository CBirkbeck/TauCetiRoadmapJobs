# Review of PerfectoidQuotients (pull request #1042 at 46c6938)

**Verdict:** accepted

No findings. Incremental re-review of 0 changed lines since `46c6938`; this round read the pull request's title and description against the head.

## Previous findings

- R01 — repaired: the description now reads “This pull request adds the new roadmap `TauCetiRoadmap/PerfectoidQuotients`, with `README.md`, `Suggested.lean` and `metadata.toml`.”

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.3 / `Witt.witt_principal_quotient_p_torsion`, as the description states it | `ξ=p`; `n=0`; `k=0`; `ξ₀` a unit | `coeff 1 (p)=1`, `W(k)/(p)≅k`, `p·x=0`; `x=0 ⇒ p·x=0`; `W(0)=0`; `ξ` unit, quotient `0` | True in each case | None |
| Same, negative control | `ξ=p²`, `k=F_p`, `x=1`, `n=2` | `coeff 1 (p²)=0`, `coeff 2=1`; in `ℤ/p²`: `p²·1=0`, `p·1≠0` | Unit hypothesis on coordinate one excludes it | None |
| Same, without the hypothesis but harmless | `ξ=0` | `W(k)/(0)=W(k)`, `p` a nonzerodivisor: `p^n x=0 ⇒ x=0` | Hypothesis sufficient, not claimed necessary (README:729–730 says so) | None |
| Description: “adds the new roadmap … three files” | Folder at base and head | base: no entry; head: `README.md`, `Suggested.lean`, `metadata.toml`; 32 headings, 1 declaration added, 0 removed | Agrees | None |
| Description: “one headline theorem and no definitions” | `Suggested.lean` | 1 `theorem`, 0 `def`/`abbrev`/`instance`/`structure` | Agrees | None |
| Description: pins “newer than the baseline commits” `6b7abb3c`, `a91d3aaf` | Manifest pins | Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`; both baselines are ancestors of the pins | Agrees | None |
| Description: suppliers and consumers | README names against main and the merge order | On main: PerfectoidSpaces, SchemeAndStackFoundations, EnhancedDerivedSheaves, DerivedModuleAlgebra. Open, earlier in order: DerivedDeRhamCohomology (24), CrystallineCohomology (25); this roadmap 26 | Agrees; consumers named are README:1369–1382 | None |

Rows for statements the diff leaves untouched stand as in the previous review, of `46c6938`.

- Title and description: every sentence of the summary block and the prose was set beside the head (Summary README:3–11, §0.0 route README:405–409, §0.1 generality README:562, Downstream consumers README:1369–1382, How to read the build README:365–372); none is contradicted and no change of the pull request is left unstated.
- Changed passages in the folder: 0; no Lean statement, layer or supplier added, removed or reordered; no seeded section falls in a changed passage.
- Cross-roadmap citations resolved for the description's consumer sentence: PerfectoidQuotientsPartII's README cites this roadmap's §§0.2, 0.3, 0.4, 0.6 (its lines 141, 432, 479, 505, 553, 716).
- Gate: every check passes (all counters 0, including `depcheck`, `outside-folder`, `stray-files`, `readme-ids-missing`); the worker's targeted build passes. Files changed outside the folder: none.
- Dependency output: `depcheck: 245 roadmaps, 2212 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives one warning, `declaration uses sorry` at line 43; the elaborated signature keeps `Fact p.Prime`, `CommRing k`, `CharP k p`, `PerfectRing k p` and agrees with §0.3 item 3.
- Remark (untouched text, as in the previous review): `Suggested.lean:19` and README:369 call the integral-perfectoid predicate absent at the pins; the Tau Ceti pin `2fd255d9` has `TauCeti.Perfectoid.IsIntegralPerfectoid` in `TauCeti/RingTheory/Perfectoid/Integral.lean`.

Overlap check: read PerfectoidQuotientsPartII, PrismaticCohomology, PrismaticCohomologyPartII, PrismaticCohomologyPartIII, PrismaticCohomologyPartIV and PerfectoidSpaces as listed; no folder passage changed, so ownership stands as in the previous review: integral perfectoidness and perfectoidization with PerfectoidSpaces, valuation and descent scopes with PerfectoidQuotientsPartII and PrismaticCohomology; nothing newly shared.

Source independence: changed passages only; 0 passages changed in the folder, so 0 compared with 0 sources; the description reproduces no source passage. Arrangement not compared again: no layer added, removed or reordered.

## Not verifiable

- The description's attribution of AI assistance (which models wrote which parts) cannot be checked from the repository.

## Source issues

- none

## For the human reviewers

- none
