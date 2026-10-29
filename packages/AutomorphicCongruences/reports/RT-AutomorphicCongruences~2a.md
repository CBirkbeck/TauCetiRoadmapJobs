<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/129#issuecomment-6484062676 -->
Red team round 2 pass a (codex) of c88704a

Verdict: needs_changes

1. **F01** (P1) Imprimitive SU functions can have pulled-back cyclotomic divisors

   **Location:** packages/AutomorphicCongruences/README.md:550, “lies in no prime … of the form Q·𝕀[[Γ_K]]”; also §§1.7(ii), 1.10's proof.

   **Claim:** §1.5(iii) excludes every pulled-back height-one divisor for an arbitrary enlarged Σ.

   **Witness:** §5.3's own 11a1, p=7, K=ℚ(√−3), q=113 instance gives a removed inert Euler factor in the cyclotomic subring, with augmentation 12915/12769 of valuation 1. A height-one divisor of this nonunit also divides L^Σ.

   More explicitly, at the weight-two point put Z equal to the cyclotomic group-like element for the prime over 113. Its factor is E_q(Z)=1−(9²−2·113)113⁻²Z+113⁻²Z²; E_q(1)=12915/12769. In the ordinary family the corresponding element belongs to B=𝕀[[Γ_K⁺]], is nonzero, and is a nonunit because its weight-two augmentation is a nonunit. A height-one prime Q minimal over (E_q) exists; Q·B[[Γ_K⁻]] is height one and contains the imprimitive function. The family through 11a1 is ordinary and distinguished at 7 (a₇=−2), residually irreducible, and residually ramified at its single inert level prime 11. Adding 113 to Σ violates none of §1.5's hypotheses. The same factor divides the degenerate coefficients and cannot be excluded from L^Σ by Vatsal's primitive nonvanishing. SU line 8642 retains the Euler product, but SU lines 8656–8682 incorrectly pass to zero μ for its anticyclotomic restriction without removing these factors.

   **Exact repair text:** “Write L^Σ=L^primitive·∏E_q with all Euler factors retained. The primitive anticyclotomic specialization has μ=0 under the stated period and residual hypotheses. Consequently, at a pulled-back height-one prime Q, ord_Q(L^Σ) is bounded by the valuation of the removed nonsplit Euler product; no unconditional avoidance is asserted for L^Σ. Treat these primes by the matching primitive/imprimitive Selmer exact sequence, as in §5.9, and use Fourier-coefficient coprimality only at the other primes.” Replace §1.7(ii)'s unrestricted joint avoidance by the assertion away from the removed nonsplit Euler divisors, and update §1.10's proof to include this exceptional-prime argument. Keep the full arbitrary-Σ endpoint.

   **Repair test:** The 113 factor is retained on both analytic and local-Selmer sides; its anticyclotomic valuation 1 is no longer declared zero. Away from that factor, the original primitive nonvanishing argument remains applicable.

2. **F02** (P2) The repaired Hilbert construction is still out of build order

   **Location:** packages/AutomorphicCongruences/README.md:1760, “*Needs:* §§5.2 and 5.4”.

   **Claim:** The numbered build supplies the objects needed by each target before that target.

   **Witness:** §5.3 defines β(L^Σ) using the family constructed in §5.4; §5.4 itself needs only §§1.1, 1.2 and 5.2 plus suppliers. Thus 5.4 must precede 5.3. Removing the cycle did not remove the forward reference.

   **Exact repair text:** Place the complete §5.4 block immediately before §5.3, retaining both section labels and their existing anchors; add “Construction order in this layer is §§5.1, 5.2, 5.4, 5.3, then §§5.5–5.13.” Alternatively renumber both sections and update every consumer. The first repair preserves HeegnerPointEulerSystems' existing references, so their existence does not prevent repairing the order.

   **Repair test:** L^Σ and its coefficient ring are constructed before β(L^Σ); neither forward-reference nor cycle remains. This is the outstanding part of round-one a-F05, which the repair report marked “applied differently”, not “not actionable in this package”.

3. **F03** (P1) The fixed-form equivalence consumes a Beilinson–Flach class outside both supplied forms

   **Location:** packages/AutomorphicCongruences/README.md:1983, “the specialization of §2.15 at the fixed form g”.

   **Claim:** §2.15 and §2.16 supply the class and reciprocity laws throughout §6.1's odd-prime, coprime-discriminant scope.

   **Witness:** Take 11a1, p=3, K=ℚ(√−2). Then a₃=−1, D_K=−8 is coprime to 11 and 3 splits. The CW form requires p>3; the FW form requires K ramified at a level prime. Neither applies.

   The remaining (irr_K) condition can also be checked concretely. On E: y²+y=x³−x²−10x−20, a₅=1. Frobenius at the inert prime 5 squared has trace 1²−2·5=−9≡0 and determinant 25≡1 modulo 3, hence irreducible polynomial X²+1 over 𝔽₃. Inertia at 11 supplies a nontrivial transvection because ord₁₁(Δ)=5 is prime to 3 and K/ℚ is unramified there. These two elements exclude an invariant line even after coefficient extension. Thus this is an admitted §6.1 instance, not just a formal mismatch of prime ranges. The repair of a-F04 fixed the hypotheses of §2.15 but did not update this consumer. Moreover PadicFamilies §§4.0.1/4.1 concern modular zeta inputs and ordinary Galois representations, not the missing two-variable BF theorem.

   **Exact repair text:** Add to §2.15: “Fixed-form BCS form: for every odd p, an elliptic newform g ordinary at p, and imaginary quadratic K with p split, (D_K,N)=1 and g[p] irreducible over G_K, construct the two-variable BF_α on the integral lattice of §6.1, with tame/p-power norm relations and its specified local conditions. This form does not require the FW Steinberg witness or ramification of K at a level prime.” Add to §2.16 the two integral reciprocity maps with pseudo-null cokernels and precisely the congruence/period factors used in §6.1, in this fixed-form generality (CGS23 Theorem 3.1.1 and Corollary 3.1.3; BCS Theorem 4.1.3). Prove the auxiliary-factor and lattice comparisons in this branch, and point §6.1 to it. Keep §6.1's full odd-prime scope.

   **Repair test:** For 11a1, p=3, K=ℚ(√−2), the new fixed-form branch applies without asserting either p>3 or ramification at 11. The existing CW and FW branches keep their actual hypotheses.

