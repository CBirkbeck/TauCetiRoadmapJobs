# Review of PurityOfBranchLocus (pull request #1808 at a96d197)

**Verdict:** needs changes

This is an incremental re-review of 0 changed lines since c9403e2. The folder's three files are byte-identical to the ones the previous review read: `README.md` md5 `b15ec1a8…`, `Suggested.lean` `88030381…`, `metadata.toml` `6a3b076b…`. `git diff --stat c9403e2 HEAD -- TauCetiRoadmap/PurityOfBranchLocus` is empty, and the folder's last commit is still fd065fbe. `lake-manifest.json` and `lean-toolchain` are unchanged against both c9403e2 and main. The pins are therefore still Tau Ceti 2fd255d9 and Mathlib as before.

Since c9403e2 the branch changed only `TauCetiRoadmap/LocalPurity/{README.md,Suggested.lean}` and `TauCetiRoadmap/BordismFormalGroups/{README.md,Suggested.lean}`. Both are folders of the pull request's own and get their own reviews. This report checks them only where this roadmap cites them (see *Verified sound*). The single finding is the previous report's R01, still unrepaired. It concerns the branch, not this folder's text.

## R01 (P3) — gate: two files outside the pull request's named roadmap folders

- **Location.** Two files, each with one changed line:
  - `Completed/ArithmeticDirichletSeries/README.md` line 331 (commit e591d103), "`LFunctions` consumes this package and supplies its own character-specific continuation";
  - `TauCetiRoadmap/SymplecticGeometry/README.md` line 77 (commit 61e5385e), "boundary and sign adapters consumed by HeegaardFloer and consumed by DGFloer".
- **Claim.** The brief names fifteen folders as the pull request's own. An edit outside them is a finding, and no acceptance is possible while the gate fails.
- **Witness.**
  - The worker's gate at a96d197 reports `outside-folder=2 … FAIL`.
  - `git diff --stat origin/main...HEAD` (main at 28c3fca), excluding the fifteen folders, lists exactly these two files.
  - `git log origin/main..HEAD` on them lists e591d103 and 61e5385e.
  - The description of #1854 claims both edits as its own: its first two bullets are "ArithmeticDirichletSeries → LFunctions" and "SymplecticGeometry → DGFloer".
- **Repair.** Drop the two one-line commits e591d103 and 61e5385e from this branch, since they are #1854's declared changes. The other option is to list `Completed/ArithmeticDirichletSeries` and `TauCetiRoadmap/SymplecticGeometry` in this pull request's description as its own folders. For the first option I checked three facts at this head: each commit touches only its one file (`git show --stat`); it is the only change to that file since the merge-base a891cd1; and main has not changed either file since that merge-base. So dropping both commits leaves `git diff --stat origin/main...HEAD` empty outside the named folders.

## Previous findings

- R01 — not repaired: at a96d197, `git diff origin/main...HEAD` still carries the two one-line edits (commits e591d103 and 61e5385e), and the worker's gate still reports `outside-folder=2 … FAIL`.

## Verified sound

**Gate.** The worker's gate at a96d197 reports:

`set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=2 source-material=0 build=0 FAIL`

- **Hand run.** I re-ran the gate by hand with `--base origin/main` and got the same scanner values, except `outside-folder=28`.
- **Why 28.** The hand run does not know the pull request's other fourteen folders. `git diff --name-only origin/main...HEAD` lists 30 files: 2 in this folder, 26 in the other fourteen named folders, and the 2 files of R01. 26 + 2 = 28.
- **Stray files.** The folder holds `README.md`, `Suggested.lean`, `metadata.toml` and nothing else.
- **Conflicts with main.** `git merge-tree --write-tree HEAD origin/main` conflicts only in `TauCetiRoadmap/ModularCurves/{README.md,Suggested.lean}` and `TauCetiRoadmap/TopologicalKTheory/README.md`. Since the merge-base a891cd1, main changed this folder only by adding the generated `PROGRESS.md` and `STATUS.md` (commit bbbde05a), which do not touch the branch's files.

