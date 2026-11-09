# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at 8917bb8)

**Verdict:** accepted

This is an incremental re-review of the 13 changed lines since `810f37f`. The change touches only `TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/README.md`. The previous report's only finding (R01) is repaired, the repair introduces no new problem, and the gate passes. This report has no findings.

## Previous findings

- R01 — repaired: the §4a.3 proof now reads "(`TauCeti.finiteIntermediateField_isNonarchimedeanLocalField`, with `TauCeti.finiteIntermediateField_valuativeExtension` for the valuative extension over `E`)" (lines 1265–1266). The *Needs* line (lines 1277–1279) adds the same declaration, "its valuative extension over `E`".

## Verified sound

### Mechanical checks at this head

- **Gate, re-run.** Exit 0, with every counter at 0 and the run ending "OK": `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0`. The worker's run on this head also reports `build=0`.
- **Dependency check.** Output, exit 0:

  ```text
  depcheck: 239 roadmaps, 2322 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. The roadmap is line 2 of the merge order, after JacobianChallenge. Its consumers PadicPeriodRings (line 21) and ArithmeticGaloisRepresentations (line 58) are later.
- **Scope of the change.**
  - `git diff --stat 810f37f..HEAD` lists only the README: 9 insertions, 4 deletions.
  - `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields'` is empty.
  - The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. `Suggested.lean` is byte-identical to the previous head.
- **Elaboration.** `lake env lean` on a scratch copy of `Suggested.lean`, with `#check @` of all 13 declarations appended, exits 0.
  - The only messages are nine `declaration uses sorry` warnings, at lines 62, 111, 130, 151, 197, 215, 239, 263 and 289.
  - After whitespace normalisation, each of the 13 elaborated types is identical to its entry in `signatures.md`, and the previous report compared these types with the README statements binder for binder. No section `variable`s are used, so none can drop.
- **Padding and headlines.** Because the Lean file is unchanged, the previous report's probe stands: all nine `sorry`s resisted `first | rfl | (simp; done) | infer_instance | (exact?)`. Its headline list also stands. Every headline is stated except §4a.3's completed base change, which the module docstring names as not statable, with the missing carrier.

### The changed passages

1. **§4a.1, fourth bullet (lines 938–941).** The bullet now says that each finite level `M` carries the local-field structure of `TauCeti.finiteIntermediateField_isNonarchimedeanLocalField` *and* the valuative extension over `K` of `TauCeti.finiteIntermediateField_valuativeExtension`. This addition is required. The pinned `TauCeti.LocalFieldsRamification.upperRamificationGroup` (`Herbrand/Basic.lean` line 421, `variable` block lines 104–107, `IsGalois` at line 255) elaborates with these binders:
   - `[ValuativeExtension K L]`;
   - `[Module.Finite K L]`;
   - `[IsGalois K L]`;
   - the domain `RamificationIndexDomain = Set.Ici (−1)` (`RamificationGroup.lean` line 86), which matches "for every `u ≥ −1`".

   A finite Galois level supplies the finiteness and Galois instances, and the newly cited declaration supplies the first. The bullet agrees with the §4a.1 proof (lines 1003–1005) and *Needs* line (lines 1029–1030), which already cited both declarations.
2. **§4a.3 proof (lines 1263–1267).** The pinned `IntermediateField.le_maximalUnramifiedExtension_iff` (`Unramified/Maximal.lean` lines 298–300) binds:
   - `[IsSepClosed Ω]`;
   - `[ValuativeRel E]`, `[TopologicalSpace E]` and `[IsNonarchimedeanLocalField E]`;
   - `[ValuativeExtension K E]`.

   The proof now supplies all of them for `Ω = AlgebraicClosure E`.
3. **§4a.3 *Needs* (lines 1276–1281).** The line lists the added declaration with its role.
4. **Layer 4a *Dependencies* (lines 1303–1305).** The paragraph adds "and their valuative extension over the base". This is consistent with the supplier contract at lines 278–281, which already listed `TauCeti.finiteIntermediateField_valuativeExtension`.

**Lean probe of the repaired routes.** A scratch file imports Mathlib and three Tau Ceti modules: `Unramified.Maximal`, `FiniteExtension.IntermediateField` and `Herbrand.Basic`. It installs `finiteIntermediateFieldValuativeRel`, `finiteIntermediateFieldTopology` and the two theorems on a finite intermediate field of `AlgebraicClosure K`, over a nonarchimedean local field `K`.