4. **F04** (P3) Definition Checks remain duplicated or incomplete

   **Location:** packages/AutomorphicCongruences/README.md:1650–1654, “nonvanishing is equivalent to µ = 0 at one, hence every, modular point”.

   **Claim:** The Checks test the residual morphism, its coefficient reduction and η projection.

   **Witness:** The third and fifth Checks both repeat §4.9's nonvanishing/μ theorem. Neither distinguishes the correct coefficient-change map from an asserted H¹-base-change isomorphism, or the η projection from the opposite projection.

   **Exact repair text:** Replace those two repeated Checks by: “For C=[A —X→ A] in degrees 1,2 over A=k[[X]], the residual map factors through H¹(C)⊗k=0 even though H¹(C⊗ᴸk)=k; no nonzero residual class is created by declaring that map an isomorphism.” And: “Over 𝔽₅, with c=diag(1,−1), e₊=(1+c)/2=diag(1,0) and e₋=(1−c)/2=diag(0,1). Applying e₊ to (1,0) gives (1,0), and to (0,1) gives 0; interchanging the η components fails. At p=2 these projectors are undefined.” Retain the existing nonunit Euler-factor and empty-product Checks.

   **Repair test:** The wrong H¹ identification would replace 0 by k; the wrong η projector would replace (1,0) by 0. Both changes are now detected without assuming the theorem being tested. Additionally §2.2, which defines the duals and family modules, has only two Checks. Add this third Check: “At p=5 and a single coefficient fibre V=ℚ₅/ℤ₅, its continuous Pontryagin dual is ℤ₅. Multiplication by 5 on V is surjective with kernel 𝔽₅; on its dual it is injective with cokernel 𝔽₅. Identifying the divisible form module with its compact dual would interchange these two results.”

