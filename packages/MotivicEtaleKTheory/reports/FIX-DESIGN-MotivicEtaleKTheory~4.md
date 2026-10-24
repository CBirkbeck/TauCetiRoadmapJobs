# MotivicEtaleKTheory design repair

The supplied file contains two reviews. Their identifiers overlap; the reviewer named under each heading disambiguates all eight findings. Locations below refer to `packages/MotivicEtaleKTheory/design/README.md` and its matching `packages/MotivicEtaleKTheory/design/plan.json` unless another repository-relative file is named.

## F01 (P3) — applied

Codex review. Missing support-product prerequisite → §4.2 in §5.1’s Needs and target prerequisites. Added the transverse coordinate-divisor Check, with origin coefficient +1, and the disjoint-support value 0. BF line 1619 supplies the fundamental-class product input. The same dependency audit made §2.4’s tensor-pairing inputs explicit.

## F02 (P3) — applied

Codex review. Layer 6’s EnhancedDerivedSheaves summary omitting E0.6 → summary including E0.6. The §6.2 target already names this input. EnhancedDerivedSheaves §E0.6 constructs the dg nerve and its homotopy-category comparison. The non-strict-square witness still gives (1,1) with differential (0,0), versus the wrong-sign value (0,2).

## F01 (P2) — applied

Claude review. Unqualified products over ℤ → explicitly supported pullbacks, pairings over one regular base, and external pairings when the product base satisfies the regularity hypotheses. Updated §2.0a’s statement/API in both files. Added the Gaussian-integer singular-product Check: local dimension 1 versus cotangent dimension 2. SchemeKTheoryOperations §6.8 imposes precisely this product-domain condition.

## F02 (P3) — applied

Claude review. Unmarked relativity equivalence → equivalence intertwining every ψᵃ and identifying full-cube generalized pieces with simultaneous supported eigenspaces. Updated §2.0a, its proof route and degree-one Check, and the ColemanIntegration consumer contract in both files. SchemeKTheoryOperations §§6.8–6.9 supply naturality and supported eigenspaces; ColemanIntegration §L3.Fa.2 requests this weightwise form.

## F03 (P3) — applied

Claude review. §2.1 depending on universal-class construction §2.0b → dependency deleted in README and plan. The inverse cycle-map construction remains; §2.2 still depends on §2.0b for their identification. Levine94 line 1197 and line 1210 give the cycle-to-K route. All four §2.1 Checks retain their values without the universal-class construction.

## F04 (P3) — applied

Claude review. Later regulator detecting the degree-two sign → Layer 2 uniformizer-last localization residue detecting it, with values [2] and −[2], and valuations +1 and −1. The regulator becomes a downstream recomputation. Explicitly distinguished this residue from the native right-linear boundary, whose value is −[2]. KTheoryFiniteLocalFields §3.0a and GeneralAlgebraicKTheory §8.13 fix these adapters.

## F05 (P3) — applied

Claude review. Product citations apparently asserting character compatibility → Levine94 line 2226 attributed only to the cycle product, and BF line 961–997 to construction/degree-zero agreement. Character compatibility and the Newton coefficient remain local proof obligations with explicit tensor-pairing inputs. Updated both locators and manifest attributions; added the ℙ¹ product Check, 0=0.

## F06 (P3) — applied

Claude review. Projection then inclusion asserted to be identity on D → inclusion then projection is identity on D; the reverse composite is homotopic to identity on the cone. Updated both statements and the point Check. BKK line 4063, line 4069 and line 4100 fix the domains, composites and contraction.

## Evidence and recurrence audit

All mathematical verdicts above were verified independently of either review’s acceptance. No new target or layer was introduced. The changes affect §§2.0a, 2.1, 2.2, 2.4, 3.3, 5.1, the Layer 6 summary, the ColemanIntegration consumer paragraph, their plan entries and the BF/Levine94 manifest attributions.

