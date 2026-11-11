<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13094#issuecomment-6783752074 -->
Review (codex) of 271e9a0

Verdict: needs_changes

1. **F01** (P1) The specialization uses the wrong fibre

   **Location:** `packages/RealSurfacePeriodIndex/README.md:671–674`, §1.6, particularly “fibre over 0 containing a component birational to X”.

   **Claim:** For the displayed family `s_t = t^l s₁^l + (1−t)^l s₀`, the zero fibre supplies a multiplicity-one component birational to X, whose specialization recovers α over k(X).

   **Witness:** At t=0 the equation is z^l=s₀, with valuation 1 along D; at t=1 it is z^l=s₁^l. CT05 lines 953–955 explicitly put the l degree-one components over 1.

   The first polynomial is Eisenstein at the generic point of any component of the nonempty reduced ramification divisor. Its generic degree over X is l, not 1. Resolving the stated singularities does not change that generic degree. Consequently the residue field in step 5 need not be k(X), and the claimed specialization does not establish the index divisibility.

   **Exact repair:** Keep the formula and replace the distinguished point 0 by 1 in steps 3 and 5, explicitly choosing the generic point of a multiplicity-one component birational to X. Alternatively reverse t and 1−t everywhere in the displayed family and keep 0. Record the parameter correction to CT05 and add the following negative-control Check. For l=2, local s₀=x and s₁=x, the fibre at 0 is z²=x, irreducible over k(x,y), whereas the fibre at 1 is `(z−x)(z+x)=0`, with two degree-one components. With the first repair the selected residue field is k(X), so a degree-d residue algebra really implies ind(α) divides d. This calculation tests the repair on the instance that refutes the original assertion.

2. **F02** (P1) Two local Brauer inputs have no target or supplier contract

   **Location:** `packages/RealSurfacePeriodIndex/README.md:673–674,681`, §1.6: “use Saltman's local form” and “it extends to an Azumaya algebra over the discrete valuation ring”.

   **Claim:** The listed prerequisites supply the local crossing calculation and extension of a specified degree-d central simple algebra without increasing its degree.

   **Witness:** CT05 lines 256–261,276–285 state separate theorems. PR #1017, `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md:1146`, supplies residues, not these two inputs. `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4604` supplies class-level Brauer theory, not fixed-degree extension.

   The distinction matters. Residue purity yields an unramified Brauer *class*. It does not by itself produce an Azumaya representative of the prescribed degree d. Likewise the henselian-DVR symbol formula in the Heights supplier is not Saltman's two-dimensional crossing decomposition. Searching the package, pinned algebra libraries, main roadmaps and supplied open heads by these objects found no other owning target. Merely citing CT05 does not assign these proof inputs to the library being planned. Neither is one of the three declared supplier gaps.

   **Exact repair:** Give the inputs named general targets before §1.6, or declare precise contracts with an earlier supplier and matching plan gaps. State their hypotheses and conclusions, and cite the targets individually in §1.6's Needs line:

   - For an excellent regular local ring R of dimension two, fraction field K, prime l invertible in R, and α in H²(K,μ_l⊗²) with SNC ramification, state all three cases of CT05 Proposition 2.6: no ramification; one parameter s with α−(u,s) unramified; two parameters s,t with α−(u,s)−(v,t)−r(s,t) unramified, for units u,v and r in ℤ/l. Import the existing Gersten and residue inputs rather than reproducing them.
   - State the degree-preserving extension theorem of CT05 Theorem 2.5 for regular integral Noetherian schemes of dimension at most two: a degree-d generic central simple algebra whose class extends has a degree-d Azumaya model; retain the invertibility hypothesis for its residue-vanishing corollary. Do not replace this by arbitrary-degree representability of the class.

   Tests for the repaired contracts: on `R=ℂ[s,t]_(s,t)`, α=(s,t)₂ has crossing coefficient r=1, and after adjoining √(st), `(s,t)=(s,st)=0`; the correction is an actual crossing term. Over `ℝ[t]_(t)`, the constant Hamilton algebra extends with degree 2 and specializes to index 2. The ramified algebra (−1,t) has residue −1 and cannot extend. These distinguish the required contracts from both an empty decomposition and unrestricted extension. No files of either supplier need be edited by this fix worker.

3. **F03** (P3) Puiseux algebraic closedness is cited in the wrong layer

   **Location:** `packages/RealSurfacePeriodIndex/README.md:22,119,2519,2538,2637`: “FormalLaurentPuiseux L4 (`puiseuxField_isAlgClosed`)”.

   **Claim:** L4 supplies the characteristic-zero algebraic closedness theorem used to prove that the real Puiseux field is real closed.

   **Witness:** `TauCetiRoadmap/FormalLaurentPuiseux/README.md:233` starts L5; lines 249–273 prove the root theorem and algebraic closedness. The named declaration exists at `TauCetiRoadmap/FormalLaurentPuiseux/Suggested.lean:250`.

   **Exact repair:** Cite L4 for the field, level embeddings and algebraicity, and L5 for `puiseuxField_isAlgClosed`, at all five locations. This is a locator correction, not a new supplier or an unowned prerequisite. For the test polynomial X²−t, L4 supplies the level-two element t^(1/2); L5 supplies the general root theorem. After the repair each part of §9.11 points to the section that actually owns it. Keep the characteristic-zero and algebraically closed coefficient-field hypotheses.

Three findings: two P1 and one P3. The eight headline signatures elaborate, and none failed the padding audit. The previous mathematical repairs withstand the checks below. The new defects concern the reduction to unramified classes and one supplier locator, not the scope of the roadmap.

