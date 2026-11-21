# Review of LocalGainOfThetaChains (pull request #2915 at fa7ef96)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LocalGainOfThetaChains/`
**Verdict:** accepted

**Summary.** Accepted: no statement, Check or formula that I recomputed is false, and every sampled target that names a declaration of [FormalProof] agrees with that declaration, hypothesis by hypothesis where I compared them (4.14c, 4.14c′, 4.14e, 4.15c, 4.15d, 4.15f, 4.16, 4.16b, 4.16c, 4.17). There are five small corrections and two format notes, none blocking; the main one is that 4.15d says the formal proof bounds the bad tops "by another route", while the formal proof's own bound goes through the same tile argument. One question on 4.17d is left for the author, and the human reviewers have the scope and licence of the single source to decide.

## C01 — 4.15d says the formal proof reaches the bound on the bad tops "by another route"; it reaches it by the same tile bound

A reader of the note at 4.15d (lines 1307–1311) concludes that the three-event bound `p_orb` has no counterpart on the path of [FormalProof] and that `Formalism.G0.TileConditionFailureProbBound` is a side result. In the copy of the source I read, `Formalism/SharpRestriction/GrowthBounds/TopChoiceBounds.lean` proves the bound on the bad tops for the family (`family_tops_choice_of_master`, line 2943) from `tops_choice_holds` (line 2886), which rests on `good_orbit_failure_prob_le` (line 2535). That statement is the same conditional bound for the same good-orbit predicate, with equal probabilities `δ`, the same tile term `n(1 − markedBound)^{M₀}` and the same binomial tail; only the window term differs (`L₂·C(L₂,K)δ^K + n·C(L₂,K+1)δ^{K+1}` in place of `n·C(L₂,K)δ^K`). The same file also derives the bound from `TileConditionFailureProbBound` itself (`tops_choice_of_inequality`, line 2419).

What is this roadmap's own is the form with probabilities in `[ω₀δ, δ]`. The sentence would be right as: "[FormalProof] proves the case of equal probabilities, with a sharper window term, as `good_orbit_failure_prob_le`, and uses it for its bound on the bad tops; the form with a profile `ω ≥ ω₀` is this roadmap's own."

## C02 — Three targets marked *NEW* give no declaration of the formal proof: 4.9c, 4.9d and 4.17d

Every other *NEW* target names a file and a declaration, so a reader takes the absence as "no counterpart", which the text does not say. 4.9c (line 276) and 4.9d (line 303) carry *NEW* and a *Needs* line only. 4.17d (line 1738) describes what [FormalProof] does (the profile, the hypothesis `x^ε ≥ 64·C_o⁴`, the two conclusions) without a name. For 4.17d the conclusions it reports are those of `Formalism.MainNotions.J.TopsOK` (`Formalism/SharpRestriction/AdmissibleParameterJoins/GandSa.lean`, line 30: `δ|A|/2 ≤ |T| ≤ 2δ|A|` and the weighted count `≤ 4C_b x^{−2}·δ|A|·Σ log p/p`). Give the declaration at each of the three, or say at 4.9c and 4.9d that the statement in this form is the roadmap's own.

## C03 — 4.9e (f) cites §0.3 (b), (c) of the Weyl-module roadmap for the inclusion with `dim V_λ`, which is its (b′)

In 4.9e (f) (line 339 and the next) the text says that IntegralWeylModulesOfGeneralLinearGroups §0.3 (b), (c) "give even `p^{e}∇_ℤ(λ) ⊂ (dim V_λ)·Δ_ℤ(λ) ⊗ ℤ_(p)`". At that roadmap's head, (b) is `p^e·∇ ⊂ Δ` and the form with `dim V_λ` is the refinement (b′), which (c) then carries to `ℤ`. Cite (b′) and (c). The Check of 4.17 (line 1624) cites (b) correctly for the bound without the dimension.

## C04 — The docstring of `Suggested.lean` says Tau Ceti has "the Kostant form of an enveloping algebra"; at the pin it has the rank-one form

Line 17 of `Suggested.lean` lists what the pinned Tau Ceti has. The Kostant form there is the one of `𝔰𝔩₂`: `TauCeti/Algebra/Lie/Sl2/Kostant/Basis.lean` ("the integral PBW basis of the rank-one Kostant form", `kostantFormBasis`, line 152) and `TauCeti/Algebra/Lie/Sl2/IntegralLattice.lean` (`kostantFormRep`, line 343); I found no Kostant form of `𝔤𝔩_N` or of a general enveloping algebra. The conclusion of the docstring (no headline is statable) is unaffected, since the missing carriers are others. "The Kostant form of `𝔰𝔩₂`" would be exact.

