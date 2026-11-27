# Review of CopulasAndDependenceBounds (pull request #3200 at d0b28da)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check, example or proof route was found false, every source locator was read at its printed page and supports the statement as written, and `Suggested.lean` states all eleven headline theorems and elaborates with `sorry` as its only warning. There are two small corrections (one Lean signature that carries an unrelated index type, one imprecise step in the route of 3.2) and two format notes, none blocking. Two points are left to the human reviewers: a public Lean formalisation of the same subject that the description does not mention, and the scope.

## C01 — The countermonotone half of `frechetHoeffding_attained` is quantified over an index type and a family of laws it never mentions

The theorem bundles two unrelated statements: the comonotone law on `ι → ℝ` for a nonempty `ι` and a family `μ`, and the countermonotone law on `Fin 2 → ℝ` for `μ₁, μ₂`. An implementer who wants only the second conjunct (the attainment of the lower bound in dimension two, which 1.2 and the Examples use) must supply a nonempty finite type and a family of probability measures that play no part in it. The elaborated type shows the binders `{ι} [Fintype ι] [Nonempty ι] (μ : ι → Measure ℝ) [∀ i, IsProbabilityMeasure (μ i)]` in front of a conclusion whose last conjunct mentions only `μ₁`, `μ₂` and `Fin 2` (`Suggested.lean`, lines 66–75). The smallest change would be two theorems, one per law, each with its own binders; the README target of 1.1 (lines 92–97) can stay one paragraph naming both.

## C02 — In the route of 3.2 the events `{X ≤ x_n, Y ≤ y_n}` need not decrease

The route picks, in each square `(x, x + 1/n) × (y, y + 1/n)`, some point `(x_n, y_n)` with `H = FG`, and then takes the limit "by continuity from above of `P` along the decreasing events" (README, lines 359–360). The points are chosen independently for each `n`, so `x_{n+1} > x_n` is possible and the events are not nested; continuity from above does not apply to them as written. The conclusion is right: `H(x, y) ≤ H(x_n, y_n) ≤ H(x + 1/n, y + 1/n)`, and the outer term decreases to `H(x, y)`; the same sandwich gives `F(x_n) → F(x)` and `G(y_n) → G(y)`. Saying that (or passing to a monotone subsequence) makes the step true as stated.

## N01 — 3.2 gives no source

The independence criterion of 3.2 is the one target without any locator or attribution. The pitfalls preprint only records the weaker implication that quadrant dependence gives nonnegative correlation (p. 21). If no readable source states the criterion, a clause saying so would let a reader see that the omission is deliberate; the classical attribution (Lehmann, 1966) could be named without a locator, which I could not read either.

## N02 — Two locators in the References are attached to no claim

The References give Oertel, Prop 2.16, p. 12 and Thm 2.18, p. 13, but no layer cites them. Prop 2.16 (the distributional transform of one variable is uniform) is the uniform-margins step of 2.1 and could be cited there; Thm 2.18 is not used by the route of 2.1, which goes through null plateaus.

## Questions for the author

