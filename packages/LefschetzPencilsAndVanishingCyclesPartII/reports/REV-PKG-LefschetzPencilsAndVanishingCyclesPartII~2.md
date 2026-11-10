# Review of LefschetzPencilsAndVanishingCyclesPartII (package, round 2)

**Verdict:** needs changes

Four findings: two P1 and two P2. All four findings from the previous review are repaired. The four Lean theorems elaborate and their mathematical conclusions survive this review; the new findings concern false ancillary assertions, inaccurate ownership at the new pin, and an overstatement about Poonen.

## R01 (P1) — The zero ring contradicts the unrestricted noninjectivity API

**Location.** `packages/LefschetzPencilsAndVanishingCyclesPartII/README.md:219`: “For `m ≥ 2` it is not injective”. Related assertions occur at lines 203, 214–215, 236–237 and 263–265. Layer 1 explicitly permits every commutative ring (line 196).

**Claim.** The displayed kernel element is nonzero, origin preservation fails at base zero, and positive dimension is necessary for a closed immersion, without a nontriviality hypothesis on the ring.

**Witness.** Take `k = ZMod 1`. Both polynomial rings are singletons: the substitution is injective and surjective, `X_1 − X_0² = 0`, and the two origin-evaluation homomorphisms agree even at `m=2, B=0`.

**Exact repair.** Preserve the arbitrary-commutative-ring definition and all four headline signatures. Require `k` nontrivial for the noninjectivity assertion and for the asserted failure of origin preservation. Replace “only for `m > 0`” by “for `m > 0`; for `m = 0` it fails over a nontrivial ring”. Put the negative-control computations at lines 236 and 263 over `ℤ` or `𝔽₂`, or explicitly assume nontriviality. Add the zero-ring Check: the map is the unique bijection between singleton polynomial rings, including at `m=0`, and both origin maps coincide.

**Repair tested.** A scratch Lean copy proves injectivity at `(ZMod 1,2,2)`, surjectivity at `(ZMod 1,0,2)`, vanishing of the proposed kernel witness, and equality of the two origin homomorphisms. Over `ℤ`, the coefficient of `X_1` in `X_1−X_0^B` is `1`, whereas its image is zero; at `m=2,B=0` the two origin evaluations of `X_1` are `0` and `1`. Thus the added hypotheses distinguish exactly the counterexample.

## R02 (P2) — The ownership claim misses the pinned Kronecker coefficient theorem

**Location.** `packages/LefschetzPencilsAndVanishingCyclesPartII/README.md:59`: “no pinned library or roadmap states it as a map with a coefficient theorem”; the corresponding new polynomial-expansion proof plan is at lines 249–254.

**Claim.** This package must build the coefficient-preservation mechanism for the Kronecker substitution.

**Witness.** `TauCeti/RingTheory/MvPolynomial/Kronecker.lean:96` proves `MvPolynomial.coeff_aeval_X_pow_weight` over every commutative semiring. `TauCetiRoadmap/ArithmeticInterpolationDeterminants/README.md:299` on main imports it; its §0.3, line 426, uses the weight `(1,B)`.

**Exact repair.** Cite the pinned weighted coefficient theorem and `injOn_aeval_X_pow` in Scope and the Tau Ceti supplier contract. Replace §1.2's re-planned support expansion by application of that theorem to `T = {d | ∀ i, d i < B}` and weight `i ↦ B^i`. Retain only the genuinely additional bounded-base specialization and its digit-injectivity argument as this package's algebraic target; explicitly distinguish that specialization from the imported general coefficient mechanism. The real-body definition needed by the geometric signatures may remain. Do not claim ownership of the general substitution coefficient API. Update the Layer 1 dependencies accordingly.

This is not a same-name collision or a one-tactic-padding finding for the *present bounded signature*: the library theorem requires injectivity of the weight, and establishing that from the digit bounds is additional work. It is an ownership and supplier-contract defect, with a concrete imported theorem replacing the claimed missing theory.

