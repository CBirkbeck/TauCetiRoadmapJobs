<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13144#issuecomment-6783273512 -->
Review (codex) of 65ada2c

Verdict: needs_changes

1. **F01** (P2) Restore positive dimension in the Poonen synopsis

   **Location.** `packages/LefschetzPencilsAndVanishingCyclesPartII/README.md:102`: “gives inside a smooth projective geometrically integral variety over `𝔽_q` a smooth projective geometrically integral curve”. The downstream repetition is at lines 603–607; the adjacent Theorem 3.3 synopsis at lines 107–110 also omits its dimension hypothesis.

   **Claim.** The stated ambient hypotheses suffice for Poonen's curve-containing conclusion.

   **Witness.** Take `X = Spec 𝔽₂`, `F = X`, `U = X`: smooth, projective, geometrically integral, but dimension zero, with no curve subvariety. Poonen2004 line 537 explicitly requires `m ≥ 1`.

   **Exact repair.** Add “of positive dimension” to the ambient variety in the Corollary 3.4 synopsis and its downstream use. State `dim X = m ≥ 1` in the Theorem 3.3 synopsis, with intersection dimension `m − 1`. Distinguish the zero-dimensional case, which §2.4 already handles by a constant morphism from the affine line. Add a short negative control that `Spec 𝔽₂` contains no curve, although it admits the curve morphism required here. Keep all four Lean signatures unchanged.

   **Repair tested.** The additional hypothesis excludes `Spec 𝔽₂`, whose only nonempty reduced closed subvariety has dimension `0`. For `X = ℙ¹_{𝔽₂}`, the hypothesis holds and the curve `X` itself contains every prescribed finite set and meets every nonempty open. For the original zero-dimensional instance, §2.4 still returns `C = 𝔸¹_{𝔽₂}`, the constant map, and good open `C`; no narrowing of this roadmap's theorem is needed. This is a new missing-hypothesis finding, not a re-raising of the previous claim that Poonen cannot force open intersection.

One P2 finding: the revised synopsis of Poonen omits the positive-dimension hypothesis. The four previous findings are repaired in the respects they identified. All four headline signatures elaborate, agree with the README, and survive the padding probes. No package input was changed.

## Verified sound

### Previous findings, checked first

The repair report marked all four findings applied, none not actionable. I checked each against the text and its witness before the new pass.

| Round 2 finding | Repaired passage in `packages/LefschetzPencilsAndVanishingCyclesPartII/README.md` | Status and independently checked witness |
|---|---|---|
| R01: zero ring | Line 259: “For `m ≥ 2` and `k` nontrivial it is not injective”; lines 253–254 qualify origin failure; lines 237–238 qualify dimension-zero immersion failure. | Repaired. Over `ℤ/1ℤ` both rings have one element, the map is bijective, and `0=1` makes both origin values equal. Over `ℤ`, the kernel witness has coefficient `1` at `X_1` and image `0`; at base zero its origin values are `0` and `1`. The new Check at lines 280–284 records this. |
| R02: imported coefficient mechanism | Lines 62–64: “The Kronecker substitution for an arbitrary weight, with its coefficient and injectivity theorems, is Tau Ceti's”; lines 297–303 apply it to the bounded box. | Repaired. The actual pinned theorems at `TauCeti/RingTheory/MvPolynomial/Kronecker.lean:96,109` require weight injectivity. Base-`B` digit separation supplies that extra step here. The new comparison with ArithmeticInterpolationDeterminants §0.3 matches its main text. |
| R03: avoidance scope | Lines 338–343: “for `m ≥ 2` over a field no single graph”; “for `m = 1` the graph is the identity”. Lines 219–221 separate the field conclusion. | Repaired. The inverse image of the graph's own complement is empty in dimension two; in dimension one an identity preserves every nonempty open. In `(ℤ/4ℤ)[T]`, `φ(2)=2≠0` but `2²=0` and `D(2)=∅`. |
| R04: Poonen and dense opens | Lines 104–105: “adding to that set a closed point of a dense open `U` makes the curve meet `U`”. | Repaired for the previous objection. In `ℙ²_{𝔽₂}`, add `[1:0:1]∈D(X_0)` to the mark `[0:0:1]`; every curve containing both meets that open. The nonprojective/component obstacle is correctly distinguished. R01 above records the separate omitted dimension hypothesis. |

