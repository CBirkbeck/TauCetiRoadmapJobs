# Review of ClassFieldTheory (pull request #1411 at cded4a2)

**Verdict:** needs changes

This is a full review of the head that the previous review also read. The three previous findings have this status:

- the FunctionFieldArithmetic duplicate is repaired;
- the merge order in the description is repaired;
- the `outside-folder` failure is partly repaired: the description now names the folder, but the gate still fails.

The full pass found four new defects. The most serious is that the open valuation target of Layer 5 depends on an unowned theorem.

## R01 (P1) — The route of the Layer 5 valuation target uses F. K. Schmidt's theorem, which nothing owns

**Location:** `TauCetiRoadmap/ClassFieldTheory/README.md:1101–1106`, with the same text in `Suggested.lean:580–587`: "a field that is not separably closed is henselian for at most one rank-one valuation up to equivalence (F. K. Schmidt; Engler–Prestel, *Valued Fields*, §4.4)".

**Claim:**
- The open target `algebraMap_vle_algebraMap_iff_of_finite_padic` is true, and two closed exports depend on it: `eulerCharacteristic_finrank_fp` and `cyclotomicCharacter_artinMap`.
- Its only route is F. K. Schmidt's theorem in rank one. That theorem is not a target of any layer, is not named under *Exact supplier contracts*, and is not at the pins.
- The target has no *Needs:* line. A citation is not a supplier, and this is a general theorem of valuation theory, a target-sized piece of work in its own right.

**Witness:**
- Mathlib and Tau Ceti have no Schmidt-type theorem (grepped "Schmidt", and `IsSepClosed` with henselian).
- The rank-one statement elaborates in scratch, and `exact?` fails on it.
- #617's revision of this roadmap states it as `isEquiv_of_henselian`.

**Repair:**
1. In Layer 5, before the paragraph, add a target in prose: let `K` be a field that is not separably closed, and let `v₁`, `v₂` be rank-one valuations of `K` whose valuation rings are henselian; then `v₁` and `v₂` are equivalent.
   - Locator: Engler–Prestel, *Valued Fields*, Theorem 4.4.1, as stated in Jahnke–Koenigsmann, *Definable henselian valuations*, Theorem 2.1, p. 3. This is the manifest's certified `jahnke-koenigsmann` entry, `jahnke-koenigsmann` line 113.
   - Checks:
     - `ℚ` with `v₂` and `v₃`: the two are inequivalent, and neither is henselian;
     - an algebraic closure of `ℚ` with extensions of `v₂` and `v₃`: the two are henselian and inequivalent, but the field is separably closed;
     - on `ℚ_p(√p)`, the local-field valuation and the spectral extension of `v_p` are equivalent.
2. Give the p-adic target the line: *Needs:* that target; Tau Ceti's `henselianLocalRing_integer` (`LocalField/Henselian.lean:41`), applied to `F` with both valuations; Tau Ceti's `algebraicExtensionValuativeRel` and `algebraicExtension_valuativeExtension` (`LocalField/AlgebraicExtension/Basic.lean:130, 147`); and the fact that `F` is not separably closed.
3. Use the same statement as #617's `isEquiv_of_henselian`, so that the rebase keeps one form.

The form tested in scratch, as #617 states it: `(hK : ¬ IsSepClosed K)`, `v₁ : Valuation K Γ₁`, `v₂ : Valuation K Γ₂`, `[v₁.RankOne] [v₂.RankOne]`, `[HenselianLocalRing v₁.valuationSubring] [HenselianLocalRing v₂.valuationSubring]`, concluding `v₁.IsEquiv v₂`. It elaborates at the pin.

## R02 (P3) — The gate still fails `outside-folder` on `Completed/LocalGaloisGroups/Suggested.lean` (previous R03, partly repaired)

**Location:** `Completed/LocalGaloisGroups/Suggested.lean:326` and `:485`, the two changed lines, now `⟨ClassFieldTheory.h2MuEquivZMod_mixed p F n hn⟩` and `⟨ClassFieldTheory.h2FpEquivZMod_of_mu p F _ (muNRepIsoTrivialFp p F ζ hζ)⟩`.

