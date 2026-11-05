# Port: EtaleDualityAndPerverseSheavesPartII

Branch: `roadmap/etale-duality-and-perverse-sheaves-part-ii`.
Head commit: `361dda32122d72d820f3f626b851c4fa768f4411`.
Base: `c994070`; the initial working tree was empty.

Only `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md`, `Suggested.lean` and `metadata.toml` are committed. The metadata is `topic = "math.AG"`. No push or GitHub write was performed.

## Validation

The exact final build outcome is:

```text
Build completed successfully (8954 jobs).
```

Warnings: **6**, each `declaration uses sorry`, one for each headline theorem. There are no other warnings. The final module has 284 lines and imports only `Mathlib`.

The exact gate summary is:

```text
gate EtaleDualityAndPerverseSheavesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The separately requested dependency-direction command exited 0 with exactly:

```text
depcheck: 197 roadmaps, 1246 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The merge-order file and tooling were not changed.

## Draft pull request body

Build Gabber’s finiteness, affine Lefschetz and duality theorems over quasi-excellent and excellent schemes, extending EtaleDualityAndPerverseSheaves beyond its finite-type field and one-dimensional base setting. The roadmap develops alteration topologies, Cohen–Gabber presentations, partial algebraization, local uniformization and oriented descent, then dimension functions, pinned dualizing complexes and local Lefschetz, with algebraic tilting of étale cohomology for henselian perfectoid pairs. These supply bounded constructibility and normalized local duality over general excellent bases.

AI assistance: Codex prepared the port, checked the mathematical examples and supplier interfaces, and ran the pinned elaboration and repository gates.

## Suppliers, ownership and citations

The direct suppliers that are new roadmaps in open pull requests are AlgebraicModuliForArithmeticGeometry, DeformationAndDerivedPatchingAlgebra, EtaleDualityAndPerverseSheaves, LefschetzPencilsAndVanishingCycles, ClassicalAdicEtaleCohomology and PerfectoidQuotients. AdicCoefficientsAndComparisonsPartII, ArcTopologyAndDescent and PerfectoidQuotientsPartII are earlier board designs, rather than main/open-head folders. They are allowed predecessors in the supplied order. PurityForFlatCohomology is a consumer, not a supplier.

Existing roadmap revisions were checked on main, rather than used as new dependencies. In particular, the main copies of SchemeAndStackFoundations, EtaleCohomologyFoundations, EnhancedDerivedSheaves, AdicEtaleGeometry and PerfectoidSpaces supply the contracts cited below.

Used `roadmaps list`, object searches with `roadmaps grep`, and `roadmaps show` for the named new-roadmap suppliers. The object searches covered Cohen–Gabber, partial algebraization, higher-graded approximation, oriented products and descent, local uniformization, dimension functions, affine Lefschetz, dualizing complexes and tilting of étale cohomology. Narrowed searches where the tool truncated broad results. Also searched the board packages and the supplied sibling checkouts. The ownership boundary with LocalPurity §1.4 is finite étale cover extension versus the graded support-cohomology theorem here. PerfectoidSpaces P3 concerns adic étale sites; Layer 8 here concerns the algebraic spectra and matched opens of henselian pairs. Coherent/module dualizing complexes in SchemeAndStackFoundations, DeformationAndDerivedPatchingAlgebraPartII and ClassicalAdicEtaleCohomologyPartII have different coefficient categories from the étale ℤ/n-complexes here.

No additional duplicate theorem was found requiring deletion from the accepted package. Its ownership choices remain: absolute purity belongs to LefschetzPencilsAndVanishingCycles §0.10; the scheme-oriented product and curve-step constructions belong to ClassicalAdicEtaleCohomology §5.4; the split-cover theorem belongs to ArcTopologyAndDescent §11.2; polynomial approximation belongs to AlgebraicModuliForArithmeticGeometry §§6.0–6.1; integral tilts and valuation tilting belong to PerfectoidQuotientsPartII. This roadmap owns the general finite-limit-site oriented product, its descent theorem, the higher-graded approximation comparison, quasi-excellent uniformization and finiteness, excellent étale duality, and the localized/matched-open algebraic tilting comparisons. These are extensions with the distinct domains specified in Scope and ownership.