The repaired patterns were searched throughout the package. No other unqualified noninjectivity or origin-failure assertion, dimension-one universal-avoidance denial, arbitrary-ring nonempty-open conclusion, or denial of projective Poonen open intersection remains. The added docstrings accurately attribute the coefficient theorem. All seven sampled sections were read in full; earlier computed rows were used only as corroboration, not as substitutes for checking the changed passages.

### Principles and shape

The scope is the general arbitrary-field smooth-point theorem, including finite and imperfect fields and characteristic two. The polynomial statement permits every commutative ring, including nonreduced and zero rings. There is no good-prime restriction, route-specific arithmetic surrogate, computational algorithm, copied source passage, sorry'd data, `set_option`, or free-predicate stand-in. The explicit base bound is a mathematical existence witness, not an algorithm deliverable.

The base roadmap's finite-extension pencil construction is not repeated. The two layers follow the mathematical dependency: bounded substitution feeds the graph pullback; no source chapter order is being adopted. All nine Needs lines, the two layer dependency sections, and the supplier contracts were read. Their inputs are pinned facts, SchemeAndStackFoundations on main, or preceding targets. No supplier gap is declared (`design/plan.json:704`, `gaps = []`).

The README has all required main headings, seven numbered target sections, and Examples and Dependencies for both layers. The two substantial definitions, substitution and marked component, have API lists and respectively six and five discriminating Checks. The chart, point, curve and density conventions are tested by the geometric examples below. Every retained own backticked declaration resolves to one of the five declarations in Suggested.lean. Supplier names are identified as such. No process-residue or import-header defect was found. `metadata.toml` supplies `topic = "math.AG"`; all five external works are recorded once in the manifest. No source fetch or manifest addition was needed.

For house shape I read the opening, ownership, supplier and target/Check structures of main's `TauCetiRoadmap/QuadraticCharactersAndReduction/README.md` and `TauCetiRoadmap/SchemeAndStackFoundations/README.md`. R01 is the sole remaining exact-hypothesis defect found in this package.

### Seeded source verification

No author-flagged unverified locator was found. All five supplied extractions were readable. Exact pinned declarations serve as locators for the algebraic and scheme-interface claims; the assembled curve result is not falsely attributed to a numbered theorem containing its entire construction.

