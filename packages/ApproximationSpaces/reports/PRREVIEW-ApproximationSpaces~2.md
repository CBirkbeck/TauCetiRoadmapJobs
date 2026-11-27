# Review of ApproximationSpaces (pull request #3203 at c9ff56f)

**Verdict:** needs changes

**Summary.** Changes are needed, for three reasons. Two statements lack a homogeneity hypothesis (an additive `ι` in AS-A09/AS-A11/AS-B06 and a merely even modulus in AS-B10), so the scheme and the couples they name are not objects of this roadmap. Three definitions of `Suggested.lean` have `sorry` in their bodies, and two of the six headline theorems of the summary (AS-A13 and AS-B07) are neither stated there nor named as not statable. No stated theorem was found false. There are four small corrections and three format notes; the human reviewers have one licence question and one note on the sources that could not be read.

## R01 (P2) — With an additive `ι` and a modulus that is only even, the scheme of AS-A11 and the couples of AS-B06 and AS-B10 are not a scheme and not quasi-normed couples in the sense of AS-A01 and AS-A03

An implementer who takes the hypotheses as written cannot form the objects the conclusions are about. AS-A01 makes a quasi-norm homogeneous (`N (c • x) = ‖c‖ₑ N x`) and AS-A03 makes every `A n` stable under scalars, while AS-A09 (line 175) asks only that `ι` be "an additive map" and AS-B10 (line 368) only that `ω(−f, k) = ω(f, k)`.

For AS-A11 (line 192, "the scheme `B n = ι⁻¹(A n)`"): take `X = Y = ℂ²` with the Euclidean norm, `ι(z, w) = (z, w̄)` (additive, isometric, bijective), `A 0 = {0}`, `A 1 = ℂ·(1, 1)`, `A n = ℂ²` for `n ≥ 2`. Every hypothesis of AS-A09 to AS-A11 holds with `α = 0`, and `B 1 = {(c, c̄)}` contains `(1, 1)` but not `i • (1, 1)`, since `ι(i, i) = (i, −i) ∉ ℂ·(1, 1)`. So `B` is not a scheme. For AS-B10: with `A n = X` for `n ≥ 1` and `ω(f, k) = 2^{−kθ} min(N f, 1)`, all four hypotheses and evenness hold (`E_{2^k} = 0`), yet `sup_k 2^{kθ} ω(f, k) = min(N f, 1)` is not homogeneous, so `N f + sup_k 2^{kt} ω(f, k)` is not a quasi-norm of AS-A01 and `(X, B^t_{∞,ω})` is not a couple of AS-B01. The same applies to `N₁ x = inf {N_Y y : ι y = x}` in AS-B06 (line 338) for a general additive `ι`. `Suggested.lean` already takes `ι : Y →ₗ[𝕜] X` (lines 319 and 334), so the README and the Lean also disagree in generality.

The smallest change: in AS-A09 write "a linear map `ι`", and in the second half of AS-B10 replace evenness by `ω(c • f, k) = ‖c‖ₑ ω(f, k)`. The first half of AS-B10 (the description of `A^s_q`) needs neither, and I checked it as stated.

## R02 (P2) — Three definitions of `Suggested.lean` have `sorry` in their bodies

The file is the acceptance test, and its definitions are meant to have real bodies. Here `lpQuasiENorm` (lines 80–82), `ApproximationScheme.approxSpace` (lines 172–174) and `embeddingCouple` (lines 325–327) each leave three proof fields as `sorry`. Everything built on them inherits the gap: `FunctionScheme` and all of AS-A14 to AS-A17 rest on `lpQuasiENorm`, the representation theorem on `embeddingCouple`, and the `Suggested.lean` of ClassicalApproximationSpaces imports all three.

