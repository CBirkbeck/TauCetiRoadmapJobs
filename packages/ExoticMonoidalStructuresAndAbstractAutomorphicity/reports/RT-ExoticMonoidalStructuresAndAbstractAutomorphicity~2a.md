<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1277#issuecomment-6443196209 -->
Red team round 2 pass a (codex) of 14b3171

Verdict: needs_changes

1. **F01** (P3) Theta multiplication Checks admit the zero map

   **Location:** packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md:882–886: “An outer rational translate does not change the class”; “Interchanging the two S factors preserves m”; “The codomain here remains S̃”.

   **Claim:** The definition of m:S⊛S→S̃ has three discriminating Checks.

   **Witness:** The zero map satisfies all three Checks: rational balancing, symmetry and codomain S̃. For a kernel indicator isolating one rational pair, the actual theta value is 1, whereas the zero map gives 0.

   **Exact repair text:** Replace the three §6.4 Checks with:

   - “In the quotient-kernel realization of S⊛S, choose a compact-open indicator Ψ whose support meets M₂(F)×F× only at (0,1). Then m([Ψ])(Γ·1)=Θ(Ψ)=1. The zero map gives 0 and replacing m by c·m gives c.”
   - “Choose disjoint compact-open neighbourhoods meeting the rational pairs only at (E₀₁,1) and (E₁₀,1), and assign their indicators coefficients 1 and 2. The value at Γ·1 is 3; transposition swaps the two contributions and still gives 3. A signed difference gives −1 or 1.”
   - “Over F=𝔽₃(t), use the residue character for dt and the adele b with component t⁻¹ at t=0 and zero elsewhere, so e(b)=ζ. For an indicator Ψ isolating (I₂,1), m([Ψ])(Γ·1)=1 and m([Ψ])(Γ·u(b))=Θ(u(b)·Ψ)=ζ. A constant output gives 1 at the second point; the inverse-character formula gives ζ².”

   **Repair test:** Rational discreteness supplies the isolating neighbourhoods. The middle unipotent formula in §0.4 multiplies the sole surviving value by e(b·1·det I₂)=ζ. Thus the three tests compute 1, 1+2=3, and ζ; they reject the stated wrong models. This changes only Checks, not the construction or its hypotheses.

2. **F02** (P2) The global intertwiner has no specified localized interface

   **Location:** packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md:1360: “The constant-term image is invariant under the normalization-aware global intertwiner.” The construction at line 1348 globalizes Lnorm and î and specifies only the ηv localization.

   **Claim:** §11.2 supplies the global intertwiner used in this invariance statement.

   **Witness:** Dor21 lines 2066–2084 require ηv(w) localization for global trace and intertwining, giving M:î(A)→î(A(w)[η⁻¹]). Section 11.2 states neither this construction nor its domains; §10.5 supplies only local M.

   **Exact repair text:** Add to §11.2, before the constant-term compatibility:

   “Construct the global trace and intertwiner as follows. Write A[η(w)⁻¹] for the tensor-compatible localization inverting every local Weyl-twisted map ηv(w), and A[η⁻¹] for the localization inverting every ηv. Prove that the local trace maps, after the ηv(w) insertions, preserve the distinguished vectors at almost every place. Construct the resulting natural maps

   Φ⁻î(A) → underlineHomT(Lnorm⊗T Lnorm(w), A[η(w)⁻¹]),

   M_A:î(A) → î(A(w)[η⁻¹]).

   These maps are defined for smooth adelic torus modules A and have the displayed localization targets; no unlocalized restricted tensor of the local trace maps is asserted. Prove the constant-term compatibility in these targets, and then its involutive form after inverting both local families. (Dor21, Remark C.2.5, pp. 43–44, Dor21 line 2066.)”

   Add a Check comparing the unramified unit reference with the normalization-module reference: “For ηv(1_{O_vˣ×O_vˣ}), the value at (0,1) is 0; the Lnorm reference 1_{O_v}(λ)1_{O_vˣ}(y) has value 1. The same underlying support obstruction occurs after Weyl twisting. Local existence alone therefore does not give the raw global reference-preserving map; verify reference preservation after the stated localized insertion.”

   **Repair test:** At every conductor-zero place the two values are 0 and 1, so the raw reference comparison fails at infinitely many places. The repaired target records both localization families and exactly the source and target in Dor21 line 2082 and line 2084. It adds the missing construction to this roadmap; it does not introduce a supplier edge.

## Earlier findings, verified individually

The repair report applies all eight findings; none was marked not actionable. IDs below retain the original pass and finding number. All locations in this table refer to packages/ExoticMonoidalStructuresAndAbstractAutomorphicity unless another repository-relative path is given.

