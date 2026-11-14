# Review of OcneanuRigidity (pull request #2316 at 31f02eb)

**Verdict:** needs changes

## R01 (P1) — The deformation dictionary has the opposite gauge sign

**Location:** TauCetiRoadmap/OcneanuRigidity/README.md:393–395: “θ is the coboundary of γ … Here g^{ab}_c = 1 + γ^{ab}_c”.

**Claim:** The displayed differential and the supplier’s gauge action give θ = −δγ, not θ = δγ, for this gauge.

**Witness:** Over ℂ[ε]/(ε²), take C₃, F=1 and normalized γ(1,2)=1, all other values zero. At (1,1,1), δγ=1 but F′/F=1−ε. PresentationsOfMonoidalCategories #2308, README.md:82–85 gives the gauge formula.

**Repair:** Replace the dictionary by “θ = −δγ if and only if Q₂ = (1 + γ) • Q₁”, or use 1 − γ when θ = δγ. Carry the same sign through Layer 7. Add the C₃ calculation as a Check; θ = −δγ holds on all 27 triples.

## R02 (P1) — The acceptance-test module is absent

**Location:** TauCetiRoadmap/OcneanuRigidity/Suggested.lean: missing; README.md:622–624 specifies the Radford headline.

**Claim:** The gate fails and the requested elaboration cannot run. At least the Radford existence headline is statable at the pins.

**Witness:** Gate: missing-files=1 FAIL. Lean returns “no such file or directory”. A scratch theorem ∃ e : 𝟭 C ≅ D ⋙ D, e.hom.IsMonoidal, D = doubleRightDualFunctor C, elaborates with all fusion hypotheses.

**Repair:** Add Suggested.lean in the required form. State the Radford headline using the native double-dual functor and NatTrans.IsMonoidal, with sorry. State every other statable headline; name the missing carriers for the rest in the module docstring. Run the targeted gate and elaboration.

## R03 (P1) — The comonad-resolution supplier does not exist at the pin

**Location:** TauCetiRoadmap/OcneanuRigidity/README.md:145–146: “Comonad.simplicialResolution”, “Comonad.augmentedSimplicialResolution”, “Adjunction.resolutionExtraDegeneracy”.

**Claim:** Layer 3 imports an unprovided construction; its claimed independence does not supply the missing resolution.

**Witness:** All three identifiers have zero occurrences in both pinned libraries. Mathlib/AlgebraicTopology/ExtraDegeneracy.lean:77 defines extra degeneracies on an already supplied augmented simplicial object, not the comonad resolution.

**Repair:** Own the augmented comonad resolution and its free-object extra degeneracy in Layer 3, before the cochain complex: degree n is G^(n+1)X, faces use the counit, degeneracies use comultiplication. State the simplicial identities and augmentation. Cite Mathlib only for the existing extra-degeneracy/homotopy machinery.

## R04 (P1) — Several supplier contracts falsely claim pinned implementations

**Location:** TauCetiRoadmap/OcneanuRigidity/README.md:137–148: “Basis.homDual”, “Center.induction”, “forgetInductionAdjunction”, “ArtinLocalAlg”. Also line 80: “endUnitAlgEquiv”.

**Claim:** These inputs are not provided under those names at the pin; no declared supplier gap covers them.

**Witness:** Pinned searches find none of these names. PivotalSpherical main README.md:640 plans induction; SchemeAndStackFoundations main README.md:6347 owns Artinian coefficient categories; TauCeti/CategoryTheory/Preadditive/Schur.lean:66 provides endAlgEquivOfSimple instead.

**Repair:** Cite PivotalSpherical Layer 11 for the planned absolute induction and adjunction. Cite SchemeAndStackFoundations §4.2 for its Artinian coefficient category, dual numbers and small extensions. Use TauCeti.endAlgEquivOfSimple k (𝟙_ C). Replace the nonexistent homDual import by an explicit split-simple dual-basis contract or a local field-level construction from the supplied decomposition API. Correct the opening library inventory and every affected Needs line; do not describe these planned inputs as pinned code.

## R05 (P1) — The C₂ counts fail in the allowed characteristic

**Location:** TauCetiRoadmap/OcneanuRigidity/README.md:585–587: “exactly two gauge classes” and “the two braidings”.

**Claim:** The standing algebraically closed field hypothesis allows characteristic two, where the asserted cardinalities are false.

**Witness:** Over the algebraic closure of 𝔽₂, x²=1 has the single root 1: −1=1 and i=1. There is one unrestricted C₂ associator class and one braiding; its global dimension is 0, so there are no separable classes.

**Repair:** Prefix these two Checks with “Over an algebraically closed field of characteristic different from two”. Add the characteristic-two values: one unrestricted class, one braiding, zero separable classes. Qualify the opening sentence at line 3 by separability, consistently with the nonconstant characteristic-two lifts at lines 420–423.

## R06 (P2) — Pivot-free dimensions have two roadmap owners

**Location:** TauCetiRoadmap/OcneanuRigidity/README.md:210–220 and 291–293: “Each roadmap proves its own statement, and neither depends on the other.”

