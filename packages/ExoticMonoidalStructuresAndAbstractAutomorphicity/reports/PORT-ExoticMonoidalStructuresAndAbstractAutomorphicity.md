# Port report: ExoticMonoidalStructuresAndAbstractAutomorphicity

Branch: `roadmap/exotic-monoidal-structures-and-abstract-automorphicity`.
Head commit: `aa1db545828c8706d79a2005e21c0466cda6efc0`.
Base: `c994070`; the initial worktree was clean.

The commit contains exactly `TauCetiRoadmap/ExoticMonoidalStructuresAndAbstractAutomorphicity/README.md`, `TauCetiRoadmap/ExoticMonoidalStructuresAndAbstractAutomorphicity/Suggested.lean` and `TauCetiRoadmap/ExoticMonoidalStructuresAndAbstractAutomorphicity/metadata.toml`. The topic remains `math.NT`. No top-level list, dependency pin, supplier folder or merge-order file was edited. No push or GitHub write was performed.

## Validation

Exact build outcome line:

```text
Build completed successfully (8954 jobs).
```

Built `TauCetiRoadmap.ExoticMonoidalStructuresAndAbstractAutomorphicity.Suggested`. Warning count: **0** (including 0 sorry warnings). The acceptance module has no theorem declarations because none of the roadmap's actual headline constructions can be stated at the pins without heavy missing carriers. It imports Mathlib once and lists each headline group and its missing objects in its module docstring.

Gate summary:

```text
gate ExoticMonoidalStructuresAndAbstractAutomorphicity: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The initial pre-commit run passed every content check and failed only `dirty=1` for the untracked new folder. The summary above is the final clean-tree run.

Exact dependency-check output:

```text
depcheck: 192 roadmaps, 1189 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Citation resolution finds no unresolved cross-roadmap citation and no unresolved name. The resolver additionally reports that its own pinned-library search is unavailable; I checked the declarations directly in this worktree's Lake packages instead of treating that message as a successful library check.

## Draft pull request body

Build the GL₂ triality kernel and its Kirillov spectral comparison into an exotic symmetric monoidal category of smooth complex representations. Globalize it over odd-characteristic function fields to construct the compact theta automorphic algebra and its fully faithful module category, then prove the cuspidal/Eisenstein decomposition, classical irreducible comparison and finite-length automorphic restriction. The development also includes spin spherical convolution, categorical trace, and normalization-aware induction and intertwining, with the general smooth and Fourier infrastructure consumed through exact supplier contracts.

The README retains all 58 target sections, their hypotheses, source locators, APIs, discriminating Checks and examples across twelve layers. Suggested.lean documents the headline construction carriers absent at the pins; it carries no supporting-theorem padding. Sixteen accepted conditional supplier extensions remain explicit.

AI assistance: Codex (GPT-6) performed this port and self-audit.

## Direct supplier roadmaps still in pull requests

- SmoothRepresentationsOfLocalGroups.
- AutomorphicLFunctionsAndLocalFactors.
- MetaplecticAutomorphicForms.
- FunctionFieldArithmetic.
- GL2AutomorphicRepresentationsAndTransfer.
- AutomorphicFormsOnReductiveGroups.

AlgebraicVectorBundles and EnhancedDerivedSheaves are consumed as they stand on main; open revisions of those existing roadmaps are not dependencies. RestrictedProducts is consumed from Completed/RestrictedProducts on main.

## Retained scope and acceptance decisions

The accepted review has no blocking finding and conditions acceptance on sixteen specified extensions. I retained those ownership decisions and all sixteen contracts, including the separate odd equal-characteristic classification and all-generic Kirillov contracts. None is represented as already implemented, and none is replaced by a characteristic-zero or compact-Kirillov shortcut. Local scope still includes characteristic-zero dyadic fields; global scope is every smooth proper geometrically connected function-field curve over its full finite field of odd characteristic.

The port preserves twelve layers, 58 numbered target sections, twelve Examples sections and twelve Dependencies sections. Every numbered target has at least three Check bullets. All definitions and their APIs remain in the README. No general library target was narrowed to its worked example.

## Changes from the Lean acceptance file

Moved the supporting structure `UnitFreeTensor` and theorem `idempotent_defect_eq_id` out of Suggested.lean. README §5.1 already contained their complete tensor functor laws, natural associator, pentagon, exact defect equation, both intertwining equations, invertibility, proof route, examples and negative controls; these remain there without claiming Lean counterparts. The Mathlib supplier paragraph now points to that section instead of claiming a Lean declaration. No mathematical assertion was discarded. This also preserves the accepted review's decision that the abstract supporting coherence theorem is not a replacement for an exotic headline.

Before deletion I compared both supplied elaborated signatures against §5.1: `UnitFreeTensor` retains C and its category instance; `idempotent_defect_eq_id` retains C, its category instance, T, P, θ, a, and all three equations. There was no dropped binder or lost hypothesis. After the edit I mechanically enumerated final declarations after comment removal: **zero**. Thus the final list of `#check @name` commands for owned declarations is empty; elaborating the final module in the prescribed build checks that empty list. No signature is silently weakened and no sorry'd data is introduced.

## Mathematical and editorial fixes

