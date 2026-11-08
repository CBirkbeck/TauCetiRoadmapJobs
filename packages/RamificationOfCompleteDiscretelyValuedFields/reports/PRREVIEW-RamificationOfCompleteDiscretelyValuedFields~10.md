# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at 42d223e)

**Verdict:** needs changes

This is a full review: the folder changed by 880 lines since 4afb43d. The pins are unchanged (`lake-manifest.json` and `lean-toolchain` are identical at both heads). 4afb43d is not an ancestor of 42d223e: the branch now descends from 6260b60 through 6af1c8a and 42d223e. So some repairs made on the 4afb43d line are absent here (R01, R06).

- **Gate.** I reran it at this head and every check passes (`set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`).
- **Dependency check.** `depcheck: 239 roadmaps, 2351 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The roadmap is line 2 of the merge order, after JacobianChallenge.
- **Elaboration.** `lake env lean TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/Suggested.lean` exits 0. Its only output is five `declaration uses sorry` warnings, at lines 66, 115, 134, 155 and 179.
- **Outside the folder.** `git diff --stat origin/main...HEAD` lists no file outside the folder.
- **Gaps.** There is no `design/plan.json`, so no gaps are declared.

There are seven findings: four P2 and three P3. R02 and R03 need no further change in this folder; their repairs are in other pull requests.

## Previous findings (review at 4afb43d)

- **R01 (P2), ClassFieldTheory #1411 owns the absolute upper groups: not repaired.** #1411 is still at 71f458c. Its `TauCetiRoadmap/ClassFieldTheory/README.md` lines 177–179 still say they "are owned here (Layer 7, `absoluteUpperRamificationGroup`)". The description still says "#1411 consumes its §4a.1 absolute filtration". This is raised again as R02.
- **R02 (P2), PadicExtensionFamilies #1713 builds §4a.2's `ψ_(L/K)`: repaired in this folder, not in #1713.**
  - Scope, lines 104–108: "The function `ψ_(L/K)` of a finite separable, not necessarily Galois, extension of nonarchimedean local fields … is §4a.2's".
  - §4a.2, lines 774–783: the finite-level subgroup identity and the integral formula at every finite Galois `M ⊇ L`.
  - *Downstream consumers*, lines 959–962: PadicExtensionFamilies is listed.
  - #1713 is unchanged at f85522c, so the object still has two owners. This is raised again as R03.
- **R03 (P3), the description omitted two suppliers: repaired, but now inaccurate the other way.** The description now names "EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia) and ReductiveGroupsPartII §RG2.0.4 (§4a.3)". This head's README no longer cites EtaleCohomologyFoundations (§4a.1 now uses Mathlib's `ValuationSubring.inertiaSubgroup`). See R07.

## R01 (P2) — §4a.1's headlines are statable at the pins but are absent, and the stated reason is wrong

**Location.**
- `Suggested.lean` lines 30–38: "Not statable at the pins … the absolute upper filtration of `Field.absoluteGaloisGroup K` … neither pinned library makes that ring a local ring".
- README lines 250–254, which say the same.

**Claim.**
- The definition does not need `integralClosure A M` to be a local ring. At each finite level, use the valuation subring `O ∩ M` of `M`, which Mathlib makes a local ring, acted on by its decomposition group.
- §4a.1 itself already uses this carrier for inertia (README lines 690–693: "`ValuationSubring.inertiaSubgroup K O`, for the valuation subring `O` …").
- The following §4a.1 headlines are therefore statable but absent: the definition of `G_K^u`, `G_K^0` = inertia, and the finite projections. Per the brief, a statable headline that is absent is P2.

**Witness.**
- 4afb43d's `Suggested.lean` stated `absoluteUpperRamificationGroup K O u` (as `⨅ M` of the comap along `restrictNormalHom` of the upper groups of `(O.comap …).decompositionSubgroup K` acting on `O.comap …`), together with `absoluteUpperRamificationGroup_zero` and `map_restrictNormalHom_absoluteUpperRamificationGroup`.
- I pasted those three declarations, unchanged, after this head's line 183 in a scratch copy. `lake env lean` exits 0, and the only warnings are `sorry`.

**Repair.**
1. Restore the three declarations under `/-! ## Layer 4a … -/`, with their 4afb43d docstrings. In `map_restrictNormalHom_absoluteUpperRamificationGroup`, keep the hypotheses `IsDiscreteValuationRing`, `IsAdicComplete` and `PerfectField` on `O.comap (algebraMap K (AlgebraicClosure K))`.
2. Name the three declarations in README §4a.1.
3. Rewrite the docstring's not-statable list (lines 30–48) and README lines 250–254, keeping only:
   - §4a.2's open-subgroup identity, with 4afb43d's reason: `G_L` is the subgroup fixing `L` in `G_K`, not `Field.absoluteGaloisGroup L`;
   - §4a.3.
