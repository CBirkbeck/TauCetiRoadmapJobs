<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12999#issuecomment-6793379981 -->
Red team round 1 pass a (codex) of ad4bb16

Verdict: needs_changes

1. **F01** (P2) Block modification silently changes its cutoff

   **Location:** `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md:905`, “with M_{i,σ} = 𝔗_σ(M_i)”; also §§3.7 and 4.1.

   **Claim:** Applying the modification already defined for each block gives the graded blocks of D_σ used in the transported parabolic and recovery diagrams.

   **Witness:** At n=3, d_K=2, h_τ=(3,1,0), the first block has weights (3,1). Its own modification gives (1,1); the corresponding submodule of D_σ has weights (0,0). See `TauCetiRoadmap/TriangulineVarietyAndItsLocalModel/README.md:1469`.

   **Exact repair text:** “For every block and endpoint used in a modification diagram, write 𝔗_{σ,h_n} for modification with the ambient cutoff h_{n,τ} at τ≠σ. Set M_{i,σ}=gr_i(F_P D_σ)=𝔗_{σ,h_n}(M_i), and use this same cutoff for D_{1,σ}, C_{1,σ} and their first-order deformations. This is the graded-modification convention of TriangulineVarietyAndItsLocalModel §§10.5 and 12.4. When comparing with the independently defined 𝔗_σ(M_i), transport self-Ext by the fixed algebraic twist whose τ-exponent is h_{n,τ} minus the minimum weight of M_i at τ≠σ and whose σ-exponent is zero.”

   Replace the unqualified equality at line 905 with this convention and carry it into §§3.7–4.2. On the witness the twist has τ-exponent −1, taking (1,1) to (0,0); at K=ℚ_p the exponent tuple is zero. The repair preserves the full theorem rather than restricting K.

2. **F02** (P2) The annihilator isomorphism is not canonical from an Ext class

   **Location:** `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md:1212`, “it is canonically π_min(D)”; the defining data are at lines 587–589.

   **Claim:** The extension class defining π_min(D) supplies a canonical isomorphism with the subextension of the independently chosen universal extension U.

   **Witness:** At n=3, K=ℚ_p, let p:Π→A, i:V→Π and j:A→V. Then 1+c·ijp, c∈E, are distinct extension automorphisms fixing V and A, since (ijp)²=0. DING25 line 2619 asserts only an isomorphism.

   **Exact repair text:** “U[𝔪_{A_D}] is the inverse image of 𝒦_D⊗A in U and is isomorphic, as an extension, to π_min(D). With U chosen, this inverse image can be used as the chosen representative of π_min(D); the Ext-class definition alone does not specify a unique isomorphism to an independently chosen representative.”

   On the witness this permits all automorphisms 1+c·ijp; when 𝒦_D=0 the inverse image is V. No change to the annihilator equality or recovery theorem is needed.

3. **F03** (P2) Imported Hodge–Tate weights have the opposite sign

   **Location:** `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md:4`, “the Hodge–Tate weights h”; conventions at lines 81–103 and the PhiGamma contract at lines 255–258.

   **Claim:** The same h denotes the imported Hodge–Tate weights and the exponents in R(φ_i z^{h_i}), without an adapter.

   **Witness:** Take n=1, K=ℚ_p, φ₁=|·| and h₁=1. This is R(ε), the Tate line. DING25 line 451 assigns +1; `TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md:116` assigns Hodge–Tate weight −1 (also §7.2a).

   **Exact repair text:** “Our h consists of Ding's Hodge–Tate–Sen labels: R(ε) has label +1. These are the algebraic-character exponents and Sen eigenvalues, and are the negatives of the Hodge–Tate weights in PhiGammaModulesAndIwasawaCohomology's standing convention. A label h corresponds to filtration jump −h. All character and modification formulas below use these labels.”

   Use “Hodge–Tate–Sen labels” in the summary and wherever h is described without that qualification. For the witness the character exponent remains +1 and the imported filtration jump is −1; no determinant or comparison formula changes.

4. **F04** (P3) Rank-one cases still refute several boundary claims

   **Locations:** `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md:311` (“compatible with F and with G”), line 410 (“neither inclusion … follows from dimensions”), line 920 (“Varying the Hodge filtration … possible”), and line 1261 (“For d_K > 1, D_σ has repeated weights”).

   **Claim:** These statements apply throughout the stated n≥1 range.

   **Witness:** At n=1, both presentation kernels have dimension 0, hence both inclusions follow; each labelled filtration is a single line with one jump and has no variable flag. The endpoint parabolics would have a zero-size block.

   **Exact repair text:** At the endpoint conventions (lines 104–107) and §0.1: “For n≥2 these are the refinements compatible with F and G; at n=1 only the combinatorial families are being defined.” At §0.4: “For n≥2, dimensions alone imply neither inclusion. For n=1 both kernels are zero.” Replace §3.6's third Check with: “For n≥2 and d_K>1, choose two generic flags at τ≠σ with the same labelled weights while fixing the σ-flag. Both modifications have the same off-σ one-jump lattice, so their σ-kernels agree. For n=1 the labelled filtration is unique, and for d_K=1 there is no off-σ flag to vary.” At line 1261: “For d_K>1 and n>1, D_σ has repeated weights at τ≠σ.”

   On n=1,d_K=2 the repaired text gives kernel dimensions (0,0), unchanged D_σ=D, and one weight at each embedding. At n=2,d_K=2 the off-σ weights (1,0) become (0,0), so the intended negative control survives.

