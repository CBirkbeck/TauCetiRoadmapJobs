# Review of ReLUNetworkExpressivity (pull request #2674 at e283cc2)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was recomputed (degenerate depths and widths, the Radon pairing of 2.1, the constants of 5.2, 5.3, 6.1 and 6.3) and every locator of the five readable sources was read at its place; all agree with the text, and the three source slips the README records are real. There are one small correction and two format notes, none blocking, and one question on the layer convention behind the separation theorem. Two points are left to the human reviewers (scope of the subject, and an unpublished set of lecture notes among the sources).

## C01 — The Check of 2.3 restricts "cannot be lowered to `n`" to `n ≥ 3`, although the roadmap's own Checks give it for `n = 1` and `n = 2`

A reader of the Check in 2.3 (line 266, "For `n ≥ 3` it cannot be lowered to `n` either") will take `n = 2` to be open or false. It is neither: a combination of maxima of two affine maps is `ℓ₂ + σ(ℓ₁ − ℓ₂)` summed, a one-hidden-layer network up to an affine term, and the Check of 3.2 (line 313) already says that `max(0, x₁, x₂)` has no such network; `n = 1` is the first sentence of the same Check. Hertrich et al., Proposition 3.1, is stated for `n ≥ 3` (HBS+21 line 651), so the locator is right for that range only.

The smallest change: "It cannot be lowered to `n` for any `n ≥ 1`: for `n = 1` by the previous sentence, for `n = 2` by the Check of 3.2, and for `n ≥ 3` by Hertrich et al., Proposition 3.1, p. 16."

## N01 — The heading of Layer 4 in `Suggested.lean` differs from the README's

`Suggested.lean` line 86 reads "Layer 4: breakpoints of univariate networks"; the README has "Layer 4: affine pieces of univariate networks". One title for both.

## N02 — Several Checks report a run on random inputs instead of a value a reader can recompute

The third Check of 2.1, the third of 4.2, the second of 4.3 ("300 random continuous functions … to `3 · 10⁻¹²` by least squares"), the third of 5.1, the third of 6.1 and the second of 6.2 record experiments on random samples; none can be repeated from the text, and the one in 4.3 reports a floating-point residual for an identity that is exact. Each would test more as one explicit instance with its value (for 4.3, say, the tent map written with the four units `σ(x − 1)`, `σ(−x)`, `σ(1/2 − x)`, `σ(1 − x)` and their coefficients).

## Questions for the author

