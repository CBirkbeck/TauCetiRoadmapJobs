<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12977#issuecomment-6867767237 -->
Red team round 1 pass a (codex) of 8f92ca6

Verdict: needs_changes

1. **F01** (P2) Coordinate changes do not commute with the displayed derivations

   Location: packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:389–394, “compatible with φ and the derivation”.

   Claim: the generic-to-local embeddings commute with the chosen derivation, while the generic derivation is d/dx and the local one is d/dx_α.

   Witness: at infinity of A¹, x=y⁻¹. The image of ∂x(x) is 1, whereas ∂y(y⁻¹)=−y⁻². TSU line 565 uses differential modules.

   Exact repair: replace the compatibility and Taylor sentences by: “These embeddings respect Frobenius and the universal continuous differential d. In local coordinate y = x_α, the transported generic derivation is (dx/dy)⁻¹∂y; it equals ∂y only when x = y. Form the local Taylor map using y and ∂y, and the generic Taylor map using a chosen generic étale coordinate.” Add the Check: “At infinity of A¹, x = y⁻¹ and ∂x = −y²∂y, so ∂x(y⁻¹) = 1.” Apply the same qualification to the independence assertion and corresponding supplier contract.

   Retest: −y²(−y⁻²) = 1, matching the image of ∂x(x); the unscaled local operator still gives −y⁻², as required for a negative control.

2. **F02** (P1) The logarithmic Robba solution space is missing

   Location: packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:874–933, “f ∈ Sol_λ(M)” and “The bounded-disc case follows through the Taylor embedding.”

   Claim: MS.1.7–MS.1.8 use logarithmic Robba solutions of an E†-module, but MS.0.2 and MS.1.6 define generic Taylor solutions and actual bounded-disc solutions only. The scalar-growth supplier gap does not construct this module-valued solution functor or its comparison.

   Witness: unit generic solutions have constants E^τ; logarithmic Robba solutions have constants K. OHK line 1198 defines the latter carrier; OHK line 1262 begins the actual-disc comparison.

   Exact repair: add to MS.1.6: “For a solvable (φ,∇)-module M over E† = R^bd, define Sol_log(M) = Hom_(E†,∇)(M,R_log) and Sol_log,λ(M) = Hom_(E†,∇)(M,Fil_λ R_log). These are K-vector spaces with induced Frobenius. Distinguish them from the B^τ-vector spaces Sol_gen,λ and the K-vector spaces Sol_disc,λ. For a bounded-disc module M₀, extension along K[[t]]₀ → R^bd induces a Frobenius-equivariant isomorphism Sol_disc(M₀) ≅ Sol_log(R^bd ⊗ M₀), identifying every growth step (OHK Lemma 5.2, pp. 25–26).” Also state that these solution spaces and their growth steps commute with isometric complete discretely valued coefficient extensions carrying the extended Frobenius (OHK Lemmas 7.9 and 7.12, pp. 37–39); use this in MS.1.7's slope-space extension step. Add the extended-log-robba-growth contract to MS.1.6's needs. Use Sol_log throughout the E† assertions in MS.1.7–MS.1.8, and replace the Taylor proof step by this growth-preserving comparison. Add three Checks: unit solutions are K with growth zero; the logarithmic module has growth steps K·f₁ and K·f₁ ⊕ K·f₂ at 0 and 1; generic Taylor constants are E^τ and are not identified with K.

   Retest: the unit has K = K on the actual-disc/Robba comparison. The logarithmic example has dimensions 1 and 2 at growth 0 and 1 and f₂(e₂) = log(t) in its declared target.

3. **F03** (P2) Scalar extension is not an L₂-linear functor from an L₁-linear category

   Location: packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:2142, “an exact L_2-linear tensor functor”.

   Claim: θ_(L₁,L₂) has L₂-linear source and target Hom spaces.

   Witness: on Spec F₃ with L₁ = Q₃ and L₂ = Q₃(√5), the source unit has endomorphism ring Q₃. Thus √5·id is not a source endomorphism; the target unit has endomorphism ring L₂.

   Exact repair: “θ_(L₁,L₂) is an exact tensor functor linear relative to the inclusion L₁ → L₂, transitive up to canonical isomorphism, and preserving Q̄_p-rank.”

   Retest: for a ∈ Q₃, θ(a·id) = a·id in L₂; no undefined action of √5 on the source is asserted.

4. **F04** (P2) The semilinear Frobenius being inverted is not bijective

   Location: packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:162–163 and 438–439, “f ↦ φ ∘ f ∘ φ_M⁻¹”.

   Claim: the displayed composite defines Frobenius on generic solutions. Convention 3 assumes only invertibility of the linearisation.

   Witness: for the unit over E, φ(t)=t^p omits t: reduction would require t^(1/p)∈k((t)). Yet its linearisation φ*E→E is an isomorphism.

   Exact repair: “Define the solution Frobenius using the inverse of the linearised module Frobenius Φ_M : φ*(τ*M) → τ*M. Apply coefficient Frobenius to a solution and then precompose with Φ_M⁻¹, with the scalar-pullback identifications understood. Equivalently, require (F_Sol f)(φ_M(m)) = φ_target(f(m)) and extend linearly from the spanning image of φ_M.” Add the unit-module Check above to distinguish linearised invertibility from bijectivity of the semilinear map.

   Retest: the unit solution e ↦ 1 is fixed; for a constant line with φ_M(e) = a e, its image has value a⁻¹ on e. No inverse image of t under φ is required.

5. **F05** (P1) Generic Galois correspondence is outside the declared curve contract

   Location: packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:1068–1072 and 1250–1252, the generic module's “corresponding K^σ-representation”.

   Claim: the unit-root-correspondence-perfect-base gap supplies a representation for an arbitrary unit-root module over E_η, together with compatibility at every interior and boundary point.

   Witness: Spec k(C) is not a finite-type curve. RD.2.25 concerns residue k((t)); RD.3.48 concerns finite-type schemes. TSU line 1042 separately invokes the generic Katz correspondence.

   Exact repair: add the generic and local compatibility clauses to the named parent's unit-root-correspondence-perfect-base contract, in both README and plan.json: “For E_η of MS.0.1 and the same fixed-field hypotheses, unit-root (φ,∇)-modules over E_η correspond to continuous K^σ-representations of Gal(k(C)^sep/k(C)), compatibly with restriction to E_α. Extension to a unit-root bounded-disc module at α is equivalent to trivial inertia there; extension to a unit-root E†_α-module is equivalent to finite inertia. These identifications agree with the curve correspondence on generic and local realisations.” Import the arbitrary-residue Cohen-ring, p-Frobenius equivalence from NoncommutativeAndEquivariantIwasawa §F.6 stage 1; the parent supplies the fixed-coefficient q-Frobenius and connection/local-comparison extensions. Name these clauses in MS.2.3 and MS.2.9.

   Retest: C = A¹_Fp has generic residue Fp(x), covered by the new generic clause, and unit generic module gives the trivial one-dimensional representation with trivial inertia. A constant line with Frobenius p has slope 1 and remains excluded until twisted. This does not raise the already declared curve gap's absence as a defect.

