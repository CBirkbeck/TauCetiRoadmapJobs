# Package report

## Headline theorems, listed before the acceptance file

| Headline | Acceptance status and missing carrier |
|---|---|
| Equivariant limit, torsor descent and Hochschild–Serre comparisons | Not statable at the pins: equivariant analytic étale sites and their tower-descent functors. |
| Strauch's component computation and its action dictionary | Not statable at the pins: Lubin–Tate tower and component label map. |
| Compact p-adic Lie cohomology finiteness with complete local coefficients | Stated as `TauCetiRoadmap.ScholzeFunctorAndModpCohomologyOfTheLubinTateTower.compactLie_cohomology_finite`, with the simple native fixed-submodule predicate `AdmissibleCompactInvariants`. |
| Scholze finiteness over a complete noetherian local coefficient ring | Not statable at the pins: the equivariant sheaf on the Gross–Hopkins torsor. |
| Frobenius rigidity of almost finite module systems | Not statable at the pins: valuation-ring almost modules and Frobenius scalar-extension interface. |
| Fust's Ext comparison, reductive finiteness and block vanishing | Not statable at the pins: the derived smooth category, rational points of general connected reductive groups and the mod-p block objects. |
| Moore's continuous degree-two vanishing for SL₂(ℚ_p), p odd | Stated as `TauCetiRoadmap.ScholzeFunctorAndModpCohomologyOfTheLubinTateTower.moore_sl2_h2_vanishes`. |
| Cartan–Leray and multiplicity spectral sequences | Not statable at the pins: the Lubin–Tate étale cohomology complex and Scholze functor. |
| Degree-one comparison with tower multiplicities | Not statable at the pins: Scholze functor and tower multiplicity space. |
| Ludwig's perfectoid Borel quotient and degree-two vanishing | Not statable at the pins: perfectoid quotient and associated principal-series sheaf. |
| Residual automorphic globalisation and quaternionic block occurrence | Not statable at the pins: global automorphic representation and completed quaternionic module. |
| Generic principal-series Galois-invariant criterion | Not statable at the pins: principal series in the smooth category and S¹. |
| Finite support of arithmetic tower multiplicities and finite length | Not statable at the pins: arithmetic Drinfeld cohomology and smooth finite-length category. |
| Finite multiplicities over every finite extension of ℚ_p | Not statable at the pins: geometric Drinfeld cohomology. |
| Geometric multiplicity finite length, higher-dimensional vanishing and supersingular block support | Not statable at the pins: Galois-equivariant tower Hom, its continuous dual and the mod-p correspondence. |
| Finiteness of Lubin–Tate smooth vectors | Not statable at the pins: arithmetic Lubin–Tate cohomology and its division-algebra action. |

The headline list distinguishes these results from API facts and Checks. Imported period-torsor and basic mod-p/O-torsion functor constructions belong to the supplier scope audit below.

## Inputs, scope and sources

The accepted design has 29 nodes in seven layers. Its acceptance review is embedded in `packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/design/plan.json`; the separately named `design/review.json` and earlier report files were absent. The embedded review's corrections were verified as mathematical claims, not treated as instructions. The skeleton was generated from every node's statement, hypotheses, proof steps, acceptance checks, locators and prerequisites before the prose was written. AdicSpacesPartIV, ProfiniteCohomology and DerivedModuleAlgebra on main supplied the style comparisons.

The source service fetched eleven legal texts. BW00 is a settled, uncertified locator-only citation: its publisher PDF redirected to institutional authentication, and no text was obtained or used. Its Chapter IX Proposition 2.3 locator is independently present at CDN23 line 1555. The general continuously split Shapiro comparison is specified with its own evaluation and continuous homotopy proof; no claim about unread additional hypotheses of BW00 is certified. No unresolved text request remains. Publication metadata missing from URL fetches was supplied in `sources.toml`; service hashes and acquisition records were retained. Versions of a paper share one key. No source passage was copied into the deliverables.

The six source issues retained from the design have the following independent mathematical outcomes.

| Issue | Inspected locator | Outcome |
|---|---|---|
| Fust numbering | FUST22 line 478 and line 598; CDN23 line 1559 | Compact finiteness is Lemma 6.2; reductive finiteness is published Lemma 6.6. The earlier arXiv-v1 number 6.3 is not used as the journal locator. |
| p-primary profinite-product comparison | CDN23 line 1485; ECD17 line 3541 and line 6017 | Use étale continuity over finite quotients for all torsion. Do not apply a prime-to-p shriek projection formula to ℤ/pᵃ. |
| Scalar height | CDN23 line 1851 and its level-zero geometry; STR08 line 372 | det(pI₂)=p². Two unit cosets, rather than one, occur after the scalar quotient. |
| Reduced norm and Artin inverses | SCH18 line 892; DPS23 line 1387 and line 1401 | In the adopted common-central-character convention, the action is Nrd(d)Art(w)⁻¹. For δ(2)=2 mod 5 the Dˣ scalar is 2, the changed-lift scalar 3. |
| Continuous dual in Corollary 2.12 | CDN23 line 1282 | Dualise both sides of the Hom identification; the finite-group model is coinvariants. |
| Lattice dual | PAS22 formula (26); DPS23 footnote 15 and line 1889 | Use Hom_O(λ,O) before tensoring with L/O. At λ=O this gives L/O, whereas two torsion factors give zero. |

Additional corrections made while expanding the design:

- Finite compact-quotient cohomology cannot follow from “killed by p” for arbitrary complete local coefficients. At rank one, A=𝔽_p[[T]] and π=𝔽_p((T))/𝔽_p[[T]] with trivial action is A-admissible and killed by p, but S⁰=π is infinite. Section 1.5 separates the underlying-𝔽_p-admissible case from bounded 𝔪-torsion pieces, and states the injectivity improvement over the underlying smooth 𝔽_p-category.
- An untruncated A is generally not a smooth 𝔪-primary torsion coefficient. Section 1.1's constant-sheaf example uses A/𝔪ⁱ, or bounded A; A=ℤ_p itself is the negative control.
- “Strict containment” is the valuative condition. U=V is permitted for proper V; a closed disc fails that condition at its boundary. It is not synonymous with proper inclusion of sets.
- Fust Lemma 2.2 is an adjunction for induction from the trivial subgroup, not the general closed-subgroup Shapiro theorem. Section 2.1 uses Fust Lemma 2.1 for untwisting, the actual Shapiro locator for the comparison, and specifies the continuous-section homotopies. It assumes joint continuity, unlike an arbitrary TopRep.
- The inverse-limit Hom formula is used with the actual finite quotient presentation of profinite π∨, not as an unqualified extension theorem for arbitrary noncompact prodiscrete sources.
- The full general-admissible statement of CDN Corollary 4.21 is restored in §5.4; the design had recorded only its fixed-central-character route. No uniform finite nilpotence of the centre on an arbitrary admissible representation is assumed. The general-F Theorem 4.22 retains its central-character hypothesis.
- Components contribute H⁰ and low-degree descent errors, not a canonical subspace of geometric H¹. The final smooth-vector Check now names those actual terms.
- The finite-dimensional SL₂-action step in §6.4 uses divisibility of the additive root groups and root generation. Perfection alone would not exclude a nonabelian finite quotient.
- All level-zero groups are the maximal compact groups. The analytic native carrier includes dimension zero, and compact groups with p-torsion are included; no uniform cohomological-dimension claim is added.
- The reciprocity transport now consistently distinguishes inversion of the arithmetic-normalised Artin value from merely inverting an isomorphism's direction. The unramified δ(ϖ)=2 mod 5 witness gives geometric Frobenius 3 and arithmetic Frobenius 2.