## Verified sound

Read all 1,323 README lines and all 56 Suggested.lean lines. Counts: **0 Lean declarations**, **30 numbered target sections**, including **16 bold theorem statements**, **113 Check bullets**, **30 target-locator groups** in the ledger below, **2 cited works** read, and **6 direct supplier contracts** checked against their available current versions. The 113 Checks were evaluated against their definitions, the source statements and the explicit boundary calculations below; this is not a claim to have independently reproved the analytic theorems. R04 identifies the boundary failures. Every numbered definition section has at least three Check bullets.

The comparison, quotient dimension, transversality, intrinsic characterisation, scalar-character formula, parabolic comparison, embedding decomposition, recovery equivalence and Artinian action agree with the corresponding source statements, subject to R01–R03. In particular, the package correctly uses the quotient by Ext¹₀, embedded relation spaces rather than abstract kernel dimensions, closed induction rather than full induction, and a transported comparison for the nonregular modified module.

### Lean declaration and headline ledger

| Item | Section, variables and instances | Test and computed outcome | Decision |
|---|---|---|---|
| Named declarations | None; the namespace is empty. No `variable`, `include`, instance or data declaration. | Declaration count = 0; elaborated-signature comparison has 0 inputs. | No Lean execution necessary; no signature was claimed to have been elaborated in this pass. |
| Comparison and kernel dimension | README §§1.4–1.5; docstring lines 14–21 | At n=3,d=1 the actual comparison has source dimension 10, target 9, kernel 1. An arbitrary linear map between spaces of those dimensions need not be the refinement comparison. | Both headlines named as unstatable; a bare rank–nullity stand-in would not test them. |
| Characterisation and scalar characters | §§2.4,2.6; docstring lines 22–28 | A split extra A changes the socle from A to A⊕A. The rank-two shifted-weight central invariant is 21/4, not the unshifted value 3. | Missing locally analytic representation/socle/derived-action carriers are explicitly named. |
| Parabolic compatibility | §§3.1–3.2; docstring lines 29–37 | For n=4, blocks (3,1), the kernel multiplicity is d, while the whole kernel has multiplicity 5d. | Missing parabolic representation and closed-induction carriers are explicitly named. |
| Embedding decomposition | §3.5; docstring lines 38–39 | At n=3,d=2, kernel dimensions 1+1=2; the shared socle occurs once, not twice. | Missing partially algebraic representation/Ext carriers are explicitly named. |
| Recovery | §4.2; docstring lines 40–43 | The a=2 and a=3 rank-three flags below are inequivalent despite identical dimensions and abstract one-dimensional kernels. | Missing modified Robba module/B-pair carriers are explicitly named. |
| Universal action and annihilator | §§5.4–5.5; docstring lines 44–48 | For n=3,d=1, dim A_D=10 and the annihilator quotient over V is A, not A^10. | Missing deformation-ring, Bernstein-centre and universal-extension carriers are explicitly named. |
| Combinatorial definitions and arithmetic | §§0.1–0.3,1.1 | At n=3 the telescoping formula yields (a,b,c); c₃=1. These are statable but are ingredients rather than the end theorems. | Their omission is appropriate. No padding to delete. |

There is one `import Mathlib`, the required namespace and module docstring, no sorry'd data, `set_option`, `lemma`, placeholder, admitted example or duplicate fully qualified declaration. The headline list in the introduction is covered by the module docstring.

### Boundary and convention ledger

Here d=[K:ℚ_p], K_D=ker(t_D), 𝔈=Ext¹_G(A,V), and Q=Ext¹(D,D)/Ext¹₀. “Pass” below means the displayed test agrees with the statement; it does not replace its supplied proof. Repeated API formulations of the same law refer to the same row.

