# Review of HyperellipticCurves (pull request #1707 at deedd7d)

**Verdict:** needs changes

## R01 (P1) — The degree-one discriminant theorem asserts 1 = 4

**Location:** `TauCetiRoadmap/HyperellipticCurves/Suggested.lean:71`; `TauCetiRoadmap/HyperellipticCurves/README.md:532`.

**Claim:** The predecessor-degree formula permits n = 1.

**Witness:** Over ℚ, take n = 1 and G = 2. The universal linear discriminant evaluates to 1; leadingCoeff(G)² · discr(G) = 4. All hypotheses hold.

**Repair:** Require n ≥ 2 in this formula and its prose. Keep disc₁ = 1 as the separate convention. The three numerical identities were elaborated in a scratch Lean copy; the corrected hypothesis excludes precisely this instance.

## R02 (P1) — The function-field converse confuses regularity with geometric smoothness

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:595`.

**Claim:** Every hyperelliptic function field with a rational degree-two subfield is claimed to come from a smooth Model, over an arbitrary field.

**Witness:** For k = 𝔽₅(t), y² = x⁵ − t has squarefree right-hand side and genus 2 at the pin. Over k̄ its normalization has parameter x − t¹⁄⁵ = z², y = z⁵, hence genus 0.

**Repair:** Separate the general regular-proper-model dictionary from the smooth-model dictionary. Require the regular proper curve to be geometrically regular in the latter converse, and prove the perfect-field corollary. Retain the imperfect-field example as a negative control. TauCeti Hyperelliptic/Basic.lean:76 does not impose geometric regularity; Genus.lean:258 applies to this example.

## R03 (P1) — The infinity criterion fails in characteristic two

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:625`.

**Claim:** The degree of 4f + h² is asserted to detect a rational Weierstrass point at infinity without a characteristic hypothesis.

**Witness:** For y² + y = x⁵ over 𝔽₂, Δ = 1 and infinity is a rational fixed point, but 4f + h² = 1 has degree 0, not 5.

**Repair:** State the degree criterion when 2 ≠ 0. In characteristic two use the homogenized h and the infinity quadratic: h₃ = f₆ = 0 gives the unique fixed rational infinity point here. State the general characteristic-two criterion separately.

## R04 (P1) — Descent of a model need not have a split hyperelliptic quotient

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:718`.

**Claim:** Every automorphism cocycle is asserted to descend to a Model k g, rather than merely to a curve.

**Witness:** On y² = x⁸ + 1 over ℝ, a(x,y) = (−1/x,y/x⁴) satisfies a² = 1. The twisted quotient has real structure x ↦ −1/overline(x), with no fixed points.

**Repair:** Construct general twists as curves over their genus-zero quotient. Identify twists admitting Model k g with the cocycles whose image in H¹(k,PGL₂) is trivial. The displayed cocycle has nonsplit quotient and is excluded from that subset. ps1997 line 264 explicitly warns of nonsplit odd-genus examples.

## R05 (P1) — Rational automorphisms do not classify all twists

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:729`.

**Claim:** Aut(C) = ⟨ι⟩ is used to conclude that every twist is quadratic; convention 9 defines Aut(C) over k.

**Witness:** Over ℚ, y² = x⁵ − 1 has rational automorphism group C₂. The twist y² = x⁵ − 2 has 3 points over 𝔽₁₁ versus 16; their a₁ values are −9 and 4, not negatives.

**Repair:** Require the geometric automorphism group Aut(C over ksep) to equal C₂. The example has geometric group C₁₀, so no longer satisfies the premise. Keep its nonquadratic twist as a Check.

## R06 (P1) — The minimal Igusa vector is not a function of the geometric Igusa point

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:798`; `TauCetiRoadmap/HyperellipticCurves/README.md:360`.

**Claim:** The stored igusa_inv vector of a minimal rational model is claimed to depend only on its weighted projective point.

**Witness:** Take the good genus-two curve y² + y = x⁵ at 3 and its ramified quadratic twist. Their geometric Igusa points agree; their minimal discriminant valuations at 3 are 0 and 10.

**Repair:** Distinguish the projective invariant, a normalized geometric representative, and J(W_min), which is an invariant of the rational isomorphism class. Remove only the claimed geometric dependence of the latter. Scaling by a ramified quadratic twist multiplies J₁₀ by 3¹⁰, which sign normalization does not remove.

## R07 (P1) — The three absolute invariants lose the characteristic-two moduli parameter

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:815`; `TauCetiRoadmap/HyperellipticCurves/README.md:348`.

**Claim:** The G2 tuple is used to determine the Igusa point over k without excluding characteristic two.

**Witness:** In characteristic two, the distinct smooth moduli points (0:0:0:0:1) and (0:0:0:1:1) both give (g₁,g₂,g₃) = (0,0,0). liu1993 lines 489–498 gives this one-dimensional locus.

**Repair:** Keep the all-characteristic Igusa-point theorem, state the usual G2 classification away from characteristic two, and provide J₈-sensitive coordinates in characteristic two. The two points then remain distinguishable. The later statement specifically over ℚ̄ is not itself the problem.

## R08 (P1) — The proposed denominator-clearing transformation leaves the constant coefficient unchanged

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:887`.

**Claim:** The displayed diagonal transformation is the proof route for existence of an integral model.

**Witness:** For h = 0, f = x⁵ + π⁻¹, the proposed transformation gives f(πᵐx), whose constant coefficient remains π⁻¹ for every m.

**Repair:** Use M = 1, e = π⁻ᵐ, t = 0: then f′ = π²ᵐf and h′ = πᵐh. Choose m large enough for every coefficient. In this example m = 1 gives π²x⁵ + π, which is integral.

## R09 (P1) — Minimal genus-two equations are not unique up to integral coordinate change

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:912`.

**Claim:** Liu 1994 is cited for integral equivalence of any two discriminant-minimal genus-two equations.

**Witness:** Over ℤ₁₁, f=x(x−11²)(x−2·11²)(x−1)(x−2)(x−3) and f′=x(x−1)(x−2)(11²x−1)(11²x−2)(11²x−3) have minimal discriminant valuation 12 but inequivalent reduced branch configurations.

**Repair:** Delete uniqueness of minimal equations; retain uniqueness of their discriminant valuation and the supplier’s uniqueness of the minimal regular model. Here x=11²x′, y=11³y′ identifies the generic curves. DDMM Corollary 1.24 proves minimality (apply an integral Möbius change to f′ to make its leading coefficient a unit). The unique triple point moves from 0 to infinity. Integral equivalence would make {1,6,4} affine-equivalent to {0,1,2} over 𝔽₁₁; the former has no midpoint (candidate midpoints 9,8,5), while the latter does. liu1994models lines 40–47 concerns regular models, not equations.

