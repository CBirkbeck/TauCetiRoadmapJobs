# Review of ClassFieldTheory (pull request #1411 at cded4a2)

**Verdict:** needs changes

This is an incremental re-review of the 143 lines that changed since `0333060`. The gate fails only on `outside-folder` (R03). There are 3 findings, one P2 and two P3, and all three are previous findings that are not repaired. The other two previous findings, R04 (the absolute upper group has no name) and R05 (alias wording, `RatModInt`, the title), are repaired, and neither repair introduced a new problem.

## R01 (P2) — FunctionFieldArithmetic still states and proves unit-filtration reciprocity itself (previous R01, not repaired)

**Location:**
- `TauCetiRoadmap/ClassFieldTheory/README.md:147–149`: "Unit-filtration reciprocity (Layer 7) is this roadmap's in both characteristics … and `FunctionFieldArithmetic` consumes it".
- `README.md:2307–2310` says the same: FunctionFieldArithmetic "consumes Layer 7's unit-filtration reciprocity in equal characteristic".

**Claim:**
- #1474's head is still `c5d655e`, the head the previous review read.
- There, FunctionFieldArithmetic §4.2 does not consume Layer 7. It states the equal-characteristic equality and its absolute form inside its own target lubinTate_artin, and proves both by a Lubin–Tate route.
- So the object still has two owners, and this README's "consumes it" is false at that head.
- ClassFieldTheory is on main and is therefore the earlier owner.

**Witness:** #1474 head `c5d655e`, `TauCetiRoadmap/FunctionFieldArithmetic/README.md`:
- lines 1116–1121: for finite abelian `L/K` in equal characteristic and `r ≥ 0`, `Art_{L/K}(U_K^(r)) = Gal(L/K)^r`, and the same for abelian algebraic `E/K`;
- lines 1140–1150: its own proof.

**Repair:**
1. In #1474 §4.2, replace lines 1116–1121 and the proof paragraph at lines 1140–1150 by a citation of ClassFieldTheory Layer 7 (`map_unitFiltration_normResidue`, `closure_map_artinMap_unitFiltration`). Keep the other clauses of lubinTate_artin.
2. Name #1474 in this pull request's merge-order paragraph (R02).

Tested on `𝔽_p((t))` with `y^p − y = t⁻¹` (upper break 1). Both statements give `Art(U^(1)) = G` and `Art(U^(2)) = 1`, so deleting #1474's copy loses nothing.

## R02 (P3) — The description's merge order still runs the wrong way, with no order against #617 and #1215 (previous R02, not repaired)

**Location:** the pull request description, which is unchanged:
- "**Merge order.** #1410 → this PR", and `depends-on` "#1410 RamificationOfCompleteDiscretelyValuedFields";
- "the absolute form is a README target because the absolute upper filtration is missing at the pins".

**Claim:**
- The supply runs the other way. #1410 consumes Layer 7's absolute upper filtration, and this head cites nothing from #1410 (the dependency check below reports 0 problems).
- The absolute form is now stated in `Suggested.lean:826`, on `localAbsoluteUpperRamificationGroup` (`Suggested.lean:813`).
- #617 and #1215 both conflict with this head, and no order is stated. #1215 now uses this head's name `localAbsoluteUpperRamificationGroup`, but it still renames both theorems.

**Witness:**
- #1410 head `e81ddb8`, `RamificationOfCompleteDiscretelyValuedFields/README.md:117–121`: the local-field absolute upper filtration "is ClassFieldTheory Layer 7's".
- #1215 head `024927f`, `ClassFieldTheory/Suggested.lean:94,124`: `normResidue_map_unitFiltration` and `closure_map_artinMap_unitFiltration_eq_upper`.

