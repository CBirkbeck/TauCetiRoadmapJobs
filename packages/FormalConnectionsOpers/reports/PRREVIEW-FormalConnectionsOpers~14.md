# Review of FormalConnectionsOpers (pull request #1056 at 4b3f57b)

**Verdict:** needs changes

## R01 (P3) — The Lean inventory and validation paragraph describe an older head

**Location:** PR description, `scratch/pull-request.md:30`: “The suggested code now gives actual characteristic-free commutators and principal-parts quotients/jets, native polynomial coefficient/point maps and nonnormal cosets, and full-root-pairing cocharacter interfaces.”
**Claim:** The paragraph attributes absent interfaces to `Suggested.lean` and gives obsolete pins and admission counts as its validation.
**Witness:** `TauCetiRoadmap/FormalConnectionsOpers/Suggested.lean:59–167` contains six exported definitions and three theorems, with three admissions. `lean-toolchain:1` and `lake-manifest.json:10,22` pin v4.36.0-rc2, Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b.
**Repair:** Replace the validation paragraph with: “Suggested.lean states regular-gauge classification, polynomial factorization of formal loops and the cyclic-vector theorem, with six supporting definitions and one local instance. Other headlines and their missing carriers are listed in its docstring. At 4b3f57b, the targeted build and direct elaboration pass on Lean v4.36.0-rc2, Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b, with only three sorry warnings. This checks signatures, not proofs.”

## R02 (P3) — AffineLieAlgebras is described as a supplier

**Location:** PR description, `scratch/pull-request.md:28`: “AffineLieAlgebras #1129 supplies the generic mode completion before critical-center theory.”
**Claim:** Calling this a construction dependency reverses the direction stated at this head.
**Witness:** `TauCetiRoadmap/FormalConnectionsOpers/README.md:140–144` consumes nothing from AffineLieAlgebras; lines 2555–2563 construct the classical completion here. `TauCetiRoadmap/AffineLieAlgebras/README.md:36–38` on main imports FCO's opers and classical screenings.
**Repair:** Replace the sentence with: “FCO §7.5 constructs the classical mode completion independently. AffineLieAlgebras consumes it and owns its comparison with the generic mode completion.” Remove AffineLieAlgebras from the following sentence's construction dependencies.

## R03 (P3) — The description assigns the principal-parts API to F2

**Location:** PR description, `scratch/pull-request.md:28`: “F2 exports the characteristic-free all-order differential-operator/principal-parts API, with smooth characteristic-zero Lie–Rinehart comparison separate.”
**Claim:** This omits the transfer of ownership to ComplexComparisonPartII C5.1 and presents the imported foundation as F2's output.
**Witness:** `TauCetiRoadmap/FormalConnectionsOpers/README.md:709–720` imports that entire interface and defines none of it again. ComplexComparisonPartII #848, `TauCetiRoadmap/ComplexComparisonPartII/README.md:3083`, explicitly owns it and names F2.2 as consumer.
**Repair:** Replace the sentence with: “F2.2 imports the characteristic-free differential-operator and all-order principal-parts API from ComplexComparisonPartII C5.1, then constructs symbols, Atiyah sequences and the Lie–Rinehart comparison with its projectivity, smoothness and characteristic-zero hypotheses.”

## R04 (P3) — The KacMoody dependency description is obsolete

**Location:** PR description, `scratch/pull-request.md:26`: “is an unmerged written-contract dependency for the late minimal-derived-group comparison, its actual central kernel, rotation and global-form maps.”
**Claim:** KM8A is already on main; this head imports §§8.1 and 8.4 for the point-group comparison, expressly excluding the minimal-derived-group map and central kernel.
**Witness:** Main's `TauCetiRoadmap/KacMoody/README.md:1133,1186,1205` contains KM8A. `TauCetiRoadmap/FormalConnectionsOpers/README.md:474–486` specifies §§8.1/8.4 and says the minimal derived group, its homomorphism and central kernel enter nothing here.
**Repair:** Replace the paragraph with: “FCO §3A.4 consumes KacMoody §§8.1 and 8.4 on main to compare its complex-point loop functors and component maps. KacMoody owns the minimal-derived-group homomorphism and central kernel; those are not inputs here. This PR changes only FormalConnectionsOpers.”

## R05 (P3) — State that this adds a new roadmap

