<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1184#issuecomment-6420668168 -->
Red team round 1 pass a (codex) of 5c5e1c7

Verdict: needs_changes

1. **F01** (P1) A cusp star needs twice as many triangle tiles

   **Location:** `packages/GeometricFreyMazur/README.md:405`: “The incident p triangles give the full local disc in X(p).”

   **Claim:** The marked triangles of §1.2 assemble a complete disc using p tiles at their p-vertex.

   **Witness:** At p=7, seven angle-π/7 triangles have total angle π; fourteen have angle 2π. BT16 line 427 fixes the angles; BT16 lines 450–452 do not assert p tiles.

   **Exact repair:** Replace that sentence with: “The 2p incident triangles of angle π/p, equivalently p doubled fundamental tiles, give the full local disc in X(p).” At p=7 the corrected count gives 14·π/7=2π and removes the unfilled half-disc.

2. **F02** (P2) The combined surface gap omits the hypotheses for its Bertini request

   **Location:** `packages/GeometricFreyMazur/README.md:78`, and the matching `cyclic-surface-resolution-and-contraction` entry in `packages/GeometricFreyMazur/design/plan.json`: “For projective surfaces … sufficiently ample smooth connected curve sections”.

   **Claim:** This single contract requests cyclic resolutions, smooth connected transverse sections, and contractions under one projective-surface hypothesis.

   **Witness:** On X=ℙ² over ℂ[ε]/(ε²), viewed over ℂ, every effective Cartier section remains generically nonreduced. It cannot be a smooth curve. On ℙ²⊔ℙ² every ample section is disconnected.

   **Exact repair:** Separate the hypotheses inside this gap: “Over an algebraically closed characteristic-zero field, supply Hirzebruch–Jung resolutions for normal projective surfaces with isolated charts 1/n(1,a), n≥2, 1≤a<n, gcd(a,n)=1. On a smooth projective integral surface, extend SchemeAndStackFoundations §4.13's `bertini_smoothness` to connected sufficiently ample sections meeting finitely many reduced curves transversely in their smooth loci and avoiding a prescribed finite set. On a smooth projective surface, supply Castelnuovo contraction of a smooth rational (−1)-curve and termination by decreasing Picard number.” Put this same scoped contract in the plan and README (or split it into matching individually scoped gap entries). Cite the existing smoothness theorem rather than request it anew; its main-branch statement is `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5680`. Both counterexamples fail the corrected smooth integral hypothesis; the actual application X×X satisfies it.

3. **F03** (P3) Two constructors still lack three discriminating Checks

   **Location:** `packages/GeometricFreyMazur/README.md:623` (§3.4 Checks) and `packages/GeometricFreyMazur/README.md:961` (§6.3 Checks).

   **Claim:** Each new definition has at least three Checks that distinguish its intended object.

   **Witness:** §3.4's second Check repeats its CM transport API; its third repeats the prohibition on divisor intersection. §6.3 has two examples, followed by its own generic-injectivity assertion without a nonbirational witness.

   **Exact repair:** Keep the tangent-plane Check in §3.4 and replace its other two Checks by: “In conjugation-compatible local coordinates, (i/2,−i/2) lies on the conjugate diagonal and (i/2,i/2) does not.” “Second-factor conjugation sends (i/2,i/3) to (i/2,−i/3), and applying it twice recovers the original pair; conjugating both factors instead gives (−i/2,−i/3).” Replace §6.3's last Check by: “Take B=ℙ¹, h=id, and f the degree-two map t↦t² followed by ℙ¹≅H₁⊂Z(p). Then φ=f has generic degree two and φ(1)=φ(−1); thus birationality of f cannot be omitted from the degree-one conclusion.” These distinguish the wrong conjugation factor and give an actual failure with degrees 1 and 2 when birationality is removed.

4. **F04** (P3) The height locator points at the next page marker

   **Location:** `packages/GeometricFreyMazur/README.md:463`: “BT16 §3.3, p. 721; BT16 line 537.”

   **Claim:** The cached line locator identifies the source's matrix-height definition.

   **Witness:** BT16 line 537 is the page-14 marker; line 538 begins printed p.722. The height definition is BT16 lines 532–534 on printed p.721.

   **Exact repair:** Replace “BT16 line 537” by “BT16 lines 532–534”, keeping §3.3 and printed p.721. The relocated definition gives height 1 for the all-ones matrix, matching the package's Check.

## Verified sound

Read all 1,633 README lines and all 93 Suggested.lean lines, the repository rules, and the prior package repair reports. The audit covers **3 Lean declarations**, **66 numbered README targets**, the gonality definition and normalization conventions, **82 explicit cached-source anchor occurrences** (81 accepted, one corrected by R04), and **12 supplier roadmap dossiers**. The README has 69 Check blocks, containing 162 bullets. All 162 bullets were reviewed; computed discriminating instances are recorded below. R03 identifies the deficient construction Checks. These finite computations test the statements and conventions; they do not prove their asymptotic assertions.

