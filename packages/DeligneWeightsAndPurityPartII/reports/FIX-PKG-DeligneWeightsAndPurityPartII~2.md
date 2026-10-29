# Repair report: DeligneWeightsAndPurityPartII

## F01 (P1) — applied

Two ownerless plan gaps → retired records. The original texts remain settled uncertified in the manifest; the four derived inputs remain owned targets in README §3.4. Added identity-disc, disjoint-disc and Z = X descent Checks. Only the top-level `gaps` member changed in `design/plan.json`; the remaining gap has all four required fields and a matching exact contract.

## F02 (P2) — applied

Missing geometric Galois restriction → import EtaleCohomologyFoundations §§F.2.2, F.4.3–F.4.6, especially `VanishingCycles.adicFunctoriality`. Removed the redundant gap. Updated the exact contract, §§0.8–0.10, 1.1–1.2, 4.2 Needs and layer dependencies, retaining coefficient descent and realization hypotheses. Added ℙ¹ residue-extension and inseparable-extension Checks. Evidence: supplier §§F.2.2 and F.4.6 explicitly include these comparisons.

## F03 (P2) — applied

Missing ample self-intersection positivity → import AbelianSchemesAndArithmeticModuli §A2.7 `ampleIntersectionPositive`, specializing all bundles to H. Removed the gap; updated scope, exact contracts, §§4.1/4.3 Needs and Layer 4 dependencies. SchemeAndStackFoundations retains pushforward, degree and the Chern projection formula. Added degree 1, degree 2 and inseparable zero-dimensional degree Checks. The earlier supplier states positivity over any field.

## F04 (P2) — applied

New componentwise action, extension-degree equivalence and residue isomorphism → supplied constructions from PerfectoidSpaces §§P1.6, P1.15, P3.7–P3.8 and AdicEtaleGeometry §A1.0.5. Adjusted scope, exact contracts and §§2.2–2.3; β names their composite. Retained finite-k coordinate calculations and prime-to-p Tate/marked comparisons. Evidence: the suppliers specify sharp naturality, `tiltField.residueFieldEquiv`, degree preservation and the componentwise action explicitly.

## F05 (P2) — applied

Characteristic-zero, fixed-n endpoint → Ito's full constant-coefficient theorem: one radius for all invertible n, all degrees and either characteristic. Kept Huber's locally constant-sheaf theorem separately scoped. Added owned uniform annular, comparison, bounds/descent and smooth-principal inputs; propagated the endpoint through §3.6, downstream prose, source locators and Lean docstring. Evidence: ITO20 line 1003; proof inputs at lines 124, 1673, 1738–2053.

## F06 (P1) — applied

Two source quotations → authorial computed Checks. Section 2.2 tests identity, roots and degree; §2.4 computes matching inertia/Frobenius, scalar 1 and the q = 2 string with eigenvalues (1,2), monodromy N(e₁) = e₀ and weights (0,2). The locator SCH12 line 2598 remains. Neither copied phrase occurs in the authored README.

## F07 (P3) — applied

Parent §7.16 → §7.15 in scope; §0.11 as direct-sum locator → §0.9 in §0.7 Needs. The supplier headings and statements confirm both corrections. Powers still cite §§0.11–0.12. Computed witnesses: diag(1,q) has scalar weights {0,2}; ℙ¹ has weight 2 in H², with eigenvalue q.

## F08 (P3) — applied

Two incomplete construction descriptions → prose coordinate/composite APIs and four/three discriminating Check bullets in §§2.1/2.2. Included the ramified ℚ₂(√2) quotient, nonzero square-zero root, norm −ϖ versus sharp ϖ, identity and exponent-two action on μ₃, extension degree and finite-stage nonperfectoid failure. These remain README Checks; no Lean padding was added. The inherited constructions are explicitly attributed to their suppliers.

## F09 (P3) — applied

Cup compatibility after its consumer → §3.5 cup compatibility followed by §3.6 Galois-stable neighbourhood. Updated scope, §3.6 Needs, §§4.1/4.2/4.6 references and the module docstring. The identity-disc Check gives ab on both sides, unit 1 and 2·2 = 1 modulo 3, also for the inverse comparison. No theorem hypothesis changed because of the move.

## Source and ownership verification

The content checkout is main e9512ca8. Its manifest agrees with the actual library revisions: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The review's older checkout description was not used as evidence of the checked pin.

