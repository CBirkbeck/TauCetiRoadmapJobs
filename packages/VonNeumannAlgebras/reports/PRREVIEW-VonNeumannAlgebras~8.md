# Review of VonNeumannAlgebras (pull request #889 at dbf8680)

**Verdict:** needs changes

## R01 (P1) — The repaired supplier contract still creates a roadmap cycle

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:41`: “The supply runs in one direction at the level of targets”.

**Claim:** Target-level scheduling does not satisfy the required single direction between roadmaps. This folder supplies measurable fields to OperatorTheory/SelfAdjointSpectralTheory and consumes that roadmap's SA-B85–B86 in return. Both edges remain explicit.

**Witness:** Main `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md:690` consumes V4.0.Fields; this README's lines 210–221 consume SA-B85–B86. Thus VNA → SelfAdjointSpectralTheory → VNA.

**Repair:** Separate the independent field/foundation supplier from its spectral and classification consumers. Keep the independent foundation in the earlier roadmap and put the extensions in Part II, importing OperatorTheory by section; alternatively move the field construction to an earlier owner. Recheck the two displayed edges: they must connect three stages in one direction, not return to the same folder. The mechanical checker below misses this explicit cycle.

## R02 (P1) — Three foundations duplicate BanachAlgebras on main

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:66`: “The `L²` left-regular representation of a locally compact group is owned here”; also V8.RegularL2 at line 1840 and V11.UnitizationCharacters/FourierUniqueness at lines 3035/3053.

**Claim:** Declaring BanachAlgebras a consumer does not transfer its existing targets. Main already owns the regular representation with integrated faithfulness, the unitization character comparison, and Fourier uniqueness. Changing the proof route does not make these different objects.

**Witness:** Main `TauCetiRoadmap/BanachAlgebras/README.md:935` states A7.RegularL2 including faithfulness; lines 433–449 give the unitization comparison; lines 997–1022 give finite-measure/L¹ Fourier uniqueness.

**Repair:** Delete the duplicated general constructions and import BanachAlgebras A3/A7 by name. Retain genuinely von-Neumann-specific adapters. Together with R01, split the independent double-dual embedding from the later Fourier consumers so that importing A7 does not create a second cycle. Controls: on G=ℤ both regular actions send δ₀ to δ₁ under translation by 1; for A=0 both unitized spectra are a singleton; both uniqueness results force an L¹ function with zero transform to be zero. These are the same supplied objects.

## R03 (P1) — Haar scaling reverses both factors in the dimension Check

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:2096`: “any rescaling of Haar measure multiplies `d_n` and divides the covolume by the same constant”.

**Claim:** For μ′=cμ, covolume multiplies by c and formal degree divides by c. The Check reverses both, and contradicts line 2088. Cancellation in their product conceals the error.

**Witness:** At n=2, μ′=2μ gives d′=1/(8π) and covol′=2π/3. The stated rule gives 1/(2π) and π/6 instead. Both products happen to be 1/12.

**Repair:** State c>0, μ′=cμ, d′=d/c and covol′=c·covol. Retain the computed n=2 control: (1/(8π))(2π/3)=1/12. The orthogonality integral doubles, so its reciprocal formal degree halves.

## R04 (P2) — Unital finite-dimensional embeddings need a nonzero source

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:1295`: “every finite-dimensional complex von Neumann algebra embeds unitally and normally into every II₁ factor”.

**Claim:** The conventions explicitly admit the zero algebra. It has no unital homomorphism to a nonzero factor.

**Witness:** For A=0 and a II₁ factor R, a unital homomorphism would give 0=f(0)=f(1)=1_R, while the factor definition requires 1_R≠0.

**Repair:** Require A≠0 for this theorem. Keep the zero algebra as a negative-control Check, with only its zero nonunital map. The corrected theorem still covers ℂ and arbitrary nonzero finite direct sums of matrix blocks; for example embed ℂ⊕M₂ in complementary corners of R with traces 1/2 and 1/2, splitting the latter into two projections of trace 1/4.

## R05 (P2) — The slice-map norm equality omits the zero tensor factor

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:3599`: “extends to a bounded map `A⊗_min B→A` of norm ‖ψ‖”.

**Claim:** Equality needs A≠0; the stated generality includes A=0. The same issue occurs in the symmetric assertion.

**Witness:** A=0, B=ℂ, ψ=id gives A⊗min B=0 and Rψ=0, so ‖Rψ‖=0 but ‖ψ‖=1.

**Repair:** State ‖Rψ‖≤‖ψ‖ for all A and equality when A≠0; specify that A=0 gives norm zero. Apply the symmetric nonzero hypothesis to the other factor. Checks: (A,B,ψ)=(0,ℂ,id) gives 0≤1; (ℂ,ℂ,id) gives 1=1; ψ=0 gives 0=0.

## R06 (P2) — Tomiyama's statable headline is missing from the acceptance test

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:3551`: “Prove Tomiyama's theorem for norm-one projections onto C*-subalgebras”; `Suggested.lean:49` discusses Layer 13 without stating this theorem or naming it as unavailable.

**Claim:** Positivity and bimodularity of a norm-one projection need only native C*-algebras, star subalgebras and continuous linear maps. A new conditional-expectation carrier is unnecessary. The extension foundations are a deep intermediate endpoint, not a Check.

**Witness:** A scratch signature using `StarSubalgebra ℂ (H →L[ℂ] H)`, a continuous linear P, range containment, P restricted to the subalgebra equal to identity, and ‖P‖=1 elaborated successfully, with positivity and bimodularity as conclusion.

**Repair:** State Tomiyama's theorem at its intended C*-algebra generality using native carriers and explicit range/fixing/norm hypotheses, including complete positivity through native matrix positivity. Add only the simple predicates needed. On M₂, diagonal expectation has norm 1, preserves positive matrices, and satisfies E(axb)=aE(x)b for diagonal a,b. Zero P fails ‖P‖=1, and transpose fails the range-fixing hypothesis. No sorry'd conditional-expectation data are needed.

## R07 (P3) — The companion Lean files retain forbidden imports and padding

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/FiniteComplexModularTargets.lean:1` and `ProjectionClosureTargets.lean:1`, with `ProjectionClosureTargets.lean:34` and `:41`.

**Claim:** Both files use Mathlib submodule imports rather than the required single `import Mathlib`, and have the old “suggested forms” docstrings. The projection file repeats a headline already in Suggested and adds a finite-dimensional boundary theorem. The diagonal-only modular file is a convention model, not the general modular headline.

**Witness:** In a scratch combined file, `wot_closure_projections` closes by one `exact` application of Suggested's `closure_isStarProjection_eq_positive_contractions`. The other projection declaration explicitly calls itself “The boundary case”.

**Repair:** Delete both companion files. Keep the general WOT headline in `Suggested.lean` and the finite-block, boundary and diagonal convention material in the README. In particular delete the duplicate/boundary declarations from the acceptance-test material; do not prove them in place. This is the previous R03, still unrepaired. The worker's passing import scanner did not cover these violations.

## R08 (P3) — The convolution Check needs a small-radius hypothesis

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:1879`: “`‖λ(h_ε)f−f‖₂²=ε/3`”.

