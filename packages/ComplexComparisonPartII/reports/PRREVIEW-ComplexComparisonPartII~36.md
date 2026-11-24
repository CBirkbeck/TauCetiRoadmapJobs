# Review of ComplexComparisonPartII (pull request #3027 at 477bb48)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 1278 changed lines since `aecb53a`. I checked the new sections C0.1a, C5.4a–C5.4j and Layer C7 (C7.1–C7.18, C7.15a) and the rewritten overview, scope and supplier text. I computed test cases for every new statement and checked about 78 locators in ten open sources against the text. The mathematics holds up: no new statement, normalisation or Check failed a computed instance. Two findings block. First, strong openness (C7.12) lists among the inputs of its cited proof a curve selection lemma for holomorphic germs that no section here or in any supplier owns. Second, `Suggested.lean` neither states nor names the new layer's headline theorems, although Skoda's division theorem and local strong openness can be stated at the pins. There are two small corrections and two format notes, and nothing is left for a human to decide.

## R01 (P1) — Strong openness (C7.12) needs a curve selection lemma for holomorphic germs, and no section owns one

An implementer of C7.12 is sent to Guan and Zhou's proof. Among its inputs, its *Needs:* line (lines 5356–5360) lists "a curve selection lemma for holomorphic germs (*Analytic Methods*, (12.20), p. 122)". No target in this roadmap and no supplier section states that lemma, so this step of the route has no owner.

The proof cannot avoid it. Guan–Zhou's induction (arXiv:1311.3781v1, Step 2, pp. 11–13) starts from their Proposition 2.15 (p. 10). That proposition is proved from their Lemma 2.11 (p. 9), the curve selection lemma, together with Remark 2.12. No roadmap on `main` or at an open head has a holomorphic curve selection lemma: the only one in the repository is the o-minimal statement of ShimuraVarieties §3.4e. The other input named on the line, the extension theorem of Guan–Zhou's Theorem 2.8, is covered. The paper uses it only with the constant weight `ψ = −log 2`, on a disc in Step 1 (p. 11) and on a polydisc in Step 2 (p. 13). After a translation of coordinates that is C7.7.

The smallest repair is a target for the lemma: for germs `f, g_1, …, g_r ∈ O_n` vanishing at `0`, `|f| ≤ C·|g|` holds near `0` iff it holds along every analytic curve germ through `0`. Include the curve-germ construction that Guan–Zhou's Lemma 2.11 extracts from its proof (*Analytic Methods*, (12.20), p. 122). It would sit with the local analytic algebra C7.12 already cites (ComplexKahlerGeometry K3's local parametrisation) and be added to C7.12's *Needs:* line.

## R02 (P2) — `Suggested.lean` neither states Layer C7's headline theorems nor says why they are absent, although two can be stated at the pins

The overview now presents Skoda's division theorem, the Ohsawa–Takegoshi extension theorem and Nadel vanishing as results of this roadmap (lines 52–54, 94–98). The acceptance test is silent on all of them. The docstring of `Suggested.lean` introduces its list with "The other headline targets require objects absent from the pins:" (line 29), and that list stops at C6. README lines 45–48 still explain the omissions by objects "such as analytic spaces", which is not what C7 lacks.

At least two of these results can be stated at the pins. I checked this by elaborating two short definitions with real bodies. The first, plurisubharmonicity on an open set of a complex normed space, says: upper semicontinuous with values in `EReal` and never `⊤`, and on each closed disc `z ↦ a + z • ξ` in the set the value at `a` is at most `Real.circleAverage g 0 1` for every continuous majorant `g`. This is C5.4a's mean. The second, pseudoconvexity, asks for a continuous plurisubharmonic exhaustion (C7.1). With them, C7.12 in Guan–Zhou's local form on the unit ball and C7.6 as stated both elaborate under `import Mathlib` alone, using `EReal.exp` for the weight and `lintegral`, with only `sorry` warnings.

The repair would be to state these two in `Suggested.lean` with the two definitions. Add a docstring bullet for C5.4a–C7 naming what the other headlines lack, for instance coherent analytic sheaves and their cohomology on Kähler manifolds for Nadel coherence and vanishing. Then update README lines 45–48.

## C01 — C7.12 cites the strong Noetherian property by its source, though C0.1a now owns it