Read the main AnalyticToricGeometry and LocalFieldsRamification roadmaps for form, and the relevant PerfectoidSpaces sections. Supplier resolution used main where present and the roadmap service for new roadmap heads. Object searches with `roadmaps grep` covered main and indexed open heads; local searches also covered board package READMEs/designs. The searches included geometric action/restriction, ample intersections, componentwise tilting, sliced nearby cycles, uniform unipotence, cohomological descent and tubular neighbourhoods. No new generic carrier is declared here.

| Resolved supplier | Inspected contract and consequence |
| --- | --- |
| TauCetiRoadmap/EtaleCohomologyFoundations/README.md §§F.2.2, F.4.3–F.4.6 | Separably closed extension invariance and `VanishingCycles.adicFunctoriality`, including descent, completeness, continuous actions, restriction and closure change. This supplies F02. |
| TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md §A2.7 | `ampleIntersectionPositive` for ample bundles on proper schemes over any field; this supplies F03. Only nonempty integral W is used here. |
| TauCetiRoadmap/PerfectoidSpaces/README.md §§P1.6, P1.15, P3.7–P3.8 | Sharp naturality, residue comparison, finite-extension degree preservation and componentwise action; these supply F04. P1.32a gives the parent Kummer example. |
| TauCetiRoadmap/DeligneWeightsAndPurity/README.md §§0.7, 0.9, 0.11–0.12, 0.19, 5.11, 7.15 | Scalar purity, direct sums, powers, arithmetic comparison, curve monodromy and proper-smooth purity; this verifies F07 and the retained weight inputs. |
| TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md §§1.5, 2.1a, 2.4, 2.6 | Coefficient descent, tame comparison, local monodromy, centered filtration, `WeilDeligneRep.IsWeilNumber` and `WeilDeligneRep.IsPureEnd`. The last two names are planned supplier names, not pinned declarations. |
| TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md §§0.1, 1.1–1.5 | Trait comparison, quasi-unipotent nearby cycles and sheaf-theoretic monodromy filtration. |
| TauCetiRoadmap/AdicEtaleGeometry/README.md §A1.0.5 | Henselian completion comparison, including the topologically henselian Tate form. |
| TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md §§R07.4.1–R07.4.3 | Kummer field of norms and its signed coordinate at p = 2. |
| TauCetiRoadmap/AdicSpacesPartII/README.md §§R0.19.1–R0.19.2, R1.3–R1.6 | Constructible topology and analytification/base-change/properness. |
| TauCetiRoadmap/AdicSpacesPartIII/README.md §§R2.3–R2.4, R2.8, R2.10 | Generic fibres, equation tubes, proper-model comparison and section domains. |
| TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md §§1.1–1.5, 8.2–8.5, 9.6, 10.1–10.4, 11.1 | Module-sheaf cohomology, supports, continuity, proper operations, smooth duality and radial calculations. The uniform annular theorem and analytic Čech/cone comparisons are additional targets here. The explicitly named automorphism-comparison gap remains. |
| TauCetiRoadmap/SchemeAndStackFoundations/README.md §§0.7–0.9, 0.23a, 4.11, 4.16, 4.19, 5.2–5.3 | Components, approximation, inseparable invariance, blow-ups/alterations and Chow/Chern degree formulas. These constructions remain imported. |
| TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md §§0.5–0.6, 1.3, 3.4–3.7 | Rational pairings, trace-degree comparison and top Tate character. |
| packages/AnalyticToricGeometryPartII/design/README.md NT.0–NT.6 | The available design includes projection/open-topos field naturality, ambient cohomology and approximation. The roadmap service has no package/main/open-head copy of this supplier. This round verifies the available design, without claiming to verify a later package version. |

The new uniform targets belong here because the package already owns the general cohomological neighbourhood theorem; the existing analytic supplier supplies operations and constant radial calculations but no coefficient-uniform annular direct-image or neighbourhood theorem. The search did not identify another owner for these refinements. Generic alterations, ordinary base change and duality remain imports. No notion moved from a later supplier. Ownership against the exposed new-roadmap pull requests was checked through the service; no unexposed head files are claimed read.

