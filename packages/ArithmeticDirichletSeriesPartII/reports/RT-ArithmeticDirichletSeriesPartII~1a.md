<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/124#issuecomment-6312817639 -->
Red team round 1 pass a (codex) of cbd12a6

Verdict: needs_changes

1. **F01** (P3) All sixteen Lean examples are admitted

   Location: `packages/ArithmeticDirichletSeriesPartII/Suggested.lean:60–72`, `91–111`, `121–154`, `246–251`, `276–280`, `320–334`; “Every proof is `sorry`” (line 10).

   Claim: these declarations are definition tests and normalization checks.

   Witness: all 16 `example` bodies consist of `sorry`; HasLaplace has three examples and PoleBoundary has four, exceeding the maximum of two proved examples per definition.

   Exact repair text: “Retain at most two discriminating proved examples per kept definition. Replace each retained example's `sorry` with a proof. Convert the remaining mathematical checks requiring new results into named theorem targets, list their signatures in the README, and remove the claim that every proof is `sorry`.” In particular promote `counting_test_divisor_fourfold` to a named theorem target, since its boundary/series/counting statement is already statable on the kept carriers.

2. **F02** (P1) Suggested.lean imports a nonexistent pinned module

   Location: `packages/ArithmeticDirichletSeriesPartII/Suggested.lean:2`; README lines 130, 169–172.

   Claim: the signatures use the pinned Mathlib and Tau Ceti APIs.

   Witness: `lake-manifest.json` pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`. At that Tau Ceti commit `TauCeti/Order/Northcott.lean` returns 404; `TauCeti/Order/Northcott/Basic.lean:102` defines `summatory`.

   Exact repair text: replace the second import with `import TauCeti.Order.Northcott.Basic`. Replace the supplier headings with `### From Mathlib (pinned 6b7abb3c)` and `### From Tau Ceti (pinned a91d3aaf)`. Replace the Northcott file locator by `TauCeti/Order/Northcott/Basic.lean` and remove the obsolete alternative path. Validate the repaired signatures against those actual pins; no build was run during this read-only review.

3. **F03** (P2) Wood's group rank is shifted by one

   Location: `packages/ArithmeticDirichletSeriesPartII/README.md:875`; “series attached to `C₂^r` with a pole of order `2^r`”.

   Claim: the counted homomorphisms into a rank-r elementary abelian group give pole order 2^r.

   Witness: `wood2019 line 1586` defines G=C₂^k and G′=C₂^(k+1); lines 1636–1653 count homomorphisms into G′; lines 1692–1695 give pole order 2^k. Thus target rank r gives 2^(r−1).

   Exact repair text: “Wood (2019), §7, p. 417: the series F_r counts homomorphisms into C₂^(r+1), with the prescribed restriction on inertia relative to C₂^r × {1}; its pole at 1 has order 2^r, and its partial sums are asymptotic to a constant times X (log X)^(2^r − 1).” Use this explicit meaning of r in the motivation and HP.5.1 Check as well.

4. **F04** (P3) Statable README Checks have no Lean mirror

   Location: `packages/ArithmeticDirichletSeriesPartII/README.md:278`, `362`, `450`, `510–512`, `848–850`, `881`, `1017`.

   Claim: the README's definition and acceptance Checks are executable specifications of the retained carriers.

   Witness: the Lean file lacks `HasLaplace_test_zero`, `PoleBoundary_test_zero_not_exact`, `squaredSinc_test_mass_two`, `delangeWeight_test_origin`, `delangeWeight_test_double`, `logSummatory_test_initial`, `logSummatory_test_unit_mass`, `counting_test_ones`, and `counting_test_divisors_four`.

   Exact repair text: add proved mirrors for the retained discriminating definition Checks; use named theorem targets for boundary Checks that require future theory, within the two-example limit. For example the weight's origin Check can be proved with `by simp [delangeWeight]`; the zero-function Laplace Check over ℂ with `by simp [HasLaplace]`. Promote the missing mathematical boundary Checks to explicit signatures instead of silently omitting them. Treat the isolated library calculation `counting_test_divisors_four` as background rather than adding an unrelated Lean example. Remove the bullet at line 698 (“The statement assumes no growth bound”) from Checks: it merely repeats the theorem's hypothesis policy. The complete Check inventory below identifies the remaining missing mirrors, including the gamma-model specializations, zero regularized remainder, and model smoothed limit. Also cover the statable unnamed boundary Checks at lines 918–922 (a=0), 968–969 (equal pole orders), and 754–759 (one bandwidth) as named theorem targets if proofs require new theory.

