# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at c89caf8)

**Verdict:** needs changes

This is a full review. The folder changed by 160 lines since e40279d, which is an ancestor of c89caf8. The pins (`lake-manifest.json`, `lean-toolchain`) are unchanged.

- **Gate.** I reran it at this head and every check passes (`set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`).
- **Dependency check.** Output: `depcheck: 239 roadmaps, 2354 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The roadmap is line 2 of the merge order, after JacobianChallenge. Every supplier is on main.
- **Elaboration.** `lake env lean TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/Suggested.lean` exits 0. Its only output is nine `declaration uses sorry` warnings, at lines 62, 111, 130, 151, 197, 215, 239, 263 and 289.
- **Outside the folder.** `git diff --stat origin/main...HEAD` lists no file outside the folder.
- **Gaps.** The package has no `design/plan.json`, so no gaps are declared.

Two findings remain, both P3. Neither blocks. The mathematics of the folder held up under every instance I tried; see the table below.

## Previous findings (review at e40279d)

- **R01 (P2), §4a.2's open-subgroup identity was statable but absent: repaired.**
  - `Suggested.lean` lines 289–313 now state `comap_mapOfAlgebra_absoluteUpperRamificationGroup`, in the shape proposed.
  - README lines 871–877 name it, with the same hypotheses: complete DVR `O ∩ K` with perfect residue field, `L ≤ M`, an embedding `ι` over `L`, and `ι⁻¹(O′) = O`.
  - The not-statable list (`Suggested.lean` lines 41–44; README lines 270–272) now names only §4a.3.
  - `Field.absoluteGaloisGroup.mapOfAlgebra`, `IntermediateField.restrict`, `IsAlgClosed.algebraMap_bijective_of_isIntegral` and `TauCeti.absoluteGaloisGroup_mapOfAlgebra_commutes` are in the contracts (README lines 146–153 and 182–184) and in §4a.2's *Needs* (lines 912–919).
  - The new negative-control Check (README lines 939–945) shows that `hO'` cannot be dropped. I recomputed it: rows 32–37.
- **R02 (P2), ClassFieldTheory #1411 owned the absolute upper groups: repaired on #1411's side.**
  - #1411's head is now `eb95acd`, a child of `71f458c`. I read it from the open-roadmaps index of 2026-11-08T23:59Z (`refs/open/1411`); `roadmaps list` and `roadmaps show` still served `71f458c`.
  - At `eb95acd`, ClassFieldTheory's README lines 179–182 read "`RamificationOfCompleteDiscretelyValuedFields` owns the absolute upper ramification groups `G_K^u` (§4a.1, `absoluteUpperRamificationGroup`), on nonarchimedean local fields as on every complete discretely valued field…".
  - Its `Suggested.lean` lines 1449–1466 no longer define the groups. They take `G_K^n` as an argument described by §4a.1.
  - So there is a single owner, and the description's "#1411 consumes its §4a.1 absolute filtration" is now true.
- **R03 (P2), PadicExtensionFamilies #1713 constructed `ψ_(L/K)`: repaired on #1713's side.**
  - I read #1713 at `5e8f0af`, the index head and a child of `327faa6`.
  - Its README cites "RamificationOfCompleteDiscretelyValuedFields §4a.2" at lines 81–82, 279–283 and 717–724, and it no longer constructs the function. Its §2.0 stub is folded into Layer 2's standing hypotheses.
- **R04 (P3), the graded-norm Check over `F_p` was false as worded: repaired.**
  - README lines 627–636 now compute the norm: `N(y + λ) = t⁻¹ + λ^p − λ` and `N(1 + λy⁻¹) = 1 + (λ^p − λ)t`, so the kernel is `F_p`, the image of the graded character.
  - They also state that the `F_p` failure comes from where the kernel lies, not from its order, with the `λ³ − 2λ` control.
  - I recomputed every step (row 42). The formula agrees with Tau Ceti's `normGradedMap_at_break` (`NumberTheory/LocalField/Norm/Graded.lean:650`): the graded norm is `y ↦ y^ℓ − c^(ℓ−1) y`, which for `c = −1` and `ℓ = p` is `y^p − y`.
