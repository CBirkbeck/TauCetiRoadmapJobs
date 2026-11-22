# Review of BesselPoincareSeriesAndGramBounds (pull request #2916 at a140c30)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BesselPoincareSeriesAndGramBounds/`
**Verdict:** accepted

**Summary.** Accepted: the full re-read found no false statement and no unowned prerequisite. Every formula and Check I recomputed holds, the nine sub-roadmaps the README names as suppliers are all readable at open heads with the cited sections present, and the repaired citation of 5.20c (a) agrees with the formal proof (the rotated point, the direction of the inequality, the constants). There is one small correction (a claim about the pinned Tau Ceti in the docstring of `Suggested.lean` that the pin contradicts) and one format note, neither blocking. Scope and licence are left to the human reviewers.

## C01 — The docstring of `Suggested.lean` says Tau Ceti cannot integrate a representation of a non-commutative group; at the pin it can

In the bullet on relative Schur orthogonality (`Suggested.lean`, lines 33–35) the list of what is lacking includes "the integrated action `R(f)` of `L¹(G)` for a non-commutative `G` (Tau Ceti integrates strongly continuous representations of additive monoids only)". A reader takes from this that an integrated form must be built before 5.15a can be stated, and that is not so. `ContRepresentation.integratedOperatorL1` (`TauCeti/RepresentationTheory/Continuous/Integrated/Basic.lean`, variables at line 109) asks for `[AddMonoid G]`, not a commutative one, so it applies to any group written additively; `TauCeti.CStarAction.CovariantRepresentation.integratedOperator` (`TauCeti/Analysis/CStarAlgebra/Action/Covariant/Integrated.lean:88`) is stated for a multiplicative `[Group G]` with a measure finite on compacts; and `ContRepresentation.integratedOperator` (`TauCeti/RepresentationTheory/Compact/Integrated.lean:136`) covers compact groups. Besides, the `R(f)` of 5.13 (f) and 5.15a is the pointwise integral `∫ f(h)W(xh) dh` of a function, which needs only Mathlib's Bochner integral.

The conclusion of the docstring is not affected: neither library has a square-integrable representation or a formal degree, nor a quotient measure on `S\G` for a closed subgroup that is neither discrete nor normal (I searched both at the pins), and these two are enough for 5.15a not to be statable. The smallest change is to drop the clause, so that the sentence reads "It lacks square integrability and the formal degree of a unitary representation, and the quotient measures on `S\G` and `S′\G`."

## N01 — In the definition of a local datum (5.17b, line 736), "a unit `ϖ ∈ 𝔒`" reads as a unit of `𝔒`

For a unit of `𝔒` the union `⋃_m ϖ^{−m}𝔒` is `𝔒`. What is meant, and what the cited `Formalism.FourierDecayAlt.A5.LocalDatum` has, is an element of `𝔒` that is invertible in `𝔎`. Would read unambiguously as "an element `ϖ ∈ 𝔒`, invertible in `𝔎`, such that …".

## Previous findings

No report of the previous review is on the board; the last one that is (at `ed4e8d8`) is accounted for here.

