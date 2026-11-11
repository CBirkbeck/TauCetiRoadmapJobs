<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13499#issuecomment-6792608917 -->
Red team round 1 pass a (codex) of ef42b48

Verdict: needs_changes

1. **F01** (P3) Reducible restriction does not imply several descents

   **Location:** `packages/EllipticCurveModularityTotallyReal/README.md:1236`: “a representation induced from a quadratic subextension of `L/K` would have reducible restriction and several descents.”

   **Claim:** Such an induced representation necessarily has multiple descents up to isomorphism.

   **Witness:** Let F be the splitting field of x³−4x+1 over Q, L=Q(√229). Gal(F/Q)=S₃, Gal(F/L)=C₃. For nontrivial χ of C₃, Ind χ is the unique two-dimensional irreducible S₃-representation; its restriction is χ⊕χ⁻¹.

   **Exact repair text:** Replace that Check with: “The supplied descent theorem requires irreducibility after restriction. For the splitting field F of x³−4x+1 over Q, put L=Q(√229). The representation Ind from G_L to G_Q of a nontrivial character of Gal(F/L)=C₃ restricts to χ⊕χ⁻¹ and is outside this hypothesis. It nevertheless has only one descent up to isomorphism with that restriction: the standard S₃-representation. Reducibility alone does not imply nonuniqueness.”

   **Retest:** The cubic has no rational root and discriminant 229, positive and nonsquare, so F and L are totally real and the Galois groups are as stated. Any descent of χ⊕χ⁻¹ is trivial on G_F, hence factors through S₃. The two one-dimensional S₃-characters restrict trivially to C₃; neither their sums nor repeated characters give χ⊕χ⁻¹. The standard representation is the only possibility. Twisting it by the quadratic sign character gives an isomorphic representation, not a second descent. The replacement retains the failed irreducibility test without the false multiplicity claim.

One false Check is established below. The three declared supplier gaps are treated as contracts, not completed theorems; their future implementations are not certified.

## Verified sound

Read every line of `packages/EllipticCurveModularityTotallyReal/README.md` (1459 lines) and `packages/EllipticCurveModularityTotallyReal/Suggested.lean` (98 lines), the repository rules, the manifest, the design's gap entries and the supplied repair, citation, overlap, library-match and elaborated-signature records. Counts: 2 Lean declarations; 18 numbered README targets, including their subclaims and API bullets; 77 numbered-section Check bullets plus 5 convention witnesses; 9 source works; 20 named roadmap supplier-contract blocks; 33 verified source-locator groups. The source and supplier tables below identify what was verified rather than treating a search hit as verification.

The pins in the package equal `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The diff from the board's main changes only this package. No package source was edited, no Lean command was run, and nothing was posted.

Dependency gate output:

```text
depcheck: 237 roadmaps, 2157 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The internal direction is fields → twisted geometry → eigenspaces → properties and carrier → lattices/endpoints → seed and lifting → specialization → descent/comparison. The comparison theorem §4.2 is conditional on an existing modularity witness, so its use in the CM proof §4.3 does not introduce a cycle with §4.4.

### Lean declarations and headline coverage

Locations in this table are in `packages/EllipticCurveModularityTotallyReal/Suggested.lean`. The supplied elaboration record was compared with the declarations and native definitions; it was not represented as a fresh elaboration by this reviewer.

| Declaration | Section, variables and instances retained | Computed instances and both sides | Result / change |
|---|---|---|---|
| `realCyclotomic_isCMField`, line 58 | §1.1; k : Type u, M : Type v; Field k, NumberField k, IsTotallyReal k, Field M, NumberField M, Algebra k M; n : ℕ, 2<n; IsCyclotomicExtension {n} k M; ζ : M, IsPrimitiveRoot ζ n | k=ℚ,n=3: ζ+ζ⁻¹=−1, left subfield ℚ, maximal real subfield ℚ, [M:ℚ]=2. n=4: sum 0, both subfields ℚ. k=ℚ(√2),n=8: sum √2, both subfields k, [M:k]=2. n=1,2 would give degree 1 and fail CM; excluded. | All necessary binders present; even n intentional. No replacement by the rational-base lemma; no change. |
| `three_five_switch`, line 80 | §2.3; K : Type u; Field K, NumberField K, DecidableEq (AlgebraicClosure K); W : WeierstrassCurve K, W.IsElliptic. Existential W′ carries its own IsElliptic instance before torsion is used. | E[3] has 9 points, E[5] 25; bases have two vectors and exist. K=ℚ gives arithmetic/geometric frame group orders 48/24; K=ℚ(√−3) gives 24/24. Identity on E[5] gives pairing multiplier 1; [2] gives 4≠1 mod 5. A basis change B sends g to B⁻¹gB, determinant still 1. | Quantifiers are ∀basis ∀matrix ∃σ ∀point, not point-dependent σ. Additive equivalences of 5-torsion are automatically F₅-linear. Exact pairing equality, every Galois element and infinitely many j-values are retained; no change. |

The 18 headline groups are §§1.1–1.6, 2.1–2.5, 3.1–3.3 and 4.1–4.4, with §4.4 the endpoint. The two statable groups are present. The module docstring names the others and identifies the missing covers, higher-genus étale cohomology, compatible-system and automorphic/Hilbert-attachment carriers. Searches by those objects in the pins did not locate substitute native carriers. There are no auxiliary definitions, admitted data, stand-in predicates, boundary-case theorems, examples or API padding. Neither retained theorem follows merely by unfolding a definition or applying the pinned rational cyclotomic theorem. The switch needs the nontrivial modular-curve/Hilbert argument.

### Target-by-target adversarial table

All locations here are in `packages/EllipticCurveModularityTotallyReal/README.md`. “No change” means the computed instance does not refute the stated target; it is not a claim to have formalized its proof. The further tables expand the API and Checks.