The README does not assert finite length of arithmetic Drinfeld cohomology over all F, geometric profiniteness before taking the specified Galois-invariant Hom, a mod-p correspondence in higher rank, or the characteristic-zero factorisation of CDN §5. Those are not consequences of the accepted targets. No notion was moved from a later roadmap: the old apparent reciprocal dependence through completed cohomology disappears after importing the self-contained functor and comparison from that supplier's §0.6 and §4.12. This package's general-coefficient refinement does not feed back into that supplier.

## Ownership and duplication sweep

The sweep used the supplied roadmap index and object searches over main and open heads, then read the matching sections. Main copies of AdicSpacesPartII, PerfectoidSpaces, ClassFieldTheory and Chebotarev were preferred over revisions of those folders. The two accepted board designs ModpRepresentationsOfGL2OverLocalFields and LubinTateFormalModulesAndQuasiCanonicalLifts were also inspected. Open work was checked through the supplied index; no unprovided or unnamed remote head was sought. Pinned library object searches covered continuous cochains, smooth discrete actions, induction, duality, almost modules, analytic groups, SL₂ perfection and the tower objects.

| Object removed as a separate local construction | Supplier actually consumed | Kept mathematical difference |
|---|---|---|
| Lubin–Tate/Drinfeld tower, period maps, limit, duality and arithmetic scalar descent | EndoscopicTransferAndUnitaryTraceComparison §§12.2–12.8, 12.11, 12.14, 12.19, 12.21 | Strauch label/action conversion and tower-specific mod-p cohomology consequences. |
| Entire Gross–Hopkins torsor construction of design node SZ.0/gross-hopkins-torsor | CompletedCohomologyAndLocalGlobalCompatibility §0.6 | Its three design Checks are retained as supplier-contract Checks, including the nonabelian conjugation dictionary. |
| Basic equivariant site and slice functors | IgusaVarietiesAndTorsionConcentration §IG.4.1; CompletedCohomologyAndLocalGlobalCompatibility §0.6 | General closed-subgroup limits, integral sheaf and cohomological/tower refinements in §0.1. |
| Basic mod-p and admissible O-torsion associated sheaf/Sⁱ/finiteness | CompletedCohomologyAndLocalGlobalCompatibility §0.6 | Arbitrary complete noetherian local A, non-admissible smooth sheaf coefficients, strict-image/Frobenius arguments, central characters and twist formulas. |
| Generic smoothness, admissibility, smooth abelian/derived categories and induction | SmoothRepresentationsOfLocalGroups SR.0, SR.0d, SR.2 | Complete-local bounded-torsion compact finiteness and Fust's continuous comparison. The one native predicate in Lean is only the fixed-submodule test needed to state that headline. |
| Coefficient-linear compact–discrete and Schikhof duality | PadicLocalLanglandsForGL2Qp §§0.1, 0.3 | The particular homological S-functor and geometric multiplicity applications. |
| Continuous cohomology and coinduction carriers | Mathlib `continuousCohomology`, `TopRep.coind₁`; Tau Ceti smooth-discrete dictionary | Locally profinite smooth Ext comparison and continuous noncompact Shapiro. |
| Profinite discrete Shapiro and its cochain quasi-isomorphism | Tau Ceti `Shapiro/AllDegrees.lean` | Continuously split noncompact quotient and prodiscrete coefficient comparison; no duplicate profinite theorem in Suggested.lean. |
| Stable/rank-two symbol or universal local covering construction | KTheoryLowDegrees §11.5 | Discrete-kernel/global-continuous-cocycle comparison and Moore's mod-p vanishing consequence. |
| SL₂ perfection proof | Mathlib `Matrix.SL2.commutator_eq_top`, `LinearAlgebra/Matrix/SpecialLinearGroup.lean:804` | Its degree-one continuous-cohomology consequence is prose, not acceptance-file padding. |
| General mod-p irreducible classification, blocks, Montréal functor and pseudo-deformation rings | PadicLocalLanglandsForGL2Qp Layers 2–3 and §§5.1–5.4 | Generic-pair convention and the specified quaternionic/global occurrence application. |
| Definite quaternionic module, noetherian Hecke algebra and full S¹/completed-cohomology isotypy | CompletedCohomologyAndLocalGlobalCompatibility §§1.5–1.7, 3.7, 4.12 | The exact auxiliary-place instance, characteristic-zero point and ideal-torsion comparison. |
| Abstract block occurrence and residual fibre finiteness | PadicLocalLanglandsForGL2Qp §§6.7–6.8 | Verification for the chosen global ψ,λ,𝔪-module. |
| Smooth finite-presentation, scalar extension, coherence, cosocle and smooth-dual criteria | ModpRepresentationsOfGL2OverLocalFields MP.0–MP.1 | Finite-support arithmetic multiplicities, geometric coinvariants and the tower finite-length applications. |
| Weil group, reciprocity, finite local Galois cohomology and Hilbert pairing | ClassFieldTheory Layers 5 and 9 | The DPS action adapter and finite Weil-cohomology uses; no second Weil group. |
| Almost-module category, tilting, étale continuity and projective trace/twist infrastructure | PerfectoidSpaces P0/P3, DiamondEtaleCohomology C0, ClassicalAdicEtaleCohomology §1.4 | Strict-image and Frobenius rigidity, followed by the tower spectral sequence. |
| Auxiliary global realisation, Hilbert Galois representation, quaternion invariant exchange and solvable base change | PotentialModularityAndCompatibleSystems §§2.23, 4.15; AutomorphicGaloisRepresentations §§3.10–3.11; GL2AutomorphicRepresentationsAndTransfer R17.3–R17.4 | The combined even-degree, p-split, large-image, unramified-outside-p globalisation of DPS Proposition 8.1. |