| Legal cached source locator | Evidence read |
| --- | --- |
| SCH12 line 2511, line 2518, line 2532, line 2547 | Positive Kummer character, monodromy normalization, centered filtration and finite-extension reduction. |
| SCH12 line 2571, line 2589, line 2592, line 2598 | Curve theorem, toric endpoint, completed tower and the two source phrases replaced in F06. |
| SCH12 line 2604, line 2622, line 2630, line 2636, line 2652 | Algebraic–adic comparison, cup products, inverse comparison, top isomorphism and splitting. |
| ITO20 line 99, line 103, line 974 | Degreewise local constancy, characteristic-zero Kummer input and fixed locally constant-sheaf neighbourhood theorem. |
| ITO20 line 1003, line 1030 | Full uniform constant-coefficient theorem and proper geometric application. |
| ITO20 line 124, line 1481, line 1586 | Uniform punctured-disc proper direct images and annular trivializations; the radius is uniform, the covering need not be. |
| ITO20 line 1673, line 1738, line 1774, line 1813 | Annular sheaf comparison, smooth principal case, pseudo-adic descent and the truncated-cone descent criterion. |
| ITO20 line 1876, line 1915, line 1928, line 1950, line 1973 | Coefficient-independent cohomological bounds, alteration reduction including inseparable parameter change, and smooth-principal proof using proper direct images and duality. |
| DEL80 line 1528; DJ96 line 597, line 604 | Local graded weights and alteration with finite constant-field extension. |

No new work needed fetching. The ITO20 manifest entry now includes the additional locators, keeping its existing key, hash and legal provenance. HUB96, HUB98 and LUT93 remain settled uncertified; no request was made for them. Their recalled formulations were read in ITO20 and SCH12, without claiming to have read the originals.

## Adversarial mathematics pass

