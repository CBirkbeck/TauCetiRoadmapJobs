<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/172#issuecomment-6317665170 -->
Red team round 1 pass a (codex) of 2f2905f

Verdict: needs_changes

1. **F01** (P2) Implementation pins disagree with the repository pins

   - **Location:** `packages/ProbabilisticAndMetricNumberTheory/README.md:17`, “Use Mathlib `082e2d37…` and Tau Ceti `f7904748…` as implementation pins”; bibliography lines 6353–6465.
   - **Claim:** These are the implementation baseline and support the cited native APIs.
   - **Witness:** `lake-manifest.json` pins Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
   - **Exact repair text:** “The implementation baseline is Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, as recorded in the repository manifest.” Update all native-source links and recheck their declarations at those revisions.

2. **F02** (P1) Kubilius proof requires an unowned sieve input

   - **Location:** `packages/ProbabilisticAndMetricNumberTheory/README.md:1633`, “derive it from the fundamental-lemma/small-prime estimate”.
   - **Claim:** The exponential total-variation comparison has a proof supported by the listed prerequisites.
   - **Witness:** The only listed inputs at lines 1637–1638 are geometric laws, prime cutoffs and §0.5; §0.5 expressly disclaims a general growing-prime theorem at lines 633–634. No fundamental-lemma target or declared gap is provided.
   - **Exact repair text:** “Before `kubilius_small_prime_model`, prove the uniform small-prime sieve estimate needed for the full valuation-vector total-variation bound, with its parameter range and error stated explicitly.” Supply its actual inequality, source locator and prerequisite chain, or import an exact current supplier target through a declared contract.

3. **F03** (P1) Restricted-family concentration is explicitly missing

   - **Location:** `packages/ProbabilisticAndMetricNumberTheory/README.md:2146`, “A quantitative concentration estimate conditional on this restricted family is a separate missing input.”
   - **Claim:** `restricted_squarefree_window` follows from the specified proof plan and §1.5.
   - **Witness:** Lines 2147–2150 say ordinary Erdős–Kac supplies neither the center nor the relative tail, yet §1.5 is the sole prerequisite. There is no named conditional concentration target or declared gap.
   - **Exact repair text:** “Add a preceding target establishing the conditional prime-factor concentration estimate for D(N), with center (1/2)log log N and the quantitative exceptional fraction used here; derive `restricted_squarefree_window` by summing its disjoint slices.” State the estimate and its own analytic prerequisites rather than listing ordinary Erdős–Kac as its supplier.

4. **F04** (P1) Orbit-limit measurability omits measurability of the observable

   - **Location:** `packages/ProbabilisticAndMetricNumberTheory/README.md:4606`, “For measurable T and real f, orbitLimit(T,f,·) is measurable.”
   - **Claim:** Measurability follows from measurability of the transformation alone.
   - **Witness:** Take the Borel real line, T=id, and f the indicator of a non-Borel subset. Every orbit average with positive index equals f, so orbitLimit=f is not measurable.
   - **Exact repair text:** “For measurable T and measurable f:Ω→ℝ, orbitLimit(T,f,·) is measurable.” Add the identity transformation with a nonmeasurable observable as a negative-control Check; keep the measurable-representative argument for merely integrable observables separate.

5. **F05** (P1) The Gaussian moment-convergence bridge has no target

   - **Location:** `packages/ProbabilisticAndMetricNumberTheory/README.md:2129`, “Gaussian moment-convergence theorem”; also lines 9, 2099 and 2168.
   - **Claim:** Layer 1 supplies weak convergence from convergence of every Gaussian moment.
   - **Witness:** Layer 1 supplies finite moment estimates and normalization but no tightness/uniform-integrability or moment-convergence target. The cited Gaussian moments API gives moments of the limiting law, not convergence of varying laws.
   - **Exact repair text:** “Prove `gaussian_weak_convergence_of_moments`: for probability measures μₙ on ℝ having every absolute moment finite, if every raw moment converges to the corresponding moment of gaussianReal 0 1, then μₙ converges weakly to gaussianReal 0 1.” Give tightness, passage of moments along subsequential limits using higher-moment uniform integrability, and Gaussian determinacy explicit ownership and locators; list this target in the Erdős–Kac prerequisites.

