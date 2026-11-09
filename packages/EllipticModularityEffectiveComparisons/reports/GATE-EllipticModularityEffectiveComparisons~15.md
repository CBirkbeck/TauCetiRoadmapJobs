# GATE-EllipticModularityEffectiveComparisons~15: answers to the human review of `c90f56d`

This answers one review: CBirkbeck, 2026-11-09T22:35:48Z, the incremental re-review of `c90f56d`. It makes four points, numbered H01–H04:
- H01 is its one finding, F01. Its "Previous findings" entry R01 restates F01.
- H02–H04 are its three "Remarks, not findings", in order.

The "Not verifiable" entry (the Kenku texts, settled as uncertified) asks for nothing, and "Source issues" is "none". The review was read as data. It contains no instruction beyond its findings, and nothing suspicious was found in it or in any other file read.

No file changed and nothing was committed. The head stays `c90f56d2`. The reasons are under H01 and H02.

## H01 (CBirkbeck) — answered

The finding is correct, and no edit inside this folder repairs it. Trimming this folder so that it imports EllipticCurveModularityPartII would leave only two kinds of content:
- finer proof steps of the sibling's own targets: Martin §§0.3–0.15, Mazur §§4.1–4.6, Kenku §§4.8–4.15 and the split-Cartan chain §§5.3b–5.7;
- the four exceptional j-values of §5.1.

Kept here as targets, the proof steps would either plan the sibling's proofs a second time or make the sibling's proofs depend on a roadmap later in the order. What survives the trim is therefore not a roadmap. It is option 1 of the review without moving that content into the sibling, so the choice between the review's two options stays with a human.

**What changed since the review.** The sibling's head is no longer `504db2f`. It moved to `9d8c599` (commit time 2026-11-09 22:35:22 UTC, 26 seconds before the review was posted). The finding still holds there, with wider overlap:
- **Line numbers.** The review's sibling lines 198, 206, 219 and 257 are now lines 233 (`NonCM`), 241 (`HasCyclicIsogeny`), 254 (`noncm_prime_isogeny_degrees`) and 307 (`rational_isogeny_j_tables`). Here they are lines 215, 158, 252 and 286.
- **Bodies at `9d8c599`.** After renaming (`HasCyclicIsogeny`→`CyclicIsogenyDegree`, `NonCM`→`GeometricallyNonCM`, bound variable p→r), the declaration text is identical for 13 pairs:
  - `localTerms`, `martinValue` and `newDimension`;
  - `martin_dimension_formula`/`dimension_comparison` and `martin_sharp_bound`/`martin_bound`;
  - `GeometricTorsion`, `torsionModule` and `torsionRepresentation`;
  - the two predicates;
  - `prime_cyclic_isogeny_degrees`/`prime_isogeny_degrees`;
  - `non_cm_prime_isogeny_degrees`/`noncm_prime_isogeny_degrees`;
  - `isogeny_j_tables_11_17_37`/`rational_isogeny_j_tables`.

  `lemos_uniform_surjectivity` and `lemos_surjectivity` differ only in `(hp : p.Prime)` against `[Fact p.Prime]`.
- **New in the sibling's commit.** It adds to the sibling's `Suggested.lean`:
  - `sharpF`, `sharpG` and `sharpH`;
  - `deletionLevel` and `removed_prime_bound`;
  - `deletion_level_realization` (its new README §3.4) and `deletion_level_full_two_realization` (its new §5.6).

  These are realization theorems at the deletion level M₀ with no Serre-weight hypothesis, which this folder does not plan. Under option 2, §§3.4 and 5.6 and these seven declarations join the review's list of content only the sibling has. All of them need the conductor at Tau Ceti `2fd255d`, which the sibling's branch pins and this branch does not (`358314d`, see H02).

