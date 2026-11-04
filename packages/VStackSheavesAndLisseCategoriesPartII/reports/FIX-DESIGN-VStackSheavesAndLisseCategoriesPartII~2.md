# Repair findings

Changes concern `packages/VStackSheavesAndLisseCategoriesPartII/design/README.md`, `packages/VStackSheavesAndLisseCategoriesPartII/design/plan.json` and `packages/VStackSheavesAndLisseCategoriesPartII/sources.toml`. All fourteen findings are addressed individually below. No Lean file was created or edited; this is the design stage.

## F01 (P1) — not actionable in this package: the general machinery requires an extension of its supplier

Unowned narrative → four explicit EnhancedDerivedSheaves §E3.4 supplier gaps, separately naming operation data, partial adjoints, restricted-nerve gluing and DESCENT. VS7.4 and VS7.5 consume them in both representations; VS7.5 step 3 names the DESCENT gap. These are requested extensions, not invented supplier targets. Changing the supplier’s scope requires a maintainer decision outside this package.

Evidence: EnhancedDerivedSheaves §E3.4 states ringed diagrams and coherent mates, not general enhanced operations. LiuZhengEnhanced line 3906 gives partial adjoints as Proposition 2.2.4 in v4, not Proposition 1.4.4; lines 5220–5224 give DESCENT. LiuZhengGluing lines 2057–2075 give Theorem 5.4, and line 145 gives Corollary 0.4. GHW22 line 1421 identifies its Theorem 4.9 as the relevant specialization. Both papers are recorded under unique manifest keys.

## F02 (P1) — applied

The unused representability gap and its purported VS6 consumer → deleted. VS6.11 and Conventions retain the established proper nice domain; Corrections to the sources explicitly excludes a claim for arbitrary proper fine maps. Coverage metadata no longer asks for that extra theorem. No prerequisite or neededBy reference to the deleted gap remains.

Evidence: GHW22 Theorem 1.4, pp. 3–4; Sch17 Definitions 10.7 and 18.1; HKW22 Theorem 4.1.8, p. 24. The distinction between proper and proper nice remains explicit.

## F03 (P1) — applied

The point’s supposedly noninvertible dualizing object → the invertible Haar line; distributions belong to its base change. Both the README Check and plan test now distinguish invertibility from universal compatibility with base change. Over F_ℓ, the germs of δ₀ and Haar at 0 are independent.

Evidence: FS21 lines 4198–4201 explicitly put distributions on G → ∗; HKW22 Example 4.2.2, p. 26, identifies q^!Λ with Haar. On a small coset avoiding 0, δ₀ is 0 and Haar is a nonzero p-power inverse; at a neighbourhood of 0, δ₀ is 1. Thus their germs cannot be proportional.

## F04 (P2) — applied differently

The reversed squares and coevaluation triangles → f e ⇒ e′ f and q f ⇒ f′ q, with counit toward coev_X′. The evaluation triangle uses f^{!∨} ⊗ f, as required by the stated evaluation domain X^∨ ⊗ X. VS10.1 likewise uses the dual of the right adjoint. Empty-correspondence Checks were added in both sections.

Evidence: LZ22 lines 217–255, Construction 1.7, equations (1.3)–(1.4). The suggested evaluation factor f ⊗ f^{!∨} would still be ill-typed under this roadmap’s orientation; symmetry changes its order. For C = ∅, the 2-cell is ∅ → X and both traces are 0.

## F05 (P2) — applied

Local ownership of ordinary trace identities → PivotalSpherical Layers 2 and 7; projective traces → AdicSpacesPartIII §R3.8. VS9.1–VS9.3 retain only the bicategorical extension. Six duplicated ordinary-trace bullets/Checks were deleted; VS9.4 uses the projective trace. The restructure entry and coverage now describe only the bicategorical prefix.

