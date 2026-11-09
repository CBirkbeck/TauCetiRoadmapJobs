# Review of ZerosOfLFunctions (pull request #1913 at 70b1054)

**Verdict:** needs changes

## R01 (P2) — 4.2 asserts `divisor Λ U = −polarOrder` at poles that lie outside `U`

**Location.** `TauCetiRoadmap/ZerosOfLFunctions/README.md` lines 1192–1194 (§4.2, a sampled target): "For a record satisfying `HasMeromorphicContinuation`, `divisor Λ U` is nonnegative off `polarOrder.support` and equals `−polarOrder` on it".

**Claim.** `U` is arbitrary, but Mathlib's divisor is `0` off `U`. So the second clause is false at every pole outside `U`. The statement is missing the hypothesis that the point lies in `U`.

**Witness.** Mathlib `MeromorphicOn.divisor_def` (`Mathlib/Analysis/Meromorphic/Divisor.lean:61–63`) gives the value `0` when `z ∉ U`. For `riemannZetaData` (`polarOrder = single 0 1 + single 1 1`, `Data/RiemannZeta.lean:57`) with `U = ∅`, `divisor completedRiemannZeta ∅ 1 = 0`, but `−polarOrder 1 = −1`. The first value was checked in Lean (`by simp [MeromorphicOn.divisor_def]`).

**Repair.** Replace the sentence with: "for every `U`, `divisor Λ U` is nonnegative off `polarOrder.support` and equals `−polarOrder` at the points of `U ∩ polarOrder.support`; in particular `divisor Λ univ = −polarOrder` on `polarOrder.support`". Keep the second sentence about `entireCompletion` as it is.

**Test.** On the same instance, the repaired statement claims nothing at `1` for `U = ∅`. For `U = univ` it gives `divisor completedRiemannZeta univ 1 = −1 = −polarOrder 1`, which is the simple pole of `Λ` at `1`.

## R02 (P3) — `dirichletLFunction_zeroFreeRegion` is more general in Lean than anywhere in the README

**Location.**
- README line 1590 (§6.4), after the statement for a *primitive* character of conductor `𝔣`: "At `K = ℚ` this is `dirichletLFunction_zeroFreeRegion`."
- `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` lines 185–194: `∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q)`, with the region `1 - c / Real.log (q * (|ρ.im| + 3))`.

**Claim.** The Lean statement covers every character modulo `q`, primitive or not, and measures the region by the modulus `q`. The README states the `K = ℚ` case only for primitive characters measured by their conductor, and no README target states the extension. So the README's generality and the Lean's differ.

**Witness.** The principal character modulo 2 is admitted by the Lean statement but is outside README §6.4. Its L-function is `(1 − 2^{−s}) ζ(s)`, whose extra zeros lie on `Re s = 0`. Under `c ≤ log 3/2` the region at `q = 2` lies in `Re s ≥ 1 − (log 3/2)/log 6 = 0.6934`. So the Lean claim is true, but it is stated nowhere in the README.

**Repair.** In §6.4, replace the quoted sentence with one saying all of the following:
- At `K = ℚ` the statement is `dirichletLFunction_zeroFreeRegion`, stated for every character `χ` modulo `q ≥ 1`, primitive or not, in the coordinate `q(|Im ρ| + 3)` and with `c ≤ log 3/2`.
- The imprimitive case follows from the primitive one by 6.4b, for three reasons:
  - the deleted Euler factors vanish only on `Re s = 0`;
  - the cap puts the region in `Re s ≥ 1/2`;
  - the conductor `q*` divides `q`, so `log(q*(|t| + 3)) ≤ log(q(|t| + 3))` and the region at `q` lies inside the region at `q*`.

**Test.** With the repair, the principal character modulo 2 is covered in the README by 6.4b applied to `ζ`, which has no zero in `[0.6934, 1)`. The README's generality then equals the signature's.

## R03 (P3) — No stated order against #1907, the other open pull request on this roadmap (carried from the previous review's R01)

**Location.** The pull request's description, which is outside the folder. Its last line reads "Merge order: no pending supplier." It names no other pull request.

**Claim.** Two open pull requests change `TauCetiRoadmap/ZerosOfLFunctions/`, and their heads conflict. One has to be rebased on the other before either merges, and the description has to say which.

