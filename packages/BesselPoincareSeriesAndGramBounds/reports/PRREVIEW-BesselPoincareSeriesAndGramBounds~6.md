# Review of BesselPoincareSeriesAndGramBounds (pull request #2916 at d9dfbbf)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BesselPoincareSeriesAndGramBounds/`
**Verdict:** accepted

**Summary.** Accepted: I found no false or unsupported statement. The statements of the fifteen sampled targets and of the three headlines agree with the formal proof at the declarations the README names (read in the copy of its Lean source that the operator holds), with the five cited papers at their locators, and with the suppliers at their heads; the computed checks are in the table kept on the board. There are three small corrections and two format notes, none blocking. The human reviewers decide on scope and licence, because most targets rest on a formal proof announced one day before this head and on no refereed text.

## C01 — "Size" names two different things in 5.17b and 5.17c, and the statements are true for only one of them

A reader who takes the definition literally gets a statement the source does not prove. In 5.17b (line 737) `𝔰(h) = |det 𝐏(h)|^{−1}` is defined as "the *size* of `h`". The same paragraph then says "used for `w, w′` of equal size" (line 742), "For heads `h, h′` of equal size" in (b-ii) (line 743) and in (b-iv) (line 745), and 5.17c (b-v) takes "every finite set `𝔉` of points of one size" (line 799).

At the declarations cited for these clauses ([FormalProof], `Formalism/HermitianCurvature/BlockKernelPropertiesOfSteps.lean`: `BlockKernelSupport`, `BaseKernelOne`, `ThetaExists`) the hypothesis is that the two points have the same sum of block sizes, that is the same level in the sense of 5.19, not the same `|det 𝐏|`. With `𝔰` the phrase is empty in (b-iv), where `𝐏(h), 𝐏(h′) ∈ GL(𝔒)` already gives `𝔰(h) = 𝔰(h′) = 1`, and (b-v) separately says that `Θ` vanishes "between points with different `|det 𝐏|`", so "one size" there cannot mean `𝔰` either.

The smallest change: write "of the same level" (the sum of the block sizes, as in 5.19) in these four places and keep "size" for `𝔰`.

## C02 — The headlines 5.16 and 5.20, and six further targets, name no declaration of the formal proof although the Conventions promise the form it establishes

A reader cannot check the constants `c = 1/16` and `C = 8·10¹⁴(C_ϕ + 4)` of 5.16, or the hypothesis list of 5.20, against the source, because the only reference is the sentence in the References that [FormalProof] "is the reference of every *NEW* target". The targets without a named declaration are 5.15, 5.16, 5.18a, 5.18b, 5.18d, 5.18e, 5.20b and 5.20 (and 5.20c (a)); every other target names its file and declaration, and all 87 of those pairs resolve.

Both headlines are in the source in the form the README states. For 5.16: `Development/AbelianVarietyTheory/Proofs/FlagMeasures/UnitaryAutomorphicCountingUnbundled.lean` (`GlobalTheory.CountBridge.count_unbundled`), with the hypotheses bundled in `Development/AbelianVarietyTheory/Definitions/SemilocalFrames/LayerProd.lean` (`GlobalTheory.Count.CountHyp`): `q² ≤ n`, `log rd ≤ e^n`, `log f ≤ √n`, `b ≥ 2`, `log b ≤ exp(n f log n/16)`, parameters `≤ b²`, level `≤ b^{C_g}`, a prime `g₀ > 4n` split completely, the gap `8·10¹⁴(C_g + 4)n^{19}f⁵ log(b·rd)`, and the error `exp(−n f log n/16)`. For 5.20: the size hypotheses are `Formalism.FourierDecayAlt.PB.SizeNumbers` and `Formalism.L2.SG.PoincareAmplitudeLowerBounds.SizesAt`, and the assembly with `η_off ≤ b^{−6}` is `Formalism.FourierDecayAlt.PB.PairBound`; the README cites the last two under 5.17d for the density bound only.

The smallest change: add these locators at 5.16 and 5.20, and either name a declaration at the other six targets or say at each that its statement is this roadmap's own form.

## C03 — The validation paragraph of the pull-request description describes an earlier state

The paragraph beginning "Validation at this head" says that every check passes except one, the check that a pull request changes nothing outside its roadmap folder, and that this one lists the three files of the family index. A reader concludes that one check still fails. At this head none does: the three files of the family index belong to this pull request, as files of the family the roadmap is nested in, so the changes outside the folder are all its own; the dependency check reports no upward or cyclic edge, and `Suggested.lean` elaborates with no output.

A wording that would be right: "Validation at this head: the automatic checks pass; the targeted build succeeds; the dependency check reports no upward or cyclic edge. Outside the folder the pull request changes only the three files of the family index."