Each row gives explicit values for an independently tested statement or API assertion. Let Λ = ℤ/n with positive n invertible in the valuation ring unless indicated. T(q) has N(e₁) = e₀, N(e₀) = 0 and Φ = diag(1,q). These are mathematical computations and boundary tests, supplemented by the source and proof-route checks above; they are not formal proofs of the planned theorems.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: geometric Frobenius relation | T(2), T(3) | NΦ(e₁) = 2e₀ = 2ΦN(e₁); respectively 3e₀ = 3ΦN(e₁). ΦNΦ⁻¹(e₁) = e₀/2, e₀/3. | Sign agrees | None |
| Conventions: weights, Tate twist, zero | T(2), its twist, V = 0 | Grades −1,1 have eigenvalues (1,2), weights (0,2), center 1; twist gives (1/2,1), weights (−2,0), center −1; zero has no eigenvalues. | Consistent | None |
| Conventions: excluded q | q = 1; ℓ = p | 1^{w/2} = 1 for every w; pro-p Kummer tower kills the p coordinate, whereas the ℓ ≠ p coordinate survives. | Required exclusions | Retained |
| §0.1 datum and twist | ℤ₃ ⋊ ℤ̂, Q = 2, t(x) = x | t(Φ(1)Φ⁻¹) = 1/2 = Q⁻¹; using arithmetic Φ gives 2 ≠ 1/2. | Distinguishes marking | None |
| §0.1 identity Frobenius failure | Fr = I, Q = 2, t(σ) = 1 | Twist would say 1 = 1/2. | Rejected | None |
| §0.1 identity, composition, inverse and rescaling | Constants 2 and 3 | Identity constant 1; composite 6; inverse of 2 is 1/2; (1/2)·2 = 1. | All directions agree | None |
| §0.1 profiniteness/nonvanishing | ℤ₃ inertia; discrete ℤ[1/2] | Open 9ℤ₃ has tame image 9ℤ₃ ≠ 0; discrete open {0} has image 0 and exp(0N) = 1 for all N. | Discrete model excluded | None |
| §0.2 Kummer coordinate | σ(ϖ^{1/ℓⁿ}) = ζϖ^{1/ℓⁿ} | Ratio is ζ, coordinate 1 rather than −1. | Positive convention | None |
| §0.2 finite extensions | e = 2, f = 1; e = 1, f = 3 | Restricted t = 2t′, datum scalar 1/2; unramified Q′ = q³ and scalar 1. | Wild degree also allowed | None |
| §0.3 restriction and transitivity | Full subgroup; residue indices 2 then 3 | Q → Q → Q; Q → Q² → Q⁶ = Q^{2·3}; tame character is the same restriction. | Both constructions agree | None |
| §0.3 inadmissible restrictions | H′ = I; ℓ-root tower | Residue image 0 in the first case; tame image 0 in the second. Neither has the required restricted datum. | Nonexamples excluded | None |
| §0.4 purity and filtration | T(2); N = 0 on same eigenvalues | Nonzero N has grades −1,1, eigenvalues 1,2 and weights 0,2; N = 0 puts both in grade 0 and would require simultaneously w = 0 and w = 2. | Monodromy essential | None |
| §0.4 exponential and uniqueness | N² = 0, t(σ) = 3 | exp(3N) = 1 + 3N; log(1 + 3N)/3 = N. With t = 0 the logarithm gives 0 for every N. | Nonzero tame image needed | None |
| §0.4 rescaling and scalar extension | t → 2t; E → E′ | (2t)(N/2) = tN; ker(N/2) = ker N, im(N/2) = im N; scalar extension keeps eigenvalues (1,2). | Filtration and weight agree | None |
| §0.4 Frobenius lifts with finite nonabelian inertia | Grade with finite image S₃, A = 1, τ a 3-cycle | (Aτ)⁶ = 1 = A⁶; eigenvalues 1,ζ₃,ζ₃² all have weight 0. | Finite-power test survives noncommutativity | None |
| §0.4 direct sums and finite inertia | Two trivial lines; swap action C₂ | Eigenvalues (1,1) or (1,−1), N = 0; all absolute values 1. | Pure of weight 0 | None |
| §0.4 tensor law | T(2) ⊗ T(2) | Grade weights (0,2,2,4) with eigenvalues (1,2,2,4); central weight 2 = 1 + 1. | Convolution agrees | None |
| §0.4 dual and explicit twist | T(2)∨; T(2)(1) | Dual eigenvalues (1,1/2), grade weights (0,−2), center −1; twist eigenvalues (1/2,1), center −1 = 1−2. | Correct dual/twist signs | None |
| §0.5 subgroup detection, both directions | T(2), residue index 3 | Eigenvalues (1,8), base 8, weights (0,2), center 1; replacing base 8 by 2 would incorrectly give weight 6 for 8. | Purity reflected | None |
| §0.6 transport, both directions | Scalar 2; inverse scalar 1/2 | Pulled-back operator 2N′; inverse sends it to (1/2)(2N′) = N′. | Scalar direction correct | None |
| §0.7 summands and subobjects | T(2) ⊕ T(2); ker N in T(2) | Summand grade multiplicities (2,2), central weight 1; ker N eigenvalue 1 has weight 0 and lacks stable complement. | Subobject distinction holds | None |
| §0.8 WMC on native geometric objects | Point, empty variety, two points, ℙ² | Point H⁰ = E, Φ = 1; empty groups 0; swapped points eigenvalues ±1; ℙ² eigenvalues in H⁰,H²,H⁴ are 1,q,q², weights 0,2,4. | All degrees/components agree | None |
| §0.8 local factor consequence | T(q); H²(ℙ¹) | Invariants of T(q) have eigenvalue 1, pole real part 0 ≤ 1/2; H²(ℙ¹) has eigenvalue q, pole 1 = 2/2. | Upper bound consistent | None |
| §0.9 field comparison | ℙ¹, residue degree f; purely inseparable extension | Eigenvalues (1,q) → (1,qᶠ), comparison coordinates (1,1); inseparable dimensions remain (1,1). | Existing restriction suffices | Added Checks/import |
| §0.10 good reduction | ℙ¹ model; Tate elliptic curve | ℙ¹ has N = 0, Φ eigenvalues 1,q; Tate H¹ has rank(N) = 1. | Good-reduction hypothesis separates cases | None |
| §1.1 curve theorem | Legendre degeneration, good point, degree-a closed point | Degeneration has grades of weights (0,2); good H¹ only grade 0 weight 1; closed-point base qᵃ gives moduli (1,qᵃ). | No bad-place omission | None |
| §1.2 every function-field place | ℙ¹ over 𝔽_q(t) | At degree-f place H⁰,H² have eigenvalues 1,qᶠ and weights 0,2, including at infinity. | All places retained | Supplier citation updated |
| §2.1 finite stages | p = 2,3; stage n = 0,1,2 | Degrees are (1,2,4) or (1,3,9); normalized value steps (1,1/2,1/4) or (1,1/3,1/9). Each finite-stage value group is discrete. | Finite stages not perfectoid | API/Checks added |
| §2.1 ramified base quotient | k = ℚ₂(√2), ϖ = √2 | First stage degree 2; v_k(ϖ₁) = 1/2 < 1, so [ϖ₁] ≠ 0 modulo ϖ, but [ϖ₁]² = 0. Matches nonzero T^{1/2} with square T = 0. | Reduced quotient rejected | Check added |
| §2.1 Frobenius and coordinate | Finite Teichmüller sum ∑[a_j]ϖₙʲ | Its root candidate ∑[a_j^{1/p}]ϖₙ₊₁ʲ has pth power equal to the sum modulo p; t♯ = ϖ. | Surjectivity and chosen sharp agree | API added |
| §2.1 p = 2 norm/sign | First quadratic tower step | Norm(√ϖ) = −ϖ while t♯ = ϖ; both reduce to ϖ modulo 2, and −ϖ ≠ ϖ in characteristic zero. | Unsigned norm model rejected | Check added |
| §2.1 completion and density | |t| = 1/2, truncated t-series | Tail beginning at tᴺ has norm at most 2⁻ᴺ → 0; rational t-polynomials lie in 𝔽_q(t)^perf. | Coordinate dense subfield | Retained |
| §2.2 composite β and identities | Identity; σ(ζ₃) = ζ₃² at p = 2 | β(1)t = t; β(σ)ζ₃♭ = (ζ₃♭)² ≠ ζ₃♭; sharp gives ϖ and ζ₃² respectively. | Neither zero nor identity-only map works | Imported API/Checks |
| §2.2 extension restriction | Unramified quadratic L/K | [L:K] = [L♭:K♭] = 2; both residue cardinalities q²; the stabilizer corresponds to G_L. | Supplier degree equivalence preserved | Imported |
| §2.3 residue and prime-to-p Tate coordinates | p = 2, μ₃; mixed-characteristic μ₂ | Residue and sharp preserve 1; μ₃ has 3 elements on each side, exponent action 2 on both; μ₂ has 1 element in C♭ and 2 in C. | Prime-to-p condition essential | Residue construction imported |
| §2.3 full sharp versus torsion | ε = (1,ζ_p,ζ_{p²},…) | ε♯ = 1 while ε ≠ 1 and has infinite order; it is not a nontrivial p-power root in characteristic p. | No invalid injectivity inference | None |
| §2.4 marked comparison | L = K, q = 2, k″ = 𝔽₂((t)) | Both Q = 2, both tame coordinates agree; scalar 1 sends N to N, eigenvalues (1,2) and weights (0,2). | Marking checked directly | Quotation replaced |
| §2.4 inseparable local parameter | k″ = 𝔽_q((t^{1/p})), p = 2, ℓ = 3 | v(t) = 2, t_k = 2t_k″∘β; scalar 1/2 pulls 2N to N. | Inverse scalar correct | Check strengthened |
| §2.5 tilting transfer | Pure ambient T(2) ⊕ T(2); nonsummand ker N | Stable first summand has center 1; ker N has eigenvalue 1 and weight 0. | Complement hypothesis needed | None |
| §3.1 ideal tube definition | Z = V(T), X, ∅ | Radii ε give {|T| ≤ ε}, whole disc, and empty set for ε < 1 respectively. | Zero/unit ideals agree | None |
| §3.1 change of generators and model | (T,T²); (ϖT); ε = |ϖ|² | (T,T²) gives |T| ≤ ε when ε < 1; (ϖT) gives |T| ≤ |ϖ|, whereas (T) gives |T| ≤ |ϖ|². | Ideal invariance does not erase model | None |
| §3.1 monotonicity, intersection, base change | ε′ = |ϖ|² ≤ ε = |ϖ|; T = ϖ | Point belongs to large disc, not small; intersection of all discs is T = 0; pulling coefficients to C leaves these inequalities unchanged. | Directions consistent | None |
| §3.2 direct images | Identity disc; two copies | R⁰ = Λ or Λ², higher Rʲ = 0; one may choose radius 1 in every degree. | No fibre-stalk shortcut used | Clarified endpoint distinction |
| §3.3 Riemann existence | T ↦ T⁶ in characteristic zero; Artin–Schreier in characteristic 2 | First pullback trivializes the covering, even when residue characteristic divides 6; second has wild order 2 which odd Kummer degrees cannot kill. | Characteristic zero retained | None |
| §3.4 fixed-sheaf theorem | Constant Λ, Λ² on disc; n = 1 | Tube/origin H⁰ equal Λ, Λ² or 0 respectively; higher groups zero. | Fixed F,n dependence permitted | Separately scoped target |
| §3.4 blow-up descent | Z = X, identity disc | Bl_X(X) = ∅ gives H⁰ = 0; adjoining Z supplies identity and restores H⁰ = Λ. Augmented identity Čech cohomology has Λ in degree 0 and 0 in positive degrees. | Surjectivity repaired by cover | Ownership retained; Check added |
| §3.4 bounded direct-image amplitude | Identity disc; disjoint pair | Rʲ = 0 for j > 0, so b = 0; R⁰ = Λ or Λ². | Bound independent of degree | Ownership retained; Check added |
| §3.4 disc stabilization | Smaller identity discs | Restriction on H⁰ is a ↦ a or (a,b) ↦ (a,b), with higher groups 0 → 0. | One radius works | Ownership retained; Check added |
| §3.4 closed-support continuity | Shrinking disc to origin | Colimit of identity Λ maps is Λ, mapping identically to H⁰(origin) = Λ; positive degrees 0. | Site comparison has right direction | Ownership retained; Check added |
| §3.4 uniform annular direct images | Identity; cubic map, residue characteristic 2, n = 3 | R⁰ ranks 1 and 3; after cubic pullback the three sheet generators are fixed; higher direct images vanish for these finite maps. Radius can be 1 in both cases for every invertible n. | Uniform radius distinguished from cover degree | Target/Checks added |
| §3.4 wild annular cover | u²−u = T⁻¹, characteristic 2, n = 3 | Monodromy permutes 2 sheets, order 2; after its Galois pullback the action is identity. An odd Kummer extension retains wild order 2. | Non-Kummer factor necessary | Check added |
| §3.4 annular sheaf comparison | Λ and Λ² on annuli | Restriction is identity in H⁰ = Λʳ and H¹ = Λʳ(−1), r = 1,2; higher groups 0. The stated half-open pseudo-adic supports have Hⁱ_c = 0 in every degree. | Matches ITO20 line 1673 | Target/Checks added |
| §3.4 finite-cover comparison | Cubic trivialization, n = 3 | On the covering annulus radial restriction fixes 3 H⁰ generators and 3 H¹ Kummer generators. The scalar 3 in Λ is 0, so averaging cannot be its proof. | Descent avoids invalid division | Check added |
| §3.4 uniform cohomological bounds | Disc, origin and empty support | Ordinary groups are (Λ,0,0,…) or all 0; a bound N = 1 gives vanishing for i ≥ N. | Bounds include zero coefficients | Target/Checks added |
| §3.4 truncated cone descent | Identity proper cover, r = 0 | Level 0 and 1 cones are zero; τ≤0 of the downstairs cone is zero. For the identity Čech complex the only surviving group is Λ in degree zero. | Source truncation convention agrees | Target added |
| §3.4 purely inseparable parameter reduction | Characteristic 2, f = T², f′ = T, ε = |t|² | T(V(T),ε) = {|T| ≤ |t|²} = T(V(T²),ε²); using ε^{1/2} on the right would instead allow radius |t|^{1/2}. | Exponent direction fixed | Target/Check added |
| §3.4 smooth principal comparison | f = T; f = T² in characteristic 2 | Derivatives 1 and 0 respectively; only f = T directly meets smoothness. Both closed supports have Λ in degree 0, 0 above, after the inseparable reduction for T². | No false generic-smoothness claim | Target/Check added |
| §3.4 uniform constant endpoint | C = completed algebraic closure of 𝔽₂((t)), every odd n | ε₀ = 1; tube/origin H⁰ = ℤ/n, higher groups 0, every restriction 1 ↦ 1. | Full positive-characteristic instance included | Endpoint strengthened |
| §3.4 coefficient boundary and thickening | Mixed characteristic n = p; Z = V(T²) | dim H¹(disc,ℤ/p) = ∞ versus 0 at origin; with invertible n, thickened tube radius √ε differs from ε but both have (Λ,0,0,…). | Invertibility and model retained | Checks added |
| §3.5 cup pullback and inverse | Identity-disc restriction, n = 3, a = b = 2 | f*(ab) = f*(1) = 1 = 2·2 = f*(a)f*(b); inverse also sends 1 ↦ 1. Zero map over ℤ/2 sends 1 ↦ 0 and fails unit law. | Multiplication and unit tested | Reordered; Checks added |
| §3.6 equivariant uniform tube | Point; zero section in ℙ¹ over 𝔽₂((t)) | H⁰ = ℤ/n, Hⁱ = 0 for i > 0 for every odd n in a single small disc; Galois fixes unit 1 and ab is preserved. | One radius for all invertible orders | Strengthened/reordered |
| §3.6 arbitrary-neighbourhood failure | Plane cubic Y ⊂ ℙ² | dim H¹(ℙ²) = 0, dim H¹(Y) = 2. | Cannot invert arbitrary restriction | Retained Check |
| §4.1 approximation and dimension | Y = ℙ¹, identity or elliptic cover in characteristic 3 | Identity has degree 1; elliptic y² = x³−x is smooth since derivative in x is −1, maps by x with degree 2; H¹ dimensions 0 versus 2. | Approximation need not preserve all cohomology | References updated |
| §4.1 ample degree, §4.3 trace | O(1) on ℙ¹; elliptic double cover | Trace degree 1 on ℙ¹; pulled-back degree 2·1 = 2; nonzero in ℚ₂ but 0 in ℤ/2. | Rational nonvanishing correct | Supplier/Checks added |
| §4.1 zero-dimensional positivity | Spec k; inseparable degree-p Spec L | Empty intersection product degrees 1 and p, both > 0 as integers; for p = 2 the latter is 2, not 1. | Inseparable degree retained | Supplier/Check added |
| §4.2 actual comparison and coefficient reduction | Identity approximation; double-cover approximation | H⁰ map 1 ↦ 1; H² trace map is 1 or 2. Reduction of 2 modulo 2 is 0, consistent with finite-level products and naturality. | Same map throughout | References updated |
| §4.2 ambient square and top character | ℙ¹ with g degree 2; q = 3 | Both ambient-square composites send hyperplane trace 1 to 2; Frobenius acts by 3 on both top lines, so 2·3 = 3·2. | Equivariance includes Tate character | None |
| §4.3 top isomorphism | d = 0; degree 2; disconnected target | Unit map at d = 0 is 1; multiplication by 2 invertible in ℚ₂; map E → E², x ↦ (x,x), is nonzero but not onto. | Connectedness essential | Import corrected |
| §4.4 splitting / duality_splitting | G = S₃, diagonal E → E³, dot pairing, E = ℚ | q(a x,b y) = 3xy = c p(x,y); annihilator sum xᵢ = 0 has dimension 2; diagonal intersects it at 0, dimensions 1 + 2 = 3. | Nonabelian equivariance works | Signature unchanged |
| §4.4 scalar/character boundaries | Characteristic 3; C₂ top sign | c = 3 = 0 puts diagonal inside its annihilator, excluded by hc; for C₂ q(g1,g1) = −1 = χ(g)q(1,1) with χ(g) = −1. | Nonzero scalar/top character necessary | None |
| §4.4 zero/rank-one and p = 2 | U = U′ = 0; all spaces ℤ/2 lines | First decomposition V = 0 ⊕ V; second with c = 1 and identities is V = V ⊕ 0. | No characteristic-zero restriction in Lean | None |
| §4.5 geometric stable summand | Elliptic cover of ℙ¹ | Degree 0 and 2 image dimensions 1; degree 1 gives 0 ⊕ E²; outside [0,2] both groups 0. | Image/complement correct | None |
| §4.6 toric endpoint | ℙ⁰, ℙ², c = 0 | Rank-zero fan gives H⁰ = E, Φ = 1; ℙ² has (1,q,q²) in degrees (0,2,4); all odd groups 0. | General endpoint includes degenerate fan | Neighbourhood reference updated |
| §4.7 hypersurface applications | Fermat p = 2,e = 3; p = 3,e = 2; e = p | Derivative coefficients are 1 and 2, so no simultaneous projective zero; at e = p all derivatives are 0 and equation is (∑xᵢ)^p. | Smoothness/good reduction distinguished | None |
| §4.7 products and empty product | ℙ¹ × ℙ¹; empty product | Even Betti dimensions (1,2,1), eigenvalues (1,q,q,q²); empty product is point with eigenvalue 1. | Product/rank-zero conventions agree | None |

