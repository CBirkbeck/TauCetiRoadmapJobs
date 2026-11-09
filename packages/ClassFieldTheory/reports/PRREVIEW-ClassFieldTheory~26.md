# Review of ClassFieldTheory (pull request #1411 at 15207f6)

**Verdict:** needs changes

:robot: AI-assisted review (Claude Opus 5.5). This is a full review of `TauCetiRoadmap/ClassFieldTheory/` at this head. The folder is unchanged since 303ce50. All three findings are P3: none is false, vacuous or unowned, and the gate passes.

## R01 (P3) — Layer 7 plans a long route and an extra target for a theorem Tau Ceti already proves in norm-group form

**Location.**
- README:1484–1491: "**Filtered norms.** Two norm statements … enter the proof: … if `J` is abelian and `J^r = J`, then `U_F^(0) = N_(E/F)(U_E^(0)) · U_F^(r)` (`sup_norm_unitFiltration_eq_of_upper_eq_top`), a target of this layer".
- The *Needs* line at README:1523–1531 and the supplier row at README:491 both omit the pinned criterion.
- `Suggested.lean:685–695` states `sup_norm_unitFiltration_eq_of_upper_eq_top` as an open target.
- README:2398–2401 says that `FunctionFieldArithmetic` "consumes … `map_unitFiltration_normResidue` and its absolute form `closure_map_artinMap_unitFiltration`".

**Claim.** The finite form of unit-filtration reciprocity is a corollary, a few lines long, of a pinned Tau Ceti theorem that the README never names. The route through filtered norms, the totally ramified reduction and the auxiliary target is therefore not needed. The auxiliary target is not a headline, yet `Suggested.lean` states it as one. The consumer claim is also false at FunctionFieldArithmetic's head: it re-derives the theorem from the same pinned criterion instead of citing these names.

