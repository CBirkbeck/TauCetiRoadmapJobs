# Review of GeneralizedRiemannHypothesisFromWindowBounds (pull request #2887 at fb61191)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/GeneralizedRiemannHypothesisFromWindowBounds/`
**Verdict:** needs changes

**Summary.** Needs changes, for one finding: four routes of Layer 6 and the ExplicitZetaBounds supplier contract rest on implications that the cited sections of ExplicitZetaBounds and AnalyticNumberTheoryPartI do not state, and the README says it does not prove them either. The passage from window bounds to zero-free half-planes (Layers 0–5) and the numerical Checks recomputed here are consistent, and `Suggested.lean` elaborates with `sorry` as its only warning. There are five small corrections and one format note. This review does not confirm the Riemann hypothesis: the headline rests on ThetaChainsAndFrobeniusPrimeSums §10.11 and on a formal proof whose source could not be read here, and whether a roadmap may state `RiemannHypothesis` as a target on that basis is left to the human reviewers.

## R01 (P2) — Four routes of Layer 6 take an implication "that the cited section states" from sections that do not state it, so those steps have no owner

The Layer 6 introduction says "Where the cited roadmap states the implication from the hypothesis to one of its own records, the route inserts 5.1–5.6 into that implication; no such implication is proved again here", and the supplier contract for ExplicitZetaBounds (line 2578) lists "the implications from the hypothesis to `DirichletGRHUpTo`, `PlattRecord`, `LuZamanZhaoRecord`, *HasLandauSiegelGap* `((log 3)/2) ∞` and the count `N(T)` that §§0.2, 0.4b, 7.9 and 2.9 state". An implementer who opens those sections finds only the first. On main, in `TauCetiRoadmap/ExplicitZetaBounds/README.md`: §7.9 (line 3038) defines *HasLandauSiegelGap* and proves antitonicity, the trivial cases, the zero-free form, the comparison with 7.5 and three instances, none under a Riemann hypothesis (the word `GeneralizedRiemannHypothesis` occurs nowhere in that README); §2.9 (line 847) gives `ϑ`, the relation `N(T) = ϑ(T)/π + 1 + S(T)` and the bracket for `ϑ`, and no bound for `N(T)` under `RiemannHypothesis`; §0.4b (line 336) defines `PlattRecord` and `LuZamanZhaoRecord` as records and derives neither from a hypothesis. In `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md`, §0.16 defines `ModEightFiniteInput` and states no "observation that the zero clause follows from the hypothesis for every character modulo `8`". No open pull request revises either roadmap. The routes affected are 6.7 (line 1233), 6.12 (line 1333), 6.13 (line 1355) and 6.15 (line 1456).

Each missing step is short and true, so the smallest repair is to state it here as this roadmap's own step and to correct the two sentences quoted above. For 6.15: by 5.3 a real zero in `(0, 1)` of a primitive real character of conductor `q ≥ 3` is `1/2`, so `(1 − β) log q = (log q)/2 ≥ (log 3)/2`. For 6.12: `PlattRecord` is `DirichletGRHUpTo q (plattHeight q)`, an instance of 6.11, and `LuZamanZhaoRecord` is the value form of 5.3 on `σ ≥ 1 − 1/(5 log q) > 1/2`, as the route already says. For 6.13: §2.9's relation and bracket with 6.3, the ordinates by the limit from the right. For 6.7: the strip form of 5.3 at modulus `8`.

## C01 — The announcement is cited for Layers 4–5, and it contains no statement of Layer 4

The reference `[Announcement]` ends "(Layers 4–5)". The text at that address (four pages) says that a proof of the Riemann hypothesis and of the generalized Riemann hypothesis has been found and formalized, names the remainder `Σ Λ(n)(X/n − 1) − X log X + (1 + γ)X` (Announcement line 125), and gives a dated outline; it states nothing about cyclic families, weights or window bounds. It also places the Lean source in fourteen archive parts on the author's site (line 53) and names no GitHub repository, while `[FormalProof]` gives only a repository address. Citing the announcement for the claim that the proof exists, and giving for `[FormalProof]` the location the announcement gives (with the repository beside it if it is the same source), would make both references checkable.

## C02 — The convention "Statements of the formal proof" contradicts the generality in which 3.3 and 2.1 are stated

