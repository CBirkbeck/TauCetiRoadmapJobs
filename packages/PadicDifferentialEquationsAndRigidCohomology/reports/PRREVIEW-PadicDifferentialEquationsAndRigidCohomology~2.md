# Review of PadicDifferentialEquationsAndRigidCohomology (pull request #1002 at 186e611)

**Verdict:** needs changes

## R01 (P1) — The affine-space example is false in dimension zero

**Location:** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:8882`, RD.5.10(b): “the naive (convergent) de Rham cohomology of `A^n` is that of the closed polydisc and is infinite-dimensional over `K`”.

**Claim:** There is no restriction on n in this assertion or its hypotheses. Dimension zero is included. The distinction between convergent and overconvergent cohomology does not occur there.

**Witness:** For n=0, the closed polydisc is Sp K. Its de Rham complex is K in degree zero, with all other terms zero. Its cohomology dimensions are 1,0,0,…, not infinity.

**Repair:** State that H¹ of the closed n-polydisc is infinite-dimensional for n≥1. Keep n=0 as a negative-control Check with dimensions 1,0,0,… . For n≥1, the first-coordinate inclusion and evaluation of the other coordinates at zero split the one-disc de Rham complex, so the one-disc counterexample supplies the intended nonfiniteness. The corrected statement excludes exactly the point that refutes the original.

## R02 (P2) — The rigid Kloosterman construction stops at the primes convenient for its proof

**Location:** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:13635`, RD.6.94, and RD.6.95 at line 13657: “`p` odd and `p ∤ n + 1`”; the latter also says “the geometric construction is valid for every `p`”.

**Claim:** The construction, concentration, trace and purity targets actually provided by RD.6.94–RD.6.97 impose these exclusions. A sentence asserting an all-prime construction supplies neither its target nor its proof inputs. Importing the all-characteristic *scalar bound* from CongruenceSpectralGap does not construct the missing rigid coefficient. This conflicts with the general-library requirement.

**Witness:** At p=2, rank 2, z=1, the unique unit tuple gives raw sum 1 and the required trace −1. RD.6.94–RD.6.95 cannot instantiate this case. Xu–Zhu Theorem 1.2.4 includes characteristic two.

**Repair:** Give the geometric rigid construction, Frobenius, rank, fibre comparison and trace in every characteristic and rank, with their own precise proof inputs. Separate refinements that genuinely require tame pullback from these general targets. Use p=2, rank 2, z=1 as a Check: trace −1, determinant 2, polynomial 1+T+2T². Do not remove the restrictions merely from the present tame proof.

Ownership must be reconciled at the same time: `packages/KloostermanMomentsAndPotentialAutomorphy/design/README.md:3` claims the all-rank construction, and `packages/KloostermanSheavesAndBesselIsocrystals/design/README.md:5` assigns the scalar rigid realization to it. They are downstream designs, not allowable upward suppliers here. Place the common construction with one earlier owner and have the later extensions consume it. The source supporting the omitted range is `ref-bessel-f-isocrystals-for-reductive-groups` line 245, Theorem 1.2.4, preprint p.5; lines 345–349 explicitly discuss the rank-two characteristic-two case. CongruenceSpectralGap §4.2a already tests its raw sum over 𝔽₂.

## R03 (P2) — The FDRep supplier contract drops the group hypothesis for rigidity

**Location:** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:297`: “Finite-dimensional representations of a monoid as a rigid monoidal category”.

**Claim:** Finite-dimensional representations of an arbitrary monoid are monoidal but need not have duals. The finite-group application is legitimate; the general contract asserted here is not.

**Witness:** Let the free monoid generator act by zero on K. Equivariance of evaluation would force ev(0⊗gφ)=ev(v⊗φ), hence ev=0. The triangle identity then gives 0=id_K. The pinned rigid instances require a group.

**Repair:** Describe `FDRep K G` as the category of finite-dimensional monoid representations, and assert rigidity over a field when G is a group. Cite `Mathlib/RepresentationTheory/FDRep.lean:63` and `Mathlib/CategoryTheory/Action/Monoidal.lean:161`. The latter's dual action at line 196 uses g⁻¹. The zero-action example is then excluded; a one-dimensional group character χ has dual χ⁻¹, with evaluation multiplier χ(g)χ(g)⁻¹=1. Finiteness of G is unnecessary for this particular assertion.

## R04 (P3) — Undeclared names still appear as promised Lean API

**Location:** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:3410`, “`IsRationalType.parameter_iff`”; line 6201, “the statement `IsocDagger.isStack`”; RD.6.95's API also names `kloostermanIsocrystal`.

**Claim:** These are presented as this roadmap's declarations, but its acceptance file declares only Arabia's theorem, `CyclicFor`, and the cyclic-vector theorem. This is the remaining part of previous R07, not a request to expand the Lean catalogue.

**Witness:** `Suggested.lean:53`, `:82` and `:88` are its three declarations. Neither named theorem appears there or in the pinned libraries; the resolver independently identifies both qualified names as unresolved.

**Repair:** Replace these API labels and statement references with mathematical prose, and apply the same rule to the remaining own-name API bullets. Keep the actual three acceptance-file names. Do not add catalogue declarations to `Suggested.lean`. On the two quoted instances this removes the nonexistent declaration claim while retaining the parameter and Zariski-descent targets unchanged.

## R05 (P3) — The printed layer order precedes a required theorem

