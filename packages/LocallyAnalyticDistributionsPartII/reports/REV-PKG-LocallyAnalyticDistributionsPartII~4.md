<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13471#issuecomment-6792149741 -->
Review (codex) of ccbf64c

Verdict: needs_changes

1. **F01** (P2) The cited flatness predicate excludes noncommutative scalars

   **Location:** `packages/LocallyAnalyticDistributionsPartII/README.md:292`: “Q_T(A) is flat as a left and as a right A-module (`Module.Flat`).” Also the library contract at :45 and the dependencies at :297.

   **Claim:** Mathlib's named predicate expresses the two flatness assertions for the arbitrary associative filtered ring A of §3.1.

   **Witness:** `Mathlib/RingTheory/Flat/Basic.lean:83,114` requires `[CommSemiring R]`. For A=M₂(ℚ₃) with its discrete filtration and T={1}, Q_T(A)=A, but E₁₂E₂₁=E₁₁≠E₂₂=E₂₁E₁₂. The advertised predicate cannot take this A.

   The instance is within §3.1: its Rees ring is A[t], which is noetherian, and F₋₁=0. The analogous scratch Lean check with M₂(ℚ) fails specifically to synthesize `CommSemiring (Matrix (Fin 2) (Fin 2) ℚ)`; `#check @Module.Flat` confirms the required binder. This is an API-domain defect, not a counterexample to the mathematical flatness theorem. The previous review's flatness row named the declaration without checking its scalar-domain binder.

   **Exact repair:** Remove the identification of general left/right flatness with `Module.Flat`. Cite the pinned `TauCeti.BalancedTensorProduct` and `TauCeti.BalancedExtension` carriers in the supplier contract, and specify flatness here as preservation of injections by the appropriate balanced tensor functor; obtain the other side over the opposite ring. Keep `Module.Flat` and `Module.FaithfullyFlat` for commutative coefficient extension, including §4.14. Update §3.1's Needs line and the Layer 3 contract accordingly. Do not restrict A to be commutative. The native files are `TauCeti/LinearAlgebra/TensorProduct/Balanced/Basic.lean:55` and `TauCeti/LinearAlgebra/TensorProduct/Balanced/Extension.lean:118,291,347`.

   **Repair test:** For A=M₂(ℚ₃), extension along the identity has the native balanced identification A⊗_A M≅M, so an injection remains the same injection on either side. For commutative A=ℚ₃ the specification agrees with `Module.Flat`; no noncommutative instance is demanded.

2. **F02** (P2) The coefficient-field route omits its existing Cohen supplier

   **Location:** `packages/LocallyAnalyticDistributionsPartII/README.md:352,358`: “such a K′ exists by the Cohen structure theorem”; the Needs lines at :354,362 have no coefficient-ring supplier.

   **Claim:** The arbitrary-coefficient route may select an unramified coefficient subfield K′ with K/K′ finite using only the listed inputs. The source proof indeed uses this theorem, but a source citation is not an ownership or supply edge.

   **Witness:** New-roadmap pull request #1034, `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:250`, §1.10, owns strict Cohen rings and compatible coefficient lifting into a prescribed complete local ring. AW14 line 650 explicitly invokes that input; neither package contract names its owner.

   The open head is fab28ea; `roadmaps list` identifies #1034 as new, not a revision of a roadmap on main. It is at position 78 in the merge order, before this roadmap at 198. The pinned `TauCeti.exists_residueFieldSection` in `TauCeti/RingTheory/LocalRing/CoefficientField.lean:132` concerns complete local rings containing a field. It does not supply the mixed-characteristic coefficient DVR inside R. Thus substituting that native coefficient-field theorem would not repair the omission.

   **Exact repair:** Import DeformationAndDerivedPatchingAlgebra §1.10 by name and section in Scope, Exact supplier contracts, the Needs lines of §§3.5–3.6, and Layer 3 Dependencies. Specify the consumed assertion: a strict Cohen ring C with residue k and a compatible local map C→R inducing the identity on k. Keep the local DVR consequence here: the map is injective in mixed characteristic; with e=v_π(p), lifts 1,π,…,π^(e−1) generate R over C by complete successive approximation, so R is finite free and Frac(R)/Frac(C) is finite. Retain the statement that K′=ℚ_p is also allowed when K/ℚ_p is finite. No new supplier gap or reconstruction of Cohen theory is needed.

   **Repair test:** For R=W(𝔽̄₃)[π], π²=3, choose C=W(𝔽̄₃). Then R=C⊕Cπ, [K:K′]=2 and [K:ℚ₃]=∞. For R=ℤ₃ choose C=ℤ₃, giving rank 1. Both examples preserve the repaired generality and give exactly the finite coefficient extension needed in §3.6.

