# Review of DGFloerPartII (pull request #1799 at 4ecec6e)

**Verdict:** needs changes

This is an incremental re-review of the 51 lines changed since `c8e0b93`. All of them are in
`README.md`, with 34 insertions and 17 deletions, in these places:

- the `Topology.CWComplex` contract bullet;
- a new From Tau Ceti bullet;
- 1.0's comparison with the raw quotients;
- a new out-of-scope bullet for the CW product;
- 1.0's *Needs:* line;
- the Layer 1 Dependencies;
- the Hatcher reference.

`Suggested.lean` is byte-identical to `c8e0b93`, and nothing changed outside the folder. The
pull-request description was also rewritten.

- **Repaired:** review 22's R01 (merge order with DGFloer #1798) and R02 (the CW-complex
  contract).
- **Partly repaired:** review 22's R03 (stale description). The free text is now correct, but
  two of the stale passages are in the generated `roadmap-summary` block, which is unchanged.
  They are carried here as R01.
- **New:** R02. The repair removed Hatcher's Appendix from the Layer 1 sources, and 1.1's Dowker
  Check now has no source.

The gate passes with the moved order and the targeted build. Both findings are P3, so nothing
blocks.

## R01 (P3) — Partly repaired: the description's `roadmap-summary` block is still stale

**Location.** The pull-request description, inside the generated `roadmap-summary` block:

- "A separate home lets them use … HomotopySpheres' James construction and Bott periodicity";
- "the homology of ΩCPᵈ and ΩHPᵈ comes from the Morse–Bott energy, its boundaries vanishing by a
  Hopf-fibration rank count rather than degree gaps".

**Claim.**

- HomotopySpheres supplies the James construction and Bott periodicity.
- The boundaries of both loop spaces vanish by a rank count, not by degree gaps.

**Witness.**

- "HomotopySpheres" occurs 0 times in `README.md` and `Suggested.lean`.
- The James construction is GeneralAlgebraicKTheoryPartII §4.30b (line 92).
- Bott periodicity "is proved here" (lines 116–118).
- 2.3 uses the degree gaps for `ΩHPᵈ` (lines 1084–1087, 1095–1096).

**Repair.** Regenerate the block from the corrected free text, or make these two edits in it:

1. Replace "HomotopySpheres' James construction and Bott periodicity" with
   "GeneralAlgebraicKTheoryPartII's James construction and Bott–Samelson theorem".
2. Replace "its boundaries vanishing by a Hopf-fibration rank count rather than degree gaps" with
   "the boundaries for ΩCPᵈ vanishing by a Hopf-fibration rank count, and those for ΩHPᵈ by the
   degree gaps once the Thom model is built".

**Tested.** The description's free text already says both things:

- "from GeneralAlgebraicKTheoryPartII's James construction and Bott–Samelson theorem (1.2)";
- "for `ΩHPᵈ` they vanish by the degree gaps once the Morse–Bott Thom model is built".

After the two edits the block agrees with the free text and with the README. Both cases were
recomputed:

- `ΩCP²`: the cell degrees are 0, 1, 4, 5, 8, …, so `a₂ − b₁ = 1`, and the vanishing needs the
  rank count.
- `ΩHP²`: the cell degrees are 0, 3, 10, 13, 20, …, with gaps of at least 3, so the boundaries
  vanish for degree reasons.

## R02 (P3) — New: the Layer 1 sources no longer list Hatcher's Appendix, which is the source of 1.1's Dowker Check

**Location.**

- README line 1006, Layer 1 Dependencies: "Hatcher, *Algebraic Topology*, §4.J;". At `c8e0b93`
  it read "§4.J and Appendix".
- 1.1 Check, lines 734–737: "An ordinary product of two compactly generated spaces need not be
  compactly generated (Dowker's pair of CW complexes whose product topology is not the CW
  topology)".

**Claim.** Layer 1 uses only §4.J of Hatcher.

**Witness.**

- `hatcher-at` lines 22728–22745 (Appendix, printed pp. 524–525) give Dowker's example: an
  uncountable and a countable wedge of intervals, whose product topology is not the CW topology.
- No other Layer 1 source, and no locator in the Check, covers it.

**Repair.**

1. In 1.1's Check, after "whose product topology is not the CW topology", insert "; Hatcher,
   *Algebraic Topology*, Appendix, pp. 524–525, after Theorem A.6".
