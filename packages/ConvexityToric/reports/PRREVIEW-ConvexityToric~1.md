# Review of ConvexityToric (pull request #1651 at 80fe935)
Folder: `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/`

**Verdict:** needs changes

:robot: AI review. Twelve findings, six blocking (three P1 and three P2). This is a review of the whole folder, including inherited statements, against the supplied acceptance contract. No pull-request file was changed. In locations below, `README.md` and the three Lean basenames refer to this folder unless another repository-relative path is given.

## R01 (P1) — A rank-zero toric fixed point is an interior point

**Location:** `README.md:326–328`: “Fixed points correspond exactly to vertices and never interior points.”

**Claim:** Every symplectic toric manifold has no fixed point over the interior of its moment polytope.

**Witness:** Take M a point and T the trivial torus. Both dimensions are zero; the action is effective. The moment image is the singleton in the zero vector space: its interior and its vertices are both that singleton.

**Repair:** Keep the classification in all dimensions. Qualify only the exclusion from the interior by `dim T > 0`, and add the zero-dimensional point as a negative-control Check. Tested repair: rank zero retains its single fixed vertex/interior point; for the standard circle action on a sphere, only the two endpoints are fixed and neither belongs to the interval's interior.

## R02 (P1) — The DH acceptance theorem depends on admitted measure data

**Location:** `Suggested.lean:95–104`, `110–136`: `def liouvilleMeasure ... := by sorry`.

**Claim:** The admitted function denotes the measure determined by the symplectic density, and `dh_absolutelyContinuous` tests its pushforward.

**Witness:** No defining equation constrains the admitted measure. Replacing its body by the zero measure makes the DH conclusion automatic, while on the unit square with `dx∧dy` the intended mass is 1, not 0.

**Repair:** Remove the admitted data definition and every declaration depending on it from the acceptance file. Name Liouville/DH and the missing measure construction in the module docstring until a genuine pinned construction is usable; consume the owner identified in R04. Do not replace it with an arbitrary measure parameter. The repaired contract must distinguish unit-square mass 1 from zero and mass 2 after doubling the form. This is the worker's `sorry-data=1` gate failure.

## R03 (P1) — The cited LieGroups layer does not supply the calibrated rank-one map

**Location:** `README.md:34–48`: “consume Layer6's normalization `dφ_α(diag(i,−i))=α∨`”.

**Claim:** LieGroups Layer 6 supplies actual compact root characters, normalized coroots and realized rank-one maps with this derivative identity.

**Witness:** On main, `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:383–405` specifies maximal tori, conjugacy, Weyl groups and Weyl integration. It does not state this SU(2) map or calibration. The full main file likewise lacks the displayed normalization.

**Repair:** State a precise declared supplier gap, naming the normalized homomorphism, character convention, derivative identity and compact-connected hypotheses, with the same slug in the design and README; alternatively own the missing comparison here without rebuilding the supplier's existing torus theory. An open revision of an existing roadmap cannot replace its main contract. Calibration test: for SU(2), H=diag(i,−i) has root value 2, exp(2πH)=1, and the identity homomorphism has derivative H. The actual map, not just those numerical identities, must be supplied. No gap is declared in this package.

## R04 (P2) — Liouville measure has two declared owners

**Location:** `README.md:281–285`: “This is the single owner consumed by integrable systems and quantization.”

**Claim:** T4 constructs the measure from a smooth symplectic density as its unique owner.

**Witness:** `TauCetiRoadmap/SmoothBundlesConnections/README.md:776–800` on main already constructs measures from smooth positive densities and explicitly their Liouville specialization, with the same integral comparison and local finiteness.

**Repair:** Consume SmoothBundlesConnections B2.4 for that construction, and keep the Hamiltonian invariance, reduction and DH applications here. State any missing normalization comparison as a comparison target, not a second measure constructor. The overlap is exact on `dx∧dy` and `2dx∧dy`: B2.4's Checks give Lebesgue measure and twice Lebesgue measure, respectively. This does not require replacing Liouville measure by an unrelated Riemannian volume.

## R05 (P2) — The acceptance file omits statable headline theorems

**Location:** `README.md:182–187`, `243–246`; `Suggested.lean:11–15`, `123–161`.

**Claim:** The acceptance file should test the promised Schur–Horn theorem and the exact Bott–Samelson moment image, alongside other statable headlines.

**Witness:** A full all-n Schur–Horn signature using `Matrix.unitaryGroup`, conjugation of `Matrix.diagonal`, and `convexHull` elaborated with only `import Mathlib`. It is absent. The two polygon signatures already elaborate in the companion but are absent from `Suggested.lean`.

**Repair:** Put these statable headline signatures and only their necessary definitions in `Suggested.lean`. Inventory the other headlines in its docstring, stating each unavailable carrier precisely instead of describing the file merely as nonexhaustive. Schur–Horn must include repeated eigenvalues and n=0. The probe's statement equates the diagonals of all unitary conjugates of diag(λ) with the convex hull of all permutations of λ. Tests: λ=(2,0) gives `(2t,2−2t)` for 0≤t≤1; λ=(1,1) gives only `(1,1)`; the empty spectrum gives the unique empty tuple. No weakened substitute is needed.

## R06 (P2) — Generic orbifold classifying maps are redeclared outside their owner

**Location:** `Suggested.lean:27–52`: `orbifoldNerveSingularDiagonal`, `orbifoldClassifyingSpace`, `orbifoldNerveCoarseSimplicialMap`, `orbifoldCoarseMap`.

**Claim:** These generic constructions belong in this roadmap's acceptance test.

**Witness:** `TauCetiRoadmap/Orbifolds/README.md:507–525` on main already owns the diagonal singular model and its coarse map through the realization counit. None of the four definitions occurs in either headline theorem in `Suggested.lean`.

**Repair:** Delete these four definitions from this acceptance file and cite Orbifolds O4-T for the generic construction. Retain T4's specialization to the actual Hamiltonian level bundle. On the unit groupoid of a point both constructions give a point and the identity coarse map; on a finite isotropy group they retain BG, not just its coarse point. There is no distinct ConvexityToric construction to justify a second owner.

## R07 (P3) — All three Lean files violate the import contract

**Location:** `Suggested.lean:1–9`; `BottSamelsonMomentTargets.lean:1–4`; `FixedLocusTargets.lean:1–4`.