## R10 (P1) — The elliptic obstruction exponent is off by a factor of two

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:909`; `TauCetiRoadmap/HyperellipticCurves/README.md:937`.

**Claim:** The exponent in Δ = Δmin · π^{2(2g+1)m} is identified at g = 1 with Tau Ceti’s obstructionExponentAt and its defect class.

**Witness:** At p = 5, y² = x³ − 5⁴x has discriminant valuation 12 and minimal valuation 0. The roadmap gives m = 12/6 = 2; the pinned obstructionExponentAt is 12/12 = 1.

**Repair:** State m = 2·obstructionExponentAt in genus one and that the resulting defect ideal is the square of the elliptic defect ideal. Do not identify their classes or infer an iff from squaring a class. Reformulate and justify the general obstruction theorem with its actual lattice/class data. TauCeti MinimalModel/ObstructionExponent.lean:85–96 fixes the factor 12.

## R11 (P1) — Liu type IV is not three lines

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:981`.

**Claim:** The list of seven stable genus-two fibre types describes type IV as three lines.

**Witness:** Two projective lines meeting transversely at three points have arithmetic genus 3−2+1 = 2. A triangle of three lines has genus 3−3+1 = 1. liu1993 line 191 specifies two projective lines.

**Repair:** Replace type IV by two smooth rational components meeting at three nodes. State types V–VII as smooth/smooth, smooth/nodal-rational, and nodal-rational/nodal-rational, meeting once, without the overlapping “smooth or not” description. Their genera are respectively 2, 2, 2.

## R12 (P1) — Bare cluster equivalence does not preserve arithmetic invariants

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1055`.

**Claim:** Every invariant in §§4.4–4.12 is claimed to be constant on equivalence classes of the abstract cluster picture.

**Witness:** Over ℚ₇, f=x⁵−x+1 and 7f have identical roots and depths. Their principal-cluster ν values are 0 and 1: the first has good reduction, the second fails the semistability criterion.

**Repair:** Keep geometric cluster equivalence separate from arithmetic transport. Prove invariance under actual K-coordinate changes with the transformed leading coefficient, Galois action and epsilon data; list exactly which purely geometric quantities descend to bare equivalence. The quadratic twist then has the same bare picture but different arithmetic data, as required by ddmm lines 433–439.

## R13 (P1) — Epsilon must be zero on clusters where it is not a sign character

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1041`; `TauCetiRoadmap/HyperellipticCurves/README.md:1113`.

**Claim:** Epsilon is assigned values in {±1} for every cluster, then subtracted at the root cluster in the representation formula.

**Witness:** For a good quintic with five singleton children, there are no even clusters. The stated toric formula becomes 0 − εℛ, of dimension −1, although the toric rank is 0.

**Repair:** Use the DDMM convention: epsilon is the zero representation on clusters that are neither even nor cotwins, and a sign character on the stabilizer in the other cases. State the transport between conjugate clusters and define gamma-tilde with its specified order. Then this quintic gives 0−0=0. See ddmm lines 214–226 and 293–310.

## R14 (P1) — Take Frobenius invariants after the monodromy cokernel

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1126`.

**Claim:** The rational component group is replaced by the cokernel of the map on Frobenius-invariant lattices.

**Witness:** For the pairing [2] on ℤ and Frobenius −1, (coker[2])^F = ℤ/2 has order 2. Both invariant lattices are zero, so the claimed cokernel has order 1.

**Repair:** Use c = #((coker u♯)^F). This gives 2 on the nonsplit even loop and 1 on the nonsplit odd loop. ddmm lines 889–895 and NeronModelsAndSemistableAbelianVarieties §4.5 take the cokernel first. State any invariant-lattice alternative with its cohomological correction.

## R15 (P1) — The bad Euler product omits the uber-even root relation

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1287`; `TauCetiRoadmap/HyperellipticCurves/README.md:1183`.

**Claim:** The toric Euler factor is the unrestricted product over the even non-uber-even clusters other than the root.

**Witness:** A split genus-two picture consisting of three twins has three such clusters and an uber-even root. The proposed product is (1−T)³; the lattice has rank 3−1=2 and determinant (1−T)².

**Repair:** Take the determinant on the actual homology lattice, including its relation when the root is uber-even. In this example divide the permutation determinant by 1−T. For a nontrivial orbit use the sign of Frob raised to the orbit length, not an undefined stabilizer character on Frob itself. This also restores deg L = 2g−n. Apply the same relation to the preliminary product formula for root numbers in §4.12: this split rank-two lattice has w=+1, not the three-loop product −1.

## R16 (P1) — The local-constancy claim drops the square leading-coefficient condition

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1205`.

**Claim:** Congruence of arbitrary f modulo π^{d+1} is said to preserve H¹ and all listed local invariants.

**Witness:** Over ℚ₇, let f₁=49(x⁵−x+1), f₂=147(x⁵−x+1). Both have d=0 and f₁≡f₂ modulo 7; their good reductions after square rescaling have 7 and 9 points, hence traces 1 and −1.

**Repair:** State DDMM Theorem 1.29 exactly using fᵢ=cᵢgᵢ, monic integral gᵢ, c₁/c₂ a square, and its normalized-polynomial congruence and semistability qualifications. Here 1/3 is not a square in ℚ₇, so the counterexample is excluded. See ddmm lines 451–459.

## R17 (P1) — The splitting-field identification needs genus at least two

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1228`; `TauCetiRoadmap/HyperellipticCurves/Suggested.lean:591`.

**Claim:** The splitting field of the branch form is called the Jacobian two-torsion field for a smooth Model of unrestricted genus.

**Witness:** The smooth genus-one quartic y²=x⁴+1 has Jacobian y²=x³−4x with all 2-torsion rational. Its branch splitting field is ℚ(ζ₈), of degree 4, whereas ℚ(J[2])=ℚ.

**Repair:** Require g ≥ 2 for faithfulness of the branch-permutation action on J[2]. For genus one quotient by the kernel on even subsets modulo complement (the Klein four kernel in S₄); for genus zero the Jacobian is trivial. Do not give the unrestricted splitting-field abbreviation the stronger mathematical meaning.

## R18 (P1) — The real-component Check has the wrong value

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1391`.

**Claim:** The positive sextic for 169.a.169.1 is said to give two real components.

**Witness:** After completing the square, y²=G(x)>0. In the infinity chart Y=y/x³, the positive affine sheet has limits Y=1 at +∞ and Y=−1 at −∞; the negative sheet closes the same circle.

**Repair:** Replace two components by one. Include the parity contrast: a positive quartic has two components because y/x² has the same sign at both ends; the positive sextic has one. This tests the projective gluing rather than just the affine double cover. Here G=(x³+2x²−x−1)²+4x²(x+1)² is strictly positive: its summands cannot vanish together.

## R19 (P1) — The finite-field automorphism Check confuses geometric and rational groups

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1522`.

