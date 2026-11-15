<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16338#issuecomment-6901644080 -->
Review (claude) of 82d58ef

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §8.7(1) and §8.8 claim one box function where the route gives two

   Location: `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md` line 2040–2044 and
   2055–2057 (§8.7), line 2088–2094 (§8.8), and the mirrored targets 8.7 and 8.8 of `design/plan.json`: "the
   same function `C(t)` gives the approximation of `Ẽ(t, ·)` … diagonal arguments over constant box sizes …
   which can be run for the two at once".

   Claim: one function `C(t)` serves both as the box on which the times are tested (`t ∈ T₁(s, C)`) and as the
   box on which `E` and `Ẽ` are approximated, and it can be taken common to `E` and `Ẽ`.

   Witness. The route has two regimes. For `t ∈ T₀(s, C)` §8.6 gives the approximation on `Q(s, C/t)`. For
   `t ∉ T₀(s, C)` it gives the exponential only on a smaller box (poltoratski2024 line 966–970: "on some
   `Q(s, C₁/t)`"), because the error is `O(δ(t) e^{L})` on `Q(s, L/t)`. Instance: `E(t, ·)` has, near `s`, only
   the zero `s + (C₁(t) + 1)/t − ip/t` with `tp → 0`. Then `t ∈ T₁(s, C₁)` (the `C₁`-box is zero-free), and on it
   §8.6 gives only `o(γ(tp))` with `γ(tp) ~ (tp)^{−1/2} → ∞`; with the larger `C` the same `t` is not in
   `T₁(s, C)`. So the statement holds with the pair `(C₁, C)` and is not reached with either function alone. The
   cited lines 832–833, 879, 907–909 are the diagonal arguments of Corollary 1 and Lemma 6 only; both are
   monotone (they hold for every smaller function), the non-resonant step is not. The source states the
   one-function form (Corollary 3(1), line 1002–1007; mauth2022 line 1397–1403) with the same step missing.

   Repair (README and the mirrored entries of plan.json; no supplier changes, no ids change).

   1. §8.7(1) → "(1) for almost every `s` there are functions `L(t) ≤ K(t)`, both tending to infinity, such that
      for `t ∈ T₁(s, K)` there are `z(t) = x(t) − iy(t) ∈ ℂ₋` and unimodular `α(s, t)` with
      `sup_{z ∈ Q(s, L(t)/t)} |E(t, z) − α(s, t) γ(t y(t)) sin(t(z − z(t)))/√w(s)| → 0` as `t → ∞` in `T₁(s, K)`,
      where `z(t)` is a zero of `E(t, ·)` in `Q(s, K(t)/t)` when `t ∈ T₀(s, K)`; the same pair `(L, K)` gives
      the approximation of `Ẽ(t, ·)` of this form, with `w̃(s)`, `T̃₀(s, K)` and `T̃₁(s, K)`".
   2. §8.7(2) → "if the approximation of `E` in (1) holds at `s` for a pair `(L, K)` and `t ∉ T₀(s, K)` for all
      large `t`, then for every `D > 0` …" (conclusion unchanged).
   3. §8.7 route: replace the sentence "one function serves `E` and `Ẽ` because … at once" by: "The times are
      tested on the larger box. For `t ∈ T₀(s, K) ∩ T₁(s, K)`, §8.6, whose estimate holds for every zero in the box
      and for every smaller box function, gives the approximation on `Q(s, K/t)`. For `t ∉ T₀(s, K)`, §7.2 with
      `ε(t) = 24π/(K(t) − 4π) → 0` makes the parameters of the two-term form `δ(t)`-close with `δ(t) → 0`; the
      exponential is within `O(δ(t) e^{L}) + o(1)` of `E` on `Q(s, L/t)`, and `L(t) → ∞` is chosen with
      `δ(t) e^{L(t)} → 0`. §8.5 and §8.6 hold for every smaller function tending to infinity, so the minimum of the
      two functions `K` serves `E` and `Ẽ`, and then the minimum of the two functions `L`."
   4. §8.7, add the Check: "One function does not suffice in the route: a time `t` whose only zero near `s` is
      `s + (L(t) + K(t))/(2t) − ip/t` with `tp → 0` lies in `T₁(s, L)`, yet §8.6 approximates `E` on `Q(s, L/t)`
      only within `o(γ(tp))`, and `γ(tp) ~ (tp)^{−1/2}`; this `t` is not in `T₁(s, K)`, so (1) claims nothing."
   5. §8.8 → "… there are `L(t) ≤ K(t)`, both tending to infinity, such that for every
      `t ∈ T₁(s, K) ∩ T̃₁(s, K)` …", both suprema over `Q(s, L(t)/t)`, "`p(t) > K(t)/t` for `t ∉ T₀(s, K)`,
      `p(t) ≤ K(t)/t` for `t ∈ T₀(s, K)`"; route: "§8.7(1) for `E` and `Ẽ`, with their common pair `(L, K)`".

   Tested on the instance: with the pair, the zero at horizontal distance `(L + K)/2` lies in `Q(s, K/t)` above
   the height `−1/t`, so `t ∉ T₁(s, K)` and nothing is claimed; for `t ∉ T₀(s, K)` the route's contradiction is
   reached inside `Q(s, K/t)` since `4π + 24π/ε(t) = K(t)`. Free case: no zeros, every pair works, `α = i`.
   §8.7(3), §9.5 and §9.6 do not use (1) and need no change.

2. **F02** (P2) §9.3 is stated for every zero in the box; its route covers only times of §8.8

   Location: `design/README.md` line 2217–2229 (and plan.json target 9.3): "if `Iₙ(s)` is the longest
   subinterval of `[2ⁿ, 2ⁿ⁺¹]` such that `Q(s, C/t)` contains a zero of `E(t, ·)` for every `t ∈ Iₙ(s)`, then
   `|Iₙ(s)|/2ⁿ → 0`".

   Claim: the bound holds whatever the height of the zero.

   Witness. The route puts the data at `t₁, t₂ ∈ Iₙ(s)` in the form of §9.2 by §8.8 and §8.9. §8.8 speaks only of
   `t ∈ T₁ ∩ T̃₁`, and §8.9 assumes `1 < ty < 2C`. Instance: a zero at `s − 0.3i/t` for all `t ∈ [2ⁿ, 2ⁿ⁺¹]` gives
   `Iₙ(s) = [2ⁿ, 2ⁿ⁺¹]`, while no such `t` is in `T₁`, and `ty = 0.3`. The source's Lemma 9 (poltoratski2024 line
   1350–1352) has the same statement and uses (9.2), which rests on its Lemma 8 (`1 < ty`, line 1127); its own
   main argument restricts the height (line 1177–1179). The sentence also follows the source's clause by clause
   (about eleven consecutive words, formulas apart).

   Repair. Statement → "Prove that for almost every `s` and every `C > 0`, with `K` the function of §8.8 at `s`:
   if `Iₙ(s)` is the longest interval contained in `[2ⁿ, 2ⁿ⁺¹] ∩ T₁(s, K) ∩ T̃₁(s, K)` at each time `t` of which
   `E(t, ·)` has a zero in `Q(s, C/t)`, then `|Iₙ(s)|/2ⁿ → 0`". Locator → "poltoratski2024 Lemma 9 line 1350–1377,
   stated there without the restriction to `T₁`, which its proof needs through Lemma 8". Route, add: "for
   `t ∈ Iₙ(s)` the zero in `Q(s, C/t)` lies below the height `−1/t`, so `1 < ty ≤ C`, the range of §8.9, and `t` is
   a time of §8.8". Add the Check: "A zero at `s − 0.3i/t` for all `t ∈ [2ⁿ, 2ⁿ⁺¹]` is outside the statement: no
   such `t` is in `T₁(s, K)`, and §8.9 needs `1 < ty`."

   Tested on the instance: the restricted `Iₙ(s)` is empty, so nothing is claimed; in the compact-support Check
   the zeros are fixed and `Iₙ(s) = ∅` for large `n` as before. §9.3 has no consumer inside the roadmap, so no
   other target changes.

