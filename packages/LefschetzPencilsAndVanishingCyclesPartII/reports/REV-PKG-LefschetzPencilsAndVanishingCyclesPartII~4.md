<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13144#issuecomment-6784443087 -->
Review (codex) of 46a0dff

Verdict: accepted

No findings. The previous missing-dimension finding is repaired. All seven sampled targets were reread, the repaired passages were tested again, and all four headline theorems elaborate and survive the padding probes. No package input was changed.

## Verified sound

### Previous finding and repair verification

The previous report has one actionable finding, F01 (P2). The repair report marks it applied, not “not actionable”.

| Previous finding | Repaired passage | Status and witness |
|---|---|---|
| F01: positive dimension missing from Poonen's Corollary 3.4 synopsis | `packages/LefschetzPencilsAndVanishingCyclesPartII/README.md:103`: “geometrically integral variety `X` over `𝔽_q` with `dim X ≥ 1`” | Repaired. `Spec 𝔽₂` has dimension 0 and no curve subvariety; it is now excluded. Poonen2004 line 537 supplies precisely this hypothesis. |
| F01: adjacent Theorem 3.3 synopsis | `packages/LefschetzPencilsAndVanishingCyclesPartII/README.md:110`: “`dim X ≥ 1`, giving a hypersurface `H` with `H ∩ X` smooth of dimension `dim X − 1`” | Repaired. Poonen2004 lines 514–517 impose this bound and intersection dimension. For `X=ℙ¹`, `H=V(XY)`, the intersection has dimension 0, as asserted. |
| F01: downstream repetition | `packages/LefschetzPencilsAndVanishingCyclesPartII/README.md:618`: “geometrically integral ambient variety of dimension at least one”; line 621: “quasi-projective chart when it has dimension at least one” | Repaired in both places. The projective and quasi-projective conclusions remain distinguished. |
| F01: zero-dimensional negative control | `packages/LefschetzPencilsAndVanishingCyclesPartII/README.md:575`: “its only nonempty closed subscheme is `Y` itself, so it contains no curve” | Repaired. Ideals of `𝔽₂` are `(0)` and `(1)`. The required curve morphism still exists: `𝔸¹ → Spec 𝔽₂`, mark 0, inverse image of the whole target equal to `𝔸¹`. |

The manifest now associates Poonen2004 with Scope and ownership, §2.4 and Downstream consumers. I searched all Poonen/dimension/projectivity passages and the older repaired patterns: zero-ring noninjectivity, origin preservation at base zero, dimension-one universal avoidance, ring-versus-field nonemptiness, and attribution of the general coefficient mechanism. No recurrence was found. The changed claims and their new Check are included in the computed table below. No conclusion relies on an earlier “sound” summary without values; the seven sampled sections were inspected in full again.

### Principles, structure and completeness

Checked two layers, seven numbered target sections, nine Needs lines, both layer dependency sections, four headline theorems, the two substantial constructions and their API lists, and all five source entries. The polynomial construction has six Checks, the marked component five; the étale-chart hypotheses have four concrete tests in §2.1. Point, curve, density and base-field conventions are tested throughout §2.2–§2.4.

The scope is genuinely general: arbitrary fields, finite and imperfect fields included, and arbitrary commutative coefficient rings for the algebra. There is no prime restriction or arithmetic substitute for the geometric theorem. The explicit base bound is a mathematical existence witness, not a computational-algorithm deliverable. The base roadmap's pencil theory is neither repeated nor used as an upward supplier. The local same-field extension is identified where the base roadmap stops.

Layer 2 needs Layer 1's coefficient preservation to make the good open nonempty. Within Layer 2, the boundary polynomial and marked component supply the fixed-chart theorem, which supplies the local smooth-point theorem. This order is forced by the proof dependencies, not borrowed from a source's chapter order. The good-open API in §2.2 is proved in §2.3 from the other component properties; its own conclusion is not assumed in that argument.

