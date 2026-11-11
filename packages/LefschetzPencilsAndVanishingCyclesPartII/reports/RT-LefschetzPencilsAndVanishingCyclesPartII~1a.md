<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13144#issuecomment-6785524188 -->
Red team round 1 pass a (codex) of 46a0dff

Verdict: accepted

No numbered package finding survived verification. Source defects are recorded separately below; neither is repeated as a mathematical assertion of this package.

## Verified sound

Read all 671 README lines and all 116 Suggested.lean lines. Audited **5 declarations** (1 definition, 4 theorems), **9 principal target blocks**, all **18 API bullets**, the additional bounded-support injectivity assertion, **38 numbered-section Check bullets**, and all three worked examples. Verified **11 distinct external theorem/lemma/remark locators** in the five cached works. Resolved **3 distinct cross-roadmap supplier contracts** (the two SchemeAndStackFoundations contracts and the ArithmeticInterpolationDeterminants comparison), including the supplied open revision of SchemeAndStackFoundations; also checked the base-roadmap scope comparison. Repeated citations resolve to the same contracts.

The four headline theorems are `polynomialGraph_coeff`, `exists_avoiding_graph`, `exists_marked_etale_curve`, and `exists_same_field_curve`. All four are stated on native carriers. There is no missing headline, stand-in, admitted data, or padding theorem. The coefficient theorem still requires proving the explicit bounded-digit weight injective; Tau Ceti supplies the subsequent coefficient extraction, not that explicit bounded-base conclusion. Neither geometric existence theorem follows from its hypotheses by a single library invocation.

The five worker-supplied elaborated signatures were compared individually with the source and README. No instance or hypothesis disappears. This pass did **not** run Lean or regenerate those signatures. All binders are in the declarations themselves; there is no surrounding hypothesis whose accidental omission could weaken a statement.

All file locations below are repository-relative. Library paths denote files at the supplied pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Package line references abbreviate `packages/LefschetzPencilsAndVanishingCyclesPartII/`.

### Declaration and instance-context table

All five names are in `TauCetiRoadmap.LefschetzPencilsAndVanishingCyclesPartII`. Algebra declarations have an arbitrary coefficient universe; geometric declarations use the common universe `u`. There are no other section variables.

| Declaration; section; location | Complete relevant context | Instances and computed values on both sides | Result / change |
|---|---|---|---|
| `polynomialGraph`; §1.1; Suggested.lean:44 | Explicit `k`, `[CommRing k]`, `m B : ℕ`; source `MvPolynomial (Fin m) k`, target `Polynomial k` | Over ℤ, `m=2,B=0`: images of `(X₀,X₁)` are `(T,1)`; at zero, `(0,1)≠(0,0)`. `m=1,B=0`: image of `X₀` is `T`. `m=0`: image of `a` is `C a`. Zero ring: both carriers have cardinality 1. | Definition agrees with the stated total convention; no change |
| `polynomialGraph_coeff`; §1.2; Suggested.lean:55 | `[CommRing k]`; `m,B`; `h`; all support exponents `<B`; query `e` separately bounded `<B` | ℤ, `h=X₀²X₁−X₀X₁²,B=3`: weights `(5,7,6)` give coefficients `(1,−1,0)` on both sides. `m=0,B=0,h=C 4`: both coefficients 4. `B=1,h=C 4,e=0`: both 4. `m>0,B=0`: query set empty. Zero ring: both 0. | True at the written generality; no missing support/query bound |
| `exists_avoiding_graph`; §1.3; Suggested.lean:66 | `[CommRing k]`; `0<m`; `h≠0`; existential `B` occurs after `h` | ℤ/4ℤ, `m=1,h=2,B=2`: image 2≠0, graph identity, but `D(2)=∅`; no density conclusion is typed. 𝔽₂, `h=X₁−X₀²,B=3`: image `T³+T²≠0`, with `T` the image of `X₀`, hence surjective. Zero ring: `h≠0` impossible. | Ring/general-field distinction and quantifier order correct |
| `exists_marked_etale_curve`; §2.3; Suggested.lean:81 | `[Field k]`; arbitrary `m`; `[IsIntegral V] [IsAffine V] [Etale π]`; `y≫π=origin`; dense open `U` | 𝔽₃ disconnected pullback: choose `C=D(T+1)`, `q` inclusion, `g(T)=(T,T+1)`. `πg=(T,(T+1)²−1−2T)=(T,T²)=a₂q`; at `c=0`, `g(c)=(0,1)=y`, `q(c)=0`; relative dimension `0+1=1`. `m=0,V=Spec k`: both square composites are the structure map. | `hy` implies the omitted-looking section equation after composing with the base map; similarly `c≫q=origin` makes `c` a section. No missing binder |
| `exists_same_field_curve`; §2.4; Suggested.lean:105 | `[Field k]`; `f`; section `y` with `hy`; open `V` containing the range of `y`; explicit `[Smooth (V.ι≫f)]`; open `U` with dense preimage in `V` | `Y=Spec k,U=V=Y`: `C=𝔸¹`, `g=sC`, `c=0`; `g≫f=sC`, `c≫sC=id`, `c≫g=y`; good open is all `C`, dimension 1. `Y=𝔸¹⊔𝔸¹,V=U=first`: good open is `C`, while closure of `U` in `Y` is only the first summand. | Local smoothness/density, section equations, and common universe agree with README |

