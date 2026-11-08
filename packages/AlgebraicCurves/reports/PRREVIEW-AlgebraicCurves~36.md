# Review of AlgebraicCurves (pull request #1807 at 70140e6)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/AlgebraicCurves/` at `70140e6`, against Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. `lake-manifest.json` is unchanged against main, so main has the same pins. In this folder the pull request changes one table cell of `README.md` (line 1803) and puts `Suggested.lean` into module form (lines 1–5, 38, 100). Most findings below concern text that is already on main. They are raised because this is a full review, and because another open pull request (#1854) already carries a repaired copy of this folder (R04).

## R01 (P2) — Layers 8–12 and the module docstring treat as unbuilt, or not statable, theorems the pinned Tau Ceti proves

**Location.** `TauCetiRoadmap/AlgebraicCurves/Suggested.lean` lines 27–35: "not statable at the pins … the pins have no residue of a differential … no regular projective model". Also `README.md` lines 396–399: "states the headline theorems the pinned libraries do not prove". Layers 8 (lines 888–897, 915–996), 9 (1183–1191), 10 (1313–1354), 11 (1421–1456) and 12 (1468–1659) cite no pinned name for these targets.

**Claim.** README lines 366–367 promise that where the pinned Tau Ceti proves a target, "the layer cites the pinned name". Layers 0–7 keep that promise; Layers 8–12 do not. They plan the targets as work to build. The docstring calls the Layer 9 and Layer 12 headlines not statable, but the pin has their carriers and proves the theorems. Three headlines the pin proves are cited only in the overview (lines 352–354, 1698), not at their layers, although line 347–348 says "each cited at its layer".

**Witness.** At Tau Ceti `2fd255d9`, all of these elaborate (`#check @`, 0 errors): `TauCeti.finsum_traceResidue_kaehlerBasisOfSeparating_coord_eq_zero` (`Differential/Independence.lean` 386), `TauCeti.AlgebraicGeometry.twoChartModel` (`Curves/TwoChartModel/Basic.lean` 143) and `TauCeti.AlgebraicGeometry.RegularProjectiveCurveCat.equivFunctionFieldCat` (`AntiEquivalence.lean` 397).

**Repair.** Cite each pinned declaration at its claim, one clause stating its hypotheses:

- Layer 8, item 2 (line 891): `TauCeti.isDomain_tensorProduct_of_separating` (`TauCeti/FieldTheory/Separable/Regular.lean` 142). Its conclusion is `F ⊗[k] A` a domain, for every domain `A`.
- Layer 8, genus drop (line 967): `TauCeti.genus_le_genus_of_constantCompositum_eq_top` (`…/ConstantExtension/Genus/Basic.lean` 243). It has **no** exactness hypothesis, so drop "exact `k`".
- Layer 8, genus base change (915–931): `TauCeti.genus_eq_genus_of_constantCompositum_eq_top`, which needs only `Algebra.IsSeparable k k'`, so "finite separable" at line 352 becomes "separable algebraic".
- Layer 9, residue theorem (1188): `TauCeti.finsum_traceResidue_kaehlerBasisOfSeparating_coord_eq_zero`, with `TauCeti.Place.traceResidue` (`…/Place/Expansion/Laurent/CoefficientField.lean` 452).
- Layer 10: the hyperelliptic genus is `TauCeti.genus_eq_of_sq_eq` (1326–1329). The smooth plane curve genus `(d−1)(d−2)/2` is `TauCeti.AlgebraicGeometry.projectivePlaneCurve.genus_functionField` (`Curves/PlaneCurve/Genus.lean` 126).
- Layer 11: the Weierstrass-point bounds and the hyperelliptic equality case are `TauCeti.two_mul_genus_add_three_le_ncard_setOf_weierstrassWeight_ne_zero` and `TauCeti.isHyperellipticFunctionField_iff_ncard_setOf_weierstrassWeight_ne_zero_eq` (`Differential/Weierstrass/Count.lean` 69–149).
- Layer 11, finiteness (1432): `TauCeti.finite_algEquiv_of_two_le_genus` (`Automorphism/HigherGenus.lean` 124). It takes exactness and gap injectivity; in characteristic 0 these are `TauCeti.isIntegrallyClosedIn_of_isAlgClosed` and `fun _ ↦ Nat.cast_injective.injOn`.
- Layer 11, Hurwitz bound (1450): `TauCeti.natCard_le_eighty_four_mul_genus_sub_one`. It holds over any exact `k`, with tameness of `F/F^G`.
- Layer 12A: `AlgebraicGeometry.Scheme.IsCurveOver` (`Curves/Basic.lean` 37).
- Layer 12B: `TauCeti.AlgebraicGeometry.twoChartModel`, with projectivity `AlgebraicGeometry.Scheme.isProjectiveOver_of_isCurveOver`.
- Layer 12C: `TauCeti.AlgebraicGeometry.RegularProjectiveCurveCat.equivFunctionFieldCat`.
- Layer 12E(ii): `TauCeti.AlgebraicGeometry.twoChartModel.genus_eq_genus` (`TwoChartModel/Genus.lean` 60).

