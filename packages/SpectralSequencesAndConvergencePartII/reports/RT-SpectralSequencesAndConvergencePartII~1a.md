<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/15047#issuecomment-6872387420 -->
Red team round 1 pass a (codex) of 9566021

Verdict: needs_changes

1. **F01** (P2) The complex and relative horseshoe headlines have no acceptance signatures

   **Location:** `packages/SpectralSequencesAndConvergencePartII/README.md:884–905`; `packages/SpectralSequencesAndConvergencePartII/Suggested.lean:20–21,133–146`. The Lean inventory names only “the horseshoe lemma for injective resolutions of the outer terms”.

   **Claim:** The owned horseshoe results include complexes and prescribed lifts of both outer maps, but the acceptance file tests only existence for objects. Neither omitted result is listed as unstatable.

   **Witness:** `Mathlib/Algebra/Homology/CochainComplexPlus.lean:33–47` provides bounded-below complexes; `Mathlib/CategoryTheory/Preadditive/Injective/Resolution.lean:46–57` provides object resolutions. QuasiIso, termwise Injective, ShortComplex.ShortExact and ShortComplex.Splitting express all remaining conditions.

   **Exact repair text:** “Add admitted headline theorems for §2.1(a′) and §2.1(b), using native complexes, chain maps, quasi-isomorphisms, termwise injectivity and degreewise short exactness/splittings. For (a′), quantify over a given quasi-isomorphism A → I₁ with bounded-below injective I₁, and produce I₂, I₃, compatible augmentations and a degreewise split sequence. Include preservation of the common zero lower bound. For (b), quantify over the augmented source resolution sequence, the degreewise split target injective resolution sequence and the two prescribed outer chain maps, and produce the middle chain map commuting with both squares and the middle augmentation. Name both theorems in the README and module docstring.” No new resolution construction is required merely to state these theorems.

   **Repair test:** The §2.1 non-split integral extension requires a twisted middle differential; its transported split example with h⁰ = id, h¹ = 0 requires μ = φ and rejects μ = id, since the differentials are (2u,2v) and (2u−2v,2v). The current object-existence signature tests neither prescribed-map constraint.

2. **F02** (P3) The Leibniz sign has no discriminating Check in the product layers

   **Location:** `packages/SpectralSequencesAndConvergencePartII/README.md:1609–1625,1652–1660`. The only nonzero page differential in §5.2 is tested “Over 𝔽₂”; its other Checks have zero page differentials.

   **Claim:** The Checks are meant to pin the sign (−1)^(p+q) in the page Leibniz rule and the corresponding Massey condition.

   **Witness:** In §5.1 the integral non-example multiplies even degree-zero elements; its other nonzero-differential test is over 𝔽₂. In §5.2, −1 = +1 in 𝔽₂; the other two Checks give 0 = 0 for either sign.

   **Exact repair text:** Replace §5.2’s zero-complex Check, and reference the same example under §5.1, with: “Over ℤ take A = ℤ[v] ⊗ Λ(u), with degrees |u| = 1, |v| = 2, du = v and dv = 0, filtered by the stupid degree filtration. Its E₁ differential is d. For x = y = u, d₁(u²) = 0 and d₁(u)u − u d₁(u) = vu − uv = 0, whereas the unsigned rule gives 2uv ≠ 0. The filtered-complex exact couple satisfies μ₀ with the signed rule.”

   **Repair test:** uv is a free integral basis element in degree 3, so 2uv ≠ 0. Reduction modulo 2 erases exactly this distinction. The replacement also supplies a third nonvacuous test for the filtered-pairing construction, beside the nonzero differential and trivial-filtration examples.

## Verified sound

Read all 1,871 README lines and all 234 Suggested.lean lines. The inventory is **11 actual Lean declarations: nine theorems and two definitions**, in four layer sections. The supplied signature inventory's count of 13 includes two spurious matches in prose, `1.3` and `for`; these are not declarations. I compared the eleven supplied elaborated signatures with the file and README, including their universe and instance arguments. No required section binder disappeared. I did not run Lean or alter the acceptance file.

The mathematical inventory below covers all **24 numbered target sections**, their subsidiary assertions, conventions and definitions. It also records the values for all **97 top-level Checks** under those sections; a compound Check can have several computations. Zero tests are recorded as boundary tests, not counted as discriminating definitions of an object. R02 identifies the product Check defect. There are **29 source-locator groups** in the source ledger, **14 non-base cross-roadmap section/target citations** in the ownership ledger, and **19 declared base supplier contracts**. These counts describe the checks actually recorded, not a proof of the proposed library.

### Acceptance declarations and their contexts

All names below have prefix `TauCetiRoadmap.SpectralSequencesAndConvergencePartII`. There are no section variables to infer: the declarations explicitly bind their categories, instances and hypotheses. Category object and morphism universes are separately polymorphic (`u₁,u₂,u₃` and `v₁,v₂,v₃`). “Abelian C” below includes the separately bound category instance. “Derived C” means the explicit `HasDerivedCategory C` instance. Each row includes a positive calculation and, where applicable, a separating input.

| Declaration; file line; section | Variables and instances retained by its type | Computed instance, sides and result | Change |
|---|---|---|---|
| `acyclic_total_of_finite_antidiagonals`; 73; 1 | Abelian C; integer cochain bicomplex K; HasTotal; finite support on each diagonal; exact columns OR rows | Unit commuting square: d⁰(1)=(1,1), d¹(a,b)=−a+b; ker d¹=im d⁰ and coker d¹=0, hence total H=0. Zero K gives H=0. | None |
| `acyclic_total_of_bounded`; 87; 1 | Previous category plus sequential colimits and their exactness; integer K, HasTotal; degree-dependent upper bound on columns with exact columns OR on rows with exact rows | Dual staircase has exact columns but columns unbounded above: sum H¹=ℤ, so it is excluded. Horizontal two-term identity satisfies the bound and has ker=id kernel=0, coker=id cokernel=0. | None |
| `quasiIso_total_map_of_finite_antidiagonals`; 102; 1 | Abelian C; integer K,L with HasTotal and separate finite supports; f; columnwise OR rowwise QuasiIso | Identity on the horizontal ×2 complex induces id on H¹=ℤ/2 and H⁰=0. Contractible unit square →0 induces 0→0 in every degree. | None |
| `quasiIso_total_map_of_bounded`; 118; 1 | Exact sequential colimits; K,L,f, both HasTotal; one bound for both supports, degree-dependent; same column/row disjunction | Staircase → its column 0 is columnwise a quasi-isomorphism but has sum-total H⁰ map 0→ℤ; its columns are not upper bounded. Identity on a bounded complex gives id:ℤ/2→ℤ/2. | None |
| `exists_injectiveResolution_horseshoe`; 138; 2 | Abelian C, short complex S and hS:ShortExact, two given InjectiveResolutions; no EnoughInjectives assumption | For 0→ℤ→×2ℤ→ℤ/2→0, middle H⁰=ℤ, whereas untwisted direct sum H⁰=ℤ⊕ℤ/2. In a split extension, the degreewise splitting has inclusion/projection composite 0. | Existing signature sound; R01 adds the other headlines |
| `IsRightAcyclic`; 151; 2 | Abelian C,D; Derived C,D; EnoughInjectives C; additive F; object B; tests integer i>0 | F=Hom(ℤ/2,−): B=ℚ/ℤ has H⁰=ℤ/2 and Hⁱ=0 for i>0, hence true; B=ℤ has H¹=ℤ/2, hence false. F=−⊗ℤ/2 gives RF(ℤ)=0, hence true despite F(ℤ)≠0. | None |
| `exists_rightDerivedFunctorPlus_homology_iso_rightDerived`; 163; 2 | Abelian C,D; Derived C,D; EnoughInjectives C; n:ℕ; family over additive F, compatible with every natural transformation | For Hom(ℤ/2,−), n=1,A=ℤ, both sides ℤ/2; τ=2id gives 0=0 in the naturality square. For tensor ℤ/2, n=0,A=ℤ, both sides 0, not F(A)=ℤ/2. | None |
| `isIso_rightDerivedFunctorPlusUnit_app_of_isRightAcyclic`; 181; 2 | Same C,D instances; additive F preserving finite limits; L:CochainComplex.Plus C; acyclicity of every L.obj.X n | Injective resolution ℚ→ℚ/ℤ gives H¹=ℤ/2 on both sides for Hom(ℤ/2,−). Dropping finite-limit preservation admits tensor ℤ/2 and L=ℤ[0], giving H⁰ map ℤ/2→0, not an isomorphism. | None |
| `compositionTrans`; 196; 3 | Abelian C,D,E; Derived all three; EnoughInjectives C,D; additive F,G | With G=id, both functors have value RF and the unit comparison is id. For F=G=Hom(ℤ/2,−) at ℚ/ℤ, degree 1 map has source 0 and target ℤ/2; the definition does not incorrectly assert it invertible. | None |
| `isIso_compositionTrans_iff`; 211; 3 | Previous context plus finite-limit preservation of G | F=id: both assertions true. F=G=Hom(ℤ/2,−): both false, since F(ℚ/ℤ)=ℤ/2 has R¹G=ℤ/2 and comparison has degree 1 map 0→ℤ/2. F=tensor ℤ/2,G=id: both true although F is not left exact. | None |
| `nonempty_tor_iso_tor'`; 225; 4 | Monoidal abelian C; MonoidalPreadditive; HasProjectiveResolutions; both tensor functors exact for each projective P; n:ℕ | n=1: kernels of ×6 on ℤ/4 and ×4 on ℤ/6 are {0,2} and {0,3}, both ℤ/2. n=0: both ℤ/2. Exotic ⋆ example: both Tor₀=k but X⋆k=k²; the signature correctly concludes only balance. | None |