### README target table

For rows mentioning a chart, the context is an integral affine `V`, an étale `π:V→𝔸ᵐ_k`, and a field `k`. For marked rows add a rational `y` over the origin. `φ` denotes the actual substitution, not an arbitrary ring map. The identity-chart model used below is `V=𝔸²`, `B=2`, `C=𝔸¹`, `q=id`, `g(T)=(T,T²)`.

| Statement / locator | Instances tried and values computed | Result / change |
|---|---|---|
| §1.1 substitution, README:237 | `(m,B)=(0,0),(1,0),(2,0),(2,1)`: respectively `C`, `X₀↦T`, `(X₀,X₁)↦(T,1)`, `(X₀,X₁)↦(T,T)` | All four are defined; zero-base failure at the origin is correctly conditional |
| §1.1 API: constants, README:247 | ℤ, `a=−2`: `φ(C(−2))=C(−2)`; zero ring: both 0 | Correct |
| §1.1 API: variables, README:248 | `m=3,B=2`: images `T,T²,T⁴`; wrong one-based convention gives `T²,T⁴,T⁸` | Correct and discriminating |
| §1.1 API: monomials, README:249 | `a=−2,d=(2,1),B=3`: `φ(−2X₀²X₁)=−2T⁵`, weight `2+3=5` | Correct |
| §1.1 API: algebra structure, README:250 | `a=2∈ℤ`: both coefficient composites give `C 2`; on spectra both structure composites correspond to `ℤ→ℤ[T]` | Correct arrow direction |
| §1.1 API: aeval identification, README:252 | `h=X₀+2X₁,B=3`: eval₂Hom and aeval both give `T+2T³`; their coefficient maps are both `C` | Correct; exact specialization of pinned map |
| §1.1 API: origin, README:256 | `m=2,B=2`: each variable evaluates to 0 by either composite. `B=0`: `X₁` gives 1 versus 0 over ℤ | Correct positivity/nontriviality boundary |
| §1.1 API: one variable, README:259 | `m=1,B=0,1,2`: `X₀²+1↦T²+1` in each case; inverse sends `T` to `X₀` | Correct |
| §1.1 API: coefficient change, README:260 | ℤ→𝔽₂, `h=3X₀−2X₁,B=3`: first substitute then reduce gives `T`; first reduce then substitute also gives `T` | Correct |
| §1.1 API: noninjectivity, README:262 | ℤ, `m=2`: `B=0`, `X₁−1↦0`; `B=1`, `X₁−X₀↦0`; `B=2`, `X₁−X₀²↦0`. Input coefficient at `X₁` is 1 in each case. Zero ring makes that coefficient 0 | Correct; nontriviality needed |
| §1.2 coefficient theorem, README:291 | `B=3,h=X₀²X₁−X₀X₁²`, queries `(2,1),(1,2),(0,2)`: both sides `(1,−1,0)` at degrees `(5,7,6)` | Correct |
| §1.2 bounded-support injectivity, README:307 | `B=2`: weights of the box `(0,0),(1,0),(0,1),(1,1)` are `0,1,2,3`. At `B=1` the box is `{0}`; at `B=0` it is empty unless `m=0`, when it is `{()}` | Injective in every case; `X₁−X₀²` lies outside the box at `B=2` |
| §1.3 surjectivity, README:330 | `m>0`: preimage of `2T²+T+1` is `2X₀²+X₀+1`, even at `B=0`. `m=0` over a field: `T` has no preimage. Zero ring: unique map is surjective | Correct |
| §1.3 avoiding graph, README:336 | `h=X₁−X₀²`: base 2 yields 0; base 3 yields `T³−T²`. At 3 the exponent bound is `2<3`; first coordinate still `T`. Over ℤ/4ℤ, `h=2` has image 2 but square 0 | Existence true; geometric conclusion properly restricted to fields |
| §2.1 boundary polynomial, README:394 | Identity chart, `I=(X₀X₁)`: contraction is itself, choose `h=X₀X₁`. Localization chart `A=k[x,x⁻¹]`, `I=(x−1)`: contraction `(X−1)`, choose `h=X−1`. `m=0,Z=∅`: choose 1, whose zero locus is empty | Correct; no uniqueness or ideal-generator claim |
| §2.1 algebraic proof step, README:402 | Localization example: `x⁻¹` satisfies `X·Z−1=0`, a nonzero polynomial over `k[X]`; it need not be integral. Generic algebra is `k(X)`. For `A=k[x,z]` projected to `k[x]`, `z` has no such polynomial and `V(z)` maps onto all the base | Algebraicity is sufficient for the cited ideal-contraction theorem; positive relative dimension is excluded |
| §2.2 marked component definition, README:441 | Over 𝔽₃ the pullback is `D(T+1)⊔D(T+1)`; `w=(T,z)=(0,1)` selects `z=T+1`, while `z=−(T+1)` has value −1 at 0 | Unique component for fixed input; whole pullback and other component fail respectively integrality and marking |
| §2.2 API: affine/Noetherian pullback, README:455 | Identity chart gives coordinate ring `k[T]`. Disconnected chart gives `k[T,(T+1)⁻¹]×k[T,(T+1)⁻¹]`, a finite-type Noetherian algebra | Correct |
| §2.2 API: clopen/affine component, README:457 | Disconnected chart: component cut out by idempotent `(0,1)`; complementary component by `(1,0)`; each factor is `k[T,(T+1)⁻¹]` | Correct; closedness and affineness apply to the clopen subscheme |
| §2.2 API: projections, README:461 | Identity chart: `πg=(T,T²)=a₂q`. 𝔽₃ marked branch: second coordinate `(T+1)²−1−2T=T²` | Both projection and base equations agree |
| §2.2 API: marked lift, README:463 | Mark on the positive branch: `g(0)=(0,1)=y`, `q(0)=0`; base section sends each scalar `a` back to `a` | Correct; lift unique through open immersion |
| §2.2 API: étale/smooth dimension, README:465 | Positive branch `q:D(T+1)→𝔸¹` is open immersion, relative dimension 0; composite to field has dimension `0+1=1`. For `m=0`, `q=id` gives the same sum | Correct |
| §2.2 API: geometric integrality, README:468 | Marked branch over any extension `K` has ring `K[T,(T+1)⁻¹]`, a nonzero domain. Whole pullback has idempotent `(1,0)` and two nonzero factors | Correct use of rational-point component supplier |
| §2.2 API: good open, README:471 | Identity chart, `h=X₀,U=D(X₀)`: `q⁻¹D(φh)=D(T)=g⁻¹U`; contains prime `(0)` but not `(T)`. Disconnected example `h=1`: both opens equal `C` | Correct; proof is the open-image argument explicitly given in §2.3, not a hypothesis assuming the conclusion |
| §2.2 API: identity chart, README:473 | Pullback of identity along `(T,T²)` is `𝔸¹`; `q=id`, hence `g=a₂q` on each coordinate | Correct |
| §2.2 API: field extension, README:475 | 𝔽₃→𝔽₉: two factors remain two, and selected factor remains `𝔽₉[T,(T+1)⁻¹]`. For `k=𝔽₂(s)`, purely inseparable `K=k(s^(1/2))`, identity chart gives `C_K=Spec K[T]`, still a domain | Correct even for inseparable extensions; rational mark rules out a non-geometric component |
| §2.3 marked curve, README:506 | Identity model and positive 𝔽₃ branch satisfy all equations above. `m=0`: `V=Spec k`, `C=𝔸¹`, `q=id`; both square composites are the structure map and `g⁻¹U=C` | Correct; no false immersion claim for `m=0` |
| §2.4 same-field curve, README:533 | `Y=𝔸²_𝔽₂,U=D(X₀²X₁−X₀X₁²),y=0`: choose `g=(T,T³)`, good open `D(T⁵+T⁷)`. `Y=Spec k`: choose constant `g`, good open `C` | Correct positive and zero-dimensional cases |
| §2.4 component-density reformulation, README:538 | `V=𝔸¹⊔𝔸¹`, mark in first summand, `U=first`: density in original `V` is false, density after restriction to the marked component is true; closure there is the whole component | Wording expressly allows shrinking; does not assert equivalence for the unchanged `V` |
| §2.4 residue fields, README:561 | `k=𝔽₃,c=0,y=(0,1)`: both residue fields equal 𝔽₃ under section identifications, and `2↦2` in the induced map. Both residue degrees 1; field-group Frobenius restriction sends `Frob₃` to `Frob₃^1` | Correct under canonical identifications, not literal equality of independently constructed Lean field types |