- Its R01 (seven supplier roadmaps readable nowhere) — no longer holds: FrobeniusRestrictedRieszSums (#2920), HermitianFormsAndLattices (#2882) and DiscreteSeriesCoefficientsAndAutomorphicMetrics (#2909) have open pull requests of their own; PositivityOfDirichletSeriesWithKernels, TensorInductionAndFiniteGroupInputs, SlopesOfHermitianVectorBundles and FiniteReductiveGroups are carried by the open pull request of the whole family (#2954). I read each and found every cited section.
- Its C01 (description) — repaired: the Dependencies paragraph now names the nine sub-roadmaps and where each is.
- Its C02 (5.20d, "`ω` cancelling") — repaired: the Route now says that `ω` "is bounded together with `w_row` and is not divided out".
- Its N01 (`SizeMf`) — repaired: (St) reads "`m⁴ ≤ f` (`SizeMf`), `f ≤ k`", and `SizeMf` of ThetaChainsOnDefiniteUnitaryGroups §2.1 is `m⁴ ≤ f`.
- Its N02 (node spacing in the Check of 5.20a) — repaired: the nodes are now `e′_j = 10¹⁵ + j·10³`.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 5.13a (setting, big cell) | `d_N` two ways; sign of `Gr` for `r_S = 0..3` on random integer pairing matrices | `(r² − 2r_S − (k+1)²)/2 = r_S(2r_S+2k+1)`; Gram determinant / `Gr`: `6/−6`, `160/160`, `−7504/7504`, `97234/97234` | agree with `(−1)^{r_S+1}` | none |
| 5.13c (sample) | JiangSunZhu2010 Theorem A at `r = r_S`; `r_S = 0` | `G_0 = U(p − r_S, q_S − r_S − 1) = U(k, 0)`; conditions `n ≥ 2r+1`, `p ≥ r`, `q ≥ r+1` hold; `r_S = 0` is SunZhu2012 Theorem B | agree | none |
| 5.13d (sample) | threshold against the source's `hNeed`; (G) for `h/4`; `k = 2`, `u = (13/2, 9/2)`, `hc = (5; 0, −3)`; He's sign pairs | `2 + 3n/2 ≤ 3 + npq` (equal `5 = 5` at `k = 1`, `r_S = 0`); `288√(2q_S)q_Sr² ≥ 64√(2q_S)(q_S−1)r² + 8√(2q_S)`; `hc_1 − ½ − u_2 = 0`; pairs `(⊖−), (−⊖), (−+)` admissible, `(⊖+)` not | agree | none |
| 5.13d (g) against 5.18 (i₁) | ratio of formal degrees for `λ − e_s` | `d/d_s = ∏_{t≠s}\|λ_s − λ_t\|/\|λ_s − 1 − λ_t\|`, so `\|κ_s\|²d/d_s = T∏\|λ_s − ½ − u_j\|/∏\|λ_s − 1 − λ_t\|` as in 5.18 | agree | none |
| 5.13 (f) | `R(e_D)` against `W ∗ e_D` | Schur: `d∫conj⟨w, D(h)w⟩D(h)w dh = w`; with `ě_D`, `h ↦ hz` gives the factor `ω(z)²` | agree | none |
| 5.15 (sample) | Checks; dimension count of the disintegration | `Gr = \|⟨γz′, z⟩\|² − TT′` for `r_S = 0`; `2 dim S_u + 2(r_S+1) − (k−1)² = (2r_S+k+1)²` | agree | none |
| 5.15a (sample, headline) | `S = S′ = 1`; compact `𝐆`, `S = S′ = 𝐆`, `κ = κ′ = σ`; `S = 𝐆`, `S′ = 1`; `U(1)` control | `∫ = 1/d`; `O = Id/d`, `‖O‖²_HS = 1/d`; `O = b′/√d`, `‖O‖² = 1/d`; conjugate coefficient ↦ `∫e^{−2inh} = 0` | agree (equality each time) | none |
| 5.16 (headline) | `d_N` at `J = r_S`, `j_i = 1`; residue bound; transference at `N = 1, 2`; basis `(M,1), (1,0)` | `2Jn − 2J² − Σj_i² = r_S(2k+2r_S+1)`; `e·log rd_E·f/(2f−1) ≤ e·log rd_E`; `1/(2λ_1^∨)`, `N/κ ≤ N²/(2κ)`; det `−1`, length `√(M²+1)` | agree | none |
| 5.17a (sample) | `q = 3, 4, 5, 7`; `q = 2`, `k = 3`; `k = 1`; `GL₂` | `1.785 ≤ 2`, `1.452 ≤ 1.75`, `1.315 ≤ 1.6`, `1.195 ≤ 1.43`; `8/3 > 5/2`; `γ_GG = (q−1)𝟙_1`; `q/(q−1)` on cuspidals | agree | none |
| 5.17b (sample) | order `{x₁ ≡ x₂ (ϖ^c)}` with `ψ_k(ϖ^{−c}(x₁−x₂))`; fields of `LocalDatum` | orthogonal: `a₂ ∈ 𝔬`, `a₁ − a₂ ∈ ϖ^c𝔬`, the order itself; source: `ϖ ∈ 𝔎^×`, `ϖ ∈ 𝔒`, Artinian, reduced, `selfDual` | agree | N01 |
| 5.17c (sample) | exponents of (b1); Gauss factor; averaged identity | `−ℓ(ℓ+1)/2 + ℓ/2 = −ℓ²/2`; `ℓ(ℓ−1)/2 + ℓ/2 = ℓ²/2`; `γ(t/z) = γ(tz)`; Jacobian `\|ℓ+1\|\|z\|^ℓ\|t\|^{−ℓ}`; phase to first order `z(σ − σ′)` | agree | none |
| 5.17d, 5.17 | `m = 1` inert; `Σx_𝔭`; `W_rows`; Checks | `q^{r−1}(q^r − (−1)^r)`; `ζ(s) − 1 ≤ 3·2^{−s}`; `T^{kf}(1 − T^{−k})^f = (T^k − 1)^f`; `96`; `−99`, `−11`; `∏α(k−1)/α(r) = ∏L(i, η^i)` | agree | none |
| 5.18a (sample) | one site; `N_l^↓(ρ + e_l)`; sign of `qdet` on a cut; Jacobian | `T(Y+1)^T𝐉T(Y) = 𝐉` by `[p, c^{−1}] = −c^{−1}`; `= N_l(ρ)`; factors `≤ −3/2` and `≥ 5/2`, `qdet > 0`; `\|c\|^{2(M−1)}d²c/\|c\|²` | agree | none |
| 5.18b (sample) | cut at `y − 1`; `u = u′` | `Y − ½ + u′ ≥ 3/2`, `qdet(y − 1) > 0`; `qdet = −TT′∏(Y+½+u_i)² ≤ 0` | agree | none |
| 5.18c (sample) | scales against `lamThreshold`, `lamPrimeSq`, `Glob.N`, `Glob.lenI` | source: `C·κ^{−(m−1)}A(CκN/I)^{2(i−1)+s−1}`, `…κ^{2i−1}TT^{−1/2}(CN/I)^{2(i−1)}`, `4·5(r+1)`, `Δ/2 − 5/2`; README the same with `m − 1 = 2r_S+1` | agree | none |
| 5.18 (sample) | letter factor of `A`; (i₁) gaps | `(v+Y+1)/(Δ_w − v − Y)`: `≤ 2` at `Δ_w/2`, `≈ 2Δ_w/3` at `Δ_w − 3/2`; `h/2 ≥ 240r³ > t₁ + n² + 3 + l` | agree | none |
| 5.18d | exponents; convergence in `y` | `−d(d−1) + (d−1) = −(d−1)²`; `(d−1)(1 − 2 + d) = (d−1)²`; needs `A − E₀d² > d(d−1)` | agree | none |
| 5.19 | `L = 0`; Schur test statement at the pin | conclusion `(1 + C(C/Θ)^f)(1+e_1)𝔧`; `∫(∫kg)^p ≤ A^{p−1}B∫g^p` | agree | none |
| 5.20a (sample) | mass ratio against HermitianFormsAndLattices §6.4 (b); level index; `cOne`; rank 4 | `\|d_F\|^{(2M−1)/2} = rd_E^{fM}rd_E^{−f/2}`; `g^k∏_{i=k+1}^r(g^i−1) ≈ g^{km+m(m−1)/2}`; `0.38·0.9/1.25 = 0.27 ≥ 1/5`; Minkowski `rd ≥ 2.57` | agree | none |
| 5.20b (sample) | `2×2` lemma; hyperbolic bounds | `T²\|b\|² = T′²\|c\|²`; `gc ∈ 𝒪_E` from `g𝒪² ⊂` lattice, `a, d ∈ 𝒪_E` from `(1, −1)`; `2√2 ≤ 4`; `(1+√2)² = 5.83 ≤ 6` | agree | none |
| 5.20c (a) (changed passage) | `theoremBRotated`, `turnPt`, `orbSqO_le_turn` | source: `exp(Cb·m⁵·f·log b)`, gaps `Cg·m⁴`, weight to the power `Aw(r_S+1)²`; `ptMat(turnPt p)_{ab} = (−1)^r(−i)^{a+b}ptMat(p)_{ab}`; `orbSqO ≤ orbSq` at the turned point | agree | none |
| 5.20d, 5.21 (headline) | `Nm` unramified; exponent of `Sz_H`; (iii), (v) | `N(𝔡_F^{−2e_j}𝒪_E) = rd_E^{−4fe_j}`; `j + 1 − 4k ≤ −3r_S` iff `k ≥ r_S + ¼`; `2Γ₀d²/D* ≤ 2C₀d/Γ₀`; `dim ker ≤ ‖K − 1‖²` | agree | none |
| 5.20 (sample, headline) | `C_Δ = 5`, `c_T = ½`, `C_b = 3`; `b = 16`, `k = 70 log b` | `c_Θ = 1/16`; `12k·2^{−k/2−4}b^{14} = 6.4·10^{−11}`; `η_off = 1.6·10^{−8} ≤ b^{−6} = 6.0·10^{−8}`; `4r_S + 5 ≤ r` iff `k ≥ 2r_S + 4` | agree | none |
| 5.22 (sample) | `B` a group and `ψ_B` a character; multiplicities; `k = 1`, `r = 2` | cross term `Σ_{j∈W}u_{r_S,j}v_{j,c} = 0`; `1 + (q^{k−1} − 1) + (q^k − q^{k−1}) = q^k`; ratios `(g−1)/g`, `(g+1)/g`; `2r_S` chain entries | agree | none |
| 5.23 | `q = 19`, `d = 526679`, `g = 1136944064017`; total variation | `d`, `g` prime (Miller–Rabin); `g − 1 = 7101·16qd`; norm identity holds; `−d` a square mod `3, …, 19` and `≡ 1 (8)`; `(16+q+d)/(16qd) < 1/(4q)`; `Σ(wt_GG − wt_v)^+ ≤ 1/g` | agree | none |
| `Suggested.lean`, docstring | each library claim at the pins | `IsFoelner`, `ContRepresentation`, `ContRepresentation.IsUnitary` present; no formal degree, no quotient measure for a general closed subgroup; integrated forms present for `[AddMonoid G]` and `[Group G]` | one claim false | C01 |

- Source locators checked against the text: SunZhu2012 line 66 (Theorem B, p. 2); JiangSunZhu2010 lines 14–27 (Theorem A, p. 1); He2017 lines 58–64 (Definition 1, p. 2) and 97–100 (Theorem 0.1, p. 3); BeuzartPlessis2020 line 11200 (Theorem 12.4.1, p. 290); Xue2023 lines 213–216 (Theorem 2.2, p. 1000) and 254 (Corollary 2.5, p. 1001). All seven agree.
- [FormalProof]: 158 file-and-declaration pairs in 94 files, each found in the cited file; statements read against the README for `JointNormBoundRotatedUniform`, `turnPt`, `orbSqO_le_turn`, `NVStatement` with `hNeed`, `GapOK`, `LocalDatum`, `GGBound`, `TcritPow`, `TcritLower`, `cOne`, `aeff`, `lamThreshold`, `lamPrimeSq`, `Glob.N`, `Glob.lenI`.
- Library declarations opened at the pins: `IsFoelner` (`Mathlib/MeasureTheory/Group/FoelnerFilter.lean:91`), `ContRepresentation` (`Mathlib/RepresentationTheory/Continuous/Basic.lean:55`), `Matrix.PosSemidef.hadamard` (`Mathlib/Analysis/Matrix/Order.lean:214`), `MeasureTheory.lintegral_comp_eq_lintegral_meas_lt_mul` (`Mathlib/MeasureTheory/Integral/Layercake.lean:476`), `ContRepresentation.IsUnitary` (`TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean:49`), `TauCeti.lintegral_rpow_lintegral_mul_le` (`TauCeti/MeasureTheory/Integral/SchurTest.lean:132`), and the three integrated forms of C01.
- Cross-roadmap citations resolved: 62 section ids in the nine sub-roadmaps at their open heads (ThetaChainsOnDefiniteUnitaryGroups 12, RowTowerAndRallisIdentities 4, FrobeniusRestrictedRieszSums 6, HermitianFormsAndLattices 23, SlopesOfHermitianVectorBundles 2, DiscreteSeriesCoefficientsAndAutomorphicMetrics 4, TensorInductionAndFiniteGroupInputs 1, PositivityOfDirichletSeriesWithKernels 3, FiniteReductiveGroups 7) and those of the consumers named; contents compared for DiscreteSeriesCoefficientsAndAutomorphicMetrics §§2.4a, 2.4b, FiniteReductiveGroups §§2.5, 2.7 (b), 5.8, HermitianFormsAndLattices §6.4 (b), ThetaChainsOnDefiniteUnitaryGroups §§2.1, 2.3c, 2.7, 3.8, TensorInductionAndFiniteGroupInputs §9.1. On main: GanGrossPrasadUnitaryGroups 1.2, 1.3, 2.6, 3.3, 3.9, 4.1, RealSemisimpleLieGroups §§3.2 (it states the open big cell), 3.3, 4.2, 4.3, AdelicAlgebraicGroups §§2.3, 3.1, 3.4, 3.5, GeometryOfNumbersAndQuadraticArithmetic 4.4.14, AnalyticNumberTheoryPartI §2.15, AnalyticNumberTheoryPartII §5.3k, VonNeumannAlgebras Layer 9, LieGroups Layer 9, ClassicalGroups §§6.1, 6.3–6.6, CompactGroups Layers 2 and 4, LieHighestWeight Layer 7, AutomorphicFormsOnReductiveGroups §2.4, AutomorphicSpectralTheory §4.5, ShimuraVarieties §7.0h.
- Dependency check at this head: `depcheck: 133 roadmaps, 1485 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed in the worker's run. Elaboration of `Suggested.lean`: exit 0, no output. The file declares nothing, so there was no signature to compare and no one-tactic probe to run.
- Headlines: 5.15a, 5.16, 5.20 with 5.21. None is statable at the pins (no formal degree or square-integrable representation, no quotient measure on `S\G` for a closed subgroup that is neither discrete nor normal, no unitary group of a Hermitian space over a number field with its adelic points); each is named in the module docstring with what it lacks.
- Outside the folder the pull request changes only the three files of the family index. The roadmap is new: no layer or item is removed. The description agrees with the head (a new folder; nine suppliers in open pull requests, as verified; `Suggested.lean` declares nothing).

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, RowTowerAndRallisIdentities, ThetaChainsOnDefiniteUnitaryGroups, SeesawForThetaChains, GluedTargetAndDivisionInequality, AutomorphicSpectralTheory, GanGrossPrasadUnitaryGroups, AutomorphicLFunctionsAndLocalFactorsPartII; the Bessel–Poincaré series, the Gram operators and the bounds 5.20, 5.21: owned here, cited by SeesawForThetaChains and ThetaChainsAndFrobeniusPrimeSums (the latter cites sections 5.x of this roadmap 79 times); the targets 5.1–5.12: RowTowerAndRallisIdentities, which names this roadmap for the rest of Layer 5; multiplicity one and existence of Bessel models: GanGrossPrasadUnitaryGroups §§2.6, 3.9, cited here; limit multiplicity along a tower (Clozel's lower bound): ShimuraVarieties §7.0h, a different statement, compared in a Check of 5.16; nothing else shared. No open pull request changes this folder or drops an id it cites.

Source independence: 11 passages compared with 6 sources (the five papers at their locators and [FormalProof], which is Lean code without prose), none shared; largest share [FormalProof], 158 declaration citations in 94 files against 7 locators into the five papers; contents compared with [FormalProof]: it has no table of contents, and its directories (`Formalism/HermitianCurvature`, `Formalism/LocalToGlobal/SiegelLatticeTheory`, `Development/AbelianVarietyTheory`, `ReciprocityTheory/ReductiveGroups`) do not correspond to the targets 5.13a–5.23, whose order the *Needs:* lines force: independent.

Research link: 5.13c and 5.13d make explicit, for gapped discrete series, the archimedean Gan–Gross–Prasad theory of Sun–Zhu (2012), Jiang–Sun–Zhu (2010), He (2017), Beuzart-Plessis (2020) and Xue (2023); 5.16 is a uniform form of the limit multiplicity theorems of DeGeorge–Wallach (1978), Clozel (1986) and Savin (1989); 5.20, 5.21 serve Alpöge's formal proof (2026). Rests on the README's References and the six texts read.

## Not verifiable

- The proofs of [FormalProof] were not replayed: its files are not built on this host, so statements were compared, not proofs. Several cited declarations are statements (definitions of propositions) that the proof discharges elsewhere, for example `JointNormBoundRotatedUniform` (through `theoremB_uniform_rotated`) and `NVStatement` (through `nv_of`); I did not trace each to the main theorem.
- The public repository of [FormalProof] was not fetched; I read the copy of its Lean source that the operator holds.
- The steps the README marks "not given here" (in 5.13d, 5.20c, 5.20d, 5.21, 5.23) are stated without proof; where a declaration is cited I compared the statement and did not derive it.
- The lattice theorem and the mean count of 5.20b, the energy estimate of 5.18e and the normal form theorem of 5.18a (c) were read for consistency (exponents, hypotheses, degenerate cases) and not derived in full.

Automatic checks set aside as false positives: none; every automatic check passed at this head.

## Source issues

- none

## For the human reviewers

- **Scope.** Most targets are marked *NEW* and rest on [FormalProof], a Lean development announced on 20 November 2026 (README, References); no refereed text states them. The inputs marked *KNOWN* cite refereed papers (SunZhu2012, JiangSunZhu2010, He2017, BeuzartPlessis2020, Xue2023).
- **Licence.** The family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, line 16) says the formal proof was published without a licence; this README cites its file paths and declaration names and copies no text of it.
- **Not tested.** [FormalProof], the source with the largest share of the locators, has no prose and no table of contents; wording and arrangement were compared with its statements and its directory layout only.
- **Order of merge.** Nine supplier sub-roadmaps are still in open pull requests (#2918, #2919, #2920, #2882, #2909, and four carried only by #2954); the generated task list of the description names two of them.
