# Review of IntegralLattices (pull request #1239 at ee3d302)

**Verdict:** needs changes

This is an incremental re-review of the 104 lines changed since 6cbd696: 69 in the README and 35 in `Suggested.lean`. The change has two parts. It restores milestone 6E as the separation of the 24 rank-24 lattices, stated on Tau Ceti's native `RootfulNiemeierType.lattice` and `leechLattice`. It also moves the imports onto the new Tau Ceti pin (`2fd255d`), which arrived through the merge from main. The pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/IntegralLattices` is empty). The two new Lean statements are true, correctly hypothesised and not padding. The gate passes. Two findings remain: the lead sentence of 6E claims more than the milestone proves, and one supplier-table locator is wrong.

## R01 (P2) — 6E's lead sentence drops the root-sublattice hypothesis

**Location.** `TauCetiRoadmap/IntegralLattices/README.md:2112–2113`: "This milestone proves that the 24 are pairwise non-isometric, the root system of each being the invariant that separates it".

**Claim.** The milestone proves that the 24 lattices are pairwise non-isometric.

**Witness.** The same subsection says otherwise at `README.md:2133–2134`: "The root-sublattice condition is a hypothesis of the first statement, and proving it is not part of this milestone." The Lean statement (`Suggested.lean:655`) assumes `hr` and `hs`. Take the row `A₂¹²`. At the pin, `Rank24/Glue/IdentifiedRows.lean` gives its table glue subgroup an order (`natCard_glueSubgroup_a2Twelfth`, line 140) but no bound `μ(w) ≥ 4`, and `span_vectorsOfNorm_two_lattice_of_ne` excludes the row. So nothing here proves that `N_{A₂¹²}` is not isometric to `N_s`. That conclusion needs Rank-24 lattice constructions, Layer 3, which consumes this roadmap.

**Repair.** Replace the sentence with: "This milestone proves that no row lattice is isometric to the Leech lattice, and that two row lattices whose root sublattices are their displayed root lattices are isometric only when the rows agree. Once that hypothesis is discharged for every row (by `RootfulNiemeierType.span_vectorsOfNorm_two_lattice_of_ne` for nineteen rows, and by Rank-24 lattice constructions, Layer 3, for the other four), the 24 are pairwise non-isometric, with the root system as the separating invariant (Conway–Sloane, Chapter 16 §1 and Table 16.1)."

Tested on `A₂¹²`: the reworded sentence claims only what `eq_of_nonempty_isometry_lattice` (conditional on `hr` and `hs`) and `isEmpty_isometry_lattice_leechLattice` (unconditional) state. It agrees with the scope-table row (`README.md:120`, "with the root sublattice of each row as a hypothesis") and with how OrthogonalTamagawaAndLatticeMass, at its open head, consumes §6E (its README, line 34: "its statement for two table rows assumes that each row's root sublattice is the row's displayed root lattice").

## R02 (P3) — the 6E supplier row gives no file that declares `leechLattice`

**Location.** `TauCetiRoadmap/IntegralLattices/README.md:436`, the §*From Tau Ceti* row for 6E. It lists "`leechLattice` with `vectorsOfNorm_two_leechLattice`" under "`Rank24/RootSystems.lean`, `Rank24/Niemeier.lean`, `Rank24/Leech/Minimum.lean`, `PosDef/RepresentationNumber.lean`".

**Witness.** At the pinned Tau Ceti, `noncomputable def leechLattice` is at `TauCeti/LinearAlgebra/IntegralLattice/Rank24/Leech/Basic.lean:236`. None of the four listed files declares it: `Leech/Minimum.lean` only imports it and proves `minimum_leechLattice` (line 173) and `vectorsOfNorm_two_leechLattice` (line 189). OrthogonalTamagawaAndLatticeMass, at its head, cites the same declaration in `Rank24/Leech/Basic.lean` (its README, line 30).

**Repair.** Add `Rank24/Leech/Basic.lean` to the Location cell of that row. Every other name in the row is declared in a listed file: `RootfulNiemeierType` and `components_multiset_injective` in `Rank24/RootSystems.lean`, lines 43 and 216; `lattice`, `rootLattice`, `rootLattice_carrier_le_lattice_carrier` and `span_vectorsOfNorm_two_lattice_of_ne` in `Rank24/Niemeier.lean`, lines 84, 77, 111 and 200; `Isometry.map_span_vectorsOfNorm` in `PosDef/RepresentationNumber.lean`, line 179.