## Verified sound

The review read the four package files, the prior review and repair report, the board package index, the overlap and library-match evidence, and the current supplier copies. It covered all 106 numbered README targets in ten layers. For unchanged mathematics it reused only the previous review's rows with explicit computed values; it independently reviewed the changed statements, their consequences, and all 15 seeded targets. In particular, the old combined §1.5–§1.7 row was not treated as evidence for the specialization in §1.6: that computation yields R01.

### Previous findings, checked first

| Previous finding | Repaired passage in the package | Disposition and independent test |
|---|---|---|
| F01: fixed-cover obstruction and adjustment generality | §5.5: “τ = 0 if and only if c_Ψ ∈ J|_Ψ”; §5.8: “if and only if c_Ψ belongs to cl_R(Pic(S))|_Ψ” | **Repaired.** These are exact criteria, rather than silently narrowed versions of the source's false unconditional assertion. The four-component Enriques counterexample below gives c_Ψ=h₁ outside J; its control gives h₁+h₂ inside J. The square auxiliary bundle in §6.13 makes c_Ψ=0 for arbitrary evaluation. |
| F02: split covers and ampleness | §5.2: “on each integral component T_i”; §5.3: “T is integral”; Layer 5 example: “Under Assumption 3.1” | **Repaired.** Split generic ring F×F has (1,0)(0,1)=0. Pullback is (α,α); it is not a class in a nonexistent function field. The H⁴ pushforward is an isomorphism only with the ampleness hypothesis used for the integrality conclusion. |
| F03: saturated lattice | §6.10: “the vanishing lattice is saturated and therefore splits off”; “need not be its complement” | **Repaired.** Kernel ℤ(1,−1) has complement (0,1), determinant 1. The proposed constant complement (1,1) gives determinant −2 and index 2. |
| F04: Tsen–Lang ownership in the sibling | §0.7 owns the interface; Scope: “QuadraticFormInvariantsPartII, later in the merge order, imports it” | **Not repaired in the sibling, settled as not actionable in this package.** The repair report's scope reason is valid. PR #1834 still owns §§5.4–5.6 and claims reverse supply at `TauCetiRoadmap/QuadraticFormInvariantsPartII/README.md:116,2026`. This package cannot edit that head, and citing it as a supplier would reverse the permitted order. No re-raised finding. |
| F05: source-shaped independent branches | Layer 4: “Noether–Lefschetz loci for double covers”; Layer 5: “pulling back a period-two class to a double cover” | **Repaired.** Dependencies at README:1323 and 1506 leave the two branches independent; Layer 6 joins them. The new order also puts the square-bundle input before its use in the obstruction Checks. A fresh cross-roadmap search found no consumers of the former §§4.x/5.x numbering. |

The F01 counterexample was checked rather than accepted from the repair report. For B with rows (1,1,1), (1,2,4), (1,3,9), its entries are nonzero, its nine 2×2 minors are 1,3,2,2,8,6,1,5,6, and det B=2. Thus every three columns of [I|−B] are independent, giving smoothness of the three diagonal quadrics. The sign-changing involution has no fixed projective point. Its real quotient is four copies of ℝℙ², all in one half. With basis h_i, w₁=(1,1,1,1), the Picard/degree-one image is the even-sum hyperplane by MVH98 lines 500–540. The evaluation a₀=(1,1,0,0), a₁=0 satisfies the required pairing because 1+1=0 in 𝔽₂. Taking cl_R(M)=h₁+h₃ gives c_Ψ=h₁, whose coefficient sum is 1; taking h₁+h₂ instead gives coefficient sum 0. The negative-section construction can be made ample by twisting with squares. The same corrected factor was checked in the scope paragraph, source correction, boundary computation, integral adjustment, examples and constructed-cover endpoint.

### Computed adversarial evidence

H denotes the hyperbolic plane. Values involving cohomology are in the indicated integral group or 𝔽₂, not formal labels for unchecked conditions. This table records the seeded targets, headlines, repaired passages and findings; the unchanged detailed computations in the previous review remain applicable after the Layer 4/5 renumbering.

