# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at 4afb43d)

**Verdict:** needs changes

This is a full review: the folder changed by 198 lines since 5e269b5. The pins are unchanged.

- **Gate.** I reran it at this head and every check passes (`set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`).
- **Dependency check.** The output is `depcheck: 239 roadmaps, 2352 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The roadmap is line 2 of the merge order, right after its only listed predecessor, JacobianChallenge.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/Suggested.lean` exits 0. The only output is six `declaration uses sorry` warnings, at lines 67, 116, 135, 156, 200 and 216.
- **Outside the folder.** `git diff --stat origin/main...HEAD` lists no file outside the folder.
- **Gaps.** There is no `design/plan.json`, so no gaps are declared.

There are three findings: two P2 and one P3. Both P2 findings are ownership conflicts with other open pull requests. R01 needs no change in this folder. R02 needs a short addition here, plus a citation in the other roadmap.

## Previous findings (review at 5e269b5)

- **R01 (P2), the absolute upper groups of a local field have two owners: not repaired.**
  - ClassFieldTheory #1411 is still at head 71f458c. `TauCetiRoadmap/ClassFieldTheory/README.md` lines 177–179 there still read "are owned here (Layer 7, `absoluteUpperRamificationGroup`)".
  - The description still says "#1411 consumes its §4a.1 absolute filtration".
  - This is raised again as R01 below.
- **R02 (P3), the transfer restated a pinned isomorphism: repaired.**
  - README lines 822–824 now read "Restriction `G_K → Gal(K^s/K)` is Tau Ceti's `TauCeti.absoluteGaloisGroupRestrictEquiv`, an isomorphism of topological groups for every field `K`". Only the valuation-subring statements remain targets.
  - The Tau Ceti contract (lines 197–206), the Conventions (lines 149–153) and the §4a.1 *Needs* (lines 879–880) cite `TauCeti.absoluteGaloisGroupRestrictEquiv`, `TauCeti.absoluteGaloisGroupRestrictEquiv_apply` and the `CompactSpace` instance.
  - Line 842 says "Tau Ceti's instance `CompactSpace (Field.absoluteGaloisGroup K)`".
  - `separableClosure.isGalois` and `instSubsingletonAlgHomOfIsPurelyInseparable` are gone from the *Needs*.
- **R03 (P3), the pinned local-field Herbrand theorems were not cited: repaired.**
  - The LocalFieldsRamification contract (lines 242–254) adds `Herbrand/Quotient.lean`, `Herbrand/Tower.lean` and `Herbrand/UpperQuotient.lean` with the five theorem names.
  - §3a.2's agreement bullet (lines 497–500) and its new Check (lines 575–590) specialize the general statements to them.
  - §4a.1's proof (lines 861–863) cites `TauCeti.LocalFieldsRamification.map_restrictNormalHom_upperRamificationGroup`.
- **R04 (P3), the n° 3.1 citations lacked "for totally ramified": repaired.**
  - README line 810 and `Suggested.lean` lines 85, 101 and 180 now append "for totally ramified extensions".
  - `Suggested.lean` lines 210–215 now cite *Local Fields* IV §3, Proposition 14 and give the `F_2(s)((t))` counterexample instead of Serre.
  - README lines 834–836 say the transfer statements "are not taken from a source", with their proof given.
- **R05 (P3), the description omits two suppliers: not repaired.**
  - The description's *Dependencies* paragraph is unchanged.
  - This is raised again as R03 below.

## R01 (P2) — ClassFieldTheory #1411 still owns the absolute upper groups of a local field that §4a.1 owns

**Location.**
- README lines 112–118: "The absolute upper ramification groups of a nonarchimedean local field, at every real depth and in particular at the integer depths, are this roadmap's `G_K^u` (§4a.1)".
- The description: "#1411 consumes its §4a.1 absolute filtration".

