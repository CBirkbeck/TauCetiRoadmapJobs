# ArithmeticDirichletSeriesPartII port

Branch: `roadmap/arithmetic-dirichlet-series-part-ii`.
Head commit: `bfcff519feb7120bbd0d60423cab9b4d387f26be`.
Base: `a07e2024f391f3022520c3f8ad194912b3eab614`; the checkout was clean before branch creation.
The content change consists only of `TauCetiRoadmap/ArithmeticDirichletSeriesPartII/README.md`, `TauCetiRoadmap/ArithmeticDirichletSeriesPartII/Suggested.lean` and `TauCetiRoadmap/ArithmeticDirichletSeriesPartII/metadata.toml`.

## Draft pull request body

Extends ArithmeticDirichletSeries from simple poles to poles of arbitrary positive integer order. Builds the squared-sinc smoothing kernel, Delange's regularising weight, locally integrable boundary limits and monotone unsmoothing, then proves the integer-order Delange theorem and its Dirichlet counting forms. Finite coefficient changes and errors dominated by a lower-order pole preserve the counting asymptotic; divisor sums fix the factorial normalisation and a dyadic counterexample shows why continuation along the whole boundary line is needed.

AI assistance: authored and checked with Codex (GPT-6); the scope and accepted package are retained, with the supplier and mathematical corrections recorded below.

## Validation

The required targeted build exited 0. Exact outcome lines:

```text
⚠ [8978/8978] Built TauCetiRoadmap.ArithmeticDirichletSeriesPartII.Suggested (2.6s)
Build completed successfully (8978 jobs).
```

Warning count: **15**, all `declaration uses sorry`; no other warnings or errors. The final acceptance file has 20 explicit declarations: three definitions, one proposition structure, one supporting proved instance and 15 admitted headline theorems. No admitted data, examples, options or submodule Mathlib imports occur.

The required full gate exited 0 after the commit made the worktree clean. Its exact summary is:

```text
gate ArithmeticDirichletSeriesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Before the commit, the same content checks all passed and only the gate's clean-worktree requirement failed on the three staged additions.

The required separate dependency command exited 0 with exactly:

```text
depcheck: 14 roadmaps, 102 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. The citation resolver found no unresolved roadmap citations or Lean identifiers. Its external-library coverage disclaimer was not used as evidence: library declarations were read directly at the pins.

Generated one scratch file containing the final module followed by `#check @name` for **all 20 declarations**, and elaborated it once. Exit 0, 15 expected sorry warnings, and all 20 types printed. Compared every elaborated type against its README statement. No binder was lost and no retained theorem signature changed. In particular HasLaplace keeps its universe-polymorphic carrier and all three typeclasses; regularizedBoundaryL1 keeps arbitrary real a and A; delangeSmoothedLimit keeps arbitrary real A; the end theorems keep positive a/A; lowerPole_perturbation keeps its independent majorant, strict order inequality and convergence/boundary assumptions.

No Lean process remains running. No push, pull-request write, issue write or comment was made.

## Dependencies and ownership

The roadmap dependency still in a pull request is **AnalyticNumberTheoryPartII**, §4.5c, Complex Gamma–Laplace adapter. ArithmeticDirichletSeries is consumed from its completed specification on main, especially Layers 4.2, 9 and 9.2. OneParameterSemigroups Part B is a scope comparison, not an analytic input.

Read repository README and CONTRIBUTING, and main-branch models TauberianBoundaryConvergence, Completed/EffectiveBounds and LocalPurity, together with the completed parent and the supplied ConformalMappingPartII model. The parent-relative README/CONTRIBUTING paths in the supplied AGENTS text do not exist in this checkout; the repository-root copies provide the normative guidance.

Ran the roadmap service list and object searches across all indexed open heads and main, and local searches of active/completed roadmaps, board packages and both pinned libraries. Read every relevant match, including the general Gamma–Laplace adapter in AnalyticNumberTheoryPartII §4.5c, ArithmeticStatisticsPartV's elementary-two moment application, OneParameterSemigroups Part B, NoncommutativeGeometry's logarithmic Karamata bridge, and OperatorTheory/SpectralSubspacePerturbation's hyperbolic-weight transform. The latter objects, bounded Newman's endpoint theorem and real positive-measure transforms have different hypotheses and conclusions; they do not supply integer higher-pole Delange theory.

Also searched the exact named folders at all 13 supplied sibling heads: ComputationalNumberTheory, ConformalMappingPartII, EffectiveClassNumbers, AbelianSchemesAndArithmeticModuliPartII, GanGrossPrasadUnitaryGroups, SelmerIwasawaCohomologyPartII, QSeriesPartitionsAndMockModularForms, K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics. The hits concerned meromorphic divisor counts, Jacobi higher-pole corrections and elementary divisor bounds, not these analytic objects. Ownership against the indexed open pull requests was checked; no additional heads were sought.

This roadmap owns the generic one-sided function-transform predicate, pole boundary data, real squared-sinc kernel, polynomial Delange weight, regularization, smoothing/unsmoothing and higher-pole counting/perturbation statements because no matching owner was found. Board ProbabilisticAndMetricNumberTheoryPartII explicitly consumes this scalar theory and extends it to uniform parameter families; it supplies no input here. Arithmetic applications remain conditional examples and do not assign a new supplier obligation to an earlier roadmap. No ownership move from a later supplier was needed.