Two findings, both P2, both in Layers 8–9 and both off the headline chain: R01 is in the clause the last
repair added to §8.7(1), R02 in §9.3, which consumes it through §8.8. The three findings of round 12 are
repaired. The headline §9.6 and its only input §9.5 ← §8.7(3) ← §8.5, §7.2 were recomputed and stand. The
dependency check shows no UPWARD or CYCLE line. Declared supplier gaps: none. Elaboration: not available
(this lane does not elaborate); the design stage has no `Suggested.lean`, so the one-tactic probe and the
`#check` comparison do not apply.

## Verified sound

**Repair of round 12, finding by finding.**

- **F01 (P2), §9.5 takes from §8.7 a function it does not provide — repaired.** Line 2046–2048: "(3) for
  almost every `s`: if `T₀(s, K)` is bounded for every `K > 0`, then for every `D > 0` there are unimodular
  `α(s, t)` with …"; line 2301–2303: "`N_f` is the union of the exceptional null sets of §8.7(3) for `f` and
  for `−f` and of `{w w̃ = 0}` … so §8.7(3) gives the approximation of `E`". Recomputed (table). The clause the
  repair added to (1) beyond the review's text is R01.
- **F02 (P3), statements about sources — repaired.** Line 118–121: "An error in the proof of Lemma 11 of an
  earlier arXiv version … Version 14 has no Lemma 11"; line 123–126: "poses as a question (Q2R, line 211–212)
  whether … the quotient `b/a#` … converges". The manifest's `version_note` and `cited_for` agree.
