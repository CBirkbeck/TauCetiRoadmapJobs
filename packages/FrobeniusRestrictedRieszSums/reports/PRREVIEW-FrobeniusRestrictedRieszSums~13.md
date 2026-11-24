# Review of FrobeniusRestrictedRieszSums (pull request #3027 at cd123f8)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/FrobeniusRestrictedRieszSums/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 247 changed lines since `74a09b7`. Accepted with no findings. The change adds the `*Origin:*`, `*Method of the formal proof:*` and `*Corollary of:*` labels, renames the status tags to `*Sources:*`, and adds contracts for two supplier sections; it alters no statement, layer or Lean declaration. I checked the two corollary deductions by computation, the identities and arithmetic the method labels state, the labels against the formal proof's source at the cited commit, and every supplier section the change cites at this head. There are one small correction and two format notes, none blocking, and one scope fact for the humans who approve.

## C01 — The third Check of 1.4 presents a theorem of AnalyticNumberTheoryPartI as a hypothesis

The Check (line 1026) now opens "If the bound of AnalyticNumberTheoryPartI §0.34 holds (`(1 − β) log q ≥ c_LS` …)"; on `main` it read "AnalyticNumberTheoryPartI §0.34 (…) gives the conclusion of (b)". A reader takes the new wording to mean that the supplier only assumes the bound. AnalyticNumberTheoryPartI §0.34 (line 772, at this head and on `main`) states it as a theorem, `landau_siegel_exclusion`, with a route through §§0.34a–0.34c, and §1.4e of the same roadmap, which this pull request adds, uses it in a Check as a fact. The implication itself is true: with `(1 − β) log q ≥ c_LS` and `log q ≤ (log y)^α` the exceptional term is at most `(2/c_LS)(log y)^α·y·exp(−c_LS (log y)^{1−α})`, absorbed with `y₀` depending on `α` alone.

One repair restores the assertion and keeps the new clause "which assumes no such bound". Another keeps the conditional and says why, if the reason is the standing of the source of §0.34.

## N01 — The method label of 0.7 has no locator into [FormalProof]

The `*Sources:*` line of 0.7 (line 628) names no file of the formal proof, unlike every other section with a method label. At the commit `40e56ba` that the README cites, the argument the label describes is `UpperTheory.BernoulliSumsFrobeniusOrbits.topsGroup` in `Development/AutomorphicArithmetic/ThickFrames/topsGroup.lean` (the profile `1` on `A₀`, `3/4` elsewhere, at lines 90–96), and its single-functional step is `UpperTheory.BernoulliSumsFrobeniusOrbits.select` in `ThickFrames/select.lean`. Naming them would let a reader check the label.

## N02 — The family index and this README describe the labels of the definition sections differently

The family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, line 188) says every section that states something to prove carries two labels, the method label reading `none` where the formal proof has no such statement. Here 0.1, 0.3, 0.5, 0.6 and 0.9, which state facts with routes, carry `*Origin:*` only, as the Labels paragraph (line 122) says. Either wording is fine; one of the two could follow the other.

## Previous findings

The previous report had no findings; its remarks were one small correction and one format note.

