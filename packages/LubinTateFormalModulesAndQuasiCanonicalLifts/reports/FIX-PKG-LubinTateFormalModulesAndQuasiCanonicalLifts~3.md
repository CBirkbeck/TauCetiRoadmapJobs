# Repair of LubinTateFormalModulesAndQuasiCanonicalLifts

The dispositions below concern the sixteen claims in REV-PKG-LubinTateFormalModulesAndQuasiCanonicalLifts~2. They are repairs, not an acceptance verdict. Changes are confined to this package's README, acceptance-test docstrings, Y95 manifest locator and this report. No Lean theorem signature, declaration name, layer number, metadata or plan entry changes.

## R01 (P1) — applied

Unrestricted actual-lattice dilation → action by the inverse unit part of `a = π_F^r u`; the full inverse acts on coherent homothety classes. Updated §5.4 and the §6.6 field-of-moduli argument. Added the `a = π_F`, `L = T` control. Evidence: Y95 line 175 restricts the formula to units; Y95 lines 162–166 identify uniformizer homotheties.

## R02 (P2) — applied

Second division-tower construction → import of RelativeFarguesFontaine §2.5, with primitive-root and Tate-coordinate comparisons in §§2.3–2.4. Updated summary, scope, contracts, dependencies and the primitive-root headline's docstring. Retained its distinct polynomial presentation. The supplied fields have degrees 2 and 6 over ℚ₃ and scalar action `ζ ↦ ζ^a`. The earlier owner's §2.5 explicitly supplies both Galois comparisons.

## R03 (P2) — applied

Second strict-base quadratic construction → import of GrossZagierAndArithmeticHeights §7.2. Layers 6–7 now distinguish finite-residue models, descent, higher-degree classification and coordinate comparisons. Updated §§6.1–6.2, 6.5–6.6, 7.1, scope, contracts, build description, dependencies and downstream claims. The comparison preserves the same twist, CM embedding and marking. At `q₀ = 2`, level one matches imported orbits of 3 or 2 elements.

## R04 (P2) — applied

Unqualified ownership of finite-residue representability → extension of EndoscopicTransferAndUnitaryTraceComparison §§10.2, 12.3 to arbitrary specified `B` and residue field. Updated scope, exact contracts, Layer 3 introduction, §3.6 and dependencies; removed the reverse downstream claim. At `B = O_r`, heights one and two give `O_r` and `O_r[[T]]` with the same marked pullbacks in both interfaces.

## R05 (P2) — applied

Owned convergence estimates and rigidity proofs → exact pinned inputs in supplier contracts and §§0.3, 3.4. Retained evaluated addition, deep inverse, embedding/trace comparisons and action-sensitive lifting torsors. Updated scope and layer descriptions. Native logarithm/exponential estimates include 2; rigidity uses underlying residual height `h[K:ℚ_p]`. The infinite-height counterexample remains excluded. Pin files and hypotheses are recorded below.

## R06 (P3) — applied

False absence of points and morphisms → the native point and morphism APIs, with their actual topology hypotheses. Updated §§0.1–0.2, contracts, scope and the Lean module docstring. The remaining obstacles are coefficient actions, torsion/Tate constructions and the marked formal-module deformation functor. Re-auditing all headlines with these carriers requires no additional simple statable headline; the detailed disposition appears below.

## R07 (P3) — applied

Uniform nonidentity Check → odd-prime coefficient `1/2` and a separate identity Check at 2 in §1.2. Comparing degree two gives `(p²−p)c = binom(p,2)−coeff₂(g)`: at 2 the right side is zero and `c = 0`; at odd primes it gives `c = 1/2`. The interpolation theorem retains its full prime range.

## R08 (P3) — applied

Strict integral automorphism → strict residual automorphism over 𝔽_p in §3.1. Its series is `X + X^p + X^(p+1)` and derivative is 1, while it fails the identity marking. The integral lift has derivative `1+p`; at 2 it is `3X+3X²+X³`. No strictness convention or deformation theorem changes.

## R09 (P3) — applied

False failure of coefficient base change → base-change compatibility for the same deformation problem. Section 3.1 now distinguishes that restriction from imposing a larger coefficient action. Over `O_F/(π²)` for `π² = 3`, both one-variable mapping sets have three images `{0,π,2π}`; preserving the height-one `O_F`-action instead gives one marked class.

## R10 (P3) — applied

Uniform `XY` nonintegrality witness → `XY = −2/p` for odd primes and `X²Y² = −5/2` at 2 in §4.2. For `ℓ = X+X²/2`, the latter coefficient is `−1/4+3/2−15/4 = −5/2`. The rational logarithm still fails to define an integral law at every prime.

## R11 (P3) — applied

Equality with a sparse logarithm → strict isomorphism to the specified Honda model in §4.3 and the Layer 4 example. Added the degree-four comparison at 2: `−1/14` for `f = 2X+X⁴`, `1/2` for the Honda logarithm, and `−4/7` for the strict coordinate change. Both sign conventions and the elliptic comparison remain unchanged.

## R12 (P3) — applied

Canonical modulus in the smaller `𝔪_B` → containment in `𝔪_(O_F)`, with valuation 1 for ramified quadratic extensions. Section 7.2 includes `π²=3`, coefficient `4π`, and Newton vertices `(1,2),(3,1),(9,0)`. A `B`-coordinate translation has valuation at least 2. Positive-level assertions remain unchanged. Evidence: Y95 line 361; its existing manifest key now explicitly locates this example.

