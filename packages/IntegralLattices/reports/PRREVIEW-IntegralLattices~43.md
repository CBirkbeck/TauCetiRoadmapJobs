# Review of IntegralLattices (pull request #1411 at 60aa3a4)

**Verdict:** needs changes

Incremental re-review of the 14 lines changed since `dfca92f`, and of the title and description as they stand. Two findings, both P3 and both in the description; the folder's files need no change. `README.md` and `Suggested.lean` mean the files in `TauCetiRoadmap/IntegralLattices/`.

## R01 (P3) — The description's list of passages that revise #617 omits the two that the 7C repair changed

- **Location.** Pull request description, paragraph **IntegralLattices**: "It contains #617's changes to this folder and revises some of them: the opening and scope paragraphs and §*Theta series*, the supplier contracts, 1H, 3D, … the introduction of Layer 5, 5A, 6F, 7C, 7E, 8S, …".
- **Claim.** The list names every passage where this head differs from #617's text except two: §*How to read the build* and the introduction of Layer 7, which differ since this head.
- **Witness.** #617 (`da24d08`) `README.md:606` and `2827`: "the stabilizer-index and Conway–Sloane dictionaries of 7C"; this head `README.md:614` and `3062`: "the Conway–Sloane dictionary of 7C". Neither passage is in the list.
- **Repair.** In that sentence replace "the supplier contracts, 1H," by "the supplier contracts, §*How to read the build*, 1H," and "the introduction of Layer 5, 5A, 6F, 7C, 7E, 8S," by "the introductions of Layers 5 and 7, 5A, 6F, 7C, 7E, 8S,".

## R02 (P3) — The summary block says 7C defines the local density; main's 7C already does, and this head records the definition as native

- **Location.** Pull request description, block `<!-- roadmap-summary -->`: "B5 adds indefinite reduction, 5A separates the native direction from genus to discriminant form from its converse, and 7C defines the local density."
- **Claim.** The definition of `α_p(L)` is not a change of this revision: 7C on main has the same display, and at this head the count and the density are consumed from Tau Ceti; what 7C gains is the Conway–Sloane dictionary as its one target.
- **Witness.** `README.md:3097–3100`: "The count and the density are native (`Matrix.localDensityCount` and `Matrix.localDensity` …)"; `README.md:3202–3203`: "The target of this milestone is the Conway–Sloane dictionary at odd `p`". Main's 7C (its line 2395) has the same heading and limit.
- **Repair.** Replace the clause by: "and 7C records the local density as native and keeps as its target the identity between it and the Conway–Sloane local mass at odd `p`."

## Previous findings

- R01 — repaired: `README.md:3202–3204` "The target of this milestone is the Conway–Sloane dictionary at odd `p`; the stabilizer index is N0's and is cited here"; `614` and `3062` read "the Conway–Sloane dictionary of 7C". No other passage calls the index a target of 7C.
- R02 — partly repaired: the description now says "contains #617's changes to this folder and revises some of them: …" and "Where the two texts differ, this head's text is the later one"; the list lacks the two passages of R01 above.
- R03 — repaired: "Against main, five roadmap suppliers are dropped: Quadratic Form Invariants, Global Number Fields and Class Field Theory, as in #617 …; and Root Systems and `RepresentationTheory/LieGroups` … No supplier is added."

## Verified sound

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 7C, the one remaining target: `m_p(L) = p^{v_p(det L)(n+1)/2}·α_p(L)⁻¹`, odd `p` | `⟨3⟩` and `⟨1⟩⊕⟨3⟩` at 3; `⟨1⟩` at 3 | `⟨3⟩`: `E = 1`, `α = 3·2 = 6` (count: 6 solutions of `3x² ≡ 3 mod 3^r`), both sides `1/2`. `⟨1⟩⊕⟨3⟩`: `E = 1`, `α = 12`; `3^{3/2}/12 = 3^{1/2}/4` both sides. `⟨1⟩`: `1/2` both | pass | none |
| 7C exponent identity `E = (v(n+1) − ∑(j'−j)n_j n_{j'})/2` | `⟨1⟩⊕⟨3⟩`; `⟨3⟩` | `(1·3 − 1)/2 = 1`; `(1·2 − 0)/2 = 1`; both equal `C(N_{>0}+1, 2) = 1` | pass | none |
| N0 stabilizer index (now cited, not a target, in 7C) | `⟨3⟩` at 3; `⟨1⟩` at 2; rank 0 | `s_v = −1` preserves `L₃` although `β(v,v) = 3` is no unit; index 2; unit-norm lemma applies to `⟨1⟩` at 2; rank 0: `K_p = {1}`, index 1 | pass | none |
| Description, suppliers against main | supplier table on main and at head | main: QFI, GQF, GNF, CFT, RP, OSG, Root Systems, `RepresentationTheory/LieGroups`, DG; head: GQF, RP, OSG, DG; difference is the five named | pass | none |
| Description, `Suggested.lean` against #617 | `diff` with `da24d08` | two hunks, the module docstring (3D) and the docstring of `sameGenus_iff_of_isEven` | pass | none |