| Statement / convention | Instances and computed values | Result / change |
|---|---|---|
| Standing coefficient and rank hypotheses | n=0 is excluded by n≥1; E=0, characteristic-p E and equal-characteristic local K are excluded by finite extensions of ℚ_p. d≥1, so Σ_K cannot be empty. | No vacuous rank-zero extension of the headline statements. |
| Other excluded boundary objects | A zero module has rank 0, not n≥1. A unit-ideal quotient of an E-algebra is the zero ring and cannot have residue field E. Finite characteristic-zero extensions are separable, so the inseparable case is outside (H). | These do not refute the stated generality. |
| Integral versus rational scalars and index bounds | E is a field, not its valuation ring: 1/2 exists even over ℚ₂. All character and weight coordinates are indexed by 1,…,n and σ∈Σ_K; no out-of-range coordinate enters a formula. GL₁(K)=K× is noncompact, but compactness is not a hypothesis of these headlines. | No implicit integral or compact restriction; no index junk value. |
| Residue characteristic 2 and 3 | In E/ℚ₂ or E/ℚ₃, 2≠0 and 3≠0; both are invertible. Thus b+b=2b≠0 for b≠0 even at p=2. | Characteristic-zero signs and dual-number arguments survive. |
| Absolute value and reciprocity | Residue degree f gives q=p^f≥2 and abs(ϖ)=q⁻¹≠1. For K=ℚ₂, ε(2)=2·(1/2)=1; on a unit u, ε(u)=u. | No q=1 instance or square-root-of-q assumption; ramification does not change q=p^f. |
| Weight labels and Tate twist | Rank-one R(abs·z) is R(ε): Ding label +1, imported Hodge–Tate weight −1. | R03; add explicit sign adapter. |
| λ=h−θ and parabolic twist | n=3, h=(3,1,−2): θ=(0,−1,−2), λ=(3,2,0). For blocks (2,1), θ^P=(0,0,−2), twist 1⊠ε²; for (1,2), twist 1⊠(ε∘det). | Character and endpoint normalisations agree with the corrected supplier. |
| Permutation action | n=3,w=(123): w(φ)=(φ₃,φ₁,φ₂); w(3)=1 but w⁻¹(3)=2. Transpositions alone would not detect this distinction. | Correct forward-position/inverse-index convention; endpoint notation requires n≥2 (R04). |
| Analytic, smooth and single-embedding character spaces | For d=2, dim H_char=3, dim H_sm=1, dim H_σ=2. For n=3, dim H_T=9, dim H_sm(T)=3, dim H_σ(T)=6. Valuation is smooth; log_σ is not. | No identification of smooth and analytic characters. |
| Fixed Ext and quotient spaces | n=3,d=1: (dim𝔈,dimQ,dim𝔈_g,dim𝔈_g′,dim𝔈_w)=(10,9,3,4,6); n=3,d=2: (17,15,3,5,9). | Quotient versus full de Rham and full Ext dimensions are distinguished. |
| Artinian tangent versus cotangent | E[ε]/ε² has radical Eε with ε²=0; tangent Hom(Eε,E) sends ε↦1. E⊕Q∨ has tangent Q, not Q∨. E itself has radical/tangent 0. | Correct dual direction and nonreduced coefficient scope. |

### Computed target ledger

Each row identifies a mathematical statement, including definitions and their advertised laws. Numbers in the last column give cached source lines for the target-locator group; the source texts themselves are not reproduced.