5. **F05** (P3) Source records and the consumer locator are missing

   Location: `packages/ArithmeticDirichletSeriesPartII/README.md:1086–1099`; package contains no `sources.toml`.

   Claim: Delange, Wood, Gamburd–Magee–Ronan, and the Laplace API reference provide the source trail.

   Witness: no source manifest is present. The GMR citation has no section locator; `gmr2019 line 1908` gives the Laplace transform and lines 2188–2203 describe the local resolvent and remaining boundary continuation.

   Exact repair text: add `sources.toml` with schema `tauceti-roadmap-sources/v1` and records for each cited work, recording the legal fetched URL, hash, licence class, status, locator scheme and locators. For GMR replace the reference's final phrase with “§4.1, pp. 790–791, equation (4.4), and §4.3, pp. 796–797, for the Laplace-resolvent identity and holomorphic boundary continuation; uniformity remains a consumer obligation.” Delange and Wood are legally available at the URLs already cited; GMR is available from the publisher's open PDF. The repair worker should record service metadata rather than inventing it.

6. **F06** (P3) Process references and obsolete parent links remain

   Location: `packages/ArithmeticDirichletSeriesPartII/README.md:39–42`, `245–249`, `1098–1099`; `Suggested.lean:18–19`, `53`, `357–365`; parent links at README lines 4 and 82.

   Claim: the published specification embeds a pull-request number, replacement-process narrative, and a catalogue of omitted API names.

   Witness: `#40582` occurs in README and docstrings. The parent resides at `Completed/ArithmeticDirichletSeries/README.md`, not the linked active-roadmap path. The trailing Lean comment enumerates omitted API names.

   Exact repair text: use “The one-sided Laplace API follows Dennj Osele, ‘The Laplace transform’, declarations `LaplaceConvergent`, `laplace`, and `HasLaplace`” with the source locator `Mathlib/Analysis/LaplaceTransform.lean:121–123` at `dennj/mathlib4` commit `90482cd37e85e423459de2ed103cea2f4d98cb20` in the bibliography (verified as `osele-laplace line 125`); remove pull-request numbers and the deletion/import narrative from README and docstrings. Delete the trailing catalogue at Lean lines 357–365. Change both parent links to `Completed/ArithmeticDirichletSeries/README.md` (retaining the Layer 9 anchor on the second).

7. **F07** (P2) The general zero-function Check needs a zero-preserving action

   Location: `packages/ArithmeticDirichletSeriesPartII/README.md:229–231`, `278–279`; “the zero function has transform `0` at every complex `s`”.

   Claim: this Check follows under the definition's standing hypotheses, which include only `SMul ℂ E`.

   Witness: take E=ℝ with its usual real normed space and the complex scalar operation z • x := 1. The zero function's integrand is constantly 1, hence is not integrable on (0,∞).

   Exact repair text: “`HasLaplace_test_zero`: for `[NormedAddCommGroup E] [NormedSpace ℝ E] [SMulZeroClass ℂ E]`, the zero function has transform 0 at every s and for every measure μ.” Keep the definition's weaker hypotheses; give this Check the additional instance explicitly. The proposed mirror is `example {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [SMulZeroClass ℂ E] (s : ℂ) (μ : Measure ℝ) : HasLaplace (fun _ : ℝ ↦ (0 : E)) s 0 μ := by simp [HasLaplace]`.

8. **F08** (P2) The Stieltjes comparison is asserted for arbitrary functions

   Location: `packages/ArithmeticDirichletSeriesPartII/README.md:240–242`; “for a function vanishing on `(−∞, 0)`, the Laplace–Stieltjes transform … is `s` times it”.

   Claim: negative-half-line vanishing suffices to define df and identify the transforms.

   Witness: f(t)=sin(1/t²) for t>0, and 0 otherwise, has an absolutely convergent ordinary transform for Re s>0, but infinite variation near 0; df is not a locally finite Stieltjes measure on [0,∞).

   Exact repair text: “For the nonnegative coefficient counting functions of HP.4.1, termwise integration gives the ordinary Laplace transform F(s)/s for Re s>0. The theorem uses this identity directly.” Delete the claim for arbitrary f. If a general Stieltjes comparison is retained instead, make it a named target with bounded-variation/right-continuity, convergence, endpoint-atom and vanishing-boundary-term hypotheses and a legal locator.

## Verified sound

Read **36 explicit Lean declarations** (15 named theorems, 16 examples, 3 definitions, 1 structure, 1 instance), all **16 bold README targets**, and all **28 accompanying API statements**. Reviewed **47 Check bullets**, of which **46 contain mathematical assertions**; none has a proved Lean `example`. Verified **15 source-locator groups across four works**, listed below. Every headline listed in the layer table has an existing-carrier signature; no forced carrier or missing headline signature was found. The present import failure prevents the file from being used at the required pins.

