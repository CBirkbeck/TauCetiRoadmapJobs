# Design report: DESIGN-ExplicitCharacterSumsAndSieves

Deliverables: `packages/ExplicitCharacterSumsAndSieves/design/README.md` (1451 lines, seven layers),
`packages/ExplicitCharacterSumsAndSieves/design/plan.json` (66 targets, no gaps),
`packages/ExplicitCharacterSumsAndSieves/sources.toml` (51 entries; 15 added by this design). No
missing-references file is left: every text the design relies on was read or is settled as
uncertified or waived.

## What the design covers

- **Layer 0** (carriers): the exponential sum over the integers of a closed interval, the
  near-integer count `R(f, a, N, δ)`, the character interval sum `S_χ(M, N)` and its finite
  maximum `M_χ`; van der Corput's finite inequality for complex sequences (moved down, see below);
  the symmetry of even characters (target 14 of the triage, with the missing hypothesis
  `χ ≠ 1` added); the reduction of a character sum to the primitive character.
- **Layer 1** (triage targets 1–5): Kusmin–Landau in Landau's cot form, the asymmetric variant of
  Hiary–Patel–Yang, the second derivative test in Arias de Reyna's form (which implies Patel's
  Lemma 2.3 and equals Patel's sharper display (25)), Patel's corrected third derivative test
  (replacing Hiary's Lemma 1.2), Patel's fourth and fifth derivative tests (with the `β₄` misprint
  corrected), and Arias de Reyna's iterated van der Corput inequality in place of the
  Granville–Ramaré inner inequality.
- **Layer 2** (triage targets 7, 8, 10): the reduction to exponential sums (proved here with
  Fejér's kernel), the first derivative test (proved here by the mean value theorem, on any
  interval and for every `δ > 0`), Huxley's reduction and the second derivative test.
- **Layer 3** (triage targets 11–15 in modern form): the Gauss-sum expansion, the classical
  explicit Pólya–Vinogradov inequality with Pomerance's cosecant bound, Pomerance's lemmas and
  Theorem 1, Lapkova's Lemma 3A with the rounded Frolenkov–Soundararajan forms (`q ≥ 980` even,
  `q ≥ 33` odd, which contain the stated `q ≥ 1200`, `q ≥ 40` and discharge the old Prop
  `FS_OddSmallModuli`), and the Frolenkov–Soundararajan bound for nonprincipal characters.
- **Layer 4** (triage targets 16–18): Burgess's moment bound from Weil's bound, Treviño's energy
  lemmas, Burgess's amplification inequality, McGown's parametric Theorem A.9 and his Table
  (Theorem A.1), Treviño's Theorems 1–2 and Corollaries 1–2 with the arXiv v2 tables.
- **Layer 5** (triage targets 21, 22, 24, 25): explicit Selberg diagonal bounds (the kernel
  identity, the coprime comparison, Büthe's asymptotics, the Montgomery–Vaughan bound
  `S(z) ≥ log z + 1.07`), Greaves's density-sum bound proved by Rankin's method, Büthe's weighted
  sieves and weighted Brun–Titchmarsh theorems, the Montgomery–Vaughan inequality in a sifted form
  with Theorem 2 and the Ramaré–Viswanadham Lemmas 14–15 as corollaries (Lemma 15 strengthened
  from `9/2` to `7/2` by its own proof), Fan's inequalities (4)–(6).
- **Layer 6**: eight named computational hypotheses, each a finite numerical statement:
  `LapkovaSmallModuliVerified`, `MVDiagonalFiniteRange`, `ButheSmallRangeVerified`,
  `ButheMediumRangeVerified`, `FanFiniteRange`, `McGownTableCertificate`,
  `TrevinoTable1Certificate`, `TrevinoTable3Certificate`. `Suggested.lean`, when it is written at
  packaging, must declare these eight `Prop`s: they are the definitions the headline statements of
  §§3.5, 4.4, 4.5, 5.1, 5.4 and 5.6 take as hypotheses, and the README backticks their names.

## Proposed Part II: `ExplicitCharacterSumsAndSievesPartII`

