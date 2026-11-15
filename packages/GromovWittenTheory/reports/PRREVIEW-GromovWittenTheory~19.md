# Review of GromovWittenTheory (pull request #990 at c3c6033)

**Verdict:** needs changes

:robot: Independent AI review, incremental pass: 0 lines changed in the folder since `c3c6033`. This round reads the pull request's title and description against the head. The folder itself needs no edit: all three findings are repaired by editing the description.

## R01 (P3) — The validation paragraph describes a Lean file the head does not have

**Location:** pull-request description, "Validation": “the unchanged eight-declaration coefficient-carrier prototype has a no-admissions standard-axiom audit and recorded target/full builds at the pinned dependencies … No new Lean build was needed for prose changes.”

**Claim:** The head's `Suggested.lean` declares nothing, so there is no eight-declaration prototype and no axiom audit of one. The coefficient carriers are Tau Ceti's own at the pin.

**Witness:** `TauCetiRoadmap/GromovWittenTheory/Suggested.lean:62–66`: the namespace holds one comment, “No headline theorem is statable at the pins”. The worker's change summary counts 0 Lean declarations added.

**Repair:** Replace the paragraph by: “Validation: `Suggested.lean` states no declaration, because no headline theorem is statable at the pins; its docstring names the missing carrier for each. It elaborates with no output at the pinned Mathlib and Tau Ceti, and the README passes the push gate and the dependency check. The coefficient carriers are Tau Ceti's `NovikovSeries` and `NovikovModule`.”

## R02 (P3) — The dependency sentence names a supplier the head lacks and omits one it has

**Location:** pull-request description: “Dependencies include … and the stated HF/CKG/PDE/DG/AT/CC/GT contracts.”

**Claim:** No supplier contract of the head abbreviates to HF, and PseudoholomorphicCurveAnalysis, which the head consumes, is not named.

**Witness:** `README.md:60–138` has twelve roadmap contracts, none for a Floer roadmap. HamiltonianFloerOperations appears only as a consumer (`README.md:38`, `:807`). PseudoholomorphicCurveAnalysis PH1, PH3.2, PH6.1 and PH6.3 are consumed at `README.md:35` and `:132–134`.

**Repair:** Write: “Suppliers: AnalyticStableMaps and ImplicitAtlases (open), and on main TopologicalSheafCohomology, ComplexCurveModuli, Orbifolds, CharacteristicClasses, AlgebraicTopology, GeometricTopology, DifferentialGeometry, ComplexKahlerGeometry, PseudoholomorphicCurveAnalysis and PDE. The Novikov completion is Tau Ceti's `NovikovSeries`, the ring MorseNovikov N1 plans. HamiltonianFloerOperations is a consumer.”

## R03 (P3) — The folder-name paragraph describes a clash that no longer exists

**Location:** pull-request description, "Folder name": “#1998 proposes a different roadmap … under the same folder name. … #1998 takes another folder name before either merges.”

**Claim:** #1998 has already taken another folder name, so no pull request now shares this folder and no order is pending.

**Witness:** `roadmaps list`: “#1998 AlgebraicGromovWittenTheory (new) … 9b70e32”. `scratch/overlaps.md`: “Other open pull requests that change this roadmap: None.”