**Claim:** The group of y²=x⁵−1 over 𝔽₇ is written as C₁₀ without a geometric qualifier.

**Witness:** The geometric C₁₀ consists of x↦ζ₅x and y↦±y. Since gcd(5,7−1)=1, only ζ₅=1 is rational over 𝔽₇: the rational group has order 2; over 𝔽₁₁ it has order 10.

**Repair:** Write Aut(C over 𝔽̄₇)=C₁₀ and Aut(C over 𝔽₇)=C₂. Keep the 𝔽₁₁ comparison and the singular characteristic-five negative control.

## R20 (P1) — The supplied push gate fails its build-warning rule

**Location:** `TauCetiRoadmap/HyperellipticCurves/Suggested.lean:1`.

**Claim:** The head does not satisfy the required passing gate.

**Witness:** The worker records build=1 FAIL. Re-running the targeted build succeeds, but emits the non-sorry warning about importing module-system Mathlib from this file. Direct Lean elaboration succeeds with sorry warnings.

**Repair:** Add the module header required by the pinned compiler and rerun the same gate until build=0. A scratch copy with module before import Mathlib elaborated with only sorry warnings. This is a gate failure, not a claimed elaboration error; severity follows the mandatory build-gate rule. Do not suppress it with set_option.

## R21 (P1) — The polynomial cluster constructor admits the empty root set

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1014`; `TauCetiRoadmap/HyperellipticCurves/Suggested.lean:509`.

**Claim:** A ClusterPicture is promised for every separable polynomial, although the structure requires its entire root set to be nonempty.

**Witness:** The constant polynomial 1 over ℚ₇ is separable and has zero roots. The constructor must put ∅ in clusters, while nonempty_of_mem then requires ∅.Nonempty, which is false.

**Repair:** Require positive degree (and hence a nonempty geometric root set) for this constructor, or define and handle an empty-picture case separately. The existing hyperelliptic applications have 2g+1 or 2g+2 roots; 1 is then rejected and a linear polynomial gives the valid one-singleton picture.

## R22 (P1) — The automorphism finiteness supplier excludes characteristic two

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:690`.

**Claim:** The all-characteristic finiteness target invokes Tau Ceti’s branch-permutation finiteness theorem without its characteristic restriction.

**Witness:** Hyperelliptic/Finite.lean:43 requires NeZero (2 : k). For y²+y=x⁵ over 𝔽̄₂ this hypothesis is false; its sole branch point cannot give the faithful reduced-group permutation argument.

**Repair:** Use the pinned theorem only away from characteristic two. Import StableReduction Layer3, README.md:483, for finiteness of the automorphism group of a stable geometric fibre in all characteristics, and transport through the smooth model. Smooth genus2 has canonical degree2>0 and is stable, so this covers the example without inventing a new finiteness theory. AlgebraicCurves Layer11 explicitly excludes the general positive-characteristic finiteness deliverable.

## R23 (P2) — Genus-one quartics are not all Weierstrass elliptic curves

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:282`; `TauCetiRoadmap/HyperellipticCurves/Suggested.lean:24`.

**Claim:** The general genus-one Model carrier is identified with Mathlib’s WeierstrassCurve.

**Witness:** Over ℝ, y²=−(x⁴+1) is smooth of genus one and has no real point, including at infinity. An elliptic Weierstrass curve has its real identity point.

**Repair:** Describe ofWeierstrass as the pointed monic-cubic subcase, exactly as §0.5’s actual definition does. Keep general genus-one double covers and their degree-two polarization separate. The negative quartic then remains in Model but outside the elliptic bridge.

## R24 (P2) — State the local-at-every-prime global headline in Lean

**Location:** `TauCetiRoadmap/HyperellipticCurves/Suggested.lean:469`; `TauCetiRoadmap/HyperellipticCurves/README.md:922`.

**Claim:** The Lean acceptance test minimizes one real absolute discriminant over ℚ; the README headline is simultaneous local minimality, including the general PID result. No equivalence theorem is stated.

**Witness:** Absolute minimization and primewise minimization are different predicates: for discriminant values {2,3}, the absolute minimum is 2, while the minimum 2-adic valuation is 0 at 3. The primewise signature elaborates at the pins.

**Repair:** Define global minimality by local minimality and state its existence, or retain the absolute-minimum definition and add the missing equivalence plus the general PID headline. A scratch signature with ∃ C, IsIntegral ℤ (C • W) ∧ ∀ p [Fact p.Prime], IsMinimal (PadicInt p) ((C • W).map (algebraMap ℚ (Padic p))) elaborated. Thus no missing-carrier excuse applies to the ℚ headline. The {2,3} test distinguishes the predicates; it is not asserted to be an orbit of actual models.

## R25 (P2) — Do not apply Liu’s minimal-extension tables over every DVR

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:977`; `TauCetiRoadmap/HyperellipticCurves/README.md:992`.

**Claim:** The arbitrary-residue-characteristic paragraph applies Liu 1994’s tables and a smallest stable-reduction extension with no additional base hypotheses.

**Witness:** liu1994models lines 40–41 assumes a henselian DVR with algebraically closed residue field of characteristic different from 2. Lines 54–59 use the stable extension in that setting. Those are not the hypotheses in this milestone.

**Repair:** Retain Liu 1993’s all-characteristic stable-type criterion. State the 1994 table theorem with its hypotheses, explain strict-henselian descent, and give separately owned, sourced targets for the additional cases promised here. Do not simply discard characteristic two from the library scope. The characteristic-two model y²+y=x⁵ stays in the all-characteristic layer but no longer instantiates the 1994 theorem.

## R26 (P2) — Meromorphic continuation is weaker than the cited Hasse–Weil and paramodular conjectures

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1339`.

**Claim:** The two knowls’ hypotheses are identified with SerreC9 J 1, and its meromorphic order is called the analytic rank.

**Witness:** PeriodsAndSpecialValues PS.1.8 permits meromorphic continuation; the Hasse–Weil knowl requires no poles in the critical strip, and the paramodular knowl asserts a modular-form realization. A meromorphic germ (s−1)⁻² has order −2.

**Repair:** Name the weaker imported predicate accurately. Add holomorphy at the center when interpreting its order as analytic rank; state modularity as a stronger sufficient hypothesis with the knowl’s endomorphism condition. Keep the BSD expression conditional and distinguish it from a theorem identifying Sha. The negative-order germ is excluded by holomorphy. Sources: lmfdb-hasse_weil_conjecture line 90; lmfdb-paramodular_conjecture line 90.

## R27 (P2) — Replace the algorithmic local-solvability deliverable with precise mathematics

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1301`.

