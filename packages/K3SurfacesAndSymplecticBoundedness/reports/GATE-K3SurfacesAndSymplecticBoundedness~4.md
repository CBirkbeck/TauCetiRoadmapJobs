## H01 (CBirkbeck) — answered

The shared ownership overlap remains real at NeronModelsAndSemistableAbelianVarietiesPartII head `e974688`: its §§2.1, 2.3/2.5 and 4.1–4.2/4.16–4.17 still develop the common carrier, geometric fibres, canonical formula and regular Jacobian, while `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:15` and `:1344` now specify the local ownership boundary and the intended downstream imports. Replacing those companion targets by imports/applications remains outstanding because this job authorizes edits only to this roadmap's README and Suggested.lean; the report does not claim that the cross-proposal transfer is complete.

## H02 (CBirkbeck) — applied

At `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:719`, the algebraically-closed-field, automatically minimal carrier becomes an arbitrary-field carrier with a separate relative-nef minimality condition, and `:721`–`:724` specify full fibres, localization to the native proper DVR model, constant-field change, identity/tower laws and minimality comparisons. The geometric theorems retain their algebraically closed relatively minimal domain at `:736`, and the Checks at `:730`–`:734` distinguish the F₂ product, a nonminimal blowup, an inseparably thickened base point and a regular generic curve that becomes a cusp under function-field extension (enriques-one line 17390, line 17419 and line 17424).

## H03 (CBirkbeck) — answered

The omitted prerequisites are correct: K3Surfaces Conventions/K0/K0.A/K1–K2 and NoncommutativeAndEquivariantIwasawa §0.1 are direct inputs, while TopologicalSheafCohomology TS3.1–TS3.3/TS3.7 and CharacteristicClasses C1.2/S0–S5 enter through ComplexComparisonPartII C6.1 before C6.3/C6.6; the README records them at `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:66`, `:134` and `:168`. The worker must add these prerequisites to both description sections, remove the assertions that every other named roadmap is a consumer and that no other author's open roadmap is needed, and advertise the generic §6.0b → NeronModelsAndSemistableAbelianVarietiesPartII direction; editing the live description is outside this job's permitted writes.

**Finding numbering.** The first numbered review finding contains two distinct points, ownership transfer and the arithmetic interface; these are H01 and H02, followed by the description correction H03.

**Concrete prerequisite corrections.** All four directories below are absent from main `dfdf9a36`, including its completed roadmaps, and the indexed open heads give the following contracts. This is the verified minimum correction, not certification of the entire transitive closure; retain the other advertised prerequisites that the actual stage graph requires.

| Prerequisite | Open proposal and checked head | Exact consumed stages | Required order |
| --- | --- | --- | --- |
| K3Surfaces | #1285, `43784f8`, kim-em | Conventions, K0, K0.A, K1–K2 | These stages → specialization adapter and coherent/Betti inputs here |
| NoncommutativeAndEquivariantIwasawa | #1307, `3ec4ff3`, CBirkbeck | §0.1 only; its congruence Check and torsion-free uniform-group definition | §0.1 → §4.5 → §§4.6, 6.6; no later Iwasawa arithmetic layer is a premise |
| TopologicalSheafCohomology | #973, `f06755a`, kim-em | TS3.1–TS3.3 and TS3.7 on the stated support/CW domains | These stages → ComplexComparisonPartII C6.1 → C6.3/C6.6 → §3.1 here |
| CharacteristicClasses | #896, `d077cb4`, kim-em | C1.2a S0–S5 and the C1.2b comparison, as required by C6.1 | Same comparison chain; retain its coefficient and support hypotheses |

ComplexComparisonPartII head `2d50a88`, C6.1's Needs paragraph, explicitly names both topological suppliers, and C6.3 requires C6.0–C6.2. The local generic genus-one prefix supplies only the shared statements on their stated domains: the companion's additional generality over arbitrary excellent DVRs in §4.17 must be retained or explicitly adapted, rather than claimed to follow from an algebraically-closed geometric statement.

**Ownership and citation verification.** Searched the main roadmaps, the board packages and the indexed open heads by genus-one fibration, regular Jacobian, relative minimality and the underlying model/Picard objects, including the supplied sibling checkouts. The other matches are K3/Enriques specializations and WeilConjectures' forwarding/application contracts; the board's AlgebraicModuliForArithmeticGeometryPartII design refers to finite-field fibre descent, not construction of the common carrier. The generic prefix stays here because NeronModelsAndSemistableAbelianVarietiesPartII is later in the merge order, whereas the K3 consequences use it internally; consuming that later roadmap would reverse supply. No other package or proposal was edited, and no new Lean declaration or copied supplier name was introduced.

The citation scan reports no unresolved roadmap citation. Its six earlier leads resolve as follows: the five IsK3 names are actual local theorem declarations in Suggested.lean, and Crystalline.wittCohomology_V_complete is the planned CR.4.7 declaration in CrystallineCohomology, not a claimed pinned-library theorem. The new StableReduction model citation was checked against its actual Layer 0, with smooth-generic minimal models in Layers 4–5; JacobianChallenge Layer C supplies flat coherent base change, and SchemeAndStackFoundations §2.20 and §§5.9–5.10 supply the relative-duality and residue-weighted intersection inputs.

