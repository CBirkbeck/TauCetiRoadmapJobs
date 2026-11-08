# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at 9157bb8)

**Verdict:** needs changes

This is a full review: the folder changed by 360 lines since 6260b60. The pins are unchanged.

- **Gate.** Rerun at this head: every check passes (`set_option=0 … stray-files=0 … outside-folder=0 … OK`).
- **Dependency check.** `depcheck: 238 roadmaps, 2344 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- **Elaboration.** `lake env lean` of `TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/Suggested.lean` exits 0. Its only output is four `declaration uses sorry` warnings, at lines 61, 110, 129 and 150.
- **Outside the folder.** `git diff --stat origin/main...HEAD` lists nothing outside the folder.
- **Gaps.** There is no `design/plan.json`, so no gaps are declared.

There are four findings: two P2 and two P3. Both P2 findings concern §4a.1:

- the absolute upper filtration can be stated at the pins, although the docstring says it cannot;
- the open ClassFieldTheory revision also claims to own it on local fields.

## Previous findings (review at 6260b60)

- **R01 (P3), the Scope owned results that are already pinned: repaired.**
  - Scope lines 35–45 now own only:
    - `B` as a complete DVR free over `A`, with the unique prolongation;
    - the graded embeddings;
    - Hilbert's formula;
    - the Herbrand, Hasse–Arf and agreement targets.
  - Lines 66–79 defer the pinned facts by name, for example "the formula `[L : K] = ef`, as Mathlib's `Ideal.sum_ramification_inertia_eq_card`" and "`TauCeti.IsLocalRing.subgroupOf_ramificationGroup`".
  - §3a.1 (lines 306–319) cites them, and the Mathlib contract (line 140) and §3a.1's *Needs* (line 358) name `Ideal.sum_ramification_inertia_eq_card`.
- **R02 (P3), Mathlib's inertia was not cited: repaired.**
  - Mathlib's `ValuationSubring.decompositionSubgroup` and `ValuationSubring.inertiaSubgroup` are now cited in:
    - the Scope (lines 79–82);
    - the Conventions (lines 123–128);
    - the Mathlib contract (lines 142–144);
    - §4a.1 (lines 700–703) with its *Needs* (lines 735–738).
  - `TauCeti.IsLocalRing.ramificationGroup_zero_eq_inertiaSubgroup` is cited at lines 166–168.
  - The docstring (`Suggested.lean` lines 36–38) now reads "Inertia, its term at `0`, exists over any field as Mathlib's `ValuationSubring.inertiaSubgroup`".
- **R03 (P3), group labels that only the open LocalFieldsRamification revision defines: repaired.**
  - Lines 25–28 now read "cited through the Tau Ceti declarations that prove its results, by name and by file under `TauCeti/NumberTheory/LocalField/`".
  - The contract (lines 174–206) lists files and declarations, and all 18 files exist at the pin.
  - A search for the eight italic labels finds none.

## R01 (P2) — §4a.1's absolute upper filtration and `G_K^0 = I_K` can be stated at the pins, but the docstring says they cannot

**Location.**
- `Suggested.lean` lines 29–36: "Not statable at the pins … the absolute upper filtration of `Field.absoluteGaloisGroup K` with inertia … (§4a.1) … neither pinned library makes that ring a local ring".
- README lines 257–261 make the same claim.

**Claim.**
- The obstruction is the choice of carrier, not the pins. The README already works with `O`, the valuation subring of `AlgebraicClosure K` over `A` (line 124), and uses `O ∩ M` as the integer ring of each finite level (line 693).
- `O.comap (algebraMap M (AlgebraicClosure K))` is a `ValuationSubring`. It is therefore natively a local ring, and Mathlib's `ValuationSubring.decompositionSubgroup` acts on it natively.
- So `G_K^u`, its finite projections and `G_K^0 = I_K` can be stated with one short definition that has a real body. These are headlines the docstring itself lists.

**Witness.**
- A scratch file elaborates at the pins, with `sorry` warnings only. It defines the filtration as follows (the three upper-numbering definitions copied from `Suggested.lean`):

  ```lean
  ⨅ M : FiniteGaloisIntermediateField K (AlgebraicClosure K),
    ((upperRamificationGroup (OM.decompositionSubgroup K) OM u).map
      (OM.decompositionSubgroup K).subtype).comap (AlgEquiv.restrictNormalHom M)
  ```

  Here `OM = O.comap (algebraMap M _)`.
- It states `G_K^0 = (ValuationSubring.inertiaSubgroup K O).map (O.decompositionSubgroup K).subtype`, and the surjection onto `Gal(M/K)^u` for `u ≥ −1`.
- ClassFieldTheory's open revision (#1411) defines the same object on local fields at the pins (its `Suggested.lean` line 1459).

**Repair.**
1. Add `absoluteUpperRamificationGroup K O u`, with the body above (inline `O.comap`; no other new definition).
2. State these two theorems under `[IsDiscreteValuationRing (O.comap (algebraMap K _))]`, `IsAdicComplete` of its maximal ideal and `[PerfectField (IsLocalRing.ResidueField _)]`:
   - `absoluteUpperRamificationGroup_zero` (`G_K^0` is the image of `ValuationSubring.inertiaSubgroup K O`);
   - `map_restrictNormalHom_absoluteUpperRamificationGroup`.
3. Name both theorems in §4a.1.
4. Rewrite docstring lines 29–36 and README lines 257–261 so that they keep as not statable only:
   - wild inertia at `0+` outside local fields;
   - §4a.2 (`ψ_(L/K)` of a non-Galois `L`, through a Galois closure);
   - §4a.3 (no `K^ur` or completion outside local fields).

**Tested.** The repaired statements elaborate. For `K = F̄_p((t))`, both sides are `G_K`, since `κ(O) = F̄_p = k` and every `Gal(M/K)_0 = Gal(M/K)`. For `K = ℚ_p`, a Frobenius lift restricts nontrivially to `ℚ_(p²)`, where `G_0 = 1`, and acts on `F̄_p` as `x ↦ x^p`, so it lies on neither side.

## R02 (P2) — The absolute upper groups of a nonarchimedean local field have two owners: this roadmap and ClassFieldTheory's open revision (#1411)

**Location.**
- README lines 98–100: "Upper ramification of a local field itself, `G_K^u` for a nonarchimedean local field, is this roadmap's".
- §4a.1 lines 705–706.
- Downstream consumers lines 925–926: "ClassFieldTheory consumes §4a.1".

**Claim.**
- The ClassFieldTheory revision #1411 claims and builds the same object itself. Its README (lines 177–181) reads "The absolute upper ramification groups of a nonarchimedean local field are owned here (Layer 7, `absoluteUpperRamificationGroup`)".
- Its Layer 7 (line 1449) and `Suggested.lean` (lines 1459 and 1506) define `G_K^n` for integer `n`, and they prove closedness, normality, antitonicity, the finite projections and `G_K^0 = inertiaSubgroup`. These are the claims of this roadmap's §4a.1, restricted to local fields.
- At #1411's head, nothing cites §4a.1 apart from that ownership sentence. So the description's "#1411 consumes its §4a.1 absolute filtration" is not yet true, and the agreement "restricts to these groups on local fields" is a target in neither roadmap.

**Witness.** On `ℚ_2`, at the level `M = ℚ_2(ζ_8)`, the two definitions agree:

| `n` | #1411's `G_K^n` | §4a.1's `G_K^n` (Check, line 744) |
|---|---|---|
| 1 | `G` | `G` |
| 2 | `{1, 5}` | `{1, 5}` |
| 3 | `1` | `1` |

**Repair.** Keep one owner: this roadmap. It precedes #1411, and its §4a.1 covers local fields at every real depth.
1. In #1411, define Layer 7's `absoluteUpperRamificationGroup K n` as §4a.1's `G_K^n`, or state its equality with §4a.1 as a target. Cite §4a.1 for its five properties, and drop "owned here".
2. Here, add one sentence to §4a.1: on a nonarchimedean local field, the image of `G_K^u` in each finite level `M` is `TauCeti.LocalFieldsRamification.upperRamificationGroup K M u`, by §3a.2's agreement. This gives #1411 a target to cite.

## R03 (P3) — EtaleCohomologyFoundations §F.3a is applied to `AlgebraicClosure K`, but it supplies its results for a separable closure

**Location.**
- README lines 225–227: "§4a.1 uses these for `R = A` … and the geometric generic point `Spec (AlgebraicClosure K)`, whose Galois group is `G_K`".
- The same reading appears at lines 124–127, 701 and 718.

**Claim.** §F.3a builds its trait from a separable closure of the fraction field.
- On main (line 779) it reads "a chosen separable closure `k(η̄)` of `k(η)`".
- At the open revision #1891 (lines 1222–1223) it reads "a separable closure … with Mathlib's `IsSepClosure` instance".

In equal characteristic, `AlgebraicClosure K` is not a separable closure of `K`. That covers the roadmap's main examples. The transfer from `K^s` to `K̄` is used, but no one owns it.

**Witness.**
- Mathlib's `IsSepClosure` (`FieldTheory/IsSepClosed.lean:226`) includes `separable : Algebra.IsSeparable k K`.
- For `K = F̄_p((t))`, the root `t^(1/p)` of `X^p − t` lies in `AlgebraicClosure K` and is inseparable over `K`.

**Repair.**
1. Apply §F.3a to `separableClosure K (AlgebraicClosure K)`, which is a separable closure by Mathlib's `separableClosure.isSepClosure`.
2. Add to §4a.1 the transfer and name it in its *Needs*:
   - restriction `G_K → Gal(K^s/K)` is an isomorphism;
   - `O` is the unique valuation subring of `K̄` over `O^s = O ∩ K^s`, because `K̄/K^s` is purely inseparable;
   - both residue fields are algebraic closures of `k`, so they coincide, and decomposition and inertia correspond.

**Tested.** For `F̄_p((t))`, `O^s` and `O` both have residue field `F̄_p`. For perfect `K = Frac W(F̄_p)`, `K^s = K̄` and nothing changes.

## R04 (P3) — The dependency order omits ReductiveGroupsPartII, and the description omits two suppliers

**Location.**
- README lines 911–917 list the suppliers of §3a.3 and §4a.1, but not ReductiveGroupsPartII §RG2.0.4, which §4a.3 consumes (lines 239–245, 876, 905).
- The description's *Dependencies* paragraph omits both EtaleCohomologyFoundations §F.3a and ReductiveGroupsPartII §RG2.0.4.

**Witness.** README lines 914–916 ("with ReductiveGroups, SchemeAndStackFoundations and AdicSpacesPartII supplying §3a.3's proalgebraic inputs and EtaleCohomologyFoundations §F.3a supplying §4a.1's…"). The description lists neither section.

**Repair.**
1. Append to line 916: ", and ReductiveGroupsPartII §RG2.0.4 supplying §4a.3's `Breve E`".
2. Name EtaleCohomologyFoundations §F.3a and ReductiveGroupsPartII §RG2.0.4, both on main, in the description's *Dependencies*.

## Verified sound

**Adversarial pass.** There are 34 rows, all computed in this review. Notation: `AS` is `y^p − y = t⁻¹`, and `BQ` is `F̄_2((t))(y, w)` with `y² − y = t⁻¹` and `w² − w = t⁻³`. `BQ` has lower jumps `1` and `5` and upper jumps `1` and `3`.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Hilbert (`Suggested.lean` 61) | `ℚ_3(ζ_9)/ℚ_3` | `#G_0..#G_3 = 6,3,3,1`: `5+2+2 = 9`; `Σ_(σ≠1) i(σ) = 3·1 + 2·3 = 9`; `2·9 − 3·3 = 9` | agrees | none |
| same | `BQ` | `i(σ) = 2, 2, 6`; `Σ(#G_i − 1) = 3+3+1·4 = 10`; conductor–discriminant `0+2+4+4 = 10` | agrees | none |
| same | trivial `G` | `A → B` bijective (kernel `𝔪_A` would make `B^G` a field); `differentIdeal A A = ⊤ = 𝔪^0`; finsum `0` | agrees | none |
| same, separability dropped | `F_2(s,u)((t))`, `z_i² − t z_i = s, u` | three `σ ≠ 1` with `i = 1`: sum `3`; `𝒟 = (f₁′(z₁) f₂′(z₂)) = (t²)`, `d = 2` | `2 ≠ 3`: hypothesis needed | none |
| `herbrandFun` (80) | AS; `ζ_p` over `Frac W(F̄_p)`; unramified quadratic | `φ(1) = 1`, `φ(3) = 1 + 2/p`; `φ(1) = 1/(p−1)`; `φ(−2) = −(2+1) = −3` | agrees with the Checks | none |
| `inverseHerbrandFun` (89) | `ℚ_3(ζ_9)` | slopes `1/2` on `[0,2]`, `1/6` after: `ψ(1) = 2`, `ψ(3/2) = 5`, `ψ(2) = 8 ∈ ℕ` | agrees (serre1961 line 920) | none |
| `upperRamificationGroup` (96) | `ℚ_3(ζ_9)` | `G^0 = C_6`, `G^(1/2) = G_1 = C_3`, `G^1 = G_2 = C_3`, `G^(3/2) = G_5 = 1`: upper jumps `0, 1` | agrees with the §4a.3 Check | none |
| Herbrand (110) | `ℚ_3(ζ_9)`, `H = C_3` | `v = 0`: `G/H` both sides; `v = 1/2`: `G_1H/H = 1`, `(G/H)_1 = 1`; `v = 1`: `G_2H/H = 1 = (G/H)_2` | agrees | none |
| same | `BQ`, `H = Gal(M/K(w))` | `v = 2`: `G^2 = Gal(M/K(y)) ≠ H`, image `G/H`; `(G/H)^2` is everything (jump `3`); `v = 4`: `ψ(4) = 9`, `G_9 = 1`, `(G/H)^4 = 1` | agrees | none |
| same | `H = ⊥`, `H = ⊤` | `B^⊥ = B`, `G ⧸ ⊥ ≅ G`; `G ⧸ ⊤` trivial, both sides `⊤` | agrees | none |
| same, inseparable residue | §3a.2 Check, `F_2(s)((t))` | `(G/H)^(1/2) = (G/H)_1 = 1`; `G^(1/2)H/H = G_1H/H = G/H` | fails; excluded | none |
| tower (129) | `ℚ_3(ζ_9)`, `H = C_3` | `u = 5`: `φ_G = 3/2`, `φ_H = 3`, `φ_(G/H)(3) = 3/2`; `u = 1`: `1/2`, `1`, `1/2` | agrees | none |
| same | `BQ`, `H = Gal(M/K(y))` | `φ_G(5) = 1 + 4/2 = 3`; `φ_H(5) = 5`; `φ_(G/H)(5) = 1 + 4/2 = 3` | agrees | none |
| same | `u = −1` | all three give `−1` | agrees | none |
| tower-order Check | `ℚ_2(√2) ⊂ ℚ_2(ζ_8)` | `ψ_(L/K)(3) = 4`, `ψ_(M/L)(4) = 7 = ψ_(M/K)(3)`; `ψ_(L/K)(5) = 8` | agrees | none |
| Hasse–Arf (150) | `ℚ_3(ζ_9)` | `j = 0`: `6 ∣ 0`; `j = 2`: `6 ∣ 6`; non-jump `j = 1`: `6 ∤ 3` (excluded by `hj`) | agrees | none |
| same | `BQ` | `j = 1`: `4 ∣ 4`; `j = 5`: `4 ∣ 4 + 2·4 = 12`; non-jump `j = 2`: `4 ∤ 6` | agrees | none |
| same | `C_9` Check (line 664) | `j = 5`: `9 + 3·4 = 21`, `9 ∤ 21`, `φ(5) = 7/3` | correctly unrealizable | none |
| same | trivial `G`; unramified | `G_j = 1` for `j ≥ 0`, so `hj` never holds | vacuous, correctly | none |
| §3a.1 graded-character Check | AS, `π = y⁻¹` | `(σπ − π)/π² = −y/(y+1) → −1`; `σπ/π = y/(y+1) → 1`; `v(σπ − π) = 2` | agrees | none |
| §3a.1 inseparable Check | `z^p − t^(p−1) z = s` | `σz − z = t`, `v = 1`: `σ ∈ G_0 ∖ G_1`, `#G_0 = p ≠ e = 1` | agrees | none |
| sampled: perfect-residue package | AS; `ζ_p`; `ℚ_2(ζ_8)` | `d = 2(p−1)`, break `1`; `d = p−2`, break `0`; lower `1, 3` ↦ upper `φ(1) = 1`, `φ(3) = 8/4 = 2` | agrees | none |
| sampled: residue enlargement | `κ[[t]] → κ̄[[t]]`; Eisenstein `f`; `F_(p²)` | `t` stays a uniformizer; `𝔪_R²R′ ∩ R = 𝔪_R²` (faithful flatness), so `f` stays Eisenstein; `F_(p²) ⊗ F̄_p ≅ F̄_p²` splits | agrees | none |
| sampled: proalgebraic units | `E = F`; AS | `V = 1`; `π₀(V) ≅ H/[H,H] = C_p` (serre1961 line 638); class of `σ(T)/T` (lines 616–621) | agrees | none |
| sampled: graded norms | tame `C_e`; AS | `u ↦ u^e`, kernel `μ_e`; `ψ(s) = es`, `G_(es)/G_(es+1) = 1` (`s ≥ 1`); `ψ(1) = 1`, `G_1/G_2 = C_p`; `ψ(2) = p+1`, `G_(p+1) = 1` | agrees | none |
| sampled: first map of the `V_s` sequence | `a ∈ U_E^(ψ(s)+1)` | `N(a) ∈ U_F^(s+1) = N(U_E^(ψ(s+1)))` (Prop. 6(a)); `a/w ∈ V_s`, class modulo `V_(s+1)` independent of `w` | agrees | none |
| sampled: `Breve E` agreement | `ℚ_p`; `F_q((t))`; `√p` | `K′ = W(F̄_p)[1/p]`; `Σ a_n tⁿ` with `a_n` generating `F_(q^(n!))` lies in `F̄_q((t))`, in no `F_(q^m)((t))`; `v(√p) = 1/2 ∉ ℤ` | agrees | none |
| §4a.1 `G_K^0 = I_K` (R01) | `F̄_p((t))`; `ℚ_p` | both sides `G_K`; Frobenius lift: nontrivial on `ℚ_(p²)` with `G_0 = 1`, `x ↦ x^p` on `F̄_p` | true and statable | R01 |
| §4a.1 finite projections | `ℚ_2(ζ_8)` | `ψ(1) = 1`, `ψ(2) = 3`: image `G` (`u ≤ 1`), `{1,5}` (`1 < u ≤ 2`), `1` (`u > 2`) | agrees with the Check | R01 |
| #1411's `G_K^n` (R02) | `ℚ_2`, `M = ℚ_2(ζ_8)` | `n = 1, 2, 3`: `G, {1,5}, 1` in both | same object, two owners | R02 |
| §F.3a generic point (R03) | `F̄_p((t))`; `Frac W(F̄_p)` | `d/dX(X^p − t) = 0`, so `IsSepClosure K K̄` fails; for perfect `K`, `K̄ = K^s` | transfer needed | R03 |
| §4a.2 Check | `ℚ_3(ζ_3) ⊂ ℚ_3(ζ_9)` | `ψ_(L/K)(3/2) = 3`; `G^(3/2) = G_5 = 1`; `H^(3/2) = H_2 = H`; `H^3 = H_5 = 1` | agrees | none |
| §4a.2 integral formula | `ℚ_3(ζ_3)`; unramified of degree `f` | index `2` for `t > 0`: `ψ = 2u`; index `f`, `(1/f)·f·u = u` | agrees | none |
| §4a.3 Check | `ℚ_3(ζ_9)` | `e = 6`, `d = 9`, `d/e = 3/2`, upper jumps `0` and `1` | agrees | none |