| Earlier finding | Status | Repaired passage and witness at this head |
|---|---|---|
| Pass a F01: missing coherence headline | Repaired | packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/Suggested.lean:75 states `idempotent_defect_eq_id`; packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md:692 says “If θ∘(a⊗id)=a∘θ=θ∘(id⊗a), then a=id.” All three equations, invertibility, naturality and pentagon are present. GH11 line 481 and line 718 support precisely this unit-free statement. The supplied elaborated signature retains every binder. |
| Pass a F02: restricted tensor owner | Repaired | packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md:804: “Import the algebraic restricted tensor, its finite-stage maps and reference-vector transports from AutomorphicFormsOnReductiveGroups §3.4”. The contract at line 99 and Needs at lines 819, 1152 and 1368 make the same attribution. The cited supplier constructs the finite-stage colimit; the empty stage is ℂ and inserting a nonzero reference vector preserves the represented tensor. |
| Pass a F03: unspecified matrix residual action | Repaired | packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md:1080 specifies “(g·Φ)(m)=\|det g\|⁻¹Φ(mg⁻ᵀ)” and QΨ=∫Ψ(m,y)\|y\|d×y. Substitution z=y det g gives precisely that factor. At m=0 and g=diag(π_v,1), both sides are q_v; unweighted translation gives 1. At E₀₁ and g=u(π_v⁻¹), transposed and untransposed arguments give 0 and 1. |
| Pass a F04: nondiscriminating Checks | Repaired | packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md:434 records “W(1) = 1, W(u(t⁻¹)) = ζ and W(diag(t⁻¹,1)) = 0”; line 435 computes the unit comparison on the compact reference. At line 1171 “u⋆f = f” uses the specified u=ηI∘εA in full Hom, so 2⋆ gives 2f for nonzero f. The distinction between full Hom and its smooth part is retained. Line 1173 gives pushforwards 0 and (1/a+1/b)1_D; with a=b=1 these are 0 and 2·1_D. |
| Pass b F01: ambiguous ownership sentence | Repaired | packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md:11 says “This roadmap's §§6.1 and 6.3 own the restricted tensor triality kernel and its rational theta invariance.” The local section titles are at lines 798 and 844, so the sentence no longer attributes these constructions to the metaplectic supplier. |
| Pass b F02: forward source locator | Repaired | packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md:1275 now cites “Dor21 line 1067; Dor21 line 1368”. Those lines state Proposition B.5.4 and Theorem B.6.1, respectively; the former is on printed page 25 and the latter on page 30. |
| Pass b F03: missing action on the torus unit | Repaired | packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md:1209 fixes “((a,d)·f)(x,y)=f(ax,dy)”. Both equivariance paths are \|λ²y\|⁻¹f(aλy,dλ⁻¹). For (a,d)=(π,1), (λ,y)=(1,1), f(π,1)=1, both give 1; the inverse translation countermodel gives 0. |
| Pass b F04: omitted unit-free theorem | Repaired | packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/Suggested.lean:8 says “unit-free idempotent coherence theorem of README §5.1 is stated below against native categorical carriers of Mathlib.” Lines 51–81 supply the real `UnitFreeTensor` structure and theorem. packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md:679 matches its fields. A line with θ=2xy gives a=1; the zero object gives its identity; Cantor pairing gives 2 versus 5 and fails the left intertwining hypothesis. |

## Verified sound

Read all 1,487 README lines and all 84 Suggested.lean lines. The inventory comprises 58 numbered targets, the scope/convention blocks, 16 supplier gaps, 187 Check bullets and two explicit Lean declarations. The tables below distinguish calculations from source-dependent conclusions. A successful boundary calculation is not claimed to be a proof of an unimplemented theorem.

### Lean declarations and binder audit

Compared both declarations with the supplied elaborated signatures and README §5.1. No section variables occur; C, its category instance, T, P, θ, a and the three equations are explicit. No binder was lost. I did not run Lean: this is the supplied elaboration evidence plus source inspection, consistent with the read-only restriction.

| Declaration; location | Section, universe and instance context | Instances and computed values | Result; change |
|---|---|---|---|
| UnitFreeTensor; packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/Suggested.lean:51 | Layer 5; C : Type u; Category.{v} C; tensorObj, tensorHom, identity/composition laws, natural associator, pentagon | Discrete ℕ with addition: (0+1)+2=3=0+(1+2), all arrows identities. Cantor pairing: 2≠5 at (0,0,1), so no associator. On complex lines cα gives pentagon scalars c³ and c²; c=2 gives 8≠4. | Real categorical data with all requisite laws; no change. |
| idempotent_defect_eq_id; packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/Suggested.lean:75 | Same u,v; T : UnitFreeTensor C; P : C; θ : T(P,P)≅P; a : P≅P; hdef, hl, hr | θ=2xy on ℂ: both triple products 4xyz, a=1. Zero object: id=0 is its unique invertible arrow. On a nonzero line the zero arrow has 0²=0³ but is not invertible. Cantor pairing gives a(0)=0, a(2)=5 and intertwining values 2≠5. Pentagon with the stated equations gives a³=a², then a=id by cancellation. | Matches GH11 line 481 and line 718. Neither a definition restatement nor a one-library-lemma consequence; no padding. |

### Computed target ledger

L and A mean the README's stated local and global contexts. Characteristic-two fields and q=1 are excluded from L; dyadic characteristic-zero fields are included. The matrix-ring target §0.1 separately admits characteristic two, zero rings and nilpotents. Rank-zero, non-Hausdorff, non-local-field and arbitrary-coefficient inputs are not silently substituted for fixed GL₂ over L/A. Universes are fixed as in the conventions; the categorical theorem permits any category in those universes.