The one-tactic probe found **no padding among the nine theorems**. The available first-quadrant total-comparison lemmas have different index shapes and do not give the integer half-plane statements in one application. The two right-derived APIs are separate constructions; their functorial comparison is not their defining equation. Acyclic complexes of acyclic objects need not be complexes of injective objects. The composition criterion is stronger than constructing the comparison, and the Tor file explicitly leaves balance to future work. The two real definitions are used by these headlines.

### Headline coverage

| README headline | Acceptance disposition |
|---|---|
| 1.1–1.3 product total, integer double-complex sequences, canonical convergence | Named as unavailable in the module docstring; product total and base convergence carriers are missing |
| 1.4–1.5 sum-total comparison and assembly, finite and half-plane versions | Four signatures present |
| 1.4–1.5 product-total comparison and assembly | Named in docstring with missing product-total/tower contracts |
| 2.1 object horseshoe | Signature present |
| 2.1 complex horseshoe and relative horseshoe | Native carriers suffice; R01 |
| 2.2 agreement of derived APIs and Leray computation | Signatures present |
| 2.3 Cartan–Eilenberg existence/lifting | Named with missing Cartan–Eilenberg carrier |
| 2.4–2.6 hypercohomology and dual sequences | Named with missing filtration/convergence interfaces |
| 3.1 composition criterion | Signature present |
| 3.2–3.4 complex composite sequences, low degrees, variance | Named with missing spectral-sequence/convergence interfaces |
| 4.1 Tor balance | Signature present |
| 4.2–4.4 universal-coefficient, Künneth and change-of-rings sequences | Named with missing spectral-sequence/convergence interfaces |
| 5.1–5.3 products and their compatibility with abutments | Named with missing bigraded exact-couple/convergence interfaces |
| 6.1–6.2 Bockstein construction, higher differentials and limit | Named with missing exact-couple and limit-page interfaces |

### Computed README statement register

Here C denotes the relevant abelian category, not a freestanding scalar placeholder. Every use of a module example is within ModuleCat at matching universe sizes. In the tables, “none” means the stated hypothesis survived the displayed tests, not that those tests prove the general theorem. Auxiliary notation for repeatedly used complexes:

- U is the commuting integral unit square. Its total is ℤ→ℤ²→ℤ with maps (1,1) and (−1,1).
- T is the staircase of §1.1, with diagonal entries Dₚ=ℤ and off-diagonal entries Oₚ=ℤ, p≥0. Its total differential is yₚ=xₚ−(−1)ᵖxₚ₊₁.
- T′ is the dual staircase of §1.5. Its differential is yₚ=(−1)ᵖxₚ+xₚ₋₁, x₋₁=0.
- P is ℤ→×2ℤ in cohomological degrees −1,0; Q is the same map in degrees 0,1. Thus H⁰(P)=H¹(Q)=ℤ/2 and their other cohomology vanishes.

