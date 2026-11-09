# Review of ClassFieldTheory (pull request #1411 at 0333060)

**Verdict:** needs changes

This is a full review of the head. The folder changed by 964 lines since `656f837`. The gate fails only on `outside-folder` (R03). There are 5 findings: one P2 and four P3. Of the previous review's 14 findings, 10 are repaired, 1 is repaired except for one item that I withdraw, and 3 are not repaired (list after the findings).

## R01 (P2) — FunctionFieldArithmetic still states and proves unit-filtration reciprocity itself (previous R02, not repaired)

**Location:** `TauCetiRoadmap/ClassFieldTheory/README.md:147–149`: "Unit-filtration reciprocity (Layer 7) is this roadmap's in both characteristics, since its proof uses finite reciprocity and filtered norms only, and `FunctionFieldArithmetic` consumes it". The same claim is at lines 2304–2306.

**Claim:** At #1474's head (`c5d655e`), FunctionFieldArithmetic §4.2 does not consume Layer 7. It states the equal-characteristic equality, and its absolute form, as part of its own target `lubinTate_artin`, and it proves both by its own Lubin–Tate route. So the object has two owners, and this README's "consumes it" is false at that head. ClassFieldTheory is on main and is therefore the earlier owner.

**Witness:** #1474, `TauCetiRoadmap/FunctionFieldArithmetic/README.md:1116–1121`: for every finite abelian `L/K` in equal characteristic and every `r ≥ 0`, `Art_{L/K}(U_K^(r)) = Gal(L/K)^r`, and the same for abelian algebraic `E/K`. The proof is at lines 1140–1150.

**Repair:**
1. In #1474 §4.2, replace lines 1116–1121 and the proof paragraph at lines 1140–1150 by a citation of ClassFieldTheory Layer 7 (`map_unitFiltration_normResidue`, `closure_map_artinMap_unitFiltration`). Keep the other clauses of `lubinTate_artin`.
2. Name #1474 in this pull request's merge-order paragraph as merging after it (see R02).

Tested on the instance: over `𝔽_p((t))` with `y^p − y = t⁻¹` (break 1), both statements give `Art(U^(1)) = G` and `Art(U^(2)) = 1`, so deleting #1474's copy loses nothing.

## R02 (P3) — The description's merge order runs the wrong way, and there is still no order with #617 and #1215 (previous R10, not repaired)

**Location:** the pull request description:
- "**Merge order.** #1410 → this PR", and the `depends-on` entry "#1410 RamificationOfCompleteDiscretelyValuedFields";
- "LocalFieldsRamification as amended by #1410 (its §4a.1 absolute closure …)";
- "the absolute form is a README target because the absolute upper filtration is missing at the pins".

**Claim:**
- This head cites nothing from #1410: the dependency check reports 0 problems, and README lines 137–144 say that Layer 7 takes nothing from it.
- The supply now runs the other way. #1410 cites Layer 7's local-field absolute upper filtration, which exists only in this pull request. The stated order therefore makes each pull request wait for the other.
- The absolute form is stated in `Suggested.lean:822`.
- #617 and #1215 still conflict with this head, and no order is stated. #1215 also renames this pull request's targets.

**Witness:**
- #1410, `RamificationOfCompleteDiscretelyValuedFields/README.md:113–116`: the local-field absolute upper filtration "is ClassFieldTheory Layer 7's. ClassFieldTheory precedes this roadmap".
- #1215, `ClassFieldTheory/README.md:1259–1261`: the finite-level and absolute targets are renamed `normResidue_map_unitFiltration` and `closure_map_artinMap_unitFiltration_eq_upper`.

**Repair:** Rewrite the description:
1. Drop #1410 from `depends-on`. Write "Merge order: this PR → #1410 (RamificationOfCompleteDiscretelyValuedFields §4a.1 consumes Layer 7's absolute upper filtration) and → #1474 (R01)".
2. State which of #617, #1215 and #1411 is rebased onto which. Because #1215 changes the same Layer 7 targets under other names, say which names survive.
3. Replace the "Dependencies" sentence with "Mathlib and Tau Ceti at the pins; no roadmap supplier beyond those on main".
4. Say that the absolute form is stated in `Suggested.lean`.

