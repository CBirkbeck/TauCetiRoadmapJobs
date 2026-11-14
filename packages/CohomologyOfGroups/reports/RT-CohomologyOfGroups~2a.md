<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/15095#issuecomment-6885183872 -->
Red team round 2 pass a (codex) of b9ea623

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) The repaired finite-rank Check has an off-by-one bound

   **Location:** `packages/CohomologyOfGroups/README.md:1823`: “`Σ_{m ≤ r} f_m ⊗ g_m` gives a form of rank at most `r`.”

   **Claim:** The displayed finite sum has rank at most `r`.

   **Witness:** With the zero-based indices used in the next line, take `r = 0` and `f₀ = g₀` the zeroth coordinate functional. The form is nonzero of rank `1`, exceeding `0`.

   **Exact repair:** Replace that clause by “A sum `Σ_{m < r} f_m ⊗ g_m` has rank at most `r`.” Keep the next sentence: the restriction of the identity matrix to `⟨e₀, …, e_r⟩` has rank `r + 1`.

   **Retest:** At `r = 0` the repaired sum is empty, rank `0`, while the one-dimensional identity has rank `1`. At `r = 2` two pure tensors have rank at most `2`, and the three-dimensional identity has rank `3`. The failure of surjectivity remains established. This is a new error in the repair of pass b/F05; the original equal-dimension issue is repaired.

2. **F02** (P3) The unstatable-headline list omits the Pontryagin comparisons

   **Location:** `packages/CohomologyOfGroups/Suggested.lean:44`: “Headline theorems of the roadmap that are not statable at the pins, and what each lacks”.

   **Claim:** The module docstring accounts for the headline results omitted from the acceptance test.

   **Witness:** `packages/CohomologyOfGroups/README.md:1873` promises the all-degree exterior-algebra comparison for torsion-free groups and rational coefficients. Neither comparison appears among the declarations or the docstring's omitted headlines.

   **Exact repair:** Add this bullet to that list:

   > * the Pontryagin exterior-algebra comparisons (README 5.4), for torsion-free abelian groups over every commutative coefficient ring and for arbitrary abelian groups over a rational coefficient algebra: the Pontryagin product on the direct sum of group homology and the induced exterior-algebra map, both constructed in 5.4 from the cross product of 5.1.

   **Retest:** This accounts for both `A = ℤ², k = ℤ/4` and `A = ℤ² × C₂, k = ℚ[x,y]`, where the compared graded modules are `k, k², k, 0, …`. It does not demand a stand-in isomorphism or a new heavy definition in Lean.

## Verification of the earlier findings

The two earlier reports use F01-style identifiers. All nine repairs were inspected individually; none was marked “not actionable in this package”. Quotes below are from the repaired package, not from the repair report.

| Earlier finding | Status and repaired passage | Witness and retest |
|---|---|---|
| a/F01, absent cohomological universal coefficients | **Repaired.** `Suggested.lean:195` declares `universalCoefficient_cohomology`; README:1743 says “the class of `β : Bₙ → A` … goes to the class of the cocycle `Cₙ₊₁(G; k) → Bₙ → A`.” | The two maps at Lean:153,174 have real bodies using the same isomorphisms in opposite directions. For `C₂, ℤ, A=𝔽₂`, degree 1 gives `0→0→𝔽₂→𝔽₂→0`; degree 2 gives `0→𝔽₂→𝔽₂→0→0`. The global-dimension instance is present in the supplied elaborated types. |
| a/F02, no hypercohomology Checks | **Repaired.** README:1073–1082 now includes “The differential of `D` enters: for the trivial group and `D = (ℤ →2 ℤ)` in degrees `0` and `1`”. | Its values are `H⁰=0, H¹=ℤ/2`, whereas deleting the differential gives `ℤ,ℤ`. The other two new Checks give `ℤ,0,ℤ/2` for trivial integral coefficients on `C₂`, and `H¹=0,H²=ℤ/2` for the sign module in degree 1. |
| a/F03, missing filtration endpoints | **Repaired.** README:1941–1944 explicitly gives `A*_j ∩ C̄ⁿ = C̄ⁿ` for `j ≤ 0` and `0` for `j > n`. | HS53 line 404–407. At degree 0 the two successive terms are `M,0`; for `N=1` the filtration is full through `j=n`; for `N=G` its positive-index part is zero. |
| b/F01, arbitrary-ring Pontryagin route missing | **Repaired.** README:1657–1668 adds the case where “`N` and every `H_q(H, N)` are projective”; README:1841 routes the comparison through that case “with no condition on its global dimension”. | The pinned split-cycle and Künneth results impose exactly these projectivity conditions. For `k=ℤ/4,A=ℤ²`, and `k=ℚ[x,y],A=ℤ²×C₂`, both exterior powers and homology are `k,k²,k,0,…`. Neither ring has global dimension at most one. |
| b/F02, undeclared least-period contract | **Repaired.** README:716 says “What K3BlochGroups must provide (gap:least-r-period)”; the same slug, supplier and §5.2 occur in the top-level gaps of `design/plan.json`. | The supplier gives period values but not their leastness. For `S₃,r=3`, `H₁=0`, `H₃=H₇=ℤ/3` after localization; least qualifying `d=4`, whereas `d=8` also qualifies. The declared contract supplies precisely the missing assertion. |
| b/F03, cyclic cup-periodicity proof uses wrong input | **Repaired.** README:2675–2686 now invokes `cup_bijective_of_forall_isPGroup_of_lTensor_injective` and checks `H¹(S,ℤ)=0`, generation and cardinality of `H²(S,ℤ)`. | Pinned `TauCeti/RepresentationTheory/Homological/TateCohomology/Cup/TateNakayama.lean:360`. For `S=C₃`, these are `0`, a generator `1/3`, and cardinality `3`. Every extension ending in the free abelian group `ℤ` splits after forgetting the action, so tensoring with arbitrary `M` preserves its injection. |
| b/F04, transfer naturality not supplied | **Repaired.** README:337–340 and :2330 name `TauCeti.groupHomology.map_comp_transfer`. | Pinned `TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean:103` states coefficient naturality for every finite-index subgroup. For `C₂≥1`, degree 0 and coefficient multiplication by `a`, both composites are multiplication by `2a`. |
| b/F05, dimension argument for infinite-rank cross product | **Partly repaired.** README:1823 replaces the equal-cardinality comparison by “gives a form of rank at most `r`”. | Finite-rank forms cannot contain the infinite identity matrix; on `r+1` basis vectors the latter has rank `r+1`. This repairs the original cardinal-dimension argument. The displayed sum has the new off-by-one error S01. |
| b/F06, cyclic resolution page locator | **Repaired.** README:2655–2657 cites “Loh19 Remark 1.6.12, pp. 48–49” and handles `m=1` separately. | Loh19 line 2205–2223: the finite cyclic sequence continues onto p.49; the proposition assumes `m≥2`. For `m=1` the sequence is `0→ℤ→¹ℤ→⁰ℤ→¹ℤ→0`, which is exact. |

## Verified sound

Read all 2,815 README lines and all 492 Lean lines. The acceptance test has **23 declarations: 9 definitions and 14 theorems**. The tables below cover **41 numbered sections**, split into **44 target rows** where §4.7 and §6.7 have separately bold targets, plus the **9 bold conventions**. There are **171 README Check bullets**; their mathematical cases were evaluated, with representative computed values recorded below and the defective bound isolated as S01. The source ledger records **33 locator groups** checked against five readable sources. The supplier ledger resolves **15 roadmap interfaces**, including three declared gaps; ownership-only references are distinguished from consumed results.

