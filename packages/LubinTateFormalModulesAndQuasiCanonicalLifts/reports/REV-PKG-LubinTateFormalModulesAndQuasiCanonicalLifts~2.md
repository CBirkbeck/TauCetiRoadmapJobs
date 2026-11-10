# Review of LubinTateFormalModulesAndQuasiCanonicalLifts (package, round 2)

**Verdict:** needs changes

Sixteen findings, six blocking (one P1 and five P2). The package is repairable. Its five Lean theorems elaborate, but the README contains a false lattice action, overlapping ownership, duplicated pinned results and several incorrect Checks. No package input was edited.

## Previous findings, checked individually

| Previous finding | Repaired passage and location in packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md | Verification and status |
|---|---|---|
| F01, completed unramified extension | Lines 252–255: “§4a.3 supplies the completion” and “the identification … of its absolute Galois group with the inertia group” | **Repaired.** RamificationOfCompleteDiscretelyValuedFields §4a.3 supplies precisely this object. The citations now occur in §§2.5, 2.6, 6.6 and the layer dependencies. The algebraic extension remains with LocalFieldsRamification. |
| F02, additive law | Lines 556–564: “Over a discrete valuation ring … of characteristic zero” and “In equal characteristic … the Lubin–Tate module is the additive law itself” | **Repaired.** For f=tX+X^q over F_q[[t]], f(X+Y)−f(X)−f(Y)=0. In characteristic zero the mixed coefficients force an additive endomorphism to be linear. |
| F03, Honda sign | Lines 1081–1086: “The two readings differ for both signs” and “the correct pair, type … and parameter …” | **Partly repaired.** Both sign pairings and the BKO application are now correct. The replacement Check adds an unjustified equality of logarithms at line 1096: R11 below. The same ambiguity survives in the layer example. |
| F04, twist component | Lines 1424–1429: “for each Frobenius twist” and “in the deformation space of the twist to which … is marked” | **Repaired.** For index q₀^N the target fibre is the q₀^N twist; Y95 line 159. The same correction was made in §7.2. This does not repair the independent action error in §5.4. |
| F05, BKO pagination | Line 1590: “§§5.0.1–5.0.2, pp.955–959”; the manifest agrees | **Repaired, correctly differing from the old recommendation.** BKO21 line 554 follows the p.955 marker at line 533 and precedes the p.956 marker at line 571. Lemma 5.1 is on p.956. |
| F06, Honda completeness | Lines 1005 and 1043–1050: “complete or not”; “When … moreover complete” | **Repaired.** H70 line 313 excludes completeness from (F); lines 506–508 and Theorem 4 retain the noncomplete converse. Completeness enters at lines 623–627 and Proposition 3.5. |

The repair report marked no finding “not actionable in this package.” None is re-raised on that basis. I searched the remaining package for the repaired patterns; the action and canonical-modulus issues below occur beyond the passages the previous repair changed. I did not inherit the old “sound” conclusions without computations. In particular, the old §3.1 row computed over F_p although the Check says Z_p, and the old §4.2 row did not substitute p=2.

## R01 (P1) — An Artin uniformizer cannot dilate the actual Tate lattice

**Location:** packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:1245–1248, §5.4: “a lift of … a ∈ F^×, carries L to a⁻¹L”.

**Claim:** the action on embedded lattices is multiplication by the inverse of every element of F^×.

**Witness:** Set a=π_F and L=T. Section 2.5 gives χ(Art_F(π_F))=1, so σT=T, whereas π_F⁻¹T/T has #k_F elements. Y95 line 175 restricts the corresponding formula to units.

**Exact repair:** Write a=π_F^r u with u∈O_F^×. On actual lattices assert σL=u⁻¹L. On the π_F^Z-classes with their coherent twist identifications assert [σL]=[a⁻¹L]. Keep §6.6's class-level action, explicitly invoking that identification. Correct the unrestricted character formula in the §5.4 Check. Add the a=π_F, L=T negative control: the repaired actual action returns T, while both class representatives give [T].

## R02 (P2) — The division tower has two owners

**Location:** packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:36–39, 657–715; ownership of division fields and their Galois character.

**Claim:** this package constructs the finite division fields and their scalar-action Galois identifications.

**Witness:** RelativeFarguesFontaine, pull request #1209, TauCetiRoadmap/RelativeFarguesFontaine/README.md:1300, §2.5 constructs E_n=E(LT[π^n]) and proves Gal(E_n/E)≅(O_E/π^n)^× and the infinite unit-group comparison.

**Exact repair:** Cite the earlier RelativeFarguesFontaine §2.5 for that shared tower and scalar-action interface in scope, supplier contracts and §§2.3–2.4. Retain and explicitly distinguish the elementary series construction, primitive-root presentation, and comparison with the pinned arithmetic Artin map. Do not plan the shared construction again. Test the interface at E=Q_3, n=1,2: the same fields have degrees 2,6 and the same scalar action. If ownership is instead moved here, the other owner's change and the order change must be concrete and coordinated; merely calling it a consumer does not resolve the conflict.

## R03 (P2) — Quadratic canonical and quasi-canonical lifts have two owners

**Location:** packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:42–46, §§6.1–7.1, and 1852–1854, which describes GrossZagierAndArithmeticHeights as consuming these lifts.

**Claim:** this package owns the quadratic construction, markings, orders and orbit degrees.

**Witness:** GrossZagierAndArithmeticHeights, pull request #1487, TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:2950 and 2985, §7.2 constructs these marked lifts and expressly owns their orders, orbit sizes and integral lifting filtrations.

**Exact repair:** Make the overlap over the completed strict base an import from the earlier GrossZagierAndArithmeticHeights §7.2. State precisely what remains new here: finite-residue-field descent, the higher-degree lattice classification, explicit coordinates and the comparisons needed by the BKO towers. Revise scope, exact contracts, dependencies and the downstream paragraph consistently. At quadratic q₀=2, s=1 the imported orbit counts must be 3 unramified and 2 ramified, rather than a second target proving them.

## R04 (P2) — The finite-residue deformation specialization is already owned

**Location:** packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:39–40, 55–58 and 938–957, §3.6.

**Claim:** the only acknowledged overlap for universal formal-module deformations is BordismFormalGroups §F5.

**Witness:** EndoscopicTransferAndUnitaryTraceComparison, pull request #999, TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:3625, §10.2 constructs the marked strict O-module deformation ring O_r[[T₁,…,T_(n−1)]]. Its §12.3 also supplies the algebraically closed residue-field spaces.

**Exact repair:** Name these earlier specializations in scope and exact contracts, and state §3.6 as the extension to arbitrary specified B and residue field, identifying its restriction with the supplied functor. Retain the action-sensitive tangent and descent work needed for that extension; do not claim a second owner for the finite-residue case. At n=1,2, B=O_r, both interfaces must give respectively O_r and O_r[[T]], with the same marked isomorphisms.