- The public repository `formal-applied-math/formal-mathfin` (Apache-2.0) has, in `MathFin/Foundations/Copula.lean`, a measure-level `IsCopula` on `Measure (ι → ℝ)` and a theorem `not_exists_isCopula_frechetLower` whose docstring gives the same three-event argument as the route of 1.2; `Sklar.lean` and `HoeffdingCovariance.lean` there cover continuous margins and square-integrable variables. The description's survey and "Prior work" do not mention it. Was it consulted? I could not tell from the files; if it was, the description should credit it, and if not, a line saying that 1.2's argument also appears there would be accurate.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions: `IsCopula`, `IsCopulaOf` | `d = 0`; `d = 1`; zero measure on the one-point space | `d = 0`: margin condition empty, Sklar's identity reads `1 = C.real univ`, so mass `1` forced; `d = 1`: `C(Iic u) = u = F(x)` | consistent with README remarks | none |
| 1.1 bounds | `d = 0`; `d = 2`, independence at `(1/2, 1/2)` | `d = 0`: `W = max(0 + 1, 0) = 1 = H`; `d = 2`: `W = 0 ≤ 1/4 ≤ 1/2` | true | none |
| 1.1 attainment | comonotone levels; countermonotone levels; `m = 0`, `m = 1` | levels `(0, m] ∩ (0, 1)` have length `m`; `[1 − F₂, F₁] ∩ (0, 1)` has length `max(F₁ + F₂ − 1, 0)` | true | C01 (signature only) |
| 1.2 dichotomy | `d = 0, 1, 2, 3`; `W`-volume of `[1/2, 1]^d` | `d = 0`: Dirac, `W = 1`; `d = 1`: `W(u) = u`; `d ≥ 3`: three events of mass `1/2`, pairwise null, union `3/2 > 1`; volumes `1 − d/2` = `1/2, 0, −1/2, −1, −3/2, −2` | true, both directions | none |
| 1.3 pointwise sharpness | `u_k = 0`, `u_k = 1`; `∑ a_k > 1`; `d = 0` | exceedance arcs `(c_k, c_k + a_k)` consecutive, total `min(∑ a_k, 1)`; `C(u) = 1 − min(∑ a_k, 1) = max(∑ u − (d − 1), 0)` | true | none |
| 2.1 existence | atom at `q`; `ΔF(q) = 0`; `y > q` on a plateau | mass `F(q−) + (t − F(q−)) + 0 = t`; Sklar sets differ by null plateaus | true | none |
| 2.2 converse | `d = 0` with `C = 0`; `d ≥ 1` | `d = 0`: `0 = 0`; `d ≥ 1`: a.e. `u ∈ (0,1)^ι`, Galois gives `ν(Iic x) = C(Iic F(x))` | true | none |
| 2.3 uniqueness | `d = 0`; Dirac at `(0,0)` (continuity dropped) | `d = 0`: `C.real univ = 1 ⇔ C = ν`; Dirac: comonotone `1/2` vs independence `1/4` at `(1/2, 1/2)`, both satisfy Sklar | true; hypothesis needed | none |
| 2.4 monotone invariance | `D_i = ∅, ℝ, Iio a, Iic a`; constant `T` | `ν_i(D_i ∆ Iic x_n) = ν_i((a − 1/n, a)) → 0` for `Iio a`; Lipschitz bound on both sides | true without continuity | none |
| 2.5 comonotonicity | three-atom chain law; `ν₂` | `ν₂`: `H(0,0) = 1/4` vs `min(3/8, 3/8) = 3/8`; nestedness of `S ∩ A_i` checked in both orders | true, all three implications | none |
| 3.1 Hoeffding identity | `ν₂`; three-atom law; Bernoulli(p); `X = Z, Y = −1/Z` | `ν₂`: `E X = E Y = 1`, `E XY = 5/4`, cov `1/4`; second law: `7/6`, `0`, `−11/6`; Bernoulli: `p(1 − p)`; last: integral `E Z · E(1/Z) − 1 = ∞` | true; each hypothesis needed | none |
| 3.2 independence criterion | `X` uniform on `{−1,0,1}`, `Y = X²`; `X = Y` Bernoulli(1/2); `X = Y` with `E X² = ∞` | `H(−1, 0) = 0 < 1/9`; cov `1/4`; junk covariance `0` with non-integrable `(X − E X)²` | true; Checks true | C02 (route wording) |
| Scope: Tau Ceti quadrant bound is the bivariate upper bound | `π(Iic a × Ioi b) = F(a) − H(a, b)` | `≥ (F(a) − G(b))⁺ ⇔ H ≤ min(F, G)`; coupling value `(F − G)⁺ ⇔ H = min(F, G)` | claim true | none |