**Sources and native carriers.** The changed carrier/localization statements use enriques-one line 17390 (arbitrary-field fibration), line 17417 (the algebraically closed global geometric domain), line 17419 (local curve DVRs) and line 17424 (localization and relative-nef minimality). The characteristic/ruled-source statements retain enriques-one line 17359, liedtke-surfaces line 749 and line 1326. These sources already have settled entries in `packages/K3SurfacesAndSymplecticBoundedness/sources.toml`; no new source or access request is needed, and the existing waived/uncertified citations remain settled.

The pinned packages are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. In `TauCeti/AlgebraicGeometry/Curves/StableReduction/Model/Basic.lean:44`, Model records a total scheme, flat finitely presented structure morphism and `genericFiberIso`; properness is the separate predicate at line 72, and regularity, relative minimality and generic smoothness are not fields. In the companion `Model/BaseChange.lean:66`, Model.baseChange takes a FiniteDVRExtension, with its canonical generic-fibre comparison at line 103; the new adapter agrees with that existing finite-extension construction and adds the global localization and arbitrary constant-field comparisons, rather than re-planning the native model API.

**Elaborated signatures.** Elaborated one scratch file containing `#check @name` for each of the nine actual declarations in Suggested.lean and compared every resulting type with its README statement; all succeeded and no binder repair was needed. The supplied transcript's apparent tenth declaration, `group`, came from a documentation sentence and is not a Lean declaration. A first scratch attempt additionally imported the model module, whose cached object file is absent; removing that unnecessary import yielded the successful complete nine-declaration check, while the model contract was verified directly in its pinned source.

| Declaration | README comparison | Change |
| --- | --- | --- |
| differentialForms | Explicit field k, scheme X, structure map f and degree p; native sheaf exterior power | None |
| IsK3 | Explicit field and structure map, relative dimension 2, properness, geometric integrality, existential canonical triviality, H¹=0 | None |
| isK3_fieldExtension_iff | Both field structures and Algebra k K retained; arbitrary field extension in both directions | None |
| IsK3.noVectorFields | IsK3 k f retained; the three native cohomology groups and internal-Hom tangent dual match §2.3 | None |
| IsK3.hodgeNumbers | IsK3 k f retained; Module.Finite k is explicit and the dimension formula quantifies over all p,q | None |
| geometricPicardRank | Explicit f and algebraic-closure pullback of native line-bundle classes | None |
| IsK3.picardGroup_finiteFree | IsK3 k f retained; finite and free over Z on actual additive line-bundle classes | None |
| IsK3.picardRank_bounds | Positive arithmetic rank, comparison with geometric rank, 22 bound and guarded characteristic-zero 20 bound | None |
| IsK3.boundedPicardDescent | IsK3 k f retained; finite separable intermediate field, actual degree bound and equality of ranks | None |

Suggested.lean is unchanged: these are the six statable headline theorems with their three real-bodied definitions, and its docstring records the missing geometric carriers. The arithmetic adapter remains a README construction target, not an added acceptance-file API catalogue.