3. **F03** (P3) The final microlocalisation Check now refers to the wrong ring

   **Location:** `packages/LocallyAnalyticDistributionsPartII/README.md:306`: “For the same A and T, the module ℤ_p[[X]]/(p) is S-torsion (p ∈ S)”.

   **Claim:** This is a nonzero module for the ring and Ore set of the immediately preceding Check.

   **Witness:** At :305 those are A=ℚ_p[[x,y]]/(xy), T=⟨X⟩. Here p is invertible, whereas p annihilates the proposed nonzero module ℤ_p[[X]]/(p); such an A-module cannot exist. Also gr(p)=p∉⟨X⟩.

   **Exact repair:** Replace “For the same A and T” by the explicit data “For A=ℤ_p[[X]] with its (p,X)-adic filtration and T=⟨gr p⟩”. This restores the reference to the example at :303 without relying on bullet order.

   **Repair test:** At p=3, M=𝔽₃[[X]] has 1≠0, 3M=0 and 3∈S. In Q_T(A)=ℚ₃⟨X/3⟩, 3 is invertible, so Q_T(A)⊗_A M=0. The intended nonfaithful-flatness Check is valid with these data.

Three findings: two P2 and one P3. The three previous mathematical findings have been repaired. The remaining changes concern a pinned API's domain, an omitted supplier contract, and a Check whose antecedent was displaced by the repair. Neither headline theorem failed elaboration or the padding test. The package inputs were not edited.

## Verified sound

### Previous findings checked first

I read the previous review and repair report before the fresh pass. No previous finding was marked not actionable. Quotes below are from the package README.

| Previous finding | Repaired passage | Assessment and recomputation |
|---|---|---|
| F01, unconditional strictness | :290 “a filtered ring map”; :291 “If every element of T is regular in gr A” | Repaired. For the Laurent filtration, deg_A(x⁻¹)=1 and deg_Q(x⁻¹)=−1, satisfying filteredness but refuting strictness. For ℤ₃[[X]], symbols of 3 and X remain nonzero in degree −1 after inverting gr 3. |
| F02, ramified Verma index | :585 “the deformation index is en”; “Û(p^n 𝔤)_K” | Repaired in the statement, proof, Needs line and Lean docstring. At π²=3,n=1 the correct index is 2. The character λ(3h)=1 is integral there; at index 1, λ(πh)=π⁻¹ and the unit 1−3h would act by zero. |
| F03, coefficient-domain mismatch | :310 “for a residue field infinite over 𝔽_p this roadmap proves them from the case R = ℤ_p”; :358 “K/K′ finite” | Repaired as a coefficient-domain finding. At R=W(𝔽̄₃), gr R[[ℤ₃]]=𝔽̄₃[P,X], not 𝔽₃[P,X]. Over its ramified quadratic extension, R is free of rank 2 over R′ even though it is not finite over ℤ₃. R02 concerns the newly used input's missing ownership edge, not the truth of this extension. |

I reviewed all changed assertions in §§3.1–3.6, §3.8's infinite-residue-field coset argument, §4.13, the matching conventions/contracts, and source correction 12. I also searched the rest of the package for the repaired patterns: unconditional strictness, n versus en, finite coefficient extension versus arbitrary complete coefficients, and compactness imported for an infinite residue field. The direct ramified Ore-set formula remains excluded. The old computed rows, rather than blanket summaries, were used for unchanged assertions; the fifteen seeded targets were read afresh.

### Principles, shape and headlines

The Part II boundary is substantive: the base roadmap's commutative distributions and locally convex calculus are consumed, while this package supplies the noncommutative enveloping and microlocal comparisons. The endpoint covers every integral Casimir parameter for every odd prime, including non-induced parameters. The very-good-prime hypothesis is explicit on the source-general Verma theorem; it excludes no odd prime in the SL₂ endpoint. Fu's alternative route explicitly assumes the separatedness/domain condition it needs. No computational algorithm, copied source passage, sorry-defined data, `set_option`, admitted example, forbidden supplier, or machine-path/process residue was found in the README or Lean file.

All 37 target subsections and 37 Needs lines were read. There are six layers, each with Examples and Dependencies. The order is dictated by lattices → distribution embeddings → completions → microlocalisation → specialisation, with algebraic functions consuming the module comparisons. No source-chapter order is imposed. The forward reference §4.7→§4.8 is acyclic, since §4.8 uses §§2.1 and 4.1, not §4.7. Shape was compared with the main-branch PadicMeasuresIwasawaAlgebras and RepresentationTheory/LieHighestWeight READMEs.

The fourteen sections with explicit definition/API/Checks blocks (§§0.1,0.2,1.1,2.1,2.2,2.5,3.1,3.3,3.7,3.9,4.1,4.2,4.4,5.1) have at least three Checks each; §3.1 now has six, one needing R03. The new coefficient-extension arguments in §§3.2 and 3.6 each have three further Checks. All four package declaration names resolve in Suggested.lean and occur in the README. Mathematical notation in backticks was distinguished from claims to own Lean declarations.