The paragraph before Layer 0 says a target whose status or route names `[FormalProof]` "is stated in the form that proof establishes: its hypotheses, ranges and constants are those of the proof". The Layer 0 preamble says the proof works over `ℚ`, for `0 < θ < 1` and with the bound `C y²`, and that the general number field and the sharper forms are "this roadmap's extension". 3.3 names `[FormalProof]` and is stated for a family over any number field `K`; 2.1 is stated for `0 ≤ θ < 1`. A reader cannot tell which of the two sentences governs. Restricting the convention to the targets it is true of (the statements of 5.2 and 5.3), or saying "over `ℚ` and in the ranges given in the Layer 0 preamble", would remove the conflict.

## C03 — `generalizedRiemannHypothesis_modOne_iff` is declared nowhere

5.2 (line 799) and the supplier contract (line 2477) cite RiemannHypothesisStatementsAndConsequences §9.4's `generalizedRiemannHypothesis_modOne_iff`. That roadmap's §9.4 states the equivalence at modulus one in prose ("Modulus one and the principal character") and gives it no name; neither its README nor its `Suggested.lean` has the identifier. Cite the clause by its title, as the other clauses of §9.5 are cited.

## C04 — `re_eq_half_of_riemannZeta_eq_zero` is the case `N = 1` of `re_eq_half_of_LFunction_eq_zero` and closes from it in one tactic