**Location:** PR description opening, `scratch/pull-request.md:15,22`: “Construct algebraic connections, formal loop gauge prestacks and intrinsic opers”.
**Claim:** Neither the opening prose nor the `roadmap-summary` block identifies this as a new roadmap; the later language about retained interfaces and preserved bodies reads as a revision.
**Witness:** The base comparison adds all three files: 2,895 README lines, 173 Lean lines and one metadata line. There is no FormalConnectionsOpers folder on the base and no existing declaration body to preserve there.
**Repair:** Prepend: “This PR adds the new FormalConnectionsOpers roadmap: README.md, Suggested.lean and metadata.toml.” The replacement in R01 removes the misleading preserved-body claim.

## Previous findings

- R01 — repaired: §7.4, lines 2492–2504, still requires reasonableness, formal smoothness of both schemes and a locally projective normal bundle, and supplies the finite-stage generators and coefficient lifts. The previous accepted review has no outstanding finding.

## Verified sound

| Statement | Instances tried | Left-hand value | Right-hand value | Result / change |
| --- | --- | --- | --- | --- |
| Regular-gauge classification, F2.4 | `R = ℚ[ε]/ε²`, rank one, `A = ε`, `B = 0`, `g = 1 + εt` | `gAg⁻¹ − g′g⁻¹ = ε − ε = 0` | `B = 0`; `g(0) = 1` | agrees; R01 corrects description only |
| Polynomial-loop factorization and coefficient maps, F3A.1–2 | `G = 𝔾_m`, `R = ℂ`, `g = t(1+t)` | `g = t + t²`; `t·t⁻¹ = 1` | `p = t`, `q = 1+t`, `pq = t+t²` | agrees; R01 corrects description only |
| Differential-module predicate and cyclic vectors, F6.2 | `F = ℚ(t)`, `V = F²`, componentwise derivative, `v = (1,t)` | `Dv = (0,1)`; determinant `1` | basis rank `2 = dim_F V`; Leibniz difference `0` | agrees; R01 corrects description only |
| Classical mode/coefficient identification, F7.5 | rank one; modes `a = −2, 0`; restriction to regular opers | `w[−2] ↦ q₁`; `w[0] ↦ q₋₁` | regular restriction gives `q₁`, `0` | agrees; R02 corrects supplier direction |
| Characteristic-free principal parts versus characteristic-zero comparison, F2.2 | `A = 𝔽₂[x]`, second Hasse derivative, input `x²` | coefficient of `h²` in `(x+h)²` is `1` | second ordinary derivative is `2 = 0` | distinction retained; R03 corrects ownership |
| KacMoody component comparison, F3A.4 | `PGL₂`, class of `diag(t,1)` | component `1 mod 2` | scalar Laurent-unit rescaling has determinant exponent `2m+1`, never `0` | agrees with KM8.4; R04 corrects dependency description |
| New-folder inventory, R05 | merge-base comparison | additions: `2895 + 173 + 1 = 3069` lines | deletions: `0`; pre-existing folder files: `0` | description must say “adds” |

Untouched mathematical rows stand as in the previous review of `4b3f57b`.

- Delta: 0 changed folder lines since `4b3f57b`; 0 changes outside the folder; worktree clean.
- PR text: title, `roadmap-summary` and all quoted prose compared with the head and base inventory; five description findings.
- Seeded source sample: 0 changed targets or locators; no source passage reopened in this incremental round.
- Signatures: nine supplied elaborated public signatures compared with README F2.4, F3A.1–2 and F6.2; no binder discrepancy or signature change.
- Supplier text: three contracts checked against ComplexComparisonPartII #848, AffineLieAlgebras on main and KacMoody on main; ownership conclusions above.
- Gate: all reported checks zero, `OK`, exit 0; targeted build exits 0, 18,586 jobs, three sorry warnings.
- Dependency output: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; exit 0, no UPWARD or CYCLE.
- Direct elaboration: exit 0; only three sorry warnings at `Suggested.lean:74,133,163`.

Overlap check: read ComplexComparisonPartII, AffineLieAlgebras and KacMoody ownership for the description's claims; principal parts belong to C5.1, classical completion to FCO §7.5, quantum comparison to AffineLieAlgebras, minimal-derived-group theory to KacMoody. No folder delta requires reopening the remaining settled overlap audit.

Source independence: changed passages only; 0 source passages compared with 0 sources, 0 changed locators (no largest share in this delta); arrangement comparison not reopened because no layer was added, removed or reordered.

## Not verifiable

- Historical private-library and CI claims in the description were not rerun; current-head validation is recorded above.
- Prior source limitations remain outside this zero-line delta: Kazhdan–Lusztig 1980/1988, Chevalley 1955, Matsushima 1960 and Drinfeld–Sokolov 1985 are cited by settled uncertified/paywalled locators.

## Source issues

- none

## For the human reviewers

- none
