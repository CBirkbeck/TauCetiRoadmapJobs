# Review of QuiverRepresentations (pull request #1526 at 9559621)
Folder: `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/`

**Verdict:** needs changes

🤖 Independent AI review. There are **18 findings: 10 P1, 5 P2 and 3 P3**. The A₂ reflection correction is sound. The requested full-folder review still finds mathematical errors and a failing admitted-data gate elsewhere in the folder. No pull-request file was changed.

The supplied previous review identifies itself as reviewing #1397 at ca98ae0. I compared its findings with the actual files at 9559621, rather than assuming its descriptions still matched. No repair report marking findings “not actionable in this package” was supplied.

Previous findings, checked first:

| Previous finding | Passage at this head | Disposition |
|---|---|---|
| R01 | Lean:181, `Ring.jacobson (pathAlgebra k Q) ^ N` | Not repaired; R01 below |
| R02 | Lean:224, `(M : QuiverRep k Q)` | Not repaired; no finite-dimensionality hypothesis; R02 |
| R03 | README:344, “dim (coxeterFunctor M) = c · dim M” | Not repaired; R03 |
| R04 | README:429, “S₁ = (k → 0) to (k ←^{id} k)” | **Repaired**; the other two images and s₂ also agree with the kernel computation |
| R05 | README:452, “the algebra's cartanMatrix and the Tits form's Gram matrix” | Not repaired; R04 |
| R06 | README:221, “arrows generate kQ as an algebra” | Not repaired; R05 |
| R07 | README:300, “End of a minimal faithful projective” | Not repaired; R06 |
| R08 | README:370, “Descent by height” | Not repaired; R07 |
| R09 | Lean:192, “its zero locus the imaginary roots” | Not repaired; R08 |
| R10 | Lean:104, “the projective cover of Sᵢ” | Not repaired; R09 |
| R11 | Lean:213, “fixing the coordinate hyperplane” | Not repaired; R10 |
| R12 | Lean:54, `Ring (pathAlgebra k Q) := sorry` | Not repaired; all 13 data admissions remain; R11 |
| R13 | README:157, “What is missing (build here)” | Not repaired against the pins; R12 |
| R14 | Lean:348, `Finite (Σ a b : Q, Quiver.Path a b)` | Not repaired; general bound-algebra AR scope is absent; R13 |
| R15 | README:86, “FiniteDimensional (pathAlgebra k Q)-finiteness” | Not repaired; R14 |
| R16 | README:442, “the Jordan blocks k[X]/(X − λ)ⁿ” | Not repaired over the standing arbitrary field; R15 |
| R17 | Lean:78, `finiteDimensional_pathAlgebra` | Not repaired; five direct closures now verified, including the previous four; R16 |
| R18 | README:303, “Gabriel's presentation theorem” | Not repaired in the file: still no exact locator. This review obtained the source and verified II.3.7, p.64; R17 |
| R19 | README:199, “The build, in layers” | Not repaired; missing contracts and definition Checks; R18 |

Here and in that table, README and Lean mean the two files in the folder named above.

## R01 (P1) — Admissibility uses the wrong ideal

**Location:** `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/Suggested.lean:181`, “Ring.jacobson (pathAlgebra k Q)”; also README:280 and 304.

**Claim:** The Gabriel presentation kernel lies between powers of the Jacobson radical of the unquotiented path algebra.

**Witness:** For the one-loop presentation of k[ε]/(ε²), kQ=k[X], Jac(k[X])=0, but ker f=(X²)≠0. The asserted upper inclusion becomes (X²)≤0.

**Repair:** Import the native path algebra and use its **arrow ideal** J, with a two-sided kernel and `J^N ≤ ker f ≤ J²`; require finite vertices and arrows. `TauCeti.IsAdmissibleIdeal`, `TauCeti/RepresentationTheory/Quiver/AdmissibleIdeal/Basic.lean:102`, supplies exactly this condition. The dual-number example then has J=(X), N=2 and equality on both sides. ASS Definition II.2.1, p.53 (`ass line 2782`), and Theorem II.3.7, p.64 (`ass line 3404`), confirm the correction.

Choosing another quiver cannot save the intended existential claim. A quotient by an ideal contained in Jac(kQ) retains all simple modules. Morita equivalence with the dual numbers forces one simple class, hence one vertex. Any loop at that vertex supplies distinct scalar-evaluation simples over the algebraically closed field, so there can be no loops. The resulting algebra is k, whose semisimple module category is not Morita equivalent to that of the dual numbers.

## R02 (P1) — Reflection dimensions require finite-dimensional inputs

**Location:** `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/Suggested.lean:222`, `dimVector_reflectionFunctor`; the hypotheses omit `IsFinDim k Q M`.

**Claim:** Absence of a sink-simple summand suffices for the equality of finrank vectors.

**Witness:** On 1→2, use V=k^(ℕ) at both vertices and the surjective shift with one-dimensional kernel. No sink-simple summand exists. Input finranks are (0,0); reflected finranks are (0,1).

**Repair:** Carry pointwise finite-dimensionality explicitly and use the native reflection. The finite-dimensional projection k²→k gives (2,1)=(2,2−1), whereas the shift must be excluded. Keep both as Checks. `Module.finrank_of_not_finite`, `Mathlib/LinearAlgebra/Dimension/Free.lean:268`, verifies why both infinite-dimensional input coordinates are zero. BGP's setting explicitly requires finite-dimensional vertex spaces (`bgp line 22`).

## R03 (P1) — Coxeter action needs a survival condition

**Location:** `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:344`, “dim (coxeterFunctor M) = c · dim M”.

**Claim:** The formula holds for every representation.

**Witness:** For A₁ and its simple S, the sink reflection is zero: dim C⁺S=0. The Coxeter reflection sends 1 to −1.

**Repair:** Require that each successive input have no summand equal to the sink simple at that step, or state the indecomposable surviving/killed dichotomy. Specify composition order. Then A₁ S belongs to the killed case; A₂ sink order [2,1] gives C⁺S₁=S₂ and s₁s₂(1,0)=(0,1). BGP Theorem 1.1, pp.21–22 (`bgp line 173`), distinguishes these cases.

## R04 (P1) — The algebra and root Cartan matrices are not equal

**Location:** `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:452`, “the algebra's cartanMatrix and the Tits form's Gram matrix … reproduce the ADE Cartan matrix”.

**Claim:** Composition multiplicities and the polarized Tits matrix both give the root Cartan matrix.

**Witness:** For 1→2 with rows indexed by projectives, C=[[1,1],[0,1]], whereas the root matrix is B=[[2,−1],[−1,2]]. Already A₁ gives [1]≠[2].

**Repair:** Distinguish C from B. For the stated row convention on an acyclic path algebra, E=C⁻¹ is the Euler matrix and B=E+Eᵀ. A₂ gives E=[[1,−1],[0,1]] and precisely the displayed B. Record the transpose adapter to `TauCetiRoadmap/GrothendieckEulerForms/README.md:77`, whose columns index projectives; do not introduce a reverse supplier dependency for that consumer comparison.