**Claim:** Acceptance files import the pinned libraries directly.

**Witness:** Suggested imports another roadmap and seven Mathlib submodules, without `import Mathlib`. Both companions also use only Mathlib subimports. These account for the gate's `imports=1`, `mathlib-subimports=7`, and `no-import-mathlib=1` failures.

**Repair:** Start each retained file with the single `import Mathlib`, followed only by individual pinned Tau Ceti modules actually used. Replace the roadmap import with native predicates or the few permitted real definitions needed by retained headlines; do not copy the supplier's API wholesale. Re-elaborate. The independent Schur–Horn probe demonstrates that this import form supports that missing headline. The current successful build does not waive these three failed rules.

## R08 (P3) — Remove the companion's option override

**Location:** `BottSamelsonMomentTargets.lean:11`: `set_option autoImplicit false`.

**Claim:** The companion is an acceptance file under the same no-option rule as Suggested.

**Witness:** This is a `set_option`, although the worker's scan of Suggested alone reported `set_option=0`. Removing it in a scratch copy preserves successful elaboration and all printed signatures.

**Repair:** Delete the line. The repair was tested under default options, with only the two expected `sorry` warnings.

## R09 (P3) — Invariant-subspace stability is padding

**Location:** `FixedLocusTargets.lean:18–21`: `invariants_stable`.

**Claim:** Stability under a commuting endomorphism is a headline acceptance theorem.

**Witness:** The unchanged signature closed with `exact fun v hv k => (hcomm k v).trans (congrArg J (hv k))`. Membership in `Representation.invariants` is exactly the pointwise fixed-vector equation at the pin.

**Repair:** Delete it from `Suggested.lean`/the companion acceptance material; keep the fact in the README's API, rather than proving it in place. Tested on trivial, cyclic and S₃ actions: in every case `ρ(k)Jv=Jρ(k)v=Jv` is the same direct calculation. The other two fixed-locus signatures are intermediate linear/chart statements; they do not replace a statement of the full geometric headline or an explicit missing-carrier explanation.

## R10 (P3) — Restore the required roadmap and declaration shape

**Location:** `README.md:1–32`, `334–353`; `Suggested.lean:57–85`; module docstrings in all three Lean files.

**Claim:** Definitions, API, Checks, dependencies and acceptance signatures can be located and matched without guessing.

**Witness:** There are no `*Needs:*` lines or `**Checks.**` lists in the README. The facet-presentation definitions have no three discriminating Checks. Its title/section structure omits the required scope, supplier-contract and layer sections; most local Lean declaration names are absent from the README.

**Repair:** Supply the requested prose structure, per-definition API and at least three discriminating Checks, target-specific dependencies, and Examples/Dependencies endings. Give retained declarations mathematical docstrings and name them in the README; record the headline inventory in the module docstring. Concrete facet Checks: the primitive-normal interval passes; the same interval presented with normals ±2 fails the basis condition; a duplicate facet fails irredundancy; the rank-zero empty-facet presentation passes. These tests separate the intended predicate from plausible weaker predicates.

## R11 (P3) — Sources lack a manifest and claim-level locators

**Location:** `README.md:200–213`, `274–277`, `402–422`.

**Claim:** The source sample and each theorem can be verified at an exact, versioned locator.

**Witness:** There is no `sources.toml`. The projector sum is in Escobar §3.2, p. 8 (escobar lines 301–314), while the README points to §§3.3/4.1. “Knutson semester2 p72” does not identify an obtainable text. Most T1–T5 theorems only inherit a bibliography.

**Repair:** Add one manifest entry per work, including legal provenance or uncertified status, and attach exact locators to the claims. For the sample cite Escobar §3.2 p. 8 and §4.1 pp. 12–13, separately identifying the roadmap's own weighted/sign calculations; cite Cannas Theorem 27.1, p. 169, for the convex-hull input. Identify the Knutson edition/file before certifying pages 72–73. Recheck the rank-one value −2 and the `(1,1,1)` polygon against those explicit conventions. This review has not invented a theorem number for an unnumbered construction.

## R12 (P3) — Replace process-dependent supplier references

**Location:** `README.md:20–24`, `111`, `191`, `201`, `292`.

**Claim:** The roadmap is a timeless specification citing named supplier sections.

**Witness:** Supplier links target numbered pull requests, and line 201 asks to preserve unclear diagram/arrow labels. That instruction supplies neither a mathematical object nor a stable source locator.

**Repair:** Link the named roadmap and section on its allowed main/new-roadmap contract. Remove the diagram-preservation instruction, or identify a specific diagram mathematically with a source locator. Keep the already explicit triple `(L₁,P,L)` and projection `(L₁,P,L)↦(L,P)`; these specify the same incidence test without relying on unread labels.

## Verified sound

The checks below separate computed evidence from unresolved contracts. “Pass” records the displayed instances and the stated mathematical argument; it is not a claim that an admitted theorem has been formally proved.

**Scope, gate and elaboration.** Verified HEAD `80fe935cb9eacece16f1b0d9c58829348b84c553` and the pins Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The prescribed outside-folder diff was empty. The worktree remained clean. The worker's targeted build passed (`build=0`), but its overall gate is FAIL: `sorry-data=1 imports=1 mathlib-subimports=7 no-import-mathlib=1`; every other recorded counter is zero. R02/R07 cover all four failed rules. The companion option in R08 is an additional manual finding.

Ran the requested `lake env lean` on the absolute Suggested path from the PR worktree: exit 0, three `sorry` warnings only. Created scratch copies and appended `#check @name` for all **23 explicit declarations** (13 Suggested, 7 Bott–Samelson, 3 fixed-locus). All elaborated. Suggested's two theorem signatures retain finite dimensionality, compactness/connectedness of both spaces, the Borel conditions, the boundaryless M hypothesis and effectiveness. `toricImage_delzant` retains the period, derivative and dimension hypotheses. No dropped load-bearing binder was found. The measure definition itself remains disallowed under R02. The companion signatures retain all positivity, incidence, commutation, invariant-domain and chart-membership hypotheses. No source file was edited.