**Location:** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:6940`: “This is a corollary of §RD.5.8, preceding RD.3.49 in the proof order.”

**Claim:** RD.3.48a and RD.3.49 sit in Layer RD.3 but require full faithfulness in RD.5.8. The explanation correctly avoids a mathematical cycle, yet the promised layer-by-layer build order is still not the displayed order.

**Witness:** The explicit prerequisite chain is RD.5.8 → RD.3.48a → RD.3.49 → RD.3.50. The first edge goes backwards across two printed layers. The parsed internal graph has no cycle.

**Repair:** Place the dependent idempotent/direct-summand/descent block after full faithfulness, or split and reorder the layers so that this chain is displayed in build order; update references consistently. The same graph-projector calculation still applies: [[1,0],[h,0]]²=[[1,0],[h,0]], and full faithfulness lifts its specified horizontal Frobenius-equivariant entry h before splitting it. Do not repair the order by assuming the desired descent theorem.

## Verified sound

The following records the checks actually performed. Source agreement and successful examples do not constitute a proof of every target. In particular, the limits in **Not verifiable** are part of this review, not a clean certification of the remaining 538-target document.

### Previous findings, checked first

All eight findings from the review at 78e1762 were compared with this head. Seven are repaired and one is partly repaired. The quoted replacements below are passages of this head.

| Previous finding | Replacement/evidence at this head | Disposition |
| --- | --- | --- |
| R01, duplicated weight extraction | `Suggested.lean:38`: “is `degreeFactorExtraction` of DeligneWeightsAndPurity §4.4 and is not restated here.” The RD7 declaration is absent; the README's companion-matrix adapter remains at RD.7.5. The supplier's §4.4 was reopened. | Repaired. |
| R02, 538 HTML anchors | Target headings now use Markdown, for example “### RD.0.1 Laurent, Robba and Amice coefficient carriers”; the gate reports residue=0. | Repaired. |
| R03, malformed headings | README:2554 “### RD.1.14”; :4822 “### RD.2.25a”; :5089 “### RD.2.35”. All three are parsed as targets. | Repaired. |
| R04, invented crystalline declaration names | README:532 “the site comparison of the convergent logarithmic embedding complexes”; :533 “its log rigid Hyodo–Kato complex”. CR.6.4 and CR.6.5 exist with these objects. | Repaired. |
| R05, nonexistent R3.36 | README:7245 now says “supplied by AdicSpacesPartIII §R3.6”. Main's R3.6 supplies continuous differentials. | Repaired. |
| R06, wrong cyclic-vector source | RD.1.6's Check now identifies “Kedlaya–Xiao, Differential modules on p-adic polyannuli, Lemma 1.2.4”; that lemma is at `kedlaya-xiao` line 224. | Repaired. |
| R07, undeclared own API names | Numerous old labels are gone, but `IsRationalType.parameter_iff` and `IsocDagger.isStack` remain. | Partly repaired; R04 above. |
| R08, layer identifier and module title | The target is now “### RD.5.78a”; `Suggested.lean:4` ends “target signatures”. | Repaired. |

### Gate, dependencies, shape and elaboration

The worker's gate for the exact reviewed head passes every listed check, including the targeted module build, imports, sorry-data, stray-files and outside-folder changes. The diff outside this folder is empty. The folder is newly added relative to main, rather than a revision of an existing main roadmap. Its tracked files are README.md, Suggested.lean and metadata.toml.

I separately ran the prescribed dependency check. Its complete output was:

```text
depcheck: 209 roadmaps, 1481 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Parsing all 538 target sections and their explicit local `*Needs:*` references found no missing RD target identifier and no internal target cycle. This does not erase the presentation defect R05. All 67 sections explicitly labelled **Definition** have at least three Check bullets; that count does not establish that every bullet is discriminating. Each of the eight layers has Examples and Dependencies sections. The normative repository README, CONTRIBUTING, and the main RestrictedPowerSeries and NewtonPolygons roadmaps were read for form.

`lake env lean` on the original `Suggested.lean` succeeded with only its two `sorry` warnings. A separate scratch copy with `#check @` for all three declarations also elaborated. No binder was lost: Arabia carries the commutative-ring, algebra, smoothness and scalar-tower data explicitly; the cyclic theorem carries characteristic zero, finite dimension, nonzero derivation and the Leibniz law. The definition's quantifier over a basis of `Fin n` really fixes its length. README and elaborated signatures agree for these three names. No worktree file was edited.

The two sorried theorems were each tried with `simp`, `rfl`, and `infer_instance` on scratch copies. All six attempts failed; no declaration closed. Object searches did not identify a single pinned lemma proving either whole theorem. `CyclicFor` is a real predicate needed by the cyclic-vector headline, not sorry'd data. No padding finding is made against these three declarations.

### Headline coverage and ownership

The README's six end results are slope filtration (RD.2.7), local monodromy (RD.2.31–RD.2.33), finite-dimensional rigid cohomology (RD.5.76), Poincaré duality (RD.5.89), p-adic Weil II (RD.6.85), and equality of crystalline, rigid and ℓ-adic Weil factors (RD.7.7–RD.7.9). Its layer table also promises Arabia lifting; cyclic vectors, radii and Dieudonné–Manin; frame independence, convergence and Katz–Crew; Monsky–Washnitzer, Gysin and logarithmic comparisons; descent, Künneth, full faithfulness and semistable reduction; trace, Fourier and Kloosterman results; and coefficient/lattice comparisons.

The two statable acceptance theorems here are Arabia lifting and cyclic vectors, and both are present. The module docstring explains the missing analytic coefficient/cohomology carriers for the other groups above. In particular the pinned Witt-vector isocrystal is not an overconvergent coefficient on a variety, and its rank-one classification does not state general Dieudonné–Manin. No weakened stand-in for the six end results remains. The scalar factor extraction belongs to DeligneWeightsAndPurity; the scalar Kloosterman sum and its bound belong to CongruenceSpectralGap. R02 concerns the missing general *rigid realization*, not ownership of that scalar bound.

