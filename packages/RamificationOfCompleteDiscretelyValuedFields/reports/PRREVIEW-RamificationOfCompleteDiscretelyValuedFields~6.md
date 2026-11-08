# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at 6260b60)

**Verdict:** needs changes

This is a full review: the folder changed by 220 lines since 31cd051. The pins are unchanged (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b).

- **Gate.** Rerun at this head: every check passes.
- **Dependency check.** `depcheck: 238 roadmaps, 2343 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- **Elaboration.** `lake env lean` of `TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/Suggested.lean` exits 0 with four `declaration uses sorry` warnings (lines 61, 110, 129, 150) and nothing else.
- **Outside the folder.** `git diff --stat origin/main...HEAD` lists nothing outside the folder.
- **Gaps.** There is no `design/plan.json`, so no gaps are declared.

All three findings are P3. None is blocking.

## Previous findings (review at 31cd051)

- **R01 (P2), Herbrand's quotient theorem and tower transitivity: repaired.**
  - `Suggested.lean` lines 80–98 define `herbrandFun`, `inverseHerbrandFun` and `upperRamificationGroup` with real bodies.
  - Lines 110–139 state `upperRamificationGroup_quotient_eq_map` and `herbrandFun_tower`, each with the `IsLocalRing (FixedPoints.subalgebra A B H)` binder.
  - The docstring (lines 17–20) now reads "Stated here: … the Herbrand function, its inverse and the upper numbering …, with Herbrand's quotient theorem and tower transitivity".
  - README lines 207–214 are timeless.
- **R02 (P3), group labels defined only by the open LocalFieldsRamification revision: not repaired.** README lines 26–29 are unchanged, and the description's merge-order paragraph still reads "No other pull request of ours precedes it". This is raised again as R03 below, with a repair that stays inside the folder.
- **R03 (P3), `TauCeti.inertiaSubgroup` in the residue-finiteness-free carrier list: repaired.** README lines 134–142 end the carrier list at `TauCeti.IsDiscreteValuationRing.exists_adjoin_eq_top`. They move `TauCeti.inertiaSubgroup` to "Tau Ceti's local-field declarations … these assume `IsNonarchimedeanLocalField`".
- **R04 (P3), component-group theory cited to a text that does not prove it: repaired.** README lines 514–524 cite *Groupes proalgébriques* at five numbered paragraphs, and the manifest records `serre1960`. All five locators check out against `serre1960` (see Sources).

## R01 (P3) — The Scope claims ownership of results the pinned libraries already prove on the same carrier

**Location.** README lines 37–41: "This roadmap owns … the formula `[L : K] = ef`, integral monogenicity and the computation of the lower index at a generator; the normality, antitonicity and eventual triviality of the lower groups `G_i` …, the subgroup formula". §3a.1 (lines 253–260) restates them as results to prove.

**Claim.** Each of these is already at the pins, on Tau Ceti's local-ring carrier or Mathlib's, with no completeness and no residue finiteness. The README contradicts itself here: §3a.1 (lines 274–277) says that monogenicity and the lower index "are the pinned … and are not restated", while the Scope lists them as owned. The brief's rule is that what exists at the pins is cited and deferred in the Scope, not owned.

**Witness.**
- Tau Ceti, `RingTheory/LocalRing/RamificationGroup.lean`:
  - line 166: `ramificationGroup_eq_top_of_le_neg_one`;
  - line 183: `ramificationGroup_antitone`;
  - line 220: `instNormalRamificationGroup`;
  - line 233: `ramificationGroup_zero_eq_ker_toRingAut`;
  - line 325: `exists_forall_ramificationGroup_eq_bot`;
  - line 444: `lowerIndex_eq_addVal_of_adjoin_singleton_eq_top`;
  - line 561: `subgroupOf_ramificationGroup`.
- Tau Ceti, `RingTheory/DiscreteValuationRing/Monogenic.lean:70`.
- Mathlib, `Ideal.sum_ramification_inertia_eq_card` (`RingTheory/RamificationInertia/Basic.lean:82`).

**Repair.**
1. In the Scope's 3a bullet, keep as owned only what is new:
   - `B` as a complete discrete valuation ring, free over `A`, with the unique prolongation;
   - the graded embeddings on the general carrier and their consequences;
   - Hilbert's formula;
   - the rest of the bullet as it stands.
2. Add to "The following belong elsewhere" one sentence deferring the following, by name:
   - `[L : K] = ef` to Mathlib's `Ideal.sum_ramification_inertia_eq_card`;
   - integral monogenicity, the lower index at a generator, `G_i = G` for `i ≤ −1`, normality, antitonicity, `G_0` as the kernel on the residue field, eventual triviality and `H_i = H ∩ G_i` to the Tau Ceti declarations above.
3. In §3a.1, cite these facts instead of asking for them ("By Tau Ceti's …, the groups `G_i` are …").
4. Add `Ideal.sum_ramification_inertia_eq_card` to the Mathlib contract and to §3a.1's *Needs*.

Tested: every named declaration elaborates at the pin on `TauCeti.IsLocalRing.ramificationGroup G S` with only `[IsLocalRing S]`. Eventual triviality also needs `[IsNoetherianRing S] [FaithfulSMul G S]` and finiteness of `G_0`. On `ℚ_2(ζ_8)/ℚ_2`: `e·f = 4·1 = #G`, and with `H = {1, 7}` the intersections `H ∩ G_i` for `i = 0, …, 3` are `H, H, 1, 1`.