## N01 — In (St) of 5.20a, "`m⁴ ≤ f ≤ k` (`SizeMf`)" attributes both inequalities to `SizeMf`

`SizeMf` of ThetaChainsOnDefiniteUnitaryGroups §2.1 is `m⁴ ≤ f` only; `f ≤ k` follows from `SizeW`. Would read correctly as "`m⁴ ≤ f` (`SizeMf`), `f ≤ k`".

## N02 — The Check of 5.20a does not say how the nodes are spaced, and its values depend on it

With the stated data and nodes `10¹⁵ + j·10³` I get `−18.0` to `−18.2` and `+1.5` to `+1.8`, as the Check says; with nodes `10¹⁵ + j·10¹⁴` the same evaluation gives `−17.2` to `−17.5` and `+2.2` to `+2.6`. Naming the spacing would make the Check reproducible; its conclusion (a loss of order `kΔ_w` without the cloud gap) holds for every spacing.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 5.13a (G), weight | `GapOK`, `bcWeight` in [FormalProof] | `dN = r(r−1)+2r(k+1)+r² = r_S(2r_S+2k+1)`; exponent `2(M_{a−1}−2)`; Jacobian `δ_P = \|c\|^{2(r−1)}` for `r_S = 1` | agree | none |
| 5.13a `Gr ≥ 0` | `r_S = 0` | `(−1)^1·det Gram(z, γz′) = \|⟨γz′,z⟩\|² − TT′ ≥ 0`; source `GGram`, `GNonneg` | holds | none |
| 5.13b (b), (b′) | `AB`, `LemmaBNorm`, `XiExists` | `A ≥ 2(k+r_S)(r_S+1)+1 = 2p(r_S+1)+1`; class `C⁵`, bounds of order 4; `XiInt` at `δ = 2` | agree | none |
| 5.13b (T1) | `p = 1`; `ν = (−1, 2)` | inner integral `(2π/ν_0)L^{−2+ν_0}Δ_1^{−ν_0}`; outer `2π/(ν_0+2ν_1)`; example: `σ_0 = −1`, product `−4π²/3 < 0` | holds | none |
| 5.13d (e) threshold | `hNeed` behind `NVStatement` | `2+max(3n/2, 1+npq) = 3+npq` for `n ≥ 2`; `min(p,q) = q_S` as `k ≥ 1`; other two terms identical | agree | none |
| 5.13d (g) | Check of 5.13: `k = 2`, `u = (13/2, 9/2)`, `hc = (5; 0, −3)` | interlacing `6.5 > 5 > 4.5 > 0`; `hc_1 − ½ − u_2 = 0`, so `ϰ_1 = 0` | holds | none |
| 5.13 (f), chain instance | `GapHyp`, `N1`; supplier §2.4a (c), (d) | `r ≥ 1801`, node gaps `≥ 16r^{19}`; `N₁ = 4n²√(2q)`; `A = h/(8√(2q))`, `C = n^{A/2}e^{A/√(2q)}` | agree | none |
| 5.13 Check 2 | He2017 Definition 1 | exchanged signs give `(⊖−), (−⊖), (−+)`: admissible; alternation started by `−` gives `(⊖+)`: not in the list of eight | holds | none |
| 5.15 Checks | `r_S = 0` | `Gr = \|⟨γz_{u′}, z_u⟩\|² − T(u)T(u′)`, zero iff proportional; identity cell `1` against `(dim V)^{−1}` | holds | C02 |
| 5.15a (headline) | `S = S′ = 1`; dimension count | `∫\|⟨b,σ(γ)b′⟩\|² = 1/d`; `2 dim S_u + 2(r_S+1) − (k−1)² = (k+2r_S+1)²` | holds | none |
| 5.16 (headline) | `CountHyp`, `count_unbundled` | `c = 1/16`, `C = 8·10¹⁴(C_g+4)`, `τ* = (nf·rd·g·b)^{−11q}`; Minkowski `rd ≥ 2.56` in degree 4 | agree | C02 |
| 5.17a | `q = 3, 4`; `q = 2, k = 3`; `GL₂` | `∏(1−q^{−i})^{−1} = 1.785, 1.452` against `2, 1.75`; `8/3 > 5/2`; cuspidal: `q/(q−1)`; `GGBound` | holds | none |
| 5.17b | `LocalDatum`; `k × k` instance | orthogonal of `{x₁ ≡ x₂ (ϖ^c)}`: `a₂ ∈ 𝔬`, `a₁ − a₂ ∈ ϖ^c𝔬`, so `= 𝔒`; `Th1Eq`: sum `= 𝔰(h)𝔰(h′)K^{loc}` | holds | C01 |
| 5.17c | `GermKernel`, `A13`, `ThetaProps`; classification | hypotheses "integers invertible", `ℓ ≥ 1`, compact `Q` of units; discrete factor would force `e_i𝔒 = 0`; `ℝ, ℂ` connected | agree | C01 |
| 5.17d | `PairBound` | `e₁ ≤ exp(12f·2^{−(k−2r_S−2)})`; `Σ_p p^{−6} ≤ 0.018 ≤ 3·2^{−6}` | agree | none |
| 5.17 Checks | `g = 3`, `T = 1` | `⟨z′,z′⟩ = −T`; `det = T² − (T+g²)² = −99`; divided basis `−2T − g² = −11` | holds | none |
| 5.18a cut | sign of `qdet` | on `{u+2 ≤ −Y ≤ u′−2}`: factors `≤ −3/2` and `≥ 5/2`, others of equal sign: `qdet > 0`; `u = u′`: `qdet ≤ 0` | holds | none |
| 5.18c scales | `lamThreshold`, `lamPrimeSq`, `Glob.N`, `lenI` | exponent `2(b−1)+s−1`; `κ^{−(m−1)}`, `m−1 = 2r_S+1`; `N = 4·5(r_S+1)`; `\|cut\| = Δ_w/2 − 5/2` | agree | none |
| 5.18e | constants; grep of the source | `176e⁷ + 2e^{14}` occurs in the source; Markov `2d²/L`; `deg C_0 = k+2r_S+1` | consistent | C02 |
| 5.18 (i) | `ThmBpDS`, `StdHyp`, `FrameChange` | `n₀ = 30(r_S+1)²+6` or `0`; `3(r_S+1) ≤ 2p₀`; `200‖λ′−λ‖₁`; frame change `T·κ^{2r_S}` | agree | none |
| 5.19 | `L = 0` | conclusion `(1 + C(C/Θ)^f)(1+e_1)𝔧`; pinned `Matrix.PosSemidef.hadamard`, `TauCeti.lintegral_rpow_lintegral_mul_le` exist | holds | none |
| 5.20a (St) | `StandingHypotheses`, `StandingNumericalData`; supplier §2.3b | all clauses match; cloud gap `4kΔ_w ≤ u_1 − v_0`, `≤ 8kΔ_w` off tops; supplier has `C_c = 2` | agree | N01 |
| 5.20a (a) | `TcritPow`, `MassRatios`, `EaSize` | index exponent `r² − d_N − k² = km + m(m−1)/2`; `rd^{−f/2} = \|d_F\|^{−1/2}`; `\|θ\| ≤ 8f/2^k` | agree | none |
| 5.20a (b) | `TcritLower`, `cOne`, `aeff`; `k = 200`, `m = 4` | `0.38·(9/10)/(1+¼) = 0.274 ≥ 1/5`; `log(T_crit/bound) = +1.5…+2.6` with cloud gap, `−17…−18` without | holds | N02 |
| 5.20 (headline) | `SizeNumbers`, `SizesAt`, `SqrtSumSqLeOneAddInvPowSix` | `2r_S+7+f ≤ k`; `c = 1/3`; `c_Θ·C_l ≥ 16`; half-cut `[5/2 − v, Δ_w/2 − v]`; `η_off ≤ b^{−6}` | agree | C02 |
| 5.20c, 5.21 | `epsNG`, `RowNGP`, `DiagLP`, `KppDiag` | `ε_N = 2^{−(k−2r_S−5)}e^{C₄m⁵fL}`; `C_Γ ≥ max(C_B, C₄)+1`; `e^{−kf log k}` | agree | none |
| 5.22 | `admLq`; `k = 1`, `r = 2` | lower bound `(1 − 1/g)wt_GG`; squarefree weight `1/∏(g^{deg P}−1)`; ratios `1 − 1/g`, `1 + 1/g` | agree | none |
| 5.23 | `Wg`, `RangeW`; `q = 19`, `d = 526679`, `g = 1136944064017` | all prime; `d ≡ 7 (16)`; `16qd \| g−1`; `g−1 = 2⁴·3³·19·263·526679`; sum `4.6e−7 ≤ 1/76`; norm form `= g` | holds | none |