| Target and location | Instances and computed values on the asserted constructions | Result / change |
|---|---|---|
| §1.1 real cyclotomic data, 475 | n=3: L=ℚ, M=ℚ(√−3), δ(c)=−1; over k=ℚ(√−3), L=M=k and δ=1. At n=15, [L:ℚ]=4, [M:L]=2 and L(μ₃)=L(μ₅)=M. | Arbitrary-base and totally-real assertions separated; no change. |
| §1.2 reflection twist, 548 | In D₆, R³=W²=1 and WRW=R⁻¹. For δ(g)=−1, twisted rotation action WR⁻¹W=R. At m=1, w* =−I and new action is δρ. At m=3, genus=3 and deg ω=4>0. | Effective polarized descent applies; marking supplies uniqueness. No change. |
| §1.3 descended eigenspaces, 611 | n=3: regular module has dimension 6, each of its 3 character pieces dimension 2. The projector on a θ-eigenvector is (1/3)·3=1 and on a different character is (1/3)·0=0. Induction across a nontrivial M/L has rank 4, not 2. | Twisting, not induction, gives the intended rank. No change. |
| §1.4 properties and compatible carrier, 650 | det at good Frob₅ is 5; det at c is −1; Hodge degrees sum 0+1=1. With P=X²−2X+5, roots 1±2i become −3±4i at residue degree 2 and give X²+6X+25. At ramification degree 2 but residue degree 1 they remain 1±2i. | Correct determinant, restriction and bad-set distinctions; no change. |
| §1.5 lattices/congruences, 750 | O[μ₁₅]² evaluated at any integral character is O², including at 3 and 5. Mod p: ψ=1, χ=η; mod 3: η=1, χ=ψ. Thus ranks are 2,2,2,2 and the three reductions agree at p,3,p respectively. | No division by n and no converse about unequal labels; no change. |
| §1.6 elliptic endpoints, 826 | For n=3, w-invariants have dimension 0+2=2; projection from x+w*x to x identifies them with either cubic piece. W₁ trace at inert Frob₅ is −(−2)=2. Twisting back by δ gives −2. | δ and the parameter twist occur separately; no change. |
| §2.1 change of prime, 882 | At 11a1/Frob₃, every member away from 3 gives X²+X+3. At a fixed complex embedding, the same P_v has the same image under ι∘j_ℓ=j. Two distinct coefficient embeddings can instead conjugate P_v. | Semisimple recognition used with fixed labels and embeddings; no change. |
| §2.2 summand lifting, 913 | e=0 gives dimension 0 and is excluded; e=1 for an elliptic curve gives dimension 2 and degrees {0,1}. For p=3, −1=2≠1; for p=2, −1=1 and the theorem excludes it. At p=5 the dual of E[5] has an F₅-model and det ε̄₅⁻¹. | Precisely conditional on the declared general lifting contract; no change. |
| §2.3 3–5 switch, 965 | Fixed-pairing five-level twist has a point (E,id), hence its genus-zero completion is P¹. Three-level frames have total degree 48 and geometric component degrees 24+24. A finite j-map has finite fibers, so an infinite Hilbert subset has infinitely many j-values. | Stronger infinitude is justified by the proof, not attributed to the existence-only source statement; no change. |
| §2.4 mod-three seed, 1034 | GL₂(F₃) has order 48; its derived-chain quotient orders are 2,3,4,2. Restriction to K(ζ₃) removes determinant and leaves the intersection with SL₂. Complex-conjugation determinant is 2. | Solvable, odd residual input has the declared cohomological-weight contract; no change. |
| §2.5 mod-five seed, 1061 | The switched E′ has restricted mod-3 group SL₂(F₃), order 24; line stabilizers have order 6 or at most 4. Thus no line survives. The mod-5 modules of E,E′ agree, and dualization preserves their equality. | Five-adic F₅-model alternative applies; no change. |
| §3.1 simultaneous parameter, 1109 | p=101,d=1 meets p>max(100,3); c(ζ₃)=3 is nonzero mod 5 and 101. Order-101 roots in characteristic 3 cannot satisfy a polynomial of degree ≤4 forcing order ≤80. L(ζ₃)=L(ζ₁₀₁)=M. | Parent specializes all characters at one t over the required larger cyclotomic subgroups; no change. |
| §3.2 seed over L, 1152 | Wη and Wη⁻¹ both have rank 2 and equal H¹(A_t) over L. Residual irreducibility on G_{M(ζ₅)} implies it on the larger G_{L(ζ₅)}. | Mod-five seed applied over L itself; no change. |
| §3.3 three lifts, 1174 | Rows are (known,target,prime)=(η,χ,p),(χ,ψ,3),(ψ,1,p). Residual comparisons are η̄=χ̄ at p, χ̄=ψ̄ at 3, ψ̄=1 at p. | Required irreducibility is available at each row; coefficient changes precede the next row; no change. |
| §4.1 non-CM descent, 1215 | For K=ℚ,p=101, [L:K]=φ(303)/2=100 and Gal(L/K) is abelian. On G_M, δ=1 and W₁=H¹(B_t). δ²=χ_h²=1, so two removals give H¹(E). | Restriction irreducibility and weight-zero/type-(2,0) conversion supplied; no change. |
| §4.2 full comparison, 1245 | Good v: polynomial degree 2, det q. Split multiplicative: N has rank 1, factor (1−q⁻ˢ)⁻¹, conductor 1. Additive y²=x³−x at 2: inertia factor 1, conductor 5. Γℂ((s−1/2)+1/2)=Γℂ(s). | All finite primes and monodromy, not good primes alone; no change. |
| §4.3 CM branch, 1294 | E:y²=x³−x, K=ℚ: KT=ℚ(i), degree 2; induced trace at 3 is 0, at 5 is (−1+2i)+(−1−2i)=−2 and product 5. Over K=ℚ(√2), KT=ℚ(ζ₈), still degree 2. | Distinct HT degrees 0 and 1 force distinct characters and cuspidality; no change. |
| §4.4 endpoint, 1360 | Non-CM x³−x+1 has j=−6912/23, not an algebraic integer; CM x³−x has j=1728. The two branches exhaust geometric endomorphism types. Everywhere good reduction gives all f_v=0 and conductor ideal (1). | No degree, √5 or reduction-type exclusion; no change. |

### Definitions, conventions and API clauses