Object searches used `roadmaps grep` over main and the supplied open-head index, direct pinned-library searches, and searches of board packages for Robba rings, cyclic vectors, Arabia lifting, rigid cohomology and Kloosterman objects. FormalConnectionsOpers' F6 consumes the differential-module theory here; it does not justify a second cyclic-vector declaration. NoncommutativeAndEquivariantIwasawa F.6 owns the specified discretely valued slope/period interface; this roadmap explicitly imports it and retains its broader analytic targets. The board's later Kloosterman designs require ownership coordination as described in R02. This is an object audit of the identified interfaces, not a claim that all 538 targets were individually compared against every package.

### Pinned declarations inspected

The following 12 entries record concrete library locations and what was read, rather than relying on names alone. Library paths are relative to their pinned repositories.

| File and line | Contract inspected |
| --- | --- |
| `Mathlib/RingTheory/Smooth/Basic.lean:125` | `Algebra.FormallySmooth.exists_lift` assumes a nilpotent ideal. It does not subsume Arabia's arbitrary-ideal étale-neighbourhood theorem. |
| `Mathlib/RingTheory/Smooth/Basic.lean:539` | Smooth algebra bundles formal smoothness and finite presentation. |
| `Mathlib/RingTheory/Etale/Basic.lean:205` | Étale algebra bundles formal étaleness and finite presentation. |
| `Mathlib/RingTheory/WittVector/Isocrystal.lean:180` | `isocrystal_classification` is rank one, with algebraically closed characteristic-p base. |
| `Mathlib/RepresentationTheory/FDRep.lean:63` | Monoid actions on finitely generated module objects; over a field these are finite-dimensional. R03 records the rigidity restriction. |
| `Mathlib/CategoryTheory/Action/Monoidal.lean:161` | Group binder for the rigid instances; dual action at line 196 uses inversion. |
| `Mathlib/Topology/Algebra/InfiniteSum/DiscreteConvolution.lean:307` | Total tsum convolution; it is not by itself an analytic Laurent-series ring construction. |
| `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean:41` | Proper morphisms carry the separation, finite-type and universal-closedness conditions used by the supplier contract. |
| `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean:620` | Legendre's digit-sum formula assumes primality; natural subtraction is bounded by the digit-sum identity here. |
| `TauCeti/Algebra/Coalgebra/Comodule/Finite/Rigid.lean:47` | Rigidity of finite comodules uses a field and Hopf-algebra structure. |
| `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean:138` | `pointsFunctorIsoTensorAutFunctor` starts from a supplied Hopf algebra; it is not reconstruction from an arbitrary neutral category. |
| `TauCeti/LinearAlgebra/Trace/Exact.lean:43` | `LinearMap.trace_eq_add_of_exact` is the finite-dimensional exact-sequence trace input. |

### Supplier citations resolved again

The worker's resolver reports no unresolved cross-roadmap citation. Its six unresolved-name leads comprise the three local Lean names (all present), `ConvexPolygon.FiniteSlopeData` (a NewtonPolygons planned object), and the two genuinely undeclared labels in R04. Selected supplier contents were reopened; these are the principal locations independently inspected this round:

| Supplier file, repository-relative | Location and supplied object |
| --- | --- |
| `TauCetiRoadmap/AdicSpacesPartIII/README.md:10472` | Main, R3.6: continuous differentials and proper coherent theory; resolves previous R05. |
| `TauCetiRoadmap/CrystallineCohomology/README.md:10655` | Open head, CR.6.4: relative/absolute convergent tube complexes, support and site comparison. CR.6.5 supplies the proper log rigid/Hyodo–Kato comparison. |
| `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:1372` | Open head, §4.4: integral degree-factor extraction; resolves previous R01. |
| `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:1100` | Open head, §§6.1–6.3, at lines 1100,1114,1133: neutral fibres, reconstruction and finite-type generation. |
| `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:3735` | Open head, F.6 stages 1–2: period/slope interface and normalization boundary. |
| `TauCetiRoadmap/CongruenceSpectralGap/README.md:616` | Open head, §§4.2a–4.2b: coefficient-generic raw sums, eliminated-variable identity and all-characteristic bound. |
| `TauCetiRoadmap/FormalConnectionsOpers/README.md:731` | Open head, F6: formal differential-module applications importing this roadmap's local theory. |
| `TauCetiRoadmap/NewtonPolygons/README.md:322` | Main: `FiniteSlopeData` belongs to the polygon supplier, not this Lean file. |

### Source checks

All 110 bibliography records were submitted to the legal source service. Including author-page retries, 77 records yielded text. Fetching a text is not the same as verifying all its citations. No source manifest or source text was placed in the PR.

The seeded request supplies fifteen labels but no RD identifiers: five indistinguishable “Lemma” labels, five “Theorem” labels, two “Example” labels, two “Construction” labels and one “Comparison” label cannot identify its targets. More precisely, the supplied sequence has 15 entries: Lemma, Lemma, Theorem, Lemma, Lemma, Example, Theorem, Theorem, Construction, Comparison, Construction, Example, Theorem, Lemma, Theorem. I requested the missing identifiers and continued. The following is an explicitly identified *additional sample*, matching that sequence, not a claim to have recovered the random seed. Fourteen have readable supporting source passages; the trace construction's primary text remains unavailable.