**Claim:**
- The description now names `Completed/LocalGaloisGroups` among this pull request's folders.
- The gate still fails, because it accepts only folders under `TauCetiRoadmap/` as a pull request's own.
- The edit is forced and is correct. On main both declarations were `sorry`'d `Nonempty` theorems; here they are canonical equivalences.
- Reverting them is ruled out by README line 571, which forbids an arbitrary `Nonempty (X ≃ Y)`. So no edit inside this folder clears the check.

**Witness:**
- Gate: `outside-folder=3 … FAIL`, that is, this file plus the pull request's two own folders.
- On main, `ClassFieldTheory/Suggested.lean:1131–1135` reads `theorem h2MuEquivZMod_mixed … : Nonempty (H n F 2 (muNRep n F) ≃+ ZMod n) := sorry`.

**Repair:** Keep the two lines. A maintainer has to approve the `Completed/` edit as a certificate update. `Completed/README.md` has the precedent: a certificate broken by a supplier change, without a change of mathematics, is updated together with that change. No change to the roadmap folder is needed.

## R03 (P3) — "Layer 0 item 4", which EndoscopicTransferAndUnitaryTraceComparison cites for Tate–Nakayama, now names the primary-component statement

**Location:**
- `README.md:641`: "4. **`p`-primary Tate cohomology sees only `p`**".
- `README.md:648`: "5. **The Tate–Nakayama theorem**".
- The citation map at `README.md:192–197` covers §2.4–§2.6 and §4, but not the items of Layer 0.

**Claim:** On main, Layer 0 item 4 is the list that contains the Tate–Nakayama generalization and Nakayama–Rim. At this head, item 4 is the primary-component statement. A roadmap that cites the old number points at the wrong result after the merge.

**Witness:**
- #999 head `7205732`, `EndoscopicTransferAndUnitaryTraceComparison/README.md:209`: "ClassFieldTheory §2.4 and Layer 0 item 4 give the Tate–Nakayama theorem".
- Main, `ClassFieldTheory/README.md:656, 668–669`: item 4 contains "its Tate–Nakayama tensor-product generalization" and "the theorem of Nakayama and Rim".

**Repair:** Add one line to the map at `README.md:192–197`: "Layer 0 item 4 (Nakayama–Rim and the Tate–Nakayama theorem) → *Layer 0* items 3 and 5." Alternatively, swap items 4 and 5, so that Tate–Nakayama stays item 4.

## R04 (P3) — The two open targets of Layer 13 have no *Needs:* line, and two steps of their routes are not at the pin

**Location:**
- `README.md:2109–2117`, the principal ideal theorem;
- `README.md:2124–2134`, the conductor–discriminant formula.

The README has *Needs:* lines only at lines 1400, 1480 and 2243.

**Claim:** Each route mentions its inputs only in passing. Two of its steps are at the pin only in part:

- **The conductor at `𝔭`.** The exponent of `𝔭` in `abelianConductor` of the fixed field of `ker χ` must equal the local conductor exponent of `χ` restricted to the decomposition group. Only the inequality "local ≤ global" is at the pin.
- **The ideal–idele comparison.** The ground-level inclusion `C_K → C_H` must correspond to extension of ideals, with `Gal(H′/H)` the commutator subgroup of `Gal(H′/K)`.

An implementer cannot tell which inputs are supplied and which steps the target itself must prove.

**Witness:**
- Tau Ceti `Global/AdmissibleModulus/Ramification.lean:116` (`IsAdmissibleModulus.conductorExponent_le_exponent`): local conductor exponent ≤ the exponent of `v` in an admissible `𝔪`.
- No pinned theorem gives the reverse inequality.

**Repair:** Add a *Needs:* line after each target.
- **Principal ideal theorem.** Tau Ceti's `ClassFormation.groundInclusion_mem_normSubgroup_of_range_eq_commutator` (`Formation/PrincipalIdeal.lean:67`), `gal_hilbertClassField_equiv_classGroup` and `fieldRange_le_hilbertClassField_iff` (`ClassFields/RayClassField.lean:293, 362`); Layer 11. As steps this target proves: the commutator identification and the ideal–idele form of extension.
- **Conductor–discriminant formula.** Tau Ceti's `relDiscr_def`, `LocalFieldsRamification.finsum_artinConductorExponent_eq_discriminantExponent` (`LocalField/Discriminant/Conductor.lean:58`), `artinConductorExponent_le_iff` (`Herbrand/ArtinConductor.lean:83`), `IsAdmissibleModulus.conductorExponent_le_exponent` and `globalArtinMap_local`. As steps this target proves: the reverse conductor inequality and the localization of `relDiscr` at `𝔭`.
- **Locators.** Add the readable ones from the certified `milne-cft` beside the current ones:
  - V Theorem 3.17, p. 161, and V Theorem 3.19, p. 163, for the principal ideal theorem (`milne-cft` lines 7252, 7323);
  - V Theorem 3.27 with Remark 3.28, p. 165, for the conductor–discriminant formula (lines 7423, 7436).

