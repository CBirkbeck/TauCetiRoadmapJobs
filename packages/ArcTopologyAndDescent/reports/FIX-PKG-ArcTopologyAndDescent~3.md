# Repair report: ArcTopologyAndDescent

## F01 (P2) — applied

Absent headline → `arcCover_iff_universallyEffectiveEpi`, using real-bodied `IsPerfectFpScheme` and `QcqsPerfectFp`. README §7.8 supplies their API and Checks; the Summary and acceptance overview include the criterion. Removed the false missing-category claim. Evidence: BM21 line 191 and BM21 lines 1875–1879; native full subcategories, pullback squares and effective epimorphisms suffice.

## F02 (P2) — applied

Overlapping supplier request → coherence of sheafified representables only, assigned to SchemeAndStackFoundations §2.5 in both the existing gap and its README contract. §§5.2–5.3 import AdicSpacesPartII §R0.19.10's quotient criterion; pushout coherence remains §5.2's target. Updated every gap reference, including §§5.5 and 8.6. Evidence: BM21 lines 1381–1388 and 1453–1469.

## F03 (P2) — applied

Affine-purity acceptance declarations → README-only target and Checks in §2.5. Deleted `IsRingArcCover` and `arc_affine_purity`, including README names and §2.7's reference. The Summary now includes the spectral characterization and its limit stability. The final count remains four headlines: one deleted, one added. Evidence: BM21 line 422 versus the introductory announcements at BM21 lines 98 and 191.

## F04 (P2) — applied

Local `HasAffinoidPresentation` → pinned `TauCeti.Huber.IsStrictlyTopologicallyFiniteType` in both affinoid signatures. Added explicit target topology and base nonarchimedean instance; replaced the import, supplier contract, conventions and §10.0 presentation API/Checks consistently. Evidence: `TauCeti/RingTheory/Huber/TopologicallyFiniteType.lean:133`, with identity at line 273 and quotient stability at line 207; BM21 lines 2326–2345.

## F05 (P3) — applied

“Residue-invertible primary pieces” → torsion of order invertible in K in §10.1's algebraic affine-vanishing route. Added the C_p, Z/p Check: ‖p‖<1 while p is invertible in K. Evidence: EtaleCohomologyFoundations §F.3 covers prime-to-characteristic torsion; BM21 lines 2317–2321 distinguish the characteristic-primary case. The sharper analytic theorem retains residue invertibility.

## F06 (P3) — applied

Missing reconstruction interface → missing algebraic spaces and scheme perfection in the module docstring. Separated this from the missing enhanced Perf functor. Evidence: BM21 lines 1875–1889 place algebraic spaces and perfection in the mapping theorem's statement and reconstruction in its proof. Neither algebraic spaces nor a scheme-perfection construction is present at the pins.

## F07 (P3) — applied differently

Unsupported completion ownership → GeneralAlgebraicKTheory §§8.5–8.6, 10.9, 10.12 and SchemeKTheoryOperations §3.4. Deleted the CMM21-theorem ownership claim in §12.5. The proposed “excision in degrees ≤1” overstates §10.12: it gives isomorphisms in degrees ≤0 and surjectivity in degree 1. The ownership row states these precise bounds and the separate Mayer–Vietoris assertion.

## F08 (P3) — applied

§6.1's unrelated descent locators → BM21 Lemma 5.3, p. 38, BM21 line 1556. Added BS17 line 375 to §1.6 and the manifest alongside line 208, distinguishing affine approximation from finite-presentation refinement. Deleted the unused CMM21 Lemma 6.4 locator. Evidence: BS17 lines 208–210 and 375–381; CMM21 lines 2187–2204.

## F09 (P3) — applied

Doubled article → “supplied arc-site”; I=R → I=A, explicitly retaining the fixed base ideal I⊂A in §11.4. Expanded sectionwise torsion → Mathlib `IsAddTorsion` on each affine étale section group, with its native contract and README description. Evidence: §11.1 fixes I⊂A; `Mathlib/GroupTheory/Torsion.lean:56` supplies the generated additive predicate. No torsion quantifier changed.

## Validation and signatures

