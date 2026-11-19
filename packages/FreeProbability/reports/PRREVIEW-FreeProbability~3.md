# Review of FreeProbability (pull request #2575 at 87d99bf)

**Verdict:** accepted

**Summary.** Accepted: there are no findings. Every Check and every headline statement recomputed below holds, `Suggested.lean` elaborates with `sorry` as its only warning, no one-tactic probe closes a theorem, and the dependency check is clean. There are six small corrections and five format notes, none blocking; the main ones are a target of §2.2 that the pinned Tau Ceti already proves, a Speicher locator cited for more than the theorem states, and the integral form of the free Lévy–Khintchine theorem missing from the acceptance test. Two points are left for the human reviewers: Nica–Speicher, the source cited most, could not be read, and the licence of a linked external formalization was not checked.

## C01 — The cycle-count formulas that §2.2 asks to prove are already proved in the pinned Tau Ceti

The second bullet of §2.2 (README lines 260–263) asks an implementer for nothing, and a reader cannot tell that the library has it. `Finpartition.orbitCount_formPerm` (Tau Ceti `Order/Partition/FormPerm.lean:343`) states `TauCeti.orbitCount P.formPerm = #P.parts` for every `Finpartition`, which is `#cycles(p_π) = #blocks(π)`. The second formula, `#cycles(p_π⁻¹ γ) = #blocks(K(π))`, is that lemma rewritten along `TauCeti.NoncrossingPartition.formPerm_kreweras`; the pin's own proof of `orbitCount_formPerm_add_orbitCount_inv_mul_finRotate` (`Combinatorics/NoncrossingPartition/FormPerm.lean:193`) makes exactly these two rewrites.

The fix is to move the bullet into the opening paragraph of §2.2, which lists what is Tau Ceti's, citing `Finpartition.orbitCount_formPerm`, and to add that name to the *Needs:* line and to the Tau Ceti supplier contract. The geodesic characterization itself (the converse, for an arbitrary permutation) is not at the pin and stays a target.

## C02 — §8.6 cites Speicher's Theorem 7.5 for families with adjoints, but the theorem covers one matrix on each side and moments without adjoints

A reader who checks the separate-limits form of `tendsto_integral_trace_haar_conj_word` at this locator finds a narrower statement. Theorem 7.5 (Spe19 lines 3319–3324, p. 81) takes single matrices `A_N`, `B_N` converging in distribution to `a`, `b`.

The claim stands. The route uses the expansion at Spe19 line 3401, a sum over pairs `α, β` of `Wg(N, α⁻¹β)` times a power of `N` times `tr_α` of the A-letters and `tr_(β⁻¹γ)` of the B-letters. I checked the exponent: with `Wg ~ N^(−m−|α⁻¹β|)` it is `m − 1 − (|α| + |α⁻¹β| + |β⁻¹γ|) ≤ 0`, and the two trace factors involve each family alone, so the same expansion gives the statement for words in families and their adjoints. The fix, in §8.6 (README line 1450) and in the docstring of `tendsto_integral_trace_haar_conj_word` (`Suggested.lean` line 238), is to cite "Speicher, Theorem 7.5, for one matrix on each side, and its proof, pp. 83–84, applied to words in the families and their adjoints".

## C03 — The embedding theorem of §4.5 is stated for one base algebra, while Blanchard–Dykema, Theorem 1.3, allows `B ⊆ B̃`

The library statement loses the change of base that the source proves, which a consumer embedding products over different subalgebras needs. Theorem 1.3 (Blanchard–Dykema, arXiv math/9911012v2, lines 207–229, pp. 4–5) takes inclusions `B ⊆ B̃` and `A_ι ⊆ Ã_ι`, expectations `φ̃_ι : Ã_ι → B̃` with `φ̃_ι(A_ι) ⊆ B`, and faithful GNS representations of `φ̃_ι` and of its restriction; the induced map is unique and injective. README line 708 speaks of embeddings "into other systems with the same `B`". The fix is to state the target for `B ⊆ B̃` with `φ̃_ι(A_ι) ⊆ B`; the same-`B` case can stay as a Check.

