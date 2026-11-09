# Review of AlgebraicCurves (pull request #1807 at 3adc047)

**Verdict:** needs changes

Incremental re-review of `TauCetiRoadmap/AlgebraicCurves/` at `3adc047`, against the previous review at `ac36c47`. The folder changed by 0 lines: `git diff --stat ac36c47..HEAD -- TauCetiRoadmap/AlgebraicCurves` is empty. The two commits since then touch only `TauCetiRoadmap/ClassifyingSpaces/README.md` and `TauCetiRoadmap/TopologicalKTheory/README.md`, which belong to this pull request and are reviewed separately; neither is cited by this README. One thing outside the folder changed: #1854's description now states the merge order #1101 → #1807 → #1854, which settles the ordering part of R04. Every other previous finding is unrepaired and is restated below with its witness re-checked at this head. R01 (P2) blocks acceptance.

## R01 (P2) — Layers 8–12 and the module docstring treat as unbuilt, or not statable, theorems the pinned Tau Ceti proves

**Location.** `TauCetiRoadmap/AlgebraicCurves/Suggested.lean` lines 27–35: "Headline theorems that are not statable at the pins … the pins have no residue of a differential … no regular projective model attached to a function field and no category of regular projective curves". `README.md` lines 396–399 say that `Suggested.lean` states "the headline theorems the pinned libraries do not prove (Layer 8's tensor-domain criterion and genus non-increase, Layer 11's finiteness theorem)". Layers 8 (lines 888–897, 915–996), 9 (1183–1191), 10 (1313–1354), 11 (1421–1456) and 12 (1468–1659) cite no pinned name for these targets.

**Claim.** README lines 366–367 promise that wherever the pinned Tau Ceti proves a target, the layer cites the pinned name. Layers 0–7 keep that promise. Layers 8–12 instead plan, as new work, theorems the pin already proves. The docstring also calls the Layer 9 residue theorem and the Layer 12 model, projectivity and anti-equivalence "not statable", although the pin has their carriers and proves the theorems.

**Witness.** At Tau Ceti `2fd255d9` each of these elaborates at this head with `#check @` and 0 errors:
- `TauCeti.isDomain_tensorProduct_of_separating` (`TauCeti/FieldTheory/Separable/Regular.lean` 142)
- `TauCeti.genus_le_genus_of_constantCompositum_eq_top` (`…/ConstantExtension/Genus/Basic.lean` 243, with no exactness hypothesis)
- `TauCeti.finsum_traceResidue_kaehlerBasisOfSeparating_coord_eq_zero` (`…/Differential/Independence.lean` 386)
- `TauCeti.finite_algEquiv_of_two_le_genus` (`…/Automorphism/HigherGenus.lean` 124)
- `AlgebraicGeometry.Scheme.isProjectiveOver_of_isCurveOver` (`…/TwoChartModel/ProjectiveEmbedding.lean` 185)
- `TauCeti.AlgebraicGeometry.RegularProjectiveCurveCat.equivFunctionFieldCat` (`…/TwoChartModel/AntiEquivalence.lean` 397)

The other pinned names involved are listed under Verified sound.

**Repair.** Unchanged from the previous review:
- Cite each pinned declaration at its claim, with one clause stating its hypotheses:
  - Layer 8: item 2, and the genus drop with "exact `k`" removed.
  - Layer 8 base change: it needs only `Algebra.IsSeparable k k'`, so "finite separable" at line 352 becomes "separable algebraic".
  - Layer 9: the residue theorem.
  - Layer 10: the hyperelliptic and plane-curve genus.
  - Layer 11: the Weierstrass counts; finiteness, with exactness from `TauCeti.isIntegrallyClosedIn_of_isAlgClosed` and gap injectivity from `fun _ ↦ Nat.cast_injective.injOn` in characteristic 0; and the Hurwitz bound over any exact `k` with tameness.
  - Layer 12: 12A–C and 12E(ii).
- Rewrite docstring lines 10–35 and README lines 396–399 to say that every headline is proved at the pin, naming each one.

#1854's copy of this folder, at its current head `56715a5`, already has this form: its README lines 356–360, 914, 995, 1241, 1511 and 1719, and its `Suggested.lean` docstring.

## R02 (P3) — the three theorems of `Suggested.lean` restate pinned Tau Ceti theorems

**Location.** `Suggested.lean` lines 59–65 (`isDomain_tensorProduct_of_isSeparable`), 77–83 (`genus_le_genus_of_constantCompositum_eq_top`) and 92–96 (`finite_algEquiv_of_two_le_genus`).

