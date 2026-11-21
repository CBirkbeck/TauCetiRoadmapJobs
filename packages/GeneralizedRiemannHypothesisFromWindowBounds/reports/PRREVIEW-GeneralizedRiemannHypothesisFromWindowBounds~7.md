# Review of GeneralizedRiemannHypothesisFromWindowBounds (pull request #2887 at cfcb276)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/GeneralizedRiemannHypothesisFromWindowBounds/`
**Verdict:** accepted

**Summary.** Accepted: no finding. The three findings of the previous review are repaired: the first two items of 6.20 now carry their statements and agree with ExplicitPrimeCounting §3.5, the unsupported bound for the Mertens function is gone from 6.31, and the cyclic-family equivalence 4.2 is stated in `Suggested.lean` with three definitions that agree, field for field, with those of the roadmaps that own them. The deduction from window bounds to zero-free half-planes, the fifteen sampled targets and the recomputed Checks agree with their suppliers. There are two small corrections and one format note, none blocking. This review does not confirm the Riemann hypothesis: the headline rests on ThetaChainsAndFrobeniusPrimeSums §10.11 and on a formal proof whose source could not be read, which, with its licence and the scope, is left to the human reviewers.

## C01 — The sentence of 6.26 that restates `SieveApplications.linnik_exceptional` gives a different statement from the one SieveMethodsAndPrimePatterns §2.9 makes

A reader who takes the restatement in 6.26 (line 2127) for the supplier's theorem gets the wrong one. 6.26 says the bound for the least nonresidue implies `SieveApplications.linnik_exceptional`, "for each `ε > 0` only finitely many odd primes `p` have `leastNonresidue p > p^ε`". The supplier's statement (`TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md` on main, line 2364) is Linnik's: for each `ε > 0` there is `C_ε` such that for every `N ≥ 2` at most `C_ε` odd primes `p ≤ N` have least nonresidue above `N^ε`. The sentence in 6.26 is the stronger, Vinogradov-type statement, compared with `p^ε` and with no `N`.

Both follow from `leastNonresidue p ≤ C (log p)²`: there is `N₀(ε)` with `C (log N)² < N^ε` for `N ≥ N₀`, so the supplier's set is empty for `N ≥ N₀` and has at most `π(N₀)` elements below. So nothing false is asserted. The smallest change is to restate the supplier's theorem as it stands (the count up to `N` against `N^ε`, bounded by `C_ε`), and, if the pointwise form is wanted too, to give it as a second consequence of the bound and not as the content of `linnik_exceptional`.

## C02 — The description says every pull request of the family carries the family index with identical content, and does not name pull request #2954, which adds this same folder

The description says the family index "is carried, with identical content, by every pull request of the family". Pull request #2954 (the roadmap family in one pull request) carries `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` with the entry for FrobeniusRestrictedRieszSums in another place (after QuadraticTwistSelectionOverPrimes there, line 57; after ThetaLiftsForDefiniteUnitaryGroups here, line 139), and the two heads conflict in that file. The same pull request also adds this folder; its `README.md` and `Suggested.lean` are identical to this head's, so nothing in the roadmap differs.