## R05 (P2) — Convergence and rigidity are already proved at the pin

**Location:** packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:33–34, 393–401 and 895–903.

**Claim:** the package must prove integral formal-logarithm convergence/coefficient bounds and finite-height rigidity.

**Witness:** TauCeti/RingTheory/FormalGroup/Logarithm/Convergence.lean:44,58,64,71 proves the bound and convergence. TauCeti/RingTheory/FormalGroup/Rigidity.lean:186,229 proves finite-height rigidity for homomorphisms and isomorphisms.

**Exact repair:** Remove these already proved components from owned targets and import their exact declarations in the supplier contracts. Retain §0.3's new evaluated homomorphism, deep inverse and trace comparisons with an explicit distinction. Retain §3.4's lifting and action-sensitive torsor assertions; obtain its uniqueness from TauCeti.FormalGroupHom.eq_of_map_residue_eq and TauCeti.FormalGroupIso.eq_of_map_residue_eq, using underlying p-height h[K:Q_p]. Also use FormalGroup.summable_coeff_exp_mul_pow in TauCeti/RingTheory/FormalGroup/Exponential/Padic.lean:76 for the existing exponential convergence estimate. These inputs cover p=2: for log(1+X), the degree-two coefficient has norm 2, equal to the native bound; the exponential converges for norm strictly below 1/2. Finite-height rigidity applies at height one; the εX^q infinite-height control remains excluded.

## R06 (P3) — The “not statable” explanations misdescribe the pinned carriers

**Location:** packages/LubinTateFormalModulesAndQuasiCanonicalLifts/Suggested.lean:26–34: “there is no carrier of points of a general formal group” and “there are no homomorphisms or isomorphisms”.

**Claim:** the pins lack these three general carriers.

**Witness:** TauCeti/RingTheory/FormalGroup/TopNilpotentPoint/Basic.lean:85 defines general evaluated points; TauCeti/RingTheory/FormalGroup/Hom.lean:137,351 defines FormalGroupHom and FormalGroupIso; TopNilpotentPoint/Hom.lean:42 evaluates homomorphisms.

**Exact repair:** Replace the false absence claims by the actual remaining obstacles: the formal O_K-action and its torsion/Tate character for §§2.2–2.5, and the marked O_K-module deformation functor for §3.6. Re-audit headline expressibility using the native carriers, and state any headline that now needs only a few simple definitions. Update README §§0.1–0.2 and the supplier contracts to use these native objects. The native point carrier has a coordinate and HasEval proof; its group structure additionally requires a complete Hausdorff linearly topologized algebra. It applies to an integer-ring adic topology, not automatically to a field with its field-linear topology. This finding does not claim that a complete Tate or deformation functor is already present.

## R07 (P3) — The interpolation Check fails at p=2

**Location:** packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:518–519: “the solution … is not X, since f ≠ g”.

**Claim:** (1+X)^p−1 and pX+X^p differ for every prime p.

**Witness:** At p=2 both equal 2X+X². The unique derivative-one intertwiner is X, with degree-two coefficient 0. At odd p its degree-two coefficient is 1/2.

**Exact repair:** Restrict the nonidentity example to odd p, state the coefficient 1/2, and add the p=2 equality/identity case. This preserves the theorem's full prime range.

## R08 (P3) — The proposed strict automorphism is not strict over Z_p

**Location:** packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:820–822: “the strict automorphism [1 + p] … over ℤ_p”.

**Claim:** this integral automorphism is strict but fails to preserve the marking.

**Witness:** Its linear coefficient is 1+p, not 1. At p=2 it is 3X+3X²+X³. Its reduction is the strict nonidentity automorphism X+X²+X³ over F₂.

**Exact repair:** State the example entirely over k=F_p, using the residual automorphism (1+X)^(1+p)−1 with the identity marking. Then its derivative is 1 and its reduction is itself, not X, so it is strict and not marking-preserving. Explicitly contrast the integral lift's derivative 1+p.

## R09 (P3) — Restricting the deformation functor to a larger coefficient ring does commute with base change

**Location:** packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:825–827: “the base change … does not represent the functor on O_F-algebras over the smaller base”.

**Claim:** O_F[[t]] fails to represent the restriction of the B-based height-two functor to O_F-algebras.

**Witness:** For every such R, Hom_cont,O_F(O_F[[t]],R)≅Hom_cont,B(B[[t]],R), both parametrized by t↦m_R. Take B=Z₃, O_F=Z₃[√3], R=O_F/(√3)²: both sets have three elements.

**Exact repair:** Replace the negative assertion by this base-change compatibility. If the intended contrast is the change from O_(F₀)-action to O_F-action, say that explicitly: the restricted height-two O_(F₀)-module problem still has one parameter, whereas deformations preserving the height-one O_F-action have none. Over the displayed R these are respectively three parameters and one isomorphism class.

## R10 (P3) — The Honda nonintegrality Check uses an integral coefficient at p=2

**Location:** packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:1056–1058: “has nonintegral coefficient −2/p of XY”.

**Claim:** that coefficient witnesses nonintegrality for every prime.

**Witness:** At p=2 it is −1∈Z₂. For ℓ=X+X²/2, the coefficient of X²Y² in ℓ⁻¹(ℓ(X)+ℓ(Y)) is −5/2, which is not integral.

**Exact repair:** Use XY=−2/p for odd p and X²Y²=−5/2 for p=2. The conclusion that this rational logarithm does not define an integral law is correct with these separate witnesses.

## R11 (P3) — A strict logarithm comparison is changed into equality

**Location:** packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:1096: “the logarithm is ℓ₁”; also the unqualified model in the example at 1137–1139.

**Claim:** the logarithm of the specified Lubin–Tate law is the sparse Honda series.

**Witness:** For f=pX+X^(p²), ℓ_f(f(X))=pℓ_f(X) forces coeff_(p²)(ℓ_f)=1/(p−p^(p²)). At p=2 this is −1/14, whereas coeff₄(ℓ₁)=1/2.

**Exact repair:** Say that the Honda model has logarithm ℓ₁ and that the given law is strictly isomorphic to that model, as §4.3(iii) already states. Specify the chosen Honda model in the layer example. Add the p=2 coefficient comparison; the strict coordinate change has a nonzero degree-four coefficient, so equality of the two normalized logarithms is not asserted.

## R12 (P3) — The canonical modulus need not lie in the smaller unramified coefficient ring

**Location:** packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:1507–1508: “the canonical lift has modulus in 𝔪_B”.

**Claim:** this includes ramified quadratic F/F₀, where the conventions define B as the integers of the maximal unramified subextension of F/F₀.

**Witness:** Take F₀=Q₃, F=Q₃(π), π²=3. Y95 line 361, p.302 gives the canonical Newton polygon (1,2),(3,1),(9,0). Its normalized modulus has v_F=1; nonzero elements of m_B have valuation at least 2.