The following triage targets and addendum items are not planned here. Each needs either a source
text whose statement could not be verified at the precision a roadmap requires, or a long chain of
inputs that would double this roadmap. Its introduction should say that the base roadmap stops at
Layers 0–6 above and that the Part II consumes them.

- *B-process and stationary phase* (triage target 6). The TME-EMT statement is not
  Karatsuba–Korolëv's theorem; the replacement is Patel–Yang 2024 Lemmas 2.1–2.3
  (`patelyang2024` lines 266–268, 475–477, 667–671, read and recorded). They need the Fresnel
  integral `∫ e(−λx²/2) dx = e(−1/8)/√λ` and the bounded convergence of the sawtooth Fourier series
  with explicit tails, neither of which is at the Mathlib pin. Lemma 2.2 also needs the hypothesis
  that the stationary point is interior (`c ∈ (a, b)`), because `1/|f′(a)|` is infinite when
  `c = a`; the Part II should state it so.
- *Explicit k-th derivative test for integer points* (triage target 9). Zhao (arXiv:2407.01778)
  reports a gap in Bordellès's major-arc lemma; his corrected constants (`16k³`, `30e³k²`) are in
  an OCR'd scan whose Theorem 2.1 display is not legible in the text layer (`zhao2024` lines 84–99).
  The Part II should re-derive the constants.
- *Bordignon–Kerr and Bordignon 2022* (triage target 15, BK Theorems 2, 5, Corollary 1; Bordignon
  RMI Theorem 1.1 with Tables 1–3, whose published numbering and `q ≥ q₀` hypothesis differ from
  arXiv v1). Their partial Gaussian sums need composite-modulus Burgess bounds and geometry of
  numbers.
- *Composite-modulus Burgess* (triage target 20, Jain-Sharma–Khale–Liu, and HLMLT arXiv:2511.17778):
  the complete sums of a multiplicative character of a rational function modulo a prime power are
  not in CharacterSumsOverFiniteFields (its §7.6 covers Kloosterman sums only). Corollary 1.2's
  factor is `(log log q + 1.69/log log q)^{1/2}` and uses an `n/φ(n)` bound owned by
  ExplicitMultiplicativeFunctions, which comes later in the merge order.
- *Booker's quadratic table* (triage target 19): `α(r)` is the closed form (42) of `booker2006`
  (`α(2) = 1.82208…`, matching `1.8221`), but `β(r)` comes from an optimisation over prime `A`
  (displays (43)–(46)) that was not reduced to a self-contained certificate.
- *Francis 2021* Tables 3 and 6: the arXiv v2 tables have anomalies (Table 6 repeats the
  `p₀ = 10¹⁰` column at `10¹¹`; its `10⁷⁵` row drops to `0.9178`); the published JNT tables are
  paywalled.