## Previous findings

- none: the previous report (6cbd696) accepted the folder and raised no finding.

## Verified sound

**Scope of this review.** I reviewed in full every changed passage and everything that cites or depends on it:

- the OTM consumption sentence (`README.md:90–94`);
- the Rank-24 row of the out-of-scope table (`README.md:120`);
- the new 6E row of §*From Tau Ceti* (`README.md:436`) and the `checkerboardPlusLattice` rename in the 0G row (`README.md:435`);
- milestone 6E and its four Checks (`README.md:2107–2158`);
- the 6E row of the Layer 6 dependency table (`README.md:2229`);
- the Downstream consumers line (`README.md:2995`);
- in `Suggested.lean`: the import changes (lines 11–13), the module-docstring headline list (lines 51–53) and the two new theorems (lines 644–670).

The seeded sample B1–B8 lies wholly outside the changed lines.

**Gate and build.**

- I ran the gate on this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate on the same head adds `build=0`.
- `lake env lean TauCetiRoadmap/IntegralLattices/Suggested.lean` exits 0 with 31 warnings, all `declaration uses sorry`, at lines 110, 210, 227, 270, 282, 327, 341, 356, 374, 396, 442, 449, 470, 483, 521, 535, 552, 569, 576, 585, 594, 638, 655, 668, 676, 687, 708, 723, 796, 821 and 859, and nothing else. That is 29 before plus the two new theorems. No deprecation diagnostic remains, because the import now names `RootLattice.TypeE.Basic`.
- All three new imports exist at the pin with their object files.
- Dependency check:

```text
depcheck: 239 roadmaps, 2363 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. 6E's *Needs:* names only Tau Ceti's native rows 0F, 0G and 2B (`README.md:452–455` defines these labels as native) and the Tau Ceti rank-24 declarations. It cites no roadmap milestone.

**Signatures.** I compared the elaborated types of the two new declarations (the worker's transcript, and my own `#check` file) with the README:

- `eq_of_nonempty_isometry_lattice : ∀ {r s : RootfulNiemeierType}, span ℤ (coe '' r.lattice.vectorsOfNorm 2) = r.rootLattice.carrier → (same for s) → Nonempty (r.lattice.Isometry s.lattice) → r = s`;
- `isEmpty_isometry_lattice_leechLattice : ∀ r, IsEmpty (r.lattice.Isometry leechLattice)`.

Both are closed statements, so no section binder can be lost. Their generality equals the README's ("two rows whose lattices have root sublattices `R_r` and `R_s`", "no row lattice"). The hypotheses match the conclusion of `RootfulNiemeierType.span_vectorsOfNorm_two_lattice_of_ne` exactly, so a consumer discharges them for the nineteen rows by that lemma. The file now has 66 declarations, the 64 before plus these two. The fully qualified names lie under `TauCetiRoadmap.IntegralLattices` and collide with no Tau Ceti declaration and no other roadmap's.

**Headlines and padding.** The module docstring adds 6E to its headline list. Both statements survive the one-tactic probe on a scratch copy, elaborated at the pins: `first | rfl | (simp_all; done) | infer_instance | decide | (aesop; done) | omega` fails on the first. On the second, the same tactics fail, and so does `exact ⟨fun e ↦ by simpa using e.carrierEquiv_image_vectorsOfNorm 2⟩`, which leaves `r.lattice.vectorsOfNorm 2 = ∅` to refute. The first needs the uniqueness of the decomposition of an ADE root lattice into irreducible summands, a real theorem; the second needs a root of `R_r` inside `N_r`. Neither restates a definition or mirrors a Check.

**Library declarations opened at the pins.** All are in Tau Ceti, with paths relative to `TauCeti/LinearAlgebra/`:

- `IntegralLattice/Rank24/RootSystems.lean`: lines 43, 131, 159, 180 (the row type, components, Coxeter numbers, root counts), 211 (`numRoots_eq_rank_mul_coxeterNumber`), 216 (`components_multiset_injective`, proved by injectivity of the `(rank, numRoots)` multisets).
- `IntegralLattice/Rank24/Niemeier.lean`: lines 77, 84, 97 (`lattice_form`), 111, 154, 158, 163, 169 (`isUnimodular_lattice_iff`), 200.
- `IntegralLattice/Rank24/Leech/Basic.lean`: lines 236, 285, 289, 299, 304.
- `IntegralLattice/Rank24/Leech/Minimum.lean`: lines 173 and 189.
- `IntegralLattice/PosDef/RepresentationNumber.lean`: lines 166 and 179.
- `IntegralLattice/Norm.lean`: line 78 (`norm = form.toQuadraticMap`, so norm 2 means `B(x, x) = 2`) and line 221 (`vectorsOfNorm`).
- `IntegralLattice/Isometry/Basic.lean`: line 77 (an ambient form isometry carrying carrier onto carrier).
- `IntegralLattice/RootLattice/Roots.lean`: line 188 (`representationNumber_rootLattice_two`, the root count of a native root lattice is `numRoots`, the input the 6E route needs) and line 110 (`norm_rootLatticeRoot`, a root exists for the Leech statement).
- `IntegralLattice/RootLattice/GlueAlphabet/Roots.lean`: line 81.
- `RootSystem/DynkinType.lean`: line 153 (`Valid` requires `4 ≤ n` for `D n`, which the second Check relies on).
- `RootSystem/NumberOfRoots.lean`: line 45.
- `IntegralLattice/RootLattice/TypeD/Plus.lean`: line 160 (`checkerboardPlusLattice`).
- `IntegralLattice/RootLattice/D8Plus/Isometry.lean`: line 292 (`typeE₈IsometryD8Plus`).
- `IntegralLattice/Rank24/Glue/IdentifiedRows.lean`: lines 94, 140, 266, 328. Each of the four excluded rows has a table glue subgroup of the displayed order, so all 23 row lattices are unimodular at the pin, as 6E and the Leech docstring say.

The worker's resolver lists 17 Lean names it found nowhere. All 17 are this roadmap's own and declared in `Suggested.lean`, including the two new ones. Every other backticked name in the README occurs at the new pin.

**An observation, not a finding.** `IdentifiedRows.lean` also proves `μ(w) ≥ 4` for the table glue subgroups of `A₁²⁴`, `D₄⁶` and `A₁₁D₇E₆` (lines 107, 277, 340), but not for `A₂¹²`. With `DynkinType.span_vectorsOfNorm_two_gluedLattice`, that already gives the root-sublattice hypothesis for those three table lattices. I established this by reading the statements, not by elaborating, because that module's object file is not built at the pin. The README's sentence, that the table-lattice statement for the four rows is a completion criterion of Rank-24 lattice constructions, Layer 3, is still accurate. The hypothesis design is needed for `A₂¹²` in any case.

**Cross-roadmap citations and ownership.**

- Rank-24 lattice constructions (main) has Layers 3 and 6 (its README, lines 223 and 312) and the completion criterion (line 376). It consumes this roadmap (lines 28–29). It explicitly proves no uniqueness from a root system and no classification (lines 15–18). It proves only that the 23 *displayed descriptions* are distinct, and does not turn that into a statement about the lattices (lines 242–244). So 6E plans nothing that roadmap plans, and supply runs one way.
- OrthogonalTamagawaAndLatticeMass, at its open head, cites §6E with the hypothesis (README lines 9, 34, 551, 555, 559, 582), states "Pairwise non-isometry is IntegralLattices §6E and is not proved again here", and owns the rank-24 exhaustion in §4.2. This matches the README's "that the 24 exhaust the genus is OTM §4.2's".
- A by-object search of the open heads and main (`pairwise non-isometric`, `Isometry leechLattice`, the two new names) finds no second owner.
- ThetaSeries on main (line 103) mentions "Its 6E, the rank-24 reference lattices" as consumed by no milestone. That id was absent at 6cbd696 and exists again here, so nothing breaks.
- Overlaps: #1187 changes only `Completed/IntegralLattices`, so its head does not touch this folder. No id is dropped.

