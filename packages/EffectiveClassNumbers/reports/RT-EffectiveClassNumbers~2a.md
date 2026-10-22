<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/133#issuecomment-6332981616 -->
Red team round 2 pass a (codex) of 0f9bd9b

Verdict: needs_changes

1. **F01** (P1) The new growth adapter cites nonexistent Mathlib Gamma estimates

   **Location:** `packages/EffectiveClassNumbers/README.md:650`: “Mathlib Phragmén–Lindelöf and Gamma Stirling estimates.”

   **Claim:** Pinned Mathlib supplies the complex Gamma estimates used to obtain finite Rankin–Selberg polynomial growth and §3.1's exponential decay.

   **Witness:** `Mathlib/Analysis/SpecialFunctions/Stirling.lean:246` is factorial Stirling; the Gamma directory supplies no complex strip estimate. `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:559`, §0.23a, supplies the slit-plane log-Gamma remainder and sector bounds.

   **Exact repair text:** “Consume AnalyticNumberTheoryPartI §0.23a, `gammaRemainder.slit_logGamma` and `gammaRemainder.stieltjes_integral`. Derive uniform Gamma modulus and balanced-quotient bounds on each fixed vertical strip, shifting across nonpositive real parts with the Gamma recurrence. Use these bounds in `rankinSelberg_selfPair_polynomialGrowth` and `liouvilleProduct_C4`.” Add this supplier contract and replace the unsupported Mathlib citation; do not use the later §5.2 as an earlier prerequisite.

2. **F02** (P1) Point counts use an arbitrary integral model instead of its minimal reduction

   **Location:** `packages/EffectiveClassNumbers/README.md:520`: “for an explicit integral Weierstrass curve E … a_p = p + 1 − #E(𝔽_p) at good p”.

   **Claim:** These formulas compute the intrinsic L-function coefficients from the displayed integral equation without a minimality hypothesis.

   **Witness:** Scale `curve37` by x′=49x,y′=343y to coefficients (0,49,343,−7203,117649). Modulo 7 this gives y²=x³, eight projective points and trace 0; `curve37` has nine points and trace −1. Both define the same rational elliptic curve.

   **Exact repair text:** “Use the minimal model at p when forming the reduction and its point count. Consume EllipticCurveModularity R29.4, ‘The bad factors and all Dirichlet coefficients’: `IsNewformOf.localPolynomial_eq`, `localPolynomial_completion_eq_padic` and `IsNewformOf.coeff_eq`, with good/bad recurrences and multiplicativity. Specialize these to §§2.1–2.3 after proving the displayed models minimal at the primes being counted.” Delete the general owned `LFunction_coeff_eq` target and replace its Needs references by this supplier contract. The entire general interface already belongs to that supplier (`TauCetiRoadmap/EllipticCurveModularity/README.md:1364`–1441); `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:44` explicitly takes `W.minimal R`. Add the scaled equation as a negative-control Check.

3. **F03** (P1) The easy twisted central-value milestone is still absent

   **Location:** `packages/EffectiveClassNumbers/Suggested.lean:517`: “The accompanying README target `curve5077_twist7_central_bounds` …”

   **Claim:** The numerical input for the height-gap argument remains only a docstring reference, although the other two §2.7 inputs have signatures.

   **Witness:** `WeierstrassCurve.quadraticTwistOf` is imported at line 5 and used at line 449. Trace 1 and norm 2 give discriminant −7. The same entire-function/right-half-plane binders as lines 519–527 state this interval directly.

   **Exact repair text:** Add, in §2.7's Lean block:

   ```lean
   /-- §2.7: the entire L-function of the -7 twist has central value in (4,5). -/
   theorem curve5077_twist7_central_bounds (L : ℂ → ℂ)
       (hentire : Differentiable ℂ L)
       (hseries : ∀ s : ℂ, 3 / 2 < s.re →
         L s = (curve5077.quadraticTwistOf 1 2).LSeries s) :
       (4 : ℝ) < (L 1).re ∧ (L 1).re < 5 := by
     sorry
   ```

4. **F04** (P3) The pull-request diff changes a file outside the package

   **Location:** `merge-order/ORDER.txt:132`: “EffectiveClassNumbers”.

   **Claim:** The reviewed pull-request diff is confined to `packages/EffectiveClassNumbers/`.

   **Witness:** `git diff --stat origin/main...HEAD` lists `merge-order/ORDER.txt | 1 +`, in addition to seven package files. `CONTRIBUTING.md` requires a roadmap pull request to touch only its own directory.

   **Exact repair text:** “Exclude the `merge-order/ORDER.txt` insertion from the package pull request; retain the accepted supplier ordering in the board's separate intake-managed change.” The reviewer must not edit this file. The existing order is used unchanged for this audit's dependency check.

5. **F05** (P3) The inverse Mellin Checks cannot detect the factorial normalization

   **Location:** `packages/EffectiveClassNumbers/README.md:310`: “I_(0,2)(1/2) = log 2”; `packages/EffectiveClassNumbers/Suggested.lean:251`–265.

   **Claim:** The Checks discriminate the normalization of `inverseMellinKernel`, including its denominator `(m−1)!`.

   **Witness:** Delete the factorial denominator: every listed numerical Check and both Lean examples still pass. All nonzero tested values have m=2, so the denominator is 1; the sole m=3 test evaluates to zero.

   **Exact repair text:** Add the Check “I_(0,3)(1/2) = (log 2)²/2 > 0; omitting the factorial doubles this value.” Add the corresponding equality and positivity as conjuncts of an existing proved example, preserving the two-example limit. The existing mathematical definition and Mellin-transform target are unchanged.

6. **F06** (P3) The stated reason for excluding conductor one is false

   **Location:** `packages/EffectiveClassNumbers/README.md:97`: “Its case k = 1 is excluded by D < 0.”

   **Claim:** Negativity excludes k=1 in the construction with D=−k.

   **Witness:** For k=1, D=−1<0. It is the fundamental-discriminant hypothesis that fails: −1≡3 mod 4. The separate trivial fundamental discriminant D=1 corresponds to neither a negative field discriminant nor D=−1.

   **Exact repair text:** “Here k=1 is excluded because −1 is not a fundamental discriminant. The separate trivial fundamental discriminant D=1 is excluded by D<0.”

7. **F07** (P2) The enumeration proof invokes a nonexistent converse

   **Location:** `packages/EffectiveClassNumbers/README.md:949`: “each listed d is a field discriminant by `isFundamentalDiscriminant_discr` in the converse direction”.

   **Claim:** The named theorem constructs a quadratic field from a fundamental discriminant.

   **Witness:** `packages/EffectiveClassNumbers/Suggested.lean:59` takes an already existing degree-two number field and concludes properties of its discriminant. It has no converse or existence conclusion. ImaginaryQuadraticClassNumber H1.1–H1.2 own the model construction and discriminant transport.

   **Exact repair text:** “For each listed d, use ImaginaryQuadraticClassNumber H1.1 to construct ℚ(√−d), and H1.2's integral-basis/discriminant transport to compute its discriminant as −d; these d are squarefree and −d≡1 mod 4.” Replace the converse dependency with H1.1–H1.2. Retain `isFundamentalDiscriminant_discr` only for filtering discriminants of an already given K.

8. **F08** (P2) The newly owned parity theory already has an earlier owner

   **Location:** `packages/EffectiveClassNumbers/README.md:447`: “Use the nonvanishing analytic gamma/conductor factor at 1 to read parity from reflection”.

   **Claim:** The general root-number/analytic-order parity argument is new theory owned by this package.

   **Witness:** `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:2958`, AL.5 `central-sign-vanishing`, already states parity of the first nonzero Taylor term and transport of that order to the finite L-function through a nonzero Gamma factor.

   **Exact repair text:** “Consume AutomorphicLFunctionsAndLocalFactors AL.5, ‘The functional-equation sign at the centre’ (`central-sign-vanishing`). `analyticRank_parity` is its elliptic motivic-normalization adapter: translate the centre from 1/2 to 1, supply R29.6's continuation/reflection, and prove nonidentity to zero from a₁=1.” Add this supplier to the exact contracts and Needs; do not re-plan the general parity proof.

9. **F09** (P2) The local Frobenius transport omits the compensating dual

   **Location:** `packages/EffectiveClassNumbers/README.md:449`: “invert the homological arithmetic-Frobenius operator in the comparison”.

   **Claim:** The instruction to invert homological arithmetic Frobenius specifies the transport to the cohomological local determinant. It does not state the duality needed to preserve the asserted good polynomial X²−a_pX+p.

   **Witness:** At 5, `curve37` has homological arithmetic polynomial X²+5; inversion gives X²+1/5. `TauCetiRoadmap/EllipticCurveModularity/README.md:128` requires dual cohomology/geometric Frobenius, or homological arithmetic Frobenius on coinvariants.

   **Exact repair text:** “Let V_p=H¹_et(Ē,ℚ_ℓ), the dual of T_ℓ(E)⊗ℚ_ℓ, and use geometric Frobenius. If A is homological arithmetic Frobenius, the cohomological geometric operator is (A⁻¹)^(−transpose)=A^transpose. Transport monodromy and inertia through this duality. Its invariant/ker-N determinant agrees with the homological arithmetic determinant on inertia coinvariants, as fixed by EllipticCurveModularity R29.4.” Add a Check at the good trace-zero prime 5 giving `1+5T²`, and the split-multiplicative Check giving `1−T`; inversion alone gives `1+T²/5` in the first case. Use this convention also in §3.1.

## Verification of the earlier findings

A-Fnn refers to pass r1a; B-Fnn to pass r1b. Rnn refers to the merged repair report. The following are checks against this head, not acceptance of the repair report's assertions. Locations abbreviated `README` and `Lean` in this table mean `packages/EffectiveClassNumbers/README.md` and `packages/EffectiveClassNumbers/Suggested.lean`.