| Statement / location | Computed positive and negative controls | Result / change |
|---|---|---|
| Elliptic, number-field and parameter domains, 125–128, 548 | Δ(x³−x+1)=−368≠0; Δ(x³)=0. Number fields have characteristic 0 and 0≠1. A separable cubic with t outside its roots has h(t)≠0. | Singular cubics, zero ring, inseparable extensions and empty geometric curves are outside the domains; no change. |
| H¹ versus Tate module, 129–132, 173–176 | At geometric Frob₃, H¹ roots have product 3 and trace −1; Tate roots have product 1/3 and trace −1/3. Their degree pairs are {0,1} and {0,−1}. | Dual and ε⁻¹ signs agree with the pin; no change. |
| Frobenius and half-shift, 133–142, 177–179 | αβ=3; unitary roots α/√3,β/√3 have product 1. Substituting s−1/2 gives 1+3⁻ˢ+3¹⁻²ˢ; s+1/2 gives 1+3⁻ˢ⁻¹+3⁻²ˢ⁻¹. | Reversed shift excluded; no change. |
| Modular / residual modular, 143–149 | Weight-two H¹ gives {0,1}, type (2,0); Tate dual gives {0,−1}, type (2,−2), so fails the specified type. A weight-one Artin lift gives {0,0}, not a cohomological witness. | Missing cohomological residual existence is explicitly a gap, not hidden in a predicate; no change. |
| Character labels, 150–153 | On generator u, θ(u)=ζ, θ⁻¹(u)=ζ⁻¹. For ζ₃, 1+ζ+ζ²=0 gives the correct projector; using θ instead of θ⁻¹ projects to the inverse label. | Pullback convention is fixed; no change. |
| Conductor, 154–157 | Good exponent 0, split multiplicative exponent 1, y²=x³−x at 2 exponent 5. Products are respectively unit ideal, (11), (32) in the stated rational examples. | Artin conductor retained; no algorithm planned. |
| Semisimplified congruence, 158–159 | A nonzero upper-triangular extension and its diagonal semisimplification both have characteristic polynomial (X−1)(X−a), but only the latter is a direct sum. | Congruence does not assert equality of arbitrary integral lattices. |
| General twisting convention, 160–168, 185–191 | b³=2, g(b)=ζ₃b: φ*ω=bω′; g(φ*ω)=ζ₃bω′. a_g acts by ζ₃⁻¹ on x; (a_g⁻¹)* acts by ζ₃ on ω, whereas a_g* acts by ζ₃⁻¹. | Order-three witness distinguishes the inverse; no change. |
| Quadratic twist sign, 182–184 | Over F₅, #E=8 and #E^(2)=4; a=6−8=−2 and a′=6−4=2=(−1)a. | Positive and nonsquare twists distinguished. |
| Column convention, 169, 592 | R(1,0)=(0,1), R(0,1)=(−1,−1); WRW=[−1,1;−1,0]=R⁻¹. Row multiplication would send (1,0) to (0,−1). | Lean mulVec agrees; no change. |
| §1.1 primitive-root independence | ζ⁻¹ has the same sum; ζ²+ζ⁻²=(ζ+ζ⁻¹)²−2. A primitive replacement generates the same field in both directions. | No change. |
| §1.1 quadratic equation and δ | For n=3, X²+X+1 has roots ζ₃,ζ₃⁻¹ and δ(c)=−1; after adjoining ζ₃, δ=1 and degree=1. | Both directions of δ trivial iff M=L verified. |
| §1.1 abelianness and base extension | Over ℚ, Gal(ℚ(μ₁₅)/ℚ) has order 8, real quotient order 4; over k′=ℚ(√5), real compositum degree is 2 over k′. | Quotients/subgroups of the cyclotomic abelian group, not arbitrary normal-closure groups; no change. |
| §1.1 divisors | n=15,d=3 gives ζ_d=ζ₁₅⁵ and δ_d(c)=−1=δ(c). d=1,2 gives δ_d(c)=1≠−1. | The d≥3 restriction is necessary and present. |
| §1.2 cocycle / marked uniqueness | e(g)+e(h)=e(gh) mod 2 gives w^e(g)w^e(h)=w^e(gh). A marked automorphism f with φf=φ is f=1; an unmarked curve can have w≠1. | “Unique” is correctly marked; no change. |
| §1.2 base change and maps | Over M, e=0 and a=1. For 45→15→3, quotient exponents 3·5=15 equal 45→3. w descends to −1 on the rotation quotient, and to 1 on its own quotient. | Both quotient targets and tower composition agree. |
| §1.2 Jacobian | genus(C³)=3 gives dim Pic⁰=3 and H¹ rank 6; m=1 gives dim 1 and rank 2, handled as an elliptic twist. | No genus-zero or zero-rank polarization shortcut. |
| §1.3 restriction and reflection | On G_M, δ=1, so Wθ=Vθ. w* sends eigenvalue ζ to ζ⁻¹, with w*²=1, giving inverse isomorphisms. | No change. |
| §1.3 quotient and coefficients | n=15,d=3 gives degree 5, invertible over Q₅ but not Z₅; rational pullback has inverse (1/5)norm on invariants. | Rational assertion does not assert an integral splitting. |
| §1.4 pairing | For order-3 θ, θ²≠1 forces cup(x,y)=0 within Wθ. Composing the second argument with w pairs eigenvalues ζ·ζ⁻¹=1; swapping arguments contributes −1. | Perfect alternating rank-two form gives determinant ε⁻¹, including over Q₂. |
| §1.4 finite coefficient realization | n=3, ℓ=2: eigenvalues lie in Q₂(ζ₃); the θ projector has coefficients in this field, giving rank 2 there, then rank 2 after scalar extension. | Actual eigenspace supplies the model; no Schur-index assumption. |
| §1.4 same-place embeddings | j′=σj sends eigenvalue j(θ(u)) to σj(θ(u)); (1⊗σ)(a·x)=σ(a)(1⊗σ)x. | Comparison is semilinear, not an incorrectly asserted linear equality. |
| §1.4 reflection polynomials | Wθ and Wθ⁻¹ are conjugate by a G_L-equivariant involution; their traces and determinants, hence X²−tX+q, coincide. | Same bad set and same labels as stipulated. |
| §1.4 duality | α=1+2i,β=1−2i,q=5: α⁻¹=β/5, β⁻¹=α/5; both root multisets are {(1+2i)/5,(1−2i)/5}. −{0,1}={−1,0}={0,1}−1. | Root multisets, not individually ordered roots; no zero denominator. |
| §1.5 evaluation quotient | On O[U]², quotient by u−θ(u) sends each regular summand to O and hence produces O²; rank 0 and rank 1 give 0 and O and fail. | Construction determines the lattice, not an arbitrary stable submodule. |
| §1.5 Galois action and rationalization | Twisted G_L action commutes with u, so g(u−θ(u))x=(u−θ(u))gx; untwisted δ=−1 sends θ to θ⁻¹. Rationalization sends the quotient to the rank-two projector image. | Continuity and invariance pass through the finite O-module quotient. |
| §1.5 extension / restriction / reduction | O²⊗O O′=O′²; restricting to G_M removes the cocycle; O²/𝔪=κ². Equal evaluation maps give exactly the same residual tensor product. | Compatible with all three operations; no converse claimed. |
| §1.6 twists and endpoints | W₁=H¹(E)⊗χ_h⊗δ; multiplication by δχ_h gives H¹(E) because δ²χ_h²=1. When h(t) is a square, χ_h=1 but δ can still be −1. | Neither twist is silently discarded. |
| §4.2 central character and uniqueness | det(H¹)=ε⁻¹, detρπ=χπε⁻¹, so χπ=1. Same good traces −1 and determinant 3 at the witness place give the same local polynomial; equality at the density-one set, not this single place, invokes multiplicity one. | No single-prime uniqueness claim. |
| §4.2 unitary rationality and local types | Good Hecke data t=a∈Z,s=1 give coefficient field Q in weight two. Split St has N≠0 and conductor 1; setting N=0 changes its inertia-kernel factor and conductor. | Full WD needed and explicitly supplied. |
| §4.3 induction and differential embedding | [i]*dx/(2y)=i·dx/(2y); conjugation gives −i, so endomorphism action has kernel G_{KT}. H¹ has two KT-character lines interchanged by the other coset, hence induced dimension 2, not two K-lines. | Domain characteristic 0, and the gap includes the field-of-definition equivalence. |

The remaining standard boundary classes do not enlarge these domains: q is the size of a finite residue field, hence q≥2; n and its divisors in the tower are positive; all coefficient fields have characteristic zero before reduction; ℓ is prime; lattices have finite rank two over DVRs. No division by a natural-number zero, arbitrary topology, empty basis, non-Noetherian base, non-quasi-separated scheme or square-zero thickening is admitted by a hidden general binder. The identity extension has residue degree 1 and fixes all maps and polynomials. Inseparable and equal-characteristic test cases enter only the explicitly labelled negative differential examples, not the characteristic-zero theorems.