The description would be right if it said which of the two pull requests merges this folder and the index (this one after its suppliers, or #2954 in its place), and if the index were brought to one order in both. Which position is right was not checked here; the two copies need to agree.

## N01 — The family index still dates the announcement

`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` (line 11) says the proof was "announced on 20 November 2026"; this folder's References now give "(2026)". The text at the cited address carries no date of its own (its timeline ends at 16 November), so the index would read the same as the roadmap with the year alone.

## Verified sound

Earlier findings: R01 (two items of 6.20 without statements) repaired, lines 1822–1832 now state `ramanujan_largest_counterexample` and `axler_primeCounting_upper` with their conclusions; R02 (the bound for `moebiusSum` in 6.31) repaired by removing the bullet, its route and its supplier line, no mention remains; R03 (4.2 not stated) repaired, `forall_exists_windows_cyclicFamily_iff` at line 162 of `Suggested.lean`. N01 and N02 of that review are repaired as well (6.14(d), 6.22; proposed supplier names in italics).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.3 remainder `G` | `y = 1, 2`; sign of `y log y` flipped | `G(1) = 1.577216`; `G(2) = 1.768137`; flipped `4.540726` | Checks true | none |
| 0.6 residues | first zero `t = 14.134725` | `1/(1/4 + t²) = 0.00499899`; real pole in `(0,1)` has `ρ(1−ρ) > 0` | positive | none |
| 1.3 one-sided bounds (sample) | transform of `ψ_K − x`; supplier §6.4(b) | residue `−m/ρ` at zeros; (a) uses `−g`, residue `m/β > 0`; pole at `1` cancels | matches PositivityOfDirichletSeriesWithKernels §6.4 | none |
| 2.2 windows in mean (sample) | supplier §6.9(b), form with `C₀ y²` | hypothesis `∫_Y^{Y^λ} G⁺ y^{−θ−1} ≤ Y^η`, `0 < θ < 1`, simple poles, positive real residues: identical | cited correctly | none |
| 3.1 window bounds (sample) | `θ ≤ θ′`; constant `C`; supplier §6.9(a) third clause | windows lie in `[1, ∞)`; `C y^θ ≤ y^{θ′}` beyond `y₀ = C^{1/(θ′−θ)}`; clause `S ∩ [x₀, ∞) ⊆ S′` present | holds | none |
| 3.3 equivalence (sample) | `w = 0`; `ε ≥ 1 − σ`; `θ < 1/2` | both sides true at `w = 0`; (→) needs only `ε < 1 − σ`; (←) from `C y^σ` | both directions hold given 2.1 | none |
| 3.4 cyclic reduction (sample) | `ψ = of χ`; level 1 | `ψ ∈ 𝒦(ψ)` (FrobeniusRestrictedRieszSums §0.5 (i)); `generalizedRiemannHypothesis_primitiveCharacter_iff` at line 134 of the supplier's Lean | holds | none |
| 3.5 Lean form | `n = 0` term; `Iic` against `Icc 1` | `Λ(0) = 0`, so the sums agree; residue computation gives `−y log y + (1+γ) y` | README and Lean agree | none |
| 4.2 Lean form (R03) | `ψ = 1`; `ψ = χ₋₄`; residue at `s = 1` for `χ ≠ 1` | `orderOf = 1`, family `{1}`; `orderOf = 2`, conductors `1, 4`; pole term `−y L′/L(1)` cancelled by `+ y logDeriv L 1` | true given 2.1, 3.2; definitions equal the suppliers' | none |
| 4.2 one-tactic probe | `simp`, `rfl`, `simp` with both definitions, `exact?` | none closes; goals remain after unfolding | no padding | none |
| 5.1 orders | trivial `χ` at `s = 1`; supplier §10.11 | order `−1 ≤ 0`; §10.11 at its head is statement (i) with `HasWindows` and positive weights | follows from supplier | none |
| 5.2 `riemannHypothesis` | Mathlib definition (`RiemannZeta.lean` line 185) | excludes `−2(n+1)` and `1`; `riemannZeta_one_ne_zero` exists | well formed; truth not verified here | humans |
| 5.3 value and strip forms | principal mod 2; `s = 1` | zeros `2πik/log 2` on `Re s = 0`, outside the open strip; exception `χ ≠ 1 ∨ s ≠ 1` as Mathlib's | well formed | none |
| 5.4 completed (sample) | `N = 1`; gamma shifts `0, 1` | poles of `completedRiemannZeta` at `0, 1` have negative order; gamma factor has no zero or pole on `Re s > 1/2` | consistent with §§9.3, 9.4 | none |
| 5.5, 5.6 | `K = ℚ(i)`; `K = L = ℚ` | `ζ_K = ζ · L(χ₋₄)`; trivial group gives `φ̃ = 1`, `dedekindZetaC ℚ` | consistent | none |
| 6.2 growth (sample) | supplier §9.7 (i), (ii) at `σ₀ = 1/2` | `|t| ≥ 16`, `q ≥ 3`, constants and admissible heights identical; `log log 3 = 0.094 > 0` | cited correctly | none |
| 6.4 prime counts (sample) | supplier §9.9 (i)–(iii), `σ = 1/2` | `O(√x log² x)`, `O(√x log x)`; rational case at `(q)∞` present | cited correctly | none |
| 6.5 `psiAP_isBigO` (sample) | `q = 1`; `n = 0`; AnalyticNumberTheoryPartI §1.9(ii) | `φ(1) = 1`; `residueClass a 0 = 0`; `log² x ≤ C_ε x^ε` gives the supplier's weaker form | well formed, stronger than supplier | none |
| 6.7 mod eight (sample) | AnalyticNumberTheoryPartI §0.16, line 449 | zero clause: `0 < Re s < 1`, `|Im s| ≤ 10000`, all `χ` mod 8: identical; four characters | strip form of 5.3 gives it | none |
| 6.8 Chebotarev (sample) | supplier §2.49, line 2057 | `O(x^{1/2} log(D x^n))`, `x ≫ (log D)²`, norm `≪ (log D)²`, `n > 1`: identical | cited correctly | none |
| 6.9 abelian fields (sample) | ClassicalArithmeticCompletion §5.16a, lines 10832, 10838 | bound and `x ≥ 100`; `T ≥ 100`; (ii) needs `RiemannHypothesis` too, given by 5.2 | cited correctly | none |
| 6.12 | `q = 3`; Hoffstein constant; `q = 10⁵` | `1 − 1/(5 log 3) = 0.81795`; `1.507/11.657 = 0.129279 > 1/8`; `40/(√q log² q) = 9.54·10⁻⁴` | Checks true | none |
| 6.13 zero count (sample) | `T = 16`; ExplicitZetaBounds §2.9 | `log 16/log log 16 = 2.7188 > 1/640`; bracket `7/8 … 7/8 + 1/(40T)`, `T ≥ e` | holds with `C + 1` | none |
| 6.14(d) | `R = 0.7`, `t₀ = −20`; `ν < 1/2`; trivial zeros | `2.0970`; boundary `0.46064`; `e^{2/0.7} = 17.41`; `2/log(21/17) = 9.46481`; `−2n < 0 < 1 − ν` | Check true; new sentence true | none |
| 6.15 gap (sample) | `q = 3`; supplier §7.9 definition | `(log 3)/2 = 0.54931 > 1/6.50 = 0.1538`; definition: real zeros in `(0,1)`, `3 ≤ q` | holds | none |
| 6.20 (R01) | ExplicitPrimeCounting §3.5, lines 2524–2533, 2647–2649 | counterexample `38 358 837 682`; `x ≥ 48`, constants `3.024334 … 4331.1`: identical | repaired | none |
| 6.22, 6.23 | `q = 2, 3`; `T = 15` | `0.85043`, `0.85996`; `1000/(32π) = 9.947`; `M(15) = 0.56506`, Rosser side `2.40033`; `207.200`, `56.25` | Checks true | none |
| 6.26 least values (sample) | QuasiRiemannHypothesis §§11.2, 11.3 at `θ = 1/2`; Sieve §2.9 | exponent `1/(1−θ) = 2`; `p = 3`: least nonresidue `2`; supplier's Linnik statement counts `p ≤ N` against `N^ε` | bound cited correctly; restatement differs | C01 |
| 6.28 | `c = π/6`; `d_F = 13, 15` | `0.52360 ≥ 2/√15 = 0.51640`; `(π/6)√13 = 1.8879 < 2` | Checks true | none |
| 6.31 (R02) | search for `moebiusSum`, "Littlewood's theorem" | no occurrence in 6.31; remaining items cite ExplicitMultiplicativeFunctions lines 525, 1364, 1388 | repaired | none |

- Source locators checked against the text: 3 (Announcement lines 9–13, 53, 125); 31 locators into the formal proof (17 files) not checkable.
- Library declarations opened at the pins: 17 (Mathlib 8, Tau Ceti 9), among them `RiemannHypothesis` (`Mathlib/NumberTheory/LSeries/RiemannZeta.lean` 185), `LFunction_ne_zero_of_one_le_re` (`Mathlib/NumberTheory/LSeries/Nonvanishing.lean` 404), `heckeLFunctionC` (`TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean` 74), `rayClassArtinMap` (`…/AdmissibleModulus/Reciprocity.lean` 128), `primeIdealTheorem` (`…/Prime/PrimeIdealTheorem.lean` 39); the pinned Tau Ceti has no `PrimitiveDirichletCharacter`, `rieszRemainder` or `HasWindows`.
- Cross-roadmap citations resolved: 24 sections read on main or at the open heads (RiemannHypothesisStatementsAndConsequences §§8.4a, 9.7, 9.9, 10.3; PositivityOfDirichletSeriesWithKernels §6.9; FrobeniusRestrictedRieszSums §0.5; ThetaChainsAndFrobeniusPrimeSums §10.11; the Layer 6 sections of the table); all provide what is cited, one is restated differently (C01).
- The three definitions of `Suggested.lean` compared with those of RiemannHypothesisStatementsAndConsequences and ThetaChainsAndFrobeniusPrimeSums at their heads: same fields and bodies, in different namespaces.
- Automatic checks: all passed. Dependency check output: `depcheck: 171 roadmaps, 1999 edges, 0 problem(s)`. No change outside the folder and the family index.
- Elaboration: `Suggested.lean` elaborates with 11 `sorry` warnings and nothing else; the 14 elaborated types were compared with the README statements, none lost a binder, nothing changed.
- One-tactic probe: four tactics on the new theorem, none closes it; the other ten statements are unchanged since the previous probe.

Overlap check: read RiemannHypothesisStatementsAndConsequences, ExplicitNumberFields, QuasiRiemannHypothesis, RieszSumsOverPrimesAndExceptionalZeros, ExplicitPrimeCounting, ExplicitZetaBounds, ExplicitMultiplicativeFunctions (and PositivityOfDirichletSeriesWithKernels, FrobeniusRestrictedRieszSums, ThetaChainsAndFrobeniusPrimeSums); shared objects: the predicates, the bundled primitive Dirichlet character and the Riesz remainder (owner RiemannHypothesisStatementsAndConsequences), `HasWindows` and the windowed Landau theorem for transforms (PositivityOfDirichletSeriesWithKernels), the cyclic family (FrobeniusRestrictedRieszSums), the window bounds (ThetaChainsAndFrobeniusPrimeSums), the conditional explicit theorems (their roadmaps); this roadmap owns weighted families and the forms with the hypothesis removed; the only second copy of its own statements is pull request #2954's identical copy of this folder (C02).

Source independence: 6 passages compared with 1 source (Announcement), none shared; largest share FormalProof, 31 of the 33 locators into non-roadmap sources; contents compared with FormalProof: not possible, its text and table of contents could not be read.

Research link: Layers 1–3 are Landau's theorem (Landau 1905) and localized oscillation (Kaczorowski–Pintz 1986–87); Layer 6 feeds explicit estimates such as Schoenfeld's, Büthe's and Bach–Sorenson's (1996); the headline rests on Alpöge's announcement of 2026, unrefereed. From the README's references and the announcement read.

## Not verifiable

- `[FormalProof]`: no text of the Lean source was available to read (the archive parts and the repository are not among the texts held for this roadmap); every file path, declaration name and "binder for binder" attribution is unchecked.
- ThetaChainsAndFrobeniusPrimeSums §10.11: read as a statement at its open head and found to be statement (i) of 4.2; its proof is outside this folder and was not reviewed.
- PositivityOfDirichletSeriesWithKernels §§6.4, 6.8, 6.9: the windowed Landau theorem is read as stated there; its proof is that roadmap's.
- The date of the announcement: not in its text (N01).
- Landau 1905, Ingham, Montgomery–Vaughan chapter 15, Davenport, Heilbronn, Bach–Sorenson, Kadiri–Lumley, Cully-Hugill–Lee, Kaczorowski–Pintz, Pintz: cited by chapter or as context and not opened.
- Not rerun: the suprema up to `10⁷` in the Checks of 6.19, the sieve of 6.24, the test over `q ≤ 1000` of 6.23, the second negative control of 6.19, the closed forms `C₇`, `C₈` of 6.14 and the nine partial sums of 6.28.

## Source issues

- none

## For the human reviewers

- **Scope.** The headline targets are `RiemannHypothesis` and its Dirichlet form. Their support is `[FormalProof]` and an announcement (Announcement lines 9–13, 76: Lean only, no written proof); no refereed source states them.
- **Scope.** `Suggested.lean` line 190 states `theorem riemannHypothesis : RiemannHypothesis` with `sorry`. Its route is ThetaChainsAndFrobeniusPrimeSums §10.11 through 4.2; this review checked that deduction, not §10.11.
- **Licence.** `[FormalProof]` is an unpublished formalisation; the announcement (line 53) gives archive parts on the author's site and states no licence; the README names a repository `leanprover-community/riemann-hypothesis` that the announcement does not mention.
- **Licence.** The module docstring of `Suggested.lean` (lines 18–20) says three declarations are "binder for binder" theorems of the formal proof; the file there was not read.
- **Not tested.** `[FormalProof]` has the largest share of the source locators; wording and arrangement were not compared with it. The description and the family index `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` (line 9) say "The family follows the formal Lean proof".