**Repair tested.** In a scratch copy importing `TauCeti.RingTheory.MvPolynomial.Kronecker`, after supplying bounded-weight injectivity, the identical coefficient conclusion closes with `exact MvPolynomial.coeff_aeval_X_pow_weight hi hh he`; even conversion from `aeval` to this package's `eval₂Hom` definition succeeds. For `h=X_0²X_1−X_0X_1²`, `B=3`, the imported theorem returns coefficients `1,−1,0` at weights `5,7,6`, respectively, including the off-support query. At `B=1` the digit set is `{0}`; at `B=0` it is empty if `m>0` and a singleton if `m=0`.

## R03 (P1) — Avoidance prose loses the dimension-one exception and field restriction

**Location.** `packages/LefschetzPencilsAndVanishingCyclesPartII/README.md:285`: “no graph avoids every proper closed subset at once”. Also lines 184–188 describe the arbitrary-ring layer as producing a graph meeting the complement of a hypersurface.

**Claim.** No fixed graph meets all dense opens, and the geometric avoidance description applies throughout the arbitrary-ring layer.

**Witness.** For `m=1` over `𝔽₂`, every graph is the identity, so the preimage of every nonempty open is itself. Over `ℤ/4ℤ`, `h=2` stays nonzero under substitution but `D(2)=∅`.

**Exact repair.** Restrict the impossibility of one graph meeting every dense open to `m≥2` over a field: its own proper closed image is a counterexample. State separately that for `m=1` the identity graph meets every nonempty open. In “How to read the build”, distinguish nonzero polynomial substitution over a commutative ring from the nonempty dense-open conclusion over a field, as §1.3 already does. Add these two negative controls to the README.

**Repair tested.** For `m=2`, the image of `a_B` lies in the proper closed subset `V(X_1−X_0^B)`, whose inverse-image complement is empty. For `m=1`, the inverse image of the complement of any proper closed subset is that same nonempty complement. In `(ℤ/4ℤ)[T]`, `2²=0` forces every prime to contain `2`, so nonzero substitution alone cannot imply geometric avoidance. None of these examples refutes `exists_avoiding_graph`, whose formal conclusion correctly asks only for nonzero substitution and a closed immersion over a ring.

## R04 (P2) — Poonen can force intersection with a prescribed dense open

**Location.** `packages/LefschetzPencilsAndVanishingCyclesPartII/README.md:88`: “but do not make the subvariety meet a prescribed dense open”; repeated at lines 539–540.

**Claim.** Meeting a prescribed dense open is a separate deficiency of Poonen's cited statements, even in their own projective setting.

**Witness.** Poonen2004 line 536, Corollary 3.4, author-PDF p. 10, allows any finite set of closed points. Add a closed point `z∈U` to that set and choose dimension one; the resulting curve contains `z`.

**Exact repair.** Explain that Corollary 3.4 supplies the required open intersection in its smooth projective geometrically integral setting by enlarging the finite marked set. Retain the actual obstacle: the smooth affine chart used here is not projective, and the curve component through the chosen mark must be controlled. Theorem 3.3 alone need not connect that component to a second prescribed point. Remove the blanket claim that neither result can force open intersection, both in Scope and Downstream consumers. Refine the earlier review's erratum to the missing nonprojective reduction, rather than alleging an independent projective open-intersection gap.

**Repair tested.** Take `X=ℙ²_{𝔽₂}`, `y=[0:0:1]`, and `U=D(X_0)`. The enlarged set `{y,[1:0:1]}` is finite, with the second point in `U`; Corollary 3.4 with dimension `1` yields a geometrically integral curve containing both. Its intersection with `U` contains that second point and is dense. More generally a nonempty open of a finite-type scheme over a finite field has a closed point; rationality of the added point is unnecessary. This does not solve the absent-projectivity issue in Kisin–Zhou's application.

## Verified sound

### Previous findings, checked first