- **F03 (P3), §9.4 compact support — repaired.** Line 2261–2263: "the finitely many in the compact box
  `Q(s, C/T₀)`, which contains `Q(s, C/t)` for `t ≥ T₀`, lie at a distance at least some `δ > 0` from `ℝ`".
- **Repaired patterns elsewhere.** Layer 8 Examples (line 2156–2160) now cites §8.7(3) with the compact box;
  §9.5 no longer uses the function of §9.4's first bullet. The one-function pattern remains in §8.7(1), §8.8
  (R01) and in the use §9.3 makes of them (R02).

**Principles.** No route-specific shortcut; nothing re-planned (three suppliers, by section); one direction of
supply; own words (one close sentence, in R02); no algorithm; no `Suggested.lean`. `grep` for LaTeX delimiters,
pull-request numbers, round labels, machine paths, "deferred", "optional": none.

**Gate** (run this round):

```
candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 241 roadmaps, 2249 edges, 0 problem(s)
```

**Supplier citations resolved this round.** AnalyticNumberTheoryPartI §0.23 (main, README line 644, "Finite-order
Hadamard factorization", `n = floor ρ`, `Σ|α|^(−n−1) < ∞`). OperatorTheory/UnboundedOperators §4.8 (main, line
836; `Ju′+V(r)u` with `J=[[0,−1],[1,0]]` at line 861–863). AutomorphicSpectralTheory §0.5 (open head, a new
roadmap folder, line 98 of the merge order; "### 0.5 Herglotz representation", line 182–184, unique triple with
`a = Re F(i)`). PDE and StochasticCalculus are on main. None is on the never-cite list. `scratch/citations.md`:
nothing unresolved.