**Repair:** Rewrite the description:
1. Drop #1410 from `depends-on`. Write "Merge order: this PR → #1410 (RamificationOfCompleteDiscretelyValuedFields §4a.1 consumes Layer 7's `localAbsoluteUpperRamificationGroup`) and → #1474 (R01)".
2. State which of #617, #1215 and #1411 is rebased onto which, and which theorem names survive. The definition name already agrees.
3. Replace the "Dependencies" sentence with "Mathlib and Tau Ceti at the pins; no roadmap supplier beyond those on main".
4. Say that the absolute form is stated in `Suggested.lean` on `localAbsoluteUpperRamificationGroup`.

## R03 (P3) — Gate `outside-folder`: `Completed/LocalGaloisGroups/Suggested.lean` (previous R03, not repaired)

**Location:** `Completed/LocalGaloisGroups/Suggested.lean:326` and `:485`, the only two edited lines. They read `⟨ClassFieldTheory.h2MuEquivZMod_mixed p F n hn⟩` and `⟨ClassFieldTheory.h2FpEquivZMod_of_mu p F _ (muNRepIsoTrivialFp p F ζ hζ)⟩`.

**Claim:**
- The pull request edits a folder that is not named as one of its own: the description names no `LocalGaloisGroups`.
- The edit is forced, because the consumer adapts to this roadmap's canonical `h2MuEquivZMod_mixed` and `h2FpEquivZMod_of_mu`.

**Witness:**
- The worker's gate reports `outside-folder=1`, `Completed/LocalGaloisGroups/Suggested.lean`. My run lists the same file, plus this pull request's own IntegralLattices and QuadraticFormInvariants.
- A scratch copy of that file elaborates against this head with 0 errors.

**Repair:**
1. Keep the two lines.
2. Name `Completed/LocalGaloisGroups` in the description as one of this pull request's folders, as IntegralLattices and QuadraticFormInvariants already are, so that the board records it.

## Previous findings

- R01 — not repaired: #1474's head is still `c5d655e`. `FunctionFieldArithmetic/README.md:1116–1121` states the equal-characteristic equality `Art_{L/K}(U_K^(r)) = Gal(L/K)^r` as part of lubinTate_artin, and lines 1140–1150 prove it by Lubin–Tate. This report's R01.
- R02 — not repaired: the description still says "**Merge order.** #1410 → this PR" and "the absolute form is a README target because the absolute upper filtration is missing at the pins", and states no order with #617 and #1215. This report's R02.
- R03 — not repaired: the gate still reports `outside-folder: Completed/LocalGaloisGroups/Suggested.lean`, and the description does not name that folder. This report's R03.
- R04 — repaired:
  - `Suggested.lean:813` defines `noncomputable def localAbsoluteUpperRamificationGroup (u : …RamificationIndexDomain)` as `⨅ M, (upperRamificationGroup K M u).comap (restrictNormalHom M)`.
  - The headline at `:826` drops the subgroup argument and `_habs`.
  - The README names the group at lines 1379–1382 and 1437–1438.
  - `AlgHom.valuativeExtension` is in the *Needs* (1401–1405), in the Dependencies (1539) and in the supplier row (493).
- R05 — repaired:
  - Line 486 now reads "consumed under Tau Ceti's names; `Suggested.lean` keeps `tateTheorem`, `ClassFormation.artinMap`, `localArtinMap` and `normResidue` as reducible aliases".
  - Lines 1707 and 1833 say "Tau Ceti's".
  - `RatModInt` is deleted, and `invMap` now has type `Br K ≃+ AddCircle (1 : ℚ)`.
  - The title is "Class field theory: target signatures".

## Verified sound

**Gate.**
- The worker's run reports only `outside-folder=1` (R03), with `build=0`.
- My run reports `outside-folder=3 … FAIL` with every other count 0. Two of the three entries are this pull request's own folders, `TauCetiRoadmap/IntegralLattices/Suggested.lean` and `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean`; the third is R03.
- `git diff --stat origin/main...HEAD` outside the three named folders shows only `Completed/LocalGaloisGroups/Suggested.lean`, with 2 lines changed.