### All 38 README Checks, recomputed

Each row is one bullet under a numbered section's **Checks**. Positive/negative controls are interpreted under the hypotheses that the text explicitly assigns them.

| Check location | Instance / computed comparison | Result / change |
|---|---|---|
| §1.1 C1, README:268 | 𝔽₂: on `X₀=0`, `X₁=0`, `X₀=X₁`, `h` restricts to `0,0,T³−T³=0`; at graph base 3 it is `T⁵+T⁷≠0` | Correct |
| §1.1 C2, README:272 | `X₁−X₀²`: at bases 2 and 3 images are `0` and `T³+T²`; bound fails at 2 and holds at 3 | Correct |
| §1.1 C3, README:275 | `m=1,B=0`: `B⁰=1`, image `T`; one-based indexing instead gives `T⁰=1` | Discriminating |
| §1.1 C4, README:277 | `m=0`: only constants occur in the image; coefficient of `T` is 0 there and 1 in `T` | Correct |
| §1.1 C5, README:280 | ℤ, `m=2,B=0`: origin values for `X₁` before/after substitution are 0 and 1 | Correct negative control |
| §1.1 C6, README:283 | Zero ring: `1=0`, `X₁−X₀ᴮ=0`; both origins give 0; spectra both empty | Correct nontriviality control |
| §1.2 C1, README:314 | Weights `5,7,6`; coefficients `1,−1,0` on both sides | Correct |
| §1.2 C2, README:317 | ℤ, `B=2,h=X₁−X₀²`: coefficient of `T²` is 0; coefficient at `X₁` is 1 | Strict bound essential |
| §1.2 C3, README:320 | `B=2,h=X₁,e=(2,0)`: image coefficient at degree 2 is 1; original coefficient at `X₀²` is 0 | Query bound essential |
| §1.2 C4, README:323 | Empty exponent vector has weight 0; coefficient of `C a` at 0 equals `a` | Correct boundary computation |
| §1.2 C5, README:325 | Zero ring: support empty and both coefficients 0 | Correct |
| §1.3 C1, README:353 | `T^q−T` has leading coefficient 1 and vanishes on all q field elements; generic prime `(0)` lies in its principal open | Nonempty open with zero rational points |
| §1.3 C2, README:357 | `m=1,h=X₀`: image `T`, graph identity for every base ≥2 | Correct |
| §1.3 C3, README:358 | `m=0`: primes `(0)` and `(T)` in `k[T]` both map to `(0)` in `k`, so point map not injective | Correct |
| §1.3 C4, README:360 | 𝔽₂, `B=3`: `T³−T²=T²(T−1)`; zero locus exactly closed points 0 and 1 | Correct |
| §1.3 C5, README:362 | For fixed `B`, substituting into `X₁−X₀ᴮ` gives 0; inverse image of its complement is empty | Correct quantifier control |
| §1.3 C6, README:365 | `m=1`: `a_B=id`, so inverse image of each nonempty open `D(h)` is `D(h)` itself | Correct dimension-one exception |
| §1.3 C7, README:368 | ℤ/4ℤ: image of 2 is 2≠0 but `2²=0`, so all primes contain it and `D(2)=∅` | Correct |
| §2.1 C1, README:417 | Identity chart: `h=X₀X₁`; value at every point of `Z` is 0; any nonzero multiple retains vanishing and nonzeroness in the domain | Correct |
| §2.1 C2, README:419 | Dimension 0: `Spec L` has one point, so proper closed subset empty; `V(1)=∅` | Correct |
| §2.1 C3, README:421 | Localization chart: at `x=1`, `X₀−1=0`; polynomial nonzero | Correct |
| §2.1 C4, README:423 | Projection of `V(x₁)` is all `Spec k[x₀]`, so required vanishing ideal is `(0)` | Étaleness cannot be replaced by arbitrary smoothness |
| §2.2 C1, README:483 | `g=(T,T²)`, both square sides `(T,T²)`; reversed coordinates give `(T²,T)` and fail | Correct |
| §2.2 C2, README:486 | `g⁻¹D(X₀)=D(T)`; at mark `T=0`, value 0, while generic value nonzero | Correct |
| §2.2 C3, README:489 | Jacobian `2z` invertible; `z²=(T+1)²`; factors differ by `2(T+1)`, a unit; mark values `+1` versus `−1=2` | Two clopen branches; positive branch selected |
| §2.2 C4, README:497 | `g=(T,T³)`, `h∘g=T⁵+T⁷`; at 0 value 0, at generic point nonzero | Correct |
| §2.2 C5, README:499 | After 𝔽₉ extension, two branches remain; selected branch domain. By contrast `𝔽₉⊗_𝔽₃𝔽₉≅𝔽₉×𝔽₉` | Correct geometric connectedness control |
| §2.3 C1, README:523 | `U=V`: preimage `C`; identity chart `U=D(X₀)`: preimage `D(T)`, missing mark | Both cases correct |
| §2.3 C2, README:525 | Whole `W`: two nonzero factors, so not integral; each branch: one domain. Both branches together still meet all other listed conditions | Correct distinguishing clause |
| §2.3 C3, README:527 | `m=0`: both square maps `𝔸¹→Spec k`; constant map not injective on points since `(0)` and `(T)` map together | Correct |
| §2.4 C1, README:572 | Point target: `C=𝔸¹,c=0,g=sC`, good open `C`, dimension 1 versus target dimension 0 | Correct |
| §2.4 C2, README:574 | `Spec 𝔽₂`: only ideals `(0),(1)`, so nonempty closed subscheme has dimension 0, never 1 | Poonen's dimension restriction retained |
| §2.4 C3, README:580 | All three rational lines give 0; graph gives `T⁵+T⁷≠0` | Correct |
| §2.4 C4, README:582 | `T^q−T` nonzero polynomial, q rational zeros, generic point outside zero locus | Good open nonempty and no rational points |
| §2.4 C5, README:584 | Closure of first component in the disjoint union is itself, not all `Y`; in `V=first` its closure is `V` | Correct local-density test |
| §2.4 C6, README:586 | Localizing `k[x,w]/(xw)` at x forces `w=0`; ring becomes `k[x,x⁻¹]`, smooth of dimension 1 | Correct even though origin of `Y` is singular |
| §2.4 C7, README:588 | A hypothetical `𝔽_q`-algebra map `𝔽_{q²}→𝔽_q` would inject a q²-element field into a q-element field; impossible | Section hypothesis essential |
| §2.4 C8, README:591 | 𝔽₃ model `x²+w²=0`: only rational solution `(0,0)`; over 𝔽₉ factors `(x−iw)(x+iw)`, Frobenius interchanges them; stable irreducible image contained in intersection `{0}` | No good-open intersection without smoothness |