**Claim:** The roadmap promises a decision procedure, a finite search and a computable set, and says an explicit exponent bound exists without stating it or assigning its proof.

**Witness:** Clause (c) supplies neither a value nor quantifiers for m, a source locator, or a supplier for the bound. Unlike clause (b), it cannot be instantiated even for the displayed 169 model at 2.

**Repair:** Remove the executable-search deliverable. State the exact mathematical local-lifting/congruence criterion, with both projective charts, its bound and hypotheses, and own or import that theorem by exact section. Keep the finite bad-place theorem from the Weil bound. For g=2 and p=17 its bound gives 18−4√17>1, so a smooth reduction point exists. An unspecified bounded-search promise is not a replacement.

## R28 (P2) — Expand the source-dependent formulas into actual target statements

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1043`; `TauCetiRoadmap/HyperellipticCurves/README.md:1115`; `TauCetiRoadmap/HyperellipticCurves/README.md:1143`; `TauCetiRoadmap/HyperellipticCurves/README.md:1257`.

**Claim:** Several targets leave essential objects or conclusions unstated: the depth identity ends in an ellipsis, gamma-tilde is undefined, U and V are unnamed sets, and local images merely have “the stated orders”.

**Witness:** For odd-degree descent over ℚ₂ with g=2 and #J(ℚ₂)[2]=1, the local image has order 2²·1=4, not 1. Nothing in §5.2 states which number the target must prove.

**Repair:** Write the complete depth identity, the order and domain of gamma-tilde, explicit U/V membership, and local image orders with archimedean cases and normalization of |2|. For the displayed nonarchimedean test the corrected formula |2|_K^{−g}·#J(K)[2] is 4; at an odd prime it is 1. Specify the integrality/leading-coefficient conditions on the unramified-outside-S statement. Give theorem and page locators, accounting for the DDMM v2 source issue below.

## R29 (P2) — Import point-count recovery from its existing owner

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1271`.

**Claim:** The genus-two coefficient-recovery theorem is planned anew, while the supplier already owns it for every genus.

**Witness:** FunctionFieldArithmetic §5.6, README.md:1888, states the Newton identities and reciprocal coefficients. At g=2 they give a₁=N₁−q−1 and 2a₂=N₂−q²−1+a₁², exactly the proposed target.

**Repair:** Cite FunctionFieldArithmetic §5.6 as supplier and delete this independent recovery target. Retain the equation-specific character-sum count and the Jacobian/reduction comparison, explaining that difference in scope. With q=3,N₁=6,N₂=8 the imported identities give a₁=2,a₂=1 and L(1)=19, as required.

## R30 (P3) — Delete acceptance-test padding and unused catalog definitions

**Location:** `TauCetiRoadmap/HyperellipticCurves/Suggested.lean:225`; `TauCetiRoadmap/HyperellipticCurves/Suggested.lean:230`; `TauCetiRoadmap/HyperellipticCurves/Suggested.lean:493`; `TauCetiRoadmap/HyperellipticCurves/Suggested.lean:503`.

**Claim:** The file includes a restatement of smoothness after Δ_ofWeierstrass, a defining-property API theorem, two example models, and an entire cluster API and two-torsion-field abbreviation used by no headline theorem.

**Witness:** The cluster block ends with no theorem at all; model3125 and model169 occur in no theorem signature. minimalDiscriminant_spec is explicitly the defining-property API. Smoothness equivalence reduces to the two IsUnit definitions and Δ_ofWeierstrass.

**Repair:** Delete these from Suggested.lean; keep the mathematics and Checks in the README. If a cluster headline is genuinely statable, retain only its needed definitions and state it. Do not replace padding with proofs in place. The scratch one-tactic pass tried all 29 admitted theorems; a separate unfolded-definition check confirmed the smoothness API reduction.

## R31 (P3) — Supply the required README shape, APIs and discriminating Checks

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:278`; `TauCetiRoadmap/HyperellipticCurves/README.md:546`; `TauCetiRoadmap/HyperellipticCurves/README.md:883`; `TauCetiRoadmap/HyperellipticCurves/README.md:1009`.

**Claim:** Most definitions have no three discriminating Checks or explicit API list; layers have no closing Examples and Dependencies. The required Conventions, Exact supplier contracts and How to read the build organization is absent.

**Witness:** §0.2 defines the model, base change and curve without a Checks list; §§3.1–3.5 likewise have none. §4.2 defines more than ten objects with no worked values. A single remote worked-suite section does not give each definition its required tests.

**Repair:** Restructure to the specified headings, put supplier ownership in the scope/contracts sections, and attach API facts and at least three discriminating Checks to every kept definition. Use the counterexamples in this report as negative controls. Add layer-ending Examples and Dependencies, and list each unstated headline and its missing carrier in the Lean module docstring.

## R32 (P3) — Replace broad or inaccurate source references with verified locators

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:300`; `TauCetiRoadmap/HyperellipticCurves/README.md:745`; `TauCetiRoadmap/HyperellipticCurves/README.md:1550`.

**Claim:** The sample contains claims with no theorem/page locator and claims pointing to text that does not contain the described formula; there is no sources.toml, and references assert local availability without a manifest.

**Witness:** Liu 1994 §1 equation (1) is y²=a₀x⁶+⋯+a₆, not the claimed normalized y²+Qy=P formula. Its §2.2 gives coefficient formulas for J-invariants, not the three displayed root sums.

**Repair:** Give exact theorem/section and printed-page locators for each theorem, distinguishing the versions read. For the root sums cite lmfdb-igusa_clebsch_invariants lines 96–103 or a verified primary locator; for the integral mixed equation cite the appropriate text. Add the source manifest through the authorized author workflow and remove “On disk” claims. The reviewer has not modified it.

## Verified sound

The complete README (1,613 lines) and Suggested.lean (595 lines) were read. The review covered the 45 numbered milestones, the 15 seeded source targets, all 29 admitted theorems, the 74 elaborated declaration signatures, the conventions and worked examples. This section records successful finite checks alongside counterexamples; a successful finite check is not a proof of the universal theorem. Uncertified source claims are separated below.

AlgebraicCurves README.md:101 leaves equation arithmetic open, so the scope is repairable. No copied passage, sorry-valued data, set_option, prohibited import, outside-folder change or forbidden file was found.

**Gate and build evidence.** The specified head matched and the outside-folder diff was empty. Supplied gate:

```text
gate HyperellipticCurves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=1 FAIL
```

The prescribed dependency check was run with the candidate order and main content; its exact output was:

```text
depcheck: 204 roadmaps, 1501 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. An unlisted new roadmap is not treated as an upward dependency. The targeted `lake build TauCetiRoadmap.HyperellipticCurves.Suggested` completed successfully, with the module-system warning described in the finding. Direct `lake env lean` on Suggested.lean completed with only admitted-proof warnings. The scratch file containing `#check @name` for all 74 declarations also elaborated: no silently dropped necessary section binder was found. The substantive scope discrepancy is the global-minimality predicate, not binder erasure. The numerical degree-one counterexample and a signature for simultaneous local minimality also elaborated. No Lean process was left running.

