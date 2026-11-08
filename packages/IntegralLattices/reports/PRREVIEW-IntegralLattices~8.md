# Review of IntegralLattices (pull request #1239 at 2a9d69b)

**Verdict:** accepted

This is an incremental re-review of the 45 lines changed since ee3d302: 40 in the README and 5 in `Suggested.lean`. The change repairs the two findings of the previous review (the lead sentence of 6E and the file that declares `leechLattice`) and moves eight supplier-table locator cells onto file paths that exist at the Tau Ceti pin `2fd255d` and the Mathlib pin `1b1ccf4`. No Lean statement changes: the diff of `Suggested.lean` is three lines of the module docstring. The pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/IntegralLattices` is empty). The gate passes, the dependency check reports no problem, and the file elaborates with `sorry` as its only warning. No finding remains.

## Previous findings

- R01 — repaired: `README.md:2115–2120` now reads "This milestone proves that no row lattice is isometric to the Leech lattice, and that two row lattices whose root sublattices are their rows' displayed root lattices `R_r` and `R_s` are isometric only when the rows agree … The 24 are pairwise non-isometric once that root-sublattice hypothesis holds for every row, which is discharged outside this milestone as described below." That is exactly what `eq_of_nonempty_isometry_lattice` (with its two `span … = rootLattice.carrier` hypotheses) and `isEmpty_isometry_lattice_leechLattice` (unconditional) state. "As described below" refers to the paragraph at `README.md:2139–2145`, which names the nineteen native rows and Rank-24 lattice constructions, Layer 3, for the other four. The scope paragraph (`README.md:91–93`), the scope-table row (`README.md:123`) and the module docstring (`Suggested.lean:52–54`) were reworded consistently with it. The repair introduced no new problem.
- R02 — repaired: the 6E row of §*From Tau Ceti* (`README.md:439`) now lists `Rank24/Leech/Basic.lean`, where `noncomputable def leechLattice` is declared at the pin (`TauCeti/LinearAlgebra/IntegralLattice/Rank24/Leech/Basic.lean:236`); `vectorsOfNorm_two_leechLattice` stays correctly under `Rank24/Leech/Minimum.lean` (line 189).

## Verified sound

**Scope of this review.** I reviewed in full every changed passage and what cites or depends on it:

- the OTM consumption paragraph (`README.md:90–96`);
- the Rank-24 row of the out-of-scope table (`README.md:123`);
- the eight changed Location cells of §*Exact supplier contracts* (`README.md:407, 423, 429, 438, 439, 445, 446, 449, 453`);
- milestone 6E's lead paragraph and the paragraph it points to (`README.md:2110–2147`), with its four Checks;
- the References entry for Conway–Sloane (`README.md:3068`);
- the module docstring of `Suggested.lean` (lines 52–54).

The seeded sample B1–B8 lies wholly outside the changed lines; its verification is in the previous reports (b0defd8, 6cbd696) and is carried forward in the table below.

**Gate, dependency check and elaboration.**

- I ran the gate on this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate on the same head adds `build=0`.
- Dependency check:

```text
depcheck: 239 roadmaps, 2429 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or `moved:` line. The change adds no `*Needs:*` line and no supplier; 6E's *Needs:* still names only the native rows 0F, 0G, 2B and the Tau Ceti rank-24 declarations.
- `lake env lean TauCetiRoadmap/IntegralLattices/Suggested.lean` exits 0 with 31 warnings, all `declaration uses sorry`, at lines 111, 211, 228, 271, 283, 328, 342, 357, 375, 397, 443, 450, 471, 484, 522, 536, 553, 570, 577, 586, 595, 639, 656, 669, 677, 688, 709, 724, 797, 822 and 860, and nothing else: the same 31 declarations as at ee3d302, shifted by one line by the docstring. The file keeps the module-system header (`public import Mathlib` followed by thirteen `TauCeti.*` modules), no `set_option`, and 66 declarations.