## R02 (P3) — Mathlib's inertia subgroup of a valuation subring is neither cited nor compared, and the docstring implies inertia is missing in general

**Location.** `Suggested.lean` lines 36–38: "its identification with inertia and wild inertia also needs those subgroups over a general complete discretely valued field, and Tau Ceti's `TauCeti.inertiaSubgroup` and `TauCeti.wildInertiaSubgroup` assume `IsNonarchimedeanLocalField K`". README line 107 defines `I_K` afresh, and §4a.1 (lines 646–650) never names Mathlib's object.

**Claim.** Inertia over an arbitrary field exists at the pin: Mathlib's `ValuationSubring.inertiaSubgroup`. Tau Ceti already identifies it with the zeroth group of this roadmap's carrier. Take `K` complete and `O` the valuation subring of `AlgebraicClosure K` extending `A`. Because the prolongation is unique, the decomposition group of `O` is all of `G_K`, so the image of `ValuationSubring.inertiaSubgroup K O` in `G_K` is a native `I_K`. This is duplication by object. Wild inertia, by contrast, really is absent outside local fields.

**Witness.**
- Mathlib `RingTheory/Valuation/RamificationGroup.lean`: lines 29 (`decompositionSubgroup`), 39 (its action on `A`) and 49 (`inertiaSubgroup`).
- Tau Ceti `RingTheory/LocalRing/RamificationGroup.lean:260` (`ramificationGroup_zero_eq_inertiaSubgroup`).
- A scratch file elaborates `(ValuationSubring.inertiaSubgroup K O).map (O.decompositionSubgroup K).subtype : Subgroup (Field.absoluteGaloisGroup K)` for an arbitrary field `K`.

**Repair.**
1. Add `ValuationSubring.decompositionSubgroup`, `ValuationSubring.inertiaSubgroup` and `TauCeti.IsLocalRing.ramificationGroup_zero_eq_inertiaSubgroup` to *From Mathlib and Tau Ceti*.
2. In §4a.1, after "`G_K^0` is inertia `I_K`", add: "and `I_K` is the image in `G_K` of `ValuationSubring.inertiaSubgroup K O`, for the valuation subring `O` of `AlgebraicClosure K` extending `A`, whose decomposition group is all of `G_K`". Add the names to §4a.1's *Needs*.
3. In the docstring, replace the inertia clause with: "wild inertia exists at the pins only as `TauCeti.wildInertiaSubgroup`, for nonarchimedean local fields; inertia is Mathlib's `ValuationSubring.inertiaSubgroup`".

Tested on two fields:
- For `K = Frac W(F̄_p)`, `G_K` acts trivially on the residue field `F̄_p`. So Mathlib's inertia is all of `G_K`, which equals the fixing group of `K^ur = K`.
- For `K = ℚ_p`, a Frobenius lift acts on `F̄_p` as `x ↦ x^p`, so it lies in neither group.

## R03 (P3) — The completed roadmap is cited by group labels that only its open revision defines

Re-raised: R02 of the previous review (no change at this head).

**Location.** README lines 26–29: "The completed roadmap is cited by the groups of its *From Tau Ceti* supplier contract (*Finite extensions*, …, *Absolute Galois group*)". The labels recur at lines 140, 149–167, 218, 298, 309, 380, 409, 627–628, 638, 670, 792, 802–803 and 828.

**Witness.** On main (b3d628f), `Completed/LocalFieldsRamification/README.md` has Layers 0–4 and no *From Tau Ceti* contract; "Herbrand functions and upper numbering" and "Different and discriminant" occur 0 times. The labels exist only at #617's head 893faab, lines 150–271, unnamed in the description.

