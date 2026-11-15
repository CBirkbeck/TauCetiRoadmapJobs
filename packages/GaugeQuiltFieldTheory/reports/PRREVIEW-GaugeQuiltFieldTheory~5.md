# Review of GaugeQuiltFieldTheory (pull request #1076 at df970ca)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since df970ca: the folder is as the previous review accepted it, and this round reads the pull request's title and description against the head. Two P3 findings, both in the description's prose; nothing in the folder needs a change.

## R01 (P3) — The description says the Lean prototype is unchanged and has no admissions

**Location:** pull request description, "Validation" paragraph: "The native group prototype and math.SG metadata are unchanged, with no explicit prototype admissions"; also "unchanged prototype", "zero owner admissions", and the closing "The README is definitive and the prototype is nonexhaustive."
**Claim:** The head contradicts these sentences: the generic-group prototype is gone and the file now admits three theorems.
**Witness:** `TauCetiRoadmap/GaugeQuiltFieldTheory/Suggested.lean` at df970ca declares `relationSet`, `relationModuli` on `Matrix.specialUnitaryGroup (Fin r) ℂ` and three `sorry` theorems (lines 53, 61, 72); `GenusOneHolonomy` and `conjugateHolonomy` of 971ef96 occur nowhere.
**Repair:** Replace the three prototype sentences by: "`Suggested.lean` states the headline theorems statable at the pins: `relationSet` and `relationModuli` on `Matrix.specialUnitaryGroup`, with `relationModuli_genus_one`, `relationSet_stabilizer_central` and `relationModuli_simplyConnected`, each admitted with `sorry`; it replaces the earlier generic-group genus-one prototype. `metadata.toml` (math.SG) is unchanged." Delete "unchanged prototype" and "zero owner admissions", and end with "The README is the roadmap."

## R02 (P3) — The description presents a CI run of an earlier head as the submitted head's

**Location:** pull request description, "Validation" paragraph: "new submitted-head CI run 39598885877 passed: 12,451 Lake jobs, zero owner admissions, zero other owner warnings and zero named errors. The complete tested merge parents, untruncated tree … match publication."
**Claim:** The run is not of this head, so the sentence and the "match publication" claim describe a tree the pull request no longer has.
**Witness:** Run 39598885877 has head 971ef96 (created 2026-10-21, toolchain `v4.35.0-rc3`). The head is df970ca: four later commits in the folder (25e0ea3, fbd71b7, 023814f, df970ca) and a merge of main; `lean-toolchain` is `v4.36.0-rc2`.
**Repair:** Replace by: "CI run 39598885877 passed on the earlier head 971ef96 (Lean 4.35.0-rc3). Since then the roadmap was revised in review (the SU(r) relation-model headlines in `Suggested.lean`, the supplier contracts including Tau Ceti's `A∞` carriers, Checks and locators) and main was merged (Lean 4.36.0-rc2); the present head is validated by the pull request's own checks." Delete the "match publication" sentence and "Earlier pinned Lean4.35.0-rc3 interface evidence remains historical".

## Previous findings

- none: the previous review, of df970ca, listed no finding.

## Verified sound

**The description against the head.** Every other sentence of the title, the summary block and the prose was compared with the head and stands; the values are in the table.