### All numbered-section Checks

Rows use section.Check-number, with the starting README line. “Pass” records the displayed computation; it does not turn an illustrative Check into a general proof.

| Check | Values / positive and negative sides | Result / change |
|---|---|---|
| 1.1.1, 527 | ζ₃+ζ₃⁻¹=−1; correct L=Q has [M:L]=2; wrong L=M has degree 1 and δ=1. | Pass; none. |
| 1.1.2, 529 | x=2cos(2π/9) satisfies x³−3x+1=0; φ(9)/2=3, φ(15)/2=4. √5=1+2(ζ₅+ζ₅⁻¹) lies in the latter real field. | Pass; none. |
| 1.1.3, 531 | k=Q(√−3), n=3: M=L=k, δ(coset)=1. | Pass; totally-real hypothesis not dropped. |
| 1.1.4, 533 | k=Q(i), n=3: sum −1 gives L=Q(i), whereas Q(ζ₁₂) has maximal real subfield Q(√3). i is nonreal. | Pass; none. |
| 1.1.5, 536 | n=4: i+(−i)=0; n=6: 2cos(π/3)=1; both real subfields Q. | Pass; even n intentional. |
| 1.1.6, 538 | n=8 gives √2; n=5 gives (√5−1)/2. Over the named real bases L=k; over Q at n=5, [L:Q]=2. | Pass; excludes constant L=k. |
| 1.1.7, 542 | n=1,2 give sums 2,−2 and degree 1. At n=3,d=1 or 2: δ_d(c)=1, δ(c)=−1. | Pass; bounds necessary. |
| 1.2.1, 592 | R²=[−1,1;−1,0], R³=I; W²=I; WRW=R² and WR²W=R. | Pass; nonabelian D₆ witness. |
| 1.2.2, 596 | k=Q(√−3): e(g)=0 and w^e(g)=I for all g. | Pass; trivial cocycle gives original curve. |
| 1.2.3, 598 | R^aR⁻¹R⁻a=R⁻¹≠R, while WR⁻¹W=R. | Pass; rotation-valued substitution fails. |
| 1.2.4, 601 | On genus-one H¹, [−1]*=−I; δ=−1 changes trace −2 to 2 at 5. | Pass; sign fixed. |
| 1.2.5, 603 | n=5 cubic cover: 4 branch points, 2g−2=4(3−1)=8, g=5. n=15: 2 branch points, 2g−2=4, g=3. | Pass; 3∣n necessary. |
| 1.3.1, 636 | dim H¹=2·3=6=2+2+2. | Pass; none. |
| 1.3.2, 638 | θ=1 piece is H¹ of genus one, rank 2; trivial representation would not have determinant ε⁻¹. | Pass; not a rank-one character. |
| 1.3.3, 639 | Nontrivial δ: induced rank 2·2=4 and W⊕Wδ. Trivial δ: index 1, rank 2·1=2. | Pass; both cases distinguished. |
| 1.3.4, 645 | 1/3 exists in Q₃; v₃(1/3)=−1 prevents its use in Z₃. | Pass; rational/integral scopes differ. |
| 1.4.1, 723 | For cubic ζ, invariance gives cup=ζ²cup, hence (1−ζ²)cup=0 and cup=0. Reflection changes eigenvalue product to 1. | Pass; excludes unmodified pairing. |
| 1.4.2, 725 | det(H¹⊗δ)=ε⁻¹δ²=ε⁻¹; at c, value −1·1=−1. | Pass; none. |
| 1.4.3, 727 | Q(√−3) has r₁=0,r₂=1, so zero real-place conditions. Totally real Q has r₁=1 and determinant −1. | Pass; explicitly labelled vacuity, not a proof of oddness. |
| 1.4.4, 729 | H¹ weight sum 0+1=1; proposed {0,2} sum 2. At Frob₅ the correct determinant is 5, Tate convention gives 1/5. | Pass; separates both wrong conventions. |
| 1.4.5, 731 | #B(F₅)=8,a=−2; δ₅=−1 gives t=2. Squared roots −3±4i give t=−6,det=25, #B(F₂₅)=26+6=32. | Pass; f=2 used. |
| 1.4.6, 738 | Q(√5)/Q at 5 has e=2,f=1. Member polynomial stays X²−2X+5; restricted stored polynomial is absent. 2 is nonsquare mod 5, so δ stays −1. | Pass; e cannot replace f. |
| 1.5.1, 799 | v₃(1/3)=−1, v₃(root of unity)=0; evaluated free module has rank 2. | Pass; field not contained in O. |
| 1.5.2, 802 | In characteristic 3, X³−1=(X−1)³; projector coefficient 1/(3p) has valuation −1 when p≠3. | Pass; no integral idempotent. |
| 1.5.3, 805 | η̄=1 mod 3, so η- and 1-evaluation maps are identical; Wη≡H¹(B)δ at 3. | Pass; explains why the five-adic seed is used. |
| 1.5.4, 809 | Mod 3, χ̄=ψ̄ has order 5 when n=15, η̄=1. After adjoining μ₁₅ and J[3], all actions on all rank-two reductions are I₂, despite distinct labels. | Pass; converse to equality-of-label criterion correctly rejected. |
| 1.5.5, 817 | δ=−1 sends θ(u)=ζ to ζ⁻¹≠ζ for odd nontrivial order; θ=1 remains 1. If δ=1 every label is fixed. | Pass; kernel stability has the stated exceptions. |
| 1.6.1, 849 | W₁ has w=−I, invariants dimension 0; exchanged cubic pieces have diagonal invariants dimension 2. Total 2. | Pass; none. |
| 1.6.2, 851 | δ(Frob)=−1 gives traces −a and a on W₁ and H¹(B); for a=−2 these are 2 and −2. | Pass; δ is required. |
| 1.6.3, 853 | 45/3=15, 3p/3=p, 3p/p=3; norm∘pullback has precisely those scalars, with positive ℓ-adic valuation at divisors. | Pass; rational comparisons only. |
| 1.6.4, 857 | w²=1 exchanges two dimension-2 cubic pieces, each identified with H¹(A), dimension 2. | Pass; same endpoint. |
| 2.1.1, 903 | Extension matrix [1,b;0,a] and diagonal [1,0;0,a] both have (X−1)(X−a); a nonsplit extension has no invariant complement. | Pass as the recognition-step control. |
| 2.1.2, 905 | 11a1 has #E(F₃)=5, so a₃=4−5=−1 and polynomial X²+X+3. | Pass; none. |
| 2.1.3, 907 | For order 5, c(ζ)=(5−√5)/2, c(ζ²)=(5+√5)/2, so the corresponding generic monodromy-word traces 2+c² are (19∓5√5)/2. Inversion leaves c unchanged. | Pass for the warning against changing labels; no assertion that all special fibers have distinct conjugate pieces is needed. |
| 2.2.1, 942 | −1=1 in F₂ but −1≠1 in F₃ and F₅. | Pass; p=2 excluded. |
| 2.2.2, 944 | A multiplicative Tate curve has nonzero rank-one monodromy; a potentially Barsotti–Tate representation has potentially good reduction and N=0. | Pass; restricted older theorem is insufficient. |
| 2.2.3, 947 | PSL₂(F₅)≅A₅ has order 60 and trivial abelianization; L totally real and √5∈L gives [L(ζ₅):L]=2, an impossible nontrivial cyclic quotient of A₅. | Pass; F₅-model assumption retained. |
| 2.2.4, 951 | B²=2I, det B=3; a²=3 gives C²=6I=I and det C=9=4. Squares in F₅× are {1,4}, so [B] is outside the fixed PSL₂(F₅). | Pass for the stated coordinate/square-class warning. C itself is conjugate to diag(1,−1); this example is not a claim that the cyclic representation generated by C has no F₅-model. |
| 2.2.5, 957 | E[5] is F₅² with det ε̄₅; its dual has det ε̄₅⁻¹ and remains F₅². | Pass; none. |
| 2.2.6, 959 | At g with ν(g)≠1, det r(g)=ε⁻¹(g)ν(g)≠ε⁻¹(g). Artin degrees {0,0} differ from {0,1}. | Pass; excluded objects identified. |
| 2.3.1, 1012 | Group orders: SL₂(F₃)=24; Borel=12; split/non-split Cartan normalizers=8,16. None can contain a subgroup of order 24. | Pass; large image rejects these CM/reducible cases. |
| 2.3.2, 1015 | Over Q(√−3), determinant ε̄₃=1, hence image order ≤24, not 48. | Pass; avoids impossible GL₂ request. |
| 2.3.3, 1017 | Two pairing values, two geometric components of degree 24. Arithmetic determinant image has order 2 over Q and 1 over Q(√−3). | Pass; integral versus geometrically integral distinguished. |
| 2.3.4, 1024 | (E,id) is a rational point. In contrast x²+y²+z²=0 has no Q-point although genus 0. | Pass; point hypothesis essential. |
| 2.3.5, 1026 | e₅(2P,2Q)=e₅(P,Q)^4, and ζ₅⁴≠ζ₅. id gives ζ₅=ζ₅; both maps commute with Galois. | Pass; symplectic condition independent. |
| 2.4.1, 1052 | Determinant kernel equals SL₂; for full GL₂(F₃), restriction image has order 48/2=24. | Pass; follows from cyclotomic determinant, not arbitrary subgroup intersection. |
| 2.4.2, 1054 | The order-8 split Cartan normalizer has determinant kernel C₄, generated by J=[0,1;−1,0]. Over F₉, J has eigenvalues ±i and two eigenlines; a determinant−1 element interchanges them. Absolute irreducibility is lost on restriction. | Pass; excluded by restricted absolute irreducibility. |
| 2.4.3, 1056 | Orders 48→24→8→2→1 give quotients C₂,C₃,C₂×C₂,C₂. | Pass; solvability includes nonabelian Q₈. |
| 2.5.1, 1079 | Rational 5-torsion supplies a fixed F₅-line of dimension 1 in the dimension-2 module of 11a1. | Pass; criterion is not vacuously universal. |
| 2.5.2, 1081 | Seed-prime sequence is 5 once; lifting-prime sequence is p,3,p. | Pass; no fifth-prime congruence. |
| 2.5.3, 1083 | GL₂(F₅) order 480; determinant kernel SL₂ order 120; projective kernel center order 2, quotient order 60. | Pass; first five-adic alternative fails in generic elliptic case, second applies. |
| 3.1.1, 1135 | c(ζ₃)=3; at p=101 the order-101 reduction exists in F_(3^100), at p=7 in F_(3^6). Equation c²=±4 has degree ≤4 in λ, forcing its order ≤3⁴−1=80. | Pass; distinction between nonvanishing and regular-word bound retained. |
| 3.1.2, 1143 | p>100 gives p≠3,5, hence three distinct primes. | Pass; none. |
| 3.1.3, 1144 | For p=101, SL₂ has order p(p²−1)=1,030,200 and trivial abelianization; an abelian quotient kills it. Multiplying both eigenvalues by −1 leaves their ratio unchanged. | Pass; restriction and twist do not destroy the requisite image. |
| 3.1.4, 1147 | Degree d produces d conjugate factors, not one. The parent uses the common normal closure and a union bound 2dp/(p²−1)<1 when p>2d+1. | Pass; stronger prime choice preserved. |
| 3.2.1, 1165 | An invariant line for G_{K(ζ₅)} would give a line for its subgroup G_{L(ζ₅)}; the latter has zero invariant lines by hypothesis. | Pass; subgroup direction correct. |
| 3.2.2, 1169 | Congruence primes {p,3,p} contain no 5. | Pass; none. |
| 3.2.3, 1170 | Both cubic pieces have dimension 2 and equal trace polynomials through H¹(A_t); η⁻¹ has order 3 as well. | Pass; two labels, one seed. |
| 3.3.1, 1194 | First conclusion is a realization at p; row two needs a realization at 3. §2.1 supplies the 3-member with the same P_v. | Pass; no silent prime change. |
| 3.3.2, 1196 | Good ordinary and supersingular cases have N=0; multiplicative cases N≠0. Both are potentially semistable of weights {0,1}. | Pass conditional on the stated universal lifting contract. |
| 3.3.3, 1198 | p>100 and 3≠5 make all three lifting primes unequal to 5. | Pass; five-adic exception used only in seed. |
| 4.1.1, 1236 | S₃ standard representation restricts to χ⊕χ⁻¹ on C₃, hence two stable lines, but has exactly one descent isomorphism class, not several. | Fails; R01 replaces the nonuniqueness claim. |
| 4.1.2, 1238 | Quadratic δ is 1 on subgroup and −1 on its other coset; ρ and ρδ have identical restrictions but may differ over K. | Pass; supplier selects matching global ρ. |
| 4.1.3, 1240 | For h=a²≠0, χ_h=1 and y↦ay identifies twists; χ_h²=1 for every nonzero h. | Pass; h=0 excluded by U. |
| 4.2.1, 1281 | Split multiplicative 11a1: N has rank 1, a₁₁=1, factor (1−11⁻ˢ)⁻¹ and f₁₁=1. | Pass; forgetting N changes the answer. |
| 4.2.2, 1284 | Δ=−16·23, c₄=48≡2 mod 23; 5 is absent from the square residues mod 23. In the quadratic residue extension both split and nonsplit multiplicative tori split; q=23²=529. | Pass; no good-reduction substitution. |
| 4.2.3, 1287 | E:y²=x³−x has conductor 2⁵=32; additive factor degree 0, multiplicative degree 1, good degree 2. | Pass; bad-prime factor is not a good-prime polynomial. |
| 4.2.4, 1289 | Γℂ((s−1/2)+1/2)=Γℂ(s), with h¹⁰=h⁰¹=1. | Pass; shift correct. |
| 4.3.1, 1334 | x³−x: #F₃=4→a₃=0; #F₅=8→a₅=−2; (−1+2i)(−1−2i)=5. | Pass; inert trace and split norm checked. |
| 4.3.2, 1337 | x³+1 over F₅ has 6 points, a₅=6−6=0; 5≡2 mod 3 is inert in Q(√−3). | Pass; none. |
| 4.3.3, 1338 | [Q(√2,i):Q(√2)]=2 and compositum Q(ζ₈). Over Q(i), extension degree is 1 and the two characters are already split. | Pass; cuspidal branch has the right domain. |
| 4.3.4, 1341 | d(−x)/(2iy)=i·dx/(2y); conjugation sends i to −i, so [i] is not Q-rational and is Q(i)-rational. | Pass; field criterion discriminates. |
| 4.3.5, 1347 | Over Q(i), action on Z[i] is trivial, kernel all of G_{Q(i)}. Over Q it has quotient of order 2. | Pass; both sides of the field criterion. |
| 4.3.6, 1350 | Char 2: Δ=−27=1, ω=dx, Frob*ω=2x dx=0. Char 3: Δ=64=1, Frob*ω=3x²dx/(2y³)=0. | Pass; nonzero Frobenius has zero differential, refuting characteristic-p injectivity. |
| 4.4.1, 1376 | K=Q gives degree 1, weight 2 and rational coefficients; 11a1 has conductor 11 and the preceding factors. | Pass; BCDT specialization, not a second owner. |
| 4.4.2, 1378 | Degrees 2,3,4 all admit p>max(100,2d+1). For Q(ζ₁₅)⁺, d=4 and √5∈K; p=101 still clears the numerical bound. | Pass; no degree/√5 exclusion. |
| 4.4.3, 1381 | Everywhere good gives f_v=0 for all v; product of prime ideals to exponent zero is (1), yielding level 1. | Pass; no ramified bad-prime omission. |

