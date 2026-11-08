# Triage report: TARGET-ExplicitPrimeCounting

Verdict: **design**, name `ExplicitPrimeCounting`, no base, no owner. The brief is in
`packages/ExplicitPrimeCounting/target.md`; the manifest is
`packages/ExplicitPrimeCounting/sources.toml`.

## History of the job

A first worker (chris-x41) triaged this target on 2026-11-05 and parked it for references: the
AMS open-archive downloads hit a rate limit after nine files, Project Euclid answered with a
bot-block page, and the Limoges thesis URL was dead. A human answered on 2026-11-05/06 with
local copies of sixteen texts (fifteen Mathematics of Computation articles and the thesis,
plus Rosser–Schoenfeld 1962) and waived Cipolla 1902. This run starts from that manifest. The
earlier worker's own fetches were not committed, so every other source was fetched again.

## What was searched

**Consolidation against the board.** Every open target and design was compared by object.
The four explicit-estimates siblings filed together are complementary, not overlapping:

- `DESIGN-ExplicitZetaBounds` (#6894) owns the zeta and `L`-function side (Gamma and zeta
  bounds, explicit zero counts, zero-free regions with decimal constants, zero density, large
  sieves, `L(1, χ)`) and the bounded-height Props `RH(H)`, `GRH(q, H)`; its `target.md` states
  explicitly that explicit prime bounds belong to `ExplicitPrimeCounting` and lists this roadmap
  as a consumer with the exact items it will supply. It also fixes the order
  `ExplicitCharacterSumsAndSieves → ExplicitZetaBounds → ExplicitPrimeCounting`.