| Target | Source locator inspected | Result |
| --- | --- | --- |
| RD.1.4, Katz determinant criterion | `katz1987` lines 49–79; proofs of Theorems 1–2, pp.66–67 | Constant term 1, degree bound n(n−1), and constant-field Vandermonde argument agree. |
| RD.5.17, denominator bound | `kedlaya-finiteness` lines 1180–1189; Lemma 5.2.7, p.32 | README correctly allows a=0 and replaces the proof's division by possibly zero m+i. |
| RD.0.39, Arabia lifting | `arabia2001` lines 693–728; Theorem 2.1.2(b), p.625 | Surjection, compatible reduction, smooth algebra and neighbourhood of IB·ker(p) match the Lean theorem. |
| RD.6.87, functional equation | `kedlaya-fourier` lines 2026–2029; §6.6(b), p.52 | README corrects the missing q⁻ⁿ factor. |
| RD.6.35, factorial valuations | `kedlaya-fourier` lines 989–998; Lemma 4.1.1, p.26 | Positive n and prime p agree; checked against pinned Legendre formula. |
| RD.5.10, convergent versus overconvergent | `berthelot1986` lines 253–259, §1.5 remark, p.15; lines 629–677, §4.2.3–4, pp.28–29; `ref-notes-on-isocrystals` lines 586–591, Remark 5.13, p.14 | Positive-dimensional pathology and Dwork example supported. R01 concerns the newly unrestricted n=0 case. |
| RD.1.7, cyclic vectors | `katz1987` lines 36–44 and 65–79; Theorem 2, pp.65–67; `kedlaya-xiao` line 224, Lemma 1.2.4, p.6 | Nonzero derivation plus rescaling supplies the needed unit derivative; the README excludes the false zero-derivation extension. |
| RD.2.31, local monodromy | `kedlaya-sfr` lines 2625–2645; Theorem 7.2.5 and Example 7.2.6, pp.68–69 | Finite separable extension gives unipotence, not necessarily constancy. |
| RD.6.42, Dwork construction | `berthelot1986` lines 629–677; §4.2.3 and following exercise, pp.28–29 | Connection +πdt pairs with multiplier exp(π(tᵖ−t)); both support cohomologies vanish. |
| RD.4.33, proper comparison | `berthelot1986` lines 366–374; conclusion of §2.4, p.19 | Properness identifies rigid with naive cohomology; taking the full frame removes j†. |
| RD.5.81, top-degree trace | Berthelot, *Dualité de Poincaré et formule de Künneth*, §§1.2,1.6–1.7, pp.3–4 | Not source-certified: service could not classify the supplied mirror. The small trace calculations below are independent checks only. |
| RD.2.42, Dwork boundary example | `berthelot1986` lines 629–660; §4.2.3, pp.28–29 | The sign and exponential construction agree; differentiating after yᵖ−y=t verifies the claimed horizontal basis. |
| RD.6.23, Lefschetz trace | `kedlaya-fourier` lines 403–426 and 1529–1538; (2.1.3), p.11 and Theorem 5.3.2, p.39 | Closed-point degree, coefficient field, σ_K=id and compact-support signs agree. |
| RD.5.54, six-term lemma | `kedlaya-finiteness` lines 1892–1915; Lemma 7.5.3, p.50 | Exact rows, injective c, invertible b,e and surjective d agree. |
| RD.6.85, rigid Weil II | `kedlaya-fourier` lines 1960–1978; Theorem 6.6.2, p.50 | Realizability is required; smoothness occurs in the ordinary-cohomology lower bound. |

Additional headline passages read: `kedlaya-sfr` lines 2502–2526, Theorem 6.4.1 and Corollary 6.4.2, pp.65–66 (saturated increasing slope filtration and base change); `kedlaya-finiteness` lines 108–131, Theorems 1.2.1–1.2.4, pp.3–4 (finiteness, duality and Künneth); `kedlaya-xiao` lines 350–371, Definition 1.4.1 and Remark 1.4.2, p.10 (rational type and the corrected intrinsic-radius normalization); and Xu–Zhu's all-characteristic theorem cited in R02. The Arabia and Katz locators refer to their published author copies; the Kedlaya arXiv page numbers here refer to the fetched versions, not silently to journal pagination.

### Adversarial computations

The rows record actual values or maps on specified instances. “Pass” means that instance agrees, not that all hypotheses or proof routes of the target have been certified. The sample above, both Lean theorems, the six end theorems and every finding have witnesses here.