| Statement | Instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| §0.1 Harrison topology | ℝ, ℂ; a=1,−1; ℚ(√2) | X_ℝ has 1 point, X_ℂ has 0; H(1)=X, H(−1)=∅; ℚ(√2) has 2 orderings distinguished by √2 | Positive convention is the source's negative convention with a replaced by −a. Proper support excludes the indiscriminate ordering. |
| §§0.2–0.5 compactness, closure, signature, survival | Constant ℝ system; ℝ⊂ℝ(t); positive plane, H, negative plane; Hamilton class | Inverse limit has 1 point; relative algebraic closure has trdeg 0 versus trdeg 1 for a real closure of ℝ(t); signatures 2,0,−2; split/ Hamilton survival sets ∅/X; X△X=∅ | Native signature laws are imported; the varying-ordering adapter and clopen survival function are new. |
| §0.6 and the Lean definition | H, positive plane, zero space; nonreal field | Maximal zero-subspace dimensions 1,0,0 give 2·1=2, 2·0≠2, 0=0; nonreal field has no real-closed extensions, so the universal condition is true | Finite-dimensional binder is explicit. Degenerate qualifying forms are already isotropic; no false anisotropy consequence. |
| §0.7 Tsen–Lang | ℂ with i=1,r=d=2,N=5; 𝔽₂ norm form | 5>2·2=4 and ideal height≤2<5. x²+xy+y² has value 1 on all three nonzero vectors of 𝔽₂² | The algebraically closed branch is handled without a nonexistent higher-degree normic form. Strict inequality and positive degree are retained. |
| §0.10 Springer | H⊥t⟨1⟩; ⟨1,−t⟩ over ℝ((t)) | First form vanishes at (1,1,0); residual isotropy is (true,false). In the second, equality of nonzero square and t times square would require even=odd valuation | Isotropy is a disjunction; anisotropy is a conjunction. Residue characteristic 2 is excluded. |
| §0.11 Amer–Brumer | Two zero forms in ranks 1 and 0; q₁=x²,q₂=0; characteristic-2 norm form | Common nonzero zero and pencil isotropy are (true,true), (false,false), (false,false). For q₁=q₂=x²+xy+y², pencil=(1+t)q stays anisotropic | Both directions and empty-dimensional boundary agree; arbitrary-characteristic source generality is retained. |
| §0.12 period/index conventions | Split matrices, Hamilton, division biquaternion | (period,index)=(1,1),(2,2),(2,4) | Zero additive class corresponds to multiplicative 1, whose order is 1. No 0/0 convention enters. |
| §1.2 Kummer boundary | ℙ¹,O(1),n=2; Spec ℝ | κ=1 mod 2, βκ=0 in degree 3, c₁=1 in degree 2; H²_G(ℤ(1))=0 and H³_G(ℤ(1))[2]=ℤ/2 | Degrees and twist agree with the supplier. |
| §1.5 algebraically closed extension | ℚ̄⊂ℂ, α=(x,y); ℝ⊂ℂ negative control | First: period/index=(2,2) on both fields, by iterated residues. Second: Hamilton index changes 2→1 | Algebraically closed base is necessary. Spreading out the splitting field gives the claimed invariance. |
| §1.6 specialization | l=2, local s₀=s₁=x | At 0: z²−x irreducible, generic degree 2. At 1: (z−x)(z+x), two components each degree 1 | **R01.** Use fibre 1, or reverse the parameter. |
| §1.6 local inputs | (s,t)₂ over ℂ[s,t]_(s,t); Hamilton and (−1,t) over ℝ[t]_(t) | Crossing coefficient 1; after √(st), symbol=0. Hamilton degree/residue index=2/2. Ramified quaternion residue=−1≠1 modulo squares | **R02.** These are separate local normal-form and fixed-degree extension requirements. |
| §2.3 no topological obstruction | τ of order 2 on a complex Enriques surface; nd even | nd·τ=0; injectivity of p* in the argument forces pulled-back obstruction 0. For ℙ², torsion H³=0 already | The proof uses the annihilating multiple and the stated Lefschetz injection, not a vanishing claim for every surface. |
| §2.8 unramified complex period=index | Period 2, sufficiently large consecutive d,d+1 | Splitting degrees 2d,2d+2 have gcd 2; period divides index divides 2 | Matches B19 Theorem 1.1, including the sufficiently-large qualifier. |
| §2.9 / Lean de Jong | (x,y) over ℂ(x,y); split matrices | Index/order=(2,2), (1,1) | Algebraically closed base k does not mean K is algebraically closed. Not a native split-algebra lemma. |
| §2.10 / Lean norm bound | Over ℝ(x,y), α=(−1,−1)+(x,y); odd period 3 | At the y-adic completion, residue extension has degree 2 and Hamilton index stays 2 after adjoining √x: index 4 divides 2·2=4; for odd period the prime divisors exclude index 6, leaving 3 | Correct arbitrary-real-closed base; does not assert equality in every case. |
| §§3.1–3.6 cover and trace | z²=1, z²=x, z²=xy; ample and split covers | Generic algebras F×F and degree-2 field; branch discriminant 4x; crossing incidence fibre ℙ¹. H⁴ pushforward ℤ²→ℤ is (a,b)↦a+b, kernel ℤ(1,−1) | General model allows split covers; ampleness is needed later. No finite-morphism assertion for the incidence resolution. |
| §4.8 expected Noether–Lefschetz dimension | Rational base; quartics containing a line | h²(O_base)=0 gives cokernel bound 0. A line has 4 parameters and imposes 5 quartic conditions, giving codimension 1 | The connecting arrow lands in H¹(N_C/T), followed by H²(O_T). Corrects the source's H⁰ misprint. |
| §4.9 square bundle | O(2) and O(1) on ℙ²_ℝ | cl_R O(2)=2h=0; cl_R O(1)=h≠0 | Square choice both preserves positivity and kills the required real class. |
| §5.2 split-cover repair | T=S⊔S | (1,0)(0,1)=0 in F×F; α_T=(α,α) | Componentwise generic restrictions are well-defined; no common function field asserted. |
| §5.3 and Layer 5 example | Complex Enriques E viewed over ℝ; trivial split cover | H³_G(E(ℂ),ℤ(1))[2]=ℤ/2; nonzero τ pulls back to (1,1)≠0 | Correct negative control outside the ample hypothesis. |
| §5.4 evaluation factor | a₀=(0,1), a₁=0, covering component e=(e₀,e₁) | Correct component=(0,e₁); dropping a₀ gives (e₀,e₁) | Corrected throughout. A negative section on a Möbius circle has monodromy 1=w₁(M), while degree-zero twists give 1+1=0. |
| §5.5 iff and Enriques counterexample | Four ℝℙ², a₀=(1,1,0,0); M classes h₁+h₃ and h₁+h₂ | First c=h₁ has sum 1, outside J, τ≠0. Control c=h₁+h₂ has sum 0, inside J, τ=0 | Both directions of the criterion survive; the printed unconditional theorem does not. |
| §5.8 integral adjustment | p*β=2δ+cl θ₁, δ=p*γ+cl(μ+φ+ν) | p*(β−2γ)=cl(θ₁+2μ+2φ+2ν). Conversely n=2 annihilates the cokernel class, so torsion-freeness makes it 0 | Exact Picard-realization criterion, with the declared torsion-free-cokernel input. |
| §6.10 lattice repair | Degree-two map ℙ¹×ℙ¹→ℙ² | p*h=(1,1), p*(a,b)=a+b; complement determinants 1 and −2; respective indices 1 and 2 | Saturated kernel splits abstractly; the constant lattice need not be that complement. |
| §§6.12–6.13 transport and construction | Zero Brauer class but Kummer lift c₁O(1,0) mod 2; mixed evaluation and square M | Unnormalized reduction=(1,0)≠0; subtracting c₁ gives 0. For constructed cover cl_R M=0, hence a₀cl_R M=0 on every component | Chosen-lift normalization and full mixed-evaluation endpoint retained. |
| §§7.1–7.3 period induction | n=2,4,6; odd n=3 | Half-class evaluations on Θ are 1,0,1; after splitting it, exact remaining periods are 1,2,3. Odd branch gives index 3 | No natural-number half-period operation is used in the odd case. |
| §7.4 / Lean nonreal surface theorem | ℂ(x,y) as ℝ-extension, α=(x,y) | trdeg=2, −1=i², index=period=2 | Nonempty, nonsplit instance; quantifiers match README. |
| §7.6 / Lean real-closure vanishing | α=(x²+1,y) over ℝ(x,y); Hamilton control | x²+1 is square in every real closure, hence restrictions 0; residue at y=0 is a nonsquare in ℝ(x), hence period=index=2. Hamilton restriction=1 in ℤ/2 | Real-closure condition is substantive, not the conclusion in disguise. |
| §7.7 sufficient criterion | [α̃]₁=cl_R N on Θ; periods 2,4,3 | [α̃−κN]₁=0; n/2 mod 2=1,0 in the two even examples; odd case index=3 | Picard correction and half-period reduction are compatible. |
| §7.8 / Lean u upper bound | H⊥H⊥H; positive rank-6 form; algebraic closure of ℝ(x,y) | First signature 0 and q(1,1,0,0,0,0)=0. Positive form signature 6 is excluded. Over algebraic closure, x²+y² vanishes at (1,i) | No finite-generation binder was silently added to the general upper bound. |
| §7.10 / Lean sharpness | Norm form of (x²+1,y) over ℝ(x,y) | Four coefficients have two positive/two negative signs at every ordering. Both y-adic residue forms ⟨1,−(x²+1)⟩ are anisotropic: index=2, norm rank=4 | Gives anisotropic zero-signature rank 4; together with upper bound, u=4. General lower-bound parameter test retains determinant 8i≠0. |
| §7.11 / Lean isotropy | ℂ(x,y), H⊥⟨1,1,1⟩; a degenerate form | Rank=5 and q(1,1,0,0,0)=0; any nonzero radical vector has value 0 in characteristic zero | No unnecessary nondegeneracy hypothesis; finite dimension and nonreal field remain explicit. |
| §7.13 / Lean pair of quadrics | K=ℂ(t), q₁=x₁²,q₂=x₂² on K⁵ | trdeg_ℝ=1, −1=i²; e₃≠0 gives both values 0. Smooth (2,2) intersection has degree 2·2=4 | Native statement covers the general pair theorem; smooth del Pezzo application is a separate geometric deduction. |
| §§8.2–8.7 signs and coefficient reductions | Transposition/3-cycle; n=4 trace-zero operator; sign cohomology n=2,4 | Permutation signs −1,+1 match ramification multiplicities 1,2. ψ(e₁)=(−3,1,1,1), sum 0; −ψ reduces to constant 3. H² sign-reduction sends n/2 to 1,0 respectively | Supplier and consumer use the minus sign and distinguish n modulo 4. |
| §§8.10,9.7 criterion and two halves | Nonzero w₁, both halves nonempty | Full degree-one image has dimension b₁; Picard image has dimension b₁−1. A class pairing 1 with w₁ lies outside it, giving period/index=2/4 | Both nonorientability and the two-half hypothesis matter. |
| §9.10 Enriques classification | One half; two halves and nonorientability; orientable locus | In one half, correction on an omitted odd-Euler component changes pairing 1→0 without changing restriction. In two-half case obstruction pairing=1. Orientable case w₁=0, Picard image=all H¹ | Exact classification retained. Algebraic w₁ forces w₁²=0, excluding the source's odd-total-parity branch. |
| §9.11 Puiseux supplier | X²−t; t and −t | t^(1/2) squares to t; −t has no real square root; 0<t<r for every r>0 in the coefficient field | **R03:** field/levels are L4, general algebraic closedness is L5. |
| §9.12 sextic K3 | z²=u²v²(w²−u²−v²)−tw⁶ | Double-plane canonical class O(−3+6/2)=O; H¹(O⊕O(−3))=0. At each of two infinite singularities the complex local type is A₅. Four real components each have H¹(S²,𝔽₂)=0 | Resolution preserves the K3 invariants; semialgebraic rather than ordinary order-topological connectedness is used. |
| §§9.14–9.15 non-Archimedean failure | Four affine quadrants and prescribed sign class | Four spherical components give dim H¹=0+0+0+0=0. Nontrivial 2-torsion has period 2; obstruction to quaternion representation excludes index 2, and norm bound gives index≤4, hence index 4 | Criterion would incorrectly give 2=4 if extended from ℝ to this real closed field. Real-number hypothesis is essential. |