- `DESIGN-ExplicitMultiplicativeFunctions` (#6897) owns Möbius and multiplicative-function
  estimates; its `target.md` consumes Layers 2–3 of this roadmap for its numerical instances and
  takes the prime estimates as hypotheses in its general theorems, so neither plans the other's
  objects.
- `TARGET-ExplicitCharacterSumsAndSieves` (#6062) owns the explicit Brun–Titchmarsh and sieve
  upper bounds, which Layer 6 here consumes.
- `TARGET-ExplicitNumberFields` (#6064) owns Dedekind-zeta and class-number estimates and the
  least-primitive-root bounds; it consumes prime estimates and does not state them.

No other open target or design concerns prime-counting inequalities. Verdict on step 0: no
merge.

**Ownership.** Searched with `roadmaps grep` for Rosser, Schoenfeld, Dusart, Büthe, short
intervals, Brun–Titchmarsh, the `n`-th prime and prime gaps; read the READMEs of
`ZerosOfLFunctions` and `LFunctions` (main), `AnalyticNumberTheoryPartI` (#1126),
`ErdosProgressionPowers` (#1336), `ComputationalNumberTheory` (#1800),
`SieveMethodsAndPrimePatterns` (#1495), `ProbabilisticAndMetricNumberTheory` (#1421),
`EffectiveClassNumbers` (#1406), `ClassicalArithmeticCompletion` (main) and
`Completed/ArithmeticDirichletSeries`; searched the pinned Mathlib and Tau Ceti for the
carriers. Findings:

- Mathlib has `Chebyshev.psi`, `Chebyshev.theta` with the elementary bounds (`θ(x) ≤ x log 4`,
  `ψ(x) ≤ C x`, `|ψ − θ| ≤ √x log x`, `ψ = θ + Σ θ(x^{1/k})`), `Nat.primeCounting`, `Nat.nth
  Nat.Prime` (zero-based), Bertrand's postulate, `vonMangoldt`, `RiemannHypothesis`, and only
  `1/2 < γ < 2/3` for Euler's constant. No explicit decimal constant for primes exists in
  Mathlib.
- Tau Ceti has `Real.logIntegral` (= `Li`, offset at 2), the exact `θ ↔ π` partial-summation
  identity (`primeCount_sub_mul_logIntegral_eq`), the prime number theorem for number fields
  with the qualitative transfers, `mertensConstant`, and Mertens' theorems with `O(1)`
  remainders. Nothing explicit.
- `ZerosOfLFunctions` (main) states in its ownership section that all its constants are
  existential and that decimal constants, interval arithmetic and numerical zeros are not
  owned; it supplies the shapes (zero-free regions, `N(T)`, explicit formula, `Li` adapters)
  and the Layer 9 Props `HasZerosInRects`, `AllOnCriticalLine`, `GRH`.
- `AnalyticNumberTheoryPartI` (#1126) states a handful of explicit instances under
  `…FiniteRangeInput` Props with a cutoff `X = exp(10000)`: §0.3 Schoenfeld's `θ(x) < 1.000081
  x`, §0.5 Rosser–Schoenfeld Theorem 1, §0.8/0.20 Theorem 6, §0.19 Theorem 5, §0.25 an
  Euler-product bound, §0.16 a mod-8 theta mass from Ramaré–Rumely; it also defines the
  progression carriers (§0.2) and `DirichletGRH`/`GRH` (§1.6). These are imported, not
  restated; `ErdosProgressionPowers` §0.9 declares the proofs of those finite-range Props as
  gaps, which the brief makes a bridging target (T0.5).
- `ComputationalNumberTheory` §4.22 proves Platt's `GRH(q, 10⁸/q)` for `q ≤ 400 000` as a
  theorem, so that instance of H2 is not a hypothesis; §4.24 gives the no-real-zero clause.
- `SieveMethodsAndPrimePatterns` has no Brun–Titchmarsh with a constant (its §1.6 interval
  bound has an absolute `C`), defines `SieveDistribution.primeCountAP` (§3.1), and plans the
  large sieve (Layer 2).
- `ClassicalArithmeticCompletion` (main) names `dyadicPrimeCount` (`π(2x) − π(x) > 3x/(5 log
  x)` for `x ≥ 41/2`, Rosser–Schoenfeld Corollary 3) with its own proof obligation;
  `EffectiveClassNumbers` plans `p_n ∼ n log n`. Both are recorded as consumers/agreements.

So no roadmap or library owns the target (step 1: not a duplicate), and no roadmap develops
explicit prime inequalities in the same direction (step 2: not a Part II). The name
`ExplicitPrimeCounting` is unused by any roadmap, pull request or package other than this
target's own board folder.

**Generality (step 3).** The filed statement already asks for general-form theorems
specialised to constants; the brief sharpens this into a rule per layer (general region
constant, height, density bound, table row, weight, exponent, modulus) and corrects several
wiki renderings against the papers (Johnston–Yang's exponent `1.515`, Platt–Trudgian's two
forms, Büthe's `π*`, Trudgian's threshold `2 898 239`, Dudek's cube form, Axler's dropped `log k`).

## Sources

The first worker's request was answered with sixteen local texts; this run fetched the other
forty-one works named by the issue through the sources service (two scripted batches, AMS files
by their open-archive addresses because the service does not follow AMS DOIs, and one pass of
hand-resolved addresses: the Polish digital library copy of Acta Arithmetica 42 for Robin 1983,
Numdam for Massias–Robin, the Nieuw Archief archive for Panaitopol, Zenodo's CC BY copy of
Vanlalngaia, Ramaré's author page for his 2002 paper, HAL for Ramaré 2013 and both
Deléglise–Nicolas papers). Result: 57 manifest entries, 49 `certified` and read, 7
`uncertified` (paywalled only: Rosser 1938 and 1941, Dusart 1999 C. R. and 2018, Ramaré–Saouter
2003, Platt–Ramaré 2017, the Cully-Hugill–Lee 2024 corrigendum), 1 `waived` (Cipolla).
`sources check` passes with no problem. The `needs-references` file is empty: no text a design
must read is unreadable, since every paywalled item is a locator-only citation whose statement
is also carried by a read text (the thesis for Dusart 1999; the arXiv paper for the 2024
corrigendum; Vanlalngaia for Ramaré 2013's corrected constants) or is an instance whose general
form is proved from read sources.

Two reading notes for the design: the Young–Potler scan has no text layer (the service's OCR
was used; cite it by page), and the Zenodo text of Vanlalngaia has a broken font map (OCR
confirms the thresholds). Bristol's repository holds an accepted manuscript of Platt–Ramaré but
blocks scripts; a human who can download it may add it as an operator copy under the same key.

Statements were verified against the texts for every target with a line locator in the brief:
Rosser–Schoenfeld 1962 (Theorems 1–14), Schoenfeld 1976 (Theorems 10–12, 6*, 8*), Büthe 2016
and 2018, Platt–Trudgian 2021 (both), Johnston–Yang, Fiori–Kadiri–Swidinsky, Trudgian 2016,
Dudek 2015 and 2016, Cully-Hugill 2021, Cully-Hugill–Lee 2022, Kadiri–Lumley, BMOR, Ramaré 2013
and 2016, Treviño, Kadiri 2008, Ramaré–Rumely, Dusart 1999 and the thesis, Robin 1983, Axler
2016 and 2019, De Koninck–Letendre, Deléglise–Nicolas, Platt 2017, van de Lune et al., Rumely,
Deléglise–Rivat 1998. Discrepancies between the wiki and the papers are listed in the brief's
Risks.

## Why the verdict

The target is a coherent library layer (explicit prime inequalities) that every explicit
application needs, that no roadmap plans, whose suppliers exist on main or on the board, and
whose consumers are already waiting (#6897, #6064, the gaps of #1336). It is wider than any
existing roadmap's explicit instances and orthogonal to the three sibling explicit targets, so
it is a new design rather than a merge, a Part II or a duplicate.

## Suspicious text

None. No fetched text or issue comment contained instructions.
