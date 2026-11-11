<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13085#issuecomment-6789339081 -->
Review (codex) of f37ce59

Verdict: needs_changes

1. **F01** (P2) Noetherianity needs a nondegenerate rational span

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:256, §0.7: “for L of rank r ≥ n−1, Z(L) is noetherian.”

   **Claim:** Rank alone suffices, including a degenerate hyperplane. The conventions at line 27 define nondegeneracy separately; §0.2 permits finitely generated label modules.

   **Witness:** In nonsplit V = H ⊥ ⟨ϖ⟩ of rank three, L = Oe ⊕ Oa has degenerate Gram matrix diag(0,ϖ). Infinitely many distinct type-three vertex lattices contain L.

   Here h(e,f)=1, h(e,e)=h(f,f)=0, h(a,a)=ϖ, and F/F₀ is unramified, for example over ℚ₃. For every j≥0 put Λ_j = Oϖ^(−j)e ⊕ Oϖ^(j+1)f ⊕ Oa. Its Gram matrix is ϖ times the unimodular matrix with hyperbolic block and final entry 1. Consequently Λ_j^∨=ϖ⁻¹Λ_j, its type is 3, and L⊂Λ_j. Their distinct maximal strata are distinct irreducible curves contained in Z(L)_red by §0.4. A noetherian space cannot have infinitely many irreducible components. LZ line 320 explicitly assumes the rank-(n−1) rational span nondegenerate before Lemma 2.9.2, LZ line 555.

   **Exact repair:** State the rank-(n−1) Noetherianity conclusion for nondegenerate L⊗F, retaining the full-rank statement and the unrestricted construction of special cycles. Propagate this hypothesis wherever that conclusion is used. Add the displayed degenerate hyperplane as a negative-control Check. Its Gram determinant is 0, so the repaired hypothesis excludes precisely this witness; the rank-one nondegenerate example already in §0.7 remains included.

2. **F02** (P1) The F-characteristic polynomial is conjugate self-reciprocal

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:1378 and :1409, §§11.1 and 11.3: “integral self-reciprocal characteristic polynomial”; also the Check at :1421.

   **Claim:** A Rosati-unitary endomorphism has an ordinarily self-reciprocal characteristic polynomial over F.

   **Witness:** Multiplication by i on a CM elliptic curve with F=ℚ(i) is Rosati-unitary. Its F-polynomial is T−i; its monic reciprocal is T+i. Z line 2022 requires conjugate self-reciprocity.

   The distinction is explicit in the source: Lemma 7.13 concerns char_F; Remark 7.14, Z line 2035, concerns the ordinarily self-reciprocal char_ℚ. For the witness char_ℚ=T²+1. The degree-one polynomial is irreducible over F and F[T]/(T−i)=F is CM, so neither of the other hypotheses repairs the error.

   **Exact repair:** Use “conjugate self-reciprocal” throughout these targets, and define it for monic degree n by α(T)=bar(α(0))⁻¹·Tⁿ·barα(T⁻¹), with α(0) nonzero and α(0)bar(α(0))=1. Retain coefficients in O_F[1/d], not an unqualified O_F integrality claim. Add the T−i versus T²+1 Check. For T−i the corrected right side is −i(1+iT)=T−i; the ordinary reciprocal remains T+i.

3. **F03** (P2) The derivative-invariance converse fails for GL₀

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:1198 and :1205, §9.3: “constant on the orbit of γ exactly when Orb(γ, f′) = 0”; the third Check at :1213 repeats the unrestricted converse.

   **Claim:** The corrected transformation law implies this equivalence in every rank admitted by the roadmap.

   **Witness:** For n=1, γ=1 and the unit test function, GL₀ is trivial, ω=1, Orb(s)=1 and ∂Orb=0. The orbit is a singleton, but Orb(0)=1.

   This is a regular semisimple element for the rank-zero acting group. §§9.8 and 14.6 expressly keep n=1. The transformation law itself is correct: the term log|det a| is identically 0 on GL₀, so it cannot prove the converse.

   **Exact repair:** Keep the transformation law and the sufficiency of Orb=0 in all ranks. State the equivalence only for positive acting rank m (n≥2 in the group version), and state that invariance is automatic for m=0. Qualify the corresponding API bullet and Check. The witness then belongs to the automatic-invariance clause; for m≥1, a=diag(ϖ,1,…,1) has log|det a|=−log q≠0 and proves the repaired converse. This is a remaining boundary defect in the repair of prior F02.

4. **F04** (P3) The empty-divisor nonvanishing error remains in §5.3

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:715, second Check of §5.3: “differs by the nonzero class [O_(N(x))(−N(x))]”.

   **Claim:** The omitted self-Tor class is nonzero for every nonzero exotic label x.

   **Witness:** Take n=2, h(e,e)=1 and x=u⁻¹e. Then h(x,x)=−u⁻² has F₀-valuation −1, N(x)=∅ by §5.1, and both proposed classes are 0.

   **Exact repair:** Include the empty case, where C(x) is acyclic and both tensor products have class 0. Make the discriminating nonzero calculation on a specified nonempty Cartier cycle and in its supported group: localization at a generic point of the divisor detects the positive length of the invertible O_D-module O_D(−D). Keep the zero-label complex and linear-invariance theorem unchanged. Testing the repaired Check on x=u⁻¹e gives 0=0, not a claimed nonzero difference. Prior F07 was repaired in §0.5, but its pattern was not eliminated from the package.