- Source locators checked against the text: 16 (Embrechts–Lindskog–McNeil: Def 2.4, Thm 2.1, 2.2, 2.3, 2.4, 2.6, Ex 2.2, §2.4; Embrechts–McNeil–Straumann: Prop 2, (12), Thm 2, (17), Thm 4; Oertel: Prop 2.16, Thm 2.18, Cor 2.20), all at the printed pages given; the published version of the first confirmed through Crossref (title, volume, 2003, pp. 329–384).
- Library declarations opened at the pin: Tau Ceti `Probability/Quantile.lean` lines 164, 235, 247, 291, 317, 325, 775, 858, 934; `Probability/Cdf.lean` line 263; `MeasureTheory/OptimalTransport/Wasserstein/Quantile/Basic.lean` lines 67, 118; `.../Wasserstein/Rearrangement.lean` line 86 (namespace `TauCeti`); Mathlib `Probability/CDF.lean` lines 81, 90; `Probability/Independence/Basic.lean` lines 702, 713; `MeasureTheory/Measure/Basic.lean` line 307; `Measure/Stieltjes.lean` line 533; `Measure/Typeclasses/Finite.lean` line 459; `Measure/Typeclasses/NullSingletonClass.lean` line 123; `MeasurableSpace/Pi.lean` line 100; `Constructions/BorelSpace/Order.lean` lines 81, 598, 865; `Integral/Prod.lean` lines 230, 443; `OuterMeasure/Basic.lean` line 78; `OuterMeasure/AE.lean` line 320; `Measure/Restrict.lean` line 104. No copula, Sklar or Hoeffding-covariance declaration exists in either pinned library.
- Cross-roadmap citations resolved on main: OptimalTransport §3.7 (heading at README line 990); MathematicalStatisticsAsymptotic §6.4 (heading at line 1349, uses of the identity at lines 1363 and 1398); MathematicalStatisticsNonparametric (Kendall and Spearman statistics, lines 680–688).
- Dependency check output: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 11 `sorry` warnings and nothing else; the worker's automatic checks all passed.
- One-tactic probe: seven theorems (1.1 bounds, 1.2, 1.3, 2.1, 2.2, 2.4, 3.2) tried with `simp` over the unfolded definitions in a scratch file, none closes; the other four judged by reading (each needs a measure computation or Fubini).
- Signature pass: the elaborated types were compared with the README statements; the only binder a declaration loses is `[Fintype ι]` on `IsCopula`, `IsCopulaOf`, `comonotoneLaw`, whose bodies do not use it. README and Lean generality agree on all eleven theorems.
- Ownership against open pull requests was checked by object (copula, comonotone, countermonotone, Sklar, Fréchet–Hoeffding, quadrant dependence, Hoeffding identity, joint distribution function, distributional transform): no other owner.

Overlap check: read GaussianTailsAndOrthantProbabilities, StochasticOrders, RiskMeasures, StandardDistributions, PACBayesBounds; nothing shared (quantile functions are consumed from Tau Ceti by all; positive quadrant dependence appears in GaussianTailsAndOrthantProbabilities only as an example of its own 2.3).

Source independence: 16 passages compared with 3 sources (the 16 locators, with the routes of 1.1, 1.2, 2.1, 2.4 and the Conventions remark on function-level copulas set beside the sources' proofs), none shared; largest share Embrechts–Lindskog–McNeil, 10 of 20 locators in the layers; contents compared with its §§2.1–2.4: independent (the bounds precede Sklar here, comonotonicity sits with Sklar, Layer 3 is not in that text).

Research link: Layers 1–2 are the theorems of Fréchet (1957) and Sklar (1959) as stated in Embrechts–Lindskog–McNeil (2003) §2; Layer 3 is Hoeffding's (1940) identity as used in Embrechts–McNeil–Straumann (1998) Thm 3–4 and in MathematicalStatisticsAsymptotic §6.4 (van der Vaart, Ex 22.11). Rests on the README's sources, which I read.

## Not verifiable

- Lehmann (1966), the classical source for 3.2: not read (no legal copy looked for beyond the cited texts; the README gives no locator into it).
- Nelsen's book, to which Embrechts–Lindskog–McNeil refer for the proof of their Thm 2.4, and Sklar's proof of their Thm 2.2: not read; the README gives its own routes for both.
- The pitfalls preprint was read through OCR: the displays inside Thm 2 and the integral signs of (17) are garbled in the extraction; the statements were read from the surrounding sentences (its text, lines 591–597, 707–710, 1016–1029).
- The Checks of 1.3, 2.1 and 2.4 that report grid computations were not recomputed point by point; each is an instance of a theorem verified above.

## Source issues

- **Misprint** in Oertel, arXiv:1312.4997v3, at the proof of Corollary 2.20, p. 14: the source says the copula is the joint probability of the events for `U₁` and `γ₁`, `U₁` and `γ₂`, and so on up to `U_n`; it should be `U₂` with `γ₂` in the second event; affects nothing.

## For the human reviewers

- Licence/reuse: `formal-applied-math/formal-mathfin` (Apache-2.0), `MathFin/Foundations/Copula.lean`, defines `IsCopula (C : Measure (ι → ℝ))` by uniform margins and proves the `d ≥ 3` non-existence by the argument of 1.2; statements here differ in form and generality. The description does not mention it.
- Scope: the three sources read are two ETH preprints (one published in an Elsevier handbook, 2003) and an arXiv paper; the primary sources (Sklar 1959, Hoeffding 1940, Fréchet 1957, Lehmann 1966) were read neither by the author nor by me.