## C04 — `forall_exists_isFreelyIndependentElements_law_sum_iff` states the first equivalence of the free Lévy–Khintchine headline; the integral form is statable and is neither stated nor named in the module docstring

The overview (README line 23) and §6.7 (line 1111) make `R_μ(z) = κ₁ + ∫ z/(1 − tz) dρ(t)`, for a finite compactly supported `ρ`, part of the theorem, and the acceptance test does not test it. In coefficients it reads `κ_(k+2)(a) = ∫ tᵏ dρ(t)` for every `k`, for a finite measure `ρ` on `ℝ` vanishing off a compact set; every carrier exists at the pins (`TauCeti.freeCumulant`, `MeasureTheory.Measure`, `IsFiniteMeasure`, `IsCompact`). The fix is either to add this as a further equivalent condition or a second theorem, or to say in the docstring that it is left to the README.

## C05 — The geodesic characterization of §2.2 is attributed to "(Biane)" with no theorem or page

A reader cannot locate the statement: README line 256 gives a name only, and the References entry (lines 1900–1901) gives the paper and no result. The fix is the number of the theorem or section of Biane (1997) that states it, or a locator in another text that does.

## C06 — The distribution model of §7.5 does not say where `a` lives

The sentence "a tracial R-diagonal star-distribution is realized in a C*-probability space as `uh`" (README lines 1251–1252) is read after §7.4, which defines R-diagonal elements in any star-probability space. At that generality it fails: for a Haar unitary `u` star-free from a selfadjoint `h` with the Gaussian moments of the first Check of §1.1 (an algebraic free product of two commutative star-algebras), `uh` is tracial and R-diagonal with `(uh)*(uh) = h²`, whose moments `(4n − 1)!!` outgrow every `R^(2n)`, so no bounded realization exists. The phrase "whose law is that of `|a|`" shows a C*-probability space is meant. The fix is to say so: "for an R-diagonal element `a` of a tracial C*-probability space, its star-distribution is realized …".

## N01 — Several targets cite a range of Nica–Speicher lectures, not a numbered result

Examples: "Lectures 1–7" in §§1.1, 1.2, 6.1 and 6.3, and "Lectures 16–18" in §§5.4–5.7, including the headline `sSeries_momentSeries_mul`. A theorem number would let a reader find each statement.

## N02 — The first Example of Layer 1 (lines 198–199) cites one lemma for two identities

`TauCeti.IsFreelyIndependent.apply_mul_mul_mul_of_ne` gives `φ(abab) = 0`; the identity `φ(a²b²) = φ(a²)φ(b²)` is `TauCeti.IsFreelyIndependent.apply_mul_of_ne`, as the docstring at Tau Ceti `Probability/FreeProbability/Independence.lean:265–266` says.

## N03 — The second Check of §5.3 (line 877) uses `F(w) = w/(1 − cw)` without defining `F`

It is `G(1/w)`; in §6.2 the same letter is the distribution function.

## N04 — The hypothesis `hs` of `tendsto_integral_trace_gueMatrix_word` is not used by its conclusion

No adjoint of `s i` occurs in the limit word, and the freeness hypothesis uses `Algebra.adjoin ℂ {s i}`. It is harmless and matches the README's "selfadjoint standard semicircular elements"; a clause in the docstring would say why it is kept.

## N05 — §8.7 (line 1467) says "limiting laws" without saying in which sense