## R05 (P1) — Arrows do not generate every path algebra

**Location:** `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:221`, “The subalgebra generated by the arrows is all of kQ”; also Lean:59.

**Claim:** No vertex idempotents are needed among the algebra generators.

**Witness:** For two isolated vertices there are no arrows. Their generated unital k-subalgebra of k×k is the diagonal k, of dimension 1, while kQ has dimension 2.

**Repair:** Include every vertex idempotent among the generators. The two idempotents (1,0),(0,1) generate every pair in the witness. Cite `TauCeti.PathAlgebra.adjoin_vertexIdempotents_union_arrows`, `TauCeti/RepresentationTheory/Quiver/PathAlgebra/Basic.lean:1071`, and keep the disconnected Check.

## R06 (P1) — Minimal faithful projectives do not characterize basic algebras

**Location:** `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:300`, “equivalently A ≅ End of a minimal faithful projective”.

**Claim:** This is equivalent to basicness and supplies the stated left-module Morita reduction.

**Witness:** The basic A₂ algebra has dimension 3. P₁=(k→k) is faithful and minimal faithful projective, but End_A(P₁)=k has dimension 1.

**Repair:** Delete that equivalence. Keep the reduced semisimple-quotient criterion. For Morita reduction use the **opposite** endomorphism algebra of a progenerator containing one projective cover per simple class. On A₂ this is P₁⊕P₂=A, and End_A(A)ᵐᵒᵖ=(Aᵐᵒᵖ)ᵐᵒᵖ≅A. A faithful projective need not be a generator.

## R07 (P1) — Sink-admissible reflections need not decrease height

**Location:** `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:370`, “under an admissible sequence … decreasing Base.height”.

**Claim:** The reflection-functor induction can use strict height decrease at each sink-admissible step.

**Witness:** Orient D₄ toward its centre and take (centre;leaves)=(1;1,1,1). Its Tits value is 4−3=1. The only sink reflection gives (2;1,1,1), with height 5 rather than 4.

**Repair:** Use admissible-reflection termination allowing height increases, with its exact termination theorem as an input. Alternatively separate unrestricted root lowering from sink-admissible transport and supply the connecting argument. The repaired route must allow this first step 4→5; its Tits value remains 7−6=1. RootSystems Layer 1's unrestricted lowering target does not supply this stronger sink-restricted claim.

## R08 (P1) — Imaginary roots are not the Tits zero locus

**Location:** `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/Suggested.lean:191`, “its zero locus the imaginary roots”.

**Claim:** All imaginary roots have Tits value zero in the allowed generality.

**Witness:** For the three-arrow Kronecker quiver, (1,1) supports an indecomposable with arrow maps (1,0,0), and q(1,1)=1+1−3=−1. It is an imaginary nonisotropic root.

**Repair:** Call q=0 the isotropic locus, not the imaginary-root set. Any affine-root characterization must state its affine hypothesis and exclude the zero vector. The two-arrow example has q(1,1)=0; the three-arrow example has −1; q(0)=0 never makes 0 a root.

## R09 (P1) — Vertex covers and path-basis injectives need finite paths

**Location:** `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/Suggested.lean:103`, “the projective cover of Sᵢ”; README:246, “with basis the paths ending at i”.

**Claim:** The unrestricted vertex projective is a projective cover, and the dual injective has the stated path basis.

**Witness:** For one loop, k[X]→k has kernel (X), but the proper submodule (X−1) still surjects. Over 𝔽₂ the dual of k[X] has cardinality 2^ℵ₀, versus ℵ₀ for the path span.

**Repair:** Retain the unrestricted projective representation without the cover assertion. Assert the cover and finite dual path basis when there are finitely many relevant paths, in particular for finite acyclic Q. Define the general coinduced object using the **full linear dual**, without asserting this path basis or its indecomposability in that generality. A₁ gives the identity cover k→k; the loop evaluation remains a negative control.

## R10 (P1) — A simple reflection fixes the orthogonal hyperplane

**Location:** `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/Suggested.lean:213`, “fixing the coordinate hyperplane and negating αᵢ”.

**Claim:** The coordinate hyperplane is the fixed space.

**Witness:** For A₂, s₂(1,0)=(1,1), although the second coordinate of (1,0) is zero. The fixed line is 2d₂−d₁=0; s₂(2,1)=(2,1).

**Repair:** Use orthogonality to αᵢ under the polarized Tits form, and require a loopless vertex for a genuine reflection. Cite `TauCeti.vertexPreReflection` and its loopless `vertexReflection` packaging in `TauCeti/RepresentationTheory/Quiver/Reflection/DimensionVector.lean:67`. This fixes (2,1) and negates (0,1). Etingof Definition 5.20/Remark 5.21, p.89 (`etingof line 3977`), uses the same orthogonal convention.

## R11 (P2) — Thirteen admitted data declarations fail the gate

**Location:** `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/Suggested.lean:54`, `Ring (pathAlgebra k Q) := sorry`; also lines 56, 61, 93, 98, 106, 160, 204, 209, 215, 232, 307 and 371.

**Claim:** These declarations provide the actual operations and carriers needed by the acceptance theorems.

**Witness:** All 13 bodies are admitted; the worker gate reports `sorry-data=13 … FAIL`. Neither the ring instance nor the AR-arrow instance imposes its intended multiplication or radical-quotient law.

**Repair:** Import the native implementations and remove private copies. Keep only simple definitions with real bodies needed by remaining headlines. When a heavy carrier is genuinely unavailable, name the affected headline and missing carrier in the module docstring instead of supplying admitted data. Recheck e₂a=a=ae₁, the repaired A₂ reflection images and the AR arrows S₂→P₁→S₁. An empty-arrow AR instance or pointwise path multiplication must not satisfy the replacement specification.

## R12 (P2) — Existing pinned objects are planned again

**Location:** `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:157`, “What is missing (build here)”; Lean:48 onward.

**Claim:** The foundations, Euler forms, reflection theory and classification listed here are missing work.

**Witness:** The pin supplies path algebras (Basic:209), their module equivalence (AsModule:574), Krull–Schmidt (Uniqueness:228), Euler/Tits forms (EulerForm:57/99), and Gabriel correspondence (Correspondence:78). Exact paths appear in the inventory below.

**Repair:** Inventory implemented objects in Scope and ownership and Exact supplier contracts; cite and remove duplicate targets and declarations. State remaining headlines using those native carriers. Preserve the existing roadmap's role as owner of its base theory; put new extensions in Part II. The native Euler form has E(e₁,e₂)=−1 and E(e₂,e₁)=0, and its path product has e₂a=a=ae₁, so a convention change does not justify a duplicate.

## R13 (P2) — The acceptance file omits and narrows promised headlines

**Location:** `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:387`, “A = kQ/I finite-dimensional”; Lean:347 and 355.

**Claim:** The file tests general finite-dimensional-algebra AR existence and uniqueness as short complexes fixing the endpoint, along with the other advertised summits.

**Witness:** The Lean AR theorems require finitely many paths in unbound Q, excluding k[ε]/(ε²). Uniqueness concludes only object isomorphisms. Euler–Hom–Ext and AR-duality headline statements are absent.

