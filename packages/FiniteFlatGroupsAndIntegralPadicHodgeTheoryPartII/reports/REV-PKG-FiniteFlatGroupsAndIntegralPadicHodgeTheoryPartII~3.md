<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1244#issuecomment-6399172825 -->
Review (codex) of 62d1f62

Verdict: needs_changes

1. **F01** (P2) Repeated copies require positive multiplicity

   **Location.** `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md:872`: “Inductively any finite direct sum of isomorphic copies is very good.”

   **Claim.** Very-goodness holds for every finite multiplicity, including zero, starting with a very-good faithful Hodge representation.

   **Witness.** For p=3, take G=G_m, Λ=ℤ₃ and its standard weight-one representation. Zero copies give Λ⁰=0 and GL(0)={1}; distinct units 1 and −1 have the same image. The resulting representation is not faithful.

   The original rank-one embedding is the identity G_m=GL₁, with point local model and no cutting-tensor equations, so it is good and very good. In contrast, the zero-copy map has kernel G_m and is not a closed immersion. Very-goodness in §2.10 requires a good integral Hodge embedding. The package itself recognizes this obstruction at `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md:916`: zero PEL multiplicity is not faithful. KPZ26 line 2412, Lemma 5.3.7(b), pp.55–56, proves the two-copy step starting with a good embedding; it does not give a zero-copy base case. Remark 5.3.8 discusses doubling.

   **Exact repair.** Replace the quoted sentence by the assertion for n≥1 isomorphic copies, or equivalently a nonempty finite family. Keep the intertwining and cocharacter hypotheses. Add the zero-copy G_m example as a negative-control Check. Keep §3.12's determining segments nonempty; no change is needed to the already explicit s≥1 hypotheses in §§3.15 and 3.17.

   **Retest.** At n=1 the representation is a↦a and has trivial kernel. At n=2 it is a↦diag(a,a), again with trivial kernel. The projections and the identity intertwiner impose equality of the two block actions. At n=0 both 1 and −1 act by the unique automorphism of 0, so the repaired hypothesis excludes exactly the demonstrated failure.

2. **F02** (P3) The rigid-section construction is on page 24

   **Location.** `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md:1052`: “KZ25, §3.2.5–3.2.6, p.23; KZ25 line 1044”.

   **Claim.** Page 23 contains the cited construction of the tensor-preserving section with its prescribed first-order reduction and its ambient GL extension.

   **Witness.** KZ25 line 1042 starts page 24; §3.2.6 starts at line 1044. The section and its ambient extension occur at lines 1055–1063, in the proof of Proposition 3.2.7 on page 24.

   **Exact repair.** Cite “KZ25, §§3.2.5–3.2.6, pp.23–24, especially the proof of Proposition 3.2.7, p.24; KZ25 lines 1055–1063”. Retain the KP18 locator and its explicit very-goodness correction.

   **Retest.** Page 23 supplies the tensor torsor and first-order compatibility condition; page 24 supplies both requested lifts. The mathematical statement, including existence rather than uniqueness, is supported with the repaired locator.

Two findings: one P2 and one P3; one blocking finding. This is a repairable Part II extension. All three findings in the preceding review are repaired. The mathematical scope and the declaration-free Lean acceptance test are appropriate. No authored package file was changed in this review.

## Verified sound

The review covered the 92 numbered targets, all 92 Needs lines, seven layer dependency summaries, conventions, scope, supplier contracts, references, metadata, source manifest and Lean file. It read the previous review and repair report first. For unchanged material it used only the previous review's tables with computed values: its 92-target table, definition/API table and convention/gap tables. None of their summary-only assertions is used as mathematical evidence. The three repaired interfaces, their downstream uses, all 15 newly seeded targets and the headline results were independently rechecked below. In particular the old positive-copy test for §3.10 was extended to multiplicity zero, producing R01.

There are 44 Checks blocks with at least three bullets each, 138 bullets in total. The definition blocks have prose APIs. All seven layers end with Examples and Dependencies. Main-branch `TauCetiRoadmap/ComplexTori/README.md` and `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md` supplied the shape comparison. No computational algorithm, copied source passage, process narrative, forbidden Lean option, sorry'd data or route-specific replacement was found. The wild standard type-A cases at p dividing the division index, Dᴴ cases, nonconnected fixer/component steps, ramified coefficients and rational nonunit quasi-isogenies remain present.

### Previous findings checked individually

Quotes in this table are from the repaired package, not source passages. All locations refer to `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md`.

| Previous finding | Repaired passage | Status and witness |
| --- | --- | --- |
| F01: opposite translation convention | Line 1468: “Relabel the same translation element by t_here^λ=t_RG^(−λ)”; line 80 also records the adapter in the supplier contract. | **Repaired.** The same affine Weyl elements, alcove, parahorics, Frobenius, order and length are retained. In G_m the adapted label 1 gives p and κ=1. In GL₂ it gives diag(p,1), determinant valuation 1, length 1. The supplier's negative label is explicitly converted. |
| F02: redundant normal-section gap | Line 46 names Part I §R07.2.27, `deJongBoundedFormalFunctions`; line 636 says “Apply FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.27”. | **Repaired.** The old gap slug is absent from both README and plan; the existing theorem is consumed at §§2.6 and 3.5 and in Layer 2 dependencies. For x/p in ℤ_p[[x]], x↦π with π²=p gives valuation −1; the constant 1 has valuation 0 everywhere. The specialization satisfies the supplier's formal-normality and O-flatness assumptions. |
| F03: ambient versus restricted connection | Line 1341: “The ambient connection has coefficients in Lie(GL(D)); its restriction to R_G in the tensor frame has coefficients in Lie(G)”. | **Repaired.** §§5.10–5.12 consistently distinguish the two connections and retain rational Frobenius stability. Line 1343 gives the correct quotient arrow A′_G→A_G. In the torus example the ambient coefficient is −E₂₁ at the origin, while its restriction to t=0 is zero. |

