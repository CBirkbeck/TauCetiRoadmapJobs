# Review of SmoothBundlesConnections (pull request #887 at a6dc23d)

**Verdict:** needs changes

## R01 (P1) — Separate the smooth exponential sequence from constant singular coefficients

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/README.md:1212`, “Construct the induced connecting morphism … prove the comparison square with AlgebraicTopology Stage 6.1's singular Bockstein commutes”; also lines 1294–1296, the winding-one function Check.

**Claim.** The smooth exponential sequence is compared with the constant-coefficient singular sequence without specifying the different middle and right sheaves. The Check treats a nonconstant smooth function as an input to the singular Bockstein.

**Witness.** On S¹, singular H⁰(S¹;ℝ)→H⁰(S¹;ℝ/ℤ) is surjective, so β⁰=0. The smooth function z↦z has sheaf connecting class 1∈H¹(S¹;ℤ); it is not a singular 0-cocycle.

**Repair.** State two exact sequences, `0→ℤ_const→ℝ_const→(ℝ/ℤ)_const→0` and `0→ℤ_const→C∞(ℝ)→C∞(ℝ/ℤ)→0`, and the morphism from the first to the second given by inclusions of locally constant functions. Specify the resulting naturality square, including its vertical maps; identify only the constant-sequence Bockstein with the singular Bockstein. The smooth circle sheaf is not the constant circle sheaf. Keep z↦z as a Check of the smooth connecting map, and test the constant-sequence square on a constant function: both connecting classes are 0. In degree one the square still gives the desired flat-bundle characteristic class. On S², the two right-hand H¹ groups are respectively 0 and ℤ, so these vertical maps cannot be asserted to be isomorphisms.

## R02 (P1) — ComplexKahlerGeometry supplies and consumes this roadmap

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/README.md:178`, “K5a: … the linear elliptic and Sobolev theory and the compact real Hodge theorem”; also B8's dependencies at lines 1506, 1552 and 1579.

**Claim.** ComplexKahlerGeometry is a supplier, while the same roadmap consumes this roadmap's B2–B4. Independent layers do not satisfy the required single direction between roadmap folders.

**Witness.** On main, `TauCetiRoadmap/ComplexKahlerGeometry/README.md:571` says K5a uses SmoothBundlesConnections B2–B4; line 580 consumes B2's L² construction. This README's B8 consumes that K5a. The two supply arrows are opposite.

**Repair.** Split the earlier bundle/connection foundations from their later applications: move the K5a-dependent Yang–Mills layer into a subsequent Part II that consumes both foundations and ComplexKahlerGeometry. Also move the K7.1-dependent projective-chart/orientation comparisons and applications into that later part, so the earlier folder has no reverse supplier edge to ComplexKahlerGeometry. Keep the general quotient theorem and general circle-bundle classification in the foundations. Recheck the two-node graph: foundations→ComplexKahlerGeometry→Part II and foundations→Part II has no cycle. Do not re-plan the already merged ComplexKahlerGeometry targets.

The mechanical output was `depcheck: 204 roadmaps, 1387 edges, 0 problem(s)`. This is a false negative for the explicitly quoted pair of edges, not an UPWARD/CYCLE message invented by this review.

## R03 (P1) — DifferentialGeometry does not supply the invariant metric cited for slices

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/README.md:389`, “DifferentialGeometry 12.1 (an invariant metric for the slice).”

**Claim.** DifferentialGeometry 12.1 supplies an action-invariant Riemannian metric.

**Witness.** On main, `TauCetiRoadmap/DifferentialGeometry/README.md:915` supplies metric existence by partitions of unity, pullbacks and products, without an action. For coordinate-swapping ℤ/2 on ℝ², diag(1,4) is positive but not invariant.

**Repair.** Cite DG12.1 only for an auxiliary metric. Own the compact-isotropy averaging and equivariant local-chart/tubular-neighbourhood steps in B1.4, with compact stabilizer, smooth action, normalized Haar measure, smoothness and positive-definiteness hypotheses. This supplies the slice route independently. Do not import Meinrenken Corollary 1.27 as a pre-slice proof: its proof uses slices. In the witness, averaging diag(1,4) with its coordinate swap gives diag(5/2,5/2), which is invariant. There is no declared supplier gap covering this missing contract.

## R04 (P2) — An arbitrary abelian coefficient category need not have Čech products

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/README.md:1182`, “an arbitrary presheaf P … with values in an abelian category, indexed open covers … construct the raw refinement cochain map”.

**Claim.** The native complexes exist for every such category and arbitrary index types.

**Witness.** `Mathlib/CategoryTheory/Sites/SheafCohomology/Cech.lean:31` requires `HasProducts.{w} A`. For A finite-dimensional ℚ-vector spaces and the ℕ-indexed repeated cover of a point, C⁰ would be ∏ℕℚ, outside A.

**Repair.** Fix the object, morphism and cover-index universes and assume the corresponding products, e.g. `[HasProducts.{w} A]`, throughout the native refinement and homotopy statements. Retain arbitrary covers; do not narrow the library to finite covers. Require the homology instances when passing to cohomology. The witness is then excluded for finite-dimensional coefficients and included in `ModuleCat ℚ`, where C⁰=ℚ^ℕ exists and refinement selects the prescribed coordinates.

## R05 (P2) — State the regular-fibre existence headline on its native existential carrier

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/Suggested.lean:27`, “the manifold structure on a regular fibre … is itself a target”; compare `README.md:201–225`.

**Claim.** The new regular-fibre foundation is absent from the acceptance signatures; the docstring uses its unconstructed atlas as an obstruction to statability.

**Witness.** `TauCetiRoadmap/LieGroupoidsPoisson/Suggested.lean:50` states an existential atlas, manifold, embedding and tangent-kernel theorem. Both its isolated signature and a scratch generalization to arbitrary finite-dimensional boundaryless models elaborate here with only `sorry` warnings.

**Repair.** Include this deep B1.0 existence theorem in this roadmap's namespace, with its stated finite-dimensional boundaryless generality and no Hausdorff restriction. Quantify over the atlas instead of constructing sorry'd data. Preserve the real theorem: smooth embedding and tangent image equal to ker(df), not just nonemptiness of an arbitrary chart structure. Coordinate projection ℝ²→ℝ gives a one-dimensional fibre; an empty fibre remains admitted even when the natural-number dimension difference is 0. Record the ownership move from LieGroupoidsPoisson and use a distinct fully qualified name. This does not require importing a roadmap module.

## R06 (P2) — Fix one coordinate period for the torus formulas

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/README.md:1010`, holonomies “exp(−2πia)” and “exp(−2πib)”; compare lines 834–836 and 1341.

**Claim.** The same potentials `a dx+b dy` have coefficient shifts 2πℤ² in B4, holonomies exp(−2πia), exp(−2πib) in B5, and constant curvatures `c dx∧dy` with c∈2πℤ in B6, without changing coordinates.

**Witness.** If x,y have period 2π, holonomy is exp(−2πia), coefficient shifts are integers, and ∫c dx∧dy=4π²c. Thus curvature integrality is 2πc∈ℤ, not c∈2πℤ.

**Repair.** Specify coordinate periods in Conventions. With angular periods 2π, use coefficient lattice ℤ² and curvature coefficients `(1/(2π))ℤ`; the period coordinates still have lattice 2πℤ². Alternatively use unit-period x,y everywhere and change holonomy to exp(−ia), exp(−ib). Test c=1/(2π) in angular coordinates: its period is 2π and its Chern number is 1. Test a=1: holonomy is 1 and it is gauge-equivalent to a=0.

