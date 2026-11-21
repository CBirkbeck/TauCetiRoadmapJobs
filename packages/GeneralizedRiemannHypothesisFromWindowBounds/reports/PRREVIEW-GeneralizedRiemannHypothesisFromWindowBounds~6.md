# Review of GeneralizedRiemannHypothesisFromWindowBounds (pull request #2887 at d9eff99)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/GeneralizedRiemannHypothesisFromWindowBounds/`
**Verdict:** needs changes

**Summary.** Needs changes, for three findings. Two items of 6.20 list hypotheses and state no conclusion; the bound for the Mertens function in 6.31 rests on a theorem that no cited section, supplier or reference provides; and the cyclic-family equivalence 4.2, a headline, is statable at the pins with three short definitions that a sibling roadmap already writes out, but `Suggested.lean` declares it not statable. The passage from window bounds to zero-free half-planes (Layers 0–5), the fifteen sampled targets and every numerical Check recomputed here agree with their suppliers. There are no small corrections and two format notes. This review does not confirm the Riemann hypothesis: the headline rests on ThetaChainsAndFrobeniusPrimeSums §10.11 and on a formal proof whose source could not be read, which is left to the human reviewers together with its licence.

## R01 (P2) — Two items of 6.20 give hypotheses and no statement

An implementer cannot tell what the first two bullets of 6.20 assert, so they are targets with nothing to prove. The first bullet (line 1820) reads, in full, "Given `ButheVerified`, `Schoenfeld1976Range`, `DudekPlattRange` and Rosser's zero count, which Schoenfeld's bounds of 6.16, used in its route, take." The second (line 1823) begins "Without `RiemannHypothesisUpTo 3000175332800`, given its `θ`-input, …" and ends with `AxlerPrimeCountingUpperRange`; neither has a subject or a conclusion. Both have been in this form since the first commit of the folder.

From the hypothesis lists the statements meant are those of `TauCetiRoadmap/ExplicitPrimeCounting/README.md` §3.5 on main: `ramanujan_largest_counterexample` (line 2647: `π(n)² < (e n/log n) π(n/e)` fails at `n = 38 358 837 682` and holds at every larger integer) and `axler_primeCounting_upper` (line 2524: the six-term upper bound for `π(x)`, `x ≥ 48`). The smallest repair is to put each statement at the head of its bullet, as the third and fourth bullets of 6.20 do.

## R02 (P2) — The bound `moebiusSum x = O(x^{1/2+ε})` of 6.31 rests on a theorem that nothing cited provides

The fourth bullet of 6.31 (line 2290) states the bound and justifies it by "Littlewood's theorem that the Riemann hypothesis gives this bound"; the route (line 2293) says "5.2 … through Littlewood's theorem", and the *Needs:* line names ExplicitMultiplicativeFunctions §§0.1, 0.7, 1.9, 8.1. An implementer who opens those sections finds the definition of `moebiusSum` (§0.1, line 148 of that README on main) and no implication from `RiemannHypothesis` to a bound for it: the three occurrences of `RiemannHypothesis` there (lines 3308, 3348, 4319) concern Mertens' product and the prime sums of ExplicitPrimeCounting §4.7. A search of every README on main and at the open heads finds the implication nowhere, the References list no source for it, and the bullet has no locator. It is also the one item of Layer 6 that is not "a statement of another roadmap with the hypotheses that 5.1–5.6 give removed" (Layer 6 introduction, line 1024).

The theorem is classical and true, so the repair is to own the step: give the route its inputs (the bound `1/ζ(σ + it) ≪ |t|^ε` on `σ ≥ 1/2 + δ` of 6.2(i), a truncated Perron formula for the coefficients `μ(n)` from a named supplier section, and the shift of the contour to `Re s = 1/2 + δ`), add the supplier to the *Needs:* line, and give a locator in a standard text.

## R03 (P2) — The cyclic-family equivalence 4.2 is statable at the pins, and `Suggested.lean` says it is not

The module docstring (lines 66–70) lists 4.2 among the headlines "not statable at the pins", because it "lacks the cyclic family (FrobeniusRestrictedRieszSums §0.5), the bundled primitive Dirichlet character … and its Riesz remainder". These three are short definitions with real bodies on Mathlib carriers, not missing carriers. `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaChainsAndFrobeniusPrimeSums/Suggested.lean`, at its open head, writes them out in about forty lines with a single `import Mathlib` (the structure with fields `level`, `character`, `isPrimitive`; `rieszRemainder` as an `if` on `level = 1`; `cyclicFamily` as the image of `Finset.range (orderOf ψ.character)`) and states statement (i) of 4.2 with them as `cyclicWindowedBound_forEveryEpsilon`. RiemannHypothesisStatementsAndConsequences' `Suggested.lean` has the first two as well. With the same definitions in this roadmap's namespace, 4.2 reads: the existence, for every `ε > 0`, of positive weights on `ψ.cyclicFamily` and `λ > 1` with the window bound at `1/2 + ε` holds if and only if `meromorphicOrderAt κ.character.LFunction s ≤ 0` for every `κ ∈ ψ.cyclicFamily` and every `s` with `1/2 < Re s`. It is the theorem the summary names as the point where the arithmetic input enters, and as the file stands the acceptance test does not contain it.