**Headlines and acceptance-test coverage.** The README’s end theorems are: integral discriminant and smoothness; discriminant covariance; the model/function-field dictionary and genus; classification of isomorphisms and automorphisms; twist descent; Igusa classification and field-of-moduli obstruction; local and global minimality and good reduction; stable reduction from invariants; cluster semistability/good reduction, special fibre, cohomology, Tamagawa numbers, conductor, deficiency and root numbers; Jacobian two-torsion and odd-degree descent; Euler factors and their L-function comparison; and the conditional BSD expression. Lean states the polynomial identities, forward genus bridge, orbit equivalence and local minimality. Global minimality uses the substitute identified above. Scheme/Jacobian/cohomological headlines are absent; the docstring must identify each missing carrier. Cluster definitions serve no headline. The omitted group law is an API target, not itself a deep headline.

The one-tactic scratch pass tried simp, rfl and infer_instance on all 29 admissions. It did not prove the deep results. Reading the definitions identifies the smoothness bridge as IsUnit reformulation after Δ_ofWeierstrass, and minimalDiscriminant_spec as defining-property API. A scratch generated structure-iff theorem makes the former close with one simp; this does not prove Δ_ofWeierstrass. Delete padding, rather than proving it in place.

**Computed adversarial table: all milestones.** Values are exact unless an inequality is explicitly shown. “Pass on instance” means precisely that. A reference to a finding means the target needs the repair there.