**Claim:** The open PivotalSpherical revision already plans the same pivot-free squared norms, global dimension, nonvanishing and absolute averaging; the claimed boundary describes its older scope.

**Witness:** PivotalSpherical #2311, TauCetiRoadmap/PivotalSpherical/README.md:239–248 and 352–355 owns these objects. Both plans give dim(Vec(C₂))=2 and the same absolute averaging composite. The head also says its global dimension needs no pivotal structure.

**Repair:** Give this extension one owner, as a PivotalSpherical Part II roadmap placed before OcneanuRigidity; consolidate the overlapping additions there and import its precise sections here. Keep only the relative-centre extension and its comparison in this folder. Resolve the overlapping additions in #2311 rather than making the same objects twice or silently depending on that revision.

## R07 (P2) — The unitary relative centre cannot acquire a later supplier

**Location:** TauCetiRoadmap/OcneanuRigidity/README.md:70–71: “Its unitary relative centre (CA6) is built on the carrier RelCenter of Layer 2.”

**Claim:** This assigns a new dependency to an existing roadmap that already owns its construction on main.

**Witness:** TauCetiRoadmap/CategoricalOperatorAlgebras/README.md:1266–1280 on main constructs the unitary relative centre directly, including its half-braidings, tensor structure and duality. It does not import RelCenter or OcneanuRigidity.

**Repair:** Replace the boundary by “CategoricalOperatorAlgebras CA6 owns the unitary relative centre; Layer 2 here constructs the nonunitary relative centre and proves the comparison with that unitary category.” Add that comparison as a target depending on CA6. Do not make CA6 depend on this new folder.

## R08 (P2) — Two targets duplicate pinned theorems

**Location:** TauCetiRoadmap/OcneanuRigidity/README.md:177–179 and 205–206: “Duals along monoidal functors” and “Simple objects are self-bidual”.

**Claim:** Both constructions are already supplied at the pin, at least at the stated generality.

**Witness:** TauCeti/CategoryTheory/Monoidal/Rigid/Functor.lean:87 defines Functor.mapExactPairing with precisely these maps. TauCeti/CategoryTheory/Semisimple/Rigid.lean:89 proves nonempty_iso_rightDual_rightDual without any field hypothesis.

**Repair:** Delete these two build targets. Cite CategoryTheory.Functor.mapExactPairing and its evaluation/coevaluation equations, and TauCeti.nonempty_iso_rightDual_rightDual, with these files, in Scope and ownership and Exact supplier contracts. Repoint the consuming dependencies to those declarations.

## R09 (P2) — Squared norm is used outside its simple-object domain

**Location:** TauCetiRoadmap/OcneanuRigidity/README.md:219: “squaredNorm X = leftDim X ≫ rightDim X”; line 240 similarly quantifies over V.

**Claim:** The defined choice-independent squared norm is only for simple objects. The product of bidual traces is not independent of the chosen bidual isomorphism for arbitrary objects.

**Witness:** In Vec over ℂ, X=ℂ²: a=I gives Tr(a)Tr(a⁻¹)=4; a=diag(1,2) gives 3·(3/2)=9/2. Both are bidual isomorphisms, while dim(X)²=4.

**Repair:** Write “For simple X and any pivotal structure, squaredNorm X = leftDim X ≫ rightDim X”. Restrict the representation Check to simple V. Add the two-dimensional computation as a negative control; retain additivity only for the separately defined global dimension.

## R10 (P2) — Monoidality alone does not make the Deligne product fusion

**Location:** TauCetiRoadmap/OcneanuRigidity/README.md:606: “For monoidal C and D … making C ⊠ D fusion.”

**Claim:** The hypotheses on D supply neither rigidity nor a simple tensor unit.

**Witness:** Take C=Vec and D=Vec×Vec with componentwise tensor. D is split finite semisimple and monoidal, but End(𝟙_D)=k×k. C⊠D≃D has two unit summands, so is not fusion.

**Repair:** State two conclusions: monoidal k-linear factors give the displayed monoidal product; fusion factors give a fusion category. Add Vec⊠(Vec×Vec) as the non-fusion Check, with two simple unit summands.

## R11 (P2) — The indecomposability criterion admits the zero category

**Location:** TauCetiRoadmap/OcneanuRigidity/README.md:487–489: “not equivalent to a direct sum of two nonzero module subcategories … the graph on κ … is connected”.

**Claim:** The first condition holds for the zero module category, whereas its empty graph is not connected. It also adds a third category to the two-item Check at lines 495–496.

**Witness:** Take κ=∅. The model is the zero category and cannot split into two nonzero summands. Its graph has 0 vertices and no vertex witnessing nonemptiness; the listed Vec(C₂) and Vec have ranks 2 and 1.

**Repair:** Define an indecomposable module category to be nonzero and not a sum of two nonzero module subcategories. Keep the zero category among the rank-zero semisimple module categories, but exclude it from the indecomposable count. Add this distinction as a Check.

## R12 (P3) — Definitions lack discriminating Checks

**Location:** TauCetiRoadmap/OcneanuRigidity/README.md:252–299 defines relative half-braidings, centres, inductions, their comparison, the comonad and relative projectivity without a Checks list.

