# Review of ThetaSeries (pull request #2725 at c969dbd)

**Verdict:** needs changes

**Summary.** Needs changes, for one finding, which is about ownership and not about the mathematics: the partial Fourier transforms of §1.2, which this roadmap says it owns and which no later layer uses, are also stated by AnalyticNumberTheoryPartII §5.3g on main, and neither roadmap names the other. Every statement, Check and worked example I recomputed is correct, including reciprocity at non-coprime pairs, the closed form on seven lattices and both transformation laws numerically. There is one small correction (an ownership sentence that QuaternionArithmetic §7.7 contradicts) and two format notes; none of these blocks. For the humans: no cited source could be read legally, so wording and arrangement were not compared with any source.

## R01 (P2) — The partial Fourier transforms of §1.2 have a second owner on main, AnalyticNumberTheoryPartII §5.3g, and neither text names the other

An implementer would build the same statements twice, on two carriers, with nothing saying which is derived from which. *Scope and ownership* (line 904) says "This roadmap owns the partial Fourier transforms of §1.2", and §1.2 itself says (lines 233–234) that "no later layer of this roadmap rests on them". On main, `TauCetiRoadmap/AnalyticNumberTheoryPartII/README.md` owns §5.3g as a local target (line 7: harmonic analysis "which no earlier roadmap supplies"). Its line 684 takes `S(V)` at an archimedean place to be Mathlib's `SchwartzMap`, and its line 686 states, for a `B`-orthogonal decomposition `V = V₁ ⊕ V₂`, that the partial transform in `V₂` preserves `S(V)`, sends `f₁ ⊗ f₂` to `f₁ ⊗ f̂₂`, commutes with the partial transform in `V₁` and composes with it to `f ↦ f̂`. At the real place of `ℚ`, with `B` the inner product of `P × F`, these are the first two bullets of §1.2 and its second Check, up to `ξ ↦ -ξ` (the kernel there is `ψ(B(x, y)) = e(⟪x, y⟫)`, here `e(-⟪x, ξ⟫)`). §1.2 adds only the continuity of the partial transform and the `n`-fold composite on `ℝⁿ`. Neither README cites the other; a search of this README for "AnalyticNumberTheoryPartII" finds nothing.

The smallest repair is one sentence in *Scope and ownership* that leaves a single owner. Either §1.2 stays the owner of the real inner-product-space statement in Mathlib's normalisation, and the sentence says that §5.3g's archimedean partial transform is its transport along the real-linear isomorphism defined by `B` and `ψ_v`, with the reflection `ξ ↦ -ξ`; or §1.2 is dropped, row 1.2 of the table points to AnalyticNumberTheoryPartII §5.3g, and the continuity statement moves there when that roadmap is next revised. Which of the two is the author's choice.

## C01 — "No other roadmap states … a modularity theorem for one" is contradicted by QuaternionArithmetic §7.7

*Scope and ownership* (lines 910–911) says "No other roadmap states a theta series of a positive definite lattice or a modularity theorem for one." On main, `TauCetiRoadmap/QuaternionArithmetic/README.md` §7.7 (lines 2034–2040) states that the theta series of the even rank-4 lattice `I_j I_i⁻¹` is a modular form of weight `2` on `Γ₀(DM)`, as a consequence of Layer 7 here. This README's own *Downstream consumers* lists that roadmap.

"No other roadmap proves the modularity of the theta series of a positive definite lattice; those that state an instance (QuaternionArithmetic §7.7) cite Layer 7" would be true.

## N01 — Locators are coarse or missing

§§1.2, 2.9, 7.1 and 7.6 name no source. Apart from Turaev §1.3, Miyake §4.9, Serre Ch. VII §6 and Conway–Sloane Ch. 2 §2.3, every locator is a whole chapter or appendix (Ebeling Ch. 2 and Ch. 3, Schoeneberg Ch. IX, Ogg Ch. VI, Iwaniec Ch. 10, Milnor–Husemoller App. 4). A theorem or page number at each claim would let a reader check the hypotheses.

## N02 — §6.2 has no Check at a non-coprime pair

All four Checks of §6.2 use coprime `a` and `c`, although the statement is for all positive `a` and `c`. Two that would test the wider case: `√2 ℤ²` at `a = c = 2`, where both sides are `4`; and `A₂` at `a = c = 3`, where both sides are `9 = 3² · G(1, 1)`.

## Previous findings