| Statement | Instances tried | Computed left and right values | Result; change |
| --- | --- | --- | --- |
| RD.0.1 Laurent/Robba carrier | t and t⁻¹; negative coefficients all 1 | (t·t⁻¹)₀=1 and all other coefficients 0. For a₋ₙ=1 and ρ<1, norm term ρ⁻ⁿ→∞ rather than 0. | Product passes; wrong unrestricted Laurent model excluded. |
| RD.0.38 analytic boundary | Σ pⁿt^(pⁿ−1)dt | Coefficients pⁿ→0; primitive coefficients at pⁿ are 1, not tending to 0. For any radius ρ>1, p⁻ⁿρ^(pⁿ−1)→∞. | Convergent, not overconvergent or exact in the Tate algebra. |
| RD.0.39 / Lean Arabia | S=R; I=0; zero target C | For S=R take E=B and structure map; all compatibility differences are 0. For I=0 the neighbourhood is B itself and the given reduction is already a lift. C=0 makes ker(p)=B, so IB·ker(p)=IB. | Pass; no nilpotence assumed. |
| RD.0.39 nontrivial lifting | R=B=ℤ, I=(7), S=ℤ[x,1/(2x)]/(x²−2), C=0 | 3²−2=7 and 2·3=6 is invertible mod 7. Inverting x+3 removes root 4 and retains root 3; quotient is 𝔽₇. There is no root of x²=2 in ℤ. | Étale neighbourhood needed; arbitrary original-ring lift would fail. |
| RD.1.4 determinant | Flat rank-two basis e₀,e₁, candidate e₀+Xe₁ | Candidate and derivative have columns (1,X),(0,1); determinant is 1, so constant term 1 and degree 0≤2. | Pass. |
| RD.1.6 derivation rescaling | s=∂t≠0, first three iterates | D′v=s⁻¹Dv; D′²v=s⁻²D²v−s⁻³(∂s)Dv. Triangular diagonal 1,s⁻¹,s⁻² has determinant s⁻³≠0. | Same spans; supports RD.1.7. |
| `RD1.CyclicFor` | Rank 0, rank 1; arbitrary wrong length | Zero space has the empty basis and determinant 1; a nonzero vector spans rank 1. A basis indexed by Fin 1 cannot span K². | Predicate fixes rank rather than merely independence. |
| `RD1.katz_cyclic_vector` | K=ℚ(t), D componentwise derivative on K² | v=(1,t), Dv=(0,1), determinant 1. With δ=0,D=0 the corresponding determinant is always 0. | Pass; nonzero-derivation binder necessary and present. |
| Cyclic-vector characteristic | K=𝔽_p(t), trivial differential module of rank p+1 | Dᵖ=0, so p+1 iterates are dependent, determinant 0; characteristic-zero hypothesis excludes this. | Negative control passes. |
| RD.1 rational type / R04 name | Gauss radius abs(t)=1/2, trivial line | R=1/2, IR=1; R/abs(t)=1, whereas abs(t)R=1/4. Adding a constant with abs(c)≤1/2 preserves the radius and derivative 1. | Mathematics passes; undeclared label removed under R04. |
| RD.1 standard slope block | Rank 3, F³=p² | Each p-normalized slope is 2/3; sum is 2, equal to v_p(det F)=2. Rank-zero block has empty slope list and degree 0. | Pass. |
| RD.1.35 generic/special slopes | F(e₁)=e₂, F(e₂)=pe₁+te₂ | Generic slopes (0,1); special slopes (1/2,1/2); both endpoint heights 1, midpoint heights 0 and 1/2. | Pass; polygons need not coincide. |
| RD.2.7 slope filtration | Direct sum of slopes 0,1; rank 0 | Filtration ranks 0,1,2, successive degrees 0,1. Zero module has empty filtration, rank/degree 0. | Compatible with the source's saturated increasing filtration. |
| RD.2.31 local monodromy | Trivial line and logarithmic Jordan block | Trivial line has horizontal dimension 1. N(e₂)=e₁,N(e₁)=0 gives N²=0, rank N=1, horizontal dimension 1<2. | Unipotent does not mean constant. |
| RD.2.42 Dwork extension | yᵖ−y=t | dE/E=π(1−py^(p−1))dy=−πdt; ∇(Ee)=0. Before extension exp(−π/s) has convergence condition abs(s)>1, outside the Robba annulus. | Pass; wild extension does real work. |
| RD.3.48a / R05 | Graph projector for h=2 and h=t on trivial rank-two connection | For both, P²=P. At h=2, dP=0; at h=t the lower-left derivative is 1, so dP≠0. | Horizontality distinguishes a legitimate projector; theorem must follow full faithfulness. |
| RD.3.49 direct summands | E⊕0 | Projectors diag(1,0),diag(0,1) square to themselves, sum to 1, product 0; completed summands have ranks rank E,0. | Pass after the indicated prerequisite. |
| RD.3.50 / R04 gluing label | Identity cover, zero coefficient | Cocycle comparison is id∘id=id; the zero object has one gluing datum and rank 0. | Boundary check only; it does not source-certify general descent. |
| RD.4.33 proper comparison | X=P¹ | Both de Rham and rigid dimensions are (1,0,1); boundary is empty and j† is identity. | Pass. |
| RD.5.10 | A⁰; closed A¹ | A⁰ gives dimensions (1,0,0,…). On A¹, primitive of Σpⁿt^(pⁿ−1)dt has coefficients 1, not tending to 0. | First contradicts unrestricted claim: R01. |
| RD.5.17 denominator bound | p=2,m=0,l=2,e=2; m=−1,l=1 | Mod x², product is 1+3x/2; multiplying by 2 gives 2+3x, and bound permits a=1. Second product is x, requiring a=0 and no division by m+1=0. | Corrected README passes. |
| RD.5.54 six-term lemma | Exact row 0→K→K→0→K→K→0→0, identity vertical maps | Nonzero horizontal arrows are identities; all kernels/cokernels of vertical maps have dimension 0. Hypotheses and all six isomorphism conclusions hold. | Pass. |
| RD.5.76 finiteness | Empty variety, point, A¹, Gₘ; zero coefficient | Ordinary dimensions: empty 0, point (1,0,…), A¹ (1,0,…), Gₘ (1,1,0,…). Zero coefficient gives all 0. | Finite in all instances; convergent substitute fails as RD.5.10 shows. |
| RD.5.81 trace | Point, two points; coefficient extension degree d=2 | Tr(1)=1; Tr(a,b)=a+b. Normalized descent is (1/2)Tr_K′/K(1)=1; unnormalized value is 2. | Normalization passes; primary locator unavailable. |
| RD.5.85 finite étale trace | Two-point cover; empty degree-zero cover | Pullback a↦(a,a), trace (a,b)↦a+b, composite 2a; projector sends (a,b) to ((a+b)/2,(a+b)/2) and squares to itself. Degree 0 gives 0 and cannot be divided by. | Positive-degree averaging restriction is necessary. |
| RD.5.89 Poincaré duality | Gₘ, d=1 | H⁰ eigenvalue 1 pairs with H²_c eigenvalue q: product q. H¹ eigenvalue q pairs with H¹_c eigenvalue 1: product q. | Both pairings land in K(−1), not K. |
| RD.5.94 Künneth | Gₘ×Gₘ | Compact dimensions in degrees 2,3,4 are 1,2,1; alternating Frobenius trace 1−2q+q²=(q−1)². | Matches product point count. |
| RD.6.23 trace formula | A¹, Gₘ, P¹ over 𝔽_q | Alternating compact traces are q, q−1, 1+q, equal to the three point counts. Empty scheme gives 0=0. | Signs and Tate normalization pass. |
| RD.6.23 closed-point degree | Spec 𝔽₉ over 𝔽₃ | Frobenius on the two geometric points has trace 0, square trace 2, determinant polynomial 1−T². Counts over 𝔽₃,𝔽₉ are 0,2. | Degree factor retained. |
| RD.6.35 factorial bound | p=2,n=1,2; p=3,n=8 | Values v₂(1!)=0, v₂(2!)=1, v₃(8!)=2. Bounds respectively [0,1], [0,2], [2,4]. | All inclusions pass; n=0 is excluded in target. |
| RD.6.42 Dwork Frobenius | ∇=d+πdt, q=p=3, t=0 | Correct multiplier has logarithmic derivative −π at 0, so horizontal equation gives −π+π=0. Inverse multiplier gives π+π=2π≠0. | Map direction excludes wrong sign. |
| RD.6.47 Kummer | q=3,a=1/2 | Frobenius multiplier t^((q−1)a)=t; at Teichmüller units 1,−1 values are 1,−1. Derivative equation gives (1+a)=qa=3/2. | Pass. |
| RD.6.64 / FDRep contract | Free monoid, generator acting as 0; group character χ | Monoid evaluation equivariance forces 0=ev(v⊗φ), contradicting ev(1⊗1)=1. Group dual has χχ⁻¹=1. | R03. |
| RD.6.85 Weil II | Constant coefficient on Gₘ, w=0 | H¹_c weight 0≤1; H¹ weight 2≥1. H⁰ weight 0 and H²_c weight 2 meet the corresponding bounds. | Inequality directions pass. |
| RD.6.87 functional equation | P¹,n=1,i=0 | Left 1−qT; right −qT(1−1/(qT))=1−qT. Omitting q⁻¹ yields q−qT, with wrong constant q. | README correction passes. |
| RD.6.93 middle cohomology | Gₘ, constant coefficient | H¹_c→H¹ maps weight 0 to weight 2, hence is 0; image dimension 0. | Pure-weight statement admits the zero object. |
| RD.6.94–97 | Rank 2 over 𝔽₂ at 1; rank 3 over 𝔽₃ at 1 | First raw sum=1, signed trace=−1. Second product-one triples give 1+3ζ², with ζ³=1, ζ≠1. Both ranks are divisible by p and excluded. | R02: general construction needs these instances. |
| RD.7.1 Frobenius iterate | P¹ over 𝔽_(p²) | Crystalline φ on H² multiplies by p semilinearly; φ² multiplies by p²=q. Rigid q-Frobenius is q, not p. | Pass. |
| RD.7.4 Fatou | f=(1−T)⁻¹; uncoprime G=H=1−T/ℓ | First coefficients all 1 and normalized denominator integral. Second f=1 is integral but G,H have coefficient valuation −1; their common factor is nontrivial. | Coprimality is necessary and present. |
| RD.7.5–9 Weil factors | P¹; q=1 countercontrol | For q>1, P₀=1−T,P₁=1,P₂=1−qT give Z=1/((1−T)(1−qT)). At q=1 all absolute values 1, so weights no longer separate. | General comparison passes this instance; q>1 retained. |
| RD.7.11–12, RD.7.17 | y²=x³+x+1 and y²=x³+x over 𝔽₇ | Point counts 5,8; traces 3,0; polynomials 1−3T+7T² and 1+7T². Slopes are (0,1) and (1/2,1/2); both have complex weight 1. | No identification of weight/2 with slope. |
| RD.7.17 extension field | Supersingular example above, degree 2 | Trace F²=0²−2·7=−14; #E(𝔽₄₉)=49+1+14=64; polynomial (1+7T)². | Power trace and comparison conventions agree. |
| Valuation normalization | π²=p, q=p | v_π(π)=1, v_p(π)=1/2, v_q(π)=1/2, and v_π=2v_p. | Ramification factor cannot be dropped. |

