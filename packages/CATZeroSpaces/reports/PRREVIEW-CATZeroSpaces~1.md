# Review of CATZeroSpaces (pull request #3021 at e17c26f)

**Verdict:** accepted

**Summary.** Accepted: no statement, route or Check was found false, and every route was recomputed (Reshetnyak's splitting point, Busemann's common-start identity, the variance iteration, the lower bound in 3.2, the additivity argument of 5.1, the flat strip, the geodesic identity of 6.3). Three small corrections (a claim in 4.1 about what Tau Ceti lacks is contradicted at the pin; one statement of `Suggested.lean` holds by unfolding; one file pointer) and one format note, none blocking. Sato's text could not be read, so its locators are untested, and four points are left for the human reviewers.

## C01 — Tau Ceti does prove existence of Chebyshev centres, on proper spaces

In 4.1 (line 463) the README says "Tau Ceti has no existence or uniqueness theorem for Chebyshev centres". An implementer who believes it will not look for the existing theorem when relating the circumcentre to `TauCeti.IsChebyshevCenter`. At the pin, `TauCeti.exists_isFrechetBarycenter` (`TauCeti/MeasureTheory/Measure/FrechetMean/Basic.lean`, line 288) is stated for every exponent `1 ≤ p`, so also `p = ∞`: a probability measure on a proper pseudometric space whose radius is finite at one point has a barycentre of exponent `∞`, and `TauCeti.isFrechetBarycenter_top_iff_isChebyshevCenter` (same file, line 171) turns it into a Chebyshev centre. I elaborated `exists_isFrechetBarycenter le_top μ h₀ : ∃ x, IsFrechetBarycenter ⊤ μ x` against the pin. OptimalTransport 12.2 says the same ("the analogous essential-supremum argument at `p=∞`").

The sentence that is true: Tau Ceti proves existence of Chebyshev centres on proper spaces only (the two declarations above) and has no uniqueness theorem for them; 4.1 gives existence without properness, and uniqueness, for the measures whose support is a nonempty bounded set in a complete CAT(0) metric space.

## C02 — The comparison of 3.1 with `ConvexAlongGeodesics` holds by unfolding the two definitions

`isGeodesicallyConvexSet_iff_convexAlongGeodesics` is not one of the headline theorems, and as a target it asks an implementer for almost nothing: I proved it in a scratch file in twelve lines (`IsGeodesicSegment.convexAlong_iff`, then `simp` with the indicator unfolded in each direction), which is the two-sentence proof the README already gives. It does not close with a single tactic, so it is not empty; it is a check that the new definition agrees with the library's notion on effective domains. Would you mark it as such in its docstring ("sanity check: agreement with Tau Ceti's notion"), or keep it only in the README beside the remark on `Convex ℝ`, which is treated that way already?

## C03 — `cauchySeq_tendsto_of_complete` is in one of the two files named

Under "From Mathlib" (line 766) the declaration is attributed to `Mathlib/Topology/UniformSpace/Cauchy.lean` and `Mathlib/Topology/MetricSpace/Cauchy.lean`. At the pin it is in the first (line 425); the second does not contain the name. Drop the second file.

## N01 — Some Checks and two References narrate how they were tested

"checked on 300 rational configurations" (1.2), "checked exactly on the grid of sixteenths" and "checked for `n ≤ 30`" (3.2), "checked exactly on 300 rational families" (3.4), "checked for integers" (5.2), and "not consulted" in two References describe the drafting, not the mathematics; each Check already carries its general argument. The parenthetical "(Proved here.)" is defined in the Conventions and is fine.

## Questions for the author