**Repair:** State the remaining general AR existence theorem on native finite-dimensional modules over a finite-dimensional algebra and native almost-split short complexes. Uniqueness must extend a specified endpoint isomorphism to an isomorphism of short complexes. The dual-number sequence 0→k→k[ε]/(ε²)→k→0 then lies within scope, and rescaling its inclusion can be checked through commuting squares.

Inventory all headlines in the docstring; state each remaining statable one and identify a specific missing carrier for any genuinely unstatable one. Native ModuleCat, Ext and ShortComplex make the Euler–Ext identity and general almost-split existence expressible. Native transpose and translate carriers also exist (inventory below); the module docstring must assess AR duality against those actual carriers. Do not substitute the cokernel-dimension identity for the Ext comparison. The two ADE root signatures also omit the README's finite-dimensionality restriction. This is a scope mismatch, not a demonstrated counterexample in ADE: retaining that stronger scope would require the additional all-modules decomposition input. Match the advertised finite-dimensional theorem and import the pinned correspondence.

## R14 (P2) — Finite-dimensionality is measured over the wrong ring

**Location:** `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:86`, “FiniteDimensional (pathAlgebra k Q)-finiteness”.

**Claim:** Pointwise k-finite-dimensionality agrees with this finiteness over kQ.

**Witness:** The one-loop regular module k[X] is generated by 1 over k[X], but is infinite-dimensional over k. Moreover, `FiniteDimensional` expects a division ring; kQ generally is not one.

**Repair:** Compare pointwise `FiniteDimensional k` with `Module.Finite k` on the total module, restricting scalars along k→kQ. A separate comparison with `Module.Finite kQ` needs finite-dimensionality of kQ. The one-loop regular module fails both corrected k-finiteness tests; the A₂ regular module has k-dimension 3 on both sides.

## R15 (P2) — The loop classification requires a splitting hypothesis

**Location:** `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:442`, “the finite-dimensional indecomposables are the Jordan blocks k[X]/(X − λ)ⁿ”.

**Claim:** This classifies them over the standing arbitrary field.

**Witness:** Over ℝ, ℝ[X]/(X²+1) is simple of dimension 2 and has no real eigenvalue. It is not a module ℝ[X]/(X−λ)ⁿ.

**Repair:** Give the arbitrary-field classification k[X]/(fⁿ), with f monic irreducible and n≥1, then derive the linear-factor version over an algebraically closed field. The witness is f=X²+1,n=1; over ℂ irreducibles are linear. Exclude n=0, which gives the zero module.

## R16 (P3) — Five admitted targets close with one library result

**Location:** `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/Suggested.lean:72`, 78, 122, 128 and 135.

**Claim:** These are unfinished acceptance theorems at the pin.

**Witness:** A scratch copy successfully replaces all five admissions with one `exact` tactic each. Four use the previous review's witnesses; finite-path finiteness also closes using the native acyclicity theorem.

**Repair:** **Delete them from Suggested.lean**, rather than proving them in place. Cite supplied mathematics in the README. The successful replacements are:

- `exact TauCeti.finite_paths_of_isAcyclic (fun {a} p => h a p)`
- `exact (pathAlgebraBasis k Q).finiteDimensional_of_finite`
- `exact TauCeti.isLocalRing_end_of_isIndecomposable hM h`
- `exact TauCeti.exists_indecomposable_decomposition hM`
- `exact TauCeti.exists_equiv_linearEquiv_of_finset hM hs his ht hit`

The finite-path examples have 0, 1 and 3 paths for the empty, A₁ and A₂ quivers. Krull–Schmidt gives 0, 1 and 2 summands for 0, k and k². These are supplied results, not additional summits. The simple/projective API theorems at lines 100 and 108 also belong in the README's API lists, not a headline-only acceptance file.

## R17 (P3) — Targets lack exact source locators

**Location:** `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:303`, “Gabriel's presentation theorem”; references at 481–502.

**Claim:** The references identify the individual mathematical targets.

**Witness:** No theorem number or page accompanies the sampled target. The retrieved source states it at ASS II.3.7, p.64; admissibility is II.2.1, p.53. No source manifest exists in the folder.

**Repair:** Add exact locators to individual claims and record sources through the prescribed service. For the sample use II.3.7 together with II.2.1, explain connected-component assembly and basic Morita reduction (I.6.10, pp.37–38), and transpose the source's right-module convention to the roadmap's left-module convention. Test the assembly on k×k and the admissible relation on the dual numbers. The source supports the corrected theorem, not the Jacobson-radical version.

The Lean citation to Paquette does not itself certify an infinite-dimensional Kronecker counterexample: his Theorem 3.5 concerns pointwise finite-dimensional rep(Q,I). Cite a result with the asserted domain or supply the separate argument. Etingof preprint numbering must not be silently substituted for the published-book chapters.

## R18 (P3) — Missing contracts, definition Checks and acceptance-test shape

**Location:** `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:199`, “The build, in layers”; Lean:7, “not exhaustive”.

**Claim:** The files supply a complete build specification and headline acceptance test.

**Witness:** There is no Summary, Scope and ownership, Exact supplier contracts, per-target Needs line or per-definition three-Check block. Layers lack Examples/Dependencies endings; the docstring does not identify unavailable headlines.

**Repair:** Restructure the same scope into the requested sections, with exact hypotheses, APIs, per-target dependencies and at least three discriminating Checks for each retained definition. The computed controls below provide concrete candidates. Reconcile the arbitrary-field convention with README:184, 204, 350 and 467, which reintroduce algebraic closedness for ADE classification. Remove process narrative, the near-term-deliverables split, and the trailing `</content>`. Reconcile advertised Lean names: `gabriel_indecomposable_equiv_posRoot` is not declared, while the root bridge and separate root/uniqueness names are not inventoried there. Use the required acceptance-file form and a docstring describing only remaining headlines and their actual carrier limitations.

## Verified sound

The computations below test the intended mathematical objects. A “pass” is a passed test instance, not a proof of every admitted theorem. An admitted data body does not define its advertised operation, so its intended-model computations are explicitly conditional on replacing that admission (R11). Counterexamples remain in the table to make the boundary of the sound claims visible.

All 503 README lines and 373 Lean lines were read. The family index was checked for the advertised quiver/root-system boundary. For comparison I read the main versions of RootSystems, SemisimpleAlgebras and GrothendieckEulerForms. The source sample, dependency audit, signatures and padding probes were performed again at this head.

### Computed adversarial table

Unless indicated otherwise, k is a field; the elementary linear calculations work over 𝔽₂ and 𝔽₃ as well. A₂ vertices are (1,2), with arrow 1→2. D₄ coordinates below are (centre;three leaves). Finrank means the natural-number-valued Lean function, including its infinite-dimensional value 0.