The changed statements were tested against their full admitted domains: nonempty rank-one valued fields, positive invertible n including n = 1, both characteristics, ramified and purely inseparable extensions, nonreduced closed models, nontrivial finite-cover degree in the coefficient characteristic, and residue characteristics 2 and 3. The full uniform proof uses proper-support direct images and smooth duality; it does not extrapolate the characteristic-zero punctured-disc theorem to characteristic p.

## Pinned declarations and acceptance signatures

Opened the native bodies, rather than treating a search hit as a theorem:

| Pinned relative locator | Consequence |
| --- | --- |
| Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42, :59 | Absolute Galois group and continuous restriction with scalar-tower data; no automatic equivalence. |
| Mathlib/RepresentationTheory/Basic.lean:48 | `Representation` is a monoid homomorphism to module endomorphisms, with no continuity field. |
| Mathlib/LinearAlgebra/PerfectPairing/Basic.lean:39 | `IsPerfPair` means bijectivity of both adjoints, without equivariance. |
| Mathlib/Algebra/Homology/DerivedCategory/Ext/Map.lean:223 | Exact-functor preservation of Ext composition, used in §3.5. |
| Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56 | Abelian-sheaf cohomology is Ext from constant ℤ; the module-sheaf product comparison is additional. |
| Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:63, :75 | Native integral pro-étale coefficient sheaf and cohomology exist, without the required normalized geometric monodromy/weight interface. |
| Mathlib/RingTheory/Perfection.lean:633, :825 | Raw PreTilt and Tilt exist; the perfectoid-field, functorial action and marked comparison are additional interfaces. |
| TauCeti/NumberTheory/LocalField/Unramified/Inertia/Basic.lean:99, :146, :310 | Inertia, closedness and arithmetic Frobenius. |
| TauCeti/NumberTheory/LocalField/Tame/Character.lean:401, :413; Tame/Quotient.lean:387 | Positive Kummer character and arithmetic q-power action; geometric inversion gives q⁻¹. |
| TauCeti/NumberTheory/LocalField/Teichmuller.lean:63 | Multiplicative zero-preserving Teichmüller section for the coordinate expansion. |