| Statement | Instances tried and values on both sides | Result / change; locator |
|---|---|---|
| §0.1 endpoint families | n=1: both sets={id}; n=2: fixing 2 gives {id}, sending 2 to 1 gives {(12)}. For w=(123), w(3)=1 while w⁻¹(3)=2. | Combinatorics pass; geometric interpretation at n=1 needs R04. DING25 lines 2136,2188–2200. |
| §0.1 two-block move | For n=4,i=2, j=1 uses (24), j=3 uses (12); both preserve their respective two-block partition and move the distinguished label into an endpoint-compatible position. | Pass; same locator group. |
| §0.2 block directions | For n=3,j=1: (a,b,b) is block-constant; (b,a,a) is the reversed block choice; intersection with the central tuples is a=b. A log character distinguishes analytic directions from valuation alone. | Pass. DING25 lines 879–881,2193. |
| §0.3 telescoping spanning theorem (bold) | (c,c,c)+(a−b,0,0)+(b−c,b−c,0)=(a,b,c); valid in ℤ³ and in the zero group. For n=1 the sum is empty and v₁=v₁. | Pass. DING25 lines 2188–2222, with the printed direct-sum claim corrected. |
| §0.3 sum versus direct sum | n=3,d=1: source summand dimensions 2+4+4=10, target 6; the central tuple (1,1,1) lies in every block space. Opposite copies give a nonzero relation mapping to 0. | Correctly only spanning. Same locator group. |
| §0.4 presentation maps R and s | n=1: source=Q=𝔈 has dimension 1+d and both kernels 0. n=3,d=1: source dimension 6·6=36, dim kerR=26, dim kers=27. | Definition and surjectivities pass; “neither inclusion follows” needs rank-one exception R04. DING25 lines 2069–2080,741–774,801. |
| §0.4 quotient is essential | dim Ext¹₀=(n−1)(nd−2)/2 gives 0 at (n,d)=(1,2),(2,1), but 1 at (2,2),(3,1). A lift of 0∈Q may be nonzero in full Ext. | Checks separate the quotient from full deformation space; no reverse inclusion inferred for n≥2. Same locator group. |
| §1.1 coefficient c_n | n=0,1,2,3,4,5 gives c_n=0,0,0,1,5,16 using truncated naturals at 0; for n≥1 ordinary integer subtraction has nonnegative result. | Pass. DING25 lines 2223–2224. |
| §1.1 recurrence and positivity | c₄=2c₃+3=5; c₅=2c₄+6=16. c₁=c₂=0; c₃=1 and the recurrence forces positivity thereafter. | Pass; numerical API correctly absent from Lean. Same locator group. |
| §1.2 endpoint gluing | n=3,d=1: endpoint dimensions 7+7, overlap dimension 4, quotient dimension 10. Overlap (b,−b) maps to t(b)−t(b)=0; (b,b) maps to 2t(b), nonzero for nonzero b in the injective common space. | Pass. DING25 lines 2135–2163,1909–1918. |
| §1.2 lower-rank induction | n=2 endpoints have rank 1; at weights (3,1,−2), rank-two endpoints have weights (3,1) and (1,−2), not the same tuple. | Pass; induction decreases rank. Same locator group. |
| §1.3 every-refinement compatibility (bold) | n=3,w=(23): the j=1 move (23)w=id, while the j=2 move (12)w sends 3 to 1. Central plus the two block directions span all six character dimensions although their sum has dimension 10 before quotienting relations. | Pass. DING25 lines 2188–2222. |
| §1.4 unique surjective comparison (bold) | For b∈Q_w with κ_w(b)=ψ, t_D(ζ_wψ)=b. Thus t_DR=s on every summand; at n=1 this is κ⁻¹ζ⁻¹. If two maps agree there, their difference vanishes on the surjective presentation, hence is 0. | Pass. DING25 lines 2084–2095. |
| §1.5 kernel dimension (bold) | d=1,n=1,…,5: source dimensions 2,5,10,19,36 minus target dimensions 2,5,9,14,20 give 0,0,1,5,16. At n=3,d=2:17−15=2=c₃d. | Pass. DING25 lines 2223–2224. |
| §1.6 transversality (bold) | t_D restricted to 𝔈_w is ζ_w⁻¹ followed by κ_w⁻¹ and inclusion, so a kernel vector gives ψ=0 and vector=0. At n=3,d=1, dimensions K_D=1 and 𝔈_w=6 inside 10 are consistent; at d=2 they are 2 and 9 inside 17. | Pass. DING25 line 2228. |
| §2.1 minimal extension definition | Classifying map K_D→𝔈 is inclusion, not 0. At n≤2, K_D=0 and π_min=V. At n=3,d=1 the quotient is A and the extension class is a nonzero line inclusion; the split extension would have class 0. | Pass up to representative choice in R02. DING25 lines 2229–2237. |
| §2.1 finite-slope push-out | Push-out sends the chosen class to its image under V→π(φ,h); the supplied Ext map is an isomorphism, so a nonzero kernel class remains nonzero. At K_D=0 the push-out is π(φ,h). | Pass; same locator group. |
| §2.2 push-forward Ext quotient | Connecting map Hom(A,K_D⊗A)=K_D→𝔈 is the inclusion. Hence ker f_D=K_D; at n=3,d=1, dim𝔈/K_D=10−1=9=dimQ. | Pass. DING25 lines 2240–2249. |
| §2.2 no spurious long-exact-sequence surjectivity | At n=3,d=1, dim Ext¹(A,A)=4, so the next term K_D⊗Ext¹(A,A) has dimension 4, not 0. The source uses the additional constituent argument to prove the required surjectivity. | Proof route retains the substantive input; same locator group. |
| §2.3 refinement and de Rham comparisons (bold) | n=3,d=1: refinement image dimension 6 and de Rham image 3 inside target dimension 9. Full de Rham deformation dimension is 4, reduced to 3 by Ext¹₀. At n=2,d=2 the corresponding values are 3→2. | Pass. DING25 lines 2250–2254. |
| §2.4 intrinsic characterisation (bold) | At n≤2, quotient multiplicity 0 gives V. At n=3 a different line L⊂𝔈 can have the same one-copy quotient and socle data but f_L kills L while t_D does not; it fails the required Ext diagram. A split added A has socle A⊕A. | Both uniqueness and the need for the comparison condition survive. DING25 lines 2258–2271. |
| §2.5 χ_D definition | n=2 with λ_σ=(2,0),λ_τ=(5,1): embedding exponents are (2,6), not (8,8). n=1 has N=0 and χ_D=φ₁z^{h₁}. | Pass. DING25 lines 2272–2278. |
| §2.5 determinant identity | χ_D ε^(−N) has algebraic exponent Σ_iλ_i−N=Σ_ih_i and absolute-value exponent N−N=0. For n=3,N=3, both cancellations are exactly 3. Permuting φ preserves ∏φ_i. | Pass; same locator group. |
| §2.6 scalar central/infinitesimal action (bold) | A nonzero log-determinant self-extension differentiates at Id to nε≠0, including p=2. It therefore cannot be silently treated as scalar. The kernel condition kills both central and Sen derivatives. | Pass. DING25 lines 2280–2342. |
| §2.6 dot action adapter | n=2,h=(3,1),λ=(3,2),ρ=(1/2,−1/2): λ+ρ=(7/2,3/2), e₁=5,e₂=21/4. Correct dot transport gives λ′=(1,4), hence h′=(1,3). Applying the dot action directly to h instead gives (0,4) and wrong e₂=9/4 after conversion. | Correct shifted-variable convention; same locator group. |
| §2.6 tangent regularity | Symmetric map (x₁,x₂)↦(x₁+x₂,x₁x₂) has determinant x₁−x₂: value 2 at (3,1), value 0 at (1,1). | Strict dominance supplies nonvanishing, even in ℚ₂. Same locator group. |
| §3.1 parabolic comparison (bold) | P=G returns K_D; B gives sum of rank-one kernels=0. n=3,blocks(2,1):0+0=0; n=4,(3,1):d+0=d versus total5d; (2,2):0. | Pass. DING25 lines 2348–2367. |
| §3.2 parabolic minimal subextension | Its class is K_D∩𝔈_FP→𝔈. For B this is 0, hence V; for G it is K_D, hence π_min. n=4,(3,1) quotient multiplicity d, strictly smaller than 5d. | Pass. DING25 lines 2368–2380. |
| §3.2 closed induction embedding | For P=G the operation is identity. For blocks (3,1), θ^P=(0,0,0,−3), so the twist on the second factor is ε³; untwisted and inverted-twist alternatives have exponents 0 and −3. | Statement matches Remark 3.28; the full analytic construction remains supplied. Same locator group. |
| §3.3 single-embedding comparison | n=3,d=2: dim𝔈_σ=10,dimQ_σ=9,dimK_σ=1; total kernel is 2. For B the parabolic kernel is 0. A log_τ with τ≠σ is not a permitted σ-direction. | Pass. DING25 lines 2382–2405. |
| §3.4 single-embedding minimal extension | d=1 gives the full construction. n=2 has K_σ=0 and π_min,σ=π₁,σ; its length is 3, versus length 1+2d of V. At d=2 these are 3 and 5, not equal. n=1 gives A. | Pass. DING25 lines 2406–2410. |
| §3.4 subrepresentation identification | A constituent indexed by τ≠σ is not algebraic away from σ and must be excluded. At n=3 the quotient over π₁,σ is one A; at n=2 it is 0. | Pass; same locator group. |
| §3.5 kernel decomposition (bold) | n=3,d=2: dim(K_σ⊕K_τ)=1+1=2=dimK_D. At d=1 the map is identity. The larger sum 𝔈_σ⊕𝔈_τ has dimension 20 and maps to 17-dimensional 𝔈 with 3-dimensional diagonal relation 𝔈_g. | Pass. DING25 lines 2411–2427. |
| §3.5 representation amalgamation | Amalgamating over V retains one common A-socle. A direct sum would have two A-socles for d=2 and therefore is not the claimed representation. | Pass; same locator group. |
| §3.6 transported comparison and kernel | t_Dσ=T_σt_D,σ with T_σ invertible: T_σ(0)=0 and T_σ(y)=0 implies y=0. At n=3,d=2 the partial full Ext dimensions change 13→10 and zero-subspace dimensions 4→1, but quotients remain 9=9. | Pass. DING25 lines 2430–2465. |
| §3.6 parameter dependence and block modification | Off-σ weights (3,1,0) become (0,0,0). A first block (3,1) modified by its own minimum becomes (1,1), whereas its ambient modified block is (0,0). For n=1 there is no variable flag. | R01, R04; same locator group. |
| §3.7 modified minimal Ext isomorphisms (bold) | For n=2 and n=3, single-embedding quotient dimensions are respectively 2+3=5 and 3+6=9. At d=1 all modification maps are identity. | Pass with explicit common cutoff R01. DING25 lines 2467–2487. |
| §4.1 embedded relation definition | n=3: the correct two parabolic images have dimensions 7+7=14, target dimension 9, relation dimension 5. Full Ext terms give 10+10=20 and a wrong kernel dimension 11. | The package already corrects the source. DING25 lines 2505–2528,1367–1372. |
| §4.1 sign and ambient position | Overlap element (b,−b) gives 0; (b,b) gives 2b≠0. Lines Ee₁ and Ee₂ in E² are abstractly isomorphic but unequal subspaces. | Correct embedded relation, not an abstract kernel invariant; same locator group. |
| §4.2 recovery equivalence (bold) | For d=1 modification is identity, so both implications recover D. At n≤2 a single-embedding modified module has a unique generic flag class; for n≥2,d>1, discarded off-σ flags need not be recovered. | Matches the scope, without claiming simultaneous recovery over general K. DING25 lines 2490–2529. |
| §4.2 rank-three distinguishing example | a=2: line (1,2,1), plane normal (1,−1,1), dot product 0. a=3: line (1,3,1), normal (1,−1,2), dot product 0. A diagonal flag isomorphism would force x=y and then 2=3. | Full flags differ. Plane alone is carried by diag(1,1,1/2), so keeping only the plane is insufficient. Same locator group; Example 2.9 at DING25 line 617. |
| §4.2 nongeneric boundary of example | At a=0 the line has zero second coordinate; at a=1 the plane normal has zero third coordinate. At a=2,3 over ℚ₂ or ℚ₃ all required quantities a and a−1 are nonzero. | Excluded critical flags are distinguished; no good-prime restriction. Same locator group. |
| §5.1 scalar endomorphisms (bold) | A diagonal endomorphism preserving a generic line with all coordinates nonzero has equal diagonal entries, hence is scalar. A split nongeneric direct sum has independent diagonal entries and would violate the conclusion. | Generic noncritical assumption used. DING25 line 2533. |
| §5.1 first-order comparison algebras | A_D=E⊕Q∨ has radical product xy=0. At n=3,d=1, dimQ=9,dimA_D=10; dimA_D,w=7. For n=1,dimA_D=2+d, giving 3 at d=1. | Pass. DING25 lines 2534–2572. |
| §5.1 tangent, dual inclusion and refinement ideals | At n=3,d=1, dim(R_D/𝔪²)=11 and dimA_D=10; dualising Ext¹↠Q gives the injection A_D→R_D/𝔪². The quotient to A_D,w has kernel dimension 3. Refinement spanning gives ∩I_w=0. | Correct map direction; same locator group. |
| §5.2 universal extension and refinement subextensions | Classifying maps are id_𝔈 and inclusions 𝔈_w→𝔈. For n=3,d=1 their quotient multiplicities are 10 and 6. Zero class would be split and would fail universality. | Pass. DING25 lines 2573–2577,2590–2598. |
| §5.2 radical action | Choose b and x with x(ζ_w⁻¹b)=1. The radical sends a lift of b⊗a to a in A⊂V, then sends V to 0; thus xy acts by 0. | Distinguishes the contraction action from a zero or rescaled action. Same locator group. |
| §5.3 induced universal character extension (bold) | n=1: closed and full induction are identity; quotient multiplicity is 1+d. n=2,K=ℚ_p: modulo PS₁, full induction has four copies each of A and the other constituent, while the closed object has quotient A^4. | Closed induction is essential. DING25 lines 2580–2588. |
| §5.3 full PS₁ required | A proper V′⊂PS₁ loses an extension direction b∈Ext¹(A,PS₁) not in its image; the universal class sends b to b≠0, whereas the smaller image cannot. | Universal-class restriction justifies V′=PS₁; same locator group. |
| §5.4 unique Artinian action (bold) | Radical operator is u↦x(t_D(b))a with image in A and zero on V; composition of two radical operators is 0. If t_D(b)≠0, some x has x(t_D(b))=1, so that lift is not annihilated. | Pass. DING25 lines 2602–2617. |
| §5.4 refinement factorisation and uniqueness | For x∈I_w and b∈𝔈_w, x(t_D(b))=0. Since the 𝔈_w span 𝔈 and U_w include V, their generated subrepresentation is U; two permitted actions have difference 0 on U. | Pass; same locator group. |
| §5.5 annihilator equality (bold) | A lift of b⊗a is annihilated by every radical element iff x(t_D(b))=0 for all x, iff b∈K_D. n≤2 gives V; n=3,d=1 gives quotient A over V, not A^10. | Equality pass; canonical identification needs R02. DING25 line 2619. |
| §5.5 radical image and wrong quotient | At n=3,d=1, radical·U=A, while U/A has quotient A^10 over V/A; it is not π_min, whose quotient over V is A. On π_min, 1+c·ijp gives distinct extension automorphisms. | Separates annihilator from radical quotient and from uniquely chosen isomorphism. Same locator group. |