**Claim.**
- At #1411's head (71f458c, unchanged since the previous review), ClassFieldTheory Layer 7 defines `absoluteUpperRamificationGroup K n` on local fields.
- It also states as its own targets closedness, normality, antitonicity, the finite projections and `G_K^0 = inertiaSubgroup`. These are §4a.1's statements at integer depths.
- On main (fb99861), ClassFieldTheory does not define these groups. The conflict is only with the revision.
- This folder already does its part: it claims the object and tells users to cite §4a.1. The object still has two owners, though, and the description's "consumes" is false at #1411's head.

**Witness.**
- `TauCetiRoadmap/ClassFieldTheory/README.md` at #1411, lines 177–179: "The absolute upper ramification groups of a nonarchimedean local field are owned here (Layer 7, `absoluteUpperRamificationGroup`)".
- The same file, lines 1449–1458; and its `Suggested.lean`, line 1459: `noncomputable def absoluteUpperRamificationGroup (n : ℕ)`.

**Repair.** No change in this folder. The repair is in #1411, which comes after this roadmap:
1. Replace "are owned here (Layer 7, `absoluteUpperRamificationGroup`)" with a citation of RamificationOfCompleteDiscretelyValuedFields §4a.1.
2. Delete as targets `isClosed_absoluteUpperRamificationGroup`, `absoluteUpperRamificationGroup_normal`, `absoluteUpperRamificationGroup_antitone`, `map_restrictNormalHom_absoluteUpperRamificationGroup` and `absoluteUpperRamificationGroup_zero`, and cite §4a.1 for them.
3. Keep the definition only as far as the reciprocity headline needs it. Its docstring should say that it is §4a.1's `G_K^n`, through §4a.1's local-field agreement.

Until #1411 does this, the description should say that #1411 *is to cite* §4a.1, not that it consumes it.

**Tested.** On `ℚ_2` at `M = ℚ_2(ζ_8)`, with lower groups of orders `4, 4, 2, 2, 1`, `φ` has slopes `1, 1/2, 1/4` with breaks at `1` and `3`. So `ψ(1) = 1`, `ψ(2) = 3` and `ψ(3) = 7`. Both definitions give the same groups:

| `n` | #1411's `G_K^n` (local-field `Gal(M/K)^n`) | §4a.1's image of `G_K^n` |
|---|---|---|
| 1 | `G` | `G_1 = G` |
| 2 | `{1, 5}` | `G_3 = {1, 5}` |
| 3 | `1` | `G_7 = 1` |

## R02 (P2) — PadicExtensionFamilies (#1713) also builds §4a.2's non-Galois `ψ_(L/K)` on local fields

**Location.**
- README lines 52–54 (Scope): this roadmap owns "the transition function `ψ_(L/K)` of a finite separable extension, its independence of the Galois closure, the tower law, the open-subgroup identity … and the integral formula".
- §4a.2, lines 923–931, defines `ψ_(L/K) = φ_(M/L) ∘ ψ_(M/K)` over every complete discretely valued field with perfect residue field. Every nonarchimedean local field is such a field.

