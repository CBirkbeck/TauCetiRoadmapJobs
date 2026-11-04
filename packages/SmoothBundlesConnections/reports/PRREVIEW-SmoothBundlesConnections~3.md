# Review of SmoothBundlesConnections (pull request #887 at fb494e6)

**Verdict:** needs changes

## R01 (P1) — The ComplexKahlerGeometry supply cycle remains

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/README.md:178`, “K5a: … the linear elliptic and Sobolev theory and the compact real Hodge theorem”; also B8 at lines 1815, 1898 and 1932, and the K7.1 imports at lines 505 and 1617.

**Claim.** ComplexKahlerGeometry can supply this folder while consuming its bundle foundations.

**Witness.** On main, `TauCetiRoadmap/ComplexKahlerGeometry/README.md:571` consumes SmoothBundlesConnections B2–B4; line 580 explicitly consumes B2's L² construction. Here B8 consumes K5a. These are opposite arrows between the same folders.

**Repair.** Move K5a-dependent Yang–Mills work and K7.1-dependent projective-chart/Hopf comparisons into a later Part II. Retain the general bundle foundations and independent good-cover theory here, and import them in the later part. Coordinate the existing consumers' references without rebuilding their theory. The repaired graph for these objects is foundations → ComplexKahlerGeometry → Part II, with foundations → Part II. Previous R02 is not repaired.

## R02 (P1) — DGFloer is another supplier that already consumes this folder

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/README.md:176`, “Layer 1.1: the degree-one Hurewicz isomorphism”; also lines 1559–1561 and 1660.

**Claim.** DGFloer's degree-one Hurewicz theorem is an earlier supplier for the B6 comparisons.

**Witness.** On main, `TauCetiRoadmap/DGFloer/README.md:158` explicitly consumes SmoothBundlesConnections B1.4's free proper quotients. Line 453 supplies the Hurewicz theorem consumed here. Thus SBC → DGFloer → SBC is a second two-cycle.

**Repair.** Separate the DGFloer-dependent Hurewicz/groupoid comparison targets of B6.1 and B6.4 into a later Part II, and make their earlier consumers use only the independent bundle and sheaf/Čech constructions. DGFloer's earlier inputs, B1.4 and B6.2–B6.3, must not depend on that Part II. Preserve the full Hurewicz comparison there, importing the existing theorem by name; do not replace it by a private special-case Hurewicz proof. Check the resulting graph explicitly: foundations → DGFloer → comparisons, foundations → comparisons, with no reverse arrow. The current checker also misses this cycle.

## R03 (P1) — B8 reverses the chosen gauge action on curvature

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/README.md:1843`, “`F_(u·A) = Ad(u⁻¹)F_A`”; compare B4.2 at lines 977–983, which fixes the inverse-pullback left action and generator −d_Aξ.

**Claim.** Curvature under that left action transforms by Ad(u⁻¹).

**Witness.** On the trivial SO(3)-bundle over the angular torus, take A=sin(x)X dy, with X rotation about the x-axis, and constant gauge g rotating π/2 about z. At x=0, inverse pullback gives +Y; the displayed formula gives −Y.

**Repair.** For the chosen left action write A↦Ad(u)A−du·u⁻¹ and F↦Ad(u)F. Reserve Ad(u⁻¹)F for the pullback right action, labelled explicitly. Add the stated nonabelian Check: Ad(g)X=Y, Ad(g⁻¹)X=−Y. Both have the same squared norm, so the energy remains invariant, but norm invariance alone cannot test the curvature convention. The infinitesimal generator remains −d_Aξ.

## R04 (P2) — State the free proper quotient headline existentially

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/Suggested.lean:32`, “the pins have no smooth manifold structure on the orbit space of a free proper smooth action”; compare the B1.4 headline at README lines 409–426.

**Claim.** That missing constructed atlas prevents stating the quotient theorem.

**Witness.** A scratch theorem with native `MulAction.orbitRel.Quotient`, `ProperSMul`, `ContMDiff`, an explicit freeness hypothesis, and an existential `ChartedSpace` making the quotient projection a `Manifold.IsSubmersion` elaborates at these pins with only its sorry warning.

**Repair.** Add the existential quotient-atlas/submersion theorem in this roadmap's namespace, just as the repaired regular-fibre theorem existentially binds its atlas. Retain arbitrary finite-dimensional boundaryless real models and the stated Hausdorff/second-countable hypotheses; use the quotient topology and dimension dim M−dim G. Principal local-trivialization consequences may still be named as not yet statable if their carrier is missing. No sorry'd atlas or custom quotient carrier is needed. Test G=1 (quotient M, projection id), ℤ acting on ℝ (quotient circle, dimension 1), and the empty source. An irrational free ℝ-action on T² fails ProperSMul and stays excluded. The signature used for this check is reproduced below.

