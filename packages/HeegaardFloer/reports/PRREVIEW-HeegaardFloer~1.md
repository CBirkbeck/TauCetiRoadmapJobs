# Review of HeegaardFloer (pull request #957 at e703439)

**Verdict:** needs changes

## R01 (P1) — The supplier graph still has reciprocal dependencies

**Location:** `TauCetiRoadmap/HeegaardFloer/README.md:1967`, also lines 788, 878, 1412 and 2799. The first location says “Consume AnalyticStableMaps M0.1”.

**Claim:** An early section of a consumer can supply a later section of this roadmap without violating the single direction of supply.

**Witness:** `TauCetiRoadmap/AnalyticStableMaps/README.md:37` consumes HF F2.2a–c/F2.3. `TauCetiRoadmap/DGFloer/README.md:113` consumes HF M/F0–F2. `TauCetiRoadmap/MorseNovikov/README.md:48` consumes HF M/F0. These give three reciprocal pairs, not a merge order.

AnalyticStableMaps is the supplied open head; DGFloer and MorseNovikov are on main. Independent early sections can avoid theorem-level cycles but cannot meet the binding roadmap-level direction rule. GeometricCurrents G3 also routes HF inputs through DGFloer.

**Repair:** Move ownership so each roadmap can be supplied in its entirety before its consumer. One concrete arrangement is to retain the earlier HF analytic/ordinary-Morse foundation, and put the new consumers of AnalyticStableMaps, DGFloer and MorseNovikov in HeegaardFloerPartII after those suppliers. Alternatively extract their independent generic inputs into earlier owners and remove the reverse imports. Preserve the general constructions. For each of the three pairs, the repaired graph must have only one direction; assigning the foundation order 0, its consumers 1, and Part II 2 makes all three displayed routes increase strictly. Merely renaming a clause “early” leaves both inequalities order(HF)<order(X) and order(X)<order(HF).

## R02 (P1) — Sharp finite-order Sard is not supplied by the permitted version of DifferentialGeometry

**Location:** `TauCetiRoadmap/HeegaardFloer/README.md:1049–1057`, especially “single sharp finite-dimensional Sard theorem owned by DifferentialGeometry10.2”.

**Claim:** DifferentialGeometry10.2 supplies Sard at k>max(dim source−dim target,0), which F0.0 uses to prove sharp Sard–Smale.

**Witness:** On main, `TauCetiRoadmap/DifferentialGeometry/README.md:884` only transfers Tau Ceti's flat Sard theorem through charts. The pin's `TauCeti/Analysis/Calculus/Sard/OutermostStratum.lean:366` requires k≥(dim source)²+1. The sharper revision is not the main-branch contract.

An open revision of an existing roadmap is not an admissible substitute for that roadmap on main. The resolver also searches revisions, so successful name resolution does not establish this main contract. No gap was declared.

**Repair:** Either own the sharp finite-dimensional theorem here before F0.0, or declare a precise gap for DifferentialGeometry10.2, in both the plan and exact supplier contracts: for a C^k map between finite-dimensional real manifolds, on open boundaryless charts, critical values are null when k>max(m−n,0), with the stated chart/countability hypotheses. Test the contract on m=3, n=1, k=3 at a zero derivative: the requested sharp bound is 3>2, whereas the pinned kernel bound is 3≥10, which fails. A smooth-only or quadratic-bound contract does not repair this instance.

## R03 (P2) — Generic smooth-section topology is planned a second time

**Location:** `TauCetiRoadmap/HeegaardFloer/README.md:1274–1283`: “Construct compact-source C∞ function and symmetric-tensor section spaces”.

**Claim:** HF constructs the generic smooth-section carrier/topology, its completeness, and its relation to derivative seminorms, including boundaryless compact sources.

**Witness:** Main's `TauCetiRoadmap/ComplexKahlerGeometry/README.md:718–726` already owns the complete, atlas-independent Fréchet topology on all smooth finite-rank bundle sections, with continuous restriction, on second-countable real or complex manifold bases.

The boundary/corner and fixed-germ applications are additional targets; the boundaryless section spaces are specializations of that existing owner.

**Repair:** Import K5a's smooth-section topology for boundaryless X, and state only the comparison with the finite jet norms and the extra boundary/corner, closed-constraint and relative-density results here. Give their extra hypotheses explicitly. For X=S¹ and the trivial line, both proposed carriers contain sin θ and have the same order-j sup seminorm 1 for every j; for a symmetric tensor sin θ·dθ² the same scalar calculation applies. The repair must identify these existing spaces, while separately proving the half-box derivative-limit statement needed on a boundary.

## R04 (P2) — A statable headline theorem is absent from the acceptance test

**Location:** `TauCetiRoadmap/HeegaardFloer/README.md:2212–2228`; `TauCetiRoadmap/HeegaardFloer/Suggested.lean:14–45`.

**Claim:** F2.6f will prove nonsqueezing, but the file provides only selected milestones and a general statement that the remaining types are missing.

**Witness:** A scratch signature for nonsqueezing elaborated against the exact pins, using only `import Mathlib`; its sole warning was `sorry`. No pseudoholomorphic-moduli carrier is needed to state it.

**Repair:** State nonsqueezing itself in `Suggested.lean`. For example, the following native signature was elaborated successfully; f is smooth only where required, and its restriction to the open ball is the embedding:

```lean
open scoped ContDiff
open InnerProductSpace

theorem nonsqueezing {n : ℕ} (hn : 0 < n) {r R : ℝ}
    (hr : 0 < r) (hR : 0 < R)
    (f : EuclideanSpace ℂ (Fin n) → EuclideanSpace ℂ (Fin n))
    (hsmooth : ContDiffOn ℝ ∞ f (Metric.ball 0 r))
    (hembed : Topology.IsEmbedding
      (fun x : Metric.ball (0 : EuclideanSpace ℂ (Fin n)) r => f x))
    (hsympl : ∀ x ∈ Metric.ball (0 : EuclideanSpace ℂ (Fin n)) r,
      ∀ v w : EuclideanSpace ℂ (Fin n),
      (inner ℂ (fderiv ℝ f x v) (fderiv ℝ f x w)).im =
        (inner ℂ v w).im)
    (hcylinder : ∀ x ∈ Metric.ball (0 : EuclideanSpace ℂ (Fin n)) r,
      ‖f x ⟨0, hn⟩‖ < R) : r ≤ R := by
  sorry
```

For n=1 and f=id, the symplectic factors are 1=1 and r=R is admitted. The dilation f(x)=2x gives 4ω=ω, so it is correctly excluded; the impossible r=2, R=1 case cannot sneak through that map. The positivity hypotheses avoid empty-ball and zero-dimensional stand-ins. Also replace the docstring's collective “remaining … constructions” with a named list of the nonstatable headlines and the missing carrier for each, including the Morse/Bott comparison, HF invariance, pairing and reconciliation theorems.

## R05 (P3) — Calibration algebra and unused carriers pad the Lean acceptance files

**Location:** `TauCetiRoadmap/HeegaardFloer/Suggested.lean:105–138`; `TauCetiRoadmap/HeegaardFloer/TorusBottShearTargets.lean:30`; `TauCetiRoadmap/HeegaardFloer/NonorientableBottModuliTargets.lean:28`; also the circle, Klein-bottle and four-dimensional companion files, all in the same folder.

**Claim:** Finite sign computations and algebraic models stand in the Lean files as targets alongside the geometric headlines.

**Witness:** `shear_intertwines` closes with `simp [shear_apply, hF, add_assoc]`. `normalMonodromy_calibration` closes with one `simp` expanding its matrices and quadratic form. Both scratch files elaborated successfully. Neither statement constructs a Bott moduli space or complex.