| Route | With `finiteIntermediateField_valuativeExtension` | Without it (negative control) |
|---|---|---|
| §4a.3: `IntermediateField.le_maximalUnramifiedExtension_iff M`, for `M : IntermediateField K (AlgebraicClosure K)` with `[Module.Finite K M]` | elaborates, no error | "failed to synthesize `ValuativeExtension K ↥M`" |
| §4a.1: `upperRamificationGroup K M u : Subgroup (M ≃ₐ[K] M)`, for `M : FiniteGaloisIntermediateField K (AlgebraicClosure K)` | elaborates, no error | "failed to synthesize `ValuativeExtension K ↥M.toIntermediateField`" |

So the declaration the repair cites is exactly the missing input.

**Pinned declaration opened.** `TauCeti.finiteIntermediateField_valuativeExtension` is in `NumberTheory/LocalField/FiniteExtension/IntermediateField.lean` at lines 81–85, inside `namespace TauCeti` (lines 53–116). For `[Module.Finite K M]`, it states `ValuativeExtension K M` for the relation `finiteIntermediateFieldValuativeRel K Ω M`. That relation is the one under which `finiteIntermediateField_isNonarchimedeanLocalField` (lines 97–101) holds, so the two cited structures are compatible.

### Seeded sample

- **Agreement with `Breve E` on a local field.** This target is in the changed passage, so I read its locators again.
  - Brinon–Conrad Exercise 1.4.4 begins at brinon-conrad line 375, after the page-10 marker at line 359. Part (2), lines 378–381, gives the unique prolongation of the valuation to algebraic extensions and the incompleteness of `K^un` when the residue field is not algebraically closed. Part (3), lines 382–386, gives the completion as a `p`-adic field whose residue field is an algebraic closure. The exercise is stated for `p`-adic fields, hence in mixed characteristic, as the README says.
  - ReductiveGroupsPartII §RG2.0.4 on main (README lines 852–882) defines `Breve E` as `UniformSpace.Completion (Unramified E)`, with `Unramified E = TauCeti.maximalUnramifiedExtension E (AlgebraicClosure E)`. It owns `breveIsDiscrete`, `residueField_isAlgClosed`, `isUniformizer_algebraMap` and the Frobenius. This matches the target's division of ownership.
- **The other four sample targets** are in untouched text and were verified at their locators in the previous report (its rows 44–50):
  - the perfect-residue Herbrand package;
  - residue enlargement and preservation of ramification;
  - proalgebraic units and norm-kernel components;
  - graded norms and filtered norm-kernel components.

### Adversarial table

Notation as in the previous report:
- `Z8 = ℚ_2(ζ_8)/ℚ_2`, with `G_0 = G_1 = G`, `G_2 = G_3 = {1, 5}`, `G_4 = 1`;
- `Z9 = ℚ_3(ζ_9)/ℚ_3`, with `#G_0 = 6`, `G_1 = G_2 = {1, 4, 7}`, `G_3 = 1`;
- `Z24 = ℚ_2(ζ_24)/ℚ_2`;
- `S3 = ℚ_3(ζ_3, ∛3)/ℚ_3`;
- `T = ℚ_2(ζ_3, ∛2)/ℚ_2`;
- `BQ = ℚ_p(ζ_(p²−1), √p)/ℚ_p`;
- `INS`, `CPP`, `I2`, `AS` and `W = Frac W(F̄_p)` as defined there.

Rows 55–60 are new in this round, with every value computed now. The rows for statements the diff leaves untouched are carried forward from the previous report, as its last column says. Its row 52, the failing route of R01, is replaced by rows 55–57.

| # | Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|---|
| 1 | Hilbert (Lean 62) | `Z9` | `Σ = 5 + 2 + 2 = 9`; `v_3(disc ℚ(ζ_9)) = 9` with `f = 1` | agrees | none; previous report row 1 |
| 2 | Hilbert | `T` | `Σ = 3 − 1 = 2`; tame, so `d = e − 1 = 2`; `[L:K] = 6 = 3·2` | agrees | none; previous report row 2 |
| 3 | Hilbert | `Z24` | `Σ = 3 + 3 + 1 + 1 = 8`; unramified base change of `Z8` keeps `d = 8` | agrees | none; previous report row 3 |
| 4 | Hilbert, `G = 1` | `B = A` | `differentIdeal = ⊤ = 𝔪^0`; `Σ = 0` | no junk | none; previous report row 4 |
| 5 | Hilbert, separability dropped | `CPP` | `G_0 = G`, `G_1 = 1`, so `Σ = p² − 1`; `d = d(L/L₁) + d(L₁/K) = (p − 1) + (p − 1)`; at `p = 2`, `3 ≠ 2` | hypothesis needed | none; previous report row 5 |
| 6 | Hilbert, inseparable but monogenic | `INS` | `B = A[z]`, `f′(z) = −t^(p−1)`, `d = p − 1 = #G_0 − 1` | holds here; row 5 separates | none; previous report row 6 |
| 7 | `herbrandFun` (Lean 81) | `Z8` | `φ(1) = 1`, `φ(3) = 8/4 = 2`, `φ(5) = 10/4`, `φ(7) = 12/4 = 3` | matches Serre 1961 (5) | none; previous report row 7 |
| 8 | `herbrandFun` below `−1` | unramified quadratic | integrand `2` on `(−2, −1]`: `φ(−2) = −3`, `ψ(−2) = −3/2` | Check correct | none; previous report row 8 |
| 9 | `inverseHerbrandFun` (Lean 90) | `Z8` | `ψ(2) = 3`, `ψ(3) = 7`, `ψ(−1) = −1`; integrand `≥ 1/#G_0 > 0`, so `sInf` is `φ⁻¹(v)` | agrees | none; previous report row 9 |
| 10 | `ψ(n) ∈ ℕ` (README 576) | `S3` | `ψ = 2v` on `[0, 3/2]` and `6v − 6` after: `ψ(1) = 2`, `ψ(2) = 6` | integers, as d′ | none; previous report row 10 |
| 11 | `upperRamificationGroup` (Lean 97) | `Z8`, `v = 3` | `G^3 = G_7 = 1`, but lower `G_3 = {1, 5}` | wrong model excluded | none; previous report row 11 |
| 12 | Herbrand (Lean 111) | `Z24`, `H` the unramified `C_2`, `v = 3/2` | `ψ(3/2) = 2`: image of `G_2` is `{1, 5}` = `(G/H)^(3/2)` of `Z8` | agrees | none; previous report row 12 |
| 13 | Herbrand | `Z24`, `H = G_0`, `v = 0` | image of `G_0` is `1`; `(G/H)^0 = (G/H)_0 = 1`, since the quotient is unramified | agrees | none; previous report row 13 |
| 14 | Herbrand | `S3`, `H = C_3`, `v = 1` | `G^1 = G_2 = C_3 ↦ 1`; `(G/H)^1 = (G/H)_1 = 1` (tame quadratic) | agrees | none; previous report row 14 |
| 15 | Herbrand, separability dropped | `I2`, `v = 1/2` | `(G/H)^(1/2) = 1`, but `G^(1/2)H/H = G/H` | hypothesis needed | none; previous report row 15 |
| 16 | tower (Lean 130) | `S3`, `H = C_3`, `u = 5` | `φ_G(5) = 11/6`; `φ_H(5) = 11/3`; `φ_(G/H)(11/3) = 11/6` | agrees | none; previous report row 16 |
| 17 | tower | `Z24`, `H` unramified, `u = 5` | `φ_G(5) = 10/4`; `φ_H = id` on `[−1, ∞)`; `φ_(G/H)(5) = 10/4` | agrees | none; previous report row 17 |
| 18 | tower, separability dropped | `I2`, `u = 1` | `φ_M(1) = 1`, but `φ_(L₁)(φ_(M/L₁)(1)) = 1/2` | hypothesis needed | none; previous report row 18 |
| 19 | Hasse–Arf (Lean 151) | `Z24` | `j = 1`: `4 ∣ 4`; `j = 3`: `4 ∣ 8` | agrees | none; previous report row 19 |
| 20 | Hasse–Arf | `Z9` | `j = 0`: `6 ∣ 0`; `j = 2`: `6 ∣ 6` | agrees | none; previous report row 20 |
| 21 | Hasse–Arf, infinite residue field | `AS` over `F̄_p((t))` | `j = 1`: `p ∣ p` | agrees | none; previous report row 21 |
| 22 | Hasse–Arf, commutativity dropped | `S3` | `j = 3`: `6 ∤ 9` | hypothesis needed | none; previous report row 22 |
| 23 | Hasse–Arf, negative Check | abstract `C_9` filtration | `9 ∤ 9 + 4·3 = 21`; the subgroup and the quotient have breaks `5` and `1` | Check consistent | none; previous report row 23 |
| 24 | `absoluteUpperRamificationGroup` (Lean 176) | `ℚ_2`, `Z8`, `u = 1, 3/2, 3` | `ψ = 1, 2, 7`: `G`, `{1, 5}`, `1` | agrees | none; previous report row 24 |
| 25 | `_zero` (Lean 197) | `O = AlgebraicClosure K` | every `O ∩ M = M`, `G_0 = 1`, LHS `1`; inertia of `O` is the kernel of `σ ↦ σ` on `K̄`, which is `1` | agrees | none; previous report row 25 |
| 26 | `_zero` | `K = ℚ`, `O` over `ℤ_(5)`, `M = ℚ(i)` | `D_M = 1`; both sides restrict trivially to `ℚ(i)` | agrees | none; previous report row 26 |
| 27 | `_zero` | `ℚ_p` Frobenius lift; `W` | the lift acts by `x ↦ x^p` on `F̄_p`, so it is in neither side; for `W`, `G_K^0 = G_K = I_K` | agrees | none; previous report row 27 |
| 28 | projections (Lean 215) | `AS` over `F̄_p((t))`, `u = 1, 3/2` | `ψ(1) = 1`: `C_p`; `ψ(3/2) = 1 + p/2`, so `G_⌈ψ⌉ = 1` | agrees | none; previous report row 28 |
| 29 | projections, `u ∈ [−1, 0)` | `Z24`, `u = −1/2` | `⌈−1/2⌉ = 0`: `G_0` of order `4`, the image of `I_K` | agrees | none; previous report row 29 |
| 30 | projections, perfectness dropped | `I2`, `u = 1/2` | image of order `≤ 2`, but `Gal(M/K)^(1/2) = G_1` has order `4` | hypothesis needed | none; previous report row 30 |
| 31 | `0+` (Lean 239) | `W`, `K(ζ_p)` | `P_K ↦ G_1 = 1`; `I_K ↦ C_(p−1)` | strict inclusion | none; previous report row 31 |
| 32 | `0+` | `ℚ_3`, `Z9` | `P_K ↦ {1, 4, 7}`; `I_K ↦ (ℤ/9)ˣ`, of order `6` | separates | none; previous report row 32 |
| 33 | subgroup identity (Lean 263) | `T`, `H = ⟨(12)⟩`, `u = −1, 0, 1/2` | `H = H^(−1)`; `C_3 ∩ H = 1 = H^0`; `ψ_G(1/2) = 3/2` gives `G_2 ∩ H = 1 = H^(3/2)` | agrees | none; previous report row 33 |
| 34 | subgroup identity | `S3`, `H = ⟨(12)⟩`, `u = 1` | `G_2 ∩ H = 1`; `φ_H(2) = 1`, `H^1 = H_2 = 1` | agrees | none; previous report row 34 |
| 35 | subgroup identity, trivial action | `G` acting trivially on a field | every `G_i = G`, `φ = id`: `G ∩ H = H = H^u` | no junk | none; previous report row 35 |
| 36 | open subgroups (Lean 289) | `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `ψ_(M/K)(1) = 2`: `H = H^2`; `ψ_(M/K)(3/2) = 5`: `1 = H_5 = H^3` | agrees | none; previous report row 36 |
| 37 | open subgroups | `T`, `L = ℚ_2(∛2)`, `u = 1/2` | `ψ_(L/K) = 3u` gives `3/2`; `G^(1/2) ∩ H = 1 = H^(3/2)` (`H_0 = 1`) | agrees | none; previous report row 37 |
| 38 | open subgroups, `hO'` dropped | `W`, `O′ = AlgebraicClosure L`, `u = 0` | LHS `G_L`; RHS `G_L^0 = 1` | hypothesis needed | none; previous report row 38 |
| 39 | integral formula (README 1114 at this head) | `S3` with `L = ℚ_3(∛3)`; `BQ` with `ℚ_p(√p)`; unramified quadratic | slopes `1` then `3`; `[G:H] = 2`, `f = 1`, so `2u`; `(1/2)·2 = 1`, so `ψ = u` | agrees | none; previous report row 39 |
| 40 | integral-formula derivation (README 1141–1143 at this head) | `S3`, `t ∈ (0, 3/2)` | `[G^0 : G^t]·#H^ψ/#H^0 = 2·1/2 = 1 = [G : C_3H]/f` | agrees | none; previous report row 40 |
| 41 | §3a.1 Check | `BQ` | `#G_0 = 2 = e`; `e(L/K_0) = 2`, `e(K_0/ℚ_p) = 1`, `f(L/K_0) = 1`; for `⟨σ⟩`, `e = 2` and `G_0 ⊄ H` | agrees | none; previous report row 41 |
| 42 | §3a.1 Check | `INS` | `#G_0 = p ≠ e = 1`; `G/G_0 = 1`, of order `≠ f = p` | agrees | none; previous report row 42 |
| 43 | §3a.2 Check, order of composition | `Z8 ⊃ ℚ_2(√2)`, `u = 3` | `ψ_(L/K)(3) = 4`, `ψ_(M/L)(4) = 7 = ψ_(M/K)(3)`; reversed order gives `8` | agrees | none; previous report row 43 |
| 44 | sample: package | `AS` | `d = 2(p − 1)`, break `1` | agrees | none; previous report row 44 |
| 45 | sample: package | `W(ζ_p)` | `d = p − 2`, break `0` | agrees | none; previous report row 45 |
| 46 | sample: package | `Z8` | lower `1, 3` and upper `φ(1) = 1`, `φ(3) = 2` | agrees | none; previous report row 46 |
| 47 | sample: residue enlargement | `κ[[t]] → κ̄[[t]]`; `F_p((t))(t^(1/e))` with `e ∣ p − 1`; `F_(p²)((t))` | `t` stays a uniformizer; `G_0 = C_e`, `G_1 = 1` kept; the quadratic splits | agrees | none; previous report row 47 |
| 48 | sample: proalgebraic units | `E = F`; `AS`; `κ((t))` | `V = 1`; `π₀(V) ≅ C_p = H/[H, H]`; graded pieces `κˣ` and `(κ, +)` are connected | agrees with serre1961 lines 630–638 | none; previous report row 48 |
| 49 | sample: graded norms | `AS` | `N(1 + λy⁻¹) = 1 + (λ^p − λ)t`; kernel `F_p ∋ −1`, the graded character of the generator | agrees | none; previous report row 49 |
| 50 | sample: graded norms | tame `C_e`; `F_3` | depth-0 kernel `μ_e`; on `F_3`, `λ³ − 2λ = −λ`, kernel `{0, ±√2}` in `F̄_3` | agrees | none; previous report row 50 |
| 51 | sample: `Breve E` | `ℚ_p`; `F_q((t))`; `√p` | `W(F̄_p)[1/p]`; `F̄_q((t)) ≠ ⋃ F_(q^n)((t))`; `v(√p) = 1/2 ∉ ℤ` | agrees | none; previous report row 51 |
| 53 | Conventions, imperfect residue field (README 166) | `F_p(s)((t))` | `s^(1/p)` and `(s + t)^(1/p)` each have `e = 1`, `f = p`; their difference `t^(1/p)` has `e = p` | agrees | none; previous report row 53 |
| 54 | ProfiniteProPGroups contract (README 344) | `p = 0` | `g^(0^1) = g^0 = 1`, so `IsPGroup 0` always holds; `P_K = 1` is stated separately | agrees | none; previous report row 54 |
| 55 | §4a.3 route as repaired (README 1263–1267), Lean | finite `M ≤ AlgebraicClosure K`, `K` a nonarchimedean local field | with both declarations: the call elaborates; without the valuative extension: "failed to synthesize `ValuativeExtension K ↥M`" | repaired | none |
| 56 | §4a.3 iff `M ≤ K^ur ↔ IsUnramified K M` | `E = ℚ_p`, `M = ℚ_p(ζ_(p²−1))` | `e = 1`, `f = 2`, residue `F_(p²)/F_p` separable, so `IsUnramified` holds; `ζ` is a root of `X^(p²) − X`, so `M ≤ K^ur`: true ↔ true | agrees | none |
| 57 | §4a.3 iff, ramified and degenerate | `E = ℚ_p`, `M = ℚ_p(√p)`; `M = ⊥` | `e = 2`, so not unramified; `v(√p) = 1/2 ∉ ℤ`, the value group of `K^ur`, so `M ≰ K^ur`: false ↔ false. For `⊥`: `e = f = 1` and `⊥ ≤ K^ur`: true ↔ true | agrees | none |
| 58 | §4a.1 fourth bullet as repaired (README 938–941), Lean | `M : FiniteGaloisIntermediateField K (AlgebraicClosure K)`, `u : RamificationIndexDomain` | with both declarations: `upperRamificationGroup K M u` elaborates; without the valuative extension: "failed to synthesize `ValuativeExtension K ↥M.toIntermediateField`" | repaired | none |
| 59 | §4a.1 fourth bullet, values | `K = ℚ_2`, `M = Z8`, `u = 1, 3/2, 3` | Tau Ceti side `G_⌈ψ(u)⌉`: `φ` has slope `1` on `[0, 1]`, `1/2` on `[1, 3]` and `1/4` after, so `ψ(1) = 1`, `ψ(3/2) = 2`, `ψ(3) = 7`, giving `G`, `{1, 5}`, `1`; this roadmap's side, through the finite projections (previous report row 24): `G`, `{1, 5}`, `1` | agrees | none |
| 60 | §4a.1 fourth bullet, values | `K = ℚ_3`, `M = Z9`, `u = 0, 1, 1 + ε` | slope `1/2` on `[0, 2]`: `ψ(0) = 0`, `ψ(1) = 2`, `ψ(1 + ε) > 2`; groups of orders `6`, `3`, `1`, on both sides; upper jumps `0` and `1`, as in the §4a.3 Check | agrees | none |