No Lean command was run: the job forbids builds. I compared all 23 supplied elaborated signatures with the actual declarations and their README contexts. No dropped instance, changed universe, extra arbitrary datum, sorry-defined carrier or hypothesis containing the conclusion was found. This is a signature comparison, not a new elaboration.

### Computed statement table: README

Notation in this table: `C_m` is cyclic of order `m`; coefficients are trivial unless a sign or regular action is specified. `H_*` and `H^*` are indexed in increasing nonnegative degrees. A zero module, or the zero ring with its necessarily zero modules, makes all maps below the unique map `0→0`; it supplies no counterexample. An abstract group is nonempty, so an “empty group” is outside the quantified carriers. Geometric hypotheses about schemes, ramification, smoothness and inseparability do not occur here. Empty bases, empty sums and rank zero do occur and are recorded.

| Statement | Instances and computed values on the two sides | Result / change |
|---|---|---|
| 1.1 conjugation and compatible-pair maps | `g=1`: group and coefficient maps both identity. In `S₃`, conjugation by a transposition on `A₃` sends its generator to its inverse: on `H₁(A₃,ℤ)=ℤ/3` the map is `−1=2`, not `1`. For a regular module and an element of order 3, coefficient transport sends `δ₁` to `δ_g` cohomologically and `δ_{g⁻¹}` homologically. | Direction and inverse conventions agree; identities alone would not distinguish them. |
| 1.2 quotient action | `S₃/A₃=C₂` acts on `H²(A₃,ℤ)=ℤ/3` by `−1` and on `H⁴` by `+1`; conjugation by an element of `A₃` acts as `1`. For `N=G`, quotient is trivial and action is `1`. | Correct factorization; not a trivial action on every normal subgroup. |
| 1.3 additivity | Empty sum/product of modules gives `0`. `H₁(C₂,⊕ᵢℤ)=⊕ᵢℤ/2`. For infinite free abelian `A`, the identity `A→⊕ℕℤ` has infinitely many nonzero coordinate maps, so is absent from `⊕ℕ Hom(A,ℤ)`. | Correct distinction between sums and products; no unrestricted cohomological sum assertion. |
| 1.4 permutation modules | `H₁(S₃,ℤ[S₃/A₃])=H₁(A₃,ℤ)=ℤ/3`. For the `C₂`-set `C₂ ⊔ {pt}`, coinvariants are `ℤ²`, not `ℤ³`. A sign stabilizer module has coinvariants `ℤ/2`. | Stabilizers and twisted coefficients retained. |
| 1.5 discrete/continuous comparison | Discrete `ℤ` gives `H¹(ℤ,ℤ)=Hom(ℤ,ℤ)=ℤ`; all its cochains are continuous. With the profinite topology on `ℤ`, continuous homomorphisms to discrete `ℤ` are `0`. For `G=1`, both theories give `A,0,0,…`. | Discreteness is essential and present. |
| 2.1 hyperhomology and hypercohomology | `G=C₂,D=ℤ` in degree 0: hypercohomology `ℤ,0,ℤ/2`, while termwise invariants alone give `ℤ,0,0`. `G=1,D=(ℤ→²ℤ)`: `0,ℤ/2`. Sign `ℤ` in degree 1: `H¹=0,H²=ℤ/2`. | All three new cohomological controls discriminate. Homological degree-zero complexes recover ordinary homology. |
| 2.2 long exact sequences | For `0→ℤ→²ℤ→𝔽₂→0` over `C₂`, `δ:H¹(C₂,𝔽₂)→H²(C₂,ℤ)` is an isomorphism `𝔽₂→𝔽₂`; the homological map `H₁(C₂,𝔽₂)→H₀(C₂,ℤ)` is zero `𝔽₂→ℤ`. | Correct opposite connecting directions. |
| 2.3 two spectral sequences | For `S₃` and `ℤ[S₃/A₃]→ℤ` in degrees 1,0, hyperhomology in degrees 0,1,2 is `0,ℤ/2,ℤ/3`; the coinvariant complex is `ℤ→¹ℤ`, acyclic. | Cannot replace the total derived construction by termwise coinvariants. |
| 3.1 equivariant complex | Over `ℤ/4`, tensoring the exact `ℤ/2→ℤ/4→ℤ/2` with `ℤ/2` makes its first map zero and creates top homology `ℤ/2`. Flatness suffices for tensor, not Hom: the localization telescope for `ℤ[1/2]` would require an integral solution `a₀=−1/3` to the alternating obstruction. | Flat versus projective hypotheses distinguished. |
| 3.2 orbit sequence | Reflection of a circle has two fixed vertices; positive odd homology rows from them are `(ℤ/2)²`. Free rotation has trivial stabilizers, so higher rows are `0`. | Orbit data, not individual cells, give the page. |
| 3.3 free complexes | Free circle action with trivial coefficients has quotient homology `ℤ,ℤ`. The sign local system has differential `−2`, hence `H₀=ℤ/2,H₁=0`. | Constant coefficients cannot replace an arbitrary deck action. |
| 3.4 tree chain complex | Point: `0→0→k→¹k→0`. One edge: `∂e=v₁−v₀`, augmentation of boundary `1−1=0`; the wrong sum has augmentation `2`. A loop has boundary `0` and nonzero `H₁`. | Tree and orientation conditions discriminate. |
| 3.5 tree sequences | Infinite cyclic translation on the line gives edge operator `t⁻¹−1`; trivial integral coefficients make it `0`, yielding `H₁=H₀=ℤ`. Replacing difference by sum gives `2` and wrong `H₀=ℤ/2`. | Agrees with the supplier's loop edge corresponding to `t⁻¹`. |
| 3.6 amalgams, HNN, free groups | `C₄*_{C₂}C₆`: abelianization is `coker(1↦(−2,3))=ℤ/12`. `BS(1,2)`: edge map `1−2=−1`, abelianization `ℤ`; wrong sum adds `ℤ/3`. Free rank 0 and 1 have zero groups above degree 1. With both generators acting by `−1` on `ℤ`, rank-two free homology has `H₁=ker(−2,−2)=ℤ`, whereas both cyclic-factor `H₁` groups are zero. | The free-product formula correctly starts at degree 2. |
| 4.1 cochain cup | For `C₂,𝔽₂`, degree-one generator squares to the nonzero degree-two generator. On the torus, `x∪y` evaluates to `1` on `[a\|b]−[b\|a]`, reverse product to `−1`. Omitting the prefix action in a twisted example leaves coboundary `2(t−1)`, nonzero. | Coefficient action and ordered product are necessary. |
| 4.2 connecting maps and uniqueness | Left connecting rule has coefficient `+1`; right rule for a degree-one left factor has `−1`. Rescaling products by `(−1)^{pq}` changes the right rule in odd degree. Tensoring the integral `×2` sequence with `ℤ/2` kills its injection. | Exactness hypotheses and sign fixed; normalization excludes zero/rescaled products. |
| 4.3 identities | Torus degree-one classes anticommute, giving `1=−(−1)`; over `𝔽₂`, the sign is `1` and the `C₂` square is nonzero. Degree-zero unit sends `x` to `x`. | Graded commutativity does not assert odd squares vanish in characteristic 2. |
| 4.4 diagonal approximation | Vertex `v` maps to `v⊗v`; augmentation gives `1`. A doubled diagonal gives `2`, so fails augmentation. The `(1,1)` shuffle has two terms with coefficients `+1,−1`, not `+1,+1`. | Maps and homotopy comparisons correctly normalized. |
| 4.5 projection formula | For `1≤C₂`, degree-zero corestriction is multiplication by `2`; both sides of the projection formula on integers `a,b` equal `2ab`. For the identity subgroup, both equal `ab`. | Correct index and map directions. |
| 4.6 cap/evaluation | On the torus, the back-face cap of the second dual generator with the ordered 2-cycle is the first generator; the front-face convention gives its negative. Evaluation in equal degrees gives `1`; `(−1)^{q(n−q)}` is `−1` for `n=2,q=1` and `1` for `n=q`. | Supplier's front-face operation is explicitly converted; evaluation agrees with Kronecker. |
| 4.7(a) Tate comparison | For `C₂,ℤ`, ordinary degree zero is `ℤ`, Tate degree zero is `ℤ/2`; the map is reduction, not an isomorphism. In positive degrees the Tate and ordinary generators agree. | Positive-degree bounds present. |
| 4.7(b) discrete cup comparison | Discrete `ℤ²`: both cup products evaluate to `1` on the oriented torus cycle; both reversed products to `−1`. | Uses §1.5 and the same prefix convention. |
| 4.7(c) profinite cup comparison | For `∏ℕ C_p` with `𝔽_p` coefficients, continuous degree-one characters are `⊕ℕ𝔽_p`; arbitrary abstract characters form a much larger vector space. Finite-stage cup representatives pull back with value `xy` on the same inputs. | Continuous cochains and finite quotient colimit are essential. |
| 5.1 homological Künneth | `C₂²,ℤ`: `H₂=ℤ/2`, `H₃=(ℤ/2)³`; in degree 3 tensor gives two summands and Tor one. Over `𝔽_p`, `dim H_n(C_p²)=n+1`. With `G=H=1,M=N=ℤ/2`, an unrestricted Tor sequence would wrongly require `H₁=ℤ/2`, though it is zero. The new projective-homology case over `ℤ/4` gives `H_*(ℤ²)=k,k²,k,0,…`. | Flatness and hereditary-ring restriction apply only to the intended clauses; new arbitrary-ring clause works. |
| 5.2 universal coefficients | `C₂,ℤ,A=𝔽₂`: cohomological degree 1 is `0→0→𝔽₂→𝔽₂→0`; degree 2 is `0→𝔽₂→𝔽₂→0→0`. Homological degree 2 is `0→0→𝔽₂→𝔽₂→0`. Over `k=ℤ/4,A=𝔽₂`, a hereditary sequence would have three nonzero `𝔽₂` terms, impossible. | Correct ring assumption; actual evaluation, not arbitrary isomorphism. |
| 5.3 cohomological cross product | Finite-dimensional torus factors give `x⊗y↦x∪y` with evaluation `1`. Infinite-rank free abelian factors admit the identity matrix `(δᵢⱼ)`; every finite tensor sum has finite-rank matrix, so this matrix is not in the image. As written, `Σ_{m≤0}f_m⊗g_m` may have rank 1. | Finiteness requirement correct; S01 fixes the Check's bound. |
| 5.4 Pontryagin algebra | On a degree-one generator, shuffle `[a\|a]−[a\|a]=0`. For `ℤ²`, exterior and homology ranks are `1,2,1,0,…`; for `C₂`, `Λ³=0` but `H₃=ℤ/2`. For `ℚ=colim(1/m!)ℤ`, `H₁=ℚ,H₂=0`. For `ℤ²×C₂` over `ℚ[x,y]`, both sides are `k,k²,k,0,…`. | Mathematical statement and repaired route sound; S02 accounts for this omitted headline. |
| 6.1 normalized extension filtrations | Degree 0 gives successive terms `M,0`; `N=1` retains every degree-`n` cochain through filtration `n`; `N=G` kills all positive-index terms. For `C₄,N=C₂`, the two middle definitions impose genuinely different tests on functions. | Both filtrations now have endpoints; no global bound inferred from degreewise boundedness. |
| 6.2 cohomological Hochschild–Serre | `S₃/A₃`, `𝔽₃`: invariants are one-dimensional for `q≡0,3 mod4`, zero otherwise. For `C₄/C₂`, `𝔽₂`, E₂ has one dimension in every bidegree but the abutment has one per total degree, forcing a nonzero differential; split `C₂²` has dimension `n+1` and collapses. | Cannot assert unconditional degeneration. Classical `(p,q)` becomes `(2p+q+1,−p−1)` on Tau Ceti page `r+1`. |
| 6.3 homological Hochschild–Serre | `N=1` leaves only `q=0`, giving `H_p(G,M)`; `N=G` leaves only `p=0`, giving `H_q(G,M)`. For the split product `C₂²`, degree 1 is `(ℤ/2)²`, not one copy. | Correct homological directions and finite filtration per degree. |
| 6.4 edges | `N=1`: inflation identity; `N=G`: restriction identity. In `C₂⊂C₄` over `𝔽₂`, degree-one inflation is an isomorphism and restriction zero. For `G=ℤ²,N=ℤ,M=k[N]`, coinflation gives `k,k,0,…` on both sides; trivial `M=k` instead has a nonzero degree-two group mapping to zero. | Coinflation needs homological acyclicity; supplied and stated. |
| 6.5 multiplicativity | With the `N` factor ordered first, swapping the quotient degree-one class past the kernel degree-one class contributes `−1`. The formula's factor `(−1)^{p q′}` is `−1` for `p=q′=1`, `+1` when either is zero. | HS53's indexing convention retained consistently. |
| 6.6 transgression | In `C₃⊂C₉`, lift `f(i)=⌊i/3⌋ mod3` gives `df(2,1)=−1=2`; the extension factor set gives `+1`. For `Q₈` with kernel `C₄`, the integral factor value `2∈ℤ/4` is nonzero but maps to `0∈𝔽₂`. | Minus sign and scalar pairing of the extension class both essential. |
| 6.7 degree `m` sequence | `m=2,C₂⊂C₄,M=ℤ`: `0→ℤ/2→ℤ/4→ℤ/2→0`, first map `1↦2`, second reduction. Over `𝔽₂`, the required `H¹(C₂,𝔽₂)=0` fails. | Higher-degree vanishing hypothesis is present; no reuse of the degree-one claim. |
| 6.7 homological five terms | Same extension over `ℤ`: `0→0→ℤ/2→ℤ/4→ℤ/2→0`, with `1↦2` then reduction. For `N=1`, the edge map is identity and the kernel term zero. | Precise declared homological-low-degree gap supplies the generic sequence. |
| 6.8 Hopf formula | Free cyclic presentation of `C_m`: commutator subgroup is zero, hence both sides `0`. For `ℤ²`, both sides are `ℤ`, with ordered bar cycle mapping to inverse commutator because its lifted boundary is `[ba]−[ab]`. For perfect `A₅`, both sides `ℤ/2`, the kernel of `SL₂(𝔽₅)→A₅`. | Existence theorem and calibrated README map distinguished. |
| 6.9 finite/profinite comparison | Finite `C₉` with discrete topology: all sections are continuous; the same lift gives `df(2,1)=−1` in both constructions. Split product transgression is zero in both. | No extension to arbitrary nondiscrete groups is claimed. |
| 7.1 double cosets | `S₃,H=K=C₂,n=0,M=ℤ`: left composite is `3`; the two terms are `1+2=3`. In positive degree the second term factors through the trivial group and is zero. For `H=G` there is one term; for `K=1` the sum is the norm. | Correct representatives, intersections and finite-index hypothesis. |
| 7.2 stable elements | `S₃,p=3`: stable `H²(A₃,ℤ)=0` and stable `H⁴=ℤ/3`; homological stable `H₁(A₃,ℤ)=0`, matching the 3-primary part of `H₁(S₃,ℤ)=ℤ/2`. For `C₂×S₃` acting on `M=𝔽₂³` by coordinate permutation through `S₃`, normalizer invariants in degree one have dimension 3 while full stable classes have dimension 2. Tate degree zero: the 2-primary subgroup `{0,3}⊂ℤ/6` restricts bijectively to `ℤ/2`. | Ordinary degree zero is correctly excluded: its primary subgroup would be zero while stable `ℤ` is not. All conjugations, not just the normalizer, are tested. |
| 8.1 duality | `C₂,M=ℤ,i=0`: character-dual Tate degree 0 and the dual of Tate degree `−1` are both zero; at `i=1` both are `ℤ/2`. Integral version for `C₃,i=0,2` is multiplication pairing on `ℤ/3`; `i=1` both vanish. For `M=ℤ/2`, integral dual is zero but character dual is `ℤ/2`. | Integral free-module assumption required; character version allows torsion. |
| 8.2 finite prime-power classification | `C_p`: all abelian subgroups cyclic, cyclic alternative true. `Q₈`: abelian subgroups cyclic and quaternion alternative true. `C₂²`: both false. If `p=21` were allowed, `C₇⋊C₃` is killed by 21 but not cyclic/quaternion, though its abelian subgroups are cyclic. | Prime hypothesis is present; Mathlib's `IsPGroup` alone would not suffice. |
| 8.3 cohomologically trivial resolution | Reflection/sign example for `C₂` shifts by 1 with a sign twist; removing the twist would equate the unequal trivial-coefficient Tate degrees 0 and 1, `ℤ/2` and `0`. Cyclic `m=1` sequence has maps `1,0,1`, exact. | Twist and endpoint conventions correct; source page repaired. |
| 8.4 periods | Nontrivial cyclic groups: least period 2. `Q₈`: least 4. `S₃,p=3`: least 4, since localized `H₁=0,H₃=ℤ/3`; `p=2`: least 2. In `C₃`, normalized character has value `1/3`, whose connecting class generates `H²=ℤ/3`; cup is bijective in all Tate degrees. | Minimality explicitly conditional on declared gap; normalization distinguishes a nongenerator. |
| 8.5 periodicity equivalences | Trivial group: every Tate group zero, zero cup is bijective on `0`, all four clauses true. `C_p` true with period 2; `Q₈` true with 4; `C_p²` false because mod-`p` dimensions `n+1` grow. For `A₄`, 3-primary clauses true and 2-primary false. For `C₂,p=3`, all primary groups are zero, cardinal `1=3⁰`, all clauses true. | Uniform period precedes coefficient and degree quantifiers. No missing `p∣\|G\|` in the primary TFAE. |