C7.12's *Needs:* line ends with "the strong Noetherian property of coherent sheaves (Demailly, II.3.22, p. 90)" (line 5360). This change adds that property as C0.1a, which C7.9 and C7.14 cite. Citing the book here leaves this edge out of the roadmap's own dependency record. Replace it with "C0.1a".

## C02 — The weighted Bergman spaces of C7.9 and C7.13 are called Hilbert spaces, but nothing here shows they are closed

C7.9 speaks of "the Hilbert space `H(B, φ)`" (line 5290), and C7.13 takes an orthonormal basis of `H(Ω, mφ)` (line 5365). Neither states that these spaces are closed in the weighted `L²` space, and an orthonormal basis needs completeness. The only statement of it is HeightsRationalPointsAndObstructions §5.17c.2, case (iii), which comes later and cites this roadmap. One sentence in C7.9 would close the gap: `H(B, φ)` is a closed subspace of `L²(B, e^{−φ}dλ)` with continuous point evaluations, because `φ` is bounded above on compact sets and the sub-mean-value bound of C7.13's route applies. Heights §5.17c.2 can then cite it.

## N01 — C5.4a's Levi-form criterion and strict plurisubharmonicity do not name the pinned Tau Ceti carriers

The carriers are `TauCeti.manifoldLeviForm` (`TauCeti/Geometry/Manifold/Complex/LeviForm.lean:106`), `TauCeti.IsManifoldStrictlyPlurisubharmonicAt` (same file, line 343) and `TauCeti.leviForm` (`TauCeti/Analysis/Complex/LeviForm.lean:119`). They could be named in C5.4a (lines 3345–3357) and its *Needs:* line, so the criterion is stated against them rather than against a new Levi form.

## N02 — A Check in C5.4e would pin the halved-weight normalisation that Layer C7 depends on

On `ℂⁿ`, `u = c·log|z|²` has `ν = 2c` and `e^{−u}` is integrable iff `c < n`, so `c(u, 0) = 2n/ν`. For `u = c·log|z₁|²`, `c(u, 0) = 1/c = 2/ν`. These attain the two bounds of (k), and the `e^{−2φ}` convention would give `1/ν` and `n/ν` instead.

## Questions for the author