| Statement / target | Instances tried | Computed values on both sides | Result | Change |
|---|---|---|---|---|
| Quiver/path carrier and length | Empty, A₁, A₂, one loop | Path counts 0,1,3,ℵ₀; loop powers have lengths 0,1,2,… | Pass | Native carriers |
| Path multiplication direction | A₂ arrow a | e₂a=a=ae₁; e₁a=ae₂=0; a²=0 | Intended model passes | R11: real multiplication |
| Associativity of path multiplication | Chain 1→2→3→4 | (cb)a=c(ba)=the same length-three path; incompatible products are 0 | Intended model passes | R11 |
| Ring unit and vertex idempotents | Empty; A₂ | Empty 1=0=Σ∅; A₂ e₁²=e₁, e₂²=e₂, e₁e₂=0 and (e₁+e₂)a=a | Pass including zero algebra | R11 |
| k-algebra scalar compatibility | A₂, scalar λ; zero algebra | (λ1)a=λa=a(λ1); in zero algebra both sides 0 | Intended model passes | R11 |
| Path basis and dimension | Empty, A₁, A₂, two-arrow Kronecker | Basis size / k-dimension: 0/0,1/1,3/3,4/4 | Pass | R12/R16 |
| IsAcyclic | Empty, A₂, one loop | All closed paths nil: true,true,false; loop length 1≠0 | Pass | Import native predicate |
| Finite paths from acyclicity | A₂; infinitely many parallel arrows | 3 paths; infinitely many length-one paths despite acyclicity | Finite-arrow hypothesis necessary | R16: supplied theorem |
| Arrows generate the algebra | Two isolated vertices | Generated algebra dimension 1; whole algebra dimension 2 | **Fail** | R05: add vertex idempotents |
| QuiverRep functoriality | A₂ identity arrow; zero representation | Identity path acts by id; on zero it acts by unique 0=id | Pass | Native functor category |
| Pointwise kernels/cokernels | Vertexwise projection k²→k with identity arrows | Kernel vector (1,1), cokernel vector (0,0); dimensions 2=1+1 at each vertex | Pass | Native abelian structure |
| quiverRepEquivalence | A₂ regular module; zero | Vertex components (1,2), total 3=1+2; zero gives total 0 | Intended equivalence passes | R11/R12; identify forward/inverse directions correctly |
| Finite-dimensionality convention | One-loop regular module | Finite over k[X]: true, one generator; finite over k: false, basis 1,X,X²,… | **Fail** | R14 |
| simpleRep and simplicity | A₁; A₂; one loop | Simple vectors 1; (1,0),(0,1). Loop actions 0 and 1 give distinct simples of dimension 1 | Acyclic exhaustion passes | Define all vertex-simple arrow maps as zero; R11/R12 |
| indecProjRep and projectivity | A₂ P₁,P₂ and S₁,S₂ | P₁=(1,1), P₂=(0,1); dim Hom(Pᵢ,Sⱼ)=δᵢⱼ | Pass intended projectives | R11/R12 |
| Vertex projective cover | A₁; one-loop evaluation | A₁ kernel 0; loop (X)+(X−1)=(1) with (X−1) proper | **Fail** unrestricted cover | R09 |
| Vertex injective dual/basis | A₂; one loop over 𝔽₂ | I₁=(1,0), I₂=(1,1); loop dual cardinal 2^ℵ₀ versus free span ℵ₀ | Finite-path formula passes; unrestricted basis fails | R09 |
| IsIndecomposableModule | 0,k,k²,dual-number regular module | false,true,false,true; k² splits 1+1, dual numbers have only idempotents 0 and 1 | Pass | Native predicate |
| Fitting splitting | diag(0,1) on k²; multiplication by ε on dual numbers | First ker⊕im=k⊕k; second f²=0, ker f²=A, im f²=0 | Pass | Import supplied Fitting theory |
| Local endomorphism iff indecomposable | k,k²,0 | End=k,M₂(k),zero ring; local=false only for last two, matching indecomposability | Pass | R16 |
| Indecomposable decomposition existence | 0,k²,dual-number A | Summand counts 0,2,1; total dimensions 0,1+1,2 | Pass | R16 |
| Krull–Schmidt uniqueness | Coordinate axes versus lines (1,0),(1,1) in k² | Two summands of dimension 1 on both sides, including over 𝔽₂ | Pass | R16 |
| Primitive idempotents / simple classes | M₂(k); dual numbers | 1=e₁₁+e₂₂ but one simple class with multiplicity 2; dual numbers have one primitive idempotent 1 | Pass with isomorphism-class indexing | State dictionary precisely |
| Radical powers / semisimple quotient | M₂(k); dual numbers | Radicals 0,(ε); 0¹=0 and (ε)²=0; quotients M₂(k),k | Pass | Cite Mathlib inputs |
| exists_projectiveCover | k; dual-number simple | Identity k→k; A→k with kernel (ε), and (ε) superfluous | Pass finite-algebra scope | Native theorem; do not restrict to hereditary algebras |
| Injective envelope | k; dual-number simple | Identity k→k; k→A, 1↦ε, with socle (ε) meeting every nonzero ideal | Pass intended finite-algebra target | Exact target/API needed |
| Algebra cartanMatrix multiplicities | A₂; ℂ as ℝ-algebra | C=[[1,1],[0,1]]; over ℝ the simple ℂ has multiplicity 1 but Hom dimension 2 | Pass with stated splitting/division-ring qualification | R11/R12 |
| Path-count interpretation with relations | 1→2→3 with ba=0 | Raw paths 1→3:1; quotient path-space dimension:0 | Requires quotient vector-space dimension | Clarify “count modulo relations”, not path equivalence classes |
| Basic reduced-quotient predicate | k,M₂(k),dual numbers,zero algebra | Reduced quotient truth true,false,true,true; matrix e₁₂²=0≠e₁₂ | Pass, empty product handles zero | Import native basicness and comparison |
| Minimal faithful projective equivalence | A₂ P₁ | dim A=3; dim End(P₁)=1 | **Fail** | R06 |
| Left-module Morita orientation | P=A | Right multiplications satisfy r_a∘r_b=r_ba; End_A(A)=Aᵒᵖ | Opposite required | R06 |
| Admissible ideal definition | One loop, I=(X²); A₂,I=0 | Loop J²=I but Jac(k[X])²=0; A₂ J²=0=I | **Fail** wrong ideal | R01 |
| Gabriel presentation sample / connected assembly | Dual numbers; k×k; M₂(k); zero algebra | Loop quotient dimension 2; two isolated vertices give k×k; one isolated vertex gives basic algebra k for M₂(k); empty quiver gives zero | Corrected theorem fits all four | R01/R17 |
| Ext-quiver arrow orientation | A₂ simples | dim Ext¹(S₁,S₂)=1, dim Ext¹(S₂,S₁)=0; corresponding left-module radical blocks have dimensions 1,0 | Pass counts | Explain source's opposite/right-module convention |
| dimVector and additivity | S₁⊕S₂; infinite shift exact sequence | Finite (1,1)=(1,0)+(0,1); at an infinite vertex finrank 0≠1+0 | Pass finite scope; fails without it | R02 and explicit finite hypotheses |
| eulerForm bilinearity and order | A₂ e₁,e₂; fields of characteristic 2,3 | E(e₁,e₂)=−1, E(e₂,e₁)=0; E(e₁+e₂,e₁)=1=1+0 in ℤ | Pass | Native bilinear form |
| titsForm and polarization | Empty,A₁,A₂ | q=0; q(n)=n²; q(a,b)=a²+b²−ab and polar matrix [[2,−1],[−1,2]] | Pass | Native quadratic form |
| Algebra/root Cartan comparison | A₁,A₂ | [1]≠[2]; C⁻¹+C⁻ᵀ=[[2,−1],[−1,2]]≠C | **Fail** original comparison | R04 |
| Imaginary/isotropic convention | Two-/three-arrow Kronecker at (1,1); zero vector | q=0,−1,0 respectively; last is not a root | **Fail** zero-locus identification | R08 |
| Hereditary length-one resolution / higher Ext | A₂ S₁; bound dual-number simple | A₂ 0→P₂→P₁→S₁→0, higher Ext zero; dual numbers Extⁿ(k,k)=k for n≥1 | Pass unbound acyclic assertion; bound control excluded | Do not extend heredity to all kQ/I |
| Euler–Hom–Ext identity | (S₁,S₂),(S₂,S₁),(P₁,P₁) over A₂ | −1=0−1; 0=0−0; 1=1−0 | Pass | R13: missing headline test |
| Brick/rigidity implication | A₂ P₁; Kronecker regular size-two Jordan block | First End dimension 1, Ext¹ dimension 0,q=1; second 2,2,q=0 | Pass stated guarded implication | Preserve brick hypothesis |
| ReflectedQuiver | A₂ reflect sink 2 twice | 1→2 becomes 1←2 becomes 1→2 | Intended construction passes | R11 |
| reflectionFunctor and source inverse | A₂ P₁,S₁,S₂ | Kernel dimensions 0,1,0; images (1,0),(1,1),(0,0); source inverse recovers P₁,S₁ on survivors | **Repaired** worked example passes | Previous R04 closed |
| vertexReflection fixed hyperplane | A₂ sink 2 | s₂(1,0)=(1,1); s₂(2,1)=(2,1); s₂(0,1)=(0,−1) | **Fail** coordinate-plane wording | R10 |
| dimVector_reflectionFunctor | Projection k²→k; infinite shift | Finite (2,1)=(2,2−1); infinite actual (0,1)≠s₂(0,0)=(0,0) | **Fail** unrestricted Lean signature | R02 |
| coxeterFunctor / Coxeter action | A₁ simple; A₂ S₁ with sinks [2,1] | 0≠−1 in A₁; in A₂ (1,0)→(1,1)→(0,1)=s₁s₂(1,0) | Guarded formula passes | R03 |
| IsFinDim | Zero;k at one vertex;k^(ℕ) at one vertex | true,true,false | Pass | Import native predicate |
| IsFiniteRepType | Empty,A₁,A₂,Kronecker | Indecomposable skeleton sizes 0,1,3,∞; finite-field Kronecker still has dimensions (n,n+1) for every n≥0 | Pass | Import native predicate |
| gabriel_finiteRepType_iff, both directions | Empty,A₁,A₂,loop,Kronecker | true/true vacuously; true/n²>0; true/positive q; false/q(1)=0; false/q(1,1)=0 | Pass instances | Import classification; empty signature does not imply a nonempty Dynkin graph |
| Existence of admissible ordering | A₂; central-sink D₄ | [2,1]; [centre,leaf₁,leaf₂,leaf₃], each selected vertex has 0 outgoing arrows at its step | Pass | Use actual admissibility API |
| Reflection preserves indecomposability | A₂ P₁; sink simple S₂ | P₁→S₁' nonzero indecomposable; S₂→0 | Pass with exclusion | Keep killed exception |
| Height descent | D₄ (1;1,1,1) | q:1→1; height:4→5 | **Fail** | R07 |
| indecomposable_unique_of_dimVector_eq | A₂ over 𝔽₂ and 𝔽₃ | Nonzero arrow k→k is isomorphic to id; zero arrow splits; each of (1,0),(0,1),(1,1) has one class | Pass finite-dimensional case | R13: scope alignment |
| dimVector_isRoot_iff, both directions | A₂ d=0,(1,1),(2,0) | Existence/condition false/false (q=0),true/true (q=1),false/false (q=4) | Pass finite-dimensional case | R13 |
| exists_rootPairing_titsForm | A₁,A₂ | Roots ±1 and ±(1,0),±(0,1),±(1,1); Cartan [2] and [[2,−1],[−1,2]] | Pass test instances | Keep Nonempty for irreducibility; remaining bridge must use native carriers |
| ADE indecomposable count | A₀,A₁,A₂,D₄ | 0=0·1/2;1=1·2/2;3=2·3/2; D₄ 3+8+1=12 | Pass | In D₄ do not count centre simple twice |
| ADE brick / rigidity | Three A₂ indecomposables | Each has dim End=1, dim Ext¹=0 and q=1 | Pass | Cite pinned theorem where supplied |
| Minimal projective presentation / transpose | Dual-number simple | A --ε→ A→k→0; dual differential ε; cokernel k | Pass intended finite-module construction | R11/R13 |
| arTranslate and stable equivalence | A₂ S₁,P₁,P₂; dual-number k | τS₁=S₂,τP₁=τP₂=0; dual-number τk=k and inverse returns k | Intended examples pass | Restrict domains and supply construction, R11/R13 |
| IsIrreducibleMorphism | A₂ inclusion S₂→P₁, quotient P₁→S₁, identity | First two true; identity false because split; composite S₂→S₁=0 | Pass predicate | Import native definition |
| Category radical and rad² | A=k[ε]/(ε³), regular indecomposable | rad End(A)=(ε), rad²=(ε²); quotient dimension 1; ε² has class 0 and is reducible | Distinguishes radical maps from irreducible ones | Say nonzero classes/representatives between indecomposables |
| AR duality | A₂ M=S₁,N=S₂ | dim Ext¹(M,N)=1; dim Hom modulo injectives (N,τM)=1; dual dimension 1 | Pass test | R13: state actual natural duality and quotient |
| IsAlmostSplit | A₂ nonsplit sequence; split counterpart | Same middle dimension (1,1), arrow id versus 0; splitting false versus true | Predicate excludes split model | Native predicate on intended category; R11/R13 |
| exists_almostSplitSequence | A₂ S₁; projective S₂; dual-number simple | S₁ has 0→S₂→P₁→S₁→0; S₂ excluded; dual-number middle dimension 2 with ends 1,1 | Intended theorem passes | R13: bound case excluded by Lean |
| almostSplitSequence_unique | Rescale A₂ inclusion f to af, a≠0 | Comparison from original to rescaled has components (a⁻¹,1,1); (af)a⁻¹=f and g·1=1·g | Endpoint-fixing complex isomorphism works | R13: object isomorphisms alone omit the equations |
| arQuiver vertex carrier and arrows | A₁,A₂,Kronecker | Vertex/arrow counts 1/0,3/2,∞/∞; A₂ arrows S₂→P₁→S₁, τS₁=S₂ | Intended examples pass | R11/R13: no unconstrained arrow instance |
| A₂ triangular-matrix convention | e₁=E₁₁,e₂=E₂₂ | a=E₂₁ gives e₂a=a=ae₁; E₁₂ reverses these equations | Unlabelled upper-triangular isomorphism exists by swapping vertices | Specify the swap if using upper triangular matrices |
| Kronecker worked classification | Dimensions (1,1),(n,n+1),(n+1,n) | q=0,1,1; over 𝔽₂ the (1,1) family has 3 points, while n is unbounded | Infinite-type conclusion passes | Positive imaginary multiples require n≥1 |
| Loop worked classification | ℝ[X]/(X²+1); k[X]/(Xⁿ), n=0,1,2 | Dimensions 2;0,1,2; indecomposable false at n=0 and true for n≥1 | **Fail** arbitrary-field linear-factor restriction | R15 |
| Noncanonical data wrong-model controls | A₂ ring/reflection/AR arrows | Intended e₂a=a versus pointwise product 0; intended P₁ image (1,0) versus zero; intended AR arrow count 2 versus empty 0 | Admitted types alone do not exclude wrong models | R11 |