| Statement | Instances tried | Values on the two sides / separating values | Result; change |
|---|---|---|---|
| Scope; L, A and scalar conventions | F=𝔽₃((t)); F=ℚ₂; coefficient zero ring; q=1; e from t⁻¹ coefficient | q=3 and q=2 both legal; ℂ has 2⁻¹=1/2 even at residue characteristic 2. q=1 and zero coefficients are outside L. e(t⁻¹)=ζ≠1 but e(t⁻²)=1, so ker e is larger than O. | No hidden odd-residue restriction; conductor is a lattice condition. |
| Right-action, dual and measure conventions | g=diag(π,1), u(1), regular bimodule; two phases r,−r | IRL(g)=ρ(g), not ρ(g⁻¹); u(1)ᵀe₁=e₁+e₂; (v·g)·h=ρ(hᵀgᵀ)v=ρ((gh)ᵀ)v. e(r)e(−r)=1. Bilinear scalar i stays i. | Directions and bilinearity agree. |
| Centre, pair category, universes | Two blocks; infinitely many blocks; mixed pair | e₁+e₂ acts as 1; no finite e fixes (1,1,…). (Z,0)⊗(0,Zsph)=(0,Zsph); mixed Hom in the product category is 0 although ε:E→Iunit can be nonzero. | Finite-support Hom and full Hom remain distinct; faithfulness is not fullness. |
| 0.1 Determinant pairing | Matrix units; (1,2,3,4),(5,6,7,8); 𝔽₂; zero ring; ℤ[ε]/ε² | B(E₀₀,E₁₁)=1; B(E₀₁,E₁₀)=−1; 8+20−14−18=−4=det(m+n)−det m−det n. Gram determinant=1. In 𝔽₂ self-pairing=0 and cross-pairing=1. Zero-ring map is 0→0; B(εE₀₀,E₁₁)=ε. | Perfectness is valid over all stated rings; no change. |
| 0.2 Triality action | Scalar triples; diagonals (π,π⁻¹,1); transpose on E₀₁ | Scalar condition (abc)²=1 permits abc=−1. Form multipliers ππ⁻¹=1 versus π for (π,1,1). Transpose twice: E₀₁→E₁₀→E₀₁. | Determinant kernel and permutation conventions agree. |
| 0.3 Rigidified lift | Identity, transposition and a 3-cycle | Identity operator scalar=1; (13)²=1; σ³=1. Twisting by the sign character gives −transpose at (13), violating the rigidification. | Source uniqueness uses the abelianization C₂; no change. |
| 0.4 Kernel and generators | m=0,I₂; conductor zero; y=π | Unipotent phases 1 and e(bπ). Two Fourier factors give \|π\|⁴·\|π\|⁻⁴=1 and reflection; omitting them gives \|π\|⁻⁴=q⁴. Outer transpose keeps y det(g₁g₃). | Signs and dimension-four normalization agree. |
| 0.5 Open kernel | Reference indicator over 𝔽₃((t)); ball about I₂; trivial mirabolic line | Indicator values at (0,1),(I₂,1),(t⁻¹I₂,1): 1,1,0; extensions from Y° give 0 at (0,1). Fourier at 0 of a nonzero ball indicator is its positive volume. Φ⁻ of the trivial line is 0; Φ⁻Φ⁺ℂ=ℂ. | Y° is properly smaller and not middle-G-stable. |
| 1.1 Three centre actions | z=0,1,e_c; distinct blocks c,d | Three values are 0, id, e_c respectively; e_c²=e_c; e_c e_d=0. | Matches the central-distribution contract and Dor23 line 748. |
| 1.2 Singular orbit comparison | V with zero SL₂-coinvariants; V=1; total degrees 0,1 | Tor₀(V,Q)=0; E²₁,₀=0; identity residual SL₂ action gives E²₀,₁=0. For V=1, 1⊗GQ⊗G1≅ℂ≠0. | The hypotheses kill the zero-stratum obstruction without assuming flatness. |
| 1.3 Open spectral integral | Ψ(g,y)=Φ(g)f(y det g); coefficient integral 1; two equal character copies | μ=f(y); two same-side determinant substitutions would give f(y/(det g)²). End dimensions of χ and χ⊕χ are 1 and 4. A translated integral is unchanged by Haar substitution. | Irreducibility and the determinant-coordinate direction are used. |
| 1.4 Kirillov extension | Supercuspidal; principal series; Steinberg; F=𝔽₃((t)) | Supercuspidal Jacquet boundary=0; principal-series boundary≠0. ν(t)=1/3, ν⁻¹(t)=3; ratio 1 avoids both. I(ν¹ᐟ²,ν⁻¹ᐟ²) has generic subobject of Whittaker dimension 1 and character quotient of dimension 0. | Full Kirillov carrier and both classification extensions are needed. |
| 1.5 Local zeta comparison | Uniformizer shell; unit shell; Φ=0 | j adds one y-power: \|π\|·\|π\|^(s−1/2)=\|π\|^(s+1/2). Unit weight=1. Zero test gives 0=0. | Same Mellin exponent and convergence qualification as Dor23 line 453. |
| 2.1 Transpose conversion | Noncommuting upper/lower unipotents; diagonal | (gh)ᵀ=hᵀgᵀ gives the right action; (gᵀ)ᵀ=g. For g=diag(π,1), inverse transpose gives π⁻¹ instead of π on the first coordinate. | Equivalence, not duality; no change. |
| 2.2 Exotic product | M=0; swap twice; unit versus ordinary tensor | 0⊛N=0; s²[m⊗n⊗Ψ]=[m⊗n⊗Ψ]. Iunit⊛N=N while ordinary tensor on a nonzero character line retains the larger vector-space dimension of Iunit. | Balanced tensor and residual action are explicit contracts. |
| 2.3 Weak tensor and functor data | Vect; λ replaced by 2λ; identity functor | Both symmetry-unit routes are 2λ. Functor unit comparison 2·id makes the square commute; identity comparison gives 2λ versus λ. | Checks distinguish functor-unit normalization; no associator assumed. |
| 2.4 Whittaker unit | f=1_GL₂(O), F=𝔽₃((t)), ν=0; reference kernel | W(1)=1, W(u(t⁻¹))=ζ, W(diag(t⁻¹,1))=0. Inverse θ gives ζ². The φ integral is 1M₂(O)(g⁻¹)1O×(−det g)=1_GL₂(O)(g). | Earlier repair verified. |
| 2.5 Trace and unit symmetry | Unit trace; two unit endomorphisms; transpose sign | Φ⁻(Iunit⊛N)=Φ⁻N; unit symmetry is +id, whereas −id would give −λ instead of λ. The Eckmann–Hilton square identifies fg with gf. | Source theorem supports the orbit calculation; no change. |
| 3.1 Degeneracy predicates | 1G; St; both nonsplit extensions | Φ⁻1G=0 from invertible 1−θ(u); Φ⁻St=ℂ. Ext¹(St,1G)≠0. Hom(Eext,1G)=0 for 0→1G→Eext→St→0, since a nonzero quotient would split; the reversed extension has Hom to 1G≠0. Φ⁻(1G⊛1G)=ℂ. | Genericity, degeneracy-freeness and tensor-ideal closure are separated. |
| 3.2 Firm Bernstein modules | Z=ℂ⊕ℂ; Z=⊕ℕℂ; a one-block map | Unit (1,1) fixes both finite blocks. Every finite projector changes the infinite all-one tuple. One-block identity lies in underlineHom, infinite identity does not. | Full/product and finite/direct-sum laws agree. |
| 3.3 Centre of the Whittaker unit | f=id, z=0; two blocks and infinitely many | ψ(id)_X=λ(id⊛id)λ⁻¹=id; ψ(0)=0. Evaluation returns (z₁,z₂); infinite (1,1,…) is in full End but not finite-support End. | The inverse construction proves the theorem without an associator. |
| 3.4 Enhanced adjunction | N=0,Z; N=e_cN; infinite coproduct | F(0)=0; F(Z)=Iunit; Φ⁻enhF(N)=N; e_dF(N)=0 for d≠c. A coproduct vector retains finite support, whereas an all-one product tuple does not. | Roughening comparison is owned here, enrichment imported. |
| 3.5 Degeneracy-free equivalence | F(0),F(Z), St; coproducts | Objects 0 and Iunit are in the image; St has nonzero Ext¹(St,1G) and is excluded. Φ⁻enhF(⊕N_i)=⊕N_i. | Essential image and inherited tensor scope agree. |
| 4.1 Spherical generator | Ramified χ∘det; k∈SL₂(O); diag(u,1) | χ(det k)=1, but χ(u)≠1 excludes K-invariants. Finite-support Hom has the ramified χ line of dimension 1; V^K has dimension 0. | SL₂(O), not K, is required. |
| 4.2 Counit/comultiplication | ν=0,1; coefficient character over 𝔽₃((t)) | (q⁻ν,δπ⁻ν)=(1,δ₁),(q⁻¹,δπ⁻¹). h⁻¹u(b)h=u(−π^ν b), integral iff b∈π⁻νO. e(t⁻²)=1 with t⁻²∉O. | Normalization and corrected conductor-lattice condition agree. |
| 4.3 Spherical equivalence | Unit Zsph; ramified character; either counit | Zsph maps to E; both counit composites on E equal id. Ramified character has SL₂(O)-fixed dimension 1 but K-fixed dimension 0. | Uses the declared compact-projective centre contract. |
| 4.4 Joint generation | (Z,0),(0,Zsph); mixed product/map | Images are Iunit,E; mixed product=(0,Zsph), image E=Iunit⊛E. Source mixed Hom=0; ε in target Hom is nonzero. | No fullness claim; mixed naturality remains a proof obligation. |
| 5.1 Coherence | Unit-free addition; Cantor pairing; cα; θ=2xy; zero object | Addition: 3=3; pairing: 2≠5; scalar pentagon: c³=c² forces c=1; triple multiplication: 4=4, a=1. Zero object id=0; zero on a nonzero object is noninvertible. | Matches both Lean rows above. |
| 5.2 Exotic associator | Whittaker-only terms; E-only terms; mixed ε | Whittaker transport gives the native relative associator. Pentagon after E identification gives a³=a²; hence a=1. Both mixed paths reduce to the same counit composite. | Source proof and listed mixed-map obligation agree. |
| 5.3 Categorical trace | Regular bimodule; Vect; zero module | H⊗H M≅M and M⊗H H≅M give triangle identities; for Vect, ℂ⊗ℂV≅V on both sides; pairing(0,N)=0. | Ordinary categorical tensor is a declared gap; smooth coevaluation is a target here. |
| 5.4 Generic idempotent algebras | Unit quotient scaled by 2; St; determinant character | Multiplication scales by 1/2; (m/2)⊗(2ℓ)=m⊗ℓ. St⊛St≅St; Hom(Iunit,χ∘det)=0 excludes a character unit. | The canonical multiplicity line is Hom, with the stated scaling. |
| 5.5 Spherical invariant algebra | A=Iunit; flip; infinitely many blocks | Counit composition agrees on each block; f⋆g=g⋆f; (1,1,…) is absent from ⊕ℕℂ. Averaging a fixed vector gives 1·v, not vol(H)·v. | Finite support, normalized averaging and relative quasi-unit are retained. |
| 6.1 Adelic tensor | Empty stage; extra unramified place; zero reference; whole-group indicator | Empty tensor=ℂ; [x]=[x⊗yv]; with a zero reference the transition sends x to 0. 1_GL₂(Ov) has compact support; 1_Gv has unbounded determinant valuation. | Correct supplier and almost-everywhere hypothesis. |
| 6.2 Compact function carrier and dual | Scalar i; quotient indicator; constant function | B(f,if′)=iB(f,f′), whereas a conjugate-linear second slot gives −iB(f,f′). A rational translate has the same quotient mass; integrating all translates repeats it infinitely. Constant output is 1 in every determinant degree and is not compactly supported. | Bilinear transpose dual and unrestricted smooth carrier agree. |
| 6.3 Theta functional | Two rational pairs; rational diagonal/unipotent; self-dual lattice | Values 1 and 2 sum to 3 before and after transpose; rational norm=1 and rational additive phase=1. Fourier lattice volume and reciprocal volume multiply to 1. | Finiteness uses discrete rational pairs and compact support. |
| 6.4 Theta multiplication | Zero map; scalar multiple; isolated rational pairs | Existing Checks give equality 0=0 for the zero map. Actual values for the proposed replacement Checks are 1, 3 and ζ; zero gives 0,0,0. | S01. |
| 6.5 Global zeta | Zero input; two signed patches; uniformizer shell | Zero gives 0=0; signed integral 1−1=0 but absolute majorant=2. Exponent (s−1/2)+1=s+1/2. A rational idele has norm 1 but the Mellin domain remains A×. | Absolute convergence contract suffices for the stated unfolding route. |
| 7.1 Poincaré map | Rational unipotent translate; zero input; normalized quotient measure | θ(U(F))=1, so translated terms coincide; zero sum=0; integral of 1 on U(F)\U(A)=1. | Compact modulo U support descends because the unipotent rational quotient is compact. |
| 7.2 Petersson unit identity | Determinant 0; q·det ξ=1; q·det ξ≠1 | Integrating e(x(q det ξ−1)) over F\A gives respectively 0,1,0. The surviving rational matrices have determinant q⁻¹, so they are invertible. | Unit unfolding rejects the singular locus and wrong Whittaker sign. |
| 7.3 Automorphic ideal | Nonnegative compact patch; two equal-fibre patches; cusp | Pushforward of a positive patch is positive, so I≠S. For normalized patches f=1_A/a−1_B/b, p(f)=1_D−1_D=0. Cuspidal constant term=0; determinant pushforward=0, without equating the two kernels. | Determinant pushforward is the declared gap; no replacement by cuspidality. |
| 7.4 Algebra on I | Epimorphic unit; two bracketings; scalar i | m(e,x)=x; precomposing both associativity sides with the epimorphic unit reduces both to m. Bilinear pairing sends i to i. | Associativity and compact image follow in the stated order. |
| 7.5 Ambient I-actions | Inclusion I→S→S̃; two candidate actions | On I both actions give m_I. Their difference precomposed with e⊛id is 0; epimorphicity forces difference=0. | Existence is supplied by the theta construction, uniqueness by the unit. |
| 8.1 Abstract automorphic modules | I itself; zero object; determinant constituent | I has multiplication action; zero action factors as 0=0. A determinant constituent has Whittaker quotient 0 but can be an I-module. | Unit-factorization criterion does not substitute genericity for automorphicity. |
| 8.2 Fully faithful realization | Two actions; subobject; infinite product | Difference of compatible actions vanishes after the epimorphism, hence is 0. For characters of increasing conductor at one local place, each vector has an open stabilizer, while the tuple of all nonzero vectors has their non-open intersection. | Limits require smooth reconstruction, not the full vector-space product. |
| 8.3 Matrix realization | Reference at m=0; diag(π,1); E₀₁ and nonsymmetric unipotent | Q(reference)(0)=1. Substitution z=y det g gives \|det g\|⁻¹=q for the diagonal. At E₀₁, transposed and untransposed arguments of the integral matrix indicator give 0 and 1. A rational determinant has norm 1. | Earlier residual-action repair verified. |
| 9.1 Spin datum | ℙ¹; dt at infinity; odd valuation; section multiplied by π | O(−1)²=O(−2)=Ω; ord∞dt=−2 gives Λ∞=πO. An odd differential valuation has no integral half exponent. Replacing the section by π multiplies ω by π² and Λ by π⁻¹. | Actual square-root line bundle is required; existence remains conditional on its gap. |
| 9.2 Spin spherical coalgebra | Conductor-zero reference; counit twice; section change | Reference is 1_M₂(O)δ₁ with coefficient 1; both counit composites give id. Changing the differential by a square rescales the lattice by the inverse square root. | Source supports the unramified calculation; full transported construction remains a theorem obligation. |
| 9.3 Spin convolution | u=ηIεA; rescaling; two disjoint patches | u⋆f=f, whereas 2⋆ gives 2f. Orthogonal component idempotents multiply to 0. With a=b=1, p(1_A−1_B)=0 but p((1_A−1_B)²)=2·1_D. | Repaired unit Check distinguishes normalization and nonideal kernel. |
| 9.4 Inverse-transpose transport | g=diag(π,1); rational section change | Weight \|det g\|⁻²=q²; at g⁻ᵀ it is q⁻², so the square is 1. Global rational scaling has norm product 1. | Weighted involution and section independence agree. |
| 10.1 Normalization module | λ=0; π; Weyl twice | ηf(0,1)=0 while the normalization reference is 1 there. Weighted equivariance gives q⁻¹q=1=1; unweighted gives q⁻¹≠1. Two Weyl weights multiply q⁻¹q=1. | Earlier torus-action repair verified. |
| 10.2 Induction/restriction | Zero module; normalization rescaled by 2; q=3 | î(0)=0 and r̂(0)=0. Precomposition with twice a chosen trivialization doubles the induced Hom comparison; hence it is not choice-independent. q=3 requires \|π\|=1/3, not a selected square root. | Adjunction is Hom_T(r̂W,V)=Hom_G(W,îV); direction is correct. |
| 10.3 Rank-one multiplication | diag(0,λ); I₂; scalar π | det diag(0,λ)=0 gives middle unipotent phase 1; det I₂=1 gives e(by). The residual normalization weight at (π,1) is q⁻¹. | The singular stratum, additive λ=0, and balancing of three torus actions are retained. |
| 10.4 Lax coherence/localization | Reducible induced representation; iterated normalization | For the extension with Steinberg subobject and trivial quotient, the Steinberg obstruction product is 0 although induction is nonzero. Triple comparison has two normalization factors, Lnorm⊗Lnorm, on both bracketings. | Unitality is asserted after localization, not for ordinary unlocalized induction. |
| 10.5 Local intertwiner | Boundary λ=0; localized η and η(w); unit composite | Before localization η has boundary value 0 versus reference value 1, so its normalization cannot be cancelled. After both maps are inverted the two inverse factors multiply to 1 and the intertwiner square becomes id; before that its square retains η⊗η(w). | Local source and target agree with Dor21; their global transport is S02. |
| 11.1 Torus automorphic modules | Rational element; character; zero module | Rational action is 1 on the quotient; a character with χ(t)≠1 at t∈T(F) cannot descend. The zero module has zero action and descends. | Rational triviality, not central-lattice invariance, defines this category. |
| 11.2 Automorphic adjunction | Unramified references; cusp; anomalous Eisenstein quotient | Raw η sends the reference to value 0 at (0,1), versus the normalization reference value 1. Cuspidal restriction=0; anomalous Eisenstein restriction=0 as well. | Inverting η for the unit does not specify the Weyl-twisted global trace; S02. |
| 11.3 Weyl lifting | u=v; degree 0 and −m; q=3; finite stabilizer | Four convolution terms are D(uz,vz),D(uz²,v),D(v,uz²),D(vz,uz) on both sides. Required degrees are N,N,2N or N,N−m,2N−m. S(u,u)=2D(u,u). Conjugated values are q⁻¹ᐟ²,q⁻¹ᐟ², versus q¹ᐟ²,q⁻³ᐟ² with the wrong sign. Stabilizer order over 𝔽₃ is 4, so normalization divides by 4. | Finite ray quotient and large-degree argument repair the source's arbitrary-prime step. |
| 11.4 Cusp/Eisenstein components | Cusp; anomalous quotient; no rational point | Cusp constant term=0. Anomalous quotient has restriction 0 and cusp projector 0. Divisor degrees 3−2=1 give an idele of degree 1 without a degree-one place. | Orthogonality and support use bounded degree and fixed level. |
| 11.5 Component decomposition | Complementary idempotents; infinite product; anomalous object | e²=e, e(1−e)=0. A tuple with increasing conductor has no common open stabilizer. Anomalous restriction=0 but its Eisenstein projector is id. | Product is categorical; vanishing restriction has no false converse. |
| 11.6 Irreducible equivalence | Steinberg; both nonsplit extensions; character | St⊛(St-subobject extension)=0; St⊛(St-quotient extension)=St. A character has Whittaker dimension 0 and is not a St-module, despite its shared Bernstein block. | Includes nongeneric global induced constituents through the declared supplier contract. |
| 11.7 Finite length | Length 0,1,n; χ=χ(w); cusp | Bounds are 0,2,2n. A quotient of an extension of χ by χ has dimension ≤1+1=2 even if nonsplit. Cusp restriction has dimension 0. | Right exactness yields the filtration bound; no exactness or distinct-character assumption is used. |