**Pinned declarations.** A script paired every backticked name of the supplier contracts with its cited file and
line and looked for the name within three lines: 93 of 94, the last a pairing artefact (`ENNReal.ofReal` beside
the two `Circle` lines). By hand: `InformationTheory.klDiv_of_not_ac` and `klDiv_self`
(`InformationTheory/KullbackLeibler/Basic.lean` line 66, 74), `Matrix.Norms.L2Operator`
(`Analysis/CStarAlgebra/Matrix.lean` line 183), `UpperHalfPlane.upperHalfPlaneSet`
(`Analysis/Complex/UpperHalfPlane/Basic.lean` line 253), Tau Ceti `bijOn_sub_I_div_add_I_upperHalfPlaneSet`
and `boundaryCayley` (`Analysis/Complex/UpperHalfPlane/Cayley.lean` line 171, 316).

**Sources, the seeded sample** (each locator read at its line; the author flags none as unverified).

- §1.2: romanov2014 line 212–224 (fundamental solution, `det ≡ 1`, entire, chain rule): as cited.
- §2.3: poltoratski2024 line 615–622 (sector with `Im z < 1`, maximal function); mauth2022 line 411–420,
  Lemma 5 and Corollary 1 line 421–427, Lemma 6 line 430: as cited.
- §2.4: mauth2022 Lemma 4 line 404, Lemma 7 line 434: as cited.
- §2.7: poltoratski2024 line 236–249, (2.3)–(2.4); mauth2022 Lemma 10 line 472–484 (for `PW₁`): as cited.
- §3.3: poltoratski2024 line 175–180; mauth2022 line 491–493, Lemma 13 line 531; romanov2014 Proposition 4
  line 780: as cited.
- §5.1: relied on round 12's reading (denisov2006 line 3246–3255, 4219–4258; poltoratski2024 line 518–529);
  the bounds recomputed below.
- §7.1: poltoratski2024 line 307–331, representation line 312–321, proof of Lemma 1 line 337–346; mauth2022
  line 446–453: as cited.
- §7.2: poltoratski2024 Lemma 1 line 332–360 (radius `3|y − x|/ε`): as cited. mauth2022 Lemma 29 line 1624 has
  radius `4|y − x|/ε` for small `ε`; the README's `3` is the first source's and was recomputed.
- §8.3: poltoratski2024 Lemma 3 line 729–751; mauth2022 Corollary 3 line 1104: as cited.
- §8.5: poltoratski2024 Lemma 5, Corollary 1 line 814–842; mauth2022 Corollary 4 line 1205, line 1238–1242: as
  cited.
- §8.8: poltoratski2024 Lemma 7 line 1028–1097; mauth2022 Lemma 43 line 3140: the locators hold; the statement
  is R01.
- §9.2: poltoratski2024 line 1183–1347, (9.1)–(9.4): as cited; the identities recomputed below.
- §9.6: poltoratski2024 Theorem 1 line 578–586, line 54–57, line 1538–1582; mauth2022 Theorem 2 line 216, line
  3851–3862: as cited.
- §8.7 (changed text): poltoratski2024 line 918–1012 read in full; line 832–833, 879, 907–909 are the diagonal
  remarks cited.