Checked **three parent supplier entries** (Layers 9, 9.2, 4.2) against `Completed/ArithmeticDirichletSeries/README.md:337`, `353`, `227`, respectively. Checked the OneParameterSemigroups ownership distinction against `TauCetiRoadmap/OneParameterSemigroups/README.md:162–202`. Searched all three prescribed sibling heads (QWittVectors, ErdosProgressionPowers, ArithmeticDynamics) for these objects: **zero direct supplier citations to those siblings occur in this package**, and no overlapping target was identified there. No declared supplier gaps or earlier settled repair findings were supplied. No ownership move is required by the observed dependency graph.

The analytic audit found no counterexample to the 15 named Lean theorems. In particular, the k=0/A=0 cases of regularization are valid; the smoothed theorem does not secretly assume a growth bound; the Fatou step uses a nonnegative integrand; unsmoothing derives its uniform bound before using it; the counting bridge uses the ordinary transform and gives 1/a; and the dyadic counterexample's signs and two subsequence limits are correct. All standing hypotheses needed by these signatures occur explicitly; there is no silently dropped section hypothesis after `end Laplace`.

Read the exact pinned GitHub files for the cited APIs. The relevant witnesses include:

| Pinned API | File and line at the required commit |
| --- | --- |
| TauCeti.summatory; summatory_nonneg; summatory_mono; eventually_summatory_sub_eq | `TauCeti/Order/Northcott/Basic.lean:102`, `155`, `164`, `177` at a91d3aaf |
| Laurent decomposition | `TauCeti/Analysis/Contour/MeromorphicLaurent.lean:223` at a91d3aaf |
| Sine integral and sinc improper limit | `TauCeti/Analysis/Contour/WorkedExamples/HalfDisc/SineIntegral.lean:339`, `357` at a91d3aaf |
| Wiener–Ikehara and zero-residue version | `TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean:301`, `334` at a91d3aaf |
| Eventually nonnegative, natural cutoff, positive-abscissa variants | `TauCeti/NumberTheory/LSeries/WienerIkehara/Variants.lean:60`, `120`, `135` at a91d3aaf |
| LSeriesHasSum; convolution | `Mathlib/NumberTheory/LSeries/Basic.lean:217`; `Mathlib/NumberTheory/LSeries/Convolution.lean:139` at 6b7abb3c |
| AnalyticAt; AnalyticOnNhd; identity theorem | `Mathlib/Analysis/Analytic/Basic.lean:110`, `120`; `Mathlib/Analysis/Analytic/Uniqueness.lean:223` at 6b7abb3c |
| Exponential half-line integral and convergence | `Mathlib/Analysis/SpecialFunctions/ImproperIntegrals.lean:63`, `87` at 6b7abb3c |
| Real Gamma convergence, factorial, scaled integral | `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:66`, `422`, `465` at 6b7abb3c |
| sinc and its bound/continuity | `Mathlib/Analysis/SpecialFunctions/Trigonometric/Sinc.lean:37`, `56`, `85` at 6b7abb3c |
| Riemann–Lebesgue | `Mathlib/Analysis/Fourier/RiemannLebesgueLemma.lean:206` at 6b7abb3c |
| Removable singularity | `Mathlib/Analysis/Complex/RemovableSingularity.lean:35` at 6b7abb3c |
| ζ continuation, series, residue | `Mathlib/NumberTheory/LSeries/RiemannZeta.lean:145`, `206`, `241` at 6b7abb3c |
| Absolute convergence of complex p-series | `Mathlib/Analysis/PSeriesComplex.lean:25` at 6b7abb3c |
| ArithmeticFunction identities | `Mathlib/NumberTheory/ArithmeticFunction/Misc.lean:127`, `178`, `195` at 6b7abb3c |
| Geometric series | `Mathlib/Analysis/SpecificLimits/Normed.lean:473` at 6b7abb3c |
| Dominated convergence; integral_tsum | `Mathlib/MeasureTheory/Integral/DominatedConvergence.lean:67`, `88` at 6b7abb3c |
| Fubini | `Mathlib/MeasureTheory/Integral/Prod.lean:478` at 6b7abb3c |
| Fatou | `Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean:216` at 6b7abb3c |
| Differentiation under the integral | `Mathlib/Analysis/Calculus/ParametricIntegral.lean:286` at 6b7abb3c |
| Half-line dilation | `Mathlib/MeasureTheory/Integral/IntegralEqImproper.lean:1208` at 6b7abb3c |

The parent already supplies simple-pole counting, and the package identifies that ownership. The read pinned sinc files supply the unsquared function and finite-measure integrability, not the squared-kernel mass or triangle identity. The reviewed Wiener–Ikehara approximation file uses Schwartz approximations, not a duplicate squaredSinc definition. HasLaplace is absent from the pinned Mathlib LaplaceTransform path; the public upstream source is a shape reference, not a permitted import. Searches were followed by reading the relevant files at the pins.

