# Review of LengthBoundsInPadicFamilies (pull request #2898 at 70fd942)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/LengthBoundsInPadicFamilies/`
**Verdict:** needs changes

**Summary.** Needs changes, for one sentence: the second Check of 1.8d says that without local conditions the bound of 1.8d(2) is that of 1.8c(1) up to coboundaries, and in the roadmap's own two-point example the first is `m ≤ ∞` and the second `m ≤ 2m`. Everything else I recomputed holds: the statements and routes of 1.7a–1.8e, including the new forms (4′), (1′), (3′), every other Check and Example, and the four Lean statements, which match the README. There are three small corrections and four format notes, none blocking. The human reviewers still decide the scope and licence questions about the unrefereed formal proof, which could not be read.

## R01 (P2) — With no local conditions the bound of 1.8d(2) is not the bound of 1.8c(1) up to coboundaries: it is weaker, and can be infinite where 1.8c(1) is finite

The second Check of 1.8d (README line 343) reads: "With `𝒱 = ∅` the bound is 1.8c(1) up to the coboundary terms". A reader takes from it that passing to cohomology classes loses only the coboundaries. With `𝒱 = ∅` the group `H¹_𝒮` is all of `H¹(G, ρ_b ⊗ χ^{−1} ⊗ K/O)`, so 1.8d(2) reads `length_O(O/c(π)) ≤ Σ_b(length C_b + length H¹(G, ρ_b ⊗ χ^{−1} ⊗ K/O))`. 1.8c(1) has instead the length of `Hom_𝒜(Y_s, ·)`, which is `length C_b` plus the length of the image of the cut cocycles in `H¹`, and that image is in general a proper submodule.

Take the computed two-point case (a) of 1.8c with `O = ℤ_p`, `p` odd, and `G` the free profinite group on `g_1, …, g_4`. There 1.8c(1) is `m ≤ m + m`. For the block `χ = 1`, `H¹(G, ℚ_p/ℤ_p) = Hom_cont(G, ℚ_p/ℤ_p) = (ℚ_p/ℤ_p)⁴` has infinite length, so 1.8d(2) with `𝒱 = ∅` is `m ≤ ∞`.

The smallest repair is to that sentence: "With `𝒱 = ∅` the bound follows from 1.8c(1), the cut cocycles modulo coboundaries embedding in `H¹`, and is weaker in general, since `H¹_𝒮` is then all of `H¹`; adding conditions can only lower `H¹_𝒮`, …".

## C01 — The description counts three Lean declarations and names three; the file has four

The description says "`Suggested.lean` states two of the three headline theorems, in three declarations" and lists the two forms of 1.7a and `length_quot_le_sum_length_blockSolutions`. The head also declares `length_quot_le_sum_length_blockSolutions_of_card_residueField`, the form 1.8b (1′) with one array over a large residue field. The text that would be right: "in four declarations … the determinant lemma of 1.8b in its generic form (`length_quot_le_sum_length_blockSolutions`) and in the form of the formal proof, with one array over a large residue field (`length_quot_le_sum_length_blockSolutions_of_card_residueField`)".

## C02 — The statements attributed to [FormalProof] carry no locator inside it

The Conventions say that where a target names [FormalProof] its hypotheses, ranges and constants are those of that proof. The places are 1.7a (4′), 1.8b (1′) (residue field with more than `g·Σ_b d_b` elements, `Rel` finitely generated), 1.8c (residue field with more than `g·n` elements, (P) without variables), 1.8d (3′) (the square of `δ_A(π)`) and 1.8e (4) (`t ≥ 2`). None names a file or a declaration of the formal proof, so a reader cannot find the statement whose exact hypotheses are being recorded, and an implementer cannot tell a restriction of that proof from a slip here. Naming the declaration (and its file) at each of these places would fix it; the References entry could carry the list.

## C03 — `Rel` finitely generated in 1.8b (1′) is not used by the route, and the Summary states (1′) without it