| Headline in the README | Acceptance-test coverage |
|---|---|
| Semisimplicity, §3.8 | `isSemisimpleModule_of_finiteDimensional`, Suggested.lean:78; actual rational completed group algebra, odd p, finite dimension and scalar compatibility. |
| Algebraic Peter–Weyl, §5.2 | `exists_surjective_algHom_end_symPower`, :98; actual product symmetric-power action, arbitrary m and finite K/ℚ_p, prescribed action of every group element and surjectivity. |
| Fu injectivity, §4.14 | Named in the module docstring: missing noncommutative completed central quotient and the specified microlocalisation map. |
| Microlocalisation and D_(1/p), §§3.4–3.5 | Named: filtered microlocalisation, completed enveloping algebra and Banach distribution stages are missing. |
| Affinoid Verma faithfulness, §4.13 | Named, with the corrected p^n lattice: missing affinoid Verma carrier and completed action. |
| Frommer/crossed products, §§2.3–2.4 | Named: missing distribution Banach stages. |
| Isotypic comparison, §3.10 | Named: missing microlocalised module and comparison map. |
| Central strong duality, domains and normal forms, §§4.3,4.7–4.10 | Named: missing analytic topologies and completed quotients. |
| Arens–Michael Fréchet–Stein theorem, §2.5 | Named: missing envelope and Fréchet–Stein carriers. |

No additional statable headline omission or stand-in was found. The generic flatness API correction does not require padding Suggested.lean with auxiliary predicates.

### Lean elaboration, signatures and one-tactic probes

The required `lake env lean` invocation on `packages/LocallyAnalyticDistributionsPartII/Suggested.lean`, from the content checkout, exited 0. Only the two expected `declaration uses sorry` warnings occurred, at lines 78 and 98. The imported object files were available; no build was needed. The module/public-import syntax is supported by the pin; the imports are Mathlib and the two used individual TauCeti modules.

One scratch copy appended `#check @name` for every declaration. Both definitions retain `Fact p.Prime`. The semisimplicity theorem retains p≠2, both module structures, the scalar tower and finite dimension. Peter–Weyl retains p≠2, m, k, the field, both scalar algebras, their tower and finite dimension over ℚ_p. All four signatures agree with the README; no lost binder was found.

Both sorried theorems were tried with closing `simp`, `rfl` and `infer_instance` probes. Each reached the fallback `sorry`; neither tactic test closed either theorem. The scratch file emitted unused-tactic diagnostics as well as its expected sorry warnings, unlike the clean original-file elaboration. The relevant single-lemma candidates were inspected at the pins: Maschke's instance is for finite group algebras; Jacobson/Burnside density requires an existing irreducible action and does not construct the completed action. None is an `exact` proof of either headline. There is no padding finding.

A separate negative probe checks R01: `#check @Module.Flat` displays `[CommSemiring R]`, and applying it to M₂(ℚ) fails on that exact instance. This expected failure is not a failure of Suggested.lean. All Lean processes finished.

### Seeded source sample

The manifest has fifteen distinct works: ten readable cached texts and five settled waived/uncertified works. No new source was needed or fetched. Every sampled target's cited accessible passage was read, including proof-internal assertions; page numbers below are the printed pages of the versions named in the README. The manifest version identifiers agree with the extraction headers. No additional author-flagged unverified target was found beyond the settled inaccessible works listed below.

| Target | Text and locator checked | Result |
|---|---|---|
| §0.1 Lazard lattice | AW13 lines 3117–3169, §10.2, pp.68–69; ST03 lines 817–832, remark after Lemma 4.3, p.20 | Operations, powerfulness, rescaling and lower-power lattices agree. DDMS99 and SCH11 original locators remain settled inaccessible. |
| §1.1 U(g) in D(G,K) | ST02 lines 343–365,376–401,457–483, §§2–3, pp.9–12; FU24 lines 750–761, (22)–(23), p.15 | Positive derivative and contragredient function action agree. The ST02 monomial-sign passage is distinguished from the chosen pairing convention. |
| §1.2 crossed products | ST02 lines 514–526, Lemma 3.1 proof, p.13; AW13 lines 3317–3349, §10.6, p.72 | Right basis from left cosets, left basis from inverse representatives, and conjugation/twisting retained. MR01 remains waived. |
| §3.1 general microlocalisation | AW13 lines 402–427, §§2.3–2.4, pp.8–9 | Ore localisation, graded comparison, completion, flatness and S-torsion kernel supported. Conditional degree preservation is a valid consequence of injective graded localisation. R01 concerns the native predicate, not this source theorem. |
| §3.3 S₀ | AW13 lines 3228–3234,3298–3308, §§10.4,10.6, pp.70–71 | Exact powers of gr p and unramified coefficients retained; not all nonzero symbols. |
| §3.7 module microlocalisation | AW13 lines 3294–3297,3320–3322, §§10.5–10.6, pp.71–72; FU24 lines 695–699, p.14 | Exact functor, regular-module value and S-torsion criterion match. General finite coefficients use restriction/base change. |
| §3.8 semisimplicity | AW13 lines 3653–3730, §11.1, pp.78–80; lines 2811–2840, §9.2, p.61 | Finite dimension, split semisimple hypotheses, lattice qualification and deeper-level argument retained. The source's simply connected setting is not silently asserted for PGL₃. |
| §3.9 Lie module | FU24 lines 700–708, p.14; AW13 lines 2816–2840, §9.2 Proposition and proof, p.61 | Stable-lattice construction and continuous extension supported. The compact ℤ_p-lattice action in the symmetric-power instance is legitimate. |
| §4.5 density/injectivity | FU24 lines 792–817, Theorem 5.2 and proof, pp.16–17 | Nonvanishing f₀, multiplication of locally constant functions and density supported. Antipode/inversion correction is checked explicitly below. |
| §4.9 Ext and grade | AB07 lines 612–629, §5.4 Lemma and Corollary, pp.16–17 | Finite crossed-product Frobenius pairing supports Ext and injective-dimension comparison. Roadmap corrects the cocycle omitted by the source. |
| §4.10 normal form | FU24 lines 1024–1042, Theorem 5.1 proof, p.21, with Lemma 3.3 | The source leaves the basis exercise; the package supplies the bounded-division route. Weight p^n and inclusion direction are correct. |
| §4.11 direct route | FU24 lines 1017–1043, p.21; AW13 §§2.4–2.5, pp.9–10 | Grade argument and final injection supported with the explicit domain hypothesis. Products give a complete intersection, not always a hypersurface. |
| §4.12 integral highest weights | FU24 lines 160–169, Theorem 1.5 and following paragraph, pp.3–4; AW14 lines 447–474, §§4.5–4.6, pp.10–11 | Quadratic-root construction is an explicit derivation, with integral R-linear character and correct Casimir normalization. |
| §4.13 Verma faithfulness | AW14 lines 447–509, §§4.5–4.6, pp.10–11; lines 609–666,728–751, §§5.1–5.4, pp.13–16 | Very-good prime, split simply connected group, completed coefficient field and corrected deformation index en retained. Source's p/π index discrepancy is recorded. |
| §5.2 Peter–Weyl | FU24 lines 1046–1115, §6 and (32), pp.21–22; AW13 lines 3733–3780, §§11.2–11.3, pp.80–81 | Matrix coefficients, quotient dimensions, Lie-module comparison and product form agree. Upper-right unipotent convention checked. |