**Witness.**
- `roadmaps overlaps ZerosOfLFunctions` (index of 2026-11-09T18:40:59Z) reports "#1907 and #1913 conflict" in `README.md` and `Suggested.lean`.
- #1907 is still at `123254c`. Its `Suggested.lean` declares `dedekindZeta_zeroFreeRegion`, `completed_orderLE_one`, `gammaLogDerivBound`, `finite_zero_sum_le_logDeriv` and `riemannVonMangoldt_dedekindZeta`, none of which is declared here.
- #1907 lacks `riemannZeta_zeros_summable_ordinate` and `neg_re_logDeriv_riemannZeta_le`, which this head declares.

**Repair.** Add one sentence to the description saying which of #1913 and #1907 is rebased on the other. The rebased one then reconciles the declarations listed above.

**Test.** After the rebase, `roadmaps overlaps ZerosOfLFunctions` reports no conflict between the two heads.

## Verified sound

**Gate, build and dependency check.**
- Gate re-run at `70b1054`: every check `0`, `OK`, exit 0.
- Depcheck: `depcheck: 236 roadmaps, 2263 edges, 0 problem(s)`. There are no UPWARD, CYCLE or `moved:` lines.
- `lake env lean` on `Suggested.lean`: exit 0 in 7 s. The only warnings are the 17 `declaration uses 'sorry'` warnings, one per theorem.
- The file has no `variable`, `include`, `set_option`, `lemma`, `example`, `#eval` or sorry'd data. The 19 `sorry` tokens are the 17 theorem bodies plus 2 in the module docstring.
- The 3 definitions (`OrderLE`, `zeroCount`, `zetaEntireCompletion`) have real bodies and are each used by a headline.
- The elaborated types of all 20 declarations (`signatures.md`) match their README statements, apart from R02.
- No declaration of main's `Suggested.lean` is dropped. Six are added.

**Padding probe.** Each of the 17 theorems was tried, on a scratch copy, with `first | rfl | simp | norm_num | infer_instance | trivial | exact ⟨…⟩`. All 17 fail, so there is no padding.

**Headline theorems.** The README's end theorems are:
- the region for `ζ_K` and for ray-class L-functions;
- uniform Riemann–von Mangoldt for both families;
- the effective prime ideal theorem;
- the effective ray-class count;
- the effective abelian Chebotarev count.

All are stated, as `heckeLFunction_zeroFreeRegion` (at `ψ = 1` for `ζ_K`), `riemannVonMangoldt_heckeLFunction`, `primeIdealCount_effective`, `rayClassPrimeCount_effective` and `frobeniusPrimeCount_effective_abelian`. Their `K = ℚ` forms, Hadamard and the Weil formula are stated too. The module docstring correctly names the two things that cannot be stated:
- the completions of Dedekind and Hecke L-functions, which are not at the pins;
- the exceptional-zero terms, whose region constant is a witness of a sorried theorem.

**Library names resolved at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`).**
- 154 fully qualified README names were run through `#check @` in one scratch file. 149 resolve; the other 5 are bare namespace tokens.
- 81 unqualified names were checked under `open TauCeti …`. 77 resolve. The other 4 are found by grep in Perron modules not imported in the scratch file: `truncatedPerron_LSeries` (`Perron/Formula.lean:130`), `norm_truncatedPerron_LSeries_sub_sum_le` (`:229`), `truncatedPerronKernel_one` (`Perron/Basic.lean:204`, value `π⁻¹ arctan(T/c)` as 8.1 says) and `perronFormula` (`Perron/Ideal.lean:161`).

