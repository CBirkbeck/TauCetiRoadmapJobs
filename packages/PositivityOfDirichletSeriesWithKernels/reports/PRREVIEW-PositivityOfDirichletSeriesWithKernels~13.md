# Review of PositivityOfDirichletSeriesWithKernels (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/PositivityOfDirichletSeriesWithKernels/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 248 changed lines since `b8f3652`. I found no finding. The folder is the same text the previous review read, so I recomputed its main points: the deduction of 6.3 from ArithmeticDirichletSeriesPartII §0.1b, the three `*Corollary of:*` lines (6.1, 6.6, 6.9) against the supplier sections, the method labels of Layer 6 against the Lean source of the formal proof, and the origin labels of 6.5 and 8.2 against three papers. Accepted with two small corrections and one format note, all carried over from the previous review and none blocking. One question goes to the author; the human reviewers have one decision to note as applied and one scope fact.

## C01 — The description does not say that this roadmap gains a supplier and that 6.3 is now deduced from another roadmap

A reader of the pull request cannot tell that this roadmap's suppliers change. The README gains a contract `### From TauCetiRoadmap.AsymptoticExpansions` (§4.1a for 6.1, §13.6a for 6.6 (b)), and that roadmap is not a supplier on `main`. The proof of 6.3 and two of its Checks are replaced by a deduction from ArithmeticDirichletSeriesPartII §0.1b, and 6.9 (c) cites its §4.1a. The description names the suppliers that four other roadmaps of the family gain, but in the part of it I could read (it is cut off in the section on wrong statements) it never names this roadmap. A sentence would do: "PositivityOfDirichletSeriesWithKernels gains AsymptoticExpansions as a supplier (§4.1a for 6.1, §13.6a for 6.6 (b)); its 6.3 keeps its statement and is deduced from ArithmeticDirichletSeriesPartII §0.1b, and its 6.9 (c) cites §4.1a."

## C02 — The origin label of 6.1 assigns the bound of `Φ` in (c) both to the formal proof and to this roadmap

The label exists to say which parts of 6.1 the formal proof has, and for this clause it says both. Lines 70–71 say that the formal proof has "of (c) a bound for `Φ`"; line 73 lists "the bound of `Φ` in (c)" among this roadmap's own formulations. The formal proof has `‖Φ(s)‖ ≤ ∫₀^∞ C e^(−(σ−2)u) du` on `Re s ≥ σ > 2` under the pointwise bound (`Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/LandauPoleReLe.lean`, `Deduction.landau_pole_re_le_bound`); the form `|Φ(s)| ≤ ∫₀^∞ |g(u)| e^(−σ′u) du` for every `σ′ > A` is the roadmap's. Writing "the bound of `Φ` in (c) in the form `∫₀^∞ |g(u)| e^(−σ′u) du`" at line 73 removes the contradiction.

## N01 — Four of the new references have no title

The entries for Kaczorowski (1984), Mahatab and Mukhopadhyay (2015), Cluckers and Herremans (2007) and Adamski (2026), at lines 1134, 1135, 1140 and 1141, give no title, unlike every other reference. The last three are "Measure theoretic aspects of oscillations of error terms", "The fundamental theorem of prehomogeneous vector spaces modulo p^m" and "Non-Archimedean and motivic stationary phase formulas" (read on the arXiv versions); the first is "On sign-changes in the remainder-term of the prime-number formula, I" by the journal's record.

## Questions for the author

- Does "Chapter II" in the Widder reference also cover "the kernels of the Post–Widder inversion formula (6.2)"? To my knowledge Widder treats that inversion operator in a later chapter (on inversion), not in Chapter II. I found no legal copy of Widder (1941) and could not check.
- The origin label of 6.8 and the reference cite Kaczorowski (1984) "sections 3–7". I could not read the paper this round; is 7 the last section that the comparison uses?

## Previous findings