| Citation | Copy checked and exact sections | Consumed contract |
| --- | --- | --- |
| SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md`, main, §§0.7, 0.12–0.16, 0.20–0.22, 2.11–2.12, 2.15–2.16, 4.16–4.20 | Field dimension, henselization, smooth lifting, Popescu, excellence, normalization, continuity, proper descent and ordinary alterations. The extra henselian/excellence and finite-algebra completion contracts remain explicit. |
| AlgebraicModuliForArithmeticGeometry | `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md`, new-roadmap head, §§6.0–6.1 | Polynomial approximation over henselian noetherian local G-rings; no higher-graded comparison is imported. |
| DeformationAndDerivedPatchingAlgebra | `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md`, new-roadmap head, §1.10 | Strict Cohen rings and compatible residue-labelled coefficient maps, including noninjective maps to p-torsion targets. |
| AdicCoefficientsAndComparisonsPartII | `packages/AdicCoefficientsAndComparisonsPartII/design/README.md`, §§PA.0.2–PA.0.8, PA.0.11, PA.1.2–PA.1.4, PA.4.1–PA.4.8, PA.5.1–PA.5.4 | Degree-controlled alterations, surface resolution, valuative spaces, logarithmic modifications, very tame quotients and stable curves. |
| AdicEtaleGeometry | `TauCetiRoadmap/AdicEtaleGeometry/README.md`, main, §§A1.14–A1.15, especially coherent-topos-enough-points | Coherent sites and Deligne’s theorem in the specified universe. |
| EnhancedDerivedSheaves | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`, main, §§0.1–0.4, Layer E2 | Enhanced ringed-site operations, tensor–Hom, coherent adjunctions and hypercover descent. |
| EtaleCohomologyFoundations | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md`, main, §§0.7, F.0–F.3, F.5–F.6, F.8 | Étale categories, localization, finite-cd exceptional adjunction, finite-type/trait finite-Tor duality, smooth purity and field perversity. The generic noetherian contract is distinguished from existing proper/field/trait results. |
| EtaleDualityAndPerverseSheaves | `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md`, new-roadmap head, §§0.1–0.2, 1.1, 2.1–2.11 | Self-injective coefficient duality, all-constructible extension, supported classes and field-base perversity. |
| LefschetzPencilsAndVanishingCycles | `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md`, new-roadmap head, §§0.2–0.5, 0.10, 6.2 | Trait-oriented construction, absolute purity, trait perversity; the independent affine support bound remains an explicit additional contract. |
| ClassicalAdicEtaleCohomology | `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md`, new-roadmap head, §5.4 | Scheme-oriented product, Cartesian middle refinements, projections, specialization direction and the marked curve step. |
| ArcTopologyAndDescent | `packages/ArcTopologyAndDescent/design/README.md`, §§3.6, 8.3, 8.6–8.9, 11.1–11.2, 11.5, 12.6 | Ultraproduct components, henselian completion/support comparison, formal glueing, complete arc descent and the split-cover theorem. |
| PerfectoidQuotients | `TauCetiRoadmap/PerfectoidQuotients/README.md`, new-roadmap head, §§0.4–0.6 | Integral perfectoid operations, p-integral closure and products. |
| PerfectoidQuotientsPartII | `packages/PerfectoidQuotientsPartII/design/README.md`, §§Q5.1–Q5.3, Q6.2–Q6.7 | Integral multiplicative tilt, powered sharp quotient, classical completeness transfer and valuation tilting. |
| PerfectoidSpaces | `TauCetiRoadmap/PerfectoidSpaces/README.md`, main, §P1.24 | Shared integral perfectoid convention. |
| PurityForFlatCohomology | `packages/PurityForFlatCohomology/design/README.md`, Layer PF.1 | Downstream hypersurface application; no reverse supply edge. |

The citation resolver still lists four names outside its main/open-head catalogue: AdicCoefficientsAndComparisonsPartII, ArcTopologyAndDescent, PerfectoidQuotientsPartII and PurityForFlatCohomology. Their board copies and exact sections are recorded above; none is a nonexistent supplier. Its claim that no pinned Lake packages are available is inapplicable to this checkout: both dependency revisions were verified locally and the module was built against them.

## Pinned library and signature audit

Mathlib: `f6090c7095e1e56b3464c1daba5f24631f1290d2`.
Tau Ceti: `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`.
Both match `lake-manifest.json`.

| Declaration | Pinned repository-relative source | Meaning and limits checked |
| --- | --- | --- |
| IsLocalRing | `Mathlib/RingTheory/LocalRing/Defs.lean:30` | Extends `Nontrivial R`; it does not include noetherianity or completeness. |
| IsAdicComplete | `Mathlib/RingTheory/AdicCompletion/Basic.lean:56` | Extends `IsHausdorff I M` and `IsPrecomplete I M`; separatedness is included. |
| HenselianRing, HenselianLocalRing | `Mathlib/RingTheory/Henselian.lean:94`, :108 | Global ideal-pair condition versus a class extending the local-ring predicate; no excellence is included. |
| Algebra.Etale | `Mathlib/RingTheory/Etale/Basic.lean:205` | Formal étaleness and finite presentation. |
| Algebra.IsEtaleAt | `Mathlib/RingTheory/Etale/Locus.lean:35` | `FormallyEtale R (Localization.AtPrime q)`; the finite/noetherian hypotheses supply the finite-presentation comparison used here. |
| FixedPoints.subring | `Mathlib/Algebra/Algebra/Subalgebra/Operations.lean:98` | Native fixed subring with its inclusion; no scheme quotient theorem is encoded. |
| ringKrullDim | `Mathlib/RingTheory/KrullDimension/Basic.lean:26` | Values in `WithBot ℕ∞`; headline dimensions are explicitly natural-number finite values. |
| PreTilt | `Mathlib/RingTheory/Perfection.lean:633` | Perfection of reduction modulo p, not a perfectoidness predicate or sharp-quotient theorem. |
| CategoryTheory.Sheaf.H | `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56` | Native abelian sheaf cohomology, used on the small étale site. |
| IsSepClosed | `Mathlib/FieldTheory/IsSepClosed.lean:65` | Separable closedness; algebraic closedness is not silently substituted. |
| CategoryTheory.Triangulated.TStructure | `Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean:54` | Abstract t-structure, not the missing geometric stalk/support construction. |
| Module.Baer.zmod_self | `TauCeti/Algebra/Module/ZMod/Injective.lean:50` | Self-injectivity in Baer’s form with `[NeZero n]`; consumed in prose, not restated. |

Object searches also inspected scheme morphisms, affine étale sites, residue maps, formal series, minimal primes, localizations, and fixed-point actions. The pinned libraries do not supply the geometric carrier packages identified in the Lean module docstring. A constructible subset of a scheme, for example `Scheme.Hom.isConstructible_image` in `Mathlib/AlgebraicGeometry/Morphisms/FinitePresentation.lean:161`, is not a constructible étale derived category.

Put `#check @name` for all nine declarations in one scratch signature file, elaborated that exact content through the permitted module build, compared all output types with the README, and restored the production module before its final build. No hypothesis disappeared and no signature changed. The field-algebra binder survives in both equal-characteristic statements; completeness, reducedness, dimension and equidimensionality survive where needed; the mixed statements retain characteristic zero, the residue characteristic, both prime conditions and the dimension lower bound. The mixed algebraization quantifiers remain ∃extension, then ∀finite ideal families. The cohomological statement retains strict henselianity, positive finite dimension, invertibility and the sectionwise affine-basis torsion condition. The structures retain their source parameters and carry all other ring, map and dimension conditions as fields.