The data in each is real, and I checked that the nine obligations are true: for `lpQuasiENorm`, `eLpNorm` of the zero class is `0`, `eLpNorm (c • f) = ‖c‖ₑ eLpNorm f`, and Mathlib's `eLpNorm_add_le'` gives the constant, also at `p = 0`; for `approxSpace`, `E_n(0) = 0`, `E_{2n}(f + g)` and `E_{2n+1}(f + g)` are at most `K (E_n(f) + E_n(g))` with `(2n + 2)^{s − 1/q}` comparable to `(n + 1)^{s − 1/q}` for every real `s`, and `E_n(c f) = ‖c‖ₑ E_n(f)`; for `embeddingCouple`, the infimum over preimages is homogeneous because `ι` is linear and is `K_Y`-subadditive, with `0 · ∞ = 0` at `c = 0`.

The smallest change is to prove the nine fields in place (each is a few lines from Mathlib), or, for `approxSpace`, to keep the carrier as a set and state "it is a submodule" as a theorem.

## R03 (P2) — Two headline theorems of the summary are neither stated in `Suggested.lean` nor named there as not statable

The summary (lines 13–26) lists six headline theorems. Four are stated. The `n`-term theorem (AS-A13: `f ∈ A^α_τ` with `α = 1/τ − 1/2`, `0 < τ < 2`, exactly when the coefficients lie in `ℓ_τ`) and `A^s_q = (X, A^r_τ)_{s/r,q}` (AS-B07) are absent, and the module docstring says only that the file "states some of the roadmap's targets".

AS-A13 is statable at the pins with Mathlib alone: `HilbertBasis`, `Memℓp` and the error `⨅` over finite sets `Λ` with `#Λ ≤ n` and coefficients `c` of `‖f − ∑_{i ∈ Λ} c i • b i‖ₑ`, or the roadmap's own `ApproximationScheme` once the scheme `Σ_n` is built in the norm of `H`. For AS-B07 the couple needs the dyadic quasi-norm of `A^r_τ` as a `QuasiENorm`, whose constant `K` is a datum that only AS-A06 produces.

The smallest change: state AS-A13, and either state AS-B07 with the K-functional written out (`⨅ g, N (f − g) + t * S.approxNormDyadic r τ g`) or say in the module docstring that it is not stated and what it lacks.

## C01 — The Tau Ceti declarations of the K-method that the supplier contract cites are not at the pinned Tau Ceti

"From Tau Ceti" (lines 479–482), the *Needs:* line of AS-B01 and the summary ("The K-method for Banach couples comes from Tau Ceti") cite `TauCeti.CompatibleCouple`, `CompatibleCouple.kFunctional`, `kMethod`, `kMethodENorm`, `KMethodSpace` and the files `Analysis/Normed/Interpolation/CompatibleCouple.lean`, `KFunctional.lean`, `RealMethod/Basic.lean`. At the pin of `lake-manifest.json` (Tau Ceti `2fd255d`) there is no directory `TauCeti/Analysis/Normed/Interpolation/` and no declaration whose name contains `CompatibleCouple`, so the comparison target of AS-B01 ("the same space and norm as `TauCeti.CompatibleCouple.kMethod`") cannot be written against the pin. `TauCeti.decreasingRearrangement` is there (`TauCeti/Topology/Order/DecreasingRearrangement.lean`, line 41).

The mathematical owner is correctly named: NoncommutativeIntegration §2.2 and §2.4 on main. Until the pin contains the declarations, cite those sections as the contract and say that the Tau Ceti names are later than the pin (and check the file name `RealMethod/Basic.lean` when it does).

## C02 — AS-A12 and AS-A17 cite DeVore–Popov 1988 for general schemes without saying that the source treats dyadic splines

DeVore–Popov's Theorem 5.1 (p. 408) and Corollary 5.3 (p. 409) are for dyadic splines of order `r` on the cube, for smoothness below `λ = min(r − 1 + 1/p, r)`, and Corollary 5.3 is phrased in B-spline coefficients (the passage to `‖g_k‖_p` is its Lemma 4.2). The abstract statements of AS-A12 and AS-A17 are this roadmap's generalisation by the same argument. AS-A16 and AS-B10 already say "for dyadic splines"; AS-A12 (line 203) and AS-A17 (line 260) would say the same.

## C03 — `complexity`, `eFunctional` and `eFunctional_complexity` serve no headline statement

