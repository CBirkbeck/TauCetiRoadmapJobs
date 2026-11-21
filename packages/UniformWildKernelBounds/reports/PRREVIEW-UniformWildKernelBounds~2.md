# Review of UniformWildKernelBounds (pull request #2892 at b4b63e8)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/UniformWildKernelBounds/`
**Verdict:** needs changes

**Summary.** The mathematics I tested holds up. The sampled targets, the three headline theorems and about twenty-five Checks and worked examples were recomputed, and none of the stated values or counts was wrong. One finding blocks: the statements that the roadmap gives without a route and rests only on [FormalProof] (the Selmer counts of 3.15(c), the seeds and the Hecke-ideal clauses of 3.20(d), (e), and 4.5 (model) with (i), (ii) of 4.3 for `𝒟_G`) have no locator into it. Every headline route passes through them. There are six small corrections (two dangling pointers, two supplier contracts worded more strongly than their suppliers, an upward use of Layer 4 inside Layer 3, and a truncated pull-request description) and three format notes. The human reviewers have to decide on the scope and licence questions raised by the main source, an unpublished formal proof announced on 20 November 2026.

## R01 (P2) — The statements asserted only on the authority of [FormalProof] have no locator into it, so as written they are unsupported

All three headline theorems (7.3–7.6) route their plus part in Cases I, II, III and V large through statements that the README gives without a route and attributes to [FormalProof]:

- the Selmer counts (K1′) and (K2′) of 3.15(c) (line 945);
- the two seed existence statements of 3.20(d) (line 1506);
- the maps and the clauses (P1₄), (pur) and (aut) of 3.20(e) (line 1518);
- 4.5 (model) (line 2328);
- (i) and (ii) of 4.3 for `𝒟_G` (line 2334).

The README gives no argument for these statements, so the citation is their only support, and it names no theorem. Each target says only that it is "a theorem of [FormalProof] whose route is not given here". The References entry (line 3171) gives a repository URL and nothing narrower. Neither a referee nor an implementer can check that [FormalProof] proves these statements with the hypotheses written here, for instance the host data of 4.5, or the level `N` and the Taylor–Wiles set in (K1′).

I checked this against the copy of [FormalProof] that the operator holds. It is a kernel export of the development, whose audit configuration names the family's five Riemann-hypothesis theorems, with 175,187 modules and 2,701,132 constants under generic paths (`Development/AbelianVarietyTheory/…`, `Development/AutomorphicArithmetic/…`). A search of its module names for the objects of these targets finds only scattered candidates, for example `ExistsCentresLevel` and `UnramifiedCocycleIsCoboundaryOfBernoulliUnit`. None of them can be identified with the statements above. The repository URL in the References could not be read through the project's sources service.

The smallest repair is one line per statement. After each of the statements listed above, name the declaration or declarations of [FormalProof] that state it, by fully qualified name and module. Give the version they are read from (a commit, or the SHA-256 of the archive), and say in one clause where the Lean hypotheses differ from the README's. The same line at 7.6, the form the family consumes, would let the consumers check their input as well.

## C01 — The pull-request description stops mid-sentence and describes an earlier validation state

The description's opening paragraph ends at "The roadmap bounds the logarithmic total" and the next paragraph begins, so the formula for `V(F, t)` and the rest of the summary of the headline bounds are missing. The README's Summary continues at that point with the displayed formula and "a sum over all primes `ℓ`, including `2`, … uniformly in the layer, the prime and the twist". Completing the sentence from the Summary would fix it.

The description's sentence on validation is also out of date. It says that the automatic checks all pass except the one for changes outside the roadmap folder, and that this one lists only the three files of the family index. At this head every automatic check passes, including that one, since the family index belongs to this pull request. It could say so.

## C02 — 7.3(b) points to a clause that does not exist

In the route of 7.3, line 2864, the minus part is taken from "§5.4(b)". Target 5.4 of this roadmap has no clause (b), and BernoulliBoundsForClassGroupEigenspaces has no §5.4. The bound needed is 7.3(a), or directly BernoulliBoundsForClassGroupEigenspaces §10.1(b), since `ℓ ∤ [E : ℚ]` there. Replace "§5.4(b)" by "(a)".

## C03 — The References cite a layer of ArithmeticKTheory that does not exist

The Soulé entry (line 3175) says the published bound is "compared with ArithmeticKTheory Layer 9 and BernoulliBoundsForClassGroupEigenspaces Layer 9". ArithmeticKTheory on main has Layers 1–8; the explicit torsion bounds are BernoulliBoundsForClassGroupEigenspaces Layer 9 (§§9.1–9.8). Dropping "ArithmeticKTheory Layer 9 and" makes the sentence true.