**Dependency check at this head:**

```text
depcheck: 239 roadmaps, 2324 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean TauCetiRoadmap/PurityOfBranchLocus/Suggested.lean`, run at the pins at this head, exits 0. It prints exactly 16 messages, all `declaration uses 'sorry'`, one per theorem (lines 48, 57, 89, 97, 102, 107, 114, 122, 141, 158, 173, 194, 211, 220, 232, 247), and nothing else.

The worker's `signatures.md` lists 19 elaborated types with 0 dropped section binders. The file is unchanged, so the earlier binder-by-binder comparison with the README stands. So does the one-tactic padding probe, run on the file's own `import Mathlib`.

**The changes outside the folder since c9403e2, where this roadmap depends on them.**

- **LocalPurity.** This README cites LocalPurity §2.1 (`Algebra.etale_of_finiteNormal_of_isRegularLocalRing`, 0BMA (2)) at lines 12, 33, 56–58 and 264–266. It also cites LocalPurity Convention 5 at line 58. At a96d197:
  - LocalPurity README line 311 is still `### 2.1 Purity for regular local rings`, and its lines 313–318 state (2) with the torsion-free correction.
  - Convention 5 is still at lines 97–107.
  - The declaration is now `TauCetiRoadmap.LocalPurity.Algebra.etale_of_finiteNormal_of_isRegularLocalRing`, at `Suggested.lean` line 45. Before this change it was `…LocalPurity.etale_of_finiteNormal_of_isRegularLocalRing` at line 115. The new name matches this README's backticked `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` exactly.
  - Its hypotheses fit the use in this roadmap's §2.1 route, where `B` is a normal local domain, finite and injective over `A`, and étale over the punctured spectrum by induction: `IsRegularLocalRing A`, `2 ≤ ringKrullDim A`, `Module.Finite`, `Module.IsTorsionFree`, normal localizations at every prime of `B`, and étaleness at primes not over `𝔪`.
  - LocalPurity README lines 17 and 421–423 name this roadmap's §2.1 as the consumer.
  - The heads of #1807 and #1854 keep the same section and name: §2.1 at lines 263 and 410, Convention 5 at lines 119 and 108.
- **BordismFormalGroups.** Its diff since c9403e2 mentions neither this roadmap, purity, the branch or ramification locus, nor 0BMB.
- **SchemeAndStackFoundations.** Unchanged since c9403e2. §0.17 (line 1275) and §4.13 (line 5836) are where this README's lines 33, 59–65, 155 and 264–266 cite them.

**Citations.** The worker's scan lists 12 names found nowhere. Seven are this roadmap's own declarations, each declared in `Suggested.lean` at the lines above. One is the LocalPurity target above. Four are the `Pcf.*` provenance names at README 415–416, which earlier reports resolved at `d28f90d` and which are unchanged. No cross-roadmap citation is unresolved.

**Overlaps and ownership.**

- **Dropped and revision-only ids.** The overlap scan (main a169c04, 466 heads) lists no id this README cites that an open pull request drops, no id that only an open revision defines, and no id this pull request drops that others cite.
- **#1807 and #1854.** Both change this folder. With the scan's header line stripped, their copies are byte-identical to each other and to commit cbd8b936: README md5 `6df3ffd8…`, `Suggested.lean` equal to main's. This branch also contains cbd8b936, with a18764eb and fd065fbe on top, so the heads do not conflict in this folder whichever merges first. Their conflicts with this branch are in other folders, including LocalPurity, which have their own reviews.
- **Merge order.** This pull request's merge-order paragraph places #1807 before it.
- **Declared gaps.** None.

**Library declarations opened at the pins this round.**

