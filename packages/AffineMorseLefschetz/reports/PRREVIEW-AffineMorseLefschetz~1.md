# Review of AffineMorseLefschetz (pull request #1764 at 0561aef)

**Verdict:** needs changes

AI review of the whole folder at the requested head. Eight findings, four blocking. This is a repairable revision of the existing roadmap, not a replacement roadmap. No PR file was changed.

## R01 (P1) — Remove the reciprocal RealAnalyticGeometry supply

**Location:** TauCetiRoadmap/AffineMorseLefschetz/README.md:463 and :490–500; “For the band transfer consume”.

**Claim:** A4.1 imports RealAnalyticGeometry R2's band helpers while supplying the construction consumed by RealAnalyticGeometry R2.1. Making the helpers independent of the analytic induction resolves a proof-level cycle, but does not give the required single direction of supply between roadmaps.

**Witness:** TauCetiRoadmap/RealAnalyticGeometry/README.md:28–34 imports A4.1; :188–194 supplies helpers back to A4.1. There are two oppositely directed supplier edges.

**Repair:** Move the elementary continuous band-closure, endpoint/restriction and collapsed-band continuity targets to the earlier owner of the semialgebraic lift, and record that ownership move. RealAnalyticGeometry should consume them with A4.1; A4.1 should not consume RealAnalyticGeometry. Coordinate the corresponding ownership reference, without duplicating a second implementation. On the two-node witness this removes the return edge and leaves one supplier direction. The mechanical check printed zero problems; it does not negate these explicit reciprocal contracts.

## R02 (P1) — Replace nonexistent GeometricTopology exports with declared contracts

**Location:** TauCetiRoadmap/AffineMorseLefschetz/README.md:164–177 and :256–262; “Consume GT Layer1's”.

**Claim:** The distance-Morse route consumes named GT exports that its allowed main-branch version does not supply. The stronger relative/adaptive smooth-triangulation refinement is also not specified there. No supplier gaps are declared.

**Witness:** TauCetiRoadmap/GeometricTopology/README.md:177–287 has collars and tubular neighborhoods, but none of the six named Euclidean exports. Its smooth-triangulation step at :938–943 does not state the required adaptive refinement.

**Repair:** State precise named GeometricTopology supplier gaps, with matching plan slugs and README contracts, for the missing Euclidean distance/normal-endpoint interface and the adaptive refinement actually needed. Alternatively cite an implemented provider with its exact signatures. The missing Euclidean names are:
- euclideanChartSquaredDistanceHessian;
- euclideanChartNormalDerivativePairing;
- euclideanNormalEndpoint_criticalImage_isNull;
- ae_nondegenerateCriticalPoints_euclideanSquaredDistance;
- ae_isMorse_euclideanSquaredDistance;
- euclideanSquaredDistance_isProper.

Searches of main, the supplied GeometricTopology open checkout, and both pinned libraries found no declarations with these names; the main Layer 1 text also lacks their stated mathematics. RiemannianGeometry R6 repeats the consumption and therefore is not an alternative provider. For the adaptive contract specify compact exhaustion K_r with K_r contained in the interior of K_(r+1), locally finite refinement, and the condition that every simplex meeting K_r lies in K_(r+1). Test the distance contract on the closed graph z↦(z,z²), and the refinement on the line exhausted by compact intervals. General smooth triangulation alone does not provide that quantified refinement.

## R03 (P1) — Clear the build gate's non-sorry warnings and import failures

**Location:** TauCetiRoadmap/AffineMorseLefschetz/Suggested.lean:1–6; “import Mathlib.LinearAlgebra.Projectivization.Basic”.

**Claim:** The supplied gate records build=5, imports=1, mathlib-subimports=5 and no-import-mathlib=1. The five build failures are module-system warnings, not failed theorem elaboration. The brief requires those build-gate failures to block acceptance.

**Witness:** The targeted build reproduces five non-sorry import warnings. Direct Lean elaboration succeeds with four sorry warnings. All five Mathlib imports are submodule imports and the required root import is absent.

**Repair:** Replace the five Mathlib submodule imports by one leading `import Mathlib`, retaining `import TauCeti.Analysis.Calculus.Morse.Index`. A scratch copy with exactly this header elaborated successfully with only four sorry warnings. Re-run the targeted build and gate on the repaired head. Do not add an option override or follow the warning's alternative suggestion in place of the prescribed import form.

## R04 (P2) — State the closed-holomorphic-embedding CW headline

**Location:** TauCetiRoadmap/AffineMorseLefschetz/README.md:176–184; Suggested.lean:9–12; “CW model of real dimension≤n”.

**Claim:** The Lean file omits A2's central closed-embedding theorem and gives only a general statement that manifold/CW results are README targets. This headline can already be stated on native pinned carriers, without a new manifold or CW encoding.

**Witness:** A scratch theorem using Mathlib's IsManifold, Manifold.IsImmersion, Topology.IsClosedEmbedding, Topology.CWComplex and ContinuousMap.HomotopyEquiv elaborates with only sorry.

**Repair:** Include the closed holomorphic embedding headline, with Hausdorffness, second countability, finite complex dimension and closed embedding explicit. The following tested signature demonstrates statability; use the roadmap's final name and documentation:

```lean
import Mathlib

open scoped ContDiff Manifold

theorem closed_holomorphic_embedding_cw_bound {n N : ℕ}
    (M : Type) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (Fin n → ℂ) M] [IsManifold 𝓘(ℂ, Fin n → ℂ) ∞ M]
    (i : M → (Fin N → ℂ))
    (hi : Manifold.IsImmersion 𝓘(ℂ, Fin n → ℂ) 𝓘(ℂ, Fin N → ℂ) ∞ i)
    (hc : Topology.IsClosedEmbedding i) :
    ∃ (K : Type) (t : TopologicalSpace K) (c : @Topology.CWComplex K t Set.univ),
      Nonempty (@ContinuousMap.HomotopyEquiv M K _ t) ∧
      ∀ k, n < k → IsEmpty (@Topology.CWComplex.cell K t Set.univ c k) := by
  sorry
```