Probed all **seven admitted theorems** with the elementary tactics `simp`, `rfl`, `infer_instance`, plus the direct `exact` proof of invariant stability. Six did not close with those elementary tactics; invariant stability did. The two polygon theorems require geometric convexity/finite convex geometry, the two main targets require their advertised geometry, and the other two fixed-locus results require positivity or chart injectivity, respectively. No pinned one-lemma replacement for those six was located by the object searches. Also elaborated a full Schur–Horn signature with `import Mathlib`, and a Bott–Samelson copy with the option override removed. No Lean process was left running.

**Headline inventory.** T1: integral period/character/rank-one normalization; invariant-metric fixed loci and equivariant local forms. T2: moment-component Morse–Bott topology, rational perfection and the stated integral consequences. T3: torus convexity/connected fibers; Kirwan chamber convexity; norm-square gradient convergence/retraction; Kostant projection/Schur–Horn; the word121 moment image and its boundary comparison. T4: Liouville construction/invariance; DH absolute continuity, chamberwise polynomial density and reduced-class variation. T5: toric fibers and Delzant necessity/existence/uniqueness; integral toric cohomology/class formula; weighted reductions and labeled-orbifold classification. Suggested presently states only DH absolute continuity and Delzant necessity, the former through admitted data. The polygon signatures are in a companion. The docstrings do not give the required list of nonstatable headlines; R05 addresses that acceptance gap. No claim is made that all geometric headlines can be expressed by only a few definitions at these pins.

**Seeded source sample.** Read the legal published Escobar PDF, *Electronic Journal of Combinatorics* 23(2), P2.25 (2016), rather than assuming preprint numbering. The projector expression is the unnumbered construction in §3.2, p. 8, **escobar lines 301–314**. The coadjoint-orbit/product embedding argument is the unnumbered construction in §4.1, p. 12, **escobar lines 439–475**. It supports restriction of a torus moment map to the Bott–Samelson embedding and the fixed-point convex hull. It does not state this roadmap's arbitrary positive weights, the −2π calibration, or its six inequalities: those were checked directly below. The SL₃ versus U₃ central shift changes an affine trace coordinate, not the effective polygon; no ambient U₃ action on the fixed-P₀ incidence variety is needed.

For “Fixed points and exact image,” also read **cannas lines 6470–6479**, Theorem 27.1, printed p. 169 (physical PDF p. 177). Its hypotheses are a compact connected symplectic manifold and a Hamiltonian torus action; effectiveness is unnecessary. They fit positive a,b,c and the supplied smooth projective incidence manifold. This theorem supplies the convex hull and connected fibers, not the explicit weighted inequalities. All eight coordinate flags were enumerated, and both inclusions in the polygon description were checked by its vertex description. No theorem number is attached to the unnumbered Escobar construction.

Read **cannas lines 6630–6662**, Homework 21, exercise 2, printed p. 174 (physical p. 182). The exercise treats subgroups of a Hamiltonian torus on compact M. Its invariant-J/exponential argument supports the method cited by T1.1; the general arbitrary-group preserved-metric theorem is the roadmap's extension, whose local proof works without averaging or completeness. Read **lerman-gradient lines 117–135, 140–175, 222–247**, arXiv math/0410568v2, Theorem 1.1, p. 3, and its proof, for proper moment maps, local gradient estimates and retraction. Read **hnp lines 425–451, 498–549**, Theorem 3.4, pp. 132–133, and Theorem 4.1, p. 134, for properness, local fiber connectedness and the local-to-global argument. Source errors discovered in these readings are recorded below, separately from roadmap findings.

**Adversarial values.** Coordinates e₁,e₂,e₃ are one-based in the prose and 0,1,2 in Lean. Write P for an orthogonal projector, S=a+2b+c, and J₀(q,p)=(-p,q). Each row identifies its target; rows for API families expose the individual values rather than just saying “checked.”