| Sample / citation | Locator read | Hypotheses and support |
|---|---|---|
| 1.1 The Kronecker substitution | `Mathlib/Algebra/MvPolynomial/Eval.lean:158,181,185,189,203,572,575` | Evaluation ring homomorphism; constants, variables, monomials and postcomposition; `aeval` has the same real-body evaluation. Gives the stated map over a commutative ring, without a hidden domain assumption. |
| 1.2 Coefficients survive bounded substitution | `TauCeti/RingTheory/MvPolynomial/Kronecker.lean:96,109`; `Mathlib/Data/Nat/Digits/Defs.lean:310`; `Mathlib/Data/Nat/Digits/Lemmas.lean:37,360`; `Mathlib/Data/Finsupp/Weight.lean:82` | Imported coefficient theorem needs support and query in an injective-weight set. Equal-length digit lists with entries below a base greater than one give precisely the required injectivity. The README handles bases zero and one separately. |
| 1.3 Surjectivity and the avoiding graph | `Mathlib/AlgebraicGeometry/Morphisms/ClosedImmersion.lean:97`; `Mathlib/Topology/Irreducible.lean:198` | Surjective ring map gives closed immersion over any ring. A nonempty open in a preirreducible space is dense; the geometric consequence here correctly uses a field. |
| 2.1 The boundary polynomial of an étale chart | `Mathlib/AlgebraicGeometry/Morphisms/Etale.lean:52`; `Mathlib/RingTheory/Etale/Basic.lean:241`; `Mathlib/RingTheory/EssentialFiniteness.lean:95`; `Mathlib/RingTheory/Etale/Field.lean:194`; `Mathlib/RingTheory/Ideal/GoingUp.lean:196` | Affine étale maps, étale base change, essentially finite type, separable field decomposition, and nonzero contraction of an ideal containing a nonzero algebraic element. The domain/injectivity conditions permit clearing denominators after passage to the fraction field. |
| 2.2 The marked component of a graph pullback | Stacks-Varieties line 528, Lemma 33.7.14/04KV, p. 12; line 2084, Lemma 33.25.4/056T, p. 46; line 2147, Lemma 33.25.10/0CDW, p. 47; Stacks-Properties line 433, Lemma 28.7.7/033N, p. 10 | Connected with a rational point implies geometrically connected; smoothness implies geometric normality and reducedness; locally Noetherian normal schemes decompose into integral components. 0CDW applies to the resulting affine variety with its smooth rational mark, not to a disconnected pullback. |
| 2.3 The marked étale curve | `Mathlib/AlgebraicGeometry/Morphisms/UniversallyOpen.lean:43,105,129,142`; `Mathlib/Topology/Irreducible.lean:198,202` | Étale projection is flat and locally of finite presentation, hence open. Its nonempty image meets `D(φ(h))`; the boundary-image containment gives the good-open inclusion and density. |
| 2.4 The same-field curve through a smooth rational point | Stacks-Morphisms line 3743, Lemma 29.37.21/054L, p. 83; 056T and 033N above | Smoothness at the chosen point gives affine étale coordinates over an affine base. Shrinking to the component and translating by the rational image give exactly the fixed-chart hypotheses. |
| Poonen comparison | Poonen2004 line 514, Theorem 3.3, p. 10; line 519, Remark 1; line 536, Corollary 3.4, p. 10 | Both dimension bounds are explicit. Corollary 3.4 permits any finite closed-point set and gives dimension `1` when the ambient dimension is at least `1`. The connectedness remark assumes projectivity. R01 restores the dropped dimension qualifier. A separate source error in Theorem 3.3 is recorded below. |
| Motivation and consumers | KisinZhou2024 line 2169, Proposition 5.2.3; line 2174, Remark 5.2.4, p. 49; line 2322, Corollary 5.2.7, pp. 52–53; line 2392, Proposition 5.3.5, p. 54 | The preprint numbering and pages agree. Lines 2341–2347 and 2411–2417 apply Poonen to a smooth chart without supplying projectivity. The source's singular local-model curves and rational atlas lifts are separate inputs, outside this package's ownership. |

### Computed adversarial table

Each row records actual values, sets or equations, including wrong-model controls. All seven sampled targets, all four headlines, the repaired additions and the new finding are covered. `η` below is the zero prime of the indicated polynomial domain. The table also checks every API of the two definitions and all kinds of README worked example.