For §9.12 the affine critical equations with u,v nonzero give u²=v²=1/3 and branch value 1/27−t≠0. At infinity the real local equation can be put in the form z²+V²+tw⁶=0, so those points are isolated and the resolved exceptional chains have no real locus. In each of the four open quadrants, the positive superlevel region of u²v²(1−u²−v²) at infinitesimal t is a disc; its double along the boundary is a sphere. This checks the four-component assertion used by the final example, rather than merely repeating the K3 label.

### Seeded source verification

All accessible locators were read from the supplied legal cached extractions. Source line references below refer to those extractions; printed page numbers are distinguished from extraction pages. No source passage was copied into the package or report. The sampled primary texts listed as settled uncertified remain so.

| Seeded target | Locator checked | Finding / support |
|---|---|---|
| 0.1 | EKM §33, printed pp.133–134, lines 7222–7272; BCR §7.1 locator-only | EKM supports the Harrison topology and its sign convention. Package's positive convention is equivalent by a↦−a. |
| 0.7 | EKM Lemma 97.1, Theorem 97.2, Corollaries 97.5–97.6 and Theorem 97.7, printed pp.385–386, lines 20208–20287 | Systems, algebraic extensions and finite transcendence degree supported. Package correctly separates algebraically closed fields for every i. |
| 0.10 | EKM Lemma 19.4, Theorem 19.5, Corollary 19.10, printed pp.80–81, lines 4159–4235; Exercise 19.15, lines 4311–4316 | Complete DVR and residue characteristic ≠2 retained. The split Witt sequence is a statement about additive groups. SPR55 remains locator-only. |
| 0.11 | EKM Theorem 17.14, printed pp.74–75, lines 3874–3896 | Amer–Brumer including the characteristic-two extension is supported; no extra smoothness of the pair is assumed. |
| 1.5 | B19 §0.6, printed p.68, lines 194–200 | Source invokes the Lefschetz reduction, rather than stating the detailed invariance theorem. Package provides its own spreading-out proof using SchemeAndStackFoundations §0.9; splitting-degree and multiple-class arguments check out. |
| 1.6 | CT05 Theorem 3.14/Lemma 3.15, printed pp.400–403, especially lines 896–1015; Theorem 2.5/Proposition 2.6, pp.385–386, lines 256–285 | Endpoint supported, but family parameter is inconsistent: R01. The local results are genuine separate inputs: R02. |
| 2.3 | B19 Lemma 1.3, printed pp.69–70, lines 263–279 | Annihilation by nd and the Lefschetz injection support the topological vanishing with the stated smoothness and degree. |
| 2.8 | B19 Theorem 1.1 and proof, printed p.69, lines 234–251 | Unramified complex theorem and gcd of consecutive sufficiently large degrees match. |
| 4.8 | B19 Proposition 5.4 and (5.7), printed pp.88–89, lines 1019–1045 | Expected codimension/cokernel argument supported; package corrects the intermediate cohomological degree. |
| 5.8 | B19 Proposition 4.5, printed pp.84–85, lines 880–903; BW20 Proposition 2.9, lines 1361–1378 | Source's unconditional conclusion cannot be retained. Package's exact Picard criterion, normalized integral lift and curve correction check out; BW20 supplies the stated torsion-free-cokernel mathematics. |
| 7.7 | B19 Theorem 0.5, printed p.64, lines 65–69; Proposition 6.7 proof, printed p.95, lines 1286–1304 | Sufficient half follows after Picard correction and even-period induction; odd period is treated separately. |
| 9.7 | B19 §8.1, printed pp.106–107, lines 1743–1781; MVH98 Proposition 4.2/Theorem 4.4, preprint p.12, lines 500–540 | Full degree-one image in the two-half case and Picard image w₁-perpendicular support the obstruction. |
| 9.10 | B19 Theorem 0.6, printed p.65, lines 77–82, proof p.107, lines 1782–1799 | Classification supported. Package avoids the impossible odd-total-parity branch and corrects uniqueness to nonzero uniqueness. DK96 itself remains uncertified. |
| 9.12 | B19 §8.2, printed p.107, lines 1800–1816 | Equation and four spheres supported. Package supplies the adjunction and rational-double-point calculation rather than treating “K3” as an unexamined label. BCR example remains uncertified. |
| 9.15 | B19 Proposition 0.7, printed p.65, lines 106–107, and proof pp.107–108, lines 1800–1833 | Period 2, index 4 and semialgebraic H¹=0 support failure over the real Puiseux field. |