No finding in the latest repair report was marked not actionable. The earlier settled objection to an empty Lean file is not reopened: the explicit acceptance-test policy permits it, and the pin audit confirms the carrier obstruction.

### Computed pass on repaired passages and repeated patterns

Write W=W(k), K₀=W[1/p], ε²=0, and E_ij for a matrix unit. Computed examples test the assertions and their conventions; source and supplier checks supply the general argument. A passed example alone is not a proof of a theorem.

| Statement / interface | Instances tried | Values computed on both sides | Result / change |
| --- | --- | --- | --- |
| Translation adapter, contract and §§6.0–6.1 | G_m, μ=1; trivial group, μ=0 | t_here¹=t_RG⁻¹ has representative p and κ=ν=1; unadapted t_RG¹ gives p⁻¹ and −1. Trivial group has Adm={1}, κ=ℓ=0 and σ(1)=1. | Pass; no residual use of the old sign found. |
| Frobenius and straightness through adapter | Unramified torus with σ exchanging two coordinates; λ=(1,0) | σλ=(0,1); translation product has valuation (1,1), average (1/2,1/2); ℓ(product)=0=2ℓ(t). | Pass; this tests nonidentity Frobenius. |
| Dominant label, length and ordinary scope | GL₂, μ=(1,0); supersingular b | dom(−μ)=(0,−1); adapted diag(p,1) has length 1, its square length 2 and slopes (1,0). Supersingular slopes (1/2,1/2) differ from μ-average (1,0). | Pass; same elements are relabelled, not negated inside a fixed Bruhat order. |
| Normal bounded-function input, §2.6 and §3.5 | R=ℤ_p[[x]], s=x/p or 1; π²=p | v_K(π/p)=1−2=−1, so x/p fails both integral-section and bounded-function tests; v_K(1)=0 and norm 1 satisfy both. f=p gives f/p=1; f=1 gives 1/p, not integral. | Pass; import supplies section detection, while Witt-coordinate division remains local work. |
| Section detection hypotheses | Nonnormal A=O⟨πt,t²⟩; generic map ℤ_p→ℚ_p | t is bounded and integral over A but absent from A; localization kills the closed fibre, whereas a pointed local detector retains it. | Pass; normality and pointed flatness detection are not conflated. |
| Ambient connection, §5.10 | F=(1+tE₂₁)diag(p,1), φ(t)=t^p, p=3 and 5 | N=nE₂₁, n=−Σt^(p^r−1); both sides of n+1=t^(p−1)n(t^p) have coefficients −1 in degrees 2,8,26 for p=3 and 4,24 for p=5, through degree 30. N(0)=−E₂₁. | Pass; ambient Lie(GL₂), not diagonal Lie(G). Coefficients were also checked using exact rational arithmetic. |
| Horizontal tensors and equality of loci, §§5.10–5.11 | Same ordinary torus, tensor E₁₁, Fil¹=Re₁ | h=Σt^(p^r)/p^r satisfies h′=−n and h=t+h(t^p)/p. Horizontal tensor E₁₁+hE₂₁ preserves Re₁ iff h=0. h/t has constant 1, so (h)=(t); both rational loci are K₀. | Pass; ambient commutator [−E₂₁,E₁₁]=−E₂₁, restricted connection form 0. |
| Smooth adapted quotient, §5.12 | GL₂ with empty tensors; diagonal torus cut by E₁₁ | Rings W[[t]] and W have relative dimensions 1 and 0, matching dim(G/P)=1 and 0. The latter quotient sets t=0. | Pass; no ambient Lie(G) assertion survives in the proof route. |
| Central modification after adapter, §§6.2–6.4 | E=u−p, ordinary pair, F=𝔖e₁⊕E𝔖e₂ | Θ(e₁)=e₁, Θ(Ee₂)=−e₂. c_E=−E, so Θc_E=diag(−E,1), specializing to diag(p,1); central Levi fixes Ke₁. | Pass; Θ's E⁻¹ coordinate is integral between its stated source and target lattices. |

The changed source-dependent steps were reread at KZ25 lines 336–390, 526–544 and 1133–1176, deJong95 lines 2952–2967 and 2988–3016, and Kisin17 lines 4253–4274. The repaired patterns were searched throughout the package: the ordinary layer uses the adapter; the removed gap has no remaining reference; Lie(G) in the connection argument applies only after restriction. Positive multiplicity already appears in §§3.15 and 3.17, and the negative control in §3.14 confirms the new R01 boundary.

### Seeded sources and adversarial calculations

All 15 requested targets were read at their locators. The manifest distinguishes author-version pages from published pages: KZ25 is arXiv v2, Kisin17 the 99-page author version, Zhou20 arXiv v2, Hoff23 v1, and KPZ26/vanHoften24 the published versions. No locator is separately flagged unverified; RZ96 is the settled uncertified work discussed below.