Declarations opened and compared with the README's description:
- `heckeLFunctionC` (`Hecke/Basic.lean:74`, the canonical continuation, `0` without one);
- `PrimitiveRayClassCharacter` (`Hecke/Primitive.lean:91`);
- `primeCount`/`primeTheta` (`Counting.lean:625–630`);
- `primePsi_sub_primeTheta` (`Prime/Psi.lean:210`) and `primePowerWeight_eq_vonMangoldt_re` (`:106`);
- `higherPrimePowerTheta_le` (`HigherPrimePowers.lean:296`, `finrank/(2 log 2)·√x log² x`, `x ≥ 1`);
- `primeCount_eq_primeTheta_div_log_add_integral` (`AbelSummation.lean:494`);
- `primeIdealTheorem` (`PrimeIdealTheorem.lean:39`, three conclusions);
- `primeCount_primesCongruent_isEquivalent_logIntegral` (`PrimesCongruent.lean:50`);
- `frobeniusPrimeCount` (`VonMangoldt.lean:177`, a `ℕ`);
- `analyticConductorAt` and `analyticConductorAt_eq` (`AnalyticInvariants.lean:125,133`, arithmetic coordinate);
- `NormalizationTranslation` (`Data/Normalization.lean:124–141`, analytic shift = arithmetic + `w/2`; `ArithmeticLFunctionData` extends `AnalyticLFunctionData`, so 2.3 is well typed);
- `HasMeromorphicContinuation`, `HasFunctionalEquation` and `HasDirichletAgreement` (`Data/Basic.lean:174–197`);
- `exists_differentiableOn_eqOn_exp_comp` (`BranchLogRoot.lean:173`);
- `isSimplyConnected_image_of_differentiableOn_of_injOn` (`ImageSimplyConnected.lean:95`; Mathlib `IsSimplyConnected s := SimplyConnectedSpace s`, `SimplyConnected.lean:137`);
- `rayClassArtinMap` and `rayClassArtinMap_idealClass` (`Reciprocity.lean:128,216`, `K L : Type`, explicit `hur`);
- Mathlib `AnalyticOnNhd.sum_divisor_le` (`JensenFormula.lean:389`, with `1 ≤ M`) and `MeromorphicOn.divisor_def`.

**Cross-roadmap citations.**
- All 52 L-functions names cited as not realized at the pin are declared in that roadmap's `Suggested.lean` on main, among them `heckeLFunction_ne_zero_of_one_le_re` (line 2680, nontrivial characters only) and `Grossencharacter.heckeMellinTotal` (line 2390).
- Arithmetic Dirichlet Series §§2.3, 4.2, 4.3, 5.2, 6.1–6.4 and 10.1–10.2 exist on main.
- Global Number Fields Layers 2, 3E (line 393) and 9 exist on main.
- Number Field Arithmetic §2.3 (line 647), Chebotarev Layers 2, 11, 13 and 14, and Class Field Theory Layer 12 (line 1724) exist on main.
- The Modular Forms roadmap consumes `HeckeRing.GL2.Newform.analyticConductorAt` (its README line 243).
- All suppliers are on main and earlier in the merge order. `citations.md` lists 13 names "found nowhere"; 6 are L-functions names declared on main and 7 are PrimeNumberTheoremAnd names under Provenance.
- No id cited by a consumer is dropped. The ids that ExplicitZetaBounds, ExplicitNumberFields, ExplicitPrimeCounting and AnalyticNumberTheoryPartIII cite (1.1–8.7) all exist at this head.
- Those four roadmaps and Chebotarev were read through `roadmaps show`. Each cites this roadmap as supplier and none owns its objects. Ownership against the remaining open pull requests was covered only through the tool's overlap and citation scans.

**Sources (seeded sample).**
- *1.2–1.4, 3.5.* `dlmf5` line 104–108 (5.11.1 on `|ph z| ≤ π − δ`), line 158–160 (5.11.2), line 488–492 and 524 (5.11.9, uniformly for bounded real `x`), and line 563–569 (§5.11(ii) remainder bounds, `sec(½ ph z)`-dependent, so the constant depends on `δ`).
- *6.2.* `kadiri2012` line 79–85: Theorem 1.1, both regions, `d_K` large, the zero real and simple.
- *6.4.* `kadiri2012` line 65–73 reports Lagarias–Montgomery–Odlyzko Lemma 2.3, (1.5)–(1.6), with `A(χ) = d_K N𝔣` and `R₄` independent of `K`.
- *5.6, 6.4d.* `kadiri2012` line 230–237 (§2.1.2, the explicit formula with `½ log d_K`, `Re 1/s + Re 1/(s−1)` and the γ-term).
- *7.5.*
  - `bennett2021` line 56–58: `N(T,χ)` counts `0 < β < 1`, `|γ| ≤ T`.
  - `bennett2021` line 83–84: Corollary 1.2, `q > 1`, `T ≥ 5/7`, `0.247 log qT + 6.894`.
  - `bennett2021` line 73–76: the gap in Trudgian, including his Theorem 2.
  - `hasanalizade2022` line 63–65: Corollary 1.2, `T ≥ 1`, `0.228(log d_K + n log T) + 23.108n + 4.520`.
  - `hasanalizade2022` line 37–50: the §1 remark.
  - `trudgian2015` line 16–27: Theorems 1 and 2, primitive nonprincipal `χ`.
  - The README's venue for Trudgian, Math. Comp. 84 (2015) 1439–1450, is correct (AMS page). The manifest's venue line (no. 294, 2047–2058) is not; that is outside this pull request.
