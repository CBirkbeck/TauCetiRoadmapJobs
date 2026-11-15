# Review of InstantonFloerTheory (pull request #1083 at 0b47a8f)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 0b47a8f; this round reads the pull request's title and description against the head. The folder's files have no finding. Both findings are about the description and are repaired by editing it; no commit is needed.

## R01 (P3) — The description's `Suggested.lean` paragraph describes a file the head no longer has

**Location:** pull request description, sixth paragraph: "Suggested.lean remains the exact 3,261-byte native eigenspace/intertwiner prototype previously validated at Lean 4.35.0-rc3, Mathlib 6b7abb3c and Tau Ceti a91d3aaf, with no explicit admissions."

**Claim:** The head's `Suggested.lean` is not that file, and the pins named are not the head's. The description also leaves unstated that the five declarations of the first commit were removed.

**Witness:** `TauCetiRoadmap/InstantonFloerTheory/Suggested.lean` at 0b47a8f: 2,392 bytes, a module docstring and an empty namespace, no declaration (c8af3591: 3,261 bytes, 5 declarations). `lean-toolchain`: v4.36.0-rc2; `lake-manifest.json`: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9.

**Repair:** Replace the sentence by: "`Suggested.lean` states nothing: none of the five headline theorems (IF5; IF6; IF7a–IF7b; IF8; IF9–IF10) is statable at the pins (Lean v4.36.0-rc2, Mathlib 1b1ccf4b, Tau Ceti 2fd255d9), and its module docstring names the carrier each lacks. The eigenspace/intertwiner prototype of the first commit was removed, since it names none of the roadmap's objects."

## R02 (P3) — The validation paragraph vouches for an earlier text

**Location:** pull request description, fifth and sixth paragraphs: "the complete IF0–IF10 preserving composition received a genuinely different mathematical/prerequisite review, including the unchanged prototype" and "Metadata and dependency pins are unchanged. No successful compiler/support/native check was replayed."

**Claim:** The prototype is not unchanged (R01), and the README the paragraph says was reviewed and bound by "twenty text operations" was rewritten afterwards; the description does not say so.

**Witness:** `git log origin/main..HEAD -- TauCetiRoadmap/InstantonFloerTheory`: after 5d973ec6 (2026-10-21) come f0af2535, 1fb9d4da, 22d369ab, 4f6a1533 and 0b47a8ff, which add Checks, `*Needs:*`, Examples and Dependencies to every layer and the `ZMod (2m)` Künneth sequence of IF5.

**Repair:** Delete "including the unchanged prototype" and the two sentences quoted second, and add: "The review and the CI run named here read the text of 5d973ec6. Later commits added Checks, `*Needs:*`, Examples and Dependencies to every layer, exact source locators and supplier sections, the `ZMod (2m)`-graded tensor signs and Künneth sequence of IF5, and replaced `Suggested.lean` (above)."

## Previous findings

- none: the previous report (accepted, of 0b47a8f) listed no finding, and the folder is byte-identical to the head it read.

## Verified sound