## R05 (P3) — The module docstring of `Suggested.lean` contains a catalogue of Tau Ceti names

**Location:** `Suggested.lean:154–206`: "## Tau Ceti declarations named by `README.md` … Besides the names above, `README.md` names these Tau Ceti declarations, which this file consumes or leaves to Tau Ceti and does not restate."

**Claim:**
- The section is 115 code spans listed for no purpose other than to occur in the Lean file. The Lean-form rules exclude catalogues of names.
- The names are Tau Ceti's, not this roadmap's, and the README's supplier contracts and layers already name them.
- The list exists because the gate's readme-ids heuristic treats a name as this roadmap's own when its stem matches a declaration here: for example `kummerClass_mul` against `kummerClass`.

**Witness:**
- I ran the gate's own `readme_identifiers_missing` on the README against a copy of the file without lines 154–206. It reports 19 names, among them `kummerClass_mul`, `artinMap_congr`, `normResidue_uniformizer` and `unramifiedCoordinate_mk`.

**Repair:**
1. Delete lines 154–206.
2. In the README, write 16 of the 19 names fully qualified:
   - `TauCeti.unramifiedCoordinate_mk`, `TauCeti.unramifiedCoordinate_mk_eq_gen_iff` and `TauCeti.unramifiedCoordinate_mk_eq_one_iff`;
   - the other 13 as `TauCeti.ClassFieldTheory.<name>`.
3. State the three facts named `ClassFormation.tateIso_toAddMonoidHom`, `artinMap_eq_zero_iff` and `artinMap_trivialLayer` in prose, without the name (README lines 396, 816, 859 and 585).

Tested: with these README edits and the catalogue removed, the same function reports no names.

## Previous findings

- **R01 (FunctionFieldArithmetic states unit-filtration reciprocity itself): repaired.**
  - #1474 head `b6f153b`, `FunctionFieldArithmetic/README.md:1119–1122`: "Unit-filtration reciprocity … are consumed from ClassFieldTheory Layer 7 (`map_unitFiltration_normResidue` and `closure_map_artinMap_unitFiltration`)".
  - Its Lubin–Tate sketch, at lines 1129–1141, now proves only lubinTate_artin and existence.
  - This README's lines 147–149 and 2307–2310 are therefore true.
- **R02 (merge order in the description): repaired.**
  - The description now reads "**Merge order.** This PR → #1410 … and → #1474 … whichever of the three merges first, the other two are rebased onto it".
  - It gives the surviving names, and states "Mathlib and Tau Ceti at the pins; no roadmap supplier beyond those on main".
  - #1215's head `2ed7ba0` still has its renamed copies (`normResidue_map_unitFiltration`, `closure_map_artinMap_unitFiltration_eq_upper`), and the stated rule covers them.
- **R03 (`outside-folder`): partly repaired.**
  - The description names `Completed/LocalGaloisGroups`, but the gate still fails. This report's R02.

## Verified sound

**Gate** (my run): `set_option=0 … readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=3 source-material=0 FAIL`. The three entries are `Completed/LocalGaloisGroups/Suggested.lean` (R02) and this pull request's own `TauCetiRoadmap/IntegralLattices/Suggested.lean` and `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean`. The worker's gate run reports `outside-folder=1` and `build=0`.

**Dependency check** (`--movable`):

```text
depcheck: 238 roadmaps, 2322 edges, 0 problem(s)
```

ClassFieldTheory is on main, and every supplier it names is on main:

- ProfiniteCohomology; RepresentationTheory/ModularInduction;
- Completed LocalFieldsRamification, GlobalNumberFields, NumberFieldArithmetic and ProfiniteProPGroups.

