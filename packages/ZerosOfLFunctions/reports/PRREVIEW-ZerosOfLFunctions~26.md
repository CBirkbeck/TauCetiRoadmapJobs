# Review of ZerosOfLFunctions (pull request #1913 at c4cb18f)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ZerosOfLFunctions/` at `c4cb18f`, the same head the previous review read (0 changed lines). There is one finding, P3, and it concerns the pull request rather than the folder's mathematics: the stale description and the unstated order against #1907 (R01, carried). There is no blocking finding.

- **Gate.** It passes.
- **Dependency check.** It reports 0 problems.
- **Elaboration.** `Suggested.lean` elaborates with `sorry` as the only warning.
- **Adversarial pass.** It found no false, vacuous or mis-scoped statement among the 3 definitions, the 17 theorems and the 15 sampled targets.

Paths: `TauCeti/…` is a file of the Tau Ceti pin `2fd255d9`, and `Mathlib/…` a file of the pinned Mathlib. Other roadmaps are read on main (`33196b1`) unless a pull request is named.

## R01 (P3) — The description misstates this head and relies on an open problem, and no order is stated against #1907 (previous R01, not repaired)

**Location.** The pull request's title and description, which are outside the folder:
- the title, "effective statements under the exclusion of Landau–Siegel zeros";
- the description's "now that the uniform exclusion of Landau–Siegel zeros is a headline of AnalyticNumberTheoryPartI (§0.34)";
- its merge order, "after AnalyticNumberTheoryPartI (#1126) lands".

**Claim.** The description says what this head changes, and the order against the other open pull request on this roadmap is settled.

**Witness.** README lines 87–91 exclude "the nonexistence of exceptional zeros", and lines 2293–2294 keep the exceptional-zero alternative. #1126 merged as `63d18d7b`. `roadmaps overlaps` reports "#1907 and #1913 conflict" in both files; #1907 is still at `123254c`.

**Detail.**
- The premise is an open problem. An effective absolute `c` with `(1 − β) log q ≥ c` for every real zero of every real primitive character is the Landau–Siegel conjecture.
- This head never uses it. Every effective count in `Suggested.lean` (lines 288–346) absorbs the exceptional term only for a fixed field, modulus or extension.
- At #1907's head, three statements differ from this head:
  1. `heckeLFunction_zeroFreeRegion` (line 165) conjoins into one clause the two that this head (line 154) states separately.
  2. `rayClassPrimeCount_effective` (lines 339–343) counts `{I : integralIdealsPrimeTo 𝔪 | …}`, where this head (lines 309–317) counts `HeightOneSpectrum` primes.
  3. `frobeniusPrimeCount_effective_abelian` (line 367) takes `K L : Type`, where this head (line 340) takes `Type*`.

**Repair.**
1. Retitle the pull request and describe this head. Its content is:
   - the general-field headlines at the pin;
   - the consumed Tau Ceti holomorphic-logarithm and image lemmas;
   - 8.7's width, uniform over the fields of each degree;
   - the exceptional-zero alternative, kept.
2. Delete the Landau–Siegel sentence and the merge-order sentence about AnalyticNumberTheoryPartI. This roadmap is that roadmap's supplier and consumes nothing from it.
3. State which of #1913 and #1907 is rebased on the other. The rebased one reconciles the three statements above.

**Test.**
- The new description agrees with README lines 87–91 and 2293–2294 and names no open problem as available.
- After the rebase, `roadmaps overlaps ZerosOfLFunctions` reports no conflict between the two heads.

## Previous findings

- **R01 — not repaired.** The title and description are unchanged ("effective statements under the exclusion of Landau–Siegel zeros … after AnalyticNumberTheoryPartI (#1126) lands"), and the overlap tool still reports "#1907 and #1913 conflict". It is carried as R01. There is no repair report, so no finding is settled as "not actionable".
- **R02 of round 24 — repaired.** The previous review confirmed this. `Suggested.lean` line 307 still reads "At `n = 1` the width `c` is absolute", which I re-checked against the type (probe below).

## Verified sound

### Gate, dependency check, elaboration, signatures

- **Gate.** My run of `gate … ZerosOfLFunctions --base origin/main` prints every check at 0 and exits 0:

  ```text
  … layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

  `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check.** It exits 0, with no UPWARD, CYCLE or `moved:` line:

  ```text
  depcheck: 236 roadmaps, 2261 edges, 0 problem(s)
  ```

  Every supplier is on main: L-functions, Class Field Theory and Modular Forms under `TauCetiRoadmap/`; Arithmetic Dirichlet Series, Global Number Fields, Number Field Arithmetic, Chebotarev and Contour Integration under `Completed/`. That is all a revised roadmap on main may consume.