| Previous finding | Repaired passage in the README | Status and independent verification |
|---|---|---|
| F01 | Lines 150–152: “it does include nonemptiness of every fibre product … since Mathlib's `IsIntegral` carries a `nonempty` field” | Repaired. `Mathlib/AlgebraicGeometry/Properties.lean:239` contains that field; `Geometrically/Integral.lean:40` quantifies integral field base changes. Taking `K=k` gives nonempty `C`. |
| F02 | Lines 396–397: “(Stacks, Lemma 33.25.10 (0CDW), for the variety `C` smooth at `c`)” | Repaired. The tag is also in Scope, line 73. Stacks-Varieties line 2147 assumes a variety with a rational smooth point. Here the affine connected smooth component is integral and finite type, so it is a variety. |
| F03 | Lines 291–292: “`h = X_0^q − X_0 ∈ k[X_0]` … `φ(h) = T^q − T` for every `B`” | Repaired. `B^0=1`; at `q=2` the image is `T(T−1)` and at `q=3` it is `T(T−1)(T+1)`. The other uses of `T^q−T` are on the target affine line. |
| F04 | Lines 322–327: “`HasRingHomProperty` instance … `Algebra.Etale.baseChange` … essentially of finite type” | Repaired. The instance and base-change theorem appear in the supplier contract and the target's Needs; `Algebra.EssFiniteType.of_finiteType` is also named. The pinned declarations are listed below. |

No finding was previously marked not actionable. All repair additions were re-read. Searches for the repaired patterns found no remaining claim that geometric integrality lacks nonemptiness, no dangling 0CDW reference, and no remaining source-variable `T` in the `k[X_0]` Check. The new zero-ring failures are independent of F01–F04. Earlier computed adversarial rows were used as evidence only for unchanged passages; the sampled sections were re-examined in full.

### Principles, scope and shape

The scope remains a general library construction over arbitrary fields, including finite, imperfect and characteristic-two fields; it is not restricted to good primes or an arithmetic application. The general arbitrary-ring coefficient theorem and the general-field curve theorem have matching Lean signatures. There is no algorithm, copied source passage, sorry'd data, `set_option`, free predicate stand-in or re-planning of the base pencil roadmap. R02 concerns an imported algebraic mechanism, not an irreparable scope error.

The base roadmap at its open head, `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:2479`, gives an axis only after a finite field extension and replaces `Frob_q` by its power. Its arithmetic spreading statement at line 3997 concerns families and inertia, not a curve in an arbitrary smooth chart through a prescribed rational point. This Part II can therefore retain its geometric scope.

The seven numbered sections, two layer Examples sections, two Dependencies sections, conventions, summary, consumers and three worked examples were checked. Both substantial definitions have API lists and five discriminating Checks. The named chart and curve conventions are exercised in §§2.1 and 2.4. Layer 2 genuinely consumes Layer 1; the order is forced by the constructions, not by any source's chapter order. The source citations provide native proof ingredients rather than falsely attributing the assembled new theorem to a numbered source theorem. All five own backticked declaration names occur in Suggested.lean, with no missing own declaration. No process-residue defect was found; bibliographical dates specify source versions. `metadata.toml` contains `topic = "math.AG"`. All five external works cited by the package are in the sources manifest.

For house shape, I read main's `TauCetiRoadmap/SchemeAndStackFoundations/README.md` and `TauCetiRoadmap/QuadraticCharactersAndReduction/README.md`, including their opening, supplier and target/Check structure.

### Seeded source verification

No author-flagged unverified locator was found. All seven sampled targets were checked. The five cached sources were readable; no source fetch or manifest alteration was needed.