- Read the main-branch ComplexTori and PadicMeasuresIwasawaAlgebras roadmaps for shape; retained this package's existing layers and targets.
- Pins read from the content checkout's manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; content main is `5f173a7b9ac37eb6b62d01eb3db5047b92d19363`.
- `lake env lean` on `packages/ArcTopologyAndDescent/Suggested.lean`, from the content checkout: exit 0, four `declaration uses sorry` warnings, no errors. The imported Tau Ceti module's object file existed; no targeted build was necessary.
- A single scratch copy contains the final acceptance file followed by `#check @name` for all nine declarations. It elaborated with exit 0 and the same four warnings. Compared every resulting signature with README §§2.7, 7.8 and 10.0–10.8; no declaration lost a binder. In particular, both affinoid types retain the target topology, nonarchimedean base instance, completeness, algebraic closedness, dimension bound and torsion hypothesis. The effective-epimorphism type retains primality and quantifies its cartesian squares inside the full subcategory.
- Five real-bodied definitions and four admitted headline theorems remain. Every declaration name appears in the README; the three deleted names appear in neither README nor acceptance file. No theorem was replaced by a proved API lemma, boundary theorem or sorried example. The imports are exactly `Mathlib` and `TauCeti.RingTheory.Huber.TopologicallyFiniteType`; no options or admitted data occur.
- Required dependency command, with `--depcheck`, `--name ArcTopologyAndDescent`, `--order merge-order/ORDER.txt` and `--movable`: exit 0; exact output:

  ```text
  depcheck: 51 roadmaps, 594 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line was emitted.
- `roadmaps resolve` on the final README: exit 0, no cross-roadmap citation found nowhere and no Lean name found nowhere. Its notice that external library names were not checked was addressed by reading the pinned sources directly; the notice is not evidence that those declarations are absent.
- Checked the three supplied citation leads: PrismaticCohomology §2.0 states `Arc.Cover.ofVCover`; SchemeAndStackFoundations §2.11 states `Etale.artinSchreier_vanishing`; `sources.toml` is a manifest filename. None requires a replacement supplier.
- Parsed the source manifest: 14 works, 14 distinct keys, no duplicate or new work. Read the supplied legal cached texts at the locators above; HUB96 remains settled as uncertified. No missing text was needed.
- JSON comparison against the starting revision confirms that only the top-level `gaps` list changed in `design/plan.json`, specifically the existing coherent-site gap's `needs` and `section`. Whitespace validation via `git diff --check` passed. No metadata edit was needed.

## Ownership and citation audit

Searched by object using `roadmaps grep` over main and the indexed open heads, and searched the board's packages and pinned libraries for perfect schemes/Frobenius, effective epimorphisms, coherent representables, quotient criteria and finite Tate presentations. Read the matching supplier text. The new category is a light full-subcategory specialization for BM21's existing §7.8 target; it does not construct another perfection, site or topos. The general perfection owner remains SchemeAndStackFoundations §§0.24–0.25. No new fully qualified declaration name duplicates an accessible roadmap declaration.

The coherent-quotient criterion is AdicSpacesPartII §R0.19.10, `Topos.isQuasiseparated_iff_of_cover`: a jointly effective-epimorphic family of coherent objects has quasi-separated target exactly when its pairwise relations are quasi-compact. Deligne points remain AdicEtaleGeometry §A1.15. SchemeAndStackFoundations §2.3 concerns torsors; §2.5 contains the coherent-site cohomology interface but does not yet state the representable-coherence extension. That extension remains explicitly recorded as `gap:coherent-topos-pushouts`; no supplier target was invented or changed.

Verified every named supplier's section locators against its applicable main copy or supplied open-head copy. The section ranges and endpoints in the exact contracts resolve as follows.

| Supplier | Sections read or resolved |
| --- | --- |
| SchemeAndStackFoundations | §§0.9, 0.11–0.14, 0.24–0.25, 1.1–1.10, 2.1–2.3, 2.5, 2.7, 2.11, 2.14–2.15, 4.7–4.8, 4.11–4.12, 4.16 |
| EnhancedDerivedSheaves | §§0.1–0.4, E0.1–E0.8, E1.3–E1.6, E2.6–E2.8, E4.1–E4.3; E5:abstract.5 and Layer E5:descent |
| EtaleCohomologyFoundations | §§F.0.1, 0.5–0.7, F.2.1–F.2.6, F.3, G.1–G.3 |
| PrismaticCohomology | §2.0 and §§0.79–0.82, including its explicit perfect-prism contracts |
| ClassicalAdicEtaleCohomology | §§2.5–2.6, 6.1, 6.3 |
| AdicEtaleGeometry | §§A1.0.5, A1.15 |
| AdicSpacesPartII | §§R0.3, R0.9, R0.13, R0.19.1–R0.19.10, R1.1, R1.3, R1.9 |
| DiamondsAndVStacks | §§D0.6, D0.11–D0.12, D0.16, D0.18, D0.22 |
| SchemeKTheoryOperations | §§3.4, 4.10 |
| GeneralAlgebraicKTheory | §§8.5–8.6, 10.9, 10.12 |
| DerivedModuleAlgebra | §§0.2, 0.4, 0.7–0.8, 0.11–0.12, 0.14, 1.1–1.9 |
| DerivedDeRhamCohomology | §§2.1–2.26 |
| PerfectoidSpaces | §§P1.4–P1.8, P1.15, P1.20, P1.24–P1.25, P1.27, P2.2, P3.2, P3.9–P3.12, P3.20 |
| PerfectoidQuotients | §§0.4–0.6 |
| AdicSpaces; RigidAnalyticGeometry | Layers 0–1; §§1.1–1.3 |
| ResolutionOfSingularitiesCharacteristicZero | §§5.1–5.2 |

GeneralAlgebraicKTheory and SchemeKTheoryOperations are new roadmap folders at their supplied heads, not revisions used in place of an existing main roadmap. The main copies were used for suppliers already present on main. Pinned full subcategories are defined in `Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean:39`; pullback squares in `Mathlib/CategoryTheory/Limits/Shapes/Pullback/IsPullback/Defs.lean:61`; effective epimorphisms in `Mathlib/CategoryTheory/EffectiveEpi/Basic.lean:71`. The full-subcategory category keeps every ambient morphism. Perfect F_p-structures introduce no additional morphism restriction because their base map is unique.

RigidAnalyticGeometry §1.1 supplies the affinoid topology and presentation comparisons. Tau Ceti's finite-type predicate retains an open quotient map, while its general definition does not assert completeness or separation of an arbitrary target. Here K is complete and the presentation is a quotient of a finite-variable Tate algebra over a field; the supplied affinoid results identify the underlying algebra and its quotient topology. No stronger claim about every topologically finite-type base was introduced.

## Adversarial mathematics pass

Each row records a statement or its displayed compatibility laws, explicit instances and computed values. V below is a nonzero valuation domain; k is algebraically closed when étale acyclicity is used. The common rank-two witness has v(y)=(1,0), v(x)=(0,1), ordered lexicographically, and middle prime p. Cohomological computations use the full augmented Čech nerve. Rows for unchanged statements record a fresh computation, not reliance on an earlier acceptance verdict.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Ring and valuation conventions | Zero ring; field k; nonfield V | Spec 0=∅; rank(k)=0; V→Frac V sends a nonunit t to a unit, while V→κ(m) kills nonzero t | Zero rings excluded only by the domain test; both extension conditions necessary | None |
| Milnor datum and lack of Tor independence | k[x,y]/(xy)=k[x]×_k k[y] | Pullback consists of polynomial pairs with equal constant term; x·y=0; Tor₁ of the two branch quotients is (x)∩(y)/(xy)=0, while Tor₂=k by the alternating x,y resolution | Ordinary pullback is the stipulated object | None |
| Cohomological shift | Z[0], Z[−1] | H⁰(Z[0])=Z; H¹(Z[−1])=H⁰(Z)=Z | Shift direction fixed | None |
| Constructibility versus Tor dimension | Λ=Z/4, M=Z/2 | Tensoring the resolution with M makes every multiplication-by-2 differential zero; Tor_i=M for all i≥0 | Constructible does not mean perfect | None |
| Cardinal and universe convention | Finite affine charts over F₂; larger cutoff | Finite sums/products of their finite cardinalities remain <κ; Hom(Spec F₂,Spec F₂) has one element at either cutoff | Fixed small objects compare; no equivalence of all objects is inferred | None |
| Analytic normalization | C₂, C₃; another prime ℓ | In C₂, ‖2‖=1/2; in C₃, ‖3‖=1/3; ‖ℓ‖=1 for ℓ≠p | Residue invertibility differs from field invertibility | F04, F05 |
| §0.1 monic-root definition | 0; Q; k×k | In 0 every positive-degree monic equation has its unique root; T²−2 has no root in Q; roots in k×k are coordinatewise pairs | Zero divisors allowed; degree-zero 1 creates no obligation | None |
| §0.1 quotient/localization API | Aic V, p=0,m | V/0=V; V/m=k; V localized at 0 is Frac V, at m is V | Root property survives both operations | None |
| §0.3 aic extension and bound | A=F_p→algebraic closure k | Chosen V₀=algebraic closure of F_p has cardinal ℵ₀=max(p,ℵ₀); V₀→k is an injective field map | Rank-zero test and stated bound agree | None |
| §0.4 finite-rank approximation | k⊂k((x))((y)) with composite valuation | Intersection with k is k, rank 0; x and y occur together at a finite-rank stage of rank 2 | Finite stages need no uniform rank-one bound | None |
| §0.5 prime-splitting square | Rank-two V; p=0,m | At the middle prime, y/xⁿ∈p and x becomes invertible in V_p; at 0 the localization/residue corner is Frac V; at m the localization is V | Pullback recovers V; endpoint squares have identity edges | None |
| §0.6 interval definition and maps | [0,m], [0,p], [p,m], [p,p] | Rings are V,V_p,V/p,κ(p); [0,p]∩[p,m]=[p,p] gives κ(p) | Ring arrows reverse interval inclusion | None |
| §0.6 shrinking intersections | Constant interval [p,p] | Every stage and its colimit are κ(p), with identity transition maps | Colimit convention agrees at a singleton | None |
| §0.7 ind-smooth valuation input | V=k; k[t]_(t); dual numbers | Ω¹_k/k=0; Ω¹_V/k=Vdt; a smooth filtered colimit is reduced whereas ε≠0 and ε²=0 | Valuation hypothesis excludes the nilpotent countermodel | None |
| §1.1 universal descent definition | Identity; split map | W=V for every valuation base change; augmented split nerve totalizes to F(X) | Universality survives split base changes | None |
| §1.1 whole nerve versus equalizer | Constant Z[0] diagram | Full totalization=Z[0]; homotopy equalizer of id,id=Z[0]⊕Z[−1], with H¹=Z | Two arrows alone give a wrong derived answer | None |
| §1.1 composition/cancellation | Three identity maps on Spec k | Composite, second map and all base changes have comparison id:F(k)→F(k) | Direction of cancellation agrees | None |
| §1.3 abstract blowup datum | Z=∅; Z=X and Y=∅ | First forces Y=X; second gives E=∅ and cover ∅⊔X=X | Surjectivity of Y alone is not required | None |
| §1.4 h-descent criterion | Identity blowup square; dual-number reduction | Identity square gives F(X)=F(X)×_{F(X)}F(X); the reduction nerve is constant at k | Criterion retains nilpotent h-covers | None |
| §1.5 perfection | F_p[t]; F_p[ε]/ε² | Perfections are F_p[t^(1/p^∞)] and F_p; Frobenius kills ε at the first step | Supplied perfection removes the nilpotent | None |
| §1.5 restricted subcanonicity | Perfect rank-two split | V injects into V_p×V/p and is its equalizer over κ(p), but the identity rank-two valuation has no lift to either branch | Canonical covering can be strictly broader than v | None |
| §1.6 fixed-base approximation | A[x₁,x₂,…]; B=A | At every finite stage x_i↦0 gives a lift with W=V; for B=A the one-stage limit is A | Correct affine approximation, with no finite presentation of B assumed | F08 locator |
| §1.7 v/subtrusive comparison | Rank-two split; generic-only rank-one inclusion | In the split, 0 and m lift but not as a comparable pair in one component; the generic inclusion has no closed-point lift | Surjectivity alone does not give v-covering | None |
| §1.7 proper example | Blowup of A² and deletion of an exceptional point | Full blowup lifts the valuation centred in that direction; deletion gives zero such lifts although the origin still has other preimages | Proper surjectivity and point surjectivity distinguished | None |
| §2.2 arc/v comparison | Rank-two split; nilimmersion over a field | Split: arc=true, v=false; nilimmersion: both=true because ε maps to 0 in every valuation domain | General comparison and noetherian-target condition agree | None |
| §2.3 Milnor arc-cover | I=0; I=A; middle-prime split | I=0 contributes Spec A as a summand; I=A makes B=A; middle split inverts x on one branch and kills y on the other | Endpoint covers are split; middle example separates v | None |
| §2.4 specialization criterion | V→Frac V; identity on rank-one V | Generic-only source has one point and no point over m; identity has the pair 0⇝m | Comparable lifts, rather than unrelated points, are required | None |
| §2.5 affine purity criterion | V→Frac V and M=V/(t) | Source M has 1≠0; target tensor is 0; module injectivity=false and arc-cover=false | True intermediate theorem, retained as prose | F03 |
| §2.5 nilpotent and zero boundaries | k[ε]/ε²→k; k→0; 0→0 | First becomes V→V after every valuation test; second sends 1 to 0 in k⊗0=0; last has zero valuation tests | Criterion gives true,false,true respectively | F03 |
| §2.5/§2.7 cancellation | A→A[x₁,…,x_n]→A[x₁,x₂,…] | Restricting the evaluation x_i↦0 lift keeps the same V and same structure map A→V | Ring and scheme directions agree | F03 reference |
| `IsSchemeArcCover` | 𝟙 X; ∅→Spec F_p | Identity takes e=id and b=a; empty source offers zero b for the test V=F_p | Predicate is nonvacuous and includes rank zero | None |
| `arc_spectral_characterization` | Identity of point/empty scheme; generic inclusion | Identity has 2/1 subsets respectively, all reflected; generic inclusion pulls {m} back to ∅ although {m} is not open and is not surjective | Both sides agree, including failure | None |
| §2.7 rank-two spectral calculation | V_p⊔V/p→V | Of 8 target subsets, precisely ∅,{0},{0,p},{0,p,m} have open inverse image; these are the 4 target opens | Arc spectral condition holds while v fails | None |
| §2.7 cofiltered limits | Constant identity diagram | Limit map=id; every compact-open inverse image equals the same compact open at every stage | Stability convention and Summary agree | F03 Summary |
| §3.1 cotruncated compact targets | Finite sets; D(Z)≥0; all spaces | Map({*},S)=S is discrete for sets; Map(Z[−1],Z[0]) has π₁=Z and π_i=0 for i>1; Map(*,K(Z,n)) has π_n=Z for every n | Bounds may depend on compact object; all spaces fail | None |
| §3.2 finitary definition | Terminal functor; infinite-variable representable | Terminal values=1 at every stage; identity on R[x_i] requires every x_i, so has zero factorizations through any fixed finite-variable stage | Continuity is substantive | None |
| §3.2 finite products/limits | Finite sets over a filtered union | A pair of elements appears together at max(i,j); the terminal tuple has one value at every stage | Finite-limit continuity does not promise infinite-product preservation | None |
| §3.3 filtered totalization | Constant split Z[0] nerves | Each totalization and the filtered colimit are Z[0], with H⁰=Z,Hⁱ=0 for i>0 | Whole nerve and bounded mapping-space argument agree | None |
| §3.4 h-to-v passage | Nilimmersion; identity cover | Every quotient nerve term is k; descent comparison is F(k[ε]/ε²)→F(k); identity comparison=id | h-cover compatibility persists under the stated approximation | None |
| §3.5 detecting families | Identity family; empty family over Spec k | Identity pullback gives the same comparison; A¹-sections of empty source=1 whereas those of Spec k=k | Empty tests do not detect descent | None |
| §3.5 product of affine tests | Two identical copies A→A | Tensor base change gives A→A×A with diagonal structure map; either projection splits it | Product direction and split argument agree | None |
| §3.6 product components | Two fields; empty family | Spec(k₁×k₂) has 2 components and 2 principal ultrafilters; Spec 0 has 0 components | Empty product and finite product conventions agree | None |
| §3.6 rank growth | Nonprincipal ultraproduct of rank-one tests | Valuations of t_i and t_i^i give positive elements α,β with β>nα for every fixed n | Rank-one is not first-order preserved | None |
| §3.7 rank-one-component obstruction | Composite valuation of k[x,y] | Values of x,y are (0,1),(1,0), yielding prime chain 0⊊p⊊m of length 2; an injective local rank-one extension would need at least these 3 primes | Obstruction concerns components, not displayed factors | None |
| §3.8 Boolean sheaf definition | 0,1,2 indices | Empty value=terminal; singleton stalk=F(A); two-point global value=F(A₁)×F(A₂) | Product, not coproduct, is required | None |
| §3.8 tensor variant | B over A₁×A₂ | B⊗(A₁×A₂) splits as B₁×B₂; its two stalks are B₁,B₂ | Base-changed formula matches idempotents | None |
| §3.9 ultraproduct detection | Two indices | All ultrafilters are principal; descent tests are exactly the 2 factors and their product | Finite case matches Boolean descent | None |
| §3.10 aic valuation detection | A=k algebraically closed; A=0 | Identity k→k gives one valuation test; Spec 0 has no such points and the empty product ring is 0 | Arbitrary-rank product theorem has correct degenerate values | None |
| §4.1 largest prime distinction | Field V=k⊂positive-rank aic W, p=0 | pW=0, but every prime contracts to 0, so largest q=m_W; W⊗_k k=W=W_q | Localization is at largest q | None |
| §4.1 kernel condition | Residue map V→k, p=0 | ker=m⊄0; pW=0 contracts to m, not 0 | Added standing containment is necessary | None |
| §4.2 finite-stage v persistence | Identity finitely presented algebra at every stage | Base change and each finite-stage map are identity, hence every valuation lift is e=id | Cartesian direction retained | None |
| §4.3 excision definition | Terminal functor; endpoints p=0,m | Terminal comparison=1→1×₁1; at endpoints valuation square has an identity side | Both excision predicates take value true | None |
| §4.3 domain base change | Node ring to either branch | Over k[y] the square is k[y]→k[y], k→k; over k[x] it is k[x]→k, k[x]→k | Pullbacks are k[y] and k[x] | None |
| §4.4 interval induction | Field; three-point chain | Field interval has length 0; [0,p]∪[p,m]=[0,m] with common endpoint p | Overlap and endpoint conventions agree | None |
| §4.4 strictness control | Chain 0⊊…⊊p₃⊊p₂⊊p₁ | Class avoiding 0 plus [0,0] has no [0,p_n], despite containing all intervals of length≤1 | Non-strict extension would be false | None |
| §4.5 three base-change cases | pW=W; p below kernel; field inclusion | First gives W/pW=0; second gives W⊗V_p=0 and W/pW=W; third gives W_q=W with q=m_W | Degenerate squares reduce to identities; third case uses largest prime | None |
| §4.6 arc/excision equivalence | Terminal functor; proper v-sheaf image of rank-two split | Terminal comparison=1; split-image sheaf omits id_V but its two restricted identities exist | All three true for terminal; non-excisive v-sheaf is not arc | None |
| §4.7 rank-one detection | Identity natural transformation; zero-to-constant sheaf map | Identity stalk map=id; at Spec k the map 0→F_ℓ has ℓ-element cokernel | Rank-zero tests detect non-equivalence | None |
| §5.1 bounded site | Empty scheme; nilimmersion; infinite arithmetic family | Empty cover has 0 terms; k[ε]/ε²→k is detected by ε↦0; any finite list of Z_(p) misses a different residue prime | Finite covering subfamilies remain essential | None |
| §5.2 coherent-site input | Finite sets with surjective covers | A finite set of m elements has a subcover of size≤m; product of sizes m,n has mn elements | Finite-limit and finite-cover criterion has the expected model | F02 narrowed gap |
| §5.2 quotient criterion | {a,b}→{*} | Relation has 4 pairs; quotient has 1 element; both are quasi-compact and quasi-separated | Supplied cover criterion gives coherent quotient | F02 Check |
| §5.2 monic pushout | {a}→{a,b}, {a}→{c}; A=∅ | Pushout={b,c}; relation sizes BB=2, BC=1, CC=1; empty A gives disjoint union | Monomorphism convention correct | F02 ownership |
| §5.2 nontrivial identified relation | A={a₁,a₂}⊂B={a₁,a₂,b}→D with C={c} | D={b,c}; B×_D B has 5 pairs, covered by 3 diagonal pairs plus the 4 A×_C A pairs | Relation cover includes the off-diagonal identifications | F02 route |
| §5.3 valuation detection | Identity; missing closed-point source | Identity has one lift of each chosen section; generic-only source has zero lifts of the closed-point section | Surjection test discriminates failure | F02 supplier reference |
| §5.4 cutoff comparison | Fixed Spec F₂ and identity cover | Its sheafified representable has one self-map over F₂ at either cutoff; inverse image retains that object | No equivalence of the entire topoi follows | None |
| §5.5 Milnor sheaf pushout | I=0 and I=A | First pushout glues an identity edge and gives h_A^#; second uses B=A and again gives h_A^# | Unrestricted-limit assertion passes endpoints | F02 gap reference |
| §5.6 non-subcanonicity | k[ε]/ε²→k | All quotient Čech terms=k; affine-line values are k[ε]/ε² and k; ε is nonzero only on the first side | Unsheafified representable fails descent | None |
| §6.1 strict-henselian calculation | Algebraically closed field; rank-one aic V | For constants Λ, RΓ=Λ[0] and finite étale degree n object is n copies; closed-stalk value=Λ | Correct strict-henselian input, no descent lemma misattributed | F08 locator |
| §6.2 strict-local detection | Identity; constant Λ on Spec k | All stalk comparisons=id_Λ and total comparison=id_Λ | Detection orientation agrees | None |
| §6.5 chain category | Rank 0, rank 1; fold map | Rank 0 has 1 stalk; rank 1 has 2 stalks and 1 generization; two copies fold {1,2}→{*} | Object transition injections do not constrain all morphisms | None |
| §6.6 étale-object descent | Empty base; Spec k | Over the empty base the space category has its unique empty object; over k the category is FinSet, including the noninjective fold | Full morphism categories retained | None |
| §7.3 constructible chains | Rank 1 skyscraper; Λ=Z/4,M=Z/2 | Closed-to-generic arrow is Λ→0; Tor_i(M,M)=M for every i | Generization direction and coefficient generality agree | None |
| §7.4 h-forms | k, k[t], dual numbers | F₀(k)=k; F₁(k)=0; F₁(k[t])=k[t]dt; F₀(k[ε]/ε²)=k | h-sheafification differs from naive forms on singular input | None |
| §7.4 Hodge shift | k[t], i=1 | gr¹_dR=Ω¹[−1], with H¹=k[t]dt and no degree-zero part | Shift agrees with conventions | None |
| §7.5 smooth comparison | k and k[t] | Zariski and h values are respectively k and k[t]dt in degree 0; higher affine cohomology=0 | Smooth comparison matches both degrees | None |
| §7.6 valuation differentials | Aic characteristic-zero V and z∈p | z has a square root w in V, primality gives w∈p, and z=w² lies in p²; for V=k all Ωⁱ, i>0, are 0 | Idempotent-prime input and flat zero-module boundary agree | None |
| §7.7 Perf arc descent | Perfect field; zero ring; identity hypercover | Perf(k) returns itself; Perf(0) has one zero object; totalization of constant Perf(k) is Perf(k) | No replacement by unbounded D_qc | None |
| `IsPerfectFpScheme`: empty and nilpotent | Empty scheme; F₂[ε]/ε²; F₃[ε]/ε² | Empty sections=0 with a singleton Frobenius map; ε²=0 and ε³=0 while ε≠0 in both nonzero rings | Empty passes; nilpotent schemes fail | F01 |
| `IsPerfectFpScheme`: reduced non-example | F_p[t] | t is absent from Frobenius image F_p[t^p], whereas ε did not occur in this reduced ring | Reducedness alone is insufficient | F01 |
| `IsPerfectFpScheme`: perfected example and API | F_p[t^(1/p^∞)]; localizations; constants | Forward sends t^(1/p²) to t^(1/p), inverse sends it to t^(1/p³); inverse on fractions sends a/s to a^(1/p)/s^(1/p); 1²=1 in F₂ and 2³=2 in F₃ | Inverse, restriction and gluing determine the intended perfect object | F01 |
| `IsPerfectFpScheme`: nonprime parameters | p=0,1,4 | For 0, the power map is constant 1 and bijectivity forces the zero ring; for 1, the scalar equation is 1=0; for 4 on F₂, 4=0 and x⁴=x | Only the empty scheme passes at 0,1; composite 4 can pass, so the theorem retains primality | F01 README boundary Check |
| `QcqsPerfectFp` | ∅; perfect affine line; infinite disjoint union of F_p-points | First has 0 affine points; second has 1 affine chart; infinite union needs infinitely many singleton opens | Affines pass; perfect quasi-separated noncompact union fails | F01 |
| §7.8 full category and pullbacks | Two perfect fields over F_p; two-point scheme | Each structure map from F_p is unique; tensor Frobenius inverse sends a⊗b to a^(1/p)⊗b^(1/p); two points have 2 maps from Spec F_p | No extra linearity datum is missing; fibre products stay perfect | F01 |
| `arcCover_iff_universallyEffectiveEpi` | Identity; ∅→Spec F_p | Identity base changes are isomorphisms, so true↔true; empty source has 0 valuation lifts and 2 distinct outgoing maps agreeing on it, so false↔false | Both directions pass boundaries | F01 |
| §7.8 mapping descent | Perfect Spec F_p; dual-number source before perfection | Hom(Spec F_p,Spec F_p)=1; dual numbers perfect to F_p, giving the same one-element Hom set | Perfection is a statement carrier; reconstruction is a proof input | F06 |
| §8.1 formal datum | I=0; I=A; Z→Z_p | Quotients for I=0 are A,B; for I=A both are 0; for (p) both are Z/pⁿ | Identity/unit boundaries and all n agree | None |
| §8.1 base change/open union | I=(x,y) and points (0,1),(1,0) | First point lies only in D(y), second only in D(x); both lie in their union and neither in D(xy) | Whole puncture retained | None |
| §8.4 rank-one completion | Z_p,(p); t=0; t=1 | Completion is Z_p and map=id; 0-adic completion=V; unit-adic completion=0 | Claimed extension concerns only nonzero nonunits | None |
| §8.5 formal arc-cover and v failure | Rank-two V with I=(x) | y/xⁿ has value (1,−n)>0, so y∈xⁿV for all n and y maps to 0 in completion; open branch inverts x | Arc lift exists, faithful rank-two lift cannot use either branch | None |
| §8.6 arbitrary-valued formal glueing | I=0; I=A; identity datum | I=0 gives F(A)=F(B); I=A gives F(B)×_{F(B)}F(A)=F(A); identity datum gives identity square | Both boundaries agree for every small-limit target | F02 dependency |
| §8.7 rigidity and API | Constant functor; underlying ring on Z_p | Constant comparison=id_C; Z_p→F_p has p≠0 in kernel | Underlying ring is a negative control; limits of identity comparisons remain identities | None |
| §8.8 punctured comparison | Complete aic rank-one V,(t); I=0,A | Nondegenerate puncture=Spec Frac V with value Λ[0] on both sides; I=0 gives 0; a henselian unit ideal forces A=0 and both values=0 | Stable-fibre route respects endpoints | None |
| §8.9 support refinement | A=Z_p, a=p; U=Spec A | Completion map=id; both whole-open cohomologies equal RΓ(A,F), both support fibres equal fib(RΓ(A,F)→RΓ(Q_p,F)) | Target allows U larger than D(a) | None |
| §9.1 arc_t definition | t=0, t=1; complete rank-one V,(t) | First two classes have 0 tests and every map passes; V→Frac V has 0 lifts of the identity test | Excluded parameter values and nontrivial tests agree | None |
| §9.1 boundary cover formula | t=0 or 1 | At 0 the R/t factor is R; at 1 the R[1/t] factor is R | Adjoining boundaries yields an identity summand | None |
| §9.2 Tate-pair detection | Identity pair; subdisc | Identity lifts every rank-one point; ‖T‖≤‖π‖ omits T=1 since 1>‖π‖ | Generic rank-one surjectivity detects the omitted point | None |
| §9.3 equivalence definition and direction | Z_p[x]/(px)→Z_p; identity; V→Frac V | In a domain test with p≠0, px=0 forces x=0 uniquely; identity Hom map=id; inversion has empty source Hom and nonempty target Hom | Precomposition direction correct | None |
| §9.3 completion/integral closure API | Complete aic rank-one V | Completion of V=V; integral closure of V in Frac V=V; all Hom comparisons=id | Supplied complete integrally closed tests determine maps | None |
| §9.4 E_t definition | Complete aic V; t=0, t unit, field with t≠0 | E_t(V,Λ)=Λ[0]; other three values=0 because localization or completion is 0 | Completion is taken before inversion | None |
| §9.4 finitariness | R_n=A/tⁿ, filtered toward R_1 | Every completed generic fibre is empty, so colim E_t(R_n)=0=E_t(colim R_n) | Boundary continuity uses cohomology, not an assertion on naive completion | None |
| §9.5 hyperdescent | Identity hypercover; empty test class | Constant augmented totalization=E_t(R); when t=0 or 1, both sides=0 | Uniform nonnegative range and augmentation agree | None |
| §9.7 uniform denominator definition | Z_p,p and x=p⁻¹ | For a proposed c, n=c+1 gives p^c xⁿ=p⁻¹∉Z_p | Uniformity in n is essential | None |
| §9.7 nonnoetherian distinction | Rank-two V, parameter t=y, x⁻¹ | y(x⁻¹)ⁿ has value (1,−n)>0 for every n, so x⁻¹ is totally integral but is not in integrally closed V | Total integral closure can exceed integral closure | None |
| §9.7 algebra and unit boundary | x,z with bounds c,d; t unit | Each term t^(c+d)x^i z^(n−i) lies in A; xz has the same bound; if t is a unit, A[1/t]=A | Subring laws and unit parameter agree | None |
| §9.8 invariance | Remove px-torsion as above; identity | Complete valuation Hom sets identify uniquely; both completed generic rings are Q_p, with value RΓ(Q_p,G); identity comparison=id | Uniqueness, rather than covering alone, collapses nerve | None |
| §9.9 universal homeomorphisms | Dual-number reduction; F_p(t)⊂F_p(t^(1/p)) | The first kernel has ε²=0; in the second, (t^(1/p)⊗1−1⊗t^(1/p))^p=0; sheafified maps become equivalences | Nilpotent and inseparable cases both retained | None |
| §9.10 common-closure excision | k[t²,t³]→k[t], parameter t² | Common total closure=k[t]; quotients have bases {1,t³} and {1,t}, each with square-zero second basis vector; both sheaf values reduce to F(k) | Pullback is F(k[t])×_{F(k)}F(k)=F(k[t]) | None |
| §10.0 strict finite type | n=0; Tate algebra; unit quotient | Identity presents K; identity presents K⟨T⟩; quotient by 1 gives 0 | Pinned predicate covers all three values with their topologies | F04 |
| §10.0 nonreduced presentation | K⟨T⟩/(T²) | Elements a+bT have T≠0,T²=0; quotient map is open and surjective | Reducedness would wrongly exclude it | F04 |
| `IsTorsionEtaleSheaf` | Zero sheaf; constant Z/6; constant Z | Annihilators are 1 and 6; for section 1 of Z, n·1=n≠0 for all n>0 | Native predicate agrees with original meaning | F09 |
| §10.0 nonuniform torsion API | Direct sum of Z/ℓ^r; an extension | A finitely supported section is killed by ℓ^max(r); if quotient and kernel bounds are ℓ^a,ℓ^b, extension bound is ℓ^(a+b) | No common exponent over every section is imposed | None |
| `IsPrimePowerTorsionEtaleSheaf` | Z/ℓ²; Z/r, r≠ℓ; ℓ=0,1 | ℓ² kills 1 but ℓ does not; ℓ^n is nonzero modulo r; 0¹ kills all sections and 1^n kills only 0 | The sharper theorem must retain primality | None |
| §10.1 rational-domain bound | Unit pair (T,1) at T=0 | max(0,1)=1 and min(0,1)=0 | Correct positive lower bound uses maximum | None |
| §10.1 coefficient route | C_p,Z/p; characteristic-p model of dimension 1 | In C_p, p has inverse but ‖p‖<1; algebraic affine bound is q>n. In characteristic p, Artin–Schreier gives q≥2, hence q>1 | Two primary ranges are now exhaustive | F05 |
| §10.1 zero-dimensional model | K[ε]/ε²; direct sum primary coefficients | Reduced residue=K gives H^q=0 for q≥1; each finite subgroup has the same zero higher groups and their colimit is 0 | Nilpotents and unbounded torsion exponents retained | None |
| §10.2 rational Mayer–Vietoris | f=g=1; f=0,g=1 | First gives four identical cohomology terms; second gives one zero algebra and one A, so pullback=A-cohomology | Rational denominator convention passes 0 and 1 | None |
| §10.3 shrinking tubes | r=0,1; f=0; f=1 | Relations U₀=f and πU₁=f; transition π⁰·πU₁=f; f=0 gives constant zero variables, f=1 eventually has empty tubes | Direction U_r↦πU_(r+1) and shrinking radius agree | None |
| §10.5 valuation Künneth | R=R′=V; boundary factor R=V/t | Nondegenerate values Λ[0]⊗_ΛΛ[0]=Λ[0]; boundary gives 0⊗Λ=0 and completed generic tensor=0 | Residue-invertible coefficient range unchanged | None |
| §10.6 affinoid Künneth | A=K²,B=K³; A=0 | Tensor algebra=K⁶ and H⁰=Λ⁶; tensor of groups Λ²⊗Λ³=Λ⁶; zero factor gives 0 on both sides | Completed tensor and finite products agree | None |
| §10.7 dimension contradiction | d=1,2 | Hypothetical H^(d+1) gives degrees 4 and 6 on the square, while upper vanish bounds are 3 and 5 | Contradiction uses dimension≤2d, not equality | None |
| `affinoid_artin_grothendieck` | A=0,K,K²; d=0,1,2 | H^q(0,F)=0 in all degrees; for constant Λ, H⁰(K)=Λ,H⁰(K²)=Λ² and positive groups=0; allowed q start at 2,3,4 respectively | General bound and upper-dimension formulation agree | F04 hypotheses |
| Prime-to-residue affinoid headline | C₂ with ℓ=3; C₃ with ℓ=2; ℓ=p | First norms=1,1 and H^q(K,F_ℓ)=0 for q>0; residue primes have norms 1/2,1/3 and are excluded | Sharper bound retains the correct prime test | F04 hypotheses |
| §10.8 trace reduction | S₃, ℓ=2,3; C_ℓ; trivial group | Sylow indices 3,2 act as 1 mod 2 and 2 mod 3 with inverse 2; (g−1)^ℓ=g^ℓ−1=0; trivial trace=1 | Nonabelian and cyclic tests support the reduction | None |
| §11.1 complete-cover definition | I=0,A; Z_p→Q_p | 0-completion leaves every V; A-completion admits 0 nonzero V; identity Z_p test has no lift through Q_p | Boundaries give ordinary arc, empty tests, failed cover | None |
| §11.1 ideal monotonicity and reduction | 0⊂(p)⊂A in Z_p | Test classes shrink from all rank≤1 valuations to p-complete ones to ∅; reduction at p gives ordinary tests over F_p | Inclusion direction and reduction agree | None |
| §11.2 complete valuation products | 0,1,2 factors; D((t,1)) | Empty product=0 with 0 components; one factor has 1; D((t,1)) in V₁×V₂ has components Spec Frac V₁ and Spec V₂ | Components of opens are localized, not unchanged factors | None |
| §11.3 formal-site comparison | Characteristic-p field; F_p[ε]/ε² | p=0 makes all these valuations p-complete; ε maps to 0 in every valuation lift | Rank-zero tests matter and nilimmersion remains a cover | F09 article |
| §11.4 arc_I definition and unit boundary | I=0,A; I=(2,3)⊂Z | Nonzero-proper test class has size 0 for both endpoints; in Z, D(2)∪D(3)=Spec Z although neither generator is a unit | Fixed base ideal is A, and all principal pieces are needed | F09 |
| §11.4 two generators | I=(x,y), points (0,1),(1,0) | First belongs only to D(y), second only to D(x); neither belongs to D(xy) | Boundary-cover equivalence uses union | None |
| §11.5 completed/punctured hyperdescent | I=0,A; constant identity hypercover | At I=0 whole completion=A and puncture=∅; at I=A completion=0 and puncture=∅; identity totalizations keep the same complexes | Four displayed functors respect empty punctures | None |
| §12.2 perfectoid generic comparison | A=O_Cp; F_p×O_Cp; perfect char-p A | First generic ring=C_p with constant cohomology Z/pⁿ[0]; product has the same generic ring after removing F_p; char-p generic ring=0 and all groups=0 | Normalization and empty cases agree | None |
| §12.4 formal-target descent | T disjoint union of formal F_p-points; source Spf F_p | Hom is the target's index set I; identity-cover descent returns I; empty source Hom has 1 element | Arbitrary target need not be qcqs | None |
| §12.5 proper henselian comparison | P¹ over O_Cp, ℓ≠p | Whole and closed fibre have H⁰=F_ℓ,H¹=0,H²=F_ℓ(−1), all higher groups=0 | Proper and affine henselian inputs combine without a K-theory ownership assertion | F07 |
| §12.6 tilt/parameter compatibility | Perfect F_p with ϖ=ϖ♭=0; identity O_Cp cover | Characteristic-p tilt=itself and both 0-complete predicates are ordinary arc; identity cover gives true on both sides for compatible pseudouniformizers | Sharp/tilt direction agrees; hypotheses retained | None |
| §12.7 integral perfectoid hyperdescent | A=F_p and A=0, identity hypercovers | For F_p, A♭=F_p,A_inf=Z_p and Z_p/(p)=F_p; Rlim of each constant nerve is that same ring in degree 0. For 0 all three are 0 | Three comparison maps and empty boundary agree | None |
| §12 examples: full formal site versus Perfd | F_p[ε]/ε²→F_p | Formal arc tests kill ε, but the first ring is not perfectoid; its structure presheaf still has ε≠0 | Acyclicity is restricted to its stated perfectoid objects | None |
| Scope's K-theory contract | Identity Milnor datum; noetherian supported completion | Relative fibres for an identity map are 0 in every degree; Z_(p)/pⁿ=Z/pⁿ=Z_p/pⁿ for n≥1, identifying the supported models | Excision degree-1 output is only a surjection; supported comparison has its own owner | F07 precise replacement |

## Maintainer notes

No gate failures were listed in the brief. The required dependency gate passes after the repairs, and no order or tooling edit was made. The remaining five named supplier gaps persist; the coherent-site gap has narrower content and the correct supplier section, without requiring an unauthorized edit to that supplier.

Downstream acceptance references to `IsRingArcCover`, `arc_affine_purity` or `HasAffinoidPresentation` must use the README's mathematical interfaces or the pinned strict finite-type predicate. The retained affinoid theorem names now require a topological target and the explicit nonarchimedean base instance. The new acceptance names are `IsPerfectFpScheme`, `QcqsPerfectFp` and `arcCover_iff_universallyEffectiveEpi`.

The permitted edit boundary leaves historical target-name/ownership text inside the non-gap portion of `design/plan.json` untouched; its catalog entries are not the normative README or acceptance file. Only its top-level supplier gap was editable. No new roadmap target, layer, supplier theorem, merge-order placement, external message or commit was created.
