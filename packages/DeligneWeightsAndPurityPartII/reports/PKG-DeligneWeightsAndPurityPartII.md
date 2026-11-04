# Package report: DeligneWeightsAndPurityPartII

The package expands the accepted 30-target design into `packages/DeligneWeightsAndPurityPartII/README.md`, `Suggested.lean`, `metadata.toml` and `sources.toml`. A skeleton was generated from every node's statement, hypotheses, API, Checks, acceptance examples, locators and prerequisites before authoring the prose. All 30 mathematical targets, 74 API facts and 34 named design Checks are retained, with the additional acceptance examples and discriminating witnesses. Numbering is now §§0.1–4.7 in the original five-layer order.

The supplied `design/review.json` and prior reports were absent. The acceptance review is embedded in `design/plan.json` under `review`; its 30 target-level notes were read and applied. The input README and all plan fields other than the top-level `gaps` value were preserved. The two inherited gap records remain, with three precisely scoped supplier-gap records appended. Parsing and comparison of every non-gap field and a byte-preserving splice of the gaps value confirmed that no other plan content changed.

The comparison base is roadmap main `4aeb1cc1f6feb6ec6d7ac4e892307d67006acbd2`, Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, as recorded in the supplied `lake-manifest.json`. The design's older pin inventory was not treated as a current library inventory. Upstream shape was read in `TauCetiRoadmap/LocalGaloisGroups/README.md`, `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md` and `Completed/IntegralLattices/README.md`; metadata follows the single-topic form on main.

## Headlines fixed before Suggested.lean

The inventory was written before the Lean acceptance file. “Not statable” means that the actual theorem cannot be expressed using the pinned carriers plus a few nonduplicating simple definitions; no placeholder predicate or substitute theorem is supplied.

| Headline | Acceptance status |
|---|---|
| Detection on admissible closed subgroups, §0.5 | Not statable: canonical monodromy filtration, relative local datum and monodromy-grade purity interfaces are missing. |
| Transport and stable-summand purity, §§0.6–0.7 | Not statable: the same monodromy and relative-purity interfaces are missing. |
| Finite-extension invariance and good reduction, §§0.9–0.10 | Not statable: geometric cohomology has no supplied weight–monodromy predicate at the pins. |
| Deligne's cohomological equal-characteristic theorem and its global-function-field consequence, §§1.1–1.2 | Not statable: normalized lisse cohomology representations and their monodromy-graded weight interface are missing. |
| Completed Kummer tower with its coordinate tilt, §2.1 | Not statable: completed Kummer-tower construction, perfectoid-field predicate and coordinate tilt comparison are missing. |
| Marked Galois equivalence, residue fields, prime-to-p Tate module and tame character, §§2.2–2.4 | Not statable: the tower/tilt carriers and their actual comparison maps are missing. |
| Tilting transfer, §2.5 | Not statable: marked data and relative purity are missing. |
| Degreewise local constancy and punctured-disc Riemann existence, §§3.2–3.3 | Not statable: analytic étale sites, direct images, oc-quasi-constructibility and Kummer-cover interfaces are missing. |
| Huber neighbourhood theorem and Galois-stable all-power form, §§3.4–3.5 | Not statable: analytic/pseudo-adic support cohomology and the tube/site comparisons are missing. |
| Tilted approximation, §4.1 | Not statable: toric models, their analytic projection and tubes are missing. |
| Multiplicative equivariant comparison, §4.2 | Not statable: open toric étale-topos maps and normalized algebraic–adic comparison are missing. |
| Top-degree isomorphism, §4.3 | Not statable: the actual comparison map is missing. |
| Equivariant Poincaré pairing splitting, §4.4 | Stated: `TauCetiRoadmap.DeligneWeightsAndPurityPartII.duality_splitting`. Its native complementary-pair statement is precisely the implication used in every grade, with a nonzero top scalar and a possibly nontrivial top character. |
| Geometric stable direct summand, §4.5 | Not statable: the geometric comparison and its cup/trace pairings are missing. |
| Scholze Theorem 9.6 and projective-space/product corollaries, §§4.6–4.7 | Not statable: fan-based toric embeddings, set-theoretic complete intersections and geometric weight–monodromy are missing. |

`Mathlib/CategoryTheory/Sites/ElladicCohomology.lean` provides scheme cohomology, not these normalized geometric Galois, monodromy, toric or analytic comparisons. Object searches in both pinned libraries found no canonical weight–monodromy or toric-tilting API. Creating copies of supplier predicates would violate ownership; encoding the geometric theorems by arbitrary propositions would violate the acceptance-file contract.

## Corrections and scope decisions