The additional repair passages AW13 lines 3102–3214 and AW14 lines 650–666 justify the arbitrary-residue-field graded algebra and finite extension from an unramified coefficient field. ST03 lines 449–477 and 817–832 also verify the exact hypotheses of the two declared supplier gaps. The source does not provide the missing roadmap edge in R02.

### Computed adversarial table

These are concrete controls, not substitutes for proofs. Rows cover all sampled targets, headlines, changed assertions, findings, and the unchanged sections whose results were reused from the previous computed table. Equal-characteristic fields, the zero coefficient ring and noncompact groups do not satisfy the relevant standing hypotheses. The subgroup definitions admit p=2; their odd-prime headline theorems do not. At zero objects the assertions below retain their stated meanings.

| Statement | Instances tried | Values computed on both sides | Result / change |
|---|---|---|---|
| §0.1 lattice/normalisation | G={1}, ℤ₃, first SL₂ congruence group | L_1=0; L_(3G)=3L_G; [3e,3f]=9h∈3L_G, while g_ℤ₃=sl₂ rather than 3sl₂ | Correct |
| §§0.2–0.3 subgroup/index | p=2,3,5; m=0 | Indices 6,24,120; −I reduces to I only at 2 and has order 2; empty product has one element | Uniformity needs odd p; definitions agree |
| §1.1 derivative/convolution | f(z)=z²+3z; exp(3e),exp(3f) | f′(0)=3 versus −3; matrix products have diagonals (10,1) versus (1,10); [e,f]=h | Correct sign and multiplication order |
| §1.1 PBW pairing | one coordinate, α=2, β=2 or 1 | d²(t²)/dt² at 0=2=2!; d²t/dt²=0 | Correct coefficient discriminator |
| §1.2 left/right bases | S₃, H=⟨(12)⟩; ℤ₃/3ℤ₃ | Given representatives yield right-module dimension 6, erroneous left span dimension 4; inverse representatives give 6. δ₂δ₂=δ₃δ₁ | Inverses and cocycle essential |
| §1.3 centre | O(2) reflection; SL₂ Casimir | sxs⁻¹=−x≠x; [Δ,e]=[Δ,f]=0 | Connected ambient group retained |
| §2.1 completion/base change | rank 0,1; π²=3,n=1 | Rank zero gives K; Σπ^j u^j has coefficients tending to 0, coefficients in (πu)^j are 1; en=2 | Correct strict inclusion and index |
| §§2.2–2.3 closures/support | p=3,r=3^(−1/3); H=0,ℤ₃×0,ℤ₃² | Log terms of degrees 1,3,9 have norms 3^(−1/3),1,1/3; closure ranks over U_r are 1,3,9 | Proper closure and supported subspace distinguished |
| §2.4 crossed-product radii | p=3,n=1,2 | Exponents k−3^(k−n), k=0,1,2,3: (−1/3,0,−1,−6) and (−1/9,2/3,1,0); maxima 0,1 give norms 1,3; ‖3^n log‖=1/3 | Correct radius and exponential bounds |
| §2.5 Arens–Michael | one abelian generator; zero algebra | At r=1 the exp coefficients have norms 3^v₃(j!), not null; at rank zero every completion is E | Distinct from a single Tate algebra |
| §3.1 T={1} | ℤ_(3),ℤ₃ | A_S=A in each; Q_T(A)=ℤ₃ in each, equal to A only in the complete case | Correct completion distinction |
| §3.1 filtered versus strict | Laurent | gr A=ℚ₃[X,Y]/(XY), Y maps to 0; deg_A x⁻¹=1, deg_Q x⁻¹=−1; F₋₁A=0 | F01 repaired |
| §3.1 injectivity | A=ℚ₃[[x,y]]/(xy), T=⟨X⟩ | y≠0 before localisation; xy=0 and x becomes invertible, so y maps to 0 | Correct negative Check |
| §3.1 regular symbols | ℤ₃[[X]], T=⟨P⟩ | gr=𝔽₃[P,X]; degrees of 3 and X are −1 before and after; X/3 has degree 0 | Degree-preserving condition works |
| §3.1 universal property | ℤ₃[[X]]→ℚ₃, X↦0; identity into ℤ₃[[X]] | First sends P to a graded unit and extends with X/3↦0; second has 1/3 absent and no extension | Unit-symbol hypothesis discriminates |
| §3.1 native flatness, R01 | A=M₂(ℚ₃), discrete filtration | Q=A; E₁₂E₂₁=E₁₁, E₂₁E₁₂=E₂₂; balanced identity tensor has dimension dim M; native CommSemiring requirement fails | Cite balanced tensor, not commutative Module.Flat |
| §3.1 final Check, R03 | ring at :305 versus intended ring | In :305, p·p⁻¹=1, but pM=0 on nonzero 𝔽_p[[X]]; intended ring has p∈S and Q⊗M=0 | Explicitly restore A=ℤ_p[[X]] |
| §3.2 ordered series/graded extension | R=ℤ₃,W(𝔽̄₃); G=ℤ₃,{1} | Graded rings 𝔽₃[P,X],𝔽̄₃[P,X]; degree-n dimensions n+1 over k; G=1 gives k[P]; orders of 3+b²,b+9 are both 1, symbols P,X | Correct arbitrary residue field |
| §3.2 completed versus algebraic tensor | coefficients [x_j] independent modulo 3 | Algebraic tensor's coefficient residues lie in a finite-dimensional span; chosen series spans infinite dimension | Correct negative control |
| §3.3 exact Ore set | G=1,R=ℤ₃; ramified π²=3 | 1,3,12∈S₀; 2,6∉S₀; saturation gives ℚ₃. Ramified formula contains 0=3−3∈3+m² | Exact symbols and coefficient restriction correct |
| §§3.4–3.5 comparison | G=ℤ₃ or 1 | b↦exp(3u)−1 has leading term 3u, norm 1/3; inverse u=log(1+b)/3; rank zero K→K; d_j=3^(−j) gives weighted norms 1, not null | Correct scale and null-series condition |
| §3.6 coefficient selection, R02 | W(𝔽̄₃)[π],π²=3; ℤ₃ | Basis (1,π), rank 2 over W(𝔽̄₃), infinite dimension over ℚ₃; ℤ₃-case rank 1 | Mathematics correct; Cohen owner must be imported |
| §3.6 competing ramified filtration | G=ℤ₃,π²=3 | Correct disc has ‖b/3‖=1; π-adic microlocal disc has ‖b/3‖=√3. With c_j=3^ceil(j/4), term norms are 3^(−ceil(j/4))→0 versus 3^(j/2−ceil(j/4))→∞ | Correct base-change choice |
| §3.7 module localisation | 0,K,ℚ₃[C₃] | Microlocal dimensions 0,1,1; distribution extensions 0,1,3; exp(9u)−1=9u times a unit | Exact, not faithful |
| §3.8 semisimplicity | m=0; zero module; abelian negative control | Scalar algebra ℚ₃ has complements; zero-module submodule lattice has one element; on ℚ₃², γ=I+N with N²=0≠N gives an invariant line with no invariant complement | Headline excludes abelian nonsplit extension |
| §§3.8–3.9 lattices | PGL₃ at 3; standard SL₂ module | q eigenvalues 1/3,1/3,−2/3, det=−2/27; 1−3q=diag(0,0,3); 3q integral. On ℚ₃², exp(3e)=I+3e | Qualified lattice assertion and native action correct |
| §3.10 isotypic quotient | W=K²; M=A,0,W^t | End_K(W) has dimension 4; zero quotients 0; both W^t quotients have dimension 2t | Correct comparison |
| §4.1 Casimir/vanishing | k=0,1,2; p=3,r=3^(−2/3),λ=1/3 | Eigenvalues 0,3/2,4; Ω=Δ/4. Norm Δ≤3^(2/3)<3=norm λ, so Δ−λ is a unit and quotient is 0 | Integrality control and normalization correct |
| §4.2 induced characters | λ=1 at p=3,5; c=0,2; SL₃ weight (1,1,−2) | 2λ+1=3 is nonsquare at both primes; c=0,2 gives λ=0,4 and squares 1,9; cubic characters −6 and 6 after antipode | Both directions and antipode tested |
| §4.3 duality | torus f(g)=g | Left infinitesimal eigenvalue −1; (x̃+δ₁)(f)=2 whereas (x̃−δ₁)(f)=0 | Correct λ∘S |
| §§4.4–4.5 eigenfunction/density | χ(t)=t at 3; χ=1 | f₀(4)=4, absolute value 1; constant 1 fails 1=4. Inversion exchanges weights −1,+1 and preserves sup error; f₀ multiplication also preserves error | Nonvanishing and both eigenspaces supplied |
| §4.6 quotient limit | m=0; zero and unit ideals | lim K=K; lim 0=0; quotient by zero recovers D | No tensor/limit formal shortcut used |
| §§4.7–4.8 small-radius domains | p=3,r=3^(−1/√2); λ=0,ρ≥1 | 1>1/√2>1/2, ρ>1; quadratic symbol determinant −1/2≠0; h²=2h−4ef with RHS weights ≤ρ² | Correct domain/radius control |
| §4.9 Frobenius and grade | ℚ[u]/(u²−2); zero module | α(f)=u/2, β(u/2)(u)=1, β(u/2)(1)=0; cocycle-free value 1/2. Zero-module grades ∞ on both sides; regular-module grades 0 | Correct pairing and Ext direction |
| §4.10 normal forms | n=1,c_j=3^(2j) on e^j | Source term norms 3^(−j)→0; weight-1 target norms 3^(−2j)→0; normal-form h exponents 0 or 1 | Correct inclusion direction |
| §4.11 grade route | p=3,n=1,m=0,1,2 | q_i³ are in disjoint variable blocks; codimensions 0,1,2, relative dimensions 0,2,4 | Complete intersection and domain premise retained |
| §4.12 integral weights | λ=1,−1/2; m=0 | a=−1+√3 gives a(a+2)/2=1; a=−1 gives −1/2; empty extension degree 1; a(√3h)=3−√3 | Correct coefficient domain |
| §4.13 repaired index | π²=3,n=1,λ(3h)=1 | At index 1, norm 3h=3^(−1/2), λ(πh)=π⁻¹; at index 2, norm 3h=1 and 1−3h evaluates to 0 in K⟨3h⟩ | F02 repaired; character exists at correct index |
| §4.14 end theorem | p=3,λ=1; m=0 | Ramified quadratic extension degree 2, n=en=0; m=0 map is identity ℚ₃→ℚ₃ | Non-induced integral case retained |
| §5.1 algebraic functions | degrees 0,1,2; subgroup ±I | Graded dimensions 1,4,9; filtered dimensions 1,5,14; x−w vanishes on ±I but is nonzero in coordinate ring | Open-subgroup hypothesis discriminates |
| §5.2 Peter–Weyl | k=0,1,2; (k₁,k₂)=(1,2); m=0 | End dimensions 1,4,9; two-factor dimension 36; empty tensor End dimension 1 | Correct dimensions and zero-factor case |
| §5.2 action prescription | I,I+3E₁₂,I+3E₂₁,diag(4,1/4) | Vectorized matrix determinant −135/4≠0, span dimension 4; trivial-action span dimension 1 | Arbitrary-action substitute excluded |
| §5.2 translation convention | lower-left and upper-right unipotents | (n_lower⁻¹g)₁₁=x; (gn_upper)₁₁=x; (gn_lower)₁₁=x+ay | Source's intended right subgroup corrected |
| Fréchet–Stein restriction gap | A=ℚ₃, B=A⟨T⟩ versus A² | B-rank 1 in both cases; A-dimensions ∞ versus 2 | Coadmissibility premise excludes first case |

