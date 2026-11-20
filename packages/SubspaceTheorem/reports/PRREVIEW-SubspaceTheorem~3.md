# Review of SubspaceTheorem (pull request #2678 at c0ff588)

**Verdict:** needs changes

**Summary.** Changes are needed, for one sentence: the remark in 3.5 on what the primes of `p` and `q` contribute to Ridout's inequality gives a factor that is wrong whenever the nearest integer shares a prime with `q` (at `(p, q, k) = (3, 2, 2)` it gives `1/36` where the primes contribute `1/72`), and the description repeats it with "exactly". No stated theorem is affected, and every other statement, Check and example I recomputed holds. There are three small corrections and one format note, none blocking. The human reviewers still have the licence question about the cited formalization, and Bombieri–Gubler, the source cited most, could not be read beyond its chapter list.

## R01 (P2) — The factor that 3.5 says the primes of `p` and `q` contribute is not what they contribute when the nearest integer shares a prime with `q`

An implementer who takes the remark as the bookkeeping of the route would try to prove an identity that fails. In the remark of 3.5 (line 841): "without them the left side of Ridout's inequality lacks the factor `q^(−k) · gcd(N, p^k) / p^k`, about `(pq)^(−k)`, which the primes of `p` and `q` contribute".

With `β = N q^k / p^k` and `g = gcd(N, p^k)`, the numerator of `β` is `N q^k / g` and the denominator `p^k / g`. The primes of `p` contribute `g / p^k`, as the remark says, but the primes of `q` contribute `q^(−k) · ∏_{ℓ ∣ q} |N|_ℓ`, which is `q^(−k)` only when `N` is prime to `q`. At `(p, q, k) = (3, 2, 2)`: `(3/2)² = 2.25`, `N = 2`, `β = 8/9`, the `2`-adic factor of the numerator is `1/8` and the `3`-adic factor of the denominator `1/9`, product `1/72`; the remark's formula gives `(1/4)(1/9) = 1/36`. The pull request's description states the same formula with "exactly".

The smallest change: write the factor as `q^(−k) · ∏_{ℓ ∣ q} |N|_ℓ · gcd(N, p^k) / p^k`, or say that the primes contribute a factor at most `q^(−k) · gcd(N, p^k) / p^k`, with equality when `N` is prime to `q`. The upper bound is all the route uses, and the conclusion of the remark (no `ε` works without the finite places) stands. The description's "(exactly …)" needs the same change.

## C01 — 6.2 no longer gives the name under which another roadmap cites it