## C04 — The contract with BernoulliBoundsForClassGroupEigenspaces §6.17 asks for an inequality that §6.17 states only up to `r₁(F)`

The supplier contract (line 3019) lists "`length Ш¹ ≤ length H²(𝒪_F[1/ℓ], ℤ_ℓ(e+1))`" among what §6.17 provides. §6.17(c) proves this for the strict group `Ш¹_str`, and for `Ш¹` only as `length H² + r₁(F)`, because the two groups differ at real places when `ℓ = 2` and `e` is even. Every use here (1.5(b), 1.6, 6.1) is at a totally complex field, so no stated result is affected. Adding "for totally imaginary `F` (in general up to `r₁(F)`)" would match the supplier.

## C05 — The contract with AlgebraicModularFormsAndSerreWeights §5.10 reads as if the residual eigenvector lifts

The contract (line 3131) describes the lemma as "a residual common eigenvector … lifts to an eigenvector over a finite extension with eigenvalues reducing to the residual ones". Deligne–Serre, Lemme 6.11 (p. 522), and §5.10 on main give only a nonzero common eigenvector over a finite extension whose eigenvalues reduce to the residual ones. Deligne and Serre remark explicitly that the eigenvectors themselves need not lift. 3.22(b) uses only the eigenvalues. Rewording to "there is a nonzero common eigenvector over a finite extension whose eigenvalues reduce to the residual ones" would make the contract accurate.

## C06 — Layer 3 uses a statement of Layer 4

The route of the clause (seed) of 3.20(e) (line 1646) uses "4.4 (irreducibility), last sentence", and Layer 3's Dependencies record the upward edge (line 1828). There is no cycle between targets: that sentence concerns any `ρ` attached to a cuspidal representation over a tower field and uses neither 3.20 nor `𝒟_sp`. But an implementer who follows the layer order is blocked at 3.20. That sentence on free ratios and regular elements could move into Layer 3 ahead of 3.20, or become a numbered item of its own, with 4.4 citing it. The definition of a tower field it needs is already used by 3.20.

## N01 — Layer 3 numbering jumps from 3.6 to 3.11 (line 698); 3.7–3.10 do not exist.

## N02 — The heading at line 3113 carries the whole PadicFamilies contract and is followed by an empty subsection; the text after "PadicFamilies" belongs in the body.

## N03 — A space is missing after a full stop before "*Needs:*" in 0.1 (line 148) and before "The route uses" in 3.20, 4.3, 4.7, 5.3, 5.4, 5.7, 6.4 and 7.1–7.6 (for example lines 1534, 2046, 2837).

## Questions for the author