Evidence: PivotalSpherical Layer 2 (traces, cyclicity, monoidality) and Layer 7 (symmetric trace and linear comparison); AdicSpacesPartIII §R3.8, projective-module-trace and projective-trace-realization. At Mathlib 6b7abb3, `Mathlib/LinearAlgebra/Trace.lean:75` defines the trace to be 0 when no finite basis exists. For P = 3(Z/6), the projective identity trace is the idempotent 3.

## F06 (P2) — applied

EnhancedDerivedSheaves’ nonexistent perfect = compact = dualizable contract → DGAInfinity Layer 5 for compact = perfect, and an explicit proof here of the dualizability equivalence. VS9.4 uses tensor preservation of coproducts and termwise finite-projective evaluation. Scope, supplier contracts and prerequisites agree.

Evidence: HKW22 lines 3545–3576, especially 3570–3575; Stacks07LT lines 9463–9466. EnhancedDerivedSheaves’ spectra comparison supplies a category equivalence, not this dualizability theorem. Q[0] over Z has non-finitely-generated H⁰, so is not perfect and hence neither compact nor dualizable.

## F07 (P2) — not actionable in this package: the general coefficient scheme interface belongs to its supplier

Fictitious EDC.8 references → §§6.1–6.3, including §6.2’s CohCorr.pullbackAlong and CohCorr.restrictOpen. The general n-torsion, f-ULA statements remain, conditional on gap:VS-PII/G-scheme-local-terms. The finite-ring bounded constructible finite-Tor instance is distinguished explicitly. Extending the supplier’s coefficient and complex ranges cannot be completed by editing this package.

Evidence: EtaleDualityAndPerverseSheaves §6.2 imposes the coefficient and D^b_ctf restrictions; §6.3 repeats them. Its adic alternatives are outside this roadmap’s torsion convention. F_ℓ[t] is killed by ℓ but is infinite, so requires the gap rather than the existing finite-ring interface. HKW22 Proposition 5.3.2, pp. 49–50, is the general comparison target retained here.

## F08 (P3) — applied

Unresolved supplier slugs → verified numbered sections throughout the contracts, Needs clauses, proof routes and plan prerequisites. The stale library baseline → Mathlib 6b7abb3 and Tau Ceti a91d3aa. IsSmoothDiscrete now cites SmoothDiscrete/Basic.lean. The nonexistent étale-smooth Check citation was deleted, and declaration line evidence was refreshed from the pins.

Pinned files were read directly from their GitHub commit URLs, not from a newer checkout. Their paths are recorded in the baseline. Supplier sections were read through roadmaps show; all 78 distinct external prerequisite references were checked against the corresponding supplier text. The final citation resolver reports no unresolved roadmap citations or names.

## F09 (P3) — applied

Repeated constructions → imported parent VS4 derived invariants and smooth dual, SR.0d.2 admissibility, SR.1.1 HaarMeasureWithValues, and native Module.IsReflexive. VS8.5 retains the module/rank/modulus adapter. VS9.5 states the finite-generation equivalence with native predicates; the residue-field and projective cases cite pinned instances. Relevant consumer edges and prose were updated.

Evidence: parent VS4/classifying-stack-equivalence explicitly includes structural pushforward and internal dual. At Mathlib 6b7abb3, Dual/Defs.lean:212 defines IsReflexive; Dual/Lemmas.lean:262 and :284 provide the stated instances. The VS11.1 coevaluation route also replaces the false direct-factor description of the diagonal with compact induction from ΔG and (G×G)/ΔG ≅ G; this works for nonabelian G.

## F10 (P3) — applied differently

2z → az with a nonzero and unequal to 1; torsion-free sign coefficients → F_3; ambiguous modulus → μ(Eg), scalar p. The supplier’s inverse modulus convention is explicit. The fibre Check now computes End in F(X), and VS6.3 selects a clean chart. Unsupported individual analytic local-term values were replaced by their proven sum, 2.

The pattern repair reaches the layer examples, plan tests and VS11.13: its affine-group witness uses a nonzero topologically nilpotent ϖ, so also works in equal characteristic. Its fixed polynomial, rather than an unowned scalar-local-term assertion, detects failure of étaleness. FS21 lines 4104–4114 require the separated chart. SR.2.2 uses μ(Eg⁻¹)/μ(E), whose inverse is the Haar action chosen here.

