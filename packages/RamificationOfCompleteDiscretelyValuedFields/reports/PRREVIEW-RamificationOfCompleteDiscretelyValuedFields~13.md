# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at 9205014)

**Verdict:** needs changes

This is an incremental re-review of the 34 lines that changed since c89caf8. All of them are in `TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/README.md`:
- the last sentence of the Summary (lines 17–19);
- the `## Downstream consumers` paragraph (lines 1070–1091).

`Suggested.lean`, `lake-manifest.json` and `lean-toolchain` have not changed since c89caf8 (`git diff c89caf8 HEAD` is empty for all three). No file outside the folder changed.

- **Gate.** I reran it at this head: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, with every check passing. The worker's run also reports `build=0`.
- **Dependency check.** Output: `depcheck: 239 roadmaps, 2355 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- **Elaboration.** `lake env lean TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/Suggested.lean` exits 0. Its only output is nine `declaration uses sorry` warnings, at lines 62, 111, 130, 151, 197, 215, 239, 263 and 289. These are the same lines as at c89caf8.
- **Gaps.** The package has no `design/plan.json`, so no gaps are declared.

The README repair is correct: every consumer it now names cites exactly the sections it is credited with (rows 44–53). The one remaining finding concerns the pull-request description, which did not change.

## R01 (P3) — The description still lists suppliers the README does not consume

**Location.** The pull-request description, *Dependencies*: "the completed roadmaps LocalFieldsRamification, ProfiniteProPGroups and ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia) and ReductiveGroupsPartII §RG2.0.4 (§4a.3)".

**Claim.**
- The README consumes nothing from ProfiniteProPGroups, ProfiniteCohomology or EtaleCohomologyFoundations.
- §4a.1 takes inertia from Mathlib's `ValuationSubring.inertiaSubgroup` and Tau Ceti's `TauCeti.inertiaSubgroup`, not from a tame-inertia section.
- So the description, and any merge-order paragraph built from it, names three suppliers that this roadmap does not use. The previous review raised this as R01. Nothing in this head's change touches it, and no repair report marks it as not actionable.

**Witness.**
- At this head, `grep -c -i 'profinite\|EtaleCohomology\|ProPGroup\|F\.3a' README.md` returns 1. The one hit is "arithmetically profinite" at line 1089, a FieldOfNorms topic and not a supplier.
- The supplier contracts (lines 134–253) and the dependency order (lines 1059–1066) name only Mathlib, Tau Ceti, LocalFieldsRamification, ReductiveGroups, SchemeAndStackFoundations, AdicSpacesPartII and ReductiveGroupsPartII.

**Repair.** Make *Dependencies* read: "Mathlib and Tau Ceti at the pins; the completed roadmap LocalFieldsRamification, through the Tau Ceti declarations that prove it; ReductiveGroups Layer 3, SchemeAndStackFoundations §0.24, AdicSpacesPartII §R0.19.9 and ReductiveGroupsPartII §RG2.0.4, all on main. No open pull request is a supplier."

**Tested.** After this edit, every roadmap the description names has a consumed section in README lines 134–253, and no supplier there is missing from the description.

## Previous findings

- R01 — not repaired: the description's *Dependencies* still reads "the completed roadmaps LocalFieldsRamification, ProfiniteProPGroups and ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia) and ReductiveGroupsPartII §RG2.0.4 (§4a.3)". Written again as R01 above.
- R02 — repaired: README lines 1075–1091 read "ArithmeticGaloisRepresentations consumes §§3a.1–3a.3 and 4a.1–4a.3 directly … FilteredLocalGaloisGroups and FieldOfNorms consume §§4a.1–4a.2 on nonarchimedean local fields … Integral `p`-adic Hodge theory reaches the package through PadicPeriodRings." Rows 44–51 check each claim.

## Verified sound

### The changed passages

I read the changed text against each consumer named in it, at its open head in the index of 2026-11-08T23:59Z. Rows 44–53 give the values.
- **PadicPeriodRings** (`32476ef`) consumes §4a.2 as well as §§4a.1 and 4a.3. Its senUpperBreaks *Needs* (line 300) names "§§4a.1–4a.3 (absolute upper filtration, transition functions and completed maximal unramified comparison)". So the new "§§4a.1–4a.3" is right, and the old "§§4a.1 and 4a.3" was too narrow.
- **ArithmeticGaloisRepresentations** (`c0cf462`, lines 443–470), **FilteredLocalGaloisGroups** (`f235b83`, lines 138–151) and **FieldOfNorms** (`5b260a9`, lines 159–164): each item in the README's parentheses is an item of their contract with this roadmap.
  - The README's restriction "on nonarchimedean local fields" for the last two matches their standing hypotheses (`f235b83` line 74; `5b260a9` line 85).
- **Integral `p`-adic Hodge theory** goes through PadicPeriodRings, as the README says. FiniteFlatGroupsAndIntegralPadicHodgeTheory (`9856719`, line 131) consumes only PadicPeriodRings §0.3, and its Part II (`a5ccea4`) does not cite this roadmap.
- **Completeness.** A case-insensitive search of main and all 467 open heads, for the roadmap name, "ramification of complete discretely valued fields" and `TauCetiRoadmap#1410`, finds six consumer contracts (#856, #940, #1411, #1713, #1795, #1812). The README names all six, without pull-request numbers.
  - The other hits are not consumers: #617 line 39 is a scope pointer, and #913 matches the anchor `#1410-finite-generation…`.