Each of the five new geometric/field definitions in §§1.1–1.5 has at least three discriminating Checks. The modularity conventions are tested by the type/duality witness, the wrong weight-one witness and the single-prime/all-prime comparison. Boundary cases used as Checks have not been copied into `Suggested.lean`.

### Supplier resolution and ownership

All supplier sections were resolved against main or the supplied current open head, not remembered numbering. The 20 rows below account for the 20 named roadmap contract blocks. These are contract checks; reviewing a supplier's complete proof plan is a different task.

| Supplier | Cited sections / names checked | Contract comparison |
|---|---|---|
| ModularCurves, main | §0E; Layers 3, 5B | Effective projective-curve descent with ample bundle; full and fixed-pairing levels ≥3. Genus m≥3 supplies the ample canonical bundle; the switch uses fine levels 5 and 15. |
| EllipticCurves, main | Layers 0.5, 4.5a, 5 | Curve/morphism descent, local model comparison and quadratic twists. No global minimal model is inferred. |
| JacobianChallenge, main | Layers D–F | Pic⁰ and Jacobian for a smooth proper curve without a chosen rational point. Applicable to the unpointed reflection quotient. |
| EllipticCurveModularityImaginaryQuadratic | §0.2; §§1.1–1.3; §3.1; §§4.1–4.4; §5.1; §§7.1,7.4; comparison with §§8.1,8.5,8.6 | All named cover, regular-module, quotient, lattice, large-image and specialization targets exist. §7.4 explicitly works over arbitrary number fields with the normal-closure prime bound; its stronger decomposed-generic conclusion need not be used. §0.2 supplies fixed-pairing twists and rationality at 3,5, not the new infinite three-image switch theorem. |
| AutomorphicGaloisRepresentations | §§3.10–3.14, 4.4, 4.7 | Unrestricted Hilbert attachment, geometric characters, determinant/oddness/irreducibility and full finite-place WD comparison, including v∣ℓ. Its geometric Frobenius and twist conventions agree. |
| AutomorphicGaloisRepresentationsPartII | AG2.0 and AG2.P, especially “Independent classical and Hilbert members” | IsAttached, algebraic character avatars and weak-system predicates exist; Hilbert member identification is independent of CM-only constructions. Weight-zero rank-two attachment is the type-(2,0) H¹ convention. |
| PotentialAutomorphyInfrastructure | §2.3, `soluble_base_change_and_descent`, part (2) | Finite Galois soluble totally real extension with irreducible restricted representation; matches L/K and H¹(B_t). Does not assert descent merely from an arbitrary automorphic restriction. |
| GL2AutomorphicRepresentationsAndTransfer | R16.2–R16.4; R16.6.3–R16.6.4; R17.4.16; R17.5.14 | Local normalization, conductors, archimedean factors, multiplicity one, weight conversion and quadratic induction exist. R17.5.14 gives weight one; the cohomological-weight upgrade is correctly a gap. |
| ArithmeticGaloisRepresentations | Layers 1–3; §§4.1,5.3,6.1–6.2 | `GaloisRep.IsOdd`, `GaloisRep.iso_of_frobenius_charpoly_eq`, `TateModule.residualRep` occur in the cited sections. The three resolver warnings are false positives. Continuous semisimple recognition, stable lattices and the determinant adapters have the needed domains. |
| InverseGaloisAndArithmeticFundamentalGroups | IG.2.4, IG.2.6, IG.2.7 | Number-field Hilbert irreducibility and full-group specialization apply to integral covers/components. The switch does not incorrectly require the entire frame torsor to be geometrically integral. |
| ModularCurvesPartII | §4.10, `fixedPairingGeometricConnectedness` | Fixed-pairing level N≥3 geometric connectedness includes N=15. |
| SmallRamificationAndAbelianVarietyBaseCases | §5.0d | Raw compatible-system carrier supports finite coefficient fields, rank two, restriction, dual and twist. Restriction enlarges the bad set by ramification; §1.4 retains that convention. |
| PotentialModularityAndCompatibleSystems | §§1.1,1.6 | Compatible-system conventions and automorphy predicate. The package proves the totally real change-of-prime consequence, without constructing another carrier. |
| AbelianSchemesAndArithmeticModuli | A4.1; A6, especially A6.11 | Tate/cohomological realizations and coefficient-independent characteristic polynomials of endomorphisms. Applies to the good reduction of Jδ and Frobenius composed with rotations. |
| NeronModelsAndSemistableAbelianVarieties | §§3.10,5.1,5.3,5.6,6.10 | Semistable reduction, NOS, residue-prime comparison, all local factors and compatible systems of abelian varieties. §5.3 retains ramified bases and p=2; its Hodge sign is converted by H¹/Tate duality. |
| FaltingsFinitenessAndIsogenyTheorems | R28.4 | Semisimplicity of rational Tate realizations over number fields; duality and idempotents give semisimplicity of each H¹ summand. |
| ShimuraVarieties | §5.3 | CM algebra/type action over C, not the endomorphism-field descent. Package explicitly leaves the latter to the CM gap. |
| EtaleCohomologyFoundations, main | §0.11 | Curve trace and perfect cup-product duality with Tate twist. Reflection gives the alternating pairing on a character summand. |
| GL2ModularityLifting | Layer 5, especially §§5.7,5.10, and declared addition after §5.10 | Existing local-matching, potentially-Barsotti–Tate/residue-field statements are not silently substituted for the needed universal potentially-semistable result. The latter is explicitly contracted. |
| ComplexMultiplicationAndExplicitReciprocity | Layer 1; §4.1; rational-base §4.2 | §4.1 supplies the actual Hecke character and CM Tate components once endomorphisms are defined; §4.2 is rational-base induction. The endomorphism-field criterion for arbitrary characteristic-zero bases is the named Layer-1 gap. |