**Signatures.** The two 6E statements are untouched by the diff; the worker's elaborated signatures agree with my reading of the file: `eq_of_nonempty_isometry_lattice : ∀ {r s : RootfulNiemeierType}, span ℤ (coe '' r.lattice.vectorsOfNorm 2) = r.rootLattice.carrier → (same for s) → Nonempty (r.lattice.Isometry s.lattice) → r = s` and `isEmpty_isometry_lattice_leechLattice : ∀ r, IsEmpty (r.lattice.Isometry leechLattice)`. Both are closed statements, so no section binder can be lost, and the reworded README now has exactly their generality.

**Changed supplier locators, opened at the pins.** Each cell names a file that exists and declares what the row lists:

- `Mathlib/NumberTheory/GaussSum.lean`: `gaussSum` (line 72), `gaussSum_mul_gaussSum_eq_card` (line 200) and `MulChar.IsQuadratic.gaussSum_frob` (module docstring line 36); 1H's *Needs:* asks Mathlib only for "quadratic Gauss sums". The old cell named `LegendreSymbol/GaussSum.lean`, which does not exist at the pin.
- `TauCeti/FieldTheory/SquareClassGroup/Basic.lean`: `squareClass` (56), `squareClass_eq_zero_iff` (72), `linearIndependent_squareClass_iff` (127). The old path `SquareClassGroup.lean` does not exist at the pin.
- `TauCeti/Analysis/SpecialFunctions/Complex/Circle/Basic.lean`: `expCircle` (60), `expCircle_coe` (72); old path absent.
- `TauCeti/LinearAlgebra/IntegralLattice/RankOne/Basic.lean`: `rankOne` (45); old path absent.
- `TauCeti/LinearAlgebra/IntegralLattice/Norm.lean`, added to the 2A–2F row: `vectorsOfNorm` (221), the one name of that row that `PosDef/RepresentationNumber.lean` does not declare (`representationNumber` is at its line 78, `minimum` and `kissingNumber` at `PosDef/Minimum.lean` 83 and 207).
- `TauCeti/LinearAlgebra/IntegralLattice/Rank24/Leech/Basic.lean`: `leechLattice` (236).
- `TauCeti/NumberTheory/IntegralLattice/Localization/Basic.lean`: `LocalCarrier` (105), `localIntegralForm` (109), `completedRationalForm` (118), `localizationToCompletion` (154), `localizationToCompletion_injective` (179), `span_range_localizationToCompletion` (185), `completedRationalForm_localizationToCompletion` (258); old path absent.
- `TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/AdelicSpinorNorm/Basic.lean`: `finiteAdelicSquareClasses` (63), `adelicSpinorNorm` (75); old path absent.
- `TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Hasse/Basic.lean`: `hasseInvariant` (118); old path absent.

**Cross-roadmap citations and ownership.**