| Statement | Instances tried | Values computed on the two sides / defining tests | Result and change |
|---|---|---|---|
| 0.1 binary discriminant | n=0,1,2; constants 0,2; quadratic x²−1 | disc₀=disc₁=1; at n=1,G=2: 1 versus 4; disc₂(x²−1)=4; disc₂(2)=0 | Degree-one finding; n≥2 boundary otherwise consistent. |
| 0.2 Model and two charts | g=0, f=x,h=0; g=1, f=−x⁴−1; g=2, f=x⁵,h=1 | Degree bounds 1≤2, 4≤4, 5≤6; infinity quadratics T², T²+1, T² respectively; real infinity counts 1,0,1 | Carrier has genuinely different genus-one objects; elliptic-identification finding. |
| 0.3 integral discriminant/smoothness | y²=x³−x; y²+y=x⁵ over ℤ and 𝔽₂; y²=x⁵−t over 𝔽₅(t) | formDiscr₄(4x³−4x)=16384=2⁸·64; Δ(x⁵,1)=3125, reduction 1; last discriminant 0 despite squarefreeness | Smoothness must use separability. The real polynomial construction avoids 0/0 in characteristic two. |
| 0.4 forward genus and converse | smooth degree-5/6 curves; imperfect-field counterexample | (5−1)/2=(6−1)/2=2; extension degree 2. Imperfect example has arithmetic genus 2, geometric normalization genus 0 | Forward numerical checks pass; converse finding. |
| 0.5 Weierstrass bridge | E:y²=x³−x; E:y²+y=x³ | Model and native Δ are 64 and −27 respectively; mod 2 the latter equals 1 | Bridge on its stated monic-cubic subcase passes; not a classification of all quartics. |
| 0.6 involution and infinity | h=1; char 2 model x⁵; quintic/quartic branch counts | −(−y−1)−1=y; char 2 infinity fixed while deg G=0; smooth genus-two quintic has 5 finite+1 infinite branch point | Infinity-criterion finding. |
| 1.1 coordinate composition/scalars | x-translations 1 and dilation 2; λ=5,g=2 | Composition orders give 2x+1 versus 2x+2; scalar M=5I,e=125 gives e⁻²·5⁶=1 and e⁻¹·5³=1 | Reversed matrix order and scalar kernel are necessary and correct. |
| 1.2 transformation/simplification | e=1/2,M=1,g=2; elliptic u=2 | Δ′/Δ=2²⁰; at g=1, e=u³,det M=u² gives u⁻³⁶u²⁴=2⁻¹² | Both normalizations pass. |
| 1.3 orbit equivalence | x↦x+1; scalar 5I; genus-two versus genus-one | Both induce degree-1 maps on the quotient; scalar action is identity on x and y; fixed-point-free genus-one quartic has 0 rational marked points | Genus≥2 condition is essential; keep the pointed elliptic subcase separate. |
| 1.4 automorphism quotient | x⁵−1 over ℚ, 𝔽₇, 𝔽₁₁; x⁵−x | Rational orders 2,2,10; geometric order 10; x⁵−x map (−1/x,y/x³) squares to (x,−y), order 4 | Quotient correct; finite-field Check and characteristic-two supplier need repair. |
| 1.5 twists | real genus-3 cocycle; x⁵−1 versus x⁵−2 mod 11; quadratic multiplier d | Cocycle square identity, quotient real points 0; N₁=16,3 and a₁=4,−9; Δ twist factor d^{4g+2} | Two descent findings; polynomial quadratic-twist identity passes. |
| 2.1 root-sum invariants | monic sextic roots 0,1,2,3,4,5; scale by 4 | 15,10,60 products give I₂=3110,I₄=165952,I₆=159056000; I₂(4G)=49760=16·3110 | Independent root-sum/homogeneity check passes; locators need repair. |
| 2.2 integral J invariants | 169,249,3125 models | 169: J₂J₆−J₄²=−43−1089=−1132=4(−283); 249:864−784=80=4·20; 3125 mod2: (0,0,0,0,1) | Relation, normalization and characteristic-two nonvanishing pass. |
| 2.3 Igusa point/representatives | ramified quadratic twist at 3 | Projective point unchanged; minimal v₃(J₁₀)=0 versus 10 | Minimal-vector finding. |
| 2.4 geometric classification | x⁶+1 and y²+y=x⁶ | Δ ratio 2¹⁰; weighted point equal; N₁ over 𝔽₇=16 versus 4 | Consistent with geometric, not rational, classification; primary Igusa text unavailable. |
| 2.5 absolute invariants | 169; two characteristic-two points | 169 tuple (−1/169,33/169,43/169); char2 points with J₈=0 and 1 both map to (0,0,0) | Characteristic-two finding. |
| 2.6 automorphism strata | char 5 exceptional group; char 2 x⁵+αx³ | 2·#PGL₂(𝔽₅)=2·120=240; char2 G=1 for both generic α and 0, while listed orders are 32 and 160 | Orders test branch-data limitations; full characteristic-two recognition and Igusa table uncertified. |
| 2.7 Mestre obstruction | conics X²+Y²+Z²=0 and X²+Y²−Z²=0 over ℝ | First has 0 real projective points; second contains (1:0:1); corresponding quaternion obstruction nonsplit/split | Tests the actual conic obstruction; full coefficient construction not certified. |
| 3.1 integrality | f=x⁵+π⁻¹ | Proposed change leaves constant valuation −1; corrected vertical change gives valuations 2 and 1 for the two coefficients | Denominator-clearing finding. |
| 3.2 minimal existence | smooth good model; integral transform with extra Δ valuation 20 | Nonempty valuation set contains 0,20; minimum 0; at a good equation the divisibility witness for itself is r=1 | Well-order route valid after integral-existence repair. No equivalence of all genus-one polarized models inferred. |
| 3.3 minimal discriminant/uniqueness | two ℤ₁₁ equations in finding; elliptic scaling at 5 | Both genus-two valuations 12, Δ ratio 1; reduced midpoint test fails; elliptic exponents 2 versus 1 | Uniqueness and normalization findings. |
| 3.4 global models/defect | absolute versus primewise minimum; genus-one defect | For values {2,3}: abs min 2, min v₂=0; genus-one ideal exponents 2 versus 1 | Signature/obstruction findings; the abstract set is a predicate test, not a model orbit. |
| 3.5 good reduction | y²+y=x⁵ at 2,3,5 | Δ=3125 has valuations 0,0,5; first two smooth integral reductions; at 5 potential-good curve with fractional depth 1/4 | Unit-discriminant direction passes; good versus potentially good is distinguished. |
| 3.6 curve versus Jacobian reduction | genus-two compact-type fibre: two elliptic components joined once | Curve has 1 node; graph rank 1−2+1=0; Jacobian special fibre is a product of dimension 2 with toric rank 0 | Correct separation of curve and Jacobian good reduction. |
| 3.7 Liu types | triangle versus two lines with three intersections; 169 invariant valuations at 13 | Arithmetic genera 1 versus 2; v₁₃(J₂⁵/J₁₀)=−2, so not potentially good | Type-IV finding; all-DVR table hypothesis finding. |
| 4.1 cluster carrier | empty roots of 1; singleton; three close roots at 13 | Empty universe is forced both in clusters and nonempty, contradiction; singleton has one cluster; size-3 depth1/3 contributes (9−3)/3=2 to Δ | Empty-root finding; intended positive-degree examples pass. |
| 4.2 cluster quantities | root with 3 singleton children; twin; odd quintic root | Singleton partition sums 3=1+1+1; twin even=true, uber-even=false; epsilon at odd quintic root must be 0, not a one-dimensional character | Epsilon/unfinished-formula findings. |
| 4.3 equivalence | f and 7f over ℚ₇ | Equal root-distance matrix; v(c_f)=0,1 and ν=0,1; semistability true,false | Bare-equivalence finding. |
| 4.4 semistability | distinct integral roots; one twin depth1/2; principal triple depth1/3 | Good root: e=1,d=0,ν=0; twin excluded from principal tests; triple fails d∈ℤ | Criterion distinguishes good, nodal semistable and potentially semistable examples. |
| 4.5 potential good/toric rank | no proper subclusters; one twin; three twins; one triple | Toric ranks 0,1,3−1=2,0; triple gives potentially-good curve=false, potentially-good Jacobian=true | Matches DDMM 1.8 under its local hypotheses. |
| 4.6 graph/components | good quintic; three twins of depth1 | Good graph: one genus-2 vertex, b₁=0; three-twin graph: b₁=2, m=6+1−2=5 including intervening components | Rank and component formula pass on these configurations. |
| 4.7 cohomology | good quintic; totally toric genus-two picture | Correct ranks: Ht=0,Hab=4 and Ht=2,Hab=0; total 4 in both; incorrect epsilon gives toric rank −1 in first | Epsilon correction mandatory; gamma definition must be explicit. |
| 4.8 Tamagawa | [2],F=−1; [3],F=−1; zero-rank lattice | Correct rational component orders 2,1,1; invariant-lattice cokernel gives 1 for the first | Invariants/cokernel finding. |
| 4.9 conductors | good, one loop, three-twin semistable pictures; tame degree-2 root extension | n=0,1,2; tame wild contribution vDisc−e+f=1−2+1=0 | Semistable/wild normalization passes; full U,V formula requires source correction and explicit definitions. |
| 4.10 cluster discriminant | four README pictures | 169: (9−3)/3=2; 249: (4−2)/2=1; 3125: (25−5)/4=5; 336:10−(36−16−2)/2=1 | All four valuation computations match listed Δ. |
| 4.11 deficiency/parity | real pointless genus2; same with a real point; genus3 | Minimal available divisor degrees 2 versus1; required degree g−1 is1,1,2; deficient true,false,false; finite-Sha parity predictions square/2·square | Divisor statement passes; do not substitute “divisor class” for actual rational divisor. |
| 4.12 root number | split loop, nonsplit loop, split three-twin lattice | +1 eigenspace dimensions 1,0,2; w=−1,+1,+1. Uncorrected three-loop product gives −1 | Use the precise homology formula, also when repairing the Euler-product relation. |
| 4.13 local constancy | 49f and147f over ℚ₇ | Congruent mod7 and d=0; counts7,9, hence traces1,−1 | Leading-square/normalization finding. |
| 5.1 two-torsion | orbit sizes (6),(1,2,3),(1,1,1,1,2); quartic x⁴+1 | Even-subset quotient ranks 0,1,3; quartic Jacobian torsion field degree1 versus branch splitting degree4 | Genus-two ranks pass; unrestricted field-identification finding. |
| 5.2 descent | g=2, #J(K)[2]=1 over ℚ₂/ℚ₃; Selmer dimension3,torsion dimension1 | Local image sizes4 and1; rank bound3−1=2; x−T sends identity to squareclass1 | Supplies explicit orders missing in target; primary Schaefer text uncertified. |
| 5.3 good Euler factors | 169 at3 and5 | (N₁,N₂)=(6,8),(6,12); (a₁,a₂)=(2,1),(0,−7); L(1)=19 in both | Equation counts pass; coefficient recovery belongs to FunctionFieldArithmetic §5.6. |
| 5.4 bad Euler factors | three split twins | Product degree3 versus required4−2=2; corrected polynomial(1−T)² | Root-relation finding. |
| 5.5 local solvability | real negative/positive sextic; good p=17,g=2 | Real point counts empty/nonempty; 18−4√17>1; no explicit claimed general search exponent to evaluate | Mathematical good-prime criterion passes; algorithmic/unspecified-bound finding. |
| 5.6 conductor bounds | g=2; p=2,3,5,7 | r=floor(4/(p−1))=4,2,1,0; λ₂(4)=4, λ₃(2)=0, λ₅(1)=0; bounds20,10,9,4 | Listed rational-prime bounds agree; underlying general formula needs r and λ definitions. |
| 5.7 periods and leading terms | swap/sign change of Néron differential basis; meromorphic germ | det basis change=−1 gives absolute density multiplier1; (s−1)⁻² has order−2 versus nonnegative analytic rank | Absolute period normalization passes; continuation-strength finding. |

