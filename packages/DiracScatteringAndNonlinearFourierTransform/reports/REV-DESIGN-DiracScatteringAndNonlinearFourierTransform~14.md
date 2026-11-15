<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16338#issuecomment-6902230110 -->
Review (claude) of f0a52fa

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §8.8: the route does not say how the common height is reached on a growing box

   Location: `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md` line 2134–2137 (and target
   8.8 of `design/plan.json`): "inserting the two approximants into the determinant identity (2.2) on
   `ℝ ∩ Q(s, D/t)` forces equal imaginary parts, so that the height of the approximant of `Ẽ` moves to `p(t)`".

   Claim: the `o(1)` approximations of §8.7(1) and (2.2) on `ℝ` give the common height on `Q(s, C(t)/t)`.

   Witness. `D` is not defined in §8.8. Moving a height from `p̃` to `p` changes the approximant by about
   `e^{C − 2 min(p, p̃)}` at the bottom of the box, and (2.2) with `o(1)` errors on `ℝ` bounds only `e^{−2p̃} = o(1)`.
   Instance: `E` zero-free, `Ẽ` with a zero at height `p̃ = √C`: `e^{C − 2√C} → ∞`.

   The statement is true: with the two-term forms `a e^{−itz} + b e^{itz}`, `ã e^{−itz} + b̃ e^{itz}` of §8.7's
   route, the `e^{∓2itx}` coefficient of `Im(E conj Ẽ) = 1` on `ℝ` gives
   `|a conj b̃ − conj(b) ã| = O(|a||ã| e^{C}(η_C + η̃_C))` (computed on one instance: `0.114138` both sides before
   the factor ½), so `e^{C}|b̃/ã − conj(b)/conj(a)| = O(e^{2C}(η_C + η̃_C)) → 0`, which is the property §8.7(1)
   already asks of `C(t)`. On the instance, `|b|/|a| < e^{1−2C}` then gives `e^{C}|b̃|/|ã| ≤ e^{1−C} + o(1)`, so
   such a zero of `Ẽ` does not occur.

   Repair. Replace the route sentence by: "Route: the two-term forms of §8.7's route for `E` and `Ẽ`, on the
   common box `Q(s, C(t)/t)` with `e^{2C}(η_C + η̃_C) → 0`, and, for `t ∈ T₀(s, C)`, the chosen zero `z(t)`. On
   `ℝ ∩ Q(s, C(t)/t)` the determinant identity (2.2) reads `Im(E conj Ẽ) = 1`; its oscillating part gives
   `|a conj b̃ − conj(b) ã| = O(|a||ã| e^{C}(η_C + η̃_C))`, so the two forms have the same ratio `|b|/|a|` up to
   `o(e^{−C})`, that is, the same height up to an error that is `o(1)` on the box; its constant part and
   `|ã|²w̃ = 1 + o(1)` give the common `α` and the cosine relation."

2. **F02** (P3) §9.3: three steps of the route are left implicit

   Location: `design/README.md` line 2260 and 2270–2277 (and target 9.3 of `design/plan.json`): "with `K(t)` the
   function `C(t)` of §8.8 at `s`" and "§8.8 at `t₁` and `t₂`, with §8.9 applied at each `p ∈ J(s)` …, puts the
   data at `p` in the form of §9.2".

   Claim: the data at the two times have the form of §9.2, uniformly over `s ∈ Sₙ`.

   Witness. (a) §9.2 asks one `Φ` for `k = 1, 2`; §8.8 gives only `cos(t(ũ − u)) = √(w w̃)`, so `t(ũ − u)` is `Φ`
   or `−Φ` modulo `2π` at each time. (b) The `o(1)` of §8.8 is for each `s`, while the bound
   `∫_{J(s)} log|a| ≥ c|J(s)|` is used for all `s ∈ Sₙ` at one `n`. (c) §8.8 asserts that a function exists, not
   which.

   Each is closed by one sentence; the statement stands. For (a): on `ℝ` the two candidates give
   `Ẽ/E = √(w/w̃)(cos Φ cot θ ± sin Φ)`, whose mean over a period in `x` has real part `±√(w/w̃) sin Φ` (computed for
   `w = 0.7`, `w̃ = 0.9`, height `1.5`: `±0.536449`), and `Ẽ(t, x)/E(t, x)` is continuous in `t`.

   Repair. (a) Add to the route: "The sign of `t(ũ(t) − u(t))` modulo `2π` is constant on `Iₙ(s)` for large `n`:
   on `ℝ` the mean of `Ẽ(t, x)/E(t, x)` over a period in `x` is within `o(1)` of
   `−i w(s) ± √(w/w̃) sin Φ`, and it is continuous in `t` (§3.1); so one `Φ` serves `t₁` and `t₂`." (b) Add: "The
   bound on `|Zₙ|` is proved for `Zₙ ∩ G_N`, `n ≥ N`, where `G_N` is the set of `s` at which the errors of §8.8
   are below the `ε₀` of §8.9 for all `t ≥ 2^N`; the sets `G_N` increase to a set of full measure, and
   Borel–Cantelli is applied for each `N`." (c) Replace "the function `C(t)` of §8.8 at `s`" by "a function
   `C(t)` as in §8.8 at `s`".