The nine bold conventions at README:186–240 were also instantiated separately:

| Convention | Computation | Result |
|---|---|---|
| Universes and rings | Zero ring forces `1=0`, hence every module element `m=1m=0m=0`; the integral statements use `Type`, general ones `Type u`. | No nontriviality assumption required; no object-only universe lift masquerades as a morphism lift. |
| Notation / grading | `Ĥ⁻²(C₃,ℤ)=H₁(C₃,ℤ)=ℤ/3`; `Ĥ⁰(C₃,ℤ)=ℤ/3`, unlike `H⁰=ℤ`. | Negative and zero Tate degrees distinguished. |
| Maps of groups | `C₂↪C₄` on abelianizations sends `1↦2`; restriction of a character evaluates at `2`. | Homology covariant, cohomology contravariant. |
| Conjugation | Transposition on `A₃` gives `1↦−1`; regular coefficient basis moves by `g` or `g⁻¹` as specified above. | Compatible-pair conventions fixed. |
| Cup | `(x∪y)(a,b)=1`, `(x∪y)(b,a)=0` for torus coordinate cocycles. | Ordered evaluation gives `1`, reversed gives `−1`. |
| Extension classes | For section of `C₉→C₃`, carry at `(2,1)` is `1`, descended coboundary `−1`. | Transgression is negative paired extension class. |
| Spectral sequences | Cohomological `d₂:(0,1)→(2,0)`; homological `d²:(2,0)→(0,1)`. | Correct opposite bidegrees. |
| Total complexes | At horizontal degree 1, mixed terms in `(d_h+(−1)^p d_v)²` have coefficients `−1,+1`, summing to zero. Flip multiplies bidegree `(1,1)` by `−1`. | Totalization agrees with the K3 supplier. |
| Groups / quaternion parameter | `QuaternionGroup (2^1)` has order `4·2=8`; `s=3` corresponds to parameter `2^{s−2}=2`. | Lower bound excludes the exceptional order-four parameter. |