**Elaboration.**
- `lake env lean` on `Suggested.lean` exits 0 in 24 s. The only warnings are 6 `sorry`s, at lines 588, 764, 777, 826, 973 and 983, which are the six open targets.
- A scratch copy of `Completed/LocalGaloisGroups/Suggested.lean` exits 0 against this head. It has 0 errors; besides 104 `sorry` warnings, it has 4 `linter.concreteInstances` warnings of its own. Removing `RatModInt` therefore breaks no consumer.

**Dependency check** (`--movable`):
```text
depcheck: 238 roadmaps, 2324 edges, 0 problem(s)
```

**Signatures.**
- I ran `#check @` on the two changed declarations in a scratch file:
  - `localAbsoluteUpperRamificationGroup : (K : Type) → [Field K] → [ValuativeRel K] → [TopologicalSpace K] → [IsNonarchimedeanLocalField K] → ↑RamificationIndexDomain → Subgroup (Field.absoluteGaloisGroup K)`;
  - `closure_map_artinMap_unitFiltration`, whose right-hand side is `(localAbsoluteUpperRamificationGroup K ⟨↑n, ⋯⟩).map (QuotientGroup.mk' …)`.
  - Both keep every binder the README statement needs. The finite levels' local-field instances are local instances inside the body, as README line 1382 says.
- The 2 declarations `signatures.md` flags, `restrictAbsolute` and `absoluteGaloisGroupExtend`, are unchanged; the previous review's reading carries over (their Galois-theoretic bodies need no local-field instance).
- The tool's 3 "Unknown identifier" lines (`below`, `on`, `field`) come from its own parse of docstring words, not from `Suggested.lean`.

**Probes.** All were run as scratch files with `lake env lean`.

| Probe | Result |
|---|---|
| A: `localAbsoluteUpperRamificationGroup K ⟨-1, _⟩ = ⊤` | proved, using `upperRamificationGroup_of_coe_le_zero`, `mem_lowerRamificationGroupReal_iff` (ceiling) and `lowerRamificationGroup_eq_top_of_le_neg_one`. This confirms README Check 1 in Lean |
| B: membership in the named group ↔ the head's former `_habs` description, at `⟨n, Nat.cast_mem_ramificationIndexDomain n⟩` | proved, by `simp only [localAbsoluteUpperRamificationGroup, Subgroup.mem_iInf]; exact Iff.rfl`. The restatement is exactly the previous form |
| C: one tactic on the restated `closure_map_artinMap_unitFiltration` | `rfl` fails because the two sides are not definitionally equal, and `simp` makes no progress. Not padding |

**Library declarations opened at the pin.**
- Tau Ceti:
  - `invMap : Br K ≃+ AddCircle (1 : ℚ)` (`ClassFieldTheory/Brauer/Invariant.lean:200`), the new type of the alias;
  - `AlgHom.valuativeExtension` (`LocalField/AlgebraicExtension/Basic.lean:314`), which, from `ι : M →ₐ[K] N` with both relations extending `K`'s, gives `ValuativeExtension M N` through `ι.toAlgebra`;
  - `map_restrictNormalHom_upperRamificationGroup` (`Herbrand/UpperQuotient.lean:98`), whose hypotheses at lines 85–92 include `[ValuativeExtension L M] [IsScalarTower K L M]`, so the new *Needs* item is the right one;
  - `Nat.cast_mem_ramificationIndexDomain` (`LocalField/RamificationGroup.lean:89`) and `RamificationIndexDomain = Set.Ici (−1)` (`:86`);
  - `upperRamificationGroup` (`Herbrand/Basic.lean:421`) and `upperRamificationGroup_of_coe_le_zero` (`:444`);
  - `lowerRamificationGroupReal_def`, which takes the ceiling (`RamificationGroup.lean:282`);
  - `finiteIntermediateFieldValuativeRel`, `…Topology`, `…_valuativeExtension` and `…_isNonarchimedeanLocalField` (`FiniteExtension/IntermediateField.lean:69, 75, 81, 97`);
  - the instance `CompactSpace (Field.absoluteGaloisGroup K)` (`FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean:374`);
  - `ideleFormation` and `globalFormation`, plain `def`s (`Global/Formation.lean:83, 105`);
  - `ideleToClassH2`, `classToMultiplicativeH3`, `range_ideleToClassH2` and `surjective_ideleToClassH2_of_isCyclic` (`Global/LiftingObstruction.lean:245, 265, 293, 302`).
