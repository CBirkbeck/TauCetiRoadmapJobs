# Review of LocalGainOfThetaChains (pull request #2915 at 288fa8c)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LocalGainOfThetaChains/`
**Verdict:** needs changes

**Summary.** Changes are needed for one sentence: the Summary says that `Drop` contains every prime inert in `K` and in `ℚ(√−q)` below `(1 + ρ_B)X′` with a power in the band, while 4.17 (b) and the formal proof drop such a prime only when `p ≥ p₀`. Everything else that I recomputed or read against the formal proof agrees, including the new plane count 4.15e′, which matches its formal statement clause by clause, and all fifteen targets of the sample. There are four small corrections and one format note, none blocking; the scope and licence of the single source remain for the human reviewers.

## R01 (P2) — The Summary says `Drop` contains every prime with a power in the band; by 4.17 (b) it contains those with `p ≥ p₀` only

A reader of the overview takes the primes below `p₀` with a power near `X′` to be excluded from the gain inequality, and they are not: they are candidates and are served by Theorem II. The Summary (line 5) says: "`Drop` contains every prime inert in `K` and in `ℚ(√−q)` below `(1 + ρ_B)X′` with short orbits or a power in the band". In 4.17, clause (b) of `Drop` (line 1694) begins `p₀ ≤ p < (1 + ρ_B)X′`, the definition of a candidate (line 1678) asks for no power in the band only "for `p ≥ p₀`", and `𝒫_band` in 4.17c (line 1843) is the set of primes `p₀ ≤ p < X′`. So a prime `p < p₀` of split type, inert in both fields, with `ord(h_p) ≥ x^{ε/4}`, a power in `[(1 − ρ_B)X′, (1 + ρ_B)X′]` and `𝔖(p) ≤ x^{−ε}` satisfies none of (a)–(e) and is not in `Drop`. The formal proof agrees with 4.17: the band clause of `Formalism.MainNotions.NoGain` (`Formalism/SharpRestriction/ParConsts.lean`) carries `p0 ≤ p`, and so does `Formalism.MainNotions.G.InBand`.

The smallest repair is in the Summary: "… with short orbits, or at least `p₀` with a power in the band, …" (or "a power in the band (for `p ≥ p₀`)").

## C01 — 4.15e′ takes its ring from "an unramified quadratic setting (4.15)", which 4.15 does not define

The plane count (line 1408) says "Let `𝒪` be the discrete valuation ring of an unramified quadratic setting (4.15)". Section 4.15 has no such term (its only occurrence is in the name of a file of the formal proof, line 1241), so the hypotheses on `𝒪` under which the formal proof has the statement cannot be read from the README. In `Formalism.MainNotions.G.UnramifiedQuadraticSetting` (`Formalism/SharpRestriction/GrowthBounds/UnramifiedQuadraticSetting.lean`) they are: `p ≥ 5` prime; `n′` even and `≥ 2`; `W` a complete discrete valuation ring with uniformiser `p` and residue field of `p^{n′}` elements, with a lift `σ` of Frobenius of order `n′`; `𝒪` a complete discrete valuation ring, finite over `W`, with a uniformiser `w`, `w² = p`, residue field of `p^{2n′}` elements, in which every integer is a square. One sentence stating these in 4.15e′ (or in 4.15, under that name) would do. The range "`n′ ≥ 1`" at the head of 4.15e′ is then "`n′ ≥ 2` even", which a valid system of frames forces anyway (`fr(j, i)` and `fr(j, i) + n′` are both even).

## C02 — In the Route of 4.15d, "`q` the probability that a tile is marked" with "`q ≤ 1/2`" is right only for the lower bound of the previous sentence

Line 1325 defines `q` as the probability that a tile is marked and uses `(1 − q)^{M₀−1} ≤ 2(1 − q)^{M₀}` "(`q ≤ 1/2`)". For the true probability this can fail within the hypotheses: `δ = 0.99` (`u = 2`), `ω₀ = 0.01`, `r = 2`, probability `0.99` at the even positions of the even cells and `0.0099` elsewhere give `0.9901¹⁴·(0.99·0.9901)⁶ ≈ 0.77`. With `q` read as the displayed lower bound `(1−δ)^{u(3r+1)}(⌊u/2⌋ω₀δ(1−δ)^{u−1})^{3r}`, the step is correct (`uδ(1−δ)^{u−1} ≤ 1/2` for `u = ⌈1/δ⌉`, so `q ≤ 4^{−3r}`) and gives the second term of `p_orb` as stated. "With `q` this lower bound" would make the sentence exact; the statement of 4.15d is unaffected.