**Elaboration.**
- `lake env lean` on `Suggested.lean` exits 0 in 17 s. The only warnings are six `sorry`s, at lines 588, 764, 777, 826, 973 and 983.
- In one scratch file, `#check @` on all 68 declarations gives 0 errors. Each open target's elaborated type matches its README statement.
- `restrictAbsolute` and `absoluteGaloisGroupExtend` correctly drop the local-field binders: they are Galois-theoretic maps.
- Every Lean name occurs in the README.

**Padding probes**, on scratch copies of `Suggested.lean`:
- `first | rfl | simp | infer_instance | decide | norm_num` leaves all six open targets unsolved.
- `exact?` fails on five of them and times out on `sup_norm_unitFiltration_eq_of_upper_eq_top`.
- None of the six is padding.
- The closed aliases are re-exports consumed under these names:
  - Lean: `Completed/LocalGaloisGroups/Suggested.lean` and the GlobalQuadraticForms and QuadraticFormInvariants files;
  - README: `Completed/LocalGaloisGroups/README.md`, for `finite_H`, `tateDualityPairing_perfect_mixed`, `artinMap_restrict`, `artinMap_conj` and `tateTheorem`.

**Note, no change requested:** the two `ℚ_p` cyclotomic aliases carry `[IsNonarchimedeanLocalField ℚ_[p]]`, which duplicates Mathlib's instance (`NumberTheory/Padics/LocalField.lean:28`). The class is `Prop`-valued (`NumberTheory/LocalField/Basic.lean:46`), so the binder is harmless.

**Seeded sample** (statement, number, page, hypotheses):

| Target | Checked against | Result |
|---|---|---|
| "Implemented in Tau Ceti" (Layers 1, 2) | All named files exist under `Formation/`. The 52 Layer 1 names resolve there and the 17 Layer 2 names are in `ClassFormation.lean`. Its seven fields (`ClassFormation.lean:96–113`) are exactly README line 231 | sound |
| Exit criteria of Layers 0, 5, 7, 8 and 13 | Layer 0: `tateIso` (`Tate/Theorem.lean:168`), `nakayamaNegTwo` and `artinEquiv` (`ArtinMap.lean:126, 139`). Layers 5, 7 and 13: their open items are exactly the six `sorry`s. Layer 8: `localClassFieldCorrespondence [CharZero K]` (`LocalExistence/Correspondence.lean:138`) and `injective_artinMap` (`LocalExistence/ArtinMap.lean:113`) | sound |
| The coefficient objects | `muNRep`, `kummerCoeffEquivMuNRep`, `kummerCoeffEquivMuNRep_smul` and `isSmoothDiscrete_muNRep` (`MuNRep.lean:137, 150, 165, 176`); `unitsRep` (`Brauer/Basic.lean:111`) | sound |
| The Tate dual | `tateDual` is `InternalHom` read through `ofDiscreteModule` (`Local/Duality/Basic.lean:97`); `tateDualEquiv`, `tateDual_ρ_eq_self_iff`, `isSmoothDiscrete_tateDual`, `tateDualMap` and `tateDualMap_exact` (`:107, 170, 159, 296, 363`); `muNRepToTateDual` and `tateDualityPairing_muNRepToTateDual` (`RootsOfUnity.lean:61, 120`) | sound |
| The `p`-adic valuation on a finite extension of `ℚ_p` | `jahnke-koenigsmann` line 113 (Theorem 2.1, p. 3) is F. K. Schmidt's theorem, proved there by citing Engler–Prestel Theorem 4.4.1, which lies in their §4.4. Mathlib's `ValuativeRel ℚ_[p]` is `.ofValuation mulValuation` (`Padics/ValuativeRel.lean:34`) | statement sound; ownership R01 |
| Local duality and the Euler characteristic | `milne-adt` line 1227: Theorem 2.8, p. 31, `χ(G,M) = (R : mR)⁻¹` for `#M` prime to the characteristic; line 1266: Lemma 2.10, induction from cyclic subgroups of order prime to `p` | sound |
| The cyclotomic normalization | Tau Ceti's `localCyclotomicCharacter_artinMap_unit` (`ExplicitCyclotomicSymbol/ArtinMap.lean:311`), with `[FiniteDimensional ℚ_[p] F] [ValuativeExtension ℚ_[p] F]` and `hu`; `milne-cft` line 10059: VII Example 8.2, p. 221, gives `ψ_l(a) = [u⁻¹]` | sound |
| Unit-filtration reciprocity | Serre XV §2 is uncertified. `milne-cft` lines 1374–1378 (I 1.11, p. 24) give the Lubin–Tate case. The proof sketch was checked step by step: `(G/H)^n = 1`; `H^s = H` with `s = ψ_(M/K)(n)`, by `φ_(L/M)∘ψ_(L/K) = ψ_(M/K)` | sound |
| Filtered norms | Tau Ceti `map_normUnits_unitFiltration_psiNat_eq_of_upperRamificationGroup_eq_bot` (`Norm/Surjectivity.lean:223`) needs only `G^v = ⊥` for a finite Galois extension | sound |
| Global Herbrand quotients and fixed points | `milne-cft` lines 9379, 9470, 9574, 9583 and 9603: Proposition 2.7 (p. 206), Proposition 3.1 (p. 208), Lemmas 4.1–4.2 (p. 210) and Theorem 4.3 (p. 211). The locator "pp. 206–211" is exact | sound |
| The principal ideal theorem | Artin–Tate is waived. `milne-cft` V Theorems 3.17 and 3.19 (pp. 161, 163) support the statement and the transfer route. Tau Ceti's abstract form (`PrincipalIdeal.lean:67`) uses Mathlib's `MonoidHom.transfer_commutator_eq_one` | statement sound; *Needs* R04 |
| The conductor–discriminant formula | `milne-cft` V Theorem 3.27 and Remark 3.28 (p. 165) state `disc(L/K) = ∏_χ f₀(χ)` with `f(χ) = f(L^{ker χ}/K)`, exactly as the Lean form. Tau Ceti `relDiscr = relNorm (differentIdeal)` (`Discriminant/Basic.lean:33`) | statement sound; *Needs* R04 |