## F11 (P3) — applied

The overloaded meaning of proper → explicit proper nice hypotheses in VS9.6 and VS10.1–VS10.6, including their APIs and Checks. VS10.6 requires both bases decent, matching the supplied CoCorr base-change construction. The induced inertia map’s proof factors through a closed immersion and a base change of p, rather than calling the whole map a base change.

Evidence: HKW22 Theorem 4.3.8, Corollary 4.3.9 and Proposition 5.3.1; the representability limitation is still recorded under Corrections to the sources. No assertion of Rf_! = Rf_* for arbitrary proper fine maps has been introduced.

## F12 (P3) — applied

A nonexistent elaborated file and planned API padding → an acceptance-file docstring specification with no declarations. It names all four end theorems and both deep intermediate theorems as unstatable, specifying the absent geometric, enhanced and bicategorical carriers. The stale pins and trace/smooth-vector/reflexivity declaration plans are gone.

No Suggested.lean is among the editable design deliverables. Therefore no elaboration or #check binder comparison can be performed here; none is claimed. The pinned native Bicategory and DerivedCategory definitions do not supply symmetric monoidal bicategories, D_ét, or small v-stacks.

## F13 (P3) — applied

Catalogue labels, named Check bullets and process residue → mathematical prose with the existing hypotheses, API facts, source locators and Checks retained. Gaps now occur under Exact supplier contracts. The neighbouring-roadmap discussion is folded into Scope and ownership. The future-owner proposals and unsupported claims of a suggested declaration have been deleted.

This is a presentation change across VS6–VS11, not a layer reorganization. Backticked supplier/library declarations remain; local API names no longer purport to be declarations in a missing acceptance file.

## F14 (P3) — applied

Absent manifest → eight unique certified entries: the five original works, the two Liu–Zheng papers, and Stacks Tag 07LT newly cited for F06. Locators and cited_for fields identify their uses. HKW22 records both DOI and arXiv with the published pagination distinguished; the partial-adjoint locator uses the fetched Liu–Zheng v4 numbering.

All texts were fetched through the source service from legal repositories or the publisher’s open article. There are no missing or uncertified references. Source extracts remain outside the repository.

## Validation and boundaries

The dependency command specified in the brief completed with exit status 0. Its final output is:

    candidate: VStackSheavesAndLisseCategoriesPartII is not in the merge order yet; checked as if placed after VStackSheavesAndLisseCategories (the intake inserts it when its design is accepted)
    depcheck: 53 roadmaps, 593 edges, 0 problem(s)

There is no UPWARD or CYCLE line. No merge-order edit is required. No gate failures were supplied in the brief.

The citation resolver reports:

    Cross-roadmap citations found nowhere: None.
    Lean names found nowhere: None.
    Lean names outside TauCetiRoadmap were not checked: no pinned Lake packages on this host.

The last limitation was handled by reading the baseline files at the exact GitHub pins. Both pinned repository trees were also inspected: geometric v-stack/diamond and CoCorr modules are absent; the matches for “diamond” are instance-diamond tests and modular-form diamond operators. No native geometric acceptance carrier was found. The structural checks returned `JSON: 65 targets, 5 gaps; TOML: 8 sources` and `Statement/proof/API/Check discrepancies: []`. The eight manifest keys are unique. `git diff --check` completed with exit status 0 and no output. All fourteen finding headings are present; their change summaries are each at most 60 words. No machine paths occur in the deliverables. No Lean command was run, no file was committed, and only the authorized design files, source manifest and this report were edited.

Ownership searches used roadmaps grep and show against main and the available open heads, and searches of board packages by objects: enhanced operation maps, partial adjoints, restricted nerves, cohomological correspondences, decent stacks, Haar measures, trace distributions and projective traces. PivotalSpherical and DGAInfinity on main were read as form/ownership examples, with AdicSpacesPartIII as a third example. The relevant supplier heads were read individually. The broad open-head search includes the named siblings available to the roadmap service; no separately supplied sibling checkout paths were present in the brief. The bicategorical prefix remains here because neither the ordinary-trace owner nor the scheme-specific correspondence owner states that extension. No supplier target has been invented.