| Finding or repeated pattern | Evidence and extent of the search |
| --- | --- |
| Supported products and missing edges | BF line 517 defines the support complex; BF line 1619–1623 identifies the product of fundamental classes. §5.1 uses the existing §4.2 product, so its new edge points from Layer 4 to Layer 5. The same audit found §2.4’s route used tensor pairings without naming them directly: its Needs/prerequisites now name §2.0a, §1.4, GeneralAlgebraicKTheory §7.4 and SchemeKTheoryOperations §6.8. |
| Regular-base products | SchemeKTheoryOperations §6.8, product paragraph, requires the external product scheme to remain in its regular ample-family scope. Set π=1+i and v=t−i. In ℤ[i,t]/(t²+1), the relation is v(v+2i)=0, with 2i in (π²). At (π,v) the relation has no linear part, giving two cotangent generators over 𝔽₂, while the hypersurface local ring has dimension 1. Over a common base, the paired open lies in X×□ⁿ⁺ᵐ, which is smooth over regular X. All other external cycle products in §§1.4, 2.4, 4.1, 5.4 and 7.3 are over the stated field, where their smooth product stays in scope. |
| Generalized versus simultaneous weights | Levine94 line 695–710 constructs operations and distinguishes generalized characteristic subspaces. Levine94 line 719–736 proves the finite-filtration argument, which alone does not establish semisimplicity. SchemeKTheoryOperations §6.9 separately supplies simultaneous weights on supported K of regular bases. Pullback and both face restrictions commute with Adams operations by its §6.8; the diagonal fiber and its ordered difference therefore give an equivariant relativity equivalence. Checked every weight claim in §§2.0a–2.4 and the ColemanIntegration paragraph: arbitrary relative opens retain generalized pieces; the new eigenspace conclusion is restricted to full cubes. |
| Construction versus comparison prerequisites | Levine94 line 1197–1269 provides the geometric cycle-to-K comparison underlying the inverse construction. BF line 961–997 constructs the universal-class character instead. Only §2.2 identifies these two constructions; its §2.0b edge is retained. No other inverse-character prerequisite was deleted. |
| Residue versus regulator sign witnesses | KTheoryFiniteLocalFields §3.0a, motivicToK, explicitly marks the diagonal boundary as uniformizer-last. Its §3.2 formula gives residue 2 for {2,t} and 2⁻¹ for {t,2}. GeneralAlgebraicKTheory §8.13 gives δ₂=−B₂. Thus the new §2.2 Check distinguishes the two loop orders without Layers 3–7. Recomputed the corresponding logarithmic witnesses in Conventions, §§4.1–4.2, 7.3–7.4; all give the positive-circle period 2πi log 2 in the stated order. |
| Product attribution | Levine94 line 2203–2240 gives the higher-Chow product and its functoriality, not the character-product formula. BF line 948–997 gives universal characters and degree-zero agreement. The local route compares universal tensor pairings, uses §2.2’s identification, and descends the common cycle pairing; K₀ uses the splitting principle. The same attribution is now explicit in the README, plan locator and the two source entries. Other uses of Levine94 Theorem 5.2 concern cycle products and need no change. |
| Composite order | BKK line 4063–4072 gives projection cone→D and inclusion D→cone; BKK line 4100 gives the strict D composite and the homotopy for the cone composite. Searched all inclusion/projection and identity claims, including §§1.1, 3.4, 4.2, 5.3–5.4 and 6.1. Only §3.3 reversed the domains. Its API and later transfers already use the two maps in their proper directions. |
| Dependency summaries | Compared all seven layer summaries with their individual Needs lines, including the newly explicit §2.4 inputs. The only additional summary repair is Layer 6’s E0.6; Layers 2 and 5 already cover the product inputs. E0.6 resolves at `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:259`, with the homotopy-category comparison at line 300. |

The source manifest still has exactly ten works under their original keys: seven certified cached texts, Bloch86 and Beilinson85 uncertified, and Levine98 waived. No additional source is needed for these repairs; none was fetched or requested. Bloch86 §7 remains an uncertified locator for the arbitrary-field universal-class comparison, rather than evidence claimed to have been read. No settled reference was reopened.

## Supplier, ownership and pin audit

The main checkout is `72d2b66f`. Read the shape and relevant conventions of `TauCetiRoadmap/AlgebraicTopology/README.md`, `TauCetiRoadmap/ComplexKahlerGeometry/README.md` and `TauCetiRoadmap/DifferentialGeometry/README.md` before editing. Used `roadmaps list`, object searches with `roadmaps grep`, and `roadmaps show` for the new-roadmap supplier heads. Existing roadmaps were read on main, rather than at revision pull requests.