- Source locators checked against the text: 7 in the five papers (SunZhu2012 line 66; JiangSunZhu2010 line 24; He2017 lines 58, 97; BeuzartPlessis2020 line 11200; Xue2023 lines 213, 254), each on the page the README gives; and all 87 file-and-declaration pairs of [FormalProof], each declared in the cited file, more than forty of them read against the README statement.
- Library declarations opened at the pins: Mathlib `IsFoelner` (`MeasureTheory/Group/FoelnerFilter.lean:91`), `ContRepresentation` (`RepresentationTheory/Continuous/Basic.lean:55`), `Matrix.PosSemidef.hadamard` (`Analysis/Matrix/Order.lean:214`), `lintegral_comp_eq_lintegral_meas_lt_mul` (`MeasureTheory/Integral/Layercake.lean:476`); Tau Ceti `lintegral_rpow_lintegral_mul_le` (`MeasureTheory/Integral/SchurTest.lean:132`), `ContRepresentation.IsUnitary`; neither library has a formal degree or a square-integrable representation.
- Cross-roadmap citations resolved: every section id cited from the ten open suppliers at their heads (65 ids) and from the thirteen roadmaps on main (24 ids); supplier content compared at ThetaChainsOnDefiniteUnitaryGroups §§2.1, 2.3a, 2.3b, 2.3c, DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a, HermitianFormsAndLattices §6.2 (c), AnalyticNumberTheoryPartI §2.15, AnalyticNumberTheoryPartII §5.3k, GeometryOfNumbersAndQuadraticArithmetic §4.4.14.
- Dependency check, run again at this head: `depcheck: 171 roadmaps, 2000 edges, 0 problem(s)`; outside the folder the pull request changes only the three files of the family index.
- Automatic checks: all passed, none set aside. Elaboration of `Suggested.lean`: exit 0, no output; the file declares nothing, so there was no signature to compare and no one-tactic probe to run.
- Headlines: (1) 5.15a, (2) 5.16, (3) 5.20 with 5.21; none is statable at the pins (no formal degree, no quotient measure on `S\G` for a closed non-normal subgroup, no adelic unitary group), and the module docstring names each with what it lacks.

