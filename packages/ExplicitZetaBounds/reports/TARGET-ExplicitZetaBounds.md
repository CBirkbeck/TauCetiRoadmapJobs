# TARGET-ExplicitZetaBounds — triage report (round 1, 2026-11-05)

**Verdict: `design`, name `ExplicitZetaBounds`.** The target is a new roadmap: the quantitative
layer of explicit constants above `TauCetiRoadmap/ZerosOfLFunctions`, which proves every shape it
needs with existential constants and declares decimal constants out of scope. No roadmap on main,
no open pull request and no board package owns the explicit inequalities as a theory; six of them
own individual theorems that the filed statement listed, and the brief records those as
boundaries. The brief is `packages/ExplicitZetaBounds/target.md`.

## What was searched

- The board: every open target and design listed in the job brief, by object. The four sibling
  explicit targets (#6062 `ExplicitCharacterSumsAndSieves`, #6063
  `ExplicitMultiplicativeFunctions`, #6064 `ExplicitNumberFields`, #6066 `ExplicitPrimeCounting`)
  were read in full from their issues (TauCetiRoadmapJobs #6062, #6063, #6064, #6066; this target
  is #6067), since the brief truncates them.
- The roadmap repository on main: `TauCetiRoadmap/ZerosOfLFunctions` (all nine layers and its
  "Not owned here" list), `TauCetiRoadmap/LFunctions` (Layers 0, 4, 7),
  `Completed/ArithmeticDirichletSeries` §6 (Perron), `Completed/ContourIntegration`.
- The open pull requests through `roadmaps grep` for Backlund, Rosser, Rademacher, Alzer,
  Preissmann, Helfgott, Vinogradov–Korobov, Mossinghoff, Kadiri, zero density, Montgomery–Vaughan,
  truncated Perron, Stirling, Gallagher, Trudgian, Ramaré, Bennett–Martin, large sieve, digamma,
  Dirichlet polynomial, mean value; then `roadmaps show` on every hit that could own a theorem:
  `AnalyticNumberTheoryPartI` (#1126), `AnalyticNumberTheoryPartII` (#1167),
  `ErdosProgressionPowers` (#1336), `CircleMethodThreePrimes` (#1803),
  `ProbabilisticAndMetricNumberTheory` (#1421).
- The board packages `SieveMethodsAndPrimePatterns`, `ComputationalNumberTheory`,
  `EffectiveClassNumbers` (READMEs at their board heads) and the packages index
  (`AnalyticNumberTheory` #123, `LawrenceVenkateshMethod`, `LogicAndDefinabilityInNumberTheory`).
- The pinned Mathlib (`Analysis/SpecialFunctions/Stirling.lean`, `Gamma/Digamma.lean`,
  `NumberTheory/BernoulliPolynomials.lean`, `NumberTheory/LSeries/*`, `NumberTheory/SelbergSieve.lean`,
  `NumberTheory/Harmonic/ZetaAsymp.lean`) and Tau Ceti
  (`NumberTheory/ArithmeticDirichletSeries/Perron/*`, `NumberTheory/EffectiveBounds/*`,
  `NumberTheory/LSeries/*`, `Analysis/SpecialFunctions/Gamma.lean`).
- The merge order for the position of every supplier.

## What was found

**Owners of individual theorems (boundaries, not duplicates).**

- `SieveMethodsAndPrimePatterns` §2.9 plans the sharp additive large sieve `N − 1 + δ⁻¹`
  (`SieveTaper.sharp_additive_largeSieve`), the separated Hilbert inequality `π/δ` and the sharp
  primitive-character large sieve `H − 1 + Q²` (`SieveApplications.sharp_primitive_largeSieve`);
  §2.2 plans Bombieri's `H + 2/δ` form. The filed Layer 4 therefore shrinks to the weighted form
  (Montgomery–Vaughan `3/2`, Preissmann `1.3154…`), Elliott's maximal form and Ramaré's Gallagher
  inequalities. Note for #6062, which expects the sharp constant from this roadmap: it comes from
  `SieveMethodsAndPrimePatterns` §2.9.
- `AnalyticNumberTheoryPartI` §1.5a plans the weighted Hilbert inequality with constant `3π/2`
  (Montgomery–Vaughan 1974, Theorem 1) and §1.5 the Dirichlet-polynomial mean square with error
  `6π Σ n|a_n|²`; §0.23a plans the slit-plane `log Γ` with the Stieltjes remainder and the sector
  derivative bounds; §1.6 the global `DirichletGRH χ` and `GRH`; §2.21 Rademacher's convexity shape
  for Hecke L-functions with an absolute but inexplicit constant; §§0.3 and 0.5 two
  Rosser–Schoenfeld prime bounds with finite-range inputs. All are consumed; the sharper constants
  (Preissmann, Ramaré's `2π c₀ (n + 1)`, the `n`-term Stirling remainder, Rademacher's exact `3` and
  `1`) stay here.
- `AnalyticNumberTheoryPartII` §4.3a is the Barnes `G` remainder, not `log Γ`; §4.3b balanced
  Gamma quotients. Not an overlap.
- `ComputationalNumberTheory` §4.17a plans explicit digamma and trigamma series remainders, §4.19a an
  Euler–Maclaurin remainder for Dirichlet L-functions, §4.21a argument counts and the Turing
  comparison, §4.22 `platt_bounded_height` (GRH for `q ≤ 400 000` up to height `≥ 10⁸/q`, as a
  theorem), §4.23 central nonvanishing for `q ≤ 2·10⁶`, §4.24 no real zeros for `q ≤ 400 000`.
  The filed hypothesis C7 is therefore not a target here; Kadiri 2018's `R₂ = 5.60` takes the
  bounded-height statement as a parameter and a bridging lemma imports §4.22.
- `ExplicitNumberFields` (#6064, claimed) states Rademacher's Theorem 4 for `ζ_K` as its Layer 1,
  and the Dedekind zero-count, zero-free and zero-density constants. The brief resolves the double
  claim by generality: this roadmap owns the explicit convexity bound on the general `LFunctions`
  record and its Dirichlet instance; #6064 states the `ζ_K` instance.
- `ExplicitPrimeCounting` (#6066) and `ExplicitMultiplicativeFunctions` (#6063) both expect the
  bounded-height verified-zero Props (`H1`, `H2`, `RiemannZerosVerified(T)`) to live in the zeros
  roadmap; Layer 8 here defines `RH(H)` and `GRH(q, H)` on top of `ZerosOfLFunctions` Layer 9's
  `AllOnCriticalLine`, and the mod-8 bounded-zero clause of `AnalyticNumberTheoryPartI` §1.4 is the
  instance `GRH(8, 10000)` of C6.
- `ErdosProgressionPowers` §4.4 proves an explicit Stirling bound for factorials from Mathlib's
  `Stirling.stirlingSeq`; `CircleMethodThreePrimes` excludes every explicit form;
  `ProbabilisticAndMetricNumberTheory` uses Vinogradov–Korobov only asymptotically;
  `EffectiveClassNumbers` (Part II of `ImaginaryQuadraticClassNumber`) has no `L(1, χ)` upper bound
  and is a consumer.

**Library.** Mathlib has Stirling for factorials, basic `digamma`, Bernoulli polynomials,
`riemannZeta`, `DirichletCharacter.LFunction`, `RiemannHypothesis` and the Selberg sieve; it has no
Euler–Maclaurin formula, no modulus bound for `Complex.Gamma`, no large sieve and no explicit zeta
bound. Tau Ceti has the truncated Perron formula with the Davenport-type error
(`norm_truncatedPerron_LSeries_sub_sum_le`) and no Gamma or large-sieve material. Nothing in the
pin owns a target.

**Why not `merge-into`.** The four sibling explicit targets share suppliers and consumers with this
one but plan different objects (character and exponential sums, Möbius and multiplicative means,
number-field invariants, prime counts); the single genuine overlap (Rademacher for `ζ_K`) is one
theorem and is settled by the generality rule rather than by merging. No open design is broader
than this target in its area.

**Why not `part-ii`.** `ZerosOfLFunctions` is the base in spirit, but the new roadmap does not
continue it in the same direction: it adds no new object or theorem shape, it adds constants to
every shape and depends on four other roadmaps (`AnalyticNumberTheoryPartI`,
`ComputationalNumberTheory`, `SieveMethodsAndPrimePatterns`, `LFunctions`) that sit between it and
the base. A Part II of `ZerosOfLFunctions` would have to sit before `AnalyticNumberTheoryPartI` in
the merge order, which it cannot.

**Generality adjustments.** Rademacher's bound is stated on the general record (degree `n`,
conductor `N`, pole factor) with Dirichlet and Dedekind instances; `N(T)` and `N(T, χ)` are the
`zeroCount` of `ZerosOfLFunctions` Layer 4 on a named rectangle; the mean values are stated for
arbitrary complex coefficients with the stated summability; `L(1, χ)` bounds for all primitive
characters of all conductors; Gamma bounds on sectors with the angular margin as a parameter. The
filed special cases (`q = 1`, `σ = 1/2`, `N(100) = 29`) are Checks.

**Defects the design must resolve** (in `target.md`, Risks): no Euler–Maclaurin formula in the
pin; no explicit Phragmén–Lindelöf; no explicit Vinogradov mean value theorem anywhere on the board
(targets 17 depend on it; the design must declare the gap or file a target); a supply cycle among
#6062 → this roadmap → #6066 → #6062 through the Brun–Titchmarsh variant that needs `ψ` bounds,
to be broken by moving that variant to #6066.

## Sources

The manifest `packages/ExplicitZetaBounds/sources.toml` records 64 works: 31 read from legal
copies (arXiv, HAL, AMS and DergiPark/KoreaScience open archives, the Bristol repository) with
their theorem numbering checked against the text, and 33 cited by locator as `uncertified`
(paywalled Elsevier, Wiley, Springer, IMPAN, OUP, De Gruyter, World Scientific, JSTOR, Cambridge,
and books). The scratch `needs-references.toml` requests nothing: no text is needed to write
the brief, and every unread work is settled by its locator.

Findings from the texts that change the filed statement:

- The `N(17/20, T)` zero-density bound is Kadiri 2013 (Acta Arith. 160), not Kadiri–Ng 2012,
  whose content is the Dedekind count `N_K(T)`.
- Mossinghoff–Trudgian–Yang 2024: the classical constant `5.558691` is Theorem 1.3, the
  Vinogradov–Korobov region Theorem 1.1. Bellotti 2024: Theorem 1.1 is the zeta bound with
  `70.6995 t^{4.43795 (1−σ)^{3/2}} log^{2/3} t`, sharper than Ford's, and Theorem 1.2 the region.
- Thorner–Zaman's `2.97655 (q|1+it|)^{1/4}` is Proposition 2.10, not Lemma 2.3.
- Hiary's hybrid bound is Corollary 1.1 of Theorem 1.2; his critical-line paper also gives
  `|ζ(1/2 + it)| ≤ 1.461` for `0 ≤ t ≤ 3`, which bears on hypothesis C9.
- Johnston–Ramaré–Trudgian: Theorem 1 is for odd quadratic characters only (the even case is
  Ramaré 2001 for every conductor); Theorem 2 is the `9/20` bound.
- Kadiri 2018 (Mathematika) contains only the `R = 5.60`, `q ≤ 400 000` result; the one-exception
  region with `R₁ = 6.4355` is in the 2002 Lille thesis (equation (111)) and the first arXiv
  version of math/0510570.
- Kadiri 2005: the arXiv preprint prints `R₀ = 5.70176`; the filed statement says `5.70175`;
  Jang–Kwon's abstract attributes `5.69693` to the published version. The design must read the
  published text (IMPAN, paywalled) or state the Jang–Kwon constant only.
- Trudgian 2014 (argument II): the arXiv v2 constants (`0.111`, `0.275`, `2.450`) differ from
  the published ones (`0.112`, `0.278`, `2.510 + 1/(5T)`); the brief cites the published ones.
- Platt's arXiv:1305.3087 is "Numerical computations concerning the GRH" (Math. Comp. 2016),
  not the 2011 thesis; Theorem 7.1 there is the statement `ComputationalNumberTheory` §4.22
  reconstructs.
- Diamond–Straub: the four-case digamma comparison is Theorem 3.1; Theorem 1.2 is the
  complete-monotonicity statement for `log Γ`.

Two web notes, not verified against any text, are flagged for the design: a 2026 arXiv note
(Revers, arXiv:2602.05614) claims Hiary's `0.63` should be about `0.77` after correcting a
`1/π` to `2/π`; a 2025 arXiv note (Fiori, arXiv:2502.13282) reports a repairable error in
Rademacher's Phragmén–Lindelöf proof. The explicit convexity target should be proved from the
three-lines theorem directly rather than by following Rademacher's construction.

Tooling notes for the sources service: it matched two of the worker's guessed DOIs to the wrong
papers (the DOIs belonged to other articles in the same volumes; both entries were corrected by
hand and the DOIs dropped or replaced); for Project Euclid and EuDML it saves only the landing
page and marks the entry certified (five entries were reset to `uncertified` by hand: Backlund,
Cheng–Graham, Logan, Rademacher, Gallagher); AMS back volumes on `www.ams.org` are classified
`publisher-open` but three fetches failed with network errors; `pubs.ams.org` and
`mia.ele-math.com` are in no licence class. Title searches resolved to Crossref DOIs rather than
to arXiv copies, so arXiv identifiers were found by web search and fetched explicitly.

## Suspicious text

None. No fetched text or issue asked for an action.