| Statement/convention; README location | Instances and computed values on the two sides | Result/change |
|---|---|---|
| Native/classical index conversion; 133–150 | Classical (p,q)=(0,0),(1,0) become native (1,−1),(3,−2), native page 2 for classical page 1; total degrees 0,1 on both sides. Q has d₁=+2. | None |
| Commuting bicomplex and total sign; 151–165 | U: d¹d⁰=−1+1=0; unsigned total gives 1+1=2. A vertical ×2 in column 1 becomes −2. | None |
| Flip and row convention; 151–165 | Flip multipliers at (1,0),(1,1) are +1,−1; conjugating vertical −2 gives +2 on the second sequence. | None |
| Opposite/degree reversal; 167–178 | P becomes a complex in degrees 0,1 in the opposite category; H⁰=(ℤ/2)ᵒᵖ, H¹=0. Without reversal the nonzero degree is wrong. | None |
| Right acyclicity, additive versus left exact; 179–188 | Hom(ℤ/2,−) on ℚ/ℤ: positive H=0 but H⁰=ℤ/2; on ℤ: H¹=ℤ/2. Tensor ℤ/2 has RF(ℤ)=0 but F(ℤ)=ℤ/2. | None |
| Tor/Ext degree and variance; 189–201 | P⊗ℤ/2 is ℤ/2→0ℤ/2: H⁻¹=H⁰=ℤ/2; Hom(P,ℤ) has H¹=ℤ/2. | None |
| 1.1 sum/product total definitions, κ; 573–596 | T: product kernel generated by (1,1,−1,−1,…); sum kernel=0. Product and sum cokernels=0. Hence H⁰ product=ℤ versus H⁰ sum=0; κ is not a quasi-isomorphism. | None |
| 1.1 finite antidiagonal identification | U: both totals have terms ℤ,ℤ²,ℤ with the same two maps; κ=id in these coordinates. Zero K gives 0→0. | None |
| 1.1 flip and functoriality | U flip sends middle (a,b) to (b,a), degree 2 to its negative; resulting composite differentials agree. For f=id, total(f)=id on each factor/summand. | None |
| 1.2 filtrations and associated graded; 613–637 | Vertical ×2 in column p=1: gr¹ has differential −2, the differential on column[−1]; d²=0 on both. Column 0 alone has F⁰=K,F¹=0. | None |
| 1.2 first E₁,E₂ and d₁ | Q horizontal: E₁^{0,0}=E₁^{1,0}=ℤ, d₁=2, E₂^{0,0}=0,E₂^{1,0}=ℤ/2, equal to horizontal cohomology of vertical cohomology. | None |
| 1.2 second E₁,E₂, row sign | Vertical ×2 in column 1: second d₁=+2 after the flip, while literal row filtration gives −2. Both have cokernel ℤ/2; the signed maps distinguish conventions. | None |
| 1.2 exact-column vanishing and anticommution adapter | Exact columns give H(column)=0, hence E₁=0. For U, replacing d₂ by (−1)ᵖd₂ gives d₁d₂+d₂d₁=−1+1=0. | None |
| 1.2 κ on pages versus totals | T: both first E₁ pages have ℤ only at (0,0), so every page map is id there; total H⁰ map is 0→ℤ. | None |
| 1.2 canonical E∞ presentation; 663–686 | Infinite-dimensional example V=⊕k: E∞=ky₀⊕V, sum H⁰=ky₀⊕V with identity presentation; product H⁰=V with presentation projection, kernel ky₀. Abstract ky₀⊕V≅V does not invert this projection. | None |
| 1.3 finite diagonal strong convergence | Q: E∞^{1,0}=ℤ/2, F¹H¹=ℤ/2,F²H¹=0; both filtrations finite and associated graded equals E∞. Zero K gives every graded piece 0. | None |
| 1.3 sum upper-half-plane criterion | T satisfies the row upper bound, and its second sequence abuts to 0; its first sequence has E∞^{0,0}=ℤ, so the unsupported column criterion would be false. | None |
| 1.3 product lower-half-plane plus regularity | T has columns p≥0 and stationary first sequence, giving product H⁰=ℤ. T′ has exact columns, regular zero E₁, and product H=0. | None |
| 1.3 stabilization and Serre transfer | For Q, degree n=1 sees two columns and stabilization by page 2; E₂ diagonal and H¹ both ℤ/2. Horizontal ℚ→ℚ/ℤ has initial degree-zero term ℚ but H⁰=ℤ, rejecting transfer from an unstabilized single diagonal in the weak Serre class of ℚ-vector spaces. | None |
| 1.4 finite and half-plane comparison | id_Q induces id on ℤ/2. T→column₀ is columnwise quasi-iso; product H⁰ map ℤ→ℤ is id, but sum map 0→ℤ is not. The different support hypotheses select the correct total. | None |
| 1.4 comparison naturality | f=id gives E_r(f)=id and H(total f)=id; on Q the only nonzero abutment is ℤ/2, and both comparison composites are its identity. | None |
| 1.5 exact rows/columns imply acyclic total under support conditions | U gives H=0. T′ has exact columns and product H=0, but sum H¹=ℤ (cokernel detected by coefficients 1,−1,−1,1,…); its sum-support hypothesis fails. | None |
| 1.5 augmented resolution/co-resolution total maps | Horizontal 0→M→id M→0, M=ℤ, gives H⁰ map id:ℤ→ℤ. Its dual augmentation has the same map. For a zero augmentation all groups and maps are 0. | None |
| 1.5 exact rows duality and functoriality | Horizontal identity complex has row cohomology=0 and total cohomology=0. Flip of U has the same zero cohomology, with middle-coordinate swap and final sign −1. | None |
| 2.1(a) object horseshoe | Non-split extension 0→ℤ→×2ℤ→ℤ/2→0: correct middle H⁰=ℤ versus untwisted ℤ⊕ℤ/2. Split extension gives I₂=I₁⊕I₃ and projection∘inclusion=0. | None |
| 2.1(a′) complex horseshoe and lower bound | A=ℤ[0], B=ℤ²[0], C=ℤ[0], split: take I₂=I₁⊕I₃; negative terms remain 0 and H⁰ sequence is 0→ℤ→ℤ²→ℤ→0. | R01: missing signature |
| 2.1(b) prescribed relative lifts | h⁰=id,h¹=0: source d=(2u,2v), target d=(2u−2v,2v); μ⁰(u,v)=(u+v,v), μ¹=id gives d_target μ⁰=μ¹d_source. Identity fails by (−2v,0). Constant h=id makes d agree but changes augmentation by (ε₃c,0)≠0. | R01: missing signature |
| 2.1 projective dual and finite-length comparison | Projective resolution ℤ→×2ℤ of ℤ/2: the split sum has the same length 1=max(1,1), H₀=(ℤ/2)², H₁=0. No claim of enough injectives is imposed on given object resolutions. | None |
| 2.2 definition RF and classical comparison (i), computation (ii) | Hom(ℤ/2,−) of ℚ→ℚ/ℤ is 0→ℤ/2; both derived APIs have R⁰(ℤ)=0,R¹(ℤ)=ℤ/2. Tensor ℤ/2 sends both terms to 0, so both APIs give 0. | None |
| 2.2(iii) truncation, R⁰ and left exactness | For exact id, R⁰(A)=A and Rⁿ(A)=0 for n>0. Tensor ℤ/2 gives R⁰(ℤ)=0≠ℤ/2; it is excluded from R⁰=F. The zero complex has all truncation comparisons 0≅0. | None |
| 2.2(iv) connecting maps and naturality | Apply Hom(ℤ/2,−) to 0→ℤ→×2ℤ→ℤ/2→0: connecting map Hom(ℤ/2,ℤ/2)→Ext¹(ℤ/2,ℤ) is id on ℤ/2; the adjacent multiplication-by-2 maps are 0. τ=2id gives 0 on both sides of the comparison square. | None |
| 2.2(v) Leray and acyclic objects | ℚ and ℚ/ℤ are injective, so positive derived groups vanish and their two-term complex computes R¹=ℤ/2. Tensor ℤ/2 on ℤ[0] gives a noninvertible unit ℤ/2→0 despite positive acyclicity, demonstrating the left exactness hypothesis. | None |
| 2.2 acyclicity under sums/summands and exact functors | For Hom(ℤ/2,−), (ℚ/ℤ)² and both summands have Rⁱ=0 for i>0; each summand has R⁰=ℤ/2. For id all objects have positive derived groups 0. | None |
| 2.3 CE definition: columns, cycles, boundaries, cohomology | K=A[0]: cycle/cohomology columns resolve A and boundary column resolves 0. K=0: every required resolution is 0. K=A→id A: cycles in degree 0=0, boundaries in degree 1=A, cohomology=0. | None |
| 2.3 CE existence; split rows | Naive columns ℚ→ℚ/ℤ for Q have horizontal H¹=0 in both rows, while H¹(Q)=ℤ/2; not CE. Correct CE resolves this ℤ/2 rather than 0. | None |
| 2.3 total injective resolution and lifting | For A[0], total of its one CE column is I(A), H⁰=A,Hⁱ=0 for i>0. For id_A, comparison is id_I; a zero source lifts to the zero map. | None |
| 2.4 first hypercohomology, E₁/E₂, convergence | Q and Hom(ℤ/2,−): E₁ at (0,1),(1,1) is ℤ/2, d₁=×2=0; abutment H¹=H²=ℤ/2. A[0] leaves only column 0, E₁^{0,q}=R^qF(A). | None |
| 2.4 acyclic-term collapse and naturality | L=(ℚ→ℚ/ℤ), F=Hom(ℤ/2,−): only row q=0 remains, with horizontal cohomology ℤ/2 in degree 1, equal to RF(ℤ). Identity map induces id on this ℤ/2. | None |
| 2.5 second hypercohomology and CE necessity | For Q, E₂^{0,1}=E₂^{1,1}=ℤ/2, total degrees 1,2. For identity F and naive columns, the actual class is at (1,0), but R^pF(H^qQ) puts it at (0,1); both total groups are ℤ/2. | None |
| 2.5 independence from page 2; acyclic variant | A[0] has only row q=0 with E₂^{p,0}=R^pF(A); replacing an injective resolution by itself gives id at every surviving entry. For exact F=id, E₂^{0,q}=H^q(A), other columns 0. | None |
| 2.6 left-derived/opposite identification | P⊗ℤ/2: differential 0, L₀=L₁=ℤ/2. Incorrectly using K^p instead of K^(−p) moves the nonzero term from homological degree 1 to −1. | None |
| 2.6 projective CE, two dual sequences, contravariance | Resolve ℤ/2 by P: first page terms ℤ/2 in positions (0,0),(1,0); second-page Tor₀=Tor₁=ℤ/2. Exact id has higher L=0; Hom(P,ℤ) has Ext¹=ℤ/2. | None |
| 3.1 comparison transformation and unit characterization | G=id gives RF→RF with identity unit compatibility. F=G=Hom(ℤ/2,−) at ℚ/ℤ has degree 1 source 0,target ℤ/2, so the constructed transformation need not be invertible. | None |
| 3.1 equivalence with injective images and enough acyclic embeddings | Same Hom pair gives false⇔false. F=id gives true⇔true, since an injective embeds in itself and its higher derived G groups vanish. A proposed acyclic embedding criterion cannot admit the first pair. | None |
| 3.1 exact left adjoints, and no exactness needed for F | Coextension along a ring map has exact restriction as left adjoint; for identity ring map it is id and positive derived groups on injectives are 0. F=tensor ℤ/2,G=id has both sides RF(ℤ)=0 despite F(ℤ)=ℤ/2. | None |
| 3.2 complex composite spectral sequence | Coextension ℤ/4→ℤ/2, A=ℤ/2, G=id: all E₂^{0,q}=ℤ/2, others 0; periodic ×2 injective resolution becomes differential 0, giving abutment ℤ/2 in each n≥0. | None |
| 3.2 exact-functor collapses, acyclicity needed | Exact F kills q>0; exact G kills p>0. Bad Hom pair at ℚ/ℤ would leave E₂^{1,0}=ℤ/2, whereas actual R¹(GF)=0, so it fails the required hypothesis. | None |
| 3.3 five-term sequence and edges | Coextension example: 0→0→ℤ/2→idℤ/2→0→ℤ/2 is exact at every asserted interior term; no surjectivity onto the final ℤ/2 is asserted. | None |
| 3.3 vanishing range and transformations | For exact F=id, R^jG(F(A))=R^j(GF)(A), e.g. j=1,G=Hom(ℤ/2,−),A=ℤ gives ℤ/2=ℤ/2. Identity transformations give identity on both sides. | None |
| 3.4 right-exact composite and reversed low degrees | Tensor over an identity ring map: only q=0 remains, L_p(GF)=L_pG; for G=tensor ℤ/2,A=ℤ/2, p=0,1 both give ℤ/2. | None |
| 3.4 mixed-variance composite | ℤ→ℤ/2, then Hom over ℤ/2: E₂^{0,0}=E₂^{0,1}=ℤ/2, abutment Ext⁰_ℤ=Ext¹_ℤ=ℤ/2. Replacing G by Hom_ℤ(−,ℤ) gives composite 0 but candidate E₂^{1,0}=ℤ/2; its acyclicity hypothesis fails. | None |
| 4.1 balance for all n including 0 | ℤ/4,ℤ/6: both Tor₁ kernels have two elements and both Tor₀ cokernels are ℤ/2. At n≥2 both vanish. | None |
| 4.1 projective tensor exactness versus right exactness generally | R=𝔽₂[x,y]/(x²,y²), X=R/(xy), ⋆=D(D−⊗D−): Tor₀=Tor′₀=k, but X⋆k=soc X=kx⊕ky. The map soc R→soc X is zero, so general right exactness fails as stated. | None |
| 4.1 projective/length-one vanishing and existing Ext balance | X=ℤ/2⊕ℤ,M=ℤ/2: Tor₁=ker(0:ℤ/2→(ℤ/2)²)=ℤ/2, Tor₀=(ℤ/2)². Projective X=ℤ has Tor₁=0. Projective and injective computations of Ext¹(ℤ/2,ℤ) both give ℤ/2. | None |
| 4.2(a) unbounded universal-coefficient sequence | K=⊕_{j∈ℤ}ℤ/2[j],M=ℤ/2: tensor term and Tor₁ term are each ℤ/2 in every total degree; Hⁿ=(ℤ/2)². For P,M=ℤ/2,n=−1: tensor term 0,Tor₁(H⁰P,M)=ℤ/2. | None |
| 4.2(b) covariant Ext sequence | K=ℤ/2[0],M=ℤ/2: E₂^{p,0}=Ext^p(ℤ/2,ℤ/2), equal to ℤ/2 for p=0,1 and 0 afterwards; these are H^p(RHom(M,K)). | None |
| 4.2(c) contravariant Ext and hereditary edges | P,M=ℤ: H¹Hom(P,ℤ)=ℤ/2, Ext¹(H⁰P,ℤ)=ℤ/2, Hom(H⁻¹P,ℤ)=0. Injective M=ℚ/ℤ kills Ext¹ and gives Hom(ℤ/2,ℚ/ℤ)=ℤ/2 in degree 0. | None |
| 4.2 bounded finite-free comparisons | P⊗ℤ/2 has H⁻¹=ℤ/2, whereas Tor₁(H⁻¹P,ℤ/2)=0: n+1 in the actual formula is essential. Hom(P,ℤ) gives the corresponding n=1 Ext value ℤ/2. | None |
| 4.3 Künneth spectral sequence and no hereditary shortcut | ℤ/2[0] twice gives H⁻¹=H⁰=ℤ/2. Over k[ε]/ε², k[0] twice gives Tor_n=k for every n≥0, hence H^(−n)=k; it is not a two-column sequence. | None |
| 4.3 split-complex formula and edge product | K=L=ℤ[0]: only Tor₀=ℤ and cross product 1⊗1↦1. With K=ℤ[0], arbitrary L gives E₂^{0,q}=H^qL. With L=M[0], the displayed Tor page is exactly that of 4.2(a). | None |
| 4.3 flat-model identification and hereditary short exact sequence | P⊗P has d⁻²(1)=(−2,2), d⁻¹(a,b)=2a+2b; H⁻²=0,H⁻¹=ℤ/2,H⁰=ℤ/2. In degree −1 the tensor term is 0 and the Tor term with i+j=0 is ℤ/2; i+j=−1 would wrongly give 0. | None |
| 4.4(a) change-of-rings Tor | ℤ→ℤ/4, M=N=ℤ/2: E²_{p,0}=E²_{p,1}=ℤ/2 for all p≥0; d²_{p,0} is iso to E²_{p−2,1} for p≥2; E∞ leaves exactly total degrees 0,1, both ℤ/2. | None |
| 4.4(b) coextension Ext; (c) mixed Ext | ℤ/4→ℤ/2 gives E₂^{0,q}=ℤ/2 for all q≥0. ℤ→ℤ/2 mixed case gives E₂^{0,q}=ℤ/2 only q=0,1. These match Ext over the respective source rings. Identity ring map collapses the derived scalar-change direction to degree 0. | None |
| 5.1 pairing and μₙ definition | Zero pairing: c=0 gives both equations 0=0. Bockstein of ℤ: iⁿa=0 forces a=0; again c=0 works. For stupid Q and degree-zero-only multiplication: d(1·1)=2 versus d1·1+1·d1=0, so μ₀ fails. | None |
| 5.1 μ₀⇔Leibniz, positive index shift, all-page inheritance | Bockstein of ℤ→×4ℤ modulo 2: d₁=0, hence μ₀ true; k1=2=i1 but any lifting c odd has jc=1 versus required 0, hence μ₁ false. Derived μ₀ is false since d₂1=1; m=0 equivalence is false⇔false. | None |
| 5.1 naturality and tensor-complex interpretation | Identity couple maps give xy↦xy on each page. In the proposed integral DGA Check, x=y=u gives signed RHS vu−uv=0, unsigned RHS 2uv≠0, and d(u²)=0. | R02 |
| 5.2 filtered pairing, E₁ and differential | Over 𝔽₂, xy^p↦y^(p+1), y^p↦0. Thus E₂=𝔽₂ in (0,0), and d₁(xy)=y²=d₁(x)y+xd₁(y). Both signs yield the same answer in this field. | R02 |
| 5.2 canonical limit product and naturality | Trivial filtration gives E₁=H(A), d_r=0, and limit product equal to its cohomology product. For zero complexes all maps 0. Identity filtered maps yield identity on each product. These tests alone do not determine the odd sign. | R02 |
| 5.3 double pairing differential rules | On a tensor of DGAs, interchange contributes (−1)^(q p′). At q=p′=1 it is −1; exterior generators satisfy (1⊗ε)(ε⊗1)=−ε⊗ε, whereas the reverse product is +ε⊗ε. | None |
| 5.3 vertical rule, total pairing and flip | At p′=1, d₂ on the first input contributes −d₂x·y; the total vertical sign (−1)^(p+p′) times this is (−1)^p d₂x·y, as required. Flip factors differ by (−1)^(pq′+p′q), equal to −1 at p=1,q′=1,p′=q=0. | None |
| 5.3 no unital/associative overclaim | One-column case reduces to a DGA. Degree-zero algebra e²=f, fe=e, ef=f²=0 has (ee)e=e versus e(ee)=0; a pairing exists without associativity or a unit. | None |
| 6.1 exact couple, grading and filtered-localization comparison | For ℤ→×pℤ, termwise ×p is injective, H¹=ℤ/p, E₁⁰=E₁¹=ℤ/p, and lifting 1 gives d₁1=1. For ℤ[0], k=0 and every E_r=ℤ/p. | None |
| 6.1 exclusion of f-torsion terms and first Bockstein | M=ℤ/p[0], f=p: kernel(f)=M≠0, excluded. For ℤ→×p²ℤ modulo p, d₁=0 since p²/p=p reduces to 0. | None |
| 6.2 cycle/boundary towers and page UCT | For ℤ→×p^aℤ, H¹=ℤ/p^a. For r≤a, (p^(r−1)H¹)[p]=ℤ/p and p^(r−1)H¹/p^rH¹=ℤ/p, giving both E_r terms; for r>a both are 0. | None |
| 6.2 higher differential from lift modulo f^r | In that example d_r=0 for r<a and d_a=1, since p^a/p^a=1; E_{a+1}=0. In particular p=2,a=2 yields d₁=0,d₂=id. | None |
| 6.2 bounded torsion stabilization and no uniform assertion | Torsion exponent a gives page a+1=0. Direct sum over a≥1 gives E_r⁰=⊕_{a≥r}ℤ/p≠0 for every r but intersection of the surviving finite-support tails is 0, hence E∞=0. | None |
| 6.2 canonical convergence iff, separatedness criterion | ℤ→ℤ[1/p]: H¹=ℤ[1/p]/ℤ is p-divisible, with nonzero H¹[p]=ℤ/p; intersection p^rH¹∩H¹[p]=ℤ/p. E∞⁰=ℤ/p but localized H⁰=0, so the canonical map is not invertible. For ℤ[0], torsion is 0 and intersection p^sℤ=0, so both criteria hold. | None |
| 6.2 multiplicativity and prime-torsion interpretation | Free integral cohomology summand gives ℤ/p on every page, a ℤ/p summand is removed by d₁, and ℤ/p^a contributes two ℤ/p terms through page a with d_a=id. This agrees with the Hatcher interpretation and differs from a free ℤ page. | None |
| All module targets: zero ring, f=0, f unit | In the zero ring all modules and both sides of every displayed comparison are 0. If f=0 is termwise injective, M=0. If f is a unit, M/fM=0 and all pages are 0; localized filtration is constant, separated exactly when its abutment is 0. | None |

