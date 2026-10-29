# Repair report: ArcTopologyAndDescent

## F01 (P2) — applied

Unstated limit headline → `isSchemeArcCover_of_isLimit`, on native cofiltered diagrams, affine transition maps and two actual limit cones. Named it in §2.7, stated its quantifiers, added three prose Checks, completed the native supplier inventory and updated the headline count. Added the precise locator under the existing BM21 key: Corollary 2.20, p. 14, BM21 line 560.

## F02 (P3) — applied

Unsupported map from V to a component ring → the connected image of Spec W and its three distinct point images. Section 3.7 now computes the contractions 0, (y), (x,y), and supplies three Checks. The statement is BM21 Remark 3.31, p. 23, BM21 line 978; the expanded argument supplies the missing justification.

## F03 (P3) — applied

Incomplete §7.8 prerequisites → explicit §2.7 cover predicate, SchemeAndStackFoundations §§0.24–0.25 and the three native category carriers. Named `Scheme.IsPerfect` with its owner. Layer 7 dependencies now include Layer 2 and §0.25. Verified the owner's Frobenius-isomorphism definition at `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1565`; the sectionwise predicate has the same meaning for prime p.

## F04 (P3) — applied

Repeated, unqualified CMM21-use sentence → deleted. Section 12.5 retains the general henselian-pair theorem and the precise I=(p) application. CMM21 lines 2180 and 2187–2189 state that special setting; generality comes from SchemeAndStackFoundations §2.15 and EtaleCohomologyFoundations §F.2.1. No theorem or hypothesis was narrowed.

## Checks and elaborated signatures