## C03 — The note of 4.15e′ calls the hypotheses of the formal proof "the admitted inputs of 4.14", which is the refined gain on the Hecke image

Line 1444 says the plane count is proved "under the admitted inputs of 4.14 (`Formalism.MainNotions.SelectionLemmas.AdmB`)". The thirteen clauses of that hypothesis are: the frames supplied by a good orbit (4.15d); the laws of the type bounds `ub`, `lb` under products and sums, and under renaming and extension of scalars; Weyl's dimension formula, the branching rule and two Pieri sums as counts of standard fillings; the count `#{r-planes of 𝔽^k} ≥ |𝔽|^{r(k−r)}`; five statements from the file that holds the statement of 4.14c; and one statement on the segment spaces. None is a statement of 4.14. Naming 4.14c and 4.15d (the *Needs* line already does) and "the classical facts on `GL_k`" would tell the reader what is assumed. The note of 4.15f (line 1468) uses "the inputs of 4.14" in the same loose sense for 4.14a–4.14h.

## C04 — The description does not say that this folder and five of its suppliers are carried by the family pull request #2954

The description says "Sub-roadmaps of the family and other roadmaps that are still in open pull requests merge first" and that the family index is carried "with identical content, by every pull request of the family". At this head, five family suppliers of the supplier contracts (FrobeniusRestrictedRieszSums, TaylorBoundsAndDepthsOnHeightTwoFormalGroups, HodgeTateLatticesAndLubinTateLogarithms, ThetaLiftsForDefiniteUnitaryGroups, DiscreteSeriesCoefficientsAndAutomorphicMetrics) are in no open pull request of their own (#2920, #2914, #2904, #2897 and #2909 are closed); they exist only at the head of #2954, whose description says it merges the family in one piece. That head (`e79a6cb`) carries this folder byte for byte, and its family index differs from this one in the entry of BernoulliBoundsForClassGroupEigenspaces. A sentence such as "this folder is also carried, unchanged, by #2954, which merges the family in one piece and carries the family suppliers that have no pull request of their own" would be right; no order between the two pull requests is stated at present.

## N01 — The clause letters of 4.9e and 4.9f still run (b), (c), (f), then (d), (e), (g), (h)

(f) stands in 4.9e (line 348) before (d) and (e) of 4.9f (lines 379, 405), and (a) is in 4.9. A sentence at the head of 4.9e saying that the letters are shared across 4.9–4.9f would be enough.

## Previous findings

The previous report (of `8e10391`) had no finding. Its small correction and format notes, at this head:

- C01 (the docstring of `Suggested.lean` on the Kostant form) — withdrawn; the text was right. The docstring says "the Kostant form of an enveloping algebra", and the pinned Tau Ceti has `TauCeti.UniversalEnvelopingAlgebra.kostantForm` (`TauCeti/Algebra/Lie/UniversalEnveloping/Kostant/Form.lean`, line 125), a subring of the universal enveloping algebra of any Lie algebra over `ℚ` generated by divided powers and binomials. The earlier remark looked only at the `𝔰𝔩₂` files.
- N01 (two forms of the locators into the formal proof) — repaired: all 60 paths are now written without the prefix, and References says "the file paths given at a target are relative to the directory `src/` of the first commit of that repository"; each of the 60 exists in that tree.
- N02 (clause letters of 4.9e, 4.9f) — not repaired; written again as N01 above.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Summary, `Drop` against 4.17 (a)–(e) and `NoGain` | `p < p₀`, split type, long orbit, power in band, `𝔖(p) ≤ x^{−ε}` | Summary: in `Drop`. 4.17: (b) needs `p₀ ≤ p`; candidate; not in `Drop`. Formal: `p0 ≤ p ∧ ∃ i, |p^i − X′| ≤ ρ_B X′` | Summary false | R01 |
| Headline (1) against 4.10 (i), 4.11 (iii) | exponents; hypotheses | both `g⁰_j + F_j − E_{u,j} + [j=1]v_p(D_Γ)`; chain `Σ_j(…) + v_p(D_Γ)`; period `⌊e_𝔭Σ_j(…)⌋` | agree | none |
| Headline (2) against 4.14 (a), 4.15c | `τ`, colength, `mΣsh = 1/2` | `τ = e + Σ m(⌈dep_v⌉ + D_p + 1)` both; `e^{1/2} − 1 = 0.649 ≤ 2·(1/2)` | agree | none |
| Headline (3) against 4.16 (i), (ii) | inclusion, length, period | `N_u ⊂ p^{τ_N}M_u`; `≤ e_𝔭 d^{all}_u(τ_N + 𝔦)`; `⌊e_𝔭𝔊_u⌋` on both | agree | none |
| Headline (4) against 4.17a (ii), 4.17b, 4.17c (ii) | bounds | `0 ≤ g_j ≤ 4|Φ_top|a/p`; same inequality; `3m·a|Φ_top|(x^{−1} + x^{−h_A+ε} + x^{−c_io} + x^{−2+ε})` | agree | none |
| Conventions: `γ_LT`, weights | `p = 5` | `5/24 = 0.208333`; `Σ_{i odd}5^{−i} = 0.208333` | holds | none |
| 4.9a against `KerInert.IntInert` | hypotheses | formal: `5 ≤ p`, `(−d/p) = −1`, a model, its logarithm, a local orthonormal basis, combinations `IsComb`; README (ii): the same, in a model of unit discriminant | matches | none |
| 4.9b against `Th1.Top.HypShape`, `EvenConditionsInert` | conclusion | formal: `U0` integral, `Φ ≃` sum of coboundaries, `Θ = exp(−Φ)·U0`, integrality of 4.9a assumed; README: `Θ = U₀·exp(−Φ)`, `Φ ≃ Σ_eβ₀(X_e, Y_e)` | matches | none |
| 4.9c Check and `ThetaKernelShapeAtD` | `d = 7, 11, 19, 43, 67, 163`, lattice `ℤ + ℤ(1+√−d)/2` scaled to discriminant 1 | `√d·|s₂| = 0.2500, 0.6667, 2.0000, 12.000, 38.000, 724.00`; README `1/4, 2/3, 2, 12, 38, 724`; shape `ShapeD` at class `ramD` | holds | none |
| 4.9d against `EvenConditionsAtC`, `G.IsCs` | the clause named | second clause is at `IsCs` = inert, odd order of `h_p`, `h_p ≠ 0`; README: odd conjugate type iff `h ≠ 1` of odd order | matches | none |
| 4.9 Check, types | `Frob = ch`, `c` of order 2 outside `Φ` | `(ch)^n = c` iff `n` odd and `h^n = 1`; `ord(ch) = ord h` (even) or `2·ord h` (odd) | holds | none |
| 4.9e against `G.g0`, `G.gU`, `G.dl`, `G.Sv`, `G.tauP`, `G.ioP` | formulas | `g0`: odd `e` not excluded, `(α/p^e − cap)₊`, less `dl`; `gU = γΣα − Σ_{odd tops}Σ min − dl`; `dl = dl1·n′N_m²log_p 2a + dl2·|𝔗|log_p²2a`; ceiling in `Sv` | matches | none |
| 4.9f against `Eval`, `EatT`, `EatG`, `EatD`, `EatI`; Check | `(k,m,t) = (6,2,13)`, `w₁ = 18` | `EatT = 2ΣW + fN_m + |tops|(t+1)(m+1)/4`; `a⁺_i = s⁺_i + 6 + i = 1` (six times), `a⁻_0 = 26 − 18 − 7 = 1`, other expression `−15` | holds | none |
| 4.9f (e), size at `d` | pairs `f/2`, `w ≤ 2b′`, `c^d ≤ 4kb′ + 2b[top]` | first summand `≥ −(k−1)fb′/2`; second `≤ fkb′ + |Φ_top|b`; sum `≤ |Φ_top|b + 2fkb′` | holds | none |
| 4.10 against `FormalGroupSystem.Conclusion2`, `OneLiftAtDiscriminant`, `LiftIntegrality`, `JetIntegralityBis`, `SelectionServed` | shapes | `Σ_v g0v − dG`; at `ramD`: `F − EatD − v(D_Γ)`; elsewhere `−v(D_Γ)` from step 2; jets `≥ 0` at level-free places off `d`; six clauses bundled | matches | none |
| 4.10a against `UsedTuplesBoundByConstant`, `errC`, `SgAtG`, `sumFE_atG_le` | bound, constants | `−Σ_j vNN − C1·f(m·N_m(N_m + t) + m³ϑ)`, valuation divided by `e`; `2C1 ≤ c.g`; `Σ_j(F − E) ≤` the same | matches | none |
| 4.11 against `DIV.PathBound` | stabiliser count | formal `Σ_j(s_j − v_p(D))`; README `ΣB_j − (m−1)v_p(D_Γ) − v_p(D_Γ)` | equal | none |
| 4.12 (a) lattice count | `(N_{j−1}, N_j, i) = (1, 2, 1)`, `x` primitive and `x ≡ 0` | `1 = 0 + 1`; `q + 1 = q + 1` | holds | none |
| 4.14a and corollary | `n = 1`, `M = X`, `t_j = j`, `Y₀ = p^H`, `E = 1`; `D = 0` | share `1/p ≤ 1/p^H + 1/(p−1) + H/p^H`; bad count `p^{H−1} ≤ 1 + p^H/(p−1) + H` | holds | none |
| 4.14c against `CanonicalTranslateJetIdentity`; Checks | `r = 1`, letters `x, v` and `x, ξ` | `5 ≤ p`, `w² = p`, `N + r ≤ K`, costly condition; lifts `w·x_0^{p^d}v_c − w^{p^d}x_c^{p^d}v_0` and `w·x_0^{p^d}ξ_0 + w^{p^d}Σ_{b≥1}…` | matches | none |
| 4.14c′ against `flipOneThree.adm8`; Checks | one vector letter, `M₁ ≥ δ` and `M₁ < δ` | formal: equality with the span, thresholds at any positions; `Sym^δ` irreducible, so all of degree `δ` or `0` | matches | none |
| 4.14f′ Checks | `k = 3`, `e₁ ⊗ e₂`; `p = 5`, `5⁵` letters | composites `0` and `½e₂ ⊗ e₁`; exponent `⌊log₅(5⁵ + 1)⌋ = 5`, denominator `5⁵` | holds | none |
| 4.15a Check | `R = ℤ_p`, `B = p^{−1}ℤ_p`, `U = p`, `D = 1` | left `length(ℤ_p/p²) = 2`; right `2 + 1 = 3` | holds | none |
| 4.15b | `m = 1`, `β = 0`, one place | `E = a + b + c₀`, as the route's `a + b + (m−1)c + mc₀` | holds | none |
| 4.15c, length | layer-cake sum | `Σ(d_i − τ)₊ ≤ S·Σ_β g_β`, `g_β ≤ rank(mΣsh)^{β+1}/(β+1)!` | holds | none |
| 4.15d, Route (B) | `δ = 0.99`, `ω₀ = 0.01`, `r = 2`; `u = 2, 3, ∞` | true marking probability up to `0.77`; lower bound `≤ 4^{−3r}` since `uδ(1−δ)^{u−1} ≤ 0.5, 0.444, 1/e` | statement holds | C02 |
| 4.15d, Route (A) | window without the given top; `C(L₂, r−1)δ^{r−1} < 1` | event contained in "`≥ r − 1` other tops"; then `L₂δ < r − 1`, `C(L₂, r)δ^r ≤ C(L₂, r−1)δ^{r−1}` | holds | none |
| 4.15e against `tableLineDegreeFive.aux₃`, `tBound`, `OrbitHyp` | all hypotheses | `13 ≤ p`, `2 ≤ r`, `N₁² ≤ r|𝔗|`, `256k²|𝔗|Y² ≤ p^{L₁−1}`, `8(D+1) ≤ c*`, `p^{5G′}`; threshold and `M₀ = ⌈10^{6r+1}(h+3)log x⌉` identical; share without minimum | matches | none |
| 4.15e′ against `SelectionLemmas.Conclusion2`, `Frames.Valid`, `XX'`, `Gen`, `lam1S`, `valS` | every clause; constants | nine validity clauses, `128k²N_sY² ≤ p^{L₁−1}`, `32pYk²N_sQ²(E₀+m*+1) ≤ a`, `o(x)` with `10`/`1`, both rank bounds, (b); `C₀ = 1088`, `C_rk = 1`, `C_deg = 10` | matches | C01, C03 |
| 4.15f against `flipOneThree.Conclusion2`, `tI` | threshold, mean | `Σ min(a⁻, a_{y⁻}/p^d) + C·N·N₁(a/p² + b′/p + Λa/(pk) + Λb′/k) + …`; mean `≤ C|𝔗|N₁/Y`; type `1` | matches | none |
| 4.16b | count | `m(2Σ𝔴 + fN_m) + ((t+1)/2)|Φ_top|m(m+1)/2 = m·𝔢_u` | holds | none |
| 4.16c (a) | trivial weight, `a⁻ = 0`; general | length `0`; mean of `μ_k` is `|ν|/k`, `|ν| = |Λ_0| + k·a⁻` | holds | none |
| 4.17a against `tsum_pos_add_min`, `kink`, `GainBoundAtPairUniform` | (i), (ii) | `Σ(·)₊ + Σ min = p/(p²−1)·y`; matching lemma for `n′` even; `0 ≤ gain ≤ 4|tops|a/p` and the same inequality with `m·fl` | matches | none |
| 4.17a, `e_p` | `4a ≤ p·2a` | `⌊log_p 4a⌋ ≤ ⌊log_p 2a⌋ + 1 = lg_p(2a)`; `e_p ≤ f(k(k−1)/2)lg_p(2a)` | holds | none |
| 4.17b | `a = 1`; units of 4.17c (iii) | `1.4427·log 2a + 1 ≤ 3·log 2a` for `log 2a ≥ 0.642`; `1/20 + 1/40 + 3/2 + 1/40 + 1/40 + 3 + 1/40 + 1/30 + 1/40 = 4.708 ≤ 5` | holds | none |
| 4.17d against `J.TopsOK`, `J.tops_exist_of`; terms (A)–(C) | `ω = 1`; limits | formal `16 ≤ δn`, `δn/2 ≤ |T| ≤ 2δn`, `4C_bx^{−2}δn·Σ`; `1/(2e²) = 0.0677`; `e^{−1}·10·(6.7ω₀)^{3r}max(1, (5ω₀)^{−3r}) ≥ 1`; `2^{−(N₁−1)} ≤ x^{−(h_II+3)}` | matches | none |
| 4.17c | `p = 13` | `γ_LT ≤ (169/168)/p`; `Σ_jV_{j,τ} ≤ mγ_LT·a(1 + θ_a) ≤ 3ma/p` | holds | none |
| Pull request text against the head | each sentence | adds the folder (2123 lines, nothing removed); `Suggested.lean` declares nothing; validation sentence equals the checks' output | one omission | C04 |

- Source locators checked against the text: all 60 cited paths exist in the tree of the first commit `40e56bab` of the source repository (read in a clone whose `src/` differs from that commit only by one added file); all 147 cited declaration names exist, 126 in a file cited beside them and 21 ("proved as" names and three definitions) in another file of the tree; about 60 declarations were opened and compared (rows above), among them every target of the sample and every locator added since the previous head.
- Library declarations opened at the pins: `Module.Basis.SmithNormalForm` (`Mathlib/LinearAlgebra/FreeModule/PID.lean:383`), `Module.length` (`Mathlib/RingTheory/Length.lean`), `Chebyshev.theta_le_log4_mul_x` (`Mathlib/NumberTheory/Chebyshev.lean:191`), `PMF.bernoulli` (`Mathlib/Probability/ProbabilityMassFunction/Constructions.lean:299`), `Matrix.unitaryGroup` (`Mathlib/LinearAlgebra/UnitaryGroup.lean:105`), `FormalGroup` (`Mathlib/RingTheory/FormalGroup/Basic.lean:57`), `TauCeti.weylModuleOfShape` (`TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Basic.lean:431`), `TauCeti.UniversalEnvelopingAlgebra.kostantForm`. Neither library has integral Weyl lattices, algebraic modular forms or Lubin–Tate groups (searched by object).
- Cross-roadmap citations resolved: every cited section of the 16 suppliers on main has its heading there (27 ids); the 55 ids cited in the seven family suppliers exist at the head `e79a6cb` of #2954 (two of them also at their own open heads, #2918 and #2888, with the same text). Clauses read against their use here: IntegralWeylModulesOfGeneralLinearGroups §0.3 (b), (b′), (c); FrobeniusRestrictedRieszSums §0.7 (i), (ii), (iii′); TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8 (J1)–(J3), §4.6 (b), (f); HodgeTateLatticesAndLubinTateLogarithms §3.6 (o), (a), (c); ThetaChainsOnDefiniteUnitaryGroups §3.1d (d)–(f), §3.2 (A1)–(A3). The ids of this roadmap that ThetaChainsAndFrobeniusPrimeSums (19) and GluedTargetAndDivisionInequality (8) cite all exist.
- Dependency check: `depcheck: 133 roadmaps, 1486 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks, run again on this head: all pass except two that are not defects of the folder: the three files of the family index count as outside the folder (they are the pull request's own), and the roadmap is not yet placed in the merge order.
- Lean: `Suggested.lean` elaborates with no message. It declares nothing, so there is no signature to compare and nothing for the one-tactic probe. The four headlines of the Summary are each named in the docstring with the carriers they lack, and none is statable at the pins.
- Duplication: the change adds one target (4.15e′) and no object another roadmap owns; no statement of the README is a declaration of the pinned libraries (the exchange lemma 4.15a and the walk lemma 4.15b were searched in Tau Ceti by object and not found).
- Nothing is changed outside the folder except the three files of the family index.

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups, GluedTargetAndDivisionInequality, CongruenceModulesOfThetaLifts, RowTowerAndRallisIdentities and TaylorBoundsAndDepthsOnHeightTwoFormalGroups (the list for main is empty); nothing shared. None has a target 4.9–4.17d, a depth property, a walk lemma or a plane count; the first and the third cite this roadmap by section.

Source independence: about 60 passages compared with 1 source ([FormalProof], Lean statements without prose), none shared beyond declaration names; largest share [FormalProof], 60 file paths and 147 declaration names against one other locator (Jantzen II.5–II.6); contents compared with [FormalProof]: independent (the source is a tree of Lean files with no chapters; the order 4.9 → 4.17 is forced by the *Needs* lines, 4.10 needing 4.9a–4.9f, 4.14 needing 4.12–4.13, 4.15c needing 4.15 and 4.15b, 4.16 needing 4.15c, 4.17 needing 4.15d–4.15f and 4.16).

Research link: Layer 4 is the gain at inert primes of the chains of theta lifts in Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (announced 2026); the README places it beside Gross (1999) on algebraic modular forms, Hida's normalisation and Bannai–Kobayashi (2010). Basis: the README's References and the family index.

## Not verifiable

- 4.15e′: that 4.15e applies the plane count with `Q = p^{G′}` was not traced in the formal proof.
- 4.15f: the hypothesis of `flipOneThree.Pf.theorem_I_closed_form_holds` was read as a statement (`AdmBE D → projection_lemma_base_level D`); its clauses were not compared with 4.14a–4.14h one by one.
- 4.10: `GlobalTheory.T.hServ_of_linkR` concludes a row condition whose content is `SelectionServed` for one family; the hypotheses of that theorem were not followed further.
- 4.9d: the clauses `BHyp` of the formal shape were not compared one by one with (B1)–(B4) of the supplier.
- The "proved as" declarations were located, and their statements were not opened, except `secondPartClosed`, `theorem_I_closed_form_holds`, `first_theorem_with_constants` and `tops_exist_of`.

Automatic checks set aside as false positives: the listing of elaborated signatures, of library near-matches and of declarations added reads the word after "class" in the module docstring of `Suggested.lean` ("class sets") as a declaration named `sets`, and so reports a failed elaboration; the file declares nothing and elaborates cleanly. The search for citations found nowhere lists five family suppliers that have no pull request of their own; they are at the head of #2954. The search for Lean names found nowhere lists the declarations of the formal proof, which are source locators and not library names.

## Source issues

- none

## For the human reviewers

- Scope: every *NEW* target rests on [FormalProof], a Lean development announced on 20 November 2026 with no refereed paper; the published works in References carry no locators except Jantzen II.5–II.6.
- Licence: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 13–19) says the proof belongs to its author and was published without a licence; the README cites 60 of its file paths and 147 declaration names, and no text of it.
- Merging: this folder is carried byte for byte by #2954 (head `e79a6cb`), which says it merges the family in one piece; five family suppliers exist only there. Which pull request carries the repair of R01 is for the operators.