3. **F03** (P3) §8.7: the points `x₀`, `x₁`, `x₂` need a box wider than `C ≥ 3` gives

   Location: `design/README.md` line 2061 and 2073–2075: "let `C ≥ 3`" and "On such a box `(A(t, x), C(t, x))` …
   rotates on `ℝ ∩ Q(s, C/t)`; choosing `x₀`, `x₁` there with `C(t, x₀) = 0 < A(t, x₀)` …".

   Claim: a zero-free box of half-width `C ≥ 3` contains `x₀`, `x₁` and `x₂ = x₁ − π/(2t)`.

   Witness. `C(t, x₀) = 0 < A(t, x₀)` happens once per period `2π/t` of the rotation, and `ℝ ∩ Q(s, 3/t)` has
   length `6/t < 2π/t = 6.283/t`. The only use, the route of (3), has `K ≥ 4π + 24π/ε`, so nothing fails there.

   Repair. In line 2073–2074 write "On such a box with `C ≥ 4π`, `(A(t, x), C(t, x))` has modulus in
   `[1/(2√w), 2/√w]` and makes more than a full turn on `ℝ ∩ Q(s, C/t)`; choosing …". Tested: `8π/t > 2π/t + π/(2t)`.

Both findings of round 13 are repaired, and the repaired statements (§8.6, §8.7(1), §8.8, §9.3) were
recomputed and hold. Three findings (P3) remain, all on route sentences of §8.7, §8.8 and §9.3, each with a repair below, so the
verdict asks for changes; none is blocking, and no statement, hypothesis, id or supplier changes. The dependency check shows no
UPWARD or CYCLE line. Declared supplier gaps: none. Elaboration: not available (this lane does not elaborate);
the design stage has no `Suggested.lean`, so the one-tactic probe and the `#check` comparison do not apply.

## Verified sound

**Repair of round 13, finding by finding.**

- **F01 (P2), one box function in §8.7(1) and §8.8 — repaired** (differently from the suggestion, and
  correctly). Line 2079–2086: "Take `C(t) → ∞` no larger than the function of §8.6 and with
  `e^{2C(t)}η_{C(t)}(t) → 0` … For `t ∉ T₀(s, C)` the two-term form gives `E(t, ·)` within `o(1)` of
  `(a/|a|) e^{−itz}/√w(s)` on all of `Q(s, C/t)`". I rederived every step: `det M = w·D(t, ω₂, ω₁) = 1 + O(η)`;
  `a = ((m₁₁ + m₂₂) + i(m₁₂ − m₂₁))/(2√w)`, `b = ((m₁₁ − m₂₂) − i(m₁₂ + m₂₁))/(2√w)`, so
  `|a|² − |b|² = det M/w`; the Rouché margin `2 sin(½)|a|e^{−P}` against the error `O(√w|a|e^{C}η)` needs only
  `e^{2C}η` small, `|a|` cancelling; a zero-free box gives `|b|/|a| < e^{1−2C}`. The three properties asked of
  `C(t)` pass to every smaller function tending to infinity (`η_{C′} ≤ η_C`, `T₀(s, C′) ⊆ T₀(s, C)`), and the
  route runs directly for the smaller function, whose `T₁` is larger. The instance of round 13 (only zero at
  `s + (C₁ + 1)/t − ip/t`) has `t ∉ T₀(s, C₁)` and is covered by the zero-free case.