**Repair.** Either name #617 in the description's merge-order paragraph as merging first, or make the change inside the folder, which works in either merge order: replace each italic label with the Tau Ceti files or declarations it stands for. The contract at lines 146–170 already lists them. For example, "*Herbrand functions and upper numbering*" becomes "Tau Ceti's `NumberTheory/LocalField/Herbrand/` (`TauCeti.LocalFieldsRamification.herbrandOrderIso`, …)". The second form needs no change to the description and no dependency on #617.

## Verified sound

**Adversarial pass** (36 rows; values computed in this review):

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Hilbert's formula (`Suggested.lean` 61) | `ℚ_2(ζ_8)/ℚ_2` | `#G_0..#G_4 = 4,4,2,2,1`; `Σ(#G_i − 1) = 3+3+1+1 = 8`; `n·p^n − (n+1)p^(n−1) = 24 − 16 = 8` | agrees | none |
| same | `ℚ_3(ζ_9)/ℚ_3` | `#G_0..#G_3 = 6,3,3,1`: `5+2+2 = 9`; `2·9 − 3·3 = 9` | agrees | none |
| same | trivial `G` | `B = A`; `differentIdeal A A = ⊤ = 𝔪^0`; finsum `0` | agrees | none |
| same, separability dropped | `F_2(s,u)((t))`, `z_i² − t z_i = s, u` | `i(σ) = 1` for `σ ≠ 1`, sum `3`; `𝒟 = (f₁′(z₁) f₂′(z₂)) = (t²)`, `d = 2` | `2 ≠ 3`: hypothesis needed | none |
| `herbrandFun` (80) | unramified quadratic | integrand `2` on `(−2,−1]`, `1` on `(−1,0]`: `φ(−2) = −3`, `φ(1/2) = 1/2` | agrees with the §3a.2 Check | none |
| same | Artin–Schreier `y^p − y = t⁻¹` | `G_1 = G`, `G_2 = 1`: `φ(1) = 1`, `φ(3) = 1 + 2/p` | agrees | none |
| same | infinite `G` (junk) | `Nat.card = 0`, integrand `0/0 = 0`, `φ ≡ 0` | every theorem assumes `Finite G` | none |
| same, docstring "bijection of ℝ" | finite `G` | integrand `≥ #G/#G_0 ≥ 1` for `t ≤ −1`, `≥ 1/#G_0` everywhere, so `φ → ±∞` | agrees | none |
| `inverseHerbrandFun` (89) | unramified quadratic; Artin–Schreier; `ζ_p` | `φ(u) = 2u + 1` on `[−2,−1]`, so `ψ(−2) = −3/2`; `ψ(2) = p + 1`; `ψ(1) = p − 1` | `{u | v ≤ φ u} = [ψ v, ∞)` and `sInf` is right | none |
| `ψ(n) ∈ ℕ` (§3a.2) | `ℚ_2(ζ_8)` | slopes `1, 1/2, 1/4` past `0, 1, 3`: `ψ(2) = 3`, `ψ(3) = 7` | integers (serre1961 line 920) | none |
| `upperRamificationGroup` (96) | `ℚ_2(ζ_8)` | `G^1 = G_1 = G`; `G^2 = G_3 = {1,5}`; `G^(5/2) = G_5 = 1`; `G_3 = {1,5} ≠ G^3 = G_7 = 1` | agrees with the Check | none |
| Herbrand's theorem (110) | `ℚ_2(ζ_8)`, `H = {1,7}` | `v = 2`: `{1,5}H = G`, `i(√2 ↦ −√2) = v(−2√2) = 3`, `(G/H)^2 = (G/H)_2 = G/H`; `v = 5/2`: `G^(5/2) = 1`, `ψ_(L/K)(5/2) = 3`, `(G/H)_3 = 1` | agrees | none |
| same | `H = {1,5}`, `K′ = ℚ_2(i)` | `i = v(−2i) = 2`; `v = 1`: both `G/H`; `v = 3/2`: `G^(3/2) = H ↦ 1`, `ψ(3/2) = 2`, `(G/H)_2 = 1` | agrees | none |
| same | `H = ⊥`, `H = ⊤` | `B^⊥ = B`, `G ⧸ ⊥ ≅ G`; `G ⧸ ⊤` trivial, both sides `⊤` | agrees | none |
| same, `−1 ≤ v < 0` | any | `ψ(v) = v`; `v = −1`: `G` and `G/H`; else `(G/H)_0 = G_0H/H` | agrees | none |
| same, inseparable residue | §3a.2 Check | `(G/H)^(1/2) = (G/H)_1 = 1` (`v_(L₁)(t) = 1`); `G^(1/2)H/H = G_1H/H = G/H` | fails; excluded by hypothesis | none |
| tower transitivity (129) | `ℚ_2(ζ_8)`, `H = {1,7}` | `φ_G(7) = 2 + 4/4 = 3`; `φ_H(7) = 1 + 6/2 = 4`; `φ_(G/H)(4) = 2 + 2/2 = 3` | agrees | none |
| same | `H = {1,5}` | `φ_G(5) = 5/2`; `φ_H(5) = 3 + 1 = 4`; `φ_(G/H)(4) = 1 + 3/2 = 5/2` | agrees | none |
| same | `u = −1`; `u = −2` (outside scope) | all `−1`; order 4 with `G_0 = H` of order 2: `φ_G(−2) = −3`, `φ_H(−2) = −2`, `φ_(G/H)(−2) = −3` | agrees; the restriction `u ≥ −1` is harmless | none |
| same, inseparable residue | §3a.2 Check | `φ_(M/K)(1) = 1`; `φ_(L₁/K)(φ_(M/L₁)(1)) = 1/2` | fails; excluded | none |
| Hasse–Arf (150) | `ℚ_2(ζ_8)` | `j = 1`: `4 ∣ 4`; `j = 3`: `4 ∣ 8`; non-jump `j = 2`: `4 ∤ 6`, excluded by `hj` | agrees | none |
| same | `ℚ_3(ζ_9)` | `j = 0`: `6 ∣ 0`; `j = 2`: `6 ∣ 3 + 3`; non-jump `j = 1`: `6 ∤ 3` | agrees | none |
| same | abstract `C_9` filtration (Check, line 611) | `j = 5`: `9 + 4·3 = 21`, `9 ∤ 21`, `φ(5) = 7/3` | excluded, as the Check says | none |
| same, docstring "every jump other than −1 is `φ(j)`" | `G_t = G_⌈t⌉` | an upper jump `u` has `ψ(u) = j` with `G_j ≠ G_(j+1)`; `j = −1` gives `u = −1` | agrees | none |
| sampled: perfect-residue package Checks | Artin–Schreier over `F̄_p((t))`; `ζ_p` over `Frac W(F̄_p)`; `ℚ_2(ζ_8)` | `v(−1/(y(y+1))) = 2`, `d = 2(p−1)`, break `φ(1) = 1`; `d = p − 2`, break `0`; upper jumps `φ(1) = 1`, `φ(3) = 2` | agrees | none |
| sampled: residue enlargement | `κ[[t]] → κ̄[[t]]`; `F_(p²)((t))`; tame `X^e − t` | `t` stays a uniformizer; `F_(p²) ⊗ F̄_p ≅ F̄_p²` splits; `σπ − π = (ζ_e − 1)π`, `i = 1`: `#G_0 = e`, `G_1 = 1` | agrees | none |
| EGA (10.3.1) for that target | flat local `R → R′`, `R′/𝔪_R R′ ≅ κ̄` | `𝔪_(R′) = 𝔪_R R′` principal on a nonzerodivisor: DVR; completion keeps flatness (printed p. 23) | agrees | none |
| sampled: proalgebraic units | `E = F`; Artin–Schreier | `V = 1`; `π₀(V) ≅ H/[H,H] = C_p` (serre1961 line 638); `σ(uπ)/(uπ) = (σu/u)(σπ/π)` with `σu/u ∈ I_H U_E` | agrees | none |
| sampled: graded norms | tame cyclic `e`; Artin–Schreier | `N_0: u ↦ u^e`, kernel `μ_e ≅ H_0/H_1`; `ψ(s) = es`, `H_(es) = 1` for `s ≥ 1`; `ψ(1) = 1`, `H_1/H_2 = C_p`; `ψ(2) = p+1`, `H_(p+1) = 1` | agrees | none |
| sampled: first map of the `V_s` sequence | `a ∈ U_E^(ψ(s)+1)` | `N(a) ∈ U_F^(s+1) = N(U_E^(ψ(s+1)))`; `w ∈ U_E^(ψ(s+1)) ⊆ U_E^(ψ(s)+1)` since slope of `ψ ≥ 1` | agrees | none |
| sampled: `Breve E` agreement | `ℚ_p`; `F_q((t))`; `√p` | `K′ = W(F̄_p)[1/p]`; `Σ a_n t^n` with `a_n` generating `F_(q^(n!))` is in `F̄_q((t))` and in no `F_(q^m)((t))`; `v(√p) = 1/2 ∉ ℤ` | agrees | none |
| §4a.2 Check | `ℚ_3(ζ_3) ⊂ ℚ_3(ζ_9)` | `ψ_(L/K)(3/2) = 3`; `H_0..H_2 = H`, `H_3 = 1`: `H^(3/2) = H`, `H^3 = 1`; `G^(3/2) = 1` | agrees | none |
| §4a.3 Check | `ℚ_3(ζ_9)` | `d = 9`, `d/e = 3/2`, upper jumps `φ(0) = 0` and `φ(2) = 6/6 = 1` | agrees | none |
| R01: `[L : K] = ef` | `ℚ_2(ζ_8)` | `e·f = 4·1 = #G` over the one prime | already Mathlib's | R01 |
| R01: subgroup formula | `ℚ_2(ζ_8)`, `H = {1,7}` | `H ∩ G_i = H, H, 1, 1` (`i = 0..3`) | already Tau Ceti's | R01 |
| R02: inertia | `Frac W(F̄_p)`; `ℚ_p` | trivial action on `F̄_p`, so Mathlib's inertia `= G_K = Fix(K^ur)`; a Frobenius lift is in neither | the two agree; Mathlib's is not cited | R02 |