The three worked examples at README:632, :636, :640 give respectively `T⁵(1+T)²`, the branch `z=T+1`, and the conjugate-line cone above. In the first, if `α∈𝔽₄` satisfies `α²+α+1=0`, the two elements `α,α+1` are precisely the allowed rational parameters over 𝔽₄; neither 0 nor 1 is allowed.

### Conventions and additional adversarial instances

| Convention / potential failure | Computation | Assessment |
|---|---|---|
| Field versus DVR | Over a characteristic-zero DVR with uniformizer π, `h=πX₁−X₀²,B=3` maps to `πT³−T²`, whose degree-2 coefficient is −1≠0; the ring theorem applies. Geometric layer explicitly assumes a field | No unsupported geometric generalization |
| Characteristic two and three | `T⁵−T⁷=T⁵+T⁷` in characteristic 2; at characteristic 3 the branch determinant is `2z=−z`, a unit when z is | Signs and unit tests agree across layers |
| Purely inseparable field extension | `k=𝔽₂(s),K=k(s^(1/2))`: `k[T]⊗K=K[T]` remains a domain; the marked point retains residue degree 1. `Spec K→Spec k` itself is not étale | No separability assumption on base change is needed |
| Square-zero coefficient ring | `k[ε]/(ε²)`, `h=ε`: substitution ε≠0 but principal open empty. Layer 1 promises only nonvanishing; Layer 2 excludes this coefficient ring | No nilpotent loophole |
| Square-zero target at the mark | `Y=Spec k[ε]/(ε²)`, mark ε↦0: no smooth open neighbourhood; even though the underlying point is rational, the smoothness hypothesis fails | Excluded as intended |
| Empty target or open | Field spectrum has a point, so no section to the empty scheme. In an integral nonempty chart the empty open is not dense. In §2.4 the marked image makes `V` nonempty | Existence statements are not accidentally vacuous |
| Closed subset `Z=V` versus empty `Z` | Identity chart: if `Z=V`, vanishing ideal `(0)`, no nonzero h; if `Z=∅`, ideal `(1)` and h=1 works | Properness hypothesis essential |
| Curve definition and plausible wrong model | `𝔸¹_k` has dimension 1 and is geometrically integral; `Spec k` has dimension 0; `𝔸¹⊔𝔸¹` has dimension 1 but two geometric components | Both clauses of the convention are discriminating |
| Coordinate-origin translation | At rational chart value `(a,b)`, translation `(x₀,x₁)↦(x₀−a,x₁−b)` sends the mark to `(0,0)`; the plus translation gives `(2a,2b)` in general | Proof uses the correct minus sign |
| No out-of-range index | `Fin 0` has no coordinate; `Fin 1` only coordinate 0. Exponent lists have fixed length m, so leading-zero ambiguity cannot defeat digit injectivity | No natural-subtraction or indexing junk used in the Lean types |
| Non-quasi-separated ambient scheme | The hypotheses constrain only the chosen smooth neighbourhood. An affine open chart has quasi-compact, separated source; all subsequent pullbacks are of affine schemes | No global quasi-separatedness is invoked |
| Uniformity / Frobenius | B is chosen after h, and residue degree at each marked section equals 1; `(Frob_q)^1=Frob_q`. Extension to a degree-r closed point would give `(Frob_q)^r` but violates the section premise | Both quantifier orders correct |