6. **F06** (P1) Logarithmic Elliott cites nonexistent local proof targets

   - **Location:** `packages/ProbabilisticAndMetricNumberTheory/README.md:6194`, “entropy-decrement and modulated short-sum targets of this section”.
   - **Claim:** The finite quantitative theorem needed to deduce corrected logarithmic Elliott has a planned proof chain.
   - **Witness:** Section 5.2 has no entropy-decrement or finite ε,A theorem target. It contains the correlation definition, Chowla, Elliott and the Liouville nontriviality bound; the proof simply invokes source Theorem 1.3.
   - **Exact repair text:** “Before corrected logarithmic Elliott, state Tao's finite quantitative two-point estimate with its ε,A thresholds and uniform character/height hypotheses, and the entropy-decrement targets used to prove it.” Name and locate its actual analytic inputs individually; derive the stated limiting theorem from that finite target.

7. **F07** (P1) The bounded-digit supplier contract is absent from its owner

   - **Location:** `packages/ProbabilisticAndMetricNumberTheory/README.md:75`, supplier subsection “DiophantineApproximationAndTranscendence:DT.0”; consumer at line 5975.
   - **Claim:** The existing supplier owns bounded native partial denominators iff bad approximability.
   - **Witness:** `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:502` is §0.6, not DT.0. Its definition/API at lines 504–506 contains no bounded-partial-denominator equivalence; neither does its Suggested.lean.
   - **Exact repair text:** “Import `BadlyApproximable` from DiophantineApproximationAndTranscendence §0.6. This roadmap proves the bounded-native-partial-denominator characterization for irrational 0<x<1, using that predicate and the native continued-fraction estimates.” Give this new target a source locator and make the bounded-semiorbit theorem depend on it; alternatively register an exact matching supplier gap in both required places.

8. **F08** (P1) Pointwise Birkhoff is replanned despite an earlier owner

   - **Location:** `packages/ProbabilisticAndMetricNumberTheory/README.md:7`, ownership of pointwise convergence; §§4.1–4.3; `packages/ProbabilisticAndMetricNumberTheory/Suggested.lean:502` and `:509`.
   - **Claim:** This package owns and develops the general integrable pointwise theorem and its ergodic specialization.
   - **Witness:** `TauCetiRoadmap/ArithmeticDynamics/README.md:2353` at its supplied head already targets both statements on native probability spaces, with invariant conditional expectation. ArithmeticDynamics precedes this package in the allowed merge order.
   - **Exact repair text:** “ArithmeticDynamics §2.6 supplies pointwise Birkhoff for every integrable real observable, with invariant conditional-expectation limit and the ergodic integral specialization. This roadmap consumes those statements for digit normality, Gauss statistics and homogeneous applications.” Remove the duplicate foundation proof programme and duplicate Suggested signatures; retain only explicitly identified extensions not supplied there.

9. **F09** (P1) Analytic supplier names are not current roadmap contracts

   - **Location:** `packages/ProbabilisticAndMetricNumberTheory/README.md:45` and `:71`, “AnalyticNumberTheory:AN.2” and “ExponentialSumsAndCircleMethod:ES.0”; consumers throughout Layers 1, 2, 3 and 5.
   - **Claim:** The prime estimates, Dirichlet-polynomial estimates, Halász estimates and modulated short sums are supplied by these sections.
   - **Witness:** `merge-order/ORDER.txt:75` and `:76` name AnalyticNumberTheoryPartI and AnalyticNumberTheoryPartII. Neither advertised supplier name/section occurs in the supplied main roadmaps or sibling heads. No matching declared gap exists.
   - **Exact repair text:** “Replace each AN.2, AN.3, AN.5 and ES.0 dependency with the exact current roadmap name, section and target supplying the stated hypotheses.” Where no such target exists, add a precise named target here or a properly registered supplier gap; do not treat the current prose requests as supplied theorems. Re-run depcheck after replacing the names.