### Gate, signatures and padding evidence

- Verified head `9559621884a3ee4bbf878ee99c06d7d9b0e4b352`. The prescribed outside-folder diff produced no entries. The target-folder diff changes only the A₂ reflection paragraph. Git status was clean; no pull-request files were written.
- Worker gate at this head: `sorry-data=13`; every other reported counter is 0, including `build=0`, `depcheck=0`, `outside-folder=0` and `stray-files=0`; overall **FAIL**. R11 covers every offending declaration and every failing rule.
- Independently ran `lake env lean` on the original Suggested.lean from the worktree: exit 0, only admitted-declaration warnings. The imported EulerForm object file was available, so no missing-import build was needed.
- Elaborated a scratch copy containing `#check @name` for **43 declarations**, naming the four anonymous instances only in the scratch copy. This independently extends the worker's 39-name inventory. Exit 0. Compared each elaborated signature with its README domain. No silent section-binder loss appeared. The explicit missing finiteness in reflection, the unrestricted translate input, the finite-path AR restriction, and the larger ADE quantification remain as described above; no source signature was changed.
- All **16 sorried theorems** were probed. Five closed with the single-library-result replacements in R16. On the other 11, the alternatives `simp`, `rfl` and `infer_instance` did not close the goal; the scratch run retained their admissions. The final combined probe elaborated with exit 0. The initial missing Existence-module import was corrected only in the scratch probe.
- No `set_option`, admitted example, extra import kind, computational procedure, copied passage from the readable source sample, or route-specific “good cases only” restriction was found. Mathematical scope defects and admitted data are separately reported; successful elaboration does not certify them. The word “computable” in the AR paragraph does not itself specify an algorithm.
- This is maintenance of an existing roadmap, not a new roadmap attempting to replace it. The repairable defects therefore warrant **needs changes**, not rejection for re-planning.