**Signatures.**
- I put `#check @` of all seven declarations in one scratch file and elaborated it once. The types match `signatures.md` up to the namespace prefix.
- No declaration uses a section variable. Each statement has the README's generality (§3a.1 lines 329–334, §3a.2 lines 414–418, §3a.3 lines 513–516): DVRs, `Algebra.IsInvariant`, `FaithfulSMul G B`, separable residue extension, no completeness. Nothing changed.

**Padding.** I replaced every `sorry` with `simp`, `rfl`, `aesop` or `infer_instance` on scratch copies. All four theorems stay open in each run, with "unsolved goals", "made no progress", "rfl failed" or "type class instance expected". The three definitions are the ones the theorems need. Nothing is padding.

**Headlines.**
- Stated: Hilbert's formula (§3a.1); Herbrand's theorem and tower transitivity (§3a.2); lower-numbering Hasse–Arf (§3a.3).
- Named as not statable: §§4a.1–4a.3. §4a.1 is statable (R01). §4a.2 (non-Galois `ψ_(L/K)` through a Galois closure, on absolute groups of `L`) and §4a.3 (no `K^ur` or completion outside local fields; Tau Ceti `Unramified/Maximal.lean:97` assumes `IsNonarchimedeanLocalField`) are correctly named.

**Library declarations.** 70 `#check @` lines resolve at the pins, covering every library name the README backticks. Opened by hand:
- Mathlib:
  - `RingTheory/Valuation/RamificationGroup.lean` 29, 39, 49;
  - `RingTheory/RamificationInertia/Basic.lean` 82 (needs `Module.Finite`, `Module.Flat`, `IsGaloisGroup`, as the README says);
  - `Analysis/Normed/Field/Krasner.lean` 73 (complete ultrametric `K`, `Normal K L`);
  - `RingTheory/Henselian.lean` 154;
  - `FieldTheory/IsSepClosed.lean` 226, 340.