For ℂ the model can be a point, with no cells above dimension 1; for ℂ* a circle has one 0-cell and one 1-cell. Both satisfy the actual conclusion. Enumerate the remaining headlines individually in the module docstring, stating the missing carrier for any genuinely unstatable one. The existence of a proof is not required before stating its acceptance test.

## R05 (P3) — Replace all eleven commit-pinned supplier links

**Location:** TauCetiRoadmap/AffineMorseLefschetz/README.md:12–32, :244 and :463.

**Claim:** The links freeze supplier contracts at historical commits instead of citing their maintained roadmap sections.

**Witness:** The worker gate and rerun both report blob=11: lines 12, 16, 18, 21, 24, 26, 29, 30, 32, 244 and 463.

**Repair:** Cite roadmap names and sections, or repository-relative/main links. Point RealAlgebraicGeometry at its Completed location. Re-resolve the contracts after replacing the links; merely changing URLs does not fix R01 or R02. The eleven listed locations account for every blob failure.

## R06 (P3) — Remove API scaffolding that serves no headline

**Location:** TauCetiRoadmap/AffineMorseLefschetz/Suggested.lean:19–50, :64–75 and :100–108.

**Claim:** The coefficient-space, incidence and Jacobian definitions support no theorem in this file. The zero-locus representative test is elementary carrier API, and the two proved helpers are auxiliary disjointness/eigenvector steps rather than headline acceptance tests. The zero-locus definition itself does not occur in the representative theorem's type.

**Witness:** None of projectiveCoefficientSpace, complexProjectiveIncidence or projectiveConeJacobian occurs in a theorem signature. The representative test restates line membership via homogeneity; J_mem_neg_eigenspace rewrites the eigenvector equation.

**Repair:** Delete this unused scaffolding and these auxiliary declarations from `Suggested.lean`; retain their mathematics in README API/Checks. Keep definitions only where a retained headline actually needs them. This is a role/size finding, not a claim that all four admitted theorems close by simp: all four failed the rfl, simp and infer_instance probes. The three index/dimension targets survived that padding test.

## R07 (P3) — Supply per-definition Checks and explicit layer dependencies

**Location:** TauCetiRoadmap/AffineMorseLefschetz/README.md:67–150 and :388–486, with the same omission throughout.

**Claim:** The prose lists substantial API, but lacks the required per-definition discriminating Checks and target-level Needs lines. It also lacks the prescribed Summary, Scope and ownership, Exact supplier contracts, How to read the build, numbered Layer sections, and per-layer Examples/Dependencies. A general examples section cannot test the new stack, restriction and extension definitions.

**Witness:** There are zero Checks blocks and zero Needs lines. A1 requests “explicit inertia” without supplying values; A4.1 gives formulas for auxiliary stacks and E_l without a worked boundary computation.

**Repair:** Preserve the mathematics while organizing it into the required shape. Attach API bullets and at least three discriminating Checks to each definition, and list the statement/proof-route inputs for each target. For example: Hessians diag(2,2), diag(2,−2), diag(6,−2) give Levi values 1,0,1 and indices 0,1,1. For E_l use the interval, collapsed-gap and vertex-limit computations below. Separate A4.0's generic prerequisites from A0–A3. Restore README/Lean name agreement and declaration docstrings as part of the acceptance-file cleanup; leviDiagonal currently has no docstring and most Lean names are absent from the README.

## R08 (P3) — Add claim-level source locators and the source record

**Location:** TauCetiRoadmap/AffineMorseLefschetz/README.md:210–351, :371–382 and :599–611.

**Claim:** The sampled A4.0 has no exact source locator for its generic locally finite/local-coefficient duality theorem. A4.1 gives two theorem numbers and a section but no printed pages, and its detailed completed-list/extension/pulling refinements are not distinguished from what those sources prove. The folder has no sources.toml.

**Witness:** References list four works without printed pages; A4.0 names Hatcher only for a convention. BCR §9.2 is the only reference attached generally to A4, which includes much more than compact semialgebraic triangulation.

**Repair:** Add theorem/section and printed-page locators at the claims, distinguishing source theorems from new consequences and supplying the latter's inputs. Record each work once in sources.toml with the service's provenance/status. Hatcher §3.3, pp.239–240 verifies the cap convention; Theorem 3.43, p.254 covers compact orientable triads, not by itself all four arbitrary-local-system noncompact formulas. Supply a legal locator for that extension or describe its complete derivation through the stated supplier contracts. Record BCR as uncertified if only the paywalled locator is available; do not claim its detailed proof was verified.

## Verified sound

The checks below are instance calculations and signature/source audits, not proofs of every proposed theorem. No mathematical counterexample to the displayed index, shape-operator, cap-sign, compact-pair or Lefschetz formulas was found. The source and supplier limitations remain explicit.

The requested head was verified. The diff outside TauCetiRoadmap/AffineMorseLefschetz is empty, and the worktree remains clean. This PR changes A4.1 within its existing ownership; it does not re-plan the base roadmap. There are no sorry'd data, option overrides, admitted examples, route-specific arithmetic exclusions or executable algorithm deliverables. The recursive triangulation paragraphs describe a mathematical existence proof, not a computational implementation.

The full gate rerun reports the same eleven blob links and all three import-rule failures. The targeted build exits successfully but reproduces the worker's five non-sorry warnings, so the supplied build gate remains failing. Direct `lake env lean` on the original file reports only four sorry warnings. The import-repaired scratch copy also elaborates with only those warnings.

The dependency command, with the supplied order, main content and movable flag, printed exactly:

```text
depcheck: 205 roadmaps, 1649 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. R01 is a separate textual two-way supply witness, not a claim that this output reported a cycle.

All 12 declarations were re-elaborated with `#check @name` on a scratch copy. No needed binder was lost: realHessian and leviDiagonal are meaningful without finite dimensionality; the disjointness and eigenvector facts also hold in infinite dimension, and explicitly omit that instance. All three numerical dimension/index bounds retain finite dimensionality. The polynomial carrier definitions allow arbitrary index types; no finite-dimensional parameter-space theorem is asserted for those larger carriers in Lean. The homogeneous-representative theorem retains both homogeneity and nonzero-vector hypotheses.

Four admitted theorems were each tried with rfl, simp and infer_instance. None closed. Object searches found no matching pinned single-lemma proof for the complex index bounds. The A0 API-role issue is R06, independently of tactic length. No equal fully qualified declaration name was found in a different inspected roadmap.

### Headline inventory

| README headline | Acceptance-file assessment |
| --- | --- |
| A1 strict Levi index bound λ≤n and q-positive bound λ≤n+q | The two morseIndex theorems and the negative-subspace bound state meaningful pinned linear-algebra versions; their numerical hypotheses remain in scope. |
| A2 closed/proper holomorphic embedding gives CW dimension≤n, including smooth affine varieties | Native manifold/immersion/CW/homotopy carriers suffice; missing headline proved statable by the scratch signature in R04. |
| A3 q-pseudoconvex exhaustion gives CW dimension≤n+q and homological consequences | Missing as a named headline. A manifold Levi/exhaustion predicate and its chart comparison need to be identified explicitly; the module docstring does not do so. |
| A4.0 locally finite homology, compact-pair comparison and all four noncompact Poincaré–Lefschetz isomorphisms | The specified BM/local-system construction is README work; no matching complete carrier was found at the pins. Name these missing carriers individually in the docstring. |
| A4.1 finite marked-family semialgebraic triangulation, its projection-compatible lift and complement duality | Semialgebraic sets and geometric simplicial complexes exist at the pins. The particular completed-list/lift and BM comparison interfaces are not defined in this file. The docstring must distinguish these cases rather than dismiss all triangulation statements together. |
| A5 homological and relative-homotopy weak Lefschetz, including singular X with smooth complement | The presented algebraic set has a simple set carrier, but its required projective topology, smooth-locus/dimension comparisons and relative interfaces are not supplied by this file. These precise obstacles must replace its blanket remark. |
| A6 Veronese closed embedding, equation/image comparison and transported hypersurface Lefschetz | Polynomial algebra is native; the specified projective atlas/line-bundle comparisons remain supplier constructions. This is also absent from the docstring's named-headline list. |
| A0 proper incidence family and full-rank holomorphic submersion | The three definitions in Lean do not assert these results. Full-rank/projective atlas/tangent-normal comparisons are not made statable by those definitions alone. |

### Adversarial table

The following 106 rows record actual values or maps on specified instances. “Retain” means no defect was exhibited by that test; it does not certify an unread source. ℤ denotes the integral coefficient group; degrees in duality are integers. Rows split the construction into its distinct assertions, including its degenerate and wrong-model controls.

