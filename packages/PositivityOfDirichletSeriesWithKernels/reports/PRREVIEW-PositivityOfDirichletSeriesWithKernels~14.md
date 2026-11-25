# Review of PositivityOfDirichletSeriesWithKernels (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/PositivityOfDirichletSeriesWithKernels/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 56 lines changed since `3bddf73`, all in the README; I found no finding. The new statements about the formal proof (Landau's theorem in the Mellin variable for 6.3, the upper bound only for 6.2 (b), the bound of 6.1 (c)) agree with its Lean source, and the deduction of the formal proof's windowed theorem from the theorem of Kaczorowski and Pintz, as the README renders that theorem, is sound. Accepted with two small corrections and one format note, none blocking. The human reviewers have one fact to note: the paper of Kaczorowski and Pintz, which now carries the origin of 6.8, could not be read.

## C01 — The description does not say that this roadmap gains a supplier and that 6.3 is now deduced from another roadmap

A reader of the pull request cannot tell that this roadmap's suppliers change. The README gains a contract `### From TauCetiRoadmap.AsymptoticExpansions` (§4.1a for 6.1, §13.6a for 6.6 (b)), and that roadmap is not a supplier on `main`; 6.3 is deduced from ArithmeticDirichletSeriesPartII §0.1b and 6.9 (c) cites its §4.1a. In the part of the description I could read (it is cut off in the paragraph on ThetaChainsAndFrobeniusPrimeSums) this roadmap is named only through the sentence that the window form of Landau's theorem is credited to Kaczorowski and Pintz, which the head does bear out. A sentence would do: "PositivityOfDirichletSeriesWithKernels gains AsymptoticExpansions as a supplier (§4.1a for 6.1, §13.6a for 6.6 (b)); its 6.3 keeps its statement and is deduced from ArithmeticDirichletSeriesPartII §0.1b, and its 6.9 (c) cites §4.1a."

## C02 — The Summary says that "the windowed form" follows from Kaczorowski and Pintz, where 6.8 claims this only for the form of the formal proof

The new sentence of the Summary (line 3) comes directly after the sentence that the windowed form is stated twice, so a reader takes it to cover the extension to poles of any finite order as well. The origin label of 6.8 (lines 470–475), the label of 6.9 and the reference entry claim the deduction only for "the form of the formal proof", and the argument given there uses a simple real pole with positive residue: subtracting `r e^(Θu)(1 − cos γu)` removes the pole at `Θ` only when it is simple. Writing "The form of the formal proof also follows, by a short argument, …" in the Summary makes the two agree.

## N01 — Four references have no title