The README has the requested Summary, scope, conventions, supplier contracts, reading guide, mathematical layers, Examples and Dependencies, consumers, worked examples and references. I compared its shape with main's `TauCetiRoadmap/SchemeAndStackFoundations/README.md` and `TauCetiRoadmap/QuadraticCharactersAndReduction/README.md`. Definitions have concrete source/target maps, APIs and discriminating Checks. The seven targets have explicit hypotheses and pinned-library or source locators for their inputs; the assembled curve theorem is not misrepresented as a verbatim numbered theorem of Poonen or Kisin–Zhou. No copied source passage, process narrative, machine path, HTML anchor, prohibited supplier, `set_option`, sorry'd data, admitted example or free-predicate substitute occurs in the reviewed package text. Reference publication/version dates identify sources, rather than a work stage.

All five own Lean names in the README resolve to the five declarations in `Suggested.lean`; supplier identifiers are attributed to their suppliers. The sole real-body definition makes the headline statements possible. The heavy component construction appropriately remains in the README, while its geometric existence consequences are stated on native scheme carriers. `metadata.toml` has `topic = "math.AG"`; `design/plan.json:704` has no declared gaps. No conditional acceptance is needed.

### Sources and seeded sample

All five cached legal extractions were readable. No author-flagged unverified locator was found. Every cited external work has one manifest entry; no fetch, manifest amendment or missing-reference request was needed. Exact library locators were opened in the pinned checkout, not inferred from search results.

| Sample or cited comparison | Text and locator inspected | Result |
|---|---|---|
| §1.1 The Kronecker substitution | `Mathlib/Algebra/MvPolynomial/Eval.lean:158,181,185,189,203,572,575` | Evaluation on constants, variables and monomials, composition and the algebra-map comparison give the stated real-body definition. No domain hypothesis is hidden. |
| §1.2 Coefficients survive bounded substitution | `TauCeti/RingTheory/MvPolynomial/Kronecker.lean:96,109`; `Mathlib/Data/Nat/Digits/Defs.lean:310`; `Mathlib/Data/Nat/Digits/Lemmas.lean:37,360`; `Mathlib/Data/Finsupp/Weight.lean:82` | The imported theorem requires weight injectivity on a set containing both support and query. Base-digit separation supplies that hypothesis here. Bases 0 and 1 are separately accounted for. |
| §1.3 Surjectivity and the avoiding graph | `Mathlib/AlgebraicGeometry/Morphisms/ClosedImmersion.lean:97`; `Mathlib/Topology/Irreducible.lean:198` | A surjective ring map gives a closed immersion over any ring. Nonempty-open density is used over the field, where the polynomial ring is a domain. |
| §2.1 The boundary polynomial of an étale chart | `Mathlib/AlgebraicGeometry/Morphisms/Etale.lean:52`; `Mathlib/RingTheory/Etale/Basic.lean:241`; `Mathlib/RingTheory/EssentialFiniteness.lean:95`; `Mathlib/RingTheory/Etale/Field.lean:194`; `Mathlib/RingTheory/Ideal/GoingUp.lean:196` | Étaleness survives localization; the generic algebra is a finite separable product. Clearing denominators gives algebraicity over the polynomial subring, and nonzero ideal contraction gives the required polynomial. Affineness, integrality and openness justify each step. |
| §2.2 The marked component of a graph pullback | Stacks-Varieties line 528, Lemma 33.7.14/04KV, p. 12; line 2084, Lemma 33.25.4/056T, p. 46; line 2147, Lemma 33.25.10/0CDW, p. 47; Stacks-Properties line 433, Lemma 28.7.7/033N, p. 10 | Rational point plus connectedness gives geometric connectedness; smoothness gives geometric normality/reducedness; locally Noetherian normal components are integral. The variety hypothesis of 0CDW is met by the affine finite-type integral component, not by the entire disconnected pullback. |
| §2.3 The marked étale curve | `Mathlib/AlgebraicGeometry/Morphisms/UniversallyOpen.lean:43,105,129,142`; `Mathlib/Topology/Irreducible.lean:198,202` | The nonempty étale image is open and dense in the line, so it meets the nonzero polynomial's principal open. Boundary containment then puts this intersection in the good open of the curve. |
| §2.4 The same-field curve through a smooth rational point | Stacks-Morphisms line 3743, Lemma 29.37.21/054L, p. 83; Stacks-Varieties line 2084; Stacks-Properties line 433 | The affine-base clause gives an affine étale coordinate neighbourhood. The normal component and rational translation yield the exact fixed-chart hypotheses, including when its dimension is zero. |
| Repaired Poonen comparisons | Poonen2004 line 514, Theorem 3.3; line 519, first remark; line 536, Corollary 3.4; all author-version p. 10 | Both positive-dimension hypotheses and the intersection dimension match. The finite set in Corollary 3.4 may include a closed point in the dense open. The README does not repeat the erroneous geometric-integrality assertion about the ambient hypersurface in dimension one. |
| Motivation and application boundary | KisinZhou2024 line 2169, Proposition 5.2.3; line 2174, Remark 5.2.4, p. 49; line 2322, Corollary 5.2.7, pp. 52–53; line 2392, Proposition 5.3.5, p. 54 | Numbering agrees with the cited arXiv v2. Lines 2341–2347 and 2411–2417 use Poonen on a smooth chart without establishing projectivity. The package supplies that smooth-chart step, and leaves singular local-model curves and atlas lifts to their owners. |