## R13 (P2) — applied

Always-distinct uniformizer towers → equality for `u = 1`, inequality for `u ≠ 1`. Section 2.6 includes both controls. At `u = 1`, the twist is trivial and identical series admit the identity comparison. At `u ≠ 1`, `Art_K(π)` has values 1 and `u` on the two characters, including principal units. The comparison theorem still covers every unit.

## R14 (P3) — applied

Unqualified principal-unit expressions → `U(K,m)` at every depth, expanded only for `m ≥ 1`. Updated the restricted-image Check in §2.4, cyclotomic norm-group Check in §2.5 and Lean norm-group docstring. At zero, the image is `O_K^×` and the norm group is `K^×`. The native definition and zero-depth theorem are in UnitFiltration/Basic.lean, lines 104 and 145.

## R15 (P3) — applied

Implicit Tate-module API → explicit prose API bullets in §2.2 for transitions, level quotients, continuous scalar/Galois action, rational quotient and underlying ℤ_p-Tate comparison. Expanded the cyclotomic Check to include `ℤ/p^m` and `(ℚ_p/ℤ_p)(1)`. No Lean declaration was added: these facts specify the inverse limit and belong in the README.

## R16 (P3) — applied

Incorrect universal zero junk-value convention → polynomial evaluation and conditional power-series substitution laws. Updated the Mathlib contract and added a README Check: over ℤ, substitution of 1 into polynomial `X` yields 1 despite failure of `HasSubst`. Evidence: Mathlib/RingTheory/MvPowerSeries/Substitution.lean, line 229, `subst_coe`, with no `HasSubst` premise. Section 1.2 explicitly retains zero constant term; theorem signatures remain unchanged.

## Required checks and signature audit

- Final acceptance elaboration: `lake env lean` on `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/Suggested.lean`, from the supplied content checkout, exited **0**. Exactly five warnings, each “declaration uses sorry”, at lines 77, 91, 113, 129 and 151; no errors. All imported object files existed; no targeted build was needed.
- A scratch copy appended `#check @name` for all **seven actual declarations** and elaborated with exit **0**. The generated inventory's eighth name, “it”, is prose inside a docstring, not a declaration. A first scratch probe included that spurious name and failed; the corrected seven-declaration probe passed. No binder was lost and no signature changed.
- Both predicates retain `CommRing` and `IsLocalRing`. Both construction theorems retain domain, DVR, finite residue field, irreducible uniformizer and the actual residue cardinality. The primitive-root theorem retains characteristic zero, local-field structure, `m ≥ 1` and both primitivity conditions. The norm theorem retains characteristic zero, the unit representing the uniformizer, every `m ≥ 0` and the arithmetic Artin map. The elliptic theorem retains primality, the sign condition, unit discriminant and signed point count. These match README §§1.1–1.3, 2.3, 2.5 and 4.4.
- The final dependency command specified in the brief exited **0**, with exactly:

    depcheck: 236 roadmaps, 2138 edges, 0 problem(s)

  No `UPWARD`, `CYCLE` or `moved:` line occurred. The additional supplier edges point to existing earlier owners. No merge-order file was edited.
- `git diff --check` passed. There were no separately listed gate failures to repair. The acceptance file retains one `import Mathlib`, the same three used Tau Ceti imports, two real predicates and five headline theorems; it has no added API declarations, examples, data placeholders or option overrides.

## Headline expressibility and pinned evidence

The pins in the supplied content manifest are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Native files were opened at those pins. Library searches used the objects as well as the proposed names. The supplied near-match inventory was read: substitution identities, Weierstrass-divisor predicates, Witt-vector operations, simple-adjoin identities, cyclotomic inclusions, field norms, Hilbert 90 and formal étaleness do not prove the retained headlines. The newly available convergence and rigidity results do supply the removed proof obligations.

| Pinned object | Exact file and relevant hypotheses |
|---|---|
| Formal morphisms and isomorphisms | TauCeti/RingTheory/FormalGroup/Hom.lean, lines 137, 351: homomorphism series have constant zero and the formal addition identity; isomorphisms specify inverse homomorphisms. |
| General evaluated point carrier | TauCeti/RingTheory/FormalGroup/TopNilpotentPoint/Basic.lean, line 85: coordinate and `HasEval`; lines 104–110 require a complete Hausdorff uniform additive, topological, linearly topologized algebra for group operations. Commutativity is separate. |
| Evaluated homomorphism | TauCeti/RingTheory/FormalGroup/TopNilpotentPoint/Hom.lean, line 42: `TauCeti.FormalGroupHom.toTopNilpotentPointHom`, with those same target algebra hypotheses. Apply to integer rings with their adic topology. |
| Logarithm bound and summability | TauCeti/RingTheory/FormalGroup/Logarithm/Convergence.lean, lines 44, 58, 64, 71: closed-unit-ball coefficient map into a characteristic-zero normed field; completeness for summability in that field. |
| Exponential summability | TauCeti/RingTheory/FormalGroup/Exponential/Padic.lean, line 76: complete normed field over ℚ_p, bounded integral coefficients and strict disc inequality `‖x‖ < p^(−1/(p−1))`. |
| Finite-height uniqueness | TauCeti/RingTheory/FormalGroup/Rigidity.lean, lines 186, 229: maximal-ideal-adically Hausdorff local base, residue characteristic `p`, commutative source and target, finite residual source height and equal reductions. |
| Depth zero | TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean, lines 104, 145: units modulo the ideal power; at depth zero this gives valuation-ring units. |
| Substitution outside admissibility | Mathlib/RingTheory/MvPowerSeries/Substitution.lean, line 229: `subst_coe` gives polynomial evaluation without an admissibility hypothesis. |