10. **F10** (P2) The multiplicative mean bound is reduced to the route-specific case

   - **Location:** `packages/ProbabilisticAndMetricNumberTheory/README.md:3884`, “Only this case is used”; target at line 3888.
   - **Claim:** The required library target is only the prime-power-constant case f(p^ν)=f(p)≥1.
   - **Witness:** KM-2020 lines 1080–1092 state Lemma 7.2 for all multiplicative 0≤f≤τ_k, with a constant depending on k. For example τ₂ satisfies that source hypothesis but is excluded by this package's prime-power condition.
   - **Exact repair text:** “For k≥1 and multiplicative f with 0≤f(n)≤τ_k(n) on positive integers, prove Σ_{1≤n≤x}f(n)≤C_k x exp(Σ_{p≤x}(f(p)−1)/p) for x≥1, with C_k independent of f and x.” Retain the constant-one prime-power-constant estimate as a separate special case, and provide the general theorem's proof inputs and locator.

11. **F11** (P2) The general polynomial headline is missing from Suggested.lean

   - **Location:** `packages/ProbabilisticAndMetricNumberTheory/README.md:2783`; `packages/ProbabilisticAndMetricNumberTheory/Suggested.lean:307`.
   - **Claim:** The polynomial equidistribution criterion is a headline theorem; Suggested records only irrational leading-vector sufficiency.
   - **Witness:** P(n)=n²/2+n√2 on the circle satisfies the README criterion but not the existing Lean leading-coefficient hypothesis. Finite tori, finite coefficient sums and both equidistribution predicates already exist in Suggested.
   - **Exact repair text:** “Add `polynomial_equidistribution_iff`: for finite d, s≥1 and α:ℕ→UnitAddTorus d, equidistribution of n↦Σ_{j≤s}n^j•α_j for torusHaar d is equivalent to ∀k≠0, ∃j∈{1,…,s}, Σ_i k_i•α_j(i)≠0.” Also state its equivalence with total equidistribution using the existing predicate. Keep the leading-coefficient theorem as a sufficient-condition corollary, not the sole signature.

12. **F12** (P3) The required source manifest is absent

   - **Location:** `packages/ProbabilisticAndMetricNumberTheory/` (missing `sources.toml`); README bibliography beginning at line 6347.
   - **Claim:** The package provides traceable legal-source records for its citations.
   - **Witness:** The package contains README.md, Suggested.lean, metadata.toml and review.json, but no sources.toml. Its bibliography names 35 reference IDs, including 21 non-library works; access/version metadata is not recorded in the required schema.
   - **Exact repair text:** “Add sources.toml with schema `tauceti-roadmap-sources/v1`, recording every cited work's bibliographic fields, exact version, locator scheme/locators, cited targets and the sources service's access fields.” Use the current library pins from R01 and include additional primary sources required by the repaired targets.