### Computed adversarial table

Here `φ` is the indicated polynomialGraph, and `η` is the zero prime of a polynomial domain. A “pass” includes successful exclusion of the displayed wrong model. Each row records values, equations, dimensions or explicit sets; these are not elaboration-only checks.

| Statement | Instances tried | Computed values on the two sides / wrong-model value | Result; change |
|---|---|---|---|
| §1.1 constants and monomials | `k=ℤ,m=3,B=2`, `7` and `3X₀X₂` | `φ(7)=7`; `φ(3X₀X₂)=3T⁵`, and `w(1,0,1)=1+4=5` | Pass; none |
| §1.1 first coordinate and total bases | `m=2,B=0,1,3` | Variable images respectively `(T,1)`, `(T,T)`, `(T,T³)`; `B⁰=1` in all three cases | Pass; none |
| §1.1 origin convention | Over `ℤ`, `B=0` versus `B=3`, input `X₁` | Source origin value `0`; substituted origin values `1` and `0` respectively | Positive-base guard correct; none |
| §1.1 algebra map and direction | `B=3`, coefficient `2`, generators `X₀,X₁` | Both eval₂ and aeval give `2,T,T³`; spectra reverse `k[X₀,X₁]→k[T]` to `𝔸¹→𝔸²` | Pass; none |
| §1.1 coefficient change | `ℤ→𝔽₂`, `h=2X₀+X₁`, `B=3` | Substitute then reduce: `2T+T³↦T³`; reduce then substitute: `X₁↦T³` | Pass; none |
| §1.1 one variable | `m=1`, any base including 0 | `X₀↦T`; inverse sends `T↦X₀`. Incorrect one-based weights send `X₀↦Tᴮ` | Pass; none |
| §1.1 no variables | `m=0,k=𝔽₂` | Constant map has coefficient at `T` equal to `0`; polynomial `T` has coefficient `1` | Nonsurjectivity and nonimmersion correct; none |
| §1.1 zero coefficient ring | `k=ℤ/1ℤ,m=0,2,B=0,2` | Both polynomial rings have cardinality 1, both origin values `0=1`, spectra empty, map bijective | Nontriviality guards correct; none |
| §1.1 kernel | `m=2,k=ℤ,B=0,3` | `X₁−1` and `X₁−X₀³` have source coefficient `1` at `X₁`; their images are `0` | Pass; none |
| §1.2 coefficient headline | `h=X₀²X₁−X₀X₁²,B=3,k=ℤ`; queries `(2,1),(1,2),(0,2)` | Weights `5,7,6`; output coefficients `1,−1,0`, equal to source coefficients `1,−1,0` | Pass; none |
| §1.2 bounded weight injectivity | All boxes for `m=0,1,2,3`, `B=0,1,2,3,4` | Each of 20 boxes has as many distinct weights as vectors. For `m=3`: cardinalities `0,1,8,27,64`; maximal weights for positive bases `0,7,26,63` | Pass; none |
| §1.2 bases 0 and 1 | `(m,B)=(2,0),(2,1),(0,0)` | Box sizes `0,1,1`; weight sets `∅,{0},{0}`; coefficient equation in nonempty cases is `a=a` | Pass; none |
| §1.2 strict support bound | `h=X₁−X₀²,B=2` over `ℤ` or `𝔽₂` | Output coefficient at weight 2 is `0`; source coefficient of `X₁` is `1`; the required bound `2<2` fails | Negative control passes; none |
| §1.2 query bound | `h=X₁,B=2,e=(2,0)` | Output coefficient at `w(e)=2` is `1`, source coefficient is `0`; query lies outside box | Negative control passes; none |
| §1.2 bounded injectivity API | `B=2`, `X₀X₁` versus `X₀+X₁` | Images `T³` versus `T+T²`; outside the box, `X₀²` and `X₁` both map to `T²` | Pass; none |
| §1.2 nonreduced coefficients | `k=ℤ/4ℤ,h=2X₁,B=3` | `φ(h)=2T³`, coefficient `2=2≠0`, although `2²=0` | No domain assumption needed; none |
| §1.3 surjectivity | `m>0`, `p=3+2T+T²`, any base | `φ(3+2X₀+X₀²)=3+2T+T²=p` | Closed-immersion route applies; none |
| §1.3 avoiding headline | `h=X₁−X₀²`, choose `B=3`; `m=1,h=X₀`, choose `B=2` | Images `T³−T²≠0` and `T≠0`; bounds respectively `2<3` and `1<2` | Pass; none |
| §1.3 quantifier order | `m=2`, fix graph base `B`, then choose `h=X₁−X₀ᴮ` | `φ(h)=0`, inverse image of complement `D(0)=∅`. For `m=1`, inverse image of every open is itself | Base must depend on hypersurface in higher dimension; none |
| §1.3 finite-field points versus scheme open | `h=X₀^q−X₀`, `q=2,3` | Rational values `[0,0]` and `[0,0,0]`, but polynomial nonzero and `η∈D(T^q−T)` | Pass; none |
| §1.3 arbitrary rings | `k=ℤ/4ℤ,h=2` | `φ(h)=2≠0`; nevertheless `2²=0`, hence `D(φ(h))=∅` | Field-only geometric conclusion correct; none |
| §2.1 boundary equation | Identity chart of `𝔸²`, `Z=V(X₀X₁)` | Both `h=X₀X₁` and `h²` vanish on image; their zero sets coincide | Existence, not uniqueness; none |
| §2.1 zero-dimensional and empty boundary | `V=Spec L`, finite separable `L/k`; `Z=∅` | `h=1`, `V(h)=∅`, image of boundary `∅`; dimension `0` | Pass; none |
| §2.1 nonfinite étale chart | `A=k[x,x⁻¹]`, `Z={x=1}` | `h=X₀−1`; pullback `x−1` vanishes on `Z`; generic algebra `k(x)` | Finiteness of the map not assumed; none |
| §2.1 failure without étaleness | Projection `𝔸²→𝔸¹`, `Z=V(x₁)` | `π(Z)=𝔸¹`, so a polynomial vanishing on the scheme image is `0`; generic algebra `k(x₀)[x₁]` has transcendental `x₁` | Negative control passes; none |
| §2.2 component and projection laws | Identity chart, `B=2`, mark 0 | `W=C=𝔸¹`, `q=id`, `g(T)=(T,T²)`; both composites `(T,T²)`; swapped model `(T²,T)` differs | Correct map orientation; none |
| §2.2 mark and structure morphism | Same chart | `g(0)=(0,0)`, `q(0)=0`; constants map `a↦a`; section composite `id`; relative dimension `0+1=1` | Pass; none |
| §2.2 affine, clopen, finite-type API | `𝔽₃`, `π(x,z)=(x,z²−1−2x)`, `z` invertible, `B=2` | Jacobian `2z` unit; pullback `z²=(T+1)²`; factors differ by unit `2(T+1)`; two affine clopen copies of `D(T+1)` | Pass; none |
| §2.2 correct marked branch | Previous example, mark `(0,1)` | Positive branch gives `z(0)=1`, negative branch `z(0)=2`; whole pullback has 2 components, selected curve 1 | Mark and integrality exclude both wrong choices; none |
| §2.2 boundary mark retained | Identity chart, `U=D(X₀),h=X₀,B=2` | `q⁻¹D(φ(h))=g⁻¹U=D(T)`; `0∉D(T)`, `η∈D(T)` | Removing boundary first would lose mark; none |
| §2.2 extension of fields | Branch example over `𝔽₉`; identity chart over `k=𝔽₂(s)` and `K=k(s^(1/2))` | Marked branch stays `z=T+1` with 1 component; whole pullback stays 2. In inseparable case `C_K=Spec K[T]`, a domain, good open `D(T)` | Separable and inseparable base changes pass; none |
| §2.2 rationality condition | Connected `Spec 𝔽₉` over `𝔽₃` without section | Base change to `𝔽₉` has coordinate ring `𝔽₉×𝔽₉`, hence 2 components, versus 1 before extension | Connectedness alone insufficient; none |
| §2.3 marked-curve headline | `𝔽₂` identity chart, `h=X₀²X₁−X₀X₁²,B=3` | Good open `D(T⁵+T⁷)=D(T⁵(T+1)²)`; 0 rational points, 2 points over `𝔽₄`, generic point present | Nonempty and dense as schemes; none |
| §2.3 open-image argument | `C=D(T+1)` over `𝔽₃`, target open `D(T)` | Intersection `D(T(T+1))` contains `η`; image omits `T=2` and need not be surjective | Openness is sufficient; none |
| §2.3 zero-dimensional chart | `m=0,V=Spec k,U=V` | `C=𝔸¹,q=id,g` constant; both projection composites are `s_C`; good open all `C` | No hidden positive-dimension or immersion condition; none |
| §2.4 same-field headline, local density | `Y=𝔸¹⊔𝔸¹`, mark, `V` and `U` in first copy | Closure of `U` in `Y` is one copy; closure in `V` is all `V`; choose `C=𝔸¹`, first inclusion, good open `C` | Ambient density unnecessary; none |
| §2.4 translation and local smoothness | `Y=Spec k[x,w]/(xw)`, `y=(1,0)`, `V=D(x)`, `U=Y` | In chart `w=0`; `t=x−1` sends mark to 0; `C=D(t+1)`, `g(t)=(t+1,0)`; good open `C` | Singularities away from chart harmless; none |
| §2.4 smoothness negative control | `k=𝔽₃`, cone `x²−2w²=0`, mark origin | Rational solutions only `(0,0)`; over `𝔽₉` two conjugate lines. A geometrically integral image stable under Frobenius lies in their intersection `{0}`, giving empty inverse image of complement | Smoothness is essential; none |
| §2.4 residue fields and Frobenius | Identity chart over `𝔽₃`, mark 0; comparison with degree-two point | Mark residue maps `𝔽₃→𝔽₃` are identity, degree `1`, Frobenius exponent `1`; degree-two point has residue `𝔽₉` and admits no `𝔽₃`-section | Correct same-field convention; none |
| Repaired Corollary 3.4 synopsis | `X=Spec 𝔽₂` versus `X=ℙ¹_𝔽₂` | Dimensions `0` versus `1`; first has no dimension-one closed subscheme, second contains the curve `X` itself and all 3 rational points | First excluded, second included; none |
| Repaired dense-open clause | `ℙ²_𝔽₂`, mark `[0:0:1]`, `U=D(X₀)`, add `[1:0:1]` | `X₀` at the two points is `0,1`; any curve through both has nonempty intersection with `U`, hence dense intersection if integral | Pass; none |
| New zero-dimensional scope sentence | `Spec 𝔽₄` versus `Spec 𝔽₂` over `𝔽₂` | Geometric coordinate rings are respectively `𝔽̄₂×𝔽̄₂` and `𝔽̄₂`; only the latter is integral | Degree-one assertion correct; none |
| Repaired Theorem 3.3 synopsis | `n=m=1,X=ℙ¹_𝔽₂,F={0,∞},H=V(XY)` | `H∩X` is 2 reduced points, smooth of dimension `0=1−1`; it is not geometrically integral | Weaker README synopsis correct; none |
| Repaired connectedness caveat | Smooth quadric `xy=zw` minus `[0:0:0:1]`, cut by `z=0` | Two projective lines meet only at deleted point; section becomes `𝔸¹⊔𝔸¹`, smooth but with 2 components | Quasi-projectivity does not give connected section; none |
| New §2.4 Check and downstream dimension bound | `Y=Spec 𝔽₂`, `f=y=id`, `V=U=Y` | `C=𝔸¹`, `g=s_C`, `c=0`; `g≫f=s_C`, `c≫s_C=id=y`, good open `C`; `dim C=1`, `dim Y=0` | Curve morphism exists although curve subvariety does not; none |

