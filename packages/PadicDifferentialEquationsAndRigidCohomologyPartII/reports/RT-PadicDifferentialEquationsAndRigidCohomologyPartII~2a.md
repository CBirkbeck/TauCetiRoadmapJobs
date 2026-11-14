<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12977#issuecomment-6868748238 -->
Red team round 2 pass a (codex) of a7dd27e

Verdict: needs_changes

1. **F01** (P2) Equal coordinate derivations do not force equal coordinates

   Location: `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:417`, “equals `∂_(x_α)` only when `x = x_α`”.

   Claim: equality of the transported derivations forces equality of the coordinates.

   Witness: on `A¹`, put `x_α = y`, `x = y + p`. Their reductions agree and are étale. Then `dx/dy = 1` and `∂_x = ∂_y`, but `x ≠ y`.

   Exact repair: replace the quoted clause by “equals `∂_(x_α)` exactly when `dx/dx_α = 1`, in particular when `x = x_α`.” Add the Check: “For `x = x_α + p`, the coordinates differ but their derivations agree, since `dx/dx_α = 1`.”

   Retest: the translated coordinates give factor 1; at infinity `x = y⁻¹` still gives factor `−y²`. Earlier a/F01 is partly repaired: the chain rule is fixed, but this unnecessary converse is false.

2. **F02** (P2) The splitting matrix needs identity diagonal blocks

   Location: `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md:688`, “the unique upper-triangular solution `X`”.

   Claim: the displayed Frobenius equation uniquely determines an upper-triangular matrix.

   Witness: with `K = ℚ_p`, `σ = id`, `A = diag(1,p)`, both `I₂` and `2I₂` solve `A φ(X) = XA`. TSU line 795 imposes identity diagonal blocks.

   Exact repair: replace “the unique upper-triangular solution `X`” by “the unique block upper-unitriangular solution `X` (every diagonal block is the identity)”. Add the Check: “For `A = diag(1,p)`, the normalised solution is `I₂`; `2I₂` solves the equation but violates the diagonal normalisation.”

   Retest: for `X = [[1,u],[0,1]]`, the off-diagonal equation is `φ(u) = pu`; isometry forces `u = 0`. Thus the normalised solution is uniquely `I₂`, including when `p = 2`.

## Verified sound

Read all 2,793 README lines and all 80 Suggested.lean lines at the requested head. The numbered-target ledger below has 69 rows. The Lean declaration ledger has zero rows because the file contains no declarations. There are no section variables, instances, implicit universes, coercions, sorry'd data, padding theorems or elaborated signatures to audit. No Lean command was run; the explicit read-only/no-build instruction governs this pass.

### Earlier findings, checked individually

Here `a/Fxx` and `b/Fxx` identify the two first-round reviews. Locations are in `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md` unless another file is named. Each quotation is from the repaired package, not a source. No finding marked non-actionable is re-raised.

| Earlier finding | Status and repaired passage | Verification witness |
|---|---|---|
| a/F01, coordinate derivations | **Partly repaired**, lines 414–417: “`(dx/dx_α)⁻¹·∂_(x_α)`”. | At infinity this is `−y²∂_y`, giving `∂_x(y⁻¹)=1`. The added only-if assertion fails under `x=y+p`; see S01. |
| a/F02, three solution spaces | **Repaired**, MS.1.6: “Three solution spaces carry a growth filtration, and they are different objects”. | Unit solutions are `K` in `R_log`, but `E^τ` generically. For the logarithmic module the growth-0 and growth-1 dimensions are 1 and 2. OHK line 1207 and line 1262 support the distinction and comparison. |
| a/F03, coefficient scalar extension | **Repaired**, MS.6.5: “linear relative to the inclusion `L_1 ⊂ L_2`”. | For the unit, endomorphism spaces are `ℚ_3` and `ℚ_3(√5)`; extension sends `a` to `a`, but `√5·id` is not an image before tensoring the Hom space. |
| a/F04, inverse semilinear Frobenius | **Repaired**, Convention 6: “built from the linearisation `Φ_M : φ^*M → M`, which is invertible”. | For the unit and `φ(t)=t^q`, `t` is outside the semilinear image; the linearisation is multiplication and is invertible. A line of eigenvalue `a` has solution eigenvalue `a⁻¹`. |
| a/F05, generic unit-root correspondence | **Repaired**, supplier contract: “an equivalence between unit-root `(φ,∇)`-modules over `E_η` and continuous `K^σ`-representations of `Gal(k(C)^sep/k(C))`”. | Clause (b), the local decomposition-group compatibilities, and MS.2.3/MS.2.9 now use the function field. `k(x) ≠ k((x))`; the same gap slug occurs in the plan. This remains conditional on the declared supplier contract. |
| a/F06, coefficient Frobenius fibre | **Repaired**, MS.6.5: “the primitive idempotent of the factor of the given embedding”. | For a degree-two point with coefficients containing its unramified field, the raw unit fibre is `L×L`; the selected fibre is `L`. Traces are respectively 2 and 1. The trace formula uses the latter. |
| a/F07, affine kernel/image recognition | **Repaired**, MS.3.8: “a horizontal Frobenius whose linearisation is an isomorphism”. | Finite flat Frobenius from parent RD.0.42 and the completion comparison make the image's linearised Frobenius invertible. The finite module with horizontal invertible Frobenius is covered by RD.3.32. For `O(−1)⊕O`, projection to the top gives a rank-one image and rank-one kernel. |
| a/F08, global slope steps | **Repaired**, MS.5.2: “§RD.3.44, applied at each break, gives the slope filtration of `M` on all of `X`”. | RD.3.44 is the common-vertex theorem; RD.3.43 controls specialisation. For slopes `(0,1)` the common vertex is `(1,0)`. A subobject with generic minimum 1 has intersection with the ≤1 step of minimum 1 everywhere. |
| a/F09, weak hull Checks | **Repaired**, MS.5.1: “A construction returning the whole ambient `M` for every nonzero `N` gives rank 2 and fails this test.” | `N=L_1⊂L_0⊕L_1` has hull rank 1. Its minimum is `L_1`, whereas the ambient minimum is `L_0`. The ordinary irreducible rank-two example supplies the opposite control: a rank-one subobject can have hull rank 2. |
| a/F10, internal cycles | **Repaired**, MS.0.5: “That `B(M) ≠ 0` for `M ≠ 0` is proved in MS.0.7.” | Existence uses finite intersections/minimal dimension; splitting is later. The deleted forward assertion in MS.3.2 is absent. On the logarithmic module the kernel is rank 1 and the later nonzero quotient is rank 1. |
| b/F01, curve completion and intersections | **Repaired**, MS.0.1: “`C` is an open subscheme, with finite complement, of the nonsingular projective model”. | AlgebraicCurves 12B.0b supplies smoothness over perfect fields; STACKS lines 60, 99, 133, 142 supply extension, model and uniqueness. `A¹` has one boundary point, `G_m` two. MS.2.2 uses the pinned maximal-localisation theorem, not the former incorrect curve-layer citation. |
| b/F02, disconnected direct image | **Repaired**, MS.3.9: “a finite étale morphism `f : Y → X` of smooth connected `k`-schemes”. | The disconnected fold with source pieces of slopes 1 and 0 has a pushforward of slopes `(1,0)` and loses injectivity to its top. It is now excluded. For a connected degree-d cover a constant pure line pushes forward to rank d of the same slope. |
| b/F03, generic hull and induction | **Repaired**, MS.5.4: “The datum `M†` is part of the notion; no full faithfulness over the residue field `k(t)` is used.” | Flatness over the field `E†` preserves finite intersections. In MS.5.5, for `N=M=L_0⊕L_1`, `H′=L_0` and `H/H′=L_1`, with minimum `1>0`. The induction explicitly addresses nonisoclinic `N`. |
| b/F04, supplier drift | **Repaired**, MS.0.1 Needs: “RD.0.1, RD.0.9, RD.0.26, RD.0.36, RD.0.37”; MS.6.9 Needs includes “RD.6.59”. | Current parent headings supply respectively carriers/derivation and constant twists. RD.0.48/RD.5.2 now accompany local tensor injectivity. The former RD.5.29/RD.6.60 miscitations are absent; coefficient-linear Weil II is a separate gap. |
| b/F05, disconnected generic route | **Repaired**, MS.5 introduction: “MS.5.7 proves the curve theorem through the curve rank theorem and does not use them.” | MS.5.7 uses MS.4.2, dualising a surjection to an isoclinic target. Rank equality `rank Top(M^∨)=rank N` gives `N=S_min(M)`. It does not use the false compactness estimate of DAD Proposition 4.2.12. |
| b/F06, purity locator | **Repaired**, supplier contract: “the theorem states that every object is `ι`-mixed, its proof shows that each irreducible object is `ι`-pure”. | AE lines 539–552 and its use at line 752 distinguish the statement and proof. TSU line 1923 states the purity form. Absolute irreducibility with coefficient structure is retained. |
| b/F07, bounded-disc locator | **Repaired**, MS.1.9: “Tsuzuki, Proposition 3.24, p. 18”. | TSU lines 951–964 contain this result; on a constant line, solution eigenvalue `a⁻¹` dualises to quotient eigenvalue `a`, rank `1=1`. |
| b/F08, iterated eigenvectors | **Repaired**, MS.1.7: “`μ = v_π(c)/(d·v_π(q))`”. | For the logarithmic solution, `F(f)=qf`, `F²(f)=q²f`; slopes are `1/1=2/2=1`. OHK line 2149 defines the iterated-eigenvector convention. |
| b/F09, fixed-point action | **Repaired**, Mathlib supplier contract: “a monoid acting on a field by ring endomorphisms”. | `FixedPoints.subfield` uses `MulSemiringAction`, not an action by automorphisms. With imperfect residue field the Frobenius-image obstruction does not prevent the powers of σ from defining an ℕ-action. |