| Statement | Instances tried | Computed values on both sides | Result / change |
| --- | --- | --- | --- |
| Hessian and Levi normalization, README:40–46 | f(z)=x²+y²; v=1 | Hess(v,v)=2, Hess(iv,iv)=2; sum/4=1=∂z∂bar-z f | Retain; add explicit Check. |
| Intrinsic Hessian only at critical points, :48–49 | f(z)=Re z; chart z=w+w² at 0 | Coordinate Hessian changes from 0 to diag(2,−2); Levi stays (2−2)/4=0 | Retain criticality distinction. |
| Reduced smooth locus versus Jacobian presentation, :59–65 | x=0 and x²=0 in ℂ | Both reduced loci={0}, dimension 0; derivatives at 0 are 1 and 0 | Retain sufficient-test wording. |
| A0 projective carrier | N=0; N=1, no equations | Projectivization of zero space=∅; projectivization of ℂ=one point | Retain separate empty branch. |
| Degree-zero equations | p=0 and p=1 on ℂP¹ | Zero locus=ℂP¹ and ∅; evaluation on every line vector=0 and 1 | Retain; constant nonzero excludes every line. |
| Representative equivalence | p=X₀−X₁, v=(1,1), w=3v | p(v)=0=p(w); both sides true | True API, R06 deletion from acceptance file. |
| Homogeneity negative control | p=X₀−1, v=(1,0), w=2v | p(v)=0, p(w)=1; pointwise test true, whole-line test false | Homogeneity excludes the wrong model. |
| Positive-power invariance | p=X₀, then p² in ℂP¹ | Both loci={[0:1]}; Jacobian rows at (0,1) are (1,0) and (0,0) | Retain reduced-set restriction. |
| Redundant equations and intersections | X₀=0 repeated; intersect X₁=0 | Repetition leaves {[0:1]}; imposing both gives ∅ | Retain API. |
| Coordinate functoriality | ℂ²→ℂ³, (x,y)↦(x,y,0) | [1:2]↦[1:2:0]; two successive identity changes still [1:2] | Injectivity prevents a nonzero vector mapping to 0. |
| Closedness and projective compactness | X₀=0 in ℂP¹; nonzero constant | Closed point is compact; empty locus is compact | Retain. |
| Coefficient space | N=2,d=2; N=0,d=0 or 1 | Monomials x²,xy,y² give dimension 3; zero-variable pieces have dimensions 1 and 0 | Retain finite-index hypothesis for parameter topology. |
| Evaluation/derivative continuity | p=aX₀²+bX₀X₁+cX₁² at (1,2) | eval=a+2b+4c; partial₀=2a+2b, polynomial in coefficients | Retain. |
| Incidence and proper projection | One degree-zero equation c on ℂP¹ | Fiber at c=0 is ℂP¹; at c≠0 is ∅; both compact | Retain, including empty fibers. |
| Euler identity/radial kernel | p=X₀²+X₁², v=(1,i) | J(v)=(2,2i); J(v)v=2+2i²=0=2p(v) | Retain native Euler input. |
| Representative rescaling of Jacobian | Same p, replace v by 2v | J(2v)=2J(v); rank remains 1 | Retain. |
| Full rank/dimension | p=X₀ on ℂP¹ at [0:1] | rank J=1≤2−1; local zero-locus dimension=2−1−1=0 | Retain; p=X₀² fails the rank premise. |
| Closed bad-parameter locus and submersion | Linear equation aX₀+bX₁ | Bad parameters={(0,0)}; nonzero parameters have one reduced point fiber and rank 1 | Retain. |
| Levi sum and product | f=g=norm(z)² at z=1 | L(f+g)=2=1+1; L(fg)=4=1+1+2 cross terms | Retain product cross terms. |
| Holomorphic pullback | f(w)=norm(w)², w=z² at z=1 | L(f∘w)=4=norm(2)²·1 | Retain. |
| Increasing-convex composition | h(t)=t², f=norm(z)², z=1 | h' L(f)+h''·norm(∂f)²=2+2=4=L(norm(z)⁴) | Retain with monotonicity on the relevant range. |
| C² positivity openness | fε=(1−ε)norm(z)² | ε=1/2 gives Levi 1/2>0; ε=1 gives 0 | Retain strictly positive margins. |
| Compact maximum principle | A maximum on a positive-dimensional compact complex submanifold | Real second derivatives along v and iv are ≤0; Levi sum/4≤0, contradicting >0 | Retain; dimension-zero tangent has no nonzero v. |
| Negative W and JW | Hessian diag(6,−2), W=imaginary axis | B(i,i)=−2; B(Ji,Ji)=6; W∩JW={0}; dimℝW=1=dimℂℂ | Retain; proves the bound can be sharp. |
| Zero-dimensional index | V=0, q=0 | finrankℝW=0, finrankℂV=0, Morse index=0 | 0≤0; no lost finite-dimensional binder. |
| Strict index headline | f=3x²−y² on ℂ | Levi=1; negative inertia=1; bound n=1 | Retain. |
| q-pseudoconvex convention and bound | n=2,q=1, Hessian diag(6,−2,−2,−2) | Levi diag(1,−1), one positive direction; index 3=n+q | Retain n−q convention. |
| q=n boundary | f=−norm(z)², n=q=1, P=0 | Positive-subspace requirement dimension≥0; index 2=n+q | Retain; the general theorem is not just its boundary case. |
| Pluriharmonic control | f=Re(z²) | Hessian diag(2,−2); Levi=0; index=1 | Not strictly psh; excludes confusing real and Hermitian positivity. |
| Eigenvalue pairing including zero | A(z)=bar z; A=0 | A(1)=1, A(i)=−i; ±1 eigenspaces each real dimension 1. For A=0, 0-eigenspace dimension 2 maps to itself | Retain mathematics; helper role is R06. |
| Complex second fundamental identities | i(z)=(z,z²), at 0 | B(1,1)=(0,2), B(i,1)=(0,2i), B(i,i)=(0,−2) | Both displayed complex-bilinear identities hold. |
| Shape-operator signs | Same graph, unit normal ν=(0,1) | Sν=diag(2,−2); S(Jν)=[[0,2],[2,0]]=J Sν; SνJ=−JSν | Retain plus sign for S(Jν). |
| Paired focal distances | Same Sν; flat complex plane | det(I−tSν)=1−4t², roots ±1/2; flat plane determinant 1, no focal time | Retain multiplicities and zero-eigenvalue branch. |
| Distance Hessian and Levi identity | Graph, center a=(0,t), critical point z=0 | Hessian diag(2−4t,2+4t); sum=4=4 norm(di(1))² | Retain; t=1 gives index 1. |
| Generic Morse exception | Same graph at z=0 | Degenerate exactly t=±1/2 on this normal line; elsewhere both Hessian eigenvalues nonzero | Mathematical control; generic supplier still missing, R02. |
| Closed-embedding properness | ℂ in ℂ; punctured ℂ² in ℂ² | Closed distance sublevel is compact ball; points (1/k,0) in punctured sublevel have no limit there | Retain essential closed/proper hypothesis. |
| Affine CW headline | ℂ, ℂ*, (ℂ*)² | Models point, circle, torus; cell counts respectively (1), (1,1), (1,2,1); largest degrees 0≤1,1≤1,2≤2 | Add native statement, R04. |
| Smooth affine comparison | xy=1 in ℂ² | Gradient (y,x) never zero on xy=1; projection to x identifies locus with ℂ* | Retain closedness plus smoothness. |
| Fine approximation/properness | f=norm(z)², g=f+0.1 sin x | abs(g−f)≤0.1<1, g≥−0.1; Levi(g)=1−0.025 sin x≥0.975 | Retain positive tolerance and global C⁰ bound. |
| Relative approximation | Perturbation supported away from a fixed neighborhood of 0 | On that neighborhood g=f, dg=df, Hess g=Hess f | Retain equality on a neighborhood, not just at one point. |
| Homology above CW dimension | ℂ*, d=1 | H₁=ℤ, H₂=0; H¹=ℤ, H²=0 | Retain integral vanishing and top homology freeness. |
| Top cohomology warning | A 2-dimensional CW model of ℝP² | H₂=0 is free; H²=ℤ/2 is not free; H³=0 | Retain distinction; a general CW control, not an asserted affine model. |
| Finite-band Betti bound | Regular compact annular sublevel built from the empty set with c₀=c₁=1 | Cellular rank c₁=1; b₁=1≤1; changing the exhaustion leaves H₁=ℤ | Retain. |
| Compact complex submanifold dimension | ℂP¹×ℂ, exhaustion norm(z)², n=2,q=1 | Levi eigenvalues (0,1); compact fiber ℂP¹ has dimension 1=q | Retain sharp bound. |
| LF chain carrier, sampled A4.0 | Countably infinite discrete 0-manifold | Locally finite C₀=∏ℕℤ; ordinary C₀=⊕ℕℤ; all-ones chain belongs only to first | Distinguishes the intended carrier. |
| Local coefficients and boundary | Two composable edges, transport T then S, initial coefficient c | Interior terms +T(c)−T(c)=0; endpoint coefficient S(T(c)); boundary of boundary=0 | Retain transport, not unmarked coefficients. |
| Proper-map condition | Translation of ℝ; constant ℝ→point | Translation preserves local finiteness; infinite sum of points would give infinitely many contributions at the target of the constant map | Properness excludes the bad pushforward. |
| Open restriction | Oriented ℝ→open interval (0,1) | BM H₁=ℤ on both; orientation generator maps 1↦1 | Retain homological zigzag; no naive simplex clipping. |
| Inverse-limit chain identification | Discrete ℕ exhausted by {0,…,r} | Relative C₀=ℤ^(r+1); transitions delete last coordinate; limit=∏ℕℤ=C₀^lf | Retain cofinal compact exhaustion. |
| Limit-excision justification | Constant tower ℤ with identity maps | lim=ℤ; lim¹=0 since x_r−x_(r+1)=a_r is solved recursively | Retain Milnor comparison; surjective chains alone are not a claim of surjective homology. |
| LF singular/simplicial comparison | Integer triangulation of ℝ | Sum of oriented edges is a BM 1-cycle; both homologies in degree 1 are ℤ, with generator 1 | Retain comparison target. |
| Compact-pair/BM comparison | ([0,1],{0,1}); (point,∅); (X,X) | H₁ pair=ℤ=BM H₁(0,1); H₀(point)=ℤ=BM H₀(point); empty complement gives 0=0 | Retain closed-subpolyhedron hypotheses. |
| Complement shell local finiteness | (0,1) subdivided at 2^(−r) near 0 | Each [ε,1−ε] meets finitely many shells; neighborhoods of missing 0 need not | Retain locally finite, not finite, complement triangulation. |
| Boundaryless duality/integer degree | U=ℝ,m=1,j=1 and j=2 | BM H₁=ℤ=H⁰; BM H₂=0=H^(−1), whereas H⁰≠0 | Retain integer subtraction. |
| Orientation twist | Interior of a Möbius band, m=2 | BM H₂ with ℤ coefficients=0; H⁰(orientation)=0; untwisted H⁰=ℤ would be wrong | Retain twist. |
| Fundamental-cycle cancellation | Adjacent ordered edges [0,1],[1,2] | Boundary sum=([1]−[0])+([2]−[1])=[2]−[0]; interior coefficient 0 | Retain shared order and transported orientations. |
| Dimension-zero duality | Discrete ℕ | BM H₀=∏ℕℤ=H⁰; ordinary H₀=⊕ℕℤ=H_c⁰ | Retain separate 0-dimensional branch. |
| Cap sign and signed differential | Oriented two-edge circle z=e_ab+e_ba; φ(a)=0,φ(b)=1 | ∂(z⌢φ)=[a]−[b]; z⌢δφ=[b]−[a]; −∂(z⌢φ)=z⌢δφ | Retain d⁰=−∂. |
| ε reindexing | k=0,1,2,3 and k=−1 | ε=(1,−1,−1,1); ratios ε_(k+1)/ε_k=(−1,+1,−1); ε_(−1)=1 gives ε₀=1 | Retain recurrence and integer indexing. |
| Adaptive cap support | One simplex meeting K_r, wholly in K_(r+1) | Its front-face evaluations use only K_(r+1); projected back-face coefficient is the same before/after restriction | Conditional equality; adaptive provider missing, R02. |
| Cofinal shift versus levelwise iso | Small disk K_r inside an annulus K_(r+1) in punctured plane | H¹(K_(r+1))=ℤ→H¹(K_r)=0 is not an isomorphism | Retain the explicitly stated cofinal-shift route. |
| Four boundary dualities | M=[0,∞), boundary {0}, m=1 | H⁰(M)=ℤ=BM H₁(M,∂M); H⁰(M,∂M)=0=BM H₁(M); H_c¹(M)=0=H₀(M,∂M); H_c¹(M,∂M)=ℤ=H₀(M) | Retain all four support placements. |
| Relative fundamental boundary | Compact interval [0,1] | ∂[0,1]=[1]−[0]; outward boundary signs are +1 at 1 and −1 at 0 | Retain boundary-sign compatibility. |
| H₀^BM vanishing condition | ℝ versus discrete ℕ | BM H₀(ℝ)=0; BM H₀(ℕ)=∏ℕℤ≠0 because every singleton component is compact | Retain “no compact connected component”, not merely noncompact. |
| Finite compatible triangulation, sampled A4.1 | [0,1], marked {1/2} and (0,1/2) | Three vertices/two edges; point is a subcomplex, open interval an open-simplex image | Retain distinction between closed and arbitrary marked subsets. |
| Semialgebraic dimension API | point, interval, union of two intervals, square | Dimensions 0,1,1,2; max(1,1)=1, product sum 1+1=2; closure of open interval still dimension 1 | Retain; define empty-dimension convention explicitly. |
| Smooth/complex dimension comparison | ℂ as ℝ²; reduced point defined by z² | Dimensions 2=2·1 and 0=2·0 | Retain reduced comparison, not equation count. |
| Generic shear leading coefficient | p(y,t)=y²−t² | p(y+at,t)=y²+2ayt+(a²−1)t²; coefficient=a²−1=H_p(a,1) | Retain, excluding a=±1. |
| Simultaneous good directions | Also include p₂=y; constant 2; zero polynomial | Product of nonconstant top parts=a(a²−1); good set ℝ minus {−1,0,1}; constant coefficient 2 never vanishes; zero has no top part | Retain separate zero/constant cases. |
| Frontier-compatible root cells | t²−y=0 over y≥0 | Roots ±√y for y>0; both tend to 0 at y=0; closures include the zero stratum | Retain preparation target; BCR locator uncertified. |
| Root extension hypothesis | p=xt−y on 0<y<x<1 approaching (0,0) | Root y/x has limits 1/4 and 3/4; specialized polynomial at (0,0) is identically zero | The stated nonzero-specialization hypothesis excludes this failure. |
| Quasi-monic positive control | p=t²−x, x∈[0,1] | Positive root √x extends with value 0 at x=0; specialized polynomial t² is nonzero | Retain. |
| Bounding sections and derivatives | M=1, p=t²−1 | Roots −1,1; derivative 2t contributes 0; next derivative 2 contributes no roots | Retain finite bounded lists and constant branch. |
| Coordinate permutation | Fin 2 point (y,t)=(2,3) | Swap 0 and last gives (3,2); swapping back gives (2,3) | Adapter agrees with supplier's coordinate-0 convention. |
| Ordered completion on an interval | Gap a=0,b=1; opposite list 0,1/2,1 | I={1/2,1}; both auxiliaries are 0 at top vertex, opposite values 1/2 and 1; original b stays 1 | Retain upper-endpoint auxiliary as distinct interior section. |
| Restriction and surjectivity | Same interval | Top restrictions {0,0,0,1}→{0,1}; opposite restrictions {0,1/2,1,1}→{0,1/2,1}; both onto | Retain noninjective, nondecreasing restriction. |
| E_l computed values | Same gap, λ₀=λ₁=1/2, α₁=1/3,α₂=2/3 | Denominator=5/4; E₁=(1/12+1/4)/(5/4)=4/15; E₂=(1/6+1/2)/(5/4)=8/15 | 0<4/15<8/15<1; add Check. |
| Facet/vertex limits | Same interval, approach opposite and top vertices | E-values tend to (1/2,1) and (0,0); prescribed values are exactly those pairs | Retain piecewise boundary definition; do not evaluate 0/0 at vertices. |
| Collapsed gaps | a=b on opposite face; or everywhere | I=∅ on collapsed opposite face; height a+(b−a)E=a where width=0 | Retain empty-index and collapsed-height branches. |
| Higher-simplex interior positivity | Triangle, λ_i=1/3, boundary normalized value 0, α=1/2 | Each w_i=1/9, w*=1/27; E=(1/54)/(10/27)=1/20>0 | Retain interior separation despite equal boundary heights. |
| Second subdivision distinguished vertex | Gap b−a=x(1−x) on [0,1] | Endpoint heights both 0; midpoint height 1/4; after subdivision each half has a positive endpoint | Retain second refinement; unsubdivided interpolant would vanish. |
| Collapsed-band transfer | Affine band 0≤y≤x, target band 0≤u≤x² | At (x,y)=(1/2,1/4), u=xy=1/8; at x=0 both bands collapse to 0 | Retain collapsed-endpoint control; supplier cycle R01. |
| Pulling triangulation | Unit square with least vertex (0,0) | Two triangles with diagonal (0,0)–(1,1); union area 1/2+1/2=1; intersection is that common edge | Retain no-new-vertex construction. |
| Simplicial projection identity | Triangle vertices (0,0),(1,0),(1,1), weights 1/4,1/4,1/2 | Realized point=(3/4,1/2); coordinate projection=3/4=realization of projected vertex map | Retain commuting square. |
| Projection dimension drop | Vertical square edge at x=0 | Edge dimension 1 maps to one base vertex, dimension 0; both projection maps constant 0 | Retain allowed dimension drop. |
| Projector/affine projective models | [1:z] with z=0 and z=1 | Rank-one Hermitian projectors diag(1,0) and (1/2)[[1,1],[1,1]]; each P²=P and tr P=1 | Retain compact semialgebraic comparison target. |
| Neighborhood retraction | X=[0,1], A={0} | On [0,ε), H_t(x)=(1−t)x; H₀(x)=x,H₁(x)=0,H_t(0)=0 | Retain cofinal neighborhoods; based-pair construction takes a point of A. |
| Complement duality | (ℂP¹,{∞}), U=ℂ, n=1 | H₂ pair=ℤ=H⁰(U); H₁ pair=0=H¹(U); H₀ pair=0=H²(U) | Retain singular-pair/BM route. |
| Orientation/naturality control | Complex-linear z↦2z versus conjugation | Real determinants 4 and −1; orientation-preserving map induces +1, conjugation reverses top class | Retain stated orientation restriction. |
| A5 smooth-complement hypothesis | Union of two projective lines meeting at p; H meets both only at p | Singular locus={p}⊂H; U=ℂ disjoint union ℂ; relative H₀=H₁=0 and H₂=ℤ² | Retain singular X scope; do not force X smooth. |
| Whole components in H | X⊂H | A=X, U=∅; every relative group=0 | Retain separate empty-complement case. |
| Hyperplane meets components | Positive-dimensional compact component purportedly inside affine chart | A squared-distance maximum has Levi≤0 on a nonzero tangent, while affine Levi>0 | Contradiction; retain n≥1. |
| Homological weak Lefschetz, n=1 | Smooth plane cubic, transverse line meeting in three points | H₀(A)=ℤ³→H₀(X)=ℤ sends (a,b,c)↦a+b+c, onto; kernel ℤ² | Correct surjectivity boundary, not an isomorphism claim. |
| Low-degree/relative homotopy, n=2 | (ℂP²,ℂP¹) | H₀ map identity on ℤ; π₁(A)=π₁(X)=0; relative π₁=0 | Retain. |
| Transverse hyperplane exception | Smooth conic and tangent/secant lines | Tangent has one double intersection; secant has two simple points; tangent lines form a proper complex curve in dual ℂP² | Retain exceptional null-set statement with chart measures. |
| Reversed exhaustion F | U=ℂ, ρ=norm(z)² | F(0)=1,F(∞)=0; Hess F at 0=−2I, index 2=2n−λ with λ=0 | Retain reciprocal-function sign. |
| Handle/neighborhood argument | (ℂP¹,{∞}) | Relative construction needs a 2-cell, no 1-cell; relative π₁=0 agrees with long exact sequence | Retain genuine homotopy route, not inference from homology alone. |
| A6 affine quadrics | z₀²+z₁²=1 over ℂ | Via u=z₀+iz₁,v=z₀−iz₁ get uv=1; H₁=ℤ and CW dimension 1 | Retain. |
| Veronese image equation | n=1,d=2, [x:y]↦[x²:xy:y²] | [1:2]↦[1:2:4], y₀y₂−y₁²=4−4=0; [1:0:1] gives 1≠0 | Retain image-defining relation, not the whole target projective space. |
| Veronese degree boundaries | d=1,d=0 on ℂP¹ | d=1 is identity; d=0 maps every point to one point and is not an embedding | Retain d>0 hypothesis. |
| O(1) pullback and hyperplane transport | Degree-2 Veronese of ℂP¹ | Pullback degree=2; hyperplane y₁=0 pulls back to xy=0, two points | Retain O(d), including the actual inclusion maps. |
| Inclusion/naturality squares | Identity pair map on (ℂP¹,{∞}) | Both composites on relative H₂ send 1↦1 | Retain inclusion-induced, not arbitrarily chosen, Lefschetz maps. |
| Supplier-cycle finding | AML A4.1 and RealAnalyticGeometry R2/R2.1 | Text has 2 opposite edges, cycle length 2; required one-direction graph has 1 edge | R01. |
| Missing supplier finding | Six named GT Euclidean exports | Required exports=6; matches in GT main/pinned declarations=0 | R02. |
| Gate findings | Original header/README; repaired scratch header | Five subimports→one root import; eleven SHA links remain; targeted build warnings=5, scratch Lean non-sorry warnings=0 | R03/R05. |
| Shape and source findings | Entire README and folder | Checks blocks=0, Needs lines=0, sources.toml entries=0; required per definition≥3 Checks | R07/R08. |

