# Review of ChromaticHomotopyTheory (pull request #1643 at ab9dffb)

**Verdict:** needs changes

Incremental re-review of the 2 lines changed since 8114457: the DGFloer supplier contract at README:101, rewritten in §3.1's letters. The rewrite repairs the previous R02 and introduces nothing new. One P3 remains, carried for the third round: the Tau Ceti pin of the branch lacks two declarations the README cites as present. No P1 or P2. The gate passes, the dependency check is clean, and `Suggested.lean` elaborates without diagnostics.

## R01 (P3) — Two Tau Ceti declarations are cited at a pin that lacks them

**Location:** `TauCetiRoadmap/ChromaticHomotopyTheory/README.md:17`, "Tau Ceti already supplies `WeierstrassCurve.formalGroup` and the Serre class `AddCommGrpCat.isKilledBySomePower`"; the same name with the path `TauCeti/AlgebraicTopology/SerreClass/PowerTorsion.lean` at README:71, in the §4.3 route at README:407 and in the DGFloer contract at README:101; `TauCeti.SymmetricSpectrum` at `Suggested.lean:9`.

**Claim:** This is the previous review's R01 (and the one before's R04), not repaired: `lake-manifest.json` is unchanged since the merge base (`git diff --stat origin/main...HEAD` outside the folder is empty) and still pins Tau Ceti at `a91d3aaf` with Mathlib `6b7abb3c` and toolchain v4.35.0-rc3, while main pins `2fd255d9` / `1b1ccf4b` / v4.36.0-rc2. At the branch pin neither `AddCommGrpCat.isKilledBySomePower` nor `TauCeti.SymmetricSpectrum` exists, so "already supplies", the file path and the §4.3 route step are false against the library the folder builds with. The README declares no pin of its own, so the worktree manifest is the pin the reader is held to.

**Witness:** At `a91d3aaf`, `TauCeti/AlgebraicTopology/` has twenty entries and no `SerreClass/` or `Spectra/` directory. At main's `2fd255d9`, `isKilledBySomePower` is `SerreClass/PowerTorsion.lean:33` (a `def` to `ObjectProperty AddCommGrpCat`, torsion by `(d:ℤ)^n` for some n) and `SymmetricSpectrum` is `Spectra/SymmetricSpectrum.lean:92`.

**Repair:** Rebase the branch on current main so that `lake-manifest.json` pins Tau Ceti at `2fd255d9` or later and re-run the targeted build; README:17, :71, :101, :407 and `Suggested.lean:9` are then correct as written and nothing in the folder changes. If the rebase is left to the merge, the in-folder alternative is to open `## Exact supplier contracts` with one sentence declaring the Tau Ceti and Mathlib revisions the citations are read at (`2fd255d9`, `1b1ccf4b`), the form QuadraticFormInvariants README:146 uses; tested: at `2fd255d9` both names resolve at the lines above and `WeierstrassCurve.formalGroup` is still present.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `a91d3aaf`; README:17 still reads "Tau Ceti already supplies … `AddCommGrpCat.isKilledBySomePower`". Carried as R01 above.
- R02 — repaired: README:101 now reads "Serre fibration F→X→Y over a path-connected CW base Y … E²_(s,t)=H_s(Y;H_t(F;R)) … strong convergence to H_(s+t)(X;R) … §3.1 compares it with the case E=HR"; the letters p, q and E are no longer displayed in two senses.

No repair report for the previous head is on the board (`reports/` holds PRREVIEW~1–10 and the package, gate and red-team reports only), and no finding was marked "not actionable in this package", so nothing is re-raised under that rule.

## Verified sound

### The changed passage (README:101)