### Library declarations opened at the pins in this round

All are in Tau Ceti, under `TauCeti/NumberTheory/LocalField/`.
- `FiniteExtension/IntermediateField.lean`:
  - lines 62–77: `finiteIntermediateFieldNormedField`, `finiteIntermediateFieldValuativeRel` and `finiteIntermediateFieldTopology`, which are definitions rather than instances, installed locally;
  - lines 81–85: `finiteIntermediateField_valuativeExtension`;
  - lines 97–101: `finiteIntermediateField_isNonarchimedeanLocalField`;
  - line 109: `IntermediateField.valuativeExtension_of_isNonarchimedeanLocalField`.
- `Unramified/Maximal.lean` lines 298–300: `IntermediateField.le_maximalUnramifiedExtension_iff`, with its `[ValuativeExtension K E]` binder.
- `Herbrand/Basic.lean`:
  - lines 104–107: the `variable` block with `[ValuativeExtension K L]`;
  - line 255: `IsGalois K L`;
  - line 421: `upperRamificationGroup`.
- `Herbrand/UpperQuotient.lean` lines 85–90 and 98: `map_restrictNormalHom_upperRamificationGroup`.
- `RamificationGroup.lean` line 86: `RamificationIndexDomain`.

The elaborated types of `le_maximalUnramifiedExtension_iff`, `upperRamificationGroup` and `finiteIntermediateField_valuativeExtension` were printed with `#check @` in the probe. The previous report's `#check @` of the README's other 106 library names stands, since the change adds only the name above, and that name is checked here.