No headline of the file mentions `complexity` or `eFunctional`; their only use is `eFunctional_complexity`, which says that two definitions agree (`complexity y ≤ n` exactly when `y ∈ A n`, by monotonicity). As a target it asks an implementer for little. If it is kept as a sanity check that the E-functional of AS-B05 specialises to `E_n`, its docstring would say so; otherwise the three belong in the README only, where AS-B05 already states the fact.

## C04 — Four headline statements give membership only, where the README claims equivalent quasi-norms

AS-A12, AS-A17, AS-B06 and AS-B10 each end "with equivalent quasi-norms" in the README, while `approxNorm_lt_top_iff_exists_blocks`, `besovENorm_lt_top_iff_exists_blocks`, `approxNorm_lt_top_iff_kMethodENorm_lt_top` and `approxNormDyadic_lt_top_iff_of_modulus` state only that one side is finite exactly when the other is. The two-sided bound is statable in the form already used for `exists_approxNorm_equiv` (`∃ C ≠ ⊤, ∀ f, … ≤ C * … ∧ … ≤ C * …`). For AS-B06 it then also needs the bound `N_X (ι y) ≤ C N_Y y` of AS-A09, which the Lean statement omits; the membership statement is true without it, since `E_1(ι y) < ∞` already forces `N (ι y) < ∞`.

## N01 — Three names in the Provenance section read as this roadmap's own declarations

`FunctionScheme.exists_uniform_inclusion_eq_of_nikolskii`, `FunctionScheme.memBesov_iff_eNormDyadic_lt_top` and `FunctionScheme.memBesov_iff_exists_blocks` (lines 434–438) are names of the external repository, but `FunctionScheme` is also a namespace of `Suggested.lean`, where none of them is declared. Say once that every name in that section is the repository's, or write them in prose.

## N02 — The eleven theorem names of `Suggested.lean` do not appear in the README

Only `eLpNorm_add_rpow_min_le` is named at its target; naming the others at AS-A02, AS-A05, AS-A12, AS-A15 to AS-A17, AS-B05, AS-B06 and AS-B10 lets a reader match prose and Lean.

## N03 — Import and docstring form

