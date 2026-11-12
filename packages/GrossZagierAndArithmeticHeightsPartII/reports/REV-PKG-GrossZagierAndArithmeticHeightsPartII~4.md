<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13085#issuecomment-6785736773 -->
Review (codex) of 868afb6

Verdict: needs_changes

1. **F01** (P1) The proposed Petersson metric is identically zero

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:1512, repeated at line 1527: “‖w‖² = −[w, w]/(4πe^γ)”, with the bracket explicitly complex bilinear.

   **Claim:** This defines a Hermitian metric on the tautological line and makes the logarithmic Borcherds relation meaningful.

   **Witness:** On Q(x,y)=−x²−y², B=diag(−2,−2), w=(1,i): B(w,w)=0 but B(w,w̄)=−4. The written norm is 0; the required norm is 1/(πe^γ)>0.

   The orthogonal realization of a negative plane is an isotropic complex line; this is precisely its domain, not an extraneous test vector. BHKRY line 4773 (metric, printed p. 102), read with its domain, and YZZ09 line 60 distinguish the two pairings. The same distinction is explicit in open pull request #1695, TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:650 and its negative-plane Check.

   **Exact repair:** Replace both occurrences by B(w,w̄), state w≠0, B(w,w)=0 and B(w,w̄)<0, and retain the factor 4πe^γ. Add the computed negative-plane Check. The repaired norm gives 1/(πe^γ) on this vector, remains positive, and scales by |a|² under w↦aw. Recheck the constant metric shift in §§12.5–12.9 using that metric.

2. **F02** (P1) Differentiated orbital integrals are not generally orbit invariant

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:1186: “The transfer factor makes ∂Orb depend only on the orbit of γ.” The sign-only Check at line 1193 has the same missing restriction.

   **Claim:** The derivative defined for arbitrary regular semisimple γ and test function f′ descends to conjugacy orbits.

   **Witness:** F₀=ℚ₃, n=2, γ=((0,1),(1,0)), a=diag(3,1), f′=1_integral. The normalized families for γ and a⁻¹γa are 1 and 3^s; their derivatives are 0 and log 3.

   For γ, integrality of h⁻¹γh, h=diag(t,1), forces v(t)=0. For a⁻¹γa it forces v(t)=−1; the raw integral is −3^s and its transfer factor is −1. Both matrices are regular semisimple and conjugate. In general, writing O^ω(γ,s)=ω(γ)Orb(γ,f′,s), change of variables gives

       O^ω(a⁻¹γa,s) = |det a|^(−s) O^ω(γ,s),
       D(a⁻¹γa) = D(γ) − log|det a| O^ω(γ,0).

   This follows directly from Z lines 546–581, equations (2.12)–(2.17).

   **Exact repair:** State this transformation law. Assert derivative invariance only when the zero-order orbital integral vanishes, and explicitly obtain that vanishing for the nonsplit matching AFL unit function from the declared fundamental-lemma input. Qualify the sign Check likewise. On the counterexample the repaired formula gives 0−log(1/3)·1=log 3; when O^ω(γ,0)=0 it gives genuine invariance.

3. **F03** (P2) The AFL transfer character has not been normalized

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:1181: “η̃ a fixed extension of η to F^×”; line 1188 asserts invariance under γ↦ξγ for every ξ∈F¹.

   **Claim:** Any extension gives the stated unit-function AFL and scalar invariance.

   **Witness:** Over unramified F/ℚ₃, take η̃=η̃₀χ, where η̃₀(x)=(−1)^v_F(x) and χ is the order-four residue character trivial on 𝔽₃×. A norm-one Teichmüller unit ξ has χ(ξ)=−1.

   For n=2 the transfer-factor argument scales by ξ⁻¹, so ω(ξγ)=−ω(γ). For γ=((−2,1),(−3,2)), γ²=1 and the raw unit orbital integral is 1−3^s: v(t)=0 and −1 are its two integral shells. With η̃₀, ω(γ)=1, D=−log 3 and the matching intersection length is 1, since v(1−2²)=1. Multiplication by ξ preserves the raw integral and the geometric fixed intersection but reverses D with the allowed alternative extension. Z lines 574–576 expressly choose the natural unramified extension.

   **Exact repair:** Require η̃(x)=(−1)^v_F(x) throughout the unramified AFL conventions and the jr-afl-local-inputs contract, including the matching plan gap text. Then η̃(ξ)=1 for norm-one units, and both γ and ξγ have D=−log 3=−Int·log 3. Add this unit-scaling Check; a bare choice of an extension is insufficient.

4. **F04** (P1) General totally real Chow modularity still uses an unowned theorem

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:1552 and 1560: “over a general totally real F₀, and for n = 2, it is Liu's deduction from the orthogonal Gross–Kohnen–Zagier theorem”.

   **Claim:** The listed prerequisites supply the general Chow-valued modularity proof.

   **Witness:** Liu11a lines 1321–1323 explicitly pull back the orthogonal series and invoke YZZ09 Theorems 1.2/1.3. None of §12.7's named prerequisites states that orthogonal modularity theorem over a general totally real field.

   For [F₀:ℚ]=2 and n=3, the orthogonal space has signature (4,2) at one place and (6,0) at the other, and the required weight is 4/2+1=3. §12.5 has F₀=ℚ as an explicit hypothesis, so it supplies no theorem on this instance. The n=2 case similarly requires weight 2 while §12.5 requires n≥3. MetaplecticAutomorphicForms §§4.5 and 5.1 supply automorphic/Weil machinery, not Chow-valued orthogonal modularity. Searching the available main, package and open-head texts found no owner for this general theorem. The orthogonal rational-field constructions in #1695, TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:650 and 668, do not supply it either.

   **Exact repair:** Assign the missing theorem and pullback comparison to explicit targets here, or declare a precise gap with an eligible earlier supplier. State the quadratic space, signatures at every real place, finite level, Schwartz invariance, divisor classes including the Hodge constant term, parallel weight n, and compatibility with the unitary embedding. Cite YZZ09 Theorem 1.3, printed p. 1150, and Liu11a Lemma 3.6, pp. 876–877. Do not remove the general totally real or n=2 statement. The repaired dependency must cover the degree-two, signature-(4,2), weight-three instance above. Also give the direct ES Theorems 3.6/4.13 locator for the correction-series route and add these works to References. The service's new YZZ09 entry needs its bibliographic authors, title and year filled in; its existing key and fetched record must be retained.

   This is the unfinished portion of previous F05, not a settled “not actionable” finding.