**Signatures.**
- I put `#check @` of all seven declarations in one scratch file and elaborated it once. The output reproduces the worker's `signatures.md` exactly.
- No declaration uses a section variable, so no binder can be lost. Each statement has the README's generality: discrete valuation rings, `Algebra.IsInvariant`, `FaithfulSMul G B`, separable residue extension, no completeness. Nothing changed.
- The `IsLocalRing (FixedPoints.subalgebra A B H)` binder is a `Prop` class that holds in this setting. `B` is local and integral over `B^H`, so every maximal ideal of `B^H` lies under `𝔪_B`.

**Padding.** I tried each sorried theorem with one tactic (`simp`, `aesop`, `rfl`, `exact?`) on scratch copies. All four goals stay open, ending in unsolved goals, no progress, failure or timeout. The three definitions are the ones the stated theorems need. Nothing is padding.

**Headlines.**
- Stated:
  - Hilbert's different formula (§3a.1);
  - Herbrand's quotient theorem and tower transitivity (§3a.2);
  - the lower-numbering form of Hasse–Arf (§3a.3).
- Named as not statable in the docstring: the absolute upper filtration with inertia and wild inertia (§4a.1), `ψ_(L/K)` with the open-subgroup identity (§4a.2), and completed maximal unramified base change (§4a.3).
- The main reason given is correct at the pins:
  - Tau Ceti takes `IsLocalRing (integralClosure …)` only as a hypothesis (`NumberTheory/LocalField/IntegerRing/Basic.lean:171`, `RingTheory/DiscreteValuationRing/Kummer.lean:377`);
  - Mathlib has no maximal unramified extension;
  - Tau Ceti has one only for local fields (`Unramified/Maximal.lean:97`).