5. **F05** (P3) The claimed library pins are not the review's pins

   **Location:** packages/AutomorphicCongruences/README.md:53 and :59, “The dependency pin is Mathlib” and “The dependency pin is Tau Ceti”.

   **Claim:** The named hashes identify the pinned APIs against which this package is reviewed.

   **Witness:** lake-manifest.json:8 pins Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a; :18 pins Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2. Both library checkout HEADs match those pins, not the README's a91d3aa and 6b7abb3.

   **Exact repair text:** Replace the Mathlib hash by `f6090c7095e1e56b3464c1daba5f24631f1290d2` and the Tau Ceti hash by `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Keep the API citations only after checking them at those commits; do not change the manifest or toolchain.

   **Repair test:** Both repaired hashes equal the manifest revisions and checkout HEADs. The directly inspected quotient, matrix-trace, Fitting, continuous-H¹ and quadratic-twist APIs exist at these actual pins; no Lean declaration depends on the obsolete hashes.

## Verification of the earlier findings

Locations below are in packages/AutomorphicCongruences/README.md unless stated otherwise. Quotes identify the current repaired passage; the computations are independent tests of it. All twenty findings are accounted for; overlapping findings remain separate rows.

| Earlier finding | Status | Current passage and witness |
| --- | --- | --- |
| a-F01, lattice spanning | Repaired | §0.7: “N′ = 0 and the orbit module spans”. The split orbit has rank 1 rather than n+2, N=N′=0 and lower bound 0; it no longer gives ord(J)=1. For N=A/ϖ²⊕A/ϖ, Ann(N)=(ϖ²) and length 3≥2. |
| a-F02, Yager coefficients | Repaired | §2.19: “coefficients are Ô_∞, not the completed maximal unramified ring”. At p=3, Frobenius on W(𝔽₉) has order 2, impossible for the indicated pro-3 quotient; Ô_∞ has the correct action. |
| a-F03, β iff | Repaired | §5.3: “For a surviving anticyclotomic variable T, β(T) = T ≠ 0”. For w=3 and T=γ_cyc−c, β(wT)=0 although w≠0; the revised converse does not cover this case. |
| a-F04, CW hypotheses | Partly repaired | §2.15 distinguishes “the CW form” from “the FW form”, retaining p>3, regularity and coprime discriminant in the first and owning the extension in the second. §6.1 still calls them at an uncovered input: S03. |
| a-F05, construction order | Partly repaired | §2.10 now constructs the rational function and §2.11 proves factorization/integrality. §5.3 says its §5.4 construction “does not use this subsection”, eliminating the cycle but leaving the forward edge: S02. |
| a-F06, dangling names | Repaired | §4.2 cites “§4.1”; §4.3 the “parity argument”; §4.5 the “determinant/characteristic criterion of §3.4”. The three old identifiers are absent. For p=5, 2a≡1 mod4 has no solution, matching the stated parity exclusion. |
| a-F07, imprimitive μ | Partly repaired globally | §5.3: “condition is placed here on the primitive function”. Its 113 factor has valuation 1 and is retained in §§5.3/5.9. The same problem remains in the earlier SU layer, S01. |
| a-F08, H¹ base change | Repaired | §3.7: “cokernel H²(C)[f]”; §4.8 uses the natural cohomology map. For [A —X→ A] in degrees 1,2, H¹=0, specialized H¹=k, H²[X]=k. This is no longer asserted to be an isomorphism. |
| a-F09, period Checks | Repaired | §5.2: “numerator 10 and η=5”. The quotients are 2, 1 and 2/5 at η=5,10,25; only the first two differ by a 5-adic unit. |
| a-F10, NAK equations | Repaired | §3.8 now cites “(68)–(76)” and “(77)”; §4.10 “(93)”. NAK lines 3151–3239, 3413 and 3656 identify specialization, change of Σ and λ comparison respectively. |
| a-F11, p-irregular owner | Repaired | §2.20: “imported from PadicFamilies (gap:bianchi-p-irregular-l-functions)”. The same slug and identical needs text are in the README and plan. PadicFamilies §4.9 explicitly assumes distinct roots; α=β therefore uses the gap. This is accepted conditionally, not counted as an already proved BW extension. |
| a-F12, missing docstring headlines | Repaired | Suggested.lean:42–57 explicitly names the lattice, Ichino/Harris/Ikeda, Yager, R=T and universal-zeta results and missing carriers. There are zero declarations, so no replacement surrogate is hidden below the docstring. |
| a-F13, reminder-only Checks | Partly repaired | The cited blocks now include computed tests, e.g. §2.10 gives 7/4 versus 28 and §3.2 gives a rank-two singular algebra. This does not certify every Checks block: see the ledger and S04 for the still-underchecked definition. |
| a-F14, BSD scope | Repaired | §4.5 explicitly puts the BSD source consequence “outside the scope”. The endpoint and downstream scope now agree; no BSD theorem is silently promised. |
| b-F01, private line locators | Repaired | Layer 1 uses “SU §2, author-copy p. 13”; the Hilbert gap uses “Proposition 96, p. 80”. The public locators replace cache-only references, and the same Hilbert needs text appears in plan.json. |
| b-F02, SU numbering | Repaired | §2.6: “SU Thm 7.3.1, p. 103”, with CLW's journal-number correspondence. SU lines 4010–4028 contain the author-version theorem. |
| b-F03, HT94 direction | Repaired | §0.9 distinguishes “HT94 Theorem 0.1” from “Theorem 0.2”. HT94 lines 114–115 and 145–146 concern respectively the characteristic-series and congruence-series divisibilities. A rational relation cannot distinguish (3) from (1) after 3-inversion. |
| b-F04, NAK condition (b) | Repaired | §4.9 now cites “Theorem 5.10(4)” for (b), and Theorem 5.2 for (a). NAK lines 3296–3300 and 3473–3478 retain the different scopes. |
| b-F05, dangling identifiers | Repaired | Same three replacements as a-F06; neither occurrence of the old identifiers remains. |
| b-F06, unread versions | Repaired | Published-NAK assertions have been removed. The CGS23 manifest retains one key and records the v2 hash and version note; CGS23 v2 lines 390–422 confirm the inspected claims. BCS's published author copy was fetched legally under the existing BCS key and checked separately (Theorem 1.1.2 and (5.4)). |

## Computed statement ledger

The table covers all 92 numbered target blocks, including their definitions and conventions. “Model” denotes a test of the displayed algebraic identity or comparison, not a claimed automorphic realization or a proof of the endpoint. An endpoint with no computable realization is tested on its valuation/rank consequences and domain exclusions; the limits are recorded below. All arithmetic instances use the stated coefficient assumptions; a zero ring, characteristic-p coefficient field, inseparable number field, or noncompact replacement of a required profinite group is outside that domain unless the row explicitly tests a general algebraic prototype. No analytic L-value or Selmer order is invented in these tests.

| Target and context | Instances and computed values on the two sides | Result / change |
| --- | --- | --- |
| §0.1; profinite coefficient ring, finite ramification, specified p-filtration | T=0: H¹=Sel=X=0, Ch=(1). Trivial ℚ_p/ℤ_p with T_v=0: Frobenius↦1/p restricts to 0 on inertia but is not the zero class on D_v. T_v=T: local quotient 0 and kernel all H¹. | The inertia-kernel convention differs from the strict kernel; finite-ramification hypothesis excludes the εX^k example. |
| §0.2; primitive/imprimitive local comparison | ℓ=11,p=5,α=1: E(1)=1−1/11=10/11, v₅=1 rather than 0. In a length model primitive length 2 plus local length 1 gives imprimitive length 3. | Retain the Euler correction; it need not be a unit. |
| §0.3; normal coefficient ring, nonzero specialized majorant | A=ℤ_p[[T]], M=A/(p,T): Ch_A(M)=A; after T=0, Ch(M/TM)=(p). For A/(p), both principal generators specialize to p. For A/(T)⊕A/(T−p), analytic generator maps to 0 and quotient rank is 1. | Containment has the correct direction; no cancellation at zero. |
| §0.4; coefficient map and surjective Eisenstein quotient | Δ at 691: τ(2)−1−2¹¹=−2073=−3·691, valuation 1; at 5 this difference is a unit. Constants ℤ→ℤ[X] with equal operator values give ideal 0 but X outside the image. | Distinguishes coefficient contraction from Hecke ideal and from surjectivity. |
| §0.5; polarized 1+n+1 datum, n≥1 | diag(1,2,3,4): det(1−MX)=1−10X+35X²−50X³+24X⁴; −coeff₁=10=trace, whereas −coeff₃=50. n=0 gives two blocks, outside the middle-irrep hypothesis. | Sign and rank checked. |
| §0.6; decomposition-group versus inertia conditions | Unramified class Frob↦1/p: restriction to I is 0, restriction to D nonzero. ℓ=11,p=5 Euler valuation is 1. | Strong local vanishing implies the stated Selmer membership, not conversely. |
| §0.7; proper I, spanning or Lemma 4.3.11 | N=A/ϖ², N′=ϖN: length(N)=2, length(N/N′)=1. Split orbit: N=N′=0, bound 0, not ord(J)=1. I=A would reduce every block to 0 and is excluded. | Spanning repair passes. |
| §0.8; canonical cohomological period, congruence generator | Replace period Ω by 2Ω at p=3: η↦η/2 and valuation unchanged. Replace by 3Ω: valuation falls by 1. Cuspidal Hecke ring for Δ has congruence ideal (1), while its Eisenstein ideal at 691 is (691). | Period and congruence-ideal distinctions hold. |
| §0.9; CM branch and integral Katz comparison | K=ℚ(√−23): h=3, −23≡1 mod3, so v₃(h)=1. H=3 and hL=3 turn u/3 into u; hL=1 leaves u/3 nonintegral. φ(7)=6 versus φ(5)=4 has valuations 1 versus 0 at 3. | Integral exceptional cases genuinely require the declared gap. |
| §1.1; ordinary GU(2,2), odd p | At p=3, full Igusa fibre size (8·6)²=2304, torus size 16; UV=[[2,1],[1,1]] differs from VU=[[1,1],[1,2]]. At p=2, ([−1]−1)([−1]+1)=0. | Nonabelian structure group and prime restriction are discriminating. |
| §1.2; boundary-corank module and control | Boundary model (x,y)↦y: kernel A×0, quotient A; unrestricted coefficient 1 at genus-zero boundary is outside M¹, whereas coefficient 0 is allowed. | The theorem does not describe every full modular form. |
| §1.3; genuine Hida branch, four-dimensional Eisenstein representation | After arithmetic quotient, O[[Γ⁻×Γ]] has 3 variables and dimension 4; an O[[W]] branch itself has an additional weight variable. Trace at identity is 4, not 2. | Scope and dimensions match. |
| §1.4; normalized pullback in convergent range | Raw coefficient 2 and normalization scalar 3 give 6; omitted scalar gives 2, double normalization 18. Two-character GL₂ input plus two characters has rank 4, unlike four independent characters of a Siegel series. | Tests normalization and parabolic choice, not a numerical L-value. |
| §1.5; SU function, arbitrary allowed Σ | κ=2 gives ((κ−2)!)²=1; κ=4 gives 4. Model Y has unit coefficient and specialization 0; pY has all coefficients in (p). Actual added inert q=113 factor has v₇(E_q(1))=1. | S01: unrestricted pulled-back-prime avoidance is false. |
| §1.6; boundary product and primitive Eisenstein family | det diag(1,0)=0 versus det diag(1,1)=1. Coefficient 1 stays 1 modulo ϖ; coefficient ϖ becomes 0. A→A/(ϖ) cannot have an A-algebra section to A: ϖ would map to both 0 and ϖ. | Singular-coefficient and cuspidal-quotient distinctions pass. |
| §1.7; Fourier-coefficient nonvanishing | Root sign −1 gives L=−L, hence L=0 in characteristic zero. Local μ sum 1 gives valuation 1, not a unit. For K=ℚ(√−7), 3 and 13 inert give two inert factors; 3 inert and 29 split give one. | Level/sign tests pass; propagation of §1.5(iii) requires S01. |
| §1.8; rank-four Hecke pseudocharacter | T(1)=4; diagonal trace 10 equals −coeff₁ of det(1−MX), not −coeff₃=50. Modulo the coefficient ideal both traces agree in the quotient, not necessarily in Λ_D. | Frobenius-polynomial convention passes. |
| §1.9; lattice lower bound | DVR model ord(J)=2 and spanning: required Selmer length ≥2; length1 fails. Split orbit gives only length≥0. | Uses the repaired non-split/faithful-block input. |
| §1.10; SU two-variable containment | DVR model Ch=(ϖ³), L=ϖ² gives (ϖ³)⊆(ϖ²), equivalently 3≥2; length1 violates it. Adding inert Euler valuation1 changes analytic valuation2→3. | Endpoint direction passes; proof must handle S01's primes. |
| §1.11; cyclotomic specialization | 11a1,p=5: rational 5-torsion gives a residual invariant line, so (irred) fails. At a surviving nonzero majorant p, specialization p↦p retains valuation1. | Exclusion and specialization orientation pass. |
| §2.1; semi-ordinary projector | Unit u: u^(r!)→1; U-eigenvalue p: p^(r!)→0. k=2 supersingular GL₂ roots have slopes 1/2,1/2, unitary slopes 0,0. Fixed two weight coordinates give dim Λ_so=3. | Semi-ordinary and ordinary projectors are distinct. |
| §2.2; semi-ordinary duals and boundary families | A²→A, (x,y)↦y: kernel rank1, cokernel0; zero map has kernel rank2, cokernel rank1. At p=5 the full torus algebra has 4 finite-character components, principal units only1. | Computations correct; only two Checks are supplied for these definitions (see S04). |
| §2.3; indexed rational Klingen families | Representation constituents have ranks 2+1+1=4. At a supersingular constituent, ordinary projection is 0 while the semi-ordinary construction is the nonzero source family. Interpolation threshold admits k=6, not the asserted range at k=4. | No claim of nonexistence at all smaller weights. |
| §2.4; triple-product pairing with denominators cleared | Pairings (1,0,1) have product0; (1,2,1) product2. At unramified prime2, ζ₂(2)²=16/9, triple factor16/81, adjoint factor512/729: raw local factor1/2. Removing it changes partial global factor by2, product unchanged. | All denominator and normalization tests pass; waived Ichino text not certified. |
| §2.5; rational Eisenstein ideal valuation bound | ord(L-product)=2: ord(E)=3 satisfies 3≥2, ord(E)=1 fails. Prime(ϖ) meets coefficient integers and is excluded. | No integral conclusion at (ϖ) follows here. |
| §2.6; CAP exclusion and pseudocharacter | Residual dimensions 1+2+1 sum4; trace identity at1 gives4. At p=5, scalar local determinant has even cyclotomic exponent, incompatible with weight2 determinant exponent1. | Modularity and CAP exclusion are separate inputs. |
| §2.7; localization at cyclotomic subring | A=O[[X,Y]]: A/(p),A/(X) become0, A/(Y) survives. Under p-inversion alone A/(X) survives. | Localizations differ as claimed. |
| §2.8; integral CLW function and p-inverted bound | At p=3, u/3 and u have same rational ideal but valuations −1 and0. Conductor7 has φ=6 divisible by3; conductor5 has φ=4 a unit. | Gap is needed in the stated exceptional integral cases. |
| §2.9; fixed highest weight, sufficiently regular classicality | U(2) coefficient rank a₁−a₂+1=k−1 gives ranks1 and3 at k=2,4. A scalar rank1 module cannot be that rank3 module. | Vector-valued control is substantive; regularity bounds retained. |
| §2.10; vector-valued rational family | (k,m)=(4,1) gives (1,−1,−1;κ+1); (4,0) fails m≥1. At (2,0,6): Γ(5)Γ(6)=2880, i^−5=−i, scalar −2880i·2^−17π^−11. Translation/inverse conjugation with a=4,b=7 gives7/4, not28. | Direction and archimedean factor tests pass. |
| §2.11; factorization and two-denominator integrality | In ℤ_p[[Y,Z]], v_(p)(1/p)=−1 and v_(Y)(1/Y)=−1. Disjoint allowed pole sets exclude both; identical allowed pole Y does not. h_(−23)=3 contributes valuation1 at3. | Integrality now follows after construction/factorization. |
| §2.12; joint height-one avoidance | (X,Y) has height2; neither X nor Y is a unit, but no height-one prime contains both. X,X² share (X). At Y=0 the first pair becomes X,0. Constants 1/(k−1) at k=2,4 are1,1/3. | Joint avoidance is weaker than a unit, stronger than nonzero values; p-inversion matters at k=4,p=3. |
| §2.13; removing cyclotomic primes | L=X+Y restricts toY, μ=0, with Y coefficient1. X−p restricts to−p, μ=1, and lies in pulled-back (X−p). | Does not infer avoidance in the second case. |
| §2.14; FW Greenberg divisibility | L valuation2 and Selmer length3 give 3≥2; length1 fails. Prime(X−p) is excluded in the first form and needs the separate stronger form. | Direction and localization checked. |
| §2.15; CW/FW BF definitions | CW at p=3: p>3 false. FW with D_K coprime N: required ramification at ℓ\|N false. 11a1 at5 is residually reducible. | S03 identifies a consumer outside both branches. |
| §2.16; reciprocity with fractional congruence targets | η=ϖ: target ϖ⁻¹Λ contains1/ϖ, Λ does not. Cokernels 0 and Λ/(X,Y) have no height-one support; Λ/(X) has length1 at(X). | Fractional targets and pseudo-nullness are essential. |
| §2.17; rank-one BF formulation | Sel=Λ and class f≠0 give quotient Λ/(f), Ch=(f). Zero class leaves rank1 and extended Ch=0. Ideals(p),(1) agree rationally but differ by valuation1. | Rank and integral assertions cannot be dropped. |
| §2.18; auxiliary-field splitting | D=−7,−3 give residues1,5 mod8: split/inert at2; D=−4 ramifies2. (−7/5)=−1, (−91/5)=1, while both fields ramify7. | All listed numeric splitting controls pass. |
| §2.19; Yager two actions and bounded exponential | At p=3, a³=a+1 in 𝔽₂₇. y(a)=(a,a+1,a+2); coefficient Frobenius and e_(τ²)-translation both give(a+1,a+2,a). Inverse-index sum gives unequal translates. Tr(1)=3; trace1 generators pass. | Correct coefficient ring and action orientation; a bound p⁻ᵐ remains visible before rescaling. |
| §2.20; crystalline-short and analytic complexes | Over E⟨X⟩, C=[A —X→ A] has H⁰=0, after X=0 H⁰=E via Tor. Repeated roots yield E*(f_α)=0; division by that period is invalid. k=2 repeated-root case is excluded by the cited source result. | Derived and p-irregular distinctions retained; gap's wider level range is conditional. |
| §2.21; ordinary FW reverse bound | Unipotent off-diagonal1 gives quotient ℤ_p; off-diagonal p gives ℤ_p⊕𝔽_p. Λ/(T²) has (μ,λ)=(0,2), Λ/(p) has(1,0). | Integral image condition and p-part cannot be inferred from λ. |
| §2.22; Wan ordinary rational bound | Ideals(p),(1) become equal after p-inversion. If every level prime splits in K, the required nonsplit witness count is0 rather than≥1. | Properly excludes that datum. |
| §3.1; residual hypotheses | Split distinct characters have End=𝔽×𝔽, dimension2; nonsplit distinct extension has dimension1; scalar split has End=M₂(𝔽), dimension4. Unramified X²+2 over 𝔽₅ has End=𝔽₂₅. | A2.1 and N3 are not identified. |
| §3.2; CI finite-free R=T over regular Λ | O[[x,y,z]] has dimension4. Adjoin t with t²−x²: finite rank2, dimension4, embedding dimension5, so singular but reduced for odd p. O[t]/t² is finite flat and nonreduced. | Reduced/CI/finite-flat do not imply regular. |
| §3.3; density of good points with possible twist | At p=5 the allowed quadratic twist is ω², whose values square to1; crystalline-short weight interval is2≤k′≤5. Reducible local residual input selects ordinary branch, not irreducible short branch. | Domain/twist distinction retained. |
| §3.4; graded determinant and full local corrections | [A —d→ A] in degrees0,1: Det image dA, inverse d⁻¹A; d=ϖ gives valuations1,−1, d=0 no acyclic trivialization. A/(x,y) over k[[x,y]] has Ch=A but Fitt=(x,y). | Determinant orientation and nonvanishing hypotheses pass. |
| §3.5; local–global tensor and essential vector | Empty away set gives coefficient factor T, tensor unit. Unramified generic principal series at K₁(ℓ^m) has dimensions1,2,3 at m=0,1,2. | Rank-one invariant line belongs at conductor exponent only. |
| §3.6; completed-homology zeta construction | k=2 coefficient W has rank1 and trivial action; tensor takes coinvariants. At j=0 and cyclotomic augmentation, c²−c²σ_c maps to0, not a unit. | Cannot universally unsmooth by inversion. |
| §3.7; universal map, derived specialization | C=[k[[X]] —X→ k[[X]]] in degrees1,2: H¹=0, reduced H¹=k, Tor₁=k. Split unramified characters1,2 over 𝔽₅ give End dimension2, not1. | Both previous repairs exclude the wrong cancellations. |
| §3.8; classical specialization | Empty Σ₀ product1 gives z(f). One Steinberg prime gives1−a_ℓu of degree1; unramified quadratic polynomial has degree2. | Euler correction and degree are not interchangeable. |
| §3.9; primal versus dual zeta line | Two scalars2,3 in split étale fibre: norm6; dual/primal product lattices6A and(1/6)A. Zero map determinant0 gives no fractional trivialization. | Norm and nonzero-component conditions retained. |
| §3.10; generalized MC predicate | t(e)=1 gives imageA; t(e)=ϖ givesϖA; t(e)=γ−1 has augmentation0. A/(x,y) has divisor0 but nonunit Fitting ideal(x,y). | No fraction-field or Fitting substitute for the integral line. |
| §4.1; integral dual trivialization | t(e)=ϖ gives dual imageϖ⁻¹A, not contained in A; t(e)=1 gives both imagesA. | Tests the direction of integrality. |
| §4.2; local specialization at an étale point | Local evaluation X↦0 sends1+X↦1 unit andϖ↦ϖ nonunit; a nonunit cannot map to a unit under a local map. | Unit-specialization argument passes after integrality. |
| §4.3; restriction-of-scalars determinant | T-rank2 and Λ-rank(T)=2 give Λ-rank4. Norm(ϖ,ϖ⁻¹)=1 despite one nonintegral factor. | Unit norm alone is insufficient, but individual integrality is retained. |
| §4.4; removal of local Euler singularities | T/T has removable value1 at0; 1/T undefined there; T/1 has value0. | Three possible behaviours distinguished. |
| §4.5; pointwise FW theorem | Scalar inertia determinant ω^(2a) cannot equal ω at p=5 (2a=0 or2 mod4) or p=3 (2a=0 mod2). | Parity exclusion is valid; no BSD comparison claimed. |
| §4.6; specialization with local/Tor corrections | C=[A —X→ A] gives new H⁰=k at X=0 and Tor₁=k; ignoring Tor gives0. Euler1−α atα=1 is0. | Retaining cones/derived base change is necessary. |
| §4.7; congruences of zeta morphisms | Euler polynomial mod5: 1−6u+11u² becomes1−u+u²; at u=1 both values reduce1. Reversing reciprocal Frobenius need not preserve coefficients. | Tests coefficient reduction with Euler factors retained. |
| §4.8; residual map and η components | 1−γ=−T is nonzero nonunit in𝔽[[T]]. e₊=diag(1,0),e₋=diag(0,1) over 𝔽₅; residual base-change example gives0→k. | S04 replaces repeated theorem assertions with these controls. |
| §4.9; μ=0 and residual nonvanishing | Λ/(T²): residual dimension2, ϖ-torsion0, λ=2−0=2. Λ/(ϖ): residual vector dimension∞, μ=1. | Second case excluded from the finite residual formula. |
| §4.10; λ-defect propagation | Λ/(T),Λ/(T−p) both haveλ1 but ideals differ. For Λ/(ϖ), both residual terms are infinite-dimensional; ∞−∞ is not a λ computation. | μ=0 and one-sided bounds are essential. |
| §5.1; Fujiwara minimal datum | p=5:19≡−1,19²≡1; the exceptional induced type can occur only in the first residue-cardinality case. Restriction of an induced local representation to inertia splits into its two inducing characters. | Correct exception is not irreducibility on inertia. |
| §5.2; integral congruence generator | T={(a,b):a≡b mod5}; e=(1,0) not inT, ℓ=(5,0) inT, ℓ²=(25,0)=5ℓ. Periods10/5=2,10/10=1,10/25=2/5. | Integral generator is not an idempotent. |
| §5.3; primitive anticyclotomic input | q=113 gives12915/12769, v₇=1. X+Y restricts toY andX, bothμ0; ϖ(X+Y) givesμ1; X restricts to0 at one place. β(3(γ−c))=0 while3≠0. | Local repair passes; build order remains S02. |
| §5.4; normalized Hilbert family | Raw2 times scalar3 gives6, not18 or2. Boundary pair(0,1) passes first-cusp-only test but fails all-cusp divisibility. | Normalization/all-boundary tests pass. |
| §5.5; general-CM auxiliary unit input | F=ℚ(√29), M=Fℚ(√−7): relative discriminant norm49; at23,29=11² and−7=4². F=ℚ(√3),M=ℚ(ζ₁₂): norm144/12²=1. | Δ+ accepts first, rejects second despite split p. |
| §5.6; coefficient Eisenstein ideal | Identity ℤ map: differences7−7=0,8−3=5,2−1=1 give ideals0,(5),ℤ. ℤ→ℤ/5 with equal operators has Hecke ideal0 but coefficient contraction(5). | Kernel and contraction directions pass. |
| §5.7; congruence length via nonzero Fourier coefficient | ord(L)=2 demands ord(E)≥2; ord(L)=0 allows equality0. k[y]→k(y) misses1/y. | Localization and nonzero denominators are necessary. |
| §5.8; rank-four polarized extension | Residual block dimensions1+2+1=4 versus two-character rank2. In A=ℤ, localize(6) at(2): becomes(2), contraction(2)≠(6). | No suppression of scalar term or global contraction. |
| §5.9; exceptional pulled-back primes | Primitive analytic valuation0 plus Euler1 gives1; primitive Selmer length2 plus local1 gives3≥1. Dropping the arithmetic correction in length0 case gives0≥1 false. | Correct matching-Euler repair pattern for S01. |
| §5.10; Hilbert-family divisibility, p≥5 | Weight2 and weight6 agree mod4 at p=5; weight6 meetsκ₀>2. For unramified F at5, [F(ζ₅):F]=4>2; at3 degree2 admits the excluded stabilizer possibility. | Does not invoke weight-two period theorem or p=3 extension. |
| §5.11; arithmetic specialization | Pseudo-null A/(p,T) has Ch=A, but specialization atT=0 gives(p); finite-flat singular CI of §3.2 has dimension4, embedding dimension5. | Neither kernel base change nor regularity is automatic. |
| §5.12; quartic-CM input | [F:ℚ]=2, empty n⁻ has0 prime factors and0≡2 mod2; a single inert factor gives1≠0. | Empty product is admissible, one inert prime is not. |
| §5.13; auxiliary local types | ℓ=19 inert in real quadratic F givesq=361≡1 mod5; split would give19≡−1. ℓ=11 split givesq=11≡1. K=ℚ(√−7) ramifies7, disjoint from D_F. | Field conditions discharge the stated exceptional local test. |
| §6.1; fixed-form ordinary equivalence | E=11a1,p=3,K=ℚ(√−2): a₃=−1 unit;−8≡1 mod3; gcd(8,11)=1. Frobenius at5 squared has polynomialX²+1 irreducible mod3; inertia11 nontrivial. | S03: this input has no §2.15 branch. |
| §6.2; quartic restriction inequality | (ϖ³)⊇(ϖ²)(ϖ²)=(ϖ⁴), since3≤4. Replacing both factors by(ϖ) would require3≤2, false. | Direction passes. |
| §6.3; rational analytic factorization | p·L₁L₂ versus L₁L₂: same ideal after p-inversion, valuation difference1 integrally. | No integral period comparison is silently inferred. |
| §6.4; auxiliary-field existence conditions | D_K=−7≡1 mod8;29≡1 mod7 and−7≡14² mod29. At2, residue5 mod8 would be inert, not split. | Selected splitting examples satisfy the local dictionary; no algorithm promised. |
| §6.5; Greenberg μ vanishing | L=T hasμ0, restriction T=0 is0, so converse fails. L=S+T restricts toS withμ0 and itselfμ0. μ(f²)=2μ(f). | Direction and square normalization pass. |
| §6.6; product divisibility | At(ϖ), Greenberg-product valuation0 and Selmer-product length≥0 ensure containment. If analytic valuation1 and Selmer0, it fails although p-inverted ideals agree. | μ0 removes precisely the missing p-prime. |
| §7.1; integral quadratic twists | χ(g)=−1 gives action−ρ(g), twisting twice returnsρ(g). Unit root α→−α keeps valuation 0. Multiplication byp onℤ_p² has cokernel𝔽_p². | Rational comparison alone is insufficient. |
| §7.2; integral C₂ Selmer decomposition | On regular C₂ module with basis1,c at oddp, e±=(1±c)/2 give rank1+rank1=rank2 and e₊e₋=0. Atp=2,1/2 not integral. | Odd-prime restriction and discrete Shapiro carrier retained. |
| §7.3; cyclotomic characteristic inequality | A=O[[X,Y]],M=A/(p,Y): Ch_A=A; afterY=0,Ch=(p), hence(1)⊇(p). M=A has positive rank and extended Ch=0. | Nonzero majorant and direction pass. |
| §7.4; period-normalized factorization | Area a, multiplier d=deg/c²: numerator da. Period a/√|D_K| gives ratio d√|D_K|, not d. At p∤2D_K this ratio is a unit; rescaling byp adds valuation 1. | Square-root normalization explicitly retained. |
| §7.5; four-factor lower bound | Analytic valuations1+2+0+3=6; characteristic2+2+1+3=8, giving(ϖ⁸)⊆(ϖ⁶). Product equality(ϖ)(ϖ)=(ϖ²)(1) does not identify factors. | Factor separation needs individual opposite bounds. |
| §7.6; twist preservation of(im) | Unit transvectionU has cokernel(U−1)=ℤ_p; U²−1=2(U−1) has same cokernel for oddp. Off-diagonalp givesℤ_p⊕𝔽_p. At2 squaring multiplies by nonunit2. | Integral rank-one condition survives only with the stated prime restriction. |
| §7.7; Kato bounds with saturated coefficients | Zeta imageϖA⊂A has length 1; replacing image by its saturation A loses1. Euler1−1/11=10/11 has v₅=1; scalar r_E=p loses one more p-valuation. | Gap must compare lattices/cones, not erase the zeta index. |
| §7.8; cancellation in normal-domain divisors | Individual defects d_i=b_i−a_i≥0, sum d_i≤0 force all d_i=0. Without individual inequalities,(1,−1,0,0) sums0 but does not vanish componentwise. | Correct algebraic cancellation; not a Lean headline/padding surrogate. |
| §7.9; rational BCS endpoint | Ch=(p),L=1: rational ideal equality, integral valuations1≠0. p=5 satisfies p>3; p=3 fails. | Endpoint does not claim integral equality here. |
| §7.10; integral BCS endpoint with(im) | y²=x³−4x+7: #E(𝔽₃)=7,#E(𝔽₅)=4, traces−3,2; Frobenius3 discriminant2 mod5. Δ=−16·11·97,−c₆=6048≡9 mod11, giving split multiplicative reduction and unit transvection. | Includes a genuine nonunit Euler factor, hence needs the declared saturated comparison. |
| §8.1; aggregation of endpoints | Rational(p)=(1), integral valuations1 versus0. Unit/off-diagonalp transvections give ℤ_p versusℤ_p⊕𝔽_p. | No strengthening beyond the separate hypotheses. |

### Lean declaration/context ledger

| File region | Section / variable / instance context | Declarations and instantiated values |
| --- | --- | --- |
| Suggested.lean:1–62 | One import Mathlib; empty namespace TauCetiRoadmap.AutomorphicCongruences; no variable, include, instance or section binders | 0 definitions, 0 theorems, 0 instances, 0 admitted data. There is no elaborated signature to compare and no one-tactic padding probe to run. |

The headline list is §§1.10–1.11, 2.7–2.8, 2.14, 2.20–2.22, 4.3, 4.5, 5.10, 6.6, 7.9–7.10, collected in §8.1. The docstring also names the owned deep intermediates §§0.7, 2.4, 2.6, 2.12, 2.19, 3.2 and 3.7. Generic continuous H¹, fitting ideals and classical elliptic curves do not supply the specific Iwasawa Selmer, automorphic-family, regulator or zeta carriers in these statements. No missing statable headline was established by the pin search; §7.8 alone is algebraic cancellation and would be padding if used as a substitute.

## Verified sound

Read counts: **2,356 README lines, 62 Lean lines, 92 numbered target blocks, 312 README Check bullets, and all 20 earlier findings**. The ledger records **92 computed target-level test sets**, including positive/negative controls and boundary calculations; these are not 92 proofs of the deep targets. The Lean declaration count is **0**. The requested `#check @name` ledger is empty, so no Lean command was run, consistently with the read-only/no-build instruction.