### Lean declaration and headline ledger

| File/section | Declarations | Variable/instance context | Computed/type check | Result |
|---|---:|---|---|---|
| `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/Suggested.lean`, whole file | 0 | None | One import, one module docstring, one empty namespace; zero declaration signatures | No signature or one-tactic padding test applies. |

The headline list is: opposite-slope rank bound; bounded splitting; local PBQ filtration and bounded graded formula; bounded-Robba and disc descent; growth/slope equality; curve intersection, gluing, PBQ filtration, transport and bounded quotient; local rank/graded recovery and reconstruction; curve rank, irreducibility, graded recovery and specified-map/minimal-slope reconstruction; hull reductions and generic/curve minimal slopes; étale affine-line reduction; docile Lefschetz full faithfulness; Lefschetz fibre reconstruction; coefficient-linear trace/duality and projected averaging; fibrewise isomorphism; finite-field existence and specified-map theorems. Each is named in the module docstring with missing carriers. The few native rings do not supply the compatible Frobenius, connection, slope filtration or isocrystal category. No headline is replaced by a free-variable algebraic proxy. A bare cyclic average would be the pinned averaging lemma and is correctly absent.

### Computed adversarial ledger

Notation: `L_s` is a constant line of normalised slope s; `D=L_1⊕L_0`; `J` is the logarithmic module with `∇e₂=e₁ dt/t`, Frobenius `diag(q⁻¹,1)`. “Pass” means the displayed instance agrees with the target, not that examples prove a theorem. Source and dependency checks supplement these tests. Hypotheses are those in the README: finite rank, mixed-characteristic complete discretely valued coefficients, perfect residue field except MS.0.3(1), and the stated smoothness, connectedness and Frobenius assumptions.

