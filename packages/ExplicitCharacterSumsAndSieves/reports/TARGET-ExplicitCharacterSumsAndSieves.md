# Triage report: TARGET-ExplicitCharacterSumsAndSieves

Verdict: **design**, name `ExplicitCharacterSumsAndSieves`, no base, no owner.
Deliverable: `packages/ExplicitCharacterSumsAndSieves/target.md`; manifest
`packages/ExplicitCharacterSumsAndSieves/sources.toml` (35 entries: 18 certified, 16 uncertified,
1 waived). No text is outstanding: the missing-references file was emptied, see "Sources" below.

## What was searched

- **Open targets and designs on the board.** Read `packages/ExplicitZetaBounds/target.md` and
  `packages/ExplicitMultiplicativeFunctions/target.md` in full where they touch this target, and
  the statements of `TARGET-ExplicitPrimeCounting` and `TARGET-ExplicitNumberFields` in the brief.
  All four are siblings covering other TME-EMT pages (zeta and L-functions, multiplicative
  functions, primes, number fields); none plans a derivative test, a Pólya–Vinogradov or Burgess
  constant, or a sieve constant. `ExplicitZetaBounds` names this target as its supplier for
  derivative tests and Pólya–Vinogradov and lists it as a consumer of weighted large sieves and
  `L(1, χ)` bounds; its Risks section asks this triage to break the cycle through `ψ(x)`.
  `ExplicitMultiplicativeFunctions` lists this target as a consumer of its pointwise bounds. The
  remaining open targets and designs (Yang–Mills, varifolds, stacks, …) share no object.