- Tau Ceti `RingTheory/LocalRing/RamificationGroup.lean`: 118, 145, 166, 183, 220, 233, 260, 325 (needs `IsNoetherianRing`, `FaithfulSMul`, finite `G_0`), 351, 444, 469, 520, 561, 722.
- Tau Ceti `RingTheory/DiscreteValuationRing/Monogenic.lean:70` (`Module.Finite`, `FaithfulSMul`, separable residue extension; no completeness).
- Tau Ceti `FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean:227` (`Normal`, `IsClosed H`).
- Tau Ceti `NumberTheory/LocalField/`:
  - `Herbrand/Basic.lean` 112–138, the same integrand as `herbrandFun`, so agreement holds by construction; 251, 258, 262, 421, 511, 517;
  - `Herbrand/Tower.lean:226`, `Herbrand/Jump.lean:42`, `Herbrand/HasseArf/Abelian.lean:50`;
  - `Unramified/Maximal.lean` 97, 298 (`IsSepClosed Ω`);
  - `Unramified/Inertia/Basic.lean:112`, `Unramified/Inertia/Finite.lean:57`, `WildInertia.lean` 251, 702;
  - `Different/Hilbert.lean:93`, `Monogenic.lean:54`, `UnitFiltration/RamificationGroup.lean` 481, 566.