The new four-component Enriques example additionally uses B19 Proposition 8.1, lines 1703–1742; the obstruction chase was checked against B19 lines 748–879, retaining the factor a₀. All 23 reference keys are present in `sources.toml` (10 accessible cached works, 13 settled uncertified works). The manifest parses; no source was fetched or entry changed.

### Pinned libraries and one-tactic probes

Running `lake env lean` on the package's absolute Suggested.lean path from the pinned content checkout returned exit 0. The only diagnostics were eight `declaration uses sorry` warnings, at lines 80,89,101,111,122,132,140,152. No module build was needed. A scratch copy independently tested each of the eight theorems with `simp`, `rfl` and `infer_instance`, requiring each attempted closure to fail; it elaborated with only the same eight admitted-target warnings. Thus none of the 24 probes closed a target. Inspection of the exact-lemma candidates found no one-library-lemma proof: the native algebraically closed index theorem assumes K itself algebraically closed, and the quadratic-form candidates are diagonalization, equivalence, positivity or preservation under extension, not surface-field isotropy. The Loogle/LeanSearch leads were treated as leads, not proof of absence.

The same scratch elaboration printed `#check @name` for all nine declarations, including the one real-bodied definition. All required binders survive: finite dimension and invertibility of 2 in the definition; EssFiniteType in the finite-generation statements; trdeg 1 or 2; nonsemireality; real-closure vanishing; and the dimension thresholds. The upper u-bound deliberately has no EssFiniteType hypothesis. No change was required. There are eight theorems, not ten: the external signature inventory's count does not create another declaration.

