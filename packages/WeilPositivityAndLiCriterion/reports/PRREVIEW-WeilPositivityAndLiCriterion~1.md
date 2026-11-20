# Review of WeilPositivityAndLiCriterion (pull request #2791 at d4cd2de)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of the five layers was recomputed (the multiset criterion and its four negative controls, the symmetric Li sum and its reindexing, the termwise derivative formula, the pairing identity, the Gram-matrix argument, reality and strict positivity of Weil's form) and each agrees with the Lean signature; all Lagarias locators were read at the text. There is one small correction and one format note, neither blocking. Bombieri's article could not be fetched from a host the source service recognises, so its locators and wording are unchecked: that, and the status of the copy, are left to the human reviewers.

## C01 — The docstring of the Weil criterion attributes the nonnegative form to Bombieri's Theorem 1, while the README says Theorem 1 is the strict form

A reader who opens the source from the Lean file expects Theorem 1 to state `RH ↔ Re W(g, g) ≥ 0`. The README, in 5.2 (lines 428–431), says something else: Theorem 1 states equivalence with strict positivity at every nonzero `g`, and the nonnegative form is what its proof of the converse yields, the form of Theorem 2. The docstring of `riemannHypothesis_iff_weilForm_nonneg` (`Suggested.lean`, line 160) reads "Weil's criterion (Bombieri 2000, Theorem 1)".

The smallest change is in the docstring: "(Bombieri 2000, Theorem 1 and its proof; the nonnegative form is that of Theorem 2)", or simply the README's sentence.

## N01 — "The Li class" in the title of Layer 4 and in the References is not defined in the README