- In 1.3 the direction ⇐ of the quadrilateral characterization rests on the sentence that each step of Sato's proof (Lemma 2.1, Lemma 2.2, (2.4)–(2.6)) uses only the three distances of the midpoints it names, so that it holds for every metric midpoint. I could not read Sato's text (the published article is behind a paywall, and the Kyoto preprint server is not a host I could fetch from), so I could not check this step at the generality restated here. Is there a step of Sato's proof that uses that the midpoint lies on a previously fixed geodesic (for instance that `γ_(yx)(2⁻ⁿ)` for different `n` lie on one segment, which you do keep)? The theorem itself is not in doubt.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `isCATZeroSpace_tfae` | (iii)⇒(ii) with `z = x`, `z = m_δ`; empty space; `ℚ` | `d(x,m_ε)² ≤ d²/4 + ε`; `d(m_δ,m_ε)² ≤ ε + δ`; CN at another midpoint: right side `0` | holds; `ℚ` fails only completeness | none |
| 1.2 `isCATZeroSpace_iff_comparison` | circle of length 4, `x=0, y=z=2`, `s=t=1/2`; `c = 0` case | circle: `d = 2`, comparison points coincide (`0`); `c=0` gives `a = b` | iff holds; non-example separates | none |
| 1.3 Reshetnyak | `ℝ`: `(0,1,1,0)`; `d₁₂ = 0`; general `η = d₁₂/(d₁₂+d₃₄)` | `1+1 ≤ 0+0+2`; equality when `d₁₂=0`; both cross terms equal `d₁₂d₃₄` | holds | none |
| 1.3 `isCATZeroSpace_iff_quadrilateral` | circle `0,1,2,3`; ultrametric 4 points; other midpoint `m'` | `8 ≤ 4` false; ultrametric: `p²+q² ≤ c²+a²` in worst case; `d(m,m')² ≤ 0` | ⇒ recomputed; ⇐ rests on Sato (unread) | none |
| 2.1 Busemann | common start; `ℝ²` `(t,0)`, `(0,1+t)` at `t = 0, 1` | bound collapses to `t²Q`; `1 ≤ 1`, `√5 ≤ √5` | holds | none |
| 2.2 contractibility | empty space; continuity estimate | `d(H(t,y),H(t',y')) ≤ t d(y,y') + |t−t'| d(x₀,y')` | holds; `Nonempty` needed | none |
| 3.1 definition and comparison | endpoints off `C` at `t = 0, 1`; sup-norm segment through `(1,1)` | `0·⊤ = 0` in `EReal`, right side `0` on `C`; sup distance `2|s−t|` | iff proved in a scratch file | C02 |
| 3.2 variance and existence | iteration `c' ↦ (c+c')/2`; lower bound; four non-examples | `c(1−2⁻ᵏ) → c`; `G y ≥ G q₀ − 2d/r + cd²/2 ≥ G q₀ − 2/(cr²)`; midpoint relation an equality | holds; each hypothesis separated | none |
| 3.3 projection, Pythagoras | `t → 0`; tripod `r, s`; unit circle, `y = 0` | `d(y,p)² + (1−t)d(p,q)² ≤ d(y,q)²`; `r²+s² < (r+s)²` | holds | none |
| 3.4 barycentres, weighted bound | `μ = 0`; `μ = ∑2⁻ⁿδ_(2ⁿ)`; `d(b,b') = 0` | radius `0` finite; `∑ 2⁻ⁿ(2ⁿ−z)² = ∞`; `2W d² ≤ 2d ∑wᵢ d(xᵢ,x'ᵢ)` | holds | none |
| 4.1 circumcentre | `{(0,0),(4,0),(1,1)}`; empty and unbounded `S` | centre `(2,0)`, radius `2`, `(1,1)` at `√2`; equidistant `(2,−1)`, `√5`; supremum `0` | holds | C01 (prose) |
| 4.2 fixed point | trivial group; `ℤ` on `ℝ` | every point fixed; orbit unbounded, none fixed | holds | none |
| 5.1 `flat_rectangle` | `ℝ³` one-diagonal example; parallelogram; tree | `d(y,u)² = 9 ≠ 27`; `10 ≠ 6`, sum `12`; `2√(δ²+h²) ≤ max(2δ,2h)` forces `δh = 0` | holds; both hypotheses needed | none |
| 5.2 `flat_strip` | `(t,0)`, `(t+5,3)`; antiparallel line; `c' = c` | `a = −5`, `D = 3`, `9 + (s−t)²`; `(s+t+a)² + 9`; `D = 0` | holds with `D ≥ 0` | none |
| 6.1 `L²` product | `L¹` plane, `m=(1,0)`, `z=(0,1)`; midpoints | `4 ≤ 0` false; `d² ≤ d²/2 + 2∑aᵢbᵢ ≤ d²` forces `aᵢ = bᵢ = dᵢ/2` | holds | none |
| 6.2 normed spaces | sup norm, `m=(1,1)`, `z=(1,−1)`; zero space | `4 ≤ 0` false; both sides true | holds | none |
| 6.3 positive definite cone | `n = 0`; scalar matrices; `s ≤ t` identity | one point; `√n |log(k/l)|`; `(1−t)s² + t(1−s)² − t(1−t) = (t−s)²` | holds given supplier 7.1–7.4 | none |