5. **F05** (P2) Arbitrary Schwartz input does not descend at fixed level

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:1492, especially “For every m ∈ ℚ_(>0) and φ ∈ S_L”; the unrestricted f is used again in §12.5.

   **Claim:** The lift and its divisor are functions/cycles on the fixed M of §§10.1 and 12.2 for arbitrary S_L-valued input.

   **Witness:** BHKRY lines 4690–4711 use θ(z,gk,φ)=θ(z,g,kφ), then require K-invariance of the input to descend. Arbitrary φ∈S_L is not K-invariant; §10.1 explicitly requires that invariance.

   A concrete control is V=ℚ(i)³ with h=diag(1,1,−1), a level hyperspecial at 5 and neat at another prime, and k₅ interchanging e₁,e₂. At 5 let φ be the indicator of the two cosets ±e₁ modulo 5O_F³, with standard integral factors elsewhere; a sufficiently small L puts this even φ in S_L. Then φ(e₁)=1, φ(e₂)=0. At the negative line z=(0,1,2), the norm-one vectors perpendicular to z are the unit multiples of e₁. For the principal part at m=1 the logarithmic multiplicities at representatives (z,1) and (z,k) are respectively 2 and 0, although they represent the same point of M. There is no descended Green function.

   **Exact repair:** For fixed M_K use a K-stable lattice and S_L^K-valued f and φ. Preserve arbitrary Schwartz inputs by explicitly passing to K′ contained in their stabilizers and proving level-pullback compatibility; make that target's source and target explicit. The swapped input above belongs on the smaller level, where (z,1) and (z,k) need not be identified. At level K its invariant average gives equal multiplicities at both representatives. Propagate this condition through §§12.5–12.7.

6. **F06** (P2) The new low-rank theorem unnecessarily loses general base fields

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:1248: “F₀ = ℚ_p”; line 1875 excludes proofs over other p-adic fields without a low-rank exception.

   **Claim:** The low-rank input is planned only over ℚ_p, although its cited theorem and the imported relative formal modules allow general finite extensions.

   **Witness:** Zha12 lines 354–368 set F₀ to any finite extension of ℚ_p; Theorems 2.10 and 5.5 occur at lines 578 and 2181. The general-field geometric comparison is discussed at lines 1968–1971.

   This is a route-specific restriction of a source theorem, contrary to the general-library requirement. For example take F₀/ℚ₃ unramified quadratic, q=9, n=2 and γ=((−4,1),(−15,4)). Its square is 1, v(1−4²)=1, Int=1 and the normalized unit derivative is −log 9. All local prerequisites apply, but the proposed theorem excludes it.

   **Exact repair:** State §9.8 for every finite extension F₀/ℚ_p, p odd, using q=#k_F₀ and −log q. Keep ℚ_p as the specialization consumed by §14.5. Record the low-rank exception in the scope paragraph and §14.6's exclusion. The example then gives −log 9=−2 log 3 on both sides. In ranks at most three q≥3≥n, so the stated group-to-semi-Lie reduction still applies.

7. **F07** (P3) The self-Tor Check forgets the empty divisor

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:218: “Tor₁(O_(Z(x)), O_(Z(x))) = O_(Z(x))(−Z(x)) ≠ 0.”

   **Claim:** Every nonzero dependent label gives nonzero self-Tor.

   **Witness:** In V₁ take val h(x,x)=−1. §§0.2 and 0.9 give Z(x)=∅, hence O_Z=0 and Tor₁(0,0)=0. The displayed equality is right; its final inequality is false.

   **Exact repair:** Require Z(x)≠∅ for the inequality, and retain the empty case as a negative control. At val=1, Z(x)=Spec O_F̆/ϖ and Tor₁ is its nonzero structure sheaf; at val=−1 both sides are zero. This is the empty/nonempty pattern from previous F03 appearing elsewhere.

8. **F08** (P3) A Check confuses regular with strongly regular

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:1601: “If (δ,u) is not strongly regular, Int_v(δ,u) is not defined by §9.2”.

   **Claim:** Strong regularity is necessary for the local intersection number to be defined.

   **Witness:** §9.2, line 1162, defines Int on all regular semisimple pairs. With J=((0,0,1),(0,1,0),(1,0,0)), g=((1,1,−1/2),(0,1,−1),(0,0,1)) and u=e₁+e₃, det(u,gu,g²u)=−1 but g is unipotent nonsemisimple.

   Use h=3J over the unramified quadratic extension of ℚ₃; det(h)=−27 has odd valuation, so it is the nonsplit rank-three space. Direct multiplication gives gᵗhg=h and h(u,u)=6. The pair is cyclic and regular semisimple for the relative action, but not strongly regular. Its local Int is defined. The irreducible-characteristic-polynomial restriction on the global summands remains a separate, valid assertion.

   **Exact repair:** Replace “not strongly regular” in the first clause by “not regular semisimple”. Keep the stronger global restriction separately. Add the cyclic unipotent control: local domain membership is true, strong regularity false, and the global irreducible-α condition false.

