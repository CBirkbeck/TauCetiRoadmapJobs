# Review of PurityOfBranchLocus (pull request #1808 at 214ace5)

**Verdict:** needs changes

This is an incremental re-review of 0 changed lines since a96d197.

- **This folder is unchanged.** `git diff --stat a96d197 HEAD -- TauCetiRoadmap/PurityOfBranchLocus` is empty. The folder's last commit is still fd065fbe. Its three files have the same md5 sums as at a96d197: `README.md` `b15ec1a8…`, `Suggested.lean` `88030381…`, `metadata.toml` `6a3b076b…`.
- **The pins are unchanged.** `lake-manifest.json` and `lean-toolchain` match both a96d197 and main. Tau Ceti is at 2fd255d9 and Mathlib at 1b1ccf4b.
- **What changed elsewhere.** Since a96d197 the branch changed seven of its own folders: AlgebraicCurves, AlgebraicTopology, BordismFormalGroups, CharacteristicClasses, ComplexKahlerGeometry, LocalPurity (README only), ModularCurves and PadicFunctionalAnalysis. Each has its own review. This report checks them only where this roadmap cites them (see *Verified sound*).
- **Findings.** There is one: the previous R01, still not repaired. It is about the branch, not about this folder's text.

## R01 (P3) — gate: two files outside the pull request's named roadmap folders

- **Location.** Two files, each with one changed line:
  - `Completed/ArithmeticDirichletSeries/README.md` line 331 (commit e591d103): "`LFunctions` consumes this package and supplies its own character-specific continuation";
  - `TauCetiRoadmap/SymplecticGeometry/README.md` line 77 (commit 61e5385e): "boundary and sign adapters consumed by HeegaardFloer and consumed by DGFloer".
- **Claim.** The brief names fifteen folders as this pull request's own. An edit outside them is a finding, and the gate fails while either edit remains.
- **Witness.**
  - The worker's gate at 214ace5 reports `outside-folder=2 … FAIL`.
  - Main is at a94a93c and the merge-base is a891cd1. `git diff --stat origin/main...HEAD`, with the fifteen folders excluded, lists exactly these two files (2 insertions, 2 deletions).
  - `git log origin/main..HEAD` on the two files lists e591d103 and 61e5385e.
  - The open-pull-request index lists `ArithmeticDirichletSeries` and `SymplecticGeometry` among #1854's folders, so these edits belong to #1854.
- **Repair.** Drop commits e591d103 and 61e5385e from this branch. Alternatively, name `Completed/ArithmeticDirichletSeries` and `TauCetiRoadmap/SymplecticGeometry` as this pull request's own folders in its description. I checked the first option at this head:
  - each commit touches only its one file;
  - it is the only change to that file since a891cd1;
  - main has not changed either file since then (`git log HEAD..origin/main` on the two files is empty).

  So after the drop, `git diff --stat origin/main...HEAD` is empty outside the named folders.

## Previous findings

- R01 — not repaired: at 214ace5, `git diff origin/main...HEAD` still carries the one-line edits of e591d103 (`Completed/ArithmeticDirichletSeries/README.md` line 331) and 61e5385e (`TauCetiRoadmap/SymplecticGeometry/README.md` line 77), and the gate reports `outside-folder=2 … FAIL`.

## Verified sound

### Gate

The worker's gate at 214ace5 reports:

`set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=2 source-material=0 build=0 FAIL`

- **My hand run** (`gate … --base origin/main`) gives every scanner the same value except `outside-folder=29`. The hand run does not know the other fourteen named folders.
- **Why 29.** `git diff --name-only origin/main...HEAD` lists 31 files: 2 in this folder, 27 in the other fourteen named folders, and the 2 files of R01. 27 + 2 = 29.
- **Stray files.** The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- **Merge with main.** `git merge-tree --write-tree HEAD origin/main` conflicts only in `TauCetiRoadmap/ModularCurves/{README.md,Suggested.lean}` and `TauCetiRoadmap/TopologicalKTheory/README.md`. Since a891cd1, main changed this folder only by adding the generated `PROGRESS.md` and `STATUS.md`, which do not touch the branch's files.

### Dependency check at this head