2. In the Layer 1 Dependencies, write "Hatcher, *Algebraic Topology*, §4.J and Appendix,
   pp. 524–525".
3. In the Hatcher entry of the References, add "Dowker's product example (1.1)".

**Tested.**

- By Hatcher's Theorem A.6 (p. 524, `hatcher-at` line 22693), the CW topology on `X × Y` is
  `(X × Y)_c`.
- On p. 525, Hatcher gives a set `P` that is closed in the CW topology but has the wedge point
  `(x₀, y₀)` in its product closure. So `X × Y ≠ (X × Y)_c`, and the Hausdorff space `X × Y` is
  not compactly generated, which is exactly what the Check asserts.
- `X` and `Y` are Hausdorff CW complexes, hence compactly generated (row 55).

## Previous findings

- R01 — repaired: the description now says "This pull request merges after DGFloer's revision
  #1798, or together with it". It names Layer 10 item 5, Layer 11, Layer 1 items 7–8 and Layer 5
  item 7, as #1798's numbering note does (lines 182–198).
- R02 — repaired: "The class carries no separation axiom; `C` is closed in `X` when `X` is
  Hausdorff … make every CW complex in a Hausdorff space compactly generated". The CW product is
  left to AlgebraicTopology Stage 4 item 5. The source it lost is now R02.
- R03 — partly repaired: three of the five passages, all in the free text, are corrected. The
  `roadmap-summary` block still has "HomotopySpheres' James construction and Bott periodicity" and
  "rather than degree gaps". Carried as R01.

**On R01.** The description does not list #1798 in the `depends-on` block, and gives the reason:
DGFloer is on main, so #1798 is not a supplier. That reason is correct, because a revision of a
roadmap on main is never a dependency. The ordering is stated in the free text, so nothing more
is needed.

The brief names no repair report, so no finding is marked "not actionable in this package".

## Verified sound

### Gate, dependency check, build

- **The worker's gate** (`gate.md`): every check is 0, and the result is `OK`.
- **The brief's gate command, with the configured order.** The result is `FAIL`, from one line:
  `depcheck: UPWARD: DGFloerPartII (#46) -> GeneralAlgebraicKTheoryPartII (#335) at README lines
  [454, 773, 994, 1499, 2183]`. This is the moved case: the configured order lists this roadmap
  above its supplier, and the worker moves it when it submits. It is not a defect.
- **The same command with `--order merge-order-moved.txt --build`.** Every check is 0, `build=0`,
  and the result is `OK`.
- **The brief's dependency check:**

      depcheck: 234 roadmaps, 2267 edges, 0 problem(s)

- **`lake env lean` on `Suggested.lean`**: exit 0, with 27 diagnostics, all "declaration uses
  `sorry`", and nothing else.
- **Other checks.**
  - `git diff --stat origin/main...HEAD` outside the folder is empty.
  - `git diff c8e0b93..HEAD` touches only `README.md`. It is empty for `Suggested.lean`.

### Every name the diff adds, opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`)

| Name | Pinned file and line | What the pin says |
| --- | --- | --- |
| `TauCeti.instDeltaGeneratedSpaceCWComplex` | `TauCeti/Topology/CWComplex/Classical/DeltaGenerated.lean` 61 | `[T2Space X] {C : Set X} [CWComplex C] : DeltaGeneratedSpace ↑C` |
| `TauCeti.instDeltaGeneratedSpaceOfCWComplexUniv` | same file, 66 | `[T2Space X] [CWComplex univ] : DeltaGeneratedSpace X` |
| `Topology.RelCWComplex.isClosed` (alias `CWComplex.isClosed`) | Mathlib `Topology/CWComplex/Classical/Basic.lean` 471 | `[T2Space X] [RelCWComplex C D] : IsClosed C` |
| `Topology.CWComplex` | same file, 135 | cells, characteristic maps, `closed'` (a subset of `C` is closed in `X` when its traces on the closed cells are) and `union'`; no `T2Space` field |
| delta-generated ⇒ sequential | Mathlib `Topology/Compactness/DeltaGeneratedSpace.lean` 58 | `instance [DeltaGeneratedSpace X] : SequentialSpace X` |
| sequential ⇒ compactly generated | Mathlib `Topology/Compactness/CompactlyGeneratedSpace.lean` 211 | `[SequentialSpace X] : UCompactlyGeneratedSpace.{u} X`, with `u` a free universe parameter |