- The announcement's footnote 1 gives the proof as the archive `alpo.ge/lean.tar.gz.part01…part14`, while the References cite the repository `leanprover-community/riemann-hypothesis`. Which of the two, and which version, are the statements of Layers 1–7 read from? The sources service refused the repository's host, so I could not compare the two.
- Does [FormalProof] state the window bound in the budget form 7.6, with the hypotheses written there (`0 < ε ≤ 2`, `v₂(q + 1) ≤ a`, `q > 2X^κ + 1 + P(χ)`)? I could not locate it in the export by module name.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 1.2 growth by the rank | `X = ℤ_ℓ`, `g = 1 + ℓ`; the step at `ℓ = 2` | length `m + 1` against bound `(j₀ + 1) + (m − j₀) = m + 1`; `(h − 1)X ⊂ 4X` gives `N_h x ∈ 2x + 4X` | holds, sharp |
| 1.3 centres (Check) | `g = α ∈ 1 + ℓℤ_ℓ`, `u = 1 + ℓ`; lift `diag(1, 0)` | `v((u^eα)^{ℓ^j} − 1) = j + 1 + v(e − s)`; eigenvalue 0 gives `v(−1) = 0` | holds, equality |
| 1.5 twist bounds | `m ≤ j₀`, `m > j₀`; `X′ = 0` | `coker(h^{ℓ^m} − 1)` is a quotient of `coker(h^{ℓ^{j₀}} − 1)`; `R(m − j₀)` added; `r₁(L_{j₀}) = 0` | holds |
| 1.1 Check (regular `ℓ`) | `L = ℚ(μ_ℓ)` | `Pic/ℓ = 0`, Brauer part 0 (one prime above `ℓ`), so `H²(ℤ/ℓ(i+1)) = 0` and `K_{2i}{ℓ} = 0` | holds |
| 2.1 pigeonhole | `R = 0`; `R = 1`, `B = 1` | forbidden log-length `R log 2B` < admissible `(R + 1)log 2 + R log B`; ratio 4 against ratio 2 | holds |
| 2.4 window over abelian base | `J = 4J_*`, `x ≥ X^{1/J_*}` | `log 2|d| ≪ x^{δ/4}`; `x^κ·exp(Cx^{3δ/4}) ≤ exp(x^δ)`; `m′ = max(0, n + 2 − c) ≤ n` | holds |
| 2.3 Checks | `q ≡ 3 mod 8`, `q ≡ 7 mod 16` | index of `⟨q⟩` in `ℤ₂^×`: `2^{v−1}` = 2, 4; in `ℤ₂^×/±1`: `2^{v−2}` | holds |
| 3.2(b), (c) Checks | `q = 4, 5, 7`; `q = 2`, `z = ζ₃`; Salem quartic | 3.25 < 3.5; 4.2 > 3.683; 6.14 > 4.65; `7/4 < 9/4`; `3s = 5.166`; 60 < 94; 100 > 94 | all values correct |
| 3.5 Bernoulli units (Checks and (a)) | `f = 1`; `ℓ = 5, 13, 29` (`m ≥ 4`), 3, 41 (`m ≥ 6`), 7, 17 (`m ≥ 8`), 97 (`m ≥ 10`) | norm mod `ℓ` nonzero in every case; `ℓ = 17`, `m = 6`: sum ≡ 0 with `ξ(5) = 11`; 29120 ≤ 32768 < 58240 | holds |
| 3.14 frames | Greenberg–Wiles at `w`; `κ ≠ ω` | `#H¹/#H⁰ = |k|²/|k| = |k|`; real term 1 (`κ` odd); `κ = ω` would put `K` in the field of `(ω, Ψ̄)` | holds |
| 3.18 counts (Checks) | `𝒢₃` problem of 4.1; `GSp₄` of 4.4; `ω ⊕ 1` | `(1,2,3,4,2) − (0,1,1,1,0) − (1,2,2,2,1) = (0,−1,0,1,1)`; `+1, 0, 0, −1, 0`; `1 = 0 + 1` | holds |
| 3.22 Eisenstein congruence | `c₀`; `ℓ = 3`, `M = 4`, `w = 13` and `w = 7` | `Σχ̄(a)Li_{1−k}(ζ^a) = G(χ̄)L(1−k, χ)`; `13^k − 1 ≡ 0`, `7^k + 1 ≡ 2 mod 3`; DS 6.11 lifts eigenvalues only | holds (C05) |
| 4.1 local chart | Bloch–Kato per weight | `1, 2, 3, 4, 2`, total 12, `dim R_ℓ = 13`; `(ad_j)^{c=1} = 0, 1, 1, 1, 0` | holds |
| 4.4 model of `A` | `λ`-weight-zero monomials | chart `0, r, m, r′ + 1, 1`; equations `r + 1, m, r′`; excess `0, −1, 0, +1, +1`; free on `t_i, αb, θb` | holds |
| 5.1 class numbers | `ℓ = 5` | `√5(1 + log√5) = 4.035 < 5`; Minkowski bound ≤ `√|D|`; `Σ_{m≤M} d(m) ≤ M(1 + log M)` | holds |
| 5.2 Case Z | `(ℓ − 1) | e`; `ℓ ≡ 1 mod 4` | `H⁰(W)/ℓ` maps onto the one-dimensional `H¹(W[ℓ])`; `h(ℚ(√ℓ)) < ℓ`; `K₄(ℤ){5} = 0` | holds |
| 5.5 Case I | (a), (b) | `Σ_ℓ log ℓ·v_ℓ(NN) ≤ log|NN|`, two auxiliary `p`; `Σ_𝒪 #𝒪 ≤ N`; `q = Nw ≥ 7` | holds |
| 5.6 auxiliary data (Check) | `χ` cubic of conductor 7, `ℓ = 5`, `e = 2` | `p_K = 11`, `p₁ = 13`, `f₀ = 2`, `n₀ = 3`, `m = 15`; `f = 455`, order 6 | holds |
| 5.7 Cases II, III | JS window at `p₀ = 5`, `e = 2` | eigenvalues in `(p₀^{e/2}, p₀^{e/2+1})`, product `p₀^{2(e+1)}`; 60 < 94 | holds |
| 6.3 Case IV | `χ_P(ℓ, ψ)` of odd order | `comp₂`, `comp_q` trivial; `max B(χ) ≤ P(χ) < min Q`; `ψ` factors through `ℚ(μ_{f_χ})` | holds |
| 6.4 Case V large | `σ = Frob_w`, `Nw = p ≥ 7` | `q^e = p ≥ 4`; at `p = 7`: `6.14 > √7 + 1 + 1/√7 = 4.02` | holds |
| 6.5 Checks | `M′ = 5`, `a = 3`; `ℚ(μ₇)`, `ℓ = 3` | `ε₃ = 0, −1, 1, 0`; `1 − 43² = −2³·3·7·11`; `B_{2,χ₀} = 4(2 − ζ₃)/7`, norm 16/7 | holds |
| 0.3, 0.4, 3.20 Checks | `χ = 1`; `χ = (·/5)`, `ℓ = 19`, `e = 18` | `B(1) = {3, 7}`, `P(1) = 7`; `N = 161680`; `2^{27} < 196602880 ≤ 2^{28}`, `m = 28` | holds |
| 7.2 bad primes, plus part | Cases II, IV, V at `ℓ ∈ B(χ)` | per character `(ℓNe)^C`; Case IV at most `φ(f_χ)` characters; total `(Nt)^C + C·B` | holds |
| 7.3 headline (a), (b) | sum over `e < t` | `Σ n log(16N^{e+2}(e+1)!) ≤ tN log(16N^{t+1}t!)`; 6.5 with `ℓ ≤ o_χ`; (b) pointer "§5.4(b)" absent | holds (C02) |
| 7.4 window theorem (headline) | `t ≤ x^κ ≤ X^κ`; `J = 2J_{2.4}` | `q > 2t + 1`, so `t`-large; `V ≤ e^{x^{δ/2}}log 2 + 2(Nt)^C + Ce^{x^{δ/2}}` | holds |
| 7.5 tower form (headline) | `X = 2^{Jk₀}`, `k = ⌈log₂ Y⌉` | `k ∈ [k₀, Jk₀/2 + 1]`; `2^{2k−2} < Y²`; `log N = O(n)`; `+2t log 2` at `ℓ = 2` | holds |
| 7.6 budget form (headline) | `δ = ε/2`; consumer sizes | `log q + log q′ ≤ X^{ε/(4J)} ≤ X^{δ/J}`; `log N ≤ x^{ε/4} + (α + 1)log x + c`; consumers cite `a = 3`, `α = A_n + 1` | holds |
| 3.15(c), 3.20(d), (e), 4.5 (model), 4.3(i), (ii) for `𝒟_G` | locator into [FormalProof] | no declaration named; export has 175,187 modules, 2,701,132 constants | unsupported (R01) |
| §6.17 contract | supplier (c) | contract `Ш¹ ≤ H²`; supplier `Ш¹_str ≤ H²`, `Ш¹ ≤ H² + r₁`; uses at totally complex fields | wording (C04) |
| 3.20 to 4.4 (irreducibility) | target-level edges | 4.4's last sentence uses no 3.20, no `𝒟_sp`; Layer 3 lists Layer 4 | upward use (C06) |