- *8.1.* `truncatedPerronKernel_one` as above.
- *2.3, 4.2.* The pinned record fields (R01).
- *0.4, 1.1, 2.2, 5.2, 6.3* carry no external locator. Their statements are definitions or elementary facts and were recomputed below.
- *8.6, 8.8* rest on Davenport and Lagarias–Odlyzko (under Not verifiable). Their mathematics was re-derived instead: the conjugate on the `φ̌` term, the orders at `0` and at `−m`, and the fibre identity of the exceptional terms.

**Adversarial table** (values computed in pure Python and Lean on this worker).

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| `OrderLE` (0.1) | `exp z²` at `A = 1`; `1/Γ` vs exponential type; `1` at `A = −1` | `exp(r²)/exp(r^{3/2}) → ∞`; `‖1/Γ(−n−½)‖ = Γ(n+3/2)/π`, log `n log n + O(n)`; `1 ≤ e·exp(‖s‖^{A'})` | holds | — |
| `zeroCount` (4.1) | `z/(z−1)` on `closedBall 0 2`; `1/z` on `{0}`; `f = 0` | zeroCount `1`, divisorCount `0`; `(−1).toNat = 0`; divisor `0` so count `0` | holds | — |
| `zetaEntireCompletion` (0.2) | `s = 0, 1`; generic `s` | `0 + 1 = 1` at both; `s(s−1)Λ₀ + 1 = s(s−1)Λ − (s−1) + s − 1 + 1 = s(s−1)Λ` | holds | — |
| 0.4 strip growth | pole at `1+5i`, `T₀ = 5`; `exp(−s²)` | unbounded at `t = 5`; `‖exp(−(it)²)‖ = e^{t²}` beats every `C(1+|t|)^A` | holds | — |
| 1.1 `logGamma` | first `Im LnΓ = π` on rays `θ = π/2, π/4, 1/10`; value at 3 | `r = 5.5386, 4.1513, 12.6264` (README 5.539, 4.151, 12.626); `log Γ(3) = log 2` | holds | — |
| 1.4 / 1.5 | `logDeriv Gammaℂ 1`; `−logDeriv Gammaℝ 3` | `−γ − log 2π = −2.4151`; `0.5541` | holds | — |
| 1.4a symmetric form | `s = 2`; `s = −2` | both sides `1.41509`; LHS `−0.1648` vs RHS `0.5541` (so `ζ(s) ≠ 0` is needed) | holds | — |
| 2.1 conductors | ζ at `½`; `gammaC={0}` at 0; `ℚ(i)`; odd χ mod 4 | `3.5`; `12`; `48`; `16` | holds | — |
| 2.2 comparison | ζ on `[−5,5]`; shift `iB` | `|t|+3 ≤ ‖σ+it‖+3 ≤ (8/3)(|t|+3)`; factor `≥ 3 ≥ (3/(B+3))(|t|+3)` near `t = −B` | holds | — |
| 2.3 / 2.4 | `Δ`, `k = 12`, `N = 1` | analytic `½` gives `9·10 = 90` = Tau Ceti at `6`; same-point `3.5·4.5 = 15.75`; reversed sign maps `½ ↦ 1 − k/2` | holds | — |
| 3.1 tail bound | `R = 0`, `c = α = 1` | `E₁(1) = 0.2194 ≤ Γ(1) = 1` | holds | — |
| 3.5 | `|Λ(2m+2i)|`, `m = 10, 20` | `3.67680`, `13519751.806` (README `3.67680`, `13519751.81`) | holds | — |
| 4.2 | ζ record, `U = ∅`, `p = 1`; `U = univ` | `divisor ∅ 1 = 0` (Lean) vs `−polarOrder 1 = −1`; `divisor univ 1 = −1` | **false off `U`** | R01 |
| 4.3 Jensen | `z/10`, `r=1`, `R=2`, `M=1`; `z`, `R = ½` | trailing bound `3.32 ≥ 1`; `2 ≥ 1`; `‖a‖` in first form gives `0 < 1` | holds | — |
| 5.2 `E₁` | `z = −½`; `z = 1` | `‖E₁−1‖ = 0.0902 ≤ 0.125`; `E₁' (1) = −e` | holds | — |
| `hadamard_of_orderLE_one` | `1 − s`; `exp(cs)`; `s` a zero | `exp(−s)E₁(s)`, `b = −1`; empty product, `b = c`; a zero factor gives `HasProd 0`, so both sides are `0` | holds | — |
| `zetaEntireCompletion_hadamard`, 5.6 | `B`; `exp s · ξ̃` | `B = −0.0230957 = −∑Re(1/ρ)`; `f(0) = 1`, `f(1) = 2.718`, no unimodular `κ` | holds | — |
| `riemannZeta_zeros_summable_ordinate` | first pair; `1/Γ(s+½)` | `2/(1+14.134725²) = 0.00996`; real zeros give summands `1` (confinement needed) | holds | — |
| 6.3 | ζ; cap at `n = 1` | empty (ζ < 0 on `(0,1)`); `c/log q(0) ≤ ½`, so `β ≥ ½` | holds | — |
| `heckeLFunction_zeroFreeRegion` | nesting; LMO region | `1 + log(4/3)/log 3 = 1.2619 < 1.27`; each factor `≥ |γ|+3`, so the region lies inside LMO's for `c < 1/R₄` | holds | — |
| `riemannZeta_zeroFreeRegion` | `γ = 0`; trivial zero `−2` | region `Re ≥ 1 − c/log 3`; excludes `−2` for `c < 3 log 3` | holds | — |
| `dirichletLFunction_zeroFreeRegion` | χ₀ mod 2 | extra zeros on `Re 0`; region `Re ≥ 0.6934` | holds; README narrower | R02 |
| `neg_re_logDeriv_riemannZeta_le` | `δ ≥ 1`; `t → 0`, `δ = 2|t|` | LHS `≤ 0.570`, RHS `≥ −1 + C log t₀`; `1/(4|t|)` vs `log|t| → −∞` (threshold needed) | holds | — |
| `riemannVonMangoldt` | `T = 2`; `T = 100` | `0` vs `−0.6827`, `C log 2`; `29` vs `28.127` | holds | — |
| `riemannVonMangoldt_dirichlet` | `q = 1`; BMOR at `qT ≥ 4` | `2N(T)`; `0.247 log qT + 6.894 ≤ 5.22 log qT` | holds | — |
| `riemannVonMangoldt_heckeLFunction` | `ψ = 1` (HSW); `ℚ(i)` | HSW error `≤ C_n log(d_K Tⁿ)` as `log(d_K Tⁿ) ≥ n log 2`; ζ + `L(χ₋₄)` terms sum to `(T/π)log(4(T/2πe)²)` | holds | — |
| `chebyshevPsi_explicitFormula`, 8.3 | `c_ℚ`; `ℚ(i)` at `x = 2` | `−log 2π = −1.8379`; trivial-zero terms `log 2 = 0.6931` | holds | — |
| `riemannZeta_weilExplicitFormula` | shift `(2)→(−1)`, `w = 1−s`; `φ = 0` | zero side `= φ̃(0)+φ̃(1)+(2πi)⁻¹∫_{(2)}Λ'/Λ·(φ̃(s)+φ̃(1−s))`, prime part `−∑Λ(n)(φ(n)+φ(1/n)/n)`; `0 = 0` | holds | — |
| `primeIdealCount_effective` | `ℚ`, `x = 10⁶` | `ψ−ϑ = 1102.42 ≤ 137682.4`; `Π = 78597.11` vs `π = 78498` | holds | — |
| 8.6 conjugation | quartic χ mod 5, `supp φ ⊂ (0.4,0.6)` | `−(i log 2)/2` vs `+(i log 2)/2` | holds | — |
| `rayClassPrimeCount_effective` | `ℚ`, `(4)∞`, `x = 9`; threshold | class 1: `log 15 = 2.7081` vs `ϑ = log 5`; class 3: `log 21` vs `log 63`; `log x ≥ 0.696, 2.496, 190.868` at `q = 1, 3, 10⁶` | holds | — |
| `primeCounting_progression_effective` | `q = 4`: `a = 3`, `a = 2` | `4` vs `Li 20/2 = 4.4301`; `a = 2`: count `1` vs `Li x/2` (unit hypothesis needed) | holds | — |
| `frobeniusPrimeCount_effective_abelian`, 8.8 | `K = L = ℚ`; fibre identity | `π(x) − Li x`; `#ker Φ·x^β/(β#Cl) = x^β/(β#G)` | holds | — |
| 8.9 | `x = 10`; `x = 10⁴` | `Li 10 = 5.1204`, integral `3.6629` both ways; `159.36` vs `117.88` | holds | — |
| `dirichletLFunction_convexity` | `q = 1`, `t = 0` | `|ζ(½)| = 1.4604 ≤ C·3^{¼+ε}` | holds | — |