Group-specific tests (S₃, Q₈, noncompact groups), ideals in denominators, rank-dependent stabilizers, and zero-polynomial degree formulas have no parameters or operations in these targets. They are inapplicable, rather than claimed as tested instances. There is no division in any target signature.

### Pinned-library and ownership evidence

| Used contract | Pin or sibling locator and comparison |
|---|---|
| Evaluation and coefficient maps | `Mathlib/Algebra/MvPolynomial/Eval.lean:158,181,185,189,203,575`; `Mathlib/Algebra/MvPolynomial/Basic.lean:916`; `Mathlib/Algebra/Polynomial/Coeff.lean:128`. eval₂Hom and aeval agree for algebraMap=C; both origins are the constant-term ring maps |
| Digit uniqueness and weight | `Mathlib/Data/Nat/Digits/Defs.lean:310`; `Mathlib/Data/Nat/Digits/Lemmas.lean:37,360`; `Mathlib/Data/Finsupp/Weight.lean:82`. The digit lemmas require `1<B`, which the proof isolates; cases 0 and 1 are handled separately |
| Generic Kronecker substitution | `TauCeti/RingTheory/MvPolynomial/Kronecker.lean:75,96,109`: finite-set weight existence, coefficient extraction under injectivity on a support-containing set, and restricted-support injectivity. The query vector must belong to that set; the package retains its bound |
| Noether normalization near-match | `Mathlib/RingTheory/NoetherNormalization.lean:93`: private digit separation for the variable-change proof, not a public theorem about this graph. No duplicate public acceptance theorem found |
| Closed immersion | `Mathlib/AlgebraicGeometry/Morphisms/ClosedImmersion.lean:97`: a surjective ring map gives the contravariant spectrum closed immersion |
| Étaleness and dimension | `Mathlib/AlgebraicGeometry/Morphisms/Etale.lean:52,70,104`; `Mathlib/RingTheory/Etale/Basic.lean:241`; `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:127,201`; `Mathlib/AlgebraicGeometry/AffineSpace.lean:223,378`. Base change preserves étaleness and dimensions compose by addition |
| Open image | `Mathlib/AlgebraicGeometry/Morphisms/UniversallyOpen.lean:43,105,129,143`. Local finite presentation is present through étaleness; flatness alone is not used to claim openness |
| Density and components | `Mathlib/Topology/Irreducible.lean:198,202`; `Mathlib/Topology/NoetherianSpace.lean:194`; `Mathlib/Topology/Connected/Basic.lean:606`. Source nonemptiness required for dense range is furnished by the mark; Noetherianity comes from finite type |
| Generic fibre and ideal contraction | `Mathlib/RingTheory/Etale/Field.lean:194,271`; `Mathlib/RingTheory/EssentialFiniteness.lean:95`; `Mathlib/RingTheory/Ideal/GoingUp.lean:196`. Finite-presentation étale generic algebra is finite separable; a nonzero algebraic element of the boundary ideal gives nonzero contraction |
| Geometric integrality meaning | `Mathlib/AlgebraicGeometry/Geometrically/Integral.lean:41`; `Mathlib/AlgebraicGeometry/Properties.lean:239`. Nonemptiness is part of IsIntegral; finite type is not part of GeometricallyIntegral |
| Smooth connectedness bridge | `TauCeti/AlgebraicGeometry/Morphisms/Smooth/GeometricallyIntegral.lean:37`; its proof uses domain stalks and local Noetherianity. No properness or perfect-field restriction |
| Rational residue fields | `TauCeti/AlgebraicGeometry/RationalPoint/Basic.lean:97,122,290`: residue degree 1, bijective structure residue map, and explicit section-induced field equivalence |
| Étale coordinates | Main `TauCetiRoadmap/SchemeAndStackFoundations/README.md:996` and supplied open head `:1224`. The latter explicitly preserves the old target name at `:1232`, resolving to `TauCeti/AlgebraicGeometry/Morphisms/Smooth/EtaleCoordinates.lean:86,98`; its affine neighbourhood is sufficient over Spec k. The ULift variable presentation is equivalent to the finite-variable polynomial spectrum |
| Rational-point component | Main `TauCetiRoadmap/SchemeAndStackFoundations/README.md:998`; supplied open head `:1233`: same connected/smooth/rational-point hypotheses. The component/normality reasoning used for shrinking is also explained in this supplier contract; no later-roadmap result is needed |
| Two-variable specialization | Main `TauCetiRoadmap/ArithmeticInterpolationDeterminants/README.md:424` and `Suggested.lean:49`: variables `(Z,W)` map to `(X,Xᴮ)`. At B=3, `(2,1)` and `(1,2)` give degrees 5 and 7 in both conventions. The sibling owns the two-variable strip theorem; this package explicitly imports it and addresses the m-variable box |
| Base-roadmap boundary | `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md`, §3.5, finite-field descent target: good axes may require a finite extension and Frobenius becomes its r-th power. No supplier edge to that roadmap is introduced |