**Claim:** The required three discriminating Checks per definition are absent across the construction layers; several later layers offer only two Checks in total.

**Witness:** Layer 2 has 0 Checks. Layer 7 has 2 total for its rules, symbols, model, gauge and indecomposability definitions. Layers 0, 3, 4, 8 and 10 also have no Checks lists.

**Repair:** Add at least three computed Checks to each kept definition, including a wrong-model control. For relative half-braidings over Vec(C₂), use the trivial and sign characters, their product (+1), and the zero intertwiner space between opposite characters; for the deformation dictionary include R01’s sign test. Give each constructed map its source and target and its defining compatibility laws.

## R13 (P3) — Most targets have no exact source locator

**Location:** TauCetiRoadmap/OcneanuRigidity/README.md:405–416 and 555–581 state formal rigidity, finiteness and fields of definition without locators; line 498 cites only “Ostrik”.

**Claim:** A bibliography and occasional theorem numbers do not supply the required per-target locator, version and page. The broader relative setting must also be distinguished from the cited source’s hypotheses.

**Witness:** ENO2005 line 396 (Theorem 2.28, preprint p.9), line 415 (2.31, p.9), line 437 (2.35, p.10), and line 1967 (§9.1, p.43) locate the rigidity/finiteness results and their positive-characteristic qualification.

**Repair:** Add exact versioned theorem/section and page locators at every theorem and API claim. For the listed results use ENO2005 Theorems 2.28/2.31, Remark 2.33, Corollary 2.35 and §9.1, citing arXiv:math/0203060v11 with its pagination. For newly generalized statements, identify the source specialization and explicitly own the additional argument; GHS Theorem 3.11 assumes tensor categories, while Layer 2 permits nonabelian targets. Supply exact locators for the module classification and the individual orbit-proof inputs.

## R14 (P3) — The build lacks target-level dependencies and required structure

**Location:** TauCetiRoadmap/OcneanuRigidity/README.md:160–162: “A layer’s Needs clause names what it uses beyond earlier layers”.

**Claim:** Implicit dependence on all earlier layers conceals which statements and proof routes need which inputs. The required numbered subsections, layer endings and downstream section are absent.

**Witness:** The file has 12 “### Layer” headings, 0 numbered target subsections, 0 “### Examples”, 0 “### Dependencies”, and 0 “## Downstream consumers”. Layer 3 is independent of Layers 0–2, unlike Layer 4.

**Repair:** Use the prescribed Summary, Scope and ownership, Conventions and “## Layer k” structure. Give every target its own numbered mathematical subsection and explicit Needs list; retain Layer 3’s independence. End every layer with Examples and Dependencies and add Downstream consumers. Keep own API names in prose unless the acceptance file actually declares them.

## R15 (P3) — The PR description claims reuse of unavailable APIs

**Location:** scratch/pull-request.md:22, description paragraph beginning “The vanishing follows”: “The route reuses Tau Ceti’s Center.induction, comonad simplicial resolutions, ArtinLocalAlg and group-scheme orbits.”

**Claim:** Three of these claimed pinned inputs are absent, and the paragraph’s ownership claim does not account for the overlapping pivot-free work in #2311.

**Witness:** The pin has group-scheme orbits but no Center.induction, comonad simplicialResolution or ArtinLocalAlg. The head’s README.md:145–148 repeats those unavailable imports. PivotalSpherical #2311 README.md:239–248 also owns pivot-free dimensions.

**Repair:** After repairing the contracts, replace the sentence with “The route consumes the planned absolute induction from PivotalSpherical Layer 11, the Artinian coefficient category from SchemeAndStackFoundations §4.2, and pinned group-scheme orbit APIs; it constructs the comonad resolution.” Describe the settled owner and order for the pivot-free extension, and retain the statement that this adds a new roadmap.

## Verified sound