The three slugs in `design/plan.json` and the README's Exact supplier contracts agree. Their suppliers and insertion sections agree. Each has one mathematical output: universal weight-two lifting, cohomological residual modularity, or the differential/endomorphism-field equivalence. The related older lifting and weight-one targets do not already provide those conclusions. The characteristic-zero field criterion includes Galois equivariance and the individual endomorphism descent equivalence, not just existence of some finite endomorphism field.

Ownership was searched by objects using the roadmap search tool, the supplied open heads, main/Completed and the pins. The parent owns the arbitrary-number-field geometry, fixed-pairing twists, integral regular module and simultaneous specialization; this package imports them. Its new owner role is reflection descent to the real cyclotomic subfield and the totally real modularity argument. No duplicate fully qualified name of either Lean theorem was found. The pinned rational-base CM theorem is a strict special case, not a duplicate of the relative conjunction.

The nearest scopes were compared: EllipticCurveModularityPartIIGL2TypeAbelianVarieties treats GL₂-type varieties over Q and Q-curves; EllipticCurveModularityWild3Adic treats the rational wild-three/local-switch route; AbelianSurfacesModularity treats dimension two rather than these rank-two elliptic systems; PotentialModularityAndCompatibleSystems supplies potential rather than unconditional base-field modularity. HilbertModularForms §11.3 has exactly the stated conductor/all-factor downstream interface. The overlap record lists no shared-folder conflict or dropped cited identifier.