No API, Check or worked-example declarations were padded into Suggested.lean. All proposed design API names except the two actual headline names and their needed native predicate were converted to mathematical prose. All 29 design nodes are accounted for: 28 remain as mathematical targets/refinements, while the period-torsor node is imported and its discriminating Checks remain in the exact supplier contract. The sheaf/functor refinements retain their design API facts and examples; their original mod-p/O-torsion bases have a single upstream owner.

The supplier gaps are `proetale-finite-presentation`, `temkin-good-germs`, `analytic-topology-dimension`, `arithmetic-stein-hochschild-serre`, `height-zero-modular-uniformisation` and `potentially-barsotti-tate-lifts`. Each has a matching one-sentence `What … must provide` contract in its README supplier subsection and a `slug`, `needs`, `supplier`, `section` entry in the top-level design gap list. The original arithmetic finite-presentation gap remains a direct input to both §§5.4 and 6.2. Comparing the JSON with the saved input after deleting only `gaps` gives equality; all other design bytes were preserved.

## Adversarial mathematics pass

Each row records a statement or defining law, the tested instance and the computed values. The computations test scope and conventions; they do not replace the cited proofs of the deep results. “Retained” means the statement has the displayed hypotheses, not that a `sorry` build proves its truth. All zero tests below use the zero coefficient module, not a nonexistent zero coefficient field. No division by a level index is used.

