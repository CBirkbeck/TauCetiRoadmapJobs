# Review of ImplicitAtlases (pull request #974 at 81fc759)

**Verdict:** needs changes

🤖 Independent AI review, incremental: 0 changed lines in the folder since `81fc759`. This round reads the pull request's title and description against the head. The folder's files stand as accepted; the two findings are about the description only and are repaired by editing it. This review changes no pull-request file.

## R01 (P3) — The description's validation paragraph describes a `Suggested.lean` the head does not have

**Location:** pull-request description, paragraph "Validation": "all 12 declarations use only standard axioms, with no admissions. Printed types retain genuine finite-group and finite-dimensional-obstruction parameters."

**Claim:** The head's `Suggested.lean` has 12 declarations with printed types, and the pull request carries checker tests, a prerequisite audit and a prototype ("six checker tests", "the 74-node/232-edge prerequisite audit", "The prototype does not implement …").

**Witness:** `TauCetiRoadmap/ImplicitAtlases/Suggested.lean:8–10`: "none of them is statable at the pins, so the file states nothing"; lines 43–45 are an empty namespace. The folder holds `README.md`, `Suggested.lean`, `metadata.toml`; nothing changes outside it.

**Repair:** Replace the paragraph by: "Validation: `lake build TauCetiRoadmap.ImplicitAtlases.Suggested` passes. `Suggested.lean` declares nothing: no headline theorem is statable at the pinned Mathlib and Tau Ceti, and its module docstring names each headline and the carrier it lacks. The pull request adds only `README.md`, `Suggested.lean` and `metadata.toml`."

## R02 (P3) — The description's dependency sentence omits a supplier the README names

**Location:** pull-request description: "Dependencies: TopologicalSheafCohomology https://github.com/TauCetiProject/TauCetiRoadmap/pull/973, AlgebraicTopology #895, CharacteristicClasses #896 and ordinary DGAInfinity interfaces."

**Claim:** These four are the roadmap's suppliers.

