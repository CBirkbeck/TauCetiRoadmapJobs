# ArithmeticDirichletSeriesPartII repair report

Headings F01–F08 refer to review `r1a`; the final F02 refers to review `r1b`. F06 also settles the overlapping findings `r1b.F01` and `r1b.F03`. Changes concern `packages/ArithmeticDirichletSeriesPartII/README.md`, `packages/ArithmeticDirichletSeriesPartII/Suggested.lean`, and `packages/ArithmeticDirichletSeriesPartII/sources.toml`.

## F01 (P3) — applied

Fifteen admitted examples → five proved definition examples, with at most two per definition; the other checks become named theorem targets. The original count was fifteen, rather than sixteen, but the defect holds. `counting_test_divisor_fourfold` now states the series, boundary predicate and limit. The claim that every proof is admitted is deleted.

## F02 (P1) — applied

Nonexistent `TauCeti.Order.Northcott` → `TauCeti.Order.Northcott.Basic`. Supplier pins → Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`, matching `lake-manifest.json`. The obsolete alternative locator is deleted. The pinned `TauCeti/Order/Northcott/Basic.lean:102` defines the consumed summatory function; its targeted build and the repaired signatures elaborate successfully.

## F03 (P2) — applied

Target group `C₂^r` → `C₂^(r+1)`, with inertia intersecting `C₂^r × {1}` trivially and `r ≥ 1`. The motivation, HP.4.2 citation, HP.4 examples and HP.5.1 check use this convention. Evidence: wood2019 line 1586, line 1636, line 1652 and line 1692. For `r = 2`, the target is `C₂³` and the pole order is four.

## F04 (P3) — applied differently

Missing checks → proved definition examples or named theorem targets, including Gamma specializations, zero/logarithmic regularized remainders, smoothed model, one-bandwidth failure, harmonic abscissa-zero control, equal pole orders, endpoints and dyadic values. The divisor-at-four calculation becomes mathematical background. The non-check about an absent growth hypothesis is deleted. API names previously present only in a catalogue receive signatures.

## F05 (P3) — applied

Missing manifest → four certified source entries fetched through the sources service, with bibliographic fields and actual provenance/hash metadata. GMR's unlocated consumer citation → §4.1, equation (4.4), pp. 790–791, and §4.3, pp. 796–797. Evidence: gmr2019 line 1908, line 1944, line 2195 and line 2202. Uniformity remains a consumer obligation.

## F06 (P3) — applied

Process references, stale active-parent links and the trailing Lean name catalogue → timeless author-source attribution, completed-parent links and actual API signatures. The parent supplier heading now links the completed specification. “Current” is deleted. Evidence: `Completed/ArithmeticDirichletSeries/README.md:227`, `:337`, `:353`; osele-laplace line 125 identifies the predicate and line 115 its hypotheses.

## F07 (P2) — applied

Zero-transform check under an arbitrary complex action → check with `[SMulZeroClass ℂ E]`, every measure and every parameter. The definition retains its weaker `[SMul ℂ E]`. The proved example simplifies its integrand to zero. Without zero preservation, the action `z • x = 1` on `ℝ` gives a nonintegrable constant integrand for the default measure.

## F08 (P2) — applied

Arbitrary-function Stieltjes comparison → the ordinary transform identity for nonnegative coefficient counting functions in HP.4.1. A bounded oscillatory function `sin(1/t²)` on positive times has an ordinary transform on `Re s > 0` but infinite variation near zero; alternating extrema witness this. Negative-time vanishing cannot supply a locally finite Stieltjes measure. No general comparison is retained.

## F02 (P3) — not actionable in this package: assigning an earlier consumer requires an external supply-order decision

Deleted the nonexistent `ST.3` attribution; retained the conditional analytic application. The supplied order actually lists ArithmeticStatistics at line 86, contrary to that part of the witness, and ArithmeticStatisticsPartV at line 100. Declaring PartV a consumer would require an external ordering/ownership decision. Its proposed §3.27 was unavailable in the supplied checkouts; no replacement ownership claim is certified here.

## Gate repairs

| Reported failure | Change and result |
| --- | --- |
| Missing `sources.toml` | Added `tauceti-roadmap-sources/v1` with four legally fetched, certified works. Every entry has id, authors, title, year, locator scheme, locator, cited-for and service provenance. Source check: zero problems. |
| `tex=2` | Replaced the nested display's TeX bounds by Unicode/plain interval notation `∫[−2λ, 2λ]`. Same integrand and interval; `tex=0`, `latex=0`. |
| `sorry-examples=15` | Five retained examples are proved directly; future mathematical checks are named theorem targets. `sorry-examples=0`. |
| Invalid import | Imported only `Mathlib` and the used, existing `TauCeti.Order.Northcott.Basic`; `imports=0`. |
| Twelve missing README identifiers | `HasLaplace.integral_eq` is an actual projection theorem; the zero check is proved; the missing PoleBoundary, kernel and weight checks/APIs receive signatures. Removing the old catalogue exposed further API-only names, which also receive actual signatures. `readme-ids-missing=0`; `check-labels-missing=0`. |

## Source and ownership verification

All four works were fetched with the sources service. The manifest preserves the service's fetched URL, retrieval time, SHA-256, licence class and certified status; bibliographic author/title/year fields were completed separately. No mathematical source is outstanding.

| Work | Read evidence and use |
| --- | --- |
| delange1954 | line 24: standing hypotheses; line 278 and line 329: weight and regularized transform; line 489: triangle and smoothing; line 517 and line 537: two-sided monotone argument and derived bound; line 673: cutoff lemma; line 719: full half-line Gamma identity; line 817: Theorem III; line 871: positivity; line 887: remainder; line 1046: local-pole-only limitation. |
| wood2019 | line 1586: group convention; line 1636 and line 1652: counted homomorphisms; line 1692: pole order and asymptotic; line 1695: trivial homomorphism; line 1698: smaller-group bound. |
| gmr2019 | line 1908: Laplace convention; line 1944: resolvent identity; line 2195: local pole decomposition; line 2202: continuation elsewhere on the boundary; line 2205: separate uniform conclusion. |
| osele-laplace | line 6: author/year/licence; line 115: weak scalar-action hypotheses; line 125: predicate; line 147 and line 153: zero-preserving action; line 192: additive API. |

Read the completed parent's Layers 4.2, 9 and 9.2, the archived-parent references in ImaginaryQuadraticClassNumber and TauberianBoundaryConvergence, and OneParameterSemigroups' Part B to distinguish function transforms from positive-measure transforms. Searched the nine supplied open sibling checkouts for the relevant transform, kernel, Delange and higher-pole objects; no overlapping supplier target was identified. The unavailable proposed PartV section is not treated as evidence.

At the pins, the consumed summatory, analytic, exponential-integral, Gamma, sinc, zeta, convolution, Fourier-limit and Wiener–Ikehara APIs were searched by object and their relevant statements inspected. No pinned one-sided function-transform predicate, Delange weight or real squared-sinc probability-kernel API was found. Bochner's Fejér overlap averages and the Wiener–Ikehara Schwartz approximations concern different objects. Existing simple-pole counting remains owned by the completed parent and consumed through Tau Ceti.

No supplier gap is required: the arithmetic construction discussed in r1b.F02 is not a prerequisite of the generic analytic theorem, whose coefficientwise majorant, convergence and boundary assumptions are explicit. No plan, merge-order file, sibling roadmap or metadata was changed.

## Adversarial mathematics pass

“Sound” below means the stated instances and proof argument survive mathematical inspection; named admitted targets remain work for the library. Elaboration is not claimed as a proof of those targets. All needed parameters and typeclasses occur explicitly in signatures; the temporary `Laplace` variable section ends before subsequent declarations.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| `northcott_natId` | Cutoffs 0, 1, 2 | Sublevels are finite initial intervals, including zero. | Kept real body. |
| `HasLaplace` | Zero, one, square; zero measure; pathological scalar action | Integrability is separate from the totalized integral value. Arbitrary actions need not preserve zero. | Definition kept; zero check strengthened. |
| `HasLaplace.integrable` | Zero measure; nonintegrable constant at zero | First conjunct, not a claim that every integral converges. | Actual projection. |
| `HasLaplace.integral_eq` | Zero and constant transforms | Second conjunct fixes the value. | Actual projection. |
| `HasLaplace.unique` | Two values for one integrand | Equality through the same integral. | Actual theorem. |
| `HasLaplace.congr_ae` | Change a single Lebesgue-null endpoint; arbitrary measure | AE equality is with respect to that same measure. | Explicit signature. |
| `HasLaplace.add` | Zero plus one; two exponential models | Distributivity of the complex action supplies the integrand sum. | Explicit `DistribSMul` signature. |
| `HasLaplace.const_smul` | Scalars 0, 1, i | Normed complex action and real-complex scalar tower give linearity. | Explicit action/tower binders. |
| `HasLaplace.comp_mul_left` | Dilations 1 and 2, constant one | Input value `1/(s/2)`, Jacobian `1/2`, output `1/s`; positive dilation is essential. | Explicit signature. |
| `HasLaplace_test_zero` | Every parameter and measure | Zero-preserving action makes integrand and integral zero. | Proved example. |
| `HasLaplace_test_constant` | Parameters 1, 2, 1+i | Ordinary transform is `1/s`. | Proved example. |
| `HasLaplace_test_quadratic` | Parameters 1 and 2 | Values 2 and 1/4 fix the factorial and denominator power. | Named target. |
| `HasLaplace_test_nonintegrable` | Constant one at parameter zero | Infinite half-line measure prevents integrability, despite total integral zero. | Named negative target. |
| `PoleBoundary` | Model; zero numerator; a negative, zero and positive; arbitrary boundary updates | Agreement is only on the open half-plane; nonzero coefficient gives exact successor order. | Definition kept. |
| `PoleBoundary.congr` | Change the function only on the boundary | Interior analyticity is local on an open set; germs are unchanged. | Explicit signature. |
| `PoleBoundary.leading_unique` | Leading coefficients 0, 1, 2 | Identity on the open cap forces equality at its limiting center. | Explicit signature. |
| `PoleBoundary.order_unique` | Simple and double poles; zero coefficient | Distinct orders would force one leading coefficient to vanish. | Both nonzero hypotheses explicit. |
| `PoleBoundary.div_argument` | a=1, 2; excluded a=0 | Coefficients 1 and 1/2; division at zero instead raises order. | Positive-abscissa binder explicit. |
| `PoleBoundary.rescale` | a=2, k=0,1,3 | Numerator factors `1/2`, `1/4`, `1/16`. | Explicit signature. |
| `PoleBoundary.mul_regular` | Regular factors 0, 1, s | A zero factor is allowed because zero leading coefficient permits a lower order. | Closed-half-plane analyticity explicit. |
| `PoleBoundary.mul` | Two simple poles; simple times double; zero coefficient | Orders are 2 and 3, hence indices 1 and 2. | Explicit successor-index signature. |
| `PoleBoundary_test_model` | a=-1,0,2; A=0,1,-1; k=0,1,3 | Constant numerator; away germs exist off the real pole. | Named target. |
| `PoleBoundary_test_boundary_value` | Value 37 at the pole | No agreement on the line is requested. | Named target. |
| `PoleBoundary_test_wrong_leading` | Simple model with requested coefficient 2 | Numerator uniqueness rejects it. | Named negative target. |
| `PoleBoundary_test_dyadic` | First nonreal pole at `1+2πi/log 2` | Interior convergence and local real pole do not supply the away germ. | Named negative target. |
| `PoleBoundary_test_zero_not_exact` | A=1,-1; k=0,2 | A numerator representing zero vanishes on the cap and at the center. | Named negative target; nonzero A explicit. |
| `squaredSinc` | Bandwidths -1,0,1,2; origin and first zero | Total formula is even and continuous; probability claims require positive bandwidth. | Kept definition. |
| `squaredSinc_test_origin` | Bandwidths -1,0,2 | Origin value is bandwidth divided by pi for every real bandwidth. | Proved example; prose matches generality. |
| `squaredSinc_test_zero` | Positive bandwidth 1 and 2 | First zeros pi and pi/2; half-frequency variant fails. | Proved example. |
| `squaredSinc_nonneg` | Positive bandwidth; origin and zeros | Positive prefactor times a square. | Proved theorem. |
| `squaredSinc_even` | v and -v; negative bandwidth | Evenness of sinc survives squaring. | Proved theorem. |
| `squaredSinc_continuous` | v=0; bandwidth=0 | Continuous sinc removes the apparent origin singularity. | Proved theorem. |
| `squaredSinc_integrable` | Bandwidth 1 and 2 | Bounded near zero, bounded by a constant times inverse square outside. | Explicit target. |
| `squaredSinc_mass` | Bandwidth 1 and 2 | Dilation cancels bandwidth; sine-integral normalization gives one. | Kept target. |
| `squaredSinc_fourier` | v=0 and pi/bandwidth | Triangle area is twice bandwidth; first zero fixes frequency endpoint. | Kept target. |
| `squaredSinc_tail` | Fixed windows 1 and 2 | Dilation sends the excluded window to infinity in an integrable density. | Explicit target. |
| `squaredSinc_test_mass_two` | Bandwidth 2 | Total mass one, not two or pi. | Named specialization. |
| `delangeWeight` | k=0,1,2,3; t negative, zero, positive | Total definition, zero at origin, positive only in the asserted positive-time range. | Kept definition. |
| `delangeWeight_test_origin` | All k, including zero | External time factor forces zero. | Proved example. |
| `delangeWeight_continuous` | Time zero and negative times | Compact-interval parameter integral has no division by time. | Explicit target. |
| `delangeWeight_nonneg` | Time zero; positive times | Integral is nonnegative, multiplied by nonnegative time. | Explicit target. |
| `delangeWeight_pos` | k=0,3; positive time | Integrand is positive on the interior of the integration interval. | Explicit target. |
| `delangeWeight_test_simple` | t=-1,0,1 | `1-exp(-t)` has the correct sign and origin value. | Named target. |
| `delangeWeight_test_double` | t=0,1 | First-degree exponential remainder; no factorial error. | Named target. |
| `delangeWeight_test_triple` | t=0,1 | Quadratic remainder carries division by 2. | Named target. |
| `delangeWeight_normalization` | k=0,1,2,3 | Lower Gamma integral divided by k-factorial tends to one. | Kept target. |
| `delangeWeight_shift` | Shifts 0,1,-1 | Eventually positive denominator; polynomial ratio tends to one. | Kept target. |
| `delangeWeight_shift_uniform` | Shift radius 1 and 2 | Both times exceed any fixed threshold once t-H does. | Explicit uniform-epsilon target. |
| `delangeWeight_bound` | Time zero; k=0 and 2 | Lower nonnegative Gamma integral is at most the full factorial. | Explicit target. |
| `integerGammaLaplace` | a=-1,0,2; k=0,1,2; s=a+1+i | Exponential decay and integration by parts give k-factorial. Boundary parameters excluded. | Kept target. |
| `integerGammaLaplace_test_zero` | a=0,2; s=a+1 | Value one, order-one denominator. | Named target. |
| `integerGammaLaplace_test_one` | a=0,2; s=a+2 | Value 1/4, order-two denominator. | Named target. |
| `regularizedBoundaryL1` | k=0; k=1 with simple remainder; exact model; A=0 | Analytic remainder or an integrable logarithmic majorant; no positivity needed. | Kept target. |
| `regularizedBoundary_test_model` | Every a,A,k, including junk boundary values | Exact subtraction makes R, its derivative and H zero. | Proved target. |
| `regularizedBoundary_test_log` | y=1,-1; c=0,1,i | Primitive is `log(u+iy)+iy/(u+iy)`; path avoids the logarithm cut for nonzero y. | Named target with y nonzero. |
| `delangeSmoothedLimit` | Zero function/A=0; Gamma model; k=0,1,3 | Fatou uses only the nonnegative alpha term; bounded model term permits undamping. | Kept target, no growth input. |
| `delangeSmoothedLimit_test_model` | k=0,1,3; bandwidth 1,2 | Normalized Gamma weight tends to one; convolution has mass one. | Named target. |
| `monotoneUnsmoothing` | C=0 and positive; all bandwidths versus one | Local monotone bounds first yield boundedness, then vanishing tails give both limits. | Kept target. |
| `monotoneUnsmoothing_test_one_bandwidth` | Frequency three times bandwidth; small positive oscillation | Frequency lies outside triangle support; early monotone completion is compactly supported error. Unsmoothing has no limit. | Named existential negative control. |
| `monotoneUnsmoothing_test_zero` | Zero function; zero common smoothed limit | Same theorem includes the little-o conclusion. | Named specialization. |
| `delangeLaplace` | k=0,1,2,3; a=1,2; Gamma model | Constant is A divided by k-factorial; no endpoint condition at zero. | Kept headline. |
| `delangeLaplace_test_simple` | k=0 | Polynomial factor disappears and constant is A. | Named specialization. |
| `delangeLaplace_test_double` | k=1 | One power of time, constant A. | Named specialization. |
| `delangeLaplace_test_model` | k=0,1,3; any real a | Ratio is eventually exactly one; time zero's totalized division is irrelevant. | Named target; generality stated. |
| `logSummatory_hasLaplace` | Unit mass at 1 or 2; arbitrary c-zero; s=0 excluded | Values `1/s` and `2^(-s)/s`; absolute convergence justifies termwise integration. | Kept target. |
| `logSummatory_test_initial` | Arbitrary c-zero, c-one | Only positive index one occurs at cutoff one. | Named target. |
| `logSummatory_test_unit_mass` | Time 0 and positive; s=1,2 | Count is one and ordinary transform is `1/s`. | Named target. |
| `logSummatory_test_endpoint` | Arbitrary c-zero,c-one,c-two | Inclusive cutoff gives c-one plus c-two. | Named target. |
| `delangeDirichlet` | Ones; divisor function; fourfold divisors | Constants 1,1,1/6 at log-powers 0,1,3. | Kept headline. |
| `counting_test_ones` | X=1,2 and nonintegral cutoffs; X large | Floor count divided by X tends to one; zeta has the matching boundary germ. | Named series/boundary/limit target. |
| `delangeDirichlet_positiveAbscissa` | a=1,2; k=0,3 | Dividing by s changes the leading coefficient by `1/a`, not pole order. | Kept headline. |
| `counting_test_abscissa_two` | Coefficients n; cutoffs N | `N(N+1)/2` gives limit one-half. | Named target. |
| `counting_test_abscissa_zero` | Coefficients `1/n`, zero coefficient totalized | Harmonic count is asymptotic to log X and diverges; transform gains a second pole. | Named series/boundary/limit negative control. |
| `finiteChange_asymptotic` | Empty modification; index zero only; +7 at one; signed changes | Difference is eventually constant; positive-abscissa scale diverges. | Kept target. |
| `lowerPole_perturbation` | l=0,k=1; signed errors; k=0 | Strict inequality gives decay in log X; no admissible l when k=0. | Kept target. |
| `lowerPole_test_equal_order` | c=b=1,d=2 | Bound holds but limits change from one to two. | Named negative control. |
| `zetaSquare_counting` | d(0)=0,d(1)=1,d(4)=3 | Convolution gives zeta squared; double-pole numerator one gives constant one. | Kept headline. |
| `counting_test_divisor_fourfold` | Pole index 3; d-four(1)=1,d-four(2)=4 | Fourfold convolution has pole order four and constant one-sixth. | Named series/boundary/limit target. |
| `counting_test_insert_one` | +7 at index one | Eventual additive constant divided by X log X vanishes. | Named target. |
| `dyadicLocalPoleCounterexample` | j=0,1,2,3; first additional boundary pole | Geometric-series coefficients are nonnegative; two distinct subsequence limits prevent convergence. | Kept headline. |
| `dyadic_test_values` | Cutoffs 1,2,3,4,6,8,12 | Values 1,3,3,7,7,15,15 match the two exact geometric sums. | Named target. |
| `dyadic_test_residue` | Residue reciprocal log 2 | Strictly between four-thirds and two. | Named target. |
| Pole order and leading coefficient convention | Two simple model poles; zero coefficient | Successor indices add with one extra offset; exactness needs nonzero coefficient. | Kept. |
| Ordinary transform and endpoint convention | Unit mass at n=1; linear coefficients at a=2 | Ordinary transform `1/s`; count constant one-half; endpoint atom included in Stieltjes comparison only for these counting functions. | Arbitrary-function comparison cut. |
| Fourier normalization | Origin triangle area and first sinc zero | Factor `1/(2π)` and support endpoints twice bandwidth agree. Symmetry gives either Fourier sign. | Kept; proved endpoint tests. |
| Weight normalization | k=0,1,2; t=0 | Factorial belongs inside the weight; no artificial division by time at zero. | Kept; origin test proved. |
| Coefficients, real cutoffs and powers | Arbitrary c-zero; X negative, 0,1,2; positive a | Zero coefficient ignored, inclusive real cutoff, eventual positivity of asymptotic denominators. | Kept. |
| Boundary totalization and vacuity | Function updates on the line; missing away germ | Boundary junk values do not matter; local-pole-only hypothesis is insufficient. All transforms and majorants are tied to their actual coefficients. | Kept; named negative controls. |

## Check outcomes

- Targeted prerequisite build, `lake build TauCeti.Order.Northcott.Basic`, from the content checkout: exit 0, `Built TauCeti.Order.Northcott.Basic`; `Build completed successfully (1431 jobs).`
- Required elaboration of `packages/ArithmeticDirichletSeriesPartII/Suggested.lean`, from the content checkout with `lake env lean`: exit 0. Only 61 `declaration uses 'sorry'` warnings, no errors or other warnings. All five examples have actual proofs. The final file has 634 lines.
- Scratch `#check @name` probe: exit 0. Inspected elaborated types of the two scalar-action APIs, three PoleBoundary APIs, regularization, smoothing, unsmoothing, Delange, the counting bridge, both counting theorems, both perturbation theorems and the one-bandwidth control. Required binders were retained; the final stronger no-limit control also elaborates in the required file.
- The installed package text scanner `gates.scan_folder`, the same scanner used by `package_gate`, with configured rules and pinned Tau Ceti sources: exit 0; all package files present. Source validation separately reports zero problems. No tooling was modified.