| ID / statement | Instances tried | Values on the two sides | Result / change |
| --- | --- | --- | --- |
| A01 T1 torus period and weight definition | Circle; trivial torus | ker(exp)=2πℤ, Λ=ℤ, χₖ derivative=ik; in rank 0 all three are zero | Pass; use supplier gap R03 for general calibration |
| A02 character integral pairing | k=−2, λ=6π | αχ(λ)/(2π)=−6, an integer; on Λ, αχ(3)=−6 | Pass |
| A03 weight-lattice Haar normalization | Circle; basis 1 versus 2 | covolume ℤ=1; interval [0,1] has mass 1; basis 2 gives mass 1 to [0,2] | Pass; a basis choice changes normalized Haar as expected |
| A04 restriction/quotient/basis change | T², character (2,−1), diagonal circle | restriction weight 1; quotient character (1,−1) restricts to 0; swapping basis sends (2,−1) to (−1,2) | Pass |
| A05 coroot/rank-one normalization | SU₂ diagonal H | α(H)=2, d(id)(H)=H, exp(2πH)=I | Numeric calibration passes; missing contract R03 |
| A06 central isogeny lattice index | U₂ diagonal torus | center and coroot vectors (1,1),(1,−1) have determinant −2; index in ℤ² is 2 | Pass; a direct integral splitting would give index 1 |
| A07 fixed-set definition, closedness, tangent | Irrational rotation on first factor of ℂ² | fixed points and fixed tangent vectors both `{0}×ℂ`; real dimension 2 | Pass |
| A08 fixed components may have different dimensions | Circle on ℂP² with weights (0,0,1) | fixed set ℂP¹ disjoint union a point; dimensions 2 and 0 | Pass |
| A09 arbitrary-group fixed locus | S₃ permutes ℂ³; cyclic 3-cycle | common invariants in either case are `(z,z,z)`; restricted standard form is 3 dx∧dy | Pass; nonabelian and cyclic cases |
| A10 metric hypothesis negative control | Shear A=[[1,1],[0,1]] | fixed line p=0 has restricted form 0; AᵀQA=Q forces Q₁₁=0, contradicting positivity | Pass; shear excluded |
| A11 polar A,J definition | Standard metric, ω=dx∧dy; 2ω | A=J₀ or 2J₀; J=A(−A²)⁻¹/²=J₀ in both cases; J²=−I | Pass; unnormalized A fails for 2ω |
| A12 positivity and K invariance of J | v=(1,2); rotations | ω(v,J₀v)=5>0; RJ₀v=J₀Rv; replacing J₀ by −J₀ gives −5 | Pass |
| A13 fixed restriction, normal, naturality | ℂ² rotating first coordinate | tangent second ℂ, symplectic normal first ℂ; restriction dx₂∧dy₂ and direct-sum form match | Pass |
| A14 exponential chart and total geodesy | Euclidean rotation, exp₀(v)=v | fixed vectors map identically to fixed points; a straight geodesic in fixed plane stays there | Pass; no completeness used locally |
| A15 compact averaging and relative normal form | Finite rotations; zero section in product normal bundle | averaged Euclidean metric stays I; product symplectic chart is identity with pullback ω=ω | Pass on model; full equivariant Moser remains a target |
| A16 `invariants_stable` | Trivial representation; S₃ example | ρ(k)Jv=Jρ(k)v=Jv | Pass; padding R09 |
| A17 `invariants_symplectic` | Fixed diagonal ℂ; zero space | matrix of restriction [[0,3],[−3,0]], determinant 9; in zero space radical={0} | Pass |
| A18 alternating/positivity laws discriminate wrong models | ω=0 on ℝ²; J=−J₀; J=2J₀ | positivity gives 0 or −‖v‖² in first two, failing; last gives 2‖v‖² and nondegeneracy despite J²=−4I | Pass; hJ is stronger than this intermediate lemma needs |
| A19 `fixed_iff_chart_invariant`, both directions | Identity chart on unit ball, rotations | origin: both true; nonzero rotated vector: both false; e injective converts equality back to ρ(k)v=v | Pass; source membership retained |
| A20 local weight/moment formula | Weight +1 and weight −1 on ℂ | X=(-p,q) contracts dq∧dp to −q dq−p dp=d(−r²/2); reversed action gives +d(r²/2) | Pass; local cone understood as a germ |
| A21 index/coindex and zero weights | Weights (+1,−1,0), ξ=1 | Hessian diag(−1,−1,1,1,0,0); index=2, coindex=2, fixed tangent dimension=2 | Pass |
| A22 stabilizer, orbit rank, slice | Weight k on nonzero ℂ; torus T² acting only first factor | stabilizer μₖ, orbit rank 1; ineffective second torus has rank 0 action | Pass; slice retains stabilizer directions |
| A23 generic versus arbitrary moment component | Sphere; trivial ξ; irrational ξ in T² | generic sphere height has two critical points; ξ=0 has Crit=M; irrational closure is T², not an embedded line subgroup | Pass |
| A24 even-index scalar-level connectedness | Sphere height h∈[−1,1] | interior fibers S¹; endpoint fibers points; outside fibers empty, all connected as sets | Pass |
| A25 rational Morse–Bott perfection | S²×Σ_g, rotation on S² | critical components two Σ_g; Poincaré polynomial `(1+t²)(1+2gt+t²)` equals their shifted sum | Pass; π₁=π₁Σ_g prevents isolated-point conclusions |
| A26 universal torus class convention | Standard/dual Hopf character; weight 2χ | standard class −h, dual +h, weight 2 gives −2h | Pass against CC and SBC |
| A27 Borel, Thom/Euler, localization | Point; complex weight-one line | H*_T(pt;ℤ)=ℤ[u]; Euler=u=−h; after inverting u, multiplication by u is invertible | Pass on basic model |
| A28 integral formality with free/even hypothesis | S²; point | ranks over H*(BT) are 2 and 1; Hodd=0 in both | Pass |
| A29 isolated fixed points, counts and π₁ | ℂP² generic height; point | indices 0,2,4, Betti numbers 1,1,1, π₁=0; point has one index-0 extremum | Pass |
| A30 coadjoint root-height isolation | SU₂ orbit with nonzero radius; central orbit | Weyl fixed set has 2 points; central orbit has 1; repeated-eigenvalue tangent root planes disappear | Pass |
| A31 torus convexity and connected fibers | Standard S²; trivial action on connected M | image [−1,1]=conv{−1,1}; trivial image {c}=conv{c}, fiber M | Pass; disconnected two spheres would violate fiber assertion |
| A32 fixed components rather than fixed points | S²×Σ_g | fixed set two Σ_g, fixed images two endpoints; hull is entire interval | Pass |
| A33 product, shift and subtorus restriction | Two height spheres; diagonal subcircle; shift b | square [−1,1]², diagonal-circle image [−2,2], translated square b+[−1,1]² | Pass |
| A34 effective affine dimension | Effective circle on S²; extra trivial circle | dimensions of moment images 1 and 1, torus dimensions 1 and 2 | Pass; full dimension requires effectiveness |
| A35 isotropic orbits and regular reduction | Standard T² on ℂ² at positive radii | orbit dimension 2, ω restricts to 0, level dimension 2, reduced dimension 4−4=0 | Pass |
| A36 Kirwan chamber image and fibers | SU₂ coadjoint sphere radius r>0 | full image sphere, nonconvex; chamber intersection {r}, orbit-projected fiber whole sphere connected | Pass; commutator directions matter |
| A37 central factor in chamber | U₂ orbit eigenvalues (3,1) | central coordinate fixed at trace 4, semisimple chamber coordinate 1; both give singleton chamber image | Pass |
| A38 symplectic cross-section | SU₂ sphere away from zero chamber wall | cross-section at positive chamber is one point; centralizer is circle, same moment value r | Pass on model |
| A39 norm-square polynomial and gradient inequality | One complex slice, f=r⁴/4 | ‖∇f‖=r³=4^(3/4) f^(3/4); exponent lies in (0,1) | Pass |
| A40 gradient tail and limiting retraction | Same slice, r′=−r³ | total remaining length=r₀; bound f₀^(1/4)/(4^(3/4)/4)=r₀; limit=0 | Pass; constant f has stationary trajectories and tail 0 |
| A41 Kostant compact projection | SU₂ sphere; central point | torus projection [−r,r]=conv{−r,r}; central projection {c}=conv{c} | Pass |
| A42 Schur–Horn both directions and majorization | Spectrum (2,0), diagonal (2t,2−2t) | trace=2; largest diagonal≤2 iff 0≤t≤1; matrix [[2t,2√(t(1−t))],[2√(t(1−t)),2−2t]] has trace 2, determinant 0 | Pass; missing headline R05 |
| A43 repeated/empty spectra and rank-one simplex | (1,1), empty λ, rank-one projector in ℂ³ | orbit diagonal singleton (1,1); empty tuple singleton; projector diagonal nonnegative with sum 1 | Pass |
| A44 incidence carrier and π | P≠P₀; P=P₀ | unique L₁=P∩P₀ in first case; all L₁∈ℂP¹ in second; π fibers point or ℂP¹ | Pass; supplied carrier used, not reconstructed |
| A45 torus preservation versus ambient U₃ | Diagonal t; unitary swapping e₂,e₃ | tP₀=P₀; swap sends P₀=12 to 13 | Pass; no full U₃ action on X |
| A46 `V3`, `initialPlane` | e₁,e₂,e₃; zero vector | dimensions 3 and 2; e₁,e₂,0 lie in P₀, e₃ does not | Pass |
| A47 `projectorDiagonal` definition | U=0, U=ℂ³, span(e₁+e₂) | diagonal (0,0,0), (1,1,1), (1/2,1/2,0); traces 0,3,1 | Pass; zero map would fail last two |
| A48 projector chart/orbit comparison | L(z)=span(1,z), z=0,1 | P(0)=diag(1,0); P(1)=1/2[[1,1],[1,1]]; P²=P in both | Pass; denominator 1+|z|²>0 |
| A49 KKS versus Fubini–Study sample | ξ=[[0,−1],[1,0]], η=[[0,i],[i,0]], P=diag(1,0) | −i tr(P[ξ,η])=−2; ω_FS(∂x,∂y)=1/π, so −2πω_FS=−2 | Pass; sign and 2π factor fixed |
| A50 rank-two Plücker comparison | Plane span(e₁,e₂+z e₃) | varying projector block has same −2 at z=0; Plücker line has ω_FS=1/π there | Pass |
| A51 weighted product form | a=b=c=1, nonzero holomorphic tangent | −ω(v,iv)=2π(sum of positive factor squared norms)>0; all zero weights give form 0 | Pass; positive weights prevent degeneracy |
| A52 `moment` contraction and trace | Coordinate flag row 1; variation rotating first line | μ=(a+b+c,b,0), trace=a+2b+c; contraction is weighted sum of the three factor differentials | Pass; no independent ambient action asserted |
| A53 torus kernel and effective dimension | All diagonal scalars; phases (1,−1,1) | scalars fix every subspace; latter moves span(e₁+e₂); effective dimension 3−1=2 | Pass; all mixed lines force all phases equal |
| A54 negative-form convention | Replace ω by −ω | contraction and μ both change sign; sample vertex (3,1,0) becomes (−3,−1,0) | Pass |
| A55 eight fixed flags, exhaustive enumeration | L₁=e₁ or e₂; coordinate P containing it; L coordinate in P | 2×2×2=8 flags; L₁=e₃ fails incidence | Pass |
| A56 `fixedMoment`, row 1 | (e₁,12,e₁) | projector sum=(a+b+c,b,0), exactly listed | Pass |
| A57 `fixedMoment`, row 2 | (e₁,12,e₂) | projector sum=(a+b,b+c,0), exactly listed | Pass |
| A58 `fixedMoment`, row 3 | (e₁,13,e₁) | projector sum=(a+b+c,0,b), exactly listed | Pass |
| A59 `fixedMoment`, row 4 | (e₁,13,e₃) | projector sum=(a+b,0,b+c), exactly listed | Pass |
| A60 `fixedMoment`, row 5 | (e₂,12,e₁) | projector sum=(b+c,a+b,0), exactly listed | Pass |
| A61 `fixedMoment`, row 6 | (e₂,12,e₂) | projector sum=(b,a+b+c,0), exactly listed | Pass |
| A62 `fixedMoment`, row 7 | (e₂,23,e₂) | projector sum=(0,a+b+c,b), exactly listed | Pass |
| A63 `fixedMoment`, row 8 | (e₂,23,e₃) | projector sum=(0,a+b,b+c), exactly listed | Pass |
| A64 `incidence_moment_range` | All weights 1; L₁=(e₁+e₂)/√2, P=span(L₁,e₃), L=e₃ | μ=(1,1,2), midpoint of rows 4 and 8; coordinate flags give all six hull vertices | Pass on instances; general equality uses T3, compactness and symplecticity |
| A65 `fixedMoment_convexHull`, both inclusions | Weights (1,1,1) | box/trace vertices `(3,1,0),(3,0,1),(2,0,2),(0,2,2),(0,3,1),(1,3,0)` equal six fixed rows; all eight rows satisfy bounds | Pass; exact rational vertex enumeration |
| A66 exact inequalities, unequal weights | (a,b,c)=(2,1,3) | S=7; bounds (6,6,4); vertices `(6,1,0),(6,0,1),(3,0,4),(0,3,4),(0,6,1),(1,6,0)` on both descriptions | Pass |
| A67 exact inequalities, fractional weights | (1/2,3/2,2) | S=11/2; bounds (4,4,7/2); vertices `(4,3/2,0),(4,0,3/2),(2,0,7/2),(0,2,7/2),(0,4,3/2),(3/2,4,0)` on both descriptions | Pass |
| A68 strict edge coefficients and collision | (1,1,1); (2,1,3); fractional case | row-6 coefficients (1/2,1/2), (3/5,2/5), (4/5,1/5); denominators a+c positive; distinct images 7,8,8 | Pass; rows 2/5 collide iff a=c |
| A69 six facets/extreme points and complexity | All positive weights | every pair of adjacent listed vertices shares one saturated bound; edge lengths nonzero; dimℝX/2−dimTeff=3−2=1 | Pass; fixed values need not be vertices |
| A70 boundary a=0 | b=c=1 | hull is permutations of (2,1,0); π-exceptional ℂP¹ has pulled-back form 0 on its tangent | Pass; no symplectic convexity applied to degenerate X form |
| A71 Liouville density and orientation | ℝ², ω=dx∧dy, 2ω, −ω | positive measure densities 1,2,1 against dxdy; symplectic orientation changes for −ω | Mathematical target sound; admitted-data defect R02 and owner R04 |
| A72 local finiteness, chart formula and invariance | Unit square; dilation f(x,y)=(2x,y/2); product squares | masses 1,1,1; det Df=1; product top form ω²/2 gives product measure | Pass on models |
| A73 proper pushforward | μ=r²/2 on ℂ | inverse image [0,c] is disk radius √(2c), mass 2πc; bounded intervals have finite pushforward | Pass |
| A74 DH absolute continuity and ineffective support | Sphere height; sphere plus trivial second circle | density 2π on [−1,1]; in ℝ² support is a line, ambient Lebesgue mass 0 but DH mass 4π | Pass; effectiveness condition load-bearing |
| A75 chamber degree and reduced-volume density | Toric n=m=1; diagonal action on ℂ² | degree 0 density 2π; for ℂ² degree 1 density 4π²c=(2π)(2πc) | Pass |
| A76 retained-arrow level bundle formulas | Arrow h:x→hx, coordinates t∈T, right k | (ht)⁻¹(hx)=t⁻¹x; (tk)⁻¹x=k⁻¹t⁻¹x | Pass; source/target and right-action conventions agree |
| A77 connection sign and curvature | Hopf level c>0 | α(ξright)=1, α(ξleft)=−1; ∫F=2π; replacing α by −α gives −2π | Pass |
| A78 classifier, Chern and real symplectic class | Hopf CP¹; irrational c=√2 | dual h pairs to 1, standard u to −1; [F/(2π)]=h; [ω]=2π√2 h need not be rational | Pass; integral descent not inferred |
| A79 coarse/full inverse-isotropy integration | Generic ineffective order k=2 | integral of unit volume point is 1/2 full, 1 effective; effective=2·full | Pass |
| A80 reduced-class variation and transport | Hopf c₀=1,c=3 | [ω₃]−[ω₁]=4πh=(3−1)[F]; derivative of area=2π | Pass; sign agrees with λhorizontal−cα |
| A81 locally free chamber transport | Circle weight k on ℂ, c>0 | reduced orbifold is [point/μₖ] throughout chamber; density 2π/k throughout | Pass; isotropy retained |
| A82 critical values and density walls | Standard circle on ℂ | density 2π for c>0, 0 for c<0; critical value {0} has Lebesgue mass 0 | Pass; global smoothness would fail |
| A83 sphere and standard orthant DH | h∈[−1,1]; ℂ² separate rotations | total sphere mass 4π=2π·2; rectangle [0,c₁]×[0,c₂] mass (2π)²c₁c₂ | Pass |
| A84 toric volume and simplex/products | CP² simplex side c; rectangle sides c,d | simplex volume c²/2 gives symplectic volume 2π²c²; rectangle gives 4π²cd | Pass |
| A85 generic nerve/realization/coarse definitions | Unit groupoid of point; finite group C₂ over point | diagonal Sing gives point or BC₂; coarse target is point in both, H¹(BC₂;F₂)=F₂ versus H¹(point;F₂)=0 | Definitions retain isotropy; remove duplicate unused declarations, R06 |
| A86 facet pairing and region | N=ℤ→ℝ, normals +1,−1, supports 0,−L | pairings x,−x; inequalities give 0≤x≤L; at x=−1 first inequality fails | Pass |
| A87 smooth-vertex predicate | Same interval; normals doubled | endpoint active bases +1 or −1 pass; ±2 generate index-2 subgroup, fail | Pass |
| A88 Delzant compact/full/irredundant predicate | L>0; L=0; duplicate facet; positive-rank d=0 | interval passes; singleton in ℝ has empty interior; duplicate cannot be sole active facet; empty inequalities give unbounded ℝ | Pass |
| A89 rank-zero Delzant presentation | N=V=0, d=0 | region={0}=univ, compact, interior nonempty, empty basis spans zero, no irredundancy obligations | Pass; exposes R01 |
| A90 toric fibers, freeness, face stabilizers | S² circle; point trivial torus | latitude fibers single circles, poles points; interior stabilizer trivial; point stabilizer is trivial group | Pass |
| A91 fixed points never over interior | Zero-dimensional toric point; sphere | point: fixed=true and interior=true; sphere poles: fixed=true, interior=false | FAIL as written; R01 adds n>0 only to exclusion |
| A92 Delzant lattice exact sequence and regularity | Interval [0,L] | ℤ²→ℤ, (u,v)↦u−v, surjective; kernel diagonal ℤ; level r₁²+r₂²=2L has free diagonal circle | Pass for L>0 |
| A93 Delzant reconstruction/moment image | Same interval | reduction CP¹ has μ=r₁²/2∈[0,L], area 2πL | Pass; L=0 excluded by positive-dimensional full interior |
| A94 Delzant uniqueness, shifts and GL(n,ℤ) | Interval shifted by b; reflection x↦−x | shift adds b to μ with form unchanged; reflection relabels circle by inversion, not its identity | Pass |
| A95 toric cohomology/facet symplectic class | Interval normals (1,−1), supports (0,−L) | D₁=D₂=h, D₁D₂=0, ring ℤ[h]/h²; −2πΣλD=2πLh | Pass |
| A96 higher-dimensional cohomology and blowup examples | CP²; product spheres; corner chop size δ | ℤ[h]/h³, ℤ[x,y]/(x²,y²); triangle area decreases by δ²/2, symplectic volume by 2π²δ² | Pass on stated models; Hirzebruch surface retains two degree-2 generators and b₂=2 |
| A97 weighted flow and least periods | (a,b)=(2,3), ε=1 | generic period 2π; first/second axis periods π and 2π/3; zero point excluded by ε>0 | Pass |
| A98 ellipsoid to S³ map | (2,3), ε=1 | |√(a/(2ε))z₁|²+|√(b/(2ε))z₂|²=(a|z₁|²+b|z₂|²)/(2ε)=1 | Pass; positive square-root denominators |
| A99 two slice domains and stabilizers | (2,3), ε=1 | first radius √(2/3), group μ₂ acts by −1; second radius 1, μ₃ acts by exp(−4πi/3); center stabilizers 2,3 | Pass; away from centers stabilizers 1 |
| A100 slice overlap and order-one cases | Both coordinates nonzero; (1,2) | phase changes differ by exactly retained cyclic rotations; first center has order 1, second order 2 | Pass; ordinary point distinguished from cone point |
| A101 coarse power map, invariance and orbit separation | (2,3); generic phases | z₁³ and z₂² both acquire e^(−6iθ); relative phase 3φ₁−2φ₂ is invariant; endpoints give [1:0],[0:1] | Pass; coprimality identifies all phase ambiguity with an orbit |
| A102 slice reduced forms | First slice y₁=0; second slice y₂=0 | pulled-back dx₁∧dy₁=0 or dx₂∧dy₂=0, leaving standard dw or du area form | Pass |
| A103 weighted area and Hopf comparison | (2,3), ε=1; (1,1), ε=1/2 | (1/2)π(2/3)=π/3=2π/(2·3); Hopf area π | Pass; inverse-stabilizer factor essential |
| A104 labeled orbifold smoothness | Label 2 at a primitive ray; unit labels on determinant-2 cone | isotropy μ₂ in either case; unit labels alone do not imply smoothness | Pass; both conditions required |
| A105 actual `dh_absolutelyContinuous` signature | Intended sphere measure versus admitted zero model | intended DH([−1,1])=4π; zero model gives 0 and still 0≪Leb | Acceptance fails to discriminate R02, despite correct theorem hypotheses |
| A106 actual `toricImage_delzant` signature | Sphere/interval; point/rank 0 | primitive lattice produces interval presentation; zero lattice produces empty-facet point presentation | Pass on models; period and dimension binders present |