9. **F09** (P3) Toroidal properness is cited at the wrong target

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:102: “Consume §7.3 (the smooth proper integral toroidal compactification …)”; also §12.5's Needs at line 1529.

   **Claim:** ShimuraCompactifications §7.3 supplies properness.

   **Witness:** Open pull request #1053, TauCetiRoadmap/ShimuraCompactifications/README.md:2294 supplies smoothness/separatedness. Properness is §7.5, line 2344, and requires a complete cone decomposition Σ.

   **Exact repair:** Cite §§7.3 and 7.5 and explicitly choose complete Σ when using properness, including in the layer dependency list. An incomplete fan need not compactify the open variety: for the rank-one toric chart the zero fan gives G_m, while the complete two-ray fan gives P¹. The repaired complete-fan hypothesis selects the proper model.

10. **F10** (P3) The sampled special-Hom page range misses its definition

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:142: “LZ §§1.7–1.8 and 2.1–2.2, pp. 7–10”.

   **Claim:** That range includes the special Hom space and its Rosati pairing.

   **Witness:** LZ lines 411–426, §2.2, are on printed p. 11, outside pp. 7–10. The section locator is correct.

   **Exact repair:** Extend the page range through p. 11, or cite pp. 10–11 specifically for §§2.1–2.2 and keep the convention pages separately. The corrected locator contains the formula used in the a versus ā scalar Check.

Ten findings: three P1, three P2 and four P3. The mathematical files were not edited. The sources service added ES and YZZ09; it preserved the nineteen existing entries. The dependency check and pinned Lean elaboration pass. Those checks do not establish the mathematical assertions below.

## Verified sound

### Previous findings, checked first

The previous review had seven findings. The repair report marked none “not actionable in this package”. The quotations below are from the repaired README.

| Previous finding | Repaired passage and location | Status and computed check |
|---|---|---|
| F01, Schwartz reference lattice | §3.1: “L is not the Schwartz lattice”; the definition uses Λ=⟨1⟩_n. | Repaired. Rank-one determinant valuations are 1 and 0. For q=3, W′=(8/3)log 3. §§4.6 and 13.5 keep log(q²)=2 log q. |
| F02, integral versus rational labels | §10.1: “x_i ∈ Hom_(O_F)(A₀, A) ⊗ ℚ”; semi-global labels use Hom⊗ℤ_(p). | Repaired. x/3 has norm 1/9; allowed at p≠3 and excluded by the nonsplit p=3 integral condition. The localized model permits precisely denominators at d. |
| F03, nonempty cycles | §5.1 asserts nonemptiness with integral norm; §0.7: “L = O_F·ϖ⁻¹e has norm ϖ⁻², so Z(L) = ∅”. | Repaired there. The exotic example has norm −u⁻² of valuation −1 and zero components; norm 1 meets both. The same pattern remains in §0.5's Check: R07. |
| F04, incidence rank zero | §7.2: “m = 0 is excluded, not reinterpreted”. | Repaired. m=0 would require dimension −1; m=1 has U′=0 and Y=S=P¹; m=2 has P¹ fibres over rational Lagrangians. |
| F05, Green and modularity prerequisites | Scope now owns “the automorphic Green functions … and the unitary Borcherds products”; new §§12.4–12.5 state them. | Partly repaired. The new construction has R01/R05, and the general totally real branch still has R04. New §9.8 correctly removes the need to use arithmetic curve modularity in the rank-three induction base, subject to R06. |
| F06, scheme cohomology supplier | §2.2: “the scheme localization sequence of EtaleCohomologyFoundations §§0.7–0.8 and F.2.5”. | Repaired. For A¹⊂P¹, compact cohomology dimensions are (0,0,1), with top Frobenius Q, not analytic-adic cohomology. |
| F07, AFL index shift | §14.5: “The semi-Lie statement in dimension one is the n = 2 instance”. | Repaired. n=1 gives m=0; n=2 gives m=1, Int=1,2 and ∂Orb/log p=−1,−2. |

All 105 numbered targets and their Needs lines were read. The prior round's unchanged computed rows were used only where they recorded values; changed targets, new targets and passages previously covered only by prose were checked afresh. The compact table below records the requested sample, all eight headlines, and every finding's mathematical instance. These finite tests screen statements and conventions; they are not proofs of the deep theorems.

### Seeded source sample