| Statement | Instances tried | Computed values on both sides | Result / change |
|---|---|---|---|
| §1.1 constants and monomials | `k=ℤ,m=2,B=3`, `7`, `2X_0²X_1` | `φ(7)=7`; `φ(2X_0²X_1)=2T⁵=2T^(2+3)` | Equal; no change. |
| §1.1 indexing and variable images | `m=2,B=0,1,3` | Images `(T,1)`, `(T,T)`, `(T,T³)` respectively; in every case `B^0=1` | Correct, including total-function value `0^0`. |
| §1.1 algebra-map/aeval API | Constants and the two generators, `B=3` | Both ring maps send `a↦C a`, `X_0↦T`, `X_1↦T³`; spectra reverse the ring-map direction | These generators determine the map; inverse/swapped coordinate maps excluded. |
| §1.1 origin API | `ℤ,m=2,B=0` versus `B=3` | At base zero the two evaluations on `X_1` are `0` and `1`; at base three they are `0` and `0` | Nontriviality and positive-base qualifications correct. |
| §1.1 one and zero variables | `m=1,B=0`; `m=0,k=𝔽₂` | First map sends `X_0↦T`, an isomorphism. Second sends `a↦C a`; coefficient at `T` always `0`, versus `1` in `T` | Positive-dimension surjectivity guard correct. |
| §1.1 zero ring | `k=ℤ/1ℤ`, `m=0,2`, `B=0,2` | Both rings have cardinality `1`; kernel witness `0`; origin values `0=1`; spectra both empty | Revised nontriviality guards correct. |
| §1.1 noninjectivity | `ℤ,m=2`, `B=0,3` | `X_1−1↦0` and `X_1−X_0³↦0`; source coefficient at `X_1` is `1` in each case | Actual nonzero kernel witnesses. |
| §1.1 coefficient change | `ℤ→𝔽₂`, `h=2X_0+X_1`, `B=3` | Substitute then reduce: `2T+T³↦T³`; reduce then substitute: `X_1↦T³` | Equal. |
| §1.1 straight-line control | `h=X_0²X_1−X_0X_1²` over `𝔽₂` | On `X_0=0`, `X_1=0`, `X_0=X_1`, values identically `0`; graph `B=3` gives `T⁵+T⁷≠0` | Rational-line substitute excluded. |
| §1.2 coefficient headline | Same `h` over `ℤ`, `B=3`, queries `(2,1),(1,2),(0,2)` | Weights `5,7,6`; output coefficients `1,−1,0`; source coefficients `1,−1,0` | Equal, including off-support query. |
| §1.2 box separation | `m=2,B=3` | Nine vectors have weights `0,3,6,1,4,7,2,5,8`, all distinct; box cardinality and image cardinality both `9` | Added bounded specialization is valid. |
| §1.2 small bases | `(m,B)=(2,1),(2,0),(0,0)` | Box sizes `1,0,1`; weight lists `[0],[],[0]`. At base one both coefficient sides equal the constant; at `m=0` both equal `a` | No hidden base-positivity assumption. |
| §1.2 strict support bound | `h=X_1−X_0²`, `B=2`, over `ℤ` or `𝔽₂` | Output `0`, coefficient at weight `2` is `0`, source coefficient of `X_1` is `1`; exponent `2<2` is false | Correct negative control. |
| §1.2 query bound | `h=X_1,B=2,e=(2,0)` | Weight `2`; output coefficient `1`; source coefficient at `(2,0)` is `0` | Query condition genuinely needed. |
| §1.2 bounded injectivity | `B=2`, compare `X_0X_1` and `X_0+X_1` | Images `T³` and `T+T²`, distinct; `X_1` and `X_0²` collide at `T²` but latter lies outside box | Injectivity domain correct. |
| §1.2 nonreduced coefficients | `ℤ/4ℤ`, `h=2X_1,B=3`; zero ring | Image `2T³`, coefficient `2=2≠0` although `2²=0`; zero ring gives `0=0` | Full commutative-ring generality valid. |
| §1.3 surjectivity and closed immersion | `m≥1`, `p=3+2T+T²` over `ℤ`, any base | `φ(3+2X_0+X_0²)=p`; first-coordinate map is onto; spectrum map closed immersion | No domain hypothesis needed. |
| §1.3 avoiding headline and quantifiers | `h=X_1−X_0²`, `m=2`; `h=X_0`, `m=1` | Choose `B=3`: `T³−T²≠0`; choose `B=2`: `T≠0`; both bases exceed source exponents | Existential base depends on `h`, as required. |
| §1.3 finite-field good open | `h=X_0^q−X_0`, `q=2,3` | Output `T^q−T`; rational values `[0,0]` and `[0,0,0]`; `η∈D(T^q−T)` | Nonempty does not mean rationally nonempty. |
| §1.3 simultaneous avoidance | `m=2,B=3,Z=V(X_1−X_0³)`; `m=1` | First inverse image of complement `D(T³−T³)=∅`; second inverse image of any open is itself | Revised dimension split valid. |
| §1.3 ring/field distinction | `ℤ/4ℤ`, `h=2`; `ℤ/6ℤ`, `h=2` | First `φ(h)=2≠0`, `D(2)=∅`; second `D(2)=𝔸¹_{𝔽₃}`, missing the entire `𝔽₂` component | Nonzero alone gives neither nonempty nor dense in general. |
| §2.1 boundary and nonuniqueness | Identity chart of `𝔸²`, `Z=V(X_0X_1)` | `h=X_0X_1` and `h²` have the same zero set containing `π(Z)` | No unjustified unique boundary equation. |
| §2.1 empty boundary / dimension zero | Empty `Z`; `V=Spec L`, finite separable `L/k` | `h=1`, `V(h)=∅`; one-point `Spec L` has only the empty proper closed subset | Correct without a rational mark. |
| §2.1 nonfinite étale chart | `k[x,x⁻¹]`, `Z={x=1}` | `h=X_0−1`; pullback `x−1` vanishes exactly at `Z`; generic algebra is `k(x)` | Finiteness of the chart map is unnecessary. |
| §2.1 étaleness control | Projection `𝔸²→𝔸¹`, `Z=V(x_1)` | `π(Z)=𝔸¹`; generic algebra `k(x_0)[x_1]` has transcendental `x_1`, unlike étale field factors | Smooth positive relative dimension would not suffice. |
| §2.2 defining component and projection equations | Identity chart, `B=2` | `W=C=𝔸¹`, `q=id`, `g(T)=(T,T²)`; both composites `(T,T²)`; swapped model gives `(T²,T)` | Definition determines the marked object; wrong ordering excluded. |
| §2.2 section and relative dimension | Same example, `c=0` | `g(c)=(0,0)`, `q(c)=0`; coefficient composites `a↦a`; dimension `0+1=1` | All section and structure-map laws hold. |
| §2.2 affine/clopen/component API | `𝔽₃`, `π(x,z)=(x,z²−1−2x)`, `z` invertible | Jacobian `2z` unit; `W` has equation `z²=(T+1)²`; factors differ by unit `2(T+1)` | Two clopen affine components, each `D(T+1)`. |
| §2.2 mark and geometric integrality | Previous pullback, mark `(0,1)` | On `z=T+1`, value at `0` is `1`; other branch gives `−1=2`; whole `W` has two components, marked `C` one | Mark excludes wrong branch; integrality excludes whole pullback. |
| §2.2 good open retains boundary mark | Identity chart, `U=D(X_0),h=X_0,B=2` | `q⁻¹D(φ(h))=g⁻¹(U)=D(T)`; `0∉D(T)`, `η∈D(T)` | Removing boundary before choosing component would lose mark. |
| §2.2 field-extension API | Branch example over `𝔽₉`; identity chart over imperfect `k` with purely inseparable `K/k` | Branch remains `z=T+1`; number of components of `W_K` still `2`. Identity case has ring `K[T]`, a domain, and good open `D(T)` | Both separable and inseparable extension cases work. |
| §2.2 rational-mark necessity for geometric connectedness | `Spec 𝔽₉` over `𝔽₃` | No `𝔽₃`-section; after extension to `𝔽₉` there are two components | Connectedness alone is not substituted for geometric connectedness. |
| §2.3 marked-curve headline | Identity chart over `𝔽₂`, polynomial of §1.1, `B=3` | `g⁻¹(U)=D(T⁵+T⁷)=D(T⁵(T+1)²)`; `0` rational points, `2` points over `𝔽₄`, generic point present | Nonempty dense good open; all equations hold. |
| §2.3 arbitrary nonempty étale image | Branch `C=D(T+1)` over `𝔽₃`, test `D(T)` on the target | Intersection `D(T(T+1))` contains `η`; image need not be all of `𝔸¹` | Openness/density argument does not assume surjectivity. |
| §2.3 zero-dimensional chart | `V=Spec k,U=V,m=0` | `C=𝔸¹,q=id,g` constant; both composites to `Spec k` are the structure map; good open all `C` | No immersion or positive-`m` hypothesis silently introduced. |
| §2.4 local-density headline | `Y=𝔸¹⊔𝔸¹`, mark and `U=V` in first copy | Ambient closure of `U` is only first copy; closure in `V` is `V`; choose first inclusion `g`, good open `C=𝔸¹` | Only density near the mark is needed. |
| §2.4 translation and singularities elsewhere | `Y=Spec k[x,w]/(xw)`, `y=(1,0)`, `V=D(x)`, `U=Y` | In `V`, `w=0`; translated coordinate `t=x−1` sends mark to `0`; take `C=D(t+1)`, `g(t)=(t+1,0)` | Smooth chart suffices despite singular origin elsewhere. |
| §2.4 zero-dimensional target | `Y=Spec k`, `U=V=Y` | `C=𝔸¹`, constant `g`; relative dimension of `C` is `1`, target dimension `0`; good open `C` | Morphism conclusion correct; immersion version false. |
| §2.4 rational-point control | `Y=Spec 𝔽₉` over `𝔽₃` | A field homomorphism would inject `9` elements into `3`; none exists | Closed degree-two point cannot replace a section. |
| §2.4 smoothness control | `x²+w²=0` over `𝔽₃` | Rational solutions exactly `{(0,0)}`; over `𝔽₉` factors `(x−iw)(x+iw)`, `i²=−1`; conjugate lines intersect only at `0` | Frobenius-stable integral image lies at `0`; good open empty. |
| §2.4 residue/Frobenius convention | Marked branch over `𝔽₃` | Both residue degrees `1`; induced map sends `2↦2`; geometric Frobenius remains its first power | Matches section equations and imported residue-field facts. |
| Geometric-integrality convention | Empty scheme; `Spec k(t)` | Empty scheme fails nonemptiness; base changes of `k(t)` are domains obtained by localizing `K[t]`, although `k(t)` is not a finite-type `k`-algebra | Correct native predicate; finite type supplied separately for curves. |
| Revised Poonen open-intersection passage | `ℙ²_{𝔽₂}`, marks `[0:0:1],[1:0:1]`, `U=D(X_0)` | `X_0` values `0,1`; second mark belongs to curve intersection with `U` | Previous R04 repaired. |
| Revised Poonen connectedness limitation | `Q:xy=zw⊂ℙ³`, remove `p=[0:0:0:1]`, cut by `z=0` | Intersection is the two lines `z=x=0` and `z=y=0`, meeting only at removed `p`; after removal two disjoint affine lines | Smooth hypersurface intersection need not be connected in a nonprojective chart. |
| Poonen synopsis, R01 | `X=Spec 𝔽₂`, then `X=ℙ¹_{𝔽₂}` | First has dimension `0`, no dimension-`1` subvariety; second has dimension `1` and contains curve `X` | Add positive dimension; retain constant-map treatment at dimension zero. |
| Poonen source Theorem 3.3 | `n=m=1`, `X=ℙ¹_{𝔽₂}`, `F={0,∞}` | A smooth geometrically integral zero-dimensional projective hypersurface has one geometric point; containing `F` requires at least two | Source error, not copied into the README's weaker hypersurface synopsis; see Source issues. |