The following native declarations were opened at the pin; these are source-file locators within the pinned libraries:

| File and line | Actual interface checked |
|---|---|
| `Mathlib/Algebra/BrauerGroup/Defs.lean:41,100` | CSA includes centrality, simplicity and finite dimension; BrauerGroup is the quotient, without the group structure here. |
| `Mathlib/Algebra/Order/Ring/Ordering/Defs.lean:40,61` | Ordering has spanning and proper prime support; preordering contains squares and excludes −1. |
| `Mathlib/FieldTheory/IsRealClosed/Basic.lean:52,80`; `Mathlib/Algebra/Ring/Semireal/Defs.lean:38` | Real closed does not choose an ordering; nonsemireality means −1 is a sum of squares over a field. |
| `Mathlib/LinearAlgebra/QuadraticForm/Signature.lean:65,98,121,133,243` | Inertia indices, isometry invariance and diagonal counts. The general signature algebra is not replanned. |
| `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1054,1057`; `TensorProduct.lean:128,132` in the same directory | Anisotropic means Qx=0 implies x=0; scalar extension has its actual tensor-product carrier and pure-tensor value. |
| `Mathlib/LinearAlgebra/QuadraticForm/IsometryEquiv.lean:177`; `Real.lean:78`; `AlgClosed.lean:52,62` in that directory | Nondegenerate diagonalization, real normal form and algebraically closed classification are weaker/different results than the headline isotropy claims. |
| `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61`; `Mathlib/RingTheory/EssentialFiniteness.lean:40`; `Mathlib/RingTheory/AlgebraicIndependent/Basic.lean:45` | finrank uses Cardinal.toNat; EssFiniteType is a localization of a finite generated subalgebra; trdeg is cardinal-valued. Finite-dimensional and field assumptions prevent the relevant junk values. |
| `Mathlib/Algebra/QuadraticAlgebra/Defs.lean:44,387`; `Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean:282`; `Mathlib/Topology/Compactness/Compact.lean:1172` | Rank-two algebra/basis, proper-ideal height bound and compact product theorem used in the roadmap. |
| `TauCeti/Algebra/CentralSimple/Index.lean:99,112,180,196,211,242,247,255` | Native index, matrix behavior, positivity, degree divisibility, split criterion, algebraically closed/finite-field special cases and degree-index splitting field. Does not already prove de Jong or the Brauer-class gcd adapter. |
| `TauCeti/Algebra/BrauerGroup/Group.lean:139,174`; `BaseChange.lean:136`; `Division.lean:69`; `Real.lean:102` in that directory | Actual class map, commutative multiplicative group, same-universe restriction, division representatives and Br(ℝ)≃Multiplicative(ℤ/2). |
| `TauCeti/Algebra/CrossedProduct/Comparison.lean:274,317` | Brauer/Galois-cohomology comparison and its normalized uniqueness, not scheme evaluation. |
| `TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Signature.lean:52,66,111,140`; `TauCeti/LinearAlgebra/QuadraticForm/Witt/Signature.lean:133` | Ordered-field signature and rank/signature classification over ordered real closed fields. |
| `TauCeti/LinearAlgebra/QuadraticForm/Hyperbolic.lean:76`; `BaseChange.lean:389` in that directory | Hyperbolic plane is diag(1,−1); scalar extension preserves already established isotropy under its hypotheses. |
| `TauCeti/FieldTheory/RealClosure/Basic.lean:120`; `TauCeti/Algebra/Order/Ring/Ordering/Map.lean:64`; `Extension.lean:62` in that directory | Same-universe algebraic ordered real closure, restriction of ordering and preordering extension. |

The definition HasZeroTotalSignature is a simple predicate on these native carriers; it is not a free proposition standing in for missing geometry. For nondegenerate forms its maximal-isotropic-subspace condition is equivalent to zero signature. For degenerate forms it is stronger than the naive signature condition, but this loses no anisotropic form and the README explicitly limits the equivalence to nondegenerate forms.

### Headline coverage

| Headline from the README | Suggested.lean coverage |
|---|---|
| De Jong in characteristic zero, §2.9 | `index_eq_orderOf_of_isAlgClosed`, line 80. |
| Norm bound over arbitrary real closed fields, §2.10 | `index_dvd_two_mul_orderOf_of_isRealClosed`, line 89. |
| Theorem 0.3, §7.4 | `index_eq_orderOf_of_not_isSemireal`, line 101. |
| Theorem 0.4, §7.6 | Birational form `index_eq_orderOf_of_forall_isRealClosed`, line 111; scheme form named as unavailable because Br(U) and real evaluation are missing. |
| Theorem 0.5, §§7.7,8.10 | Named in module docstring; lacks scheme Brauer group, real equivariant cohomology, Kummer sequence and real components. |
| Theorem 0.6, §9.10 | Named in docstring; lacks real Enriques/halves, real-locus w₁ and Br(S). |
| Proposition 0.7, §9.15 | Named in docstring; lacks K3/semialgebraic-cohomology/scheme-Brauer carriers. |
| Theorem 0.12, §§7.8,7.10 | Upper bound and rank-four sharpness at lines 122 and 132. The former allows non-finitely-generated fields; the latter uses the actual Fin 4 vector space. |
| Theorem 0.10, §7.11 | `not_anisotropic_of_not_isSemireal`, line 140. |
| Theorem 0.13, §7.13 | General pair-of-quadrics theorem `exists_common_zero_of_not_isSemireal`, line 152. Geometric del Pezzo formulation and its missing carrier named separately. |