6. **F06** (P2) The closed-point fibre needs the coefficient projector

   Location: packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:2126–2127 and 2151, “the L-space i_α^* M†” and “dimension Q̄_p-rank(M†)”.

   Claim: the ordinary closed-point pullback from RD.6.2 already has the dimension of the coefficient fibre. MS.6.9 correctly describes the extra multiplicity in that ordinary pullback, but MS.6.5 never defines its replacement.

   Witness: for the coefficient unit, deg(α)=2 and L=K_α, ordinary pullback is K_α⊗_K L≅L². Dimension and trace of F² are 2; the coefficient fibre requires 1.

   Exact repair: “Write M_α^raw = i_α^*M† for the ordinary fibre of RD.6.2. For L containing K_α, let e_α be the primitive idempotent of K_α ⊗_K L associated to the chosen embedding K_α → L. Define the coefficient Frobenius fibre M_(α,L) = e_α M_α^raw, with F^n restricted to this summand. It has L-dimension Q̄_p-rank(M†). The n summands of the raw fibre are cyclically permuted by F.” Use M_(α,L) in MS.6.5's API and the closed-point trace, characteristic-polynomial and weight statements. Cite TSU §7.3, p. 32 (TSU lines 1649–1656).

   Retest: projection of L² onto the chosen L gives dimension 1 and trace 1; the raw fibre still has dimension 2 and repeated eigenvalue 1, agreeing with MS.6.9. The existing projected base-field pullback must be explicitly used for this fibre as well.

7. **F07** (P2) The variety saturation proof applies a field construction to a dagger algebra

   Location: packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:1527–1531, “Take the affine image quotient of MS.3.4”.

   Claim: MS.3.4 constructs the image quotient required on a higher-dimensional smooth affine variety. Its domain is instead finite-dimensional modules over the field E†.

   Witness: on A² the ring is K⟨x,y⟩†, where x is a nonunit. MS.3.4 works over E†. TSU line 1266 establishes a separate affine image-realisation theorem.

   Exact repair: add this assertion to MS.3.8: “On a smooth affine U with Frobenius lift and slope-filtered M, the A†_(U,K)-image of Γ(U,M†) → Γ(U,Top(M)) is a finite projective module with integrable connection and invertible horizontal Frobenius linearisation, hence an overconvergent F-isocrystal. Its kernel is an overconvergent subobject (TSU Lemma 5.3, p. 24).” In its proof use Noetherianity for finite generation, flat Frobenius and the comparison A† ⊗_(A†,φ) Â ≅ Â to descend the invertible Frobenius structure, and the parent's RD.3.32 for overconvergence. Establish that comparison from finite flatness and completion, rather than assuming Frobenius stability means invertibility. Replace the quoted MS.3.10 sentence by “Take the affine image quotient constructed in MS.3.8.”

   Retest: for the constant slope-(1,0) sum on A², the image is the projective rank-one A†-summand of slope 1; its Frobenius linearisation is invertible. No assertion that A† is a field is used.

8. **F08** (P3) The global constant-polygon filtration cites only a dense-open theorem

   Location: packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:1824–1827, “Constant Newton polygons make all slope filtrations involved exist.”

   Claim: RD.3.45 supplies the global filtration used in MS.5.2.

   Witness: TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:6939 (§RD.3.45) concludes existence on a dense open; §RD.3.44 at line 6901 supplies the common-vertex subobject on all of X. The former alone does not define S_min(N) on X.

   Exact repair: in MS.5.2's Needs replace “§RD.3.45” by “§RD.3.44 (common-vertex subisocrystals, applied successively to a constant Newton polygon)”; retain RD.3.45 for assertions that first shrink to a dense open. Include the same distinction in the supplier contract.

   Retest: for O ⊕ O(−1) on X, the common rank-one vertex gives O on all of X, so both sides of the minimal-slope equality are defined globally.

9. **F09** (P3) Two hull Checks restate the defining property

   Location: packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:1813–1817 and 1838–1842, the second Checks of MS.5.1 and MS.5.2.

   Claim: each definition has three discriminating Checks. “An overconvergent subobject ... is its own hull” repeats the API; the isoclinic MS Check explains what the definition demands without testing an instance.

   Witness: MS.5.1's idempotence/fixed-object API and MS.5.2's first API bullet already state these two assertions. Each section has only two other concrete tests.

   Exact repair: replace both schematic Checks by: “Take M = L₀ ⊕ L₁ and N = L₁, constant lines of slopes 0 and 1. Hull†_M(N) = L₁ and S_min(N) = S_min(Hull†_M(N)) = L₁. In contrast S_min(M) = L₀. Using the ambient first slope step or taking the whole ambient object as every nonzero hull fails this test.”

   Retest: the compared subobjects both equal the second coordinate line; the two plausible incorrect constructions give the first coordinate line or a rank-two hull.

10. **F10** (P3) The stated target order contains avoidable forward dependencies

   Location: packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:566–570 and 1343, MS.0.5's Need for MS.0.7 and MS.3.2's appeal to MS.3.5.

   Claim: targets can be developed in their presented order. The first bounded-quotient construction uses a later theorem; quasi-saturation's API asserts a later rank theorem which itself consumes quasi-saturation.

   Witness: MS.0.5 → MS.0.7 is explicit. MS.3.2's last API bullet invokes MS.3.5, whose Needs include MS.3.2. This is not a cross-roadmap cycle reported by the merge-order gate.

   Exact repair: begin MS.0.5 with the isoclinic-implies-bounded assertion and its unit-root-lattice argument, moved from MS.0.7; prove it before constructing the bounded quotient and use it for nonvanishing. Its Needs are MS.0.2, MS.0.3 and the parent’s §§RD.1.32, RD.1.37 and RD.1.39. Remove MS.0.7 from MS.0.5’s Needs. Move MS.3.2’s last API bullet to MS.3.5. Keep all target IDs and the general bounded splitting theorem in MS.0.7.

   Retest: the unit's top is a bounded rank-one quotient using the preliminary assertion in MS.0.5; the logarithmic module's top is the unit. Quasi-saturation is defined before its top-rank conclusion, with no return edge.

## Verified sound

The entire README (2,594 lines) and Suggested.lean (79 lines) were read. The inventory contains 69 numbered mathematical targets, including their bold definitions, and 206 Check bullets. The computed-instance record below covers every numbered target; these finite tests are not proofs of the general results. Findings above identify the failures and incomplete interfaces.

Suggested.lean has **0 declarations**, 0 section variables, 0 instances and 0 admitted examples. Its declaration/context table is therefore empty:

| Declaration | Section | Variables / instances | Elaborated signature |
| --- | --- | --- | --- |
| none | namespace only | none | not applicable |

No Lean process was run. In particular, there is no declaration for which a scratch `#check @name` could reveal a dropped binder. The single import is `Mathlib`; no forbidden options or sorry'd data occur. There is no padding to delete. The empty file does not substitute a free predicate or a scalar identity for a geometric headline.