**Adversarial table** (values computed this round, by hand or in plain Python with closed-form
piecewise-constant fundamental matrices).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.2 | `P = t^{−1/2}`; `P = 1/t`; free `ℂ²` case | `Y = y₀e^{2√t}`; `Y = ct` for all `c`; `[[cos, −sin], [sin, cos]]` | holds | none |
| §1.5 | `p = 0`, `p′ = 1`; identity `N′ − N = ∫N′(P′ − P)N` | `1.71828 ≤ 2.71828`; bound `‖P′ − P‖e^{‖P′‖}e^{‖P‖}` | holds | none |
| §1.7 | `x²` on the ball `r = 1`; the two-solution example | `L = 4`, `0.1e^{0.4} = 0.14918 ≤ 1`, `1/0.9 = 1.111`; `(1 + (t−1)²)′ = 2(t − 1) = 2√(Y − 1)`, `∫m = 1 = r` | holds | none |
| §2.3 | cone inequality; constant; `h = 1_{[0,1]}`, `x = 2` | `(s−x)² + y² ≤ 3((s−x′)² + y²)`; sup of the ratio `2.618034 = ((1+√5)/2)²`; `P[h](2+i) = 0.10242 ≤ 0.75` | holds | none |
| §2.4 | `1_{[0,1]}` along `−y/2 + iy` | `0.5 − arctan(0.5)/π = 0.35242` against `0.5` | holds | none |
| §2.7 | kernel norm at `λ = 0.2 + 0.3i`, `t = 2`; `zF` | quadrature on `[−800, 800]`: `0.80056`; `sinh(1.2)/(0.6π) = 0.80079`; `zF = i∫φ′e^{isz}` by parts | holds | none |
| §3.3 | `f = 0.7·1_{[0,1]} − 0.4·1_{[1,2]}`, `z = 0.37 + 0.21i` | `\|E\|² − \|E#\|² = 4.743603`; `4 Im z∫\|Θ\|² = 4.743603`; (2.2): `2.0000i` | holds | none |
| §5.1 | `q = 1_{[0,2]}`, `z = 0.3 + 0.5i`, `t = 1`, `t′ = 2`; `q = 1_{[0,1]}`, `5i` | `\|ρ(2) − ρ(1)\| = 0.0796 ≤ e^{−1}/(2√0.5) = 0.2601`; `log\|a\| = 0.888 ≤ 4`; `\|a(1, 5i)\| = 1.093368`, `log = 0.089263 ≤ 0.2` | holds | none |
| §4.1–§4.3 (conventions) | `q = 1_{[0,1]}` at `±5i` | `\|a\| = 1.0934`, `\|b\| = 0.1083`; at `−5i`: `237.03`, `2384.6` | as stated | none |
| §7.1 | `E = z + i`; `θ′/θ` on `ℝ` | `ψ′ = 1/(1 + x²) = π(1/π)/\|E\|²`; `−2i Im(E′/E)` | holds | none |
| §7.2 | proof constant; `b_{10i}` | `min_{0<ε≤1}(√(1+ε) − 1)/ε = 0.41421 > 1/3`; `0.2, 0.16, 0.1`, radius `60` | holds | none |
| §8.3 | expansion; wrong normalisation | `Sinc(1/w − 2/w + 1/w) = 0`; with `1/√w`: `Sinc(1/√w − 1)²` | holds | none |
| §8.5 | free case; box diameter | `cos tz sin tλ − sin tz cos tλ = sin(t(λ − z))`; `\|λ − z\| ≤ 2√2 C/t` | holds | none |
| §8.7 route, two-term form | same `f`, `t = 2`, `z = 0.37 + 0.21i` | `x₀ = 0`, `c₁ = 1.349859`, `x₁ = −2.485625`, `c₂ = 0.816774`; `\|A − D(t, x₁, z)/c₂\| = 1.2·10⁻¹⁵`, `\|C − D(t, z, x₀)/c₁\| = 0` | holds | none |
| §8.7(3) | modulus of the two-term form; free case | `cos²u + sin²(u + φ) = 1 + sin(2u + φ) sin φ` (`1.343742` both sides at `u = 0.83`, `φ = 0.4`), constant only for `sin φ = 0`; then `c₁⁴w² = 1`; `α = ie^{itx₀}`, free `α = i` | holds | none |
| §8.7 Check 2 | `C(t) = √t` | `max(log t − √t) = log 4 − 2 = −0.6137` | holds | none |
| §8.7(1), §8.8 | zero at `s + (C₁ + 1)/t − ip/t`, `tp → 0` | in `T₁(s, C₁)`; error of §8.6 `o(γ(tp))`, `γ ~ (tp)^{−1/2}`; `4π + 24π/ε = K` for `ε = 24π/(K − 4π)` | one function not reached | R01 |
| §8.8 determinant | `ũ = u`, `w w̃ = 0.63` | `2/√0.63 = 2.5198` | as stated | none |
| §9.1 | same `f`, `t₁ = 1`, `t₂ = 2`, `z = 0.3` and `0.3 + 0.2i` | closed forms minus the data of `f(1 + ·)`: `2·10⁻¹⁶`, `1·10⁻¹⁶` | holds | none |
| §9.2 | the README's data, `α₁ = e^{0.4i}`, `α₂ = e^{−1.1i}` | direct minus closed: `2.3·10⁻¹⁶`, `1.1·10⁻¹⁶`; `\|a\|² − \|b\|² = 1.0000000`; single-time determinant `2i` | holds | none |
| §9.3 | zero at `s − 0.3i/t` on `[2ⁿ, 2ⁿ⁺¹]` | `Iₙ = [2ⁿ, 2ⁿ⁺¹]`; `ty = 0.3 < 1`; sweep `(2ⁿ/3m)(C/2ⁿ) = C/(3m)` | route does not reach it | R02 |
| §9.4 API 2 | same `f`, `z = 0.37 + 0.21i` | `E_{−f} = 0.718187 − 0.748023i = iẼ_f` | holds | none |
| §9.5 | (2.2) on `ℝ`; `f = 0.7·1_{[0,1.3]}` at `0` | `Im(conj β) = √(w w̃)`; `β = −iα′/α`; `\|a\|² = 2.083471 = cosh²(0.91)` | holds | none |
| §9.6 (headline) | quotient; denominator | `(1/√w − iβ/√w̃)/(1/√w + iβ/√w̃)`; `1/w + 1/w̃ + 2 > 0`; `\|A\|, \|C\| ≤ \|E\|` on `ℝ` | holds given §9.5 | none |
| §4.4, §5.4, §6.8, §2.8, §1.6 (headlines) | round 12's rows, which carry values | relied on (`π/2`; `I ∈ 2π²ℤ`; `−2π log 2 − π‖q‖²`; `‖FG‖² = π`; `z/(z − t)`) | hold | none |

