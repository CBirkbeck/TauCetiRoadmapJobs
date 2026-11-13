<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/164#issuecomment-6858034268 -->
Red team round 1 pass a (codex) of 5082d6d

Verdict: needs_changes

1. **F01** (P1) Weil volume uses an integral-point inclusion that can fail

   Location: packages/LogicAndDefinabilityInNumberTheory/README.md:534, “If X is smooth of pure relative dimension d over O_F”.

   Claim: finite type, smoothness and an integral gauge suffice for the gauge volume formula inherited from §2.7.

   Witness: Glue two copies of A¹_O along D(x). The resulting smooth finite-type scheme has q+1 residue points. Two integral sections x=π have the same generic point; the generic-point image has dx-volume 1, whereas (q+1)/q>1.

   Exact repair text: “Let X be a **separated**, smooth finite-type O_F-scheme of pure relative dimension d. Identify X(O_F) with its image in X(F) by separatedness. For an integral r-gauge form, its §2.7 measure satisfies vol(X(O_F))=#X(k_F)/q^d.” Add the doubled-origin construction as a negative-control Check. The two sections now violate the explicit separatedness hypothesis; for A¹_O both sides remain 1.

2. **F02** (P1) The identity Néron models need not be isogenous as group schemes

   Location: packages/LogicAndDefinabilityInNumberTheory/README.md:548, “an étale isogeny 𝒜°→ℬ° of identity components”.

   Claim: the prime-to-p extension is an isogeny over the valuation ring, not just on connected special fibres.

   Witness: For a split Tate elliptic curve over ℚ₃, [2] on 𝒜° has generic kernel order 4 and special kernel μ₂ of order 2. A finite étale isogeny over the connected DVR cannot have these two ranks.

   Exact repair text: “The extension restricts to an étale homomorphism 𝒜°→ℬ°. On connected special fibres it induces an étale isogeny 𝒜°_k→ℬ°_k; no finiteness assertion is made for the morphism of identity-component models.” Use the special-fibre isogeny in (b) and étaleness of the model map in §2.11. The Tate [2] map then has permitted kernel orders 4 and 2; its special-fibre point counts are both q−1=2.

3. **F03** (P1) Uniform local integration and specialization have a circular proof route

   Location: packages/LogicAndDefinabilityInNumberTheory/README.md:433 and :786, “Integrate the replacement motivically and specialize to obtain G”; §3.9 needs §2.4.

   Claim: §2.4 constructs uniform G before the specialization theorem used to obtain it.

   Witness: §2.4 → motivic integration and specialization (§§3.7,3.9); §3.9 → §2.4 in its Needs line. The roadmap-level gate does not inspect this internal proof edge.

   Exact repair text: “Keep §2.4's fixed-F integration theorem, proved by Macintyre cells and Presburger summation. Prove §3.9 specialization by comparing prepared cells with ordinary Haar integrals, using §§2.1–2.3 and §2.5(a). Move the uniform motivic-integration/specialization clause of §2.4 to the end of §3.9, after that comparison theorem, with its interpolation proof.” Record “The uniform clause of §2.4 is now the concluding theorem of §3.9” to preserve the old target reference. Remove the uniform conclusion from §3.9's prerequisites; cite §§3.7 and 3.9 only in the moved corollary. For the order-a angular cell, both constructions give q^(−a−1) directly, without that uniform corollary.

4. **F04** (P1) The distinguished mixed Shimura subgroup need not be the centre

   Location: packages/LogicAndDefinabilityInNumberTheory/README.md:1877, “unipotent radical W with centre U”.

   Claim: U equals the centre of W.

   Witness: The universal elliptic-curve Check at :1891 has W=Gₐ² and U=0. Thus Z(W)=W≠U. Gao Definition 2.1 and Notation 2.8 distinguish U by weight −2 (towards_the_andr_oort_conjecture_for_mixed_shimura_varieties_the_ lines 244–251, 311–315).

   Exact repair text: “Write P=W⋊G, with unipotent radical W, distinguished central weight −2 subgroup U⊆Z(W), and V=W/U.” Specify Lie(U)=W₋₂ Lie(P). The universal elliptic curve then has U=0, V=W=Gₐ²; a pure datum has U=V=W=0. Keep the existing universal-elliptic-curve Check as the negative control against U=Z(W).

5. **F05** (P1) Split parameters change the dimension of the stated norm family

   Location: packages/LogicAndDefinabilityInNumberTheory/README.md:1298, “for u∈k× let X_u be the model of (a) for K=k((du)^(1/p))”.

   Claim: these field extensions give the fibres of one smooth projective normic family for every nonzero u.

   Witness: Take p=2, k=ℚ, d=2, u=1/2. The displayed field is ℚ, so its norm equation has dimension 1. The rank-two split algebra ℚ×ℚ gives Ξ₁Ξ₂=P(x), dimension 2; this is the intended fibre.

   Exact repair text: “For (c), use the finite étale algebra K_u=k[v]/(v^p−du), of rank p, and its algebra norm. Construct the family of normic compactifications with this algebra, allowing split fibres. Apply (a)'s field-case Brauer computation only when K_u is a field.” This agrees with le_compl_mentaire_des_puissances_n_i_mes_dans_un_corps_de_nombres lines 502–515 and the existing split-algebra Check. At u=1/2 the fibre remains two-dimensional and has trivial relative Brauer group.

6. **F06** (P2) Two statable arithmetic headlines are absent from the acceptance test

   Location: packages/LogicAndDefinabilityInNumberTheory/README.md:1268 and :1365; packages/LogicAndDefinabilityInNumberTheory/Suggested.lean:7–26.

   Claim: the file covers the statable arithmetic headlines and identifies those whose carriers are unavailable.

   Witness: Quadratic nonnorm definability and non-model-completeness of Th(ℚ) are absent. Native polynomials suffice for the former; Mathlib/ModelTheory/Semantics.lean:704, Bundled.lean:73 and ElementaryMaps.lean:44 supply complete theories, models and elementary embeddings for the latter.

   Exact repair text: “Add `quadratic_nonnorms_diophantine`: there are fixed m,s and s rational polynomials in 2+m variables whose common existential zero set is {(x,y): x≠0 ∧ y≠0 ∧ ¬∃a b:ℚ, a²−y*b²=x}. Add `rational_theory_not_model_complete`: there are nonempty models M,N of the native complete theory of the rational ring and a native embedding e:M↪N which fails to preserve some native formula on a finite tuple.” Use native bundled models and realization, or a simple real-bodied model-completeness predicate; retain all model instances explicitly. Mention both names in the README and module docstring. For the norm predicate, y=1 gives no nonnorms, (x,y)=(−1,−1) gives a nonnorm and (2,−1) does not. The model counterexample must be between two models of Th(ℚ); ℚ⊂ℝ is deliberately excluded because ∃x,x²=2 distinguishes their theories.

7. **F07** (P3) Definitions lack three discriminating Checks

   Location: packages/LogicAndDefinabilityInNumberTheory/README.md:1014–1023, :1339–1361 and :1375–1385.

   Claim: the sequence relation, model completeness and explicit two-universal polynomial have the required definition Checks.

   Witness: §§4.12 and 4.33 have no Checks. In §4.31 the third bullet only describes existential closure; neither it nor the first two tests model completeness of a theory.

   Exact repair text: “Add computed Checks to each of these definitions.” For §4.33: at a=b=1,t=0,u=(1,0,0,0),v=0, F=0; at a=b=1,t=1/2,u=v=0, F=241/16≠0; at a=−1,u=(1,0,0,0), F=0 for all b,t,v by the first guard. These separate the norm equations from the guard and catch a missing factor or square. For §4.31: ACF₀ is model complete; Th(ℚ) is not (§4.32); the theory of fields is not, witnessed by ℚ⊂ℚ(√2), where ∃x,x²=2 changes from false to true. For §4.12 use the stated pairing P(x,y)=T(x+y−2)+y: P(11,4)=95 decodes x=11,y=4, with 11 mod 5=1 and 11 mod 9=2, so it codes (1,2); P(5,2)=17 decodes x=5,y=2, with 5 mod 5=0 at i=2, represented by the positive value 5; P(1,1)=1 decodes to 1 at i=1, while i=0 is outside the positive-index relation. Do not give codes an unstated length. Keep these Checks in the README, not Suggested.lean.