| Target | Text opened at its locator | Result |
|---|---|---|
| 0.1 Special Hom convention comparison | LZ lines 320–452, §§1.7–2.2, pp. 7–11 | Pairing/conjugate-first transport agrees; page correction R10. |
| 0.5 Cartier, difference and Tor independence | LZ lines 497–541, Lemma 2.8.1, pp. 13–14; Ter13a lines 1345–1362, Lemma 3.1, pp. 21–22; Ter13b lines 62–69, Theorem 1, p. 2 | Source hypotheses and general-base extension route are distinguished. Dependent self-Tor Check fails at empty support: R07. |
| 3.3 Unramified horizontal identity | LZ lines 1385–1394, Theorem 6.1.3, p. 34 | Nondegenerate hyperplane, off-hyperplane label and horizontal overlattice range agree. |
| 7.2 Symplectic incidence resolution | K lines 654–697, §3.1, pp. 16–17 | m≥1 repair correct; m=1 is smooth P¹, so the source's singular-point wording needs that exception. |
| 7.6 Modified Krämer classes | K lines 1140–1217, Lemma 4.4, Definitions 4.5/4.7 and Lemmas 4.8–4.9, pp. 28–30 | Unimodular correction is 0 in odd ambient rank and 1 in even rank; nonunimodular correction is 1. |
| 8.4 Analytic partial integral | K lines 3445–3453 and §8 proof, Theorem 8.2, pp. 64–72 | Source's negative-cone vanishing is false; roadmap's explicit counterexample and retained constancy clause are consistent. |
| 8.7 Krämer identity | K lines 3934–4004, Lemma 9.6/Theorem 9.7, pp. 74–76; Theorem 1.3, p. 4 | Headline matches. The failed hyperbolic valuation reduction is isolated as an owned target §8.6 rather than assumed. |
| 9.2 Derived fixed locus | Z lines 735–778, §3.1, pp. 13–14 | Derived diagonal formula, projection formula and regular-semisimple domain agree. R08 is in a later Check. |
| 9.3 Orbital normalization | Z lines 508–594, §2.3, pp. 9–10 | Formula read, including natural unramified η̃. R02/R03. |
| 9.5 Rank/norm reduction | Z lines 1298–1334, Proposition 4.12, p. 23 | q≥n+1 scalar count, q=n boundary and norm-unit direction are distinguished. The boundary is a separate proof target. |
| 9.8 Low-rank input | Zha12 lines 354–368, 530–589, 1968–1971, 2178–2189; §2.2 p. 210, Theorem 2.10 p. 211, Theorem 5.5 p. 250 | Rank and artinian hypotheses checked; general-base restriction R06. |
| 11.5 Formal Hecke/CM uniformization | Z lines 2080–2163, §§7.7–7.8, Propositions 7.16–7.17, pp. 37–39 | Characteristic-polynomial component and derived local classes retained. |
| 12.2 Complex uniformization/fixed line | Z lines 2245–2259 and 2579–2600, §8.2 p. 40 and §10.2 p. 47 | Irreducible CM polynomial, negative eigenspace and cyclic-vector hypotheses retained. |
| 12.5 Borcherds/modularity | BHKRY lines 3453–3543, Theorems 5.3.1/5.3.3, pp. 76–78; lines 4615–4848, §7.2–7.3, pp. 99–104; Bor98 lines 2589–2627, Theorem 13.3, p. 48; Bor99 lines 266–289, Theorem 3.1, p. 5 | Integral principal part, positive multiple, constant coefficient and vertical terms read. R01/R05/R09 concern the stated extension and conventions. |
| 13.8 Unramified arithmetic Siegel–Weil | LZ lines 3837–3873, Theorem 15.5.1, p. 89; derivative definition near line 3467 | Everywhere-unramified CM hypothesis, split dyadic condition, two split nonsingular tests and reflex normalization retained. |

There are no author-marked unverified locators. Lusztig76 is the one settled uncertified entry. The ES and YZZ09 texts used by the changed modularity route were obtained legally through the sources service: ES lines 1625–1634 and 2105–2106 state its two comparison theorems; YZZ09 lines 49–68 and 169–175 state the general totally real orthogonal setup and codimension-one theorem.

### Adversarial computations