### Headlines, ownership and pinned APIs

The headline inventory is: rigidified triality (§0.3); singular-stratum, Kirillov and zeta comparisons (§§1.2–1.5); Whittaker unit and trace (§§2.4–2.5); centre and degeneracy-free equivalence (§§3.3–3.5); spherical equivalence and generation (§§4.3–4.4); unit-free coherence, exotic associativity, categorical duality and local algebras (§§5.1–5.5); adelic tensor, theta invariance and zeta comparison (§§6.1, 6.3–6.5); Poincaré image and compact algebra (§§7.2–7.5); fully faithful realization and matrix automorphicity (§§8.2–8.3); spin coalgebra and convolution transports (§§9.2–9.4); normalized induction and intertwining (§§10.3–10.5); automorphic adjunction, Weyl lifting, components, irreducibles and finite-length restriction (§§11.2–11.7).

Only §5.1 is presently statable with a short definition on pinned native carriers. Suggested.lean states it. Its module docstring names the other groups and the missing smooth, kernel, firm-module, categorical-tensor or automorphic carriers. The two declarations contain no free predicate substitute, admitted data, boundary theorem or one-tactic padding. The determinant expansion is an elementary construction, not an additional deep headline requiring an acceptance theorem.

The pins inspected are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The cited declarations resolve at those pins:

| Pinned file and location | What it actually supplies |
|---|---|
| Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:809 | Matrix.det_fin_two, over a commutative ring. |
| Mathlib/LinearAlgebra/Matrix/Trace.lean:43, 71, 156 | Matrix.trace, trace_transpose and trace_mul_comm; no smooth representation. |
| Mathlib/RepresentationTheory/Coinvariants.lean:410 | Rep.coinvariantsTensor, algebraic diagonal coinvariants of the tensor representation; no smooth residual action or smooth Tor. |
| Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean:366 | SymmetricCategory requires an existing MonoidalCategory, including its unit data. |
| Mathlib/CategoryTheory/Monoidal/CommMon_.lean:26; Mathlib/CategoryTheory/Monoidal/Mod.lean:227 | CommMon and Mod bundle genuine monoid/module structure over an existing monoidal category. |
| Mathlib/CategoryTheory/Category/Basic.lean:123, 234; Mathlib/CategoryTheory/Iso.lean:54; Mathlib/CategoryTheory/Functor/Basic.lean:40 | Native categories, composition, isomorphisms and functors for the unit-free theorem. |

Object searches covered the pinned libraries, active and completed roadmaps, board packages and the available open-head index using the prescribed roadmap search. No earlier unit-free defect theorem or competing fully qualified declaration was found. Generic balanced tensors belong to the smooth-representation supplier; algebraic restricted tensors belong to AutomorphicFormsOnReductiveGroups; theta characteristics on abelian varieties, unary theta functions, and type-D₄ diagram triality are different objects. This package owns the particular triple-GL₂ kernel, its exotic algebra, and the unit-free defect theorem. No ownership claim relies on a declaration-name-only search.