| Headline | Disposition after using native points and morphisms |
|---|---|
| Lubin–Tate existence and interpolation | Kept with their two native coefficient predicates. These are substantial existence/uniqueness results over any DVR with finite residue field, not native formal-group axioms. |
| Primitive-root presentation | Kept as the explicit polynomial primitive-root degree and splitting statement; the shared field/scalar-action construction is imported. |
| Norm group / arithmetic reciprocity | Kept on actual polynomial roots and the pinned arithmetic Artin map. Its inverse-unit character counterpart needs the constructed coefficient action and scalar character. |
| Supersingular elliptic Lubin–Tate recognition | Kept on the native curve and its actual formal group; no arbitrary power-series stand-in. |
| Tate freeness and character isomorphism | Still need the formal `O_K`-action, its torsion system and its Tate module, not merely the evaluated point carrier. Encoding their construction would exceed a few simple definitions. |
| Marked finite-height representability | Morphisms exist, but an action-sensitive marked formal-module deformation functor and its coefficient-base comparison do not. No arbitrary `Prop` surrogate is used. |
| Honda integrality and type comparison | Still need the Frobenius-skew power-series operator ring and its action. |
| Quasi-canonical classification, moduli fields and valuations | Still need the formal-module lattice quotient, marking and marked moduli construction, with finite-residue descent. |
| BKO tower comparisons and trace square | Still need the specified quasi-canonical fields and their comparisons. General points do not construct these fields or their finite formal traces. |

## Source and ownership audit

All eight cited works retain one manifest key each. The seven supplied legal cached extractions were consulted; no source was fetched from another host. LT65 remains settled as **uncertified**, cited only by its supplied locators; it was neither requested again nor represented as text-certified. Y95's existing locator was extended to name its canonical Newton-polygon example, not given a second key. No missing-reference request is necessary.

| Mathematical evidence | Source locators consulted |
|---|---|
| Marked deformation universal property and uniqueness | LT66 lines 284–295, Theorem 3.1, pp.56–57; lines 331–341, Proposition 3.3 and complete-local specialization. |
| Coefficient action, coefficient algebra and universal deformation | VZ07 lines 2695–2711, Definition 1.1, pp.57–58; lines 2736–2740, Theorem 1.4, pp.58–59; lines 2859–2868, Lemma 2.6, p.61; lines 3014–3035, Theorem 3.8, p.65. This extraction contains the whole seminar volume; these locators refer to the VZ article. |
| Honda hypotheses and type operations | H70 lines 305–325, condition (F), pp.220–221; lines 380–407, Lemma 2.4; lines 431–448 and 482–505, Theorems 2–3; lines 668–708, Proposition 3.5 and proof, pp.229–230. Completeness is retained only where required. |
| Integral strict Honda comparison | H68 lines 196–207, interpolation; lines 220–247, integrality and strict comparison in Theorem 2, pp.204–205. Sparse logarithms specify models, not all coordinates. |
| Quadratic lifts, orders and orbit degrees | G86 lines 77–86, Proposition 2.1, p.322; lines 180–217, §5 and Proposition 5.3, pp.324–325; lines 218 onward for the Newton-polygon route. |
| Lattice marking and arithmetic action | Y95 lines 119–140 for Tate lattices, quotient and twist; lines 159–175 for quasi-canonical models, homothety and the unit action; lines 180–190 for the field and unmarked classification, pp.295–297. |
| Canonical modulus | Y95 lines 345–376, Theorem 2′ and canonical Newton polygon, pp.301–302; especially line 361. |
| BKO signs, indexing and application | BKO21 lines 554–557 for parameter `−p` and `a_p = 0`; lines 573–584 for the printed signed lemma, pp.955–956; §§5.0.1–5.0.2, pp.955–959 for the tower comparisons. The existing correction of the printed sign is preserved. |

Main-branch shapes were read in BordismFormalGroups, EllipticCurves and Completed/LocalFieldsRamification. Every supplier citation was resolved against main or the supplied open-head tooling: BordismFormalGroups §§F1, F5; EllipticCurves Layers 1 and 3; ModularCurves §§0B, 0C, 2B, 7C–7F; ClassFieldTheory Layers 6–8 and its former-§2.6-to-C.6 mapping; LocalFieldsRamification Layers 0–2; RamificationOfCompleteDiscretelyValuedFields §4a.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.1, R07.1.8, R07.1.12–R07.1.13, R07.1.20–R07.1.20a, R07.2.6–R07.2.8. The four initial unresolved-name leads are planned supplier declarations in that last roadmap, not missing promises of this package.