The entries for Kaczorowski (1984), Mahatab and Mukhopadhyay (2015), Cluckers and Herremans (2007) and Adamski (2026), at lines 1152, 1153, 1158 and 1159, give no title, unlike the two entries for Kaczorowski and Pintz added beside them. The first is "On sign-changes in the remainder-term of the prime-number formula, I" (read on the journal's open scan this round); the others are "Measure theoretic aspects of oscillations of error terms", "The fundamental theorem of prehomogeneous vector spaces modulo p^m" and "Non-Archimedean and motivic stationary phase formulas".

## Questions for the author

- The origin label of 6.8 says that the proof of Kaczorowski and Pintz (1986), Theorem 1, "also uses regularity at the real point `Θ`, which their statement does not display". The hypothesis is needed (`f(x) = x^Θ` has transform `1/(s − Θ)` and never changes sign), but I could not read the paper: does its Theorem 1 really omit it, or does it stand among its standing assumptions? If the latter, the clause should go.
- Does "Chapter II" in the Widder reference also cover "the kernels of the Post–Widder inversion formula (6.2)"? To my knowledge Widder treats that operator in a later chapter. I found no legal copy of Widder (1941).

## Previous findings

- C01 — not repaired, as far as the description could be read: it still does not name AsymptoticExpansions as a new supplier of this roadmap. Raised again as C01.
- C02 — repaired: line 73 now reads "the bound of `Φ` in (c) in the form `|Φ(s)| ≤ ∫₀^∞ |g(u)| e^(−σ′u) du`", which no longer contradicts lines 70–71.
- N01 — not repaired: the four references still have no title. Raised again as N01.
- The question on Kaczorowski (1984), sections 3–7: the paper is now readable; its sections run to at least 10 and section 4 opens the proof of the case `j = 3`. Not asked again. The question on the Post–Widder locator stands.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| 6.1 origin label, bound of `Φ` in (c) (changed) | `g = e^(−u)`, `A = −1`, `σ′ = 0`, `s = 1` | `|Φ(1)| = 1/2`; `∫₀^∞ e^(−u) du = 1`; formal proof has `C/(σ − 2)` under the pointwise bound only | consistent; previous C02 repaired |
| 6.2 (b), split between formal proof and roadmap (changed) | `k = 1`, `a = 1`, `u = 1`; shift `a′ = 1`, `b = 3` | `w = e^(−1) = 0.368 ≤ a^(−k) = 1`; `e^(−3u)·u e^(2u) = u e^(−u)`, rate `a′ − b = −2 ≤ 0` | `landau_kernel_max` has `0 < a`, upper bound only: label right |
| 6.3 method label (changed) | `H = 1`, `a = 0`; `x = e^u` | `∫₁^∞ x^(−σ−1) dx = 1/σ`, `Φ = 1/s` not analytic at `0`, so no `a′ < 0`; `∫₁^∞ H x^(−s−1) dx = ∫₀^∞ H(e^u) e^(−su) du` | matches `Formalism.LandauLemma` (integrability) with `Formalism.LandauEq` (value) |
| 6.3, "main theorems do not depend on it" | index of declarations reached by the main theorems | no name containing `LandauLemma` or `landauEq` (0 hits); `Deduction.landau_window`, `landau_kernel_max`, `kernel_integral` present | holds |
| 6.8 origin, the short argument from Kaczorowski–Pintz (changed) | `g = e^(u/2)`, `r = 1`, `γ = 1`; average over `[u − 1, u]` | `g̃ = e^(u/2) cos u ≤ g`, transform `(s − ½)/((s − ½)² + 1)`, value `0` at `½`; averaging multiplies by `(1 − e^(−s))/s`, `0.787` at `½`, zeros only at `2πik` | sound, given the theorem as rendered |
| 6.8, window step of the argument | `η ≤ θ′ − θ`, `u ∈ [U + 1, (1 + δ)U]` | `∫_(u−1)^u g⁺ ≤ e^(θu + ηU) ≤ e^(θ′u)` since `ηU ≤ (θ′ − θ)u` | holds |
| 6.8, need for regularity at `Θ` | `f(x) = x^Θ` | transform `1/(s − Θ)`, meromorphic everywhere, no sign change | hypothesis needed, as the label says |
| 6.9 origin (changed), headline (3) | `λ = 3/2` | `[Y, Y^λ] = [Y′^(1−ε), Y′]` with `Y′ = Y^λ`, `ε = 1 − 1/λ = 1/3` | same intervals |
| Summary, sentence on Kaczorowski–Pintz (changed) | read against 6.8 | 6.8 claims the deduction for simple poles with positive real residues only | C02 |

The rows for the statements the change does not touch stand as in the previous review, of `3bddf73`.

- Formal-proof declarations opened at the cited commit: `Formalism.LandauLemma` (`Formalism/ZetaRealNonvanish.lean`), `Formalism.LandauEq` (`Formalism/DefsOC.lean`), `Formalism.landauLemma_of`, `Formalism.landauEq`, `Deduction.landau_kernel_max`; all five at the paths the README gives.
- Source locators checked against the text: 1 (Kaczorowski 1984, title and section numbering). Kaczorowski–Pintz (1986, 1987): not readable.
- Cross-roadmap citations in or depending on the changed passages: ArithmeticDirichletSeriesPartII §0.1b (heading at line 259 of its README at this head); GeneralizedRiemannHypothesisFromWindowBounds cites §§6.3, 6.8 and 6.9 (b) here, all present; the family index states the same deduction as 6.8.
- Record: no heading, layer or Lean declaration changed since `3bddf73`; the folder's change is 37 insertions and 19 deletions in the README.
- Automatic checks: all passed. Dependency check output: `depcheck: 119 roadmaps, 1366 edges, 0 problem(s)`.
- Elaboration: `Suggested.lean`, unchanged, elaborates with 8 `sorry` warnings and nothing else. No declaration changed, so the signature comparison and the one-tactic probe were not rerun.

Overlap check: read SpecialFunctionsGamma (open), GeneralizedRiemannHypothesisFromWindowBounds, RiemannHypothesisStatementsAndConsequences and ArithmeticDirichletSeriesPartII (main) as in the previous review, and searched every open head and main for the theorem of Kaczorowski and Pintz: no roadmap outside this pull request states it; the one shared object remains Landau's theorem for one-sided Laplace transforms, owner ArithmeticDirichletSeriesPartII §0.1b, which 6.3 cites.

Source independence: changed passages only; 5 passages compared with 2 sources (the Lean source of the formal proof and Kaczorowski 1984), none shared beyond formulas and declaration names; Kaczorowski–Pintz (1986, 1987) could not be read; largest share [FormalProof], about half of all locators; no layer was added, removed or reordered, so contents were not compared.

Research link: Layer 6 is the windowed Landau theorem used by the formal proof of GRH for Dirichlet L-functions (Alpöge, announced 2026), whose form the README derives from Kaczorowski–Pintz (1986), next to Pintz (1980) and Kaczorowski (1984); Layers 7 and 8 extend Hörmander (1990) and Dąbrowski–Fisher (1997). Rests on the README Summary and References.

## Not verifiable

- Kaczorowski and Pintz (1986), Theorem 1 and Corollary 1, pp. 175–176, and part II (1987), pp. 441–442 (origin of 6.8 and 6.9, two reference entries): recorded as uncertified; the statement, the pages and the remark on regularity at `Θ` were not checked against the text.
- Pintz (1980), §§10–12 and Theorems 1 and 2: no copy on a host the sources service accepts.
- Landau (1905), Widder (1941), Montgomery–Vaughan (2007): not opened this round.
- The pull request's description was available only in part (cut off in the paragraph on ThetaChainsAndFrobeniusPrimeSums); its counts of labelled sections were not recomputed.

## Source issues

- none

## For the human reviewers

- The decision on sections that leave the family was applied to 6.3: its statement stays, and its proof is in ArithmeticDirichletSeriesPartII §0.1b, which the README names and which does state it.
- Not tested: the origin of 6.8 is now "adapted from Kaczorowski and Pintz (1986)", a paywalled paper this review could not read; the README also says its Theorem 1 omits a hypothesis its proof uses (README line 469).
- Scope fact: [FormalProof], a public Lean repository rather than refereed literature, carries about half of the README's locators; the labels classify 6.2 and 6.7 as particular to that proof.