**Claim.** Each theorem follows at once from a pinned theorem with the same content, and two of them reuse the pinned short name. The second is narrower than the pin because its `hex` is unused, and the first's `hF` is unused as well.

**Witness.** Re-run at this head on a scratch copy at the pins:
- Line 77 closes with `exact TauCeti.genus_le_genus_of_constantCompositum_eq_top hF h`; Lean flags `hex` as unused.
- Line 92 closes with `exact TauCeti.finite_algEquiv_of_two_le_genus hF TauCeti.isIntegrallyClosedIn_of_isAlgClosed (fun _ ↦ Nat.cast_injective.injOn) hg`.
- Line 59 closes in three steps, and Lean flags `hF` as unused:
  1. `obtain ⟨x, hx, -, hs⟩ := hsep`
  2. `have := TauCeti.isDomain_tensorProduct_of_separating hex hx (x := x) K`
  3. `Function.Injective.isDomain` along `Algebra.TensorProduct.comm k K F`

**Repair.** Delete the three theorems, the `open` and `universe` lines and the two `TauCeti.*` imports. Keep the module docstring, naming the pinned theorems as in R01. In the README, lines 891, 967 and 1432 then name `TauCeti.isDomain_tensorProduct_of_separating`, `TauCeti.genus_le_genus_of_constantCompositum_eq_top` and `TauCeti.finite_algEquiv_of_two_le_genus`. The reduced file is exactly #1854's `Suggested.lean` at `56715a5`: `module`, `public import Mathlib`, the docstring, `@[expose] public section` and an empty namespace.

## R03 (P3) — the route decision and the scheme-side bullet say the pins lack scheme divisors, dimension theory and coherent cohomology

**Location.** `README.md` lines 40–42: "where it is empty (no coherent cohomology, no scheme dimension theory, no divisors on schemes …)". Lines 309–310: "⚠ No divisors, no `Pic(X)`, no dimension theory, no coherent cohomology, no `ℙⁿ` as a named scheme."

**Claim.** This is false at the pins. The README also contradicts itself: lines 327–328 place the cycle substrate `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean` "at the pin", and line 1585 cites `ringKrullDim_stalk_eq_coheight`.