## Not verifiable

- **Davenport, *Multiplicative Number Theory*, §§11–20.** Cited in 0.3, 5.3, 5.5, 5.6, 6.4d, 7.5, 8.2, 8.3, 8.5–8.7. Settled as uncertified (paywalled). The `ξ` constant `B` and the explicit-formula constant `c_ℚ` were recomputed instead.
- **Titchmarsh, §5.1, §§9.2–9.4, Theorem 9.4, p. 214.** Cited in 3.3, 4.5, 7.3, 7.4, 7.6. OUP, paywalled, and absent from the manifest. `N(100) = 29` and `S(T) → −1` were recomputed instead.
- **Iwaniec–Kowalski, §5.1 (5.7) and §5.2.** Cited in the conventions and 3.3. AMS, paywalled, and absent from the manifest. The edge exponents were re-derived instead.
- **Lang, *Algebraic Number Theory*, XVII §3, Theorems 3.1–3.2.** Cited in 8.4. Settled as uncertified. The formula at `K = ℚ` was re-derived by the contour shift.
- **Lagarias–Montgomery–Odlyzko 1979, Lemma 2.3.** Cited in 6.4. Settled as uncertified; only its report in `kadiri2012` line 65–73 was read.
- **Lagarias–Odlyzko 1977, Theorems 1.3 and 9.2.** Cited in the remark of 8.8. The sources service returned "no legal source found", and Odlyzko's publication list gives only the citation, with no file. It is also absent from the manifest. The remark is about a statement this roadmap does not own.
- **DLMF 5.5.3 and 5.6.6.** Cited in Checks of 0.1, 1.3a and 1.6. The cached `dlmf5` text covers §5.11 only. The values were recomputed from the reflection formula and Euler's integral.
- **PrimeNumberTheoremAnd at `127b50e` (Provenance, secondary).** The cached text is the repository README only. One file was opened on GitHub at that commit, `Mathlib/Analysis/Complex/HadamardFactorization/Order.lean`:
  - it declares `Complex.Hadamard.hadamard_factorization_of_order`, whose proof has no `sorry`, and `EntireOfOrderAtMost.summable_norm_inv_pow_divisorZeroIndex₀`;
  - its `EntireOfOrderAtMost` (an ε-family bound `exp(C(1+‖z‖)^{ρ+ε})`) agrees with `OrderLE` for `ρ ≥ 0`, as the table claims.

  The other rows were not opened.

## Source issues

- **Misprint** in kadiri2012 at §1, display (1.6), p. 2 (arXiv v1): the source says Lagarias–Montgomery–Odlyzko prove that `L(s, χ, K)` has no zeros in region (1.6). Near the real axis that region overlaps (1.5), where one zero is allowed. It should say no zeros in (1.6) apart from the possible real zero of (1.5); affects nothing.