### Computed statement table: Suggested.lean

All names below are in `TauCetiRoadmap.CohomologyOfGroups`. “General” means `k,G : Type u`, `[CommRing k] [Group G]`, coefficients `M : Rep k G`; these hypotheses actually occur in the supplied elaborated type. “Finite integral” means `G : Type`, `[Group G] [Fintype G]`, and `M : Rep ℤ G`. Every row was compared with its README section; the nine definitions have real bodies.

| Declaration / line / section | Variable and instance context | Computed instance, both sides / result |
|---|---|---|
| `conjRes` :85 / 1.1 | General; subgroup `A`, group `B : Type u`, `β:B→*G`, `g`, proof `g⁻¹β(b)g∈A`, `n:ℕ`. | `β=id,g=1,A=⊤` gives identity. For `A₃⊂S₃`, a transposition gives `−1` on degree-one `𝔽₃`-characters. Coefficient transport is `g`, as required by the contravariant group map. |
| `conjCores` :105 / 1.1 | Same data, with covariant homology and coefficient `g⁻¹`. | On `H₁(A₃,ℤ)=ℤ/3`, transposition gives `−1`; on a regular degree-zero vector the coefficient map sends `δ₁↦δ_{g⁻¹}`, not `δ_g`. |
| `freeGroup_isZero_of_two_le` :125 / 3.6 | `k,S : Type u`, commutative ring, arbitrary `Rep k (FreeGroup S)`, `n≥2`. | Empty `S`: trivial group, both groups `0`. Singleton `S`: resolution length 1, both groups `0` at `n=2`. Rank-two sign coefficients have `H₁=ℤ`, so the lower bound is substantive. |
| `coprod_groupHomology_bijective` :133 / 3.6 | `k,A,B : Type u`, groups, arbitrary coefficients on `A∗B`, `n≥2`. | `A=B=C₂`, integral trivial coefficients, `n=3`: map `(ℤ/2)²→(ℤ/2)²` is the sum of inclusions. For `A=1`, it is `0×H_n(B,M)→H_n(B,M)`. At degree 1 with the rank-two sign example, `0×0→ℤ` is not surjective, correctly excluded. |
| `cohomologyEvaluation` :153 / 5.2 | `k,G,A : Type u`; ring, group, additive group and `Module k A`; `n:ℕ`. No hereditary assumption needed for this map. | `C₂,k=ℤ,A=𝔽₂,n=1`: evaluation `𝔽₂→Hom(ℤ/2,𝔽₂)=𝔽₂` sends generator to generator. At `n=2`: target `Hom(0,𝔽₂)=0`, map zero. At `G=1,n=0`, it sends `a` to `(r↦ra)`. |
| `extToCohomology` :174 / 5.2 | Same; `[∀ X : ModuleCat.{u} k, HasProjectiveDimensionLE X 1]`; maps `Ext¹(H_n,A)→H^{n+1}`. | `C₂,ℤ,𝔽₂,n=1`: `Ext¹(ℤ/2,𝔽₂)=𝔽₂→H²=𝔽₂` is the boundary-class identification. At `n=0`, `Ext¹(ℤ,𝔽₂)=0`, map zero. |
| `universalCoefficient_cohomology` :195 / 5.2 | Same hereditary context; injective first map, `Function.Exact`, and a linear right inverse for evaluation. | `n=0`: kernel of evaluation is `0=image(0)`; `n=1`: kernel is all `𝔽₂=image(𝔽₂)`. The section is identity in the first case, unique zero-domain map in the second. `k=ℤ/4` negative control is outside the instance assumptions. |
| `nonempty_groupHomology_two_addEquiv_hopf` :211 / 6.8 | `S:Type`, `R≤FreeGroup S`, `[R.Normal]`. Integral coefficients; quotient by `[F,R]` inside `R∩[F,F]`. | Cyclic quotient: both sides `0`; free presentation of `ℤ²`: both `ℤ`; `R=1`: both `0`. `Nonempty` specifies existence, not the chosen sign; README's calibrated map is a further target. |
| `doubleCosetTerm` :223 / 7.1 | General; `H,K≤G`, `[H.FiniteIndex]`, `n:ℕ,g:G`. | `S₃,H=K=C₂,n=0,M=ℤ`: identity representative term `1`, other representative term `2`. Identity subgroup `H=G` has one term. |
| `res_comp_corestriction_eq_finsum` :240 / 7.1 | Previous context plus representative function `r:K\\G/H→G` and proof it represents each class. | Same `S₃` instance: left side `3`, right `1+2=3`. Replacing a representative inside its double coset does not alter either summand. The quotient is finite because `H` has finite index; no unsupported infinite sum is required. |
| `doubleCosetTermHomology` :251 / 7.1 | General, same finite-index data. Transfers from `K` to its intersection, then `conjCores` to `H`. | Same degree-zero instance gives `1` and `2`; coefficient naturality test with multiplication by `a` gives `a` and `2a`. |
| `transfer_comp_cores_eq_finsum` :268 / 7.1 | Same representative data; homological map `H_n(K,M)→H_n(H,M)`. | `S₃,C₂,C₂,n=0`: inclusion-induced map is `1`, transfer is `3`, composite `3=1+2`. For `H=G`, transfer is identity and both sides are corestriction from `K`. |
| `IsStableClass` :278 / 7.2 | General; subgroup `P`, `n:ℕ`, `z∈H^n(P,M)`; all `g:G` quantified. | `P=A₃⊂S₃,n=2,M=ℤ`: stability requires `z=−z` in `ℤ/3`, so only `0`. At `n=4`, condition `z=z` allows all `ℤ/3`. |
| `bijOn_res_sylow_isStableClass` :292 / 7.2 | General plus `[Finite G]`, prime `p`, `P:Sylow p G`, `n≠0`. | `S₃,p=3,n=2`: bijection `0→0`; `n=4`: `ℤ/3→ℤ/3`. At `n=0,M=ℤ`, restriction from the primary subgroup `0` would miss stable `ℤ`, hence exclusion correct. |
| `IsHomologyStableClass` :303 / 7.2 | General plus `[Finite G]`; subgroup `P`, natural degree; transfers into intersections, then conjugated corestriction. | `P=A₃⊂S₃,n=1`: equation `z=−z` forces `0`. For `P=(C₃)²` in its inversion semidirect product and `n=2`, action on `Λ²P=ℤ/3` is `(−1)²=1`, so all classes are stable. |
| `bijOn_cores_sylow_isHomologyStableClass` :332 / 7.2 | Finite general context, prime, Sylow, `n≠0`. Map from stable subgroup onto the primary subgroup. | `S₃,p=3,n=1`: `0→H₁(S₃,ℤ)(3)=0`. In degree 2 for the inversion extension of `(C₃)²`, corestriction maps the stable `ℤ/3` isomorphically to the 3-primary `ℤ/3`. |
| `IsTateStableClass` :349 / 7.2 | `k,G:Type u`, commutative ring, group, `[Fintype G]`; `n:ℤ`, subgroup. Local subgroup Fintype supplied by `Subgroup.fintypeOfFinite`. | `S₃,P=A₃,M=ℤ,n=0`: all `ℤ/3` stable. With sign coefficients, transposition acts by `−1`, so stable subgroup is `0`. At `P=1`, all Tate groups are zero. |
| `bijOn_tateRes_sylow_isTateStableClass` :391 / 7.2 | Previous context, prime and Sylow; every integer degree. | `S₃,p=2,n=0,M=ℤ`: `{0,3}⊂ℤ/6→ℤ/2` is bijective. For `p=3`, `{0,2,4}→ℤ/3` also bijective. The degree-zero ordinary restriction statement would fail, but Tate's norm quotient fixes it. |
| `tate_duality` :405 / 8.1 | Finite integral; arbitrary `M`; `i:ℤ`. Evaluates degree `−1−i` against degree `i` into `Ĥ⁻¹(G,ℚ/ℤ)`; perfect in the second variable. | `C₂,M=ℤ,i=0`: both dual groups zero; `i=1`: both `ℤ/2`, pairing generator with generator gives `1/2`. Arbitrary additive maps into the target are represented, not only linear maps over an extra field. |
| `tate_duality_of_free` :425 / 8.1 | Finite integral and `[Module.Free ℤ M]`; `i:ℤ`; degrees `−i,i`. No finite-rank binder. | `C₃,M=ℤ,i=0`: pairing `(a,b)↦ab mod3` on `ℤ/3`; `i=1`: both groups zero. Torsion `M=ℤ/2` would have zero integral dual but nonzero character dual, so the instance is substantive. |
| `cup_characterConnectingClass_bijective` :441 / 8.4 | Finite group, chosen generator, additive character of abelianization with value `1/orderOf g`, arbitrary integral `M`, every `n:ℤ`. | `C₃`: normalization `1/3` gives generator of `H²=ℤ/3`, cup acts invertibly. `C₂` sign coefficients: nonzero `ℤ/2` in odd Tate degrees maps to nonzero `ℤ/2` two degrees later. Trivial group: `orderOf 1=1`, character value `1 modℤ=0`, both groups zero. |
| `tfae_periodic_cohomology` :455 / 8.5 | Finite group in `Type`; period `d>0` chosen before all integral representations and Tate degrees. Cyclic Tate group has cardinal `Nat.card G`. | Trivial group: four true clauses, cardinal `1`. `C₃`: four true with `d=2`. `Q₈`: four true with `d=4`. `C₂²`: four false; dimensions `n+1` exclude periodicity. |
| `tfae_primary_periodic_cohomology` :475 / 8.5 | Same plus `p:ℕ,[Fact p.Prime]`; no assumption `p∣\|G\|`. Primary subgroup cardinal `p^((Nat.card G).factorization p)`. | `G=C₂,p=3`: exponent `0`, cardinal `1`, all primary Tate groups zero, all clauses true. `A₄,p=2`: Sylow `C₂²`, all false; `p=3`: cyclic Sylow, all true. |

