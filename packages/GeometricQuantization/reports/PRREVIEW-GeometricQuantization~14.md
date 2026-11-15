# Review of GeometricQuantization (pull request #1186 at 49fe13a)

**Verdict:** needs changes

## R01 (P3) — Basic functions act by multiplication, not constant scalars

**Location:** PR description, `pull-request.md:22`: “functions constant along the real polarization act as scalars.”
**Claim:** This identifies multiplication by a basic function with scalar multiplication on the complex space of polarized sections.
**Witness:** `TauCetiRoadmap/GeometricQuantization/README.md:932` has basic function q on T*ℝ; line 1007 gives Q_q=q. On the local polarized section 1, Q_q1 takes values 0 and 1 at q=0 and q=1.
**Repair:** Replace with: “Functions constant along the real polarization act by pointwise multiplication on polarized sections; globally constant functions act by their scalar value.”

## R02 (P3) — The description gives the obsolete Schubert supply direction

**Location:** PR description, `pull-request.md:26`: “Q2A.1 precedes SchubertGeometry S3P.3; Q2A.2–3 consume the earlier S3P.1–2 topology/Picard comparisons.” Also `roadmap-summary`, line 17.
**Claim:** These section names and the claimed supply of the Picard comparison do not describe the head.
**Witness:** `TauCetiRoadmap/GeometricQuantization/README.md:276` consumes SchubertGeometry S9.1/S9.7; line 29 assigns ordinary Picard comparisons to §3.3 and line 1938 supplies SchubertGeometry, Part II. `TauCetiRoadmap/SchubertGeometry/README.md:109` and line 122 on main define the cited flag inputs.
**Repair:** Replace the quoted sentence with: “Layer 3 consumes SchubertGeometry S9.1/S9.7's flag geometry and constructs the ordinary Picard–Chern and homogeneous-character comparisons consumed by SchubertGeometry, Part II.” In `roadmap-summary`, identify the equivariant Picard consumer as “SchubertGeometry, Part II”.

## R03 (P3) — The advertised notebook references are absent

**Location:** PR description, `pull-request.md:26`: “The notebook references identify Knutson Semester2 physical pages106 and119 and preserve the source discrepancy.”
**Claim:** The description advertises source references and a discrepancy discussion absent from this head.
**Witness:** `TauCetiRoadmap/GeometricQuantization/README.md:1964` begins the complete References section; it contains no Knutson entry. Searching both reviewed files for “Knutson” or “Semester2” returns zero matches.
**Repair:** Delete the quoted sentence from the description.

## R04 (P3) — The Lean import claim describes a different interface

**Location:** PR description, `pull-request.md:30`: “The representative Lean interface imports the existing native symplectic-form API directly.”
**Claim:** The acceptance file imports no Tau Ceti module and states its theorem on theta sections.
**Witness:** `TauCetiRoadmap/GeometricQuantization/Suggested.lean:1` is the sole import, `import Mathlib`; line 76 defines thetaSections and line 93 states finrank_thetaSections. Lines 14–58 list the geometric headlines whose carriers are missing.
**Repair:** Replace with: “Suggested.lean imports Mathlib, defines theta sections and states their dimension theorem; its docstring identifies the geometric headlines not statable at the pins.”

## R05 (P3) — State that this PR adds the roadmap and its acceptance file

**Location:** PR description, `pull-request.md:32`: “Only README prose changed; Suggested.lean and the homogeneous-character companion retain their earlier successful validation.”
**Claim:** The description leaves the new-roadmap scope unstated and instead describes a prose-only change with a companion file absent from the folder.
**Witness:** The base-to-head diff adds `TauCetiRoadmap/GeometricQuantization/README.md` (2008 lines), `Suggested.lean` (109), and `metadata.toml` (1). The folder is absent on origin/main; its three-file tree has no homogeneous-character companion.
**Repair:** Open the description with: “This PR adds the GeometricQuantization roadmap: a six-layer README, a theta-section acceptance file, and topic metadata.” Replace the quoted validation sentence with: “The targeted build and direct elaboration of Suggested.lean pass with the expected sorry warning.”