**Duplication audit.** `roadmaps grep` over main and the open heads, by object: "resonance-free",
"Hermite–Biehler", "Paley–Wiener space", "non-linear Fourier", "de Branges space", "Fatou's theorem", "`H²(ℂ₊)`",
"Weyl function", "Szegő condition", "meromorphic inner", "integrable coefficient", "Carathéodory solution": no
match. "Carathéodory": PlanarTopology, the boundary-extension theorem, another object. "outer function":
ConvexLifting, another sense. "nontangential maximal": StochasticCalculus (line 3830), on balls, named in the
Scope. `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped or defined only
by an open revision, no second copy. The board packages index (AnalyticNumberTheory, LawrenceVenkateshMethod) has
no related package.

Overlap check: read PDE, StochasticCalculus, OptimalTransport (main), MathematicalStatisticsAsymptotic, AutomorphicSpectralTheory, RelativisticQuantumFieldTheory, AnalyticNumberTheoryPartIII (open) and OperatorTheory/UnboundedOperators (main); Weyl's alternative for `Ju′ + Vu`: owner OperatorTheory/UnboundedOperators §4.8, cited; the subtracted-kernel Herglotz representation: owner AutomorphicSpectralTheory §0.5, cited; nothing else shared.

**Shape.** 55 numbered sections, 55 `**Checks.**` blocks, 55 `*Needs:*` lines, nine `### Examples`, nine
`### Dependencies`; plan.json has 55 targets, `gaps: []`, three suppliers, and its statements of 8.7, 8.8, 9.3–9.6
equal the README's. Layers are named by their mathematics; no sentence says the roadmap follows a source.