The smallest repair is to state 4.2 in `Suggested.lean` with those three definitions and the unfolded window predicate, as 3.5 is stated, and to remove it from the docstring's list. The windowed theorem 2.1 and the equivalence 3.3 are for ray-class characters of a general `K` and remain not statable for the reason given.

## N01 — Three sentences of Layer 6 begin in mid-clause

In 6.14(d) (line 1464, "for real `H` and `ν : ℝ → ℝ` …") and in 6.22 (line 1877, "no modulus `q ≥ 2` is exceptional …, so the theorem in McCurley's shape, holds …") a sentence starts in lower case where a subject appears to have dropped out, the same symptom as R01; these two still carry their statements.

## N02 — Supplier names that the supplier proposes in italics appear here in code font

`PrimitiveRayClassCharacter.rieszRemainder` and `PrimitiveDirichletCharacter.toPrimitiveRayClassCharacter` (Conventions, 0.2, 3.5) are written in italics, as proposed names, in RiemannHypothesisStatementsAndConsequences §§8.4a, 11.1, and are declared in no Lean file; in code font beside declared names a reader cannot tell them apart.

## Questions for the author

- The README places the formal proof's theorems at `Supplements/Kernels/MainTheorems.lean` under the names `rhOfAll`, `allChi`, `claimAll` and `critAll`. The audit record of the kernel export that the operator holds names the five checked theorems `riemannHypothesis`, `riemannZeta_eq_zero_re`, `LFunction_ne_zero_of_half_lt_re`, `LFunction_eq_zero_re` and `LFunction_eq_zero_re_of_isPrimitive`. Are both sets of names in the source, and which does the cited file declare? The Lean source files could not be opened, so neither the paths nor the names were compared.
- The README and the description date the announcement 20 November 2026. The text at the cited address carries no date (its timeline ends at 16 November). Where is the date stated?

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.3 remainder `G` | `y = 1, 2`; sign of `y log y` flipped | `G(1) = 1.577216`; `G(2) = 1.768137`; flipped `4.540726` | Checks true | none |
| 0.6 residues | first zero `t = 14.134725`; real pole in `(0,1)` | `1/(1/4 + t²) = 0.00499899`; `ρ(1−ρ) > 0` | positive at real poles | none |
| 1.3 one-sided bounds (sample) | residue of transform of `ψ_K − x`; `s = 1`; `θ = 0` | residue `−m/ρ` at zeros; `1/(s−1)` cancels; (a) uses `−g`, residue `m/β > 0` | matches supplier §6.4(b) | none |
| 2.2 windows in mean (sample) | supplier §6.9(b), form with `C₀ y²` | hypothesis `∫_Y^{Y^λ} G⁺ y^{−θ−1} ≤ Y^η`, `0 < θ < 1`, simple poles: identical | cited correctly | none |
| 2.4 lower windows (sample) | `G = −G_w`, `A = 1`, `θ = 0` | extension gives real pole of `−Φ_w` with negative coefficient = real zero, residue positive | dichotomy as stated | none |
| 2.5 windowed `ψ_K − x` (sample) | both signs; `K = ℚ` | first: residues `m/ρ > 0`, form applies, needs `θ > 0`; second: extension, `ζ < 0` on `(0,1)` | holds given supplier | none |
| 3.3 equivalence (sample) | `w = 0`; `ε ≥ 1 − σ`; `θ < 1/2` | both sides true at `w = 0`; (→) uses only `ε < 1 − σ`; (←) from `C y^σ` | both directions hold | none |
| 3.4 cyclic reduction (sample) | `ψ = of χ`; modulus 1 | `ψ ∈ 𝒦(ψ)`; `ψ.character = χ.primitiveCharacter`; supplier lemma `generalizedRiemannHypothesis_primitiveCharacter_iff` exists | holds | none |
| 3.5 Lean form | `n = 0` term; `ε > 1/2`; `Y ≥ 1` | `Λ(0) = 0`; `G = Σ y^ρ/(ρ(1−ρ)) + O(log y)` gives `O(√y)` under RH | README and Lean agree | none |
| 4.2 cyclic families | `ψ = 1`; weights `1` | `𝒦(1) = {1}`; (ii)⇒(i) by `C√y`; sibling Lean file states (i) with three definitions | true; statable | R03 |
| 5.1 orders (sample) | trivial `χ` at `s = 1`; route | order `−1 ≤ 0`; supplier §10.11 at its head is statement (i) verbatim | follows from supplier | none |
| 5.2 `RiemannHypothesis` (sample) | Mathlib definition; modulus-one clause | excludes `−2(n+1)` and `1`; clause present in supplier §9.4 | well formed; truth not verified | humans |
| 5.3 value and strip forms | principal mod 2; `s = 1`; one-tactic probes | zeros on `Re s = 0`; `simpa` from sibling leaves `s ≠ 1 →`; none closes | no padding | none |
| 5.4 completed | `N = 1` | poles of `completedRiemannZeta` have negative order | consistent | none |
| 5.5, 5.6 | `K = L` in `Type`; `ℚ(i)` | `simpa` from 5.6 times out; `ζ_K = ζ·L(χ₋₄)`; `φ̃(𝔭) = χ(N𝔭)` | consistent | none |
| 6.5 `psiAP_isBigO` | `q = 1`; `n = 0` | `residueClass a 0 = Λ(0) = 0`; `φ(1) = 1` | well formed | none |
| 6.8 Chebotarev (sample) | supplier §2.49 on main, line 2055 | `O(x^{1/2} log(D x^n))`, `x ≫ (log D)²`, least norm `≪ (log D)²`, `n > 1`: identical | cited correctly | none |
| 6.9 abelian fields (sample) | supplier §5.16a, lines 10832, 10838 | bound `√x((log x/2π + 2) log Δ + (log²x/8π + 2)n)`, `x ≥ 100`; `T ≥ 100`: identical | cited correctly | none |
| 6.13 zero count (sample) | `T = 16`; ordinates | `log 16/log log 16 = 2.7188 > 1/640`; bracket `7/8 … 7/8 + 1/(40T)` in supplier §2.9 | holds with `C + 1` | none |
| 6.14(d), 6.15 | `R = 0.7`, `t₀ = −20`; `q = 3` | `2.0970`, `0.4606`, `17.41`; `2/log(21/17) = 9.46481`; `(log 3)/2 = 0.5493 > 0.1538` | Checks true | N01 |
| 6.19 (sample) | quotients at range ends; `x → 23⁻`, `149⁻`; (d) at `T = 14.14` | `12.580`, `1.0122`, `2.6733`, `2.6567`, `1.0011`, `75.02`; `22293`, `1.919·10⁶`, `97.63`; `3.7343 > 3.7016`; `2.167986 > 2.091132` | all match | none |
| 6.20 (sample) | five-term bounds at `L = 3914`; criterion at `e³⁹¹⁵` | `li 2 − P₄(2) = −369.99419`; `143.546`; difference `3914.5011 < 3915` | computation right; two items empty | R01 |
| 6.23 | `T = 15`; `q ≤ 3`; `q = 4` | `M(15) = 0.56506`; Rosser side `2.40033`; `207.200`, `56.25`; `5/7.687 = 0.650` | Checks true | none |
| 6.24 | rows at `4·10¹⁸`, `e⁵³`, `e⁶⁰`; primality | `2.726822e−8 < 2.771396e−8`; `0.0428`, `0.1037`, `0.7721`; `0.73684`, `1.06611`; `10 726 905 041` prime, gap `382`; next prime `16 000 000 039` | all match | none |
| 6.28 (sample) | nine discriminants; `c = π/6` | lower bounds `0.4565, 0.6440, 0.2176, 1.1107, 0.3625, 1.0669, 0.9534, 0.4894, 0.4221`; `2/√15 = 0.5164 < 0.5236`; `1.888 < 2` | Checks true (last digits rounded down) | none |
| 6.29 | `x = 13.5, 17, 19, 23` | `0.125980 < 0.127871`; `0.099937 < 0.120624`; `0.114062 < 0.117145`; `0.094672 < 0.111227`, `> 0.078041` | Checks true | none |
| 6.30 (sample) | supplier 7.2 and 7.4 at its head | hypotheses `DedekindERH L`, three ranges, small cases; `(4 log d_L + 2.5 n_L + 5)²`, `L ≠ ℚ`: identical | cited correctly | none |
| 6.31 Mertens function | supplier sections named | `moebiusSum` defined at §0.1; no bound under `RiemannHypothesis` anywhere | step unowned | R02 |
| 6.32 Weil form | multiplicity bound; Jensen count | `log T/log log T` increasing for `T > e^e = 15.15`; distinct zeros `≥ cT log log T` against `O(T)` | route sound | none |
| Layer 6 introduction | reciprocal-zero records | `16.2278075`; `0.0162353 < 0.0171594`; lower error `−0.17530 ≥ −0.1754`; `0.221530 ≤ 0.228129` | derivation right | none |