Ownership was searched by object with `roadmaps grep` over main and open heads, and locally in board packages. The closest supplied open roadmap, SchemeAndStackFoundations, supplies coordinates and the connected-point criterion, not the boundary polynomial or this graph construction. The board's ShimuraVarietiesPartII Layer 6 concerns transporting local-model curves to Shimura stacks, not ownership of the general smooth-scheme theorem. No second owner of the new construction was found. Searching all five declaration names in the available roadmap Lean files found no matching declaration; namespace collision was not detected. General Kronecker substitution and the two-variable specialization remain explicitly attributed to their existing owners.

The one-tactic probe rejects the listed evaluation, origin, coefficient-change, and boundary-case facts as acceptance theorems; they are already confined to README API/Checks. The four actual acceptance theorems require bounded-digit separation or geometric construction. The single real definition is required to state three of them. The heavy marked-component construction remains in the README, and its mathematical output is quantified over actual scheme morphisms in Lean.

### Source locators

| Cached source locator | Evidence / scope verified |
|---|---|
| KisinZhou2024, Proposition 5.2.3 and Remark 5.2.4, p.49 | KisinZhou2024 line 2169 and line 2174: same-field curve on local-model strata and why extending the residue field would not suffice |
| KisinZhou2024, Corollary 5.2.7, pp.52–53 | KisinZhou2024 line 2322 and line 2341: marked curve, smooth chart, dense stratum, and the Poonen invocation |
| KisinZhou2024, Proposition 5.3.5, p.54 | KisinZhou2024 line 2392 and line 2411: transport from the dense ordinary locus using the same curve step |
| Poonen2004, Theorem 3.3, p.10 | Poonen2004 line 514: quasi-projective smooth input, dimension at least one, and smooth hypersurface intersection. The package does not repeat the invalid unrestricted geometric-integrality claim about H |
| Poonen2004, Corollary 3.4, p.10 | Poonen2004 line 536: projective geometrically integral input, `m≥1`, and `1≤y≤m`; take y=1 and add a closed point from U |
| Stacks-Morphisms, 054L, Lemma 29.37.21, p.83 | Stacks-Morphisms line 3743: affine target neighbourhood, affine source neighbourhood and étale map to affine space |
| Stacks-Varieties, 04KV, Lemma 33.7.14, p.12 | Stacks-Varieties line 528: connected scheme with rational point is geometrically connected |
| Stacks-Varieties, 056T, Lemma 33.25.4, p.46 | Stacks-Varieties line 2084: smooth over a field implies geometric regularity, normality and reducedness |
| Stacks-Varieties, 0CDW, Lemma 33.25.10, p.47 | Stacks-Varieties line 2147: integral variety with a smooth rational point is geometrically integral; here C is affine, finite type and connected smooth, so the variety requirement is met |
| Stacks-Properties, 033N, Lemma 28.7.7, p.10 | Stacks-Properties line 433: locally Noetherian normal schemes decompose into integral normal open-and-closed pieces; the local Noetherian hypothesis is available |