1. Applied accepted F01 after verifying rational discreteness: the global Layer 6 example now uses disjoint compact open neighbourhoods with exactly two rational intersections. The ambient function is `2·1U₁+3·1U₂`, with theta values 5 before and after transpose. A nonzero locally constant function supported on just two adelic points would not exist.
2. Applied accepted F02: §1.3 cites equation (2.2) at Dor23 line 358 and Remark 2.21 at Dor23 line 854; §2.5 cites Dor23 line 1178, Dor23 line 1199 and Dor23 line 1258; §6.1 cites Dor23 line 1991, Dor23 line 2025 and Dor23 line 2039. I read the cached legal source at every replacement.
3. Applied accepted F03: “large-degree convolution repair” is now “large-degree convolution argument” in §11.5.
4. Corrected §6.4's antisymmetric negative control. Summing over the full transpose-stable rational locus gives `(1−2)+(2−1)=0` before and after transpose, rather than −1 and 1. Its disagreement with the required value 3 still excludes that wrong model.
5. Corrected §11.4's anomalous example to induce the one-dimensional trivial torus representation, called trivT, rather than the tensor unit called 1T in §10.1. Dor21 line 324 and Dor21 line 331 distinguish these objects. The quotient by the unique trivial G-subobject has zero automorphic restriction and zero cuspidal projector.
6. Replaced the overbroad claim that smooth carriers are absent at the pins with the actual native smooth discrete dictionary. Its coefficient-continuity requirement is explicit: arbitrary smooth complex modules use discrete complex coefficients in this dictionary, separately from the usual complex topology for integration. A nonzero discrete line over usual topological ℂ fails that scalar-continuity field.
7. Added the direct determinant polarization locator Dor23 line 491, the finite-support Hom locator Dor23 line 1360, moved the degeneracy-free theorem anchor to Dor23 line 1318, and sharpened the ambient-module anchors to Dor23 line 2395, Dor23 line 2400 and Dor23 line 2402. Corrected the pinned SymmetricCategory declaration locator to line 365.
8. Removed the reference to a sources.toml beside the final README: the source IDs, versions, legal links and theorem/page/line locators are all retained in References, while the requested target folder contains just its three authorized files.
9. Clarified that characteristic-two perfectness of the determinant polarization does not justify dividing it by two. The existing 𝔽₂ and dual-number Checks still establish the full commutative-ring scope.

No other mathematical fix resulted from the full content reread and finite probes. The source-omitted spin counit/transport calculations remain explicit targets in §§9.2–9.4; no proof is falsely attributed to the source.

## Supplier and citation audit