**Witness:** `TauCetiRoadmap/ImplicitAtlases/README.md:93–95` "From TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII — §B2.9 … Used in §6.2", and `README.md:725` `*Needs:*` "AbelianSchemesAndArithmeticModuliPartII §B2.9"; that roadmap is not on main (open, #1405). `README.md:66–67` also consume Tau Ceti's `TauCeti.Topology.cechCohomology`.

**Repair:** Replace the sentence by: "Dependencies: TopologicalSheafCohomology (TS1.1, TS1.2, §1.4), AlgebraicTopology (Layers 2, 3, 6 and §5.1), CharacteristicClasses (§C1.2b, §C2) and DGAInfinity Layer 0, all on main; AbelianSchemesAndArithmeticModuliPartII §B2.9 (invariance of domain, used in §6.2), still open, which merges first; and the pinned Tau Ceti's `TauCeti.Topology.cechCohomology`, the carrier of every Čech group."

## Previous findings

- none: the previous report (of `81fc759`, accepted) had no finding to account for.

## Verified sound

**The description against the head.** Every other sentence of the title and prose was read against the head and stands: the title (the pull request adds the folder; it is not on main; 917 insertions, 3 files); the summary block (locally orientable comparison §3.4, class as a functional on degree-d Čech cohomology §4.3, laws of Layer 5, product §6.5, fiber product §7.3, consumers as `README.md:866`, "Pardon leaves unproved" as `README.md:781`, the Warsaw circle as `README.md:766`, no Steenrod lift as `README.md:26`); "finite orientation-cover nerve models and exact cover colimits" (`README.md:758`); "retains ineffective isotropy and negative virtual dimensions" (`README.md:325`, `:45`, `:168`); "joint ambient charts, support-pair and positive-degree Thom comparisons" (§7.1 joint chart, §7.2 support condition, `README.md:830`); "no orbifold-geometry input", "does not itself prove Gromov-Witten axioms" (`README.md:26`, `:844`).

**Adversarial calculations.** The folder changed no statement; the rows are for statements the description cites.

| Statement | Instances | Values computed | Result; change |
| --- | --- | --- | --- |
| §6.5 product formula on arbitrary compact Hausdorff products ("the Warsaw circle breaks singular Künneth") | X₁ = W (Warsaw circle), X₂ = pt | Čech¹(W × pt; ℚ) = Čech¹(W) ⊗ Čech⁰(pt) = ℚ ⊗ ℚ = ℚ; singular side H¹(W) ⊗ H⁰(pt) = 0 ⊗ ℚ = 0 ≠ ℚ | Retain. |
| §4.3/§6.4 quotient weights ("retains ineffective isotropy … quotient weights") | the ℤ/2 point; its square | class 1/|ℤ/2| = 1/2; product group ℤ/2 × ℤ/2 of order 4, class 1/4 = 1/2 · 1/2; a second factor 1/|Γ| would give 1/4 on the single point | Retain. |
| §7.1 dimension d_X + d_Y − n and §7.3 `Φ_Z(a) = Φ_P(i_!(a))`, `i_!(i^*b) = b ⌣ ū` ("fiber-product identity via a supported Gysin map") | X = S¹, Y = pt, M = ℝ, f = sin θ, g = 0; the tangential f = 1 − cos θ; d_X = d_Y = 0, n = 1, m_I = 1 | Z = {0, π}, d_Z = 1 + 0 − 1 = 0; i_!(1, 0) = η, i_!(0, 1) = −η, so i_!(i^*1) = η − η = 0 = 1 ⌣ ū with ū ∈ H¹(ℝ²) = 0; Φ_Z(1, 0) = +1 = Φ_P(η); tangential case: no joint chart; virtual dimension −1 with chart dimension −1 + 1 = 0 | Retain. |
| Conventions: signs for negative virtual dimension ("negative virtual dimensions … native shift/parity") | d = −1, q = 0; `Int.toNat` | d(q − d) = (−1)(1) = −1 ≡ 1 mod 2, sign −1; after `Int.toNat` the exponent would be 0, sign +1 | Retain. |
| `Suggested.lean` states nothing (R01) | the file at the head | module docstring, `public section`, empty namespace; 0 declarations; `lake env lean` exit 0, no output | The description is wrong, not the file: R01. |

Rows for all other statements stand as in the previous review, of `81fc759`.

- Gate, re-run at this head with `--base origin/main`: every check 0 (`depcheck=0`, `stray-files=0`, `outside-folder=0`, `statement-hygiene=0`), `OK`; the worker's gate adds `build=0`.
- Dependency check with `--movable`: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. ImplicitAtlases is at `ORDER.txt:220`, AbelianSchemesAndArithmeticModuliPartII at line 157.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ImplicitAtlases/Suggested.lean`, exit 0, no output. No declaration, so no `#check` comparison, no one-tactic probe and no padding; no headline is statable at the pins, as the docstring says (previous review).
- Cross-roadmap citations resolved again, 5 suppliers: AlgebraicTopology on main now carries the cited numbering itself (Layer 2 `README.md:1000`, Layer 3 `:1153`, §5.1 `:1888` with "Extend their natural/local-coefficient and relative APIs", §6.3 `:2491` with the twisted compact-support lemma at `:2573–2580`); TopologicalSheafCohomology, CharacteristicClasses and DGAInfinity are on main; AbelianSchemesAndArithmeticModuliPartII §B2.9 is at `README.md:1565` of its open head. `scratch/citations.md`: nothing found nowhere.
- Files changed outside the folder: none.
- Overlap facts (`scratch/overlaps.md`, main `2248bbb`, 473 heads): no other open pull request changes this roadmap, no cited id is dropped, no id is defined only by an open revision, no second copy on main.
- Source locators: 0 checked this round (no passage changed); the README has 92 parenthesised Pardon locators and 2 Hatcher locators.
- Remark on untouched text: `README.md:781` reads "The boundary, refinement, finite-union and product laws above follow Pardon's §§4–6", and TopologicalSheafCohomology `README.md:10` on main still describes ImplicitAtlases §0.7 as defining its own open-cover group.

Overlap check: read TopologicalSheafCohomology, SymplecticFieldTheory, Orbifolds (main) and GromovWittenTheory, AnalyticStableMaps, AlgebraicTopologyPartII (open); the open-cover Čech colimit is shared with TopologicalSheafCohomology and its owner is Tau Ceti's `TauCeti.Topology.cechCohomology` with TS1.2 for the extensions, which this roadmap consumes; nothing else shared.

Source independence: changed passages only; 0 passages compared, since the folder did not change; largest share pardon2016, 92 of 94 locators; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- The general proofs of §6.5 and §7.3 are constructions of this roadmap; the small-instance values test their conventions, not the proofs.
- "Closes #972", the "10,571-job build" and the review history the description reports are outside what the head shows.

## Source issues

- none

## For the human reviewers

- **Scope.** The fiber-product identity of §7.3, a headline, is stated by no refereed source: `README.md:781` says Pardon (§5 introduction, p. 40) names it as a desired property without proof; GromovWittenTheory and HamiltonianFloerOperations consume it.
- **Not tested.** The arrangement was not compared with pardon2016's table of contents in this round (incremental, no layer changed); `README.md:781` says four laws "follow Pardon's §§4–6".
