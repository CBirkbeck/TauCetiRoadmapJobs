# Review of QuaternionArithmetic (pull request #1722 at e0f2268)

**Verdict:** accepted

This is an incremental re-review of the 71 lines changed since e95462a: the supplier contracts for §0.6, §0.6 itself, the Layer 0 dependencies, §2.2, and one import line of `Suggested.lean`. All three findings of the previous review are repaired, and the repairs introduce no new problem. There are no findings.

## Previous findings

- R01 — repaired: `README.md:608–634` gives "([V, 14.6.7], p. 224)", the three-step route, and a *Needs* line naming `invMap_brRes`, `brauerCohomologyEquiv_baseChange`, the `1/2`-invariant criterion over `K_w`, `baseChangeTwoParams`, `oneEquivMatrix` and R17.1.5 over `K`.
- R02 — repaired: `README.md:1066–1068` reads "a left ideal being sated when `O_L(I) = O` and a right ideal when `O_R(I) = O` (`[V, 16.2.11]`, p. 253; on the right this is 3.1's *proper*)", with the `gO₀(2)` Check at 1083–1085.
- R03 — repaired: `Suggested.lean` no longer imports `TauCeti.NumberTheory.HilbertSymbol.Archimedean`; the ten remaining `TauCeti.*` imports elaborate with the same 30 warnings.

## Verified sound

**Gate, dependencies, build.**
- **Worker's gate.** Every counter is 0 and the result is OK, including `build=0`.
- **My rerun.** It agrees except for `depcheck: NOT IN ORDER: QuaternionArithmetic (insert it after its last supplier)`, as in the previous round. The candidate order places this roadmap right after ArithmeticFuchsianGroups. Not a finding.
- **Dependency check.** The brief's check with `--movable` against the candidate order prints `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`: no UPWARD, CYCLE or moved line. The four new edges are the §0.6 citations of suppliers the roadmap already had.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Elaboration.** `lake env lean TauCetiRoadmap/QuaternionArithmetic/Suggested.lean` exits 0 with exactly 30 `declaration uses sorry` warnings, one per theorem, and no other message.
- **Signatures and padding.** No statement of `Suggested.lean` changed (the diff deletes one import line only), so the `#check` comparison of all declarations and the one-tactic probe of the previous report (30 of 30 theorems not closed) carry over.

**The §0.6 repair, step by step.**
- **Statement.** [V, 14.6.7] (iii)⇔(v) is at `voight line 9981`, printed p. 224, for a separable quadratic `K/F` of global fields. The README's reading "`K_v` is a field for every `v ∈ Ram B`" is condition (v) (`voight line 9989`).
- **Step 1.** [V, 5.4.7] is at `voight line 3517`, printed p. 73: a quadratic extension splits `B` iff it embeds. Chapter 5 assumes characteristic not 2, which holds over a number field.
- **Step 2.** Necessity is the source's (iv)⇒(v) (`voight lines 9997–9998`). `K ↪ B` gives `K_v ↪ B_v` by flatness of `F_v` over `F`, and `F_v × F_v` has zero divisors.
- **Step 3.** [V, 13.4.4] is at `voight line 8975`, printed p. 202: a separable extension `L` of a local field splits the division quaternion algebra iff `[L : F]` is even. The source's own proof of (v)⇒(ii) cites it (`voight lines 9999–10001`).
  - The README covers every place `w | v` of `K`: `v ∉ Ram B`; `v` real and ramified, hence under a complex place; `v` finite and ramified, where `2·(1/2) = 0`.
  - The dyadic places need no separate treatment. The `1/2`-invariant criterion at the pin assumes only `[Invertible (2 : K)]`, which holds in characteristic 0.
- **Global step.** GL2AutomorphicRepresentationsAndTransfer R17.1.5 at its head states `nonempty_quaternionAlgEquiv_of_localSplitting (a b c d : Kˣ)` on `QuaternionAlgebra K_v a 0 b` at every finite and infinite place. That is the README's "two symbol algebras `ℍ[K,a,b]`, `ℍ[K,c,d]`" (README 297–299). Taking `(c,d) = (1,1)` is legitimate, and `ℍ[K_w,1,1]` is split by `oneEquivMatrix`.