The rows for the untouched statements stand as in the previous review, of `dfca92f`.

- Changed passages: three (`README.md:614–615`, `3062`, `3202–3206`), all the wording of R01's repair; no statement, Check, locator, supplier or Lean declaration changes. `Suggested.lean` and the pins are identical to `dfca92f` (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`).
- Seeded sample B1–B8: none falls in a changed passage; not re-read.
- Library declarations opened at the pin for the changed passage: `reflectionOrthogonal_mem_integralOrthogonalSubgroup` (`TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/Integral/SpinorNorm.lean:145`), `localStabilizer_eq_integralOrthogonalSubgroup` (`TauCeti/NumberTheory/IntegralLattice/Localization/Stabilizer.lean:119`), `localDensity_diagonal_unit_mul_pow` and `localDensity_toMatrix_of_iIsOrtho` (`LocalDensity/Diagonal.lean:136, 163`), `Matrix.localDensityCount`, `Matrix.localDensity` (`LocalDensity/Basic.lean:110, 546`).
- Description against #617's head `da24d08`: the README differs in 73 hunks; each lies in a passage the description lists or in one of its "beyond #617" bullets (1G, B2, Layer 8 Examples), except the two of R01. Headings against main: none removed, Layer 8's `### Examples` and `### Dependencies` added, as stated. The 36 Lean declarations removed against main are #617's; the description gives the difference from #617 and the merge order.
- Gate: the worker's gate passes every check at `60aa3a4`, build included. `depcheck: 261 roadmaps, 2615 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Against `origin/main` nothing changes outside the two roadmap folders.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 15 warnings, all "declaration uses `sorry`".
- Overlap check: read OrthogonalTamagawaAndLatticeMass, LatticePackingsAndPerfectForms, GeometryOfNumbersAndQuadraticArithmetic, LevelOneAutomorphicFormsForClassicalGroups, ThetaSeries, GlobalQuadraticForms (scopes as read for `dfca92f`; the change touches no ownership); shared: the determinant `−1` reflection of a local stabilizer, owned here over `ℤ_p` (N0). #617 conflicts in this folder and the description states the order (#617 first).
- Source independence: changed passages only: 3 passages, none carrying source wording (the one locator near them, Conway–Sloane equation (6), is unchanged and `conway-sloane-mass1988` is waived); largest share `omeara1963`, about 38 of about 120 locators; contents not compared with `omeara1963`, whose text and table of contents are not in the cache. No layer is added, removed or reordered.
- Research link: Layer 5 states the existence and primitive-embedding theorems of Nikulin (1979) used in K3 lattice theory; Layers 3, 4 and 7 supply the genus, class and local-density inputs of the mass formula as in Conway–Sloane (1988) and Cho (2015), assembled by OrthogonalTamagawaAndLatticeMass. Rests on the README's References and scope.
- Remark: the description's paragraph on QuadraticFormInvariants was not checked here; that folder's README also changed at this head (the ProfiniteCohomology supplier names, the dependencies of Layers 3 and 5) and has its own review.

## Not verifiable

- `conway-sloane-mass1988` §12 and equation (6) (7C): waived; the dictionary was checked by computation only.
- Everything listed under this heading in the review of `dfca92f` stands unchanged (Cox; `cohen1993`; Cassels; `omeara1963`; Nikulin 1979; the other uncertified sources).

## Source issues

- none

## For the human reviewers

- **Not tested.** The source with the largest share of the locators is `omeara1963` (about 38 of about 120); its text and table of contents could not be read, so wording and arrangement were not compared against it.
- **Scope.** B3's count of ambiguous classes for non-maximal orders of positive discriminant (`README.md:1544–1578`) is proved in the README with no refereed locator; Cox covers negative discriminants only.