The file has `public import Mathlib` where the house form is the single line `import Mathlib`, and its docstring says that the declarations are public so that another roadmap's `Suggested.lean` imports them; a `Suggested.lean` imports only Mathlib and Tau Ceti modules. The docstring would also say that the file states the headline theorems and list those not stated (see R03).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Milestone A1: AS-A01 `ρ`-triangle, all functions | `p = 1/2`, indicators of two half intervals; non-measurable `f`; `p = 0`; `p = ∞` | `1/4, 1/4, 1`; `1 = 1/2 + 1/2`; `eLpNorm = ∞` at the pin for non-a.e.-measurable `f`, so RHS `∞`; `1 ≤ 2`; essSup subadditive | true | none |
| Milestone A1: AS-A02 Hardy | `s = 0, ρ = 1, q = ∞`, indicator of `{0..N−1}`; `q = 0`; `ρ > 1` | LHS `N`, RHS `C`; both sides `0`; reduces to `ρ = 1` | true; `s > 0` needed | none |
| Milestone A2: AS-A05 equivalence | `s = 0, q = ∞`; `s = 0, q < ∞`; `N f = ∞` | `N f` vs `[N f, 2 N f]`; block weights sum `≤ 1`, `≥ ln 2`-type; both `∞` | true | none |
| Milestone A2: AS-A06 | `f ∈ A m`; `s > 0` closure; `q = 0` in Lean | finite sum; `∑ n^{sq−1} = ∞` forces `E_n → 0`; carrier everything | true | R02 |
| Milestone A3: AS-A09 to AS-A11 | `ι(z,w) = (z, w̄)` on `ℂ²`, `A 1 = ℂ(1,1)` | `ι(i,i) = (i,−i) ∉ A 1`: `B 1` not scalar-stable | hypothesis missing | R01 |
| Milestone A3: AS-A12 blocks | near-best `b_k ∈ A(2^{k−1})`; `N f = ∞` | differences in `A(2^{k−1} + 2^{k−2}) ⊆ A(2^k)`; partial sums in `A(2^n − 1)`; both sides false | true | C02, C04 |
| Milestone A3: AS-A13 and worked example | `f = ∑ i^{−β} e_i` | `E_n ≍ n^{1/2−β}`; `ℓ_τ` iff `τβ > 1` iff `α < β − 1/2` | consistent | R03 |
| Milestone A4: AS-A15 | `p ≤ p₀`; `p ≤ r`; `C = 0`, `C = ∞` | constant `C^{p₀/p}`, exponent `D/p`; `C^{1−p/r} n^{D(1/p−1/r)}`; `a = 0`; trivial | true | none |
| Milestone A4: AS-A16 | `p = r = ∞`; `r = ∞` (`1/r.toReal = 0`); `S.A n = {0}`; non-measurable `f` | `α = 0`, trivial; `α = D/p`; RHS `∞` unless `f = 0` a.e.; RHS `∞` | true | none |
| Milestone A4: AS-A17 | non-measurable `f`; `p < 1`; `p = ∞` | both sides false; `∑|g_k|^p` integrable gives absolute convergence a.e.; uniform convergence | true | C02, C04 |
| Milestone B1: AS-B01 Check, AS-B03 endpoints | couple `(N, N)`; `L_{1/2}` pair; `θ₀ = 0`; `θ₁ = 1` | `min(1,t) N x / K ≤ K(t,x) ≤ min(1,t) N x`; `K(1, f+g) ≤ 1/2 < 1`; extra term `≤ c ·` tail term; `t^{−θ₀/λ} = t^{1−1/λ}` | true | C01 |
| Milestone B2: AS-B05, AS-B06 | `complexity y ≤ n ⇔ y ∈ A n`; `Y = 0`; `ι` unbounded | infimum attained in `ℕ`; both spaces `{N f = 0}`; `E_1(ι y) < ∞ ⇒ N(ι y) < ∞` | true | R01, C03, C04 |
| Milestone B2: AS-B07, AS-B08 | `Y = A^r_τ` | Jackson from `A^r_τ ⊆ A^r_∞`; Bernstein `(∑_{m<n} (m+1)^{rτ−1})^{1/τ} ≍ n^r` | true | R03 |
| Milestone B3: AS-B10 and its Check | `ω ≡ 0`; `s = 0`; `e_1` on `𝕋`; `t = θ`; `ω = 2^{−kθ} min(N f, 1)` | both sides `N f < ∞`; `ℓ_q` of `E_{2^j}`; `2 sin(π 2^{−k}) ≥ 4·2^{−k}`; `2^{kt − (k−j)θ} ≤ 2^{jt}`; not homogeneous | first half true; second half needs homogeneity | R01 |
| This roadmap owns | search of main and open heads for quasi-norm structures, Aoki–Rolewicz, Holmstedt, reiteration, approximation spaces, Nikolskii | no other owner; discrete Hardy on main and in HardyHilbertAndCarlemanInequalities is the averaging inequality, not the geometric-weight one | single owner | none |
| Owned elsewhere and consumed here | NoncommutativeIntegration §2.2, §2.4, §1.3; SNumbers; OperatorIdeals | K-functional and K-method for `1 ≤ q ≤ ∞` there; Bernstein numbers in SNumbers (README line 11); approximation numbers in OperatorIdeals | as stated | C01 |
| `Suggested.lean` data fields | nine `sorry` fields | each obligation computed true (see R02) | true but unproved | R02 |