The algebraic rows also test the zero polynomial, absent support/query, non-strict bounds and the total-function value `0⁰=1`. No polynomial-degree-of-zero convention is used in a headline. An empty curve cannot satisfy native geometric integrality, which includes nonemptiness. A square-zero thickening `Spec k[ε]/(ε²)` fails both integral-chart and smooth-at-mark hypotheses; a nontrivial purely inseparable zero-dimensional field extension fails étaleness and has no rational section. No group, DVR, analytic compactness or division-normalization statement occurs here, so those unrelated defect classes do not introduce extra hypotheses.

The two constructions determine their objects: generator values determine the ring map; a component containing the fixed mark, with its open subscheme structure and restricted projections, determines the marked component. The swapped-coordinate and wrong-branch controls reject plausible alternatives. All four headline conclusions involve these actual objects and maps; none is assumed as a hypothesis. The general theorem needs no properness or global finiteness of `Y`, because it shrinks inside a smooth affine neighbourhood.

### Pinned declarations and duplication by object

The checked library commits agree with `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. In addition to all entries in the source table, I opened the following pinned definitions and facts.

| File and line at the pin | Declaration or contract checked |
|---|---|
| `Mathlib/Algebra/MvPolynomial/Basic.lean:916,932`; `Mathlib/Algebra/Polynomial/Coeff.lean:128` | Both `constantCoeff` maps have real body coefficient zero; variables have zero origin value. |
| `Mathlib/AlgebraicGeometry/Properties.lean:239` | `IsIntegral` explicitly has `nonempty` and domain-of-sections fields. |
| `Mathlib/AlgebraicGeometry/Geometrically/Integral.lean:40` | `GeometricallyIntegral` quantifies over field base changes; it does not assert finite type. |
| `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:127,201` | `SmoothOfRelativeDimension` and `smoothOfRelativeDimension_comp`; relative dimensions add. |
| `Mathlib/AlgebraicGeometry/AffineSpace.lean:223,378` | `AffineSpace.SpecIso` and `AffineSpace.smoothOfRelativeDimension`; finite index type and dimension `Nat.card`. |
| `Mathlib/AlgebraicGeometry/Morphisms/Etale.lean:39,52,65,70,74,104` | `Etale`, affine ring-map property, composition, base change, open immersions and relative dimension zero. |
| `Mathlib/Topology/NoetherianSpace.lean:194`; `Mathlib/Topology/Connected/Basic.lean:606` | `TopologicalSpace.NoetherianSpace.finite_irreducibleComponents` and `isClosed_connectedComponent`; finite-component argument gives clopenness. |
| `TauCeti/AlgebraicGeometry/Morphisms/Smooth/GeometricallyIntegral.lean:37` | `TauCeti.AlgebraicGeometry.Smooth.geometricallyIntegral`, with smoothness and geometric connectedness hypotheses. |
| `TauCeti/AlgebraicGeometry/RationalPoint/Basic.lean:97,122` | `residueDegree_eq_one_of_section` and `residueFieldMap_bijective_of_section`; both require the section equation supplied here. |
| `TauCeti/AlgebraicGeometry/Morphisms/Smooth/EtaleCoordinates.lean:86,98` | Native affine étale coordinates, with `ULift (Fin n)` indexing; reindexing gives the polynomial-spectrum form. |
| `TauCeti/RingTheory/MvPolynomial/Kronecker.lean:75,96,109` | `Finsupp.exists_injOn_weight`, `MvPolynomial.coeff_aeval_X_pow_weight`, `MvPolynomial.injOn_aeval_X_pow`; arbitrary weights and the general coefficient mechanism are imported. |
| `Mathlib/RingTheory/NoetherNormalization.lean:80,93` | The variable change retains `X_i` and adds a power of `X₀`; its digit-separation argument is private and does not state the graph coefficient headline. |
| `Mathlib/Algebra/MvPolynomial/Equiv.lean:606`; `Mathlib/RingTheory/MvPolynomial/Basic.lean:169` | Near matches `finSuccEquiv` and `restrictDegree` are respectively an equivalence retaining coefficient variables and a bounded-support submodule, not these headlines. |

Searches used the objects and hypotheses (Kronecker substitution, separating weights, rational components, curves through prescribed points, dense opens and boundary polynomials), both pinned library trees, main, the indexed open heads via `roadmaps grep`, and available board-package READMEs. The supplied near-match list was treated as leads: a power-series coefficient identity, a Krull-dimension identity or a newer class name does not establish a curve-existence theorem. A separate indexed Lean search found no declaration of these five own names on main or at the open heads.

Cross-roadmap citations were resolved anew, rather than inherited from the previous review:

- `TauCetiRoadmap/SchemeAndStackFoundations/README.md:996,998` on main supplies §0.8 `etale_coordinates` and `rational_point_component`. Open PR #1656 retains these identifiers at lines 1224 and 1233, with an explicit resolution of the coordinate name to the pinned Tau Ceti theorems. The main citation remains valid; this package does not depend on the revision. The open head's scope owns general foundations, not the boundary-polynomial/marked-graph application.
- `TauCetiRoadmap/ArithmeticInterpolationDeterminants/README.md:426`, §0.3, defines the two-variable substitution and bounds only the first-variable degree; its general Kronecker supplier contract is at line 299. The package's arbitrary-variable bounded box is accurately distinguished at README lines 89–91. For example, `X₁¹⁰` with `B=2` is within the two-variable strip but outside this box.
- The base roadmap in PR #873, `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:2479`, states finite-extension descent of projective pencils. It does not promise a same-field curve through a specified mark; no base-roadmap prerequisite is consumed here.
- The indexed Kronecker hits in PR #1906, `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:88,727`, are imports for Wronskian/Roth arguments. They do not own this bounded graph geometry. The polynomial norm application in PR #1017, `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md:2557`, concerns projection of an existing curve and is a different object.
- `packages/ShimuraVarietiesPartII/README.md:1218`, §6.3, owns transport to specialized KR strata and consumes a Bertini contract; it does not build the arbitrary-field marked-chart construction. Its root-curve and rational-atlas inputs remain explicitly outside this package's scope.

The board-package index was read before making these ownership comparisons. The three remote-only board packages are not included in a global absence claim; see Not verifiable. The overlap facts report no competing change to this roadmap, no dropped cited identifier and no identifier defined only in an open revision. The closest head, SchemeAndStackFoundations #1656, was opened and its preservation of the consumed identifiers was verified. There is no identified second owner or reciprocal supplier handoff.

### Supplier order

Every Needs line and supplier contract was inspected. SchemeAndStackFoundations and the comparison with ArithmeticInterpolationDeterminants resolve on main; the base roadmap is contextual, not a supplier. The remaining inputs are pinned declarations or earlier local targets. No upward dependency, unowned prerequisite or undeclared supplier gap was found.

The requested mechanical command returned:

```text
depcheck: 236 roadmaps, 2134 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The citation resolver found no unresolved cross-roadmap citations or own Lean names. Its service-side external-library check was unavailable, so the external names were checked directly at the local pins as recorded above.