### Headline coverage and the padding probe

README:18–20 explicitly identifies Hochschild–Serre, tree sequences, homological Künneth, double cosets, stable elements, Tate duality and periodicity as end theorems. The deep supporting results are free-group vanishing/free-product homology, universal coefficients, Hopf's formula, the Pontryagin comparisons, cyclic cup-periodicity, and periodicity from a cohomologically trivial resolution.

The 14 theorems state the free-group/free-product results, cohomological universal coefficients, Hopf, both double-coset formulas, three stable-element formulas, two dualities, cyclic cup-periodicity and the two periodicity TFAEs. The docstring explicitly accounts for the missing Hochschild–Serre machinery, transgression and low-degree maps, tree connecting maps, group cross/cup products, homological universal-coefficient map and iterated connecting class. S02 adds the omitted Pontryagin comparisons.

The one-lemma probe found no padding theorem. In particular:

- `TauCeti.isZero_groupHomology_freeGroup` concerns trivial coefficients and universe zero; the stated result includes arbitrary coefficients and cohomology in universe `u`.
- The native Mackey decomposition is an isomorphism of representations, not either cohomological double-coset formula.
- Native Sylow injectivity does not identify the image with stable elements or prove the homological analogue.
- Native `periodicIso` does not identify its period map with cup by the normalized character class.
- Universal coefficients transport three native results through the bar/coinvariant/internal-Hom identifications and require projective-cycle instances. This is not a one-lemma restatement on an unchanged carrier.
- The nine definitions are used by these headlines; no standalone zero-degree, small-value or API theorem was added.

