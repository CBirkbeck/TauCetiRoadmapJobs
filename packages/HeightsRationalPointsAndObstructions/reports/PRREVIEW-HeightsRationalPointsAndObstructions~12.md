# Review of HeightsRationalPointsAndObstructions (pull request #3027 at 0b5086d)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 256 changed lines since `aecb53a`. I checked the thirteen added sections and the seven extended paragraphs statement by statement, recomputing every identity and bound on test cases, reading the open sources at their locators and resolving every supplier section at this head; no statement is false and nothing on `main` is removed. One finding needs a change: case (iii) of 5.17c.2 defines the weighted Bergman space of a plurisubharmonic weight on a bounded pseudoconvex domain, but ComplexComparisonPartII C7.9 and C7.13 already define and use that space, so it has two owners. Three small corrections (the description, a sentence of 5.9b.1, a step of the 5.17f.2 route) and one format note do not block, and nothing is left for a human to decide.

## R01 (P2) — Case (iii) of 5.17c.2 defines again the Bergman space `H(Ω, φ)` that ComplexComparisonPartII C7.9 and C7.13 already define and use, so the space has two owners

**Why it matters.** As written, an implementer would build the same Hilbert space twice under two names: the space of holomorphic functions square-integrable against `e^(−φ)` on a bounded pseudoconvex `Ω ⊂ ℂ^d`, together with its orthonormal bases and the description of its kernel diagonal as a supremum. Meanwhile ComplexComparisonPartII, which comes earlier in the merge order, uses that Hilbert-space structure with no section it can cite.

**How I know.**
- Case (iii) of 5.17c.2 (README line 2876) is "`X` is a bounded pseudoconvex open subset of `ℂ^d`, `dV` is Lebesgue measure, `L` is trivial and `|1|²_h = e^(−φ)` with `φ` plurisubharmonic". Its `weightedBergmanSpace` is then `{f ∈ O(Ω) : ∫|f|²e^{−φ}dλ < ∞}`.
- ComplexComparisonPartII calls this "the Hilbert space `H(B, φ)`" in C7.9 (its README line 5290). C7.13 (line 5365) takes an orthonormal basis of `H(Ω, mφ)`, and its route uses `Σ_k|σ_{m,k}(z)|² = sup{|f(z)|² : ‖f‖ ≤ 1}`. That identity is the "density = sup" item of the API in 5.17c.2. ComplexComparisonPartII's supplier list (line 6088) names `HilbertBasis` "for weighted Bergman spaces, C7.9–C7.13".
- The source this roadmap cites for case (iii), Demailly [AMAG] Theorem 14.2, is the theorem C7.13 states.
- No section of this roadmap uses case (iii): 5.17c.3 and 5.17c.4 use smooth weights.

**Smallest change.** Give the space one owner, ComplexComparisonPartII, the earlier roadmap, which already relies on these facts:
- In C7.9, or in a short section before it, ComplexComparisonPartII would state that `H(Ω, φ)` is a separable Hilbert space with continuous evaluation, and that its kernel diagonal is the supremum above. The route of 5.17c.2 is one paragraph and carries over.
- 5.17c.2 would then say that in case (iii) `weightedBergmanSpace` is that space, cite ComplexComparisonPartII C7.9 and C7.13 for it, and keep cases (i) and (ii) and their API as its own.

Keeping case (iii) as a cited case also keeps valid the citation of the three cases in SingularHermitianMetricsAndL2Methods §3.6.

## C01 — The description does not say that this roadmap gains BanachSpaceTheory as a supplier or that it receives the Bergman-kernel sections

The description gives this roadmap's additions as "(slopes of Hermitian vector bundles, heights)". The head also adds:
- Bergman spaces and densities with their asymptotics, the Suita inequality and Demailly's characterisation of big line bundles (5.17c.1–5.17c.7);
- the change-of-metric formula (5.17a.1).

Its paragraph listing the new supplier relations also omits that BanachSpaceTheory (B7.HermitianNorms, used in 5.17d.1) becomes a supplier of this roadmap; the README at the merge base does not name BanachSpaceTheory.