- **R05 (P3), the description's dependency and merge-order paragraphs were stale: partly repaired.**
  - The merge-order sentence is now accurate, because #1411 changed (R02 above).
  - The *Dependencies* paragraph is unchanged. It is raised again as R01 below.

## R01 (P3) — The description still lists suppliers the README does not consume

**Location.** The pull-request description, *Dependencies*: "the completed roadmaps LocalFieldsRamification, ProfiniteProPGroups and ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia) and ReductiveGroupsPartII §RG2.0.4 (§4a.3)".

**Claim.**
- The README consumes nothing from ProfiniteProPGroups, ProfiniteCohomology or EtaleCohomologyFoundations.
- §4a.1 uses Mathlib's `ValuationSubring.inertiaSubgroup` and Tau Ceti's `TauCeti.inertiaSubgroup`, not a tame-inertia section.
- A reader of the description, or the merge-order paragraph built from it, gets three suppliers that do not exist.

**Witness.**
- `grep -n -i "profinite\|EtaleCohomology\|ProPGroup\|F\.3a" README.md` finds nothing.
- The supplier contracts (README lines 189–251) and the dependency order (lines 1060–1065) name only LocalFieldsRamification, ReductiveGroups, SchemeAndStackFoundations, AdicSpacesPartII and ReductiveGroupsPartII.

**Repair.** Make *Dependencies* read: "Mathlib and Tau Ceti at the pins; the completed roadmap LocalFieldsRamification, through the Tau Ceti declarations that prove it; ReductiveGroups Layer 3, SchemeAndStackFoundations §0.24, AdicSpacesPartII §R0.19.9 and ReductiveGroupsPartII §RG2.0.4, all on main. No open pull request is a supplier."

**Tested.** After the edit, every roadmap the description names has a consumed section in README lines 189–251, and none is missing.

## R02 (P3) — Downstream consumers says p-adic Galois representations reach the package only through PadicPeriodRings

**Location.** README lines 1078–1079: "Integral `p`-adic Hodge theory and `p`-adic Galois representations over `F̄_p((t))` and `Frac W(F̄_p)` reach the package through PadicPeriodRings."

**Claim.** ArithmeticGaloisRepresentations has its own supplier contract with this roadmap. FilteredLocalGaloisGroups and FieldOfNorms also consume §§4a.1–4a.2 directly. So the sentence is false for them, and a renumbering of §§3a–4a would miss three direct consumers.

**Witness.**
- ArithmeticGaloisRepresentations at #856 (`c0cf462`), README line 442: "### From `TauCetiRoadmap.RamificationOfCompleteDiscretelyValuedFields`". Lines 444–445 cite "§§3a.1–3a.3 and 4a.1–4a.3".
- FilteredLocalGaloisGroups at #1795, README lines 51–54: "§§4a.1–4a.2, consumed below".
- FieldOfNorms at #1812, README lines 69–71.

**Repair.** Replace the sentence with: "ArithmeticGaloisRepresentations consumes §§3a.1–3a.3 and 4a.1–4a.3 directly, for conductors over a general perfect residue field. FilteredLocalGaloisGroups and FieldOfNorms consume §§4a.1–4a.2 (the absolute upper filtration, `ψ_(L/K)` and the open-subgroup identity). Integral `p`-adic Hodge theory reaches the package through PadicPeriodRings."

**Tested.** FiniteFlatGroupsAndIntegralPadicHodgeTheory at #879 does go through PadicPeriodRings: its README line 124 cites "PadicPeriodRings §0.3", which records what it consumes from this roadmap (#940 README line 7). After the edit, every open roadmap with a contract naming this roadmap is listed. Those are #856 line 442, #940 line 32, #1411 line 179, #1713 line 279, #1795 line 51 and #1812 line 69.