### Supplier and gap audit

Cross-roadmap checks covered nine direct supplier families and the intermediate ArithmeticGaloisDuality interface. Repeated Needs lines were resolved against the same current copies. These are checks of supplied statements, not certifications of future implementations.

| Supplier and checked sections | Witness / scope comparison |
|---|---|
| SmoothRepresentationsOfLocalGroups §§SR.0.1–SR.0.4, SR.0d.1–SR.0d.2, SR.1.1–SR.1.3, SR.2.1–SR.2.3 | Smooth carriers, averaging, duals, derived category, induction and Jacquet functors exist as targets. General diagonal tensor is distinct from the missing smooth balanced tensor with residual actions. |
| SmoothRepresentationsOfLocalGroups §§SR.3a.1, SR.3.2, SR.4.1, SR.5.1–SR.5.2 | TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:2326 supplies jacquet-subrepresentation and :2335 admissibility-of-irreducibles; :2603 starts Bernstein decomposition; :3647 supplies unnormalized mirabolic functors; :4324 supplies segment-representations. The two GL₂ extension orientations agree. |
| AutomorphicLFunctionsAndLocalFactors, Representation prerequisites; AL.0–AL.3 | TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:642 starts local Fourier levels, under number-field-completion hypotheses. Its function-field curve adapter and :2428 function-field factor/converse target exist. Strong multiplicity one there does not itself state ordinary multiplicity one in the fixed-central-character cusp space; the latter gap is not redundant. |
| MetaplecticAutomorphicForms §§0.15–0.18, 1.1–1.4, 2.4b–2.7, 4.1, 4.1a, 4.2–4.4 | Scalar pushout, Schrödinger operators and function-field vector Poisson are supplied. The package uses the scalar extension, not an unsupported splitting of the double cover by triple GL₂. |
| FunctionFieldArithmetic §§0.1–0.3, 2.1–2.3, 4.8–4.10, 5.8, 6.1–6.4 | TauCetiRoadmap/FunctionFieldArithmetic/README.md:440, :478, :509, :676, :713, :749, :1500, :1536, :1575, :1995, :2082, :2133, :2178 and :2226. Degree sign, differential lattice exponent and finite-ray-cover convention agree. Its central-lattice automorphic carrier is not substituted for unrestricted smooth functions. |
| ArithmeticGaloisDuality §R02.3.2, through FunctionFieldArithmetic | TauCetiRoadmap/ArithmeticGaloisDuality/README.md:2072 supplies idele degree, degree-one idele and compact degree-zero classes. A degree-one place is not asserted. |
| GL2AutomorphicRepresentationsAndTransfer §§R16.2.1, R16.2.8 | TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:627 and :723. Existing classification and supercuspidal Kirillov realization are characteristic-zero inputs; neither supplies the full odd equal-characteristic classification or all-generic boundary. |
| AlgebraicVectorBundles §§L0B–L0C | TauCetiRoadmap/AlgebraicVectorBundles/README.md:228 and :254 supply actual invertible sheaves, tensor, dual and pullback; existence of a rational square root of Ω remains a separate contract. |
| AutomorphicFormsOnReductiveGroups §3.4 | TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:549 supplies the algebraic finite-stage colimit with nonzero references and almost-everywhere reference-preserving maps. It is distinct from topological restricted products. |
| Completed/RestrictedProducts, Scope and ownership, Layer 1, Change of family and double cosets | Completed/RestrictedProducts/README.md:268 supplies eventual integral preservation and reference/reindexing transports. Its coordinate homeomorphisms retain continuity hypotheses. |
| EnhancedDerivedSheaves §E5:presentability.2 | TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1624, tensor target at :1674. The presentable ∞-categorical tensor is supplied; the ordinary complex-linear module-category comparison is explicitly contracted. |