- Source locators checked against the text: Deligne–Serre 1974, Lemme 6.11 (p. 522, DeligneSerre1974 line 574); Barnet-Lamb–Gee–Geraghty–Taylor, Theorem 5.5.2 (arXiv v4 p. 81, line 3787); the announcement, line 181 ("weakening of Vandiver"); the module list of [FormalProof]'s export.
- Library declarations opened at the pins: Mathlib `ContinuousCohomology.tateShafarevich` (RepresentationTheory/Homological/ContCohomology/Sha.lean:72), `continuousCohomology` (…/ContCohomology/Basic.lean:131), `NumberField.IsCMField` (NumberTheory/NumberField/CMField.lean:70), `NumberField.exists_ideal_in_class_of_norm_le` (NumberTheory/NumberField/ClassNumber.lean:78), `Submodule.eq_bot_of_le_smul_of_le_jacobson_bot` (RingTheory/Nakayama.lean:123), `Ideal.iInf_pow_eq_bot_of_isLocalRing` (RingTheory/Filtration.lean:432), `IsCyclotomicExtension.autEquivPow` (NumberTheory/Cyclotomic/Gal.lean); Tau Ceti `TauCeti.continuousLocalCyclotomicCharacter` (FieldTheory/Galois/AbsoluteGaloisGroup/Cyclotomic/Character.lean:54), `TauCeti.ZModTwist` (Topology/Algebra/Group/Profinite/ProP/ZModTwist.lean:137), `NumberField.classNumber_le_bound` (NumberTheory/EffectiveBounds/ClassNumber/Basic.lean:81). The Lean docstring's claims about them are accurate.
- Cross-roadmap citations resolved: about 65 sections in 17 roadmaps, on main (IntegralIwasawaTheory, ArithmeticKTheory, AutomorphicGaloisRepresentationsPartII, AnalyticNumberTheoryPartI, AlgebraicModularFormsAndSerreWeights, Completed/Chebotarev, Completed/EffectiveBounds, Completed/HeightsAndUnits, …) and at the open heads (BernoulliBoundsForClassGroupEigenspaces, FrobeniusRestrictedRieszSums, HeckeIdealsAndTaylorWilesRelations, ReducibilityIdealsAndUltrafilterPatching, ModularityAndLanglandsExtensions, PotentialAutomorphyInfrastructurePartII, KatoEulerSystems, CongruenceModulesOfThetaLifts, ThetaChainsAndFrobeniusPrimeSums). Two are dangling (C02, C03).
- Automatic checks: all passed at this head. Dependency check output: `depcheck: 170 roadmaps, 2009 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` exited 0 with no messages (the file declares nothing, so there was no `sorry` and no `#check @` comparison to make).
- Numerical probes: Bernoulli-unit norms modulo `ℓ` for 8 primes and `m = 4–12`, and the Check values listed above.
- Overlap check: read HeckeIdealsAndTaylorWilesRelations, ReducibilityIdealsAndUltrafilterPatching, PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensionsPartII and CongruenceModulesOfThetaLifts (open), and ClassicalSerreModularity, AutomorphicGaloisRepresentationsPartII and GlobalGaloisDeformations (main); nothing shared. HeckeIdealsAndTaylorWilesRelations assigns the residually reducible automorphy machinery to this roadmap. PotentialAutomorphyInfrastructurePartII §§8.9–8.12 treat individually polarized constituents with Steinberg places, not constituents exchanged by the polarization. CongruenceModulesOfThetaLifts and ThetaChainsAndFrobeniusPrimeSums cite 7.6. No other roadmap or Tau Ceti states 3.1, 3.5, 3.22 or 5.1.
- Source independence: 8 passages compared with 3 sources (the announcement, Deligne–Serre 1974, Barnet-Lamb–Gee–Geraghty–Taylor 2014), none shared beyond the quoted three-word phrase. The largest share of locators is [FormalProof], 8 of 13, none of them a locator inside it. Contents were compared with the module tree of [FormalProof]'s export (Development/AbelianVarietyTheory, Development/AutomorphicArithmetic, Development/AutomorphicSpectrum, …): no correspondence with the layers, so the arrangement is independent. A prose comparison with [FormalProof] is not possible, because the copy is a Lean kernel export.
- Research link: the headline bounds are an unconditional substitute for Vandiver-type vanishing of `K_{2e}(𝒪_F){ℓ}`, refining the torsion bounds of Soulé (1979, 2003). The routes use Ferrero–Washington (1979) and residually reducible automorphy lifting (Skinner–Wiles 1999; Thorne 2015; Allen–Newton–Thorne 2020). This line rests on the README's Summary and References.

## Not verifiable

- [FormalProof], for all 15 sampled targets as statements of it: the sources service refused the cited repository host, the operator's copy is a kernel export searchable only by module name, and the README names no declaration. The sampled targets were checked instead against their own routes, their suppliers and computed instances (table above).
- Kato, Astérisque 295, Theorem 14.2 (cited for 4.3), and the literature entries cited without a locator (Soulé, Schneider, Ferrero–Washington, Skinner–Wiles, Thorne, Allen–Newton–Thorne, Newton–Thorne, Geraghty, Caraiani): outside the seeded sample and not fetched.

## Source issues

- none

## For the human reviewers

- Scope: the main source is [FormalProof], an unpublished, unrefereed AI-assisted Lean development announced on 20 November 2026. The four-page announcement has no mathematical statement of these bounds. Layers 1–7 reconstruct that development, and no refereed source states the headline bounds (README References, lines 3171–3172).
- Licence: no licence for [FormalProof] could be read. The cited repository host was refused by the sources service, and the operator's copy is a kernel export with no licence file. The announcement points to an archive on the author's page, not to the cited repository.
- Not tested: [FormalProof] holds the largest share of locators. Its prose and table of contents could not be compared with the README beyond its module tree.