The supplied elaborated-signature record was compared with all three declarations. No section binder was lost. No new elaboration or Lean build was run. Both theorem conclusions concern actual elliptic curves, actual geometric torsion and actual isogenies; neither is a free-predicate stand-in. Neither follows by a one-tactic application of the pinned library. The one definition is necessary to state those headlines. There is no padding finding.

The pins recorded in `lake-manifest.json` are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The inspected copies match them. The PR head is `5c5e1c7`; its committed diff is confined to `packages/GeometricFreyMazur/` (eight files, 2,853 insertions and one deletion). The module has one `import Mathlib`, one existing Tau Ceti module, one module docstring, the required namespace, no sorry'd data, no `lemma`, no `set_option`, and no computational algorithm. No package source was edited by this review.

### Every Lean declaration: context and computed instances

| Declaration and README counterpart | Complete relevant context | Instances; values on both sides | Result/change |
|---|---|---|---|
| `gonality`, Suggested.lean:42; README conventions | Two independent type universes; `Field k`, `Field K`, `Algebra k K`; no section variables; body is a natural-number infimum of finite degrees over transcendental singly generated subfields | K=k(t): degree set contains 1 and has no 0, so inf=1; K=k: no transcendental element, set empty, inf=0; genus-one and hyperelliptic genus≥2 models over algebraically closed characteristic-zero k: min=2 | Total-function junk is documented and excluded by both headlines' `FunctionField` assumptions |
| `full_monodromy`, Suggested.lean:54; §9.6, with §8.3 | N; k,K in one arbitrary universe; both fields, k algebraically closed and characteristic zero; compatible k→k(t)→K tower; finite-dimensional K/k(t); gonality<N; elliptic W; j outside k; prime p>5; 800N<7p; explicit torsion ZMod-module let-instance; determinant-one additive automorphism g | Identity g has det=1 and is induced by identity σ. Constant W would have image size 1, whereas a rank-two transvection has det=1 and order p; hW excludes it. N=2: p=227 gives 1589<1600, p=229 gives 1603>1600. N=0,1 fails 1<N | Actual rank-two torsion excludes the determinant's infinite-dimensional fallback value 1; no binder, coercion or threshold change |
| `geometric_frey_mazur`, Suggested.lean:75; §9.8 | ∀N ∃M before k,K,W,W′,p,e; same compatible function-field and constant-field instances; both elliptic and nonconstant-j; prime p>M; actual additive equivalence and graph-form equivariance for every σ,P,Q; conclusion `Nonempty (TauCeti.Isogeny …)` | K=k(t), Legendre E, N=2: gonality=1<2, e=id, f=id has degree 1. P=0 gives 0=0. For every P, Q=σP exists in torsion because pσP=σ(pP)=0; implication is not vacuous. At p=2, +1=−1, but the existential threshold may include 2 | Uniform quantifier order correct; graph equivariance is the ordinary intertwining condition; original K retained |

### Headline coverage

| README headline family | Acceptance-test disposition |
|---|---|
| §§1.3–1.4, 1.7: surviving witness and compact/cusped systoles | Explicitly named as unavailable in module docstring; marked scalar-level curve and compact metric missing |
| §§3.1–3.3, 3.6: signed reconstruction and CM/bicusp repulsion | Explicitly named; modular points and special/Hecke loci missing |
| §4.3 and §§5.2–5.4, 5.8: overlap and all four weighted multiplicity estimates | Explicitly named; modular cycle, degree and tube carriers missing |
| §§7.3–7.5: wreath ramification decay and complex rigidity | Explicitly named; scheme symmetric power and normalized modular pullback missing |
| §8.1: Abramovich gonality bound | Explicitly named; compact congruence curve missing |
| §§8.3, 9.6: full linear monodromy | Stated as `full_monodromy` on native actual p-torsion |
| §9.5: characteristic-zero geometric rigidity | Explicitly named; algebraic modular surface and Hecke loci missing |
| §§9.7–9.8: original-base and function-field Frey–Mazur | Native function-field headline stated; relative elliptic-scheme/finite-étale isomorphism version explicitly named as unavailable |
| §§10.1–10.5: bounded genus, rational/elliptic curves and minimal model | Explicitly named; modular surface/resolution/strict-transform/contraction carriers missing |

The subgroup-index and self-twist arguments in §§8.2 and 8.4 are proof inputs, not missing acceptance-test headlines. Their native transvection/perfectness inputs are already pinned. No additional declaration is requested for them.

### Pinned and supplier resolution