### Pinned library audit

Opened the following declarations at the pins, rather than relying on current online documentation:

- Mathlib/LinearAlgebra/Projectivization/Basic.lean:48, :60 and :164: Projectivization is a quotient of nonzero vectors, mk requires v≠0, and equivSubmodule identifies it with rank-one subspaces. These definitions do not install the projective topology, compactness or complex atlas.
- Mathlib/RingTheory/MvPolynomial/Homogeneous.lean:87 and :109: the native homogeneous submodule and its finite-generation theorem. The coefficient-space target should use these rather than rebuild a graded carrier.
- Mathlib/RingTheory/MvPolynomial/EulerIdentity.lean:73: IsHomogeneous.sum_X_mul_pderiv, with the finite-variable sum and n-smul convention. The radial-kernel computation above uses this precise identity.
- Mathlib/LinearAlgebra/Eigenspace/Basic.lean:466: Module.End.mem_eigenspace_iff gives A v=a•v, including eigenvalue zero; it does not itself assert an eigenspace-dimension pairing.
- Mathlib/Algebra/Homology/Embedding/Basic.lean:257: ComplexShape.embeddingUpIntLE sends j to m−j in ℤ, as A4.0 requires.
- Mathlib/Geometry/Manifold/IsManifold/Basic.lean:777: IsManifold extends HasGroupoid; it does not bundle Hausdorffness, second countability or nonemptiness. The tested headline supplies the first two explicitly and permits the empty manifold.
- Mathlib/Geometry/Manifold/Immersion.lean:801: Manifold.IsImmersion has an actual chart normal form and a chosen complementary model, not merely an injective underlying function.
- Mathlib/Topology/CWComplex/Classical/Basic.lean:135: Topology.CWComplex has dimension-indexed cell types, so vanishing of cells above n is statable without a private CW carrier.
- Mathlib/Topology/Homotopy/Equiv.lean:43: ContinuousMap.HomotopyEquiv contains actual continuous maps and both homotopies; the headline does not substitute a bare equivalence of types.
- TauCeti/Analysis/Calculus/Morse/Index.lean:76, :81, :148 and :180: hessianQuadraticForm, its evaluation, morseIndex and the real-finrank upper bound. The derivative is totalized; no differentiability premise is necessary for the purely algebraic index inequalities. The real-dimensional bound alone is weaker than the proposed complex bound.
- TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean:63–71: IsSemialgebraic is generated from polynomial zero/positive loci. Its generic carrier assumes a commutative ring and linear order, not an ordered-field compatibility axiom or triangulation theorem. The roadmap's geometric construction is over ℝ.