| Target / use | Locator actually read | Scope and result |
|---|---|---|
| §1.1 | Mathlib `Algebra/MvPolynomial/Eval.lean:158,181,185,189,203` | Evaluation ring homomorphism, constants, variables, postcomposition and monomials. It gives precisely `X_i↦T^(B^i)`. Its laws do not imply nontriviality; R01 corrects that inference. |
| §1.2 | Mathlib `Data/Nat/Digits/Defs.lean:310`; `Digits/Lemmas.lean:37,360`; `Data/Finsupp/Weight.lean:82` | Equal-length lists, digits strictly below a base greater than one; the weight is the sum of digit times base power. Cases `B=0,1` must be handled separately as stated. The polynomial coefficient mechanism now also exists at the Tau Ceti pin (R02). |
| §1.3 | Mathlib `AlgebraicGeometry/Morphisms/ClosedImmersion.lean:97`; `Topology/Irreducible.lean:198` | Surjectivity implies a closed immersion over any ring. Density requires a nonempty open in a preirreducible space; §1.3 correctly supplies a field for its geometric consequence. Ancillary blanket claims need R03. |
| §2.1 | Mathlib `Morphisms/Etale.lean:52`; `RingTheory/Etale/Basic.lean:241`; `EssentialFiniteness.lean:95`; `Etale/Field.lean:194`; `Ideal/GoingUp.lean:196` | Étale affine ring map, étale base change, essentially finite type, separable field decomposition, and nonzero contraction for an algebraic element in a domain. Injectivity into the domain permits clearing denominators. The cited decomposition's formal signature states finite index set and separable factors; finite-dimensionality here also follows from the finite-type algebraic situation. |
| §2.2 | SchemeAndStackFoundations §0.8; Stacks-Varieties line 528 (33.7.14/04KV, p. 12), line 2084 (33.25.4/056T, p. 46), line 2147 (33.25.10/0CDW, p. 47); Stacks-Properties line 433 (28.7.7/033N, p. 10) | Connected plus rational point gives geometric connectedness; smoothness gives geometric normality and reducedness; locally Noetherian normal components are integral. 0CDW applies to the resulting affine variety, not the disconnected whole pullback. |
| §2.3 | Mathlib `Morphisms/UniversallyOpen.lean:43,142`; `Topology/Irreducible.lean:202,198` | The marked component is nonempty; its étale projection is open. Its image meets the nonempty principal open in the affine line, yielding a nonempty good open, which is dense in integral `C`. |
| §2.4 | Stacks-Morphisms line 3743 (29.37.21/054L, p. 83); the preceding 056T and 033N locators | A smooth point admits an affine étale coordinate neighbourhood over an affine base. Restriction to the integral component and rational translation meet exactly §2.3's hypotheses. |
| Scope and consumers | Poonen2004 lines 514–517 and 536–539 (Theorem 3.3, Corollary 3.4, author-PDF p. 10) | Theorem 3.3 has smooth quasi-projective ambient scheme; Corollary 3.4 has smooth projective geometrically integral ambient variety. Both permit a finite set of closed points. R04 corrects the claimed limitation on dense-open intersection. |
| Summary and §2.4 motivation | KisinZhou2024 lines 2169,2174 (Proposition 5.2.3, Remark 5.2.4, p. 49), 2322–2351 (Corollary 5.2.7, pp. 52–53), 2392–2425 (Proposition 5.3.5, p. 54) | Numbering and pages match arXiv v2. The two proofs apply Poonen to smooth charts without establishing projectivity; the new local theorem supplies that curve step. The singular local-model assertion and rational atlas lift remain separate inputs owned by consumers. |

### Computed adversarial table

Rows cover every sampled section, all four headlines, the changed passages, and every finding. “Generic point” means the zero prime of the displayed polynomial domain, not an assumed rational point. The statements with no new defect also agree with the earlier review's computed rows.