| Supplier | Resolved section/declaration and hypothesis check |
|---|---|
| Mathlib projective groups | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean:41`, `:64`, `:113`, `:120`: quotient by centre, scalar equality, PSL→PGL and injectivity. Does not assert PSL=PGL over F_p; at p=7 nonsquare determinant 3 is outside PSL |
| Mathlib norms, index, symmetric multisets | `Mathlib/Analysis/Matrix/Normed.lean:87`, `:106`; `Mathlib/GroupTheory/Index.lean:55`; `Mathlib/Data/Sym/Basic.lean:43`, `:342`, `:361`. Height is entrywise; infinite index=0 is excluded by finiteness; Sym preserves length, including [b,b] of length 2 |
| Mathlib native headline carriers | `Mathlib/NumberTheory/FunctionField.lean:58`; `Mathlib/Algebra/Module/Torsion/Basic.lean:972`, `:1010`; `Mathlib/Algebra/Module/ZMod.lean:81`; `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:823`; `Mathlib/LinearAlgebra/Determinant.lean:173`. Explicit tower and nonconstant-j assumptions retained |
| Pinned group theory | `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:804`, `Matrix.SL2.commutator_eq_top`, requires a≠0,a²≠1; a=2 works at p=5. `TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean:595` supplies generation. `TauCeti/GroupTheory/Perm/WreathProduct/Basic.lean:117`, `:518`, `:523` supplies W and action (a,σ)·x at i = a_i x_(σ⁻¹i), matching §7.1's two-slot computation |
| Pinned curve degree and isogenies | `TauCeti/Analysis/Complex/RiemannSurface/Degree.lean:120`, `:133`, `:434` and `Ramification.lean:112`: finite fibres, nonconstancy, compact connected manifold hypotheses, integer e−1. `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:139`, `Descent.lean:117`, `MulByInt/Hom.lean:63`: nonzero pointed pullback, arbitrary Galois descent, deg(nf)=abs(n)²deg(f) |
| ModularCurves, main | `TauCetiRoadmap/ModularCurves/README.md:375`, `:386`, `:735`, `:1313`, `:1357`: §§0D–0E, 2C, 5B–5C supply the stated dictionaries, dual identities and right row-frame action. Inverse precomposition turns this into the package's left action |
| ModularCurvesPartII, current supplier | `TauCetiRoadmap/ModularCurvesPartII/README.md`: §§1.2–1.3, 2.3, 3.9, 3.14, 4.1, 4.7–4.10, 5.7, 5.13, 5.16, 6.1, 8.4–8.5, 9.13 inspected. Named comparisons exist at :2679 and :2703. Cyclic boundary filter, domains and ψ(m) multiplier explicitly supplied at :3062; ψ(4)=6 rather than 7 |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md`: §§0.8–0.9, 0.11, 1.17, 3.2, 4.11–4.13, 5.1–5.3, 5.9–5.10. Projective quotient at :2656 keeps Noetherian base and invariant sections; curve normalization at :5643 requires finiteness; finite-type field models qualify. R02 concerns the separately requested Bertini extension |
| AlgebraicCurves, main | `TauCetiRoadmap/AlgebraicCurves/README.md:475`, `:527`, `:571`, `:719`, `:1085`: Layers 3–5, 7, 12A–12E. Constants, separability and smooth proper geometrically connected hypotheses are satisfied here. Norm/principal-divisor and scheme/function-field comparison routes are owned there |
| FuchsianOrbifolds, main | `TauCetiRoadmap/FuchsianOrbifolds/README.md`, Layers 0–5: effective actions, local cyclic charts, polygon/area, cusp-width and branched-cover inputs. Additional marked curvature −1 identities remain declared gaps. The native Tau Ceti disc distance uses curvature −4, so the requested curvature −1 adapter is substantive |
| ComplexKahlerGeometry, main | `TauCetiRoadmap/ComplexKahlerGeometry/README.md`, K3 and K6.1: analytic subvariety and compact integration interfaces. Requested normalization/sublevel/cusp transports and hyperbolic estimates remain gaps, not claimed implemented results |
| RiemannianGeometry, main | `TauCetiRoadmap/RiemannianGeometry/README.md:1295`, `:1404`: R7.0 uses −div grad; R8 uses the unit round sphere. Singular Friedrichs Li–Yau remains its declared gap |
| ComplexComparisonPartII, current supplier | `TauCetiRoadmap/ComplexComparisonPartII/README.md`: C−1.1–C−1.3, C1.9, C2.2, C4.1–C4.5, C5.4, C6.2. Current and analytic-cycle declarations at :3021, :3208, :3259 have the claimed names; the normalized masses for 1,z,z² are 0,1,2. Ramified finite quotients are expressly a gap; no claim that étale presentations cover z↦z² at zero |
| InverseGaloisAndArithmeticFundamentalGroups, current supplier | `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:653`, `:1266`, `:2520`: IG.0.3, IG.1.3, IG.3.1. Algebraically closed extension invariance includes nonproper finite-type schemes in characteristic zero; it does not make the corresponding characteristic-p claim |
| AbelianSchemesAndArithmeticModuli, current supplier | `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md`: A1.6, A1.8, A3.1–A3.5, A3.7–A3.8, A6.1, A6.6–A6.7, A6.20, A6.25, A6.34. Finite locally free isogenies, honest torsion, relative Hom extension and geometric twists have the cited scope |
| NeronModelsAndSemistableAbelianVarieties, current supplier | `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:729`, `:872`: §§1.3, 1.8 retain the marked generic fibre and abelian schemes over the Dedekind base; application is on the good-reduction open, not an arbitrary proper model |
| CongruenceSpectralGap, supplied open head | `TauCetiRoadmap/CongruenceSpectralGap/README.md:819`: §5.3 supplies 21/100 in curvature −1, clipped at 1/4 with empty small discrete spectrum. (21/100)(πD/3)/(8π)=7D/800 |

