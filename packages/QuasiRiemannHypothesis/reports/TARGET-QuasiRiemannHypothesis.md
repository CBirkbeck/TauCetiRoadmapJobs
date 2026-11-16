# Triage report: TARGET-QuasiRiemannHypothesis

**Verdict: `design`.** Name `QuasiRiemannHypothesis`, no base. The brief for the design job is
`packages/QuasiRiemannHypothesis/target.md`.

The target is the zero-free half-planes `Re s > 11/12` and `Re s > 7/8` for every Dirichlet
`L`-function (`ζ` included) and every finite-order Hecke `L`-function of `ℚ(√−3)`, together with the
preprint's corollaries. No roadmap, pull request, board package or pinned library owns it, and it
continues no existing roadmap in that roadmap's own direction.

## What was searched

1. **The full issue.** The brief's quotation stops in Layer L. The complete issue body (#18753) was
   read: Layers L–N, the list of consumed roadmaps, the inputs (U1)–(U8), "Why it matters" and
   "Known sources". It was read as data.
2. **Consolidation with the board.**
   - The brief lists no other open target or design.
   - `board-packages-index.txt` lists two packages under review:
     - AnalyticNumberTheory (#123) is a navigation index of Parts I and II, rejected in
       `packages/AnalyticNumberTheory/reports/REV-PKG-AnalyticNumberTheory~2.md` (F01). It plans
       nothing.
     - LawrenceVenkateshMethod (#345) is unrelated.
   - All board package markdown and Lean files were grepped for the distinctive objects:
     quasi-Riemann, zero-free half-plane, Kubota cover, cubic theta, Goldmakher–Louvel, sextic
     residue, least nonresidue, `Re s > 7/8`, `11/12`. The only hits were context mentions in the
     Explicit packages and SieveMethodsAndPrimePatterns' `leastNonresidue` definition. There is no
     overlap, so there is no merge.
3. **Roadmaps on main and the open roadmap pull requests.**
   - Searched with `roadmaps grep` for:
     - quasi-Riemann, `openai2026`, `7/8`, and zero-free half-planes;
     - Kubota, Patterson, cubic theta, metaplectic, `n`-fold, cubic or Kubota covers;
     - Goldmakher, Louvel, Huxley, Baier, number-field and cubic large sieves, sextic symbols;
     - `leastNonresidue`, nonresidue, Ankeny, Bach, Bhargava–Ivanyos, Lamzouri;
     - zero detectors;
     - twisted multiplicativity and Gauss sums modulo composite moduli;
     - Bianchi groups, `ℍ³` and `SL₂(ℂ)`.
   - Read by section on main:
     - AnalyticNumberTheoryPartI §§0.34, 1.6, 1.7, 1.9, 2.3a, 2.7, 2.18a, 2.21, 2.25, 2.38;
     - ZerosOfLFunctions §§3.4, 4.4, 4.5, 6.4, 8.5, 8.7, 8.8;
     - AnalyticNumberTheoryPartIII §§8.1–8.3, Layer 9, §§10.2–10.3;
     - ClassicalArithmeticCompletion §§1.12, 1.23, 1.33, 1.34, 1.38, 1.41, 1.52, 1.59, 1.60, 1.70,
       1.72, 1.75;
     - ClassFieldTheory Layers 5, 11, 13; ThetaSeries Layer 1; GlobalNumberFields (Completed)
       Layers 2 and 9; LFunctions Layers 4, 5, 7;
     - SieveMethodsAndPrimePatterns §§2.2, 2.3, 2.7, 2.9; AnalyticNumberTheoryPartII §5.29;
     - the Scope of ExplicitPrimeCounting.
   - Read at their heads: MetaplecticAutomorphicForms (#1063), CharacterSumsOverFiniteFields
     (#1712), BianchiModularForms (#1719), AutomorphicSpectralTheory (#925), and the relevant
     parts of ExplicitMultiplicativeFunctions (#1946), ExplicitNumberFields (#1944) and
     ExplicitCharacterSumsAndSieves (#1948).
4. **Pinned libraries.**
   - Mathlib `NumberTheory/LSeries/*`: `riemannZeta`, `DirichletCharacter.LFunction`, nonvanishing
     on `Re s ≥ 1`, trivial zeros.
   - Tau Ceti `NumberTheory/LFunctions/Hecke/*` (`heckeLFunctionC`, primitive comparison, Euler
     correction).
   - Tau Ceti `NumberTheory/NumberField/PowerResidueSymbol/*` and
     `Cyclotomic/Three/CubicReciprocity.lean`.
   - Both libraries were grepped for zero-free statements, large sieves and least nonresidues.
5. **The source and its context.**
   - The authors' repository `openai/math`: its licence, the commit history of both preprint
     folders, `lean/docs/003.md`, `lean/formalization.yaml` and the three comparator statements
     for the `7/8` bound, and the size of the `DirichletL` Lean folder.
   - The arXiv abstract page of 2610.12234.
   - Quanta Magazine's article of 19 October 2026, for the verification status.

## What was found

**Nobody owns the target.**

- No roadmap, open head, board package or library declaration states a half-plane `Re s > θ`,
  `θ < 1`, free of zeros of `ζ` or of any family of `L`-functions.
- ExplicitPrimeCounting (main, Scope) explicitly declines bounds under `Re s > 7/8`.
- ExplicitMultiplicativeFunctions (#1946) cites the preprint as context under the key
  `openai2026quasiRH`, which this manifest reuses.
- The existing zero-free regions are of de la Vallée Poussin type (ZerosOfLFunctions §§6.2–6.4;
  AnalyticNumberTheoryPartIII §10.3).

**The filed supplier claims hold.**

- Every section the issue says is consumed exists at the stated place, under a heading that matches
  the stated content. The texts of AnalyticNumberTheoryPartI §0.34 and §1.6, ZerosOfLFunctions
  §6.4, AnalyticNumberTheoryPartIII §10.3 and ClassicalArithmeticCompletion §§1.12, 1.59 and 1.72
  were read in full. The others were checked by heading only, and the design confirms each
  contract when it writes its supplier table.
- ClassicalArithmeticCompletion §1.59 is the general power reciprocity law with the Hilbert
  symbols above `n∞` left unevaluated, and §1.72 is cubic reciprocity for primary primes only.
- Its primary convention is `≡ 2 mod 3`, and Tau Ceti's `IsPrimaryEisenstein` agrees.
- CharacterSumsOverFiniteFields (#1712) has prime-modulus Gauss sums (§1.5) and composite moduli
  only over `ℤ` (Layer 7).

**The unplanned inputs are confirmed unplanned.**

- *Kubota's `n`-fold cover.* MetaplecticAutomorphicForms (#1063) covers only the double cover of
  `Sp(W)`, and MetaplecticAutomorphicFormsPartII (#2261) only finite fields.
  AutomorphicSpectralTheory continues Eisenstein series for linear reductive groups only.
  BianchiModularForms (#1719, merge order line 211) supplies the Bianchi groups, the cusps, the
  slash action and Fourier–Bessel expansions on `ℍ³`, but no covering groups.
- *Large sieves.* Number-field and `n`-th order large sieves are planned nowhere; the large sieves
  over `ℚ` are SieveMethodsAndPrimePatterns Layer 2 and AnalyticNumberTheoryPartII §5.29.
- *Composite moduli.* Gauss sums and reciprocity modulo composite ideals of `ℤ[ω]` are planned
  nowhere.
- *Zero detection.* Zero detection for Hecke `L`-functions is planned nowhere.
- *Least nonresidue.* No roadmap states a conditional bound for it, under GRH or under a zero-free
  half-plane. ExplicitNumberFields and ExplicitCharacterSumsAndSieves both place the least `k`-th
  power nonresidue outside their scope. SieveMethodsAndPrimePatterns §2.9 defines
  `SieveApplications.leastNonresidue` and proves only Linnik's exceptional-set bound.

**The carriers exist.**

- Tau Ceti's `TauCeti.LFunctions.heckeLFunctionC` is the canonical continuation of a ray class
  character's series at its presentation modulus. It is `0` if no continuation exists, and it is in
  meromorphic normal form, so its value at the pole is `0`. ZerosOfLFunctions' Suggested.lean
  already states zeros through `meromorphicOrderAt`. The target therefore asks for the same
  convention, so that the pole is allowed without making the statement false or vacuous.

**The source.**

- *The repository.* `openai/math` is Apache-2.0. Both preprint folders date from the repository's
  initial commit `adc7f12` (6 October 2026) and have not changed since. The repository README is
  data; it says the texts are model-written, that the `11/12` write-up was edited by a human, and
  that some unformalised results may have issues.
- *The preprint's numbering.* The OCR text read through the sources service (199 pages) matches the
  locators in the filed issue: Theorem 1.1, Corollary 1.2, (2.1), Proposition 2.1, Theorem 3.1,
  Lemmas 4.1–4.10, Proposition 5.1, Lemma 6.1, Proposition 6.3, Lemma 7.1, Lemmas 8.1–8.2,
  Proposition 8.3, Lemma 9.1, Proposition 9.2, Definition 10.1, Lemmas 10.2–10.6, Lemma 11.1,
  Propositions 11.2–11.3, Lemmas 13.1–13.4, Corollary 14.1, Lemmas 14.2–14.3, Lemma 15.1,
  Propositions 15.2–15.3, Proposition 16.1, Lemmas 16.2 and 17.1–17.6, Lemmas 18.1–18.3,
  Lemma 19.1, Proposition 19.2, Remark 19.3, Lemmas 20.1–20.2, Proposition 20.3.
- *Constants checked in the text.* The saving `1/4800` (Proposition 11.2) and the endpoint
  constant `49/440640` (Lemma 20.2) appear as the issue states.
- *The route of Corollary 1.2.* The proof goes through T2, the functional equation, the strip
  `1/8 ≤ Re s ≤ 7/8`, and then Bhargava–Ivanyos–Mittal–Saxena with `A = 32`.
- *Lean formalisation (reported, not run).* `lean/docs/003.md` lists comparator statements for:
  - `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re`;
  - the `DirichletCharacter.LFunction` bound with `¬(χ = 1 ∧ s = 1)`;
  - a Hecke family over `CyclotomicField 3 ℚ`, given as residue characters modulo an ideal that
    are trivial on units. Since `ℤ[ω]` has class number one and only finite places matter, these
    are exactly the finite-order Hecke characters.

  The comparator permits only `propext`, `Quot.sound` and `Classical.choice`. The `DirichletL`
  folder has about 2,900 files (about 25 MB). Nothing was downloaded or run.
- *arXiv:2610.12234.* This is Baiying Liu, *Improved zero-free half-planes for the quasi-Riemann
  hypothesis* (v1 8 October, v2 12 October 2026). It varies three parameters of the `7/8` argument
  to reach about `0.874957`, and reports a Lean formalisation. The issue's "slightly improved"
  title and "authors not recorded" are corrected in the manifest.
- *Expert reading.* Quanta (`quanta2026quasiRH`) reports three things:
  - experts have set the `7/8` paper aside and study the 49-page `11/12` paper intensely;
  - Sarnak will not call the result a theorem until humans have checked every detail;
  - the `7/8` paper is formally verified in Lean and the `11/12` one not yet.

  The article names no error and claims none has been ruled out. This is the basis of Risk 1 and
  of the instruction to compare routes for T1.

## Why the verdict

- **Not `merge-into`.** No open target or design plans any of the same objects.
- **Not `duplicate`.** No owner exists in any roadmap or pinned library. The OpenAI Lean library is
  neither pinned nor a roadmap, and it is route-specific. It is recorded as evidence for the
  statements and their conventions.
- **Not `part-ii`.** The nearest candidates are these:
  - AnalyticNumberTheoryPartI owns the Landau–Siegel exclusion (§0.34) and the GRH predicate (§1.6).
  - ZerosOfLFunctions owns the classical zero-free regions.

  The target is not a continuation of either in its own direction. Its proof rests on new theories
  (the Kubota cover, number-field large sieves, zero detection) that neither roadmap would own, and
  its headline is a new kind of statement. A Part II of AnalyticNumberTheoryPartI would have to
  absorb cubic metaplectic forms, which is outside that series.
- **Name.** `QuasiRiemannHypothesis` is not used by any roadmap, pull request or package. Only the
  package folder created for this job has it.

## Generality decisions

These are written into `target.md` under "Changes from the filed wording".

1. **T4 is stated as a general conditional theorem.** Its general form is: a zero-free half-plane
   `Re s > θ` for `L(s, χ)` bounds the least `n` with `χ(n) ∉ {0, 1}` by `(log q)^{A_θ}`.
   - It is proved by the smoothed explicit formula, the Ankeny argument with `θ` in place of
     `1/2`.
   - The preprint's route through Bhargava–Ivanyos–Mittal–Saxena is kept as a Check. Their
     hypothesis has now been compared with T3 (see Sources): it holds once the principal character
     is read as `ζ`. Their exponent (32) is worse than the general argument's (about 8).
   - The general form needs only suppliers that already exist, and it removes a dependence on an
     ISSAC paper.
2. **T6 is generalised to abelian `K`, the natural limit of the argument.** For non-abelian `K`
   the complementary factor is an Artin `L`-function whose holomorphy is open. The explicit value
   of `L(1, χ₋₃)` becomes a Check.
3. **(U1) is generalised only as far as the theory exists.** On `GL₂`, theta coefficients through
   Gauss sums are known for `n = 2, 3` (the filed recommendation of "`n`-th order Gauss sums" for
   every `n` would be false). For `n ≥ 4` on `GL₂` the coefficients are not known in general.
   Kubota's cover, the Eisenstein series and the residue are general in `n`.
4. **Zeros are read through meromorphic order,** for the carrier reason above.

The filed generality for (U2)–(U5) and T5 is kept, subject to copying the exact hypotheses of the
cited theorems from the papers.

## Placement decision for the unplanned inputs

- (U3)–(U8) are sections of this roadmap.
- (U1) and (U2) are self-contained blocks of this roadmap, kept free of the preprint-specific
  layers. The design sizes them first.

**Recommendation to the human.** Consider filing (U1) and (U2) now as separate targets, for
example `KubotaCoversAndThetaFunctions` and `NumberFieldLargeSieves`. Each has consumers outside
this roadmap, and the combined design is otherwise very large. If they are filed before the design
starts, the design consumes them, and the brief says so.

## Sources

All works were fetched through the sources service into `packages/QuasiRiemannHypothesis/sources.toml`.
The manifest has 23 entries, all `certified`, and `sources check` reports 0 problems.
`quanta2026quasiRH` is recorded as context for the status of the source. Locators were
checked in the texts for the claims this triage makes.

**Fetched and read.**

- *The OpenAI papers.* `openai2026quasiRH` and `openai2026quasiRHalt` are image-only PDFs. The
  service recognised them by OCR, and both are pinned to revision `adc7f12`.
- *arXiv versions.* The following were read as arXiv versions:
  - `liu2026improved`, `dunnradziwill2024`, `goldmakherlouvel2013`, `bgl2014`;
  - `gaozhao2020`, `gaozhao2024`, `baierbansal2018`, `maynardpratt2024`, `guthmaynard2026`;
  - `thornerzaman2019`, `bimsissac2017`, `tao2015`, `lamzourilisound2015`, `bcss2025`.

  Each records its published DOI and venue, with a version note.
- *Other open copies.*
  - `milnecft2020`: from the author's site.
  - `kazhdanpatterson1984`: from Numdam. The service first resolved the Springer DOI and marked it
    paywalled; the Numdam copy replaced that entry.
  - `kubota1969`: from the Kyoto University repository, by its direct bitstream URL.
  - `patterson1977`: from the GDZ scan of Crelle volume 296, logical section `LOG_0014`, read by OCR.
  - `yoshimoto1987`: from the open Nagoya Math. J. archive on Cambridge Core.
  - `heathbrown2000`: from the Oxford University Research Archive. The service first marked the
    Springer DOI paywalled.

**Corrections made to what the service recorded.**

- *Kubota and Patterson.* The first "certified" entries for `kubota1969` and `patterson1977` were
  HTML landing pages (Kyoto's old DSpace URL and the EuDML record), not the works. They were
  refetched from the direct PDFs above, and the texts were checked to be the works: 70 pages, and
  38 pages with Theorem 8.1.
- *Tao.* `tao2015` first resolved to an unrelated arXiv paper (1502.05111, a clustering paper).
  It was refetched at arXiv:1410.7073v3, which was checked.
- *Missing fields.* The service left out author, title and year for URL fetches, and the
  published DOIs and venues of the arXiv entries. These were added by hand.
- *Locators.* Each locator was narrowed to the statements actually checked.

**Not cited.** The filed list had three further works:

- Heath-Brown 1995 (Acta Arith.): no open copy was found (IMPAN landing page).
- Huxley 1968 (Mathematika): the publisher returned HTTP 403.
- Galbraith's book.

None is needed: the first two are templates covered by AnalyticNumberTheoryPartII §5.29,
`baierbansal2018` and the preprint's Lemma 6.1, and the third concerns only the algorithm. They
were dropped rather than requested.

**No missing texts.** The service's provisional `needs-references.toml` listed Kubota, Patterson,
Yoshimoto, Heath-Brown 1995 and Huxley. Every entry was either resolved or dropped, so the file was
removed and the job does not need to park.

**What the texts showed that changes the brief.**

- *The alternate route.* `openai2026quasiRHalt` proves `11/12` by a mean square of sextic-twisted
  Möbius sums (its Proposition 3.1 and Section 3). It uses the cubic theta function (through
  `dunnradziwill2024` §5.1, `patterson1977` Theorem 8.1 and `yoshimoto1987`) and the quadratic large
  sieve of `goldmakherlouvel2013`. It mentions no zero detector, and it says it avoids the
  `(MN)^{2/3}` term of `bgl2014` Theorem 1.3. That route would postpone (U5), the `n`-th order sieve
  and T5 to the `7/8` stage, so the design compares the two routes (`target.md`, T1).
- *Bhargava–Ivanyos–Mittal–Saxena.* `bimsissac2017` (arXiv v1) states its Conjecture 6.3 for the
  characters of `𝔽_p^*`, with a strip symmetric about `1/2`. Its Theorem 6.7 gives the exponent
  `4/(1 − 2ϵ)`, which is `32` at `ϵ = 7/16`, matching the preprint. Its proof also uses `ψ(x)`
  (Lemma 6.6(2)), which must be read through `ζ`, since the principal character modulo `p` has
  zeros on `Re s = 0`. This settles the filed item U7. The general conditional theorem T4(a) gives
  the better exponent and is the planned route.
- *The large sieves.*
  - `goldmakherlouvel2013` Theorem 1.1 holds for any number field and a quadratic Hecke family
    (its Definition 1).
  - `bgl2014` Theorem 1.3 concerns the Fisher–Friedberg characters `χ_a` over a field containing
    `μ_n`. Its stated range of `n` is ambiguous in the extracted text, so the design reads it from
    the PDF.
  - The preprint also applies `heathbrown2000` Theorem 2 (the cubic large sieve) in (14.6) for
    Lemma 14.2. It is therefore an input, not only context.
- *Kazhdan–Patterson.* `kazhdanpatterson1984` (Introduction, p. 36) confirms that unique Whittaker
  models occur only for `r = n − 1` or `n`. This is the basis for not generalising theta
  coefficients to all `n`.
- *Kubota.* `kubota1969` treats the `n`-fold cover of `GL(2)` over a totally imaginary field
  containing `μ_n` (§§1–3), with its Eisenstein series (§§5–6).
- *Liu.* `liu2026improved` Part I (§§1–14) is a 35-page summary of the `7/8` proof by a human
  author. It is offered to the design as a second account.

## Suspicious text

None. Neither the issue body, the repository READMEs, `lean/docs/003.md`, the arXiv page nor the
Quanta article contained instructions addressed to this job.

## Left for the design

- Choose the route for T1: the probe of `openai2026quasiRH` Part I, or the Möbius mean square of
  `openai2026quasiRHalt`.
- Settle the cusp expansions: Patterson's theorem alone, or further steps of Dunn–Radziwiłł §5.
- Confirm line by line that no step rests on machine computation.
- Copy from the PDFs the exact hypotheses of `goldmakherlouvel2013` Definition 1 and of `bgl2014`
  Theorem 1.3, including its range of `n`.
- Check the Oxford copy of `heathbrown2000` Theorem 2 against the journal statement.
- Fix the primary convention.
- Size the (U1) and (U2) blocks.