## R03 (P3) — Gate `outside-folder`: `Completed/LocalGaloisGroups/Suggested.lean` (previous R03, not repaired)

**Location:** `Completed/LocalGaloisGroups/Suggested.lean:326` and `:485`, the only two edited lines.

**Claim:** The pull request edits a folder that the brief does not list as one of its own. The edit is forced. The consumer adapts to this roadmap's canonical `h2MuEquivZMod_mixed`, which replaces a `Nonempty`, and to `h2FpEquivZMod_of_mu`, which now takes the coefficient isomorphism directly.

**Witness:**
- The worker's gate reports `outside-folder: Completed/LocalGaloisGroups/Suggested.lean`; my run reports the same.
- A scratch copy of that file elaborates against this head (exit 0, only its own `sorry` and linter warnings).

**Repair:**
1. Keep the two lines.
2. Name `Completed/LocalGaloisGroups` in the description as one of this pull request's folders, as IntegralLattices and QuadraticFormInvariants already are, so that the board records it.

## R04 (P3) — Layer 7 owns `G_K^u` but gives it no name; the headline takes it as a free subgroup

**Location:**
- `README.md:1379–1381`: "It has no Lean name of its own: `closure_map_artinMap_unitFiltration` takes it as an argument together with this membership description."
- The same wording is at lines 1433–1436.
- `Suggested.lean:822–828` takes `(absoluteUpperRamificationGroup : Subgroup …)` and `_habs`.

**Claim:** Scope item 6 (lines 94–96) makes the absolute upper ramification group this roadmap's object, and RamificationOfCompleteDiscretelyValuedFields §4a.1 consumes it. A consumed object needs a name. The house rule is that a definition a headline needs is made, with a real body. The current form is equivalent (probe P2 below), but it leaves the owned object unnamed, and #1215 already names it. Separately, the finite-projection *Needs* (lines 1398–1402) omits the relative valuative structure between two levels, which Herbrand's theorem takes as instance arguments.

**Witness:**
- #1215, `ClassFieldTheory/Suggested.lean:109`, defines `localAbsoluteUpperRamificationGroup` by `⨅ M, (upperRamificationGroup K M v).comap (AlgEquiv.restrictNormalHom M)`.
- Tau Ceti's `map_restrictNormalHom_upperRamificationGroup` (`Herbrand/UpperQuotient.lean:85–92`) assumes `[ValuativeExtension L M] [IsScalarTower K L M]`.

**Repair:**
1. In `Suggested.lean`, section `AbsoluteUpper`, add this definition:
   ```lean
   noncomputable def localAbsoluteUpperRamificationGroup
       (v : TauCeti.LocalFieldsRamification.RamificationIndexDomain) :
       Subgroup (Field.absoluteGaloisGroup K) :=
     ⨅ M : FiniteGaloisIntermediateField K (AlgebraicClosure K),
       (TauCeti.LocalFieldsRamification.upperRamificationGroup K M v).comap
         (AlgEquiv.restrictNormalHom (F := K) (K₁ := AlgebraicClosure K) M)
   ```
2. Restate `closure_map_artinMap_unitFiltration (n : ℕ)` with right-hand side `(localAbsoluteUpperRamificationGroup K ⟨n, Nat.cast_mem_ramificationIndexDomain n⟩).map (QuotientGroup.mk' …)`, and drop the subgroup argument and `_habs`.
3. In the README, replace both "no Lean name" passages by "`localAbsoluteUpperRamificationGroup K u`". The name is #1215's, which eases the rebase of R02.
4. Add Tau Ceti's `AlgHom.valuativeExtension` (`LocalField/AlgebraicExtension/Basic.lean`) to the finite-projection *Needs*, for the structure of `M′` over `M`.