The polygon checks used exact rational arithmetic, enumerating feasible intersections of pairs of coordinate bounds in the trace plane. For each of the three positive weight choices there are exactly six vertices, equal to rows 1,3,4,8,7,6. Thus every bound-vertex is a fixed value, while every fixed value satisfies every bound: this verifies both hull inclusions for these instances. The general vertex calculation has the same expressions and positive edge lengths. The analytic image equality additionally needs the geometric input specified in T3.1; a finite vertex computation alone is not offered as its proof.

**Pinned declarations opened.** Paths here are relative to the indicated library root, at the commits above:

- Mathlib `RepresentationTheory/Invariants.lean:73–80`: `Representation.invariants` and `mem_invariants` are the common fixed-vector equations, with no compactness, topology or finite-dimensionality requirement. This supports the arbitrary-group linear signatures and R09.
- Mathlib `Analysis/InnerProductSpace/Projection/Basic.lean:128–132`, `290`: `Submodule.starProjection` is the ambient continuous-linear orthogonal projector, requiring `HasOrthogonalProjection`; `starProjection_eq_self_iff` identifies its fixed subspace. The finite-dimensional projection module supplies the subspace instances used here.
- Mathlib `LinearAlgebra/UnitaryGroup.lean:55–62`: `Matrix.unitaryGroup` is the unitary submonoid with a group instance. `Analysis/Matrix/Spectrum.lean:57–67` gives Hermitian eigenvalues, including the sorted indexing; the Schur–Horn probe used prescribed real spectra instead, so required no new spectral carrier.
- Mathlib `Algebra/Module/ZLattice/Basic.lean:431–436`: `IsZLattice` uses an explicit discrete-subspace instance and a full-span field; it is not merely injectivity of a lattice map. `MeasureTheory/Measure/Haar/OfBasis.lean:250–266`: `Module.Basis.addHaar` normalizes the basis parallelepiped to mass 1.
- Mathlib `Topology/Connected/Basic.lean:703–709`: `ConnectedSpace` includes nonemptiness. Hence an empty M is not a counterexample to the two main theorem signatures. `Topology/OpenPartialHomeomorph/Defs.lean:51–60`, `142`, `164–168` gives the local equivalence and source/target inverse laws; it does not assert equivariance or source invariance, which the companion supplies explicitly.
- Tau Ceti `Geometry/Toric/Algebraic/Lattice.lean:84–98`, `117–124`: `Toric.IsIntegralLattice` includes finite freeness and actual scalar extension, with injectivity proved; no alternate dense-lattice stand-in is introduced.
- Tau Ceti `Geometry/Manifold/TwoForm/Basic.lean:59–68`: `SmoothTwoForm` is a smooth alternating bilinear section. `Geometry/Symplectic/Manifold/TwoForm.lean:90–103`: `SmoothTwoForm.IsSymplectic` adds closedness and fiberwise nondegeneracy. Neither definition supplies a Liouville measure, compactness, separation or a Borel structure.
- Tau Ceti `Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:75–102`: `riemannianVolume` is a measure with chart characterization and local finiteness, for its metric data. This is evidence for the existing density infrastructure, not an identification with the symplectic measure without a density comparison.