No denominator or natural subtraction affects a headline. Indices are in `Fin m`; the empty index type and the exceptional power `0^0` were computed. Smooth integral chart hypotheses exclude square-zero thickenings and inseparable zero-dimensional extensions; they are not silently admitted. There are no nonabelian group, DVR, compactness or analytic normalization assertions to instantiate here. The mathematical existence conclusions do not put the conclusion into a hypothesis, and the marked fibre-product construction relates all of its maps to the actual chart.

### Pinned declarations, duplication and supplier resolution

The manifest pins and the library checkout commits agree: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. In addition to the declarations in the seeded-source table, I opened these definitions and contracts at those pins:

| Pinned file and line | Content checked |
|---|---|
| `Mathlib/Algebra/MvPolynomial/Basic.lean:916`; `Mathlib/Algebra/Polynomial/Coeff.lean:128` | Both constant-coefficient ring maps have real body coefficient zero; variables have origin value zero. |
| `Mathlib/AlgebraicGeometry/Properties.lean:239`; `Mathlib/AlgebraicGeometry/Geometrically/Integral.lean:40` | `IsIntegral` includes `nonempty`; `GeometricallyIntegral` requires integral field base changes and does not impose finite type. |
| `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:127,201` | Native smooth relative dimension and addition of relative dimensions under composition. |
| `Mathlib/AlgebraicGeometry/AffineSpace.lean:223,378` | Polynomial-spectrum comparison and smooth relative dimension `Nat.card` of the index type. |
| `Mathlib/AlgebraicGeometry/Morphisms/Etale.lean:39,52,65,70,74,104` | Actual class is `Etale`; affine ring-map interpretation, composition, base change, open immersions and relative dimension zero. |
| `Mathlib/Topology/NoetherianSpace.lean:194`; `Mathlib/Topology/Connected/Basic.lean:606` | Finite irreducible-component set and closed connected components; the finite-union argument makes components clopen here. |
| `TauCeti/AlgebraicGeometry/Morphisms/Smooth/GeometricallyIntegral.lean:37` | Smooth and geometrically connected implies geometrically integral. |
| `TauCeti/AlgebraicGeometry/RationalPoint/Basic.lean:97,122` | Residue degree one and bijective residue-field map require a genuine section equation, supplied by both marks. |
| `TauCeti/AlgebraicGeometry/Morphisms/Smooth/EtaleCoordinates.lean:86,98` | Affine étale coordinate neighbourhoods, using `ULift (Fin n)` for variables; reindexing gives the polynomial-spectrum presentation here. |
| `TauCeti/RingTheory/MvPolynomial/Kronecker.lean:75,96,109` | Arbitrary finite separating weights and the general coefficient/injectivity mechanism are imported, not owned anew. |
| `Mathlib/RingTheory/NoetherNormalization.lean:80,93` | The other variable change fixes `X_0`, sends other variables to `X_i+cX_0^r_i`, and has a private digit-separation proof; it is not this graph map. |
| `Mathlib/Algebra/MvPolynomial/Equiv.lean:606`; `Mathlib/RingTheory/MvPolynomial/Basic.lean:169` | The near matches are a polynomial-ring equivalence retaining coefficient variables and a bounded-support submodule, not the bounded graph coefficient theorem. |