- **Roadmaps on main and at the open heads** (`roadmaps grep`, case-insensitive): Pólya–Vinogradov,
  Burgess, Brun–Titchmarsh, van der Corput, Kusmin/Kuzmin, derivative test, stationary phase,
  Filaseta / integer points, free of small prime factors, Siebert / dimension two / twin prime
  constant, Greaves, Montgomery–Vaughan, Treviño / McGown / Booker. Hits: `SieveMethodsAndPrimePatterns`
  (qualitative Brun–Titchmarsh `progression_upper` with "an unspecified absolute constant", README
  lines 1451–1459; qualitative twin/Goldbach `twin_goldbach_upper`, lines 1461–1479; sharp large
  sieves §2.9, lines 2293–2340; Selberg weights §1.3; Gauss sums §2.3);
  `CharacterSumsOverFiniteFields` (README line 222: Pólya–Vinogradov and Burgess are "the analytic
  number theory roadmaps", i.e. not owned there); `ProbabilisticAndMetricNumberTheory` (§2.5 van
  der Corput difference theorem, §2.7 explicit Erdős–Turán); `AnalyticNumberTheoryPartI` (BMOR
  `L(1, χ)` bounds, §0.3 Schoenfeld's `θ(x)` bound). Every other hit was a different Burgess
  (descriptive set theory), a different Booker, or Gauss–Kuzmin. The board package
  `AnalyticNumberTheory` (#123) is an index of ANT Parts I–II and plans none of these.
- **Supplier sections read**: `SieveMethodsAndPrimePatterns` Scope, §1.3, §1.6, §2.3, §2.9;
  `CharacterSumsOverFiniteFields` Layers 1, 4, 7 (7.1 Gauss sums of Dirichlet characters);
  `LFunctions` Layer 4; `ClassicalArithmeticCompletion` Layer 1; `ProbabilisticAndMetricNumberTheory`
  Layer 2; `ComputationalNumberTheory` Layer 4 headers; merge order positions (LFunctions 24,
  ANT-I 84, ComputationalNumberTheory 185, SieveMethodsAndPrimePatterns 259,
  ProbabilisticAndMetricNumberTheory 260; ClassicalArithmeticCompletion on main;
  CharacterSumsOverFiniteFields is another author's PR, not in ORDER).
- **Libraries.** Mathlib: `DirichletCharacter.conductor/IsPrimitive/primitiveCharacter/Even/Odd`,
  `gaussSum` and `gaussSum_mulShift_of_isPrimitive`, `SelbergSieve`/`BoundingSieve`,
  `vonMangoldt`, `primeCounting`, `Real.fourierChar`; no Pólya–Vinogradov, Burgess, Kusmin–Landau
  or Brun–Titchmarsh. Tau Ceti: `gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive` in
  `TauCeti/NumberTheory/DirichletCharacter/GaussSum.lean`; no sieve or character-sum inequality
  (`EffectiveBounds/` holds number-field bounds only).

## What was found in the sources

- The four wiki pages were fetched from the CNRS-hosted TME-EMT site and quote every statement of
  the filed target with locators (`tmeemt-art05` lines 86–158, `tmeemt-art11` lines 116–186,
  `tmeemt-art14` lines 84–191, `tmeemt-art15` lines 84–417).
- Primary texts read: Patel (Lemma 2.3 and Lemmas 3.1–3.2), Hiary (Lemma 1.2), Granville–Ramaré
  (Lemmas 8.4–8.6, OCR of the operator's scan), Huxley–Sargos 1995 (Théorème 1, implicit
  constants), Bordignon–Kerr (arXiv v1), Bordignon 2022 (published, CC BY) and Bordignon 2021,
  Treviño (Theorems 1–3, Corollaries 1–2, Tables 1–3), McGown (Theorem A.1), Booker (Proposition
  2 and Table 1), Jain-Sharma–Khale–Liu (Theorem 1.1, Corollary 1.2), Büthe (Definition 4.1,
  Theorems 4.2–4.3), Ramaré–Viswanadham (Lemmas 14–15), Fan (the theorem).
- Corrections to the filed statement that the sources force (all carried into `target.md`):
  1. Ramaré–Viswanadham's Lemma 15 is proved from Lemma 14 and a numerical inequality
     (`ramareviswanadham2021` lines 674–679); no `ψ(x)` bound is consumed, so there is no cycle
     with `ExplicitPrimeCounting`.
  2. Jain-Sharma–Khale–Liu's Theorem 1.1 carries `(2^ω d)^{3/4} (q/φ(q))^{1/2}` in the bound; the
     pointwise bounds from `ExplicitMultiplicativeFunctions` are needed only for their Corollary 1.2,
     which is stated under an explicit hypothesis; no cycle through `ExplicitZetaBounds`.
  3. Büthe's Theorem 4.2 in the indicator case gives only the van Lint–Richert form with
     `1 + 8/log(y/k)` (`buthe2014` lines 349–353); Montgomery–Vaughan's Theorem 2 is a separate target.
  4. The non-squarefree Pólya–Vinogradov analogue with saving `3/8` is Bordignon's Rev. Mat.
     Iberoam. paper (`bordignon2022partial`, Theorem 1.3), not the Canad. Math. Bull. short-sum
     paper the filed statement cites.
  5. Version differences in constants: Hiary's `β` (`64/15` arXiv v4, `65/15` wiki); Treviño's
     `c₂` table (`p₀ ∈ {10¹⁰, 10¹⁵, 10²⁰}` in arXiv v2 against the wiki's `{10⁷, 10¹⁰, 10²⁰}`);
     Bordignon–Kerr's secondary constant (`6.5` arXiv v1, `49` published) and range
     (`log q ≥ e^{1088ℓ²}` in the paper). Each is recorded in the manifest `version_note` and as a
     Check in `target.md`.
  6. Patel's Lemma 2.3 hypotheses are `1/W ≤ |f''| ≤ 1/V`, `V < W`, `W > 1`; Hiary's are
     `λ ≥ 1` (not `λ > 1`); Booker's statement is a Proposition for integer `0 < M, N ≤ 2√d`.
  7. The iterated van der Corput inequality's admissible range is `2^k ≤ Q ≤ N`
     (`granville-ramare-1996` line 924).
- Generality: Layer 2 is stated on an arbitrary interval `[a, a+N]` as in Huxley–Sargos; the
  wiki's `[N, 2N]` becomes a Check. Layer 1 on arbitrary closed real intervals. Layers 3–4 on
  `DirichletCharacter ℂ q` with Mathlib's primitivity and parity; the Burgess layer stays at prime
  modulus because its sources are, with the composite case as filed.

## Sources

Fetched through the sources service into `packages/ExplicitCharacterSumsAndSieves/sources.toml`.
Certified: the four wiki pages, Granville–Ramaré (operator-local, from the earlier references
answer), Patel, Hiary, Huxley–Sargos 1995 (ICM library), Bordignon–Kerr (arXiv), Bordignon 2022
(EMS Press, CC BY), Bordignon 2021 (arXiv), Treviño, McGown, Jain-Sharma–Khale–Liu, Büthe (arXiv),
Booker (AMS open archive), Ramaré–Viswanadham (HAL), Fan (Integers). Uncertified by DOI or
locator: Karatsuba–Korolëv, Bordellès, Filaseta (Elsevier open archive rejected by the service's
host rules), Bachman–Rachakonda, Frolenkov–Soundararajan, Siebert, Greaves, Nathanson,
Montgomery–Vaughan 1973 and 1974, and the books and print-only items Vinogradov 2004, Huxley 1996,
Graham–Kolesnik 1991, Qiu 1991 (added by hand, cited by locator). Cheng–Graham 2004 and
Riesel–Vaughan 1983 are open on Project Euclid but the service received only anti-bot pages for
both URL forms; they are recorded uncertified with that note rather than with the error page's
hash. Huxley–Sargos 2006 is waived from the earlier answer.

No new references request is made: every statement needed for the triage is readable on the
wiki pages or in a certified primary text, and every paywalled item is settled as uncertified.
The design may ask the operator for local copies of Vinogradov 2004, Huxley 1996 and
Graham–Kolesnik 1991 if it wants to check the elementary proofs against the books.

The AMS page for Bordignon–Kerr's published version returned a storefront page instead of the
PDF; the manifest keeps the arXiv v1 text and the published constants are taken from the wiki.
Nothing fetched contained instructions; nothing suspicious to report.

## Why the verdict

Not a duplicate: no roadmap, package, pull request or library declaration owns an explicit
constant of these five layers; `SieveMethodsAndPrimePatterns` owns the qualitative shapes with
unspecified constants and says so. Not a merge: the sibling explicit targets plan other wiki
pages and treat this one as a supplier; the only shared objects (large sieve, Gauss sums, Selberg
weights) are consumed from their owners. Not a Part II: no roadmap stops where this one starts;
`SieveMethodsAndPrimePatterns` Part II would be the wrong frame for Layers 1–4, and the explicit
constants are a different direction from its Maynard and level-of-distribution layers. The filed
name fits and is unused.