Object searches at the pins support these unavailable-carrier statements. The ring-level IsAzumaya and field BrauerGroup do not supply a scheme Brauer group, and a period-domain carrier does not supply a real algebraic surface with its equivariant comparison. No statable headline was omitted or forced through a substitute. All nine owned backticked declaration names in the README resolve in Suggested.lean; none shares a fully qualified name with the readable supplier files.

### Supplier direction, overlap and ownership

The dependency command specified in the brief was run without editing the order or tooling. Its complete output was:

    depcheck: 236 roadmaps, 2145 edges, 0 problem(s)

There was no UPWARD, CYCLE or moved line. Every Needs line and supplier contract was read. The resolver found no unresolved roadmap citation or owned Lean name; its native-name check was unavailable, so the pinned files above were opened directly. The semantic omissions in R02 and wrong L4 attribution in R03 are not detected by that mechanical result.

Current citations were resolved against main or the supplied head, not a remembered revision:

| Supplier / copy | Resolved content and README locators |
|---|---|
| SchemeAndStackFoundations, main | §§0.1,0.9,0.17 at 616,1026,1310; §§2.2,2.6,2.11,2.16,2.20,2.22 at 3420,3554,3795,4029,4452,4604; §3.4 at 5015; §§4.9,4.11,4.13,4.17 at 5734,5820,5945,6389; §§5.4,5.10 at 7065,7565. These supply the stated scheme, Picard, duality, Bertini and intersection interfaces; the fixed-degree Azumaya extension is not among them. |
| ResolutionOfSingularitiesCharacteristicZero, main | §§5.1,6.2,7.8 at 791,893,1150: principalization, SNC compactification, projective field resolution. |
| AlgebraicModuliForArithmeticGeometry, head #853 | §§1.1,1.4 at 313,706: Proj Sym E quotient convention and ample powers with fixed twists. |
| HeightsRationalPointsAndObstructions, head #1017 | §2.16b at 1146 and §2.19a at 1202: residue exactness/multiplicity and degree-d corestriction. Its henselian-DVR symbol formula does not supply R02's crossing theorem. |
| MotivesAndAlgebraicCycles, head #1313 | §0.5b Gersten; §§7.6a,7.6b at 1401,1412; §§7.8,7.10 at 1441,1477: real cohomology/components, equivariant cycle maps, Lefschetz and real Enriques Picard image. |
| AlgebraicTopologyPartII, head #1694 | Layer 6 at 836; §7.4 at 908; §§9.2–9.3 at 980,1003; §§10.3,10.5 at 1080,1116; §§12.1–12.2 at 1237,1252; §§14.1–14.3 at 1331,1354,1367; §§15.1–15.6 at 1403,1426,1447,1461,1474,1487; §§16.1–16.4 at 1523,1673,1688,1701. Trace signs, cyclic reduction and chase indeterminacy agree with this package. |
| AlgebraicTopology, main | Former Stage 6 maps to §§6.0–6.5 at README:879; Layer 6 starts at 2136. The retained numbering map makes this citation valid. |
| ComplexComparisonPartII, head #848 | §§C5.2,C5.3,C6.2,C6.3 at 3257,3584,4853,4896: smooth proper transport/Hodge and complex comparison. The real comparison is a declared gap. |
| ShimuraData, head #1038 | §3.1 at 355: Variation with actual local system, connection and filtration. Surface-specific infinitesimal analysis remains owned here. |
| AffineMorseLefschetz, main | A3 at 534 and A5 at 1323: affine CW/cohomology bounds and integral weak Lefschetz. The hyperplane-complement smoothness hypothesis is retained. |
| QuadraticFormInvariants, main | Layers 0,1,2,4,5 at 407,585,703,970,1114: diagonal/Witt/quaternion/Clifford inputs, many already discharged in Tau Ceti. No dependency on an open revision was introduced. |
| SemisimpleAlgebras, main | `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md:293–320`, Layer 6: class group and finite separable splitting/maximal-subfield interfaces. |
| RealAlgebraicGeometry, completed main | `Completed/RealAlgebraicGeometry/README.md:128`, Layer 1; ordered algebraic closure and real-closed algebra. Its native declarations are used directly. |
| EnriquesSurfaces, head #1286; WeilConjectures, head #1208 | Enriques §§1.1,1.3,1.4 at 123,181,205, and WC.7 at 1848: canonical cover, integral Picard/cohomology, finite Kummer Brauer term and the characteristic-sensitive Enriques definition. |
| FormalLaurentPuiseux, main | L4 at 195, L5 at 233; root theorem at 249 and algebraic closedness at 269–273. R03 corrects the consumer's allocation. |
| StableReduction; ModularCurves; PurityOfBranchLocus, main | Layer 4 at 529; 4D at 1882 with miracle flatness at 1919; §2.3 at 371. Blowups/intersections, equal-dimension regular flatness and branch purity retain their hypotheses. |

The overlap file has no conflicting head, dropped cited id, or revision-only id. The closest heads #1834, #1694 and #1313 were checked by object. Cohomology, trace topology and Picard-image ownership are imported from the latter two rather than duplicated. F04's still-existing Tsen–Lang duplication in #1834 is the settled external repair described above; this report does not conceal it as a clean overlap result. The main QuadraticFormInvariants interfaces, rather than revisions #1411/#617, are the suppliers. Fresh `roadmaps grep RealSurfacePeriodIndex` found only #1834 README:116,2026, so the swapped layers have no broken external number citation. The board's package index was read before the absence searches.