8. **F08** (P2) The fibration argument states a vacuous abelian-component hypothesis

   Location: packages/LogicAndDefinabilityInNumberTheory/README.md:1301, “whose function field contains an abelian extension of the residue field”.

   Claim: this is the abelian-component hypothesis required by the invoked zero-cycle fibration theorem.

   Witness: Every such function field contains the residue field itself, an abelian extension of degree one. If its constant field is an S₃-extension L/k, L(t) passes this condition but not CTV Theorem 3.1's abelian algebraic-closure condition.

   Exact repair text: “Every closed fibre has a multiplicity-one irreducible component such that the algebraic closure of the base point's residue field inside that component's function field is an abelian extension of that residue field.” Verify this using the cyclic normic presentation before applying CTV Theorem 3.1 (le_compl_mentaire_des_puissances_n_i_mes_dans_un_corps_de_nombres lines 274–277). The cyclic degree-p constant extensions in the intended fibres satisfy it; an S₃ constant extension does not.

9. **F09** (P3) Two manifest locators name declarations absent from their cited files

   Location: packages/LogicAndDefinabilityInNumberTheory/sources.toml:77 and :93, `mvPolynomialEquiv` and `exists_finset_right_rename`.

   Claim: these declarations occur in the pinned external PolyBridge.lean and NormalForm.lean sources respectively.

   Witness: PolyBridge ends at hilbert10_polynomial_bridge line 675 without `mvPolynomialEquiv`. NormalForm imports RightRename at hilbert10_finite_diophantine_normal_form line 547; its own declarations include `dioph_iff_exists_fin_mvPolynomial` at line 623, not `exists_finset_right_rename`.

   Exact repair text: Replace the first locator by “Hilbert10/PolyBridge.lean: toDiophPoly; toDiophPoly_apply; exists_mvPolynomial” and the second by “Hilbert10/NormalForm.lean: dioph_iff_exists_fin_mvPolynomial; dioph_iff_exists_finite_mvPolynomial”. The fixed-input support argument already has its own pinned-Mathlib route in README §4.6. The replacement names occur in the cached cited versions; the ring equivalence remains this roadmap's target rather than an attributed external declaration.

## Verified sound

Read all 1,951 README lines and all 197 Suggested.lean lines: **18 declarations (12 theorems, 6 definitions), 93 numbered mathematical target sections, and 194 Check bullets read**. The 51 Check blocks were tested against their definitions and source hypotheses; representative computed values appear below. The declaration table records retained contexts; the sampled target table records computed instances, including failures. Check coverage is by mathematical statement, not by counting a restatement as an independent test. The source register below records **45 locator-comparison groups**; a group can contain several adjacent theorem locators. Eighteen named cross-roadmap contracts or ownership boundaries were compared with main or the supplied open heads.

The supplied elaborated signatures were compared with the README. No needed section hypothesis disappears: there are no section-variable blocks, and the field, DVR, finite-module, compatible-language and definability instances appear explicitly. No new elaboration or Lean build was run. The import list is one `import Mathlib` plus the used Tau Ceti semialgebraic module. No sorry'd data, `set_option`, `lemma`, admitted example, free predicate standing in for a missing carrier, or duplicate fully qualified declaration was found. The one-tactic/pinned-lemma inspection found no additional padding declaration.

The twelve stated headlines are: eventual ring-sentence Ax–Kochen transfer; Igusa–Poincaré rationality; MRDP; integer H10 undecidability; universal integer definability; Diophantine rational nonintegers; rational ∀∃ undecidability; the one-universal-variable integer definition; the explicit two-universal-variable formula; number-field nonpowers; Pila–Wilkie rational counting; bounded-degree algebraic counting. The module explicitly defers relative elimination/general AKE/coefficient transfer, motivic integration/specialization/integral transfer, dual Néron volume comparison, normic zero-cycles, definable Chow, pure and mixed André–Oort, CM-pair reduction and period codimension, naming their missing carriers. R06 identifies two further statable arithmetic headlines.

The declared `gap:neron-pairing-perfect-finite-residue` agrees between `design/plan.json` and the README. Its general, Galois-equivariant perfectness assertion is precise and exceeds the supplier's present semistable theorem. It is a valid declared contract, not an undeclared prerequisite or a finding.

The requested read-only dependency gate returned:

```text
depcheck: 223 roadmaps, 1981 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. R03 concerns an internal proof dependency, outside this gate's roadmap-level graph. The read-only diff-stat check showed changes confined to the package folder.

### Supplier and ownership comparison

Paths in this table identify roadmap files in their repository layout; open suppliers were read at the provided heads, not inferred from remembered numbering.

| Roadmap | Sections or objects compared | Result |
|---|---|---|
| AbelianSchemesAndArithmeticModuliPartII | B2.6, B2.7, B2.14, B2.15, B2.18 | Parameter-uniform semirational blocks, word growth and abelian action interfaces are supplied; the rational/bounded-degree consequences here do not duplicate their proofs. |
| ShimuraVarieties | §§3.4b–3.4e, 3.5a, 3.5d, 3.6 | General o-minimal syntax, cells, dimension, choice, R_an,exp and smooth definable Chow exist at the cited head. The singular extension and counting consequences here use those interfaces. |
| StratifiedSpacesAndTameTopology | §§4.1, 7.1 and scope | Triangulation and C^p cells do not replace the analytic cell theorem. This is an ownership boundary, not an extra supply edge. |
| AdelicAlgebraicGroups | §2.4 | Characteristic-zero affine-group gauge measures are already owned there; general analytic tensor measures here extend that scope. R01 corrects the model hypothesis. |
| NeronModelsAndSemistableAbelianVarieties | §§2.5, 4.6 | Isogeny extension and the semistable pairing theorem exist. General perfectness is the declared gap; R02 distinguishes extension from finiteness. |
| ReductiveGroupsPartII | RG2.3.7 | Lang's theorem covers smooth geometrically connected finite-type groups, including the nonaffine connected Néron special fibres. |
| MotivesAndAlgebraicCycles | §4.20 | χ^c and the Tate image are supplied; inversion of 1−L^(−i) belongs to the designated localized target. |
| HeightsRationalPointsAndObstructions | §§2.16b, 2.17, 2.20, 2.21; §§5.1, 5.6, 5.8 | Residues, unramified classes, arbitrary-degree cycle pairings, the formal lemma and torsion-family boundaries were compared. The effective normic theorem is additional work here. |
| QuadraticFormInvariants | Layer 2; §6C items 9–12 | Quaternion norm/trace and odd/dyadic Hilbert-symbol conventions match the local trace route. |
| GlobalQuadraticForms | §§4.2–4.4, 5.5, 6.1 | Square/norm, Hilbert-sign prescription, isotropy and representation inputs exist. The old §4.4 is retained by an explicit section/name map, so its citation is valid. |
| SchemeAndStackFoundations | §§0.7, 2.20 | Scheme dimension and smooth relative dualising/top-form comparison are supplied. |
| DiophantineApproximationAndTranscendence | §§0.2–0.3 | Mahler/absolute-height comparison and Northcott use fixed degree, as required by the coordinatewise counting statement. |
| RealAlgebraicGeometry | Completed, Layers 3–6 | Real semialgebraic syntax, projection and the definability dictionary are already owned; this package does not replan them. |
| DifferentialGeometry | Boundary and corners | The manifold substrate is supplied; finite definability certificates are the extra interface here. |
| ResolutionOfSingularitiesCharacteristicZero | §6.2 | The characteristic-zero compactification/resolution input for normic models is available. |
| WeilConjectures | §5.29 | Curve bounds include all relevant conjugates and supply the large-residue-field estimate. |
| Chebotarev | Completed, Layer 14 | Auxiliary primes with finitely many exclusions are supplied. |
| ClassFieldTheory | Layers 5, 10–13 | Local invariants, global reciprocity, norm and class-field inputs are available; no reverse dependency was introduced. |

Ownership searches used the roadmap tool over open heads and main, plus the board packages and the supplied checkout index, searching the objects (MRDP, Diophantine normal forms, nonpowers, definable quotient interpretations, cell/counting interfaces, motivic integration), not only proposed declaration names. The closest main scopes, including ComputabilityTheory and ClassicalArithmeticCompletion, do not own this full computation-to-polynomial or arithmetic-definability theory. ArithmeticDynamics' height/dynamical scope does not duplicate it. No second copy or conflicting owner was established. The unresolved-name lead `Diophantine.mrdp` resolves to this package's own nested namespace.

Pinned comparisons included Mathlib's native `Poly`, `Dioph`, `Dioph.DiophFn`, `Dioph.pow_dioph`, polynomial infinite-box extensionality, existential syntax and preservation, complete theories and elementary maps, rational/absolute heights, and Tau Ceti's semialgebraic definition/projection/dictionary, Grothendieck ring completion and vector weak approximation. Native `Poly` is an integer-valued function on natural assignments; native absolute height is total with value 1 off algebraic elements. The roadmap retains these conventions and the explicit algebraicity guard.

### Declaration-by-declaration audit

All names below are in `TauCetiRoadmap.LogicAndDefinabilityInNumberTheory`; the MRDP name additionally has namespace `Diophantine`. There are no section `variable` or `include` blocks. Contexts below are the explicit binders retained in the supplied elaborated signatures; no new Lean invocation was made. “Consistent” means these instances do not refute the statement, not that finite testing proves its universal claim. For existentially supplied polynomials, the concrete evaluations test their encoding and required membership values; they do not pretend to compute an unspecified witness polynomial.

| Declaration; README section | Retained context | Instances and computed values | Result / change |
|---|---|---|---|
| `ax_kochen_ring`; 1.5 | Ring sentence φ; ∃N before ∀p; prime Fact; both CompatibleRing instances | φ=∃x,x²+1=0: Q₂ false/F₂((t)) true; p=3 false/false; p=5 true/true. Thus N≥2 for this sentence. p=0,1 excluded. | Consistent; instance compatibility and quantifier order retained. |
| `igusa_poincare_rationality`; 2.6 | p prime; O:Type u, CommRing, IsDomain, CharZero, DVR, Algebra Z_p O, Module.Finite; m,f | f=0: raw series (1−q^m T)⁻¹; choose P=1,Q=1−q^mT. f=1: raw series 1, P=Q=1. f=x: coefficients all 1, Q=1−T. m=0,f=0: coefficients all 1. n=0 quotient has 1 element. | Consistent; zero ring excluded by IsDomain, finite extension retained. |
| `Diophantine.mrdp`; 4.15 | n:ℕ; S⊆(Fin n→ℕ); native tuple encoding | n=0: empty/universal sets both have REPred=true and Dioph=true, though membership differs. Even numbers: X−2Y=0 at X=2,Y=1; at X=1 no natural root. | Consistent; REPred and Dioph are predicates on the set, not its membership value. |
| `hilbert_tenth_integers`; 4.16 | ∃n,p over ℤ; predicate parameter a:ℤ | Test p=a−x²: a=0,1 have roots 0,1; a=−1 none. This family is computable, so cannot witness the existential theorem. Zero witnesses p=a gives root iff a=0. | Consistent; no claim for every polynomial. |
| `rationalIntegers`; 4.17/4.24 | none; genuine Set ℚ body | 0 and −7 have cast witnesses 0 and −7; 1/2 has none. | Definition determines the embedded integers. |
| `rationalDiophantine`; 4.17 | S:Set ℚ | Empty set: p=1 has 0 roots; whole ℚ: p=0 has a root at every input; nonzero set: xy−1, x=2 admits y=1/2, x=0 gives −1. | One-equation form valid over formally real ℚ. |
| `universal_integers`; 4.24 | ∃n,p over ℤ; ∀t:ℚ; rational universal block | Required truth: t=0,−7 gives ∀y,p≠0; t=1/2 gives ∃y,p=0. Cast witness test distinguishes t=1/2 from every integer. | Source establishes witness existence; no missing instance. |
| `rational_nonintegers_diophantine`; 4.24 | none; complement of the defined set | Complement membership: 0=false, −7=false, 1/2=true. Negating ∀y,p≠0 yields ∃y,p=0 with the same t. | Consistent; not a one-library-lemma duplicate. |
| `forall_exists_rational_undecidable`; 4.25 | ∃k,l,q over ℤ; parameter a:ℕ; Fin.append order 1,k,l | At a=2 the first coordinate is 2, followed by k universal and l existential coordinates. In inverse encoding P*w−1, P=0 gives −1 for every w; P=2,w=1/2 gives 0. A noninteger guard factor 0 annihilates the product. | Consistent reduction direction and parameter type. |
| `one_universal_variable`; 4.28 | ∃m,p over ℤ; ∀t; ∀x:ℚ ∃y:Fin m→ℚ | Fin.cons t (Fin.cons x y) has arity m+2. t=0 requires witnesses for every x; t=1/2 requires one x with no witnesses. Unlike ∃x∀y, this cannot be satisfied by selecting a favourable x. | Consistent with Corollary 22. |
| `twoUniversalIntegerPolynomial`; 4.33 | a,b,t:ℚ; u:Fin4→ℚ; v:Fin3→ℚ | a=b=1,t=0,u=(1,0,0,0),v=0: A=1,B=C=0,F=0. a=b=1,t=1/2,u=v=0: F=241/16. a=−1,u=(1,0,0,0): first factor 0. | Correct body; add README Checks, R07. |
| `two_universal_integer_formula`; 4.33 | t:ℚ | Above t=0 witnesses work at a=b=1. At a=b=3, T₃₃⊆Z_(2), so t=1/2 cannot have norm-trace witnesses. Nonpositive a has four-square guard. u₃⁸a²b² coefficient 1: total degree 12, existential degree 8. | Consistent; not degree 8 in all ten variables. |
| `nonpowers_diophantine`; 4.30 | k:Type u, Field, NumberField; r>1; finite system | ℚ,r=2: −1 in, 4 out, 0 out. r=3: 2 in since v₂=1; −8 out since (−2)³=−8. r=1 excluded. s=0 would define all k, so is not a witness. | Consistent; no unjustified sum of squares over arbitrary k. |
| `IsOMinimalExpansion`; 6.1 | L:Language, L.Structure ℝ | Ordered real field: interval frontier {a,b}, size2. Expansion defining ℤ: frontier ℤ infinite, predicate false. Equality-only structure has finite unary boundaries but cannot define order, so false. | Real body excludes the wrong structures. |
| `algebraicPart`; 6.11 | n:ℕ, X⊆ℝ^n | Interval: algebraic part interval; finite X: empty; n=0 point: no nonsubsingleton S, hence empty; graph exp: no positive-dimensional semialgebraic arc, hence empty. | Connected+nonsubsingleton correctly replaces positive semialgebraic dimension. |
| `rationalTupleHeight`; 6.12 | n:ℕ, x:Fin n→ℚ | H(())=1; H(0)=1; H(−3/4)=4; H((−3,2))=3. | Matches native multiplicative height, including empty tuple. |
| `pila_wilkie`; 6.14 | L, structure, hL, n,m,X,hX; ε>0; ∃C before ∀t,T≥1 | Interval fibre: remaining count0≤CT^ε; rational singleton height1: count1≤C at T=1; n=0 nonempty fibre: count1. Finite height bounds exclude ncard's infinite-set value0. | Consistent; all parameters are retained. |
| `bounded_degree_counting`; 6.16 | Same, plus fixed k≥1; coordinatewise algebraicity/degree/height | √2: degree2,H=√2; admitted k=2,T=2, rejected k=1. (√2,√3): degrees2,2 though joint degree4. Transcendental x: minpoly degree0,height1, but algebraicity=false. Empty tuple count1. | Consistent; explicit algebraicity blocks junk values. |

### README statement audit

Selected computed rows from the 93-target audit follow; rows duplicating the declaration table are omitted. API bullets and identities are included in their owning row. Bold text contains Check/API labels and supplier names rather than a separate inventory of bold theorem targets. Cases inapplicable to a carrier (zero ring for a field, q=1 for a residue field, inseparable number fields, noncommutative quaternion multiplication used as though commutative) are excluded explicitly by the stated context. The rows include negative controls, not merely successful examples.

| Statement | Instances tried and computed values on both sides | Result / change |
|---|---|---|
| 0.1 Quotient interpretations | ℤ² fractions: 1·4=2·2=4; (1,2)~(2,4). Equality quotient on F₂: two graph outputs 0≠1 violate uniqueness. R/(1) is singleton. | Consistent; no transversal assumed. |
| 0.2 Semantics/composition | Equality of the above representatives translates to 4=4, true; (1,2),(1,3) translates 3=2, false. Identity composition preserves both. | Consistent. |
| 0.3 Fractions | (−1,2)+(1,2)=(0,4), value0; (1,0) excluded. In F₂, (1,1) has value1; (1,2) excluded since2=0. | Consistent; domain assumption excludes zero ring. |
| 0.4 Arithmetic bridges | ℤ→ℚ: (2,2) represents1, so formula x=1 true in both; (2,3) gives 2/3≠1 in both. Residue of3 in F₂=1. | Consistent. |
| 1.1 Sorted language | VG 3≡1 mod2=true, 2≡1=false. Guard x≠0∧ord(x)=0 false at 0 for every totalization. ac on RF variable is ill-sorted. | Consistent. |
| 1.2 Angular components | k of char≠2: ord(t³(2+t))=3,ac=2; char2 changes order to4,ac1. With π′=2π in F₃((t)), ac′(π)=2⁻¹=2 rather than1. ac0=0,ac1=1. | Consistent; some Checks restate axioms. |
| 1.3 Relative QE | C((t^Q)): residue C,valueQ, 2·(1/2)=1; included. Q₂ residue characteristic2, excluded. Zero polynomial contributes f=0=true rather than ord0 finite. | Consistent. |
| 1.4 AKE | Coefficient-free equal residue/value theories give equal truth; named residue i=2 versus3 in F₅ yields 1+i=3 nonsquare versus4 square. | Coefficient compatibility necessary and retained. |
| 2.1 Cells | q3,ord0,ac1: mass1/3; graph0: ambient mass0; units: two angular fibres,total2/3; ac0 invalid for a1-cell. | Consistent. |
| 2.2 Preparation/dimension | Q₂(√2): ordπ1,ord2=2. Graph x²: dim1, ambient measure0. F×{0}: dim restricted total1, union of untagged fibres0. Dense algebraic subset and complement: empty interiors, union full. | Consistent with tagged fibres: cubides_darniere_leenknegt_2017 lines 143–147 defines them as subsets of the total space. |
| 2.3 Local constructible functions | 1_O integral1; 1_F integral∞; 1_empty integral0; q2 geometric sum Σ2⁻ⁿ=2=(1−1/2)⁻¹. | Consistent; integrability separate. |
| 2.4 Integration | q3,ord a=1, fixed ac: volume1/9. φ=ab−c on F: at(2,3,6) integral0; at(2,3,5) absolute integral∞. Thus integrability is multiplication graph. | R03 proof cycle; zero-locus rather than definable-locus claim correct. |
| 2.5 Change of variables | q3,x=πu:1/3=(1/3)·1, inverse factor would3. diag(π,π²):1/27. F₂((t)) digit swap quotients t versus t⁻¹, no derivative. Analytic x↦tx has volume1/2. | Consistent; bounded fibres2 for y²=x³+x, no graph choice asserted. |
| 2.7 Gauge measures | O^d standard form volume1; π²(dx)² has density(q⁻²)^(1/2)=q⁻¹; zero form measure0; unit norm1 scales by1. | Consistent on stated Hausdorff manifolds. |
| 2.8 Null loci | Point in F: ambient measure0, intrinsic dimension0 counting mass1. Square-zero thickening F[ε]/ε² not geometrically reduced. | Consistent; neither intrinsic nor nonreduced volume inferred. |
| 2.9 Weil volume | A¹: q/q=1; G_m:(q−1)/q. Doubled origin: q+1 residue points but generic image volume1. | R01. |
| 2.10 Néron counts | Tate reduction n: full count n(q−1); dual same. Z/3 with Frobenius−1: invariants and coinvariants both order1. S₃ on F₃³/diagonal: invariant order1, dual invariant order3. Tate [2]/Q₃: generic kernel4,special2. | R02; cyclic pairing argument sound conditional on declared gap. |
| 2.11 Dual volumes | Self-dual good elliptic curve [2],p3: derivative factor ‖2‖₃=1, equal volumes; zero form both0. Tate self-dual curve volume n(q−1)/q on each side with integral gauge. | Consistent; zero case must be treated before scaling to a generator. |
| 2.12 Relative top forms | Projection(x,y)↦x: dx∧dy=ω, fibreformdy. Product a=xy: da∧(−dx/x)=dx∧dy; opposite order changes sign, absolute density unchanged. | Base-first convention sound. |
| 3.1 Subassignments | ∀y,y²≠−1: overR one point,overC empty, so no functor inclusion. Existential opposite: empty→point. h[0,0,0] one point; h[0,1,0](K)=K versusVG Z. | Consistent; closed embedding of elliptic curve replaces invalid affine-open model. |
| 3.2 Scissor semiring | RF splits into RF× plus a point; atF₃,3=2+1. Two-point pushforward: f!1=2 whereas(f!1)²=4≠f!(1²)=2. | Correctly additive, not ring morphism. |
| 3.3 Coefficients | q2: (1−q⁻¹)⁻¹=2; q1 denominator0; q3/2: L−2=−1/2<0. | Correct localized ring and positivity domain. |
| 3.4 Presburger functions | Empty sum0; Σ1 overN diverges; q2 Σ2⁻ⁿ=2; even n sum=4/3=(1−1/4)⁻¹. | Consistent. |
| 3.5 Motivic tensor | Indicator from either factor specializes1 at its point,0 outside; L−1 at q=3=2; push two points gives 2; empty base ring has0=1. | Consistent. |
| 3.6 Grading | Singleton degree0 class1, degree1 class0. Graph over VF line: absolute dim1, relative dim0. Empty class0 in every degree. | Correct grade distinctions; d−1 at d0 means negative grade, not natural truncated subtraction. |
| 3.7 Pushforward | ord1 fixed-ac cell volume L⁻²; at q=3 1/9. Two residue points push to2. Product of two such cells L⁻⁴ in either integration order. | Source construction and axioms agree. |
| 3.8 Motivic substitution/Fubini | x=tu: ordjac1; weighted integral L⁻¹ equals volume tO. Two-coordinate diagonal(t,t²): L⁻³. Identity:ordjac0,weight1. | Sign correct. |
| 3.9 Specialization | L⁻²→1/9 at q=3; residue RF×→2; even VG ray→4/3 at q=2. | Formula consistent; remove R03 internal dependency cycle. |
| 3.10 Identity transfer | ∫1_O=1 over Q_p and F_p((t)); ∫1_empty=0 over both. A residue equation x²+1=0 has counts0 at q=3,2 at q=5; unlike residue fields are not compared. | Universal-family, coefficient-compatible quantifiers retained. |
| 3.11 Geometric realization | G_m→[Q(1)]−1; P¹→1+[Q(1)]; even shift[2] gives plus, odd shift[1] gives minus. Inversion atL=1 would require inverse0 and is not a map to an unlocalized ring. | Correctly localized, no injectivity claim. |
| 4.1 Syntax-to-functions | p=X−2: at 0 −2, at 3 1; constant−1 remains−1. No-variable polynomial7 evaluates7 at the unique empty tuple. | Signed integer codomain retained. |
| 4.2 Evaluation | p=X²−2X at 0 gives 0,at 3 gives 3 in both syntaxes. | Correct natural-input restriction. |
| 4.3 Native syntax representation | Native proj0 represented by X₀, constant−2 represented by C(−2); sum at x=3 gives 1 on both sides. | Existence, not executable reification. |
| 4.4 Polynomial extensionality | Over ℤ, X and0 differ at 1. Over 𝔽₂, X²−X and0 agree at 0,1 but are distinct polynomials; infinite-box/domain conditions prevent this. | Consistent. |
| 4.5 Ring equivalence | (X−2)+(2−X) maps to0; (X−1)(X+1) at2 gives 3 in both; no-variable constants map identically. | Correct direction and coefficient ring. |
| 4.6 Finite witness support | Inputs indexed by ℕ, p=X_free(100)−Y_witness(7): witness support{7}, input100 survives. The constant polynomial 1 needs no witness coordinates. | Infinite input coordinates not discarded. |
| 4.7 Enumeration | support{7,9}→Fin2 maps0↦7,1↦9; empty support→Fin0 with one assignment. | Correct finite witness arity. |
| 4.8 Root transport | p=x−y₇, x3,y₇3 gives 0 before/after enumeration; x3,y₇2 gives 1 before/after. | Extension outside support irrelevant. |
| 4.9 Finite normal form | Even predicate at2: witness1 makes 2−2=0; at 1 no natural witness; empty witness p0 defines universal, p1 empty. | Correct finite existential block. |
| 4.10 Effective codes | CodeX−2 at 0 gives−2; X_free−Y_witness at(3,2) gives 1, swapping gives −1; Fin0 witness enumeration contains one tuple. | Supplied syntax avoids computable extraction from a bare function. |
| 4.11 RE direction | Witness search for x=2y: x2 halts at y1; x1 never halts; p1 with zero witnesses fails after the single assignment. | Semidecision, not decision. |
| 4.12 Sequence codes | Code P(11,4)=95 decodes x=11,y=4: 11 mod 5=1 and 11 mod 9=2. Code P(5,2)=17 decodes x=5,y=2: at i=2, 5 mod 5=0, represented by 5. P(1,1)=1 at i1 gives 1; index 0 excluded. | Add Checks, R07. |
| 4.13 Bounded universals | P(i):i<2. n0 true, n2 true, n3 false. Empty conjunction corresponds polynomial0; false predicate polynomial1. | Varying bounded witnesses must be encoded, as plan states. |
| 4.14 Computation graphs | Minimization with f(0)undefined,f(1)=0 remains undefined, not 1. If f(0)=1,f(1)=0, least output1. | Earlier defined-output requirement excludes spurious traces. |
| 4.18 Effective reductions | Source equation x²=2: no Q-root, has R-root, so unlicensed coefficient extension does not reflect solvability. Identity effective interpretation preserves0=0 and1=0 truth. | Reflection and effective syntax required. |
| 4.19 Quaternion sets | Norm-one scalar1 has trace 2. Hamilton real traces∈[−2,2], trace 5 excluded. Split algebra T=Q; unit 0 excluded by inverse guard. | Consistent. |
| 4.20 Local trace theorem | Hamilton T=ℤ_(2)∩[−4,4], so 5 is excluded at the real place. For a=6,b=15, the auxiliary triple (1,1,1) gives 69≡5 mod 8; (1,1,0) gives −21≡3. | The roadmap corrects the source's dyadic misprint. |
| 4.21 Semilocal prime classes | R³₃=ℤ_(3), R⁵₅=ℤ_(5), R⁷₇=ℤ_(7). R³₅=ℤ_(2), despite empty odd class-three support. R¹₁,₃=ℚ. | Guards retain the dyadic place and empty supports. |
| 4.22 Radicals | Jac(ℤ_(3))=3ℤ_(3); Jac(ℤ_(3)∩ℤ_(5))=3ℤ_(3)∩5ℤ_(5). Jac(ℚ)=0, whereas an empty intersection of local ideals is ℚ. | The required nonempty-support condition is present. |
| 4.23 Prime covers | 3,5,7 occupy distinct classes modulo 8; 2 occupies none. The parameter 1 has empty odd valuation support. | Empty supports and the dyadic place are treated separately. |
| 4.26 Square-detection unions | 1 is a square; −1 fails at the real place; 2 has odd valuation at 2. Multiplication by a square preserves all valuation parities. | The real place and class-one family are needed. |
| 4.27 Nonnorms | y=1: a=(x+1)/2,b=(1−x)/2 give a²−b²=x. For y=−1, x=−1 is impossible, while x=2 has a=b=1. The support of 35 needs both classes 5 and 7. | Add the missing acceptance theorem, R06. |
| 4.28 One universal variable | The classes 1,3,5,7 are distinct modulo 8ℤ_(2). Each lies in ℤ_(2), so k+ℤ_(2) identifies all four classes. | The roadmap corrects this source error. |
| 4.29 Normic cycles | At p=2,u=d⁻¹, the split algebra has norm xy and the normic variety has dimension 2; the displayed field has identity norm and dimension 1. Cycle degrees: 5−2·2=1. Sym¹U=U. | R05 and R08; the S₃ constant-field counterexample is in R08. |
| 4.31 Preservation | Identity embeddings preserve existential truth. In ℚ⊂ℚ(√2), ∃x,x²=2 changes from false to true, refuting model completeness of the theory of fields. ACF₀ is model complete. | Add theory-level Checks, R07. |
| 4.32 Rational models | K=L=ℚ gives Z_L∩K=ℤ and equality of all power sets. ℚ⊂ℚ(√2) fails the premise that both models satisfy Th(ℚ). At n=1, both power sets are the whole field. | The non-model-completeness headline is missing, R06. |
| 4.33 Two universals | F(1,1,0,(1,0,0,0),0)=0; F(1,1,1/2,0,0)=241/16. For a=−1,u=(1,0,0,0), the guard is 0. The monomial a²b²u₄⁸ has degree 12. | Add computed Checks, R07. |
| 5.1 Counts/densities | d=1,q=3,n=2: O has count 9 and density 1; πO has count 3 and density 1/3. At n=0 the quotient is a singleton, but membership in πO is not invariant modulo the unit ideal. | The reduction-invariance hypothesis prevents the wrong level-zero count. |
| 5.2 Uniform series identities | O gives 1/(1−T) over both fields. πO gives density q⁻¹ for every n≥1. q=3 versus q=5 gives 1/3≠1/5; these are not eligible transfer partners. | Quantifiers and normalization agree. |
| 5.3 Zeta interface | f=x,q=2,s=1: T=1/2 and Z(T)=(1/2)/(3/4)=2/3=∫_O abs(x). For f=0 and Re(s)>0 the integral is 0. | The substitution uses q^(−s). |
| 5.4 Product singular fibre | q=2: the residue axes have 3 points. For n≥1 the fibre mass is (n+1)/2; 4·(1/2)²·Σ_(n≥1)(n+1)/2ⁿ=3. | The formula excludes the singular fibre a=0. |
| 6.1 O-minimal expansion | Two intervals have at most 4 boundary points. The boundary of ℤ is infinite; the boundary of ℚ is ℝ. Equality alone cannot define the order graph. | The native predicate excludes these wrong expansions. |
| 6.2 Analytic/exponential structures | Restricted constant 1 has value 1 at x=1 and 0 at x=2. Restricted x has value −1 at −1. Unrestricted exp has exp(0)=1; unrestricted sine has infinitely many zeros. | Cube boundaries and totalization agree. |
| 6.3 O-minimality | Sine restricted to [−1,1] has one zero; unrestricted sine has infinitely many. Exp is injective; x² has fibres of cardinalities 0,1,2. | R_an,exp is imported; its reduct consequences have the right scope. |
| 6.4 Components/paths | Two disjoint open intervals have 2 components; an interval has 1; ∅ has 0. A path between the two intervals would have disconnected image. | This is the connected-component extension of the supplied cell theory. |
| 6.5 Uniform components | x²=t has 0,1,2 components for t<0,t=0,t>0, bounded uniformly by 2. Sine outside the o-minimal setting has infinitely many zero components. | The parameter cannot enter the uniform bound. |
| 6.6 Finite atlases/corners | A quadrant corner has 2 local boundary germs, an edge point 1, an interior point 0. For φ_i=id,φ_j=2id, the transition φ_j⁻¹φ_i is x/2. | The roadmap corrects the source's direction and boundary-dimension errors. |
| 6.7 Algebraic definability | y²=x³−x is a polynomial zero set; xy=0 is the union of two axes, including its singular origin. ℙ¹ needs two affine charts. | Singular varieties are not discarded. |
| 6.8 Remmert–Stein | A={(z,0):z≠0}, E={0}×ℂ: the closure adds (0,0) and is a line. The nondefinable graph exp(1/z) acquires an entire vertical fibre in its closure. | Definability is a substantive hypothesis. |
| 6.9 Chow | A complex line is closed, analytic and algebraic. An open unit disc is not closed in ℂ. A real interval is not complex analytic. | Singular extension uses the supplied smooth case and dimension induction. |
| 6.10 Algebraic unions | A countable union of points indexed by ℤ is not a definable subset of ℂ. Two axes form a finite algebraic union equal to its closure. | No finite-selection claim is made for arbitrary countable unions. |
| 6.13 Blocks | A point has dimension 0 and empty algebraic part; an interval has dimension 1 and equals its algebraic part. A constant image of an interval is a point. | Positive image dimension, not domain dimension, is required. |
| 6.15 Integral/image blocks | (−3,2) has height 3. A constant image of an interval has dimension 0; its identity image has dimension 1. | Both image cases are covered. |
| 6.17 Orbit/count exponent | c=C=1,A=2,δ=1,ε=1/4: at D=100 the lower count is 100 and singleton upper bound 10. If Aε=δ both are D and no contradiction follows. | The strict exponent inequality is retained. |
| 7.1 Pure AO input | g=1,τ=i: D=4, degree 2 and height 1; j=1728 has orbit size 1. Repeated isogeny factors use the centre order, not the full matrix endomorphism algebra. | Inputs are stated separately from the AO conclusion. |
| 7.2 Exceptional CM points | cD^δ>CD^(Aε) exactly when D>(C/c)^(1/(δ−Aε)), for δ>Aε. A fixed discriminant bound bounds the stipulated lift heights and degrees. | The counting contradiction has the correct direction. |
| 7.3 Families/induction | A singleton family has dimension 0. A positive-dimensional proper fibre reduces dimension d to at most d−1. An arbitrary countable set of points is not a definable family. | The finite algebraic-family reduction is the cited Lemmas 7.5–7.7. |
| 7.4 AO reduction | A special singleton has 1 special point, dense in itself. A nonspecial singleton has 0, not dense. A_g itself is special. | The conditional theorem uses the stated arithmetic inputs. |
| 7.5 CM pairs | The diagonal contains infinitely many CM pairs and is modular. j₁=1728 contains infinitely many and is a CM vertical line. j₁=1 contains 0. | The necessary exceptional curves are retained. |
| 7.6 Period codimension | dim X=dim D=1, codim Z=1: a positive-dimensional intersection has codimension 1<2, triggering I-BT. A zero-dimensional component projects to a proper point in X. | The positive-dimensional-base hypothesis handles the boundary case. |
| 7.7 Mixed AO | For the universal elliptic curve W=G_a², Z(W)=W≠U=0. At τ=i and V-coordinate (1/2,0), N=2,H=2,D=4. For a pure datum N=1. | R04; the remaining comparison uses the stated orbit and lift inputs. |

### Source locator and wording register

These are comparisons with the cached legal texts, including the version specified by the README. Repeated target citations are grouped; this is not a claim that a survey supplies the proof of MRDP or that a waived text was inspected. Source errors are separated below from package defects.

| Source and line locator | Theorem/section compared | Package targets / result |
|---|---|---|
| cluckers_loeser_2008 line 353 | §2.1, Theorem 2.1.1, Corollary 2.1.2 | §§1.1–1.4: residual characteristic zero and guarded valuation retained. |
| cluckers_loeser_2008 line 558 | Theorems 3.2.1, 3.3.1; formula (3.3.2) | §2.5: analytic pieces, dimension and quantifier-elimination shape. |
| cluckers_loeser_2008 line 1551 | §§7.1–7.2, cell presentations and preparation | §§2.1–2.2: residue parameters and zero-cells retained. |
| cluckers_loeser_2008 line 1140 | §§5.1.1–5.1.2 | §3.2: pushforward correctly additive rather than multiplicative. |
| cluckers_loeser_2008 line 764 | §4.2; Theorem 4.4.1 | §§3.3–3.4: positivity for all real q>1, rational Presburger sums. |
| cluckers_loeser_2008 line 1458 | §§6.1–6.2 | §3.6: dimension filtration and relative grades. |
| cluckers_loeser_2008 line 2437 | Theorem 10.1.1, axioms A0–A8 | §3.7: integration hypotheses and normalization. |
| cluckers_loeser_2008 line 3039 | Theorem 12.1.1; §13.2 at line 3180 | §§3.7–3.8: Jacobian sign and signed pushforward. |
| cluckers_loeser_2008 line 3226 | Theorems 14.1.1, 14.4.1 | §§2.6, 3.8, 5.1, 5.3: relative integration and rational series. |
| cluckers_loeser_2008 line 3416 | §15.1; §§16.1–16.4 at line 3635 | §§3.1, 3.11: global charts and geometric realization; roadmap fixes the open-embedding error. |
| cluckers_loeser_exp line 1695 | Theorems 9.1.5–9.1.6 | §§2.4, 3.9: integration and characteristic-zero pushforward specialization are distinguished. |
| cluckers_loeser_exp line 1750 | Proposition 9.2.1; Theorem 9.2.4 at line 1853 | §§1.5, 3.10, 5.2: fixed formulas and coefficient-compatible residue structures. |
| integrability_of_oscillatory_functions_on_local_fields_transfer_p line 516 | Theorems 3.1.1, 3.1.3, 3.1.5; §4.3 at line 1428 | §§2.2–2.4: fixed-field integration and uniform interpolation are separate. |
| pas_1989 line 166 | §2.4; Theorem 4.1 at line 680 | §1.3: hypotheses and relative elimination confirmed; damaged proof formulas remain a limitation below. |
| cluckers_comte_loeser_2012 line 206 | Definition 1.4.1, Theorem 1.4.2 | §§2.2, 2.5: fixed-field analytic cells and prepared absolute values. |
| cubides_darniere_leenknegt_2017 line 157 | Definition 2.2, HM1, Lemma 2.3 | §2.2: lines 143–147 explicitly retain the base coordinate in each fibre; the union formula is correct. |
| geometric_stabilisation_via_p_adic_integration line 251 | §2.1, Theorem 1.4, Proposition 2.2, Example 2.4 | §§2.7–2.12, 5.4: gauge density, point counts, dual volumes and the product example; R01–R02. |
| mirror_symmetry_for_moduli_spaces_of_higgs_bundles_via_p_adic_int line 1018 | §4.1, Proposition 4.1, Claim 4.2 | §§2.7, 2.12: tensor-root density and base-first determinant convention. |
| torsion_and_tamagawa_numbers line 1555 | Proposition 4.3 and preceding paragraph | §2.10: component-pairing perfectness and finite cyclic invariants; arbitrary finite Galois groups require care. |
| presburger_sets_and_p_minimal_fields line 248 | Theorem 3 and proof | §2.4: parameter-dependent rectilinearization with bounded factors. |
| undecidability_in_number_theory line 89 | Definition 1, MRDP discussion and H10 consequence | §§4.1–4.9, 4.16: semantic normal forms and undecidability; not the computation-encoding proof. |
| hilbert10_polynomial_bridge line 555 | toDiophPoly, evaluation and exists_mvPolynomial at line 619 | §§4.1–4.3: one-way bridge exists; the manifest's equivalence locator does not, R09. |
| hilbert10_finite_diophantine_normal_form line 623 | dioph_iff_exists_fin_mvPolynomial and finite-type variant | §§4.8–4.9: finite-input source; arbitrary fixed inputs require the roadmap's own support argument. |
| diophantine_functions_and_matiyasevic_s_theorem_native_poly_and_d line 1779 | Poly; Dioph at line 1999; pow_dioph at line 2699 | §§4.1–4.15: native signed functions and exponentiation, not full MRDP. Checked again at the pin. |
| multivariate_polynomial_extensionality_on_infinite_boxes line 537 | funext_set, funext_set_iff | §4.4: domain and infinite-coordinate sets retained. Checked at the pin. |
| koenigsmann_defining_z line 161 | Proposition 6 and Step 1 | §§4.19–4.20, 4.33: trace sets, dyadic witnesses and explicit polynomial. |
| koenigsmann_defining_z line 280 | Definition 7, Proposition 10; Lemma 13 at line 416 | §§4.21–4.22: square classes, localizations and the necessary empty-support correction. |
| koenigsmann_defining_z line 812 | Proposition 21(d)–(e), Corollary 22 | §§4.26–4.28: source product and dyadic-guard errors already corrected. |
| koenigsmann_defining_z line 916 | Proposition 23, Remark 24 | §§4.31–4.32: all positive powers and the conditional algebraic-closure assertion; R06. |
| le_compl_mentaire_des_puissances_n_i_mes_dans_un_corps_de_nombres line 175 | Proposition 2.2; Theorem 3.1 at line 269; §4 at line 493 | §§4.29–4.30: normic models, effective cycles and nonpowers; R05 and R08. |
| geometric_categories_and_o_minimal_structures line 500 | §§4.2–4.6 | §§6.1–6.5: analytic cells, components and uniform bounds. |
| bkt line 844 | Smooth definable Chow; Appendix A at line 874 | §§6.2–6.7: finite atlases and their conventions; roadmap fixes boundary and transition errors. |
| peterzil_starchenko_agc line 501 | Theorems 3.2, 4.1; Theorem 4.4 and Corollary 4.5 at line 596 | §§6.8–6.9: definable analytic closure and Chow. |
| on_the_algebraic_points_of_a_definable_set line 220 | Proposition 3.4, Theorem 3.5; Lemma 5.2 at line 358 | §§6.13, 6.15–6.16: blocks, semialgebraic images and coefficient encoding; k+1 correction retained. |
| ax_schanuel_for_shimura_varieties line 180 | Definable analytic closure/Chow discussion | §§6.8–6.9: singular-ambient extension is not an extra smoothness assumption. |
| ax_lindemann_for_a_g line 751 | Lemma 7.4; Lemmas 7.5–7.7 at line 817 | §§6.10, 7.1–7.4: finite families and AO reduction, not unconditional orbit estimates. |
| the_andr_oort_conjecture_for_a_g line 274 | Galois-orbit estimate; AO proof at line 347 | §§6.17, 7.2–7.4: orbit and counting exponents have the correct direction. |
| pila_tsimerman_2013 line 106 | Theorem 3.1 | §§7.1, 7.7: polynomial lift-height bound. |
| abelian_varieties_isogenous_to_no_jacobian line 584 | §3.2, printed p.648 | §7.5: André's theorem is invoked as input; the subsequent block consumer does not prove it. |
| the_shafarevich_conjecture_for_hypersurfaces_in_abelian_varieties line 2958 | Lemma 6.3 | §7.6: positive-dimensional base and codimension argument. |
| the_ax_schanuel_conjecture_for_variations_of_hodge_structures line 56 | Theorem 1.1 and weak Mumford–Tate loci | §7.6: the functional-transcendence input is explicitly conditional. |
| cattani_deligne_kaplan line 47 | Theorem 1.1, Corollaries 1.2–1.4 | §7.6: algebraicity of the relevant Hodge loci. |
| towards_the_andr_oort_conjecture_for_mixed_shimura_varieties_the_ line 244 | Definition 2.1; Theorem 13.6 at line 2158 | §7.7: central weight filtration differs from the full centre, R04. |
| native_multiplicative_heights line 1619 | absMulHeight₁; rational identity at line 2293 | §§6.12, 6.16: total height and rational normalization. Checked at the pin. |
| native_ultraproduct_structures_and_o_transfer line 743 | boundedFormula_realize_cast; sentence_realize at line 857 | §1.5: native Łoś transfer, not a new ultraproduct theory. |

Six further prose comparisons were made separately: §2.4's interpolation proof against integrability_of_oscillatory_functions_on_local_fields_transfer_p line 1751; §3.1's definition against cluckers_loeser_2008 line 400; §4.33's proof against koenigsmann_defining_z line 246; §6.6's atlas definition against bkt line 914; §7.7's counting proof against towards_the_andr_oort_conjecture_for_mixed_shimura_varieties_the_ line 2158; and the explicit-polynomial Lean docstring against koenigsmann_defining_z line 246. Longest shared runs after removing mathematical symbols were respectively 2, 6, 2, 4, 4 and 2 words. They are connective phrases or standard object names; no copied explanatory passage was established. The cell and polynomial formulas express the mathematical data themselves. No copied figure, exercise list or source table was found.

For arrangement, the largest source is Cluckers–Loeser 2008: **21 of 140 source–target locator groups**, counting each work once per numbered target and excluding supplier-only text, bibliography and repeated locators within that target. Its contents are at cluckers_loeser_2008 line 280. The package moves cell/Jacobian/local-measure work before motivic coefficient construction; its scissor section (§3.2) precedes coefficient/Presburger sections (§§3.3–3.4), reversing the source's §§4–5 arrangement. Global charts precede these constructions, while the arithmetic-definability and o-minimal-counting branches are independent of that contents sequence. The §3.5 tensor definition needs §§3.2–3.4; grading needs that tensor; pushforward needs grading and cells. Those dependency-forced orders do not make a copied chapter sequence. R03 is the separate internal cycle to repair.

Source independence: 51 passage-comparison groups recorded with 32 sources; no copied explanatory passage or reused source table established; largest share cluckers_loeser_2008, 21 of 140 source–target locator groups; contents compared with cluckers_loeser_2008: independent mathematical organization, subject to R03's proof-order repair.

## Not verifiable

- The settled waived texts `vd_dr_tame`, `vd_dr_macintyre_marker` and `pila_wilkie`, and settled uncertified texts `hilbert_s_tenth_problem_is_unsolvable`, `bosch_lutkebohmert_raynaud`, `schneider`, `hodges` and `denef_1984` were not available as inspected full texts. Their locator status remains unchanged; no new request was made. In particular the detailed Davis bounded-universal/computation construction and the exact Denef pagination are not newly certified here.
- Pas's OCR preserves the hypotheses and elimination theorem, but damages several formulas in the cell-decomposition proof. The affected proof formulas were not certified from OCR alone.
- The operator's elaborated signatures were inspected; no fresh `#check` run or theorem-proof build was performed, as required by this read-only pass. Instance tests refute false statements but do not constitute proofs of the admitted headlines.