The three new exact contracts were read at the available heads: RelativeFarguesFontaine §2.5 constructs the fields and scalar-action comparisons; EndoscopicTransferAndUnitaryTraceComparison §§10.2, 12.3 constructs its strict marked deformation spaces; GrossZagierAndArithmeticHeights §7.2 expressly owns the completed-strict-base quadratic lifts, markings, orders, orbits and integral lifting filtrations. No change to those suppliers is needed, hence no supplier gap was added. The plan's empty `gaps` list is unchanged.

Object searches covered main, board packages and the provided open-head index using `roadmaps grep` and `roadmaps show`. The closest scopes inspected were AnticyclotomicLocalUnits, FiniteFlatGroupsAndIntegralPadicHodgeTheory, FunctionFieldArithmetic, EllipticCurveModularityWild3Adic and ComplexMultiplicationAndExplicitReciprocity. The first consumes these arithmetic comparisons; FunctionFieldArithmetic adds equal-characteristic local theory; the others do not own the new finite-residue descent and higher-degree lattice comparisons. Quadratic order/conductor and proper-lattice algebra remain targets here; the supplier states the lift construction and its marked orbit, not the general proper-lattice freeness assertion. The board's GrossZagierAndArithmeticHeightsPartII, ColemanPowerSeriesPartII, ChromaticHomotopyTheory and related matches use the existing formal-group or quadratic inputs rather than supply this extension. Ownership against open pull requests whose files were not supplied or available in that index was not checked, and no additional heads were sought.

The supplied overlaps inventory has no concurrent edit, dropped citation or revision-only identifier. No section identifier or Lean name is deleted or renamed. Downstream users retain the same arithmetic interfaces, now with explicit earlier suppliers; GrossZagierAndArithmeticHeights and EndoscopicTransferAndUnitaryTraceComparison are no longer described as consumers of their own inputs. This package owns its primitive-coordinate, action-sensitive, finite-residue and higher-degree refinements, not another construction of those suppliers' objects.

## Computed adversarial mathematics pass

Each row records an actual substitution or finite calculation. These calculations test truth and conventions separately from `sorry` elaboration. Standing finite-height, characteristic-zero, finite-residue, topology and marking hypotheses were compared with every relevant statement. A field or zero ring is not a DVR here; a finite residue field has `q ≥ 2`, so the junk value `q = 1` is excluded from all construction theorems. No denominator below is used at zero. General nonabelian Galois groups may act on points; only their scalar characters and abelian class-field quotients are asserted commutative.