| Statement | Instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| §1.1 definition and normalisation | `m=2,B=3`, monomial `2X_0²X_1` over `ℤ` | `φ(2X_0²X_1)=2T⁵`; weighted formula gives `2T^(2+3)=2T⁵`; constants map `7↦7` | Equal; correct source/target and indexing. |
| §1.1 origin | `m=2,B=0`, over `ℤ` and the zero ring | `X_0↦T`, `X_1↦1`; evaluation of `X_1`: `0` versus `1` over `ℤ`, but `0=1` over the zero ring | R01; exclude the zero ring only from failure assertions. |
| §1.1 injectivity and zero variables | `k=ZMod 1`, `m=2` or `0` | Source and target cardinalities are both `1`; kernel witness `X_1−X_0²=0`; map injective and surjective. Over a field and `m=0`, image consists of constants and omits `T` | R01. |
| §1.1 one variable and coefficient change | `m=1,B=0`; `ℤ→𝔽₂`, `h=2X_0+X_1`, `m=2,B=3` | First case `X_0↦T^(0^0)=T`; second case both coefficient-change composites yield `T³` from `2T+T³` | Equal. |
| §1.1 finite-field line control | `h=X_0²X_1−X_0X_1²` over `𝔽₂` | Restrictions to `X_0=0`, `X_1=0`, `X_0=X_1` all `0`; substitution at `B=3` gives `T⁵+T⁷≠0` | Graph succeeds where all three rational lines fail. |
| §1.2 coefficient headline | `h=X_0²X_1−X_0X_1²`, `B=3`, over `ℤ` | Weights of `(2,1),(1,2),(0,2)` are `5,7,6`; output coefficients `1,−1,0`, equal to source coefficients | True, including query outside support; R02 changes supplier ownership. |
| §1.2 strict digit bound | `h=X_1−X_0²`, `B=2`, over `𝔽₂`; then `B=3` | First output `0`, source coefficient at `(0,1)` is `1`; strict bound fails. Second output `T³−T²≠0`, weights `3≠2` | Correct negative control. |
| §1.2 query bound | `h=X_1`, `B=2`, query `e=(2,0)` | Output coefficient at `w(e)=2` is `1`, source coefficient at `e` is `0`; query bound fails | Hypothesis on query is necessary. |
| §1.2 low bases and empty index | `B=1`; `B=0,m>0`; `m=0` | At base one only digit vector `0`, both coefficients equal the constant `a`; at base zero with a coordinate, no query satisfies `<0`; empty vector has weight `0`, both coefficients `a` | True in all cases. |
| §1.2 zero and nonreduced rings | Zero ring; `ℤ/4ℤ`, `h=2X_1`, `B=3` | Zero ring gives `0=0`; nonreduced ring gives `φ(h)=2T³`, coefficient `2=2≠0` despite `2²=0` | Algebraic headline remains general. |
| §1.3 surjectivity | `m>0`, arbitrary `B`, `p=3+2T+T²` over `ℤ` | `φ(3+2X_0+X_0²)=3+2T+T²=p`; at `m=0` over a field there is no preimage of `T` | Correct. |
| §1.3 avoiding headline | `m=1,h=X_0`; `m=2,h=X_1−X_0²` | First `B=2` gives `T≠0`; second admissible `B=3` gives `T³−T²≠0`; both maps surjective, hence spectra closed immersions | True. |
| §1.3 repaired finite-field Check | `q=2` or `3`, arbitrary `B` | `φ(X_0^q−X_0)=T^q−T`; exactly `q` rational roots, hence zero rational points in `D`; zero prime is in `D` | F03 repaired. |
| §1.3 simultaneous avoidance | `m=1`, identity graph; `m=2`, its defining equation | For every proper `Z⊊𝔸¹`, preimage of complement is the same nonempty complement; for `Z=V(X_1−X_0^B)⊊𝔸²`, preimage of complement is empty | R03, dimension guard. |
| Layer 1 overview versus ring theorem | `k=ℤ/4ℤ`, `h=2`, `m=1` | `φ(h)=2≠0`, but `D(φ(h))=∅` since `2²=0` | R03, retain field qualification. |
| §2.1 boundary polynomial | Identity chart of `𝔸²`, `Z=V(X_0X_1)`; empty `Z`; torus chart with `Z={1}` | Choose respectively `h=X_0X_1`, `h=1`, `h=X_0−1`; corresponding zero sets contain exactly the displayed boundary images | True; no uniqueness claimed. |
| §2.1 zero dimension | `V=Spec L`, finite separable `L/k` | Only proper closed subset `∅`; `h=1`, `V(1)=∅` | True without a rational mark. |
| §2.1 repaired base-change route | Identity chart; projection `𝔸²→𝔸¹` | Generic algebras `k(X)⊗k[X]=k(X)` versus `k(X_0)[x_1]`; first is a field, second has transcendental `x_1`. For projection, `V(x_1)` maps onto all `𝔸¹` | F04 repaired; étaleness is essential. |
| §2.2 component, maps, marking | Identity chart, `B=2`, `U=D(X_0)` | `W=C=𝔸¹`, `q=id`, `g(T)=(T,T²)`, `c=0`; both projection composites `(T,T²)`; `g⁻¹(U)=D(T)`, not containing `c` | Correct; swapped coordinates give `(T²,T)`, excluded. |
| §2.2 disconnected pullback | `𝔽₃`, chart `(x,z)↦(x,z²−1−2x)`, `z` invertible | Jacobian determinant `2z` is a unit; pullback equation `z²=(T+1)²`; factor difference `2(T+1)` a unit. Exactly two components `z=±(T+1)`; mark has `z=1`, not `−1` | Correct; using all of `W` loses integrality. |
| §2.2 F02 application | Marked branch above, `C=D(T+1)` | `dim C=1`; at `T=0`, `z=1`; connected smooth affine variety with rational mark. Whole `W` has two components and is not a variety | 0CDW applies to `C`, not `W`. |
| §2.2 field base change | Above example over `𝔽₉`; identity chart over imperfect `k` and purely inseparable `K/k` | First remains two branches with marked branch `z=T+1`; second becomes `K[T]`, a domain. `D(T)_K=D(T)` still contains `(0)` | Both separable and inseparable extensions preserve the claimed component. |
| §2.3 marked-curve headline | `𝔽₂` identity chart, `U=D(X_0²X_1−X_0X_1²)`, `B=3` | `g⁻¹(U)=D(T⁵+T⁷)=D(T⁵(1+T)²)`; excludes `0,1`, contains generic point and two `𝔽₄` points | Nonempty and dense; no rational good point required. |
| §2.3 relative dimension and rational section | Étale `q`, composition to `Spec k`; mark over `0` | Relative dimension `0+1=1`; `constantCoeff∘C=id_k`, so `c≫s_C=id` | Matches all explicit Lean binders. |
| §2.3 zero-dimensional chart | `V=Spec k`, `U=V`, `m=0` | `W=C=𝔸¹`, `q=id`, `g` constant, `c=0`; both composites to `Spec k` equal the structure map; good open is `C` | True; no closed immersion for `g` is asserted. |
| §2.4 same-field headline, local density | `Y=𝔸¹⊔𝔸¹`, mark in first copy, `U=V` first copy | `closure_Y(U)=U≠Y`, but inverse image in `V` is all of `V`; choose `C=𝔸¹`, `g` first inclusion; good open `C` | Ambient density correctly unnecessary. |
| §2.4 point and singular elsewhere | `Y=Spec k`; `Y=Spec k[x,w]/(xw)`, mark `(1,0)` | First output `C=𝔸¹`, constant `g`; second `D(x)=Spec k[x,x⁻¹]` since `w=0`; local chart smooth despite singular origin | Correct scope. |
| §2.4 rationality and smoothness controls | `Spec 𝔽₉/𝔽₃`; cone `x²+w²=0` over `𝔽₃` | No `𝔽₃`-algebra map `𝔽₉→𝔽₃`; cone splits over `𝔽₉` into `x=±iw`, `i²=−1`. Frobenius-stable integral image lies in intersection `{0}`; good open empty | Both missing-hypothesis controls valid. |
| §2.4 residue-field convention | Sections over `𝔽₃`, e.g. the marked branch | Residue degrees `1` and `1`; induced map `𝔽₃→𝔽₃` sends `2↦2`; extension degree `r=1`, hence Frobenius maps to its first power | Convention agrees with Tau Ceti. |
| F01 geometric integrality | `Spec k(t)/k`; empty scheme | Field base changes of `k(t)` are localizations of `K[t]`, domains with `1≠0`; `k(t)` is not finite type as a `k`-algebra. Empty scheme has no `Nonempty` witness | Includes nonemptiness; excludes neither non-finite-type examples nor needed separate good-open condition. |
| Poonen open-intersection claim | `ℙ²_{𝔽₂}`, marked set `{[0:0:1],[1:0:1]}`, `U=D(X_0)` | Values of `X_0` at the two marks are `0` and `1`; a curve containing both has nonempty intersection with `U` | R04. |