**28 explicitly named pinned APIs** in the two library contracts were located at the actual manifest revisions (S05); mathematical signatures were inspected for the nontrivial comparisons. In particular:

| Pinned witness | What it supplies and what it does not supply |
| --- | --- |
| Mathlib/RingTheory/Ideal/Quotient/Operations.lean:89, :93, :133 | RingHom.quotientKerEquivOfSurjective, its value on quotient classes and Ideal.mk_ker; surjectivity remains an argument, not a consequence of equal Hecke eigenvalues. |
| Mathlib/RingTheory/Ideal/Maps.lean:43, :47, :80, :185, :654, :750, :769 | Extension, contraction, membership, span/product extension, kernel and kernel contraction. A map need not preserve arbitrary kernels under specialization. |
| Mathlib/RingTheory/Ideal/Span.lean:100 | Unit multiplication preserves a principal ideal. The 2-versus-3 test at p=3 distinguishes it from nonunit rescaling. |
| Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:334 | Reciprocal coefficient 1 equals minus trace, including empty index type (both 0); no index-reversal ambiguity. |
| Mathlib/RingTheory/Length.lean:30; Mathlib/Algebra/Module/LocalizedModule/Basic.lean:88 | Extended natural module length and native localization; finite length is not silently built into either carrier. |
| TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:708–727 | Continuous H¹ is Z¹ modulo B¹ on a topological monoid and continuous module action. It is used as an additive group; its pointwise quotient topology is not the discrete topology or an Iwasawa coefficient module. |
| TauCeti/RingTheory/FittingIdeal/BaseChange.lean:127–135 | Fitting base change for finite modules over commutative coefficient algebras. It does not turn Fitting ideals into invertible determinant lines. |
| TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:952 | Point-level equivariance twisted by the quadratic character. Passing to Tate inverse limits and matching ordinary conditions is still an adapter target here. |
| TauCeti/NumberTheory/Multiquadratic/MultiquadraticSplitting.lean:199 | Finite radicand family; odd prime avoiding every radicand; complete splitting iff every Legendre symbol is 1. It does not handle p=2 by the same formula. |
| TauCeti/NumberTheory/Multiquadratic/Galois/Basic.lean:190; TauCeti/NumberTheory/Multiquadratic/Prime/Discriminant/Basic.lean:50 | Galoisness requires 2≠0; oddPrimeDiscriminant has a total if-definition, so prime-specific formulas require odd primality (at p=2 it returns −2). |