The later AdelicImagesAndModularCurves §3.4 CM-case paragraph also uses the number-field specialization of the differential criterion (`TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:1628`). This is not an upward input here: the package assigns the general result to the earlier ComplexMultiplicationAndExplicitReciprocity through its gap. It does not take ownership of a second field-of-definition construction.

### Pinned interfaces and absence/padding probes

| Native source | Declarations / inspected content | What it supplies and what it does not |
|---|---|---|
| `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean` | `IsTotallyReal`, `IsTotallyComplex`, `maximalRealSubfield` at 126 and `IsTotallyReal.le_maximalRealSubfield` at 140 | Fixed under conjugation in every complex embedding, not a single chosen real embedding. |
| `Mathlib/NumberTheory/NumberField/CMField.lean` | `IsCMField` at 70; `CMExtension.eq_maximalRealSubfield` at 456; `IsCMField.ofCMExtension` at 510; `IsCyclotomicExtension.Rat.isCMField` at 564 | Totally complex plus quadratic over the maximal real field. Rational cyclotomic theorem alone proves neither the relative case nor the chosen intermediate-field equality. |
| `Mathlib/NumberTheory/Cyclotomic/Basic.lean` | `IsCyclotomicExtension` at 74 | Roots generate the extension and primitive roots exist; an arbitrary larger ambient field is not silently permitted. |
| Mathlib Weierstrass, primitive-root, intermediate-field, basis and special-linear files cited in README 207–218 | `WeierstrassCurve.IsElliptic`, `WeierstrassCurve.j`, `IsPrimitiveRoot`, `IntermediateField.adjoin`, `Module.Basis.equivFun`, `Matrix.SpecialLinearGroup` | Invertible discriminant, actual j-value, native field and finite-module carriers. They do not assert the prime switch. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:77` | `WeierstrassCurve.torsionGaloisAction` | Field automorphisms act on the torsion subgroup of actual points; action is not a free representation parameter. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/Torsion/Structure.lean:51` and 149 | `pointTorsionModule`; `nonempty_basis_torsionBy` | Canonical ZMod N-module structure; a Fin 2 basis over a separably closed field for nonzero invertible N. AlgebraicClosure K and N=3,5 satisfy these hypotheses. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/WeilPairing/Basic.lean:225` | `weilPairing` | Pairing on torsion points with values in Additive(rootsOfUnity N F); equality in the wrapper is exact multiplicative-pairing equality. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/WeilPairing/Galois.lean:104` | `WeierstrassCurve.weilPairing_torsionGaloisAction` | Galois equivariance. The AddSubgroup/Submodule torsion carriers coincide, as the file explicitly notes. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Determinant.lean:52` | `TauCeti.det_tateModuleGaloisRepresentation` | Integral Tate determinant ε, for prime ℓ invertible in the separably closed extension. H¹ uses its dual ε⁻¹. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean` | `quadraticTwistOf`, `quadraticTwist`, `quadraticTwistPointEquiv`, equivariance theorem at 945 | Actual quadratic twists and character-twisted point action, not generic reflection twists of higher-genus covers. |

The three additional Tau Ceti imports exist and are used. No root TauCeti import, other-roadmap import, set_option, lemma declaration, sorry-defined data, #eval, #synth or placeholder conclusion occurs. There are no lost section hypotheses in the supplied elaborated signatures. The field theorem's two universes remain independent; all objects in the switch lie over the single K and its native algebraic closure.

### Source-locator audit

The following 33 locator groups were read in the nine supplied legal extractions, at the versions recorded in `sources.toml`. No new source or missing-text request was necessary. Page numbers below are the source's printed/preprint pages, not PDF offsets. The two subscript/quotient typographical issues listed at the end were also checked visually in the cached PDFs; the omitted cubic-divisibility qualification was inspected on the printed page as well.