| Statement | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| §0.1 conventions | h(e,e)=1, ā=−a; rank-one Gram ϖ³ | h(ae,e)=a; H(ae,e)=−a; both norms −a²; both duals ϖ⁻³Oe | Correct scalar distinction; R10 locator. |
| §0.5 Tor | Nonempty Cartier D; negative-valuation label | Self-Tor₁=O_D(−D) for nonempty D; for empty D, 0=0, not ≠0 | R07. |
| §§0.6–0.7 support/Euler | C=P¹, O(D)|C=O(−1); full-rank n=1, a=1 | χ(O_C)−χ(O_C(1))=1−2=−1=deg O(D)|C; Z(x)=Spec O/ϖ, length 1 | Correct; ordinary stalk length cannot replace Euler length. |
| §§0.8–0.9 rank one | a=1,3,−1,−3, with a odd | −D′(1)=1,2,0,0; Int=1,2,0,0; unguarded (a+1)/2 gives −1 at a=−3 | Correct domain and empty-lattice extension. |
| §1.3 primitive cycles | q=3, rank-one valuation 2 | Primitive degree 3²+3=12; total degree 13; open subtraction degree 0 | Correct scheme-theoretic distinction. |
| §§2.1–2.2 cohomology | d=1, q=3; A¹⊂P¹ over 𝔽_Q | 1+9−6(−3)=28; H_c(A¹) dimensions 0,0,1 with top eigenvalue Q | Correct count and repaired supplier. |
| §§2.4–2.7 Fourier/Chern sign | q=3 curve; line H on P² | f=−8, f̂=8; ch(O_D)=H−H²/2, wrong exponential gives −H−H²/2 | Fourier sign alone does not select Chern sign; geometric Check does. |
| §3.1 reference lattice | n=1, q=3, L=⟨ϖ⟩, Λ=⟨1⟩ | determinant valuations 1 versus 0; D(1)=0; W′=(8/3)log 3; wrong-lattice representation density 4 | Repaired F01. |
| §3.3 horizontal identity | unit hyperplane, perpendicular a=1,3,−3 | Geometric and analytic values (1,2,0)=(1,2,0) | Correct. |
| §3.5 headline | rank-one a=3, and self-dual cancellation | Int=2; −(1−X+X²−X³)′ at 1=2 | Correct normalization; deep proof still a target. |
| §§4.2–4.5 headline | n=2 exceptional P¹; q=3, a=0,2 | E²=−1; (q+1)Int_Y=0,4; ∂Den_Λ−Den=1−1,5−1=0,4; auxiliary at a=2 is 5/4 | Correct exceptional sign and Y/auxiliary distinction. |
| §§4.6,13.5 Whittaker scale | q_v=3, q_u=9 | log 9=2log 3; (q²−1)/(q+1)=8/4=2 | Correct propagation of F01. |
| §5.1 nonemptiness | x=e and u⁻¹e | norm valuations 0 and −1; component counts 2 and 0 | Repaired F03. |
| §§5.2–5.6 exotic geometry | q=3, C=P¹; orthogonal and nonorthogonal bases | χ(O)−χ(O(2))=1−3=−2; reflection determinant −1; cross pairings 0=0 versus 1≠−1 | Zero-label complex and normal-basis restriction discriminate. |
| §§6.1,6.4 exotic dual/density | q=3, invariants (1,1), then (3,3) | D=1−X²; Den(H₁,L)=0, Den(H₂,L)=640/729; volumes 1/3 and 1/27 | Equal-rank sign vanishing and full valuation, not type, used. |
| §§6.5–6.8 headline | q=3, rank-two invariants (1,1),(1,3),(3,3) | Int=2,4,12; density derivative=2,4,12; curve f=−12+10=−2, f̂=−12/9+10/3=2 | Correct component factor and Fourier sign. |
| §6.9 comparison | scalar u²/ϖ versus u⁻² | F₀ valuation shifts 0 and −1 respectively | Unit comparison correctly separated from special-Hom normalization. |
| §7.2 incidence | m=0,1,2 | m=0 asks dim U′=−1; m=1 Y=S=P¹, fibre dimension 0; m=2 rational-point fibre P¹, dimension 1 | Repaired boundary. |
| §§7.6–7.7 modified classes | unimodular n=3,2; cancellation n=3,ℓ=1 | α=0,1; parity correction 1·(1−0)=1, wrong ℓ parity gives 0 | Correct. |
| §8.2 primitive density | q=3, type two signs ±; type three | 1−3=−2, 1+3=4; 1−9=−8 | Correct sign-sensitive values. |
| §8.4 partial integral | q=3, norm −π₀⁻¹; q=5 sign | determinant −1; 2q=6 integral classes; partial integral 6vol(L♭)>0 versus source 0; χ_5(−1)=1 versus −1 | Roadmap correction confirmed. |
| §8.6 hyperbolic step | H₁, vector l₁+πl₂ | line norm valuation ≥2 equals val(H₁)=2; projection 1/(2π) has valuation −1 | Source decrease argument fails; target isolates it. |
| §8.7 headline | unimodular I₂,I₃; nonintegral lattice | Int=0,1,0; modified derivative=0,1,0 | Correct parity and nonintegral vanishing. |
| §9.2 derived semi-Lie | m=1, norm valuations 1,3; repeated finite-support divisor | Int=1,2; repeated Tor Euler ℓ−ℓ=0 rather than naive ℓ | Derived formulation is substantive. |
| §9.3 conjugation | split γ swap matrix, a=diag(3,1) | normalized families 1 and 3^s; D=0 versus log 3 | R02. |
| §9.3 extension | γ=((−2,1),(−3,2)); norm-one ξ, χ(ξ)=−1 | natural D=−log 3=−1·log 3; alternative scaled D=+log 3, Int unchanged 1 | R03. |
| §9.4 Cayley | x=0; d=1; norm scaling | c(0)=−1, inverse(−1)=0; 1−d=0 is excluded; omitted factor changes norm by −ε of valuation 0 | Correct domain and unit-normalization control. |
| §9.5 reduction | n=q=3 versus n=3,q=5 | 4 residues versus ≤4 exclusions gives no guarantee; 6 versus ≤4 leaves ≥2 choices | Correct separation of elementary and boundary routes. |
| §§9.6–9.7 local inputs | m=q=3; m=1 and norm valuation 3 | 4 residues>3; Int=2 and D/log q=−2; p>m+1 is p>2 in maximal-order rank one | Correct bounds; no small-prime suppression. |
| §9.8 low rank | q=3,a=1,3; F₀ unramified quadratic over ℚ₃, q=9,a=1 | Int=1,2 and D/log3=−1,−2; extended-field Int=1, D=−log9 | R06: retain full source generality. |
| §10.1 rational labels/weights | x/3; coefficient 2; b̄=−b basis change | norm 1/9; multiplicity 2 versus support multiplicity 1; transformed off-diagonals −b,b, last diagonal 1−b² | Repaired F02 and correct linear-first Gram convention. |
| §§10.3–10.4 uniformization/degrees | stabilizer of order 2; residue degree 2 over 𝔽₃ | orbit weight 1/2; one point contributes log9=2log3 | Stack and residue weights retained. |
| §11.5 formal Hecke/CM | wrong characteristic polynomial; transverse single local point | wrong α summands 0; matching transverse local class has Euler length 1; stabilizer order 2 gives 1/2 | Correct component restriction and derived class. |
| §12.2 fixed line | h=diag(1,−1), δ=diag(i,−i), u=(1,1), then e₁ | det(u,δu)=−2i; negative projection norm −1; e₁ cyclic determinant 0, negative projection 0 | Correct cyclicity implication; reducible polynomial used only as a control. |
| §12.4 Green singularity/descent | R=−1,a=1; principal coefficient 1 versus 2; swapped level input | Γ(0,4π)=−Ei(−4π)>0; log coefficients −1,−2; fixed-level multiplicities 2 versus 0 | Singular scale correct; R05 descent failure. |
| §12.5 metric and criterion | negative plane w=(1,i); zero input; m=0 coefficient | written norm 0 versus required 1/(πe^γ); f=0 gives k=0 and divisor 0; dropping constant leaves kĉ₁(ω) | R01; constant coefficient must stay. |
| §12.7 general Chow modularity | [F₀:ℚ]=2,n=3; n=2 | orthogonal signature (4,2) gives weight 3; signature (2,2) gives weight 2; §12.5 domain tests false in both cases | R04 ownership gap. |
| §§12.8–12.9 headline | φ(0)=0,1 and Hodge degree d, denominator N | constant pairing 0,−d/N; substituting [E:F₀]=2[E:F] gives −d/(2N) | Correct constant/degree bookkeeping; proof depends on repairs. |
| §12.10 local domain | h=3J, g regular unipotent, u=e₁+e₃ | det cyclic basis −1; det h=−27; h(u,u)=6; regular=true, strong=false | R08. |
| §§13.1–13.4 normalization | rank-one | normalized parabolic factor 1/3 at |a|=1/3; coherent constants −vol(K) in n=1 and +vol(K) in n=2 | Normalized induction and sign kept separately. |
| §§13.6–13.7 Green degree | n=3, m=1 or 3; conjugate embeddings | current bidegrees (0,0) and (2,2); two half-integrals I/2+I/2=I | Correct top-degree and archimedean factors. |
| §13.8 headline | three obstructing places | local product s³A(s) has first derivative 0; no local degree at a unique place, sum 0 | Correct |Diff|≥3 vanishing; global hypotheses retained. |
| §§13.9–13.10 headline | q=3 almost self-dual correction; ramified dual vertex | c₀=−1/4; (5−1)/4=1 recovers Y length; corrected derivative and empty geometric cycle both 0 at dual vertex | Correct modified rather than raw derivative. |
| §§14.1–14.2 Gaussian correction | a=1,ξ=−1; formal values ∂J=1, Int_K−B=2, Int_B=3 | 2(∂J∞/W)+G=Ei(−4π)−Ei(−4π)=0; E♭=(2+2)+3=7=2+5; extra factor gives 11 | Correct scales and coefficient one on ∂J_hol. |
| §§14.3–14.4 comparison | primes 3,5; away-place positive indicator | 3^a5^b=1 implies a=b=0 after clearing denominators; positive open orbit patch of volume c gives orbital factor ≥c>0 | Cancellation uses nonzero factor and finite rational logarithms. |
| §14.5 headline | n=1,2,3,4; p=n=3 | semi-Lie dimensions 0,1,2,3; rank-one Int=1,2 and D/logp=−1,−2; first global step m=3 | Repaired F07; low rank avoids curve modularity. |
| Supplier properness | zero fan versus complete fan | toric charts G_m versus P¹; extension of uniformizer point across 0 fails versus exists | R09. |