### Supplier, ownership and dependency checks

The six direct supplier citations were checked by section, including the subordinate sections listed in each contract. No missing supplier target was established. The automatically reported missing-name leads are not findings: the locally analytic supplier is present as the earlier board package, and the four `PhiGamma.*` deformation names are prose targets of LocalGaloisDeformationRings §1.23, not claimed pinned declarations.

| Supplier | Resolved content and witness | Result |
|---|---|---|
| LocallyAnalyticRepresentationsOfLocalGroups | `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md`, §§0.9,1.5,1.7–1.9; 4.1; 6.1; 7.1–7.3; 8.1–8.14; 9.1–9.7; 10.1–10.7. In particular §1.9 specifies extension classes, §4.1 the dot action, §9.5 the corrected one-B-factor tensor construction. | These objects are imported. Its scope stops before Ding's comparison/minimal representation; this package owns that comparison. |
| TriangulineVarietyAndItsLocalModel | `TauCetiRoadmap/TriangulineVarietyAndItsLocalModel/README.md`, §§10.1–10.3,10.5–10.8;11.1–11.8;12.1–12.2,12.4,12.6–12.7;13.8,13.13–13.14,13.16. §10.5 at line 1469 and §12.4 explicitly retain the ambient cutoff. | All cited interfaces found. R01 is the convention mismatch at consumption, not an absent supplier theorem. The rank-one adapter is §11.1. |
| PhiGammaModulesAndIwasawaCohomology | `TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md`, §§1.0,1.2,1.6,3.4a,3.6,7.1–7.5. Finite local E-algebras retain nilpotents; §7.4 includes the locally algebraic/de Rham rank-one criterion. | Character carrier spelling is explicitly adapted. Hodge–Tate sign requires R03. |
| PadicHodgeTheory | `TauCetiRoadmap/PadicHodgeTheory/README.md`, §§4.5,5.2. B-pairs come from the former; selective modification is the latter, consumed through TriangulineVarietyAndItsLocalModel. | No second owner or duplicate modification construction here. |
| LocalGaloisDeformationRings | `TauCetiRoadmap/LocalGaloisDeformationRings/README.md`, §§0.4,1.23; the latter's API includes defRing, triangulineDefRing, deRhamDefRing, tangent_defRing and formallySmooth. §0.4 explicitly uses finite local coefficient algebras, not merely field points. | Deformation ring and first-order Cartesian comparison are supplied with the Schur/generic hypotheses used here. |
| SmoothRepresentationsOfLocalGroups | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md`, §SR.3.2 supplies the Bernstein decomposition/centre; the further principal-series completion is explicitly `gap:principal-series-bernstein-completion`. | Same slug in README and top-level design gaps; named earlier owner; precise completion/tangent contract, not an unowned prerequisite. |

For the last contract, CEGGPS16 Lemma 3.22 is at lines 1921–1930, printed p.47, and states the invariant-centre result. It does not by itself state the completion isomorphism. The generic ordered tuple has trivial Weyl stabilizer: in rank two, exchanging distinct characters changes the tuple; at equal characters the stabilizer has order two and the tangent quotient is ramified. This is the extra generic-point completion step requested by the declared gap and used in DING25 §3.2.2. The gap is accepted conditionally as the brief requires; its present absence from the supplier is not a finding.

Ownership searches used the roadmap grep tool over main/open heads and separate searches of board packages, with object terms including Robba modules, Hodge modification, universal/tautological extensions, principal-series Ext, minimal representations and Ding's comparison. The relevant nearby owners are the two main suppliers above and CompletedCohomologyAndLocalGlobalCompatibility, whose scope is arithmetic local–global comparisons rather than this local minimal representation. No second current owner of π_min or the comparison t_D was found. The supplied overlap report has no dropped-id or conflicting-head item. There are no Lean declarations here that could duplicate a sibling's fully qualified declaration.

Pinned input witnesses include:

- `Mathlib/LinearAlgebra/Isomorphisms.lean:47`: `LinearMap.quotKerEquivOfSurjective`, requiring actual surjectivity.
- `Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean:53` and line 173: the subspace dimension identity and rank–nullity, with finiteness hypotheses.
- `Mathlib/LinearAlgebra/Dual/Defs.lean:61`: `Module.Dual` is the linear-map dual.
- `Mathlib/Algebra/TrivSqZeroExt/Basic.lean:68` and `Mathlib/Algebra/DualNumber.lean:46`: native square-zero and dual-number carriers.
- `Mathlib/RingTheory/LocalRing/Defs.lean:30`: `IsLocalRing` includes nontriviality; the zero ring is not an Artinian coefficient example here.
- `Mathlib/CategoryTheory/Abelian/Ext.lean:41`: the Ext functor exists on an already supplied appropriate category; it does not construct the locally analytic or Robba categories.
- `TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/HarishChandra.lean:88`, line 403 and line 437: the `IsKilling` context, Verma-character evaluation, and `hcProjection`. For gl_n, ad(Id)=0, so the Killing form has the nonzero identity matrix in its radical. This cannot replace the split reductive supplier.

The pinned searches found no admissible locally analytic representation category with these principal series, nor the coefficient Robba module/modified-module carriers required by the headlines. Existing linear maps, matrix groups and square-zero rings do not make those objects simple definitions on native carriers.

The required read-only dependency checker returned exactly:

```text
depcheck: 237 roadmaps, 2145 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The read-only diff against origin/main covers five files, all within `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/` (512 insertions, 250 deletions). The design change removes obsolete entries only from the top-level gaps list. No package or source file was edited during this pass; only this report and scratch notes were written. No process narrative, pull-request number, computational algorithm or source-chapter layer name was found in the README or Lean docstrings. None of R01–R04 re-raises a finding marked “not actionable in this package” by the last repair report.