5. **F05** (P3) Residue cardinality three does not determine the local field

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:1276, last Check of §9.8: “with equality q = n = 3 only for F₀ = ℚ₃”.

   **Claim:** q=3 forces F₀=ℚ₃ among finite extensions of ℚ₃.

   **Witness:** F₀=ℚ₃(√3) has Eisenstein polynomial T²−3, ramification degree 2 and residue degree 1. Thus q=3=n although [F₀:ℚ₃]=2.

   **Exact repair:** Replace the restriction by “p=3, residue degree one, and n=3, with arbitrary ramification degree.” Add this totally ramified quadratic example. The required inequality is still 3≥3≥3≥3, so §9.5(b) applies exactly as intended. The generalized low-rank theorem is repaired; this new Check is not.

6. **F06** (P2) The rational orthogonal branch consumes inputs outside their scope

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:1586 and :1595, §12.6a: “the criterion is §12.5(c)” and “through the orthogonal construction of §12.5(a)”.

   **Claim:** Those targets supply the orthogonal products and obstruction criterion for every signature (p,2), p≥1, asserted in §12.6a(d).

   **Witness:** For p=1 the output weight is 3/2 and input weight 1/2. §12.5 assumes n≥3, integral output weight n, input weight 2−n, and an underlying imaginary-quadratic hermitian space.

   The same failure occurs at p=2 (weights 2 and 0) and odd p=3 (weights 5/2 and −1/2). Even when p=2n−2, an arbitrary quadratic space is not part of the unitary data of §12.5. The sources do contain the broader mathematics: Bor98 line 2589, Theorem 13.3, p. 48, takes a general even lattice of signature (2,b⁻); Bor99 line 266, Theorem 3.1, p. 5, allows half-integral weights. Bor99 lines 382–391 separately handle finite-order characters in ranks one and two. Merely citing those results inside a proof route does not make the specialized targets export them.

   **Exact repair:** Own the general orthogonal Borcherds construction, its finite-order-character assertion, and the metaplectic obstruction criterion as explicit targets at this earlier location, with their full lattice, representation, weight and level hypotheses. Make §12.5 a unitary specialization and point §12.6a to the general targets. Alternatively, state those inputs explicitly as subtargets of §12.6a, with dependencies that do not invoke the restricted §12.5 theorem. Keep all p≥1 and all totally real bases. Verify the repaired interfaces at p=1,2,3 with the weight pairs above. The nonrational part of prior F04 is repaired, but the enlarged rational branch still has this proof-interface gap.

7. **F07** (P1) Rational GSpin varieties need not be noncompact

   **Location:** packages/GrossZagierAndArithmeticHeightsPartII/README.md:1586, §12.6a: “For F₀ = ℚ, M′_K is not compact”.

   **Claim:** Every quadratic space admitted by the rational branch gives a noncompact Shimura variety.

   **Witness:** Q=x²−3y²−3z² has signature (1,2) and is anisotropic over ℚ. An integral isotropic vector would have all three coordinates divisible by 3, contradicting primitivity.

   Indeed x²=3(y²+z²) implies 3|x, then y²+z²≡0 mod 3 implies 3|y and 3|z. Thus the adjoint orthogonal group has ℚ-rank zero and its neat arithmetic curve is compact. The target includes p=1. The isotropic form x²−y²−z², with vector (1,1,0), gives the contrasting noncompact case.

   **Exact repair:** Say that the rational branch includes both compact anisotropic and noncompact isotropic varieties, and apply its general Borcherds argument in both cases. Add the two ternary forms as a discriminating Check. Do not impose isotropy to repair the sentence: that would discard part of the theorem's generality. The corrected compactness distinction gives respectively no rational isotropic line and an explicit rational isotropic line on these two examples.

Seven findings: five blocking (P1/P2), two P3. The pinned Lean elaboration and dependency check pass. The defects are in the mathematical prose and proof interfaces; the declaration-free acceptance file is appropriate at these pins. No package source file was changed during this review.

## Verified sound

The review read the four package files, all 107 target subsections and their dependency lines, the previous review and repair report, the package index, the overlap and citation leads, the four declared gap contracts, and the source passages listed below. The changed material was checked afresh. For unchanged material, the previous review was used only for its explicit numerical/computed adversarial rows, not its uncomputed assertions of soundness. The current report concentrates the table on the seeded targets, headlines, changed passages and findings, as required by the comment-size limit. These are tests and source comparisons, not a claim to have proved the roadmap's deep theorems.

### Verification of the ten previous findings

The ids in this table are those used by the repair report. None was marked not actionable.

