# Review of ChromaticHomotopyTheory (pull request #1643 at 29867f9)

**Verdict:** accepted

This is an incremental re-review of the 2 lines changed since 9d0ba64: the sentence that opens `## Exact supplier contracts` (README:61) is rewritten so that it fixes the Tau Ceti and Mathlib revisions at which the cited declarations are read without attributing them to any manifest. The rewrite is the repair the previous report asked for, word for word in substance. It is true at this head, stays true after any later pin bump, names the same two hashes, and still covers every backticked library name in the README. No finding remains, new or carried. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with no output. The roadmap folder is ready for a human's final approval.

## Previous findings

- R01 — repaired: README:61 now reads "Every declaration, module and file named in this section, in the Scope paragraph on native carriers and in the §4.3 route is cited as it is at Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…`." The clause "the revisions the content repository's manifest records" is gone, and the two hashes are kept.

No repair report for 9d0ba64 is on the board, and no finding was marked "not actionable in this package", so nothing is re-raised.

## Verified sound

### The changed passage (README:61)

- **No present-tense claim about a mutable file.** The sentence now says only that the names are cited "as [they are] at" two fixed revisions. At this head the branch's own `lake-manifest.json` still pins TauCeti `a91d3aaf…` and mathlib `6b7abb3c…`; the sentence no longer contradicts it, because it no longer mentions a manifest. This was the whole of the previous R01.
- **The hashes.** Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` and Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` are exactly the two `rev` entries of main's `lake-manifest.json` (main 623f5d6, lines 10 and 22), and the content checkout's `.lake/packages/TauCeti` and `.lake/packages/mathlib` have those commits checked out (`git rev-parse HEAD` on each).
- **Coverage.** Every backticked library name in the README is on line 17, 65, 67, 71, 73, 103 or 409. Line 17 is the Scope paragraph that ends "These are the native algebraic carriers"; lines 61–113 are `## Exact supplier contracts`; line 409 is §4.3's `*Proof route.*`. So 7 of 7 lines fall inside the three places the sentence names. The only other backticked line, 137, names `README.md` and `Suggested.lean`, which are not library citations.
- **Style.** The sentence is timeless, has no process word, no pull-request number and no path. Explicit revision hashes for library citations have precedent on main (EllipticCohomology README:292, MorseTheory README:34), as the previous report recorded.

### Library declarations re-resolved at the declared revisions

Read in the content checkout, whose packages are at exactly the two hashes.

| Declaration | File and line at the declared revision | Agrees with the README's description? |
| --- | --- | --- |
| `FormalGroup` | Mathlib `RingTheory/FormalGroup/Basic.lean:57` | yes |
| `FormalGroup.IsComm` | same file `:75` | yes, a separate class |
| `FormalGroup.Point` | same file `:127`, `{f : MvPowerSeries σ R // PowerSeries.HasSubst f}` | yes, the substitution condition |
| `FormalGroup.𝔾ₐ`, `FormalGroup.𝔾ₘ`, `FormalGroup.map` | same file `:146`, `:162`, `:185` | present |
| `CategoryTheory.ObjectProperty.isLocal` | Mathlib `CategoryTheory/Localization/Bousfield.lean:55` | yes |
| `IsLocalization.flat` | Mathlib `RingTheory/Flat/Localization.lean:37` | yes |
| `Module.Flat.lTensor_exact` | Mathlib `RingTheory/Flat/Basic.lean:324` | yes |
| `CategoryTheory.ObjectProperty.IsSerreClass` | Mathlib `CategoryTheory/Abelian/SerreClass/Basic.lean:45` | yes |
| `WeierstrassCurve.formalGroup` | Tau Ceti `AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean:58`, `: FormalGroup R` | yes |
| `AddCommGrpCat.isKilledBySomePower` | Tau Ceti `AlgebraicTopology/SerreClass/PowerTorsion.lean:33` | yes |
| `TauCeti.SymmetricSpectrum` | Tau Ceti `AlgebraicTopology/Spectra/SymmetricSpectrum.lean:92`, inside `namespace TauCeti` (:74) | yes, a point-set `Mod … sphere` |

13 of 13 names resolve. The descriptions of them on lines 17, 65–73 and 103 are unchanged since the previous review, which checked each against its body.

### Gate, dependency direction, Lean

