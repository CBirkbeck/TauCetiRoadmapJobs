# Review of ApproximationSpaces (pull request #3203 at bf314fd)

**Verdict:** accepted

**Summary.** Accepted: the three findings of the previous review are repaired and the repairs introduce no new problem. `ι` is now linear and the modulus of AS-B10 homogeneous, no definition of `Suggested.lean` contains `sorry`, and the two missing headline theorems (AS-A13 and AS-B07) are stated; both new statements were recomputed and are true as written. There are three small corrections and three format notes, all carried from the previous review and none blocking; the human reviewers have the same licence question and the same note on sources that could not be read.

## C01 — AS-A12 and AS-A17 still cite DeVore–Popov 1988 for general schemes without saying that the source treats dyadic splines

Theorem 5.1 and Corollary 5.3 of DeVore–Popov are for dyadic splines of order `r` on the cube, and Corollary 5.3 is phrased in B-spline coefficients. The abstract statements of AS-A12 (line 203) and AS-A17 (line 260) are this roadmap's generalisation by the same argument. AS-A16 and AS-B10 say "for dyadic splines" and "for splines"; the same two words at AS-A12 and AS-A17 would do.

## C02 — `complexity`, `eFunctional` and `eFunctional_complexity` serve no headline statement

Their only use in `Suggested.lean` is `eFunctional_complexity` (line 329), which says that two definitions agree (`complexity y ≤ n` exactly when `y ∈ A n`). If it is kept as a sanity check that the E-functional of AS-B05 specialises to `E_n`, its docstring would say so.

## C03 — Six headline statements give membership only, where the README claims equivalent quasi-norms

AS-A12, AS-A13, AS-A17, AS-B06, AS-B07 and AS-B10 each end "with equivalent quasi-norms" in the README, while the Lean statements (among them the two new ones, `approxNorm_lt_top_iff_memℓp_repr` and `approxNorm_lt_top_iff_kMethodENorm_approxNormDyadic`) say only that one side is finite exactly when the other is. The two-sided bound is statable in the form of `exists_approxNorm_equiv` (`∃ C ≠ ⊤, ∀ f, … ≤ C * … ∧ … ≤ C * …`); for AS-B06 it then also needs the bound `N_X (ι y) ≤ C N_Y y` of AS-A09.

## N01 — The thirteen theorem names of `Suggested.lean` do not appear in the README

Only `eLpNorm_add_rpow_min_le` is named at its target; naming the others at their targets (AS-A02, AS-A05, AS-A12, AS-A13, AS-A15 to AS-A17, AS-B05 to AS-B07, AS-B10) lets a reader match prose and Lean.

## N02 — Import and docstring form

The file has `module` and `public import Mathlib` where the house form is the single line `import Mathlib`, and its docstring says that the declarations are public so that another roadmap's `Suggested.lean` imports them. The docstring also still says the file "states some of the roadmap's targets"; all six headline theorems of the summary are now stated, and it would say so.

## N03 — "On Tau Ceti `main`, newer than the Tau Ceti pin of this repository" dates the text

The sentence (AS-B01, line 293, and the Tau Ceti contract, line 490) is true only until the pin moves. A timeless form: "not at the Tau Ceti pin; NoncommutativeIntegration §2.2 and §2.4 specify them".

## Previous findings

- R01 — repaired: AS-A09 now reads "For a linear map `ι : Y → X`", and AS-B10 "If moreover `ω(c f, k) = ‖c‖ ω(f, k)` for every scalar `c`"; both earlier counterexamples are excluded (rows below).
- R02 — repaired: `lpQuasiENorm` and `embeddingCouple` prove their three fields, and `approxSpace` is the set `{f | S.approxNorm s q f < ⊤}`; the file elaborates and neither definition depends on `sorryAx`.
- R03 — repaired: `approxNorm_lt_top_iff_memℓp_repr` (AS-A13) and `approxNorm_lt_top_iff_kMethodENorm_approxNormDyadic` (AS-B07) are stated; the module docstring lists both.