**Cross-roadmap citations resolved** (main 54fc140; `roadmaps resolve` lists nothing unresolved):
- EtaleCohomologyFoundations §F.3a (line 776; unchanged in substance at #1891, line 1140; no cited id dropped);
- ReductiveGroupsPartII §RG2.0.4 (line 852): `Breve E` as `UniformSpace.Completion` of `TauCeti.maximalUnramifiedExtension E (AlgebraicClosure E)`, `breveIsDiscrete`, `residueField_isAlgClosed`, `isUniformizer_algebraMap`, as the README says;
- ReductiveGroups Layer 3 (line 234);
- SchemeAndStackFoundations §0.24 (line 1565);
- AdicSpacesPartII §R0.19.9 (lines 292, 304);
- ClassFieldTheory, `Completed/LocalGaloisGroups`, `Completed/LocalFieldsRamification`, `Completed/ProfiniteProPGroups` and `TauCetiRoadmap/ProfiniteCohomology`.

EtaleCohomologyFoundations is on main, so it is a permitted supplier, and the dependency check reports no problem.

**Ownership against open pull requests.** I compared ownership with every overlapping open pull request:
- FilteredLocalGaloisGroups (#1795) and FieldOfNorms (#1812) defer `G_K^u`, `ψ` and the open-subgroup identity to §§4a.1–4a.2.
- PadicPeriodRings (#940) consumes the §3a.3 unit groups and owns reciprocity.
- ArithmeticGaloisRepresentations (#856) and FiniteFlatGroupsAndIntegralPadicHodgeTheory (#879) consume Layers 3a–4a.
- The LocalFieldsRamification revision (#617, line 38) assigns general Hasse–Arf to §3a.3.
- The LocalFieldsRamificationPartII board package covers henselian and tame theory, not upper numbering.
- The only conflict is ClassFieldTheory #1411 (R02).
- `roadmaps overlaps`: no open pull request changes this roadmap or drops an id it cites.

**Sources.** I checked every locator of the five sampled targets against the text.
- serre1961 (printed page = text page + 103):
  - n° 1.1–1.6 runs over pp. 106–113 (n° 1.7 opens at line 366).
  - n° 2.1 (lines 557–570) has the coefficient-field lift.
  - Prop. 1 with its Corollary, Prop. 2 with its Corollary and Remarque, Prop. 3 with its Corollary: lines 585–639, pp. 119–120.
  - n° 3.1: Props. 1–2, (4)–(5) and a–d′ on pp. 126–127; Props. 3–4, (8)–(10), the Remarque and the infinite-extension paragraph (lines 931–950) on p. 128. Its `g_n` is Local Fields' `G_n` (line 871).
  - n° 3.4: Props. 6–7 with Corollaries 1–3, lines 1092–1184, pp. 132–135.
  - n° 3.5: Prop. 8(i)–(iii), p. 135, and Corollary 1, p. 136.
- serre1960 (printed page = text page + 1): n° 1.2 Definition 2 (line 162, p. 8); n° 1.4 Prop. 10 (line 313, p. 11); n° 2.4 Props. 6–7 (lines 546, 575, pp. 17–18); n° 2.5 Prop. 10 with Corollaries 1–2 (lines 625–642, p. 19); n° 5.1 Props. 1–2, with right exactness of `π₀` (lines 1246–1261, p. 35).
- ega3: (10.3.1), lines 637–639, printed p. 20 (flat local `A → B` with `B/𝔪B ≅ K`); (10.3.1.5) and the completion remark, lines 734–737, p. 23.
- brinon-conrad: Exercise 1.4.4(2)–(3), lines 375–386, p. 10; Lemma 13.1.6 and its proof's appeal to Exercise 1.4.4, lines 8585–8589, p. 201.

## Not verifiable

- Serre, *Local Fields*: the manifest records it as uncertified (paywalled), so I cited it by locator without reading it. The locators are II §2 Prop. 3; III §6 Prop. 12; IV §1 Props. 1, 2 and 4; IV §3 Prop. 14 and Exercise 3; V §7 Theorem 1. I could not check whether tower transitivity is IV §3 Prop. 14 or the proposition after it. serre1961 n° 3.1 Prop. 4 is cited alongside and is verified.
- serre1961 line 1197 (proof of Prop. 8(i), p. 135) reads "corollaire 2 de la proposition 3", where the bound used is Corollary 2 of Proposition 7. Proposition 3 has a single corollary (line 638). The text is Numdam's OCR layer, and no OCR or PDF renderer is available here, so I cannot tell a printing slip from an OCR error. I do not list it below.

## Source issues

- none