**Witness.**
- Mathlib `1b1ccf4b`, both re-elaborated at this head: `AlgebraicGeometry.AlgebraicCycle.IsWeilDivisor` (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean` 143) and `AlgebraicGeometry.ringKrullDim_stalk_eq_coheight` (`Mathlib/AlgebraicGeometry/Properties.lean` 375).
- Tau Ceti `2fd255d9`: `AlgebraicGeometry.Scheme.Modules.finiteDimensional_cohomology_of_isCurveOver` (`TauCeti/AlgebraicGeometry/Curves/Cohomology.lean` 128), now elaborated as well.

**Repair.**
- At lines 40–42, justify the route by what it gains (Riemann–Roch by linear algebra in `A_F`, and divisors indexed by places) and drop the "empty" clause.
- Replace lines 309–310 with what the pins supply and Layer 12 consumes: Mathlib's `AlgebraicCycle`/`IsWeilDivisor`, `OrderOfVanishing` and stalk Krull dimension, and Tau Ceti's curve cohomology. Keep "no `ℙⁿ` as a named scheme" only after checking it at the pin.

#1854's copy still has both passages (its lines 42–43 and 310–311).

## R04 (P3) — the description says "No Suggested.lean changes", but this folder's `Suggested.lean` changes

**Location.** The pull request description: "No Suggested.lean changes; where a moved target has a declaration in the giving roadmap's acceptance file, the roadmap text describes it in words". `TauCetiRoadmap/AlgebraicCurves/Suggested.lean` lines 1–5, 38 and 100.

**Claim.** The merge order against #1854 is now stated: #1854's merge-order paragraph reads "#1101 → #1807 → this pull request", and #1808's reads "#1101 (ModularCurves) → #1807 (the other loops) → this pull request". So the previous R04's point about a conflicting head with no stated order is repaired. What remains false is the description's claim. This folder's `Suggested.lean` is converted to a module (`module`, three `public import` lines, `@[expose] public section` and a closing `end`). The acceptance files of seven other folders of this pull request change as well.

**Witness.** `git diff --stat origin/main...HEAD -- 'TauCetiRoadmap/*/Suggested.lean'` lists 8 files: AlgebraicCurves (+10 −4, header only), BordismFormalGroups, CharacteristicClasses, ClassifyingSpaces, ComplexKahlerGeometry, PadicFunctionalAnalysis, RigidAnalyticGeometry and TopologicalKTheory.

**Repair.** Replace the sentence with one that is true. For example: "AlgebraicCurves' Suggested.lean only receives the module header; the acceptance files of BordismFormalGroups, CharacteristicClasses, ClassifyingSpaces, ComplexKahlerGeometry, PadicFunctionalAnalysis, RigidAnalyticGeometry and TopologicalKTheory change with their review repairs."

## R05 (P3) — two cross-roadmap locators point to the wrong section or to none

**Location.**
- (a) `README.md` lines 1628–1632: "Acceptance instance (the merged EllipticCurves contract) … is the literature comparison its Layer 2 rests on".
- (b) Line 1804: "Local Fields and Ramification roadmap, ramification-filtration layer". The same unnumbered citation appears at lines 708, 780 and 1936.

**Claim.**
- (a) EllipticCurves names the O₁/O₂ comparison in its Layer 0 as what its literature-definition equivalence for isogenies rests on, and that equivalence is Layer 1 material. Its Layer 2 is torsion and the Weil pairing. EllipticCurves also puts the comparison of isogenies with scheme morphisms outside its scope.
- (b) The LocalFieldsRamification citation names no section.

**Witness.**
- `TauCetiRoadmap/EllipticCurves/README.md` on main `a8eadd4`, re-read at this head:
  - lines 352–354: the literature-definition equivalence, in Layer 0's consumer list;
  - line 423: the Layer 1 heading (isogenies);
  - line 647: the Layer 2 heading (torsion, the Weil pairing);
  - lines 142–148: comparison with scheme morphisms is out of scope.
- `Completed/LocalFieldsRamification/README.md` on main: Layer 3 begins at line 724 and the Herbrand functions at 878.

**Repair.**
- (a) Write: "the comparison EllipticCurves Layer 0 names (the place at `O₁` restricting to the place at `O₂`), on which its Layer 1 literature-definition equivalence rests; the isogeny–scheme-morphism correspondence is a corollary of 12C here, outside EllipticCurves' scope".
- (b) Write "LocalFieldsRamification Layer 3", linked to `../../Completed/LocalFieldsRamification/README.md`, at all four places.

## R06 (P3) — README form: process wording, and none of the house headings, per-layer dependencies or Checks

**Location.** Process wording in `README.md`:
- "open pull requests" at 1873 (and 323–324, 1878–1881);
- "no further current consumer" at 1798;
- "no current roadmap owns" at 1926–1927;
- "so the JacobianChallenge and EllipticCurves maintainers can review the interface early" at 1789–1790;
- "review them with the JacobianChallenge maintainers" at 1903–1904;
- "*(Library list.)*" seven times between 1836 and 1864.

**Claim.** The README is not timeless and does not have the house shape:
- none of the headings `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build` or `## Downstream consumers`;
- no layer ends with `### Examples` and `### Dependencies`, because dependencies are pooled in "Ordering and parallelism" (lines 1754–1810);
- no `**Checks.**` list anywhere.

**Witness.** At this head, `grep -c` for each of those five headings, for `### Examples`, `### Dependencies` and for `**Checks.**` returns 0, and `(Library list.)` returns 7. The `## ` headings present are at lines 78, 107, 163, 183, 364, 394, 1673, 1754, 1812 and 1866 ("Scope boundaries" … "Coordination").

**Repair.** Unchanged:
- Delete the process clauses.
- Regroup the headings into the house form:
  - "Portfolio ownership" and "Scope boundaries" → `## Scope and ownership`;
  - "Standing hypotheses" and "Pinned conventions" → `## Conventions`;
  - "What Mathlib already has", the Tau Ceti carriers paragraph and the contracts table → `## Exact supplier contracts`, with `From Mathlib`, `From Tau Ceti` and `From TauCetiRoadmap.<X>`;
  - "Ordering and parallelism" → `## How to read the build`;
  - Coordination's consumers → `## Downstream consumers`.
- Move each layer's lines from "Ordering and parallelism" and "Worked examples" into that layer's own `### Dependencies` and `### Examples`.
- Give each definition this roadmap still introduces three discriminating Checks.

#1854's copy has the same headings and the same process clauses (its lines 1895, 1910, 1942–1970 and 2032).

## Previous findings

- R01 — not repaired: `Suggested.lean` lines 27–35 still say "Headline theorems that are not statable at the pins … no residue of a differential … no regular projective model"; README 396–399 is unchanged.
- R02 — not repaired: lines 59–96 still declare the three theorems; at the pins the probe closes two in one term and the third in three steps.
- R03 — not repaired: README lines 40–42 and 309–310 still say "no divisors on schemes", "no dimension theory, no coherent cohomology".
- R04 — partly repaired: #1854's merge-order paragraph now states "#1101 → #1807 → this pull request"; this pull request's description still says "No Suggested.lean changes".
- R05 — not repaired: lines 1628–1632 still say "its Layer 2 rests on"; lines 708, 780, 1804 and 1936 still cite "Local Fields and Ramification roadmap" without a section.
- R06 — not repaired: the process clauses at 1789–1790, 1798, 1873, 1903–1904, 1926 and 1836–1864 are unchanged; the heading counts are still 0.

## Verified sound

**The change.** `git diff --stat ac36c47..HEAD -- TauCetiRoadmap/AlgebraicCurves` is empty. Against the merge base with main (`origin/main...HEAD`), the folder differs by one table cell at README line 1803 and the module header of `Suggested.lean` (lines 1–5, 38, 100), as before. Main's newer commit `cb757163` changes only `PROGRESS.md` and `STATUS.md` of this folder, which this pull request does not touch. `lake-manifest.json` pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, unchanged. The brief's exclusion diff over everything outside the pull request's named folders is empty.

**Gate.** The worker's gate at this head (data) passes every check, with `build=0`. I re-ran it by hand with `gate … AlgebraicCurves --base origin/main`: every scanner reports 0 except `outside-folder=20`. All 20 paths lie in folders the brief names as this pull request's own (the hand run does not know that list). The three-dot diff touches exactly the 14 named folders. There is no stray file: the folder holds `README.md`, `Suggested.lean`, `PROGRESS.md`, `STATUS.md` and `metadata.toml`.

**Dependency check** (`gate --depcheck … --movable`):

```text
depcheck: 239 roadmaps, 2379 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean` on `Suggested.lean` gives exactly the three `sorry` warnings, at lines 59, 77 and 92, and nothing else. The elaborated types in `scratch/signatures.md` carry their binders in their own signatures: `[IsAlgClosed k] [CharZero k]` at 92 and `[Algebra.IsAlgebraic k k']` at 77. There is no `lemma`, `set_option`, `#eval`, sorry'd data or placeholder.

**Library names elaborated at the pins.** One scratch file, 0 errors, 33 names:
- the 19 of the previous report: `TauCeti.isDomain_tensorProduct_of_separating`, `…genus_le_genus_of_constantCompositum_eq_top`, `…genus_eq_genus_of_constantCompositum_eq_top` (`ConstantExtension/Genus/Basic.lean` 273), `…finsum_traceResidue_kaehlerBasisOfSeparating_coord_eq_zero`, `TauCeti.Place.traceResidue` (`Place/Expansion/Laurent/CoefficientField.lean` 452), `…genus_eq_of_sq_eq` (`Hyperelliptic/Genus/Basic.lean` 339), `…two_mul_genus_add_three_le_ncard_setOf_weierstrassWeight_ne_zero` and `…isHyperellipticFunctionField_iff_ncard_setOf_weierstrassWeight_ne_zero_eq` (`Differential/Weierstrass/Count.lean` 149, 126), `…finite_algEquiv_of_two_le_genus`, `…natCard_le_eighty_four_mul_genus_sub_one` (`Automorphism/HurwitzBound.lean` 83), `AlgebraicGeometry.Scheme.IsCurveOver` (`Curves/Basic.lean` 37), `TauCeti.AlgebraicGeometry.twoChartModel` (`TwoChartModel/Basic.lean` 143), `…isProjectiveOver_of_isCurveOver`, `…RegularProjectiveCurveCat.equivFunctionFieldCat`, `…twoChartModel.genus_eq_genus` (`TwoChartModel/Genus.lean` 60), `TauCeti.hurwitz_genus_formula` (`Different/Hurwitz.lean` 72), `TauCeti.isIntegrallyClosedIn_of_isAlgClosed` (`RingTheory/IntegralClosure/IntegrallyClosed.lean` 69), and Mathlib's `IsWeilDivisor` and `ringKrullDim_stalk_eq_coheight`;
- `finiteDimensional_cohomology_of_isCurveOver`, which was only read in source last round;
- `TauCeti.finrank_kaehlerDifferential_eq_one_of_separating` (`Differential/Kaehler.lean` 140);
- the Riemann–Hurwitz passage's 12 names: `TauCeti.hurwitz_genus_formula_ratFunc`, `…two_mul_genus_sub_two_eq_iff_forall_isTame`, `TauCeti.geometricDegree`, `TauCeti.Divisor.tameDifferent`, `TauCeti.genus_le_genus`, `…different_ne_zero_of_one_lt_finrank`, `TauCeti.Place.differentExponent_restrict_add`, `TauCeti.Divisor.different_eq_conorm_add`, Mathlib `differentIdeal_eq_differentIdeal_mul_differentIdeal`, `TauCeti.Place`, `TauCeti.Divisor` and `TauCeti.IsFunctionField`.

`TauCeti.AlgebraicGeometry.projectivePlaneCurve.genus_functionField` (`Curves/PlaneCurve/Genus.lean` 126) was read in source only, because its object file is not built in this checkout.

**Seeded sample.** No changed passage contains a sampled target, so the previous report's checks stand. Spot re-checks at this head:
- **Riemann–Hurwitz** (README 842–868): the elaborated `TauCeti.hurwitz_genus_formula` is the README's cross-multiplied form `[k′:k]·(2g′−2) = [F′:F]·(2g−2) + [k′:k]·deg Diff`. Its hypotheses are `FiniteDimensional k k'`, `Algebra.IsSeparable k k'`, `F′/F` finite separable and exact constants on both sides, with no `PerfectField`, matching "no perfectness consumed". All 10 pinned names in the passage resolve.
- **Portfolio ownership** (README 29–34): BelyiMaps on main (lines 185–186) cites "AlgebraicCurves Layers 0–8 and 12" and defines no rival place or divisor theory. EllipticCurves on main (lines 357, 367, 597, 619) consumes this roadmap's place interface and Layer 10 milestone.
- **Route decision** (README 36–56): JacobianChallenge on main, line 139, states the genus as `dim_k H¹(X, 𝒪_X)` and Riemann–Roch as `χ(L) = deg L + 1 − g`, as the README says. EllipticCurves line 394 says "with no Riemann–Roch anywhere", as quoted. The library-emptiness clause is R03.

**Overlaps** (`scratch/overlaps.md` at this head, each item checked):
- No cited id is dropped, no id is defined only by an open revision, and no dropped id is cited elsewhere.
- #1808 (draft, `dc47c7e`) and #1854 (`56715a5`) both state their order after this pull request; R04 is reduced to the description sentence.
- `scratch/citations.md`: no cross-roadmap citation or Lean name is found nowhere.

### Adversarial table

No statement changed since `ac36c47`. Rows 1–3 were re-run at this head (probe values below); rows 4–16 are carried from the previous report (r39, itself carrying r36), with their values restated.

| # | Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|---|
| 1 | `Suggested.lean` 59, `K ⊗[k] F` a domain (r39 row 1) | `k=ℝ`, `F=ℂ(x)`, `K=ℂ`; `k=𝔽_p(a,b)`, `y^p=a+bx^p`, `K=k(a^{1/p},b^{1/p})`; `F=k(x)`; `K=k`; probe at this head | `(1⊗1+i⊗i)(1⊗1−i⊗i)=0`, so not a domain (`hex` fails); `[F:k(x^p)]=p²`, no separating element, `(1⊗y−α⊗1−β⊗x)^p=0`; `K⊗k(x)↪K(x)` is a domain; `k⊗F≅F` is a domain; probe closes in 3 steps, `hF` unused | true; both controls excluded by hypothesis | R02 (pinned) |
| 2 | `Suggested.lean` 77, `g(F′/k′) ≤ g(F/k)` (r39 row 2) | `k′=k`; `y²=x³−t` over `𝔽₃(t)`, `k′=k(t^{1/3})`; same at `p=5`; drop `hex` | `0≤0`; `p=3`: `deg Diff=4`, `2g−2=0`, `g=1→0`; `p=5`: `g=2→0`; one-term probe closes with `hex` unused | true; narrower than the pin | R01, R02 |
| 3 | `Suggested.lean` 92, finiteness of `Aut` (r39 row 3) | `g=0` `k(x)`; `g=1` `y²=x³−x` over `ℂ`; `g=2` `y²=x⁵−1` over `ℂ` | `x↦x+c` infinite (hypothesis `2≤0` false); translations by `E(ℂ)` (`2≤1` false); order 10 `≤ 84`; one-term probe closes | true; genus bound load-bearing | R02 (pinned) |
| 4 | Hurwitz, cross-multiplied (842–849) (r39 row 4) | `y²=x³−x` over `ℚ`; `y²=x⁵−1`; `F′=k′(x)`, `[k′:k]=2`; `y²+y=x³` over `𝔽₂` | `0=−4+4`; `2=−4+6`; `−4=−4+0` (without `[k′:k]`: `g′=−1`); wild `0=−4+4`, a tame count would give odd `2g−2=−3` | true; `[k′:k]` factor needed | none |
| 4′ | Pinned extra `Algebra.IsSeparable k k'` (r39 row 4′) | `a∈k′∖k_s`, `a^p=c∈k_s` | `c∉(F·k_s)^p` by exactness, `T^p−c` irreducible, `F′/F` inseparable: contradiction | implied | none |
| 5 | Cor. 3.4.14 (r39 row 5) | `F=k(x)`; `k(x)(√x)` | `−2=−2·1+0`; `−2=−2·2+2` | true | none |
| 6 | `TauCeti.genus_eq_of_sq_eq`, ℕ division (r39 row 6) | `deg f = 1,…,6` | `(m−1)/2 = 0,0,1,1,2,2`, equal to the README's `(m−1)/2` (odd) and `(m−2)/2` (even) | true | none |
| 7 | Kummer `e=n/r_P`, `d=e−1` (1364) (r39 row 7) | `y²=x` | `e=2, d=1` at `(x)` and `∞`; `2g−2=−4+2`, `g=0` | true | none |
| 8 | Exact-constants guard (1686) (r39 row 8) | `ℂ(x)/ℝ` | `ℓ(0)=dim_ℝ ℂ=2≠1` | true | none |
| 9 | Genus 1 without smooth model (1221–1229) (r39 row 9) | `y²=x³+a` over `𝔽₂(a)` | `e=3, d=2` twice; `−6+4+2=0`, `g=1`; `Δ=0`; `v=y+√a`, `v²=x³` | true | none |
| 10 | AS infinity chart (1709–1711) (r39 row 10) | `w+w²=z³` | `dt=(w²/z²)dz`, `ord=6−2=4` | true | none |
| 11 | Fierce regression (1050–1060) (r39 row 11) | `y²+ty=s`, `z²+tz=u` | `d=2`; Hilbert sum `3≠2`; `f·d=8`; `σ∈G₀∖G₁` | true | none |
| 12 | Hermitian subgroup (1457–1466) (r39 row 12) | `q=37`, `q=41` | `q³` vs `84·(g−1)`: `50653<55860`; `68921>68796` | true; "sufficiently large" | none |
| 13 | Constant-extension guards (950–957) (r39 row 13) | `k=𝔽_p(a)`, `P=(t^p−a)`; `P=(t)` | `e=p`; `e=1` with `κ(Q)/κ(P)=K/k` purely inseparable of degree `p` | true | none |
| 14 | Gaps at genus 2 (1740–1744) (r39 row 14) | `y²=x⁵−1`, branch point; `(0,i)` | `{1,3}`; `{1,2}` | true | none |
| 15 | Route decision (36–56) (r39 row 15) | JacobianChallenge 139; pinned Mathlib | `χ(L)=deg L+1−g` ✓; "no divisors on schemes" ✗ (`IsWeilDivisor` at `AlgebraicCycle/Basic.lean` 143, re-elaborated) | false library claim | R03 |
| 16 | Portfolio ownership (29–34) (r39 row 16) | BelyiMaps and EllipticCurves on main re-read; 5 nearby open roadmaps as in r39 | 0 of 7 define a rival place, divisor or Riemann–Roch theory | true | none |

## Not verifiable

- Stichtenoth, *Algebraic Function Fields and Codes*, 2nd ed., GTM 254: settled as `uncertified` (Springer paywall). The theorem numbers of the Riemann–Hurwitz passage (Thm. 3.4.13, Cor. 3.4.14, 3.5.6–3.5.8, Prop. 3.7.3) were checked against the pinned statements, not against the text.
- Villa Salvador, Goldschmidt, Liu, Hartshorne, Deuring, Rosen, Serre and Roquette/Henn: publisher-held; not sought, since no passage changed.
- Ownership against open pull requests was checked for the closest-vocabulary roadmaps whose heads the brief provides (#1726, #1474, #1707, #1729) and for the consumers named above. NumberFieldArithmetic (#1187) was not checked, because its files were not given.

## Source issues

- none