All 16 gap slugs, suppliers and needs match between packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/design/plan.json and the README. None has supplier `none`. The ambient L/A conventions specialize the smooth contracts to the stated complex, nonarchimedean or function-field contexts.

| Gap slug | Missing interface, distinguished from existing input |
|---|---|
| smooth-balanced-tensor | Balanced quotient with commuting residual smooth actions and regular-bimodule comparison, beyond the ordinary diagonal tensor. |
| smooth-tor-residual-action | Derived balanced quotient and two-group spectral sequence with residual identity-action descent, beyond the derived smooth category. |
| firm-centre-enrichment | Closed relative tensor–Hom and finite-Bernstein-support enrichment, beyond the Hecke equivalence. |
| transpose-central-distributions | Distribution realization and transpose invariance of the GL₂ centre, beyond its abstract decomposition. |
| twisted-spherical-centre | SL₂(O) compact induction and its finite-support endomorphisms, beyond K-spherical Satake. |
| equal-characteristic-fourier | All perfect pairings and partial transforms for all allowed local fields/characters, beyond AL.0's number-field completions and AL.3's scalar residue normalization. |
| normalization-module-freeness | Invertible firm convolution module and the specified reference generator, beyond the Schwartz carrier and zeta factors. |
| compact-data-global-zeta | Absolute convergence for arbitrary compact quotient data, beyond cuspidal factorization. |
| function-field-cuspidal-multiplicity-one | Ordinary multiplicity one in the function-field cusp realization, beyond strong multiplicity one. |
| determinant-pushforward | SL₂-fibre integration and Haar disintegration, beyond the automorphic function carrier. |
| sl2-rational-unipotent-generation | The precise adelic subgroup inclusion used for the Poincaré image, beyond adelic-point topology. |
| eisenstein-constituent-automorphicity | Every constituent in unrestricted smooth quotient functions, beyond central-lattice constant terms. |
| rational-theta-characteristic | Rational existence of a square root of Ω, beyond line-bundle tensor operations and Picard-point comparison. |
| odd-equal-characteristic-gl2-classification | The missing field scope for explicit GL₂ classification, consuming existing general admissibility and segment theory. |
| all-generic-kirillov | Full uniformly smooth Kirillov realization with Jacquet boundary, beyond the compact supercuspidal model. |
| ordinary-presentable-linear-tensor | Ordinary complex-linear categorical tensor and its module comparison, beyond the supplied ∞-categorical formulation. |