- OrthogonalTamagawaAndLatticeMass at its open head (pull request #1222) consumes §6E with the same hypothesis the README now states (its README, lines 9, 34, 551, 555, 559 and 582: "its statement for two table rows assumes that each row's root sublattice is the row's displayed root lattice", "Pairwise non-isometry is IntegralLattices §6E and is not proved again here"), and it discharges that hypothesis by the native `span_vectorsOfNorm_two_lattice_of_ne` for nineteen rows and by Rank-24 lattice constructions, Layer 3, for the four excluded rows, exactly as `README.md:2139–2145` says. Supply runs one way: this roadmap consumes nothing of OTM.
- Rank-24 lattice constructions on main consumes this roadmap and states no non-isometry theorem (checked in the previous review; the change does not touch that relationship).
- Overlaps: the only other open pull request touching this roadmap, #1187, changes `Completed/IntegralLattices` only; no id this README cites is dropped by any open head, no id it drops is cited elsewhere, and no object has a second owner (previous review, unchanged by this diff).
- The worker's resolver lists 17 Lean names found nowhere; all 17 are this roadmap's own and are declared in `Suggested.lean` (unchanged since ee3d302).

**Adversarial pass.** Exact integer arithmetic. Rows for untouched statements cite the previous reports.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 6E lead sentence (changed prose) vs the Lean | `r = A₂¹²` (no native root-sublattice theorem for its table lattice); `r = s = E₈³`; `r = A₁²⁴` vs Leech | For `A₂¹²` the sentence claims non-isometry only under the hypothesis, which is what `eq_of_nonempty_isometry_lattice` assumes (`hr`, `hs`); for `E₈³` the identity isometry gives `r = r`; for `A₁²⁴` vs Leech the claim is unconditional and so is `isEmpty_isometry_lattice_leechLattice`: 48 roots in `N_r` against `vectorsOfNorm 2 = ∅`. The closing sentence ("pairwise non-isometric once the hypothesis holds for every row") is the conjunction of the 23-row conditional statement and the 23 unconditional Leech statements, so 24 lattices, `C(24,2) = 276` pairs, each covered | pass |
| Scope paragraph `README.md:91–93`, table row 123, docstring 52–54 (changed) | the same three instances | Each says "two rootful rows under the hypothesis that each row's root sublattice is its displayed root lattice" and "every rootful row lattice from the Leech lattice", matching the two signatures; none claims the unconditional separation of the 24 | pass |
| References entry 3068 (changed) | Table 16.1 of SPLAG Chapter 16 | The 24 rows and their Coxeter numbers cited at 6E; the table is the source of the 23 component multisets transcribed in `Rank24/RootSystems.lean` | pass (locator only, see Not verifiable) |
| 6E `eq_of_nonempty_isometry_lattice` (unchanged) | identity; the five equal-`h` pairs | root counts 720 = 720, 432 = 432, 288 = 288, 240 = 240, 144 = 144; `(rank, roots)` multisets distinct, as in the previous report (ee3d302) | pass (previous report) |
| 6E `isEmpty_isometry_lattice_leechLattice` (unchanged) | `A₁²⁴`, `D₂₄` | 48 and 1104 roots against `minimum = 4`, as in the previous report | pass (previous report) |
| 6E Checks 1–4 (unchanged) | all 23 rows; `A₃/D₃`, `A₄/D₄`; `A₁` glue; Leech vs a row | `24h` from 1104 to 48; `3·4 = 12 = 2·3·2`, `20 ≠ 24`; coset minimum `w/2`, Golay `d = 8` gives 4; minimum 4 vs 2 in one genus | pass (previous report) |
| 1H Gauss-sum row (locator changed, statement unchanged) | `oddCyclic 3 _ 1`, `⟨2⟩`, `⟨−2⟩` | Gauss sums `−i√3`, `1 + i`, `1 − i`; signs `−1, 1, −1`; Mathlib's `gaussSum_mul_gaussSum_eq_card` gives `g(χ)g(χ⁻¹) = χ(−1)·3 = −3` for the quadratic character mod 3, consistent with `g² = −3` | pass |
| 6D, 6H, 7C, 5A, 4F, N1, 7E, 5B, 4G, 1I, `GramSameGenus`/`IsGenusMass` (unchanged) | as in the previous reports | `d16PlusGram` minors `4, 8, …, 60, 1`; the sixteen 7C counts; `sphereArea 0 = 0` | pass (previous reports) |
| B1–B8 (unchanged, seeded sample) | `A₂`, `U`, `⟨1,−2⟩`, `!![4,1;1,6]`, `Δ = 12, −3, −4, −23` | `(c, Δ) = (2,−3), (2,1), (1,8), (2,−23)`; automorphism orders `2, 4, 12, 8, 4`; reduced-form counts `1, 1, 3, 3`; measures `π/2`, `log(2+√3)`, `1`; masses `1/12`, `3/4` | pass (previous reports) |

**Headlines and padding.** Unchanged since the previous review: the two 6E statements survived the one-tactic probe there, and no declaration was added or removed here.

## Not verifiable

- Conway–Sloane, *Sphere Packings, Lattices and Groups*, Chapter 16 §1 and Table 16.1 (the locator of 6E and of the new References clause). A Springer book with no legal open copy and no manifest entry; checked mathematically (table above) and against Tau Ceti's transcription in `Rank24/RootSystems.lean`, as in the previous review.
- The items listed under this heading in the previous reports (O'Meara, Cassels, Cohen, Milnor–Husemoller, Wall, Gan–Yu, SPLAG's other chapters, Ebeling, Kitaoka, Kneser, Cox, Kawauchi–Kojima, Serre V.1.4.3) are untouched by this change.

## Source issues

- none