The README's principal acceptance targets are MS.0.4, MS.0.7, MS.1.1–MS.1.5, MS.1.8, MS.2.2–MS.2.3, MS.2.5–MS.2.7, MS.2.9, MS.3.6–MS.3.7, MS.4.2–MS.4.4, MS.4.6, MS.4.8, MS.5.3, MS.5.5–MS.5.8, MS.6.3, MS.6.6–MS.6.7, MS.6.10 and MS.6.13–MS.6.14. The module docstring names these and the missing differential-field, solution, isocrystal, slope, cohomology or coefficient-category carriers. The pinned WittVector.Isocrystal carrier has a semilinear equivalence over a Witt fraction field, but does not supply these differential modules or geometric coefficient categories. A bare Reynolds-average theorem is already in Mathlib and would not test MS.6.7.

### Computed instance ledger

Notation used only in this report: 1 is the constant unit line; L_s is a constant line of normalised slope s; D = L₁ ⊕ L₀; J is the logarithmic extension with ∇e₂ = e₁ dt/t, F(e₁)=q⁻¹e₁, F(e₂)=e₂; A is the ordinary rank-two Legendre object restricted to its ordinary locus; T is the rank-three Legendre–Kummer extension. Rank computations involving A and T are conditional on the named Legendre supplier contract. The rank-zero convention excludes numerical λmax(0) without excluding Top(0)=0. “Pass” below means the displayed instance agrees, not that missing supplier work is proved.