Object searches used `roadmaps grep` over indexed open heads and main, local board-package README searches, and the pinned library trees. The provided near matches were inspected as leads; a generic power-series substitution identity, a Krull-dimension formula, or a class name from another Mathlib version does not prove either curve headline. No second fully qualified name for these five declarations was found in the indexed Lean files.

Cross-roadmap citations were resolved anew:

- Main's `TauCetiRoadmap/SchemeAndStackFoundations/README.md:996,998`, §0.8, states the consumed coordinate and rational-component contracts. Open PR #1656 retains them at `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1224,1233` and redirects the coordinate name to the pinned Tau Ceti result. This retains the old citation and creates no dependency on the revision. Its scope owns general foundations, not the boundary-polynomial/marked-graph application.
- Main's `TauCetiRoadmap/ArithmeticInterpolationDeterminants/README.md:426`, §0.3, defines the two-variable map with weights `(1,B)` and bounds the first-variable degree only. Its supplier contract at line 299 imports the same general coefficient theorem. The new comparison in this package accurately distinguishes the arbitrary-variable bounded box.
- The base roadmap at open PR #873, `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:2479`, permits a finite extension for an axis; its arithmetic spreading at line 3997 concerns a family and inertia. Neither owns this local arbitrary-field smooth-chart result, and neither is consumed as a supplier here.
- Open PR #1906, `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:88,727`, imports Tau Ceti's substitution for Wronskian/Roth arguments. Open PR #1017, `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md:2557`, uses norm polynomials in a different argument. Neither owns this base-`B` geometric specialization.
- The board's `packages/ShimuraVarietiesPartII/README.md:1218` owns the specialized KR-stratum curve application, importing Schubert curves and a Bertini contract. It does not construct this general arbitrary-field marked-chart theorem; the present roadmap explicitly leaves the singular local-model and atlas-lifting inputs to those consumers.