## Previous findings

- R01 — not repaired (settled): `lake-manifest.json:8` still pins Tau Ceti a91d3aa. Review 13 treated the pin mismatch as outside this package's editable scope; the unchanged folder does not reopen that finding.
- R02 — repaired: `TauCetiRoadmap/GeometricQuantization/README.md:853` retains the correctly delimited `**local**`; the stray-emphasis repair carried by review 13 is unchanged.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Basic-function scalar claim (R01) | Vertical polarization on T*ℝ; a=q; local section s=1; q=0,1 | Actual Q_q1: (0,1). Any constant scalar c times 1: (c,c). No c agrees. | Refuted | Say pointwise multiplication |
| Corrected scalar claim (R01) | Same instance; additionally a=2 | Multiplication q·1: (0,1)=Q_q1; 2·1: (2,2)=Q_2 1. | Agrees | Description only |
| Schubert references (R02) | Enumerate cited identifiers and head contracts | S3P references in head: 0; named Schubert supplier identifiers: S9.1, S9.7; §3.3 owns ordinary Picard comparison. | Description differs | Update owner and identifiers |
| Notebook-reference claim (R03) | Both reviewed files | Claimed physical-page references: 2; Knutson or Semester2 occurrences: 0. | Description differs | Delete sentence |
| Import claim (R04) | Suggested.lean import lines | Claimed direct symplectic import: at least 1; actual TauCeti imports: 0; Mathlib imports: 1. | Description differs | Describe theta interface |
| Prose-only scope claim (R05) | Base-to-head diff and head tree | README additions: 2008; Lean additions: 109; metadata additions: 1; companion files: 0; total additions: 2118. | Description differs | State new-roadmap scope |

The remaining adversarial rows stand as in the previous review of `49fe13a`; they are not repeated.

- Incremental scope: 0 changed folder lines, 0 files changed outside the folder; title checked against the head and all quoted description prose checked against the base diff.
- Sources: 0 changed locators in the seeded sample; no new source comparison required by this diff.
- Library: 4 declarations opened at the Mathlib pin in `Mathlib/NumberTheory/ModularForms/JacobiTheta/TwoVariable.lean:123`, :327, :384 and :390.
- Signatures: both actual named declarations elaborated with `#check @`; 0 lost binders. The worker's third name, “modulo”, is docstring text, not a declaration; prior padding results stand.
- Citations: SchubertGeometry S9.1/S9.7 resolved on main; mechanical resolution reports 0 missing roadmap citations and 0 missing roadmap-owned Lean names (external library names excluded by that tool).
- Gate rerun: every scanner count 0, `OK`; targeted `lake build TauCetiRoadmap.GeometricQuantization.Suggested` exits 0.
- Direct elaboration and signature probe: exit 0; the only warning is the admitted theorem at `Suggested.lean:93`.
- Dependency check, complete output: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD or CYCLE.

Overlap check: read SymplecticGeometry (main/#1808), HamiltonianSystems (#480), ComplexKahlerGeometry (main/#1807), SmoothBundlesConnections (main/#2127), FukayaTheory (#1045), ConvexityToric and HamiltonianReduction (main). Shared foundations retain their owners: SymplecticGeometry's cotangent geometry, HamiltonianReduction's quotients, ConvexityToric's lattices and Duistermaat–Heckman measure, SmoothBundlesConnections' bundles/connections, ComplexKahlerGeometry's holomorphic sections; the Hamiltonian API is consumed from Tau Ceti. FukayaTheory's Floer constructions are outside this roadmap's scope. No changed ownership contract.

Source independence: changed passages only; 0 changed roadmap passages compared with 0 sources. No layer was added, removed or reordered, so the source-arrangement comparison was not reopened.

## Not verifiable

- No new source-verification limitation; the previous review's context-only reference and main-pin elaboration limitations stand.

## Source issues

- **Misprint** in demailly at VI §9.1, printed p. 314 (demailly line 15573): the source says the Dolbeault–sheaf identification follows from (V-11.6); it should cite Proposition V-11.5 at q=1 (demailly line 13203); affects nothing.

## For the human reviewers

- none
