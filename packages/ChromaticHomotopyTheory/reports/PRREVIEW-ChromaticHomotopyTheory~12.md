# Review of ChromaticHomotopyTheory (pull request #1643 at 9d0ba64)

**Verdict:** needs changes

This is an incremental re-review of the 2 lines changed since ab9dffb: one sentence opening `## Exact supplier contracts` (README:61) that fixes the Tau Ceti and Mathlib revisions at which the cited declarations are read. The sentence repairs the previous R01. All 13 names it covers resolve at the stated revisions, and the descriptions of them in the README are correct there. The repair adds one P3: the sentence attributes the revisions to "the content repository's manifest", which is false against this head's own `lake-manifest.json` and will become false again at the next pin bump. There is no P1 or P2. The gate passes, the dependency check is clean and `Suggested.lean` elaborates with no output.

## R01 (P3) — The new pin sentence says the revisions come from a manifest that does not record them

**Location:** `TauCetiRoadmap/ChromaticHomotopyTheory/README.md:61`: "The development starts from these pinned APIs, read at the revisions the content repository's manifest records: Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…`."

**Claim:** The hashes are correct and are the part of the sentence that does the work. The clause "the revisions the content repository's manifest records" is a present-tense statement about a mutable file. At this head it is false: the repository's `lake-manifest.json` at 9d0ba64 pins different revisions. After a merge it is true only until main's next pin bump. Main already moved from `a91d3aaf` to `2fd255d9` while this pull request was open. The README's style rule calls for timeless text, with no reference to the current state, and this clause is a reference to the current state.

**Witness:** At 9d0ba64, `git show HEAD:lake-manifest.json` gives TauCeti `a91d3aafa8cd…` and mathlib `6b7abb3c7686…`. On main (db5e748) the manifest gives `2fd255d997f4…` and `1b1ccf4b088b…`. The sentence names the second pair and says "the content repository's manifest records" it.

**Repair:** Drop the clause and keep the hashes. For example: "The declarations, modules and files named in this section, in the Scope paragraph on native carriers and in the §4.3 route are cited as they are at Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` and Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`." I tested it on the same instance. The sentence then makes no claim about any manifest, it is true at this head and after any later bump, and all 13 names below still resolve at the two hashes.

## Previous findings

- R01 — repaired: README:61 now reads "read at … Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…`. Every declaration, module and file named in this section, in the Scope paragraph on native carriers, and in the §4.3 route is cited as it is at those revisions."

The previous R01 cited README:17, :71, :101 (now :103) and :407 (now :409). All four are inside the three places the sentence names, and both names that were absent at the branch pin resolve at `2fd255d9`. The same R01 also cited `Suggested.lean:9`. That docstring names `TauCeti.SymmetricSpectrum`, which exists at the declared revision. The module imports only `Mathlib` and declares nothing, so it builds the same at either Tau Ceti pin. No repair report for ab9dffb is on the board, and no finding was marked "not actionable in this package", so nothing is re-raised.

## Verified sound

### The changed passage (README:61)

- **Revisions.** The sentence names Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` and Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`. These are exactly the revisions in main's `lake-manifest.json` (db5e748), and they are checked out in the content checkout's `.lake/packages` (`git rev-parse HEAD` gives the same hashes).
- **Coverage.** Every backticked library name in the README is on line 17, 65, 67, 71, 73, 103 or 409. Line 17 is the Scope paragraph on native carriers, which ends "These are the native algebraic carriers". Lines 61–113 are `## Exact supplier contracts`, and line 409 is the §4.3 proof route. So 7 of 7 lines are inside the sentence's scope. The only other backticked line, 137, names `README.md` and `Suggested.lean`. No library citation is left outside the declared revisions.
- **Precedent.** Explicit revision hashes for library citations already appear on main, for example EllipticCohomology README:292 (Mathlib `6b7abb3c`) and MorseTheory README:34 (Tau Ceti `e8375e4f`). The form is accepted. Only the "manifest records" clause is at issue (R01).

### Library declarations opened at the declared revisions