No additional source was needed; all five manifest keys match the cached texts. Source excerpts were not copied into the report. No new missing-reference request is required.

### Dependency and policy checks

The command requested in the brief produced:

```text
depcheck: 236 roadmaps, 2134 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The named mathematical supplier SchemeAndStackFoundations is on main; the open revision retains the cited contract rather than introducing a new dependency. The package declares no gaps, consistently with `design/plan.json`.

The read-only comparison with origin/main lists five changed files, all inside `packages/LefschetzPencilsAndVanishingCyclesPartII/`: README.md, Suggested.lean, sources.toml and two repair reports. The reviewed HEAD is `46a0dff7`. The acceptance file has only `import Mathlib`, the required namespace, real data definition and four admitted theorem proofs; no `lemma`, `set_option`, free proposition placeholder, admitted example or unimplemented data. Its four names and one definition all occur in the README. No pull-request identifier or review/process narrative occurs in README or declaration docstrings. The explicit choice of a finite exponent bound is mathematical existence data, not a computational-algorithm workstream.

## Not verifiable

- Fresh elaboration was not performed: this pass is read-only and prohibits Lean builds. The supplied five elaborated signatures were inspected instead; this is not a claim to have independently rerun `#check`.
- The published Annals version of Kisin–Zhou was not compared. All verified locators refer to arXiv v2, exactly as the README and manifest specify; whether the source gap was corrected in print is unknown.
- Ownership checks are searches of the available main, board and indexed open-head material, followed by inspection of relevant matches. They do not certify the absence of an unindexed or differently worded theorem. The full downstream Shimura-stack argument and the excluded singular local-model curve theorem were not reviewed.