## Verified sound

### Adversarial pass

There are 43 rows, every value recomputed at this head. Notation:
- `Z8` is `ℚ_2(ζ_8)/ℚ_2`, with `#G_0..#G_4 = 4, 4, 2, 2, 1`.
- `Z9` is `ℚ_3(ζ_9)/ℚ_3`, with `#G_0..#G_3 = 6, 3, 3, 1`.
- `S3` is `ℚ_3(ζ_3, ∛3)/ℚ_3`, with `G_0 = S_3`, `G_1 = G_2 = G_3 = C_3` and `G_4 = 1`.
- `AS` is `y^p − y = t⁻¹` over `k((t))`.
- `I2` is `F_2(s)((t))(y, w)` of the §3a.2 Check, with `L₁ = K(y)` and `H = Gal(M/L₁)`.
- `CpCp` is the §3a.1 monogenicity example.
- `W` is `Frac W(F̄_p)`.

| # | Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | Hilbert (Lean 62) | `Z9` | `Σ(#G_i − 1) = 5 + 2 + 2 = 9`; `disc ℚ(ζ_9) = 3^(3(6−2−1)) = 3^9`, `f = 1` | agrees | none |
| 2 | same | `Z8` | `3 + 3 + 1 + 1 = 8`; `disc ℚ(ζ_8) = 2^(4(6−3−1)) = 2^8` | agrees | none |
| 3 | same | `G = 1` | invariants give `A ≅ B`; `differentIdeal = ⊤ = 𝔪^0`; `Σᶠ = 0`; `Nat.card ≥ 1`, so no `ℕ`-subtraction junk | agrees | none |
| 4 | same, separability dropped | `CpCp`, `p = 2` | `f_i′(z_i) = −t^(p−1)`, so `d = 2(p−1) = 2`; every `i(σ) = 1`, so `Σ = p² − 1 = 3` | hypothesis needed | none |
| 5 | `herbrandFun` (Lean 81) | `Z8` | `φ(1) = 4/4 = 1`; `φ(3) = 8/4 = 2`; `φ(7) = 12/4 = 3` | agrees with Checks | none |
| 6 | same, below `−1` | unramified quadratic | integrand `2` on `(−2, −1]`: `φ(−2) = −(2 + 1) = −3`; `−1 + 2(u + 1) = −2` gives `ψ(−2) = −3/2` | statements made on `[−1, ∞)` | none |
| 7 | `inverseHerbrandFun` (Lean 90) | `Z8` | `ψ(2) = 3`, `ψ(3) = 7`; `ψ(−1) = −1` | agrees | none |
| 8 | `upperRamificationGroup` (Lean 97) | `Z8`, `v = 3` | `G^3 = G_7 = 1`, while `G_3 = {1, 5}` | wrong model `G_v` excluded | none |
| 9 | Herbrand (Lean 111) | `S3`, `H = C_3`, `v = 1/2` | `φ_G(1) = 3/6`, so `ψ_G(1/2) = 1` and `G_1 = C_3 ↦ 1`; `G/H` tame of order `2`, `ψ_(G/H)(1/2) = 1`, `(G/H)_1 = 1` | agrees | none |
| 10 | same | `Z8`, `H = {1, 7}`, `v = 2` | `G^2 = G_3 = {1, 5} ↦ G/H`; `√2 ↦ −√2` moves by `v(2√2) = 3`, so `(G/H)^2 = (G/H)_2 = G/H` | agrees | none |
| 11 | same, separability dropped | `I2`, `v = 1/2` | all `i(σ) = 2`: `G^(1/2)H/H = G/H`; `(G/H)_1 = 1`, `ψ_(G/H)(1/2) = 1`, `(G/H)^(1/2) = 1` | hypothesis needed | none |
| 12 | tower (Lean 130) | `Z9`, `H = C_3`, `u = 5` | `φ_G(5) = 9/6 = 3/2`; `φ_H(5) = 9/3 = 3`; `φ_(G/H)(3) = 3/2` | agrees | none |
| 13 | same | `S3`, `H = C_3`, `u = 5` | `φ_G(5) = 11/6`; `φ_H(5) = 11/3`; `φ_(G/H)(11/3) = 11/6` | agrees | none |
| 14 | same, separability dropped | `I2`, `u = 1` | `φ_(M/K)(1) = 1`; `φ_(L₁/K)(φ_(M/L₁)(1)) = φ_(L₁/K)(1) = 1/2` | hypothesis needed | none |
| 15 | Hasse–Arf (Lean 151) | `Z9` | `j = 0`: `6 ∣ 0`; `j = 2`: `6 ∣ 6`; non-jump `j = 1`: `6 ∤ 3`, excluded by `hj` | agrees | none |
| 16 | same | `Z8` | `j = 1`: `4 ∣ 4`; `j = 3`: `4 ∣ 8`; non-jump `j = 2`: `4 ∤ 6` | agrees | none |
| 17 | same, commutativity dropped | `S3` | `j = 3`: `3 + 3 + 3 = 9`, and `6 ∤ 9` | `IsMulCommutative` needed | none |
| 18 | same, infinite residue field | `AS` over `F̄_p((t))` | `G_0 = G_1 = C_p`, `G_2 = 1`; `j = 1`: `p ∣ p` | agrees | none |
| 19 | same, negative control | abstract `C_9` filtration (README line 678) | `j = 5`: `9 + 3·4 = 21`, and `9 ∤ 21` | Check consistent | none |
| 20 | `absoluteUpperRamificationGroup` (Lean 176) | `ℚ_2`, level `Z8`, `u = 1, 2, 3` | `ψ = 1, 3, 7`; images `G_1 = G`, `G_3 = {1, 5}`, `G_7 = 1` | agrees with Check and Tau Ceti | none |
| 21 | `_zero` (Lean 197) | `O = AlgebraicClosure K` | each `O ∩ M = M`, faithful, so `G_0 = 1`; `σ` acts on residue field `K̄` as `σ`, so inertia `= 1` | agrees | none |
| 22 | same | `W` | residue field `F̄_p` is fixed, so inertia `= D(O) = G_K`; every level has `G_0 = Gal(M/K)` | agrees | none |
| 23 | same | `ℚ_p`, Frobenius lift `F` | at `ℚ_p(ζ_(p²−1))`, `G_0 = 1` and `F|_M ≠ 1`; on the residue field `x ↦ x^p` | `F` lies outside both sides | none |
| 24 | same, `q`-power step | `F_p((t))`, `x = t^(1/p)` | `σ(x)^p = t`, so `(σx − x)^p = 0` and `σx = x` | step sound | none |
| 25 | finite projections (Lean 215) | `ℚ_2`, `Z8`, `u = −1, 3/2` | `G_K^(−1) = G_K ↦ G`; `φ(2) = 6/4`, so `ψ(3/2) = 2` and `G_2 = {1, 5}` | agrees | none |
| 26 | same, perfectness dropped | `I2`, `u = 1/2` | image lies in `Gal(M/L₁)`, of order `2`; `Gal(M/K)^(1/2) = G_1` has order `4` | hypothesis needed | none |
| 27 | `0+` (Lean 239) | `W`, level `K(ζ_p)` | `G_1 = 1`, so both sides map to `1`; `G_K^0` maps onto `C_(p−1)` | `G^(0+) ≠ G^0` | none |
| 28 | same | `ℂ((t))` | every level tame, `G_1 = 1`; `G_K^w = 1` for `w > 0` | both sides `⊥` | none |
| 29 | same | `AS` over `F̄_p((t))` | `φ = id` on `[0, 1]`, so `Gal^w = G_1 = C_p` for `0 < w ≤ 1` | both sides map onto `C_p` | none |
| 30 | subgroup identity (Lean 263) | `S3`, `H = Gal(M/ℚ_3(∛3))`, `u = 1, 2` | `ψ_G(1) = 2`, `G_2 ∩ H = 1`, `φ_H(2) = 1`, `H^1 = H_2 = 1`; `ψ_G(2) = 6`, `φ_H(6) = 3`, `H^3 = H_6 = 1` | agrees | none |
| 31 | same | `H = G`; `H = ⊥` | `G^(φ_G(ψ_G(u))) = G^u`; `⊤ = ⊤` in the trivial group | agrees | none |
| 32 | open-subgroup identity (Lean 289) | `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `ψ_(L/K)(1) = φ_H(2) = 2`, `G_2 ∩ H = H = H^2`; `ψ_G(3/2) = 5`, `φ_H(5) = 3`, `G_5 ∩ H = 1 = H_5 = H^3`; unshifted `H^(3/2) = H_2 = H` | agrees; shift needed | none |
| 33 | same, `L` not Galois | `S3`, `L = ℚ_3(∛3)`, `u = 1, 2` | `ψ_(L/K)(1) = φ_H(2) = 1`, `ψ_(L/K)(2) = φ_H(6) = 3`; `G^1 ∩ H = 1 = H^1`; `G^2 ∩ H = 1 = H^3` | agrees | none |
| 34 | same | `u = −1` | `ψ_(L/K)(−1) = φ_H(−1) = −1`; both sides `⊤` | agrees | none |
| 35 | same | `L = M` | `H = 1`, `φ_1 = id`, `ψ_(L/K) = ψ_(M/K)`; `Z9` at `u = 3/2` gives `G_M^5` | agrees with the Galois case | none |
| 36 | same, `hO'` dropped | `K = W`, `O′ = AlgebraicClosure L`, `u = 0` | `ψ_(L/K)(0) = 0`; LHS `= comap G_K = G_L`; RHS `= ⊥`, since each level is a field, `G_0 = 1`; `G_L ≠ 1` (`L(√π_L)`, `p` odd) | hypothesis needed, as docstring says | none |
| 37 | integral formula (README line 879) | `S3`, `L = ℚ_3(∛3)` | `[S_3 : C_3 H] = 1` on `(0, 3/2]`, `[S_3 : H] = 3` after, `f = 1`: `u`, then `3u − 3`; at `u = 2` this gives `3` | agrees with row 33 | none |
| 38 | §4a.3 base change | `Z9` | `e = 6`, `d = 9`, `d/e = 3/2`; upper jumps `φ(0) = 0`, `φ(2) = 6/6 = 1` | agrees | none |
| 39 | sampled: perfect-residue package | `AS`; `W(ζ_p)`; `Z8` | `d = 2(p − 1)`, break `1 = φ(1)`; `G_0 = C_(p−1)`, `G_1 = 1`, `d = p − 2`; lower `1, 3` ↦ upper `1, 2` | agrees | none |
| 40 | sampled: residue enlargement | `κ[[t]] → κ̄[[t]]`; `F_(p²)/F_p`; `X^e − t` | `t` stays a uniformizer; `F_(p²) ⊗ F̄_p ≅ F̄_p × F̄_p`; still Eisenstein, `#G_0 = e`, `G_1 = 1` | agrees | none |
| 41 | sampled: proalgebraic units | `E = F`; `AS` | `V = ker(id) = 1`; `π₀(V) ≅ H/[H, H] = C_p` (serre1961 line 638) | agrees | none |
| 42 | sampled: graded norms | `AS`; tame `C_e`; `λ³ − 2λ` over `F_3` | `∏_(i ∈ F_p)(y + i + λ) = t⁻¹ + λ^p − λ` (`p = 2` as well); kernel `F_p ∋ −1`; `ψ(s) = es`, depth-0 kernel `μ_e`, `π₀(V_s) = G_(es) = 1` for `s ≥ 1`; `λ³ − 2λ = −λ` on `F_3`, `√2 ∉ F_3` | agrees | none |
| 43 | sampled: `Breve E` agreement | `ℚ_p`; `F_q((t))`; `√p` | `K′ = W(F̄_p)[1/p]` with uniformizer `p`; `Σ aₙtⁿ` with `[F_q(aₙ) : F_q]` unbounded is in `F̄_q((t))` but in no `F_(q^n)((t))`; `v(√p) = 1/2 ∉ ℤ` | agrees | none |