- **Letters.** The contract now uses §3.1's letters: F→X→Y, base Y, bidegrees (s,t), total space X; README:289 (E²_(s,t)=H_s(Y; y↦E_t(F_y,+)), target π_(s+t)(E⊗Σ∞_+X)) and README:301 (identification with H_s(Y;H_t(F_y;R)) and abutment H_*(X;R)) use the same. A search of the README for `H_p(`, `(p,q)`, `(p+q)`, `base B` and `(E;R)` finds nothing, so p and q are displayed only as primes (README:41 "impose q≠p wherever displayed", and the four uses at README:54, :143, :163, :412 all have q≠p). In the sentence E has the single referent "coefficient spectrum" ("the case E=HR").
- **Content against DGFloer on main** (folder at eaf17b10, README lines 531–541, `arbitraryCWSerreSpectralSequence`): every path-connected CW base; filtration by the preimages of the skeleta with the preimage of the empty skeleton empty; E² identified as H_p(B;H_q(F;R)) with path-transport monodromy; convergence to H_(p+q)(E;R); in each total degree a finite, exhaustive, separated first-quadrant filtration with E∞ its graded pieces; naturality under maps of fibrations and of coefficients; the componentwise version. The contract restates each item with the letters renamed and adds nothing DGFloer does not own. The coefficient hypothesis "commutative ring R" matches DGFloer's standing convention (its README:308, "the algebraic Layers 0, 3 and 4 work over an arbitrary commutative ring"). Serre fibrations: DGFloer's item 2 consumes native `TauCeti.TopCat.serreFibrations` (its README:140). Item 4 (Hurewicz modulo a Serre class, its README:659–663) is untouched and reads as before.
- **Nothing cites the old letters.** The only consumers of the contract are §3.1's comparison bullet (README:301), its proof route (README:303), its *Needs:* line (README:317), the Layer 3 Dependencies (README:325) and the Scope sentence (README:13); none names a bidegree or the letter B or E for the fibration, so none needed to change.

### Gate, dependency direction, Lean

- **Gate.** Re-run with the brief's command at this head, exit 0: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's run on the same head adds `build=0`.
- **Dependency check.** The brief's command printed, in full:

  ```text
  depcheck: 239 roadmaps, 2320 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` from the worktree: exit 0, no diagnostics. The file is unchanged since the previous review: `import Mathlib`, one module docstring, an empty namespace, no declarations, so the `#check @name` comparison and the one-tactic probe have nothing to act on; no `set_option`, `lemma`, `True` placeholder or sorry'd data. The six headline theorems (§§3.1, 4.1, 4.2, 4.3, 4.4, 5.1) are named in the docstring as not statable with the carrier each lacks, as the previous reviews verified; `TauCeti.SymmetricSpectrum`, which the docstring names, exists at main's pin and not at the branch pin (R01).
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty; `changes.md` lists no outside change; the pull-request description is unchanged.

### Seeded sample, where it falls in the changed passage

| Target | Anchor read | Hypotheses and statement as written | Supports the text? |
| --- | --- | --- | --- |
| 3.1 (DGFloer contract, README:101; comparison bullet, README:301) | DGFloer README on main, lines 531–541 (hypotheses and conclusions listed above); GeneralizedCohomology README on main, G2.7 at line 405 (HR-homology as singular homology with the pair boundary) | Serre fibration, path-connected CW base Y, coefficient commutative ring R; E=HR | Yes |
| 4.1, 4.2, 4.3, 4.4, 5.1 | untouched by the diff | as in the previous report | as in the previous report |

The README flags no locator as unverified; the diff adds no source citation.

### Library declarations opened at the pins

| Declaration | File and line |
| --- | --- |
| Tau Ceti `WeierstrassCurve.formalGroup` (branch pin `a91d3aaf`) | `AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean:58` (previous report) |
| Tau Ceti `AddCommGrpCat.isKilledBySomePower`, `TauCeti.SymmetricSpectrum` (branch pin `a91d3aaf`) | absent: no `AlgebraicTopology/SerreClass/`, no `AlgebraicTopology/Spectra/` (R01) |
| the same two at main's pin `2fd255d9` (content checkout) | `AlgebraicTopology/SerreClass/PowerTorsion.lean:33`, `AlgebraicTopology/Spectra/SymmetricSpectrum.lean:92` |