- C01 — not repaired: line 1026, "If the bound of AnalyticNumberTheoryPartI §0.34 holds (`(1 − β) log q ≥ c_LS` for every real zero `β` …)". Carried as C01.
- N01 — not repaired: line 628, "*Sources:* (Bernoulli selection; Chebyshev and Markov inequalities)". Carried as N01, with the names now read at the cited commit.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 0.1, Origin label | `E = K = ℚ(i)` | `G = {1, c}`, `Φ = {1}`, `c ∉ Φ`, `f = 1`; Labels paragraph and Sources line both mark (iv) as the roadmap's own | agree | none |
| 0.2, Corollary of QuasiRiemannHypothesis §5.4 | `E = ℚ(i)`, `N = 4` and `N = 12` | §5.4: `f_E = 4`, `X(E) = {1, χ₋₄}`. 0.2: `ker art₁₂ = {1, 5}`; nontrivial `χ∘art₁₂` is `−1, −1` at `7, 11`, so `χ* = χ₋₄` at both levels; `(χ₋₄²)* = 1` | agree | none |
| 0.3, Origin label | `ℚ(i)`, `d = 2` | `I_2 = G`, `σ_2 = c ∉ Φ`; `HostFactsS` present in `SplitInertia.lean` at `40e56ba` | agree | none |
| 0.4, method label (`c ∉ D_d`) | `q ≡ 3 (4)`, `q ∣ d + 1`, `d ≡ 7 (16)` | `(−1/q) = −1 = (d/q)`, so `k` odd; `d² ≡ 49 ≡ 1 (16)`, `d^k ≡ 7`; class of `7` modulo `±1` is that of `9 ≠ 1` in `(ℤ/16)^×` | holds for `n ≥ 2` | none |
| 0.5, 0.6, Origin labels | `ℚ(i)`: `par_1(c)` | `c·c·1 = 1 ∈ Φ`, a bijection `G∖Φ → Φ`; `Level.cyc`, `Level.ofSub`, `Frame.placeOf` present in the cited files | agree | none |
| 0.7, method label | `c = 2`, bounds `B₁, B₂` | `F = X/(2B₁) + Y/(2B₂)`, `E F ≤ 1`; at `F ≤ 1`: `X ≤ 2B₁`, `Y ≤ 2B₂`; formal profile `1` / `3/4` (`topsGroup.lean` 90–96) | agree | N01 |
| 0.8, method label | three points of a sphere, `j(v₂ − v₁) = i(v₃ − v₁)` | `2v₁·u + ‖u‖² = 0` and `(i/j)(i/j − 1)‖u‖² = 0`, `u = v₃ − v₁`, so `i(i − j)‖u‖² = 0`; digits `≤ 2L(D − 1) < 4LD`; formal base `4 * L * d`, Mathlib base `2 * d - 1` | agree | none |
| 0.8a, method label | `|i| < L`, `|s − s′| < M/(4L)`, `ord h ≤ 4L` | both sides `< M/4`, difference `< M`: equality in `ℤ`; `|ord(h)(s − s′)| < M`, nonzero: no two points | agree | none |
| 0.8b, method label | orbit with `ord h > 4L` | reduces to 0.8a (a): at most 2 of `L` consecutive; `GlobalTheory.HTW.LongWindow.main` present | agree | none |
| 0.9, Origin label | `(3, 71)`, `(11, 7)` | `71 = 64 + 7`, `3 ∣ 72`, `5 ∤ 72`: admissible for `B < 5` only; `11 ∤ 8` | agree | none |
| 1.1, method label | formal `ASK`, `MAIN` | `ASK`: inert primes with `2 log p`, plus `log d` term, form (iv); `MAIN`: `a(log a − 1 − γ + ℓ(χ_K) − mean log w)` | agree | none |
| 1.2, Origin label and §8.6a contract | `K = ℚ` | `(x − 1)Φ_{ℚ,χ}(x) = G_χ(x) − x(L′/L)(1, χ)`; trivial character: `EK(ℚ) + 1 = γ + 1`, the constant of `G_1` | agree | none |
| 1.4, method label identity | `χ ≠ 1` and `χ = 1` | `Σ Λχ(n)(y/n − 1) = y∫_1^y ψ_χu^{−2}`, `−(L′/L)(1, χ) = ∫_1^∞ ψ_χu^{−2}`; `∫_1^∞ (ψ(u) − u)u^{−2} = −1 − γ`; both give `G = −y∫_y^∞` | agree | none |
| 1.4 (b), Corollary of AnalyticNumberTheoryPartI §1.4e | `log N ≤ (log y)^α`, zeros `≤ 1 − c_ex` | exponent `≥ (c/2)(log u)^{1−α}`, factor `(log u)^{4α}`; tail `≪ y(log y)^{5α}e^{−(c/2)(log y)^{1−α}}`; exceptional part `≤ 2y^{1−c_ex}/c_ex`; `c₁ < c/2` absolute, `y₀(α, c_ex)` | holds | none |
| 1.4, third Check | `(1 − β) log q ≥ c_LS` | term `≤ (2/c_LS)(log y)^α·y·e^{−c_LS(log y)^{1−α}}`; §0.34 is a theorem in the supplier | true; wording | C01 |
| 1.6, method label identity | `A = ℤ/2`, `A₀ = 1`, `S = {1}`, sign character | left `χ(1)·1 = −1`; right `|A₀|·χ(1) = −1`; in general `Σ_τ Σ_{α∈τA₀} χ(α) = |A₀| Σ_τ χ(τ)` | agree | none |
| 1.7, law `ν₀` | order `o` | `4/(3o+1) + 3(o − 1)/(3o+1) = 1`; `ν̂(χ) = (4 − 3)/(3o+1)`; profile `1`, `3/4`: `(1/4)/(1 + 3(o − 1)/4) = 1/(3o+1)` | agree | none |
| 1.9, precision and remark | formal `Shares`, QuadraticTwistSelectionOverPrimes §2.7d | precision `x^(−1+eps)` in the formal record; (ii′) "at its instance" is that roadmap's own wording (its lines 52–54) | agree | none |
| §1.4i contract, "(c′) … not a statement of [FormalProof]" | RieszSumsOverPrimesAndExceptionalZeros §1.4i | its Origin label: (a), (b), (c), (c′) its own; (b′) the formal proof's | agree | none |
| Headline (3), `exists_noRelation` | `(M, L) = (2, 2)`, `(8, 2)` | `T = {0}`: `1 ≥ e^{−C log 2}`; `1 ≥ 4e^{−1.2C}` for `C ≥ 1.16`; `|T| ≤ 8/8 = 1` | holds | none |
| Headline (1), `frobRieszSum_sub_main` | constant weight, `E = K` | `ℭ = w₀(G_1 − G_{χ_K})(a/w₀)`, equal to 1.1 (iii) | agree | none |