**Witness.**
- `unitFiltration_le_normGroup_iff_upperRamificationGroup_eq_bot` (`Local/Conductor/UpperNumbering.lean:64`): for abelian `M/K`, `U(K,v) ⊆ N(Mˣ)` exactly when `Gal(M/K)^v = 1`. No reciprocity is used.
- FunctionFieldArithmetic (#1474) README:1146–1160 re-derives the theorem and cites neither name.

**Repair, tested on `ℚ_2(ζ_8)/ℚ_2` at depth `n = 2`.**
1. Replace the route paragraph with the short route. For every subgroup `H ≤ G` with fixed field `M`:
   - `normResidue(U_K^(n)) ⊆ H` holds exactly when `U_K^(n) ⊆ N_{M/K}(Mˣ)`, by `artinMap_restrict` and the norm kernel `normResidue_mk_eq_one_iff` (`Local/Reciprocity.lean:181`);
   - that holds exactly when `Gal(M/K)^n = 1`, by `UpperNumbering.lean:64`;
   - that holds exactly when `G^n ⊆ H`, by `map_restrictNormalHom_upperRamificationGroup` (`Herbrand/UpperQuotient.lean:98`).

   Take `H = G^n`, then `H = normResidue(U_K^(n))`.
2. Put these inputs on the *Needs* line and in the row at README:491.
3. Drop "Filtered norms … enter the proof" and delete `sup_norm_unitFiltration_eq_of_upper_eq_top` from `Suggested.lean`. If it is kept as a Layer 7 target for its own sake, it stays in the README only, with its Serre locator.
4. Reword the FunctionFieldArithmetic bullet to what that roadmap does, or have its §4.2 cite the two names instead of re-deriving them.

**The repair on the test instance.**
- With `H = ⟨σ_5⟩`, the fixed field is `ℚ_2(i)`, of conductor 2. `U^(2) = 1 + 4ℤ_2` consists of norms from it, and `G^2 = {1,5} ⊆ H`.
- With `H = ⟨σ_3⟩`, the fixed field is `ℚ_2(√−2)`; with `⟨σ_7⟩` it is `ℚ_2(√2)`. Both have conductor 3, so `U^(2)` is not in the norm group and `G^2 ⊄ H`.
- Hence `normResidue(U^(2)) = {1,5}`. This agrees with `u ↦ u⁻¹ mod 8` on `1 + 4ℤ_2`.

## R02 (P3) — 17 declarations of `Suggested.lean` re-export a Tau Ceti declaration of the same name, and no roadmap uses them

**Location.** In `Suggested.lean`:

| Declaration | Line |
|---|---|
| `ClassFormation` | 220 |
| `tateTheorem` | 247 |
| `ClassFormation.artinMap` | 277 |
| `artinMap_conj` | 287 |
| `muNRepCoeffDictionary` | 345 |
| `Br` | 402 |
| `invMap` | 408 |
| `localSymbol` | 463 |
| `tateDual` | 491 |
| `finite_H` | 520 |
| `tateDualityPairing` | 532 |
| `tateDualityPairing_perfect_mixed` | 540 |
| `localArtinMap` | 579 |
| `artinMap_restrict` | 621 |
| `unramifiedCoordinate` | 657 |
| `unramifiedCoordinate_artinMap` | 663 |
| `conductorExponent` | 681 |

**Claim.** Each of these is an `abbrev` of a Tau Ceti definition, or a theorem closed by one Tau Ceti term. That makes them padding: the file is meant to be an acceptance test, not an API catalogue. Every README citation of these names, here and in LocalGaloisGroups and QuadraticFormInvariants, resolves to the same-named Tau Ceti declaration, so the re-exports add nothing for consumers.

**Witness.**
- `Suggested.lean:520–527` proves `finite_H` by the single term `TauCeti.ClassFieldTheory.finite_H (…)`. The other 16 have the same shape.
- The three importing `Suggested.lean` files (LocalGaloisGroups, IntegralLattices, GlobalQuadraticForms) use none of the 17.

**Repair.**
- Delete the 17 declarations.
- Point `conductorExponent_eq_sInf_upperRamificationGroup` at `TauCeti.ClassFieldTheory.conductorExponent`.
- Reword the sentences that describe the file to name Tau Ceti's declarations: README:58–60, 397, 484, 556–568, 858 and 1264, and the module docstring at `Suggested.lean:59–69`. The README keeps every statement.

**Tested.** I elaborated a scratch copy with exactly these deletions and that one retargeting. It gives the six `sorry` warnings and nothing else, and every name the three importing files use survives. The remaining re-exports are outside this finding, because removing them would break main's LocalGaloisGroups and GlobalQuadraticForms, which import this module. They are:
- the junk-valued `kummerClass` and its two equations;
- `restrictAbsolute`, which LocalGaloisGroups README:178 cites and which has no Tau Ceti namesake;
- the 38 names that other roadmaps' Lean files use.

## R03 (P3) — The pull request edits `Completed/LocalGaloisGroups/Suggested.lean`, which the brief does not name as one of its folders

**Location.** `Completed/LocalGaloisGroups/Suggested.lean:326` and `:485`. The witness is `git diff --stat origin/main...HEAD` with the three named folders excluded.

**Claim.** This file lies outside the folders the review brief names as this pull request's own: ClassFieldTheory, IntegralLattices and QuadraticFormInvariants. The edit is forced, and it is correct. On main, `h2MuEquivZMod_mixed` and `h2FpEquivZMod_of_mu` (main `Suggested.lean:1131–1144`) were `sorry`'d `Nonempty (… ≃+ ZMod n)` statements. This head replaces them with the canonical `≃+`, so the importing consumer now needs `⟨…⟩`.

**Witness.**
- The two changed lines are `⟨ClassFieldTheory.h2MuEquivZMod_mixed p F n hn⟩` and `⟨ClassFieldTheory.h2FpEquivZMod_of_mu p F _ (muNRepIsoTrivialFp p F ζ hζ)⟩`.
- The gate's `outside-folder` check passes on this file, in the worker's run and in mine.

**Repair.** The consumer imports this module, so its two lines must merge together with the signature change. They cannot be split into a later pull request. The fix is on the worker's side:
- register `Completed/LocalGaloisGroups` as one of this pull request's folders, as the description already does, so that it gets its own review;
- the author needs to change nothing in this folder.

## Verified sound

**Gate and build.**
- The worker's gate at 15207f6 passes every check (`gate.md`).
- My rerun without the pull request's folder list reports `outside-folder` only on files in IntegralLattices and QuadraticFormInvariants, which the brief names as this pull request's own. All other checks are 0.
- The dependency check (`gate --depcheck … --movable`) reports `depcheck: 239 roadmaps, 2322 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- `lake env lean` on `Suggested.lean` exits 0 with six `sorry` warnings, at lines 512, 688, 701, 750, 897 and 907.

**Signatures.** I compared the elaborated types of all 72 declarations with the README.
- The two the signature tool flagged, `restrictAbsolute` and `absoluteGaloisGroupExtend`, carry no local-field binders. That is correct, because restriction and extension along an embedding are field-theoretic.
- All seven Layer 7 declarations keep their `ValuativeExtension K L`, `IsAbelianGalois K L` and local-field binders.
- `relDiscr_eq_finprod_abelianConductor` has `IsAbelianGalois K L` over number fields.

**Padding probe.** On a scratch copy, `first | rfl | simp | infer_instance | aesop` closes none of the six open targets, and neither does `exact?`. The `exact?` attempt on `sup_norm…` hit the heartbeat limit; the other five reported failure.

**Headline theorems.** These are the README's Scope items 1–14:
- Tate's theorem;
- finite reciprocity and its functoriality;
- the local Brauer group and the Hilbert symbol;
- local duality and the Euler characteristic;
- local reciprocity, `cd = scd = 2`, the cyclotomic normalization and unit-filtration reciprocity;
- norm limitation;
- local existence and the local correspondence;
- the local Weil group;
- the Brauer sequence;
- global reciprocity;
- global existence;
- Hasse's norm theorem, the class fields, Kronecker–Weber, the conductor–discriminant formula and the principal ideal theorem;
- Hilbert reciprocity.

Each one that is open at the pin is stated in `Suggested.lean`: both forms of unit-filtration reciprocity, the principal ideal theorem and the conductor–discriminant formula. The rest are proved at the pin, and I opened each one I checked. For example, `kroneckerWeber` is at `ClassFields/KroneckerWeber.lean:178`, and the cyclotomic conductor form is at `ClassFields/CyclotomicLevel.lean:120`. There is no `sorry` in Tau Ceti's `NumberTheory/ClassFieldTheory`, `NumberTheory/LocalField` or `TateCohomology` sources. No statable headline is missing.

**Names and paths.**
- Every backticked identifier in the README resolves to a Mathlib or Tau Ceti declaration at the pins, to a `Suggested.lean` declaration, or to a supplier roadmap's name. Mathematical notation is excluded from this check.
- All 21 fully qualified `TauCeti.…` names pass `#check`. Four of them need modules that the file does not import: `Local/Quadratic.lean`, `WeilGroup/Basic.lean` and `Cup/TateNakayama.lean`.
- Every cited file path exists.
- I checked 39 name-and-file pairs. Among them are `AlgHom.valuativeExtension` at `AlgebraicExtension/Basic.lean:314` and `AlgHom.restrictNormalHom_commutes` at `FieldTheory/Galois/Restriction.lean:80`.

**Library declarations opened** (Tau Ceti, relative to `TauCeti/`, unless marked Mathlib):

| Declaration | File and line |
|---|---|
| `unitFiltration_le_normGroup_iff_upperRamificationGroup_eq_bot` | `NumberTheory/ClassFieldTheory/Local/Conductor/UpperNumbering.lean:64` |
| `conductorExponent_le_iff_upperRamificationGroup_eq_bot` | same file, `:121` |
| `conductorExponent_fixedField_ker` | same file, `:130` |
| `map_restrictNormalHom_upperRamificationGroup` | `LocalField/Herbrand/UpperQuotient.lean:98` |
| `upperRamificationGroup_quotient` | same file, `:234` |
| `upperRamificationGroup_fixedField` | same file, `:264` |
| `map_normUnits_unitFiltration_psiNat_eq_of_upperRamificationGroup_eq_bot` | `Norm/Surjectivity.lean:223`, every finite Galois extension, no abelian hypothesis |
| `map_normUnits_unitFiltration_psiNat_le` | `Norm/Herbrand.lean:167` |
| `normGradedMap` | `Norm/Graded.lean:113` |
| `upperRamificationGroup` | `Herbrand/Basic.lean:421`, defined as `G_{ψ(v)}` |
| `RamificationIndexDomain` | `RamificationGroup.lean:86`, the reals `≥ −1` |
| `normResidue` | `Local/Reciprocity.lean:162` |
| `artinMap_restrict` | `Local/ArtinMap.lean:132` |
| `abelianConductor` | `Global/AdmissibleModulus/Basic.lean:193`, no hypothesis on `L/K` |
| `Modulus.one` | `RayClass/Modulus.lean:262`, infinite part `∅` |
| `relDiscr` | `RingTheory/DedekindDomain/Discriminant/Basic.lean:33`, the relative norm of the different |
| `hilbertClassField` | `ClassFields/RayClassField.lean:241` |
| `rayClassField` | same file, `:123`, `classField` of `globalClassField` |
| `ringClassField` | `RingClass/Field.lean:111` |
| `IsSmoothDiscrete` | `ContCohomology/SmoothDiscrete/Basic.lean:259`: discrete, with open stabilisers |
| `tateDualityPairing_perfect_mixed` | `Local/Duality/Perfect.lean:280`, takes `CharZero` with `[DiscreteTopology A.V]` |
| `instFactIsSmoothDiscreteTateDual` | `Local/Duality/Basic.lean:165` |
| `localSymbol_eq_zero_iff_mem_normGroup` | `Local/CyclicClass.lean:293`, `s ^ n = b` and `K⟮s⟯ = ⊤` |
| `forall_localSymbol_kummerClass_eq_zero_iff` | `Local/HilbertPairing.lean:61` |
| `natCard_H2_units_dvd_finrank` | `Brauer/LocalH2Bound.lean:78` |
| `index_normGroup_of_isCyclic` | same file, `:70` |
| `herbrandQuotient_unitFiltration_zero` | `UnitFiltration/TateCohomology.lean:291` |
| `kummerEquivOfCharZero` | `MuNRep.lean:358` |
| `h2MuEquivZMod` | `Brauer/RootsOfUnity.lean:89` |
| `FinitePadicExtension` | `AbsoluteRamificationIndex.lean:64` |
| `IsGalois.normalBasis` (Mathlib) | `FieldTheory/Galois/NormalBasis.lean:121` |
| `IsGalois.normalBasis_apply` (Mathlib) | same file, `:128` |

`FinitePadicExtension` and a search of the pins show that no `ValuativeExtension ℚ_[p] F` instance exists, so the Layer 5 target is genuine.

**Cross-roadmap citations resolved.**
- ProfiniteCohomology (main):
  - README:234 has `cd_p`, `scd_p`, `cd_p_le_scd_p`, `cd_p_le_of_isClosed` and `strictCohomologicalDimensionAt_le_iff_forall_openSubgroup` (Layer 11). Its `Suggested.lean` declares them at :3069 and :3126.
  - README:219 has `longExact_exact`, :221 `corestriction_comp_res`, :225 `shapiroIso`, :228 `cup_add_left`, and :218 `H1ConjInvariants`.
- ProfiniteProPGroups (Completed): `Suggested.lean:3669` and `:3758`.
- RepresentationTheory/ModularInduction (main), Layers 0, 1, 3 and 4: `modRepK0`, `latticeDefect_*` and `modularArtin_exists_nsmul_mem_indCyclicCoprime`.
- The old section numbers §2.4–§2.6, which EndoscopicTransferAndUnitaryTraceComparison (#999), AnticyclotomicLocalUnits (#1692) and EllipticCurveModularityWild3Adic (#1484) cite, are mapped to the new headings at README:192–197. No roadmap on main cites a ClassFieldTheory section number.

**Ownership.** I grepped the 465 open heads and main for the absolute upper filtration and for unit-filtration reciprocity.
- RamificationOfCompleteDiscretelyValuedFields (#1410) README:126–128 agrees that the local-field filtration belongs to this roadmap. It keeps the version relative to a valuation subring and proves the two agree. This avoids a cycle, since ReductiveGroupsPartII and SchemeAndStackFoundations, which supply that roadmap, consume this one.
- #1215 revises Layer 7 under other names. The description says which names survive a rebase.
- PadicPeriodRings (#940) README:34 and 120, ArithmeticGaloisRepresentations (#856) README:520, which declares a gap that this pull request fills, and QuadraticFormInvariants README:302–308 consume the names they claim to. FunctionFieldArithmetic does not (R01).

**Sources.** These are the seeded targets.
- **Conductor–discriminant formula.** milne-cft lines 7423–7437 (V Theorem 3.27 and Remark 3.28, printed p. 165) support the statement and the rule `f(χ) = f(L^{ker χ}/K)`. Milne omits the local proof; the route supplies it from `LocalField/Discriminant/Conductor.lean:58`.
- **Absolute upper groups.** milne-cft lines 2410–2419 (I Proposition 4.4 and the definition after it, p. 46) match.
- **Conductors and existence.** milne-cft lines 1321–1332 (I 1.9, p. 23) define the conductor as cited.
- **Local units and the `H²` bound.** milne-cft lines 4716–4758 (III Lemmas 2.3–2.6, pp. 104–105) match. Milne proves Lemma 2.4 in characteristic 0 only. The README's `1 + A` route, with `A·A ⊆ πA`, works in both characteristics and credits Serre's Cassels–Fröhlich chapter.
- **Unit-filtration reciprocity.** It is corroborated by milne-cft lines 1374–1378 (I 1.11, p. 24) and by `UpperNumbering.lean:64`.
- **Euler characteristic.** milne-adt line 1227 (I Theorem 2.8) gives `χ = (R : mR)⁻¹`, which agrees with `#H¹ = #H⁰·#H²·p^{[F:ℚ_p]v_p(#A)}`.
- "Implemented in Tau Ceti" (Layers 1, 2 and 9), the "Exit criterion" paragraphs (Layers 0–2, 5–8, 12 and 13), "The Kummer class", "The Hilbert symbol", "Smoothness", "Conductors" and "Filtered norms" were checked against the declarations listed above, with the stated hypotheses.

**Adversarial table** (28 rows, values computed):

| Statement | Instance | Value computed | Value expected | Result |
|---|---|---|---|---|
| `map_unitFiltration_normResidue` | `ℚ_2(√2)`, `n = 2` | `5 ∈ U^2` is not a norm (`(5,2)_2 = −1`), so the image is `G` | `G^2 = G` (break 2) | holds |
| same | `ℚ_2(√2)`, `n = 3` | `1 + 8ℤ_2` consists of norms, so the image is `1` | `G^3 = 1` | holds |
| same | `ℚ_2(ζ_8)`, `n = 0, 2, 3`, via `u ↦ u⁻¹ mod 8` | `(ℤ/8)ˣ`, `{1,5}`, `{1}` | `G^0 = G`, `G^2 = {1,5}`, `G^3 = 1`; lower `G_3 = {1,5}` | holds; the upper numbering is needed |
| same | unramified `L/K`, `n = 0`; `L = K` | units are norms, so `1`; both sides trivial | `G^0 = G_0 = 1` | holds |
| same | `F_p((t))`, `y^p − y = t⁻¹`, `n = 1, 2` | `G`, `1` | break 1 | holds in characteristic `p` |
| short route (R01) | `ℚ_2(ζ_8)`, `n = 2`, `H = ⟨5⟩, ⟨3⟩, ⟨7⟩` | fixed-field conductors 2, 3, 3 | `G^2 ⊆ H`: yes, no, no | the equivalence holds and gives `{1,5}` |
| `closure_map_artinMap_unitFiltration` | `ℚ_2`, level `ℚ_2(ζ_8)`, `n = 2`; `n = 0` at an unramified level | image of `1 + 4ℤ_2` is `{1,5}`; trivial | `Gal^2 = {1,5}`; inertia image trivial | holds |
| `localAbsoluteUpperRamificationGroup` | `u = −1`; `u ∈ (−1, 0]` at an unramified level of degree `f` | `⊤`; restriction trivial | `G_K`; `G_K → ℤ/f` is onto | discriminates |
| same, lower-numbering model | `ℚ_2(ζ_8) ⊃ ℚ_2(√2)`, depth 3 | `σ_5|_{√2}` is nontrivial and `G_3(ℚ_2(√2)) = 1` | the image misses `{1,5}` | the wrong model is excluded |
| `sup_norm_unitFiltration_eq_of_upper_eq_top` | `ℚ_2(√2)`, `r = 2`; `r = 0`; `L = K` | `U^0/U^2 = {±1}` and `N(1+√2) = −1`; trivial; trivial | equality | holds (R01 concerns only the route) |
| `conductorExponent_eq_sInf…` | `ℚ_2(√2)`, `ℚ_2(i)`, `ℚ_p(ζ_p)`, unramified | 3, 2, 1, 0 | `sInf{n : G^n = 1}`: 3, 2, 1, 0 | holds |
| Filtered norms, first statement | `ℚ_2(∛2, ζ_3)` (`S_3`, `e = 3`), `r = 1`; `ℚ_2(√2)`, `r = 3` | `ψ(1) = 3`; `ψ(3) = 4` | `N(U^3) = U^1`; `N(U^4) = U^3` | holds without abelian or total-ramification hypotheses |
| Conductors | `ℚ_2(√2)`: is `c ≤ 2`? is `c ≤ 3`? | false; true | `G^2 = 1`: false; `G^3 = 1`: true | holds |
| `isPrincipal_map_hilbertClassField` | `ℚ(√−5)`, `I = (2, 1+√−5)` | `I² = (2)` and `2 = −i(1+i)²` | `I𝒪_H = (1+i)`, with `H = K(i)` | holds |
| same | `K = ℚ`; `I = 0` | trivial; `(0)` | principal | holds |
| `relDiscr_eq_finprod_abelianConductor` | `ℚ(i)/ℚ`; `ℚ(ζ_5)/ℚ`; `L = K` | `(4)`; `(125)`; `(1)` | `1·4`; `1·5·5·5`; `Modulus.one` has finite part `⊤` | holds |
| `algebraMap_vle…_of_finite_padic` | `ℚ_2(i)` with `(a,b) = (2,1)` and `(1,2)` | `v_F(2) = 2`, `v_2(2) = 1` | `≤` holds on both sides, then fails on both | holds |
| same, non-example | `ℚ_5` with a 3-adic valuation: `u(6) = u(3) < 1` | `6 ∈ 1 + 5ℤ_5` is divisible by every `n` prime to 5 | excluded by step (i) | discreteness is used |
| Local `H²` bound | `L = K`; cyclic of degree `m`; an infinite group | `1 ∣ 1`; `m ∣ m`; `Nat.card = 0` | `0 ∤ m > 0` | divisibility forces finiteness |
| Hilbert symbol | `(−1,−1)` over `ℚ_2`; `ℚ_7`, `n = 3`, parameter 7 | `x² + y² = −1` is unsolvable, giving `1 ∈ ℤ/2`; invariant `1/3`, coordinate 1, and 2 if negated | at `n = 2`, `−1 = 1` | holds |
| Euler characteristic | `ℚ_2` with `μ_3`; `ℚ_p` with `ℤ/p`; `ℚ_2` with `ℤ/2` | `#H¹ = 3`, `p²`, `8` | `1·3·1`, `p·1·p`, `2·2·2` | holds |
| Smoothness | `∏ℤ/2` acting on a discrete `ℤ/3` through a non-open kernel of index 2 | every operator is continuous | the stabiliser is not open | discrete does not imply smooth, as stated |
| Tate's theorem | `C₂` on `ℂˣ`; `C₂` trivially on `ℤ/2` | `H¹ = 0`, `#H² = 2`; `H¹ = ℤ/2` | `#Ĥ⁻² = 2`; the second is excluded | holds |
| `cyclotomicCharacter_artinMap` | `ℚ_2`, `u = −3` on `μ_16`; `u = −1` | `(−3)⁻¹ ≡ 5` | not 13; `i ↦ −i` | arithmetic Frobenius pinned |
| `hilbertProductFormula` | `ℚ` with `(3,7)`, `(−1,−1)` and `(5,5)` | 1 at {2,7}; 1 at {2,∞}; all 0 | sums 0 | holds |
| Layer 12 Kummer degree | `ℚ`, `p = 2`, `S = {2}`; `ℚ(ζ_3)`, `p = 3` | 4; 9 | `2^{1+1+0}`; `3^{1+0+1}` | holds |
| Layer 8 conductor | `U^1⟨2⟩ = ℚ_2ˣ`; `ℚ_p(ζ_p)` | conductor 0; `N(1 − ζ_p) = p`, conductor 1 | trivial field; `U^1⟨p⟩` | holds |
| Lifting obstruction | `ℚ(√13, √17)`; `ℚ(√2, √3)` | lcm of local degrees: 2; 4 | image of order 2 in `ℤ/4`; surjective | holds |

## Not verifiable

- **Serre, *Local Fields*.** The manifest settles it as `uncertified`. These locators are cited without the text: XV §2, Theorem 2, and Corollary 3 to Theorem 1; V §§3 and 6; VI §3; IX §§3–5. The statements are corroborated by milne-cft lines 1374–1378 and by `UpperNumbering.lean:64` and `Norm/Surjectivity.lean:223`.
- **Neukirch, *Algebraic Number Theory*, VII §11, and NSW (7.1.8), (7.2.5), (7.2.6) and (7.3.1)–(7.3.4).** Both are settled as `uncertified`.
- **Artin–Tate.** Settled as `waived`.
- **Tate's Corvallis article, Cox's *Primes of the Form x² + ny²*, and Kopp–Lagarias.** These were not in this sample.

## Source issues

- none