### Checks inventory and applicability

| Section | Check bullets read and evaluated | Distinguishing computations in the register |
|---|---:|---|
| 1.1 | 4 | Finite sum=product; staircase H⁰ 0 versus ℤ; column-0 total; zero total |
| 1.2 | 6 | ×2; row sign −2 versus +2; exact columns; anticommutation; staircase pages; noncanonical abstract isomorphism |
| 1.3 | 4 | Staircase; finite filtration; ℚ-vector-space countercontrol; zero |
| 1.4 | 3 | Staircase comparison; pinned first-quadrant comparison; identity |
| 1.5 | 4 | Staircase; dual staircase; horizontal identity; augmented resolution |
| 2.1 | 3 | Split extension; non-split integral extension; transported middle map and augmentation |
| 2.2 | 7 | Hom-derived calculation; exact functor; failure of R⁰=F; injective terms; acyclicity separation; failure without left exactness; naturality at 2id |
| 2.3 | 4 | A[0]; zero; bad column resolution; identity complex |
| 2.4 | 3 | Q; A[0]; acyclic terms |
| 2.5 | 3 | Q; A[0]; CE failure shifts (0,1) to (1,0) |
| 2.6 | 3 | Tor₁=ℤ/2; degree reversal; exact functor |
| 3.1 | 4 | Nonacyclic Hom pair; identity; coextension; additive non-left-exact F |
| 3.2 | 3 | Exact functors; failed acyclicity; periodic ℤ/4 example |
| 3.3 | 3 | Five terms; exact F; identity transformations |
| 3.4 | 3 | Mixed variance; exact projective-preserving F; bad Hom composite |
| 4.1 | 6 | Two kernels; degree zero; exotic ⋆; projective vanishing; two-term presentation; Ext comparison |
| 4.2 | 5 | Derived tensor; unbounded direct sum; contravariant indices; injective coefficient; bounded finite-free comparison |
| 4.3 | 6 | ℤ/2 tensor; dual numbers; unit; single coefficient; hereditary comparison; P⊗P |
| 4.4 | 4 | Nonzero d²; coextension; mixed Ext; identity ring map |
| 5.1 | 4 | Zero; Bockstein of ℤ; failure of μ₀; μ₁ index countercontrol |
| 5.2 | 3 | Nonzero characteristic-two differential; trivial filtration; zero; R02 replaces the last with an integral sign test |
| 5.3 | 4 | Vertical sign; graded commutativity; one column; nonassociative pairing |
| 6.1 | 4 | d₁=id; torsion-free single term; excluded torsion; d₁=0 for ×p² |
| 6.2 | 4 | d_a=id; unbounded exponents; divisible obstruction; integral torsion interpretation |