| Convention/definition | Instances and computed values | Result/change |
|---|---|---|
| Coefficients, q and slope denominator | `p=2,3`, `q=p^s`, `s≥1`: `v_π(q)=es>0`. Equal-characteristic K, zero ring and `q=1` fail the hypotheses. | No division-by-zero instance admitted. |
| Bounded/Robba/disc carriers | `Σuⁿ`: coefficients have norm 1. `Σp⁻ⁿuⁿ`: norms `pⁿ`, radius `p⁻¹`. `log(1+u)`: radius 1, coefficient norm `p^r` at `n=p^r`. | Three distinct membership outcomes. |
| Finite free versus projective | Free ranks 0 and 1 give `0` and `A`; the nontrivial order-two line on the punctured elliptic curve has local rank 1 but no global basis. | Global arguments use summands, not an assumed basis. |
| Normalisation and twists | For `q=p²`, eigenvalues `(1,p²)` give `(0,1)`; after squaring, `(1,p⁴)` still give `(0,1)`. For `π²=p`, eigenvalue π gives `1/2`. `O(1)` gives −1. | Positive rescaling agrees with parent raw valuation convention. |
| Zero and dual slopes | `Top(0)=S_min(0)=0`, but no numerical `λmax(0)`. For D, `Top(D)=L₁`; `S_min(D^∨)=L₋₁`; its dual is `L₁`. | No empty maximum or natural-subtraction convention used. |
| Solution Frobenius | A line of multiplier a has solution multiplier `a⁻¹`, product 1. For the unit, semilinear image misses t but linearisation maps `1⊗t` to t. | Correct inverse and contravariance. |
| Bounded quotient/kernel | Unit: `(Mᵇ,B(M))=(0,1)`; zero: `(0,0)`; J: `(Ee₁,Eē₂)` of ranks `(1,1)`. | Wrong bounded-subobject convention excluded. |
| PBQ and grade order | Zero is not PBQ. D has grades slopes `(1,0)` but nested maxima `(1,1)`. J is PBQ with bounded quotient slope 0. | Grade convention, nonzero convention both substantive. |
| Saturation | `D†→Top(D)` has kernel `L₀†` of rank 1. A pure line has kernel 0. | Original dagger carrier retained. |
| Coefficient fibres/weights | At a degree-two point, raw unit fibre `L×L` has dimension 2, selected factor L dimension 1. At `Spec F₃`, eigenvalue 2 has weight `2log₃2`. | Multiplicity and real-weight conventions distinguish wrong models. |
| Categories and dagger extendability | Unit Hom is the fixed field with Frobenius, K without Frobenius on a geometrically connected base. An ordinary irreducible rank-two object has a convergent unit-root line whose dagger hull has rank 2. | Full faithfulness is not essential surjectivity. |