**Additional computation coverage.** All 29 admitted signatures received finite-instance checks; their separate declaration ledger is omitted here. The definitions of universalΔ and Δ use coefficientwise integer division followed by evaluation, without cancellation by 2 in characteristic two. Seven discriminants and I₂ values and 30 pairs of finite-field point counts (60 counts total) were recomputed independently; representative values appear in the adversarial table above. These tests do not establish stored ranks or complete bad-prime tables.

**Pinned declarations and ownership.** Object searches covered the pins, main, board packages and open work through `roadmaps grep`/`roadmaps show`: models, branch actions, substitutions, invariants, clusters, minimality, monodromy, descent, periods and Euler recovery. No duplicate fully qualified declaration name was found. Opened contracts:

| Pinned file and line | Declaration / actual contract read |
|---|---|
| Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:935 | Polynomial.discr; discr_C at 939 and discr_of_degree_eq_one at 944 give constant/linear value1. This is decisive for the n=1 finding. |
| Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:366 | WeierstrassCurve.IsElliptic is the unit-discriminant condition on five Weierstrass coefficients; it is not a carrier for arbitrary genus-one torsors. |
| TauCeti/FieldTheory/FunctionField/Hyperelliptic/Basic.lean:76 | IsHyperellipticFunctionField records genus≥2 and a separable degree-two rational subfield. It includes neither IsFunctionField nor exact constants nor geometric regularity. |
| TauCeti/FieldTheory/FunctionField/Hyperelliptic/Genus.lean:243 | isIntegrallyClosedIn_of_sq_eq: squarefree nonconstant f, characteristic≠2, and generation by y are actual hypotheses. |
| TauCeti/FieldTheory/FunctionField/Hyperelliptic/Genus.lean:258 | genus_eq_of_sq_eq gives (natDegree f−1)/2 on that field; isHyperellipticFunctionField_of_sq_eq at273 requires degree≥5. |
| TauCeti/FieldTheory/FunctionField/Hyperelliptic/RationalSubfield.lean:154 | adjoin_eq_adjoin_of_finrank_adjoin_eq_two is the owner of uniqueness of the index-two rational subfield. |
| TauCeti/FieldTheory/FunctionField/Hyperelliptic/Finite.lean:49 | branchPermHom, its kernel theorem at72, and finite_algEquiv_of_finrank_adjoin_eq_two at90 supply the function-field argument with NeZero (2 : k), not in characteristic two. |
| TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:169 | quadraticTwistOf and its Δ identity at239; the roadmap’s separate equation-level twist needs the displayed coordinate comparison rather than definitional equality. |
| TauCeti/AlgebraicGeometry/EllipticCurve/MinimalModel/ObstructionExponent.lean:85 | obstructionExponentAt divides the discriminant defect by12; twelve_mul_obstructionExponentAt at94 fixes the normalization. |
| TauCeti/AlgebraicGeometry/EllipticCurve/GlobalMinimalModel.lean:98 | IsGlobalMinimal is the existing elliptic object; the higher-genus extension must compare to it without renaming a different exponent. |
| TauCeti/NumberTheory/ModularForms/BinaryForms.lean:71 | binaryFormRep is the existing binary-form substitution representation; the operator composition at104 explains the reversed matrix order. The univariate presentation is a comparison, not a second representation theory. |

These are pinned library-relative paths. The beyond-pin model, Artin–Schreier and two-chart claims must cite AlgebraicCurves Layers10 and12; no moving-main declaration is accepted as a pinned supplier. Those named roadmap owners prevent their mere absence at the pin from being an unowned-gap finding.

Resolved suppliers follow (README line numbers). Existing roadmaps were checked on main and new suppliers at available heads; scope-only consumer mentions were not supply edges.

| Supplier | Resolved sections (README line locators) |
|---|---|
| AlgebraicCurves, main | Layers10,11,12 at1193,1396,1468: model/genus, automorphisms, regular-model dictionary. Equation arithmetic remains here. |
| EllipticCurves, main | Layers4,4.5a,4.5b at793,905,1013: minimality, defect and global construction. |
| StableReduction, main | Layers0,1,5,6,7,8 at343,372,552,576,621,658: curves, graphs, regular models, stable reduction. |
| JacobianChallenge, main | D,E,F at218,332,448: Picard/Jacobian, abelian variety, pointed Abel–Jacobi. |
| NeronModelsAndSemistableAbelianVarieties | §§1.8,1.9,1.11 at938,965,1023;2.2–2.3 at1113,1141;3.1,3.5,3.8–3.10,3.13 at1363,1503,1647,1693,1719,1842;4.2,4.4,4.5,4.7 at2027,2399,2427,2506;5.0a–c,5.1,5.4–5.6,6.10 at2857,2884,2910,2933,3535,3560,3576,4117. Cokernel precedes Galois invariants. |
| RelativeJacobiansAndIntegralCurveModels | §§2.2–2.3 at500,527;3.3 at664;4.1–4.4 at758,785,827. Rigidification at2.2 uses a section; unpointed curves use Picard descent. |
| EffectiveDiophantineMethods | §3.23 at3868: pointed sextic descent, kernel correction and local counts. Odd-degree extension here is distinct. |
| HeightsRationalPointsAndObstructions | §§1.1–1.5,1.7–1.8,1.12,1.14,1.18,2.1–2.5,3.3,3.17a,3.18c,6.1; key locators623,746,769,1400,1782,1896,2897. Owns Selmer, heights, parity and local-solubility objects. |
| PeriodsAndSpecialValues | PS.1.1,1.8,3.3 at403,618,847: Euler product, meromorphic continuation and leading term, not paramodularity. |
| FunctionFieldArithmetic | §§5.1,5.3,5.4,5.6 at1726,1807,1838,1888: counts, zeta, Jacobian comparison and duplicated coefficient recovery. |
| SchemeAndStackFoundations, main | §5.11 at7273: Weil bound. §§1.16,1.24 also own general twisting/descent. |
| LocalFieldsRamification | Layers0,3: valuations, extensions, inertia and ramification. |
| ArithmeticGaloisRepresentations | §2.7 at2085;§3 at2497,2651: epsilon/conductor. ArtinRepresentations Layer6 consumes these. |
| Completed/NumberFieldArithmetic | Layer5: completions and local/global dictionary. |
| ModularCurves, main | X₁(13) interpretation of the169 example; no generic-library dependency. |