The nonzero calculations work at p=2 and p=3; the use of ℤ in the sign controls distinguishes these from characteristic two. Field coefficients kill positive Tor/Ext where a field is the base; the dual-number and ℤ/p² examples demonstrate why that simplification is not used over a nonreduced ring. The categorical statements are not statements about topological groups, schemes, fans or field extensions, so compactness, quasi-separatedness, inseparability and nonabelian group multiplication are not additional hidden hypotheses here. The integer indices avoid truncated natural subtraction. The only natural indices are page/resolution degrees and Tor degrees, whose zero cases appear above. There is no division by a scalar in the definitions; the higher-Bockstein notation denotes a lift through the monomorphism f^r, not division by an arbitrary ring element.

### Supplier and ownership audit

The library pins read were Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Searches were by objects as well as names: product totalizations, Cartan–Eilenberg resolutions, exact couples and Massey conditions, Bocksteins, Tor balance, horseshoes, right-derived comparison, and the actual acceptance namespace. The roadmap grep tool found no competing occurrence of the acceptance namespace or the two distinctive names `exists_rightDerivedFunctorPlus_homology_iso_rightDerived` and `nonempty_tor_iso_tor'` on main or at an open head. Local board-package searches and the provided open-head/overlap leads were also inspected. The related plans build particular first-quadrant, graded, geometric or completed instances; they do not supply the integer bicomplex/product-total/general functor interfaces owned here.