- The previous review, of this same head, had no findings and no small corrections. Its two format notes (coarse locators; no non-coprime Check in §6.2) describe the text as it still stands and are N01 and N02 above.

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| §1.2 partial transforms and Fubini | Gaussian on `ℝ²`; kernel `exp(-ixξ)`; `φ ⊗ ψ` | `exp(-π(ξ₁²+ξ₂²)) = 𝓕f`; wrong kernel gives `exp(-(ξ₁²+ξ₂²)/(4π))`; `𝓕φ(η)𝓕ψ(ξ)` | true; second owner on main | R01 |
| §2.9 discriminant group of `L ⊕ M` | `√2ℤ ⊕ √2ℤ`; `A₂ ⊕ A₂`; `D₄ ⊕ D₄`; no integrality | `(1+i)² = 2i = √4·i`; `(i√3)² = -3 = √9·i²`; `1 + 9 - 6 = 4 = √16·i⁴`; `(L⊕M) ∩ (L^∨⊕M^∨)` splits | true | none |
| §3.4 `Θ_{L⊕M} = Θ_L Θ_M` | `ℤ ⊕ ℤ` with `L²` and sup norm; `E₈ ⊕ E₈` | norm-1 count `4` against `8`; `2·240 = 480 = 480σ₇(1)` | true | none |
| §5.3 product of bundled forms | `E₈ ⊕ E₈`; rank 0 | weight `4 + 4 = 8`; `q`-coefficient `480`; constant `1·1 = 1`; rank 0 gives the constant `1` of weight `0` | true | none |
| §6.2 `gaussSum_eq_mul_dualGaussSum` | `√2ℤ²`, `A₂`, `[[2,1],[1,4]]`, `diag(2,6)`, `[[2,1],[1,6]]`, `diag(2,8)` at `(1,1),(1,2),(3,1),(2,2),(3,2),(2,3),(3,3)`; `D₄` at four pairs | `√2ℤ²(3,1)`: `1 = (1/3)(1/2)i(-6i)`; `A₂(2,3)`: `-5.196i` both; `D₄(1,2)`: `-8 = -8`; all 46 agree | true | N02 |
| §6.2 route, constants | the two limits of `t^k Θ_L(a/c + it)` | `(-i)^k (-c/a)^k (a²/(ic²))^k i^k a^{-2k} = (c/a)^k c^{-2k} i^k`, against `G/(c^{2k} covol)` | consistent | none |
| §6.2 sign on the dual side | `√2ℤ²`, `a = 3`, `c = 1` | dual sum at `t = -1`: `-6i`; at `t = +1`: `6i`, giving `-1 ≠ 1` | sign needed | none |
| §6.3 `sum_cexp_norm_sq_discriminantGroup` | seven lattices, `det = 3, 4, 4, 7, 11, 12, 16` | `A₂`: `1.732i = √3·i`; `D₄`: `-2 = 2i²`; `diag(2,8)`: `4i = 4i`; `[[2,1],[1,6]]`: `3.317i` both | true | none |
| §6.5 `gaussSum_eq_sqrt_card_mul_jacobiSym` | six rank-2 lattices at `c = N, 2N`, `a = 1, 3, 5, 7`; `D₄` at `c = 2`; `A₂ ⊕ A₂` at `c = 3, 6` | `√2ℤ²(3,4)`: `-8i` both; `[[2,1],[1,4]](5,14)`: `-37.04i` both; `A₂⊕A₂(5,6)`: `-108` both; rank 0: `1 = 1` | true | none |
| §6.5 off its hypotheses | `√2ℤ²` at `(1,2)` and `(3,12)` | `0` against `4i`; `72i` against `-24i`; dual sum `36` against `-12` | each hypothesis needed | none |
| §6.6 `conductor_kroneckerChar_dvd_level` | all seven lattices; `D₄` | `N ∣ det` in all; conductors `3∣3`, `4∣4`, `1∣2`, `7∣7`, `3∣12`, `11∣11`, `4∣16`; `D₄`: `4 ∤ 2` | true | none |
| `nebentypus` and its API | `a` prime to `N`; `-1`; `N ∣ 2`; unimodular | primes of `det L` divide `N`; `sign D_L = (-1)^k`; `N ∣ 2` forces `k` even; `D = 1` | true | none |
| §7.1 reductions | `!![-2,-3;3,4]`; `c = 0`, `ε = -1`; parity cases | `T³A = !![7,9;3,4] ∈ Γ(3)`; `TA = !![1,1;3,4] ∉ Γ(3)`; `εI·T^{εb} = !![ε,b;0,ε]` | true | none |
| §7.3 `thetaSeries_slash_of_mem_Gamma0` | `A₂` at `!![2,1;3,2]`, `!![5,3;3,2]`, `!![1,0;3,1]`; `√2ℤ²` at `!![3,2;4,3]`; `D₄` at two matrices; `τ = 0.13 + 0.9i` | ratios `-1, -1, 1`; `-1`; `1, 1`, equal to `χ_L(d)` each time | true | none |
| §7.3 route, constant | `(-i)^k c^{-k} covol⁻¹ · c^k (det L)^{1/2} i^k (D_L/a)` | `= (D_L/a)`, since `covol = (det L)^{1/2}` | true | none |
| §7.4 `exists_modularForm_coe_eq_thetaSeries` | pinned bridge to the `Γ₀(N)` law; `A₂` parity | bridge reads the character at the lower-right entry; `χ` quadratic; `(-3/-1) = -1 = (-1)¹` | true | none |
| §7.5 `thetaCoset_slash_of_mem_Gamma`, `exists_modularForm_coe_eq_thetaCoset` | `A₂`, `γ` of order 3, at `T`, `T³`, `!![1,0;3,1]`, `!![-2,-3;3,4]`, `!![1,1;3,4]`; `√2ℤ²`, `γ = (1/2, 0)` | `e(1/3)`; `1`; `1`; `1`; `e(1/3)` for the `Γ₁(3)` matrix; `1` at `!![1,0;4,1]`, `!![-3,-4;4,5]` | true; false on `Γ₁(N)` | none |
| §7.6 consequences | `γ ∉ L`; `A₂`, `D₄` | value at `i∞`: `0` against `1`; `⟨2⟩` acts by `-1`; trivially on `D₄` | true | none |
| §8.6 `A₂` and `D₄` counts | enumeration, `m = 1..8` and `m = 1..4`; `m = 0` | `6,0,6,6,0,0,12,0` both; `24,24,96,24` both; at `m = 0`, `1 ≠ 0` | true; `m ≠ 0` needed | none |
| §8.6 comparison forms | ModularForms §0.1; `correctedE2` at `t = 2`; Sturm bounds | `B_{1,φ} = -1/3`, constant `1/6`; `-1, -24, -24`; `⌊8/12⌋ = ⌊6/12⌋ = 0` | true | none |
| *Scope*: "No other roadmap states … a modularity theorem" | QuaternionArithmetic §7.7 on main | weight `2` on `Γ₀(DM)` for `Θ_{L_{ij}}`, by Layer 7 | overclaim | C01 |