- Source locators checked against the text: 6 (DeVore–Popov 1988 Theorem 5.1 with the norm `N_3`, Corollary 5.3, §5, Theorem 7.1 with `q = p` and `s = α`; Kerkyacharian–Petrushev Proposition 6.14 in arXiv:1210.6237v2; Day 1940 Theorem 1).
- Library declarations opened at the pin: 15 (among them `eLpNorm`, `LpSeminorm/Defs.lean` line 92, `∞` off a.e. strongly measurable functions; `ENNReal.LpAddConst`, `MeanInequalitiesPow.lean` line 324; `eLpNorm_add_le'`, `TriangleInequality.lean` line 74; `TauCeti.decreasingRearrangement`, line 41); 13 Mathlib names of the contract resolve with `#check`.
- Cross-roadmap citations resolved: NoncommutativeIntegration §2.2 and §2.4, SNumbers, OperatorTheory/OperatorIdeals, all on main.
- Dependency check: `depcheck: 94 roadmaps, 1055 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with 14 `sorry` warnings and nothing else (11 theorems, 3 definitions); `#check @name` types compared with the README; `lpError` and `besovENorm` do not carry `[IsFiniteMeasure μ]`, which their bodies do not need.
- One-tactic probe on a copy: none of the 11 theorems closes with `rfl`, `simp`, `simp` with the definitions unfolded, `infer_instance` or `exact eLpNorm_add_le' _ _ _`.
- Pull request text: the description says that this folder is carried from the pull request that adds it; nothing to correct for this folder.
- Overlap check: read NoncommutativeIntegration, PolynomialInterpolationAndBestApproximation, SNumbers; the Banach K-method is NoncommutativeIntegration's (§2.2, §2.4; PseudodifferentialOperators builds on the same generic objects) and is cited here; the uniform polynomial `Eₙ(f)` of PolynomialInterpolationAndBestApproximation §2.1 is a concrete distance, not the abstract scheme; Bernstein numbers are SNumbers'. Nothing has two owners.

Source independence: 7 passages compared with 3 sources (DeVore–Popov 1988, Kerkyacharian–Petrushev 2015, Day 1940), none shared; largest share Bergh–Löfström, about 8 of 23 locators, whose text and table of contents could not be read; by the section numbers the README cites, AS-B03 (§3.6) precedes AS-B04 (§3.5) and §7.1 enters at AS-B05, so no run of its sections is followed; contents compared with DeVore–Popov 1988 (§§2–7): independent.

Research link: The headline targets are Pietsch's approximation spaces (1981) and the interpolation and embedding theorems of DeVore–Popov (1988) for `p < 1`, used in nonlinear approximation (DeVore 1998) and in heat-kernel Besov theory (Kerkyacharian–Petrushev 2015); this rests on the README's references and on the DeVore–Popov and Kerkyacharian–Petrushev texts read.

## Not verifiable

- Pietsch 1981, §1 (AS-A03, AS-B06): paywalled; no legal copy found.
- DeVore 1998, §4.3 Theorems 1 and 2, Theorem 4 (AS-A13, AS-B06, AS-B07): publisher page only; no legal copy found.
- Bergh–Löfström 1976, §3.11, Lemma 3.1.3, Theorems 3.5.3, 3.6.1, 3.11.5, Definition 7.1.5 (AS-B01 to AS-B05): book, no legal copy.
- Holmstedt 1970 (AS-B03): the journal's page could not be read through the sources service.
- Kalton–Peck–Roberts 1984, Theorem 1.3 (AS-A01): book, no legal copy.
- Ditzian–Prymak 2016, Theorem 2.1 (AS-A15): paywalled; the inequality itself was recomputed.
- DeVore–Popov, LNM 1302 (AS-B07): paywalled.
- Kerkyacharian–Petrushev: Proposition 6.14 was read in the arXiv version 2; its number in the published version was not compared.
- The Lean-FunctionSpaces repository named in the Provenance section was not opened.

Automatic checks set aside as false positives: the TeX-syntax scan flags the display of Holmstedt's formula in AS-B03, which is an inline code span that runs over two lines, so the `_` and `^{…}` are inside code.

## Source issues

- none

## For the human reviewers

- **Licence.** The README's Provenance section says a large part of the roadmap is formalised in the author's own repository Lean-FunctionSpaces (Apache 2.0); `Suggested.lean` may be adapted from it. The repository was not opened or compared.
- **Not tested.** Bergh–Löfström has the largest share of the locators (about 8 of 23); its text and table of contents could not be read, so wording and arrangement were not compared against it.