Text that would be right: "HeightsRationalPointsAndObstructions (slopes of Hermitian vector bundles, heights of cycles, Bergman kernels and their asymptotics, the change of metric in arithmetic intersection numbers)", plus, in the supplier paragraph, "HeightsRationalPointsAndObstructions gains BanachSpaceTheory B7.HermitianNorms as a supplier, for its §5.17d.1."

## C02 — 5.9b.1 says it turns the coefficient-height comparison of §5.9b into an identity, but the identity is for the spherical height

Line 2496 says the result "sharpens the coefficient-height comparison of §5.9b, which holds up to an error controlled by the degree, into an identity." The identity relates the Fubini–Study height to the spherical height of the Chow form, not to its coefficient height. For the point `[1:1]`, the Chow form `u_0 + u_1` has coefficient height `0` but spherical height `½·log 2 − ½`, so the comparison with the coefficient height still carries an error.

Text that would be right: "With the spherical height of the Chow form in place of its coefficient height, the comparison of §5.9b, which holds up to an error controlled by the degree, becomes an identity."

## C03 — The upper-bound route of 5.17f.2 leaves out the step that accounts for half of `log r` in its constant

The route (line 3068) says that `Sym^ℓ Ē_0` is an orthogonal sum of monomial lines, "so its maximal slope is the largest of their normalised degrees", and then that "collecting these bounds" gives `(r + ½)·log r`. The bounds stated explicitly add up only to `r·log r`.

The missing `½·log r` comes from the multinomial term of the monomial lines. By ArakelovGeometryAndAbelianHeights §1.2a (v), each line has normalised degree `Σ_j α_j·μ̂(M̄_j) + ½·log(ℓ!/α!)`. Since `Σ_α ℓ!/α! = r^ℓ`, this is at most `ℓ·μ̂_max(Ē_0) + (ℓ/2)·log r`. This is how Gaudron's proof bounds the term (gaudron2008, p. 85).

Adding that clause after "the largest of their normalised degrees" makes the stated bounds collect to the constant given.

## N01 — About two dozen new code-font names are proposed names that `Suggested.lean` does not declare