### Pinned declarations and duplication by object

Pins read from the content manifest: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following are the principal native bodies/hypotheses opened in this round, not names inferred from search results.

| Object / declaration | Pinned file and line | Scope checked |
|---|---|---|
| Universal enveloping inclusion/lift | `Mathlib/Algebra/Lie/UniversalEnveloping.lean:80,92` | Lie maps into an associative algebra; native universal property. |
| Special linear Lie algebra and triple | `Mathlib/Algebra/Lie/Classical.lean:92`; `Mathlib/Algebra/Lie/Sl2.lean:38` | Trace-zero matrices; h≠0 and the three bracket equations. |
| Reduction and subgroup product | `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:225`; `Mathlib/NumberTheory/Padics/RingHoms.lean:301`; `Mathlib/Algebra/Group/Subgroup/Basic.lean:172` | Ring-homomorphism map, reduction modulo p, coordinatewise subgroup. |
| Group kernel and inclusion into GL | `Mathlib/Algebra/Group/Subgroup/Ker.lean:238`; `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:369` | Native kernel and underlying matrix. |
| Completed group algebra | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145,252` | Compatible inverse-limit families; Dirac/group elements. Its carrier does not require finite coefficient residue field. |
| Compact module and action | `TauCeti/Topology/Algebra/Module/Compact.lean:294`; `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean:251,322` | Four compact-module fields; no separate T2 field in the predicate. Action has ambient compact-ring/group/continuity hypotheses, satisfied by the stated ℤ_p lattices. |
| PBW filtration, basis, graded isomorphism | `TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Basic.lean:75`; `Basis.lean:96,175`; `Injective.lean:213` in that directory | Arbitrary commutative ground ring, Lie algebra free as a module; ordered monomial convention. |
| Casimir | `TauCeti/Algebra/Lie/UniversalEnveloping/Casimir.lean:125,175` | Killing-dual basis, centrality; roadmap's Δ=4Ω. |
| Symmetric powers and product action | `TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean:57`; `Mathlib/LinearAlgebra/TensorPower/Symmetric.lean:53`; `Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean:104,481` | Native symmetric tensor carrier and tensor product of actual action maps. |
| Commutative tensor and right unit | `Mathlib/LinearAlgebra/TensorProduct/Defs.lean:72`; `Mathlib/RingTheory/TensorProduct/Maps.lean:274` | Used legitimately over coefficient fields/rings; not an associative-ring balanced tensor. |
| Flatness / faithful flatness | `Mathlib/RingTheory/Flat/Basic.lean:83,114`; `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:58,64` | Commutative scalar hypotheses: R01. |
| Balanced tensor and extension | `TauCeti/LinearAlgebra/TensorProduct/Balanced/Basic.lean:55`; `Extension.lean:118,291,347` | Associative rings, balancing relation, identity and composite-extension comparisons; the proper carrier for R01. |
| Ore set/localisation and filtration | `Mathlib/GroupTheory/OreLocalization/OreSet.lean:52`; `Basic.lean:92` in that directory; `Mathlib/RingTheory/FilteredAlgebra/Basic.lean:75` | Noncommutative Ore condition; ring filtration. Completion theorem is additional work. |
| Noetherian/domain predicates | `Mathlib/RingTheory/Noetherian/Defs.lean:191`; `Mathlib/Algebra/Ring/Defs.lean:437` | Noetherian means left by this native abbreviation; domain includes nontriviality. |
| Semisimple modules and density | `Mathlib/RingTheory/SimpleModule/Basic.lean:66,573`; `Mathlib/RepresentationTheory/Maschke.lean:165`; `TauCeti/RepresentationTheory/Irreducible.lean:242` | Complemented submodule lattice; finite-group Maschke and action-dependent density do not prove either headline in one step. |
| Noncommutative completion limitation | `Mathlib/RingTheory/AdicCompletion/Algebra.lean:40,97` | The ring instance is for completion of a commutative ring, not U(h). |
| Cohen near-match | `TauCeti/RingTheory/LocalRing/CoefficientField.lean:128,132,147` | Equal-characteristic/coefficient-field setup, not the mixed-characteristic coefficient-DVR input of R02. |
| Functions, measures, Lie modules, exp | `Mathlib/Topology/ContinuousMap/Defs.lean:32`; `Mathlib/Topology/LocallyConstant/Basic.lean:212`; `Mathlib/NumberTheory/Padics/Measure/Basic.lean:40`; `Mathlib/Algebra/Lie/Basic.lean:93`; `Mathlib/Analysis/Normed/Algebra/Exponential.lean:128` | Continuous dual carrier for measures; scalar-compatible Lie action; convergence must still be proved for the total exponential. |

Object searches covered the pinned libraries, roadmaps on main, board package index and configured open heads: Iwasawa algebras/actions, coefficient extension, PBW, Casimir, symmetric powers, balanced tensors, microlocalisation, Frommer closures, Arens–Michael envelopes and Peter–Weyl. The integer congruence subgroups returned by the near-match search concern SL₂(ℤ), not SL₂(ℤ_p). Complex compact-group Peter–Weyl concerns a different carrier and topology. The two package definitions are thin, necessary specialisations; they do not claim native subgroup theory as new work. Generic microlocalisation and the coefficient-general ordered-series extension remain this roadmap's work. The Cohen coefficient construction must instead be consumed, as R02 records.

### Supplier order, current heads and overlap

Every cross-roadmap citation was resolved anew. `roadmaps resolve` reports no unresolved cross-roadmap citation or name; its output explicitly says it does not check native names on its host, so the independent pin checks above are necessary. The supplied overlaps report has no conflicting head, dropped cited id, revision-only id or dropped local id. All five vocabulary-near heads were inspected. The board-package index was read before ownership conclusions; no absent-package claim was inferred from this branch alone.

| Supplier / candidate | Current file and locators resolved | Ownership/convention result |
|---|---|---|
| PadicLocalLanglandsForGL2Qp, #1312 | `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:205`, §0.1 | Functions, distributions, Dirac convolution, faithful flatness with the stated source field, Fréchet–Stein and Schikhof duality. General FS and explicit radius presentation are the two declared gaps. |
| NoncommutativeAndEquivariantIwasawa, #1307 | `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:150,177,209,271,303,333,378,435,590` | §§0.1–0.3,0.5–0.8,F.1,0.13a exist. Finite-free coefficient convention at :56, ordered-series hypothesis at :380, coset-limit proof at :221. The package now separates its infinite-residue-field extension. |
| LocallyAnalyticDistributions, #854 | `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:891,1048,1081,1344` | §§0.0–0.3 exist; spherically complete Hahn–Banach and discrete-coefficient shared objects are distinguished from unrestricted coefficients. |
| PadicMeasuresIwasawaAlgebras, main | `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:398,657,909` | Layer 0, §§1.2,1.7; multiplication xy and finite-quotient measure comparison. Compact p-adic groups supply the needed countable quotient tower. |
| LieHighestWeight, main | `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:319,405,567,931` | Layers 0,3,5,7; standard modules, Verma theory, complete reducibility, raw HC projection. Native PBW and Casimir are consumed, not re-owned. |
| DeformationAndDerivedPatchingAlgebra, #1034 | `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:246,250` | Existing strict-Cohen-ring/lifting owner, earlier than this package: omitted edge R02. |
| CompletedCohomologyPartII, #1035 | `TauCetiRoadmap/CompletedCohomologyPartII/README.md:7–31` | Tower cohomology, completed modules and arithmetic comparison; no competing enveloping/microlocal construction. |
| GlobalGaloisDeformationsPartII, #1837 | `TauCetiRoadmap/GlobalGaloisDeformationsPartII/README.md`, Scope and ownership | Deformations, Selmer and lifting conditions, not these analytic algebra carriers. |

The two gap slugs, supplier and §0.1 agree in `design/plan.json` and README:55,57: `frechet-stein-general` and `radius-algebras`. The first includes the hypothesis that B is coadmissible over A; the second includes HYP and the appropriate rational-power radii for Fréchet–Stein stages. They are precise contracts with the existing owner, not unowned prerequisites. Neither is expanded into a substitute theory here. Acceptance after repairs would remain conditional on these gaps.

The required dependency check returned:

```text
depcheck: 237 roadmaps, 2143 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This does not detect the omitted edge in R02. Adding its existing owner at position 78 is downward supply to this package at 198. No merge-order or tooling file was changed.