**Exact repair:** Put the canonical modulus in m_(O_F), not generally m_B. In the ramified quadratic case record valuation 1; in the unramified case B=O_F and the original containment holds. Keep the positive-level theorem unchanged. An explicit coefficient witness is [π]=πX+X³: its square has X³ coefficient π+π³=4π, of valuation 1. Changing the universal coordinate over B cannot remove that leading valuation.

## R13 (P2) — The two uniformizer towers are not always different

**Location:** packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:753–759: “the two towers are different fields”, under only π′=uπ and u∈O_K^×.

**Claim:** distinctness holds even when u=1.

**Witness:** With u=1, π′=π, η_u=1, θ may be the identity and K_(π′)=K_π. The claimed inequality becomes K_π≠K_π.

**Exact repair:** State that the towers coincide for u=1 and are different for u≠1. For the latter, Art_K(π) fixes K_π but has χ_(π′)-value u≠1. Add both cases as Checks. The comparison and twist theorem remains valid for all units.

## R14 (P3) — Depth-zero unit notation contradicts the native filtration

**Location:** packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:713,737; packages/LubinTateFormalModulesAndQuasiCanonicalLifts/Suggested.lean:123–125.

**Claim:** 1+π^m O describes the restricted unit image and norm group without excluding m=0.

**Witness:** At m=0, 1+O=O contains 0 and π, while U(K,0)=O^×. TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean:104,145 makes the depth-zero distinction explicitly.

**Exact repair:** Use U(K,m) uniformly and expand it as 1+π^m O only for m≥1. In the Lean docstring write π^Z·U(K,m). No theorem signature change is needed. At m=0 the image is O^× and the norm group is K^×, matching the existing correct Check at README:739–740.

## R15 (P3) — The Tate-module definition lacks its required API list

**Location:** packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:637–644, §2.2.

**Claim:** the inverse-limit carrier is introduced, but its API facts are only embedded in the theorem paragraph.

**Witness:** Between the definition at line 638 and Checks at line 646 there is no API bullet list, unlike §§0.1, 0.2, 1.1 and 5.1. The three existing Checks are present.

**Exact repair:** Keep the mathematical statement and add a prose API list covering the transition maps, reduction modulo π^m, the continuous O_K-linear action, the rational quotient and the comparison with the underlying Z_p-Tate module. Do not add Lean declarations. For the cyclotomic example the list specializes to rank 1, quotient Z/p^m, and Q_p/Z_p torsion, so it records the intended inverse limit rather than the divisible direct limit.

## R16 (P3) — The substitution contract gives the wrong junk value for polynomials

**Location:** packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:140–142: “defined to be zero when the substituted series fails … HasSubst”.

**Claim:** substitution always returns zero outside HasSubst.

**Witness:** Mathlib/RingTheory/MvPowerSeries/Substitution.lean:229, subst_coe, evaluates polynomials without HasSubst. Over Z, substitute the constant 1 into the polynomial X: the result is 1, although 1 is not nilpotent.

**Exact repair:** Say that substitution agrees with polynomial evaluation, and for general power series the substitution laws used here require HasSubst; all this package's substitutions satisfy it by zero constant coefficient. Do not assert the stronger zero-value convention. The repaired contract gives 1 for the displayed polynomial control and leaves all five Lean signatures unchanged.

## Verified sound

The positive conclusions below concern the specified checks, not a claim that every unformalized theorem has been proved. All 50 target subsections were read, including their API, Checks, routes and Needs lines. The previous report's computed rows were useful controls; all sampled, repaired and finding-bearing targets were recomputed. The mathematical counterexamples in the findings are separate from elaboration.

### Seeded source checks

All eight cited works have manifest entries: LT65, LT66, H68, H70, G86, Y95, VZ07 and BKO21. No entry was added, removed or rewritten. Seven cached texts were read; LT65 remains settled as uncertified. The manuscript ranges below refer to printed pages, not extraction page indices. The BKO p.959 and Yu p.302 PDF pages were also rendered and inspected to recover displayed formulas.

| Sampled target | Locator and text actually inspected | Outcome at the stated hypotheses |
|---|---|---|
| 1.3 Lubin–Tate formal module | LT65, Theorem 1, pp.382–383 | Text unavailable under the settled uncertified status. The equal-characteristic and mixed-characteristic computations below test the statement; they do not certify this locator. |
| 3.5 finite-height tangent space | VZ07 Corollary 3.4, Lemma 3.5, Proposition 3.6, pp.63–65: lines 2951–3013; LT66 Proposition 2.6, pp.54–55: lines 214–222 | Dimension h−1 is supported. VZ07 normalizes over a separably closed field; LT66 treats arbitrary k for ordinary formal groups. The action-sensitive descent to arbitrary k is the package's additional argument, not literally VZ07's proposition. |
| 3.6 universal deformation | LT66 Theorem 3.1 and Proposition 3.3, pp.56–58: lines 284–295,331–340; VZ07 Theorem 3.8, p.65: lines 3014–3035; Y95 §2, pp.294–295: lines 84–109 | Representing power-series ring and marked uniqueness supported in the sources' settings. Arbitrary imperfect residue fields with an O_K-action require the advertised descent argument; see limitations below and R04. |
| 4.1 Honda operators | H70 §2, condition (F), pp.220–222: lines 305–354,373–410 | Frobenius-skew action, coefficient divisibility, and absence of a completeness assumption checked. Operator acts on coefficients as well as exponents. |
| 4.3 Honda–Lubin–Tate comparison | H70 Lemma 4.2, p.231: lines 738–749; Lemma 2.4/Theorem 3, pp.223–225; H68 Theorem 2, pp.204–205: lines 210–225 | Supports the integrality/congruence and strict-isomorphism route over the unramified ring. It does not imply equality of arbitrary logarithms: R11. BKO21 Lemma 5.1, p.956, lines 573–588 has the sign misprint recorded below. |
| 5.1 Tate lattices and kernels | Y95 §3, p.295: lines 116–125; G86 §5, p.324: lines 180–190 | Lattice/finite torsion correspondence supported. Finite flat closure is correctly a separate supplied assertion, with the DVR hypotheses retained. |
| 5.2 integral lattice quotients | Y95 §3, pp.295–296: lines 126–140; G86 §5, pp.324–325: lines 188–197 | Product quotient and Frobenius reduction supported. The formal O₀-action, integral coordinate and marked twist distinguish this target from the supplied p-divisible quotient. |
| 5.4 descent | Y95 §§3–4, pp.295–297: lines 138–140,168–179; G86 §5, pp.324–325: lines 193–195 | Setwise descent supported. The source's unit restriction is missing from the package's actual-lattice action: R01. |
| 6.2 Frobenius-marked lifts | Y95 §4, pp.296–298: lines 155–175; G86 §5, pp.324–325 | Index q₀^N gives the q₀^N twist; uniformizer rescaling passes to the specified lattice classes. Marked and unmarked equivalence relations differ. |
| 6.4 quadratic orders | G86 Proposition 5.3, p.325: lines 198–217; Y95 Proposition 4, p.300: lines 305–321 | The quadratic order/freeness setting supports the use. The order classification and conductor calculation are given by the package's integral-basis argument; the s≥1 restriction on the unit formula is essential and present here. |
| 7.2 modulus uniformizer | G86 Proposition 5.3(3) and proof, pp.325–326: lines 204–235; Y95 Theorem 2′ and quadratic example, pp.301–302: lines 350–376, including rendered p.302 | Positive-level valuation formulas supported in both ramification cases. G86's canonical modulus is in the integers of the completed unramified extension of the CM field; it is not in the package's smaller B in the ramified case: R12. |
| 7.6 neighbours | BKO21 §5.0.1–§5.0.2, pp.955–959: lines 554,712,754–768, rendered p.959 | The p outward/one inward count is correct. The printed outward representatives contain a misprint; the package's line-space formulation avoids it. Repaired page range is correct. |
| 8.1 character data | BKO21 §2, pp.947–948: lines 225–240,247–252 | Index n+1, tame factor of order p²−1 and rank-two principal units agree. The full character is distinguished from the Teichmüller restriction. |
| 8.3 fixed fields | BKO21 §2, pp.947–948: lines 237–252; §4, p.954, line 516; §5.0.2, pp.958–959: lines 712–735 | Plus/minus fixed fields and the anticyclotomic direction agree. The package correctly says pro-p over Φ, with a dihedral group over Q_p. |
| 9.1 finite formal traces | BKO21 §4, pp.954–955 and §5.0.2, pp.958–959: lines 734–768; LT65 §1, p.383 uncertified | BKO supplies the relevant Galois formal sums. The arbitrary finite separable formulation is the package's extension by summing embeddings, not a theorem literally stated by BKO. Independence, transitivity and logarithmic compatibility have the direct commutative-group argument described below. |