## Lean-to-README moves and supplier replacements

Nothing moved out of Lean. The accepted file already consists of six deep theorem statements and three native data bundles needed to state them. It has no API padding, sorry-valued data, examples, option overrides or supplier imports to repair. It is byte-for-byte the accepted package’s Lean file. No additional headline is statable without the geometric carriers listed in its docstring. No declaration duplicates another roadmap’s fully qualified declaration name.

No new supplier replacement or duplication removal was necessary. The accepted package already replaces absolute purity, scheme-oriented products, marked curve constructions, split covers, coefficient self-injectivity and integral tilting by the suppliers listed in Scope and ownership. Those boundaries and their examples remain intact.

## Upstream mathematical read and changes

Preserved every accepted target, API list, worked example and supplier contract. Applied the review’s non-blocking nearby-pointer note: the complete-local reduction now points to ILO14 line 2064 rather than line 2056.

The following additional changes improve the prose and tests without changing a theorem signature:

- In §0.1, changed “X → S proper, surjective and integral” to “integral schemes X and S and a proper surjective morphism.” An integral morphism need not have integral source: two copies of Spec k form an alteration-category object but not an alteration with integral source. The revised sentence states the intended equivalence.
- Attached the explicit ILO14 line 2292 locator to the coefficient-field supplier contract.
- Added a §5.4 Check distinguishing finite-type transport (1,0) from regular transport (0,−1) on the affine line over a field.
- Added regular-pinning Checks in §§6.4 and 6.11: support degree 4 versus ordinary degree −4 on a surface, and closed-support normalization in degree 0.
- Added a third Check to each of §§8.2, 8.3, 8.5 and 8.6. These test localization at zero, orthogonality of the two primitive idempotents, and nonzero H¹ of a finite field, including characteristic-primary coefficients. They distinguish bijections from collapsing maps and perfectness from acyclicity.
- Replaced design-gap labels and delivery language by timeless named supplier contracts. The contract contents, owners and source-access qualifications are retained. Removed repeated entries in one Needs clause.

The accepted ramified invariant coefficient base V^H, the graded approximation definition, the split-cover ownership and the finite-cd exceptional-pullback domain were independently rechecked and preserved.

## Source verification

Read the legal cached source text, using the versions in `packages/EtaleDualityAndPerverseSheavesPartII/sources.toml`. The source manifest is not copied into the target folder. No source passage was inserted into the roadmap.

| Claim or route | Text read | Outcome |
| --- | --- | --- |
| Cohen–Gabber and coefficient choices | ILO14 line 2276, line 2292, line 2419, line 2677, line 2729 | Residue identity, equidimensional/torsion-free versus nonequidimensional forms, p-dense étaleness and invariant generic degree agree. |
| Higher-graded approximation and complete-local reduction | ILO14 line 1872, line 1887, line 1958, line 2064 | Full integer grading, base compatibility, n+1−c order and regularity threshold a≥2 agree. |
| Partial algebraization and its mixed proof | ILO14 line 2877, line 2884, line 2890, line 2957, line 2999, line 3034 | Exact ideal extension, full faithfulness, extension-before-family quantifiers and V^H coefficient base agree. |
| Equivariant curves | DJ97 line 139, line 160; ILO14 line 5893 | The geometric irreducibility and étale marking hypotheses are needed for the stated quotient conclusion. |
| Oriented tube and descent | ILO14 line 8381, line 8936, line 9065, line 9093 | Arrow directions, coherent hypotheses, torsion and bounded-below scope agree. |
| Generic constructibility and finiteness | SGA4half line 7774; ILO14 line 9260 | Generic arbitrary-noetherian input is distinct from the quasi-excellent global conclusion; global eventual vanishing is retained. |
| Dimension and affine Lefschetz | ILO14 line 9873, line 9997, line 10198, line 10216, line 10333 | The residue-field transcendence degree is in the corrected direction; regular transport is a different normalization. |
| General strictly local dimension bound | ILO14 line 16193 | Arbitrary noetherian strict local base, d>0 and all ℓ-primary sheaves agree with the signature. |
| Top class, potential complexes and biduality | ILO14 line 12855, line 13878, line 14233 | Group transitions versus derived codimension≤1 maps, pinnings and finite-quasi-injective criterion agree. |
| Shift necessity and composite coefficients | G04 line 441, line 452 | The factorwise formulation retains the correct +2 change of shift index. |
| Local Lefschetz and duality route | CS24 line 1356, line 1361, line 1367 | Supported completion precedes the complete-ring duality argument; thresholds i<d and i<d−1 agree. |
| Algebraic tilting and valuation-product comparison | CS24 line 827, line 834, line 864 | All torsion, matched complements, idempotent orthogonality and support triangles agree; no rank bound on ultraproduct components is inferred. |
| Epp correction | K10 line 90, line 105 | Cancellation can remove the whole negative part and leave an Artin–Schreier residue extension. |

Source misprints already handled correctly by the accepted package remain corrected: the valuation criterion uses algebraically closed fraction fields; finite-type dimension transport uses trdeg(κ(y)/κ(f(y))); the mixed invariant base is V^H and the remaining henselian variable is t_(d−1). Ill03 and Epp73 remain original works cited by locator through the legal ILO/K10 accounts; their original text was not certified. Web searches for corresponding Mathlib/Zulip work returned no relevant additional API to adopt; no absence claim is based on those search results.