- **F02 (P2), §9.3 for every zero — repaired.** Line 2260–2262: "if `ℓₙ(s)` is the supremum of the lengths of
  the intervals `I ⊆ [2ⁿ, 2ⁿ⁺¹] ∩ T₁(s, K) ∩ T̃₁(s, K)` such that `E(t, ·)` has a zero in `Q(s, C/t)` at every
  `t ∈ I`"; line 2267–2270 gives `1 < tp ≤ C` and `Q(p, 3C/t) ⊆ Q(s, K/t)`. The instance (`s − 0.3i/t`) is now
  outside the statement and is the fourth Check. The sentence close to the source is rewritten.
- **Repaired patterns elsewhere.** "Any zero, uniformly" appears consistently in §8.6, §8.7(1), §8.8 and is
  used in §9.3. §8.7(2), (3), §9.5, §9.6 do not depend on the box function of (1). The route gaps that remain
  in the consumers of the repair are R01–R03.

**Principles.** No route-specific shortcut; nothing re-planned (three suppliers, cited by section); one
direction of supply; own words; no algorithm; no `Suggested.lean`, so no sorry'd data and no `set_option`.
`grep` over the README for LaTeX delimiters, pull-request numbers, round labels, machine paths, "deferred",
"optional", "removed": none (the word "lemma" occurs only in prose names such as "Fatou's lemma").

**Gate** (run this round):

```
candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2258 edges, 0 problem(s)
```

**Supplier citations resolved this round.** AnalyticNumberTheoryPartI §0.23 (main, README line 644, "Finite-order
Hadamard factorization"; merge order line 50). OperatorTheory/UnboundedOperators §4.8 (main, README line 836,
"(UO-D07)"). AutomorphicSpectralTheory §0.5 (open head, a new roadmap folder, "### 0.5 Herglotz representation",
line 182; merge order line 98). None is on the never-cite list. `scratch/citations.md`: nothing unresolved.

**Pinned declarations opened.** `TauCeti.rouche_exists_eq_zero_iff`
(`TauCeti/Analysis/Complex/Conformal/Rouche.lean` line 359): `0 < R`, `AnalyticOnNhd ℂ` on `closedBall c R` for
`f` and `g`, `‖f z − g z‖ < ‖f z‖` on `sphere c R`; conclusion: a zero of `f` in `ball c R` iff one of `g`. The
README's bullet (line 402–406) says exactly this, and §8.7 applies it with `f = T`, `g = E(t, ·)`, both entire.
The other 94 pinned names were paired with file and line in round 13 and are untouched by the repair.

**Sources, the seeded sample** (each locator read at its line; the author flags none as unverified).

- §1.2, §1.3, §1.4: romanov2014 line 212–224 (fundamental solution, `det ≡ 1` at line 218–219, entire with
  values in `C[0, x]` at line 220–222, chain rule at line 223–224): as cited. The other locators are waived.