**Adversarial pass.** I used exact integer arithmetic. The untouched rows cite the previous reports.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 6E `eq_of_nonempty_isometry_lattice` (new) | `r = s`; the five equal-`h` pairs D₁₆E₈/E₈³, A₁₇E₇/D₁₀E₇², A₁₁D₇E₆/E₆⁴, A₉²D₆/D₆⁴, A₅⁴D₄/D₄⁶ | identity isometry: conclusion `r = r`. Root counts 720 = 720, 432 = 432, 288 = 288, 240 = 240, 144 = 144. `(rank, roots)` multisets: {(16,480),(8,240)} vs {(8,240)³}; {(17,306),(7,126)} vs {(10,180),(7,126)²}; {(11,132),(7,84),(6,72)} vs {(6,72)⁴}; {(9,90)²,(6,60)} vs {(6,60)⁴}; {(5,30)⁴,(4,24)} vs {(4,24)⁶}, all distinct. Hypotheses native at the pin for eight of these rows; conditional for A₁₁D₇E₆ and D₄⁶ | pass |
| 6E route (new) | roots in `⊕ Rᵢ`; irreducible types at equal rank | a norm-2 vector of an orthogonal sum of even positive definite lattices has exactly one nonzero component. Every root `α = Σ cᵢαᵢ` has `Σ cᵢ(α, αᵢ) = 2`, so it meets a simple root. Coxeter numbers `n+1`, `2n−2`, then 12, 18, 30: rank 4 gives 5, 6; rank 6 gives 7, 10, 12; rank 8 gives 9, 14, 30; `n+1 = 2n−2` only at `n = 3`, which `Valid` excludes. `lattice_form` makes the ambient isometry restrict to `R_r → R_s` | pass |
| 6E `isEmpty_isometry_lattice_leechLattice` (new) | `r = A₁²⁴` (fewest roots), `r = D₂₄` (most) | `R_r` has `24·2 = 48` and `2·24·23 = 1104` roots, all in `N_r`. Leech: `vectorsOfNorm 2 = ∅`, `minimum = 4`. An isometry preserves shells (`carrierEquiv_image_vectorsOfNorm`), a contradiction. Both are even, unimodular, positive definite, rank 24, so of one genus | pass |
| 6E Check 1 (new) | all 23 rows | `24h` = root count in each row, from D₂₄ `1104 = 24·46` to A₁²⁴ `48 = 24·2` (including A₁₅D₉ `240+144 = 384 = 24·16`, A₇²D₅² `112+80 = 192 = 24·8`); `480+240 = 720 = 3·240`, `306+126 = 432 = 180+2·126` | pass |
| 6E Check 2 (new) | A₃, D₃, A₄, D₄ | `3·4 = 12 = 2·3·2`; `4·5 = 20 ≠ 24 = 2·4·3` | pass |
| 6E Check 3 (new) | A₁ glue | `(α/2)² = 1/2`; weight `w` gives `w/2`; `w = 4` gives 2 (a root outside `R_r`); Golay `d = 8` gives 4 | pass |
| 6E Check 4 (new) | Leech vs a row | minimum 4 vs 2; signature `(24, 0)` and trivial discriminant form on both sides, so one genus by 5A | pass |
| Scope line 91, table row 120, consumers line (changed) | OTM head; Rank-24 lattice constructions on main | OTM consumes §6E with the hypothesis and does not reprove it; Rank-24 lattice constructions states no non-isometry; 6C–6E consistent across lines 91 and 2995 | pass |
| 6D, 6H, 7C, 5A, 4F, N1, 7E, 5B, 4G, 1H/1I, `GramSameGenus`/`IsGenusMass` (unchanged) | as in the previous reports | values in the previous report (6cbd696) and the one before (b0defd8): `d16PlusGram` minors `4, 8, …, 60, 1`; the sixteen 7C counts; `sphereArea 0 = 0`; Gauss sums `1 + i`, `−i√3` | pass (previous reports) |
| B1–B8 (unchanged, seeded sample) | `A₂`, `U`, `⟨1,−2⟩`, `!![4,1;1,6]`, `Δ = 12, −3, −4, −23` | `(c, Δ) = (2,−3), (2,1), (1,8), (2,−23)`; automorphism orders `2, 4, 12, 8, 4`; reduced-form counts `1, 1, 3, 3`; measures `π/2`, `log(2+√3)`, `1`; masses `1/12`, `3/4` | pass (previous reports) |

## Not verifiable

- Conway–Sloane, *Sphere Packings, Lattices and Groups*, Chapter 16 §1 and Table 16.1, the locator of 6E. It is a Springer book with no legal open copy and no manifest entry. I checked the statement mathematically instead (table above) and against Tau Ceti's transcription of the table (`Rank24/RootSystems.lean`, which cites the same table).
- The items listed under this heading in the previous reports (O'Meara, Cassels, Cohen, Milnor–Husemoller, Wall, Gan–Yu, SPLAG's other chapters, Ebeling, Kitaoka, Kneser, Cox, Kawauchi–Kojima, Serre V.1.4.3) are unchanged, and the change does not touch them.

## Source issues

- none