The earlier small correction on the Tau Ceti K-method names is repaired in substance (the README says they are not at the pin and names NoncommutativeIntegration §2.2 and §2.4 as their specification; see N03 for the wording), and the earlier note on the repository's names in the Provenance section is repaired by the sentence added there. The other earlier corrections and notes are C01 to C03, N01 and N02 above.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| AS-A09, AS-A11 with linear `ι` | `ι(z, w) = (z, w̄)` on `ℂ²`; `c = 0`; injective `ι` | not `ℂ`-linear, excluded; `ι(c y) = c ι y ∈ A n`, so `B n` scalar-stable; `B 0 = ι⁻¹{0} = {0}` | `B` is a scheme | none |
| AS-B10, second half with homogeneity | `ω = 2^{−kθ} min(N f, 1)`; `c = 0`; `ρ < 1` | `ω(2f) = ω(f) ≠ 2ω(f)` at `N f = 1`, excluded; `ω(0, k) ≤ C N 0 = 0`; quasi-triangle constant `2^{1/ρ − 1}` | `N f + sup_k 2^{kt} ω(f, k)` is a quasi-norm of AS-A01 | none |
| `lpQuasiENorm` fields | `p = 0`; `p = 1/2`; `p = ∞` | `0 = ‖c‖ₑ · 0`, `K = 1`; `K = max(1, 2) = 2`; `K = 1` | proved, elaborates | none |
| `embeddingCouple` fields | `c = 0`; `x ∉ range ι`; `ι = 0` | `0 = 0 · inf`; `inf ∅ = ∞ = ‖c‖ₑ · ∞` for `c ≠ 0`; `N₁ 0 = 0`, `∞` elsewhere | proved, elaborates | none |
| `approxSpace` as a set | `q = 0` | `eLpNorm … 0 = 0`, carrier everything | real body | none |
| AS-A13 in Lean (`approxNorm_lt_top_iff_memℓp_repr`) | `c*_k = k^{−β}`; `ι` empty; `ι` finite; exponent | `E_n ≍ n^{1/2 − β}`, `∑ n^{−τ/2} E_n^τ = ∑ n^{−τβ}`, finite iff `τβ > 1` iff `ℓ_τ`; both sides true; `E_n = 0` for `n ≥ #ι`, both true; `α − 1/τ = −1/2`; `hS` gives `A 0 = {0}` | true | C03 |
| AS-B07 in Lean (`…_kMethodENorm_approxNormDyadic`) | `N f = ∞`; `A n = {0}` for all `n`; Jackson and Bernstein for `Y = A^r_τ`; `τ = ∞` | both sides `∞` (`N_Y ≥ N` forces `K(t, f) = ∞`); both finite iff `N f = 0` (`K(t, f) ≥ N f / K_N`); `E_n ≤ C n^{−r} ‖f‖_{A^r_∞}`, `N a + (∑_{2^k < n} 2^{krτ})^{1/τ} N a ≍ n^r N a`; sup in place of sum | true | C03 |
| AS-A16 locator, "for `r < ∞`" | Kerkyacharian–Petrushev, Proposition 6.14 | hypotheses there: `0 < p ≤ p₁ < ∞`, `0 < q ≤ q₁ ≤ ∞`, `s/d − 1/p = s₁/d − 1/p₁` (KerkyacharianPetrushev2015 line 3528) | the qualification is right | none |
| AS-B02 with `κ` | `t = 2^{−kκ}` | `t^{−θ} = 2^{kκθ}`; `κ` no longer collides with `ρ = min(1, p)` of Convention 1 | true | none |
| Scope: Littlewood–Paley Besov spaces | PDE §7.2 on main; ClassicalApproximationSpaces Part B | PDE §7.2 defines `B^s_{p,q}(ℝ^d)` for `1 ≤ p, q ≤ ∞` (PDE README line 3016); ClassicalApproximationSpaces takes `p < 1` or `q < 1` | one owner each | none |

The rows for the untouched statements stand as in the previous review, of `c9ff56f`.