In 1.8b (1′) and in `length_quot_le_sum_length_blockSolutions_of_card_residueField` the module `Rel` is finitely generated. The route never uses this: `R_b ⊆ O^{gd_b}` is finitely generated whatever `Rel` is, and the non-root of `∏_b G_b` modulo `ϖ` needs only the residue field. The second headline of the Summary (line 8) states the one-array form with the residue-field hypothesis alone. The two agree once (1′) says that finite generation is the formal proof's restriction and that the route proves the statement without it, as the Conventions allow; or the Summary could add the hypothesis.

## N01 — One line of the `Suggested.lean` module docstring is 125 characters long

Line 47 ("coefficient module and the cocycles of the hypothesis. The coefficients …"); the rest of the file keeps to 100. Rewrapping the paragraph fixes it.

## N02 — "Index" in 1.7a (3) should be "colength"

"`η_Y(M)` is the index of `(M ∩ V_Y) ⊕ (M ∩ V_{X∖Y})` in `M`" (line 55): `η_Y` is a length, and over an infinite residue field the index as a cardinal is infinite. "The length of the quotient of `M` by …" would say it.

## N03 — The identity cited from DiophantineApproximationAndTranscendence §3.7 is not its last clause

The route of 1.8e (4) (line 477) cites "the last clause" of that section for `v_p((1 + a)^b − 1) = v_p(a) + v_p(b)`. The identity is there, followed by two further statements (the bound `|a^b − 1|_p ≥ c|b|_p` and the theorem on products of rationals). Would cite it as the lifting-the-exponent identity of §3.7.

## N04 — Hida's modules of congruences are defined in his §3