### Supplier, ownership and build-order ledger

The open-head lookup tools were used for object searches, including hyperhomology, transgression, stable elements, Hopf maps, exterior squares, transfer and Tate periodicity. The closest open and main roadmaps in the supplied overlap report were read at their relevant scope and ownership sections. A Lean-name search found no duplicate `TauCetiRoadmap.CohomologyOfGroups` namespace or kept headline name on main or an open head. No second copy on main, dropped supplier id or conflicting edit to this roadmap was found.

| Supplier | Resolved current location and exact scope | Ownership decision |
|---|---|---|
| DerivedModuleAlgebra | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:955`, §S.1: second pages, convergence, cohomological edges/five terms; homological form at :991 stops short of those edges. | Generic machinery imported; homological edge/five-term gap remains a precise declared contract. |
| SpectralSequencesAndConvergencePartII | `TauCetiRoadmap/SpectralSequencesAndConvergencePartII/README.md:1726`, §4.3: bounded-above derived Künneth and two-column sequence; :1894, §5.2: filtered pairings with total-degree Leibniz sign. | Group cross products and their transport are new here; generic spectral sequences are not rebuilt. Layers 2–3 are ownership boundaries only. |
| ProfiniteCohomology | `TauCetiRoadmap/ProfiniteCohomology/README.md:1140`, §§3.1–3.2; :1571 §5.5; :1770 §6.4; :2622 §10.1; :2763 §10.5; :3519 Layer 12. | Discrete and finite comparisons retain the source's topology and coefficient restrictions. No profinite theory replanned. |
| ClassFieldTheory | `TauCetiRoadmap/ClassFieldTheory/README.md:778`, §0.1, especially :794–810. | Tate–Nakayama and Nakayama–Rim consumed with their actual subgroup, Tor and base-ring assumptions. |
| FreeGroupsAndLimitGroups | `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:863`, §§4.5–4.8, with §§2.2,4.1–4.2 defining their graphs and fundamental groups. | Group actions without inversions and Bass–Serre trees owned there. Its edge `e↦t⁻¹` agrees with this roadmap's homological boundary. |
| AlgebraicTopology | `TauCetiRoadmap/AlgebraicTopology/README.md:1945`, §5.3; :2006 §5.4. | Finite-cover quotient chains require surjectivity and constant coefficients; the roadmap uses them as comparisons, not as arbitrary-local-system suppliers. |
| StableHomotopyKTheory | `TauCetiRoadmap/StableHomotopyKTheory/README.md:1336`, §3.29, kernel–H₂ identification :1347–1351. | Perfect-group special case imported; arbitrary-group Hopf formula is new here. |
| K2SymbolsBrauer | `TauCetiRoadmap/K2SymbolsBrauer/README.md`, §1.1, “The bar-calibrated kernel identification”. | Supplies the convention `[a]−[b]↦ab⁻¹` and inverse-commutator torus value; does not own existence/bijectivity for arbitrary groups. |
| SchemeKTheoryOperations | `TauCetiRoadmap/SchemeKTheoryOperations/README.md`, §6.7, group-hyperhomology and directed-union paragraphs. | Integral hyperhomology is an existing owner; this package extends coefficients and adds hypercohomology. Directed unions are imported unchanged. |
| K3BlochGroups | `TauCetiRoadmap/K3BlochGroups/README.md:1189`, §4.1; :1855 §5.2. | Bounded-below integral reindexing, quaternion calculations, integral duality and Swan values imported. Leastness remains the precise declared gap. |
| ArithmeticGaloisDuality | `TauCetiRoadmap/ArithmeticGaloisDuality/README.md`, §D7.2 “Finite groups and products”. | Finite-group integral UCT and homological Sylow surjectivity are compared; the arbitrary-ring/group and stable-image theorems are stronger, not copies of that section. |
| InductionRestrictionPartII | `TauCetiRoadmap/InductionRestrictionPartII/README.md`, RS.0.3 and RS.6.8, including `abelian_multiplier_exteriorSquare`. | All abelian groups, including infinite ones, are already covered in degree 2. This package imports that map and compares its orientation. RS.0.1 is an ownership boundary. |
| MappingClassGroupsAndCanonicalRepresentations | `TauCetiRoadmap/MappingClassGroupsAndCanonicalRepresentations/README.md:847`, §1.1. | Existence/naturality of the discrete cohomological sequence and degree-one transgression already owned there. The present filtered realization, products and higher/homological sequences extend it. |
| IntegralIwasawaTheoryPartII | `TauCetiRoadmap/IntegralIwasawaTheoryPartII/README.md:271`, §0.7. | Scalar evaluation pairing and arbitrary-ring flat-coefficient coinflation are already supplied; package comparisons preserve the contragredient action. |
| ModularCurvesPartII | `TauCetiRoadmap/ModularCurvesPartII/README.md`, §15.3, tree-sequence comparison for its specified congruence amalgam. | Ownership comparison only: its specialized congruence/Hecke assertion is not the general tree sequence or an input to it. |

The other nearest owners reinforce these boundaries: `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md:166` separates representation Mackey decomposition from homological applications; `TauCetiRoadmap/SpectralSequencesAndConvergence/README.md:23` owns abstract convergence and explicitly leaves double complexes to DerivedModuleAlgebra §S.1. No new ownership move is needed.

All three gap slugs appear both in `packages/CohomologyOfGroups/design/plan.json` and the exact supplier contracts: `homological-low-degree`, `flat-kunneth`, `least-r-period`. Each names an earlier supplier, precise hypotheses and one missing interface. They neither ask this roadmap to build generic theory again nor silently assert the missing interface already exists. Mathematical acceptance is conditional on these contracts being delivered; their absence today is not a finding.

The required read-only dependency check returned:

```text
depcheck: 244 roadmaps, 2206 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The package is new, rather than a revision of a main-branch roadmap. The read-only diff stat showed 13 changed files, 4,485 insertions and 7 deletions, all under `packages/CohomologyOfGroups/`.