The package diff is confined to its folder: README.md (1099 lines), Suggested.lean (369), metadata.toml (1), review.json (8). There is one `import Mathlib`, no `set_option`, no `lemma` declaration, no admitted data, no `True` placeholder, no computational algorithm, and no conclusion hidden in its own hypothesis. The only additional file written to the checkout by this review is this report; scratch notes are outside the package. No Lean command or remote write was run.

Mechanical dependency check, run on the unchanged README with the supplied name and order:

```text
depcheck: 4 roadmaps, 21 edges, 0 problem(s)
```

There were no UPWARD or CYCLE lines. The roadmap is absent from the current ORDER.txt; the checker handles the insertion position, so absence alone is not a finding.

Locations below are relative to `packages/ArithmeticDirichletSeriesPartII/`. All tests are mathematical inspection, not Lean execution. “Sound” means the stated assertion survived these instances and the proof-plan audit, not that an admitted Lean proof was certified.

### Every bold README target

| Target; README line | Instances tried and mathematical result | Change |
| --- | --- | --- |
| HP.0.1 HasLaplace; 229 | E=ℂ; zero, constant 1, t²; s=0 excluded for 1; μ=0 makes value 0. Arbitrary complex action exposes the zero-Check issue, not a defect of the predicate. | R07, R08 for accompanying prose |
| HP.0.2 PoleBoundary; 292 | F=0,A=0 permits all k; A≠0 rejects zero. Model poles at a=0 and a<0 work. Boundary values can be changed arbitrarily; dyadic extra poles fail away. | None to definition |
| HP.1.1 squaredSinc; 388 | λ=1,2; v=0,π/λ; λ=0 gives zero, λ<0 negative kernel (excluded from probability claims). Triangle area=2λ, giving K(0)=λ/π. | R01/R04 tests |
| HP.1.2 delangeWeight; 454 | k=0,1,2,3; t=0 and t<0; substitution gives t^k w_k=Γ_lower(k+1,t)/k! for t>0. Positive, bounded normalized weight and fixed/uniform shifts follow. | R01/R04 tests |
| HP.2.1 integerGammaLaplace; 536 | a=-1,0,2; k=0,1,2; s=a+1+i. Exponential integrability and integration by parts give k!/(s-a)^(k+1). Boundary s=a is correctly excluded. | None |
| HP.2.2 regularizedBoundaryL1; 568 | k=0 analytic remainder; k=1,R=c/(s-a) logarithmic boundary; F=model gives zero remainder; A=0 and negative A allowed. u^k removes every nonintegrable power for j≤k. | None |
| HP.2.3 delangeSmoothedLimit; 630 | α=0,A=0; α=e^(at)t^k,A=k!; smaller-order α encoded with A=0. Fatou applies to α-part only; signed β-part is bounded after weighting. | Remove non-Check at 698, R04 |
| HP.3.1 monotoneUnsmoothing; 717 | C=0, constant weighted model; oscillation above the chosen bandwidth defeats one-bandwidth variant. Monotonicity bounds J before tail removal. | R04 negative-control theorem |
| HP.3.2 delangeLaplace; 764 | k=0,1,2,3; model A=k! gives ratio 1. Nonnegative α with A>0 and a>0 retains nonvacuous assumptions. Endpoint α(0) has no effect. | None |
| HP.4.1 logSummatory_hasLaplace; 815 | c=δ₁ gives 1/s; δ₂ gives 2^(-s)/s; arbitrary c₀ ignored; s=0 fails even for δ₁. Absolute summability is justified by unconditional HasSum in ℂ. | R04 endpoint/unit mirrors |
| HP.4.2 delangeDirichlet; 858 | c=1,σ₀,d₄ gives constants 1,1,1/6. c₀ ignored; positive residue excludes zero sequence. | R03 arithmetic source description |
| HP.4.3 delangeDirichlet_positiveAbscissa; 888 | a=1,2; c=n gives 1/2; c=1/n,a=0 gives logarithmic growth, excluded. Dividing F by s preserves order exactly because a>0. | R04 negative control |
| HP.4.4 finiteChange_asymptotic; 926 | Empty change set; only c₀ changed; +7 at 1; arbitrary signed finite support. Difference is eventually constant; scale diverges for a>0. | None |
| HP.4.5 lowerPole_perturbation; 948 | k=1,l=0, b=1, signed ±1 errors; strict l<k gives log-decay. Equal orders with c=1,d=2,b=1 change limit from 1 to 2. k=0 has no admissible l. | R04 negative control |
| HP.5.1 zetaSquare_counting; 991 | d(0)=0,d(1)=1,d(4)=3; convolution gives ζ²; residue numerator squares to 1. No use of totalized LSeries boundary values. | R01/R04 tests |
| HP.5.2 dyadicLocalPoleCounterexample; 1027 | j=0,1,2,3 gives sums 1,3,7,15; at 3·2^j sums 3,7,15,31. Limits 2 and 4/3 differ; derivative of denominator at 1 is +log 2. | None |