**Source locator audit: 30 locator groups directly inspected**, listed below. A group may include consecutive named equations or a theorem with its proof. This count is not a claim that all references in the bibliography have been independently certified.

| Source / locator group | Text witness and result |
| --- | --- |
| SU Lemma 4.3.10 | SU lines 2027–2055: spanning hypothesis precedes the Fitting bound. |
| SU Lemma 4.3.11 | SU lines 2058–2069: alternative irreducibility gives faithful character block. |
| SU Proposition 4.5.6 and Corollary 4.5.7 | SU lines 2282–2293: missing spanning step is the repaired source error. |
| SU Theorem 7.3.1 | SU lines 4017–4034: author-version number, rank-four setting and irreducibility alternative. |
| SU Theorem 12.3.1 | SU lines 8535–8555: Σ is any finite superset of the required bad places; ordinary integral interpolation. |
| SU (12.3.5.b) | SU lines 8642–8659: explicit removed Euler product; the claimed zero μ is not valid for arbitrary nonsplit additions. |
| SU Proposition 12.3.6 | SU lines 8661–8683: unrestricted pulled-back-prime claim, S01. |
| FW Theorem 1.6 | FW lines 293–307: residual irreducibility, Steinberg witness and ordinary distinctness. |
| FW Assumption 2.1 and remark | FW lines 923–929: the scalar-endomorphism inference fails for split distinct characters. |
| FW Lemma 3.17 and Definition 3.18 | FW lines 1769–1786: derived perfectness and the Σ-partial line. |
| FW Theorem 5.1 | FW lines 4016–4033: p≥3 and the conditional nontriviality of μ. |
| FW Theorem 7.32 | FW lines 5717–5746: first bound excludes pulled-back primes; the stronger local type supplies the full bound. |
| CLW Theorem 8.2.1 | CLW lines 6217–6248: cyclotomic localization, integral L-function under character distinction, additional p-inverted bound. |
| LZ14 Proposition 3.6 | LZ14 lines 439–459: coefficients in the completed selected unramified tower; inverse-limit topology. |
| HT94 Theorem 0.1 | HT94 lines 114–132: characteristic-series divisibility after rationalization. |
| HT94 Theorem 0.2 | HT94 lines 133–146: Katz-to-congruence divisibility, distinct from 0.1. |
| NAK (68)–(76) | NAK lines 3151–3239: classical comparison and motivic-structure maps. |
| NAK (77) | NAK lines 3408–3422: change of Σ, not equation (79). |
| NAK Theorem 5.7 | NAK lines 3445–3456: equivalence of residual nonzero and modular μ=0. |
| NAK Theorem 5.10(4) | NAK lines 3467–3478: rational rank-one τ condition for the nonmodular-point one-sided bound. |
| NAK (93) and proof of Theorem 5.13 | NAK lines 3654–3675: μ=0 hypothesis, residual length formula and the final H¹/H² misprint. |
| Wan-2015 Definition 85 / Theorem 86 | Wan-2015 lines 3532–3576: imprimitive notation requires the correction; the printed weight/prime range is retained or separately justified. |
| Wan-2015 Lemma 87 | Wan-2015 lines 3577–3594: nonsplit Euler factors at pulled-back primes, supporting the repair of S01. |
| BCS (v2) Theorem 3.2.1 | BCS lines 336–357: quartic-CM input and full hypotheses. |
| BCS (v2) Theorem 4.1.3 / Corollary 4.1.4 | BCS lines 389–410: both directions, integral form and product version. |
| BCS (v2) Proposition 5.2.1 | BCS lines 479–500: all six conditions on the auxiliary real quadratic field. |
| CGS23 Theorem 3.1.1 | CGS23 lines 830–856: actual BF class and two injective regulator maps with pseudo-null cokernel. |
| CGS23 v2 Remark 2.2.3 / Proposition 2.2.4 | CGS23 v2 lines 390–422: √|D_K| normalization omission and mistaken remark number. |
| BCS (published) Theorem 1.1.2 | BCS published text lines 63–73: integral endpoint uses the free rank-one quotient (im), not an unqualified large-image condition. |
| BCS (published) (5.3)–(5.4) | BCS published text lines 569–590: product bound, opposite Kato bounds, and factor separation. |