4. Handle `G_K^(0+) = P_K` in one of two ways:
   - state it, with `P_K := ⨅ M, comap` of the image of the decomposition group's `ramificationGroup … 1`, on the same carriers;
   - or keep it in the docstring, with that as the reason it is omitted, not the absence of a general `wildInertiaSubgroup`.

**Tested.** All three statements elaborate at these pins, as above. Their values on `ℚ_2(ζ_8)` and the inertia instances are rows 24–27 of the table.

## R02 (P2) — ClassFieldTheory #1411 still owns the absolute upper groups that §4a.1 owns

**Location.**
- README lines 100–104: the groups `G_K^u` of a nonarchimedean local field "at every real depth `u ≥ −1` and in particular at the integers, are §4a.1's".
- The description: "#1411 consumes its §4a.1 absolute filtration".

**Claim.** At #1411's head (71f458c, unchanged), ClassFieldTheory Layer 7 defines `absoluteUpperRamificationGroup K n` on local fields. It also states as its own targets their closedness, normality, antitonicity, finite projections and `G_K^0` = inertia. These are §4a.1's statements at integer depths, so the object has two owners.

**Witness.**
- `TauCetiRoadmap/ClassFieldTheory/README.md` at #1411, lines 177–179: "The absolute upper ramification groups of a nonarchimedean local field are owned here (Layer 7, `absoluteUpperRamificationGroup`)".
- The same README, lines 1450–1459.
- `TauCetiRoadmap/ClassFieldTheory/Suggested.lean` at #1411, line 1459: `noncomputable def absoluteUpperRamificationGroup (n : ℕ)`.

**Repair.** No change in this folder. In #1411:
1. Replace "are owned here (Layer 7, …)" with a citation of RamificationOfCompleteDiscretelyValuedFields §4a.1.
2. Delete `isClosed_absoluteUpperRamificationGroup`, `absoluteUpperRamificationGroup_normal`, `absoluteUpperRamificationGroup_antitone`, `map_restrictNormalHom_absoluteUpperRamificationGroup` and `absoluteUpperRamificationGroup_zero` as targets.
3. Keep the definition only as far as its reciprocity headline needs it, with a docstring identifying it with §4a.1's `G_K^n`.

Until then, the description should say that #1411 *is to cite* §4a.1, not that it consumes it.

**Tested.** On `ℚ_2 ⊂ ℚ_2(ζ_8)`, both definitions give `G`, `{1, 5}` and `1` at `n = 1, 2, 3` (`ψ(1) = 1`, `ψ(2) = 3`, `ψ(3) = 7`).

## R03 (P2) — PadicExtensionFamilies #1713 still claims §4a.2's non-Galois `ψ_(L/K)`

**Location.** README lines 104–108 (Scope) and §4a.2, lines 766–783.

**Claim.**
- This roadmap now claims the function and its finite-level forms. It comes first in the merge order (line 2 against line 394), so it is the right owner.
- #1713 (head f85522c, unchanged) still constructs the same function on nonarchimedean local fields and claims it. So the object still has two owners.

**Witness.** `TauCetiRoadmap/PadicExtensionFamilies/README.md` at #1713:
- lines 275–276: "The non-Galois Herbrand construction is §2.0 here";
- lines 712–725: "define `ψ_{L/K} := φ_{M/L} ∘ ψ_{M/K}` … Prove independence of `M`", then the tower law, `Gal(M/L) ∩ Gal(M/K)^u = Gal(M/L)^{ψ_{L/K}(u)}` and the integral formula.

**Repair.** No change in this folder. In #1713, replace §2.0's construction and the sentence at line 276 with a citation of RamificationOfCompleteDiscretelyValuedFields §4a.2. Its Checks (such as `ℚ_2(∜2)`) may stay there as consumer Checks.