No additional “unverified” source locator was flagged in the README. LT65 was not requested again. No source passage was copied into the deliverables.

### Computed adversarial table

Here q is an actual finite residue-field cardinality, hence q≥2. A field or zero ring cannot satisfy the DVR/irreducible-uniformizer hypotheses. Local fields and finite separable extensions are nonzero, complete and Hausdorff with finite residue fields; characteristic-zero extensions used here are separable. Nonabelian ambient Galois groups are allowed, but their scalar characters factor through abelianization. None of the statements silently asserts that an arbitrary Galois group is abelian. “Pass” below means that the displayed instance is consistent, not a substitute for a proof.

| Statement | Instances tried | Values computed on the two sides / wrong model | Result; change |
|---|---|---|---|
| 0.1 action and height | Additive module over F_q with [π]=0; height-one O_F-module restricted to O₀, [F:F₀]=2 | Infinite height in the first case; first nonzero degree q₀² and O₀-height 2 in the second, versus O_F-height 1. Zero action has [1]=0 instead of X. | Pass; unitality excludes the wrong action. |
| 0.2 evaluated module | Multiplicative law over Z_3, x=y=3; a=2 | x+_F y=3+3+9=15; [2](3)=(1+3)²−1=15; ordinary addition gives 6. Zero point maps to the elliptic identity. | Pass; use native carrier under R06. |
| 0.3 logarithm | G_m, x=ζ_p−1; G_a, x=p; coefficient n=2 at p=2 | log(ζ_p)=0 with x≠0; additive log and inverse both give p; norm(coeff₂)=2=norm(2⁻¹). | Pass; convergence already supplied, R05. |
| 0.4 local models | Q_2(i) versus Q_2(√−3); identity field tower | −3≡5 mod 8 gives the unramified quadratic extension; −1≡7 mod 8 gives ramified Q_2(i). Identity tower maps have degree 1. | Pass; arbitrary close-looking polynomials cannot replace Krasner's bound. |
| 1.1 two predicates | πX+X^q; πX; πX+X^q+X^(q+1) | Reduction X^q, 0, X^q+X^(q+1), respectively; degrees q,1,q+1. Zero polynomial has linear coefficient 0≠π. | Pass; no degree-zero junk witness satisfies the hypotheses. |
| 1.2 interpolation, Lean headline | a=0,1 with f=g; cyclotomic f and pX+X^p at p=2,3 | Intertwiners 0,X; at p=2 f=g and coeff₂(φ)=0; at p=3, 3c+3=9c gives c=1/2. | R07. The theorem itself survives. |
| 1.2 residue-cardinality control | Residue F_(p²), pretend q=p, ā outside F_p | Coefficient of X^p in φ̄(X)^p is ā^p, versus ā in φ̄(X^p); unequal. | Pass; finite residue cardinality cannot be replaced by p. |
| 1.3 existence/uniqueness, Lean headline | F₂[[t]], f=tX+X²; Z_3, f=(1+X)³−1 | First: f(X+Y)=tX+tY+X²+Y²=f(X)+f(Y). Second: F=X+Y+XY and 1+f(F)=((1+X)(1+Y))³=(1+f(X))(1+f(Y)). | Pass; F02 repaired without restricting generality. |
| 1.4 coordinate comparison | f=3X+X³, g=f+3X², derivative-one φ | For f∘φ=φ∘g, the degree-two equation is 3c=3+9c, hence c=−1/2, integral and nonzero. | Pass; direction must be retained. No identification with X. |
| 2.1 torsion | m=0; h=1,q=3,m=1,2; h=2,q₀=2,m=1 | R[[X]]/(X)=R of rank 1; ranks 3,9; rank 4. Infinite-height [π]=0 gives R[[X]], not a finite R-module. | Pass; finiteness is tied to height. |
| 2.2 Tate module | Cyclotomic h=1; unramified quadratic O-action h=1 | O-ranks 1,1; Z_p-ranks 1,2. T/π^mT has q^m elements; V/T is divisible torsion, not free. | Pass; R15 is presentation only. |
| 2.3 degree/splitting, Lean headline | Q_2 cyclotomic m=1,2; Q_3 m=1,2 | Degrees (2−1)2^0=1, (2−1)2=2; (3−1)=2, (3−1)3=6. Q_2(ζ₂)=Q_2; Q_2(ζ₄) has degree 2. t=0 fails primitive-root hypothesis. | Pass; m≥1 prevents natural-subtraction junk. Shared ownership R02. |
| 2.4 character | Basis v versus uv; level m=0; mod π at q=2,3 | σ(uv)=uχ(σ)v=χ(σ)uv; level-zero image O^×; residue images have orders 1,2. | Pass except depth-zero wording, R14. |
| 2.5 reciprocity, Lean headline | Q_5, unit 2 modulo 5; x=π; m=0 | χ(Art(2))≡3, not 2; χ(Art(π))=1. At m=0 roots={0}, left side true, right group π^Z O^×=K^×. | Pass; norm theorem and direction agree. R14 corrects docstring only. |
| 2.6 uniformizer twist | u=1; u=2 over Q_5 | First: η=1 and equal towers. Second: χ_π(Art(π′))=1/2, η(Art(π′))=2, product 1; inverse twist gives 1/4≠1. | R13; sign of the twist is correct. |
| 3.1 marking/strictness | [1+p] over Z_2 and F₂ | Integral linear coefficient 3≠1; reduction X+X²+X³ has linear coefficient 1 but is not X. | R08. |
| 3.1 coefficient base change | B=Z₃, A=Z₃[√3], R=A/(√3)² | Hom_A(A[[t]],R) and Hom_B(B[[t]],R) each correspond to {0,π,2π}; height-one A-action deformation has one class. | R09. |
| 3.2 coefficient algebra | Degree-one law term XY; [π] term X^q | Weighted degrees 1 and q−1 (q=2 gives 1, q=3 gives 2). A polynomial-generator image can be lifted independently across a surjection. | Pass; coefficient algebra is not the marked deformation ring. |
| 3.3 cocycles | I=0; ψ=εX, ε²=0 | H²(G₀;0)=0; coordinate derivative is 1+ε, reducing to 1. Suppressing this coboundary leaves an extra scalar direction. | Pass; marked isomorphism need not have derivative exactly 1. |
| 3.4 lifting and rigidity | Height h=1,2 over k[ε]/ε²; infinite-height G_a | Lift-torsor dimensions 0,1. For [a]=āX, ε(āX)^q=āεX^q, so εX^q is a nonzero endomorphism reducing to 0. | Pass; existing finite-height rigidity is R05. |
| 3.5 tangent space | h=1,2,3; height-one O_(unramified quadratic) action and restricted Z_p-action | Dimensions h−1=0,1,2; restriction has dimension 1 versus 0 with O-action. | Pass; no rank-zero formal module is asserted in this layer. |
| 3.6 universal deformation | h=1,2; k[ε]/ε² with k=F₃; imperfect k with B=k | Rings B,B[[t]]; tangent-point counts 1,3 at heights 1,2. For h=2 over imperfect k the tangent parameter remains a∈k, not a chosen Cohen lift. | Consistent; R04 and source limitation below. |
| 3.7 elliptic deformation | Supersingular height-two elliptic group versus height-one formal part of ordinary curve | Supersingular formal and elliptic dimensions both 1. Ordinary formal deformation dimension 0 versus elliptic dimension 1 from the étale/formal extension. | Pass; supersingularity restriction matters. |
| 4.1 skew operator | a∉Fix(σ); ℓ_−=Σ(−p)^−j X^(p^(2j)), p=2,j=2 | T(aX)=σ(a)X^p, not aX^p. (p+T²)ℓ_− coefficient is 0; (p−T²) coefficient 2/p=1 at p=2, not in 2O. | Pass; corrected sign works at 2. |
| 4.2 integrality | ℓ=X+X²/p, p=3,2; multiplicative log | coeff_XY=−2/3,−1; at p=2 coeff_X²Y²=−5/2. For p=2 coefficient X² in (p−T)log(1+X) is −2∈2O. | R10; valid special type gives integral law. |
| 4.3 comparison | s=1,−1; f=2X+X⁴ | (p−sT²)ℓ_s=pX for both signs. For f, coeff₄(log_f)=−1/14, versus 1/2 in ℓ₁. | Sign correct; equality false, R11. |
| 4.4 elliptic headline | E:y²+y=x³ at p=2; both trace extremes | Δ=−27 is a unit; #E(F₂)=3, #E(F₄)=9, a₄=−4, parameter −2. Extreme counts are (p−1)² and (p+1)². | Pass; no good-prime exclusion. |
| 5.1 lattice/kernel | L=T; π₀⁻¹T in rank 2; one enlarged basis vector, q₀=3 | Kernel orders 1,9,3; latter is a line, not the entire 9-element torsion. Scalar −1 fixes a line but moves nonzero points. | Pass; setwise/pointwise descent distinguished. |
| 5.2 integral quotient | C={0}; multiplicative two-torsion over Z₂ | Product X; for C={0,−2}, product X(X+2)/(−1)=−X²−2X, a unit multiple of [2]=2X+X². Reduction is X². | Pass; target coordinate differs from monic product, marking retained. |
| 5.3 Hom correspondence | a=0; L₁=L₂=T; L₂=π₀⁻¹L₁ | Zero map; multiplier order {a:aT⊂T}; π₀⁻¹:L₁→L₂ and π₀ its inverse, product 1. | Pass; an arbitrary rational multiplier not preserving L is excluded. |
| 5.4 actual action | a=π_F, L=T; unit a of order 3 on level-one classes | Actual π-action returns T; proposed π⁻¹T has quotient size q_F. A unit of order 3 gives distinct class exponents 1 and 2 for a versus a⁻¹. | R01; inverse-unit convention is genuinely detected. |
| 5.5 elliptic quotient | Zero kernel; full p-torsion of supersingular elliptic curve | Quotient/isogeny identities for zero kernel; full kernel has order p², completed [p] has first residual term degree p². | Pass; target-coordinate comparison required. |
| 6.1 canonical lift | F/F₀ degree 1 and unramified quadratic | O_F-height 1 gives deformation dimension 0 in both; restricted O₀-height is 1 or 2. | Consistent; shared quadratic owner R03. |
| 6.2 marked lift | L=T; [L:T]=q₀; multiply by π_F in residue degree 2 | Twist exponents N=0,1; uniformizer rescaling changes exponent by 2, hence preserves the component modulo 2. | Pass; F04 correction applied throughout. |
| 6.3 classification | L and aL; cubic O=O₀+π₀O_F | Unmarked classes equal; marked classes unequal unless class stabilizer condition holds. Cubic lengths length(O_F/O)=2 and length(O/π₀O_F)=1 are unequal. | Pass; order alone insufficient outside quadratic case. |
| 6.4 quadratic orders | s=0,1; ramified quadratic | Conductors O_F and π₀O_F; v_F(π₀O_F)=2. At s=0, 1+O_F contains 0, invalid unit formula; s≥1 excludes it. | Pass; the correct boundary here motivates R14 elsewhere. |
| 6.5 quadratic classification | q₀=2,s=1; q₀=3,s=2 | Marked counts 3/2 in unramified/ramified cases; 12/9 at q₀=3,s=2; one unmarked class per order. | Mathematical controls pass; R03 ownership. |
| 6.6 moduli field | L=T; a=π_F; index q₀ quotient | Norm subgroup π_F^Z O_F^×=F^× gives M=F; π_F changes representative but not marked class; index q₀ modulus lives on the q₀ twist. | Pass after R01's class-level qualification. |
| 7.1 ring-class degree | q₀=2,3 and s=1,2; s=0 | Unramified: 3,6 and 4,12; ramified: 2,4 and 3,9. Level 0 degree 1, not (q₀+1)/q₀. | Pass; R03 ownership. |
| 7.2 modulus | q₀=3,s=1,2; ramified canonical level | Positive valuations unramified 1/4,1/12, ramified 1/3,1/9. Canonical ramified valuation 1 versus m_B valuation ≥2. | Positive theorem passes; R12 fixes the Check. |
| 7.3 BKO fields | p=5,s=0,1,2,3 | Degrees 1,6,30,150; stabilizer at level 1 has quotient order 6. | Pass; no extrapolation of the positive-level formula to zero. |
| 7.4 infinite primed tower | p=5 | Tame quotient order (25−1)/(5−1)=6; principal quotient rank 2−1=1; Galois group C₆×Z₅. | Pass. |
| 7.5 ramified Honda boundary | p=5, H₁ over O_(Ψ′₁) | e=6; v_(Ψ′₁)(−5)=6≠1; End(H₁)=Z₅+5O has index 5 in O. | Pass; unramified hypothesis cannot be dropped. |
| 7.6 neighbours | p=5, L_s=Z₅e₁+Z₅e₂, e₁=5^−s t,e₂=αt | Six lines: five spanned by e₁+a e₂ and one by e₂. Enlargements have generators 5^−s−1t+(a/5)αt; inward neighbour 5⁻¹L_(s−1). | Pass; printed BKO formula instead gives one outward lattice five times. |
| 8.1 character data | p=5,n=0,1; primitive Teichmüller ζ | Degrees 24,600; tame order 24; ω(Art ζ)=ζ⁻¹, not ζ in general. | Pass. |
| 8.2 plus/minus | p=5, trace-zero α; z=5(a+bα) | (1+c)z/2=5a; (1−c)z/2=5bα; intersection 0. Norm(6)=36≠1; exp(5α) has norm 1. | Pass; p=2 projector excluded by the BKO hypotheses. |
| 8.3 fixed fields | p=5,n=0,1,2 | Θ degrees 1,25,625; Ψ degrees 1,5,25. Gal(Ψ₁/Q₅) has order 10, with jgj⁻¹=g⁻¹≠g for g order 5. | Pass; dihedral group is nonabelian and not pro-5. |
| 8.4 comparisons | p=5,s=1,2 | Ψ′₁∩Ψ₁=Φ, degrees 6 and 5 give compositum degree 30; tame-fixed Ψ′₂ has degree 30/6=5=degree Ψ₁. | Pass; index shift is n+1. |
| 8.5 generator signs | n=0,1; adjacent trace indices | [p]w₁=[−p]v₁=v₀=w₀; [−p]w₁=−w₀. (−1)^(n+m)=−1 for adjacent indices. | Pass; formal inverse, not coordinate negation. |
| 9.1 formal trace | Q_p(√p)/Q_p, x=√p, G_m and G_a; identity extension | G_m trace=−p since norm(1+√p)=1−p; G_a trace=0. Identity trace=x. In towers each embedding occurs exactly once on both sides. | Pass, including separable nonnormal extensions by embedding sums. |
| 9.2 tame trace | p=5, x over Ψ_s | D_s(x)=[6]x; section [1/6] gives D_s([1/6]x)=x; normalized projector gives x, unlike D_s. | Pass; no division by a nonunit. |
| 9.3 headline square | p=5,s=0; constant base point | Both routes have degree 6·5=5·6=30 and send x to [30]x; arbitrary x is summed over the same 30 embeddings. | Pass; no existence of a nonzero compatible system is asserted. |
| Native substitution convention | Z coefficients, substitute 1 into polynomial X | Constant coefficient 1 is not nilpotent; polynomial substitution still gives 1, not 0. | R16. |