- C01 — not repaired, as far as the description could be read: it still does not name this roadmap among those that gain a supplier. Raised again as C01.
- C02 — not repaired: lines 70–73 of the README are unchanged. Raised again as C02.
- N01 — not repaired: the four references still have no title. Raised again as N01.
- The previous question on the Post–Widder locator is unchanged and asked again.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| 6.1 `Corollary of:` AsymptoticExpansions §4.1a | `q = g = 1`, `c = A = 0`, `z = 2`, `k = 1` | §4.1a: `(−1)^k Q^(k)(z)/k! = z^(−2) = 1/4`; 6.1 (b): `∫₀^∞ u e^(−2u) du = 1/4` | holds |
| 6.1 method label | formal proof `landau_coeff`, `landau_pole_re_le_bound`, `landau_pole_re_le` | formula only for `2 < Re s` under `PoleData`; bound `∫ C e^(−(σ−2)u) = C/(σ−2)`; `Re ρ ≤ 2` | matches; C02 is the wording |
| 6.2 method label | `δ = 1`: `l = 2 + 6/δ = 8`, `M = l(1+δ) = 16` | `(1+δ/2)(2+l) = 15 = M − 1`; `σ = M(2+l) = 160 = l(1+δ)(l+2)`; `k = ⌈(1+δ/2)σU⌉` | matches `landau_tails` |
| 6.3 deduced from ArithmeticDirichletSeriesPartII §0.1b | `f = e^(−u)`, `a = 0`, `r = 1`; negative control `f = sin u` | §0.1b gives `A′ ∈ (−1, 0)`, value `1/(s+1) = F₁` on the convex set by the identity theorem; `sin u`: `1/(s²+1)` analytic at 0, `∫|sin u|` diverges | holds; sign hypothesis needed |
| 6.3, the two Checks the change drops | `f = 1`, `f = sin u` | both stand in the Examples of Layer 6 (lines 712–714) and in the Checks of §0.1b | nothing lost |
| 6.4 origin (own formulation), headline (1) | `g = −u e^(βu)` | `Φ = −(s−β)^(−2)`: residue `0`, leading coefficient `−1 < 0` | consistent |
| 6.5 origin, MahatabMukhopadhyay2015 lines 502–503 | `k = 0` | source: `|G(σ+it)| ≤ 2G⁺(σ) − G(σ)`; 6.5: `|a_0(σ+iγ)| + a_0(σ) ≤ ∫(|g|+g) e^(−σu)`, same inequality | supported |
| 6.5 method label | `landau_window_ineq`; kernel bound at `k = 1`, `σ = 3`, `θ = 1`, `u = 1/2` | `u e^(−3u) = 0.1116 ≤ (σ−θ)^(−1) e^(−θu) = 0.3033`; off-window term `2C₀ ∫ u^k e^((2−σ)u)/k!` | matches |
| 6.6 `Corollary of:` AsymptoticExpansions §13.6a | `w ↦ Φ(z − w)`, `Φ = (s−ρ)^(−2)`, `n = 1` | `d/dw (z−ρ−w)^(−2)` at 0: `2(z−ρ)^(−3)`; 6.6 (b): `C(2,1)(z−ρ)^(−3) = 2(z−ρ)^(−3)`; `f_n = a_n(z)` | holds |
| 6.7 method label | `landau_dichotomy`, `landau_nearest` as used in `landau_window` | case split: real rightmost nearest pole, or centre `σ + γi` with unique nearest pole | matches |
| 6.8 method label, headline (2) | `landau_window`: `0 < θ < 1`, `δ > 0`, `WindowHypU` | conclusion `∀ ρ ∈ Z, Re ρ ≤ θ`, by contradiction through `landau_window_key` and the two cases | matches the form stated |
| 6.9 `Corollary of:` ArithmeticDirichletSeriesPartII §4.1a, headline (3) | `c(n) = 1` for `n = 1` only, `s = 2` | `F(2)/2 = 1/2`; `∫₁^∞ y^(−3) dy = 1/2`; §4.1a needs `Re s > 0`, 6.9 (c) has `Re s > A ≥ 0` | holds |
| 6.9 method label | `|C| = 1`, `δ = 1`, `η = 0.1` | `δ log Y ≤ Y^η`: `log Y = 50`: `50 ≤ e^5 = 148`; `log Y = 10`: `10 > e = 2.72` | "for large `Y`" needed, as stated |
| 6.10 origin | `c(n) = 1` | `σ_a = 1`; `ζ(s)/s` singular at `1`; abscissa of the transform `1` | consistent |
| 7.1 method label, headline (4) | majorant `(1 + c‖w‖²/t)^(−γt)`, `c = γ = ‖w‖ = 1` | `t = 1, 2, 3`: `0.5, 0.4444, 0.4219`, decreasing to `e^(−1) = 0.3679`; formal proof uses `Real.geom_mean_le_arith_mean2_weighted` | holds |
| 8.1 method label, headline (5) | read against the statement of 8.1 (c) | weight `‖x‖ + |t|^(1/2)` is `1` at `x = 0`, `t = 1`; deformation at parameter `0` is the quadratic part, at `1` the phase | consistent with 8.1 |
| 8.2 origin (CluckersHerremans2007 line 278; Adamski2026 lines 106–107, 149) | `m = 1`, `p = 2`, phase `x + D/x` | Hessian at `a`: `2/a`, `|2|₂ = 1/2`, not a unit; both sources assume `p ≠ 2` | "every residue characteristic" correctly its own |
| 8.2 method label | formal proof `Formalism.FourierDecayAlt.P.InverseBoundedFixedPoint.morse` | a fixed-point construction of the Morse bijection, as the label says | matches |
| Downstream line (changed) | GeneralizedRiemannHypothesisFromWindowBounds at this head | 6.4 (b), (c) cited at its lines 486, 490; `HasWindows` in its Layers 2, 3, 4 and 5 | accurate |