- **Elaboration.** `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits 0. Its only output is 17 "declaration uses `sorry`" warnings, at lines 97, 109, 123, 136, 154, 173, 184, 201, 214, 228, 246, 261, 277, 293, 309, 327 and 340.
- **`#check @` comparison.**
  - A scratch copy with `#check @name` for all 20 declarations elaborates with 0 errors.
  - The file has no `variable` line, so no binder can be lost. Every hypothesis is explicit, for example `[IsAbelianGalois K L]` in `frobeniusPrimeCount_effective_abelian` and `[NeZero q]` in the Dirichlet statements.
  - The 20 elaborated types are those of `signatures.md`. Each agrees with its README statement in generality: 6.4 and 7.5 range over every field of degree `n`, 8.5 and 8.8 fix the field or extension, and 8.7 fixes the degree before `K` and `𝔪`.
- **`zetaEntireCompletion` probe.** The probe, against Mathlib's `completedRiemannZeta_eq`, proves three facts in a scratch file (exit 0):
  1. `zetaEntireCompletion s = s (s − 1) completedRiemannZeta s` for `s ≠ 0, 1`;
  2. `zetaEntireCompletion 0 = zetaEntireCompletion 1 = 1`;
  3. `Differentiable ℂ zetaEntireCompletion`.

  So the one definition with a real body is the stated object, "twice Riemann's ξ".

### Headline theorems and padding

- **Headlines.** The README Summary names five end theorems:
  1. the de la Vallée Poussin region for Dedekind zeta and ray-class L-functions (`heckeLFunction_zeroFreeRegion`);
  2. the degree- and conductor-uniform Riemann–von Mangoldt formula (`riemannVonMangoldt_heckeLFunction`);
  3. the effective prime ideal theorem (`primeIdealCount_effective`);
  4. the effective ray-class count (`rayClassPrimeCount_effective`);
  5. the effective abelian Chebotarev count (`frobeniusPrimeCount_effective_abelian`).

  All five are stated, with their `ℚ` cases and Hadamard at order ≤ 1. The module docstring names what is not stated and why: the completed Dedekind and Hecke functions are not at the pin, and the exceptional terms are defined from a `sorry`'d witness.
- **One-tactic probe.** A scratch copy replaced each `sorry` by `first | (simp; done) | rfl | infer_instance | (norm_num; done) | (aesop; done)`. All 17 theorems fail with 17 errors (unsolved goals or "aesop failed"). No declaration restates a definition, computes a value or mirrors a Check, so there is no padding.

### Seeded sample of sources