- **The Summary's new clause** ("the conductors of Galois representations") matches ArithmeticGaloisRepresentations' title and its perfect-residue contract (row 53).
- **House style.** The changed text has no LaTeX, no process words and no pull-request numbers. It has no locator either, so no source check falls in it.

### Adversarial pass

Rows 1–43 cover statements the diff leaves untouched. They are carried from the previous review (r12, at c89caf8), which recomputed every value. Rows 44–53 are new, for the changed passages.

Notation:
- `Z8` is `ℚ_2(ζ_8)/ℚ_2`, with `#G_0..#G_4 = 4, 4, 2, 2, 1`.
- `Z9` is `ℚ_3(ζ_9)/ℚ_3`, with `#G_0..#G_3 = 6, 3, 3, 1`.
- `S3` is `ℚ_3(ζ_3, ∛3)/ℚ_3`, with `G_0 = S_3`, `G_1 = G_2 = G_3 = C_3` and `G_4 = 1`.
- `AS` is `y^p − y = t⁻¹` over `k((t))`.
- `I2` is `F_2(s)((t))(y, w)` of the §3a.2 Check, with `L₁ = K(y)` and `H = Gal(M/L₁)`.
- `CpCp` is the §3a.1 monogenicity example.
- `W` is `Frac W(F̄_p)`.

| # | Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | Hilbert (Lean 62) | `Z9` | `Σ(#G_i − 1) = 5 + 2 + 2 = 9`; `disc ℚ(ζ_9) = 3^(3(6−2−1)) = 3^9`, `f = 1` | agrees | none (carried: r12 row 1) |
| 2 | same | `Z8` | `3 + 3 + 1 + 1 = 8`; `disc ℚ(ζ_8) = 2^(4(6−3−1)) = 2^8` | agrees | none (carried: r12 row 2) |
| 3 | same | `G = 1` | invariants give `A ≅ B`; `differentIdeal = ⊤ = 𝔪^0`; `Σᶠ = 0`; `Nat.card ≥ 1`, so no `ℕ`-subtraction junk | agrees | none (carried: r12 row 3) |
| 4 | same, separability dropped | `CpCp`, `p = 2` | `f_i′(z_i) = −t^(p−1)`, so `d = 2(p−1) = 2`; every `i(σ) = 1`, so `Σ = p² − 1 = 3` | hypothesis needed | none (carried: r12 row 4) |
| 5 | `herbrandFun` (Lean 81) | `Z8` | `φ(1) = 4/4 = 1`; `φ(3) = 8/4 = 2`; `φ(7) = 12/4 = 3` | agrees with Checks | none (carried: r12 row 5) |
| 6 | same, below `−1` | unramified quadratic | integrand `2` on `(−2, −1]`: `φ(−2) = −(2 + 1) = −3`; `−1 + 2(u + 1) = −2` gives `ψ(−2) = −3/2` | statements made on `[−1, ∞)` | none (carried: r12 row 6) |
| 7 | `inverseHerbrandFun` (Lean 90) | `Z8` | `ψ(2) = 3`, `ψ(3) = 7`; `ψ(−1) = −1` | agrees | none (carried: r12 row 7) |
| 8 | `upperRamificationGroup` (Lean 97) | `Z8`, `v = 3` | `G^3 = G_7 = 1`, while `G_3 = {1, 5}` | wrong model `G_v` excluded | none (carried: r12 row 8) |
| 9 | Herbrand (Lean 111) | `S3`, `H = C_3`, `v = 1/2` | `φ_G(1) = 3/6`, so `ψ_G(1/2) = 1` and `G_1 = C_3 ↦ 1`; `G/H` tame of order `2`, `ψ_(G/H)(1/2) = 1`, `(G/H)_1 = 1` | agrees | none (carried: r12 row 9) |
| 10 | same | `Z8`, `H = {1, 7}`, `v = 2` | `G^2 = G_3 = {1, 5} ↦ G/H`; `√2 ↦ −√2` moves by `v(2√2) = 3`, so `(G/H)^2 = (G/H)_2 = G/H` | agrees | none (carried: r12 row 10) |
| 11 | same, separability dropped | `I2`, `v = 1/2` | all `i(σ) = 2`: `G^(1/2)H/H = G/H`; `(G/H)_1 = 1`, `ψ_(G/H)(1/2) = 1`, `(G/H)^(1/2) = 1` | hypothesis needed | none (carried: r12 row 11) |
| 12 | tower (Lean 130) | `Z9`, `H = C_3`, `u = 5` | `φ_G(5) = 9/6 = 3/2`; `φ_H(5) = 9/3 = 3`; `φ_(G/H)(3) = 3/2` | agrees | none (carried: r12 row 12) |
| 13 | same | `S3`, `H = C_3`, `u = 5` | `φ_G(5) = 11/6`; `φ_H(5) = 11/3`; `φ_(G/H)(11/3) = 11/6` | agrees | none (carried: r12 row 13) |
| 14 | same, separability dropped | `I2`, `u = 1` | `φ_(M/K)(1) = 1`; `φ_(L₁/K)(φ_(M/L₁)(1)) = φ_(L₁/K)(1) = 1/2` | hypothesis needed | none (carried: r12 row 14) |
| 15 | Hasse–Arf (Lean 151) | `Z9` | `j = 0`: `6 ∣ 0`; `j = 2`: `6 ∣ 6`; non-jump `j = 1`: `6 ∤ 3`, excluded by `hj` | agrees | none (carried: r12 row 15) |
| 16 | same | `Z8` | `j = 1`: `4 ∣ 4`; `j = 3`: `4 ∣ 8`; non-jump `j = 2`: `4 ∤ 6` | agrees | none (carried: r12 row 16) |
| 17 | same, commutativity dropped | `S3` | `j = 3`: `3 + 3 + 3 = 9`, and `6 ∤ 9` | `IsMulCommutative` needed | none (carried: r12 row 17) |
| 18 | same, infinite residue field | `AS` over `F̄_p((t))` | `G_0 = G_1 = C_p`, `G_2 = 1`; `j = 1`: `p ∣ p` | agrees | none (carried: r12 row 18) |
| 19 | same, negative control | abstract `C_9` filtration (README line 678) | `j = 5`: `9 + 3·4 = 21`, and `9 ∤ 21` | Check consistent | none (carried: r12 row 19) |
| 20 | `absoluteUpperRamificationGroup` (Lean 176) | `ℚ_2`, level `Z8`, `u = 1, 2, 3` | `ψ = 1, 3, 7`; images `G_1 = G`, `G_3 = {1, 5}`, `G_7 = 1` | agrees with Check and Tau Ceti | none (carried: r12 row 20) |
| 21 | `_zero` (Lean 197) | `O = AlgebraicClosure K` | each `O ∩ M = M`, faithful, so `G_0 = 1`; `σ` acts on residue field `K̄` as `σ`, so inertia `= 1` | agrees | none (carried: r12 row 21) |
| 22 | same | `W` | residue field `F̄_p` is fixed, so inertia `= D(O) = G_K`; every level has `G_0 = Gal(M/K)` | agrees | none (carried: r12 row 22) |
| 23 | same | `ℚ_p`, Frobenius lift `F` | at `ℚ_p(ζ_(p²−1))`, `G_0 = 1` and `F|_M ≠ 1`; on the residue field `x ↦ x^p` | `F` lies outside both sides | none (carried: r12 row 23) |
| 24 | same, `q`-power step | `F_p((t))`, `x = t^(1/p)` | `σ(x)^p = t`, so `(σx − x)^p = 0` and `σx = x` | step sound | none (carried: r12 row 24) |
| 25 | finite projections (Lean 215) | `ℚ_2`, `Z8`, `u = −1, 3/2` | `G_K^(−1) = G_K ↦ G`; `φ(2) = 6/4`, so `ψ(3/2) = 2` and `G_2 = {1, 5}` | agrees | none (carried: r12 row 25) |
| 26 | same, perfectness dropped | `I2`, `u = 1/2` | image lies in `Gal(M/L₁)`, of order `2`; `Gal(M/K)^(1/2) = G_1` has order `4` | hypothesis needed | none (carried: r12 row 26) |
| 27 | `0+` (Lean 239) | `W`, level `K(ζ_p)` | `G_1 = 1`, so both sides map to `1`; `G_K^0` maps onto `C_(p−1)` | `G^(0+) ≠ G^0` | none (carried: r12 row 27) |
| 28 | same | `ℂ((t))` | every level tame, `G_1 = 1`; `G_K^w = 1` for `w > 0` | both sides `⊥` | none (carried: r12 row 28) |
| 29 | same | `AS` over `F̄_p((t))` | `φ = id` on `[0, 1]`, so `Gal^w = G_1 = C_p` for `0 < w ≤ 1` | both sides map onto `C_p` | none (carried: r12 row 29) |
| 30 | subgroup identity (Lean 263) | `S3`, `H = Gal(M/ℚ_3(∛3))`, `u = 1, 2` | `ψ_G(1) = 2`, `G_2 ∩ H = 1`, `φ_H(2) = 1`, `H^1 = H_2 = 1`; `ψ_G(2) = 6`, `φ_H(6) = 3`, `H^3 = H_6 = 1` | agrees | none (carried: r12 row 30) |
| 31 | same | `H = G`; `H = ⊥` | `G^(φ_G(ψ_G(u))) = G^u`; `⊤ = ⊤` in the trivial group | agrees | none (carried: r12 row 31) |
| 32 | open-subgroup identity (Lean 289) | `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `ψ_(L/K)(1) = φ_H(2) = 2`, `G_2 ∩ H = H = H^2`; `ψ_G(3/2) = 5`, `φ_H(5) = 3`, `G_5 ∩ H = 1 = H_5 = H^3`; unshifted `H^(3/2) = H_2 = H` | agrees; shift needed | none (carried: r12 row 32) |
| 33 | same, `L` not Galois | `S3`, `L = ℚ_3(∛3)`, `u = 1, 2` | `ψ_(L/K)(1) = φ_H(2) = 1`, `ψ_(L/K)(2) = φ_H(6) = 3`; `G^1 ∩ H = 1 = H^1`; `G^2 ∩ H = 1 = H^3` | agrees | none (carried: r12 row 33) |
| 34 | same | `u = −1` | `ψ_(L/K)(−1) = φ_H(−1) = −1`; both sides `⊤` | agrees | none (carried: r12 row 34) |
| 35 | same | `L = M` | `H = 1`, `φ_1 = id`, `ψ_(L/K) = ψ_(M/K)`; `Z9` at `u = 3/2` gives `G_M^5` | agrees with the Galois case | none (carried: r12 row 35) |
| 36 | same, `hO'` dropped | `K = W`, `O′ = AlgebraicClosure L`, `u = 0` | `ψ_(L/K)(0) = 0`; LHS `= comap G_K = G_L`; RHS `= ⊥`, since each level is a field, `G_0 = 1`; `G_L ≠ 1` (`L(√π_L)`, `p` odd) | hypothesis needed, as docstring says | none (carried: r12 row 36) |
| 37 | integral formula (README line 879) | `S3`, `L = ℚ_3(∛3)` | `[S_3 : C_3 H] = 1` on `(0, 3/2]`, `[S_3 : H] = 3` after, `f = 1`: `u`, then `3u − 3`; at `u = 2` this gives `3` | agrees with row 33 | none (carried: r12 row 37) |
| 38 | §4a.3 base change | `Z9` | `e = 6`, `d = 9`, `d/e = 3/2`; upper jumps `φ(0) = 0`, `φ(2) = 6/6 = 1` | agrees | none (carried: r12 row 38) |
| 39 | sampled: perfect-residue package | `AS`; `W(ζ_p)`; `Z8` | `d = 2(p − 1)`, break `1 = φ(1)`; `G_0 = C_(p−1)`, `G_1 = 1`, `d = p − 2`; lower `1, 3` ↦ upper `1, 2` | agrees | none (carried: r12 row 39) |
| 40 | sampled: residue enlargement | `κ[[t]] → κ̄[[t]]`; `F_(p²)/F_p`; `X^e − t` | `t` stays a uniformizer; `F_(p²) ⊗ F̄_p ≅ F̄_p × F̄_p`; still Eisenstein, `#G_0 = e`, `G_1 = 1` | agrees | none (carried: r12 row 40) |
| 41 | sampled: proalgebraic units | `E = F`; `AS` | `V = ker(id) = 1`; `π₀(V) ≅ H/[H, H] = C_p` (serre1961 line 638) | agrees | none (carried: r12 row 41) |
| 42 | sampled: graded norms | `AS`; tame `C_e`; `λ³ − 2λ` over `F_3` | `∏_(i ∈ F_p)(y + i + λ) = t⁻¹ + λ^p − λ` (`p = 2` as well); kernel `F_p ∋ −1`; `ψ(s) = es`, depth-0 kernel `μ_e`, `π₀(V_s) = G_(es) = 1` for `s ≥ 1`; `λ³ − 2λ = −λ` on `F_3`, `√2 ∉ F_3` | agrees | none (carried: r12 row 42) |
| 43 | sampled: `Breve E` agreement | `ℚ_p`; `F_q((t))`; `√p` | `K′ = W(F̄_p)[1/p]` with uniformizer `p`; `Σ aₙtⁿ` with `[F_q(aₙ) : F_q]` unbounded is in `F̄_q((t))` but in no `F_(q^n)((t))`; `v(√p) = 1/2 ∉ ℤ` | agrees | none (carried: r12 row 43) |
| 44 | Downstream: PadicPeriodRings consumes §§3a.1–3a.3 and §§4a.1–4a.3 (README 1070–1075, changed) | PadicPeriodRings at `32476ef`: *Needs* lines 138, 300, 313, 325, 375 | section union `{3a.1, 3a.2, 3a.3}` (line 300) ∪ `{4a.1}` (138) ∪ `{4a.1, 4a.2, 4a.3}` (300) ∪ `{4a.3}` (313) ∪ `{4a.1, 4a.3}` (325) = `3a.1–3a.3, 4a.1–4a.3` = README's claim; the purposes are line 296 senUpperBreaks ("eventual upper-break spacing"), lines 138 and 309 (Sen tower estimates) and line 321 completedUnramifiedDescent | agrees | none |
| 45 | Downstream: ArithmeticGaloisRepresentations consumes §§3a.1–3a.3 and 4a.1–4a.3 directly (README 1075–1080, new) | ArithmeticGaloisRepresentations at `c0cf462`: contract lines 443–470, scope lines 64–72 and 130–137 | contract items: Hilbert's form `d = Σ(|G_i| − 1)` (§3a.1), `φ`, `ψ`, Herbrand and tower transitivity (§3a.2), Hasse–Arf "in both characteristics" (§3a.3), `G_K^0 = I_K` and `G_K^(0+) = P_K` (§4a.1), `ψ_(L/K)` with the open-subgroup identity (§4a.2), `I_K = G_(K^ur) ≅ G_(K̂^ur)` (§4a.3): 7 items, all named in the README's parenthesis; "Swan conductor" is at line 441 | agrees | none |
| 46 | Downstream: ClassFieldTheory consumes §4a.1 (README 1080–1082) | ClassFieldTheory at `eb95acd`, README lines 116, 164, 179, 1333, 1463, 1526, 1538, 2381 and 2419 | 9 README lines; every section number on them is §4a.1 (8 occurrences); 0 of §§3a.x, 4a.2 or 4a.3 | agrees | none |
| 47 | Downstream: PadicExtensionFamilies consumes §4a.2 (README 1082–1085) | PadicExtensionFamilies at `5e8f0af`, 21 README lines naming this roadmap | 17 citations of §4a.2; the other § numbers on those lines (lines 1558 and 1642: §§1.1–1.3, 2.5, 6.2, §1.3, §6.4) are its own sections | agrees | none |
| 48 | Downstream: FilteredLocalGaloisGroups consumes §§4a.1–4a.2 on nonarchimedean local fields (README 1085–1090, new) | FilteredLocalGaloisGroups at `f235b83`, lines 51–55, 138–151, 300–322 and 73–74 | §4a.1: `G_K^u`, the surjections onto `Gal(M/K)^u`, `G_K^0` inertia and `G_K^(0+)` wild inertia; §4a.2: `ψ_(L/K)` with the tower law, the open-subgroup identity and the integral formula; base field is a local field (line 74, "Layers 0–2 hold for every nonarchimedean local field"); 2.1 filters the solvable quotients `G_K^m` | agrees | none |
| 49 | Downstream: FieldOfNorms consumes §§4a.1–4a.2 on nonarchimedean local fields (README 1085–1090, new) | FieldOfNorms at `5b260a9`, lines 69–72, 159–164, 318–320, 553 and 84–85 | §4a.1: `G_K^u`, finite projections, `G_K^0` inertia; §4a.2: `ψ_(E/K)`, tower law, `G_K^u ∩ G_E = G_E^(ψ_(E/K)(u))`, integral formula; line 85: "Every base field here is a nonarchimedean local field"; purpose is APF extensions and `X_K(L)` | agrees | none |
| 50 | Downstream: "Integral `p`-adic Hodge theory reaches the package through PadicPeriodRings" (README 1090–1091, changed) | FiniteFlatGroupsAndIntegralPadicHodgeTheory at `9856719`, lines 120–131; its Part II at `a5ccea4` | 0 direct citations in either; `#879` line 131: "Layer R07.6 consumes PadicPeriodRings §0.3", and "This roadmap plans none of these"; Part II cites PadicPeriodRings §§3, 4.1 only | agrees | none |
| 51 | Downstream completeness (the changed paragraph claims every direct consumer) | `roadmaps grep -i 'RamificationOfComplete\|ramification of complete discretely\|TauCetiRoadmap#1410'` over main and 467 open heads | hits: #856, #940, #1411, #1713, #1795, #1812 (6 consumers, 6 named); #617 line 39 is a scope deferral in a LocalFieldsRamification revision, not a contract; #913's hits are the anchor `#1410-finite-generation…` | agrees | none |
| 52 | The identity quoted in the new text, `G_K^u ∩ G_L = G_L^(ψ_(L/K)(u))`, against §4a.2 / Lean 289 | `ℚ_3 ⊂ L = ℚ_3(ζ_3) ⊂ M = ℚ_3(ζ_9)`, `u = 1, 3/2` | `#G_0..#G_3 = 6, 3, 3, 1`; `φ_G(2) = 1`, `φ_G(5) = 1 + 3/6 = 3/2`; `H = C_3`, `φ_H(2) = 2`, `φ_H(5) = 2 + 3/3 = 3`; `u = 1`: `G_2 ∩ H = C_3 = H_2 = H^2`; `u = 3/2`: `G_5 ∩ H = 1 = H_5 = H^3` | agrees with row 32 | none |
| 53 | Summary: the conductors of Galois representations consume the package over `F̄_p((t))`, `Frac W(F̄_p)` (README 17–19, new) | ArithmeticGaloisRepresentations at `c0cf462`, lines 64–72 and 434–441 | its ramification contract is "over complete discretely valued fields with arbitrary perfect residue field", in either characteristic; `F̄_p((t))` (char `p`) and `Frac W(F̄_p)` (char 0) both have perfect residue field `F̄_p` | agrees | none |