For BCS, the published author copy was fetched through the sources service at its legal author URL, reusing the existing key BCS. The manuscript and published extractions are distinguished above; their line numbers are not interchangeable. No source passage was copied into the package, and sources.toml was not edited.

**Supplier and ownership checks.** Current files were resolved for **34 named supplier roadmaps** (4 on main/completed, 30 at open new-roadmap heads); the additional KatoEulerSystems contract has the limitation below. **36 specific supplier sections** were checked at the body/scope level: PadicFamilies §§0.17, 4.0.1–4.0.3, 4.9; GlobalGaloisDeformations §§3.7–3.8, 4.1; DeformationAndDerivedPatchingAlgebra §§3.1, 3.4, 6.2, 7.3; PadicMeasuresIwasawaAlgebras §§4.6, 5.1; CompletedCohomologyAndLocalGlobalCompatibility §§4.7, 6.2; SelmerIwasawaCohomology §§2.1, 2.8, 2.21, 3.1, 3.12, 3.20; ArithmeticGaloisDuality §§R02.4.3, D7.3, D7.5; PhiGammaModulesAndIwasawaCohomology §§4.4–4.5, 5.4; IntegralHeckeAndGaloisDeterminants §§1.3, 3a.1, 5.3; PadicLocalLanglandsForGL2Qp §§5.8, 5.11; AutomorphicBundles §§B5.1a, B5.14–B5.15. Remaining section labels were checked through current headings and resolver output, not certified as complete mathematical adapters.