- Mathlib: `InfiniteGalois.restrictNormalHom_continuous` (`FieldTheory/Galois/Profinite.lean:148`).
- `Suggested.lean:325, 355, 655, 662`: `tateTheorem`, `ClassFormation.artinMap`, `localArtinMap` and `normResidue` are `abbrev`s, and `artinMap_conj` (`:365`) is a closed proof. This matches the reworded row at README line 486.

**Cross-roadmap citations resolved.**
- #1410 head `e81ddb8`, `RamificationOfCompleteDiscretelyValuedFields/README.md:117–125`: §4a.1 consumes "that set", Layer 7's group, at every `u ≥ −1`. This matches README lines 2315–2318 and the new name.
- #1215 head `024927f`, `ClassFieldTheory/Suggested.lean:109`: the same definition under the same name and signature. It is a revision of this same file, so it is not a second owner (R02 covers the order).
- `roadmaps grep localAbsoluteUpperRamificationGroup` over main and the 469 open heads finds only #1215 and this pull request.
- `RatModInt` occurs on main only in ClassFieldTheory's own `Suggested.lean`; no other roadmap cites it.
- The three `citations.md` leads (`cd_p_le_of_isClosed`, `cd_p_le_scd_p`, `cd_p_eq_of_isProPSylow`) are in untouched text. They are ProfiniteCohomology and ProfiniteProPGroups roadmap names on main, resolved in the previous review.
- The overlaps file lists §2.4–§2.6 as dropped ids. Their old → new mapping is still at README lines 192–194.

**Sources checked (seeded sample, where it falls in the changed passages).**
- "The absolute upper ramification groups": `milne-cft` I §4, page marker 55, printed p. 46:
  - line 2410, Proposition 4.4, Herbrand's quotient compatibility for `M ⊇ L ⊇ K`;
  - lines 2415–2419, the filtration of an infinite Galois extension, defined level by level;
  - line 2379, the ceiling convention for real `u`.

  The Lean docstring at `Suggested.lean:813` and README lines 1369–1382 cite exactly this.
- The other sampled targets ("Implemented in Tau Ceti" at 680 and 761, the five exit criteria, "The Kummer class", "The Hilbert symbol", "Smoothness", "The `p`-adic valuation…", "Local duality and the Euler characteristic", "The cyclotomic normalization", "Conductors" and "Filtered norms") are not touched by the diff. Their previous verification stands. The Layer 7 exit criterion (line 1519) still names `closure_map_artinMap_unitFiltration`, which this head states.