- Source locators checked against the text: 3 (Announcement lines 9–13, 53, 125); 31 locators into the formal proof (17 files) not checkable.
- Library declarations opened at the pins: 37 (Tau Ceti 26, Mathlib 11), among them `RiemannHypothesis` (`Mathlib/NumberTheory/LSeries/RiemannZeta.lean` 185), `AnalyticOnNhd.sum_divisor_le` (`Mathlib/Analysis/Complex/JensenFormula.lean` 389), `riemannZeta_one` (`Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean` 420), `TauCeti.primeIdealTheorem`, `heckeLFunctionC`, `RayClassCharacter.induced`, `Modulus.eq_one_of_dvd_one`, `rayClassArtinEquiv_apply`; all present.
- Cross-roadmap citations resolved: about 40 sections read on main or at the open head (suppliers of Layers 0–5 in full; for Layer 6 the sampled sections and those behind each remark); 1 does not provide what is cited (R02).
- Automatic checks: all passed. Dependency check output: `depcheck: 170 roadmaps, 1986 edges, 0 problem(s)`. No change outside the folder and the family index.
- Elaboration: `Suggested.lean` elaborates with 10 `sorry` warnings and nothing else; the 10 elaborated types were compared with the README statements, none lost a binder, nothing changed.
- One-tactic probe: `simp`, `rfl`, `exact?` and `simpa` from a sibling close none of the ten.