These are 17 named carrier/declaration checks across 11 source files. Object searches also covered Hessians/Levi positivity, BM/locally finite chains, semialgebraic sets, projective incidence, CW complexes and Veronese maps. No complete pinned BM/local-system duality or complex-Levi-index implementation was located. The existing real Hessian quadratic form is consumed by the Lean index statements; realHessian is only the simple continuous-bilinear derivative expression needed by them.

### Resolved roadmap contracts and ownership

Main was checked at 929496d. Existing-roadmap revisions were not substituted for main as suppliers. The citation resolver reported no missing roadmap names, but also said its library-name lookup lacked pinned Lake packages; the library audit above was therefore performed separately.

| Supplier or consumer | Text opened and resolution |
| --- | --- |
| ComplexKahlerGeometry | TauCetiRoadmap/ComplexKahlerGeometry/README.md:96–120, :296–319, :1407–1442: complex orientation/scalar restriction, germs and the native projective atlas. The maps and Fin indexing agree with A0. |
| MorseTheory | TauCetiRoadmap/MorseTheory/README.md:90–122, :398–479: critical Hessian, proper CW construction, fine approximation, arbitrary-rank top homology and UCT. The no-half-factor and bounded-below conventions agree. |
| GeometricTopology | TauCetiRoadmap/GeometricTopology/README.md:177–287, :831–904, :930–943: collars/tubes, simplicial realization and smooth-to-PL comparison exist as targets. The claimed extra distance/adaptive contracts do not: R02. |
| RiemannianGeometry | TauCetiRoadmap/RiemannianGeometry/README.md:1044–1062 and :1221–1290: B/S definitions, focal multiplicity and Hessian 2(g−〈B,q−f(p)〉). Its signs agree with the graph calculation. Its reference back to missing GT exports does not fill that gap. |
| AlgebraicTopology | TauCetiRoadmap/AlgebraicTopology/README.md:326, :471, :499, :954–994, :1511–1556, :1602: relative chains, excision/CW, integer Milnor sequences, local-system compact-boundary/triad duality and relative homotopy. The compact triad is explicitly owned there. |
| CharacteristicClasses | TauCetiRoadmap/CharacteristicClasses/README.md:333–365: S0–S5 use the same first-vertex local-coefficient cochains and controlled-collar support excision. A4.0 must supply the stated collar control, which it plans through its exhaustion construction. |
| DifferentialGeometry | TauCetiRoadmap/DifferentialGeometry/README.md:884–885: chartwise null sets, critical-image nullity and density of regular values. |
| RealAlgebraicGeometry | Completed/RealAlgebraicGeometry/README.md:88–94, :298–477: polynomial semialgebraic carriers, ordered roots, CAD and projection; distinguished coordinate is 0, matching A4.1's swap adapter. It does not supply the compact triangulation target. |
| RealAnalyticGeometry | TauCetiRoadmap/RealAnalyticGeometry/README.md:26–37 and :177–194: independent elementary band helpers really are stated, but its import of A4.1 creates R01. The analytic-simplex enhancement is distinct from A4.1's topological semialgebraic construction. |
| FourManifolds, downstream | Supplied open checkout, TauCetiRoadmap/FourManifolds/README.md:180, :2989–3039: consumes A0/A4/A5/A6 and develops the Vandermonde/Fermat examples. It is not an input to this roadmap. |
| AlgebraicTopologyPartII, downstream | Supplied open checkout, TauCetiRoadmap/AlgebraicTopologyPartII/README.md:18 and :92: imports A4.1's dimension/triangulation and A2–A3's affine bound. This confirms ownership rather than duplicating it. |