13. **F13** (P3) Discriminating Checks are omitted from their Lean mirrors

   - **Location:** `packages/ProbabilisticAndMetricNumberTheory/README.md:1585`, strict two-atom concentration Check; `packages/ProbabilisticAndMetricNumberTheory/Suggested.lean:188`. Further instances are listed below.
   - **Claim:** Kept definitions have proved examples testing the stated conventions.
   - **Witness:** Concentration has only a zero-radius example; the identically-zero function passes it. Both transfer operators likewise have only zero-input examples, which an identically-zero operator also passes. The README's positive and negative controls are absent.
   - **Exact repair text:** “Replace or extend the existing examples with at most two proved examples per definition, combining related checks by conjunction. Mirror the following existing README Checks; if a proof needs undeveloped theory, promote that Check to a named theorem target instead of admitting an example.”

   | Definition | Existing README Checks to mirror |
   |---|---|
   | IsAdditive / IsStronglyAdditive | ω and Ω; convolution unit fails additivity; Ω(4)≠Ω(2) fails strong additivity (§0.1). |
   | primeDivisibilitySum | Value at one; unit weights at 12; repeated input prime (§0.2). |
   | concentration | Dirac at positive radius; equal atoms at 0 and 1 with radius 1/2 give 1/2 (§0.12). |
   | starDiscrepancy | Singleton zero gives 1; singleton 1/2 gives 1/2 (§2.7). |
   | IsNormalBase | Zero and 1/2 are not binary-normal (§2.8). |
   | IsDimensionGauge | Square gauge passes; zero gauge fails (§3.8). |
   | gaussMap / gaussDigit | T(2/3)=1/2; digits of 2/3 begin 1,2,0 (§4.4). |
   | gaussMeasure | Total mass and mass of (1/2,1], retaining the log(4/3)/log 2 normalization (§4.4). |
   | gaussCylinder | Zero digit gives empty cylinder; the two ordered length-two cylinders (§4.5). |
   | inverseWord / wordMatrix | Empty word, single digit, and reversed word matrix (§4.5). |
   | IsStrongMixing / IsExact | Fair two-atom identity and the two-point swap fail the specified properties (§4.6). |
   | khinchinConstant | A nonzero logarithmic summand and convergence, not just positivity of exp (§4.7). |
   | gaussDensityTransfer | L(1)(0)=π²/6 and the invariant density (§4.8). |
   | normalizedGaussTransfer | P(1)=1 and P(id)(0)=π²/6−1 (§4.8). |
   | shortMean | Positive constant arithmetic observations give (h+1)/h (§5.1). |
   | logCorrelation | Liouville forms n,n+1 at x=w=2 and 4 (§5.2). |
   | rademacherModel / steinhausModel | Values at one and six; zero extension for Steinhaus (§5.3). |

14. **F14** (P3) An admitted instance violates the Suggested form

   - **Location:** `packages/ProbabilisticAndMetricNumberTheory/Suggested.lean:531`, `instance gaussMeasure_probability : IsProbabilityMeasure gaussMeasure := by sorry`.
   - **Claim:** An admitted instance is part of the signature scaffold.
   - **Witness:** This is explicitly an `instance` whose body is `sorry`; the task permits admitted theorem signatures, not admitted instances. Its proposition is legitimate, so no weakened replacement is needed.
   - **Exact repair text:** “Declare `theorem gaussMeasure_probability : IsProbabilityMeasure gaussMeasure := by sorry`.” At each probability bundle use this theorem explicitly, and use local proof-valued `letI` bindings only where needed for elaboration.

15. **F15** (P3) The mass-transference Checks merely repeat a hypothesis

   - **Location:** `packages/ProbabilisticAndMetricNumberTheory/README.md:4173` and `:4187`, “Radii tend to zero.”
   - **Claim:** These are discriminating Checks for general and power-gauge mass transference.
   - **Witness:** The same sentence is already a hypothesis of each theorem. It tests neither the expanded-ball direction nor the distinction between Lebesgue measure and s-dimensional Hausdorff measure.
   - **Exact repair text:** “Check the power-gauge specialization f(r)=r^s with 0<s<1 and 0<r<1: the expanded radius is r^s>r. Check f(r)=r gives the identity implication. Check that dimension k=0 is excluded before forming 1/k.” For the kept line theorem add a corresponding proved convention example using its actual gauge/radius data, or a named theorem target if unavailable.