### Lean acceptance test, signatures and padding

The pins inspected were Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5. These differ from the first review's pins.

I ran the specified lake env lean command on packages/LubinTateFormalModulesAndQuasiCanonicalLifts/Suggested.lean from the content checkout. Exit status was 0, with exactly five “declaration uses sorry” warnings, at lines 77, 91, 112, 127 and 149, and no other warning. All three required TauCeti object files were present; no build was needed. The file has one Mathlib import and three individually used TauCeti imports, no set_option, no sorry-valued data, no admitted example and no lemma declaration. The module header is valid.

A scratch copy appended #check @name for every actual declaration and elaborated successfully. There are seven actual declarations, not eight: the generated inventory's extra “it” comes from prose in a docstring. Both predicates retain CommRing and IsLocalRing. Both Layer 1 theorems retain IsDomain, IsDiscreteValuationRing, finite residue field and an irreducible π. The division-field and norm theorems retain the nonarchimedean local-field and CharZero hypotheses; the former retains m≥1 and the two root/nonroot conditions. The elliptic theorem retains primality, s=±1, unit discriminant and the signed point count. No binder was lost; no declaration was changed.

For every one of the five sorried theorems, a separate scratch copy of the same file tried the one-tactic alternatives simp, rfl, infer_instance and exact? (the library-lemma search), each under a solve block so a tactic leaving goals could not count as success. All five final goals remained unsolved; exact? supplied no closing library lemma. There were no sibling probe theorems with duplicate statements to give false positive hits. None of the five is a boundary example or a definition restatement. No padding finding is raised.