**Library declarations opened** (Tau Ceti `358314d`, the branch's pin, unless marked):
- `TauCeti.ClassFieldTheory.invMap_brRes` (`NumberTheory/ClassFieldTheory/Brauer/Invariant.lean:279`): `invMap L (brRes K L σ x) = Module.finrank K L • invMap K x` for nonarchimedean local fields with `[ValuativeExtension K L]` and `σ : L →ₐ[K] Kˢ`. The README's description (243–245) matches.
- `brRes` (`Brauer/Restriction.lean:70`) and `Br` (`Brauer/Basic.lean:151`, Mathlib's continuous cohomology of `unitsRep`).
- `TauCeti.BrauerGroup.invMap_brauerGroupEquivBr_quaternionClass_eq_half_iff` (`NumberTheory/LocalField/Quaternion/Invariant.lean:79`): invariant `1/2` iff `hilbertSymbol a b = -1`.
- `baseChangeTwoParams` (`Algebra/Quaternion/BaseChange.lean:142`) and `oneEquivMatrix` (`Algebra/Quaternion/Split.lean:121`).
- At Tau Ceti `2fd255d`: `TauCeti.brauerCohomologyEquiv_baseChange` (`Algebra/CrossedProduct/BaseChange/Naturality.lean:51`), for `[FiniteDimensional K L]` and `σ : L →ₐ[K] Kˢ`; its docstring says the extension need not be normal. The folder `Algebra/CrossedProduct/BaseChange/` is absent at `358314d`, as the README says (277, 631–632). `invMap_brRes` is at line 262 of the same file there.
- Remark, no change asked: `brauerCohomologyEquiv_baseChange` is stated with `galoisResUnits` on `continuousCohomology 2 (ofDiscreteModule …)`, and `invMap_brRes` with `brRes` on `Br`. Both are built from the same explicit `H²`, the same subgroup `Gal(Kˢ/σ(L))` and the same `unitsCoeffMap` (`FieldTheory/GaloisCohomology/UnitsRestriction.lean:62`, `Brauer/Restriction.lean:70`, `Brauer/CentralSimple/Basic.lean:55`), so joining them is a change of model, not a missing input.

**Cross-roadmap citations resolved this round.**
- GL2AutomorphicRepresentationsAndTransfer R17.1.5 (README 1508–1524 and `Suggested.lean` 173–190 at its head, read through `roadmaps show`).
- Completed/NumberFieldArithmetic Layer 5, "the global-local dictionary at finite places" (README 1290), cited for `K_w` as a local field.
- §3.1 of this roadmap (README 966): "proper means `O_R(I) = O`", which is what §2.2 now refers to.
- The resolver's 14 leads are unchanged from the previous round: knowl identifiers, `IsEichler.isBass` (declared here) and AdelicAlgebraicGroups' `Reduction.finite_classes`.

**Sources for §2.2.** Def 16.2.11 (`voight lines 11173–11175`, printed p. 253) defines sated on the left and says the right is similar; Remark 16.2.13 notes that sated is elsewhere called proper. Prop 24.2.3 (iv) (`voight line 16520`, printed p. 383) is the equivalence quoted.

**Seeded sample.** None of this round's sampled sections (0.7, 1.3, 1.6, 3.1, 3.4, 3.6, 4.2, 4.7, 6.5, 6.7, 8.6, 8.7, 9.6, 9.8, 10.3) is changed by the diff. §3.1 is cited by the new §2.2 wording and was checked for that. The README flags no locator as unverified.

**Overlaps and ownership.** The overlap report lists no other pull request changing this roadmap and no dropped or revision-only id. The change adds no object and no Lean name, so the ownership search of the previous report stands.

**Adversarial table.** The first six rows are computed this round. The rest are carried from the previous report (review at e95462a), whose statements the diff leaves untouched.

| Statement | Instances | Values computed (both sides) | Result |
| --- | --- | --- | --- |
| 0.6 criterion and Check 1 | `ℚ(i)` in `ℍ[ℚ,-1,-1]` | `Ram = {2,∞}`; `−1 ≡ 7 (mod 8)` is not a 2-adic square, so `ℚ₂(i)` is a field; `∞` is complex; `2·(1/2) = 0`; embedding `i ↦ i` | holds |
| 0.6 Check 2 (reject) | `ℚ(√2)` in `ℍ[ℚ,-1,-1]` | `∞` splits; `nrd(xi+yj+zk) = x²+y²+z² > 0 ≠ −2` | holds |
| 0.6 Check 3 (reject) | `ℚ(√−7)` in `ℍ[ℚ,-1,-1]` | `−7 ≡ 1 (mod 8)`, so 2 splits; `7 = 4⁰(8·0+7)` is not a sum of three rational squares | holds |
| 0.6 Check 4 | `ℚ(√−2)`, `ℚ(i)` in `ℍ[ℚ,-1,-3]` | `(−1,−3)₃ = (−1|3) = −1`, `(−1,−3)₂ = +1`, `(−1,−3)_∞ = −1`, so `D = 3`; `−2 ≡ 1 (mod 3)` splits, and `x²+3y²+3z² = 2` forces `3 | x, w` then `3 | y, z`; `3 ≡ 3 (mod 4)` is inert in `ℚ(i)`, and `i² = −1` embeds | holds |
| 0.6 Check 5 | `M₂(ℚ)`, `ℚ(√d)` | `Ram = ∅`; `[[0,d],[1,0]]² = d·I` | holds |
| 2.2 sated right ideals | `O = O₀(2)`, `g = diag(2,1)`, `I = gO` | `g·[[a,b],[2c,d]]·g⁻¹ = [[a,2b],[c,d]]`, so `O_L(I) = [[ℤ,2ℤ],[ℤ,ℤ]] ≠ O`, `O_R(I) = O`; `I` is principal, hence invertible | holds |
| 1.3, 1.6, 1.11, 2.3, 2.4 | as in the previous report | `(16),(4),(4)`; `e = 1` and `e = 2`; level `𝔭²`; `discrd = 48`; λ `3/2, 1/2, 3/4` | holds (previous report) |
| 3.4, `finite_classSet` | Hurwitz; `D = 11, 37` | one double coset; `# Cls = 2, 3` | holds (previous report) |
| 5.2, `eichler_mass_formula` | `D = 2, 3, 11, 37`; `(2,3)`, `(2,7)` | `1/12, 1/6, 5/6, 3`; `1/3`; `2/3` | holds (previous report) |
| 6.4, 6.6, `classNumber_eq_mass_add` | `D = 2, 11, 37` | `1/12 + 1/4 + 2/3 = 1`; `5/6 + 1/2 + 2/3 = 2`; `3` | holds (previous report) |
| `brandtMatrix_commute`, `isSemisimpleRing_adjoin_brandtMatrix` | `D = 11` | `T(2)T(3) = T(3)T(2) = [[8,6],[4,6]]`; algebra `ℚ × ℚ` | holds (previous report) |
| `brandtMatrix_mul`, `sum_brandtMatrix_col`, `exists_modularForm_qExpansion_brandtMatrix` | `D = 11`; Hurwitz | column sums `12 = σ(6)`; `24/24 = 1`, `96/24 = 4` | holds (previous report) |
| `discIdeal`, `isMax_iff_discrd_eq_discIdeal`, `isMax_iff_discrdNat_eq` | `L`, `H`, `O_6`, `ℤ+2O_6`, `M₂(ℤ)` | `4 ≠ 2`; `2 = 2`; `6 = 6`; `48 ≠ 6`; `1 = 1` | holds (previous report) |
| `classNumber_eq_card_rayClassGroup` | `(3,−1)` over `ℚ`; `M₂(ℤ[√−5])` | `1 = 1`; `2 = 2` | holds (previous report) |
| `classNumber_eq_one_iff`, `typeNumber_prime` | `D = 2,…,37`; `p = 5, 11, 37` | `1,1,1,1,1` against `2,2,2,3,3`; `1, 2, 2` | holds (previous report) |
| `eichler_mass_formula_totallyReal` | `ℚ`; `ℚ(√5)` | `1/12`; `1/60` | holds (previous report) |
| `relindex_normOne_eq_psi`, `card_atkinLehnerGroup` | `Γ₀(2)`, `Γ₀(4)`; `O_6`, `M₂(ℤ)`, `O₀(4)` | `3`, `6`; `4, 1, 2` | holds (previous report) |
| 8.3, `ellipticCount_gammaOne_two/three`, `covolume_gammaOne`, `eulerChar_compactifiedQuotient_gammaOne` | `(6,1)`, `(10,1)`, `(6,5)`, `(15,4)` | `(2,2)`, `(0,4)`, `(4,0)`, `(0,0)`; `2π/3`, `4π`; `χ = 2, 0, −8` | holds (previous report) |
| 9.9, 10.2 area row, genus tables | `X(6;1)`, `X^*(6;1)`; `D = 10,…,39` | genus 0, area `π/6`; `1/6`, `1/24`; `(ν₂, ν₃, g)` as tabled | holds (previous report) |
| `exists_principal_polarization`, `card_autPmMu(_general)`, `exists_unit_nrd_eq_neg_one`, `classNumber_eq_one_of_not_isDefinite`, `exists_conj_of_level_eq` | `O_6`, `M₂(ℤ)` | `μ² = −6`; order 4; `nrd(1+i+j) = −1`; `# Cls = # Typ = 1` | holds (previous report) |
| 7.4 trace formula | Hurwitz, `n = 3, 9` | `4`; `13` | holds (previous report) |

## Not verifiable

- **Elaboration at main's pins** (Tau Ceti `2fd255d`). It needs a different manifest, which this review may not change. The branch pins `358314d`; the one declaration §0.6 takes from `2fd255d` was read in the source at that commit instead, and the README says at both places where it is cited that it is absent at `358314d`.
- **`pizer1976`, `eichler1955`, LMFDB knowls `shimcurve.label` and `shimcurve.eichler`**, as in the previous report: an image-only scan, a landing page and two browser-check pages. None is cited by a changed passage.
- **`ogg1983`, `vigneras1980`, `pizer1980`, `shimizu1965`, `alsina_bayer2004`.** Settled as uncertified; none is cited by a changed passage.

## Source issues

- none