| Declaration | File and line at the declared revision | What the README says of it | Agrees? |
| --- | --- | --- | --- |
| `FormalGroup` | Mathlib `RingTheory/FormalGroup/Basic.lean:57` | a two-variable power series with the unit and associativity laws; commutativity is separate | yes: fields `zero_constantCoeff`, `lin_coeff_X`, `lin_coeff_Y`, `assoc` |
| `FormalGroup.IsComm` | same file `:75` | a separate class | yes: `F = F.subst ![X₁, X₀]` |
| `FormalGroup.Point` | same file `:127` | imposes the substitution condition on a multivariable series | yes: `{f : MvPowerSeries σ R // PowerSeries.HasSubst f}` |
| `FormalGroup.𝔾ₐ`, `FormalGroup.𝔾ₘ`, `FormalGroup.map` | same file `:146`, `:162`, `:185` | named only | present |
| `CategoryTheory.ObjectProperty.isLocal` | Mathlib `CategoryTheory/Localization/Bousfield.lean:55` | precomposition with a morphism is bijective into each object of the property | yes (docstring :52–54) |
| `IsLocalization.flat` | Mathlib `RingTheory/Flat/Localization.lean:37` | any commutative-ring localization is flat | yes; stated for `CommSemiring`, which is more general |
| `Module.Flat.lTensor_exact` | Mathlib `RingTheory/Flat/Basic.lean:324` | tensoring with a flat module preserves exactness | yes |
| `CategoryTheory.ObjectProperty.IsSerreClass` | Mathlib `CategoryTheory/Abelian/SerreClass/Basic.lean:45` | zero object, subobjects, quotients, extensions | yes: extends `ContainsZero`, `IsClosedUnderSubobjects`, `…Quotients`, `…Extensions` |
| `WeierstrassCurve.formalGroup` | Tau Ceti `AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean:58` | a native Mathlib `FormalGroup` | yes: `… : FormalGroup R` |
| `AddCommGrpCat.isKilledBySomePower` | Tau Ceti `AlgebraicTopology/SerreClass/PowerTorsion.lean:33`; Serre-class instance `:44` | the groups M with d^k·M=0 for some k, with its `IsSerreClass` instance | yes: `∃ n, Module.IsTorsionBy ℤ M ((d:ℤ)^n)` |
| `TauCeti.SymmetricSpectrum` | Tau Ceti `AlgebraicTopology/Spectra/SymmetricSpectrum.lean:92`, in `namespace TauCeti` (:74) | point-set symmetric spectra of pointed simplicial sets, without stable homotopy groups or stable equivalences | yes: `abbrev … := Mod SymmetricSequence.sphere`; `Spectra/MappingSpace.lean:46` says derived versions need the stable model structure. No stable homotopy group or stable equivalence of spectra exists in Tau Ceti; the only `stableEquivalence`, `CategoryTheory/Exact/Stable/Functor/Basic.lean:239`, is an equivalence of stable categories |

**Cross-pin stability.** I diffed the five cited Mathlib files and the cited Tau Ceti formal-group file between the branch pin (`6b7abb3c`/`a91d3aaf`) and the declared revisions. The differences are import reordering, `convert!`→`convert`, and one `SMulCommClass` binder at `Flat/Basic.lean:406`, which is not at `lTensor_exact` (:324). None of the cited declarations changes. At the branch pin, `AlgebraicTopology/` has no `SerreClass/` or `Spectra/` directory, which is why the declaration was needed.

### Gate, dependency direction, Lean

- **Gate.** I re-ran it with the brief's command at this head, exit 0: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run on the same head adds `build=0`.
- **Dependency check.** The brief's command printed, in full:

  ```text
  depcheck: 237 roadmaps, 2310 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` from the worktree exited 0 with no diagnostics (12.7 s). The file is unchanged: `import Mathlib`, one module docstring, an empty namespace and no declarations. The `#check @name` comparison and the one-tactic probe therefore have nothing to act on. There is no `set_option`, `lemma`, `True` placeholder or sorry'd data. The six headline theorems (§§3.1, 4.1, 4.2, 4.3, 4.4, 5.1) are listed in the docstring as not statable at the pins, each with the carrier it lacks, as the previous reviews verified.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty, `changes.md` lists no outside change, and the worktree is clean after the runs.

### Seeded sample, where it falls in the changed passage

