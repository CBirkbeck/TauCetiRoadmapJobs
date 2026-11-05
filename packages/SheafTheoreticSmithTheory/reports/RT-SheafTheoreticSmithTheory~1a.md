<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1658#issuecomment-6426386938 -->
Red team round 1 pass a (codex) of 7d8ff96

Verdict: needs_changes

1. **F01** (P2) Equivariantization omits the unit condition

   **Location:** packages/SheafTheoreticSmithTheory/README.md:1363–1369, “objects with maps u_γ:γE→E satisfying the cocycle law”.

   **Claim:** These data define equivariantization and recover the original category for the trivial group (line 1379).

   **Witness:** Take Γ={1}, C=finite-dimensional k-vector spaces, E=k and u₁=0. The stated law reads 0=0∘0, but genuine descent requires u₁=id_k. The pair (k,0) is an additional, non-descent object.

   **Exact repair text:** “An equivariant object consists of E and isomorphisms u_γ:γE→E satisfying u₁ equal to the action's unit isomorphism and u_{γδ}=u_γ∘γ(u_δ), with the action's coherence inserted. Morphisms intertwine these isomorphisms.” Add the Check: “For the trivial action on k, u₁=0 satisfies the multiplication equation but fails the unit law; u₁=id_k is the unique permitted trivial-group structure.” This excludes the witness and gives the asserted trivial-group category.

2. **F02** (P2) The independent parity–tilting theorem unnecessarily excludes characteristic two

   **Location:** packages/SheafTheoreticSmithTheory/README.md:814, “For odd p good for the root system”.

   **Claim:** The good-prime parity–tilting theorem, which is constructed independently of cyclic base change in Layer 4, is only offered for odd primes.

   **Witness:** MR18 line 273, Corollary 1.6, assumes goodness, not oddness. For H=GL₂ and p=2, the minuscule Schubert P¹ has normalized parity sheaf k[1], perverse with a two-dimensional tilting Satake image.

   **Exact repair text:** Replace the opening with “For every prime p good for the root system of Ĥ (equivalently H), every normalized k- or O-parity sheaf on Gr_H is perverse.” In its first Check replace “odd good p” by “good p”, and add “For H=GL₂ and p=2, k[1] on the minuscule P¹ is perverse and its Satake image is the two-dimensional fundamental tilting module.” Retain oddness in the normalized cyclic Smith comparison, where p·dim and dim have different parity at p=2. The corrected independent theorem includes this witness without extending the cyclic normalization theorem.

   This is not a re-raising of the settled ownership finding F01. Repair F03 addressed the coefficient datum; the unnecessary restriction remaining in §4.5 is a different occurrence.

3. **F03** (P3) The second §0.3 source-line locator points to the wrong section

   **Location:** packages/SheafTheoreticSmithTheory/README.md:177, “Feng24, §4.2, p.20, Feng24 line 656”.

   **Claim:** Line 656 locates the cited §4.2 discussion.

   **Witness:** Feng24 line 656 is in §3.2 and introduces the equivariant bounded derived category. Section 4.2 starts at Feng24 line 876; its stratified-category discussion begins at line 888.

   **Exact repair text:** Replace the second occurrence with “Feng24, §4.2, p.20, Feng24 lines 876–891”. Retain the first §3.2 reference to line 656. Reopening these anchors gives the two distinct cited sections.

4. **F04** (P3) A norm-image Check asks for the theorem again

   **Location:** packages/SheafTheoreticSmithTheory/README.md:1434, “Use an ordinary source morphism f ... check the proposed square term by term”.

   **Claim:** This is a discriminating Check of §7.6.

   **Witness:** The Check leaves f arbitrary and says that proving all such cases is the integral norm-image theorem. Its positive assertion therefore repeats §7.6, without specifying an object, morphism, or computed value.

   **Exact repair text:** Replace that bullet with: “At p=3, on the weight-zero torus object O², take f=[[1,1],[0,1]]. In f^⊗³ the eight binary tensor words consist of two fixed words and two free three-element orbits. Smith kills the mixed orbits, and both F_T D(f) and I_k L D(f), in the corresponding two fixed-word bases, are [[1,1],[0,1]] over k.” The columns are (1,0) and (1,1): expanding (e₁+e₂)^⊗³ contributes the two pure words plus six killed mixed words. Keep the existing positive-index h negative control.

Four actionable findings follow. The previously settled intake-ownership finding is not re-raised.

## Verified sound

The following tables record computations, not proofs of the future sheaf theorems. A “passes” entry means the displayed instances agree with the stated target, subject to its named supplier contracts. In particular it does not certify the open naturality obligations in §§6.8 and 7.6.

### Computed README target register

In this table k=F̄₃, O=W(k), A=k[u]/u³, u=σ−1, unless another prime is specified. A Tate pair means (T⁰,T¹). C is [A —u→ A] in cohomological degrees 0 and 1. All numerical degrees use Hʲ(K[n])=Hʲ⁺ⁿ(K). Each row includes its hypotheses or context and the values compared; the section locates the numbered target in packages/SheafTheoreticSmithTheory/README.md.