The README flags no locator as unverified.

**Other locators checked in `milne-cft`:**

| Statement | Location in `milne-cft` |
|---|---|
| I Proposition 4.4 and the definition of the absolute filtration | p. 46, lines 2410–2419, with the ceiling convention at line 2379 |
| I 1.9 | p. 23, line 1321 |
| II 3.11 | line 3911 |
| III Lemmas 2.3 and 2.6 | pp. 104–105 |
| III §4, Steps 3–4 and Theorem 4.4 | lines 5068, 5093 and 5111 |
| V Example 3.11 | p. 159 |
| V Example 5.4 | p. 179 |
| VII Theorem 5.1 | p. 212 |
| VII Proposition 7.2, Lemma 7.3, Theorem 8.1, Lemmas 8.4–8.6, Lemmas 9.1–9.4, Theorem 9.5 and Appendix Theorem A.3 | lines 9996–10318 |
| VIII §4, the lcm calculation before Lemma 4.1, and Theorem 4.7 | pp. 240–242 |

Also checked: `kopp-lagarias` Theorems 1.1–1.3 at lines 128, 160 and 174, which cover a general order `O` with level datum `(O; m, Σ)`.

**Adversarial table** (values computed for this head):

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| `localAbsoluteUpperRamificationGroup` | `u = −1`; `u ∈ (−1, 0]` against the floor model; lower-numbering model for `ℚ_2(ζ_8) ⊃ ℚ_2(√2)` at depth 3 | `G_{⌈−1⌉} = G`, so `G_K`. Ceiling gives `G_0`, so trivial at an unramified level of degree `f`, while the floor model gives `ℤ/f`. `G_3 = {1,5}` but `σ_5(√2) = ζ_8⁵ + ζ_8³ = −√2`, and `Gal(ℚ_2(√2))_3 = 1`, so the model is excluded | sound |
| Finite projections | `ℚ_2(ζ_8) → ℚ_2(√2)` at `u = 1.5`, `2.5` | `{1,5}` maps onto `G` (break 2); `1` maps to `1` | sound |
| `map_unitFiltration_normResidue` | `ℚ_p(ζ_p)`, `n = 0, 1`; `ℚ_2(√2)`, `n = 2, 3`; `𝔽_p((t))` with `y^p − y = t⁻¹`, `n = 1, 2`; `K = L`; unramified, `n = 0` | `(ℤ/p)ˣ` of order `p − 1` and `1`. `(5,2)_2 = (−1)^{(25−1)/8} = −1`, so `G`; `1 + 8ℤ_2` consists of norms, so `1`. `G` and `1`. Trivial on both sides. `G_0 = 1` | sound |
| `closure_map_artinMap_unitFiltration` | `n = 0`; `ℚ_2`, `n = 0` against `n = 1` | the closure of the image of the units is the image of inertia. `U^0 = U^1` and the tame abelian quotient has order `q − 1 = 1`, so the two images agree | sound |
| `sup_norm_unitFiltration_eq_of_upper_eq_top` | `K = L`; `r = 0`; `ℚ_2(√2)`, `r = 2, 3`; unramified quadratic | identity; tautology. `N(1+√2) = −1` and `ℤ_2ˣ/(1+4ℤ_2) = {±1}`, so equality; `G^3 ≠ G`. `G^0 = 1 ≠ G`, so the hypothesis fails | sound |
| `conductorExponent_eq_sInf_upperRamificationGroup` (proved) | unramified; `ℚ_5(ζ_5)`; `ℚ_2(√2)`; `ℚ_2(ζ_8)`; Artin–Schreier extension | 0; 1; 3 = 1 + 2; 3 = 1 + 2, with jumps 1 and 2; 2 | sound |
| `algebraMap_vle_algebraMap_iff_of_finite_padic` | `ℚ_2(i)`; `ℚ_p(√p)`; trivial restriction; Schmidt negative controls | normalized `v(2)` is 2 against 1, but both relations put 2 below 1. `v_F(p) = 2v_F(√p) > 0`. A trivial restriction would make `v_F` trivial on `F`, which is algebraic over `ℚ_p`. `ℚ` with `v₂`, `v₃`: not henselian; `ℚ̄`: separably closed | sound; R01 |
| `eulerCharacteristic_finrank_fp` | `ℚ_2` with `𝔽_2`; `ℚ_p` with `𝔽_p`, `p` odd | `3 = 1 + 1 + 1`; `2 = 1 + 0 + 1` | sound |
| Duality Checks | `μ_3` over `ℚ_2`; another coordinate `tr` | `H⁰ = 0`, `H⁰(M′) = 3`, `H²(M) = 3`, `H²(M′) = 1`, `H¹ = 3 = #ℚ_2ˣ/(ℚ_2ˣ)³`. Perfectness is invariant under an automorphism of `ℤ/n` | sound |
| Hilbert symbol Checks | `ℚ_7`, `n = 3`; `n = 2` | invariant `1/3`, coordinate 1, or 2 when negated; `−1 = 1` | sound |
| Cyclotomic aliases | `u = −3` on `μ_16`; `u = −1` over `ℚ_2`; `p = N(1 − ζ_{p^n})` | `(−3)⁻¹ ≡ 5` against 13; `i ↦ −i`; `Art(p)` fixes `μ_{p^∞}` | sound |
| `scd_p_absoluteGaloisGroup_eq_two` | `ℓ = p` and `ℓ ≠ p`; `𝔽_p((t))` | 2 and 2; excluded, since `cd_p = 1` | sound |
| `cyclicHasseNorm`, `card_ideleClassNormQuotient` | `ℚ(i)` with `x = 3` and `x = 5`; `L = K` | 3 is not of the form `a² + b²` and has odd valuation at 3, so neither side holds; `5 = N(2+i)`, so both hold. Index 2 and 1 | sound |
| `hilbertProductFormula` | `(−1,−1)`, `(5,5)`, `(3,7)` over `ℚ` | `1 + 1 = 0`; all invariants 0 (`ε(5)` is even; `(−1/5) = 1`); invariants nonzero at 2 and 7, so `1 + 1 = 0` | sound |
| `isPrincipal_map_hilbertClassField` | `ℚ(√−5)`, `I = (2, 1+√−5)`; `K = ℚ`; `I = 0` | `I² = (2)` and `2 = −i(1+i)²`, so `I𝒪_H = (1+i)`; trivial; `0` | sound |
| `relDiscr_eq_finprod_abelianConductor` | `ℚ(i)`; `ℚ(ζ_5)`; `ℚ(i,√5)`; `K = L` | `(4) = 1·4`; `5³ = 1·5·5·5`; `400 = 1·4·5·20 = 4·5·20`; `(1)` | sound |
| Global Herbrand Check | `ℚ(i)`, `S = {∞, 2}` | local-degree product 4, S-unit quotient 2, `h(C) = 4/2 = 2 = [L:K]` | sound |
| Lifting obstruction | `ℚ(√13,√17)`; `ℚ(√2,√3)` | lcm `2 < 4`; local degree 4 at 2 | sound |
| Hasse norm counterexample 25 | `ℚ(√13,√17)` | `(17/13) = (4/13) = 1`; `8² = 64 ≡ 13 mod 17`; `13 ≡ 5 mod 8`, so 2 is inert; `17 ≡ 1 mod 8`, so 2 splits | sound |
| Layer 6 Frobenius test | `ℚ_2(ζ_5)` | `Art(2)(ζ_5) = ζ_5²`; the geometric normalization gives `ζ_5³`, since `2⁻¹ ≡ 3 mod 5` | sound |
| Layer 12 meet Check | two `D_4` extensions sharing a biquadratic field | the fibre product has order 16 and `[G,G] = ⟨(z,z)⟩`, so the maximal abelian degree is 8, against 4 | sound |
| Layer 11 transfer Check | `C_4 ⊃ ⟨g²⟩`; Klein four | `g ↦ g²`; `x ↦ x² = 1` | sound |
| Layers 2 and 3 examples | unramified degree 6; `C₂` on `ℂˣ` | `2·(1/6) = 1/3` and `1/2 = 3·(1/6)`; `#ℝˣ/ℝ_{>0} = 2` | sound |
| Ring class Checks | `ℚ(√3)`; `ℚ(ζ_7 + ζ_7⁻¹)` | `h = 1` and `h⁺ = 2`, with `N(2+√3) = 1`; Minkowski bound `(6/27)·7 = 14/9 < 2` | sound |
| Layer 8 conductor examples | `U^1⟨2⟩` over `ℚ_2`; `U^1⟨p⟩` | the whole of `Kˣ`, conductor 0; `ℚ_p(ζ_p)`, index `p − 1`, conductor 1 | sound |