- *Dimension-two sieves* (triage target 23: Siebert, Riesel–Vaughan Lemma 4 with its `(L, A)`
  table, the twin-prime constant enclosure, Platt–Trudgian's twin-prime bound). They rest on
  Montgomery–Vaughan's weighted large sieve `Z ≤ L⁻¹` with weights `(N + (3/2)qz)⁻¹` (or
  Preissmann's `1.315`), which needs the weighted Hilbert inequality of AnalyticNumberTheoryPartI
  §1.5a and the uncertified texts of Siebert and Riesel–Vaughan.
- *Explicit linear sieve* (triage target 26): Bordignon–Johnston–Starichkova Theorem 6
  (`bordignonjohnstonstarichkova2022` lines 147–215, read) consumes the linear-sieve functions of
  SieveMethodsAndPrimePatterns §5.2 and a table of `C₁(ε)`, `C₂(ε)`; Nathanson's proof has an error
  that BJS repair.
- *Yamada's Brun–Titchmarsh with `log(y/k) + 0.8601`* (preprint): rests on PARI computations and
  Zuniga Alterman's explicit asymptotic.
- Yang's uniform k-th derivative test, Dhiman–Kadiri–Quesada-Herrera's refinements, the
  Levin–Pomerance–Soundararajan smoothed bound and Bordignon–Francis's transfer are context for the
  same Part II.

Bachman–Rachakonda and Qiu (triage targets 11b, 12) are not targets anywhere: they are superseded
by Lapkova's lemma for primitive characters and by Frolenkov–Soundararajan's corollary for
`q ≥ 1000`, and both texts are print-only.

## Notions moved down from later roadmaps

- **van der Corput's finite inequality** (§0.3). ProbabilisticAndMetricNumberTheory §2.5 states
  the same "finite_lag_inequality" inside its proof of van der Corput's difference theorem, and its
  scope paragraph claims "the finite van der Corput estimate". That roadmap is later in the merge
  order (ORDER position 274 against 271 here), so the inequality is owned here, at the generality of
  arbitrary complex coefficients and in the sharp form with the real part, from which both its
  absolute-value form and Yang's exponential-sum form follow. ProbabilisticAndMetricNumberTheory
  §2.5 should cite §0.3; the README lists it as a downstream consumer.

## Ownership and direction

- Suppliers: SieveMethodsAndPrimePatterns §§1.3, 2.9; CharacterSumsOverFiniteFields §4.7;
  AnalyticNumberTheoryPartI §§0.5, 0.19, 0.20. All three are earlier in the merge order. Each cited
  section was read at the head of its open new-roadmap pull request
  (`tauceti-roadmap roadmaps show`), and `roadmaps resolve` finds every citation.
- Not consumed, though in the area: LFunctions Layer 4 and ClassicalArithmeticCompletion §1.5
  (the target named them; no statement here needs them: the Legendre character is nonprincipal
  by Mathlib's `quadraticChar_ne_one`); ExplicitZetaBounds and ExplicitPrimeCounting (earlier in
  ORDER, but both triages make them consumers of this roadmap, and consuming them would close a
  cycle); ExplicitMultiplicativeFunctions (later in ORDER).
- **Merge-order note.** ORDER.txt lists ExplicitZetaBounds (269) and ExplicitPrimeCounting (270)
  before this roadmap (271), while their own targets consume this roadmap's Layers 1, 3 and 5.
  This roadmap names neither as a supplier, so its gate is clean; when those two are designed and
  name this roadmap, their gates will place them after it.
- AnalyticNumberTheoryPartI §0.7 uses "explicit Pólya–Vinogradov" inside a proof sketch without a
  target; it is earlier in the order and cannot consume §3.2. Its own roadmap should state the
  input it needs.
- ExplicitZetaBounds' triage lists this roadmap as a consumer of its "weighted and maximal large
  sieves". No statement planned here needs the weighted large sieve (it belongs to the dimension-two
  sieves of the proposed Part II), so no edge from ExplicitZetaBounds is made.
- Ownership against open pull requests: checked by object with `roadmaps grep` for Pólya–Vinogradov,
  Burgess, Brun–Titchmarsh, Kusmin–Landau, derivative tests, van der Corput, Selberg diagonal sums
  and integers free of small prime factors, against main and the 472 open roadmap pull requests at
  their heads. Hits outside the suppliers were unrelated (Burgess's dichotomy in descriptive set
  theory, PDE second-derivative tests). `roadmaps overlaps ExplicitCharacterSumsAndSieves` reports
  that no open pull request changes this roadmap (it is not on main or in a pull request yet), so
  no id this design cites is dropped by an open revision.

## Gaps

None. Every prerequisite is a pinned declaration, a cited section of an earlier roadmap, an earlier
target, or a Layer 6 hypothesis.

## Sources