**Claim:** The displayed four nonoverlapping boundary ramps require 0<ε≤1/2. For larger radii the boundary regions overlap.

**Witness:** With ε=1, hε*f is 1/2 on [0,1], with linear tails on [−1,0] and [1,2]. The squared error is 1/4+1/12+1/12=5/12, not 1/3.

**Repair:** Add 0<ε≤1/2 to the formula and its piecewise description. At ε=1/4 the four ramps contribute ε/12 each, giving 1/12=ε/3. Keep ε=1 as a negative control if stating a formula for all positive radii.

## R09 (P3) — Several headline routes still lack their own source locators

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:326`, V0.SeparableFaithful, and `:1959`, V8.DenseTranslations.

**Claim:** These full theorem/proof-route targets provide dependencies but no theorem, section and page locator for the mathematical result. A generic bibliography and native carrier names do not locate either theorem.

**Witness:** V0.SeparableFaithful runs through line 358 and its Needs line without a source locator; V8.DenseTranslations likewise gives its dense-subgroup argument without one. Both have headline counterparts in Suggested.

**Repair:** Add exact legal source locators supporting the displayed hypotheses and proof inputs, and audit the other prose targets for the same omission. Preserve the nonunital nonzero separable scope of the first theorem and the noncompact, nonmetrizable locally compact scope of the second. Controls remain A=ℂ versus A=0, and ℚ⊂ℝ versus ℤ⊂ℝ; do not silently replace these with narrower source statements.

## Previous findings

Checked before the full pass; none of the supplied previous report's findings was marked not actionable in this package.

- **Previous R01: partly repaired.** The new scope says “the bounded modulus and polar decomposition”, “the bounded Borel calculus” and “the trace-class and Hilbert–Schmidt ideals” belong to OperatorTheory. The exact supplier contracts and membership/affiliation adapters implement that ownership correction. The roadmap-level supply cycle remains (R01 above). New duplicate owners in BanachAlgebras are recorded separately in R02.
- **Previous R02: not independently verifiable at this head.** The previous finding quotes “Two open pull requests build the same folder and declare the same names”. The open-roadmap index still lists the competing folder, but this brief supplies no checkout for that competing head and forbids independently retrieving such heads. Its current Lean declarations were therefore not inspected, and this review does not re-raise the duplicate-name allegation from old evidence.
- **Previous R03: not repaired.** The companion docstrings still say “These are suggested forms”; both companion files and their imports remain. See R07 and the fresh one-tactic probe.
- **Previously repaired R04: remains repaired.** The contract now distinguishes “`ContinuousLinearMapWOT.instLocallyConvexSpace`” from the pointwise instance built from “`UniformConvergenceCLM.locallyConvexSpace`”, and explicitly supplies scalar continuity as a theorem. Those declarations were reopened at the pin.

## Verified sound

This is a full reading of the 4,164-line README and all three Lean files, not an incremental review. The previous report and the complete change record were read as evidence. The root README's writing checklist and CONTRIBUTING were read, together with main BanachSpaceTheory, OperatorTheory and AmenableGroups as shape examples. The prescribed parent README path was absent; the repository-root documents were used.

**Gate and builds.** The worker's gate at dbf8680 passes all listed checks, including the targeted build. The independent command `lake env lean TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean` exits 0 with exactly ten sorry warnings and no other warning. A fresh scratch copy with `#check @name` for all 18 declarations elaborates: eight predicates and ten headline theorems, no dropped required binder. Their expanded signatures agree with the stated scope; no files were changed. The independent dependency output is:

```text
depcheck: 207 roadmaps, 1460 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. This is a false negative for the explicit two-edge cycle in R01, not evidence that that cycle is safe. All Needs lines and supplier-contract paragraphs were read. No declared gap contract exists. The outside-folder diff is empty and the worktree remains clean. No sorry'd data, `set_option`, computational algorithm, or copied source passage was found in the reviewed files.

**Acceptance-test and padding audit.** The README's principal endpoints are bicommutant/Kaplansky/projection closure; finite-factor comparison and trace; predual/normality; type decomposition and standard form; coupling dimension/index; crossed products; discrete-series covolume; Tomita–Takesaki/KMS; weights/cocycles/Connes invariants/duality; Jordan/Dye reconstruction; Arveson/Tomiyama; and injectivity, semidiscreteness, hyperfiniteness and injective-factor classification. Suggested states the first three closure results, projection Schröder–Bernstein, trace existence/uniqueness, simplicity, cyclic/separating duality, the separable faithful representation, and dense-translation ergodicity. Its docstring names the large missing modular, measure, direct-integral, crossed-product and classification carriers. R06 records a statable omitted theorem; the docstring's missing-carrier discussion is not a blanket justification for all omissions. The ten Suggested theorems resisted individual `simp`, `rfl`, and `infer_instance` trials; object searches found no single pinned theorem immediately supplying these exact headlines. All five companion theorems were also tried in scratch: the repeated WOT theorem closes by the single `exact` noted in R07; four others do not close by those three tactics. Failure of a tactic is not a proof of depth. The boundary and diagonal stand-ins are identified by their statements, independently of tactic success.

**Pinned objects inspected.** Paths here are library-relative. Mathlib `Analysis/VonNeumannAlgebra/Basic.lean:45` defines the existential predual class; `:67` defines the concrete algebra using a double-centralizer field, with no nonzero-H requirement; `:118` projects that field, rather than proving WOT bicommutant closure; `:124` and `:139` define the commutant and prove double commutation; `:145` and `:154` give idempotent/star-projection membership criteria. `Analysis/CStarAlgebra/CompletelyPositiveMap.lean:50` and `:65` already define complete positivity on native C*-algebras via all finite matrix amplifications, but do not supply operator-system extension or Tomiyama. This supports reuse rather than a second generic CP definition.

Also reopened: Mathlib `Analysis/LocallyConvex/WeakOperatorTopology.lean:416`, `PointwiseConvergence.lean:125`, `StrongTopology.lean:46`, `WeakDual.lean:231`, and `Topology/Algebra/Module/Spaces/UniformConvergenceCLM.lean:256`. The last is a scalar-continuity theorem requiring bounded test sets, not a default pointwise-topology instance. The target's finite-set application is appropriate. Tau Ceti `RepresentationTheory/Continuous/Integrated/Basic.lean:106` and `:141` define integration for an AddGroup, without requiring commutativity in the definition; commutativity restrictions in later convolution theorems cannot be imported into that definition. `Analysis/Matrix/Frobenius.lean:46` has the real matrix inner product; it does not itself supply the proposed complex modular Hilbert–Schmidt construction. Searches for polar, trace-class, normal functionals, modular operators, CP extension, Tomiyama, bicommutant, conditional expectations and tensor completion were performed by object in both pinned libraries, rather than just by the proposed theorem names.

**Cross-roadmap ownership.** Main was checked at 6cfa9b1. Resolved OperatorTheory/PolarDecomposition PD-A36–A45 and PD-B23–B36; SelfAdjointSpectralTheory SA-B05–B13, B26–B30, B49–B57, B85–B86 and D/E Cayley/PVM targets; OperatorIdeals OI-B29–B41. In particular SelfAdjointSpectralTheory line 676 begins SA-B85, and lines 690/705 consume Fields and its change-of-measure unitary. BanachSpaceTheory B1 (lines 41–73), B2 and B4 supply the advertised Banach duality and nuclear-operator objects. AmenableGroups Layers 5–7 supply the group-theoretic amenability and L¹ inputs. RepresentationTheory/CompactGroups Layer 5, SemisimpleAlgebras Layer 3, and LieHighestWeight line 348 supply Peter–Weyl, finite double centralizers and rank-one Clebsch–Gordan. GlobalNumberFields line 412 starts finite adeles; Completed/ArithmeticDirichletSeries line 337 starts Wiener–Ikehara; OptimalTransport's uniformization and completion passages were resolved. TypeAHeckeAlgebras H3 line 366 consumes the reference-vector tensor product. OperatorAlgebraDynamics lines 46–50 and D1/D4/D5 consume the advertised von Neumann inputs; FactorRigidity at its supplied head, line 87, explicitly lists V2–V13b as suppliers. BanachAlgebras A3/A7 exposes R02.

The required `roadmaps list`, `roadmaps grep` and `roadmaps show` tools were used, with direct reading of the applicable main/supplied-head files. Searches also covered board packages and the supplied operator-algebra sibling checkouts. CStarAlgebras at its supplied head, scope lines 42–48 and C3/C4, explicitly consumes V13a; its nonunital character comparison points to BanachAlgebras A3. Its consumer role does not justify duplicating A3 here. Hilbert tensor completion, direct-integral fields and von Neumann modular/classification theory have no earlier independent owner found in those searches; they belong in the appropriate one-direction foundation/extension split. Ownership against open pull requests whose files were not supplied was not checked. Registry excerpts for this target were not used instead of its exact checkout.

**Computed adversarial pass (140 rows).** Values were recomputed for this review, not replaced by references to previous tables. Mₙ means Mₙ(ℂ), R the hyperfinite II₁ factor, and τ a normalized trace. “Retain” concerns the tested instance, not a proof of the general theorem. The source limitations below remain. Each row records the statement tested, actual values on the compared sides, and the resulting action.

| Statement | Instances | Values on each side / negative control | Result and change |
| --- | --- | --- | --- |
| V0 norm-one state definition | ℂ, M₂, zero algebra | idℂ(1)=‖idℂ‖=1; Tr(I₂)=‖Tr‖=2; on 0 every functional has norm 0 | Retain; zero has no state |
| V0 state positivity and convex structure | ℂ²; x=[[1,−1],[−1,1]] | weights (t,1−t) have mass 1 for 0≤t≤1; x≥0 but x₁₂=−1 | Retain; boundedness alone is insufficient |
| V0 compactness restriction | c₀ point evaluations δₙ | ‖δₙ‖=1, δₙ(x)→0 for each x, ‖0‖=0 | Retain nonunital negative control |
| V0 GNS recovery and cyclicity | tr/2 and x↦x₁₁ on M₂ | GNS dimensions 4 and 2; vector expectations at e₁₁ are 1/2 and 1 | Retain; different states give different models |
| V0.SeparableFaithful / Lean representation headline | A=ℂ and A=0 | scalar action on ℓ² is injective and 1·η=η; zero action has orbit span {0}≠ℓ² | Retain explicit Nontrivial binder |
| V0 finite amplification cyclicity | B(ℂ²) on ℂ²⊕ℂ² | vector (e₁,e₂) has arbitrary image (Te₁,Te₂); (e₁,e₁) always has equal image coordinates | Retain independent-coordinate criterion |
| V1 WOT versus SOT | unilateral shift S on ℓ² | ⟨eᵢ,Sⁿeⱼ⟩→0 but ‖Sⁿe₀‖=1; Cesàro averages have squared norm 1/N | Retain convexity in closure comparison |
| V1 continuous duals | φ(T)=Σₙ≥1 n⁻²⟨eₙ,Teₙ⟩ | φ(I)=π²/6; φ(eₙₙ)=1/n² at infinitely many n, unlike finite-rank coefficient functionals | Retain distinction between ordinary and ultra topologies |
| V1 bicommutant headline | scalar algebra on ℂ²; M₂; H=0 | (ℂI)′=M₂, (ℂI)″=ℂI; M₂″=M₂; zero case both sides singleton and closed | Retain both directions |
| V1 generated star algebra | generator e₁₂ in M₂ | adjoint gives e₂₁; products give e₁₁,e₂₂; generated algebra=M₂ | Retain star closure |
| V1 Kaplansky headline | finite-rank operators plus scalars on ℓ² | PₙTPₙ→T strongly, ‖PₙTPₙ‖≤‖T‖; scalar unit balls are already closed | Retain ball bound and strong topology |
| V1 projection closure / finite coefficient matching | compression C=1/2 to one coordinate | P=[[1/2,1/2],[1/2,1/2]] has P²=P and compression 1/2; (1/2)²=1/4≠1/2 | Retain infinite-dimensional extension requirement |
| Companion finite-dimensional projection closure | H=ℂ; H=0 | projection sets {0,1} and {0}; 1/2 is a positive contraction outside first set | True boundary case, delete from acceptance file (R07) |
| V2 corner and support | p=e₁₁, x=diag(0,2) | pM₂p=ℂp with identity p; support(x)=e₂₂; support(0)=0 | Retain corner unit and zero conventions |
| V2 polar membership adapter | x=2e₂₁ | x*x=4e₁₁, modulus=2e₁₁, v=e₂₁, v·modulus=2e₂₁ | Retain algebra-membership adapter; import generic polar theorem |
| V2 Borel membership adapter | x=diag(0,2), indicator of {2} | f(x)=e₂₂ in W*(x); constant 1 gives I | Retain membership, import functional calculus |
| V2 projection joins | p=e₁₁, q=(1/2)[[1,1],[1,1]] | p∧q=0, p∨q=I; pq≠qp | Retain noncommuting lattice test |
| V2 completed Hilbert tensor | ℂ²⊗ℂ³; zero factor | dimension 6, ‖e₁⊗e₂‖=1·1=1; 0⊗K=0 | Retain genuine completion target |
| V2.RectangularL2 product and cross norm | counting two points × Lebesgue [0,1]; empty rectangle | rectangle mass 2·1=2 and indicator norm²=2; empty mass 0 even against infinite measure | Retain extended product convention |
| V2 rectangular non-σ-finite case | infinite counting space, finite singleton rectangle | κ({s}×[0,1])=1; elementary indicator norm²=1 | Retain named native product construction; no unlicensed Fubini inference |
| V2 reference-vector infinite tensor | ξₙ=e₁; ηₙ=−e₁ | raw finite-prefix overlaps (−1)ᴺ do not converge; phase-corrected overlaps all 1 | Retain phase-sensitive distinction |
| V2 abelian single generator | ℂ², a=diag(0,1) | spectral projections 1−a=e₁₁, a=e₂₂, generated algebra ℂ² | Retain self-adjoint generator example |
| V2 given-measure MASA | two atoms of positive mass | multiplication operators are diagonal; commutant also diagonal; off-diagonal e₁₂ fails to commute with e₁₁ | Retain |
| V2.AbelianClassification | two atoms versus one atom | L∞ dimensions 2 versus 1; atom projections have distinct nonzero supports | Retain control class, not bare carrier cardinality |
| V2.AbelianLocalizable | ℓ∞(I), I uncountable | orthogonal nonzero atoms indexed by I; a finite positive sum has only countably many positive masses | Retain no universal faithful-normal-state assertion |
| V2.AbelianRepresentationMultiplicity | ℂ² on ℂ² and ℂ³ | multiplicities (1,1) versus (2,1); spectral null sets identical but representations inequivalent | Retain multiplicity datum |
| V2.NonmodularProjectionLattice | D(x)ₙ=xₙ/(n+1), yₙ=1/(n+1) | D⁻¹y=(1,1,…)∉ℓ²; B∧C=0, A∨B=H; A∨(B∧C)=A≠C=(A∨B)∧C | Retain explicit failure of modularity |
| V3 matrix units and minimality | M₂; M₂⊕ℂ | e₁₂e₂₁=e₁₁; e₁₁ corner is ℂ; centers have dimensions 1 and 2 | Retain type-I blocks rather than factorizing a direct sum |
| V3 inclusion multiplicities | multiplicity matrix [[2,1],[1,1]] on dimensions (1,2) | target dimensions (4,3); dimension sums are 2·1+1·2=4 and 1·1+1·2=3 | Retain orientation of multiplicities |
| V3 algebraic subgroup basis | H=C₂ in S₃ | three cosets, group-algebra left rank 3; complex dimensions 2·3=6 | Retain finite-index algebraic statement |
| V4.Core trace duality | trace-class h=diag(n⁻²) | Tr(h)=‖h‖₁=π²/6 and φ_h(I)=π²/6; rank-one e₁₁ gives 1 | Retain canonical trace/duality extension of supplied ideals |
| V4.PositivePredual base norm | functional with density diag(1,−1) | positive/negative masses 1 and 1; norm=2, while value at I=0 | Retain base norm rather than absolute value at identity |
| V4.Normality | increasing rank-n projections in B(ℓ²) | Pₙ↑I, vector-state values eventually 1 for each basis vector; singular state killing compacts gives 0 on each Pₙ but 1 on I | Retain nets/normality distinction |
| IsCyclic definition | M₂ on ℂ², ξ=e₁ and ξ=0 | M₂e₁=ℂ²; M₂0={0} | Retain nonzero and zero-vector controls |
| IsSeparating definition | ℂI on ℂ², ξ=e₁; M₂, ξ=e₁ | cIe₁=0 forces c=0; e₂₂e₁=0 although e₂₂≠0 | Retain |
| Cyclic/separating commutant headline | M₂ and ℂI on ℂ²; H=0 | M₂e₁ cyclic=true and e₁ separating for ℂI=true; for ℂI cyclic=false and separating for M₂=false; zero case both true | Retain both implications and degenerate case |
| V4 faithful state versus extension | vector e₁ for ℂI⊂M₂ | φ(cI)=c is faithful on ℂI; extension has φ(e₂₂)=0 with e₂₂≠0 | Retain representation/support qualifications |
| V4.0.Fields measure-change unitary | one point, μ mass 1 and ν mass 2 | U(f)=f/√2, ‖Uf‖²_ν=2·|f/√2|²=|f|²=‖f‖²_μ | Retain square-root direction; ownership cycle R01 |
| V4.0.Decomposition | M₂⊕ℂ | two central support projections (I₂,0),(0,1); fibres M₂ and ℂ | Retain measurable-fibre target; not a second owner of SA-B85 |
| ProjectionEquivalent definition | p=e₁₁,q=e₂₂,v=e₂₁ | v*v=p, vv*=q; v*=e₁₂ reverses orientation | Retain initial-to-final convention |
| ProjectionSubequivalent definition | p=e₁₁,q=I₂ | v=e₁₁ gives v*v=p and vv*≤q; reverse impossible since ranks 2≤1 fails | Retain order direction |
| Projection Schröder–Bernstein headline | p=e₁₁,q=e₂₂ | both subequivalences true, equivalence true, p=q false | Retain equivalence, not equality |
| IsFactor definition | M₂, ℂ², zero algebra | centers ℂI, ℂ², {0}; factor predicate true,false,false because zero identity excluded | Retain explicit nonzero field |
| IsFinite definition | M₂; unilateral shift S in B(ℓ²) | finite matrices v*v=I imply vv*=I; S*S=I, SS*=I−e₀₀ | Retain finite/infinite distinction |
| IsTypeIIOne definition | R, M₂, zero | every nonzero R projection splits; e₁₁ in M₂ has no nonzero proper subprojection; zero fails factor condition | Retain exclusion of type I and zero |
| IsTracialState definition | tr/2 and x↦x₁₁ on M₂ | tr/2(e₁₂e₂₁)=tr/2(e₂₁e₁₂)=1/2; vector state gives 1 and 0 | Retain trace axiom independently of positivity |
| V5 Dixmier averaging | x=e₁₁ in M₂ | (x+uxu*)/2=I₂/2 for coordinate swap u; tr/2(x)=1/2 | Retain normalization |
| Trace uniqueness headline | M₂ versus ℂ² | matrix trace weights forced (1/2,1/2); on ℂ² weights (t,1−t) vary | Retain factor hypothesis |
| Faithful trace existence headline | R, dyadic projection p | τ(1)=1, τ(p)=1/2, τ(p*p)=1/2>0; zero functional has τ(1)=0 | Retain positive faithful normalization |
| Algebraic simplicity headline | R, nonzero dyadic p with trace 1/4 | four equivalent orthogonal translates of p sum to 1; any ideal containing p contains 1 | Retain algebraic rather than closed-ideal endpoint |
| V5 finite-dimensional unital embedding | source 0; source ℂ⊕M₂ | zero source forces 0=1_R; nonzero source has block support traces 1/2,1/2 and two matrix atoms of trace 1/4 | Fails as written; R04 |
| V5.LatticeFinite | M₂; B(ℓ²) graph construction | finite-dimensional modular dimension identity holds; graph row gives A≠C | Retain full finite/infinite criterion |
| V6 semifinite trace | B(ℓ²); rank-n p | Tr(p)=n, Tr(I)=∞; τ on R has τ(I)=1 | Retain finite versus semifinite normalization |
| V6 product trace and II∞ comparison | R⊗B(ℓ²), p trace 1/2 in R | (τ⊗Tr)(p⊗e₁₁)=1/2; (τ⊗Tr)(I)=∞ | Retain extended values |
| V6 tracial standard form | L²(M₂,tr/2), Jx=x* | J²x=x and JL_aJ=R_a*; J fixes positive matrices | Retain conjugate-linear direction |
| V6.FullCornerType | M₂,e₁₁; type-III nonzero full p | e₁₁M₂e₁₁=ℂ finite; in type III no nonzero finite subprojection survives in the corner | Retain nonzero full-support condition |
| V6.LatticeTypes | M₂; diffuse R; ℂ² | rank-one atoms in M₂; none in R; all projections central in ℂ² | Retain separation of atomicity, centrality and finiteness |
| V7.StandardAmplifications | standard M₂ module and column module ℂ² | L²(M₂) has ordinary dimension 4; column module 2, represented by a commutant projection of normalized trace 1/2 | Retain normalized module dimension |
| V7.AmplificationTrace | 0, two copies, infinitely many copies of L²(R) | commutant unit traces 0,2,∞ | Retain sum over arbitrary index sets |
| V7.Dimension | same column module embedded using e₁₁ or e₂₂ in M₂ commutant | both trace values 1/2; equivalent projections, different operators | Retain embedding independence |
| V7.SumsAndCorners | two column M₂ modules; p in R with τ(p)=1/2 | dimensions 1/2+1/2=1; corner trace renormalization divides by 1/2 and thus multiplies by 2 | Retain direction of scaling |
| V7.CountableAndTypeI | nonzero separable versus uncountable amplification | countable infinite and uncountable units both have scalar trace ∞, but Hilbert dimensions differ | Retain warning that ∞ alone does not classify nonseparable modules |
| V7.Index | N⊂N⊗M₂ with product trace; N=N | indices 4 and 1, since L²(M₂) has dimension 4 | Retain unrestricted inclusion endpoint |
| V7.GroupApplications / V8.SubgroupCosets | C₂⊂S₃; {1}⊂ℤ | three cosets give dimension 3; ℤ gives ∞; Σ₂⁻ⁿuₙ has infinitely many coefficients and L² norm² 1/3 | Retain completed rather than algebraically finite expansion at infinite index |
| V8 group-algebra factor criterion | C₂, S₃, F₂ | L(C₂)=ℂ²; center L(S₃) has dimension 3; nonidentity F₂ conjugacy classes infinite | Retain ICC qualification and nonabelian controls |
| V8 nonsingular action convention | two-point flip | α_g(e₁₁)=e₂₂ and α_g²=id; scalar fixed space is one-dimensional | Retain inverse in pullback action |
| V8.RegularL2 bound and faithfulness | G=ℤ, f=δ₋₁+iδ₀+δ₁ | multiplier 2cosθ+i has norm √5; ‖f‖₁=3; λ(δ₁)δ₀=δ₁ | Mathematically consistent, duplicate owner R02 |
| V8 strong versus norm continuity | translations on L²(ℝ) | for s≠0, operator norm distance from identity=2; orbit norm of 1_[0,1] tends to 0 | Retain strong continuity |
| V8 convolution radius Check | ε=1 versus ε=1/4 | error²=5/12≠1/3 at 1; error²=1/12=ε/3 at 1/4 | R08; add small-radius condition |
| V8 modular character | affine group, right multiplier (2,0) | pullback integral factor c=2; inversion multiplier at (2,0)=2, not 1/2 | Retain inversion/adjoint convention |
| V8.LCHRegularNormalBridge covariance | finite group flip acting on ℂ² | λ_gπ(e₁₁)λ_g*=π(e₂₂)=π(α_g(e₁₁)); group element squared gives identity | Retain regular covariance |
| V8 regular versus universal property | M=ℂ,G=ℤ | point character on C(𝕋) evaluates 1 at a singleton-supported representative; the same singleton is zero in Haar L∞ | Retain absence of a normal universal quotient |
| V8.CompactErgodicActions | conjugation on M₂ by SU(2) | Haar average of e₁₁=I₂/2, invariant state gives 1/2, fixed algebra=ℂI | Retain trace conclusion; primary locator remains uncertified |
| Dense-translation ergodicity headline | ℚ⊂ℝ versus ℤ⊂ℝ | ℚ-invariant measurable classes are constant; the ℤ-invariant set ⋃ₙ[n,n+1/2) has both it and complement of positive measure | Retain density, no finite-mass requirement |
| V8.BernoulliArbitraryDiscrete | fair two-symbol base, nonidentity g | equality of labels on N disjoint moved pairs has probability 2⁻ᴺ→0; cylinder mass on k specified sites=2⁻ᵏ | Retain freeness/independence with nontrivial base |
| V9 Weil/covolume | ℝ/ℤ; ℝ/(2ℤ) | fundamental intervals have masses 1 and 2; at μ′=2μ these become 2 and 4 | Retain positive lattice-spacing convention |
| V9 formal degree | compact circle character; ℝ character | normalized circle coefficient norm²=1 so d=1; ℝ coefficient has infinite squared integral so no formal degree | Retain square-integrability hypothesis |
| V9 coupling formula and Haar scaling | PSL₂, weight 2; μ′=2μ | original (1/(4π))(π/3)=1/12; scaled (1/(8π))(2π/3)=1/12 | Product correct; individual factors wrong in Check, R03 |
| V10.ClosedOperators inverse Cayley | T=0; T=1 on ℂ | U=(T−i)/(T+i)=−1,−i respectively; i(1+U)/(1−U)=0,1 | Retain direction and exclude fixed vectors at U=1 |
| V10.Affiliation | multiplication by x on L²(ℝ) | spectral projection at [0,1] is multiplication by 1_[0,1]; it commutes with every bounded multiplier | Retain affiliation/PVM relation |
| V10.TracialLp | h=diag(4,1) with unnormalized trace | ‖h‖₁=5, ‖h‖₂²=17, ‖h‖∞=4 | Retain distinct norms and density construction |
| V10.ModularTheory | h=diag(2/3,1/3), standard matrix model | Δ(e₁₂)=2e₁₂, Δ(e₂₁)=e₂₁/2; σ_t(e₁₂)=2^(it)e₁₂ | Retain modular sign |
| V10.FiniteComplexPowers | same h, z=1 and z=i | β₁(e₁₂)=2e₁₂, β₁(e₂₁)=e₂₁/2; β_i factors have modulus 1 | Retain star locus Re z=0 for noncentral h |
| Companion diagonalPower / diagonalModularPower | h=(2,1), z=0,1; n=0 | h⁰=I; β₁(e₁₂)=2e₁₂; empty matrices form a singleton | Correct model, delete convention stand-in from acceptance material |
| Companion star identity and iff | h=(2,1), z=1; h=(1,1) | β₁(e₁₂)*=2e₂₁=β₋₁(e₂₁); β₁(e₂₁)=e₂₁/2; central h gives β_z=id for every z | Retain README mathematics, R07 file repair |
| V10 KMS strip | h above, a=e₁₂,b=e₂₁ | φ(ab)=2/3, φ(ba)=1/3; φ(σ_i(a)b)=2⁻¹·2/3=1/3 | Retain inverse-ratio imaginary shift |
| V10 finite S/J commutants | S(x)=x* on matrix algebra | SL_aS(x)=xa*=R_a*(x); S²=id | Retain antilinear action, not linear conjugation |
| V10.Hecke conventions | H={1}, noncommuting g,h in S₃ | left convolution δ_g*δ_h=δ_gh; opposite convention gives δ_hg≠δ_gh | Retain left/right distinction and no false commutativity |
| V10.AffineHecke modular ratio | slope 2 | modular character=2; inverse ratio=1/2; for R_(2,0)1_H, Δ-eigenvalue=1/2 | Retain ratio and operator convention |
| V10.AffineAP prime-ratio target | ratio λ=2 and inverse | forward ratio=2, reversed pair ratio=1/2; block lower bounds c/k have divergent sum for c>0 | Retain reciprocal convention; arithmetic source contracts resolved |
| V10.AffineType endpoint | β=1 versus β=0 | prime weights p⁻¹ versus 1; modular ratios at β=1 are rational powers with dense log subgroup; β=0 makes all ratios 1 | Retain positive-temperature endpoint distinction, primary text not certified |
| V11 weights and supports | φ(x)=Tr(e₁₁x) on M₂ | φ(e₁₁)=1, φ(e₂₂)=0; support=e₁₁ rather than I | Retain nonfaithful support reduction |
| V11 weight scaling/cocycle | ψ=2φ for faithful φ | (Dψ:Dφ)_t=2^(it)I, value at t=0 is I; same modular automorphisms | Retain scalar cocycle rather than identifying weights |
| V11 Pedersen–Takesaki density | tracial M₂ and h=diag(2,1) | ψ(e₁₁)=2, ψ(e₂₂)=1; h^(it) conjugation gives ratio 2^(it) | Retain density, not normalized state by default |
| V11 standard cone | M₂ Hilbert–Schmidt model | positive x fixed by J; x=e₁₂ is not positive and Jx=e₂₁≠x | Retain cone and antiunitary distinction |
| V11 expectation criterion | diagonal subalgebra and h=diag(2/3,1/3) | σ_t preserves each eᵢᵢ; E removes off-diagonal entries; φ(E(x))=φ(x) | Retain state preservation and modular invariance |
| V11 Connes S/T | finite factor; III_λ, 0<λ<1 | finite S={1}; III_λ nonzero values λ^ℤ, with 0 also present; period magnitude 2π/abs(log λ) | Retain type distinction, no classification of arbitrary factors by S alone |
| V11 continuous core normalization | scalar algebra with trivial modular action | at s=log 2, θ_s(h)=2h; with trace density e^(−r)dr, substitution gives Tr(θ_s(f))=2Tr(f) | Retain paired sign convention |
| V11 Takesaki duality | trivial action of C₂ on ℂ | first algebra ℂ²; crossed again by dual flip gives M₂=B(ℓ²(C₂)) | Retain crossed-product direction |
| V11.DoubleDualEmbedding | G=ℤ, dual=𝕋 | ev(n)(z)=zⁿ; sup_z abs(zⁿ−1)=2 for n≠0, zero for n=0 | Retain discrete closed embedding; split ownership for later users |
| V11.UnitizationCharacters | A=0 and A=ℂ | external unitized spectra have cardinalities 1 and 2; removing augmentation leaves 0 and 1 points | Correct object already owned by A3, R02 |
| V11.FourierUniqueness | G={1}, finite measures aδ₁,bδ₁ | transforms are constants a,b; equality iff a=b; L¹ zero transform iff scalar 0 | Correct specialization of existing A7 endpoint, R02 |
| V11 inversion/Plancherel convention | finite C₂, normalized Haar | transform of (1,0) is (1/2,1/2); dual counting inverse gives (1,0), L² norm²=1/2 on both sides | Retain positive transform/conjugate inverse normalization |
| V11 ITPFI ratios | product densities diag(2/3,1/3) | single-site eigenvalue ratio 2, inverse 1/2; finite blocks give 2^ℤ; trace density gives only 1 | Retain ratio-set versus tracial boundary |
| V11 flow classification | III_λ with λ=1/2 | flow period abs(log λ)=log 2; reciprocal parameter gives same absolute period but lies outside 0<λ<1 | Retain parameter range; book locators uncertified |
| V12 two projections | p=e₁₁,q=(1/2)[[1,1],[1,1]] | (p−q)²=I₂/2; diagonal compression pqp=p/2 | Retain b=1/2 convention |
| V12 tracial ultrapower ideal | decreasing projections eₙ=1_[0,1/n] in diffuse MASA | ‖eₙ‖₂²=1/n→0, ‖eₙ‖=1; constant 1 has L² norm 1 | Retain Check; “orthogonal projections” means self-adjoint, not pairwise disjoint |
| V12 central sequence / Γ | site-n diag(1,−1) in R | τ(uₙ)=0, ‖uₙ‖₂=1; commutator with any earlier finite head is 0 | Retain nontrivial central sequence |
| V12 nonfactor warning | R⊕ℂ, weights 1/4 and 3/4 | distance² from (uₙ,0) to center≥1/4; every unitary has abs(trace)≥1/2 | Retain distinction from trace-zero Γ unitary |
| V12 free-group estimate | generators a,b and u_a in L(F₂) | ‖u_a u_b−u_b u_a‖₂²=2, while ‖u_a−τ(u_a)‖₂=1 | Retain noncommutative control for central-sequence estimate |
| V12.J.Maps | transpose on M₂ | T(x²)=T(x)², but T(e₁₂e₂₁)=e₁₁ whereas T(e₁₂)T(e₂₁)=e₂₂ | Retain Jordan rather than multiplicative conclusion |
| V12.J.Frame | constant frame function on ℂ³ | f(v)=1 for unit v, frame sum=3; density T=I₃ has Tr(T)=3 | Retain frame weight normalization |
| V12.J.Scalar | μ(p)=Tr(p) on M₃ | orthogonal ranks add: 1+1=2; extension has value 3 on I₃ | Retain bounded finite additivity, not state normalization |
| V12.J.Dye/Bloch boundary | odd nonlinear bijection of sphere: stretch z by factor 2 then normalize | e_x and e_z remain perpendicular as vectors, but (e_x+e_z)/√2 maps to (1,0,2)/√5; dot with e_z changes 1/√2→2/√5 | Retain type-I₂ obstruction; antipodes, hence projection orthogonality, preserved |
| V12.J.Enriched | transpose with states transported by transpose | Tr(T(ρ)T(p))=Tr(ρp); for ρ=p=e₁₁ both values 1 | Retain state/evaluation compatibility rather than arbitrary logic map |
| V12.J.CentralSplitting | identity on ℂ plus transpose on M₂ | scalar block multiplicative; matrix e₁₂,e₂₁ product reversed, e₁₁ versus e₂₂ | Retain central-piece orientation, not one global sign |
| V13a operator system / CP | transpose on M₂ | positive Choi rank-one matrix has partial transpose equal to flip; flip eigenvalue on e₁⊗e₂−e₂⊗e₁ is −1 | Retain CP rather than positivity |
| V13a Arveson extension | state on diagonal M₂ | density [[1/2,c],[conj c,1/2]] has eigenvalues 1/2±abs(c); c=0 and c=1/4 give distinct positive extensions | Retain existence without uniqueness |
| V13a Tomiyama | E(x)=diag(x₁₁,x₂₂) | E²=E, E(I)=I, ‖E‖=1; E(e₁₂)=0; for diagonal a,b, E(axb)=aE(x)b | Retain theorem, add Lean headline R06 |
| V13a injectivity/projection criterion | B(H); diagonal ℓ∞ in B(ℓ²); zero H | identity and diagonal projection have norm 1 when nonzero; zero-space projection has norm 0 | Retain norm-one qualifier for M≠0 |
| V13a corners/expected subalgebras | e₁₁M₂e₁₁ | compression sends I to e₁₁, its corner identity; corner algebra ℂe₁₁ is injective | Retain corner unit rather than ambient-unit requirement |
| V13b.SpatialNorm sum | u=e₁₂⊗e₁₂+e₂₁⊗e₂₁ | u exchanges 11 and 22, u*u projection rank 2, ‖u‖=1; sum of elementary norms=2 | Retain spatial norm, not projective sum norm |
| V13b cross norm | I₂⊗I₂ | operator norm 1=1·1, Hilbert–Schmidt cross norm √2·√2=2 | Retain operator norm |
| V13b representation independence | ℂ² on ℂ² and ℂ³, first coordinate doubled | represented tensor projection ranks 2 and 3, both norms 1 | Retain norm independence, not operator equality |
| V13b slice maps | A=0,B=ℂ,ψ=id; then A=ℂ | map norms 0 and 1, functional norm 1 in both | Fails zero case; R05 |
| V13b spatial inclusion | diagonal ℂ²⊂M₂, x=e₁₁⊗I₂ | domain and ambient operator norms both 1; zero inclusion gives norm 0 on its only element | Retain isometric inclusion, no quotient-exactness claim |
| V13b hyperfinite examples | R finite heads, B(ℓ²) finite corners plus scalar tail, zero | head approximants fix head elements exactly; Pₙξ→ξ; zero sequence generates 0 | Retain sequential scope at separable predual |
| V13b semidiscreteness topology | truncation maps on ℓ∞(ℕ), x=1 | each fixed coordinate error eventually 0; operator norm error=1 for all N | Retain point-ultraweak rather than norm convergence |
| V13b CP factorization | M₂ | identity factors through M₂ with both maps identity, error 0 and norms 1 | Retain matrix-stage normalization |
| V13b Powers–Størmer | a=diag(4,0),b=diag(1,0) | ‖√a−√b‖₂²=1, ‖a−b‖₁=3; a=b gives 0≤0 | Retain inequality, not equality |
| V13b min-norm criterion | M₂ in standard form with right opposite action | multiplication sends e₁₁⊗e₁₁^op to a rank-one compression of norm 1; tensor norm also 1 | Retain opposite-algebra orientation |
| V13b finite-rank Følner criterion | P=I on L²(M₂,tr/2) | rank P=4, Hilbert–Schmidt norm=2, commutators 0; Tr(L_e₁₁)/4=2/4=1/2=τ(e₁₁) | Retain both commutator and trace conditions |
| V13b II₁ hyperfinite uniqueness | dyadic heads M₂⊂M₄⊂R | a matrix element in head k has approximation error 0 at every n≥k; normalized traces agree | Retain separable II₁ qualification from source |
| V13b arbitrary-cardinality reduction | B(ℓ²(I)), I uncountable | finite-rank corner p_F has trace abs(F); sup_F p_F=I with trace ∞, no countable exhaustion of all basis vectors | Retain nets rather than an illicit sequence |
| V13b δ-related tuples | ξ=η and family {1} | Σa*a=Σaa*=1, tuple error 0; conjugating unitary 1 gives distance 0 | Retain normalization; zero family has sums 0 and is excluded |
| V13b equivalence-relation finite control | orbit relation on two equally weighted points | averaging sends (a,b) to ((a+b)/2,(a+b)/2); matrix algebra M₂ is finite-dimensional/hyperfinite | Retain finite instance; CFW proof text not obtained |
| V13b periodic automorphism invariant | α=id on R | outer period 1, implementing unitary 1, obstruction 1 | Retain boundary of periodic classification; no claim this tests the general conjugacy proof |
| V13b bicentralizer definition | tracial M₂ | all constant sequences centralize τ; commuting with every constant matrix forces B(M₂,τ)=ℂI | Retain ordinary bicentralizer normalization |
| V13b Q-stability convention | m orthogonal isometries with φuᵢ=m⁻¹uᵢφ | evaluating at uᵢ* gives φ(uᵢuᵢ*)=1/m; sum of range masses=m·1/m=1 | Retain bimodule-action orientation |
| V13b III₁ product approximation | faithful product state, finite tensor head F | φ=φ_F⊗φ_tail gives state error 0; expectation fixes head operators with operator error 0 | Retain product criterion's intended controls; uniqueness uses cited nontrivial sources |

**Seeded source sample: V13a and V13b.** No README locator is explicitly marked unverified. The following source passages were opened afresh; the table distinguishes the exact source statement from extensions requiring additional proof.

| Target | Locator read | Hypotheses and result of comparison |
| --- | --- | --- |
| V13a Arveson extension | arveson1969 line 296, Theorem 1.2.3, printed p. 149, [Acta paper](https://www.isibang.ac.in/~soumyashant/misc/collected-works-of-arveson/1960s/1969_Subalgebras_of_Cstar_algebras.pdf) | Norm-closed self-adjoint linear subspace containing the ambient identity; arbitrary Hilbert target; CP extension. The README also allows a nonclosed operator system: bounded CP maps first extend to its norm closure. Its preceding boundedness target supplies that step. No separability or uniqueness is asserted by the source. |
| V13a Tomiyama | tomiyama1957 line 19, Theorem 1, printed p. 608, [publisher PDF](https://www.jstage.jst.go.jp/article/pjab1945/33/10/33_10_608/_pdf); peterson line 3948, Theorem 6.2.1, p. 98 | The original theorem gives positivity, bimodularity and Schwarz for a norm-one projection from a unital C*-algebra to a C*-subalgebra. Peterson lines 3962–3971 supply complete positivity in the unital subalgebra setting. Neither supplies automatic normality of every projection, correctly avoided here. |
| V13a extension and injectivity criterion | peterson line 4114, Theorem 6.3.6, and line 4127, Corollary 6.3.7, p. 102, [notes](https://math.vanderbilt.edu/peters10/teaching/spring2013/vonNeumannAlgebras.pdf) | CP maps into B(H), finite-compression net, and a CP retraction criterion. The source's Lemmas 6.3.4–6.3.5 contain normalization errors recorded below; the correctly stated extension theorem is also supported by Arveson's original text. |
| V13b finite approximation input | anantharaman-popa line 7325, Theorem 10.2.8, and line 7413, Theorem 10.3.1, printed pp. 164, 166, [draft](https://www.math.ucla.edu/~popa/Books/IIun.pdf) | Powers–Størmer is given with a faithful normal semifinite trace and bounded positive inputs of integrable square; the README's L¹ version needs its truncation extension. The finite-rank criterion includes compressed trace approximation as well as small commutators. |
| V13b separable hyperfinite uniqueness | anantharaman-popa line 8261, Lemma 11.2.1, p. 185; line 8294, Theorem 11.2.2, p. 186 | Dyadic matrix approximation is in a II₁ factor. The equivalence with R requires the source's separability hypothesis, which the README's classification conventions retain. These locators do not alone prove the arbitrary-algebra injectivity/semidiscreteness reduction. |
| V13b uniform bimodule theorem | haagerup1989 line 183, Theorem 2.3, printed p. 269, [publisher PDF](https://msp.org/pjm/1989/137-2/pjm-v137-n2-p03-s.pdf) | δ depends on tuple length and ε, uniformly over normal Hilbert bimodules and von Neumann algebras. The two normalization sums and unit-vector assumptions are essential, and are present in the roadmap. |
| V13b III₁ proof inputs | haagerup2016 line 49, Theorems 1.1–1.2, p. 1; line 284, Theorem 2.8, p. 6; line 313, Theorem 3.1, p. 7; line 635, Theorem 4.2, p. 13; line 1347, Lemma 5.5, p. 24; line 1540, Lemma 5.6, p. 26, [arXiv v1](https://arxiv.org/pdf/1606.03156v1) | The III₁ statements retain separable predual, injectivity where used, faithful normal states, and Q-stability where used. Lemma 5.5 explicitly uses bicentralizer triviality. The roadmap now develops that input before the product-state argument. Theorem 3.1's modular error is δ times abs(t), agreeing with the target. |
| V13b periodic obstruction | connes-periodic line 647, Theorem 5.1, printed p. 56; line 784, Theorem 6.2, p. 60, [author scan](https://alainconnes.org/wp-content/uploads/szego.pdf) | The invariant-matrix construction and classification by outer period/root-of-unity obstruction are present. OCR damages formulas; the prose distinguishes conjugacy from outer conjugacy, as does the roadmap. This does not independently verify the later trace-scaling cocycle-removal theorem. |
| V11 inputs consumed by V13 | hiai line 2698, Theorem 6.6, p. 56; line 3268, Theorem 7.6; line 4606, Theorem 10.7, p. 91, [arXiv v1](https://arxiv.org/pdf/2004.02383v1) | The state expectation theorem needs a faithful normal state; the weight extension requires semifiniteness on the subalgebra. The cocycle order and the duality action were read, alongside the matrix and finite-group controls above. These are inputs, not replacements for the general classification references. |

## Not verifiable

The review is complete with a needs-changes verdict; it is not parked for source access. Missing sources are not counted as mathematical counterexamples. All cited bibliographic works encountered were submitted through the source service; no paywall was bypassed and no source text was placed in the repository. The missing-reference request was consolidated, keeping one key per work and removing requests resolved by a second legal URL.

- **General V13b spatial norm and injectivity/semidiscreteness reduction:** Takesaki I IV.4.9, Takesaki III XV.3 (Theorem 3.1/Definition 3.5), and Runde 6.4.14/6.4.24–25 were classified by the service as paywalled/uncertified. Their exact text was not read. The finite-matrix tests and the AP finite-factor chapter do not certify these unrestricted results.
- **Classification and general modular/weight book inputs:** Takesaki I–III, Haagerup 1985 and 1987, Connes–Størmer 1978, Bost–Connes, Wassermann III, Goodman–de la Harpe–Jones, and Arveson’s Invitation were returned as uncertified. No request for already-uncertified works was added. Haagerup 2016 supports its cited statements, but is not verification of every lemma in the 1985/1987 papers.
- **CFW measured-relation proof:** the IHES URL ending in `.pdf` returned a catalogue HTML page, not the paper. The service's successful fetch therefore did not verify Definitions 5–6, Proposition 7, Lemmas 8–9 or Theorem 10. AP §12.5 was available only as the probability-preserving comparison. The nonsingular source proof remains unread; a missing entry records this distinction.
- **Other unsuccessful legal retrievals:** Reed–Simon I (VI.6, VIII.3–4); Rudin, Functional Analysis (13.19); Rudin, Fourier Analysis on Groups (§§1.5–1.7); Folland (§4.4); Sakai (4.1.6); Haagerup 1979 (Theorems 1.2–1.3); Laca–Raeburn; Neshveyev; Wassermann I; Connes–Takesaki; Araki–Woods; Connes–Woods; Gleason; Høegh-Krohn–Landstad–Størmer. Attempts used the source service's title search or the README's publisher/DOI/author/institutional link. Failures included Wiley HTTP 403, publisher landing pages without accessible text, and legal searches with no result. Their individual attempts and locators are in the consolidated missing-reference request. In particular the CFW, Connes–Woods, Araki–Woods and Connes–Takesaki portions of the sampled V13b cannot be source-certified.
- Connes 1973/1975 and the original 1985 bicentralizer paper were fetched legally. Only the specifically discussed locators and theorem comparisons are certified here; availability alone is not certification of every proof step or every page reference in the README.
- The current competing VonNeumannAlgebras head underlying previous R02 was outside the supplied-checkout scope. No conclusion about its current declarations is drawn.

## Source issues

- **Error** in peterson at Lemma 6.3.4, printed p. 101: the source says a normalized associated matrix functional forces the map to be unital; it should be unital exactly when its scalar-matrix restriction is normalized trace; affects a stated result.
- **Error** in peterson at proof of Lemma 6.3.5, printed p. 102: the source says an arbitrary CP map yields a state and has a unital CP extension; it should be extended as a positive functional with its actual normalization, preserving the matrix marginal; affects the proof.
- **Misprint** in peterson at injectivity definition after Theorem 6.3.6, printed p. 102: the source says the extended map has codomain the source operator system; it should be the target operator system F; affects nothing.

For the first error, A=ℂ and φ(1)=diag(2,0) give the associated state a↦a₁₁ but φ(1)≠I₂. For the second, φ=2idℂ is CP and cannot have a unital extension agreeing on 1. These source mistakes are not copied into the roadmap's Arveson statement and do not invalidate the theorem as stated there.
