# Review of QuaternionArithmetic (pull request #1722 at e95462a)

**Verdict:** needs changes

This is a full review: 283 lines of the folder changed since 6f0692a. All seven findings of the previous review are repaired; see *Previous findings*. R03 there is repaired in the interim form that review offered.

There are three new findings, all P3. Two are in the seeded sample (§§0.6, 2.2) and one is a Lean import rule. The four headlines added this round (maximality over `𝓞 F`, Eichler's theorem, Brandt commutativity, Hecke semisimplicity) are correctly stated at every instance I computed, and their locators check out.

## R01 (P3) — §0.6 (seeded sample): the *Needs* line omits the local splitting step

**Location.** `TauCetiRoadmap/QuaternionArithmetic/README.md:599–602`: "prove that an F-algebra embedding K → B exists iff no ramified place of B splits in K ([V, 14.6.7]). … *Needs:* 0.2–0.5; GL2AutomorphicRepresentationsAndTransfer R17.1.5; GlobalNumberFields Layer 1."

**Claim.** The statement and the theorem number are right: [V, 14.6.7] (iii)⇔(v), p. 224, `voight line 9981`, for a separable quadratic `K/F`. The proof of (v)⇒(iii) takes two steps:
- (v)⇒(ii): at a ramified `v`, the quadratic field `K_w` splits `B_v`. This is [V, 13.4.4] (p. 202).
- (ii)⇒(i)⇒(iii): `B ⊗ K` is split at every place, so `B ⊗ K ≅ M₂(K)` by global uniqueness over `K`, and then `K` embeds.

The *Needs* line names a supplier only for the second step. R17.1.5 is a global realization and uniqueness theorem; it says nothing about local splitting by an extension.

**Witness.** Voight's proof of (v)⇒(ii) cites Proposition 13.4.4 (`voight lines 9999–10001`). R17.1.5 at its head proves realization and isomorphism from local splitting only. The local input is at the pin: Tau Ceti `invMap_brRes`, `inv_L(res x) = [L:K]·inv_K x`.

**Repair.** Replace the *Needs* line and add the page:
- "… iff no ramified place of B splits in K ([V, 14.6.7], p. 224)."
- "*Needs:* 0.2–0.5; the local splitting of `B_v` by a quadratic field `K_w/F_v` ([V, 13.4.4], p. 202), at a finite place from Tau Ceti `TauCeti.ClassFieldTheory.invMap_brRes` (`NumberTheory/ClassFieldTheory/Brauer/Invariant.lean`) with 0.3's invariant reading, and `ℂ ⊗_ℝ ℍ ≅ M₂(ℂ)` at a real place; Tau Ceti `baseChangeTwoParams`; GL2AutomorphicRepresentationsAndTransfer R17.1.5, applied over `K` to `B ⊗ K`."

**Repair tested** on `K = ℚ(i)`, `B = ℍ[ℚ,-1,-1]`:
- At `v = 2`: `[ℚ₂(i):ℚ₂] = 2` gives `inv = 2·(1/2) = 0`.
- At `∞`: `ℂ` splits `ℍ`.
- So `B ⊗ ℚ(i) ≅ M₂(ℚ(i))`, and `i ↦ i` embeds.

## R02 (P3) — §2.2 (seeded sample): "sated" is given its left-ideal meaning for right ideals too

**Location.** `README.md:1019`: "equivalent to: every sated (`O_L(I) = O`) left or right fractional `O`-ideal is invertible (`[V, 24.2.3]`)".

**Claim.** A right fractional `O`-ideal is sated when `O_R(I) = O`. Its left order is in general a different order. Read as written, the condition ranges over the wrong right ideals: it excludes principal right ideals, which are invertible.

**Witness.** [V, 16.2.11] (`voight lines 11173–11175`) defines sated on the left by `O_L(I) = O`, "similarly on the right". Take `O = O₀(2)` and `g = diag(2,1)`. Then `I = gO` has `O_R(I) = O` but `O_L(I) = gOg⁻¹ = [[ℤ,2ℤ],[ℤ,ℤ]] ≠ O`.

**Repair.** "equivalent to: every sated left or right fractional `O`-ideal (`O_L(I) = O` for a left ideal, `O_R(I) = O` for a right ideal, `[V, 16.2.11]`) is invertible (`[V, 24.2.3]`, p. 383)". With this wording, `gO₀(2)` is a sated right ideal, and it is invertible because it is principal.

## R03 (P3) — `Suggested.lean` imports a Tau Ceti module that no statement uses

**Location.** `TauCetiRoadmap/QuaternionArithmetic/Suggested.lean:5`: `import TauCeti.NumberTheory.HilbertSymbol.Archimedean`.

**Claim.** The rule is `import Mathlib` followed only by the `TauCeti.*` modules actually used.
- This module contains only theorems: `hilbertSymbol_real` and its relatives, lines 59–159 at the pin.
- No statement or definition in the file uses them.
- `TauCeti.hilbertSymbol` on `ℝˣ`, which `IsDefinite` and `IsTotallyDefinite` use, comes from `HilbertSymbol/Basic.lean:46`.

**Witness.** I elaborated a scratch copy without line 5 with `lake env lean`. It exits 0 with exactly the same 30 `declaration uses sorry` warnings and no other message.

**Repair.** Delete line 5. The README's supplier contract keeps citing `hilbertSymbol_real` for §0.2; that is a proof input, not an import of the statement file.

## Previous findings

Each finding of the review at 6f0692a, checked at this head:

- **R01 (P2, four absent headlines): repaired.**
  - `isMax_iff_discrd_eq_discIdeal` (`Suggested.lean:329–330`) compares `discrd O` with a new `discIdeal a b` (lines 139–142). That is a `Finset` product over the ramified places inside `hasFiniteMulSupport_hilbertSymbol_unitAtFinitePlace`, which matches the README's "never `∏ᶠ`" convention (0.4) better than the `finprod` the previous repair proposed.
  - `classNumber_eq_card_rayClassGroup` (lines 461–465).
  - `brandtMatrix_commute` (lines 667–673).
  - `isSemisimpleRing_adjoin_brandtMatrix` (lines 680–685).
  - The docstring names all four (lines 19–27) and adds the arbitrary-order and locally-norm-maximal forms of [V, 28.5.5, 28.5.17] to the not-statable list (lines 34–37).
  - The README states them in 1.7 (lines 772–774), 4.1 (1388–1393) and 7.3 (1862–1866), with Checks in 4.1 and 7.3. Global number fields Layers 2 and 4 are now in the contracts (lines 201, 393–396), and so are the Tau Ceti ray-class carriers (258–262).
- **R02 (P3, `units`): repaired.** `abbrev units … := O.toSubalgebra.toSubmonoid.units` (`Suggested.lean:216–217`); `Submonoid.units` and `mem_units_iff` are cited (README 219–221, 655–657).
- **R03 (P3, `IntegralOrder` not at the pin): repaired in the interim form the previous review offered.**
  - README 262–270, 303 and 371 now say "at Tau Ceti `2fd255d` (the three modules are absent at `358314d`)".
  - At `2fd255d`: `IsOrder` (`RingTheory/IntegralOrder/Basic.lean:75`), `IsMaximalOrder` (`Maximal.lean:67`) and `Submodule.leftOrder` (`LeftOrder.lean:61`), with no right order under `RingTheory/`. The README's claims hold there.
  - The branch still pins `358314d` and is 361 commits behind `origin/main` (see *Not verifiable*).
- **R04 (P3, §8.6 Ogg): repaired.** Lines 2163–2164 now read "proved here by this route from 8.3 and 6.1–6.4"; "(Ogg's formula)" is gone; the reference (2852–2854) is reworded.
- **R05 (P3, §6.2 local finiteness): repaired.** Line 1658 now reads "for `R` a complete DVR with finite residue field (the standing hypothesis of `[V, §30.5]`), is `[V, 30.5.5]` (p. 541)". The `ℂ[[t]]` counterexample is a reject Check (1665–1671); I recomputed `g_s² = t³` and the diagonal ring map.
- **R06 (P3, ψ as a global index): repaired.**
  - 5.3 API (1567–1569) now reads "`ψ(𝔐) = ∏_{𝔭 | 𝔐}[O(1)_𝔭^× : O_𝔭^×]` … the global index can be smaller".
  - 1.9 (827–832) and the `psi` docstring (303–306) are corrected to match.
  - There is a new Check (1584–1586): `8/12 = 2/3`, global index `4`.
- **R07 (P3, area row): repaired.**
  - The §10.2 row (2630) states its reading as the roadmap's convention and says no knowl defines the column.
  - 9.6 (2450–2452) derives `area(X_H)/(4π)`.
  - 10.3 (2650) gives `1/6` and `1/24`, and both agree with the row's formula.

## Verified sound

**Gate, dependencies, build.**
- **Worker's gate.** Every check is 0 and the result is OK.
- **My rerun.** It agrees except for `depcheck: NOT IN ORDER: QuaternionArithmetic (insert it after its last supplier)`. The candidate order lists this roadmap at 287, right after ArithmeticFuchsianGroups (286). Not a finding.
- **Dependency check.** The brief's check with `--movable` against the candidate order prints `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`: no UPWARD, CYCLE or moved line.
  - Suppliers not on main: AbelianSchemesAndArithmeticModuli (41), AdelicAlgebraicGroups (52), GL2AutomorphicRepresentationsAndTransfer (100), HilbertModularVarietiesAndShimuraCurves (161), ArithmeticFuchsianGroups (286).
  - Suppliers on main: ReductiveGroupsPartII, ClassicalArithmeticCompletion, ThetaSeries, QuadraticFormInvariants, GlobalQuadraticForms, ClassFieldTheory, FuchsianOrbifolds, and Completed/GlobalNumberFields and Completed/NumberFieldArithmetic.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Elaboration.** `lake env lean TauCetiRoadmap/QuaternionArithmetic/Suggested.lean` exits 0 in 26 s with exactly 30 `declaration uses sorry` warnings, one per theorem, and no other message.

**Signatures.** I put `#check @name` for all 82 top-level declarations in one scratch file and elaborated it once (exit 0). I compared each type with its README statement and changed nothing.
- The new number-field theorems carry `[NumberField F]`, which supplies `CharZero F`. They also carry the definite, indefinite, Eichler, nonzero and coprimality hypotheses of 1.7, 4.1 and 7.3.
- `existsUnique_gorenstein_saturation` and `IsEichler.isBass` carry `CharZero F`, `IsDedekindDomain R` and `IsFractionRing R F`.
- The 27 "dropped binder" leads are definitions whose bodies need none of those classes.

**Padding probe.** I replaced every `sorry` by `first | rfl | decide | infer_instance | simp | norm_num | trivial`. All 30 theorems fail, at 30 distinct lines (297 … 871). There is no padding.

**Seeded sample.** These are Voight v0.9.28 locators; printed pages come from the running heads.

| Target | Locators opened | Result |
| --- | --- | --- |
| 0.6 | Prop 14.6.7 (`voight line 9981`, p. 224); Prop 13.4.4 (line 8975, p. 202); Cor 14.6.5 (9960) | statement matches; *Needs* gap R01 |
| 1.3 | Def 15.2.2 (10464); Cor 15.2.9 (10503); Ex 15.2.10 (10511, p. 236); Ex 15.2.11 (10525); Lemma 15.2.14 (10545); Lemma 15.2.15 (10560, p. 237) | matches (15.2.14 needs `I` projective, automatic over a Dedekind domain) |
| 1.6 | Lemma 15.5.3 (10691); Cor 10.5.5 (7137, PID); §13.2–13.3 (8707–8899, pp. 197–201, complete DVR with arbitrary residue field until 13.3.11); Thm 13.3.11 (8880); Ex 15.5.4 (10698); Cor 23.3.14 (15886) | matches, including the residue-field generality |
| 1.11 | Lemma 23.5.2 (16259, p. 376); Def 23.5.5 (16284, p. 377); Lemma 23.5.15 and 23.5.16 (16349–16362, p. 379) | matches |
| 2.2 | Def 24.2.1, 24.2.2, Prop 24.2.3, Lemma 24.2.5 (16513–16532, p. 383); Thm 24.2.10 (16579); 24.2.14 (16644) | matches except the wording in R02 |
| 2.3 | Prop 24.2.15 (16649, p. 385); Lemma 24.2.22 (16705, p. 387); Prop 24.1.4 (16489) | matches |
| 2.4 | 24.3.1–Def 24.3.2 (16744–16760, p. 388); 24.3.5, Lemma 24.3.6 (16808–16819, p. 389); Lemma 24.3.12 (16895, pp. 390–391); Def 24.3.13 (16912, p. 391); (25.3.20) (17764–17775, p. 411) | matches, including all four unit counts and the three λ values |
| 3.4 | Lemma 27.6.8, (27.6.9), Remark 27.6.10 (19702–19714, p. 457) | matches |
| 5.2 | Thm 25.1.1 (17355); Prop 25.3.11 proof sketch citing Thm 26.2.12 (17699–17703); Thm 25.3.18 (17730, p. 411); Main Thm 25.3.19 (17756) | matches |
| 6.4 | Thm 30.4.7 (23199, p. 536); 30.7.1, (30.7.2) (23735–23744); Thm 30.7.3 (23747); Ex 30.7.5 (23763, p. 548, squarefree level, `S` maximal); Cor 30.4.18 (23264) | matches |
| 6.6 | Thm 30.1.5 (22961); Lemma 30.8.2, Prop 30.8.5, Main Thm 30.8.6 (23866–23920, pp. 549–550) | matches |
| 7.3 | 41.2 setting (32033–32035, any `R`-order, `S`-definite `B`); Prop 41.3.1 (32152, p. 754); Prop 41.3.6 (32196, p. 755); Def 41.3.14, Cor 41.3.15 (32260–32262, p. 756); 41.4.1–Prop 41.4.3 (32308–32325, pp. 757–758); Cor 41.4.10 (32365, p. 759) | matches; the Lean statements need no Eichler hypothesis, as Voight's chapter does not; two source issues below |
| 8.3 | 39.4 setting (30834–30839, `F` totally real, `B` indefinite, `O` Eichler); 39.4.3, (39.4.4) (30869–30884, pp. 723–724) | matches; source issue below |
| 9.9 | values recomputed (table below) | matches |
| 10.2 | knowls `shimcurve` (`lmfdb_shimcurve lines 90–132`), `.level` (90–99), `.index` (90–93), `.enhanced_group` (90–100), `.is_coarse` (90), `.disco` (90–100; it defines both `disc` and `discrd`, so the `discO = discrd` reading is not contradicted), `.nrdmu` (90–94), `.polarized_order` (90–95), `.xd1`, `.xd1_star`, `.xdn`, `.xdn_star`, `.xdm1` (92 each) | every row matches its knowl; the area row is now a stated convention |

Also opened: Thm 15.5.5 (`voight line 10706`, p. 241), Thm 28.5.5 (20295, p. 473), Def 28.5.15, Ex 28.5.16, Cor 28.5.17 (20346–20357, p. 475) and Thm 17.8.3 (12417). These are the locators of the new headlines, and all match.

**Adversarial table.** I recomputed class numbers, genera, type numbers and the class numbers of imaginary quadratic orders with a script in my scratch directory; the rest are by hand.

| Statement | Instances | Values computed (both sides) | Result |
| --- | --- | --- | --- |
| 0.6 (sample) | `ℚ(i)`, `ℚ(√2)`, `ℚ(√−7)` in `ℍ[ℚ,-1,-1]` | Ram `{2,∞}`: `ℚ(i)` ramified at 2 and complex at ∞, so it embeds; `ℚ(√2)` real at ∞, so no embedding; `−7 ≡ 1 (8)`, so 2 splits and there is no embedding (`7` is not a sum of three rational squares) | holds; R01 |
| 1.3 (sample) | `L`, `2L`, `M₂(ℤ)` | `L`: Gram `diag(2,−2,−2,−2)`, det −16, giving `(16), (4), (4)`; `2L`: `2⁸·16 = 4096`, δ 64, cubic `8·4 = 32`; `M₂(ℤ)`: det −1 | holds |
| 1.6 (sample) | `ℍ_ℝ((t))`; division algebra over `ℚ₂` | `v` of a sum of 4 squares is even, so `e = 1`, det −16 is a unit and the quotient is trivial; over `ℚ₂`: `P² = 2O`, `e = 2`, quotient of order 2 | holds |
| 1.11 (sample) | `R²`, `R⊕ϖ²R`; `R⊕ϖR`, `ϖR⊕R` | distance 2, `O₀(𝔭²)`; `End ∩ End = [[R,𝔭],[𝔭,R]]`, and `diag(1,ϖ)·[[a,b],[c,d]]·diag(1,ϖ)⁻¹ = [[a,b/ϖ],[ϖc,d]] ∈ O₀(𝔭²)`, level `𝔭²` | holds |
| 2.2 (sample) | `M₂(ℤ)`, `L`, `ℤ+2O_6`; `gO₀(2)` | `(1)(1)`; `nrd((1/2)L)·(4) = (1/4)(4) = (1)`; `(2) ≠ (1)`; `O_R = O₀(2)`, `O_L = [[ℤ,2ℤ],[ℤ,ℤ]]` | holds; R02 |
| 2.3 (sample), `existsUnique_gorenstein_saturation` | `O_6`, `ℤ+2O_6` | `(⊤, O_6)`; `((2), O_6)`, with `discrd = 2³·6 = 48` | holds |
| 2.4 (sample) | `q = 2, 3`; `L` at 2 | counts `6, 4, 12, 8` and `48, 36, 72, 54`; λ `3/2, 1/2, 3/4` and `4/3, 2/3, 8/9`; `(3/12)(2/3) = 1/6 = φ(3)/12`; `2·(3/4)·2 = 3 = 24/8` | holds |
| 3.4 (sample), `finite_classSet` | Hurwitz; `D = 11, 37` | one double coset; `# Cls = 2, 3` | holds |
| 5.2 (sample), `eichler_mass_formula` | `D = 2, 3, 11, 37`; `(2,3)`, `(2,7)` | `1/12, 1/6, 5/6, 3`; `4/12 = 1/3` (one class, `w = 3`); `8/12 = 2/3` (two classes, `w = 3`) | holds |
| 6.4 (sample) | `D = 11`, `ℤ[i]`, `ℤ[ω]`; `D = 6`, `ℤ[i]` | per class by 30.8.5 (`w = 2, 3`): `m_i = (2, 0)`, sum `2 = 1 − (−4|11)`; `m_ω = (0, 2)`, sum `2 = 1 − (−3|11)`; `D = 6`: `(1 − 0)(1 + 1) = 2` | holds |
| 6.6 (sample), `classNumber_eq_mass_add` | `D = 2, 11, 37`; `(2,3)`; `D = 17, 19, 23` | `1/12 + 1/4 + 2/3 = 1`; `5/6 + 1/2 + 2/3 = 2`; `3 + 0 + 0 = 3`; `1/3 + 0 + 2/3 = 1`; `2, 2, 3` | holds |
| 7.3 (sample), `brandtMatrix_commute` | `D = 11`, `w = (2,3)`; `T(2), T(3), T(4)` | `T(2)T(3) = T(3)T(2) = [[8,6],[4,6]]`; `T(4) = [[5,3],[2,4]]` with column sums `7`; `T(2)T(4) = T(4)T(2) = [[11,15],[10,6]]` | holds |
| `isSemisimpleRing_adjoin_brandtMatrix` | `D = 11`; `[[1,1],[0,1]]` | eigenvector `(3,2)`: `3, 4, 7`; eigenvector `(1,−1)`: `−2, −1, 2`; char polys `λ²−λ−6`, `λ²−3λ−4`, `λ²−9λ+14`, so the algebra is `ℚ × ℚ`; `W·T(2) = [[2,6],[6,0]]` is symmetric; the unipotent gives `ℚ[x]/(x−1)²`, which no adjoint identity allows | holds |
| 8.3 (sample), `ellipticCount_gammaOne_two/three`, `embeddingNumber_*` | `(6,1)`, `(10,1)`, `(6,5)`, `(15,4)`; `D = N = 1` | `(2,2)`, `(0,4)`, `(4,0)`, `(0,0)`; `PSL₂(ℤ)`: `(1,1)` against empty products `1, 1` | holds |
| 9.9 (sample) | `X(6;1)`, `X^*(6;1)`, `X(6,5;1)`, `X(6,11;1)`, `X(10;1)`, `X(14;1)`, `X(26;1)`, `X(35;1)` | `1 + 4·(1/4)(2/12) − (1/2)(1 + 4/3) = 0`; area `2π(−2 + 1/2 + 3/4 + 5/6) = π/6 = (2π/3)/4`, genus 0; genera `1, 3, 0, 1, 2, 3` (`φψ = 24`, `ν = (0,0)` at level 11) | holds |
| 10.2 (sample) area row | `X(6;1)`, `X^*(6;1)` | `1·(1/1)·(1/6) = 1/6`; `1·(1/4)·(1/6) = 1/24`, equal to `(π/6)/(4π)` | holds |
| `discIdeal` | `ℍ[ℚ,-1,-1]`, `ℍ[ℚ,1,7]`; Hamilton over `ℚ(√5)` | `(2)`; `⊤` (empty product); 2 inert, so `[F_2:ℚ₂] = 2` splits it and the result is `⊤` | holds |
| `isMax_iff_discrd_eq_discIdeal`, `isMax_iff_discrdNat_eq` | `L`, `H`, `O_6`, `ℤ+2O_6`, `M₂(ℤ)`; icosian ring | `4 ≠ 2`; `2 = 2`; `6 = 6`; `48 ≠ 6`; `1 = 1`; `discrd = (1) = ⊤` | holds |
| `classNumber_eq_card_rayClassGroup` | `ℚ`, `(3,−1)`; `M₂(ℤ[√−5])`; `ℚ(√3)` ramified at one real place and one prime; definite `D = 11` | `(3,−1)_ℝ = 1`, so `Ω = ∅`, `Cl ℤ = 1 = # Cls O_6`; no real places, so the right side is `# Cl = 2`, and the left side is 2 independently (right `M₂(R)`-ideal classes are the Steinitz classes of rank-2 lattices); `Ω = {w}`, and the unit −1 gives `Cl_Ω = 1`; `2 ≠ 1`, excluded by `hind` | holds |
| `brandtMatrix_mul`, `sum_brandtMatrix_col` | `D = 11`; Hurwitz `n = 2`; `(I₁, I₁, I₂)` | `T(6) = [[8,6],[4,6]]` with column sums `12 = σ(6)`; `T(5)` column sums 6; `T(2) = (1) ≠ 3` (excluded by `hcop`); sums `4, 4, 6` (excluded by `hreps`) | holds |
| `exists_modularForm_qExpansion_brandtMatrix` | Hurwitz | constant `1/24`; `24/24 = 1 = T(1)`; `96/24 = 4 = T(3)` | holds |
| `relindex_normOne_eq_psi` | `Γ₀(2)`, `Γ₀(4)`; definite `(2,7)` | `3 = ψ(2)`, `6 = ψ(4)`; `24/6 = 4 ≠ 8`, excluded by `hind` | holds |
| `card_atkinLehnerGroup` | `O_6`, `M₂(ℤ)`, `O₀(4)` | `4 = 2²`, `1 = 2⁰`, `2 = 2¹` | holds |
| `classNumber_eq_one_of_not_isDefinite`, `exists_conj_of_level_eq`, `exists_unit_nrd_eq_neg_one` | `O_6`; `M₂(ℤ)` | `# Cls = # Typ = 1`; `nrd(1+i+j) = 1 − 3 + 1 = −1`; `diag(−1,1)` | holds |
| `classNumber_eq_one_iff` | `D = 2,3,5,7,13` against `11,17,19,23,37` | `1,1,1,1,1` against `2,2,2,3,3` | holds |
| `eichler_mass_formula_totallyReal` | `ℚ`; `ℚ(√5)`; `(2,3)` | `2(π²/6)/(2π)² = 1/12`; `2·(2π⁴/(75√5))·5^{3/2}/(16π⁴) = 1/60`; `6·(1/2)(4/3) = 4` | holds |
| `typeNumber_prime` | `p = 5, 11, 37` | `1/2 + 2/4 = 1`; `1 + 1/4 + 3/4 = 2`; `3/2 + 2/4 = 2` (`h(−20) = 2`, `h(−44) = 3`, `h(−148) = 2`) | holds |
| `covolume_gammaOne`, `eulerChar_compactifiedQuotient_gammaOne` | `(6,1)`, `(6,5)`, `(15,4)`; `(1,1)` | `2π/3`, `4π`; `χ = −1/3 + 1 + 4/3 = 2`, `0`, `−8`; `π/3`, formula `1 ≠ 2`, excluded by `hD` | holds |
| `exists_principal_polarization`, `card_autPmMu(_general)` | `O_6`, `μ = i+3j`; `M₂(ℤ)`; `D = 21`, degree 21 | `μ² = 3 − 9 = −6`, traces `0, 6, −6, 0`; `[[0,−1],[1,0]]² = −I`; `{1, μ, k, μk}` of order 4; `{1,[i′]}` twisted, order 4 | holds |
| genus table, `N = 1` | `D = 10, …, 39` | `(ν₂, ν₃, g)` as tabled in all 12 rows, e.g. `D = 22`: `(2,4,0)`, `D = 38`: `(2,0,2)` | holds |
| `D = 6` Eichler genera, 9.6 `(6,101)` | levels 5, 7, 11, 13, 25, 101; the seven `w_m` | `1, 1, 3, 1, 5, 17`; fixed counts `4, 0, 4, 0, 12, 0, 12` (`h(−808) = 6`, `h(−2424) = 12`), sum `32 = 8·0 + 32`, `g* = 1` | holds |
| 7.4 trace formula | Hurwitz, `n = 3, 9` | `1/3 + 2 + 1 + 2/3 = 4`; for `t = 0, ±1, …, ±5`: `5/4 + 4 + 1 + 8/3 + 2 + 2 + 1/12 = 13`; shorthand gives `13 − 3 = 10` | holds |
| worked examples `c`, twisting | `D = 6, …, 39` | `h(−84) = 4`, `h(−104) = h(−152) = h(−140) = 6`, `h(−35) = h(−60) = h(−15) = 2`, `h(−156) = h(−39) = 4`; `c = 1,1,1,2,2,2,2,3,3,4,2,4` | holds |

**Library declarations opened at the pins** (Mathlib `f6090c7`, Tau Ceti `358314d`):
- **Mathlib.**
  - `Submonoid.mem_units_iff` (`Algebra/Group/Submonoid/Units.lean:100`).
  - The hyperbolic `MeasureSpace ℍ` (`Analysis/Complex/UpperHalfPlane/Measure.lean:40`, a `withDensity`).
- **Tau Ceti.**
  - Ray class carriers: `Modulus` (`NumberTheory/NumberField/Global/RayClass/Modulus.lean:96`, fields finite part, nonzero, `Finset` of real places) and `IsCongrOne` (`:314`; for finite part `⊤`, `v.asIdeal ∣ ⊤` never holds). `RayClassGroup` (`RayClass/Basic.lean:180`) and `idealsPrimeToEquiv` for empty support (`:336`).
  - Hilbert symbol: `hilbertSymbol` (`NumberTheory/HilbertSymbol/Basic.lean:46`, valued in `ℤˣ`, so `≠ 1 ↔ = −1`) and `hasFiniteMulSupport_hilbertSymbol_unitAtFinitePlace` (`QuadraticForm/Global/HilbertSymbol.lean:120`).
  - `unitAtRealPlace` (`QuadraticForm/Global/Localization.lean:65`).
  - Brauer restriction: `invMap_brRes` (`ClassFieldTheory/Brauer/Invariant.lean:280`), `brRes` and `brCor` (`Restriction.lean:70, 156`).
  - `maximalNumberFieldOrder` (`Orders/Basic.lean:228`) and `Algebra/CentralSimple/SkolemNoether.lean`.
  - `HilbertSymbol/Archimedean.lean` (theorems only; R03).
- **Tau Ceti at `2fd255d`.**
  - The `IntegralOrder` carriers above.
  - The 14 imported modules, diffed against `358314d`: `Modulus`, `IsCongrOne` and `RayClassGroup` (`Basic.lean:130`) keep their definitions; the Hilbert-symbol and localization changes are additions.

**Cross-roadmap citations resolved this round.**
- **AdelicAlgebraicGroups (#792).** `Reduction.finite_classes`, *quaternion-norm-one-strong-approximation*, *quaternion-norm-images*, *quaternion-class-sets*, *definite-quaternion-stabilizers*, and "Nested-level map on double cosets" and "Finite-index bound for level changes".
- **HilbertModularVarietiesAndShimuraCurves (#1005).** The headings §R18.5.16a, b and c, and R18.5.17a and R18.3.1.
- **GL2AutomorphicRepresentationsAndTransfer (#931).** R17.1.5, read in full: the predicate, the realization theorem `existsQuaternionRamification_iff` and the uniqueness theorem `nonempty_quaternionAlgEquiv_of_localSplitting`. Also R17.3.8d.
- **AbelianSchemesAndArithmeticModuli (#849).** A6.20.
- **ArithmeticFuchsianGroups (#2026).** `Suggested.lean` 67, 84, 92, 101 and 110.
- **On main.** Global number fields Layers 2 (README 279) and 4 (418), as now cited for 4.1 and 3.4, and the supplier directories listed under the gate.

The brief gives no checkouts for #792, #1005, #931 and #849, so I read them at their heads through `roadmaps grep`/`roadmaps show`. The resolver's 14 leads are knowl identifiers, `IsEichler.isBass` (declared here) and AdelicAlgebraicGroups' `Reduction.finite_classes`. None is a defect.

**Ownership.**
- **Search.** `roadmaps grep` for `Brandt matri`, `brandtMatrix`, `discIdeal`, `Eichler's theorem`, `Cl_Ω`, `maximal iff … disc` and `locally norm-maximal` finds no second owner. The lattice-theoretic "Eichler's theorem" hits are a different theorem (IntegralLattices, OrthogonalTamagawaAndLatticeMass).
- **HilbertModularForms.** HilbertModularForms README line 189 (#1724) attributes class sets and Brandt matrices to QuaternionicModularForms §§0.1–0.3, 3.1.
  - QuaternionicModularForms (#934, which this roadmap may not cite) owns adelic Hecke operators on forms and the fibres of class-set refinement. It does not define ideal-class Brandt matrices, so it is not a second owner of Layer 7.
  - That attribution is for HilbertModularForms' own review.
- **Names and overlaps.** No `Suggested.lean` name equals a fully qualified name in a readable roadmap. The overlap report for this roadmap lists no dropped or conflicting ids and no other pull request changing it.

## Not verifiable

- **Elaboration at main's pins** (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, 12 446 Tau Ceti commits after `358314d`). It needs a different manifest, which this review may not change. I compared the imported modules' sources instead (above).
- **LMFDB knowls `shimcurve.label` and `shimcurve.eichler`.** The cached texts are browser-check pages (`lmfdb_shimcurve_label lines 5–9`, `lmfdb_shimcurve_eichler lines 5–9`).
- **The stored values of the `discO` column.** The knowl defines both `disc(O)` and `discrd(O)`, so the stored values are not checked.
- **`pizer1976`.** It is an image-only scan with no OCR here, and it is listed in `needs-references.toml`. 6.6 was verified against [V, 30.1.5] instead.
- **`eichler1955`.** It is cached as the EuDML landing page.
- **`ogg1983`, `vigneras1980`, `pizer1980`, `shimizu1965`, `alsina_bayer2004`.** These are settled as uncertified, and none is needed by the sample.

## Source issues

- **Misprint** in voight at Cor 41.4.10, p. 759: the source says the Hecke ring `T(O) ⊆ M_h(ℤ)` is a semisimple ring; it should say `T(O) ⊗ ℚ` is semisimple (`2ⁿT(O)` is a strictly decreasing chain of ideals); affects a stated result.
- **Misprint** in voight at 39.4.3, p. 724: the source's two-to-one map lands in elliptic cycles of order `2q`; it should be order `q`, the count `m_q` of (39.4.4), since `Γ¹(O) ≤ PSL₂(ℝ)`; affects nothing.
- **Error** in voight at 41.4.1–(41.4.6), pp. 757–758: the source weights the pairing on functions by `w_I`, with Brandt matrices acting on the right on row vectors; it should weight by `1/w_I`, since otherwise the adjoint of `T(2)` for `D = 11` is `[[1,4/3],[9/2,0]] ≠ T(2)`; affects a stated result.
- **Error** in voight at 15.4.5 and Lemma 15.4.7, p. 239: the source says `discrd(I) = [J:I]·discrd(J)` and `disc(I) = discrd(I)²` for projective lattices; it should restrict to orders, since `2L` has `disc = 4096` and `discrd = 32`; affects a stated result.
- **Gap** in lmfdb_shimcurve_nrdmu at its definition, lines 91–92: the source takes the squarefree part of the integer `nrd(μ)/discrd(O)`; it should take the square class, since `μ = √−3 ∈ O_6` gives `1/2`; affects nothing.
- **Misprint** in lmfdb_shimcurve_xdn at its definition, line 92: the source takes the inverse image of `(O/NO)^×`, which has level 1; it should take the trivial subgroup at level `N`; affects nothing.
- **Misprint** in lmfdb_shimcurve_xdn_star at its definition, line 92: the source takes the inverse image of all of `Aut_{±μ}(O) ⋉ (O/NO)^×`; it should take `Aut_{±μ}(O) ⋉ {1}` at level `N`; affects nothing.
- **Misprint** in lmfdb_shimcurve_xd1 at its definition, line 92: the source takes `H = {1}` in `Aut_{±μ}(O) ⋉ Ô^×`, which is not open; it should take the trivial subgroup at level 1; affects nothing.
- **Misprint** in lmfdb_shimcurve_xd1_star at its definition, line 92: the source takes `H = Aut_{±μ}(O)` inside `Aut_{±μ}(O) ⋉ Ô^×`, which is not open; it should take the whole level-1 group; affects nothing.
- **Misprint** in lmfdb_shimcurve_xdm1 at its definition, line 92: the source takes `H = {1}` in `Aut_{±μ}(O) ⋉ Ô^×`, which is not open; it should take the trivial subgroup at level 1 for the Eichler order; affects nothing.