```text
gate ArithmeticDirichletSeriesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 check-labels-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 OK
Package files: complete
packages/ArithmeticDirichletSeriesPartII/sources.toml: 0 problem(s)
```

The prescribed dependency command, with the supplied name and merge order, exits 0:

```text
depcheck: 10 roadmaps, 79 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. `git diff --check` exits 0. Every named Lean declaration occurs in the README; every named Check is present as a proved example or theorem target.

A separate worktree-style CLI gate expects a `TauCetiRoadmap/` layout, unlike this board's `packages/` layout. Its scratch-layout diagnostic reached all-zero text categories but exited 1 on the untracked scratch symlink (`dirty: ?? TauCetiRoadmap/`). The package-lane scanner above has no git requirement. No commit was made, as instructed; the worker owns the eventual commit and submission checks.

## Maintainer consequences

No existing headline declaration was renamed or weakened, and no supplier was added. Previously anonymous checks promoted to theorem names are now available as explicit targets. `counting_test_divisors_four` was only a README label for a library calculation; that label is deleted and its numerical content retained as background.

The proposed ArithmeticStatisticsPartV consumer relationship is not recorded: it would reverse the supplied direction of supply. A human can decide that external placement/ownership question. It is not an analytic prerequisite or a supplier gap for this package.

This report records repairs and mathematical inspection, not independent acceptance. A fresh independent review remains required.