### Pinned library, Lean and headline audit

Pins inspected: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

| Native object opened at the pin | Declaration/location and actual scope |
|---|---|
| Polynomials | Mathlib/Algebra/Polynomial/Basic.lean:69, `Polynomial`, finitely supported coefficients; Mathlib/Algebra/Polynomial/Eval/Defs.lean:248, `Polynomial.eval`; Mathlib/Algebra/Polynomial/Derivative.lean:47, `Polynomial.derivative`. These supply the finite-polynomial algebra, not representation densities or their interpolation theorem. |
| Local fields | Mathlib/NumberTheory/LocalField/Basic.lean:46, `IsNonarchimedeanLocalField`. It supplies local compactness, the nontrivial valuation/topology relation and field setting, not a selected quadratic extension, Hermitian form or Haar normalization. |
| Affine formal-spectrum ingredients | TauCeti/AlgebraicGeometry/FormalScheme/Spf/Carrier.lean:73, `carrier`, the open prime ideals; Spf/StructureSheaf.lean:262, `structureSheaf`, an inverse-limit sheaf for an adic ideal. These affine ingredients exist, but there is no general formal-scheme/Rapoport–Zink moduli carrier and its supported Euler theory on which to state these headlines. |
| Ordinary Chow groups | TauCeti/AlgebraicGeometry/Chow/Basic.lean:295, `ChowGroup`, cycles modulo rational equivalence for locally Noetherian schemes. It has no Green-current or arithmetic-degree data. The roadmap imports ordinary intersection machinery and constructs arithmetic cycles on its own models. |

Object searches included quadratic/Hermitian forms, formal spectra, supported K-theory, cycles/Chow groups, representation densities, unitary Rapoport–Zink moduli and Jacquet–Rallis integrals, in both pinned trees. The Hermitian-density textual hit in Tau Ceti's proper-complex Gaussian distribution is a probability density, not a local representation density. No headline duplicate at the pins was found. The absence statements were interpreted as absence of the complete carriers required by the theorem, not absence of every affine formal-spectrum or ordinary-cycle ingredient.

The eight headlines are §§3.5, 4.5, 6.8, 8.7, 13.8, 13.10, 12.9 and 14.5. Each is individually named in Suggested.lean's module docstring with the missing carriers: the first four require special cycles and supported Euler intersection on unitary formal moduli plus local densities; the next two require integral unitary models, arithmetic degrees and unitary Eisenstein derivatives; §12.9 requires arithmetic divisor/CM classes; §14.5 requires Rapoport–Zink graph intersections and the specific twisted orbital integrals. None can be made into the actual headline using only a few simple definitions on the available carriers. No statable headline is being replaced by a scalar implication or a free predicate.

The prescribed `lake env lean` elaboration of packages/GrossZagierAndArithmeticHeightsPartII/Suggested.lean was run from the content checkout, with the actual package file supplied as an absolute argument to the command. It exited 0 with no output and no warnings. There is one `import Mathlib`, an appropriately named module docstring and namespace, and no TauCeti import needing a targeted build. There are zero definitions, instances, opaque declarations, theorems, examples and `sorry` bodies. Thus the exhaustive one-tactic padding probe and elaborated-own-signature comparison each have zero inputs; no fabricated probe theorem was substituted. There is no `set_option` or sorry'd data.

### Supplier resolution and duplication by object

Read the board package index before resolving absent-tool leads. The fresh resolver checked main `c69ba93` and the open-head index and reported only LubinTateFormalModulesAndQuasiCanonicalLifts and EndoscopicTransferAndUnitaryTraceComparisonPartII as absent from its indexed roadmaps. Both have readable board packages; the exact cited targets were opened there. The tool's statement that it could not check pinned names is not evidence of absence: the library names were checked directly as above.

The following is the resolution evidence for the supplier families consumed throughout the 105 Needs lines. Paths in the table are repository-relative. A target on an open head is a planned supply, not a claim that its Lean implementation already exists.

