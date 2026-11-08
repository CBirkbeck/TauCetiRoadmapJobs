# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at 5e269b5)

**Verdict:** needs changes

This is a full review: the folder changed by 343 lines since 9157bb8. The pins are unchanged.

- **Gate.** I reran it at this head and every check passes (`set_option=0 … outside-folder=0 source-material=0 OK`).
- **Dependency check.** The output is `depcheck: 238 roadmaps, 2346 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/Suggested.lean` exits 0. The only output is six `declaration uses sorry` warnings, at lines 67, 116, 135, 156, 200 and 215.
- **Outside the folder.** `git diff --stat origin/main...HEAD` lists no file outside the folder.
- **Gaps.** There is no `design/plan.json`, so no gaps are declared.

There are five findings: one P2 and four P3.

## Previous findings (review at 9157bb8)

- **R01 (P2), §4a.1 was statable but called not statable: repaired.**
  - `Suggested.lean` lines 181–228 now define `absoluteUpperRamificationGroup K O u` with a real body. They state `absoluteUpperRamificationGroup_zero` and `map_restrictNormalHom_absoluteUpperRamificationGroup`.
  - The docstring (lines 29–49) and README lines 281–287 now name as not statable only wild inertia at `0+`, §4a.2 and §4a.3.
- **R02 (P2), two owners of the absolute upper groups of a local field: partly repaired.**
  - This folder did its half. README lines 748–754 add the local-field agreement ("the image of `G_K^u` in `Gal(M/K)` is `TauCeti.LocalFieldsRamification.upperRamificationGroup K M u`"). Lines 103–109 say a roadmap that uses the group "cites §4a.1 and does not define it a second time".
  - The ClassFieldTheory revision (#1411, head 71f458c) still claims ownership. This is raised again as R01 below.
- **R03 (P3), §F.3a was applied to `AlgebraicClosure K`: repaired.**
  - Conventions lines 132–139, the contract lines 245–253 and the new §4a.1 target "Transfer from the separable closure" (lines 756–774) apply §F.3a to `K^s = separableClosure K (AlgebraicClosure K)`.
  - The repair the previous review asked for has a defect of its own: part of what it asked the author to prove is already pinned (R02 below).
- **R04 (P3), dependency order and description: partly repaired.**
  - README lines 1018–1020 now add "ReductiveGroupsPartII §RG2.0.4 supplying §4a.3's `Breve E`".
  - The description's *Dependencies* paragraph still omits EtaleCohomologyFoundations §F.3a and ReductiveGroupsPartII §RG2.0.4. This is R05 below.

## R01 (P2) — The absolute upper groups of a nonarchimedean local field still have two owners, this roadmap and the ClassFieldTheory revision (#1411)

**Location.**
- README lines 103–104: "The absolute upper ramification groups of a nonarchimedean local field, at every real depth and in particular at the integer depths, are this roadmap's `G_K^u` (§4a.1)".
- The description: "#1411 consumes its §4a.1 absolute filtration".

**Claim.**
- At #1411's head (71f458c), ClassFieldTheory still owns and builds the same object.
  - It defines `absoluteUpperRamificationGroup K n` (Layer 7) on local fields.
  - It proves closedness, normality, antitonicity, the finite projections and `G_K^0 = inertiaSubgroup` itself (`TauCetiRoadmap/ClassFieldTheory/README.md` lines 1449–1458).
- These are §4a.1's claims at integer depths. So the object has no single owner, and the description's "consumes" is not true at #1411's head.

**Witness.**
- `TauCetiRoadmap/ClassFieldTheory/README.md` line 179 at #1411: "The absolute upper ramification groups of a nonarchimedean local field are owned here (Layer 7, `absoluteUpperRamificationGroup`)".
- The same file's `Suggested.lean`, line 1459, has `noncomputable def absoluteUpperRamificationGroup (n : ℕ)`.

**Repair.** This folder needs no further change. The change is in #1411, which this roadmap precedes.
1. Replace "are owned here (Layer 7, `absoluteUpperRamificationGroup`)" with a citation of RamificationOfCompleteDiscretelyValuedFields §4a.1.
2. Delete Layer 7's targets `isClosed_absoluteUpperRamificationGroup`, `absoluteUpperRamificationGroup_normal`, `absoluteUpperRamificationGroup_antitone`, `map_restrictNormalHom_absoluteUpperRamificationGroup` and `absoluteUpperRamificationGroup_zero` as targets, and cite §4a.1 for them.
3. Keep the definition in its `Suggested.lean` only as far as its reciprocity headline needs it. Its docstring should say that it is §4a.1's `G_K^n`, restricted to integer depths through §4a.1's local-field agreement.

Until then, the description should not say that #1411 consumes §4a.1.

**Tested.** On `ℚ_2` at the level `M = ℚ_2(ζ_8)`, with lower groups of orders `4, 4, 2, 2, 1`, the two definitions give the same groups:

| `n` | #1411's `G_K^n` | §4a.1's `G_K^n` |
|---|---|---|
| 1 | `G` | `G_(ψ(1)) = G_1 = G` |
| 2 | `{1, 5}` | `G_(ψ(2)) = G_3 = {1, 5}` |
| 3 | `1` | `G_(ψ(3)) = G_7 = 1` |

They are one object with two owners.

## R02 (P3) — §4a.1's "Transfer from the separable closure" restates a pinned Tau Ceti isomorphism

**Location.**
- README lines 756–758: "Prove that restriction to `K^s = separableClosure K (AlgebraicClosure K)` is an isomorphism of topological groups `G_K → Gal(K^s/K)`".
- Conventions line 140: "Restriction to `K^s` identifies `G_K` with `Gal(K^s/K)` (§4a.1)".
- Proof line 784: "`G_K` being compact (through the transfer, `Gal(K^s/K)` is profinite)".

**Claim.** The pinned Tau Ceti already provides all three, for every field `K`:
- the restriction isomorphism;
- its injectivity;
- compactness of `Field.absoluteGaloisGroup K`.

The roadmap reads this same file, and cites `TauCeti.fixingSubgroup_fixedField` from line 227, but restates the isomorphism as a target. The previous review asked for this restatement, and that request was wrong.

**Witness.** `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean`, at the pin:
- line 340: `TauCeti.absoluteGaloisGroupRestrictEquiv K : Field.absoluteGaloisGroup K ≃ₜ* AbsoluteGaloisGroup K`;
- line 346: its forward map is `restrictNormalHom (separableClosure K (AlgebraicClosure K))`;
- line 150: `TauCeti.separableClosureRestrictEquiv`;
- line 374: the `CompactSpace` instance.

**Repair.**
1. In the transfer target, delete the sentence about the topological isomorphism and its three-clause proof (lines 756–764, up to "in characteristic `p > 0`"). Replace it with "Restriction `G_K → Gal(K^s/K)` is Tau Ceti's `TauCeti.absoluteGaloisGroupRestrictEquiv`".
2. Keep as the target only the valuation-subring statements:
   - `O` over `O^s`;
   - stabilizers and residue actions;
   - the decomposition, inertia and wild-inertia correspondence.
3. Add `TauCeti.absoluteGaloisGroupRestrictEquiv`, `TauCeti.absoluteGaloisGroupRestrictEquiv_apply` and the instance `CompactSpace (Field.absoluteGaloisGroup K)` (same file) to the Tau Ceti contract and to §4a.1's *Needs*.
4. Change line 784 to "`G_K` being compact (Tau Ceti's instance)".
5. Drop from §4a.1's *Needs* the Mathlib names that only served the deleted proof: `separableClosure.isGalois`, `AlgEquiv.restrictNormalHom_surjective` and `instSubsingletonAlgHomOfIsPurelyInseparable`.

**Tested.**
- For `K = F_p(s)((t))` and `x = t^(1/p)`, the pinned injectivity is the README's argument: `σ(x)^p = t` forces `σ(x) = x`.
- For `K = F̄_p((t))`, both residue fields are `F̄_p`, so the valuation-subring part that remains a target is still needed and is unaffected.

## R03 (P3) — §3a.2 does not cite the pinned local-field Herbrand theorem and intersection formula

**Location.**
- The contract (lines 209–220) lists `Herbrand/Basic.lean`, `Herbrand/Tower.lean` and `Herbrand/Jump.lean` only.
- §3a.2's agreement bullet (lines 452–458) covers the functions and the upper groups, not the theorems.
- §4a.1's local-field proof (lines 799–802) re-derives the finite projections.

**Claim.**
- Herbrand's theorem, in both lower and upper numbering, and the intersection formula `H ∩ G^v = H^(ψ_(L/K)(v))` are proved in the pinned Tau Ceti for nonarchimedean local fields.
- The roadmap generalizes them and records that §3a.3 recovers `hasseArf`, but it neither cites nor recovers these. The Scope (lines 59–62) assigns them to the completed roadmap.

**Witness.**
- `TauCeti/NumberTheory/LocalField/Herbrand/UpperQuotient.lean`:
  - line 98: `TauCeti.LocalFieldsRamification.map_restrictNormalHom_upperRamificationGroup`;
  - line 129: `comap_restrictScalarsHom_upperRamificationGroup`;
  - line 264: `upperRamificationGroup_fixedField`.
- `Herbrand/Quotient.lean`, line 176: `map_restrictNormalHom_lowerRamificationGroupReal`.

**Repair.**
1. Add both files and these four names to the LocalFieldsRamification contract.
2. Add a §3a.2 Check, modelled on §3a.3's Check for `hasseArf`: on local fields, through the agreement, `upperRamificationGroup_quotient_eq_map` and the intersection formula specialize to `map_restrictNormalHom_upperRamificationGroup` / `upperRamificationGroup_fixedField` and `comap_restrictScalarsHom_upperRamificationGroup`.
3. Cite `map_restrictNormalHom_upperRamificationGroup` in §4a.1's local-field agreement and its *Needs*.

**Tested.** On `ℚ_2(ζ_8)` with `H = {1, 7}` and `v = 2`, both statements give the whole group:
- §3a.2's form gives `G^2 H/H = {1, 5}H/H = G/H`.
- The pinned form at `L = ℚ_2(√2)` gives `Gal(L/ℚ_2)^2`. The lower jump of `L/ℚ_2` is `2`, since `σ(√2) − √2 = −2√2` has valuation `3`, and `φ(2) = 2`, so this is the whole group.

## R04 (P3) — §4a.1 cites Serre 1961 n° 3.1 without its totally-ramified hypothesis, and a Lean docstring attributes a claim the source does not make

**Location.**
- README lines 776–778: "(… n° 3.1, the paragraph after Proposition 3, printed p. 128.)".
- `Suggested.lean` lines 178–180.
- `Suggested.lean` lines 212–214: "over an imperfect residue field the image can be a proper subgroup (Serre, *Sur les corps locaux …*, n° 3.1, the paragraph after Proposition 3, printed p. 128)".

**Claim.**
- n° 3.1 restricts to totally ramified extensions, so its passage to infinite extensions covers only totally ramified infinite `L/K`. It does not cover all of `G_K` over a perfect residue field.
- The README and Lean already add "for totally ramified `L/K`" at every other n° 3.1 citation (README lines 366 and 464, `Suggested.lean` lines 114 and 132), but not here.
- The paragraph says nothing about imperfect residue fields: its residue extensions are trivial.
- The transfer target (lines 756–774) has no locator of its own, and the one after it does not concern separable closures.

**Witness.**
- serre1961 lines 860–863: n° 3.1 assumes `L/K` totally ramified, with the same residue field.
- serre1961 lines 936–938: the limit definition for infinite Galois extensions, inside that number.

**Repair.**
1. Append "for totally ramified extensions" to the three n° 3.1 citations of §4a.1 (README line 778 and `Suggested.lean` lines 180 and 214).
2. Cite Serre, *Local Fields*, IV §3, Proposition 14 (already in the manifest) as the input for the general finite projections.
3. In `Suggested.lean` lines 212–213, end the sentence at "compactness of `G_K`". Support the imperfect-residue remark by the README's §4a.1 Check over `F_2(s)((t))` instead of by Serre.
4. Give the remaining transfer statements a locator of their own, or state that they follow from §F.3a's residue-field statement and the proof given.

**Tested.**
- The citation as repaired matches serre1961 lines 860–863 and 936–938.
- The imperfect-residue claim holds by the README Check at lines 830–833: `Gal(L₁/K)^(1/2) = 1`, so the image of `G_K^(1/2)` has order at most `2`, against `#Gal(M/K)^(1/2) = 4`.

## R05 (P3) — The description's *Dependencies* paragraph still omits two suppliers

**Location.** The description reads "Dependencies. Mathlib and Tau Ceti at the pins; the completed roadmaps LocalFieldsRamification, ProfiniteProPGroups and ProfiniteCohomology on main; and, for §3a.3's proalgebraic targets, ReductiveGroups Layer 3, …".

**Claim.** §4a.1 consumes EtaleCohomologyFoundations §F.3a, and §4a.3 consumes ReductiveGroupsPartII §RG2.0.4. Both are on main and named in README lines 1018–1020, but neither appears in the description. This is the unrepaired half of the previous R04.

**Witness.** README line 1019: "EtaleCohomologyFoundations §F.3a supplying §4a.1's trait inertia". The description has no such entry.

**Repair.** Add "EtaleCohomologyFoundations §F.3a (§4a.1) and ReductiveGroupsPartII §RG2.0.4 (§4a.3), both on main" to the description's *Dependencies*.

**Tested.** Both sections resolve on main:
- `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` line 776, with the valuation-subring inertia at line 810;
- `TauCetiRoadmap/ReductiveGroupsPartII/README.md` line 852.

## Verified sound

**Adversarial pass.** There are 32 rows, all computed in this review. Notation:
- `AS` is `y^p − y = t⁻¹` over `k((t))`.
- `Z8` is `ℚ_2(ζ_8)/ℚ_2`, with `#G_0..#G_4 = 4, 4, 2, 2, 1`.
- `Z9` is `ℚ_3(ζ_9)/ℚ_3`, with `#G_0..#G_3 = 6, 3, 3, 1`.
- `I2` is `M = F_2(s)((t))(y, w)`, the inseparable-residue example of the 3a.2 Check.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `absoluteUpperRamificationGroup_zero` (Lean 200) | `F̄_p((t))`, `O` the integral closure | every `Gal(M/K)_0 = Gal(M/K)` (residue field `F̄_p`); inertia acts trivially on `κ(O) = F̄_p`: both sides `G_K` | agrees | none |
| same | `ℚ_p`, Frobenius lift `F` | `F|ℚ_(p²) ≠ 1` while `G_0(ℚ_(p²)) = 1`; `F` acts on `F̄_p` by `x ↦ x^p`: `F` on neither side | agrees | none |
| same | `O = AlgebraicClosure K` (trivial) | `𝔪 = 0`, `G_0 = Ideal.inertia (𝔪^1) = 1` at each `M`; LHS `= {σ : σ|K^s = 1} = 1`; residue field `K̄`, inertia `1` | agrees (no hypothesis needed) | none |
| same | `K = ℚ`, `O` over `ℤ_(5)`, `M = ℚ(i)` | `5 = (2+i)(2−i)`, conjugation swaps them, `D_M = 1`; both sides lie in `D(O)`, and `D(O)|ℚ(i) = 1` | agrees | none |
| same, `ψ(0)` | trivial `C_2` on `ℤ_2`; `Z8` | integrand `1` on `(−1, 0]` and `≥ 1` below, so `φ(u) < 0` for `u < 0` and `φ(0) = 0`: `ψ(0) = 0`, upper `G^0 = G_0` | agrees | none |
| same, inseparable `x` | `F_p(s)((t))`, `x^p ∈ K^s` | `(σx − x)^p = σ(x^p) − x^p ∈ 𝔪 ⇒ σx − x ∈ 𝔪`; `σ(x)^p ∈ O ⇒ σ(x) ∈ O` | agrees | none |
| `absoluteUpperRamificationGroup` (Lean 181) | `Z8` at `u = 1, 2, 3` | `ψ(1) = 1`, `ψ(2) = 3`, `ψ(3) = 3 + 4·1 = 7`: images `G`, `{1,5}`, `1` | agrees with the Check (line 826) | none |
| same, wrong model `G_(φ(v))` | `Z8`, `v = 3` | `φ(3) = 2`: `G_2 = {1,5} ≠ G_7 = 1` | wrong model excluded by the Check | none |
| same, `u = −1` | `ℚ`, `O` over `ℤ_(5)`; complete `A` | `ψ(−1) = −1`, `G_(−1) = D_M`: `G_K^(−1) = D(O) ∌` conjugation; for complete `A`, `G_K` | agrees with line 734 (complete case) | none |
| `map_restrictNormalHom_…` (Lean 215) | `Z8`, `u = 3/2` | `ψ(3/2) = 2`: `G_2 = {1,5}` both sides | agrees | none |
| same | `M = K`; `u = −1` | `Gal(K/K) = 1` both; `G_(−1) = Gal(M/K)` both | agrees | none |
| same | `ℂ((t))`, `M = ℂ((t^(1/n)))` | `G_0 = μ_n`, `G_1 = 1`, `φ(u) = u/n`; `u = 0`: `G_K = Ẑ ↠ μ_n`; `u = 1/2`: `G_(⌈n/2⌉) = 1` both | agrees | none |
| same, perfectness dropped | `I2`, `u = 1/2` | `Gal(L₁/K)^(1/2) = (G/H)_1 = 1` (`σz − z = t`, `v = 1`); image `≤ Gal(M/L₁)`, order `2`; `Gal(M/K)^(1/2) = G_1`, order `4` | hypothesis needed | none |
| uniqueness of `O` (Lean 176) | `A` complete DVR | `O ⊇ Ā` (integrally closed), `Ā` of rank one, so its coarsenings are `Ā` and `K̄`; `K̄ ∩ K = K ≠ A`: `O = Ā` | agrees | none |
| Transfer (README 756) | `K = F̄_p((t))`, `t^(1/p)` | `d/dX(X^p − t) = 0`, so `t^(1/p) ∉ K^s`; restriction injective; both residue fields `F̄_p` | true; isomorphism pinned | R02 |
| local-field agreement (README 748) | `Z8` | §4a.1 images `G`, `{1,5}`, `1` at `u = 1, 2, 3` = `TauCeti.LocalFieldsRamification.upperRamificationGroup` (upper jumps `1, 2`) | agrees | R03 (citation) |
| #1411's `G_K^n` | `Z8`, `n = 1, 2, 3` | `G`, `{1,5}`, `1` in both | one object, two owners | R01 |
| Hilbert (Lean 67) | `Z9` | `5 + 2 + 2 = 9`; `σ_4`: `v(ζ_3 − 1) = 3`, so `i(σ_4) = 3`; `Σ_(σ≠1) i(σ) = 3·1 + 2·3 = 9`; `disc ℚ(ζ_9) = 3^9` | agrees | none |
| same | `Z8`; unramified `L` | `3 + 3 + 1 + 1 = 8 = v_2(2^8)`; `G_0 = 1`, `d = 0` | agrees | none |
| Herbrand (Lean 116) | `Z9`, `H = C_3` | `v ∈ (0, 1]`: `ψ(v) ∈ (0, 2]`, `G_(ψ(v)) = C_3 = H`, image `1`; `(G/H)^v = 1` (tame `C_2`); `v = 0`: `G/H` both | agrees | none |
| same, separability dropped | `I2`, `H = Gal(M/L₁)` | `(G/H)^(1/2) = 1`, `G^(1/2)H/H = G/H` | hypothesis needed | none |
| tower (Lean 135) | `Z9`, `u = 5` | `φ_G(5) = 2·(1/2) + 3·(1/6) = 3/2`; `φ_H(5) = 2 + 3/3 = 3`; `φ_(G/H)(3) = 3/2` | agrees | none |
| Hasse–Arf (Lean 156) | `Z9` | `j = 0`: `6 ∣ 0`; `j = 2`: `6 ∣ 3 + 3`; non-jump `j = 1`: `6 ∤ 3`, excluded by `hj` | agrees | none |
| same | `C_9` Check (line 690) | `j = 5`: `9 + 3·4 = 21`, `9 ∤ 21`, `φ(5) = 7/3` | correctly unrealizable | none |
| §4a.2 Check | `ℚ_3(ζ_3) ⊂ ℚ_3(ζ_9)` | `ψ_(M/K)(3/2) = 5`, `G_5 = 1`; `H^(3/2) = H_2 = H`; `ψ_H(3) = 5`, `H_5 = 1` | agrees | none |
| §4a.2 integral formula | unramified degree `f`; `ℚ_3(ζ_3)` | `(1/f)·f·u = u`; `[G : G^t] = 2`, `ψ = 2u`; derivative `e(L/K)·#(H ∩ G^t)/#G^t` on both sides | agrees | none |
| sampled: perfect-residue package | `AS`; `ζ_p` over `Frac W(F̄_p)`; `Z8` | `d = (p−1) + (p−1)`, break `1`; `d = p − 2`, break `0`; lower `1, 3` ↦ upper `φ(1) = 1`, `φ(3) = 8/4 = 2` | agrees | none |
| sampled: residue enlargement | `κ[[t]] → κ̄[[t]]`; Eisenstein `f`; `F_(p²)` | `t` stays a uniformizer; `𝔪_R′ = 𝔪_R R′` keeps `v(f(0)) = 1`; `F_(p²) ⊗ F̄_p ≅ F̄_p × F̄_p` splits | agrees | none |
| sampled: proalgebraic units | `E = F`; `AS` | `V = 1`, `π₀ = 1`; `π₀(V) ≅ H/[H,H] = C_p` (serre1961 line 638) | agrees | none |
| sampled: graded norms | tame `C_e`; `AS` | `u ↦ u^e`, kernel `μ_e`; `ψ(s) = es`, `H_(es) = 1` for `s ≥ 1`; `ψ(1) = 1`, `H_1/H_2 = C_p`; `ψ(2) = p + 1`, `H_(p+1) = 1` | agrees | none |
| sampled: `Breve E` agreement | `ℚ_p`; `F_q((t))`; `√p` | `K′ = W(F̄_p)[1/p]`; `Σ a_n tⁿ` with `F_q(a_n) = F_(q^(n!))` lies in `F̄_q((t))` but in no `F_(q^m)((t))`; `v(√p) = 1/2 ∉ ℤ` | agrees | none |
| §4a.1 tame Check | `K(ζ_p)`, `K = Frac W(F̄_p)` | `I_K ↠ C_(p−1)`; `P_K ↦ G_1 = 1` | agrees | none |

**Signatures.**
- I put `#check @` of all ten declarations into one scratch copy of the file and elaborated it once. The types match `signatures.md`, and no declaration depends on a section variable.
- The generality of each matches the README:
  - `absoluteUpperRamificationGroup_zero` has no hypothesis on `K` or `O` (README line 740).
  - `map_restrictNormalHom_…` assumes `IsDiscreteValuationRing`, `IsAdicComplete` and `PerfectField` on `O ∩ K` (README lines 736–739).
  - The Layer 3a theorems are as reviewed before: DVRs, `Algebra.IsInvariant`, `FaithfulSMul G B`, separable residue extension, and no completeness.

**Padding.** I made a scratch copy in which every `sorry` is replaced by a single `first | rfl | simp […] | infer_instance | aesop | exact le_antisymm (by simp) (by simp)`.
- All six theorems stay open, with "unsolved goals", "aesop failed" or "simp made no progress".
- The four definitions are the ones the theorems need. Nothing is padding.

**Headlines.**
- Stated:
  - Hilbert's formula (§3a.1);
  - Herbrand's theorem and tower transitivity (§3a.2);
  - lower-numbering Hasse–Arf (§3a.3);
  - `G_K^u`, `G_K^0 = I_K` and the finite projections (§4a.1).
- Named as not statable:
  - `G_K^(0+) = P_K`. The only pinned wild inertia is `TauCeti.wildInertiaSubgroup`, at `TauCeti/NumberTheory/LocalField/WildInertia.lean:251` under `IsNonarchimedeanLocalField` (line 126).
  - §4a.2.
  - §4a.3: the pinned `K^ur` is local-field only, and its completion is a construction.
- These reasons are accurate at the pins.

**Library declarations.**
- All 60 dotted names that the README backticks resolve by `#check @` at the pins. Among them are:
  - `separableClosure.isPurelyInseparable`, which needs `Algebra.IsAlgebraic`;
  - `separableClosure.isGalois`, which needs `Normal`;
  - `AlgEquiv.restrictNormalHom_surjective`;
  - `InfiniteGalois.restrictNormalHom_continuous`;
  - `IsAdicComplete.henselianRing` (Mathlib `RingTheory/Henselian.lean:154`);
  - `instSubsingletonAlgHomOfIsPurelyInseparable` (Mathlib `FieldTheory/PurelyInseparable/Basic.lean:407`).
- Opened by hand:
  - Mathlib `RingTheory/Valuation/RamificationGroup.lean` 34, 39, 49;
  - Tau Ceti `RingTheory/LocalRing/RamificationGroup.lean` 118 (`G_i = Ideal.inertia G (𝔪^((i+1).toNat))`, so `G_i = ⊤` for `i ≤ −1`), 260 (`ramificationGroup_zero_eq_inertiaSubgroup`, with no hypothesis on `A`), 351 and 722;
  - Tau Ceti `FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean` 150, 190, 227, 340, 346 and 374;
  - Tau Ceti `NumberTheory/LocalField/Herbrand/Basic.lean` 251, 258, 262 and 421;
  - Tau Ceti `Herbrand/Quotient.lean:176`;
  - Tau Ceti `Herbrand/UpperQuotient.lean` 98, 129 and 264;
  - Tau Ceti `Unramified/Inertia/SeparableClosure.lean:65`.

**Cross-roadmap citations resolved** (main 7bf4638; `roadmaps resolve` lists nothing):
- EtaleCohomologyFoundations §F.3a, line 776. It has a separable closure, residue field an algebraic closure of `k(s)` (line 782), and `inertia_eq_valuation_inertia` with decomposition group `Gal(η̄/η)` (line 810).
- ReductiveGroupsPartII §RG2.0.4, line 852: `Breve E` is `UniformSpace.Completion` of `TauCeti.maximalUnramifiedExtension E (AlgebraicClosure E)`.
- ReductiveGroups Layer 3 (line 234), SchemeAndStackFoundations §0.24 (line 1565) and AdicSpacesPartII §R0.19.9 (lines 292, 304).
- `Completed/LocalFieldsRamification`, `Completed/LocalGaloisGroups`, `Completed/ProfiniteProPGroups` and `TauCetiRoadmap/ProfiniteCohomology`.

All are on main, so all are permitted suppliers.

**Ownership against open pull requests.**
- The following cite this roadmap's sections and do not define its objects:
  - ArithmeticGaloisRepresentations (#856), lines 444 and 2704;
  - PadicPeriodRings (#940), line 32;
  - FieldOfNorms (#1812), line 115;
  - FilteredLocalGaloisGroups (#1795), line 94;
  - the LocalFieldsRamification revision (#617), line 38.
- The only second owner is ClassFieldTheory #1411 (R01).
- `roadmaps overlaps` reports that no open pull request changes this roadmap or drops an id it cites.
- No `Suggested.lean` I can read declares a fully qualified name of this file. #1411 uses the namespace `TauCetiRoadmap.ClassFieldTheory`.

**Sources: the seeded sample.** Every locator was checked against the cached text.
- **The perfect-residue Herbrand package.**
  - serre1961 n° 3.1, formula (5) and properties a–d′, lines 897–926, pp. 127–128.
  - Props. 3–4 and the Remarque, lines 931–950, p. 128.
  - n° 3.4–3.5, below.
  - brinon-conrad Exercise 1.4.4(3), lines 382–386, p. 10, for `p`-adic fields (Definition 1.3.1, line 259: characteristic `0`, perfect residue field).
- **Residue enlargement.**
  - ega3 (10.3.1), lines 637–639, p. 20: flat local `A → B` with `B/𝔪B ≅ K`.
  - (10.3.1.5) and the completion remark, lines 734–737, p. 23.
- **Proalgebraic units.**
  - serre1961 §1, n° 1.1–1.6, lines 74–365, pp. 106–113.
  - n° 2.1 starts at line 557, p. 118.
  - Props. 1–2 with their Corollaries and the Remarque, lines 585–621, p. 119.
  - Prop. 3 with its Corollary, lines 630–639, p. 120.
  - serre1960 (printed page = text page + 1):
    - Definition 2, line 162, p. 8;
    - Prop. 10, line 313, p. 11;
    - Props. 6–7, lines 546 and 575, pp. 17–18;
    - Prop. 10 with Corollaries 1–2, lines 625–636, p. 19;
    - n° 5.1 Props. 1–2 and right exactness of `π₀`, lines 1246–1261, p. 35.
- **Graded norms.**
  - serre1961 Prop. 6(a)–(b) with sequence (20), lines 1092–1099, p. 132.
  - Prop. 7 with (22)–(23) and Corollaries 1–3, lines 1150–1184, pp. 134–135.
  - Prop. 8(i)–(iii), lines 1187–1212, p. 135.
  - Corollary 1, lines 1224–1232, p. 136.
- **Transfer from the separable closure.**
  - Its only locator, serre1961 lines 936–938, concerns totally ramified infinite extensions, not separable closures (R04).
  - Its group part is pinned (R02).
- **Agreement with `Breve E`.** brinon-conrad Exercise 1.4.4(2)–(3), lines 378–386, p. 10, with the non-completeness for non-algebraically-closed `k` at line 380. Lemma 13.1.6, whose proof appeals to Exercise 1.4.4, is at lines 8585–8589, p. 201.

## Not verifiable

- Serre, *Local Fields* (`serre-local-fields`) is recorded in the manifest as uncertified (paywalled). I cited it by locator without reading it: II §2 Prop. 3; III §6 Prop. 12; IV §1 Props. 1, 2 and 4; IV §3 Prop. 14 and Exercise 3; V §7 Theorem 1.
- serre1961 line 1197 (proof of Prop. 8(i), p. 135) refers to "corollaire 2 de la proposition 3", but the bound used is Corollary 2 of Proposition 7, and Proposition 3 has a single corollary (line 638). The text is Numdam's OCR layer and no renderer is available here, so I cannot tell a printing slip from an OCR error.

## Source issues

- none