**The probe.** A scratch file imports Mathlib and `TauCeti.Topology.CWComplex.Classical.DeltaGenerated`.
With `X : Type u`, and `v` a separate universe for the test spaces:

- `UCompactlyGeneratedSpace.{v} C` elaborates by `inferInstance`.
- `CompactlyGeneratedSpace C` elaborates.
- With `[CWComplex (univ : Set X)]`, `UCompactlyGeneratedSpace.{v} X` elaborates.
- `IsClosed C` elaborates by `CWComplex.isClosed`.
- Without `[T2Space X]`, synthesis fails: "failed to synthesize … `CompactlyGeneratedSpace ↑C`".

So the README's "in every universe" and its Hausdorff hypothesis are exact.

### Cross-roadmap citations the diff adds or changes

- **AlgebraicTopology Stage 4 item 5, `cwProductKelley`.** On main (`87976be`),
  `TauCetiRoadmap/AlgebraicTopology/README.md` begins Stage 4 at line 499, and item 5 runs from
  line 635 to line 788. `cwProductKelley` is at line 752:
  - arbitrary Hausdorff CW complexes `X` and `Y`;
  - the product-cell CW structure on `k(X×Y)`;
  - Hatcher A.6;
  - the comparison with the ordinary product when either factor is locally compact.

  The scope bullet (lines 111–114) describes exactly this. The same item holds
  `cofibrationTowerHomotopyEquivalence`, which 4.2c cites at line 1756, so the numbering is
  consistent.
- **The same citation in the open revision.** At AlgebraicTopology #1652 (`c610f76`), the
  numbering note says "Stage 4 items 1–8 are §§4.1–4.8", and line 4640 maps `cwProductKelley` to
  §4.5. The citation survives that revision.
- **The repair removes a duplicate.** Review 22 had kept Hatcher A.6 in 1.0. The author found
  that AlgebraicTopology Stage 4 item 5 on main already owns it, and deferred to it. That is the
  right settlement.
- **"Nothing here uses it."** A grep for `A.6`, "product cell", "countabl" and "Appendix" finds
  only lines 111–114 and 2303–2306. The Dowker Check at line 735 is about the product topology,
  not about the CW structure.
- **The description's merge-order paragraph against #1798** (`2d41b2a`, lines 182–198):
  - Layer 1 item 7 → §1.3;
  - Layer 1 item 8 → §1.4;
  - Layer 5 item 7 → Layer 2;
  - Layer 10 item 5 (Theorem B) → §§3.2–3.3, with the number kept for Theorems A and C;
  - Layer 11 items 1, 2, 4, 5 and 6 → §§4.1, 4.2, 4.4, 4.5 and 4.6;
  - Layer 11 item 3 → §4.3, with the number kept for `T × K → G` and the torus criterion.

  On main, these ids are at DGFloer lines 834, 841, 1053, 1562 and 1577. The paragraph is
  accurate.
- **The description's `Suggested.lean` lists.** The statement list matches the file's lines 106,
  115, 132, 164–323, 362–395, 403–443 and 460. The "not statable" list matches the module
  docstring (lines 67–87).
- **Main moved** from `f8836c4` to `87976be`. Only FuchsianOrbifolds and PolylogarithmFunctions
  changed, and the README cites neither. Main's GeneralizedCohomology still defines G4.0b (lines
  939, 958, 1006), so the `overlaps.md` lead for G4.0b is again a false positive.
- **`roadmaps resolve`** finds nothing unresolved. **`overlaps.md`** lists no dropped id and no
  other open pull request that changes this roadmap.
- **Ownership of 1.0's raw-quotient comparisons.** AlgebraicTopology #1652's §4.8 also claims "the
  reduced suspension of a pointed Hausdorff CW complex with the convenient suspension". That is the
  comparison this diff touches. Review 20 settled the question:
  - #1652 is another author's revision of a roadmap on main, so this roadmap may not consume it,
    and 1.0 stays the owner;
  - once #1652 merges, this roadmap cites AlgebraicTopology §4.8 instead.

  The diff changes nothing about that.

### Adversarial table

Rows 1–52 are carried from earlier reviews, because the statements they test are untouched:

- rows 1–33 and 35–36 from review 20;
- rows 34 and 37–41 from review 21;
- rows 42–43 and 45–52 from review 22.