| # | Source and exact locator | Extraction witness and comparison |
|---|---|---|
| 1 | LeHung26, Theorem 1.1, p.2 | LeHung26 line 86: theorem conditional on the two geometric inputs. Package identifies and imports their owners rather than claiming the source is unconditional. |
| 2 | LeHung26, Remark 1.3, p.3 | LeHung26 line 125 and line 136: distinction between five-adic seed and the cubic congruence. |
| 3 | LeHung26, Conventions, p.4 | LeHung26 line 150: H¹ determinant ε⁻¹ and HT degrees {0,1}; dualization for Tate-normalized lifting references. |
| 4 | LeHung26, §§2.1–2.4, p.5 | LeHung26 line 189, line 206, line 214 and line 221: rank-two pairing, integral evaluation, residual monodromy and change of coefficient prime. The cubic clause needs the qualification recorded below. |
| 5 | LeHung26, Proposition 3.1, p.6 | LeHung26 line 231: excludes 2 and 5. Package's five-adic extension is separately contracted, not falsely attributed to this proposition. |
| 6 | LeHung26, Lemma 3.2, (9)–(11), p.6 | LeHung26 line 237 through line 249: reflection twist, descended systems, congruences and endpoint signs. |
| 7 | LeHung26, §3.3, p.6 | LeHung26 line 250 through line 260: parameter requirements; package imports the parent's explicitly strengthened normal-closure/general-degree specialization. |
| 8 | LeHung26, §3.4 and table, p.7 | LeHung26 line 264 through line 271: seed, p/3/p lifts and descent. |
| 9 | LeHung26, Lemma 5.1, p.9 | LeHung26 line 357 through line 360: irreducible restriction and soluble descent. |
| 10 | LeHung26, §5 compatibility and CM paragraphs, p.9 | LeHung26 line 361 through line 366: all-prime comparison and CM induction. Detailed all-place interfaces are named suppliers. |
| 11 | OpenAI26, Proposition 5.1 and proof, pp.12–13 | OpenAI26 line 480: rank, determinant, HT degrees, semisimplicity and compatibility. Package changes the base only after reflection descent. |
| 12 | OpenAI26, Proposition 5.2, p.13 | OpenAI26 line 521: cubic and trivial elliptic realizations. Package adds the δ factor forced by its twist. |
| 13 | OpenAI26, Lemma 5.3, p.13 | OpenAI26 line 547: integral character evaluation; no integral projector at primes dividing n. |
| 14 | OpenAI26, Corollary 5.4, p.14 | OpenAI26 line 571: congruence order p,3,p. |
| 15 | OpenAI26, Proposition 8.4, p.23 | OpenAI26 line 990: source is imaginary-quadratic. Arbitrary-number-field extension belongs explicitly to the parent's §7.4, not this source alone. |
| 16 | OpenAI26, §9.4, pp.27–28 | OpenAI26 line 1200 through line 1215: CM field-of-definition and induced/split branches. General differential descent is contracted to the CM owner. |
| 17 | FLHS15, §1 and Theorem 1, p.2 | FLHS15 line 66 through line 87: normalization/interface and real-quadratic endpoint. |
| 18 | FLHS15, Theorems 2–3, p.3 | FLHS15 line 116 and line 127: elliptic lifting and mod-3/mod-5 criteria over totally real fields. |
| 19 | FLHS15, §2, pp.5–6 | FLHS15 line 221 through line 265: five-adic exceptional projective image and determinant/F₅-model argument; no √5 exclusion is imposed on elliptic curves. |
| 20 | FLHS15, Proposition 4.1 and Lemma 4.2, p.8, proof continuing p.9 | FLHS15 line 343 and line 355: determinant-kernel restriction and Cartan-normalizer case. The quotient typo in the proof is recorded below. |
| 21 | FLHS15, Theorem 6 and Corollary 5.1, p.9 | FLHS15 line 404 and line 411: mod-three residual modularity and elliptic modularity. General solvable cohomological-weight version remains a supplier gap. |
| 22 | FLHS15, Lemma 6.1 and proof of Theorem 3 at five, p.10 | FLHS15 line 421 and line 426 through line 452: switch over a number field. Source states existence; its twisted-X(5)/Hilbert argument yields infinitely many j-values as explained in the package. |
| 23 | BD14, Théorème 3.2.2, arXiv v3 pp.36–37 | BD14 line 2144 through line 2171: universal modularity conclusion, potential semistability and weight two. The package dualizes the determinant convention and separately specifies the five-adic relaxation. |
| 24 | SW99, Theorem A, §4.5, printed p.74 | SW99 line 2468: residually reducible theorem, correctly identified as not a replacement for the absolutely irreducible weight-two contract. |
| 25 | SW99, Theorem B, printed p.75 | SW99 line 2491 and line 2495: Hypothesis H retained in the description. |
| 26 | Kisin09, Theorem (3.5.5), printed p.1170 | Kisin09 line 3976: strong residual modularity and residue-field restrictions, not the universal contract. |
| 27 | Kisin09, Theorem (3.5.7), printed p.1172 | Kisin09 line 4068: its lifting scope is not silently broadened. |
| 28 | BLGG12, Theorem 6.1.5, arXiv v1 pp.41–42 | BLGG12 line 2024 through line 2078: existence of modular lifts with specified local data, not modularity of every given lift. The π-subscript typo is recorded below. |
| 29 | BLGG12, Theorem 6.1.8, arXiv v1 p.45 | BLGG12 line 2198: ordinary-lift input with its hypotheses, not a substitute for BD14's universal conclusion. |
| 30 | BLGG13II, Theorem 2.1.2, arXiv v1 p.2 | BLGG13II line 82: ordinary-lift theorem. Package does not cite Proposition 2.1.1 as this result. |
| 31 | BLGG13II, Theorem 3.1.1 and proof, arXiv v1 p.3 | BLGG13II line 122 and line 129 through line 145: p=3, local reducibility and projective-image hypotheses are explicitly acknowledged in the gap discussion. |
| 32 | BLGG13II, Theorem 3.1.2, arXiv v1 p.4 | BLGG13II line 149: separate lifting result, not an unrestricted all-odd-prime residual modularity theorem. |
| 33 | BCDT01, Theorem A, author-version p.1 | BCDT01 line 15: rational endpoint used as a Check, not as the totally real proof's supplier. |

The roadmap does not copy the sources' expository order: its layers follow the real-field descent and modularity dependencies. Its relative cyclotomic and infinitude extensions are identified as arguments supplied here, not exact statements of the cited special-case sources. No computational algorithm is planned.

## Not verifiable

- No fresh Lean elaboration/build was run, as required by the explicit read-only/no-build instruction. The provided two elaborated signatures were inspected and matched to the unchanged file and pinned definitions. Neither requires a repair to its binders.
- The three declared supplier additions are not yet implementations. Their exact slugs, insertion sections, hypotheses and outputs were checked; this review accepts the contracts without asserting their proofs exist at the supplier heads.
- The future-consumer descriptions for ModularityAndLanglandsExtensions, its Part II and EllipticCurveModularityImaginaryQuadraticPartII could not be checked as target-level contracts in the supplied head index/main trees. They are not consumed prerequisites, so they create no unowned input or upward edge here. HilbertModularForms §11.3 was checked directly.
- Absence/ownership searches are limited to the supplied main, Completed, package and open-head corpus and the two pins. They cannot certify absence from unprovided private work. No missing legal source text remains for this package's nine cited works.

## Source issues

- **Misprint** in BLGG12 at proof of Theorem 6.1.5, printed preprint p.42 (BLGG12 line 2067): the source says the residual representation of π₂ matches the restriction over F₁; it should be π₁, the representation just constructed over F₁ before base change to F₂; affects the proof.
- **Misprint** in FLHS15 at proof of Lemma 4.2, printed preprint p.9 (FLHS15 line 398): the source says the determinant is applied to G⁺/G; it should be G⁺/G′, since G′ is the determinant kernel and lies in G⁺; affects the proof.
- **Misprint** in LeHung26 at §2.1, equations (5)–(6), printed p.5 (LeHung26 line 201): the source says to form the cubic quotient in the tower without restricting the preceding odd n; it should be restricted to 3∣n before introducing C₃ and the cubic endpoint; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "ef42b482db6af03deb3d348a89856200611d89b6", "job": "RT-EllipticCurveModularityTotallyReal~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
