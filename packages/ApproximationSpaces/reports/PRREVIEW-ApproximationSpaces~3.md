# Review of ApproximationSpaces (pull request #3202 at 8f70654)

**Verdict:** accepted

**Summary.** Accepted: the three findings of the previous review are repaired and no new finding arose. AS-B10 now assumes the modulus homogeneous and AS-A09 takes `ι` linear, so the couples of AS-B06 and AS-B10 are couples of quasi-norms in the sense of AS-A01; no definition of `Suggested.lean` contains `sorry`; and the two missing headline theorems (AS-A13, AS-B07) are stated and survive the adversarial pass. There are no small corrections and one format note, not blocking; one reuse fact and one untested source are left for the human reviewers.

## N01 — The header of `Suggested.lean` is still `module` / `public import Mathlib` with `@[expose] public section`, and its docstring (lines 19–20) still says the `Suggested.lean` of ClassicalApproximationSpaces imports this file

The house form is the single line `import Mathlib`, and a roadmap's Lean file imports no other roadmap's module, so the sentence describes an arrangement the sibling roadmap cannot keep. Dropping the sentence, and the `public` header with it, would bring the file into the house form; nothing mathematical depends on it.

## Previous findings

- R01 — repaired: AS-B10 reads "If moreover `ω(c f, k) = ‖c‖ ω(f, k)` for every scalar `c`"; AS-A09 reads "For a linear map `ι : Y → X`", which AS-B06 cites.
- R02 — repaired: `lpQuasiENorm` and `embeddingCouple` carry proofs of all three fields; `approxSpace` is the set `{f | S.approxNorm s q f < ⊤}`. The file elaborates with no `sorry` inside a definition.
- R03 — repaired: `approxNorm_lt_top_iff_memℓp_repr` (AS-A13) and `approxNorm_lt_top_iff_kMethodENorm_approxNormDyadic` (AS-B07) are stated, and the module docstring lists both.
- C01 — repaired: AS-B01 and the Tau Ceti contract say the `CompatibleCouple` declarations are "on Tau Ceti `main`, newer than the Tau Ceti pin of this repository", with NoncommutativeIntegration §2.2 and §2.4 as their specification.
- C02 — repaired: "the Littlewood–Paley Besov spaces for `p < 1` or `q < 1` … belong to ClassicalApproximationSpaces; PDE §7.1–7.2 owns the Littlewood–Paley Besov spaces for `1 ≤ p, q ≤ ∞`."
- C03 — repaired: "Kerkyacharian–Petrushev 2015, Proposition 6.14, for `r < ∞`".
- N01 — repaired: Holmstedt's formula in AS-B03 is an indented code block.
- N02 — repaired: the Provenance section says "The Lean names below are declarations of that repository … and differ from the declarations of `Suggested.lean`."
- N03 — not repaired: `public import Mathlib`, `@[expose] public section`, and "so that the `Suggested.lean` of ClassicalApproximationSpaces imports and uses them" remain (N01 above).
- N04 — repaired: the dyadic step of AS-B02 is `κ`.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| AS-B10 interpolation part, homogeneous `ω` | previous witness `ω = 2^{−kθ} min(N f, 1)`; `c = 0`; `c = 2` | witness: `ω(2f) = 2^{−kθ}` vs `2·2^{−kθ}` at `N f = 1`, now excluded; `ω(0,k) ≤ C N 0 = 0`; functional doubles under `c = 2` | a quasi-norm of AS-A01 (constant from the `ρ`-subadditivity) | none |
| AS-B06 with `ι` linear / `embeddingCouple` | `c = 0`; `c ≠ 0`; `x ∉ range ι` | `N₁ 0 ≤ N_Y 0 = 0`; `N₁(c x) = ‖c‖ N₁ x` via `y ↦ c⁻¹ y`; `inf ∅ = ⊤`, `‖c‖·⊤ = ⊤` for `c ≠ 0` | fields proved in the file, elaborated | none |
| `lpQuasiENorm` fields | `p = 0`, `p < 1`, `p = ∞` | `K = max 1 (LpAddConst p)`; `LpAddConst p < ⊤` used for the coercion | proved in the file, elaborated | none |
| `approxSpace` as a set | `A n = {0}`, `s > 0` | `∑ (n+1)^{sq−1} = ∞`, so the set is `{f | N f = 0}` | consistent with AS-A06 | none |
| AS-A13 / `approxNorm_lt_top_iff_memℓp_repr` | `ι = ∅`; `ι` finite; `f = ∑ i^{−β} e_i`; `n = 0` | `H = 0`, both true; `A n = H` for `n ≥ #ι`, both true; `E_n ≍ n^{1/2−β}`, weight `(n+1)^{−1/2}`: `∑ n^{−τβ} < ∞` iff `τβ > 1` iff `ℓ_τ`; `A 0 = {0}` ✓ | true; `rfl`/`simp` do not close it | none |
| AS-B07 / `approxNorm_lt_top_iff_kMethodENorm_approxNormDyadic` | `A n = {0}`; `N f = ⊤`; `τ = ∞`; is `NY` inhabited | LHS iff `N f = 0`; `NY x₁ < ⊤` forces `N x₁ = 0`, `K(t,f) ≍ N f`, RHS iff `N f = 0`; `N f = ⊤`: `E_n = ⊤`, `K = ⊤`, both false; dyadic norm is homogeneous with `E_{2^{k+1}}(f+g) ≤ K(E_{2^k}f + E_{2^k}g)` | true, not vacuous; `rfl`/`simp` do not close it | none |
| AS-A16 citation, `r < ∞` | `r = ∞` | Proposition 6.14 assumes the larger exponent finite; the README no longer cites it for `r = ∞` | consistent | none |
| AS-B02 with `κ` | `κ = 1` | `‖(2^{kθ} K(2^{−k}, x))_{k∈ℤ}‖`, Bergh–Löfström Lemma 3.1.3 | unchanged mathematics | none |