- Source locators checked against the text: 0 of 18; no cited work has a legal copy the sources service could read.
- Tau Ceti declarations opened at the pin, under `TauCeti/`: `ZLattice.gaussSum` and `ZLattice.dualGaussSum` (`Algebra/Module/ZLattice/GaussSum.lean:176`, `:449`), `ZLattice.IsEven.gaussSum_eq_jacobiSym` (`:562`, odd modulus, a different statement from §6.5), `ZLattice.IsEven.dualGaussSum_eq_jacobiSym` (`:613`), `ZLattice.IsEven.thetaSeries_slash_eq_gaussSum_smul` (`NumberTheory/ModularForms/ThetaSeries/CosetSplitting.lean:140`), `ZLattice.IsEven.tendsto_pow_mul_thetaSeries_nhdsGT` and `ZLattice.tendsto_pow_mul_thetaCoset_comap_S` (`…/ThetaSeries/Asymptotics.lean:173`, `:78`), `ZLattice.cosetGaussSum_eq_zero` and `ZLattice.cosetGaussSum_eq_of_mem` (`Algebra/Module/ZLattice/CosetGaussSum.lean:120`, `:149`), `TauCeti.conductor_kroneckerChar_dvd_iff` and `TauCeti.kroneckerChar` (`NumberTheory/LegendreSymbol/KroneckerSymbol.lean:433`, `:376`), `modFormCharSpace` and `mem_modFormCharSpace_iff_nebentypus` (`NumberTheory/ModularForms/DiamondOperators.lean:327`, `:356`), `ModularForm.eq_of_sturm_bound` (`NumberTheory/ModularForms/SturmBound.lean:78`), `TauCeti.EisensteinSeries.qExpansion_charE1MF_coeff` (`…/EisensteinSeries/WeightOne/QExpansion.lean:171`), `TauCeti.EisensteinSeries.qExpansion_coeff_correctedE2` (`…/WeightTwo/Basic.lean:157`), `TauCeti.frickeScalar` (`…/Fricke/Involution.lean:86`), the two level theorems of `Algebra/Module/ZLattice/RootLattice.lean:66`, `:80`.
- Duplication by object at the pins: no theta series of an orthogonal sum, no discriminant group of an orthogonal sum, no reciprocity, no real-model Milgram formula (`Algebra/Module/ZLattice/Milgram.lean` has only the two parity corollaries), no nebentypus of a lattice, no `Γ₀(N)` law, no partial Fourier transform, no `A₂` or `D₄` representation numbers.
- Cross-roadmap citations resolved on main: ModularForms §0.1 (line 353, constant term and coefficients as cited); IntegralLattices lines 192–198 (the same Milgram boundary from its side); LFunctions, LatticePackingsAndPerfectForms, QuaternionArithmetic, HypergeometricMotives, CFSGBasicProperties and Completed/IntegralLattices exist. The Lean names HalfIntegralWeightModularForms cites at its open head (lines 1745–1752, 1934–1938) are declared here or mapped under *Scope and ownership*. No other roadmap's `Suggested.lean` declares one of this file's names.
- Automatic checks: all passed on this head. Dependency check output: `depcheck: 182 roadmaps, 2074 edges, 0 problem(s)`. Nothing changes outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the 10 `sorry` warnings; `nebentypus` has a real body. The elaborated types of all 11 declarations carry every binder their README statements need. The one-tactic probe (`rfl`, `simp`, `infer_instance`, `simp` with the two Gauss-sum definitions, `exact?`) closes none of the 10 theorems.
- The pull request's description against the head: 40 Checks, 192 lines, eight Tau Ceti imports, the list of declarations, the lettered-label table and the list of remaining targets all agree with the head.

