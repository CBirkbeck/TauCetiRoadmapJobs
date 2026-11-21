# Review of PositivityOfDirichletSeriesWithKernels (pull request #2903 at d2de11b)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/PositivityOfDirichletSeriesWithKernels/`
**Verdict:** needs changes

**Summary.** Needs changes, for one finding, which is about ownership and not about truth: Landau's theorem for integrals of nonnegative functions, which 6.3 states and the Scope section claims, is also stated and claimed by the open roadmap SpecialFunctionsGamma (§10.1), in a more general form, and neither text mentions the other (R01). I recomputed every statement, Check and worked example of Layers 6, 7 and 8, the route of the windowed theorem in both its forms, and the eight declarations of `Suggested.lean`, and found nothing false. There are four small corrections and one format note, none blocking. The human reviewers have a scope question and two licence questions, because the windowed theorem's only source is a formal proof I could not read.

## R01 (P2) — Landau's theorem (6.3) has a second owner: SpecialFunctionsGamma §10.1 states it for `∫ w g^s` on a measure space, and this roadmap claims it without citing that statement

Two open roadmaps would each have the library prove the same classical theorem, and whichever merges second restates what the first owns. The Scope section says (line 829) "This roadmap owns Landau's theorem 6.3, for eventually nonnegative functions and the complex half-plane of `HasLaplace`", and its paragraph on statements with relatives elsewhere names only 6.1 (a) and 8.1 (b). The open pull request that adds SpecialFunctionsGamma (#2191, another author, a new roadmap) lists among its "Auxiliary results owned here" (`TauCetiRoadmap/SpecialFunctionsGamma/README.md`, lines 1387–1388 at its head) "Landau's theorem for integrals of nonnegative functions against `x^s` (10.1)", and states it at lines 1194–1202: for `w ≥ 0`, `g > 0` measurable on a measure space, if `F(s) = ∫ w g^s` converges on a real interval `(s₀, s₁)` and continues holomorphically to a neighbourhood of `[s₀′, s₁)`, the integral converges on `(s₀′, s₁)` and equals the continuation; it adds that `g = e^(−t)` gives the theorem on the real point of the axis of convergence of a Laplace integral.

The two are the same theorem, and that statement implies 6.3. Take the measure `du` on `(0, ∞)`, `w = f ≥ 0`, `g = e^(−u)`, `s₀ = a`, `s₁ = a + 1`, `s₀′ = a − r/2`, and as continuation `F` on `Re s > a` glued to `F₁` on `B(a, r)`: the result is `∫₀^∞ f(u) e^(−σu) du < ∞` for real `σ > a − r/2`, which is `HasLaplace f s` for `Re s > a − r/2` because the integrand has modulus `f(u) e^(−(Re s)u)`, and the value is `F₁` by the identity theorem. The reduction from eventually nonnegative to nonnegative is the first sentence of the proof sketch of 6.3. The converse does not hold as stated (a general measure space is not a function on `(0, ∞)`), so the general form is the other roadmap's.

The smallest change that leaves one owner: either cite SpecialFunctionsGamma §10.1 for the theorem and keep 6.3 as its Laplace-transform form (eventually nonnegative `f`, complex half-plane, the value through `HasLaplace`), with that roadmap in the `*Needs:*` line of 6.3, in the supplier contracts and in the description's list of pull requests that merge first; or keep 6.3 with its own proof as a variant, replace the unqualified ownership sentence at line 829 by one that names SpecialFunctionsGamma §10.1 and says in a clause how 6.3 differs, and settle with that roadmap's author which of the two cites the other. 6.4–6.10 are not affected: they consume 6.3 only through its statement.

## C01 — The Scope section still says that 8.2 (a) evaluates the Gaussian integrals through the Weil index; 8.2 (a) now defines the Gauss factor by the integral, and only its last clause uses the Weil index

A reader of the Scope section concludes that all of 8.2 waits on MetaplecticAutomorphicForms §2.1, and the single `*Needs:*` line of 8.2 (line 779) says the same. The last "Not owned here" bullet (line 837) reads "8.2 (a) takes it factor by factor over `K` and evaluates the Gaussian integrals over admissible lattices through it". But 8.2 (a) says (lines 724–725) that the Gauss factor is defined by the integral and that (b), (c), (d) use only that definition, `|γ(a)| = 1` and `γ(ab²) = γ(a)`, and the route proves `γ(ab²) = γ(a)` "without the Weil index" (line 759).

Replace the sentence by what the head does, for instance: "8.2 (a) identifies the Gauss factor, which it defines by the Gaussian integral over an admissible lattice, with the product of the Weil indices over the factors of `K`." In the `*Needs:*` line, attach MetaplecticAutomorphicForms §2.1 to the identification clause of (a) only, so that an implementer of (a)–(d) without that clause is not blocked behind it.

## C02 — Four sentences of the description describe an earlier head

- "`Suggested.lean` states 5 headline theorems with `sorry` proofs and 1 definition", followed by six names. The head has seven theorems and one definition: `windowedLandau_simplePole` and `windowedLandau_mellin_simplePole` are missing from the list, and the description nowhere says that the windowed theorem is stated twice, in the form of the formal proof and as the roadmap's extension.
- "says that the non-archimedean stationary-phase formula 8.2 (d) is not statable at the pins, because its coefficients are Weil indices, which neither Mathlib nor Tau Ceti has". The docstring at the head says that 8.2 (d) is not stated because it needs the lattices, orthogonals, measure, module and Gauss factor of 8.2, and that the Weil index "is not needed to state it".
- "The non-archimedean Gaussian integrals are evaluated through the Weil index of MetaplecticAutomorphicForms §2.1, taken factor by factor". At the head the Gauss factor is defined by the integral and identified with the Weil index in one clause (see C01).
- The sentence on the automatic checks, which says that two of them do not pass: the one that the pull request changes nothing outside the roadmap's folder, and the one that the roadmap's suppliers all come before it in the merge order, "which reports that the roadmap is not yet in the merge order". At this head every automatic check passes and the merge order lists the roadmap, so a reader of the description would look for two problems that are no longer there.

Text that would be right for the third paragraph of the description: "`Suggested.lean` states 7 theorems with `sorry` proofs and 1 definition with a real body (`rightmost_pole_real_of_le`; `windowedLandau_simplePole` and `windowedLandau_mellin_simplePole`, the forms of the formal proof; `windowedLandau` and `windowedLandau_mellin`, their extensions; `HasWindows`; `tendsto_integral_of_laplaceMethod`; `stationaryPhase_leadingTerm`). Its docstring names the targets it leaves out and says that 8.2 (d) is not stated because the lattices, their orthogonals, the self-dual measure and the Gauss factor of 8.2 are README targets, not definitions available at the pins."

## C03 — No statement attributed to [FormalProof] has a file or a declaration, so none of the attributions can be checked

The README says thirteen times what [FormalProof] proves or defines (the form of 6.8 with `A = 2`, `0 < θ < 1` and simple poles; 6.2 (a), (b), (e), (f); 6.5 (a), (c); 6.6; 6.7; the predicate of 6.9 (a); "the statements of Layers 7 and 8"; the Gauss factor defined by the integral), and the Conventions promise that "its hypotheses, ranges and constants are those of the proof". The only locator is the repository address in the References. A sibling roadmap of the same family locates the same source exactly: ThetaChainsAndFrobeniusPrimeSums cites the window predicate as `Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Window.lean` (`Formalism.HC.HasWindows`).

Give each such statement its file and declaration name in the same way, at the place where the attribution is made (6.2, 6.5, 6.6, 6.7, both forms of 6.8, 6.9 (a) and (b), 7.1, 8.1, 8.2). The same holds, more mildly, for the classical references: Landau 1905, Widder Chapter II and Montgomery–Vaughan §15.1 are cited without a theorem or page number.

## C04 — `windowedLandau_simplePole` and `windowedLandau_mellin_simplePole` follow from the two extensions, and three of their hypotheses are then not needed

An implementer who has `windowedLandau` gets `windowedLandau_simplePole` in six lines, so as an acceptance test it asks for nothing more, and a reader of the Conventions ("restrictions that the route written here does not visibly use") is not told that the extension dispenses with them altogether. I elaborated the derivation on a copy of the file: restrict `MeromorphicOn` from `{0 < Re s}` to `{θ < Re s}`, apply `windowedLandau` with `A = 2`, and in the second alternative the real pole `β > θ > 0` has a negative leading coefficient, against the positive one that the hypothesis on real poles gives. The hypotheses `θ < 1`, `|g(u)| ≤ C₀ e^(2u)` and "every pole is simple" are not used. The Mellin pair stands in the same relation (the bound `|G(y)| ≤ C₀ y²` gives the integrability hypothesis with `A = 2`).

Nothing need be removed: the two statements are the record of what the formal proof states. Say so in their docstrings and at 6.8 and 6.9 (b), for instance "the case `A = 2` of `windowedLandau`, with simple poles and positive residues, kept as the statement of the formal proof; the hypotheses `θ < 1`, the pointwise bound and the simplicity of the poles are not needed for the conclusion".

## N01 — The module docstring says that 8.2 (d) "is not stated here" but not that it is not statable at the pins

Say it in those words and name the missing carrier (a finite product of finite extensions of fields `ℚ_p` with its compact open subring, lattices and self-dual Haar measure has no carrier at the pins), so that a reader can tell a headline that cannot be stated from one that was left out.

## Questions for the author

- Is the repository named under [FormalProof] the same text as the archive that the Announcement itself names as the proof (Announcement line 53, an archive in fourteen parts on the author's page)? The Announcement does not mention the repository, and I could read neither.
- The Announcement, as cached, carries no date; its timeline ends on 16 November 2026 (Announcement line 185). Where is "20 November 2026" (References, and the description) taken from?

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 6.1 Taylor coefficients | `g = 1`; `g = e^(Au)`; `1/s` altered at `−1/2` | `a_k(z) = z^(−k−1)`; pole at `s = A` on the line; order `0` at `−1/2`, normal form `1/s` | true | none |
| 6.2 Gamma kernel | `k = 0`; `λ = 4`; `λ = 1`; (f) with `l = 2 + 6/δ` | mass `1/a`; `φ(1/2) = 0.824`, `φ(√2) = 0.935`, `U_4(1) = 1.207`; `φ(1) = 1`; exponent margins `U` and `≥ U/2` | true | none |
| 6.3 Landau's theorem | `f = 1`; `f = e^(−u)`; `f = sin u` | `1/s` singular at `0`; `1/(s+1)` converges on `Re s > −1`; `1/(s²+1)` analytic at `σ_c = 0` | true | R01 (ownership) |
| 6.4 one-sided forms | `−e^(βu)`; `−u e^(βu)`; `e^(βu) cos γu`; `H = C/(s−θ) − Φ` | coefficients `−1`; residue `0`, coefficient `−1`; poles `β ± iγ`; leading coefficient of `H` is `−c` | true | none |
| 6.5 window inequalities | `g ≥ 0, γ = 0`; `g = −1`; `A = −1`, `g = 1_(0,1)`, `σ = k = 0` | equality; `|σ+iγ|^(−k−1) − σ^(−k−1) < 0 ≤ 0`; `2 ≤ 2`; condition on `σ` is `q(σ−θ′) ≤ σ−A′` | true | none |
| 6.6 coefficients near a pole | `(s−ρ)^(−1)`; `(s−ρ)^(−2)`; general `j` | `(z−ρ)^(−k−1)`; `(k+1)(z−ρ)^(−k−2)`; `C(k+j−1, j−1)(z−ρ)^(−k−j)` | true | none |
| 6.7 expansion point | `Z = {β ± iγ₀}`; `Z = {β}`; `D = σ − θ` | case (A) only; case (B) only; then `β = θ` contradicts `Z ∩ {Re > θ} ≠ ∅`, so `β > θ` | true | none |
| 6.8 windowed theorem | steps 2, 4, 5; rescaling `e^(−tθ₀u) g(tu)`; four Checks | `(r′/d)^k ≥ e^(2ηU)` against `M′ + 2(e^(ηU) + I)`; transform `Φ(θ₀+s/t)/t`, residues unchanged; all four as stated | true | C04 |
| 6.9 windows, Mellin, Dirichlet | `y = e^u`; `⋃_{j≥1}[2^(2^j), 2^(2^j+1)]`; `j = 0`; `c(n) = log n` | `[U, λU] ↦ [Y, Y^λ]`, `e^(ηU) = Y^η`; `Y^(λ−1) ≤ 2`; `[2, 8] = [2, 2³]`; `(σ−1)^(−2)` | true | none |
| 6.10 agreement | `c = 1`; `c(n) = n^(σ_a−1)/log²(n+1)` | `ζ(s)/s` singular at `1`; converges at `σ_a`, not left of it | true | none |
| 7.1 Laplace's method | `e^(−(1+i)tY²)`; `(1+Y²)^(−t)`; `e^(−tY²) − e^(−t(Y−t)²)`; `n = 0` | both sides `(π/(1+i))^(1/2)`, modulus `2^(−1/4)√π`; `√(πt)Γ(t−½)/Γ(t) → √π`; integral `0`; `m·f_t(0) → m ≠ 0` | true | none |
| 8.1 stationary phase on `ℂ^n` | (a) `β = 2, a = δ = 1`; (c) `n = 1`, `x + 1/x`, `r = 0.4`, `Λ = 7`; (d) `n = 1, 2`; Lean `n = 0` | `1/√2` both sides; differences `5.609·10⁻⁴ = 1.402 t²`, `5.54·10⁻⁵ = 0.554 t²`; `det = 3z^(−2)`; both sides equal | true | none |
| 8.2 non-archimedean | `ℚ_3`, `M = (2/3)`, `L = ℤ_3, 3⁻¹ℤ_3, 3ℤ_3`; (d) `t = 9`, `t = 3`; (b) `m = 1, 2, 3` | `i/√3`, `i/√3`, `1/3`; `(2/3)cos(4π/9)` both sides, `−1/3` against `1`; `Σy + ∏w − 1 = ½yᵀM(w)y` at three points | true | C01 |
| `rightmost_pole_real_of_le` | compared with 6.4 (c); `sin`-type junk | a.e. bound for `u ≥ u₀`; integrability in both alternatives; no hypothesis contains the conclusion | matches README | none |
| `windowedLandau`, `windowedLandau_simplePole` | junk value of the interval integral; derivation of one from the other | `g⁺e^(−θu)` integrable on `[U, (1+δ)U]` from the transform hypothesis; derivation elaborates in 6 lines | match README | C04 |
| `HasWindows`, the two Mellin forms | `Y₀ < 1`; `S = [x₀, ∞)` | `Y ≥ max(Y₀, 1)`; window `[Y, Y^κ] ⊆ S` once `Y ≥ max(x₀, 1)` | match README | C04 |
| `tendsto_integral_of_laplaceMethod` | `t = 0` in `(√t)⁻¹ • v`; `finrank = 0` | irrelevant under `atTop`; factor `t^0 = 1` | matches 7.1 (a), (c), (d) | none |
| `stationaryPhase_leadingTerm` | norm on `Fin n → ℂ`; measure; `C` before `V` | sup norm, so balls are polydiscs; `(‖β‖/2π)^n •` volume is `μ_β^n`; `∃ C, ∀ x₀ g V a S` | matches 8.1 (c) | none |

- Source locators checked against the text: 7 in DabrowskiFisher1997 (Proposition 1.3 (a) at line 353, (1.3) at line 376, Theorem 1.8 (a), (b) at lines 457–477, Corollary 1.10 at line 493, Examples 1.16 and 1.17 at lines 861 and 983, Lemma 1.20 at line 1094); the Announcement read whole.
- Library declarations opened at the pins: 28 of Mathlib (among them `meromorphicTrailingCoeffAt_congr_nhdsNE`, `Mathlib/Analysis/Meromorphic/TrailingCoefficient.lean:186`; `ProbabilityTheory.gammaPDFReal`, `Mathlib/Probability/Distributions/Gamma.lean:45`; `MeasureTheory.integral_comp_exp_Ioi`, `Mathlib/MeasureTheory/Integral/IntegralEqImproper.lean:1157`) and 2 of Tau Ceti (`TauCeti.Contour.exists_laurent_data_of_meromorphicAt`, `TauCeti/Analysis/Contour/MeromorphicLaurent.lean:223`; `TauCeti.LSeries.landau`, `TauCeti/NumberTheory/LSeries/Landau.lean:296`); all exist as cited.
- Cross-roadmap citations resolved: 15 (ArithmeticDirichletSeriesPartII Conventions, §0.1, §0.2, §4.1; AnalyticNumberTheoryPartII §4.5c, §5.3g; MetaplecticAutomorphicForms §2.1; AsymptoticExpansions §4.4, §5.2, §13.6, Layers 5 and 6; CharacterSumsOverFiniteFields §1.4, §7.5; completed ArithmeticDirichletSeries 8.1; QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups §1.3 (i) at its open head).
- Automatic checks: all passed. Dependency check output: `depcheck: 171 roadmaps, 1991 edges, 0 problem(s)`. Changes outside the folder: the three files of the family index only.
- Elaboration of `Suggested.lean`: `sorry` the only warning (7 theorems). The file has no `variable` block; the elaborated type of each of the 8 declarations was compared with its README statement, and nothing changed.
- One-tactic probe on a copy: none of the 7 theorems closes with `simp`, `rfl` or `infer_instance`.
- Wording: 9 passages compared (7 of DabrowskiFisher1997, 2 of the Announcement); no shared run of words beyond formulas and names.

Overlap check: read GeneralizedRiemannHypothesisFromWindowBounds, BesselPoincareSeriesAndGramBounds, QuasiRiemannHypothesis, ThetaChainsAndFrobeniusPrimeSums, the family index, ArithmeticDirichletSeriesPartII, AnalyticNumberTheoryPartIII, AsymptoticExpansions and SpecialFunctionsGamma; `HasWindows` and the windowed theorem: this roadmap (the siblings cite 6.8 and 6.9); `HasLaplace`: ArithmeticDirichletSeriesPartII; the Weil index: MetaplecticAutomorphicForms; Landau's theorem for nonnegative integrands: this roadmap and SpecialFunctionsGamma both (R01).

Source independence: 9 passages compared with 2 sources, none shared; largest share FormalProof, 13 of 26 citations, whose text and contents could not be read; contents compared with DabrowskiFisher1997 §1 (the next largest, 7): independent, only 8.2 touches it and its clauses are ordered by their dependencies.

Research link: Layer 6 extends Landau's theorem (Landau 1905; Montgomery–Vaughan 2007, §15.1) and stands beside the localized oscillation theorems of Kaczorowski–Pintz (1986–87); 8.1 (c) is Hörmander's Theorem 7.7.5; 8.2 generalises Dąbrowski–Fisher (1997), Theorem 1.8. The windowed form's only source is Alpöge's 2026 formal proof. Rests on the README's References and DabrowskiFisher1997.

## Not verifiable

- [FormalProof]: not in the sources cache, and the README gives no file or declaration; every sentence saying what that proof states or proves is unverified (C03).
- Hörmander, Theorems 7.7.1 and 7.7.5: recorded as paywalled and cited by locator; the regularity `C^(3k+1)`, the `2k` derivatives of the amplitude and the uniformity of the constant in 8.1 (c) were not read in the text.
- Landau 1905, Widder 1941, Montgomery–Vaughan 2007 and Kaczorowski–Pintz 1986–87: not in the manifest and not fetched; 6.3 and 6.4 were checked through their proofs, not through these texts.
- The date of the Announcement and the repository address: neither is in the cached text of the Announcement.

## Source issues

- none

## For the human reviewers

- Scope: the windowed theorem (6.8, 6.9) and, by the References, "the statements of Layers 7 and 8" have as their only source [FormalProof], a Lean formalization announced in Announcement (2026) and not published or refereed; the extensions are the roadmap's own.
- Licence: [FormalProof] is cited at a GitHub address whose licence I could not read; `HasWindows` in `Suggested.lean` carries the name of `Formalism.HC.HasWindows`, which ThetaChainsAndFrobeniusPrimeSums cites from that formalization; the two statements could not be compared.
- Licence: the Announcement (line 53) gives the proof as an archive on the author's page, not the repository the README names; whether they are the same text is unsettled.
- Not tested: FormalProof has the largest share of the citations (13 of 26); neither its text nor its table of contents could be read, so wording and arrangement were not checked against it.