| # | Statement (where the description cites it) | Instances | Values on each side | Result |
|---|---|---|---|---|
| 1 | "U²=T⁻¹ for the upward half-period variable" (README line 455) | deck `T`, half-period `J` | `T`: CS drop 1, index 8 (line 66); `J`: drop 1/2, index 4 (lines 66, 377); `J²`: 1/2+1/2=1, 4+4=8, so `J²=T`; `U=J⁻¹`, `U²=T⁻¹` | holds; description agrees |
| 2 | "both finite forgetful quotients" (line 461) | one generator, lifts `Uⁿα̃` | `Z[U^±1]/(U−1)≅Z`, rank 1; `Z[U^±1]/(U²−1)` has basis `1,U`, rank 2 | holds |
| 3 | "four reduced grades, kernel of u²−64, S³ factor and exceptional point term" (line 298) | scaduto1401 lines 83–88; `Y=S³` | Theorem 1.3: field of characteristic ≠ 2, `u²−64` on `⊕_(j=0..3)`; `Î(S³)=0` gives `0⊗H_*(S³)⊕H_*(pt)`, rank 1 = `I#(S³)` | holds; description agrees |
| 4 | "genus-two zero-correction calibration" (lines 225, 231) | cs1612 lines 31–32, `g=1,2,3` | exponent `2⌈g/2⌉−1`: `g=1`→1, `g=2`→1 (so `u²−64=0`), `g=3`→3 | holds; description agrees |
| 5 | "Division by two occurs only after localization" (lines 269–276) | projector over `Z[1/2]` | `((μ+2)/4)²=(μ²+4μ+4)/16=(4μ+8)/16=(μ+2)/4` when `μ²=4`; denominators 4, 16 need 2 inverted | holds |
| 6 | Summary block: "odd integral surface pairing"; homology spheres separate (lines 32, 76) | `H₂(Y;Z)=0`; `RP³` | no class to pair oddly, so not admissible; `RP³`: `w₂≠0`, `H₂(RP³;Z)=0`, a reducible flat connection | holds; block agrees |
| 7 | "matching GQ1" surface dimension (line 368) | `r=2`, `g=0,1,2` | `(2g−2)(r²−1)=6g−6`: −6, 0, 6; `−3χ(Σ_g)`: −6, 0, 6 | holds |

The rows of the previous reviews for untouched statements stand as in the previous review, of 0b47a8f.

- Description against the head: 3 summary-block paragraphs and 7 prose paragraphs read; every mathematical sentence was located in the README (lines 3, 21, 68, 225, 255, 263, 269–276, 298, 373, 407, 411, 441, 455, 461, 479, 485, 487, 512); two paragraphs fail (R01, R02). Title: agrees with IF5, IF7a, IF7b.
- "Only TauCetiRoadmap/InstantonFloerTheory/ is changed" and "exactly three owner files": `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Gate at 0b47a8f, my run: every counter 0, `OK`; the worker's run also reports `build=0`. `lake env lean` on `Suggested.lean`: exit 0, no output. The file declares nothing, so there is nothing to `#check` or probe.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Merge order: IndexTheory 11, FourManifolds 137, FukayaTheory 230, GaugeQuiltFieldTheory 300, InstantonFloerTheory 301.
- Cross-roadmap citations resolved at the open heads: FourManifolds Layer 5 with 5.1, 5.2, 5.3 (README lines 2146–2474 at its head), GaugeQuiltFieldTheory GQ1 and GQ5 (lines 46, 265), FukayaTheory FK2 (line 309). The resolver lists nothing unresolved; `scratch/overlaps.md` lists no dropped id, no second copy and no other pull request changing this roadmap.
- Source locators checked this round: 2 (scaduto1401 lines 83–88; cs1612 lines 29–32). The seeded sample falls outside the changed passages (none changed).
- Overlap check: read GaugeQuiltFieldTheory, FourManifolds, FukayaTheory, DGFloer, YangMillsConnectionsAndCaloricGauge, HeegaardFloer, SeibergWittenTheory, TaubesGromov; odd-degree surface moduli `M(P,δ)`: GaugeQuiltFieldTheory GQ1; compact/local SU(2) ASD core: FourManifolds Layer 5; abstract determinant package: HeegaardFloer F0; instanton Floer homology, ASD cobordism maps and cylindrical ASD gluing: this roadmap (GaugeQuiltFieldTheory line 4 and HeegaardFloer line 1528 say so). Nothing has two owners.
- Source independence: changed passages only; 0 passages changed, so none compared; largest share Daemi–Fukaya–Lipyanskiy (dfl07032 with dfl07038), about 20 of 85 locators; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- Donaldson, *Floer Homology Groups in Yang–Mills Theory*, and Donaldson–Kronheimer, *The Geometry of Four-Manifolds*: not in an open repository; their locators are carried from the previous reports.
- The description's statements about its own process (a second reviewer, "twenty text operations", CI run 39603077094 and its job counts): no file of the head records them.

## Source issues

- none

## For the human reviewers

- **Licence.** Donaldson's book (about 13 locators) and Donaldson–Kronheimer (about 6) are cited by section and page without an open text (`TauCetiRoadmap/InstantonFloerTheory/README.md` lines 520–521); wording and arrangement were never compared with them.