Tested (probe P2, exit 0):
- the definition and the restated headline elaborate, with one `sorry`;
- the head's statement follows from the new one by `ext σ; rw [_habs]; simp only [localAbsoluteUpperRamificationGroup, Subgroup.mem_iInf]; exact Iff.rfl`;
- the named group satisfies the head's membership description.

## R05 (P3) — Stale "alias" wording, and one Lean name that the README never mentions

**Location:**
1. `README.md:486`: "the roadmap names are reducible aliases".
2. `README.md:1704`: "`ideleFormation` and `globalFormation` are reducible aliases of its formations".
3. `README.md:1829–1830`: "`ideleToClassH2` and `classToMultiplicativeH3` are reducible aliases of Tau Ceti's arithmetic quotient and connecting maps".
4. `Suggested.lean:219`, `abbrev RatModInt`.
5. `Suggested.lean:57`, the module title.

**Claim:**
- After the pruning, the roadmap names `tateIso`, `unitsFormation` and `localClassFormation` are Tau Ceti's own names, with no alias in `Suggested.lean`.
- The four maps of items 2 and 3 are Tau Ceti's own `def`s, not aliases of anything.
- `RatModInt` is the one declaration of `Suggested.lean` that the README never names.
- The module title is not of the form "<title>: target signatures".

**Witness:**
- Tau Ceti `Global/Formation.lean:83,105` and `Global/LiftingObstruction.lean:245,265` define the four maps directly.
- `Suggested.lean` declares none of them.
- `grep RatModInt` on the README has 0 hits.

**Repair:**
1. Line 486: replace the clause with "consumed under Tau Ceti's names; `Suggested.lean` keeps `tateTheorem`, `ClassFormation.artinMap`, `localArtinMap` and `normResidue` under this roadmap's names".
2. Line 1704: write "`ideleFormation` and `globalFormation` are Tau Ceti's formations".
3. Lines 1829–1830: write "are Tau Ceti's arithmetic quotient and connecting maps".
4. At line 232, write "`ℚ/ℤ` the rational circle `AddCircle (1 : ℚ)` (`RatModInt`)".
5. Retitle the module docstring "Class field theory: target signatures".

## Previous findings (review of `656f837`)