All nine directly named supplier roadmaps were inspected. The two downstream references above were also resolved. The required roadmaps grep/show tools were used for ownership, together with object searches of the supplied sibling checkouts and board packages. Open revisions of ComplexKahlerGeometry were inspected for overlap, not used to strengthen the allowed main contract. Scheme-level Veronese/Proj and Gröbner targets concern different carriers; A6's classical complex-point/chart comparison remains a distinct extension. No competing construction in the supplied open work was identified that displaces this existing roadmap's ownership. No ownership conclusion is made about unprovided open-PR files beyond search-index leads.

For shape comparison I inspected the Summary, ownership, conventions, layered targets, Needs and Checks in the main AbhyankarLemma and PurityOfBranchLocus roadmaps; their mathematical claims were not part of this review.

### Source sample and additional source checks

No locator in this README is expressly labeled unverified. Both seeded targets were examined.

- **A4.0:** Hatcher's author-hosted text was fetched through the sources service. Hatcher §3.3, printed pp.239–240, hatcher line 10391 and line 10400, supports the front/back-face cap definition and sign. Theorem 3.43, printed p.254, hatcher line 10976, assumes a compact orientable manifold with a boundary triad. The twist/noncompact extension in A4.0 is an additional construction through AlgebraicTopology/CharacteristicClasses; this source is not certification of the entire target.
- **A4.1:** BCR Proposition 9.1.2, Theorem 9.1.4 and §9.2 were submitted to the sources service. It classified the book as uncertified because the citation resolves to a paywalled Springer work. The theorem numbers, printed pages, hypotheses and support for the specific frontier/lifting claims could not be checked against its text. The algebraic shear, nonzero-specialization counterexample, completed interval stack, E_l, pulling and projection calculations were checked independently above.
- **Milnor:** The legal institutional copy was fetched through the service after following the Edinburgh redirect. Section 7, Theorems 7.1–7.2, printed p.39, milnor line 6628 and line 6651, gives affine homology vanishing and the closed analytic embedding CW theorem. Corollary 7.3 and Theorem 7.4, printed p.41, milnor line 7098 and line 7199, have the singular-points-in-the-hyperplane hypothesis and the homology/relative-homotopy ranges used here. The proof at printed p.42, milnor line 7223, explicitly uses a neighborhood deformation into the section, consistent with A4's neighborhood-retraction target. The extraction misreads some symbols and the 7.2 label; these are not recorded as source errors.
- Hain and Mark were sought as below. No source passage was copied into the report or repository.