| Supplier objects | Resolved location(s) and comparison |
|---|---|
| Unit formal moduli, sources, Hom conventions, graphs and auxiliary isogenies | packages/PELModuliPartII/README.md:426 (§0.7); 458–557 (§§1.1–1.6); 594–675 (§§2.1–2.5). The source has conjugate action, exact polarization, nonsplit V_n and split W_n; auxiliary projection degree q+1 is generic only. The integral exceptional geometry is newly owned in §4.2. |
| Exotic and Krämer formal moduli | packages/PELModuliPartII/README.md:740–818 (§§3.3–3.7), 941 (§4.6), 970–1101 (§§5.1–5.3, 5.5, 5.7–5.8). Even exotic rank, two components, u⁻² normalization and Krämer filtration rank n−1 agree. The special-cycle conditions are new here. |
| Global RSZ models, levels and basic completions | packages/PELModuliPartII/README.md:1151 (§6.1), 1221–1281 (§§6.5–6.8), 1318–1485 (§§7.1–7.5, 7.10), 1607 (§8.5), 1721–1826 (§§9.3, 9.5–9.9). Ramified base restrictions, CM factors and h′=(u²/ϖ)h are preserved. |
| Generic PEL objects, complex uniformization and Hecke maps | TauCetiRoadmap/PELModuli/README.md:1309 (§M0.22), 1638 (§M1.3), 2069 (§M1.13), 2924 (§M3.4), 3116 (§M3.8), 3766 (§M6.1). Hom form is linear-first; level translation acts on labels and cannot be ignored in R05. |
| Grothendieck–Messing, Tate and Dieudonné theory | TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:2125, 2143 (§A4.7, §A4.CR.7.2); TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:988, 1858, 3389, 3698 (§§R07.1.8, R07.1.22, R07.2.10, R07.2.20). Integral versus rational Hom, perfect residue field and covariant/contravariant conventions remain distinct. |
| Canonical/quasi-canonical lifts and quadratic orders | packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:1299, 1328, 1378, 1402, 1468 (§§6.1–6.2, 6.4–6.5, 7.1); #1487 TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:2944 (§7.2). Markings, orbit degrees and endomorphism lifting lengths are supplied, not replanned. |
| Hermitian lattices and unramified density API | #851 TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:703, 769, 879 (§§2.7, 2.9, 3.2), including `IntegralHermitianLattice.ofCarrier`, `.dual`, `HermitianLatticeInvariants.ofDualQuotient`, `normalizedSiegelPolynomial`, `choYamauchiWeight`. The conjugate-first convention is transported by §0.1; the ramified interpolation is a declared extension. |
| Supported formal K-theory | #1741 TauCetiRoadmap/SchemeKTheoryOperationsPartII/README.md:169, 195, 228 (§§0.5–0.7), 338, 406, 431 (§§1.4, 1.7–1.8), 467, 483, 526, 542 (§§2.1–2.2, 2.4–2.5), 579 onward (§§3.1–3.4), 656–775 (§§4.1–4.3, 4.5–4.7). Its affine filtration theorem is not silently used globally: the nonaffine product gap covers that extension. |
| Scheme K-theory and ordinary Chow/Chern operations | #1229 TauCetiRoadmap/SchemeKTheoryOperations/README.md:2811, 3047 (§§6.12, 7.7); TauCetiRoadmap/SchemeAndStackFoundations/README.md:6902, 7045, 7065, 7318 (§§5.1, 5.3, 5.4, 5.7). These give ordinary graded classes/pushforwards, not a second construction of arithmetic cycle theory. |
| Cohomology and local KR premise for the arithmetic inner product | TauCetiRoadmap/EtaleCohomologyFoundations/README.md:443, 567, 613, 959–1103 (§§0.7–0.8, F.2.5, F.4.1–F.4.6); #1313 TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:387, 435, 1652 (§§2.4, 2.7, 7.19). The latter takes the almost self-dual identity as a premise; this roadmap supplies it, without using the inner product theorem to prove it. |
| Weil representation, Fourier uncertainty and Siegel–Weil | #1063 TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:402, 520, 550, 618, 638, 646, 1218, 1292, 1553, 1589, 1621 (§§2.1, 2.5, 2.7, 3.3–3.3b, 4.5, 5.1, 6.2, 6.4, 6.7). The supplied uncertainty principle uses a strict support inequality; it is not reproved as a generic theorem. |
| Schwartz analysis and Eisenstein continuation | TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md, AL.0 and its transfer to AnalyticNumberTheoryPartII §§5.3g–5.3h; #925 TauCetiRoadmap/AutomorphicSpectralTheory/README.md:886, 909, 1560 (§§1.1, 1.2, 2.4). Local measure self-duality and normalized induction are separate inputs. |
| Harmonic Maass spaces | TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md:1216, 1286, 1317 (§§8.3, 8.5, 8.6). H⁺, cuspidal ξ-image and negative-weight exact sequences are present; arithmetic Borcherds products are new here. |
| Integral toroidal models | #1053 TauCetiRoadmap/ShimuraCompactifications/README.md:2294, 2344, 2542 (§§7.3, 7.5, 7.15). R09 corrects the properness locator and its complete-fan condition. |
| Arithmetic divisors and proper one-cycle pairing | #1000 TauCetiRoadmap/ArakelovGeometryAndAbelianHeights/README.md:393, 430, 457 (§§1.8–1.10). Principal divisors use −log|f|²; a conjugate pair contributes two halves, not two full archimedean degrees. Higher-codimension star products remain a declared gap. |
| Generic JR versus Zhang's formulations | #999 TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:688, 764, 998 (§§2.1, 2.4, 2.13); packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md:678, 692 (§§4.4–4.5). The GL_n/X_n and augmented Lie formulations are not silently identified with S_n. Their passage is the named gap, subject to R03's character normalization. |
| Fourier vanishing | #1037 TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:686 (§4.4), `fourierUnitVanishing`. Conductor-adjusted level and the finite exceptional set are preserved; no weight-zero constant is used to justify a positive-weight vanishing assertion. |