## Source issues

- **Error** in Poonen2004 at Theorem 3.3, author PDF p.10 (Poonen2004 line 514): the source says the hypersurface is geometrically integral even in projective dimension one with arbitrary prescribed finite points; it should be restricted to ambient dimension at least two, or drop geometric integrality of the hypersurface in dimension one; affects a stated result.
- **Gap** in KisinZhou2024 at proofs of Corollary 5.2.7, p.53, and Proposition 5.3.5, p.54 (KisinZhou2024 line 2345 and line 2413): the source says Poonen's projective corollary provides the marked curve in the smooth chart; it should be supplied with a nonprojective same-field curve argument or a justified projective ambient reduction; affects the proof.

The first witness is `X=ℙ¹_𝔽₂` with prescribed points `{0,∞}`: a geometrically integral zero-dimensional smooth projective 𝔽₂-scheme is `Spec 𝔽₂`, so cannot contain both. A reduced hypersurface `V(XY)` does contain both and gives the weaker smooth-intersection conclusion used by this package. For the second, the cited proof specifies a smooth chart, but supplies no smooth projective ambient variety to which Corollary 3.4 applies. The package's same-field morphism theorem supplies precisely that missing step.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "46a0dff71432cf65187630ddf8797b7fceff7ea8", "job": "RT-LefschetzPencilsAndVanishingCyclesPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