Added by this design (fetched through the sources service): `ariasdereyna2024` (arXiv
2407.02094v1), `hiarypatelyang2024` (arXiv 2207.02366v1), `yang2024` (arXiv 2301.03165v2),
`patelyang2024` (arXiv 2302.13444v1), `francis2021` (arXiv 1910.13669v2), `yamada2023` (arXiv
2312.16090v1), `zhao2024` (arXiv 2407.01778v1, OCR), `platttrudgian2018` (arXiv 1803.01925v1),
`bordignonjohnstonstarichkova2022` (arXiv 2207.09452v6, OCR), `pomerance2011` (author page),
`lapkova2018` (Europe PMC full text, CC BY 4.0), `frolenkov2011` (arXiv 1107.0381v1), `hunter2016`
(arXiv 1701.05980v1). Recorded uncertified: `trevino2015kth` (J. Number Theory 149, paywalled;
the moment bound's proof) and `montgomeryvaughan2007` (book, §9.4, added by hand with its DOI).

Sources that could not be read and are cited by locator only (already settled): Frolenkov–
Soundararajan 2013 (no arXiv copy exists; the statements of §§3.5–3.6 are quoted from the TME-EMT
page and from Hunter's thesis, and the route of Lapkova's Lemma 3A for `q > 25` is their proof of
Theorem 2), Montgomery–Vaughan 1973 (Theorem 2, Lemmas 7 and 10; the diagonal bound is quoted by
Fan, the shape of the proof by Ramaré–Viswanadham), Bordellès 2012, Filaseta 1990, Greaves 2001,
van Lint–Richert 1965 (waived; the coprime comparison is proved here and the choice of `z` in
Büthe's Theorem 4.2 follows them). Version notes: Treviño's tables are the arXiv v2 tables;
McGown's numbering is arXiv v2 (published as "Norm-Euclidean cyclic fields of prime degree");
Patel's are arXiv v1.

Twenty-two manifest entries are no longer cited by this design (they belong to the proposed Part
II or are superseded); their keys and settled statuses are kept and `cited_for` says so.

Nothing fetched contained instructions. Nothing suspicious to report.

## Dependency check

    $ tauceti-roadmap … gate --candidate packages/ExplicitCharacterSumsAndSieves/design/README.md --only ExplicitCharacterSumsAndSieves --order merge-order/ORDER.txt --content content
    depcheck: 240 roadmaps, 2431 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the README: "Cross-roadmap citations
found nowhere: None. Lean names found nowhere: None." Every backticked Mathlib and Tau Ceti name
was separately checked against the pinned sources (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`).

## Adversarial pass

One row per statement or convention. "Values" are computed; "change" records what the pass altered
in the statement.

| statement | instances tried | values computed | result | change |
|---|---|---|---|---|
| convention `e(x)` | `x = 1/2, 1/4` | `e(1/2) = −1`, `e(1/4) = i` (Check of 0.1: `f = x/2` on `[0, 2]` gives `1`) | holds | pinned as Check |
| convention `‖x‖` | `2.3, 2.5, −0.2` | `0.3, 0.5, 0.2`; fractional part gives `0.8` at `−0.2` | holds | uses `UnitAddCircle.norm_eq` |
| 0.1 interval sum | `f ≡ 0` on `[0, 2]`, `[0.2, 0.8]`; `x/2` on `[0, 3]`; `f = x` | `3`, `0`, `0`, `3` | holds | half-open sources converted with `a = ⌊X⌋ + 1` |
| 0.2 count `R` | `x/3`, `N = 6`, `δ = 0.1`; `δ = 1/3` at `n = 1` | `R = 3`; `n = 1` not counted | holds | strict `<` fixed |
| 0.3 van der Corput | `N = 1`; `b = (1, 1), H = 2`; `b = (1, −1)`; `H > N` | `H²|b|²` both sides; `16 ≤ 18` (`12` with factor `N`); `0 ≤ 6`; `9 ≤ 9` | holds | sharp form with `Re` adopted so Arias's Lemma 6 follows |
| 0.4 `S_χ`, `M_χ` | quadratic mod 3, mod 5; principal mod 3 | `M = 1`, `M = 2`; principal: `S(0, 6) = 4 > M = 2` | bound needs `χ ≠ 1` | hypothesis `χ ≠ 1` on the bound |
| 0.5 even symmetry | quadratic mod 5; `χ₄`; principal mod 5 | `M = 2 = 2·1`; `χ₄`: `M = 1 < 2`; principal: `φ(5) − S` | false without `χ ≠ 1` | hypothesis `χ ≠ 1` added (the target lacked it) |
| 0.6 primitive reduction | principal mod 6; `χ₄` lifted to 12, `S(0, 5)` | `2 = 6 − 3 − 2 + 1`; `2 = 1 + 1` (without `χ*(d)`: `0`) | holds | — |
| 1.1 Kusmin–Landau | `x/2` on `[0, 2]`; `x/3` on `[0, 1]`; `f ≡ 0` | `1 = cot(π/4)`; `1 ≤ √3`; unbounded | holds; `1/(πθ)` refuted (`2/π < 1`) | — |
| 1.2 asymmetric | `U = V = 1/θ`; `x/3`, `U = 3`, `V = 3/2` | `2/(πθ)`; `1.43 ≥ 1` | holds | closed-interval form (implies HPY's `[a, b)`) |
| 1.3a second derivative | identity with Patel (25); Patel (24) gap; `x²/200` on `[0, 10]` | equal; gap `L/V + 1`; `50.5 ≥ 11` | holds | Arias's form is the target, Patel's a corollary |
| 1.3b constant `A` | — | `(2/√π)(1 + √(1 + 3π/8)) = 2.79368` | holds | `b − a ≥ 1` kept |
| 1.3c Patel 2.3 | `λ = W/V` | equals TME-EMT form | holds | `V > 0` forced by `1/W ≤ 1/V` |
| 1.4 third derivative | `W₃ = η₃ = λ₃ = 1`; Hiary's `β` | `α₃ = 6.702`, `β₃ = 16.036`; Hiary `7.27` | Hiary's constants invalid | Patel's corrected constants; three derivatives (source says four) |
| 1.4 lag `W₃/m ≤ 1` | `m ≥ W₃` | first term `4λ₃L√(m/W₃)/√π ≥ L` | trivial bound absorbed | stated in route |
| 1.5a fourth derivative | lag-sum coefficients; `β₄` | `72/91, 72/55`; proof gives `18/10 = 9/5`, statement prints `18/20` | printed `β₄` unproved | `β₄ = (9/5)√(β̃₃η₃)η₄^{−1/3}` |
| 1.5b fifth derivative | coefficients | `392/435, 392/351, 98/78, 392/275` from `2/((s+1)(s+2))` | holds | `α̃₄ ≥ 1.74 > 1` checked for the lag case |
| 1.6 iterated vdC | `B`-property at `H = 1, T = 6`; `B = 4.5`; `d = 1, H₁ = 1` | `28 ≤ 28.97`; `28 > 27`; bound `4.83` | holds; `B` minimal | — |
| 2.1 Filaseta reduction | `f ≡ 0`, `N = 4`, `δ = 0.1`, `H = 2`; `x/2`; `δ = 0.2` | `5 ≤ 24`; `3 ≤ 16`; `K = 1` | holds | proved with Fejér (`0.81H` from concavity; Jordan's `2/π` gives `4.93N/H`, too weak) |
| 2.2 first derivative | `x/10` on `[0, 20]`, `δ = 0.05`; `δ = 0.49`; `J ≥ 2` case | `3 ≤ 10`; `N + 1 ≤ 1.96N + 1`; `4δ²/λ₁ ≤ 2c₁Nδ` | holds for all `δ > 0`, real `N > 0` | generalised from `[N, 2N]` with proof |
| 2.3a Huxley reduction | `x/2`, `δ = 0.1`, `N = 4`, `A = 2` | `3 ≤ 2 + 0 + 3 + 1 = 6` | holds | `2δ` in differenced count |
| 2.3b second derivative | `x²/100`, `N = 10` vs `50` | `Nλ₂ = 0.2 < 1` (excluded); bound `6(19.57 + 173.2√δ + 1)` | holds | — |
| 3.1 Gauss expansion | mod 3: `τ`; `N = 1`; principal mod 4 | `i√3`; recovers `χ(1) = 1`; `τ = 0` | needs primitivity | uses `τ(χ⁻¹)` (sign `χ(−1)` matters for quartic mod 5) |
| 3.2 classical PV | `q = 3, 5`; `p = 2, 3` | `4/3 ≥ 1`; `2.462 ≥ 2`; `0.726 > 0.693` at `p = 2`, `0.911 ≤ 1.099` at `p = 3` | `√p log p` form false at `p = 2` | restricted to `p ≥ 3` (no nonprincipal character mod 2) |
| 3.3a closed forms | `x = π/2` | `π/4`; `−(log 2)/2` | holds | — |
| 3.3b Lemma 2 | `C₁(π)`, `C₃(π)`; alternative route at `s = 1/(2n)` | `−1`, `−5/6`; `log n − 2n/(n+1) > −2/n` for `n = 1..5` (`−1, −0.64, −0.40, −0.21, −0.06`) | holds | elementary route given beside Young's |
| 3.3c Lemma 3 | `n = 1`, `x = π/2` | `1 < 2.72`; without the constant term `0 < 1` fails | holds | — |
| 3.3d Lemma 4 | `n ≥ 1`, `q ≥ 2` | follows from tail bound × §3.2 sum | holds | — |
| 3.4 Pomerance | `q = 3` odd; `q = 5` even; `q = 2` | `2.087 ≥ 1`; `4.515 ≥ 2`; `log log 2 < 0` but no primitive character | holds | — |
| 3.5a Lapkova | `q = 3, 4, 5` against 6.1 | `2.75, 3.11, 4.51` vs `M = 1, 1, 2` | holds | small `q` as Prop |
| 3.5b rounded FS | `q = 980, 979`; `33, 32` | `31.3044 ≤ 31.3050`, fails at 979; `5.741 ≤ 5.745`, `5.669 > 5.657` | thresholds exact | `q ≥ 980`, `q ≥ 33` (contain `1200`, `40`) |
| 3.6 FS nonprincipal | `q = 1000`; primitive even `q = 10⁴`; crude route `q = 6q*` | `123.5 < 200`; `283` vs `442`; `0.331 > 0.2251` | statement not derivable from 3.5 + 0.6 | route recorded as FS Theorem 1 (uncertified) |
| 4.1a degenerate count | `r = 2, H = 2`; `H = 1` | `8 ≤ 12`; `1 ≤ 3` | holds | — |
| 4.1b moment bound | `r = 1`, `B < p`; `(2r − 1)!!` at `r = 3` | `⌊B⌋p − ⌊B⌋²`; `15` | holds; exact `r = 1` needs `B < p` | `conj χ(y) = χ(y^{d−1})` checked at `y = 0` |
| 4.2a/b energy | `A = 28, N = 400, p = 10⁷`; `N = 300` | `88,437` vs trivial `313,600`; `A < N/12` fails | holds | — |
| 4.3 amplification | `A = B = 1`, `r = 1`; `h = N`; `A ≥ p` | `√(N(p − 1)) + 2E(1)`; identity for all `h`; non-invertible | needs `A < p` | hypothesis `A < p` added |
| 4.4a McGown A.9 | `d = 4`; range coefficient | `1 − 2/2 = 0`; range at least `√(rd)` | holds with conservative range | stated with `√(rd)` (the text layer is ambiguous between `√(rd)` and `√r·d`; both contain it) |
| 4.4b McGown A.1 | `C₀(2)`, `C₀(3)`; (A.1) at `r = 2, 15` | `10.0364`, `4.9538`; `1093 ≥ 1056`, `1.66·10⁵ ≥ 7920` | holds | strict `<` via `C₀ < C` |
| 4.5a Treviño 1 | `r = 2`, `p = 10⁷` | bound `225.8√N`, below `N` iff `N > 5.1·10⁴` = range (37) | consistent | — |
| 4.5b Corollary 1 | `r = 1` | `2.74√p log p ≥` §3.2 | holds | — |
| 4.5c Treviño 2 | TME-EMT column vs arXiv | wiki `3.5341 < 3.5751` at `r = 2, 10²⁰` | wiki table unproved | arXiv v2 table stated |
| 4.5d Corollary 2 | `p ≥ 10¹⁰` | uses `c₁(2, 10¹⁰) = 2.5173 ≤ 2.6` | holds | — |
| 5.1a kernel identity | `S(6)`; `m = 12` | `3.25`; `rad(12) = 6`, unique factorisation `12 = 6·2` | holds | — |
| 5.1b coprime | `k = 6, z = 7` | `1.4167 ≥ 1.139` | holds | — |
| 5.1c Büthe asymptotics | constant | `γ + Σ log p/(p(p−1)) = 1.3326`; at `z = 10⁹`, `58/√z = 0.0018` | holds | — |
| 5.1d MV diagonal | `z = 6, 10`; just below `6`; `[3, 5)` with `0.89`; just below `3` | `3.25 ≥ 2.862`, `3.667 ≥ 3.373`; `2.75 < 2.860`; `2.5 ≥ 2.497`; `2 < 2.165` | threshold `6` sharp | finite part as Prop |
| 5.2 Greaves | `s = 2B`; `κ ≡ 1, z = 3, s = 2`; `B = 0` | `0`; `2 ≥ 0.748`; undefined | holds; needs `B > 0` | `B > 0` added; restricted to `d | P(z)` (implies the wiki form) |
| 5.3a remainder | `f ≡ 1`; step function at integers | `|y/(kd) − #| ≤ 1`; `|6ε − 4| ≤ 1` false | needs absolute continuity | carrier `AbsolutelyContinuousOnInterval` |
| 5.3b weighted Selberg | `k = 1, z = 1`; strict cutoff | reduces to remainder at `d = 1`; level `⌊z⌋ + 1/2` matches `n ≤ z` | holds | level stated |
| 5.3c Eratosthenes | `z = 1` | `P = 1`, error `2⁰ = 1` | holds | `2^{π(z)}` (text layer prints `2π(z)`) |
| 5.4d `ρ_I` | `f ≡ 1`; tent; `f = 0` | `y`; `y/6`; `0` by definition | holds | no `0/0` |
| 5.4a Büthe 4.2 | `f ≡ 1` | van Lint–Richert form, weaker by `1 + 8/log(y/k)` | holds | — |
| 5.4b/c Büthe 4.3 | `I = [0, 10]`; `Y > 4·10¹⁸` gives `z > 10⁹` | `4 < 8.69`; `√(4·10¹⁸)/2 = 10⁹` | holds | ranges as Props |
| 5.5a sifted MV | — | statement from RV's description (lines 660–666) | proof route partly uncertified | recorded |
| 5.5b MV Theorem 2 | `k = 1, y = 10`; `k = 3, ℓ = 1, y = 30` | `4 ≤ 8.69`; `3 ≤ 13.03` | holds | — |
| 5.5c RV Lemma 14 | `A = 1, B = 7` | powers `2, 4, 8` in `(1, 8]` | argument needs `A ≥ B` | kept |
| 5.5d RV Lemma 15 | `M = 121, q = 1`; `q = 5` | `3.434 ≤ 3.5`; needs `M ≥ 125` | `9/2` loose | strengthened to `7/2`; `gcd(a, q) = 1` added |
| 5.6 Fan | `x = 9, z = 3`; `x = 32, z = 4`; `x = z = 1.5`; `z = 1` | `3 < 4.46`; `11 < 15.4`; `1 < 3.70`; `log 1 = 0` | holds | small `x` as Prop; ANT inputs at arguments `≥ 319` only |
| 6.1–6.8 hypotheses | each against its consumer | none contains its consumer's conclusion (6.1 is bounded to `q ≤ 25`; 6.6 is a closed form; 6.7–6.8 are real inequalities in `p`) | not vacuous | — |
| 6.3 witnesses | `Y = 100, 1.5, 20` | `z = 7`: `42.86 < 43.43`; `z = 1`: `2.5 < 7.40`; `z = 2`: `13 < 13.35` | witness depends on `Y` | — |
| 6.7 `A` | `p = 10⁷`, `r = 2`, `k = 2/45`, `c′₁ = 2.738` | `A = 40.3 ≥ 29` | holds | — |

Further notes from the pass:

- Generality: the integer-point tests are stated on `[a, a + N]` (real `a`) rather than `[N, 2N]`;
  2.1 and 2.2 carry complete proofs on the general interval, 2.3b's proof uses only the length.
  The exponential-sum tests are stated on closed real intervals, which implies the half-open
  forms of Arias de Reyna and Hiary–Patel–Yang.
- Context: every Burgess statement assumes `p` prime and `χ ≠ 1`, which makes `χ` primitive;
  every Pólya–Vinogradov statement for primitive characters has `q ≥ 2`, hence `q ≥ 3`.
- Unused hypotheses: none identified beyond the source's "four continuous derivatives" in Patel's
  Lemma 2.5, replaced by three.