### Headline coverage, elaboration and padding

The four headlines listed at `packages/LefschetzPencilsAndVanishingCyclesPartII/README.md:34` are all stated, at matching generality:

| Headline | Declaration in `packages/LefschetzPencilsAndVanishingCyclesPartII/Suggested.lean` | Full-signature and padding result |
|---|---|---|
| §1.2 bounded coefficient preservation | `polynomialGraph_coeff`, line 55 | Arbitrary commutative ring, both support and query bounds, arbitrary natural base. `rfl`, `infer_instance`, and closing `simp` all fail. The general imported coefficient theorem still needs the bounded-weight injectivity proof. |
| §1.3 avoiding graph | `exists_avoiding_graph`, line 66 | Positive variable count, nonzero input, base chosen after input, exponent bound, nonzero image and actual closed immersion. All three probes fail. |
| §2.3 marked étale curve | `exists_marked_etale_curve`, line 81 | Field, integral affine chart, étale map, origin equation and dense open retained; maps, marks and geometric predicates are concrete. All three probes fail. |
| §2.4 same-field curve | `exists_same_field_curve`, line 105 | Actual section, neighbourhood containment, `[Smooth (V.ι ≫ f)]` and density on that neighbourhood retained. All three probes fail. |

`lake env lean` on the package file from the pinned content checkout exited 0, with exactly four warnings, all `declaration uses sorry`, at lines 55, 66, 81 and 105. No other warning or error occurred. The file has only `import Mathlib`, so no Tau Ceti object build was required.