No denominator, out-of-range index or truncated natural subtraction occurs in a headline. `Fin m` controls indices; the only exceptional power is `0^0=1`, explicitly tested. There is no group convention or nonabelian-group claim to test. Square-zero/nonreduced coefficients are admitted by Layer 1 and tested above; smoothness and integral-affine hypotheses exclude a nonreduced chart in Layer 2.

### Pinned declarations and ownership

The checked content revision is `5fc1aa8fb5158b49283293de7401899b6efc359b`; its manifest pins Mathlib to `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti to `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Both library checkout revisions agree with those pins. The old review's claim that the coefficient mechanism was absent is therefore not reusable evidence at this pin.

In addition to the declarations in the source table, I opened these native definitions and supplier facts:

| File at the pin | Declaration and relevant content |
|---|---|
| `Mathlib/Algebra/MvPolynomial/Basic.lean:916`; `Mathlib/Algebra/Polynomial/Coeff.lean:128` | Both `constantCoeff` definitions are coefficient zero as ring homomorphisms; no rational-point existence is hidden in them. |
| `Mathlib/AlgebraicGeometry/Properties.lean:239`; `Geometrically/Integral.lean:40` | `IsIntegral` includes `nonempty`; geometric integrality asks for integral field base changes, with no finite-type condition. |
| `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:127,201` | Smooth relative dimension is defined by local standard-smooth presentations, and composition adds dimensions. |
| `Mathlib/AlgebraicGeometry/AffineSpace.lean:223,378` | `SpecIso` identifies affine space over an affine base with polynomial spectrum; smooth dimension is `Nat.card` of a finite variable type. |
| `Mathlib/AlgebraicGeometry/Morphisms/Etale.lean:52,70,104` | Affine ring-hom property, base change, and equivalence with smooth relative dimension zero. Restriction/composition are available in the same file. |
| `Mathlib/Topology/NoetherianSpace.lean:194`; `Topology/Connected/Basic.lean:606` | Finitely many irreducible components; connected components closed. In the Noetherian pullback these give clopen connected components. |
| `TauCeti/AlgebraicGeometry/Morphisms/Smooth/GeometricallyIntegral.lean:37` | `TauCeti.AlgebraicGeometry.Smooth.geometricallyIntegral` requires smoothness and geometric connectedness. |
| `TauCeti/AlgebraicGeometry/RationalPoint/Basic.lean:97,122` | The residue-degree and residue-field-bijection theorems require an actual section equation; both marks supply one. |
| `TauCeti/AlgebraicGeometry/Morphisms/Smooth/EtaleCoordinates.lean:86,98` | Native affine étale coordinate neighbourhoods for fixed relative dimension or general smoothness; indices use `ULift (Fin n)`. The general-field chart contract is available. |
| `TauCeti/RingTheory/MvPolynomial/Kronecker.lean:75,96,109` | Finite-set separating weights, coefficient preservation, and injectivity on supported polynomials. These cause R02. |
| `Mathlib/RingTheory/NoetherNormalization.lean:80,93` | The different variable change `X_i+cX_0^r_i` and private digit-separation proof; the README describes this comparison accurately. |
| `Mathlib/Algebra/MvPolynomial/Equiv.lean:606`; `RingTheory/MvPolynomial/Basic.lean:169` | `finSuccEquiv` retains the remaining polynomial variables as coefficients; `restrictDegree` is a support submodule. Neither by itself is the bounded Kronecker coefficient statement. |