| Target and source read | Instances tried | Computed values on both sides | Result / source boundary |
| --- | --- | --- | --- |
| **0.7 Relative Dieudonné–Witt frame**, README:243; KPZ26 §5.1.1(b), p.48, line 2092; Hoff23 Notation 1.19 and Lemma 1.21, pp.13–14, lines 607–638 | Kernel b=0; square-zero PD kernel b=(ε); Vx | At b=0 the relative frame is the absolute frame. Logarithmic ε in the enlarged kernel is sent to 0 by φ₁; Vx is sent to x. Reduction kills ε. | Pass. The source retains nilpotent compatible divided powers and the continuous inverse-limit extension; an arbitrary ideal enlargement without those data is not claimed. |
| **1.2 Tilde factorization**, README:406; KPZ26 §5.1.8, Lemma 5.1.9, p.50, lines 2174–2186 | Identity enlargement, then two nested ideal enlargements on a split normal pair | τ=I on its normal basis; τ₂τ₁=I=τ₂₁. A graph coefficient ε killed in the final quotient becomes 0 by either route. | Pass. Same coefficient ring, enlarged frame ideal and strict maps are explicit. This is not arbitrary nonstrict Breuil–Kisin base change. |
| **3.10 Isomorphic copies**, README:870; KPZ26 Lemma 5.3.7(b), pp.55–56, lines 2412–2437, Remark 5.3.8, lines 2439–2443 | Standard G_m representation repeated n=0,1,2; identity intertwiner | Ranks 0,1,2. Kernels G_m,{1},{1}. On two blocks diag(a,b) commutes with the swap/intertwiner iff a=b. | **R01.** Source supports transfer and positive repetitions; zero repetitions destroy the embedding. The source's “good”/“very good” typo is recorded below. |
| **3.12 Determining segment**, README:888; KPZ26 §5.2.4, p.54, lines 2345–2357, and Lemma 5.3.7 | Nonempty segment of period r and a doubled segment; lattice pΛ | Total ranks rh and 2rh; inclusion followed by projection is I_rh. Multiplication by p from Λ to pΛ is I in their respective bases. | Pass. The source explicitly states determining-segment independence. Periodicity is an isomorphism of the named lattices, not a unit automorphism of Λ. |
| **4.4 Integral crystalline and Witt comparison**, README:1028; KZ25 Proposition 3.3.2(1), p.25, lines 1083–1097; KP18 Proposition 3.3.8, p.180, lines 2433–2456 | Étale and multiplicative lines; evaluation tensor | L=ℤ_p and ℤ_p(−1), crystalline F=σ and pσ, Fil¹ ranks 0 and 1; evaluation tensor maps 1 to 1. A period factor t is not an integral unit before inversion. | Pass. Smooth prescribed full fixer and surrounding integral tensor-type hypotheses are retained; rational comparison alone is insufficient. |
| **4.6 First-order rigid section**, README:1050; KZ25 §§3.2.5–3.2.6, pp.23–24, lines 1026–1063; KP18 §3.2.12, p.173, lines 2189–2202; KPZ26 Remark 7.1.4(1), p.73, lines 3207–3211 | c=I+εE₂₁; empty tensors; torus projector | Ψ=Ψ₀(I−εE₂₁) gives Ψc=Ψ₀. cE₁₁c⁻¹=E₁₁+εE₂₁, so that c cannot prescribe a torus section. Distinct congruence lifts have equal reduction. | Mathematical pass; **R02** corrects the page. Very-goodness, not smoothness alone, puts the prescribed reduction in the tensor torsor. |
| **4.8 Tangent lifting at a DVR point**, README:1080; KP18 §3.1.14 and Lemma 3.1.15, pp.168–169, lines 1973–2007 | R=O_K[[t]], marked t=0; t↦aε in O_K[ε] | Lifted line is span(e₁+aεe₂); a=0 and a=1 give different marked tangent vectors, each lifting the same residual line. Tangent space has rank 1. | Pass. O_K-linearity, marking and the fixed special filtration are retained. |
| **5.3 Toral weak admissibility**, README:1213; Kisin17 proof of Theorem 2.2.3, p.32, lines 1442–1458 | Rank-one δ=p^m, μ_T(z)=z^(−m), m=0,1 | The inverse filtration jump is m, so t_H=m=t_N. For m=1, wrong jump 0 gives 0≠1. For rank zero both degrees are 0. | Pass in the source's toral-centralizer and Newton-average setting. The independent general criterion's RZ96 Proposition 1.21 text remains uncertified. |
| **5.6 Hodge cocharacter and Frobenius coset**, README:1258; Kisin17 Lemma 1.1.12 and proof, p.9, lines 391–409 | b=diag(p,1); swap of the chosen frame | μ₀=diag(z⁻¹,1), υ₀=diag(z,1), p^υ₀=diag(p,1). Swapping gives diag(1,p) and line e₂, not e₁. If b=h₁p^υ′h₂, then b=(h₁h₂)p^(h₂⁻¹υ′h₂). | Pass. The proof supplies the cocharacter compatible with the marked filtration, not an independently prescribed cocharacter from a double-coset label. |
| **5.13 Universal étale tensors**, README:1357; Kisin17 Lemma 1.1.17, pp.10–11, lines 447–477, and proof of Proposition 1.1.13, lines 422–446 | Constant evaluation/projector on a connected family; disconnected negative control | Specializations of evaluation equal 1; projector eigenvalues stay 1,0. On a disjoint second component p⁻¹id is nonintegral although the first component's id is integral. | Pass. Connected integral base, fixed integral tensor type, horizontality, φ invariance and Fil⁰ are used with the declared relative-constants contract. |
| **5.16 Lattice specialization**, README:1396; Kisin17 §1.2.16 and Lemma 1.2.18, pp.15–16, lines 688–721 | g=1,p,ph with h∈W× | Crystal lattices W,pW,pW have κ=0,1,1. Dual Tate lattices are T,p⁻¹T,p⁻¹T. Right-coset changes preserve the lattice. | Pass. Rational g is allowed. The integral-group misprints in the source are not propagated. |
| **5.17 Adapted isogenous realization**, README:1417; Kisin17 Proposition 1.1.19, pp.11–12, lines 484 onward | Central g=p on height h=1,2; g=1 | Index of pD in D is p^h, namely p,p²; quasi-isogeny and inverse have heights h,−h. g⁻¹bσ(g)=b for central p. g=1 leaves the marking unchanged. | Pass. Finite extension, specified admissible filtration, integral tensor lattice and conjugated fixer remain explicit. General perfect residue is covered by a declared realization extension, not silently supplied by finite K/ℚ_p. |
| **5.19 Central quotient specialization**, README:1447; Kisin17 Lemma 1.2.19, p.16, lines 722–740 | f=id on G_m; g=p, then ph | Both quotient crystal cosets are pW×; phW×=pW×. Under det:GL₂→G_m, diag(p,1) has quotient valuation 1 on both sides. | Pass. Central Galois image and the common compatible tensor frame are hypotheses. |
| **6.5 Rational σ-centralizer action**, README:1547; KZ25 §3.4.4 and Theorem 3.4.5, pp.27–28, lines 1177–1219 | Ordinary pair; p,p⁻¹; noncommuting g=[[1,1],[0,1]], h=[[1,0],[1,1]] on two étale factors | Ordinary J_b(ℚ_p)=(ℚ_p×)² preserves Ke₁. Scalar heights are h,−h. gh=[[2,1],[1,1]], hg=[[1,1],[1,2]], and T_p(q_h∘q_g)=(gh)ᵗ. | Pass. The action is rational in the isogeny category with the stated right-action convention; no integral-unit restriction. |
| **6.6 Specified Levi filtration**, README:1558; Zhou20 v2 §5.5, pp.18–19, lines 753–774; vanHoften24 Appendix A.4.3, pp.64–65, lines 2799–2833 | G=M; diagonal M in GL₂ with specified line | For G=M the forgetful map is identity. In GL₂ adding E₁₁ forces the graph parameter t=0, so tangent dimension falls from 1 to 0; forgetting it restores the ambient line. | Pass. The M-valued filtration, compatible fixer and very-good local-model data are given; the theorem does not manufacture a nonordinary filtration or assert global component surjectivity. |