- Are C5.4j (a) and (b) Theorems 1 and 2 of Błocki–Kołodziej, in that order, with (a) for a positive continuous form on a compact complex manifold? I could not open the paper: arXiv was rate-limited and the publisher's page is not on a host I may certify.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| C0.1a strong Noetherian | `M = ℂ`, `F_k` = ideal of `{j ∈ ℤ : j > k}` | stationary on each compact; not globally stationary | as stated (compact-local); II.3.22 p. 90 |
| C5.4a definition and closure | `|z₁|² − ½|z₂|²`; `log|z₁|` on `ℂ²` | real Laplacian 2 > 0 but `−½|z₂|²` on `z₁ = 0`: not psh; `log|z₁|` psh, poles null | holds; I.5.1–5.7, 4.23 |
| C5.4a strict psh ⇔ `i∂∂̄u ≥ θ` | gluing local `ε_j` by partition of unity | `θ = Σχ_jε_j i∂∂̄|z_j|² ≤ i∂∂̄u`, positive definite | holds; I.5.20 |
| C5.4a (a)–(c) | `T = log|z|²` on `ℂ` | `i∂∂̄T = 2πδ₀·(i/2)dz∧dz̄ ≥ 0`; representative `log|z|²`; mollifiers decrease | holds; I.5.5, 5.8, 5.11 pp. 39–40 |
| C5.4b (a) | shift `u + q + δ|z − x₀|²` | `i∂∂̄ ≥ γ(x₀) − γ + δβ ≥ 0` on `B_δ`; loss `−2δβ → 0` | holds |
| C5.4b (b) | `γ = 0`, compact connected `X` | `PSH = ℝ`; `{sup = 0} = {0}` compact; `sup = mean` | holds; GZ 1.3/1.6/1.7 p. 6; DK Prop 2.1 |
| C5.4c | `E = {z₁ = 0} ⊂ ℂ²`, `v = log|z₁|²` | `E ∩ W = {v = −∞}`; Lebesgue null | holds; I.5.22–5.24 pp. 44–45 |
| C5.4d | disc definition | embeddings and holomorphic maps send discs to discs; usc kept | holds (formal) |
| C5.4e (a)–(f) | `u = log|z₁|²`, `n = 2` | `ν = 2`; `σ_T(B_r) = 2πr²` over `πr²` = 2; `sup_{|z|=r}u/log r → 2` | holds; III.5.11, 6.9, 7.2; AM 2.8 |
| C5.4e (g)–(i), (k) | `c·log|z|²`, `c·log|z₁|²` on `ℂⁿ` | `ν = 2c`; integrable iff `c < n` (resp. `c < 1`); `c(u) = 2n/ν` (resp. `2/ν`) | both bounds attained; AM 5.6; DK 1.4 (8) |
| C5.4e (j) | `c·log((|z|²+ε)/(4+ε))` | uniform bound forces `α < n/c`, so `α` depends on `A` | matches ComplexHessianEquations §7.1 |
| C5.4f def, (a), (b) | `O(1)` on `ℙ¹`, `h₀ = FS`, `s = z₀` | `∫c₁ = 1`; `(i/π)∂∂̄log‖s‖ = δ − c₁`, total `1 − 1 = 0` | holds; AM 3.12, (3.11), 3.13 |
| C5.4f (c) | `c·log(|z₁|²+|z₂|²) + w` | `ν(0) = 2c`; polar set `{0}` if `c > 0`, empty if `c = 0` | holds; AM 1.10 p. 8 |
| C5.4f (d) | big `L`, `mL = A + E` | `iΘ_h = (1/m)(iΘ_A + 2π[E]) ≥ (1/m)iΘ_A` | holds; AM 6.2, 6.10, 6.11, 6.17 |
| C5.4g (a)–(d) | `φ = log|z|²` on `ℂ` | `J = (z)`; `ν = 2 = 2n`, `0 ∈ V(J)`; `J ⊆ 𝔪` | holds; AM 5.6 pp. 35–36 |
| C5.4h (a)–(c) | `X = ℂ`, `a = (z)`, `c = 1, ½` | analytic `(z), O`; algebraic `π_*O(−⌊cF⌋) = (z), O`; lct 1 | holds; AM 5.8, 5.9 |
| C5.4i | `k = 1`; `t = (0, −2η)` | `M_η(t) = t` (mean-zero kernel); `M_η(0, −2η) = 0` | holds; I.5.18, 5.21 pp. 43–44 |
| C5.4j (a)–(c) | `ℙ¹`, `log(|z|²/(1+|z|²))` | `ν(0) = 2`: (b) excluded; `log((|z|²+δ)/(1+|z|²))` decrease in `PSH(ω_FS)` | consistent; BK07 not opened |
| C7.1 (a), (b) | `Ω = ℂ`, `φ = |z|²`, `g = dz̄` | least-norm `u = z̄`; `π` against `(1/c)·π`, `c = 1` | equality; VIII.6.5, (6.4) pp. 377–378 |
| C7.2 | same; `θ = i dz∧dz̄` | `|v|²_θ = 1`; both sides `π` | holds; VIII.6.1 p. 376; Demailly 1982 Th. 5.1 p. 475 |
| C7.3 | `η ≡ 1`, `ϑ → 0` | `B = [iΘ(E), Λ]`; factor `(1+ϑ)⁻¹ → 1` gives C1.4's bound | holds; Demailly 2015 3.6, (3.10), 3.11, 3.12 |
| C7.4 | `ℓ = −log|g|²`, `|g| < e⁻¹` | `i∂∂̄(−log ℓ) = i∂∂̄log|g|²/ℓ + i∂ℓ∧∂̄ℓ/ℓ² ≥ −Aω̂ + i∂logℓ∧∂̄logℓ` | holds; 1982 Th. 0.1–1.5, Rem. 1.6, Prop. 1.6 |
| C7.5 | `(n,q)`-forms, `iΘ ≥ εω` | eigenvalue sums `≥ qε`; bound `1/(qε)` | holds; 1982 Th. 4.1, Rem. 4.2 p. 472, Lemme 6.9 p. 485 |
| C7.6 | `p = 1`; Demailly's `m + ε = αq` | `h = f/g`, `I ≤ αI/(α−1)`; `1 + q/((α−1)q) = α/(α−1)` | holds; Skoda Th. 1 pp. 555–556; VIII.9.10 p. 392 |
| C7.7 and its Check | unit disc, `φ = 0`; unit polydisc, `f = 1` | `c_D(0) = 1`, constant `π`; `∫|F|² ≥ π·vol(Δ^{n−1})`, equality at `F = 1` | holds (Błocki not opened) |
| C7.8 (a), (b) | `q = 0` case of AM 13.6; 13.9 | hypotheses (a) `≥ α⁻¹{iΘs,s}/|s|²`, (b) `|s| ≤ e^{−α}` match | holds; AM pp. 125–126, 132 |
| C7.9 | `φ = log|z|²` on a disc | `J = (z)`; `H(B, φ) = z·A²(B)` generates `(z)` | holds; AM 5.7 p. 37 |
| C7.10 | `c·log|z|²` on `ℂ²`, `1 ≤ c < 2` | `J(φ)₀ = O`, `J(φ|_H)₀ = 𝔪_H ⊆ O_H` | holds; AM (15.1) p. 158 |
| C7.11 | `φ = ψ = log|z|²` on `ℂ` | `J(2log|z|²) = (z²) = (z)·(z)` | equality; AM 15.2 (b) p. 159 |
| C7.12 | `φ = log|z|²` on `ℂ`; GZ's uses of Th. 2.8 | `J((1+ε)φ) = (z) = J(φ)` for `ε < 1`; Th. 2.8 used with `ψ = −log 2` only, covered by C7.7 | holds; GZ Th. 1.1 pp. 1–2; curve selection unowned (R01) |
| C7.13 | `log|z|²` on disc, `m = 1` | `ν(φ₁, 0) = 2 ∈ [ν − 2n/m, ν] = [0, 2]`; doubled AM constants | holds; AM 14.2 pp. 136–137 |
| C7.14 | `log|z₁|²` on `ℂ²` | `E_c = {z₁ = 0}` for `c ≤ 2`, empty for `c > 2` | holds; AM 14.3 p. 138 |
| C7.15 | translation of AM 14.12 to `e^{−φ}` | coefficient `1/m`, loss `ν − 2n/m`, `γ − ε_mω` after doubling | holds; AM pp. 142–143 |
| C7.15a | `log|z|²` near `0` | `ν(0) = 2`, so `λ_t(0)` need not tend to 0; zero elsewhere | holds; 1982 Th. 9.1 p. 504 |
| C7.16 | constant `ε` | `1/(qε)` equals AM Cor. 5.3 | holds; AM 5.2–5.3 pp. 34–35 |
| C7.17, C7.18 | `ℙ¹`, `L = O(2)`, `h = h_FS ⊗ |s_x|⁻²` | `iΘ = ω_FS + 2π[x]`, `J = 𝔪_x`; `H¹(O(−1)) = 0`; constants onto `ℂ_x` | holds; AM 5.11, 5.12 pp. 39–40 |
| Suggested.lean, C7 headlines (R02) | elaborated test statements | `strong_openness`, `skoda_division` elaborate with two definitions; only `sorry` warnings | statable; absent |