**Tested.** On `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ ℚ_3(ζ_9)`, both definitions give `ψ_(L/K)(u) = 2u` (`φ_(M/L)(ψ_(M/K)(1)) = φ_(M/L)(2) = 2`, `φ_(M/L)(5) = 3`). Both also give the same finite identity (rows 22 and 28).

## R04 (P2) — The layer citations of LocalFieldsRamification break under its open revision #617

**Location.**
- README lines 27–29: "Layer 0 for finite extensions and `e`, `f`; Layer 2 for unramified extensions; Layer 3 for …; Layer 4 for the absolute Galois group".
- The supplier contract, lines 181, 189, 192 and 205.
- The *Needs* and proof citations at lines 258, 337, 351, 421, 451, 670, 681, 696, 737–741, 808, 878, 897, 907–908 and 933.

**Claim.**
- At #617's head (4fd7aa6), `Completed/LocalFieldsRamification/README.md` has only Layers 0–2, and they hold different material:
  - Layer 0 is "complements on the native carriers";
  - Layer 2 is "the Hasse–Arf theorem".
- Its table of former numbers sends old Layers 0–4 to supplier-contract headings, but it also says "current Layers 0–2 are the sections below".
- So after #617 merges, this README's "Layer 0" and "Layer 2" citations point at the wrong material. Its "Layer 3" and "Layer 4" no longer exist as layers.
- These are supplier citations, and none cites the id as it is at #617's head.

**Witness.** #617's `Completed/LocalFieldsRamification/README.md`:
- line 299: `## Layer 0: complements on the native carriers`;
- line 476: `## Layer 2: the Hasse–Arf theorem`;
- lines 274–275: "current Layers 0–2 are the sections below".

**Repair.** Cite this material through the pinned Tau Ceti declarations, which every one of these citations already names, as 4afb43d did ("cited through the Tau Ceti declarations that prove its results, by name and by file").
1. In lines 26–32 and 175–220, list the consumed declarations under *From Tau Ceti*.
2. Refer to LocalFieldsRamification without layer numbers.
3. In each *Needs*, replace "the completed roadmap's Layer k (`X`)" with "Tau Ceti `X`".

This makes no open revision a dependency. The alternative is to cite #617's contract headings and name #617 in the merge-order paragraph.

**Tested.** After this repair, no citation of LocalFieldsRamification uses a layer number. All 72 library names the README backticks resolve at the pins (`#check @` file, exit 0).

## R05 (P3) — §4a.1's Serre 1961 locator is missing the "totally ramified" scope

**Location.** README lines 701–703: "(Jean-Pierre Serre, *Sur les corps locaux …*, n° 3.1, the paragraph after Proposition 3, printed p. 128.)"

**Claim.** In n° 3.1, Serre restricts to totally ramified `L/K` (serre1961 lines 860–863). The paragraph after Proposition 3 (lines 936–938) defines `G^y` for an infinite Galois extension in that setting only. §4a.1 covers every perfect residue field, where `G_K` is not totally ramified. The other n° 3.1 citations already carry the qualifier (lines 329–330, 428 and 787).

**Witness.** serre1961 lines 861–863: Serre no longer assumes `k` algebraically closed in this numbered paragraph, but restricts to totally ramified `L/K`.