## Not verifiable

- **Seed identity:** the supplied fifteen generic labels do not identify fifteen RD targets. The explicit additional sample above must not be recorded as the worker's seeded sample. No locator in the README was literally flagged “unverified” or “uncertified” by those words.
- **Full mathematical certification:** all eight layers and the 538-target structure were inspected, but this report does not supply an individual computed row for every API assertion, Check, proof input and source-correction entry in the 14,692-line README. Nor were all cross-roadmap contracts manually compared at full mathematical generality. The table and source list delimit the actual checks. This is not an acceptance-quality exhaustive certification.
- **Published/preprint agreement:** the fetched arXiv versions support the locators explicitly identified above. Unread journal versions and the many additional claimed source corrections are not certified merely because a preprint or correction appears in the bibliography.
- **Trace construction:** RD.5.81's primary Berthelot note was not readable through the service at the supplied location; its general construction and independence proof remain unverified even though the point/trace calculations pass.

The remaining unavailable bibliography records are listed below with the place attempted. A failed host-classification or search is an access limitation, not evidence that the work has no legal copy. The duplicate Préface reference is part of the fetched Fargues–Fontaine book and is not requested under a new key. Successfully fetched records were removed from the scratch missing-reference request. Settled uncertified entries are not reopened.

- **ref-periods-for-irregular-connections-on-curves — Periods for irregular connections on curves**: the given URL http://page.mi.fu-berlin.de/esnault/preprints/helene/69-preprint-per051206.pdf: page.mi.fu-berlin.de is in no licence class.
- **ref-corrigendum-local-and-global-structure-of-connections-on-nonarchimedean-curves — Corrigendum: Local and global structure of connections on nonarchimedean curves**: the DOI's landing page: the landing page https://www.cambridge.org/core/journals/compositio-mathematica/article/corrigendum-local-and-global-structure-of-connections-on-nonarchimedean-curves/87B6132D2F91D08026130FE1FAB09D5C is on a host in no licence class.
- **ref-finitude-et-puret-cohomologique-en-cohomologie-rigide-avec-un-appendice-par-a-j-de-jo — Finitude et pureté cohomologique en cohomologie rigide (avec un appendice par A. J. de Jong)**: the given URL https://wstein.org/people/berthelo/publis/Finitude.pdf: wstein.org is in no licence class.
- **ref-cohomologie-rigide-et-cohomologie-rigide-supports-propres-premi-re-partie — Cohomologie rigide et cohomologie rigide à supports propres. Première partie**: the given URL https://wstein.org/people/berthelo/publis/Cohomologie_Rigide_I.pdf: wstein.org is in no licence class.
- **ref-dualit-de-poincar-et-formule-de-k-nneth-en-cohomologie-rigide — Dualité de Poincaré et formule de Künneth en cohomologie rigide**: the given URL https://wstein.org/people/berthelo/publis/Poincare_Kunneth.pdf: wstein.org is in no licence class.
- **ref-point-counting-after-kedlaya-eidma-stieltjes-graduate-course-leiden-22-26-september-2 — Point counting after Kedlaya (EIDMA-Stieltjes Graduate course, Leiden, 22–26 September 2003)**: the given URL https://pub.math.leidenuniv.nl/~edixhovensj//oww/mathofcrypt/carls_edixhoven/kedlaya.pdf: pub.math.leidenuniv.nl is in no licence class.
- **ref-l-ments-de-g-om-trie-alg-brique-iii — Éléments de géométrie algébrique III₁**: source-service bibliographic resolution of A. Grothendieck, Éléments de géométrie algébrique III₁, Publ. Math. IHÉS 11 (1961), Chapitre 0, §13. did not yield readable text.
- **ref-vector-bundles-with-a-frobenius-structure-on-the-punctured-unit-disc — Vector bundles with a Frobenius structure on the punctured unit disc**: the given URL https://ivv5hpp.uni-muenster.de/u/uhartl/Publikat/SigmaBd.pdf: ivv5hpp.uni-muenster.de: [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: unable to get local issuer certificate (_ssl.c:1010).
- **ref-algebraic-geometry — Algebraic Geometry**: source-service bibliographic resolution of R. Hartshorne, Algebraic Geometry, Graduate Texts in Mathematics 52, Springer, 1977. did not yield readable text.
- **ref-linear-algebraic-groups — Linear Algebraic Groups**: source-service bibliographic resolution of J. E. Humphreys, Linear Algebraic Groups, Graduate Texts in Mathematics 21, Springer, 1975. did not yield readable text.
- **ref-purity-of-the-stratification-by-newton-polygons — Purity of the stratification by Newton polygons**: the DOI's landing page: the landing page https://pubs.ams.org/journals/jams/2000-13-01/S0894-0347-99-00322-7 is on a host in no licence class.
- **ref-logarithmic-structures-of-fontaine-illusie — Logarithmic structures of Fontaine–Illusie**: source-service bibliographic resolution of K. Kato, Logarithmic structures of Fontaine–Illusie, in Algebraic Analysis, Geometry, and Number Theory, Johns Hopkins Univ. Press, 1989, 191–224. did not yield readable text.
- **ref-slope-filtration-of-f-crystals — Slope filtration of F-crystals**: source-service bibliographic resolution of N. M. Katz, Slope filtration of F-crystals, Astérisque 63 (1979), 113–163. did not yield readable text.
- **ref-gauss-sums-kloosterman-sums-and-monodromy-groups — Gauss Sums, Kloosterman Sums, and Monodromy Groups**: source-service bibliographic resolution of N. M. Katz, Gauss Sums, Kloosterman Sums, and Monodromy Groups, Annals of Mathematics Studies 116, Princeton, 1988. did not yield readable text.
- **ref-finiteness-theorems-in-geometric-classfield-theory — Finiteness theorems in geometric classfield theory**: source-service bibliographic resolution of N. M. Katz and S. Lang, Finiteness theorems in geometric classfield theory, Enseign. Math. (2) 27 (1981), 285–319. did not yield readable text.
- **ref-erratum-for-slope-filtrations-revisited — Erratum for “Slope filtrations revisited”**: the given URL https://emis.muni.cz/journals/DMJDMV/vol-12/09.pdf: emis.muni.cz: [Errno 111] Connection refused.
- **ref-exponential-sums-and-rigid-cohomology — Exponential sums and rigid cohomology**: the given URL https://bimsa.net/doc/publication/1445.pdf: bimsa.net is in no licence class.
- **ref-sur-les-points-singuliers-des-quations-diff-rentielles — Sur les points singuliers des équations différentielles**: source-service bibliographic resolution of B. Malgrange, Sur les points singuliers des équations différentielles, Enseign. Math. (2) 20 (1974), 147–176. did not yield readable text.
- **ref-algebraic-groups — Algebraic Groups**: source-service bibliographic resolution of J. S. Milne, Algebraic Groups, Cambridge Studies in Advanced Mathematics 170, Cambridge University Press, 2017. did not yield readable text.
- **ref-formal-cohomology-i — Formal cohomology I**: source-service bibliographic resolution of P. Monsky and G. Washnitzer, Formal cohomology I, Ann. of Math. 88 (1968), 181–217. did not yield readable text.
- **ref-formal-cohomology-iii-fixed-point-theorems — Formal cohomology III: fixed point theorems**: the DOI's landing page: the landing page https://www.jstor.org/stable/1970777?origin=crossref is on a host in no licence class.
- **ref-pinceaux-de-vari-t-s-ab-liennes — Pinceaux de variétés abéliennes**: source-service bibliographic resolution of L. Moret-Bailly, Pinceaux de variétés abéliennes, Astérisque 129 (1985). did not yield readable text.
- **ref-f-isocrystals-and-de-rham-cohomology-ii-convergent-isocrystals — F-isocrystals and de Rham cohomology II — convergent isocrystals**: the DOI's landing page https://projecteuclid.org/journals/duke-mathematical-journal/volume-51/issue-4/F-isocrystals-and-de-Rham-cohomology-IIConvergent-isocrystals/10.1215/S0012-7094-84-05136-6.full: no PDF link.
- **ref-endomorphismes-compl-tement-continus-des-espaces-de-banach-p-adiques — Endomorphismes complètement continus des espaces de Banach p-adiques**: source-service bibliographic resolution of J.-P. Serre, Endomorphismes complètement continus des espaces de Banach p-adiques, Publ. Math. IHÉS 12 (1962), 69–85. did not yield readable text.
- **ref-groupes-alg-briques-et-corps-de-classes — Groupes algébriques et corps de classes**: source-service bibliographic resolution of J.-P. Serre, Groupes algébriques et corps de classes, Hermann, 1959. did not yield readable text.
- **ref-local-fields — Local Fields**: source-service bibliographic resolution of J.-P. Serre, Local Fields, Graduate Texts in Mathematics 67, Springer, 1979. did not yield readable text.
- **ref-the-arithmetic-of-elliptic-curves — The Arithmetic of Elliptic Curves**: source-service bibliographic resolution of J. H. Silverman, The Arithmetic of Elliptic Curves, 2nd edition, Graduate Texts in Mathematics 106, Springer, 2009. did not yield readable text.
- **ref-congruence-properties-of-the-hyper-kloosterman-sum — Congruence properties of the hyper-Kloosterman sum**: source-service bibliographic resolution of S. Sperber, Congruence properties of the hyper-Kloosterman sum, Compositio Math. 40 (1980), 3–33. did not yield readable text.
- **ref-rigid-cohomology — Rigid Cohomology**: source-service bibliographic resolution of B. Le Stum, Rigid Cohomology, Cambridge Tracts in Mathematics 172, Cambridge University Press, 2007. did not yield readable text.
- **ref-on-the-gysin-isomorphism-of-rigid-cohomology — On the Gysin isomorphism of rigid cohomology**: the DOI's landing page https://projecteuclid.org/journals/hiroshima-mathematical-journal/volume-29/issue-3/On-the-Gysin-isomorphism-of-rigid-cohomology/10.32917/hmj/1206124853.full: no PDF link.
- **ref-abelian-varieties-over-finite-fields — Abelian varieties over finite fields**: source-service bibliographic resolution of W. C. Waterhouse, Abelian varieties over finite fields, Ann. Sci. École Norm. Sup. (4) 2 (1969), 521–560. did not yield readable text.
- **ref-a-remark-on-endomorphisms-of-abelian-varieties-over-function-fields-of-finite-charact — A remark on endomorphisms of abelian varieties over function fields of finite characteristic**: the DOI's landing page https://www.mathnet.ru/php/archive.phtml?wshow=paper&jrnid=im&paperid=1933&option_lang=eng: no PDF link.