| Headline from the summary or deep target | Acceptance-test disposition |
|---|---|
| Lubin–Tate existence, uniqueness and interpolation | exists_formalGroup_of_isLubinTateSeries and existsUnique_lubinTate_intertwiner, lines 77 and 91. Native FormalGroup, real coefficient predicates, full Layer 1 generality. |
| Primitive division-field degree and splitting | finrank_adjoin_primitive_lubinTate_root, line 112; polynomial presentation explicitly delimited in README §2.3. R02 concerns ownership, not a false signature. |
| Division-field norm group | artinMap_fixes_lubinTate_roots_iff, line 127; actual pinned arithmetic Artin map and unit filtration. R14 is a docstring boundary error. |
| Supersingular elliptic formal group with scalar Frobenius | exists_lubinTate_endomorphism_formalGroup, line 149; all primes including 2, actual Weierstrass curve and discriminant. |
| Character unit formula, Galois isomorphism and Tate-module freeness | Named in the module docstring; the stated reason about evaluated points is false at these pins, R06. The remaining O-action/torsion/Tate data must be distinguished from the available point carrier. |
| Marked finite-height representability | Named in the module docstring; its claim that formal homomorphisms/isomorphisms are missing is false, R06. The action-sensitive marked functor remains the relevant obstacle. |
| Honda integrality and type comparison | Named in the module docstring; the Frobenius-skew operator construction is a substantial missing object, not replaced by a free predicate. |
| Quasi-canonical classification, fields, degrees and uniformizer modulus | Named in the module docstring; lattice-quotient and marked-moduli constructions are required. No surrogate theorem was inserted. |
| BKO field comparisons and trace-compatible square | Named in the module docstring; the specified towers and their comparisons are required. General evaluated points now exist, but do not themselves define those fields. |