### Pinned interfaces inspected

The key repair and convention witnesses are:

| Pinned file | Declaration / what was actually checked |
|---|---|
| `TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean:153` and :180 | `extToHomology_injective`, `exact_extToHomology_kronecker`: projective cycles plus split cycle inclusion, with `j+1=i`. |
| `TauCeti/Algebra/Homology/Kronecker.lean:252` and :267 | `kroneckerSection` and its right-inverse identity: a split cycle inclusion, no finite-generation hypothesis. |
| `TauCeti/Algebra/Homology/Split.lean:439` and :446 | Projective terms and projective homology imply projective, split cycles over an arbitrary ring. |
| `TauCeti/Algebra/Homology/Monoidal/Homology/Kunneth/Sequence.lean:729` and :793 | Exact sequence and splitting; arbitrary commutative base ring with the stated projectivity hypotheses on the second complex, rather than an implicit PID assumption. |
| `TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean:103` | `map_comp_transfer`: naturality for a morphism of representations and any finite-index subgroup, all natural degrees. |
| `TauCeti/RepresentationTheory/Homological/TateCohomology/Cup/TateNakayama.lean:360` | Three prime-power-subgroup conditions and the explicit tensor-injectivity condition for every extension ending in `C`; conclusion all integer degrees. |
| `TauCeti/RepresentationTheory/Homological/GroupCohomology/CoinvariantsTensor.lean` | `Rep.groupCohomologyIhomIso` and the complex-level comparison used to define both UCT maps, with identical bar resolution and coefficient choices. |
| `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean` | Inhomogeneous chains and their resolution comparison; inverse action in the first boundary term. |
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean` | Inhomogeneous cochains use the forward prefix action. |
| `TauCeti/Algebra/Homology/Monoidal/Cap.lean` | Chain-level cap evaluates the front factor; its descended homology is homology in its category, not automatically group homology. The package explicitly passes to coinvariants and converts faces. |
| `TauCeti/RepresentationTheory/Homological/GroupHomology/DirectedUnion.lean` | Surjectivity of the directed-union comparison is supplied; the injective half is not claimed from this file. |
| `Mathlib/GroupTheory/PGroup.lean` | `IsPGroup` does not itself assert that its natural-number parameter is prime. The package's explicit primality hypothesis prevents the exponent-21 counterexample. |

Policy inspection found the permitted import form, one module docstring, declaration docstrings, README-order layer comments, no `lemma` declaration, no `set_option`, no sorry-defined data, no admitted example and no computational algorithm. The README's own backticked declaration names are accounted for in the 23-declaration table; imported names are explicitly qualified or assigned to suppliers.

### Source locator and wording ledger

Repeated references to one passage are consolidated in this ledger; its 33 rows are locator groups, not a claim of 33 different source works. The cached published/preprint version and printed page numbering were used, not PDF image indices. Formulae and standard mathematical terminology were excluded from the wording test.

| # | Source locator resolved | Package use and result |
|---|---|---|
| 1 | HS53 line 83–128, I §2 Prop.1, pp.111–112 | Independence and comparison of resolutions; supports the comparison method, not a new hypercohomology carrier already formalized. |
| 2 | HS53 line 129–141, I §2, pp.112–113 | Homogeneous/inhomogeneous cochain dictionary used in §1.5. |
| 3 | HS53 line 154–160 and 345–354, I §2 corollary and I §7, pp.113,117–118 | Inner conjugation triviality and quotient action; the package retains the coefficient action. |
| 4 | HS53 line 201–216, I §4 Prop.4, p.114 | Cochain bicomplex and exact-row comparison; homological transcription is cited separately. |
| 5 | HS53 line 246–283, I §5, pp.115–116 | Filtration construction and comparison, including Prop.5. |
| 6 | HS53 line 341–362, I §7 Prop.7 and closing remark, pp.117–118 | Extension spectral sequence and the stated transfer to homology; package's actual generic construction belongs to its supplier. |
| 7 | HS53 line 368–400, II §1, pp.118–119 | Normalized cochains, first filtration, cup and compatible-pair naturality. |
| 8 | HS53 line 404–435, II §1, p.119 | Second filtration's endpoints and comparison; repaired §6.1 now includes both endpoints. |
| 9 | HS53 line 476–505, II §2 Thm.1, p.121 | First-page description by restricting representatives from the second filtration. |
| 10 | HS53 line 546–590 and 650–657, II §§3–4, pp.123–125 | Shuffle comparison and `d₁=(−1)^q d`; the package distinguishes representatives in the two filtrations. |
| 11 | HS53 line 686–700, II §5 Thm.3 and remark, p.126 | Product factor `(−1)^{p q′}`; independently recomputed with two degree-one classes. |
| 12 | HS53 line 705–719, III §1, p.126 | Edge morphisms are inflation and restriction with their actual images. |
| 13 | HS53 line 796–856, III §§3–4 Prop.1/Thm.2 and remark, pp.128–130 | Transgression as the appropriate differential, higher low-degree sequence, and five terms at `m=1`. |
| 14 | HS53 line 984–1010, III §6 Thm.4, p.133 | Negative paired extension class; `C₉→C₃` gives `−1`, not `+1`. |
| 15 | Loh19 line 1460–1485 and 5568–5610, Thms.1.5.1/3.2.18, pp.30,129–131 | Hopf's abstract quotient formula and five-term route. The calibrated map is separately supplied by K2SymbolsBrauer. |
| 16 | Loh19 line 2205–2223, Prop.1.6.11/Remark1.6.12, pp.48–49 | Cyclic resolution, `m≥2`, continuing onto p.49. Trivial cyclic case checked directly in package. |
| 17 | Loh19 line 2399–2452, Cors.1.6.18–19 and Outlook1.6.20, pp.53–54 | Odd-prime classification and the extra 2-group families. No odd-prime argument is silently applied at 2. |
| 18 | Loh19 line 5306–5400, Thm.3.2.12, Prop.3.2.13, Remark3.2.14, pp.123–125 | Homological/cohomological Hochschild–Serre and naturality; agrees with quotient action. |
| 19 | Loh19 line 5762–5771 and 5841–5843, Cors.3.2.20–21, pp.133,135 | Homological UCT over a PID, natural sequence and nonnatural splitting. Broader hereditary-ring cohomological statement is justified by pinned algebra, not attributed to this corollary. |
| 20 | Loh19 line 5850–5929, Thm.3.2.22/Cor.3.2.23, pp.135–136 | Künneth with a flat complex and its group application; factor-name misprints listed below. |
| 21 | Loh19 line 5930–5980, Examples3.2.24–25, pp.137–138 | Torus and `C_p²` computations. Package uses the correct nonzero `H₂(ℤ²)` and dimension `n+1`, not the source's slips. |
| 22 | Loh19 line 5985–6040, Outlooks3.2.26/3.2.28, pp.138–139 | Cohomological UCT/Künneth are announced rather than proved; the cup convention includes the alternative sign. Package says so and supplies its own route. |
| 23 | Loh19 line 7005–7130, Thm.4.3.7 and §4.3.2, pp.165–168 | Free sphere action gives periodicity, and elementary abelian rank-two obstruction. Package states the algebraic, twisted endpoint version, not an unowned general equivariant-CW construction. |
| 24 | MilneCFT line 3315–3332, II Example1.27(d)/Remark1.28, pp.69–70 | Conjugation with coefficient transport and normal-subgroup quotient action. |
| 25 | MilneCFT line 3357–3389, II Prop.1.30/Cor.1.33, pp.70–71 | Index identity and primary Sylow injectivity. These alone do not claim surjectivity onto stable classes. |
| 26 | MilneCFT line 3459–3484, II Prop.1.38, p.73 | Tensor-exact connecting rules and uniqueness; right connecting rule has `(−1)^p`. |
| 27 | MilneCFT line 3485–3496, II Prop.1.39, pp.73–74 | Associativity, graded symmetry, restriction, projection and inflation identities. |
| 28 | MilneCFT line 3793–3822, II Prop.3.4/Remark3.5, p.81 | Cyclic period 2 and identification by the character `g↦1/m`. Remark postpones the cup proof; package explicitly uses pinned Tate–Nakayama for that step. |
| 29 | SerreArbres line 5154–5164, II §2.8, p.168 | Decomposition into permutation modules and Shapiro with stabilizers. |
| 30 | SerreArbres line 5136–5153, II §2.8, p.168 | Tree chain boundary `target−origin` and the exact sequence with coefficients. |
| 31 | SerreArbres line 5170–5196, II §2.8 Prop.13, Remark1 and example, p.169 | Homology sums, cohomology products, endpoint signs and amalgam sequences. |
| 32 | Hutchinson13 line 482–504, §3/Thm.3.1, pp.11–12 | Stable homology and Swan period values. The supplied definition does not force leastness, hence the declared gap is necessary. |
| 33 | Hutchinson13 line 511–520, Cor.3.3, p.12 | `SL₂` localized periodic homology; proof's congruence typo is corrected in the package. |

Five additional prose comparisons, distinct from merely checking a theorem formula:

| Package prose | Source comparison | Wording result |
|---|---|---|
| README:799–810, explanation of conjugation | HS53 line 154–160 | Source gives resolution-level inner action; package states compatible pairs and their coefficient directions. No distinctive sentence reproduced. |
| README:1026–1040, hyper-(co)homology definition and proof route | HS53 line 201–216 | Package uses explicit total complexes, coefficient generality and supplier boundaries; not a clausewise rendering of the source. |
| README:1261–1271, tree chain construction | SerreArbres line 5136–5153 | Boundary formula and standard exact sequence coincide mathematically; explanatory prose is independently formulated. |
| README:1606–1622, cross-product construction | Loh19 line 5889–5929 | Package specifies shuffle transport, equivariance and coinvariants; not the source's tensor-resolution proof wording. |
| Suggested.lean:437–440, cyclic cup-periodicity docstring | MilneCFT line 3793–3822 | States a normalized character and a quantified bijection; no copied explanatory sentence. |

The largest share is HS53: **43 of 117 source-key occurrences before the References section**, counting repeated source/line references separately. Other counts are Loh19 28, Brown82 14, Hutchinson13 12, MilneCFT 11, SerreArbres 4, CE56 3 and SwanPPeriod60 2. These are reproducible citation-occurrence counts, not inflated counts of distinct theorems verified.

For arrangement, HS53's three parts are its general resolution construction, explicit extension-cochain construction, and applications of that spectral sequence (HS53 line 22–42, with part headings at line 49,367,701). There is no run of one-to-one layer/chapter pairs: the roadmap separates trees, products, double cosets and duality/periodicity, which do not form that source's chapters. Even Layer 6 does not reproduce a run of its sections: it uses II §1, II §§2–4, III §1, II §5, III §§3–4, then the separately sourced Hopf formula. The dependencies force quotient actions before extension cohomology, filtrations before their pages, products before multiplicativity, and the homological five-term sequence before Hopf. The scopes are dictated by those constructions. No copied table, figure, exercise list or source-arranged layer sequence was found.

## Not verifiable

- **Brown82 and CE56:** settled uncertified sources. Their cited chapters and sections are recorded, but neither their wording nor their complete proofs was certified from a legal text in this run. No new request was made.
- **SwanPPeriod60:** settled waived source. Period values were checked against Hutchinson13 and the current K3BlochGroups contract; the original paper's proofs were not read.
- **Full elaboration and future proofs:** no Lean build or new `#check` run was performed. The supplied elaborated signatures were used as instructed. A supplied successful elaboration does not prove any admitted theorem.
- **Declared supplier gaps:** completion of homological edge/five-term maps, naturality of the two-column flat Künneth sequence, and leastness of Swan's period remains conditional on their named contracts. The matching declarations and hypotheses were checked, not presumed implemented.
- **Copyright comparison against unavailable texts:** Brown82 and CE56 prose could not be compared. No assertion about their unobserved wording or arrangement is made; HS53, the most-cited source, was available and its contents were compared.
- **Exhaustiveness of testing:** the computed instances test the stated formulas, conventions and hypotheses; they are not formal proofs of the 44 README target rows or 14 admitted Lean theorems. No claim of a new completed formalization is made.