The Morse abbreviations are used by no headline. The scalar crossing identities are README sign checks, and the circle matrices, Klein quotient and four-dimensional matrices explicitly calibrate worked examples. The Klein statement need not close with one tactic to be padding: it is precisely the finite-chain Check, without the geometric identification. All five companion files also use `Mathlib.*` subimports instead of the required single `import Mathlib`. The worker's passing import scan did not catch these scoped companions.

**Repair:** For the unused Morse carriers and scalar calibrations, delete them from `Suggested.lean`; retain the mathematics in the README. Remove the companion calibration declarations/files from this acceptance package, preserving their computed values as README Checks. Do not replace `sorry` by the short proofs in place. If any genuinely headline statement remains in a companion, it must use the stipulated imports and form. The actual geometry remains a target, with its missing carriers named in the module docstring. The computations below retain the signs, torsion and normalization evidence after deletion.

The second successful one-tactic probe was:

```lean
simp [negativeMonodromy, normalMonodromy, normalForm,
  Matrix.det_fin_two, Matrix.det_fin_three, Matrix.one_fin_three,
  Matrix.vecHead, Matrix.vecTail, Fin.sum_univ_succ,
  QuadraticMap.weightedSumSquares_apply]
```

## R06 (P3) — Much of the seeded sample has no exact source locator

**Location:** `TauCetiRoadmap/HeegaardFloer/README.md:190–205`, `233–246`, `493–531`, `788–895`, `1013–1135`, `2613–2659`, `2943–2972`, and References at 3283.

**Claim:** General references to texts or entire lanes make the individual target statements source-backed.

**Witness:** M.0a gives no theorem/page for its C^k manifold and parameter conclusions; M.2 cites three authors without theorem/page. F4.M and F5.3 lack the exact numbered comparisons available in the cited papers. No `sources.toml` is present.

A Euclidean-model gluing result does not certify arbitrary finite-regularity families; a mod-2 comparison does not certify every integral/naturality extension.

**Repair:** Attach exact theorem/section and page locators to each target, distinguish proved source results from extensions whose proof routes are planned here, and record the works under stable manifest keys. Useful verified anchors include Wehrheim Theorem 2.3/Remark 2.4, pp.6; Theorem 2.6, pp.7–8; Corollary 2.9, pp.10–11; OSS Theorems 10.2–10.4, p.91 of the fetched preprint; Lipshitz Propositions 13.2 and 13.4–13.7, pp.1058–1060. Match the actual version, rather than attaching those page numbers to another edition. On the two-pointed S³ test, Theorem 10.2 gives rank 2, whereas the singly pointed rank is 1; that is the multipointed comparison the locator must support. Record unreadable sources as uncertified/unverified rather than guessing their contents.

## R07 (P3) — The README does not expose the required per-target contracts and Checks

**Location:** `TauCetiRoadmap/HeegaardFloer/README.md:1–177`, `1011–1144`, `3320–3351`; `Suggested.lean:14–17`.

**Claim:** Lane-level narrative and examples suffice as the roadmap's build specification.

**Witness:** There is no `## Exact supplier contracts`, no `*Needs:*` line, no per-definition `**Checks.**` list, and no layer-ending `### Examples`/`### Dependencies`. The introduction and ending contain process narrative; several Lean declarations have no docstrings.

F0.0’s determinant line, orientation transport and linear transport need distinct tests and inputs. Backticked construction names such as `smoothRelative_morseSmale_residual` also need reconciliation with the acceptance file.

**Repair:** Reshape the existing material into the required Summary, Scope and ownership, Conventions, Exact supplier contracts, build-order layers, per-target Needs, API bullets and Checks. Move each existing computed example beside the definition it discriminates, add missing negative controls, and remove process instructions and pull-request URLs. Do not thin the mathematics. For determinant transport, preserve the three distinct checks: identity orientation transport is +1; concatenating two orientation reversals gives +1; a line bundle without a connection does not select a scalar transport (multiplication by 1 and 2 both preserve orientation). This prevents the new formatting from concealing a weakened contract.

## Verified sound

All seven scoped files were read at e703439, including all 3,351 README lines and six Lean files. There are **7 findings: 2 P1, 2 P2 and 3 P3**. The supplied gate passes, including its targeted build and outside-folder check. Direct elaboration of `Suggested.lean` also passed with exactly five `sorry` warnings; the earlier missing-object note is stale.

A scratch compilation printed `#check @name` for **all 34 declarations**. No required standing hypothesis was lost in the five admitted Suggested signatures. The unused Morse definitions do not acquire smoothness/Morse hypotheses from their section. Across all files there are **8 admitted theorems**: the torus and normal-monodromy statements close with the single `simp` probes in R05; `simp`, `rfl` and `infer_instance` did not close the other six. Existing scalar and matrix proofs were read. No sorry'd data, `set_option`, admitted example, copied mathematical passage or computational shortcut was found. Companion imports and padding remain R05 despite the gate passing.

The final dependency command returned exactly:

```text
depcheck: 203 roadmaps, 1360 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line in that output. R01 is a manual witness of reciprocal *semantic* supplier citations missed by this check, not a claim that the command emitted a failure. Roadmaps absent from the merge order were not treated as defects. Main was checked at 9c6e95d; the open-head searches were used as ownership leads, and existing-roadmap dependencies were checked against main as required.

Headline inventory: integral Morse/Bott homology and continuation; filtered/Serre comparison; products, duality, cup product and Witten comparison; Fredholm genericity/determinants; spectral flow/index and RR; Darboux/Moser; spheres, nonsqueezing, rulings and the equal-area group; forced discs/nonexactness; exact Lagrangian Floer; HF invariance/gradings/naturality; cylindrical equivalence, bordered pairing, knot Floer; all three reconciliations. Darboux, PSL triples and forced discs have native signatures. Nonsqueezing is the demonstrated omission. The other missing-carrier headlines need the individual docstring accounting requested in R04; blanket nonstatability is not certified.

The **121 computed rows** below cover the seeded sample, headline endpoints, Lean declarations and finding targets. “Pass” is an instance check, not a general proof; source certification is reported separately.

| Statement / target | Instances and values computed on both sides | Result / change |
| --- | --- | --- |
| Supplier order, R01 | Let h,a be HF/ASM positions. Consumption gives a<h and h<a, hence h<h. The DGFloer and MorseNovikov pairs give the same contradiction. Assigning foundation 0, suppliers 1, Part II 2 removes it. | Fail; move ownership. |
| Sharp Sard supplier, F0.0 | m=3,n=1,k=3 and zero derivative: index=2, kernel dimension=3. Sharp test 3>2 is true; pin test 3≥3²+1=10 is false. | Missing contract, R02. |
| Smooth-section topology, F0.4 | On S¹, sin θ and every derivative have sup norm 1. Scalar functions and their trivial-bundle sections therefore have identical seminorm sequence (1,1,…); sin θ·dθ² has the same coefficient sequence. | Duplicate boundaryless object, R03. |
| M.0a local stable dynamics | f=−x²+y², Euclidean g: −grad f=(2x,−2y); stable tangent is y-axis, unstable tangent x-axis, each dimension 1. Flow (e²ᵗx,e⁻²ᵗy) has exactly those limits. | Pass; no Banach-C¹ differentiability inferred. |
| M.0b standard metrics | Full quadratic model gives rates ±2; Wehrheim's half-quadratic gives ±1. Replacing time t by 2t makes eᵗ equal e²ᵗ; gluing coordinate becomes e⁻²ᵗ. | Pass with explicit time conversion. |
| M.1 quotient dimension | Indices 2→0: intersection dimension 2, free translation quotient dimension 1=2−0−1. For p=q, the constant trajectory has stabilizer ℝ, not trivial. | Pass; constant branch explicitly separate. |
| M.1 Lyapunov/no cycles | Along nonconstant negative flow, df/dt=−‖grad f‖²<0; summing a proposed closed chain of drops gives 0<0. A constant orbit has derivative 0. | Pass. |
| M.2 corners | A 3→2→1→0 broken chain has three zero-dimensional quotients and two gluing parameters: total 2=3−0−1; deepest corner codimension 2. | Pass in standard-near-critical sector. |
| M.3 boundary sign | Breaking 2→1→0 gives exponent 2+1−1=2, sign +1. Hutchings' exponent 2+1+1=4 also gives +1. Their difference is 2. | Pass. |
| M.3 integral differential | RP² complex: d₂=2, d₁=0; d₁d₂=0, H₁=ℤ/2, H₂=0. Mod 2 both maps are 0, yielding H₂=𝔽₂. | Pass; integral torsion retained. |
| M.3 sphere/torus | Two maxima and one saddle give d₂(a,b)=a−b after choosing opposite top generators: kernel ℤ, d₁=0. Standard torus opposite trajectories give 1−1=0 and ranks (1,2,1). | Pass after basis convention. |
| M.4 geometric comparison | Point: A,D are identity on ℤ, AD=1 and DA−1=0=∂F+F∂. For an interval, ∂[0,1]=[1]−[0] on both smooth-chain and current sides. | Pass; signs require geometric maps, not ranks alone. |
| M.4 quartic example | In one coordinate ẋ=x(1−x²), derivative at 0 is 1 and at ±1 is −2. Three-coordinate truncated cube has V=48,E=72,F=26, so V−E+F=2. | Pass; faces include 6 octagons, 12 quadrilaterals, 8 hexagons. |
| M.5 continuation | Circle two-generator model has S²=I, D=I−S; DS=SD=S−I. Thus S is a chain map; it is not the identity matrix. | Pass. |
| M.5 chain homotopy | K=−I gives DK=KD=S−I. On degree 0, DK=S−I; on degree 1, KD=S−I. I·I=I differs from S at chain level but is homotopic. | Pass; strict composition not asserted. |
| M.5a relative case | Oriented interval relative to endpoints: H₁(I,∂I)=ℤ; its boundary is [1]−[0], augmentation 1−1=0. The absolute interval has H₁=0. | Pass; relative and absolute groups distinguished. |
| M.6 Bott dimension | C=S¹ of index 2, D=S¹ of index 0: quotient dimension 2−0+1−1=2. Parametrized space has dimension 3. For isolated points, c=0 recovers λC−λD−1. | Pass. |
| M.6 determinant order | Fiber-product example X=Y=T=ℝ, both maps id: quotient map (v,w)↦v−w; using diagonal tangent (1,1) and target lift (1,0) gives determinant −1. Formula (−1)^(dimY·dimT)=−1 agrees. | Pass. |
| M.6 fiber-product swap | dim X=dim Y=dim T=1: exponent 1+2+1=4, sign +1. The swap acts as identity on the diagonal tangent. For T=point and X=Y=ℝ, exponent 1 gives the usual −1. | Pass in both directions. |
| M.6 nonorientable trajectory example | Negative-plane reflection has determinant −1; full three-normal reflection diag(1,−1,−1) has determinant +1. A circle direction times the reflected trajectory circle gives a Klein-bottle moduli space of dimension 2. | Pass; ambient orientation does not orient negative bundle. |
| M.7 orientation coefficients | Circle monodromy −1 gives d=−1−1=−2, H₀=ℤ/2, H₁=0. Twice-around coefficient 1+(−1)=0. Mod 2 the same boundary is 0. | Pass. |
| M.7 internal differential shift | λC=2,λD=0 gives dCD=1; cross term (+1)(−1)+(+1)=0. λC=λD=1 gives dCD=−1; cross term (−1)(−1)+(−1)=0. | Pass, including equal indices. |
| M.7 broken-face parity | Exhaustive integer computation for λC,λE,λD,c,e in 0…4, retaining nonnegative a,b,m: 1,396 cases; both displayed exponents agree mod 2 in all 1,396; discrepancy count 0. | Pass. |
| M.7 two-cap sphere | d₂(a,b)=a+b: image ℤ, kernel generated by (1,−1). Hence H₂=ℤ,H₁=0,H₀=ℤ; a single cap has boundary +1. | Pass; no false separate top generators. |
| M.7 torus chain shear | d=2,e=3,P=5,Q=7 gives F=dP+Qe=31. At (x,y)=(11,13), left first coordinate 22+403−273=152; right 2(11+65)=152; both second coordinates −39. | Pass; algebraic padding in Lean. |
| M.7 symmetric torus | F=0 and internal circle differential 0 give two shifted circle groups: H₀=ℤ,H₁=ℤ²,H₂=ℤ. Nonzero nullhomotopic F gives the same ranks via the shear. | Pass. |
| M.7 Klein bottle | Top boundary n↦(0,2n): kernel 0; quotient ℤ²/(0,2ℤ)=ℤ⊕ℤ/2. Two sections (1,0),(1,1) differ by the nonzero order-two class. | Pass; coordinate quotient is a Check. |
| M.7 four-component sphere | d₂(a,b)=(0,−a+b), d₁(c,d)=(−c,c). Composite sends (a,b) to (0,0); ker d₂=ℤ(1,1), im d₂=ℤ(0,1), H=(ℤ,0,ℤ). | Pass. |
| Invariant-current specialization | Blowup fixed points on E have values −ε,+ε and weights (1,−2),(−1,2). Each has index 2; invariant flow on E gives a two-dimensional intersection where transverse equal-index intersection would have dimension 0. | Pass; unrestricted invariant-Morse–Smale claim is correctly refused. |
| M.8 two filtrations | Two-cap sphere: index drop 2 gives d₂:ℤ²→ℤ, (a,b)↦a+b; critical-value drop 1 gives the same map as d₁. Survivors have total degrees 0 and 2 in both. | Pass. |
| M.8 four-component value filtration | d₁ kills the pairs (1,1)→(0,1) and (3,−2)→(2,−2), each by +1. Survivors (0,0),(3,−1) have total degrees 0,2. | Pass. |
| M.8 four-component index filtration | Maps c↦(−c,c) and multiplication by −1 leave one ℤ at (0,0), one at (2,0). Both filtrations thus give H₀=H₂=ℤ,H₁=0. | Pass; filtration positions differ. |
| M.8 bundle comparison | Base indices 2→1, fiber S¹: quotient dimension 2−1+1−1=1, equal to base quotient dimension 0 plus fiber dimension 1. A trivial base point gives E²₀q=Hq(fiber). | Pass for adapted horizontal metrics. |
| M.8 SU(3) | S³→SU(3)→S⁵ has E² entries at (0,0),(0,3),(5,0),(5,3); no differential can join nonzero entries. Total degrees 0,3,5,8 each give ℤ; x₃x₅ generates degree 8. | Pass. |
| M.9 product sign | For |x|=1 and ∂x=a, ∂y=b: ∂(x⊗y)=a⊗y−x⊗b. Applying ∂ gives a⊗b−a⊗b=0. | Pass. |
| M.9 integral Künneth | Tensoring two degree-1 ℤ/2 homology classes gives ℤ/2 in total degree 2 and Tor(ℤ/2,ℤ/2)=ℤ/2 in degree 3. Over the zero coefficient ring both are 0. | Pass; Tor not discarded. |
| M.9a Y-flow dimensions/cup | Root index 2, leaves 1,1 gives dimension 0=2−1−1; root 1 with leaves 1,1 gives −1 and generic emptiness. On T², a∪b=−b∪a and evaluates +1 on the ordered fundamental class. | Pass. |
| M.10 Witten normalization | f=x²/2: on 0-forms Δt=−∂²+t²x²−t. On e^(−tx²/2), the three terms sum (t−t²x²)+(t²x²−t)=0. | Pass; semiclassical normalization tested locally. |
| F0.0 Fredholm index | Zero map ℝ²→ℝ³: kernel dimension 2,cokernel dimension 3,index −1; it is not surjective. A regular fiber at index −1 must therefore be empty, not dimension Nat subtraction 0. | Pass. |
| F0.0 normal form | f(x,z)=(x,z²): derivative at z=0 has one kernel and one cokernel direction,index 0. Slice critical values consist of 0, interior empty. Outside the partial inverse chart no reconstruction identity is assumed. | Pass. |
| F0.0 determinant transport | Zero map ℝ→0 has determinant line ℝ and odd index; swapping two such determinant factors gives −1. Orientation reversal twice gives +1. Multiplication by 1 and 2 both preserve an oriented endpoint line. | Pass; orientation transport does not fix linear transport. |
| F0.1 function genericity | f=x² has Hessian 2 and isolated nondegenerate zero; f=x⁴ has Hessian 0 at 0. Perturbing to x⁴+εx² with ε>0 gives Hessian 2ε>0. | Pass as local discrimination; global residual theorem needs its supplier. |
| F0.2 strip signs | A(s)=tanh s: D=∂s−A has formal solution cosh s, not in L²; adjoint solution sech s is in L². Kernel/cokernel dimensions 0,1 give index −1. | Pass. |
| F0.3 parameter projection | L=0:ℝ→ℝ and B=id:ℝ→ℝ gives total map (x,p)↦p surjective. Kernel is ℝ×0; projection to p is zero, has kernel dimension 1,cokernel dimension 1,index 0=index L. | Pass. |
| F0.4 fixed-metric parameter spaces | Positive scalar metrics g=1 and g=2 give positive inverses 1 and 1/2; g=0 is excluded. Fixed-germ affine constraint h=0 on a closed ball is closed under every C^j limit. | Pass; duplicate unconstrained space isolated in R03. |
| F0.5 derivative budget | N=0,r=1 gives k≥1,ℓ≥3; N=2,r=2 gives k≥3,ℓ≥6. Moving evaluation loses a derivative, so using ℓ=k is not the stated contract. | Pass arithmetic; source proof uncertified. |
| F0.6 periodic returns | V=1 on S¹: normal space dimension 0, characteristic determinant of I−P on it is 1, so no eigenvalue 1. Zero-dimensional manifold has no nonstationary orbit. | Pass; return-germ supplier direction fails R01. |
| F0.7 weak Bott genericity | For a positive-gradient equator→pole flow of z² on S², free parametrized trajectory dimension is 2; quotient dimension 1. The reverse negative-gradient formula gives 2−0+0−1=1. | Pass; source's extra endpoint dimension is erroneous. |
| F1.1 Sobolev trace budget | Surface k=1,p=3 gives kp=3>2 and continuous representatives; k=1,p=2 gives equality 2 and is excluded from that embedding branch. | Pass. |
| F1.2 CR normalization | u(z)=z: u_s=1,u_t=i, unhalved u_s+i u_t=0. For u(z)=bar z: unhalved value 2, half-normalized value 1. | Pass; factor two is retained. |
| F1.3 scalar crossing | At s=log 2: cosh=5/4,sinh=3/4,tanh=3/5. D cosh=3/4−(3/5)(5/4)=0. For sech, adjoint gives 12/25−12/25=0. Spectral crossing +1 corresponds to index −1. | Pass; scalar identities are padding. |
| F1.4 Maslov | Constant real boundary line has μ=0; the line making one half-turn has μ=1. Changing the orientation of a chosen frame does not alter the underlying line loop. | Pass. |
| F1.5 closed RR | Trivial complex line over S²: real index 2=1·χ+2c₁=2+0. Tangent line c₁=2: index 6=2+4. Degree −2 line: index −2=2−4. | Pass; negative index retained as integer. |
| F1.5 bordered RR | Disc, rank 1, constant real boundary: index 1=χ+μ=1+0. Half-turn boundary gives index 2=1+1. | Pass. |
| F2.1 Darboux | Standard plane form evaluated on (e₁,e₂) is +1; identity chart pulls back +1 to +1. In dimension 0 the zero bilinear form is nondegenerate and both sides evaluate 0. | Pass; empty/nonempty handled by the given point. |
| F2.1 standard symplectic transport | In the prescribed basis order b(inr),b(inl), source ω=+1; targets (e,0),(0,e) give +1. Reversing only one order gives −1 and fails. | Pass. |
| F2.1 Moser | For ωt=c(t)dx∧dy with c(t)>0, local scaling φt(x)=sqrt(c(0)/c(t))x gives φt*ωt=c(0)dx∧dy. A path through c=0 has no inverse contraction map. | Pass local check; global compact hypotheses separate. |
| F2.1 self-dual normalization | a=1,b=c=0: ‖ω‖²=2, A²=−I, ω-matrix·A=I. a=2 gives ‖ω‖²=8,A²=−4I and is not a unit-coefficient compatible J. | Pass; not norm-one two-form. |
| F2.2 local holomorphic maps | u=z²: derivative 0 at 0, isolated order 2; at 1 derivative 2. z and 2z share an isolated value at 0 but have distinct germs, so an isolated crossing is not normalized away. | Pass. |
| F2.3 energy/removal | Standard u(z)=z on unit disc: half Dirichlet energy (1/2)·2π=π=area. u=constant gives 0 on both sides. u=1/z has energy diverging at 0, excluding removable-puncture misuse. | Pass. |
| F2.4 regular dimensions | Simple CP² line: 2n+2c₁−6=4+6−6=4. Adding one mark gives 6. A multiple cover does not acquire a simple-map regularity conclusion. | Pass. |
| F2.5 gluing | Two strips of indices 1 and 1 each have quotient dimension 0; a gluing parameter gives dimension 1=2−1 for the index-2 quotient. Broken end lies at parameter 0. | Pass dimension check, not an analytic gluing proof. |
| F2.6a PSL triple | Ordered (0,1,∞) is fixed only by identity. The triple (1,0,∞) is reached by z↦1−z. A repeated target violates the pairwise-distinct premises. | Pass. |
| F2.6a degree/genus | Branched cover S²→S², z↦z² has d=2,total ramification 2: 2=2·2−2. For d=1,R=0, the formula gives χ=2. | Pass. |
| F2.6b simple/covered distinction | A smooth conic in CP² is simple but represents 2[line]. A degree-two parametrization of a line has the same class but is multiply covered. | Pass; nonprimitive does not mean nonsimple. |
| F2.6b marked action | u(z)=z,g(z)=z+1,mark z=2: (u∘g)(g⁻¹2)=u(2)=2. Incorrectly using g·2 gives 4. Translation and dilation do not commute: T∘D(0)=1, D∘T(0)=2. | Pass; inverse mark action and action order matter. |
| F2.6c area gap | Total area a=1 and each positive component area≥1 permit exactly one component of multiplicity 1. Two positive components or a double cover require area≥2. Constants have area 0. | Pass; primitivity alone was not used. |
| F2.6c ghosts | A constant tree with one node attaching to the positive component and at most one mark has total external flags≤2; some constant vertex has fewer than 3 special points and is unstable. | Pass for zero/one-mark compactness. |
| F2.6d degree/evaluation | Product ruling with one mark identifies evaluation with id: each point has one positive preimage, degree +1. Reversing its source orientation would give −1. | Pass. |
| F2.6e adjunction | CP² line: c₁=3=2+1−0. Smooth conic: 6=2+4. Nodal rational cubic: 9=2+9−2·1. Omitting the double-point correction gives 11, not 9. | Pass; exact normal-form source unreadable. |
| F2.6e normal regularity | Normal line degree −1: real index 0, kernel 0, cokernel 0. Degree 0: kernel real dimension 2; evaluation at one point is an isomorphism ℝ²→ℝ². | Pass model cases. |
| F2.6f nonsqueezing | n=1,id,r=R: r≤R is equality. Dilation 2 multiplies ω by 4 and violates symplecticity. n=0 and r≤0 are excluded from the proposed signature. | True test; absent Lean headline, R04. |
| F2.6f mixed wedge | ω₀=e¹²+e³⁴, β=a e¹²+b e³⁴ with a,b>0: ω₀∧β=(a+b)vol>0, β²=2ab vol>0; convex combination has both positive diagonal coefficients. | Pass; same-orientation square condition retained. |
| F2.6g rulings | In S²×S², A²=B²=0,A·B=1,c₁(A)=c₁(B)=2. A+B has square 2 and area 2a, so it is not the minimal ruling class. | Pass. |
| F2.6h equal-area group | Factor swap sends A↔B, preserves equal areas (a,a), and has square id. When areas are (a,b) with a≠b it fails the form-preserving condition. Rotation subgroups preserve each ruling. | Pass; equal-area restriction essential. |
| F2.7 forced disc | L=unit circle in ℂ,u(z)=z: boundary lies in L,u(0)=0≠u(1/2)=1/2,energy π. A constant map has energy 0 and fails nonconstancy. | Pass native headline test. |
| F2.7 forcing exclusion | u_s+i u_t=a and boundary norm≤R give π|a|≤2πR, hence |a|≤2R. Selecting |a|>2R makes endpoint space empty. R=0 cannot contain a nonempty positive-dimensional embedded L. | Pass. |
| F2.7 square completion | u(z)=bar z: half energy π, signed area −π, forcing 2 gives half forcing integral 2π. Identity π=−π+2π holds; replacing signed area by its positive part would give π=2π. | Pass. |
| F2.7 endpoint contradiction | A compact one-manifold boundary has even mod-2 total count. Claimed endpoint counts 1 and 0 would give boundary augmentation 1, whereas exactness gives 0. | Pass; no oriented classification theorem smuggled in. |
| F2.7 periods | Unit circle primitive α=(xdy−ydx)/2 has period π; disc area is π. An exact pulled-back α would have closed-loop period 0, contradicting π>0. | Pass; each component needs its own disc. |
| F3 exact Floer comparison | Zero section of T*S¹ and graph of a small Morse df: two transverse generators, signed circle differential 0; homology ranks 1,1 agree with H*(S¹). | Pass; no noncompact escape theorem inferred from exactness. |
| F3 convention with Fukaya | Replacing H by −H reverses its vector field under the two Hamiltonian conventions: X_(−H)=−X_H. The equation with the opposite convention then has the same perturbation term. | Pass algebraic conversion. |
| F4.A diagram dimension | g=0,b=1 gives k=0,Sym⁰(S²)=point and one empty-product generator. g=2,b=2 gives k=3. Negative k is never created because b≥1. | Pass. |
| F4.B sphere/grading | Singly pointed whole-surface domain: e=2−2g, nx+ny=2g, μ=2; subtracting 2nz with nz=1 gives 0. | Pass. |
| F4.C admissibility | A nonzero all-positive periodic domain violates the mixed-sign weak-admissibility condition in the relevant zero-Chern branch. The zero periodic domain is expressly excluded from that test. | Pass discrimination; no finite count asserted without admissibility. |
| F4.M multipointed index | g=2,b=2,k=3: whole-surface e=−2, nx+ny=6, μ=4=2b; μ−2(nz₁+nz₂)=4−4=0. | Pass. |
| F4.M basepoint addition | S³ with b=1 has raw rank 1; b=2 has raw rank 2=1·dim W. Genus stabilization leaves rank 1, while basepoint addition adds W. | Pass. |
| F4.M local bigon/rectangle | Empty bigon: e=1/2,nx=ny=1/4,μ=1. Empty rectangle: e=0,nx+ny=1,μ=1. Each mod-2 count is 1; a basepoint-containing domain is excluded from hat counts. | Pass model counts; source locator repair R06. |
| F4.4 d² and continuation | A compact index-2 quotient interval has boundary two points; mod-2 count 1+1=0, integral oriented count +1−1=0. An isolated allowed index-1 strip contributes 1. | Pass count mechanism. |
| F4.5 integral/graded versions | U changes relative degree by −2. A sphere addition changes μ by 2 and nz by 1, leaving μ−2nz invariant. Mod 2 forgets orientation signs; integral coefficients do not. | Pass. |
| F5.1 corrected index | g=2,e=1,nx=ny=3/2 with one positive double point: χ=2−3+1+2=2. Embedded formula without the double point gives 0. The Maslov value is e+nx+ny=4 in both corrected routes. | Pass with erratum; naive embedded representative rejected. |
| F5.1 embedded bigon sector | One bigon plus g−1 trivial strips has χ=g,e=1/2. Index g−χ+2e=1, agreeing with μ=1. | Pass. |
| F5.2 end/domain bookkeeping | A cylinder has χ=0 and two ends; a broken pair retains two external ends plus a matched internal pair. Matching removes duplicate asymptotic variables; translation quotient removes one dimension per nonconstant level. | Pass bookkeeping; full compactness source scope separate. |
| F5.3 unordered-fiber map | Degree-two cover w²=z has unordered fiber {sqrt z,−sqrt z}; at z=0 it has multiplicity two. Looping z exchanges ordered roots, while the unordered divisor returns to itself. | Pass; an ordered covering across the diagonal would fail. |
| F5.3 count comparison | A regular unique bigon gives mod-2 count 1 on both cylindrical and symmetric-product sides. Chosen coherent orientation transports +1 to +1; arbitrary independent orientation could instead give −1. | Pass; restricted-J and orientation transport required. |
| F5.4 strands algebra | Two-strand identity has inversion 0; a single crossing has inversion 1, and its resolution has inversion 0. Resolving again gives 0. A concatenation creating a double crossing is zero, not the identity permutation product. | Pass; algebraic construction, not an algorithmic shortcut. |
| F5.4 noncommutative gradings | Maslov central shift λ⁻¹ lowers differential degree once; two shifts give λ⁻². Relative grading torsors have no distinguished zero until refinement data are chosen. | Pass; no unqualified ℤ grading asserted. |
| F5.5 pairing | Genus-zero matched-circle algebra is 𝔽₂; the unit module tensor itself is 𝔽₂, dimension 1. Higher operations of the unit model vanish, leaving the ordinary pairing. | Pass boundary model; does not certify all bordered analytic gluing. |
| F5.6 knot filtration | For a class with nw=0,nz=1, the Alexander difference convention nz−nw gives 1; exchanging the two basepoints gives −1. The doubly pointed unknot has one surviving rank-one hat generator. | Pass. |
| R1 raw/stable comparison | b=2 S³ gives HF⊗W of rank 2, whereas ordinary HF has rank 1. Stable equivalence removes the specified W stabilization, not an arbitrary tensor factor cancellation. | Pass. |
| R1 twisted augmentation | Over R=𝔽₂[t,t⁻¹], multiplication by 1+t is injective and coker=𝔽₂. After augmentation t=1, differential is 0: two surviving generators. Tor₁^R(𝔽₂,𝔽₂)=𝔽₂ supplies the extra class. | Pass; underived coefficient substitution would lose it. |
| R2 completed lattice comparison | A tower completed in U has coefficients 𝔽₂[[U]]; the element Σₙ≥0 Uⁿ exists there but not in 𝔽₂[U]. Reduction modulo U gives 𝔽₂ in both, which cannot identify the uncompleted groups. | Pass negative control for completion. |
| R3 grid/HFK | A grid stabilization's extra W contributes relative bigradings (0,0),(−1,−1); ranks double while the stated stable/reduced comparison accounts for W. An ordinary unknot hat HFK has rank 1, not the unreduced rank 2. | Pass. |
| Lean MorseCriticalAtIndex | f=x² on ℝ: at 0 derivative 0,index 0, so degree-0 generator exists. f=x: derivative 1 everywhere, giving empty generator set and zero Finsupp module. | Correct definitions, unused by a headline. |
| Lean MorseChainModule | One index-0 critical point yields ℤ; empty critical set yields the zero group. No differential is determined by either Finsupp carrier alone. | Padding, R05. |
| Lean scalarCrossingOperator | At log 2 and u=cosh, value 0 as above; at s=0,u(s)=s, value 1−0=1. Thus the operator is not the zero map. | Correct Check; delete from acceptance. |
| Lean scalarCrossingFormalAdjoint | At log 2 and u=sech, value 0; at s=0,u(s)=s, value −1. This distinguishes D* from D. | Correct Check; delete from acceptance. |
| Lean scalarCrossing_cosh / adjoint_sech | At log 2, both asserted values are 0; cosh∉L² and sech∈L², so these identities alone do not prove a Fredholm index. | Padding, R05. |
| Lean pslComplex_t2 | Center of SL₂(ℂ) is {I,−I}, cardinality 2, closed; quotient has Hausdorff topology. In characteristic 2 those representatives would coincide, but coefficients here are ℂ. | Instance proof uses finite center correctly. |
| Lean Darboux signatures | x₀ in dimension 0 forces the chart's single vector value 0 and form value 0; in the standard plane the pulled-back form takes (e₁,e₂) to +1. | Pass signature/degenerate tests. |
| Lean disc/component signatures | Unit circle is connected, so component and global conclusions agree; in a disjoint union of embedded circles, boundary is required in the selected connected component. Empty L is excluded by x₀ or Nonempty. | Pass signature tests. |
| Circle swap definition | S(1,0)=(0,1),S(0,1)=(1,0); S²(1,0)=(1,0). Identity would give (1,0) at the first step. | Correct finite Check. |
| Circle boundary definition/calibration | D(1,0)=(1,−1),D(1,1)=0; I−S has those same values. D²=2D, not 0, which is harmless because D is the single degree-1→0 boundary, not a same-degree differential. | Pass; no square-zero mistake. |
| Klein topBoundary/coordinates | topBoundary(1)=(0,2); class (3,5) maps to (3,1 mod 2), and adding (0,2) gives the same coordinates. Class (0,1) is nonzero of order 2. | Correct Check, not geometric homology theorem. |
| Negative/normal monodromy | det diag(1,−1)=−1; det diag(1,−1,−1)=+1; its square=I. Identity on the negative plane would incorrectly give +1. | One-simp Check. |
| normalForm and preservation | ε=2,v=(1,2,3) gives −1−4+18=13; reflected v=(1,−2,−3) also gives 13. ε=0 gives −5 on both; ε=−1 gives −14 on both, without claiming Morse index 2 in those cases. | Pass for all ε actually quantified. |
| Torus shear definition/apply | P=5,(11,13) maps to (76,13); inverse shear −5 sends it back to (11,13). P=0 gives identity. | Native skewProd wrapper; padding. |
| Torus shear_intertwines | Numeric instance (152,−39)=(152,−39) above; single simp proves the full abstract statement. | Padding, R05. |
| omegaGram/selfDualMatrix definitions | a=1,b=c=0: omegaGram₁₂=1, A₂₁=1, A₁₂=−1, hence A=omegaGramᵀ. Negating only A reverses the compatibility sign. | Correct Check. |
| Four-dimensional norm/square | (a,b,c)=(1,2,2) has sum squares 9: exterior norm²=18, A²=−9I, Aᵀ=−A. At (0,0,0) all matrices and both sides of the general square identity are 0. | Pass. |
| Four-dimensional unit consequences | At (1,0,0), A²=−I,AᵀA=I,omegaGram·A=I. At (2,0,0) those products are −4I,4I,4I, and the unit premise fails. | Pass; finite algebra belongs in Checks. |

The seeded source sample comprised **15 targets**. No additional locator was explicitly labelled “unverified” in the README. The following records what the accessible text actually supports; it does not certify unavailable printed editions by recollection. Source ids below are the stable review fetch keys; the repository manifest was not modified.

| Seeded target | Text opened, locator and outcome |
| --- | --- |
| M.0a Local stable dynamics | `audin-damian` line 1006, Proposition 2.1.5, draft printed p.28, gives open-disc stable/unstable manifolds for its adapted pseudo-gradient setting. Lines 1432–1439, Theorem 2.2.5, give a relative C¹-small pseudo-gradient perturbation with distinct critical values. These do **not** certify all the target's arbitrary C^k field/parameter assertions. Exact locator needed, R06. |
| M.0b Standard metrics | `wehrheim` lines 65–96, Definition 1.1/Remark 1.2, pp.2–3; lines 281–292, Theorem 2.3/Remark 2.4, p.6. Euclidean local data and topological conjugacy are distinguished; smooth evaluation for arbitrary original metrics is not asserted. The target preserves this distinction and rescales the half-quadratic flow correctly. |
| M.1 Parametrized and unparametrized trajectories | `hutchings` lines 290–325, §2.2, pp.9–10: nonconstant translation quotient and dimension/index difference; `audin-damian` lines 2038 onward, Theorem 3.2.2, broken compactness. The p=q constant exception is correctly separated in the target. |
| M.2 Corners and gluing | `wehrheim` lines 281–292, 339–358, 499–517: Theorem 2.3, Theorem 2.6, Corollary 2.9, pp.6–11. Actual chart/gluing compatibility and associative inverse charts are present for Euclidean Morse–Smale pairs. The added comparison with the Fredholm realization needs its own route, rather than being attributed wholesale to this theorem. |
| M.3 Integral orientations and the complex | `hutchings` lines 317–343, §2.2/Theorem 2.1, p.10, fixes quotient/flow/descending order and boundary exponent; the target's exponent differs by 2 and has the same sign. `audin-damian` lines 2310–2345, §3.3, pp.70–71 of the draft, supports signed counts and d²=0 with its own orientation convention. |
| M.4 Integral geometric comparison | `hutchings` lines 436–484 and 512–590, Theorem 3.1, Proposition 3.2 and Lemmas 3.5–3.8, pp.13–17: D,A,F and their chain identities. Footnote 13 expressly leaves smoothness of compactified evaluation unverified. The target's Euclidean-model construction and named integral-current supplier address that gap instead of treating it as proved for every metric. |
| M.6 Bott trajectories and orientation coefficients | `hutchings` lines 1085–1164, §§6.2.1–6.2.3, pp.33–35: dimension, endpoint transversality, nonorientable moduli and negative orientation coefficients. `zhou` lines 3575–3609, §8.1/Propositions 8.2–8.4, p.74, was checked too; Proposition 8.3's printed index is erroneous as recorded below. The target's negative-flow dimension passes the explicit example. |
| M.7 Bott complexes and cascades | `hutchings` lines 1167–1239, §§6.2.4–6.2.5, pp.36–38, gives the geometric complex and examples, but suppresses signs. Its Example 6.4 homology formula was checked against the scanned page and is correct; the index-label typo is below. `banyaga-hurtubise` lines 365–430, Definitions 10–11/Lemma 12, pp.9–11, imposes the stronger pointwise condition and auxiliary transversality. The target explicitly constructs its signs and does not identify weaker component transversality with that stronger hypothesis. |
| M.8 Filtrations and bundle comparison | `hutchings` lines 1286–1337, §6.4, pp.39–41, supports the distinction between index and critical-value filtrations. Lines 1374–1383, §6 exercise 5, p.42, propose the bundle/Serre comparison as an exercise and acknowledge the missing proof. The target plans the adapted horizontal metric and actual filtered comparison, not an unconditional invocation of that exercise. Supplier cycle remains R01. |
| F0.0 Generic Fredholm maps, sections and determinant lines | The exact pinned Fredholm/Sard declarations were opened (below). McDuff–Salamon Appendices A–C could not be read through the legal sources service. Native bounds were checked and are accurately described as quadratic; the claimed sharp external supplier is the R02 gap. The full determinant-family source attribution remains uncertified. |
| F2.6b Simple maps and the quotient | The named AnalyticStableMaps M0.1 text was opened and does plan normalization without using F2.6b. The roadmap cycle is R01. The McDuff–Salamon primary-text simple-map/proper-action locators could not be verified. The simple conic, double line and inverse marked action were checked independently above. |
| F2.6c Energy and compactness | The pinned symplectic carriers and the target's explicit area-gap hypothesis were checked, together with energy and ghost-tree computations. McDuff–Salamon Chapter 4 was not legally readable here. The general compactness proof is therefore not source-certified by this report. |
| F2.6e Four-dimensional curves and regularity | The stated Theorems E.1.1/E.2.1–E.2.4, printed pp.655–663, and proof steps E.5–E.7 could not be opened. Neither Micallef–White nor Hartman–Wintner yielded legal full text. Adjunction and normal-index examples were recomputed; they do not certify the simultaneous branch-normal-form claim. |
| F4.M Balanced multipointed geometry | `oss-stable` lines 3443–3473, Theorems 10.2–10.4, fetched preprint p.91: raw multipointed W factors, nice comparison, and the rational-homology-sphere scope of the stated twisted comparison. `os-disks` lines 864–869, Theorem 3.4, fetched preprint p.22: transverse attaching curves and dense nearly-symmetric paths. These are not interchangeable singly/multiply-pointed statements. The target distinguishes them; attach the exact locators. |
| F5.3 Gluing, counts and symmetric-product comparison | `lipshitz` lines 3993–4008, Proposition 13.2, p.1058; lines 4036–4059, Propositions 13.4–13.7, pp.1059–1060: quasi-nearly-symmetric correspondence, compactness/regularity and mod-2/coherent-orientation comparisons. `lipshitz-erratum` lines 26–39, 86–113, 251–284 and 314–369 was read for corrected index and analytic setup. The target correctly avoids claiming literal correspondence for arbitrary J. |

Also fetched through the service: Mescher, BEHWZ, LOT and its bimodule sequel, Zemke, MOS, OS properties, Perutz, Juhász–Thurston–Zemke and Armstrong–Kempe. Fetching is not theorem verification. Audin–Damian is the author-hosted April 2013 draft; Hutchings is an institutional OCR copy.

Object searches covered the pins, main roadmaps, board packages and supplied sibling heads (`roadmaps grep`, then opening the relevant text). Main shape examples included MorseTheory, DGFloer, GeometricCurrents and CombinatorialHeegaardFloer. The following **22 ownership/contract checks** distinguish a section's existence from support for every extra consumer assertion. “Main” means 9c6e95d; “head” means the supplied new-roadmap checkout.

| Object | Resolved contract and boundary |
| --- | --- |
| Morse inputs | Main `TauCetiRoadmap/MorseTheory/README.md:90`, 124, 611, 649: M1/M2/M5/M6; line 78 assigns trajectory homology to HF. |
| Currents | Main `TauCetiRoadmap/GeometricCurrents/README.md:240`, 406, 477, 523: G2/G3/G4a; orientation-line coefficients are ungraded before HF's Bott shift. |
| Filtered/Serre algebra | Main `TauCetiRoadmap/DGFloer/README.md`, Layer 1 items 2–3; independence at 131–136 does not remove its HF import at 113–120. R01. |
| Return germs | Main `TauCetiRoadmap/MorseNovikov/README.md:292–310`, N5; arbitrary finite-dimensional Y, only local flow. N7 supplies Poincaré–Hopf comparison. R01. |
| Forms/flow/Green/de Rham | Main `TauCetiRoadmap/DifferentialGeometry/README.md:294`, 400, 708, 845–852: 0.4,3.5,5.6.3,8.4–8.5. Sharp Sard is missing at 884: R02. |
| Tubes/topology/splittings | Main `TauCetiRoadmap/GeometricTopology/README.md:218`, 270, 357–377, 744–762. The generic tube, triangulation, Whitney topology and splitting exist as plans; detailed open-revision refinements are not main contracts. |
| Good covers | Head `TauCetiRoadmap/SmoothBundlesConnections/README.md`, B6.0–B6.1, dependency summary 1418–1429. HF's primitive-selection application is additional. |
| Hodge/section topology/projective charts | Main `TauCetiRoadmap/ComplexKahlerGeometry/README.md:570–619`, 718–726, K7.1–K7.2. Boundaryless section topology is R03. |
| Moment-map perfection | Main `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:73–99`, T2; rational perfection is not unconditional integral current-differential vanishing. |
| Sobolev/Hölder/maximum principle | Main `TauCetiRoadmap/PDE/README.md`, Lane A item 7 at 259, Lane C item 13. HF owns bundle/surface and CR adapters. |
| Spectral calculus | Main `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md`, Parts D–E; HF owns spectral flow/index, not another functional calculus. |
| Surface degree | Main `TauCetiRoadmap/FuchsianOrbifolds/README.md:94–99`, Layer 5. Degree-one biholomorphism also exists at the pin. |
| Calibration | Head `TauCetiRoadmap/CalibratedGeometry/README.md:180`, 235, 277: C2/C3/C4, pointwise Hermitian result plus integration/bounding-chain hypotheses. |
| Levi-Civita | Main `TauCetiRoadmap/HopfRinow/README.md`, Layer 1; HF's two-parameter CR adapter is additional. |
| Curvature/immersion | Main `TauCetiRoadmap/RiemannianGeometry/README.md`, R1/R5a; HF's adapted boundary metric is an application. |
| Characteristic classes | Main `TauCetiRoadmap/CharacteristicClasses/README.md`, C2.3/C3: integral Euler/Chern input. |
| Local coefficients/duality | Main `TauCetiRoadmap/AlgebraicTopology/README.md`, Stages 2 and 6: orientation/fundamental-class construction precedes the smooth-degree comparison. |
| DG/A-infinity algebra | Main `TauCetiRoadmap/DGAInfinity/README.md`, Layers 0–4; its integer cohomological grading is not a bordered relative grading set. |
| Combinatorial HF | Main `TauCetiRoadmap/CombinatorialHeegaardFloer/README.md:162`, 213, 240, 250: G/ALG/L/H. Smooth realization and analytic reconciliation belong to HF. |
| Closed-map normalization | Head `TauCetiRoadmap/AnalyticStableMaps/README.md:33–37`, M0–M3. Explicit HF inputs produce R01. |
| Fukaya comparison and sphere ownership | Head `TauCetiRoadmap/FukayaTheory/README.md:13`, 25, 207–215, FK4.2. Hamiltonian sign conversion is explicit. Line 209 imports HF’s marked quotient, although lines 25/215 also claim generic sphere construction. HF is the common analytic owner; retain one construction and have the sibling’s joint-incidence application consume it. |
| ASD determinant applications | Head `TauCetiRoadmap/InstantonFloerTheory/README.md:16`, 63, 71, IF3–IF4. Its cylindrical ASD/gauge/gluing operators differ from the generic determinant package. |

No fully qualified name collision was found among the 34 HF declarations and the relevant main/sibling declarations searched. This does not cure R03's duplicate objects. HamiltonianSystems has no supplied checkout and was absent from the main tree searched: ownership against that open PR was **not checked**, and its design link was not promoted to an established supplier.

The exact library pins were Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following **20 pinned declaration/object checks** are the evidence for the native-carrier and duplication conclusions:

| Pinned declaration/object opened | File and line; what it does and does not supply |
| --- | --- |
| `ContinuousLinearMap.IsFredholm` | `Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean:123`: strictness, closed range, finite kernel/cokernel, complemented kernel. Banach completeness is not magically part of the predicate. |
| `ContinuousLinearMap.FredholmPackage` | Same file, line 178: domain/codomain complements and continuous equivalence on essential parts; no nonlinear moduli construction. |
| `IsFredholm.fredholmPackage` | Same file, line 292: extracts this existing decomposition. |
| `IsFredholm.index_comp` | Same file, line 613: integer composition formula; not a CR index theorem. |
| `IsFredholm.eventually_nhds_index_eq` | `Mathlib/Analysis/Normed/Operator/Fredholm/Open.lean:89`: local operator-norm index constancy with ambient Banach hypotheses. |
| `index_continuousOn_isFredholm` | Same file, line 104: the existing continuous-family index fact. |
| `HomotopyEquiv.toHomologyIso` | `Mathlib/Algebra/Homology/Homotopy.lean:947`: actual chain homotopy equivalence gives homology isomorphism; does not construct the continuation homotopy. |
| `LinearEquiv.skewProd`, `skewProd_apply` | `Mathlib/LinearAlgebra/Prod.lean:800`, 809: the block shear already used by the torus wrapper. |
| Matrix diagonal notation | `Mathlib/LinearAlgebra/Matrix/Notation.lean:431`, 435: `one_fin_two`, `one_fin_three`, used by the exact one-simp padding probe. |
| Fredholm normal-form map/inverse | `TauCeti/Analysis/Fredholm/NormalForm.lean:185`, 283, 354: `normalFormOpenPartialHomeomorph`, reconstruction, finite-order smoothness on the genuine chart domain. |
| `isMeagre_image_criticalPoints_of_isFredholm` and dense complement | `TauCeti/Analysis/Fredholm/SardSmale.lean:468`, 493: open subset, complete models, second-countable source and quadratic kernel bound. The flat supplier `TauCeti/Analysis/Calculus/Sard/OutermostStratum.lean:366` likewise has the squared source-dimension bound. R02. |
| Global regular-parameter theorem | `TauCeti/Analysis/Fredholm/LevelSet/GlobalParametric.lean:83`: fixed-variable Fredholm derivative, total surjectivity, pointwise regularity on the level set and quadratic kernel bound. |
| `SmoothTwoForm.IsNondegenerate` | `TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean:68`: every tangent bilinear form is algebraically nondegenerate. It includes neither closedness nor compactness. |
| `SmoothTwoForm.IsSymplectic` | Same file, line 92: closedness plus that nondegeneracy; no T2/compactness assertion. This is the actual Darboux carrier. |
| `SmoothEmbedding` / `tangentRange` | `TauCeti/Geometry/Manifold/SmoothEmbedding/Basic.lean:68`; `NormalSpace.lean:43`: native smooth embedding and derivative range, with n≠0 in the range API. Quotient normal space alone is not a tube theorem. |
| Native projective-line action | `TauCeti/Topology/Compactification/OnePoint/ProjectiveLine.lean:205`: pretransitive action; it is not the ordered-triple sharp-transitivity target. |
| Symplectic basis and parity | `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean:309`, 317: even dimension and prescribed-vector symplectic basis. HF must transport this basis, not rebuild the algebraic classification. |
| Standard symplectic form | `TauCeti/Geometry/Symplectic/StandardCompatible.lean:83`: the native product model. The basis order gives the +1 comparison tested above. |
| Maslov index, automorphism and product rules | `TauCeti/LinearAlgebra/TotallyReal/Maslov/Index.lean:103`, `Map.lean:61`, `Prod.lean:183`: integer loop index, change by twice determinant winding, and additive product. No duplicate loop invariant is needed. |
| `RiemannSurface.biholomorphOfDegreeEqOne` | `TauCeti/Analysis/Complex/RiemannSurface/Degree.lean:442`: finite holomorphic map of degree one, in its compact connected Riemann-surface setting, yields the biholomorphism. It does not construct a missing normalization atlas. |

## Not verifiable

- **McDuff–Salamon (2012), Appendices A–C, Chapters 2–4 and Appendix E.** Publisher lookup yielded no text; the author's ETH `jholn.pdf` returned HTTP 403. F0.0/F2.6b,c,e source claims, especially E.1.1/E.2.1–4 and E.5–7, pp.655–694, remain uncertified. No first-edition numbering was substituted.
- **Micallef–White (1995), pp.35–85, and Hartman–Wintner (1953), pp.449–476.** DOI/JSTOR and alternative searches yielded no legal full text. The branch-coordinate and elliptic-expansion claims were not guessed.
- **Schwarz (1993).** Search failed with network/rate-limit errors. **Audin–Damian (2014)** was read only in its author-hosted 2013 draft; printed-edition pagination was not certified.
- **Oh (2015), I–II.** Publisher result only, no full text. **Robbin–Salamon spectral flow (1995):** DOI/Wiley HTTP 403 and search rate limit. The separate **Maslov index for paths (1993)** was classified paywalled/uncertified and not requested again.
- **Introduction to Symplectic Topology, §3.2.** Edition unspecified in the target; publisher lookup failed. **Kronheimer–Mrowka (2007):** publisher result only; context, not a mathematical premise here.
- **damian_formalizare.** Service did not accept the repository URL as a text source; no Lean portability claim is certified. Armstrong–Kempe was fetched, but the “~56k lines … weeks” claim was not audited against a versioned code snapshot.
- **HamiltonianSystems:** no supplied checkout; ownership against that open PR was not checked. Detailed GT normal-tube refinements in an open revision were not assumed to be main-branch contracts.

All unavailable texts were consolidated in the scratch missing-reference request. This completed review is not parked; no unreadable source is certified. No PR file, manifest, library pin or merge-order file was changed.

## Source issues

- **Error** in zhou at Proposition 8.3, printed p.74: the source says the positive-gradient parametrized index is dⱼ−dᵢ+cᵢ+cⱼ; it should be dⱼ−dᵢ+cⱼ with d the negative normal rank; affects a stated result.
- **Gap** in hutchings at Proposition 3.2 and footnote 13, printed p.14: the source says compactified descending evaluation is smooth for the stated Morse–Smale data, while explicitly leaving this unchecked; it should be justified with compatible smooth compactification hypotheses, as in Euclidean local models; affects the proof.
- **Misprint** in hutchings at Example 6.4, printed p.37: the source says the isolated upper critical point in the differential formula is m₁; it should be m₂, the index-two point introduced in that example; affects nothing.
- **Error** in hutchings at §6.3, printed p.39: the source says one can choose an invariant generic metric for a Hamiltonian circle action; it should be an additional hypothesis, since the invariant exceptional-sphere equal-index connection obstructs Morse–Smale transversality; affects the proof.
- **Gap** in lipshitz at Lemma 4.1 and Proposition 4.2, printed pp.975–976 and 978: the source says the required positive domains have the embedded representatives used in the Euler-characteristic argument; it should be an immersed-representative argument retaining signed double-point corrections; affects the proof.
- **Misprint** in lipshitz at Condition J4, printed p.959: the source says J sends the t-direction to the s-direction; it should be J sending the s-direction to the t-direction; affects a stated result.
- **Gap** in lipshitz at Definition 3.5 and Proposition 3.7, printed pp.968–969: the source says the mapping space into the target with boundary is a Banach manifold; it should be constructed in the extended target Σ×ℝ², with the solution-image restriction proved afterwards; affects the proof.
- **Error** in lipshitz at §3, Proposition 3.8, printed pp.970–972: the source says to vary over all source complex structures in the universal-moduli argument; it should be the finite-dimensional moduli of source complex structures, removing reparametrization redundancy; affects the proof.
- **Error** in lipshitz at §14.2, printed p.1071: the source says the two-form built from df, dg and the Hodge star is closed for the chosen Morse function; it should be constructed with harmonic f on the twice-punctured three-manifold; affects the proof.
- **Misprint** in lipshitz-erratum at proof of Proposition 4.8′, printed p.9: the source says the required immersed map comes from Lemma 4.8′; it should be Lemma 4.9′; affects nothing.