- Source locators checked against the text: about 78. Demailly's *Complex Analytic and Differential Geometry*: 24 (I §§4–5, II.3.22, III.2.5–2.6, 5.11, 6.9, 7.2, VIII.6.1–6.9, 9.5, 9.10). *Analytic Methods*: 29, every printed page as cited. Demailly 1982: 12. Skoda 1972 (Ann.): 2. Skoda 1972 (Bull.): 1. Guedj–Zeriahi: 3. Guan–Zhou 2015: 3. Demailly 2015: 4. Demailly–Kollár: 1. Dinew–Kołodziej: 1.
- Library declarations opened at the pins: `Real.circleAverage` (`Mathlib/MeasureTheory/Integral/CircleAverage.lean:55`), `EReal.exp` (`Mathlib/Analysis/SpecialFunctions/Log/ERealExp.lean:39`), `TauCeti.manifoldLeviForm` (`TauCeti/Geometry/Manifold/Complex/LeviForm.lean:106`), `TauCeti.IsManifoldStrictlyPlurisubharmonicAt` (same file, line 343), `TauCeti.leviForm` (`TauCeti/Analysis/Complex/LeviForm.lean:119`), `TauCeti.SubharmonicOn` (`TauCeti/Analysis/InnerProductSpace/Harmonic/Subharmonic.lean:74`), `TauCeti.IsStrictlyPlurisubharmonicAt` (`TauCeti/Analysis/Complex/Pseudoconvex.lean:82`). Mathlib has no general plurisubharmonic functions; Tau Ceti has only smooth strict plurisubharmonicity.
- Cross-roadmap citations resolved at this head and on `main`, all present:
  - PDE §§3.2a, 3.4, 3.4a; §§3.2a and 3.4a are added in this pull request.
  - ComplexHessianEquations §§5.4 and 7.1, on `main`. It names this roadmap only to say what it does not build.
  - ComplexKahlerGeometry §§3.1, 3.5a, 4.2a, 5.9 (K5b.0), 6.1 (K6.0) and 7.2, and K2–K4; §§3.5a and 4.2a are added here.
  - AlgebraicModuliForArithmeticGeometry §§1.5, 1.6 (`bigLineBundle`) and 9.10 (`algebraicMultiplierIdeal`).
  - ResolutionOfSingularitiesCharacteristicZero §§5.1–5.2.
  - RealAnalyticGeometry R3.1.

  None of these suppliers consumes this roadmap.