The Mathlib declarations the README cites are unchanged since the previous reviews, which opened all ten at `6b7abb3c`.

### Cross-roadmap citations resolved this round

| Supplier (where read) | What was checked |
| --- | --- |
| DGFloer (main, folder at eaf17b10) | Layer 1 item 2, README lines 470–545: `arbitraryCWSerreSpectralSequence` (:531) and `arbitraryBaseSerreSpectralSequence` (:542); item 4 at :659; coefficient convention at :308; native Serre fibrations at :140. The open revision of DGFloer is never a dependency; the README cites main. |
| GeneralizedCohomology (main) | G2.7 at README line 405, unchanged since the previous review. |

`citations.md` lists no unresolved citation or Lean name; `overlaps.md` lists no other pull request changing this roadmap, no dropped id and no revision-only id. The closest open roadmaps by vocabulary (GeneralAlgebraicKTheoryPartII, BordismFormalGroups, RefinedTraceMethods) were compared in the full review; the diff adds no construction, so ownership is unchanged.

### Adversarial table

Rows for untouched statements carry forward from the previous report (PRREVIEW-ChromaticHomotopyTheory~10, itself carrying ~9); the row for the changed statement gives the values computed now.

| Statement | Instances | Values on each side | Result / change |
| --- | --- | --- | --- |
| Conventions, Layers 0–2, §§3.1 (construction, API, route, Checks), 4.1–4.4, 5.1, Part II rows, References | as in the previous report | as in the previous report | Pass (previous report) |
| DGFloer contract letters (README:101), Klein bottle over S¹, R=ℤ | the entry the contract's E² describes at bidegree (s,t)=(1,1) | §3.1 Check (README:311): E²_(1,1)=ker(1−(−1))=ker(2:ℤ→ℤ)=0, E²_(0,1)=coker(2)=ℤ/2, E²_(0,0)=E²_(1,0)=ℤ; DGFloer item 2 with its letters renamed B→Y, E→X, (p,q)→(s,t): the same four groups; abutments H₁(X;ℤ)=ℤ⊕ℤ/2, H₂=0 on both sides; the display "(1,1)" is now a bidegree and the Conventions' "q≠p" is not engaged | Pass (R02 repaired) |
| DGFloer contract, degenerate base | Y=* | contract: column s=0 only, E²_(0,t)=H_t(F;R), abutment H_t(X;R)=H_t(F;R); §3.1 Check (README:307) at E=HR: E_*(F_+)=H_*(F;R) | Pass |
| DGFloer contract, referent of E | the sentence's two occurrences | "E=HR": the coefficient spectrum; the total space is X in "H_(s+t)(X;R)"; one referent for E | Pass (R02 repaired) |
| Tau Ceti pin | a91d3aaf vs 2fd255d9 | `SerreClass/`, `Spectra/` absent vs present at :33 and :92 | R01 |

### Gaps and ownership

Unchanged since the previous review: `p-local-finite-duality` (README:77) and `spectral-ringed-sites` (README:89) are declared with the same slug and sentence in `design/plan.json`; `elliptic-spectral-affineness` and `all-height-morava-realization` (README:107, :109) are GeneralAlgebraicKTheoryPartII's. The diff touches none of them and adds no construction.

## Not verifiable

- HL13, Proposition 3.4.3, behind csy Lemma 5.1.7, is not in the source cache (unchanged from the previous reviews).
- Ravenel–Wilson, Theorem 9.2, was read only through csy line 3655 (unchanged).
- Pull-request comments were not read. No repair report for the previous head is on the board.

## Source issues

- none (the diff adds no source citation; the four items of the previous report, three in csy and one in lmmt, stand as recorded there).