The route is by moments (§8.6), so "whose normalized-trace moments converge to those of `μ`, `ν`" would match it; weak convergence alone does not give moment convergence without a norm bound.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 1.1 bounded realizations | Cauchy–Schwarz at m = 1, 2; semicircle at p = Xⁿ | exponents 1/2, 3/4 then 1/2, 1/4; ratio 2(2n+1)/(n+2): 1, 2, … → 4, so R² ≥ 4v | holds |
| 2.1 plane trees | n = 3, depth-first against breadth-first | depth-first {1,3}{2} and {1,2}{3}; breadth-first {1,2}{3} twice; pairings ↔ 0 or 2 children | holds; KM15 lines 432–439 |
| 2.2 geodesic characterization | (1 3), (1 3)(2 4), (1 2 3), (1 3 2) in S₄ | σ⁻¹γ = (1 2)(3 4), (1 4 3 2), (3 4), (1 3 4 2); totals 5, 3, 5, 3 | holds; no locator (C05); second bullet at the pin (C01) |
| 2.3 Möbius on intervals | {1,2}{3}{4}, {1,3}{2}{4}, 0₄ | complements {1}{2,3,4} → 2, {1,2}{3,4} → 1; second interval has 4 elements; −5 against −6 | holds |
| 2.4 κ₃, κ₄ | coefficient sum; repeated arguments; semicircle, Gaussian | 1−4−2+8+2−5 = 0; 10 = 8+2; m₄ terms 1+4+2+6+1 = 14; free κ₄ 0, 1 | holds |
| 3.3 pointed Hilbert spaces | H_i = ℂξ_i | H_i° = 0, H = ℂΩ, λ_i a character with kernel ker π_i | holds; Voiculescu–Dykema–Nica not readable |
| 3.5 Dykema, README and Lean | M₂ with x₁₁; pulled-back trace on C*(F₂); empty and one-element index | φ(e₂₂) = 0 with faithful GNS; kernel of C*(F₂) → C*_r(F₂) killed; restrictions get faithful GNS from H ≅ H_i ⊗ H(i) | holds; Dyk97 lines 17–29, 43–48 |
| 3.5 traciality, Lean | ℤ/2 ∗ ℤ/2 | free product of traces is a trace on the generated algebra; continuity extends it | holds |
| 3.6 Kesten norm | h = 2; ℤ² | 2h · √(2h−1)/h = 2√3 ≈ 3.46 < 4; ℤ² gives 4 | holds; Kes59 lines 423–432 |
| 3.8 full Fock space | H = 0; H = ℂ | Λ(T) = 0 = T; S*S = 1, SS* = 1 − P_Ω, vacuum values 1 and 0 | holds; Nica–Speicher not readable |
| 4.1 conditional expectations | x ↦ (x₁₁+x₁₂)1; transpose on M₂ | value 1 − 2 = −1 on a rank-one positive matrix; (e₁₁e₁₂)ᵀ = e₂₁, e₁₁e₁₂ᵀ = 0 | holds |
| 4.4 amalgamated product | B = ℂ | module is H of §3.3; expectation is the vacuum state | holds; Abadie–Dykema lines 265–315 |
| 4.5 embeddings, UCP maps, faithfulness | ℂ⊕ℂ ↪ M₂ with x₁₁; one factor | source kills (0,1), target keeps e₂₂; one-factor product ℂ | holds; narrower than Blanchard–Dykema 1.3 (C03); Theorem 2.2 lines 375–387; Catterall lines 1040–1045 |
| 4.6 tracial amalgamated | B = ℂ; B = M_i = M | §3.7; M | holds; Blanchard–Dykema lines 562–581, 638–647; VonNeumannAlgebras Layer 11 states the expectations |
| 5.1, 5.2 convolution, bounds | β = (δ₋₁+δ₁)/2 | β⊞β: m₄ = −2 + 8 = 6 against 8; R_β = (√(1+4w²)−1)/(2w), radius 1/2; 4ⁿ·4ⁿ·rⁿ | holds |
| 5.3 analytic transforms | semicircle; δ_c | K = 1/w + vw; G(1/w) = w/(1−cw), K = 1/w + c | holds; `F` undefined (N03) |
| 5.4 noncommutative series | e₁₂, e₂₁ in M₂ with x₁₁ | κ₂(a,b) = 1, κ₂(b,a) = 0 | holds |
| 5.5 boxed convolution | zeta ⊠ zeta; zeta ⊠ Möbius, degree 2 | Catalan 1, 2, 5, 14; −1 + 1 = 0 | holds |
| 5.6 S-transform, Lean | constant c; free Poisson λ; mean of ab | Ψ⁻¹ = w/(c(1+w)), S = 1/c; S = 1/(λ+w); φ(ab) = φ(a)φ(b) ≠ 0 | holds |
| 5.7 multiplicative convolution | two free Poisson laws of rate 1 | 2 + 2 − 1 = 3 against 4 | holds |
| 6.2 Gaussian algebras | F at v = 1 | F(0) = 1/2; F(1) = 1/2 + 0.138 + 0.167 = 0.804 | holds |
| 6.3 semicircular systems | C all ones; rotation | s₁ = s₂ not free; κ₂(s₁+s₂, s₁−s₂) = 1 − 1 = 0 | holds |
| 6.4 law of large numbers | semicircular a_j | κ_n(Ā_N) = N^(1−n) κ_n; variance 1/N, fourth moment 2/N² against 3/N² | holds |
| 6.5 free Poisson | λ = 1/4, 2, 1; Tau Ceti's `marchenkoPastur` | mean (b−a)²/16 = λ; 2, 6, 22, 90 against 94; dilation of MP(1/λ) has density √(4λ−(t−1−λ)²)/(2πt), atom 1−λ | holds; `MarchenkoPastur/Basic.lean:62` |
| 6.6 compound free Poisson | ν = δ₁, δ₀ | R = λ/(1−z); R = 0 | holds; Spe19 lines 4599–4606, 4636–4640 |
| 6.7 Lévy–Khintchine, README and Lean | β; semicircle; free Poisson; δ_c; r = 0 | Hankel rows (1,0), (0,−1) not PSD; ρ = σ²δ₀, λδ₁, 0; index shift κ_(i+j+2) from 0 | holds; integral form absent from Lean (C04) |
| 7.1 compression, Lean | n = 0, 1, 2 | 1 = t⁰·1; t⁻¹·tφ(a); φ(papbp) = tφ(a)φ(b) + t²κ₂, corner κ₂ = tκ₂; no trace used | holds |
| 7.2 matrix units | n = 1, 2; d = 1 | δ_ij φ(a); corner κ₂ = δ_jk δ_il κ₂(a,b)/d, the cyclic condition with d⁻¹ | holds; Nica–Speicher 14.18 not readable |
| 7.3, 7.4 circular, Haar, R-diagonal | c; u; n = 2 | κ₂(c,c) = (1−1)/2 = 0; κ₄(u,u*,u,u*) = 1−1−1; κ₂(uu*,uu*) = −1+1 = 0 | holds |
| 7.5 polar models | Gaussian-moment h with Haar u | (uh)*(uh) = h², moments (4n−1)!! exceed every R^(2n) | hypothesis implicit (C06) |
| 8.3 genus expansion | G⁴, G⁶; Ginibre | 2 + N⁻²; 5 + 10N⁻²; 2 and 1 + N⁻² | holds |
| 8.4 GUE, Lean | GDGD, G²D; D = diag(log N, 0, …); word without G | (tr D)², tr D exactly; (log N)ᵏ/N → 0; constant integrand converges by `hD`; entry variances 1/N | holds; `hs` unused (N04) |
| 8.5 Weingarten, Lean | k = 0, 1, 2, 3 | 1−1 = 0; N·N⁻¹−1 = 0; N³Wg((12))+1 = −1/(N²−1); N⁵Wg((123)) → 2; 2/(N(N+1)) | holds; CS04 lines 296–297, 322 |
| 8.6 Haar conjugation, Lean | UAU*B; exponent count | tr A · tr B; exponent m−1−(|α|+|α⁻¹β|+|β⁻¹γ|) ≤ 0 with separate traces | holds; locator scope (C02); Col02 lines 715–724 |
| 8.7 expected spectral measures | projections of rank N/2 | ½ + 2·¼ + ½ = 3/2 = 1 + 2·¼ | holds; Spe19 lines 3330–3336; "limiting laws" (N05) |
| 1.2 and 4.7 | ℤ ∗_(2ℤ) ℤ | ab⁻¹ ≠ 1 gives trace 0 though a²b⁻² = 1 | holds; HR16 lines 575–577 |

