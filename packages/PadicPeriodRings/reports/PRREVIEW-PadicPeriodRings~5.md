# Review of PadicPeriodRings (pull request #940 at 32476ef)

**Verdict:** needs changes

🤖 AI review by independent-review-PRREVIEW-PadicPeriodRings~5. Incremental re-review of the 4 lines changed since 038fba6 (README only), plus the pull request's title and description read against this head. Four P3 findings, none blocking.

## R01 (P3) — The Tau Ceti supplier row still calls §0.3 "the LocalFieldsRamification contract"

**Location:** `TauCetiRoadmap/PadicPeriodRings/README.md:28` ("(TauCeti.RingTheory.LocalRing.RamificationGroup): the carrier of the LocalFieldsRamification contract recorded in §0.3, and in degree 0 the inertia set of §1.6").

**Claim:** §0.3 records a contract of LocalFieldsRamification.

**Witness:** `README.md:7` (repaired) and `README.md:75` both say §0.3 records "the perfect-residue Herbrand contract of RamificationOfCompleteDiscretelyValuedFields". `grep -n LocalFieldsRamification README.md` lists 28, 31, 75, 115, 119, 133, 137, 170; line 28 is the remaining misattribution.

**Repair:** At `README.md:28` replace "the carrier of the LocalFieldsRamification contract recorded in §0.3" with "the carrier of the RamificationOfCompleteDiscretelyValuedFields contract recorded in §0.3". The other seven lines are finite-residue citations or pinned `TauCeti.LocalFieldsRamification.*` names and stay.

## R02 (P3) — `conductorExponent_eq_sInf_upperRamificationGroup` is not a name of ClassFieldTheory on main

**Location:** `TauCetiRoadmap/PadicPeriodRings/README.md:33` ("its unit-filtration reciprocity (`map_unitFiltration_normResidue`, with the conductor consequence `conductorExponent_eq_sInf_upperRamificationGroup`)").

**Claim:** ClassFieldTheory Layer 7 has a declaration of that name.

**Witness:** ClassFieldTheory was revised on main after 038fba6 was reviewed. `TauCetiRoadmap/ClassFieldTheory/README.md:303` maps `map_unitFiltration_normResidue` to `normResidue_map_unitFiltration` (`Suggested.lean:97`); the conductor name has no row and occurs nowhere on main, at the pins or at any open head. The conductor statement there is `conductorExponent_le_iff_upperRamificationGroup_eq_bot` (README lines 1310, 1320).

**Repair:** Delete ", with the conductor consequence `conductorExponent_eq_sInf_upperRamificationGroup`" from `README.md:33`: no target here consumes ClassFieldTheory's conductor statement (the only other conductor, at line 295, is §2's own, defined through geometric reciprocity). Optionally write the reciprocity name as `normResidue_map_unitFiltration` at lines 33 and 119; the old name stays valid through the supplier's mapping row.

## R03 (P3) — The description's dependency sentence omits six suppliers and calls them consumers

**Location:** pull request description ("Dependencies …: PerfectoidTowers, PerfectoidSpaces, EtaleCohomologyFoundations and DerivedModuleAlgebra … Everything else named in the README is a consumer, not a prerequisite.").

**Claim:** The README has four roadmap suppliers and names every other roadmap as a consumer.

**Witness:** The supplier table at `README.md:29–34` also has rows for ProfiniteCohomology, ProfiniteArithmetic, LocalFieldsRamification, RamificationOfCompleteDiscretelyValuedFields, ClassFieldTheory and LocalGaloisGroups, each consumed in a `*Needs:*` line (for example `README.md:137`).

**Repair:** Replace the two sentences with: "Dependencies (cited in the README by roadmap name and section; the Lean imports none of them): PerfectoidTowers (open), and on main PerfectoidSpaces, EtaleCohomologyFoundations, DerivedModuleAlgebra, ProfiniteCohomology, ProfiniteArithmetic, LocalFieldsRamification, LocalGaloisGroups, ClassFieldTheory (Layers 6–7) and RamificationOfCompleteDiscretelyValuedFields (§§3a, 4a). The roadmaps listed under Consumers in the README's scope section are not prerequisites."

## R04 (P3) — The description's account of the source roadmaps is out of date

**Location:** pull request description ("previously in SelmerIwasawaCohomology §4.1 and … FiniteFlatGroupsAndIntegralPadicHodgeTheory (R07.1.18 and the carrier part of R07.3.0) … The source roadmaps drop their copies in their next commits.").

**Claim:** The two source roadmaps still carry the copies.

**Witness:** At their open heads, FiniteFlatGroupsAndIntegralPadicHodgeTheory has no R07.1.18 (headings run R07.1.17, R07.1.19) and cites PadicPeriodRings 59 times, R07.3.0 being "Finite-`K` comparison of period rings and realizations"; SelmerIwasawaCohomology has no ℂ_p/B_dR §4.1 and cites PadicPeriodRings §§1–4.

**Repair:** Replace the last sentence with: "Both source roadmaps have dropped their copies and cite PadicPeriodRings §§1–4 instead." Keep the section numbers only as "formerly".