## R07 (P3) — Delete the auxiliary calculus target file

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/TransportDerivativeTargets.lean:1–3`, three Mathlib submodule imports; line 22, `hasDerivAt_inverse_transport_section`.

**Claim.** The file remains an acceptance target although it names only free functions and operators, and its imports/docstring violate the form rules for every listed Lean file.

**Witness.** The theorem is precisely the scalar/operator calculus behind the README's B5.1 Check at lines 946–948. It mentions no bundle, connection or transport functor. The previous R04 requested deletion; the file is still present.

**Repair.** Delete `TransportDerivativeTargets.lean`; keep the existing README sign Check. The calculation remains correct: P(t)=exp(−tA), σ(t)=σ₀+tw gives derivative w+Aσ₀ at 0. Do not prove this padding in place. The worker's reported import counts cover Suggested.lean successfully but do not certify this additional file.

## R08 (P3) — The five sampled Čech targets still have no source locators

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/README.md:1113–1218`, the five paragraphs headed “Sheaves and exactness”, “Native fixed-cover complex and the displayed coordinates”, “Augmentation is a separate, conditional comparison”, “Raw refinement maps and homotopies”, and “Coefficient maps and the connecting morphism”.

**Claim.** These new results have sources with exact locators that can be verified. No literature locator is attached to any of the five; the augmentation alone cites precise native declarations.

**Witness.** None of these paragraphs names a literature theorem, section or page. B6.2–B6.6 likewise have no literature locators. The folder contains no `sources.toml`, despite nine works in References.

**Repair.** Supply a legal source and exact theorem/section plus page for each new claim, keeping native declarations as the source for assertions they already prove. Add the required manifest entries, including version/numbering information for the 2014 arXiv Schreiber–Waldorf text versus the cited 2009 publication. Include B2's analytic constructions and B6's classification/comparison targets in this pass. For R01, the new locator must distinguish the two exponential sequences and survive the S¹ and S² witnesses. The sampled augmentation is verified at the pin below; missing literature references were not guessed.

## R09 (P3) — Repair the false and insufficiently specified Checks

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/README.md:1206`, “P(∅) ≠ 0 … refinement does not kill the spurious degree-one classes”; also lines 535–537, 603–604 and 683–684.

**Claim.** The stated hypotheses determine the advertised nonzero Čech class, frame-coordinate scaling, projection norm, and Möbius L² model.

**Witness.** The constant presheaf ℤ has P(∅)=ℤ but H¹=0 on the singleton cover: dim C¹=4, rank d⁰=1, rank d¹=3. A rank-zero bundle also has indicator-operator norm 0 on a positive-measure set.

**Repair.** Specify the counterexample presheaf by P(∅)=ℤ and P(U)=0 for every nonempty U; its singleton-cover H¹ is ℤ, as the computed ranks below show. In the rank-two frame Check write `(e₁,2e₂)` and distinguish the coordinate map (e₂↦(0,1/2)) from synthesis ((0,1)↦2e₂). Require positive fibre rank on the measured set for the indicator norm-one assertion. Describe Möbius L² sections as antiperiodic functions square-integrable on one period, with that period integral as norm: a nonzero antiperiodic function is never square-integrable on all of ℝ. The row-by-row values below test all four repairs.

## R10 (P3) — Finish the timeless README and layer form

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/README.md:98–102`, the two explicit Mathlib pull-request references and “once adopted, replace ours”; also the title and B1–B8 headings.

**Claim.** The previous R05/R06 form defects have been completely removed.

**Witness.** Explicit pull-request numbers remain at lines 98–99. The title lacks `Roadmap:`; headings use `## B1.` rather than `## Layer 1:`; B7 has no Examples/Dependencies subsections. B1.2 has no definition API list.

**Repair.** Keep the concrete mixin/right-action/connection-form interface and delete the PR references and replacement narrative. Adopt the required title and layer headings, update links, and complete the per-definition API/Checks and per-layer dependencies. In particular separate the different Needs of B6.1's sheaf, refinement, integration and fundamental-class targets; one line at 1298 currently covers all of them. Retain named library deferrals in Scope and ownership. This is a form repair, not a request to reduce the mathematical scope.

## Verified sound

Independent AI review: all 1,643 README lines and both Lean files were read. There are 10 findings (3 P1, 3 P2, 4 P3), 150 computed adversarial rows and 24 pinned-declaration entries below. Elaboration and mathematical checks are separate evidence.

**Previous findings, checked before the full pass.** No repair report marking an item “not actionable in this package” was supplied or found in the package reports, so none is treated as settled on that basis.

| Previous finding | Passage in this head | Disposition |
|---|---|---|
| R01, LieGroupoidsPoisson supply cycle | B1.0, line 201: “Define the regular fibre”; B5.2, line 979: “Prove that the fundamental group … is countable” | Repaired locally: the upward imports became owned targets. The corresponding open sibling still owns them; the ownership transfer is recorded below. The different ComplexKahlerGeometry cycle is new R02. |
| R02, missing DG comparisons | Line 1235: “The following are targets here … not consumed from DifferentialGeometry” | Repaired: smooth restriction, naturality, equality with deRhamHom and fundamental-class pairing are stated at 1237–1255. Their source/hypothesis and new coefficient issues are reviewed separately. |
| R03, HTML anchor | Generated heading at line 876; no HTML anchor remains | Repaired. |
| R04, auxiliary Lean file | `TransportDerivativeTargets.lean:22` still declares the same calculus theorem | Not repaired; the sign Check was added at 946–948, but deletion was not performed (new R07). |
| R05, old README form | Summary, ownership, conventions, supplier table, Checks and Needs now appear | Partly repaired. Source locators and several prescribed form/API details remain absent (R08/R10). |
| R06, PR references | Lines 98–99 still link the two Mathlib PR numbers | Not repaired (R10). The “nothing waits” sentence does avoid waiting for Mathlib. |
| R07, Charles/Lee references | Charles is absent; lines 1629–1630 name Lee's second edition, 2018 | Text repaired. The manifest is still absent; Lee's text was not readable (R08 and Not verifiable). |
| R08, optional smooth-sheaf acyclicity | `Suggested.lean:150` states `subsingleton_H_smoothSheafAddCommGroup` | Added. The previous finding expressly said this omission was not a defect. The new statement elaborates with its actual hypotheses. |

**Gate, signatures and padding.** The supplied gate reports every scanner and targeted build passing, ending `build=0 OK`. There are no changed paths outside this roadmap folder and no worktree edits from this review. The review ran the required dependency command and independently ran `lake env lean` on the absolute Suggested.lean path from the worktree; only four `declaration uses sorry` warnings occurred, at lines 90, 97, 140 and 150. The additional file also elaborates with its sole `sorry` warning; its form defects are R07.

The dependency output, verbatim:

```text
depcheck: 204 roadmaps, 1387 edges, 0 problem(s)
```

The signature service's ninth declaration `on` is a parser false positive from a docstring. An independent scratch copy with `#check @` for all eight actual declarations elaborated without errors. `SmoothGoodCover` deliberately needs only topological/chart data; its smooth-contraction field supplies continuity. Both existence theorems retain finite dimension, Hausdorffness and boundarylessness, with second countability or compactness as stated. The constant sheaf depends only on M and its topology. The coordinate iff has the good-cover hypothesis. The acyclicity theorem retains finite dimension, Hausdorffness and second countability; it also permits models with corners, where smooth partitions of unity still give the claimed result. No binder was lost and no target file was changed.

On a scratch copy, each of the four admitted Suggested.lean targets was tried with the one-tactic alternatives `simp`, `rfl`, and `infer_instance`; none closed. Inspection found no single pinned lemma giving any of those four conclusions. The acyclicity target is not the generic flasque theorem: the smooth-function sheaf is generally not flasque. The auxiliary inverse-transport target is a README Check on free calculus data, hence padding irrespective of how many calculus tactics its proof takes.