| Target and context | Instances tried | Values computed on the two sides / distinguishing value | Result; change |
| --- | --- | --- | --- |
| MS.0.1; smooth affine curve, chosen coordinates | A¹ at 0 and ∞; unit; lacunary series | residue E_η = k(x), local residue = k((x)); ∂x(x)=1 versus ∂y(y⁻¹)=−y⁻²; unit rank 1; factorial gaps exceed every recurrence order | R01; field distinction passes |
| MS.0.2; finite free differential Frobenius module over B | 0, 1, J, line F=a | solution dimensions 0,1,2; bounded dimensions 0,1,1; J coefficient norm at n=p^r is p^r; solution eigenvalue a⁻¹; φ(E) omits t | R04; signs and boundedness pass |
| MS.0.3; complete mixed-characteristic DVR, σ isometric | Witt field; ramified √p; q=p² | fixed field Q_p; v_π(√p)/v_π(p)=1/2; twist gives 1; eigenvalues (1,p²) give (0,1), after iteration (1,p⁴) still (0,1); ramified p² gives 4/4=1 | Pass |
| MS.0.4; nonzero φ-module, injective dagger restriction | 1→1; 1→1²; D→L₀; zero | top ranks 1=1 and 1<2; projection has kernel L₁ and slopes 1≠0; zero numerical slope undefined; (a,b)↦a+αb has dagger kernel 0 and completed kernel E·(−α,1) | Pass; hypotheses discriminate |
| MS.0.5; generic bounded quotient | 0,1,J,D | B ranks 0,1,1,2; kernel ranks 0,0,1,0; B(B(J))=1=B(J); Sol₀(J) dimension 1 | Pass instances; R10 order |
| MS.0.6; exact extension with pure ends | J; split D; equal-slope Jordan block | J has b−a=1, unbounded and nonsplit; D has b−a=−1 and splits; equal-slope Jordan case b−a=0 is outside splitting alternatives | Pass |
| MS.0.7; B=E,E_α,E_η | 0, line, D, J | filtration split truth values true,true,true,false; boundedness same four values; J top rank 1 with slope 0 | Pass |
| MS.0.8; isometric coordinate-compatible complete-field extension | identity, J, D | bounded quotient ranks 1=1 for J, 2=2 for D; unbounded coefficients retain norms p^r before/after extension | Pass within coordinate hypothesis; R01 applies to uses at arbitrary coordinates |
| MS.0.9; PBQ includes nonzero condition | 0,1,D,J | PBQ false,true,false,true; bounded slopes respectively empty,{0},{1,0},{0}; λmax(J)=0 | Pass |
| MS.0.10; every nonzero quotient, nonempty sums | D→L₀; J→1; two unit lines; empty sum | maxima 1→0 refute criterion for D; J gives 0=0; sum ranks 1 then 2, slope 0; empty sum rank 0, PBQ false; L_−1+J=J despite different maxima | Pass both directions and nonempty guard |
| MS.0.11; nonzero unit-root U | U=0,1,1²; M=D or J | with M=1,U=0: true versus false; D⊗1² has bounded slopes {1,1,0,0}, PBQ false; J⊗1² bounded quotient rank 2, sole slope 0 | Pass; U≠0 necessary |
| MS.1.1; finite-rank PBQ filtration | 0,1,D,J | lengths 0,1,2,1; D grades slopes 1,0, nested maxima 1,1; J single grade rank 2, top rank 1 | Pass |
| MS.1.2; grade tops | D,J,0 | D: B rank 2, tops L₁⊕L₀ rank 2, slopes {1,0}; nested-top substitute has {1,1}; J: 1=1; empty sum 0=0 | Pass |
| MS.1.3; compatible field extension | D,J,0 | D grades remain ranks 1,1 and slopes 1,0; J bounded rank 1 remains 1, PBQ true=true; zero PBQ false=false | Pass |
| MS.1.4; E†-module, perfect k | split D; irreducible line; J | descended first steps L₁,1,J of ranks 1,1,2; completions have the same ranks; quotient D/L₁ has slope 0<1 | Pass |
| MS.1.5; bounded-disc module, saturated submodules | line; CT11 rank-three example | line length 1; CT11 first step span(e₁,e₃) rank 2, quotient rank 1; generic bounded quotient slopes 1 and 1/2, hence not PBQ; dual bounded quotient has sole slope 0 | Pass conditional on disc-descent contract |
| MS.1.6; real growth index | 1, log(1+u), λ=−1 | constant exact growth 0; at n=p^r norm p^r gives exact log growth 1; constant satisfies a negative-index polynomial bound but belongs to no declared negative step | Pass power-series definition; R02 missing Robba carrier |
| MS.1.7; PBQ and logarithmic solvability, eigenvector nonzero | unit; J's two logarithmic solutions | unit μ=0 ≤ 0−0; J: μ=0 at λ=0, μ=1 at λ=1; both equal λ−λmax with λmax=0 | Intended inequality passes; R02 |
| MS.1.8; PBQ disc/logarithmic solutions | unit; J; λ<0 | unit dimensions 0 for λ<0 and 1 for λ≥0 on both sides; J dimensions 0,1,2 at λ=−1,0,1; raw generic constants E^τ versus Robba constants K | R02; shift and sign pass after repair |
| MS.1.9; PBQ bounded-disc module | constant line F=a; isoclinic rank 2; split slopes 0,1 | solution eigenvalue a⁻¹, evaluation quotient a; isoclinic rank 2 evaluates onto rank 2; split solution slopes {0,−1}, not isoclinic, PBQ false | Pass |
| MS.2.1; smooth connected curve | unit,0,D | generic bounded slopes {0},empty,{1,0}; PBQ true,false,false on every dense open | Pass |
| MS.2.2; affine curve, finite projective modules | G_m lacunary series; A¹; elliptic torsion line | coefficient norms p^−n→0 but at ∞ p^−n r^−p^n→∞ for every r<1; at 0 it converges; rational functions integral at all finite points give k[x]; torsion line has rank 1 and nonzero Picard class | Pass intersections; boundary test separates completion |
| MS.2.3; generic submodule with all local data | 0,whole module,line F=q | glued ranks 0 and rank M; line slope 1 becomes 0 after q⁻¹ twist, then 1 on untwisting | R05 generic correspondence input |
| MS.2.4; nonempty PBQ sums / nonzero quotients | two unit lines; J→1; empty family | summed bounded quotient rank 2, slope 0; J quotient maximum 0=0; empty sum rank 0 not PBQ | Pass |
| MS.2.5; curve PBQ filtration | 0,1,D | lengths 0,1,2; D grades slopes 1,0; nested maxima 1,1 | Pass conditional on gluing |
| MS.2.6; finite étale map | identity; Artin–Schreier degree p | identity preserves rank; pullback unit rank 1, pushforward unit rank p with all slopes 0; PBQ true in both cases | Pass, including p=2,3 |
| MS.2.7; globally slope-filtered realisation | D; A on ordinary locus | D bounded quotient rank 2=1+1; A bounded quotient equals top, rank 1, slope 1; a dagger quotient of rank 1 would contradict irreducibility of rank 2 | Pass |
| MS.2.8; p≡1 mod4, specified Legendre extension | ordinary p; supersingular p≡3 mod4 | T grades ranks 2,1 and maxima 1,0; H¹ eigenvalues π_p²,p²/π_p² have slopes 0,2 and absolute value p, so untwisted fixed dimension 0; twisted dimension 1; supersingular slopes 1,1 | Pass conditional on declared example contract |
| MS.2.9; convergent curve object | 1,D,0; ordinary unit-root line H | lengths 1,2,0,1; H rank 1, bounded quotient rank 1 slope 0, no dagger subobject of irreducible A; D nested maxima 1,1 versus grade maxima 1,0 | R05 affects gluing; instances pass |
| MS.3.1; canonical E†-map to Top | 0,1,D,J | kernel ranks 0,0,1,1; saturation truth true,true,false,false; J top rank 1 although J rank 2 | Pass |
| MS.3.2; injective horizontal φ-map to pure E-space | E†→E; first coordinate E†→E²; α∉E† map | spans of ranks 1=1 and 1<2; α map has dagger kernel 0, completed kernel dimension 1; no φ-structure is imputed to arbitrary α | Pass definition; R10 moves rank corollary |
| MS.3.3; nonzero injective map | unit inclusion; D projection; zero | λmax=0=slope P and top rank 1=1; projection kernel rank 1, values 1≠0; zero→0 ranks 0=0 with no numerical slope | Pass |
| MS.3.4; E† image quotient | 0,1,D,J | saturation ranks 0,1,1,1; for D image L₁ and top L₁; for J image unit and top unit; applying saturation twice retains each rank | Pass locally |
| MS.3.5; quasi-saturated rank / irreducibility | 0→0; line; unit Jordan block; D | top ranks 0=0,1=1; Jordan block rank 2, PBQ true, saturated true, top reducible, object reducible; D PBQ false and saturated false | Pass iff; equal-slope nonsplit control |
| MS.3.6; isomorphism of bounded quotients | D with identity; J with unit | D recovers L₁⊕L₀, length 2 on both sides; J and unit have length 1 and saturated grade unit on both sides | Pass; does not assert J≅1 |
| MS.3.7; irreducible/nonzero or PBQ+saturated/isomorphism | line identity and zero; J versus 1 | identity lifts to identity; zero is not an isomorphism; J and 1 have equal top rank 1 but ranks 2≠1, and J fails saturation | Pass |
| MS.3.8; smooth connected variety, dense affine open | 1,0,D on A² | top-map kernels ranks 0,0,1 on each nonempty open; x in K⟨x,y⟩† is not invertible | R07 affine image input; saturation instances pass |
| MS.3.9; saturation transport | J,T,D; finite étale degree d | (PBQ,saturated) respectively (true,false),(false,true),(false,false); kernels after pushforward have ranks d,0,d; iteration multiplies numerator and denominator by a | Pass examples conditional on T contract |
| MS.3.10; global saturated quotient | 0,1,D on A² | quotient ranks 0,1,1; D quotient kills slope-zero summand and retains slope 1 | R07; expected quotient test passes |
| MS.4.1; hypothetical strict top-rank excess | ordinary A→Top A; D→L₀; proper C | ordinary ranks 1=1, hence strict-excess premise false; kernel H rank 1 not dagger; D has maximum 1≠0 and fails injectivity; proper boundary size 0 | Pass negative controls; not an existence test under inconsistent final premises |
| MS.4.2; nonzero pure quotient, injective dagger sections | A→Top A; identity line; D→L₀; J→1; zero | top ranks 1=1 for first two; D slopes 1≠0 but dagger kernel rank 1; J ranks 1=1 but kernel rank 1; zero ranks 0=0, λmax undefined | Pass within hypotheses |
| MS.4.3; curve irreducibility iff | line,D,J | line: all three true; D: PBQ false/saturation false; J: PBQ true/top irreducible true/saturation false/object reducible | Pass both directions on examples |
| MS.4.4; isomorphism of global bounded quotients | D identity; J and 1 | D recovers rank-2 sum with slopes {1,0}; J and 1 recover rank-1 saturated grades, not equal original ranks | Pass, subject to R07 construction |
| MS.4.5; irreducible ends and slope ordering | J; unit Jordan block; T; split D | J: −1<0, nonsplit, PBQ, not saturated; Jordan: 0=0, top rank 2 reducible; T: 1>0, rank 3, nonsplit/saturated; split D rank 2 and split | Pass all three orderings |
| MS.4.6; specified top map on curve | line h=c≠0; h=0; J versus 1; proper C | unique lift c; h=0 excluded; equal tops with ranks 2≠1 fails saturation; proper irreducible slope-filtered object has one slope | Pass |
| MS.4.7; pure quotient with smaller kernel slopes | ordinary A→slope-1 top; D→L₀ | A kernel slope 0<1; D kernel slope 1>0, hence excluded | Pass |
| MS.4.8; nonzero map between minimal pieces | line; O(1); reversed labelled lines | dual slope of −1 is 1; a:M→N dualises N∨→M∨ and dualises back M→N; scalar c stays c | Pass direction and sign |
| MS.5.1; dagger hull in specified ambient | N=0; dagger line L₁⊂D; unit-root line in A | hull ranks 0,1,2; first two equal N, last strictly larger than rank-1 N | R09 replaces schematic Check; definition passes |
| MS.5.2; constant polygon, all subobjects | 0; N=L₁⊂D; unit-root line in A | S_min equality 0=0, L₁=L₁, unit-root line=unit-root line; S_min(D)=L₀ is wrong for second test | R08, R09 |
| MS.5.3; positive n, Galois/dense-open reductions | n=1,2; N=0; N=M=L₀⊕L₁; identity cover | induced zero rank 0 versus ambient rank n; at n=2 induced mixed rank 4, slopes 0,0,1,1, first-step rank 2; F² eigenvalue q² induces F eigenvalues ±q | Pass, including p=2 |
| MS.5.4; generic-pair dual image | N=0,N=M; non-descending subspace model | Q† ranks 0 and rank M; completed image map may have kernel E·(−α,1), dimension 1; dual hull can exceed rank N | Pass; arbitrary α is only a carrier control |
| MS.5.5; generic-pair minimal slopes | 0; dagger subobject; N=M | compared first steps 0=0; for N=L₀⊂D, L₀=L₀; for N=M=D, both L₀ of rank 1 | Pass conditional on generic comparison gap |
| MS.5.6; smooth curve, finite étale reduction | A¹ identity; y↦y^p−y | identity degree 1; Artin–Schreier degree p, derivative −1, infinity ramification index p | Pass; no tame-only restriction |
| MS.5.7; curve minimal slopes | ordinary unit-root line; proper C; zero | hull ranks 2 versus subrank 1, both first steps rank 1 slope 0; proper hull N=N; zero equality 0=0 | Pass conditional on earlier rank theorem |
| MS.5.8; docile pair, ample transverse curve | unit on P²; P²_Fp² over Fp; wild Dwork pullback | H⁰ dimensions 1=1; constants K₂ give 2=2; wild example H⁰(A²,E)=0 versus H⁰(C,E|)=1 | Pass; docility and geometric-constants distinction discriminate |
| MS.6.1; LC witness includes residue-rational point | identity curve; rank-one unit; A¹_Fp²→A¹_Fp | identity fibre has 1 Fp-point; quadratic-constant fibre has 0 despite image containing origin; pulled-back unit rank 1 in both | Pass |
| MS.6.2; irreducibility on one witness curve | identity object; N=M⊕lower-slope line | Q=M, surjection rank r→r; in split case Q has rank r rather than r+1; second map is identity injection when objects coincide | Pass |
| MS.6.3; LC for both objects | same curve; rank-one F=a | inequalities 1≤1≤1 force 1=1; Frobenius fibres have eigenvalue a on each side | Pass; coefficient fibre correction R06 for later coefficient use |
| MS.6.4; unit-root source, irreducible target | unit identity; line slope 1 identity | first gives slopes 0=0 and surjective rank 1 map; second has slope 1 and violates unit-root-source hypothesis | Pass |
| MS.6.5; finite coefficient models and scalar extension | L=K; [L:K]=2; degree-two closed point | coefficient unit raw K-rank 2/[L:K]=1; extra tensor over K doubles coefficient rank; raw closed fibre L² has dim 2 versus promised 1 | R03, R06 |
| MS.6.6; coefficient trace, smoothness for duality | point with F=λ,n=2; non-normal cubic; unit A¹ | point trace λ²=λ²; cubic splitting only over algebraic closure has 3 factors; H²_c(A¹) eigenvalue q, consistent with twist (−1) | Pass after fibre convention R06 |
| MS.6.7; m≥1, cyclic descent | m=1,2; primitive projector | averages f and (f+Tf)/2; T swaps terms, same sum; traces of e₁ and 1 on L² are 1 and 2; two slots give 2 versus 4 | Pass; 1/2 exists also in Q₂ |
| MS.6.8; connected X, nonempty Y | identity curve; connected point; Y=X⊔X | unit End maps L→L, a↦a; disconnected case L→L², a↦(a,a), kernel 0 and cokernel dimension 1 | Pass |
| MS.6.9; absolute coefficient irreducibility | F=2 over F₃; golden-ratio L-line | 3^(w/2)=2 for w=2log₃2; golden-ratio conjugates have abs 1.618… and 0.618…, weights ±0.876…; polynomial values mod3: 2,2,1 | Pass coefficient-sensitive purity; R06 fixes fibre definition |
| MS.6.10; pure internal Hom, matching fibres | equal units; constants a≠b | equal L-functions (1−t)⁻¹; unequal point objects give (1−at)⁻¹≠(1−bt)⁻¹; top compact eigenvalue q^d cannot cancel against weights <2d | Pass |
| MS.6.11; endomorphism surjectivity after extension | m=1; labelled lines g′=2,h=3 | lift τ=3/2, g′τ=3; average at m=1 unchanged; a second lift differing by nonzero map cannot induce zero on top | Pass |
| MS.6.12; LC on dense open, pure internal Hom | equal line, h=id | isomorphisms 1 and 2 both exist, but only 1 induces h; scalar 0 not invertible | Pass existence-versus-specified distinction |
| MS.6.13; finite field, absolutely irreducible coefficients | rank-one h=c≠0; identity curve | rank 1=1, h itself lifts by full faithfulness; equal weights give internal-Hom weight w−w=0 | Pass conditional on purity/Lefschetz gaps |
| MS.6.14; curve endomorphism bijection after extension | curve m=1; labelled lines; disconnected pullback control | h(g′)⁻¹=3/2 with inverse 2/3; (3/2)·2=3; disconnected unit endomorphism algebra L² cannot map bijectively to L on one component | Pass; endomorphism condition excludes component-loss control |