**Claim.**
- PadicExtensionFamilies (#1713, a new roadmap at head f85522c, line 394 of the merge order) defines the same function on nonarchimedean local fields.
- It also proves the same statements: independence of `M`, the tower law, the finite-level subgroup identity and the integral formula.
- It claims them as its own and never mentions this roadmap. The object has two owners.
- The previous review recorded "PadicExtensionFamilies (#1713) works only on local fields" and moved on. That doesn't settle it, because §4a.2 includes local fields. The pinned Tau Ceti has only the Galois Herbrand functions, so the non-Galois `ψ_(L/K)` of a local field is not the completed roadmap's either.

**Witness.** `TauCetiRoadmap/PadicExtensionFamilies/README.md` at #1713:
- line 275: "The non-Galois Herbrand construction is §2.0 here";
- lines 713–716: "define `ψ_{L/K} := φ_{M/L} ∘ ψ_{M/K}` … Prove independence of `M`";
- lines 721–725: the tower law, `Gal(M/L) ∩ Gal(M/K)^u = Gal(M/L)^{ψ_{L/K}(u)}`, and the integral formula.

**Repair.** This roadmap comes first in the merge order, so it is the owner. In this folder:
1. In §4a.2, add the finite-level forms as targets. For every finite Galois `M ⊇ L`:
   - `Gal(M/L) ∩ Gal(M/K)^u = Gal(M/L)^(ψ_(L/K)(u))` for `u ≥ −1`;
   - `ψ_(L/K)(u) = (1/f) ∫_0^u [Gal(M/K) : Gal(M/K)^t Gal(M/L)] dt` for `u ≥ 0`.

   The proof already derives both (lines 942–948).
2. In the Scope, after line 118, add: "The function `ψ_(L/K)` of a finite separable, not necessarily Galois, extension of nonarchimedean local fields, with its independence of the Galois closure, its tower law, the finite-level subgroup identity and the integral formula, is §4a.2's, read through §3a.2's agreement; a roadmap that uses it on local fields cites §4a.2 and does not define it a second time."
3. Add PadicExtensionFamilies (§2.0, polygon-to-break dictionary) to *Downstream consumers*.

In #1713: replace §2.0's construction and line 275's ownership sentence with a citation of RamificationOfCompleteDiscretelyValuedFields §4a.2. Its orbit-count function (§2.1) can stay there as a consumer.

**Tested.** Take `K = ℚ_3`, `L = ℚ_3(ζ_3)`, `M = ℚ_3(ζ_9)`.
- Lower groups of `M/K`: `#G_0 = 6`, `#G_1 = #G_2 = 3`, `G_3 = 1`, since `v_M(ζ_3 − 1) = 3`. So `ψ_(M/K)(v) = 2v` on `[0, 1]` and `2 + 6(v − 1)` after.
- For `H = Gal(M/L)`: `H_0 = H_1 = H_2 = H` and `H_3 = 1`, so `φ_(M/L)(u) = u` on `[0, 2]` and `2 + (u − 2)/3` after.
- Both definitions give `ψ_(L/K)(1) = φ_(M/L)(2) = 2` and `ψ_(L/K)(3/2) = φ_(M/L)(5) = 3`, that is, `2u`.
- The finite identity at `u = 1`: `G_(ψ(1)) ∩ H = G_2 ∩ H = H` and `H^2 = H_2 = H`.
- At `u = 3/2`: `G_5 ∩ H = 1` and `H^3 = H_(ψ_H(3)) = H_5 = 1`.
- The integral: `G^t ⊆ H` for `t > 0`, so the index is `2`, `f = 1`, and `ψ = 2u`.

## R03 (P3) — The description's *Dependencies* paragraph still omits two suppliers

**Location.** The description: "Dependencies. Mathlib and Tau Ceti at the pins; the completed roadmaps LocalFieldsRamification, ProfiniteProPGroups and ProfiniteCohomology on main; and, for §3a.3's proalgebraic targets, ReductiveGroups Layer 3, SchemeAndStackFoundations §0.24 and AdicSpacesPartII §R0.19.9".

**Claim.** §4a.1 consumes EtaleCohomologyFoundations §F.3a, and the §4a.3 agreement consumes ReductiveGroupsPartII §RG2.0.4. Both are on main and named in README lines 1088–1089, but the description lists neither. This repeats R05 of the previous review.

**Witness.** README line 1088: "EtaleCohomologyFoundations §F.3a supplying §4a.1's trait inertia". The description has no such entry.

**Repair.** Add "EtaleCohomologyFoundations §F.3a (§4a.1) and ReductiveGroupsPartII §RG2.0.4 (§4a.3), both on main" to the description's *Dependencies*.

**Tested.** Both sections resolve on main (fb99861):
- `TauCetiRoadmap/EtaleCohomologyFoundations/README.md`: the section is at line 776, the residue field of the normalization is an algebraic closure (line 782), and `inertia_eq_valuation_inertia` is at line 810.
- `TauCetiRoadmap/ReductiveGroupsPartII/README.md`: the section is at line 852, and `Breve E` is `UniformSpace.Completion (Unramified E)` with `Unramified E = TauCeti.maximalUnramifiedExtension E (AlgebraicClosure E)` (lines 857–860).

## Verified sound

**Adversarial pass.** There are 34 rows, all recomputed for this review. Notation:
- `Z8` is `ℚ_2(ζ_8)/ℚ_2`, with `#G_0..#G_4 = 4, 4, 2, 2, 1`.
- `Z9` is `ℚ_3(ζ_9)/ℚ_3`, with `#G_0..#G_3 = 6, 3, 3, 1`.
- `S3` is `ℚ_3(ζ_3, ∛3)/ℚ_3`, totally ramified with group `S_3`. Over `K′ = ℚ_3(ζ_3)` the Kummer extension by `∛3` (`v_(K′)(3) = 2`, prime to `3`) has break `3·2/2 = 3`. So `G_0 = S_3`, `G_1 = G_2 = G_3 = C_3` and `G_4 = 1`.
- `AS` is `y^p − y = t⁻¹` over `k((t))`.
- `I2` is `M = F_2(s)((t))(y, w)` with `y² − y = s t⁻²` and `w² − w = t⁻¹`, and `L₁ = K(y)`.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Hilbert (Lean 67) | `Z9` | `5 + 2 + 2 = 9`; `σ_4`: `v(ζ_3 − 1) = 3`; `Σ_(σ≠1) i(σ) = 3·1 + 2·3 = 9`; `disc ℚ(ζ_9) = 3^(3(6−2−1)) = 3^9`, `f = 1` | agrees | none |
| same | `S3` (non-abelian) | `5 + 2 + 2 + 2 = 11`; tower: `d(L/K′) + e·d(K′/ℚ_3) = 2·4 + 3·1 = 11` | agrees | none |
| same | `G = 1`, `B = A` | different `⊤ = 𝔪^0`; `Σᶠ = 0` | agrees | none |
| `herbrandFun` (Lean 86) | `Z8` | slopes `1, 1/2, 1/4`: `φ(1) = 1`, `φ(3) = 2`, `φ(7) = 3` | agrees with the Checks | none |
| same, below `−1` | unramified quadratic | integrand `2` on `(−2, −1]`, `1` on `(−1, 0]`: `φ(−2) = −3`, `ψ(−2) = −3/2` | statements restricted to `≥ −1` | none |
| same, non-faithful | trivial `C_2` on `ℤ_2` | all `G_i = C_2`, integrand `1`: `φ = id` | agrees with Check | none |
| `inverseHerbrandFun` (Lean 95) | finite `G` | integrand `≥ 1/#G_0 > 0`, so `{u : v ≤ φ(u)} = [φ⁻¹(v), ∞)` and `ψ(0) = 0`, `ψ(−1) = −1` | agrees | none |
| `upperRamificationGroup` (Lean 102) | `Z8`, `v = 3` | `G^3 = G_(ψ(3)) = G_7 = 1`, while `G_3 = {1, 5}` | wrong model `G_v` excluded | none |
| Herbrand (Lean 116) | `S3`, `H = C_3` | `v = 0`: `G^0 = S_3 ↦ C_2 = (G/H)^0`; `v ∈ (0, 3/2]`: `G^v = C_3 ↦ 1`, `(G/H)^v = (G/H)_(2v) = 1` | agrees | none |
| same | `Z8`, `H = {1, 7}`, `v = 2` | `G^2 = G_3 = {1, 5} ↦ G/H`; `(G/H)^2 = (G/H)_2 = G/H` (`v(2√2) = 3`) | agrees | none |
| same, separability dropped | `I2`, `H = Gal(M/L₁)` | all `i(σ) = 2` in `M`; `(G/H)_1 = 1` (`σz − z = t`, `v_(L₁) = 1`); `(G/H)^(1/2) = 1` vs `G^(1/2)H/H = G/H` | hypothesis needed | none |
| tower (Lean 135) | `Z9`, `u = 5` | `φ_G(5) = 1 + 3/6 = 3/2`; `φ_H(5) = 2 + 1 = 3`; `φ_(G/H)(3) = 3/2` | agrees | none |
| same | `S3`, `u = 5` | `φ_G(5) = 3/2 + 2/6 = 11/6`; `φ_H(5) = 3 + 2/3 = 11/3`; `φ_(G/H)(11/3) = 11/6` | agrees | none |
| same, order of composition | `Z8`, `L = ℚ_2(√2)` | `ψ_(L/K)(3) = 4`, `ψ_(M/L)(4) = 7 = ψ_(M/K)(3)`; reversed: `ψ_(L/K)(5) = 8` | agrees with Check | none |
| intersection (README 490) | `S3`, `v = 1, 2` | `G^1 = G_2 = C_3`, `H^(ψ_(G/H)(1)) = H^2 = H`; `G^2 = G_6 = 1`, `H^4 = H_4 = 1` | agrees | none |
| Hasse–Arf (Lean 156) | `Z9` | jump `j = 0`: `6 ∣ 0`; jump `j = 2`: `6 ∣ 3 + 3`; non-jump `j = 1`: `6 ∤ 3`, excluded by `hj` | agrees | none |
| same, commutativity dropped | `S3` | jump `j = 3`: `Σ_(i=1..3) #G_i = 9`, `6 ∤ 9`; upper jump `3/2` | `IsMulCommutative` needed | none |
| same | `C_9` filtration (Check, line 749) | `j = 5`: `9 + 3·4 = 21`, `9 ∤ 21`, `φ(5) = 7/3` | correctly unrealizable | none |
| `absoluteUpperRamificationGroup` (Lean 181) | `ℚ_2`, level `Z8`, `u = 1, 2, 3` | `G`, `{1, 5}`, `1` (as in R01's table) | agrees with Check (line 891) | none |
| `absoluteUpperRamificationGroup_zero` (Lean 200) | `O = AlgebraicClosure K` | `𝔪 = 0`, each `G_0 = 1` (faithful); residue field `K̄`, inertia `1` | agrees | none |
| same | `K = ℚ`, `O` over `ℤ_(5)`, `M = ℚ(i)` | `5 = (2 + i)(2 − i)`, conjugation swaps them: `D_M = 1`; both sides lie in `D(O)` | agrees | none |
| same | `ℚ_p`, Frobenius lift | acts on `F̄_p` by `x ↦ x^p`, and `ℚ_(p²) ⊄` its fixed field: on neither side | agrees | none |
| same, inseparable `x` | `F_p(s)((t))`, `x^q ∈ K^s` | `σ(x)^q = σ(x^q) ∈ O ⇒ σx ∈ O`; `(σx − x)^q = σ(x^q) − x^q ∈ 𝔪 ⇒ σx − x ∈ 𝔪` | agrees | none |
| finite projections (Lean 216) | `Z8`, `u = 3/2`, `u = −1` | `ψ(3/2) = 2`, `G_2 = {1, 5}` on both sides; `u = −1`: `D_M = Gal(M/K)` on both sides | agrees | none |
| same, perfectness dropped | `I2`, `u = 1/2` | `Gal(L₁/K)^(1/2) = G_(ψ(1/2) = 1) = 1`, so the image is `≤ Gal(M/L₁)`, of order `2`; `Gal(M/K)^(1/2) = G_1`, of order `4` | hypothesis needed | none |
| `G_K^(0+) = P_K` (README 803) | any level `M` | for small `w > 0`, `Gal(M/K)^w = G_(⌈ψ(w)⌉) = G_1`; both are closed with image `G_1` at every level | agrees | none |
| transfer (README 822) | `F̄_p((t))`, `t^(1/p)` | `X^p − t` has derivative `0`, so `t^(1/p) ∉ K^s`; `O = {x : x^(p^n) ∈ O^s}`; both residue fields `F̄_p` | agrees | none |
| §4a.2 (README 923), Check | `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ Z9` | `ψ_(M/K)(3/2) = 5`, `G_5 = 1`; `H^(3/2) = H_2 = H`; `H^3 = H_5 = 1` | agrees | R02 |
| §4a.2 integral formula | unramified degree `f`; `ℚ_3(ζ_3)` | `(1/f)·f·u = u`; index `2`, `ψ = 2u` | agrees | R02 |
| §4a.3 base change | `Z9` | `e = 6`, `#G_i = 6, 3, 3, 1`, `d = 9`, `d/e = 3/2`, upper jumps `φ(0) = 0`, `φ(2) = 1` | agrees | none |
| sampled: perfect-residue package | `AS`; `ζ_p` over `Frac W(F̄_p)`; `Z8` | `σ(y⁻¹) − y⁻¹ = −1/(y(y + 1))`, valuation `2`: `d = 2(p − 1)`, break `1`; Eisenstein degree `p − 1`, `d = p − 2`; lower `1, 3` ↦ upper `1, 2` | agrees | none |
| sampled: residue enlargement | `κ[[t]] → κ̄[[t]]`; Eisenstein `f`; `F_(p²)` | `t` stays a uniformizer; `𝔪_(R′) = 𝔪_R R′` keeps `v(f(0)) = 1`; `F_(p²) ⊗ F̄_p ≅ F̄_p × F̄_p` splits | agrees | none |
| sampled: proalgebraic units, graded norms | `E = F`; tame `C_e`; `AS` | `V = 1`; `u ↦ u^e` with kernel `μ_e`, `ψ(s) = es`, `H_(es) = 1` for `s ≥ 1`; `AS`: `ψ(1) = 1`, `H_1/H_2 = C_p`, `ψ(2) = p + 1`, `H_(p+1) = 1`, `π₀(V) ≅ H/[H, H] = C_p` | agrees | none |
| sampled: `Breve E` agreement | `ℚ_p`; `F_q((t))`; `√p` | `K′ = W(F̄_p)[1/p]`; `Σ a_n tⁿ` with `[F_q(a_n) : F_q] = n!` lies in `F̄_q((t))` but in no `F_(q^m)((t))`; `v(√p) = 1/2 ∉ ℤ` | agrees | none |

**Signatures.** I added `#check @` of all ten declarations to one scratch copy of the file and elaborated it once.
- The types match `signatures.md`. The file has no `variable` block, so no section binder can be lost.
- The generality of each matches the README:
  - the Layer 3a theorems: discrete valuation rings, `Algebra.IsInvariant`, `FaithfulSMul G B`, separable residue extension, and no completeness;
  - `absoluteUpperRamificationGroup_zero`: no hypothesis on `K` or `O`;
  - the finite projections: `IsDiscreteValuationRing`, `IsAdicComplete` and `PerfectField` on `O ∩ K`.

**Padding.** In a scratch copy I replaced every `sorry` with `first | rfl | simp | infer_instance | aesop | norm_num | exact le_antisymm (by simp) (by simp)`.
- All six theorems stay open ("unsolved goals").
- The four definitions are the ones the theorems need. Nothing is padding.

**Headlines.**
- Stated:
  - Hilbert's formula (§3a.1);
  - Herbrand's theorem and tower transitivity (§3a.2);
  - lower-numbering Hasse–Arf (§3a.3);
  - `G_K^u`, `G_K^0 = I_K` and the finite projections (§4a.1).
- Named in the module docstring as not statable:
  - `G_K^(0+) = P_K`: the only pinned wild inertia is `TauCeti.wildInertiaSubgroup`, which assumes `IsNonarchimedeanLocalField`;
  - §4a.2, the reason the previous review asked for;
  - §4a.3: `TauCeti.maximalUnramifiedExtension` is local-field only.
- These reasons are accurate at the pins.

**Library declarations.** 84 of the 85 dotted or Lean-style names the README backticks resolve by `#check @` at the pins. The 85th, `v_L`, is notation. Opened by hand:
- Tau Ceti `FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean`:
  - line 327: `AbsoluteGaloisGroup K := Gal(SeparableClosure K/K)`;
  - line 340: `absoluteGaloisGroupRestrictEquiv`, `≃ₜ*`;
  - line 346: `_apply`, by `restrictNormalHom (separableClosure K (AlgebraicClosure K))`;
  - line 374: `CompactSpace`.
- Mathlib `FieldTheory/IsSepClosed.lean` line 348: `SeparableClosure F := separableClosure F (AlgebraicClosure F)`.
- Tau Ceti `NumberTheory/LocalField/Herbrand/`:
  - `UpperQuotient.lean` lines 98 and 129, and line 264, which is in namespace `Subgroup` (line 215), so `Subgroup.upperRamificationGroup_fixedField` is the right name;
  - `Tower.lean` lines 199, 216 and 226;
  - `Quotient.lean` line 176;
  - `HasseArf/Abelian.lean` line 50 (`hasseArf`, which assumes `IsAbelianGalois`).
- Tau Ceti `RingTheory/LocalRing/RamificationGroup.lean` lines 118, 145, 166, 183, 220, 233, 260, 325, 351, 444, 469, 520, 561 and 722.
- `TauCeti.IsDiscreteValuationRing.exists_adjoin_eq_top` assumes `Module.Finite`, matching README line 373, "finite faithful".

**Duplication by object.**
- The pinned Hilbert formulas are instances on other carriers, not the general statement of `differentIdeal_eq_pow_maximalIdeal_of_separable_residue`:
  - `TauCeti.Place.differentExponent_eq_finsum_card_ramificationGroup_sub_one` (`FieldTheory/FunctionField/Different/Hilbert.lean:159`, function-field places);
  - `IsDedekindDomain.HeightOneSpectrum.multiplicity_differentIdeal_eq_finsum_card_ramificationGroup_sub_one` (`NumberTheory/NumberField/LocalGlobal/Different/Exponent.lean:239`, number fields).
- The pinned graded maps `TauCeti.tameCharacter` and `TauCeti.ramificationGroupGradedToResidueField` assume `IsNonarchimedeanLocalField`, so §3a.1's local-ring versions are not at the pin.
- No Herbrand function on the local-ring carrier exists at the pin.

**Cross-roadmap citations resolved** (main fb99861; `roadmaps resolve` lists nothing; `roadmaps overlaps` finds no pull request that changes this roadmap or drops an id it cites):
- EtaleCohomologyFoundations §F.3a, lines 776, 782 and 810. The revision #1891 keeps the section, at line 1141 of its head.
- ReductiveGroupsPartII §RG2.0.4, lines 852–860.
- ReductiveGroups Layer 3 (line 234), SchemeAndStackFoundations §0.24 (line 1565) and AdicSpacesPartII §R0.19.9 (lines 292 and 304).
- `Completed/LocalFieldsRamification`, `Completed/LocalGaloisGroups`, `Completed/ProfiniteProPGroups` and `TauCetiRoadmap/ProfiniteCohomology`.

All are on main, so all are permitted suppliers.

**Ownership against open pull requests.** I checked with `roadmaps grep` and the sibling checkouts.
- These cite this roadmap's sections and do not define its objects:
  - LocalFieldsRamification #617, line 39;
  - ArithmeticGaloisRepresentations #856, lines 294 and 2704;
  - PadicPeriodRings #940, lines 9 and 32;
  - FilteredLocalGaloisGroups #1795, lines 52 and 146;
  - FieldOfNorms #1812, lines 69–70. Its APF `ψ_(L/K)` concerns infinite extensions, a different object.
- The second owners are ClassFieldTheory #1411 (R01) and PadicExtensionFamilies #1713 (R02).
- No `Suggested.lean` I can read declares a fully qualified name of this file.

**Sources: the seeded sample.** Every locator was checked against the cached text.
- serre1961 is the Numdam scan: printed page = PDF page + 103. In this paper "corps local" means a complete discretely valued field (line 28).
- **The perfect-residue Herbrand package:**
  - n° 3.1: totally ramified (lines 860–863, p. 126); formula (5) and properties a–d′ (lines 897–926, p. 127); Propositions 3–4 and the Remarque (lines 931–950, p. 128);
  - n° 3.4–3.5, below;
  - brinon-conrad Exercise 1.4.4(3), lines 382–386, p. 10, for `p`-adic fields (Definition 1.3.1, line 259).
- **Residue enlargement:** ega3 (10.3.1), lines 637–639, p. 20; (10.3.1.5) and the completion remark, lines 733–737, p. 23.
- **Proalgebraic units:**
  - serre1961 §1, n° 1.1–1.6, pp. 106–113 (n° 1.6 ends at line 365);
  - n° 2.1, line 557, p. 118;
  - Propositions 1–2 with their Corollaries and the Remarque, lines 585–621, p. 119;
  - Proposition 3 with its Corollary, lines 630–639, p. 120.
  - serre1960 (printed page = PDF page + 1):
    - Definition 2 (n° 1.2), line 162, p. 8;
    - Proposition 10 (n° 1.4), line 313, p. 11;
    - Propositions 6–7 (n° 2.4), lines 546 and 575, pp. 17–18;
    - Proposition 10 with Corollaries 1–2 (n° 2.5), lines 625–636, p. 19;
    - n° 5.1, Propositions 1–2 and right exactness of `π₀`, lines 1246–1261, p. 35.
- **Graded norms:** serre1961:
  - Proposition 6(a)–(b) with (20), lines 1092–1099, p. 132;
  - its Corollary, line 1129, p. 133;
  - Proposition 7 with (22)–(23) and Corollaries 1–3, lines 1150–1184, pp. 134–135;
  - Proposition 8(i)–(iii), lines 1187–1192, p. 135;
  - Corollary 1, lines 1224–1232, p. 136.
- **Transfer from the separable closure:**
  - It now has no locator, and says so (README lines 834–836).
  - Its group part is pinned, and its valuation-subring statements are proved in place. I checked them in the table.
- **Agreement with `Breve E`:** brinon-conrad Exercise 1.4.4(2)–(3), lines 378–386, p. 10, including non-completeness of `K^un` for non-algebraically-closed `k` (line 380). Lemma 13.1.6, whose proof appeals to Exercise 1.4.4, is at lines 8585–8589, p. 201.

## Not verifiable

- Serre, *Local Fields* (`serre-local-fields`) is recorded in the manifest as uncertified (paywalled). I cited it by locator without reading it: II §2 Proposition 3; III §6 Proposition 12; IV §1 Propositions 1, 2 and 4; IV §3 Proposition 14 and Exercise 3; V §7 Theorem 1.
  - From memory, and not checked: IV §3 Proposition 14 may be Herbrand's theorem in the lower numbering, with the upper-numbering form a corollary and tower transitivity in Proposition 15. PadicExtensionFamilies cites "Serre, IV §3, Prop. 15" for the latter.
  - If so, the README's citation of Proposition 14 alone for §3a.2's tower statements, and the Lean docstring's for the upper-numbering form (line 112), would need "and Proposition 15 with its Corollary".
- serre1961 line 1197 (proof of Proposition 8(i), p. 135) cites "corollaire 2 de la proposition 3", but the bound used is Corollary 2 of Proposition 7. The text is Numdam's OCR layer and I could not render the page, so I cannot tell a printing slip from an OCR error.

## Source issues

- none