| Earlier finding / repair | Status | Repaired passage at this head | Verification witness |
|---|---|---|---|
| A-F01 / R01 | Repaired | README:688, “(1+262X²+19321X⁴)⁻¹” | Expansion has no odd powers. At s=1, B=19321/19584 and B′/B=11 log(139)/408, recalculated independently. |
| A-F02 / R02 | Repaired | Lean:5, `import TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist.Basic` | All seven individual Tau Ceti imports exist at the manifest pin; both formerly missing imports now end in `.Basic`. |
| A-F03 / R03 | Repaired | README:93, “H2.1 supplies χ_D, its complex/real casts and the splitting dictionary, including 2” | ImaginaryQuadraticClassNumber H2.1 and pinned `FundamentalDiscriminant/Character.lean:34` supply this object. S06 concerns the added conductor-one explanation. |
| A-F04 / R04 | Repaired | README:147, “no second imaginary radicand classification is constructed here” | README:3 identifies the extension as Part II; H1.1–H1.3 own presentation and counting. The real-radicand extension has separate hypotheses. |
| A-F05 / R05 | Repaired | README:52, “the Néron–Tate height for 2(O)” | Lean:548 concludes `(1/2 : ℝ) ≤ P.canonicalHeight`; BGZ85 line 127 and the pinned full x-height agree. |
| A-F06 / R06 | Repaired | README:298, “Supply an entire F … agreeing … on Re s > 3/2” | Lean:325–330 separately quantifies F and its agreement/reflection/decay. The example at Lean:224 still detects the totalized product's zero at 0. |
| A-F07 / R07 | Repaired | README:546, “Prove `grossZagier_heegnerTrace`” | The formerly nonexistent suppliers have been replaced by owned targets at §§2.3/2.8 with GZ86 hypotheses. New ownership/convention defects are S08/S09. |
| A-F08 / R08 | Repaired | README:115, “Siegel's lower bound … with an ineffective constant” | Actual ANT §0.9 and ImaginaryQuadraticClassNumber H2.2/H2.4 match; former §§2.15/2.18 attributions removed. |
| A-F09 / R09 | Partly repaired | README:650, “Prove `rankinSelberg_selfPair_polynomialGrowth`” | The finite-versus-completed gap is now a named target and the AL.3 anchors exist. Its claimed Gamma supplier is still absent: S01. |
| A-F10 / R10 | Repaired | README:640, “A good prime with a_p=0 instead has factor `(1+pX²)⁻²`” | `curve37` has six points over 𝔽₅, hence a₅=0; multiplying its two Euler factors gives `(1+5X²)⁻²`, not 1. |
| A-F11 / R11 | Repaired | README:642, “including wild p=2,3, the same inertia/monodromy determinant is required” | Potentially good and potentially multiplicative cases are included; multiplicative R_p=1−p^(1−2s) and quadratic-good twists match the determinant calculation. S09 corrects the representation convention. |
| A-F12 / R12 | Repaired | README:222, “the partial zeta function of the inverse ideal class [I_q]⁻¹” | The ideal map is α↦(α)I_q⁻¹; norm a and w(D) are included. IntegralLattices B2 is now used only for its arithmetic dictionary. |
| A-F13 / R13 | Repaired | README:528, “The third-derivative bounds are in §§2.12–2.13” | Lean:557/564 exact vanishing precedes :571/:585 third derivatives. Each numerical input has its own Needs. |
| A-F14 / R14 | Repaired | README:489, “every integer K ≥ 0” | Integrated Taylor remainder gives the first-omitted bound without decreasing initial terms; the false x=5 counterexample is removed. |
| A-F15 / R15 | Repaired | Lean:519, `theorem curve5077_deriv_small`; :525, `theorem curve37_central_bounds` | Both explicitly bind an entire L and right-half-plane agreement. S03 identifies a different omitted numerical milestone. |
| A-F16 / R16 | Repaired | README:557, “its trace P_K equals the image of an actual rational point” | Actual descent and c>5·10⁻¹² are named inputs. Counts over 𝔽₉ and 𝔽₂₅ are 7 and 20; their prime-to-residue-character torsion constraints kill all torsion. |
| A-F17 / R17 | Repaired | README:199, “for every imaginary quadratic K” | Lean:161 requires only negative discriminant; :170 explicitly supplies d=3,4 boundary fields with split primes 7,5. |
| A-F18 / R02 | Repaired, conditional on declared gap | Lean:84, `theorem reducedForm_four_mul_c_sq_ge` | The pinned reduced-form carrier is used; :92 gives counts. H1.3 primitivity is correctly owned by the declared gap, not re-raised. |
| A-F19 / R18 | Repaired for its listed defects | Lean:139, `ramifiedWeight 15 = 1 / 4 ∧ ramifiedWeight 84 = 1 / 12` | The requested discriminating values, class-three examples, instance docstrings and two-example bundling are present. S05 detects a further normalization hole. |
| A-F20 / R19 | Repaired | README:292, “§3.5, Theorem 2, p. 318” | O85 line 355 is Theorem 2; C1–C4 remain on p.314 at O85 line 212. |
| A-F21 / R20 | Repaired | `sources.toml:1`, `schema = "tauceti-roadmap-sources/v1"` | Eleven unique works are recorded; ten have readable legal cached text. O88 is settled locator-only, not silently certified. |
| A-F22 / R21 | Repaired | README:538, “additive quotient 𝓞_K/𝔑 ≃ ℤ/N” | N=27,D=−3 is rejected by ℤ/9×ℤ/3; GZ86 line 479 gives the cyclic-quotient condition. The formula separately requires odd D prime to N. |
| A-F23 / R22 | Repaired | README:548, “without a vanishing hypothesis” | Both product-rule summands are present; the E₅₀₇₇ and conductor-37 applications explicitly cancel different summands using their root-number vanishings. |
| A-F24 / R23 | Repaired | README:524, “Use B = 400” | The stated tail is approximately 5.89143·10⁻¹⁶; the old B=250 gives 5.22620·10⁻¹⁰. New budget leaves room below 10⁻¹². |
| B-F01 / R07 | Repaired | README:447, “Prove `analyticRank_parity`” | No RankZeroOneBSD supplier remains. The elliptic parity signature has explicit inputs; its earlier general owner is S08. |
| B-F02 / R07,R21 | Repaired | README:546, “an odd negative fundamental D prime to N, every p\|N split in K” | These match GZ86 line 159; the general construction separately requires cyclic quotient at README:538. |
| B-F03 / R03 | Repaired | README:93, “H2.1 supplies χ_D” | The actual H2.1 contract and pinned character replace the unrelated GlobalNumberFields Layer 10. |
| B-F04 / R04 | Repaired | README:93, “H1.3 supplies … the primitive-form correspondence and unweighted reduced-form count” | No duplicate imaginary-field classification or class-number comparison remains. The pin owns the radicand discriminant formula. |
| B-F05 / R08 | Repaired | README:93, “H2.2 supplies ζ_K = ζL … H2.4 supplies `quadratic_LFunction_siegel`” | These sections contain the advertised hypotheses; ANT §§2.15/2.18 are no longer named for them. |
| B-F06 / R09 | Partly repaired | README:120, “completed-function strip bounds exclude fixed neighbourhoods of poles” | AL.3 `automorphic-l-data` really does cover poles away from fixed neighbourhoods; only `IsNicePinned` excludes the self-pair. The replacement adapter retains S01. |
| B-F07 / R05 | Repaired | README:52, “full x-coordinate height” | Pinned `CanonicalHeight/Basic.lean:119` and EffectiveDiophantineMethods §§3.12–3.15 match. Lean gap is 1/2. |
| B-F08 / R02 | Repaired, conditional on declared gap | README:62, “Reduced forms and the full canonical height are present at these pins” | Both hashes equal `lake-manifest.json`; reduced-form signatures/examples now use the pinned carrier. The declared primitivity gap is precise and minimal. |
| B-F09 / R24 | Repaired | README:105, “ModularCurves, Layer 10” | The referenced layer exists. Its prime-level restriction is used for X₀(37); README:538 sends the general-conductor construction to R29.5. |
| B-F10 / R08 | Repaired | README:795, “Tau Ceti's qualitative prime number theorem” | Pinned `Prime/PrimeIdealTheorem.lean:46` supplies it, specialized to ℚ. No conditional Rosser–Schoenfeld bound is used. |
| B-F11 / R13 | Repaired | README:600, “Third derivative after vanishing” | Both third-derivative sections follow their first-derivative zero inputs; no former Layer 2 cycle remains. |
| B-F12 / R25 | Repaired | README:769, “961.7” | Direct evaluation gives 165/(3−2√2)=961.690475583…; both occurrences use the repaired rounding. |
| B-F13 / R18 | Repaired for its listed defects | Lean:808, `IsInertPrime 43 1333963 ∧ IsInertPrime 47 1333963` | All eleven kept definitions have at most two examples; majorant and κ checks are bundled. S05 is a different missing discrimination. |
| B-F14 / R26 | Repaired | README:939, “log p ≤ 165” | The strict-C55 target is gone; exp(165)<10⁷² is already enough to meet the Montgomery–Weinberger upper bound. |
| B-F15 / R20 | Repaired | README:979, LLS70 AMS article link | `sources.toml` records the legal AMS extraction; LLS70 line 527 is Table III. No OEIS copy is consumed. |

R02's “not actionable in this package” decision is accepted for the primitivity adapter: `design/plan.json` and README:95 contain the same gap slug, supplier H1.3 and precise fundamental-discriminant hypothesis. No finding re-raises that settled obligation. Repairs introduced S08/S09; S01 is the remaining input gap in the replacement growth argument.

## Verified sound

Read all 984 README lines and all 865 Lean lines. Inventoried **103 Lean declarations** (66 theorems, 11 definitions, two instances, 24 proved examples), **69 bold target blocks**, and **174 Check bullets**. All 174 Checks were inspected mathematically; small arithmetic and reduced-form counts were recomputed where feasible, while the large certificates listed below were not rerun. The declaration/context inventory follows. Every kept definition has at least three README Check bullets and at most two Lean examples; S05 identifies a remaining failure of discrimination.

Verified **33 source-locator groups**, using rendered cached PDF pages to resolve incomplete OCR formulas, as detailed below. Checked **ten named roadmap supplier contracts**, the two pinned-library supplier tables, and ownership search results in all **seven specified sibling heads**. No new overlap with those seven was found. The factorial Stirling target in ErdosProgressionPowers §4.4 does not supply the complex Gamma bounds needed here.