| Statement | Instance | Computed left side | Computed right side | Result / change |
| --- | --- | --- | --- | --- |
| Scope: semisimplicity, GHS §5 | Sweedler H₄-mod, n=2 | dim H²_DY=1 | semisimplicity hypothesis=false | negative control; GHS line 1674 |
| Native finite-semisimplicity definition | finite-support ℤ-graded vector spaces | every object has a finite simple decomposition | infinitely many simple classes; Fintype absent | Basic.lean:56 has no finite-class axiom |
| Fusion and separability conventions | Vec(C₂), characteristic 2 | 2 simple classes; global dimension 1+1=0 | fusion=true; separable=false | agrees; qualify opening in R05 |
| Right-dual evaluation/coevaluation | Vec, X=k², standard basis | ε(eᵢ*⊗eⱼ)=δᵢⱼ | zigzags eⱼ↦eⱼ | agrees |
| Bidual trace definition | X=k, a=3·id, characteristic 0 | η;(a⊗id);ε=3 | ordinary trace=3 | agrees; no change |
| Simple squared norm definition | X=k, a=3·id | 3·(1/3)=1 | a=id gives 1 | agrees; no change |
| Global dimension definition | Repℂ(S₃) | 1²+1²+2²=6 | group order=6 | agrees; no change |
| Relative half-braiding direction, GHS (3.7),(3.9) | Vec(C₂), unit object with sign character | β(g)=−1; β(g²)=1 | β(g)β(g)=1; β(1)=1 | agrees; no change |
| Tensor powers, arities 0,1,2 | Vec, dimensions 2 and 3 | dimensions 1,2,6 | unit, F, F⊗F: 1,2,6 | agrees; no change |
| DY differential, GHS (3.11) | trivial group, scalar cochains | δ⁰=0; δ¹=id; δ²=0 | successive composites=0 | agrees; no change |
| DY degree-zero differential | Vec(C₂), coefficient characters + and − | δ⁰(1) at g = 1−(−1)=2 | intertwiner condition fails by 2 | agrees; no change |
| Comonad grading convention | G=id, Hom(X,Y)=k | Cⁿ=k for n≥0; augmentation k | faces=id; differentials 0,id,0,… | agrees; no change |
| Artinian lifts and constant lifts | A=k[ε]/ε², residue π | π(1+cε)=1 | constant lift=1; kernel=(ε) | agrees; supplier R04 |
| Tensor-power merge isomorphisms | Vec, dimensions 2,3,4 | (2·3)·4=24 | 2·(3·4)=24 | agrees; no change |
| Tensor-power separate linearity | Vec, dimensions (2+3),4 | (2+3)·4=20 | 2·4+3·4=20 | agrees; no change |
| Transport of exact pairings | F=id, X=k² | transported evaluation δᵢⱼ | native mapExactPairing evaluation δᵢⱼ | duplicate; R08 |
| Restriction of cochains to simple tuples | Vec, Φ=Ψ=tensor² | natural endomorphisms=k | one simple tuple; Hom(k,k)=k | agrees; no change |
| Split/linear hypothesis control | real C₃ rotation simple V | dimℝ End(V)=2 | split scalar End would have dimension 1 | excluded by split hypothesis |
| Mixed cochains and finite dimensionality | C=Vec, M=Vec², identity action | 2 scalar coefficient spaces | k², dimension 2 | agrees; no change |
| LinearEnd tensor order | Vec², Φ=swap; Ψ=(V,W)↦(V,0) | Φ⊗Ψ sends (k,0)↦(0,k) | Ψ⊗Φ sends (k,0)↦(0,0) | order discriminated |
| LinearEnd linear and biproduct API | two copies of identity on Vec | (id⊕id)(k)=k² | pointwise biproduct dimension 2 | agrees; no change |
| Action functor | Vec(C₂) acting regularly | g acts by swap; g² acts by id | swap²=id | agrees; no change |
| Simple self-bidual, ENO Proposition 2.1 | Vec(C₃), simple δ₁ | δ₁**=δ₁ | Nonempty(δ₁≅δ₁)=true | pinned duplicate; R08 |
| Nonzero bidual trace on simples | X=k, a=3·id | trace=3≠0 | unit multiplicity in X⊗X*=1 | agrees; no change |
| Squared norm rescaling | simple k, a=3·id, t=2 | trace(ta)·trace((ta)⁻¹)=6/6=1 | trace(a)·trace(a⁻¹)=3/3=1 | agrees; no change |
| Norm isomorphism/duality invariance | pointed δ_g and δ_g⁻¹ | both squared norms=1 | isomorphic representative also gives 1 | agrees; no change |
| Unit norm and equivalence invariance | Vec(C₃), relabel g↦g⁻¹ | unit norm=1; global dimension=3 | relabelled unit norm=1; dimension=3 | agrees; no change |
| Pivotal comparison | Vec(C₃), character χ(g)=ζ₃ | leftDim(g)·rightDim(g)=ζ₃⁻¹ζ₃=1 | simple squared norm=1 | agrees; no change |
| Pivotal comparison outside domain | Vec, X=ℂ², a=diag(1,2) | trace product=9/2 | leftDim(X)rightDim(X)=4 | missing simplicity; R09 |
| Skeletal norm formula | Fibonacci, sτ=φ⁻¹ | sτ⁻²=φ² | normGlobalDim=1+φ²=(5+√5)/2 | agrees; no change |
| Galois-conjugate skeletal formula | Yang–Lee, sτ=−φ | sτ⁻²=φ⁻² | normGlobalDim=(5−√5)/2>0 | agrees; no change |
| Pointed twisted norm Check | C₂, F(1,1,1)=−1 over ℂ | two traces −1,−1; norm=1 | global dimension=2 | agrees; no change |
| Representation norm Check | simple standard Repℂ(S₃) | dim=2; squared norm=4 | 1+1+4=6 | simple qualifier R09 |
| RelCenter carrier and morphisms, GHS Definitions 3.1–3.2 | Vec(C₂), (unit,+),(unit,−) | intertwiner equation f=−f gives f=0 | Hom between distinct centre simples=0 | agrees; no change |
| RelCenter monoidal and linear API | unit degree with sign character | (−1)⊗(−1)=+1 | tensor unit has character +1 | agrees; no change |
| Forgetfulness and idEquiv | Z(Vec(C₂)) over ℂ | 4 simple centre objects; Hom scalars inject | absolute centre also has 4 simples | agrees; ownership R07 |
| RelCenter.map | forget Vec(C₂)→Vec | central characters remain ±1 | relative centre has 2 character simples | agrees; no change |
| Right induction and left coinduction | C=Vec(C₂), F=forget, V=k | underlying dimensions 2 and 2 | one summand per group element | agrees; no change |
| Induction commutes with F | C=Vec(C₂), V=unit | dim F(I_C(V))=2 | dim I_F(F(V))=2 | agrees; no change |
| Pinned adjunction units/counits | C=Vec, F=id | unit summand inclusion=id | unit summand projection=id | composite=1 |
| Comparison θ independence | pointed simple, a=3·id | mate factor 3; trace factor 1/3 | θ=1, also for a=id | agrees; no change |
| Averaging, EGNO Lemma 9.3.1/proof 9.3.2 specialization | Repℂ(S₃), Z=unit | summands 1,1,4; composite=6 | normGlobalDim·id=6 | agrees; no change |
| Relative projectivity, GHS Definition 2.4 | Vec(Q₈), characteristic 3 | averaging=8=2; section factor=2 | 2·2=1 | agrees; no change |
| Projectivity negative control | Vec(C₂), characteristic 2 | averaging=0; 0 has no inverse | required section composite=1 | separability excludes instance |
| Central comonad | C=Vec, F=id | forget;coinduction=id | counit and comultiplication=id | agrees; no change |
| Cochain complex functoriality | G=id, X=Y=k, scalar map 2 | precomposition multiplies cochains by 2 | 2δ=δ2 | agrees; no change |
| Extra codegeneracy/free objects | G=id, X=k | augmented complex … k→k has alternating 1,0 | contracting identity gives dh+hd=1 | agrees; no change |
| Comonad vanishing, GHS Proposition 2.12; BarrBeck §4.3 | G=id, X=Y=k | H⁰=k; H¹=H²=0 | Hom(X,Y)=k; positive-degree target=0 | agrees; no change |
| Resolution supply | G=id as required simplest input | named pinned resolution declarations=0 | claimed supplied declarations=3 | unowned prerequisite; R03 |
| DY complex: δ²=0 | trivial group, scalar f | δ¹δ⁰f=0; δ²δ¹f=0 | zero maps=0 | agrees; no change |
| DY coefficient/functor transport | Vec, identity equivalences | cochains k mapped by identity | δ transported to same alternating differential | agrees; no change |
| Low degrees, GHS Remark 3.7 | Vec(C₃), characteristic 3, θ(g)=1 | δθ(g,g)=1−2+1=0 | θ(g³)=3=0 | agrees; no change |
| Inner derivations for nonsimple target unit | regular C₂ action on Vec²; f=(1,0) | at swap, δ⁰f has diagonal entries 1,−1 up to component order | inner derivation is nonzero | rank-one target-unit condition matters |
| DY/comonad comparison, GHS Theorem 3.11 and §3.4 | Vec(C₂), trivial coefficients | DY dimensions 1,2,4 in degrees 0,1,2 | comonad Hom dimensions 1,2,4 | agrees; no change |
| Comparison target generality | D=finite free modules over k[ε]/ε² | finite biproducts=true; abelian=false | GHS tensor-category assumption abelian=true | extension needs explicit attribution; R13 |
| Cohomological rigidity headline | Vec(S₃), characteristic 0, n=1,2 | group cohomology dimensions 0,0 | claimed DY dimensions 0,0 | agrees; no change |
| Identity, tensor-functor and module-action specializations | Vec, F=id; M=Vec² | H¹_DY=0 in each case | claimed positive-degree vanishing=0 | agrees; no change |
| Centre-coefficient specialization | Vec(C₂), coefficients same sign simple | H¹(C₂,ℂ)=0 | claimed H¹_DY=0 | agrees; no change |
| Sharpness, EGNO Example 7.22.5 | Vec(C_p), characteristic p=2 or 3 | H¹=Hom(C_p,k)=k; dimension 1 | global dimension=p=0 | agrees; no change |
| Group-cohomology Check in both regimes | C₂ over ℂ / algebraic closure of 𝔽₂ | Hⁿ=0 / k for every n>0 | order invertible / zero | agrees; no change |
| Degree-zero Check | separable Vec(C₂), trivial coefficients | H⁰=k | End(unit)=k | agrees; no change |
| F perturbation dictionary | C₃, γ(1,2)=1, A=ℂ[ε]/ε² | θ(1,1,1)=−1 | δγ(1,1,1)=1 | sign failure; R01 |
| F perturbation cocycle identity | same C₃ example, all quadruples | δθ=−δ²γ=0 on 81 quadruples | linearized pentagon residual=0 | agrees; no change |
| Gauge normalization | all gauge entries c=2 | G_L/G_R=4/4=1 | division by c gives normalized gauge 1 | agrees; no change |
| R infinitesimal dictionary | C₂, F=1, R=1+bε over ℂ | R²=1+2bε; b=0 | degree-one cocycle is zero | agrees; no change |
| F formal rigidity headline | C₂, A=ℂ[ε]/ε², F=1+cε | pentagon requires 2c=0, hence c=0 | constant lift F=1 | agrees; no change |
| Characteristic-two deformation Check | C₂, A=k[ε]/ε², char k=2 | 2c=0 for every c; gauge fixes c | one inequivalent lift for each c∈k | valid negative control |
| R formal rigidity headline | C₂, R=±1+bε over ℂ | R²=1±2bε; b=0 | R equals its constant lift | agrees; no change |
| Power-series rigidity headline | C₂, R∈ℂ[[t]], R≡1 | (R−1)(R+1)=0; R+1 unit | R=1 | agrees; no change |
| ModuleRules unit law | regular C₂ module | M_unit=I₂ | identity action multiplicities I₂ | agrees; no change |
| ModuleSymbols inverses, pentagon, triangle | strict C₂ regular action | every nonempty associator block=(1) | inverse, pentagon, triangle values=1 | agrees; no change |
| Module reindex/map/ext | regular C₂, swap labels; ℤ→𝔽₃ | 0↦0, 1↦1; M↦M | same unit and associator matrices | agrees; no change |
| Module model and action headline | regular C₂, X=δ_g; Y=δ_m | X⊙Y=δ_(g+m) | iterated action g⊙(h⊙m)=(g+h)⊙m | agrees; no change |
| Module extraction/reconstruction/round trip | regular C₂, normalized bases | Nm_am^n=[a+m=n]; M=1 | reconstructed and extracted data identical | agrees; no change |
| Module gauge action | Vec acting on Vec, h_unit=c | M′=c·1·c⁻²=c⁻¹ | triangle requires M′=1, hence c=1 | agrees; no change |
| Module gauge classification | Vec acting on Vec² | one normalized trivial action up to relabeling | one module equivalence class at rank 2 | agrees; no change |
| Module adjunction/transposes | regular C₃, M_g permutation matrix | M_(g⁻¹)=M_gᵀ | Nm_(−g)m^n=Nm_gn^m | agrees; no change |
| Nonabelian module multiplication convention | regular S₃, a=(12), b=(23) | M_bM_a sends row m to abm | M_ab has the same nonzero column | agrees; no change |
| Module formal rigidity headline | Vec acting on Vec, rank 1 | triangle forces M=1 over every A | constant lift=1 | general dictionary sign R01 |
| Module multiplicity and support bounds | regular C₂, K=2 | MΣ=[[1,1],[1,1]]; MΣ²=2MΣ | entries≤2; row support 2≤4 | agrees; no change |
| Rank-one module bound | Vec(C₂) acting on Vec | MΣ=[2]; MΣ²=[4] | K MΣ=[4]; rank 1≤4 | agrees; no change |
| Finite rules and indecomposable rank | regular C₃, K=3 | rank=3; multiplicities 0 or 1 | rank≤9; finitely many arrays bounded by 3 | agrees; no change |
| Indecomposability zero case | zero module category, κ=∅ | cannot split into two nonzero parts=true | connected empty graph=false | add nonzero condition; R11 |
| Pointed module Checks | Vec(C₂) over ℂ | H=1: coset rank 2; H=C₂: rank 1 | H²(H,ℂˣ)=0 in both cases | agrees; no change |
| Coordinate-ring representability | C₂ normalized F-symbols | coordinate ring ℤ[x,x⁻¹]/(x²−1) | maps to R correspond to x²=1 | agrees; no change |
| Gauge representability | one nonunit multiplicity-one block | GL₁(A)=Aˣ | coordinate maps ℤ[t,t⁻¹]→A choose a unit | agrees; no change |
| Braiding coordinate ring | C₂, F=1 | K[r,r⁻¹]/(r²−1) | R-points choose roots r²=1 | agrees; no change |
| Module coordinate ring | Vec, rank-one module | triangle fixes M=1; ring K | one module-symbol point | agrees; no change |
| Fusion/separable principal open | C₂ over characteristic 2 | s₁=1 unit; global dimension=2=0 | fusion locus nonempty; separable locus empty | agrees; no change |
| Finite-orbits headline | G=G_a translating X=A¹_K | any lift a+u translated by u | 1 orbit; 1 irreducible component | agrees; no change |
| Finite-orbits nilpotent control | trivial G; X=Spec K[ε]/ε² | ε↦ε gives nonconstant Artin lift | no translating group element | hypothesis fails as required |
| Orbit kernel/local completion step | translation on A¹ at 0 | orbit comorphism K[x]→K[t], x↦t; kernel 0 | intersection of maximal-ideal powers=0 | agrees; no change |
| Orbit closure/component step | translation on A¹ | closure of orbit=A¹ | unique irreducible component=A¹ | agrees; no change |
| Constructibility/dense-interior step | translation on A¹ | orbit=A¹; interior=A¹ | any two point-orbits intersect=A¹ | agrees; no change |
| Isolated-points corollary | H=K; O=K×K | 2 constant points; no nonconstant local lifts | 2 orbits/components | agrees; no change |
| Subfield-points theorem | F=algebraic closure of ℚ in ℂ; X=A¹ | D(x−π) contains F-point 0 | 0−π≠0 | agrees; no change |
| Fusion finiteness headline | C₂ over ℂ | F(1,1,1)=±1: 2 classes | finite representative list has length 2 | agrees; no change |
| Braiding finiteness headline | C₂ over ℂ, fixed F=1 | R=±1: 2 braidings | Finite(BraidedCategory C) | agrees; no change |
| Braided fusion finiteness headline | C₂ over ℂ | (F,R)=(1,±1),(−1,±i): 4 classes | finite=4 | agrees; no change |
| Fixed-rank module finiteness headline | Vec over ℂ, rank r=0,1,2 | Vec^r: 1 class for each r | finite cardinal=1 | agrees; no change |
| Indecomposable module finiteness headline | Vec(C₂) over ℂ | ranks 1 and 2: 2 nonzero classes | bound r≤4 | nonzero qualifier R11 |
| Fields-of-definition headline: categories | C₂ semion over ℂ | F=−1 lies in algebraic closure of ℚ | base change F↦−1 | agrees; no change |
| Fields-of-definition headline: braidings | same semion | R=i lies in algebraic closure of ℚ | base change R↦i | agrees; no change |
| Fields-of-definition headline: modules | untwisted C₂, coset module | all action symbols=1∈ℚ | base change leaves symbols 1 | agrees; no change |
| C₂ counting Check in characteristic two | K=algebraic closure of 𝔽₂ | 1 unrestricted class; 0 separable classes | asserted class count=2 | false; R05 |
| Fibonacci counting Check | over ℂ | sτ=φ⁻¹ or −φ: 2 inequivalent norms | two gauge classes | agrees; no change |
| Deligne-product carrier and simples | C=D=Vec(C₂) | simple pairs=4; Hom distinct pairs=0 | sum-completed tensor category rank=2·2=4 | agrees; no change |
| Deligne universal property | C=D=Vec, target Vec | bilinear tensor functor sends (k,k) to k | linear extension sends generator to k | agrees; no change |
| Deligne fusion claim | C=Vec; D=Vec×Vec | End(unit)=k×k; 2 unit summands | fusion requires simple unit | false; R10 |
| Enveloping action and canonical algebra | C=Vec(C₃), simples g,h | (g,h)⊙unit=gh; Hom(gh,unit)=[gh=1] | A=Σ_s(s,s⁻¹) has the same Hom multiplicity | agrees; no change |
| Canonical algebra multiplication | Vec(C₂) | e_g e_h=e_(gh); e_1 unit | associativity (gh)l=g(hl) | agrees; no change |
| Hopf bimodule equivalence, EGNO Proposition 7.18.5 | C=Vec, A=k | right A-modules are vector spaces | V↦V⊗k≅V | agrees; no change |
| ρ tensoriality, EGNO (7.55),(7.57) | Vec, V=k², W=k³ | both composites identify a 6-dimensional vector space | both maps are identity on basis pairs | agrees; no change |
| Unimodularity, EGNO (7.66), Remark 6.5.9 | Vec, A=k | A*=k; module isomorphisms are kˣ | Aut(unit)=kˣ | agrees; no change |
| Radford headline, EGNO Theorem 7.19.1/Corollary 7.19.3 | Vec(C₃), standard duals | fourth dual acts identically; radford=1 | identity functor component=1 | statable; R02 |
| Radford inverse/dual convention | standard Vec | δ=1; (δ⁻¹)**=1 | radford component=1 | agrees; no change |
| Radford characterization, EGNO 7.21.7; ENO2004 7.3 | simple k, a=3·id | Tr(a)·radford=3 | Tr(a⁻¹)*·a·a**=(1/3)·9=3 | agrees; no change |
| Pivotal discrepancy automorphism, EGNO Remark 7.19.4 | Vec(C₃), pivotal character ζ₃ | j²/radford=ζ₃² on generator | (ζ₃²)³=1: monoidal character | agrees; no change |
| Pivotalization object and morphism laws | Vec, char≠2, simple unit | f²=1 gives f=±1; opposite-sign Hom=0 | two simple lifts, distinct | agrees; no change |
| Pivotalization tensor/duals | Vec, sign objects | (−1)⊗(−1)=1; (−1)⁻¹=−1 | tensor sign product; same dual sign | agrees; no change |
| Forgetful norm preservation | Vec(C₂), each lift of a simple | norm upstairs=1 | norm downstairs=1 | agrees; no change |
| Fusion and spherical pivotalization | Vec(C₂), characteristic 3 | 4 simple lifts; left/right dimensions ±1 | left dimension=right dimension | agrees; no change |
| Pivotalization characteristic-two control | Vec, f=I+N, N²=0≠N | f²=I; nonsemisimple C₂-representation | fusion assertion excludes characteristic 2 | agrees; no change |
| Positivity headline, ENO Theorem 2.3 | Fibonacci and Yang–Lee embeddings | squared norms φ²≈2.618 and φ⁻²≈0.382 | both >0; global dimensions >1 | agrees; no change |
| Characteristic-zero rigidity package | C₂ over ℂ | Hⁿ>0=0; F classes=2; braidings/class=2 | separability follows from global dimension 2 | agrees; no change |
| Spherical/Radford Check | Vec(C₂), spherical sign pivotal structure | j²=1 | radford=1 | agrees; no change |
| Pivotalization dimension Check | Vec(C₂), char≠2 | 4 unit-norm simples: dimension 4 | 2·dim(Vec(C₂))=2·2=4 | agrees; no change |
| Missing headline/test file | Radford with full fusion binders | scratch signature elaborates; declarations in submitted file=0 | acceptance test requires a statement | R02 |
| Missing supplier declarations | five claimed API families | pinned matches for named missing APIs=0 | contract claims availability | R03–R04 |
| Ownership: pivot-free dimension | PivotalSpherical #2311 / this folder | both define sum of squared norms; C₂ gives 2 | both claim ownership | R06 |
| Ownership: unitary relative centre | CategoricalOperatorAlgebras main / this folder | CA6 construction already owned on main | new text makes CA6 consume later RelCenter | R07 |
| Definition Checks and build shape | Layer 2; all layers | 0 Checks; 0 target-numbered subsections | ≥3 Checks/definition; explicit target dependencies | R12, R14 |
| Locators and PR inventory | Layers 6/9; PR reuse sentence | headline locators absent; 3 claimed pinned families absent | exact locators and truthful inventory required | R13, R15 |