Overlap check: read RowTowerAndRallisIdentities, ThetaChainsOnDefiniteUnitaryGroups, ThetaChainsAndFrobeniusPrimeSums, SeesawForThetaChains, AutomorphicSpectralTheory, AutomorphicLFunctionsAndLocalFactorsPartII, AnalyticNumberTheoryPartII; the Bessel–Poincaré series: owned here, cited by SeesawForThetaChains; `vol([U(Y_0)]) = mass(𝒪_E^r)`: owned by HermitianFormsAndLattices §6.2 (c), cited here; multiplicity one and existence of Bessel models: GanGrossPrasadUnitaryGroups §§2.6, 3.9, cited here; nothing else shared. Another open pull request of the same author changes the family index and is reported to conflict with this one in the index README; the description says the versions of the index are reconciled before merge; its head was not readable here.

Source independence: 12 passages compared with 6 sources (the seven paper locators and five statements of [FormalProof], which is Lean code without prose), none shared; largest share [FormalProof], 87 of 94 distinct locators; contents compared with [FormalProof]: independent (it has no table of contents; the 28 targets cite 58 files in more than twenty directories, in no common order).

Research link: 5.16 is a uniform-error form of the limit multiplicity theorems of DeGeorge–Wallach (1978), Clozel (1986), Savin (1989); 5.13c–5.13d specialise the archimedean Gan–Gross–Prasad theory (Sun–Zhu 2012, Jiang–Sun–Zhu 2010, He 2017, Beuzart-Plessis 2020, Xue 2023); 5.20–5.21 serve Alpöge's formal proof (2026). Rests on the README's References and the six texts read.

## Not verifiable

- The proofs of [FormalProof] were not replayed: its files are not built on this host, so I compared statements, not proofs; a "follows from" was rederived only at 5.13d (e) and 5.20a (b).
- The public repository of [FormalProof] could not be read through the sources service (its host is in no licence class); I read the copy of its Lean source that the operator holds.
- The deep estimates were not rederived beyond the identities in the table: 5.18b–5.18e, the counts of 5.20b and 5.20c, the crude bound of 5.21 (i).
- The head of the other open pull request that changes the family index was not available, so the reported conflict in the index README was not reproduced.
- The targets 5.15, 5.18a, 5.18b, 5.18d, 5.18e and 5.20b name no declaration, so their statements were checked by computation only (C02).

## Source issues

- none

## For the human reviewers

- **Scope.** Most of the 28 targets are marked *NEW* and rest on [FormalProof], a Lean development announced on 20 November 2026 (README, References); no refereed text states them. The inputs marked *KNOWN* cite refereed papers.
- **Licence.** The copy of [FormalProof] read here is the source directory alone, with no licence file; the sources service places the repository's host in no licence class.
- **Not tested.** [FormalProof] has no prose and no table of contents; wording and arrangement were compared with its statements and its directory layout only.
- **Order of merge.** Another open pull request of the same author changes the family index and is reported to conflict with this one in the index README; the description says the versions are reconciled before merge, not which merges first.