### Convention and boundary ledger

| Convention | Computed witness | Result |
| --- | --- | --- |
| 1: coefficients | p=2 and p=3 give q≥2 and v_π(q)>0; q=1 would give denominator 0 | q=1, equal-characteristic coefficient fields and the zero ring are excluded explicitly |
| 2: rings | residue E=k((t)); residue E_η=k(C); t⁻¹ belongs to E† but not K[[t]]₀ | The three carriers are distinct; R02 concerns their solution functors |
| 3: modules | unit Frobenius has linearisation rank 1→1, while t has no semilinear preimage for t↦t^p | R04; finite projective dagger modules are not assumed globally free |
| 4: slopes and duality | D=L₁⊕L₀ gives S_min=L₀ and Top=L₁; D∨ has Top=L₀∨; O(1) has v(q⁻¹)/v(q)=−1 | Sign and dual direction agree with RD.3.34 after rescaling |
| 4: ramification and iteration | v_π(p)=2, q=p², F=p: raw slope 2, normalised slope 1/2; F²=p², q²=p⁴: 4/8=1/2 | No unramified-coefficient restriction is silently introduced |
| 5: global filtration | D on X has ranks 0,1,2 everywhere; a Newton-jumping object supplies a top only on its constant-polygon open | Global claims need their stated filtration; R08 corrects its supplier |
| 6: solution convention | F(e)=q e yields F(f)=q⁻¹ f; solution slope −1 versus object slope 1 | Correct dual sign, with linearised formulation R04 |
| 7: bounded kernel | unit: Mᵇ=0, B(M)=M; J: Mᵇ=Ee₁, B(M)=E | Kernel and quotient are not interchanged |
| 8: PBQ grades | D has grades of maxima 1,0; nested terms have maxima 1,1; PBQ(0)=false | Strict decrease is imposed on grades; zero filtration has length 0 |
| 9: saturation | D→L₁ has kernel L₀ of rank 1; E†→E has kernel 0 and completed rank 1 | Injectivity and completed surjectivity are different conditions |
| 10: coefficients and weights | coefficient unit for [L:K]=2 has K-rank 2 and coefficient rank 1; F=2 over F₃ has w=2log₃2 | Real weights and coefficient-linear traces are necessary; R06 fixes closed fibres |
| 11: categorical scalars | End(unit)=K^σ; after coefficient extension End(unit)=L; forgetting L can change irreducibility | Relative scalar extension R03 preserves the intended category |