- The inertia clause of the docstring is R02.

**Library declarations opened at the pins.** 59 `#check @` lines resolve, covering every library name the README backticks. Two instance checks also elaborate: `MulSemiringAction (G ⧸ H) (FixedPoints.subalgebra A B H)` and `Algebra.IsInvariant A (FixedPoints.subalgebra A B H) (G ⧸ H)`. Opened by hand:
- Tau Ceti `RingTheory/LocalRing/RamificationGroup.lean`: 118 (`ramificationGroup` as `Ideal.inertia` of `𝔪^((i+1).toNat)`), 166, 183, 220, 233, 260, 325, 351, 444, 561, 722 (`ramificationGroupReal = G_⌈u⌉`).
- Tau Ceti `RingTheory/DiscreteValuationRing/Monogenic.lean:70`.
- Tau Ceti `NumberTheory/LocalField/RamificationGroup.lean:86` (`RamificationIndexDomain = Set.Ici (−1)`) and 99 (`lowerRamificationGroup` is the local-ring filtration).
- Tau Ceti `Herbrand/Basic.lean:112–138`: the same integrand and integral as `herbrandFun`, so agreement is by construction.
- Tau Ceti `Unramified/Maximal.lean:298` (`le_maximalUnramifiedExtension_iff` under `IsSepClosed Ω`) and `Unramified/Inertia/Basic.lean:112`.
- Mathlib `RingTheory/Invariant/Basic.lean:62, 76, 84`; `RingTheory/Valuation/RamificationGroup.lean:29, 39, 49`; `RingTheory/RamificationInertia/Basic.lean:73, 82`.