**Adversarial mathematics record.** Values below are explicit instances of the definitions, formulas and interface statements; they test the stated generality and conventions rather than proving the deep existence theorems. The changed genus-one interfaces are separated into individual rows, followed by the existing acceptance statements and the geometric targets they depend on.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| §6.0b arbitrary-field carrier | E: y²+y=x³ over F₂; P¹×P¹ | E has three F₂-points and generic (h⁰,h¹)=(1,1); rational generic curve has (1,0) | Product E×P¹ qualifies over F₂; rational product fails genus | Algebraically closed field → arbitrary field |
| §6.0b dimensions and geometric integrality | E×P¹; empty surface | Dimensions (2,1), nonempty integral generic fibre; empty fibre has h⁰=0 | Empty object excluded | Explicit geometric integrality over k |
| §6.0b relative minimality | Product; blowup at rational fibre point | Product relative canonical degrees 0; exceptional curve E₀²=−1 and K_relative·E₀=−1 | Blown-up carrier exists but is not minimal | Minimality removed from carrier and stated separately |
| §6.0b elliptic/quasi-elliptic distinction | Smooth elliptic cubic; y²=x³+t over F₂(t) | Cubic has smooth genus 1; latter has regular local ring at (x), but geometric cusp delta 1 | Regularity does not imply smoothness | Both conditions compared explicitly |
| §6.0b full schematic fibre | Product over t²−a in F₂(a)[t] after b²=a | Pulled-back equation (t−b)²; length 2 versus reduced length 1 | Reduction loses the fibre divisor | Scheme structure retained |
| §6.0b open restriction | Product over P¹ and A¹ | Generic (h⁰,h¹)=(1,1) in both; global h⁰ is 1 versus dimension of k[t], which is infinite | Carrier survives restriction; global Euler claim needs proper C | Restriction and properness separated |
| §6.0b isomorphism and restriction functoriality | Identity; consecutive inclusions G_m⊂A¹⊂P¹ | Generic map is id followed by id = id; restriction in either order is E×G_m | Same total space and structure map | Identity/composition comparisons specified |
| §6.0b generic cohomology | Product elliptic generic curve over k(t) | H⁰=k(t), dim H¹=1, hence arithmetic genus 1 | Both genus conditions hold | Explicit field and dimension |
| §6.0b native-model adapter | Product at t=0 | R=k[t]_(t), F=k(t), total E×Spec R; generic E_F, closed E_k | Flat proper finitely presented model with specified generic identification | Adapter supplied |
| §6.0b generic-fibre identification | Localized product | (E×Spec R)×_R F = E_F; composite comparison is identity on E_F | Unmarked abstract isomorphism is insufficient | Canonical iterated-pullback identification |
| §6.0b properness and regularity beyond Model | Product; blown-up product | Both maps proper; local rings regular of dimensions at most 2; blowup still has exceptional square −1 | Model does not encode minimality | Extra properties proved separately |
| §6.0b localization under restriction | t=0 in A¹ and P¹ | Both local rings k[t]_(t); both model fibres E_F and E_k | Same model up to specified comparison | Restriction-localization law |
| §6.0b field-change construction | E×P¹ over F₂→F₄ | Total dimensions (2,1) remain (2,1); generic h⁰=h¹=1 after coefficient change | Carrier persists | Arbitrary-field construction specified |
| §6.0b inseparable constant extension | k=F₂(a), K=k(b), b²=a | X_K=E_K×C_K smooth; relative canonical degree 0 remains 0 | No separability restriction on constants | Purely inseparable case retained |
| §6.0b regularity boundary | y²=x³+t; t=u² | Before extension maximal ideal (x) has embedding dimension 1; afterwards ideal (x,y−u) has embedding dimension 2 in dimension 1 | Arbitrary function-field extension can destroy regularity | Explicit negative control |
| §6.0b smoothness reflection | Product elliptic curve; quasi-elliptic generic curve | Smooth locus is entire generic curve in first case; geometric cusp has delta 1 in second | Constant extension preserves and reflects the distinction | Faithfully flat comparison |
| §6.0b relative-minimality field comparison | Product; exceptional curve after extension | Degrees 0→0 and −1→−1 at a rational point | Both true and false cases retained | Preservation and reflection specified |
| §6.0b identity/tower field comparisons | k→k and F₂→F₄→F₁₆ | E_k→E_k is id; tensoring constants in either order yields E_F₁₆ | Correct source/target and composition | Tower laws specified |
| §6.0b local models after field change | Product, c=t=0, c′ above c | k[t]_(t)→K[t]_(t); both constructions give E_K×Spec K[t]_(t) | Same prescribed generic fibre E_K(t) | DVR/fraction-field comparison |
| §6.0b native finite-DVR base-change comparison | Product over F₂→F₄ at t=0 | Native and localized total spaces both E_F₄×Spec F₄[t]_(t); generic fibre E_F₄(t) | Reuses the existing finite-extension construction | Comparison added |
| §6.0b residue-field fibre comparison | Product at a closed degree-2 point over F₂ | Residue extension F₄→F₁₆ gives E_F₄×F₄ F₁₆=E_F₁₆ | No reduction or rational-point assumption | Explicit κ(c)→κ(c′) |
| §6.0b local/global minimality | Product; one blowup over c | All local vertical degrees 0; blown-up localization has degree −1 | Global nef condition iff every localization satisfies it | Local/global equivalence specified |
| §6.0b comparison with minimal regular models | Smooth generic product; its blowup | Product has no exceptional curve; blowup contraction removes one exceptional class and leaves same generic E_F | Positive-genus minimal model identified; blowup is not it | Smooth-generic supplier domain retained |
| §6.0b geometric restriction on later targets | F₂-product→algebraic closure | Field changes, genus stays 1; algebraically closed geometric component count computed only after extension | No arithmetic Kodaira/canonical theorem inferred without its hypotheses | Explicit algebraically closed relatively minimal standing clause |
| §6.0b characteristic restriction | Cuspidal genus-one geometric generic curve, p=3,5 | Delta=1; divisors (p−1)/2=1,2; 1 divides 1, 2 does not | p=5 excluded; p=2 separately retained | Geometric theorem unchanged |
| §6.0b ruled-source/unirationality | C=P¹; C elliptic | Ruled source birational P¹×P¹ in first case; second has map to genus-1 C | Rational source conclusion only for P¹ | Proper geometric scope explicit |
| §6.0b primitive multiplicity | Double smooth fibre; I₀* | gcd(2)=2; gcd(2,1,1,1,1)=1 | Primitive differs from reduced | Unchanged |
| §6.0b component radical | I₀* star | Matrix times (2,1,1,1,1)=0; times all-ones=(2,−1,−1,−1,−1) | Full integral radical required | Unchanged |
| §6.0b geometric Kodaira incidence | I₂/III; I₃/IV | Root ranks 1/1, 2/2 and determinants 2/2, 3/3; incidence points 2/1, 3/1 | Lattice alone does not determine fibre scheme | Unchanged |
| §6.0b root quotient and field extension | I₂; smooth I₀ | Root form [−2], determinant 2; rank-zero root has determinant 1 | Geometric extension changes neither | Unchanged |
| §6.0b square-index determinant | 2Z⊂Z with form [−2] | index 2, determinants 8 and 2; 8=2²·2 | Direction of formula correct | Unchanged |
| §6.0b Hodge line and torsion quotient | Product; numerical χ=2,t=1 | L=O,T=0 for product; deg L=−2−1=−3, versus −2 if torsion dropped | T cannot be discarded | Unchanged |
| §6.0b splitting and intrinsic quotient | L⊕T→L | Kernel T, quotient L; adding a map L→T changes splitting but not quotient | Choice of splitting is not data | Unchanged |
| §6.0b canonical formula | Elliptic product; Jacobian K3 over P¹ | ω_C degree −2; deg L=0 or −2; degree of ω_C⊗L⁻¹ is −2 or 0 | Correct inverse and base-canonical factor | Unchanged |
| §6.0b wild/tame coefficient range | m=1; tame m=2 | a=0; a=1, both 0≤a<m | a=m fails | Unchanged |
| §6.0b Jacobian zero section and multiplicities | Section C₀, fibre mFbar | 1=C₀·mFbar=m(C₀·Fbar) gives m=1 | Torsor may have m=2; Jacobian may not | Unchanged |
| §6.0b Jacobian Euler comparison | Kernel/cokernel lengths t=0,1,2 | Differences 0−0=1−1=2−2=0 | χ unchanged | Unchanged |
| §6.0b primitive-type versus actual-fibre comparison | Nonmultiple fibre; double smooth torsor fibre | m=1 preserves full type; m=2 versus Jacobian m=1 cannot be an isomorphism of full fibres | Actual-fibre claim restricted to nonmultiple case | Unchanged |
| §6.0b quasi-elliptic Picard group | Twisted additive group after splitting | [p] on G_a is p·x=0; smooth elliptic group remains proper and is not G_a | Both generic Jacobian cases retained | Unchanged |
| §6.0b vertical restriction kernel | Pullback degree-zero line from positive-genus C | Generic restriction has degree 0 and class 0; vertical pullback need not be generated by one fibre | Entire Pic(C) retained | Unchanged |
| §6.0b generic restriction and section splitting | Jacobian product and zero section | Degree map sends zero-section divisor to 1; subtracting its degree leaves degree 0 | Generic degree split uses an actual section | Unchanged |
| §6.0b section/fibre matrix | χ=2 and χ=1 | Determinants (−2)·0−1=−1 and (−1)·0−1=−1; shifted χ=2 section square −2+2=0 | Even/odd parity distinguished | Unchanged |
| §6.0b finite Mordell–Weil determinant | A₈⊂E₈, index 3 | 9=3²·1; single-index factor would give 3 | Square torsion order required | Unchanged |
| §6.0b finite-torsion hypothesis | E over algebraic closure of finite field | E(k) infinite torsion, rational rank 0; no finite integer order m | Rank zero alone insufficient | Unchanged |
| §6.0b rank-five K3 pencil | Rank-one [4]; multiple fibre 2F | 4x²=0 implies x=0; (2F)²=0 but divisibility 2 | Rank and primitivity hypotheses necessary | Unchanged |
| §1.1 differentialForms, exterior API | Local cotangent rank 2, p=0,1,2,3 | Ranks 1,2,1,0; tensor cube rank 8 | Native exterior powers have intended degrees | Unchanged |
| §1.1 IsK3 | Smooth quartic, P², E×E, empty scheme | Quartic (ω,h¹)=(O,0); P² has ω=O(−3); E×E has h¹=2; empty h⁰=0 | Positive and negative examples separate five conditions | Unchanged |
| §1.1 canonical triviality | σ and 2σ over C | Both give existence of ω≅O; zero σ gives zero, noninvertible map | No chosen trivialization stored | Unchanged |
| §1.2 field-extension iff | Quartic over k→k; Fermat over F₂→algebraic closure | True↔true for identity smooth quartic; nonreduced fourth hyperplane stays nonreduced, false↔false | Both directions and inseparability retained | Unchanged |
| §1.3 projectivity and K3 adapter | Smooth quartic | O(1) has square 4; both presentations use identical f | Same object, no embedding stored | Unchanged |
| §1.3 analytic algebraization counit | Complex quartic hyperplane | Pullback of H has square 4, not −4 or 16 | Specified isomorphism preserves Picard class | Unchanged |
| §1.4 coherent invariants | O on K3 | h⁰=1,h¹=0,h²=1; χ=1−0+1=2 | Correct Euler normalization | Unchanged |
| §1.4 integer RR | L=O,H,H⁻¹ on quartic | 2χ=4,8,8; 4+L²=4,8,8 | Formula remains integer-valued at p=2 | Unchanged |
| §1.4 contraction and scaling | σ(e₁,e₂)=1; 2σ | Images (e₂*,−e₁*) and (2e₂*,−2e₁*); determinant 1 and 4 over C | Zero map excluded; p=2 first determinant still 1 | Unchanged |
| §1.5 numerical kernel | O; rational curve C | O pairs 0; C²=−2, so C not in kernel | Zero class included and nonzero curve excluded | Unchanged |
| §1.5 Picard torsion | n[L]=0, n>0 | n(L·M)=0 in Z gives L·M=0 | No division in k or lost p-torsion | Unchanged |
| §1.6 quartic construction | Fermat at p=2,3 | Partials 0 at p=2; at p=3 partials x_i³, no common projective zero | Smoothness excludes the nonreduced case | Unchanged |
| §1.6 quartic Euler polynomial | t=−1,0,1,2 | 2t²+2=4,2,4,10 | Negative t allowed for Euler, not vanishing | Unchanged |
| §2.1 relative Picard universal functions | K3 fibre | h⁰(O)=1,h¹(O)=0; tangent Pic=0 | Universal-functions and unramified comparison match | Unchanged |
| §2.1 Picard base change/zero/torsion | Zero line and a nonzero line | Zero maps to 0 under every pullback; nonzero torsion order impossible by numerical kernel | Identity and torsion subfunctors are zero section | Unchanged |
| §2.1 rational-point obstruction | Native Pic→relative Pic points | Trivial line has obstruction 0; real quaternion class can have obstruction of order 2 | Injection does not assert surjection | Unchanged |
| §2.1a Witt kernel witness | Zero versus nonzero x | d(0)=0 cannot refute injectivity; x≠0 and dx=0 can | Nonzero witness required | Unchanged |
| §2.1a conditional vector-field reduction | Actual K3 after §2.3 | H⁰(T)=0, so nonzero-vector-field premise is false | Conditional proof input is not an existence assertion | Unchanged |
| §2.2 closedness | Zero one-form in p=2 | d0=0; no scalar 1/2 appears | Dyadic branch retained | Unchanged |
| §2.3 noVectorFields | K3; abelian surface | K3 cohomology dimensions (h⁰Ω¹,h⁰T,h²T)=(0,0,0); abelian surface has h⁰T=2,h¹O=2 | Non-K3 countermodel excluded by predicate | Unchanged |
| §2.4 hodgeNumbers | (p,q)=(0,0),(1,1),(2,2),(3,0),(0,3) | Dimensions 1,20,1,0,0; match expression 1,20,1,0,0 | Out-of-range degrees zero, finite dimension explicit | Unchanged |
| §2.4 crystalline ranks | Degrees −1 through 5 | Reductions have ranks 0,1,0,22,0,1,0; Euler 24 | Free integral ranks agree with diamond | Unchanged |
| §2.4 torsion detection | Candidate W/p in M² or M⁰ | M²[p] or M⁰[p] has dimension 1, contradicting H¹_dR=0 or H⁻¹_dR=0 | Freeness is not inferred from perfectness alone | Unchanged |
| §2.5 marked deformation | First-order dual numbers | Tangent dimension 20, automorphism and obstruction dimensions 0 | Marking removes global stabilizer ambiguity | Unchanged |
| §2.6 line deformation | L=O; nontrivial ample L of square 4, p=3 | Trivial locus dimension 20; nonzero obstruction gives 20−1=19; 4 mod 3=1 | Trivial line excluded; good-prime smoothness correctly scoped | Unchanged |
| §2.6 crystalline normalization | L=M^p | c₁,dR(L)=p c₁,dR(M)=0; normalized integral class divides out p | Zero reduction does not refute flatness proof | Unchanged |
| §2.7 polarized lifting | Fermat quartic in p=3 | Same equation over W(k) has partials 4x_i³, not all zero on a projective fibre; H²=4 | Concrete unramified lift exists; theorem also permits ramification | Unchanged |
| §3.1 integral étale ranks | Complex or prime-to-p quartic | Ranks 1,0,22,0,1; Euler 24 | ℓ=p excluded, ℓ=2 allowed when invertible | Unchanged |
| §3.1 trace and twist | Point; hyperplane | tr(point)=1, tr(c₁(H)²)=4 | Positive pairing and twists preserved | Unchanged |
| §3.1 exponential normalization | Positive exp(2πit) loop | Lift increment 1; c₁(O(1))[P¹]=1 | Reversed sign or rescaled kernel fails | Unchanged |
| §4.1 Picard injection/intersection | Identity field; real→complex hyperplane | Class unchanged for identity; pulled-back square 4=4 | No field-degree rescaling on two pullbacks | Unchanged |
| §4.1 Galois comparison | Real Fermat skew conjugate lines | Each square −2, mutual intersection 0; classes cannot agree | Nontrivial geometric Galois action retained | Unchanged |
| §4.1 inseparable rational comparison | Degree pⁿ, n=0,1 | Cokernel killed by 1 or p; tensor Q kills either | Rank descent need not be integral descent | Unchanged |
| §4.1 specialization | Constant quartic family | Hyperplane square 4→4; identity class maps to identity | Injectivity/form preservation, no surjectivity claim | Unchanged |
| §4.2 finite free Picard and lattice | Rank-one degree-4 K3 lattice | Carrier Z, Gram [4], determinant 4, signature (1,0,0) | Freeness does not imply unimodularity | Unchanged |
| §4.2 half-norm and zero class | H, rational C, O | (B,Q)=(4,2),(−2,−1),(0,0) | Correct bilinear/half-norm convention | Unchanged |
| §4.2 residue-weighted projection | Real line, complex extension | Pullback square 1; pushed-forward line class 2H, pairing 2 | Projection degree 2 belongs on pushforward comparison | Unchanged |
| §4.3 geometricPicardRank | Algebraically closed rank 1; Fermat C and R | First geometric rank 1; real/complex geometric rank 20, arithmetic real rank strictly smaller | Arithmetic rank can change, geometric rank cannot | Unchanged |
| §4.4 picardRank_bounds | Rank-one polarization; supersingular rank 22 | 1≤1≤22; at characteristic p, 22≤22 while h¹¹=20 | Characteristic-zero upper bound 20 separately guarded | Unchanged |
| §4.4 saturated cycle map | Multiplication by ℓ on Z_ℓ | Equal rank and injective, but cokernel Z/ℓ nonzero | Saturation needed before equal-rank isomorphism | Unchanged |
| §4.5 congruence reduction | GL₀; −1 in GL₁ at 3 and 2 | Orders 1,2,2; reductions 1,2,1 respectively | Odd prime essential | Unchanged |
| §4.5 nontrivial unipotent | I+3E₁₂ | m-th power I+3mE₁₂; E₁₂²=0 | No positive m gives identity in characteristic zero | Unchanged |
| §4.5 finite nonabelian subgroup | S₃ permutation matrices in GL₃(Z) | Six distinct permutation matrices remain distinct mod 3 | Argument applies beyond cyclic or abelian groups | Unchanged |
| §4.6 boundedPicardDescent | Algebraically closed base; rank r<22 | Extension degree 1; padded representation diag(A,I_(22−r)) has same kernel | Quantifier realizes rank, not all classes unconditionally | Unchanged |
| §4.6 integral obstruction | Finite field; invariant class index 2 model | Brauer group 0 for finite field; 2Z⊂Z has same rational rank but index 2 | Extra integral-descent hypotheses retained | Unchanged |
| §5.1 symplectic predicate | id; canonical scalars −1 and 1 | id scalar 1; −1≠1 in C but −1=1 in F₂ | Correct characteristic dependence | Unchanged |
| §5.1 composition/base-change | f*σ=aσ,g*σ=bσ | (f∘g)*σ=abσ; inverse scalar a⁻¹; after faithful field change a=1 iff image(a)=1 | Inverse pullback gives left representation | Unchanged |
| §5.2 polarized stabilizer | Wehler σ₁ with H₁,H₂ | σ₁*H₁=H₁; σ₁*H₂=4H₁−H₂≠H₂; canonical scalar −1 | Three groups distinguished | Unchanged |
| §5.2 powers and scalar choices | n=1,2; multiplying line-isomorphism by 2 in C | n(f*L−L)=0 forces f*L−L=0; same surface map after scalar 2 | Stabilizer keeps no chosen line-isomorphism | Unchanged |
| §5.3 finite étale stabilizer | Polarized involution; characteristic-2 tangent | Involution group has at least two points, tangent dimension 0 | Finite does not mean trivial; étale need not have prime-to-p order | Unchanged |
| §5.4 Wehler surface and pairing | S₁,S₂, Gram [[2,4],[4,2]] | Each S_i²=I and S_iᵀBS_i=B; det B=−12 | Actual column convention validated | Unchanged |
| §5.4 infinite symplectic product | S₂S₁ | [[−1,−4],[4,15]], trace 14, determinant 1; canonical scalar (−1)²=1 | Eigenvalue 7+4√3>1, infinite order | Unchanged |
| §6.0 supersingular sign/exponent | p=2,σ=1; p=3,σ=2 | Discriminants −4,−81; group orders 4,81 | Signed determinant differs from discriminant order | Unchanged |
| §6.0 extreme Artin invariants | σ=0,11, signature (1,21) | Signature difference −20≡4 mod 8 | Even unimodular rescaling impossible in either excluded branch | Unchanged |
| §6.0a height inequality | h=1,10,11 | 22−2h=20,2,0 | h=11 contradicts positive Picard rank; infinity not substituted | Unchanged |
| §6.0c height/pencil rank | ρ=21; finite h=1 | Rank 21 excludes finite height; pencil at infinite height forces 22; ordinary h=1 only gives ≤20 | Elliptic alone does not imply rank 22 | Unchanged |
| §6.1 quotient and exceptional lattice | G=1; tame involution | Root ranks 0 and 8; determinants 1 and 2⁸ | Identity and nontrivial quotient cases agree | Unchanged |
| §6.1 rank-20 nonsquare | Candidate 2A₁₀ | Rank 20, determinant 11² | Square determinant excluded by K3 argument | Unchanged |
| §6.1a cyclic Euler identity | n=2, a₂=8 | 24(2−1)=24=8·3 | Correct orbit weighting | Unchanged |
| §6.1a subgroup fixed count | n=4, a₄=4,a₂=2 | Full relation 72=60+12; square fixes 4+2·2=8 | Subgroup test differs from full-order count | Unchanged |
| §6.1a candidate order 14 | a₂=a₇=a₁₄=1 | 312=21+96+195; order-7 fixed 3, involution fixed 8 | Arithmetic retains candidate before lattice exclusion | Unchanged |
| §6.1a excluded higher powers | n=9,16 | 6=2+3a₃ would give a₃=4/3; 2=1+2a₈ gives a₈=1/2 | Orbit counts not integral | Unchanged |
| §6.1a rank-20 determinant exclusions | n=11,14,15 | Ranks 20,20,20 and determinants 121,196,225 | Square determinants exclude all three | Unchanged |
| §6.2 fixed-point table | Orders 2,3,4,5,6,7,8 | Counts 8,6,4,4,2,3,2 from ε; identity fixes a surface | Nonidentity condition essential | Unchanged |
| §6.2a wild fixed locus | D²=2,d=1 | N=2, N−d−1=0, inequality 0≤2 | No division by zero or bound inferred | Unchanged |
| §6.2a quotient divisor and radical | κ=0 versus κ=1 | ADE determinant nonzero versus affine fibre determinant 0 | Fixed cycle and fibre cycle not interchanged | Unchanged |
| §6.3 free characteristic-2 quotient | Free C₂ action | e(Y)=24/2=12; b₂(Y)=12−2=10 | Cannot be cohomologically trivial on H² of rank 22 | Unchanged |
| §6.3 transcendental comparison | Rational resolution | Transcendental quotient dimension 0; identity H² would force algebraic rank 22 | Correct rational-coefficient conclusion | Unchanged |
| §6.3a refinements | p=11,13 | 11≤11; invariant-pencil branch impossible at 13 | Exceptional prime retained; no arbitrary elliptic-surface claim | Unchanged |
| §6.4 wild prime bound | p=2,13 | 2≤11; at 13 no finite subgroup order divisible by 13 | All-characteristic bound, no tame assumption | Unchanged |
| §6.4a rank-22 Picard faithfulness | id; degree-two deck involution in characteristic 0 | Identity fixes every class; deck fixes one ample class but not forced to fix all Picard at rank 22 | Full Picard and rank hypotheses retained | Unchanged |
| §6.5 cohomological faithfulness | Identity-action candidate, tame involution | H² identity trace 22 versus involution trace 8−2=6 | Kernel excludes involution; wild free case gives 10≠22 | Unchanged |
| §6.6 universal bound | G=1; characteristic 3 | 1≤both GL bounds; coefficient prime 5≠3 | Identity and forbidden coefficient prime handled | Unchanged |
| §6.7d tame invariant lift | Symplectic involution, p≠2 | H² invariants (22+6)/2=14; tangent 14−2=12 | Correct invariant deformation dimension | Unchanged |
| §6.7d scalar of lift | a²=1, a mod p=1, p odd | Roots ±1 remain distinct; allowed root +1 | Argument unavailable at p=2 | Unchanged |
| §6.7d pencil rank | Involution versus identity | Anti-invariants (22−6)/2=8, plus ample =9; identity anti-invariants 0 | Nonidentity gives rank≥9 | Unchanged |
| §6.7d integral modulo-2 negative control | Basis-swap matrix | Mod-2 matrix [[0,1],[1,0]]≠I | Source's generic modulo-2 inference not used | Unchanged |
| §6.8 Artin-invariant-one predicate | p=3: ranks/discriminants (22,−9),(22,−81),(20,−9) | σ=1,true; σ=2,false; rank condition false | Both defining conditions necessary | Unchanged |
| §6.8 realized Fermat tests | p=3,7,5 | At 3,7 rank 22 and signed discriminants −9,−49; at 5 height 1 implies rank≤20 | Field characteristic and geometric rank both tested | Unchanged |
| §6.8a invariant dimension | G=1,C₇,nonabelian order-21 group | 24; (24+18)/7=6; (24+84+18)/21=6 | Nonabelian and exceptional-order cases retained | Unchanged |
| §6.8a formal-Brauer trace boundary | (x,y)↦(−x,−y), characteristic ≠2 | Quotient generic rank 2; origin fibre k[x,y]/(x²,xy,y²) has dimension 3 | Finite-flat trace cannot be used at quotient singularity | Unchanged |
| §6.8a resolved trace | Degree-2 tame quotient on forms | trace∘pullback=2, a nonzero scalar when p≠2 | Proper coherent trace gives nonzero tangent | Unchanged |
| §6.9 Mathieu function | n=0,1,2,7 | 24/0=0 by total division; ε=24,8,3 for 1,2,7 | Zero has no element-order meaning | Unchanged |
| §6.9 character and invariants | Symplectic involution | Total trace 8; H² trace 6; total invariants (24+8)/2=16 | Character convention uses total 24-dimensional cohomology | Unchanged |
| §6.10 Mukai/Mathieu action | Trivial group; 1⁸2⁸; 23-cycle plus fixed letter | Orbits 24,16,2 | Five-orbit requirement excludes last case | Unchanged |
| §6.10 eleven-group bound | Maximal listed order | 960≤960 | Necessity only, no realization theorem imported | Unchanged |
| §6.11 exceptional tame branch | Four-orbit character; p=2 | Invariant count 4 is below 5; tame order is odd at p=2 | Exceptional branch not forced into five-orbit claim | Unchanged |
| §6.11 Mathieu order | Point stabilizer index 24 | 244823040/24=10200960 | 24-letter action retains stabilized letter | Unchanged |
| §7.1 geometric primitivity | Z generator e,2e,0 | Divisibilities 1,2,2 respectively (0=2·0) | e primitive; 2e and 0 fail | Unchanged |
| §7.1 squarefree degree | d=1 and n=2 candidate | n²=4 does not divide d=1 | Positive squarefree d forces primitive class | Unchanged |
| §7.2 root closedness | n=0,3 at p=3 | [0] identifies all classes; [3] has trivial kernel by Picard torsion-freeness | n>0 retained, no inverse of 3 used | Unchanged |
| §7.2 primitive openness, square-zero case | F,2F,0 | F²=(2F)²=0; section intersections 1,2; 0 has d=m=0 | Primitive loci whole, empty, empty | Unchanged |
| §7.3 polarized-family definition | Degree 4 class; d=0 | Square 2d=4 gives d=2; ample square 0 impossible | Positive degree and Picard-section data retained | Unchanged |
| §7.3 arrows and representative changes | Scalar 2 in a line-isomorphism over C | Underlying surface isomorphism unchanged; Picard difference 0 | No new arrow from scalar choice | Unchanged |
| §7.4 Hilbert polynomial | d=2,t=−1,0,1,2,3 | 2t²+2=4,2,4,10,20 | All integer t allowed for χ | Unchanged |
| §7.4 vanishing/h⁰ | m=0,1,2,3,d=2 | h²(O)=1 at m=0; h⁰=4,10,20 at positive m | Strict m>0 necessary | Unchanged |
| §7.5 embedding dimensions | d=1,2 | Section ranks 11,20; projective dimensions 10,19; cubic polynomials 9t²+2,18t²+2 | Rank minus one used for projective dimension | Unchanged |
| §7.5 separation inequalities | A=2L or 3L | Failure 0<2(L·D)<2 impossible; for 3L possible integer D²=1 contradicts evenness | Works also at characteristic 2 | Unchanged |
| §7.6 K3 Hilbert locus | Quartic cubic embedding; singular degeneration | Polynomial 18t²+2 in both; smoothness true versus false | Polynomial alone does not define locus | Unchanged |
| §7.6 canonical-class equality | O and ω on P² | Both rank 1; classes 0 and −3H distinct | Rank equality cannot replace Picard equality | Unchanged |
| §7.7 root atlas | Cubic hyperplane class 3λ | [3]λ=[O(1)]; torsion-free Pic gives at most one λ | Characteristic 3 does not erase uniqueness | Unchanged |
| §7.7 frame torsor | Quartic coordinate swap | x₀³↔x₁³ gives distinct frames, same embedded Hilbert point under stabilizer | Stack pullback retains family isomorphism | Unchanged |
| §7.7 Brauer–Severi descent | Quaternion obstruction α over R | 2α=0, 3α=α≠0 | Cubic representative need not exist globally | Unchanged |
| §7.7 representative/tower comparison | L→L⊗f*N→L⊗f*(N⊗M) | Sections tensor by N³ then M³, equal (N⊗M)³; projectivization unchanged | Scalar overlap ambiguity disappears | Unchanged |
| §8.1 quotient stack/stabilizer | Polarized involution | Stabilizer has order at least 2; one geometric isomorphism class still has nontrivial automorphisms | DM stack not a fine scheme | Unchanged |
| §8.2 trait extension/separation | Generic identity between constant families | Identity extends to identity; two extensions agree on dense generic fibre | Uniqueness concerns actual surface map | Unchanged |
| §8.3 coarse universal property | Object with polarized involution | One coarse point, at least two stack automorphisms | Coarse points discard stabilizers, not necessarily k-forms | Unchanged |
| §8.4 smooth arithmetic base | d=1,p=2,3 | 2d=2; localization inverts 2, retains 3 | Dimension 19 asserted only on Z[1/2] | Unchanged |
| §8.5 finite-field forms | k=F_q, fixed d | Br(k)=0; h⁰(L³)=9d+2 gives a finite-dimensional k-frame | Every k-form represented, not merely coarse rational point | Unchanged |
| Conventions: universes/nonempty field | Identity universe lift; zero ring | Ranks and squares 1 and 4 preserved by lift; 0=1 excludes Field structure on zero ring | No zero-ring field instance | Unchanged |
| Conventions: signed lattice and trace | Quartic H; rational C | Squares 4,−2; half-norms 2,−1; cup-trace 4 for H | Signs agree in all layers | Unchanged |
| Conventions: inverse pullback | Wehler deck involutions | (σ₁∘σ₂)*=S₂S₁, not S₁S₂; inverse scalar a⁻¹ | Representation direction agrees in every action | Unchanged |
| Conventions: tame/identity/24 letters | C₂ in p=2; identity in M₂₃ | Order 2 not invertible; identity character 24, not 23 | Tameness and retained-letter convention fixed | Unchanged |
| Supplier: local DVR model | Native fields at the pin | Flatness, finite presentation and generic isomorphism present; properness separate, regular/minimal fields absent (0 such fields) | Native carrier reused | Added exact supplier contract |
| Supplier: general surface RR/intersections | P² line and conic | L²=1, conic·line=2; K·L=−3 and χ(O)=1 | K3 RR specializes generic formula, does not replace it | Unchanged |
| Supplier: polarized descent | Disjoint union of Pⁿ | Ranks n+1 unbounded; no fixed finite N but projective bundle P(E) exists | Global H-projective not inferred | Unchanged |
| Supplier: rational quotient descent | C₂, coefficients Q₃ | Average (1+g)/2 satisfies square itself; 1/2 exists in Q₃ | Rational invariants exact, no integral claim | Unchanged |
| Supplier: exponential/Thom normalization | Positive simple zero | Winding increment 1, Thom multiplicity 1 | Chern sign matches quartic trace 4 | Unchanged |
| Supplier: formal Brauer trace | Degree 2, u=1+ε, ε²=0 | Norm u²=1+2ε; in char 2 tangent trace 0 | Nonzero trace assertion requires tame degree | Unchanged |
| Supplier: crystalline F,V | Witt coefficient p | FV=VF=p; in residue field p=0 | Integral p differs from zero reduction | Unchanged |
| Supplier: finite-height/additive separation | Height h=1 formal multiplicative and G_a | [p](T)=T^p versus 0 in char p | Nonzero finite-height p-series excludes additive identification | Unchanged |
| Supplier: odd congruence uniformity | n=0,1; ℓ=3,2 | Dimensions n²=0,1; −1 reduces to 2 at 3 and 1 at 2 | Exact §0.1 input, arithmetic layers unused | Unchanged |
| Supplier: rank-five isotropy | 2xy+z²−w²+v²; rank-one [4] | Nonzero vector (1,0,0,0,0) has value 0; rank-one 4x² has no nonzero rational zero | Real indefiniteness/rank hypotheses retained | Unchanged |
| Supplier: SL₂ group classification | A₄ versus binary tetrahedral | A₄ has 3 involutions; SL₂(C) only nonidentity involution −I | Binary order 24, not rotation order 12 | Unchanged |
| Supplier: Mathieu orders/character | Identity and order 2 | 244823040=24·10200960; fixed letters 24,8 | Bound and character conventions compatible | Unchanged |

**Build, gate and commit.** Commit `81f82a85` changes only `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md`; the worktree is clean and nothing was pushed. The targeted build exited successfully with the six expected admitted-theorem warnings:

```text
Build completed successfully (9040 jobs).
```

The prescribed dependency-direction check reports no UPWARD or CYCLE line:

```text
depcheck: 27 roadmaps, 235 edges, 0 problem(s)
```

The first gate attempt found only the then-uncommitted README change (`dirty=1`); after the required commit, the prescribed gate exited 0:

```text
gate K3SurfacesAndSymplecticBoundedness: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