16. **F16** (P1) The higher-dimensional proof has no primary proof contract

   - **Location:** `packages/ProbabilisticAndMetricNumberTheory/README.md:4241`, “following Pollington–Vaughan”; sole dependency §3.3.
   - **Claim:** Higher-dimensional coordinatewise reduced Duffin–Schaeffer has a supplied divergence proof.
   - **Witness:** BeresnevichVelani lines 55–60 report the Pollington–Vaughan result; they do not prove it. Section 3.3 only supplies one-dimensional overlaps and generic second-moment estimates, not the required higher-dimensional arithmetic overlap theorem.
   - **Exact repair text:** “Cite Pollington–Vaughan, The k-dimensional Duffin and Schaeffer conjecture, Mathematika 37 (1990), 190–200, DOI 10.1112/S0025579300012900, for the divergence proof. Add its coordinatewise overlap and zero–one/local-full-measure prerequisites as separate targets with exact hypotheses and locators.” Record the primary source's legal-access status in sources.toml.

17. **F17** (P2) The ordinary correlation corollary is narrowed to Liouville

   - **Location:** `packages/ProbabilisticAndMetricNumberTheory/README.md:6199`; `packages/ProbabilisticAndMetricNumberTheory/Suggested.lean:787`.
   - **Claim:** MR Corollary 2 is planned only as `liouville_two_point_nontrivial`.
   - **Witness:** MatomakiRadziwill lines 109–114 give the same every-fixed-shift conclusion for every real completely multiplicative function bounded by one that is negative at some positive integer. The Liouville-only target excludes this source generality.
   - **Exact repair text:** “For real native arithmetic f with f(1)=1, complete multiplicativity, |f(n)|≤1 on positive integers, and f(n₀)<0 for some n₀>0, prove: for each h≥1 there exist δ>0 and X₀ such that X≥X₀ implies |Σ_{1≤n≤X}f(n)f(n+h)|≤(1−δ)X.” Add this easy signature and retain the Liouville statement as its specialization. Keep δ dependent on f and h.

18. **F18** (P3) Process notes and a declaration catalogue remain in deliverables

   - **Location:** `packages/ProbabilisticAndMetricNumberTheory/README.md:3076`, “need source acquisition and declaration matching”; line 3903, “checked on the page image”; `packages/ProbabilisticAndMetricNumberTheory/Suggested.lean:813`.
   - **Claim:** The final roadmap and signature file contain review-workflow notes and a catalogue of omitted definitions.
   - **Witness:** The README records unfinished acquisition work and a past inspection action; the Lean footer lists thirteen omitted interface names instead of statements. Both forms are expressly excluded by the package contract.
   - **Exact repair text:** “Remove the Lean footer catalogue. Replace the Koksma process note with a named integration-by-parts/Stieltjes bridge target and its exact native inputs and locator. Replace the prime-factor-tail inspection note by the mathematical normalization: ‘The decay exponent is t^{exp(c−1)}.’”

19. **F19** (P2) GCD graphs restrict the source's prime metadata to finite sets

   - **Location:** `packages/ProbabilisticAndMetricNumberTheory/README.md:3474`, “𝒫 is finite here; in the source it starts empty and grows by one prime per step, so nothing is lost.”
   - **Claim:** The specific iteration justifies narrowing the general GCD-graph carrier.
   - **Witness:** KM-2020 lines 877–892 allow a set of primes. Take V=W={1}, E={(1,1)}, μ(1)=1, all primes P, and f=g=0. Every source axiom holds; the package excludes this graph.
   - **Exact repair text:** “Allow an arbitrary set of prime metadata in `GCDGraph`. Define quality using the convergent prime product, and prove the finite-product formula for finite metadata.” For nontrivial graphs, show only finitely many exponents can be nonzero and control the remaining product by the convergent reciprocal-prime-power series. Keep a separate finite-metadata specialization for the iteration.

## Verified sound

Read all 6,485 README lines and all 821 Suggested.lean lines, together with the repository README and CONTRIBUTING rules. The running inventories contain **409 labelled target blocks, including 180 bold target headings**, and **123 Lean declarations**: 55 theorems, 31 definitions, 3 instances and 34 proved examples. Each Lean declaration was inventoried with its surrounding section, variables, local instances and signature. No Lean elaboration or build was run.