The board-package index was read. Its three remote-only packages are excluded from global absence claims, as noted below. The supplied overlap facts report no conflicting head or dropped/renamed cited id. Reading the closest head, SchemeAndStackFoundations #1656, confirms preservation of both supplier identifiers. There is no upward dependency, circular handoff, duplicated foundational owner, or missing old-to-new map to repair in this package.

The requested mechanical dependency check returned:

```text
depcheck: 236 roadmaps, 2134 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The citation resolver reported no unresolved cross-roadmap citations or own Lean names. Its external-library check was unavailable in the service, so the pinned declarations were checked locally as above.

### Headline completeness, elaboration and padding

The README identifies four headlines at lines 34–35. All are present, with the same generality:

| Headline | `packages/LefschetzPencilsAndVanishingCyclesPartII/Suggested.lean` | Signature and padding result |
|---|---|---|
| `polynomialGraph_coeff`, §1.2 | Line 55 | Arbitrary commutative ring; support bound and independent query bound; no positivity of base. `rfl`, `infer_instance`, and closing `simp` fail. Exact application of the imported coefficient theorem still requires the bounded-weight injectivity proof. |
| `exists_avoiding_graph`, §1.3 | Line 66 | Positive `m`, nonzero `h`, existential base at least two, support bound, nonzero image, closed immersion. All three tactic probes fail. |
| `exists_marked_etale_curve`, §2.3 | Line 81 | Field; integral affine chart; étale map; origin equation; dense open. The existential maps satisfy both projection/mark equations and the actual geometric predicates. All three probes fail. |
| `exists_same_field_curve`, §2.4 | Line 105 | Field; section; open neighbourhood containing its image; smoothness of its restricted structure morphism; density only on that neighbourhood. Section and structure equations persist in the conclusion. All three probes fail. |

`lake env lean` on the package file from the pinned content checkout exited `0`, with exactly four warnings, each `declaration uses sorry`, at theorem lines 55, 66, 81 and 105. There was no other warning or error, and no Tau Ceti import requiring a build. The import is the single `import Mathlib`.

A scratch copy with `#check @name` for all five declarations also elaborated. I compared the resulting complete types against the README and the supplied signatures: no binder was lost or changed. In particular `[Smooth (V.ι ≫ f)]` remains explicit in the last theorem. There are no section variables that could silently disappear.