**Repair.** Append ", for totally ramified extensions" to the locator at line 703. The general case rests on the proof given (Herbrand's theorem of §3a.2 plus compactness).

**Tested.** With the qualifier added, the citation's setting matches serre1961 lines 860–863.

## R06 (P3) — §4a.1's proof over an imperfect `K` uses the separable-closure comparison without citing it

**Location.**
- README lines 705–708: "`G_K^u` is the inverse limit of these nonempty finite sets along surjections; it is closed, and it maps onto each of them … A `σ ≠ 1` moves an element of some finite `M`".
- *Needs*, lines 736–746.

**Claim.**
- `G_K` is `Field.absoluteGaloisGroup K`, the automorphisms of `AlgebraicClosure K`. For `K = F̄_p((t))`, the roadmap's main equal-characteristic base, `AlgebraicClosure K` is not separable over `K`, so Mathlib's infinite Galois theory does not apply to it directly.
- Two steps need the comparison of `G_K` with `Gal(K^s/K)`:
  - surjectivity onto the inverse limit of the `Gal(M/K)`;
  - "`σ ≠ 1` moves an element of some finite `M`", which uses that `AlgebraicClosure K` is purely inseparable over `K^s`.
- The pinned Tau Ceti provides this comparison, but this head does not cite it. 4afb43d did.

**Witness.** Tau Ceti `FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean`:
- line 340: `absoluteGaloisGroupRestrictEquiv : Field.absoluteGaloisGroup K ≃ₜ* AbsoluteGaloisGroup K`;
- line 374: `instance : CompactSpace (Field.absoluteGaloisGroup K)`.

**Repair.**
1. In the §4a.1 proof, after "it is closed", add: "restriction is Tau Ceti's topological isomorphism `TauCeti.absoluteGaloisGroupRestrictEquiv` onto the Galois group of the separable closure, so `G_K` is compact and is the inverse limit of the `Gal(M/K)`, and an automorphism that is trivial on the separable closure is trivial".
2. Add `TauCeti.absoluteGaloisGroupRestrictEquiv` and the `CompactSpace` instance to the *Needs* and to the Tau Ceti contract (lines 154–173).

**Tested.** For `x = t^(1/p)` over `F̄_p((t))`: `x^p ∈ K`, and `σ(x)^p = x^p` forces `σ(x) = x`. So `σ` is determined on the separable closure, as the cited isomorphism asserts.

## R07 (P3) — The dependency lists name suppliers that nothing consumes

**Location.**
- README lines 943–945: "**ProfiniteCohomology → ProfiniteProPGroups → LocalFieldsRamification → this roadmap**".
- The description's *Dependencies*: "EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia)".

**Claim.**
- No section, *Needs* line or contract of this README consumes anything from ProfiniteCohomology or ProfiniteProPGroups. Those two names appear only at lines 944–945.
- EtaleCohomologyFoundations is no longer cited anywhere in the README.

**Witness.** Searching the README for "ProfiniteCohomology", "ProfiniteProPGroups" and "EtaleCohomology" finds only lines 944–945 and no "EtaleCohomology" at all.

**Repair.**
1. Make line 943–945 "The external dependency order is LocalFieldsRamification → this roadmap". Alternatively, cite the pro-`p` notion used at line 694 (`P_K` is pro-`p`) from ProfiniteProPGroups by section.
2. In the description, drop EtaleCohomologyFoundations §F.3a and keep ReductiveGroupsPartII §RG2.0.4.

**Tested.** After the edit, every roadmap named in the dependency order has a consumed section in the supplier contracts.

## Verified sound

**Adversarial pass.** There are 39 rows, all recomputed at this head. Notation:
- `Z8` is `ℚ_2(ζ_8)/ℚ_2`, with `#G_0..#G_4 = 4, 4, 2, 2, 1`.
- `Z9` is `ℚ_3(ζ_9)/ℚ_3`, with `#G_0..#G_3 = 6, 3, 3, 1`.
- `S3` is `ℚ_3(ζ_3, ∛3)/ℚ_3`, with `G_0 = S_3`, `G_1 = G_2 = G_3 = C_3` and `G_4 = 1`.
- `AS` is `y^p − y = t⁻¹` over `k((t))`.
- `I2` is `F_2(s)((t))(y, w)` with `y² − y = s t⁻²` and `w² − w = t⁻¹`, and `L₁ = K(y)`.
- `CpCp` is `F_p(s,u)((t))(y₁, y₂)` from the §3a.1 monogenicity Check.

| # | Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | Hilbert (Lean 66) | `Z9` | `Σ(#G_i − 1) = 5 + 2 + 2 = 9`; disc `ℚ(ζ_9) = 3^(3(6−2−1)) = 3^9`, `f = 1` | agrees | none |
| 2 | same | `S3` | `5 + 2·3 = 11`; tower `d(M/K′) + e·d(K′/ℚ_3) = 2·4 + 3·1 = 11` | agrees | none |
| 3 | same | `G = 1` | IsInvariant + faithful give `A ≅ B`; `differentIdeal = ⊤ = 𝔪^0`, `Σᶠ = 0` | agrees | none |
| 4 | same, separability dropped | `CpCp`, `p = 2` | `d = (p−1) + 1·(p−1) = 2` from `f′(z_j) = −t^(p−1)`; all `i(σ) = 1`, so `Σ(#G_i − 1) = p² − 1 = 3` | hypothesis needed | none |
| 5 | `herbrandFun` (Lean 85) | `Z8` | integrand `1, 1/2, 1/2, 1/4` on `(0,1], (1,2], (2,3], (3,4]`: `φ(1) = 1`, `φ(3) = 2`, `φ(7) = 3` | agrees with Checks | none |
| 6 | same, below `−1` | unramified quadratic | integrand `2` on `(−2,−1]`: `φ(−2) = −3`, `ψ(−2) = −3/2` | statements restricted to `≥ −1` | none |
| 7 | `inverseHerbrandFun` (Lean 94) | finite `G`; `S3` | integrand `≥ 1/#G_0`, so `{u : v ≤ φ(u)} = [φ⁻¹(v), ∞)`; `ψ(1) = 2`, `ψ(2) = 3 + 6·(1/2) = 6` (integral, by Lagrange, serre1961 lines 920–926) | agrees | none |
| 8 | `upperRamificationGroup` (Lean 101) | `Z8`, `v = 3` | `G^3 = G_(ψ(3) = 7) = 1`, while `G_3 = {1, 5}` | wrong model `G_v` excluded | none |
| 9 | Herbrand (Lean 115) | `S3`, `H = C_3` | `v = 0`: `S_3 ↦ C_2 = (G/H)^0`; `v = 1/2`: `G^(1/2) = G_1 = C_3 ↦ 1`, `(G/H)^(1/2) = (G/H)_1 = 1` | agrees | none |
| 10 | same | `Z8`, `H = {1, 7}`, `v = 2` | `G^2 = {1, 5} ↦ G/H`; `(G/H)^2 = (G/H)_2 = G/H` (`v(−2√2) = 3`) | agrees | none |
| 11 | same, separability dropped | `I2`, `H = Gal(M/L₁)` | all `i(σ) = 2`; `(G/H)_1 = 1`; `(G/H)^(1/2) = 1` against `G^(1/2)H/H = G/H` | hypothesis needed | none |
| 12 | tower (Lean 134) | `Z9`, `u = 5` | `φ_G(5) = 1/2 + 1/2 + 3/6 = 3/2`; `φ_H(5) = 2 + 1 = 3`; `φ_(G/H)(3) = 3/2` | agrees | none |
| 13 | same | `S3`, `u = 5` | `φ_G(5) = 3/2 + 2/6 = 11/6`; `φ_H(5) = 11/3`; `φ_(G/H)(11/3) = 11/6` | agrees | none |
| 14 | same, order of composition | `Z8`, `L = ℚ_2(√2)` | `H_1 = H`, `H_2 = 1` (`v(ζ⁻¹ − ζ) = 2`); `ψ_(L/K)(3) = 4`, `ψ_(M/L)(4) = 7 = ψ_(M/K)(3)`; reversed: `8` | agrees with Check | none |
| 15 | same, separability dropped | `I2`, `u = 1` | `φ_(M/K)(1) = 1`; `φ_(L₁/K)(φ_(M/L₁)(1)) = 1/2` | hypothesis needed | none |
| 16 | Hasse–Arf (Lean 155) | `Z9` | `j = 0`: `6 ∣ 0`; `j = 2`: `6 ∣ 6`; non-jump `j = 1`: `6 ∤ 3`, excluded by `hj` | agrees | none |
| 17 | same | `Z8` | `j = 1`: `4 ∣ 4`; `j = 3`: `4 ∣ 8`; non-jump `j = 2`: `4 ∤ 6` | agrees | none |
| 18 | same, commutativity dropped | `S3` | `j = 3`: `Σ_(i=1..3) #G_i = 9`, `6 ∤ 9` (upper jump `3/2`) | `IsMulCommutative` needed | none |
| 19 | same | `C_9` filtration (Check, line 654) | `j = 5`: `9 + 3·4 = 21`, `9 ∤ 21`; `φ(5) = 7/3`; subgroup break `5`, quotient break `1` | correctly unrealizable | none |
| 20 | same, not totally ramified | `ℚ_9(ζ_3)/ℚ_3`, `G = C_2 × C_2` | `G_0 = C_2`, `G_1 = 1`; only `j = 0`: `2 ∣ 0`; upper jumps `−1, 0` | agrees | none |
| 21 | subgroup identity (Lean 179) | `S3`, `#H = 2`, `u = 1, 2` | `ψ_G(1) = 2`, `G_2 ∩ H = 1`, `φ_H(2) = 1`, `H^1 = H_2 = 1`; `ψ_G(2) = 6`, `φ_H(6) = 3`, `H^3 = H_6 = 1` | agrees | none |
| 22 | same | `Z9`, `H = Gal(M/ℚ_3(ζ_3))`, `u = 1, 3/2` | `G_2 ∩ H = H = H^2`; `G_5 ∩ H = 1 = H^(φ_H(5) = 3) = H_5` | agrees | none |
| 23 | same, no hypotheses on `S` | trivial `C_2` on `ℤ_2`, `H = 1` | all `G_i = C_2`, `φ = id`; both sides are `⊤` of the trivial group | agrees; one-tactic probe leaves it open | none |
| 24 | §4a.1 `G_K^u` (README 686) | `ℚ_2`, level `Z8`, `u = 1, 2, 3` | images `G`, `{1, 5}`, `1` (`G_1`, `G_3`, `G_7`) | agrees with Check | R01 |
| 25 | §4a.1 `G_K^0 = I_K` | `Frac W(F̄_p)`; `ℚ_p` Frobenius lift | residue field of `O` is `k̄ = k`, so `G_K = I_K`; the lift acts by `x ↦ x^p`, and `ζ_(p²−1)^p ≠ ζ_(p²−1)` | agrees | R01 |
| 26 | §4a.1 `G_K^(0+) ≠ G_K^0` | `Frac W(F̄_3)(ζ_3)` | `I_K ↠ C_2`; `P_K ↦ G_1 = 1` | agrees | none |
| 27 | §4a.1 statability | 4afb43d's three declarations at these pins | `lake env lean` exit 0, warnings only `sorry` (scratch lines 213, 229) | statable | R01 |
| 28 | §4a.2 (README 774–783) | `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ Z9` | `ψ_(L/K)(1) = φ_H(2) = 2`, `ψ_(L/K)(3/2) = φ_H(5) = 3`; integral: index `[G : G^tH] = 2`, `f = 1`, so `2u` | agrees | none |
| 29 | same, non-Galois | `S3`, `L = ℚ_3(∛3)` | `ψ = u` on `[0, 3/2]` (`C_3 H = G`, index `1`), then `3u − 3` (index `3`); `G^1 ∩ H = 1 = H_2` | agrees | none |
| 30 | same | unramified `L`; tame degree `e` | `ψ = u`; `ψ = eu` (Galois closure tame, `[G : H] = e`) | agrees | none |
| 31 | §4a.3 base change | `Z9` | `e = 6`, `d = 9`, `d/e = 3/2`, upper jumps `φ(0) = 0`, `φ(2) = 1` | agrees | none |
| 32 | same | unramified `L/K` | `L′ = K′`, `G_0 = 1`, `d = 0`; Galois group and `f` lost | agrees | none |
| 33 | sampled: Breve E agreement | `ℚ_p`; `F_q((t))`; `√p` | `K′ = W(F̄_p)[1/p]`; `Σ a_n tⁿ` with `[F_q(a_n) : F_q] = n!` lies in `F̄_q((t))` but in no `F_(q^n)((t))`; `v(√p) = 1/2 ∉ ℤ` | agrees | none |
| 34 | sampled: perfect-residue package | `AS` over `F̄_p((t))`; `ζ_p` over `Frac W(F̄_p)`; `Z8` | `σ(y⁻¹) − y⁻¹ = −1/(y(y+1))`, valuation `2`: `d = 2(p−1)`, break `1`; degree `p − 1`, `d = p − 2`, break `0`; lower `1, 3` ↦ upper `1, 2` | agrees | none |
| 35 | sampled: residue enlargement | `κ[[t]] → κ̄[[t]]`; `F_(p²)/F_p`; tame `e` | `t` stays a uniformizer; `F_(p²) ⊗ F̄_p ≅ F̄_p × F̄_p` splits; `#G_0 = e`, `G_1 = 1` kept | agrees | none |
| 36 | sampled: proalgebraic units | `E = F`; `AS` | `V = 1`; `π₀(V) ≅ H/[H, H] = C_p` (serre1961 lines 630–639) | agrees | none |
| 37 | sampled: graded norms | tame `C_e`; `AS` | `ψ(s) = es`, depth-0 kernel `μ_e`, `π₀(V_s) = H_(es) = 1` for `s ≥ 1`; `ψ(1) = 1`, `ψ(2) = p + 1`, `π₀(V_1) ≅ C_p`, `π₀(V_2) = 1`; over `F_p` an additive map with kernel of order `p` misses `p − 1` classes | agrees | none |
| 38 | §3a.1 graded character | `AS`, level `1` | `(σ(y⁻¹) − y⁻¹)/y⁻² = −y/(y + 1) ↦ −1`; unscaled `σπ/π ↦ 1` | agrees | none |
| 39 | §3a.1 separability Check | `F_p(s)((t))(z)`, `z^p − t^(p−1)z = s` | `σz − z = t`, `v = 1`: `G_0 = C_p`, `G_1 = 1`, `#G_0/#G_1 = p` while `e = 1` | agrees | none |

**Signatures.**
- I elaborated `#check @` of the eight declarations once in a scratch copy (plus 4afb43d's three, for R01). The types match `signatures.md`.
- The file has no `variable` block, so no binder can be lost.
- Each generality matches the README:
  - DVRs `A`, `B`, `Algebra.IsInvariant A B G`, `FaithfulSMul G B`, separable residue extension, no completeness;
  - `IsMulCommutative G` only in Hasse–Arf;
  - the subgroup identity for any finite `G` acting on any local ring.

**Padding.** In a scratch copy I replaced every `sorry` with `first | rfl | simp | infer_instance | aesop | norm_num | (ext; simp) | exact le_antisymm (by simp) (by simp)`.
- All five theorems stay open ("unsolved goals" at lines 75, 125, 144, 166 and 183).
- The three definitions are the ones the theorems need, with real bodies.
- `subgroupOf_upperRamificationGroup` needs `ψ_H ∘ φ_H = id`, which is not a simp fact.

**Headlines.**
- Stated:
  - Hilbert's formula (§3a.1);
  - `φ`, `ψ`, the upper numbering, Herbrand's theorem and tower transitivity (§3a.2);
  - lower-numbering Hasse–Arf (§3a.3);
  - the finite-level subgroup identity (§4a.2).
- Absent but statable: §4a.1 (R01).
- Correctly named as not statable:
  - §4a.2's open-subgroup identity: `G_L` is not `Field.absoluteGaloisGroup L`;
  - §4a.3: `TauCeti.maximalUnramifiedExtension` assumes `IsNonarchimedeanLocalField`;
  - §3a.3's proalgebraic and graded-norm targets: there are no perfect quasialgebraic groups at the pins.

**Library declarations.** All 72 Lean-style names the README backticks resolve by `#check @` at the pins. Opened by hand:
- Tau Ceti `RingTheory/LocalRing/RamificationGroup.lean`:
  - lines 118 (`ramificationGroup = Ideal.inertia G (𝔪 ^ (i + 1).toNat)`), 145, 166, 183, 220, 233 and 260;
  - lines 325 (needs `IsNoetherianRing`, `FaithfulSMul` and `Finite G_0`), 444, 469, 520, 561, 722 (`G_⌈u⌉`) and 750.
- Tau Ceti `DiscreteValuationRing/Monogenic.lean:70` (`Module.Finite`, `FaithfulSMul`, separable residue; no completeness).
- Tau Ceti `Unramified/Maximal.lean:97` and `:298`.
- Tau Ceti `Herbrand/HasseArf/Abelian.lean:50` (`IsAbelianGalois`).
- Tau Ceti `Unramified/Inertia/Finite.lean:57` and `WildInertia.lean:702` (images `lowerRamificationGroup … 0` and `… 1`).
- Tau Ceti `FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean:227` (`fixingSubgroup_fixedField`, `Normal`), `:340` and `:374`.
- Mathlib:
  - `RingTheory/IsGaloisGroup/Defs.lean:53`: `IsGaloisGroup` bundles `faithful`, `commutes` and `isInvariant`, as README line 143 says;
  - `conductor_mul_differentIdeal` (needs `K[x] = ⊤`, `IsDedekindDomain B`, separable);
  - `differentIdeal` (`DedekindDomain/Different.lean:481`);
  - `IsKrasner.of_completeSpace_of_normal` (complete ultrametric `K`, `Normal K L`);
  - `Ideal.sum_ramification_inertia_eq_card` (`Module.Finite`, `Module.Flat`, `IsGaloisGroup`).
- No pinned declaration makes `integralClosure A M` local. Tau Ceti's `RingTheory/LocalRing/Unibranch.lean` concerns a ring's own fraction field. This does not save the docstring's reason (R01).

**Cross-roadmap citations resolved** (main 94294cd):
- ReductiveGroupsPartII §RG2.0.4, line 852 (`Breve E = UniformSpace.Completion (Unramified E)`, residue field, uniformizer, Frobenius);
- ReductiveGroups Layer 3, line 234;
- SchemeAndStackFoundations §0.24, line 1565;
- AdicSpacesPartII §R0.19.9, line 7793;
- `Completed/LocalFieldsRamification` Layers 0 (line 72), 2 (576), 3 (724) and 4 (1154).

All are on main, so all are permitted. `roadmaps resolve` and `roadmaps overlaps` report nothing. The renumbering in #617 was found by reading its head (R04).

**Ownership against open pull requests** (checked with `roadmaps grep` and the sibling checkouts).
- These cite or consume this roadmap without defining its objects:
  - LocalFieldsRamification #617 (line 39);
  - ArithmeticGaloisRepresentations #856;
  - PadicPeriodRings #940;
  - FilteredLocalGaloisGroups #1795, lines 52–55 and 140–150. Its group-theoretic `ψ_H` of a filtered compact group is a different, abstract object, identified with §4a.2 there.
  - FieldOfNorms #1812, whose APF functions are a different object.
- HigherLocalClassFieldTheory #1813 has no overlap.
- The board package LocalFieldsRamificationPartII (merge order line 382) owns the ramification tower of general valued fields. It is later, so §4a.3's `K^ur` for a complete DVF is this roadmap's.
- The second owners are #1411 (R02) and #1713 (R03).
- No `Suggested.lean` I can read declares a fully qualified name of this file. #1411's `absoluteUpperRamificationGroup` is in `TauCetiRoadmap.ClassFieldTheory`.

**Sources: the seeded sample**, all checked against the cached texts.
- serre1961: printed page = PDF page + 103; "corps local" means a complete discretely valued field (line 28).
- **The perfect-residue Herbrand package:**
  - serre1961 n° 3.1, totally ramified, lines 860–863, p. 126;
  - formula (5) and properties a–d′, lines 897–926, p. 127;
  - (8), Propositions 3–4 and the Remarque, lines 927–950, p. 128;
  - n° 3.4–3.5, below;
  - brinon-conrad Exercise 1.4.4(3), lines 382–386, p. 10, for `p`-adic fields (Definition 1.3.1, line 259).
- **Residue enlargement:** ega3 (10.3.1), lines 637–639, p. 20; (10.3.1.5) and the completion remark, lines 733–737, p. 23.
- **Proalgebraic units:**
  - serre1961 §1, n° 1.1–1.6, lines 74–365, pp. 106–113;
  - n° 2.1, line 557, p. 118;
  - Proposition 1 with its Corollary, Proposition 2 with its Corollary and the Remarque, lines 585–621, p. 119;
  - Proposition 3 with its Corollary, lines 630–639, p. 120.
  - serre1960 (printed page = PDF page + 1):
    - Definition 2, line 162, p. 8;
    - Proposition 10 of n° 1.4, line 313, p. 11;
    - Propositions 6–7, lines 546 and 575, pp. 17–18;
    - n° 2.5 Proposition 10 with Corollaries 1–2, lines 625–636, p. 19;
    - n° 5.1 Propositions 1–2, lines 1246–1261, p. 35.
- **Graded norms:** serre1961:
  - Proposition 6 (a)–(b) with (20), lines 1092–1099, p. 132;
  - Proposition 7 with (22)–(23) and Corollaries 1–3, lines 1148–1184, pp. 134–135;
  - Proposition 8 (i)–(iii), lines 1187–1192, p. 135;
  - Corollary 1, lines 1224–1232, p. 136.
- **Agreement with `Breve E`:** brinon-conrad Exercise 1.4.4(2)–(3), lines 378–386, p. 10; the proof of Lemma 13.1.6, lines 8585–8589, p. 201.

## Not verifiable

- Serre, *Local Fields* (`serre-local-fields`) is settled in the manifest as uncertified (paywalled). I relied on these locators without reading them: II §2 Proposition 3; III §6 Proposition 12; IV §1 Propositions 1, 2 and 4; IV §3 Propositions 14 and 15 and Exercise 3 (the quaternion Check, line 646); V §7 Theorem 1.
- serre1961 line 1197 (proof of Proposition 8(i), p. 135) reads "corollaire 2 de la proposition 3". The bound used is Corollary 2 of Proposition 7, and Proposition 3 has only one corollary. The cached text is Numdam's OCR layer, and I could not render the page image (no PDF renderer on this worker). So I cannot tell a printing slip from an OCR error.

## Source issues

- none
