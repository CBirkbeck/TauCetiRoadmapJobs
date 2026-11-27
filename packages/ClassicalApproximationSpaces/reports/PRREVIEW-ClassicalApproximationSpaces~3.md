# Review of ClassicalApproximationSpaces (pull request #3203 at ad8e9d5)
**Verdict:** accepted

**Summary.** Accepted: no finding remains. The definition `torusTrigScheme` now has proofs in all five fields, CA-C08 carries `s > 0`, and the four small corrections of the previous review are made. The previous finding R01 (the `ρ`-subadditivity of the modulus without measurability) is withdrawn: it was wrong at the pinned Mathlib, where `eLpNorm` of a function that is not a.e. strongly measurable is `∞`, and the statement as it stands is true. There are two format notes, none blocking, and three points for the human reviewers (merge order behind #3202, the author's own formalisation as a source, one unreadable source).

## N01 — `Suggested.lean` imports `TauCetiRoadmap.ApproximationSpaces.Suggested`, the file of a roadmap that is still a pull request

Unchanged from the previous review (line 9). The folder builds only on a branch that carries that roadmap; the description says so, and the order of merging is noted for the human reviewers.

## N02 — "these declarations are on Tau Ceti `main`" names a moving branch

In the first paragraph of "From Tau Ceti" (line 761). "These declarations belong to a Tau Ceti later than the pin of this repository" says the same and stays true; Conventions 5 and 6 could carry the same clause, since they still call the Littlewood–Paley and Besov declarations "Tau Ceti's" without it.

## Previous findings

- R01 — not repaired, and rightly so; the finding is withdrawn: `modulusOfSmoothness_add_rpow_min_le` is unchanged and true. At the pin `eLpNorm f p μ = ∞` when `f` is not a.e. strongly measurable, so the Bernstein-set instance gives `∞ ≤ ∞`.
- R02 — repaired: `torusTrigScheme` (`Suggested.lean`, lines 206–236) proves `A_zero`, `mono`, `smul_mem`, `add_mem`, `finite`; it depends on `propext`, `Classical.choice`, `Quot.sound` only.
- R03 — repaired: "for `s > 0` and `0 < q ≤ ∞`, `f ∈ A^s_q(L_2, T)` if and only if …; and for `s > 0`, `A^s_2 = {f : ∑_k (1 + |k|²)^s |f̂(k)|² < ∞}`", with AS-A02 in the Needs.
- C01 — repaired: "Except `TauCeti.maximalFunction`, … these declarations are on Tau Ceti `main` and newer than the Tau Ceti pin"; PDE §2.1 is now "the Fefferman–Stein inequality for `ℓ²`".
- C02 — repaired: the module docstring has "Headline theorems not stated here", naming CA-D01–CA-D05, CA-B07 with CA-B09, CA-B08, CA-E04–CA-E06, CA-E11, CA-E13 and the carrier each lacks.
- C03 — repaired: "numbering of the journal version (arXiv v1: Lemma 1, (7), Theorem 1, Theorem 3 with (23), §5.4)"; the arXiv numbers agree with the text.
- C04 — repaired: the description now lists "PDE §1 and §2.1, Banach couples and the K-method of NoncommutativeIntegration §2.2 and §2.4".
- N01 — not repaired: the import is unchanged; written again as N01.
- N02 — repaired: "The Lean names below are declarations of that repository."
- Question on CA-B08 for `p < 1` — answered: the retract is onto sequences with Fourier support of `g_j` in the ball of radius `2^{j+1}`, where CA-B04 bounds the synthesis.
- Question on CA-A09 — answered: cubes `x + [0, L]^d`, modulus at `L/r`, `C` independent of the cube.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| CA-A03 in Lean, `modulusOfSmoothness_add_rpow_min_le` (previous R01) | Bernstein set `A`, `f = 1_A`, `g = 1_{Aᶜ}`, `r = 0`, `p = 1`; `p = 0`; `t < 0` | pin: both `eLpNorm = ∞`, so `∞ ≤ ∞`; `p = 0`: `1 ≤ 2`; empty sup: `0 ≤ 0`; proved in Lean from AS-A01's `eLpNorm_add_rpow_min_le` | true | finding withdrawn |
| CA-A03 homogeneity `ω_r(c f, t)_p = \|c\| ω_r(f, t)_p` | `f = 1_{[0,1]}`, `p = 1/2`, `c = 3`, `r = 1`; `c = 0` with `ω = ∞` | `(3^{1/2}·2h)² = 3(2h)²` both sides; `0 = 0·∞ = 0` in `ℝ≥0∞` | holds | none |
| CA-A09 on a cube `x + [0, L]^d` | affine change `y ↦ x + L y` | both sides scale by `L^{d/p}`; step `L/r` becomes `1/r`; so `C` is that of the unit cube | uniform in the cube | none |
| CA-B08 route | bump in `B(0, 2)`; `p < 1` | `Δ_j u` has spectrum in radius `2^j·2 = 2^{j+1}`; `Δ_k Δ̃_j g_j = 0` unless `\|j − k\| ≤ 2`; index splitting keeps each `g_j` whole | consistent with CA-B04 | none |
| CA-C08 with `s > 0` | `s = 1/2`, `q = 2`, `b_j = 2^{−j}`; `b_j = 2^{−js}` | `E_{2^k}² = 4^{−k}/3`, `∑ 2^k 4^{−k} < ∞` and `∑ 2^j 4^{−j} < ∞`; second: both sums `∑ c = ∞` | iff holds | none |
| CA-C08, `A^s_2` | exchange of sums | `∑_k 2^{2ks} ∑_{j>k} b_j² = ∑_j b_j² ∑_{k<j} 2^{2ks} ≍ ∑_j 2^{2js} b_j²`, geometric for `s > 0` only | holds | none |
| `torusTrigPoly_mono` | `m = 0`; `d = 0` | span of `∅` is `⊥ ≤` anything; `d = 0`: constants for every `n`, equal | holds; not closed by `simp` | none |
| `torusTrigScheme` | `A 0`; `A_m + A_n`, `m = 0` or `n = 0`; `d = 0` | `A 0 = {0}` by `rfl`; `{0} + A_n = A_n`; else `T_m + T_n ⊆ T_{m+n}` by monotonicity | proved, no `sorry` | none |
| CA-C04, CA-C06 in Lean (cite `torusTrigScheme`) | elaborated types | unchanged from the previous head; hypotheses `1 ≤ r`, `0 < p`, `0 < s < r`, `0 < q`, `MemLp f p` in scope | agree with README | none |
| Oswald 2021 locators | arXiv v1 | Theorem 1 (line 56), Lemma 1 (260), (7) (285), Theorem 3 (610), (23) (628), §5.4 (1573) | agree | none |

The rows of the previous review for untouched statements stand as in that review, of `c9ff56f`.

- Source locators checked against the text: 6 (Oswald2021 lines 56, 260, 285, 610, 628, 1573).
- Library declarations opened at the pin: Mathlib `MeasureTheory.eLpNorm` (`MeasureTheory/Function/LpSeminorm/Defs.lean:92`, value `∞` off a.e. strongly measurable functions), `eLpNorm_of_not_aestronglyMeasurable` (same file, 101), `eLpNorm_add_le'` (`LpSeminorm/TriangleInequality.lean:74`, no measurability hypothesis), `lintegral` (`Integral/Lebesgue/Basic.lean:48`), `ENNReal.le_rpow_inv_iff` (`Analysis/SpecialFunctions/Pow/NNReal.lean:812`).
- Cross-roadmap citations resolved: the 13 `AS-…` labels at this head of the ApproximationSpaces folder, AS-A02 (`s > 0`, `ρ > 0`, `0 < q ≤ ∞`) read for CA-C08.
- Dependency check: `depcheck: 94 roadmaps, 1056 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives eight `declaration uses sorry` warnings (the eight sorried theorems) and nothing else. `#check @name` on the declarations the change touches or that cite them: types equal their README statements; no section variable lost.
- One-tactic probe: `torusTrigPoly_mono` does not close with `simp`; the subadditivity of the modulus needs the supplier inequality and a supremum argument (about twenty lines), so neither is padding.
- Changes outside the two folders of the pull request: none.
- Pull request text: read against this head; nothing contradicted.

Overlap check: read ApproximationSpaces, PolynomialInterpolationAndBestApproximation, PseudodifferentialOperators; Bernstein's inequality for trigonometric polynomials is shared with PolynomialInterpolationAndBestApproximation §4.1, which owns the real, one-variable, uniform-norm case, and this roadmap the `L_p(𝕋^d)` statement for every `p`; the modulus of continuity stays with §5.1 there; the K-method for `q ≥ 1` stays with NoncommutativeIntegration §2.4; nothing else shared.

Source independence: changed passages only: 8 passages compared with 1 readable source (Oswald 2021), none shared; the layers are unchanged, so the arrangement was not compared again; largest share Kolomoitsev–Tikhonov 2020, about 14 of about 75 locators, as in the previous review. DeVore–Popov 1988 could not be read.

Research link: CA-A05, CA-C09 and CA-D02–CA-D05 state results of Kolomoitsev–Tikhonov (2020); CA-E07, CA-E11 and CA-E13 those of Oswald (2018, 2021) on Haar systems in Besov spaces for `p < 1`; CA-E06 and CA-E10 DeVore–Popov (1988). Rests on the sources read, except DeVore–Popov, which rests on the README.

## Not verifiable

- The journal numbering of Oswald 2021 (Lemma 2.1, (2.3), Theorem 1.1, Theorem 3.1 with (3.13)): Sb. Math. is not open; only the arXiv v1 numbering was checked.
- That the 18 Tau Ceti declarations of the contracts exist in a Tau Ceti later than the pin: no later Tau Ceti was available to open.
- Storozhenko–Oswald 1978, Theorems 1 and 2 (the class of polynomials on the cube in CA-A09), Bergh–Löfström 5.6.1 and Triebel 1983, 2.4.2 (the route of CA-B08): no open copy; cited by locator only.
- DeVore–Popov 1988 and the other texts listed in the previous review: unchanged.

Automatic checks set aside as false positives: the report of TeX-only syntax in CA-D08 (the formula is inside a code span that runs over two lines, so it is already code).

## Source issues

- none

## For the human reviewers

- **Merge order.** `TauCetiRoadmap/ClassicalApproximationSpaces/Suggested.lean` line 9 imports the ApproximationSpaces file of #3202, and the branch carries those commits; this folder cannot merge before #3202.
- **Licence.** The README's Provenance section and the description say the text was drafted from the blueprint of Lean-FunctionSpaces (the author's own repository, stated Apache 2.0). I did not open it, so the Lean statements were not compared with it.
- **Not tested.** DeVore–Popov 1988 (about 12 of 75 locators, second-largest share) could not be read: wording and arrangement were not compared with it.