| Previous finding | Repaired passage in README.md | Status and verification |
|---|---|---|
| F01: Petersson metric | §12.5, line 1535: “‖w‖² = −[w, w̄]/(4πe^γ)” | Repaired. On w=(1,i), the two pairings are 0 and −4; the norm is 1/(πe^γ)>0. The scaling and constant-shift Checks are correct. |
| F02: derivative orbit invariance | §9.3, lines 1194–1198: “∂Orb(a⁻¹γa, f′) = ∂Orb(γ, f′) − log|det a|·Orb(γ, f′)” | Partly repaired. The transformation law and nonsplit-unit-function consequence are correct. The added “exactly when” needs the positive acting rank in R03. |
| F03: transfer character | §9.3, line 1191: “η̃(x) = (−1)^(v_F(x))” | Repaired in the target, API and both copies of the gap. A norm-one unit has value 1; the alternative character in the Check changes −log 3 to +log 3 incorrectly. |
| F04: general Chow modularity | §12.6a(d), line 1584: “for every totally real F₀, ℚ included, and every p ≥ 1” | Partly repaired. Kudla–Millson, Betti vanishing and the small-rank pullback are now owned. The ℚ branch still invokes too-special inputs (R06) and has the false compactness sentence (R07). |
| F05: fixed-level Schwartz input | §12.5, line 1535: “an S_L^K-valued weakly holomorphic form” | Repaired. §12.4 also fixes K-stable L and places K′-fixed input at level K′. The representative-swap multiplicities are 2 versus 0 without this condition. |
| F06: general local base in low rank | §9.8, line 1269: “for a finite extension F₀ of ℚ_p, p odd” | The theorem is repaired. q=9 gives −log 9, not −log 3. The new equality-case Check has R05. |
| F07: empty self-Tor | §0.5 Check: “nonzero exactly when Z(x) ≠ ∅” | Repaired at the original location: valuation 1 gives O/ϖ; valuation −1 gives 0. The same error persists in §5.3, R04. |
| F08: regular versus strongly regular | §12.10 Check: “not regular semisimple” | Repaired. Its unipotent control has cyclic determinant −1, norm 6 and characteristic polynomial (T−1)³: regular in the augmented sense, not strongly regular. |
| F09: toroidal properness | Supplier contract, line 102: “§7.5 (its properness over the base when Σ is moreover complete” | Repaired in the contract, route and Needs. Zero fan gives G_m; complete rank-one fan gives ℙ¹. The supplier's current §7.5 is present. |
| F10: LZ pagination | §0.1, line 154: “pp. 8–10, for the lattice and formal-scheme conventions”; the Hom-space locator is now pp. 10–11. | Repaired. LZ line 295 begins §1.7 on p. 8; line 411 begins §2.2 on p. 11. |

### Seeded source audit

The source labels below refer to the legal cached editions recorded in sources.toml. Page numbers are the edition's printed numbers, not the extraction's physical page index. All fifteen seeded targets were opened. No additional author-flagged unverified locator was found. Lusztig76 remains the settled exception stated below.

| Target | Passage opened, theorem/section and page | Comparison with the package |
|---|---|---|
| 0.3 Unitary Deligne–Lusztig varieties | LZ lines 451–464, §2.5, p. 12; lines 986–1001, §5.3, p. 25 | Odd-dimensional hermitian space, dimension d and closed-stratum copies agree. The later Tate/Frobenius use has its separate dependency. |
| 0.8 Self-dual cancellation | LZ lines 582–595, §2.11, Lemma 2.11.1, p. 15 | Self-dual summand, integral complementary lattice and r<n are retained. |
| 4.4 Pullback of Y-divisors | LZ lines 2942–2961, Lemma 10.4.2 and Theorem 10.4.3, p. 67 | Exceptional multiplicity one and the self-dual-lattice containment condition agree; this uses the comparison geometry supplied earlier in Layer 4. |
| 7.6 Modified Krämer horizontal and vertical classes | K lines 1140–1217, Lemma 4.4, Definitions 4.5/4.7 and Lemmas 4.8–4.9, pp. 28–30 | The unimodular correction depends on ambient parity; the nonunimodular correction is 1. No identification of a virtual class with an effective subscheme is made. |
| 7.8 Krämer geometric Fourier bounds | K lines 1248–1308, Theorem 4.16 and its preceding support results, pp. 31–32 | The trace pairing and shifted dual are retained; the support bound is norm valuation ≥−1, not ≥0. |
| 8.3 Krämer analytic horizontal and vertical functions | K lines 3438–3450, Definition 8.1, p. 64; lines 3879–3887, Definition 9.2, p. 73 | Horizontal indicator sum and vertical remainder have the stated domains. The false negative-cone vanishing from the source is not imported. |
| 8.7 Krämer Kudla–Rapoport identity | K lines 160–162, Theorem 1.3, p. 4; lines 3976–4004, Theorem 9.7 and proof, pp. 75–76 | The modified density, including vertex corrections, is the analytic side. The failed hyperbolic reduction in the source is replaced by an owned target §8.6. |
| 11.3 Hecke fixed loci and characteristic decomposition | Z lines 1944–2045, Lemmas 7.10–7.15, pp. 34–36 | Local constancy, prime independence and open-and-closed components agree. Conjugation was lost from Lemma 7.13: R02. |
| 11.4 Virtual one-cycle from derived CM | Z lines 2047–2062, §7.6, pp. 36–37; lines 2385–2423, §9.1, pp. 43–44 | The filtration gives virtual dimension one, not a one-dimensional support assertion; proper support and rational graded projection are retained. |
| 12.2 Complex uniformization and CM fixed line | Z lines 2223–2269, §8.2, pp. 39–40; lines 2585–2597, §10.2, p. 47 | CM irreducibility, the unique negative eigenspace and cyclic-vector condition are retained. |
| 12.5 Unitary Borcherds products and criterion | BHKRY lines 3453–3543, Theorems 5.3.1/5.3.3, pp. 76–78; lines 4754–4797, Theorem 7.2.4 and metric, p. 102; lines 3024–3060, §4.2, p. 68; Bor98 lines 2589–2627, Theorem 13.3, p. 48; Bor99 lines 266–289, Theorem 3.1, p. 5 | The repaired conjugated metric and invariant level input agree. Positive multiples, constant coefficient and vertical corrections remain present. The unitary statements are not the general orthogonal inputs needed by §12.6a: R06. |
| 12.6a Orthogonal Kudla divisors and Chow modularity | YZZ09 lines 170–175, Theorem 1.3, p. 1150; lines 531–578, Proposition 3.1, pp. 1157–1158; lines 587–606, §4.1, pp. 1158–1159; KM90 lines 185–213, Theorem 2, p. 126; VZ84 line 1063, Theorem 8.1, p. 88, also inspected in the rendered scan; Bor99 lines 382–457, pp. 7–9 | General codimension-one theorem and pullback supported. The root computation fills the p=3 gap in YZZ09's written case split. The rational proof interface and compactness sentence require R06/R07. |
| 13.1 Unitary Siegel Eisenstein specialization | LZ lines 3363–3425, §§12.1–12.3, pp. 77–78 | Normalized induction, inducing character and the n/2 Levi exponent agree with the supplied Weil section. |
| 13.8 Unramified arithmetic Siegel–Weil | LZ lines 3855–3873, Theorem 15.5.1, p. 89 | Everywhere-unramified extension, split dyadic places, inert-admissible input, two split nonsingular tests and reflex-degree normalization retained. |
| 13.9 Modified ramified Eisenstein derivative | K lines 203–241, §1.3 and Theorems 1.4–1.5, pp. 5–6 | The coefficient −1/(q+1), log(q²), parity and coherent correction terms agree. This is a modified derivative, not the raw incoherent derivative. |

### Adversarial computations

The column headed values gives actual outputs on the two sides or an explicit admitted/excluded instance. “Retain” means no repair on that tested instance. Standing odd-residue, characteristic-zero, nondegeneracy and integrality assumptions were applied before computations: q=1, characteristic-p coefficient fields, a zero ring as a field, or a degenerate full-rank hermitian space are not silently admitted by those assumptions.

| Statement | Instances tried | Computed values on each side | Result / change |
|---|---|---|---|
| §0.3, seeded DL variety | d=0; d=1,q=3 | d=0: point, dim 0, H⁰ dimension 1. d=1: Fermat curve has genus 3 and 28 points over 𝔽₉; 1+9−6(−3)=28 | Retain. The wrong Frobenius sign would give −8. |
| §0.5, repaired self-Tor | rank-one valuations 1 and −1 | Nonempty: Tor₁=O/ϖ, length 1. Empty: Tor₀=Tor₁=0 | Original repair sound; propagated pattern R04. |
| §0.6 Euler convention | C=ℙ¹, O(D) restricted to C is O(−1) | χ(O_C)−χ(O_C(1))=1−2=−1=deg O(D) on C | Retain. Ordinary stalk lengths would be infinite. |
| §0.7, R01 | V=H⊥⟨ϖ⟩, L=Oe⊕Oa | rank L=2=n−1, det Gram(L)=0; for each j≥0, Λ_j^∨=ϖ⁻¹Λ_j, type 3, L⊂Λ_j | Infinitely many maximal components versus asserted Noetherianity; require nondegenerate span. |
| §0.8, seeded cancellation | r=0; n=2, unit line and complementary valuation 3 | r=0: same intersection. n=2: Int₂=Int₁=(3+1)/2=2 | Retain self-duality and integral complement. |
| §0.9 and §3.5 headline | rank one, a=1,3,−1,−3 | −D′(1)=1,2,0,0; geometric lengths 1,2,0,0. At a=3, D=1−X+X²−X³ | Retain. Unguarded (a+1)/2 would give −1 at a=−3. |
| §4.4, seeded Y pullback | n=1,q=3, label valuations 0 and 2 | Auxiliary multiplicities 1 and 5; subtract exceptional 1: 0 and 4=(q+1)·(0 and 1) | Retain multiplicity one. |
| §4.5 headline | same two lattices | ∂Den_Λ−Den=1−1=0 and 5−1=4; (q+1)Int_Y=4·0 and 4·1 | Retain. Auxiliary intersection 5/4 is not Y-intersection 1. |
| §4.6 and §13.5 parameter conversion | q=3 | log(q²)=log 9=2log 3; (q²−1)/(q+1)=8/4=2 | Retain the two different derivative conventions. |
| §5.1 and §5.3, R04 | unit vector e versus u⁻¹e | Norm valuations 0 and −1; exotic component counts 2 and 0. Empty case: both tensor classes 0, omitted Tor class 0 | Correct construction; repair nonzero-class Check. |
| §5.2 zero complex | q=3, type-four ℙ¹, deg ω=2 | χ(O)−χ(ω)=1−3=−2; replacing C(0) by O gives 1 | Retain zero differential and line term. |
| §6.8 headline | q=3, rank-two invariants (1,1),(1,3),(3,3) | Int=2,4,12; −D′(1)=2,4,12. In the last case 2((1+1)+(1+3))=12 | Retain outer factor 2 and inner bound j. |
| §7.6, seeded modified classes | unimodular n=3 and n=2; nonunimodular | Corrections α=0,1,1; at n=3,ℓ=1 cancellation correction 1·(1−0)=1 | Retain ambient parity; substituting ℓ parity would give 0. |
| §7.8, seeded Fourier bounds | ramified rank-one norm h(e,e)=1, q=3 | W_(≥0)=Oe, W_(≥−1)=π⁻¹Oe; trace dual of Oe is π⁻¹Oe. Self-dual vol(Oe)=1/√3, transform of 1_O is (1/√3)1_(π⁻¹O) | Shifted support bound survives; a hermitian-sharp dual would give the wrong support/volume. |
| §§8.3–8.4, seeded analytic functions | rank-three example, q=3, negative norm −π₀⁻¹ | Horizontal contribution 0; vertical partial integral 2q·vol(L♭)=6vol(L♭)>0; doubling measure gives 12vol(L♭) | Retain decomposition; source's negative-cone zero is false. |
| §8.7 headline | unimodular I₂,I₃; nonintegral lattice | Int=0,1,0 and modified ∂Den=0,1,0 | Retain corrections and vanishing domain. |
| §9.3 repaired conjugation | ℚ₃, swap matrix and conjugation by diag(3,1) | Normalized families 1 and 3^s; derivatives 0 and log 3; law gives 0−log(1/3)·1=log 3 | Transformation law repaired. |
| §9.3, R03 | n=1, γ=1, unit test | Normalized family 1; Orb=1, derivative 0, singleton orbit | Equivalence fails; positive acting rank required. |
| §9.3 repaired transfer character | γ=((−2,1),(−3,2)), norm-one scalar ξ | Raw family 1−3^s; natural ∂Orb=−log 3=−1·log 3. Alternative η̃χ with χ(ξ)=−1 gives +log 3 | Natural character is forced. |
| §9.5 Cayley boundary | n=q=3; n=3,q=5 | q+1=4 versus at most 4 forbidden residues gives no guaranteed choice; 6 versus 4 leaves at least 2 | Retain separate q=n input and unit denominator. |
| §9.8 repaired low-rank base | unramified quadratic F₀/ℚ₃, q=9, γ=((−4,1),(−15,4)) | γ²=1; v(−15)=1; Int=1; shells 0,−1 give 1−9^s and derivative −log 9 | Generalization repaired; log 3 would be off by 2. |
| §9.8, R05 | F₀=ℚ₃(√3), n=3 | e=2,f=1,[F₀:ℚ₃]=2, q=3^f=3; q≥p≥3≥n is 3≥3≥3≥3 | Repair field-identification Check. |
| §10.1 labels and coefficients | x/3; coefficient 2; residue degree 2 | Norm 1/9; cycle multiplicity 2 rather than support multiplicity 1; finite degree log 9=2log 3 | Retain rational generic labels and integral admissibility. |
| §§11.1,11.3, seeded/R02 | F=ℚ(i), unitary scalar i | α=T−i; monic ordinary reciprocal T+i; conjugate reciprocal −i(1+iT)=T−i; char_ℚ=T²+1 | Repair conjugation. |
| §11.4, seeded virtual cycle | arithmetic dimension 3, diagonal codimension 2; transverse component C | Dimension degree 3−2=1; [O_C] maps to [C] with multiplicity 1; a point class maps to 0 in Gr₁ | Retain virtual dimension, without bounding naive support by 1. |
| §12.2, seeded fixed line | h=diag(1,−1), δ=diag(i,−i), u=(1,1), then u=e₁ | Cyclic determinants −2i and 0; negative projections have norms −1 and 0 | Retain cyclicity; this reducible example tests its necessity, not the irreducible-CM assertion. |
| §12.4 repaired fixed level | swapped coordinates over ℚ(i), z=(0,1,2) | h(z,z)=−3; weighted norm-one divisor multiplicities 2 and 0 at equivalent representatives before K-invariance | K-invariant input removes the representative dependence. |
| §12.5, seeded/repaired metric | negative plane, w=(1,i); scalar a=2 | [w,w]=0; [w,w̄]=−4; norm 1/(πe^γ), scaled norm 4/(πe^γ) | Repaired. Wrong bilinear metric is identically 0. |
| §12.5 constant term | f=0; section of weight k=2 | Zero input: divisor/Green/k all 0. Metric change contributes 2log(4πe^γ); omitting m=0 leaves 2ĉ₁(ω̂) | Retain constant coefficient and normalized metric. |
| §12.6a(a),(b), seeded | degree-two base, p=4; p=3 and p=2 root controls | p=4 weight 3 and compact second-real-place obstruction. For p=3, (x₀;x₁)=(1;1) gives roots 2,0,0,−2,1,−1 and R=2; p=2 omits last pair and gives R=1 | p≥3 vanishing boundary verified; p≤2 uses pullback. |
| §12.6a(c), seeded pullback | φ₁(0)=φ₂(x)=1, x∈W; θ with sparse positive lattice | Excess coefficient c₁(L^∨)=−c₁(L) on both sides; θ_(1_(NΛ̂))(g_∞) tends to nonzero Gaussian value at 0 | Constant/excess sign and pointwise theta cancellation agree. |
| §12.6a(d), R06 | p=1,2,3 over ℚ | Output weights 3/2,2,5/2; input weights 1/2,0,−1/2; none meets §12.5's n≥3 integral-weight input | General orthogonal construction and criterion must be explicit. |
| §12.6a, R07 | x²−3y²−3z² versus x²−y²−z² | First: primitive isotropic vector count 0 by mod-3 descent, ℚ-rank 0, compact. Second: Q(1,1,0)=0, positive ℚ-rank, noncompact | Repair rational compactness assertion. |
| §12.6b and §12.7 | unitary n=2,3 over quadratic totally real base | Orthogonal signatures (2,2),(4,2); weights (2n−2)/2+1=2,3. Q=h gives index ξ; Q=Tr h would give 2ξ | New nonrational route and half-trace normalization agree. |
| §12.9 headline | φ(0)=0,1; Hodge degree d; denominator N=τ(Z^ℚ)[E:F] | Constant pairing 0 and −d/N; replacing reflex denominator by [E:F₀] gives −d/(2N) | Retain AFL degree normalization; proof still depends on corrected inputs. |
| §12.10 repaired regularity | h=3J, regular unipotent g, u=e₁+e₃ | det h=−27, h(u,u)=6, det(u,gu,g²u)=−1; characteristic polynomial (T−1)³ | Local Int has the larger regular-semisimple domain, as repaired. |
| §13.1, seeded induction | n=1,q=3, a=ϖ | Absolute value over F is 1/9; its n/2 power is 1/3=δ_P^(1/2), before the unit character | Retain normalized induction. |
| §§13.6–13.8 headline | n=3, tuple lengths 1 and 3; three obstructing places | Green bidegrees (0,0),(2,2); conjugate embeddings contribute I/2+I/2=I. Product s³A(s) has derivative 0, matching degree 0 | Retain degree, half-embedding normalization and higher-Diff vanishing. |
| §13.9, seeded modification | q=3; n=2 versus n=3 | c₀=−1/4; c₀log(q²)=−(1/2)log 3; multiplying (−1)^n gives respectively negative and positive correction | Retain logarithm and parity. |
| §13.10 headline | almost self-dual rank-one a=2; dual-vertex empty cycle | (∂Den_Λ−Den)/(q+1)=(5−1)/4=1=Int_Y; corrected derivative at forbidden dual vertex 0=empty geometric degree | Modified rather than raw derivative is necessary. |
| §§14.1–14.2 scale | a=1,ξ=−1; ∂J=1, Int_K−B=2, Int_B=3 | Ei(−4π)−Ei(−4π)=0; E♭=(2+2)+3=7=2+5, not 11 | Retain Green scale and coefficient one on ∂J_hol. |
| §14.5 headline | n=1,2,3,4; p=n=3 | Semi-Lie dimensions 0,1,2,3; low-rank Int=1,2 pairs with ∂Orb/log p=−1,−2; first global step has dimension 3 | Low-rank base avoids unsupported arithmetic modularity on curves. |
| Supplier properness | rank-one zero fan and complete fan | G_m has missing limit at 0; ℙ¹ supplies it | Complete-fan hypothesis propagated correctly. |

### Library, Lean and headline audit

Pinned revisions: Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5, read from the content manifest. Object searches covered the two pinned trees and the roadmap index, rather than just matching the proposed namespace.

| Pinned declaration opened | Location and what it supplies |
|---|---|
| `Polynomial` | Mathlib/Algebra/Polynomial/Basic.lean:69, finitely supported coefficients. |
| `Polynomial.eval` | Mathlib/Algebra/Polynomial/Eval/Defs.lean:248, evaluation through eval₂. |
| `Polynomial.derivative` | Mathlib/Algebra/Polynomial/Derivative.lean:47, the finite coefficient derivative. These three do not construct hermitian representation densities. |
| `IsNonarchimedeanLocalField` | Mathlib/NumberTheory/LocalField/Basic.lean:46, local compactness and the nontrivial valuation/topology compatibility on a field. No quadratic extension, hermitian datum or Haar normalization is selected. |
| Formal-spectrum `carrier` | TauCeti/AlgebraicGeometry/FormalScheme/Spf/Carrier.lean:73, open prime ideals. |
| Formal-spectrum `structureSheaf` | TauCeti/AlgebraicGeometry/FormalScheme/Spf/StructureSheaf.lean:262, the inverse-limit sheaf. Affine ingredients exist, but not the general formal-scheme/Rapoport–Zink moduli and supported Euler theory needed here. |
| `ChowGroup` | TauCeti/AlgebraicGeometry/Chow/Basic.lean:295, ordinary cycles modulo rational equivalence on locally noetherian schemes. It contains no Green-current or arithmetic-degree data. |

The eight headline theorems listed in the summary and in Suggested.lean are §3.5 unramified KR, §4.5 almost self-dual KR, §6.8 exotic KR, §8.7 Krämer KR, §13.8 unramified arithmetic Siegel–Weil, §13.10 modified arithmetic Siegel–Weil, §12.9 CM-series modularity, and §14.5 the strong AFL in its stated ℚ_p range. All eight are explicitly named in the module docstring with the missing carriers: Rapoport–Zink spaces and their special cycles/Euler theory, hermitian densities, integral unitary Shimura models and arithmetic Chow groups, Siegel Eisenstein derivatives, and Jacquet–Rallis orbital integrals. Simple definitions on the existing polynomial or scheme carriers cannot express these constructions. No statable headline was found omitted or replaced by a stand-in. The added orthogonal Chow-modularity target likewise needs the missing Shimura variety, special-divisor and automorphic-form structures.

`lake env lean` was run on packages/GrossZagierAndArithmeticHeightsPartII/Suggested.lean from the pinned content environment. It exited 0, with no output and no warnings. The file has exactly one import, `import Mathlib`, one module docstring, the prescribed namespace, and zero named declarations. Thus the every-declaration `#check @name` comparison and every-sorry one-tactic probe both have zero inputs, not an omitted sample. There are no sorry'd data, `set_option`, admitted examples, API-padding theorems or duplicate fully qualified declarations. No Tau Ceti object file needed building; nothing was left running.

Every backticked identifier attributed to a supplier was resolved as such. The four identifier leads from the resolver are roadmap exports, not asserted pin exports: `ClassicalAlgebraic.supportLocalization` and `.properSupports` occur in TauCetiRoadmap/EtaleCohomologyFoundations/README.md:443 and :567; `IntegralHermitianLattice.ofCarrier` and `HermitianLatticeInvariants.ofDualQuotient` occur in #851 TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:705 and :727. There is no backticked declaration attributed to this roadmap that Suggested.lean fails to declare; the remaining non-identifier spans are mathematical formulas and the manifest filename.

### Supplier, ownership and order audit

The following locations were resolved against main, the supplied current open heads, or the board package where the roadmap is not yet in that index. A range of sections below records an inventory, not a claim that a source citation substitutes for ownership. The two “roadmap absent” resolver leads were checked against the board package index and the actual board files before resolving them.

| Objects and supplier | Resolved repository location(s) |
|---|---|
| Unramified, almost self-dual, exotic and Krämer moduli, Hom spaces and signature comparison | packages/PELModuliPartII/README.md:426; :458; :594; :740; :941; :970; :1086; :1101, covering §§0.7, 1.1–1.6, 2.1–2.5, 3.3–3.7, 4.6, 5.1–5.3, 5.5, 5.7–5.8. |
| Global RSZ data, levels, Hecke and uniformization | Same file :1151, :1221, :1318, :1485, :1607, :1721, :1763, covering §§6.1, 6.5–6.8, 7.1–7.5, 7.10, 8.5, 9.3 and 9.5–9.9. Generic projection degree q+1 is not used as an integral finite-flat assertion. |
| PEL objects, complex points, Hom and Hecke | #966 TauCetiRoadmap/PELModuli/README.md:1309, :1638, :2069, :2924, :3116, :3766, §§M0.22, M1.3, M1.13, M3.4, M3.8, M6.1. |
| Grothendieck–Messing, Tate and covariant Dieudonné theory | #849 TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:2125 and :2143; #879 TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:988, :1858, :3389, :3698. Exact PD, mixed-characteristic and convention hypotheses are kept in the contracts. |
| Quasi-canonical lifts, orders, degrees and lifting lengths | packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:1299, :1328, :1378, :1402, :1468, §§6.1–6.2, 6.4–6.5, 7.1; #1487 TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:2944, §7.2. |
| Hermitian lattices and unramified densities | #851 TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:703, :769, :879, §§2.7, 2.9, 3.2. Conjugate-first forms are transported by H(x,y)=h(y,x); the ramified theory remains a declared extension. |
| Formal supported K-theory | #1741 TauCetiRoadmap/SchemeKTheoryOperationsPartII/README.md:169, :195, :228, :338, :406, :431, :467, :483, :526, :542, :579, :656, :672, :698, :741, :757, :775, the cited targets in Layers 0–4. Affine multiplicativity and resolution-property qualifications were read, not strengthened silently. |
| Scheme filtration and ordinary Chow operations | #1229 TauCetiRoadmap/SchemeKTheoryOperations/README.md:2811 and :3047, §§6.12, 7.7; main TauCetiRoadmap/SchemeAndStackFoundations/README.md:6902, :7045, :7065, :7318, §§5.1, 5.3–5.4, 5.7. |
| Scheme compact supports and cycle realization | main TauCetiRoadmap/EtaleCohomologyFoundations/README.md:439, :565, :613, :959 through :1089, §§0.7–0.8, F.2.5, F.4.1–F.4.6; #1313 TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:387, :435, :1652, §§2.4, 2.7, 7.19. Its inner-product theorem takes local KR as a premise, so it is not a circular proof of local KR. |
| Fourier, Weil and Siegel–Weil | #1063 TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:402, :520, :550, :618, :638, :646, :1218, :1292, :1553, :1589, :1621; #924 TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md, AL.0. Strict versus weak support inequalities and self-dual measures agree. |
| Eisenstein continuation and automorphic comparison | #925 TauCetiRoadmap/AutomorphicSpectralTheory/README.md:886, :909, :1560, :2797, :2819, :2841, §§1.1–1.2, 2.4, 5.10, 5.12, 5.14; #871 TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:4257 and :4383, ALS.5b.1/5b.4. The latter's Franke input is owned by the former. |
| Fourier vanishing and Vogan–Zuckerman cohomology | #1037 TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:686 and :808, §§4.4 and 5.4. The conductor-adjusted Fourier criterion and proper θ-stable-parabolic degree bound are the consumed statements. |
| Harmonic Maass input | #1391 TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md:1216, :1286, :1317, §§8.3, 8.5–8.6. The consumed unitary negative-weight branch is present; it does not by itself fix R06. |
| Canonical models, components and datum functoriality | #933 TauCetiRoadmap/ShimuraVarieties/README.md:316, :659, :1786, :1804, :1835, :2362, :2476, :2534, §§0.5, 2.7, 6.2–6.4, 8.1, 8.5, 8.7. Connected derived data are interpreted as such, without assuming a lift of the Deligne torus to SU. |
| Compact Hodge theory and GAGA | main TauCetiRoadmap/ComplexKahlerGeometry/README.md:1262 and :2477, §§4.5, 6.3; #848 TauCetiRoadmap/ComplexComparisonPartII/README.md:1966, §C1.9. Compact projective hypotheses are satisfied in §12.6a(b)'s nonrational branch. |
| Integral toroidal compactification | #1053 TauCetiRoadmap/ShimuraCompactifications/README.md:2294, :2344, :2542, §§7.3, 7.5, 7.15. Properness comes from the complete fan in §7.5. |
| Arithmetic divisors and proper one-cycle pairing | #1000 TauCetiRoadmap/ArakelovGeometryAndAbelianHeights/README.md:393, :430, :457, §§1.8–1.10. Principal Green function −log|f|² and half-sum over complex embeddings agree. |
| Jacquet–Rallis formulations | #999 TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:688, :764, :998; packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md:678 and :692, §§4.4–4.5. Zhang's different S_n formulation and its unit fundamental lemma are requested explicitly through the named gap. |

The overlap inventory at the supplied heads reports no conflicting change to this roadmap, dropped cited id, or citation defined only by an open revision. The new sections 12.6a/12.6b do not renumber existing sections. The closest heads were also examined by object: #1487 owns point-height/Gross–Zagier formulas and the lifting lengths imported here; #1063 owns generic Weil/uncertainty/Siegel–Weil machinery; #999 owns transfer rather than the arithmetic intersection identity; #1090 TauCetiRoadmap/IgusaVarietiesAndTorsionConcentration/README.md:6 owns Igusa period fibres and torsion concentration, not these special cycles and density derivatives.

For #1695, TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:647 and :667 (§§4.2–4.2a) were opened: they construct integral orthogonal special-endomorphism divisors and an arithmetic Borcherds section with vertical support for a maximal lattice. The new §12.6a concerns generic Chow classes over every totally real base and their modularity; it does not reconstruct that integral model or its vertical-support theorem. The general generic-fibre orthogonal product required by R06 should have one explicit owner here, earlier in the order; the later arithmetic extension can consume it. No upward citation to #1695 is proposed. Searches by “Borcherds”, “Kudla–Millson” and “Vogan–Zuckerman” through the indexed heads and main found no earlier owner for the missing generic codimension-one modularity/pullback target. The base GrossZagier roadmap is extended, not replanned.

The mechanical check, run with the prescribed movable/content/order arguments, returned exactly:

```text
depcheck: 236 roadmaps, 2158 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The internal proof-range error R06 is not detectable by that graph check.

All four gap slugs occur in both design/plan.json and the README supplier contracts, with matching needs text. They are precise extensions of a named earlier supplier, not unowned prerequisites:

| Gap | Minimality and convention check |
|---|---|
| ramified-hermitian-densities | GeometryOfNumbersAndQuadraticArithmetic §3.2 is unramified; the request adds ramified odd-residue densities and the two specified interpolation variables. Nonembedding forces zero; different signs alone are used only at equal rank. |
| nonaffine-formal-filtration-product | SchemeKTheoryOperationsPartII §2.4 is affine. A product compatible with noetherian exhaustion on the nonaffine formal spaces is additional; a cokernel support formula does not establish it. |
| arithmetic-chow-star-products | ArakelovGeometryAndAbelianHeights §§1.8–1.10 supply divisors and one-cycle pairings, not all-codimension Green-current star products. The half-embedding degree convention matches. |
| jr-afl-local-inputs | The supplied GL_n/X_n and augmented Lie formulations are different from Zhang's S_n and semi-Lie formulations. The request states both transfer factors, the natural unramified character, Fourier compatibility and the nonsplit zero component for all q, including q≤n. |

These declared contracts are not findings. Since the verdict is needs changes, no conditional acceptance is recorded in review.json.

### Shape, policy and manifest

The README has the prescribed summary, ownership, conventions, supplier contracts and build guide, followed by 15 mathematical layers, 107 target subsections, 107 Needs lines, 15 Examples subsections and 15 Dependencies subsections. The 41 subsections explicitly introduced by “Define” or “Construct” each have at least three Check bullets and an API, with prose APIs in §§6.7 and 7.4. The additional orthogonal construction in §12.6a has four Checks and its four claimed properties. The invalid Checks identified above require repair despite those counts. The two main-branch shape references read were TauCetiRoadmap/QuadraticCharactersAndReduction/README.md and TauCetiRoadmap/NoncongruenceModularForms/README.md.

The layer titles name mathematical objects, not source chapters. The local geometry/density and global cycle/automorphic comparisons have explicit dependency reasons; no unforced source-chapter sequence or statement that the plan follows a source was found. Ramified, almost self-dual and bad-order cases are retained with their own targets and corrections. No computational algorithm, copied source passage, process hand-off, pull-request number, machine path or HTML anchor was found in the roadmap text. Source corrections are mathematical qualifications, not instructions. No suspicious instruction from fetched material was followed.

The manifest contains 23 unique works, including all works cited in References: 22 readable/certified entries and Lusztig76, settled uncertified. Edition-specific locators are retained; no duplicate source key or missing cited work was found. No source was fetched or manifest entry changed in this round. metadata.toml remains the package's math.NT classification.

## Not verifiable

- Lusztig76, Coxeter orbits and eigenspaces of Frobenius, remains the explicitly settled uncertified source. Its original text was not recertified, and no renewed request was made. The seeded §0.3 definition and the later geometric formulation were checked in LZ; that does not certify every independent assertion of Lusztig76.
- The declared supplier gaps are future contracts, not implemented-library claims. Their presence, precision, ownership and nonduplication were checked; this review does not claim that the missing supplier theorems have already been proved.

## Source issues

- **Misprint** in LZ at Definition 2.9.1, printed p. 14: the source calls the torsion-free horizontal quotient the maximal vertical closed subscheme; it should say maximal horizontal closed subscheme; affects nothing.
- **Error** in K at §3.1, printed p. 16: the source describes every Frobenius-fixed Lagrangian as singular even when m=1; it should exclude m=1, where the incidence variety is smooth ℙ¹; affects a stated result.
- **Error** in K at Theorem 8.2, printed p. 64: the source asserts negative-cone vanishing of the vertical partial integral; it should retain nonnegative-cone constancy without that vanishing, since the rank-three example gives 2q·vol(L♭); affects a stated result.
- **Misprint** in K at equation (8.6), printed p. 67: the source uses orthogonal-sum sign (−1)^n₁; it should use χ(−1)^n₁, equal to 1 rather than −1 for q=5,n₁=1; affects the proof.
- **Error** in K at Lemma 9.6, printed pp. 74–75: the source asserts strict valuation decrease for the replacement hyperplane; it should provide a separate hyperbolic argument, since H₁ has no line of valuation below two; affects a stated result.
- **Gap** in Z at Theorem 8.6, printed p. 42, and its use in Theorem 15.1: the source invokes BHKRY arithmetic modularity without its n≥3 restriction; it should justify curves separately or use the low-rank AFL base before the global induction; affects the proof.
- **Gap** in YZZ09 at §4.1, printed pp. 1158–1159: the source treats n>3 and n≤2, omitting n=3; it should include n=3 in the Betti-vanishing case, where the minimum cohomological degree is two; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f37ce59a132dfd799418f81de2447cae28ae8a30", "job": "REV-PKG-GrossZagierAndArithmeticHeightsPartII~5", "model": "gpt-6-astra", "worker": "chris-9"} -->
