# Review of ApproximationSpaces (pull request #3202 at 9e69b58)

**Verdict:** needs changes

**Summary.** Needs changes, three findings. The interpolation half of AS-B10 forms a couple whose second functional is not a quasi-norm in the sense of AS-A01 unless the modulus is homogeneous, which is not assumed; three definitions of `Suggested.lean` carry `sorry` in their proof fields; and two headline theorems of the Summary (AS-B07 and AS-A13) are statable at the pins but neither stated nor named in the module docstring. The statements that are in `Suggested.lean` survived the adversarial pass, and the file elaborates with `sorry` as its only warning. There are three small corrections and four format notes; one reuse fact is left for the human reviewers.

## R01 (P2) — The couple `(X, B^t_{∞,ω})` of AS-B10 is not a quasi-normed couple unless `ω` is homogeneous, and the text assumes only `ω(−f, k) = ω(f, k)`

AS-A01 defines a quasi-norm with `N (c • x) = ‖c‖ₑ N x`, AS-B01 builds couples from two such quasi-norms, and AS-B06 takes `Y` to be a quasi-normed group in that sense. The second half of AS-B10 (README line 368 onwards) applies AS-B06 with `|f|_Y = sup_k 2^{kt} ω(f, k)` and calls `N f + ‖(2^{kt} ω(f, k))_k‖_{ℓ_q}` a quasi-norm, under the single extra hypothesis that `ω` is even. An implementer cannot form this couple from the stated hypotheses.

A witness: let `N` be a norm, `A_n = X` for `n ≥ 1`, and `ω(f, k) = 2^{−kθ} min(N f, 1)`. Then `ω` is subadditive (`ρ = 1`), `ω(f, k) ≤ N f`, Jackson's inequality holds because `E_{2^k}(f) = 0`, the inverse inequality holds with `C = 1`, and `ω` is even. For `t = θ` the functional is `N f + min(N f, 1)`: it is `2` at `N f = 1` and `3` at `2f`, not `4`. The same point arises in AS-B06 (line 336), where `ι` is only additive "as in AS-A09" while `N₁ x = inf {N_Y y : ι y = x}` must be homogeneous; `Suggested.lean` already takes `ι` linear there.