## C05 — The description reports a build "with `sorry` as the only warning" for a file that declares nothing

The description says "`Suggested.lean` declares nothing" and then "the targeted Lake build succeeds with `sorry` as the only warning". The file elaborates with no message at all. "The targeted Lake build succeeds with no warning" is what the head shows.

## N01 — Locators into the formal proof are written in two forms

37 lines give a path with the prefix `src/` and a dotted declaration name in the prose (for example 4.14c), 46 paths have no prefix and the name in parentheses (for example 4.9e). One form throughout would let a reader search the source mechanically.

## N02 — The clause letters of 4.9e and 4.9f run (b), (c), (f), then (d), (e), (g), (h)

Clause (f) stands in 4.9e (line 334) before (d) and (e) of 4.9f (lines 365, 391), and there is no (a) in either section ((a) is in 4.9). Other roadmaps cite these letters, so a note that the letters are shared across 4.9–4.9f, at the head of 4.9e, would be enough.

## Questions for the author

- 4.17d (line 1738) says that [FormalProof] selects the tops with the profile `ω = 1` on `A₀` and `ω = 3/4` on the other cosets, under `x^ε ≥ 64·C_o⁴`. The declarations I found for the selection (`Formalism.MainNotions.J.BadProb` and `J.TopsOK` in `Formalism/SharpRestriction/AdmissibleParameterJoins/GandSa.lean`, lines 23 and 30, and `Conclusion6` in `Formalism/SharpRestriction/GlobalSchurBounds/CMFieldLemmas.lean`, line 116) use the uniform law `δ^{|T|}(1 − δ)^{|A| − |T|}` with the hypothesis `16 ≤ δ·|A|`. Which declaration carries the two-valued profile and the hypothesis `64·C_o⁴`? I searched the source for a coset profile under several names and found none; with 175188 files I cannot exclude it.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Conventions: `γ_LT`, weights `ϱ` | `p = 5`; a place with `e, f` | `p/(p²−1) = 5/24 = Σ_{i odd}5^{−i}`; `Σϱe = Σ e f log p/[𝕃:ℚ] = log p` | holds | none |
| 4.9 Checks: types via `h = cFrob_p` | `ord h` even, `1`, odd `> 1` | `c ∈ ⟨ch⟩` iff an odd power of `h` is `1`; split, conjugate, odd conjugate | holds | none |
| 4.9c Check, `|√−d·s₂|` | `d = 7, 11, 19, 43` from `E₂*E₄/E₆ = 5/21, 32/77, 32/57, 6400/9030` and `j = −15³, −32³, −96³, −960³` | `1/4, 2/3, 2, 12` (e.g. `d=7`: `(5/21)·27√7/(12·15)·√7 = 1/4`) | holds | none |
| 4.9e against `G.g0`, `G.gU`, `G.dl`, `G.Sv`, `G.tauP`, `G.ioP`, `G.Sig` | terms `e ≥ n′`; the excess | both sides exclude only the first odd hit of another top; `⌈Σ_j(r^H−P−max(r⁰,0))₊⌉`; `τ_N = e_p + Σ m(⌈dep⌉+D_p+1)` | matches | none |
| 4.9e Checks: `r^H ≥ r⁰` when `r⁰ > 0` | `(x−c)₊ + min(x,c) = x`; even top | `Σ_{e∉Dist}(α̂/p^e − ĉ)₊ ≤ γα̂` | holds | none |
| 4.9f Check, diagrams | `(k,m,t) = (6,2,13)`, `s⁺ = (−5,…,−9,−10)`, `w₁ = 18` | `a⁺_i = s⁺_i + 6 + i = 1` (six times); `a⁻_0 = 26−18−7 = 1`; other expression `−26+18−7 = −15`; `u₅ = −9.5` satisfies (W2) | holds | none |
| 4.10 (3b), (5) inequalities | `log_p a ≥ 1` | `log_p(a²)+1 ≤ 3log_p a`; `f N²(2log_p a+1) ≤ 3fN_m² log_p a` | holds | none |
| 4.12 (a) lattice count | `(N_{j−1},N_j,i)` = `(0,N,i)`, `(1,1,1)`, `(1,2,1)` with `x` a unit and `x ≡ 0` | `[N,i]=[N,i]`; `1=1`, `0=0`; `1=1`, `q+1 = q+1`; `[2,1]_q = q^{1/2}(q^{1/2}+q^{−1/2})` | holds | none |
| 4.12 Check, Hida exponent | `n′ = 2`, `j = 1` | `Σλ_a − i(t+1)/2 + i(w₁ − k/2) = Σλ_a + i(w₁ − κ₁)`, `κ₁ = (k+t+1)/2` (supplier §2.3 and `kaJ`) | holds | none |
| 4.13 integrality | `2r_H ≤ k`, `N_j ≥ k+t+1` | `N_j − 2r_H + l − t ≥ 1 + l ≥ 0` | holds | none |
| 4.14 (a), `𝔵_v ≤ mγΣα` | `γΣα ≤ 1`; `> 1` | sum `0`; `≤ mγΣα − m`, ceiling adds `< 1` | holds | none |
| 4.14a | `n=1`, `M = X`, `t_j = j`, `Y₀ = p^H`; `M = X·1_n`, `E → ∞` | share `1/p ≤ 1/Y₀ + 1/(p−1) + H/Y₀` (`E=1`); count `n` at `j=0` equals bound `nδ₀` | holds | none |
| 4.14b (H_I) against `flipOneThree.HypI` | 17 clauses, `k = m+1` | all present; `2N₁+2 ≤ m` is `2s_max+3 ≤ k`; README takes `bl = b′` | matches | none |
| 4.14c against `CanonicalTranslateJetIdentity`; Checks | `r=1`, letters `x, v`; `x, ξ` | `p ≥ 5`, `w² = p`, `N+r ≤ K`, costly condition: same; lift of `x_0^{p^d}v_c − x_c^{p^d}v_0` = `w·x_0^{p^d}v_c + w^{p^d}(…)`; second: `w·x_0^{p^d}ξ_0 + w^{p^d}(…)` | matches | none |
| 4.14c′ against `flipOneThree.adm8`; Checks | one vector letter, `M₁ ≥ δ`, `M₁ < δ` | formal: equality of `𝒴` with the span; `Sym^δ` irreducible so `𝒴 = 0`, no path | matches | none |
| 4.14e against `PairLiftAt` | bound on `κ_β` | `4·kap0 = 8·N·k·log_p a`; pairing `[β=β′]κ_β∏a_j + w^cν` on both sides | matches | none |
| 4.14f′ (i)–(iii), Checks | `k=3`, `e₁⊗e₂`; `p=5`, `5⁵` letters | composites `0` and `½e₂⊗e₁`; denominator `5⁵`, exponent `⌊log₅(5⁵+1)⌋ = 5`, `4·lg₅(4) = 4` fails; weights of `V_κ^*⊗W` within `±d_S` | holds | none |
| 4.14g against `flipOneThree.Conclusion1` | `D`, the mean | `C·Y²N₁²k²·lgA + 4·N·k·log_p a`; mean `≤ C(t+1)N₁/Y`; projector exponent `(k−1)²(log_p(8a+k−1)+1)` | matches | none |
| 4.15a (a)–(c), Check | `R=ℤ_p`, `S=ℤ_p`, `B=p^{−1}ℤ_p`, `U=p`, `D=1` | left `length(ℤ_p/p²) = 2`; right `2 + 1 = 3`; kernel of `B′/ϖ^bS′ → B/ϖ^bS` is `0` by saturation | holds | none |
| 4.15b | `m=1`, `β=0`, one place | `π^{a+b+c₀}x ∈ yM + span`: `E = a+b+c₀` | holds | none |
| 4.15c against `ManyOrbitsRefined` | `π = √p`, `a=b=⌈dep⌉`, `c=2⌈dep⌉`, `c₀=2(D_p+1)` | `Σm(c+c₀)` halves to `Σm(⌈dep⌉+D_p+1) = τ−e`; `Σ_β g_β ≤ rank(e^{x}−1) ≤ 2·rank·x` for `x ≤ 1/2` (`e^{1/2}−1 = 0.649`) | matches | none |
| 4.15d, own bound and `TileConditionFailureProbBound` | `δ = 0.5, 0.51, 1/3` | `uδ(1−δ)^{u−1} = 0.5, 0.4998, 0.444 ≤ 1/2`; tiles `≤ n′/13`; `markedBound` is the term at `ω₀ = 1` | holds | C01 |
| 4.15f against `flipOneThree.Conclusion2` | threshold `tI`, mean | `Σ min(a⁻, a_{y⁻}/p^{d}) + R°_v`, `c_v` identical; mean `≤ C·N·N₁/Y`; `LPprime … 1 … t D_p κ c*` for `t ≥ tI` | matches | none |
| 4.16 (i) against `LinkG_at`, `G.NP` | definition of `N_u`, length | span of `∏y^m(p^{Σ𝔵}F)` ∩ `p^{τ}M` ∩ new forms; `len ≤ d·(τ + 𝔦)`, `2S𝔖 = 𝔦` | matches | none |
| 4.16b against `Conclusion5Sharp`, `ETpi` | the count | `m(2Σ𝔴 + fN_m) + ((t+1)/2)|Φ_top|m(m+1)/2 = m·𝔢_u` | matches | none |
| 4.16c against `HeckeIntegralLevelZero`, `SecondBranchInclusionLength` | `g = diag(1,…,1,T)` | length `Σ_μ μ_k = dim·|ν|/k`, `|ν| = |Λ₀| + k·a⁻`; formal: `e·d·(wsum + k·bTop)/k`; `Σ_{𝔭|π_u}ϱe = ½log T` | matches | none |
| 4.17 against `G.hG`, `rG`, `L1`, `L2`, `rhoB`, `DIf`, `DIIf`, `Cand`, `NoGain` | `N₁`, `ρ_B`, sizes | `uδ ≤ 1+δ ≤ 2`, `log 3 = 1.10 ≥ 1`; `4·(2nδ) = 4fδ`; `δ|A| ≥ x²`, `x ≥ 4o/ω₀`, `6o/ω₀`; tops `≤ 21.8n′δ ≤ 40n′δ` | matches | none |
| 4.17 Check, `GL₂` | `λ = (n, 0)` | least exponent `max_i v_p C(n,i) = ⌊log_p(n+1)⌋ − v_p(n+1)` | holds | C03 |
| 4.17a (ii), pieces | `γ ≤ 2/p`, `α ≤ 2a` | `g_j ≤ 4|Φ_top|a/p`; `⌊log_p 4a⌋ ≤ lg_p(2a)`; `e_p + mΣdl ≤ m·ℒ_f` for `C ≥ C_d+1, C′_d`; formal third clause of `LinkG_at` is the same inequality | holds | none |
| 4.17b | `a = 1`; `ϑ = b′/4` | `lg_p(2a) ≤ 2 ≤ 3log 2 = 2.08`; `(1.44L+1)/L ≤ 3` for `L ≥ 0.64`; `ϑ` term `≈ C·x·b/4`; units `1/40, 1/40, 1/40, 3/2, 1/40` in `PrimeSumNumericFacts` | holds | none |
| 4.17d | terms (A), (B), (C) | `(ε/8)(r_G−1) ≥ h_A+2`; `1/(2e²) = 0.0677`, `(6.7ω₀)^{3r}·max(1,(5ω₀)^{−3r}) ≥ 1`; `2^{−(N₁−1)} ≤ x^{−(h_II+3)}` | holds | C02, question |
| 4.17c | Markov; `𝔦`; units of (iii) | mean `W ≤ C x^ε log X′ m|Φ_top|max(…) ≤ x^{−c_io}`; `169/168`; `Σ = 4.708 ≤ 5` | holds | none |
| Headlines (1)–(4) of the Summary | against 4.10, 4.11, 4.14, 4.15c, 4.16, 4.17a | exponents and hypotheses identical; `s − v_p(D_Γ)` gives the period bound of (1) | agree | none |