## Not verifiable

- **bcr:** Bochnak–Coste–Roy, Real Algebraic Geometry (1998), Proposition 9.1.2, Theorem 9.1.4 and §9.2. The sources service resolved only a paywalled publisher citation. Publisher/author bibliographic search did not yield a legal full text. Status: uncertified, not a request to bypass access controls. No claim is made that these numbered results prove every detail of the lift.
- **hain:** Notes on the Morse theory of complex manifolds, revised 2004. The cited Duke author-page URL and its www.math.duke.edu variant return HTTP 403 through the sources service. A [search-index excerpt of the author-hosted notes](https://sites.math.duke.edu/~hain/teaching/archive/spring_12/mini_s12/levi.pdf) exposes Definition 1's convention, but is insufficient to certify the full index/exhaustion arguments. Recorded in needs-references.toml.
- **mark:** Thomas Mark's Math240 lecture dated December 7, 2001. Bibliographic service lookup and searches by author/course/date found no identifiable legal full text. The README gives no URL or page numbers. Recorded in needs-references.toml.
- **Full A4.0 generality:** No exact source locator is provided for the complete locally finite, arbitrary-module-local-system, boundary and support package. The table checks its formulas on orientable, nonorientable, noncompact and boundary examples, but those calculations do not establish the general theorem.
- This review does not certify absence of copied passages from inaccessible texts, or the full general proof of A4.1's recursive stack compatibility from its finite examples.

The missing-source file retains the two unresolved readable-text requests; Milnor was removed from it after the successful fetch. BCR's uncertified status is reported here without reopening it as a missing-text request.

## Source issues

- none