**Adversarial table.** Rows marked "r14" carry forward the previous report (review of `0333060`) for statements the diff leaves untouched. Rows marked "new" are computed for this head's changed statements.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `localAbsoluteUpperRamificationGroup` at `u = −1` (new) | any `K` | every finite `G^{−1}` is `G_{⌈−1⌉} = G_{−1} = G`, so the intersection is `G_K`; proved in Lean (probe A) | sound | none |
| … at `u ∈ (−1, 0]`, against the floor model (new) | unramified level of degree `f` | ceiling: `G_0 = 1` at that level, so the image is trivial; floor at `u = −1/2`: `G_{−1} = G ≅ ℤ/f` | ceiling matches Milne line 2379 | none |
| … at the tame level (new) | `ℚ_p(ζ_p)`, odd `p`, `u = 0` and `u = 1/2` | image `(ℤ/p)ˣ`, of order `p − 1`; image `G_1 = 1` | sound | none |
| … finite projections at two levels (new) | `ℚ_2(ζ_8) ⊇ ℚ_2(√2)`, `u = 1.5` and `u = 2.5` | `{1,5}` and `σ_5(√2) = σ_5(ζ_8 + ζ_8⁷) = ζ_8⁵ + ζ_8³ = −√2`, so `{1,5}` maps onto `Gal(ℚ_2(√2)/ℚ_2)^{1.5} = G` (break 2); at `2.5` both are `1` | sound | none |
| … the lower-numbering model (new) | depth 3 | `G_3(ℚ_2(ζ_8)) = {1,5}`, while `G_3(ℚ_2(√2)) = 1` and `σ_5` is nontrivial there, so the lower-numbered set does not project | excluded by the definition | none |
| `closure_map_artinMap_unitFiltration`, restated (new) | `n = 0`; `ℚ_p` with `n = 1` at `ℚ_p(ζ_{p²})`; one tactic | `Art(𝒪ˣ)` is compact, hence closed, and equals the inertia of `K^ab/K`, the image of `G_K^0`; `#(U^(1)/U^(2)) = p = #Gal(ℚ_p(ζ_{p²})/ℚ_p(ζ_p)) = #G^1`; `rfl` and `simp` fail (probe C) | sound, not padding | none |
| `invMap : Br K ≃+ AddCircle (1 : ℚ)` (new type) | degree-2 unramified layer; the wrong period `AddCircle (2 : ℚ)` | `1/2` has order 2 in `ℚ/ℤ`, the degree; with period 2 it would have order 4 | matches Tau Ceti `Invariant.lean:200` | none |
| The reworded alias and supplier claims (new) | `ideleFormation`, `ideleToClassH2`, the row at line 486 | plain `def`s at `Formation.lean:83` and `LiftingObstruction.lean:245`; 4 `abbrev`s and 1 closed theorem in `Suggested.lean` | sound | none |
| Unit-filtration ownership (r14 R01) | `𝔽_p((t))`, `y^p − y = t⁻¹` | #1474 lines 1116–1121 and Layer 7 both give `Art(U^(1)) = G` and `Art(U^(2)) = 1` | two owners | R01 |
| Exit criteria of Layers 0–2 (r14) | the names at the pin | `tateTheorem`, `tateIso`, `nakayamaNegTwo`, `artinEquiv`, `cupClass`, `fundamentalClass_restrict_generates` present | met | none |
| Layer 3 exit criterion (r14) | `C₂` on `ℂˣ`; trivial `ℤ/2` | `H¹ = 0`, `#H² = 2`; `H¹ = ℤ/2 ≠ 0` | sound | none |
| Coefficient objects (r14) | `μ_3` over `ℚ_7` and `ℚ_2`; `n = 0` | trivial; nontrivial; zero pairing | sound | none |
| Local units and the `H²` bound (r14) | `L = K`; cyclic of degree `m`; infinite | `1 ∣ 1`; `m ∣ m`; `0 ∤ m` | sound | none |
| The Hilbert symbol (r14) | `ℚ_7`, `n = 3`; `(−1,−1)` over `ℚ_2` | invariant `1/3`; symbol 1 | sound | none |
| The Tate dual (r14) | `μ_3` over `ℚ_2` | `A' = ℤ/3` trivial | sound | none |
| Smoothness (r14) | a non-open index-2 subgroup of `G_ℚ` | discrete `ℤ/2` that is not smooth | sound | none |
| Local duality and the Euler characteristic (r14) | `𝔽_p` over `ℚ_p`; `𝔽_2` over `ℚ_2`; `μ_3` over `ℚ_2` | `p² = p·1·p`; `8 = 2·2·2`; `#H¹ = 3 = 1·3·1` | sound | none |
| `eulerCharacteristic_finrank_fp` (r14) | `ℚ_2` with `𝔽_2` | `3 = 1 + 1 + 1` | sound | none |
| `algebraMap_vle_algebraMap_iff_of_finite_padic` (r14) | `ℚ_p(√p)`; `v(p) < 0` | `v_F(p) = 2v_F(√p) > 0`; contradiction with `1 + p ∈ ℤ_pˣ` | sound | none |
| Conductors and `conductorExponent_eq_sInf_upperRamificationGroup` (r14) | unramified; `ℚ_5(ζ_5)`; `ℚ_2(√2)`; `ℚ_2(ζ_8)` | 0; 1; 3; 3 | sound | none |
| `map_unitFiltration_normResidue` (r14) | `ℚ_p(ζ_p)` at `n = 0, 1`; `ℚ_2(√2)` at `n = 2, 3` | `G`, 1; `G`, 1 (`(5,2)_2 = −1`) | sound | none |
| `sup_norm_unitFiltration_eq_of_upper_eq_top` (r14) | `ℚ_2(√2)` at `r = 2, 3` | `N(1+√2) = −1`; the hypothesis fails at 3 | sound | none |
| Filtered norms tame Check (r14) | `ℚ_2(∛2, ζ_3)` | `e = 3`, `G^1 = 1` | sound | none |
| Global Herbrand quotients (r14) | `ℚ(i)`, `S = {∞, 2}` | `h(C) = 2 = [L:K]` | sound | none |
| The lifting obstruction (r14) | `ℚ(√13, √17)` | lcm `2 < 4` | sound | none |
| `relDiscr_eq_finprod_abelianConductor` (r14) | `ℚ(i)`; `ℚ(ζ_5)`; `ℚ(i, √5)` | `(4)`; `5³`; `400 = 1·4·5·20` | sound | none |
| `isPrincipal_map_hilbertClassField` (r14) | `ℚ(√−5)`, `I = (2, 1+√−5)` | `I𝒪_H = (1+i)` | sound | none |
| `card_ideleClassNormQuotient`, `cyclicHasseNorm` (r14) | `ℚ(i)` with 3 and 5 | index 2; 3 is not a local norm at 3, while `5 = N(2+i)` | sound | none |
| `hilbertProductFormula` (r14) | `(−1,−1)`, `(5,5)`, `(3,7)` over `ℚ` | `1 + 1 = 0`; all 0; `1 + 1 = 0` | sound | none |
| `cyclotomicCharacter_artinMap` (r14) | `u = −3` on `μ_16` | 5, against 13 | sound | none |
| `scd_p_absoluteGaloisGroup_eq_two` (r14) | `K/ℚ_p`; `𝔽_p((t))` | 2; excluded | sound | none |
| Layer 13 ring-class Checks (r14) | `ℚ(√3)`; `ℚ(ζ_7 + ζ_7⁻¹)` | `h⁺ = 2`; `14/9 < 2` | sound | none |