### Headline theorems, values and statability

The following is the complete list of 21 headline groups from the README and the corresponding module-docstring entries. “Missing” means absent at the specified pins, not that the necessary carrier should be simulated by an empty predicate. The computed rows include the nonsampled headlines; sampled headlines retain the stronger checks in the table above.

| Headline / README targets | Computed test or convention | Carrier missing at the pins and named in the module |
| --- | --- | --- |
| Perfect-ring Dieudonné anti-equivalence, 0.2/0.5 | Multiplicative line has F=p,V=1,FV=VF=p; étale line has F=1,V=p. On F_p×F_p a projective example has ranks (0,1), so there is no global rank-one basis. | General p-divisible-group category and integral finite-projective Dieudonné category. |
| Complete-local display anti-equivalence, 0.13 | On the ordinary rank-two pair Ψ=I yields F=diag(p,1), dimension 1 and height 2. Zero group gives zero module and its unique comparison. | Zink coefficient ring, frames, displays and crystalline p-divisible functor. |
| Universal marked displays, 1.8 | The two maps t↦0,ε give distinct marked lines e₁ and e₁+εe₂. Tangent dimension is d(h−d)=1 for (h,d)=(2,1), and 0 for (1,0),(1,1). | Marked deformation functor and its formal base. |
| Integral filtration/tilde tensor torsors, 2.4/2.6 | F=𝔖e₁⊕E𝔖e₂ has quotient (𝔖/E)e₂. Empty tensors give GL₂; projector E₁₁ cuts the diagonal torus, with identity section. | Integral fixer, filtration local model, invariant tilde functor and tensor torsor. |
| Formal/arithmetic curve criteria, 3.7/3.9 | On a smooth flag chart t↦u has derivative 1; t↦u² has derivative 0. For π²=p, t↦π has nonzero relative first jet, t↦π² has zero first jet. | Good Hodge embeddings, local models and canonical first-order transport. |
| Nonexceptional very-good chains, 3.13/3.16 | GL₂ has flag dimension 1 and π₁(SL₂)=0, order 1 prime to p. An index-3 division algebra at p=3 fails NE and is treated separately. For π²=p and M=πO_Le⊕O_Lf, M^Γ=pWe⊕Wf and its dual We⊕p⁻¹Wf equals (δ⁻¹M♯)^Γ for δ=2π; omitting δ gives W². | Parahoric models, integral Hodge embeddings and pointwise very-goodness. |
| Dᴴ PEL and enlargement, 3.14/3.17 | Quaternion i²=−1,j²=3: the balanced tensors i⊗1 and 1⊗i both pair to Trd(−1)=−2. Reversing the Hermitian arguments gives incompatible +2 and −2. Split alternating values are 1 and −1. | Classical integral fixer/lattice-chain representations and their tensor displays. |
| Wild standard type-A and enlargement, 3.11/3.15 | Index-3 division algebra has Q₃-dimension 9 and division uniformizer valuation 1/3. Paired chain p^(−i)W² has dual p^iW²; same-index Wp⁻¹e⊕Wpf is incomparable with W². | Integral division-algebra chains, local models and tensor displays. |
| Integral crystalline comparison and étale recognition, 4.4/4.14 | Étale/multiplicative factors give Frobenius 1,p and Hodge jumps 0,1; evaluation stays 1. Omitting the −1 twist gives the wrong line. | Crystalline Galois lattices, p-divisible Tate/crystalline realizations and integral tensor types. |
| Versal adapted deformation, 4.12 | GL₂ and its diagonal torus give W[[t]] and W; the adapted torus condition is t=0. Generic and special marked filtration are retained. | Marked p-divisible deformation functor, adaptedness, very-goodness and local-model quotient. |
| Universal marked parahoric displays, 4.13 | In the hyperspecial GL₂ chart the parameter t has one tangent direction; marking t=0 fixes the residual display. c=I+εE₂₁ differs from I although multiplying by diag(1,p) can erase the ε term modulo p. | Parahoric display category, local-model pair and integral tilde torsor. |
| Hyperspecial Breuil–Kisin tensor frames, 5.1 | Identity and E₁₁ are preserved by a diagonal frame. I+εE₂₁ transports E₁₁ to E₁₁+εE₂₁ and is rejected by the torus. | Crystalline-lattice functor and reductive integral tensor-isomorphism torsor. |
| Explicit hyperspecial adapted lift, 5.7 | E=u−p gives c_E=pE/E(0)=−E and c_E(0)=p. For E(0)=ap, c_E(0)=p again; unnormalized E specializes to ap. | Height-one Breuil–Kisin category, integral crystalline comparison and p-divisible realization. |
| Frobenius-pullback connection integrality, 5.8 | φ(t)=t^p gives dφ=p t^(p−1)dt; dφ((1/p)dt)=t^(p−1)dt is integral. The identity base change leaves (1/p)dt nonintegral. | Smooth-base Dieudonné crystals and their integral connection lattices. |
| Toral weak admissibility, 5.3 | Rank-one inverse filtration has jump m and t_H=t_N=m; the wrong jump 0 at m=1 gives 0≠1. | Filtered tensor G-isocrystals, cocharacters, Newton invariants and admissibility. |
| Horizontal/adapted equality and smooth quotient, 5.11/5.12 | h/t has constant 1, hence (h)=(t). The torus's two loci are K₀ and its integral quotient W; dimensions 0=dim(T/P). | Universal crystalline connection, transported tensors and both formal loci. |
| Lattice specialization and Kottwitz equality, 5.16/5.18/5.19 | g=p gives pL, dual p⁻¹T, κ=1; g₀⁻¹bσ(g₀)=p for b=g₀=p. Changing by a right unit leaves pW× unchanged. | Integral Breuil–Kisin family, reductive affine Grassmannian and component maps. |
| Adapted isogenous realization, 5.17 | pD has index p^h and inverse map p⁻¹ has height −h; both rational compositions are 1. | Filtered crystalline tensors, p-divisible realization and integral comparison lattices. |
| Ordinary integral σ-conjugacy normalization, 6.0 | Adapted GL₂ translation has determinant valuation 1, slopes (1,0), length 1, squared length 2. Supersingular (1/2,1/2) fails ordinary equality. | Parahoric group schemes, affine Weyl action and ordinary G-isocrystal classes. |
| Central ordinary lift with full rational action, 6.3–6.5 | Θc_E=diag(−E,1) specializes to diag(p,1). Central p and p⁻¹ have opposite nonzero heights; the noncommuting example above fixes the right-action law. | Newton-Levi tensor modification, height-one realization and p-divisible isogeny category. |
| Specified nonordinary Levi lift, 6.6 | Adding E₁₁ to the GL₂ filtration cuts the graph parameter to 0; G=M gives identity forgetful map. | Compatible Levi local models, very-good embeddings and marked deformation functors. |