| Target and context | Instances and computed values on the two sides | Result / change |
|---|---|---|
| §0.1 cyclic coefficients and good primes | Highest-root coefficients A₁:1 and G₂:3,2 give good(3)=yes/no respectively. At p=2, N=u in k[u]/u²; ker(u)=im(u)=ku, giving regular (0,0), trivial k (k,k), trivial O (k,0). | Passes; separates geometric and coefficient characteristics. |
| §0.2 admissible geometric actions | Scalar ζ-action on A¹ has fixed equation (ζ−1)x=0, hence x=0 even over dual numbers. On G_m, x↦x³ has derivative 3x² invertible in geometric characteristic ≠3; quotient degree=3. Trivial action fixes all Y; empty Y fixes ∅. | Passes; finite étale conclusion is confined to the free locus. |
| §0.3 geometric versus coefficient equivariance | A point gives D(A). A free three-point orbit with equivariant constant k has quotient stalk A of dimension 3; an independently trivial coefficient action instead gives k³ with N=0. ⊕ₙk[2n] has H⁻²ⁿ≠0 for all n, outside the common bounded interval. | Passes. |
| §0.4 flat/free cyclic modules | A and ⊕ℕA are free, with Tor₁=0; k=A/(u) has Tor₁ᴬ(k,k)=k and is not flat. The zero module has empty basis and Tor=0. | Passes; arbitrary rank uses the named supplier, not Mathlib's finite-module theorem. |
| §0.5 flat complexes | C has H⁰=ku² and H¹=A/uA=k; both cohomology modules have infinite projective dimension, but C⊗ᴸM is concentrated in [0,1] for every M. C maps to 0 in the quotient, while k does not. | Passes; flatness is a condition on the complex. |
| §0.6 Tor detection/resolutions | C has a two-term free representative, amplitude [0,1], and every stalk has the same interval. k has nonzero Tor in every nonnegative homological degree. On ⊔ₙpt, shifts k[n] have individual bounds but no uniform bound. | Passes; uniformity excludes the last family. |
| §1.1 sheaf Tate quotient | Regular A maps to 0; trivial k has pair (k,k), and O has pair (k,0), so neither unit is killed. Cone(id)=0 before and after quotient. | Passes; integral constructible/ind comparison remains a local target conditional on adic operations. |
| §1.2 periodicity, specified generator | Shifting O by 2 preserves pair (k,0); shifting by 1 gives (0,k). For C₃, replacing σ by σ² multiplies the normalized H² class by 2 although both H² dimensions are 1. At p=2 the two-period map still exists. | Passes; chosen-generator supplier has the required input. |
| §1.3 Tate cohomology sheaves | On two discrete points with constant k, each stalk pair is (k,k); sections are (k²,k²), and restriction is coordinate projection. For constant O the corresponding values are (k,0) and (k²,0). | Passes; cohomology sheaves are distinguished from their global sections. |
| §1.4 long exact sequence | In O —3→ O → k, multiplication by 3 induces 0 on T⁰=k, reduction induces id:k→k, and the connecting map T¹(k)→T²(O) is an isomorphism k→k. | Passes with the specified connecting-map convention. |
| §1.5 trivial action | For k⊕k[1], the even and odd groups both equal k², as does the graded tensor formula. For Oʳ, pairs are (kʳ,0), including r=0,1,2. | Passes; integral and mod-p units differ. |
| §1.6 stratified integral quotient | A constant rank-two O-system gives Tate rank two over k. Nontrivial monodromy is retained rather than replaced by a constant system. A point skyscraper on P¹ has ranks 1 at that point and 0 elsewhere and is not constructible for the single-stratum stratification. | Passes; fixed strata matter. |
| §2.1 support and ambient Tor bounds | RΓ_c(A¹,A)=A(−1)[−2], so degree 2 reaches 2d=2. For j:G_m→A¹, punctured-neighborhood cohomology has nonzero degrees 0 and 1 although the relative dimension of j is 0. | Passes; the two bounds cannot be identified. |
| §2.2 locally finite type compact supports | RΓ_c(⊔ℕpt,k)=⊕ℕk rather than ∏ℕk. For ⊔ₙAⁿ, H_c²ⁿ contains k(−n) for arbitrarily large n. Empty source gives 0. | Passes under the stated common fibre bound. |
| §2.3 free quotient flatness | The free orbit's quotient stalk is A, N(e₀)=e₀+e₁+e₂≠0, Tate pair (0,0). The wrong model k³ with trivial coefficient action has N=0 and pair (k³,k³). | Passes; geometric equivariance excludes the wrong model. |
| §2.4 nearby complex | At the scalar-action origin, C has H⁰=k and H¹=k(−1), but its quotient image is 0 because its two terms are free. Either cohomology module separately has nonzero Tate cohomology. | Passes. |
| §2.5 !/* comparison | For identity closed immersion the cone is 0. For 0↪A¹, i!k=k(−1)[−2] and i*k=k; the free-complex error vanishes only after the Tate quotient. | Passes; not an equality in the original derived category. |
| §2.6 Smith restriction | Trivial action gives T*; free action has empty fixed locus and gives 0. At a fixed point trivial k gives (k,k), regular A gives 0. | Passes. |
| §2.7 pushforward of flat objects | Free-orbit compact pushforward is A and becomes 0; identity pushforward sends A to A and k to k. Thus it preserves the flat kernel without killing all objects. | Passes. |
| §2.8 operations on the quotient | The unit survives: k⊗k=k. An induced object tensored with k is induced and becomes 0. On A¹, Γ(k) has degree 0 whereas Γ_c(k) has degree 2 and twist (−1). | Passes; * and ! are not conflated. |
| §2.9 Smith/compact-support comparison | For the free orbit, left and right sides are 0. For identity map on a fixed point, both sides send scalar 2 to multiplication by 2 on the same Tate object. | Passes on objects and displayed maps. |
| §2.10 localization | For a disjoint fixed point and a free orbit, compact cohomology is k⊕A, whose Tate pair is (k,k); fixed-locus compact cohomology is k with the same pair. Empty fixed locus gives (0,0). | Passes. |
| §3.1 modular Satake | Torus weights 1 and −1 convolve to 0, matching tensor weights 1+(−1). The PGL₂ minuscule P¹ maps to the two-dimensional SL₂ module. The integral unit O reduces to k on both sides. | Passes; arbitrary-field/W(k) construction is explicitly an extension target. |
| §3.2 standards and costandards | Δ(0)=∇(0)=k. In SL₂ at p=3, Δ(3),∇(3) both have rank 4 but opposite extension structures; they are not replaced by the rank-6 tilting T(3). | Passes; canonical map need not be an isomorphism. |
| §3.3 tiltings, integral lifts | SL₂ T(3) has rank 6, preserved by free integral reduction; Δ(3) has rank 4 and is not tilting. Zero is tilting but not indecomposable. For the trivial group O² splits as O⊕O. | Passes conditional on the explicit integral-tilting-lifts contract. |
| §3.4 tensor closure and characters | For SL₂ at p=3, V⊗V=T(2)⊕T(0), dimensions 4=3+1. A torus-equivariant matrix diag(1,2) need not commute with an upper-root operator. | Passes; character equality is only object classification. |
| §3.5 bounded derived generation | In the finite SL₂ ideal containing weight 3, a standard-to-tilting resolution has dimensions 4→6→2 (Δ(3)→T(3)→Δ(1)). Higher Ext between tiltings vanish; the zero object has the zero resolution. | Passes conditional on the finite-ideal supplier; does not use cyclic BC. |
| §4.1 JMW condition | A¹ with constant coefficients has H⁰=Λ and H^odd=0. P¹ has H⁰=H²=Λ and H^odd=0. An elliptic curve has H¹ of rank 2 and fails the condition. | Passes; odd vanishing has a negative control. |
| §4.2 parity and pariversity | On a one-dimensional stratum Λ[1] is in degree −1 and is dimension-pariversity even. O/p fails the free-cohomology condition. k⊕k[1] is parity but neither pure even nor pure odd. | Passes. |
| §4.3 indecomposable extension | End(O)=O is local; End(O²)=M₂(O) has nontrivial idempotents. O and O[1] have dense restrictions in different degrees, so uniqueness with fixed restriction does not identify them. | Passes. |
| §4.4 Grassmannian parity | Torus generator is Λ; minuscule P¹ generator is Λ[1]. Over geometric characteristic 5, Lψ(x³) on A¹ has dim H¹=2, versus 0 for constant k (coefficient p=3). | Passes; constant-stratum convention excludes the Artin–Schreier control. |
| §4.5 good-prime perversity | Minuscule k[1] on P¹ is perverse and has a two-dimensional fundamental tilting image at p=2 as well as 3. For G₂, coefficient 3 in the highest root makes p=3 bad. | R02: include the good prime 2 in this independent theorem. |
| §4.6 external products | On (P¹)ʳ, the external normalized generator restricts as O[r], dense rank 1; E⊕E has dense rank 2 and is decomposable. Empty product r=0 gives the unit; product with zero gives zero. | Passes with Koszul signs and integral-lift input. |
| §4.7 graded integral Tate Hom | For E=O[1] on P¹, End(T*E)=k[h]/(h²), indices 0 and 1, with h²=0. At a point only index 0 contributes k. | Passes; positive-index maps are not ordinary degree-zero maps. |
| §4.8 Tate parity | O gives (k,0), O[1] gives (0,k), A gives (0,0), and k gives (k,k). Thus a single nonzero parity component distinguishes integral unit from residue-field unit. | Passes. |
| §4.9 Tate indecomposables | k[h]/h² is local, hence T*(O[1] on P¹) is indecomposable. Its double has matrix endomorphisms and a nontrivial projector. Zero is not an indecomposable generator. | Passes. |
| §4.10 ordinary reduction | Hom(O,O)⊗k=k=Hom(k,k). For the augmentation ideal I⊂O[C₃], I^C₃=0 whereas (I/pI)^C₃=ku², dimension 1. | Passes; equivariant reduction is explicitly excluded. |
| §4.11 normalization | O is normalized on a point; O[1] and O[2] are not. Nevertheless T*O[2]≅T*O. Perverse normalized objects have negative ordinary Hom=0. | Passes; ordinary normalization is not recovered by choosing a Tate shift. |
| §4.12 lifting on maps | In k[h]/h², L(1)=1, L(h)=0, L(2)=2. Nonnegative indices ensure constant term of a product equals product of constant terms. | Passes; objectwise selection alone would not define this functor. |
| §5.1 fixed Grassmannian | In X³ with cyclic rotation the fixed functor is (x,x,x), including x over F[ε]/ε². Diagonal dimensions differ by 3d−d=2d; at p=2 and d=1 the difference is 1. | Passes; ordinary test rings retained, p=2 normalization differs. |
| §5.2 convolution norm | Nm(unit)=unit; a scalar α∈F₉ becomes α³=−α. Expanding a cube of a biproduct gives 8 words: 2 pure words and 6 mixed words. | Passes; norm itself is not additive. |
| §5.3 norm stalks | The 6 mixed binary words form two free C₃-orbits, giving induced summands. A three-cycle on three odd factors has sign (−1)²=+1; a two-cycle on two odd factors has sign −1. | Passes with oddness only where normalization needs it. |
| §5.4 Smith preserves induced parity | Trivial free O summand gives (k,0); induced summand gives (0,0). Dimensions 3 and 1 agree mod 2; dimensions 2 and 1 do not. | Passes; general induced pariversity and normalized odd-prime version are distinguished. |
| §5.5 additivity on morphisms | (f+g)³ has 2 pure terms and 6 mixed cyclic terms. The latter give transfers and vanish after Smith. Nm(3·id)=27·id has residue 0; Nm(2·id) has residue 2. | Passes; computation is after the quotient. |
| §5.6 Frobenius category | β³=β+1 and β⁹=β−1 in F₂₇; D(Fr⁻¹β)=β, while D(Frβ)=β−1. Zero is sent to zero. | Passes; distinguishes inverse from forward. |
| §5.7 prime-field form | Scalar 2∈F₃ stays 2; α∈F₉ goes to −α; β∈F₂₇ goes to β+1 under the form's Frobenius. | Passes; form-dependent, not an unmarked self-equivalence. |
| §5.8 linear BC | Before correction a scalar β becomes β+1; after source inverse Frobenius it is β. Zero gives zero; a biproduct has two output summands after the mixed words are killed. | Passes. |
| §6.1 hyperbolic localization | For a torus acting trivially, both hyperbolic functors are identity. The nonmonodromic diagonal line y=x in A² with weights (1,−1) yields one side k and the other k[−2], so the monodromy hypothesis matters. | Passes on the stated domain. |
| §6.2 extremal orbit | For GL₂, λ=(1,0), ν=(0,1) is the lowest weight: the extremal intersection is a point, dimension ⟨ρ,λ+ν⟩=0. Weight (2,−1) is outside and gives ∅. | Passes; sign pinned by the lowest weight. |
| §6.3 CT and Satake | Fundamental SL₂ weights ±1 acquire shifts +1 and −1 and yield weight vectors in perverse degree 0. Tensor square has weight multiplicities 1,2,1, matching convolution. | Passes. |
| §6.4 CT and Smith | For p=3, shift discrepancy is 2⟨2ρ,ν⟩, removed by the chosen periodicity. For p=2 it is ⟨2ρ,ν⟩ and may be odd. A nonfixed weight tuple has empty diagonal fixed locus. | Passes; p=2 not silently normalized. |
| §6.5 CT and lifting | The positive class h maps to 0 under L and to 0 after the compatible CT/lifting route; scalar 2 maps to 2 along either route. | Passes on the tested maps; theorem includes grading compatibility. |
| §6.6 torus BC | Weights (2,−1,4) sum to 5 on both sides. After linearization the matrix [[1,β],[0,2]] is unchanged entrywise; before it β becomes β+1. | Passes; both weights and maps tested. |
| §6.7 character comparison | SL₂ V⊗³ has weights 3,1,−1,−3 with multiplicities 1,3,3,1, dimension 8; T(3)⊕T(1) has the same character and dimension 6+2. | Passes as an object statement only. |
| §6.8 root-subgroup naturality | D=diag(1,2) commutes with the torus, but for U=[[1,1],[0,1]], DU=[[1,1],[0,2]] and UD=[[1,2],[0,2]]. | Passes as a required target: the proposed false implication is explicitly rejected. Full construction is not certified here. |
| §6.9 natural diagonal restriction | Torus example gives weight 5 and scalar β along both routes; SL₂ tensor-cube output has dimension 8. Character calculation alone does not produce the required intertwiner. | No additional defect; depends on §6.8. |
| §7.1 CT conservativity | Zero has CT=0. A nonzero object on an extremal minuscule stratum has a nonzero one-point extremal weight contribution of rank 1. | Passes; not a faithfulness assertion. |
| §7.2 exactness after mod-p Smith norm | For 0→k→k²→k→0, cube expansion has 2 pure terms and 6 mixed terms; the latter vanish after Smith, leaving the exact two-term split filtration. On torus weights an SL₂ length-two extension has dimensions 2→4→2. | Passes as an exactness test; integral exactness is not inferred. |
| §7.3 equivariantization | For Γ={1}, u₁=0 obeys 0=0∘0 but violates 0=id_k. For S₃, P₁₂P₂₃≠P₂₃P₁₂ and (P₁₂P₂₃)³=1. The stated profinite character is 1 on a dense subgroup and −1 elsewhere, hence discontinuous. | R01: add the unit/isomorphism requirements. Other two controls pass. |
| §7.4 arithmetic descent | For a cyclic cubic splitting the factor permutation has cube=id. Its coherent descent components must compose to id; a purely inseparable degree-3 extension has trivial automorphism group and is outside the cyclic Galois hypothesis. | Passes with the stated separable-closure convention and §6.8 input. |
| §7.5 objectwise integral comparison | For E=O[1] on P¹ the two reduced objects agree. For its positive Tate endomorphism h, coefficient reduction retains h≠0 while lifting gives 0. Ordinary scalar 2 gives 2 on both sides. | Passes; no all-Tate-map naturality claimed. |
| §7.6 norm-image naturality | Nm(2·id) reduces to 2³=2, and both comparison routes give 2. The arbitrary h of §7.5 is not asserted to be in this norm-image domain. | R04 concerns the first Check; no counterexample to the target found. Global norm-image naturality remains a proof obligation. |
| §8.1 algebra Tate diagonal | For σ=id on k[x], Tr=0 and Nm(a)=a³, so δ is Frobenius. On B³ with rotation, Tr is onto diagonal invariants, quotient=0. On k[ε]/ε², δ(ε)=0. At p=2, additive defect is Tr(aσ(b)). For length 4 with swap in F₂[x,y], Tr=0 and Nm(x+y)−Nm(x)−Nm(y)=(x+y)⁴≠0, excluded by primality. | Passes; zero ring and nonreduced source allowed. |
| §8.2 character extension | Extension is χ'(a)=Fr_κ⁻¹(χ(Nm(a))). For σ=id, S=k[x³], x³↦c extends by x↦c¹ᐟ³. For a rotating product no transfer-annihilating unital χ exists. With imperfect κ=F_p(t), x^p↦t has no extension because v_t(z^p) is divisible by p, but v_t(t)=1. | Passes; perfection has a concrete role. |
| §8.3 coefficient Frobenius | (aλ)^pμ=a^pλ^pμ verifies tensor balancing. For the F_p[x] form, linearization fixes scalars, sends x↦x^p, and kills ε in the square-zero example. At p=3, inverse correction returns β, forward correction returns β−1. | Passes; linearization is not identity on k[x]. |

### Bold worked examples and standing conventions

| Item | Computed comparison | Result |
|---|---|---|
| Cyclic coefficients/perfect nearby complex, line 1558 | ker(u)=ku², coker(u)=k; C has Tor interval [0,1] but quotient value 0, while its two cohomology modules have pair (k,k). | Passes. |
| Ordinary reduction/equivariant failure, line 1560 | If aN lies in augmentation ideal over O, 3a=0 forces a=0. Mod 3, invariants are ku²≠0. | Passes. |
| Object comparison on a map, line 1562 | End(T*O[1])=k⊕kh, h²=0; L(h)=0 versus reduction(h)=h. | Passes; discriminates objectwise from natural. |
| Torus weights/scalars/matrices, line 1564 | 2−1+4=5; β⁹=β−1; (β−1)³=β. Entrywise linearization fixes every matrix coefficient. | Passes. |
| Algebra diagonal/characters, line 1566 | k[x]:δ(x)=x³. k³: invariants=diagonal k and transfer image=diagonal k, quotient=0; its three coordinate characters form one free orbit, invariant-character set=∅. | Passes. |
| Shift and sign, lines 26–32 | O[1] has cohomology in degree −1; σ−1=u, 1−σ=−u, N=u² for C₃. Odd three-cycle sign=+1; odd transposition sign=−1. | Passes. |
| Coefficient versus geometric characteristic | For geometric characteristic 5 and coefficient 3, 3 is invertible geometrically but zero in k. In O, 3≠0 and O/3=k. | Passes. |
| Frobenius orientation, line 28 | β³=β+1, β⁹=β−1, β²⁷=β; α³=−α=Fr⁻¹α in F₉, so F₉ alone cannot distinguish directions. | Passes. |
| Bounds/universes, line 28 | Each k[n] separately is bounded, but the family has nonzero cohomology in all degrees −n; the common-interval requirement excludes it. Enlarging the object universe, not just Hom, permits the stated Ind category. | Passes; no arbitrary-size object is asserted to belong to a fixed small universe. |

### Lean declaration register and acceptance-test audit

Read all 79 lines and all six declarations. Compared each with the supplied elaborated signatures and its README §8.1/§8.2 statement; no section binder has disappeared. No fresh elaboration or Lean build was run, as required by the read-only brief. There are no section-variable blocks; each declaration carries its own binders. A and κ have independent universes. The four definitions have real bodies and are used by the two headlines.

| Declaration / line / README | Complete variable and instance context | Computed instances and values | Result |
|---|---|---|---|
| fixedSubring / 36 / §8.1 | {A : Type u}, [CommRing A], σ:A≃+*A | σ=id gives all A, including the zero ring; rotation on B³ gives exactly (b,b,b). Swap on k[x,y] includes x+y and excludes x. | Correct eqLocus specialization; retained to state headlines. |
| cyclicTransfer / 40 / §8.1 | {A}, [CommRing A], p:ℕ, σ, a:A; no primality or periodicity assumed | p=0 gives 0; p=1 gives a; p=2 gives a+σa. At p=3, σ=id in char 3 gives 0; rotation sends (b,0,0) to (b,b,b). | Correct total definition; invariance is used only under σ^p=1. |
| cyclicNorm / 44 / §8.1 | Same context as cyclicTransfer | p=0 gives 1, p=1 gives a, p=2 gives a·σa. At prime p and trivial action it gives a^p; ε^p=0 in the square-zero ring. | Correct; no claim that the p=0 definition gives a ring homomorphism. |
| transferIdeal / 49 / §8.1 | {A}, [CommRing A], p:ℕ, σ; ideal in fixedSubring σ | At p=0 span{0}=0. For σ=id,p=1, span(all A)=⊤. For σ=id,char p, ideal=0. For cyclic B^p, ideal=⊤ and quotient=0. | Correct; span agrees with transfer image under periodicity, since b·Tr(a)=Tr(ba) for fixed b. |
| algebra_tate_diagonal / 56 / §8.1 | p,[Fact p.Prime],{A},[CommRing A],hpA:(p:A)=0,σ,hσ:σ^p=1 | k[x] gives absolute Frobenius; cyclic B^p gives the unique map to the zero ring; square-zero ε maps to 0; p=2 mixed defect is one transfer. Empty-product p=0 countermodel is excluded. | True as typed. hpA deliberately admits the zero ring. Not one-tactic padding. |
| tate_character_extension / 67 / §8.2 | Previous p/A/σ hypotheses; {κ:Type v},[Field κ],[CharP κ p],[PerfectRing κ p]; S≤fixedSubring; every norm and transfer in S; unital χ:S→+*κ annihilates transfers | S=k[x^p], x^p↦c gives unique x↦c¹ᐟᵖ. Cyclic product and zero A have no admissible χ to nonzero κ. κ=F_p(t), x^p↦t has no root and is excluded by perfection. | True as typed. Uniqueness is not assumed; it follows from cyclic-character independence. Not one-tactic padding. |

For the first headline, expand Nm(a+b): each nonconstant binary word has a free prime-length cyclic orbit, whose sum is a transfer; the two constant words give Nm(a)+Nm(b). Multiplicativity and the unit are immediate, but additive descent is substantive. For the second, χ'(a)=Fr_κ⁻¹χ(Nm(a)) gives existence. Any extension has cyclic translates whose sum vanishes because χ kills transfers; independence of distinct multiplicative characters rules out an orbit of size p. Thus it is σ-invariant, and its p-th power on a is forced to be χ(Nm(a)). These arguments also explain why the small tests are not substitutes for either headline.

The README headlines are sheaf periodicity/relative Smith localization and uniform integral comparison (§§1–2), modular Satake and tilting generation (§3), good-prime parity–tilting and integral Tate Hom/lifting (§4), additive linear cyclic BC (§5), natural diagonal restriction (§6), exactness/Galois descent/norm-image naturality (§7), and the two algebraic headlines (§8). Suggested.lean names the unavailable carriers for every sheaf/categorical headline in its module docstring. No additional statable deep headline was found missing; the generic scalar-extension facts of §8.3 are not substitutes for one. No admitted data, placeholders, API-theorem padding, disallowed import, set_option, lemma declaration, or duplicate fully qualified declaration was found.

### Sources, suppliers, ownership and dependency checks

Counts: **6 Lean declarations read (4 definitions, 2 theorems); 65 numbered README targets read; 5 bold worked examples computed; all 65 Checks blocks, containing 193 bullet items, read and compared with their targets; 90 distinct explicit source-line anchors inspected across 9 works (85 non-Stacks anchors and 5 chapter-specific Stacks anchors); 12 supplier/ownership roadmap contracts checked; all 55 supplied sibling checkouts searched.** R03 concerns an incorrect second use of an otherwise existing anchor. Several Check bullets bundle multiple instances or repeat a previous computation; they were not counted as additional independent tests. R04 identifies an actual theorem-restatement Check. Definition tests were assessed by distinct instances, not by the number of bullets.

| Source | Locators inspected and boundary established |
|---|---|
| Feng24 | Notation line 317; §§3.1–3.4 lines 595–819; §§4.1–4.6 lines 849–1301; Proposition 5.12 proof lines 1732–1745; Definition 5.14, Lemma 5.15, Construction 5.17 lines 1863–1909; Appendix A lines 2575–2775. The package expressly strengthens uniform bounds and separates geometric/coefficient actions, ordinary/equivariant reduction, and objectwise/natural comparisons. Errors in the source are listed separately below. |
| LL21 | Corollary 4.5.2 line 624; Proposition 4.6.1 line 641 and its grading; §5.2 lines 879–896; Tate parity Definition 5.3.1 line 899; §§5.5–5.6, including Theorems 5.6.4 line 1072 and 5.6.6 line 1120. The topological hypotheses and negative-Hom condition are not silently replaced by arbitrary étale strata. |
| JMW14 | Local-system condition lines 199–212; Definitions 2.3–2.4 around line 228; Remark 2.7 line 298; Theorem 2.12 line 323; Proposition 2.39 and (2.13), lines 785–803. The reduction formula is ordinary Hom, not arbitrary coefficient-equivariant Hom. |
| JMW16 | Theorems 1.1–1.5 lines 24–80; Theorem 1.8 and prime bound; Appendix Theorems 5.1/5.3 lines 686–701. The field tensor theorem does not supply integral tilting lifts. The stronger numerical bound is not substituted for MR18 goodness. |
| MR18 | Theorem 1.1 line 105, Corollary 1.6 line 273, §6.5 lines 2734–2760. The exotic equivalence has shift [1]↔⟨−1⟩ and label λ↔−λ. Its good-prime corollary has no oddness condition, giving R02. |
| MV07 | Theorem 3.2 and extremal calculation starting line 356; Theorems 3.5–3.6 starting line 427; Propositions 6.3–6.4 lines 872–879; Proposition 11.1 line 1292; Theorem 12.1 line 1370; Proposition 13.1/Corollary 13.2 lines 1608–1625; Theorem 14.1 line 1647. The latter permits coefficients obtained by base change from Z_p where the sheaf category exists; it does not itself construct the package's enhanced W(k) comparisons. |
| Stacks | Algebra §10.101, line 11331, arbitrary-rank flat/free criterion with nilpotent maximal ideal; Cohomology on Sites Tags 08G1 and 0DJJ, lines 5207 and 5300, bounded flat representatives and common-interval stalk detection; More on Algebra Tag 0A5N line 8130, projective amplitude; Fields Tag 0CKL line 728, character independence. Different chapter extractions are distinguished under the one work key. |
| Braden03 | Theorem 1 line 45; contraction Lemma 6 line 175 and proof from line 274. Normality and weak-equivariance/triangulated-closure domains are retained; arbitrary support invariance is insufficient. |
| TV16 | Vector-space twist lines 207–210; §3.4 and (3.4.1), lines 512–532. The twist has inverse-Frobenius scalar action, and the character statement concerns invariant characters, not all characters. |

All texts used were the legally cached versions identified in sources.toml. The manifest distinguishes the arXiv versions from published pagination. No missing-text request was needed. No additional source was fetched or copied into the repository. Source pointers were treated as evidence, never as instructions.

| Supplier / current location | Contract resolved and ownership boundary |
|---|---|
| EnhancedDerivedSheaves §§0.1–0.4, E1.3–E1.4, E3.4, E5:abstract | Enhanced module sheaves, replacements, filtered colimits, coherent diagrams and stable quotient infrastructure exist at these targets. Generic quotient ownership is imported through that roadmap's existing suppliers. Section 0.4 constructs transformations; geometric equivalence hypotheses are still required. |
| EtaleCohomologyFoundations F.1–F.3, 0.8, 0.10, F.5–F.6 | Stalk/common-Tor detection, proper support, finite-coefficient operations and purity/duality are present. F.2's constructible finite-Tor projection formula alone is not an arbitrary-module theorem: the ambient support/enhancement extension is also needed. F.10.4's special free-torsor curve result is not the general Smith theorem. |
| EtaleDualityAndPerverseSheaves §§0.1–0.2, 2.2, 2.4–2.5, 3.1–3.2, 5.2, 7.3 | The cited noetherian extension, recollement, normalized finite-DVR systems, curve Euler–Poincaré/Swan target and tame fixed-subscheme target exist. Its supplier discussion also states the unbounded scheme-support lift and projection hypotheses. The new W(k) extension remains a declared contract, not an assertion that finite O_E coefficients already cover W(k). |
| SchemeAndStackFoundations §§0.23a, 1.17, 1.21, 1.23 | Topological invariance, quotient predicates/groupoid and projective gluing are present. Main lines 2643–2661 explicitly restrict the existing gluing theorem to the projective case; admissible nonprojective gluing is correctly a new contract. |
| ModularCurves Layer 0C | Main lines 345–366 supply free constant-group torsors with an invariant affine cover. This is the existing owner of the free-locus theorem; no new torsor construction is needed here. |
| DeformationAndDerivedPatchingAlgebra §7.5 | Infinite-rank local freeness over a local ring with nilpotent maximal ideal is present. It supplies the missing arbitrary-rank case of §0.4. |
| GlobalShtukasAndFunctionFieldLanglands §§1.1–1.3, 1.5, 1.8–1.9, 1.14 | Checked against the supplied sibling head: ordinary loop/BD geometry, fusion signs and finite-extension integral/torsion Satake are present. The curve/geometric-field extension is explicitly requested by the new gap; its O_E theorem is not represented as the W(k)-adic theorem. |
| GeometricSatakeAndFusion GS0, Equal-characteristic Schubert models and coefficient comparison | The named target constructs finite-dimensional schemes and Demazure maps before taking perfections. Its equal-characteristic test-algebra range is perfect F_q-algebras; the package does not use perfection as a substitute for the diagonal theorem on arbitrary test rings. |
| ReductiveGroups Layers 1, 4, 9, 10A–10B | Main supplies rational comodules, torus weights, pinned integral groups, Weyl/induced modules and dual conventions. Layer 10B fixes ∇ from the opposite Borel and Δ=∇(−w₀λ)*; package conventions agree. |
| ReductiveGroupsPartII RG2.0a, RG2.5.1–RG2.5.2 | The exact named targets for separable Weil splitting, dual group, pinned Galois action and dual products exist. The factor action is τ↦γτ, agreeing with the package's permutation descent. |
| LanglandsParameterStacks LP3.0 | The field-valued highest-weight/good-filtration and tensor theorem are present. Finite saturated ideals and integral highest-weight orders are separate, precisely stated new contracts. They are not supplied merely by naming LP3.0. |
| AInfCohomology AI.7.2 | The spectral lax-symmetric-monoidal Tate diagonal is present. Its spectrum-level source/target differ from the algebra invariant quotient and parity-map constructions here, so those are not duplicate ownership. |

Ownership was searched by objects (parity sheaves, integral Tate Hom, tilting categories, Frobenius twists, equivariantization, invariant/transfer quotients and Tate diagonals), using the roadmap grep tool, main/Completed, board packages and the supplied sibling trees. Matches for spectral Tate theory, perfectoid tilting and characteristic-zero highest-weight theory do not supply the package's modular rational tilting/parity carriers. The two new theorem names have no other fully qualified owner in the inspected Lean files. No later consumer was used as a supplier. The supplied sibling search includes the new equal-characteristic Satake head; revision-only results were not used to replace main.

At the pins, all 22 named native declarations in the supplier paragraphs were located. In particular:

- Mathlib/Algebra/Ring/Subring/Basic.lean:867 defines eqLocus by equality of the two images; no periodicity or characteristic is built into it.
- Mathlib/RingTheory/LocalRing/Module.lean:299 retains Module.Finite; it does not prove arbitrary-rank flat/free equivalence.
- Mathlib/RingTheory/WittVector/DiscreteValuationRing.lean:148 and Complete.lean:105,116 give precisely the perfect-field DVR, residue quotient and completion used here.
- Mathlib/FieldTheory/Perfect.lean:121 and Mathlib/LinearAlgebra/LinearIndependent/Basic.lean:502 supply Frobenius and character independence with their actual typeclasses.
- TauCeti/RepresentationTheory/Homological/TateCohomology/LowDegree.lean:151 is a module quotient. Periodic.lean:167,200,302,322,332 retains the selected generator. None of these is a sheaf Verdier-quotient theorem.
- TauCeti/AlgebraicGeometry/Quotient/FiniteGroup/Affine.lean:66,73 supplies affine finiteness with the explicit finite-type hypotheses, not unrestricted quotient gluing or flatness.

The five named external gaps have exactly matching slugs and needs text in design/plan.json and the README. Their scope is precise: W(k)-adic uniform operations, arbitrary-geometric-field Grassmannian geometry, finite highest-weight ideals, admissible quotient gluing, and integral tilting lifts. The existing suppliers provide special cases, not these extensions. Their multiple requested laws describe coherent interfaces rather than unrelated missing results. This review remains conditional on those contracts.

The original G1–G5 records still have no supplier fields and are not repeated verbatim as external README contracts. That is the ownership-ledger mismatch settled by **F01** in packages/SheafTheoreticSmithTheory/reports/FIX-PKG-SheafTheoreticSmithTheory~2.md: the allowed package edits do not reclassify accepted design obligations. Its reason is consistent with the permitted plan edits, so it is not re-raised. The mathematical pieces have explicit owners: G1 splits between the named adic gap and local §§1–2; G2 between the geometric-field/adic gaps and local §§3–6; G3 is §4.5; G4 is §7.6; G5 is §§6.8 and 7.4. This does not claim the intake ledger has been repaired.

The requested mechanical dependency check returned exit status 0 and exactly:

```text
depcheck: 56 roadmaps, 649 edges, 0 problem(s)
```

There were no UPWARD, CYCLE or moved lines. The local Needs graph proceeds forward; Layer 3 constructs its own weight functors and Layer 6 adds Smith comparisons, so that is not a cycle. The proof inputs of §§6.8 and 7.6 are expressly new theorem obligations rather than conclusions smuggled in as supplier facts.

The checked head is 7d8ff96. The read-only diff-stat against origin/main lists seven changed files, all inside packages/SheafTheoreticSmithTheory: README.md, Suggested.lean, design/plan.json, metadata.toml, two earlier reports, and sources.toml (2620 insertions). There is no out-of-folder package change. No computational algorithm, pull-request number/process narrative in the README or Lean docstrings, disallowed import or set_option was found. The filename sources.toml in the supplied unresolved-citation report is a manifest reference, not an absent Lean API.

## Not verifiable

- A full proof of the W(k)-adic extension, étale transport, exotic good-prime engine, root-equivariant natural comparison and norm-image naturality is not present in the package or the cited sources at the complete proposed generality. These are explicitly planned targets/contracts, not checked completed results. The computed tests above cannot certify them.
- The all-morphisms assertions in §§6.8 and 7.6 were tested on scalar/matrix maps and against their advertised negative controls. Those tests do not prove that every norm-generated image has index zero, or that every torus comparison lifts to an Ĥ-intertwiner. No such implication was used in this verdict.
- No new Lean elaboration was run because the brief prohibits builds. Binder checking used the supplied elaborated-signature record and direct reading of the unchanged file at 7d8ff96. No compilation claim beyond that evidence is made.
- The original G1–G5 intake classification is unresolved but settled for this package by the prior repair disposition described above.
- Ownership searches of the supplied open heads and indexed text are not a proof that no synonymous construction occurs anywhere in all unprovided work. No unavailable sibling was guessed or cited as a supplier. No source needed for this pass was inaccessible.

## Source issues

- **Misprint** in Feng24 at Example 3.4, printed page 14 (Feng24 line 643): the source says the four-term periodic complex is nullhomotopic; it should be acyclic, since the trivial module's augmentation does not split over the modular group ring; affects the proof.
- **Misprint** in Feng24 at Lemmas 3.6–3.7, printed pages 15–16 (Feng24 lines 679, 685): the source says the inputs are coefficient-equivariant complexes on the moving scheme; it should be geometrically equivariant complexes, whose free-orbit pushforward has the regular action; affects a stated result.
- **Misprint** in Feng24 at Corollary 3.11, printed page 16 (Feng24 line 721): the source says the pushforward lands in flat complexes on Y; it should be flat complexes on S; affects a stated result.
- **Error** in Feng24 at §4.1, printed page 19 (Feng24 lines 852–855): the source says all free local systems on positive-characteristic affine flag strata satisfy odd Ext vanishing; it should be a statement restricted to constant or the specified equivariant local systems; affects a stated result.
- **Misprint** in Feng24 at §4.2, printed page 20 (Feng24 line 886): the source says the JMW condition requires nonvanishing odd Ext; it should be vanishing odd Ext; affects nothing.
- **Gap** in Feng24 at proof of Lemma 4.14, printed page 24 (Feng24 lines 1066–1070): the source says passage to a perverse filtration reduces norm stalks to external products; it should be a reduction with a justified filtered norm model and free stalk/costalk graded pieces; affects the proof.
- **Error** in Feng24 at Lemma 4.16, printed page 26 (Feng24 lines 1126–1137): the source says normalized coefficient-equivariant parity reduction is fully faithful after scalar extension; it should be ordinary parity reduction, or an equivariant statement with additional Hom base-change hypotheses; affects a stated result.
- **Error** in Feng24 at Lemma 4.24, printed pages 29–30 (Feng24 lines 1297–1300): the source says the entire right Tate square commutes by descending the outer square; it should be restricted to norm-generated maps with a separate proof; the P¹ positive class survives reduction but lifting kills it; affects a stated result.
- **Gap** in Feng24 at §A.4 after Lemma A.2, printed page 60 (Feng24 lines 2701–2706): the source says faithful torus restriction and character classification establish the general natural comparison; it should be a proof that the chosen components intertwine root subgroups and are natural before using faithfulness; affects the proof.
- **Misprint** in Feng24 at §A.5, printed page 60 (Feng24 line 2735): the source says inverse Frobenius is postcomposed in the definition of BC; it should be inverse source Frobenius as in Definition 4.18, or an explicitly identified compatible target-side correction; affects nothing.
- **Error** in LL21 at Remark 3.5.4, printed page 11 (LL21 lines 485–487): the source says Ext¹ over F₂ of F₂ by itself is nonzero; it should be zero, since vector-space extensions split, so this cannot justify the claimed characteristic-two obstruction; affects the proof.
- **Misprint** in JMW16 at Theorem 1.4, printed page 2 (JMW16 lines 75–76): the source says every indecomposable parity complex is an unshifted normalized E(λ); it should be E(λ)[n], since the point object shifted by one is indecomposable parity; affects a stated result.
- **Misprint** in MV07 at Corollary 13.2, printed page 40 (MV07 lines 1622–1626): the source says the weight spaces over the current general coefficient ring are vector spaces; it should be free modules, using rank until a coefficient field is imposed; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "7d8ff9612c5adf798f62b1853b493a0e785d0fd9", "job": "RT-SheafTheoreticSmithTheory~1a", "model": "gpt-6-astra", "worker": "chris-30"} -->