- Sources: 10 works fetched legally; 32 explicit locator occurrences audited in EGNO, GHS, ENO2005 and ENO2004, plus BarrBeck §4.3 and Ostrik Proposition 1; no worker-selected target IDs were supplied.
- Source anchors: EGNO lines 7523, 8635, 8824, 8991, 9193, 14051; GHS lines 254, 371, 493, 526, 589, 695, 744, 1674; ENO2005 lines 157, 182, 396, 1967; ENO2004 line 479.
- Pins: 11 selected declaration/definition anchors opened: TauCeti/CategoryTheory/Semisimple/Basic.lean:56, :177; TauCeti/CategoryTheory/Semisimple/Rigid.lean:89; TauCeti/CategoryTheory/Monoidal/Rigid/Functor.lean:87; TauCeti/CategoryTheory/Monoidal/Rigid/DualFunctor.lean:325; TauCeti/CategoryTheory/Preadditive/Schur.lean:66; TauCeti/CategoryTheory/Monoidal/Pivotal/Character.lean:239; TauCeti/CategoryTheory/Monoidal/Center/Abelian.lean:62; TauCeti/AlgebraicGeometry/GroupAction/LocallyClosed.lean:55; TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Coordinate/HopfAlgebra.lean:452; Mathlib/AlgebraicTopology/ExtraDegeneracy.lean:77.
- Ownership: 4 named roadmap suppliers/boundaries resolved against main or the supplied open head; PivotalSpherical #2311 compared separately, and SchemeAndStackFoundations §4.2 located as the Artinian supplier; package-object search found no additional tensor-category owner.
- Dependency check output: `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`; 12 Needs lines inspected; 0 UPWARD or CYCLE lines.
- Gate: `gate OcneanuRigidity: missing-files=1 FAIL`; direct elaboration fails because Suggested.lean is absent; 0 submitted declarations permit binder or one-tactic probes.
- Headline probe: Radford existence elaborates with only a sorry warning; `#check @radfordStatable` retains every explicit fusion hypothesis; pinned self-bidual theorem checked mechanically; 0 changes made to the pull request.
- Change/text audit: new folder, 697 insertions, 0 removed headings/declarations, 0 changes outside the folder; title matches addition; 1 false reuse paragraph identified.