The library revisions checked are Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`, equal to lake-manifest.json. Native declarations were opened at those pins:

| Declaration | Repository-relative file and line | Contract and limit |
| --- | --- | --- |
| Matrix.det_fin_two | Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:809 | CommRing 2×2 determinant expansion |
| Matrix.trace | Mathlib/LinearAlgebra/Matrix/Trace.lean:43 | Native diagonal sum |
| Matrix.trace_transpose | Mathlib/LinearAlgebra/Matrix/Trace.lean:71 | Transpose invariance of trace |
| Matrix.trace_mul_comm | Mathlib/LinearAlgebra/Matrix/Trace.lean:156 | Cyclic trace under the displayed additive/commutative multiplication assumptions |
| Rep.coinvariantsTensor | Mathlib/RepresentationTheory/Coinvariants.lean:410 | Actual body postcomposes curried tensor with algebraic coinvariants; no smooth residual action |
| CategoryTheory.SymmetricCategory | Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean:365 | Extends braided data over an existing monoidal category, including associator |
| CategoryTheory.CommMon | Mathlib/CategoryTheory/Monoidal/CommMon_.lean:26 | Carrier X with MonObj and IsCommMonObj, not a constructed exotic algebra |
| CategoryTheory.Mod | Mathlib/CategoryTheory/Monoidal/Mod.lean:227 | Carrier X with ModObj for an existing monoid and monoidal action |
| TauCeti.IsSmoothDiscrete | TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:256 | Fields discreteTopology and stabilizer_isOpen; no local compactness or compact-support assertion |
| TauCeti.SmoothDiscreteTopRep | Same repository-relative file:601 | Native full subcategory of TopRep |
| TauCeti.DiscreteRep | Same repository-relative file:615 | Bundles discrete topology and continuous actions of both G and the coefficient ring |
| TauCeti.discreteRepEquivSmoothTopRep | Same repository-relative file:816 | Equivalence for topological groups; does not supply balanced kernels, exotic multiplication or automorphic I |
| TauCeti.D4Tripled.trialityAutomorphism | TauCeti/Algebra/Lie/D4/Tripled/Triality.lean:142 | Automorphism of the type-D₄ group scheme, a different triality |

No TauCeti import is retained merely to list these objects: none is used by a final Lean declaration. The README adopts the native vocabulary without importing unused modules.

Each consumed roadmap section was checked against main or the indexed head of its new-roadmap addition. The key resolutions are:

| Roadmap | Sections actually read and consumed |
| --- | --- |
| SmoothRepresentationsOfLocalGroups | SR.0.1–SR.0.4; SR.0d.1–SR.0d.2; SR.1.1–SR.1.3; SR.2.1–SR.2.3; SR.3a.1, jacquet-subrepresentation and admissibility-of-irreducibles; SR.3.2; SR.4.1; SR.5.1, mirabolic-derivatives and derivative-exactness; SR.5.2, segment-representations. Exactness and adjunctions are unnormalized; scalar Schur includes countable-at-infinity groups. |
| AutomorphicLFunctionsAndLocalFactors | AL.0 compact-open Fourier carriers; AL.1 scalar module theory; AL.2 Godement–Jacquet; AL.3 Whittaker/function-field factors and Curve additive analysis; Representation prerequisites, Restricted tensor realizations. Ordinary multiplicity one there is explicitly number-field scoped, so its function-field extension remains a conditional contract. |
| MetaplecticAutomorphicForms | 0.15–0.18; 1.1,1.3–1.4; 2.4b–2.7; 4.1,4.1a,4.2–4.4. Scalar normalizer/intertwiner extension is distinguished from double cover; 4.1a supplies the function-field finite-dimensional Poisson adapter. Its rational lifts preserve theta. |
| FunctionFieldArithmetic | 0.1–0.3; 2.1–2.3; 4.8–4.10; 5.8; 6.1–6.4. Degree sign, self-dual measure, arithmetic Frobenius, admissible Chebotarev degree and central-lattice conventions are retained. S(Γ\\G) itself is formed here from SR.1.1 on the supplied quotient. |
| GL2AutomorphicRepresentationsAndTransfer | R16.2.1 and R16.2.8. Their characteristic-zero classification/supercuspidal boundaries are explicit; neither is reported as the odd equal-characteristic or all-generic extension. |
| AutomorphicFormsOnReductiveGroups | 3.4, Restricted tensor products and finite corners, including nonzero references, finite stages, rescaling and finite-index equivalence. The new triality action and its coherence are owned here. |
| AlgebraicVectorBundles | L0B–L0C on main, with the L0A tensor infrastructure those sections consume: actual line bundles, duals and tensor functoriality. |
| EnhancedDerivedSheaves | E5:presentability.2 on main, specifically Tensor products of presentable categories and module base change. Its ∞-categorical tensor is distinguished from the separate ordinary linear extension. |
| RestrictedProducts | Completed/RestrictedProducts, Scope and ownership, Layers 1–2, The three equivalences, and Change of family and double cosets on main. Generic coordinate/reference transports are consumed without rebuilding them. |

The three main-branch model reads used to compare presentation were TauCetiRoadmap/FinancialMathematics/README.md, TauCetiRoadmap/RepresentationTheory/README.md and TauCetiRoadmap/OperatorTheory/README.md; category-theoretic, vector-bundle and completed restricted-product models were also consulted. The port follows the more detailed layer/API/Checks shape required by the job rather than thinning its accepted package.

## Ownership, replacements and duplication sweep

I used the prescribed roadmaps list/grep/show tools across main and the indexed open heads, then object-based searches in the pinned source trees, readable board packages and supplied sibling checkouts. Searches covered the matrix determinant polarization, triple GL₂ oscillator/triality kernel, Whittaker and Kirillov carriers, smooth balanced tensor and Tor, firm modules and Bernstein enrichment, spherical SL₂(O) induction, idempotent coherence, Eilenberg–Watts, rational theta characteristics, theta algebras and normalization modules. No final declaration shares a fully qualified name with another roadmap, because the final acceptance file declares none.

The searches distinguish several false matches: LieHighestWeight's trace/determinant polarization concerns the 27-dimensional Albert algebra, PerfectoidSpaces P0.4 concerns an almost-ring basic setup, SheafTheoreticSmithTheory §4.5 concerns exotic coherent/parity sheaves, QSeriesPartitionsAndMockModularForms §6.1 concerns unary theta characteristics, and the pinned D₄ triality is algebraic group-scheme triality. None supplies the GL₂ constructions here.

Supplier replacements and scope exclusions are recorded in README Scope and ownership. General induction, Jacquet, Whittaker, Bernstein, Fourier, scalar metaplectic and restricted tensor theories remain with their named suppliers. No new duplicate target was found to delete from the accepted README. The only Lean removals are the two supporting declarations moved to README §5.1, not claims that a supplier already proves them. The idempotent defect theorem, smooth regular-bimodule coevaluation, and spin transport calculations stay owned here because the searched categorical, monoidal and analytic roadmaps do not state these particular conclusions. No later roadmap supplies an input and no ownership moved against the merge order.

Ownership against indexed open roadmap pull requests **was checked**, including their README and Lean files through the prescribed tooling; revisions of existing roadmaps were not substituted for main. The unread remote-only board-package branches named in the provided board index were not fetched or checked. No absence claim is made about those unavailable branches.

## Sources and remaining conditions

Read the legal cached numbered extractions for Dor23, Dor21, GH11 and Dor20Z at the package's specified versions. The source anchors for all target sections were opened; the proof steps used for the Tor residual-action argument, scalar normalization module, idempotent pentagon cancellation, restricted reference compatibility and degree-uniform Weyl lifting were checked in their actual source settings. Dor23 line 491 supports the local matrix pairing; its commutative-ring extension follows directly from the displayed determinant expansion and unimodular Gram matrix, including the zero ring, dual numbers and characteristic 2.

Dor23 line 2544 and Dor23 line 2555 omit detailed spin counit and transport calculations; the README expressly owns those calculations. Dor21 line 2460 does not justify a prime in a negative-degree ray class; §11.3 instead uses the explicit four-term convolution identity and large positive auxiliary degree. Dor20Z line 1060 supplies the nonarchimedean scalar freeness result; no archimedean generalization is inferred from it.

Arm67 remains an uncertified/paywalled locator, with its attribution checked at Dor23 line 2512. Its original proof was not read. The sixteen named supplier extensions remain conditions of the accepted package, not work completed by this port. They are enumerated with probes below; implementing them belongs to their accepted supplier owners. There is no unresolved local file, build, gate, missing-name or dependency-order defect.

No suspicious fetched instruction was acted on. Source prose and other roadmaps were treated as evidence; their operational suggestions were not executed as instructions. No credential was read or printed.


## Adversarial mathematics pass

These are finite and structural probes of the statements, not proofs of the proposed deep theorems. I recomputed the values below, rather than treating an earlier review verdict as evidence. The matrix polarization was additionally tested on all 256 ordered matrix pairs over 𝔽₂ and all 6561 pairs over 𝔽₃, with zero discrepancies; its integral Gram determinant is 1. The finite negative Fourier transform was computed over C₃, with square δ₁↦δ₂. All 58 numbered targets are covered. Separate rows distinguish definitions, identities and conventions where they have different counterexamples.

| Statement | Instances tried | Values on the two sides or positive/negative models | Result | Change |
| --- | --- | --- | --- | --- |
| Local context L | 𝔽₃((t)), ℚ₂; characteristic 2 | q=3 and q=2 are positive; −1≠1 in both fields, but −1=1 in characteristic 2 | Retain dyadic characteristic zero and exclude characteristic 2 | None |
| Schwartz support convention | Empty set; a singleton in nondiscrete F | Empty indicator=0; any locally constant function supported on one nonopen point has value 0 | Point distributions cannot be functions | Global two-point example uses neighbourhoods |
| Haar and averaging normalization | C₂ permutes (2,4) | Normalized average=(3,3); unnormalized sum=(6,6); average of (1,1)=(1,1) | Both coefficient divisions take place in ℂ | None |
| Conductor convention | Coefficient-of-t⁻¹ character over 𝔽₃((t)) | e(t⁻¹)=ζ≠1, e(1)=1, e(t⁻²)=1; ν=0 although t⁻²∉O | Lattice of triviality differs from character kernel | None |
| Regular bimodule convention | Noncommuting upper/lower unipotents g,h | (f·g)·h at x=f(ghx); f·(gh) at x=f(ghx), whereas reversing factors gives f(hgx) | Right-action order is fixed | None |
| Smooth transpose dual | Scalars 1,i; right translate h | B(if,f′)=iB(f,f′), while a Hermitian second-factor scalar gives −i; τ(h)=h⁻ᵀ | Bilinear and transpose conventions agree | None |
| Firm centre versus full centre | Z=ℂ⊕ℂ; Z=⊕ℕℂ | e₁+e₂ acts as 1 on two blocks; e_{0,…,n}(1,1,…)= (1,…,1,0,…) ≠ (1,1,…) | Infinite full centre is a product, firm carrier a direct sum | None |
| Global degree/norm | Places of degrees 2,3; rational a | Degree difference 3−2=1; norm q⁻³/q⁻²=q⁻¹; deg(a)=0 and norm(a)=1 | No degree-one point inferred | None |
| Global residue sign | Traced residues r=1,−1 over 𝔽₃ | ζ·ζ⁻¹=1; choosing the same sign twice gives ζ²≠1 | Rational character triviality uses opposite residues | None |
| Pair-category tensor/unit | (ℂ,0),(0,ℂ),(0,0) | Mixed product=(0,ℂ); spherical square=(0,ℂ); zero product=(0,0) | Unit and idempotent differ | None |
| Universe convention | Empty and one-point small diagrams | Empty coproduct=0, one-point colimit=X; a proper-class index is not in the small-diagram domain | No unrestricted size quantifier | None |
| Native smooth discrete dictionary | Trivial complex line, scalar λ→0 | With discrete coefficients, stabilizer=G and the scalar action is continuous; with usual ℂ and discrete line, preimage of {v} under λ↦λv is {1}, not open | Discrete coefficients required for arbitrary nonzero examples | State coefficient topology explicitly |
| §0.1 determinant pairing definition | E₀₀,E₁₁ and E₀₁,E₁₀ | B=1 and −1; trace-product pairing gives 1 and 0 | Off-diagonal sign and object distinguished | Add Dor23 line 491 |
| §0.1 polarization identity | m=[[1,2],[3,4]], n=[[5,6],[7,8]] | Trace formula=−4; det(m+n)−det(m)−det(n)=−4; wrong positive cross terms=60 | Identity survives coefficient tests | None |
| §0.1 perfectness and transpose | Zero ring, 𝔽₂, dual numbers | Gram determinant=1; zero-ring map is the unique 1-element bijection; B(εE₀₀,E₁₁)=ε; B(E₁₀,E₀₁)=−1 | No domain, reducedness or invertible-2 premise needed | Clarify no division by 2 in characteristic 2 |
| §0.1 alternating tensor form | E₀₀⊗e₀,E₁₁⊗e₁ | Pairing=1; reverse pairing=−1; diagonal pairing=0 | Symmetric times alternating has required sign | None |
| §0.2 determinant-kernel group | (−I,I,I); (2I,(1/2)I,I) | Determinant product=1 in both; scalar product=−1 in first; second action on pure tensors=1 | Action need not be faithful and abc=1 is not scalar membership criterion | None |
| §0.2 action and S₃ relations | diag(π,1),diag(π⁻¹,1),I; transpose | Form multiplier=ππ⁻¹=1; (π,1,1) multiplier=π≠1; E₀₁→E₁₀→E₀₁ | Kernel condition and transpose essential | None |
| §0.3 rigidified scalar lift | Identity; transposition; 3-cycle | Operators 1, T²=1, σ³=1; replacing T by −T changes its prescribed value on an indicator from 1 to −1 | Rigidification excludes sign ambiguity | None |
| §0.4 induced kernel definition | Identity triple; middle u(b) | Identity has D=1 and modulus 1; phase at m=0 is 1, at m=I₂,y=1,b=t⁻¹ is ζ | Trivial middle action fails | None |
| §0.4 Fourier square and commuting actions | y=1; y=t over q=3 | Negative finite Fourier square sends δ₁ to δ₂; at y=t two modulus factors give 3⁻⁴ and inverse volume gives 3⁴, product=1 | Reflection agrees with w²=−I | None |
| §0.5 open kernel and extension by zero | Integral indicator, (0,1),(I₂,1),(t⁻¹I₂,1) | Values 1,1,0; every extension from Y° has value 0 at (0,1) | Y° is a proper subspace | None |
| §0.5 mirabolic generation boundary | Trivial orbit; nontrivial character orbit | Φ⁻triv=0; Φ⁻Φ⁺ℂ=ℂ; Fourier transform of an invertible-locus compact ball at 0 is its positive volume | Middle-G stability is false; generation remains target | None |
| §1.1 three centre actions | z=0,1,e_c; two distinct blocks | Actions all 0 or id; e_c²=e_c; e_c e_d=0 for c≠d | Central balance has correct block values | None |
| §1.2 singular comparison and Tor | Supercuspidal; trivial G-module | Jac(supercuspidal)=0; E²₀₀=E²₁₀=E²₀₁=0 under both vanishing conditions; trivial module has SL₂-coinvariants ℂ≠0 | Functional hypotheses are essential | None |
| §1.3 open spectral integral | Coefficient integral 1; two identical character lines | μ(Φ(g)f(y det g))=1·f(y); Schur dimensions 1 and dim M₂(ℂ)=4 | Irreducibility cannot be omitted | Add equation locator Dor23 line 358 |
| §1.4 full Kirillov extension | Supercuspidal, principal series, St, triv | Jacquet boundary 0 versus nonzero; Whittaker dimensions St=1,triv=0; at q=3 excluded ratios 1/3,3, while ratio 1 is allowed | Full boundary and classification extension retained | None |
| §1.5 local zeta equality | Zero input, unit shell, uniformizer at s=1/2 | Both zero inputs give 0; unit weight=1; determinant/Mellin weight at π is 3⁻¹ and Kirillov weight times extra y is 1·3⁻¹ | Exponents differ by 1 | None |
| §2.1 transpose conversion | g=u(1), h=u(1)ᵀ on 𝔽₃² as a matrix test | gᵀe₀=(1,1); hᵀgᵀe₀=(2,1)=(gh)ᵀe₀; gᵀhᵀe₀=(1,1) | Noncommutative order tested; not a smooth complex model | None |
| §2.2 exotic balanced product | 0,N; two swaps of [m⊗n⊗Ψ] | 0⊛N=0; s² sends representative back to [m⊗n⊗Ψ] with scalar 1 | Zero and symmetry normalization fixed | None |
| §2.3 weak tensor definition | Vector spaces, λ and 2λ | Unit-symmetry composites λ=λ and 2λ=2λ | Weak data permit unitor rescaling | None |
| §2.3 weak functor comparison | Identity product comparison, unit maps 1 and 2 | At c=2 correct paths both 2λ; identity unit map gives 2λ versus λ | Unit comparison direction fixed | None |
| §2.4 Whittaker quotient/compact induction | 1_GL₂(O), conductor-zero e over 𝔽₃((t)) | W(1)=1,W(u(t⁻¹))=ζ,W(diag(t⁻¹,1))=0; inverse character gives ζ² | Nonzero quotient and character sign fixed | None |
| §2.4 unit map φ | Integral reference and 1_GL₂(O) | φ at g∈GL₂(O)=1 and at diag(t⁻¹,1)=0; middle integral operators preserve the reference with scalar 1 | Actual regular-bimodule comparison has correct scale | None |
| §2.5 Whittaker trace and unit symmetry | Surviving twisted generator; scalar endomorphisms 2,3 | Transpose eigenvalue +1; compositions 2·3=3·2=6; M=Iunit gives Φ⁻N on both sides | No associator used | Replace three source anchors |
| §3.1 degeneracy definition | triv,St,0 | Φ⁻triv=0, dim Φ⁻St=1, Φ⁻0=0 | Genericity distinguished | None |
| §3.1 Hom/Ext left orthogonality | St, nonsplit Eext, triv | Ext¹(St,triv)≠0; Eext is the nonzero class with Hom/Ext to degenerate targets 0; triv has Hom(triv,triv)=ℂ≠0 | Both argument order and Ext condition matter | None |
| §3.2 finite-support Hom specialization | One block; infinitely many nonzero blocks | Single-block identity has support 1; full identity has support ℕ and no finite support | Full Hom and underlined Hom differ | Add direct Hom locator Dor23 line 1360 |
| §3.3 centre-to-unit evaluation | z=0,1; two block idempotents | Reconstructed natural maps 0_X,id_X; e₁e₂=0; evaluation sends (1,1) to blockwise identity | No centre defined by desired conclusion | None |
| §3.4 enhanced adjunction definition | N=0,Z,e_cZ | F(0)=0,F(Z)=Iunit,e_dF(e_cZ)=0 for d≠c | Actual carriers and support fixed | None |
| §3.4 unit and tensor comparisons | ℂ modules in one block, dimensions 2,3 | Adjunction unit 1↦1; relative tensor dimension 2·3=6 on both presentations | Product comparison has correct scalar | None |
| §3.5 degeneracy-free equivalence | 0,Iunit; Steinberg | Enhanced Φ⁻F(0)=0, Φ⁻F(Z)=Z; Ext¹(St,triv)≠0 excludes St although dim Φ⁻St=1 | Generic does not imply in image | Anchor theorem at Dor23 line 1318 |
| §4.1 spherical generator | Ramified determinant χ; unramified character | SL₂(O) acts by χ(1)=1; diag(u,1) acts by χ(u)≠1 in ramified case | E retains ramified determinant twists | None |
| §4.2 ε and Δ | ν=0,1; q=3 | Coefficients 1,1/3 and masses δ₁,δ_{π⁻¹}; h=diag(1,−π) gives upper entry −π⁻¹O=π⁻¹O | Conductor exponent sign and mass agree | None |
| §4.2 both counit laws | Normalized generator; rescale Δ by 2 | Original composites return generator v; rescaled composites give 2v | Counit rules fix comultiplication scale | None |
| §4.3 spherical centre equivalence | Zsph; ramified determinant χ | Domain unit maps to E, not Iunit; SL₂(O)-fixed dimension 1 and K-fixed dimension 0 for χ | No ambient unit-preserving comparison | None |
| §4.4 joint generation | (Z,0),(0,Zsph); mixed ε | Images Iunit,E; mixed product E; product-category mixed Hom=0 while ε:E→Iunit≠0 | Faithfulness is not fullness | None |
| §5.1 unit-free tensor definition | Addition on discrete ℕ; Cantor pairing | Addition: (0+0)+1=0+(0+1)=1; Cantor triples=2,5; scaled associator c=2 gives pentagon 4,8 | Tensor must include pentagon | Move supporting structure to README only |
| §5.1 defect theorem | Complex line θ=2·mult; zero object; Cantor bijection | Triple coefficients 4,4, defect=1; zero-object id=0; Cantor intertwining values 2,5 | Arbitrary binary bijection insufficient | Move supporting theorem to README only |
| §5.1 invertibility premise | Scalars a=0,1,2 | a²,a³=(0,0),(1,1),(4,8); only nonzero solution among these is 1 | Cannot cancel noninvertible 0 | None |
| §5.2 exotic associator | Three Whittaker generators; three E generators; mixed ε | Ordinary line associator at (1,1,1)=1 on both paths; E defect 1²=1³=1; mixed counit normalization scalar 1 | Separate mixed-map naturality required | None |
| §5.3 Frobenius categorical evaluation | Vectℂ regular coevaluation; 0,ℂ | Both triangles send 1 to 1; evaluation 0⊗ℂ=0, ℂ⊗ℂ=ℂ | Category self-duality does not imply each object finite dimensional | None |
| §5.4 generic algebra and scale | St; determinant character; unit rescaling c=2 | Whittaker dimensions 1 and 0; unit scale 2 requires multiplication scale 1/2; product scalar 2·1/2=1 | Unit quotient determines multiplication | None |
| §5.5 local convolution | Scalars f=2,g=3 in line model; orthogonal blocks | Product 6 in either order; cross-block product e₁e₂·6=0; infinite all-one family not in direct sum | Commutativity and local units fit | None |
| §6.1 restricted kernel and coherence | Empty stage; two exceptional places plus a reference | Empty tensor=ℂ; [x⊗y]=[x⊗y⊗y_v⁰]; nonzero reference=1 at (0,1) | Infinite arbitrary tail excluded | Replace three source anchors |
| §6.2 compact/unrestricted quotient functions | Compact indicator; constant 1; scalar i | Indicator value 1 on support,0 outside; constant has 1 on infinitely many determinant degrees; B(if,f′)=iB(f,f′) | Unrestricted carrier strictly larger; no Hermitian substitution | None |
| §6.3 theta definition/invariance | Neighbourhoods isolating one pair or two pairs | Θ(1_U)=1; Θ(2·1_U₁+3·1_U₂)=5; transposed sum=5; rational phase=1 | Ambient function exists; rational sum finite | Repair global worked example |
| §6.4 theta multiplication | One-pair indicator; two values 1,2; nonrational u(b) | Identity output 1; two-point output 3; antisymmetric sum (1−2)+(2−1)=0; at u(b) value ζ, inverse character ζ² | Wrong antisymmetric/constant models fail | Correct antisymmetrization arithmetic |
| §6.5 global zeta comparison | Zero input; disjoint unit-volume patches +1,−1; unit shell | Zero inputs 0=0; signed integral 0, absolute integral 2; unit-shell weight=1 | Majorant must be absolute double integral | None |
| §7.1 Poincaré map | Rational u(b); right translate g₀ | θ(u)=1; both translation paths equal ΣγW(γgg₀); zero representative sums to 0 | Coset sum and support conditions used | None |
| §7.2 Petersson unit identity | q det ξ=0,1; quotient volume 1 | Additive character integral 0 versus 1; unit composite returns f, not 2f | Whittaker sign and unit scale agree | None |
| §7.3 determinant kernel/image | Unit fibre patch; two disjoint patches of fibre volumes 2,3 | p(1_A)=2·1_D≠0; p(1_A/2−1_B/3)=0; averaging nontrivial θ gives 0 | Kernel excludes positive indicators and includes cancellations | None |
| §7.4 compact commutative algebra | Unit and scalar rescaling; triple line products | Unit composite at x is x, scaling m alone gives 2x; (2·3)·5=2·(3·5)=30 | Epi cancellation ties multiplication to unit | None |
| §7.5 ambient action | I⊂S; two candidate actions | Both restricted unit actions send x↦x; difference precomposed with epi=0 implies difference=0 | Unique action and dual support distinguished | Sharpen source anchor to Dor23 line 2395 |
| §8.1 automorphic module definition | Regular I-module, zero module | mI∘(eA⊛id) at x=x; on zero object both maps 0 | Criterion is actual unit factorization | None |
| §8.2 realization/closures | Identity; trivial automorphic determinant; decreasing stabilizers | Lift of id is id; Whittaker dimension of determinant line=0; tuple of vectors with stabilizers of depths n has intersection containing no compact open | Subquotients allowed; raw products excluded | None |
| §8.3 matrix Schwartz quotient/Q | Integral reference; g=diag(π_v,1),q_v=3 | QΨ(0)=1; Q(gΨ)(0)=3=abs(det g)⁻¹; unweighted model gives 1 | Residual determinant weight fixed | None |
| §8.3 residual transpose | m=E₀₁, g=u(π_v⁻¹) | Transposed indicator test=0; untransposed right translation=1 | Same determinant, different operator | None |
| §9.1 spin datum | ℙ¹,O(−1),O; local orders 0,2,1 | L²=O(−2)=Ω versus O²=O; lattice exponents 0,−1 and no integer exponent for odd order 1 | Actual square root, not degree condition | None |
| §9.1 character/lattice scaling | s↦πs; dt at infinity | Differential order rises 2 and lattice exponent falls 1; ord∞dt=−2 gives Λ∞=πO | Inverse direction pinned | None |
| §9.2 global coalgebra | Unramified place; two local factors | Distribution coefficient 1 and mass δ₁; both unit composites on x⊗y return x⊗y; family changing every reference has infinitely many exceptions | Restricted maps need preservation, not just local existence | None |
| §9.3 spherical Hom definition | Fixed vector; unbounded determinant conductor family | Some eJ fixes smooth fixed vector with value 1; a rough tuple with nontrivial action at every depth is fixed by no eJ | Full Hom strictly larger than smooth part | None |
| §9.3 convolution/quasi-unit | Formal unit u; scalar f=3; orthogonal e,1−e | u⋆f=3; 2⋆ gives 6; mixed projector product e(1−e)=0 | Formula and scale fixed | None |
| §9.3 non-pointwise product | Fibre volumes a=2,b=3 | p(f)=1−1=0; p(f²)=1/2+1/3=5/6; p(f⋆f)=0 | Pointwise product fails kernel preservation | None |
| §9.4 section independence/involution | Rational a=t; g=diag(π_v,1),q_v=3 | Product norm(t)=1; local involution factors 9 and 1/9 multiply to 1 | Squaring separate from multiplicativity | None |
| §10.1 normalization module and η | λ=0; λ=y=1,(a,d)=(π,1),q=3 | ηf(0,1)=0 while 1_O(0)1_O×(1)=1; weighted paths (1/3)·3=1=1; unweighted path 1/3≠1 | No 0/0; extension by zero is a separate branch | None |
| §10.1 normalized Weyl twist | (π,1) then (1,π) | Weights 1/3 and 3, product 1 | No missing norm character | None |
| §10.2 induction/restriction adjunction | Chosen line trivialization; scalar c=2 | Hom comparison has r̂ left, î right; rescaling line trivialization by 2 changes the induced comparison by 2 or its inverse according to direction | Trivialization cannot be canonical | None |
| §10.3 universal quotient | diag(0,λ),λ=0,1; rank-two I₂ | Determinants 0,0,1; middle ordinary U phase 1,1,ζ at b=t⁻¹ | Singular stratum survives; rank two killed | None |
| §10.4 lax induction/localization | η on λ=0; two normalizing factors | η-image value 0 versus regular reference 1; triple product retains two Lnorm factors; after inversion η·η⁻¹=1 | Unlocalized unit unsupported | None |
| §10.5 intertwiner | Unlocalized η,η(w); localized unit | Normalizing injections have value 0 at the additive boundary versus regular-reference value 1; localized normalization factors become 1·1=1 | Square is η⊗η(w), not bare identity | None |
| §11.1 quotient torus category | trivT; character nontrivial on rational t | Rational action values 1 versus χ(t)≠1; IT unit differs from S(T), since t and 1 have same quotient coset | Rational descent iff condition tested both ways | None |
| §11.2 global normalized adjunction | Local unit reference at (0,1); both Weyl orientations | ηv reference=0 and Lnorm reference=1 at every place; ηv(w) has same underlying 0; completed reference maps have scalar 1 | No raw restricted tensor of local units/traces | None |
| §11.2 automorphic restriction | Cuspidal; anomalous Eisenstein quotient | r̂aut(cusp)=0; raut(iaut(trivT)/trivG)=0 and cuspidal projection=0 | Vanishing does not characterize cusp component | Distinguish trivT from tensor unit |
| §11.3 Weyl lifting/four-term identity | Additive group-algebra exponents u=2,v=3,z=10 | Both sides have terms (12,13),(22,3),(3,22),(13,12), each coefficient 1 | Identity and inverse diagonal transport exact | None |
| §11.3 degree-uniform prime argument | deg(u/v)=0,−5; deg z=10 | Prime degrees (10,10,20) and (10,5,15); all positive; original degree −5 recovered | No prime of degree 0 or −5 required | None |
| §11.3 Weyl half-power/stabilizer | q=3; full unit level over 𝔽₃ | Values 1 and 1/3 become 1/√3,1/√3; rational stabilizer size 2²=4, normalized coefficient 4/4=1; S(u,u)=2D(u,u) | All scalar inverses nonzero over ℂ | None |
| §11.4 cusp/Eisenstein ideals | Cuspidal f; iaut(trivT)/trivG | CT(f)=0; anomalous quotient nonzero, raut=0, cuspidal projector=0; degree 3−2=1 without rational point | Components cannot be defined by restriction kernel alone | Repair notation; cite Dor21 line 324 |
| §11.4 complementary algebra ideals | Two component projectors e,1−e | e²=e, (1−e)²=1−e, e(1−e)=0, e+(1−e)=1 | Direct product for two pieces has zero mixed multiplication | None |
| §11.5 full component equivalence | Two nonzero components; nonsmooth infinite tuple | Projections (x,y)↦x,y; mixed product 0; tuple with stabilizer intersection of depths n has no open stabilizer | Smooth reconstruction required | Replace repair-history wording |
| §11.6 irreducible comparison/local W-modules | W=St; determinant character in same block | Whittaker dimensions 1 and 0; Hom(Iunit,det-character)=0, so its unit cannot factor through St | Central character alone insufficient | None |
| §11.7 finite length | Cuspidal; self-Weyl Eisenstein; n=0,1,2 | Dimensions 0 and at most 1+1=2 even when χ=χ(w); total bounds 0,2,4 | Both boundary n=0 and repeated-character case retained | None |

## Conditional supplier contract probes

The accepted sixteen contracts are retained as explicit additions required from their named owners. They are not assertions that those additional interfaces exist at the pins or in the cited base section. The review's conditional acceptance is not converted into a claim of unconditional supplier coverage.

| Contract | Instances tried and computed values | Result/change |
| --- | --- | --- |
| smooth-balanced-tensor | Zero input gives 0; regular ℂ[C₂] balanced against a one-dimensional trivial module has dimension 1, not 2 | Retain residual-action and regular-unit contract |
| smooth-tor-residual-action | Identity residual action on Q induces identity on Tor; under both SL₂-functional vanishings E²₀₀,E²₁₀,E²₀₁=0 | Retain functoriality, without a flatness premise |
| firm-centre-enrichment | Two block supports have evaluation (2,3)·(5,7)=(10,21); cross-block evaluation=0; infinite all-one family is not finite support | Retain closed finite-support tensor–Hom contract |
| transpose-central-distributions | Identity and zero distributions act as 1 and 0 in every factor; transposed rank-one basis matrices E₀₁,E₁₀ have equal central action | Retain full distribution theorem, not inferred from scalar examples |
| twisted-spherical-centre | Ramified determinant line has SL₂(O)-invariant dimension 1 and K-invariant dimension 0 | Retain larger compact induction; ordinary Satake insufficient |
| equal-characteristic-fourier | C₃ negative Fourier square δ₁↦δ₂; zero-dimensional pairing gives one term of value 1 | Retain perfect-pairing/partial-transform extension |
| normalization-module-freeness | Specified generator sends 1_O× at unit to 1_O; value at 0 changes 0→1, so this is not zero extension | Retain noncanonical isomorphism |
| compact-data-global-zeta | Two unit-volume integrand patches 1,−1 give signed 0 and absolute 2 | Retain absolute double-integral convergence hypothesis |
| odd-equal-characteristic-gl2-classification | Over 𝔽₃((t)), ratios ν(t)=1/3,ν⁻¹(t)=3 are excluded; ratio 1 allowed; St/triv Whittaker dimensions 1/0 | Retain separate equal-characteristic extension |
| all-generic-kirillov | Supercuspidal boundary 0; generic principal-series boundary nonzero; triv has Whittaker quotient 0 | Retain full generic carrier, not compact functions for every input |
| rational-theta-characteristic | ℙ¹ gives O(−1)²=O(−2); O²=O≠Ω | Retain existence contract; Arm67 original proof uncertified |
| ordinary-presentable-linear-tensor | Vectℂ tensor unit gives ℂ⊗ℂ=ℂ, zero gives 0; triangles on 1 give 1 | Retain ordinary categorical extension rather than stable substitution |
| determinant-pushforward | Fibre patches of volumes 2,3 give p(1_A/2−1_B/3)=1−1=0 | Retain quotient measures and support theorem |
| sl2-rational-unipotent-generation | Upper/lower unipotents generate w via u(−1)l(1)u(−1)=[[0,−1],[1,0]], determinant 1 | Retain adelic/rational generation contract; a finite matrix identity is not its proof |
| eisenstein-constituent-automorphicity | Trivial torus character induces an object with trivial constituent (Whittaker dimension 0) and Steinberg local factors (dimension 1) | Retain all constituents, not only generic ones |
| function-field-cuspidal-multiplicity-one | Two nonzero maps i,2i have the same image; a fixed-level dimension 2 still represents multiplicity 1 | Retain ordinary multiplicity, distinct from strong multiplicity one |


Pull request: #1737 (roadmap/exotic-monoidal-structures-and-abstract-automorphicity at aa1db54)