## R05 (P3) — Delete the auxiliary calculus acceptance file

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/TransportDerivativeTargets.lean:1` and line 22, `hasDerivAt_inverse_transport_section`.

**Claim.** This free-function differentiation calculation belongs in the roadmap's Lean acceptance files.

**Witness.** The statement mentions functions, linear equivalences and a linear operator, but no connection, bundle or transport functor. It mirrors the README B5.1 Check at lines 1135–1137. Its three Mathlib submodule imports also violate the rules for this listed file.

**Repair.** Delete `TransportDerivativeTargets.lean`; keep the calculation in the README. Do not prove it in place. For P(t)=exp(−2t), σ(t)=3+5t, the derivative is 11=5+2·3, so deletion loses no mathematical target. Previous R07 remains unrepaired. The supplied passing gate covers Suggested.lean's imports and does not excuse this second file.

## R06 (P3) — Finish the source records and pin the remaining locators and homotopy sign

**Location.** `TauCetiRoadmap/SmoothBundlesConnections/README.md:1433`, “the finite alternating insertion formula of the Stacks Project”; line 1904 cites Donaldson §2.1 for conformal invariance. No `TauCetiRoadmap/SmoothBundlesConnections/sources.toml` exists.

**Claim.** All retained targets have exact, reproducible source support and convention Checks.

**Witness.** Donaldson discusses conformal invariance in §2.2, printed p.3, at donaldson line 207. Stacks' displayed insertion gives hδ(2,5)=3, but its printed γ−γ′ equation gives −3. B3.2 and B5.2's countability paragraph have no attached literature locator.

**Repair.** Add the eleven reference records, retaining readable-version locators and marking inaccessible texts uncertified as appropriate. Correct the Donaldson locator; attach locators to the uncited Atiyah-sequence and countability targets. State the refinement convention T_s−T_r=δh+hδ for the displayed insertion and add the repeated-cover Check hδ(2,5)=5−2=3; equivalently negate h for the opposite direction. Record the source slip rather than importing its false equation. This repairs the concrete sign/locator witnesses; it does not change the true refinement-independence theorem. Previous R08 is substantially but not completely repaired.

## Verified sound

Reviewed all 2,008 README lines, the 192-line Suggested.lean and the auxiliary file at the specified head. Findings: 3 P1, 1 P2 and 2 P3. No worktree, library or source manifest was edited.

**Previous findings checked first.** No repair report marking a finding “not actionable in this package” was supplied or found among this package's reports; no such disposition is overridden.

| Previous finding | Passage in this head | Disposition |
|---|---|---|
| R01, two exponential sequences | README 1459: “Distinguish the two stalk-exact sequences”; 1467: “δ_sm ∘ H^q(j) = δ_const” | Repaired. The S¹ winding and constant-function tests are now distinct; S²'s map 0→ℤ is expressly not an isomorphism. |
| R02, ComplexKahlerGeometry cycle | README 1815: “ComplexKahlerGeometry K5a's pointwise real Hodge-star/form-metric layer” | Not repaired: R01 above. |
| R03, invariant-metric supplier | README 402: “construct its average”; 453: “DifferentialGeometry 12.1 (an auxiliary metric)” | Repaired. Averaging, positivity, smoothness and equivariant exponential charts are now owned targets. diag(1,4) averages to diag(5/2,5/2). |
| R04, missing products | README 1417: “CategoryTheory.Limits.HasProducts.{w} A” | Repaired. The index universes, products, coefficient-functor preservation and homology instances are explicit. |
| R05, missing regular-fibre signature | Suggested.lean 67: “theorem exists_regularFiber_smoothEmbedding” | Repaired. The existential atlas, embedding and tangent kernel are present at the required generality. |
| R06, torus periods | README 147: “x,y ∈ ℝ/(2πℤ)”; 1635: “2πc ∈ ℤ” | Repaired. Gauge coefficient shifts are integers; periods are 2π times coefficients; c=1/(2π) has Chern number 1. |
| R07, auxiliary target file | TransportDerivativeTargets.lean 22: “theorem hasDerivAt_inverse_transport_section” | Not repaired: R05 above. |
| R08, missing source locators | README 1318: “Nicolaescu, Example 7.5.31 and Proposition 7.5.32”; 1434: “Tag 09UY, p. 24” | Partly repaired. All five sampled paragraphs now have readable matching locators; missing manifest and remaining locator/convention defects are R06. |
| R09, erroneous Checks | README 1451: “P(∅)=ℤ and P(U)=0 for every nonempty U”; 630: “the coordinate map sends e₂ ↦ (0,1/2)” | Repaired. Presheaf ranks, frame synthesis/coordinates, indicator norm including infinite mass, and one-period Möbius norms now agree. |
| R10, timelessness and shape | README 1: “Roadmap: smooth principal bundles, connections, and holonomy”; Layer headings and B7 Examples/Dependencies | Substantially repaired. Explicit upstream PR numbers and replacement narrative are gone; B1.2 has its API. Source defects remain separately recorded. |

**Build, signatures and gate.** The worker's supplied gate reports every scanner and the targeted build passing, ending `build=0 OK`. The requested outside-folder diff is empty. Independently, `lake env lean` on the original Suggested.lean succeeds with exactly five sorry warnings. An independent scratch copy with `#check @` for all nine actual top-level declarations succeeds; the service's tenth “on” declaration is a parser false positive in the docstring. No substantive binder was lost: finite-dimensionality/boundarylessness remain in the regular-fibre theorem, T2 and second countability remain where required for good covers and acyclicity, and compactness replaces second countability only in the finite-cover theorem. SmoothGoodCover itself imposes its contraction laws and requires neither a global metric nor an IsManifold instance. Its constant sheaf depends only on the topological base.

The auxiliary signature also elaborates with finite dimensionality retained. Each of the five admitted Suggested.lean theorems failed `simp`, `rfl` and `infer_instance`; no matching one-lemma proof was found. Smooth-sheaf acyclicity is not the pinned flasque theorem: local smooth functions need not extend globally.

The dependency command returned exactly:

```text
depcheck: 208 roadmaps, 1452 edges, 0 problem(s)
```

There are no reported UPWARD/CYCLE lines; R01–R02 document the manual counterexamples to that output. SmoothBundlesConnections is listed at merge-order line 7. Missing placement is not being reported as a defect.

**Headline coverage.** The README's end results are regular fibres/submersions; free proper quotients and homogeneous spaces; Ehresmann; finite-rank L² completeness and functoriality; principal and associated connections/Atiyah sequence; transport reconstruction; flat-bundle representations; Ambrose–Singer and holonomy reductions; good-cover existence and native Čech coordinates; smooth-sheaf acyclicity; Čech–de Rham–singular comparisons; normalized circle classification and Chern–Weil; flat/fixed-curvature and lattice-torus classification; and Yang–Mills variation with the gauge-fixed elliptic operator. Five statements appear in Suggested.lean: regular-fibre existence, two good-cover existence theorems, the constant-section bijectivity iff, and smooth-real-sheaf acyclicity. The docstring names the remaining families and their missing bundle/form/transport/de Rham/L² carriers. R04 is the verified counterexample to its nonstatability claim for free proper quotients.