## Computed adversarial mathematics pass

The following are explicit computations, not proofs of the general targets. Unless specified otherwise, k is separably closed, Λ is nonzero of invertible finite order, and cohomology is étale. “Retain” means the displayed test did not require a change. Rows separate definitions, API identities and theorem conclusions; the same witnesses also test their supplier normalizations.

| Statement | Instances tried | Computed values on the two sides | Result; change |
| --- | --- | --- | --- |
| Local-ring convention | Zero ring; k | 0=1 in the zero ring versus 0≠1 required by IsLocalRing; dim k=0 | Zero ring excluded; retain. |
| Complete-local convention | k⟦t⟧ with (t)-adic topology | Intersection of (t)^r is 0; inverse-limit completion is k⟦t⟧ | Separation is included; retain. |
| Coefficients | n=1,2,4,6 | ℤ/1=0; cardinalities of Λ are 2,4,6 otherwise; ℤ/2 over ℤ/4 has dual {0,2} of size 2 | Layer 6 needs n≥2, not field coefficients; retain. |
| Shift convention | Λ[2]; Λ[4] | H⁻²(Λ[2])=Λ; H⁻⁴(Λ[4])=Λ; H⁰ of either is 0 | Shift direction retained. |
| Tate/class convention | Strict trait; strict regular surface | Uniformizer class sends 1↦1 in H²_s(Λ(1))=Λ; two classes send 1↦1 in H⁴_x(Λ(2))=Λ | Same normalization in Layers 5–7 and purity supplier. |
| Degree conventions | Degrees 1,2 and ℓ=1,2,3,∞ | gcd(2,1)=1, gcd(2,2)=2, gcd(2,3)=1; ∞ admits only degree 1 | Formal topology parameters distinguished; retain. |
| Geometric versus ordinary support | DVR with residue field 𝔽_q | Sheafified support has only degree 2; ordinary H³_s(μ_n)=H¹(𝔽_q,ℤ/n)=ℤ/n | No false upper-support vanishing; retain. |
| Universe convention | Ring carrier in Type 0 | Structure carriers are in Type 0; their bundle is in Type 1; independent ideal-index universe can be 1 | No set of all rings/topoi claimed; retain. |
| Perfectoid parameter | Characteristic p with ϖ=0 | ϖ^p=p=0; localization at 0 has one element; 0-adic completion is A | Zero parameter is admitted; retain and test explicitly. |
| §0.1 alteration category | Spec k; A¹_k | Finite reduced k-algebras have dimension 0; k(t)/k has transcendence degree 1 | md does not imply generic finiteness; retain. |
| §0.1 maximal dominance | Origin into A¹ | Image point has codimension 1 rather than 0 | Closed-point inclusion rejected; retain. |
| §0.1 md right adjoint | Blow-up of A² | Extra E×E has dimension 2 over 0; generic closure is diagonal blow-up with exceptional dimension 1 | Ordinary product differs from alt product; retain. |
| §0.1 terminal object | Spec k[ε]/ε² | Terminal reduced object has coordinate ring k, not k[ε]/ε² | Reduction retained. |
| §0.1 flat base change | k′/k, finite algebra k×k | Base change gives k′×k′, still two reduced points and generic degrees 1 | Flat/reduced base-change rule retained. |
| §0.1 degree composition | Degree-2 and degree-3 field extensions, ℓ=5 | Composite degree 6; gcd(2,5)=gcd(3,5)=gcd(6,5)=1 | Degree condition stable; retain. |
| §0.1 alteration equivalence Check | (Spec k)⊔(Spec k)→Spec k | Finite integral morphism has 2 components; alteration requires 1 integral source | Clarified integral schemes versus integral morphism. |
| §0.2 étale-decomposed generators | Closed fibre 𝔽₃⊔𝔽₉ over 𝔽₃, ℓ=2 | Point degrees 1 and 2; gcd(1,2)=1 while gcd(2,2)=2 | Rational lift matters; retain. |
| §0.2 proper generators | ℤ[i]/ℤ, ℓ=2,3 | Generic degree 2 gives gcd 2 and 1 respectively | Admitted only in the stated prime-to-degree case; retain. |
| §0.2 topology comparison | Identity and empty family over a point | Identity has degree 1; empty image has 0 points over the point | Identity covers, empty family does not; retain. |
| §0.2 hypercover definition | Constant point; augmentation with empty degree 0 | Matching maps are identities in the first case; second misses 1 point | Augmentation is substantive; retain. |
| §0.3 standard form (1) | Identity cover | Modification degree=1, Nisnevich residue degree=1 | Composite is identity; retain. |
| §0.3 standard form (2) | Integral finite flat degree-3 cover, ℓ=2 | Y=X, V=X; composite degree=3 and gcd(3,2)=1 | Finite-flat form tested; retain. |
| §0.4 valuative criterion | D(t)⊂A¹ and valuation centered at t=0 | t is a nonunit in V but would have an inverse after lifting | Negative direction excludes the open; retain. |
| §0.4 positive criterion | k⟦t⟧⊂k⟦u⟧, t=u², char k≠2 | Normalization has rank 2, ramification index 2 and one closed point | Proper lifting supplies the expected lift; retain. |
| §0.4 domain of criterion | Non-Japanese DVR example | Integral closure is not finite; integral finite-type would be finite | This normalization is outside alt, not a counterexample; retain. |
| §0.5 graded definition | X=Spec k⟦t⟧, Y=Spec k, a=1,2 | At a=1, gr₁(X)=k versus gr₁(Y)=0; at a=2, degrees −2,−1,0 on X are 0,k,k[t]/t² | Closed fibres alone fail; retain. |
| §0.5 base compatibility | Over ℚ⟦t⟧, proposed t↦2t | Structure sends t↦t versus proposed 2t≠t | Wrong graded rescaling excluded; retain. |
| §0.5 identity API | z over ℚ⟦t⟧ | z↦z and t↦t in the fibre and every graded piece | Identity law retained. |
| §0.5 inverse API | z↦2z | Inverse z↦z/2; both composites z↦z | Inverse law retained. |
| §0.5 composition API | z↦2z,3z,5z | Pair composite 6z; both triple associations 30z | Associativity retained. |
| §0.5 approximation bound | X=Ŝ; quadratic z²−u, 2u units | A/𝔪^r=Â/𝔪^r; derivative 2z is a unit since z²=u | Dimension/regularity are not inferred from closed fibre alone; retain. |
| §0.6 henselian reduction | Empty X; two points; node with nodal boundary | Cover counts 0,2,2; node normalization gives two lines with one regular boundary point each | Empty case and connected-source requirement retained. |
| §0.7 complete-local reduction | Boundary xy(x−y), chart y=xu | Pullback x³u(1−u); reduced support xu(1−u) before and after completion | Branch data retained; locator corrected. |
| §1.1 Cohen–Gabber | Cusp in characteristics 2,3 | Parameter y gives degree 3 and derivative x²≠0 at p=2; parameter x gives degree 2 and derivative 2y≠0 at p=3 | No small-prime exclusion; retain. |
| §1.1 residue/equidimensionality | d=0; 𝔽_p(s)⟦x⟧ | Zero-variable map k→k has degree 1; x^p parameter has derivative 0 and degree p | Residue identity and generic étaleness distinguished; retain. |
| §1.2 equivariance | C₂ negates x, char≠2 | f(t)=x² gives ρ(f(t))=x²=f(t), degree 2 | Fixed variables and nontrivial action coexist; retain. |
| §1.2 nonabelian action | S₃ permutes three variables | Elementary symmetric parameters fixed; generic degree 6 | Tests beyond cyclic groups; retain. |
| §1.2 tame hypothesis | Characteristic 2, x↦x/(1+x) | Applying action twice gives x; group order maps to 0, not a unit | Wild action outside the hypothesis; retain. |
| §1.2 lower-dimensional components | k⟦x,y,z⟧/(xz,yz), a=x+z,b=y | Component dimensions 2,1; invert b generically to obtain z=0,x=a,y=b and field degree 1 | Torsion-freeness correctly absent; retain. |
| §1.3 Epp theorem | Unramified trait | Ramification index 1 and reduced special fibre | Identity extension suffices; retain. |
| §1.3 correction | p=2, z²−z=u²π⁻²+uπ⁻¹ | Subtract (uπ⁻¹)²−uπ⁻¹; remainder 2uπ⁻¹=0 | Result z²−z=0 can split; retain. |
| Mixed bundle dimension/data | A=B=ℤ_p⟦x⟧, V=ℤ_p, d=2 | d−1=1, both structural maps identities, degree 1, residue equation id=id | Bundle is inhabited and retains actual maps; retain. |
| Mixed bundle p-fibre | t↦x^p over V | Derivative px^(p−1)≠0 generically, but nonunit above p | Generic étaleness does not imply p-density; retain. |
| Mixed bundle invariant degree | V=W[π]/(π^ℓ−p), B=V⟦x⟧ | B/A degree ℓ, B^H/A degree 1; gcd(1,ℓ)=1 versus gcd(ℓ,ℓ)=ℓ | Degree imposed on correct extension; retain. |
| Mixed bundle group condition | Q₈ and S₃, ℓ=2 | Q₈ element orders 1,2,4; S₃ has order-3 element | Nonfaithful 2-group action allowed; S₃ rejected; retain. |
| §1.4 mixed existence | Identity model, (p,ℓ)=(2,3),(3,2) | Invariant degree 1; gcd(1,3)=gcd(1,2)=1 | Both small-characteristic models admitted; retain. |
| PartialAlgebraization definition | k⟦x,y⟧ over k⟦x⟧[y]_(x,y) | Base dimension 1<2; completion equals A; (y−x²) extends literally | Actual completion and ideals retained. |
| PartialAlgebraization invariance | Swap x,y in k⟦x,y⟧ | (x) maps to (y), both quotient dimensions 1 | Ideal-carrying isomorphism required; retain. |
| PartialAlgebraization intersection API | (x) and (x²) in k[x]_(x) | Intersection (x²) both before and after completion; quotient lengths 1,2 | Support equality is insufficient; retain. |
| PartialAlgebraization dimension API | A=k; proposed B=A | Required dim B<0 impossible; proposed 0<0 false | Field and identity-base exclusions retained. |
| §1.6 equal-characteristic existence | Node and branch ideals; empty family | Completed k[x,y]/(xy) is node; dim k+1=1; (x),(y) preserved; empty family still has completion | Finite-family and positive-dimension conditions retained. |
| PrimeToEllLocalExtension definition | Identity; reduction mod p | Generic fibre dimension 1 for identity; reduction kills p≠0 | Actual finite injective local map retained. |
| Extension isomorphism API | Quadratic extension, ℓ=2,3 | Isomorphic generic fibres both dimension 2; gcd(2,2)=2, gcd(2,3)=1 | Generic degree invariant; retain. |
| Extension broader parameter domain | Cusp normalization, ℓ=0,1 | Normalization degree 1; gcd(1,0)=gcd(1,1)=1; degree 2 fails at 0 | Bundle need not assume prime ℓ or normal A; retain. |
| §1.7 mixed algebraization | W[π]/(π²−3), H=C₂ | Fixed a+bπ has 2bπ=0, hence b=0; V^H=W, B^H=W⟦x⟧ | Correct invariant base retained. |
| §1.7 impossible coefficient base | Proposed π↦b(x) in W⟦x⟧ | b₀²=3 implies 2v₃(b₀)=1, impossible in ℤ | A V-structure is not assumed; retain. |
| §1.7 action/completion API | Averaging the ramified C₂ model | (a+bπ + a−bπ)/2=a before/after completion | Invariants commute with completion over invariant coefficients; retain. |
| §1.7 dimension and family order | d=2,3; ideal (x−3) | 1+(d−2)=1,2; W[x] completion gives W⟦x⟧ and literal (x−3) | ∃extension precedes ∀families; retain. |
| §2.1 nodal curve alteration | Smooth P¹ with sections | Both alterations identity, quotient degrees 1, boundary sections unchanged | Positive instance retained. |
| §2.1 geometric hypothesis | P¹_L over K, [L:K]=2 | Generic constants degree 2 versus degree 1 required by birational base quotient | Geometric irreducibility is substantive; retain. |
| §2.2 weak uniformization | xy=z², including p=2 | x-chart k[x,z₁], y=xz₁²; exceptional conic gradient (y,x,0), with no projective singular point | Regularity and snc support retained. |
| §2.3 prime-to-ℓ uniformization | Degree ℓ versus resolution | gcd(ℓ,ℓ)=ℓ versus gcd(1,ℓ)=1 | Resolution is allowed; raw quotient degree is not. |
| §2.3 pointwise covering | Cubic x³+x²+2x+t over 𝔽₃[t]_(t) | Closed fibre x(x²+x+2) has degrees 1+2; deleting rational point leaves degree 2 though generic degree 3 | Generic degree alone insufficient; retain. |
| §2.4 regular hypercover | Constant point, empty boundary | Matching object point; degeneracy image all point, hence not rare | Do not add degeneracy image to boundary; retain. |
| §2.4 truncation | q=0,1 | Required levels 0,1 and 0,1,2; normalized constant complex has ranks 1,0,0 | N≥q+1 and constant example agree. |
| §3.1 oriented-product definition | Self-product of strict trait | Underlying pairs (s,s),(η,η),(s,η), count 3 versus ordinary product count 2 | Extra specialization direction retained. |
| §3.1 projections/two-cell | Point pair (s,η) | p₁=s, p₂=η; arrow η⇝s exists, reverse absent | Sources, targets and orientation retained. |
| §3.1 universal/functorial API | Punctual base and identity maps | Product with point returns X; both identity composites give the same pair and identity two-cell | Universal property/units tested; retain. |
| §3.1 coherent API | Punctual finite sites | Finite covers have 1 member; products of generating objects remain finite | No arbitrary-large-site assertion; retain. |
| §3.2 tube comparison | X=Y=S a geometric point | Each side Λ in degree 0, 0 later; map id_Λ | Comparison normalization retained. |
| §3.3 diagram topology | Identity; blow-up ladder; {0}⊂A¹ | Identity covers; blow-up fits type (iv); point map misses every nonzero point | Covering types distinguished; retain. |
| §3.3 base-change/hypercover API | Constant point hypercover | Every term and matching map is a point/id; augmentation equivalence | Termwise finite-type domain retained. |
| §3.4 proper acyclicity | Proper identity; zero complex | Unit id_F; for F=0 all groups 0 on both sides | No arbitrary nonabelian assertion; retain. |
| §3.5 oriented descent | Split two-point cover of a point | C⁰=Λ², C¹=Λ⁴; d(a,b)=(0,b−a,a−b,0); kernel diagonal Λ | Descent recovers Λ, not Λ²; retain. |
| §3.6 hypercover base change | Constant hypercover; zero K | Exchange id_K; for K=0 all groups 0 | Augmented formula retained. |
| §4.1 constructibility | snc trait and cited non-qe boundary | Trait R⁰,R¹ ranks 1,1; bad example boundary ranks 2 at infinitely many points versus generic 1 | Invertible/quasi-excellent hypotheses retained. |
| §4.2 boundedness | snc branches r=0,1,2 | Exterior ranks (1), (1,1), (1,2,1); zero in degrees >r | Global boundedness and twist retained. |
| §4.2 characteristic-primary control | A¹ over algebraically closed char-p field | t^m for p∤m give infinitely many independent classes mod h^p−h | H¹ not finite; coefficient invertibility retained. |
| §5.1 dimension definition | Strict trait; point | Trait values (1,0), drop 1; point value any integer c | Sign and normalization retained. |
| §5.1 étale/reduction API | Trait with square-zero thickening | Same point chain; values still (1,0); étale pullback retains drop 1 | Underlying nilpotents do not alter dimension function. |
| §5.1 torsor API | Trait functions (1+c,c),(1+c′,c′) | Difference at both points c−c′ | Locally constant difference retained. |
| §5.1 two wrong global formulas | A¹ over DVR; line meeting plane | Closure values 2→0 along one immediate specialization; −dim local jumps 0→−2 along line | Neither unrestricted formula is used; retain. |
| §5.1 support supremum API | Zero sheaf; submodule of Λ at a point | sup empty=−∞; nonzero point-supported module value c; submodule value c or −∞≤c | Zero and subquotient conventions retained. |
| §5.2 existence | Point; trait; non-universally-catenary local example | Functions c and (c+1,c) exist; obstruction forces incompatible saturated chain lengths | No global-existence claim on every qe scheme; retain. |
| §5.3 regular base change | Identity; z²=1+t over ℚ[t]_(t) | Identity exchange id; completed root 1+t/2−t²/8 squares to 1+t mod t³; no rational root by odd valuation at t+1 | Sheaf exchange is not unrestricted global invariance. |
| §5.4 finite-type transport | A¹_k→point | δ values 1,0 = trdeg values 1,0 | Correct residue-field direction retained. |
| §5.4 regular transport | Same A¹_k→point | Local fibre dimensions 0,1 give δ values 0,−1 | Added Check distinguishes the two transports. |
| §5.5 strict-local trait consequence | Geometric point; trait generic open | At d=0: H⁰=Λ, H^q=0 for q>0; at d=1: H¹=Λ(−1), H²=0 | Bound q>d retained; independent trait contract retained. |
| §5.6 affine Lefschetz | Strict surface minus regular divisor | δ(U)=2; δ(R¹j_*Λ)=1=2−1 | Support inequality direction retained. |
| §5.6 branch-comparison definition | t↦u^ℓ versus t↦v·u, v unit | First cotangent class 0, H¹ map ×ℓ=0; second cotangent nonzero, H¹ map ×1 | Branch counts alone insufficient; retain. |
| §5.6 branch ordering | x↦v,y↦u | H¹ map swaps basis; H² map −1, equal 1 mod 2 and 2 mod 3 | Ordering not required; sign retained. |
| §5.6 zero sheaf | F=0 | Both support suprema −∞; all cohomology 0 | No undefined finite supremum; retain. |
| §5.7 local affine bound | Strict trait and henselian DVR with finite residue field | Strict cd generic=1=1+0; finite-field residue cd=1, generic cd=2=1+1 | Residue-field term retained. |
| §5.8 general strict-local bound | d=1,2 and d=0 | Generic strict trait cd=1=2·1−1; punctured strict surface H³=Λ(−2), bound 3; d=0 gives 0 versus invalid −1 | Positive-dimension condition retained. |
| §5.8 sectionwise torsion | Direct sum of groups ℤ/ℓ^r | One affine-basis section has finite image killed by ℓ^N; disjoint-union section has orders ℓ^r unbounded | No uniform exponent imposed; retain. |
| §6.1 immediate transition | Trait, identity specialization | Trait 1↦1 in H²_s(Λ(1)); identity sends a↦a | Direction and codim-zero units retained. |
| §6.1 wild averaging | Generic module with M^S=0 | Averaging projector 0; transition from j_!M is 0 | Zero/wild model distinguished; retain. |
| §6.1 trace normalization | Residue degrees 2,3 with Λ=ℤ/3,ℤ/2 | 2⁻¹=2 mod 3, 2·2=1; 3⁻¹=1 mod 2 | Inseparable factors invertible; retain. |
| §6.1 support/naturality API | Closed-supported i_*Λ on trait | Generic support 0, closed support Λ, induced map 0 | No arbitrary nonzero transition assumed. |
| §6.2 top class | Regular point, trait, surface | Degrees 0,2,4 with class 1 in Λ; higher groups 0 for strict regular examples | Top class normalization retained. |
| §6.2 higher composition | Two codim-one specializations on surface | Total shift 2+2=4, twist 1+1=2; 1↦1 along both chains | Group-map composition, not general derived-map assertion. |
| §6.3 putative/potential definition | Trait K=Λ(1)[2] versus Λ | First generic degree −2 and closed support degree 0; Λ generic degree 0 | Wrong complex rejected by pinning. |
| §6.3 twist/restriction API | Point δ=0 and δ=1 | Complexes Λ and Λ(1)[2]; adding k=1 changes δ by 1 and shift by 2 | Transport signs retained. |
| §6.3 empty/pushforward controls | Empty scheme; two points over one | Empty potential complex 0; finite pushforward of point pinnings Λ² has rank 2, not 1 | Rank-one pinnings are not preserved by arbitrary finite pushforward. |
| §6.4 regular potential complex | Strict surface, δ=−codim | Closed δ=−2; support Λ(−2)[−4] in degree 4; shift +4 would give degree −4 | Added sign witness; retain theorem. |
| §6.5 perverse definition | Geometric point p=0 | Stalk and costalk bounds give usual degree 0 heart | Actual geometric conditions, not free predicates. |
| §6.5 trait heart and shift API | p=−2δ, normalized trait complex | Generic degree −2=p(η); closed costalk degree 0=p(s); adding k=1 corresponds to shift −1 | Heart and shift signs retained. |
| §6.5 negative control | Trait with Λ unshifted | Generic degree 0>−2 | Λ fails the stated upper condition; retain. |
| §6.6 existence/uniqueness | Geometric point with pinning | Pinning-preserving scalar a must satisfy a·1=1, hence a=1; End Λ=Λ, τ≤0RHom=Λ | Unmarked automorphisms excluded; retain. |
| §6.7 regular pullback | A¹ over geometric point | δ_regular=(0,−1), K=Λ | Ordinary pullback retained. |
| §6.7 exceptional pullback | Same smooth map; étale identity | δ_finiteType=(1,0), K=Λ(1)[2]; identity shift 0 | Exceptional normalization differs by (1)[2]; retain. |
| §6.8 open tensor–Hom exchange | j=id, U=empty, trait generic j | Results K,0,Rj_*Λ; trait closed stalk degrees 0,1 are Λ,Λ(−1) versus 0 for j_! | Correct right adjoint retained. |
| §6.8 dualizing predicate/biduality | Geometric point K=Λ versus Λ² | DDΛ=Λ in first case, End(Λ²)=Λ⁴ in second | Wrong rank-two model excluded. |
| §6.8 invertible comparison | Λ=ℤ/6, L=𝔽₂⊕𝔽₃[1] | L⊗(𝔽₂⊕𝔽₃[−1])=𝔽₂⊕𝔽₃=Λ | Prime-factor shifts can differ; retain. |
| §6.8 finite quasi-injective convention | Regular point; strict trait | Support degrees 0 and 2 give finite bounds at dimensions 0,1; n=1 gives zero regardless of dimension | n≥2 and geometric criterion retained. |
| §6.9 biduality | Point over ℤ/4, module ℤ/2 | Hom(ℤ/2,ℤ/4)={0,2} and double dual ℤ/2; Tor amplitude infinite | Finite-Tor condition is not imposed on every input M. |
| §6.10 duality/shift necessity | Normalized trait, ℤ/6 coefficient factors | Shift indices (−2,0) and (−3,−1); both rise by 2; floors of −n/2 give (1,0) | Factorwise dimension necessity retained. |
| §6.11 regular normalized complex | d=0,1,2 | K=Λ,Λ(1)[2],Λ(2)[4]; closed support degree 0 in all three | Added surface Check; retain. |
| §6.12 local duality | Strict trait F=Λ | H²_s(Λ)=Λ(−1)=Hom(H⁻²(K)_s,Λ) | Degree −i in dual is correct. |
| §7.1 principal open vanishing | Trait parameter; f=0; unit outside domain | Generic cohomology H¹=Λ(−1), H²=0; empty open all groups 0; whole strict local H⁰=Λ | Domains and threshold retained. |
| §7.2 extension by zero | Trait parameter; regular surface; f=0 | H⁰_s(j_!Λ)=0; on surface H¹_s(j_!Λ)=0; zero f gives zero sheaf | Bound i<d retained. |
| §7.3 local Lefschetz | DVR, uniformizer; f=0; d=0 | At d=1 map 0→Λ injective in degree 0; f=0 gives identity; d=0 boundary degree −1 groups 0 | Integer subtraction and boundary degree correct. |
| §7.3 hypersurface consequence | Strict regular surface modulo x | Ambient support starts in degree 4; quotient trait support starts in degree 2, hence vanishes below d−1=1 | No false assertion at the next degree. |
| §8.1 matching definition | Two rank-one valuation factors, nonzero ϖ | Closed complement subsets count 2²=4; complement {s₂} must stay {s₂}, not {s₁} | Labelled matching matters; retain. |
| §8.1 zero-parameter opens | Same two factors in char p, ϖ=0 | Each has 3 opens, product has 3²=9 versus 4 in nonzero case | Degenerate parameter distinguished. |
| §8.1 order/union/intersection API | Complements ∅,{s₁},{s₂},{s₁,s₂} | Complements of unions/intersections are intersection/union of these same labelled sets | Order and lattice laws retained. |
| §8.1 whole/generic/principal API | U=whole; U=D(ϖ); D(b)∪D(ϖ) | Complements ∅,V(ϖ),V(b,ϖ) are identical in the common quotient | Sources and targets determined; retain. |
| §8.2 multiplicative localization | Complete perfect char-p valuation ring, nonzero nonunit parameter | Coordinates (a,a^(1/p),…) multiply coordinatewise to (ab,(ab)^(1/p),…) | Multiplicative bijection, not mixed-characteristic additive identification. |
| §8.2 localization-at-zero Check | A=𝔽_p, ϖ=0 | Both localized rings have 1 element; inverse limit also 1 versus p before localization | Added discriminating Check. |
| §8.3 idempotent bijection | Two valuation factors | Exactly 4 idempotents; primitive squares equal themselves; their product 0 | Added orthogonality Check excludes collapse. |
| §8.3 restriction/functoriality | Restrict whole two-factor spectrum to first factor | (1,0)↦1, (0,1)↦0 on both tilts | Comparison compatible with restriction; retain. |
| §8.4 product cohomology | One and two ACF factors; empty generic open | H⁰=G,G²,0; higher groups 0 | Product comparison preserves primitive components. |
| §8.4 infinite product components | Idempotent e_J and ultrafilter U | e_J=1 at U iff J∈U; tilt has the same 0/1 value | No rank-one inference for ultraproducts. |
| §8.5 cohomology comparison | Perfect A=𝔽_p, ϖ=0, G=ℤ/ℓ | H⁰=H¹=ℤ/ℓ on both sides, H^q=0 for q>1, including ℓ=p | Added Check excludes false perfect-ring acyclicity. |
| §8.6 support comparison | Z=empty; A=𝔽_p, Z=whole | Empty supports all 0; whole supports H⁰=H¹=ℤ/ℓ on both sides | Added third Check preserves positive cohomology. |
| §8.6 nondiscrete valuation support | A=𝒪_C, Z=V(ϖ), C ACF | Whole and generic terms H⁰=G→G identity, higher groups 0; fibre complex 0 | DVR support class cannot be transferred to nondiscrete ring. |

## Unresolved items

No unresolved port, build, gate, or dependency-direction issue remains.

The review’s three explicit conditional mathematical deliveries remain unchanged: `ILLUSIE-2003` at LefschetzPencilsAndVanishingCycles §6.2, `equicharacteristic-cohen-coefficients` at DeformationAndDerivedPatchingAlgebra §1.10, and `generic-constructibility-noetherian` at EtaleCohomologyFoundations §F.3. They are precise supplier contracts, not substitutes in Lean. The henselian/excellence and Elkik finite-algebra completion contracts are also retained explicitly. No existing supplier file was edited.

Original-source access limitations for Ill03 and Epp73 remain as described above. No suspicious instruction from the source material was acted on. No helper agents were used.


Pull request: #1743 (roadmap/etale-duality-and-perverse-sheaves-part-ii at 361dda3)