The supplied library-near-match list was treated as leads, not proof of absence: its `IsEtale`/`IsSmooth` naming does not replace the actual pinned `Etale`/`Smooth` definitions. The generic power-series substitution and polynomial-dimension hits are not geometric curve-existence theorems. Object searches in Mathlib and Tau Ceti found no counterpart of the two curve headlines or the stated boundary-polynomial construction; the substantive algebraic overlap is R02.

I used `roadmaps grep` at the supplied open heads and on main for the substitution, coefficient/weight separation, boundary images and curves through points, and searched board-package READMEs. The board package index was read before making absence claims. Main's ArithmeticInterpolationDeterminants §0.3 already imports the generic Kronecker coefficient mechanism and treats the two-variable specialization; it is not a supplier of the arbitrary-dimensional geometric curve theorem. The local-model/Schubert curve in the board's `packages/ShimuraVarietiesPartII/README.md:1218` is a specialized consumer construction, using `GeometricSatakeAndFusionPartII §5.5`, rather than ownership of this general smooth-chart theorem. No second fully qualified declaration of any of the package's five names was found.

### Supplier order and open-head resolution

The sole roadmap supplier, SchemeAndStackFoundations, is on main. Its §0.8 at `TauCetiRoadmap/SchemeAndStackFoundations/README.md:996` states `etale_coordinates`, and line 998 states `rational_point_component`. Both have the hypotheses consumed here. At open PR #1656, the same file lines 1219–1228 retains those citations and explicitly redirects the coordinate result to the pinned Tau Ceti theorem; this is a surviving supplier reference, not an upward dependency on that revision. Its scope owns the general scheme foundations; this package owns the boundary image and marked graph application. The other matching revision heads preserve the same §0.8 names. No open-head overlap requiring a numbering map or merge order was identified by the supplied overlap report, and the closest-head comparison confirms that result.