The written Lean signatures retain explicit field, number-field, degree, sign, analytic-continuation, local-reduction and integrability binders. No standing `variable` or `include` block silently supplies assumptions. The numerical statements use entire functions with right-half-plane agreement. No sorry-valued data, `set_option`, `lemma` declaration, `True` placeholder, additional Mathlib submodule import, or roadmap import was found. All seven Tau Ceti imports exist at the stated pin. The prescribed module namespace and six layer sections are present. The report does not certify elaboration: no Lean process was run.

The declared primitivity gap agrees exactly between the README and `design/plan.json`; the supplier and hypotheses are precise, and the pinned reduced-form carrier includes imprimitive forms for nonfundamental discriminants. It is not an unowned prerequisite. There is no dependency reallocation to a later roadmap in this report. S01 and S08 repoint to earlier owners; S02 consumes an existing earlier interface.

The dependency command was run read-only against the unchanged README and merge order. It exited successfully with exactly:

```text
depcheck: 8 roadmaps, 52 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. Manual checking was still necessary for the supplier-content defects S01/S02/S08 and the local comparison S09. `git rev-parse --short HEAD` returned `0f9bd9b`; the pull-request diff lists eight files and 2291 inserted lines, including the outside-folder order insertion reported as S04.

### Source-locator audit

“Verified” means that the locator and relevant claim were checked in the legal cached text or its rendered source page. The extraction line locates the corresponding passage in both cases. The table has 33 verified locator groups. Ambiguous OCR formulas were checked against rendered pages of the cached legal PDFs. Multiple roadmap targets sharing a locator are counted once.

| Source / locator group | Evidence in cached extraction | Result |
|---|---|---|
| O85 Introduction, pp.309–310; Theorem1 | O85 line 88; O85 line 91; O85 line 94 | Verified: scope, weight and genus consequence |
| O85 §1.1, p.311 | O85 line 105 | Verified: discriminant conventions and negative-field setting |
| O85 §1.2, p.311 | O85 line 118 | Verified: reduced forms and partial-zeta/unit correspondence |
| O85 §1.3, p.312 | O85 line 129 | Verified: reduced inequalities and integrated count statement |
| O85 §1.4(a),(b), p.312 | O85 line 152 | Verified: small split-prime obstruction and short coefficient sum |
| O85 §§2.1–2.2, p.313 | O85 line 176 | Verified: elliptic sign and coprime quadratic twisting conventions |
| O85 §2.3, pp.313–314 | O85 line 191 | Verified: symmetric-square/Liouville factorization at the readable local factors |
| O85 C1–C4, p.314 | O85 line 212 | Verified: square support, local ratio bounds, entire continuation and strip conditions |
| O85 §§3.1–3.2, pp.314–315 | O85 line 228; O85 line 243 | Verified against printed p.315: residue constants match the expanded derivative formula |
| O85 §3.3, pp.315–316 | O85 line 256; O85 line 289 | Verified: Mellin kernels, integrated comparison and boundary atom |
| O85 §3.4, Proposition1, pp.316–318 | O85 line 319; O85 line 330 | Verified against printed pp.317–318: M/96, (2π⁴/3)M^(3/2), and 4π²e M^(3/2) max(2,log(4M)) |
| O85 §§3.5–3.6, pp.318–319 | O85 line 338; O85 line 355; O85 line 364 | Verified: h=4 exception, Theorem2 location, fixed-data dependence and effectivity argument |
| O85 §4.1, pp.319–320 | O85 line 376 | Verified against printed p.320: c1=2π times the prime product times the absolute-wedge integral; c5=πN^(3/2)/12 |
| O85 §§4.2–4.3, pp.320–321 | O85 line 398; O85 line 403; O85 line 424 | Verified: ramified cases and sign split; the source's unsquared replacement is deliberately corrected by C1 |
| O85 §5.1, p.321 | O85 line 444 | Verified: 7000 and coprime5077 constant55 |
| GZ86 I §§3–5, pp.227–229 | GZ86 line 159; GZ86 line 203; GZ86 line 250 | Verified: odd fundamental/coprime/split setting, relative heights and analytic L-function framework |
| GZ86 I (6.3)–(6.5), p.230 | GZ86 line 258; GZ86 line 278; GZ86 line 283 | Verified against printed p.230: numerator 8π²(f,f), denominator h u²√|D|, relative heights and period identity |
| GZ86 I §7, (7.4), p.231 | GZ86 line 329 | Verified: source model and rank-three conclusion; not a certificate for the new decimal interval |
| GZ86 I §8, (8.1)–(8.2), p.232 | GZ86 line 340; GZ86 line 345; GZ86 line 356 | Verified: effective logarithmic bound, coprime55 and largest class-three discriminant907 |
| GZ86 II §1, pp.234–236 | GZ86 line 473; GZ86 line 479; GZ86 line 490 | Verified: cyclic quotient, CM pair description, Galois/Atkin–Lehner action; arithmetic-Artin conversion must be explicit |
| GZ83 Corollary6 and proof, p.87 | GZ83 line 98 | Verified: eta quotient of exponent2, divisor and conductor-37 CM argument |
| BGZ85 equation(2), §2, pp.473–476 | BGZ85 line 52; BGZ85 line 139 | Verified: model, three rational points and arithmetic rank data |
| BGZ85 height bound, p.476 | BGZ85 line 55; BGZ85 line 127 | Verified: full-height normalization and nonzero-point lower bound |
| BGZ85 §4, (10)–(14), pp.478–479 | BGZ85 line 216; BGZ85 line 234; BGZ85 line 257 | Verified: central derivative/kernel normalization and series; new remainder bound independently derived |
| BGZ85 Table2, p.480 | BGZ85 line 278; BGZ85 line 286 | Verified: approximate third-derivative value and initial terms, without treating decimals as rational certificates |
| MW74 Theorem and exclusion ranges, pp.530,538–539 | MW74 line 70; MW74 line 329; MW74 line 333 | Verified: class-three exclusion and exceptional windows |
| MW74 TableI, p.537 | MW74 line 270; MW74 line 275; MW74 line 277; MW74 line 285 | Verified: three zero approximations and reported precision; endpoint sign proofs remain targets |
| MW74 §5, (8), pp.539–540 | MW74 line 348; MW74 line 361 | Verified against printed p.539: two incomplete-Gamma series, parity a=(1−χ(−1))/2 and Re z>0 |
| LLS70 TableIII, p.440 | LLS70 line 527; LLS70 line 559; LLS70 line 563; LLS70 line 575 | Verified: least-prime column gives the three claimed minima |
| LLS70 class-three application, pp.445–447 | LLS70 line 1123; LLS70 line 1129; LLS70 line 1133 | Verified: cubic norm obstruction and iterative threshold argument |
| G77 §1, p.219; DLMF §5.11(i),(ii) | G77 line 28; DLMF line 104; DLMF line 563 | Verified: Siegel's ineffective constant; continuous log-Gamma expansion and argument-dependent omitted-term bound |
| DEL73 §8, (8.12.1)–(8.12.4), p.572 | DEL73 line 1972 | Verified against printed p.572: ker(N) inertia invariants, conductor and determinant/epsilon formulas; convention transport still needs S09 |
| COG04 Lecture9 §§3–6, pp.71–74 | COG04 line 3341; COG04 line 3393; COG04 line 3403 | Verified: completed bounds, pole alternative and self-pair qualification |

O88 §§8–9, pp.66–67 remains the settled waived/uncertified locator-only work. It is excluded from these counts and no new request is made. All eleven bibliography works have one manifest key each. No additional source is needed merely to verify the findings above.

## Adversarial mathematics pass

The table covers every bold target block (69), including its named API, and the non-bold conditions and boundary targets. Instances outside a signature's scope are negative controls, not counterexamples to that signature. “No defect found” records this review's tests; it does not replace the future proofs. The zero ring, positive-characteristic coefficient fields and inseparable quadratic extensions are excluded by the explicit `Field`/`NumberField`/degree hypotheses. Local residue characteristics 2 and 3 are included where local theory is claimed.

| Statement / README location | Instances tried | Result | Change |
|---|---|---|---|
| Sign transport and real extension, :147 | ℚ(i), ℚ(√−3), ℚ(√5), degree one | Signature sign and real radicand >1 agree; degree-one exclusion essential | None |
| Fundamental discriminant, :154 | −1→−4, −3→−3, −5→−20, 5→5; D=1 | Both predicates include 1 but the degree-two result excludes it; implication is one-way | S07 fixes its later misuse |
| Genus divisibility, :156 | d=4,8,20; t=1,2,3 | d=20 has h=2, so 2^(t−1), not 2^t, is correct; −1 radicand branch is separate | None |
| One ramified prime, :158 | −4,−8,−3,−23,−243 | Fundamentalness removes nonmaximal −243; h odd forces t=1 because d≥3 | S06 corrects related conductor-one prose |
| Last reduced coefficient, :170 | (1,0,1), (2,0,2); opposite boundary signs at d=20 | Equality requires a=c,b=0; strictness needs primitivity and d≠4 | None; declared gap accepted |
| Weight θ and API, :187 | d=0,1,15,84,907; powers; p=2,3,5,7,11 | Empty values 1; θ15=1/4, θ84=1/12 discriminate the removed maximum; factors positive | None |
| Split-prime bound, :199 | d=3,p=7; d=4,p=5; d=23,p=2; ramified p | Extra units do not affect the norm argument; ramification exclusion ensures distinct conjugate primes | None |
| Liouville agreement, :212 | n=1,4,6,0; ramified divisor | Complete multiplicativity gives the claimed signs; positivity excludes zero | None; Lean explicitly isolates the arithmetic substatement |
| Partial zeta, :222 | Principal and nonprincipal d=23 forms; d=3,4 | Norm denominator a, inverse ideal class and w=2,6,4 are consistent | None |
| Reduced-form decomposition, :229 | d=23, ν1=1, ν2=2; ramified prime; extra-unit fields | Ramified local factor 1+p^(−s); d>4 is needed for the unweighted w=2 simplification | None |
| Nonaxial count and integrated bound, :248 | q=(1,1,6); first values 6,6,8,8,12,12; t<√d/2 | Half-plane count has area πt/√d; comparison measure needs its boundary atom π/2 | None; integrated inequality supported by O85, not pointwise domination |
| Completion and API, :282 | d=0 at centre; d=2,M=3; zero Ψ; s=0,1,2 | Values 30,18; totalized Γ0 gives zero, distinct from continuation; order uses standing d,M>0 | None |
| C1–C4, :296–300 | n=p versus p²; roots of size √p; central orders 3,4 | C1 forces square support; C2 denominator nonzero at 1; even reflection forces order ≥4 | None |
| Inverse Mellin kernel and API, :307 | m=0,1,2,3; a=−1,0,1; x≤0,1/2,1,2 | m≥2 and Re s>a needed; negative-a countercontrol valid; factorial currently untested | S05 |
| Positive Mellin comparison, :319 | δ1 versus (δ1/2+δ3/2)/2; zero measures; empty product | Integrated distribution domination suffices via decreasing convex hinges; pointwise domination unnecessary | None; Lean is the one-factor real-integral milestone |
| Fundamental contour, :336 | exp((s−1)²); (s−1)³exp((s−1)²); zero F | Missing central zero gives 1/2; wrong reflection gives 1/(2√π); zero F allowed | None |
| Truncated residue, :352 | H=G=1; G(1)=0; U=2 | Expanded residue is log d in unit case; Lean does not divide by G(1); strict cutoff has no prime at U=2 | None |
| Three tail estimates, :369 | Empty small-prime set; U=1; dM/U<1 | Absolute logarithm and positive scale are retained; no sign counterexample | Constants checked against printed pp.317–318; no defect found |
| Technical theorem, :388 | h=1,4; roots at √p; varying K with fixed Ψ,M | Exceptional m=3/2 for h=4 retained; constant quantified before K,G,F; ν tied to ζ_K/ζ(2s) | None; large proof remains a target |
| Curve139 and curve37, :421 | Listed rational point, origin, Δ,c4,c6; coordinate substitution | Δ139=37·139⁶, c4/c6 scale by (−139)²/(−139)³; substitution consistent | None; O88-specific isogeny citation remains waived |
| Curve5077, :436 | (0,2),(1,0),(2,0),(0,−2) | First three satisfy plus-y equation; last does not; Δ=5077,c4=336 | None |
| Analytic order and twists, :447/:449 | Signs ±1; identically zero L; D=1,−7,−139; wild 2,3 | a1=1 excludes identically zero; trace/norm gives D; coprime conductor formula correctly restricted | S08 ownership; S09 duality/Frobenius |
| Local curve data, :456 | Good 3,5,7; bad 37,139,5077 | Curve37 a5=0,a139=−4; curve139 additive at139; curve5077 nonsplit at5077; signs agree | S02 for arbitrary integral models |
| Arithmetic ranks, :467 | Dependent versus independent points; torsion reductions; rank zero control | Heights must prove independence; descent independently bounds rank; coprime reduction counts kill torsion | No false rank statement found; descent certificates not recomputed |
| BGZ kernels and API, :487 | r=0,1,2,3; x≤0,1,2 | G0=e^(−x) only on positive arguments; derivative lowers r and divides by −x; factorial correct | None |
| BGZ remainder bounds, :489 | x=5,r=1,K=1; K=0; Y=e^(r−1) | Integrated Taylor remainder works even when initial terms increase; tail threshold ensures monotonicity | None |
| Central derivative series, :502 | r=0,+ sign; r=1,3,− sign; n=0,1,2 | Factor 2r! and a_n/n agree; third derivative needs lower vanishing; coefficient bound forces a0=0 | None |
| Central derivative tail, :510 | B=0,250,400; N=5077; r=0,1,3 | Positive α; geometric denominator nonzero; repaired B=400 tail≈5.89·10⁻¹⁶ | None |
| Point-count coefficient interface, :520 | Curve37 and scaled integral equation at7 | Same elliptic curve gives different naive point count; minimalization is essential; interface already supplied | S02 |
| Numerical inputs, :522–526 | B400 derivative; B2048 twist7; positive curve37 central value | Tail budgets consistent; twist7 tail≈1.97·10⁻⁹; existence of entire L not assumed by numerical output | S03 missing easy twist milestone |
| Classical Heegner construction, :538 | N=1,3,27,37,5077; D=−3,−7,−139; class of order3 | Cyclic quotient handles ramified exponent1, excludes exponent3; trace and conjugation signs consistent | None |
| Gross–Zagier constants and product rule, :546/:548 | Rational P over quadratic K; φ↦[m]φ; either central factor zero | Relative height scales by2; degree/C² scale by m²; full product rule present | Exact formula checked against rendered GZ86 p.230; no defect found |
| Scalar height-gap principle, :555 | η=0; η≥δ; b=0; c≤0 | Required b≠0,c>0 make conclusion valid; hsmall forces δ>0 in zero branch | None |
| Quantitative Heegner descent, :557 | 𝔽9,𝔽25; rational tensor point versus actual rational point | Counts7,20 force torsion-free descent; c>5·10⁻¹² and δ=1 give the stated contradiction | None; period/degree certificate remains to be proved |
| Eta quotient, :568 | First two q terms; cusp0 and∞ | Exponent2 gives pole order3 and coefficient−2; divisor degree zero | None |
| CM relation, :579 | Class number3; roots of unity; trace sum versus average | Three class points and u-values 1 give divisor/trace relation; no extra roots of unity in this Hilbert class field | None |
| Vanishing for curve139, :590 | L(curve37,1)≠0; twist central value0 | Product rule reduces to nonzero untwisted value times twist derivative | None |
| Curve139 third derivative, :600 | Prior exact derivative0; interval18.42–18.44 | Correctly placed after vanishing; interval refers to L'''/6 | None; exact numerical enclosure not reproduced |
| Curve139 exact rank, :602 | Odd order≥3 and nonzero third derivative | Forces analytic rank3, independently of arithmetic rank3 | None |
| Curve5077 third derivative, :612 | Prior exact derivative0; interval1.73–1.74 | BGZ value1.731849… lies inside; factorial6 retained | None |
| Curve5077 exact rank, :614 | Even derivatives under sign−1; nonzero third derivative | Finite analytic order3 and arithmetic rank3 correctly separated | None |
| Liouville local factors, :640 | Good trace0; split/nonsplit multiplicative; additive | Good factor (1+pX²)⁻²; bad multiplicative factor (1−X²)⁻¹; additive1 | None |
| Symmetric-square factors, :642 | Good rootsα,β; multiplicative; quadratic-good twist; wild inertia | Algebra gives good rootsα²,p,β² and stated R_p; no omitted bad type | S09 fixes representation transport |
| Finite self-pair growth, :650 | Self-pair; norm-twisted pair; gamma division on left strip | Completed boundedness alone is insufficient; owned adapter has the right goal but absent pinned input | S01 |
| C4 simple zero, :657 | u=2s−1; central rank3 or5; multiplicative bad factor | Residue of ζ(2s−1) gives factor2; simple zero independent of rank of f | S01 for growth proof |
| Coprime Liouville system, :670 | χ(p)=±1,0; χ(−N)=±1 | Euler quotient and positive reflection depend on stated sign; ramified primes with p∤N handled | None |
| Ramified systems, :680/:682 | Good→additive; additive→good/multiplicative; both additive; wild2,3 | Restored factors square-supported; not both factors nontrivial for a ramified quadratic twist; C2 zero padding valid | S09 for duality convention |
| Four curve139 scales, :684 | 37 or139 dividing d, both, neither; ε=±1 | Scales √37 versus37 and139⁰ versus139² correct; B1=19321/19584, B′/B=11log139/408 | None |
| Petersson normalization, :705 | dxdy versus absolute wedge; rescaling f | Absolute wedge is2dxdy; c1 scales quadratically with normalized f | Coefficient checked against rendered O85 p.320; no defect found |
| Explicit constants, :707 | Four scales; corrected B and both ε signs | New enclosures are explicit proof targets, not claimed executed computations | Their feasibility not certified by this audit |
| Exclusion −5077, :718 | −5077 mod4; real +5077 | Negative value is3mod4 and impossible; positive value is not excluded | None |
| Universal7000 bound, :728 | d=3,4; χ(−N) signs; split37; shared conductors | Boundary small d immediate; split-prime branch handles sign failures; global statement source-backed | S01/S09 affect its proposed inputs |
| Coprime55 bound, :738 | d coprime5077; prime d; d=3,4 | Coprimality retained; no unsupported strict constant needed | None |
| Prime majorant and API, :765 | c≤0; t=0,1,2,3; p0=2 | Definition total; positivity theorem uses c>0; t−1 indexing correct; C55(2)=961.690475… | None |
| Weight domination and growth, :776 | d=15,20,84; c=0; t=0,1 | Larger primes give smaller smooth correction; denominators (√p−1)² positive for primes | None |
| Explicit t bound, :787 | t=1; even discriminants; both constants | θ positive permits cancellation; 55 branch carries coprimality | None |
| Prime asymptotics, :797 | n=0,1 versus n→∞ | Junk log values at small n do not affect atTop equivalence; shift from zero indexing harmless | None |
| Majorant asymptotic, :807 | c>0 fixed; t=0,1; t→∞ | Leading term4√(t/log t); summable lower-order expansion gives the stated ratio | None |
| Rational κ and API, :817 | q<0,0,1/4,1/2,1,2 | Values0,2⁻814,2⁻302,1/2; ceiling monotonicity and upward jump at1 correct | None |
| Effective logarithmic theorem, :828 | h=1; q≥1; ε=q or larger | d≥3 gives log d>1; κ=1/2 handles q≥1; small-q constant is safely weaker than derived bound | None |
| Effective cutoff, :839 | H=1; impossible H=0 | Squaring κ(1/2)=2⁻302 gives exponent604; exp x≤4^x gives605 | None |
| Comparison with Siegel, :849 | η near0 and η≥1/2; rational q input | Distinct effective/ineffective quantifiers retained; no effective constant extracted from Siegel | None |
| Class-three prime reduction, :875 | d=4,8,23,31,243 | h=1 removes4,8; dyadic splitting gives p≤32 for p≡7mod8 | None |
| Hardy function and API, :885 | t=0; χ−3; wrong parity gamma; branch continuity | Odd gammaΓ((s+1)/2) and phase normalized0 give a real function; principal logΓ cannot replace continuous branch | None; consume S01's earlier logGamma input where applicable |
| MW zero brackets, :896 | Three conductors; dyadic0/−1; sign swap D↦−D | Factoring conductors proves fundamentalness; character constraints determine the intended χ | No claim of simplicity/lowest zero; exact sign certificates not reproduced |
| MW exclusion, :907 | Endpoints10¹²,10⁵²,10²⁵⁰⁰; exceptional windows | Closed ranges cover endpoints; three conductors are all smaller than p | None; source theorem verifies the range |
| Inert pattern and minima, :917 | x=0; p=3; p=77683 composite;1333963 | Positive and negative controls distinguish primality, mod8 and odd-prime values | Source Table III verifies minima; large sieve not rerun |
| Small-range exclusion, :929 | 907,318028; 4·67³;4·163³;10¹² | Thresholds318028,1203052,17322988 lead to least prime1432817816347>10¹² | None |
| Class-three cutoff, :939 | p=5077; logp=165; range boundary10¹² | Discriminant exclusion gives coprimality; exp165<10⁷²<10²⁵⁰⁰ | None |
| Sixteen-list definition and enumeration, :949 | All fundamental d≤907; d23,31,907;−163,−243 | Direct reduced-form enumeration gives exactly the sixteen entries; largest907 | S07 fixes field-existence justification |
| Additional Lean boundary targets / examples | reducedForms12,16; split fields3,4; G1(1),G3(2) | Counts2,2; unit exceptions covered; positive kernel bounds meaningful | None |


### Lean declaration and context inventory

Line numbers are in `packages/EffectiveClassNumbers/Suggested.lean`. The namespace is `TauCetiRoadmap.EffectiveClassNumbers`; all declarations lie in its noncomputable section. Each written type below includes its own variables and instances. There are no additional standing variables or included hypotheses. This is a textual type audit, not elaborated `#check` output.