This native-carrier quotient signature was elaborated successfully, with one sorry warning:

```lean
import Mathlib
open scoped ContDiff Manifold
namespace ReviewProbe
/-- Existential free proper quotient atlas on the native orbit space. -/
theorem quotient_exists
    {E EG H HG M G : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [NormedAddCommGroup EG] [NormedSpace ℝ EG] [FiniteDimensional ℝ EG]
    [TopologicalSpace H] [TopologicalSpace HG]
    (I : ModelWithCorners ℝ E H) (IG : ModelWithCorners ℝ EG HG)
    [I.Boundaryless] [IG.Boundaryless]
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    [T2Space M] [SecondCountableTopology M]
    [TopologicalSpace G] [ChartedSpace HG G] [Group G] [LieGroup IG ∞ G]
    [T2Space G] [SecondCountableTopology G] [MulAction G M] [ProperSMul G M]
    (hsm : ContMDiff (IG.prod I) I ∞ (fun gx : G × M => gx.1 • gx.2))
    (hfree : ∀ (g : G) (x : M), g • x = x → g = 1) :
    ∃ cs : ChartedSpace (Fin (Module.finrank ℝ E - Module.finrank ℝ EG) → ℝ)
      (MulAction.orbitRel.Quotient G M),
      letI := cs
      IsManifold 𝓘(ℝ, Fin (Module.finrank ℝ E - Module.finrank ℝ EG) → ℝ) ∞
        (MulAction.orbitRel.Quotient G M) ∧
      Manifold.IsSubmersion I
        𝓘(ℝ, Fin (Module.finrank ℝ E - Module.finrank ℝ EG) → ℝ) ∞
        (Quotient.mk'' : M → MulAction.orbitRel.Quotient G M) := by
  sorry
end ReviewProbe
```

**Adversarial computations.** These 87 selected rows retain the five seeded targets, every headline family, and the witnesses relevant to the findings. Detailed per-target rows are omitted from this comment. These are falsification tests, not proofs. The two Čech rank computations and SO(3) conjugations also used exact rational arithmetic.