**Facts for the decision.** All checked this round:
- In the merge order the sibling is on line 275 and this folder on line 285.
- The sibling's README line 7 says it owns the six comparison layers.
- Three roadmaps name this folder, each only in a consumer list and none citing a section of it: ModularSymbolsPadicLFunctions README line 2695, FaltingsFinitenessAndIsogenyTheorems line 2928 and ImaginaryQuadraticClassNumber line 205.
- Sixteen other roadmaps name the sibling. Three of them are by other authors:
  - AdelicImagesAndModularCurves cites §5.0a at README line 343 and the sibling's Lean names `prime_isogeny_degrees` and `cyclic_isogeny_degrees` at `Suggested.lean` line 407;
  - EllipticCurvePeriodsAndModularParametrizations cites §§5.0a–5.0b at README lines 92, 305 and 1858–1912;
  - GroupSchemesOverABase cites §6.0f at README line 1427.
- ErdosProgressionPowers (head `3e1048c`) consumes EC.0–EC.6 from the sibling at its README lines 651–662.

## H02 (CBirkbeck) — answered

The docstring sentence that the removed-prime exponent bound and Kraus's two realization theorems are not statable is correct for the Tau Ceti this branch builds against, and false at main's pin:
- **This branch.** `lake-manifest.json` pins Tau Ceti `358314d`, which has no `TauCeti/AlgebraicGeometry/EllipticCurve/TateAlgorithm` directory and no elliptic conductor. Its conductors are those of characters, orders and newforms only.
- **Main.** Main pins Tau Ceti `2fd255d`, which has `WeierstrassCurve.algorithmicConductor` (`TauCeti/AlgebraicGeometry/EllipticCurve/TateAlgorithm/Reduction/Conductor.lean` line 103).

Held to main's pins, which this job's library checks use, the headline is statable and absent. Adding it needs that import, and the import fails the targeted build until the branch's manifest moves to main. The manifest is outside this job, so the docstring is unchanged.

After a rebase, the statements under option 2 are the sibling's `deletionLevel`, `removed_prime_bound` and the two deletion-level realizations. GATE~14's prepared `deletionLevel` takes a product over q of 1 or q^(v_q M). It agrees with the sibling's quotient M/∏q on all seven instances computed (table below). Under option 1 the point is moot.

## H03 (CBirkbeck) — answered

The pull-request description is outside this job's files. `Suggested.lean` is unchanged since `b26ab9f`, so the description should say:
- 17 theorems, the `sorry` warnings at lines 83, 88, 97, 108, 122, 139, 186, 192, 198, 205, 243, 252, 259, 267, 277, 286 and 298, not "fourteen";
- 10 definitions (7 `def`, 2 `abbrev`, 1 `instance`), not "nine".

## H04 (CBirkbeck) — answered

`design/plan.json` is in the board package, outside this folder. It contains `all-embedding-frobenius` once, while README.md and Suggested.lean contain it 0 times. The README uses exactly seven gap slugs: chen-winding-comparison (3 occurrences), mixed-cusp-charts (5), modular-rank-zero (22), optimized-elliptic-weight-two (9), positive-characteristic-support (4), quantitative-abelian-periods (4) and weight-two-local-reduction (4). The intake drops that plan entry.

## Build, gate and dependency check

- **Build** at `c90f56d2` (clean tree): `lake build TauCetiRoadmap.EllipticModularityEffectiveComparisons.Suggested` exits 0 with "Build completed successfully (9205 jobs)". The only warnings are the 17 "declaration uses `sorry`" warnings at the lines listed under H03.
- **Gate** at `c90f56d2`:

      gate EllipticModularityEffectiveComparisons: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

- **Dependency check** (`--depcheck … --movable`, board order, content checkout, `--pr 1810`):

      depcheck: 235 roadmaps, 2266 edges, 0 problem(s)

  It prints no UPWARD, CYCLE or `moved:` line.

## Lean signatures

The `#check @name` pass was run. A `#check @TauCetiRoadmap.EllipticModularityEffectiveComparisons.<name>` line for each of the 27 declarations was appended temporarily to `Suggested.lean`, built once (exit 0, 27 info messages, no error), and the file was restored byte-for-byte before the clean build and the gate.