Object searches found no relative marked-monodromy, uniform tubular-neighbourhood or annular direct-image interface at the pins. No new Lean declaration was introduced and no fully qualified supplier name was reused for a local declaration. The only Lean change describes the stronger nonstatable headlines and corrected section numbers. The statable `duality_splitting` theorem remains the native complementary-pair statement, with independent dimensions and nontrivial top character.

The scratch signature check appended `#check @TauCetiRoadmap.DeligneWeightsAndPurityPartII.duality_splitting` to the acceptance file and elaborated it once. Its type retains the field/group assumptions, all four additive/module/finite-dimensional structures, both perfect-pairing hypotheses, c ≠ 0, pairing compatibility, all four representations, both intertwining hypotheses and the top-character compatibility. Its annihilator is a subspace of V, `ker ((q.flip.comp b).flip)`. Comparing against README §4.4 found no lost binder and required no signature change.

## Check outcomes

- Prescribed absolute-file `lake env lean` from the content checkout: exit 0. Sole diagnostic, with the filename normalized to its repository-relative spelling: `packages/DeligneWeightsAndPurityPartII/Suggested.lean:51:8: warning: declaration uses sorry`. No Tau Ceti import occurs, so no module-object build was needed.
- Scratch `#check @` elaboration: exit 0; same expected sorry warning and the complete retained type described above. No Lean process remains running.
- Acceptance-file structural check: one `import Mathlib`, one theorem with `sorry`, zero definitions/instances/opaque data, no admitted examples and no `set_option`.
- Dependency check: exit 0. Complete output:

```text
depcheck: 52 roadmaps, 596 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

- Fresh roadmap citation resolution: no unresolved cross-roadmap citations or Lean names. The service did not inspect external library packages on its host; the pinned native declarations were checked locally as above.
- JSON comparison against HEAD: every top-level member except `gaps` is identical. One residual gap, `analytic-comparison-automorphisms`, has `slug`, `needs`, `supplier` and `section`, with the same slug under the README's exact contracts. Zero ownerless gaps remain.
- Both TOML files parse. Manifest source keys and provenance are retained; metadata is unchanged.
- `git diff --check`: exit 0.
- Reported `tex=8` failure: put the coordinate exponents and ramified-base quotient in §2.1, the two tame coordinates in §2.4, and the parameter powers and tube radius in §3.4 inside code spans. Mathematical statements and computed values are unchanged. The pattern search leaves no caret exponent outside a code span in the README.
- Repeated the content gate through a scratch layout: `tex=0`, `latex=0` and every other content counter zero. The command exits 1 solely with `git=1`, because the scratch layout is not a Git repository. The actual board's `git diff --check` exits 0; the prescribed dependency and Lean checks above also pass.

## Maintainer notes

The remaining `gap:analytic-comparison-automorphisms` asks ClassicalAdicEtaleCohomology §§8.2, 11.1 for continuous-automorphism naturality with product/coefficient compatibility. This round does not invent that export or edit its supplier. The package's own §3.4 owns its fixed-coefficient and uniform analytic proof inputs.

No Lean name changed. The cup-product application is now README §3.5, and the uniform equivariant neighbourhood theorem is §3.6; external citations of the old §3.5 neighbourhood or §3.6 cup target must follow that swap. The general neighbourhood contract now works in positive characteristic and simultaneously for all invertible constant coefficient orders. No other roadmap, tooling, merge order or pull-request text was edited. No commit was made. Fresh independent review remains necessary.