| Line | Section | Kind | Name | Complete written type/context |
|---|---|---|---|---|
| 44 | Layer0 | theorem | isTotallyComplex_iff_discr_neg | theorem isTotallyComplex_iff_discr_neg (K : Type) [Field K] [NumberField K] (hdeg : Module.finrank ℚ K = 2) : NumberField.IsTotallyComplex K ↔ NumberField.discr K < 0 |
| 50 | Layer0 | theorem | exists_positive_squarefree_radicand | theorem exists_positive_squarefree_radicand (K : Type) [Field K] [NumberField K] (hdeg : Module.finrank ℚ K = 2) (hpos : 0 < NumberField.discr K) : ∃ (d : ℤ) (θ : 𝓞 K), 1 < d ∧ Squarefree d ∧ minpoly ℤ θ = Polynomial.X ^ 2 - Polynomial.C d ∧ Algebra.adjoin ℚ {(θ : K)} = ⊤ |
| 59 | Layer0 | theorem | isFundamentalDiscriminant_discr | theorem isFundamentalDiscriminant_discr (K : Type) [Field K] [NumberField K] (hdeg : Module.finrank ℚ K = 2) : TauCeti.Multiquadratic.IsFundamentalDiscriminant (NumberField.discr K) ∧ Int.IsFundamentalDiscr (NumberField.discr K) ∧ NumberField.discr K ≠ 1 |
| 68 | Layer0 | theorem | two_pow_sub_one_dvd_classNumber | theorem two_pow_sub_one_dvd_classNumber (K : Type) [Field K] [NumberField K] (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) : 2 ^ ((NumberField.discr K).natAbs.primeFactors.card - 1) ∣ NumberField.classNumber K |
| 75 | Layer0 | theorem | discr_of_card_primeFactors_eq_one | theorem discr_of_card_primeFactors_eq_one (K : Type) [Field K] [NumberField K] (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) (ht : (NumberField.discr K).natAbs.primeFactors.card = 1) : NumberField.discr K = -4 ∨ NumberField.discr K = -8 ∨ ∃ p : ℕ, p.Prime ∧ p % 4 = 3 ∧ NumberField.discr K = -(p : ℤ) |
| 84 | Layer0 | theorem | reducedForm_four_mul_c_sq_ge | theorem reducedForm_four_mul_c_sq_ge (f : TauCeti.BinaryQuadraticForm ℤ) (d : ℕ) (hd : 0 < d) (hdiscr : f.discrim = -(d : ℤ)) (hred : TauCeti.IsReducedForm f) : (d : ℤ) ≤ 4 * f.c ^ 2 ∧ (Int.gcd (Int.gcd f.a f.b : ℤ) f.c = 1 → d ≠ 4 → (d : ℤ) < 4 * f.c ^ 2) |
| 92 | Layer0 | theorem | reducedForms_small_counts | theorem reducedForms_small_counts : (TauCeti.reducedForms 23).card = 3 ∧ (TauCeti.reducedForms 20).card = 2 ∧ (TauCeti.reducedForms 907).card = 3 ∧ (TauCeti.reducedForms 4).card = 1 ∧ (TauCeti.reducedForms 16).card = 2 ∧ (TauCeti.reducedForms 12).card = 2 |
| 99 | Layer0 | example | example@99 | example : TauCeti.reducedForms 23 = {⟨1, 1, 6⟩, ⟨2, -1, 3⟩, ⟨2, 1, 3⟩} ∧ (⟨2, 2, 3⟩ : TauCeti.BinaryQuadraticForm ℤ) ∈ TauCeti.reducedForms 20 ∧ (⟨2, -2, 3⟩ : TauCeti.BinaryQuadraticForm ℤ) ∉ TauCeti.reducedForms 20 |
| 105 | Layer0 | example | example@105 | example : TauCeti.IsReducedForm (⟨1, 0, 1⟩ : TauCeti.BinaryQuadraticForm ℤ) ∧ TauCeti.IsReducedForm (⟨2, 0, 2⟩ : TauCeti.BinaryQuadraticForm ℤ) ∧ (4 : ℤ) = 4 * (1 : ℤ) ^ 2 ∧ (16 : ℤ) = 4 * (2 : ℤ) ^ 2 |
| 113 | Layer0 | def | ramifiedWeight | def ramifiedWeight (d : ℕ) : ℝ |
| 118 | Layer0 | theorem | ramifiedWeight_pos | theorem ramifiedWeight_pos (d : ℕ) : 0 < ramifiedWeight d |
| 121 | Layer0 | theorem | ramifiedWeight_le_one | theorem ramifiedWeight_le_one (d : ℕ) : ramifiedWeight d ≤ 1 |
| 124 | Layer0 | theorem | ramifiedWeight_eq_one_of_odd_classNumber | theorem ramifiedWeight_eq_one_of_odd_classNumber (K : Type) [Field K] [NumberField K] (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) (hodd : Odd (NumberField.classNumber K)) : ramifiedWeight (NumberField.discr K).natAbs = 1 |
| 131 | Layer0 | example | example@131 | example : ramifiedWeight 0 = 1 ∧ ramifiedWeight 907 = 1 |
| 139 | Layer0 | example | example@139 | example : ramifiedWeight 15 = 1 / 4 ∧ ramifiedWeight 84 = 1 / 12 |
| 161 | Layer0 | theorem | splitPrime_size | theorem splitPrime_size (K : Type) [Field K] [NumberField K] (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) (p : ℕ) (hp : p.Prime) (hunram : ¬ (p : ℤ) ∣ NumberField.discr K) (hsplit : ∃ P : Ideal (𝓞 K), P.IsPrime ∧ P.absNorm = p) : (NumberField.discr K).natAbs ≤ 4 * p ^ NumberField.classNumber K |
| 170 | Layer0 | theorem | splitPrime_boundary_fields | theorem splitPrime_boundary_fields (K : Type) [Field K] [NumberField K] (hdeg : Module.finrank ℚ K = 2) (hD : NumberField.discr K = -3 ∨ NumberField.discr K = -4) : NumberField.classNumber K = 1 ∧ (∃ P : Ideal (𝓞 K), P.IsPrime ∧ P.absNorm = if NumberField.discr K = -3 then 7 else 5) |
| 179 | Layer0 | theorem | liouville_agreement | theorem liouville_agreement (χ : ArithmeticFunction ℤ) (n : ℕ) (hone : χ 1 = 1) (hmul : ∀ m k : ℕ, χ (m * k) = χ m * χ k) (hn : 0 < n) (hinert : ∀ p ∈ n.primeFactors, χ p = -1) : χ n = ArithmeticFunction.liouville n |
| 195 | Layer1 | def | goldfeldCompletion | def goldfeldCompletion (d : ℕ) (M : ℝ) (Ψ G : ℂ → ℂ) : ℂ → ℂ |
| 199 | Layer1 | theorem | goldfeldCompletion_one | theorem goldfeldCompletion_one (d : ℕ) (M : ℝ) (Ψ G : ℂ → ℂ) : goldfeldCompletion d M Ψ G 1 = (M : ℂ) * Ψ 1 * G 1 |
| 204 | Layer1 | theorem | goldfeldCompletion_product | theorem goldfeldCompletion_product (d N Nχ : ℕ) (hd : 0 < d) (hN : 0 < N) (hNχ : 0 < Nχ) (Ψ G L Lχ : ℂ → ℂ) (hprod : ∀ s : ℂ, 3 / 2 < s.re → Ψ s * G s = L s * Lχ s) (s : ℂ) (hs : 3 / 2 < s.re) : goldfeldCompletion d (Real.sqrt ((N : ℝ) * Nχ) / (4 * Real.pi ^ 2 * d)) Ψ G s = ((N : ℂ) ^ (s / 2) * (2 * Real.pi : ℂ) ^ (-s) * Complex.Gamma s * L s) * ((Nχ : ℂ) ^ (s / 2) * (2 * Real.pi : ℂ) ^ (-s) * Complex.Gamma s * Lχ s) / (d : ℂ) |
| 214 | Layer1 | example | example@214 | example : goldfeldCompletion 2 3 (fun _ ↦ 2) (fun _ ↦ 5) 1 = 30 ∧ goldfeldCompletion 2 3 (fun _ ↦ 1) (fun _ ↦ 1) 2 = 18 |
| 224 | Layer1 | example | example@224 | example (d : ℕ) (M : ℝ) (Ψ G : ℂ → ℂ) : (goldfeldCompletion d M (fun _ ↦ 0) G = fun _ ↦ 0) ∧ goldfeldCompletion d M Ψ G 0 = 0 |
| 236 | Layer1 | def | inverseMellinKernel | def inverseMellinKernel (a : ℝ) (m : ℕ) : ℝ → ℝ |
| 241 | Layer1 | theorem | inverseMellinKernel_convexOn | theorem inverseMellinKernel_convexOn (a : ℝ) (m : ℕ) (ha : 0 ≤ a) (hm : 2 ≤ m) : ConvexOn ℝ (Set.Ioi 0) (inverseMellinKernel a m) |
| 246 | Layer1 | theorem | inverseMellinKernel_mellin | theorem inverseMellinKernel_mellin (a : ℝ) (m : ℕ) (hm : 2 ≤ m) (s : ℂ) (hs : a < s.re) : mellin (fun x ↦ (inverseMellinKernel a m x : ℂ)) s = (s - (a : ℂ)) ^ (-(m : ℤ)) |
| 251 | Layer1 | example | example@251 | example : inverseMellinKernel 0 2 (1 / 2) = Real.log 2 ∧ inverseMellinKernel 1 2 (1 / 2) = 2 * Real.log 2 |
| 257 | Layer1 | example | example@257 | example : inverseMellinKernel 0 3 1 = 0 ∧ inverseMellinKernel 0 2 2 = 0 ∧ inverseMellinKernel (-1) 2 (1 / 16) < inverseMellinKernel (-1) 2 (1 / 4) |
| 268 | Layer1 | theorem | positiveMellin_comparison | theorem positiveMellin_comparison (a x : ℝ) (m : ℕ) (ha : 0 ≤ a) (hx : 0 < x) (hm : 2 ≤ m) (μ ν : Measure ℝ) (hμ : μ (Set.Iic 0) = 0) (hν : ν (Set.Iic 0) = 0) (hlocμ : ∀ t : ℝ, μ (Set.Ioc 0 t) ≠ ⊤) (hlocν : ∀ t : ℝ, ν (Set.Ioc 0 t) ≠ ⊤) (hdom : ∀ T : ℝ, 0 ≤ T → (∫ t in Set.Icc 0 T, (μ (Set.Ioc 0 t)).toReal) ≤ ∫ t in Set.Icc 0 T, (ν (Set.Ioc 0 t)).toReal) (hintμ : Integrable (fun t ↦ inverseMellinKernel a m (x * t)) μ) (hintν : Integrable (fun t ↦ inverseMellinKernel a m (x * t)) ν) : 0 ≤ ∫ t, inverseMellinKernel a m (x * t) ∂μ ∧ (∫ t, inverseMellinKernel a m (x * t) ∂μ) ≤ ∫ t, inverseMellinKernel a m (x * t) ∂ν |
| 282 | Layer1 | theorem | fundamentalContour | theorem fundamentalContour (F : ℂ → ℂ) (hentire : Differentiable ℂ F) (hFE : ∀ s, F s = F (2 - s)) (hzero : ∀ j : ℕ, j < 3 → iteratedDeriv j F 1 = 0) (hdecay : ∀ A B : ℝ, ∀ r : ℕ, ∃ C : ℝ, 0 < C ∧ ∀ s : ℂ, A ≤ s.re → s.re ≤ B → 1 ≤ \|s.im\| → ‖F s‖ ≤ C / \|s.im\| ^ r) (σ : ℝ) (hσ : 3 / 2 < σ) : ∫ t : ℝ, F ((σ : ℂ) + t * Complex.I) / (((σ : ℂ) + t * Complex.I) - 1) ^ 3 = 0 |
| 291 | Layer1 | theorem | truncatedResidue | theorem truncatedResidue (d : ℕ) (hd : 0 < d) (H G : ℂ → ℂ) (hH : AnalyticAt ℂ H 1) (hG : AnalyticAt ℂ G 1) : TauCeti.Contour.residue (fun s ↦ (d : ℂ) ^ (s - 1) * H s * G s / (s - 1) ^ 2) 1 = H 1 * G 1 * (Real.log d : ℂ) + H 1 * deriv G 1 + deriv H 1 * G 1 |
| 301 | Layer1 | theorem | oesterleTechnical | theorem oesterleTechnical (M : ℝ) (hM : 0 < M) (Ψ : ℂ → ℂ) (a : ℕ → ℂ) (hΨseries : ∀ s : ℂ, 1 < s.re → Ψ s = LSeries a s) (hΨcoeff : ∀ n : ℕ, 0 < n → ‖a n‖ ≤ if (Nat.sqrt n) ^ 2 = n then (Nat.sqrt n : ℝ) * (Nat.divisors (Nat.sqrt n)).card else 0) (U : Set ℂ) (hU : IsOpen U) (hUc : {s : ℂ \| 1 ≤ s.re} ⊆ U) (hΨan : AnalyticOnNhd ℂ Ψ U) (hΨzero : Ψ 1 = 0) (hΨsimple : deriv Ψ 1 ≠ 0) (hΨdecay : ∀ A B : ℝ, 1 ≤ A → ∀ r : ℕ, ∃ C : ℝ, 0 < C ∧ ∀ s : ℂ, A ≤ s.re → s.re ≤ B → 1 ≤ \|s.im\| → ‖(M : ℂ) ^ s * Complex.Gamma s ^ 2 * Ψ s‖ ≤ C / \|s.im\| ^ r) : ∃ C : ℝ, 0 < C ∧ ∀ (K : Type) [Field K] [NumberField K], Module.finrank ℚ K = 2 → NumberField.discr K < -4 → ∀ (G F : ℂ → ℂ) (b : ℕ → ℂ) (ν : ℕ → ℝ) (Gp : ℕ → ℂ → ℂ) (α β α' β' : ℕ → ℂ), (∀ n, 0 ≤ ν n) → (∀ s : ℂ, 1 < s.re → LSeries (fun n ↦ (ν n : ℂ)) s = NumberField.dedekindZeta K s / riemannZeta (2 * s)) → (∀ s : ℂ, 3 / 2 < s.re → G s = LSeries b s) → (∀ n : ℕ, 0 < n → ‖b n‖ ≤ Real.sqrt n * ∑ q ∈ n.divisors, ν q * ν (n / q)) → (∀ p : ℕ, p.Prime → ‖α p‖ ≤ Real.sqrt p ∧ ‖β p‖ ≤ Real.sqrt p ∧ ‖α' p‖ ≤ Real.sqrt p ∧ ‖β' p‖ ≤ Real.sqrt p) → (∀ p : ℕ, p.Prime → ∀ s : ℂ, Gp p s = ((1 + α p * (p : ℂ) ^ (-s)) * (1 + β p * (p : ℂ) ^ (-s))) / ((1 + α' p * (p : ℂ) ^ (-s)) * (1 + β' p * (p : ℂ) ^ (-s)))) → (∀ s : ℂ, 3 / 2 < s.re → Tendsto (fun B : ℕ ↦ ∏ p ∈ (Finset.range B).filter Nat.Prime, Gp p s) atTop (𝓝 (G s))) → Differentiable ℂ F → (∀ s : ℂ, 3 / 2 < s.re → F s = goldfeldCompletion (NumberField.discr K).natAbs M Ψ G s) → (∀ s, F s = F (2 - s)) → (∀ j : ℕ, j < 3 → iteratedDeriv j F 1 = 0) → (∀ A B : ℝ, ∀ r : ℕ, ∃ T : ℝ, 0 < T ∧ ∀ s : ℂ, A ≤ s.re → s.re ≤ B → 1 ≤ \|s.im\| → ‖F s‖ ≤ T / \|s.im\| ^ r) → min 1 (∏ p ∈ (NumberField.discr K).natAbs.primeFactors.erase ((NumberField.discr K).natAbs.primeFactors.sup id), ‖Gp p 1‖ / (1 + 1 / (p : ℝ))) * Real.log (NumberField.discr K).natAbs ≤ C * NumberField.classNumber K |
| 348 | Layer2 | def | curve139 | def curve139 : WeierstrassCurve ℚ |
| 351 | Layer2 | def | curve37 | def curve37 : WeierstrassCurve ℚ |
| 357 | Layer2 | def | curve5077 | def curve5077 : WeierstrassCurve ℚ |
| 360 | Layer2 | theorem | curve139_discriminant | theorem curve139_discriminant : curve139.Δ = 37 * 139 ^ 6 |
| 366 | Layer2 | theorem | curve37_discriminant | theorem curve37_discriminant : curve37.Δ = 37 |
| 372 | Layer2 | theorem | curve5077_discriminant | theorem curve5077_discriminant : curve5077.Δ = 5077 |
| 378 | Layer2 | instance | curve139_isElliptic | instance curve139_isElliptic : curve139.IsElliptic |
| 382 | Layer2 | instance | curve5077_isElliptic | instance curve5077_isElliptic : curve5077.IsElliptic |
| 387 | Layer2 | theorem | curve139_c₄_c₆ | theorem curve139_c₄_c₆ : curve139.c₄ = (-139) ^ 2 * curve37.c₄ ∧ curve139.c₆ = (-139) ^ 3 * curve37.c₆ |
| 394 | Layer2 | theorem | curve139_source_equation | theorem curve139_source_equation (X Y : ℚ) : curve139.toAffine.Equation X Y ↔ (-139 : ℚ) * ((8 * Y + 4) / 139 ^ 2) ^ 2 = ((4 * X + 462) / (-139)) ^ 3 + 10 * ((4 * X + 462) / (-139)) ^ 2 - 20 * ((4 * X + 462) / (-139)) + 8 |
| 402 | Layer2 | example | example@402 | example : curve139.a₂ = -1 ∧ curve139.a₄ = -64403 ∧ curve139.a₆ = -6220110 ∧ ¬ curve139.toAffine.Equation 0 0 |
| 407 | Layer2 | example | example@407 | example : curve139.toAffine.Equation (-156) 77 |
| 411 | Layer2 | example | example@411 | example : curve5077.toAffine.Equation 0 2 ∧ curve5077.toAffine.Equation 1 0 ∧ curve5077.toAffine.Equation 2 0 |
| 416 | Layer2 | example | example@416 | example : ¬ curve5077.toAffine.Equation 0 (-2) |
| 420 | Layer2 | example | example@420 | example : curve37.a₂ = 1 ∧ curve37.a₄ = -3 ∧ curve37.a₆ = 1 ∧ curve37.Δ = 37 ∧ curve37.c₄ = 160 ∧ curve37.c₆ = -2008 |
| 426 | Layer2 | example | example@426 | example : ¬ curve37.toAffine.Equation 0 0 |
| 431 | Layer2 | theorem | analyticRank_parity | theorem analyticRank_parity (E : WeierstrassCurve ℚ) [E.IsElliptic] (N : ℕ) (hN : 0 < N) (L Λ : ℂ → ℂ) (hL : Differentiable ℂ L) (hΛ : Differentiable ℂ Λ) (hseries : ∀ s : ℂ, 3 / 2 < s.re → L s = E.LSeries s) (hcompletion : ∀ s : ℂ, 3 / 2 < s.re → Λ s = (N : ℂ) ^ (s / 2) * (2 * Real.pi : ℂ) ^ (-s) * Complex.Gamma s * L s) (w : ℤ) (hw : w = 1 ∨ w = -1) (hFE : ∀ s : ℂ, Λ (2 - s) = (w : ℂ) * Λ s) : analyticOrderAt L 1 ≠ ⊤ ∧ (-1 : ℤ) ^ analyticOrderNatAt L 1 = w |
| 444 | Layer2 | theorem | twist_LFunction_coeff | theorem twist_LFunction_coeff (E : WeierstrassCurve ℚ) [E.IsElliptic] (D : ℤ) (hD : TauCeti.Multiquadratic.IsFundamentalDiscriminant D) (hD1 : D ≠ 1) (hgood : ∀ (p : ℕ) [Fact p.Prime], p ∣ D.natAbs → ((E.baseChange ℚ_[p]).localPolynomial ℤ_[p]).natDegree = 2) (n : ℕ) (hn : 0 < n) : (E.quadraticTwistOf 1 ((1 - (D : ℚ)) / 4)).LFunction n = TauCeti.Multiquadratic.fundamentalDiscriminantChar D hD n * E.LFunction n |
| 455 | Layer2 | theorem | curve_local_data | theorem curve_local_data : curve139.LFunction 139 = 0 ∧ curve5077.LFunction 5077 = -1 |
| 459 | Layer2 | theorem | mordellWeilRank_eq_three | theorem mordellWeilRank_eq_three : Module.finrank ℤ curve139.toAffine.PointModTorsion = 3 ∧ Module.finrank ℤ curve5077.toAffine.PointModTorsion = 3 ∧ Submodule.torsion ℤ curve5077.toAffine.Point = ⊥ |
| 474 | Layer2 | def | bgzKernel | def bgzKernel (r : ℕ) : ℝ → ℝ |
| 480 | Layer2 | theorem | bgzKernel_hasDerivAt | theorem bgzKernel_hasDerivAt (r : ℕ) (hr : 1 ≤ r) (x : ℝ) (hx : 0 < x) : HasDerivAt (bgzKernel r) (-bgzKernel (r - 1) x / x) x |
| 485 | Layer2 | theorem | bgzKernel_le | theorem bgzKernel_le (r : ℕ) (x : ℝ) (hx : 0 < x) : bgzKernel r x ≤ Real.exp (-x) / x ^ r |
| 489 | Layer2 | example | example@489 | example : bgzKernel 0 1 = Real.exp (-1) |
| 492 | Layer2 | example | example@492 | example : bgzKernel 3 0 = 0 ∧ bgzKernel 1 (-1) = 0 |
| 496 | Layer2 | theorem | bgzKernel_boundary_bounds | theorem bgzKernel_boundary_bounds : 0 < bgzKernel 1 1 ∧ bgzKernel 1 1 < Real.exp (-1) ∧ bgzKernel 3 2 ≤ Real.exp (-2) / 8 |
| 503 | Layer2 | theorem | centralDerivative_series | theorem centralDerivative_series (N r : ℕ) (hN : 0 < N) (hr : Odd r) (a : ℕ → ℝ) (L : ℂ → ℂ) (hcoeff : ∀ n : ℕ, \|a n\| ≤ (n.divisors.card : ℝ) * Real.sqrt n) (hentire : Differentiable ℂ L) (hseries : ∀ s : ℂ, 3 / 2 < s.re → L s = LSeries (fun n ↦ (a n : ℂ)) s) (hFricke : ∀ y : ℝ, 0 < y → (∑' n : ℕ, a n * Real.exp (-2 * Real.pi * n / (y * Real.sqrt N))) = -y ^ 2 * ∑' n : ℕ, a n * Real.exp (-2 * Real.pi * n * y / Real.sqrt N)) (hzero : ∀ j : ℕ, j < r → iteratedDeriv j L 1 = 0) : iteratedDeriv r L 1 = (2 * (r.factorial : ℂ)) * ∑' n : ℕ, ((a n / n * bgzKernel r (2 * Real.pi * n / Real.sqrt N) : ℝ) : ℂ) |
| 519 | Layer2 | theorem | curve5077_deriv_small | theorem curve5077_deriv_small (L : ℂ → ℂ) (hentire : Differentiable ℂ L) (hseries : ∀ s : ℂ, 3 / 2 < s.re → L s = curve5077.LSeries s) : ‖deriv L 1‖ < (10 : ℝ) ^ (-12 : ℤ) |
| 525 | Layer2 | theorem | curve37_central_bounds | theorem curve37_central_bounds (L : ℂ → ℂ) (hentire : Differentiable ℂ L) (hseries : ∀ s : ℂ, 3 / 2 < s.re → L s = curve37.LSeries s) : (72 / 100 : ℝ) < (L 1).re ∧ (L 1).re < (73 / 100 : ℝ) |
| 532 | Layer2 | theorem | heegnerHeight_gap | theorem heegnerHeight_gap (a b : ℂ) (c δ η : ℝ) (hc : 0 < c) (hb : b ≠ 0) (hformula : a * b = ((c * η : ℝ) : ℂ)) (hgap : η = 0 ∨ δ ≤ η) (hsmall : ‖a * b‖ < c * δ) : η = 0 ∧ a = 0 |
| 548 | Layer2 | theorem | curve5077_height_gap | theorem curve5077_height_gap (P : curve5077.toAffine.Point) (hP : P ≠ 0) : (1 / 2 : ℝ) ≤ P.canonicalHeight |
| 557 | Layer2 | theorem | curve5077_deriv_eq_zero | theorem curve5077_deriv_eq_zero (L : ℂ → ℂ) (hentire : Differentiable ℂ L) (hseries : ∀ s : ℂ, 3 / 2 < s.re → L s = curve5077.LSeries s) : deriv L 1 = 0 |
| 564 | Layer2 | theorem | heegnerTrace_139 | theorem heegnerTrace_139 (L : ℂ → ℂ) (hentire : Differentiable ℂ L) (hseries : ∀ s : ℂ, 3 / 2 < s.re → L s = curve139.LSeries s) : deriv L 1 = 0 |
| 571 | Layer2 | theorem | curve139_third_deriv_bounds | theorem curve139_third_deriv_bounds (L : ℂ → ℂ) (hentire : Differentiable ℂ L) (hseries : ∀ s : ℂ, 3 / 2 < s.re → L s = curve139.LSeries s) : (1842 / 100 : ℝ) < (iteratedDeriv 3 L 1).re / 6 ∧ (iteratedDeriv 3 L 1).re / 6 < (1844 / 100 : ℝ) |
| 578 | Layer2 | theorem | rankThree_139 | theorem rankThree_139 (L : ℂ → ℂ) (hentire : Differentiable ℂ L) (hseries : ∀ s : ℂ, 3 / 2 < s.re → L s = curve139.LSeries s) : analyticOrderAt L 1 ≠ ⊤ ∧ analyticOrderNatAt L 1 = 3 ∧ Module.finrank ℤ curve139.toAffine.PointModTorsion = 3 |
| 585 | Layer2 | theorem | curve5077_third_deriv_bounds | theorem curve5077_third_deriv_bounds (L : ℂ → ℂ) (hentire : Differentiable ℂ L) (hseries : ∀ s : ℂ, 3 / 2 < s.re → L s = curve5077.LSeries s) : (173 / 100 : ℝ) < (iteratedDeriv 3 L 1).re / 6 ∧ (iteratedDeriv 3 L 1).re / 6 < (174 / 100 : ℝ) |
| 592 | Layer2 | theorem | rankThree_5077 | theorem rankThree_5077 (L : ℂ → ℂ) (hentire : Differentiable ℂ L) (hseries : ∀ s : ℂ, 3 / 2 < s.re → L s = curve5077.LSeries s) : analyticOrderAt L 1 ≠ ⊤ ∧ analyticOrderNatAt L 1 = 3 ∧ Module.finrank ℤ curve5077.toAffine.PointModTorsion = 3 ∧ deriv L 1 = 0 ∧ (173 / 100 : ℝ) < (iteratedDeriv 3 L 1).re / 6 ∧ (iteratedDeriv 3 L 1).re / 6 < (174 / 100 : ℝ) |
| 608 | Layer3 | theorem | curve37_trace_five | theorem curve37_trace_five : curve37.LFunction 5 = 0 |
| 612 | Layer3 | theorem | exceptional_5077 | theorem exceptional_5077 (K : Type) [Field K] [NumberField K] (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) : (NumberField.discr K).natAbs ≠ 5077 |
| 622 | Layer3 | theorem | global_7000 | theorem global_7000 (K : Type) [Field K] [NumberField K] (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) : ramifiedWeight (NumberField.discr K).natAbs * Real.log (NumberField.discr K).natAbs ≤ 7000 * NumberField.classNumber K |
| 629 | Layer3 | theorem | coprime_55 | theorem coprime_55 (K : Type) [Field K] [NumberField K] (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) (hcop : (NumberField.discr K).natAbs.Coprime 5077) : ramifiedWeight (NumberField.discr K).natAbs * Real.log (NumberField.discr K).natAbs ≤ 55 * NumberField.classNumber K |
| 649 | Layer4 | def | primeMajorant | def primeMajorant (c : ℝ) (t : ℕ) : ℝ |
| 655 | Layer4 | theorem | primeMajorant_weight | theorem primeMajorant_weight (d : ℕ) (hd : 1 < d) (c : ℝ) (hc : 0 ≤ c) : c ≤ ramifiedWeight d * primeMajorant c d.primeFactors.card |
| 660 | Layer4 | theorem | primeMajorant_log_le | theorem primeMajorant_log_le (c : ℝ) (hc : 0 < c) (t : ℕ) : Real.log (primeMajorant c t) ≤ Real.log c + 16 * Real.sqrt t |
| 665 | Layer4 | example | example@665 | example : primeMajorant 7000 0 = 7000 ∧ primeMajorant 55 1 = 55 |
| 669 | Layer4 | example | example@669 | example : primeMajorant 55 2 = 55 * (3 / (3 - 2 * Real.sqrt 2)) ∧ primeMajorant 55 3 = 55 * (3 / (3 - 2 * Real.sqrt 2)) * (4 / (4 - 2 * Real.sqrt 3)) |
| 676 | Layer4 | theorem | explicitT_bound | theorem explicitT_bound (K : Type) [Field K] [NumberField K] (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) : Real.log (NumberField.discr K).natAbs ≤ primeMajorant 7000 (NumberField.discr K).natAbs.primeFactors.card * NumberField.classNumber K ∧ ((NumberField.discr K).natAbs.Coprime 5077 → Real.log (NumberField.discr K).natAbs ≤ primeMajorant 55 (NumberField.discr K).natAbs.primeFactors.card * NumberField.classNumber K) |
| 688 | Layer4 | theorem | nth_prime_isEquivalent | theorem nth_prime_isEquivalent : (fun n : ℕ ↦ (Nat.nth Nat.Prime n : ℝ)) ~[atTop] fun n ↦ n * Real.log n |
| 693 | Layer4 | theorem | sum_inv_sqrt_nth_prime_isEquivalent | theorem sum_inv_sqrt_nth_prime_isEquivalent : (fun n : ℕ ↦ ∑ j ∈ Finset.range n, 1 / Real.sqrt (Nat.nth Nat.Prime j)) ~[atTop] fun n ↦ 2 * Real.sqrt (n / Real.log n) |
| 699 | Layer4 | theorem | primeMajorant_log_asymptotic | theorem primeMajorant_log_asymptotic (c : ℝ) (hc : 0 < c) : Tendsto (fun t : ℕ ↦ Real.log (primeMajorant c t) / (4 * Real.sqrt (t / Real.log t))) atTop (𝓝 1) |
| 709 | Layer4 | def | effectiveKappa | def effectiveKappa (q : ℚ) : ℚ |
| 714 | Layer4 | theorem | effectiveKappa_pos | theorem effectiveKappa_pos (q : ℚ) (hq : 0 < q) : 0 < effectiveKappa q |
| 718 | Layer4 | example | example@718 | example : effectiveKappa 0 = 0 ∧ effectiveKappa 1 = 1 / 2 |
| 722 | Layer4 | example | example@722 | example : effectiveKappa (1 / 2) = 1 / 2 ^ 302 ∧ effectiveKappa (1 / 4) = 1 / 2 ^ 814 |
| 727 | Layer4 | theorem | effectiveLogarithmic_bound | theorem effectiveLogarithmic_bound (K : Type) [Field K] [NumberField K] (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) (q : ℚ) (hq : 0 < q) (ε : ℝ) (hqε : (q : ℝ) ≤ ε) : (effectiveKappa q : ℝ) * Real.log (NumberField.discr K).natAbs ^ (1 - ε) < NumberField.classNumber K |
| 735 | Layer4 | theorem | effective_cutoff | theorem effective_cutoff (K : Type) [Field K] [NumberField K] (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) (H : ℕ) (hH : NumberField.classNumber K = H) : ((NumberField.discr K).natAbs : ℝ) < Real.exp (2 ^ 604 * (H : ℝ) ^ 2) ∧ (NumberField.discr K).natAbs < 2 ^ (2 ^ 605 * H ^ 2) |
| 749 | Layer5 | theorem | classThree_prime | theorem classThree_prime (K : Type) [Field K] [NumberField K] (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) (hthree : NumberField.classNumber K = 3) : ∃ p : ℕ, p.Prime ∧ p % 4 = 3 ∧ NumberField.discr K = -(p : ℤ) |
| 757 | Layer5 | theorem | mwZero_brackets | theorem mwZero_brackets (k : ℕ) [NeZero k] (hk : k = 17923 ∨ k = 115147 ∨ k = 123204) (χ : DirichletCharacter ℂ k) (hprim : χ.IsPrimitive) (hodd : χ (-1) = -1) (hoddPrimes : ∀ p : ℕ, (hp : p.Prime) → p ≠ 2 → χ p = (@legendreSym p ⟨hp⟩ (-(k : ℤ)) : ℂ)) (htwo : χ 2 = (ZMod.χ₈ (-(k : ZMod 8)) : ℂ)) : ∃ γ : ℝ, (if k = 17923 then (30985 / 10 ^ 6 : ℝ) else if k = 115147 then 3157 / 10 ^ 6 else 10649 / 10 ^ 6) ≤ γ ∧ γ ≤ (if k = 17923 then (30987 / 10 ^ 6 : ℝ) else if k = 115147 then 3159 / 10 ^ 6 else 10651 / 10 ^ 6) ∧ χ.LFunction ((1 / 2 : ℂ) + γ * Complex.I) = 0 |
| 771 | Layer5 | theorem | montgomeryWeinberger | theorem montgomeryWeinberger (K : Type) [Field K] [NumberField K] (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) (hlo : 10 ^ 12 ≤ (NumberField.discr K).natAbs) (hhi : (NumberField.discr K).natAbs ≤ 10 ^ 2500) : NumberField.classNumber K ≠ 3 |
| 780 | Layer5 | def | IsInertPrime | def IsInertPrime (x p : ℕ) : Prop |
| 785 | Layer5 | theorem | leastInertPrime_43 | theorem leastInertPrime_43 : IsLeast {p : ℕ \| IsInertPrime 43 p} 1333963 |
| 789 | Layer5 | theorem | leastInertPrime_67 | theorem leastInertPrime_67 : IsLeast {p : ℕ \| IsInertPrime 67 p} 51599563 |
| 793 | Layer5 | theorem | leastInertPrime_163 | theorem leastInertPrime_163 : IsLeast {p : ℕ \| IsInertPrime 163 p} 1432817816347 |
| 797 | Layer5 | example | example@797 | example : IsInertPrime 0 3 ∧ ¬ IsInertPrime 3 3 ∧ ¬ IsInertPrime 43 77683 |
| 808 | Layer5 | example | example@808 | example : IsInertPrime 43 1333963 ∧ IsInertPrime 47 1333963 |
| 823 | Layer5 | theorem | smallRange_sieve | theorem smallRange_sieve (K : Type) [Field K] [NumberField K] (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) (hlo : 907 < (NumberField.discr K).natAbs) (hhi : (NumberField.discr K).natAbs < 10 ^ 12) : NumberField.classNumber K ≠ 3 |
| 830 | Layer5 | theorem | classThree_cutoff | theorem classThree_cutoff (K : Type) [Field K] [NumberField K] (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) (hthree : NumberField.classNumber K = 3) : (NumberField.discr K).natAbs ≤ 907 |
| 839 | Layer5 | def | classThreeDiscriminants | def classThreeDiscriminants : Finset ℤ |
| 844 | Layer5 | theorem | classThree_enumeration | theorem classThree_enumeration (K : Type) [Field K] [NumberField K] (hdeg : Module.finrank ℚ K = 2) (hneg : NumberField.discr K < 0) : NumberField.classNumber K = 3 ↔ NumberField.discr K ∈ classThreeDiscriminants |
| 850 | Layer5 | example | example@850 | example : classThreeDiscriminants.card = 16 ∧ (-907 : ℤ) ∈ classThreeDiscriminants ∧ (-23 : ℤ) ∈ classThreeDiscriminants ∧ (-31 : ℤ) ∈ classThreeDiscriminants |
| 856 | Layer5 | example | example@856 | example : (-243 : ℤ) ∉ classThreeDiscriminants ∧ (-163 : ℤ) ∉ classThreeDiscriminants |

## Not verifiable

- **Lean elaboration and proof-script execution.** The brief forbids Lean builds. No Lean command was run; the proved examples and instance bodies were read and their intended mathematics checked, but successful elaboration is not certified.
- **O88 §§8–9, pp.66–67.** This is the settled waived/uncertified source. Its specific comparison with another curve model was not independently verified. No new missing-reference request is warranted.
- **New exact numerical certificates.** This review did not reproduce the complete rational kernel-sum enclosures, the curve139 interval 18.42–18.44, the period/parametrisation bound c>5·10⁻¹², or the four corrected constant 7000 enclosures. Their asserted source results and the small displayed error budgets were checked; the newly chosen certificates remain roadmap proof obligations.
- **Large finite certifications.** The least-inert-prime minima were checked against LLS70's least-prime column, not by repeating its full search. The MW zeros and exclusion theorem were checked against the legal source, but fresh rational endpoint-sign certificates and the full small-range sieve were not executed. Reduced-form enumeration through d=907 was independently executed and gave exactly the stated sixteen discriminants.
- **Arithmetic descent certificates.** The concrete 2-descent upper bounds, full height matrices and saturation certificates for the two rank-three curves were not rebuilt. The roadmap names their suppliers and proof obligations; source rank statements and the displayed elementary point/reduction checks were verified.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "0f9bd9bc663a4d893ada9c737f40d8e499fba310", "job": "RT-EffectiveClassNumbers~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