### Every explicit Lean declaration

All are inside `TauCetiRoadmap.ArithmeticDirichletSeriesPartII`, in a noncomputable section. Only HasLaplace uses the section variables at line 48; that section ends at line 58. Subsequent hypotheses are explicit in each signature. Standard instances on ℝ, ℂ and ℕ are fixed; every summatory occurrence uses northcott_natId. There are no hidden standing CompleteSpace, positivity or monotonicity assumptions.

| Suggested.lean line; declaration | Layer and binder/instance context | Instances; result; change |
| --- | --- | --- |
| 41 northcott_natId | Before HP.0, owned HP.4; no free parameters | b=0 gives {0}; b=2 gives {0,1,2}; finite_Iic supplies body. Sound. |
| 54 HasLaplace | HP.0; universe-polymorphic E, NormedAddCommGroup E, NormedSpace ℝ E, SMul ℂ E; f,s,z,μ | Standard complex action and pathological constant action; definition matches source shape. R07 concerns Check. |
| 61 constant example | HP.0; s:ℂ, 0<s.re | s=1,2,i+1; integral 1/s. Sound assertion; R01. |
| 65 quadratic example | HP.0; s:ℂ, 0<s.re | s=1 gives 2, s=2 gives 1/4. Sound assertion; R01. |
| 71 nonintegrable example | HP.0; closed ℂ statement | s=0 gives constant integrand; totalized integral 0 does not imply Integrable. R01. |
| 80 PoleBoundary | HP.0; F:ℂ→ℂ,a A:ℝ,k:ℕ; three explicit Prop fields | A=0, arbitrary line values, model and dyadic poles; sound. |
| 93 model example | HP.0; a A:ℝ,k:ℕ; no positivity | A=0 and a<0 allowed; away germs rational and regular; R01. |
| 98 boundary-update example | HP.0; closed statement | Update at pole changes no half-plane agreement; R01. |
| 103 wrong-leading example | HP.0; closed statement | Multiply by s-1 and take right limit, 1≠2; R01. |
| 109 dyadic example | HP.0; closed statement | Approach 1+2πi/log2 from right; unbounded, no away germ; R01. |
| 118 squaredSinc | HP.1; ell,v:ℝ | ell=0,-1 and v=0,π; total body coherent. |
| 122 origin example | HP.1; ell>0 | sinc0=1 gives ell/π; R01. |
| 126 first-zero example | HP.1; ell>0 | sincπ=0; division valid from ell>0; R01. |
| 130 squaredSinc_mass | HP.1; ell>0 | ell=1,2; change variable cancels ell; sound. |
| 135 squaredSinc_fourier | HP.1; ell>0,v:ℝ | v=0 triangle area; v=π/ell zero; v sign reversed leaves even real result; sound. |
| 144 delangeWeight | HP.1; k:ℕ,t:ℝ | k=0,2; t=0,-1; real factorial nonzero; sound. |
| 148 simple-weight example | HP.1; all t:ℝ | t=0 gives 0=0, t=-1 gives 1-e; sound; R01. |
| 153 triple-weight example | HP.1; all t:ℝ | t=0 and negative t; two integrations by parts preserve factorial 2; sound; R01. |
| 157 delangeWeight_normalization | HP.1; all k:ℕ | k=0,1,2; gamma integral gives limit 1; sound. |
| 162 delangeWeight_shift | HP.1; k:ℕ,h:ℝ | h=0,±1; denominators eventually positive, ratio→1; sound. |
| 170 integerGammaLaplace | HP.2; k:ℕ,a:ℝ,s:ℂ,a<s.re | a=0,-1,2; k=0,1,2; sound. |
| 179 regularizedBoundaryL1 | HP.2; F,a,A,k; PoleBoundary, no positivity | k=0 and order-k remainder, A=0; local L1 majorant exists. No misplaced instance. |
| 192 delangeSmoothedLimit | HP.2; α,F,a,A,k; a>0, monotone/nonnegative α, all-half-plane HasLaplace, PoleBoundary; ell>0 | α=0,A=0 and gamma model; both integrability and limit retained; sound. |
| 207 monotoneUnsmoothing | HP.3; α,a,C,k; a>0,C≥0, monotone/nonnegative α; integrability and limit for every ell>0 | C=0; high-frequency oscillation defeats weakening to one ell; sound. |
| 223 delangeLaplace | HP.3; α,F,a,A,k; a>0,A>0, monotone/nonnegative α, half-plane HasLaplace, PoleBoundary | k=0,1,2,3 gamma models; all hypotheses explicit; sound. |
| 237 logSummatory_hasLaplace | HP.4; c,F,s; c≥0, s.re>0, LSeriesHasSum at s | δ₁,δ₂, c₀≠0; includes integrability, monotonicity and α0; sound. |
| 248 endpoint example | HP.4; arbitrary c:ℕ→ℝ | Signed c₁,c₂ and arbitrary c₀; inclusive count c₁+c₂; sound; R01. |
| 256 delangeDirichlet | HP.4; c,F,A,k; c≥0,A>0, half-plane LSeriesHasSum, PoleBoundary at 1 | ones,σ₀,d₄; correct scales and constants; sound. |
| 267 delangeDirichlet_positiveAbscissa | HP.4; c,F,a,A,k; c≥0,a>0,A>0, half-plane LSeriesHasSum, PoleBoundary | a=2,c=n gives 1/2; a=0 excluded; sound. |
| 278 abscissa-two example | HP.4; closed; rpow exponent explicitly real 2 | Finite sum N(N+1)/2; limit 1/2; sound; R01. |
| 284 finiteChange_asymptotic | HP.4; c,d,a,C,k; a>0, cofinite agreement, asymptotic of c | Negative modifications, c₀-only change, C=0; conclusion not contained in hypothesis; sound. |
| 296 lowerPole_perturbation | HP.4; c,d,b,G,a,B,C,k,l; a>0,B>0,l<k,b≥0, coefficient bound, majorant convergence/boundary, asymptotic of c | b=1,k=1,l=0; c,d signed; correct majorant and limit; sound. |
| 312 zetaSquare_counting | HP.5; closed conjunction | n=0,1,4; series identity/interior boundary/counting all expressed at full scope; sound. |
| 324 fourfold-divisor example | HP.5; closed, ArithmeticFunction ℕ convolution | d₄(1)=1,d₄(2)=4; pole order4,k=3 gives1/6; sound; R01 promote to named target. |
| 331 insert-one example | HP.5; closed | At X≥1 difference exactly7; dividing by X logX→0; sound; R01. |
| 340 dyadicLocalPoleCounterexample | HP.5; closed, let c,F; all claims explicitly conjoined | j=0,1,2,3 and boundary at1+2πi/log2; correct indicator and two limits; sound. |