- Source locators checked against the text: 1 (Kerkyacharian–Petrushev, Proposition 6.14, arXiv version 2).
- Library declarations opened at the pin: the pinned Tau Ceti has no `CompatibleCouple` and no `Analysis/Normed/Interpolation/`, as the README now says; `HilbertBasis.repr` and `Memℓp` resolve in the new statement.
- Cross-roadmap citations resolved: PDE §7.1–7.2 and NoncommutativeIntegration §2.2, §2.4, on main.
- Dependency check: `depcheck: 18 roadmaps, 214 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with 13 `sorry` warnings, all on theorems, and nothing else; `#print axioms` of `lpQuasiENorm` and `embeddingCouple` gives `propext`, `Classical.choice`, `Quot.sound`; the types of the two new theorems and of `approxSpace` were compared with the README by `#check @name`. `lpError` and `besovENorm` do not carry `[IsFiniteMeasure μ]`, which their bodies do not need.
- One-tactic probe on a copy: neither new theorem closes with `rfl`, `simp`, `simp` with the definitions and hypotheses unfolded, or `infer_instance`.
- Pull request text: the description concerns ClassicalApproximationSpaces and says this folder is carried from the pull request that adds it; that holds at this head (the folder's two commits touch nothing else, and nothing outside the two folders changes).
- Overlap check: read NoncommutativeIntegration, SNumbers, PolynomialInterpolationAndBestApproximation (and PDE §7.2, newly cited); the Banach K-method is NoncommutativeIntegration's (§2.2, §2.4) and is cited; Bernstein and approximation numbers are SNumbers'; the uniform polynomial `Eₙ(f)` of PolynomialInterpolationAndBestApproximation §2.1 is a concrete distance; the Besov spaces for `1 ≤ p, q ≤ ∞` are PDE's. Nothing has two owners.

Source independence: changed passages only: 2 passages compared with 1 source (Kerkyacharian–Petrushev 2015), none shared; the other added sentences describe libraries and roadmaps, not sources; largest share Bergh–Löfström, about 8 of 23 locators, whose text and table of contents could not be read; the arrangement was not compared again, since the change adds, removes and reorders no layer.

Research link: The headline targets are Pietsch's approximation spaces (1981) and the interpolation and embedding theorems of DeVore–Popov (1988) for `p < 1`, used in nonlinear approximation (DeVore 1998) and in heat-kernel Besov theory (Kerkyacharian–Petrushev 2015); this rests on the README's references and on the DeVore–Popov and Kerkyacharian–Petrushev texts read.

## Not verifiable

- That the `CompatibleCouple` declarations and their three files exist on Tau Ceti's main branch: only the pin was read, and they are not there.
- Pietsch 1981, §1 (AS-A03, AS-B06): paywalled; no legal copy found.
- DeVore 1998, §4.3 Theorems 1 and 2, Theorem 4 (AS-A13, AS-B06, AS-B07): publisher page only; the new Lean statements of AS-A13 and AS-B07 were recomputed instead.
- Bergh–Löfström 1976, Holmstedt 1970, Kalton–Peck–Roberts 1984, Ditzian–Prymak 2016, DeVore–Popov LNM 1302: as in the previous review, no legal copy read.
- Kerkyacharian–Petrushev: Proposition 6.14 was read in the arXiv version 2; its number in the published version was not compared.
- The Lean-FunctionSpaces repository named in the Provenance section was not opened.

Automatic checks set aside as false positives: the TeX-syntax scan flags the display of Holmstedt's formula in AS-B03, which is an indented code block; the scan for names presented as this roadmap's own flags three names of the Provenance section, which now says that every name there is a declaration of the external repository.

## Source issues

- **Misprint** in KerkyacharianPetrushev2015 at Proposition 6.14, proof (arXiv version 2, p. 52): the source says the proof starts from an element of the target space of the embedding; it should be an element of the smaller space, whose norm bounds the other; affects nothing.

## For the human reviewers

- **Licence.** The README's Provenance section says a large part of the roadmap is formalised in the author's own repository Lean-FunctionSpaces (Apache 2.0); `Suggested.lean` may be adapted from it. The repository was not opened or compared.
- **Not tested.** Bergh–Löfström has the largest share of the locators (about 8 of 23); its text and table of contents could not be read, so wording and arrangement were not compared against it.