Review 22's row 44 tested the false CW contract; row 53 replaces it. Rows 53–60 are new.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1–33, 35–36 | as in review 20 | as in review 20 | as in review 20 | true or sharp | none |
| 34, 37–41 | as in review 21 | as in review 21 | as in review 21 | as stated | none |
| 42–43, 45–52 | as in review 22 | as in review 22 | as in review 22 | as stated | none |
| 53 | The CW contract (lines 237–245): no separation axiom, and `C` is closed when `X` is Hausdorff | `X = ℝ` with `C = [0,1]` (two 0-cells, one 1-cell); the Sierpiński space `{a, b}` with `{a}` open, and `C = {a}` with one 0-cell | `ℝ`: `IsClosed C` by `CWComplex.isClosed`. Sierpiński: `closed'` holds vacuously, because `{a}` is not closed; `Fin 0 → ℝ` is a point with an empty unit sphere. So `C` is a CW complex that is not closed | as stated, both halves | none |
| 54 | "sequential spaces are compactly generated in every universe" | `X : Type u`, test spaces in `v ≠ u` | the pin's universe at line 211 is free; the probe's `UCompactlyGeneratedSpace.{v} C` elaborates | true | none |
| 55 | The Tau Ceti bullet (lines 354–358): the subset form and the whole-space form | `C ⊆ X` with `X` Hausdorff; `[CWComplex univ]`; `X` without `T2Space` | Hausdorff: both forms elaborate. Without `T2Space`: synthesis fails | as stated | none |
| 56 | 1.0: for a pointed CW complex `X` in a Hausdorff space, the convenient `ΣX` is the raw interval-last quotient (lines 664–674) | `X = S¹`; `X = ℝ` with integer 0-cells; Dowker's uncountable wedge | `S¹`: both sides are `S²`. `ℝ`: `ℝ × I` is metrizable, so the raw quotient is compactly generated. Wedge: `X × I` is compactly generated because `I` is locally compact, whereas `X × Y_Dowker` is not (row 58), so the claim is limited to `× I` | true | none |
| 57 | Scope bullet (lines 111–114) against Hatcher A.6 and AlgebraicTopology | `hatcher-at` line 22693, printed p. 524 | Hatcher: `(X×Y)_c` is CW, and equals `X × Y` if a factor is locally compact or both are countable. The bullet and AlgebraicTopology item 5 state the locally compact case | the deferral matches its owner | none |
| 58 | Layer 1 sources after the diff, against the 1.1 Dowker Check | Hatcher pp. 524–525, lines 22728–22745 | Dowker's pair is in the Appendix; the Layer 1 sources now list only §4.J | unsourced | R02 |
| 59 | The description's merge order with DGFloer | #1798's note, lines 182–198 | every moved id and every kept number agree (see above) | accurate | none |
| 60 | The `roadmap-summary` block on the boundaries | 2.2 and 2.3 with `d = 2` | `ΩCP²`: `a₂ − b₁ = 5 − 4 = 1`, so the rank count is needed. `ΩHP²`: `3, 10, 13, 20` with gaps of at least 3, so the degree gaps decide | the summary is wrong for `HPᵈ` | R01 |

### The seeded sample, where the diff touches it

- **1.0** changed in its comparison sentence (rows 53–56), and its Hatcher A.6 locator moved to
  the scope bullet (row 57: line 22693, printed p. 524). Its Strickland and Rezk locators are
  untouched, and review 20's rows for them stand.
- **The other sampled targets** (1.4, 2.1, 2.2, 2.4, 2.6, 3.1, 3.2, 4.1, 4.2, 4.2b, 4.3, 4.4,
  4.5, 4.6): the diff does not touch them, and the rows of reviews 20–22 stand.
- No README locator is flagged as unverified, and all six sources in the manifest are `certified`.

### Suggested.lean

- The file is unchanged since `4def45e`.
- `signatures.md` lists 33 entries for 31 declarations: its `of` (line 130) and `on` (line 298)
  are words from docstrings. No entry has lost a section binder.
- The results of reviews 20–22 stand for the headline list, the elaborated-signature comparison
  and the one-tactic probe.

## Not verifiable

These texts are not in the sources cache. None of them bears on a changed passage, and the values
that depend on them were recomputed in reviews 20 and 21:

- Ziller;
- Milnor, *Morse Theory*;
- Bott 1959;
- Steenrod;
- Milnor–Stasheff;
- Pontryagin;
- Thom 1954;
- BDHO, *Morse homology with DG coefficients*;
- [Jap87].

## Source issues

- none