### Every README API statement

| Statement; README line | Instances tried; result | Change |
| --- | --- | --- |
| HasLaplace.integrable;253 | μ=0, default measure; exact projection | None |
| HasLaplace.integral_eq;254 | μ=0, default measure; exact projection | None |
| HasLaplace.unique;255 | μ=0 forces both z,z′=0; ordinary equality in general | None |
| HasLaplace.congr_ae;256 | Alter f at 0 under default measure; no transform change | None |
| HasLaplace.add;257 | f=1,g=-1; distributive action explicitly supplied; linearity valid | None |
| HasLaplace.const_smul;259 | c=0,2,i; compatible normed complex scalar action supplied | None |
| HasLaplace.comp_mul_left;261 | f(t)=t,c=2 gives2/s²; Jacobian c⁻¹ correct | None |
| PoleBoundary.congr;317 | Alter all boundary values, including at a; hypotheses unchanged | None |
| PoleBoundary.leading_unique;319 | Model A=1 versus B=2; continuity of numerator rejects discrepancy | None |
| PoleBoundary.order_unique;320 | Zero function has all orders only when A=B=0; both excluded | None |
| PoleBoundary.div_argument;322 | a=2,k=0,A=1 gives coefficient1/2; a=0 excluded | None |
| PoleBoundary.rescale;324 | a=2,k=1 gives A/4 at1; a>0 preserves right half-plane | None |
| PoleBoundary.mul_regular;326 | H=0 and H=s-a; leading coefficient can become0, allowed | None |
| PoleBoundary.mul;328 | Two simple poles give k′=1 (order2); A=0 degeneracy allowed | None |
| squaredSinc_nonneg;408 | ell>0; v=0,π/ell; squared factor nonnegative | None |
| squaredSinc_even;409 | ell negative,zero,positive; sinc even | None |
| squaredSinc_continuous;410 | Removable v=0 point; sinc continuous | None |
| squaredSinc_integrable;411 | O(v⁻²) tails and bounded near0 | None |
| squaredSinc_mass;412 | ell=1,2; mass1; ell=0 correctly excluded | None |
| squaredSinc_fourier;413 | v=0 and first zero; factors2 andπ consistent | None |
| squaredSinc_tail;415 | h>0 fixed; tail bounded2/(π ell h), tends0 | None |
| delangeWeight_continuous;480 | t=0 and negative t; compact parameter integral continuous | None |
| delangeWeight_nonneg;481 | t=0 zero; t>0 positive integral | None |
| delangeWeight_pos;482 | k=0,2 and t>0; factorial and positive integrand | None |
| delangeWeight_normalization;483 | k=0,1,2; lower gamma exhausts k! | None |
| delangeWeight_shift;484 | h=0,±1; eventual positive t+h | None |
| delangeWeight_shift_uniform;485 | H=1, all h∈[-1,1]; t-H→∞ controls both factors | None |
| delangeWeight_bound;487 | t=0, k=0 (0⁰=1), positive t; incomplete integral≤complete integral | None |