HeightsRationalPointsAndObstructions, at its open head, cites "SubspaceTheorem §6.2" for `NumberField.exists_finset_submodule_of_approxProd_le` (its README, lines 119 and 2114), the name the README on main proposes for 6.2 (main's README, line 1279). This head's 6.2 (lines 1531–1533) says that the statement is 6.3's `exists_finset_submodule_of_approxProd_le_extension` at `F = K`, "the name under which a consumer cites it", but nowhere mentions the earlier name, so a reader who follows that citation after the merge finds nothing. The description has the mapping; the README, which is what remains, does not.

One clause in 6.2 would do: that the name earlier proposed for 6.2, `NumberField.exists_finset_submodule_of_approxProd_le`, is this specialization of 6.3's declaration (written in prose if a code-font name of an undeclared declaration is unwanted).

## C02 — 9.2 uses `∏ C p > 0`, which 9.1's statement of the normalization does not include

In 9.2 (line 2227): "The forms need not be independent, since `∏ C p > 0` makes every determinant of the forms nonzero". The normalization as 9.1 states it (line 2171) asks only `∏ p, C p ≤ (∏ p, |det L p|_p)^(1/N)`. Evertse's (2.4) reads `0 < ∏ C_v ≤ ∏ |det|_v^(1/n)` (Evertse2010 lines 194–200), and the positivity is what 9.2's sentence rests on. Nothing stated is false, because 9.1 assumes the forms independent from the start; but the reader of 9.2 looks for the hypothesis and does not find it. Add `0 <` to the fourth condition of the normalization in 9.1.

## C03 — Two works are cited with locators and have no entry in the References

8.7 (line 2074) cites "Schlickewei 1990, §3" and (line 2086) "Schlickewei's class (3.12)"; the References list Schlickewei's papers of 1977 and 1992 only, so the locator cannot be followed. Likewise "Evertse's lecture notes, Theorems 7.7 and 7.8" (line 1720 and the supplier contract, line 2733) has no entry. Add the two entries (the second is the source DiophantineApproximationAndTranscendence §2.1 cites for the same theorems).

## N01 — 8.8 writes `natDegree f_i` for polynomials in several variables

In 8.8 (line 2123) the `f_i` are polynomials in `X_1, …, X_N`; `natDegree` is the one-variable notion, and the total degree (`MvPolynomial.totalDegree`) is meant.

## Previous findings

The previous review, of this same head, had no finding, small correction or format note. Its one open question is settled, and nothing is asked of the author:

- The Jensen bound of 2.2 (lines 599–602), `P.logHeight ≥ (32 log 2 / (e π)) D − 256 log (D + 1)` over `ℚ(2^(1/256))`, is correct. At each embedding `σ`, Bernstein's inequality on the unit circle gives `|P^σ(e^(iθ))| ≤ ‖P^σ‖_∞ (D|θ|)^k / k!` at a zero of order `k = D/2` at `1`, hence `≤ ‖P^σ‖_∞ 2^(−D/2)` on the arc `|θ| ≤ 1/(4e)`, of measure `1/(4eπ)` of the circle. Jensen's formula then gives `log |lc P^σ| ≤ log ‖P^σ‖_∞ − D log 2 / (8eπ)`, and `‖P^σ‖_∞ ≤ (D + 1) max |coeff|_σ`. Summing over the `256` embeddings and using the product formula for the leading coefficient gives `256 · log 2 / (8eπ) = 32 log 2 / (eπ) ≈ 2.597 > 2 log 2 ≈ 1.386`.

## Questions for the author

- In the example of 9.5 (lines 2333–2338), "`[K : ℚ]` in place of `[E : ℚ]` would give `κ = 100 < α`": with `Z = N! H^(N [K : ℚ]) = 2 · 5² = 50`, `t = 1` and `N = 2`, `κ = c(ℚ, ∅) · 50`, so `κ = 100` needs `c(ℚ, ∅) = 2`. Is that the value of 8.7's Minkowski constant over `ℚ`? 8.7 does not fix `c(K, S)`, so I could not check it. The conclusion holds for every `c(ℚ, ∅) ≤ 2`, since `α ≈ 100.0001`.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 0.2 conjugate absolute values (sampled) | `ℚ(√2)/ℚ` at `∞`; `ℚ(2^(1/3))/ℚ`; `(1+i)` over `2` | two real places swapped; one real and one complex place, trivial automorphism group; `|2|_𝔓 = 1/4 ≠ 1/2` | sound |
| 3.3 forms of Roth (sampled) | `p`-adic at `ε = 0`, `α = 0`, `n = p^k`; target `∞` at `β = 0`; Ridout at `x = 0` | `p^(−k) = |n|^(−1)`; `(max 1 0)⁻¹ = 1` against `min 1 0⁻¹ = 0`; left side `0`, one point | sound |
| 3.5 Mahler on `(p/q)^k` (sampled) | `(3, 1)`, `(4, 2)`, `k = 0`; remark at `(3, 2, 2)` | integers, distance `0`; `β = 8/9`, primes contribute `1/72`, remark's formula `1/36` | theorem sound; remark R01 |
| 3.6 counting (sampled) | `N = |S|`; `c = 3`, `X = log 16 / (c − 1)` | `c = −1`; `cX − log 4 = 2.7726 = ((c+1)/2) X`, so ratio `(c+1)/2` per class | sound |
| 4.5 exterior powers (sampled) | telescoping `k = R … n−1`; `n = 3, p = 2, k = 1` | product `μ(R−1)/μ(n−1) ≤ μ(n−1)⁻¹`; 2 of 3 subsets, hyperplane | sound |
| 5.1 reductions (sampled) | `ℚ`, `S = {2}`, `x = (2^k)`; `x = (1)`, `L = 2X`; empty `ι` | `H = 1`, `H_aff = 2^k`; `log 2 > 0 = logHeight x`; no `x ≠ 0` | sound |
| 5.3 index along forms (sampled) | `x₁ + x₀² − x₀`, `M = x₁`; `X 1 + X 2` | not in `(x₁)`, index `0`; dehomogenized `x₁`, index `1`; minimum `(0,0)` not a monomial | sound |
| 5.4 height of `V(Q)` (sampled) | `2`-adic, `a = z = (1,1)`; real place; `w = (N, 0)` | `1 ≤ 2 · 1/2`, equality; `1 ≤ 2 · 2`; line height `1`, coordinate height `N` | sound |
| 5.5 penultimate minimum (sampled) | `card ι = 1`; empty `ι`; exponents `(1, −2)` over `ℚ` | set `⊆ {⊥}`; weight `0`, hypothesis fails; set `{y = 0}` | sound |
| 6.2 coefficients in `K` (sampled) | one-element `ι`, form `X` over `ℚ` | `approxProd = 1`, `H = 1`, `1 ≤ 1`: every `x` a solution, only proper subspace `0` | sound with `Nontrivial` |
| 6.3 algebraic coefficients (sampled) | `K = ℚ(√2)`, point `(1, 2)` | heights `2` and `4`; exponent over `K` becomes `−(card ι + ε)/2` | sound |
| 6.4 affine form (sampled) | `S`-integral `x`, `P` = product of local sup norms | `affineProd = approxProd · P^(card ι)`, `P ≥ H`, so `approxProd ≤ H^(−card ι − ε)` | sound |
| 6.5 general position (sampled) | `X₀, X₁, X₀+X₁`; `X₀, X₁, X₀`; every `B v = ∅`; `B = univ` | in general position; not; `generalProd = 1`, only height-`1` points; equals `approxProd` by `rfl` | sound |
| 6.7 on a subspace (sampled) | `U = ⊤`; `card κ < finrank U` | 6.3; fewer factors, completed by forms of bounded factor | sound |
| 9.5 count (sampled) | `T³ − 100T² − 1`; forms `(2X, 2Y)`, `C = 2`, `c = (1, −2)` | root `100.0001`, `α^(1/3) = 4.64 < 5`, `Z = 50` or `31250`; `|2k| ≤ 2k` holds, `|2k| ≤ k` fails | sound; one question |
| Conventions, untyped places | `|·|^(1/j)`, `j ≤ 4`, point `(1, q)`; `3`-adic `w` over `∞` | exponent `−25/12 = −2 − 1/12`, equality for all `q`; factor `(1/9)^(card ι)` under `x ↦ 3x` | sound |
| 0.4 Liouville | `α = 1`, `β = −1`, `2`-adic; `√2` | `1/2 = 1/2`; `1/(72 q²)`, `0.086 ≥ 1/288` | sound |
| 1.2 Wirsing | `n = 0`; `w_n = ⊤`; `√2`, `n = 1` | `1 ≤ 0` fails, third reads `0 ≤ 0`; `⊤/⊤ = 0`; `2 ≤ 2` in both | sound |
| 1.3 classifications | `w_n = ⊤` for one `n`; transcendental `ξ` | `w = ⊤` by monotonicity, classes disjoint; `w/2 ≤ w* ≤ w`, `w* ≥ 1/2` | sound |
| 2.1 multihomogeneous tail | `n = 1, 2, 3, 5, 10`, 19 values of `η` each | Chernoff rate below `−(n+1)(n+2)η²/4` throughout; smallest margin `0.0007` | sound |
| 2.2 auxiliary polynomial | `m = 0`; `N = 0`; `ℚ(2^(1/256))`, `t = 1/2` | `V₀ = 1` forces `N = 0`; `P = 1`, height `0`; `2.597 D − 256 log(D+1) > 1.386 D` eventually | sound |
| 3.2 Roth over `K` | `κ = 2`, `ξ = √2 − 1`; `κ = 0`; height-`1` rationals | Dirichlet solutions have `|p| ≤ q`; all `β`; `min`-form adds `0, ±1` | sound |
| 3.7 moving targets | pair `(0, 0)`; pair `(2, 2)`; empty `S` | `0 = o(0)` without `1 +`; `1 + log 2 = O(log 2)`; product `1`, needs `H = 1`, excluded eventually | sound |
| 4.1 domains | `2`-adic, `Q = 3/2`; imaginary quadratic, `L = aX` | covolume `1`, floor `1`, book `2/3`; area `π (Q^c/|a|)²` | sound |
| 4.2 minima over `K` | `ℤ`, `[−1, 1]`; index bookkeeping | `2 ≤ 2 ≤ 2`; `μ_l^d ≤ ∏_{j<d} λ_{dl+j}`, `λ_{dl+j} ≤ c_K μ_l` | sound |
| 4.4 Evertse's lemma | `x 0 = (N, N)`, `μ = (N, 1)` | hypothesis holds, conclusion asks `N ≤ C` | sound |
| 6.1 parametric | `card ι = 1`; empty `ι` | `T = {⊥}`, `⊥ ≠ ⊤`; weight `0`, hypothesis fails | sound |
| 7.1 exponents | `2^(1/3)`; rational `α`; `n = 0`; one linear form at `1, α, …, α^n` | `1, 2, 2, …`; `min(n, 0) = 0`; `0`; exponent `1 − (n+1) − δ` gives `w_n ≤ n` | sound |
| 7.2 criterion | `w = 3`, `j = 3, 4`; `w = 1`; route at `∞` and at primes of `b` | `9 > 8`, `17 ≤ 20`; every sequence; thresholds `w > 2 + 2r/s` and `w > 1` | sound |
| 7.3 complexity | digits of `∑ 2^(−2^k)`, `n ≤ 200`; identity on `ℕ` | `2, 4, 6, 7, 9`, `p(n) ≤ 2n`, equality at `1, 2, 3`; `ncard = 0` | sound |
| 8.1, 8.2 unit equations | `(9, −8)`; `(2^k, −2^k, 1)`; zero coefficient; central quantity | `{2,3}`-units; degenerate, infinitely many; set empty; exactly `H^(−3)` | sound |
| 8.3 decomposable forms | family `X, Y, 0`; `X, 2X`; `X, Y` | connected through `0`, product `0 ≠ m`, vacuous; adjacent; `xy = 1` has `(2^k, 2^(−k))` | sound |
| 8.4, 8.5 equations | `g = 0`; `x²y(x−y)`; `y² = x²(x−1)`; `(3, 5)` | excluded by root count; three factors; `(t²+1, t(t²+1))`; `27 − 2 = 25` | sound |
| 8.6 gcd bound | `(2^k, 2^k)`; `u = 1`; `u = −2^k`, `v = 4^k` | `2^k − 1 ≥ 2^(k/2)`, relation `(1, −1)`; relation `(1, 0)`; gcd `2^k + 1`, relation `(2, −1)` | sound |
| 8.7 vocabulary | `y = (1, 1)`; empty `ι` | `H(1,1,−2) = 2 = 2 · 1`; `1` against `0` | sound |
| 8.8 Nullstellensatz inequality | `δ = 0`; `r = 0` | `c ≤ |f_i|`; `‖P‖^M ≤ C ‖P‖^(M−1)` bounds the zeros | sound |
| 9.1 systems | exponents `(1, −2)`; `N = 1`; weight `0` with `S = {2}`; `C p = 0` | `(k, 0)` and `(x, ±1)`, `|x| ≤ 1`; `x = 1`; `(2^k, 1)`; only `x = 0` by independence | sound; C02 |
| 9.2, 9.3, 9.4 | `(1 1; 1 −1)`; `N!` against `Q ≥ N^(2N/δ)`; `ω < 1` | `2 = 2!`, `2`-adic `1/2`; `N!/N^N < 1`; bound negative, intervals empty | sound |

- Source locators checked against the text: 17, in 4 sources. Evertse2010: (2.3), (2.4), Theorem A, the definition of large solutions, Theorems 2.2 and 3.1, Propositions 4.1 and 4.2, Lemmas 4.3–4.5, the proof of Theorem 2.1 (lines 172–206, 252–276, 383–394, 407–410, 446–476, 514–527, 623–656). Evertse1996: Lemmas 18 and 27 (lines 1163, 1520). AdamczewskiBugeaud2007: Theorem 1 and Condition `(∗)_w` (lines 101, 250–260). Schlickewei1992: the Theorem (line 100).
- Library declarations opened at the pins (Tau Ceti unless marked): `IsAlgebraic.mahlerExponent_le` (`NumberTheory/DiophantineApproximation/MahlerExponent.lean`:147), `IsAlgebraic.irrationalityExponent_eq_two` (`…/Roth/Theorem.lean`:295), `NumberField.approxProd` (`…/Subspace/ApproxProd.lean`:113), `TauCeti.NumberField.approxDomain` (`…/Subspace/ApproximationDomain.lean`:86), `NumberField.exists_evertse` (`NumberTheory/NumberField/Global/Approximation/Evertse.lean`:70), `TauCeti.IsNondegenerateSolution` and `TauCeti.IsNondegenerateHomogeneousSolution` (`NumberTheory/UnitEquation/Nondegenerate.lean`:63, 68), `MvPolynomial.card_multiMons` (`RingTheory/MvPolynomial/MultiHomogeneous.lean`:243), `MvPolynomial.coeff_blockSubst_hasseDeriv_eq_zero` (`RingTheory/MvPolynomial/HasseDeriv/BlockSubst.lean`:190), `AbsoluteValue.instMulActionAlgEquiv` (`Analysis/AbsoluteValue/Action.lean`:41), `Rat.mulHeight_le_max_abs` (`NumberTheory/Height/Rat.lean`:74), `Height.mulHeightAff` (`NumberTheory/Height/Affine.lean`:99); Mathlib `Polynomial.homogenize` (`Algebra/Polynomial/Homogenize.lean`:40), `Real.abs_ofDigits_sub_ofDigits_le` (`Analysis/Real/OfDigits.lean`:98). About thirty further cited names were found by search at the pin.
- Duplication by object: the pinned Tau Ceti and Mathlib have no declaration of any of the 22 definitions and 38 sorried theorems of `Suggested.lean` under these or other names (searched for the unit equation over a number field, Wirsing's inequalities, Mahler's classes, stammering words, the complexity function, Ridout, triangular connection). Tau Ceti's unit-equation files hold only the nondegeneracy vocabulary and height bounds, and its Thue theorem is over `ℤ`, as the scope table says.
- Cross-roadmap citations resolved: 12 named targets of DiophantineApproximationAndTranscendence on main (§2.1 lines 911 and 913, §2.3 line 951, §2.5 line 1328, §2.6 lines 1586 and 1611, §2.8 lines 1805, 1895, 1910), SuccessiveMinima targets 0.1.2 and 2.1.4 on main (lines 188, 25), the two relative links, and HeightsAndUnits and GlobalNumberFields among the completed roadmaps. HeightsRationalPointsAndObstructions, at its open head, cites §6.2 (C01).
- Automatic checks: every check passed. The dependency check prints `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`: no UPWARD or CYCLE line. Nothing outside the folder is changed.
- Elaboration: `lake env lean` on `Suggested.lean` gives 38 `sorry` warnings and nothing else; one `import Mathlib`, nine `TauCeti.*` modules, no `set_option`, no sorried data. The elaborated types of 6.1, 6.3–6.7, 3.2, 3.4, 5.1, 5.5, 8.4 and 9.1 agree with the README; the six declarations in which a section binder does not appear (`onePointApprox`, `generalProd` and the like) do not use it. One-tactic probe: each of the 38 sorried theorems was tried with `simp` on a copy; none closes. The two proved `example`s and the proved 6.6 theorem are the consistency checks the README names.
- Headline theorems: Roth over `K` (3.2), the Subspace Theorem (6.1, 6.3, 6.4, 6.5, 6.7), the exponents (7.1), the unit equation (8.1, 8.2), Thue and hyperelliptic (8.4, 8.5), complexity (7.3) and the gcd bound (8.6) are all stated. The module docstring names the three not stated (the counts of 3.6, of 6.1's interval form and of 9.5) and why.
- The pull request's text against the head: 45 Check blocks with 95 bullets, as stated; ten layers; the items on the conventions, 2.1, 8.4, 8.7, 9.1 and `Suggested.lean` agree with the head. The one sentence the head's mathematics contradicts is the "(exactly …)" of the 3.5 item (R01).
- Overlap check: read DiophantineApproximationAndTranscendence (scope, §2.1, §2.3) and SuccessiveMinima (overview) on main and HeightsAndUnits among the completed roadmaps; at their open heads, HeightsRationalPointsAndObstructions, EffectiveDiophantineMethods and ArithmeticDynamics were searched for the shared objects and the passages found were read, not the whole texts. The instances over `ℚ` (Roth, Thue, Thue–Mahler, the Subspace Theorem at integer points, unit equations over `ℚ`) and the absolute quantitative theory belong to DiophantineApproximationAndTranscendence, and this roadmap cites them without restating; HeightsAndUnits leaves the `S`-unit equation to that roadmap; the Subspace Theorem over a number field (§6.2–6.3) belongs to this roadmap, and HeightsRationalPointsAndObstructions §4.7a is an adapter that consumes it; EffectiveDiophantineMethods treats effective `S`-unit equations over `ℚ` and cites DiophantineApproximationAndTranscendence; ArithmeticDynamics shares nothing.
- Source independence: 12 passages compared with 4 sources (9.1's normalization, 9.2, 9.3 and 9.4 with Evertse2010; 5.4 and 6.1's grid with Evertse1996; 7.2's vocabulary and 7.3 with AdamczewskiBugeaud2007; 9.5 with Schlickewei1992; 8.7 with Evertse1984 in the previous round), none shared beyond formulas and lists of hypotheses that can be written one way; largest share Bombieri–Gubler, about 50 of 174 source mentions; its text could not be read, and its contents were compared at chapter level only, from the publisher's public contents page: Layers 0, 2–3, 4–5, 6, 7, 8 draw on Ch. 1, Ch. 6, §7.5 with App. C, §7.2, §7.3, Ch. 5 with §7.4, which is not the book's order (1, 5, 6, 7.2, 7.3, 7.4, 7.5), and Layers 1 and 9 have no chapter: independent at that level. The order here is forced by 6.1's need of 4.5 and 5.5 and Layer 8's need of 6.4 and 6.5.
- Research link: Layer 6 is the Schmidt–Schlickewei Subspace Theorem (1972, 1977) in the form of Evertse–Schlickewei (2002); Layer 9 is the elementary half of Evertse (2010); 7.3 is Adamczewski–Bugeaud (2007, Theorem 1); 8.6 is Corvaja–Zannier and Bugeaud–Corvaja–Zannier (2003). Rests on the README's references and on Evertse2010 §2 and AdamczewskiBugeaud2007 line 101.

## Not verifiable

- Bombieri–Gubler, *Heights in Diophantine Geometry* (2006): no open copy and none held locally; only the chapter list on the publisher's page was read. This covers the locators of the sampled 0.2, 3.3, 3.5, 3.6, 4.5, 5.1, 5.3, 5.4, 5.5, 6.2, 6.3, 6.4, 6.5 and 6.7.
- Mahler 1957, Ridout 1958 and Davenport–Roth 1955 (*Mathematika*), cited at 3.5, 3.3 and 3.6: the publisher's pages are closed.
- Vojta 1987 (LNM 1239), cited at 6.5, and Corvaja–Zannier 2003, cited at 8.6: no open copy found.
- Evertse–Schlickewei 2002, Lemmas 12.3–12.4, cited at 5.4: the publisher's page is closed.
- Schlickewei1992 and Evertse1996: the extracted text lost the displayed formulas, so the statements were read only as far as their prose goes.
- The value `κ = 100` in the example of 9.5 (see the question above).

## Source issues

- **Misprint** in Evertse2010 at Proposition 4.1, p. 12: the source says the window is a condition on the norm of `x`; it should be a condition on the height `H(x)`, as its proof uses; affects nothing.
- **Misprint** in Evertse2010 at the definition of large solutions before Theorem 2.1, p. 7 (arXiv v1): the source says the threshold is the maximum of `H` and `n^(2n/δ)`; it should be the maximum of `2H` and `n^(2n/δ)`, as Theorem 3.1 and the proof of Theorem 2.2 use; affects a stated result.
- **Error** in Evertse2010 at Lemmas 4.4 and 4.5, p. 15: the source says a set whose determinants are bounded by `D` lies in at most `100^n D^(1/(n−1))` subspaces for every positive `D`; it should be `100^n max(1, D)^(1/(n−1))`, since one nonzero point needs one subspace however small `D` is; affects a stated result.

## For the human reviewers

- **Licence.** The README's Provenance section (line 2374) maps the milestones to `rwst/Subspace-Theorems` at `09835cb`, Apache 2.0, "by the author of this roadmap". `Suggested.lean` was not compared with that repository.
- **Not tested.** Bombieri–Gubler, the source with the largest share of the locators (about 50 of 174 mentions), could not be read legally; the wording comparison did not cover it and its contents were compared by chapter only.