I found no additional demonstrably statable omitted headline beyond the stale reasoning requiring R06's re-audit. This is not an endorsement of the old claim that the relevant native carriers are absent. All seven names presented as this roadmap's declarations in the README resolve to the file. The mathematical symbols in code spans are notation, not additional claimed declarations.

### Pinned declarations opened

Paths in this table are library-relative. The observations include hypotheses, not merely name hits.

| Objects | Evidence at the inspected pins |
|---|---|
| FormalGroup, IsComm, Point, map | Mathlib/RingTheory/FormalGroup/Basic.lean:57,75,127,185. FormalGroup stores the law, constant/linear coefficients and associativity; it does not bundle commutativity or a specified inverse. Point stores power series satisfying HasSubst, not evaluated field points. |
| HasSubst and substitution | Mathlib/RingTheory/PowerSeries/Substitution.lean:40,158; Mathlib/RingTheory/MvPowerSeries/Substitution.lean:77,217,229. Nilpotent constant terms, and finite-support conditions for the multivariable family, are retained. R16 records the polynomial exception to the advertised junk-value rule. |
| Substitution inverses | Mathlib/RingTheory/PowerSeries/Substitution.lean:457,511,543,567: substInv, subst_substInv_right, subst_substInv_left, substInvOfIsUnit. The hypotheses include zero constant term and invertibility/unit status of the linear coefficient. |
| Evaluation and coefficient map | Mathlib/RingTheory/PowerSeries/Evaluation.lean:60,157,197: HasEval, eval₂Hom, comp_eval₂; PowerSeries/Basic.lean:467: map. Evaluation carries continuity and complete Hausdorff linearly topologized target hypotheses. |
| Weierstrass preparation and quotient | Mathlib/RingTheory/PowerSeries/WeierstrassPreparation.lean:689,814: IsWeierstrassFactorizationAt.algEquivQuotient and exists_isWeierstrassFactorization. The preparation assumption is nonzero reduction and maximal-ideal adic completeness. |
| Local fields, DVR and residues | Mathlib/NumberTheory/LocalField/Basic.lean:46; RingTheory/DiscreteValuationRing/Basic.lean:56; RingTheory/Valuation/Integers.lean:32; RingTheory/LocalRing/ResidueField/Defs.lean:28,36. DVR includes the nonfield condition; the local-field class includes nontrivial valuation and local compactness. |
| Polynomial and extension carriers | Mathlib/Algebra/Polynomial/Degree/Defs.lean:59, Monic; FieldTheory/IsAlgClosed/AlgebraicClosure.lean:127; FieldTheory/IntermediateField/Adjoin/Defs.lean:34; FieldTheory/AbsoluteGaloisGroup.lean:42,101. The abelianization is topological; the algebraic closure has characteristic-zero transport used by the signatures. |
| Witt and finite fields; elliptic data | Mathlib/RingTheory/WittVector/Defs.lean:52; FieldTheory/Finite/GaloisField.lean:68; AlgebraicGeometry/EllipticCurve/Weierstrass.lean:131,230; Affine/Point.lean:477. These supply WittVector, GaloisField, discriminant, curve map and affine point carrier, respectively. |
| Krasner and norm | Mathlib/Analysis/Normed/Field/Krasner.lean:56,63; Analysis/Normed/Unbundled/SpectralNorm.lean:381. Krasner retains separability, splitting and strict conjugate-distance inequalities. |
| Adic completions | Mathlib/RingTheory/DedekindDomain/AdicValuation/Completion.lean:51,294 defines adicCompletion and adicCompletionIntegers. The former AdicValuation.lean path is now a compatibility import, not the location of the declarations. |
| Elliptic formal law | TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean:58,75,83: formalGroup, map_formalGroup, isComm_formalGroup. The chosen parameter is −x/y. |
| Elliptic evaluated points and maps | TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/AdicPoint.lean:69; Point/Hom.lean:149; Point/AdicCompletion.lean:273,292; Point/Range.lean:158. formalPointHom requires its auxiliary-point hypothesis; the adic-completion version discharges it. The displayed range is the identity plus points with x-coordinate of valuation greater than 1, the kernel-of-reduction criterion. |
| Arithmetic Artin map | TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:114,132,205,345,397: artinMap, artinMap_restrict, exists_artinMap_mem_iff, artinMap_norm, artinMap_congr. Finite restrictions, open-subgroup norm contracts and continuity/embedding compatibility are genuine hypotheses. |
| Unit filtration, Teichmüller, approximation | TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean:104,145; RingTheory/Henselian/Teichmuller.lean:94; NumberTheory/NumberField/Global/Approximation/Weak.lean:208. Teichmüller uses a Henselian local ring and finite residue field; weak approximation concerns finite sets of places and actual completions. |
| New general points and morphisms | TauCeti/RingTheory/FormalGroup/Hom.lean:137,351; TopNilpotentPoint/Basic.lean:85; TopNilpotentPoint/Hom.lean:42,146. These refute the absence claims, R06. |
| Existing analytic and rigidity results | TauCeti/RingTheory/FormalGroup/Logarithm/Convergence.lean:44,58,64,71; Exponential/Padic.lean:45,59,76; Rigidity.lean:186,229. These directly supply the components identified in R05. |

Object searches covered formal laws/actions, evaluated points, finite-height rigidity, logarithms, torsion fields, formal-module deformations and quasi-canonical lattices, not just the seven proposed names. The supplied library near-match inventory was treated as leads and its candidate source modules were opened. The substitution identities, Weierstrass-divisor predicates, Witt-vector operations, simple-adjoin evaluation identities, cyclotomic inclusions, field-norm product, Hilbert 90 and formal-étaleness results have different or narrower conclusions; none closes the five headlines. Generated congruence/instance hits were traced to their enclosing definitions. That inventory does not supersede the current native files above. Searching the five proposed theorem names with roadmaps grep --lean-only returned no match on main or at any open roadmap head, so no fully qualified name collision was found.

### Supplier and open-work audit

I read the main-branch shapes and relevant contracts of BordismFormalGroups, EllipticCurves and ClassFieldTheory, as well as the relevant ModularCurves and completed LocalFieldsRamification sections. Current open heads were read through the provided roadmaps tooling. The board-packages index was read before any absence claim. Its listed branch packages do not supply a competing formal-module construction.