On a scratch copy, `simpa using re_eq_half_of_LFunction_eq_zero (1 : DirichletCharacter ℂ 1) hs₀ hs₁ (by simpa using hs)` proves it (Mathlib's `DirichletCharacter.LFunction_modOne_eq` is a `simp` lemma). As a target it asks nothing beyond the Dirichlet statement, and the module docstring already declines to state the completed zeta function separately for the same reason. Marking it as a sanity check of the specialisation, or listing it with the two special cases the docstring leaves unstated, would settle it.

## C05 — The description's dependency list omits the supplier of the window bounds

The description's list of suppliers still open names eight roadmaps and not ThetaChainsAndFrobeniusPrimeSums, whose §10.11 is the only arithmetic input of 5.1 and 5.2 (their `*Needs:*` lines); the generated blocks `depends-on` and `merge-order` omit it as well. A reader of the description would conclude that the headline depends only on the eight. The text that would be right adds "ThetaChainsAndFrobeniusPrimeSums (§10.11, the window bounds for cyclic families)" to the suppliers that merge first.

## N01 — Two targets are proved by a described finite computation, and several Checks report large ones

The initial ranges of 6.17 (pieces of length `1/16` with rational enclosures) and the positivity of `L(1/2, χ_F)` in 6.28 (sums to `1000 d_F` with integer square roots) are routes that describe a computation, where the other finite ranges of Layer 6 are named record hypotheses (*SchoenfeldMertensSmallRange*, *RamareSaouterGapRange*). Stating these two the same way would keep the layer uniform. The sieve reported in the Checks of 6.24 was rerun here and agrees (`226 229 823` primes in `[10 726 905 041, 16 000 002 001]`, no gap of `360` or more, next prime after `1.6·10¹⁰` is `16 000 000 039`).

## Questions for the author

- Is the repository named in `[FormalProof]` the same source as the archive the announcement gives, and at which commit? The repository's host is in no class the sources service reads, so it was not opened.
- The summary says the formal proof "states five theorems" and the module docstring says three declarations agree with it "binder for binder"; the Layer 0 preamble gives its ranges (`Re s > 2`, `C y²`, `0 < θ < 1`). None of this could be compared with the source. Which files of the source state them?

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.3 remainder `G` | `y = 1, 2`; sign of `y log y` flipped | `G(1) = 1.57722`; `G(2) = 1.76814`; flipped: `4.54073` | Checks true, sign pinned | none |
| 0.5–0.6 transform, residues | `ζ` at `1`; first zero `t = 14.134725` | double pole of `−ζ′/ζ/(s(s−1))` cancels `−1/(s−1)²`, `(1+γ)/(s−1)`; residue `1/(1/4+t²) = 0.0049990` | analytic at 1; positive at real poles | none |
| 1.1 upper bounds | `w = 0`; `θ = 0`; real zero `β` | `w = 0`: vacuous; real pole residue `1/(β(1−β)) > 0`; supplier §6.4(b) read | holds given supplier | none |
| 2.1 pointwise windows | `w = single 1 1`, `θ = 1/4`; `w = 0`, `C < 0` | zero at `1/2 + 14.13i` forces failure of windows; `C < 0`: set empty | consistent with supplier §§6.8, 6.9(b) | none |
| 3.3 equivalence | `w = 0`; `θ < 1/2`; `ε ≥ 1 − σ` | both sides true for `w = 0`; `(←)` from `O(y^σ)`, `E_ψ = A + B log y`; `(→)` uses `ε < 1 − σ` only | both directions hold | C02 |
| 3.5 RH as window bound | Lean: `n = 0` term, `y ≥ 1` | `Λ(0) = 0`; windows have `Y ≥ 1`; `E(y) = log 2π − …` gives `G = O(√y)` under RH | README and Lean agree | none |
| 4.1 family containing `ψ` | `w(ψ) = 0` | no pole contributed, no conclusion; `ε ∈ (0, 1/2)` keeps `θ < 1` | holds | none |
| 4.2 cyclic families | `ψ = 1`; weights all `1` | `𝒦(1) = {1}`: (i) is 3.5; (ii)⇒(i) by 3.2 at `σ = 1/2` | holds; (i) is supplier §10.11 verbatim | none |
| 5.1 orders | trivial `χ` at `s = 1`; `N = 1` | order `−1 ≤ 0` at the pole; non-meromorphic junk value `0 ≤ 0` | statement well formed | none |
| 5.2 `RiemannHypothesis` | Mathlib def, RiemannZeta.lean:185 | excludes `−2(n+1)` and `1`; equals strip form | well formed; truth not verified here | humans |
| 5.3 values and strip | principal mod 2; `s = 1`; `ζ(−2)` | zeros `2πik/log 2` on `Re = 0`; `riemannZeta_one_ne_zero` (ZetaAsymp.lean:443); exception `χ ≠ 1 ∨ s ≠ 1` as Nonvanishing.lean:404 | forms consistent | C04 |
| 5.4 completed | `N = 1`; even `χ` at `s = 0` | poles of `completedRiemannZeta` have order `−1`; `Γ(s/2)` pole cancels `L(0, χ) = 0`: order `0` | no positive order off the line | none |
| 5.5, 5.6 | `K = ℚ(i)`; `K = L = ℚ`; non-abelian cubic | `ζ_K = ζ·L(χ₋₄)`; `φ̃ = 1`; excluded | consistent with AnalyticNumberTheoryPartI §2.42 | none |
| 6.2 growth | supplier §9.7 at `σ₀ = 1/2` | statements (i), (ii)(a)–(d), Littlewood at `q ≥ 3` match | cited correctly | none |
| 6.3 argument | supplier §9.8 | `T ≥ 16`, non-ordinates, `𝔮 ≥ 16`, `L(1/2+it) ≠ 0` match | cited correctly | none |
| 6.5 `psiAP_isBigO` | `q = 1` | `ZMod 1`, `φ(1) = 1`: `ψ(x) − x` | well formed | none |
| 6.8 Chebotarev | `L = F = ℚ` | `D = 1`, `(log D)² = 0`, excluded by `n > 1`; §2.49 on main matches | cited correctly | none |
| 6.12 Hoffstein | constants | `1.507/11.657 = 0.129279 > 1/8`; `1 − 1/(5 log 3) = 0.818` | arithmetic right; implication unowned | R01 |
| 6.14 regions | `R = 0.7`, `t₀ = −20`; boundary values | `0.7 log 20 = 2.0970`; `0.4606`; `e^{2/0.7} = 17.41`; `0.7405`; `2/log(21/17) = 9.46481` | Checks true | none |
| 6.15 Landau–Siegel gap | `q = 3`, `β = 1/2` | `(log 3)/2 = 0.5493 > 1/6.5 = 0.1538`; §7.9 on main has no such implication | value right; citation wrong | R01 |
| 6.23 least prime | `T = 15`; `q ≤ 3` | `M(15) = 0.56506`; Rosser side `2.40033`; `log(17/2π) = 0.99534`; `207.200`, `56.25` | Checks true | none |
| 6.24 short intervals | rows at `4·10¹⁸`, `e⁴³`, `e⁵³`, `e⁶⁰`; `x = 1000` | `2.726822e−8 < 2.771396e−8`; `2.517951e−8`; CMS `0.73684`, Dudek `1.06611`; `0.04284`, `0.10366`, `0.77207`; `8039`, `533.4`, `378.9`; `329.2 > 300` | all match; rows match kadiri-lumley-2014 lines 690, 707–709 | N01 |
| 6.19, 6.22 Checks | `T = 14.14`, `x = 10`; `q = 8` | `log 2520 = 7.832014`; `0.411001`; `2.091132`; `0.070748 > 0.052357`; `0.221530 ≤ 0.228129`; `0.11219` vs `0.00070275` | Checks true | none |

- Source locators checked against the text: 4 (Announcement lines 9–12, 53, 125; kadiri-lumley-2014 lines 28, 688–709).
- Library declarations opened at the pin: 14 (among them `RiemannHypothesis`, `riemannZeta_one`, `riemannZeta_one_ne_zero`, `DirichletCharacter.LFunction_ne_zero_of_one_le_re`, `LFunction_modOne_eq`, `completedLFunction_modOne_eq`, `heckeLFunctionC`, `PrimitiveRayClassCharacter.of`, `rayClassArtinMap`, `abelianConductor`, `kroneckerWeber`, `primePsi`).
- Cross-roadmap citations resolved: 19 sections read at main or at the open head; 4 do not state what is cited (R01), 1 name absent (C03).
- Automatic checks: all passed; dependency check output `depcheck: 171 roadmaps, 1999 edges, 0 problem(s)`.
- Elaboration: `Suggested.lean` elaborates, 11 `sorry` warnings and nothing else; the 11 elaborated types were compared with the README statements, none lost a binder.
- One-tactic probe: `simp` and `rfl` close none; `re_eq_half_of_riemannZeta_eq_zero` closes by one `simpa` from a sibling (C04).

Overlap check: read RiemannHypothesisStatementsAndConsequences, RieszSumsOverPrimesAndExceptionalZeros, QuasiRiemannHypothesis, ExplicitPrimeCounting, ExplicitZetaBounds; shared objects: the predicates and Riesz remainder (RiemannHypothesisStatementsAndConsequences), `HasWindows` (PositivityOfDirichletSeriesWithKernels), the cyclic family (FrobeniusRestrictedRieszSums), the conditional explicit theorems (their roadmaps); this roadmap owns only their forms with the hypothesis removed.

Source independence: 7 passages compared with 2 sources (Announcement, kadiri-lumley-2014), none shared; largest share FormalProof, 6 of the 6 bracketed source citations in the layers (the other works are cited only in the References); contents compared with FormalProof: not possible, its text and table of contents could not be read.

Research link: Layers 1–3 are Landau's theorem (Landau 1905) and localized oscillation (Kaczorowski–Pintz 1986–87); Layer 6 feeds the explicit estimates of Kadiri–Lumley 2014 and others; the headline rests on Alpöge's announcement of 2026, unrefereed. From the README's references and the announcement read.

## Not verifiable

- `[FormalProof]`: the repository's host is in no class the sources service reads; every attribution to it (the five theorems, "binder for binder", the ranges of the Layer 0 preamble, "the step of [FormalProof]" in 3.3, 3.5, 4.2) is unchecked.
- ThetaChainsAndFrobeniusPrimeSums §10.11: read as a statement at its open head and found to be statement (i) of 4.2; its proof is outside this folder and was not reviewed.
- Landau 1905, Ingham, Montgomery–Vaughan chapter 15, Davenport, Heilbronn, Bach–Sorenson, Cully-Hugill–Lee, Kaczorowski–Pintz, Pintz: cited by chapter or as context and not opened.
- The numerical tests in the Checks of 6.17, 6.19, 6.23, 6.28 and 6.29 beyond the values in the table above were not rerun.

## Source issues

- none

## For the human reviewers

- **Scope.** The headline targets are `RiemannHypothesis` and its Dirichlet form. Their only support is `[FormalProof]` and an announcement of 20 November 2026 (Announcement lines 9–13: "I believe I have … discovered a proof"; Lean only, no written proof); no refereed source states them.
- **Scope.** `Suggested.lean` line 118 states `theorem riemannHypothesis : RiemannHypothesis` with `sorry`. Its route is ThetaChainsAndFrobeniusPrimeSums §10.11 through 4.2; this review checked that deduction, not §10.11.
- **Licence.** `[FormalProof]` is an unpublished formalisation on a host the sources service could not classify; the announcement (line 53) gives archive parts on the author's site and states no licence.
- **Licence.** The module docstring of `Suggested.lean` (lines 16–18) says `riemannHypothesis`, `LFunction_ne_zero_of_one_half_lt_re` and `re_eq_half_of_LFunction_eq_zero` are "binder for binder" theorems of the repository `leanprover-community/riemann-hypothesis`; the file there was not identified.
- **Not tested.** `[FormalProof]` has the largest share of the literature locators; wording and arrangement were not compared with it.