The ownership search by object covered the provided open-head index, main, completed roadmaps and board packages: Yager modules, three-block lattices, triple products, p-irregular functions, Beilinson–Flach classes, Klingen families and Fourier–Jacobi coefficients. The existing ordinary-control and single-family regulators remain PadicFamilies' objects. SiegelModularForms §4.3 (TauCetiRoadmap/SiegelModularForms/README.md:789) concerns symplectic classical Klingen series, not these unitary p-adic families. BianchiModularForms' stated arithmetic scope is weight two and does not supply the p-irregular family construction. The rank-two Ribet machinery is not the 1+n+1 theorem. No duplicate fully qualified Lean name exists here because this package declares none. No ownership move to a later roadmap was needed.

All **17 gap slugs, suppliers and needs strings** match between README and plan.json. Each has a named supplier, and the inspected existing interfaces do not already supply the requested extended domains. They remain conditional contracts, including the newly assigned p-irregular suite; their absence from today's supplier is not a finding.

Mechanical dependency check, run again against the unchanged README and supplied merge order:

```text
depcheck: 186 roadmaps, 1165 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. This roadmap-level check does not detect the internal forward edge S02. The requested git diff reports 11 changed files, all in packages/AutomorphicCongruences. The review changed only its report; README, Lean, plan, source manifest, toolchain and git state were not edited. No Lean build, git write, issue/PR write or external message was performed. The Lean file has one import Mathlib, no declarations, no set_option and no admitted data.

## Not verifiable

- Ichino2008, Ikeda1994, Harris1984, Rubin2000 and BST19 are settled as waived, and Hung2017 is settled as uncertified. Their theorem locators remain conditional source citations; their text was not requested again. In particular, the full Ichino constant, Harris's general exclusion, Ikeda's density hypotheses and Hung's period comparison are not independently certified here.
- KatoEulerSystems is explicitly allowed in the supplied merge order, and the earlier repair report says the resolver miss was a board-package lookup limitation. At this head the package is absent from this checkout and from `roadmaps show`; the resolver again reports the missing name. Historical unsubmitted copies are not evidence of the current supplier. Thus current Kato section/signature compatibility could not be re-certified, and the lookup miss alone is not raised as an ownership finding.
- BW's text, line 212, assumes tame level prime to the quadratic discriminant in its Bianchi setup; the declared p-irregular gap requests a broader level domain. Its extended-domain assertion is accepted only as that explicit supplier contract, not certified as already proved by BW. FW's use at a ramified level prime needs the broader contract.
- The remaining source locators beyond the 30 groups listed above were not individually certified in this pass. Their presence in the manifest is not a truth certificate. Likewise the supplier body checks listed above are narrower than the complete set of prose cross-references; successful resolution establishes a locator, not all its hypotheses.
- Boundary computations test logical consequences and conventions. They do not compute the actual characteristic ideals or central L-values of every automorphic example, nor certify the unproved declared gaps. No Lean elaboration was attempted; with zero named declarations there is no lost-binder question to resolve by #check.

## Source issues

- **Error** in SU at Proposition 4.5.6(ii) and Corollary 4.5.7, author-copy p. 61: the source says N′=0 yields the full congruence-ideal length bound; it should require orbit spanning or the appropriate faithful-block hypothesis; affects a stated result.
- **Error** in SU at Proposition 12.3.6 and its proof, author-copy p. 202: the source says arbitrary Σ-imprimitive functions avoid every pulled-back cyclotomic prime; it should retain the divisors of removed nonsplit Euler factors; affects a stated result.
- **Error** in Wan-2015 at Definition 85 and Theorem 86, pp. 69–70: the source says the Σ-imprimitive anticyclotomic function has μ zero; it should put μ zero on the primitive function and add nonsplit Euler valuations; affects a stated result.
- **Error** in FW at the remark after Assumption 2.1, p. 17: the source says the stated local exclusions force scalar endomorphisms; it should also exclude split distinct-character and non-absolutely-irreducible local representations; affects the proof.
- **Misprint** in NAK at the final display of the proof of Theorem 5.13, p. 84: the source says the subtracted residual term is H¹; it should be H², as in the preceding calculation and theorem; affects nothing.
- **Misprint** in CGS23 at v2 Remark 2.2.3, p. 7: the source says the Petersson numerator is degree divided by Manin-constant squared times Ω_E/K; it should also multiply by √|D_K| under the displayed area normalization; affects nothing.
- **Misprint** in CGS23 at v2 proof of Proposition 2.2.4, p. 8: the source says the period was defined in Remark 2.3.2; it should cite Remark 2.2.3; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c88704a74c3065e48c43496a3728a600dc9f2aa2", "job": "RT-AutomorphicCongruences~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