Overlap check: read PresentationsOfMonoidalCategories #2308, PivotalSpherical main and #2311, CategoricalOperatorAlgebras main, TemperleyLieb main; F/R symbols and gauges belong to PresentationsOfMonoidalCategories; pivotal/fusion infrastructure and absolute induction to PivotalSpherical; unitary relative centres to CategoricalOperatorAlgebras; diagrammatic Temperley–Lieb constructions to TemperleyLieb. Pivot-free dimension/averaging ownership conflicts are R06; the proposed reversal of CA6 supply is R07. No second OcneanuRigidity folder on main, dropped cited ID, or other open change to this folder was found.

Source independence: 37 passages compared with 6 sources; no unforced shared wording or reused tables/figures found. EGNO has the largest share, 17 of 32 explicit body locators. Its contents (EGNO lines 95–240) do not match the roadmap’s layers one-to-one: the norm → averaging → cohomology → rigidity → orbit argument follows the stated mathematical dependencies; Deligne/Hopf bimodules → Radford → pivotalization likewise follows the constructions.

## Not verifiable

- The worker supplies no identities for its seeded 15-target sample (“none found by heading”); coverage above uses the whole README and all explicit locators instead.
- Published pagination/version correspondence for GHS and ENO2004 was not established; the inspected texts are arXiv:1910.06094v2 and math/0404504v1. ENO2005 was checked as math/0203060v11; EGNO is the author’s final 2015 version.
- EGNO 9.3.1–9.3.2 treats the absolute centre, and GHS 3.11 assumes tensor-category targets; neither is a source certificate for the full nonrigid-target averaging assertion. The table’s explicit instances do not prove that extension.

## Source issues

- none

## For the human reviewers

- none