| Supplier copy verified | Sections resolved and consumed |
| --- | --- |
| GeneralAlgebraicKTheory `e0552fe` | §§3.12, 4.6, 4.8, 4.14, 6.3, 7.4–7.7, 8.12–8.13: K models, resolution, dévissage, localization, pairings and the right-linear/last-slot boundary dictionary. |
| SchemeKTheoryOperations `88dbd5a` | §§2.1–2.6, 3.1–3.6, 4.3, 6.7–6.9, 7.1–7.3: perfect/supported K, pullback, oriented localization, classifying sheaves, operations, supported eigenspaces and ordinary characters. The product clause and finite projector formula were read at §§6.8–6.9. |
| KTheoryFiniteLocalFields `afe02e8` | §3.0a’s motivicCycles and motivicToK, §6.10’s diagonalChernMilnor: shared integral cycles, products, localization, last-slot diagonal residue, tower and Chern factors 1,−1,2. |
| MotivesAndAlgebraicCycles `79b02f6` | §§4.7–4.8, 4.8a, 4.14, 4.17–4.18: shared cycles, relative specialization and motive adapters. Their separate perfect-field/resolution hypotheses remain attached to categorical reformulations. |
| ResolutionOfSingularitiesCharacteristicZero `bf45c86` | §§5.1–5.6, 6.1–6.4: resolution outside the given smooth open, compactification and SNC coordinates. Proper compactifications need not be projective. |
| ComplexComparisonPartII `2d50a88` | §§C−1.1, C−1.4, C5.1, C5.3–C5.6, C6.0: analytification, proper geometric Hodge theory, currents and normalization, logarithmic forms, regularSingularDeRhamComparison and stratification. The trivial extension has residues 0, within the non-positive-integer condition. |
| SchemeAndStackFoundations on main | §§2.1–2.2, 4.12, 4.17, 5.1–5.8: cohomology, domination, SNC geometry, cycles, intersections and geometric Chern classes. |
| EtaleCohomologyFoundations on main | §§G.1–G.3: compactification objects, existence and coherent common refinements; no étale coefficient comparison is imported. |
| EnhancedDerivedSheaves on main | §§0.1–0.4, E0.6, E1.4, E2.6: enhancements, replacements, tensor, coherent diagrams, dg nerve and descent, including point-site specialization. |
| DifferentialGeometry on main | Layers 0–1 and 5–9: forms, integration, Stokes, de Rham and duality. Its smooth approximation does not supply either declared closed-jet gap. |
| ComplexKahlerGeometry on main | K1–K2: realification/type calculus, transported orientation and Dolbeault operations; ComplexManifolds Milestones 1–2 supply the underlying complex orientation. |
| AlgebraicTopology on main | Stages 2–3, Stage 6 items 1–4 and Stage 8 item 2: relative theory, products, duality and the simplicial-abelian Moore comparison. |
| Completed/HodgeStructures on main | Linear pure/mixed Hodge structures and strictness, with the actual pinned Tau Ceti declarations read separately. |

Object searches covered supported multi-relative cubes, Adams weights, higher Chern operations, higher Chow complexes, logarithmic Dolbeault/Deligne complexes, support resolutions, Whitney extension and flat ideals on main, indexed open roadmap heads and board README/plan files. The named sibling roadmaps were included in those searches. No new construction or declaration name was introduced.

The existing ownership allocation remains: ColemanIntegration §L3.Fa.2 (`ae078af`) consumes the earlier §2.0a construction, and Polylogarithms §5.2 (`4696a1a`) consumes the shared support-resolution ingredients. Their special symbols, syntomic theory, D_AH/β and explicit current comparisons remain there. This repair does not duplicate their constructions or add a reverse supply edge. Other Dolbeault roadmaps concern manifold calculus or elliptic analysis, rather than the geometric logarithmic image algebra here.

Rechecked consumer locators against those heads and the readable board designs: Polylogarithms §§5.2–5.3, 5.9–5.10, 5.13, 5.17; ColemanIntegration §§L3.Fa.1–L3.Fa.3 and L3.Fc.1; ZagierConjecturePolylogarithms M.8; MixedHodgeModulesAndIrregularHodgeTheory’s logarithmic direction; and the excluded M.1/M.4/M.5a/M.5d/M.7/M.8 labels in the six board designs named in the downstream ledger. K2SymbolsBrauer §10.29 resolves at its indexed head. The supplied board heads for PeriodsAndSpecialValues (`9f14c68`, §PS.3.2a) and KatoEulerSystems (`725fd74`, its Chern convention and archimedean comparison) were read directly as Git objects. Their quotient parity and ordered unit form agree with §§7.1 and 7.4. BorelRegulators is a consumer direction specified in its board target, not a supplier.

Both library HEADs equal `lake-manifest.json` and the plan pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Pinned declarations opened | Native content and boundary of the claim |
| --- | --- |
| `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44`, AlgebraicCycle; line 69, map | Locally finite coefficient functions, with no face-admissibility or codimension predicate; map requires a quasi-compact morphism and dimension weights. |
| `Mathlib/AlgebraicGeometry/Scheme.lean:40`; `Mathlib/Algebra/Category/ModuleCat/Basic.lean:56` | Native scheme and module carriers. Scheme does not contain smoothness/separatedness hypotheses; ModuleCat does not require finite dimension. |
| `Mathlib/Algebra/Homology/HomologicalComplex.lean:59`, line 72; `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87` | Shaped square-zero differentials and localization of integer cochain complexes. The latter does not replace enhanced coherent diagrams. |
| `Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57`, line 261, line 269 | The source-shift-first cone; its source differential has a minus sign. Shift and negate the second coordinate to obtain the stated pair fiber. |
| `Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean:167` | Simplicial objects versus natural-number chain complexes in an abelian category; the homotopy interpretation is a separate supplier theorem. |
| `TauCeti/Algebra/Homology/GradedCochainComplex.lean:59` | Graded submodules with an actual homogeneous degree-one square-zero map. |
| `TauCeti/Geometry/Hodge/Structure.lean:62`; `TauCeti/Geometry/Hodge/Morphism.lean:69` | Linear Hodge data; morphisms preserve filtration and conjugation. |
| `TauCeti/Geometry/Hodge/Tate/Basic.lean:44`, line 91, line 100, line 111 | Ordinary integer lattice inclusion, weight −2p and Hodge piece (−p,−p). The geometric (2πi)ᵖ marking is additional. |
| `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72`; `TauCeti/Geometry/Hodge/Mixed/Strictness.lean:110` | Rational/complex base-change models and range(f)∩Fᵖ=f(Fᵖ) for a mixed-Hodge morphism. |
| `TauCeti/Geometry/Manifold/ContMDiffMap/WeakWhitney.lean:87` | Derivatives of an already supplied smooth map; no extension theorem for independently prescribed closed-set jets. |