| Citation in this package | Resolved evidence |
|---|---|
| BordismFormalGroups §F1 and §F5 | TauCetiRoadmap/BordismFormalGroups/README.md:46 and 543: formal-group algebra and the perfect-field universal deformation. The present package's O-action and arbitrary specified coefficient base are a genuine extension of that contract. Current pinned implementations still need to replace already proved subtargets, R05–R06. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | Pull request #879, TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:591 (R07.1.1), 988 (R07.1.8), 1160 (R07.1.12), 1220 (R07.1.13), 1737 (R07.1.20), 1780 (R07.1.20a), 3236,3289,3326 (R07.2.6–R07.2.8). The four resolver leads are present as planned supplier declarations, not missing pinned constants. Mixed-characteristic DVR quotient and henselian characteristic-zero Tate-module hypotheses match the uses. |
| EllipticCurves Layers 1 and 3 | TauCetiRoadmap/EllipticCurves/README.md:423,637 and its Layer 3 finite-field Frobenius targets: isogenies, formal group/logarithm/points, degree and Frobenius polynomial. The four formal-group milestone domains are distinct and preserved. |
| ModularCurves §§0B,0C,2B,7C–7F | TauCetiRoadmap/ModularCurves/README.md:6880,7790,12432,24177,24277,24427,25287. Quotients, formal completion, algebraically closed-residue elliptic deformations, p-divisible groups and Serre–Tate equivalence resolve. The package restricts the elliptic comparisons to those domains. |
| ClassFieldTheory Layers 6–8 and old §2.6 | TauCetiRoadmap/ClassFieldTheory/README.md:1150,1204,1466. The explicit former-numbering table at line 267 maps §2.6 to Conventions C.6, so this is not supplier drift. Arithmetic Frobenius and the inverse unit convention agree with the computed Q_5 example. |
| LocalFieldsRamification Layers 0–2 | Completed/LocalFieldsRamification/README.md, including Layer 2 at line 576: finite local-field algebra, units, logarithms and algebraic maximal unramified extension. Completion is separately owned, as repaired. |
| RamificationOfCompleteDiscretelyValuedFields §4a.3 | TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/README.md:1185: completed maximal unramified extension, ramification index 1, algebraically closed residue field, finite-separable-extension equivalence and inertia identification. It is earlier in ORDER. |
| Additional overlapping owners | RelativeFarguesFontaine #1209 §2.5; EndoscopicTransferAndUnitaryTraceComparison #999 §§10.2,12.3; GrossZagierAndArithmeticHeights #1487 §7.2. Concrete conflicting files and lines are in R02–R04. ORDER positions are 127,149,340 respectively, before this package at 344. |
| Closest open work | AnticyclotomicLocalUnits #1692 explicitly consumes this formal-module/lattice/tower theory and owns the local points, Hecke recurrence and unit/Iwasawa application. FunctionFieldArithmetic #1474 §4.1 extends the local-field story in equal characteristic. ComplexMultiplicationAndExplicitReciprocity #1254 and its Part II concern global reciprocity; EllipticCurveModularityWild3Adic #1484 concerns different local elliptic arithmetic. Their inspected scopes do not justify replanning the present arithmetic constructions. |
| Geometric comparison | VectorBundlesAndIsocrystals #1205, Layer 5, constructs the Lubin–Tate universal-cover/sections comparison. This is a geometric comparison, not another proof of the elementary interpolation signature. RelativeFarguesFontaine's explicit finite tower construction is a separate, actual overlap, R02. |

The supplied overlaps report has no conflicting edits of this roadmap, dropped cited IDs, or IDs defined only by an open revision. I found no additional such event in the inspected heads. Existing old-numbering mappings were respected. No dependency was inferred from a mere vocabulary match. Ownership against open pull requests whose files were not supplied or accessible through the supplied head index was not checked; no additional heads were sought outside that scope.

The required dependency command completed with exit status 0 and exactly:

    depcheck: 236 roadmaps, 2134 edges, 0 problem(s)

There was no UPWARD, CYCLE or moved line. All currently declared supplier edges point earlier or to main/completed roadmaps. This does not detect undeclared overlapping ownership, which is why R02–R04 remain. The plan's gaps list is empty, and no acceptance is conditional on a supplier gap. No forbidden supplier is cited.

### Shape and principles

The README has the required title, summary, scope, conventions, exact contracts, build explanation, ten mathematical layers, examples and dependencies at the end of each layer, downstream consumers and references. Each of its 50 targets has a Needs line. The definitions retain at least three Checks; incorrect ones are reported individually. R15 records the missing API-list form for the Tate-module carrier.

The organization combines coefficient actions, arithmetic torsion, deformation theory, Honda comparisons, lattices, CM moduli and trace towers. It does not say it follows one source, and no layer is named after a source chapter. The layer dependencies explain the lattice-to-moduli-to-tower order. No source-order finding is raised merely because the two Honda layers are adjacent.

Layer 1 retains both characteristics and noncomplete DVRs. The BKO restrictions p≥5 and unramified quadratic Φ are confined to that named application; the general quadratic theory retains p=2 and ramification. Equal-characteristic local-field developments are assigned to FunctionFieldArithmetic rather than excluded from the overall library. I found no computational algorithm, copied source passage, route-specific replacement of a general theorem, sorry-valued datum or set_option. The ownership duplications are the principle failures recorded above. No claim of complete independence from all existing roadmaps is made.

The README and Lean contain no machine paths, pull-request numbers, HTML anchors, dated handoff narrative or LaTeX-delimited mathematics. Metadata remains the appropriate math.NT topic. No package input, manifest entry, library or merge-order file was changed. The only repository writes are this report and review.json.

## Not verifiable

- LT65, Formal complex multiplication in local fields (1965), remains settled as uncertified. Its Lemma 1, Theorems 1–3, Lemma 2 and p.383 logarithm discussion were not text-certified. No duplicate source key or renewed request was made.
- VZ07's stated normal-form and deformation theorems use the source's residue-field setting. The package's action-sensitive extension to arbitrary imperfect k is not directly certified by those theorem statements. LT66 verifies the ordinary formal-group analogue; the finite-jet descent route is specified here and has consistent tangent controls, but this review does not claim a complete proof of that extension from the extracted source alone.
- BKO's formal sums certify the tower application of §§9.1–9.3, not a separately printed theorem for every finite separable nonnormal extension. That extension was assessed by the package's embedding-sum argument and explicit trace controls.
- The upstream ownership review is limited to main, the board index and the open heads available through the supplied tooling. The downstream name NonordinaryCMSpecialValues did not resolve through that tooling; it is not used as a supplier or prerequisite, and no assertion that it exists nowhere is made.

## Source issues

- **Misprint** in BKO21 at Lemma 5.1(ii), printed p.956: the source says trace 2sp corresponds to type p+sT² and Lubin–Tate parameter −sp; it should be type p−sT² and parameter sp; affects a stated result.
- **Misprint** in BKO21 at the proof of Theorem 5.5(ii), printed p.959: the source says the outward representatives use rational factors 1+ap^s, which give the same lattice; it should be generators p^−s−1t+(a/p)αt with (1,α) an integral basis, modulo T; affects the proof.
- **Misprint** in BKO21 at the proof of Theorem 5.5(ii), printed p.959: the source says the outward neighbours correspond to conjugates of x_s; it should be conjugates of x_(s+1), as the subsequent Hecke formula uses; affects the proof.
- **Misprint** in BKO21 at §2, printed p.948: the source says the anticyclotomic tower is pro-p over Q_p; it should be pro-p over Φ and dihedral over Q_p, with quotient of order two; affects a stated result.