### Source locator audit

The 15 rows count locator groups, not each repeated citation. All four cited works were fetched through the sources service. No mathematical passage was copied into this report.

| Source/locator | Extracted-text witness | Result |
| --- | --- | --- |
| Delange standing hypotheses and footnote, p.213 | delange1954 lines24–44 | Nonnegative nondecreasing α, ordinary transform and a>0; constant shift note |
| Delange §§3.1–3.2, pp.220–221 | delange1954 lines277–328 | Weight and fixed-shift limit |
| Delange §3.3.1, pp.221–222 | delange1954 lines329–354 | Derivative-weight regularization and Laplace representation |
| Delange §3.3.2, pp.222–224 | delange1954 lines355–427 | Boundary control; the roadmap's specialized logarithmic estimate is a derivation |
| Delange §§3.3.3–3.3.5, pp.224–226 | delange1954 lines428–514 | Fourier smoothing, positivity, πA normalization |
| Delange §§3.4.1–3.4.2, pp.227–228 | delange1954 lines517–568 | Bound, upper/lower comparison, bandwidth before window limit |
| Delange §4.1, pp.228–229 | delange1954 lines569–604 | Holomorphic boundary case bypasses general boundary lemmas |
| Delange Lemma3, pp.231–232 | delange1954 lines673–707 | Cutoff Abelian asymptotic; cutoff1 for pure integer power follows independently |
| Delange Lemma4 and its proof, p.233 | delange1954 lines712–736 | Lemma itself concerns a truncated integral plus entire correction; full gamma identity is explicitly in its proof, lines719–722 |
| Delange TheoremIII, pp.235–236 | delange1954 lines817–834 | Holomorphic away from a, local singular form, gamma normalization |
| Delange TheoremIII proof, pp.236–238 | delange1954 lines835–921 | Model, leading sign, p=0 and polynomial weight for ω≥1 |
| Delange §5.3 second remark, p.242 | delange1954 lines1046–1058 | Local singularity alone supplies order of magnitude, not asymptotic |
| Wood §7, pp.415–417 | wood2019 lines1586–1707 | Pole/order and perturbation applications supported, group notation repaired by R03 |
| GMR §§4.1,4.3, pp.790–791,796–797 | gmr2019 lines1890–1946,2167–2209 | Laplace/resolvent and boundary shape; consumer handles uniformity. Add locator, R05 |
| Osele Laplace source, definitions/API | osele-laplace lines71–74,115–127,204–207 | Shape agrees, including optional measure; zero API explicitly requires SMulZeroClass |

### Every README Check bullet

47 bullets reviewed, including repetitions; 46 have mathematical content. None is a proved Lean example in this package. General theorem specializations are distinguished from explicit examples.