Overlap check: read RiemannHypothesisStatementsAndConsequences, ExplicitNumberFields, RieszSumsOverPrimesAndExceptionalZeros, QuasiRiemannHypothesis, ExplicitPrimeCounting, ExplicitZetaBounds (and PositivityOfDirichletSeriesWithKernels, ThetaChainsAndFrobeniusPrimeSums); shared objects: the predicates and Riesz remainder (owner RiemannHypothesisStatementsAndConsequences), `HasWindows` and the windowed Landau theorem for transforms (PositivityOfDirichletSeriesWithKernels), the cyclic family (FrobeniusRestrictedRieszSums), the window bounds (ThetaChainsAndFrobeniusPrimeSums), the conditional explicit theorems (their roadmaps); this roadmap owns weighted families and the forms with the hypothesis removed, and no second owner was found.

Source independence: 5 passages compared with 1 source (Announcement), none shared; largest share FormalProof, 31 of the 34 locators into non-roadmap sources; contents compared with FormalProof: not possible, its text and table of contents could not be read.

Research link: Layers 1–3 are Landau's theorem (Landau 1905) and localized oscillation (Kaczorowski–Pintz 1986–87); Layer 6 feeds explicit estimates such as Schoenfeld's, Büthe's and Bach–Sorenson's (1996); the headline rests on Alpöge's announcement of 2026, unrefereed. From the README's references and the announcement read.

## Not verifiable

- `[FormalProof]`: the repository's host is in no class the sources service reads, and the copy the operator holds is a kernel export without source files; every file path, declaration name and "binder for binder" attribution is unchecked. The export's audit record lists five checked theorems, the number the README's summary gives.
- ThetaChainsAndFrobeniusPrimeSums §10.11: read as a statement at its open head and found to be statement (i) of 4.2; its proof is outside this folder and was not reviewed.
- The date of the announcement: not in its text.
- Landau 1905, Ingham, Montgomery–Vaughan chapter 15, Davenport, Heilbronn, Bach–Sorenson, Kadiri–Lumley, Cully-Hugill–Lee, Kaczorowski–Pintz, Pintz: cited by chapter or as context and not opened.
- Not rerun: the suprema up to `10⁷` in the Checks of 6.19, the sieve of 6.24, the test over `q ≤ 1000` of 6.23, the second negative control of 6.19 and the closed forms `C₇`, `C₈` of 6.14.

## Source issues

- none

## For the human reviewers

- **Scope.** The headline targets are `RiemannHypothesis` and its Dirichlet form. Their support is `[FormalProof]` and an announcement (Announcement lines 9–13: "I believe I have … discovered a proof"; Lean only, no written proof); no refereed source states them.
- **Scope.** `Suggested.lean` line 126 states `theorem riemannHypothesis : RiemannHypothesis` with `sorry`. Its route is ThetaChainsAndFrobeniusPrimeSums §10.11 through 4.2; this review checked that deduction, not §10.11.
- **Licence.** `[FormalProof]` is an unpublished formalisation; the announcement (line 53) gives archive parts on the author's site and states no licence, and the repository named beside it is on a host the sources service could not classify.
- **Licence.** The module docstring of `Suggested.lean` (lines 16–18) says three declarations are "binder for binder" theorems of the repository `leanprover-community/riemann-hypothesis`; the file there was not identified.
- **Not tested.** `[FormalProof]` has the largest share of the source locators; wording and arrangement were not compared with it. The family index `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` says "The family follows the formal Lean proof".