Read **404 README Check entries**. The finite arithmetic checks made **1,954 assertions**, all passing: exact residue probabilities and their sharp total-variation error; finite prime-pattern comparison; signed-weight second-moment comparison; complete-period CRT laws, including the empty family and modulus one; excess-prime-factor bounds at small arguments; the Gauss derivative coefficient sum; and the two harmonic Liouville normalizations. These finite tests do not prove the quantified targets. Additional boundary cases and negative controls are recorded below and in the statement-by-statement scratch tables.

Verified **68 distinct external-source locators** against accessible text, including their pertinent hypotheses; the full locator inventory records source IDs and extracted line numbers. This count excludes unreadable formulas and is not a count of complete proofs certified. In particular, the package correctly distinguishes strict concentration intervals, keeps the Gauss digit factor a(a+2), uses π²/(12 log 2) for denominator growth, distinguishes normalized and density transfer operators, and corrects the signed derivative issue in the cited quantitative Gauss argument. The native empirical-measure conventions were checked against `TauCeti/Probability/Empirical/Basic.lean` at the repository pin. Native APIs were inspected at the actual pinned revisions, not inferred from the package's older links.

Audited **seven named external supplier-contract entries** (AN.2, AN.3, AN.5, ES.0, DT.0, GN.4 and ArithmeticDirichletSeries), with the availability limits below. Searched all **five supplied sibling heads** for ownership overlap; the relevant positive match is ArithmeticDynamics §2.6 in R08. No explicit citation to one of those five siblings occurs in this package; the missing ownership citation is itself the defect. Main and Completed roadmaps were also searched by mathematical objects.

| Statement family | Instances tried | Result | Change |
|---|---|---|---|
| Additive predicates and finite prime laws | n=0,1,4,12; empty primes; signed weights; repeated prime factors | Positive guards, convolution distinction and finite normalizations survive | R13 supplies missing convention mirrors |
| Residue and CRT laws | N=1…32; d=1…12; q=(4,9); empty family; modulus one | Exact finite assertions pass | None identified |
| Excess moments and concentration | k=0…5; prime powers; δ≤0; Dirac; equal atoms at strict radius 1/2 | Boundary values survive; positive/negative Lean controls missing | R13 |
| Growing-prime comparison and Gaussian limits | Empty cutoff; variance zero; zeroth and fourth moments; restricted squarefree family | No additional counterexample; prerequisite chains incomplete | R02, R03, R05 |
| Torus and polynomial equidistribution | Dimension zero; rational rotation; zero frequency; n²/2+n√2 | General polynomial criterion survives; signature is narrower | R11 |
| Discrepancy and normality | N=0,1; singleton 0 or 1/2; terminating binary expansions | Endpoint values survive; mirrors and BV bridge incomplete | R13, R18 |
| Rational approximation | q=0,1,2; ψ=0; rational points; infinite Catlin supremum | Reducedness and measure-only identification retained | None identified in these boundary cases |
| GCD graphs and prime anatomy | Empty edges; zero mass; p=2,3; τ₂; all-prime metadata with zero exponents | Nontriviality guards retained; two generality restrictions remain | R10, R19 |
| Gauges and mass transference | Zero, identity and square gauges; k=0; r^s>r for 0<s<1 | Gauge direction survives; some Checks repeat hypotheses | R15, R16; source limitation below |
| Pointwise dynamics | Dirac identity; fair two-atom identity; swap; non-Borel indicator | Measurability claim fails without measurable f; earlier owner exists | R04, R08 |
| Gauss digits and words | 0, 1/2, 2/3; empty word; [1,2] versus [2,1]; n=0,1,2 | Endpoints, word order and denominator parity survive | R13, R14 |
| Gauss transfer and limit constants | Zero, one and identity observables; x=0,1; first five derivative contributions | Normalizations survive; coefficient sum is 18913/21600<9/10 | R13 |
| Homogeneous applications | t=0; q=0; x=0; transpose; time rescaling s=2t | Column-lattice signs survive; supplier contracts remain unresolved | R07 and GN.4 limitation below |
| Short intervals and correlations | h=0,1,2; positive constant observation; w=1; x=w=2,4; coincident forms | Inclusive short-mean and harmonic normalization survive | R06, R09, R17 |
| Random multiplicative models | n=0,1,4,6; diagonal/off-diagonal moments; absent independence | Squarefree Rademacher and complete Steinhaus models are distinguished | R13 |