- Tau Ceti `AlgebraicGeometry/Morphisms/RamificationLocus.lean` lines 104, 111, 116, 170, 179, 197, 217, 225, 233 and 241.
- Tau Ceti `AlgebraicGeometry/Morphisms/StalkMap.lean` lines 201, 222, 324 and 363.
- Tau Ceti `AlgebraicGeometry/Morphisms/LocallyQuasiFinite.lean` line 107.
- Tau Ceti `AlgebraicGeometry/Morphisms/ElementaryEtale/Basic.lean` line 70.
- Each declaration was re-opened at 2fd255d9. The previous reports' list of 21 Mathlib and Tau Ceti declarations stands, because the pins and the file are unchanged.

**Sources.** I re-opened these locators in the cache at this head. Each is at the line the earlier reports cite:

- `stacks-0BMB` lines 2524–2533: Lemma 21.4, hypotheses (1)–(5) and the conclusion "étale at `x`".
- `stacks-0BMA` line 2503: Lemma 21.3, with `d ≥ 2` and (1)–(2).
- `stacks-02LK` line 5984: Lemma 41.1.
- `sga1` lines 8359–8364: X 3.1, printed page 212, with the I 9.5 (ii) remark at line 8362.

The seeded sample (§§0.1, 0.2, 0.3, 1.1, 2.1, 2.2 and 2.3, README lines 111, 129, 159, 225, 242, 280 and 303) lies wholly in unchanged text. The locator-by-locator verification of the earlier reports carries over. That verification covers 02G4, 02GF, 02GI, 02GU, 01TD, 025P, 039S, 025N, 0258, 02LK, 036W, 00UJ, 0BMB, 0BMA, 0BJH, 0BJF, 0EA4, 0ECD, 02G3, 01WM, 00Q9, 00H8, 00ON, 02JU, 0AFS, 0567 and sga1 X 3.1 and I 9.5.

**Adversarial table.** The diff leaves every statement untouched. Each row below is carried forward from the previous report (PRREVIEW-PurityOfBranchLocus~38, *Adversarial table*), which carries ~30's values. There is no new row.