No statable omitted headline was found. Finite-projective F,V equations can be expressed on native modules, but their anti-equivalence headline still needs the missing group category. Abstract matrix identities cannot replace tensor deformation or local-model existence. Generality is therefore not reduced to a scalar stand-in in Lean.

### Pin audit and declaration checks

The manifest pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Their source files, including surrounding variable blocks, were opened anew. The provided content checkout was HEAD `794d0fcddfd32a8c6bb445faa33347cc578f43b0`. For existing-roadmap citations the main versions returned by the roadmap service were also read; SchemeAndStackFoundations and ModularCurves were text-identical to the supplied checkout.

| Pinned file | Declaration and inspected content | Boundary |
| --- | --- | --- |
| `Mathlib/RingTheory/WittVector/Defs.lean:52` | `WittVector`, field `coeff : ℕ → R` | Native coefficient carrier, not the decay-defined Zink subring. |
| `Mathlib/RingTheory/WittVector/Frobenius.lean:218` | `WittVector.frobenius`; prime and CommRing variables at line 52 | Ring endomorphism on Witt vectors; no display frame. |
| `Mathlib/RingTheory/WittVector/Frobenius.lean:283` | `WittVector.frobeniusEquiv`; `CharP R p` at line 252 and `PerfectRing R p` | Equivalence is not asserted over arbitrary mixed-characteristic coefficient rings. |
| `Mathlib/RingTheory/WittVector/Verschiebung.lean:109` | `WittVector.verschiebung`; coordinate law line 150 and injectivity line 154 | Additive shift with zero initial coordinate; no divided Frobenius on a relative PD frame. |
| `Mathlib/RingTheory/WittVector/Isocrystal.lean:113` | `WittVector.Isocrystal` extends a fraction-field module with `frob` a semilinear equivalence; domain/CharP/perfect assumptions at line 73 | No finite-dimensionality field, integral lattice, filtration, p-divisible category or tensor deformation problem. |
| `Mathlib/RingTheory/DividedPowers/Basic.lean:77` | `DividedPowers`; `dpow_mul` at line 86 assumes membership in the specified ideal; `dpow_null` at line 80 | PD operations on an ideal, not a completed Fontaine envelope. Off-ideal total-function values are prescribed separately. |
| `Mathlib/RingTheory/Grassmannian.lean:66` | `Module.Grassmannian`, finite/projective quotient and `rankAtStalk_eq` fields | Quotient rank, not submodule rank; not represented scheme geometry. For (h,d)=(2,1) both ranks are 1; at (1,1), quotient rank is 0, distinguishing conventions. |
| `TauCeti/Algebra/AlgebraicGroup/Reductive/Over.lean:38` | `TauCeti.reductiveCommHopfAlgPropertyOver` | Smoothness and geometric connected reductive fibres, not an integral full-fixer/local-model construction. |