- **Gate.** Re-run with the brief's command at 29867f9, exit 0: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run on the same head adds `build=0`.
- **Dependency check.** The brief's command printed, in full:

  ```text
  depcheck: 235 roadmaps, 2257 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` from the worktree exited 0 with no diagnostics (31 s wall). The file is unchanged by the diff: `import Mathlib`, one module docstring, an empty namespace, no declarations. There is nothing for the `#check @name` comparison or the one-tactic probe to act on; there is no `set_option`, `lemma`, `True` placeholder or sorry'd data. The six headline theorems (§§3.1, 4.1, 4.2, 4.3, 4.4, 5.1) are listed in the docstring as not statable at the pins, each with the carrier it lacks, as the full reviews verified. The docstring's one Tau Ceti name, `TauCeti.SymmetricSpectrum`, exists at the declared revision (table above); the module imports no Tau Ceti module, so its build does not depend on which pin is checked out.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the roadmap folder is empty, `changes.md` lists no outside change, and the worktree is clean after the runs. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.

### Seeded sample, where it falls in the changed passage

| Target | Anchor read | As written | Supports the text? |
| --- | --- | --- | --- |
| 4.3 (its route is in the sentence's scope) | lmmt line 406 (Remark 2.12, page marker 10 at line 396): m=n+1 may be taken in Prop. 2.11, reducing to T(i)⊗K(π,r)=0 for r>i and finite π, through filtered colimits; csy line 3930 (Theorem 5.3.5, page marker 80 at line 3893): Σ∞₊ of a map with π-finite n-connected fibers is a T(n)-equivalence | §4.3 cites both at those locators; the route on README:409 passes to finite subgroups A_α before using the Serre class at d=p | Yes |
| 3.1, 4.1, 4.2, 4.4, 5.1 | untouched by the diff | as in the previous report | as in the previous report |

The README flags no locator as unverified, and the diff adds no source citation.

### Adversarial table

Rows for untouched statements carry forward from the previous report (PRREVIEW-ChromaticHomotopyTheory~12, which carries ~11, ~10 and ~9). The rows for the changed sentence give values computed now.

| Statement | Instances | Values on each side | Result / change |
| --- | --- | --- | --- |
| Conventions, Layers 0–2, §§3.1 (incl. the DGFloer contract letters), 4.1–4.4, 5.1, Part II rows, References | as in the previous report | as in the previous report | Pass (previous report) |
| README:73 `isKilledBySomePower d` at d=p, d=0 and the one-fixed-power non-example; README:409 i=0 step; README:17 description of `TauCeti.SymmetricSpectrum` | as in the previous report | as in the previous report | Pass (previous report) |
| README:61, the revisions against main's manifest | main 623f5d6 | sentence: `2fd255d9`, `1b1ccf4b`; main's `lake-manifest.json` lines 10, 22: `2fd255d9`, `1b1ccf4b` | Pass |
| README:61, truth at this head | head 29867f9 | the sentence makes no claim about the head's manifest; the head's `lake-manifest.json` pins `a91d3aaf`/`6b7abb3c`, which the sentence no longer mentions | Pass; previous R01 repaired |
| README:61, truth after a future pin bump | a hypothetical main whose manifest moves past `2fd255d9` | the sentence fixes the revisions the names are read at, independent of the manifest; the 13 names stay resolvable at those two commits | Pass |
| README:61, scope coverage | all backticked library names | 7 lines (17, 65, 67, 71, 73, 103, 409), 7 inside the three named places; line 137 has no library name | Pass |
| README:61, resolution | 13 names at the declared revisions | 13 of 13 found (table above) | Pass |

### Citations, overlaps, gaps

`citations.md` lists no unresolved cross-roadmap citation and no unresolved Lean name. `overlaps.md` lists no other pull request changing this roadmap, no dropped id and no id defined only by an open revision. The diff adds no construction and no cross-roadmap citation, so ownership against GeneralAlgebraicKTheoryPartII, BordismFormalGroups and RefinedTraceMethods, the closest in vocabulary, is unchanged from the full review. The declared gaps `p-local-finite-duality` (README:79) and `spectral-ringed-sites` (README:91), with the same slugs in `design/plan.json`, are untouched by the diff.

## Not verifiable

- HL13, Proposition 3.4.3, behind csy Lemma 5.1.7, is not in the source cache (unchanged from the previous reviews).
- Ravenel–Wilson, Theorem 9.2, was read only through csy line 3655 (unchanged).
- I did not read pull-request comments. No repair report for 9d0ba64 is on the board.

## Source issues

- none (the diff adds no source citation; the four items recorded in earlier reports, three in csy and one in lmmt, stand as recorded there).