**Ownership against open work.**
- I searched for the new definition by name and by object ("absolute upper", and `upperRamificationGroup` together with `absoluteGaloisGroup`) in the pinned Mathlib and Tau Ceti: 0 hits. The object is not in the libraries, so it is this roadmap's (scope item 6).
- Over main and the 469 open heads, the only other occurrence is #1215, a revision of this roadmap.
- The only second owner from another roadmap remains #1474 (R01).

**Remark on untouched text** (no change requested): README line 2309 says FunctionFieldArithmetic extends "Layer 8's local existence"; it belongs with R01 and is resolved with it.

## Not verifiable

- **Serre, *Local Fields*** (`serre-local-fields`, settled as uncertified because it is paywalled): XV §2, Theorem 2 and Corollary 3 to Theorem 1. These are now also cited in the docstring of `closure_map_artinMap_unitFiltration`. I checked the statement by computation only (table).
- The previous report's list stands, because the change touches none of those locators:
  - `neukirch-ant` VII §11;
  - `nsw` (3.3.4), (7.1.8), (7.2.5) and (7.3.1)–(7.3.4);
  - `artin-tate` (waived);
  - Engler–Prestel, Tate 1952, Nakayama 1957, Rim, Brown, Lang, Cox, Tate's Corvallis article, Weil 1951, Serre's *Galois Cohomology* and *A Course in Arithmetic*, and Cassels–Fröhlich. None of these is in the sources cache, and the publisher pages are paywalled.

## Source issues

- none