Searches at these pins found no higher-Chow carrier, higher scheme-K carrier, geometric logarithmic Deligne complex or supported multi-relative Adams construction. Thus the repairs use supplier targets and native underlying algebra, without replacing the mathematical objects by arbitrary complexes or scalar conditions.

## Adversarial mathematics pass

The 89 computation rows below include a separate row for each target and each API entry. API numbers mean README bullet order, not Lean declarations. The computations were redone from the definitions; no review verdict is used as a mathematical test. “Consistent” records the result on the displayed instances, not a proof of the general target. The changed statements, new Checks and every affected sign/product witness are included explicitly.

| Statement | Instances tried | Values computed on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| Geometric scope and components | Empty scheme; point ⊔ ℙ¹; Spec ℤ₂ | Empty cycle group 0; ranks (2,1), CH¹=0⊕ℤ; ℤ₂ regular of dimension 1, admitted in §2.0a | Domains distinguished | None |
| Integer grading and coefficients | p=1,a=3; R=0; derived mod 2 | 2p−a=−1 gives 0; zero coefficients give 0; ℤ/2⊗ᴸℤ/2 gives ℤ/2 in degrees −1,0 versus ordinary tensor only in degree 0 | Consistent | None |
| Cube/simplex orientation | Γ_t; cube degrees 0,1,2; mixed (1,1) | Boundaries +[0],−[0]; J=1,−1,1; mixed cross coefficients −1,+1 add to 0 | Consistent | None |
| Shift and cone convention | General pair; fib(0→ℝ[0]) | Cone differential (−da,fa+db), transported fiber (da,fa−db); H¹=ℝ,H⁻¹=0 | Consistent with pin | None |
| Raw and adapted boundaries | Γ_t; {2,t}; reversed symbol | Raw unit boundary −[0], adapter +[0]; B₂{2,t}=−[2], δ₂{2,t}=[2]; reversed δ₂ gives −[2] | Different adapters retained | Explicit in §2.2 |
| Tate marking and quotient parity | p=−1,0,1; z=3+4i at p=1,2,3 | Nonzero powers of 2πi; πₚ₋₁(z)=3,4i,3; adding ℝ(p) changes each output by 0 | Consistent | None |
| Complex orientation | Two positive loops; exchanged order | ∮dz/z=2πi; ordered two-residue 1 and exchanged −1; periods ±(2πi)² | Consistent | None |
| Critical/form degrees | p=1,x=z z̄ | Deligne degree 1→2, ordinary degree 0→2; d_Dx=−2dz∧dz̄, value 4i on (∂x,∂y) | Consistent | None |
| Total product sign | (n,s)=(1,1),(0,1),(1,2) | (−1)ⁿˢ=−1,+1,+1; Jₙ₊ₘ=JₙJₘ remains a separate multiplier | Consistent | None |
| Whitney gap | A={0},∅,U; transverse parameter π/2 | Coefficients 1,1,2 give derivatives 1,1,4; (m!)²sin y at m=2 gives 4; empty conditions 0; zero jet has extensions 0 and exp(−1/x²) | Existence does not mean uniqueness | Retain gap |
| Flat-ideal gap | Equal sets; ∅,U; coordinate axes | I+I=I; C∞+0=C∞; φ(x)+φ(y) has zero origin jet but value e⁻¹ at (0,1), so is in the sum and outside the intersection | Analytic-set hypothesis and sum tested | Retain gap |
| 1.1 definition | Point p=0; Γ_t; p=−1 | Normalized degrees 0,1,2 are ℤ,0,0; raw groups ℤ,ℤ,ℤ; graph boundary [0]; negative codimension 0 | Consistent | None |
| 1.1 API 1 | Point in degrees 0,1 | Normalization→quotient sends 1→1 in degree 0; degree 1 gives 0→ℤ/ℤ=0 | Consistent | None |
| 1.1 API 2 | ℙ¹→point; inseparable extension degree 2 | Fundamental pushforward 0 by dimension drop, target codimension −1; point restriction then transfer is ×2 | Consistent | None |
| 1.1 API 3 | Degrees 0,1,2 and product 1+1 | J²=1 in each degree; J₂=1=(−1)(−1)=J₁J₁ | Consistent | None |
| 1.1 API 4 | Single/double point; constant positive cube | Coefficients 1≠2 remain distinct; degeneracy projector sends constant positive cube to 0 | Consistent | None |
| 1.2 definition | Total degrees 0,2; bidegree (1,1) | Diagonal has 1,3 summands; square cross coefficient −1+1=0 | Consistent | None |
| 1.2 API 1 | Degree-zero m[V] | Both axes send m[V] to the same m[V], including m=0,2 | Consistent | None |
| 1.2 API 2 | Three total-degree-two components | Component multipliers 1,2,3 send (1,1,1) to 6; direct-sum map also gives 6 | Consistent | None |
| 1.2 API 3 | (1,0),(0,1),(1,1) | Correct J signs −1,+1,−1; using total degree instead gives −1,−1,+1 | Consistent | None |
| 1.3 comparison | Point p=0; empty/full support; R=0 | H₀ sends 1→1; higher Hₙ 0→0; support fibers 0,C; zero coefficients 0→0 | Consistent | None |
| 1.4 operations | 𝔽₂(t)/𝔽₂(t²); dual numbers; odd degrees | Degree composite 2 on ℤ; reduced/fat-point generators coefficient 1; odd exchange −1, degree-zero exchange +1 | Consistent | None |
| 2.0a definition | n=0,1,2; empty support; ℤ₂,ℤ₃ | K^S(Y), ΩK(X), Ω²K(X); empty support 0; full one-cube K₀=ℤ_p× for p=2,3 | Consistent | Scope retained |
| 2.0a generalized weights | h=1−O(−1) on ℙ²; abstract L=2I+N | ψ²h=2h−h², ψ²h²=4h²; lattice determinant 2; h=(2h+h²)/2−h²/2; (L−2)e₂=e₁≠0,(L−2)²e₂=0 | Rational/generalized qualifications necessary | Full cubes distinguished |
| 2.0a API 1 | n=0,Y arbitrary; S=∅,Y | Values 0 and K(Y), with K(X) only if Y=X; forgetting 0 gives 0 | Consistent | None |
| 2.0a API 2 | X=Spec ℤ[i]; common-base cubes; units over ℤ_(p) | External local dimension 1, cotangent dimension 2; common-base cube regular dimension 3; ψ² product 4{u,v}=(2[u])(2[v]); empty support product 0 | Old external-domain assertion fails; repaired one survives | Typed pullbacks/pairings and negative Check |
| 2.0a API 3 | n=0,1,2; unit 2 over ℚ; {u,v} over ℚ(u,v) | Ω⁰K=K; difference (1,0),(0,1),(1,1)↦1,−1,0; ψ² multipliers 2 and 4 on both sides, ψ¹=1; coordinate exchange −1 | Equivariant full-cube statement consistent | Added weightwise clause and Check |
| 2.0a localized open Check | ℤ₃, remove t=2 | 2−0=2 and 1−2=−1 are units, so both faces survive with line ranks (1,1); no full-cube equivalence asserted | Consistent | None |
| 2.0b definition | Zero class; O(1) on ℙ²; unit 2 | c₀(0)=1 while ch(0)=0; c₂(O(1))=0 while ch₂=h²/2; c₁,₁[2]=[2], valuation 1 | Operations distinguished | None |
| 2.0b API 1 | O(1)⊕O(−1), with trivial summand | Whitney product (1+h)(1−h)=1−h², c₁=0,c₂=−h² before/after stabilization | Consistent | None |
| 2.0b API 2 | Diagonal n=1,2,3 | Integral Chern multipliers 1,−1,2 on symbols | Consistent with supplier | None |
| 2.0b API 3 | Same three diagonals | Newton multipliers 1,−1,1/2 times 1,−1,2 give 1,1,1; denominators 1,1,2 nonzero in ℚ | Consistent | None |
| 2.1 construction | Rank 2; O(±1) on ℙ¹; ∅; two points; unit 2 | 2; (1+h)+(1−h)=2 versus total Chern 1; 0; (2,1); [2] with valuation 1 | Inverse construction’s four Checks independent of §2.0b | Deleted stale edge |
| 2.1 API 1 | Ranks (2,1) on two points | Project then restrict gives 2 and 1, as does restrict then characterize; sum 3 would fail | Consistent | None |
| 2.2 comparison | Weights 0,1,2; ψ¹; line bundle on ℙ² | ψ² eigenvalues 1,2,4; differences −1,−3,−2; ψ¹=1 on all; weight-two character h²/2 | Consistent | None |
| 2.2 API 1 | Point sheaf; unit 2; ordered degree-two symbol | Both characters give h,[2],[Γ₂]×[Γ_t]; last-slot residues [2], with valuation 1; reversed order residue −[2], valuation −1 | Degree-two sign detected algebraically | Replaced forward regulator test |
| 2.3 construction | Empty/full support; crossing divisor | Fibers 0, absolute complex; crossing leading support coordinates (1,1), without replacing ambient supported K by singular K(Z) | Consistent | None |
| 2.3 API 1 | {0}⊂{0,1}; identity map | Coordinate 1 maps to (1,0); composing identity again gives (1,0) | Consistent | None |
| 2.3 API 2 | Unit t; degree-two boundary adapter | B[t]=+[0], raw cochain class −[0]; minus raw +[0]; last-slot factors at n=1,2 are +1,−1 | Consistent | Rechecked against §2.2 residue |
| 2.4 product/normalization | Ranks 2,3; ξ in K₀, h in CH of ℙ¹; p=1,2,3 | Rank 6=2·3; ξ²=0, ch(ξ)=h, h²=0; ch(ξ²)=0=ch(ξ)²; Newton factors 1,−1,1/2; leading point class h | Formula survives; old attribution unsupported | Local proof attribution and product Check |
| 3.1 definition | Punctured disk; empty boundary; empty W; arbitrary pole | dlog∣z∣²=dz/z+dz̄/z̄; period 2πi; empty D gives native forms; empty W gives 0; ∣z∣⁻² exceeds logarithmic growth | Consistent | None |
| 3.1 API 1 | f=z z̄ | ∂∂̄f=dz∧dz̄ and ∂̄∂f=−dz∧dz̄, sum 0; ∂²f=∂̄²f=0 | Consistent | None |
| 3.1 API 2 | z=w²,w=v³ | Successive pullback dlog z→2dlog w→6dlog v; direct sixth power gives 6dlog v | Consistent | None |
| 3.1 API 3 | log∣z∣² at z=2; empty boundary | Inclusion preserves value log 4≠0; empty-boundary map is identity | Zero/unmarked models excluded | None |
| 3.2 filtered comparison | 𝔾_m⊂ℙ¹; boundary blowup of 𝔾_m²; point,∅ | dlog has residue-filtration index 1 and H¹-weight 2; Betti dimensions 1,2,1 unchanged, boundary components 4→5; point weight 0, empty groups 0 | Fixed-pair bifiltration distinguished from refinement F-invariance | None |
| 3.2 API 1 | Flat f=exp(−1/∣z∣²); f=1 | f/z² has zero jets and value e⁻¹ at 1; 1/z diverges at 0 | Flatness necessary | None |
| 3.2 API 2 | Flat union-of-axes example; all exponents 0 | f log∣z∣²/(zw̄) has axis jets 0, value −e⁻¹ᐟ⁴log4/2 at (−2,1); zero exponents give f | Combined extension determined | None |
| 3.3 definition | A=ℂ[0], p=−1,0,1,2; A=0 | H⁰=ℝ(−1),ℝ,0,0; H¹=0,0,ℝ,ℝ(1); A=0 gives all 0; d_D(z z̄)=−2dz∧dz̄ | Arbitrary twists and critical case consistent | Correct composite order |
| 3.3 API 1 | Point p=1,r=1; cone element log2+i | Inclusion/projection gives 1→(0,0,1)→1; reverse gives (0,0,log2), differing by −i; contraction has dh=(0,0,−i) | Strict and homotopy identities separated | Expanded point Check |
| 3.3 API 2 | Split ℂ→ℂ²→ℂ in degree 0, twist 1 | H¹ maps r→(r,0), (r,s)→s; kernel ℝ×0 equals image | Consistent | None |
| 3.3 API 3 | p=1,x=z z̄ | Ordinary degrees 0→2; −2∂∂̄x=−2dz∧dz̄ evaluates to 4i | Consistent | None |
| 3.4 construction | Two torus compactifications; point ⊔ ℙ¹ | Periods (2πi,0),(0,2πi) and (2πi)² in both choices; H_D⁰ at twist 0 is ℝ² | Marked comparison consistent | None |
| 3.4 API 1 | Identity then identity refinement | Point H⁰ multiplier 1·1=1; zero-complex map 0 | Consistent | None |
| 3.4 API 2 | t↦t² then t↦t³ | Pullback on dlog has multiplier 2·3=6, equal to t↦t⁶ | Consistent | None |
| 3.4 API 3 | Two affine opens of ℙ¹, p=0; empty cover of ∅ | Čech degree-zero kernel of (a,b)↦a−b is diagonal ℝ, equal to H_D⁰; ∅ gives 0 | Consistent | None |
| 3.4 API 4 | Constant point diagram with repeated choices | Compatible maps 1→r descend once to 1→r; repeated indexing still gives ℝ, not ℝ² | Colimit marking consistent | None |
| 4.1 construction | log2,log∣t∣; two point logarithms | Four-term product i log2 darg t, period 2πi log2; point product log2•log3=0 | Consistent | None |
| 4.1 API 1 | Same odd factors; x=z z̄,y=1 | Exchange negates i log2 darg t; d_D(x•1)=−2dz∧dz̄=d_Dx•1 | Consistent | None |
| 4.1 API 2 | Constant unit; two ruling classes | 1•log2=log2; high critical wedge gives normalized degree 1 | Consistent | None |
| 4.1 API 3 | Nonclosed x=z z̄,y=1, weight 1 | Product −z̄dz+z dz̄; its Deligne differential −2dz∧dz̄ | Formula does not require closed inputs | None |
| 4.2 associator | 2,3,5; Re z,2,3; three odd point classes | Bracketings 30=30; 6Re z=6Re z, value 6 at z=1 while dx≠0; even homotopy 0; odd point products 0 | Consistent | Rechecked transfer uses corrected retract |
| 5.1 definition | Empty/full support; zero-source fiber | fib(id) acyclic, fib(C→0)=C; fib(0→ℝ[0]) has H¹=ℝ; d² second term res dω−d resω=0 | Consistent | Added §4.2 edge |
| 5.1 API 1 | Enlarge {0} to {0,1} | 1→(1,0), direct and composed maps agree | Consistent | None |
| 5.1 API 2 | Unit t and open logarithm | Raw connecting classes −[0],−cl([0]); positive-valuation adapters both +1 | Consistent | None |
| 5.1 API 3 | Coordinate divisors; V(x),V(x−1) | Transverse supported product origin coefficient +1, absolute image 0=0; disjoint intersection gives product 0 | Product domain and coefficient consistent | Added README Check |
| 5.1 API 4 | Zero pair; (0,−log∣t∣); doubled pair | Zero differential (0,0); on punctured line ∂∂̄log∣t∣=0; supported coefficients 1 and 2 under addition | Both cocycle conditions and coordinates tested | None |
| 5.2 semipurity | Crossing,cusp,origin in 𝔸²; point full support | At p=1 H²=ℝ²,ℝ,0; origin p=2 gives H⁴=ℝ; point p=0 H⁰=ℝ; point p=1 full support has H¹=ℝ and violates omitted-codimension variant | Hypothesis discriminates | None |
| 5.2 API 1 | Normal complex disks of dimensions 1,2 | Relative classes ℝ in degrees 2,4 and 0 below; oriented generator coefficient +1 in both | Consistent | None |
| 5.2 API 2 | Double divisor; crossing; zero cycle | Coordinates 2,(1,1),(0,0); generic restrictions recover these entries; only (0,0) is zero | Both directions tested | None |
| 5.2 API 3 | f=t,t⁻¹ | Green representatives −log∣t∣,+log∣t∣; normalized current differentials −δ₀,+δ₀; supported coefficients +1,−1 | Consistent | None |
| 5.3 definition | (r,n)=(2p,1),(2p−1,1); point p=0 | Total degrees 2p−1,2p−2, cube signs +1,−1; normalized point complex ℝ only in degree 0 | Consistent | None |
| 5.3 API 1 | Origin and double; Γ_t face | Cycle and supported-class coefficients 1,2; graph zero-face coefficient +1 in each model | Consistent | None |
| 5.3 API 2 | Top column; nonclosed form ω=Re z₁ dz₂∧dz̄₂ | Top supported class m maps to m; dω(∂x₁,∂x₂,∂y₂)=−2i, so ω is excluded by good truncation rather than made a cocycle | Consistent | None |
| 5.3 API 3 | Point p=0; cycle at 0 in 𝔸¹,p=1 | Constant column sends 1→1; forgetting the origin support sends its class to 0 in absolute H², on both routes | Consistent | None |
| 5.3 API 4 | Supports {0},{1}, union; empty support | Representatives have coordinates (1,0),(0,1); equality is decided in common ℝ², not by summing; empty contribution 0 | Consistent | None |
| 5.4 three comparisons | Origin/double; point→𝔸¹; (n,s)=(1,1) | Class coefficients 1,2; H_D¹=ℝ on both, p=0 H_D⁰=ℝ on both; positive normalized columns 0; product sign −1 | Consistent | Rechecked product prerequisites |
| 6.1 roof | Integral m; torsion units; O(±1) | m→m; −1,i→0; normalized first-Chern integrals +1,−1; shift 2p multiplier +1 | Consistent | None |
| 6.1 API 1 | Point lift of m; lift changed by boundary | Forgotten form m yields m; boundary change yields cohomology difference 0 | Consistent | None |
| 6.1 API 2 | Units −1,i,2 | Regulator values 0,0,log2; torsion killed without removing integral source | Consistent | None |
| 6.1 API 3 | O(1),O(−1),O on ℙ¹ | Geometric and roof first-Chern integrals +1,−1,0 | Consistent | None |
| 6.2 coherent restriction map | Identity; empty/full supports; displayed non-strict square | h=0 on identity; supported maps 0/absolute; 1→(1,1), D′=(0,0); wrong (1,−1) gives (0,2) | Plus correction forced | Dependency summary only |
| 6.2 API 1 | General homotopy defect; r=f′=h=1 test | Defect (f′r−r′f−dh−hd)a=0; opposite sign gives 2(dh+hd)a, value 2 at a=1 | Consistent | None |
| 6.3 naturality/model comparison | Point→ℙ¹; two embeddings of ℚ; cube n=1,2 | c₁ pulls to 0 on both sides; unit 2 gives log2 by both paths; J=−1,+1 applied to source and targets | Consistent | None |
| 7.1 independent character | 2eⁱθ,i; O(a); constant ℤ,S₃ | Values log2,0; character 1+a h_D; abelian π₀=H₀=ℤ and higher groups 0; constant S₃ has nonabelian π₀=S₃ | Domain and normalization discriminate | None |
| 7.1 API 1 | Units 2,3; ranks 2,3 | log6=log2+log3; rank product 6=2·3; embedding of ℚ preserves log2 | Consistent | None |
| 7.1 API 2 | Log branches; O(1) | Re(log2+2πik)=log2; geometric/Deligne first-Chern integrals both 1 | Consistent | None |
| 7.2 Beilinson identification | Rank 2,point sheaf; units 2,−1; ordered degree-two symbol | Both routes yield 2,h_D,log2,0 and degree-two period 2πi log2; empty/full supported comparisons 0/absolute | Consistent | Recomputed downstream degree-two witness |
| 7.3 multiplicativity | Units 2,t; two point units; ruling divisors | Ordered/reversed periods ±2πi log2; point degree-two regulator 0; ruling product coefficient 1, doubled divisor gives 2 | Consistent | Recomputed support and sign witnesses |
| 7.4 acceptance witnesses | 1,i,2,3,6,1/2; O(a),tᵃ | Logs 0,0,log2,log3,log6,−log2; a=−1,0,1 gives Chern integrals −1,0,1; Green representative −a log∣t∣ has divisor multiplicity a | Consistent | Recomputed against algebraic residue convention |