**Cross-roadmap citations resolved** (main b3d628f; `roadmaps resolve` reports nothing unresolved):
- ReductiveGroupsPartII §RG2.0.4 (line 852). It matches the README's description of `Breve E`: discreteness, algebraically closed residue field, `isUniformizer_algebraMap`, Frobenius and fixed field.
- ReductiveGroups Layer 3 (line 234).
- SchemeAndStackFoundations §0.24 (line 1565).
- AdicSpacesPartII §R0.19.9 (lines 292, 304).
- ClassFieldTheory and LocalGaloisGroups on main.
- The dependency-order links to `TauCetiRoadmap/ProfiniteCohomology`, `Completed/ProfiniteProPGroups` and `Completed/LocalFieldsRamification`.

**Ownership against open pull requests.**
- FilteredLocalGaloisGroups (#1795) and FieldOfNorms (#1812) defer `G_K^u`, `ψ_(E/K)` and the open-subgroup identity to this roadmap's §§4a.1–4a.2. So there is one owner.
- ArithmeticGaloisRepresentations (#856), PadicPeriodRings (#940) and FiniteFlatGroupsAndIntegralPadicHodgeTheory (#879) consume §§3a–4a without rebuilding them.
- The LocalFieldsRamification revision (#617, lines 36–38) assigns Hasse–Arf over complete discretely valued fields to §3a.3.
- PadicExtensionFamilies (#1713) works only on local fields.
- LocalFieldsRamificationPartII is a board package at merge-order line 382, so it comes later. It builds `Kᵘ` and inertia for henselian valued fields from Mathlib's `ValuationSubring.inertiaSubgroup`; its comparison with §4a.1 belongs to it.
- `roadmaps overlaps`: no open pull request changes this roadmap, and none drops an id it cites.

**Sources (seeded sample and new locators).**
- serre1961 (printed page = text page + 103):
  - n° 3.1: Propositions 1–2 (pp. 126–127); formulas (4)–(5) and properties a–d′ (p. 127); formula (8), Propositions 3–4 and the Remarque (p. 128). These cover the docstring citations at `Suggested.lean` lines 78, 95, 107 and 126.
  - n° 2.1–2.3: Proposition 1 with its corollary (norm surjective on units), Proposition 2 with its corollary and Remarque (`σ ↦ σ(π)/π`), Proposition 3 with its corollary (`V⁰ = I·U`, `π₀(V) ≅ H/[H,H]`), pp. 118–120.
  - n° 3.4, Propositions 6–7 with Corollaries 1–3 (pp. 132–135), and n° 3.5, Proposition 8(i)–(iii) with Corollary 1 (pp. 135–136).
  - Every statement of the "Proalgebraic units" and "Graded norms" targets matches its locator.
- serre1960 (printed page = text page + 1): n° 1.2 Definition 2 and the induced and quotient structures (p. 8); n° 1.4 Proposition 10 (p. 11); n° 2.4 Propositions 6–7 (pp. 17–18); n° 2.5 Proposition 10 with Corollaries 1–2 (p. 19); n° 5.1 Propositions 1–2, including right exactness of `π₀` (p. 35). All five match.
- ega3: Chapitre 0, (10.3.1) (printed p. 20), and (10.3.1.5) with the completion remark (printed p. 23).
- brinon-conrad: Exercise 1.4.4(2)–(3) (p. 10), and Lemma 13.1.6 (p. 201).

## Not verifiable

- Serre, *Local Fields* (manifest: uncertified, paywalled): II §2 Proposition 3; III §6 Proposition 12; IV §1 Propositions 1, 2 and 4; IV §3 Proposition 14 and Exercise 3; V §7 Theorem 1. None was read. The README cites IV §3 Proposition 14 for all of §3a.2, and I could not check whether tower transitivity is that proposition or the one after it.
- serre1961 line 1197 (proof of Proposition 8(i), printed p. 135) reads "corollaire 2 de la proposition 3" in the Numdam text layer, where the bound used is Corollary 2 of Proposition 7. The previous review recorded this as a misprint. Neither OCR nor a PDF renderer is available on this host, so I could not tell a printed slip from an OCR error, and I do not repeat it below. The same caveat applies to the text-layer readings of serre1960.

## Source issues

- none