Common guards were checked throughout the target table: zero objects have rank 0 and empty filtrations, but no numerical maximum slope; a nonempty PBQ sum excludes the empty sum; smooth connected varieties exclude empty, nonreduced and non-quasi-separated test schemes; smooth curves are geometrically regular, so purely inseparable non-smooth examples do not enter gluing. Finite étale covers may have degree divisible by p, as the degree-p Artin–Schreier test shows. No positive-characteristic averaging is claimed: 1/2 exists in Q₂. There are no total natural-number subtraction/division definitions in the Lean file. The filtration convention explicitly handles m=0 before using m−1. S₃ and Q₈ are not input groups of a roadmap theorem; the sole averaging action is cyclic, and its finite-group supplier has no commutativity hypothesis.

### Pins, ownership and supplier audit

The declared Mathlib pin is 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and the Tau Ceti pin is 2fd255d997f47c0b5d834ee416c7015d55444ce5. The following contracts were checked in the pinned files, by object as well as name:

| Pinned declaration | File and observation |
| --- | --- |
| LinearMap.quotKerEquivRange | Mathlib/LinearAlgebra/Isomorphisms.lean:39; quotient/range linear equivalence, without Frobenius or analytic descent |
| Representation.averageMap, averageMap_invariant, averageMap_id | Mathlib/RepresentationTheory/Invariants.lean:126; finite-group averaging requires invertibility of the cardinality |
| LinearMap.trace_one | Mathlib/LinearAlgebra/Trace.lean:190; finite-free trace of identity, hence rank m gives trace m |
| Padic.norm_p_pow | Mathlib/NumberTheory/Padics/PadicNumbers.lean:881; the p-adic coefficient-norm calculation used for n=p^r |
| FixedPoints.subfield | Mathlib/FieldTheory/Fixed.lean:103; fixed subfield for a multiplicative semiring action, including iterates of an endomorphism |
| PowerSeries.HasGaussNorm.subring, mem_subring_one_iff | TauCeti/RingTheory/PowerSeries/Bounded.lean:63 and 81; radius-one bounded coefficients, without a Frobenius lift |
| PowerSeries.OnOpenDisc.subring | TauCeti/RingTheory/PowerSeries/OpenDisc/Basic.lean; analytic power series carrier, without the differential-Frobenius module category |
| TauCeti.Dagger.piAdicCompletion, weakCompletion, of | TauCeti/RingTheory/Dagger/WeakCompletion/Basic.lean; completion, weak-completion subalgebra and inclusion, not an isocrystal or solution functor |
| WittVector.Isocrystal | Mathlib/RingTheory/WittVector/Isocrystal.lean:112; a Witt-fraction-field semilinear equivalence; its rank-one classification does not state the geometric headlines |

Cross-roadmap checks resolved 72 distinct RD target IDs in the parent's current supplied head, plus AlgebraicCurves Layers 2 and 12 and RigidAnalyticGeometry Layer 5 on main. This is 75 distinct cited section/layer addresses, with repetitions counted once. The exact generic/local mismatch is R05; the constant-polygon supplier mismatch is R08. The parent's slope units, Tate-twist signs and increasing slope indexing agree after the explicit v_π(q) conversion. Its RD.1.72 is the de Jong generic pair, not the complete-residue Amice pair.

Ownership searches used the provided open-head index, the roadmaps search tool over main/open work, and the board packages, with object vocabulary including bounded quotients, PBQ, logarithmic growth, quasi-saturation, dagger hulls, minimal slopes and coefficient isocrystals. The parent's stated stopping point excludes the PBQ/minimal-slope programme developed here. CrystallineCohomologyPartII's Witt and compact-support comparisons, AdicSpacesPartIV's dagger foundations, and EllipticLegendreCharacterInterfaces' algebraic Legendre/character constructions do not own these results. KloostermanSums uses the curve minimal-slope theorem as a consumer. NoncommutativeAndEquivariantIwasawa's arbitrary-residue Cohen-ring equivalence supplies part, but not all, of the missing generic contract in R05. No duplicate fully qualified Lean declaration is possible here because the file declares none. No second copy, conflicting revision or dropped cited ID was reported by the supplied overlap check.

All nine declared gaps have the same slug in design/plan.json and the README, name PadicDifferentialEquationsAndRigidCohomology as supplier, and precede this roadmap in the merge order. Their absence from today's supplier is not a finding:

| Gap slug | Precision/minimality check and concrete boundary |
| --- | --- |
| extended-log-robba-growth | Nonzero eigenvector required: zero has no exact growth; log(u) has growth 1 and Frobenius q. Scalar extension and its injection are one coherent analytic contract. R02 adds the module-valued functor here. |
| dejong-disc-robba-submodules | Saturated submodule and finite free quotient specified; 0 and the whole module descend to ranks 0 and rank M. The field-only dagger descent is insufficient for a bounded disc. |
| unit-root-correspondence-perfect-base | Fixed-field hypotheses and perfect k are explicit; unit corresponds to rank-one trivial representation, while F=q has slope 1 and is excluded. Its generic-field use requires R05. |
| legendre-kummer-extension | p≡1 mod4 is a condition on the example, not the general theorem; eigenspace dimension 1 uses the π_p²-twist. Without twisting the weight-two eigenvalues give no fixed vector. |
| irreducible-iota-purity | Absolute irreducibility is coefficient-relative; an L-line with two conjugates of unequal complex modulus need not be pure after forgetting L. No claim about that forgotten object is requested. |
| lefschetz-curves-irreducibility | Finite sets and residue-rational lifts are explicit; the quadratic-constant cover has 0 rational lifts over an Fp-point and is excluded as a witness. |
| docile-curve-restriction | Smooth projective compactification, SNC boundary, dimension at least 2 and ample good-position curve specified; wild rank-one restriction can change H⁰ from 0 to 1. |
| coefficient-linear-weil-ii | L-linear mixedness and Frobenius specified; H²_c(A¹,1) has eigenvalue q and weight 2=0+2. The ordinary K-linear result does not imply this after forgetting coefficients. |
| dejong-generic-affine-line-comparison | Residue k(t) is specified; the complete-residue k^alg((t)) theorem is not silently substituted. On the unit, the tensor multiplication sends 1⊗1 to 1. |

The dependency command requested in the brief returned:

```text
depcheck: 240 roadmaps, 2169 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The git diff-stat check confined all changed files to packages/PadicDifferentialEquationsAndRigidCohomologyPartII. No package source, manifest or merge-order file was edited during this review.

### Locator and source-independence audit

The 69 primary target citation bundles and named supplier-contract locators were compared with the numbered statements or proof passages in the seven readable cached works. The 206 README Check bullets were read and assessed; the tables record explicit computed instances for every target and every numbered convention, rather than treating a successful locator lookup as a mathematical test. There are 0 Lean declarations to compare with README generality. The two settled paywalled works remain uncertified as described below.

For a reproducible source-share count, an author-led locator group counts once even when it names several adjacent theorem numbers; a repeated citation counts again; bare continuations inherit their preceding group. Before the References section there are 144 such groups: TSU 99, DAD 17, OHK 12, CT11 7, AE 5, KED04 1, KED05 1, DEJONG98 1 and TSU98 1.

The wording comparison covered the 69 target statement passages and seven further passages: the MS.0.7 proof route, MS.2.3 proof route, MS.3.8 proof route, MS.5.3 reduction proof, MS.6.5 construction route MS.6.10 weight argument, and the generic-affine-line comparison contract against KED04. No nontechnical sentence, example table or proof passage requiring a copying finding was identified. Shared notation and short forced mathematical statements were not counted as expressive reuse.

TSU has no separate table of contents; its numbered section headings and their contents were compared with the roadmap: MS.0 combines §2, §§3.3–3.5 and Appendix A; MS.1 combines §§3.6–3.7 with OHK's growth theorem; MS.2 returns to §§3.1–3.2 and uses §§3.8–3.9; MS.3 uses §§4–5; MS.4 uses §6; MS.5 comes primarily from DAD §4; MS.6 combines §6.3, §7 and AE. This is not a same-scope, same-order run of TSU sections. The chains MS.0.10→MS.1.1→MS.2.5→MS.4.2→MS.4.6 and MS.4.6→MS.6.3→MS.6.10→MS.6.13 explain the broad dependency order; R10 records the local ordering defects.

## Not verifiable

- DEJONG98, Proposition 6.4, and TSU98, Theorems 4.2.6 and 7.2.3, remain uncertified under the settled source status. Their precise contracts were checked, and their uses were compared with CT11, OHK and TSU; their original proofs were not certified or requested again.
- The nine declared supplier contracts are future interfaces, not completed library theorems. Numerical tests of their consequences do not verify the future implementations.
- No Lean elaboration was run, as required by the read-only brief. There are no declarations to elaborate. Carrier availability and the native declarations above were checked by reading the pinned sources.
- Finite instance tests do not certify every proof in the seven source works. The source issues below are the specific errors observed while checking this package, not a complete errata review of those works.

## Source issues

- **Misprint** in TSU at §1.1, p. 1; TSU line 19: the source says R is a discrete valuation field with residue R/m; it should be R is the discrete valuation ring, and K is its fraction field; affects nothing.
- **Error** in TSU at §2.1, p. 4; TSU line 225: the source says the coefficient-supremum norm is finite on the full Robba ring; it should be use annular norms there; coefficients p^(−⌊√n⌋) give infinite supremum but convergence on each smaller annulus; affects a stated result.
- **Misprint** in TSU at Definition 2.2(2), p. 5; TSU line 254: the source says the lattice uses a point-dependent ring before a point has been introduced; it should be use K[[t]]₀ for the lattice ring; affects a stated result.
- **Error** in TSU at §2.2, p. 6; TSU line 299: the source says Q with its ordinary order is well ordered; it should be Q is ordered; admissible supports, rather than the entire group, satisfy the well-ordering condition; affects a stated result.
- **Misprint** in TSU at Proposition 2.9 proof, p. 8; TSU line 446: the source says the partial-valuation bound is Lemma 2.5(4); it should be cite Lemma 2.6(4); affects the proof.
- **Misprint** in TSU at Proposition 2.10(2) proof, p. 9; TSU line 481: the source says the displayed Frobenius equation controls z_(i,s); it should be it controls z_(i,1); affects the proof.
- **Misprint** in TSU at Proposition 2.11, p. 9; TSU line 489: the source says the conclusion equates r with an undefined filtration length s; it should be give the second filtration length its own declared index and equate the two lengths; affects a stated result.
- **Misprint** in TSU at Lemma 2.12 proof, p. 9; TSU line 504: the source says the input is Lemma 2.9; it should be cite Proposition 2.9; affects the proof.
- **Misprint** in TSU at Theorem 2.14 proof, p. 10; TSU line 538: the source says the trivial module is a tensor power of the coefficient field; it should be use a direct sum of rank(M) copies; the tensor power has rank one; affects the proof.
- **Error** in TSU at Proposition 3.7 proof, p. 14; TSU line 729: the source says solvability supplies boundedness in the dual argument; it should be prove bounded-dual closure separately; the logarithmic module is solvable but unbounded; affects the proof.
- **Error** in TSU at Theorem 3.12, p. 15; TSU line 808: the source says every solvable module has a nonzero bounded quotient; it should be require M≠0 for nonvanishing and set B(0)=0; affects a stated result.
- **Misprint** in TSU at Theorem 3.19(1) proof, p. 16; TSU line 890: the source says bounded splitting is Proposition 3.10; it should be cite Theorem 3.10; affects the proof.
- **Error** in TSU at Proposition 3.18, p. 16; TSU line 872: the source says tensoring with any unit-root module reflects PBQ; it should be require the tensor factor nonzero; 1⊗0=0 does not reflect nonzero PBQ; affects a stated result.
- **Error** in TSU at Theorem 3.19(1), p. 16; TSU line 883: the source says the nested PBQ terms have strictly decreasing maximal slopes; it should be the successive grades have strictly decreasing maxima; nested terms of L₁⊕L₀ both have maximum 1; affects a stated result.
- **Error** in TSU at Theorem 3.19(2), pp. 16–17; TSU line 886: the source says the bounded quotient is the sum of tops of nested PBQ terms; it should be take the tops of successive grades; for L₁⊕L₀ this gives slopes 1,0 rather than 1,1; affects a stated result.
- **Misprint** in TSU at Proposition 3.24, p. 18; TSU line 958: the source says a numerical rank equals a solution space; it should be equate the rank with the K-dimension of that solution space; affects a stated result.
- **Misprint** in TSU at Remark 3.25, p. 18; TSU line 980: the source says the connection uses a derivative in an unchosen coordinate y; it should be use the chosen coordinate x on both sides; affects a stated result.
- **Misprint** in TSU at Lemma 3.31, p. 19; TSU line 1020: the source says the direct-image input lives on C and the pullback input on C′; it should be place the direct-image input on C′ and the pullback input on C; affects a stated result.
- **Gap** in TSU at Lemma 3.31 proof, p. 19; TSU lines 1029–1031: the source says part (1) concludes its hypothesis, while part (2) invokes the lemma being proved; it should be prove pullback preservation by generic base change first, then use adjunction for pushforward reflection; affects the proof.
- **Gap** in TSU at Lemma 3.33 proof, p. 20; TSU line 1063: the source says rank one permits immediate application of the unit-root gluing lemma; it should be normalise the fixed field, twist to slope zero, glue, untwist and descend; a line with F=q is not unit-root; affects the proof.
- **Misprint** in TSU at §3.9, p. 21; TSU line 1124: the source says the support-forgetting map starts with ordinary rigid H¹; it should be its source is compactly supported rigid H¹; affects a stated result.
- **Gap** in TSU at Proposition 6.1 proof, p. 26; TSU line 1354: the source says the overconvergent-quotient PBQ lemma applies to the image in a convergent top; it should be apply the generic-module quotient lemma, Lemma 3.17(2), since the image need not be overconvergent; affects the proof.
- **Misprint** in TSU at Theorem 6.4, p. 27; TSU line 1423: the source says h is overconvergent and its target is a generic-fibre quotient; it should be h is convergent between the two global bounded quotients; affects a stated result.
- **Misprint** in TSU at Corollary 6.8 proof, p. 29; TSU line 1493: the source says the intermediate isomorphism ends in the restriction of N†; it should be it ends in the restriction of M†; affects the proof.
- **Gap** in TSU at Proposition 7.4, p. 30; TSU line 1562: the source says unprojected base-extended objects carry the asserted coefficient dual pairing; it should be use the multiplication idempotent and the trace identification of the K-dual with the L-dual; affects the proof.
- **Misprint** in TSU at Proposition 7.5, p. 30; TSU line 1570: the source says the transitivity composite has target coefficient field L₂; it should be its target is L₃, so the left side is θ_(L₁,L₃); affects a stated result.
- **Error** in TSU at Lemma 7.11(1), p. 33; TSU lines 1665–1666: the source says the ordinary finite-L fibre maps isomorphically as an L-space to the algebraic-closure coefficient fibre; it should be first project to the coefficient fibre and then extend scalars; neither operation is an L-linear isomorphism of the displayed unmodified spaces; affects a stated result.
- **Error** in TSU at Lemma 7.11(3) proof, p. 33; TSU line 1706: the source says L⊗_K L splits into copies of conjugate L for arbitrary finite L/K; it should be split L⊗_K Q̄_p; a non-normal cubic extension need not split over itself; affects the proof.
- **Misprint** in TSU at Proposition 7.12 proof, p. 34; TSU line 1767: the source says twisting Frobenius by λ multiplies the trace of F^n by λ; it should be the multiplier is λ^n; nth powers span L over K in characteristic zero; affects the proof.
- **Error** in TSU at Definition 7.14 and Theorem 7.18, pp. 34 and 37; TSU line 1815: the source says all pure weights are integers, including arbitrary irreducible coefficient objects; it should be allow real weights; the line F=2 over F₃ has weight 2log₃2; affects a stated result.
- **Misprint** in TSU at Proposition 7.15(2) proof, p. 35; TSU lines 1863–1866: the source says τ maps N† to M† and is composed with the inverse of g′; it should be τ is an endomorphism of N† lifting Top(g′)⁻¹h, and the desired map is g′τ; affects the proof.
- **Gap** in TSU at Proposition 7.15(2) proof and Lemma B.1, pp. 35–36 and 40; TSU lines 1877 and 2112: the source says division by m normalises the cited unprojected unit–trace composite; it should be project K_m⊗_K L to one factor first; the unprojected composite is m² and the projected one is m; affects the proof.
- **Misprint** in TSU at Lemma A.1(2) proof, p. 38; TSU line 2008: the source says the fixed field and the completed unramified field have the same valuation ring; it should be their value groups agree; their valuation rings have different residue fields; affects the proof.
- **Misprint** in TSU at Lemma A.1(2) proof, p. 38; TSU line 2011: the source says the coefficient reconstruction tensors with W(k); it should be tensor with W(k′), as in the lemma statement; k′ is the residue field after the extension; affects the proof.
- **Error** in TSU at Lemma A.1(3) proof, p. 38; TSU line 2016: the source says id_L⊗σ defines Frobenius over K^(σ^n); it should be the actions must agree on the tensor base; id_L fails when σ acts nontrivially on K^(σ^n); affects the proof.
- **Misprint** in TSU at §A.2, p. 39; TSU line 2048: the source says the tube is a direct image under specialisation; it should be it is the inverse image of the closed subscheme under specialisation; affects a stated result.
- **Misprint** in DAD at Lemma 4.1.4 proof, p. 12; DAD line 455: the source says the induced hull equals its first slope step; it should be insert S₁ on the sum of hulls; an induced mixed-slope object need not equal its first step; affects the proof.
- **Misprint** in DAD at Theorem 4.2.6(i), p. 14; DAD line 557: the source says reverse grade i corresponds to S_(m−i)/S_(m−i−1); it should be use S_(m+1−i)/S_(m−i); at i=m the grade is S₁/S₀; affects a stated result.
- **Misprint** in DAD at Theorem 4.2.6(ii), p. 14; DAD line 558: the source says the eigenbasis belongs to the unextended module M†; it should be it belongs to M†_alg; affects a stated result.
- **Gap** in DAD at Lemma 4.2.7 proof, p. 15; DAD line 572: the source says the generic-pair multiplication injection follows from KED04 Proposition 4.1; it should be supply the comparison for residue k(t); the cited theorem has complete Laurent-series residue; affects the proof.
- **Error** in DAD at Proposition 4.2.12 proof, p. 17; DAD lines 649–655: the source says compactness gives a positive image-norm bound outside pQ and bounded quotient p-torsion; it should be powers (pu^n)^j outside pA_n have image norms p^(−j)→0; use another proof of the comparison; affects the proof.
- **Misprint** in OHK at Lemma 1.13 proof, p. 11; OHK line 580: the source says the correction logarithm uses φ(t)/t; it should be use φ(t)/t^q, which is close to 1; affects the proof.
- **Error** in OHK at Lemma 2.2 proof, p. 11; OHK line 610: the source says r^λ times the positive-tail norm tends to zero; it should be only boundedness is required and proved; λ=0 and the unit-coefficient geometric tail give limit 1; affects the proof.
- **Error** in OHK at Corollary 2.7, p. 13; OHK line 660: the source says the power-series and Robba growth conditions coincide for arbitrary Laurent series; it should be require a power series; t⁻¹ lies in Fil₀R but not K[[t]]₀; affects a stated result.
- **Error** in OHK at Lemma 2.8(iv), p. 13; OHK line 666: the source says derivative growth λ implies growth λ+1 for every real λ; it should be require λ≥−1 or account separately for integration constants; f=1 and λ=−2 contradict the printed statement; affects a stated result.
- **Misprint** in OHK at Definition 2.9, p. 13; OHK line 677: the source says the growth index λ belongs to the series filtration; it should be the element f belongs to that filtration, in both occurrences; affects a stated result.
- **Misprint** in OHK at Proposition 5.9, p. 26; OHK line 1322: the source says boundedness means M⁰=M; it should be boundedness means M⁰=0 and M/M⁰=M; affects a stated result.
- **Misprint** in CT11 at Lemma 5.7 proof, p. 57; CT11 line 1114: the source says coefficient norms tend to minus infinity, with support tests at every real threshold; it should be norms tend to zero; impose the support condition only at positive thresholds; affects a stated result.
- **Misprint** in KED04 at Proposition 4.1 proof, p. 9; KED04 line 349: the source says the multiplication image is merely an element of Γ_alg; it should be the multiplication image is zero, as required for the kernel argument; affects the proof.

- **Misprint** in CT11 at Proposition 4.2 proof, p. 50; CT11 line 761: the source says both connection bounds concern G₁₁; it should be the bounds concern G₁₁ and G₂₂ respectively; affects the proof.

Source independence: 76 passages compared with 7 readable sources; no actionable expressive reuse identified. Largest share TSU, 99 of 144 author-led locator groups; contents compared with TSU: independent organisation. DEJONG98 and TSU98 remain uncertified and were not compared for wording.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "8f92ca6c1eae1d42b8d4ca29b35c661fe046cf5d", "job": "RT-PadicDifferentialEquationsAndRigidCohomologyPartII~1a", "model": "gpt-6-astra", "worker": "chris-30"} -->