```text
depcheck: 236 roadmaps, 2260 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

### Elaboration

I ran `lake env lean TauCetiRoadmap/PurityOfBranchLocus/Suggested.lean` at the pins at this head. It exits 0 and prints exactly 16 messages, all `declaration uses 'sorry'`. They come one per theorem, at lines 48, 57, 89, 97, 102, 107, 114, 122, 141, 158, 173, 194, 211, 220, 232 and 247. There is no other output.

- The file declares 19 names: the 16 theorems and three `def`s (lines 68, 76, 82). This matches the worker's `signatures.md`: 19 elaborated types, 0 dropped section binders.
- The file is byte-identical to the one compared binder by binder with the README in earlier rounds, so that comparison and the one-tactic padding probe stand.

### What this roadmap relies on in the changed folders

**LocalPurity** (README changed since a96d197 in edc8e6a7 and 43224230; `Suggested.lean` unchanged). This README cites LocalPurity §2.1 (`Algebra.etale_of_finiteNormal_of_isRegularLocalRing`, 0BMA (2)) at lines 12, 33, 56–58 and 264–266, and LocalPurity Convention 5 at line 58. At 214ace5:

- LocalPurity README line 579 is `### 2.1 Purity for regular local rings`. Lines 581–586 state (2) with the correction of Convention 5.
- Convention 5 is at line 113. It still records the torsion-freeness correction and the counterexample `A × A/𝔪`.
- The declaration `TauCetiRoadmap.LocalPurity.Algebra.etale_of_finiteNormal_of_isRegularLocalRing` is at LocalPurity `Suggested.lean` line 45, under `namespace TauCetiRoadmap.LocalPurity` (line 23).
- Its hypotheses are `IsRegularLocalRing A`, `2 ≤ ringKrullDim A`, `Module.Finite A B`, `Module.IsTorsionFree A B`, normal localizations at every prime of `B`, and `Algebra.IsEtaleAt A q` for every prime `q` not over `maximalIdeal A`. These are what this README's §2.1 route supplies: `B` is a normal local domain, finite and injective over `A`, hence torsion free, and étale over the punctured spectrum by the induction.
- LocalPurity lines 18 and 723–724 still name this roadmap's §2.1 as the consumer.
- Comparing a96d197 with 214ace5 section by section:
  - Convention 5, from its heading to Convention 6, is byte-identical (md5 `a5323bf8…` on both sides). It only moved from line 97 to line 113.
  - In §2.1, from `### 2.1` to `### 2.2`, the only change is that the three Check bullets lose their `test_…` labels (lines 27, 30 and 34 of the section). The statement, the hypotheses and the *Needs:* line are unchanged.

**SchemeAndStackFoundations** is unchanged since a96d197 (no commit in `a96d197..HEAD` touches it). §0.17 is at line 1275 and §4.13 at line 5836. Lines 5915 and 7695 still name this roadmap's §§0.3 and 2.1 as consumers.

**The other six changed folders.** Their diffs since a96d197 do not mention this roadmap, 0BMB, Zariski–Nagata or the ramification locus. AlgebraicCurves uses "branch locus" only for its own hyperelliptic examples (diff lines 2068–2069 and 2782), with no citation of this roadmap.

### Citations

The worker's scan lists 12 names found nowhere. All were resolved again:

- Seven are this roadmap's own declarations in `Suggested.lean`: lines 141, 158, 194, 89, 247, 232 and 173.
- One is the LocalPurity target above.
- Four are the `Pcf.*` provenance names at README lines 415–416. They are unchanged and were resolved in earlier reports at `d28f90d`.

No cross-roadmap citation is unresolved.

### Overlaps and ownership

- **Dropped and revision-only ids.** The overlap scan (main d72684a, 457 heads) finds no id this README cites that an open pull request drops. It also finds no id that only an open revision defines, and no id this pull request drops that others cite.
- **#1807 and #1854 also change this folder.**
  - I fetched their copies with `roadmaps show --pr`. With the header line stripped, their README md5 is `6df3ffd8…` and their `Suggested.lean` md5 is `3a6c6794…`.
  - The README copy is byte-identical to commit cbd8b936's. The `Suggested.lean` copy is byte-identical to both cbd8b936's and main's.
  - This branch contains cbd8b936, with a18764eb and fd065fbe on top. So the heads do not conflict in this folder, whichever merges first.
  - The description's merge-order paragraph places #1807 before this pull request.
