# Review of ThetaSeries (pull request #2725 at cf64845)

**Verdict:** needs changes

**Summary.** Needs changes, for one finding. In §6.6, and in the docstring of `conductor_kroneckerChar_dvd_level`, the text says the level of an even lattice of rank `2k` need not divide `D_L`. In fact `N ∣ det L = |D_L|` always holds in even rank; the stated theorems themselves are unaffected. All the other statements, Checks and worked examples I recomputed came out right. There are five small corrections, chiefly that the README does not map the earlier lettered items and Lean names, which other roadmaps cite, to their new places, and one format note; none of these blocks. For the humans: none of the cited sources could be read legally, so wording and arrangement were not checked against any of them.

## R01 (P2) — In even rank the level always divides `D_L`, so §6.6's remark that it need not is false

This remark is the reason §6.6 gives for its route. The same claim stands, with a source attached, in the docstring of `conductor_kroneckerChar_dvd_level`. So a reader is told something false about the standing setting of Layers 6–7. The README, §6.6 at line 510, says: "the level need not divide `D_L` (only `N ∣ 2 det L` holds in general)". `Suggested.lean` lines 98–99 say: "the level need not divide `D_L` (Ebeling, Chapter 3)".

Here is why it is false. Let `L` be even of rank `2k`, and write `det L = 2^e m` with `m` odd.

- **Odd primes.** For odd `p`, `q_L = b_L(x, x)/2` with `2` a unit. So `v_p(N)` is the exponent of the `p`-part of `L^∨/L`, which is at most `v_p(det L)`.
- **The prime 2.** We have `N ∣ 2 det L`, and `v₂(N) = e + 1` requires some `x ∈ L^∨` with `det L · ‖x‖²` odd.
  - Then `x` has order `2^e` in the 2-part of `L^∨/L`, so that 2-part is cyclic.
  - Hence `L ⊗ ℤ₂ = U ⊥ ⟨u 2^e⟩` with `U` unimodular.
  - `U` is even because `L` is, so `U` has even rank, and then `L` has odd rank.

So in even rank `N ∣ det L = |D_L|`.

I also checked this by computation. In 7,384 random even positive definite Gram matrices of ranks 2, 4 and 6, the level divided the determinant every time; for example `√2 ℤ²` gives `4 ∣ 4`, `D₄` gives `2 ∣ 4`, and `diag(2, 8)` gives `16 ∣ 16`. In rank 3 the divisibility fails in most samples (`A₃`: det `4`, level `8`). Odd rank is the only setting where the parenthesis is true.

The smallest repair is to state the true direction in §6.6: "`|D_L|` need not divide `N` (for `√2 ℤ⁴`, `D_L = 16` and `N = 4`), so the Kronecker character modulo `|D_L|` is not a character modulo `N` until its conductor is known to divide `N`". The docstring clause should be replaced the same way or dropped.

## C01 — The README does not say where the old lettered items and the renamed Lean names went, and other roadmaps cite both

Roadmaps that cite this one cannot follow those citations once this pull request merges:

- SieveMethodsAndPrimePatterns (main, line 111) and QuadraticCharactersAndReduction (main, line 14) cite "ThetaSeries §2H".
- GeometryOfNumbersAndQuadraticArithmetic (main, line 256) cites §2C.
- LatticePackingsAndPerfectForms (main, line 1790) cites "Layer 7 (7C–7D)".
- HalfIntegralWeightModularForms (its open pull request #1721, README lines 1745–1752 and 1936–1938) cites these Lean names from main's `Suggested.lean`: `milgram`, `gaussSum_reciprocity`, `discChar`, `thetaFormOfLevel`, `thetaFormOfLevel_mem_modFormCharSpace`, `thetaSeries_orthSum` and `hasSum_thetaSeries`.

The new README has gaps here:

- Its table of former sections uses the new numbers ("2.3", "2.8").
- It gives former Lean names only for material now in Tau Ceti.
- The rule "old `kX` is §k.n" appears only in the pull-request description.
- Line 41 says that other roadmaps "cite them by these numbers", but they cite the letters.

The repair is one sentence near line 41, plus the old names in italics beside what replaces them. The sentence: "Item kX of the earlier lettered numbering is §k.n, with n the position of the letter (2C is §2.3, 2H is §2.8, 7C and 7D are §§7.3 and 7.4)". The old names and what replaces them:

- `milgram` → §6.3
- `gaussSum_reciprocity` → §6.2
- `discChar` → `nebentypus`
- `thetaFormOfLevel` and `thetaFormOfLevel_mem_modFormCharSpace` → §7.4
- `thetaSeries_orthSum` → §3.4
- `hasSum_thetaSeries` → row 3.3

## C02 — §1.2 is still described as the input to a proof of Poisson summation that the pin carries out another way

Lines 216–219 and the first Example of Layer 1 (line 239) present the partial Fourier transforms as what a coordinate-by-coordinate reduction of Poisson summation on `ℤⁿ` needs. The pin proves Poisson summation over `ℤⁿ` all at once, by a multivariate Fourier series on the torus, without partial transforms. This is Tau Ceti's `SchwartzMap.tsum_eq_tsum_fourier_span_orthonormalBasis`; see the module docstring of `TauCeti/Analysis/Fourier/PoissonSummation.lean`, lines 35–48. Nothing else in this roadmap uses §1.2.

So a reader takes §1.2 to be a prerequisite that it is not. It would help to say that §1.2 is general Fourier-analytic infrastructure kept for its own sake, or to name the consumer it is meant for.

## C03 — The coprimality hypothesis of §6.2 is not needed

Reciprocity holds for all positive `a` and `c`:

- Replacing `(a, c)` by `(ma, mc)` multiplies both sides by `m^{2k}`. On the left, each class of `L/cL` has `m^{2k}` lifts to `L/mcL`, and the summand depends only on `y mod cL`. The same holds on the dual side.
- The theta-asymptotic route of §6.2 never uses `gcd(a, c) = 1`.
- A computed instance: for `√2 ℤ²` with `a = c = 2`, `G(2, 2) = 4` and the right side is `(1/2) · i · (2 − 2i)² = 4`.

Since the roadmap is a general library, the hypothesis `hac` of `gaussSum_eq_mul_dualGaussSum` and the word "coprime" in §6.2 could be dropped. §6.5 keeps its own coprimality hypothesis, which there is necessary.

## C04 — Three of the four bullets of §5.3 restate Tau Ceti facts through the coercion

The first bullet (the coefficients are `r_L(2m)`) is `ZLattice.coe_thetaForm` followed by `ZLattice.IsEven.qExpansion_thetaSeries_coeff`. The second (the form is nonzero) follows from `ZLattice.IsEven.qExpansion_thetaSeries_coeff_zero`. The fourth (isometry invariance) follows from `ZLattice.thetaSeries_comap` and extensionality. So, as targets, they ask an implementer for almost nothing. Only the product bullet, which rests on §3.4, carries content.

They could be marked as Tau Ceti's statements read through `ZLattice.coe_thetaForm`, or kept as Checks.

## C05 — Two sentences of the pull-request description do not match the head

- "The imports are `Mathlib` plus nine individual Tau Ceti modules": `Suggested.lean` imports eight.
- The README's sections are described as "each with its source at the claim". §§1.2, 7.1 and 7.6 cite no source, and §2.9 cites only another roadmap.

Correct the first to "eight", and limit the second to the sections that cite a source.

## N01 — Locators are coarse or missing

§§1.2, 7.1 and 7.6 state targets without any source, and §2.9 cites only a roadmap. Every other locator is a whole chapter (Ebeling Ch. 3, Schoeneberg Ch. IX, Ogg Ch. VI, Iwaniec Ch. 10, Milnor–Husemoller App. 4) with no theorem or page number. A reader therefore cannot check a hypothesis against its source.

## Questions for the author

- Turaev (1998) is cited for §6.2 as the case "`L/cL` against `L^∨/aL`" of a reciprocity law on finite abelian groups. Which theorem of that paper is meant, and does its hypothesis cover the lattice statement as written? No legal copy of the paper could be found, so I could not check.

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| §1.2 partial transforms, Fubini | Gaussian on `ℝ²`; kernel `e(−xξ)` vs `exp(−ixξ)` | `exp(−π(ξ₁²+ξ₂²)) = 𝓕f`; wrong kernel gives `exp(−(ξ₁²+ξ₂²)/4π)` | true; Check discriminates | C02 |
| §2.9 `A_{L⊕M} ≅ A_L × A_M` | `√2ℤ⊕√2ℤ`, `D₄⊕D₄`, no integrality | `(1+i)² = 2i = √4·i`; `1+9−6 = 4 = √16·i⁴`; `(L⊕M)∩(L^∨⊕M^∨)` splits | true | none |
| §3.4 `Θ_{L⊕M} = Θ_LΘ_M` | `ℤ⊕ℤ` with `L²` vs sup norm; `E₈⊕E₈` | norm-1 count `4` vs `8`; `q`-coefficient `2·240 = 480 = 480σ₇(1)` | true | none |
| §5.3 thetaForm API | coefficients, nonvanishing, isometry, product | coefficients by `coe_thetaForm` + `qExpansion_thetaSeries_coeff`; constant `1`; `E₄·E₄` coefficient `480` | true; three bullets thin | C04 |
| §6.2 `gaussSum_eq_mul_dualGaussSum` | `√2ℤ²` at `(3,1)`, `(1,2)`, `(2,2)`; `A₂` at `(1,1)`; rank 0 | `1 = (1/3)(1/2)i(−6i)`; `0 = 0`; `4 = (1/2)i(−8i)`; `1 = (1/√3)i(−i√3)`; `1 = 1` | true; coprimality unused | C03 |
| §6.3 `sum_cexp_norm_sq_discriminantGroup` | `A₂`, `D₄`, `√2ℤ²`, `E₈`, `A₂⊕A₂` | `i√3 = √3·i`; `−2 = 2i²`; `2i = 2i`; `1 = i⁴`; `−3 = 3i²` | true | none |
| §6.5 `gaussSum_eq_sqrt_card_mul_jacobiSym` | `√2ℤ²` at `(1,4)`, `(3,4)`; off-hypothesis `(1,2)`, `(3,12)`; `A₂` at `(5,3)` | `8i = 8i`; `−8i = −8i`; `0 ≠ 4i`; `72i ≠ −24i`; `−3√3i = 3√3i·(−3/5)` | true; each hypothesis needed | none |
| §6.6 `conductor_kroneckerChar_dvd_level` | `A₂`, `D₄`, `√2ℤ²`, `E₈`; route `a ≡ 1 (mod N)` | conductors `3∣3`, `1∣2`, `4∣4`, `1∣1`; `G(a,N) = G(1,N) ≠ 0` forces `(D/a) = 1` | true | none |
| §6.6 remark "`N` need not divide `D_L`" | 7,384 even-rank Gram matrices; `√2ℤ⁴`; `A₃` | even rank: `N ∣ det` always; `√2ℤ⁴`: `N = 4`, `D = 16`; `A₃` (odd rank): `8 ∤ 4` | false in even rank | R01 |
| `nebentypus` | `a` prime to `N`; `N = 1, 2` | primitive character agrees with `(D/a)` off `D`; `N ∣ 2` forces `k` even, so `χ(−1) = 1` consistent | true | none |
| §7.1 reductions | `!![-2,-3;3,4] ∈ Γ(3)`; `c = 0`, `ε = −1` | `T³A = !![7,9;3,4] ∈ Γ(3)`; `TA ∉ Γ(3)`; `!![-1,b;0,-1] = (−I)T^{−b}` | true | none |
| §7.3 `thetaSeries_slash_of_mem_Gamma0` | `A₂`, `!![2,1;3,2]`; `−I` | `G(2,3) = −3√3i`; `(−i)(1/3)(1/√3)(−3√3i) = −1 = (−3/2)`; `χ(−1) = (−1)^k` | true | none |
| §7.4 `exists_modularForm_coe_eq_thetaSeries` | `Gamma0Map` convention; `A₂` parity | lower-right entry `d`; `χ` quadratic, so `χ` vs `χ⁻¹` immaterial; `(−3/−1) = −1 = (−1)¹` | true | none |
| §7.5 `thetaCoset_slash_of_mem_Gamma`, `exists_modularForm_coe_eq_thetaCoset` | `A₂`, `γ` of order 3, under `T`, `T³`; `−I` with `N ∣ 2` | `θ_γ(τ+1) = e(1/3)θ_γ`; `3·(2/3) ∈ 2ℤ`, so `T³` fixes `θ_γ`; `D₄`: `k = 2` even | true | none |
| §7.6 consequences | `γ ∉ L` | value at `i∞`: `θ_γ → 0`, `Θ_L → 1` | true | none |
| §8.6 `A₂` and `D₄` counts | `A₂`, `m = 1..4`; `D₄`, `m = 1..3`; `m = 0` | `6,0,6,6`; `24,24,96`; Sturm bounds `⌊8/12⌋ = ⌊6/12⌋ = 0`; at `m = 0`, `1 ≠ 0`, so `m ≠ 0` needed | true | none |

- Source locators checked against the text: none. None of the nine cited works has a legal copy the sources service could read.
- Tau Ceti declarations opened at the pin, in `TauCeti/`: `ZLattice.gaussSum` (`Algebra/Module/ZLattice/GaussSum.lean:176`), `ZLattice.dualGaussSum` (`:449`), `ZLattice.IsEven.dualGaussSum_eq_jacobiSym` (`:613`), `ZLattice.level` (`Algebra/Module/ZLattice/Level.lean:113`), `ZLattice.IsEven` (`Algebra/Module/ZLattice/Integral.lean:75`), `ZLattice.cosetGaussSum` (`Algebra/Module/ZLattice/CosetGaussSum.lean:52`), `modFormCharSpace` (`NumberTheory/ModularForms/DiamondOperators.lean:327`), `TauCeti.IntegralLattice.norm_sq_realModelMap` (`Algebra/Module/ZLattice/RealModel.lean:166`), `TauCeti.IntegralLattice.typeARootLattice` (`LinearAlgebra/IntegralLattice/RootLattice/TypeA/Basic.lean:117`), `TauCeti.IntegralLattice.checkerboardLattice` (`.../TypeD/Basic.lean:235`), Milgram's theorem (`LinearAlgebra/IntegralLattice/Milgram.lean:313`), `CongruenceSubgroup.Gamma0_prime_index` (`NumberTheory/ModularForms/CongruenceSubgroups/Basic.lean:669`).
- Of 352 backticked names extracted from the README, 338 elaborate with `#check` at the pins. The other 14 are this roadmap's 10 own theorems, three mathematical symbols, and one sphere-packing name. That name, `SchwartzMap.poissonSummation_lattice`, exists in that repository's `SpherePacking/CohnElkies/PoissonSummationGeneral.lean`.
- Cross-roadmap citations resolved on main: ModularForms §0.1 (line 353); IntegralLattices scope (lines 192–198 and 228–233, which agree on the Milgram split); Completed/IntegralLattices, LFunctions, LatticePackingsAndPerfectForms, QuaternionArithmetic, HypergeometricMotives and CFSGBasicProperties exist.
- Automatic checks: all passed. Dependency check output: `depcheck: 182 roadmaps, 2074 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the 10 `sorry` warnings; `nebentypus` has a real body. The one-tactic probe (`rfl`, `simp`, `infer_instance`, `decide`) closes none of the 10 theorems.
- `#check @name` for all 11 declarations: every binder each type needs is present, and each type matches its README statement.
- Other roadmaps' `Suggested.lean` files on main and at open heads: none declares a `TauCetiRoadmap.ThetaSeries` name or any of these theorem names.

Overlap check: read IntegralLattices (main and its open revision), LatticePackingsAndPerfectForms (main), HalfIntegralWeightModularForms, SiegelModularForms and Rank24LatticeConstructions (open), and OrthogonalTamagawaAndLatticeMass (main). What they share with this roadmap:

- Milgram's formula: Tau Ceti proves it at every signature (consumed by IntegralLattices 1I), and this roadmap keeps the real-model instance proved by theta asymptotics. Both READMEs record this split.
- The odd-rank theorem belongs to HalfIntegralWeightModularForms.
- Siegel theta series belong to SiegelModularForms.
- Nothing else is shared.

Source independence: 0 passages compared with 0 sources, because no cited source has a legal copy the service could read. The largest share is Ebeling, *Lattices and Codes*, with 6 of 18 locators (Ch. 2 once, Ch. 3 five times). Its table of contents could not be read (the publisher page redirects to a login). From the README alone, Ebeling is cited at two chapters against eight layers ordered by dependency, so the layers cannot map one-to-one onto its chapters.

Research link: Layers 6–7 are the Hecke–Schoeneberg theorem and its Gauss-sum arithmetic (Schoeneberg 1974, Ch. IX; Ebeling 2013, Ch. 3; Milnor–Husemoller 1973, App. 4; Turaev 1998). On main, LatticePackingsAndPerfectForms and QuaternionArithmetic consume Layer 7. This rests on the README's references and those roadmaps' READMEs.

## Not verifiable

- Ebeling, *Lattices and Codes* (2013): Springer, paywalled; the table-of-contents page redirects to a login.
- Milnor–Husemoller, *Symmetric Bilinear Forms* (1973): Springer, paywalled.
- Serre, *A Course in Arithmetic* (1973): Springer, paywalled.
- Schoeneberg, *Elliptic Modular Functions* (1974): Springer, paywalled.
- Miyake, *Modular Forms* (1989): Springer, paywalled.
- Conway–Sloane, *Sphere Packings, Lattices and Groups* (1999): Springer, paywalled.
- Iwaniec, *Topics in Classical Automorphic Forms* (1997): no legal copy found by the sources service.
- Ogg, *Modular Forms and Dirichlet Series* (1969): no legal copy found by the sources service.
- Turaev, "Reciprocity for Gauss sums on finite abelian groups" (1998): no legal copy found by the sources service.

## Source issues

- none

## For the human reviewers

- Not tested: Ebeling, the source with the largest share of locators (6 of 18). Neither its text nor its table of contents could be read, and no other cited source was readable either, so wording and arrangement were not checked against any source.