- The README's own API and Check names are prose. Only the native headline `duality_splitting` is presented as this package's Lean declaration. No API padding was added to satisfy identifier checks.
- Replaced the nonexistent ArithmeticGaloisRepresentations R01.2 citation by §§2.4–2.6, and used the canonical scalar/filtration/pair-purity ownership there. DeligneWeightsAndPurity §0.19 supplies the comparison, §5.11 the local pure-sheaf theorem and §7.15 proper-smooth finite-field purity. The design's request for a second parent weight–monodromy predicate is therefore unnecessary.
- Scheme base change and adic realization use EtaleCohomologyFoundations §§F.2–F.4. The remaining requested packaging of continuous geometric Galois representations and restriction is attached to that owner, rather than to SchemeAndStackFoundations Layer 2.
- Formal generic fibres and proper-model comparison use AdicSpacesPartIII §§R2.3–R2.4, R2.8, R2.10; the design's AdicSpacesPartII R2 citations no longer locate them. Analytification remains AdicSpacesPartII R1.
- ClassicalAdicEtaleCohomology's revised section layout is used directly: §§1.1–1.5, 8.2, 10.1–10.4 and 11.1 replace H0/H3/H4/H5 labels. Rational pairings/cycles use EtaleDualityAndPerverseSheaves §§0.5–0.6, 1.3, 3.4–3.7 rather than the obsolete EDC.2–EDC.3 target labels.
- AnalyticToricGeometryPartII's supplied design NT.3 projection/open-topos and NT.4 cohomology statements explicitly contain field naturality, read at their source. The corresponding old request is discharged; it is not registered again as a supplier gap.
- Added the actual missing ample-top-intersection contract to SchemeAndStackFoundations §§5.2–5.3. The main README supplies proper push, degree and Chern projection, but not the claimed generic nef/big targets. The proof needs positivity of an ample top intersection, and does not need a new nef/big theory here.
- Retained the accepted ramification factors: restriction D_k to G_k′ equals eD_k′; the identity from restricted to standard has constant e⁻¹. Under tilting t_k=e t_k″∘β, so the k-side-to-k″-side constant is e⁻¹. Both are witnessed numerically below.
- Retained the accepted geometric sign, profiniteness, a finite field of definition for coefficients, nonzero tame image, geometric connectedness of the alteration, and rational coefficients for Lemma 9.9. Added the p=2 norm-sign, characteristic-3 splitting failure, nontrivial top character, non-abelian S₃ action and square-zero/nilpotent thickening witnesses.
- Restated all four neighbourhood proof-route inputs as named mathematical targets of §3.4, with their domains and quantified maps. The proper surjective blow-up cover includes the centre; the blow-up alone fails surjectivity for Z=X. The direct-image amplitude target quantifies one bound and one radius, the stabilization target quantifies all smaller pairs of radii, and the continuity target names the colimit-to-support map. Degreewise local constancy alone is not asserted to prove any of them.
- Corrected implicit labels in API prose: the two restriction hypotheses and the open-inertia/graded-weight conditions are written out, rather than referring to absent labels (a)/(b). The toric Checks identify the unnamed k₀ as the dense perfect field and retain all root-radius and nonzero-degree restrictions.
- Source corrections verified in the published SCH12 extraction: Proposition 9.1's tame-character argument is σ, not its unbound printed letter (SCH12 line 2518); the integer weight in Lemma 9.5 is quantified (SCH12 line 2585); top-degree surjectivity uses geometric connectedness of Z′ as well as Y (SCH12 line 2644; DJ96 line 604 supplies the finite constant extension). These are stated as corrected mathematics, without process narrative in the roadmap.

No notion was moved down from a later roadmap. The general Huber-neighbourhood theory remains in Layer 3 as the accepted design assigns it. The supplied source record does not justify replacing it by ordinary proper base change or by a theorem only for good reduction.

## Duplication and ownership sweep

The roadmap service searched the supplied 353-open-head index and main by mathematical objects, including weight–monodromy, monodromy filtrations, Kummer completions, tame characters under tilting, tubes and pseudo-adic supports, direct images near punctures, cup pullback, perfect pairings and top-degree splitting. Board package READMEs/designs and the pinned Mathlib/Tau Ceti were searched separately. Existing-main suppliers were read from main, not from revision pull requests; new-roadmap suppliers were read from the supplied indexed heads. AnalyticToricGeometryPartII has no content-repository roadmap available through the service, so its supplied `packages/AnalyticToricGeometryPartII/design/README.md` was read directly, including its now-explicit naturality clauses.

| Construction or theorem excluded from new ownership | Exact owner consumed |
|---|---|
| Canonical scalar Weil-number predicate | ArithmeticGaloisRepresentations §2.6; real-base comparison in DeligneWeightsAndPurity §0.19. |
| Linear monodromy filtration and its zero/rescaling/duality/tensor API | ArithmeticGaloisRepresentations §2.6; sheaf variant LefschetzPencilsAndVanishingCycles §§1.2–1.5. No private filtration definition or elementary filtration lemma is in Suggested.lean. |
| Grothendieck monodromy, finite logarithm and canonical Weil–Deligne construction | ArithmeticGaloisRepresentations §2.4, consuming its named linear substrate; no second local-field monodromy theorem. |
| Continuous local-field Weil–Deligne pair purity | ArithmeticGaloisRepresentations §2.6. Our datum-relative condition is a distinct marked-group generalization. |
| Equal-characteristic pure-sheaf theorem | DeligneWeightsAndPurity §5.11. Layer 1 constructs its cohomological application and global-field comparison, not its tensor-power proof. |
| General finite-field proper-smooth purity | DeligneWeightsAndPurity §7.15, used by good reduction and the family application. |
| Inertia, tame quotient, Frobenius and Teichmüller lifts | Tau Ceti LocalField modules and LocalFieldsRamification Layers 0–4. Only assembly and data restriction are owned here. |
| Perfectoid-field definition, tilt and finite-extension/Galois equivalence | PerfectoidSpaces P1 and P3. The ℚ_p completed Kummer example is P1.32a; §2.1 keeps its arbitrary finite k/ℚ_p coordinate form and residue/tame markings. |
| Abstract Kummer field of norms and Galois equivalence | FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3. The componentwise sharp-action identification and marked datum comparison are the retained variant. |
| Henselian completion and purely inseparable étale invariance | AdicEtaleGeometry §A1.0.5 and SchemeAndStackFoundations §0.23a. |
| Generic fibres, equation-defined closed tubes and proper-model comparison | AdicSpacesPartIII §§R2.3–R2.4, R2.8. The retained global finite-ideal gluing/cofinality is distinguished from special-fibre specialization tubes. |
| All toric perfectoid spaces, π, its open-topos morphism, ambient cohomology and hypersurface approximation | AnalyticToricGeometryPartII NT.0–NT.6. Layer 4 consumes them and constructs smooth geometrically connected approximation data and their cohomological splitting. |
| Scheme proper/smooth base change, geometric finiteness and adic realization | EtaleCohomologyFoundations F.2–F.4, instead of rebuilding the old SF.2 request. |
| Analytic site, support, continuity, disc cohomology and algebraic comparison | ClassicalAdicEtaleCohomology §§1.1–1.5, 8.2, 10.1–10.4, 11.1. Huber shrinking-neighbourhood stabilization is distinct from its formal strict-localization tube comparison (§4.3). |
| Alterations, Chow pushforward and Chern projection | SchemeAndStackFoundations §§4.16, 4.19, 5.2–5.3. |
| Poincaré duality, extreme degrees, cycle/trace comparison | EtaleCohomologyFoundations F.6 and EtaleDualityAndPerverseSheaves §§0.5–0.6, 1.3, 3.4–3.7. The retained theorem derives an equivariant complement from them. |
| Abstract exact-functor composition identity underlying Lemma 9.8 | `CategoryTheory.Abelian.Ext.mapExactFunctor_comp`, `Mathlib/Algebra/Homology/DerivedCategory/Ext/Map.lean:223`. Section 3.6 keeps the module-cohomology/site-product identification and inverse-pullback application. |
| Elementary perfect-pairing carriers, adjoints, annihilators and restriction lemmas | `LinearMap.IsPerfPair` and `LinearMap.IsPerfectCompl`, `Mathlib/LinearAlgebra/PerfectPairing/Basic.lean:39` and line 163; `LinearMap.IsPerfPair.restrict`, `Mathlib/LinearAlgebra/PerfectPairing/Restrict.lean:72`. The latter assumes complementarity, so it does not supply the headline which derives the complement from top-degree compatibility. |