### Signatures

- In a scratch copy, I elaborated `#check @` of all 13 declarations: 4 definitions and 9 theorems. The types match `signatures.md`.
- The file has no `variable` block, so no binder can be lost.
- The new theorem's instance path for `H` acting on `O ∩ M` is the subgroup action through `D_M` (checked with `inferInstance`).
- Each generality matches the README:
  - Layer 3a's DVR statements have no completeness assumption.
  - `IsMulCommutative` appears in Hasse–Arf only.
  - `_zero` has no hypothesis on `O`.
  - The projections, `0+` and the open-subgroup identity assume a complete DVR `O ∩ K` with perfect residue field.
  - The finite subgroup identity holds for any finite `G` acting on any local ring.

### Padding

In a scratch copy, I replaced each `sorry` with `first | rfl | simp | infer_instance | aesop | norm_num | (ext; simp)`. All nine theorems stay open, with "unsolved goals" at lines 71, 121, 140, 162, 201, 228, 252, 267 and 313. The four definitions have real bodies, and each is used by a headline.

### Headlines

- Stated:
  - Hilbert (§3a.1);
  - `φ`, `ψ`, the upper numbering, Herbrand's theorem and tower transitivity (§3a.2);
  - Hasse–Arf (§3a.3);
  - `G_K^u`, `G_K^0`, the finite projections and `G_K^(0+)` (§4a.1);
  - the finite and the open-subgroup identities (§4a.2).