**Ownership and supplier audit.** Searched by objects using `roadmaps grep` (README and Lean), the main content tree, the board's package files, the available open-work index and the supplied open checkouts, plus pinned library searches for projector, invariant-subspace, moment-map, lattice, Liouville, classifying-space and Schur–Horn objects. Generic Lie theory, normal forms, cohomology, density measures and orbifold topology stay with their named owners. The distinctive Hamiltonian applications, projector normalization and weighted polygon belong here. No independent fully qualified declaration-name collision with a different roadmap was found in the searched Lean files; matches in this roadmap's own main copy are its existing work, not another owner. Unlisted open heads were not sought as new dependencies.

Resolved these supplier contracts against main (completed roadmaps included), rather than treating open revisions of existing roadmaps as replacement contracts:

| Supplier citation | Read location and resolution |
| --- | --- |
| Family conventions; HamiltonianReduction R2/R3/R3.1 | `TauCetiRoadmap/SymplecticGeometry/README.md:25–44`; `HamiltonianReduction/README.md:127` onward and its R3/R3.1 sections: same contraction/KKS sign, coadjoint/reduction and slice ownership. The sibling Lean predicates at `HamiltonianReduction/Suggested.lean:21–43` supply the currently imported signature, but that roadmap import is prohibited by R07. |
| HeegaardFloer F2.1 | `TauCetiRoadmap/HeegaardFloer/README.md:2081–2130`: ordinary Darboux, domain-local Moser, family primitives and compatible structures. Equivariant/fixed-component specializations remain here. |
| DifferentialGeometry | `TauCetiRoadmap/DifferentialGeometry/README.md`, layers for differential forms, flows, orientation/integration and de Rham comparison, particularly §5.5 and §12.4 as cited by SBC B2.4. CT must cite the individual consumed sections under R10. |
| LieGroups Layer 6 | Main `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:383–405`: tori/conjugacy/Weyl integration resolve; the extra normalized rank-one contract does not, R03. |
| RootSystems Layer 4 | `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:296–319`: abstract chamber/fundamental-domain targets resolve; this is not the missing compact Lie realization. |
| SmoothBundlesConnections | `TauCetiRoadmap/SmoothBundlesConnections/README.md:776–800`, `1668–1704`: density/Liouville owner and dual-character Chern normalization resolve. Hopf pairs to +1 for the dual character, −1 for the standard character. R04 removes the overlap. |
| AlgebraicTopology; CharacteristicClasses C1–C3 | Ordinary cellular/singular cohomology and its products/duality at `TauCetiRoadmap/AlgebraicTopology/README.md`; `TauCetiRoadmap/CharacteristicClasses/README.md:211` (C1), `550` (C2), `720` (C3), with C1.5's torus normalization: these supply ordinary universal-bundle and Thom/Euler inputs, not CT's Hamiltonian equivariant perfection. |
| Orbifolds O1–O5, O4-N/S/R/K/W/T | `TauCetiRoadmap/Orbifolds/README.md:83`, `296–419`, `507–542`, `672` onward: proper étale models, retained ineffective isotropy, classifying/coarse/real-form comparisons and weighted integration resolve. Its O7 is a later comparison, not a required CT input. R06 removes the redundant generic Lean definitions. |
| MorseTheory M1–M5 | `TauCetiRoadmap/MorseTheory/README.md:611–642` (M5) and earlier M1–M4: ordinary Morse–Bott normal form/attachments and compact deformation resolve. Moment specialization remains T2. |
| HopfRinow | `Completed/HopfRinow/README.md:521–529`: smooth Riemannian isometries transport geodesics/exponential maps. This is the precise local input needed for fixed loci; bare metric isometries are not being substituted. |
| GeometricTopology Layer 1 | `TauCetiRoadmap/GeometricTopology/README.md:177–221`: generic tubular neighborhoods resolve. Equivariance needs CT's additional construction. |
| SchubertGeometry S2/word121 and complex realization | Main `TauCetiRoadmap/SchubertGeometry/README.md:38–45`, S9.1, `140`: all-word flag-chain carrier/maps, compact/complex realization, eight subwords and word121 exceptional fibers resolve at the existing owner. Read the expanded open word121 description too, but did not use that revision as an allowed new supplier. Point CT explicitly to S9.1 for the manifold comparison and to the main word121 target. |
| ComplexKahlerGeometry K7.2 | `TauCetiRoadmap/ComplexKahlerGeometry/README.md:88–89`, `1444–1453`: positive area-one FS and Plücker/projective forms resolve; rank-one evaluation is 1/π in affine coordinates. |
| AnalyticToricGeometry | `Completed/AnalyticToricGeometry/README.md` and pinned `TauCeti.Toric.IsIntegralLattice`: lattice and cone/fan ownership resolves. Symplectic classification is distinct. |
| CotangentLagrangian and IntegrableSystems | Read the supplied sibling interfaces where CT is consumed, especially `CotangentLagrangian/README.md:329` onward and the I2.0 period convention: both consume CT's measures/normalizations; neither is used as a new owner of T4's DH theorem. |