A separate scratch copy replaced all four `sorry` proofs with `first | rfl | infer_instance | (simp; done)`. Each theorem failed to close, as expected. The nearest exact-library candidate for the coefficient theorem was read at the pin: it needs an injectivity hypothesis absent from the headline's assumptions, so a bare `exact` does not discharge the target. No corresponding library theorem was found for the other three. None of the four statements mirrors a Check, computes a small value, or is merely a boundary case or a definition restatement. The sole real-body definition is required to state the headlines. The heavy marked-component construction remains a README target, with its existential geometric consequences genuinely stated; no statable headline is absent or replaced by a surrogate.

## Not verifiable

- The published Annals typesetting of Kisin–Zhou was not compared with arXiv v2. The package explicitly uses v2 locators, and those were all read; the manifest discloses that version limitation.
- Poonen's journal typesetting was not compared. The cited author version, its page 10, theorem numbers and hypotheses were read directly. The additional source error below refers to that version; no claim about a published correction is made.
- The remote-only board heads for AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory were not opened. Ownership checks cover the supplied indexed open roadmap heads, main and available local board files; they do not establish absence in those three remote-only packages.

No requested source version was unreadable, so there is no missing-reference request. All Lean processes finished.

## Source issues

- **Gap** in KisinZhou2024 at Corollary 5.2.7, proof, printed page 53, and Proposition 5.3.5, proof, printed page 54: the source says Poonen's projective curve corollary supplies a curve inside the smooth chart; it should be justified for a possibly nonprojective chart while retaining the mark and dense-open intersection; affects the proof.
- **Error** in Poonen2004 at Theorem 3.3, author-version printed page 10: the source says the ambient hypersurface can always be geometrically integral, including ambient dimension one and multiple prescribed points; it should be restricted to ambient dimension at least two, or omit geometric integrality of the hypersurface when the ambient dimension is one; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "65ada2c97b678ace92c455e605c48ca71c03fef9", "job": "REV-PKG-LefschetzPencilsAndVanishingCyclesPartII~3", "model": "gpt-6-astra", "worker": "chris-6"} -->
