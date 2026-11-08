# Triage report: TARGET-AnalyticNumberTheoryPartIII

**Verdict: `part-ii`.** Name `AnalyticNumberTheoryPartIII`, base `AnalyticNumberTheoryPartI`.
It owns Layers 7–13 of the analytic number theory series. The brief for the design job is
`packages/AnalyticNumberTheoryPartIII/target.md`.

## What was searched

1. **Open targets and designs on the board (consolidation).**
   - Every design listed in the brief was compared by mathematical object. Those with
     `target.md`/`README.md` files on the board were read for the five Explicit designs
     (ExplicitZetaBounds, ExplicitPrimeCounting, ExplicitMultiplicativeFunctions,
     ExplicitCharacterSumsAndSieves, ExplicitNumberFields).
   - All 619 board packages' markdown was grepped for the target's distinctive objects: Mellin
     convolution, Fejér's theorem, Cesàro or Hardy Tauberian theorems, the derivative
     Borel–Carathéodory bound, Ramanujan's σ-identity, Erdős 392, and Goldbach verifications.
     There was no hit.
2. **Roadmaps on main and the 469 open roadmap pull requests.**
   - Searched with `roadmaps grep` (README only) for: sine/Dirichlet integral; Mellin and
     multiplicative convolution; Borel–Carathéodory; Fejér/Cesàro; Hardy/Littlewood Tauberian;
     the four-shift σ-identity; `2^ω`, `ζ²/ζ(2s)` and Liouville; Vinogradov–Korobov; bounded
     variation and Stieltjes; `W^{2,1}` and test-function density; approximate identities and
     mollifiers; the local log-derivative lemma; smoothed Chebyshev functions and smoothed
     cutoffs; Erdős 391/392; Goldbach verification.
   - Read in full or by section: AnalyticNumberTheoryPartI (#1126), AnalyticNumberTheoryPartII
     (#1167), ArithmeticDirichletSeriesPartII (#1415), ComputationalNumberTheory (#1408), and on
     main ZerosOfLFunctions, Completed/ArithmeticDirichletSeries, Completed/ContourIntegration,
     TauberianBoundaryConvergence, BanachAlgebras §2.1 and OperatorTheory/ToeplitzOperators T1.
3. **Pinned libraries.**
   - Mathlib: `Analysis/MellinTransform.lean`, `Analysis/MellinInversion.lean`,
     `Analysis/Complex/BorelCaratheodory.lean`, `NumberTheory/LSeries/*`,
     `NumberTheory/ArithmeticFunction/*`, `NumberTheory/EulerProduct/Basic.lean`,
     `MeasureTheory/VectorMeasure/BoundedVariation.lean` and
     `Analysis/Asymptotics/SpecificAsymptotics.lean` (Cesàro).
   - Tau Ceti: `Analysis/Contour/WorkedExamples/HalfDisc/SineIntegral.lean`,
     `Analysis/Sobolev/Wkp/Density.lean`, `Analysis/Fourier/Decay.lean`,
     `Analysis/BoundedVariation/OneDimensional.lean`, `NumberTheory/LSeries/WienerIkehara/*`,
     `NumberTheory/ArithmeticDirichletSeries/Perron/*` and `NumberTheory/LSeries/ZetaMul.lean`.
4. **Provenance of the filed wording.** The seven filed layers follow the open-source
   PrimeNumberTheoremAnd project (Kontorovich–Tao, Apache-2.0). Its blueprint was fetched as
   `kontorovichtao-pntplus` and its chapters were matched to the filed items:
   - the decay lemmas (§3.1);
   - rectangles and Perron (§§4.1–4.2);
   - Mellin calculus (§4.3);
   - the smoothed Chebyshev function and the `n₁/n₂` transfer `GenStrengthPNT` (§§4.5–4.6);
   - Borel–Carathéodory and the log-derivative lemma (§5.3);
   - Erdős 392 (§8.1);
   - the Iwaniec–Kowalski Chapter 1 Dirichlet series (§9.1).

   The project's repository also has `Goldbach.lean`, which states the verifications as
   propositions and the even-to-odd transfer, and Cesàro/Fejér and Laplace-inversion files.
   Those files were read from GitHub as orientation only and are not cited.

## What was found

**Already owned, so consumed and not re-planned:**
- The Dirichlet integral `∫₀^∞ sin x/x = π/2`: Tau Ceti
  `TauCeti.Contour.tendsto_integral_sin_div_atTop`.
- Density of test functions in `W^{k,p}(ℝⁿ)`, which covers the filed
  `‖f‖₁ + ‖f′‖₁ + ‖f″‖₁` density: Tau Ceti `TauCeti.Wkp.denseRange_ofTestFunctionₗ_top`.
- The value form of Borel–Carathéodory: Mathlib `Complex.borelCaratheodory`.
- Mellin inversion for transforms integrable on the line: Mathlib `mellinInv_mellin_eq`.
- `𝓜1_{(0,1]} = 1/s`: Mathlib `hasMellin_one_Ioc`.
- `L`-series of `ζ`, `μ`, `Λ` and `χ`: Mathlib.
- Integrals against integrators of bounded variation: Mathlib
  `BoundedVariationOn.vectorMeasure`, BanachAlgebras §2.1 (Riemann–Stieltjes on bounded-variation
  paths) and ArithmeticDirichletSeries Layer 6.1. This filed item is removed from scope.
- Fejér means on circle `L¹` and their `L¹` approximation: ToeplitzOperators T1. Only uniform and
  `L^p` convergence are added here.
- The `d_n` carrier and its pointwise bounds: AnalyticNumberTheoryPartI §§3.3–3.4.
- The PNT with the classical error term, via the explicit formula: ZerosOfLFunctions §8.5. The
  zero-free regions are its §§6.2–6.4. Here these are Checks of the general transfer, not targets.
- Explicit constants, the explicit smoothed Perron formulas, the Vinogradov–Korobov region and
  Pintz-type explicit PNTs: ExplicitZetaBounds and ExplicitPrimeCounting. They are excluded, as
  the filer intended.

**Not owned anywhere** (main, the 469 open heads, the board packages, the pinned libraries):
- Fourier decay from bounded variation;
- the sine-integral function and its bounds;
- principal-value inversion on vertical lines for bounded-variation functions, with a windowed
  error;
- line shifting across strips with poles;
- the derivative Borel–Carathéodory bound;
- Landau's local log-derivative lemma (ZerosOfLFunctions works through Hadamard factorisation
  instead);
- Mellin convolution, smoothed cutoffs and approximate identities for `dx/x`
  (AnalyticNumberTheoryPartI §0.11c is a different object, a weighted prime-sum Mellin identity);
- the general zero-free-region-to-error-term transfer;
- the classical bound `ζ′/ζ ≪ log t` inside the zero-free region (ZerosOfLFunctions bounds the
  horizontal edges only at selected heights);
- a completely multiplicative predicate on `ArithmeticFunction` (Mathlib has only the `ℕ →*₀ F`
  form);
- `σ_ν` for complex `ν`, `d_z`, Ramanujan's four-shift identity, and the series of `2^ω`, `μ²`,
  `λ` and `φ` with their abscissas;
- the Hardy–Landau Tauberian theorem;
- Fejér uniform convergence;
- Erdős 392;
- the Goldbach-range propositions. ExplicitZetaBounds' and ExplicitPrimeCounting's `target.md`
  files list Goldbach-type verifications as "beyond the board"; CircleMethodThreePrimes excludes
  them.

**Consolidation.** No open target or design plans the same theory, so the verdict is not
`merge-into`. The Explicit designs touch these objects only as local proof steps or Mathlib uses.
- ExplicitPrimeCounting §2.1 mollifies kernels of bounded variation multiplicatively.
- ExplicitZetaBounds §7.10 and ExplicitMultiplicativeFunctions (at its #1946 head) use Mathlib's
  Borel–Carathéodory.
- ExplicitMultiplicativeFunctions uses the series of `2^ω/n`.

These designs are later in the merge order (lines 267–272) and are consumers, not owners. The
coordination this needs is Risk 2 of `target.md`. The other listed designs (Surface groups,
Modularity, QCoh, Sobolev maps, Varifolds, Lorentzian geometry, …) share no object with this
target.

## Why `part-ii`, with base `AnalyticNumberTheoryPartI`

**The base.** The series exists:
- Part I (#1126, merge order line 49) owns Layers 0–3;
- Part II (#1167, line 50) owns Layers 4–6 and consumes Part I;
- the unsuffixed AnalyticNumberTheory index (board #123) was rejected as navigation-only.

The target continues Part I's direction: quantitative prime sums from analytic input, and the
multiplicative functions behind Part I's Layer 3 means. It reuses Part I's carriers (§3.3 `d_n`)
and results (§0.33). It plans nothing of Part II's (Lerch, double Dirichlet series, Bost–Connes),
so its base is Part I, not Part II.

**The name.** `AnalyticNumberTheoryPartIII` is the filer's suggested name. It fits the series and
is unused on main, in the open pull requests and on the board.

**Numbering.** The filed Layers 0–6 are renumbered 7–13 so that the series' section numbers stay
unique.

**Generality changes, made as the brief requires** (details in `target.md`, "Changes from the
filed wording"):
- the `n₁/n₂` transfer is raised to Ingham's general width `η(t)` and to any Dirichlet series
  with logarithmically bounded coefficients;
- `d_k` becomes `d_z`, and `σ_k` becomes `σ_ν` with `ν ∈ ℂ`;
- Fejér is stated for continuous functions and `L^p`;
- the Hardy theorem takes Landau's one-sided form;
- Erdős 392 is stated as an asymptotic equality;
- the Goldbach transfer takes the short-interval prime statement as a hypothesis.

That last change follows the single direction of supply: its owner, ExplicitPrimeCounting, comes
later. The filer's phrase "which this part consumes and supplies" is therefore resolved as
follows. This part consumes ZerosOfLFunctions and Part I, and supplies the Explicit roadmaps. It
consumes nothing from them.

## Sources

The manifest is `packages/AnalyticNumberTheoryPartIII/sources.toml`; `sources check` reports
0 problems.
- **Certified, fetched and read:**
  - `kontorovichtao-pntplus` (blueprint PDF, author page);
  - `platttrudgian2020` (arXiv:1809.03134v2, Ingham's theorem at lines 21–32);
  - `oliveiraesilva-herzog-pardi2014` (AMS open archive; the `4·10¹⁸` verification at lines 11–14);
  - `helfgottplatt2013` (arXiv:1305.3062v2; `8.875·10³⁰` at lines 9–10);
  - `alexeevetal2025factorial` (arXiv:2503.20170v4; background only — it treats Erdős 391, not
    392).
- **Uncertified, paywalled and cited by chapter or equation only:**
  - the filer's textbooks: Montgomery–Vaughan, Titchmarsh, Iwaniec–Kowalski, Tenenbaum, Apostol,
    Hardy and Katznelson;
  - the Iwaniec–Kowalski equation numbers (1.25), (1.28), (1.33) are taken from the certified
    blueprint's citations (`kontorovichtao-pntplus` lines 3200, 3329, 3582);
  - the Hardy chapter locator is the filer's and is flagged as unverified.
- **Tried and dropped,** with nothing lost because their statements are covered by certified
  sources:
  - Tao's 254A Notes 2: the sources service failed on the blog URL with an unrelated `ams.org`
    403;
  - Pintz 1980 (ICM archive): an image-only scan, and OCR is not installed;
  - Fejér 1904 (EuDML and GDZ): only a landing page and a scan were available.
- **No `needs-references.toml`.** Nothing the brief needs is unreadable; the uncertified works are
  settled by locator.

## Untrusted text

The filed issue text and every fetched page were treated as data. None of them contained an
instruction directed at the worker, so nothing is quoted as suspicious.