- Source locators: 52 distinct files and 119 distinct declarations of [FormalProof] are cited; I confirmed that about 40 of the cited files exist and that more than 44 of the cited declarations are in them, and compared 16 statements with the README in detail (the rows above). The copy read is the operator's, of the repository's `src/` at commit `e50d098`; the README pins `ab0b752`, so line numbers are those of the copy read.
- Library declarations opened at the pins: Mathlib `Module.Basis.SmithNormalForm` (`Mathlib/LinearAlgebra/FreeModule/PID.lean:383`), `Module.length` (`Mathlib/RingTheory/Length.lean:31`), `Matrix.unitaryGroup` (`Mathlib/LinearAlgebra/UnitaryGroup.lean:105`), `FormalGroup` (`Mathlib/RingTheory/FormalGroup/Basic.lean:57`); Tau Ceti `weylModuleOfShape` (`TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Basic.lean:431`), the formal group law of a Weierstrass curve (`TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean`), the rank-one Kostant form (C04).
- Cross-roadmap citations resolved: every cited section id exists, on main (AbelianSchemesAndArithmeticModuli §A1.5, ModularCurvesPartII §1.4a, SmoothRepresentationsOfLocalGroups SR.4.3, ArithmeticLocallySymmetricSpaces ALS.F.7, StandardDistributions §§7.13, 9.4, ArithmeticStatisticsPartIV §3.2, ClassicalGroups §§4.3, 5.1, 6.1, ReductiveGroups 10B, AnalyticNumberTheoryPartI §0.11, AutomorphicFormsOnReductiveGroups §§7.4, 7.5) or at the open heads (the six sibling roadmaps, LubinTateFormalModulesAndQuasiCanonicalLifts §§4.3, 4.4, ComplexMultiplicationAndExplicitReciprocity §§4.3, 5.1, NonordinaryCMSpecialValues §§3.4, 3.5, 4.2, PotentialAutomorphyDworkMotivesPartII §0.7, PotentialAutomorphyInfrastructurePartII §§3.2, 3.8, DiscreteSeriesCoefficientsAndAutomorphicMetrics §§7.5a, 7.5b, AutomorphicPadicLFunctionsPartII §§6.1, 6.3, 7.1). Statements read against their use here: IntegralWeylModulesOfGeneralLinearGroups §§0.3, 0.3a; FrobeniusRestrictedRieszSums §0.7; ThetaChainsOnDefiniteUnitaryGroups §2.3; ThetaChainsAndFrobeniusPrimeSums §10.6; ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19.
- Dependency check: `depcheck: 170 roadmaps, 1996 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed on this head. Nothing is changed outside the folder except the three files of the family index.
- Lean: `Suggested.lean` elaborates with no message. It declares nothing, so there are no signatures to compare and nothing for the one-tactic probe. The four headlines of the Summary are each named in the docstring with the carriers they lack; none is statable at the pins (no algebraic modular forms on unitary groups, no integral Weyl lattices, no CM theta functions, no height-two Lubin–Tate groups).
- Pull request text: it says that the pull request adds the roadmap, that `Suggested.lean` declares nothing, and lists the open suppliers; all twelve open suppliers of the supplier contracts are in its dependency list. One sentence is inexact (C05).

Overlap check: read ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups, GluedTargetAndDivisionInequality, TaylorBoundsAndDepthsOnHeightTwoFormalGroups and CongruenceModulesOfThetaLifts (the lists for main are empty); nothing shared. None of them has a target 4.9–4.17d, a walk lemma or a definition of the depth property; GluedTargetAndDivisionInequality and ThetaChainsAndFrobeniusPrimeSums cite the ledger, `N_u`, `Drop` and the band constant by section of this roadmap, and TaylorBoundsAndDepthsOnHeightTwoFormalGroups owns 4.1–4.8c and 4.18–4.19f only.

Source independence: 16 passages compared with 1 source ([FormalProof], Lean statements), none shared beyond declaration names; largest share [FormalProof], 119 of about 121 locators (the others are Jantzen II.5–II.6 and authors' names); contents compared with [FormalProof]: independent (the source is a tree of Lean files with no chapters; the order 4.9 → 4.17 is forced by the *Needs* lines, 4.10 needing 4.9a–4.9f, 4.14 needing 4.12–4.13, 4.15c needing 4.15 and 4.15b, 4.16 needing 4.15c, 4.17 needing 4.15d–4.15f and 4.16).

Research link: Layer 4 is the gain at inert primes of the chains of theta lifts in Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (announced 2026); the README places it beside Gross (1999) on algebraic modular forms, Hida's normalisation and Bannai–Kobayashi (2010). Basis: the README's References and the family index.

## Not verifiable

- 4.9c and 4.9d: no declaration of [FormalProof] is cited, so they were checked only against the rest of the README (C02).
- 4.17d: the profile and the hypothesis `x^ε ≥ 64·C_o⁴` attributed to [FormalProof] were not found in the source (question above).
- 4.17c: the declarations cited for (i), (ii), (O1), (O2) exist in their files; their statements were not compared clause by clause.
- 4.14f′: the exponent of the formal hypothesis was confirmed (`kappaOneExponent`); the clause of the formal hypothesis listing the three commutations was not opened.
- The pinned commit `ab0b752` of [FormalProof] was not read; the copy read is at `e50d098`.

Automatic checks set aside as false positives: the listing of elaborated signatures and of library near-matches read the word after "class" in the module docstring of `Suggested.lean` ("class sets") as a declaration named `sets`; the file declares nothing and elaborates cleanly. The search for Lean names found nowhere lists the declarations of the formal proof, which are source locators and not library names.

## Source issues

- none

## For the human reviewers

- Scope: every *NEW* target (39 passages) rests on [FormalProof], a Lean development announced on 20 November 2026 with no refereed paper; the published works in References carry no locators except Jantzen II.5–II.6.
- Licence: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 13–15) says the proof belongs to its author and was published without a licence; the README cites 52 of its files and 119 declaration names, and no text of it.
- Not tested: the README pins [FormalProof] at commit `ab0b752`; locators were checked on the operator's copy at commit `e50d098`.