Object searches in both pins covered Barsotti–Tate/p-divisible categories, Zink rings, Dieudonné displays, Breuil–Kisin modules, crystalline representation categories, parahorics, local models, integral tensor fixers and Kottwitz components. Ordinary Witt operations, fraction-field isocrystals, abstract divisibility and Cartan–Dieudonné references do not supply the missing carriers. The package imports native Witt and PD objects rather than restating their API.

The required `lake env lean` invocation on `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/Suggested.lean`, run from the supplied pinned content checkout, exited **0 with no output and no warnings**. The file is 60 lines, has exactly one `import Mathlib`, one module docstring, the required namespace and **zero authored declarations**. No TauCeti module build was needed. Mechanical declaration enumeration returned the empty list: there are zero signatures for `#check @name`, zero sorried theorems for the one-tactic probe, zero sorry'd data definitions and zero padding declarations. No extra Lean build was used to substitute for a truth check.

### Ownership and current cross-roadmap resolutions

The board package index was read before absence judgments. The roadmap service's index of 2026-10-25T14:06:45Z contained 363 open roadmap pull requests. Object searches used `roadmaps grep`, followed by `roadmaps show` for relevant results, rather than relying on similarly named targets. Existing-roadmap revision heads were not taken as suppliers.

Relevant overlapping objects resolve as follows:

- Part I supplies perfect-field Dieudonné theory, Breuil–Kisin theory, realization and bounded analytic functions. This package adds complete-local Zink displays, the corrected tensor comparison and deformation constructions, very-good criteria, and ordinary/Levi lifting. The bounded-function extension has correctly been deleted as a new request.
- `TauCetiRoadmap/PELModuli/README.md:2577`, §M2.15, treats W(R) displays in its formal/nilpotent range. It does not supply this complete Zink-ring comparison for all p-divisible groups.
- `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4353` constructs the framed special O_D-linear Drinfeld deformation problem, using its Lie ranks and level structure. It is an application, not a second owner of this general tensor-display library.
- `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/design/README.md:3` and its LT.0–LT.6 list distinguish strict formal modules and quasi-canonical lifts. The scope citation is not a supply edge to its additional theory.
- `packages/GeometricSatakeAndFusionPartII/design/README.md:15` and its local-model discussion at line 130 concern local-model geometry. Here that geometry is requested from the earlier GS0 owner; no upward citation to that Part II is inserted.
- The board's PELModuliPartII design at head `d4bb48d`, `packages/PELModuliPartII/design/README.md:124`, constructs Mihatsch's polarized unitary relative comparison. Its general window prerequisite is expressly assigned upstream at lines 2553 and 2671; it does not claim the general construction as its own.
- The board's ShimuraVarietiesPartII design at head `57dc0a4`, `packages/ShimuraVarietiesPartII/design/README.md:206` and line 224, applies corrected display comparison to normalization branches and geometric Hodge tensors. Its upstream contract at line 1523 requests the display theorem and rational ordinary action, rather than proving them again.
- The board's PadicHodgeTheoryPartII design at head `6502997`, `packages/PadicHodgeTheoryPartII/design/README.md:3`, targets generic crystalline monodromy. CrystallineCohomologyPartII at head `84ea77e`, `packages/CrystallineCohomologyPartII/design/README.md:5`, targets Witt-vector cohomology of singular varieties. Neither owns these integral display deformation statements.

At their indexed heads, four additional board package READMEs were available: AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems and LogicAndDefinabilityInNumberTheory. Fifteen other listed package README paths returned 404, but their design README files were available and searched, including the four relevant designs just discussed. This resolves the previous round's three unread board-package leads. No assertion that those packages exist nowhere is made. No duplicate fully qualified Lean declaration is possible here because this package declares none.

The table below resolves every supplier family used by the package. Paths are `TauCetiRoadmap/<name>/README.md`; line numbers are in those files, excluding the service's transport header. New-roadmap heads are recorded explicitly. The two supplied citation-resolver leads concerning `Crystalline.fontaineEnvelope_*` were checked against PD.7 and are present as planned supplier targets, not missing pinned Mathlib declarations.