Notation:
- `k` is a field.
- "Frobenius" is `t ↦ tᵖ` on `𝔸¹_k` in characteristic `p`.
- "Square map" is `(x,y) ↦ (x², y)` on `𝔸²` in characteristic `≠ 2`.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §0.3 Check 1 (closed immersion `Spec k → 𝔸¹_k` at `0`) | the one point `x` of `Spec k`; its image | ramification locus `∅` (`Ω = 0`); non-étale locus `{x}` (not flat over `k[t]_(t)`); branch locus `f '' ∅ = ∅`; `f '' {x} = {0}` | the wrong model `branchLocus = f '' nonEtaleLocus` gives `{0} ≠ ∅` and is excluded (~38) | none |
| §0.3 Check 2 (Frobenius) | `Ω_{k[t]/k[tᵖ]}`; freeness; lying over | `Ω = k[t]dt ≠ 0` at every prime: ramification locus `𝔸¹`; free of rank `p`: non-étale locus `𝔸¹`; branch locus `𝔸¹`; `hne` of §2.3 fails | correct negative control (~38) | none |
| §2.3 `ramificationLocus_eq_nonEtaleLocus` against the Frobenius | finite, dominant, `X` normal, `Y` regular | both loci `= 𝔸¹` | theorem and Check agree (~38) | none |
| Provenance rows 2.1 and 0.3/2.3 | the six qualified names at `d28f90d` | three `Pcf.Stacks.*` purity names; `Pcf.nonEtaleLocus := (Algebra.etaleLocus R S)ᶜ`; `Pcf.isClosed_nonEtaleLocus`; `Pcf.codim_eq_one_of_algebra` | correct (~38) | none |
| `unramifiedAt_iff_stalkMap`, `etaleAt_iff_stalkMap` | immersion; `L = K(t^{1/p})`; `𝔸¹ → Spec k` | the iff holds both ways in each case | sound (~38) | none |
| `ramificationLocus`, `nonEtaleLocus`, `branchLocus` | Frobenius; square map; immersion | `𝔸¹/𝔸¹/𝔸¹`; `V(x)/V(x)/V(u)`; `∅/{0}/∅` | sound (~38) | none |
| `ramificationLocus_eq_stacks`, `isClosed_ramificationLocus`, `isClosed_branchLocus`, the three `_spec` comparisons | pointwise; `Spec K[x₁, x₂, …]`; open immersion; standard étale and `R[x]`; `comap '' V(x)` | pointwise agreement; closed anyway; `∅`; `Ω_{S_𝔮/R_𝔭} = Ω_{S_𝔮/R}`; `V(u)` | sound (~38) | none |
| §0.1–0.2 README-only targets and Convention 5 | DVR `B = C_𝔮` over `k[t]_(t)`; `k → k[t]_(t)`; the cusp with its étale cover; `A → A/(x,y)`; completion | `1 = 1`; `0 ≠ 1`, not étale; both non-regular; not flat; completion excluded | sound (~38) | none |
| §1.1 *exists_elementaryEtale_finite_of_isolated* (02LK), *etale_of_etale_comp_surjective* (036W) | `t ↦ t²` at the origin; `k[x,y]/(xy) → 𝔸¹`; `g = id` with a Zariski cover | `U = S`, `V = X`; not quasi-finite at the origin; holds | sound (~38) | none |
| `exists_etale_of_formallyUnramified_stalk_codimOne`, `etaleAt_of_unramifiedAt_codimOne`, `isEtaleAt_of_purity` (0BMB) | `d = 1` DVRs; constant map; quotient; square map and Frobenius; affine `𝔮 = (x,y)` vs `(x − 1, y)` | étale; fails (3); fails (2); fails (5); the right prime | sound (~38) | none |
| `etale_of_etaleAt_codimOne` (§2.2) | purely inseparable `L/K`; square map; `id` | RHS vacuous and `hgen` false; both sides false at the generic point of `V(x)`; true | sound (~38) | none |
| `ringKrullDim_stalk_eq_of_locallyQuasiFinite`, `ramificationLocus_eq_nonEtaleLocus`, `ringKrullDim_stalk_eq_one_of_maximal_ramificationLocus`, `…_branchLocus` (§2.3) | square map; cusp; generic point of `V(x)`; generic point `w` of `V(u)`; quotient | `2 = 2`; `1 = 1` without normality of `X`; `d = 1`; `dim 𝒪_{Y,w} = 1`; excluded by regularity of `Y` | sound (~38) | none |

**Remark on untouched text** (not a finding of an incremental re-review): the pinned Tau Ceti 2fd255d9 already declares several objects of this roadmap's Layer 0 and §2.3.

- `AlgebraicGeometry/Morphisms/RamificationLocus.lean`:
  - the three loci with the same bodies (lines 104, 111, 116);
  - `ramificationLocus_eq_setOf_not_exists`, `isClosed_ramificationLocus`, `isClosed_branchLocus` and the three `_specMap` comparisons (lines 170, 179, 217, 225, 233, 241);
  - `ramificationLocus_eq_nonEtaleLocus` for any normal target (line 197).
- `StalkMap.lean`: `unramifiedAt_iff_stalkMap` and `etaleAt_iff_stalkMap` (lines 201, 222).
- `LocallyQuasiFinite.lean`: `Scheme.Hom.ringKrullDim_stalk_eq_of_quasiFiniteAt` (line 107).

I ran a scratch probe that adds `import TauCeti.AlgebraicGeometry.Morphisms.RamificationLocus`. In it, eight of `Suggested.lean`'s theorems close with one `exact`, and the definitions agree by `rfl`. The reviews of this folder in #1807 (~31, ~37) raise this as their R01.

## Not verifiable

- None. Earlier reviews read the provenance repository at commit `d28f90d`, and the table is unchanged. Nagata 1959 and Zariski 1958 are cited only as the origin of the theorem, with no claim that carries a locator.

## Source issues

- **Misprint** in sga1 at X 3.1, remark after the theorem, printed page 212: the source says the condition `Z ≠ X` means the finite extension `R(Z)/R(X)` is separable; it should be the extension `R(X)/R(Y)` of function fields; affects nothing.