All three declared gaps have the same slug in `design/plan.json` and under Exact supplier contracts:

- `real-artin-comparison`: ComplexComparisonPartII §C6.3 currently states complex comparison, not the real-equivariant comparison with cup/boundary compatibility.
- `picard-cokernel-torsion-free`: MotivesAndAlgebraicCycles §7.8 uses the fact inside its divisor theorem; a named smooth-real-variety statement is still needed. BW20 Proposition 2.9 supports it.
- `at2-stratified-pair-transport`: AlgebraicTopologyPartII §16.2 assumes invariant compatible control data. Existence for the specified proper stratified submersion is the missing contract.

These are precise named-supplier contracts, not unowned prerequisites, and do not contribute to the finding count.

### Shape and principles

The shape comparison used main AlgebraicTopology, SemisimpleAlgebras and completed RealAlgebraicGeometry. The package has the required summary, scope, conventions, supplier contracts, mathematical layers, Examples/Dependencies and references. Definition sections retain their API and at least three discriminating Checks; the theorem-only sections need not each invent definitions. There is no re-planning of an existing RealSurfacePeriodIndex roadmap, route-only prime restriction, computational algorithm, copied source passage, prohibited supplier edge, or unexplained mathematical carrier identified. The two independent branches now have the roadmap's own order. R02 remains a completeness defect in the proof inputs.

Suggested.lean contains the single Mathlib import and only the three used TauCeti modules, in the pin's public-module syntax; one module docstring; the correct namespace and layer comments; one actual definition and eight admitted theorems. No sorry'd data, `set_option`, admitted example, API padding, `lemma`, or arbitrary Prop field appears. README/Lean name and generality checks pass. No process residue or machine paths were found in the roadmap text. The source and metadata TOML files parse. Only this review report and review.json were written in the package.

## Not verifiable

The following primary texts remain settled **uncertified**, because their full legal texts are unavailable in the supplied cache. Their locators were retained, not guessed, fetched again or converted into requests: BCR; ARA75; SPR55; EL73; BRO80; DK96; CTP90; SER06; SCH94; GG73; BRE97; DIM85; DIK00. This includes the BCR primary Harrison/Nash/Puiseux passages, Springer's original article, and the original classification source for real Enriques halves. Accessible EKM, B19, MVH98 and BW20 passages provide the corroboration identified above, not certification of the unavailable primary text.

The claimed general real-Artin comparison, Picard-cokernel result as a named supplier theorem, and invariant-control-data existence cannot yet be checked as implemented supplier declarations; they are the three explicit contracts, not findings. Lean elaboration and small computations do not certify proofs of the eight admitted headlines. No running Lean job or module build was left behind.

## Source issues

- **Misprint** in CT05 at proof of Theorem 3.14, printed pp.401–402 (lines 916–919,935,953–955): the source says the distinguished splitting fibre is at zero; it should be at one for the displayed family, or the parameter should be reversed; affects the proof.
- **Error** in B19 at Proposition 4.4, printed pp.81–84, especially after (4.8) (lines 858–861): the source says the topological obstruction always vanishes under the stated fixed-cover assumptions; it should vanish exactly when the evaluation-weighted covering class lies in the restricted integral degree-one image; affects a stated result.
- **Gap** in B19 at Proposition 4.5, printed pp.84–85 (lines 880–903): the source says an integral lift can be adjusted unconditionally by integral and Picard classes; it should require realization of the evaluation-weighted class and compare with a normalized integral lift; affects the proof.
- **Gap** in B19 at Proposition 4.5, printed p.85 (lines 898–903): the source says vanishing on the avoided set directly supplies the pushforward correction; it should first subtract the permitted curve classes to enter the pushforward image; affects the proof.
- **Gap** in B19 at §4 and Proposition 4.2, printed pp.79–80 (lines 668–687): the source says the permitted cover has a function field; it should use componentwise generic restrictions until integrality is established; affects a stated result.
- **Misprint** in B19 at (5.7), printed p.88 (line 1026): the source says the normal-sequence connecting map lands in degree zero; it should land in degree one; affects nothing.
- **Gap** in B19 at Lemma 1.4, printed p.70 (lines 281–285): the source says an arbitrary integral Brauer lift reduces to the prescribed Kummer pullback; it should first be normalized by a Picard class; affects the proof.
- **Misprint** in B19 at Proposition 6.7, printed p.95 (line 1286): the source says the half-period hypothesis applies to every period; it should be imposed only for even period, with the odd case separate; affects nothing.
- **Misprint** in B19 at Theorem 0.6 proof, printed p.107 (line 1783): the source says the class with zero degree-zero component is unique; it should be the unique nonzero such class; affects nothing.
- **Error** in B19 at Theorem 0.6 proof, printed p.107 (lines 1786–1790): the source says the one-half case may have odd total Euler parity and nonalgebraic w₁; it should exclude this branch because w₁ is algebraic and self-orthogonal; affects the proof.
- **Gap** in EKM at Theorem 97.2 proof, printed p.385 (lines 20229–20233): the source says positive i and degree greater than one suffice to invoke the normic-form lemma; it should separate algebraically closed fields for every i; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "271e9a035f6fc5c6f307d580f14faa41f9ff27c3", "job": "REV-PKG-RealSurfacePeriodIndex~4", "model": "gpt-6-astra", "worker": "chris-9"} -->