| Resolved citation | Read owner and retained boundary |
|---|---|
| StableHomotopyKTheory §7.22 | `TauCetiRoadmap/StableHomotopyKTheory/README.md:2618`: bigraded exact couples and derived couples, differential degree c+b−(r−1)a; the missing native spectral-sequence interface is explicitly a base gap |
| DerivedModuleAlgebra §S.1 | `TauCetiRoadmap/DerivedModuleAlgebra/README.md`, §S.1: first-quadrant sequence and low-degree consequences; anticommuting d″=(−1)^p d₂ agrees with the computed unit square |
| DerivedModuleAlgebra §0.2 | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:794`: derived tensor and bounded-above flat computation; used as the abutment, not redefined |
| ArithmeticGaloisDuality §D7.1, Derived composite spectral sequence | `TauCetiRoadmap/ArithmeticGaloisDuality/README.md`, §D7.1: object-valued composite spectral sequence with injective-to-acyclic hypothesis; the present complex form extends its input |
| ArithmeticStatisticsPartVIII §5.16, Tor spectral sequences over graded algebras | `TauCetiRoadmap/ArithmeticStatisticsPartVIII/README.md`, named subsection: graded, possibly noncommutative balanced tensor, both sequences and change of rings; the current ungraded monoidal carrier is different and the owner is acknowledged |
| KhovanovHomology §K5 | `TauCetiRoadmap/KhovanovHomology/README.md:537`: bounded finite-free integral UCT/Künneth and length-one balance; the checks reproduce these with n+1 in the Tor term |
| AlgebraicTopology §5.1 | `TauCetiRoadmap/AlgebraicTopology/README.md:1888`: singular-chain Künneth; it remains an application |
| DGFloer, Layer 1 item 2 | `TauCetiRoadmap/DGFloer/README.md` at the supplied revision, former-numbering map near line 160: explicitly maps the old multiplicative Serre item to AlgebraicTopology Stage 5.5. The old citation is preserved by the map, so this is not supplier drift |
| SchemeAndStackFoundations §2.2 | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4184`: Leray and Čech-to-cohomology, on their geometric carriers |
| SchemeAndStackFoundations §2.7 | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4433`: local-to-global Ext |
| SchemeAndStackFoundations §2.15 | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4913`: Hochschild–Serre for the specified covers |
| SchemeKTheoryOperations §6.7 | `TauCetiRoadmap/SchemeKTheoryOperations/README.md`, group hyperhomology target: nonnegative chain complex, first-quadrant resolution double complex, E¹=H_q(G,C_p), E²=H_p(G,H_qC), finite degreewise filtration |
| TopologicalSheafCohomology §1.4 | `TauCetiRoadmap/TopologicalSheafCohomology/README.md:164`: Čech/hypercohomology specialization; no generic CE carrier is reassigned |
| ArithmeticLocallySymmetricSpaces §ALS1.7 | `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md`, §ALS1.7: coefficient-change Tor specialization; used as an example, not as an upstream generic theorem |

There is no second copy of this roadmap on main. The overlap inventory reports no conflicting revision or unmapped dropped identifier. The scopes of the closest main/open matches, including DerivedModuleAlgebra, GrothendieckEulerForms, TopologicalSheafCohomology, EnhancedDerivedSheaves and SchemeKTheoryOperations, were compared with the objects owned here. The finite horseshoe already in Tau Ceti is explicitly consumed, and Ext balance remains a Check. No second owner was established for the general constructions left here.

Key pinned comparisons, including the assumptions that prevent apparent near-matches from discharging the targets:

| Pin location | What was checked |
|---|---|
| `Mathlib/Algebra/Homology/HomologicalBicomplex.lean:38,137,150,168`; `TotalComplex.lean:44,273,349`; `TotalComplexSymmetry.lean:113` | Commuting bicomplex, direct-sum antidiagonal total, flip, insertion/descent and flip sign; no product-total construction hidden in this API |
| `Mathlib/Algebra/Homology/DerivedCategory/RightDerivedFunctorPlus.lean:47,96,109,128,156` | Plus-derived functor, unit, unit invertibility on complexes of injectives, right-derived universal property, natural transformations |
| `Mathlib/CategoryTheory/Abelian/RightDerived.lean:110,214`; `LeftDerived.lean:109,359` | Classical computations and transformations; leftDerivedZeroIsoSelf requires finite-colimit preservation, absent from the exotic ⋆ example |
| `Mathlib/CategoryTheory/Preadditive/Injective/Resolution.lean:43`; `Mathlib/CategoryTheory/Abelian/Injective/Resolution.lean:95,170` | Native object resolutions and comparison up to homotopy; these are not the missing relative horseshoe with prescribed outer maps |
| `Mathlib/Algebra/Homology/HomotopyCategory/KInjective.lean:134`; `DerivedCategory/KInjective.lean:42`; `DerivedCategory/DerivabilityStructureInjectives.lean:61` | Strict boundedness, termwise injectivity, localization comparison, and injective resolution preserving an explicit lower bound |
| `Mathlib/CategoryTheory/Monoidal/Tor.lean:21,44,51,56,61` | Tor derives the second variable, Tor′ the first; projective vanishings exist; balancing is listed as missing |
| `Mathlib/CategoryTheory/Preadditive/Injective/Basic.lean:196,280` | Injective preservation by a right adjoint whose left adjoint is exact; no preservation under arbitrary additive functors asserted |
| `TauCeti/Algebra/Homology/TotalComplex.lean:580,596`; `SpectralSequence/Bicomplex.lean:410,442,446` | First-quadrant homological ℕ×ℕ statements; their shape and bounds differ from the four integer total theorems |
| `TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean:304,409,425`; `Filtered/FirstPage.lean:89`; `SpectralObject/SpectralSequenceMap.lean:230`; `SpectralSequence/Comparison.lean:32` | Native filtered construction, initial page and differential, naturality and later-page isomorphism; these do not supply E∞ convergence structures |
| `TauCeti/CategoryTheory/Exact/Injective.lean:165,426`; `Exact/Resolution/Horseshoe.lean:235` | One-step injective horseshoe and finite projective horseshoe; the iteration/unbounded relative forms are additional assertions |
| `TauCeti/Algebra/Homology/Monoidal/KFlat/Basic.lean:89,361`; `Monoidal/Homology/Kunneth/Sequence.lean:729`; `UniversalCoefficient/Basic.lean:180` | K-flat bounded-above complexes; hereditary/projective Künneth and UCT specializations. The README uses them with their projectivity/flatness assumptions |