- Source locators: 22 cited files of [FormalProof] exist at commit `40e56ba`; 23 cited declarations were found in their files, and the statements behind 0.2, 0.7, 0.8, 0.8a, 1.1, 1.2, 1.8 were read. The external texts were not read (below).
- Library declarations opened at the pin: `Behrend.map`, `Behrend.sphere`, `Behrend.exists_large_sphere` in `Mathlib/Combinatorics/Additive/AP/Three/Behrend.lean` (base `2 * d - 1`, lines 173–214).
- Cross-roadmap citations resolved at this head: QuasiRiemannHypothesis §5.4; AnalyticNumberTheoryPartI §§0.34, 0.34a, 1.4e; ZerosOfLFunctions §8.6a; RieszSumsOverPrimesAndExceptionalZeros §1.4i (a)–(c′); QuadraticTwistSelectionOverPrimes §2.7d (ii′); the family index. §1.4e and §8.6a are sections this pull request adds to roadmaps on `main` that were suppliers before.
- Record: README at `74a09b7` against this head: 0 layers or items removed, 0 ids retitled, 0 headings changed; the supplier roadmaps are the same.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1469 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean`: three `sorry` warnings (lines 113, 236, 366), nothing else. `Suggested.lean` is unchanged from `main`; no padding probe was rerun.
- The pull request's text: its sentences on the family (section numbers unchanged, the two labels, `*Corollary of:*`, the §1.4i attribution) agree with this folder's change; nothing this folder changes is left out.
- Ownership: the change adds no object.

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, QuadraticTwistSelectionOverPrimes, ThetaChainsOnDefiniteUnitaryGroups, SidonSetsAndLinearEquations; nothing shared (the first three cite this roadmap's §§0.3–0.8a and define none of it; the last treats one convex equation with fixed coefficients, not the relations of 0.8 uniformly in `L`).

Source independence: changed passages only; 7 passages (the method labels of 0.2, 0.7, 0.8, 0.8a, 1.1, 1.2, 1.8) compared with 1 source, [FormalProof], which is Lean code without prose, none shared; largest share [FormalProof], 29 of about 43 locators; contents not compared (no layer added, removed or reordered). Davenport, Washington, Ihara–Murty–Shimura, Behrend and Ruzsa could not be read.

Research link: the roadmap is the analytic frame of the formal proof of the Riemann hypothesis for Dirichlet L-functions announced by Alpöge on 20 November 2026 ([Announcement], [FormalProof]); 1.9 reduces a square-root bound for the cyclic family to the Frobenius-restricted inequality, with tools adapted from Behrend (1946), Ruzsa (1993) and Davenport (2000). Rests on the README.

## Not verifiable

- Ihara, Murty and Shimura, Acta Arith. 137 (2009), §2.2, Theorem 1, (2.2.1), p. 257 (References; Origin label of 1.2): the publisher's page did not answer and no author's copy was found. The locator agrees with the one ZerosOfLFunctions §8.6a gives.
- Behrend (1946) and Ruzsa (1993) (Origin labels of 0.8, 0.8a): the publishers' pages were refused or unclassified. Behrend's base `2d − 1` was checked in Mathlib's formalisation instead.
- Davenport, *Multiplicative Number Theory*, ch. 19–20 (Origin labels of 1.2, 1.4) and Washington, *Introduction to Cyclotomic Fields*, ch. 3 and 14 (Origin label of 0.2): books with no legal open copy.
- The sentence of the Corollaries paragraph that the proof needs only the cases on the `*Corollary of:*` lines: it concerns the formal proof as a whole.

## Source issues

- none

## For the human reviewers

- Scope: the principal source is [FormalProof], a Lean proof announced on 20 November 2026 ([Announcement]) with no refereed publication. The Origin labels mark 0.4, 0.8b, 1.1, 1.7, 1.8 and 1.9 as particular to it.
- Not tested: the wording of the Origin labels against Davenport, Washington, Ihara–Murty–Shimura, Behrend and Ruzsa, none of which could be read legally here.