- Source locators checked against the text: 24 (Sturm 18, Bruhat–Tits 2, Poulsen 4; all agree, Sturm's with the preprint's printed pages).
- Library declarations opened at the pin: 37 by `#check` (18 Mathlib, 19 Tau Ceti), all present; the definitions of `IsCATZeroSpace`, `IsGeodesicSegment`, `ConvexAlong`, `ConvexAlongGeodesics`, `frechetPower`, `IsFrechetBarycenter`, `IsChebyshevCenter` read.
- Cross-roadmap citations resolved: 9 (OptimalTransport 8.1, 12.2; OperatorMonotoneFunctionsAndMatrixMeans Conventions, 5.1, 6.1, 7.1–7.4 with its five declarations and seven definition bodies, identical; ReductiveGroupsPartII RG2.2; RealSemisimpleLieGroups 5.4; FreeGroupsAndLimitGroups 9.2).
- Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD or CYCLE line. The one open supplier adds a new roadmap folder.
- Elaboration: `Suggested.lean` elaborates with 20 `sorry` warnings and nothing else; `#check @name` with explicit instances confirms that the distance, completeness and CAT(0) clauses of the cone all use the asserted metric.
- One-tactic probe (`simp`, `rfl`, `infer_instance`, `tauto`, `simp_all`) on all 20 theorems: none closes.
- Automatic checks: all passed on this head. Pull request text read against the head: no sentence contradicted (20 theorems, 8 definitions, three Tau Ceti modules, one open supplier).
- Overlap check: read OperatorMonotoneFunctionsAndMatrixMeans, ManifoldOptimization, OptimalTransport; the affine-invariant distance and its geodesics are owned by OperatorMonotoneFunctionsAndMatrixMeans (cited, definitions copied with attribution), the CAT(0) predicate and Fréchet barycentres by OptimalTransport 12.2 and Tau Ceti (cited); geodesic convexity of functions on manifolds in ManifoldOptimization is a different object; nothing else shared.

Source independence: 9 passages compared with 3 sources (Sturm, Bruhat–Tits, Poulsen), none shared beyond formulas; largest share Sturm, about 19 of 30 locators; contents compared with Sturm (sections 1–8): independent (Layer 1 draws on its §2 with two other sources, Layer 3 on its §§1, 2, 4, 6, Layer 6 on its §3; Layers 4 and 5 are not in it). Sato's text could not be read.

Research link: Layer 4 is the fixed point lemma of Bruhat–Tits (1972) that ReductiveGroupsPartII RG2.2 uses for buildings; Layers 1 and 3 are the Berg–Nikolaev (2008) / Sato (2009) characterization and Sturm's (2003) barycentres on Hadamard spaces; rests on the README and on the texts of Sturm and Bruhat–Tits.

## Not verifiable

- Sato, Thm 1.1 (p. 1), the proof on pp. 2–3, Lemma 2.1, Lemma 2.2, (2.4)–(2.6) and Example 1.2: the published article is behind a paywall and the Kyoto University preprint server is a host the sources service does not classify; not read. (The ultrametric claim of Example 1.2 was verified directly.)
- The statement that the paper *VP ≠ VNP over every field* uses facts of this kind in its Lemma C.4, and the list of what its Lean development proves (Scope and ownership, lines 754–760): the paper and the files were not read.
- Berg–Nikolaev and Bridson–Haefliger are named in the References only and carry no locator.

## Source issues

- **Misprint** in Sturm, *Probability measures on metric spaces of nonpositive curvature* at proof of Corollary 2.5, p. 7: the source says the case `r = 0` yields (2.4) and subtracts the square of `d(γ₀,η₀) − d(γ₀,η₁)`; it should be (2.5) and `d(γ₀,η₀) − d(γ₁,η₁)`; affects nothing.
- **Misprint** in Sturm, same text, at proof of Proposition 2.6 (i), p. 8: the source says the minimizer exists by "Proposition 1.2.11", which does not exist; it should be Proposition 1.7; affects nothing.
- **Misprint** in Sturm, same text, at proof of Theorem 4.9, p. 18: the source says "Corollary 4.4"; it should be Proposition 4.4 (the variance inequality); affects nothing.
- **Error** in Poulsen, *A gentle introduction to CAT(0) spaces* (arXiv:2406.09883v2) at Theorem 3.4.7: the source says the strip has width `D > 0` and names the lines both `γ₁, γ₂` and `c, c'`; it should be `D ≥ 0`, since two equal lines are asymptotic; affects a stated result.

## For the human reviewers

- Scope and ownership (README lines 754–760) names as context the paper *VP ≠ VNP over every field* by an AI model; its repository's README says no human mathematician has checked the proof. Nothing in the roadmap rests on it.
- The same paragraph says a public Lean development (github.com/anthropics/formal-math, folder `vp-vnp`, Apache 2.0) proves several of these facts for its own class of spaces. I could not list its files, so `Suggested.lean` was not compared with it.
- `Suggested.lean` copies seven definitions verbatim from the `Suggested.lean` of OperatorMonotoneFunctionsAndMatrixMeans, which is still an open pull request (bodies identical at its head 71afcb3); the two files will carry the same definitions under different namespaces.
- Sato's article was not read (paywalled; the Kyoto departmental preprint host is unclassified), so the wording and locators of the ⇐ direction of 1.3 were not tested against it.