There are **zero literal `*Needs:*` lines** to audit, which is R10 rather than evidence of no dependencies. The prose supplier edges were inspected as above. The requested mechanical dependency command returned exactly:

```text
depcheck: 205 roadmaps, 1501 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No merge-order change was made or proposed. This syntactic pass does not detect R03's missing finer contract or R04/R06's overlap. No declared supplier gap was available to exempt R03.

## Not verifiable

- **Knutson “semester2”, pp. 72–73:** no source manifest, stable source identifier or accessible text was supplied. Tried the sources service by author/title and `semester2.pdf`, and web searches for the specified filename and course notes. The published Escobar construction was read, but it does not certify those Knutson pages or their diagram labels. Both seeded targets' mathematics was still checked as above; the Knutson attribution remains unverified.
- **Atiyah, *Convexity and commuting Hamiltonians*:** the sources service's DOI landing request returned HTTP 403. The original pp. 1–15 were not certified; Cannas Theorem 27.1 supplies a readable independent statement of the convexity input.
- **Kirwan, *Cohomology of quotients in symplectic and algebraic geometry*:** no legal text was found by the sources service's bibliographic lookup. The README supplies no finer book locator. Lerman's separately read result does not certify this entire book reference.
- **Condevaux–Dazord–Molino, *Géométrie du moment*:** bibliographic lookup found no legal text. The README gives no locator. HNP's legally fetched local-to-global result was checked separately.
- **Guillemin–Sternberg (1982), Kirwan convexity III (1984), Duistermaat–Heckman (1982):** the service classified the corresponding publisher-only citations as **uncertified**. They are reported as such, not reopened as missing-text requests. No theorem/page certification of those original articles is claimed.
- Legal source copies were also obtained for LMTW, Delzant, Lerman–Tolman, Moerdijk and van den Berg–Moerdijk. This review does not certify every theorem in those works; it performs the required source sample, the additional explicitly described readings, and the mathematical checks in the table. None of the target README's locators is explicitly flagged “unverified”; the missing Knutson identity is recorded above rather than guessed.
- The library and roadmap searches establish the concrete overlaps and resolved contracts cited here, not a proof that every possible alternative formalization has been found. Full proofs of the unimplemented geometric headline theorems remain implementation work. The identified blockers are repairable, so the verdict is **needs changes**, not rejected. Missing texts do not suspend this review.

## Source issues

- **Error** in escobar at §4.1, printed p. 13 (escobar lines 480–484): the source says a general point maps under the torus moment map to a Weyl conjugate of the fundamental weight; it should be a convex combination, with Weyl values at torus-fixed points; affects a stated result.
- **Misprint** in escobar at §4.1, printed p. 13 (escobar lines 485–488): the source says the product moment map sums φₖ∘μₖ; it should be Σ μₖ∘φₖ, from the Bott–Samelson space to the torus dual; affects a stated result.
- **Misprint** in escobar at §4.1, printed p. 12 (escobar lines 459–464): the source says the kth component uses an unbound j and parabolic index k; it should use the cumulative product p₁⋯pₖ and the parabolic indexed by the kth word letter; affects a stated result.
- **Misprint** in lerman-gradient at Theorem 1.1(2), printed preprint p. 3 (lerman-gradient lines 131–135): the source says the extended flow has codomain C; it should have codomain S_C, with its infinite-time endpoint in C; affects a stated result.
- **Misprint** in hnp at the paragraph after Theorem 3.4 and proof of Theorem 4.1, printed pp. 133–134 (hnp lines 524, 549): the source says Theorem 3.5 supplies the local-to-global result; it should cite Theorem 3.4; affects the proof.