- Read the main-branch ComplexTori and PadicMeasuresIwasawaAlgebras roadmaps for shape. Preserved all existing layers, ownership and targets.
- Verified the manifest pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The local content main read for supplier citations is `98a9b7af364bff4bdaabf4b6e74785b283c80c87`.
- Required elaboration, `lake env lean` on `packages/ArcTopologyAndDescent/Suggested.lean`, run from the content checkout: **exit 0**. Exactly five `declaration uses sorry` warnings, at lines 55, 67, 89, 111 and 122; no errors. The imported Tau Ceti module's object file was available; no build was needed.
- Elaborated one scratch copy of the final file with `#check @name` for **all ten declarations**: **exit 0**, the same five warnings. Compared each output with README §§2.7, 7.8 and 10.0–10.8. No section binder was lost; there is no section-variable block. The new theorem explicitly retains both `hX : IsLimit cX` and `hY : IsLimit cY`, all four objectwise qcqs instances, both affine-transition instances, cofilteredness and the componentwise cover hypothesis. The perfect-scheme theorem retains primality and all four maps of the pullback square. Both analytic statements retain their topology, field, finite-presentation, dimension and coefficient hypotheses. No existing signature changed.
- The final file contains five real-bodied definitions and five admitted headline theorems, 132 lines, with exactly `import Mathlib` and `import TauCeti.RingTheory.Huber.TopologicallyFiniteType`. Every own declaration name appears in the README. No option, admitted data, API theorem, boundary theorem or example was added.
- Required dependency check with `--depcheck`, `--name ArcTopologyAndDescent`, `--order merge-order/ORDER.txt` and `--movable`: **exit 0**. Exact final output:

  ```text
  depcheck: 52 roadmaps, 596 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line. The added Layer 2 reference is internal, and the named external suppliers are unchanged.
- Citation resolution: **exit 0**; no cross-roadmap citation or Lean name found nowhere. Its indexed main is `e98875d`, with the supplied 363-head index. Its notice that pinned Lake packages were unavailable to the resolver was addressed by opening the actual pinned sources directly. Main-branch section locators were also checked in the local content main identified above.
- The four initial citation leads resolve: `Arc.Cover.ofVCover` is in PrismaticCohomology §2.0; `Etale.artinSchreier_vanishing` is in SchemeAndStackFoundations §2.11 and its `Suggested.lean:1405`; `Topos.isQuasiseparated_iff_of_cover` is in AdicSpacesPartII §R0.19.10 at README line 8039; `sources.toml` is the manifest filename.
- Parsed `sources.toml`: 14 works with 14 distinct keys. Reused BM21 and its certified version for the new locator. All necessary texts were supplied as legal cached extractions; no new source or missing-reference request was necessary. HUB96 remains settled as uncertified and was not requested.
- All five supplier gaps agree with their README contracts. `design/plan.json` and `metadata.toml` are unchanged. No gate failures were listed in the brief. `git diff --check` passes.

## Pattern, ownership and citation audit

Searched the entire README and acceptance file for limit stability, headline counts, component/rank claims, perfection prerequisites and CMM21 uses. The Summary's limit clause agrees with §2.7 and the added signature; How to read the build now counts five signatures. The other component discussions in §§3.6, 3.10, 4.7, 11.2 and the worked valuation example retain the distinction between factors and ultraproduct components; none asserts the unsupported map. Section 7.7 already names the perfection supplier. Section 8.7's CMM21 reference describes the valid proper comparison, rather than another copy of the deleted sentence. No name was deleted or renamed.

The new signature is the scheme arc-cover corollary, owned by this roadmap's existing §2.7. DiamondsAndVStacks §§D0.11–D0.12 own spectral submersions and their topological limit theorem; SchemeAndStackFoundations §0.9 owns scheme limits; PrismaticCohomology §2.0 owns the cover predicate and its elementary calculus. None is reconstructed here. Section 7.8's sectionwise perfectness definition remains only the light specialization needed to state its headline, with generic perfection owned by SchemeAndStackFoundations §§0.24–0.25.

Ran the mandated `roadmaps grep` object searches over indexed main and open heads, and searched the board packages and pinned sources for valuation lifting, rank bounds, arc-cover limits, perfect schemes and effective epimorphisms. Read the relevant supplier matches. No new fully qualified declaration duplicates an accessible supplier declaration. Named sibling pull requests had no individual checkout paths in the brief: ownership against separately supplied sibling checkouts was not checked; the mandated indexed searches did cover the open heads. Revisions of existing suppliers were not used in place of main.

The cross-roadmap locators checked against the applicable main files or indexed heads are:

| Supplier | Resolved sections |
| --- | --- |
| SchemeAndStackFoundations | §§0.9, 0.11–0.14, 0.24–0.25, 1.1–1.10, 2.1–2.3, 2.5, 2.7, 2.11, 2.14–2.15, 4.7–4.8, 4.11–4.12, 4.16 |
| EnhancedDerivedSheaves | §§0.1–0.4, E0.1–E0.8, E1.3–E1.6, E2.6–E2.8, E4.1–E4.3, E5:abstract.5; Layer E5:descent |
| EtaleCohomologyFoundations | §§F.0.1, 0.5–0.7, F.2.1–F.2.6, F.3, G.1–G.3 |
| PrismaticCohomology | §2.0; §§0.79–0.82 and the perfect-prism contracts |
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

The added native carriers were opened at the pins, rather than inferred from the resolver:

| Declaration | Pinned source and content verified |
| --- | --- |
| `IsAffineHom` | `Mathlib/AlgebraicGeometry/Morphisms/Affine.lean:47`: affine inverse images of affine opens |
| `CategoryTheory.IsCofiltered` | `Mathlib/CategoryTheory/Filtered/Basic.lean:590`: cofilteredness includes nonemptiness |
| `CategoryTheory.Limits.Cone` | `Mathlib/CategoryTheory/Limits/Cones.lean:116`: apex and natural projection |
| `CategoryTheory.Limits.Cone.postcompose` | `Mathlib/CategoryTheory/Limits/Cones.lean:373`: same apex, projection composed with the natural transformation |
| `CategoryTheory.Limits.IsLimit` | `Mathlib/CategoryTheory/Limits/IsLimit.lean:49`: lift, factorization and uniqueness |
| `CategoryTheory.ObjectProperty.FullSubcategory` | `Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean:39`: object predicate with all ambient morphisms |
| `CategoryTheory.IsPullback` | `Mathlib/CategoryTheory/Limits/Shapes/Pullback/IsPullback/Defs.lean:61`: commuting square with limit property |
| `CategoryTheory.EffectiveEpi` | `Mathlib/CategoryTheory/EffectiveEpi/Basic.lean:71`: universal descent of maps constant on relations |

Mathlib's `ValuativeCommSq` at `Mathlib/AlgebraicGeometry/ValuativeCriterion.lean:52` fixes a fraction-field square and asks for a lift over the original valuation ring; it is not the extension-valued arc condition. The native affine-transition-limit file uses `Cone.postcompose` at line 96. The new theorem imports this calculus without planning another limit construction.

## Adversarial mathematics pass

These are computations, not proofs of the general targets. The valuation convention throughout is lexicographic, v(y)=(1,0), v(x)=(0,1), with middle prime p; all its uses in §§0.5–0.6, 2.3, 3.7, 4.3, 8.5 and Worked examples were recomputed. Aic valuations are used when a statement requires them. Coefficients Λ below are nonzero finite constant coefficients where cohomology is computed, and fields are algebraically closed when higher étale cohomology is set to zero. Rows cover the statements, their defining conditions and the displayed compatibility laws; changed statements have separate boundary rows.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Ring/domain convention | Zero ring; field k | Spec 0=∅ and 0=1; Spec k has one point, rank 0 | Domain tests exclude 0 and include fields | None |
| Valuation extension convention | id V; V→Frac V; V→κ(m), V nonfield | id reflects units and has kernel 0; t becomes a unit in Frac V; nonzero t∈m dies in κ(m) | Both injectivity and locality are needed | None |
| Milnor datum | A=k[x,y]/(xy), B=k[y], I=(y), J=(y), A/I=k[x] | I maps isomorphically to J, B/J=k, and k[y]×_k k[x]=A; Tor₁ of the two branch quotients is 0, Tor₂=k | Ordinary pullback imposes no Tor independence | None |
| Interval/map convention | Rank-two V | V_[0,p]=V_p; V_[p,m]=V/p; V_[p,p]=κ(p); V→V_p inverts x and V→V/p kills y | Ring arrows reverse interval inclusion | None |
| Finite-ideal puncture convention | (x,y), points (0,1),(1,0) | Both points lie in D(x)∪D(y); neither lies in D(xy) | Union and whole generating tuple required | None |
| Cohomological convention | Z[0], Z[−1] | H⁰(Z[0])=Z; H¹(Z[−1])=Z | Shift sign fixed | None |
| Constructibility convention | Z/2 over Z/4 | All tensor-resolution differentials are 0; Tor_i=Z/2 for every i≥0 | Finite Tor dimension is an additional condition | None |
| Cardinal/universe convention | Spec F₂; increasing κ | End(Spec F₂) has one element at either cutoff; a chart of size ≥κ is absent from the smaller skeleton | Comparison on a fixed small object does not identify all objects | None |
| Perfectoid convention | Perfect F_p-field k; dual numbers | k♭=k with bijective Frobenius; ε^p=0≠ε in the dual numbers | Perfect rings admitted; dual numbers excluded | None |
| Analytic convention | C₂,C₃; another prime ℓ | Norms of 2 and 3 are 1/2 and 1/3 respectively; norm of ℓ≠p is 1 | Residue-invertibility test has the right normalization | None |
| §0.1 aic definition/domain equivalence | 0; Q; algebraically closed field k | 0 has its unique root; T²−2 has no Q-root; all monic positive-degree equations split over k | Degree-zero polynomial 1 imposes no condition | None |
| §0.1 quotient/localization/product laws | Aic V; p=0,m; k×k | Quotients V and κ(m), localizations Frac V and V; roots in k×k are pairs of roots | Zero divisors and field endpoints retained | None |
| §0.3 aic extension and cardinal bound | F_p→an algebraically closed field k | Choose V₀=algebraic closure of F_p inside k; size ℵ₀=max(p,ℵ₀); its field inclusion is injective local | Rank-zero witness realizes the bound | None |
| §0.4 finite-rank approximation | Composite valuation on k((x))((y)) | Intersection with k is rank 0; the k(x,y) subfield contains both x and y and gives rank 2 | No uniform rank-one bound | None |
| §0.5 prime square | Rank two; p=0,m | V_p×_κ(p)V/p=V; at 0 this is Frac V×_Frac V V=V; at m it is V×_κ(m)κ(m)=V | Pullback and endpoint cases agree | None |
| §0.6 interval object | [0,m], [0,p], [p,m], [p,p] | Rings V,V_p,V/p,κ(p); overlapping intervals meet in the κ(p) corner | The singleton does not give V_p | None |
| §0.6 interval colimits and transport | Constant shrinking interval [p,p]; two identity inclusions | Colimit κ(p); composite ring map id∘id=id | Intersection and arrow convention agree | None |
| §0.7 smooth approximation | V=k; k[t]_(t); dual numbers | Ω¹_k/k=0; Ω¹_V/k=Vdt; dual numbers have ε≠0, ε²=0 | Smooth filtered colimits are reduced, excluding the negative model | None |
| §1.1 universal descent | Identity; split cover | Every test lift uses W=V; split augmented totalization is F(X) | Universality includes every base change | None |
| §1.1 totalization versus equalizer | Constant Z[0] diagram | Full totalization Z[0]; homotopy equalizer of id,id is Z[0]⊕Z[−1] with H¹=Z | Truncating to two arrows is wrong | None |
| §1.1 composition/cancellation | Three identities on Spec k | All three comparison maps equal id on F(k), before and after base change | Cancellation points toward the target | None |
| §1.3 blowup object | Z=∅; Z=X,Y=∅; Bl₀A² | Y=X in the first case; E=∅ and cover=X in the second; E=P¹ in the third | Y alone need not surject | None |
| §1.3 generators/base change | Nilimmersion; deleted exceptional point | Dual-number nerve is constantly Spec k; the line in the deleted direction has 0 valuation lifts after deletion, 1 before | Point-surjectivity does not imply h-covering | None |
| §1.4 blowup criterion | Add the centre as a disjoint component | F(Y⊔Z)×_F(E⊔Z)F(Z)=F(Y)×_F(E)F(Z); identity square gives F(X) | Extra centre cancels with finite-product descent | None |
| §1.5 perfection | F_p[t]; F_p[ε]/ε² | Perfections F_p[t^(1/p^∞)] and F_p; ε maps to 0 under Frobenius | Nilpotent input is correctly lost | None |
| §1.5 canonical versus v | Perfect rank-two split | Equalizer of the two branch section maps is V; identity valuation has 0 faithful lifts to either branch | Canonical covers can be broader than v | None |
| §1.6 fixed-base approximation | A[x₁,x₂,…]; A itself | Every finite stage has the section x_i↦0; one-stage identity has W=V | No finite presentation of the limit algebra imposed | None |
| §1.7 subtrusiveness | Rank-two split; generic-only rank-one inclusion | Split has all 3 target points but no comparable lift over 0⇝m; generic inclusion has 0 closed-point lifts | Specialization lifting differs from surjectivity | None |
| §1.7 proper/faithfully flat examples | Full blowup; two-component fold | Proper valuation lift exists in the chosen direction; fold has two possible component lifts and a section | Valid v-covers satisfy the stronger test | None |
| §2.2 arc/v comparison | Rank-two split; dual-number reduction | Split arc=true,v=false; reduction arc=true,v=true since ε dies in every domain | Noetherian target condition is not a condition merely on the base | None |
| §2.3 Milnor covers | I=0; I=A; middle prime | First cover has identity summand; second forces B=A; middle split kills y or inverts x | Boundary and rank-two examples agree | None |
| §2.4 rank-one specialization criterion | Spec(Frac V×κ(m))→Spec V; id | First source has 2 incomparable points and fails the criterion; id has 0⇝m and passes | Two unrelated endpoint lifts do not suffice | None |
| §2.5 lifting/purity | V→Frac V; dual-number quotient; k→0 | V/(t)≠0 maps to 0 after tensoring with Frac V; quotient base change to V is id; k maps to zero | Universal module injectivity is stronger than injectivity | None |
| §2.5 cover API | A→A[x]→A[x,y]; 0→0 | Set x=y=0, then restrict to A[x]; 0 has no nonzero valuation tests | Cancellation direction and empty test case agree | None |
| `IsSchemeArcCover` | id Spec k; ∅→Spec k; Spec k→dual numbers | Lifts use k itself; empty source has 0 lifts; ε↦0 gives the reduction lift | Nonvacuous on native scheme maps | None |
| `arc_spectral_characterization` | Identity; generic-only inclusion; rank-two split | Identity reflects its 2 subsets; closed singleton of Spec V has empty open inverse image under the generic inclusion but is not open; split reflects exactly ∅,{0},{0,p},{0,p,m} of the 8 target subsets | Both directions distinguish arc from plain point surjectivity | None |
| `isSchemeArcCover_of_isLimit` | One-object identity cones | hX.lift(postcompose f cY)=f; the conclusion and component hypothesis are the same predicate | Correct map direction | F01 |
| Limit theorem, infinite tower | X_n=Spec k[t₁,…,t_n], Y_n=X_n⊔X_n | Limits Spec k[t₁,t₂,…] and its two-component fold; section choosing the first component gives W=V for every test | No finite-type assumption on the limit | F01 |
| Limit theorem, source cone | Constant Spec k diagrams; replace source limit by ∅ | With actual limits the induced identity has a lift; with apex ∅ the field test has 0 lifts | `hY` is essential and survives elaboration | F01 |
| Limit theorem, empty objects/index | Constant ∅ diagrams; empty index | Actual limits ∅, map id∅, no tests; empty index has 0 objects and fails native cofiltered nonemptiness | Empty schemes are allowed; empty index is excluded | F01 |
| Spectral limit boundary example | Infinite chain of BM21 Remark 2.18 | Inverse image of {0} is closed; {0} is not closed; inverse image of its complement is open and not compact | Ordinary quotient stability is not inferred | None |
| §3.1 cotruncated compact generation | Sets; all spaces; D(Λ)≥0 | Finite-set mapping spaces are 0-truncated; Map(*,K(Z,n)) has nonzero π_n for every n; Map(Λ[−r],X) has π_j=0 for j>r | Per-generator finite bound, not one bound on all objects | None |
| §3.2 finitariness | Terminal functor; finitely presented affine T; infinite affine space | Terminal comparisons are id; finite presentation uses finitely many variables; infinite polynomial identity uses every x_i | Infinite presentation provides the negative control | None |
| §3.3 filtered totalizations | Constant cosimplicial sets with values A_i | Tot A_i=A_i; colim Tot A_i=colim A_i=Tot(colim A_i) | Truncated mapping-space computation agrees | None |
| §3.4 h-to-v comparison | Identity and dual-number nilimmersion | Identity comparison=id; nilimmersion's augmented nerve evaluates constantly at k | Includes nonreduced h-covers | None |
| §3.5 detecting families | Identity singleton; empty family for A¹ sections | Singleton comparison=id; empty cover over Spec k asks k→0, which is not bijective | Empty family cannot detect that failure | None |
| §3.6 product components | Two fields; ultraproduct of DVRs k[[t]] | Product spectrum has 2 components; in a nonprincipal ultraproduct, [(t^n)] lies in the nonzero prime of values larger than every standard integer, while [(t)] does not | Extra middle prime separates ultraproduct rank from factor rank | None |
| §3.6 aic ultraproduct law | Aic factors; monic equation of fixed degree d>0 | A root in each factor gives a root class; the class of 1 remains nonzero | Degree-by-degree root and domain conditions survive | None |
| §3.7 contraction calculation | Composite valuation on k(x,y), k=F₂,F₃ or any field | v(y)=(1,0), v(x)=(0,1); 0∩k[x,y]=0, p∩k[x,y]=(y), m∩k[x,y]=(x,y) | Three distinct contractions over every field | F02 |
| §3.7 lifted chain | Injective local V→W; prime q over p | 0⊊q⊊m_W maps to the same three base points; image in one component therefore has at least 3 points | Connectedness and faithful flatness replace the unsupported ring map | F02 |
| §3.7 component rank bound | Field; rank-one domain; V itself | Spectra have 1, 2 and 3 points respectively | Rank-two identity is the separating allowed model when the bound is removed | F02 |
| §3.8 Boolean sheaf | Empty, singleton and two-element index | F(0)=terminal; one stalk=F(A); two stalks give F(A₁)×F(A₂) | Products, including empty product, have the correct direction | None |
| §3.8 base-changed stalk API | Two factors, B an A₁×A₂-algebra | B⊗_A A_i=e_iB; e₁B×e₂B=B, with e₁+e₂=1 and e₁e₂=0 | Tensor variant has the specified source and target | None |
| §3.9 ultraproduct detection | Singleton and two factors | Ultrafilters number 1 and 2; product comparison becomes id or the pair of component comparisons | No principal-only assertion for infinite I | None |
| §3.10 aic valuation detection | A=k algebraically closed; A=0 | One test k→k has an identity lift; empty product for A=0 is 0 | Arbitrary-rank product theorem includes endpoints | None |
| §4.1 prime extension | Aic field k→aic W, p=0 | pW=0, largest prime over 0=m_W; W⊗_k k=W=W_(m_W), generally not Frac W | Largest prime must not be replaced by pW | None |
| §4.1 kernel hypothesis | V→κ(m), p strictly below m | pW=0 contracts to m, not p; ker=m is not contained in p | Added kernel hypothesis excludes the false case | None |
| §4.2 finite-presentation persistence | Constant A_i=B_i=k | Every base change is id Spec k with exactly its identity lift; any index witnesses persistence | Cartesian fixed presentation retained | None |
| §4.3 excision definition | Rank-two valuation split; terminal functor | Comparison is F(V)→F(V_p)×_F(κ(p))F(V/p); terminal values all singleton | Common residue corner fixed | None |
| §4.3 v-sheaf negative model | Sheaf image of the perfect rank-two split | Identity of V is absent from H(V), while its two branch restrictions are present and agree | v-sheafness alone does not imply aic-v-excision | None |
| §4.3 domain base change | Node A=k[x,y]/xy; D=k[y] or k[x] | Pullbacks become k[y]×_k k=k[y] and k×_k k[x]=k[x] | Both branches work without Tor independence | None |
| §4.4 interval induction | Field; three-point chain; infinite descending chain | Field interval [0,0] is initial; overlapping [0,p] and [p,m] union to [0,m]; the counterclass has [0,p₁] absent and no strict upward extension at 0 | Strict extension is essential | None |
| §4.5 base-changed split, unit/kernel cases | V→Frac V; V→κ(m), middle p | First square has terms W,0,W,0; second W,W,0,0 | Both degenerate squares have identity edges | None |
| §4.5 base-changed split, nondegenerate | k→W, p=0 | All four tensor terms are W, with identity maps | Largest-prime convention gives the right square | None |
| §4.6 arc/excision equivalence | Torsion sections over an aic valuation split | Closed-stalk values are Λ on both branches and overlap; kernel of (a,b)↦a−b is diagonal Λ | Arc comparison and excision give the same result | None |
| §4.7 rank-one equivalence tests | Identity natural transformation; Λ→0 over a field | First comparison=id; second has Λ≠0 at the rank-zero test | Fields are necessary detecting objects | None |
| §5.1 bounded site | Empty scheme; dual numbers; Q and all Z_(p) | Empty family covers ∅; reduction is a cover; any finite subfamily of the infinite family misses Spec F_q for some omitted q | Pointwise valuation coverage is not a finite cover | None |
| §5.2 coherence cover criterion | {a,b}→{*} | Relation has 4 elements; source and quotient are finite coherent objects | Surjection need not be a monomorphism | None |
| §5.2 pushout coherence | {a}⊂{a,b}, {a}→{c} | D={b,c}; relation sizes 2,1,1 for B/B, B/C, C/C | Monomorphism convention matches the pushout calculation | None |
| §5.2 enough-points input | Finite discrete two-point sheaf model | Evaluation at the two points detects a map's two component bijections; terminal and finite products remain finite | Finite-limit/coherent-site hypotheses have witnesses | None |
| §5.3 valuation tests for coherent sheaves | Identity; infinite Q,Z_(p) family | Identity has one lift per section; finite subfamilies of the infinite source omit an F_q section | Source quasi-compactness cannot be discarded | None |
| §5.4 cardinal comparison | X=Spec F₂ below both cutoffs | Inverse image of h_X^# is h_X^#; End(X) has 1 element at either cutoff | Direction of geometric morphism and representable comparison agree | None |
| §5.5 unrestricted Milnor pushout | Dual-number quotient, I=(ε), B=A | Every valuation kills ε; sheafified square has identity edges; mapping it into F gives F(A)=F(A)×_F(k)F(k) | Sheafification is essential, no target finitariness used | None |
| §5.6 non-subcanonicity | A¹ sections on dual-number reduction | Čech values all k; A has nonzero ε and A→k is not injective | Ordinary representable fails both sheaf conditions | None |
| §6.1 strict henselian calculation | Aic field; nonfield aic V; zero sheaf | RΓ(field,Λ)=Λ[0]; RΓ(V,Λ)=Λ[0]; zero sheaf gives 0; finite étale degree r object is r copies | Closed-point stalk and finite-set classification agree | None |
| §6.2 strict henselization detection | X=Spec k algebraically closed, identity cover | Strict henselization=k; stalk comparison and global comparison are both id Λ[0] | Correct augmented comparison | None |
| §6.5 étale-object category | Rank 0; rank 1; two-copy fold | Rank 0 gives FinSet; generic open has closed/generic stalks ∅→{*}; fold is {1,2}→{*} | Object transitions are injections; morphisms need not be | None |
| §6.6 categorical descent | Constant two-point object on both intervals | Overlap identifies the two copies; glued object has 2 points at each vertex; morphism folding to 1 remains allowed | All natural transformations retained | None |
| §7.3 chain complexes | Rank 0; rank 1 skyscraper; Z/2 over Z/4 | One vertex gives Dᵇ_fg; closed skyscraper has Λ→0; Tor_i=Z/2 for every i | Cohomological bounds do not impose Tor bounds | None |
| §7.4 h-form definition | Spec k; k[t]; dual numbers | F₀(k)=k, F_i(k)=0 for i>0; F₁(k[t])=k[t]dt; F₀(dual numbers)=k | Correct cohomological sheafification | None |
| §7.4 Hodge convention | k[t], i=1 | Ω¹=k[t]dt; Ω¹[−1] has H¹=k[t]dt | Associated-graded shift agrees with conventions | None |
| §7.5 smooth comparison | k[t]; a localization k[t,1/g] | Both cohomologies are the corresponding module of i-forms in degree 0; Ω¹=k[t,1/g]dt | Localization and smooth affine comparison agree | None |
| §7.6 differential excision | i=0 on aic rank-two V; y∈p | Square is V=V_p×_κ(p)V/p; y=(√y)² with √y∈p shows p²=p on this element | Square and prime-idempotence conventions agree | None |
| §7.7 Perf arc-hyperdescent | F_p and dual numbers | Perfections are F_p in both cases; rank-one free complexes have Tor amplitude [0,0] on both nerves | Uses supplied Perf carrier, not all D_qc | None |
| `IsPerfectFpScheme`, owner comparison | ∅; F_p[ε]/ε² | Empty section ring is singleton and Frobenius bijective; ε^p=0≠ε | Sectionwise and absolute-Frobenius definitions both pass/fail respectively | F03 |
| Perfectness, positive/negative examples | F_p[t], perfect closure; p=2,3 | t is not in F_p[t^p]; Frobenius maps t^(1/p²) to t^(1/p); 1²=1 in F₂ and 2³=2 in F₃ | Forward Frobenius convention fixed | None |
| Perfectness outside prime parameters | p=0,1,4 | p=0 gives constant power map x↦1; p=1 forces 1=0; at p=4 on F₂, x⁴=x | Primality needed for the interpretation, retained in headline | None |
| `QcqsPerfectFp` | ∅; infinite disjoint union of Spec F_p | Empty scheme satisfies all 3 conjuncts; infinite union has no finite subcover of its singleton components | Quasi-compactness is a real restriction | None |
| Perfect fibre products/full morphisms | Perfect A,B over perfect C | Inverse Frobenius on A⊗_C B sends a⊗b to a^(1/p)⊗b^(1/p); p=0 forces all scheme morphisms to respect F_p | Full subcategory and pullback test have the promised carriers | F03 |
| `arcCover_iff_universallyEffectiveEpi` | Identity; ∅→Spec F_p; two-copy fold | Identity true↔true; empty map has 0 lifts and is not epi (two maps to a two-point target); fold has a section so true↔true | Both equivalence directions tested | None |
| Effective-epimorphism negative control | Spec Frac V→Spec V for perfect nonfield rank-one V | Closed-point lift absent; Frac V⊗_V Frac V=Frac V, so the section equalizer is Frac V≠V | False↔false | None |
| §7.8 algebraic-space mapping descent | Y=Spec F_p; dual-number source and its reduction | Hom(X^perf,Y) is singleton for every X/F_p, including ∅; perfections of dual numbers and reduction agree | Mapping domain includes the specified perfecting operation | None |
| §8.1 formal datum | I=0,A; Z→Z_p | For 0, all quotients are A,B and force A=B; for A, all are 0; Z/p^n=Z_p/p^n | Correct endpoints and quotient identifications | None |
| §8.1 base change/open API | Identity datum; I=(x,y) | All base-changed quotient maps are identities; U=D(x)∪D(y) contains (0,1) and (1,0) | Finite union, not intersection | None |
| §8.4 rank-one completion | Z_(p), t=p; t a unit; complete aic O_(C_p) | Completion Z_p has rank 1 and faithful local injection; unit completion=0; complete aic ring is unchanged | Parameter and rank hypotheses distinguish the cases | None |
| §8.5 completion cover | Rank-two V, t=x; I=0,A | v(y/x^n)=(1,−n)>0, so y dies in completion; at I=0 completion=A, at I=A open=A | Arc yes, rank-two faithful v-lift no | None |
| §8.6 formal glueing | I=0; I=A; identity datum | First RHS F(A)×_F(∅)F(∅)=F(A); second F(B)×_F(B)F(A)=F(A); identity datum gives an identity edge | No finitary or truncation assumption enters these computations | None |
| §8.7 rigidity | Constant functor; finite étale; underlying rings | Constant map is id; finite étale Z_p and F_p categories agree; Z_p→F_p has nonzero kernel | Global henselian-pair predicate has a negative model | None |
| §8.8 punctured comparison | Complete O_(C_p), I=(p) | Both punctures are Spec C_p; both RΓ with Λ are Λ[0] | Whole and punctured terms agree via the stated map | None |
| §8.9 support comparison | Same A; U=Spec A; closed special fibre | Whole and generic cohomology are Λ[0] with identity restriction, so supported complex is 0; completion changes none of them | Open/support directions agree | None |
| §9.1 arc_t covers | Identity; V→V[1/t]; t=0 or unit | Identity lifts with W=V; localization has 0 local lifts; boundary parameters admit 0 pseudouniformizer tests | Empty test class is distinguished from ordinary arc | None |
| §9.2 Tate-pair test | Subdisc with bound abs(T)≤abs(π) in unit disc | T=0 is included; T=1 is excluded since 1>abs(π) | Generic rank-one surjectivity fails | None |
| §9.3 arc_t-equivalence | Z_p[x]/(px)→Z_p; V→V[1/t] | Every domain test with p≠0 sends x to 0, giving a singleton fibre; localization has no map extending id V | Precomposition has the correct direction | None |
| §9.3 completion/integral closure API | Complete aic valuation V | Completion V=V and integral closure in Frac V=V; both restriction maps on test Hom sets are identities | No extra choice of lift | None |
| §9.4 completed generic fibre | Complete aic V; t=0; t a unit | E_t(V)=Λ[0]; t=0 localization gives 0 ring, unit completion gives 0 ring, both cohomologies 0 | Total-function boundary values retained | None |
| §9.5 hyperdescent | Identity hypercover; boundary R/t,R[1/t] | Identity totalization=E_t(R); both added boundary terms have value 0 | Covers can be enlarged without changing this value | None |
| §9.7 uniform denominator condition | Z_p, x=p^−1; t a unit | At n=c+1, p^c x^n=p^−1∉Z_p for every c; unit case A[1/t]=A=A^tic | Uniform bound excludes full localization | None |
| §9.7 integral/rank-one cases | Integral x; a negative-valued x in rank-one V | Finite recurrence bounds all denominators of powers; v(t^c x^n)=c v(t)+n v(x)<0 for sufficiently large n | Integral elements pass; negative-valued elements fail | None |
| §9.8 invariance | Identity; p-torsion quotient above | Identity gives id E_p(R); the quotient's test Hom fibres each have 1 element, including on its diagonal | Invariance uses uniqueness as well as existence | None |
| §9.9 universal homeomorphism | Dual-number reduction; purely inseparable field extension | Nilimmersion nerve is constant at the reduction; field extensions have the same separable finite étale objects | v-invariance includes both cases | None |
| §9.10 common total integral closure | Cusp k[u,v]/(v²−u³)⊂k[t], u=t²,v=t³ | After inverting u the rings agree; quotients are k[v]/v² and k[t]/t², whose reductions are k; special kernel (v) is square-zero | Universal-homeomorphism step needs only elementwise nilpotence | None |
| Native strict finite type | K; 0; K⟨T⟩/(T²) | Presenting variable counts 0, quotient by 1, quotient by T²; outputs K,0, and T≠0 with T²=0 | Includes zero and nonreduced affinoids | None |
| `IsTorsionEtaleSheaf` | 0; Z/6; Z; direct sum of Z/ℓ^r | 1 kills zero, 6 kills Z/6, no positive n kills 1∈Z; each finite-support section is killed by ℓ^max(r) | Sectionwise torsion, not one uniform exponent | None |
| `IsPrimePowerTorsionEtaleSheaf` | Z/ℓ²; Z/r; ℓ=0,1 | ℓ² kills first; ℓ^n is invertible mod distinct prime r; 0^1 kills everything, 1^n kills only zero | Prime condition in theorem is essential | None |
| §10.1 maximum estimate | Pair (T,1), T=0 | max(0,1)=1 but min(0,1)=0 | Positive bound uses maximum | None |
| §10.1 coefficient/dimension cases | char p, n=1; C_p with Z/p; n=0 dual numbers | Char p vanishing q≥2 equals q>1; in C_p, p is a unit despite norm<1; zero-dimensional strict henselian model has H^q=0 for q≥1 | Characteristic-primary and residue-primary cases separated | None |
| §10.2 rational Mayer–Vietoris | f=g=1 | Both rational charts and overlap are A; RHS RΓ(A)×_RΓ(A)RΓ(A)=RΓ(A) | Unit-ideal and map directions agree | None |
| §10.3 shrinking tubes | r=0,1; complete rank-one test | Equations U₀=f, πU₁=f; transition U₀↦πU₁ preserves f; intersection π^rV=0 implies f=U_r=0 in the limit | Shrinking and transition directions fixed | None |
| §10.5 valuation Künneth | R=R′=complete aic V; R=V/π | First comparison Λ⊗_ΛΛ=Λ; second comparison 0⊗E_π(R′)=0=E_π(R′/π) | Residue-invertible coefficient range retained | None |
| §10.6 affinoid Künneth | A=B=K; A=0 | K completed-tensor K=K; Λ⊗Λ=Λ; zero algebra gives 0 on both sides | Completed tensor and zero case agree | None |
| §10.7 dimension bound | d=0; A=K⟨T⟩, d=1 | Tensor dimensions 0 and 2 respectively; contradiction degrees are 2d+2=2,4, exceeding 2d+1=1,3 | Parity and upper bound agree | None |
| `affinoid_artin_grothendieck` | A=0; A=K,d=0; dimension 1 | All groups zero for 0; H⁰(K)=Λ and H^q(K)=0 for q>0; general dimension-1 theorem asks q>2 | No accidental assertion at q=0 or at the boundary q=d+1 | None |
| Sharper affinoid headline | K=C₂,C₃; ℓ≠p; zero algebra | Norm(p)=1/p excludes p; norm(ℓ)=1 admits ℓ; zero cohomology remains subsingleton | Bound q>d applies only with stated hypothesis | None |
| §10.8 trace and monodromy | S₃ at ℓ=2,3; C_ℓ; trivial group | Sylow indices 3≡1 mod 2 and 2 with inverse 2 mod 3; (g−1)^ℓ=g^ℓ−1=0; trivial trace=1 | Prime-to-ℓ cover degree and filtration route justified | None |
| §11.1 complete arc definition | I=0,A; Z_p→Q_p | At 0 every valuation is complete; at A none is separated complete nonzero; localization has 0 lifts on the test Z_p | Empty/proper test classes distinguished | None |
| §11.1 monotonicity/reduction API | 0⊆(p) in Z_p; I=A | Ordinary arc tests include complete p-tests; reducing the identity gives id F_p; unit-ideal reduction is id 0 | Claimed direction and zero endpoint agree | None |
| §11.2 complete product basis | One V; V₁×V₂; empty product | D(t) in rank-one V is Spec Frac V; D((t,1)) has components Frac V₁ and V₂; empty product 0 has 0 components | Open components are localizations, not unchanged factors | None |
| §11.2 splitting/completeness | Algebraically closed field, I=0; finite complete product | Degree-r étale cover has r sections for r>0; quotients and inverse limits of the finite product are coordinatewise | Strict henselian splitting and product completion agree | None |
| §11.3 formal affine comparison | Characteristic p; dual numbers | p=0-adic completion is the original ring; ε dies in every valuation test; pseudouniformizer-only p-tests number 0 | Formal topology retains characteristic-p objects | None |
| §11.4 boundary-cover equivalence | I=0,A,(x,y); (2,3) in Z | At 0 boundary factor R/I=R; unit ideal has D(2)∪D(3)=Spec Z; two puncture points survive the union but not D(xy) | No chosen generator can replace the full family | None |
| §11.5 complete/punctured hyperdescent | Complete aic V, proper I; I=0,A | Whole and punctured values Λ[0] for nonzero proper principal I; puncture at 0 empty; completion at unit ideal 0 | Whole and punctured boundary formulas agree | None |
| §12.2 perfectoid generic fibre | F_p×O_(C_p); perfect characteristic-p A | Torsion-free image O_(C_p), generic ring C_p; in characteristic p, A[1/p]=0 and both cohomologies vanish | Normalize only after treating empty generic fibre | None |
| §12.4 formal-target descent | T=Spf F_p; X perfect characteristic p; T=∅ | Unique continuous F_p map for first case; no map from nonempty X to ∅ | Formal maps keep source, target and continuity | None |
| §12.5 proper henselian comparison | I=0; I=A; P¹ over O_(C_p), ℓ≠p | Identity for I=0; henselian I=A forces A=0, both sides 0; P¹ has H⁰=F_ℓ,H²=F_ℓ(−1) on whole and closed fibre | General theorem and I=(p) application compatible | F04 |
| §12.6 tilting cover equivalence | Perfect characteristic-p rings, ϖ=0; identity perfectoid map | Tilt is the same perfect ring, so both 0-complete predicates are ordinary arc; identity has W=V on either side | Sharp/completion parameters match | None |
| §12.7 integral/tilt/Witt hyperdescent | Identity hypercover of perfect field k | A=k, A♭=k, A_inf=W(k); all derived limits equal these degree-zero rings and every comparison is id | Three comparison sources and targets fixed | None |
| Worked rank-two example | y/x^n, n=0,1,2 | Values (1,0),(1,−1),(1,−2), all positive; y∈x^nV for every n | Same sign and parameter as §§0.5,2.3,3.7,4.3,8.5 | None |
| Worked two-generator/tube examples | Points (0,1),(1,0); r=0,1 | Puncture indicator values (true,true) for union, (false,false) for intersection; π^0·πU₁=πU₁=f | All repeated conventions agree | None |

## Maintainer notes

Only `packages/ArcTopologyAndDescent/README.md`, `packages/ArcTopologyAndDescent/Suggested.lean`, `packages/ArcTopologyAndDescent/sources.toml` and this report changed. The added public target name is `TauCetiRoadmap.ArcTopologyAndDescent.isSchemeArcCover_of_isLimit`; existing names and supplier gaps are unchanged. No external roadmap edit, merge-order decision or scope change is needed to settle these four findings. The independent review remains the acceptance decision. No commit or GitHub write was made.