### Cross-roadmap citations and ownership

- **No new citations.** The changed passages cite only pinned Tau Ceti declarations and the existing ReductiveGroupsPartII §RG2.0.4, which I re-read on main as above. They add no cross-roadmap citation and no new object, so ownership is unchanged from the previous report.
- **`roadmaps overlaps`** reports no other open pull request changing this folder, no dropped id and no id that only a revision defines.
- **`roadmaps resolve`** reports nothing unresolved.
- **Closest open roadmap: #1187.** It is a Tau Ceti bump that revises LocalFieldsRamification among many roadmaps. At its head it still lists `finiteIntermediateField_valuativeExtension` (its README lines 175 and 1109), so the cited name survives it. As a revision, it is not a dependency.
- **Declared gaps.** There are none: the folder has no `design/plan.json`.

### Remarks on untouched text (no change asked)

- **Scope paragraph (lines 122–124).** It names `TauCeti.LocalFieldsRamification.upperRamificationGroup K M u` at finite Galois levels without the structure on `M`. The §4a.1 fourth bullet it points to now states that structure.
- **Pull-request description.** Outside the folder, its *Summary* sentence still begins "On a nonarchimedean local field On a nonarchimedean local field".

## Not verifiable

- **`serre-local-fields`** is settled as uncertified. The changed passages add no locator into it, so the previous report's list of its locators stands.
- **#1187** was read at its indexed head through `roadmaps show`, without a checkout.

## Source issues

- none