Layer 4 works with the span of the `Gₙ`, `n ≥ 1`; Lagarias's Li class (lagarias-li-automorphic line 583) is larger, the rational functions vanishing at infinity with poles in `{0, 1}`, spanned by the `Gₙ` with `n ≠ 0` of both signs. One clause in 4.1 saying which is meant would do.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 `zetaZeroMult` | `ρ = 0, 1, −2`; divisor definition at the pin | order `−1` at `0, 1` (Tau Ceti), `toNat = 0`; at `−2` Γ-pole cancels ζ-zero, order `0`; signed divisor would weigh poles `−1` | sound | none |
| 1.2 symmetries | `s ↦ 1 − s`, conjugation; poles | `Λ(1−s) = Λ(s)`, derivative `−1 ≠ 0`; `conj h(conj s)` analytic, nonzero; poles `0 ↔ 1` exchanged, both fixed by conj | sound | none |
| 2.1 `bombieriLagarias` | `{0.6±3i, 0.4±3i}`; `{0.55±14i, 0.45±14i}`; `{0}`; `{1}`; `{2}`; `{i√k} ∪ {2}`; `n = 0` | first negative `n = 19`: `−0.0841`; `n = 88`: `−0.001005`; `{0}`: `0, 1, 1…`; `{1}`: junk `w = 0`, sums `1`; `{2}`: `−1, −3, −7`; partial sums `4.197, 6.486, 8.788` | sound; hypotheses `m 1 = 0` and summability both needed | none |
| 2.1 route | bounds | `|w|² − 1 = (2Re ρ − 1)/|ρ−1|²`; `(1+x)^n − 1 − nx ≤ e n² x²/2` for `x ≤ 1/n`; `(1+|ρ|)² ≤ 4|ρ−1|²` for `|ρ| ≥ 3`; term `≈ n(n+1)/(2k)` at `i√k` | sound | none |
| 3.1 `liCoeff`, `liCoeff_eq_tsum` | `n = 0, 1, 2`; `ρ ↦ 1 − ρ` | `1 − 1/(1−ρ) = ρ/(ρ−1)`, `w(1−ρ) = 1/w(ρ)`; `λ₁ = 1 + γ/2 − ½log 4π = 0.0230957`; `λ₂ = 2λ₁ − ∑ρ⁻² = 0.0461914 + 0.0461543 = 0.0923457`; tail `7.198·10⁻⁴` at `n = 1` | sound | none |
| 3.2 Li's criterion | both directions; `n = 0`; strictness | on the line `|u| = 1`, term `1 − cos nθ ≥ 0`, zero at ≤ `n − 1` points; (⇐) 2.1 gives `≤ 1/2`, reflection gives `≥ 1/2`; `λ₀ = 0` so strict form needs `n ≥ 1` | sound | none |
| 3.3 `tendsto_liCoeff` | `T < 0`; conjugate pairs | empty set, sum `0`; disc conj-invariant so imaginary parts cancel; real half-family summable with sum `λₙ` by reindexing | sound | none |
| 3.4 derivative formula | `n = 1, 2`; `ρ = 0.3 + 2i`; branch | `ξ(1) = 1/2`, off the slit; `n = 1`: `1/(1−ρ) = 0.155902 + 0.445434i = 1 − ρ/(ρ−1)`; `n = 2`: `−2δ − δ² = 1 − w²`; `s/ρ` term `n/ρ`; `nb` cancels `n∑Re 1/ρ` | sound | none |
| `riemannXi` | `s = 0, 1`; generic `s` | `s(s−1)Λ = s(s−1)Λ₀ − (s−1) + s`; value `1/2` at `0, 1`; half of `zetaEntireCompletion` | sound | none |
| 4.1 pairing | 14-point symmetric set, `(2,5)`, `(3,1)`; `n = k`; `n = 0` | both sides `−7.3295730`; `(3,1)`: `9.7193970`, without conj `6.0164090`; diagonal `2λₙ`; `G₀ = 0` gives `0 = λ₀ + λₖ − λₖ` | sound | none |
| 4.2 Gram matrices | `N = 0, 1, 2`; index from `0` | `N = 1`: `0.0461914`; `N = 2`: det `3.43·10⁻⁶`, least eigenvalue `1.49·10⁻⁵`; `P(u)` has coefficient `−c_i` at `u^(i+1)`, ≤ `N` roots; zero first row if indexed from `0` | sound | none |
| 5.1 `weilForm`, reality | `g* `transform; 10-point set; `g = 0` | `mellin g*(s) = conj ĝ(1 − conj s)`; terms `O((1+|ρ|)⁻⁴)`; `ρ ↦ 1 − conj ρ` conjugates each term; `W(0) = 0` | sound | none |
| 5.2 Weil's criterion | RH side; strictness; converse | `1 − conj ρ = ρ`, terms `m|ĝ(ρ)|²`; `O(R)` zeros of `ĝ` against `≥ cR log R` zeros of ζ; `mellin gₙ = Gₙ` from `∫₀¹ x^(s−1)(log x)^(j−1)/(j−1)! = (−1)^(j−1)/s^j`; off-line example `2 × (−0.0841) = −0.168` | sound | none |
| 5.2 truncation limit | cut at height `Y = exp(√log(1/ε))` | below: `ε^(c/log Y)(log 1/ε)^(n−1) → 0`; above: `(log 1/ε)^(n−1) log Y/Y → 0`; needs the zero-free region on both sides, as listed | sound | none |