- Record: the merge-base README has 8 layers and the head keeps every id and title. All 25 deleted lines are rewritten with additions. The new ids are C0.1a, C5.4a–C5.4j, C7, C7.1–C7.18 and C7.15a.
- Overlap check: I read SingularHermitianMetricsAndL2Methods (head), ComplexKahlerGeometry (`main` and #2536), RealAnalyticGeometry, Hyperfunctions (#2592), and EtaleCohomologyFoundations, AbelianSchemesAndArithmeticModuli and ClassicalAdicEtaleCohomology (#3036).
  - Plurisubharmonic functions, Lelong numbers, multiplier ideals and the L² theorems: this roadmap owns them, and SingularHermitianMetricsAndL2Methods cites it through its *Corollary of:* lines.
  - The local Lelong mass estimate: ComplexKahlerGeometry K6.1 owns it, and C5.4 globalises it.
  - Hyperfunctions consumes only §C6.1, and the three étale roadmaps share nothing.
- Dependency check: `depcheck: 132 roadmaps, 1472 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `Suggested.lean` (unchanged by the pull request): exit 0, four `sorry` warnings and nothing else. The worker's elaborated signatures show no lost binder; I did not re-run `#check`, since the file is unchanged.
- Seeded sample: 14 of the 15 targets lie in untouched text the change does not affect, and I did not re-verify them. `analyticSetLocalFiniteMass` sits in C5.4 next to the change; its locator (III (2.5)–(2.6), p. 140) checks out.

Source independence: changed passages only. I compared 14 passages with 7 sources (*Complex Analytic and Differential Geometry*, *Analytic Methods*, Demailly 1982, Skoda 1972 (Ann.), Guan–Zhou 2015, Demailly 2015, Guedj–Zeriahi). No wording is shared beyond what the statements force: C7.8 (a)–(b) list the hypotheses of *Analytic Methods* 13.6 and 13.9, as stating those theorems requires. The largest share is *Analytic Methods*, about 26 of about 95 locator citations in the added text. Contents compared with *Analytic Methods*: C7 runs §13 → §5 → §15 → §14 → §5, against the source's order §5, §13, §14, §15; independent.

Research link: Layer C7 states the L² theory used in current work on positivity and multiplier ideals: Skoda's division theorem (Skoda 1972), Ohsawa–Takegoshi with Błocki's optimal constant (Błocki 2013; Guan–Zhou 2015), Nadel coherence and vanishing (Nadel 1990), strong openness (Guan–Zhou 2015) and Demailly's approximation (Demailly 1992). This rests on the README's references and *Analytic Methods*.

## Not verifiable

- Błocki–Kołodziej 2007 (C5.4j (a), (b)): the arXiv search was rate-limited, and the AMS landing page is on a host outside the licence classes.
- Błocki 2013 (C7.7, Theorem 1, p. 150; §2): Springer paywall, not fetched.
- Fornæss–Narasimhan 1980 (C5.4d Theorem 5.3.1; C5.4j (c) Theorem 5.5): Springer paywall (DOI prefix 10.1007).
- Hörmander's *Introduction* (C5.4e (j), C7.1 (a), "chapter IV" only) and Lazarsfeld I §2.2 and II chapter 9: paywalled books.
- Cited by name but not opened: Demailly 1992, 1994 and 2000; Demailly LNM 1507 Definition 2.1; Ohsawa–Takegoshi 1987; Manivel 1993; Nadel 1990; Demailly–Ein–Lazarsfeld 2000; Siu 1974; Lelong 1957; Grauert–Remmert 1956; Richberg 1968; Hiep 2014; Guan–Zhou 2015 (Ann. 181); Hironaka 1964. Their *Analytic Methods* counterparts were checked instead.

## Source issues

- none

## For the human reviewers

- none