- **Earlier remarks.** The previous review had no findings. This head is the head it read, so its four small corrections and two format notes are not repaired; they are C02–C05, N01 and N02 above. C01, C06 and N03–N05 are new.
- **Source locators checked against the text:** 24 in 10 sources: Dyk97 (Theorem 1.1, p. 1), HR16 (Proposition 2.22), Kes59 (Theorem 3), KM15 (§2.1, Proposition 4), Spe19 (Theorem 7.5, its proof, the example after it, Assignment 8 Exercise 3, Assignment 9 Exercise 3), Col02 (Theorem 3.1, Propositions 3.2–3.3, Corollary 3.4), CS04 (Proposition 2.2, Corollary 2.4, Proposition 2.6, Corollary 2.7), Blanchard–Dykema (Theorems 1.3, 2.2, Construction 3.1, Lemmas 3.3–3.6), Abadie–Dykema (§4), Catterall (Theorem 2.2.2).
- **Library declarations opened at the pins:** Tau Ceti `IsFreelyIndependent` (`Probability/FreeProbability/Independence.lean:93`), `apply_mul_mul_mul_of_ne` (same file, 269), `IsFreelyIndependentElements` (`Variables.lean:43`), `freeCumulant` (`Cumulant/Basic.lean:166`, a function-valued first argument, `κ_∅ = 1`), `momentSeries` (`Cumulant/Series.lean:85`), `IsSemicircular` (`Semicircular/Basic.lean:70`), `norm_freeCumulant_const_le` (`Cumulant/Bounds.lean:38`), `orbitCount` (`GroupTheory/Perm/OrbitCount/Basic.lean:100`), `formPerm_kreweras` and the geodesic count (`Combinatorics/NoncrossingPartition/FormPerm.lean:180, 188`), `Finpartition.orbitCount_formPerm` (`Order/Partition/FormPerm.lean:343`), the involution criterion (`Combinatorics/ChordDiagram.lean:302, 382`), `marchenkoPastur` (`MarchenkoPastur/Basic.lean:62`); Mathlib `PowerSeries.substInvOfIsUnit` (`RingTheory/PowerSeries/Substitution.lean:567`). All 150-odd library names in code font resolve by their last component at the pins. The pins have no Weingarten function, Fock space, free Poisson law, boxed convolution, R-diagonal elements, plane-tree bijection, or geodesic converse for general permutations.
- **Cross-roadmap citations resolved on main:** RandomMatrices §§3.1, 3.4, 5.1 (its `gaussianEnsemble` at β = 2 has the entries of `gueMatrix`), 6.2–6.5; VonNeumannAlgebras Layers 0, 1, 2, 4, 6, 8 (V8.SubgroupCosets), 10, 11 (Takesaki's theorem specialized to traces) and §13.1 (`tomiyama`); HilbertModules H1–H3; OperatorKTheory §§4.3, 7.3, 7.6; OperatorAlgebraDynamics D1, D2, D2.FreeGroups, D6; StandardDistributions §5.3; IntegralHeckeAndGaloisDeterminants §0.2 (`cycleProduct`, `cycleTerm`); SelfAdjointSpectralTheory SA-B05, B31, B35; NoncommutativeIntegration §4.3; CStarAlgebras Layers 1–5; the consumers FactorRigidity, Subfactors, CategoricalOperatorAlgebras, QuantumGroups, TemperleyLieb. All suppliers are on main.
- **Automatic checks:** every check passed. The dependency check printed `depcheck: 200 roadmaps, 2200 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The pull request changes nothing outside the folder.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives eight `sorry` warnings and nothing else. The elaborated types of all 12 declarations were compared with the README; the file has no section variables and nothing changed. One-tactic probe: `rfl`, `simp`, `intros; simp_all`, `infer_instance` and `decide` close none of the eight theorems (on the compression theorem `rfl` times out and the rest fail). The four definitions are used by the statements. No padding. Pull request text: the description's counts hold at the head (ten Conventions, 49 sections, 80 Checks in 48 sections, nine Tau Ceti imports, eight theorems, three new definitions); it says the roadmap is rewritten, lists the removed declarations and the changed statements. Nothing to correct.

Overlap check: read RandomMatrices, AmenableTracesOnCStarAlgebras, OperatorAlgebraDynamics, OperatorKTheory and Subfactors. RandomMatrices §§6.2–6.5 owns the bounded scalar core (reduced-word free product with positive state, ⊞ and ⊠ with analytic transforms, the jump-one free Poisson limit, the Weingarten formula); it is cited here and its own scope says this roadmap extends Layer 6. This roadmap owns the F₂ norm obstruction with its shift and radial bounds; OperatorKTheory and OperatorAlgebraDynamics say the same. OperatorAlgebraDynamics D8 owns the symmetric and antisymmetric Fock carriers, this roadmap the full Fock space; both build on the tensor products of VonNeumannAlgebras Layer 2. Subfactors only consumes; AmenableTracesOnCStarAlgebras shares nothing. Searches of main and the open heads for the Weingarten function, R-diagonal elements, boxed convolution, the free Gaussian functor, plane trees, reduced and amalgamated free products, the S-transform and free Poisson laws found no other owner.

Source independence: 17 passages compared with 10 sources (Dyk97, HR16, Kes59, KM15, Spe19, Col02, CS04, Blanchard–Dykema, Abadie–Dykema, Catterall), none shared beyond formulas and standard names; largest share Nica–Speicher, 35 of about 94 citations, text not readable; contents compared with its public table of contents: independent (Layers 3 and 4 have no run of lectures; Layer 5 takes Lectures 12, 14 and 16–18 before Layer 6 takes 8 and 12–13 and Layer 7 takes 14–15).

Research link: Layers 3–4 build the reduced and amalgamated free products of Voiculescu and of Blanchard–Dykema (1999), with Dykema's faithfulness theorem (1997), which FactorRigidity and Subfactors consume; Layer 8 states asymptotic freeness without norm bounds (Collins 2002) and the Weingarten asymptotics (Collins–Śniady 2004). Rests on the sources read and the README's References.

## Not verifiable

- Nica–Speicher, *Lectures on the Combinatorics of Free Probability* (Cambridge University Press, 2006): no legal copy; the publisher's page gives the contents only. Unverified: the sampled locators of §§3.8, 5.3–5.7, 6.3, 6.4 and 7.2, and those of §§1.1, 1.2, 2.3–2.5, 6.5, 6.7, 7.1, 7.3–7.5, 8.3, 8.4 and the Nica–Speicher parts of §8.6.
- Voiculescu–Dykema–Nica, *Free Random Variables* (AMS, 1992): no legal copy. Unverified: the sampled locators of §§3.3 and 4.1, the Voiculescu–Dykema–Nica part of §4.4, and §§3.1, 3.2, 3.4, 3.7, 3.9, 4.2, 6.2.
- Biane, *Some properties of crossings and partitions* (Discrete Math. 175, 1997): resolves only to a paywalled page; §2.2 gives no locator in any case (C05).

Automatic checks set aside as false positives: the overlap listing reports the former sections F3 and F4, which FactorRigidity cites, as dropped; the sentence that opens "How to read the build" maps every former section Fk to Layer k with a variable k, which the listing does not read.

## Source issues

- none

## For the human reviewers

- Not tested: Nica–Speicher, the source cited most (35 of about 94 citations in `TauCetiRoadmap/FreeProbability/README.md`), has no legal copy. Wording was not compared with it; arrangement was compared with its public table of contents only.
- Licence: Scope and ownership (README lines 1640–1646) links an external Lean project (SemicircleLaw on GitHub) and a Zulip thread as related formalizations. `Suggested.lean` was not compared with that repository and its licence was not read.