**Repair:** Replace the last three sentences by: “The algebraic theory of smooth projective varieties is the separate roadmap AlgebraicGromovWittenTheory (#1998), in its own folder; the two share no objects.”

## Previous findings

- none: the previous report (`PRREVIEW-GromovWittenTheory_r18`, of `c3c6033`) had no finding. Its remark on the “eight-declaration” sentence is R01 above, now that the description is checked.

## Verified sound

### The rest of the title and description

- **Title** (“Add Gromov–Witten theory roadmap”): the folder is not on main and the change is 885 insertions, 0 deletions.
- **Summary block**: each sentence matches the head. The eight properties are Kontsevich–Manin 2.2.0–2.2.7 (`README.md:19`), the genus-one value is §3.4 (`:383`), the CohFT and quantum product are §7.1–§7.2, the four descendant relations are §8.4–§8.6, the Čech cup product over every topological space is §0.4 (`:15`, `:203`), and the coefficients are `TauCeti.NovikovSeries` and `TauCeti.NovikovModule` (`:74–75`).
- **Second and third paragraphs**: Novikov finiteness is §0.3, endpoint invariance §2.3, the scalar Hodge family and concordance §3.2–§3.3, the forget-compatible collection AnalyticStableMaps §12.2 (`README.md:86`), the two ranges §8.1–§8.2.
- **“Only … `{README.md,Suggested.lean,metadata.toml}` changes, topic `math.SG`”**: `git diff --stat origin/main...HEAD` outside the folder is empty, and `metadata.toml` reads `topic = "math.SG"`.
- **Remark, no change requested**: the counts “13 supplier-file and 37 selected-excerpt bindings” and “26-node/60-edge” refer to the author's own tooling and could not be recomputed. The README has 14 `### From` headings (Mathlib, Tau Ceti and 12 roadmaps).

### Adversarial pass

The diff changes no statement. The rows are for statements the description cites, recomputed this round.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §3.4, `I_(1,1,0)(1) = χ(X)·1` (“genus-one degree-zero value”) | `ℂP¹`, `T²`; degree and dimension count | degree `0 + 2(1−1)m − 0 = 0`; `d = 2 = dim_ℝ M̄_(1,1)`; `k = 0` term `∫c_m(TX) = 2`, `0`; Kontsevich–Manin (2.9) gives `1`, `0` | Correct, source coefficient corrected |
| §3.4, degree-two insertion | `ℂP²`, `δ = H` | `−(1/24)·∫3H·H = −1/8`; as a class `−(1/12)·3·[pt]^∨`, weighted integral `−(1/4)(1/2) = −1/8` | Correct |
| §0.3, finiteness below an energy bound (“geometric Novikov finiteness”) | `ℂP²`, `ω(ℓ) = 1`, bound `E` | realized classes `dℓ`, `0 ≤ d ≤ E`: `⌊E⌋ + 1`; all classes with `ω ≤ E`: infinitely many (`d → −∞`), so “represented” is needed | Correct |
| §0.4, graded commutativity of the Čech cup product | `T²`, degree-one generators `θ₁, θ₂` | `θ₁⌣θ₂ = (−1)^(1·1) θ₂⌣θ₁ = −θ₂⌣θ₁ ≠ 0`; `θ₁⌣θ₁ = 0` | Correct |
| §8.6, genus-zero recursion for ancestors | point target, `n = 4` | left `∫_(M̄_(0,4)) ψ̄₁ = 1`; right: one boundary point `{1 ∣ 2,3}` with `⟨τ₀³⟩·⟨τ₀³⟩ = 1` | Correct |

The rows for every other statement stand as in the previous review, of `c3c6033`.

### Counts

- **Gate**, rerun at `c3c6033` with `--base origin/main`: every counter `0`, `OK`, exit 0; the worker's run also has `build=0`.
- **Dependency check**: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The merge order lists ImplicitAtlases (220), AnalyticStableMaps (221), TopologicalSheafCohomology (312), then GromovWittenTheory (313).
- **Elaboration**: `lake env lean TauCetiRoadmap/GromovWittenTheory/Suggested.lean` exits 0 with no output (9 s). The file declares nothing, so there is no `#check @name` comparison and no padding probe.
- **Cross-roadmap citations re-resolved**: ImplicitAtlases moved to `8352e53` since the previous review; the 14 cited sections (§0.7, §1.1, §4.2–§4.3, §5.2–§5.4, §5.6, §6.4–§6.5, §7.1–§7.4) all exist there, §0.7 still defines its groups as `TauCeti.Topology.cechCohomology`, and §7.4 still leaves the splitting, divisor, unit and forgetful diagrams to applications. AnalyticStableMaps is unchanged at `41557ba`; its 21 cited sections exist.
- **Citers on main**: HamiltonianFloerOperations (`README.md:3`, `:17`), MorseNovikov (`:1534`, “GromovWittenTheory's Novikov layer consume N1”), SymplecticFieldTheory and HeegaardFloer cite this folder name; none cites an id the head lacks.
- **Sources**: the seeded sample (15 targets) lies in unchanged text whose locators the earlier reviews read; no locator was re-read.
- **Headlines**: four, none statable at the pins, each named in the docstring with its missing carrier (`Suggested.lean:27–50`); unchanged.

Overlap check: read AnalyticStableMaps, AlgebraicGromovWittenTheory, ImplicitAtlases, ComplexCurveModuli, HamiltonianFloerOperations, MorseNovikov; nothing shared. AlgebraicGromovWittenTheory works with the Behrend–Fantechi class on numerical Chow groups of projective varieties and states that “the symplectic Gromov–Witten roadmap owns the analytic stable-map theory”.

Source independence: changed passages only; the folder changed by 0 lines, so 0 passages compared; largest share Kontsevich–Manin (the 1994 and 1998 papers together, 26 of 43 source mentions in the layers); contents not compared again, no layer added, removed or reordered.

## Not verifiable

- FukayaTheory (#1045) and HeegaardFloer, also on the closest-roadmap lists, were not read for scope this round.
- The description's tooling counts (bindings, graph nodes and edges, “60 roadmaps”) have no counterpart in the worker's gate.

## Source issues

- none

## For the human reviewers

- **Licence.** Kock's *Notes on psi classes* is cited as a “preliminary version of 6 June 2001” from the author's page (`README.md`, References): unpublished notes, used for locators in Layer 8 beside the published Kontsevich–Manin 1998 paper.
- **Not tested.** The second Kontsevich–Manin paper, Kock's notes and Deligne–Mumford are not in the board's source manifest; this round re-read none of them.