| README line and Check | Mathematical test and Lean status |
| --- | --- |
| 278: HasLaplace_test_zero | False at generic SMul scope; R07. No mirror. |
| 280: HasLaplace_test_constant | 1/s; admitted example61. |
| 282: HasLaplace_test_quadratic | 2/s³; admitted example65. |
| 286: HasLaplace_test_nonintegrable | Nonintegrable at0; admitted example71. |
| 351: PoleBoundary_test_model | Constant analytic numerator; admitted example93. |
| 354: PoleBoundary_test_wrong_leading | Right-limit numerator1≠2; admitted example103. |
| 356: PoleBoundary_test_boundary_value | Agreement only on open half-plane; admitted example98. |
| 358: PoleBoundary_test_dyadic | Extra poles reject away; admitted example109. |
| 362: PoleBoundary_test_zero_not_exact | Zero numerator forces A=0. No mirror. |
| 445: squaredSinc_test_origin | λ/π; admitted example122. |
| 447: squaredSinc_test_zero | sinπ=0; admitted example126. |
| 450: squaredSinc_test_mass_two | Scale cancels; mass1. General theorem130, no example. |
| 510: delangeWeight_test_origin | t factor gives0; distinguishes singular naive weight. No mirror. |
| 511: delangeWeight_test_simple | 1-exp(-t) for all real t; admitted example148. |
| 512: delangeWeight_test_double | Integration by parts, including t=0; no mirror. |
| 513: delangeWeight_test_triple | Factor2! correct, including t<0; admitted example153. |
| 562: k = 0 | Gamma k=0:1/(s-a); theorem170 specialization, no example. |
| 563: k = 1 | Gamma k=1:1/(s-a)²; theorem170 specialization, no example. |
| 564: `a = 0`, `k = 2` | Gamma k=2:2/s³; admitted example65. |
| 622: A remaining pole of order `j ≤ k` produces at most a logarithmic singularity in  | Principal-log primitive differentiates to u/(u+iy)²; integrable log growth. No mirror. |
| 626: For the model `F = A/(s − a)^(k+1)` the remainder `R` is `0`, so `H = 0` and `b  | R=0 identically, derivative0. No mirror. |
| 695: The model itself | Model A=k! yields normalized limit1. No mirror. |
| 698: The statement assumes no growth bound | No mathematical Check; repeats absence of a hypothesis. R04. |
| 754: One bandwidth is not enough | Frequency3λ lies outside triangle support; α monotone for stated ε and large t. No mirror. |
| 760: C = 0 | C=0 gives little-o; theorem207 specialization, no example. |
| 789: k = 0 | k=0 constantA; theorem223 specialization, no example. |
| 790: k = 1 | k=1 coefficientA; theorem223 specialization, no example. |
| 791: The model `α(t) = e^(at) tᵏ`, with `A = k!`, gives the limit `1`. | A=k! gives1; theorem223 specialization, no example. |
| 848: logSummatory_test_initial | Cutoff1 excludes0-weight, includes1; no general proved mirror. |
| 849: logSummatory_test_unit_mass | δ₁ gives α=1 and transform1/s. No mirror of coefficient specialization. |
| 851: logSummatory_test_endpoint | exp(log2)=2, sum c₁+c₂; admitted example248. |
| 852: `Re s > 0` cannot be dropped | s=0 gives divergent Laplace integral; example71 tests its analytic part only. |
| 881: counting_test_ones | Natural-floor ratio→1. No mirror. |
| 884: The divisor function, `k = 1` | Divisor asymptotic1; named theorem312. |
| 912: counting_test_abscissa_two | N(N+1)/2 divided by X²→1/2; admitted example278. |
| 915: At `a = 1` the statement is HP.4.2. | Specialization a=1 agrees; general signature267, no example. |
| 916: At `k = 0` the constant `A/a` is the constant `κ/σ` of the parent's positive-abs | 1/(a·0!)=1/a matches pinned parent constant; comparison only. |
| 918: `a = 0` is excluded (negative control) | Harmonic sum~logX at a=0; no mirror. |
| 943: counting_test_insert_one | Difference7 eventually; admitted example331. |
| 968: The inequality `l < k` is strict | Choose c=b=1,d=2,k=l=0,C=1; limit doubles. No mirror. |
| 970: A perturbation known only to have a local pole is not covered | Dyadic extra poles defeat counting asymptotic; named theorem340. |
| 1017: counting_test_divisors_four | Divisors of4={1,2,4}; standalone library calculation, no mirror. |
| 1018: counting_test_insert_one | Same as943; admitted example331. |
| 1019: counting_test_ones | Same as881; no mirror. |
| 1020: counting_test_divisor_fourfold | Fourfold convolution has order4 and constant1/6; admitted example324. |
| 1058: First values | Finite geometric sums 1,3,7,15 and 3,7,15,31 give displayed ratios. No finite-value mirror. |
| 1061: `1/log 2 ≈ 1.4427` lies strictly between the two limit points. | 4/3<1/log2<2; approximate1.4427. No mirror. |

## Not verifiable

- Lean elaboration and proof execution: prohibited by the read-only brief. The missing import is independently established by the pinned file lookup; theorem truth and the proposed simple proof snippets were inspected mathematically, not compiled. No `#check` output is claimed.
- Exhaustive absence of duplication throughout both entire pinned libraries: GitHub object searches and relevant pinned modules were inspected, not a complete local checkout of every library file. No unsupported assertion of global absence is used as a finding.
- `ArithmeticStatistics, Layer ST.3` and `SieveMethodsAndPrimePatterns`: no corresponding roadmap head is among the supplied main/completed or three sibling inputs, so their claimed outgoing ownership cannot be certified. They are not used as inputs in the proof plans; no dependency violation is inferred from these unavailable consumer descriptions.
- The full consumer uniformity argument in Gamburd–Magee–Ronan is outside this package; the inspected source supports the Laplace/resolvent and boundary-continuation description only. The roadmap correctly leaves uniformity to the consumer.

No mathematical reference remains missing: the initial GMR landing-page failure was resolved with the publisher's open PDF, and the initial GitHub landing-page failure with the legally available source text. `needs-references.toml` has no unresolved entries.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "cbd12a66a3cb44622d51e2380c4611a368e70623", "job": "RT-ArithmeticDirichletSeriesPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