| Target (including its bold definitions) | Instances; computed sides/values | Result/change |
|---|---|---|
| MS.0.1 completed generic/local fields | `A¹`: residue `k(x)`, local residue `k((x))`; boundaries for `A¹,G_m` have sizes 1,2. At infinity `∂_x(y⁻¹)=1`; for `x=y+p`, derivations equal although coordinates differ. | S01; other instances pass. |
| MS.0.2 generic/bounded solutions | Unit dimensions `(1,1)`, zero `(0,0)`, J `(dim Sol,dim Sol₀)=(2,1)`; line eigenvalues `(a,a⁻¹)`. | Pass. |
| MS.0.3 fixed coefficients | Witt algebraic-closure coefficients have fixed field `ℚ_p`; `ℚ_p(√p)` with identity has fixed field itself. Twisting eigenvalue √p by `1/√p` gives slope 0. | Pass; no unramified-only shortcut. |
| MS.0.4 opposite-slope bound | Identity line: `1≤1`, both slopes 0. Line into two-dimensional pure target: `1<2`. Projection `D†→L₀` has kernel rank 1 and fails the injection hypothesis. | Pass. |
| MS.0.5 bounded quotient | J gives `rank B=dim Sol₀=1`; unit gives `1=1`; zero gives `0=0`; `B(B(J))=B(J)`. | Pass; existence does not assume later nonvanishing. |
| MS.0.6 splitting | Split `L₁⊕L₀` has zero extension class. J has `a=−1,b=0`, gap 1, nonzero logarithmic class and unbounded solution norms `p^r`. | Pass: boundedness is needed at the gap-one boundary. |
| MS.0.7 bounded splitting | D is bounded and splits into ranks `(1,1)`; J is unbounded and nonsplit. For diagonal A, both `I₂,2I₂` solve the claimed unique equation. | S02; require identity diagonal blocks. |
| MS.0.8 bounded base change | Unit bounded rank `1→1`, J bounded rank `1→1`; zero `0→0`. `E_η→E_α` changes residue field but not these dimensions. | Pass. |
| MS.0.9 PBQ | Pure line: bounded quotient slope s, PBQ. D: bounded slopes `{0,1}`, not PBQ. J: bounded quotient slope 0, PBQ despite original slopes `{−1,0}`. | Pass. |
| MS.0.10 PBQ quotient criterion | Nonzero quotients of J have maximum 0; D has quotient `L₀` with maximum `0≠1`. Sums of same-slope lines keep that slope. | Pass in both directions; zero quotients excluded. |
| MS.0.11 unit-root tensor criterion | Tensoring D by unit rank r gives bounded slopes 0 and 1 each r times, still not PBQ; tensoring J gives pure bounded quotient rank r. For r=0 everything vanishes. | Pass; nonzero factor excludes vacuity. |
| MS.1.1 PBQ filtration | Zero length 0; line length 1; D length 2, grades `L₁,L₀`, decreasing `(1,0)`. | Pass. |
| MS.1.2 bounded graded formula | D: both sides `L₁⊕L₀`, rank 2. Replacing grades by nested terms gives `L₁⊕L₁`, wrong slopes. J: both sides unit rank 1. | Pass. |
| MS.1.3 PBQ base change | D remains length 2, grade ranks `(1,1)`; J remains length 1, bounded rank 1 after coefficient/local extension. | Pass. |
| MS.1.4 bounded-Robba descent | D descends as `L₁†⊂D†`; ranks `1<2`. A rank-one irreducible has one step of rank 1. | Pass. |
| MS.1.5 disc descent | CT11 rank-three example: first step spans `e₁,e₃`, ranks `0<2<3`; graded maxima `1>1/2`. Bounded quotient slopes `1,1/2` show it is not PBQ. Its dual is PBQ. | Pass, conditional on declared submodule comparison. |
| MS.1.6 three growth filtrations/solvability | Constants exact growth 0. J logarithmic solutions have dimensions 0 for λ<0, 1 for `0≤λ<1`, 2 for λ≥1. Generic unit solutions are one-dimensional over `E^τ`, not K. | Pass; wrong coefficient field and negative-growth polynomial model excluded. |
| MS.1.7 d-eigenvector bound | J's f₂: for d=1 and 2, `μ=1`; at λ=1, `μ=λ−λmax=1`. Unit at λ=0 gives `0=0`. | Pass. |
| MS.1.8 growth=slope | J: slope cutoff λ gives dimensions 0,1,2 on the same three intervals. Constant line slope s has solution slope −s; at λ=0 both sides dimension 1. | Pass; shift sign confirmed. |
| MS.1.9 bounded disc quotient | Constant line: solution `a⁻¹`, dual quotient a, ranks `1=1`. Constant D is bounded with solution slopes `−1,0`, but fails PBQ. | Pass. |
| MS.2.1 curve PBQ | Constant line true, zero false, D false; their bounded quotient ranks are 1,0,2 respectively. | Pass. |
| MS.2.2 intersections | `Σpⁿx^(pⁿ)` is completed but fails at infinity since `p⁻ⁿr^(−pⁿ)→∞`; `1/x` fails at the interior point 0 on `A¹`. Rank-one projective summands retain the same intersection identity. | Pass; both interior and boundary conditions tested. |
| MS.2.3 gluing | Generic constant line with its standard lattices reconstructs the same line, ranks `1=1`; zero reconstructs zero. A slope-1 line twists by `q⁻¹` to unit-root then back to slope 1. | Pass, conditional on the generic correspondence gap. |
| MS.2.4 PBQ sums/quotients | Two same-slope constant lines give a PBQ rank-two sum; slopes 1 and 0 give non-PBQ D. Nonzero quotient of a pure rank-two sum is pure rank 1 or 2. | Pass. |
| MS.2.5 curve PBQ filtration | D gives global ranks `0<1<2`; J gives `0<2`; zero gives no nonzero grade. Generic and local ranks agree. | Pass. |
| MS.2.6 finite étale transport | Identity cover preserves all ranks; degree-d connected cover sends a pure line to rank d of the same slope; pulling D back preserves `(1,0)`. | Pass. |
| MS.2.7 curve bounded quotient | D has bounded quotient rank 2 and graded-top ranks `1+1`; J has bounded quotient/top rank 1. | Pass. |
| MS.2.8 Legendre–Kummer extension | At p=5 the supplied H¹ slopes are `(0,2)` and the unit-root eigenspace has dimension 1; extension ranks `2+1=3`, PBQ grades have maxima `1>0`. | Pass conditional on the declared H¹/Ext contract; p=2,3 excluded only from this example. |
| MS.2.9 convergent PBQ | Pure line has one PBQ step; convergent D has two; zero has none. On `G_m`, the completed series of MS.2.2 is allowed without its failed boundary-overconvergence test. | Pass. |
| MS.3.1 local saturation | Pure line kernel 0; D kernel rank 1; J kernel `E†e₁` rank 1. | Pass. |
| MS.3.2 quasi-saturation | For `α∈E\E†`, `(a,b)↦a+αb` has dagger kernel 0 but E-kernel spanned by `(−α,1)`, rank 1. Spanning is surjectivity of the linearisation, not injectivity. | Pass. |
| MS.3.3 pure-target slope | Identity line target slope s equals maximum s. Projection D→L₀ fails injectivity and would otherwise give `1=0`. | Pass. |
| MS.3.4 saturated quotient | D's saturated quotient is `L₁†`, kernel `L₀†`, ranks `2−1=1`. J's is the unit quotient, ranks `2−1=1`. | Pass. |
| MS.3.5 quasi-saturated rank/irreducibility | Pure line: `rank Top=rank target=1`. D is reducible and has nonzero top kernel. J has irreducible top but fails saturation, so cannot satisfy the irreducibility criterion. | Pass. |
| MS.3.6 local graded recovery | D with identity bounded-quotient map recovers `L₁†⊕L₀†`, rank 2. J and unit have equal rank-one bounded quotients and equal saturated grades, despite original ranks 2 and 1. | Pass. |
| MS.3.7 local reconstruction | Pure lines with top map scalar c≠0 lift uniquely to scalar c; c=0 is not invertible. J versus unit shows why saturation is necessary. | Pass. |
| MS.3.8 saturation on varieties | Constant D on `A²`: dagger image of top projection rank 1, kernel rank 1; a pure line image rank 1, kernel 0. | Pass with repaired affine recognition. |
| MS.3.9 saturation transport | Connected degree-d cover of pure line: ranks `d=d` at the top. Disconnected slopes `(1,0)` push to rank 2 with top rank 1 and are excluded. | Pass. |
| MS.3.10 canonical saturation | D maps onto `L₁`, J onto unit; applying saturation twice gives rank 1 then 1. Zero stays zero. | Pass. |
| MS.4.1 PBQ kernel gluing | On `G_m`, J→unit has local/generic kernel `e₁`, rank 1 everywhere; identity line has kernel 0 everywhere. | Pass. |
| MS.4.2 curve rank theorem | Identity line: maximum and target slope s, ranks `1=1`. D→L₁ has nonzero dagger kernel and is excluded from the injective-sections hypothesis. | Pass. |
| MS.4.3 irreducibility criterion | Line: all three predicates true. D: PBQ/saturation false. J: PBQ true, top irreducible, saturation false, reducible rank 2. | Pass; necessary conjunction tested. |
| MS.4.4 curve graded recovery | Identity on `B_C(D)=L₁⊕L₀` recovers the identity on two saturated grades, total rank 2. J and unit recover a rank-one saturated grade. | Pass. |
| MS.4.5 extension trichotomy | J: a=−1<b=0, nonsplit/PBQ/not saturated. Split equal-slope lines: a=b=0, PBQ/saturated, top rank 2. Legendre extension: a=1>b=0, rank 3, nonsplit/not PBQ/saturated. | Pass; rank-two exception not overextended. |
| MS.4.6 specified curve map | On a line, h=2 lifts to 2, h=id to id. J and unit have equal tops but ranks `2≠1`; the saturated hypothesis excludes this pair. | Pass. |
| MS.4.7 isoclinic quotient form | D→L₁ has kernel slope 0<1; D→L₀ has kernel slope 1>0 and fails the hypothesis. | Pass. |
| MS.4.8 minimal-slope form | Dual of slope −1 is slope 1; a scalar c map dualises with value c and reverses direction, double dual returns the same c. | Pass. |
| MS.5.1 hull | Zero→hull 0; `L₁⊂D`→hull `L₁` rank 1; ordinary irreducible rank-two object's unit-root line→hull rank 2. | Pass. |
| MS.5.2 minimal-slope predicate | `N=L₁⊂D`: both sides `L₁`, ambient minimum `L₀` differs. N=0 gives `0=0`. Ordinary example gives rank-one minimum inside rank-two hull. | Pass. |
| MS.5.3 reductions | Inducing F² on `L₀⊕L₁` gives slopes `(0,0,1,1)`, minimum rank 2. Inducing N=0 gives rank 0 although induced unit ambient has rank 2. | Pass; ambient and subobject not confused. |
| MS.5.4 dual image | For N=0, Q†=0 and hull=0. For N=M, Q†=M†∨ and hull=M. For N=L₀⊂D, Q†=L₀∨, hull rank 1. | Pass; fixed dagger model retained. |
| MS.5.5 generic minimal slopes | D with N=M: H′=L₀, H/H′=L₁, minima `0<1`; S_min(H)=L₀. Zero gives two zeros. | Pass, conditional on generic embedding gap. |
| MS.5.6 affine-line reduction | Identity `A¹→A¹` degree 1. `y↦y^p−y` has derivative −1, degree p, hence étale, including p=2 and 3; infinity is wild. | Pass; no tame-prime restriction. |
| MS.5.7 curve minimal slopes | Proper curve: hull(N)=N. Ordinary irreducible rank-two example: N rank 1, hull rank 2, their first steps coincide at rank 1. | Pass. |
| MS.5.8 docile restriction | Geometrically connected unit: Hom dimensions `1=1`. `P²_(F_(p²))` and line over F_p: `2=2`. Dwork pullback to x=0: H⁰ jumps `0→1`, but docility fails. | Pass; geometric constants and wild negative control tested. |
| MS.6.1 Lefschetz condition | For X a curve, C=X has one marked residue-rational point over α. At the origin of A¹/F_p the constant-field degree-two covering has zero F_p-points above α, despite a rank-one irreducible pullback. | Pass; marked rational point part of datum. |
| MS.6.2 Lefschetz rank maps | Constant pure lines with h≠0: two rank maps `1→1`, both invertible. A disconnected X does not supply a counterexample: irreducible support and nonzero h force the same component. | Pass. |
| MS.6.3 fibre reconstruction | Identity/scalar nonzero maps on lines give equal one-dimensional fibres and the same Frobenius eigenvalue. Different eigenvalues a≠b admit no nonzero Frobenius map. | Pass. |
| MS.6.4 unit-root source | Unit→unit with c≠0 is uniquely c; map from slope 0 to slope 1 must be zero by Frobenius slope, violating the nonzero hypothesis. | Pass. |
| MS.6.5 coefficient categories/fibres | Raw degree-two unit fibre `L²`, projected L; ranks 2 versus 1. Extension Hom of unit `L₁→L₂` is inclusion, tensor gives `L₂≅L₂`. | Pass. |
| MS.6.6 coefficient trace/duality | On `Spec F_q`, line eigenvalue a gives trace `aⁿ` and L-function `(1−at)⁻¹` on both sides. On `A¹`, unit compact H² eigenvalue q gives `qⁿ` points, duality factor q. | Pass. |
| MS.6.7 projected average | m=1 gives f; m=2 invariant f gives `(f+f)/2=f`; anti-invariant f gives 0. Primitive idempotent trace 1 per slot gives total 2; unprojected unit gives 4. | Pass, also at residue characteristic 2 since coefficients have characteristic zero. |
| MS.6.8 endomorphism criterion | Identity curve on a simple line gives `End=L→L`, bijective; scalar 3/2 is invertible with inverse 2/3. | Pass. |
| MS.6.9 purity/Lefschetz inputs | At q=3, eigenvalue 2 gives real weight `2log₃2`. Root a of `T²−T−1` has conjugate `1−a`, absolute values about 1.618 and 0.618: forgotten K-object not pure, selected L-line pure. | Pass, conditional on declared coefficient/curve contracts. |
| MS.6.10 fibrewise isomorphism | M=N line: End eigenvalue 1, pole at `t=q^(−d)`. Distinct lines a≠b on a point have distinct `(1−at)⁻¹,(1−bt)⁻¹` and fail equal-fibre hypothesis. | Pass. |
| MS.6.11 specified endomorphism lift | If g′=2 and h=3, τ=`(1/2)·3=3/2`; g′τ=3. m=1 average preserves 3. | Pass. |
| MS.6.12 existence | For M=N line and h=1, both 1 and 2 are isomorphisms, but only 1 induces h. Existence has no uniqueness claim. | Pass. |
| MS.6.13 finite-field minimal slopes | For M=N the unit line, both ranks are 1, both maximal slopes 0, and h=2 gives an isomorphism with multiplier 2. Zero h is excluded; on curves MS.4.6 also identifies its prescribed lift. | Pass. |
| MS.6.14 specified finite-field map | Labelled lines: g′ sends e_N to 2e_M; h sends it to 3e_M. `h∘Top(g′)⁻¹` is 3/2 on e_M, inverse 2/3; recomposition gives 3e_M. | Pass; direction and added endomorphism hypothesis retained. |

