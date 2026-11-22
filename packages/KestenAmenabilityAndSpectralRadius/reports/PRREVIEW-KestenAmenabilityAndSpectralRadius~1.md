# Review of KestenAmenabilityAndSpectralRadius (pull request #2960 at 86410b4)

**Verdict:** needs changes

**Summary.** Needs changes, for one reason of generality: every statement of Layers 1 and 2 is made for finitely supported step measures only, so Kesten's criterion is obtained only for finitely generated groups, while the source it cites states it for every symmetric walk with generating support on a countable group and the routes written here do not use finite support. Every stated theorem, Check and number that I recomputed is correct as written, the source locators agree with the text, and the Lean file elaborates with `sorry` as its only warning. There is one small correction and one format note, neither blocking; one point of ownership against FreeProbability is left to the human reviewers.

## R01 (P2) — Layers 1 and 2 restrict to finitely supported measures, which the cited source does not and the routes do not need, so Kesten's criterion is lost for countable groups that are not finitely generated

The carrier `MonoidAlgebra ℝ G` fixes finite support in the definitions of the return probability, the spectral radius and the expansion constant, and a generating finite support forces `G` to be finitely generated. A reader who needs `ρ(μ) = 1 ⇔ amenable` for `ℚ`, for a locally finite group, or for any walk with infinite support finds no statement, and a later extension would have to define the spectral radius a second time on another carrier. The opening sentence "no countability, finiteness or generation hypothesis is standing" (Summary, line 6) hides this: finite support is standing, and in 2.4 it is a finite-generation hypothesis.

How I know. In 2.4 (line 277) the criterion is cited "as stated in Lyons–Peres, §6.10 Notes, p. 224"; there (LyonsPeres lines 11754–11755) it is stated for a countable group and for some, or every, symmetric random walk whose support generates it, with no finiteness of the support. Theorem 6.7 is stated for networks whose conductances are only summable at each vertex (condition (6.1), LyonsPeres lines 9284–9287), and Proposition 6.6 for a reversible chain on a countable state space. I went through the routes with a summable symmetric nonnegative `μ` in place of a finitely supported one: 1.2 and 1.3 use only `‖μ * f‖₂ ≤ ‖μ‖₁ ‖f‖₂`, self-adjointness and Cauchy–Schwarz; 2.2 applies the coarea step to the finitely supported `g = f²`, and the sums over `s` converge absolutely; in 2.3, for `Φ = 0 ⇒` Følner a finite test set involves finitely many elements of the support, so the least coefficient is taken over those, and for the converse one truncates `μ` outside a finite set of mass `< ε` and uses `|sK ∖ K| ≤ |K|`. The README lists "measures with infinite support" under "Not treated here" (Scope and ownership, line 460) with no owner.

The smallest change that meets the project's rule that a statement is not narrowed below its source: state 1.1–2.4 for a symmetric probability (or summable nonnegative symmetric function) on `G` with arbitrary support, for instance on Mathlib's `PMF G` or on real functions with `Summable`, with convolution powers defined by recursion and the `ℓ²` ratio taken over finitely supported `f`; keep the finitely supported form as the special case that Layer 3 uses (the free step and its images are finitely supported, so Layer 3 is unchanged). Then correct the Summary sentence to say which finiteness hypothesis remains, and drop "measures with infinite support" from the list of what is not treated.

## C01 — The route of 3.1 sums `Σ_m A_m z^m` in the monoid algebra, where that series does not exist

The route says to sum `Σ_m A_m z^m` "as an absolutely convergent series for `|z| < 1/d`" and to invert `(1 + bz²) − zA` by a geometric series (3.1, lines 315–319). The elements of `MonoidAlgebra ℝ F_k` have finite support (`coeff : M →₀ R`, `Mathlib/Algebra/MonoidAlgebra/Defs.lean` line 81), and for `z ≠ 0` this sum has infinite support, so an implementer has no carrier in which the identity is to be proved. Naming one settles it: either formal power series in `z` over the monoid algebra (`1 + bz² − zA` has constant term `1`, so it is invertible there and the coefficient at `1 ∈ F_k` is read termwise, with no convergence to prove before (6.24)), or `ℓ¹(F_k)` with its convolution. The same sentence serves the pushed-forward recursion in 3.3.

## N01 — Kesten (1959), Grigorchuk (1980) and Northshield (1992) are attributed in 2.4 and 3.3 but have no entry under References