### Pinned object inventory

Pins were confirmed from both the manifest and the library checkouts: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Paths below are relative to their respective library repositories.

| Object / declaration opened | File and line at the pin | What the declaration actually supplies |
|---|---|---|
| Quiver | `Mathlib/Combinatorics/Quiver/Basic.lean:37` | A Hom type for every ordered vertex pair; no finiteness, acyclicity, thinness or nonemptiness |
| Quiver.Path; Path.comp | `Mathlib/Combinatorics/Quiver/Path.lean:32`, :92 | Nil/cons paths, composition in traversal order; this is not an algebra multiplication |
| Paths, Paths.categoryPaths, Paths.of, Paths.lift | `Mathlib/CategoryTheory/PathCategory/Basic.lean:32`, :43, :51, :111 | Free category and extension of a prefunctor; no finite-dimensionality condition |
| CategoryTheory.Indecomposable | `Mathlib/CategoryTheory/Limits/Shapes/BinaryBiproducts.lean:1096` | Explicit nonzero condition and triviality of a summand in every binary decomposition |
| Module.finrank_of_not_finite | `Mathlib/LinearAlgebra/Dimension/Free.lean:268` | Infinite-dimensional free modules have finrank 0 |
| IsFiniteLength; its Noetherian/Artinian criterion | `Mathlib/RingTheory/FiniteLength.lean:30`, :74 | Finite-length predicate and the two chain conditions |
| CompositionSeries.jordan_holder | `Mathlib/Order/JordanHolder.lean:454` | Equivalent composition series with equal endpoints |
| MoritaEquivalence | `Mathlib/RingTheory/Morita/Basic.lean:57` | Linear equivalence of module categories, not just matching dimensions or simple counts |
| IsArtinianRing.isNilpotent_jacobson_bot | `Mathlib/RingTheory/Artinian/Ring.lean:54` | Nilpotent Jacobson radical for associative Artinian rings |
| IsArtinianRing.isSemisimpleRing_iff_jacobson | `Mathlib/RingTheory/Artinian/Module.lean:641` | Semisimplicity iff radical zero under Artinian hypotheses |
| CategoryTheory.Abelian.Ext | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118` | Native Ext carrier under HasExt; linear structure in the adjacent Linear module |
| ModuleCat HasExt instance | `Mathlib/Algebra/Category/ModuleCat/Ext/HasExt.lean:27` | Native module-category Ext with the displayed smallness/universe condition |
| TauCeti.pathAlgebra; pathAlgebraBasis | `TauCeti/RepresentationTheory/Quiver/PathAlgebra/Basic.lean:209`, :719 | Path Finsupp with actual later-factor-first multiplication; basis already exists over a semiring |
| TauCeti.PathAlgebra.adjoin_vertexIdempotents_union_arrows | Same file, :1071 | Correct generating set, including vertices |
| TauCeti.Quiver.IsAcyclic; finite_paths_of_isAcyclic | `TauCeti/RepresentationTheory/Quiver/Acyclic/Basic.lean:40`; `FinitePaths.lean:83` in that directory | Closed paths are nil; finite vertices and arrows imply finitely many paths |
| TauCeti.QuiverRep | `TauCeti/RepresentationTheory/Quiver/Representation/Basic.lean:53` | Native path-category functor carrier |
| TauCeti.quiverRepEquivalence | `TauCeti/RepresentationTheory/Quiver/Representation/AsModule.lean:574` | Equivalence with left path-algebra modules; inverse is module-to-representation at :581 |
| TauCeti.IsFinDim; dimVector | `TauCeti/RepresentationTheory/Quiver/Representation/FiniteDimensional.lean:66`; `DimensionVector.lean:48` in that directory | Pointwise k-finiteness and actual finrank vector |
| TauCeti.IsIndecomposableModule; isLocalRing_end_of_isIndecomposable | `TauCeti/RingTheory/KrullSchmidt/Indecomposable.lean:86`, :266 | Same submodule predicate and the finite-length local-ring theorem |
| TauCeti.exists_indecomposable_decomposition | `TauCeti/RingTheory/KrullSchmidt/Existence.lean:178` | The same internal Finset decomposition |
| TauCeti.exists_equiv_linearEquiv_of_finset | `TauCeti/RingTheory/KrullSchmidt/Uniqueness.lean:228` | The same permutation/isomorphism uniqueness |
| TauCeti.exists_projectiveCover | `TauCeti/Algebra/Module/ProjectiveCover/ModuleCat.lean:128` | More general Artinian-base/finite-algebra theorem; its particular universe packaging is retained |
| TauCeti.IsBasic; isBasic_iff_isReduced | `TauCeti/RingTheory/Semisimple/BasicAlgebra.lean:184`, :222 | Semisimple-and-reduced radical quotient; equivalence with reducedness when semisimplicity is supplied |
| TauCeti.IsAdmissibleIdeal | `TauCeti/RepresentationTheory/Quiver/AdmissibleIdeal/Basic.lean:102` | Two-sided ideal between arrow-ideal powers; no replacement by Jac(kQ) |
| TauCeti.eulerForm; titsForm | `TauCeti/RepresentationTheory/Quiver/EulerForm.lean:57`, :99 | The README's integer formulas, bundled as bilinear/quadratic forms |
| TauCeti.vertexPreReflection; vertexReflection | `TauCeti/RepresentationTheory/Quiver/Reflection/DimensionVector.lean:67`, :132 | Polar-form formula; genuine automorphism requires no loop at the vertex |
| TauCeti.incomingSum; reflectionFunctor; dimVector_reflectRep | `TauCeti/RepresentationTheory/Quiver/Reflection/Representation.lean:146`, :475, :687 | Kernel reflection and dimension theorem with local finiteness and surjectivity hypotheses |
| TauCeti.IsFiniteRepType | `TauCeti/RepresentationTheory/Quiver/FiniteRepType/Basic.lean:87` | Same finite-dimensional indecomposable skeleton; no need to redefine it |
| TauCeti.isFiniteRepType_iff_titsForm_posDef | `TauCeti/RepresentationTheory/Quiver/FiniteRepType/Gabriel.lean:100` | Arbitrary-field Gabriel theorem with connected underlying graph |
| TauCeti.gabrielIndecomposableEquivPositiveRoot | `TauCeti/RepresentationTheory/Quiver/FiniteRepType/Correspondence.lean:78` | Actual finite-dimensional indecomposable/root equivalence |
| TauCeti.AuslanderReitenTranspose | `TauCeti/Algebra/Module/AuslanderReiten/Transpose.lean:103` | Actual cokernel of opposite-linear precomposition; forming it needs a map, while identifying it with the transpose of M needs presentation hypotheses |
| TauCeti.AuslanderReitenTranslate | `TauCeti/Algebra/Module/AuslanderReiten/Translate.lean:111` | Actual k-dual of the transpose, with the induced left A-action |
| TauCeti.IsMinimalProjectivePresentation.nonempty_linearEquiv_auslanderReitenTranslate | Same file, :244 | Independence up to A-linear equivalence for two minimal projective presentations of the same module; not an AR-duality theorem |
| TauCeti.IsIrreducibleMorphism | `TauCeti/CategoryTheory/IrreducibleMorphism.lean:127` | Same split-factorization predicate on a general category |
| CategoryTheory.ShortComplex.IsAlmostSplit | `TauCeti/CategoryTheory/AlmostSplit/Sequence.lean:129` | Short exactness and left/right almost-split maps; use the intended finite-dimensional category |
| TauCeti.QuiverRep.eulerForm_eq_finrank_hom_sub_finrank_coker | `TauCeti/RepresentationTheory/Quiver/Representation/HomDifferential.lean:149` | Finite vertex/arrow and vertex-space hypotheses; a cokernel dimension identity, not by itself the promised Ext comparison |

Object searches across Mathlib for path algebra, Krull–Schmidt, projective covers, injective envelopes, reflection functors and almost-split sequences found only the unrelated Krull–Schmidt warning in `Mathlib/CategoryTheory/Preadditive/Mat.lean:164` and a Lie-algebra “almost-split-signature” phrase. Thus the Mathlib-only absence discussion does not excuse overlooking the Tau Ceti implementations. There is also pinned partial Ext-Euler theory for vertex projectives (`TauCeti/RepresentationTheory/Quiver/Representation/Projective/ExtEuler.lean:78` and :87); I did not mistake that special case for the general Ext identity.

### Ownership and supplier order

The prescribed object search (`roadmaps grep`) was run across the indexed open roadmap heads and main, with separate searches of board-package READMEs and plans. I opened the relevant supplied QuiverRepresentationsPartII and McKaySkewGroup heads through `roadmaps show` and checked their supplied files. I used main, at `fa41b3747f56d4e77bd69e7099c1be4f2e4959ba`, for existing supplier roadmaps rather than substituting an open revision.

The target has **two outgoing roadmap suppliers**, RootSystems and SemisimpleAlgebras. All its cross-roadmap links resolve to these; there is no ArtinAlgebras supplier sentence at this head. The family index names the same quiver/root relationship.

- **RootSystems on main:** `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:224` supplies positive roots in Layer 1; :228 states unrestricted simple-root lowering. Layer 5 at :321 supplies Dynkin data, finite-type classification and realization, with the actual names `existsUnique_dynkinType` at :341 and `exists_rootPairing_of_dynkinType` at :342. These are real suppliers. The sink-restricted lowering claim in R07 is not one of their contracts. Replace the vague backticked `classification` label by the actual target and section; cite the Weyl-action layer explicitly.
- **SemisimpleAlgebras on main:** `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md:90` lists Wedderburn inputs, and :125–131 specifies the simple/block/primitive-idempotent dictionary. Consume that semisimple theory. Lifting primitive idempotents through a finite-dimensional radical and the quiver-specific bound-algebra presentation remain this base roadmap's scope, except where already implemented at the pin.
- **QuiverRepresentationsPartII at the supplied head:** `TauCetiRoadmap/QuiverRepresentationsPartII/README.md:7` and :75–79 consume this base's Layers 1, 2 and 5. Its new objects are interval/graded-window and multisegment duality constructions, not another base Gabriel theorem. Its operator convention sends degree 0 to degree 1 with E₂₁, matching the later-factor-first A₂ witness. Its Lean namespace is distinct.
- **McKaySkewGroup at the supplied head:** `TauCetiRoadmap/McKaySkewGroup/README.md:76` imports the base quiver, bound-path-algebra, projective and Morita theory. Its skew-group and deformed-preprojective constructions do not justify redeclaring that base theory here.
- **GrothendieckEulerForms on main:** `TauCetiRoadmap/GrothendieckEulerForms/README.md:11` explicitly leaves path algebras, covers, simples, Cartan matrices and quiver Ringel forms here. Its :77–79 column-projective convention is the transpose of this roadmap's row-projective convention; the needed adapter is described in R04.
- **CountingBundlesAndHallAlgebrasOfCurves package:** `packages/CountingBundlesAndHallAlgebrasOfCurves/README.md:67` consumes this base's quiver/module and Krull–Schmidt theory for the Kronecker application. It does not claim ownership of another generic quiver carrier.

Thus this existing base folder is the appropriate owner of the remaining **quiver-specific** mathematics. Its extensive duplication is against landed libraries, not evidence that the entire folder should be rejected as someone else's new scope. No duplicate fully qualified target name was found in the distinct supplied Part II and McKay files or the board-package Lean files searched. The indexed search also surfaced ArtinAlgebras, but this brief supplies no ArtinAlgebras checkout; its open-head details were not used as a supplier contract or independently audited here.

There are **zero per-target Needs lines** in the target README and no declared supplier gaps. Its coarse Ordering section does not provide the requested per-target proof-input contracts. Neither an upward supplier nor a cycle was found. The exact output of the prescribed dependency command was:

```text
depcheck: 204 roadmaps, 1498 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This checks the recognized graph; it does not supply the missing termination argument in R07 or replace the absent contracts in R18. No merge-order or tooling file was changed.