All Needs lines were read. They point to pinned facts, the earlier internal layers, and the main supplier. The shrinking argument uses the normal/component facts explicitly present in the cited supplier's §0.8 proof, as well as the Stacks locators. No gap is declared: `design/plan.json` has `gaps = []`. Nothing here depends on a later roadmap. Mechanical check output:

```text
depcheck: 236 roadmaps, 2134 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The citation resolver finds no unresolved roadmap citation or own Lean name. Its output explicitly says that it did not check external Lean names; the pinned declarations were opened independently as recorded above.

### Headline completeness, signatures and padding

README lines 33–34 identify four headlines, all present:

| README target | Suggested.lean | Signature comparison / probe |
|---|---|---|
| §1.2 `polynomialGraph_coeff` | line 48 | Arbitrary commutative ring, bounds on support and query; no base-positivity binder lost. `rfl`, `infer_instance`, `simp` do not close it. R02 requires imported-mechanism attribution. |
| §1.3 `exists_avoiding_graph` | line 59 | Positive `m`, nonzero input, existential base bound, nonzero output, closed immersion. Same one-tactic probes fail. |
| §2.3 `exists_marked_etale_curve` | line 74 | Integral affine chart, étale map, origin equation, dense open, explicit component-existence properties. Same probes fail. |
| §2.4 `exists_same_field_curve` | line 98 | Field, section, smooth open neighbourhood and relative density; affine smooth geometrically integral curve with both section and image equations. Same probes fail. |

`lake env lean` on the unchanged Suggested.lean, run from the pinned content checkout, exits successfully with exactly four warnings, each “declaration uses `sorry`”, and no other warnings. The single import is `import Mathlib`. No module build was needed. A scratch copy containing `#check @name` for all five declarations elaborates; all binders agree with the README and the supplied signature listing. There are no section variables to silently disappear.

A separate scratch copy replaced every `sorry` with `first | rfl | infer_instance | (simp; done)`. All four fail to close the goals; none is a boundary-case statement, a Check, or a restatement of the definition. Inspection of the relevant pinned theorem confirms that §1.2 is not closed by a bare exact-library-lemma invocation without first supplying bounded-weight injectivity. That distinction is why R02 is not reported as padding. The four zero-ring witnesses and the imported coefficient-mechanism conversion were then elaborated successfully in a separate scratch copy. The exploratory homomorphism-extensionality proof needed adjustment; the final witness file passes with only the four inherited headline `sorry` warnings.

The marked component is heavy construction data and stays in the README as the docstring explains; its existential properties are in the two geometric headline statements. No statable headline is absent or represented by a stand-in.

## Not verifiable

- The published Annals numbering of Kisin–Zhou was not compared with the preprint. The package explicitly cites arXiv v2 and its manifest records that version limitation; all cited preprint locators were read.
- Poonen's journal pagination was not checked against the journal typesetting. The cited author-PDF page 10, both theorem numbers and all relevant hypotheses were checked directly.
- The three remote-only board package heads listed in the board index were not independently opened. Ownership searches covered the available board files and the supplied indexed open roadmap heads/main; no global absence claim about those three remote-only package contents is made.

These limitations do not require a missing-source request: the cited source versions are present and readable, and the findings have explicit witnesses.

## Source issues

- **Gap** in KisinZhou2024 at Corollary 5.2.7, proof, printed page 53, and Proposition 5.3.5, proof, printed page 54: the source says Poonen's projective curve theorem supplies the curve inside the smooth chart; it should be justified for the possibly nonprojective chart, with the marked component and open intersection retained; affects the proof.