| Statement | Instances tried | Computed values on the relevant sides | Result / change |
|---|---|---|---|
| Rank and scalar quotient convention | r=1,2; scalar ϖ | det(ϖI₁)=ϖ; det(ϖI₂)=ϖ²; height shifts 1,2 | Rank zero excluded; two rank-two height classes retained. |
| Level-zero group | n=0,1 | G₀=GL₂(O_F); G₁=1+ϖM₂(O_F); 1+(−I₂)=0 is singular | Correct maximal compact used at zero. |
| Positive coefficient exponent | j=0,1 | 𝔪⁰=A, so annihilation forces 1·x=x=0; j=1 permits residue coefficients | Headline explicitly keeps 0<j. |
| Prime convention | p=0,1,2,3 | 0 and 1 are not prime; 2,3 are prime; 2<2 is false, 2<3 true | Native prime and oddness binders retained. |
| Coefficient nontriviality | residue field k=𝔽₂; zero ring | 1≠0 in k; zero ring has 1=0 and no nonzero residue field | Zero module included, zero coefficient ring excluded. |
| Right torsor equivariance | δ(2)=2 mod 5 | f(x·2)=δ(2)⁻¹f(x)=3f(x); 2·3=1 | Inverse fixed in every layer. |
| Dˣ action | rank one, same δ | (2f)(1)=f(1/2)=2f(1), not 3f(1) | Positive norm factor retained. |
| Weil direction | unramified δ(ϖ)=2 mod 5 | Φ_geo scalar=3; Φ_ar scalar=2; d with Nrd(d)=ϖ scalar=2 | Recomputed in reciprocity supplier and Layers 0–1. |
| Central scalar comparison | r=2, δ(ϖ)=2 mod 5 | det(ϖI₂)=Nrd(ϖ)=ϖ²; both central scalars are 2²=4 | Central equality includes the rank in both norms. |
| Twist inversion | δ(2)=2 mod 5, then δ⁻¹ | scalar product 2·3=1; both successive twists return π | Retained, including twisted invariant hypothesis. |
| Tate trace convention | degree-one/two divisors; p=2,3 | trace(1)=1; trace(2)=0 mod 2 and 2 mod 3 | Twist fixed by trace, without evaluating an undefined p-primary Frobenius scalar. |
| Lattice versus torsion dual | λ=O | Hom_O(O,O)⊗L/O=L/O; (L/O)⊗L/O=0 | Lattice factor corrected. |
| Universe/cardinal convention | identity and two-point objects in fixed universe | identity has one lift per chosen point; two-point object remains size 2 | Cutoffs remain the supplied site cutoffs. |
| Period-torsor fibre | rank one, K=O_Fˣ | Fˣ/K=ℤ, not a singleton | Full heights retained in supplier contract. |
| Period-torsor lattice fibre | r=2, K=GL₂(O_F) | O_F²≠ϖO_F⊕O_F, giving two distinct cosets | Lattice interpretation retained. |
| Simultaneous torsor action | g=(12), h=(23) in S₃ | g⁻¹hg=(13); (xg)(g⁻¹hg)=xhg | Conjugation, not translation alone. |
| Single-factor torsor action | h,k in a cyclic group | (xh)k=x(hk) | Second-factor action is right multiplication. |
| Dˣ torsor action | identity d; arbitrary h | (dx,dxh)=(dx,(dx)h), with h unchanged | Commuting action dictionary retained. |
| Equivariant closed-subgroup limit | G=1, H₀=1 | indexing system has one object; colimit Hⁱ(X)=Hⁱ(X) | §0.1 limit formula retained with qcqs/profinite hypotheses. |
| Open-subgroup slice | H=G | X×ᴳG=X; slice over terminal X recovers the site | Carrier imported, comparison retained. |
| Conservativity | zero pointed sheaf, G=1 | pullback of zero is zero; identity pullback detects every section | Both directions tested. |
| Invariant integral sheaf | point with trivial group; empty object | sections O_C/ϖ and 0 respectively | Invariants of quotient sheaf, not quotient of invariant sections. |
| Integral restriction/map laws | U→U identity; two composable restrictions | s↦s; composite restriction equals restriction to the composite domain | API retains actual sheaf restrictions. |
| Integral sheaf pullback/extensionality | G=1; maps sending 1 to 0 or 1 | ordinary pullbacks differ on 1; equal stalk maps give equal functions | Zero-model replacement excluded. |
| Torsor-site descent | compact K, K′ normal of index m | fibre K/K′ has m points; full G/K′ generally has infinitely many | Base is M_{LT,K}, not projective space. |
| Equivariant Hochschild–Serre | K=1 | H⁰(1,Hʲ)=Hʲ; Hⁱ(1,Hʲ)=0 for i>0 | Sequence collapses as claimed. |
| Trivial geometry versus linearisation | C₂ sign on 𝔽₃ | generator acts by 2; invariant vectors satisfy 2v=v, so v=0 | Nontrivial linearisation retained. |
| Finite-level components | F=ℚ₂, m=1,2 | |(ℤ₂/2)ˣ|=1; |(ℤ₂/4)ˣ|=2; both level-2 labels reduce to 1 | m=0 is handled separately. |
| Level-zero connectedness | r=1, m=0 | height-zero ball has dimension 0 and one component; all heights give ℤ | Height-zero/full tower distinguished. |
| Infinite component equality | same height, equal all unit reductions | difference lies in ∩ₘ(1+ϖᵐO_F)={1} | Label extensionality retained. |
| Component level functoriality | reduction m=2→1→0 | successive reductions discard units and preserve valuation | Identity/composition retained. |
| Weil/component translation | Art(w)=2 mod 5 | component translation by 1/2; pullback by w⁻¹ evaluates at 2 and gives scalar 3 | Matches §1.6. |
| Scalar component coinduction | heights 0,1,2,3 | scalar orbits {even},{odd}; quotient has 2 classes | Coinduction includes both unit cosets. |
| Smooth bounded admissibility definition | H=1, V=k, 0, ⊕ℕk | fixed dimensions 1,0,∞ | Both finite generation and smoothness kept separate. |
| Admissibility under isomorphism | multiplication by 2 on k=𝔽₅ | inverse multiplication by 3; fixed dimensions agree | Predicate transported both directions. |
| Serre closure | trivial 0→k→k²→k→0 | fixed dimensions 1,2,1; dual module generator numbers finite | General proof uses noetherian dual algebra. |
| Open restriction | H=ℤ_p, subgroup pℤ_p, V=k trivial | fixed dimensions 1 and 1 | General closed-subgroup assertion not substituted. |
| Compact dual finite generation | regular C⁰(H,k) | fixed H-invariants=k; dual=k[[H]], one generator | Both sides distinguish regular from infinite trivial sum. |
| Compact cohomology | H=ℤ_p, V=k trivial | dimensions (H⁰,H¹,H²)=(1,1,0) | Retained for p=2 as well. |
| Compact regular acyclicity | V=C⁰(H,k) | H⁰=k, Hⁱ=0 for i>0 | Shapiro model agrees. |
| Nonadmissible compact counterexample | ⊕ℕC⁰(H,k) | H⁰ contains ⊕ℕk, dimension ∞ | Admissibility cannot be dropped. |
| Compact torsion group, dimension zero | H=C_p, V=𝔽_p | dim Hⁱ=1 for every i≥0 | No torsion-free or uniform vanishing claim. |
| Boundedness of compact cohomology | A=ℤ_p, H=1, V=ℚ_p/ℤ_p | |V[pʲ]|=pʲ, but |H⁰(H,V)|=∞ | Positive bounded exponent is explicit in Lean. |
| Native compact headline, zero object | H=1, d=0, X=0, j=1 | every cohomology group has 1 element and module generator number 0 | Actual cohomology carrier used, not a free predicate for finiteness. |
| Native admissibility predicate without local compactness | arbitrary group with no compact open subgroup | fixed-space clause alone has no tests; for compact analytic H, H itself is compact open | Predicate deliberately does not encode smoothness; theorem has the full analytic hypotheses. |
| Associated-sheaf stalk | r=1, π=k | evaluation at 1 gives k; zero π gives 0 | Stalk is π, not its G-invariants. |
| Associated-sheaf lift change | g=2, δ(2)=2 mod 5 | evaluation changes by 3; inverse change by 2 | Sign correction retained. |
| Associated-sheaf exactness | 0→k→k²→k→0 | stalk dimensions 1,2,1 with kernel=image k | Tested on geometric stalks. |
| Associated-sheaf colimits | increasing finite-dimensional coefficient subspaces | union of stalks equals stalk of union; zero union gives 0 | Filtered-colimit API retained. |
| Associated coefficient extension | k→k′ of degree e, π=k | both stalks are k′, k-dimension e | Scalar extension matches. |
| Associated tensor comparison | π=k², π′=k³ | tensor stalk dimension 2·3=6 on both sides | Sheaf tensor asserted; no sectionwise surjectivity invented. |
| Associated finite-level regular coefficient | finite quotient K/K′ of size m | stalk dimension m, while fixed subspace has dimension 1 | Finite-cover pushforward identified correctly. |
| Associated nonsmooth example | all functions K→𝔽_p, K infinite profinite | smooth vectors=C⁰(K,𝔽_p); a nonlocally constant function is excluded | Compact K example, not an invented G-extension. |
| Associated section and map extensionality | maps u=0, u=id; section value 1 | outputs 0 and 1; composition with identity returns the same section | API determines the actual maps. |
| Constant coefficient eligibility | A=ℤ_p; A/p²; ℚ_p/ℤ_p | 1 in A is killed by no p-power; A/p² has p² elements; each torsion element is bounded | Untruncated A example corrected. |
| S-functor at rank one | π=k and π=0 | S⁰=k or 0; Sⁱ=0 for i>0 | Headline bounds and δ-functor agree. |
| S-functor at rank two | trivial k | dimensions 1,0,1 in degrees 0,1,2 | Nonzero S² retained. |
| S-map identity/composition | u=id, then scalar 2 and scalar 3 mod 5 | identity acts by 1; composed scalar 6=1 | Natural map laws retained. |
| S scalar comparison | finite extension k′/k of degree e | trivial degree-zero spaces both have k-dimension e | No arbitrary nonflat tensor/cohomology interchange. |
| Compact-dual S variance | u:X→Y, v:Y→Z | two dual reversals give X→Y→Z again | Covariant homological convention retained. |
| Projective-limit S comparison | constant inverse system M; zero system | limits M and 0; corresponding dual colimits unchanged | Asserted only inside the supplied dual category. |
| Strict-image valuative condition | proper V, U=V | every valuation extension remains in V; restriction image is all Hⁱ(V) | Proper inclusion is not required. |
| Strict-image disc counterexample | closed unit disc, U=V | boundary radius 1 has no required extension into the same disc | Missing strict hypothesis detected. |
| Strict-image empty/smaller disc | U=∅; radii |p|<1 | image 0; smaller radius has boundary strictly inside radius 1 | Covers include the empty case. |
| Frobenius module system | M_k=(O/πᵏ)ʳ | γ has r entries k; Frobenius gives r entries pk | Compatible free model satisfies every law. |
| Frobenius zero system | M_k=0 | γ empty; rational rank r=0 | Degenerate rank included. |
| Frobenius exact middle | r=1, k=1 | ker(O/π²→O/π)=πO/π²=image(O/π) | q is multiplication, not the zero map. |
| Frobenius majorisation | sequence O/π→O/π²→O/π | vectors (1),(2),(1); (2)=(1)+(1) in the partial-sum bound | Ordinary finite length not used over nondiscrete O. |
| Frobenius constant-family negative control | M_k=O/π, p=2 | γ(M₂)=(1), while pγ(M₁)=(2) | Frobenius isomorphism impossible. |
| Frobenius algebraic-closure hypothesis | residue 𝔽₃, semilinear scalar 2 | trivialising basis would require b²=2; residue squares are 0,1 | Algebraic-closure condition retained. |
| Frobenius rank/transport/reduction API | rank r=1, exponents 2→1 | rank remains 1; projection sends 1 mod π² to 1 mod π | Rank and map compatibility exclude arbitrary unrelated free modules. |
| Scholze degree bound | r=1,2 | bounds 0 and 2; rank-two trivial S³=0, S² dimension 1 | General vanishing stated exactly. |
| Scholze compact injectivity improvement | r=2; injective regular compact coefficient | improved bound r−1=1, so degrees >1 vanish | Injectivity is over the underlying smooth 𝔽_p-category. |
| General-A finiteness versus p-torsion | A=𝔽_p[[T]], V=𝔽_p((T))/𝔽_p[[T]], r=1 | |V[Tʲ]|=pʲ; S⁰=V infinite although pV=0 | Design overstatement corrected. |
| Square-zero coefficients | A=𝔽_p[ε]/ε², π=A, r=2 | dim_𝔽p S²=2; after reduction dim=1; ε·1=ε≠0 | Nilpotent coefficients retained. |
| Base-field comparison | r=1, C⊂C′ | degree-zero map is id_π and higher groups are zero on both sides | Finiteness claim requires admissibility. |
| Galois extension uniqueness | finite invariant piece with Frobenius order m | Φᵐ=1 on that piece; dense Weil action has at most one continuous extension | Finite pieces supply existence, not bare density. |
| Degree-zero SL-invariants | generic principal series versus character | invariant spaces 0 and k; resulting S⁰ dimensions 0 and 1 | Evaluation formula matches classification. |
| Character S¹/S² | r=2, trivial k | S¹=0, S²=k(−1) | Character is not a principal-series vanishing instance. |
| Continuous Ext comparison | H=1, V=k | H⁰=k=Hom(k,k); positive cohomology 0 | Trivial coefficient object in smooth category specified. |
| Continuous Ext nontrivial test | H=ℤ_p, V=𝔽_p | H¹=𝔽_p, H²=0; same smooth Ext dimensions | Topology cannot be discarded. |
| Continuous induction membership | J=1, H finite of order m | Ind=C(H,k) has dimension m; compact-support restriction is automatic only here | General continuous versus compact induction distinguished. |
| Induction evaluation/map API | coefficient scalar 2 mod 5 | ev₁(2f)=2f(1); identity and composition scalars 1 and 6=1 | Actual source/target maps specified. |
| Shapiro cochains versus cohomology | H=C₂, J=1, k=𝔽₂ | cochain degree-zero dimensions 2 versus 1; H⁰ dimensions 1 versus 1 | Quasi-isomorphism, not termwise isomorphism. |
| Nonabelian Shapiro check | H=S₃, J=1 | induced dimension 6, invariant dimension 1, H⁰(1,k) dimension 1 | Group action checked beyond cyclic groups. |
| Determinant quotient section | t=ϖ | det diag(ϖ,1)=ϖ; det(ϖI₂)=ϖ² | Correct continuous section retained. |
| Untwisting | δ(x)=2 mod 5 | T²f(x)=x·x⁻¹·f(x)=f(x); scalar product 2·3=1 | Native coinduction convention explicitly converted. |
| Reductive cohomology finiteness | trivial coefficient on SL₂(ℚ₃) | dimensions H⁰=1,H¹=0,H²=0; finite in all tested degrees | Full reductive theorem remains in README, with building route. |
| Fust block vanishing | supersingular π; π=1 | supersingular Hⁱ=0; trivial H⁰=k≠0 | Exceptional representations retained, including small-prime coincidences. |
| Restriction to SL₂ with central character | π=δ∘det | SL₂ acts trivially; every fixed space is one-dimensional | General closed restriction not inferred without the central hypothesis. |
| Cover/cocycle dictionary | split cocycle; section change b | zero class gives A×G; c changes by b(g)+b(h)−b(gh) | Continuous global section required. |
| Cocycle associativity | three factors g,h,t | two central coordinates differ by c(g,h)+c(gh,t)−c(h,t)−c(g,ht)=0 | Extension operation determined. |
| Moore odd-prime headline | p=3,5 | Hom(C₂,𝔽₃)=0; Hom(C₄,𝔽₅)=0 | Actual matrix/cohomology carrier in Lean. |
| Moore p=2 counterexample | μ(ℚ₂)=C₂ | Hom(C₂,𝔽₂)=𝔽₂, cardinality 2 | Oddness cannot be dropped. |
| Moore ramified/unramified/equal characteristic | E/ℚ₃ unramified quadratic; ℚ₃(ζ₃); 𝔽₃((t)) | root orders 8,6,2; mod-3 Hom dimensions 0,1,0 | ℚ_p-only vanishing not promoted to all F. |
| Degree-one perfection input | a=2 over ℚ₂ and ℚ₃ | a≠0; a²−1=3≠0 in both characteristic-zero fields | Imported native lemma; finite fields 𝔽₂,𝔽₃ excluded from this witness. |
| Metaplectic pushout | odd p, kernel μ(ℚ_p) | square quotient has order 2; mod-p Hom remains zero | Different coefficient primes distinguished. |
| Cartan–Leray rank one | M_∞=Fˣ, coefficient π | E₂⁰⁰=π; all other terms 0 | Abutment S⁰=π recovered. |
| Cartan–Leray zero/short exact coefficients | π=0; 0→k→k²→k→0 | zero pages; stalk dimensions 1,2,1 | Natural coefficient maps and δ-arrows retained. |
| Profinite-product continuity | S=∅,{1},{1,2} | Hʲ product=0,Hʲ(U),Hʲ(U)² | Works for p-primary coefficients via finite limits. |
| Čech/cochain signs | d⁰v(g)=gv−v | d¹d⁰v=ghv−gv−ghv+v+gv−v=0 | Same signs in the multiplicity spectral sequence. |
| Infinite-level higher cohomology | perfectoid affinoid and Artin–Schreier | H¹=O(U♭)/(1−φ); Hʲ=0 for j≥2 | Mittag–Leffler input separately supplied. |
| Multiplicity coefficient Hom | π=k² trivial | Hom(k²,Hʲ)=(Hʲ)², same as coefficient tensor | Dual appears on the source. |
| Multiplicity dual character | δ(g)=2 mod 5 | dual scalar=3; Hom from dual restores scalar 2 | Contragradient direction retained. |
| Continuous Hom topology | source ∏ℕk, target k discrete | continuous functional depends on finitely many coordinates | Algebraic dual substitution excluded. |
| Multiplicity naturality/refinement | identity finite quotient; two refinements | both induce the same continuous functional on every source element | Only actual finite quotient presentations are used. |
| Five-term edge | r=1; π=0 | outer positive-degree terms 0; middle multiplicity/S¹ both 0 | Map source and target fixed, no unconditional isomorphism. |
| Degree-one supersingular comparison | F=ℚ_p, π supersingular | H¹(SL₂,π)=H²(SL₂,π)=0 | Middle arrow is an isomorphism. |
| Degree-one character comparison | odd p, π=1 | S¹=0 and H²=0, so multiplicity=0 | Retained; at p=2 right-hand group=k. |
| Degree-one finite errors, general F | π=0; ramified E with ζ_p | zero input gives zero errors; trivial coefficient H² over E can have dimension 1 | Finiteness, rather than vanishing, is the general-F conclusion. |
| Borel quotient intermediate/final | diag(p,p⁻¹) | determinant 1; element in B′ but not B(ℤ_p) | Two quotient stages distinguished. |
| Borel fibre | points [1:0],[0:1] | distinct elements of ℙ¹(ℚ_p); independent locally constant values on clopen neighbourhoods | Fibre not replaced by a point. |
| Borel universal property/extensionality | identity descended map; two maps agreeing after q | compositions agree at every orbit; identity has identity pullback | Quotient map and target specified. |
| Borel local system | χ=1; zero coefficients | stalk dimensions 1 and 0 | Nontrivial character stalk still rank one, not its invariant subspace. |
| Borel pushforward | χ=1 | π̄_*k=ℱ_{Ind_B^G1}; fibre cohomology vanishes above 0 | Higher direct image statement is for abelian sheaves. |
| Borel integral coefficient comparison | stalk at geometric point, trivial k | both sides are C⁰(ℙ¹(ℚ_p),k)⊗O⁺/p | Fibre comparison uses the same profinite values. |
| Borel level/action maps | identity level and π_GH factorisation | π̄∘q=π_GH on every point and function | Source/target and functoriality fixed. |
| Ludwig principal-series vanishing | equal trivial characters; p=2 | S²(Ind1)=0, while dim S²(1)=1 | Equal characters and small primes retained. |
| Ludwig extension vanishing | two principal-series constituents | outside S² terms 0 and 0; middle S²=0 | Long exact sequence used. |
| Steinberg boundary | 0→1→Ind1→St→0 | S¹(St) surjects onto S²(1)=k(−1) | S¹(St)≠0, S²(St)=0. |
| Ordinary finite-length filtration | one character and one principal-series factor | degree-two graded dimensions at most 1 and 0 | Finite character filtration, not an exact S² functor. |
| Global residual local data | irreducible versus nonsplit reducible r̄ | local dimension 2 in each case; only the second has invariant line dimension 1 | Global absolute irreducibility does not force local irreducibility. |
| Global parity/quaternion algebra | [E:ℚ]=2 versus 3 | sums of real invariants 1=0 versus 3/2=1/2 in ℚ/ℤ | Even degree retained. |
| Global residue-size ranges | k=𝔽₉; k=𝔽₂₇ | degrees 2 and 3; |kˣ|=8 and 26 | Globalisation bound and auxiliary-place bound distinguished. |
| Auxiliary-place Frobenius ratio | primitive ξ in 𝔽₂₇ | ξ² has order 13, outside 𝔽₃ˣ of order 2 | Exclusions include 1 and both norm values. |
| Hecke normalisation denominator | v∤p; v|p | N(v) mod p is nonzero in first case and zero in second | Inverse norm used only at eligible unramified away-p places. |
| Quaternion invariant exchange | two changed invariants | 1/2+1/2=1=0 in ℚ/ℤ | Definite and curve algebras not identified at 𝔭. |
| Block residual fibre | a∈𝔪_{A_B} | aM=0; A_B action factors through k | Fibre is M, not full S. |
| Block occurrence | supersingular versus generic ordinary block | constituent sets {π̄} versus {I(χ₁,χ₂),I(χ₂,χ₁)} | Abstract occurrence imported, global instance verified. |
| Fixed-central-character duality | λ=O | lattice tensor L/O nonzero; two torsion factors zero | Projectivity/injectivity kept in fixed-character categories. |
| Ideal-torsion comparison | I=0; I=T | S[0]=S; S[T]=0; comparison targets S¹(S) and 0 | Correct boundary ideals and zero cokernels. |
| Ideal generators and degree-zero obstruction | one zero generator; one unit generator | multiplication map zero with full kernel; unit map identity with zero kernel | Noetherian finite generation and S⁰(S)=0 explicit. |
| Nongeneric Hecke obstruction | r̄ˢˢ=χ⊕χε | permitted cokernel has norm-one action=1 | Isomorphism not asserted in excluded case. |
| Generic Hecke comparison | ratio outside {1,ε,ε⁻¹} | exceptional condition false; obstruction=0 | Isomorphism case retained. |
| Generic-pair swap/twist | ratio a | swap ratio a⁻¹; simultaneous twist ratio a | Genericity preserved by both operations. |
| Generic central character | diag(z,z) | inducing product χ₂(z)χ₁(z)ε(z)⁻¹ | Central character χ₁χ₂ε⁻¹ fixed. |
| Galois invariant criterion | K=ℚ_p | trivial restriction alternatives χ₁=1 or χ₂=1 | At most two ordered candidates at fixed central character. |
| Twisted Galois invariants | invariant v, η(g)=2 mod 5 | twisted g·v=3v≠v | Hypothesis must twist with conclusion. |
| Non-Galois K formulation | character field E_i/F | Gal_K≤kerχ_i iff E_i⊆K | No undefined quotient Gal(K/F) used. |
| Character finiteness via norms | cyclic norm quotient C_m | characters are roots of Xᵐ−1; at most m, with p-part killed | Finite support proof uses finite norm quotient. |
| Finite-image definition | empty support; one value k; one value ⊕ℕk | supports 0,1,1; dimensions 0,1,∞ | Two separate conditions retained. |
| Finite-image extensionality | scalar isomorphism 2 mod 5 | inverse scalar 3; dimensions/support unchanged | Both directions of invariance tested. |
| Finite-image injection/exactness | one-index k→k²→k | dimensions 1,2,1; support union has size 1 | Closure facts stated pointwise. |
| Finite-image cosocle family | nonsplit length-two extension | Hom only to irreducible quotient; one-dimensional over its endomorphism field | Cosocle, not socle, used. |
| Iwahori finite-image negative control | all irreducible π | dim π^{I₁}≥1 for infinitely many π | Finite-dimensional values alone insufficient. |
| Finite-image cohomology | H=1; H=ℤ_p, one k value | H=1 has dimensions 1,0,…; ℤ_p has 1,1,0,… | Support stays within original finite support. |
| Arithmetic ascent first term | finite-level component set of size c | dim H⁰=c; local Galois H¹/H² correction dimensions finite | Strict inverse-limit sequence specified. |
| Compact tower ascent | n=0 | component functions are two regular unit-function copies | Correct O_Dˣ, no torsion-free assumption. |
| Scalar ascent | shift by 2 on ℤ | two orbits; H¹ of coinduced coefficient=0 | H¹ quotient comparison unchanged after correcting component count. |
| Passage through invariants | exact kernel V₁→S¹ | invariant cokernel obstruction lies in H¹(W_K×Ǧ_n,V₁) | Invariants are not treated as exact. |
| Infinite-level comparison support | supersingular π | error V₁=V₂=0; Y=S¹-invariants | Exceptional support kept only where present. |
| General-F ascent | π=0; unquotiented heights | sequence zero for zero input; height lattice is ℤ without a scalar quotient | Separate geometric theorem retained. |
| Central-character support bound | G′ centre, p=3 | pro-3 units have no nontrivial finite prime-to-3 image; quotient C₂ gives 2 characters | Uniform finite centre quotient used. |
| Scalar-extension descent | two irreducibles sharing absolute constituent | nonzero Hom after extension would descend; Schur forces an isomorphism | Distinct k-irreducibles cannot generate infinitely many repeats. |
| Arithmetic finite length at n=0 | two half-plane copies | dual is V∨⊕V∨; length adds as 2·length(V∨) | Both height summands retained. |
| Arithmetic bounded coefficients | exponents 1,2 | O/ϖ has one k-graded piece; O/ϖ² has two | Dévissage, not division by p. |
| Arithmetic finite-presentation input | q=0 and exponent 1 | finite-level H⁰=kᶜ; dual smooth finite coefficient module | Supplier gap used directly, not assumed proved here. |
| μ_p coefficient twist | coefficient dimension over 𝔽_p | μ_p is one-dimensional over 𝔽_p with its cyclotomic action | Group finite length preserved; Galois twist not erased. |
| General geometric admissible corollary | π=0 and π=1 | Hom dimensions 0 and finite; fixed-central-character proof gives odd-p trivial multiplicity 0 | Full source conclusion retained; central hypothesis remains in general-F theorem. |
| General-F multiplicity theorem | character π, error W finite | dim(π⊗W)^{SL₂}=dim W | Works for every finite F, including ramified F. |
| General-F small-prime check | F=ℚ₂, π=1 | H²(SL₂,k)=k, finite dimension 1 over k | Finiteness uses no odd-prime vanishing. |
| Geometric multiplicity zero/sum | 0; χ₁⊕χ₂ | Hom(0,H)=0; Hom(χ₁⊕χ₂,H)=Hom(χ₁,H)×Hom(χ₂,H) | Dual gives zero/direct sum. |
| Geometric multiplicity character | χ(g)=2 mod 5 | tensor by χ⁻¹ has scalar 3; χ-isotypic vector becomes invariant | Inverse character retained. |
| Geometric multiplicity covariance | map ρ₁→ρ₂ | Hom precomposition reverses once, dual reverses twice | Covariant in ρ. |
| Geometric multiplicity right exactness | quotient ρ→χ₂ | Hom(χ₂,H)↪Hom(ρ,H); continuous dual gives Π(ρ)↠Π(χ₂) | No claimed left exactness. |
| Finite-group dual formula | H=C_p, unipotent rank-two module | invariants=k e₁; coinvariants=k[e₂]; natural invariant→coinvariant map=0 | Coinvariants indispensable despite equal dimensions. |
| Finite Galois reduction | F′=F, H=1 | (ρ⊗V)_1=ρ⊗V | Both duals present in initial Hom identification. |
| Geometric level direction | m≥n≥j; identity m=n | pullback H¹_j→H¹_n→H¹_m; dual Π_m→Π_n→Π_j; identity remains identity | Variance corrected and explicit. |
| Geometric finite presentation | finite H with zero coefficient V | (ρ⊗0)_H=0, smoothly finitely presented | General proof uses arithmetic input and finite errors. |
| Higher-dimensional vanishing | absolutely irreducible dim 3 | 3 differs from ordinary factor dimension 1 and supersingular label dimension 2 | Π^geo=0 over ℚ_p, odd p. |
| Supersingular block support | absolutely irreducible dim 2; possible zero output | constituent set contained in {Π(ρ)}; zero has length 0 | No nonvanishing or positive multiplicity promised. |
| Reducible input negative control | extension of χ₂ by χ₁ | Π(ρ) surjects onto Π(χ₂) | Absolute irreducibility required for block support. |
| Lemma 4.24 kernel term | Z=0; quotient M/Z ordinary | Z=0 gives dimensions 0,0; S⁰(M/Z) has character factors | Kernel contribution not discarded. |
| Lemma 4.24 image term | Z=M, r̄=χ₁⊕χ₂ | Galois graded factors χ₁⊗U₁ and χ₂⊗U₂, each character dimension 1 | Compact cohomology keeps character filtrations. |
| Supersingular S⁰ obstruction | π′ successive supersingular copies | (π′)^{SL₂}=0, hence S⁰(π′)=0 | Not applied to character extensions. |
| Lubin–Tate smooth-vector level zero | n=0 | two height classes of open discs | Whole H¹ not claimed finite-dimensional. |
| Infinite-tower finite-dimensional submodule | one hypothetical invariant line | dim=1 would be a forbidden character; Hom character=0 | Smooth subspace in fixed pieces actually zero. |
| Finite root-group quotient | additive ℚ_p→finite group | image is finite divisible abelian, hence {1}; root-generated SL₂ acts trivially | Divisibility, not perfection alone, supplies the finite-quotient step. |
| Lubin–Tate component descent correction | geometric point with finite H⁰=kᶜ | geometric H¹(point)=0; arithmetic correction H¹(Gal_K,kᶜ) may be nonzero | Components are H⁰/descent terms, not canonical geometric H¹ classes. |
| Lubin–Tate oddness | odd p versus p=2 | bounding H² term 0 versus k | Source prime range retained. |
| Smooth-vector/finite-length equivalence | zero dual and finite direct sums | zero has length/smooth dimension 0; finite sums add both quantities | Uses the supplied criterion after finite-error comparisons. |