### Headline coverage

| README headline | Acceptance-file status at this head |
|---|---|
| Representations ≌ left path-algebra modules | Admitted data; native equivalence already supplied |
| Fitting and finite-length Krull–Schmidt | Present, already supplied; direct one-result probes close them |
| Projective covers and basic Morita reduction | Cover theorem present; basicness predicate present; the stated basic-Morita reduction is not an acceptance theorem |
| Gabriel's admissible-ideal presentation and Ext-quiver | Present with the wrong ideal; the stated Ext-quiver identification is not part of its signature |
| Heredity and Euler–Hom–Ext identity | No corresponding headline theorem; native module Ext makes the identity statable |
| BGP reflection dimension formula and Coxeter action | Reflection theorem lacks finiteness; Coxeter action appears only in admitted data's prose and is missing the killed case |
| Finite representation type iff ADE / positive Tits form | Present; native arbitrary-field theorem already supplied |
| Positive-root bijection, uniqueness and root-system bridge | Two root/uniqueness theorems plus the rational RootPairing bridge; align domains/names and import the existing correspondence |
| AR translate, stable equivalence and AR duality | Translate is admitted data; no duality theorem or precise missing-carrier explanation |
| Almost-split existence and endpoint-preserving uniqueness for finite-dimensional algebras | Narrowed to finite-path unbound quivers; uniqueness does not assert an isomorphism of sequences |
| Finite AR quiver with partial translation | Only a vertex skeleton and admitted arrow instance; no acceptance theorem linking its arrows/translation to the promised theory |