Ownership searches used the roadmap service by object, followed by reading the matching scopes/targets, and direct searches of the board packages and pinned trees. The closest open heads were read: #1487 remains the Shimura-curve Gross–Zagier supplier; #1063 owns the common Weil/uncertainty machinery; #999 owns generic transfer; #1090 TauCetiRoadmap/IgusaVarietiesAndTorsionConcentration/README.md:6 owns Igusa/PEL comparison and torsion-concentration objects, not these special-cycle intersections; #1695's §§4.2–4.2a concern orthogonal arithmetic divisors and CM heights, while this package's constructions concern unitary cycles and their moduli multiplicities. Those different outputs are not identified as duplicate headlines. The genuinely missing general orthogonal input is R04.

The overlap file lists no conflicting heads, dropped cited ids, ids defined only by an unnamed open revision, or dropped package ids cited elsewhere. Its five closest roadmaps were checked as above. There is no new finding of a mutual handoff or a fully qualified declaration collision: Suggested.lean declares nothing. The six original resolver leads were resolved to supplier definitions or board packages rather than treated as missing pinned declarations. No relevant supplier was inferred to exist nowhere merely because it was absent from the service's index.

### Declared gaps, order and shape

The four slugs in packages/GrossZagierAndArithmeticHeightsPartII/design/plan.json match the README contracts exactly:

| Gap | Supplier and precise missing operation | Audit |
|---|---|---|
| ramified-hermitian-densities | GeometryOfNumbersAndQuadraticArithmetic §3.2: ramified odd-residue densities, two interpolation conventions and finite overlattice expansions | Named, earlier, and not already supplied by its unramified target. Different signs force vanishing only in the stated equal-rank/nonembedding cases. The rank-two versus rank-four value 640/729 above checks minimality of that restriction. |
| nonaffine-formal-filtration-product | SchemeKTheoryOperationsPartII §2.4: rational multiplicativity compatible with noetherian exhaustion | Named, earlier; affine multiplicativity does not already prove this non-quasi-compact formal statement. |
| arithmetic-chow-star-products | ArakelovGeometryAndAbelianHeights §§1.8–1.10: all-codimension arithmetic Chow products and normalized degree | Named, earlier; the supplied divisor/proper-one-cycle pairing is less than the requested higher-codimension product. |
| jr-afl-local-inputs | EndoscopicTransferAndUnitaryTraceComparison Layers 2 and 4: matching, Fourier-compatible transfer and unit FL in Zhang's two formulations for all q | Named, earlier; formulation change is not already §§4.4–4.5 of Part II. Add R03's necessary unramified extension normalization. |

The missing suppliers' future implementations are contractual conditions, not findings of unowned mathematics. R04 is different: it has neither an owned target nor a declared gap.

The prescribed dependency command returned exactly:

    depcheck: 236 roadmaps, 2154 edges, 0 problem(s)

There was no UPWARD, CYCLE or moved line. Every Needs line and supplier citation was read in addition to this mechanical check. No forbidden supplier was found. Local identities precede global degree comparisons; those precede trace comparison. The order of horizontal decomposition, geometric/analytic Fourier identities and their comparison is mathematically motivated and is not a copied source chapter sequence. The new Part II states where the base roadmap stops. It retains nonintegral, ramified, exotic, almost self-dual and Krämer cases instead of reducing the whole library to good primes. R06 identifies one remaining unnecessary specialization.

There are 15 layers, 105 numbered targets, 105 Needs lines, 15 Examples sections, 15 Dependencies sections and 336 Check bullets. All 39 targets beginning with Define/Construct carry an API list; all 105 targets have at least three Checks. This structural count does not excuse false Checks: R07/R08 record two. The README has the required summary, ownership, conventions and supplier sections. Main-branch QuadraticCharactersAndReduction and NoncongruenceModularForms were read for shape. No executable algorithm, copied source passage, process/job narrative, pull-request number, machine path, HTML anchor, LaTeX delimiter or numbered target-catalogue block was found in the package's mathematical text. Formula code spans were distinguished from identifiers: no undeclared backticked name is claimed as this roadmap's own API.

## Not verifiable

- Lusztig76, locators 1.18, 6.1 and 7.3: the source is explicitly settled as uncertified and its full text was not available. It was not requested again. The consequences used here were checked against LZ's statements and the displayed low-dimensional eigenvalue/count controls, not certified against Lusztig's original proof.

No other sampled source was inaccessible. ES and YZZ09 were eventually fetched; their earlier failed lookups do not leave a missing-text request. Ownership was checked against the available indexed open heads and readable board packages; no unavailable open head was reconstructed or treated as authoritative from its name alone.

## Source issues

- **Error** in K at §3.1, printed p. 16: the source describes every Frobenius-fixed Lagrangian as singular even when m=1; it should exclude m=1, where S_V=P¹ is smooth; affects a stated result.
- **Error** in K at Theorem 8.2, printed p. 64: the source asserts negative-cone vanishing of the vertical partial integral; it should retain constancy on the nonnegative cone without that vanishing, since the rank-three example gives 2q·vol(L♭); affects a stated result.
- **Misprint** in K at equation (8.6), printed p. 67: the source uses the orthogonal-sum sign (−1)^n₁; it should use χ(−1)^n₁, which equals 1 rather than −1 for q=5,n₁=1; affects the proof.
- **Error** in K at Lemma 9.6, printed pp. 74–75: the source asserts strict valuation decrease for the replacement hyperplane; it should provide a separate hyperbolic argument, since H₁ has no line of valuation below two; affects a stated result.
- **Gap** in Z at Theorem 8.6, printed p. 42, and its use in Theorem 15.1: the source invokes BHKRY arithmetic modularity without the n≥3 restriction; it should justify the curve case separately or use the low-rank AFL base before starting the global induction; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "868afb68f132bb4f6dda5823272539da782dff72", "job": "REV-PKG-GrossZagierAndArithmeticHeightsPartII~4", "model": "gpt-6-astra", "worker": "chris-4"} -->
