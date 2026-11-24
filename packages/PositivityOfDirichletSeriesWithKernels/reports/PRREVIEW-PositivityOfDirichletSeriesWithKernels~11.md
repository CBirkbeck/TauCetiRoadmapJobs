# Review of PositivityOfDirichletSeriesWithKernels (pull request #3027 at 374b9ce)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/PositivityOfDirichletSeriesWithKernels/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 248 changed lines since `74a09b7`. I found no finding. Three things were checked: the new deduction of 6.3 from ArithmeticDirichletSeriesPartII §0.1b; the three `*Corollary of:*` lines (6.1, 6.6, 6.9), each against the supplier section it cites; and the `*Origin:*` and `*Method of the formal proof:*` labels of all thirteen sections, against the published sources and the Lean source of the formal proof. All of them hold. Accepted with two small corrections (the description does not mention the new supplier, and one clause of the 6.1 origin label contradicts itself) and one format note, none blocking. One question goes to the author, and the human reviewers have a scope fact to note.

## C01 — The description does not say that this roadmap gains a supplier and that 6.3 is now deduced from a new section of another roadmap

A reader of the pull request cannot tell that this roadmap's supplier list changes. The README now has a `### From TauCetiRoadmap.AsymptoticExpansions` contract (§4.1a for 6.1, §13.6a for 6.6 (b)). That roadmap was not a supplier on `main`. 6.3 keeps its statement, but its own proof is replaced by a deduction from ArithmeticDirichletSeriesPartII §0.1b, and 6.9 (c) now cites §4.1a. Both sections are added by this pull request. The description lists new suppliers for GluedTargetAndDivisionInequality, BernoulliBoundsForClassGroupEigenspaces, ChowFormsAndHeightsOfSubvarieties and HermitianFormsAndLattices, but never names this roadmap. A sentence would do: "PositivityOfDirichletSeriesWithKernels gains AsymptoticExpansions as a supplier (§4.1a for 6.1, §13.6a for 6.6 (b)); its 6.3 keeps its statement and is deduced from ArithmeticDirichletSeriesPartII §0.1b, and its 6.9 (c) cites §4.1a."

## C02 — The origin label of 6.1 assigns the bound of `Φ` in (c) both to the formal proof and to this roadmap

The label exists to say which parts of 6.1 the formal proof has, and for this clause it says both. README lines 70–71 say the formal proof has, "of (c) a bound for `Φ`". Lines 73–75 then list "the bound of `Φ` in (c)" among this roadmap's own formulations. Both readings are partly right. The formal proof has `|Φ(s)| ≤ ∫₀^∞ C e^(−(σ′−2)u) du` on `Re s ≥ σ′ > 2`, under the pointwise bound (`Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/LandauPoleReLe.lean`, `Deduction.landau_pole_re_le_bound`). The form `|Φ(s)| ≤ ∫₀^∞ |g(u)| e^(−σ′u) du` for every `σ′ > A` is the roadmap's. Writing "the bound of `Φ` in (c) in the form `∫₀^∞ |g(u)| e^(−σ′u) du`" in the second sentence would remove the contradiction.

## N01 — Four of the new references have no title

The entries for Kaczorowski (1984), Mahatab and Mukhopadhyay (2015), Cluckers and Herremans (2007) and Adamski (2026) give no title, unlike every other reference. The titles are:

- "On sign-changes in the remainder-term of the prime-number formula, I"
- "Measure theoretic aspects of oscillations of error terms"
- "The fundamental theorem of prehomogeneous vector spaces modulo p^m"
- "Non-Archimedean and motivic stationary phase formulas"

## Questions for the author