**Library declarations opened at the pin.**
- Tau Ceti:
  - `ClassFormation` (`Formation/ClassFormation.lean:94–113`);
  - `conductorExponent_le_iff_upperRamificationGroup_eq_bot` and `conductorExponent_fixedField_ker` (`Local/Conductor/UpperNumbering.lean:121, 130`);
  - `map_restrictNormalHom_upperRamificationGroup` (`Herbrand/UpperQuotient.lean:98`);
  - `AlgHom.valuativeExtension` (`AlgebraicExtension/Basic.lean:314`);
  - `CompactSpace (Field.absoluteGaloisGroup K)` (`AbsoluteGaloisGroup/Basic.lean:374`);
  - `FinitePadicExtension`, which bundles `ValuativeExtension ℚ_[p] K` as a hypothesis (`AbsoluteRamificationIndex.lean:63–71`);
  - `abelianConductor`, defined for any `L/K` from the open norm group (`AdmissibleModulus/Basic.lean:193`);
  - `rayClassField`, `hilbertClassField` and `ringClassField`, each `classField K (globalClassField _)` (`RayClassField.lean:123, 241`; `RingClass/Field.lean:111`);
  - `henselianLocalRing_integer` (`LocalField/Henselian.lean:41`);
  - 56 further README-cited names, each located by file and line, among them `denseRange_artinMap`, `continuous_artinMap` (`Local/ArtinMap.lean:188, 248`), `weilTopology_unique` (`WeilGroup/Topology.lean:141`), `kroneckerWeber` (`ClassFields/KroneckerWeber.lean:178`) and `globalInv_unique` (`Global/ClassFormation.lean:215`);
  - the 43 Layer 5 coefficient, Kummer, Brauer, symbol and duality names.