A reader cannot locate the three primary papers from the README; one bibliographic line each under References would do.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions, Checks | `ℤ/3`, `μ = (δ₁+δ₂)/2`; lazy walk on `ℤ`; `δ₁` and `δ₁+δ₋₁` on `ℤ` | `p₁,p₂,p₃ = 0, 1/2, 1/4`; lazy step `= ((δ₀+δ₁)/2)*((δ₀+δ₋₁)/2)`, `p_n = C(2n,n)/4ⁿ`; `ρ = 0`; `ρ = 2` | agree | none |
| 1.1 definitions | `F₂` simple walk; general `d = 2k`; `μ = 0`; trivial group `cδ₁` | `p₂ = 4/16`, `p₄ = (16+12)/256 = 7/64`; `(2d−1)/d³`; `p₀ = 1`, `p_n = 0`; `p_n = cⁿ`, `ρ = c` | agree | none |
| 1.2 even returns | `μ = 0`; `cδ₁` on trivial group; mass `> 1` | limit `0 = ρ` (term `n = 0` is `1`); `c = c`; `p_n^(1/n) ≤ Σμ`, so the real `limsup` is not junk | true | R01 (carrier) |
| 1.3 operator norm | `μ = 0`; `δ₁` on `ℤ` (non-symmetric); `ℤ`, `f = 1_{0..n−1}`; `F₂`, `f = δ₁` | set `{0}`, `ρ = 0`; ratio `1` vs `ρ = 0` (fails, as the Check says); `‖μ*f‖² = n−1`, `n ≥ 2`, and `1/2` at `n = 1`; `1/2 < √3/2` | true | R01 (carrier) |
| 2.1 expansion constant | `F₂`: `K = {1}`, ball of radius `r`; rank `k`; `△` variant | `1`; `|B| = 2·3^r − 1`, edges `4·3^r`, ratio `→ 1/2`; lower bound `(k−1)/k + 1/(k|K|)`; `△` gives `Φ = 1`, `1 ≤ 1 − √3/2` false | agree | none |
| 2.2 two inequalities | trivial group; finite group; `F_k`; lazy `F₂`; `δ₁/2` on `1`; `δ₁` on `ℤ` | `0 ≤ 0 ≤ 0`; same; `√(1−Φ²) = √(2k−1)/k = ρ`; `0.032 ≤ 0.067 ≤ 0.25`; `1/2 > 0` and `1 > 0` (controls fail as stated) | true | R01 (carrier) |
| 2.3 `Φ = 0 ⇔` Følner | `μ = 0` on trivial group; `δ₁` on `F₂` (not generating); `δ₁` on `ℤ` | `Φ = 0`, Følner holds; `Φ = 0`, no Følner sets (control); `1/n → 0`, Følner | true | R01 (carrier) |
| 2.4 Kesten | trivial group; `F₂`; `δ₁` on `ℤ`; `δ₁+δ₋₁` | `ρ = 1`, amenable; `√3/2 < 1`, not amenable; `ρ = 0` with `ℤ` amenable; `ρ = 2` (controls) | true as stated | R01 |
| 3.1 free value | `k = 1, 2`; recursion; (6.24) at `w = 0` and solved from (6.23) | `1`; `√3/2`; `(1+bz²)S − zAS = 1 − z²` rederived; `2b/2b = 1`; `(1+bz²)/(1−z²) = 2b/(b−1+(b+1)u)` | true | C01 |
| 3.2 images | `Γ = 1`; `k = 0` junk | `ρ = 1 ≥ √(2k−1)/k`; `0 ≤ 0` | true | none |
| 3.3 cogrowth formula | `φ` trivial; injective; `k = 1`; `F₂ → ℤ/5` (`a ↦ 1, b ↦ 2` and `b ↦ 0`) | `c = 2k−1`, `2kρ = 1 + (2k−1)`; `c = 0`, `ρ = √b/k`; `c ≤ 1 = √b`; `b₁..b₆ = 0,0,12,24,48,204`, `b₁ = 2`; (6.23) exact through `z¹⁸` | true | none |
| 3.4 Grigorchuk | `id : F₁ → F₁`; trivial `F₂ → F₂`; quadratic | `c = 0 ≠ 1`, `ℤ` amenable (so `k ≥ 2` needed); `c = 3`, not amenable; `c² − 2kc + b = (c−1)(c−b)` | true | none |
| Lean coercions | `√(2 * k - 1) / k`, `cogrowth φ = 2 * k - 1` | elaborated as `√(2 * ↑k - 1) / ↑k` and `2 * ↑k - 1` in `ℝ`, no natural subtraction | agree with README | none |