The rows for the untouched statements stand as in the previous review, of `9e69b58`.

- Source locators checked against the text: the two the change touches (Kerkyacharian–Petrushev Proposition 6.14; DeVore 1998 Theorem 4 and §4.3 Theorem 2 for the two new Lean statements), against the readings recorded in the previous review; no new locator was added.
- Library declarations checked at the pin: no file or declaration `CompatibleCouple`, `KMethodSpace` in the pinned Tau Ceti (rev `2fd255d`), as the README now says; `HilbertBasis.repr`, `Memℓp`, `eLpNorm_add_le'`, `ENNReal.LpAddConst_lt_top`, `ENNReal.mul_iInf_of_ne` used by the file and elaborated.
- Cross-roadmap citations resolved on main: PDE §7.1 and §7.2 (headings present), NoncommutativeIntegration §2.2 and §2.4.
- Elaboration: `Suggested.lean` elaborates; the only warnings are `sorry` on its 13 theorems. Signatures of the three changed or added declarations compared with the README (AS-A06, AS-A13, AS-B07): they agree. `lpError` and `besovENorm` do not carry `[IsFiniteMeasure μ]`, which their bodies do not need (as before).
- One-tactic probe (`rfl`, `simp`, `simp` with the definitions unfolded, `infer_instance`) on the two new theorems: none closes.
- Dependency check: `depcheck: 94 roadmaps, 1055 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changes outside the roadmap folder.
- The pull request's title and description agree with this head (a new roadmap, one folder, the supplier NoncommutativeIntegration §2.2 and §2.4).
- Ownership against open pull requests: the two new declaration names occur in no other roadmap's `Suggested.lean`; the pull request of ClassicalApproximationSpaces carries the same copy of this folder and merges cleanly with this one.

Overlap check: read ClassicalApproximationSpaces, NoncommutativeIntegration, SNumbers, PolynomialInterpolationAndBestApproximation; the Banach K-method for `1 ≤ q ≤ ∞` is owned by NoncommutativeIntegration §2.2 and §2.4 (cited); approximation and Bernstein numbers by SNumbers and OperatorIdeals; Littlewood–Paley Besov spaces for `1 ≤ p, q ≤ ∞` by PDE §7.1–7.2 (now cited); nothing this roadmap owns is owned elsewhere.

Source independence: changed passages only; 6 changed passages (AS-A09, AS-A16, AS-B01, AS-B02, AS-B10, the two new docstrings) compared with 3 sources (Bergh–Löfström, DeVore 1998, Kerkyacharian–Petrushev), none shared; largest share Bergh–Löfström, 7 of 23 locators; the change adds, removes or reorders no layer, so the contents comparison stands: independent. DeVore–Popov 1988 (5 locators) could not be read.

Research link: the headline targets are Pietsch's approximation spaces (1981), the DeVore–Popov interpolation and block-decomposition theorems (1988) and the `n`-term characterisation in DeVore's survey (1998, Theorems 1, 2, 4); Kerkyacharian–Petrushev (2015) use the same Nikolskii embedding. Rests on the README's references and the three texts read.

## Not verifiable

- Pietsch 1981; DeVore–Popov 1988 (Trans. Amer. Math. Soc. and Lecture Notes in Math. 1302); Holmstedt 1970; Kalton–Peck–Roberts Theorem 1.3; Day 1940: no legal copy was readable in the previous review, and the change touches none of their locators.
- That the five `CompatibleCouple` declarations are on the library's main branch: read there in the previous review, not read again; at the pin they are absent, as the README says.
- Whether the cited repository is free of `sorry`, as the Provenance section says: not checked.

Automatic checks set aside as false positives: the TeX-syntax scanner flags the second line of Holmstedt's formula in AS-B03, which is inside an indented code block (its leading `+` is read as a list marker); the undeclared-name scanner flags three `FunctionScheme.…` names of the Provenance section, which the text now says are declarations of the cited repository and not of `Suggested.lean`.

## Source issues

- none

## For the human reviewers

- **Licence / reuse.** `eLpNorm_add_rpow_min_le` in `TauCetiRoadmap/ApproximationSpaces/Suggested.lean` (line 67) has the name of a declaration in `mario-ullrich/Lean-FunctionSpaces`, `FunctionSpaces/Analysis/Lp/QuasiNorm.lean` (Apache-2.0, the pull request author's repository); the README's Provenance section cites it.
- **Not tested.** DeVore–Popov 1988, five of 23 locators, could not be read; wording and arrangement were not compared with it.