## Previous findings

- R01 — partly repaired: `README.md:7` now reads "consumes from RamificationOfCompleteDiscretelyValuedFields (§0.3)"; the same misattribution remains in the Tau Ceti row at `README.md:28`, so that report's retest grep still fails (R01 above).
- R02 — repaired: `README.md:75` now reads "the different formula `ord_L(𝔇_{L/K}) = Σ_{g≠1} i_G(g)`, and the subgroup rule `H_u = G_u ∩ H` (§3a.1)"; the supplier on main states it in §3a.1 (its README line 460).
- R03 — repaired: both suppliers are now on main (RamificationOfCompleteDiscretelyValuedFields; ClassFieldTheory `## Layer 7` at its README line 1204), so the merge-order block's single open supplier, PerfectoidTowers, is complete.

## Verified sound

| Statement / object | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| §0.3 subgroup rule `H_u = G_u ∩ H`, now under §3a.1 | `ℚ₂(ζ₈)/ℚ₂`, `G = (ℤ/8)^×`, `H = {1,5} = Gal(/ℚ₂(i))` | `G_0=G_1=G`, `G_2=G_3={1,5}`, `G_4=1`. `H`: `σπ−π = −2ζ₈`, `ord_L = 4`, so `H_u=H` for `u≤3`, 1 after. `G_u∩H`: same | pass |
| Same rule in upper numbering (why §3a.1, not §3a.2) | same, `v = 5/2` | `G^{5/2} = 1` (upper jumps 1, 2), `H^{5/2} = H` (jump 3): `G^v∩H ≠ H^v`; with `ψ_{ℚ₂(i)/ℚ₂}(5/2) = 4`: `H^4 = 1` | lower-only; §4a.2 form holds |
| §0.3 different formula, same §3a.1 group | `ℚ₂(ζ₈)/ℚ₂` | `i_G(5) = 4`, `i_G(3) = i_G(7) = 2`: `Σ = 8`; Hilbert form `3+3+1+1 = 8` | pass |
| §1.3 unit-filtration reciprocity (R02's citation) | `ℚ₂(i)/ℚ₂`, `n = 0,1,2` | norm units `= 1+4ℤ₂`; `U^0=U^1=ℤ₂^×` onto `G`, `U^2` to 1; `G^1 = G`, `G^2 = 1` (upper jump `φ(1) = 1`); conductor exponent 2, discriminant 4 | pass |
| Scope line 7 against supplier's scope | objects of §2 | supplier README 115–117: PadicPeriodRings owns finite-isogeny `π₁`, reciprocity map, Sen tower estimates; this README line 9 lists the same four items | one owner each |

Rows for all other statements stand as in the previous review, of `038fba6`; `Suggested.lean` is unchanged since then (`git diff --stat 038fba6 HEAD`: README only, 2 insertions, 2 deletions).

- Gate at this head, rerun: every scanner 0, `depcheck=0`, OK; the worker's run adds `build=0`.
- Dependency check: `depcheck: 245 roadmaps, 2209 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Merge order: RamificationOfCompleteDiscretelyValuedFields 2, PerfectoidTowers 22, PadicPeriodRings 23.
- Elaboration of `TauCetiRoadmap/PadicPeriodRings/Suggested.lean`: 14 `declaration uses sorry` warnings, nothing else, exit 0. Signatures, probes and the headline audit carry over with the unchanged file.
- Cross-roadmap citations re-resolved on main: RamificationOfCompleteDiscretelyValuedFields §§3a.1–3a.3, 4a.1–4a.3 (headings at its README lines 421, 566, 696, 908, 1079, 1185), `perfectResidueHerbrand`, ClassFieldTheory Layer 7 (line 1204), `map_unitFiltration_normResidue` via the mapping row at line 303.
- Files changed outside the folder: none.
- Pull request text: title and summary block agree with the head (Ax–Sen–Tate §1.2, `tateSen_H0`/`tateSen_H1`/`tateSen_character` §2, geometric reciprocity §2 line 295, period carriers §4); the `depends-on` and `merge-order` blocks are generated and were not judged.
- Remark: the summary block's "deeply ramified towers" is the README's "infinitely ramified Galois extension whose group contains an open `ℤ_p`-subgroup" (`README.md:133`); no change asked.
- Overlap check: read RamificationOfCompleteDiscretelyValuedFields, ClassFieldTheory, LocalFieldsRamification (all on main); perfect-residue Herbrand package and proalgebraic unit group: RamificationOfCompleteDiscretelyValuedFields; unit-filtration reciprocity: ClassFieldTheory; geometric reciprocity and Sen tower estimates: this roadmap.

Source independence: changed passages only: 2 passages (a roadmap name; a moved clause consisting of a formula), no prose added, so none shared with any source; shares and contents not recomputed, no layer added, removed or reordered.

## Not verifiable

- Serre, Local Fields, III §6 and IV §§1–3 (`README.md:76`): paywalled, uncertified; the moved clause was checked against the supplier's §3a.1 instead.

## Source issues

- none

## For the human reviewers

- none