The read-only package diff against origin/main changes only README.md, Suggested.lean, metadata.toml and review.json inside this package. The checked head is `2f2905f`. Suggested has one `import Mathlib`, is below 5,000 lines, and contains no `set_option`, admitted examples or `lemma` declarations. R14 records the admitted instance exception to the required form.

The requested dependency check returned exit status 1 with exactly:

```text
NOT IN ORDER: ProbabilisticAndMetricNumberTheory (insert it after its last supplier)
depcheck: 6 roadmaps, 38 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. The not-in-order diagnostic is not a finding under the brief. This mechanical check does not establish that the named supplier sections exist; R07 and R09 concern that separate obligation.

## Not verifiable

- **Lean elaboration:** prohibited by the read-only review instructions. Signatures, contexts and bodies were inspected, but successful elaboration of this Suggested.lean at the actual repository pins is not certified.
- **GN.4:** the specified GeometryOfNumbersAndQuadraticArithmetic head is not among the locally supplied roadmaps. Its asserted lattice/Haar, Mahler and mixing contracts cannot be matched to current declarations. Its earlier position in the order alone is not treated as proof of a contract, or as a finding that the contract is absent.
- **Current analytic replacements:** AnalyticNumberTheoryPartI and PartII appear in the order, but their heads were not supplied locally. R09 establishes the stale advertised names; this review does not invent replacement section numbers or certify the desired analytic estimates at those heads.
- **PollingtonVaughan1990:** the primary 1990 text needed for R16 was inaccessible through the sources service. A legal 1989 Bordeaux paper by the same authors was obtained, but its formula extraction is incomplete. BeresnevichVelani lines 55–60 verify the attribution, not the primary proof's intermediate hypotheses.
- **RosserSchoenfeld1962, Theorem 5:** the source service's Project Euclid attempts returned a challenge page rather than the paper. The explicit x≥286 error claim in the supplier contract remains unverified. An automatically labelled successful fetch is not counted as source certification.
- **Falconer1990, Proposition 1.7:** the search resolved first to a book review, not the book; an institutional copy request did not finish and was terminated. The measure-extension citation used through the mass-transference source remains unverified.
- **Damaged extraction:** StrauchPorubsky2018 does not yield enough reliable formula text to certify every exact discrepancy constant; Gorodnik2010's OCR does not certify every homogeneous-dynamics locator. The especially ambiguous exponent in KM-2020 Lemma 7.3 was checked mathematically against the surrounding argument, but no independent page-image certification was possible in this pass.
- **Proof depth:** source-statement and prerequisite comparisons do not certify all long GCD-graph, mass-transference or entropy-decrement proofs. Findings identify concrete absent contracts; absence of an additional finding is not a proof of the remaining programme.

All bibliography works were attempted before closing the review. The three unresolved additional texts are consolidated in the scratch `needs-references.toml`; no original waived or uncertified source was reopened. Full declaration/context, target, locator and adversarial-instance tables remain in the review scratch notes. The package's README and Suggested.lean were not edited.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "2f2905f0a7d8d226fbe40b2d944d30bf8ba16ba3", "job": "RT-ProbabilisticAndMetricNumberTheory~1a", "model": "gpt-6-astra", "worker": "chris-1"} -->