The 19 gap slugs in `packages/SpectralSequencesAndConvergencePartII/design/plan.json` agree with the 19 “What SpectralSequencesAndConvergence must provide” entries in the README. Each names that supplier and a section. None has supplier `none`. Their clauses describe the data and laws of a single interface or the natural consequences of its theorem; they are not requests for unrelated constructions. The missing general carriers are not replaced by free predicates in Suggested.lean.

| Declared gap suffix; base section | Precision and boundary check |
|---|---|
| base-stabilisation-regularity; 1.3 | Leaving and entering differentials distinguished. T has every differential 0 from its nonzero E₁ entry, so stable-page maps are identities on ℤ |
| base-limit-page; 1.4 | Meets/joins conditional except under the stated countable hypotheses. A stationary ℤ entry has Z∞=ℤ,B∞=0,E∞=ℤ |
| base-bidegree-assignments; 2.1 | Native (2p+q+1,−p−1) gives filtration p and total p+q; Q yields (0,0) and (1,1) for (fil,deg) |
| base-bounded-below-regularity; 2.2 | Outgoing vanishing and finite neighboring support separated; Q has only columns 0,1, so all d_r for r≥2 vanish |
| base-decreasing-filtrations; 3.1 | A finite filtration F⁰=ℤ,F¹=0 has join ℤ, meet 0 and limit of quotients ℤ |
| base-convergence-structures; 3.2 | Weak, separated/exhaustive and complete conditions separated. Constant nonzero filtration has all graded pieces 0 but meet=H≠0 |
| base-converging-morphisms; 3.3 | Compatibility uses the chosen β, not existence of an unmarked isomorphism. Identity has β∘id=id∘β |
| base-finite-filtration-convergence; 3.4 | Finite filtration on ℤ/2 in Q has one nonzero quotient ℤ/2, equal to the abutment; zero quotients force zero object |
| base-comparison-theorem; 3.5 | Finite or strong/exact-colimit conditions retained; the abstract ky₀⊕V≅V example cannot replace canonical compatibility |
| base-first-quadrant-sequences; 3.6 | The five-term sequence ends with a map into H², not an asserted epimorphism onto H²; the coextension Check has final 0→ℤ/2 |
| base-einfty-comparison; 4.3 | Inclusion followed by projection, not automatic equality. The product example has projection ky₀⊕V→V with kernel ky₀ |
| base-induced-filtration; 5.2 | Canonical comparison explicitly requires both maps invertible; the same example gives an abstract isomorphism but a noninvertible canonical map |
| base-finite-filtered-convergence; 5.3 | Conditions imposed in three adjacent degrees. Q has finite filtrations in degrees 0,1,2 and abutment ℤ/2 in degree 1 |
| base-exhaustive-bounded-below-convergence; 5.4 | Exact sequential colimits and separate degree hypotheses retained. The sum/row filtration of T produces zero abutment, not its first-page ℤ |
| base-exact-couple-spectral-sequence; 6.1 | a=(−1,1),b=(0,0),c=(1,0) gives c+b−(r−1)a=(r,1−r) |
| base-exact-couple-towers; 6.2 | For Bockstein i=×p, im i^r=p^rH and ker i^r=H[p^r], matching the explicitly computed p^a example |
| base-filtered-exact-couple; 6.3 | D^{s,t}=H^{s+t}(F^sK), E=H(gr^sK); stupid Q gives d₁=+2 in the specified convention |
| base-tower-exact-categories; 7.2 | Separate from merely having products. A constant identity tower has lim=M, lim¹=0, with identity projections |
| base-complete-convergence; 7.5 | Regularity and lower E₁ support retained alongside completeness; the product T′ example has E₁=0 and total H=0 |

These are accepted conditional supplier contracts, not findings for absent current implementation. The proof routes use them in the direction base → Part II. Within Part II, the principal order is total filtrations → convergence/assembly → resolutions and hypercohomology → composites → applications, with exact-couple products feeding the Bockstein application. The alternate cone route in 1.4 can use 1.5, whose proof uses 1.3, not 1.4; it does not form a cycle.

The prescribed dependency check was run without changing the README or merge order. Its complete output was:

```text
depcheck: 242 roadmaps, 2195 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `git diff --stat origin/main...HEAD` reports six changed files, all inside this package: README, Suggested.lean, metadata, sources and the two pre-existing package reports; 2,393 insertions and eight deletions. The acceptance file has one `import Mathlib`, nine honest theorem `sorry`s, two real-bodied definitions, no `set_option`, no admitted data, no placeholder proposition and no `lemma` declaration. No computational algorithm or pull-request/process narrative was found in the README or Lean docstrings. The eleven own Lean names occur in the README.

### Source locators and wording

The following 29 groups collect the readable locators verified against the supplied legal extractions. A range can support several repeated citations. The four settled uncertified works are excluded from this verification count. Formula/hypothesis similarities forced by the mathematics were not treated as copied expression.

| Group | Locator verified | Comparison with the roadmap |
|---|---|---|
| L01 | stacks-012K line 2154–2164, Definition 18.3 | Commuting differential convention; the roadmap supplies its own signed witness |
| L02 | stacks-012K line 3131–3140, Definition 24.9 | Canonical convergence via the comparison, distinguished from an abstract E∞ isomorphism |
| L03 | stacks-012K line 3241–3315, §25, tags 0130–0133 | Finite-diagonal pages and convergence; literal row sign distinguished from flip convention |
| L04 | stacks-012K line 3347–3438, §26, tags 0E1P–0E1R | Product total and augmented exactness; the roadmap expressly excludes the additional unbounded-resolution results |
| L05 | stacks-05QI line 2872–2910, §16, Definition 16.2 | Derived cohomology on objects versus on complexes; additive functor formulation separated from left exactness |
| L06 | stacks-05QI line 2899–2951, §16, Lemmas 16.3–16.4 | R⁰ and right acyclicity; degree-zero vanishing is not part of acyclicity |
| L07 | stacks-05QI line 2952–3011, §16, Lemmas 16.6–16.7 | Source acyclicity uses the unit; the roadmap’s positive-cohomology predicate agrees with it for left exact F |
| L08 | stacks-05QI line 3269–3287, Lemma 18.4 | Bounded-below injectives receive only null-homotopic maps from acyclic complexes |
| L09 | stacks-05QI line 3301–3390, Lemmas 18.6–18.7 | Existence and homotopy uniqueness of lifts; used as steps, not mistaken for the entire relative horseshoe |
| L10 | stacks-05QI line 3402–3448, Lemma 18.9 and proof | Complex horseshoe; prescribed outer object resolutions are supplied by the iterative proof |
| L11 | stacks-05QI line 3449–3478, §19 | Projective duals and reversed indexing |
| L12 | stacks-05QI line 3617–3656, Definitions/Lemmas 21.1–21.2 | CE conditions include horizontal cycles, boundaries and cohomology, not only the columns |
| L13 | stacks-05QI line 3657–3695, Lemma 21.3 and Remark 21.4 | Two hypercohomology sequences and functoriality; the row-index misprint is listed below |
| L14 | stacks-05QI line 3696–3717, Lemma 22.1 | Canonical comparison and equivalence; roadmap allows additive F using the same injective argument and Grothendieck's formulation |
| L15 | stacks-05QI line 3718–3730, Lemma 22.2 | Sequence of a bounded-below derived object, with finite abutment filtration |
| L16 | grothendieck1957 line 1226–1235, II §2.4 (2.4.1) | Two bicomplex sequences; not copied as the roadmap's ordering |
| L17 | grothendieck1957 line 1236–1308, II §2.4 (2.4.2), construction and variants | Hyper-derived sequences and acyclic variant; the roadmap gives explicit carriers, bounds and comparison routes |
| L18 | grothendieck1957 line 1309–1337, Theorem 2.4.1 | Composition condition and sequence, including the additive first functor |
| L19 | grothendieck1957 line 1338–1360, Remarks 1–3 | Low degrees and exact-functor collapses |
| L20 | grothendieck1957 line 1506–1529, Proposition 2.5.4 | Ext specialization; the roadmap states the variance and boundedness rather than using an ambiguous hyper-Ext symbol |
| L21 | grothendieck1957 line 2421–2456 and 2493–2509, III §§3.7–3.8 | Leray and Čech examples retain their named roadmap owners |
| L22 | stacks-more-algebra line 7118–7140, §63, tags 061Y, 061Z, 068F | Tor/Ext universal-coefficient sequences and their degree directions |
| L23 | stacks-more-algebra line 7399–7422, Lemma 65.4/Example 65.5 | Künneth page and specialization; more general bounded-above construction has an explicit CE proof route |
| L24 | stacks-more-algebra line 8115–8127, §69, tags 0AVG–0AVI | Change-of-rings pages and variance |
| L25 | stacks-more-algebra line 12960–13014, §97 | Bockstein connecting map; roadmap states the sufficient termwise injectivity condition and fixes its sign by a lift |
| L26 | may-primer line 136–168, Example 2.3 | Bockstein pages/higher UCT; free-summand misprint is not imported |
| L27 | may-primer line 238–324, §4, Proposition 4.1, Corollary 4.2, Example 4.3 | Massey conditions, index shift and filtered pairings; the roadmap supplies a reverse-direction proof and positive-index countercontrol |
| L28 | hatcher-at line 8476–8479 and 13324–13337, Theorem 3.2 and Proposition 3E.3 | Integral UCT and Bockstein torsion interpretation, compared with the explicitly computed two-term complexes |
| L29 | douady1959 line 143–166, §II A | Spectral-system products are a different construction and expressly outside the package; the source omits the theorem's proof |

Five additional prose comparisons, from different parts of the package, supplement the locator comparisons:

| Package passage | Source compared | Result |
|---|---|---|
| README 638–649, first/second-page proof route | stacks-012K line 3241–3315 | The flip and native-index route is expressed through the package's own interfaces |
| README 897–914, corrected relative-lift proof route | stacks-05QI line 3301–3390 and 3436–3448 | Separate homotopy corrections and augmentation constraints; no copied source passage found |
| Suggested.lean 175–180, Leray docstring | stacks-05QI line 2990–3011 | Standard theorem/hypotheses, expressed as the actual native unit map |
| README 1204–1235, composition criterion and construction | grothendieck1957 line 1309–1337; stacks-05QI line 3696–3717 | Explicit unit/universal-property construction; no clause-by-clause prose reproduction found |
| README 1754–1791, higher Bockstein and convergence route | may-primer line 147–168 | General f, separate canonical-convergence and separation conditions, and explicit obstruction; no copied exposition found |

Counting source-id citation occurrences before the References section gives 88: stacks-05QI 16, grothendieck1957 15, stacks-012K 12, weibel1994 12, may-primer 11, stacks-more-algebra 7, cartan-eilenberg1956 6, mccleary2001 5, hatcher-at 2, douady1959 1, massey1954 1. This is an occurrence count, not a count of distinct theorem tags. The largest share is stacks-05QI, 16/88.

Its contents were read at stacks-05QI line 7–55. Relevant correspondences by number are §2.1↔§18, §2.2↔§16, §2.3↔§21, §§2.4–2.5↔§21, §2.6↔§19, §§3.1–3.2↔§22. These are reordered, split and combined, not a consecutive one-to-one run of the source. The other layers organize double-total convergence, tensor applications, pairings and Bocksteins around their own prerequisites. Needs lines 638, 722, 818, 1091, 1134 and 1270 force the construction → convergence → hypercohomology → composite sequence order. No source table, figure, exercise collection or numerical dataset was reused in the package. No declaration was identified as adapted from a non-pinned public formalization.

## Not verifiable

- `weibel1994`, `mccleary2001`, `cartan-eilenberg1956` and `massey1954` remain **uncertified**, exactly as settled in sources.toml. Their chapter/theorem locators and wording could not be checked against readable texts. They were not requested again and no new missing-reference request was created.
- `grothendieck1957` and `douady1959` were checked through the supplied OCR extractions. Degraded mathematical glyphs cannot certify the typeset original. I did not promote suspicious OCR inequalities to source errata. Douady's §II A theorem has no proof in that text; only its identity and scope were checked.
- No new Lean elaboration or proof build was run, as required by the read-only brief. The supplied elaborated signatures were used; all eleven real declaration types were compared. The proposed additional signatures in R01 and the mathematical replacement Check in R02 have not been elaborated.
- The base convergence contracts remain future supply. Their declared hypotheses, ownership, local uses and computed boundary examples were checked; this report does not certify their eventual proofs.
- Broad object/name searches and the nearest-owner comparisons do not amount to reading all 236 sibling roadmaps line by line. Ownership was checked against the supplied heads and named/nearby owners; no exhaustive claim about every mathematical synonym in unrelated packages is made.

## Source issues

- **Misprint** in may-primer at Example 2.3, printed page 4, line 162: the source says the page contributed by a free integral homology summand is ℤ; it should be ℤ/p on every page; affects nothing.
- **Misprint** in may-primer at Proposition 4.1, printed page 7, line 267–268: the source states the shift from μ_n to μ_(n−1) without a positive-index restriction; it should require n≥1; affects nothing.
- **Misprint** in stacks-05QI at Lemma 21.3 proof, printed page 74, line 3688–3689: the source uses horizontal cohomology degree p while describing the fixed-q second-page calculation; it should use horizontal degree q and resolve H^q(K); affects nothing.
- **Misprint** in stacks-05QI at Lemma 22.1 proof, printed page 74, line 3712–3713: the source evaluates the comparison at RF(I), an object of the intermediate category; it should evaluate at I[0] and then identify RF(I[0]) with F(I)[0]; affects nothing.

Source independence: 34 passage comparisons with 7 readable sources; no substantive copied wording or reused source artifact found. Largest share stacks-05QI, 16 of 88 citation occurrences; its contents were compared and the organization is independent. Wording against the four settled uncertified works remains untested.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "956602184f82d51a03c50d3bb91d52a26198bf20", "job": "RT-SpectralSequencesAndConvergencePartII~1a", "model": "gpt-6-astra", "worker": "chris-6"} -->