Examples are `projectiveCycleHeight_eq_chowSphericalHeight`, `measureBergmanDensity`, `fekete_superadditive_error` and `absoluteSiegel_harmonic`. This follows the practice of the rest of this README, but house style writes a proposed name in prose or declares it, so that a reader can tell a proposal from a declaration.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 5.9b.1 `projectiveCycleHeight_eq_chowSphericalHeight` | point `[1:1]⊂ℙ¹_ℚ`; `ℙ¹⊂ℙ¹`; `ℙ^n⊂ℙ^n`; `Z = 0` | `[1:1]`: `½log2` vs `(½log2−½)+½`. `ℙ¹`: `½` vs `−½+1`. `ℙ^n`: `½ΣH_i` vs `−½[(n+1)H_n−ΣH_i]+((n+1)/2)H_n`. Zero cycle: `0 = 0` | holds |
| 5.9b.1 `chowSphericalIntegral_hyperplaneSection` | `d=0`; `Y=ℙ¹`; `Y=ℙ^n`; `s↦λs` | `d=0`: both `log‖y‖−½H_n`. `ℙ¹`: both `−½`. `ℙ^n`: both `−½nH_n+½Σ_{i<n}H_i`. Scaling: both sides shift by `deg·log|λ|`, which cancels | holds |
| 5.9b.2 `projectiveSpaceHeight_hermitian` | `N=1`, `J̄=(ℤ,e^{−c}|·|)`; rescaling by `e^{−c}`; induction step | `N=1`: height `c` = `deĝ_n` = `c`. Rescaling: both sides `+Nc`. Each Cartier step adds `−Σ_σlog|u|_σ/[K:ℚ]+½H_{N−1}` to both sides | holds |
| 5.9b.2 `projectiveSpaceHeight_value` | `N=1,2,3` | `0`, `½`, `5/4` against `0`, `log2≈0.693`, `1.5·log3≈1.648`; `Σ_{m<N}H_m = N(H_N−1)`: `1=1`, `2.5=2.5` | holds |
| 5.17a.1 `arithmeticIntersection_changeMetric` | `f=t` constant; Green current `g=−log‖s‖²` with the archimedean factor ½ | `f=t` adds `t[K:ℚ]·deg`, as in the Check of 5.17a. `g→g+2f`, and `½·2f` gives `+Σ_σ∫f c₁⋯c₁` | holds |
| 5.17c.1 `measureBergmanDensity` | `ℙ¹`, `O(n)`, Fubini–Study probability; Dirac measure | Density constant `n+1`, integral `n+1 = dim`. Dirac measure: a section vanishing at the point has norm `0` when `dim ≥ 2` | holds |
| 5.17c.2 API | unit disc; disc of radius `r`; `h→ch`; `dV→c·dV`; `O(k)`, `k<0` | Disc: `1/(π(1−|z|²)²)`. Centre of radius-`r` disc: `1/(πr²)`, decreasing in `r`. `h→ch` leaves the density unchanged; `dV→c·dV` divides it by `c`. `k<0`: `0` | holds; case (iii) duplicates ComplexComparisonPartII (R01) |
| 5.17c.3 `suita_inequality` | disc of radius `r`; simply connected `D` with Riemann map `ψ` | Disc: `c=1/r`, `πB=1/r²`, equality. Simply connected: `c=|ψ′(z)|`, `B=|ψ′(z)|²/π`, equality | holds |
| 5.17c.4 `bergmanDensity_localUpperBound` | Fock weight `e^{−|z|²}`; flat disc; `ℙ¹`, `O(1)` | Fock: `B=n/π`, bound `n/π` (attained). Flat disc: `B/n→0`, bound `0`. `ℙ¹`: `(n+1)/n→1`, bound `1`; matches Berman Thm 1.1 | holds |
| 5.17c.5 `bergmanDensity_leadingOrder` | `ℙ¹`, `O(1)`; curvature probability volume | `ℙ¹`: limit `1` both sides. Probability volume: limit `∫c₁^d/d!`, constant, equal to the limit of `n^{−d}dim H⁰`; gives `bergmanDensity_uniform` | holds |
| 5.17c.6 `bergmanDensity_singular_offAnalytic` | `S=∅`; Hsiao–Marinescu normalisation | `c₁^d/ω^d = (c₁^d/d!)/(ω^d/d!)`, which is 5.17c.5. HM: `b₀=(2π)^{−n}det Ṙ^L` with `dv=Θ^n/n!` | holds |
| 5.17c.7 `big_iff_singularMetric` | `ℙ¹`; blow-up of `ℙ²` | `O(1)` big, `O` not (`h⁰=1`). Blow-up: `L=H+E` big, `L·E=−1`, `H−δE` ample for `0<δ<1` | holds |
| 5.17d.1 `maxSlope_firstMinimum` | `ℤ^N` standard; proof by AM–GM and Hermite `γ_D≤D` | `ℤ^N`: `−½logN ≤ 0 ≤ 0`. Right side from AM–GM over `σ`; left side from `λ₁² ≤ D·covol^{2/D}` and `covol=|Δ|^{m/2}e^{−deĝ}` | holds |
| 5.17d.1 `fekete_superadditive_error` | proof sketch; `a_n = an` | `liminf ≥ (a_m−f(m))/m` for all `m≥n₀`; `limsup ≤ α`. `a_n = an`: limit `a` | holds |
| 5.17d.1 asymptotic maximal slope | `ℙ¹_ℤ` with `L²` norms; sup norms | `n=2`: `½log6≈0.896`; `μ̂_max/n→½log2≈0.347`. Monomial `x₀^{n/2}x₁^{n/2}` with sup norm `2^{−n/2}` gives the same limit | holds |
| 5.17f.1 both displays | rank 1; `ℤ²`; `ℤ⊕(ℤ,e^{−c}|·|)` | Rank 1: `1≤1≤1`. `ℤ²`: `1≤1≤e^{1/4}≈1.284≤√2≈1.414`. `ℤ⊕(ℤ,e^{−c}|·|)`: `e^{−c}e^{c}=1`; with the slope instead, `e^{−c/2}<1` | holds |
| 5.17f.2 `symmetricPower_maxSlope_bounds` | `ℓ=0`; rank 1; `Sym²ℤ²`; constant | `ℓ=0`: `0`. Rank 1: `0≤0≤0`. `Sym²ℤ²`: `0<½log2≈0.347<8log2`. Constant: `(r+½)logr ≤ 2rlogr` (`r=2`: `1.73≤2.77`) | holds; route gap (C03) |
| 5.17f.2 `absoluteSiegel_basis` | `ℤ²` standard | Sum of minima `½log2≈0.347 ≤ r(½(H₂−1)) = 0.5 ≤ log2≈0.693` | holds |
| R01 case (iii) vs ComplexComparisonPartII C7.13 | carriers | `{f∈O(Ω):∫|f|²e^{−φ}<∞}` both. ComplexComparisonPartII's diagonal is `sup|f(z)|²`; 5.17c.2's is `e^{−φ(z)}·sup|f(z)|²` | same object, two owners |
| C02 coefficient vs spherical height | `u₀+u₁` | coefficient height `0`, spherical `½log2−½≈−0.153` | differ |
| Headlines (`Suggested.lean`, unchanged) | elaboration | 11 declarations; 7 `sorry` warnings, no errors | unchanged |