1.7a cites "[Hida], §0 and §6". §0 has the module `C(f)` and statement (0.1) (Hida lines 59–66); §6 is the proof of Theorem 3.6 (Hida line 1261). The definitions themselves are (3.9a) and (3.11) in §3 (Hida lines 858–860, 906–909). Adding §3 to the locator would point at them.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 1.7a (1)–(3), definitions and indices | `A = M = O × O`, `Y = {1}`; `A = O[ε]/(ε², ϖε)`, `e = 1`; `Y = {x}` | `𝔞_Y = 0 × O`, `M[𝔞_Y] = O × 0 = M ∩ V_Y`; `Ann(𝔞_1) = 0 ≠ kε`; `Ψ_{{x}} = M/(M[𝔭_λ] + M[I_λ])` | hold | N02 |
| 1.7a (4), headline 1, first Lean theorem | `A = {a ≡ b mod ϖⁿ}`, `M = A, A^m, O²`, `Z = {1}`; `Z = ∅`; `Z = X`; `X = ∅` | `n = 1·n`; `mn = m·n`; `0 ≤ n`; `0 ≤ 0`; `0 ≤ Σ`; `M = 0` | holds; equality cases as the Checks say | none |
| 1.7a (4′), second Lean theorem | same `A`, `M = A`, `S = {1}`: `α` kills `V_2`, scalar `a` on `V_1`; `M = O²`, `α = (1, 0)`; `S = ∅` | `α ∈ End_A(A) = A` forces `v(a) ≥ n = η`; `0 ≤ 0`; `0 ≤ 0`; route: `a_{π_k}u − α_{π_k}u ∈ U_{k−1}` | holds | none |
| 1.7a Check, `A = O[t]/(t² − ϖ^{2n})` | `e = (1 + t/ϖⁿ)/2`, odd residue characteristic | `e² = e`; image in `O × O` is `{x ≡ y mod 2ϖⁿ}`; `Ψ_e(A) ≅ O/ϖⁿ` | holds | none |
| 1.8b (1), (2), headline 2, third Lean theorem | `𝒜 = O`, `Rel = ϖⁿO`; `𝒜 = O × O`, `Rel = ϖ^aO × ϖ^bO`; `B = ∅`; `d_b = 0`; `Rel = 0` | `n = n`; `J_min = ϖ^{a+b}`, lengths `a`, `b`; `J = O`, `0 ≤ 0`; `det = 1`, `Sol = 0`; `J = 0`, `∞` | holds | none |
| 1.8b (1′), fourth Lean theorem, and its negative control | `O = ℤ_2`, `𝒜 = {a ≡ b ≡ c mod 2}`, `Rel = 𝒜(2,0,2) + 𝒜(0,2,2)` | generic `8X_1X_2(X_1+X_2)`, `J_min = 8O`, colength `3 = 1+1+1`; single arrays `8a_1b_2(a_3+b_3) ∈ 16O`, colength `4 > 3`; `gΣd_b = 3 > 2` | (1′) fails over `𝔽_2` exactly as stated; holds when `#k > gΣd_b` by a non-root of degree `≤ gΣd_b` | C03 |
| 1.8c (1), (2) | two-point case (a): `r_π = (D, I, I, I)`, `r_x = (D, (1+ϖ^m)I, I+ϖ^mE_12, I+ϖ^mE_21)` | `Y_s = ϖ^mO²` in the first column at `x`; both `Hom` are `(K/O)[ϖ^m]`; `y_{γγ′} = u_γy_{γ′} + y_γ`; bound `m ≤ 2m` | holds | none |
| 1.8c Check (b) | `r_x = χ_2 ⊕ χ′`, `χ_2 ≡ χ mod ϖ^m` | `Y_s = (0, ϖ^mOE_11)`; `Hom` through `ψ_χ` is `(K/O)[ϖ^m]`, through `ψ_{χ′}` is `0` (`E` acts by `1` and `0`) | holds | none |
| 1.8c (3), (4) | (E): rank of `E(x)`; (4): word `E_{ab} ⊗ c`, `a ≠ b` and `a = b` | rank `1` (each `ρ̄_b` once in `r̄_x`); nilpotent, trivial characteristic polynomial; `det(1 − τc)` in dimension `n` | hold | none |
| 1.8c (5) and its Check | `A = {a ≡ b mod ϖ²}`, `P = T² − (ϖ², 0)` | `X′ = {(π, ±ϖ), (x, 0)}`; `f = T` vanishes over `x`, `f(π, ϖ) = ϖ ∉ ϖ²O`; ideal over `A′` is `ϖO` | distinct roots needed, as stated | none |
| 1.8d (2), (3), (3′), headline 3 | `E = ϖ^ae`; two characters `χ′ ≡ 1 mod ϖ^a` | `y = (E−τ)E`, `Ey = δ_Ay`, `φ(y) = −δ_A(π)m`, so `δ_A(π)²m = 0`; `δ(u_γ−1)m = 0`; `H⁰ = (K/O)[ϖ^a]`, `v(δ) ≥ a` | hold; headline 3 is 1.8c (1), (3) with 1.8d (2), (3) | none |
| 1.8d Check 2 (`𝒱 = ∅`) | case (a) of 1.8c, `G` free profinite on four generators, `O = ℤ_p` | 1.8c(1): `m ≤ 2m`; 1.8d(2): `m ≤ length(ℚ_p/ℤ_p)⁴ = ∞` | the two bounds differ | R01 |
| 1.8d Check 1 | `G = G_F`, `O = ℤ_p`, `p` odd, unramified everywhere | `H¹_unr(G_F, ℚ_p/ℤ_p) = Hom(Cl_F, ℚ_p/ℤ_p)`, length `v_p(#Cl_F)` | holds | none |
| 1.8e (1), kernel counts | blocks `ρ_0`, `χ`, `χ_c`; `j_w = 0`; `κ = ϖκ₀` | `j_w(e′+v_δ) + h⁰_0 + Nv_δ`; `e′ + 3v_δ`; `h⁰_c + v_δ`; kernel of `ξ ↦ ξ·ϖκ₀` is `(K/O)[ϖ]` | as stated | none |
| 1.8e (1), dimension count | source and target of `(ξ, ζ, v) ↦ …` | source `j_w + 1 + n`; target at most `j_w + h⁰ + (n − h⁰) = j_w + n`; kernel nonzero | holds | none |
| 1.8e (2), the sum | kernels plus coboundaries against the stated constant; `Col = Row = ∅`, `v_δ = 0` | `Σ_w((1+j_w)e′ + (j_w+2)v_δ + h⁰_0 + Σ_ch⁰_c + (N+t)v_δ) + (N+t)v_δ ≤` stated; `Σ_b length H¹_𝒮` | holds | none |
| 1.8e (3a) | `f(g) = −a_gu_gE` | `ε(g)f(h) − f(gh) + f(g) = a_gu_g(u_h − 1)E`, using `a_{gh}u_{gh} = a_gu_gu_h + ε(g)a_hu_h` | holds | none |
| 1.8e (4) | `(p, ε(g), t) = (3, 4, 4)`; `(2, 5, 3)`; `p = 7`, `t = 3`, `ε̄(g) = 3`; `t = 1` | `1+1+2 = 4`; `2+3 = 5`; `1−5`, `1−4` units mod 7, `v_δ = 0`; `E′ = e_B`, `δ = 1` | holds | N03 |