The smallest change: in AS-B10 replace "If moreover `ω(−f, k) = ω(f, k)`" by "If moreover `ω(c f, k) = ‖c‖ ω(f, k)` for every scalar `c`", and in AS-B06 say that `ι` is linear. (The alternative is to weaken AS-A01 to Bergh–Löfström's quasi-normed Abelian groups, which is a larger change.)

## R02 (P2) — Three definitions of `Suggested.lean` have `sorry` in their proof fields

`lpQuasiENorm` (line 75), `approxSpace` (line 170) and `embeddingCouple` (line 318) are `def`s whose `Prop` fields are `sorry`. The data of each is real and I checked by hand that every omitted field is true, but the project admits no `sorry` inside a definition, and here every `FunctionScheme` statement and the representation theorem are stated over one of them.

For `lpQuasiENorm` the three fields close as follows (elaborated on a scratch copy of the file, no `sorry` left in the definition):

```lean
  map_zero := by rw [eLpNorm_congr_ae (Lp.coeFn_zero ℂ p μ)]; exact eLpNorm_zero
  map_smul := fun c f => by
    rw [eLpNorm_congr_ae (Lp.coeFn_smul c f)]; exact eLpNorm_const_smul c f p μ
  add_le := fun f g => by
    rw [eLpNorm_congr_ae (Lp.coeFn_add f g)]
    refine (eLpNorm_add_le' p).trans ?_
    gcongr
    rw [ENNReal.coe_max, ENNReal.coe_toNNReal (ENNReal.LpAddConst_lt_top p).ne]
    exact le_max_right _ _
```

`approxSpace` is used by no statement of the file: it can become the set `{f | S.approxNorm s q f < ⊤}`, with the submodule property left to AS-A06 in the README. For `embeddingCouple`, `map_zero` is `le_antisymm (iInf₂_le_of_le 0 (map_zero ι) (le_of_eq NY.map_zero)) bot_le` (elaborated); `map_smul` and `add_le` need short proofs, or the representation theorem can quantify over a couple `C` with `C.N₀ = N` and `∀ x, C.N₁.toFun x = ⨅ (y) (_ : ι y = x), NY.toFun y`.

## R03 (P2) — Two headline theorems of the Summary are statable at the pins but are neither stated in `Suggested.lean` nor named in its docstring

The Summary lists `A^s_q = (X, A^r_τ)_{s/r,q}` (AS-B07) and the `n`-term theorem for a Hilbert basis (AS-A13) among the headline theorems. The module docstring says the file states "some of the roadmap's targets" and lists neither, so the acceptance test does not cover them and a reader cannot tell whether that is deliberate.

Both are statable with the definitions already in the file. These two signatures elaborate on a scratch copy:

```lean
theorem approxNorm_lt_top_iff_kMethodENorm_approxNormDyadic {N : QuasiENorm 𝕜 X}
    (S : ApproximationScheme N) (NY : QuasiENorm 𝕜 X) {r : ℝ} {τ : ℝ≥0∞} (hτ : 0 < τ)
    (hNY : ∀ f, NY.toFun f = S.approxNormDyadic r τ f)
    {s : ℝ} (hs : 0 < s) (hsr : s < r) {q : ℝ≥0∞} (hq : 0 < q) (f : X) :
    S.approxNorm s q f < ⊤ ↔ (QuasiCouple.mk N NY).kMethodENorm (s / r) q f < ⊤

theorem approxNorm_lt_top_iff_memℓp_repr {𝕂 ι H : Type*} [RCLike 𝕂] [NormedAddCommGroup H]
    [InnerProductSpace 𝕂 H] (b : HilbertBasis ι 𝕂 H) (N : QuasiENorm 𝕂 H)
    (hN : ∀ x, N.toFun x = ‖x‖ₑ) (S : ApproximationScheme N)
    (hS : ∀ n, S.A n = {x | ∃ Λ : Finset ι, Λ.card ≤ n ∧ ∀ i ∉ Λ, b.repr x i = 0})
    {τ : ℝ≥0∞} (hτ0 : 0 < τ) (hτ2 : τ < 2) (f : H) :
    S.approxNorm (1 / τ.toReal - 1 / 2) τ f < ⊤ ↔ Memℓp (fun i => b.repr f i) τ
```

State them (in this or another form), or say in the docstring which headline is left out and what it lacks.

## C01 — The Tau Ceti declarations of the K-method that the README cites are not in the pinned Tau Ceti

AS-B01 (lines 289–293) and the contract "From Tau Ceti" (lines 479–482) name `TauCeti.CompatibleCouple`, `CompatibleCouple.kFunctional`, `CompatibleCouple.kMethod`, `CompatibleCouple.kMethodENorm` and `CompatibleCouple.KMethodSpace` with three file paths. The Tau Ceti commit this repository pins has no file under `TauCeti/Analysis/Normed/Interpolation/` and no declaration of these names; they exist on the library's main branch (`CompatibleCouple.lean` line 67, `KFunctional.lean` line 58, `RealMethod/Basic.lean` lines 231, 347, 381), where the comparison claimed in AS-B01 is consistent with the definitions. A reader checking the contract at the pin finds nothing. Say that these declarations are newer than the pin, or rest the contract on NoncommutativeIntegration §2.2 and §2.4 alone (both read on main and as cited). `TauCeti.decreasingRearrangement` is at the pin (`TauCeti/Topology/Order/DecreasingRearrangement.lean` line 41).

## C02 — The scope paragraph gives the Littlewood–Paley Besov spaces to ClassicalApproximationSpaces without the owner on main

Line 462 says "Moduli of smoothness, the Littlewood–Paley Besov spaces and the trigonometric, band-limited, spline, step and Haar schemes belong to ClassicalApproximationSpaces." On main, PDE §7.1–7.2 owns the dyadic partition and the Besov spaces for `1 ≤ p, q ≤ ∞` (and PseudodifferentialOperators §5.3 the Besov comparison with a Banach K-method); the scope section of ClassicalApproximationSpaces itself claims only the range `p < 1` or `q < 1`. Write "the Littlewood–Paley Besov spaces for `p < 1` or `q < 1` (PDE §7.1–7.2 owns `1 ≤ p, q ≤ ∞`)".

## C03 — Kerkyacharian–Petrushev, Proposition 6.14, does not cover `r = ∞`

AS-A16 states the embedding for `0 < p ≤ r ≤ ∞` and cites the proposition beside it. In the arXiv version (1210.6237v2, text line 3528) the proposition assumes `0 < p ≤ p₁ < ∞`, in the setting of Dirichlet spaces. The case `r = ∞` and the continuity statement then rest on the route described and on DeVore–Popov, Theorem 7.1, which I could not read. Add "for `r < ∞`" to the citation.

## N01 — The display of Holmstedt's formula in AS-B03 (lines 313–314) is a code span broken over two lines with `_{` and `^{` inside; an indented code block renders reliably.

## N02 — Three names in the Provenance section begin with `FunctionScheme.`, which `Suggested.lean` declares

`FunctionScheme.memBesov_iff_eNormDyadic_lt_top`, `FunctionScheme.exists_uniform_inclusion_eq_of_nikolskii` and `FunctionScheme.memBesov_iff_exists_blocks` (lines 434–438) are declarations of the cited repository, but in code font under a namespace of this roadmap they read as declarations of `Suggested.lean`, which has none of them. Name them in prose, or qualify them with the repository's module.

## N03 — The header of `Suggested.lean` is `public import Mathlib` with `@[expose] public section`, and the docstring says another roadmap's `Suggested.lean` imports this file

The house form is the single line `import Mathlib`, and a roadmap's Lean file imports no other roadmap's module. The sentence at lines 19–20 of the docstring describes an arrangement the sibling roadmap cannot keep; drop it here.

## N04 — In AS-B02 the letter `ρ` is the dyadic step of the discretisation, while everywhere else it is the exponent of the `ρ`-triangle inequality; another letter would avoid the clash.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| AS-A01 Check, `p = 1/2` | `f = 1_{[0,1/2)}`, `g = 1_{[1/2,1)}` | `‖f‖ = ‖g‖ = 1/4`; `‖f+g‖ = 1`; `1^{1/2} = 1/2 + 1/2`; `2·(1/4+1/4) = 1` | true | none |
| `eLpNorm_add_rpow_min_le` | non-measurable `f`; `p = 0`; `p = ∞` | pinned `eLpNorm` is `∞` off a.e. strongly measurable functions, so RHS `= ∞`; `p = 0`: `1 ≤ 2` | true for all functions | none |
| `lpQuasiENorm` fields | `p = 0`, `p < 1`, `p = ∞` | `K = max 1 (LpAddConst p)`; three fields proved in a scratch copy | true | R02 |
| AS-A02 Hardy, tails and partial sums | `s = 0, ρ = 1, q = ∞`, `a = 1_{[0,N)}`; `q = 0`; `a_k = ∞` | `s = 0`: LHS `N`, RHS `C`; `q = 0`: `0 ≤ 0` | true for `s > 0`; Check true | none |
| `complexity`, `eFunctional_complexity` | `x = 0`; `x ∉ ⋃ A n` | `0`; `⊤ > n`; `complexity y ≤ n ⇔ y ∈ A n` by monotonicity | true; `simp`/`rfl` do not close it | none |
| `exists_approxNorm_equiv` | `s = 0, q = ∞`; `s = 0, q < ∞` | Pietsch `sup E_n = N f`; dyadic `N f + E_1 ∈ [N f, 2 N f]`; block sums `∑ (n+1)^{-1} ≍ 1` | true | none |
| `approxSpace` fields | `q = 0`; `s < 0`; `c = 0` | `E_{2n}(f+g) ≤ K(E_n f + E_n g)`, weights `(2n+1)^{s−1/q} ≍ (n+1)^{s−1/q}` | true | R02 |
| AS-A12 / `approxNorm_lt_top_iff_exists_blocks` | `A n = {0}`; `ρ > 1` | LHS finite iff `N f = 0` (`∑ (n+1)^{sq−1} = ∞`); RHS `g = 0`, `N f → 0` iff `N f = 0`; `∑_{k<n} g_k ∈ A(2^n − 1)` | true | none |
| AS-A13 and worked example | `f = ∑ i^{−β} e_i` | `E_n² ≍ n^{1−2β}`; `ℓ_τ` iff `τβ > 1` iff `α < β − 1/2` | consistent | R03 |
| AS-A15 / `eLpNorm_top_le_of_le_one` | `C = 0`, `C = ⊤`, `‖a‖_p = 0`, `D < 0` | `‖a‖_∞^p ≤ C^{p₀} n^D ‖a‖_p^p`; constant `C^{p₀/p}` as Ditzian–Prymak `M^{p/q}` | true (finite measure not needed) | none |
| AS-A16 / `exists_besovENorm_le_of_nikolskii` | `p = r`; `p = ∞`; non-measurable `f`; `S_n = {0}` | `α = 0`, `K = 1`; both sides `⊤`; `S = 0`: RHS `∞` unless `f = 0` a.e. | true | none |
| AS-A17 / `besovENorm_lt_top_iff_exists_blocks` | `S_n = {0}`; non-measurable `f`; `p = ∞` | both sides: `f = 0` a.e.; LHS `⊤ < ⊤` false, RHS forces a.e. measurability; `‖g_k‖ ≤ C 2^{−ks}` summable | true | none |
| AS-B01 Check, couple `(N, N)` | `L_{1/2}`, `f, g` as above | `min(1,t) N x / K_N ≤ K ≤ min(1,t) N x`; `K(1, f+g) ≤ 1/4 + 1/4 < 1` | true | none |
| AS-B01 comparison with the Banach K-method | library main, not the pin | `kMethodENorm = eLpNorm (t^{−θ} K(t,u)) q multHaar`, `kMethod` its finiteness set | consistent | C01 |
| AS-B02 one-sided form | `N₀ ≤ C N₁`, `t ≥ C` | `K(t,x) ≥ N₀ x / K₀`; `∑_{k<0} 2^{kρθq} < ∞` | true | N04 |
| AS-B03 endpoints | `θ₀ = 0`; `θ₁ = 1`; both | extra term `K(u) ≤ c·t(∫_u^∞ …)`, `u = t^{1/λ}`; `t^{1−1/λ} = u^{−θ₀}`; both: `2K(t,x)` | consistent with Bergh–Löfström 3.6.1 | N01 |
| AS-B06 / representation theorem | `Y = 0`; `ι` unbounded; `n = 0` term | `A n = {0}`, both sides iff `N f = 0`; `E_1(ιy) < ∞` gives `N(ιy) < ∞` | true as a finiteness iff | R01, R02 |
| AS-B07 | `Y = A^r_τ` | Jackson from `A^r_τ ⊆ A^r_∞`; Bernstein `‖a‖ ≤ (1 + C n^r) N a` | true | R03 |
| AS-B10 first part / `approxNormDyadic_lt_top_iff_of_modulus` | `ω = 0`; `s = 0`; `k < j` | `E_1 = 0`, both sides `N f`; `(k − j : ℕ) = (k−j)_+`; Hardy needs `θ − s > 0` | true | none |
| AS-B10 interpolation part | `ω = 2^{−kθ} min(N f, 1)`, `t = θ` | functional `N f + min(N f, 1)`: `2` at `N f = 1`, `3` at `2f` | not a quasi-norm of AS-A01 | R01 |
| AS-B10 Check | `e_1`, `θ = 1` | `ω(e_1, k) = 2 sin(π 2^{−k}) ≥ 4·2^{−k}` | true | none |

- Source locators checked against the text: 10 (Bergh–Löfström Lemma 3.1.3, §3.11, Theorems 3.5.3, 3.6.1, 3.11.5, Definition 7.1.5; DeVore 1998 §4.3 Theorems 1, 2 and Theorem 4; Ditzian–Prymak Theorem 2.1; Kerkyacharian–Petrushev Proposition 6.14).
- Library declarations opened at the pin: `eLpNorm` (`Mathlib/MeasureTheory/Function/LpSeminorm/Defs.lean` line 92), `eLpNorm_add_le'` (`TriangleInequality.lean` line 74), `eLpNorm'_add_le_of_le_one` (line 40), `ENNReal.LpAddConst` (`Mathlib/Analysis/MeanInequalitiesPow.lean` line 324), `MemLp.mono_exponent`, `lintegral_liminf_le`, `TauCeti.decreasingRearrangement`; five Tau Ceti names absent at the pin (C01).
- Cross-roadmap citations resolved: NoncommutativeIntegration §2.2 and §2.4, SNumbers, OperatorTheory/OperatorIdeals (all on main); ClassicalApproximationSpaces read at its open head.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning. Signature pass on all 28 declarations: `lpError` and `besovENorm` do not carry `[IsFiniteMeasure μ]`, which their bodies do not need; the theorems carry it. Nothing changed.
- One-tactic probe (`simp`, `rfl`) on `eLpNorm_add_rpow_min_le`, `exists_approxNorm_equiv`, `eLpNorm_top_le_of_le_one`, `eFunctional_complexity`: none closes.
- Dependency check: `depcheck: 18 roadmaps, 214 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changes outside the roadmap folder.
- Automatic checks: the `sorry`-in-definition hits are R02, the TeX hits N01, the undeclared names N02.

Overlap check: read ClassicalApproximationSpaces, NoncommutativeIntegration, PolynomialInterpolationAndBestApproximation, SNumbers; the Banach K-method for `1 ≤ q ≤ ∞` is owned by NoncommutativeIntegration §2.2 and §2.4 (cited as such; PseudodifferentialOperators §5.3 also builds it on main); Bernstein and approximation numbers by SNumbers and OperatorIdeals; best uniform polynomial approximation by PolynomialInterpolationAndBestApproximation Layer 2 (a different object); Littlewood–Paley Besov spaces for `1 ≤ p, q ≤ ∞` by PDE §7.1–7.2 (C02); nothing this roadmap owns is owned elsewhere.

Source independence: 8 passages compared with 4 sources (Bergh–Löfström, DeVore 1998, Ditzian–Prymak, Kerkyacharian–Petrushev), none shared; largest share Bergh–Löfström, 7 of 23 locators; contents compared with Bergh–Löfström: independent (Part B takes §3.1, §3.6, §3.5, §7.1 in the order the *Needs:* lines AS-B02 → AS-B03 → AS-B04 force, and AS-B06–AS-B10 have no counterpart there). DeVore–Popov 1988 (5 locators) could not be read.

Research link: the headline targets are Pietsch's approximation spaces (1981), the DeVore–Popov interpolation and block-decomposition theorems (1988) and the `n`-term characterisation in DeVore's survey (1998, Theorems 1, 2, 4); Kerkyacharian–Petrushev (2015) use the same Nikolskii embedding. Rests on the README's references and the three texts read.

## Not verifiable

- Pietsch 1981 (§1, and the representation theorem): the publisher's page is paywalled; no open copy found.
- DeVore–Popov 1988, Trans. Amer. Math. Soc. (Theorem 5.1 and the norm `N_3`, Corollary 5.3, §5, Theorem 7.1): the journal's host is not one the sources service reads, and the paper is not linked on DeVore's own page.
- DeVore–Popov, Lecture Notes in Math. 1302: paywalled, not on the author's page.
- Holmstedt 1970: the journal's landing page is on a host the sources service does not read.
- Kalton–Peck–Roberts, Theorem 1.3, and Day 1940: no legal copy found.
- Bergh–Löfström §3.11 as the locator for completeness of `(X₀, X₁)_{θ,q}` in AS-B01: the section was read, the completeness statement was not located in it.
- Whether the cited repository is free of `sorry`, as the Provenance section says: not checked.

## Source issues

- none

## For the human reviewers

- **Licence / reuse.** `eLpNorm_add_rpow_min_le` in `TauCetiRoadmap/ApproximationSpaces/Suggested.lean` (line 65) has the name of a declaration in `mario-ullrich/Lean-FunctionSpaces`, `FunctionSpaces/Analysis/Lp/QuasiNorm.lean` line 135 (Apache-2.0, the pull request author's repository); the README's Provenance section cites it.
- **Not tested.** DeVore–Popov 1988, five of 23 locators, could not be read; wording and arrangement were not compared with it.