### Signatures, padding and headlines

These are unchanged since c89caf8, because the file is byte-identical.
- `signatures.md` lists the 13 elaborated declarations: 4 definitions and 9 theorems, at this head. Each type agrees with its README statement as recorded in r12. The file has no `variable` block, so no binder can be lost.
- r12's one-tactic probe (`first | rfl | simp | infer_instance | aesop | norm_num | (ext; simp)`) left all nine theorems open.
- The headline list is unchanged:
  - Hilbert (§3a.1);
  - `φ`, `ψ`, the upper numbering, Herbrand's theorem and tower transitivity (§3a.2);
  - Hasse–Arf (§3a.3);
  - `G_K^u`, `G_K^0`, the finite projections and `G_K^(0+)` (§4a.1);
  - the finite and the open-subgroup identities (§4a.2).
  - §4a.3 is named in the docstring as not statable.

### Ownership and citations

- The change adds no ownership claim. It only names consumers.
- No other open `Suggested.lean` declares a name in `TauCetiRoadmap.RamificationOfCompleteDiscretelyValuedFields`. The mentions in #856 (line 38), #1411 (lines 102, 1449, 1451), #1795 (line 21) and #1812 (line 22) are docstrings or comments.
- `roadmaps resolve` and `roadmaps overlaps` report nothing for this roadmap.