## Not verifiable

- SCH11 is settled uncertified/paywalled. The original Theorem 28.3, Corollary 31.7 and Theorem 32.1 passages were not available; their numbered/page citations are retained without a renewed request.
- FROM03, DDMS99, MR01 and DG70 remain waived. Their original text was not read. Accessible KOH07, AW13, AB07 and ST02 expose the relevant uses; this does not certify the inaccessible originals.
- Ownership against open work without a readable head in the configured tooling was not independently checked. No finding asserts that an object exists nowhere on the basis of such an unavailable head.
- Elaboration checks signatures, not the truth of the admitted theorems. Full formal proofs of the two headlines and the deep analytic constructions were not attempted; source hypotheses and the computed controls above are the review evidence.

## Source issues

These include the previously computed source corrections rechecked in sampled passages, plus the additional notation slips encountered in those passages. No source passage is reproduced.

- **Misprint** in FU24 at §4, equation (16), printed page 14: the source says weighted coefficients need only be bounded; it should require them to tend to zero for the completion; affects nothing.
- **Gap** in FU24 at Theorem 4.2, printed page 14: the source says the cited theorem gives noetherianity at every real radius; it should supply the irrational-radius argument or restrict that assertion; affects a stated result.
- **Error** in FU24 at §4, equation (17), printed page 14: the source says its Ore formula works over ramified coefficient rings; it should use unramified coefficients and then base change; affects the proof.
- **Error** in FU24 at Theorem 5.7, printed page 20: the source says all central parameters produce domains; it should exclude parameters making the central relation a unit; affects a stated result.
- **Gap** in FU24 at Theorem 5.7 proof, printed page 20: the source says the weaker-norm graded quotient transfers the domain property; it should establish separatedness of the induced quotient filtration; affects the proof.
- **Error** in FU24 at Remark 5.8, printed pages 20–21: the source says integrality characterises induced parameters; it should require 2λ+1 to be a square in ℤ_p; affects a stated result.
- **Error** in FU24 at §5 before Theorem 5.2, printed page 16: the source says the induced character is dχ composed with HC; it should include the antipode for the specified left-translation action; affects a stated result.
- **Error** in FU24 at Theorem 5.2, printed page 16: the source says the natural strong dual keeps the same central character; it should use the antipode-twisted character with this action convention; affects a stated result.
- **Misprint** in FU24 at §6, printed page 22: the source says the right stabiliser of x^k is lower upper triangular; it should specify the upper unipotent subgroup; affects nothing.
- **Misprint** in AW14 at §5.2 Lemma proof, printed page 14: the source says the completion has bounded weighted coefficients; it should require weighted coefficients tending to zero; affects nothing.
- **Misprint** in AW14 at §5.2 Lemma proof, printed page 15, line 671: the source says distributions surject from the locally L-analytic group to its underlying ℚ_p-analytic group; it should reverse that surjection; affects nothing.
- **Error** in AW14 at §5.4 Theorem with §4.5 Definition, printed pages 16 and 10: the source says the index-n Verma module accepts characters on p^n t; it should use deformation index en when p is a unit times π^e; affects a stated result.
- **Misprint** in AB07 at §5.4 Lemma proof, printed page 17: the source says the inverse pairing takes only the inverse-index coefficient; it should multiply by the cocycle, equivalently take the identity coefficient of the product; affects the proof.
- **Misprint** in AB07 at §5.4 Corollary, printed page 17, line 627: the source says R is the crossed product T∗G while calling R the base ring; it should write T=R∗G; affects nothing.
- **Misprint** in AW13 at §11.1 Theorem proof, printed page 80, lines 3722–3724: the source says V→RLV is the counit and LRW→W is the unit; it should exchange those two names; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "ccbf64ce07d4adf499941453295d36064e4e631e", "job": "REV-PKG-LocallyAnalyticDistributionsPartII~4", "model": "gpt-6-astra", "worker": "chris-9"} -->