- Source locators checked against the text: 10, all in lagarias-li-automorphic ((1.1)–(1.3) lines 32–51, (1.6)–(1.7) lines 73–94, (3.1) line 555, (3.2) line 593, Theorem 3.1 with (3.3)–(3.4) lines 601–606, page 14 lines 652–657).
- Library declarations opened at the pin: 24 in Mathlib (among them `RiemannHypothesis` at `NumberTheory/LSeries/RiemannZeta.lean:185`, `MeromorphicOn.divisor` at `Analysis/Meromorphic/Divisor.lean:41`, `Matrix.PosSemidef`/`PosDef` at `LinearAlgebra/Matrix/PosDef.lean:62,176`, `AnalyticOnNhd.sum_divisor_le` at `Analysis/Complex/JensenFormula.lean:389`, `completedRiemannZeta_conj` at `NumberTheory/Harmonic/ZetaAsymp.lean:505`) and 4 in Tau Ceti (`NumberTheory/LSeries/CompletedRiemannZeta.lean:34–63`); every name the README lists exists in the file it names. Neither library has a Li coefficient, `ξ`, or a zero multiplicity of this shape.
- Cross-roadmap citations resolved on main: 16 (ZerosOfLFunctions 0.2, 5.5, 5.6, 5.6a, 6.2, 7.4, 7.6, 8.4, Layer 9 and its six `Suggested.lean` names; AnalyticNumberTheoryPartIII 9.1–9.3; ExplicitPrimeCounting 2.1; AnalyticNumberTheoryPartI 1.8, 1.8a; ExplicitZetaBounds 7.3a).
- Dependency check: `depcheck: 182 roadmaps, 2071 edges, 0 problem(s)`; no UPWARD or CYCLE line. All five suppliers are on main. No change outside the folder.
- Elaboration: `Suggested.lean` elaborates with 15 `sorry` warnings and nothing else; no `set_option`, no sorry'd data, one `import Mathlib`. The file has no `variable` block; the 21 elaborated types were compared with the README statements, no difference.
- One-tactic probe on all 15 theorems (`simp`, `rfl`, `simp` with the six definitions unfolded): none closes. No padding.
- Headline theorems (Li's criterion, Bombieri–Lagarias, the pairing and Gram criterion, Weil's criterion): all stated. The pull request's title and description agree with the head (6 definitions, 15 theorems, suppliers as listed).
- Overlap check: read ExplicitNumberFields, QuasiRiemannHypothesis, SpecialFunctionsGamma (open), ZerosOfLFunctions, AnalyticNumberTheoryPartIII, AnalyticNumberTheoryPartI (main); nothing shared. ZerosOfLFunctions owns `zetaEntireCompletion = 2ξ`, cited; ExplicitNumberFields leaves Li coefficients of `ζ_K` to its own Part II, which this roadmap also excludes.

Source independence: 8 passages compared with 1 source (lagarias-li-automorphic), none shared; largest share Bombieri 2000, 9 of 16 locators, text and contents not readable, so not compared; contents compared with lagarias-li-automorphic: independent.

Research link: the headline targets are Li's criterion (Li 1997), its multiset form (Bombieri–Lagarias 1999), Weil's criterion as in Bombieri 2000, and the pairing of Lagarias 2005, who extends them to automorphic L-functions; rests on the README's references and on Lagarias's text.

## Not verifiable

- Bombieri 2000 (§2 p. 186; Theorem 1, (3.1)–(3.4) and the proof, pp. 191–193; Theorem 2 p. 193): the source service found no copy on a host it recognises (the BDIM archive is in no licence class); the nine locators and the wording against it are unchecked. The statements citing it were verified as mathematics.
- Li 1997 and Bombieri–Lagarias 1999: cited without locator; not read.
- Checks that need a table of zeros of `ζ` (the 1000-zero sums of 3.1, 3.3 and 4.1, `λ₃…λ₆`, the eigenvalues for `N ≥ 3`, the bump values of 5.1): no multiprecision package here; `λ₁`, `λ₂`, the `N ≤ 2` values and every synthetic-multiset value were recomputed.

## Source issues

- **Error** in lagarias-li-automorphic at (1.6), printed page 2: the source says the multiset hypothesis is convergence of the sum of `Re ρ/(1 + |ρ|)²`; it should be `(1 + |Re ρ|)/(1 + |ρ|)²`, since `{i√k}` satisfies the printed form while (1.7) at `n = −1` diverges; affects a stated result.

## For the human reviewers

- **Licence.** Bombieri 2000 is read by the author from the BDIM archive (bdim.eu), a host the source service does not classify; the description calls it open. References, first entry.
- **Not tested.** Bombieri 2000 has the largest share of the locators (9 of 16); its text and table of contents could not be read, so wording and arrangement were not compared with it.