- Mathlib:
  - `AlgEquiv.restrictNormalHom_surjective` (`FieldTheory/Normal/Basic.lean:233`);
  - `InfiniteGalois.restrictNormalHom_continuous` (`Galois/Profinite.lean:148`);
  - `IsNonarchimedeanLocalField`, a `Prop` class.

**Cross-roadmap citations resolved.**
- On main:
  - ProfiniteCohomology: `coeffMap` in Layer 1; `H1ConjInvariants` in Layer 5; `shapiroIso` in Layer 10 (README lines 225 and 1604); `cd_p_le_scd_p`, `cd_p_le_of_isClosed` and the strict criterion in Layer 11 (lines 1839, 1861 and 1876); `TopPairing`, the cup laws and `degreeCast` in Layer 12. These are the three `citations.md` leads, all roadmap names.
  - RepresentationTheory/ModularInduction: Layer 0 `modRepK0.lift` (line 189), Layer 1 `ind` (line 209), Layer 3 lattice defects (lines 270–281), Layer 4 `modularArtin_exists_nsmul_mem_indCyclicCoprime` (line 338).
  - Completed: ProfiniteProPGroups (the two `cd_p` names), NumberFieldArithmetic (`artinHomAway`, `artinHomAway_apply_prime`, `IsArithFrobAt`) and GlobalNumberFields (`NumberFieldOrder`, `Pic`, `narrowModulus`, `Modulus.one`, `ker_rayClassQuotient`).