- Does the Post–Widder locator in the Widder reference, and in the origin of 6.2, point to the right chapter? As written, "Chapter II" appears to cover "the kernels of the Post–Widder inversion formula (6.2)" too. To my knowledge the Post–Widder inversion operator is treated in Widder's chapter on inversion (Chapter VII), not Chapter II. I found no legal copy of Widder (1941) and could not check.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| 6.1 `Corollary of:` AsymptoticExpansions §4.1a | `q = g = 1`, `c = 0`, `z = 2`, `k = 1` | §4.1a: `(−1)^k Q^(k)(z)/k! = z^(−2) = 1/4`; 6.1 (b): `∫ u e^(−2u) du = 1/4`; `Q(z̄) = conj Q(z)` | holds |
| 6.1 method label | formal proof `landau_coeff`, `landau_pole_re_le_bound`, `landau_pole_re_le` | formula only on `Re s > 2` under `|g| ≤ C e^(2u)`; bound `C/(σ′−2)`; `Re ρ ≤ 2` | matches; C02 is about the wording |
| 6.2 method label | `δ = 1`: `l = 8`, `M = l(1+δ) = 16`, `σ = M(2+l) = 160` | `(1+δ/2)(2+l) = 15 = M − 1`; tail exponent `k(2+l)/(σ−2−l) → 16U = l(1+δ)U` | matches `landau_tails` |
| 6.3 deduced from ArithmeticDirichletSeriesPartII §0.1b | `f = e^(−u)`, `a = 0`; negative control `f = sin u` | §0.1b gives `A′ ∈ (−1,0)`, value `1/(s+1) = F₁`; for `sin u`, `F` analytic at 0 but `∫|sin u|` diverges | holds; sign hypothesis needed |
| 6.3 Checks removed | `f = 1`, `f = sin u` | both remain in Layer 6 Examples (README lines 712–714) and in §0.1b's Checks | nothing lost |
| 6.4 origin (own formulation) | `g = −e^(βu)` | `Φ = −1/(s−β)`, leading coefficient `−1`: case (c)(ii) | consistent |
| 6.5 origin, MM15 proof of Theorem 3.2 | `k = 0`, `g = −1`, `σ = 1`, `γ = 1` | MM15 line 503: `|G(σ+it)| ≤ 2G⁺(σ) − G(σ)`; here `0.7071 − 1 = −0.293 ≤ 0` | same inequality |
| 6.5 method label | `k = 1`, `σ = 3`, `θ′ = 1`, `u = 1/2` | `w_1^3(1/2) = 0.1116 ≤ e^(−0.5)·2^(−1) = 0.3033` | holds |
| 6.6 `Corollary of:` AsymptoticExpansions §13.6a | `Φ = (s−ρ)^(−2)`, `z = 0`, `ρ = −1` | §13.6a on `w ↦ Φ(−w) = (w−1)^(−2)`: `n + 1`; 6.6 (b): `C(k+1,1)·1^(−k−2) = k + 1` | holds |
| 6.7 method label | `Z = {0.5 ± i}`, `σ = 3` | distances `2.6926` both; at `γ = 0.1`: `2.6571` vs `2.7313`, unique nearest | case (A) as stated |
| 6.8 method label | case (A), `d = 1`, `r′ = 1.2`, `η = ½ log 1.2` | left side `≥ e^(0.182U)`, right side `O(e^(0.091U))` | contradiction for large `U`; matches `landau_window` |
| 6.8 origin, Pintz (1980) and Kaczorowski (1984) | Pintz Theorems 1, 2 and §§10–12; Kaczorowski §§3–6 | Gaussian kernel on window, twisted bounded by untwisted; iterated smoothing `δ_n` with `n` chosen per `x` | supported |
| 6.9 `Corollary of:` ArithmeticDirichletSeriesPartII §4.1a | `c(n) = (−1)^(n+1)`, `s = 2` | `F(2)/2 = η(2)/2 = 0.411234`; `∫₁^∞ S_c y^(−3) dy = 0.411234` | holds |
| 6.9 method label | `|C| = 1`, `δ = 1`, `η = 0.1` | `log Y = 50`: `50 ≤ e^5 = 148`; `log Y = 10`: `10 > e = 2.7` | "for large `Y`" is needed, as stated |
| 6.10 origin, Landau (1905) | `c(n) = 1` | Landau pp. 536–537 (series), pp. 547–548 (integrals); `σ_a = 1`, `ζ(s)/s` singular at 1 | holds |
| 7.1 method label, headline (4) | `f_t = (1+Y²)^(−t)`, `Y = 1` | rescaled majorant `0.5, 0.4444, 0.4219` (`t = 1, 2, 3`) decreasing to `e^(−1) = 0.3679` | holds |
| 8.1 method label, headline (5) | weight `‖x‖ + σ`, `σ = |t|^(1/2)`; deformation `quad φ + s·E_P φ` | `s = 0`: quadratic part; `s = 1`: `φ` (formal proof `E_ph_zero`, `E_ph_one`) | matches |
| 8.2 origin (Cluckers–Herremans, Adamski) | `m = 1`, `p = 2` | `det H_1(a) = 2/a`, `|2|_2 = 1/2`: not a unit, so CH04 Lemma 3.3 (`p ≠ 2`) does not apply | "every residue characteristic" correctly its own |
| 8.2 (d), headline (6) | `ℚ_3`, `m = 1`, `D = 1`, `t = 9` and `t = 3` | `t = 9`: both sides `0.115765`; `t = 3`: left `−1/3`, right `1` | holds; neighbourhood needed |
| Headlines (1)–(3) (6.4 (c), 6.8, 6.9 (b)) | statements and `Suggested.lean` unchanged | `g = −u e^(βu)`: leading coefficient `−1`, residue `0`; windows hold since `g ≤ 0` | holds |
| Downstream line (changed) | GeneralizedRiemannHypothesisFromWindowBounds at this head | 6.4 (b), (c) used in §1.2 (lines 486, 490); `HasWindows` in Layers 2–5 | accurate |