This lists every ownership removal from the design's proposed prototype catalogue. All are reflected in Scope and ownership and the supplier contracts. The local marked datum, detection theorem, punctured-disc stabilization and multiplicative equivariant splitting were not found with their stated objects and hypotheses in another supplied owner. Specialization tubes of PerfectoidSpaces §P5.13.1 and the fixed-point tubular-neighbourhood results of EtaleDualityAndPerverseSheaves Layer 7 concern different geometric objects and do not provide Huber's result.

No declaration is assigned another roadmap's fully qualified name. The one declared name occurs only in this package's namespace. Ownership against the supplied open heads was checked; no additional open work was sought beyond the supplied index.

## Pinned declaration audit

| Native input | Pin inspection and limitation |
|---|---|
| Absolute Galois group and restriction | `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42`, line 59: group of algebraic-closure automorphisms, and continuous restriction with compatible algebra structures and scalar tower. No injectivity conclusion is in the map definition. |
| Representation | `Mathlib/RepresentationTheory/Basic.lean:48`: a monoid homomorphism to module endomorphisms. No topology or continuity is included. |
| Continuous homomorphism | `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean:57`: extends a monoid homomorphism and a continuous map; compactness is not included. |
| ℓ-adic carriers | `Mathlib/NumberTheory/Padics/PadicNumbers.lean:531`, `Mathlib/NumberTheory/Padics/PadicIntegers.lean:71`: prime ℓ is a Fact binder. |
| Nilpotent exponential | `Mathlib/RingTheory/Nilpotent/Exp.lean:50`: finite exponential in a ℚ-algebra; used only with nilpotence, not as an arbitrary analytic exponential. |
| Perfect pairing | `Mathlib/LinearAlgebra/PerfectPairing/Basic.lean:39`: both curried adjoints are bijective. No symmetry, finite-dimensionality or group-equivariance is in that class; the headline supplies the needed independent finite-dimensional hypotheses and group equations explicitly. |
| Ext and sheaf cohomology | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Map.lean:223` preserves composition; `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56` uses Ext from the constant lifted ℤ sheaf in abelian groups, so the module comparison is supplied separately. |
| Inertia | `TauCeti/NumberTheory/LocalField/Unramified/Inertia/Basic.lean:99`, line 146: fixing subgroup of the maximal unramified extension, with closedness theorem. Field, ValuativeRel, topology and IsNonarchimedeanLocalField are explicit at line 92. |
| Frobenius | Same module, line 310 and line 320: arithmetic lift and its residue-power characterization; geometric lifts are its inverses. |
| Tame character | `TauCeti/NumberTheory/LocalField/Tame/Character.lean:401`, line 413: continuous map to the prime-to-residue Tate module and the positive Kummer ratio. Its arithmetic conjugation is `TauCeti.IsArithFrobeniusLift.smul_eq_pow`, `TauCeti/NumberTheory/LocalField/Tame/Quotient.lean:387`. |
| Teichmüller lift | `TauCeti/NumberTheory/LocalField/Teichmuller.lean:63`: zero-preserving multiplicative section. No additive property is assumed. |

## Source certification and limits of support

All seven cited works have one lifetime key each. SCH12, ITO20, DEL80 and DJ96 were fetched by the sources service from legal publisher/open-repository copies and read at the cited line locators. Published SCH12 numbering was verified: the cup lemma is 9.8 and the top-degree lemma is 9.9. The manifest also records the arXiv identifier on that same key and explains the numbering difference. DEL80 line 1528 gives the monodromy-grade weight conclusion; DJ96 line 604 supplies the finite field extension giving smooth geometric irreducibility. The cited passages are not copied into the package.

LUT93 and HUB96 are uncertified original citations resolved by their verified publisher DOIs and used by locator. HUB98's original could not be fetched by the service's exact-title lookup. It is an explicitly uncertified bibliographic citation, with no fabricated fetched URL, date, hash or licence. The formulations actually read are ITO20 line 99 (degreewise direct-image local constancy), line 103 (punctured-disc Kummer trivialization), and line 974 (the all-degree neighbourhood conclusion). In particular the README cannot certify Huber's full original Definition 1.4 or claim an independently checked original proof; it refers to that literature definition and supplies the read consequence, without inventing a replacement definition. The four derived route steps remain mathematical construction targets, not purported consequences of mere point-set intersection or of the ordinary nonproper stalk formula. The manifest's uncertified entries are settled locator citations, so there is no repeated missing-text request.

The source-manifest check reports `packages/DeligneWeightsAndPurityPartII/sources.toml: 0 problem(s)`.

No untrusted text was executed as an instruction. For example `CONTRIBUTING.md` contains `lake exe cache get` and `lake build`; these repository workflow commands were treated as data and were not run. Only the brief's permitted Lean commands were used.

## Adversarial mathematics pass

Values below are computed witnesses and negative controls, not replacements for proof of the general claims. Write S for the two-term string N e₁=e₀, N e₀=0, Φ=diag(1,q), M_−1=M_0=Ee₀, M_1=E². Write T for the tame semidirect model with q=3, ℓ=2, Φ=(0,1) and t(x,0)=x. The pairing witness D has E=ℚ, G=S₃, V=V′=E³ with coordinate permutation, q the dot product, U=U′=E, a(x)=b(x)=(x,x,x), p(x,y)=xy and top scalar c=3. Symbols such as ∞ below are actual infinite-dimensional cohomology in the cited disc example.

| Statement or convention | Instances tried | Computed values on both sides | Result | Change |
|---|---|---|---|---|
| Finite residue base and ℓ≠p | 𝔽₂, 𝔽₃; junk q=1 | q=2,3 give distinct weights 0,2 for 1,q; q=1 gives 1^{w/2}=1 for all w | q≥2 and ℓ≠p retained | Added q=1 control |
| Geometric Frobenius sign | S with q=2,3 | NΦe₁=2e₀,3e₀=qΦNe₁; ΦNΦ⁻¹e₁=e₀/2,e₀/3 | Inverse sign excluded | Explicit two-term witness |
| Center and Tate twist | S; S(1) | Grades −1,1 have weights 0,2; twisting gives −2,0, central weight −1=1−2 | Center zero and twist direction agree | Reused across layers |
| Integer cohomological grading | Point, ℙ¹ | H⁻¹=0; point H⁰=E; ℙ¹ H²=E(−1), weight 2 | No natural-subtraction convention hidden | Integer complementary degree |
| Coefficient normalization | Degree-2 map, ℓ=2 | 2≠0 in ℚ̄₂, 2 mod 2=0 | Rational top theorem essential | Integral negative control |
| Nonempty geometric connectedness | Spec k; empty X | Top dimension 1; all empty cohomology 0 | Empty permitted in general conjecture only | Explicit nonempty final geometry |
| Radius domain | ε=1/9; junk ε=0 | \|T\|≤1/9 is a rational disc; 0∉\|Kˣ\| | Zero radius excluded | Positive radius convention |
| Profiniteness | T; discrete ℤ[1/3]⋊ℤ | Open inertia 2ℤ₂ has tame value 2≠0; discrete {0} has value 0 | Compactness needed for uniqueness | Noncompact control retained |
| Non-abelian and finite-group boundary | D; finite H=C₂,S₃ | D has a 2-dimensional stable complement; finite H has H/I finite, never ℤ̂, and any t:I→ℚ₂ is 0 | No accidental finite-group datum | Added explicit non-abelian test |
| §0.1 datum and isomorphisms | T, identity Frobenius coset, c=2 | t(Φ(1,0)Φ⁻¹)=1/3; identity coset would demand 1=1/3; scaled coordinate 2 | Correctly distinguishes marked data | No weakened datum in Lean |
| §0.2 standard datum | k′/k of e=2,f=1; ℓ=2 | t_k=2t_k′; (1/2)·2=1; inverse constant 2 | Both scalar directions agree | Kept e⁻¹ |
| §0.3 restricted datum | Unramified f=3; H′=H; H′=I | Q′=27,3; inertia-only residue image 0 has no Frobenius coset | Both hypotheses needed | Stated hypotheses in words |
| §0.4 relative purity | S; semisimplification; zero space | S grades have 0=1−1, 2=1+1; semisimplification grade 0 has weights {0,2}; zero has no eigenvalues | S pure weight 1; split pair none; zero every weight | Monodromy retained |
| §0.5 detection | S after residue degree 2; p-power versus ℓ-power tower | Φ² eigenvalues 1,q² have q²-weights 0,2; p-power tame image ℤ_ℓ; ℓ-power tame image 0 | Both directions for admissible subgroup; non-example excluded | No arbitrary-datum quasi-unipotence claim |
| §0.6 transport | c=2 on S | t′=2t, N′=N/2, pulled operator 2N′=N | Scalar cancels exactly | Explicit pullback direction |
| §0.7 summands | S⊕S; ker N⊂S | Grade dimensions 2,2; ker N eigenvalue 1, weight 0≠1 | Direct summands preserve weight; arbitrary subspace does not | Stable complement retained |
| §0.8 conjecture | Point, ℙ², empty scheme | Point H⁰ eigenvalue 1; ℙ² even eigenvalues 1,q,q²; empty all 0 | Weights 0,0/2/4; vacuous for empty | Empty clause explicit |
| §0.9 finite extension | e=2,f=3; inseparable e=p | Residue base q³; old t=2new t; e=p multiplies by p≠0 in ℚ_ℓ | Ramified and inseparable factors harmless | Added inseparable route |
| §0.10 good reduction | ℙ¹; Tate elliptic curve | ℙ¹ N=0, H² eigenvalue q; Tate N rank 1 | The latter fails good-model hypothesis | No good-prime restriction on end theorem |
| §1.1 curve theorem | Legendre at λ=0, p odd; constant family | Legendre ranks gr_−1=gr_1=1, weights 0,2; constant N=0 grade 0 weight i | Handles bad and good fibres | q_x retained |
| §1.2 every function-field place | ℙ¹_F, place degree a | Eigenvalues 1,q^a, with q^a-weights 0,2 | Every place included | No good-place shortcut |
| §2.1 Kummer completion | k=ℚ₂,ℚ₃; finite stages | Stage degree 2^n,3^n; value exponents ℤ[1/2],ℤ[1/3]; t♯=2,3 | Completed union nondiscrete; stage discrete | Frobenius modulo p argument explicit |
| §2.2 Galois identification | Identity extension; p=2 coordinate | L=K has index 1; norm(√2)=−2 while t♯=2 | Sharp and norm coordinates distinguished | Added dyadic sign |
| §2.3 residue and roots | ℓ≠p; ℓ=p in mixed characteristic | Source/target μ_{ℓ^n} have ℓ^n elements; μ_{p^n}(C♭) has 1, μ_{p^n}(C) has p^n | Prime-to-p isomorphism; p-power failure | Infinite-order ε not torsion counterexample |
| §2.4 marked comparison | k″=𝔽_q((t)), then 𝔽_q((t^{1/p})) | v(t)=1,p; tame formula t_k=t_k″,p t_k″; constants 1,p⁻¹ | Frobenius and Q unchanged for pure ramification | Both inverse constants witnessed |
| §2.5 transfer | Stable identity summand; ker N | V=W gives N=N and weight w=w; ker N has weight 0 inside weight-1 S | Complement is essential | Injection alone excluded |
| §3.1 tube construction | V(T), V(ϖT), V(T²), empty and whole Z | At \|ϖ\|=1/3, ε=1/9 radii are 1/9,1/3,1/3; empty radius<1 gives ∅; whole gives full disc | Model and nilpotents change fixed-radius domains | Thickening witness added |
| §3.2 direct images | f=id on disc; n=1 | R⁰=ℤ/n, R^{j>0}=0; for n=1 all groups 0 | Radius 1 works here, not evidence of uniformity generally | Degreewise quantifier retained |
| §3.3 Riemann existence | Kummer degree m=2; characteristic-p Artin–Schreier | Pullback of its torsor by itself splits into 2 sheets; AS break 1 stays wild under prime-to-p Kummer base change, while p-power Kummer is inseparable | Char 0 Kummer statement; char p counterexample | m may be divisible by p in char 0 |
| §3.4 neighbourhood | Disc-origin, n=ℓ; n=p | For invertible n: H⁰ both ℤ/n, H^{>0}=0; for n=p: dim H¹ disc=∞, origin=0 | Invertibility cannot be dropped | Rational shrinking does not cure p-torsion |
| §3.4 blow-up descent/gluing | X=Z; two affine opens | Bl_X X=∅ but Bl_X X⊔X→X is id; Čech complex identity, overlap identity | Centre needed in cover | Made cover explicit |
| §3.4 bounded direct-image amplitude | Principal identity f | R⁰=ℤ/n; all j>0 zero, so b=0 | Correct common-bound quantifier | Bound and radius named |
| §3.4 disc stabilization | Principal identity f, ε′≤ε | H⁰ restriction 1↦1; other groups 0→0 | Actual derived image used | No arbitrary sheaf substitution |
| §3.4 closed-support continuity | Shrinking V(T) tubes | colim H⁰=ℤ/n=H⁰(origin); colim higher groups=0 | Map and coefficient descent required | Point-set equality not used alone |
| §3.5 all-power Galois tube | Whole model; point tube; plane cubic | m=1,2 give ℤ/ℓ,ℤ/ℓ² in H⁰ on both sides; for arbitrary ambient neighbourhood H¹(ℙ²)=0→E²=H¹(cubic) | One radius via coefficient exact sequences | All m explicit |
| §3.6 cup pullback | A=ℚ[h]/h², B=ℚ[k]/k², f(h)=2k | f⁻¹((1+k)²)=f⁻¹(1+2k)=1+h=(1+h/2)²; unit 1↦1 | Inverse multiplicative | Imported Ext identity |
| §4.1 approximation | Ambient ℙ¹; elliptic double cover; point | Dimensions 1=1; degree 2 and Betti H¹ 2 versus 0; point dimension 0 | Approximation gives summand, not isomorphism | Geometric irreducibility retained |
| §4.2 comparison | Identity approximation; elliptic cover | H⁰:1↦1; H² hyperplane trace 1↦2; Φ acts q on both top lines | Unit, direction and top twist agree | Arbitrary open inverse excluded |
| §4.3 top isomorphism | Degree 2, ℓ=2; disconnected target; d=0 | Over ℚ̄₂ scalar 2 invertible; mod 2 scalar 0; two target components give dim2≠1; d=0 scalar1 | Rational, connected, point cases separated | Explicit target top dimension |
| §4.4 splitting | D; same model in 𝔽₃; C₂ top sign; zero source; 𝔽₂ identity | Over ℚ image dim1, annihilator dim2, intersection0; over 𝔽₃ diagonal sum3=0; sign pairing −1=χ·1; zero source gives 0⊕V; 𝔽₂ identity gives V⊕0 | All headline hypotheses discriminated | Nonzero scalar/top character explicit |
| §4.5 stable geometric summand | Elliptic cover of ℙ¹ | H¹ image0, complement E²; H⁰ and H² images full rank1 | No claim of middle-degree surjectivity | Stable complement obtained by cups |
| §4.6 toric theorem | ℙ^n, plane curve, codim0 | ℙ^n H^{2r} eigenvalue q^r weight2r; curve H¹ string weights0,2; c=0 uses identity approximation | Full range and codim0 included | No exceptional p=2,3 or bad-reduction exclusion |
| §4.7 projective/product application | ℙ¹×ℙ¹; Fermat degree e prime to p | H² eigenvalues q,q, H⁴ q²; partials e x_j^{e−1}=0 force all x_j=0 | Correct product and smooth good-model checks | Any-reduction cubic example retained |

Each API fact has a separate witness below; the numeric values specify both the defining law and the alternative it excludes. All parameters retain the standing hypotheses of their README subsection.

| API statement | Instances tried | Computed values on both sides | Result | Change |
|---|---|---|---|---|
| §0.1 bundled datum conditions | T | q=3, ℓ=2, t(1)=1, quotient generator1 | Nonzero datum | All topology conditions retained |
| §0.1 tame conjugation | T, σ=(1,0) | t(ΦσΦ⁻¹)=1/3=3⁻¹·1 | Geometric sign | None |
| §0.1 Frobenius-coset products | Φ=(0,1), Φ′=(2,1) in T | Φ⁻¹Φ′=(6,0)∈I; Φ(1,0)=(1/3,1)∈Fr | Both coset directions | Normality explicit |
| §0.1 identity outside Fr | T | Identity quotient0; Fr quotient1 | 0≠1 | None |
| §0.1 rescaled datum | c=2,T | t′(1)=2, conjugated value2/3=3⁻¹·2 | Nonzero scalar needed | None |
| §0.1 marked isomorphism condition | id:T→2T | t′(id1)=2=2t(1), whereas 2≠1t(1) | Group map alone insufficient | None |
| §0.1 identity isomorphism | id:T→T | t(id1)=1=1·1 | Constant1 | None |
| §0.1 composite isomorphism | Constants2,3 | t″(1)=6=(3·2)·1 | Product6 | None |
| §0.1 inverse isomorphism | Constant2 | (1/2)·2=1 | Inverse constant1/2 | None |
| §0.1 rescaling directions | T↔2T | Forward2, backward1/2; product1 | Both directions | None |
| §0.2 standard data | ℚ₃,ℓ=2 | Residue q=3; t image ℤ₂ | Fits §0.1 | Assembly only |
| §0.2 standard inertia | Unramified quadratic extension | Residue kernel is same I, quotient generator changes1→2 | Inertia unchanged | None |
| §0.2 Kummer ratio | t(σ)=1, levels ℓ^n | σ(ϖ^{1/ℓ^n})/ϖ^{1/ℓ^n}=ζ_{ℓ^n}; coordinate1 | Positive direction | None |
| §0.2 geometric lift characterization | Arithmetic φ and inverse Φ | Arithmetic tame factor3; geometric1/3 | Exactly inverse lift | None |
| §0.2 residue cardinal | Unramified degree3 of ℚ₂ | #κ=2³=8 | Q=8 | None |
| §0.2 finite-extension scaling | e=2, t_k′(σ)=1 | t_k(σ)=2=e·1 | e, not e⁻¹ in character equation | Isomorphism uses e⁻¹ |
| §0.2 tame surjectivity | ℚ₃,ℓ=2 | σ with coordinate1 exists; image closure ℤ₂ | Nonzero/open image | None |
| §0.3 restricted existence | Full H; inertia-only H′ | Full residue index1 and t(1)=1; inertia quotient image0 | Full admissible, inertia not | Conditions written out |
| §0.3 restricted inertia | T, H′ with residue index3 | H′∩I=ℤ₂×{0} | Same inertia carrier | None |
| §0.3 restricted Frobenius | T, H′ residue3ℤ̂ | (0,3)∈H′∩Φ³I; (0,1)∉H′ | Frobenius power3 | None |
| §0.3 restricted Q | q=3,f=3 | Q′=3³=27 | Correct residue power | None |
| §0.3 transitive restriction | Residue indices2 then3 | (3²)³=3⁶=729 | Indices multiply | None |
| §0.3 self restriction | f=1 | Q¹=Q, same t and Fr | Identity restriction | None |
| §0.3 isomorphism and restriction | c=2, f=3 | New character2t in both orders; Q³=27 in both | Constant unchanged | None |
| §0.4 defining conjunction | S and semisimplification | exp(N)=1+N; split exp(0)=1; S grade weights0,2, split same-grade weights0,2 | Monodromy distinguishes them | No coefficient-free placeholder |
| §0.4 monodromy uniqueness | N²=0,t(σ)=1 | log(1+N)=N; log(1)=0 | N cannot be replaced by0 | Compactness retained |
| §0.4 Frobenius-monodromy relation | S,q=3 | ΦNΦ⁻¹e₁=e₀/3=3⁻¹Ne₁ | Correct sign | None |
| §0.4 filtration stability | S,q=3 | Φ(Ee₀)=Ee₀; Φ(E²)=E² | Every grade preserved | None |
| §0.4 one versus every Frobenius | Finite inertia C₂, τ=−1 | (Aτ)²=A², eigenvalues α and −α have same squared value α² | Root-of-unity factor harmless | Positive-power argument stated |
| §0.4 datum rescaling | c=2,S | exp((2t)(N/2))=exp(tN); same kernels/images | Same purity | Inverse scalar on N |
| §0.4 coefficient extension | ℚ₃⊆E, S | Grade ranks1,1 before/after; eigenvalues1,q | Same spectra | Finite field of definition retained |
| §0.4 canonical-purity comparison | S at D_k | Canonical and relative grades weights0,2 and central1 | Predicates agree | Correct canonical owner |
| §0.4 finite inertia | Rank-one sign representation | N=0, Φ eigenvalue−1, complex modulus1=q^0 | Pure weight0 | No semisimplicity requirement |
| §0.4 zero representation | Dimension0 | Empty grade spectra for every j,w | Every weight | None |
| §0.4 transport | t′=2t,N′=N/2 | cN′=2N/2=N | Same grades | None |
| §0.4 direct sums | S⊕S | Grade multiplicities2,2; eigenvalues1,1 and q,q | Same weight1 | None |
| §0.4 restricted detection | S,f=3 | Grade eigenvalues1,q³; baseq³; weights0,2 | Same central1 | Admissibility required |
| §0.4 dual | S dual | Eigenvalues1,q⁻¹; dual grades +1,−1 have weights0,−2 | Central weight−1 | Dual operator−Nᵗ |
| §0.4 tensor | S⊗S | Grade weights0,2,2,4 at indices−2,0,0,2; Jordan lengths3 and1 | Central weight2 | Imported convolution |
| §0.4 Tate twist | S(1),χ(Φ)=q⁻¹ | Eigenvaluesq⁻¹,1; grade weights−2,0 | Weight1−2=−1 | General datum needs specified χ |
| §0.8 conjecture conjunction | Point | Degree0 pure0; all other groups0 | All integer degrees included | No unbound degree |
| §0.8 bounded degrees | ℙ¹ | H⁰=E,H²=E(−1), H^{-1}=H³=0 | Range0–2 | Empty handled separately |
| §0.8 finite extension | ℙ¹,f=3 | H² eigenvalueq³ has baseq³ weight2 | Both predicates true | None |
| §0.8 good model | ℙ¹_O | N=0, special/generic top eigenvalueq | WMC agrees with Weil purity | None |
| §0.8 degree zero | Spec k′ with unramified degree2 | Permutation eigenvalues1,−1, both weight0 | Not assumed geometrically connected | Component action retained |
| §0.8 disjoint union | Two rational points | H⁰=E², spectra{1,1}; union purity equals two weight0 lines | Both directions | None |
| §0.8 rational point | Spec k | H⁰=E,eigenvalue1; rest0 | WMC | None |
| §3.1 tube carrier | V(T),ε=1/9 | Point T=0 in tube; T=1/3 outside | Correct ideal bound | None |
| §3.1 affine-generator formula | Ideal(T),generators(T,2T),K=ℚ₃ | \|2\|=1, so max(\|T\|,\|2T\|)=\|T\| | Same radius1/9 | Integral coefficients needed |
| §3.1 openness | V(T),ε=\|ϖ\|² | Tube is rational domain R(T/ϖ²) | Adic open | Distinguishes usual real topology |
| §3.1 quasicompactness | Same rational disc | One affinoid rational chart covers it | Finite cover size1 | None |
| §3.1 monotonicity | ε′=1/9≤ε=1/3 | T=1/9 in both; T=1/3 only larger | Correct inclusion direction | None |
| §3.1 intersection | V(T); T=ϖ^r≠0 | T fails radius\|ϖ\|^{r+1}; T=0 passes every radius | Intersection exactly zero locus | Higher-rank comparisons via scalar valuations |
| §3.1 cofinality | W=disc radius1/3 | Tube radius1/9⊆W; at T=1/9 both inequalities true | Constructible-neighbourhood direction | None |
| §3.1 inverse images | Map T↦S²,ε=1/9 | \|S²\|≤1/9 iff \|S\|≤1/3 | Both constructions same set | Domain/target given |
| §3.1 base change | K=ℚ₃ to completed algebraic closure | Inequality \|T\|≤1/9 before/after; T=1/3 fails both | Same pulled-back tube | Scalar radius fixed |
| §3.1 automorphism stability | σ fixes K, ideal(T),ε=1/9 | \|σ(T)\|=\|T\|; at T=ϖ² both1/9 | Stable | Isometric field action retained |
| §3.1 proper comparison | ℙ¹_O; affine A¹_O negative control | Proper generic fibre entireℙ¹; affine formal fibre only\|T\|≤1, excludesϖ⁻¹ | Properness necessary | Comparison imported |
| §4.1 approximation data | Ambientℙ¹ identity | k₁=𝔽₃(t), L♭=K♭, k″=𝔽₃((t)), Z′=ℙ¹ | All fields/maps tied to geometry | None |
| §4.1 existence | Ambient and rational point | Identity and point maps have image containment, dimensions1 and0 | Degenerate examples exist | General proof uses alteration |
| §4.1 dimension equality | Elliptic double cover | dim Z′=dim W=dim Y=1 | Generic finiteness not cohomological isomorphism | None |
| §4.1 geometric connectedness | Elliptic curve; disjoint pair of curves | H² dimensions1 and2 | Pair excluded | Alteration constant extension retained |
| §4.1 smooth/projective | y²=x³−x over𝔽₃(t) | On affine equation ∂/∂x=1; projective smooth completion genus1 | Smooth projective source | No singular approximation used directly |
| §4.1 image containment | Ỹ=whole ambient | π⁻¹(Ỹ)=wholeℙ¹, g-image=ℙ¹ | Correct containment direction | General naturality supplied |
| §4.1 generic degree | Elliptic x-map | Function-field degree2, not0; identity degree1 | Positive | Inseparable positive degrees also allowed |
| §4.1 local closure | 𝔽₃(t)⊆K♭ | Closure𝔽₃((t)), normalized v(t)=1 | Local field, contains t | None |
| §4.1 positive top intersection | Same degree2 map, H=O(1) | deg c₁(g*H)=2=2·1>0 | Characteristic-zero cohomological image nonzero | Positivity supplier gap |
| §4.2 comparison construction | Identity approximationℙ¹ | H⁰ map1↦1; top map1↦1 | Correct arrow directions | Inverse restriction specified |
| §4.2 equivariance | Degree2 elliptic map | Φ f*(h)=Φ(2k)=2qk=f*(qh) | Top characters agree | Automorphism supplier contract explicit |
| §4.2 products | ℚ[h]/h²→ℚ[k]/k²,h↦2k | f((1+h)²)=1+4k=f(1+h)² | Multiplicative | No assumed additivity of sharp |
| §4.2 unit | Same graded map | f(1)=1, not2 | Top scalar does not scale unit | None |
| §4.2 reductions | ℓ=2,m=1,2,top degree2 | 2 mod4=2→0 mod2, equal to direct reduction | Commuting coefficient maps | None |
| §4.2 ambient square | Y=ℙ¹, elliptic approximation | Both composites send hyperplane trace1 to2 | Commutes | Uses actual comparison |
| §4.2 rational limit | ℓ=2, compatible degree2 maps | lim(×2 onℤ/2^m)=×2 onℤ₂; rationalization×2 onℚ₂ | Top map becomes invertible | ML/finiteness used |

Additional worked-example and route controls:

| Statement | Instances tried | Computed values on both sides | Result | Change |
|---|---|---|---|---|
| Nonzero denominators in uniqueness and transfer | t(σ)=1; v(t)=p | 1⁻¹=1; p·p⁻¹=1 inℚ_ℓ; q≥2 gives1−q⁻¹≠0 | Every inverse has a witness | No division-by-zero extension |
| First Chern/trace orientation in suppliers and comparison | ℙ¹, hyperplane | Trace(h)=+1; Φh=qh; trace of twisted h is Galois invariant | Same normalization in all uses | Positive orientation retained |
| Nilpotent thickening and reduction | O[T]/T² versus O[T]/T | At ε=1/9 radii1/3 versus1/9; reduced-origin étale cohomology bothℤ/n in degree0 | Tubes depend on model, cohomology ignores nilpotents | Added Check |
| p-power-root torsion negative control | ε=(1,ζ_p,ζ_{p²},…) | ε♯=1; ε^{p^r}≠1 for every finite r, because coordinate r+1 has orderp | Infinite-order kernel element | No false torsion counterexample |
| Tensor powers in curve argument | S⊗S | Tensor N has ranks2,1 for powers1,2 in char0; in char2 square is0 | Characteristic-zero coefficient route | Suppliers' coefficient hypotheses retained |
| Codimension-zero and empty product | Y=ambient; product of0 projective factors | c=0 and g=id; empty productSpec k has H⁰=E | Valid endpoint cases | No empty fan used |
| Fermat connectedness boundary | Binary x₀²+x₁² over k̄, versus n≥2 | Binary smooth locus consists of2 points; higher-dimensional smooth hypersurface connected | Binary curve is not geometric connected datum | Final Fermat Check scoped to n≥2 |
| Inseparable alteration degree | Frobeniusℙ¹→ℙ¹ in charp | Pullback degreep, trace of c₁=p≠0 inℚ̄_ℓ | No separability assumption hidden | Positive degree includes inseparable factor |
| Stable complement without compactness | D with finite G=S₃; arbitrary group representations in theorem | Sum-zero plane invariant under each transposition; dimensions1+2=3 | Stability follows pairing equations, not averaging | No compactness restriction on splitting theorem |

## Elaboration and signature audit

From the supplied content checkout, ran the required `lake env lean` command on `packages/DeligneWeightsAndPurityPartII/Suggested.lean`. It completed with exit status 0. There was exactly **1** warning, and no errors or other diagnostic messages. With the file prefix expressed repository-relatively, the diagnostic was:

```text
packages/DeligneWeightsAndPurityPartII/Suggested.lean:47:8: warning: declaration uses `sorry`
```

No Tau Ceti module is imported by the acceptance statement, so no preliminary targeted module build was needed. No bare build, dependency update, cache download, toolchain change or option override was run.

A separate scratch file containing the acceptance declaration followed by `#check @TauCetiRoadmap.DeligneWeightsAndPurityPartII.duality_splitting` was elaborated once. Its output was compared with README §4.4. It retained six independent carrier universes; Field E and Group G; additive/module and finite-dimensional instances for U,U′,V,V′; both perfect-pairing instances; the nonzero scalar; the complementary-pair compatibility equation; all four representations; both intertwining equations; and the character-equivariance equation. None disappeared. Its conclusion was exactly injectivity of both maps, complementarity of the first image with the second-image annihilator kernel, and stability of both subspaces. No signature correction was required. The only diagnostic there was the same single admitted-declaration warning; the remaining output was the requested elaborated type.