### Sources: the seeded sample

The five sampled targets fall in untouched text:
- the perfect-residue Herbrand package;
- residue enlargement;
- proalgebraic units;
- graded norms;
- agreement with `Breve E`.

None of them falls in the changed passages, so their verification is carried from r12, rows 39–43 and its Sources section:
- serre1961 lines 860–950 and 1092–1232;
- ega3 lines 637–639 and 733–737;
- serre1960 lines 162–1261;
- brinon-conrad lines 259 and 378–386.

The README flags no locator as unverified.

### Remarks on untouched text (no change requested)

- The description's *Why* and *Merge order* paragraphs say that #879 consumes and cites §§3a.1–3a.3 and §§4a.1–4a.3. #879 (`9856719`, lines 124–131) cites only PadicPeriodRings §0.3 and ArithmeticGaloisRepresentations §3.0, which agrees with the README's last downstream sentence.
- #879 lines 126–128 attribute characteristic-0 Hasse–Arf over these fields to "PadicPeriodRings §2", although this is this roadmap's §3a.3. That is a defect in #879, not in this folder.

## Not verifiable

- Serre, *Local Fields* (`serre-local-fields`) is settled in the manifest as uncertified. Its locators are cited without the text, as in r12:
  - II §2, Proposition 3;
  - III §6, Proposition 12;
  - IV §1, Propositions 1, 2 and 4;
  - IV §3, Propositions 14, 15 and Exercise 3;
  - V §7, Theorem 1.
- serre1961 line 1197, the proof of Proposition 8(i) on p. 135, cites "corollaire 2 de la proposition 3", where the bound used is Corollary 2 of Proposition 7. The cache holds Numdam's OCR layer, and no page image could be rendered on this worker, so I cannot tell a printing slip from an OCR error.

## Source issues

- none