### Additional source-error witnesses

The final five source issues below also have the following short tests. They concern imported material and are not additional package findings.

| Source passage | Computed witness |
|---|---|
| Constituent indexing, DING25 line 1489 | With i=1, w=(123), w′=(23)w=(13), w(w′)⁻¹ lies in W₁, so Proposition 3.1(4) identifies the constituents. Their forward first-index images are {2} and {3}; both inverse images are {3}. |
| Inducing sign, DING25 line 1494 | n=2,λ=(1,1): s·λ=(0,2). The printed negative gives central algebraic exponent −2, whereas every constituent of the original principal series has exponent 2. The positive sign gives 2. |
| Bernstein map composition, DING25 line 1590 | Write X₁→X₂ for the reordering and J_i:X_i→Y. The printed reorder∘J₁ tries to feed a Y-point into a map with source X₁; J₂∘reorder and J₁ both have source X₁ and target Y. |
| Tensor kernel, DING25 line 1833 | At one factor, an extension has kernel B₁. The printed formula gives A₁. For a rank-two block, B₁=π₁ has length greater than 1 while A₁ has length 1; the corrected one-B-factor formula returns B₁. |
| Tangent surjectivity, DING25 line 2291 | The constant lift f(a)=ξ(a)+0ε has image E, not E[ε]/ε², and is the zero vector. Surjective lifts exclude this vector and therefore cannot form the asserted tangent vector space. |