## Source issues

- **Misprint** in Hutchinson13 at Corollary 3.3 proof, printed p.12 (Hutchinson13 line 518): the source says the exceptional degree is congruent to three modulo three; it should be congruent to three modulo four; affects nothing.
- **Misprint** in Loh19 at Corollary 3.2.23, printed p.136 (Loh19 line 5903–5927): the source labels second-factor homology terms with the first group; it should use the second group in those terms; affects nothing.
- **Misprint** in Loh19 at Example 3.2.24, printed p.137 (Loh19 line 5954–5955): the source says the torus homology vanishes from degree two; it should vanish from degree three, with degree two equal to the integers; affects nothing.
- **Misprint** in Loh19 at Example 3.2.25, printed p.138 (Loh19 line 5976): the source labels the displayed homology with integral coefficients; it should use coefficients in the prime field; affects nothing.
- **Misprint** in Loh19 at Example 3.2.25, printed p.138 (Loh19 line 5980): the source gives dimension n for degree n homology of the elementary abelian rank-two group; it should give dimension n+1; affects nothing.

Source independence: 38 passage groups compared with 5 readable sources; no distinctive copied prose or reused source material found. Largest share HS53, 43 of 117 citation occurrences; contents compared with HS53: independent. Brown82 and CE56 wording remains uncertified; SwanPPeriod60 remains waived.

## For the human reviewers

- Brown82 and CE56 are settled uncertified sources; their prose was unavailable for the wording comparison. Their citation status was preserved, with no new access request.
- Loh19 and MilneCFT are author/institutional lecture notes in the supplied legal cache. The roadmap uses mathematical facts and locators; publication and licence decisions remain with the human reviewers.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b9ea623e4141c6750345a339083d718d8cdac8db", "job": "RT-CohomologyOfGroups~2a", "model": "gpt-6-astra", "worker": "chris-9"} -->