- Source locators checked against the text: 18 (Proposition 6.6 and proof; `Φ_E`, p. 177; pp. 180–181; Exercises 6.7, 6.9, 6.10, 6.58; Theorem 6.7; Lemma 6.8; (6.21)–(6.25); Theorems 6.10 and 6.11; attribution p. 189; Notes p. 224), all found at the stated printed pages.
- Library declarations opened at the pins: 24 (Mathlib `MonoidAlgebra` `Defs.lean` 76–81, `coeff_mul` 512, `mapDomain` 34, `mapDomain_mul` 169, `mapDomainRingHom` 278, `FreeGroup.norm` 443, `closure_toSubmonoid` 112, `symmDiff_triangle` 210, `card_smul_finset` 203, `radius_inv_eq_limsup` 66; Tau Ceti `HasFoelnerSets` 153, `hasFoelnerSets_iff` 159, `amenable_iff_hasFoelnerSets` 164, `not_amenable_freeGroup` 40, `card_smul_finset_symmDiff` 35, the layer-cake and Reiter lemmas, and others).
- Duplication by object: no return probability, walk spectral radius, expansion constant of a walk or cogrowth in the pinned Mathlib or Tau Ceti; `TauCeti/GroupTheory/Amenable/Expansion.lean` is a different statement (set expansion without Følner sets).
- Cross-roadmap citations resolved: AmenableGroups Layers 2, 3, 5, 6 on main (titles match); OperatorAlgebraDynamics D2 on main; FreeProbability F3 on main and §3.6 at its open head.
- Dependency check: `depcheck: 168 roadmaps, 1958 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: nine `declaration uses sorry` warnings, nothing else. One-tactic probe (`rfl`, `simp`, `simp_all`, `infer_instance`, `norm_num`, `positivity`): closes none of the nine theorems.
- Signatures: all 17 `#check`ed types compared with the README; `l2Norm` carries no `[Group G]` because its type does not mention the group structure; nothing changed.
- Headline theorems (1.2, 1.3, 2.2, 2.3, 2.4, 3.1, 3.2, 3.3, 3.4): all stated in `Suggested.lean`; no padding found. No change outside the roadmap folder.

Overlap check: read AmenableGroups (main and open head), ElectricalNetworksAndRandomWalks, KestenStigumAndCriticalBranching, HittingAndCoverTimes, FactorRigidity, AmenableTracesOnCStarAlgebras, and also FreeProbability, OperatorAlgebraDynamics, MarkovChainMixing, RandomWalksOnFiniteGroups; amenability and Følner sets: AmenableGroups (cited, not restated); the norm `2√3` of the adjacency sum on `ℓ²(F₂)`: FreeProbability F3 (here only a Check); nothing else shared.

Source independence: 12 passages compared with 1 source (routes of 1.2, 1.3, 2.2 steps 2–4, 2.3, 3.1, 3.3 with Pringsheim, statements of 2.1, 2.4, 3.4, two docstrings), none shared beyond formulas and standard names; largest share LyonsPeres, 18 of 18 locators; contents compared with LyonsPeres Chapter 6: independent (Layer 1 and half of Layer 2 divide §6.2, Layer 2 also draws on §6.1 and the Notes, §6.1's flow theorems and §6.4 onward are absent; the order 1 → 2 → 3 is forced by 2.2 needing 1.3 and 3.4 needing 2.4).

Research link: Kesten (1959) and Grigorchuk (1980), Northshield (1992), as presented in Lyons–Peres (2016), Chapter 6; the rank-two free-group value is the norm FreeProbability F3 uses to separate full and reduced C*-algebras, and OperatorAlgebraDynamics D2 recalls Kesten's theorem. Rests on the README and LyonsPeres §6.3 and §6.10.

## Not verifiable

- Kesten (1959), Grigorchuk (1980), Northshield (1992): not opened; the README cites them only by attribution through LyonsPeres, which was read.
- Paterson (1988), Theorem 4.13 (Følner's converse): not opened; the README does not rely on it (it uses the Tau Ceti theorem).

## Source issues

- **Error** in LyonsPeres at Exercise 6.10, printed page 191: the source says every `d`-regular multigraph has spectral radius `1` exactly when its cogrowth is `d − 1`; it should be restricted to `d ≥ 3`, since the line `ℤ` (`d = 2`) has spectral radius `1` and cogrowth `0`; affects nothing.
- **Misprint** in LyonsPeres at the table of contents, Chapter 6: the source says the chapter and §§6.1–6.3 begin on pages 177, 177, 184, 189; it should be 176, 176, 183, 188, as the running heads of this version show; affects nothing.

## For the human reviewers

- Ownership: FreeProbability F3 (on main, lines 300–315) proves the norm `2√3` on `ℓ²(F₂)` by a shift operator; here 3.1 with 1.3 gives the same value for every rank, kept as a Check of 1.3. Whether F3 should later cite 3.1 is yours to decide.
- Single source: all 18 locators are to one textbook (LyonsPeres, Chapter 6), read on its first author's page; the primary papers are named without locators and were not opened.
- Generality (R01): if finite support is an accepted boundary for this roadmap, R01 is the only blocking remark and the rest of the review stands as an acceptance.
