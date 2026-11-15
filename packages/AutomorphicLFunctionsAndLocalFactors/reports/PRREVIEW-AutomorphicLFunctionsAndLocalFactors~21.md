# Review of AutomorphicLFunctionsAndLocalFactors (pull request #924 at 19069a6)

**Verdict:** needs changes

## R01 (P3) — The description says rank-one Hecke continuation is not a separate argument; the head consumes one

**Location:** PR description, `roadmap-summary` block, "Approach and generality": “Continuation for arbitrary unitary Hecke characters is the n = 1 case of the Godement–Jacquet matrix integral, not a separate rank-one argument.”
**Claim:** The head takes that continuation from a supplier's rank-one argument; the Godement–Jacquet target only specializes to it at `n=1` and lists it as a need.
**Witness:** `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:27` “AL.1.6.2, Hecke continuation and functional equation: AnalyticNumberTheoryPartI §2.3a”; `:256` “The rank-one global part uses only AL.0, AL.1's local prefix and AnalyticNumberTheoryPartI §2.3a”; `:1378` *Needs* “§2.3a, for `n=1`”.
**Repair:** Replace the sentence with: “Continuation and functional equations of Hecke L-functions of unitary idele-class characters are consumed from AnalyticNumberTheoryPartI §2.3a; the Godement–Jacquet matrix integral gives continuation in every rank and specializes to that function at n = 1.”

## Previous findings

- R01 — repaired: the description now reads “This PR adds the new roadmap `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/`: `README.md`, `Suggested.lean` and `metadata.toml` (3,307 added lines).”
- R02 — repaired: the description now reads “the targeted Lake build succeeds with `sorry` warnings and Mathlib module-system advisories; direct Lean elaboration emits only `sorry` warnings”.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| PR text: new roadmap, size | Folder at base and head | Base: 0 files. Head: 2595 + 711 + 1 = 3307 insertions, 0 deletions; description says 3,307 added lines | Agrees | None |
| PR text: build validation | Targeted build; direct elaboration | Build: exit 0, 14 `sorry` warnings + 2 module-system advisories. Direct: exit 0, 14 `sorry` warnings, 0 others | Agrees | None |
| PR text: rank-one Hecke continuation | README lines 13, 27, 256, 1366, 1378 against the summary sentence | Description: no separate rank-one argument. Head: owner is AnalyticNumberTheoryPartI §2.3a (Hecke's method), needed by AL.2.4.1 at `n=1` | Contradicted | R01 |
| AL.2.4.1 at `n=1` (cited by R01) | `K=ℚ`, `ω=1`, `Φ=exp(−πx²)⊗1_Ẑ` | `Z(s)=Γ_ℝ(s)ζ(s)`: residues −1 at 0, +1 at 1; `A=|D_K|N𝔣=1`, `ε=W·A^(1/2−s)=1`; §2.3a gives the same | Consistent | None |
| AL.3.5.1 theta–Mellin sample | `n=2`, `|det g|=3`, `θ₀=5`, `|a|=2`, `η=1`, `s=1` | With exponent `ns`: 3·5·2² = 60; with exponent `s`: 3·5·2 = 30 | Normalization discriminates | None |

Rows for untouched statements stand as in the previous review, of `19069a6`.

- Incremental scope: 0 folder lines changed since `19069a6`; 0 files changed outside the folder; title, prose and `roadmap-summary` read against the head.
- Description claims resolved at the head: 11 (new roadmap and line count; supplier sections §§5.3g, 5.3h, 5.3j and §2.3a; three folders on main; consumers at README line 2505; `tateLocalConstant` comparison at 188 and 909; ideal-of-test-integrals and period-class sentences at 5; Dirac reuse at 74; multiplicity one at AL.3.4; top layers AL.4–AL.5; validation), 10 agree, 1 contradicted (R01).
- Cross-roadmap citations resolved on main (8ad4192): AnalyticNumberTheoryPartI §2.3a (README line 1356); AnalyticNumberTheoryPartII §5.3g, §5.3h, §5.3j (lines 681, 698, 719); LFunctions, ZerosOfLFunctions and ReductiveGroupsPartII are folders there.
- Source sample: 1 locator checked, CogdellColumbia §1.1.3, printed p.4, lines 256–269: Schwartz–Bruhat `Φ`, unitary `η`, `Re(s)>1`, the `ξ=0` term removed and exponent `ns` agree with AL.3.5.1.
- Gate rerun: every check 0, `OK`; targeted build exit 0; direct elaboration exit 0 with `sorry` the only warning.

```text
gate AutomorphicLFunctionsAndLocalFactors: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 247 roadmaps, 2249 edges, 0 problem(s)
```

Overlap check: no folder change, so the scopes of AutomorphicSpectralTheory, GL2AutomorphicRepresentationsAndTransfer, AutomorphicLFunctionsAndLocalFactorsPartII, AutomorphicFormsOnReductiveGroups, MetaplecticAutomorphicForms, AnalyticNumberTheoryPartII, AnalyticNumberTheoryPartI and SmoothRepresentationsOfLocalGroups stand as read in the previous review; of them AnalyticNumberTheoryPartI §2.3a was reopened and owns rank-one Hecke continuation (R01); the overlap listing reports no shared, dropped or conflicting id.

Source independence: changed passages only — 0 changed passages, 0 new comparisons with 0 sources; the sampled formula was rechecked against CogdellColumbia, none shared; no layer added, removed or reordered, so the contents comparison was not reopened.

## Not verifiable

- The inaccessible-source limitations of the earlier reviews stand; R01 depends on no source.

## Source issues

- none

## For the human reviewers

- none
