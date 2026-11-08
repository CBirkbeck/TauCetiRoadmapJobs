# Review of AlgebraicCurves (pull request #1807 at ac36c47)

**Verdict:** needs changes

Incremental re-review of `TauCetiRoadmap/AlgebraicCurves/` at `ac36c47`, against the previous review at `70140e6`. The folder changed by 0 lines since that head (`README.md` and `Suggested.lean` are byte-identical), and the pull request description is unchanged. The only commit since is `ac36c477`, which touches `TauCetiRoadmap/CharacteristicClasses/` (one of the pull request's own folders, reviewed separately). So no previous finding is repaired; each is restated below with its witness re-checked at this head. The one P2 (R01) blocks acceptance.

## R01 (P2) — Layers 8–12 and the module docstring treat as unbuilt, or not statable, theorems the pinned Tau Ceti proves

**Location.** `TauCetiRoadmap/AlgebraicCurves/Suggested.lean` lines 27–35: "Headline theorems that are not statable at the pins … the pins have no residue of a differential … no regular projective model attached to a function field and no category of regular projective curves". `README.md` lines 396–399: "`Suggested.lean` states the headline theorems the pinned libraries do not prove (Layer 8's tensor-domain criterion and genus non-increase, Layer 11's finiteness theorem)". Layers 8 (lines 888–897, 915–996), 9 (1183–1191), 10 (1313–1354), 11 (1421–1456) and 12 (1468–1659) cite no pinned name for these targets.

**Claim.** README lines 366–367 promise that where the pinned Tau Ceti proves a target, the layer cites the pinned name. Layers 0–7 keep that promise; Layers 8–12 plan as work to build what the pin already proves, and the docstring calls the Layer 9 residue theorem and the Layer 12 model, projectivity and anti-equivalence "not statable" although the pin has their carriers and proves the theorems.

**Witness.** At Tau Ceti `2fd255d9` every one of these elaborates (`#check @`, 0 errors, re-run at this head): `TauCeti.isDomain_tensorProduct_of_separating` (`TauCeti/FieldTheory/Separable/Regular.lean` 142), `TauCeti.genus_le_genus_of_constantCompositum_eq_top` (`…/ConstantExtension/Genus/Basic.lean` 243, no exactness hypothesis), `TauCeti.finsum_traceResidue_kaehlerBasisOfSeparating_coord_eq_zero` (`…/Differential/Independence.lean` 386) with `TauCeti.Place.traceResidue` (`…/Laurent/CoefficientField.lean` 452), `TauCeti.genus_eq_of_sq_eq` (`…/Hyperelliptic/Genus/Basic.lean` 339), `TauCeti.two_mul_genus_add_three_le_ncard_setOf_weierstrassWeight_ne_zero` and `TauCeti.isHyperellipticFunctionField_iff_ncard_setOf_weierstrassWeight_ne_zero_eq` (`…/Weierstrass/Count.lean` 149, 126), `TauCeti.finite_algEquiv_of_two_le_genus` (`…/Automorphism/HigherGenus.lean` 124), `TauCeti.natCard_le_eighty_four_mul_genus_sub_one` (`…/Automorphism/HurwitzBound.lean` 83), `AlgebraicGeometry.Scheme.IsCurveOver` (`TauCeti/AlgebraicGeometry/Curves/Basic.lean` 37), `TauCeti.AlgebraicGeometry.twoChartModel` (`…/TwoChartModel/Basic.lean` 143), `AlgebraicGeometry.Scheme.isProjectiveOver_of_isCurveOver` (`…/TwoChartModel/ProjectiveEmbedding.lean` 185), `TauCeti.AlgebraicGeometry.RegularProjectiveCurveCat.equivFunctionFieldCat` (`…/TwoChartModel/AntiEquivalence.lean` 397) and `TauCeti.AlgebraicGeometry.twoChartModel.genus_eq_genus` (`…/TwoChartModel/Genus.lean` 60). The smooth plane curve genus is `TauCeti.AlgebraicGeometry.projectivePlaneCurve.genus_functionField` (`…/Curves/PlaneCurve/Genus.lean` 126, read in source: its object file is not built in this checkout).

**Repair.** Unchanged from the previous review: cite each pinned declaration at its claim with one clause stating its hypotheses (Layer 8 item 2 and the genus drop, dropping "exact `k`" from the drop; Layer 8 base change needs only `Algebra.IsSeparable k k'`, so "finite separable" at line 352 becomes "separable algebraic"; Layer 9 residue theorem; Layer 10 hyperelliptic and plane genus; Layer 11 Weierstrass counts, finiteness with exactness from `TauCeti.isIntegrallyClosedIn_of_isAlgClosed` and gap injectivity `fun _ ↦ Nat.cast_injective.injOn` in characteristic 0, and the Hurwitz bound over any exact `k` with tameness; Layer 12A–C and 12E(ii)). Then rewrite docstring lines 10–35 and README lines 396–399 to say every headline is proved at the pin, naming each. The copy of this folder at #1854's head (`c07dda7`) already has this form (its README lines 359–360, 914, 995, 1241, 1511, 1719 and its `Suggested.lean` docstring).

## R02 (P3) — the three theorems of `Suggested.lean` are pinned Tau Ceti theorems restated

**Location.** `Suggested.lean` lines 59–65 (`isDomain_tensorProduct_of_isSeparable`), 77–83 (`genus_le_genus_of_constantCompositum_eq_top`), 92–96 (`finite_algEquiv_of_two_le_genus`).

**Claim.** Each follows directly from the pinned theorem of the same content; two carry the pinned short name; the second is narrower than the pin (its `hex` is unused), and the first's `hF` is unused as well.

**Witness.** Re-run on a scratch copy at the pins: `exact TauCeti.genus_le_genus_of_constantCompositum_eq_top hF h` closes line 77 (`hex` flagged unused); `exact TauCeti.finite_algEquiv_of_two_le_genus hF TauCeti.isIntegrallyClosedIn_of_isAlgClosed (fun _ ↦ Nat.cast_injective.injOn) hg` closes line 92; line 59 closes in three steps (`obtain ⟨x, hx, -, hs⟩ := hsep`, `have := TauCeti.isDomain_tensorProduct_of_separating hex hx K`, then transport along `Algebra.TensorProduct.comm k K F` by `RingEquiv.injective.isDomain`), with `hF` flagged unused.

**Repair.** Delete the three theorems, the `open` and `universe` lines and the two `TauCeti.*` imports; keep the module docstring naming the pinned theorems as in R01; in the README, lines 891, 967 and 1432 then name `TauCeti.isDomain_tensorProduct_of_separating`, `TauCeti.genus_le_genus_of_constantCompositum_eq_top` and `TauCeti.finite_algEquiv_of_two_le_genus`. The reduced file (`module`, `public import Mathlib`, docstring, `@[expose] public section`, empty namespace) is exactly #1854's `Suggested.lean`.

## R03 (P3) — the route decision and the scheme-side bullet say the pins lack scheme divisors, dimension theory and coherent cohomology

**Location.** `README.md` lines 40–43: "where it is empty (no coherent cohomology, no scheme dimension theory, no divisors on schemes …)". Lines 309–310: "⚠ No divisors, no `Pic(X)`, no dimension theory, no coherent cohomology, no `ℙⁿ` as a named scheme."

**Claim.** False at the pins, and contradicted by the README itself at lines 327–328 (the cycle substrate `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean` "at the pin") and line 1585 (`ringKrullDim_stalk_eq_coheight`).

**Witness.** Mathlib `1b1ccf4b`: `AlgebraicGeometry.AlgebraicCycle.IsWeilDivisor` (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean` 143) and `AlgebraicGeometry.ringKrullDim_stalk_eq_coheight` (`Mathlib/AlgebraicGeometry/Properties.lean` 375), both re-elaborated. Tau Ceti `2fd255d9`: `AlgebraicGeometry.Scheme.Modules.finiteDimensional_cohomology_of_isCurveOver` (`TauCeti/AlgebraicGeometry/Curves/Cohomology.lean` 128, read in source).

**Repair.** Justify the route at lines 40–43 by what it gains (Riemann–Roch by linear algebra in `A_F`, divisors indexed by places) and drop the "empty" clause; replace lines 309–310 with what the pins supply and Layer 12 consumes (Mathlib's `AlgebraicCycle`/`IsWeilDivisor`, `OrderOfVanishing`, stalk Krull dimension; Tau Ceti's curve cohomology), keeping "no `ℙⁿ` as a named scheme" only after checking it at the pin.

## R04 (P3) — #1854 changes this folder differently, and no merge order is stated

**Location.** This folder's `Suggested.lean` lines 1–5, 38 and 100 and `README.md` line 1803; the pull request description: "No Suggested.lean changes" and "No open pull request must merge before this one."

**Claim.** #1807 and #1854 (same author) both change this folder; their heads conflict in `TauCetiRoadmap/AlgebraicCurves/Suggested.lean`; neither order is stated; and the description's "No Suggested.lean changes" is false for this folder.

**Witness.** `scratch/overlaps.md` at this head: "#1807 and #1854 conflict in `TauCetiRoadmap/AlgebraicCurves/Suggested.lean`". #1854 is still open at `c07dda7`; its `Suggested.lean` declares nothing (33 lines), while this head's declares three theorems; its README carries line 1803's cell as its line 1909. The description quoted in `scratch/pull-request.md` is unchanged since the previous review.

**Repair.** Either drop `TauCetiRoadmap/AlgebraicCurves` from this pull request (its one README change is already in #1854), or replace the folder with #1854's copy verbatim; in both cases say in the merge-order paragraph which of #1807 and #1854 merges first, and correct "No Suggested.lean changes".

## R05 (P3) — two cross-roadmap locators point to the wrong section or none

**Location.** (a) `README.md` lines 1628–1632: "Acceptance instance (the merged EllipticCurves contract) … is the literature comparison its Layer 2 rests on". (b) Line 1804: "Local Fields and Ramification roadmap, ramification-filtration layer"; the same unnumbered citation at lines 708, 780 and 1936.

**Claim.** (a) EllipticCurves names the O₁/O₂ comparison in Layer 0 as the basis of its Layer 1 literature-definition equivalence (isogenies); its Layer 2 is torsion and the Weil pairing; and it puts the isogeny–scheme-morphism comparison out of its own scope. (b) The LocalFieldsRamification citation gives no section.

**Witness.** `TauCetiRoadmap/EllipticCurves/README.md` on main: lines 352–354 (the O₁/O₂ comparison, Layer 0), 423 (Layer 1: isogenies), 647 (Layer 2: torsion, Weil pairing), 142–148 (comparison with scheme morphisms out of scope). `Completed/LocalFieldsRamification/README.md`: Layer 3 at line 724, Herbrand at 878, Hasse–Arf at 1022.

**Repair.** (a) Write "the comparison EllipticCurves Layer 0 names (the place at `O₁` restricting to the place at `O₂`), on which its Layer 1 literature-definition equivalence rests; the isogeny–scheme-morphism correspondence is a corollary of 12C here, outside EllipticCurves' scope". (b) Write "LocalFieldsRamification Layer 3", linked to `../../Completed/LocalFieldsRamification/README.md`, at all four places.

## R06 (P3) — README form: process wording, and none of the house headings, per-layer dependencies or Checks

**Location.** Process wording in `README.md`: "open pull requests" at 1873 (and 323–324, 1878–1881); "no further current consumer" at 1798; "no current roadmap owns" at 1926; "so the JacobianChallenge and EllipticCurves maintainers can review the interface early" at 1789–1790; "review them with the JacobianChallenge maintainers" at 1903–1904; "*(Library list.)*" seven times at 1836–1864.

**Claim.** The README is not timeless and does not have the house shape: no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build` or `## Downstream consumers`; no layer ends with `### Examples` and `### Dependencies` (dependencies pooled in "Ordering and parallelism", lines 1754–1792); no `**Checks.**` list.

**Witness.** `grep -c` at this head for each of those headings, `### Examples`, `### Dependencies` and `**Checks.**` returns 0; the `## ` headings present are "Scope boundaries", "Standing hypotheses", "Pinned conventions", "What Mathlib already has", "What is missing", "The build, in layers", "Worked examples", "Ordering and parallelism", "References", "Coordination".

**Repair.** Unchanged from the previous review: delete the process clauses; regroup the headings into the house form ("Portfolio ownership" and "Scope boundaries" → `## Scope and ownership`; "Standing hypotheses" and "Pinned conventions" → `## Conventions`; "What Mathlib already has", the Tau Ceti carriers paragraph and the contracts table → `## Exact supplier contracts` with `From Mathlib`, `From Tau Ceti`, `From TauCetiRoadmap.<X>`; "Ordering and parallelism" → `## How to read the build`; Coordination's consumers → `## Downstream consumers`); move each layer's lines from "Ordering and parallelism" and "Worked examples" into its own `### Dependencies` and `### Examples`; give each definition this roadmap still introduces three discriminating Checks.

## Previous findings

- R01 — not repaired: `Suggested.lean` lines 27–35 still say "Headline theorems that are not statable at the pins … no residue of a differential … no regular projective model"; README 396–399 unchanged.
- R02 — not repaired: lines 59–96 still declare the three theorems; the one-tactic probe closes two of them and the third in three steps at the pins.
- R03 — not repaired: README lines 40–43 and 309–310 still say "no divisors on schemes", "no dimension theory, no coherent cohomology".
- R04 — not repaired: the description still says "No Suggested.lean changes" and "No open pull request must merge before this one"; #1854 (`c07dda7`) still conflicts in this folder's `Suggested.lean`.
- R05 — not repaired: lines 1628–1632 still say "its Layer 2 rests on"; lines 708, 780, 1804 and 1936 still cite "Local Fields and Ramification roadmap" without a section.
- R06 — not repaired: the process clauses at 1789–1790, 1798, 1873, 1903–1904, 1926 and 1836–1864 are unchanged, and the heading counts are still 0.

## Verified sound

**The change.** `git diff --stat 70140e6..HEAD -- TauCetiRoadmap/AlgebraicCurves` is empty; against main the folder still differs by the one table cell at README line 1803 and the module header (`Suggested.lean` lines 1–5, 38, 100). `lake-manifest.json` is unchanged against main (pins Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`). The brief's exclusion diff over everything outside the pull request's named folders is empty.

**Gate.** The worker's gate at this head (data) passes every check with `build=0`. Re-run by hand with `--base origin/main --build --order`: every scanner 0 except `outside-folder=20`, all 20 paths inside the folders the brief names as the pull request's own (the gate run this way does not know that list). No stray file: the folder holds `README.md`, `Suggested.lean`, `PROGRESS.md`, `STATUS.md`, `metadata.toml`, as on main.

**Dependency check** (`gate --depcheck … --movable`): `depcheck: 230 roadmaps, 2343 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean` on `Suggested.lean`: exactly the three `sorry` warnings at lines 59, 77, 92, nothing else. `#check @` of the three declarations agrees with `scratch/signatures.md`; each carries its binders in its own signature (`[IsAlgClosed k] [CharZero k]` at 92, `[Algebra.IsAlgebraic k k']` at 77). No `lemma`, `set_option`, `#eval`, sorry'd data or placeholder.

**Library names re-elaborated at the pins** (`#check @`, 0 errors): the 13 Tau Ceti names of R01, `TauCeti.hurwitz_genus_formula`, `TauCeti.genus_eq_genus_of_constantCompositum_eq_top`, `TauCeti.isIntegrallyClosedIn_of_isAlgClosed`, `TauCeti.Place.traceResidue`, and Mathlib's `AlgebraicCycle.IsWeilDivisor` and `ringKrullDim_stalk_eq_coheight`: 19 names. `projectivePlaneCurve.genus_functionField` and `finiteDimensional_cohomology_of_isCurveOver` were read in source (object files not built here).

**Seeded sample.** No changed passage contains a sampled target, so the previous report's checks stand. Spot re-checks at this head: the elaborated `TauCeti.hurwitz_genus_formula` is still the README's cross-multiplied form `[k′:k]·(2g′−2) = [F′:F]·(2g−2) + [k′:k]·deg Diff` with `FiniteDimensional k k'`, `Algebra.IsSeparable k k'` and no `PerfectField` (Riemann–Hurwitz, README 842–868). Portfolio ownership (README 29–34): EllipticCurves main lines 357 and 367, BelyiMaps main 185–186, CanonicalModelsAndGonality (#1726) 22–24, HyperellipticCurves (#1707) 182–183, CurvesOverFiniteFields (#1729) 5 and FunctionFieldArithmetic (#1474) 26–27 all still consume this roadmap rather than restate its objects. Route decision (README 36–56): the library-emptiness claims are R03; the JacobianChallenge and EllipticCurves facts are as in the previous report.

**Overlaps** (`scratch/overlaps.md` at this head, each item checked): no cited id is dropped, no id is defined only by an open revision, no dropped id is cited elsewhere; #1808 (draft, `6931121`) states its order after this pull request; #1854 is R04. `scratch/citations.md`: no cross-roadmap citation or Lean name found nowhere.

### Adversarial table

No statement changed since `70140e6`; every row is carried forward from the previous report (r36), its values restated.

| # | Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|---|
| 1 | `Suggested.lean` 59, `K ⊗[k] F` a domain (r36 row 1) | `k=ℝ`, `F=ℂ(x)`, `K=ℂ`; `k=𝔽_p(a,b)`, `y^p=a+bx^p`, `K=k(a^{1/p},b^{1/p})`; `F=k(x)`; `K=k` | `(1⊗1+i⊗i)(1⊗1−i⊗i)=0`, not a domain (`hex` fails); `[F:k(x^p)]=p²`, no separating element, `(1⊗y−α⊗1−β⊗x)^p=0`; `K⊗k(x)↪K(x)` domain; `k⊗F≅F` domain | true; both controls excluded by hypothesis | R02 (pinned) |
| 2 | `Suggested.lean` 77, `g(F′/k′) ≤ g(F/k)` (r36 row 2) | `k′=k`; `y²=x³−t`/`𝔽₃(t)`, `k′=k(t^{1/3})`; same at `p=5`; drop `hex` | `0≤0`; `p=3`: `deg Diff=4`, `2g−2=0`, `g=1→0`; `p=5`: `g=2→0`; without `hex` the pin still proves it (probe: `hex` unused) | true; narrower than the pin | R01, R02 |
| 3 | `Suggested.lean` 92, finiteness of `Aut` (r36 row 3) | `g=0` `k(x)`; `g=1` `y²=x³−x`/`ℂ`; `g=2` `y²=x⁵−1`/`ℂ` | `x↦x+c` infinite (hyp `2≤0` false); translations by `E(ℂ)` (hyp `2≤1` false); order 10 `≤ 84` | true; genus bound load-bearing | R02 (pinned) |
| 4 | Hurwitz, cross-multiplied (842–849) (r36 row 4) | `y²=x³−x`/`ℚ`; `y²=x⁵−1`; `F′=k′(x)`, `[k′:k]=2`; `y²+y=x³`/`𝔽₂` | `0=−4+4`; `2=−4+6`; `−4=−4+0` (without `[k′:k]`: `g′=−1`); wild `0=−4+4`, tame count would give odd `2g−2=−3` | true; `[k′:k]` factor needed | none |
| 4′ | Pinned extra `Algebra.IsSeparable k k'` (r36 row 4′) | `a∈k′∖k_s`, `a^p=c∈k_s` | `c∉(F·k_s)^p` by exactness, `T^p−c` irreducible, `F′/F` inseparable: contradiction | implied | none |
| 5 | Cor. 3.4.14 (r36 row 5) | `F=k(x)`; `k(x)(√x)` | `−2=−2·1+0`; `−2=−2·2+2` | true | none |
| 6 | `TauCeti.genus_eq_of_sq_eq`, ℕ division (r36 row 6) | `deg f = 1,…,6` | `(m−1)/2 = 0,0,1,1,2,2` = README `(m−1)/2` odd, `(m−2)/2` even | true | none |
| 7 | Kummer `e=n/r_P`, `d=e−1` (1364) (r36 row 7) | `y²=x` | `e=2,d=1` at `(x)` and `∞`; `2g−2=−4+2`, `g=0` | true | none |
| 8 | Exact-constants guard (1686) (r36 row 8) | `ℂ(x)/ℝ` | `ℓ(0)=dim_ℝ ℂ=2≠1` | true | none |
| 9 | Genus 1 without smooth model (1221–1229) (r36 row 9) | `y²=x³+a`/`𝔽₂(a)` | `e=3,d=2` twice; `−6+4+2=0`, `g=1`; `Δ=0`; `v=y+√a`, `v²=x³` | true | none |
| 10 | AS infinity chart (1709–1711) (r36 row 10) | `w+w²=z³` | `dt=(w²/z²)dz`, `ord=6−2=4` | true | none |
| 11 | Fierce regression (1050–1060) (r36 row 11) | `y²+ty=s`, `z²+tz=u` | `d=2`; Hilbert sum `3≠2`; `f·d=8`; `σ∈G₀∖G₁` | true | none |
| 12 | Hermitian subgroup (1457–1466) (r36 row 12) | `q=37`, `q=41` | `q³` vs `84·(g−1)`: `50653<55860`; `68921>68796` | true; "sufficiently large" | none |
| 13 | Constant-extension guards (950–957) (r36 row 13) | `k=𝔽_p(a)`, `P=(t^p−a)`; `P=(t)` | `e=p`; `e=1` with `κ(Q)/κ(P)=K/k` purely inseparable degree `p` | true | none |
| 14 | Gaps at genus 2 (1740–1744) (r36 row 14) | `y²=x⁵−1`, branch point; `(0,i)` | `{1,3}`; `{1,2}` | true | none |
| 15 | Route decision (36–56) (r36 row 15) | JacobianChallenge 139; pinned Mathlib | `χ(L)=deg L+1−g` ✓; "no divisors on schemes" ✗ (`IsWeilDivisor` at `AlgebraicCycle/Basic.lean` 143, re-elaborated) | false library claim | R03 |
| 16 | Portfolio ownership (29–34) (r36 row 16) | 7 consumer and nearby roadmaps, 6 re-read at this head | 0 of 7 claim these objects | true | none |

## Not verifiable

- Stichtenoth, *Algebraic Function Fields and Codes*, 2nd ed., GTM 254: no legal copy (Springer paywall, `uncertified`), as in the previous review; no changed passage cites it, so no new locator was checked.
- Villa Salvador, Goldschmidt, Liu, Hartshorne, Deuring, Rosen, Serre, Roquette/Henn: publisher-held, not sought (no changed passage).
- Ownership against open pull requests was checked for the roadmaps the overlaps tool lists closest in vocabulary and for the consumers named above, at the heads the brief provides.

## Source issues

- none