## Supplier replacements and duplication removals

The integer Gamma model was an exact specialisation of **AnalyticNumberTheoryPartII §4.5c**, whose general statement includes complex rates with positive real part, convergence and parameter majorants. Deleted the separate integerGammaLaplace declaration and HP.2.1 target; recorded that ownership only in Scope and ownership. Its formula, nonzero-rate guard and numerical normalisations now occur in the exact supplier contract and its Checks. All uses in the build, proof routes and dependencies cite that section directly. The remaining HP.2.2/HP.2.3 locators are preserved.

The source package already uses the actual pinned summatory import `TauCeti.Order.Northcott.Basic`, so the accepted review's import note needs no further repair. Retained the native summatory function, Laurent data and sine integral; did not introduce local replacements. Retained all previous accepted mathematical repairs: open-half-plane continuation, the zero-preserving action for the zero-function Check, the positive-abscissa/positive-real-part guards, the totally real Wood condition, and the signed alternating perturbation Check. The old review's historical build/warning counts are superseded by the fresh build above.

No other duplicate target was found. The generic finite-change limit statement is broader than the parent's simple-pole variants: it permits signed coefficients and an arbitrary already known limit at every logarithmic scale without analytic hypotheses. Its proof consumes the native eventually constant finite-discrepancy theorem.

## What moved from Lean to README

Only integerGammaLaplace left the accepted Lean file, as the supplier replacement above. Its mathematical content and normalisation Checks remain in the README supplier contract. No API/Check padding was reintroduced; the package had already converted the older API declarations and value examples to prose. All other 15 headline theorem statements and all four light object definitions are retained. The added weight derivative API, explicit uniform-shift quantifiers and convention witnesses are README material only.

## Upstream mathematical reading and fixes

1. Replaced the duplicated integer Gamma theorem by the verified general supplier, with its complex-rate hypotheses and exactly the specialisation used by smoothing.
2. Replaced `(log X)^(l − k)` in the perturbation proof sketch by `1 / (log X)^(k − l)`. For natural l < k the former exponent is zero: at l = 0, k = 1 it gives 1 instead of a function tending to zero.
3. Added the differentiability API and derivative-ratio limit for the weight, used by the one-bandwidth counterexample but previously unstated. At zero its derivative is 1/(k!(k+1)); the positive-time formula is guarded by t > 0. Added the separating zero-time Check.
4. Expanded uniform shift convergence into its exact quantifier order: H and ε, then T > H, then every t ≥ T and every |h| ≤ H.
5. Replaced “F(s)/s is undefined” at s = 0 by its actual Lean totalised value F(0)/0 = 0 together with failure of integrability.
6. Scoped the parent's k = 0 comparison to HP.4.2 and HP.4.3. The signed finite-change theorem has no boundary assumption and is not merely a simple-pole Wiener–Ikehara specialisation. Changed the supplier description of finite modification from invariance of sums to eventually constant discrepancy.
7. Deleted HP.4.4 from the proof Needs of zetaSquare_counting, since d(0) = 0 already makes zero suppression exact. Its finite-change Check still cites HP.4.4.
8. Added explicit Fourier-phase and weight-cutoff witnesses and exact file homes for grouped supplier declarations. All other retained statements matched the sources and elaborated signatures.

## Source and pin verification

The actual dependency checkouts match the manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The three mathematical PDFs and the Osele source were read as data. All four downloaded byte hashes match `packages/ArithmeticDirichletSeriesPartII/sources.toml`. No source prose or code was copied into the target. The upstream Mathlib/Zulip searches found the one-sided-transform design lead in Mathlib; the immutable Osele source, rather than a newer library, determines the predicate's shape. No fetched instruction was followed and no suspicious instruction requesting credentials, writes or a workflow change was encountered.

The locators below use the accepted source identifiers and their certified line numbering; printed-page/section content was checked against the matching PDF bytes.

| Source locator | Verified input |
| --- | --- |
| delange1954 line 24, line 42 | p. 213: nonnegative nondecreasing real function, positive abscissa, ordinary Laplace integral; harmless constant shift. |
| delange1954 line 278, line 285 | §§3.1–3.2, pp. 220–221: integral weight and shift ratio. |
| delange1954 line 329, line 343 | §§3.3.1–3.3.2, pp. 221–224: regularised derivative and its ordinary transform representation. |
| delange1954 line 489, line 496, line 501, line 513 | §3.3.5, p. 226: triangle kernel, positivity when removing damping, oscillatory limit and π normalisation. |
| delange1954 line 517, line 535, line 537 | §3.4, pp. 227–228: monotone upper/lower comparisons and derived bound. |
| delange1954 line 570, line 585, line 598 | §4.1, pp. 228–229: continued boundary values, uniformity off zero and integrable majorant. |
| delange1954 line 673, line 719 | Lemmas 3–4, pp. 231–233: the cutoff restriction for logarithmic factors and the Gamma model. |
| delange1954 line 818, line 821, line 831, line 870 | Theorem III, pp. 235–238: full boundary condition and g(a)/Γ(ω), positive g(a), integer specialisation. |
| delange1954 line 1046 | §5.3, p. 242: a local singularity alone yields only order of magnitude. |
| wood2019 line 1586, line 1606, line 1611, line 1617, line 1652 | §7, pp. 415–416: target rank, finite inertia, archimedean condition, last-factor discriminant and the totally real series. |
| wood2019 line 1692, line 1695, line 1698 | §7, p. 417: pole order 2^r, logarithmic exponent, trivial and proper-image contributions. |
| gmr2019 line 1908, line 1944, line 2194, line 2199, line 2205 | §4.1, pp. 790–791, (4.4), and §4.3, pp. 796–797: resolvent transform, simple pole, off-pole continuation and separately established uniformity. |
| osele-laplace line 72, line 121, line 125 | Source-file lines 68–70, 117–118, 121–123 at 90482cd: convergence, integral and transform predicate, with the stated argument order/actions. |