- **Declared gaps.** None.

### Library declarations re-opened at the pins

- Tau Ceti 2fd255d9, `AlgebraicGeometry/Morphisms/RamificationLocus.lean`, lines 104, 111, 116, 170, 179, 197, 217, 225, 233 and 241.
- Tau Ceti 2fd255d9, `StalkMap.lean`, lines 201 and 222.
- Tau Ceti 2fd255d9, `LocallyQuasiFinite.lean`, line 107.

Each declaration is at its recorded line with the recorded name. Earlier reports list 21 Mathlib and Tau Ceti declarations; that list stands, since the pins and the file are unchanged.

### Sources

I re-opened these locators in the cache. Each is at the line earlier reports cite:

- `stacks-0BMB` lines 2524–2533: Lemma 21.4, with hypotheses (1)–(5) and the conclusion "étale at `x`";
- `stacks-0BMA` line 2503: Lemma 21.3, with `d ≥ 2`;
- `stacks-02LK` line 5984: Lemma 41.1;
- `sga1` lines 8359–8364: X 3.1, with the I 9.5 (ii) remark at lines 8361–8362.

The seeded sample lies wholly in unchanged text: §§0.1, 0.2, 0.3, 1.1, 2.1, 2.2 and 2.3, at README lines 111, 129, 159, 225, 242, 280 and 303, the same lines as at a96d197. So the earlier locator-by-locator verification carries over. It covers 02G4, 02GF, 02GI, 02GU, 01TD, 025P, 039S, 025N, 0258, 02LK, 036W, 00UJ, 0BMB, 0BMA, 0BJH, 0BJF, 0EA4, 0ECD, 02G3, 01WM, 00Q9, 00H8, 00ON, 02JU, 0AFS, 0567, and sga1 X 3.1 and I 9.5.

### Adversarial table

The diff leaves every statement untouched. The rows are carried forward from the previous report (PRREVIEW-PurityOfBranchLocus~43, *Adversarial table*), which carries ~38's values.

I recomputed four rows this round, marked "(r53)":

- the square map: `Ω = k[x,y]/(2x)`, free over `k[x², y]` on `1, x`;
- the quotient by `±1`;
- the Frobenius: `Ω = k[t]dt`;
- `ℤ_(p)[√p]`: `Ω = B/(2u)` at `(u)`.

Notation:

- `k` is a field.
- "Frobenius" is `t ↦ tᵖ` on `𝔸¹_k` in characteristic `p`.
- "Square map" is `(x,y) ↦ (x², y)` on `𝔸²` in characteristic `≠ 2`.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §0.3 Check 1 (closed immersion `Spec k → 𝔸¹_k` at `0`) | the point `x` of `Spec k` and its image | ramification locus `∅` (`Ω = 0`); non-étale locus `{x}` (not flat over `k[t]_(t)`); branch locus `f '' ∅ = ∅`; `f '' {x} = {0}` | the wrong model `branchLocus = f '' nonEtaleLocus` gives `{0} ≠ ∅` and is excluded (~38) | none |
| §0.3 Check 2 (Frobenius) | `Ω_{k[t]/k[tᵖ]}`; freeness; lying over | `Ω = k[t]dt ≠ 0` at every prime, so the ramification locus is `𝔸¹`; free of rank `p`; non-étale locus `𝔸¹`; branch locus `𝔸¹`; hypothesis `≠ univ` of §2.3 fails (r53) | correct negative control | none |
| §2.3 `ramificationLocus_eq_nonEtaleLocus` on the Frobenius | finite, dominant, `X` normal, `Y` regular | both loci `= 𝔸¹` | theorem and Check agree (~38) | none |
| §2.3 `ramificationLocus_eq_nonEtaleLocus`, `…_maximal_ramificationLocus`, `…_maximal_branchLocus` on the square map | `Ω_{k[x,y]/k[u,v]} = k[x,y]/(2x)`; flatness on the basis `1, x` | ramification locus `V(x)` = non-étale locus `V(x)`; generic point of `V(x)` has `dim 𝒪 = 1`; branch locus `V(u)`, `dim 𝒪_{Y,(u)} = 1` (r53) | sound | none |
| §2.1 / §2.3 Check: target not regular (`𝔸² → Spec k[x², xy, y²]`) | `±1` acts freely off the origin; embedding dimension at the origin | étale off the origin; at the origin the target has embedding dimension 3 > 2 = dim, so it is not regular and the map is not étale; ramification locus `{0}`, codimension 2 (r53) | correct negative control for regularity of `Y` | none |
| §2.1 `exists_etale_of_formallyUnramified_stalk_codimOne` with `d = 1`: `ℤ_(p)[√p]/ℤ_(p)` | (5) at `x' = x`, the only codimension-one generization of the closed point | `Ω = B/(2u) ≠ 0` at `(u)`, so (5) fails and the map is not étale (r53) | consistent | none |
| Provenance rows 2.1 and 0.3/2.3 | the six qualified names at `d28f90d` | three `Pcf.Stacks.*` purity names; `Pcf.nonEtaleLocus := (Algebra.etaleLocus R S)ᶜ`; `Pcf.isClosed_nonEtaleLocus`; `Pcf.codim_eq_one_of_algebra` | correct (~38) | none |
| `unramifiedAt_iff_stalkMap`, `etaleAt_iff_stalkMap` | immersion; `L = K(t^{1/p})`; `𝔸¹ → Spec k` | the iff holds both ways in each case | sound (~38) | none |
| `ramificationLocus`, `nonEtaleLocus`, `branchLocus` | Frobenius; square map; immersion | `𝔸¹/𝔸¹/𝔸¹`; `V(x)/V(x)/V(u)`; `∅/{0}/∅` | sound (~38) | none |
| `ramificationLocus_eq_stacks`, `isClosed_ramificationLocus`, `isClosed_branchLocus`, the three `_spec` comparisons | pointwise; `Spec K[x₁, x₂, …]`; open immersion; standard étale and `R[x]`; `comap '' V(x)` | pointwise agreement; closed anyway; `∅`; `Ω_{S_𝔮/R_𝔭} = Ω_{S_𝔮/R}`; `V(u)` | sound (~38) | none |
| §0.1–0.2 README-only targets and Convention 5 | DVR `B = C_𝔮` over `k[t]_(t)`; `k → k[t]_(t)`; the cusp with its étale cover; `A → A/(x,y)`; completion | `1 = 1`; `0 ≠ 1`, not étale; both non-regular; not flat; completion excluded | sound (~38) | none |
| §1.1 *exists_elementaryEtale_finite_of_isolated* (02LK), *etale_of_etale_comp_surjective* (036W) | `t ↦ t²` at the origin; `k[x,y]/(xy) → 𝔸¹`; `g = id` with a Zariski cover | `U = S`, `V = X`; not quasi-finite at the origin; holds | sound (~38) | none |
| `exists_etale_of_formallyUnramified_stalk_codimOne`, `etaleAt_of_unramifiedAt_codimOne`, `isEtaleAt_of_purity` (0BMB) | `d = 1` DVRs; constant map; quotient; square map and Frobenius; affine `𝔮 = (x,y)` vs `(x − 1, y)` | étale; fails (3); fails (2); fails (5); the right prime | sound (~38) | none |
| `etale_of_etaleAt_codimOne` (§2.2) | purely inseparable `𝔽_p(t)[u]/(uᵖ − t)`; square map; `id` | 0-dimensional, so the right side is vacuous, `Ω = L du ≠ 0` and `hgen` is false; both sides false at the generic point of `V(x)`; true | sound (~38) | none |
| `ringKrullDim_stalk_eq_of_locallyQuasiFinite` (§2.3) | square map; cusp | `2 = 2`; `1 = 1` without normality of `X` | sound (~38) | none |

### Remark on untouched text

This is not a finding of an incremental re-review. The pinned Tau Ceti 2fd255d9 already declares several of this roadmap's Layer 0 and §2.3 objects (`RamificationLocus.lean`, `StalkMap.lean` and `LocallyQuasiFinite.lean`, lines as above). The reviews of this folder in #1807 raise this as their R01.

## Not verifiable

- None. Nagata 1959 and Zariski 1958 are cited only as the origin of the theorem, with no claim that carries a locator.

## Source issues

- **Misprint** in sga1 at X 3.1, remark after the theorem, printed page 212: the source says the condition `Z ≠ X` means the finite extension `R(Z)/R(X)` is separable; it should be the extension `R(X)/R(Y)` of function fields; affects nothing.