**Headline theorems for the package stage:** pointwise convergence at resonance-free points (§9.6) with §9.5;
the non-linear Plancherel identities (§4.4, §5.4); the Szegő condition (§6.8); the isometric embedding and
uniqueness of the spectral measure (§6.6); the linear Carathéodory theorem with holomorphic dependence (§1.2,
§1.6); the outer-multiplier theorem (§2.8).

**Copyright, licences and scope.** Wording: the README was set beside the source at 19 passages (the locators of
the sampled targets above, §8.7 against poltoratski2024 line 918–1012, §9.3 against line 1350–1377, §9.5–§9.6
against line 1538–1582 and mauth2022 line 3851–3866, §9.1 against line 1183–1252). One is close: the statement
of §9.3 against line 1350–1352, rewritten by R02. Elsewhere no run of more than six words is shared, the longest
being the geometric phrase "circle with foci `x` and `y`" of §7.2. Arrangement: poltoratski2024 §1–§10 against
Layers 1–9: Layers 1–2 ↔ none; Layers 3 and 6 ↔ parts of §2; Layers 4–5 ↔ §5, placed before Layer 6; Layer 7 ↔
§3–§4; Layer 8 ↔ §6–§8; Layer 9 ↔ part of §9: not one to one, and the order of Layers 7–9 is forced by their
dependency lines (§8.7 needs §7.2; §9.5 needs §8.7). Reuse: no table, figure or list is taken over.

Source independence: 19 passages compared with 3 sources, one close (the statement of §9.3, rewritten by R02); largest share poltoratski2024, 72 of 189 locators; contents compared with poltoratski2024: independent.

## Not verifiable

- garnett2007 (paywalled, `uncertified`) and coddingtonlevinson1955, debranges1968, remling2018, krein1955
  (waived): cited by locator only. §1.5 and §1.7 of the sample have no other locator; their statements were
  recomputed.
- Whether §8.7(1) in its one-function form, or §9.3 without the restriction, is true: no instance refutes
  either; the routes do not reach them (R01, R02).
- poltoratski2024 line 1253–1340: the displays are garbled by OCR; (9.2) and (9.4) were checked by recomputing
  the identities of §9.2, not by reading them.
- The published version of poltoratski2024 (Ann. of Math. 199): not read.
- Elaboration: not available (this lane does not elaborate; no `Suggested.lean` at the design stage).

## Source issues

- **Gap** in poltoratski2024 at Corollary 3, part 1), printed p. 26 (line 1002–1007): the source says one box function serves both for testing the times and for the approximation; it should use a larger box for the times, since the non-resonant case approximates on a smaller box only; affects the proof.
- **Gap** in poltoratski2024 at Lemma 9, printed p. 35 (line 1350–1359): the source says the bound holds for any zero in the box; it should restrict to zeros below height `−1/t`, as formula (9.2) rests on Lemma 8; affects a stated result.
- **Gap** in mauth2022 at Corollary 6, printed p. 29 (line 1397–1403): the source says the same one-function statement as the corollary it follows; it should separate the two boxes likewise; affects the proof.

## For the human reviewers

- **Scope.** The headline §9.6 is conditional on the set `R(f)` (README line 114–118). For compactly supported and for integrable `f` its conclusion is already §5.2; no source read here shows `R(f)` non-null for another `f`.
- **Scope.** README line 121–123 states that §9 of arXiv version 14 of poltoratski2024 cannot exclude a resonance. That is this project's computation (§9.4, fourth Check), not a published statement.
- **Scope.** denisov2026 (arXiv, 2026, line 204–212) poses almost-everywhere convergence of `b/a#` for `L²` potentials as a question and does not cite poltoratski2024.
- **Scope.** OperatorTheory/UnboundedOperators §4.8 (main, README line 861–863) asks for an "analogous" endpoint classification for `Ju′+V(r)u` without writing the alternative out; §6.4 here relies on it as spelled out in the contracts.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "82d58efb3bbbcda2199760154a3e63d8e31eb802", "job": "REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~13", "model": "fable", "worker": "chris-x55"} -->