Every elaborated type is identical, up to whitespace, to the one in the worker's `signatures.md`, so no section binder is lost. The file has no `variable`, `include` or `set_option`. Each type was compared with its README statement in earlier rounds, and neither file changed since then. Nothing changed.

## Ownership, citations and sources

- **Ownership.** No object or citation was added. Ownership against the open pull requests was checked for F01's objects:
  - the sibling at its head `9d8c599`;
  - ErdosProgressionPowers at `3e1048c`;
  - AdelicImagesAndModularCurves, EllipticCurvePeriodsAndModularParametrizations and GroupSchemesOverABase by `roadmaps grep`.

  `overlaps.md` lists no open pull request changing this roadmap, no dropped id and no revision-only id.
- **Citations.** README line 1707's counterpart list was re-read against the sibling's headings at `9d8c599`. Every section it names still exists there: §1.8 "Sharp thresholds and numerical majorants", §§5.0a–5.0b, 6.0b and 6.0f. ErdosProgressionPowers's EC.0–EC.6 table, at its lines 656–662, is unchanged in what line 1707 asserts.
- **Sources.** No new source. `needs-references.toml` was not written.

## Adversarial pass

No statement was added or changed. The rows below are the computations behind the answers.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| H01: same headline bodies here and in the sibling at `9d8c599` | the 14 declaration pairs listed under H01, after the renaming map | 13 pairs identical as normalized text; the Lemos pair differs only in `hp : p.Prime` against `[Fact p.Prime]`, which is the same hypothesis | duplicate stands | none (decision) |
| H01: the j-table statements give the same values | degrees 11, 17 and 37 in both files | 11: −24729001, −32768, −121; 17: −297756989/2, −882216989/131072; 37: −162677523113838677, −9317, the same literals in both | identical | none |
| H01: content only here, §5.1 | γ = 96, 960, 5280, 640320 | −γ³ = −884736, −884736000, −147197952000, −262537412640768000; the strings 884736, 5280 and 640320 occur 0 times in the sibling's README at `9d8c599` | only here | none (decision) |
| H01: prime-degree lists | the non-CM list against the CM-inclusive list | {2,3,5,7,11,13,17,37} in both files; {2,…,17,19,37,43,67,163} in both; r=19 lies in the second and not the first, so `hCM` is needed in both | identical | none |
| H02: docstring "not statable" | Tau Ceti `358314d` (branch) and `2fd255d` (main, the sibling's pin) | elliptic conductor absent at `358314d` (no `TateAlgorithm` directory); `algorithmicConductor` at line 103 of `Reduction/Conductor.lean` at `2fd255d` | true at the branch pin, false at main's | none (manifest outside job) |
| H02: prepared `deletionLevel` (product form) against the sibling's (quotient form) | (M, Δ, ℓ) = (11, 11⁵, 5), (11, 11⁵, 3), (26, 2⁷·13, 7), (141, 3⁷·47, 7), (27, 27, 3), (30, 2⁴·3³·5, 3), (30, 2⁴·3³·5, 2) | product form: 1, 11, 13, 47, 27, 10, 15; quotient form: 1, 11, 13, 47, 27, 10, 15. At 26b1 with ℓ=7, the prime 2 is deleted (7 ∣ 7) and 13 is kept (7 ∤ 1); at M=27 the exponent 3 keeps 27 | the two forms agree (a deleted q has exponent 1, so q¹/q = 1) | none |
| H03: declaration counts | the elaborated `#check` list | 27 declarations = 17 theorems + 7 `def` + 2 `abbrev` + 1 `instance`; 17 `sorry` warnings | 17 and 10, not 14 and 9 | none (PR text outside job) |
| H04: gap slugs | README, Suggested.lean, `design/plan.json` | `all-embedding-frobenius`: 0, 0, 1; the seven README slugs occur 3, 5, 22, 9, 4, 4 and 4 times | plan entry stale | none (outside folder) |