| Statement / location | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Circle scale and dual character | t generator, ρ(e^{it})=e^{-it} | ρ_*(t)=−it; unitary F=−iF_real; (i/2π)(−iF)=F/(2π) | Consistent | None |
| Čech/de Rham sign | δA=dφ, F=dA | D(A+φ)=F+δφ; [F]=[−δφ] | Consistent | None |
| Holonomy multiplication and basepoint | q traversed then p; fibre point ug | hol(p*q)=hol(p)hol(q); hol_ug=g⁻¹hol_u g | Consistent with native multiplication | None |
| Regular-fibre definition, B1.0 | f(x,y)=x, c=3 | fibre={(3,y)}≅ℝ; df=(1,0); ker=span(0,1); dimension=2−1=1 | Sound target, now stated | None |
| Empty regular fibre and natural subtraction | point→ℝ², c outside image | fibre=∅; regularity vacuous; 0−2=0; empty 0-manifold valid | No hidden nonemptiness needed | None |
| Regularity negative control | f(x,y)=x²−y², level 0 | df_(0,0)=0; kernel dimension 2; crossing fibre not locally ℝ | Hypothesis excludes it | None |
| Free proper quotient, B1.4 | ℤ↷ℝ by translation | stabilizer=0; quotient=ℝ/ℤ; fibre discrete ℤ; tangent dimension 1−0=1 | Sound; existential signature missing | R04 |
| Properness negative control | irrational ℝ-flow on T² | stabilizer=0; orbit dense; orbit space not Hausdorff | Properness needed | None |
| Invariant metric supplier | ℤ/2 swaps coordinates, h=diag(1,4) | swap*h=diag(4,1)≠h; average=diag(5/2,5/2)=swap*average | Averaging now owned here | None |
| Homogeneous quotient | SO(3)/SO(2) | dimensions 3−1=2; stabilizer of north pole=SO(2); quotient=S² | Consistent | None |
| Ehresmann horizontal complement, B1.5 | product M×F | H=TM×0; H⊕ker dπ=TM×TF; horizontal transport on F=id | Consistent | None |
| General Ehresmann incompleteness | y′=y², y(0)=1 | y(x)=1/(1−x); finite on x<1, blows up at 1 | Correct distinction from principal case | None |
| Ehresmann properness | ℝ²\{0}→ℝ | fibre(0)=ℝ\{0}, two components; fibre(1)=ℝ, one | Properness cannot be dropped | None |
| Zero measure and a.e. quotient | μ=0 | every norm integral=0; all sections represent the same class; L²=0 | Consistent for quotient | None |
| Completeness/trivial-bundle isometry | one point, unit mass, finite-dimensional F | L²=F; norm=‖v‖; F complete | Consistent | None |
| Completeness negative control | c₀₀ at one point, v_N=(1,1/2,…,1/N,0,…) | squared tail=Σ_{j>N}1/j²→0; limit has infinite support, outside c₀₀ | Finite-rank/complete model essential | None |
| Local unitary coordinates | frame (e₁,2e₂), section e₂ | coordinate=(0,1/2), norm 1/2; section norm 1; synthesis of (0,1) has norm 2 | Corrected coordinate/synthesis distinction | None |
| Indicator norm Check | rank 0; positive rank and locally finite μ with μ(U)>0; infinite mass at one point | rank 0 gives norm 0; positive-rank indicator projection has norm 1 using a finite-positive-mass local section; infinite atom gives L²=0 and norm 0 | Stated hypotheses and negative control now distinguish all three | None |
| Base diffeomorphism functoriality | rotation φ of circle | U_φs=s∘φ⁻¹; U_φ⁻¹U_φs=s; arc-length integrals equal | Consistent | None |
| Principal connection, B3.1 | Maurer–Cartan θ, zero form | θ(A#)=A; zero form gives 0≠A for A≠0 | Reproduction excludes zero | None |
| Atiyah injection, B3.2 | M=point, P=G | V_ξ=ξ^R; [V_ξ,V_η]=−V_[ξ,η]; j=−V gives [jξ,jη]=j[ξ,η] | Consistent | None |
| Horizontal bracket defect | local circle A=x dy | horizontal X=∂x, Y=∂y−x∂θ; [X,Y]=−∂θ; F(X,Y)=1; j(F)=−∂θ | Consistent | None |
| Induced connection, B3.3 | circle dual representation | ∇σ=dσ−iAσ; ∇²σ=−iFσ | Consistent | None |
| Curvature variation, B4.1 | constant su(2) A=X dx+Y dy, [X,Y]=Z | F=Z dx∧dy; F_{(1+t)A}=(1+t)²F; F+t d_AA+t²[A∧A]/2=(1+2t+t²)F | Consistent | None |
| Covariant square/Bianchi | abelian A=x dy; σ=1 | ∇²σ=Fσ; dF=d(dx∧dy)=0 | Consistent | None |
| Gauge composition, B4.2 | equivariant u,v | p v(p)u(pv(p))=p u(p)v(p); both equal Φ_uv(p) | Consistent for noncommuting u,v | None |
| Gauge infinitesimal action | u=e^{tξ} | derivative of Ad(u⁻¹)A+u⁻¹du is dξ+[A,ξ]; inverse pullback negates it | Consistent | None |
| Torus coefficient/period lattice | angular coordinates, a=1 | hol=e^{−2πi}=1; coefficient shift=1, period shift=2π | Angular convention now consistent | None |
| Principal horizontal ODE, B5.0 | circle A=a dθ | g′=−ia g; g=e^{−iaθ}; loop value=e^{−2πia} | Consistent | None |
| Reconstruction definition | P(t)=exp(−tA) | −P′(0)=A; opposite sign gives −A | Consistent | None |
| Reconstruction frame law | P′=g(y)⁻¹Pg(x), P(0)=1 | derivative gives A′=g⁻¹Ag+g⁻¹dg | Consistent | None |
| Inverse-transport derivative | scalar A=2, σ₀=3,w=5 | derivative e^{2t}(3+5t) at 0=11; w+Aσ₀=11; wrong sign=−1 | Correct Check; auxiliary padding | R05 |
| Transport/connection inverse | constant A on line | reconstructed A unchanged; reconstructed ODE solution exp(−tA) equals original | Consistent | None |
| Metric compatibility iff isometric transport | scalar real A=1; imaginary A=i | e^{−t} changes norms; ∣e^{−it}∣=1 | Correct distinction | None |
| Flatness/local parallel frames, B5.2 | A=a dθ locally; A=x dy on disk | local gauge e^{−iaθ} makes potential 0; second curvature dx∧dy≠0 obstructs it | Consistent | None |
| Flat dictionary and quotient action | Γ=ℤ, ρ(1)=g | (a,h)·1=(a·1,g⁻¹h); [a₀·1,1]=[a₀,g]; hol=g | Correct inverse in quotient relation | None |
| Countability | torus, lens space, Hawaiian earring | π₁=ℤ², ℤ/n: countable; earring uncountable and fails local simple connectivity | Correct hypothesis control | None |
| Ambrose–Singer | flat connection; Hopf circle | curvature span=0 gives Lie H⁰=0; Hopf nonzero curvature spans ℝ, H⁰=Circle | Consistent | None |
| Full versus restricted topology | irrational cyclic subgroup of T² | H≅ℤ discrete intrinsically, H⁰=1; subspace closure=T² | Correct nonclosed model | None |
| Holonomy reductions | flat image μ_n; H connected | Q→M has n-point fibres and M′=Q when H⁰=1; M′=M when H=H⁰ | Consistent | None |
| SmoothGoodCover definition | Euclidean ball, ρ(t)x | H(0,x)=0, H(1,x)=x, H(t,0)=0; 0≤ρ≤1 keeps image in ball | Determines actual contraction | None |
| Good-cover failure controls | annulus; disconnected two-arc intersection | π₁ annulus=ℤ≠0; intersection has two components, no single contraction centre reaches both | Both excluded | None |
| Good-cover refinement existence | empty M; discrete zero-manifold | empty index set covers ∅; singleton cover of discrete M has constant contractions | Consistent with Lean | None |
| Finite good-cover refinement | compact discrete M with k points | k singleton members suffice; k=0 gives empty cover; compact manifold admits finite chart cover and hence countable base | Consistent with Lean | None |
| Sheaves and exactness, seeded | connected open; empty open | ker exp(2πi·)=ℤ on connected open; Γ(∅)=0; f=z on S¹ has winding 1, no real lift | Stalk exactness correct | None |
| Smooth-sheaf acyclicity headline | point; S¹; n=1 | point positive H=0; smooth real H¹(S¹)=0; constant real H¹(S¹)=ℝ | Correct sheaf distinction | None |
| cechIntersection definition | tuple (a,a); (a,b) disjoint | first intersection=U_a; second=∅ | Consistent | None |
| locallyConstantRealSheaf definition | connected interval; empty set | sections ℝ and 0 respectively; constant presheaf instead gives ℝ on ∅ | Correct sheafification | None |
| Constant section and coordinate iff, seeded | connected W; empty W; two-component W | ℝ→ℝ identity/bijective; ℝ→0 not injective; diagonal ℝ→ℝ² not surjective | Good-cover iff true in both directions | None |
| Native Čech differential | c(a)=2,c(b)=5 | δc(a,b)=3; δc(a,a)=0; δ²c(a,b,c)=0 by cancellation | Consistent | None |
| Augmentation component, seeded | U=(M,M), global section 7 | augmentation=(7,7); either projection=7=restriction | Exact pinned theorem | Cite it, no new target needed |
| Augmentation conditionality, seeded | constant real sheaf on S¹ good cover | H⁰ map ℝ→ℝ identity; source H¹=0, target H¹=ℝ | Full augmentation not quasi-iso | Correct caveat |
| Raw refinement maps, seeded | U=(X,X), V=(X), r=0,s=1 | on (2,5), r*=2,s*=5; on cocycle (7,7), both 7 | Maps differ, cohomology maps agree | None |
| Refinement homotopy | same repeated cover | K(c₀₁)=c₀₁; Kδ(2,5)=3=s*(2,5)−r*(2,5) | Source reverses this sign; README lacks sign Check | R06 |
| Refinement coefficient products | point, ℕ repetitions, finite-dimensional ℚ category | C⁰ requires ℚ^ℕ, infinite-dimensional; in ModuleCat it exists | HasProducts at the index universe now stated | None |
| Constant-presheaf negative control | constant ℤ presheaf on two points | C⁰,C¹,C² ranks 2,4,8; d⁰,d¹ ranks 1,3; H¹ rank 4−3−1=0 | Correct contrasting example now explicit | None |
| Repaired empty-factor Check | P(nonempty)=0,P(∅)=ℤ | ranks C⁰,C¹,C²=0,2,6; d ranks 0,1; H¹=ℤ | Correct; d¹ kills exactly (a,−a) | None |
| Coefficient connecting morphism, seeded | constant c∈ℝ/ℤ on S¹ | choose constant real lift; d(lift)=0; singular β⁰(c)=0 | Correct constant sequence | None |
| Smooth connecting-map winding Check | f(e^{iθ})=e^{iθ} | local lifts θ/(2π) differ by 1; sheaf connecting class=1; f is not singular 0-cocycle | Correctly separated from singular Bockstein | None |
| Circle coefficient comparison | M=S² | H¹(const ℝ/ℤ)=0; H¹(smooth circle)=H²(ℤ)=ℤ | Non-isomorphism now expressly stated | None |
| Total differential | ω₀=x dy,ω₁=0 on overlap ℝ² | δdω=−dx∧dy=dδω; D²=0, unsigned version=−2dx∧dy | Sign discriminated | None |
| Čech/de Rham comparison | oriented S¹ | ∫dθ/(2π)=1; integer Čech generator evaluates 1 | Consistent normalized edge maps | None |
| Fundamental-class pairing | S¹, dθ; CP¹ Hopf F | both sides 2π; normalized Hopf class evaluates 1 | Consistent, source contract owned here | None |
| Circle classification, B6.2 | point; S², Hopf/dual/tensor | H²(point)=0; S² classes 1,−1,2,0 for Hopf, dual, square, tensor with dual | Consistent | None |
| Chern–Weil periods, B6.3 | unit S², F=c dvol | ∫F/(2π)=2c; c=1/2 gives 1; c=1/3 gives 2/3 | Correct integrality criterion | None |
| Torus constant curvature | angular x,y, c=1/(2π) | ∫F=4π²c=2π; Chern number 2πc=1; c=1/(4π) gives 1/2 and is excluded | Integrality normalization repaired | None |
| Flat circle classification, B6.4 | S¹; lens L(n,1) | H¹(S¹;ℝ/ℤ)=ℝ/ℤ, c₁=0; lens flat classes ℤ/n with real c₁=0 | Consistent; correct coefficient sequence | None |
| Kernel/Ext formula | H₁=ℤ/n; H₁=ℚ | Ext(ℤ/n,ℤ)=ℤ/n; Ext(ℚ,ℤ) nonzero torsion-free, while Hom(H₂,ℤ)→Hom(H₂,ℝ) injective | Finite-generation qualifier correct | None |
| Fixed-curvature torsors, B6.5 | lens space F=0 | all-bundle torsor has n elements; fixed-bundle torsor H¹_dR/image=0 has one | Distinction correct | None |
| Lattice torus, B6.6 | rank 0; trivial rank 1 | Λ=0 gives zero torus and H²=0; Λ=ℤ gives circle exponential sequence | Negative connecting-class adapter now explicit | None |
| Twisted lattice torsor | S¹, monodromy −1 | cellular complex has no degree-2 cells; H²(S¹;Λ)=0; linear monodromy remains −1 | Trivial torsor ≠ trivial local system | None |
| Lens Bockstein sign | n=3,χ=1/3 | lifted coboundary=3·(1/3)=1; inverse convention gives −1=2 mod 3 | Sign distinguished | None |
| Formal adjoint, B8.1 | n=2,r=1; n=3,r=2 | signs −1 and +1; d*(f dx)=−∂x f | Correct formula | None |
| YM energy/positivity | Hopf on unit S²; flat bundle | ∣F∣²=1/4, area=4π, YM=π; flat YM=0 | Correct normalization | None |
| YM gauge invariance | Ad-invariant B | B(Ad_gF,Ad_gF)=B(F,F); energy unchanged | Correct under stated B | None |
| First variation, B8.2 | abelian F+t da | derivative=2(F,da); integration by parts gives 2(d*F,a) | Consistent | None |
| Mixed Hessian | A=X dx+Y dy,[X,Y]=Z; a=X dx,b=Y dy | F(t,s)=(1+t)(1+s)Z; mixed energy derivative=4‖Z‖²; two RHS terms each 2‖Z‖² | Curvature sign and coefficient discriminated | None |
| Gauge-fixed symbol | ζ=(1,0) in ℝ² | symbol d*d=diag(0,1); symbol dd*=diag(1,0); J symbol=id | Ellipticity restored | None |
| Spectral realization | flat torus J=Δ | eigenvalues ∣k∣²≥0; zero eigenspace finite; negative space dimension 0 | Consistent compact case | None |
| Conformal scale, B8.3 | g′=λ²g, n=4 or 2 | energy factor λ^{n−4}; n=4 gives 1, n=2 gives λ⁻²; Hopf energy π/λ² | Consistent | None |
| Riesz curvature term versus source formula | n=2, F=Z dx∧dy, a=X dx, b=Y dy, [X,Y]=Z orthonormal | ⟨F,[a∧b]⟩=1, so R_Aa=+Y dy; *[a∧*F]=−Y dy pairs to −1 | README Riesz definition is correct; source sign is wrong | Source issue only |
| Supply graph | SBC B2→CKG K5a→SBC B8 | both roadmap-level edges present; directed 2-cycle | Violates single direction | R01 |
| Quotient degeneracies, missing headline | G=1 on M; G arbitrary on ∅ | orbit quotient=M and projection=id; empty quotient=∅, natural dimension subtraction harmless | Both satisfy existential native signature | R04 |
| Lattice connecting convention | δt=1, φ=2πt | −δ[t]=−1=−δφ/(2π); opposite sign yields +1 | Repaired explicit sign Check | None |
| B8 curvature under chosen left gauge action | SO(3), A=sin(x)X dy, g rotation π/2 about z | at x=0, actual Ad(g)X=Y; printed Ad(g⁻¹)X=−Y≠Y; both squared norms equal | False formula | R03 |
| DGFloer supply graph | SBC B1.4→DGFloer 1.1→SBC B6.1 | forward and reverse edges both 1; directed cycle length 2 | Violates single direction | R02 |
| Source records / conformal locator | eleven reference works; g′=2²g in n=4 | manifest records=0 versus eleven needed; energy factor 2^(4−4)=1 is in Donaldson §2.2, not §2.1 | Metadata/locator incomplete | R06 |

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

Additional concrete checks: native `Aut` multiplication is `Iso.trans y x` (`Mathlib/CategoryTheory/Endomorphism.lean:131`); `GroupLieAlgebra` is the tangent space at the identity (`Mathlib/Geometry/Manifold/GroupLieAlgebra.lean:56`); positive matrix square-root inverse/determinant laws are in `Mathlib/Analysis/Matrix/Order.lean:142` and 148; the operator topology is in the **Matrix** namespace at `TauCeti/Analysis/Matrix/Normed.lean:33`. The lens-space manifold section at `TauCeti/Geometry/Manifold/Instances/LensSpace.lean:53` requires nonzero n and unit weights; B7's n≥2 and weights 1 meet them. Searches by object throughout both pinned trees found no principal-bundle mixin, `SmoothBundleForm` or manifold `mextDeriv` implementation. The bare normed-space exterior derivative is not that manifold carrier. The additional declarations below were opened for the new probes; location search alone was not treated as a theorem verification.

| Additional declaration / object | File and line at the pin | What was verified |
|---|---|---|
| `ProperSMul` | `Mathlib/Topology/Algebra/ProperAction/Basic.lean:54` | Properness of (g,x)↦(g•x,x); it does not itself install a smooth quotient atlas. |
| `MulAction.orbitRel.Quotient` | `Mathlib/GroupTheory/GroupAction/Defs.lean:349` | Native orbit setoid quotient, used with its quotient topology in the successful R04 probe. |
| `HomologicalComplex.Homotopy.homologyMap_eq` | `Mathlib/Algebra/Homology/Homotopy.lean:942` | Both complexes' homology instances are needed and are now explicitly retained in the README. |
| `LieGroup`, `ContMDiffMul` | `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean:72`; `Mathlib/Geometry/Manifold/Algebra/Monoid.lean:55` | The former extends the latter, which extends `IsManifold`; the quotient probe has a genuine smooth Lie group. |

**Ownership and supplier resolution.** Main was `9c6e95d911c8ef4a94a1d22116bd70e3fbcb4858`. DifferentialGeometry, AlgebraicTopology, HopfRinow and UniversalCovers supplied the shape comparison. All Needs lines and existing suppliers were checked against main. `SmoothSimplex.integral_mextDeriv`, the unresolved-name lead, resolves at DifferentialGeometry 8.4, line 848. The resolver reported no unknown citations but omitted libraries, checked separately above.

| Supplier / cited interface | Resolved file and line | Result |
|---|---|---|
| DifferentialGeometry forms, exterior derivative, smooth covers, flows and distributions | `TauCetiRoadmap/DifferentialGeometry/README.md:268`, 311, 357, 400, 463 | Layers 0–1, 2.3, 3.5, 4.3 exist with the consumed interfaces. |
| DifferentialGeometry integration, wedge, homotopy and densities | Same file, 510, 516, 524, 528 | 5.2–5.5 exist; the homotopy operator uses M×Icc(0,1), with the factor swap/restriction supplied in B6.0. |
| DifferentialGeometry symplectic and chain comparisons | Same file, 782, 836, 845, 852 | Layer 6 and 8.3–8.5 supply the named objects. Second countability supplies σ-compactness for the retained chain-comparison use. |
| DifferentialGeometry pairing and metrics | Same file, 866, 915, 923, 934 | 9.1, 12.1, 12.4 and the circle-volume normalization exist. Invariant averaging is now owned here, not attributed to the auxiliary-metric target. |
| LieGroups | `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:233`, 261, 275, 331 | Exponential, adjoint, closed-subgroup and immersed integral-subgroup contracts exist. The native tangent Lie algebra is retained; its comparison with left-invariant derivations is supplied at the pin. |
| AlgebraicTopology small chains/cellular comparison | `TauCetiRoadmap/AlgebraicTopology/README.md:481`, 515; Stage 4.6 | Small-chain homotopy equivalence and chosen cellular comparisons exist; no strictly natural cellular map is assumed. |
| AlgebraicTopology coefficient and orientation theory | Same file, 1011, 1180, 1253 | Stage 6.1 supplies local coefficients, UCT and Bocksteins; Stage 6.3 supplies fundamental classes and tangent orientation comparison. Smooth-circle coefficients are now correctly separated. |
| DGFloer | `TauCetiRoadmap/DGFloer/README.md:453`, reverse edge at 158 | Hurewicz exists, but the reciprocal quotient supply creates R02. |
| HopfRinow | `TauCetiRoadmap/HopfRinow/README.md:244`, 407 | Layers 1–2 supply geodesics, exponential/logarithm and Gauss lemma. Given-metric convexity and good covers are new here. |
| ComplexKahlerGeometry | `TauCetiRoadmap/ComplexKahlerGeometry/README.md:283`, 570, 580, 1407 | K2 leaves the scalar good-cover comparison here. K5a and K7.1 exist; the reverse bundle dependency creates R01. |
| UniversalCovers | `Completed/UniversalCovers/README.md:89`, 105 | Universal cover, deck group and regular-cover quotient conventions exist; the native construction is consumed through Tau Ceti. |

Ownership searches used `roadmaps grep`, `roadmaps show`, the board packages and the supplied sibling heads. FourManifolds F5 at `TauCetiRoadmap/FourManifolds/README.md:1452` consumes B8 and owns nonlinear gauge slices/ASD moduli, not its linear variation theorem. InstantonFloerTheory's supplier row at line 13 consumes B1–B6; its line 45 owns higher-dimensional/cylindrical gauge analysis. GeometricQuantization at lines 25–27 consumes the same normalized circle class and fixed-curvature torsor. LocalVariationalFieldTheory at lines 7–17 owns jets, Euler expressions and Lorentzian adapters, not the smooth-bundle foundation. AlgebraicVectorBundles concerns a different, algebraic carrier. No retained fully qualified Lean name collides with a readable sibling declaration. No already merged roadmap named SmoothBundlesConnections is being replanned, and no computational algorithm or sorry'd data was found.

Two overlap transfers remain part of the ownership resolution. The supplied LieGroupoidsPoisson head still owns countability at G0.0, lines 158–163, and regular fibres/transverse fibre products/kernel distributions at G0.1, lines 175–247. The supplied TopologicalSheafCohomology head §1.1, lines 108–129, owns raw native refinement maps/homotopies; §1.2 owns their cover-colimit theory. These roadmaps are later in the merge order. Move the shared prerequisites **here**, with the later roadmaps importing them: regular fibres and countability, and the generic raw refinement/homotopy interface. Keep cover-colimit/derived comparisons and groupoid constructions there. This records ownership movement under the brief's rule rather than adding upward suppliers or planning duplicate implementations. TopologicalSheafCohomology already tests the correct homotopy sign T_b−T_a=δh+hδ, agreeing with R06's proposed Check. No declared gap covers either cycle. Open work outside the supplied readable sibling set was not independently certified.

**Seeded source audit.** All five sampled locators were checked through the sources service; none is flagged unverified. Eight of eleven works were readable. The tables distinguish source statements from native-carrier/generalization adapters.

| Sample / source | Locator and extraction lines read | Hypotheses and support |
|---|---|---|
| Sheaves and exactness | nicolaescu, Example 7.5.31 and Proposition 7.5.32, p.327, nicolaescu line 14776; Remark 8.2.2, pp.350–351, nicolaescu line 15628 | Smooth vector-section/form sheaves are fine on paracompact smooth manifolds. The smooth exponential sequence is stalk-exact, with local logarithms, not surjective on all open sections. The bridge from Čech fineness to native Ext cohomology is the roadmap's target. |
| Native fixed-cover complex and displayed coordinates | stacks, §9, Tags 01ED–01EF, pp.9–10, stacks line 383; meinrenken, Example 3.16, p.36, meinrenken line 1420 | Stacks uses all ordered tuples with repetitions and alternating deletion. Locally constant sections are constant on each nonempty contractible intersection. Meinrenken's ordered presentation is not silently identified with the native repeated-tuple carrier. Empty sections are zero. |
| Conditional augmentation | stacks, Lemma 9.2, Tag 01EG, p.10, stacks line 407; Lemma 11.6, Tag 01ET, p.15, stacks line 678 | H⁰ identifies with sections for sheaves; an acyclic cover computes sheaf cohomology. This does not make the global-sections complex quasi-isomorphic to every good-cover complex. The pinned Tau Ceti criteria explicitly retain positive-degree exactness. |
| Raw refinements/homotopies | stacks, §15, Tag 09UY, p.24, stacks line 1066 | The formula uses restrictions and finite sums. Thus the stated presheaf/abelian-category extension with the required products uses no sheaf exactness or exact infinite products. The induced cohomology maps agree; the displayed source homotopy has the sign slip recorded below and in R06. |
| Coefficient maps/connecting morphism | nicolaescu, Theorem 7.5.28, p.326, nicolaescu line 14747; Remark 8.2.2, pp.350–351, nicolaescu line 15643 | Natural long exact sequences and the smooth exponential sequence support the square with identity on ℤ. Neither source identifies locally constant circle sections with smooth ones. The repaired statement uses the inclusion j and does not claim H(j) is invertible. |

| Other source | Locator / lines read | Scope checked |
|---|---|---|
| kms | §9.2, p.77, kms line 3583; §9.3, pp.77–78, kms line 3597 | Proper surjective submersion over connected base; horizontal/vertical splitting. Non-Hausdorff regular fibres instead have an explicitly local native route. |
| kms | §§10.2–10.3, pp.87–88, kms line 4020; Theorem 11.7, p.106, kms line 4866 | Principal action/division and local triviality; full/restricted holonomy and reductions. Transported-to-basepoint curvature avoids the source's all-total-space error. |
| meinrenken | Theorem 1.21, pp.10–11, meinrenken line 293; proof of 1.23, p.11, meinrenken line 336; Theorem 1.25, p.12, meinrenken line 371 | Free proper quotients, compact averaging/equivariant exponential charts and local slices. Averaging is now owned before its uses. |
| schreiber-waldorf | arXiv:0705.0452v5, Proposition 4.7, p.30, schreiber-waldorf line 1058; Appendix B.4, pp.63–64, line 2374; Theorem 5.8, p.39, line 1418 | General Lie-group local reconstruction and negative derivative; 5.8 is Hermitian/unitary. The GL_n fixed-bundle extension remains an owned adapter. The README now explicitly uses the preprint's version and pagination. |
| freed | hep-th/9206021, §1, pp.7–8, equations (1.5), (1.8)–(1.16), freed line 294 | Right actions, equivariance, structure equation and Bianchi. Its compact setting is not by itself a source for arbitrary G; KMS supplies that theory. |
| donaldson-gauge | §2.1, p.3, donaldson-gauge line 120; §2.2, p.3, line 188 | Energy, gauge fixing, ellipticity and finite negative space. Conformal invariance is at §2.2, line 207, giving R06's locator correction. |
| jiang-yangmills | §2, p.8, jiang-yangmills line 306; Propositions 2.9 and 2.12, p.11, lines 401 and 431; Exercise 2.11, line 424 | First/second variation and circle connections. The README's Riesz-defined R_A and factor 2 avoid the source's Hessian/sign slips; gauge fixing and positivity remain explicit. |
| nicolaescu | Theorem 7.5.34/Corollary 7.5.35, p.328, nicolaescu line 14809; Theorem 7.5.38, p.329, line 14849 | Fine resolutions and de Rham/good-cover comparisons. The latter uses Euclidean intersections; the roadmap owns the smooth-contraction Poincaré argument for its broader good-cover definition. |
| nicolaescu | Theorem 10.2.36(a)–(b), p.490, nicolaescu line 22509 | Compact metric manifold, compatible bundle metric/connection and finite p. Arbitrary locally finite Borel-measure claims in B2 are separately routed through the pinned density theorems, not attributed to this compact metric-volume result. |

Source identifiers in this report retain the previous review's work identifiers; line numbers refer to the legal line-numbered extractions of the same texts.

## Not verifiable

- **lee-rm:** Lee, *Introduction to Riemannian Manifolds*, second edition (2018), Lemma 6.16/Theorem 6.17. The sources-service title lookup returned no legal text. Convexity examples were computed independently; the book's numbering remains unverified.
- **lee-sm:** Lee, *Introduction to Smooth Manifolds*, second edition (2013), Corollary 5.14, Proposition 5.38, Theorems 21.10/21.17. The service returned the publisher's paywalled entry as `uncertified`. No missing-text request was added for that settled status; overlapping KMS/Meinrenken results do not certify Lee's numbering.
- **kobayashi-nomizu:** *Foundations of Differential Geometry* I (1963), Chapter II §§1–5, 7–9 and Appendix 4. The service reached a JSTOR review landing page, not the book. No legal readable book was returned. Overlapping holonomy claims were checked in KMS.

All eleven references were attempted. The two unresolved reference requests were saved together in the job's reference-request artifact, preserving the existing keys. The review is complete with these limitations, not parked or accepted conditionally on obtaining the books. Published pagination was not inferred from a preprint: Schreiber–Waldorf's expressly cited v5 was checked as such.

## Source issues

- **Error** in kms at Theorem 11.7(4), printed p.106: the source says curvature throughout the total principal bundle spans the based holonomy algebra; it should be curvature on the based holonomy reduction, equivalently parallel-transported curvature at the basepoint; affects a stated result.
- **Misprint** in meinrenken at Theorem 1.25, printed p.12: the source says the slice model is diffeomorphic to the whole manifold; it should be diffeomorphic to an invariant neighbourhood of the orbit; affects a stated result.
- **Misprint** in meinrenken at Example 3.16, printed p.36: the source says all singular zero-cochains on a contractible intersection are constant; it should be the locally constant subcomplex consists of constants there; affects nothing.
- **Misprint** in stacks at §15, Tag 09UY, printed p.24: the source says the displayed insertion homotopy satisfies γ−γ′=dh+hd; it should be γ′−γ=dh+hd, or the displayed h should be negated; affects the proof.
- **Misprint** in nicolaescu at proof of Theorem 7.5.38, printed p.329: the source says the kernel in the sequence ending Ω^(k−1)→Z^k is Z^k; it should be Z^(k−1); affects the proof.
- **Error** in nicolaescu at Remark 8.2.2, printed p.351: the source says realification of integral H² loses precisely torsion on arbitrary smooth manifolds; it should be its kernel is Ext(H₁,ℤ), equal to torsion under an additional finite-generation hypothesis; affects a stated result.
- **Error** in jiang-yangmills at §2 opening, printed p.8: the source says compact Lie groups have semisimple Lie algebra and nondegenerate Killing form; it should be compact Lie algebras may have centre, so choose a positive Ad-invariant inner product; affects a stated result.
- **Misprint** in jiang-yangmills at proof of Proposition 2.9, printed p.11: the source says the parameterized curvature expansion computes L(A+η); it should be L(A+tη); affects the proof.
- **Misprint** in jiang-yangmills at proof of Proposition 2.9, printed p.11: the source says the formal adjoint sign is (−1)^(2n+1) without a degree parameter; it should be (−1)^(n(r+1)+1) on r-forms; affects the proof.
- **Error** in jiang-yangmills at Definition 2.10, printed p.11: the source says the Yang–Mills equation is equivalent to being a local extremum; it should be stationarity, which also permits saddles; affects a stated result.
- **Error** in jiang-yangmills at Proposition 2.12, printed p.11: the source says the curvature term in the linearization is +*[η∧*F] in every dimension; it should be (−1)^(3n+1)*[η∧*F], negative in even dimensions under the stated bracket convention; affects a stated result.
- **Misprint** in jiang-yangmills at discussion after Proposition 2.12, printed p.11: the source says the linearized equation is the Hessian of its unhalved energy; it should be half that Hessian; affects a stated result.
- **Gap** in jiang-yangmills at discussion after Proposition 2.12, printed p.11: the source says the ungauged Hessian computes solution-space dimension through an index theorem; it should be gauge fixing, an elliptic deformation complex and obstruction analysis are required; affects the proof.
- **Misprint** in schreiber-waldorf at Proposition 4.7, arXiv v5 printed p.30: the source says the functor category has X as source; it should be the thin path groupoid P₁(X); affects nothing.
- **Misprint** in schreiber-waldorf at Lemma B.2 proof, arXiv v5 printed p.64: the source says equal velocities compare γ₁ and undefined γ₂; it should be the two introduced curves γ₀ and γ₁; affects nothing.