- In 5.3 the separation is stated for depth at most `L`, that is at most `L − 1` hidden layers. Telgarsky's lecture notes say on p. 4 that `L` counts affine layers (Ano line 164), but their Lemma 5.1 gives all `L` layers widths `(m₁, …, m_L)` and the proof of Theorem 5.1 uses `(2 · 2^L/L)^L` pieces (Ano lines 1719, 1815), which reads as `L` hidden layers. Is the theorem with `L` hidden layers (depth `L + 1` here) intended to be in scope? I could not settle which convention the notes mean. For what it is worth: counting `2^(−m−2)` for the inner intervals of 5.2 instead of `2^(−m−3)` gives `∫ ≥ (2^(m−1) − 2 − 2|s|)/2^(m+2)`, and with `|s| + 1 ≤ (2^L/L + 1)^L` this is at least `1/32` for `L = 2` (`9` pieces, `28/512`) and `L = 3` (`928/8192`); for `L = 1` this route gives nothing.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `reluSpec`, `ReLUNetComputes`, depth convention | `L = 0`; `L = 1`; hidden widths `(1, 0)`; `n = 0` | `L = 0`: `d 0 = n` and `d 0 = 1` force `n = 1`, realize is identity. `(1,0)`: output is the bias. | agrees with Checks | none |
| 1.1 Check `max(x₁,x₂) = σ(x₁−x₂)+σ(x₂)−σ(−x₂)` | `(−1,2)`, `(3,−5)` | `0+2−0 = 2`; `8+0−5 = 3` | true | none |
| 1.1 composition, sums, padding | `L₁ = L₂ = 1`; Arora D.1 | depth `1+1−1 = 1` (affine∘affine); D.1 gives `k₁+k₂+1 = L₁+L₂−1` | true | none |
| 1.2 selection characterization | Heaviside; `n = 0`; `ℓᵢ − ℓⱼ` a nonzero constant | Heaviside selects from `{0,1}`, not continuous; constant difference gives empty "hyperplane", harmless | true | none |
| 1.2 claim about `Finset.isPLOn_infAffine` | read proof at pin | proof builds the global cover with `isPiecewiseAffineOn_of_finite` then applies `.isPLOn` | as described | none |
| 1.3 networks are piecewise affine | depth `0`, `1`; tent | identity (coordinate), affine; cells `(−∞,0],[0,½],[½,1],[1,∞)` | true | none |
| 2.1 integer combination, Radon route | `p ≤ n+1`; `n = 0`; repeated maps; toggle of `u` | for `u ∉ W`: `max_{∉W} = max(ℓ_u, max_{∉W∪u})` and `ℓ_u ≤ max_{∉U} ≤ max_{∉W∪u}`, so equal; `W = U` leaves `Uᶜ ≠ ∅` | true | none |
| 2.1 Checks | `x = 2, −1, ½`; `ℓ₂ = −5` at `x = 0` | LHS/RHS `1/1`, `1/1`, `0/0`; identity holds on all three ranges of `x`; `0 + (−1) + 5 = 4` vs `0` | true | none |
| 2.2 convex case and `g = f + h` | `f = −|x|`; redundant cell `{0}` with `5x`; `q = 1` | `h = |x|`, `g = 0`; `max(|x|, 5x)(1) = 5 ≠ 1`; `q = 1`: `h = 0`, `f` affine | true | none |
| 2.3 Wang–Sun | `n = 0`; `k = 0`; tent | constant `c`; empty sum gives `f = 0`; `2σ(x) − 4σ(x−½) + 2σ(x−1)` matches four maxima | true | C01 on the `n ≥ 3` remark |
| 3.1 maxima, `Nat.clog` | `k = 0, 2`; `n = 0..4` | widths `6, 3`; `clog 2 (n+1) = 0,1,2,2,3` (decided in Lean) | true | none |
| 3.2 exact representation | `n = 0`, `L = 1`; `n = 2` depth 2 | constants at depth 1; `max(0,x₁,x₂)` breakpoints three half-lines vs union of lines | true | none |
| 4.1 `AffineOffFinset` | `s = ∅`; Heaviside; tent with two points | `∅` iff affine (intervals `(−N, N)`); Heaviside affine off `{0}`; tent needs `{0,½,1}` | true | none |
| 4.2 piece count | `L = 0, 1`; widths `(1,0)`, `(0,0)`; `k = 3` example; `Δ^m` | product `1`, `s = ∅`; `2·1 = 2 > 0`; slopes `0,1,−1,2`; `2^m+1 < 4^m` for `m ≥ 1` | true | none |
| 4.3 one hidden layer | `g = x`, `s = ∅`; `|x|+1` with linear output; `σ(−x)` | `aσ(wx+b)+c ≠ x`; two units: both kink at 0 give value 0 at 0, else a zero slope; slopes `r`, `∑_{i>j} tᵢ` solvable | true | none |
| 5.1 tent, closed form, width-3 network | `Δ(¼), Δ(¾), Δ(1), Δ(3/2), Δ(−1)`; `Δ²(¼), Δ²(½)`; `x = 1`; `m = 0` | `½, ½, 0, 3−4+1 = 0, 0`; `1, 0`; `⟨2^(m−1)⟩ = 0` gives `0`; identity | true | none |
| 5.2 counting lemma | `m = 0`; `m = 2, s = ∅`; `m = 6, |s| = 15`; integrability | `−2|s|/8 ≤ 0`; `1/32 ≤ ¼`; `25/128 ≥ 1/512`; `g` bounded on `[0,1]` off finitely many points; wrong intervals `≥ 2^(m−1) − |B|` | true | none |
| 5.3 separation | `L = 0, 1, 2`; `L = 3, 4, 5` | `1/32`, `3/64`, `23/512`; `(2^(L²)+1)/2^(L²+5) ≥ 1/32`; products `25, 252, 6561` vs `256, 32768, 2^24` | true | question on the convention |
| 6.1 `yarotskyApprox` | `m = 0`; `m = 1` at `½, ¼`; `x = 2, −1` | `x − x² ≤ ¼`; `¼ = (½)²`; `⅛ − 1/16 = 1/16 = 4^(−2)`; `f₂(2) = 2`, `f₂(−1) = −1` | true | none |
| 6.2 width-5 network | `m = 0`; recursion | identity; `a_(i+1) = aᵢ − Δ^i/4^i`, output `a_m − Δ^m/4^m = f_m` | true | none |
| 6.3 multiplication | `M = 1, m = 0, (1,−1)`; `x = M/2^m, y = −x`; `F(x,0)` | `−2` vs `−1`; errors `0, 4^(−(m+1)), 4^(−(m+1))` give `−M²/4^m`; `f_m(0) = 0` and cancellation; `2M² · 2 · 4^(−(m+1)) = M²/4^m` | true | none |
| Yarotsky (4) factor | polarization | `xy = 2M²(u² − a² − b²)`; printed `M²/8` gives `xy/16` (Yar16 line 367) | README right | none |