## Pinned API and elaborated-type audit

The content checkout reports commit `c57bdc02fc2a4b1643df71b4a3a14b20fdad247f`. Its manifest pins Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; each package's checked-out commit agrees. These replace the older design baseline for all acceptance-file and duplication decisions. The final supplier reread found the inspected new-roadmap heads unchanged; existing-main suppliers were checked from the content checkout. The roadmap resolver's indexed-main commit is recorded in its output below, separately from the checked-out libraries.

| Pinned definition | Exact location and defining data | What is not implicit |
|---|---|---|
| `TopRep` | `Mathlib/RepresentationTheory/Continuous/TopRep.lean:31`; its action field is `ρ : ContRepresentation k G V` | Joint continuity of the group action is not in the structure. |
| `ContRepresentation` | `Mathlib/RepresentationTheory/Continuous/Basic.lean:54`; operator map is `G →* V →L[R] V` | Continuity in g is not a field. |
| `TauCeti.IsSmoothDiscrete` | `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:272`; fields `discreteTopology` and `stabilizer_isOpen` | Smoothness is an explicit theorem hypothesis, not inferred from a bare TopRep. |
| `continuousCohomology` | `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131`; homology of `homogeneousCochains` | The model is continuous cochains, not abstract discrete-group cohomology; a Hausdorff quotient topology is not built into every homology object. |
| `TauCeti.trivialFp` | `TauCeti/RepresentationTheory/Homological/ContCohomology/TrivialFp.lean:73`; trivial action on `ULift (ZMod p)` | The lift is a native universe choice, not an additional geometric object or an unproved coefficient definition. |
| `LieGroup` | `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean:72`; differentiable multiplication and inverse in the given chart structure | Compactness and Hausdorffness are separate; both are explicit in the compact headline. Finite model dimension is explicit. |
| `IsAdicComplete` | `Mathlib/RingTheory/AdicCompletion/Basic.lean:56`; extends `IsHausdorff` and `IsPrecomplete` for the ideal | It expresses algebraic adic completeness, not completeness of the separately chosen discrete scalar topology. |
| `PontryaginDual` | `Mathlib/Topology/Algebra/PontryaginDual.lean:37`; carrier `A →ₜ* Circle` | This definition is not Hom_cont,O(−,L/O). |
| `Set.Finite` | `Mathlib/Basic/Finite/Defs.lean:185`; finite subtype of a set | Finite support does not assert finite-dimensional family values. |
| `CategoryTheory.Abelian.Ext` | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118`; small shifted Hom with `[HasExt C]` | It does not furnish the missing canonical abelian/derived structure on the smooth coefficient category. |

The native compact-invariant predicate has a real body consisting only of finite generation of the restricted native invariant submodules. It carries exactly the ring, topological-space, group and representation arguments its type needs. Smoothness and annihilation by a positive maximal-ideal power belong explicitly to the theorem; they are not claimed to survive as hidden section variables of the predicate.

The prescribed scratch audit copied the final acceptance file, added `#check @name` for all three declarations, and elaborated it once. Its printed compact-headline type retains the prime, model dimension, topological group, T2, compact, chart and analytic Lie-group data; complete noetherian local A; finite residue field and its characteristic p; discrete scalar topology; smooth-discrete X; compact-open admissibility; j>0; the explicit annihilation equation; and arbitrary cohomological degree i. Its conclusion is both `Module.Finite A` and `Finite` on the actual native continuous-cohomology carrier. The printed Moore type retains `[Fact p.Prime]` and `2 < p` and names `TauCeti.trivialFp p (Matrix.SpecialLinearGroup (Fin 2) (Padic p))`. No needed binder disappeared.