| Supplier / version | Sections and file lines opened | What is supplied |
| --- | --- | --- |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory, `34f4657` | R07.1.6–1.8 at 828–960; 1.22 at 1797; 2.10–2.12 at 3314–3391; 2.27 at 4029–4192 | Group carriers, generic full faithfulness, contravariant crystal convention, smooth-base theory and `deJongBoundedFormalFunctions` at 4073. FS_O at 4032 permits formal variables. |
| Same | R07.3.2–3.3 at 4515–4626; 4.1 at 5345; 4.13 at 5895; 4.16–4.21 at 5994–6272; 4.25 at 6405–6434 | Admissibility, Kummer coefficients, tensor lattice functor, height-one realization and dual-Tate comparison. The finite K/ℚ_p condition in R07.4.20 is why the perfect-residue extension remains a gap. |
| AbelianSchemesAndArithmeticModuli, `71ecc01` | A4.CR.7.2 at 2059–2184, especially 2067, 2125 and 2156 | Contravariant crystalline evaluation, dual twist −1, Hodge exact sequence and marked Grothendieck–Messing equivalence. |
| CrystallineCohomology, `013a921` | CR.1 at 601; CR.7.1 at 11177–11277 | Coefficient crystals, completed evaluation systems and tensor/dual/connection compatibility; not automatic algebraization of every completed system. |
| DerivedDeRhamCohomology, `83d00dd` | PD.7 at 2735–2880; `Crystalline.fontaineEnvelope_initial` at 2766 and `Crystalline.fontaineEnvelope_periodPDEnvelope` at 2849 | Relative completed envelope and comparison; full PD ideal containing p is distinguished from the ker θ filtration. |
| PadicPeriodRings, `8839b29` | §3 at 333–356; §4.1 at 359–390; §4.3 at 412–432 | Absolute principal envelope, Frobenius/actions/filtration and fundamental identity; relative constants require the declared extension. |
| SchemeAndStackFoundations, main | §0.6 at 678–757; §1.15 at 2502–2575; §2.3 at 3330–3363 | Reflexive/Hartogs extension, geometric torsors and their common fppf class carrier. |
| Same | §§4.1–4.4 at 5066–5243; §§4.7–4.8 at 5339–5447; §4.12 at 5613–5642 | Lifting, marked deformation/hull and completion inputs. Its generic flattening theorem is not substituted for the declared pointed henselian flatness contract. |
| ModularCurves, main | §0G at 427–443 | Relative Grassmannian charts, gluing and universal quotient. For a free rank-h module the constant finite group of order h supplies the required free Hopf module; rank zero is the trivial Grassmannian case. |
| ReductiveGroupsPartII, `1383569` | RG2.1.5 at 2446, positive Kottwitz at 2625; RG2.2.4 at 3615–3644 | Fundamental group, κ and division-algebra lattice chains. The source's m=0 exception agrees with positive multiplicity here. |
| Same | RG2.3.3 at 4151 and 4335–4367; RG2.3.5 at 4669–4780; RG2.3.7 at 5203–5223 | Fixer/parahoric distinction, algebraic lattice reductions, tame realizations, and connected Lang vanishing. |
| Same | RG2.4.3 at 5994–6027 and 6141–6167 | Affine translations and admissible sets with negative translation labels; README line 1468 now converts them correctly. |
| GeometricSatakeAndFusion, `0652974` | GS0 Witt components at 824–851; bounded admissible loci at 946–966 | π₁(G)_I labels, residual Frobenius, intrinsic local-model v-sheaf and functoriality. Scheme representation/immersion and tangent results are the four explicit gaps. |
| VectorBundlesAndIsocrystals, `c380d7d` | VB0 at 228–251; VB4 at 2293–2304 | Finite tensor isocrystals; scheme torsor/exact tensor-functor dictionary for smooth affine connected integral groups. The full-fixer component step stays separate. |
| PadicHodgeTheory, `4c4f1e8` | §5.5 at 1075–1131 | Perfect-residue admissibility and rational period-torsor class; rational neutrality is not integral torsor triviality. |
| ShimuraVarieties, `d377db7` | §7.0i at 1868–1882 | Absolute Hodge tensors and rational family realizations. The mixed-characteristic rational comparison is explicitly requested, not assumed to follow from an integral moduli model. |
| PELModuli, `e6a4fe8` | M2.15 at 2577–2623 | The W(R) display/formal-group ownership boundary noted above. |

### Declared supplier gaps and direction

The plan and the README exact contracts have precisely the same **14 slugs**, each with a named supplier; none has supplier `none`. The removed `normal-base-integral-section-detection` slug is absent from both. The remaining contracts state their coefficient rings, scheme/group hypotheses and requested conclusion. They request extensions not supplied by the cited sections, rather than treating absent statements as existing exports. The related point-separation/ideal-contraction clauses form the specified formal factorization input; the ordinary-Levi condition is separated from generic cutting tensors. No additional redundancy was found.