All eleven gap slugs occur under the corresponding named supplier and in the plan's top-level gaps. None has supplier `none`. Their absence from current suppliers is not a finding. The surface gap's scope/minimality defect is R02. The previously settled F02 in `packages/GeometricFreyMazur/reports/FIX-PKG-GeometricFreyMazur~3.md` is not re-raised: the finite-group quotient comparison is now an explicit contract.

Ownership searches used the roadmap service, main/Completed, board packages and the 39 supplied sibling checkout folders. Searches by modular quotient, gonality, signed Hecke/CM/cusp strata, cyclic surface resolution and actual torsion objects found no second owner of the package's deep results or duplicate fully qualified Lean names. Generic group/current/quotient/curve constructions have the suppliers above. `packages/ModularCurvesPartIII/design/README.md:3` is explicitly an import index assigning its mathematics to GeometricFreyMazur; it is not an independent competing plan. The ArithmeticDynamics package's dynatomic-gonality reference concerns a different object. Unlisted open heads were not independently discovered or treated as authorized suppliers; service-wide matches were used only as ownership leads.

The read-only dependency check returned exactly:

```text
depcheck: 56 roadmaps, 644 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No merge-order change is proposed.

### Every numbered target and the additional conventions

| Statement | Instances and computed values | Result/change |
|---|---|---|
| Conventions: gonality | k(t): degree set contains 1 and excludes 0, inf=1; identity k/k: set empty, inf=0; genus-one and hyperelliptic proper models: minimum 2 | FunctionField excludes empty case |
| Conventions: frames | At p=7, squares={1,2,4}; det diag(1,3)=3 and det 2I=4; inverse left action gives φh⁻¹g⁻¹=φ(gh)⁻¹ | Both component and action directions agree |
| Conventions: currents/areas | f=1,z,z²: masses 0,1,2; weight 2 gives integral 2; a(r)/r²→π; diagonal at g=3 has Deg=8, area=16π | Normalizations agree |
| §0.1 | At p=5, −1=4 square; p=7, −1=6 nonsquare; −I scalar has trivial projective class | Two component conjugation rule agrees |
| §0.2 | Generic fixed-pairing fibre at p=7: 7(49−1)/2=168; full two-component source has twice this; composition of common frame changes is φ₂g⁻¹gφ₁⁻¹=φ₂φ₁⁻¹ | Source components correctly distinguished |
| §0.3 | Gaussian lifts give (i,i) versus (i,−i); mixed orders have gcd(2,3)=1; Eisenstein other root=−1−t | Lie characters rather than coarse tangent signs |
| §0.4 | p=7: (7−1)/2=3 cusps share one inertia line; diagonal inertia=7; distinct inertia lines intersect in order 1 | Membership distinguishes nonsingular cusp pairs |
| §0.5 | Ordered types 1,2,3,7: mixed gcds=1; equal-type common subgroups give orders 2,3,7 | All sixteen pair types covered |
| §0.6 | ψ(1,4,6,9)=1,6,12,12; σ₁(4)=7; dual composition [m] is scalar on p-torsion | Cyclic/full distinction retained |
| §1.1 | Angle sum at p=7 is 41π/42<π; p=5 is 31π/30>π; orbifold deficit 1/42 times deck 168 gives genus 3 | Small primes excluded |
| §1.2 | b(1−b)=sin²θ, hence det U=cos²θ+sin²θ=1; tr SU=1; p=5 square-root input≈−0.381966 | Hyperbolic domain required |
| §1.3 | p=7 gives [[8,21],[35,92]], det=736−735=1, tr=100; p=11 gives [[23,33],[154,221]], det=5083−5082=1, tr=244; coefficient=27/(4π²)>0 | Both residue classes survive asymptotically |
| §1.4 | I+pA determinant gives tr M=2−p²det A; p=7 minimum absolute hyperbolic trace=47; half-length=arcosh(47/2)≈3.8497 | Radius/length factor retained |
| §1.5 | p triangle angles sum π; 2p sum 2π; two marked cusps iy and i/y have distance 2log y | R01 |
| §1.6 | r→∞: tanh²(r/2)→1; r→0: lower coefficient→0; r=1 length factor coth(1/2)≈2.16395 | No global compact isometry |
| §1.7 | Rb−Rs=(log p)/4; each deep visit costs (log p)/2; L≤4log p+O(1) permits O(8) visits, not necessarily one | Repeated-visit route consistent |
| §1.8 | p=101,y=.5: q-radius≈.969374 and disc-model radius≈4.163618; heights 1,.25 give radii≈3.470713,4.856705 | Containment gives upper bound, not equality of compact distances |
| §2.1 | All-ones M: h(M)=1, h(M²)=2=2h(M)²; SL matrix [[2,1],[1,1]] and inverse both height 2 | Existing entrywise norm |
| §2.2 | For [[2,1],[1,1]], sum squares=7, cosh d=3.5; height 2≤√7; nonsquare determinant is outside PSL image | Component restriction necessary |
| §2.3 | U^k fixes cusp lift, so I and U^k give displacement 0 with heights 1 and max(1,abs(k)) | Existence does not give uniqueness |
| §2.4 | g∈H gives distance 0 and M=I; left/right ambiguities are respectively σ and σ′ | Both stabilizer factors retained |
| §2.5 | δ=.1 gives 8δ=.8<1; δ=.2 gives 1.6>1; nonzero multiple p has size≥p | Corrected smallness forces vanishing |
| §2.6 | cosh midpoint radius=cosh(D+R)/cosh D≤e^R; at D=3,R=2 radius≈2.68608≤arcosh(e²)≈2.68854 | Lens bound direction correct |
| §2.7 | At a cusp and small δ, nearest-cusp count=1; outside all balls count=0; δ=.01 exponent=.24 | Conditional checks of count |
| §3.1 | Projective pencil diag(a,b) over F5 has 4 invertible points; primitive diag(1,−1) has determinant −1 before and after multiplying by −1 | Rank and sign tests agree |
| §3.2 | Gaussian determinant-one units=4; Eisenstein=6; Mx=My=I gives kernel dimension 2 and coincident points | Distinctness excludes control |
| §3.3 | Gaussian 1+i has norm 2; conjugating second Lie character sends (i,i) to (i,−i) | Ordinary and conjugate conclusions separated |
| §3.4 | Conjugate-diagonal tangent in conjugation-compatible charts spanned by (1,1),(i,−i); i(1,1)=(i,i) outside that real plane | Totally real, no complex divisor class; R03 adds discriminating Checks |
| §3.5 | Gaussian opposite lifts differ by [2i], degree 4; p>3 implies gcd(p,4)=1 | Cannot be zero on E[p] |
| §3.6 | Over F7, fixing 0 and ∞ leaves 6 scalings, fixing 1 leaves 1; p=13,a=5 gives a²=−1 and minimum positive uv with u+v≡0 is 12 | Signed branch necessary |
| §4.1 | Matched distances 3R/2 have midpoint distances 3R/4<R; Δ1 dimension 2 versus one-equality locus dimension 3 | Factor two and codimension agree |
| §4.2 | [[2,1],[1,1]] eigenvalue (3+√5)/2≈2.618; integral powers with height≤101 are −5,…,5 (next height 233); unipotents give 203 values | Reduced algebra condition discriminates |
| §4.3 | p=101, repeated diagonal bicusp: exactly 101 fixing deck elements and distance 0 to SBC×SBC; threshold=4.61512 C | Realization of cusp alternative |
| §4.4 | p=7,d=1,R=.5: displacements 0,.980099,1.645565,1.961531,1.961531,1.645565,.980099; count=3; d=0 count=7 | Identity and zero denominator handled |
| §5.1 | gX=3 diagonal has Deg=8; double parametrization Deg=16 and multiplicity 2; constant coordinate degree=0 | Weighted projection convention |
| §5.2 | d=4 sum ψ=8≤14<64; choose δ1=.01,δ2=.001: exponents −.002,−.97; zero cycle gives 0≤0 | Positive decay compatible with scale choice |
| §5.3 | ε=.1,R=log p: p sinh ε/sinh R→2sinh .1≈.200334; reciprocal grows with p | Source reciprocal is reversed |
| §5.4 | δ3=.01,δ1=.001: exponent −1−.02+.003=−1.017; p-weight exponent −.017 | Required stronger decay |
| §5.5 | q=t² gives density drdθ/(r log²r), mass 2π/(−log ε)→0; constant cusp coordinate=0; weight2 doubles mass | Integrable and atom-free |
| §5.6 | p=7: g=3,s=24, ratio7; p=11: g=26,s=60, ratio2.2; exact excess=6/(p−6) | Uniform constant may cover small prime 7 |
| §5.7 | z↦2z: abs(2dz)²/(2y)²=abs(dz)²/y²; z↦z/2 gives same; Hecke projection yields diagonal component | Correct metric and exclusion |
| §5.8 | Generic D in T1×T1: mult/Deg=3p/(p−6), at p=7 gives21 and limit3; valid zero cycle has both sides0 | Non-Hecke condition excludes counterexample |
| §6.1 | n=1 quotient group size1; n=2 distinct-point fibre size2, repeated-point fibre size1; both cycle lengths2 | Scheme multiplicities retained |
| §6.2 | t↦t^q on P1 has image normalization gonality1≤1; hyperelliptic quotient has gonality1≤2 | Generic degree need not be1 |
| §6.3 | Hyperelliptic pencil has generic cycle [b1]+[b2], ramified cycle2[b], degree2 in both; n=1 map equals f | Flat cycle, not reduced fibre; R03 adds a nonbirational control |
| §6.4 | n=1 W=G and no permutations; local z↦z² has normalization disc, quotient degree2 and inertia2 | Normalization does not remove ramification |
| §6.5 | n=1,2,3 pair sums=0,D,2D; excluded T1×{a} at p7 has slot degrees8,0 and pair degree8 | Weighted sums agree |
| §7.1 | n=2 element (g,g⁻¹;(12)) fixes (a1,a2) iff a1=ga2; second equation is then identical | Both X coordinates matched |
| §7.2 | Two order7 slots have cyclic exponent lcm(7,7)=7; n2 bound6·2!·7=84; away from SBC bound12 | No spurious p² |
| §7.3 | mult=D/p² gives p mult=D/p; mult=D/√p gives √pD | p-weight necessary |
| §7.4 | Squaring P1: −2=2(−2)+2; largest projection with 2n equal degrees gives D/(2n)=d(2gX−2) | Sign and 2n sharp |
| §7.5 | N1: no positive gonality<1; normalization H1 has image H1 and gonality1 | Boundary consistent |
| §8.1 | D1 yields (21/100)(π/3)/(8π)=7/800; round-sphere substitution yields21/200, twelve times larger | Numerical normalization verified |
| §8.2 | p2: S3/A3 index2; p3: SL2/Q8 index3; p5 Borel index6; whole group index1<5 | Properness and small primes verified |
| §8.3 | N2,p227:1589<1600; p229:1603>1600; proper index≥p gives gonality≥7p/800 | Strict threshold matches |
| §8.4 | F5 D=diag(2,3), A swaps: AD=[[0,3],[2,0]]=−DA; full SL2 image kills characters; kernel sign forces2A=0 | Surjectivity and invertibility necessary |
| §9.1 | Legendre j(2)=1728,j(3)=21952/9; Ψ=−I has projective class I; det diag(1,3)=3 nonsquare mod7 | Nonconstant map and retained scalar |
| §9.2 | h=2f gives degree4deg f, h=−f gives deg f; E[2] has4 elements and is noncyclic | Primitive cyclic h has scalar±1 |
| §9.3 | Cyclic quotient π of degree m gives f[p]=1·Ψ; m1 identity degree1 | Torsion comparison retains scalar |
| §9.4 | p5: f[p]=−f[p] implies2f[p]=0 contradicting invertibility; p2:1=−1, no contradiction | Oddness needed |
| §9.5 | Extension sends ideal0 to0 and unit ideal1 to1; finite model has finite transcendence degree r even when cardinality k exceeds C | Uniformity does not assume global complex embedding |
| §9.6 | Constant E over C(t) has image size1 but transvection [[1,1],[0,1]] determinant1 and orderp; excluded nonconstant-j premise | Full image claim nonvacuous |
| §9.7 | Identity generic isogeny extends as identity degree1; twist sign−1 stays visible on odd torsion | Original-base conclusion retained |
| §9.8 | C(t), Legendre, N2: gonality1<2; identity e and f; at P0 equivariance0=0; arbitrary P admits Q=σP since pσP=σ0=0 | Graph formulation genuinely equivariant |
| §10.1 | g<N implies g+1≤N<N+1; g0,N1 gives1<2 | Threshold enlarged correctly |
| §10.2 | Nodal rational image: normalization genus0 and gonality1; genus1 gives gonality2<3 | Arithmetic genus not substituted |
| §10.3 | 3/1=[3],3/2=[2,2],7/6=[2,2,2,2,2,2],2/1=[2] | Exceptional squares −3,−2,… agree |
| §10.4 | Exceptional image dimension0; nonexceptional rational strict transform image dimension1 with normalization genus0 | Two cases exhaustive |
| §10.5 | C²=−2,C·E=1 gives−1; intersection2 gives2; exceptional 1/2 chart square−2 | Later centres need not start at−1 |
| Relative point-ball Green identities | h(s_t)=2log cosh(t/2), h′(s_t)=sinh²(t/2), ds_t/dt=2/sinh t; t1 gives.240229,.271540,1.701836 | Area/potential constants agree |
| Relative point-ball stronger negative control | Line(z,z/2), q1/4:V/a=1.2; q3/4:V/a=14/13≈1.076923 | Stronger monotonicity false; not used |
| Surface gap | Double plane Cartier section retains ε≠0,ε²=0; two disjoint planes yield2 connected components | R02 |

### Supplier-gap boundary tests

| Gap | Computed boundary or convention witness | Result |
|---|---|---|
| finite-group-quotient-analytification | Sign on P¹ gives w=z², local degree 2, derivative 0 at 0; trivial action on dual numbers gives invariant ring dimension 2, not reduced dimension 1; z³ downstairs gives w³, both composites z⁶ | Correctly retains ramification, nilpotents and equivariance |
| analytic-cycle-current-transport | Normalization t↦(t²,t³) has local multiplicity 2; coefficient 3 makes local multiplicity 6; normalization integration is weighted 3, not reduced 1 | Weights and branch map distinguished; declared transport remains required |
| hyperbolic-cycle-volume-comparisons | Coordinate line through 0 has V(r)=a(r); transverse curve (z,−z) in the disc product has tube volume 2a(r) and intersection 1, matching 8πsinh²(r/2); sinh 0=0 while cosh 0=1 | Positive-radius condition avoids conjugate denominator 0; ordinary components excluded |
| relative-point-ball-volume | For line through 0, V(1)/V(3)=sinh²(.5)/sinh²(1.5)≈.059892, while 2exp(−2)≈.270671; zero cycle gives 0≤0; weight 3 multiplies both sides by 3 | Stated constant/linear loss admits examples; stronger monotonicity is refuted in target table |
| hyperbolic-trigonometry | For diag(e,e⁻¹), trace 2cosh1, translation length 2; half-turn about centre gives D=2d and sinh(D/2)=sinh d; coincident lens centres give D=0 and ball radius R | No elliptic trace is substituted into hyperbolic formula; marked curvature matters |
| gonality-norm-and-base-change | P¹ has gonality 1; genus-one curve has 2; degree-two hyperelliptic map to P¹ gives 1≤2; Frobenius on P¹ in characteristic p has degree p but both gonalities 1 | Statements are geometric, not restricted to separable domination or characteristic zero |
| singular-metric-li-yau | Unit round sphere: λ*=2, area=4π, gonality=1, hence both sides 8π; multiplying metric by c gives λ*=2/c, area=4πc, same product | Constant and conformal scaling correct; singular cutoff extension remains gap |
| free-locus-and-relative-cycle | Sign on P¹ is free off 0,∞, and z² has derivative 2z≠0 there; trivial nontrivial-group action has empty free locus; degree-two ramified fibre length=2, not 1 | Free-locus qualifier and fibre lengths distinguish constructions |
| curve-extension-and-normalization | Identity A¹→P¹ extends to identity P¹, degree 1; nodal rational curve normalization has genus 0 although arithmetic genus is 1 | Proper target and normalization genus are essential |
| cyclic-surface-resolution-and-contraction | 1/3(1,1) gives chain [−3]; 1/3(1,2) gives [−2,−2]; double plane's section retains ε²=0 with ε≠0 | Resolution cases correct; Bertini request requires R02 |
| surface-contraction-intersections | Contracting E with E²=−1 changes C²=−2 and C·E=1 to −1; C·E=2 changes it to 2 | Plus sign and square correct; no premise that all future centres initially have square −1 |

## Not verifiable

- **BLR90 text access:** §1.2 Proposition 8, printed p.15, and §1.4 Proposition 2, printed p.19, remain the settled uncertified locators. They were not fetched or re-requested. The operative Néron/abelian-scheme contracts were verified in the named suppliers.
- **Formal proof completion:** no Lean command or build was run under the read-only review restriction. The supplied elaborated types were inspected for all three declarations; source-level pin inspection is not a new elaboration certificate. The two admitted headline theorems are mathematical targets, not completed library results.
- **Declared supplier implementations:** the eleven contracts are not implementation certificates. They were audited as stated contracts, including the defect R02, and their present absence was not treated as an ownership finding.
- **Unlisted open work:** direct sibling-file ownership checks cover all 39 supplied checkout folders. Other open work was visible only through roadmap-service ownership searches; unprovided checkouts were not independently opened or used as dependency authority.
- **BTE typography:** its cached text is OCR. The reversed sinh ratio at BTE lines 129–131 is corroborated by the immediately following p⁻¹ conclusion and monotonicity argument. Other OCR-garbled symbols were not themselves reported as source mistakes.

## Source issues

- **Error** in BT16 at §2.2, printed p.715 (BT16 line 265): the source says scalar-framed full level gives fine moduli; it should be coarse moduli, since inversion still fixes every projective frame; affects a stated result.
- **Misprint** in BT16 at §2.5, printed p.716 (BT16 line 329): the source says the auxiliary polygon map has component coordinate in ℤ/n; it should be ℤ/(pn), mapped by reduction to ℤ/p; affects a stated result.
- **Misprint** in BT16 at §2.5, printed p.717 (BT16 line 338): the source says the power map on the p-gon has component coordinate in ℤ/n; it should be ℤ/p; affects a stated result.
- **Error** in BT16 at §2.5, printed p.717 (BT16 lines 339–346): the source says the cyclic correspondence includes all displayed divisor branches and has degree σ₁(n); it should be filtered for cyclic composite kernel and have degree ψ(n), giving 6 rather than 7 at n=4; affects a stated result.
- **Misprint** in BT16 at §3.1, printed p.718 (BT16 line 387): the source says the cusped radius is the full minimum filling-nontrivial length; it should be half that length to match the radius convention and Lemma 5; affects a stated result.
- **Gap** in BT16 at Lemma 5, printed p.718 (BT16 lines 411–415): the source says its trace-minimal witness supplies the upper bound after cusp filling; it should be replaced by a witness surviving filling, since U(p)L(−p) maps to the identity; affects the proof.
- **Error** in BT16 at Corollary 8, printed p.720 (BT16 lines 472–473): the source says the shortest loop has length at most 2log p+O(1), hence visits at most one deep cusp; it should be bounded by 4log p+O(1), with a separate bounded-repeat-visit argument; affects the proof.
- **Misprint** in BT16 at Proposition 12(a), printed p.724 (BT16 lines 637–638): the source says δ<1/4 makes entries O(p^(8δ)) smaller than p; it should be δ<1/8, with the implied constant absorbed by sufficiently large p; affects the proof.
- **Misprint** in BT16 at Proposition 14 proof, printed p.726 (BT16 lines 702–706): the source says the commuting subgroup is the commutator subgroup; it should be the centralizer, distinguished from the normalizer; affects the proof.
- **Error** in BT16 at Lemma 15, printed p.726 (BT16 line 727): the source says the conjugated elliptic lift always squares to −1; it should be t²=−1 for Gaussian type and t²+t+1=0 for the displayed order-three lift; affects the proof.
- **Error** in BT16 at Proposition 14 and Remark 16, printed pp.725–727 (BT16 lines 681–685, 747–749): the source says both CM signs lie on ordinary small Hecke curves and anti-Heegner points consequently repel; it should be ordinary Hecke for the positive sign and conjugate Hecke for the negative sign, as in BTE Proposition 2.1; affects a stated result.
- **Gap** in BT16 at Proposition 17, printed p.728 (BT16 lines 798–803): the source says a small reconstructed integral matrix has positive determinant and gives an ordinary Hecke index; it should be signed reconstruction with index absolute determinant; multiplying a negative determinant matrix by −1 does not change its sign; affects the proof.
- **Error** in BT16 at Proposition 18(a), printed pp.728–730 (BT16 lines 814–825, 850–870): the source says the rotation count is O(pR/sinh d) without an identity term; it should be bounded by min(p,1+Cp sinh R/sinh d), with count p at d=0; affects a stated result.
- **Misprint** in BT16 at Proposition 18 proof, printed p.731 (BT16 lines 917–918): the source says the cusped metric is smaller than the compact metric; it should be h_X≤h_Y, as used by the subsequent inequality and Proposition 7; affects the proof.
- **Gap** in BT16 at Lemma 22 proof, printed p.734 (BT16 lines 1051–1111): the source says the two strict-maximum regions yield the claimed point multiplicity contribution; it should be supplemented for curves with μ₁=μ₂ identically: both strict-region integrals vanish although intersection multiplicity can be positive; affects the proof.
- **Gap** in BT16 at Proposition 26, printed p.737 (BT16 lines 1219–1222): the source says a p^(−1+3δ) estimate proves the required p-weighted decay; it should be a bound p^(−1−η) with η>0, supplied by the stronger tube argument in BTE Proposition 4.2; affects the proof.
- **Error** in BT16 at Proposition 27, printed pp.737–738 (BT16 lines 1224–1228): the source says excluding big-diagonal containment suffices for multiplicity decay for every curve; it should be restricted to non-Hecke slot projections: suitable curves in T₁×T₁ give ratio 3p/(p−6), tending to 3; affects a stated result.
- **Gap** in BT16 at Proposition 27 proof, printed p.739 (BT16 lines 1280–1339): the source says a diagonal-tube relative-volume estimate supplies the point-ball shell bound; it should be justified by a separate point-ball estimate on weighted projected cycles; affects the proof.
- **Error** in BT16 at Theorem 29 proof, printed p.742 (BT16 lines 1448–1449): the source says negligible ramification gives 2g(C)−2=o(Deg C) as an equality; it should be 2g(C)−2=−2deg α+Ram(α)≤o(Deg C), which suffices for the contradiction; affects the proof.
- **Misprint** in BTE at Proposition 4.1 proof, printed p.3 (BTE lines 129–134): the source says the small-to-large conjugate-tube ratio is sinh(R)/sinh(ε); it should be sinh(ε)/sinh(R), which decays like p⁻¹ when R≈log p; affects the proof.
- **Gap** in BTE at Proposition 4.2 proof, printed p.4 (BTE lines 155–168): the source says the sum of bicusp-ball volumes is bounded by the containing diagonal-tube volume without overlap cost; it should be multiplied by the cusp-overlap bound p^(O(δ₃)), with δ₃ chosen small before p; affects the proof.
- **Misprint** in BT16 at Proposition 14 proof, printed p.725 (BT16 lines 688–698): the source says the Gaussian projective stabilizer has order four; it should be order two in PGL, while its chosen SL lift has order four; affects the proof.
- **Misprint** in BT16 at Proposition 14 proof, printed p.727 (BT16 lines 745–746): the source says both elliptic types use the Gaussian matrix and determinant a²+b²; it should be Gaussian norm a²+b² or Eisenstein norm a²−ab+b², according to the chosen elliptic lift; affects the proof.
- **Misprint** in BT16 at Proposition 18 proof, printed p.730 (BT16 lines 876–882): the source says matrices bounded by p^(6δ) form a larger set than those bounded by p^(16δ); it should be an exponent at least 16δ, with the subsequent small-δ restrictions adjusted; affects the proof.
- **Gap** in BT16 at Proposition 18(b) proof, printed p.731 (BT16 lines 904–916): the source says the reconstructed determinant is a positive Hecke index whose square root is real; it should be split by determinant sign, with a conjugate Hecke locus in the negative case; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5c5e1c726661377bfe05162ecf4b7902a283ef9f", "job": "RT-GeometricFreyMazur~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