Object searches included the supplied sibling heads for finite-field curves/abelian varieties, Sato–Tate, adelic images, group actions, gonality, abelian-surface modularity and elliptic periods, plus board packages. These concern consumers or distinct objects. No later supplier was introduced; FunctionFieldArithmetic already owns coefficient recovery. Igusa varieties were distinguished from genus-two invariants.

**Seeded source audit.** No manifest was present. Every bibliography item was requested through the sources service. Source keys identify retrieved texts or failures. No source file was added. All 15 seeded targets were examined; incomplete OCR formulas were not certified.

| Seeded target | Locator inspected and conclusion |
|---|---|
| 0.4 | Pinned Genus.lean:243,258,273; AlgebraicCurves10,12. Forward bridge supported, imperfect-field converse false; Liu book unavailable. |
| 0.5 | Native Weierstrass/VariableChange definitions: Δ values64,−27 agree. No precise external theorem/page supplied. |
| 1.2 | ddmm Definition1.21, v2 p.8, lines356–368: normalization agrees away from2. Mixed-equation arbitrary-ring source locator needs repair. |
| 1.4 | Pinned RationalSubfield.lean:154,Finite.lean:49–90; cardonaquer pp.4–5,lines150–168. Quotient and examples checked; full Igusa/Bolza classification uncertified. |
| 2.1 | lmfdb-igusa_clebsch_invariants lines96–103; liu1994models §2.2,pp.139–140,lines121–147. Root sums verified; Liu contains different coefficient formulas. |
| 2.2 | liu1993 §1,p.203,lines137–160; liu1994models §2.2. Relation/covariance/Witt discussion present; primary integral-polynomial theorem uncertified. |
| 2.3 | LMFDB normalization lines90–103; liu1993 lines154–157. Weighted point supported; minimal rational vector claim false. |
| 3.1 | Direct substitution; liu1994models p.137,lines40–47. Proposed scaling fails; source concerns regular models. |
| 3.2 | Nonempty subset ofℕ after corrected scaling; native elliptic minimality. Well-order route valid; full genus-one comparison not certified from Silverman. |
| 4.5 | ddmm Theorem1.8,v2 p.3,lines153–172. Eight clauses agree under odd-residue local hypotheses; ranks0,1,2 tested. |
| 4.7 | ddmm Theorem1.19,v2 pp.6–7,lines293–310;epsilon lines214–226. Missing zero convention and gamma order are essential. |
| 4.8 | ddmm Lemma2.22/Remark2.23,v2 p.20,lines889–895;Néron §4.5. Cokernel first, invariants second. |
| 4.9 | ddmm Theorem1.20,v2 p.7,lines321–347;11.3/proof,lines2681–2748. Wild/semistable formulas checked; V-index source issue below. |
| 5.2 | ps1997 pp.6,17–18,lines256–267,753–790;fps1997 Props2,3,5/Lemma3 at supplier locators. Split quotient and kernel comparison checked; Schaefer primary source uncertified. |
| 5.7 | Periods PS.1.1,1.8,3.3;both conjecture knowls,line90;Néron §1.11. Meromorphic/modular distinction checked; determinant±1 gives absolute-density multiplier1. |

## Not verifiable

This is a completed needs-changes review, not an acceptance conditional on inaccessible texts. Missing texts do not explain or weaken the explicit counterexamples. The following primary-source claims remain uncertified:

- **igusa1960**: §§3,8, Theorems2,7 and the complete exceptional-characteristic normal forms. The service reached the JSTOR DOI landing page but no classified legal full text. Liu’s legal author copy supports several downstream claims, not certification of every Igusa locator.
- **lockhart1994**: universal discriminant/global minimal-model claims, especially the proposed Dedekind obstruction theorem. The service reached the JSTOR DOI landing page without an available legal full text. No general obstruction theorem is certified by the elementary valuation tests.
- **bolza1887**: full characteristic-zero automorphism classification. JSTOR landing page only.
- **casselsflynn** and **mumford1984**: precise textbook locators for the two-torsion construction. Cambridge landing page/no classified full text for the former; no legal text resolved for the latter.
- **liu2002**: §7.4.3 and Chapters9–10. Oxford DOI landing request returned403. Native library contracts and the separate Liu articles were used only for what they actually state.
- **silverman2009**: VII.1.3(d), VIII.8. Bibliographic resolution returned429. The elliptic comparison was inspected at the pins, not certified against the book’s printed theorem.
- **stoll2001**: the cited implementation/descent paper. Crossref returned429 and the publisher DOI request returned502. No algorithmic claim is accepted on its title alone.
- **mestre1991**, **schaefer1995**, **namikawaueno**, **blr1990**, **stichtenoth2009**: the service classified these publisher citations as paywalled/uncertified. No paywall was bypassed and these settled uncertified items are not repeated in the missing-text request file. Cardona–Quer and Poonen–Schaefer provide legal secondary/related checks where identified above.
- **ddmm**: arXiv:1808.02936v2 was read, not the 2023 publisher version. The cited introductory theorem numbers are present in v2; identity of all numbering and corrections with the published version is not certified. The entire genus-two Tables7–8 were not independently reproduced. usersguide and betts were fetched; their existence does not certify every table row.
- **liu1993 / liu1994models**: the author copies were read through OCR. The hypotheses, component descriptions and simple invariant formulas cited in this review were legible; no claim is made to have certified every large coefficient or all entries of the tables from incomplete OCR. 
- Database-only claims such as stored full torsion groups, Mordell–Weil ranks, analytic leading values and every automorphism label were not proved by the finite point-count tests. The moving-main inventory is likewise not a pinned contract.

All bibliography requests were made in one review run. Resolved requests were removed from the scratch missing-reference list; unavailable texts retain their original keys. No sources.toml, worktree file, dependency order or tooling was changed.

## Source issues

- **Misprint** in lmfdb-igusa_clebsch_invariants at normalization paragraph, unpaginated, line92: the source says odd-weight signs are adjusted using powers of minus the imaginary unit; it should be powers of minus one; affects a stated result.
- **Misprint** in lmfdb-igusa_clebsch_invariants at root formulas, unpaginated, line103: the source says the displayed sums average over distinct orbit terms; it should be sum the distinct terms, with no averaging denominator; affects a stated result.
- **Error** in cardonaquer at Lemma1 proof, arXiv v1 p.4, lines124–134: the source says the last-branch invariants are powers of j₃; it should be handle j₃=0 separately, for example with (J₂,J₄,J₆,J₁₀)=(0,0,0,1); affects the proof.
- **Misprint** in ddmm at Theorem1.20(ii), arXiv v2 p.7, lines339–340 (also Theorem11.3): the source says V tests the character denominator at the parent cluster; it should be test ξ_s(λ̃_s)=0 at s, as in the proof at line2744; affects a stated result.