| Gap slug | Owner and minimal extension | Computed boundary witness |
| --- | --- | --- |
| perfect-residue-bt-realization | Part I R07.4.20; extend finite K/ℚ_p to finite K/W(k)[1/p] | k=F_p(t)^perf has W(k)[1/p] not finite over ℚ_p; its rank-one module still has F=p,V=1. |
| relative-crystalline-constants | PadicPeriodRings §4.3; relative normal cover identity | In the absolute instance φ-fixed Fil⁰ constants equal ℚ_p; φ(t)=pt≠t. The filtration after inverting t uses the stated union, not localization of Fil⁰ alone. |
| tensor-isomorphism-flatness-descent | SchemeAndStackFoundations §4.12; pointed henselian flattening | A=ℤ_p, module A/p has flattening ideal (p); a local injective detector cannot annihilate p. A→ℚ_p erases the closed fibre and does not satisfy the point condition. |
| formal-dvr-point-detection | SchemeAndStackFoundations §§4.7–4.8; separation and contraction for formal factorization | T maps to π≠0 at a DVR point; nilpotent ε maps to 0 at every DVR point. In O[[T]], intersection (T^n)=0. p-torsion-free quotient is required for I=B∩I[1/p]. |
| punctured-disc-torsor-patching | SchemeAndStackFoundations §1.15; formal gluing on D(p) followed by open descent | Trivial torsors with overlap 1 glue to the trivial torsor on the punctured spectrum; the compatible automorphism fixing both pieces is 1. |
| full-fixer-cutting-tensors | ReductiveGroupsPartII RG2.3.5; finite cutting tensors for the specified full fixers | Empty family cuts GL₂; E₁₁ imposes off-diagonal entries 0 even on W[ε]/ε². I+εE₂₁ fails the latter equations. |
| parahoric-disc-purity | ReductiveGroupsPartII RG2.3.3; extension across the closed point | Trivial G_m torsor extends to free rank-one O[[u]]. Extension alone does not identify a nontrivial residue torsor with the trivial class. |
| full-fixer-component-reduction | ReductiveGroupsPartII RG2.3.3; remove the specified finite étale component class | Component class 1 allows neutral reduction; a nontrivial ℤ/2 class does not. Connected generic fibre does not erase that class. |
| ordinary-levi-full-fixer | ReductiveGroupsPartII RG2.3.3; ordinary Newton-Levi intersection and connectedness | For diagonal M⊂GL₂, M(K₀)∩GL₂(W)=diag(W×,W×)=M(W). Ambient full fixer=connected parahoric is retained. |
| scheme-local-model-representative | GeometricSatakeAndFusion GS0; normalized scheme represents the supplied v-sheaf | GL₂ minuscule model P¹ has generic and special dimensions 1 and reduced special fibre; representability does not follow merely from the v-sheaf's existence. |
| scheme-local-model-hodge-immersion | GeometricSatakeAndFusion GS0; specified repeated Hodge representation and full-fixer cases | Two copies have rank 4 and Hodge rank 2 for the GL₂ type; cocharacter and representation hypotheses are retained. |
| schubert-curve-spanned-tangents | GeometricSatakeAndFusion GS0; stated prime-to-p/no-Dᴴ theorem | A smooth one-dimensional cell has tangent image k from its coordinate curve. At xy=0 the two axes span k², while (t,t) is not a curve in the node since t²≠0. |
| local-model-curve-spanned-tangents | GeometricSatakeAndFusion GS0; reductive restriction-of-scalars local models with stated strata | P¹ has tangent dimension 1 at every point; the Dᴴ statement is restricted to the minimal stratum. |
| integral-hodge-realization-extension | ShimuraVarieties §7.0i; rational mixed-characteristic comparison only | Identity tensor has trace 2g in both realizations; a projector satisfies e²=e on both sides. Integral extension remains the application here. |

The dependency command specified in the brief was run with this package README, name, order and `--movable`. Exit status was 0; its complete output was:

```text
depcheck: 52 roadmaps, 593 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. All 92 Needs lines and supplier citations were read in addition to this mechanical check. Declared gaps are contracts, not defects caused by their present absence. Because the verdict is needs changes, `review.json` does not use the acceptance-only `conditional_gaps` field.

## Not verifiable

- **RZ96, Proposition 1.21:** the primary book text remains the manifest's settled `uncertified` locator-only citation. It was not requested again and was not added to a missing-reference request. Kisin17's accessible toral application on p.32 was read, but does not certify the unread general proposition independently.
- The indexed board package README paths that returned 404 cannot be reviewed as package files. Their available design READMEs at those same heads were searched instead, as recorded above. No unavailable package content is treated as verified. All 15 seeded source passages themselves were readable; there is no new missing-source request.

## Source issues

- **Misprint** in KPZ26 at Remark 5.3.8, p.56, line 2440: the source says goodness of the original embedding suffices for very-goodness of its double; it should be very-goodness of the original embedding, as required by Lemma 5.3.7(b); affects a stated result.
- **Gap** in KP18 at §3.2.12, p.173, lines 2192–2195: the source says smoothness permits the prescribed tensor-compatible first-order section; it should be conditional on very-goodness, which first places that prescribed reduction in the tensor torsor; affects the proof; corrected in print at KPZ26 Remark 7.1.4(1), p.73.
- **Misprint** in KZ25 at §3.2.5, p.23, line 1035: the source says the first-order comparison has unreduced coefficient ring on its target; it should be base-changed to the same first-order quotient on both sides; affects nothing.
- **Misprint** in KZ25 at Proposition 3.3.2(1), p.25, line 1087: the source says a frame from the dual Tate module transports the crystalline tensor sα,0; it should be the étale tensor in that source module; affects nothing.
- **Misprint** in Kisin17 at proof of Lemma 1.2.18, p.16, lines 708 and 718: the source says rational quasi-isogeny comparison matrices lie in G(O_L) and G(𝔖); it should be G(L) and G(𝔖[1/p]), retaining their integral right cosets; affects the proof.
- **Gap** in KPZ26 at proof of Corollary 6.3.5, p.71, lines 3139–3144: the source says individually self-dual paired lattices form the required chain; it should be an indexed chain pairing Λ_i with the dual of Λ_(−i), preserving nesting and indexed duality; affects the proof.
- **Misprint** in KPZ26 at proof of Theorem 6.1.9, p.66, lines 2913–2914: the source says the lattice being dualized after invariants carries the inverse-power/different twist too; it should be (π^mΛ)^Γ, whose dual is (π^(−m)δ⁻¹Λ∨)^Γ; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "62d1f625df676b90e8895ecae6dfbb653d7bc9aa", "job": "REV-PKG-FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII~3", "model": "gpt-6-astra", "worker": "chris-7"} -->