The singular external product, reversed cone composite and sign-flipped degree-two character are excluded by computed negative controls. Other wrong models tested include ordinary coefficient tensor, natural subtraction, integral projectors, zero character/regulator, singular-support K in place of ambient supported K, arbitrary-pole forms, brutal truncation, reversed coordinate orientations and the wrong homotopy correction. Characteristic 2, inseparable extensions, nonreduced schemes and DVRs were used only where the target’s domain admits them; the complex realization does not assert values on such noncomplex geometric inputs.

## Check outcomes and maintainer notes

The required dependency command exited 0 with exactly:

```text
candidate: MotivicEtaleKTheory is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCycles (the intake inserts it when its design is accepted)
depcheck: 28 roadmaps, 244 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No gate failure was supplied in the brief, and this run produced none.

The citation resolver exited 0 against main `72d2b66` and the 331 indexed open heads: no unresolved cross-roadmap citations or Lean names. It also reported that it did not check native names at the pins; those were read separately as recorded above.

JSON and TOML parsed successfully. The plan contains 27 targets, 49 API entries and 99 target Checks. Every target statement and every Check occurs verbatim in the README. The four existing non-verbatim API entries (§2.2’s comparison, §3.2’s two flat-function assertions and §6.2’s fiber map) agree with their explicit README proof paragraphs. Every internal target prerequisite points to an earlier target, and every definition/construction retains at least three Checks. All seven layers retain Examples and Dependencies. The ten source keys are unique. `git diff --check` exited 0 with no output; final path/status inspection showed only the three authorized files and this requested report.

There is no `Suggested.lean` in this design package, and editing or creating one is outside the authorized files. No Lean command, scratch `#check` elaboration or binder comparison was run: there are no Lean declarations here to inspect. The headline comparisons require higher-Chow, scheme higher-K or geometric Deligne carriers absent at the pins; scalar logarithm identities alone would be Checks, not replacements for these headlines. No Lean name was added, changed or deleted.

The two existing supplier gaps remain explicit in both the README’s Exact supplier contracts and the plan’s top-level gaps: gap:smooth-whitney-extension and gap:flat-ideal-regular-situation, both naming DifferentialGeometry’s Part II section on Whitney jets and flat functions. This repair adds no supplier gap. Their external fulfillment is still required; this report does not certify it.

ColemanIntegration can now cite §2.0a’s explicit weightwise relativity and common-base pairing. The pre-existing external ownership synchronization for ColemanIntegration and Polylogarithms remains a maintainer concern outside these editable files; neither roadmap was edited. No scope/naming decision was reopened, no roadmap was moved, and no consumer-facing section or planned declaration name changed. Only the three authorized design/source files and this requested report were changed. No commit or remote write was made.