Overlap check: read HalfIntegralWeightModularForms and SiegelModularForms (open heads), LatticePackingsAndPerfectForms, OrthogonalTamagawaAndLatticeMass and IntegralLattices (main); also SpecialFunctionsTheta, QuaternionArithmetic and AnalyticNumberTheoryPartII (main). Partial Fourier transforms of Schwartz functions: this roadmap §1.2 and AnalyticNumberTheoryPartII §5.3g, no single owner (R01). Milgram's formula: every signature is Tau Ceti's and IntegralLattices'; the positive definite instance by theta asymptotics is §6.3 here, and both READMEs say so. The odd-rank theorem is HalfIntegralWeightModularForms'; Siegel theta series are SiegelModularForms'; the rank-one Landsberg–Schaar identity is SpecialFunctionsTheta §3.2, and is not a target here. IntegralLattices and Rank24LatticeConstructions at their open heads and HeisenbergImprimitivity were not available to read, so ownership against them was not checked.

Source independence: 0 passages compared with 0 sources, because no cited source has a legal copy the sources service could read; largest share Ebeling, *Lattices and Codes*, 6 of 18 locators (Ch. 2 once, Ch. 3 five times); its table of contents could not be read. From the README alone, Ebeling is cited at two chapters against seven layers in dependency order, so the layers cannot map one to one onto its chapters.

Research link: Layers 6–7 are the Hecke–Schoeneberg theorem and its Gauss-sum arithmetic (Schoeneberg 1974, Ch. IX; Ebeling 2013, Ch. 3; Milnor–Husemoller 1973, App. 4; Turaev 1998). On main, LatticePackingsAndPerfectForms and QuaternionArithmetic §7.7 consume Layer 7. Rests on the README's references and those roadmaps' READMEs.

## Not verifiable

- Seeded sample, source side: §§6.2, 6.3, 6.5, 6.6, 7.3, 7.4, 7.5, 8.6, 3.4 and 5.3 cite only works with no legal copy (below); §§1.2, 2.9, 7.1 and 7.6 cite no source. The mathematics of each was recomputed instead.
- Turaev, "Reciprocity for Gauss sums on finite abelian groups" (1998), §1.3: the publisher's page is in no open class; no arXiv version; the sources service found no legal copy.
- Milnor–Husemoller (1973), Serre (1973), Ebeling (2013), Schoeneberg (1974), Miyake (1989), Conway–Sloane (1999): Springer, paywalled.
- Iwaniec (1997): the AMS page is in no open class; no legal copy found.
- Ogg (1969): no legal copy found by the sources service.

## Source issues

- none

## For the human reviewers

- Not tested: Ebeling, *Lattices and Codes*, has the largest share of the locators (6 of 18). Neither its text nor its table of contents could be read, nor any other cited source, so wording and arrangement were compared with no source.