An exploratory analytic-group signature redundantly supplied both IsManifold and LieGroup. The pinned LieGroup instance already supplies the analytic groupoid; the extra IsManifold binder was removed to eliminate the overlap warning, without changing the mathematical hypothesis. The native trivialFp coefficient object also replaces an initial direct coefficient expression whose scalar instance was not inferred. No local instance, sorry'd data, instance override or `set_option` was introduced into the acceptance file.

The one allowed Tau Ceti import was built with the targeted command `lake build TauCeti.RepresentationTheory.Homological.ContCohomology.TrivialFp`; it completed successfully. The acceptance file was then run with the mandated `lake env lean` invocation from the content checkout, using its absolute tool argument for `packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/Suggested.lean`.

Final outcome: exit code 0; exactly **2** warnings, both `sorry` warnings; no errors and no other messages. The diagnostic file prefixes below are normalised to the permitted repository-relative path; the warning text is verbatim.

```text
packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/Suggested.lean:60:8: warning: declaration uses `sorry`
packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/Suggested.lean:82:8: warning: declaration uses `sorry`
```

The source-manifest checker reports:

```text
packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/sources.toml: 0 problem(s)
```

## Dependency and citation checks

The final mandated dependency check returned, verbatim:

```text
depcheck: 52 roadmaps, 606 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line, and no merge-order edit was made. All consumed roadmaps are on main, earlier in the supplied order, or the explicitly recorded supplier gap. The final citation resolver checked indexed main `1ce5c4f` and 363 open roadmap heads and reported no unresolved cross-roadmap citations and no unresolved Lean names. It also reported that it did not check native library names on its host; those names were checked directly against the pinned local source files and the Lean type audit above.

The seven initially flagged design citations were resolved as follows: CompletedCohomologyAndLocalGlobalCompatibility R31.1 becomes §§1.5–1.7; DeformationAndDerivedPatchingAlgebra R03.1 becomes Layer 1/§1.10; PotentialModularityAndCompatibleSystems R23.1 becomes §§2.23, 4.15; LocalGaloisDeformationRings R08.6 becomes §3.4 with the exact lifting gap; AutomorphicGaloisRepresentations R19.2 becomes §§3.10–3.11; PadicLocalLanglandsForGL2Qp R30.5 becomes §§5.1–5.4; and the nonexistent roadmap name CompletedCohomology is replaced by CompletedCohomologyAndLocalGlobalCompatibility. Other internal legacy labels were resolved to their actual numbered sections, including EndoscopicTransferAndUnitaryTraceComparison Layer 12.

Final structural checks found seven layers, seven Examples sections and seven Dependencies sections. Every target subsection has at least three discriminating Checks. The report has 181 adversarial statement rows. All three Lean declarations occur by their exact names in the README, and the README has no unbound own-declaration claims. Suggested.lean has one `import Mathlib`, the single used Tau Ceti import, two theorem proofs with `sorry`, one simple definition with a real body, no sorry'd data and no option overrides. The source manifest has twelve unique lifetime keys, eleven certified texts and the one settled locator-only citation. Every requested deliverable is present; no machine path occurs in the README, Lean file, manifest, metadata or report.