Maintainer action remains necessary for the four EnhancedDerivedSheaves gaps and the EtaleDualityAndPerverseSheaves gap. No external Lean declaration was renamed. The deleted gap VS-PII/G-lsep-representability has no consumers; VS-PII/G-liu-zheng is replaced by four explicit prerequisite gaps. Local node identifiers VS6–VS11 remain stable. Any consumer planning ordinary categorical traces must use PivotalSpherical and AdicSpacesPartIII; this package owns the bicategorical extension only.

## Adversarial mathematics pass

Rows below evaluate the conventions and each of the 65 target statements, including their API laws in the displayed model. Unchanged mathematics is retained; numerical witnesses are small mathematical computations, not executable acceptance declarations. Tests depending on a supplier gap check the target’s consistency, not the existence of the supplier theorem.

| Statement | Instances tried | Computed values on both sides | Result and change |
|---|---|---|---|
| Coefficients and geometric base | p = 2, Λ = F_3; p = 5, Λ = Z/6; Λ = Z[1/2] | 3Λ = 0; 6Λ = 0; no nonzero n kills Z[1/2] | Sign Check now satisfies torsion hypothesis |
| Duality orientation and symmetry | Λ in degrees 0 and 1 | coev has degree 0; symmetry on degree-1 factors is −1; tr(id on Λ⊕Λ[1]) = 1−1 = 0 | Retained; reversed triangles corrected |
| Correspondence leg convention | graph (g,id), and identity point | c₁^*A → c₂^!A is g^*A → A; at point it is A → A | Retained |
| Haar action and inverse supplied modulus | affine group, p = 2, Λ = F_5 | μ(Eg)/μ(E) = 2; supplied δ_SR(g) = 1/2 = 3; 3⁻¹ = 2 | Inverse convention now explicit |
| Proper versus proper nice | id_S; nontrivial BG → S | diagonal of id is id; diagonal fibre of BG → S is G, not an injection | Overloading deleted |
| Universes and empty inputs | finite T, T = ∅, small coproducts | finite products remain small; C_c(∅,Λ) = 0; all empty-support traces = 0 | No large-category stand-in introduced |
| VS6.1 representability | identity; open immersion; B(S₃) → S | test fibre is T; an open of T; B(S₃) has automorphism group S₃ ≠ 1 | Retained |
| VS6.2 decency and clean charts | S; point of BZ_p | identity chart; q^!Λ = Λ but base-changed dualizing stalk has independent δ₀ and μ | False point-dual explanation corrected |
| VS6.3 decent implies Artin | finite BG and a clean chart | S×_BG S = G, a finite locally spatial diamond; separated diagonal fibres are points or ∅ | Clean chart required before FS remark |
| VS6.4 fibre products | S×_S S; B1×_BG B1, finite G | S; G, with |G| points | Retained |
| VS6.5 geometric examples | geometric point; Spd Z_p | identity chart has fibre S; smooth auxiliary chart has fibre Spd F_p((t^(1/p^∞))) | Retained; decency does not assert diamondness |
| VS6.6 fine maps | id; [S/GL_n(Z_p)] → S, n = 1,2 | chart top dimensions 0; 1 and 4 | Retained |
| VS6.7 permanence | finite sets of sizes 2 → 1 and 3 → 1 | fibre product has 6 points; each relative dimension is 0 | Composition, base change and cancellation agree |
| VS6.8 smooth fine maps | open inclusion; point of BZ_p | open dualizing object Λ; q^!Λ = Λ but base change gives a stalk of dimension ≥2 over F_ℓ | Invertibility alone excluded |
| VS6.9 classifying stacks | G = 1, H = Z/2 over Q_p; G = S₃ | trivial hom gives one trivial torsor, while unramified quadratic torsor is nontrivial; S×_BS₃ S has 6 points | Torsor formulation retained |
| VS6.10 2-morphism adjunction | finite G, elements g,h | (gh)m = g(hm); mates carry the identity unit to itself | Retained, including noncommuting g,h |
| VS6.11 proper nice maps | id; P¹_C; BG for G ≠ 1 | identity trace is identity; P¹ dimension = 1; BG structure map fails 0-truncation | Unused representability gap deleted |
| VS7.1 prespatial diamonds | finite point set; countable disjoint union | finite set qc with spatial core itself; countable union is locally prespatial but not qc | Retained |
| VS7.2 amplitude bounds | point; proper curve | point bound 3·0 = 0; curve bound 3·1 = 3, actual top degree 2 | Retained; bound is not claimed sharp |
| VS7.3 weak compactification | finite proper map; qc open immersion | f_! = f_* = finite direct sum; j_! stalk outside open = 0 | Retained |
| VS7.4 enhanced operations | point; T = Z_p projection | point value D(Λ); profinite projection dualizing stalk contains δ₀,μ so rank ≥2 | Smooth codescent hypothesis retained; three operation gaps explicit |
| VS7.5 exceptional functors | id; finite G of invertible order | id_! = id^! = id; Haar-normalised coinvariants equal invariants | DESCENT gap is now a prerequisite |
| VS7.6 six-functor identities | finite map with two points | f_!(A⊗f^*B) = (A₁⊕A₂)⊗B = (A₁⊗B)⊕(A₂⊗B); cartesian fibre size stays 2 | Projection, adjunction and base-change directions agree |
| VS7.7 proper comparison | identity; closed immersion | f_! = f_*; outside image both stalks = 0 | Proper nice restriction explicit |
| VS7.8 intrinsic smoothness | q : S → BZ_p | q^!F_ℓ = F_ℓ; base-changed stalk has dimension ≥2 | Universal base-change condition excludes q |
| VS7.9 dualizing complex and integration | id; P¹_C | K_S = Λ, integral 1↦1; K_P¹ = Λ(1)[2], integral of H² generator = 1 | Twist and degree retained |
| VS7.10 invertible twists | f = id, I = Λ; I = Λ[1] | A⊗Λ = A; A⊗Λ[1] = A[1] on both sides | Retained |
| VS7.11 diagonal dualizing | smooth curve; BG structure map | K_f = Λ(1)[2], K_Δ = Λ(−1)[−2], product Λ; Haar*⊗Haar = Λ | Inverse twist retained |
| VS8.1 smooth and complete modules | T = ∅, finite T, N; M = Λ^N | 0; all finite modules unchanged; smooth part Λ^(N), completion Λ^N | Constant sequence 1 excluded from finite-support part |
| VS8.2 sheaf/module equivalence | T of three points; T = ∅ | sections Λ³, each singleton projector selects one coordinate; empty sections 0 | Retained |
| VS8.3 distributions | three points; ∅; Z_p over F_ℓ | Dist = Λ³; 0; Haar on p^nZ_p is p^(−n), Dirac at 0 gives 1 | Retained |
| VS8.4 constant-diamond operations | finite T with 3 points | f^*M = M³, f_! and f_* = sum of 3 components, f^!M = M³ | Retained; ∅ gives zero functors |
| VS8.5 Haar module adapter | Z/3; Z_p over F_ℓ and F_p; affine group | counting volume 3; μ(p^nZ_p)=p^(−n); F_p Haar=0 by subdivision; right scale p | Supplied carrier reused; coefficient-valued modulus requires invertible pro-order |
| VS8.6 decent classifying stacks | G = 1; Z_p | point; smooth GL_1 quotient chart, with q-fibre Z_p | Retained |
| VS8.7 point operations | finite G of order 2; Z_p | q_!Λ = Λ²; q^!Λ = Λ for finite counting line; Z_p q_*Λ = C(Z_p,Λ), q^!Λ = Haar = Λ | Consistent with corrected VS6.2 |
| VS8.8 induction/restriction | H = G; H = 1 in finite G | identity functors; induced module Λ^G of rank |G|, adjoint evaluated at 1 gives M | Retained |
| VS8.9 classifying structure map | G = 1; Z_p with p invertible | all operations identity; higher smooth invariants vanish, f^!Λ = Haar* = Λ | Parent owns invariants; Haar twist retained |
| VS8.10 quotient locally profinite sets | T = point; G = 1 | invariant Haar*-valued functionals; Hom(C_c(T,Λ),Λ) = Λ | Retained |
| VS9.1 bicategorical trace | two-point diamond, transposition; CoCorr point complex | identity fixed locus has 2 points, transposition fixed locus ∅; tr(Λ⊕Λ[1]) = 0 | Ordinary trace duplication deleted |
| VS9.2 trace functoriality | empty correspondence on P¹; f = id | ∅ → P¹ exists, P¹ → ∅ does not; tr(0)=0; identity square induces identity | Directions and typed triangles repaired |
| VS9.3 Grothendieck construction | terminal B; vector L of dimension 2 | fibre F(*); End(L)=Mat₂(Λ), rank 4 | Opposite-enrichment claim deleted |
| VS9.4 perfect and dualizable | Λ^0, Λ², Λ⊕Λ[1]; P = 3(Z/6); Q[0] | traces 0,2,0; projective trace 3 versus library trace 0; Q not finite over Z | Correct trace and ownership |
| VS9.5 truncated-DVR reflexivity | k=1, M=κ²; k=2, M=Z/ℓ⊕Z/ℓ²; M=F₂^(N) | double-dual dimensions 2 and length 3; infinite direct sum has countable dimension, its double dual has strictly larger dimension | Native predicate reused; k≥1 retained |
| VS9.6 Corr_S | id; BS₃ | inertia S; inertia [S₃//S₃] with centralizers of orders 6,2,3 | Proper nice 2-morphisms explicit |
| VS9.7 CoCorr_S | S, A=Λ²; two point objects tensor | endomorphisms Mat₂(Λ), rank 4; Λ²⊗Λ³ has rank 6 | Tensor target and unit retained |
| VS9.8 dualizability criterion | S, A=Λ^r for r=0,1,2 | A*⊗A and End(A) have ranks 0,1,4; evaluation contracts the same matrix entries | Retained |
| VS9.9 dualizable iff ULA | point Λ²; extension by zero across boundary | point comparison is Mat₂(Λ)≅Mat₂(Λ); boundary stalk changes Λ→0 | Finite point passes, jumping sheaf fails |
| VS9.10 fixed-point trace class | point matrix [[a,b],[c,d]]; finite-set transposition | evaluation gives a+d; transposition fixed class has empty support, integral 0 | Retained |
| VS9.11 characteristic class | point Λ³⊕Λ[1]; B(Z/2) | cc = 3−1 = 2; inertia has two conjugacy components | Trace equals identity class |
| VS9.12 open restriction | U=X; U=∅ | class unchanged; restriction 0 in zero section group | Retained |
| VS10.1 relative LV | P¹, C=∅, target point; identity pushforward | tr(0 on RΓ)=0=empty integral; identity pushforward leaves class unchanged | Correct square and triangles |
| VS10.2 proper pushforward cc | P¹→S; p=id | integral cc = χ(P¹)=2; id_*cc=cc | Proper nice and inertia factorization explicit |
| VS10.3 proper trace formula | g(z)=az, a≠0,1; characteristic 2; nonproper disc T↦T+p in characteristic 0 | fixed equations (a−1)z=0 and (a⁻¹−1)w=0; trace 1+1=2, also 0 in F₂; disc Fix=∅ but trace 1 | Characteristic-independent witness; only sum asserted |
| VS10.4 local terms | point Λ^r; ∅; identity P¹ | r;0; whole-component integral 2 | Proper nice domain explicit |
| VS10.5 CoCorr base change | identity; algebraically closed C⊂C′ | point coefficients Λ² pull back to Λ²; trace 2↦2 | Both bases decent |
| VS10.6 base-change local terms | point Λ³; identity base change | 3 maps to 3 in coefficient ring; loc∅=0 maps to 0 | T decency made explicit |
| VS10.7 diamondification | perfect affine line x↦x+1; square-zero thickening | fixed equation 1=0 has no solutions; perfection kills ε with ε²=0 | General scheme input uses gap; finite limits preserved |
| VS10.8 perfect-scheme local terms | Spec k with Λ=F_ℓ[t], F=Λ[0] | both identity traces 1; Λ infinite, so existing finite-ring contract does not apply | Generality preserved through supplier gap |
| VS11.1 admissibility | G=1, Λ²; regular C_c(G,Λ) for noncompact G; S₃ diagonal | invariants Λ² perfect; K-invariants have infinite coset basis; (S₃×S₃)/ΔS₃ has 6 cosets | Imported predicate; diagonal is a homogeneous-space calculation |
| VS11.2 inertia BG | G=1, Z/2, S₃ | one component; two components; three conjugacy components with centralizers 6,2,3 | Nonabelian check retained |
| VS11.3 trace distribution | sign of Z/2 over F_3; trivial Z_p | values at singleton 1 and σ are 1 and −1=2; Haar-normalized constant function integrates to 1 | Torsion convention repaired |
| VS11.4 cc equals trace distribution | finite G sign representation | both functions take 1 at identity and −1 at σ | Retained |
| VS11.5 modified Künneth | U=T=S, f_i=id; BZ_p base | κ is id on Λ⊗Λ=Λ; both sides have the same rank-one Haar* tensor twist | Inverse-diagonal normalization consistent |
| VS11.6 smooth base trivialization | T=S; T=B(finite G) | cc_S(Λ)=1; inertia class of trivial representation is 1 on every component | Trivialization is nonzero |
| VS11.7 based correspondences | common base S, B=Λ; coefficient ranks 2,3 | based product coefficient Λ²⊗Λ³ has rank 6; B⁻¹=Λ | Retained |
| VS11.8 based coherence | all bases S, scalar maps 2,3 over F_5 | composite/tensor scalar 6=1 on each side; reassociation of ranks 2·3·4=24 | Coherence remains a target here |
| VS11.9 cc Künneth | base S; Λ²⊕Λ[1] and Λ³ | χ=1 and 3; tensor χ=3=(2−1)·3 | Retained |
| VS11.10 quotient inertia | G=Z/2 swapping {a,b}; trivial action | swapping fixes pairs (a,1),(b,1), no σ-pairs; trivial action gives X×[G//G] | Retained |
| VS11.11 universal local term | same finite action, Λ coefficient | values 1 at (a,1),(b,1), support empty over σ; identity fibre integral 2 | Retained |
| VS11.12 quotient cc comparison | X=S; trivial rank-2 sheaf | both classes are the character constantly 2; trivialization sends 1↦1 | Retained |
| VS11.13 étale fixed locus | affine group a near 1, b≠0 | w(bw+a−1)=0: two simple roots for a≠1, double root w=0 at a=1 | Nonzero ϖ handles equal characteristic; isolated alone fails |
| Enhanced-operation supplier gap | terminal indexing category | value D(Λ), identity transition id; empty coproduct value zero category | Required coherence is not supplied by these values alone |
| Partial-adjoint supplier gap | identity edge; free/forgetful module adjunction | id has adjoint id; Hom(Λ,M)≅M; the identity mixed square has identity mate | Edge and mixed-square hypotheses stated |
| Restricted-nerve supplier gap | all classes identities; two composable identities | both restricted nerves are terminal, comparison id | General factorization/truncation theorem remains required |
| DESCENT supplier gap | identity atlas; two disjoint copies covering a point | identity limit D(Λ); compatible pair on Čech nerve descends to one D(Λ) object | General extension theorem remains required |
| General scheme-trace supplier gap | Λ=F_3 versus F_3[t], point object | both identity traces 1; coefficient sets have 3 versus infinitely many elements | Existing supplier covers only the former |