Read the following exact pinned definitions rather than inferring their fields: Northcott means finite sublevel sets only; LSeries.term suppresses zero; LSeriesHasSum is unconditional HasSum of those terms and includes convergence; AnalyticOnNhd is analyticity at every point of the set and imposes no boundary values outside it; summatory is a finite sum over the inclusive native normLE carrier and does not itself suppress zero. The scalar ℝ/ℂ applications supply completeness and ordinary compatible actions.

| Pinned declaration group | Repository-relative file and line |
| --- | --- |
| Northcott | `.lake/packages/mathlib/Mathlib/Order/Northcott.lean`, line 36 |
| LSeries.term, LSeriesHasSum | `.lake/packages/mathlib/Mathlib/NumberTheory/LSeries/Basic.lean`, line 74, line 217 |
| AnalyticAt, AnalyticOnNhd | `.lake/packages/mathlib/Mathlib/Analysis/Analytic/Basic.lean`, line 110, line 120 |
| Identity theorem | `.lake/packages/mathlib/Mathlib/Analysis/Analytic/Uniqueness.lean`, line 223; preconnected domain and agreement near a point in that domain |
| Native summatory and its comparisons | `.lake/packages/TauCeti/TauCeti/Order/Northcott/Basic.lean`, line 41, line 73, line 102, line 138, line 155, line 164, line 177 |
| Simple-pole theorems | `.lake/packages/TauCeti/TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean`, line 301, line 334; `Variants.lean`, line 60, line 120, line 135 |
| Laurent principal parts | `.lake/packages/TauCeti/TauCeti/Analysis/Contour/MeromorphicLaurent.lean`, line 223 |
| Positive-frequency sine integral | `.lake/packages/TauCeti/TauCeti/Analysis/Contour/WorkedExamples/HalfDisc/SineIntegral.lean`, line 339, line 357 |
| Fubini | `.lake/packages/mathlib/Mathlib/MeasureTheory/Integral/Prod.lean`, line 478; integrable uncurried product |
| Dominated convergence, termwise integration | `.lake/packages/mathlib/Mathlib/MeasureTheory/Integral/DominatedConvergence.lean`, line 67, line 88; AE measurability, integrable domination or finite sum of norm integrals |
| Fatou | `.lake/packages/mathlib/Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean`, line 216; AE measurability and countably generated filter |
| Parameter differentiation | `.lake/packages/mathlib/Mathlib/Analysis/Calculus/ParametricIntegral.lean`, line 286; local derivative domination, integrability and AE measurability |
| Positive dilation | `.lake/packages/mathlib/Mathlib/MeasureTheory/Integral/IntegralEqImproper.lean`, line 1208 |
| Exponential integral | `.lake/packages/mathlib/Mathlib/Analysis/SpecialFunctions/ImproperIntegrals.lean`, line 63, line 87; negative real part of exponent |
| Gamma integrals and factorials | `.lake/packages/mathlib/Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean`, line 66, line 325, line 372, line 422, line 465; native complex-power integral still has a real rate |
| Sinc | `.lake/packages/mathlib/Mathlib/Analysis/SpecialFunctions/Trigonometric/Sinc.lean`, line 37, line 42, line 44, line 51, line 56, line 85 |
| Riemann–Lebesgue | `.lake/packages/mathlib/Mathlib/Analysis/Fourier/RiemannLebesgueLemma.lean`, line 206; angular rescaling and sign reflection used explicitly |
| Removable singularity | `.lake/packages/mathlib/Mathlib/Analysis/Complex/RemovableSingularity.lean`, line 35; continuity of the chosen extension at the puncture |
| Zeta continuation/series/residue | `.lake/packages/mathlib/Mathlib/NumberTheory/LSeries/RiemannZeta.lean`, line 145, line 206, line 241 |
| Complex-power summability | `.lake/packages/mathlib/Mathlib/Analysis/PSeriesComplex.lean`, line 25 |
| Convolution | `.lake/packages/mathlib/Mathlib/NumberTheory/LSeries/Convolution.lean`, line 139 |
| Divisor identities | `.lake/packages/mathlib/Mathlib/NumberTheory/ArithmeticFunction/Misc.lean`, line 127, line 178, line 195 |
| Geometric HasSum | `.lake/packages/mathlib/Mathlib/Analysis/SpecificLimits/Normed.lean`, line 473; ratio norm less than one |

## Computed adversarial mathematics pass