- **Sources read at their locators (about 45 locators, 16 sources):**
  - chen2010: Prop. 3.1, Cor. 3.2, the paragraph before Lemma 9.4, Prop. 9.6, Lemma 9.7, Remark 9.9, Lemma 9.10, Prop. 9.11 and the sentence after it.
  - gaudronremond2013: Thm. 1.1, Thm. 3.1, Lemme 3.2.
  - gaudron2008: Thm. 7.1 (2) on p. 82, Lemmes 7.2–7.3, the proof on pp. 84–86, Thm. 4.14 on p. 54.
  - bost2001: (4.6) on p. 196. bost1996: Prop. A.4 on p. 149.
  - bbwn2011: §0.3. berman2004: Thm. 1.1 on p. 3 and the abstract.
  - hsiaomarinescu2014: §1.1, (1.21), Thm. 1.8, (9.1)–(9.2), Thms. 4.14 and 9.2.
  - chambertloirthuillier2009: Thm. 1.4. chambertloir2011: 1.2.5, (1.2.6), (1.3.10), 1.3.12.
  - sombra2005: §3. philippon1991: Thm. 2 on p. 256, Prop. 4, Cor. 4 on p. 272. soule1991: Thm. 3.
  - bouche1990: Théorème principal on p. 118, Thms. 1–2.
  - demailly2012amag: Thm. 6.17 (b) on pp. 46–47, Thm. 14.2.
  - bostkunnemann2010: Prop. 3.3.1 ((3.23)–(3.24), arXiv v1, pp. 37–38).
- **Supplier sections resolved at this head:**
  - ArakelovGeometryAndAbelianHeights §§1.1, 1.2, 1.2a (i), (iii)–(v), 1.3, 1.5, 1.5a, 1.5b, 1.6, 1.6a, 1.12, 1A.1–1A.5, 1B.5.
  - DiophantineApproximationAndTranscendence §§1.3a and 2.5 (`absoluteAdelicMinima`).
  - ComplexComparisonPartII C1.4, C1.6, C1.9, C5.4 (`chernFubiniStudyIntersection`), C5.4a, C5.4b, C5.4f (d), C5.4g, C7.7, C7.13, C7.16–C7.18.
  - AlgebraicModuliForArithmeticGeometry §§1.1, 1.5, 1.6; BanachSpaceTheory B7.HermitianNorms; ClassicalArithmeticCompletion §6.20.
  - This roadmap's §§5.9b, 5.17a, 5.17b, 5.17c, 5.17f.
  - All of these exist and say what is cited. Every supplier roadmap is on `main`.
