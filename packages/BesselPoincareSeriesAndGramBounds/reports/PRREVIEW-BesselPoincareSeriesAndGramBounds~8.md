# Review of BesselPoincareSeriesAndGramBounds (pull request #2916 at ed4e8d8)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BesselPoincareSeriesAndGramBounds/`
**Verdict:** needs changes

**Summary.** Needs changes, for one reason that is not in the mathematics: seven of the roadmaps the README names as suppliers (they are named 133 times, for, among other things, the mass formulas, the decay of discrete series coefficients and the Gelfand–Graev bound) exist today neither on main nor in any open pull request, so the targets that rest on them have no owner and their citations could not be read. The full re-read found no false statement: every formula and Check I recomputed holds, the new type bound 5.20d agrees with the formal proof constant by constant, and all 157 cited declarations of the formal proof resolve. There are two small corrections and two format notes, none blocking; scope and licence are left to the human reviewers as before.

## R01 (P1) — Seven supplier roadmaps that the README cites exist neither on main nor in any open pull request

An implementer of 5.13, 5.16, 5.17, 5.17a, 5.17c, 5.18d, 5.20a–5.21 or 5.22 is sent to sections that cannot be opened anywhere, and a human who approves this folder would merge a roadmap whose stated supplier contracts point at nothing. The roadmaps are FrobeniusRestrictedRieszSums (named 14 times), HermitianFormsAndLattices (42), DiscreteSeriesCoefficientsAndAutomorphicMetrics (19), PositivityOfDirichletSeriesWithKernels (16), TensorInductionAndFiniteGroupInputs (11), SlopesOfHermitianVectorBundles (9) and FiniteReductiveGroups (22). I looked for each by name on main (at `a0f3179`, no folder of that name at any depth) and among the 487 open roadmap pull requests as indexed on 2026-11-22 at 16:09 UTC (none adds such a folder; the family's open pull requests are #2888–#2890, #2892–#2894, #2896, #2899, #2901, #2907, #2913, #2915, #2916, #2918, #2919, #2921–#2924). The family index of this pull request still lists all seven as sub-roadmaps above this one, and the task list of the description names only #2918, #2919 and the merged GanGrossPrasadUnitaryGroups. The previous review counted ten open suppliers, so these seven were open then and are not now.

What rests on them is not peripheral: `vol([U(Y_0)]) = mass(𝒪_E^r)` and the mass ratios of 5.20a (HermitianFormsAndLattices §§6.2–6.4), the mean value formula of 5.17 (§§4.9, 6.1d, 6.4a), the counts of 5.20b–5.21 (§§4.10, 4.11, 6.4b, 6.4c, 6.5); the decay and weighted integrability of the lowest-`K`-type coefficient in 5.13 (f) and 5.16 (DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a) and the tensor products of 5.13d and 5.18 (§2.4b); the convolution bound of 5.17a and the weights of 5.22–5.23 (FiniteReductiveGroups §§2.5, 2.7, 5.8); Laplace's method and stationary phase in 5.13d, 5.17c, 5.18d (PositivityOfDirichletSeriesWithKernels §§7.1, 8.1, 8.2); the quantum minors of 5.13d and 5.18a (TensorInductionAndFiniteGroupInputs §9.1); the canonical filtration of 5.14 and 5.16 (SlopesOfHermitianVectorBundles §3.2); the hosts (FrobeniusRestrictedRieszSums §§0.1, 0.4, 0.9).

The README needs no rewording if the seven roadmaps come back with these section numbers. What is needed is that they exist where a reader can open them: their pull requests open again (or merged), or, if their content now lives in other roadmaps, the citations repointed to those roadmaps and sections. A prerequisite that will have no roadmap is stated here as a target instead.

## C01 — The Dependencies paragraph of the description does not say that seven cited sub-roadmaps are in no open pull request

"Sub-roadmaps of the family and other roadmaps that are still in open pull requests merge first" reads as if every cited sub-roadmap were on main or open. With R01 as it stands, a sentence that would be right: "Of the sub-roadmaps the README cites, ThetaChainsOnDefiniteUnitaryGroups and RowTowerAndRallisIdentities are in open pull requests and merge first; FrobeniusRestrictedRieszSums, HermitianFormsAndLattices, DiscreteSeriesCoefficientsAndAutomorphicMetrics, PositivityOfDirichletSeriesWithKernels, TensorInductionAndFiniteGroupInputs, SlopesOfHermitianVectorBundles and FiniteReductiveGroups have no open pull request at present." The rest of the description agrees with the head (a new folder; `Suggested.lean` declares nothing; the validation paragraph now says that the automatic checks pass).

## C02 — In the Route of 5.20d the weight `ω` does not cancel

Line 1753: "The two inequalities multiply to (a), `ω` cancelling." The amplitude bound carries the factor `ω(t)` on its right, and the count bounds `Σ w_row(t)w_row(t′)·ω(t)ω(t′)`: the product of two amplitude bounds, summed over `S`, is the left side of the count times the factors that depend only on the defects and labels, and the count then bounds it. Nothing is divided out; a reader looking for a factor `ω^{−1}` finds none. Would read correctly as "Summing the product of the amplitude bounds for `t` and `t′` over `S` and applying the count gives (a); `ω` enters only through the left side of the count." The exponents are right as they stand: `−(k − 1 − j)/2 + k/2 = (j + 1)/2` for `Nm`, `C² + C_h²` for `b`, `−C_s k + C_p k` for `Sz_H`.

## N01 — In (St) of 5.20a, "`m⁴ ≤ f ≤ k` (`SizeMf`)" still attributes both inequalities to `SizeMf`

Line 1453. `SizeMf` of ThetaChainsOnDefiniteUnitaryGroups §2.1 is `m⁴ ≤ f` only (read at the head of its pull request). Would read correctly as "`m⁴ ≤ f` (`SizeMf`), `f ≤ k`".

## N02 — The Check of 5.20a still does not say how the nodes are spaced

Line 1528 ("nodes near `10¹⁵`"). With nodes `10¹⁵ + j·10³` I get `−18.1` and `+1.65` to `+1.68`, inside the stated "about `−18`" and "`+1.5` to `+1.9`"; with nodes `10¹⁵ + j·10¹⁴` I get `−17.3` and `+2.4`. Naming the spacing would make the Check reproducible; its conclusion does not depend on it.

## Questions for the author

- Were the pull requests of the seven roadmaps of R01 closed on purpose (a reorganisation of the family), and if so where do their sections now live? I could read only main and the open pull requests, so I cannot tell a closed pull request from a renamed roadmap.

## Previous findings

The previous report had no finding; its small correction and format notes are accounted for here.

- C01 (validation paragraph of the description) — repaired: it now reads "the automatic checks pass, the three files of the family index named above counting as this pull request's own since the roadmap is nested in that family, and the dependency check reports no upward or cyclic edge".
- N01 — not repaired: line 1453 still reads "`m⁴ ≤ f ≤ k` (`SizeMf`)"; written again as N01.
- N02 — not repaired: the Check of 5.20a still says "nodes near `10¹⁵`" (the range now reads "`+1.5` to `+1.9`"); written again as N02.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 5.13a setting, (G), weight | `d_N`; `h_nv` at `m = 2q_S`; `GapOK`, `bcWeight` | `dim N_S = (r² − 2r_S − k′²)/2 = r_S(2r_S+2k+1)`; `16√2(m/2)^{3/2} = 8m^{3/2}`; source: `120r³`, `9q_Sr² + 12pq_S + 3`, `∏‖c_a‖^{2(M−2)}(‖𝔷‖² − TT′)^{k−1}` | agree | none |
| 5.13b route (T1), sublevel | one plane; three nodes | `∫_ℂ(1+‖a‖²)^{−(2+s)/2} = 2π/s`; `a′_0` integral `(2π/ν_0)L^{−2+ν_0}Δ_1^{−ν_0}`; Lagrange: `3·λ·4/s² = 12λ/s²` | agree | none |
| 5.13d (e) threshold, 5.13 Check | (G) for `h/4`; `k = 2`, `u = (13/2, 9/2)`, `hc = (5; 0, −3)` | `288√(2q_S)q_Sr² ≥ 64√(2q_S)(q_S−1)r² + 8√(2q_S)`; interlacing `6.5 > 5 > 4.5 > 0`; `hc_1 − ½ − u_2 = 0` | agree | none |
| 5.15 Checks | `r_S = 0` | `Gr = ‖⟨γz′, z⟩‖² − TT′ ≥ 0` (reverse Cauchy–Schwarz), equality iff proportional | agree | none |
| 5.15a (headline) | `S = S′ = 1`; `U(1)`, `σ = e^{inθ}`; dimension count | `R(e_σ)W = W`; `O(γ) = ⟨b, σ(γ)b′⟩`; `∫ = 1/d` (equality); conjugate coefficient ↦ `∫e^{−2inh} = 0`; `2dim S + 2(r_S+1) − (k−1)² = (2r_S+k+1)²` | agree | none |
| 5.16 (headline) | transference `N = 1, 2`; basis `(M,1),(1,0)`; residue bound; flag `d_N` | `N/κ ≤ N²/(2κ)` for `N ≥ 2`, `1/(2λ_1^∨)` for `N = 1`; det `−1`, first length `√(M²+1)`, dual minimum `1`; `(e·2f·log rd/(2(2f−1)))^{2f−1} ≤ (e log rd)^{2f−1}`; `2Jn − 2J² − Σj_i²` | agree | none |
| 5.17a | `q = 3, 4, 2`; `GL₂` | `∏(1−3^{−i})^{−1} = 1.785 ≤ 2`; `1.452 ≤ 1.75`; `q = 2, k = 3`: `8/3 > 5/2`; `‖U‖/dim = q/(q−1)` | agree | none |
| 5.17c (b1) | sign against 5.18d with `d = ℓ + 1` | `(−t)^ℓc = (−1)^{d−1}ct^{d−1}` and `(−1)^{d+1}ct^{d−1}`: equal | agree | none |
| 5.17d | `m = 1` inert; `Σ_𝔭x_𝔭`; `W_rows` | `q^{r−1}(q^r − (−1)^r)/q^{2r−1} = α(r)/α(r−1)`; `ζ(s) − 1 ≤ 3·2^{−s}` for `s ≥ 2`; `(T^k−1)/(T−1)·(T−1) = T^k − 1` | agree | none |
| 5.17 Checks | `⟨3,3⟩` over `ℚ_3(i)`; `g = 3`, `T = 1` | `‖U_2(𝔽_3)‖ = 3·8·4 = 96`; `⟨z′,z′⟩ = −T`, `Gr = 2Tg² + g⁴`; determinants `−99`, `−11` | agree | none |
| 5.18 Checks, 5.18c, 5.18d | one site; `U(s)`; exponents | `T(Y+1)^T𝐉T(Y) = 𝐉` using `[p, c^{−1}] = −c^{−1}`; `T(Y)U(s) = [[Y+p+sc, −c],[c^{−1}, 0]]`; `−d(d−1)+(d−1) = −(d−1)²`; `min(‖t‖,‖t′‖) ≤ 2/‖t^{−1}−t′^{−1}‖` | agree | none |
| 5.18e (h) | Markov's inequality | `sup‖p′‖ ≤ (2d²/L)sup‖p‖`; statement as read in the previous review (`LemmaEModel`), text unchanged | agree | none |
| 5.19 | `L = 0`; block-positive Schur form | conclusion `(1 + C(C/Θ)^f)(1+e_1)𝔧`; test vector `(𝟙; −e^{iθ}𝟙)` gives `‖ΣW‖ ≤ ½(ΣA + ΣB)` | agree | none |
| 5.20a | exponents; `κ_sc`; Check at `k = 200`, `m = 4` | `Σ_{M=k+1}^{r}M = (m−1)k + m(m−1)/2`; `(r−1)/2 = r_S + k/2`; `b^{1/40} ≤ b^{1/8}`; `−18.1`, `+1.65…1.68` (spacing `10³`) | agree | N02 |
| 5.20b | `2×2` lemma; hyperbolic bounds; `γ_GG(1)W_rows dim V` | `T′²‖c‖² = T²‖b‖²`; `∏‖c‖_w ≥ (T/g)^f`; `(ch′+ch″)/(sh′sh″) ≤ 2√2/(min·min)`; `(1+√2)² = 5.83 ≤ 6`; product equals `d_u^{all}` by 5.20a (a) | agree | none |
| 5.20c | `ε_N` exponent | `k − 2r_S − 5 = k − m − 3`; `≤ −(8C_n log 2 − C₄)m⁵fL + (m+3)log 2` | agree | none |
| 5.20d | `TypeAt`, `k2a`, `k2e`, `k2S`, `Nloc`, `frameExp`, `DelC`, `CosetsC`, `k2A1`, `TailBd`, `StandingNumericalData`, `KTwoParameterConditions` | `frameExp = l(2r_S+1−l)/2 = e_l`; `k2a·k2e = (C/k)^{j(k−1−j)f}Nm^{(j+1)/2}b^{(C²+C_h²)m²fr_S⁴}Sz^{−(C_s−C_p)k}`; `C_p = 16`; tail `2(2r_S+2)λ^{−2q}`; `j+1−4k ≤ −3r_S`; `rd_E^{−4fe_j}` | agree | C02 |
| 5.20 (headline) | `C_Δ = 5`, `c_T = ½`, `C_b = 3`; `b = 16`, `k = 32` | `c_Θ = ½min(½, ⅛) = 1/16`; `C_l ≥ 256`; `k^{−c_Θf/2} ≤ b^{−8}`; `P_g ≤ e^{6b^{−8}}`; `12f·2^{−(k−m)}b^{14} ≤ 0.22`; `η_off ≈ 10b^{−7} ≤ b^{−6}` | agree | none |
| 5.21 (headline) | (ii), (iii), (v); `Conclusion2`, `DiagLP`, `LinkS` | `2Γ₀d²/D* + 2de^{−kf log k}` with `Γ₀d/D* ≤ C₀/Γ₀`; `dim ker ≤ ‖K−1‖²`; source: `d·exp(−kf log k)`, `C_Γ ≥ max(C_B, C₄)+1`, `exp(−x^{ε/8})` | agree | none |
| 5.22 Check | `k = 1`, `r = 2` | `B = 1`; `g·(g−1)(g²−1) = ‖GL₂‖`; ratios `(g−1)/g`, `(g+1)/g` | agree | none |
| 5.23 | `Wg`; `q = 19`, `d = 526679`, `g = 1136944064017` | source formula term by term equal to `W^{bd}`; `d`, `g` prime, `d ≡ 7 (16)`, `−d` a square mod `3,…,19`, `16qd ∣ g−1`, `a²+ab+131670b² = g`; `(16+q+d)/(16qd) < 1/(4q)` | agree | none |

- Source locators checked against the text: 157 declarations of [FormalProof] in 92 files, each found in the cited file under the cited namespace; of these the statements of 5.20d, 5.21, 5.23 (ii), 5.17 (`RowsMass`), 5.13a (`GapOK`, `bcWeight`) and the hypotheses `Hyp`, `Stand`, `ConcTie` were read against the README. Paper locators: SunZhu2012 line 66 (Theorem B, p. 2), JiangSunZhu2010 line 24 (Theorem A, p. 1), He2017 line 97 (Theorem 0.1, p. 3) and lines 62–85 (admissible pairs), BeuzartPlessis2020 line 11200 (Theorem 12.4.1, p. 290), Xue2023 lines 213 and 254 (Theorem 2.2, p. 1000; Corollary 2.5, p. 1001).
- Library declarations opened at the pins: `TauCeti.lintegral_rpow_lintegral_mul_le` (`TauCeti/MeasureTheory/Integral/SchurTest.lean:132`), `IsFoelner` (`Mathlib/MeasureTheory/Group/FoelnerFilter.lean:91`), `ContRepresentation` (`Mathlib/RepresentationTheory/Continuous/Basic.lean:55`), `ContRepresentation.IsUnitary` (used at `TauCeti/Analysis/Bochner/LocallyCompactGroup.lean:82`), the layer-cake formula (`Mathlib/MeasureTheory/Integral/Layercake.lean`); no formal degree or square-integrable representation in either library.
- Cross-roadmap citations resolved: ThetaChainsOnDefiniteUnitaryGroups §§2.1–2.9b, 3.8 and RowTowerAndRallisIdentities §§5.1, 5.2a, 5.3, 5.9 at the heads of their pull requests; on main GanGrossPrasadUnitaryGroups 1.2, 1.3, 2.6, 3.3, 3.9, 4.1, AnalyticNumberTheoryPartI §2.15, AnalyticNumberTheoryPartII §5.3k, GeometryOfNumbersAndQuadraticArithmetic §4.4.14, VonNeumannAlgebras Layer 9, ShimuraVarieties §7.0h, AutomorphicSpectralTheory §4.5, AutomorphicFormsOnReductiveGroups §2.4, RealSemisimpleLieGroups §§3.2, 3.3, 4.2, 4.3, AdelicAlgebraicGroups §§2.3, 3.1, 3.4, 3.5, ClassicalGroups §§6.1, 6.3–6.6, LieGroups Layer 9, CompactGroups Layers 2 and 4, LieHighestWeight Layer 7. Not resolved: the seven roadmaps of R01.
- Dependency check at this head: `depcheck: 133 roadmaps, 1485 edges, 0 problem(s)`; no UPWARD or CYCLE line (the check does not see the seven roadmaps of R01, which are in no list it reads).
- Automatic checks: all passed in the worker's run. Elaboration of `Suggested.lean`: exit 0, no output. The file declares nothing, so there was no signature to compare and no one-tactic probe to run.
- Outside the folder the pull request changes only the three files of the family index.
- Headlines: 5.15a, 5.16, 5.20 with 5.21; none statable at the pins (no formal degree, no quotient measure on `S\G` for a closed subgroup that is neither discrete nor normal, no unitary group of a Hermitian space over a number field); each is named in the module docstring with what it lacks.
- No layer or item is removed: the roadmap is new, and the change since the previous head adds 5.20d and extends 5.20b, 5.20 and 5.21.

Overlap check: read ThetaChainsOnDefiniteUnitaryGroups, RowTowerAndRallisIdentities, SeesawForThetaChains, ThetaChainsAndFrobeniusPrimeSums, GluedTargetAndDivisionInequality, AutomorphicSpectralTheory, GanGrossPrasadUnitaryGroups, AutomorphicLFunctionsAndLocalFactorsPartII; the Bessel–Poincaré series, the Gram operators and the constants `ε_C`, `e_diag`, `η_off`, `c_Θ`: owned here, cited by SeesawForThetaChains and ThetaChainsAndFrobeniusPrimeSums; the targets 5.1–5.12: RowTowerAndRallisIdentities, which names this roadmap for 5.13–5.23; multiplicity one and existence of Bessel models: GanGrossPrasadUnitaryGroups §§2.6, 3.9, cited here; nothing else shared. No open pull request changes this folder or drops an id it cites.

Source independence: 12 passages compared with 6 sources (the five papers at their locators and [FormalProof], which is Lean code without prose), none shared; largest share [FormalProof], 157 declarations in 92 files against 7 locators into the five papers; contents compared with [FormalProof]: it has no table of contents, its directories (`Formalism/HermitianCurvature`, `Formalism/LocalToGlobal/SiegelLatticeTheory`, `Development/AbelianVarietyTheory`, …) do not correspond to the targets 5.13a–5.23, whose order the *Needs:* lines force: independent.

Research link: 5.16 is a uniform-error form of the limit multiplicity theorems of DeGeorge–Wallach (1978), Clozel (1986), Savin (1989); 5.13c–5.13d specialise the archimedean Gan–Gross–Prasad theory (Sun–Zhu 2012, Jiang–Sun–Zhu 2010, He 2017, Beuzart-Plessis 2020, Xue 2023); 5.20–5.21 serve Alpöge's formal proof (2026). Rests on the README's References and the six texts read.

## Not verifiable

- The citations into the seven roadmaps of R01 (they are named 133 times): no text of these roadmaps could be read on main or in an open pull request, so neither the existence of the cited sections nor what they state was checked.
- The proofs of [FormalProof] were not replayed: its files are not built on this host, so statements were compared, not proofs.
- The public repository of [FormalProof] was not fetched; I read the copy of its Lean source that the operator holds.
- In 5.20d, the tail bound, the covolume bound, the local bound and the count are stated without proof ("not given here"); I compared their statements with the source and did not derive them.

Automatic checks set aside as false positives: none; every automatic check passed at this head.

## Source issues

- none

## For the human reviewers

- **Scope.** Most targets are marked *NEW* and rest on [FormalProof], a Lean development announced on 20 November 2026 (README, References); no refereed text states them. The inputs marked *KNOWN* cite refereed papers.
- **Licence.** The family index says the formal proof "was published without a license" and is mirrored for verification only; the README cites its file paths and declaration names and copies no text of it.
- **Not tested.** [FormalProof] has no prose and no table of contents; wording and arrangement were compared with its statements and its directory layout only.
- **Order of merge.** Seven sub-roadmaps the README cites are in no open pull request and not on main (R01); the family index, carried by every pull request of the family, still lists them.