- Named as not statable: §4a.3, because the completion of `K^ur` for a general complete DVR is a construction. The docstring also says why §3a.3's proalgebraic prerequisites are not headlines.

### Library declarations

All 67 qualified names the README backticks resolve by `#check @` at the pins, importing the 24 Tau Ceti modules that declare them (exit 0). So do the 7 unqualified Herbrand names (`herbrand`, `inverseHerbrand`, `psiNat`, `coe_psiNat`, `psiNat_tower`, `UpperJump`, `hasseArf`).

Opened by hand:
- Mathlib:
  - `FieldTheory/AbsoluteGaloisGroup.lean:42` (`absoluteGaloisGroup`) and `:52–59` (`mapOfAlgebra`, which needs only `[Algebra K L]`, an algebra of closures and `IsScalarTower K`);
  - `FieldTheory/IsAlgClosed/Basic.lean:236`;
  - `FieldTheory/IntermediateField/Basic.lean:903`.
- Tau Ceti:
  - `FieldTheory/Galois/AbsoluteGaloisGroup/Map.lean:187`;
  - `FiniteExtension.lean:252` and `:295` (`absoluteGaloisGroupExtend`, with injectivity and range; a different model of `G_L ≤ G_K`, not restated here);
  - `NumberTheory/LocalField/Norm/Graded.lean:100`, `:113` and `:650` (`normGradedMap` assumes `IsNonarchimedeanLocalField`, so it is not a duplicate of §3a.3's graded norms over an algebraically closed residue field);
  - `Herbrand/Basic.lean:251–262` and `:421` (local-field hypotheses, so the general `herbrandFun` is not a duplicate).
- Neither pin contains `absoluteUpper*`.

### Cross-roadmap citations, resolved on main (35884a8)

- ReductiveGroups Layer 3, line 234;
- SchemeAndStackFoundations §0.24, line 1565;
- AdicSpacesPartII §R0.19.9, line 7793;
- ReductiveGroupsPartII §RG2.0.4, line 852 (`Breve E` as `UniformSpace.Completion` of `maximalUnramifiedExtension`, with `residueField_isAlgClosed` and `isUniformizer_algebraMap`);
- `Completed/LocalGaloisGroups` line 29;
- `Completed/LocalFieldsRamification`, cited through Tau Ceti declarations only.

`roadmaps resolve` and `roadmaps overlaps` report nothing.

### Ownership against open pull requests

I read each from the index mirror at its head.
- ClassFieldTheory #1411 (`eb95acd`) cites §4a.1.
- PadicExtensionFamilies #1713 (`5e8f0af`) cites §4a.2.
- PadicPeriodRings #940 (`32476ef`), §0.3, records what it consumes.
- LocalFieldsRamification revision #617 (`4fd7aa6`), README lines 37–40, defers general Hasse–Arf to §3a.3.
- FilteredLocalGaloisGroups #1795 and FieldOfNorms #1812 cite §§4a.1–4a.2. #1795's own model `absoluteGaloisGroupEquivFixingSubgroup'` is compatible with `mapOfAlgebra`: two embeddings over `L` differ by an inner automorphism of `G_L`, and `G_L^v` is normal.
- No other `Suggested.lean` declares a name in `TauCetiRoadmap.RamificationOfCompleteDiscretelyValuedFields`.

### Sources: the seeded sample

All checked against the cached texts.
- **The perfect-residue Herbrand package.** serre1961 (printed page = PDF page + 103):
  - n° 3.1, totally ramified: lines 860–863, p. 126;
  - Propositions 1–2 and Corollaries 1–2: lines 875–891, pp. 126–127;
  - formula (5) and properties a–d′: lines 897–926, p. 127;
  - (8), Proposition 3, the infinite-extension paragraph, Proposition 4 and Kawada's Remarque: lines 927–950, p. 128.
  - brinon-conrad Exercise 1.4.4(3): lines 382–386, p. 10, with Definition 1.3.1 at line 259.
- **Residue enlargement.** ega3 (printed page = PDF page + 3):
  - (10.3.1): lines 637–639, p. 20;
  - (10.3.1.5) and the completion remark: lines 733–737, p. 23.
- **Proalgebraic units.**
  - serre1961: §1 from line 74 (p. 106); n° 1.6 ends before n° 1.7 at line 366 (p. 113); n° 2.1, lines 557–573, p. 118; Propositions 1–2 with the Remarque, lines 585–621, p. 119; Proposition 3 with its Corollary, lines 630–639, p. 120.
  - serre1960 (printed page = PDF page + 1): Definition 2, line 162, p. 8; Proposition 10, line 313, p. 11; Propositions 6–7, lines 546 and 575, pp. 17–18; Proposition 10 with Corollaries 1–2, lines 625–636, p. 19; Propositions 1–2 of n° 5.1, lines 1246–1261, p. 35.
- **Graded norms.** serre1961:
  - Proposition 6 (a)–(b) with (20): lines 1092–1099, p. 132;
  - Proposition 7 with (22)–(23) and Corollaries 1–3: lines 1148–1184, pp. 134–135;
  - Proposition 8 (i)–(iii): lines 1187–1192, p. 135;
  - Corollary 1: lines 1224–1232, p. 136.
- **Agreement with `Breve E`.** brinon-conrad Exercise 1.4.4(2)–(3), lines 378–386, p. 10.

The README flags no locator as unverified.

## Not verifiable

- Serre, *Local Fields* (`serre-local-fields`) is settled in the manifest as uncertified. These locators are cited without the text:
  - II §2, Proposition 3;
  - III §6, Proposition 12;
  - IV §1, Propositions 1, 2 and 4;
  - IV §3, Propositions 14 and 15 and Exercise 3;
  - V §7, Theorem 1.
- serre1961 line 1197, the proof of Proposition 8(i) on p. 135, reads "corollaire 2 de la proposition 3", where the bound used is Corollary 2 of Proposition 7. The cached text is Numdam's OCR layer. No PDF renderer is installed on this worker, so I could not inspect the page image to tell a printing slip from an OCR error.

## Source issues

- none