| Target | Anchor read | As written | Supports the text? |
| --- | --- | --- | --- |
| 4.3 (its route is in the sentence's scope) | lmmt line 406 (Remark 2.12, page marker 10 at line 396): m=n+1 may be taken in Prop. 2.11, reduced to T(i)⊗K(π,r)=0 for r>i and finite π, through filtered colimits of finite subgroups; csy line 3930 (Theorem 5.3.5, page marker 80 at line 3893): Σ∞₊ of a map with π-finite n-connected fibers is a T(n)-equivalence | §4.3 cites "lmmt, Remark 2.12, p.10 (lmmt line 406)" and "csy, Theorem 5.3.5, p.80 (csy line 3930)"; the route passes to finite subgroups A_α before using the Serre class | Yes |
| 3.1, 4.1, 4.2, 4.4, 5.1 | untouched by the diff | as in the previous report | as in the previous report |

The README flags no locator as unverified, and the diff adds no source citation.

### Adversarial table

Rows for untouched statements carry forward from the previous report (PRREVIEW-ChromaticHomotopyTheory~11, which carries ~10 and ~9). The rows for the changed sentence and for what it re-scopes give values computed now.

| Statement | Instances | Values on each side | Result / change |
| --- | --- | --- | --- |
| Conventions, Layers 0–2, §§3.1 (incl. the DGFloer contract letters), 4.1–4.4, 5.1, Part II rows, References | as in the previous report | as in the previous report | Pass (previous report) |
| README:61, the revisions against main's manifest | main db5e748 | sentence: `2fd255d9`, `1b1ccf4b`; main's `lake-manifest.json`: `2fd255d9`, `1b1ccf4b` | Pass |
| README:61, "the content repository's manifest records" at this head | head 9d0ba64 | sentence: `2fd255d9`/`1b1ccf4b`; head's `lake-manifest.json`: `a91d3aaf`/`6b7abb3c` | Fails → R01 |
| README:61, scope coverage | all backticked library names | 7 lines (17, 65, 67, 71, 73, 103, 409), 7 inside the three named places; line 137 has no library name | Pass |
| README:61, resolution | 13 names at the declared revisions | 13 of 13 found (table above); at the branch pin 11 of 13 (`isKilledBySomePower`, `TauCeti.SymmetricSpectrum` absent) | Pass; this is the previous R01 repaired |
| README:73, `isKilledBySomePower d` at d=p | ℤ/p², ℤ/p^∞, 0 | ℤ/p²: in the class with n=2; ℤ/p^∞: not in it, since for every n an element of order p^(n+1) survives p^n; 0: in it with n=1, the instance's `exists_zero` witness (:45–50) | Pass |
| README:73, junk value d=0 | d=0, n=0 and n≥1 | (0:ℤ)^0=1 admits only M=0; (0:ℤ)^1=0 admits every M, so the class is all groups. §4.3 and the DGFloer contract use d=p≥2 only | Pass (no use at d=0) |
| README:73, "one fixed power is not a Serre class" | 0→ℤ/p→ℤ/p²→ℤ/p→0 | both ends are killed by p, the middle is not (p·1≠0 in ℤ/p²) | Pass |
| README:409, i=0 step on K(A_α,k) | A_α=ℤ/p^e, k≥n+1≥2 | π_k=ℤ/p^e is killed by p^e, so it is in the class; K(A_α,k) is simply connected; the stable groups are in the class and S[1/p]⊗Σ∞K(A_α,k)=0. ℤ/p^∞ is reached only through §4.3's colimit Check, consistent with ℤ/p^∞ not being in the class | Pass |
| README:17, `TauCeti.SymmetricSpectrum` description | declared revision | `Mod SymmetricSequence.sphere`, point-set; no stable homotopy groups or stable equivalence of spectra in Tau Ceti | Pass |
| `Suggested.lean:9` docstring | branch pin vs declared revision | the name is absent at `a91d3aaf` and present at `2fd255d9:92`; the module has no Tau Ceti import, so the build is pin-independent (exit 0) | Pass (previous R01 covered) |

### Citations, overlaps, gaps

`citations.md` lists no unresolved citation or Lean name. `overlaps.md` lists no other pull request changing this roadmap, no dropped id and no id defined only by an open revision. The diff adds no construction and no cross-roadmap citation, so ownership against GeneralAlgebraicKTheoryPartII, BordismFormalGroups and RefinedTraceMethods (the closest in vocabulary) is unchanged from the full review. The DGFloer item 4 contract (README:103) still matches DGFloer on main, README:659–665: it asks for genuine Serre classes with Serre's ⊗, Tor and K(A,1) axioms, and it lists "groups annihilated by some power of d" as an instance. Mathlib's `IsSerreClass` instance on the Tau Ceti class carries only the closure axioms, and DGFloer supplies the rest for this instance. The declared gaps `p-local-finite-duality` (README:79) and `spectral-ringed-sites` (README:91), with the same slugs in `design/plan.json`,, and GeneralAlgebraicKTheoryPartII's `elliptic-spectral-affineness` and `all-height-morava-realization` (README:109, :111), are untouched.

## Not verifiable

- HL13, Proposition 3.4.3, behind csy Lemma 5.1.7, is not in the source cache (unchanged from the previous reviews).
- Ravenel–Wilson, Theorem 9.2, was read only through csy line 3655 (unchanged).
- I did not read pull-request comments. No repair report for the previous head is on the board.

## Source issues

- none (the diff adds no source citation; the four items recorded in earlier reports, three in csy and one in lmmt, stand as recorded there).