| Target | Locator | What I checked | Result |
| --- | --- | --- | --- |
| 1.3 | DLMF 5.11.9 with 5.11.1 | dlmf5 lines 490–492 give `|Γ(x+iy)| ∼ √(2π)|y|^{x−1/2}e^{−π|y|/2}` for fixed `x`. Lines 104–108 give 5.11.1 on the sector `|ph z| ≤ π − δ`, and lines 563–569 the remainder bound, which is where the uniformity in `σ ∈ [a,b]` and the `O(1/|t|)` come from (the README says "with the remainder from 5.11.1"). | supported |
| 1.4 | DLMF 5.11.2 | dlmf5 lines 158–160 give `ψ(z) ∼ ln z − 1/(2z) − …`. Lines 566–569 bound the remainder by `sec^{2n+1}(½ ph z)` times the first neglected term, which is bounded on `S_δ`. The two exact identities follow from the definitions (values in the table). | supported |
| 1.4a | Mathlib, Tau Ceti | `logDeriv_riemannZeta_one_sub` (`Mathlib/NumberTheory/LSeries/RiemannZetaLogDeriv.lean:35`) has hypotheses `s ∉ ℤ`, `ζ(s) ≠ 0` and the README's right side. `HasFunctionalEquation.eventuallyEq` (`TauCeti/NumberTheory/LFunctions/Data/Basic.lean:269`) is the germ equation `Λ = ε Λ_dual(1 − ·)` on `𝓝[≠] s`. The PrimeNumberTheoremAnd `kadiri_thm_3_1_q1_functional_eq` at `127b50e` has the same four hypotheses and the rearranged form, with no `sorry`. | supported |
| 1.5 | DLMF 5.11.9; L-functions Layer 0 | The rate `−(πn/4)|t|` with `n = #μ + 2#ν` matches `AnalyticLFunctionData.degree` (`Data/Basic.lean:106`). `A(σ)` was recomputed (table). | supported |
| 2.3 | Tau Ceti `NormalizationTranslation` | `Data/Normalization.lean:135–141`: `gammaR_eq`, `gammaC_eq` (analytic = arithmetic + `w/2`), `completed_eq` (`N^{−w/4}` times arithmetic at `s + w/2`). These give both identities of 2.3. | supported |
| 2.4 | Tau Ceti `analyticConductorAt_eq` | `TauCeti/NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean:133`: `N (‖s‖ + 3)(‖s + 1‖ + 3)`, arithmetic coordinate, for `Newform N k` with `[NeZero N]`. | supported |
| 3.3 | Iwaniec–Kowalski §5.2; Titchmarsh §5.1 | Not legally readable (Not verifiable). I recomputed the gamma-quotient exponent `(n/2)(1 + 2δ)` and the edge exponents `1/2 + δ` and `0`, and the interpolated `1/4 + δ/2` at `σ = 1/2`. | mathematics verified |
| 4.1 | Mathlib | `LocallyFiniteSupport.finite_inter_support_of_isCompact` (`Mathlib/Topology/LocallyFinsupp.lean:108`) gives finiteness on a compact set, the hypothesis "bounded with closure in the meromorphy set". | supported |
| 5.1 | route via 4.3 | `AnalyticOnNhd.sum_divisor_le` (`Mathlib/Analysis/Complex/JensenFormula.lean:389`): `0 < r < R`, `1 ≤ M`, analytic on `closedBall c R`, `f c ≠ 0`, bound on the sphere, conclusion `≤ log(M/‖f c‖)/log(R/r)`. With `R = 2r` this gives `O(r^{A+ε})`. | supported |
| 5.2 | none needed | The facts are elementary calculus, recomputed (table). | verified |
| 6.1 | Tau Ceti | `threeFourOneCombination z = 3 + 4 Re z + Re z²` (`TauCeti/NumberTheory/LSeries/ThreeFourOne.lean:59`), nonnegative for `‖z‖ ≤ 1` (line 107). `vonMangoldt_re_nonneg` (`ArithmeticDirichletSeries/VonMangoldt.lean:164`). `logDeriv_LSeries_eq_neg_tsum_vonMangoldtTransform` (`…/Logarithm/VonMangoldtCoeff.lean:142`, strictly right of the abscissa). `vonMangoldtTransform_apply_prime_pow` (`χ(P)^n log 𝔑P` at `P^n`). `idealAbscissaOfAbsConv_lt_re_of_bounded`. | supported |
| 7.2 | Tau Ceti | `argumentPrinciple_nullHomologous` (`TauCeti/Analysis/Contour/Argument/Cycle.lean:110`): `U` open; analytic and nonzero on `U \ S`; meromorphic of order `ord` on `S`; closed piecewise-`C¹` null-homologous curve avoiding `S`; `∫ γ'·logDeriv f(γ) = 2πi ∑_{z∈S} windingNumber γ z · ord z`. These are exactly the README's hypotheses and conclusion. | supported |
| 7.3 | Tau Ceti; Titchmarsh §9.3 | `exists_continuousOn_arg_lift_with_partition` (`Argument/Lift.lean:427`, lift `arg(γ a − w) + ∑ Im log(segRatio)`); `integral_inv_sub_mul_deriv_eq_log_norm_add_I_mul_sum_log_im` (`Winding/SegmentSum.lean:154`); `windingNumber_eq_integral_of_avoidance` (`Winding/Number/Basic.lean:170`); `windingNumber_comp_eq_integral_logDeriv` (`LogDerivFTC.lean:227`). The three-step chain composes as written. Titchmarsh is in Not verifiable; `S(T) → −1` was recomputed. | supported |
| 8.5 | Davenport §18 | Uncertified (Not verifiable). The route inputs exist: `TauCeti.idealSummatory_mul_eq_sub_integral_mul` (`ArithmeticDirichletSeries/AbelSummation.lean:390`), `TauCeti.Real.logIntegral` (`Analysis/SpecialFunctions/LogIntegral.lean`) and `hasSum_idealTerm_vonMangoldt` (`Prime/DedekindZeta.lean:69`). Counts were recomputed. | route verified |
| 8.6 | Davenport §§19–20 | Uncertified. The pinned weight identity (6.1 row) gives `ψ_K(x, χ)` as the coefficient sum of `−logDeriv heckeLFunctionC`. The trivial-zero orders and the conjugate on the `φ̌` side were recomputed. | route verified |