## Source issues

These are independently checked issues, including source errors that the README already corrects. They are not additional findings against the author.

- **Error** in kedlaya-xiao at Lemma 1.2.4, printed page 6: the source says characteristic zero suffices for every differential module to have a cyclic vector; it should require a nonzero derivation; affects a stated result.
- **Misprint** in kedlaya-xiao at Remark 1.4.2, printed page 10: the source says the intrinsic radius is the generic radius multiplied by the parameter norm; it should divide by that norm; affects a stated result.
- **Misprint** in kedlaya-finiteness at Lemma 5.2.7, printed page 32: the source says the denominator-clearing exponent is positive despite a possibly zero upper bound; it should allow a nonnegative exponent; affects a stated result.
- **Gap** in kedlaya-finiteness at Lemma 5.2.7 proof, printed page 32: the source says to divide by the shifted integer factors for arbitrary integer m; it should use a Vandermonde/binomial expansion valid when those factors vanish; affects the proof.
- **Misprint** in ref-notes-on-isocrystals at Remark 5.13, printed page 14: the source says the example's affine line is over the characteristic-zero coefficient field K; it should be over the residue field k; affects nothing.
- **Error** in kedlaya-fourier at §6.6(b), printed page 52: the source says the functional equation substitutes the reciprocal variable without a q factor; it should substitute q⁻ⁿ times the reciprocal variable; affects a stated result.