- Source locators checked against the text: 8. MahatabMukhopadhyay2015 (Theorem 3.2 and its proof, lines 424, 502–503), CluckersHerremans2007 (Lemma 3.3, line 278; Proposition 3.5, line 347), Adamski2026 (Theorems 1.5 and 1.12, lines 149, 264; the standing hypothesis, line 106), DabrowskiFisher1997 (Proposition 1.3 (a), lines 353–358, and the Weil invariant, line 374).
- Formal-proof declarations opened at the cited commit: `landau_coeff`, `landau_pole_re_le_bound`, `landau_pole_re_le`, `landau_tails`, `landau_window_ineq`, `landau_window`, and the files of 7.1 and 8.2 by search.
- Cross-roadmap citations resolved at this head: ArithmeticDirichletSeriesPartII §§0.1b, 4.1a; AsymptoticExpansions §§4.1a, 13.6, 13.6a; GeneralizedRiemannHypothesisFromWindowBounds §§1.1–1.3 and Layers 2–5. Incoming citations (§§6.4, 6.8, 6.9, 7.1, 8.1, 8.2) all still resolve.
- Record: README at `b8f3652` against the head. No layer or section is removed, renumbered or retitled; one heading is added (the AsymptoticExpansions contract). 6.3 keeps its statement.
- Library: the change adds no Mathlib or Tau Ceti name; it drops `DifferentiableOn.hasFPowerSeriesOnBall` and `MeasureTheory.lintegral_tsum`, used only by the former route of 6.3 and now listed in §0.1b's `*Needs:*`.
- Automatic checks: all passed. Dependency check output: `depcheck: 129 roadmaps, 1439 edges, 0 problem(s)`. ArithmeticDirichletSeriesPartII and AsymptoticExpansions are on `main`.
- Elaboration: `Suggested.lean`, which the pull request does not change, elaborates with 8 `sorry` warnings and nothing else. No declaration changed, so the signature comparison and the one-tactic probe were not rerun.

Overlap check: read SpecialFunctionsGamma, SpecialFunctionsStruve and ZerosOfLFunctions (open), and GeneralizedRiemannHypothesisFromWindowBounds, RiemannHypothesisStatementsAndConsequences and ArithmeticDirichletSeriesPartII (main), searched for Landau's theorem, the window predicate and stationary phase; the one object shared is Landau's theorem for one-sided Laplace transforms, owner ArithmeticDirichletSeriesPartII §0.1b (main), which 6.3 cites. SpecialFunctionsGamma §10.1 (open) states a measure-space form with real powers, which this roadmap does not use.

Source independence: changed passages only; 9 passages compared with 5 sources (MahatabMukhopadhyay2015, CluckersHerremans2007, Adamski2026, DabrowskiFisher1997 and the Lean source of the formal proof), none shared beyond formulas and standard names; largest share [FormalProof], 38 file locators and about half of all locators; no layer was added, removed or reordered, so contents were not compared.

Research link: Layer 6 is the windowed Landau theorem used by the formal proof of GRH for Dirichlet L-functions (Alpöge, announced 2026), next to the window theorems of Pintz (1980) and Kaczorowski (1984); Layers 7 and 8 extend Hörmander (1990) and Dąbrowski–Fisher (1997). Rests on the README Summary and References, and on DabrowskiFisher1997, which I read.

## Not verifiable

- Pintz (1980), §§10–12 and Theorems 1 and 2 (origins of 6.5 and 6.8): no copy on a host the sources service accepts.
- Kaczorowski (1984), sections 3–7 (origin of 6.8): the same.
- Landau (1905), Widder (1941), Montgomery–Vaughan (2007), Wong (1989), Flajolet–Sedgewick (2009): not opened this round (paywalled, or no legal copy found).
- Hörmander (1990), §7.6 and Theorems 7.7.1 and 7.7.5: recorded as uncertified.
- The method label of 8.1 was compared with the statement of 8.1 and not line by line with the formal proof's source.
- The pull request's description was available only in part (cut off in its section on wrong statements).

## Source issues

- none

## For the human reviewers

- The decision on sections that leave the family was applied to 6.3: its statement stays, and its proof and two Checks are now in ArithmeticDirichletSeriesPartII §0.1b, which the README names and which does state them.
- Scope fact: [FormalProof], a public Lean repository rather than refereed literature, carries about half of the README's locators; the labels classify 6.2, 6.7 and 6.8 as particular to that proof.