A fresh scratch copy with `#check @name` for every one of the five declarations also exited 0. I compared the complete types to the README and supplied signature ledger: no binder was lost, including chart integrality/affineness/étaleness and neighbourhood smoothness. No signature needed changing.

A separate scratch copy replaced each of the four admitted proofs with `first | rfl | infer_instance | (simp; done)`. Elaboration failed at all four proof sites, with the coefficient equation or substantive geometric existence goal remaining. Reading the nearest exact-library candidates also rules out a bare imported-lemma proof: the coefficient theorem needs a new injectivity argument, while the other cited results give only ingredients of the existential conclusions. No theorem is a definition restatement, small computation, boundary case or README Check. There are no missing statable headlines and no substitutes for unstated geometry.

## Not verifiable

- The published journal layouts of Kisin–Zhou and Poonen were not compared. The package explicitly cites arXiv v2 and the Poonen author PDF; all requested locators in those versions were read. The manifest discloses the Kisin–Zhou version limitation.
- The remote-only board heads for AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory were not opened. Ownership checks cover main, indexed open roadmap heads and the available board files, not an assertion of absence in those three packages.

No required cited text was unreadable. No missing-reference request remains, and all Lean and dependency-check processes finished.

## Source issues

- **Gap** in KisinZhou2024 at Corollary 5.2.7, proof, printed page 53, and Proposition 5.3.5, proof, printed page 54: the source says Poonen's projective corollary supplies a marked curve in a smooth chart meeting the dense stratum; it should be justified for possibly nonprojective charts while preserving the mark and dense-open intersection; affects the proof.
- **Error** in Poonen2004 at Theorem 3.3, author-version printed page 10: the source says the ambient hypersurface is geometrically integral even in projective dimension one with several prescribed points; it should be restricted to ambient dimension at least two, or omit that integrality assertion in dimension one; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "46a0dff71432cf65187630ddf8797b7fceff7ea8", "job": "REV-PKG-LefschetzPencilsAndVanishingCyclesPartII~4", "model": "gpt-6-astra", "worker": "chris-32"} -->