Then rewrite docstring lines 10–35 and README lines 396–399 to say that every headline is proved at the pin, naming each. #1854's copy of this folder already has this form: its README lines 914, 995, 1241, 1511 and 1694–1750, and its `Suggested.lean` docstring.

**Tested.** Every name in this list elaborates at the pins (`#check @`, 0 errors). The one exception is `projectivePlaneCurve.genus_functionField`, whose object file is not built in this checkout; I read it in the source at line 126.

## R02 (P3) — the three theorems of `Suggested.lean` are pinned Tau Ceti theorems restated

**Location.** `Suggested.lean` lines 59–65 (`isDomain_tensorProduct_of_isSeparable`), 77–83 (`genus_le_genus_of_constantCompositum_eq_top`) and 92–96 (`finite_algEquiv_of_two_le_genus`).

**Claim.** Each one follows directly from the pinned theorem of the same content. Two of them carry the pinned short name. The second is also narrower than the pin: its `hex` hypothesis is unused.

**Witness.** On a scratch copy at the pins, `exact TauCeti.genus_le_genus_of_constantCompositum_eq_top hF h` closes line 77 (`hex` flagged unused). `exact TauCeti.finite_algEquiv_of_two_le_genus hF TauCeti.isIntegrallyClosedIn_of_isAlgClosed (fun _ ↦ Nat.cast_injective.injOn) hg` closes line 92. Line 59 takes three steps through `TauCeti.isDomain_tensorProduct_of_separating`.

**Repair.**

- Delete the three theorems from `Suggested.lean`. Also delete the `open` and `universe` lines and the two `TauCeti.*` imports, which become unused.
- Keep the module docstring, naming the pinned theorems as in R01.
- In the README, lines 891, 967 and 1432 then name `TauCeti.isDomain_tensorProduct_of_separating`, `TauCeti.genus_le_genus_of_constantCompositum_eq_top` and `TauCeti.finite_algEquiv_of_two_le_genus`. The README's backticked own names must be declared in `Suggested.lean`, so they cannot stay.

**Tested.** The reduced file elaborates with no output: `module`, `public import Mathlib`, the docstring, `@[expose] public section` and an empty namespace.

## R03 (P3) — the route decision and the scheme-side bullet say the pins lack scheme divisors, dimension theory and coherent cohomology

**Location.** `README.md` lines 40–43: "where it is empty (no coherent cohomology, no scheme dimension theory, no divisors on schemes". Also lines 309–310: "⚠ No divisors, no `Pic(X)`, no dimension theory, no coherent cohomology".

**Claim.** These claims about the pinned libraries are false. The README contradicts them itself at lines 327–328, which place the cycle substrate at the pin, and at line 1585, which cites `ringKrullDim_stalk_eq_coheight`.