- Source locators checked against the text: 15. These are Pintz1980 (Theorems 1, 2, §§10–12), Kac84 (§§3–6), MM15 (proof of Theorem 3.2), CH04 (Lemma 3.3, Proposition 3.5), Ada25 (Theorems 1.5, 1.12), DabrowskiFisher1997 (Proposition 1.3, Theorem 1.8, Corollary 1.10, Lemma 1.20) and Landau (1905), pp. 536–537 and 547–548.
- Formal-proof claims of the new method labels compared with its Lean source: 6.1, 6.2, 6.5, 6.6, 6.7, 6.8, 6.9, 7.1 and 8.1. I opened 14 files and declarations, including `landau_coeff`, `iteratedDeriv_laplace`, `landau_pole_re_le_bound`, `landau_tails`, `landau_window_ineq`, `landau_window_key`, `landau_window`, `landau_cauchy`, `landau_pole_asym`, `landau_nearest`, `windowHyp_of_rpow`, `gauss_ne_zero` and `StationaryPhaseModel`.
- Cross-roadmap citations resolved at this head: 11. These are ArithmeticDirichletSeriesPartII §§0.1, 0.1b, 4.1 and 4.1a; AsymptoticExpansions §§4.1a, 13.6 and 13.6a; GeneralizedRiemannHypothesisFromWindowBounds §§1.1–1.3, 2.4 and 3.1, and its Layers 2–5.
- Record: the README at `74a09b7` against the head. No layer or section is removed, renumbered or retitled. The only heading added is the AsymptoticExpansions contract. 6.3 keeps its statement.
- Library: the change adds no Mathlib or Tau Ceti name. The two names it drops from the Mathlib contract, `DifferentiableOn.hasFPowerSeriesOnBall` and `MeasureTheory.lintegral_tsum`, were used only by the former route of 6.3.
- Automatic checks: all passed. Dependency check: 132 roadmaps, 1467 edges, 0 problems. ArithmeticDirichletSeriesPartII and AsymptoticExpansions are on `main` and neither cites this roadmap.
- Elaboration: `Suggested.lean` is unchanged by this pull request and elaborates with 8 `sorry` warnings and nothing else. Its declarations and the README statements they render are unchanged, so the padding probe was not rerun.
- Overlap check: read SpecialFunctionsGamma, AnalyticNumberTheoryPartI and SpecialFunctionsStruve (open), and GeneralizedRiemannHypothesisFromWindowBounds, RiemannHypothesisStatementsAndConsequences and ArithmeticDirichletSeriesPartII (main). The one object shared is Landau's theorem for one-sided Laplace transforms. Its owner is ArithmeticDirichletSeriesPartII §0.1b, which 6.3 cites. SpecialFunctionsGamma §10.1 has a separate measure-space form, which this roadmap does not use.

Source independence: changed passages only; 14 passages compared with 8 sources (Pintz1980, Kac84, MM15, CH04, Ada25, DabrowskiFisher1997, Landau 1905 and the formal proof's Lean source). None is shared beyond formulas and standard names. The largest share of locators is [FormalProof], 52 of about 103. No layer was added, removed or reordered, so contents were not compared.

Research link: Layer 6 is the windowed Landau theorem that the formal proof of GRH for Dirichlet L-functions [FormalProof] (Alpöge, announced 2026) uses. It extends the window theorems of Pintz (1980) and Kaczorowski (1984) for the remainder in the prime number theorem. Layers 7 and 8 extend Hörmander's (1990) stationary phase and Dąbrowski–Fisher's (1997) `p`-adic formula. This line rests on the README Summary and References, and on Pintz1980 and DabrowskiFisher1997, which I read.

## Not verifiable

- Widder (1941), Chapter II, and the Post–Widder kernels (origins of 6.1 and 6.2): no legal copy found.
- Montgomery–Vaughan (2007), §15.1 and chapter 1 (origins of 6.4 and 6.9): paywalled.
- Wong (1989), Chapters VIII–IX (origin of 7.1): paywalled.
- Hörmander (1990), §7.6 and Theorems 7.7.1 and 7.7.5: recorded as uncertified.
- Flajolet–Sedgewick (2009), Chapters IV–V (origin of 6.6): chapter-level locator, not opened.
- The kernel export of the formal proof could not be decompressed under the default memory limits. Claims about what the proof proves were checked against its Lean source files instead.
- The journal data of Adamski (2026, Confluentes Math. 18): not checked; I read arXiv v2.

## Source issues

- none

## For the human reviewers

- Neither recorded decision touches this folder. No section leaves it, and 6.3 keeps its statement, now deduced from ArithmeticDirichletSeriesPartII §0.1b.
- Scope fact: [FormalProof], a public Lean repository rather than refereed literature, has 52 of the README's roughly 103 locators. The new labels classify 6.2, 6.7 and 6.8 as particular to that proof.