- Source locators checked against the text: 5, in 2 sources. Hida §0 (lines 25–66), §3 (lines 858–931), §6 (line 1261); BC09 Sections 1.3–1.5 (contents lines 14–16, Definition 1.4.1 and Lemma 1.4.3 at lines 1198–1227, Theorem 1.5.5 at lines 1448–1470). The announcement was read (Announcement lines 5–53). [FormalProof] and [Ribet76] were not readable.
- Library declarations opened at the pins (17): Mathlib `Submodule.torsionBySet` (`Algebra/Module/Torsion/Basic.lean:182`), `Matrix.aeval_self_charpoly` (`LinearAlgebra/Matrix/Charpoly/Basic.lean:222`), `Polynomial.discr` (`RingTheory/Polynomial/Resultant/Basic.lean:934`), `Polynomial.SplittingField` (`FieldTheory/SplittingField/Construction.lean:213`), the `IsDomain (MvPolynomial σ R)` instance (`Algebra/MvPolynomial/Basic.lean:201`), `RingTheory/PolynomialLaw/Basic.lean` (no base change of laws); Tau Ceti `ContCohomology.Z1`, `H1`, `H1pi` (`LowDegree.lean:506, 829, 834`), `explicitH1AddEquivContinuousCohomology` (`CohomologyComparison.lean:145`), `ofDiscreteModuleRestrictScalarsIntEquiv` (`RestrictScalars.lean:656`), `SelmerStructure.selmerGroup` (`SelmerStructure.lean:97`), `ofDiscreteModule` (`SmoothDiscrete/Basic.lean:223`), `PolynomialLaw.IsMultiplicative` (`Multiplicative.lean:71`), `IsHomogeneousOfDegree` (`Homogeneous.lean:73`). No congruence module in either library.
- Cross-roadmap citations resolved (38 section references in 14 roadmaps): on main, PadicFamilies §§1.7, 1.8; IntegralHeckeAndGaloisDeterminants §§0.2, 0.5, 1.2, 1.3, 1.4, 6.1, 6.7 with the eight named items; IntegralIwasawaTheory §9.6; SelmerIwasawaCohomology §§2.1–2.9; ProfiniteCohomology Layer 1, §§1.4, 1.5, 2.1, 2.3, 3.2; ArithmeticGaloisDuality §§R02.1.2, R02.4.2, D7.4, D7.7.1; ArithmeticGaloisRepresentations §§1.7, 5.5; ClassFieldTheory §§6.1, 13.1; AInfCohomology §AI.1.3; SerreWeightAndLevelOptimisation §1.3; DiophantineApproximationAndTranscendence §3.7. At open heads, AutomorphicCongruences §0.7, SelmerLengthBoundsAndLocalLifting §§4.10b–4.10f, CongruenceModulesOfThetaLifts §§7.1, 7.6, 7.7a–7.7c, 7.10a, 7.10b. Each exists and says what is cited (N03 apart).
- Dependency check: `depcheck: 171 roadmaps, 1994 edges, 0 problem(s)`; no UPWARD or CYCLE line. SelmerLengthBoundsAndLocalLifting names this roadmap only as a consumer.
- Elaboration of `Suggested.lean`: four `sorry` warnings and nothing else. The four elaborated types were compared with the README statements; no binder is lost and the generality agrees (any discrete valuation ring, `ℕ∞` lengths).
- One-tactic probe (`simp`, `rfl`, `infer_instance`) on a copy: none of the four statements closes. No padding.
- Headline theorems: three in the Summary. The first two are stated (four declarations); the third is named in the module docstring as not statable, with the missing carriers.
- Automatic checks: all passed at this head; nothing changes outside the folder and the family index.