The full generality must be preserved when replacing false or missing signatures. In particular, neither hereditary algebras alone nor a bare Hom-cokernel dimension calculation substitutes for the promised finite-dimensional bound-algebra AR theory or native Ext comparison.

### Source sample and text actually verified

All **seven README references**, plus **Paquette** from Lean docstrings, were attempted through the prescribed sources service. No individual README locator is flagged “unverified”; instead most exact locators are absent. Four texts were obtained and read for this review. No source manifest was edited.

- **ass — Assem, Simson, Skowroński, Volume 1 (2006):** the sample is **Theorem II.3.7, printed p.64**, at `ass line 3404`; its proof continues onto p.65. It assumes a **basic, connected, finite-dimensional algebra** over the book's standing **algebraically closed** field (`ass line 302`, `ass line 359`). Admissibility uses the **arrow ideal**, Definition II.2.1, p.53 (`ass line 2782`); the proof explicitly distinguishes that ideal in kQ from rad A (`ass line 3425`). The ordinary quiver is defined using a basis of radical blocks in II.3.1, p.59 (`ass line 3138`). Basic Morita reduction is Corollary I.6.10, pp.37–38 (`ass line 2044`), expressed for the finite-dimensional right-module categories. Passing to opposite algebras/modules adapts the source to the roadmap's left-module order; disconnected algebras are assembled by central factors and the zero algebra needs its empty-quiver case. These are explicit adaptations, not hypotheses silently dropped from II.3.7. The source therefore supports the **corrected** presentation theorem and refutes the asserted Jacobson-radical admissibility. [Institutional teaching copy](https://homepage.mi-ras.ru/~avfonarev/2023/fda/Assem%2C%20Simson%2C%20Skowronski%20-%20Elements%20of%20the%20representation%20theory%20of%20associative%20algebras.pdf).
- **etingof — arXiv:0901.0827v5:** Definition 5.20 and Remark 5.21, p.89 (`etingof line 3977`), fix the orthogonal reflection convention. Theorem 5.23, p.89 (`etingof line 3991`), gives the ADE dimension-root correspondence. Definition 5.26, p.90 (`etingof line 4007`), gives the sink kernel construction, and Definition 5.27 gives the source cokernel construction. These corroborate the repaired A₂ example. These are **preprint** locators; the published book's numbering was not presumed identical. [Preprint](https://arxiv.org/abs/0901.0827).
- **bgp — author-hosted English translation:** finite-dimensional vertex spaces over an arbitrary fixed field occur on printed p.17 (`bgp line 22`). Theorem 1.1, pp.21–22 (`bgp line 173`), has the killed-simple/surviving-reflection alternatives. Theorem 1.2, p.23 (`bgp line 247`), concerns changing orientations of a graph without cycles; it is not an unconditional Coxeter dimension identity. [Author's copy](https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/BGG-CoxeterF-Usp.pdf).
- **paquette — arXiv:1104.1195v1:** definitions on p.2 (`paquette line 50`, especially :55–57) distinguish all representations from pointwise finite-dimensional rep(Q,I). Theorem 3.5, p.8 (`paquette line 349`), concerns the latter. It does not certify the roadmap docstring's infinite-dimensional Kronecker example in the full category. [Preprint](https://arxiv.org/abs/1104.1195).

## Not verifiable

- **ars — Auslander–Reiten–Smalø, Representation Theory of Artin Algebras (1995):** the sources service reached Cambridge's book landing page but did not obtain an open text. Its general AR statements could not be checked at an exact book locator. The roadmap supplies none.
- **derksen_weyman — An Introduction to Quiver Representations (2017):** the service reached the AMS GSM 184 landing page but did not retrieve readable text. Its individual Euler/Tits/reflection locators remain uncertified from that book.
- **gabriel — Unzerlegbare Darstellungen I (1972)** and **schiffler — Quiver Representations (2014):** the service classified the lookups as **uncertified**, resolving to paywalled publisher records. Their full texts were not read or requested through another key.
- The scratch missing-reference list retains only ars and derksen_weyman. The initial failed ass lookup was removed from that list after the institutional fetch succeeded. No missing text is needed to establish the counterexamples or the failing gate, and this review is complete rather than parked.
- Admitted operations prevent certifying actual Lean behavior of the private ring, reflection, translate and AR arrows. The 71-row table computes the intended models and labels that limitation; the elaboration result is not a truth certificate. Comparison for copied passages is limited to the sources actually readable here.
- Detailed ownership against an open roadmap without a supplied checkout, including ArtinAlgebras, was not checked. No inferred contract from such a revision is used in the verdict.

## Source issues

- none