**Headline coverage.** The README's end results are regular-fibre/submersion foundations, free proper quotients and homogeneous spaces, Ehresmann, finite-rank L² completeness, principal/associated connections and the Atiyah sequence, transport reconstruction, the flat-bundle dictionary, Ambrose–Singer and holonomy reductions, good-cover existence, Čech–de Rham–singular comparison, circle classification with Hopf normalization, rank-one Chern–Weil, flat/fixed-curvature and lattice-torus classification, and Yang–Mills variation/gauge-fixed ellipticity. Suggested.lean contains the two good-cover existence statements, native constant-coordinate iff and smooth-sheaf acyclicity. Its docstring names the other geometric families and missing principal-bundle/form/de Rham/L²-section carriers. The native regular-fibre existential signature is the concrete omitted statable headline in R05. The full Čech–de Rham comparison cannot yet name the supplier's manifold de Rham carrier; the docstring should name that comparison explicitly in the corresponding missing-carrier item.

**Adversarial computations.** These 150 rows cover all layers, the five sampled paragraphs, the Lean declarations and every finding. They record computed instances, not proofs of the general targets.

| Statement / location | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Right action and fundamental field, Conventions | G on itself, A∈Lie G | d/dt g exp(tA)=dL_g A; bracket=[A,B]^L | Consistent | None |
| Associated relation and equivariant sections | f a frame, v a vector | (fg)(v)=f(gv); u(pg)=g⁻¹u(p) gives [pg,u(pg)]=[p,u(p)] | Consistent | None |
| Transition and section-change conventions | p=s_i a=s_j b, s_j=s_i g | b=g⁻¹a; g′=h_i⁻¹g h_j | Consistent | None |
| Curvature wedge normalization | Lie basis [X,Y]=Z | [ω∧ω](X,Y)=2Z; half term=Z | Consistent | None |
| Circle scale and dual character | t generator, ρ(e^{it})=e^{-it} | ρ_*(t)=−it; unitary F=−iF_real; (i/2π)(−iF)=F/(2π) | Consistent | None |
| Čech/de Rham sign | δA=dφ, F=dA | D(A+φ)=F+δφ; [F]=[−δφ] | Consistent | None |
| Holonomy multiplication and basepoint | q traversed then p; fibre point ug | hol(p*q)=hol(p)hol(q); hol_ug=g⁻¹hol_u g | Consistent with native multiplication | None |
| Regular-fibre definition, B1.0 | f(x,y)=x, c=3 | fibre={(3,y)}≅ℝ; df=(1,0); ker=span(0,1); dimension=2−1=1 | Sound target, statable | R05 |
| Empty regular fibre and natural subtraction | point→ℝ², c outside image | fibre=∅; regularity vacuous; 0−2=0; empty 0-manifold valid | No hidden nonemptiness needed | None |
| Fibre tangent embedding | f(x)=‖x‖², level 1 | df_x(v)=2⟨x,v⟩; tangent=x⊥; dimension n for sphere in ℝ^{n+1} | Consistent | None |
| Regularity negative control | f(x,y)=x²−y², level 0 | df_(0,0)=0; kernel dimension 2; crossing fibre not locally ℝ | Hypothesis excludes it | None |
| Non-Hausdorff regular fibre | doubled-origin line→ℝ | fibre at 0 has two points, each dimension 0; derivative=1 at both | Consistent | None |
| Regular-fibre universal property and atlas independence | projection fibre, maps t↦(3,t²) | composite and fibre-coordinate map both t²; change of target chart multiplies equation by nonzero derivative | Consistent | None |
| Transverse fibre product | f=g=id_ℝ | df−dg sends (u,v)↦u−v; kernel={(u,u)}; dimension 1 | Consistent | None |
| Fibre product with constant map | f:ℝ²→ℝ projection, g:ℝ→ℝ constant 0 | product={(0,y,z)}≅ℝ²; dimension 2+1−1=2 | Consistent | None |
| Fibre-product degeneracy | f=g=x² at (0,0) | derivative difference=0; rank 0<1; x²=y² is two crossing lines | Hypothesis excludes it | None |
| Kernel distribution | f(x,y)=x versus x³ | projection kernel rank 1 everywhere; x³ kernel ranks 1 at 0, 0 elsewhere | Consistent | None |
| Principal torsor/division, B1.1 | g=[[1,1],[0,1]], h=[[1,0],[1,1]] | g⁻¹h=[[0,−1],[1,1]]; g(g⁻¹h)=h; hg⁻¹=[[1,−1],[1,0]]; g(hg⁻¹)=[[2,−1],[1,0]]≠h | Order discriminated | None |
| Principal degeneracy | trivial G; nontrivial G acting trivially | G=1 gives unique division 1; trivial action of G≠1 gives multiple candidate divisions | Torsor axiom excludes wrong model | None |
| Smooth descent and vertical tangent | P=M×G; invariant F(x,g)=f(x) | F∘s=f; dπ(v,A)=v; ker={0}×Lie G | Consistent | None |
| Pullback/restriction/product, B1.2 | id_M, U⊆M, product G×H | id*P≅P; (M×G)∣U=U×G; product fibre=G×H | Consistent | None |
| Left-to-right conversion | left translation on G | p·g=g⁻¹p; generator=−A^R; [−A^R,−B^R]=−[A,B]^R | Consistent | None |
| Cocycle/gluing classification, B1.3 | g_ij=1; two-arc sign cocycle | first gives M×G; overlap signs (+1,−1) have product −1, giving connected double cover | Discriminates coboundary | None |
| Hopf transition | z=i; s₀=(1,i)/√2, s₁=(−i,1)/√2 | s₁=s₀(−i); z̄/∣z∣=−i, inverse convention gives i | Consistent | None |
| Free proper quotient, B1.4 | ℤ↷ℝ by translation | stabilizer=0; quotient=ℝ/ℤ; fibre discrete ℤ; tangent dimension 1−0=1 | Consistent | None |
| Properness negative control | irrational ℝ-flow on T² | stabilizer=0; orbit dense; orbit space not Hausdorff | Properness needed | None |
| Slice finite isotropy | λ·(z₁,z₂)=(λz₁,λ²z₂), z₁=0 | stabilizer={±1}; −1 acts as −1 on transverse z₁ | Consistent local slice | None |
| Invariant metric supplier | ℤ/2 swaps coordinates, h=diag(1,4) | swap*h=diag(4,1)≠h; average=diag(5/2,5/2)=swap*average | Contract missing | R03 |
| Properness of principal action | P=M×G, Hausdorff M | (p,g)↦(p,pg) inverse uses division; image is equality locus of two base coordinates, closed | Consistent | None |
| Homogeneous quotient | SO(3)/SO(2) | dimensions 3−1=2; stabilizer of north pole=SO(2); quotient=S² | Consistent | None |
| Ehresmann horizontal complement, B1.5 | product M×F | H=TM×0; H⊕ker dπ=TM×TF; horizontal transport on F=id | Consistent | None |
| General Ehresmann incompleteness | y′=y², y(0)=1 | y(x)=1/(1−x); finite on x<1, blows up at 1 | Correct distinction from principal case | None |
| Ehresmann properness | ℝ²\{0}→ℝ | fibre(0)=ℝ\{0}, two components; fibre(1)=ℝ, one | Properness cannot be dropped | None |
| Ehresmann connected-base condition | base ℝ⊔ℝ | fibre counts 1 and 2; no single model fibre across components | Componentwise statement correct | None |
| Associated operations, B2.1 | trivial representation, rank 0 | bundle=M×V; rank-zero tensor/direct-sum/dual identities give zero fibres | Consistent | None |
| Complexification/dual pairing | z=i,w=i, ℓ(v)=1 | (zℓ)(wv)=−1 on both sides; sesquilinear substitute would give +1 | Complex-linear dual fixed | None |
| Conjugation | ξ(z)=az | κξ(z)=conj(a)z; κ²ξ=ξ; κ fixes real inclusion | Consistent | None |
| Fibre metric, B2.2 | h(u,v)=4ūv | norm_h(v)=2∣v∣; induced topology equals ordinary topology; h(v,v)>0 for v≠0 | Consistent | None |
| Zero measure and a.e. quotient | μ=0 | every norm integral=0; all sections represent the same class; L²=0 | Consistent for quotient | None |
| Measurability independence | Möbius transition −1 | coordinate s↦−s; measurable iff s measurable; ∣−s∣=∣s∣ | Consistent | None |
| Completeness/trivial-bundle isometry | one point, unit mass, finite-dimensional F | L²=F; norm=‖v‖; F complete | Consistent | None |
| Completeness negative control | c₀₀ at one point, v_N=(1,1/2,…,1/N,0,…) | squared tail=Σ_{j>N}1/j²→0; limit has infinite support, outside c₀₀ | Finite-rank/complete model essential | None |
| Local unitary coordinates | frame (e₁,2e₂), section e₂ | coordinate=(0,1/2), norm 1/2; section norm 1; synthesis of (0,1) has norm 2 | Check reverses map | R09 |
| Compact-support density/injectivity | Lebesgue μ; zero μ | continuous nonzero bump has positive L² norm for Lebesgue; all bumps have norm 0 for zero μ | Full-support distinction correct | None |
| Separability context | locally finite Borel μ on countable atlas | countable exhaustion has finite measure pieces; simple rational frame coordinates form countable dense family | Result uses stated local-finiteness context | None |
| Restriction/zero extension, B2.3 | base two unit-mass points | ‖(u,v)‖²=∣u∣²+∣v∣²; restriction and extension give orthogonal coordinate projections | Consistent | None |
| Scalar multiplication operator | f=(2,i) on two points | operator norm=max(2,1)=2; adjoint multiplier=(2,−i) | Consistent | None |
| Indicator norm Check | rank-zero bundle, μ(U)=1 | projection 0 on zero Hilbert space; operator norm=0, advertised value=1 | Check needs rank condition | R09 |
| Metric-change map | h₁=4h₀ | H=4, H^{1/2}=2; ‖2s‖²_h₀=4‖s‖²_h₀=‖s‖²_h₁ | Consistent | None |
| Measure-change unitary | one point, μ=1,w=4 | ν=4; s↦2s; source norm=2∣s∣=target norm; inverse s/2 | Consistent | None |
| Measure-change positivity | two points, w=(1,0) | image has second component 0; cannot hit (0,1) | 0<w a.e. is used | None |
| Riesz/dual metric | fibre ℂ, h=ūv | R(iu)=−iR(u); h*(Ru,Rv)=v̄u=h(v,u); bilinear evaluation gives complex-linear dual map | Consistent | None |
| L² complexification | s=1,t=2 at one point | J(1,2)=(−2,1); complex vector 1+2i has squared norm 5 | Consistent | None |
| Base diffeomorphism functoriality | rotation φ of circle | U_φs=s∘φ⁻¹; U_φ⁻¹U_φs=s; arc-length integrals equal | Consistent | None |
| Density measure, B2.4 | ℝ², densities 1 and 2 | unit-square masses 1 and 2; Liouville densities dx∧dy and 2dx∧dy agree | Consistent | None |
| Frame bundle/recovery, B2.5 | rank 0; rank 1 | GL₀=1 and unique zero frame; GL₁=𝕜ˣ; [f,a]↦f(a) is unchanged by (fg,a)∼(f,ga) | Consistent | None |
| Reductions/extension | trivial G-bundle; circle squaring | reduction to H is a section of M×G/H; squaring sends transition g to g² and c₁ to 2c₁ | Consistent | None |
| Immersed reductions | dense irrational one-parameter subgroup in T² | intrinsic dimension 1; image dense, not subspace-embedded | Intrinsic topology required and specified | None |
| Adjoint bundle/pairing | G=Circle; SU(2) | abelian adjoint action trivial and bracket 0; negative Killing form positive on su(2) | Consistent | None |
| Möbius L² example | s(t)=cos(t/2) | s(t+2π)=−s(t); ∫₀^{2π}∣s∣²=π; ∫ℝ∣s∣²=∞ | One-period norm required | R09 |
| Principal connection, B3.1 | Maurer–Cartan θ, zero form | θ(A#)=A; zero form gives 0≠A for A≠0 | Reproduction excludes zero | None |
| Affine connection action | ω₁,ω₂ | (ω₂−ω₁)(A#)=0; (ω₁+ω₂)(A#)=2A | Difference basic, sum not a connection | None |
| Circle potential change | g=e^{iφ} | A′_real=A_real+dφ; complex expression adds i dφ | Consistent when identifications stated | None |
| Hopf reproduction | p=(1,0), X=(i,0) | Im(p̄X)=1; conjugated candidate gives −1 | Sign discriminated | None |
| Atiyah injection, B3.2 | M=point, P=G | V_ξ=ξ^R; [V_ξ,V_η]=−V_[ξ,η]; j=−V gives [jξ,jη]=j[ξ,η] | Consistent | None |
| Horizontal bracket defect | local circle A=x dy | horizontal X=∂x, Y=∂y−x∂θ; [X,Y]=−∂θ; F(X,Y)=1; j(F)=−∂θ | Consistent | None |
| Induced connection, B3.3 | circle dual representation | ∇σ=dσ−iAσ; ∇²σ=−iFσ | Consistent | None |
| Invariant tensor and pairing | identity endomorphism, dual sections | ∇id=[A,id]=0; derivative of φ(s) equals (∇φ)(s)+φ(∇s), A terms cancel | Consistent | None |
| Metric reduction | O(1) line | Lie O(1)=0; local metric connection potential=0; curvature=0 | Consistent | None |
| Curvature variation, B4.1 | constant su(2) A=X dx+Y dy, [X,Y]=Z | F=Z dx∧dy; F_{(1+t)A}=(1+t)²F; F+t d_AA+t²[A∧A]/2=(1+2t+t²)F | Consistent | None |
| Covariant square/Bianchi | abelian A=x dy; σ=1 | ∇²σ=Fσ; dF=d(dx∧dy)=0 | Consistent | None |
| Integration-by-parts sign | circle, α=sin t, β=cos t | ∫cos²t=π; −∫sin t·(−sin t)=π | Correct negative sign for degree 0 | None |
| Gauge composition, B4.2 | equivariant u,v | p v(p)u(pv(p))=p u(p)v(p); both equal Φ_uv(p) | Consistent for noncommuting u,v | None |
| Gauge infinitesimal action | u=e^{tξ} | derivative of Ad(u⁻¹)A+u⁻¹du is dξ+[A,ξ]; inverse pullback negates it | Consistent | None |
| Stabilizer | connected base, flat G-bundle with holonomy 1 | centralizer C_G(1)=G; constant parallel gauges=G | Consistent under connected based context | None |
| Torus coefficient/period lattice | angular coordinates, a=1 | hol=e^{−2πi}=1; coefficient shift=1, period shift=2π | B4/B5 normalization differs | R06 |
| Principal horizontal ODE, B5.0 | circle A=a dθ | g′=−ia g; g=e^{−iaθ}; loop value=e^{−2πia} | Consistent | None |
| Transport identity/reversal/composition | constant path, path with value g | identity=1; reverse=g⁻¹; path followed by reverse gives g⁻¹g=1 | Consistent | None |
| Smooth complete evolution | constant matrix coefficient A | g(t)=exp(−tA), defined for every finite t; g(t+s)=g(t)g(s) | Principal completeness plausible route owned | None |
| Thin-path relation, B5.1 | pause/backtrack; rank-two small rectangle | pause changes parametrization, transport unchanged; backtrack gives T⁻¹T=1; rectangle can have curvature holonomy≠1 | Thin condition discriminates | None |
| Reconstruction definition | P(t)=exp(−tA) | −P′(0)=A; opposite sign gives −A | Consistent | None |
| First-order triangle argument | A=X dx+Y dy | triangle holonomy=1+O(ts); diagonal linear derivative at 0 is 0 | Correct first-order, not exact-flatness claim | None |
| Reconstruction frame law | P′=g(y)⁻¹Pg(x), P(0)=1 | derivative gives A′=g⁻¹Ag+g⁻¹dg | Consistent | None |
| Inverse-transport derivative | scalar A=2, σ₀=3,w=5 | derivative e^{2t}(3+5t) at 0=11; w+Aσ₀=11; wrong sign=−1 | Correct Check; auxiliary padding | R07 |
| Transport/connection inverse | constant A on line | reconstructed A unchanged; reconstructed ODE solution exp(−tA) equals original | Consistent | None |
| Noninvertible intertwiners | projection ℝ²→ℝ, A=diag(a,b) | projection·exp(−tA)=exp(−ta)·projection; induced derivative relation a·projection=projection·A | Consistent | None |
| Metric compatibility iff isometric transport | scalar real A=1; imaginary A=i | e^{−t} changes norms; ∣e^{−it}∣=1 | Correct distinction | None |
| Flatness/local parallel frames, B5.2 | A=a dθ locally; A=x dy on disk | local gauge e^{−iaθ} makes potential 0; second curvature dx∧dy≠0 obstructs it | Consistent | None |
| Flat dictionary and quotient action | Γ=ℤ, ρ(1)=g | (a,h)·1=(a·1,g⁻¹h); [a₀·1,1]=[a₀,g]; hol=g | Correct inverse in quotient relation | None |
| Countability | torus, lens space, Hawaiian earring | π₁=ℤ², ℤ/n: countable; earring uncountable and fails local simple connectivity | Correct hypothesis control | None |
| Ambrose–Singer | flat connection; Hopf circle | curvature span=0 gives Lie H⁰=0; Hopf nonzero curvature spans ℝ, H⁰=Circle | Consistent | None |
| Full versus restricted topology | irrational cyclic subgroup of T² | H≅ℤ discrete intrinsically, H⁰=1; subspace closure=T² | Correct nonclosed model | None |
| Holonomy reductions | flat image μ_n; H connected | Q→M has n-point fibres and M′=Q when H⁰=1; M′=M when H=H⁰ | Consistent | None |
| Reduction deck-action direction | H/H⁰ elements h,k | h·(k·[q])=[q k⁻¹h⁻¹]=[q(hk)⁻¹]=(hk)·[q] | Correct left action | None |
| SmoothGoodCover definition | Euclidean ball, ρ(t)x | H(0,x)=0, H(1,x)=x, H(t,0)=0; 0≤ρ≤1 keeps image in ball | Determines actual contraction | None |
| Good-cover failure controls | annulus; disconnected two-arc intersection | π₁ annulus=ℤ≠0; intersection has two components, no single contraction centre reaches both | Both excluded | None |
| Good-cover refinement existence | empty M; discrete zero-manifold | empty index set covers ∅; singleton cover of discrete M has constant contractions | Consistent with Lean | None |
| Finite good-cover refinement | compact discrete M with k points | k singleton members suffice; k=0 gives empty cover; compact manifold admits finite chart cover and hence countable base | Consistent with Lean | None |
| Normal domains and strong convexity | unit S¹ | exp_p injective on (−π,π); open ball radius π/2 is strongly convex; radius>π/2 contains antipodal pair with two minimizers | Consistent | None |
| Raw versus reparametrized contraction | interval W=(−1,1), x=3/4 | raw H(2,x)=3/2 outside W; ρ(2)=1 gives 3/4 inside | Domain restriction essential and stated | None |
| Sheaves and exactness, seeded | connected open; empty open | ker exp(2πi·)=ℤ on connected open; Γ(∅)=0; f=z on S¹ has winding 1, no real lift | Stalk exactness correct | None |
| Smooth-sheaf acyclicity headline | point; S¹; n=1 | point positive H=0; smooth real H¹(S¹)=0; constant real H¹(S¹)=ℝ | Correct sheaf distinction | R01 concerns circle comparison |
| cechIntersection definition | tuple (a,a); (a,b) disjoint | first intersection=U_a; second=∅ | Consistent | None |
| locallyConstantRealSheaf definition | connected interval; empty set | sections ℝ and 0 respectively; constant presheaf instead gives ℝ on ∅ | Correct sheafification | None |
| Constant section and coordinate iff, seeded | connected W; empty W; two-component W | ℝ→ℝ identity/bijective; ℝ→0 not injective; diagonal ℝ→ℝ² not surjective | Good-cover iff true in both directions | None |
| Native Čech differential | c(a)=2,c(b)=5 | δc(a,b)=3; δc(a,a)=0; δ²c(a,b,c)=0 by cancellation | Consistent | None |
| Augmentation component, seeded | U=(M,M), global section 7 | augmentation=(7,7); either projection=7=restriction | Exact pinned theorem | Cite it, no new target needed |
| Augmentation conditionality, seeded | constant real sheaf on S¹ good cover | H⁰ map ℝ→ℝ identity; source H¹=0, target H¹=ℝ | Full augmentation not quasi-iso | Correct caveat |
| Raw refinement maps, seeded | U=(X,X), V=(X), r=0,s=1 | on (2,5), r*=2,s*=5; on cocycle (7,7), both 7 | Maps differ, cohomology maps agree | None |
| Refinement homotopy | same repeated cover | K(c₀₁)=c₀₁; Kδ(2,5)=3=s*(2,5)−r*(2,5) | Sign can be pinned this way | Add explicit K sign Check |
| Refinement coefficient products | point, ℕ repetitions, finite-dimensional ℚ category | C⁰ requires ℚ^ℕ, infinite-dimensional; in ModuleCat it exists | Missing product hypothesis | R04 |
| Spurious empty-factor Check | constant ℤ presheaf on two points | C⁰,C¹,C² ranks 2,4,8; d⁰,d¹ ranks 1,3; H¹ rank 4−3−1=0 | Stated condition insufficient | R09 |
| Repaired empty-factor Check | P(nonempty)=0,P(∅)=ℤ | ranks C⁰,C¹,C²=0,2,6; d ranks 0,1; H¹=ℤ | Nonzero class now exists | R09 |
| Coefficient connecting morphism, seeded | constant c∈ℝ/ℤ on S¹ | choose constant real lift; d(lift)=0; singular β⁰(c)=0 | Correct constant sequence | R01 |
| Smooth connecting-map winding Check | f(e^{iθ})=e^{iθ} | local lifts θ/(2π) differ by 1; sheaf connecting class=1; f is not singular 0-cocycle | False identification in text | R01 |
| Circle coefficient comparison | M=S² | H¹(const ℝ/ℤ)=0; H¹(smooth circle)=H²(ℤ)=ℤ | Vertical comparison not an isomorphism | R01 |
| Smooth/small cochain restriction | point; contractible simplex | cohomology degree 0=ℝ and positive degrees=0 on both; subdivision of interval gives [0,1/2]+[1/2,1] with same boundary [1]−[0] | Route coherent | None |
| Chain-integration naturality | f(t)=2t, η=dx on [0,1] | integral over mapped path=2; integral of f*dx=∫2dt=2 | Consistent | None |
| Total differential | ω₀=x dy,ω₁=0 on overlap ℝ² | δdω=−dx∧dy=dδω; D²=0, unsigned version=−2dx∧dy | Sign discriminated | None |
| Čech/de Rham comparison | oriented S¹ | ∫dθ/(2π)=1; integer Čech generator evaluates 1 | Consistent normalized edge maps | None |
| Fundamental-class pairing | S¹, dθ; CP¹ Hopf F | both sides 2π; normalized Hopf class evaluates 1 | Consistent, source contract owned here | None |
| Circle classification, B6.2 | point; S², Hopf/dual/tensor | H²(point)=0; S² classes 1,−1,2,0 for Hopf, dual, square, tensor with dual | Consistent | None |
| Pullback of c₁ | constant map; degree d on S² | class pulls back to 0; degree-d pullback evaluates d | Consistent | None |
| Chern–Weil periods, B6.3 | unit S², F=c dvol | ∫F/(2π)=2c; c=1/2 gives 1; c=1/3 gives 2/3 | Correct integrality criterion | None |
| Torus constant curvature | angular x,y, c=1/(2π) | ∫F=2π; Chern number 1; text's c∈2πℤ rejects it | Normalization defect | R06 |
| Curvature adjustment | F′=F+da | closed-cycle period of da=0; class unchanged | Consistent | None |
| Flat circle classification, B6.4 | S¹; lens L(n,1) | H¹(S¹;ℝ/ℤ)=ℝ/ℤ, c₁=0; lens flat classes ℤ/n with real c₁=0 | Consistent after repair | R01 |
| Kernel/Ext formula | H₁=ℤ/n; H₁=ℚ | Ext(ℤ/n,ℤ)=ℤ/n; Ext(ℚ,ℤ) nonzero torsion-free, while Hom(H₂,ℤ)→Hom(H₂,ℝ) injective | Finite-generation qualifier correct | None |
| Fixed-curvature torsors, B6.5 | lens space F=0 | all-bundle torsor has n elements; fixed-bundle torsor H¹_dR/image=0 has one | Distinction correct | None |
| Change of origin | A=A₀+a,A₁=A₀+b | coordinates a and a−b; translation=−b | Sign correct | None |
| Lattice torus, B6.6 | rank 0; trivial rank 1 | Λ=0 gives zero torus and H²=0; Λ=ℤ gives circle exponential sequence | Consistent with coefficient-sign adapter | Make adapter explicit |
| Twisted lattice torsor | S¹, monodromy −1 | cellular complex has no degree-2 cells; H²(S¹;Λ)=0; linear monodromy remains −1 | Trivial torsor ≠ trivial local system | None |
| Integral transition rule | rank 1, scalar 2 | 2ℤ is a proper subgroup of ℤ; 2∉GL₁(ℤ) | Does not preserve lattice as equality | None |
| Lens-space quotient map, B7 | relation (vζ,ζ⁻¹λ) | vζζ⁻¹λ=vλ; wrong relation gives vζ²λ | Correct for n≥3 | None |
| Lens Bockstein sign | n=3,χ=1/3 | lifted coboundary=3·(1/3)=1; inverse convention gives −1=2 mod 3 | Sign distinguished | None |
| Lens image/kernel reductions | n=6,k=2; k=0 | image μ₃, kernel ℤ/2, Q=S³/μ₂; k=0 gives image 1,Q=L(6,1) | Consistent | None |
| Lens curvature/integral class | n=3,k=1 | integral c₁=1 mod 3≠0; real c₁=0; flat F=0 | No torsion discarded | None |
| Formal adjoint, B8.1 | n=2,r=1; n=3,r=2 | signs −1 and +1; d*(f dx)=−∂x f | Correct formula | None |
| YM energy/positivity | Hopf on unit S²; flat bundle | ∣F∣²=1/4, area=4π, YM=π; flat YM=0 | Correct normalization | None |
| YM gauge invariance | Ad-invariant B | B(Ad_gF,Ad_gF)=B(F,F); energy unchanged | Correct under stated B | None |
| First variation, B8.2 | abelian F+t da | derivative=2(F,da); integration by parts gives 2(d*F,a) | Consistent | None |
| Mixed Hessian | A=X dx+Y dy,[X,Y]=Z; a=X dx,b=Y dy | F(t,s)=(1+t)(1+s)Z; mixed energy derivative=4‖Z‖²; two RHS terms each 2‖Z‖² | Curvature sign and coefficient discriminated | None |
| Gauge-fixed symbol | ζ=(1,0) in ℝ² | symbol d*d=diag(0,1); symbol dd*=diag(1,0); J symbol=id | Ellipticity restored | None |
| Gauge kernel and J kernel | flat circle connection on T² | L(dξ)=0; J=Δ; ker J=constant harmonic 1-forms=ker L∩ker d* | Consistent | None |
| Spectral realization | flat torus J=Δ | eigenvalues ∣k∣²≥0; zero eigenspace finite; negative space dimension 0 | Consistent compact case | None |
| Coulomb decomposition | Fourier mode k≠0 | vector splits into k-parallel and k-orthogonal parts; sum is original vector, inner product 0 | Consistent | None |
| Conformal scale, B8.3 | g′=λ²g, n=4 or 2 | energy factor λ^{n−4}; n=4 gives 1, n=2 gives λ⁻²; Hopf energy π/λ² | Consistent | None |
| Stationary circle connections | closed manifold, A=A₀+a | d*da=0 implies ‖da‖²=(a,d*da)=0; hence da=0 | Torsor of closed forms correct | None |
| Torsion stationary example | L(n,1), real c₁=0 | harmonic curvature=0, stationary iff flat | Consistent | None |
| Supply graph | SBC B2→CKG K5a→SBC B8 | both roadmap-level edges present; directed 2-cycle | Violates single direction | R02 |

**Pinned-library audit.** The manifest and actual library checkouts agree: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following 24 entries record declarations whose definitions or relevant hypotheses were opened. Paths in this table are relative to the corresponding library repository.

| Declaration / object | File and line at the pin | What was verified |
|---|---|---|
| `constantSheaf` | `Mathlib/CategoryTheory/Sites/ConstantSheaf.lean:64` | Sheafification of the constant presheaf, not the presheaf itself. |
| `constantSheafAdj` | `Mathlib/CategoryTheory/Sites/ConstantSheaf.lean:68` | Adjunction to sections over the supplied terminal object; it determines the retained constant-section map. |
| `cechComplexFunctor` | `Mathlib/CategoryTheory/Sites/SheafCohomology/Cech.lean:65` | All ordered tuples, repetitions included; products assumption at line 31. |
| `cechAugmentation` | `TauCeti/CategoryTheory/Sites/SheafCohomology/Cech.lean:198` | Source is global sections in degree zero and target is the actual native complex. |
| `cechAugmentation_f_zero_comp_π` | Same file, line 209 | Exactly the restriction equation displayed in the sample; no new theorem is required for its specializations. |
| `quasiIsoAt_cechAugmentation_zero_iff` | Same file, line 298 | Presieve sheaf condition, not an all-degree acyclicity assertion. |
| `quasiIso_cechAugmentation_iff` | Same file, line 309 | Adds `ExactAt (n+1)` for every n; confirms the README's conditionality. |
| `Sheaf.H` | `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56` | Ext from constant `ULift ℤ`; sheafification/Ext hypotheses are resolved in the actual Lean target. |
| `smoothSheafCommGroup`, generated `smoothSheafAddCommGroup` | `Mathlib/Geometry/Manifold/Sheaf/Smooth.lean:230` | Actual smooth-map sections; additive name is generated by `to_additive`, not missing. |
| `smoothSheafCommGroup.compLeft`, additive counterpart | Same file, line 244 | Requires a smooth group homomorphism; provides the exponential sheaf map after the stated transport. |
| `IsSubmersionAt` | `Mathlib/Geometry/Manifold/Submersion.lean:171` | A local product normal form with a chosen complement, not merely a bare derivative predicate. |
| `IsSmoothEmbedding` | `Mathlib/Geometry/Manifold/SmoothEmbedding.lean:72` | Immersion plus topological embedding; no ambient Hausdorff field is baked into this structure. |
| `exists_isManifold_sectionZero_of_contMDiff` | `TauCeti/Geometry/Manifold/VectorBundle/Section/SmoothZero.lean:63` | Self-modelled Banach source, Fredholm/surjective linearization and fixed index; no T2 assumption. B1.0 explicitly owns the atlas adapter. |
| `sectionZeroChartedSpace` | `TauCeti/Geometry/Manifold/VectorBundle/Section/Chart.lean:246` | Native subtype atlas. Its model-space specialization does not already give the full manifold-target theorem. |
| `CovariantDerivative` | `Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/Basic.lean:365` | Raw sections in the carrier; differentiability-qualified axioms. B5.1 correctly restricts uniqueness to differentiable germs. |
| `curvatureOperator` | `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Basic.lean:85` | Ordered commutator minus bracket term; an unbundled section with smoothness supplied separately. |
| `ContinuousRiemannianMetric` | `Mathlib/Topology/VectorBundle/Riemannian.lean:468` | Real bilinear positive forms, bounded unit balls and continuity in the Hom bundle. No complex Hermitian version is supplied by this declaration. |
| `Lp.dense_hasCompactSupport_contDiff` | `Mathlib/Analysis/Normed/Lp/SmoothApprox.lean:102` | Finite-dimensional source and local measure finiteness; finite p≥1. The roadmap localizes into this situation. |
| `MemLp.exists_hasCompactSupport_eLpNorm_sub_le` | `Mathlib/MeasureTheory/Function/ContinuousMapDense.lean:141` | R1, weak local compactness and regular measure hypotheses. Locally finite Borel measures on the stated second-countable manifolds provide the required setting. |
| `IsNormalDomain`, `riemannianLog` | `TauCeti/Geometry/Manifold/Riemannian/Geodesic/Normal.lean:85`, line 224 | Open star-shaped domain, origin, exponential-domain containment, injectivity and local diffeomorphism; logarithm has junk values outside its stated image. |
| `EMetricSpace.ofRiemannianMetric` | `Mathlib/Geometry/Manifold/Riemannian/Basic.lean:545` | Requires T3, correctly derived here from Hausdorff local compactness. |
| `exists_contDiffAt_picard_solution` | `TauCeti/Analysis/ODE/SmoothParameter.lean:207` | Has the zero-field base-parameter hypothesis. The README explicitly owns time rescaling and does not apply it directly to a time component equal to 1. |
| `leftInvariantDerivationLieEquivGroupLieAlgebra` | `TauCeti/Geometry/Lie/Tangent/LieEquiv.lean:103` | Finite dimension and identity-interior hypothesis, both available for the stated groups. |
| `MulAction.instChartedSpaceQuotient` | `Mathlib/Geometry/Manifold/Instances/Quotient.lean:49` | Free properly discontinuous actions with T2/local compactness, not arbitrary free proper positive-dimensional group actions. |

Additional concrete checks: native `Aut` multiplication is `Iso.trans y x` (`Mathlib/CategoryTheory/Endomorphism.lean:131`); `GroupLieAlgebra` is the tangent space at the identity (`Mathlib/Geometry/Manifold/GroupLieAlgebra.lean:56`); positive matrix square-root inverse/determinant laws are in `Mathlib/Analysis/Matrix/Order.lean:142` and 148; the operator topology is in the **Matrix** namespace at `TauCeti/Analysis/Matrix/Normed.lean:33`. The lens-space manifold section at `TauCeti/Geometry/Manifold/Instances/LensSpace.lean:53` requires nonzero n and unit weights; B7's n≥2 and weights 1 meet them. Searches by object throughout both pinned trees found no principal-bundle mixin, `SmoothBundleForm` or manifold `mextDeriv` implementation. The bare normed-space exterior derivative is not that manifold carrier. Searches located 79 names from the supplier table; this is a name-location count, not 79 completed theorem verifications.

**Ownership and supplier resolution.** The main content checkout is `9c6e95d9`. DifferentialGeometry, HopfRinow and AlgebraicTopology were also read as merged-roadmap shape examples. Cross-roadmap supply was resolved against main for existing roadmaps, not against revisions in their open pull requests. The worker's unresolved-name lead `SmoothSimplex.integral_mextDeriv` is not drift: it is explicitly a target in DifferentialGeometry 8.4 at line 848, not a declaration claimed to be in the pinned libraries.

| Supplier / cited interface | Resolved file and line | Result |
|---|---|---|
| DifferentialGeometry forms, exterior derivative, coverings, flows, distributions | `TauCetiRoadmap/DifferentialGeometry/README.md`, Layers 0–1 and 2.3; 3.5 at 400; 4.3 at 463 | Named supplier sections exist; manifold forms remain planned, while some native distributions/flows are implemented. |
| DifferentialGeometry integration/homotopy/densities | Same file, 5.4 at 524 and 5.5 at 528 | Homotopy operator uses M×Icc(0,1); B6.0 supplies swap/restriction from its ℝ×W contraction. |
| DifferentialGeometry smooth chains and de Rham | Same file, 8.3 at 836, 8.4 at 845, 8.5 at 852 | T2, σ-compactness and finite dimension retained. B6.1's second-countable manifold setting makes its open subsets σ-compact. |
| DifferentialGeometry pairing and metrics | Same file, 9.1 at 866; 12.1 at 915; 12.4 at 923 | Pairing/density interfaces present; action-invariance is absent from 12.1 (R03). |
| LieGroups | `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md`, Layer 0 at 233, Layer 1 at 261, closed subgroups and Layer 4 `integralSubgroup` | Exponential/adjoint/embedded and immersed subgroup contracts exist; this folder does not create competing Lie-algebra carriers. |
| AlgebraicTopology small chains and cellular comparison | `TauCetiRoadmap/AlgebraicTopology/README.md:481–486`, 515–534, Stage 4.6 | Small-chain equivalence and chosen cellular chain representatives/homotopies are supplied; no strict natural cellular-chain map is assumed. |
| AlgebraicTopology coefficients/local systems | Same file, Stage 6.1 at 1011–1055 | Actual local-coefficient cochains, UCT and both specified coefficient sequences are present; the smooth exponential sequence is a different sequence (R01). |
| AlgebraicTopology orientation/fundamental class | Same file, Stage 6.3 at 1180 and tangent comparison at 1253 | Orientation-line and chart-normalized comparison exists. The integral-pairing theorem remains a B6.1 target, as repaired. |
| DGFloer degree-one Hurewicz | `TauCetiRoadmap/DGFloer/README.md:453` | Natural degree-one abelianization theorem with normalized loop map; not re-owned here. |
| HopfRinow | `TauCetiRoadmap/HopfRinow/README.md`, Layers 1–2 | Geodesics, local exponential/logarithm and Gauss lemma; B6.0 adds given-metric strongly convex neighbourhoods/good covers. |
| ComplexKahlerGeometry | `TauCetiRoadmap/ComplexKahlerGeometry/README.md:570`, 580, 1407 | K5a and K7.1 exist. K7.1 says its charts are independent of B2/K5, but K5a expressly consumes B2–B4: R02. |
| UniversalCovers | `Completed/UniversalCovers/README.md:89–118` | Universal cover, deck group and regular-cover quotient conventions; the actual construction is consumed through Tau Ceti. |

Object searches used the roadmap service across main and open heads, plus the board's package READMEs. Candidate overlaps were checked in the supplied sibling files, especially LieGroupoidsPoisson, TopologicalSheafCohomology, GeometricQuantization, FourManifolds, InstantonFloerTheory and LocalVariationalFieldTheory. The latter's jet/Euler–Lagrange development is not a second owner of the bundle foundation or B8's fixed-connection spectral operator. AlgebraicVectorBundles concerns algebraic bundles; its carrier differs. ComplexKahlerGeometry K2 explicitly leaves the scalar good-cover comparison to this roadmap (line 283), while owning analytic fine resolutions and the more general analytic-sheaf comparison.

Two ownership moves need to be explicit in the library plan. LieGroupoidsPoisson's supplied open README still owns regular fibres/transverse fibre products/kernel distributions at G0.1 (lines 174–247) and fundamental-group countability at G0.0 (158–163). TopologicalSheafCohomology's supplied open README still owns arbitrary-space raw native refinements and homotopies at TS1.1–1.2 (lines 43–45). Both are later than SmoothBundlesConnections. Under the brief's direction rule these prerequisites move **here**, and those later roadmaps should import them. This records the transfer required by the earlier repair and avoids reintroducing upward supplier lines. Their later compact/support comparisons and groupoid structures stay there. No existing main roadmap named SmoothBundlesConnections was re-planned, and none of the retained fully qualified Lean names collides with the readable sibling declarations.

The consumer references are deferrals, not supplier edges. No declared gap covers R03. The package search found no second owner of the general smooth bundle foundation. Open work outside the supplied readable sibling set was not independently opened or certified.

**Seeded source audit.** All five requested paragraphs were inspected individually. None is labelled unverified in the README; none contains a literature locator to open. The first, second, fourth and fifth therefore fail the locator audit (R08), although their mathematics was independently tested, with R01/R04/R09 recording the resulting defects. The third is supported directly by the three pinned augmentation declarations above: degree-zero restriction, the degree-zero sheaf criterion, and the additional all-positive-degree exactness criterion. Thus a source-free assertion of full augmentation exactness has not been inferred from good-cover coordinates.

All nine referenced works were submitted to the sources service; six yielded legal readable texts. Additional locator checks follow. No source passages were copied into repository files or this report.

| Source | Locator actually read | Scope / result |
|---|---|---|
| kms | §9.2, printed p.77, lines 3583–3596; §9.3, pp.77–78, lines 3597–3619 | Proper surjective submersion over connected base and horizontal/vertical splitting support B1.5. The source uses ordinary Hausdorff manifolds; B1.0's non-Hausdorff extension instead has its explicit local pinned-library route. |
| kms | §10.3, printed pp.87–88, lines 4037–4053 | Smooth free action with orbits equal to fibres of a surjective submersion gives the local principal trivializations. |
| kms | Theorem 11.7, printed p.106, lines 4866–4909 | Conjugation, restricted/full holonomy, reductions and flatness checked. The all-total-space curvature span in item (4) is erroneous as printed; the README's transported-to-basepoint formulation avoids it. |
| meinrenken | Theorem 1.21, p.10, lines 293–305; Theorem 1.25, p.12, lines 371–381; Corollary 1.27, p.12, lines 386–390 | Free proper quotient and local slice supported. The theorem's displayed global codomain has a misprint. Invariant-metric proof uses the slice theorem, relevant to R03. |
| schreiber-waldorf | arXiv:0705.0452v5, Proposition 4.7, printed p.30, lines 1058–1070; Appendix B.4, pp.63–64, lines 2374–2408; Theorem 5.8, p.39, lines 1418–1428 | Local general Lie-group reconstruction and the negative derivative sign are present. Theorem 5.8 is Hermitian/unitary; B5.1 explicitly owns its GL_n real/complex fixed-bundle extension rather than attributing that extension to 5.8. Published-version pagination not certified. |
| freed | arXiv hep-th/9206021, §1, printed pp.7–8, equations (1.5), (1.8)–(1.16), lines 294–353 | Right-action convention, Maurer–Cartan normalization, connection equivariance, curvature and Bianchi agree. Its compact-group setting is not used alone to justify the roadmap's broader G; KMS supplies that setting. |
| donaldson-gauge | §2.1, printed p.3, lines 120–180; §2.2, p.3, lines 188–219 | YM normalization, gauge-fixed ellipticity and finite negative space; conformal invariance is discussed in §2.2, not the narrower §2.1 citation at README 1558. Change that locator to §2.2, p.3 as part of R08. |
| jiang-yangmills | §2, p.8, lines 306–311; Proposition 2.9, p.11, lines 401–418; Exercise 2.11, p.11, lines 424–428; Proposition 2.12/discussion, p.11, lines 431–443 | Variation and circle examples checked with the roadmap's coefficient 2. Several source errors are listed below; the roadmap's positivity, stationarity and gauge-fixing distinctions correctly avoid them. |

## Not verifiable

- The five seeded paragraphs have no literature theorem/page to verify. Native facts and concrete mathematics were checked as stated above; no replacement literature locator was invented. All of B6's deeper classification/comparison claims need the author-supplied source audit requested in R08.
- **lee-rm:** Lee, *Introduction to Riemannian Manifolds*, second edition, 2018, Lemma 6.16 and Theorem 6.17. The sources service tried the title and DOI 10.1007/978-3-319-91755-9; arXiv lookups returned HTTP 503/429 and the publisher was identified as paywalled. No readable text was returned. The geometric instances were computed independently; numbering/content at this locator remains uncertified.
- **lee-sm:** Lee, *Introduction to Smooth Manifolds*, second edition, 2013, Corollary 5.14, Proposition 5.38 and Theorems 21.10/21.17. The service returned `uncertified` for the paywalled publisher. It was not added to the missing-text request. KMS and Meinrenken support overlapping claims, but do not verify Lee's numbering.
- **kobayashi-nomizu:** *Foundations of Differential Geometry* I, Chapter II §§1–5, 7–9 and Appendix 4. The service's title lookup failed after HTTP 429 and a JSTOR landing page that did not provide the book. No legal readable copy was obtained. KMS verifies overlapping holonomy statements; it does not certify the Appendix 4 locator.
- The read Schreiber–Waldorf text identifies itself as arXiv v5 (2014). Its cited proposition/theorem numbers were checked there, but agreement of pagination and wording with the 2009 published version was not independently verified. R08 asks for an explicit version note.

Missing-text details were saved in the job's reference-request artifact. The review is complete with these limitations; it is not an acceptance conditional on reading the missing books. No manifest, roadmap, library, merge-order file, pull request or issue was edited.

## Source issues

- **Error** in kms at Theorem 11.7(4), printed p.106: the source says curvature at every point of the total principal bundle spans the based holonomy algebra; it should be curvature on the based holonomy reduction, equivalently parallel-transported curvature at the fixed basepoint; affects a stated result.
- **Misprint** in meinrenken at Theorem 1.25, printed p.12: the source says the slice model is equivariantly diffeomorphic to the whole manifold; it should be equivariantly diffeomorphic to an invariant neighbourhood of the orbit; affects a stated result.
- **Error** in jiang-yangmills at §2 opening, printed p.8: the source says a compact Lie group has semisimple Lie algebra and nondegenerate Killing form; it should be compact Lie algebras may have centre, so choose a positive Ad-invariant inner product; affects a stated result.
- **Misprint** in jiang-yangmills at proof of Proposition 2.9, printed p.11: the source says the formal adjoint has sign (−1)^(2n+1) without a degree parameter; it should be (−1)^(n(r+1)+1) on r-forms, hence (−1)^(3n+1) on curvature; affects the proof.
- **Error** in jiang-yangmills at Definition 2.10, printed p.11: the source says solving the Yang–Mills equation means being a local extremum; it should be being stationary, which also permits saddle points; affects a stated result.
- **Misprint** in jiang-yangmills at discussion after Proposition 2.12, printed p.11: the source says the linearized Yang–Mills operator is the Hessian of its unhalved energy; it should be half the Hessian of that energy; affects a stated result.
- **Gap** in jiang-yangmills at discussion after Proposition 2.12, printed p.11: the source says the ungauged Hessian permits an index calculation of the dimension of the solution space; it should be gauge fixing and an elliptic deformation complex with obstruction analysis are required; affects the proof.
- **Misprint** in schreiber-waldorf at Proposition 4.7, arXiv v5 printed p.30: the source says the functor target uses X directly in place of its thin path groupoid; it should be the smooth functor category from P₁(X) to BG; affects nothing.
- **Misprint** in schreiber-waldorf at Lemma B.2 proof, arXiv v5 printed p.64: the source says the equal-velocity condition compares derivatives of γ₁ and undefined γ₂; it should be derivatives of the two introduced curves γ₀ and γ₁; affects nothing.