- **R01 (UPWARD edge to #1410):** repaired.
  - Layer 7 now defines the local-field absolute upper filtration itself (lines 137–144, 1369–1420).
  - The dependency check reports 0 problems.
  - The resulting sequencing change is R02.
- **R02 (#1474 second owner):** not repaired; this report's R01.
- **R03 (`outside-folder`):** not repaired; this report's R03.
- **R04 (`tex`):** repaired. The gate reports `tex=0`, and line 838 holds the whole span.
- **R05 (padding):** repaired.
  - The 47 aliases and `ringClassField_maximal` are gone, and the README lines 557–573 and 658–661 are reworded.
  - Every remaining closed declaration is used by a consumer's Lean file or README, or is needed for a type (`RatModInt`, the two `Fact` instances).
  - `conductorExponent_eq_sInf_upperRamificationGroup` stays because PadicPeriodRings (#940) names it in its README line 33.
- **R06 (`sorryAx` in two aliases):** repaired; see README lines 562–564 and `Suggested.lean:64–66`.
- **R07 (`_htr`):** repaired. The hypothesis is dropped, and README lines 1447–1448 explain why.
- **R08 (`principalIdele`):** repaired.
  - It is now `abbrev … := NumberField.IdeleGroup.unitEmbedding (𝓞 F) F` (`Suggested.lean:905–907`).
  - The supplier row (line 498) names it.
- **R09 (dropped §2.4–§2.6):** repaired. The old → new lines are at lines 192–197.
- **R10 (description):** not repaired, and the order is now reversed; this report's R02.
- **R11 (duality Check):** repaired. Lines 1140–1152 give the values 1 and 3 and add two further Checks; the values are recomputed in the table.
- **R12 (exit criteria):** repaired; see lines 1154–1156 and 1517–1519.
- **R13 (locators):** items 1 and 3 are repaired (lines 513 and 1594). I withdraw item 2: ProfiniteCohomology's inventory on main (its README line 228) lists `cup_add_left` under Layer 12, so "Layer 12" at line 512 is correct.
- **R14 (`## Downstream consumers`):** repaired; the section is at line 2274.

## Verified sound

**Gate.**
- My run reports `outside-folder=3 … FAIL`, with every other count 0. Two of the three entries are this pull request's own folders, IntegralLattices and QuadraticFormInvariants; the third is R03.
- The worker's run (with `build`) reports only `outside-folder=1`.

**Elaboration.**
- `lake env lean` on `Suggested.lean` exits 0 in 15 s. The only warnings are 6 `sorry`s, at lines 593, 769, 782, 822, 975 and 985.
- A copy of `Completed/LocalGaloisGroups/Suggested.lean` exits 0. Besides its own `sorry`s, its only warnings are 4 linter warnings of its own.

**Dependency check** (`--movable`):
```text
depcheck: 238 roadmaps, 2325 edges, 0 problem(s)
```

**Signatures.** I compared the 70 elaborated types in `signatures.md` with the README.
- The 2 flagged declarations, `restrictAbsolute` and `absoluteGaloisGroupExtend`, drop only local-field instances, which their Galois-theoretic bodies do not use.
- The 6 open targets keep every binder that their README statements need: both local fields with `ValuativeExtension` and `IsAbelianGalois`; `NumberField` on both fields for `relDiscr_eq_finprod_abelianConductor`.
- The tool's error "line 1102: Unknown identifier `…field`" comes from its own scratch file; `Suggested.lean` has 1049 lines.

**Probes.** All were run as scratch files with `lake env lean`.

| Probe | Result |
|---|---|
| P1: one tactic (`rfl`, `simp`, `infer_instance`, `exact?`) on the 6 open targets | none closes. `exact?` fails on 5 targets, and on `sup_norm_…` it hits the heartbeat limit, so none of them is padding |
| P2: the named `localAbsoluteUpperRamificationGroup`, with the restated headline | exit 0, one `sorry`; the head's form follows, and its `_habs` is satisfiable (R04) |
| P3: the gate on a scratch clone without the docstring name list (lines 150–202) | `readme-ids-missing=10`, all Tau Ceti names such as `artinMap_congr` and `localArtinMap_quadratic_eq_hilbertSymbol`. The list is gate-forced, so I do not ask for its deletion |
| P4: `Completed/LocalGaloisGroups/Suggested.lean` | exit 0 against this head |

**Names checked at the pin.**
- 149 backticked tokens of the sampled sections (Layer 5 lines 931–1136, Layer 7 lines 1357–1520, Layer 10 lines 1754–1782, Layer 13 lines 2121–2131) resolve to Tau Ceti, Mathlib or this file. The exceptions are notation, roadmap names and ModularInduction's `modRepK0`.
- The 36 names of the exit criteria and the minimal test suite (lines 585–589) all exist in Tau Ceti's `NumberTheory/ClassFieldTheory/`.
- All 69 declarations of `Suggested.lean` occur in the README, except `RatModInt` (R05).

**Library declarations opened at the pin.**
- `LocalFieldsRamification.map_restrictNormalHom_upperRamificationGroup` (`LocalField/Herbrand/UpperQuotient.lean:98`), and its hypotheses at lines 85–92 (R04).
- `finiteIntermediateFieldValuativeRel`, `…Topology`, `…_valuativeExtension` and `…_isNonarchimedeanLocalField` (`LocalField/FiniteExtension/IntermediateField.lean:69, 75, 81, 97`).
- `CompactSpace (Field.absoluteGaloisGroup K)` (`FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean:374`).
- Mathlib's `InfiniteGalois.restrictNormalHom_continuous` (`FieldTheory/Galois/Profinite.lean:148`).
- `RamificationIndexDomain = Set.Ici (−1)` (`LocalField/RamificationGroup.lean:86`) and `lowerRamificationGroupReal_def`, which takes the ceiling (`:282`); this matches `milne-cft` line 2379. `upperRamificationGroup` is at `Herbrand/Basic.lean:421`.
- In `Local/Conductor/UpperNumbering.lean`:
  - `unitFiltration_le_normGroup_iff_upperRamificationGroup_eq_bot` (`:64`);
  - `conductorExponent_le_iff_upperRamificationGroup_eq_bot` (`:121`);
  - `conductorExponent_fixedField_ker` (`:130`).
- `abelianConductor` (`Global/AdmissibleModulus/Basic.lean:193`): the conductor of the idele-class norm group, with no hypothesis on the extension.
- `IsSmoothDiscrete` (`ContCohomology/SmoothDiscrete/Basic.lean:259`): a discrete carrier with open stabilizers, as Layer 5 says.
- `tateDual` (`Local/Duality/Basic.lean:97`): `ofDiscreteModule` of `InternalHom`.
- `AlgHom.valuativeExtension` (`AlgebraicExtension/Basic.lean:314`) and `algebraicExtension_valuativeExtension_tower` (`AlgebraicExtension/Tower.lean:72`). Both assume or construct the relation, so `algebraMap_vle_algebraMap_iff_of_finite_padic` is genuinely open.
- `artinHomAway`, `idealsAway`, `IsArithFrobAt`, `finsum_artinConductorExponent_eq_discriminantExponent`, `ker_rayClassQuotient` and `narrowModulus` exist.

**Cross-roadmap citations resolved.**
- ProfiniteCohomology on main, from its inventory rows 218–234:
  - `H1ConjInvariants` is Layer 5;
  - `longExact_exact`, `corestriction_comp_res`, `corestriction_mackey` and `shapiroIso` are Layer 10;
  - `cd_p_le_of_isClosed`, `cd_p_le_scd_p` and the strict criterion are Layer 11 (lines 1839–1884);
  - `cup_add_left`, `cup_coeffMap` and `cup_gradedComm` are Layer 12 (row 228);
  - `degreeCast` is Layer 12 (line 1346).
- ProfiniteProPGroups (completed): lines 94 and 1266.
- ModularInduction on main:
  - `modRepK0.lift` is Layer 0 (line 189);
  - `ind` is Layer 1 (line 210);
  - the three lattice defects are Layer 3 (lines 270, 277 and 281);
  - `modularArtin_exists_nsmul_mem_indCyclicCoprime` is Layer 4 (line 338).
- RamificationOfCompleteDiscretelyValuedFields at #1410's head, README lines 113–120 and 4a.1: it defers the local-field filtration to Layer 7 and proves the agreement there. This matches README lines 137–144 and 2311–2314.
- PadicPeriodRings at #940's head, README line 33, and LocalAnabelianGeometry at #1811's head, README line 145, consume the Layer 7 names as stated.
- The three `citations.md` leads are ProfiniteCohomology and ProfiniteProPGroups names on main.

**Sources checked at their locators.**
- `milne-cft`, I §4, printed p. 46:
  - line 2379, the ceiling convention;
  - line 2410, Proposition 4.4 (Herbrand);
  - lines 2415–2419, the filtration of an infinite Galois extension.

  This supports "The absolute upper ramification groups" as written.
- `milne-cft`, III Lemmas 2.3–2.6, lines 4716–4753, printed pp. 104–105. Lemma 2.4 is proved in characteristic 0, with characteristic `p` referred to Serre; the README's `1 + A` argument and its Cassels–Fröhlich reference cover both characteristics.
- `milne-cft`, VII:
  - Proposition 2.7 (line 9379) and Proposition 3.1 (line 9470);
  - Lemmas 4.1–4.2 (lines 9574 and 9583);
  - Theorem 4.3 (line 9603);
  - printed pp. 206–211, as "Global Herbrand quotients" cites.
- `milne-adt`, I Theorem 2.8 (line 1227): `χ(G, M) = (R : mR)⁻¹` for `#M` prime to the characteristic of `K`. This is the factor `p^{[F:ℚ_p] v_p(#A)}`.

**Adversarial table.** Rows cover the sampled targets, the headlines and every target a finding touches.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Exit criteria of Layers 0–2 ("met by Tau Ceti") | the names at the pin | `tateTheorem` and `tateIso` (Tate/Theorem.lean); `nakayamaNegTwo` and `artinEquiv` (ArtinMap.lean); `cupClass`, `cohomologyRes`, `cohomologyCor`, `h1_subgroupLayer`, `card_H2_subgroupLayer`, `fundamentalClass_restrict_generates` all present | met | none |
| Layer 3 exit criterion and Examples | `C₂` on `ℂˣ`; `C₂` trivially on `ℤ/2` | `H¹ = 0`, `#H² = #ℝˣ/ℝ_{>0} = 2 = #C₂^ab`; `H¹ = Hom(C₂, ℤ/2) = ℤ/2 ≠ 0` | sound | none |
| The coefficient objects | `μ_3` over `ℚ_7` and over `ℚ_2`; `n = 0` | `7 ≡ 1 (mod 3)`: trivial; `2 ≡ −1`: nontrivial; `kummerCupPairing` at `n = 0` is the zero pairing (Lean lines 525–529) | sound | none |
| Local units and the `H²` bound | `L = K`; cyclic of degree `m`; an infinite group | `1 ∣ 1`; `m ∣ m`; `Nat.card = 0` and `0 ∤ m` | sound | none |
| The Hilbert symbol | `ℚ_7`, `n = 3`, unramified cubic, `π = 7`; `ℚ_2` with `(−1,−1)`; odd `p` with units | invariant `1/3`, coordinate 1, or 2 when negated; `x² + y² = −1` has no solution in `ℚ_2`, so the symbol is 1; 0 | sound | none |
| The Tate dual | `A = μ_3` over `ℚ_2` | Frobenius inverts both `A` and `μ_3`, so `(F·φ)(a) = φ(a)` and `A' = ℤ/3` is trivial | sound | none |
| Smoothness | the fields of `IsSmoothDiscrete`; over `ℚ` | discrete carrier and open stabilizers at the pin; a non-open subgroup of index 2 in `G_ℚ` gives a discrete `ℤ/2` that is not smooth | sound | none |
| Local duality and the Euler characteristic | `ℚ_p` (odd `p`) with `𝔽_p`; `ℚ_2` with `𝔽_2`; `ℚ_2` with `μ_3` and its dual; over `ℚ` | `p² = p·1·p`; `8 = 2·2·2`; `#H⁰ = 1, 3`, `#H² = 3, 1`, `#H¹ = 3 = 1·3·1 = 3·1·1`; `H¹(G_ℚ, ℤ/2)` is infinite | sound | none |
| `eulerCharacteristic_finrank_fp` | `ℚ_2` with `𝔽_2` | `3 = 1 + 1 + 1·1` | sound | none |
| `algebraMap_vle_algebraMap_iff_of_finite_padic` | `ℚ_p(√p)`; the trivial valuation; a restriction with `v(p) < 0` | `v_F(p) = 2v_F(√p) > 0`; excluded by `IsNontrivial`; `v(1+p) = v(p) < 0` contradicts `1 + p ∈ ℤ_pˣ` | sound and open (P1) | none |
| Conductors, and `conductorExponent_eq_sInf_upperRamificationGroup` | unramified; `ℚ_5(ζ_5)`; `ℚ_2(√2)`; `ℚ_2(ζ_8)` | 0; 1; 3; 3 on both sides, equal to `1 +` the largest upper jump (0, 2, 2) | sound | none |
| The absolute upper ramification groups (definition and Checks) | `u = −1`; `u ∈ (−1, 0]` at the unramified level of degree `f`; `ℚ_2(ζ_8)` over `ℚ_2(√2)` | `G_K`; trivial image against `ℤ/f` (floor would give `G_K`); upper groups `G`, `{1,5}`, `1` on `u ≤ 1`, `1 < u ≤ 2`, `u > 2`; `σ_5(√2) = −√2`, so `{1,5}` maps onto `Gal(ℚ_2(√2)/ℚ_2)^u` for `u ≤ 2` | sound | R04 (name) |
| The lower numbering as the wrong model | depth 3 | `G_3 = {1,5}` for `ℚ_2(ζ_8)`, while the depth-3 lower group of `ℚ_2(√2)` is trivial | excluded | none |
| The proof of the finite projections | levels `M ⊆ M′` | Herbrand needs `ValuativeExtension M M′` and `IsScalarTower K M M′` (UpperQuotient.lean lines 85–92) | sound, with an unnamed input | R04 |
| `map_unitFiltration_normResidue` | `L = K`; unramified; `ℚ_p(ζ_p)` at `n = 0, 1`; `ℚ_2(√2)` at `n = 2, 3`; `𝔽_p((t))` at `n = 1, 2` | 1; 1; `G`, 1; `G`, 1 (`(5,2)_2 = −1`, and `1 + 8ℤ_2` consists of norms); `G`, 1 | sound | none |
| The proof route: `H = G^n`, `M = L^H`, `s = ψ_{M/K}(n)` | general | `(G/H)^n = G^nH/H = 1`; `H^s = G_{ψ_{L/K}(n)} ∩ H = H`; `Art(U_K^n) = Art_{L/M}(U_M^s) = H` | sound | none |
| `sup_norm_unitFiltration_eq_of_upper_eq_top` | `ℚ_2(√2)` at `r = 2` and `r = 3`; `L = K` | `N(1+√2) = −1` and `{±1}·(1 + 4ℤ_2) = ℤ_2ˣ`; `G^3 = 1 ≠ G`, so the hypothesis fails; `U_K = U_K` | sound | none |
| `closure_map_artinMap_unitFiltration` | `n = 0`; `_habs` | the closure of `Art(𝒪ˣ)` is the image of inertia, trivial in every unramified quotient; the named group satisfies `_habs` (P2) | sound | R04 |
| The filtered-norm Check `ℚ_2(∛2, ζ_3)` | tame, `e = 3`, `f = 2` | `φ(u) = u/3`, `ψ(1) = 3`, `G^1 = 1` | sound | none |
| Global Herbrand quotients and fixed points | `ℚ(i)` with `S = {∞, 2}`; `L = K` | `2·2 = 4`, `h(U) = 4/2 = 2`, `h(C) = 4/2 = 2 = [L:K]`; 1 | sound | none |
| The lifting obstruction | `ℚ(√13, √17)`; `ℚ(√2, √3)` | `(17/13) = (4/13) = 1`, lcm `2 < 4`; 2, 3 and 6 are nonsquares in `ℚ_2`, lcm 4 | sound | none |
| `relDiscr_eq_finprod_abelianConductor` | `L = K`; `ℚ(i)`; `ℚ(ζ_5)`; `ℚ(i, √5)` | `⊤` against a product of one trivial conductor; `(4) = 1·(4)`; `5³ = 1·5·5·5`; `400 = 1·4·5·20` | sound | none |
| `isPrincipal_map_hilbertClassField` | `K = ℚ`; `ℚ(√−5)` with `I = (2, 1+√−5)`; `I = 0` | `H = ℚ`; `I² = (2)`, `2 = −i(1+i)²` and `N_{H/K}(1+i) = 2`, so `I𝒪_H = (1+i)`; 0 | sound | none |
| `card_ideleClassNormQuotient`, `cyclicHasseNorm` | `ℚ(i)` with `x = 3` and `x = 5`; `L = K` | index 2; 3 is no local norm at 3 (`v_3` odd, 3 inert); `5 = N(2+i)`; index 1 | sound | none |
| `hilbertProductFormula` | over `ℚ`: `(−1,−1)`, `(5,5)`, `(3,7)` | `1 + 1 = 0`; all 0 (`ε(5) = 2`, `(−1/5) = 1`); nonzero exactly at 2 and 7 (`(3/7) = −1`, `ε(3)ε(7) = 3`), and `1 + 1 = 0` | sound | none |
| `cyclotomicCharacter_artinMap` | `ℚ_2`: `u = −1` on `μ_4`; `u = −3` on `μ_16` | `i ↦ −i`; `(−3)·5 ≡ 1 (mod 16)`, so 5, against 13 without the inverse | sound | none |
| `scd_p_absoluteGaloisGroup_eq_two` | `K/ℚ_p`; `𝔽_p((t))` | 2; `cd_p = 1`, excluded by `[Algebra ℚ_[p] K]` | sound | none |
| The Layer 13 ring-class Checks | `ℚ(√3)`; `ℚ(ζ_7 + ζ_7⁻¹)` | `N(2+√3) = 1`, `h = 1`, `h⁺ = 2`; `(3!/27)·7 = 14/9 < 2` | sound | none |
| The ownership of unit-filtration reciprocity | `𝔽_p((t))`, `y^p − y = t⁻¹` | #1474 lines 1116–1121 and Layer 7 both give `Art(U^(1)) = G` and `Art(U^(2)) = 1` | two owners | R01 |
| The "alias" claims | `ideleFormation`, `ideleToClassH2` | plain `def`s (Formation.lean:83, LiftingObstruction.lean:245); 0 declarations in `Suggested.lean` | stale | R05 |

**Ownership against open work.**
- I searched by object ("absolute upper", the unit-filtration names, the conductor corollary) over main, the board packages and the 468 open heads, with `roadmaps grep`, `roadmaps show` and the sibling checkouts.
- On the absolute upper filtration:
  - ArithmeticGaloisRepresentations (#856), FiniteFlatGroupsAndIntegralPadicHodgeTheory (#879), FilteredLocalGaloisGroups (#1795), FieldOfNorms (#1812) and PadicPeriodRings (#940) consume RamificationOfCompleteDiscretelyValuedFields §4a.1.
  - That roadmap defers the local-field case to Layer 7.
  - #1215 is a revision of this same roadmap (R02).
- The only second owner from another roadmap is #1474 (R01).

## Not verifiable

- **Serre, *Local Fields*** (`serre-local-fields`, uncertified, paywalled): XV §2 Theorem 2 and Corollary 3 to Theorem 1, V §§3 and 6, VI §3, IV §§3–4, and IX §§3–5. Its IV §3 Proposition 14 is reached only through `milne-cft` line 2414.
- **Neukirch, *Algebraic Number Theory*** (`neukirch-ant`, uncertified): VII §11. The conductor–discriminant formula was checked by computation only (table).
- **Neukirch, Schmidt and Wingberg** (`nsw`, uncertified): (3.3.4), (7.1.8), (7.2.5) and (7.3.1)–(7.3.4).
- **Artin–Tate** (`artin-tate`, waived): XIII §4, XIV, and Preliminaries §2, Theorem A.
- **Not in the manifest or the sources cache** (publisher pages are paywalled):
  - Engler–Prestel §4.4 (F. K. Schmidt); its content is checked in the table;
  - Tate 1952 and Nakayama 1957;
  - Rim 1959, Brown and Lang;
  - Cox, Proposition 7.22;
  - Tate's Corvallis article and Weil 1951;
  - Serre's *Galois Cohomology* and *A Course in Arithmetic*;
  - Serre's and Tate's chapters in Cassels–Fröhlich.

## Source issues

- none