- **Libraries at the pins:** Mathlib `Mathlib/Analysis/Subadditive.lean:155` (`Subadditive.tendsto_lim`) has only the error-free Fekete lemma. Tau Ceti has no Fekete lemma with error terms and no Bergman object.
- **Record kept:** no layer or item is removed, retitled or renumbered. Each of the seven modified lines keeps all its old text and only extends it. 13 headings are added.
- **Automatic checks:** all passed. Dependency check: `depcheck: 132 roadmaps, 1482 edges, 0 problem(s)`.
- **Elaboration:** `lake env lean` on `Suggested.lean`, which this pull request does not change, gives 7 `declaration uses sorry` warnings and no errors.
- **Seeded sample:** none of the 15 targets lies in or is affected by the changed text, so none was re-verified.

Overlap check: I read HeightsRationalPointsAndObstructionsPartII (open), ArakelovGeometryAndAbelianHeights, ArakelovGeometryAndAbelianHeightsPartII and ArithmeticStatisticsPartVI (main). InverseGaloisAndArithmeticFundamentalGroups, ArithmeticDynamics, ArithmeticStatisticsPartIII and NeronModelsAndSemistableAbelianVarieties were searched by object across all open heads. Findings by object:
- The Bergman space of a plurisubharmonic weight is shared with ComplexComparisonPartII; it should be owned by ComplexComparisonPartII (R01).
- Slopes of hermitian bundles are owned by ArakelovGeometryAndAbelianHeights and cited here.
- The product of the absolute minima is owned by DiophantineApproximationAndTranscendence §2.5 and cited here.
- SlopesOfHermitianVectorBundles, SingularHermitianMetricsAndL2Methods and HeightsForLogSingularMetrics cite the new sections as their owner.

Source independence: 17 passages compared with 13 sources (changed passages only). None shares wording beyond forced formulas and short statements of hypotheses. The route of 5.17f.2 follows the steps of Gaudron's proof in its own words. The largest share is chen2010, about 11 of 56 locators in the changed passages. Contents were not compared, since no layer is added, removed or reordered. bgs1994 (9 locators) could not be read.

Research link: the added sections supply the slope-method and Bergman-kernel inputs to the Arakelov route of the README's finiteness theorems: Rémond's form of Faltings and Bogomolov through Zhang's successive minima. They rest on Zhang 1995, Bost 2001, Gaudron 2008, Chen 2010, Gaudron–Rémond 2013, Tian 1990 and Berman 2004. This line rests on the README Summary and §§5.17a–g, and on the sources read.

## Not verifiable

- bgs1994 (Thm. 4.3.2 with (4.3.12), Thm. 4.3.8, Prop. 4.1.2 with (4.1.4), Lemma 3.3.1, Prop. 3.2.1 (iv), (3.2.2)). The AMS open copy was fetched, but it is an image-only scan that has no text layer and renders blank on this worker. Lemma 3.3.1 is confirmed only through Sombra's quotation of it; the formulas were recomputed independently.
- Zhang 1995, *Positive line bundles*, Thm. 5.2 and Lemma 5.4: not fetched. This is the same locator as the untouched §5.17f.
- Błocki 2013, Suita 1972 and Guan–Zhou 2015: cited without locators and behind paywalls. The inequality was checked against ComplexComparisonPartII C7.7 and by computation.
- Tian 1990, Zelditch 1998, Catlin 1999, Kobayashi 1959, Aronszajn 1950, Demailly 1992 (LNM 1507) and Demailly [CADG] ch. VIII: not fetched. Most are cited without locators.

## Source issues

- **Misprint** in chen2010 at Proposition 9.6, p. 39: the source puts the supremum, over nonzero lattice vectors, of `Σ_σ‖s‖²_σ` inside `−½ log`; it should be the infimum (equivalently the supremum of `−½ log Σ_σ‖s‖²_σ`), as the proof of Lemma 9.7 uses it; affects nothing.
- **Misprint** in chen2010 at the proof of Lemma 9.10, p. 41: the first display bounds `Σ_σ‖s₁⋯s_r‖²_σ` by a constant times a sum over `j` of `Σ_σ‖s_j‖²_σ`; it should be the product over `j`, which the next inequality uses; affects nothing.

## For the human reviewers

- none