The README flags no locator as unverified.

- **Further locators re-read** (outside the sample but behind headline docstrings):
  - **Kadiri.** kadiri2012 lines 65–73 (LMO's regions (1.5)–(1.6), "`R₄` … independent of `K`"), lines 79–82 (Theorem 1.1: regions (1.7)–(1.8) for `d_K` large), and lines 230–237 (§2.1.2: `−Re ζ_K'/ζ_K = −∑ Re 1/(s−ρ) + ½ log d_K + Re 1/s + Re 1/(s−1) + Re γ_K'/γ_K`, the identity of 6.4(4d)).
  - **Bennett–Martin–O'Bryant–Rechnitzer.** bennett2021 lines 56–58 (`N(T,χ)` over `0 < β < 1`, `|γ| ≤ T`) and lines 83–84 (Corollary 1.2: conductor `q > 1`, `T ≥ 5/7`, error `min{0.247 log qT + 6.894, …}`).
  - **Hasanalizade–Shen–Wong.** hasanalizade2022 lines 26–27 (`N_K(T)` over `0 < β < 1`, `|γ| ≤ T`) and lines 63–65 (Corollary 1.2, `T ≥ 1`, `0.228(log d_K + n_K log T) + 23.108 n_K + 4.520`).
  - **Trudgian.** trudgian2015 lines 16–27 (Theorems 1 and 2).
  - **Trudgian's journal data.** The README's "Math. Comp. 84 (2015), 1439–1450" is confirmed by bennett2021 lines 1149–1150 and hasanalizade2022 lines 785–786.

### Library declarations and cross-roadmap citations

- **Name check.**
  - A scratch file with `#check @` for 203 names cited in the README elaborates. The only "unknown" errors are 5 Arithmetic Dirichlet Series names in modules I had not imported: `truncatedPerronKernel_one`, `truncatedPerron_LSeries`, `norm_truncatedPerron_LSeries_sub_sum_le`, `perronFormula` and `normCoeff`. I found them in `TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/{Basic,Formula,Ideal}.lean`.
  - Four cited modules have no object file: `Conformal/Biholomorph`, `Newforms/AnalyticInvariants`, `DedekindZeta/PartialZeta` and `Chebotarev/PrimeCounting/FrobeniusPrimeCount`. I read their declarations at the pin instead: `analyticConductorAt_eq` (line 133), `finiteEulerCorrection`, `tendsto_frobeniusPrimeCount` (line 91) and `hasNaturalDensity_frobeniusPrimeSet` (line 108).
- **Opened at the pin.**
  - `exists_differentiableOn_eqOn_exp_comp` (`TauCeti/Analysis/Complex/BranchLogRoot.lean:173`): simply connected open `U`, `0 ∉ g '' U`.
  - `isOpen_image_of_differentiableOn_of_injOn` and `isSimplyConnected_image_of_differentiableOn_of_injOn` (`Conformal/ImageSimplyConnected.lean:56, 95`).
  - `heckeLFunctionC := meromorphicContinuation 1 (LSeries …)` (`TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean:74`). The continuation is a `MeromorphicNFOn` normal form on `ℂ`, or `0` (`Analysis/Meromorphic/Continuation.lean:72`), so every divisor in the headlines is taken of a meromorphic function.
  - `heckeLFunctionC_eq_primitive` (line 130): series times `eulerCorrection` on `Re s > 1`.
  - `PrimitiveRayClassCharacter` (fields `conductor`, `character`, `isPrimitive`).
  - `integralIdealsPrimeTo` (`RayClass/Modulus.lean:544`): nonzero ideals coprime to the finite part.
  - `rayClassArtinMap_idealClass` (`ClassFieldTheory/Global/AdmissibleModulus/Reciprocity.lean:216`): `K L : Type`, as 8.8 says.
  - `frobeniusPrimeCount` (`Chebotarev/PrimeCounting/VonMangoldt.lean:177`): needs `[IsGalois K L]`, supplied by `IsAbelianGalois`.
  - `AnalyticLFunctionData` and its three predicates (`Data/Basic.lean:82–197`); `HasDirichletAgreement` carries `degree_pos`.
  - Mathlib: `completedRiemannZeta_eq` (`Λ = Λ₀ − 1/s − 1/(1 − s)`), `RiemannHypothesis` (`Mathlib/NumberTheory/LSeries/RiemannZeta.lean:185`), `DirichletCharacter.completedLFunction_modOne_eq`, `PhragmenLindelof.vertical_strip` (`Mathlib/Analysis/Complex/PhragmenLindelof.lean:275`) and `Complex.digamma` (`Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean:48`).
- **"Not realized at the pin."** All 24 L-functions names the README lists as not realized at the pin are absent from Tau Ceti (grep of the pinned source), so that list is accurate.
- **Supplier citations on main.**
  - **L-functions.** I resolved 46 names: 27 in the L-functions README and 19 only in its `Suggested.lean` (for example `heckeRootNumber`, line 1653; `completedHeckeLFunction_one_sub_eventuallyEq`, line 1670; `heckeLFunction_ne_zero_of_one_le_re`, line 2680; `partialZeta_eq_lSeries`, line 931; `sum_partialZeta`, line 940).
  - **Modular Forms.** It consumes `HeckeRing.GL2.Newform.analyticConductorAt` (its README line 243), as Scope says.
  - **`citations.md` leads (13).** These are 7 L-functions Layer 6 names, resolved above, and 6 PrimeNumberTheoremAnd names. Of the latter I re-checked two at `127b50e`: `hadamard_factorization_of_order`, with `EntireOfOrderAtMost ρ f := Differentiable ℂ f ∧ ∀ ε > 0, ∃ C > 0, ‖f z‖ ≤ exp(C(1+‖z‖)^{ρ+ε})`, which agrees with `OrderLE _ A` on entire functions for `A ≥ 0` as the table says; and `kadiri_thm_3_1_q1_functional_eq`. Neither has `sorry`.
- **Consumers on main.** Their anchors resolve to this head's headings:
  - AnalyticNumberTheoryPartI R11–R18 (its README lines 3555–3562);
  - AsymptoticExpansions §§1.2–1.3;
  - SpecialFunctionsEiLiErfIncompleteGamma §§1.2–1.3;
  - SpecialFunctionsParabolicCylinder §1.3.

  AnalyticNumberTheoryPartI's contract for 6.2–6.4 matches 6.3: at most one `β`, of multiplicity one, real character, `β ≥ 1/2`. Its §0.34 (README line 19) asserts the effective uniform exclusion of Landau–Siegel zeros. This roadmap does not consume it, and correctly lists the nonexistence of exceptional zeros as not owned here. Whether §0.34 is a legitimate target is a matter for that roadmap.
- **Duplication and ownership.**
  - **At the pins.** Grep of the pinned Mathlib and Tau Ceti finds no Hadamard factorization, canonical product, branch of `log Γ`, zero-free region, zero count, Riemann–von Mangoldt formula or explicit formula. The owned objects have no owner at the pins.
  - **Open roadmaps.** This roadmap is on main, so it is earlier than every open one.
  - **`overlaps.md`.** No id this README cites is dropped, no id is defined only by an open revision, and none of this pull request's ids is dropped elsewhere. The only open-PR item is #1907 (R01). The closest-vocabulary roadmaps (ExplicitZetaBounds, ExplicitNumberFields, AnalyticNumberTheoryPartIII, ExplicitPrimeCounting) are later and must cite this one, not the reverse.
  - **Names.** The namespace `TauCetiRoadmap.ZerosOfLFunctions` is used by no other roadmap's `Suggested.lean`.

### Adversarial table

Values were computed this round:
- in pure Python: complex `log Γ` and digamma by shift plus Stirling series, `ζ` by Euler–Maclaurin, a sieve to `10⁶`, and `li` by Ramanujan's series;
- in Lean, for the `zetaEntireCompletion` probe.

The first four rows are the definitions, the next 17 the headline theorems, then the seeded targets, then R01.

| Statement | Instances tried | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `OrderLE` (0.1) | `exp(z²)` at `A = 1`; constant `1` at `A = −1`; `1/Γ` against exponential type | `exp(r²)/exp(r^{3/2})` at `r = 10`: `e^{68.4}`, unbounded. `exp(‖s‖^{A'}) ≥ 1`, so `1` qualifies. `log‖1/Γ(−n−1/2)‖ = 15.147, 364.901` at `n = 10, 100` against `n log n = 23.0, 460.5`: superlinear, not `O(n)`. | sound | none |
| `zeroCount` (4.1) | `z(z−1)`, `z/(z−1)` on `closedBall 0 2`; `f = 0`; `sin πz` on `ℝ`; `1/z` on `{0}` | `2`; `1` against signed `0`; `0` (divisor of `⊤` order is `0`); finsum junk `0` against `1` on `{0}`; `(−1).toNat = 0` | sound; the junk cases are named in the docstring | none |
| `zetaEntireCompletion` (0.2) | `s ∉ {0,1}`; `s = 0, 1`; entirety | Lean probe: `= s(s−1)Λ(s)`; `1`, `1`; `Differentiable ℂ` (exit 0). `B = ½ log 4π − γ/2 − 1 = −0.0230957 = −Λ₀(0)`. | sound | none |
| `dirichletLFunction_convexity` | `q = 1`, `t = 0, 100`; exponent at `σ = 1/2` | `‖ζ(1/2)‖ = 1.4603545`; `‖ζ(1/2+100i)‖ = 2.6926971` against `103^{1/4} = 3.1857`; `(1/2+δ)(1/2+δ)/(1+2δ) = 1/4 + δ/2` | sound | none |
| `hadamard_of_orderLE_one` | `f = 1 − s`; `f = cos`; `f = s` (excluded) | `e^{−0.5}E₁(0.5) = 0.5`; `∏_{k<2·10⁵}(1 − 1/((k+½)²π²)) = 0.5403026` against `cos 1 = 0.5403023` (`a = b = 0`); `f 0 = 0` violates `h0`, and `m_0 = 0` makes the factor at `ρ = 0` equal to `1` | sound | none |
| `zetaEntireCompletion_hadamard` | `B` from `Λ₀(0)` | `B = −0.0230957`; `∑ Re 1/ρ = 0.0230957` | sound | none |
| `riemannZeta_zeros_summable_ordinate` | first zeros; trivial zero `−2` | first pair `0.0099606`, ten pairs `0.0270163`; `ord Λ(−2) = 0`, so trivial zeros add nothing (over `riemannZeta` each would add `1`) | sound | none |
| `heckeLFunction_zeroFreeRegion` | `n = 0`; `K = ℚ(i)`, `ψ = 1`; trivial character at `1`; nesting constant | `n = 0` vacuous (`finrank_pos`); first zero `1/2 + 6.0209i` is outside the region iff `c < 2.8927`; `ord = −1` at `1`, so the pole is not a zero; `1 + log(4/3)/log 3 = 1.26186 < 1.27` | sound | none |
| `riemannZeta_zeroFreeRegion` | trivial zero `−2`; zero `1/2 + 14.1347i` | `−2` excluded iff `c < 3 log 3 = 3.2958`; `1/2 + 14.13i` excluded iff `c < 1.4206` | sound (`∃ c`) | none |
| `dirichletLFunction_zeroFreeRegion` | `q = 2` principal (zeros at `0`, `2πik/log 2`); cap | region edge at `s = 0`: `1 − (log 3/2)/log 6 = 0.6934 > 0`; `c/log(q(|t|+3)) ≤ 1/2`, so the induced zeros on `Re s = 0` are outside | sound | none |
| `neg_re_logDeriv_riemannZeta_le` | `t = 14.1347`, `δ = 0.05, 0.2`; `t → 0` | `−Re ζ'/ζ(1.05 + it) = −1.44488` against `−1.81818 + 2.64863·C` (`C ≥ 0.141`); at `2t`: `0.52334`; `δ = 0.2`: `−1.06379`, `0.46762`; `4t·LHS = 0.97706, 0.99768` at `t = 0.01, 0.001`, so the threshold `t₀ > 1` is needed | sound | none |
| `riemannVonMangoldt` | `T = 14, 100` | `N(14) = 0` against `−0.4430`; `N(100) = 29` against `28.1273` | sound | none |
| `riemannVonMangoldt_heckeLFunction` | `K = ℚ(i)`, `ψ = 1`, `T = 10` | open-strip count `2` (`±6.0209` of `L(χ₋₄)`) against main `1.0049`, scale `log 400 = 5.99` | sound | none |
| `riemannVonMangoldt_dirichlet` | `q = 4`, `T = 10`; `q = 1`, `T = 100` | `2` against `2.7088`; `58` against `2·28.1273 = 56.2547` (twice `riemannVonMangoldt`) | sound | none |
| `chebyshevPsi_explicitFormula` | `x = 100`, `T = 50` (10 zero pairs); sign of `log 2π` | `ψ(100) = 94.0453` against `95.0403` (error `−0.995`) and bound scale `x log²x/T = 42.415`; with `+log 2π` the formula gives `98.716` | sound | none |
| `riemannZeta_weilExplicitFormula` | reflection; constant term; signed divisor | `mellin(φ(1/y)/y)(s) = φ̃(1−s)` by `y = 1/u`; `−(log π/2)(φ(1) + φ̌(1)) = −(log π)φ(1)`; signed zero side subtracts `φ̃(0) + φ̃(1)`; prime side has finite support | sound | none |
| `primeIdealCount_effective` | `K = ℚ(i)`, `x = 10⁶` | `2·39175 + 1 + 87 = 78438` against `Li = 78626.504`; `x e^{−√log x} = 24308.7` | sound | none |
| `rayClassPrimeCount_effective` | `n = 0`; `K = ℚ(√−5)`, `𝔪 = 1`, `x = 10⁶` | vacuous; principal `39114`, non-principal `39253` against `Li/2 = 39313.252` | sound | none |
| `primeCounting_progression_effective` | `q = 8`, `x = 10⁶` | `19552, 19653, 19623, 19669` against `19656.626` | sound | none |
| `frobeniusPrimeCount_effective_abelian` | `ℚ(i)/ℚ`, both classes | `C = {1}`: `39175`; `C = {σ}`: `39322`; against `39313.252` | sound | none |
| 1.3 | `σ = −1, 1/2, 2`; `t = 10, 100, 1000` | `σ = −1`: `−0.004975, −5·10⁻⁵, 0.000000`; `σ = 2`: `+0.004975, +5·10⁻⁵, 0.000000`; `σ = 1/2`: `0` (an `O(1/t²)` error, inside the stated `O(1/|t|)`) | sound | none |
| 1.4 | `|z| = 100` at arg `0, π/2, 3π/4`; `s = 2+3i`; `Gammaℂ` at `1` | `|z|·|ψ − log z| = 0.5008, 0.5000, 0.4994`; `logDeriv Gammaℝ` numeric `−0.350016 + 0.618858i` = formula; `Gammaℂ` `−0.629896 + 1.104130i` = formula; `−2.415093` against the `log π` variant `−1.721946` | sound | none |
| 1.4a | `s = 2`; `s = −2`; `ψ(±i)` | `−0.5699610 + 1.9850537 = 1.4150927 = γ + log 2π − 1`; junk case `−0.1648227` against `0.5541200`; `Im ψ(i) = 2.0766740 = ½ + (π/2)coth π`, `ψ(−i) = 0.0946503 − 2.0766740i` | sound | none |
| 1.5 | `gammaR = {0}`, `σ = 1/2, 2`; `gammaR = {0,1}` | differences `0.80636, 0.80605, 0.80604` and `−0.57236` (bounded); `log‖γ‖ + πt/2 → 0.6931` with `A(1/2) = 0` | sound | none |
| 2.3 | weight 12, analytic centre `1/2`; the opposite sign | `(6+3)(7+3) = 90`; with `μ_an = μ_ar − w/2`: `(5+3)(4+3) = 56` | sound | none |
| 2.4 | `Δ` at `s = 1/2` | `90 = analyticConductorAt f 6`; same-point value `3.5·4.5 = 15.75` | sound | none |
| 3.3 | `δ = 1/2`, `t = 10, 100, 1000` | `log‖γ(1−s)/γ(s)‖ − (n/2)(1+2δ) log t`: `Gammaℝ`: `−1.83663, −1.83786, −1.83788` (→ `−log 2π`); `Gammaℂ`: `−3.67326, −3.67573, −3.67575` | sound | none |
| 4.3 Checks | the README's four instances | `2`; `3.3219`; `2.3219`; `1.7095` | sound | none |
| 4.6 Checks | `z²(z−3)` | `1.3863 < 1.6740`; `3 log(5/3) = 1.5325` on both sides | sound | none |
| 5.1 | `f = 1/Γ(s+1)`, `r = 10`, `R = 20` | `n(10) = 10`; `log M(20) = 59.58`, Jensen bound `85.96`; `r^{1.1} = 12.59` | sound | none |
| 5.2 | `z = −1/2, 0.1, 1` | `E₁(−½) − 1 = −0.090204` (`≤ 0.125`); `E₁(0.1) = 0.9946538` against `1 − z²/2 = 0.995`; `E₁'(1) = −2.7182818` | sound | none |
| 5.6 | `χ₋₄` | `Λ(0) = 0.5`, `Λ(1) = 0.5`, so `ε = 1` | sound | none |
| 6.1 | `θ = π, 2π/3`; `‖z‖ = 1/2`; `(3)∞` presentation | `0`, `0.5`; `1.25 = (1−r)(3−r)`; `−ζ'/ζ(2) = 0.5699610` against `−L₁'/L₁(2) = 0.4326345` (gap `log 3/8 = 0.1373265`); (4b) `(log 2)/3 = 0.2310491` | sound | none |
| 7.2 | `[−1,1]²`; `z`, `z − 2`, `1/z` | normalized integrals `1.0000000`, `−1.2·10⁻¹⁰`, `−1.0000000`; the pinned hypotheses match | sound | none |
| 7.3 | `S(T)`, `T = 0.5, 0.1, 0.02`; `f = z` | `−0.64188, −0.91534, −0.98291` (→ `−1`); `θ(0) = −2.3561945 = −3π/4`, `θ(4)/(2π) = 0.625` | sound | none |
| 7.5 | the `conductor-4` record | extra zeros at `Re s = 2.18953, −1.18953` (sum `1`) | sound | none |
| 8.3 | `ℚ(i)` at `x = 2`; `c_ℚ` | trivial-zero terms `0.6931472 = log 2`; `c_ℚ = −1.8378771` | sound | none |
| 8.5 | `ℚ(i)`; absorption | `78438` against `78626.504`; `x^β/(x e^{−c√log x}) = e^{(β−1)log x + c√log x} → 0` | sound | none |
| 8.6 | quartic `χ` mod 5, `φ` on `(0.4, 0.6)` | `φ̌` term `−0.3465736i`, and `χ` on both terms `+0.3465736i`; trivial-zero orders `#{a_j ≡ m}` + `r₂` | sound | none |
| 8.7 Checks | thresholds; `(3)∞`; `ℚ(√−5)` | `log x = 0.6958, 2.4958, 190.8684`; `rayClassIdealMainTerm = 1/3` (from `ρ_K·(1 − 1/3)/#Cl_𝔪`, `TauCeti/NumberTheory/LFunctions/DedekindZeta/PartialZeta.lean` line 44); class split above | sound | none |
| 8.9 Checks | `x = 10, 10⁴` | `Li 10 = 5.1204357`; `∫₂¹⁰ dt/log²t = 3.6628810`; `Li − x/log x = 159.3558` against `117.8823` | sound | none |
| R01 | description against README; #1907 at `123254c` | three differing statements, re-read at that head | order unstated | R01 |

### Remarks outside the folder (no change asked of the folder)

- **The board's `sources.toml`.**
  - It records `trudgian2015` with venue "Math. Comp., 2015 vol. 84, no. 294, pp. 2047-2058". The published data are no. 293, 1439–1450 (bennett2021 lines 1149–1150), as the README has them.
  - It has no entry for Titchmarsh, Iwaniec–Kowalski or Lagarias–Odlyzko 1977, which the README cites by locator.

## Not verifiable

- **Iwaniec–Kowalski, *Analytic Number Theory*, §§5.1–5.2** (3.3 and the conductor convention). This is AMS, paywalled; it is not in the manifest or the sources cache. The exponents were recomputed instead (table, 3.3).
- **Titchmarsh, *The Theory of the Riemann Zeta-Function*, §5.1, §§9.2–9.4, Theorem 9.4, p. 214** (3.3, 4.5, 7.3, 7.4, 7.6). This is OUP, paywalled; it is not in the manifest. `N(100) = 29` and `S(T) → −1` were recomputed instead.
- **Davenport, *Multiplicative Number Theory*, §§11–20** (8.5, 8.6, sampled). Settled as uncertified and cited by locator; not read. The chapter titles agree with the manifest's record of the DOI's chapters.
- **Lagarias–Montgomery–Odlyzko 1979, Lemma 2.3** (6.4). Settled as uncertified; only its report in kadiri2012 lines 65–73 was read.
- **Lang, *Algebraic Number Theory*, XVII §3, Theorem 3.1** (8.4). Settled as uncertified. The normalization was recomputed instead.
- **Lagarias–Odlyzko 1977, Theorems 1.3 and 9.2** (the remark in 8.8). Paywalled (Academic Press) and not in the manifest; it is cited for a statement this roadmap does not own.
- **DLMF 5.5.3 and 5.6.6** (0.1, 1.3a, 1.6; not sampled). The cached DLMF text is §5.11 only. The values used (reflection, `‖Γ(1/2+it)‖² = π/cosh πt`) were recomputed.

## Source issues

- **Misprint** in kadiri2012 at §1, display (1.6), p. 2 (arXiv v1): the source says Lagarias–Montgomery–Odlyzko show `L(s, χ)` has no zeros in region (1.6), which near the real axis lies inside (1.5), where one zero is allowed; it should be no zeros in (1.6) apart from the possible real zero of (1.5); affects nothing.