- Source locators read at the text: 42 in five sources (ABM+16 13, HBS+21 12, Ano 7, Yar16 6, Tel16 4), all at the stated theorem and page.
- Library declarations opened at the pins: Tau Ceti `Geometry/Neuromanifold/MLP/Basic.lean` (`MLPSpec` l. 58, `layerActivation_castSucc` l. 108, `evalPrefix_succ` l. 131, `realize` l. 171, `realize_depth_zero` l. 181, `realize_succ` l. 186, `realize_depth_one` l. 193), `Activation.lean` l. 89, `Topology/PL/Map.lean` l. 97, 110, 119, 142, 166, 525, 533, `PL/Product.lean` l. 35, `PL/FiniteInf.lean` l. 32–79, `Polyhedron/Basic.lean` l. 56, 75, 103; Mathlib `Radon.lean` l. 48, `Nat/Log.lean` l. 334, 440, `Baire/Lemmas.lean` l. 279, `IntervalIntegral/Basic.lean` l. 1427, `Iterate.lean` l. 174, `Floor/Defs.lean` l. 264. All exist with the stated content.
- Cross-roadmap citations resolved: 4 (UniversalApproximation 3.3 at its open head; RobustnessCertificates and StatisticalLearningTheory scope at their open heads; Neuromanifolds on main), all boundaries, none a supplier.
- Dependency check output: `depcheck: 199 roadmaps, 2189 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/ReLUNetworkExpressivity/Suggested.lean`: 12 `sorry` warnings, nothing else. `#check`-level comparison of the 18 elaborated types with the README: none lost a binder, generality equal.
- One-tactic probe on a copy of the file (`rfl`, `simp`, `simp` with the six definitions unfolded, `infer_instance`, `exact?`): none of the 12 theorems closes. No padding.
- Automatic checks: all passed at this head; no change outside the roadmap folder.
- Headline theorems (exact representation both directions, piece count and its converse, Telgarsky separation with the deep network, Yarotsky square and product) are all stated; none is marked not statable.

Overlap check: read UniversalApproximation (open), RobustnessCertificates (open), Neuromanifolds (main, and its open revision searched); nothing shared. UniversalApproximation excludes every statement about depth and is not specific to ReLU; RobustnessCertificates states nothing on pieces or representation; Neuromanifolds places approximation outside its scope. No other roadmap, open or on main, declares a ReLU specification, the tent map or a piece count.

Source independence: 11 passages compared with 5 sources, none shared beyond formulas and standard names; largest share ABM+16, 13 of 42 locators; contents compared with ABM+16 (sections 2–4 and appendices A–D) and HBS+21 (sections 1–5): independent. Layer 2 uses the convex-then-general order of HBS+21 section 4, which the dependency 2.3 ← 2.1, 2.2 forces.

Research link: 3.2 and 2.3 are the starting point of the depth lower-bound conjecture of Hertrich, Basu, Di Summa and Skutella (2021); 6.3 is the multiplication gadget behind Yarotsky's Sobolev approximation rates (2017); 5.3 is Telgarsky's depth separation (2016). Rests on the README's downstream and scope sections and on HBS+21 section 1.3, Yar16 section 3.2.

## Not verifiable

- The papers of Wang and Sun (2005), Wang (2004) and Mukherjee and Basu (2017): attributed in prose without locators; not fetched, nothing rests on them beyond the attribution.
- The numerical experiments reported in Checks (random families, 300 random functions, exact evaluation for `m ≤ 6, 7`): not rerun; the statements they illustrate were verified by hand.

## Source issues

- **Error** in ABM+16 at Theorem 2.2, p. 3: the source says a univariate function with `p` pieces has a 2-layer network with at most `p` nodes; it should be `p ≥ 2`, since a nonconstant affine function (`p = 1`) needs two nodes; affects a stated result.
- **Gap** in ABM+16 at the proof of Theorem 2.2, p. 11: the source absorbs an additive constant into a bias on the output node; it should be noted that Definition 1 has a linear output map, under which `|x| + 1` needs three nodes; affects the proof.
- **Misprint** in ABM+16 at the proof of Theorem 2.2, p. 11 (the linear system): the source says the coefficient of `t_j` in the equation for `b_i` is `a_(j−1) − a_j`; it should be `a_i − a_j`; affects nothing.
- **Error** in ABM+16 at Lemma D.5, p. 17: the source says the number of pieces is at most `2^(k−1)(w₁+1)w₂⋯w_k`; it should be restricted to positive widths, since a width `0` after the first gives the bound `0` for a constant function; affects a stated result.
- **Misprint** in ABM+16 at Lemma D.3, p. 16: the source says the depth for the maximum is bounded with `log(m)`; it should be `⌈log(m)⌉`, as written for the minimum in the same lemma; affects nothing.
- **Misprint** in Yar16 at formula (4), p. 9: the source says the prefactor of the three squaring terms is `M²/8`; it should be `2M²`, as polarization with arguments divided by `2M` requires; affects a stated result.
- **Error** in Ano at Proposition 5.1, p. 34: the source says `Δ^L(x) = Δ(⟨2^(L−1)x⟩)` with no restriction on `x`; it should be for `x ∈ [0, 1]` (at `x = 5/4`, `L = 1` the sides are `0` and `1/2`), as its proof assumes; affects nothing.

## For the human reviewers

- **Scope.** The subject is exact representation and approximation by ReLU networks (metadata topic `math.CA`); the main sources are ICLR 2018, COLT 2016, Neural Networks 2017 and an arXiv paper of 2021 (HBS+21). Whether this is within the project's mathematics is yours to decide.
- **Licence.** One source (Ano, Telgarsky's lecture notes, version 2021-10-27, marked alpha) is unpublished and read from the author's page; it is cited for locators only, each time beside a published source.
- **Licence.** HBS+21 is cited by its arXiv version v5 only (README References); numbering was checked against that version.