The README's theorem generality equals that signature: arbitrary E and G, arbitrary complementary spaces and a possibly nontrivial character. The geometric source case is obtained by choosing top-line coordinates and applying the statement independently in each cohomological degree. No topology, compactness, algebraic closedness or characteristic-zero binder is silently assumed in that native theorem.

## Mechanical checks and dependency output

- Structure: 30 target subsections; five Layer headings; five Examples and five Dependencies subsections; every design API fact and Check carried into prose.
- Own identifiers: one declaration, two matching README mentions, zero missing declarations. The imported API facts and Checks introduce no private dotted-name claims.
- Lean file: exactly `import Mathlib`; one theorem and one honest `sorry`; no definitions, instances, admitted examples, option overrides or external-roadmap imports.
- Plan: every byte outside the top-level gaps value is identical to the input. Three appended supplier gaps match the README sentences exactly: geometric-galois-restriction, analytic-comparison-automorphisms and ample-top-intersection.
- Sources: seven unique keys; all bibliographic and locator fields present; source service manifest check has zero problems. Uncertified originals are identified as such, with the legal secondary formulations distinguished.
- Citation resolver: no cross-roadmap citation found nowhere; no Lean name found nowhere. The final resolver run used its refreshed main c44faf6 / 354-head index of 2026-10-25T07:26:49Z. It reports that it did not inspect external pinned packages on its own host, so all library names were independently inspected in the supplied pinned checkout, as recorded above; the mathematical supplier inspection uses the supplied content checkout and the indexed new-roadmap heads.
- Paths/style: no machine path, TeX delimiter, unresolved skeleton marker, private API catalogue in Lean or forbidden import is present in the deliverables.

The required dependency command, with the supplied configuration, package README, roadmap name, merge-order file and `--movable`, returned:

```text
depcheck: 49 roadmaps, 567 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No merge-order file was edited. The reported dependency direction is the single supplier-to-consumer direction of the accepted design, with ownership citations updated to the actual suppliers.