- Open heads:
  - #1410 `810f37f`, lines 123–131: Layer 7 owns the local-field absolute filtration, and §4a.1 proves agreement.
  - #1474 `b6f153b`, lines 1119–1126.
  - #940 `32476ef`, lines 34 and 120: consumes `map_unitFiltration_normResidue` and `conductorExponent_eq_sInf_upperRamificationGroup`.
  - #856 `00e8930`, lines 126 and 2761: `artinMap` and `characterConductorExp`.
  - #879 `9856719`, line 1633: the cyclotomic normalization.
  - #1692 line 26 and #1484 lines 44 and 240: §2.6 maps to *Frobenius convention*.
  - #999 line 209: §2.4 resolves; Layer 0 item 4 does not (R03).

**Overlaps.**
- #617 and #1215 both revise this roadmap and conflict with it. The description gives the rebase rule.
- #617's revision states the missing Schmidt target (R01).
- `localAbsoluteUpperRamificationGroup` occurs only here and in #1215, which is a revision of this file.
- Ownership against the open pull requests was checked on the listed sibling heads and with `roadmaps grep`. For the absolute upper filtration, #856 and #940 consume it through RamificationOfCompleteDiscretelyValuedFields §4a.1, which consumes Layer 7. Nobody else owns F. K. Schmidt's theorem: #1813 is new and later in the order.

**Remark, owned by the IntegralLattices review:** this head no longer merges cleanly with main. `git merge-tree` reports a conflict in `TauCetiRoadmap/IntegralLattices/Suggested.lean`. Main's rewrite of that file (#1239) no longer mentions ClassFieldTheory, so the rebase drops those hunks. ClassFieldTheory's consumers, LocalGaloisGroups, GlobalQuadraticForms and QuadraticFormInvariants, are unchanged on main since the merge base.

## Not verifiable

These texts are paywalled, waived or not held in the sources cache. Each has its status in the manifest, and the cache holds no text for any of them.

- `serre-local-fields` (uncertified): XV §2 Theorem 2 and Corollary 3 to Theorem 1; V §§3, 6; VI §3; IX §§3–5; IV §4. They are checked here by computation only.
- `neukirch-ant` (uncertified): VII §11.
- `nsw` (uncertified): (3.3.4), (7.1.8), (7.2.5), (7.2.6) and (7.3.1)–(7.3.4).
- `artin-tate` (waived): XIII §4 and XIV.
- Engler–Prestel §4.4: not in the manifest. It is reached through `jahnke-koenigsmann` Theorem 2.1, which cites it as Theorem 4.4.1.
- Not in the manifest or the cache:
  - Tate 1952 and Nakayama 1957;
  - Rim 1959, Brown VI §8 and Lang III 7.1;
  - Cox §7;
  - Tate's Corvallis article and Weil 1951;
  - Serre's *Galois Cohomology* II §5.3 and *A Course in Arithmetic* III;
  - Cassels–Fröhlich.

## Source issues

- none