## Source issues

- **Error** in cluckers_loeser_2008 at §5.1.2, author p.28 (cluckers_loeser_2008 line 1180): the source says residue-definable pushforward preserves multiplication; it should be additive with a projection formula; affects a stated result.
- **Misprint** in cluckers_loeser_2008 at Theorem 10.1.1, A8, author p.60 (cluckers_loeser_2008 line 2488): the source says the graph formula uses f!; it should be p! for the displayed projection; affects nothing.
- **Misprint** in cluckers_loeser_2008 at §13.2, projection formula, author p.77 (cluckers_loeser_2008 line 3193): the source says both factors are inside pullback; it should be f!(f*α·β)=α·f!β, with β on the source; affects nothing.
- **Error** in cluckers_loeser_2008 at §15.1, author p.83 (cluckers_loeser_2008 line 3416): the source says an affine chart is isomorphic to an affine open of affine space; it should use a closed embedding into affine space; affects the proof.
- **Gap** in cluckers_loeser_exp at Proposition 9.2.1, author p.44 (cluckers_loeser_exp line 1751): the source says an abstract residue-field isomorphism suffices with named coefficient constants; it should preserve the interpreted coefficient structure; affects a stated result.
- **Misprint** in cluckers_loeser_exp at Proposition 9.2.1 proof, author p.44 (cluckers_loeser_exp line 1763): the source says characteristic zero of the ultraproduct fields suffices; it should require residue characteristic zero for this relative-elimination step; affects the proof.
- **Gap** in cluckers_loeser_exp at Proposition 9.2.1 proof, author p.44 (cluckers_loeser_exp line 1768): the source says factorization through f determines the function on its entire target uniquely; it should restrict to the image and specify zero extension; affects the proof.
- **Gap** in geometric_stabilisation_via_p_adic_integration at §2.1, author p.6 (geometric_stabilisation_via_p_adic_integration line 268): the source says integral points embed into generic-fibre points for the stated algebraic spaces; it should impose separatedness for that identification; affects the proof.
- **Misprint** in geometric_stabilisation_via_p_adic_integration at Proposition 2.1(b) proof, author p.6 (geometric_stabilisation_via_p_adic_integration line 289): the source says the induced map runs from X° to Y°; it should run from Y° to X° and retain the covering-degree factor in the integral; affects the proof.
- **Error** in geometric_stabilisation_via_p_adic_integration at Proposition 2.2 proof, author p.6 (geometric_stabilisation_via_p_adic_integration line 308): the source says the extension is an isogeny of Néron models; it should assert an étale homomorphism and use an isogeny of connected special fibres; affects the proof.
- **Misprint** in mirror_symmetry_for_moduli_spaces_of_higgs_bundles_via_p_adic_int at Proposition 4.1, author p.20 (mirror_symmetry_for_moduli_spaces_of_higgs_bundles_via_p_adic_int line 1046): the source says the relative top-form section is on Y and reverses the determinant factors; it should be on X with base-first order matching (13); affects nothing.
- **Misprint** in mirror_symmetry_for_moduli_spaces_of_higgs_bundles_via_p_adic_int at Claim 4.2 proof, author p.20 (mirror_symmetry_for_moduli_spaces_of_higgs_bundles_via_p_adic_int line 1081): the source says η is already an r-fold tensor; it should take η to be the untensored coordinate top form; affects nothing.
- **Misprint** in koenigsmann_defining_z at Proposition 6 proof, printed p.78 (koenigsmann_defining_z line 230): the source says the dyadic row (6,15) uses (1,1,0); it should use (1,1,1), giving 69≡5 rather than −21≡3 modulo 8; affects the proof.
- **Misprint** in koenigsmann_defining_z at Proposition 10 proof, printed p.81 (koenigsmann_defining_z line 367): the source says the class-five trace terms have first entries −2p and 2p; it should retain −2 and 2 as in Definition 7; affects nothing.
- **Misprint** in koenigsmann_defining_z at Proposition 10 proof, printed p.81 (koenigsmann_defining_z line 378): the source says the class-seven trace terms have first entries −p and 2p; it should retain −1 and −2 as in Definition 7; affects nothing.
- **Error** in koenigsmann_defining_z at Lemma 13, printed p.82 (koenigsmann_defining_z line 437): the source says the Jacobson-radical conclusion also holds with empty ramification support; it should exclude the field case, whose radical is zero rather than ℚ; affects a stated result.
- **Error** in koenigsmann_defining_z at Proposition 21(d) proof, printed p.89 (koenigsmann_defining_z line 818): the source says the empty class-three support set is a union of the other square-class families; it should use their product, with signed unit and rational-square factors; affects the proof.
- **Misprint** in koenigsmann_defining_z at Proposition 21(e) proof, printed p.90 (koenigsmann_defining_z line 850): the source says the rational semilocal ring equals the completed integer ring; it should be the rational localization ℤ_(ℓ); affects nothing.
- **Misprint** in koenigsmann_defining_z at Corollary 22, printed pp.90–91 (koenigsmann_defining_z line 875): the source says the class-one clause uses a one-parameter R¹; it should use S_p from Definition 19; affects nothing.
- **Misprint** in koenigsmann_defining_z at Corollary 22 proof, printed p.91 (koenigsmann_defining_z line 896): the source says the odd residue guard is k+ℤ_(2); it should be k+8ℤ_(2); affects the proof.
- **Misprint** in geometric_categories_and_o_minimal_structures at §4.5, author p.13 (geometric_categories_and_o_minimal_structures line 521): the source says definable choice gives a left inverse to any definable function; it should give a right inverse on the image; affects a stated result.
- **Misprint** in bkt at Appendix A, author p.20 (bkt line 905): the source says an n-manifold's boundary has dimension n; it should have dimension n−1; affects nothing.
- **Misprint** in bkt at Appendix A, author p.20 (bkt line 921): the source says mixed transitions are ψ_j∘φ_i⁻¹ for charts into X; it should be ψ_j⁻¹∘φ_i; affects nothing.
- **Misprint** in peterzil_starchenko_agc at Theorem 3.2, author p.10 (peterzil_starchenko_agc line 503): the source says the second analytic subset lies in an undefined N; it should lie in the common ambient manifold M; affects nothing.
- **Misprint** in peterzil_starchenko_agc at Theorem 4.4 proof, author p.12 (peterzil_starchenko_agc line 603): the source says to apply Theorem 3.2 with A as the second subset; it should use E and bound closure(M_i)∩E; affects the proof.
- **Misprint** in on_the_algebraic_points_of_a_definable_set at Lemma 5.2, author p.8 (on_the_algebraic_points_of_a_definable_set line 358): the source says k coefficients encode all polynomials of degree at most k; it should use k+1 coefficients, retaining the constant term; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5082d6d245439523fa6e31226ab1fe55c8dd2a0a", "job": "RT-LogicAndDefinabilityInNumberTheory~1a", "model": "gpt-6-astra", "worker": "chris-32"} -->