These tests include ranks 0,1,2, empty filtrations, identity maps, split and nonsplit extensions, ramified coefficients, p=2 and p=3, disconnected bases, imperfect-residue exclusions and non-overconvergent sections. Nonreduced bases, non-quasi-separated spaces, the zero coefficient ring, equal-characteristic coefficients and q=1 are excluded by the stated carrier hypotheses; arbitrary noncompact groups, fans, ideals and zero-polynomial degrees occur in no target. Finite-group averaging can also be tested on the permutation representation of S₃: averaging `(1,0,0)` gives `(1/3,1/3,1/3)`, fixed by every permutation; the trivial group average is the identity.

### Suppliers, ownership, pins and build direction

Resolved 75 distinct explicit parent RD identifiers against the current open parent head, including the newly cited carrier, fixed-field, image-recognition and common-vertex inputs. Also checked the main-branch AlgebraicCurves Layer 12/12B.0b/12C and RigidAnalyticGeometry Layer 5 contracts. These are 77 distinct section/layer citation checks when each of those two external contracts is counted once; repeated occurrences and range interiors are not counted as new citations. The package uses the parent for ring, slope, full-faithfulness and cohomological foundations and adds bounded/PBQ/saturation/hull and reconstruction results, rather than rebuilding that foundation.

The main parent witnesses are `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md`: RD.0.39–RD.0.42 for controlled smooth lifting and finite flat Frobenius; RD.1.32/RD.1.35/RD.1.37 for slopes; RD.3.32 for the finite-module connection/Frobenius criterion; RD.3.43–RD.3.45 for specialisation and slope filtration; RD.5.8/RD.5.8c/RD.5.112 for full faithfulness and descent; RD.6.59 for constant twists. Its slope valuation has `v_π(π)=1`; Convention 4 explicitly divides by `v_π(q)` here. No numerical slope is transported without that conversion.

Native declarations were read at the pins, not inferred from their names:

| Native file and declaration | What was verified; limitation |
|---|---|
| `Mathlib/LinearAlgebra/Isomorphisms.lean:39`, `LinearMap.quotKerEquivRange` | Actual quotient/range equivalence. Does not descend a Frobenius or connection. |
| `Mathlib/RepresentationTheory/Invariants.lean:126`, `Representation.averageMap`; lines 131, 137, invariance and identity | Finite group and invertible cardinality are in scope. Does not construct the coefficient/projector transport. |
| `Mathlib/LinearAlgebra/Trace.lean:75`, `LinearMap.trace`; line 190, `trace_one` | Finite-free application returns rank; no infinite-dimensional trace assertion used here. |
| `Mathlib/NumberTheory/Padics/PadicNumbers.lean:881`, `Padic.norm_p_pow` | Prime-power norm gives the logarithm coefficient witness. |
| `Mathlib/FieldTheory/Fixed.lean:103`, `FixedPoints.subfield` | The native context is a monoid with `MulSemiringAction`, allowing nonsurjective field endomorphisms. |
| `Mathlib/RingTheory/Spectrum/Maximal/Localization.lean:38`, `MaximalSpectrum.iInf_localization_eq_bot` | Domain, field and fraction-ring assumptions; intersection is inside that fraction field. No completed intersection supplied. |
| `Mathlib/RingTheory/WittVector/Isocrystal.lean:112`, `WittVector.Isocrystal`; line 179, classification | The carrier bundles a module and a semilinear equivalence; it does not require finite dimension or a connection. Classification in this file is rank one. |
| `TauCeti/RingTheory/PowerSeries/Bounded.lean:63`, `PowerSeries.HasGaussNorm.subring`; line 81, radius-one membership | Real body uses bounded coefficient norms in an ultrametric normed ring and positive radius. |
| `TauCeti/RingTheory/PowerSeries/OpenDisc/Basic.lean:295`, `PowerSeries.OnOpenDisc.subring` | Real body uses restriction at each smaller radius. Bounded and open-disc rings are not identical. |
| `TauCeti/RingTheory/Dagger/WeakCompletion/Basic.lean:81`, `piAdicCompletion`; lines 190, 229, `weakCompletion`, `weakCompletion.of` | Existing completion/weak-completion rings and structure map; the Frobenius and differential-module structures are additional supplier work. |

Object searches at the pinned libraries found distribution-theoretic Amice transforms, not the Amice Laurent coefficient field with the structures needed here. The native Witt isocrystal is not the overconvergent isocrystal category on a curve. Searches by PBQ, dagger hull, bounded quotient, saturation, coefficient Frobenius fibres and minimal-slope reconstruction in main, board packages and supplied open heads found no competing owner of these targets. No Lean fully qualified name can collide because this file declares none.

The closest-roadmap comparison was read, not taken from vocabulary scores alone:

- `TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md`, Scope and ownership, expressly imports this roadmap's MS.4.6; its owned objects are Bessel/Kloosterman objects and their comparisons. It is a consumer, not a second minimal-slope owner.
- `TauCetiRoadmap/CrystallineCohomologyPartII/README.md`, Scope and ownership, owns Witt cohomology of singular varieties and slope-<1 cohomological comparison; it does not own PBQ filtrations or reconstruction from a slope constituent.
- `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md`, Scope and ownership, owns finite flat groups, Dieudonné and integral comparison theory. Its slopes and classification feed the earlier foundations; no bounded-solution reconstruction target duplicates this package.
- `TauCetiRoadmap/PadicHodgeTheory/README.md`, ownership and parent supplier contract, imports the analytic carriers and adds cyclotomic/period comparison work. Its filtered representations are different objects.
- Main `TauCetiRoadmap/AdicSpacesPartIV/README.md:55` owns dagger geometry and weak completions; these are already consumed through native rings and the parent. The package does not claim that foundational construction again.

The overlap inspection found no second copy, conflicting edit, dropped cited identifier or dependency on an open revision's numbering. Git's read-only diff-stat check showed changes only under this package folder. The README and Lean have no pull-request numbers, publication/process instructions, computational algorithms or forbidden Lean commands.

Dependency-check output, run with the supplied name, order, content and pull-request arguments:

```text
depcheck: 240 roadmaps, 2169 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Internal routes examined include MS.0.5→MS.0.7→MS.0.9–MS.1.1, MS.2.3→MS.2.5→MS.4.2, MS.3.8→MS.3.10, and MS.4.2→MS.5.7. Generic hull calculations MS.5.4–MS.5.6 are not premises of the curve theorem. Dense-open hull compatibility is justified by the parent's RD.5.112 used explicitly in MS.5.3, rather than by a full-faithfulness assertion over the generic field.

### Declared contracts

All nine slugs occur both in `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/design/plan.json` and under the README's exact supplier contracts, with the parent as supplier. None has supplier `none`. Their related clauses specify the structures and compatibilities needed for a single use, rather than asking for an unspecified theory.

| Slug | Precision/minimality check |
|---|---|
| extended-log-robba-growth | Adds logarithmic extension, injective multiplication, compatible growth and eigenvector growth to the existing extended Robba carrier; OHK lines 573–589 and 684–726 distinguish the new input. |
| dejong-disc-robba-submodules | Saturated submodules with finite free quotient; stronger than morphism full faithfulness RD.5.4. OHK lines 2374–2378 explicitly use the missing comparison. |
| unit-root-correspondence-perfect-base | Contains the coefficient hypothesis, generic function-field equivalence, local restriction and interior/boundary criteria. Existing local Amice and finite-field forms do not supply these compatibilities. |
| legendre-kummer-extension | Specifies p, base, character, H¹ dimension/slopes, eigenvalue and Ext eigenspace, with H⁰ vanishing. Existing Kummer construction is not this cohomology/extension calculation. |
| irreducible-iota-purity | Uses coefficient-linear eigenvalues and absolute coefficient irreducibility in all dimensions; does not claim purity after forgetting coefficients. Earlier curve-only purity does not cover it. |
| lefschetz-curves-irreducibility | Marks residue-rational points above a finite set and preserves absolute coefficient irreducibility. The ordinary restriction functor supplies neither existence nor irreducibility. |
| docile-curve-restriction | Gives the precise projective smooth/SNC/ample-transverse hypotheses and H⁰ comparison, used to deduce Hom full faithfulness. |
| coefficient-linear-weil-ii | Adds the L-linear weight bound to the earlier K-linear input; the forgotten K-object need not have the asserted weight. |
| dejong-generic-affine-line-comparison | Explicitly retains residue field `k(t)`, both embeddings and multiplication injectivity. The complete-residue-field hypothesis of RD.0.53 does not automatically cover it. |

Acceptance remains conditional on these contracts; their present absence from the supplier is not a finding.

### Sources, Checks and independence

Reviewed all 220 numbered-section Check bullets for compatibility with the statements; the ledger records discriminating numerical, dimension, slope, kernel and membership tests rather than repeating every bullet. Each definition-bearing numbered section has at least three Check bullets (MS.0.1: 6; MS.0.2: 6; MS.0.5: 4; MS.0.9: 4; MS.1.6: 6; MS.1.7: 3; MS.2.1: 3; MS.2.9: 5; MS.3.1: 3; MS.3.2: 3; MS.3.4: 3; MS.3.8: 4; MS.5.1: 3; MS.5.4: 4; MS.6.1: 3; MS.6.5: 6; MS.6.9: 4). MS.5.2's predicate has three further Checks. Identity or zero Checks are not counted as evidence against every wrong model: the split-slope, logarithmic, ordinary-irreducible, coefficient-projector and residue-rational-point controls provide the discrimination.

Verified the primary source-locator groups for all 69 numbered targets against their readable source texts, with the corrections and limitations below. Supplemental source witnesses include TSU lines 795–801 (normalised splitting), 951–964 (bounded-disc quotient), 1020–1031 (finite étale transport), 1302–1315 (saturation transport), 1520–1600 (coefficient objects), 1665–1775 (traces), 1830–1935 (finite-field reconstruction); OHK lines 1198–1281, 1925–1944, 1958–2068, 2149–2185, 2347–2399; DAD lines 425–505, 529–585, 738–775; AE lines 495–552 and 725–762; CT11 lines 994–1103; KED05 lines 22–32; KED04 lines 346–357; STACKS lines 60–65, 99–144. The cited arXiv versions, rather than an assumed published numbering, are identified by the README.

For reproducibility, the source-share count treats each paragraph or source-attributed bullet containing a numbered locator as one citation block per named source; a range remains one block, repeated mentions within that block are counted once, and the References list is excluded. This gives TSU 100, DAD 27, OHK 16, CT11 12, AE 5, STACKS 2, KED04 1, KED05 1, DEJONG98 1 and TSU98 1: 166 blocks. This is a block count, not a claim that each theorem number in a range is a separate citation.

The 69 primary target statement blocks were compared with their sources. Six additional prose comparisons were the MS.0.7 splitting proof (TSU line 795), MS.1.6 comparison proof (OHK line 1992), MS.2.2 intersection proof (TSU's Lemmas 3.1–3.2), MS.5.5 hull proof (DAD line 578), MS.6.10 pole argument (TSU's Proposition 7.15 proof), and the Suggested.lean missing-carrier/headline explanation (TSU lines 114–126 and the pinned APIs). No reproduced nonmathematical sentence, clause-by-clause rewrite, table or exercise collection was identified. Shared formulas, standard names and necessarily short hypotheses are not treated as copied expression.

TSU supplies its contents explicitly at lines 172–180. Comparison: MS.0 uses portions of TSU §§2–3 and Appendix A; MS.1 combines TSU §3 with OHK §§5,7,10,12; MS.2 uses TSU's curve PBQ material; MS.3 combines TSU §§4–5; MS.4 uses TSU §6; MS.5 inserts DAD hull/minimal-slope results and AE's docile restriction; MS.6 combines TSU §§6–7 and Appendix B with AE's purity/Lefschetz inputs. This is not a one-to-one run of source chapters. The ordering bounded quotient→PBQ→saturation/rank→curve reconstruction→finite-field reconstruction is forced by the explicit dependency lines cited above. The local/global splitting, inserted growth theorem, and generic hull branch give the layers their own mathematical scope.

## Not verifiable

- DEJONG98 Proposition 6.4 and TSU98 Theorems 4.2.6/7.2.3 remain settled **uncertified** sources. Their original full texts were not read; OHK/CT11 and TSU explain the particular uses. No new source request was made.
- No Lean elaboration was performed: forbidden by this read-only review, and there are zero named declarations to elaborate. Import/namespace/docstring form was inspected textually.
- The nine supplier contracts are planned inputs, not claims that the pinned libraries already prove them. The review checks their precision, ownership and consistency, not a future implementation.
- Published corrections to the source errors below were not established. Errata refer to the exact cached versions identified in the README.

## Source issues

- **Misprint** in TSU at §1.1, p. 1, line 19: the source says R is a valued field while also taking its maximal-ideal quotient; it should be a complete discrete valuation ring; affects nothing.
- **Error** in TSU at §2.1, p. 4, line 225: the source assigns the coefficient-supremum norm to the full Robba ring; it should use annular norms there and the supremum only on bounded carriers; affects a stated result.
- **Misprint** in TSU at Definition 2.2(2), p. 5, line 254: the source gives a disc lattice over point-indexed coefficients before choosing a point; it should use the stated K-disc coefficient ring; affects nothing.
- **Misprint** in TSU at §2.2, p. 6, line 299: the source makes the rational ordered group well ordered; it should impose well ordering on supports only; affects nothing.
- **Misprint** in TSU at proof of Proposition 2.9, p. 8, line 446: the source invokes Lemma 2.5(4); it should invoke Lemma 2.6(4); affects the proof.
- **Misprint** in TSU at proof of Proposition 2.10(2), p. 9, line 481: the source applies the displayed Frobenius equation to the last coordinate; it should first apply it to the first coordinate and propagate; affects the proof.
- **Misprint** in TSU at Proposition 2.11, p. 9, line 489: the source compares the length with an undefined index s; it should compare the two filtration lengths consistently; affects a stated result.
- **Misprint** in TSU at proof of Lemma 2.12, p. 9, line 504: the source calls result 2.9 a lemma; it should call it Proposition 2.9; affects nothing.
- **Misprint** in TSU at proof of Theorem 2.14, p. 10, line 538: the source writes a tensor power of the coefficient field for a trivialised module; it should write a direct sum with the module's rank; affects the proof.
- **Gap** in TSU at proof of Proposition 3.7, p. 14, line 729: the source infers boundedness of duals from solvability; it should prove boundedness separately since the logarithmic module is solvable and unbounded; affects the proof.
- **Error** in TSU at Theorem 3.12 and Definition 3.13, p. 15, line 808: the source requires a nonzero bounded quotient without excluding the zero module; it should assume the input module nonzero for that conclusion; affects a stated result.
- **Error** in TSU at Proposition 3.18, p. 16, line 872: the source allows the unit-root tensor factor to be zero; it should require it nonzero for the PBQ equivalence; affects a stated result.
- **Misprint** in TSU at proof of Theorem 3.19(1), p. 16, line 890: the source calls splitting result 3.10 a proposition; it should call it Theorem 3.10; affects nothing.
- **Misprint** in TSU at Theorem 3.19, pp. 16–17, lines 883–886: the source uses nested PBQ terms in decreasing-slope and bounded-sum formulas; it should use successive grades; affects a stated result.
- **Misprint** in TSU at Proposition 3.24, p. 18, line 958: the source equates a rank with a solution space; it should equate it with that space's dimension; affects a stated result.
- **Misprint** in TSU at Remark 3.25, p. 18, line 980: the source differentiates in a coordinate different from the one introduced; it should differentiate in x; affects nothing.
- **Misprint** in TSU at Lemma 3.31, p. 19, line 1020: the source places pullback and direct-image input objects on the opposite curves; it should place each on its functor's domain; affects a stated result.
- **Gap** in TSU at proof of Lemma 3.31, p. 19, lines 1029–1031: the source concludes an existing hypothesis and invokes the lemma being proved; it should establish pullback PBQ using bounded-quotient base change first; affects the proof.
- **Gap** in TSU at proof of Lemma 3.33, p. 20, line 1063: the source treats a rank-one generic constituent as unit-root; it should normalise fixed coefficients and twist its slope to zero before gluing; affects the proof.
- **Misprint** in TSU at §3.9, p. 21, line 1124: the source starts support-forgetting from ordinary cohomology; it should start from compact-support cohomology; affects nothing.
- **Gap** in TSU at proof of Proposition 6.1, p. 26, line 1354: the source uses the overconvergent quotient assertion on a convergent image; it should apply the local PBQ quotient criterion at the generic point; affects the proof.
- **Misprint** in TSU at Theorem 6.4, p. 27, line 1423: the source types the bounded-quotient map as overconvergent and mixes it with a generic fibre; it should be a convergent map between global convergent quotients; affects a stated result.
- **Misprint** in TSU at proof of Corollary 6.8, p. 29, line 1493: the source gives the intermediate isomorphism the source object again as target; it should target the restriction of M; affects the proof.
- **Gap** in TSU at Proposition 7.4, p. 30, line 1562: the source passes to an L-valued dual pairing without its coefficient projector; it should use the multiplication factor and the trace pairing of L/K; affects the proof.
- **Misprint** in TSU at Proposition 7.5, p. 30, line 1570: the source gives a scalar-extension transitivity formula with mismatched endpoints; it should compose extension from L₁ to L₂ with extension from L₂ to L₃; affects a stated result.
- **Error** in TSU at Lemma 7.11(1), p. 33, lines 1665–1666: the source does not isolate the coefficient Frobenius fibre before comparing traces; it should take the selected finite L-fibre, avoiding residue-degree multiplication; affects a stated result.
- **Misprint** in TSU at Lemma 7.11(3), p. 33, lines 1688–1690: the source takes a K-linear trace on the algebraic-closure coefficient object; it should take the trace on a finite L-model; affects a stated result.
- **Error** in TSU at proof of Lemma 7.11(3), p. 33, line 1706: the source splits L⊗_K L into copies of L without normality; it should split L⊗_K Q̄_p into algebraic-closure factors; affects the proof.
- **Misprint** in TSU at proof of Proposition 7.12, p. 34, line 1767: the source gives a constant twist only one scalar factor in the n-th Frobenius trace; it should use the n-th power; affects the proof.
- **Error** in TSU at Definition 7.14, p. 34, line 1815: the source restricts weights to integers; it should allow real weights for arbitrary constant Frobenius eigenvalues; affects a stated result.
- **Misprint** in TSU at proof of Proposition 7.15(2), p. 35, lines 1863–1866: the source composes the reconstructed map on an incompatible side; it should lift Top(g′)⁻¹h to an endomorphism and use g′τ; affects the proof.
- **Misprint** in TSU at proof of Lemma A.1(2), p. 38, line 2009: the source identifies valuation rings where only value groups agree; it should identify the value groups; affects the proof.
- **Gap** in TSU at proof of Lemma A.1(3), p. 38, line 2015: the source tensors identity with σ over the σⁿ-fixed field; it should justify compatibility on that field or use a compatible extended Frobenius action; affects the proof.
- **Misprint** in TSU at Appendix A.2, p. 39, line 2048: the source expresses a tube as an image under specialisation; it should take the inverse image; affects nothing.
- **Misprint** in DAD at proof of Lemma 4.1.4, p. 12, line 455: the source omits the first-slope operator on the induced hull; it should put that operator on each Frobenius-pullback hull summand; affects the proof.
- **Misprint** in DAD at Theorem 4.2.6(i), p. 14, line 557: the source shifts the reverse-grade index incorrectly; it should pair reverse grade i with S_(m+1−i)/S_(m−i); affects a stated result.
- **Misprint** in DAD at Theorem 4.2.6(ii), p. 14, line 558: the source gives the eigenbasis to the unextended module; it should give it to the algebraically extended module; affects a stated result.
- **Gap** in DAD at proof of Lemma 4.2.7, p. 15, line 572: the source imports complete-residue-field tensor injectivity for the generic pair; it should establish the k(t)-residue version separately; affects the proof.
- **Error** in DAD at proof of Proposition 4.2.12, p. 17, lines 649–655: the source asserts a positive norm lower bound and bounded torsion for the integral image; it should replace both estimates, contradicted by powers of pu in W⟨pu⟩; affects the proof.
- **Misprint** in OHK at proof of Lemma 1.13(i), p. 11, line 580: the source divides φ(t) by t inside the logarithm; it should divide by t^q as in the lemma's equation; affects the proof.
- **Misprint** in OHK at Proposition 5.9, p. 26, line 1322: the source identifies a bounded module with its growth-zero kernel; it should say that kernel is zero; affects a stated result.
- **Misprint** in OHK at proof of Lemma 8.2, p. 40, lines 2089–2091: the source gives the contracting Frobenius norm as greater than one on the wrong term; it should be less than one on the positive-slope module in an adapted norm; affects the proof.
- **Misprint** in CT11 at proof of Lemma 5.7, p. 57, line 1114: the source makes absolute values tend to negative infinity; it should make them tend to zero toward negative exponents; affects nothing.
- **Misprint** in KED04 at proof of Proposition 4.1, p. 9, line 349: the source merely places the product sum in the target ring; it should require that product sum to be zero; affects the proof.

Source independence: 75 passages compared with 8 readable sources; no nonmathematical wording reuse identified. Largest share TSU, 100 of 166 source-attributed locator blocks under the counting rule above; contents compared with TSU §1.5: independent mathematical grouping and dependency-forced order.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a7dd27ef91f47d714b0409407bf4b0a2cfa73c2e", "job": "RT-PadicDifferentialEquationsAndRigidCohomologyPartII~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