- §1.7: coddingtonlevinson1955 only (waived); the statement was recomputed (round 13's row, relied on).
- §2.7: poltoratski2024 line 236–249, (2.3)–(2.4); mauth2022 Lemma 10 line 472–473: as cited.
- §2.8: mauth2022 line 454–465 (definition, Lemma 8); poltoratski2024 line 685–687 and mauth2022 line 945, 1137
  (the multiplier step used without proof): as cited.
- §3.2: poltoratski2024 line 186–190, (2.1)–(2.2) line 204–208, line 273–275, (2.5) line 293, (2.6)–(2.7) line
  295–306; mauth2022 line 182–183, Corollary 2 line 596, Lemma 15 line 612, Lemma 17 line 646: as cited.
- §4.3: poltoratski2024 line 503–507; taothiele2012 Lemma 3 line 296 (discrete model): as cited.
- §5.2: poltoratski2024 line 550–560; mauth2022 line 190: as cited.
- §7.2: poltoratski2024 Lemma 1 line 332–360 (radius `3|y − x|/ε`); mauth2022 Lemma 29 line 1624 (radius
  `4|y − x|/ε`, small `ε`): as cited; the README's `3` is the first source's.
- §8.4: poltoratski2024 Lemma 4 (6.6) line 756–792; mauth2022 Lemma 22 line 1129: as cited.
- §8.8: poltoratski2024 Lemma 7 line 1028–1040, (8.1); mauth2022 Lemma 43 line 3140–3143 (stated on
  `T₁ ∩ T̃₁`, as the README): as cited.
- §9.1: poltoratski2024 line 1183–1210 and 1228–1232: as cited.
- §9.2: poltoratski2024 line 1341–1347 read; line 1253–1340 is garbled by OCR (see Not verifiable).
- §9.4: poltoratski2024 line 97–101, 1173–1176; mauth2022 line 1893–1894: as cited.
- Changed text: §8.7 against poltoratski2024 Corollary 3 line 1002–1008; §9.3 against Lemma 9 line 1350–1352.

**Adversarial table** (values computed this round, by hand or in plain Python).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.3 | `A = [[0,1],[0,0]]` then `B = [[0,0],[1,0]]`; scalar `p` | `e^B e^A = [[1,1],[1,2]]`, `e^A e^B = [[2,1],[1,1]]`; `∂_s e^{∫_s^t p} = −p(s)e^{∫_s^t p}` | holds | none |
| §1.4 | `A = [[1,1],[0,1]]`; `n = 0` | `det e^{tA} = e^{2t} = e^{t tr A}`; empty determinant `1 = e⁰` | holds | none |
| §2.8 | `h = log\|x + i\|`; `F = (z+i)^{−2}`; `G = e^{−iz}` | `P[h](i) = log 2`, `O_h(i) = −i·2i = 2`; `‖FG‖² = π = ∫dx/(1+x²)`; `πe^{2y}/(y+1)` unbounded | holds | none |
| §3.2 | free case; `q = ic`, `z = 0`; kernel identity at `z = w = iy` | `i − (−i) = 2i`; `E′ = c sinh ct + ic cosh ct = ic·E#`; both sides `sinh(2ty)/(2y)` | holds | none |
| §4.3 | `X` real constant at `z = 0`; lower half-plane | `cosh² − sinh² = 1`; `237 < 2385` (round 13) | holds | none |
| §5.2 | `q = c 1_{[0,T]}` at `x = 0` | `κ = i\|c\|`, `\|q⌃*\|² = tanh²(\|c\|T)`; `tanh 1 = 0.7616` | holds | none |
| §7.2 | `b_{10i}`, `ε = 1/2` | `0.2/0.16 = 1.25`, `0.2/0.1 = 2`, radius `60 > 10` | holds | none |
| §8.4 | Chebyshev step | `\|{MF > λ}\| ≤ o(t)/λ² < 1/t` for `λ = o(t)` | holds | none |
| §8.6 | `D(t, conj z₀, z₀)` at a zero `z₀` | `2i\|β\|² = i sinh(2ty)/w + O(η)`; `sinh 2 = 3.6269` | uniform in the zero | none |
| §8.7 two-term form | general `M`; `M = diag(2, ½)`, `w = 1` | `\|a\|² − \|b\|² = (4m₁₁m₂₂ − 4m₁₂m₂₁)/(4w)`; `1.25² − 0.75² = 1` | holds | none |
| §8.7 Rouché step | circle `\|τ\| = ½`; eccentric Check | `min\|sin τ\| = 0.479426`; `min\|E\| = 0.928404 = 2 sin(½)·1.25·e^{−0.255413}`; `\|E(ζ)\| = 1.2·10⁻¹⁶` | holds | none |
| §8.7 zero-free box | `C = 3, 5` | `σ₂/σ₁ ≥ 0.986614`, `0.999753`; sup over the box of the sine form minus the exponential: `1.2341·10⁻⁴ = e^{−9}`, `3.0590·10⁻⁷ = e^{−15}` | holds | none |
| §8.7(1), smaller function | `C′ ≤ C` | `η_{C′} ≤ η_C`, `e^{2C′} ≤ e^{2C}`, `T₀(s, C′) ⊆ T₀(s, C)`, `T₁(s, C′) ⊇ T₁(s, C)`; route rerun on `C′` | holds | none |
| §8.7(2) | height bounded along a subsequence | approximant `≥ γ(Y)·0.4794/√w` on a circle in the box, so Rouché gives a zero: `ty → ∞` | holds | none |
| §8.7 route, `x₀, x₁, x₂` | `C = 3` | `6/t < 2π/t = 6.283/t` | box too narrow at `C = 3` | R03 |
| §8.8 | `E` zero-free, `Ẽ` zero at height `√C`; random two-term pair | `e^{C − 2√C} → ∞`; oscillating coefficient `0.114138 = \|a conj b̃ − conj(b)ã\|/2` | true; route incomplete | R01 |
| §8.8 determinant | `ũ = u`, `w w̃ = 0.63` | `2/√0.63 = 2.5198` | as stated | none |
| §9.1 | `t₁ = 0`; `t₁ = t₂` | `(iE − Ẽ)/(2i) = (E + iẼ)/2`; `(EẼ# − ẼE#)/(2i) = 1`, `b = 0` | holds | none |
| §9.2 | sign of `Φ`, `w = 0.7`, `w̃ = 0.9`, height `1.5` | mean of `Ẽ/E`: `±0.536449 − 0.7i`; the two forms differ by `2 sin Φ √(w/w̃) = 1.0729` times `E` | one `Φ` needed | R02 |
| §9.3 | zero at `s − 0.3i/t`; `C ≤ 1`; sweep; last Check | excluded (`ty = 0.3`); height `≤ 1/t`, so no interval; `(2ⁿ/(3m))(C/2ⁿ) = C/(3m)`; `0.00037870` at shift `0.1` | holds | R02 (route) |
| §9.4 | compact support; `Ω`-conjugation | zeros fixed, `t > max(T₀, C/δ)`; `E_{−f} = iẼ_f` (round 13: `0.718187 − 0.748023i`) | holds | none |
| §9.5, §9.6 (headline) | free case; quotient | `α = i`, `β = −i`; denominator `1/w + 1/w̃ + 2 > 0`; rows of round 13 relied on | hold | none |
| §4.4, §5.4, §6.8, §6.6, §1.6 (headlines) | rows of rounds 12–13, which carry values | relied on (`π/2`; `−2π log 2 − π‖q‖²`; `z/(z − t)`) | hold | none |

**Duplication audit.** `roadmaps grep` over main and the open heads, by object: "Hermite–Biehler", "non-linear
Fourier", "Paley–Wiener space", "resonance-free", "Fatou's theorem": no match. "de Branges": SpecialFunctionsGamma
§6.4, the de Branges–Wilson integral, another object. "outer function": ConvexLifting and
DiophantineApproximationAndTranscendencePartII, another sense. "Weyl function": AutomorphicSpectralTheory and
FunctionFieldArithmetic, unrelated uses. Rouché's theorem is consumed from Tau Ceti, not restated.
`scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped or defined only by an
open revision, no second copy. The board packages index (AnalyticNumberTheory, LawrenceVenkateshMethod) has no
related package. This roadmap is the owner of the half-plane Hardy and Paley–Wiener theory and of the Dirac
scattering objects because no roadmap on main or open states them.

Overlap check: read PDE, StochasticCalculus, OptimalTransport (main), MathematicalStatisticsAsymptotic, AutomorphicSpectralTheory, RelativisticQuantumFieldTheory, AnalyticNumberTheoryPartIII (open) and OperatorTheory/UnboundedOperators (main); Weyl's alternative for `Ju′ + Vu`: owner OperatorTheory/UnboundedOperators §4.8, cited; the subtracted-kernel Herglotz representation: owner AutomorphicSpectralTheory §0.5, cited; nothing else shared.

**Shape.** 55 numbered sections, 55 `**Checks.**` blocks, 55 `*Needs:*` lines, nine `### Examples`, nine
`### Dependencies`. `design/plan.json` has nine layers, 55 targets, `gaps: []`, three suppliers; a script found
every target's statement in the README (all 60-character windows, whitespace apart), including 8.6, 8.7, 8.8 and
9.3; 8.7 carries `tauceti:TauCeti.rouche_exists_eq_zero_iff`. Layers are named by their mathematics; no
sentence says the roadmap follows a source. `sources.toml`: 13 entries, unchanged; every work in References has
one.

**Headline theorems for the package stage:** pointwise convergence at resonance-free points (§9.6) with §9.5;
the non-linear Plancherel identities (§4.4, §5.4); the Szegő condition (§6.8); the isometric embedding and
uniqueness of the spectral measure (§6.6); the linear Carathéodory theorem with holomorphic dependence (§1.2,
§1.6); the outer-multiplier theorem (§2.8).

**Copyright, licences and scope.** Wording: 15 passages set beside the sources (the sampled locators above,
§8.7 against poltoratski2024 line 1002–1008, §9.3 against line 1350–1352, §8.8 against line 1028–1040 and
mauth2022 line 3140–3143). No run of more than six words is shared; the rewritten §9.3 shares only the formula
`[2ⁿ, 2ⁿ⁺¹]` and the phrase "a zero of `E`". Arrangement: poltoratski2024 §1–§9 (contents at line 102–125)
against Layers 1–9: Layers 1–2 ↔ none; Layer 3 ↔ §1 and part of §2; Layers 4–5 ↔ §5, placed before Layer 6 ↔
the rest of §2; Layer 7 ↔ §3–§4; Layer 8 ↔ §6–§8; Layer 9 ↔ part of §9. Not one to one, and the order of
Layers 7–9 is forced (Layer 8 depends on Layer 7, Layer 9 on Layer 8). Reuse: no table, figure or list is taken
over.

Source independence: 15 passages compared with 4 sources, none shared; largest share poltoratski2024, 57 of 151 citations in the layers; contents compared with poltoratski2024: independent.

## Not verifiable

- garnett2007 (paywalled, `uncertified`) and coddingtonlevinson1955, debranges1968, remling2018, krein1955
  (waived): cited by locator only. §1.7 of the sample has no other locator; its statement was recomputed in
  round 13.
- poltoratski2024 line 1253–1340: the displays are garbled by OCR; (9.2) and (9.4) are checked through the
  identities of §9.2 (round 13's computed row), not by reading them.
- The published version of poltoratski2024 (Ann. of Math. 199): not read; locators are to arXiv version 14.
- Layers 5.3–7.3 were not reread line by line this round; no repair touched them, and the rows of rounds 12–13
  for them carry computed values.
- Elaboration: not available (this lane does not elaborate; no `Suggested.lean` at the design stage).

## Source issues

- **Gap** in poltoratski2024 at Corollary 3, part 1), printed p. 26 (line 931–934, 966–970): the source says the two-term form has modulus bounded below and gives the exponential on some smaller box; it should bound the form through the absence of zeros (Rouché); affects the proof.
- **Gap** in poltoratski2024 at Lemma 9, printed p. 35 (line 1350–1359): the source says the bound holds for any zero in the box; it should restrict to zeros below height `−1/t`, as formula (9.2) rests on Lemma 8; affects a stated result.
- **Gap** in poltoratski2024 at Lemma 7, (8.1), printed p. 27 (line 1038–1040): the source says only the cosine of the phase difference is fixed; it should also fix its sign across times, which the subinterval formulas of §9 use; affects the proof.
- **Gap** in mauth2022 at Corollary 6, printed p. 29 (line 1369–1375, 1397–1403): the source says the same modulus bound as the corollary it follows; it should derive it from a zero-free box likewise; affects the proof.

## For the human reviewers

- **Scope.** The headline §9.6 is conditional on the set `R(f)` (README line 114–118). For compactly supported and for integrable `f` its conclusion is already §5.2; no source read here shows `R(f)` non-null for another `f`.
- **Scope.** README line 121–123 states that §9 of arXiv version 14 of poltoratski2024 cannot exclude a resonance. That is this project's computation (§9.4, fourth Check), not a published statement.
- **Scope.** The route of §8.7(1) (Rouché on the two-term form, line 2060–2073) is this project's argument; poltoratski2024 line 931–934 and mauth2022 line 1369–1375 argue differently, with a step the roadmap's last Check of §8.7 refutes.
- **Scope.** OperatorTheory/UnboundedOperators §4.8 (main, README line 836) asks for an "analogous" endpoint classification for `Ju′ + Vu` without writing the alternative out; §6.4 here relies on it as spelled out in the contracts.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f0a52faaf286a20d9e8dc611b38296113f38a76a", "job": "REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~14", "model": "fable", "worker": "chris-x89"} -->