| statement | instances tried | values on each side | result |
|---|---|---|---|
| title | README line 1, Lean docstring line 6 | "Connected symplectic gauge field theory and quilted sewing" in all three | agrees |
| summary: target of the functor | README lines 3, 246–250, 268 | integral, uncurved, `ℤ/4`-graded, cohomologically unital, with shift, modulo `[F]∼[F∘S_C^k]`: both sides | agrees |
| summary: the three headline names; `relationModuli_genus_one` | `r=1`; `r=2`, `ζ=−1`, `A=diag(i,−i)`, `B=[[0,1],[−1,0]]` | `r=1`: `SU(1)` trivial, one tuple, one orbit; `r=2`: `AB=A⁻¹B⁻¹=[[0,i],[i,0]]`, square `−1=ζ·1` | declared at Lean lines 39, 45, 53, 61, 72; true |
| summary: "the quilt categories and sewing theorem have no other consumer" | README line 278; InstantonFloerTheory at 0b47a8f lines 19, 364, 382 | IF9 consumes GQ1 only (`*Needs:* GaugeQuiltFieldTheory GQ1`); GQ2–GQ5 uncited elsewhere | agrees |
| summary: "`ℤ/4`-graded `A∞` categories and functor categories, compared with the existing `ℤ`-graded carriers" | README lines 39, 43 | Tau Ceti `ℤ`-graded carriers; DGAInfinity functor category over `ℤ` (main line 329); GQ4 builds the `ℤ/4` variants and comparison | agrees |
| prose: "`B_g=0` in even genus and `E_g` in odd genus" | `g=2,3`, `r=2` | README line 111; `p*b_2+q*b_3=0+q*η_3=p*η_2=w₂(TL_2)`; uniform `B_g=E_g` gives `2p*η_2=0≠p*η_2` | agrees; identity holds |
| prose: "`TM_middle⊕2B_middle`" cancellation; weighted adjoints | README lines 162–164; `φ=λs` | last summand `TM_1⊕B_1⊕B_1`; `e^{λs}De^{−λs}=∂_s+A−λ`, Hilbert adjoint `−∂_s+A−2λ`, dual-weight `−∂_s+A` | agrees |
| prose: "Restore S. Ma'u"; "exactly three owner files"; "Closes" a new roadmap | README line 283; folder listing; `origin/main` | "S. Ma'u, K. Wehrheim and C. Woodward"; `README.md`, `Suggested.lean`, `metadata.toml`; folder absent on main, 364 insertions | agrees |
| prose: "no explicit prototype admissions", "zero owner admissions" (R01) | `Suggested.lean` at df970ca and at 971ef96 | head: 3 `sorry`, 5 declarations on `SU(r)`; 971ef96: 0 `sorry`, `GenusOneHolonomy` over a general group | contradicted |
| prose: "new submitted-head CI run" (R02) | run 39598885877 | run head 971ef96, toolchain 4.35.0-rc3; pull request head df970ca, toolchain 4.36.0-rc2 | contradicted |

The rows of the previous review for the statements of the folder stand as in the previous review, of df970ca.

- Gate, run again on this head: every check 0, `OK`; the worker's gate has `build=0`. Files changed outside the folder: none.
- Elaboration (`lake env lean` on `Suggested.lean`, pinned libraries): three `declaration uses sorry` warnings (lines 53, 61, 72), nothing else; the elaborated types in the worker's signature list match the README statements at lines 57–59, no section binder lost.
- Dependency check: `depcheck: 244 roadmaps, 2228 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Merge order: SmoothBundlesConnections 13, FukayaTheory 230, GaugeQuiltFieldTheory 300, InstantonFloerTheory 301 (a consumer, in no `*Needs:*` line).
- Cross-roadmap citations re-resolved, 5 roadmaps, because two heads moved: InstantonFloerTheory at 0b47a8f (lines 19, 46, 364, 373, 382; headings IF0 25, IF9 360, IF10 427); FukayaTheory at 31de88a (FK0 96, FK1.1 206, FK3 464, FK3.1 466, FK4.2 646, FK6.1 746; the monotone convention at 468, 486, 748); on main 1a19c9f HeegaardFloer line 1464 (the order `det ker ⊗ (det coker)*`), DGAInfinity line 329, HamiltonianReduction R5 line 305, SpinGeometry G4.1–G4.4 lines 1463–1728.
- Seeded sample: "Rank two, odd degree" (README line 84) and the InstantonFloerTheory citations are unchanged text; the division of ownership they state (GQ1 the moduli, the `H¹(X;ℤ/2)` action and the `4π²` comparison; IF9 the `SO(3)` adapter and Hodge star) is what InstantonFloerTheory lines 19, 364 and 373 say at 0b47a8f. No source locator was reopened this round.
- Overlap check: read InstantonFloerTheory, FukayaTheory, HeegaardFloer, DGAInfinity, HamiltonianReduction; the fixed-determinant surface moduli is owned by GQ1 and consumed by IF9, generalized quilts by GQ4 (FukayaTheory states none), nothing else shared. The worker's overlap and citation scans list no dropped id, no second copy and no other pull request changing the folder.
- Headlines and padding: unchanged since the previous review (three statable relation-model theorems stated, the unstatable headlines named in the module docstring with their missing carriers).
- Source independence: changed passages only; the diff is empty, so 0 passages compared with 0 sources this round; largest share `ww-coprime`, as in the previous review; the layer arrangement is unchanged and was not compared again.

## Not verifiable

- The description's counts for run 39598885877 ("12,451 Lake jobs", "all seven whole owner/configuration inputs"): only the run's head and conclusion were read, not its logs.
- Atiyah–Bott (1983) and Drezet–Narasimhan (1989): paywalled, as in the previous review; not reopened.

## Source issues

- none

## For the human reviewers

- none