**Witness.** Pinned Mathlib has `AlgebraicGeometry.AlgebraicCycle.IsWeilDivisor` (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean` 143) and `AlgebraicGeometry.ringKrullDim_stalk_eq_coheight` (`Properties.lean` 375). Pinned Tau Ceti has `AlgebraicGeometry.Scheme.Modules.finiteDimensional_cohomology_of_isCurveOver` (`TauCeti/AlgebraicGeometry/Curves/Cohomology.lean` 128).

**Repair.**

- Justify the route at lines 40–43 by what it gains: Riemann–Roch by linear algebra in `A_F`, and divisors indexed by places. Drop the "empty" clause.
- Replace lines 309–310 with what the pins supply and Layer 12 consumes: Mathlib's `AlgebraicCycle`/`IsWeilDivisor`, `OrderOfVanishing` and stalk Krull dimension, and Tau Ceti's curve cohomology. Keep "no `ℙⁿ` as a named scheme" only after checking it at the pin.

## R04 (P3) — #1854 changes this folder differently, and no merge order is stated

**Location.** This folder's `Suggested.lean` lines 1–5, 38 and 100, and `README.md` line 1803. Also the pull request description: "No Suggested.lean changes" and "No open pull request must merge before this one."

**Claim.** #1807 and #1854 (same author) both change this folder. The two heads conflict in `TauCetiRoadmap/AlgebraicCurves/Suggested.lean`, and neither order is stated. The description also says there are no `Suggested.lean` changes, but this folder's file is changed.

**Witness.** `scratch/overlaps.md` reports that "#1807 and #1854 conflict in `TauCetiRoadmap/AlgebraicCurves/Suggested.lean`". At #1854's head, that file declares nothing, and its README (2054 lines) carries line 1803's change as its line 1909, plus the R01 citations.

**Repair.** Choose one of two:

- Drop `TauCetiRoadmap/AlgebraicCurves` from this pull request. Its README change is already in #1854.
- Or replace the folder with #1854's copy verbatim.

Either way, say in the description's merge-order paragraph which of #1807 and #1854 merges first, and correct "No Suggested.lean changes". (#1808's order is stated: it follows this pull request.)

## R05 (P3) — two cross-roadmap locators point to the wrong section or none

**Location.**

- (a) `README.md` lines 1628–1632: "Acceptance instance (the merged EllipticCurves contract) … is the literature comparison its Layer 2 rests on".
- (b) Line 1804: "Local Fields and Ramification roadmap, ramification-filtration layer". The same unnumbered citation appears at lines 708, 780 and 1936.

**Claim.**

- (a) EllipticCurves names the comparison "the place at `O₁` restricting to the place at `O₂`" in Layer 0, as the basis of its literature-definition equivalence. That equivalence is about isogenies, which are its Layer 1. Its Layer 2 is torsion and the Weil pairing. It also puts the isogeny–scheme-morphism comparison out of its own scope, so this is not an EllipticCurves contract.
- (b) The LocalFieldsRamification citation gives no section.

**Witness.**

- EllipticCurves (main), lines 352–354: the O₁/O₂ comparison in Layer 0. Line 423: Layer 1, isogenies. Line 647: Layer 2, torsion. Lines 142–148: the comparison is out of scope.
- `Completed/LocalFieldsRamification/README.md`: Layer 3 at line 724, Herbrand at 878, Hasse–Arf at 1022.

**Repair.**

- (a) Write: "the comparison EllipticCurves Layer 0 names (the place at `O₁` restricting to the place at `O₂`), on which its Layer 1 literature-definition equivalence rests; the isogeny–scheme-morphism correspondence is a corollary of 12C here, outside EllipticCurves' scope".
- (b) Write "LocalFieldsRamification Layer 3", linked to `../../Completed/LocalFieldsRamification/README.md`, at all four places.

## R06 (P3) — README form: process wording, and none of the house headings, per-layer dependencies or Checks

**Location.** Process wording appears at these lines of `README.md`:

- "open pull requests": 323–324, 1873, 1878–1881.
- "The RR ladder has no further current consumer": 1798.
- "no current roadmap owns": 1926.
- "so the JacobianChallenge and EllipticCurves maintainers can review the interface early": 1789–1790.
- "review them with the JacobianChallenge maintainers": 1903–1904.
- "*(Library list.)*", seven times: 1836–1864.

**Claim.** The README is not timeless. It also does not have the house shape:

- None of `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build` or `## Downstream consumers`.
- Layers sit at `###`, and none ends with `### Examples` and `### Dependencies`. The dependencies are pooled in "Ordering and parallelism" (1754–1792).
- There is no `**Checks.**` list.

**Witness.** A `grep -c` for those headings, `### Examples`, `### Dependencies` and `**Checks.**` in `README.md` returns 0. On main, 55 of 142 roadmaps use `## Scope and ownership` and 62 have `**Checks.**` lists.

**Repair.**

- Delete the process clauses listed above.
- Regroup the headings:
  - "Portfolio ownership" and "Scope boundaries" become `## Scope and ownership`.
  - "Standing hypotheses" and "Pinned conventions" become `## Conventions`.
  - "What Mathlib already has", the Tau Ceti carriers paragraph (336–356) and the contracts table become `## Exact supplier contracts`, with `From Mathlib`, `From Tau Ceti` and `From TauCetiRoadmap.<X>` subsections.
  - "Ordering and parallelism" becomes `## How to read the build`.
  - Coordination's future consumers become `## Downstream consumers`.
- Move each layer's lines from "Ordering and parallelism" and "Worked examples" into that layer's own `### Dependencies` and `### Examples`.
- Give each definition this roadmap still introduces three discriminating Checks.

## Verified sound

**Gate.**

- The worker's gate at this head (data) passes every check, including `build=0`.
- Run by hand with `--base origin/main`, every scanner is 0 except `outside-folder=20`. Run that way, the gate does not know the pull request's folder list. All 20 paths lie in the folders the brief names as the pull request's own: the brief's exclusion diff over everything else is empty.
- No stray file: the folder holds `README.md`, `Suggested.lean`, `PROGRESS.md`, `STATUS.md` and `metadata.toml`, as on main.

**Dependency check** (`gate --depcheck … --movable`): `depcheck: 240 roadmaps, 2459 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.

**Elaboration.**

- `lake env lean` on `Suggested.lean` reports only the three `sorry` warnings, at lines 59, 77 and 92.
- `#check @` of the three declarations matches `scratch/signatures.md`. Each declaration carries its binders in its own signature: `[IsAlgClosed k] [CharZero k]` at line 92 and `[Algebra.IsAlgebraic k k']` at line 77 are in scope.
- There is no `lemma`, `set_option`, `#eval`, sorry'd data or placeholder.
- The module form (`module`, `public import`, `@[expose] public section`) is the form 26 of the 141 `Suggested.lean` files on main use.

**Library names, elaborated at the pins.**

- All 110 distinct `TauCeti.*` names the README cites: 0 errors.
- 32 Mathlib names the README relies on: 0 errors. Among them are `RatFunc.valuation_isEquiv_infty_or_adic`, `KaehlerDifferential.tensorKaehlerEquivOfFormallyEtale`, `Ideal.sum_ramification_inertia`, `pow_sub_one_dvd_differentIdeal`, `Polynomial.IsEisensteinAt.irreducible`, `Ideal.eq_bot_of_under_eq_bot`, `ClassGroup.equivPic` and `AlgebraicGeometry.finite_appTop_of_universallyClosed`.
- The 9 extra names of the R01 repair: 0 errors.
- The README's statements that Mathlib lacks something hold at the pin: no `KaehlerDifferential` in `Mathlib/FieldTheory/`, and only the divisibility `P^(e−1) ∣ 𝔡` in `Different.lean` (lines 696, 745).

**Seeded sample.**

- *Riemann–Hurwitz* (README 842–868), against the elaborated `TauCeti.hurwitz_genus_formula`. The pinned conclusion `[k′:k]·(2g′−2) = [F′:F]·(2g−2) + [k′:k]·deg Diff` is the README's cross-multiplied form. The pinned theorem has no `PerfectField` hypothesis, which supports "no perfectness consumed". Its extra `[FiniteDimensional k k'] [Algebra.IsSeparable k k']` follow from `F′/F` separable with `k` exact (table row 4). Cor. 3.4.14 (`hurwitz_genus_formula_ratFunc`), Cor. 3.5.6 (`two_mul_genus_sub_two_eq_iff_forall_isTame`, stated with the geometric degree), Cor. 3.5.7 (`genus_le_genus`) and Cor. 3.5.8 (`different_ne_zero_of_one_lt_finrank`) match their README statements.
- *Portfolio ownership* (README 29–34). No roadmap on main or in the open pull requests claims general function-field places, divisors, `L(D)`, Riemann–Roch, ramification or the curve/function-field dictionary. All seven candidates consume this roadmap:
  - BelyiMaps (main) 185–186 and 544–548;
  - EllipticCurves 357 and 367;
  - CanonicalModelsAndGonality 22–28;
  - FunctionFieldArithmetic 26–38;
  - HyperellipticCurves 182–186;
  - CurvesOverFiniteFields 5;
  - GroupActionsOnRiemannSurfaces 97 and 302.

  BelyiMaps' `Divisor X := X →₀ ℤ` (`Suggested.lean` 1890) lives on charted spaces: it is the analytic object of ModularForms Layer 10B, not a parallel function-field theory. BelyiMaps' table names this roadmap's carriers `AlgebraicCurves.IsFunctionField`, `AlgebraicCurves.Place` and so on. Those names exist nowhere; the objects are the pinned `TauCeti.*` carriers this README names. That is BelyiMaps' text to update, not this folder's. FunctionFieldArithmeticPartII declares `gap:completed-lattice-root-dictionary` on this roadmap (its line 81). That gap is data for this roadmap's own job, not a defect here.
- *Route decision* (README 36–56). JacobianChallenge line 139 states `g := dim_k H¹(X, 𝒪_X)` and `χ(L) = deg L + 1 − g` (Layer B), as the README says. EllipticCurves line 394 has "with no Riemann–Roch anywhere", and lines 357 and 367 consume this roadmap's place interface and the Layer 10 early milestone. The route's claims about what the pins lack are R03.

**Cross-roadmap citations resolved** (main):

- JacobianChallenge: Layers A, B and C at lines 111, 135 and 143.
- EllipticCurves: Layers 0, 1 and 2 at lines 344, 423 and 647.
- BelyiMaps: 9.1 at line 2847 and 10.6 at line 3476.
- FormalLaurentPuiseux: L1–L3 at lines 70, 112 and 140.
- ModularForms: Layer 10 at line 1024, with analytic Riemann–Roch inside it at line 242.
- LocalFieldsRamification: Layer 3 at line 724.

**Overlaps** (`scratch/overlaps.md`, each item checked): no cited id is dropped, no id is defined only by an open revision, and no dropped id is cited elsewhere. #1808's order is stated. #1854 is R04.

### Adversarial table

| # | Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|---|
| 1 | `Suggested.lean` 59, `K ⊗[k] F` a domain | (a) `k=ℝ`, `F=ℂ(x)`, `K=ℂ`; (b) `k=𝔽_p(a,b)`, `y^p=a+bx^p`, `K=k(a^{1/p},b^{1/p})`; (c) `F=k(x)`; (d) `K=k` | (a) `hex` fails (`i` algebraic, `i∉ℝ`); `(1⊗1+i⊗i)(1⊗1−i⊗i)=1⊗1−(−1)⊗(−1)=0`: not a domain. (b) `[F:kF^p]=[F:k(x^p)]=p²≠p`, so no separating element; `(1⊗y−α⊗1−β⊗x)^p=0` with the element `≠0`. (c) `K⊗k(x)↪K(x)`: domain. (d) `k⊗F≅F`: domain | true; both negative controls are excluded by their hypothesis | R02 (pinned) |
| 2 | `Suggested.lean` 77, `g(F′/k′) ≤ g(F/k)` | `k′=k`; `y²=x³−t`/`𝔽₃(t)`, `k′=k(t^{1/3})`; the same at `p=5`; drop `hex` | `0≤0`. `p=3`: `deg Diff(F/k(x))=3+1=4`, `2g−2=−4+4=0`, `g=1`; `u=y/(x−a)`, `u²=x−a`, `u³=y`, so `g′=0`, and `0≤1`. `p=5`: `2g−2=−4+6=2`, `g=2→0`. Without `hex`: the pinned theorem still proves it (probe: `hex` unused) | true; narrower than the pin | R01, R02 |
| 3 | `Suggested.lean` 92, finiteness of `Aut` | `g=0`: `k(x)`; `g=1`: `y²=x³−x`/`ℂ`; `g=2`: `y²=x⁵−1`/`ℂ` | `g=0`: `x↦x+c`, infinitely many `c` (hypothesis `2≤0` false). `g=1`: translations by `E(ℂ)` (hypothesis `2≤1` false). `g=2`: `(x,y)↦(ζ₅x,±y)`, order 10 `≤ 84(2−1)=84` | true; genus bound load-bearing | R02 (pinned) |
| 4 | Hurwitz, cross-multiplied (842–849) | `y²=x³−x`/`ℚ`; `y²=x⁵−1`; `F′=k′(x)`, `[k′:k]=2` separable; `y²+y=x³`/`𝔽₂` | LHS `1·0=0`, RHS `2·(−2)+4=0`. LHS `2`, RHS `−4+6=2`. LHS `2·(−2)=−4`, RHS `2·(−2)+2·0=−4`; without `[k′:k]` the formula gives `g′=−1`. Wild: `0=−4+4`; a tame count gives `2g−2=−3`, which is odd | true; `[k′:k]` factor needed | none |
| 4′ | Pinned extra `Algebra.IsSeparable k k'` | `a∈k′∖k_s`, `a^p=c∈k_s` | `c∉(F·k_s)^p` by exactness, so `T^p−c` is irreducible over `F·k_s` and `F′/F` is inseparable: contradiction | implied | none |
| 5 | Cor. 3.4.14 | `F=k(x)`; `F=k(x)(√x)` | `−2=−2·1+0`; `−2=−2·2+2` | true | none |
| 6 | `TauCeti.genus_eq_of_sq_eq`, ℕ division | `deg f = 1,…,6` | `(m−1)/2 = 0,0,1,1,2,2`, the README's `(m−1)/2` (odd) and `(m−2)/2` (even) | true | none |
| 7 | Kummer data `e=n/r_P`, `d=e−1` (1364) | `y²=x` | `P=(x)`: `e=2`, `d=1`; `∞`: `e=2`, `d=1`; `2g−2=−4+2`, so `g=0` (`F=k(y)`) | true | none |
| 8 | Exact-constants guard (1686) | `ℂ(x)/ℝ` | `L(0)=ℂ`, `ℓ(0)=dim_ℝ ℂ=2≠1` | true | none |
| 9 | Genus 1 without smooth model (1221–1229) | `y²=x³+a`/`𝔽₂(a)` | `F/k(y)`: `(y²+a)` has degree 2, `e=3`, `d=2`; `∞` has `e=3`, `d=2`; `−6+4+2=0`, so `g=1`. `Δ=a₃⁴=0`. `v=y+√a`, `v²=x³`, `x=u²`, `v=u³` | true | none |
| 10 | AS infinity chart (1709–1711) | `w+w²=z³` (char 2) | `dw=z²dz`; `dt=d(w/z)=(z³−w)/z²·dz=(w²/z²)dz`; `ord=6−2=4` | true | none |
| 11 | Fierce regression (1050–1060) | `y²+ty=s`, `z²+tz=u` | Derivative `t` with `v_B(t)=1`, so `d=1+1=2`. Hilbert sum `(4−1)+0=3≠2`. `f·d=4·2=8`. `σ:y↦y+t` has `v(σy−y)=1`, so `σ∈G₀∖G₁` | true | none |
| 12 | Hermitian subgroup (1457–1466) | `q=37`, `q=41` | `#(a,b)=q²·q=q³`. With `g=q(q−1)/2`: at `q=37`, `50653<84·665=55860`; at `q=41`, `68921>84·819=68796` | true; "sufficiently large" | none |
| 13 | Constant-extension guards (950–957) | `k=𝔽_p(a)`, `P=(t^p−a)`; `P=(t)` | `t^p−a=(t−a^{1/p})^p`, so `Con(P)=pQ` and `e=p`. At `(t)`: `e=1`, but `κ(Q)/κ(P)=K/k` is purely inseparable of degree `p` | true | none |
| 14 | Gaps at genus 2 (1740–1744) | `y²=x⁵−1`, branch point; `(0,i)` | Branch point: `{1,3}`. `(0,i)`: `i²=−1=0⁵−1`, gaps `{1,2}` | true | none |
| 15 | Route decision (36–56) | JacobianChallenge 139; pinned Mathlib | Their RR is `χ(L)=deg L+1−g` ✓. "No divisors on schemes" ✗: `AlgebraicCycle.IsWeilDivisor` exists | false library claim | R03 |
| 16 | Portfolio ownership (29–34) | 7 consumer and nearby roadmaps | 0 of 7 claim these objects | true | none |

## Not verifiable

- Stichtenoth, *Algebraic Function Fields and Codes*, 2nd ed., GTM 254. This is the source of the sampled Thm. 3.4.13 and of every Stichtenoth locator. The sources service resolves DOI `10.1007/978-3-540-76878-4` only to Springer's paywall, so it is recorded `uncertified`. I checked the Riemann–Hurwitz sample against the pinned `TauCeti.hurwitz_genus_formula` instead (above). The theorem number and page could not be confirmed from the text.
- Villa Salvador, Goldschmidt, Liu, Hartshorne, Deuring, Rosen, Serre and Roquette/Henn are all publisher-held. They are cited for layers outside the seeded sample, and I did not seek them.
- Ownership against open pull requests was checked for the closest roadmaps the overlaps tool lists, plus FunctionFieldArithmeticPartII and GroupActionsOnRiemannSurfaces, at the heads the brief provides.

## Source issues

- none