| Statement | Instances tried | Computed values / two sides | Result | Change |
|---|---|---|---|---|
| Coefficient/tangent convention; §0.1 definition | Additive law over ℚ(i), conjugate action at `i` | Ring identities hold, but linear coefficient is `−i`, structural scalar `i` | Wrong action rejected | Native morphism carrier named |
| §0.1 formal action identities | Multiplicative ℤ_p-module, `a=0,1,2` | `[0]=0`, `[1]=X`, `[2]=2X+X²`; `[2](F(X,Y))=(1+X)²(1+Y)²−1=F([2]X,[2]Y)` | Pass | None |
| §0.1 height and scalar restriction | Multiplicative and additive laws over 𝔽₂; quadratic unramified LT | `[2]=X²` gives height 1; additive `[2]=0` gives infinity; `[2]` of quadratic LT starts in degree 4, giving underlying height 2 | Pass | None |
| Strict versus marked convention | Additive law over 𝔽₂, `X+X²`; identity | Both derivatives are 1; degree-two coefficients are 1 and 0 | Strict need not be identity | Preserved |
| Native point carrier and topology | Additive `pℤ_p`; zero ideal | Parameter `p` has powers tending to 0; zero ideal has exactly coordinate 0. A nonzero field has only ideals 0 and itself, so its nondiscrete valuation topology is not field-linear | Pass | Correct native carrier and topology |
| §0.2 addition/module action | Multiplicative law, `p=2`, `x=y=2`; `[2]` | `2+_F2=8`; `[2](2)=8`; `[2](0)=0` | Pass; differs from ordinary sum 4 | Native point evaluation used |
| §0.2 coefficient/point comparisons | Inclusion ℤ₂→O_L; zero parameter | `F(2,2)=8` before and after inclusion; zero maps to elliptic identity in both presentations | Pass | Morphism supplier updated |
| §0.3 logarithm bound | Multiplicative law, `p=2`, `n=0,1,2` | Coefficients `0,1,−1/2` have norms `0,1,2`; native bounds `0,1,2` | Pass | Imported bound; dyadic Check added |
| §0.3 evaluated addition | Multiplicative law at `x=y=4` in ℚ₂ | `x+_Fy=24`; `1+24=25=5·5`; `log25=2log5` | Pass | Evaluated comparison retained |
| §0.3 deep inverse and torsion | ℚ₂ depth 2; `ζ₂−1=−2`; additive law | `‖4‖=1/4<1/2`; `log(−1)=0` at nonzero parameter `−2`; additive log and exp both `X` | Pass; no global injectivity | Imported exponential estimate |
| §0.4 number-field model | ℚ_p; unramified quadratic at 3; dyadic approximation | ℚ completes to ℚ_p; `X²−2 mod3` has no root and gives degree 2; ℚ₂(i) is ramified whereas ℚ₂(√−3) is unramified | Pass; proximity hypothesis needed | None |
| §1.1 series predicate | ℤ₂, `π=2`, `q=2`: `2X+X²`, `2X`, `2X+X²+X³` | Constant/linear/reduction triples `(0,2,X²)`, `(0,2,0)`, `(0,2,X²+X³)` | Only first accepted | None |
| §1.1 polynomial predicate | Same examples | Degrees `2,1,3`, with leading coefficients 1 in first and third; only first has required degree/reduction | Pass | None |
| §1.2 interpolation at zero and identity | `a=0`; `a=1,f=g`; empty arity | `φ=0`, `φ=X`; arity zero gives zero series. Both intertwining sides are respectively `0`, `f`, `0` | Pass | None |
| §1.2 odd-prime coefficient | `p=3`, `φ=X+cX²+…` | Left degree two `3c+3`; right `9c`; equality gives `c=1/2`, with `3/2+3=9/2` | Pass | R07 |
| §1.2 dyadic coefficient | `p=2`, same pair | Both `f,g=2X+X²`; equation `2c+1=4c+1` gives `c=0` | Pass | R07 |
| §1.2 residue-cardinality hypothesis | Residue 𝔽₄, `q` incorrectly set to 2, `ā∉𝔽₂` | Intertwining degree-two residues would give `ā²=ā`, false | Wrong generalization rejected | None |
| §1.3 existence/recognition | Multiplicative law over ℤ₂ | `f(F)=(1+X)²(1+Y)²−1=F(fX,fY)` for `f=2X+X²` | Pass; actual formal-group carrier | None |
| §1.3 full characteristic range | 𝔽₂[[t]], additive law, `f=tX+X²`; characteristic zero additive law | In characteristic 2 both addition sides are `tX+tY+X²+Y²`; in characteristic zero the `XY` coefficient for nonlinear `X²` is 2 versus 0 | Pass; both characteristics retained | None |
| §1.3 action normalization | Standard `f=πX+X^q`, `a=π,0,1` | `[π]=f`, `[0]=0`, `[1]=X`; replacing `[π]` by `πX` loses coefficient 1 in degree `q` | Pass | None |
| §1.4 coordinate comparison | `π=2,q=2`, `f=2X+X²`, `g=2X+3X²` | `c(2−4)=2`, hence `c=−1=(1−2)⁻¹`; left/right degree-two coefficients both `−1` | Pass; strict comparison nonidentity | None |
| §1.4 identities and composition | `f=g=h`; unit scalar `u=3` | Strict comparison `X`; triple composite `X∘X=X`; scalar comparison has derivative 3 rather than 1 | Pass | None |
| §2.1 finite torsion rank | Multiplicative at 2, levels 0,1,2 | Quotient degrees `1,2,4`; `[2]` from level 2 onto level 1 has kernel size 2, and `2·2=4` | Pass | None |
| §2.1 finite-height boundary / underlying height | Additive special fibre; unramified quadratic LT at 2 | Additive `[π]=0` leaves infinitely many monomials; quadratic LT `[π]` degree 4 gives rank 4 and underlying p-height 2 | Pass | None |
| §2.2 inverse limit and API | Multiplicative at 3; levels 1,2 | Compatible roots satisfy `ζ₉³=ζ₃`; quotients have orders 3 and 9; transition kernel has order 3; inverse limit rank 1 | Pass | R15 API |
| §2.2 rational quotient and scalar comparison | Multiplicative at 3; quadratic coefficient field | `[1/3] mod ℤ₃` has order 3 in ℚ₃/ℤ₃ and is divisible; quadratic rank one over `O_K` gives rank 2 over ℤ₃ | Pass; distinguishes direct limit | R15 Check expanded |
| §2.3 primitive degree/splitting | ℚ₂, `f=2X+X²`, `m=1,2` | `t₁=−2`, degree `1`; `f(X)=−2` gives Eisenstein `X²+2X+2`, degree `2`; `t=0` has degree 1 and fails primitivity at level 2 | Pass | Primitive presentation retained |
| §2.3 supplied tower comparison | ℚ₃, multiplicative, levels 1,2 | Both fields ℚ₃(ζ₃), ℚ₃(ζ₉), degrees `2,6`; scalar 2 gives `ζ↦ζ²` in each interface | Pass | R02 |
| §2.4 character and basis independence | Cyclotomic character; basis multiplied by unit 2 over ℤ₃ | If `σv=cv`, then `σ(2v)=2cv=c(2v)`; character remains `c` | Pass | Comparison with supplied character |
| §2.4 restricted image | ℚ₃ levels 0,1,2 | Images `ℤ₃^×`, `1+3ℤ₃`, `1+9ℤ₃`; residue image has order 2 | Pass | R14 |
| §2.5 arithmetic inverse unit | ℚ₅, unit 2, level 1 | `2⁻¹ mod5=3`; Artin acts as `ζ₅↦ζ₅³`, not `ζ₅²`; uniformizer character value 1 | Pass | Preserved inverse convention |
| §2.5 norm-group zero level | `m=0`, arbitrary `x=π^r u` | Iterate is `X`, only root 0; all σ fix it; `π^ℤU(K,0)=K^×` | Pass | R14 docstring and Check |
| §2.5 positive norm levels | ℚ₃ at `m=1,2` | Norm subgroups `3^ℤ(1+3ℤ₃)`, `3^ℤ(1+9ℤ₃)` have indices 2 and 6, matching degrees | Pass | R14 expansion restricted |
| §2.6 identity uniformizer change | `u=1`, same series | `π′=π`, `η=1`, `χ′=χ`; `θ=id`, both fixed fields identical | Pass | R13 |
| §2.6 nontrivial uniformizer change | ℚ₂, `u=−1`; general `u≠1` | Artin at 2 gives values 1 and −1, already distinguished mod4; at `Art(π′)` product `u⁻¹u=1` | Pass | R13 |
| §2.6 unit restriction/twist sign | Unit `v`, `u=2` in ℤ₅^× | Both characters on Artin `v` equal `v⁻¹`; wrong inverse twist at `Art(π′)` gives `u⁻²=4 mod5`, rather than 1 | Pass | None |
| §3.1 marked deformation and functor | Height one; identity coefficient map; two composed maps | Parameter set is a singleton; identity pullback leaves law/action/marking equal; composing maps sends every coefficient by their composite | Pass | Supplier specialization distinguished |
| §3.1 strict residual automorphism | Multiplicative over 𝔽₂ and integral lift over ℤ₂ | Residual `X+X²+X³` has derivative 1 and differs from `X`; integral `3X+3X²+X³` has derivative 3 | Pass | R08 |
| §3.1 coefficient base change | `π²=3`, `R=O_F/(π²)` | `𝔪_R={0,π,2π}`; both mapping sets have cardinality 3; height-one `O_F`-action problem has cardinality 1 | Pass | R09 |
| §3.2 coefficient algebra | Law coefficient `XY`; `[π]` coefficient `X^q`, `q=4` | Weights `2−1=1` and `4−1=3`; images of polynomial generators lift independently across a surjective coefficient map | Pass | No new polynomial-ring owner |
| §3.3 coupled cocycle definition | `I=0`; square-zero `i`, coordinate `(1+i)X` | Zero space for `I=0`; inverse coordinate `(1−i)X` since `(1+i)(1−i)=1`; nonzero linear correction is a coboundary | Pass | None |
| §3.3 tangent constraint | Additive action `[a]=aX`; change by `iX` | Changed tangent is `a+i` rather than `a`; inadmissible unless `i=0` | Pass | None |
| §3.4 lifting torsor and uniqueness | Height one/two over 𝔽₂[ε]/ε² | Tangent dimensions 0 and 1; tangent lifting classes number 1 and 2 respectively; two marked comparisons have difference with reduction 0, hence difference 0 by native finite-height rigidity | Pass | R05 uniqueness imported |
| §3.4 infinite-height control | Additive module over 𝔽₂[ε]/ε² | `εX²` is nonzero and reduces to 0; `ε(aX)²=aεX²` for `a∈𝔽₂` | Finite-height hypothesis essential | Preserved |
| §3.5 tangent dimension/action sensitivity | Heights 1,2; unramified quadratic CM at 2 | Dimensions `0,1`; underlying ℤ₂-height 2 has dimension 1, retained `O_K`-height 1 has dimension 0 | Pass | None |
| §3.6 universal functor and supplier restriction | `B=O_r`, heights 1,2 | Rings `O_r`, `O_r[[T]]`; on dual numbers over residue field size `q^r`, mapping sets have sizes 1 and `q^r` | Pass | R04 |
| §3.6 arbitrary residue/coefficient base | `k=𝔽₂(t)`, `B=k`, height 2; `R=k[ε]/ε²` | Parameter images precisely `cε`, `c∈k`; one-dimensional tangent over `k`, no perfectness or Cohen-ring choice used in this calculation | Pass at the stated generality | General target retained |
| §3.7 elliptic deformation comparison | Supersingular height 2; marked formal base | Both supplied elliptic and formal rings have one variable; tangent dimensions `1=1`; at identity base point both markings are the identity | Pass | None |
| §3.7 formal versus global CM | Ordinary scalar integers inside formal coefficient ring | Formal action contains all p-adic scalars; a global integer scalar `[n]` completes to the same `[n]`; no claim makes every nonintegral p-adic scalar a global endomorphism | Pass; no global-CM inference | None |
| §4.1 skew multiplication/operator | Residue 𝔽₄, `a` Teichmüller, `ā²=ā+1` | `T⋆aX=σ(a)X²`, with `σ(a) mod2=ā+1≠ā`; applying twice gives coefficient `a` and degree 4 | Pass | None |
| §4.1 type sign | `p=2`, sparse `ℓ_−=X−X⁴/2+X¹⁶/4+…` | `(2+T²)⋆ℓ_−=2X`; wrong sign at degree 16 gives `2·(1/4)−(−1/2)=1∉2O` | Pass | Existing sign retained |
| §4.1 local finiteness and extensionality | Constant 0 versus constant 1 logarithm input | For zero constant, degree `d` receives only indices with `q^i≤d`; for constant 1 every `i` contributes to degree 0 | Nonzero constant correctly excluded | None |
| §4.2 functional equation and identity comparison | Multiplicative at 2; `u=v,C=1` | Degree-two coefficient of `2log(1+X)−log(1+X²)` is −2, in `2ℤ₂`; `v·1=1·u` and strict comparison `X` | Pass | None |
| §4.2 nonintegral rational logarithm | `ℓ=X+X²/p`, `p=3,2` | At 3, `XY=−2/3`, valuation −1; at 2, `XY=−1` but `X²Y²=−5/2`, valuation −1 | Pass | R10 |
| §4.2 completeness boundary | Multiplicative law over ℚ₂^ur and its completion | Same degree-two functional-equation coefficient −2 in both; formal type `2−T` exists in each; construction of normal-form coefficient limits requires the completion | Pass | Completeness distinction retained |
| §4.3 signed comparison | `p=2`, `s=±1` | `[sp]` has linear coefficient ±2 and reduction `X⁴`; types `2−T²`, `2+T²` give respectively `2X` on their sparse models | Pass | Model specified |
| §4.3 logarithm versus strict coordinate | `f=2X+X⁴` | `(2−16)c=1`, so `c=−1/14`; Honda coefficient `1/2`; comparison coefficient `−4/7`, integral of valuation 2 | Pass; logarithms unequal | R11 |
| §4.4 elliptic recognition at 2 | `y²+y=x³` | `Δ=−27`, residue unit; `#E(𝔽₂)=3`, `a₂=0`; `#E(𝔽₄)=9`, `a₄=−4`, parameter −2 | Pass | None |
| §4.4 both Hasse endpoints and ordinary control | `p=3`, signs ±1; ordinary height 1 | Endpoints give point counts `4,16` and parameters `3,−3`; ordinary `[3]` first nonzero residual degree 3 cannot equal `X⁹` | Pass | None |
| §5.1 lattice/kernel bijection | Rank 1, `L=T,p⁻¹T`; rank 2, one residual line | Quotient orders `1,p`; rank-two line order `q₀` versus whole torsion `q₀²`; unit scalar moves nonzero points while preserving their line | Pass | None |
| §5.2 quotient product and marking | Multiplicative at 2, kernel `{0,−2}` | Product `X·(X+2)/(−1)=−2X−X²`, reduction `X²`; target coordinate `−X` converts it to `[2]=2X+X²` | Pass; product need not be monic | None |
| §5.2 identity/nested quotient | Zero kernel; full successive p-kernels | Empty nonzero factors give product `X`; kernel orders `p` then `p` yield total order `p²` and Frobenius degree `p²` | Pass | None |
| §5.3 lattice homomorphisms | `T=ℤ₃`, target `3⁻¹T`; zero and unit maps | Allowed scalar `1/3` sends `T` bijectively to target; inverse 3; zero sends `T` into every target | Pass | None |
| §5.4 actual and class actions | `a=π_F`, `L=T` | Actual image `T`; quotient `π_F⁻¹T/T` has `q_F` elements; homothety classes nevertheless both `[T]` | Pass | R01 |
| §5.4 inverse action distinguishes classes | Unramified quadratic, `q₀=2`, unit class of order 3 | Exponents `+1` and `−1≡2 mod3` give different marked classes; both stabilize exactly at exponent 0 | Pass | Unit hypothesis explicit |
| §5.5 elliptic quotient comparison | Zero subgroup; supersingular `[2]` kernel; ordinary étale subgroup | Degrees `1` and `4` for elliptic identity and `[2]`; ordinary étale subgroup has nonzero special-fibre support and is outside the formal-kernel premise | Pass | None |
| §6.1 finite-residue canonical model and strict-base comparison | Quadratic ramified/unramified at 2; height one with CM | Restricted height `2` in each; CM deformation dimension `1−1=0`; strict-base canonical orbit size 1 | Pass | R03 |
| §6.2 quotient, twist and order | `L=T`; `L=π_F⁻¹T` | Kernel sizes `1,q_F`; Frobenius exponents `0,[k_F:k₀]`; both coherent lattice classes `[T]` and order `O_F` | Pass | R01/R03 comparisons explicit |
| §6.3 marked versus unmarked | `L₂=aL₁`, nontrivial class in unit orbit of order 3 | Underlying lifts have one isomorphism class; marked classes indexed by exponents 0,1,2 remain three distinct classes | Pass | Quadratic base-change comparison retained |
| §6.3 higher-degree order control | Cubic extension, `O=O₀+ϖ₀O_F` | `length(O_F/O)=2`, `length(O_F/ϖ₀O_F)=3≠4`; the Gorenstein equality fails, so trace-dual lattice cannot be classified merely by the order | Pass | Higher-degree target retained |
| §6.4 quadratic orders/conductors | Basis `(1,α)`, `s=0,1`; ramified case | Orders `O_F`, `O₀+ϖ₀O₀α`; conductor exponents `0,1` over `O_F`, valuations `0,2` in ramified normalization; `α∉O_1` | Pass | Order algebra distinct from supplied lift construction |
| §6.4 positive unit formula | `s=0,1` | `1+O_F` contains 0 at zero; at positive level residue of `a+ϖ₀b` is nonzero exactly when `a∈O₀^×`, giving the stated factorization | Pass | None |
| §6.5 supplied orbit comparison | `q₀=2`, `s=0,1,2` | Unramified orbit sizes `1,3,6`; ramified `1,2,4`; representative multiplier test sends `α·ϖ₀⁻¹` outside `L_1`; `ϖ₀O_s` is free on `ϖ₀` | Pass | R03 |
| §6.6 marked field/stabilizer | Canonical and level-one at `q₀=2` | Unit stabilizer indices `1,3,2` in canonical, unramified level-one, ramified level-one cases; adding `π_F^ℤ` preserves those indices | Pass | Actual action and strict-base comparison corrected |
| §7.1 finite-residue degree and total ramification | `q₀=2,s=1,2` | Unramified unit-count ratios `3/1=3`, `12/2=6`; ramified `2/1=2`, `8/2=4`; uniformizer lies in norm group so residue degree 1 | Pass | Imported orbits, finite-field descent |
| §7.2 positive modulus and coordinate independence | BKO `p=5,s=1,2`; ramified `q₀=2,s=1` | Valuations `1/6,1/30,1/2`; smaller than coordinate translation thresholds `1,1,2` respectively | Pass | None to positive-level theorem |
| §7.2 canonical modulus | `F=ℚ₃(π),π²=3` | Coefficients in `[π]²`: `X` coefficient 3 has valuation 2, `X³` coefficient `4π` has valuation 1, `X⁹` coefficient 1 has valuation 0; `𝔪_B` starts at valuation 2 | Pass | R12 |
| §7.3 primed field definition and invariance | BKO `p=5`, `s=0,1,2`; generator `ut` | Degrees `1,6,30`; replacing `t` by `ut` conjugates a stabilizer inside the abelian unit group, hence leaves the same subgroup | Pass | None |
| §7.4 infinite primed group | `p=5` | Tame quotient order `24/4=6`; logarithmic quotient has rank `2−1=1`; finite orders `6,30,150` | Pass | None |
| §7.5 ramified Honda control | `p=5`, `Ψ′_1/Φ` | Ramification degree 6; `v_(Ψ′_1)(−5)=6`; proper order index `[O:ℤ₅+5O]=5` | Pass; parameter not uniformizer in ramified base | None |
| §7.6 neighbouring lattices | Rank two over 𝔽₅; `s=0,1` | Lines number `(25−1)/(5−1)=6`; at zero all six are outward; at positive level one inward and five outward; order-25 congruence quotient acts through order 5 | Pass | None |
| §8.1 supplied character data with shifted levels | `p=5`, `n=0,1` | Division degrees `24,600`; tame order 24; principal quotient order 25; Artin Teichmüller value `ζ⁻¹` | Pass | Shared tower consumed through §2.4 |
| §8.2 plus/minus decomposition | `p=5`, integral basis `(1,α)` with `cα=−α` | Projectors send `5(a+bα)` to `5a`, `5bα`; intersection 0 since 2 is a unit; minus exponent norm `exp(Tr(5bα))=1` | Pass | None |
| §8.3 fixed fields and dihedral structure | `p=5`, `n=0,1,2` | Θ-degrees `1,25,625`, Ψ-degrees `1,5,25`; conjugation sends a minus generator to its inverse; a square fixed by inversion has `2z=0`, hence `z=0` | Pass; order-two quotient retained | None |
| §8.4 field rectangle and shifts | `p=5`, `s=1,2` | Primed degrees `6,30,150`; tame-fixed degrees `1,5,25`; compositum degrees `6·5/1=30`, `30·25/5=150` | Pass | None |
| §8.4 modulus versus torsion generator | `p=5`, first levels | Modulus field degree 6; primitive torsion field degree 24; unequal despite same residual formal module | Pass | None |
| §8.5 π/p generator comparison | Levels 0,1,2 | Signs `+1,−1,+1`; `[5](−v₁)=[−5]v₁=v₀`; adjacent-index trace correction is −1 | Pass | None |
| §8.5 formal inverse convention | Multiplicative law | Formal inverse `−X/(1+X)=−X+X²−…`; at `x=5` its value is `−5/6`, not −5 | Pass | Same formal sign used in traces |
| §9.1 trace definition and descent | Quadratic ℚ₃(√3)/ℚ₃; identity extension | Embedding sums have two terms interchanged by Galois; identity trace has one term `x` | Pass, including nonnormal embedding-sum definition | None |
| §9.1 additive/multiplicative/logarithm comparisons | `x=√3` in same quadratic extension | Additive trace 0; multiplicative formal trace −3 since `(1+√3)(1−√3)=−2`; logarithmic identity `log(−2)=log(1+√3)+log(1−√3)` | Pass | Trace input of §0.3 preserved |
| §9.1 transitivity / disjoint base change | Separable tower degrees 2,3 | Both sums contain each of the 6 embeddings once; after disjoint coefficient extension there are still 6 distinct extended embeddings | Pass | None |
| §9.2 tame trace and section | `p=5`, fixed point `x`; zero | Six summands give `[6]x`; section `[1/6]` gives `[6][1/6]x=x`; zero gives 0 | Pass; inverse is integral | None |
| §9.3 square and compatible systems | `p=5,s=0`; fixed base point and arbitrary source point | Both composites sum over 30 embeddings; on a fixed base point both are `[30]x`; adjacent sign labels multiply both routes by the same −1 | Pass; no existence of point systems inferred | None |

The arbitrary-residue deformation target remains a theorem to prove, not a claim that VZ07's separably closed proof already supplies the full extension. Its finite-jet descent route and action-sensitive tangent work remain explicit. The computed tests do not substitute for that proof or for the fresh independent review.