## Not verifiable

- No Lean command was run, in accordance with the read-only review restriction. There are zero named declarations, so there are no elaborated types or lost section binders to compare. The earlier repair's successful elaboration is not counted as execution by this pass.
- The analytic existence results and categorical comparison theorems were checked against their legal source statements and supplier contracts, not independently formalized. In particular, Remark 3.28's closed-induction embedding in §3.2 was matched to DING25 lines 2368–2380; the completed tensor-product/closed-induction construction itself is future supplier work.
- The principal-series Bernstein completion remains the declared supplier gap. Its exact contract and generic-point justification were checked, but an implemented completion isomorphism is not available at the pins.
- The two sources in the manifest were available legally. No cited work remains missing, no new source key was introduced, and no reference request is required. Source errors below were read in the published DING25 extraction; no later published correction was verified.

## Source issues

- **Error** in DING25 at (3.43), proof of Theorem 3.21, printed p.49 (DING25 line 2189): the source says the full character space is the direct sum of central and maximal-Levi-centre directions; it should be their sum, with nontrivial overlaps for n≥2; affects the proof.
- **Misprint** in DING25 at definition of χ_D before Proposition 3.26, printed p.51 (DING25 line 2277): the source says the algebraic exponent sums over both matrix indices and embeddings; it should be the embedding-indexed vector whose σ-entry sums only the matrix indices; affects a stated result.
- **Misprint** in DING25 at (3.58), proof of Theorem 3.36, printed p.58 (DING25 line 2610): the source says the last inclusion targets a refinement-specific universal extension despite no fixed refinement; it should be the full universal extension; affects the proof.
- **Misprint** in DING25 at proof of Theorem 3.34 after (3.54), printed p.56 (DING25 line 2526): the source says replacing D_σ by D′_σ still gives the relation labelled D_σ; it should be the relation labelled D′_σ; affects the proof.
- **Misprint** in DING25 at first paragraph of proof of Theorem 3.34, printed p.56 (DING25 line 2496): the source says the implication from isomorphic modified modules is the only-if direction; it should be the if direction, with the two directional labels exchanged; affects the proof.
- **Gap** in DING25 at proof of Proposition 3.26, printed p.51 (DING25 lines 2294–2296): the source says polynomiality of the invariant ring justifies the tangent isomorphism; it should be justified at the regular weight by the nonzero Vandermonde determinant; affects the proof.
- **Misprint** in DING25 at proof of Corollary 2.14, printed p.19 (DING25 line 860): the source says the paraboline quotient dimension is d_K dim(B∩L_P) minus n; it should be d_K dim(B∩L_P) plus n; affects the proof.
- **Misprint** in DING25 at (3.12), (3.15), (3.33), printed pp.38,39,46 (DING25 lines 1672,1697,2006): the source says constituent subsets lie in the first n−1 labels; it should be all nonempty proper subsets of the n labels, with prescribed cardinality; affects a stated result.
- **Misprint** in DING25 at proof of Lemma 2.11, printed p.16 (DING25 line 708): the source says the final triangulation parameter has algebraic exponent h₁; it should be h_n; affects the proof.
- **Misprint** in DING25 at paragraph following (3.30), printed p.43 (DING25 lines 1898–1899): the source says the endpoint inductions use mismatched parabolics and cyclotomic block twists; it should be P_(n−1)⁻ with 1⊠ε^(n−1), and P₁⁻ with 1⊠(ε∘det); affects nothing.
- **Error** in DING25 at (3.53)–(3.54), proof of Theorem 3.34, printed p.56 (DING25 lines 2513,2518): the source says unrestricted Ext groups form the two middle terms of the recovery comparison; it should be the two pushed-forward parabolic σ-Ext images, dimensions 7+7 rather than 10+10 at n=3; affects the proof.
- **Misprint** in DING25 at relation definition before Corollary 2.38, printed pp.31–32 (DING25 line 1361): the source says the modified relation's third argument is an undefined D₂,σ; it should be C₁,σ; affects nothing.
- **Misprint** in DING25 at constituent labelling after Proposition 3.1, printed p.34 (DING25 line 1489): the source says I is the forward image of the first i indices under w; it should be their inverse image, consistent with the left cosets W_iw and w(φ)_j=φ_(w⁻¹(j)); affects a stated result.
- **Misprint** in DING25 at (3.1) and Lemma 3.2, printed pp.34–35 (DING25 lines 1494–1507): the source says the inducing algebraic exponent is minus the dot-transformed highest weight; it should be the positive dot-transformed highest weight, preserving the central exponent; affects a stated result.
- **Misprint** in DING25 at proof of Proposition 3.3, printed p.36 (DING25 lines 1590–1591): the source says the reordering map is composed after the Bernstein map; it should be composed before the second Bernstein map, giving J_(w₂)∘reorder=J_(w₁); affects the proof.
- **Misprint** in DING25 at construction preceding (3.26), printed p.42 (DING25 line 1833): the source says each first-order tensor kernel summand contains B-factors at every index except one; it should be one B-factor and A-factors at every other index, after removing tensor filtration degree at least two; affects the proof.
- **Misprint** in DING25 at tangent-space definition in proof of Proposition 3.26, printed p.51 (DING25 line 2291): the source says tangent vectors are surjective algebra maps to the dual numbers; it should be all algebra maps lifting the residue character, including the zero tangent with image E; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "ad4bb16699996f7127187b71bc0e51334b9c336b", "job": "RT-PadicHodgeParametersInLocallyAnalyticRepresentations~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