Each row tests the stated real/complex functions or the general carrier where relevant. Limits recorded here are analytical computations, not proofs supplied by a sorry build. Direct numerical quadrature independently agreed with the kernel, Gamma and regularised-log identities to ten decimal places on the displayed samples. The rows include each definition, theorem, API law, convention and distinct Check; repeated examples identify the same row explicitly. Inapplicable finite-field, noncommutative-group, scheme, DVR and rank cases do not enlarge the carriers of scalar ℝ/ℂ analysis. The only generic carrier, HasLaplace, is tested on the zero space, zero measure and an incompatible scalar action.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| northcott_natId | b = 0, 1, 2; constant zero height | Identity sublevels have sizes 1, 2, 3; zero height has infinitely many points below 0. | Separates the intended finite-sublevel property. | Retained. |
| HasLaplace definition | f = 1, s = 2; s = 0; μ = 0; E = {0} | At 2 integral/value = 1/2; at 0 total integral = 0 but norm integral = ∞; zero measure/space give 0 = 0. | Integrability excludes total-integral junk. | Retained. |
| HasLaplace convergence projection | f = 1, s = 2 or 0 | Norm integrals 1/2 and ∞. | Only s = 2 satisfies the predicate. | Prose API. |
| HasLaplace integral projection | f = 3, s = 2 | Integral = z = 3/2. | Exact recorded value. | Prose API. |
| HasLaplace uniqueness | f = 1, s = 2, proposed z = 1/2 or 7 | Both asserted transforms would force 1/2 = 7. | Wrong value rejected. | Prose API. |
| HasLaplace AE congruence | f = 1; g(0) = 37; s = 2 | Lebesgue transforms both 1/2; δ₀ transforms 1 and 37, with AE equality false. | Same-measure guard matters. | Prose API. |
| HasLaplace additivity | f = 1, g = 3, s = 2 | 1/2 + 3/2 = 2 = transform of 4. | Compatible with distributive action. | Prose API. |
| HasLaplace scalar multiplication | f = 1, s = 2, scalars 0, i | Transform values 0 and i/2 = scalar × 1/2. | Correct compatible normed actions. | Prose API. |
| HasLaplace positive dilation | f(t) = t, c = 2, s = 2 | Transform of 2t = 1/2 = (1/2) × transform of t at 1. | Jacobian and direction agree. | Prose API. |
| Zero-function Check | Zero-preserving action; artificial z • x = 1 on ℝ | Integrands are 0 and 1; the second fails z • 0 = 0. | Zero-preserving hypothesis excludes wrong action. | Retained. |
| Constant-transform Check | s = 1, 2, 1+i | Ordinary values 1, 1/2, (1−i)/2; Stieltjes unit atom gives 1 in each case. | Fixes the ordinary transform. | Retained. |
| Quadratic-transform Check | s = 1, 2, 1+i | 2/s³ = 2, 1/4, −(1+i)/2; Stieltjes at s = 2 gives 1/2. | Fixes power and factorial. | Retained. |
| Nonintegrability Check | f = 1, s = 0 | Bare integral 0 = proposed 0, but ∫norm = ∞. | Predicate false. | Retained. |
| PoleBoundary definition/model Check | a = −1, 0, 2; k = 0, 1; A = 1 or 0 | At s = a+2, values 1/2, 1/4 (or 0); numerators 1 (or 0). | Allows all real centres, including the zero model. | Retained. |
| PoleBoundary interior | F = 1/(s−a); s = a+1 or a+1+i | Values 1 and (1−i)/2, denominators nonzero. | Open half-plane excludes the pole. | Retained. |
| PoleBoundary local numerator | F = 1/z+2, z = s−a | Numerator 1+2z has value 1 at z = 0; at z = 1, quotient = 3 = F. | Absorbs Delange's regular analytic term. | Retained. |
| PoleBoundary away | Pure model at y = 1, and dyadic at y = 2π/log 2 | Pure model denominator i ≠ 0; dyadic denominator 1−exp(−2πi) = 0 with nonzero derivative log 2. | Additional dyadic pole rejected. | Retained. |
| Open-half-plane agreement | Update F(1) from 0 to 37 for F = 1/(s−1) | At 2 both values = 1; boundary values 0 and 37. | Both predicates hold despite different boundary values. | Prose API/Check. |
| Leading-coefficient uniqueness/wrong-leading Check | Simple pole, proposed A = 1 or 2 | (s−1)F(s) = 1 on the right; limit 1 ≠ 2. | Wrong numerator excluded. | Prose API/Check. |
| Pole-order uniqueness | F = 1/(s−1), k = 0 or 1 | Numerator for k = 0 is 1; for k = 1 it is s−1 with centre value 0. | Nonzero coefficients are necessary for uniqueness. | Prose API. |
| Division by argument | F = 4/(s−2)²; a = 2; also 1/s at a = 0 | Leading coefficient after division = 4/2 = 2; at 0, 1/s becomes 1/s². | Positive-abscissa guard has a witness. | Retained API. |
| Rescaling | F = 4/(s−2)², a = 2 | F(2s) = 1/(s−1)²; leading coefficient 4/2² = 1. | Direction/radius and exponent agree. | Retained API. |
| Multiplication by regular H | F = 1/(s−1)²; H = 0, 1, s−1 | Leading coefficients 0, 1, 0 at index 1; last product is a simple pole. | Zero leading coefficient correctly permits cancellation. | Retained API. |
| Product boundary rule | 2/(s−a) times 3/(s−a)² | Product 6/(s−a)³; new index 0+1+1 = 2. | Orders, not indices, add. | Retained API. |
| Zero function cannot have nonzero leading term | F = 0; A = −1, 0, 1 | Right numerator and its centre limit are 0; 0 ≠ ±1. | Only A = 0 works. | Retained Check. |
| Zeta boundary example | ζ, ζ², ζ⁴; excluded exponent m = 0 | Numerator values 1, 1, 1; orders 1, 2, 4; ζ⁰ = 1 has no nonzero pole. | Guard m ≥ 1 is needed. | Retained. |
| squaredSinc definition/origin Check | λ = −1, 0, 1, 2; v = 0 | Values −1/π, 0, 1/π, 2/π = λ/π. | Probability claims need positive bandwidth. | Retained. |
| Kernel nonnegativity | λ = ±1, v = 0 | 1/π > 0 and −1/π < 0. | Separates positive-bandwidth guard. | Prose API. |
| Kernel evenness | λ = 2, v = ±π/4 | Both values 8/π³ ≈ 0.2580122755. | Evenness holds. | Prose API. |
| Kernel continuity | λ = 0, 2; v → 0 | Limits 0 and 2/π equal values at 0. | Native sinc removes the origin singularity. | Prose API. |
| Kernel integrability/bounds | λ = 1, 2; |v| ≥ R > 0 | Absolute masses 1 and 1; tail upper bounds 2/(πR), 1/(πR). | Finite positive-bandwidth integrals. | Prose API. |
| squaredSinc_mass | λ = 1, 2, 0, −1 | Integrals 1, 1, 0, −1; only positive λ claim mass 1. | Normalisation discriminates missing factors. | Retained theorem. |
| squaredSinc_fourier | λ = 1; v = 0, π/2, π | Kernel and triangle/(2π): 1/π, 4/π³, 0 = 0.3183098862, 0.1290061377, 0. | Frequency and scale agree. | Retained theorem. |
| Kernel tail concentration | h = 1, 2, 0 | Upper bounds 2/(πλ), 1/(πλ) → 0; h = 0 gives mass 1. | Strict h > 0 needed. | Prose API. |
| First-zero Check | λ = 1, 2; v = π/λ | Intended values 0, 0; half-frequency model gives 4/π³, 8/π³. | Excludes wrong bandwidth. | Retained. |
| Bandwidth-two mass Check | λ = 2 | (2/π) × (π/2) = 1. | Excludes missing Jacobian. | Retained. |
| Nonperiodicity Check | λ = 1; v = 0, 2π | Values 1/π and 0 differ. | Cannot be a periodic Fejér kernel. | Retained. |
| Weight definition | k = 0, 1, 2, 3; t = 1 | Integral values 0.6321205588, 0.2642411177, 0.0803013971, 0.0189881569. | Matches explicit incomplete-Gamma formulas. | Retained. |
| Weight continuity | t → 0; k = 0, 1, 2 | w(t) = t/(k!(k+1))+O(t²); limit/value 0 each time. | No origin pole. | Prose API. |
| Weight nonnegativity | t = 0, 1, −1; k = 0 | Values 0, 1−1/e ≈ 0.6321205588, 1−e ≈ −1.7182818285. | Negative-time extension cannot have global sign. | Added explicit negative Check. |
| Weight strict positivity | t = 1; k = 0, 1, 2; t = 0 | Positive values above; value at 0 is 0. | Strict t > 0 retained. | Prose API. |
| delangeWeight_normalization | k = 0, 1, 2, 3; t = 10 | w(t)t^k = 0.9999546001, 0.9995006008, 0.9972306043, 0.9896639493; formula 1−e^(−t)Σ(j≤k)t^j/j! → 1. | All orders have limit 1. | Retained theorem. |
| delangeWeight_shift | h = 0, ±1; k = 0, 2 | At h = 0 quotient = 1 for t > 0; k = 2 polynomial factor (t/(t±1))² → 1, normalized Gamma quotient → 1. | Gives the claimed limit 1; denominator eventually positive. | Retained theorem. |
| Uniform weight shifts | H = 1; k = 2; t > 2 | (t/(t+h))² lies between (t/(t+1))² and (t/(t−1))²; both → 1. | Same threshold works for every |h| ≤ 1. | Explicit quantifier order added. |
| Normalised weight bound | k = 0, 1, 2; t = 0, 1 | Normalised values 0 and 0.6321205588, 0.2642411177, 0.0803013971, each ≤ 1. | Correct half-line bound. | Prose API. |
| Weight differentiability at zero | k = 0, 1, 2, 3 | Direct derivative integrals = 1, 1/2, 1/6, 1/24. | Extends continuously across 0. | Added API. |
| Weight derivative at positive time | t = 2; k = 0, 1, 2 | Derivative integrals = 0.1353352832, −0.0131632543, −0.0131632543; formula e^(−2)/k!−k w(2)/2 gives same values. | Weight itself need not be monotone. | Added API. |
| Weight logarithmic derivative | k = 0, 1, 2; t → ∞ | w′/w = t^k e^(−t)/(k! w t^k)−k/t → 0−0 = 0. | Supplies one-bandwidth Check input. | Added API. |
| Weight-origin Check | k = 0, 1, 2; t = 0 | Outer factor gives 0, 0, 0 even when 0^0 = 1 internally. | Total definition agrees. | Retained. |
| Weight k = 0 identity | t = −1, 0, 1 | Both sides 1−e, 0, 1−1/e. | Correct cutoff. | Retained Check. |
| Weight k = 1 identity | t = −1, 0, 1 | t w₁(t) and 1−(1+t)e^(−t) are 1, 0, 1−2/e. | Correct polynomial and sign. | Retained Check. |
| Weight k = 2 identity | t = −1, 0, 1 | t²w₂(t) = 1−e/2, 0, 1−5/(2e); omitting 1/2! doubles each nonzero value. | Factorial discriminates. | Retained Check. |
| Weight derivative zero-time negative Check | k = 0, 1, 2; t = 0 | Actual 1, 1/2, 1/6; unguarded formula with total division yields 1, 1, 1/2. | Positive-time guard is essential. | Added Check. |
| Incomplete-Gamma identity | k = 0, 1, 2; t = 1, 0 | At 1 both sides 1−1/e, 1−2/e, 1−5/(2e); at 0 both sides 0. | Change of variables/factorial agree. | Retained proof identity. |
| Gamma–Laplace supplied model | rate = 2; k = 0, 1, 2, 3; a = −1, 0, 2 | Integrals/formulas 1/2, 1/4, 1/4, 3/8 independent of a. | General supplier specialises exactly. | Separate target deleted. |
| Complex-rate Gamma Check | rate = 1+i; k = 0, 1, 2, 3 | Integral and k!/rate^(k+1): (1−i)/2, −i/2, −(1+i)/2, −3/2. | A real-rate-only substitution fails. | Supplier contract/Checks. |
| Gamma zero-rate negative control | k = 0, rate = 0 | Total integral 0; ∫norm = ∞; formal inverse rate totalises to 0. | Convergence guard excludes false HasLaplace. | Supplier guard retained. |
| regularizedBoundaryL1 | Exact model; k = 0 and continued R(s) = s−a | H = b = 0 or −1; L¹ error 0 for every interval. | Correct arbitrary A/a scope. | Retained theorem. |
| Logarithmic regularisation Check | k = 1, R(s) = 1/(s−a), y = ±1 | Integral and log formula = −0.1534264097 ∓ 0.2853981634i. | Both logarithm branches agree with principal values. | Retained Check. |
| Integrable log majorant | δ = 1/2; y → 0; k = j = 1 | ∫₀^δ −log y dy = δ(1−log δ) ≈ 0.8465735903; at y = 1 the real majorant integral is log 2−1/2 ≈ 0.1931471806. | Log is locally integrable. | Retained proof estimate. |
| Pure-model regularisation Check | F = A/(s−a)^(k+1); A = 0, 2 | R, R′, H and b all 0, so error 0. | Correct subtraction. | Retained. |
| Raw-boundary update Check | a = A = 1, k = 0, F(1) = 37 | R(1) = 37; R(1+ε) = 0; continued R and continued derivative = 0. | Raw R is discontinuous, continuation is analytic. | Accepted distinction retained. |
| Norm inequality | ε = 0, u = y = 1; arbitrary ε,u ≥ 0 | Norm = √2 = (u+|y|)/√2; norm² ≥ u²+y² ≥ (u+|y|)²/2. | Inequality direction correct. | Retained. |
| Regularised-transform minus sign | k = 1, R(s) = 1/(s−a), s−a = 1 | −∫R′(s+u)u du = log 2−1/2 = ∫₀∞e^(−t)w₁(t)dt. | Minus derivative creates the positive weight. | Retained proof identity. |
| delangeSmoothedLimit | α = 0, A = 0; α = e^(at)t^k, A = k!; α = e^(at), k = 1, A = 0 | Weighted limits 0, 1, 0 and convolution limits 0×1, 1×1, 0×1. | No positive A assumption or growth bound is required here. | Retained theorem. |
| Smoothed-model Check | k = 0, 1, 3; λ = 1, 2 | w_k(t)t^k → 1; each kernel mass = 1, so every model convolution limit = 1. | Fixes mass across layers. | Retained. |
| Damped Fourier identity | t = 2, T = 3; y = 1 and reflected y = −1 | exp(i(t−T)) = exp(−i); reflected factors exp(2i)exp(−3i) = exp(−i). | Even triangle permits the required sign reflection. | Retained proof identity. |
| Removal of damping | α = β = e^(at)t^k; λ = 1, 2 | Difference transform 0; both sides 0 before/after damping; model convolution limit 1 at both λ. | No circular growth assumption. | Retained route. |
| monotoneUnsmoothing | α = 0; α = 2e^(at)t^k | Smoothed limits and ratios both 0 or 2. | Includes zero limiting constant. | Retained theorem. |
| One-bandwidth negative Check | a = C = λ = 1, ε = 1/10; k = 0, 2 | J extrema 1.1, 0.9; triangle multiplier at 3 = 0; smoothed limit = 1. Derivative margin 1−(0.3/0.9)−o(1) = 2/3−o(1) > 0. | A monotone α can have oscillating J at one bandwidth. | Added explicit derivative API input. |
| Unsmoothing zero-constant Check | α = 1, a = 1, k = 0 | Ratio e^(−t) → 0, weighted convolution → 0. | C = 0 is meaningful. | Retained. |
| Unsmoothing window bounds | a = 1, h = log 2, window mass m = 1/2, J → 1 | Retained-window lower limit e^(−h)m = 1/4 ≤ full limit 1; h → 0,m → 1 restores 1. | Comparison direction and limiting order correct. | Retained route. |
| delangeLaplace | α = 2e^(at)t^k; k = 0, 1, 2, 3 | A = 2, 2, 4, 12; A/k! = 2 each time, equal to the ratio. | Full headline matches model. | Retained theorem. |
| Delange simple Check | α = 2e^t, k = 0 | Ratio = 2 = A/0!. | Matches simple-pole normalisation. | Retained. |
| Delange double Check | α = 3te^t, k = 1 | Ratio = 3 = A/1!. | One power of t, no stray factorial. | Retained. |
| Delange model cancellation Check | a = −1, 0, 2; k = 0, 1, 3; t > 0 | Ratio of e^(at)t^k to itself = 1; t = 0,k > 0 total quotient = 0. | Ratio identity wider than theorem's monotonicity hypotheses. | Retained as Check only. |
| logSummatory_hasLaplace | c = δ₁ or δ₂; s = 2; c₀ = 37 | δ₁: F = 1, transform = 1/2; δ₂: F = 1/4, transform = 1/8; c₀ contributes 0. | F/s and zero suppression agree. | Retained theorem. |
| Log-summatory initial Check | c₀ = 99,c₁ = 3,c₂ = −5 | S(exp 0) = 0+3 = 3 = c₁. | Includes n = 1. | Retained. |
| Log-summatory unit-mass Check | c = δ₁; s = 2 | α = 1; integral = 1/2 = F(2)/2. | Ordinary, not Stieltjes, value. | Retained. |
| Log-summatory endpoint Check | c₁ = 3,c₂ = −5 | S(exp(log 2)) = −2 = 3−5; exclusive count would be 3. | Inclusive endpoint fixed. | Retained. |
| Log-summatory positive-real-part negative Check | c = δ₁; s = 0 | Series = 1; quotient 1/0 = 0; norm integral of α = ∞. | Total quotient cannot replace convergence. | “Undefined” repaired. |
| delangeDirichlet | ζ, ζ², ζ⁴ | Pole indices 0, 1, 3 and leading A = 1 give limits 1, 1, 1/6. | Same constants as Laplace bridge. | Retained theorem. |
| Count-of-ones Check | X = 1, 2, 5/2 | S = 1, 2, 2; S/X = 1, 1, 4/5 → 1 by floor comparison. | Native cutoff agrees. | Retained. |
| Divisor-counting Check | n = 1, 2, 3, 4 | d(n) = 1, 2, 2, 3; S(4) = 8; limiting coefficient = 1/1! = 1. | Not a claim of exact equality S(X)=X log X. | Retained. |
| Wood finite inertia / real place Check | Last-factor characters of ℚ(i), ℚ(√5), r = 1 | Both images meet C₂×{0} in {(0,0)}; conjugation images (0,1),(0,0), discriminants 4,5. | First excluded, second allowed. | Accepted repair retained. |
| delangeDirichlet_positiveAbscissa | c_n = 1 at a = 1; c_n = n at a = 2 | Counts floor X and floor X(floor X+1)/2; scaled limits 1 and 1/2 = A/a. | Correct 1/a factor. | Retained theorem. |
| Positive-abscissa simple-pole parent Check | a = 2,k = 0,A = 1 | Both constants A/a and κ/σ = 1/2. | Agrees with pinned rpow theorem. | Retained. |
| Zero-abscissa negative Check | c_n = 1/n, k = 0,a = 0 | S(1)=1,S(2)=3/2; S(X) ~ log X → ∞, not 1/0 = 0. ζ(s+1)/s has double rather than simple pole. | Cannot divide leading coefficient by zero. | Retained. |
| Rescaling constant check across layers | a = 2,A = 1; k = 0 or 3 | Rescaled numerator 1/2 or 1/16; multiply by a^k = 1 or 8 gives 1/2; after k! constants 1/2,1/12. | HP.0, HP.4 and parent conventions agree. | Retained. |
| finiteChange_asymptotic | Empty change; add 7 at n = 1; signed −7 change | Eventual differences 0,7,−7; each divided by X^a(log X)^k → 0. | No positivity/analytic assumption needed. | Broader variant clarified. |
| Finite-change divisor Check | d₂ and d₂+7δ₁ | S(1) = 1 or 8; S(4) = 8 or 15; limiting coefficients both 1. | Exactly constant discrepancy. | Retained. |
| lowerPole_perturbation | k = 1,l = 0,c = d₂,d = d₂+(−1)^n,b = 1; all zero at 0 | Absolute errors at n = 0,…,4: 0,1,1,1,1; partial signed errors 0,−1,0,−1,0; both limits 1. | Independent lower-pole majorant works. | Retained theorem. |
| Strict lower-pole negative Check | k = l = 0,c = b = 1,d = 2 on n ≥ 1 | Bound 1 ≤ 1; counts floor X,2floor X have limits 1,2 at scale X. | Equal order can change leading constant. | Retained. |
| Perturbation exponent computation | l = 0,k = 1; X = e² and X → ∞ | Natural l−k = 0 gives (log X)^0 = 1; reciprocal (log X)^(k−l) gives 1/2 at e² and → 0. | Former proof expression did not decay. | Reciprocal expression substituted. |
| Wood rank/order example | r = 1, 2 | Target groups C₂²,C₂³; pole orders 2,4; k = 1,3; constants A,A/6. | Rank shift and factorial correct. | Retained. |
| Wood finite/proper-image examples | r = 1 or 2, remove trivial map | Trivial contribution = constant 1; lower pole orders 1 < 2 and 2 < 4 give log ratios 1/log X and 1/(log X)² → 0. | Analytic implication has explicit arithmetic inputs. | Retained conditional examples. |
| zetaSquare_counting | n = 0,1,2,4; s = 2 | d(n) = 0,1,2,3; convolution values equal them; series ζ(2)² = π⁴/36; leading numerator 1; asymptotic coefficient 1. | Zeroth coefficient is already zero. | Unneeded HP.4.4 proof dependency deleted. |
| Zeta-square pole construction | numerator (s−1)ζ(s); s → 1 | Removable extension value 1; square value 1² = 1. Raw total value before redefinition is 0. | Continuity requires the chosen extension. | Retained. |
| Fourth-divisor factorial Check | d₄ = d₂*d₂ at n = 1,2,4 | Values 1,4,10; A = 1,k = 3 gives 1/6; wrong k,(k−1)!,(k+1)! give 1/3,1/2,1/24. | Fixes factorial against several wrong conventions. | Retained. |
| dyadicLocalPoleCounterexample coefficients | n = 0,1,2,3,4 | c = 0,1,2,0,4, all nonnegative. | Includes 2^0 = 1 and discards 0. | Retained theorem. |
| Dyadic geometric series | s = 2 or 3 | Ratios 1/2,1/4; sums 2,4/3 = 1/(1−ratio). | Converges exactly on intended right half-plane. | Retained theorem conjunct. |
| Dyadic local residue | s = 1+ε; ε → 0⁺ | ε/(1−2^(−ε)) → 1/log 2 ≈ 1.4426950409; derivative of denominator log 2 > 0. | Local coefficient positive. | Retained theorem conjunct. |
| Dyadic boundary failure | s₀ = 1+2πi/log 2; s = s₀+ε | F(s)=1/(1−2^(−ε)) ~ 1/(ε log 2) → ∞. | No analytic away germ despite total F(s₀)=0. | Retained theorem conjunct. |
| Dyadic first subsequence | j = 0,1,2,3 | S(2^j)=1,3,7,15; ratios 1,3/2,7/4,15/8 → 2. | Exact inclusive counts agree. | Retained theorem conjunct/Check. |
| Dyadic second subsequence | j = 0,1,2,3 | S(3·2^j)=3,7,15,31; ratios 1,7/6,5/4,31/24 → 4/3. | Distinct limit from first subsequence. | Retained theorem conjunct/Check. |
| Dyadic no-limit Check | Compare limits and residue | 4/3 ≈ 1.3333333333 < 1/log 2 ≈ 1.4426950409 < 2. | Neither full asymptotic nor residue limit holds. | Retained. |
| Pole-index convention | m = 1,2,4 | k = 0,1,3; factorials 1,1,6. | Natural subtraction m−1 only used with m ≥ 1. | Retained. |
| Abscissa convention | a = −1,0,2 in Gamma model; a = 0 in counting | Gamma integrals at s = a+2 stay k!/2^(k+1); harmonic count at a = 0 diverges. | Model has wider domain than counting theorem. | Retained. |
| Zero suppression / inclusive convention | c₀=99,c₁=3,c₂=−5; X = −1,0,1,2 | S = 0,0,3,−2; raw native carrier includes index 0 at X = 0 but weight is 0. | Floor conversion guarded by X ≥ 0. | Retained. |
| Ordinary versus Stieltjes convention | α = 1,t² at s = 2 | Ordinary values 1/2,1/4; Stieltjes values 1,1/2. | Factor 1/s is fixed twice. | Retained. |
| Boundary-value convention | Pure model F updated at a and a+i | Changed values 37,37; right values/model derivative unchanged; numerator stays A. | No illicit raw-boundary differentiability. | Retained. |
| Angular Fourier convention | y = 2π,v = 0,1/4; w = 1 | Inverse phases 1,i; forward phases 1,−i. Triangle at v = 0,π/2 yields 1/π,4/π³. | Sign and 2π witnesses provided. | Added explicit convention witness. |
| Weight-cutoff convention | L = 1 or 1/2;k = 0;t = 1,2 | L = 1 values 1−1/e,1−1/e²; L = 1/2 values 1−e^(−1/2),1−1/e. Both normalised limits = 1, L = 0 gives 0. | Fixes definition while explaining cutoff independence of limit. | Added explicit witness. |
| Powers and denominator convention | X = e²,a = 1/2,k = 2; X = 1,k = 1 | Scale = 4e > 0; at X = 1 scale = 0 and total quotient = 0. For X > 1 all scales positive. | Limit uses eventual nonzero denominators, not every X. | Retained. |
| Kernel integration-by-parts identity | R = π and R → ∞ | Boundary term −sin²π/π=0; limit of sine term π/2; whole-line squared-sinc mass π/π=1. | Matches supplier frequency 2 exactly. | Retained route. |
| Renewal consumer and uniformity | α_n(t)=e^t+e^n at fixed n | Each normalized ratio 1+e^(n−t) → 1; supremum of error over n is ∞ at every t. | A scalar theorem does not supply parameter uniformity. | Accepted consumer boundary retained. |

## Unresolved

None. The admitted theorems specify work to be proved by the finished roadmap; build success is evidence of elaboration, and the computed pass is evidence against the tested errors, not a proof of the admissions. All required edits and the report are complete; only the worker's subsequent push and draft pull request remain outside this job.


Pull request: #1415 (roadmap/arithmetic-dirichlet-series-part-ii at bfcff51)