These are coherent extensions of the named supplier interfaces. Their current absence is not a finding. The package's own new global trace construction in S02 is not delegated to a supplier.

The read-only dependency gate returned:

```text
depcheck: 149 roadmaps, 1015 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Within the package, §§1.2→1.3→1.4, §§2–4→5.2, §§6.3→6.4→7, and §§11.2→11.3→11.4→11.5→11.6→11.7 follow the stated target order. The Layer 9 spin branch is not a prerequisite for Layer 10.

### Counts and policy

Two Lean declarations read and compared with elaborated types; 58 numbered targets read; 187 Check bullets examined against their sections (minimum three per target); computations for every target recorded above. The source audit resolved 67 distinct line anchors across four readable works: Dor23 48, Dor21 15, GH11 two, Dor20Z two. Numbered theorem/section/page locators were followed as well; for example the §6.1 line-1980 overview leads to the explicit reference-vector Claim 4.3 at Dor23 line 2025. Arm67 is the fifth work and remains uncertified. Nine direct supplier families, one intermediate arithmetic interface, and all 16 gap declarations were checked.

The diff against origin/main contains nine files, all inside packages/ExoticMonoidalStructuresAndAbstractAutomorphicity. README and Suggested.lean contain no pull-request/process narrative, forbidden command, computational algorithm, `lemma`, `set_option`, admitted data or extra import. The source manifest retains one key per work and the published/preprint version distinctions. The README names both Lean declarations. No package implementation file was changed, no Lean command was run, and nothing was posted.

## Not verifiable

- Arm67, pp. 238–246, remains the settled uncertified source for rational theta-characteristic existence. Dor23 line 2512 cites it. Its text was not requested again, and no missing-reference request was created.
- The 16 supplier extensions are declared contracts, not implemented results. Acceptance of the downstream constructions is conditional on those exact contracts; this review does not certify their eventual proofs.
- Elaboration was not rerun. The supplied signatures cover the unchanged two declarations and expose all their binders. No build result is inferred beyond that evidence.
- Local ramified Fourier/coalgebra transports, analytic convergence and categorical descent were compared with the stated source arguments and tested on the displayed boundary cases; their complete formal proofs are future work. In particular, the report does not claim to have independently reproved every metaplectic relation or all convergence estimates.
- Ownership searches cover the supplied main/completed copies, board packages and available open-head index. They cannot exclude unpublished work outside those inputs.

## Source issues

- **Misprint** in Dor23 at Construction 2.7, printed p. 11, Dor23 line 503: the source says the triple determinant-one action is an embedding; it should be a homomorphism with scalar kernel, since (aI,a⁻¹I,I) acts trivially; affects nothing.
- **Misprint** in Dor23 at Warning 3.25, printed p. 25, Dor23 line 1292: the source says St is the trivial representation; it should be the Steinberg representation named immediately before; affects nothing.
- **Error** in Dor23 at Remark 3.47, printed p. 33, Dor23 line 1626: the source says the unipotent intersection equals the entire character kernel; it should be the conductor lattice, since the kernel need not be an O-submodule; affects nothing.
- **Misprint** in Dor23 at Claim 4.3 proof, printed p. 41, Dor23 line 2035: the source says the unit reference is the whole local-group indicator; it should be the compact integral-subgroup indicator's class; affects nothing.
- **Misprint** in Dor23 at Proposition 4.9 proof, printed p. 43, Dor23 lines 2136, 2146 and 2161: the source says the Fourier integrals run over rational matrices; it should be adelic matrices with self-dual additive measure; affects nothing.
- **Misprint** in Dor23 at the pairing before Proposition 4.16, printed p. 45, Dor23 line 2270: the source says the Petersson integral runs over the adelic group; it should be over the rational quotient; affects nothing.
- **Misprint** in Dor21 at Theorem C.2.1, printed p. 43, Dor21 line 2035: the source says induction goes from group modules to torus modules; it should go from torus modules to group modules; affects nothing.
- **Gap** in Dor21 at Remark C.4.5, printed p. 49, Dor21 line 2297: the source says to choose a place of degree one; it should choose an idele generating the degree image, since a rational point need not exist; affects the proof.
- **Gap** in Dor21 at Lemma C.4.9 proof, printed p. 52, Dor21 lines 2460–2463: the source says Chebotarev gives a prime representing an arbitrary idele class; it should use finite ray quotients, sufficiently large admissible degrees and convolution to recover the other classes; affects the proof.
- **Misprint** in Dor21 at Lemma C.5.2 proof, printed p. 53, Dor21 line 2513: the source says the object is a module over itself in the Steinberg criterion; it should say a module over the Steinberg algebra; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "14b31712c823863ba972437afb65741674a56a93", "job": "RT-ExoticMonoidalStructuresAndAbstractAutomorphicity~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