Overlap check: read CongruenceModulesOfThetaLifts, SelmerLengthBoundsAndLocalLifting, HeckeIdealsAndTaylorWilesRelations, UniformWildKernelBounds, WachLatticesOverTheCyclotomicTower, ReducibilityIdealsAndUltrafilterPatching (open) and PadicFamilies, IntegralHeckeAndGaloisDeterminants, EulerSystemsAndKolyvaginSystems (main); nothing shared. The congruence module of one augmentation is PadicFamilies §§1.7–1.8, cited; the instances for theta lifts are CongruenceModulesOfThetaLifts Layer 7, which cites 1.7a–1.8e; no other roadmap states a congruence module along an idempotent, the determinant lemma or the module with columns.

Source independence: 7 passages compared with 3 sources (Hida §0 and §3 against the Summary and the definition of 1.7a; BC09 Definition 1.4.1 and Lemma 1.4.3 against the route of 1.8c (3); BC09 Theorem 1.5.5 against 1.8c (2); the announcement against the References; the `Suggested.lean` docstrings against Hida §3), none shared; largest share [FormalProof], 5 of 10 sectional citations, whose text could not be read, so wording and contents were not compared with it; contents compared with BC09 Chapter 1 (Sections 1.3–1.6): independent.

Research link: 1.7a extends Hida's modules of congruences of Hecke algebras (Hida 1986, §§0, 3). 1.8c–1.8e give Ribet's construction of unramified extensions (Ribet 1976) a length form, with the generalized matrix algebras of Bellaïche–Chenevier (2009, Chapter 1). They feed CongruenceModulesOfThetaLifts in the family built on Alpöge's formal proof (2026). Rests on the README, Hida and BC09.

## Not verifiable

- [FormalProof]: the sources service has no licence class for its host, and the announcement points only to code archives; its support for 1.7a (4′), 1.8b (1′), 1.8c (1), (2), (5), 1.8d (2), (2′), (3′) and 1.8e, and every "form of the formal proof" sentence, is unchecked.
- [Ribet76] §§2–4: the sources service found no legal copy.

## Source issues

- none

## For the human reviewers

- Scope: the most-cited source, [FormalProof] (README References), is an unrefereed Lean formalization announced on 20 November 2026; the announcement says no written proof is presented (Announcement lines 45–49). The other sources are refereed (Hida 1986, Ribet 1976, Bellaïche–Chenevier 2009).
- Not tested: [FormalProof], the source with the largest share of the citations (5 of 10), could not be read; wording, arrangement and the Lean statements were not compared with it.
- Licence: the licence of the formal-proof repository was not read; whether the four `Suggested.lean` statements resemble declarations of that repository was not checked.
