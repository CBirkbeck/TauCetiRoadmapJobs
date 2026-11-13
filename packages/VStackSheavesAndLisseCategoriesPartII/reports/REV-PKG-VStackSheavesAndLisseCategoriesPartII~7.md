<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13140#issuecomment-6851529727 -->
Review (codex) of cbf659a

Verdict: needs_changes

1. **F01** (P2) Tensor-invertible complexes need not have a single shift

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:754`, “I is invertible (étale locally L[n] for an invertible Λ-module L).”

   **Claim:** This describes every invertible object allowed in VS7.10. With the arbitrary prime-to-p torsion coefficient rings of the Conventions, it excludes legitimate tensor-invertible objects. The proof of the twisting theorem needs only a tensor inverse.

   **Witness:** Over a geometric point, take p = 2, Λ = F₃ × F₃, I = e₁Λ ⊕ e₂Λ[1], J = e₁Λ ⊕ e₂Λ[−1]. Then I ⊗ J = Λ, but H⁰(I) and H⁻¹(I) are both nonzero.

   Here e₁ = (1,0) and e₂ = (0,1). Each summand is projective, the cross tensors vanish, and the same-factor shifts cancel. No geometric étale cover of the point changes these two nonzero cohomological degrees. An invertible module shifted once has only one. HKW22 line 1122 makes the same erroneous identification, whereas Lemma 4.1.10, HKW22 line 1187, is formulated for tensor-invertible objects. The supplier distinguishes its more restrictive convention: `TauCetiRoadmap/DiamondSixOperations/README.md:780`, §S4.2, does not assert the converse from tensor invertibility.

   **Exact repair:** Replace the parenthetical by: “I is tensor-invertible in D_ét(X, Λ): there is J with I ⊗ J ≅ Λ_X.” Keep the twisting theorem for every such I. Distinguish this meaning from the supplier's local-single-shift convention, add the product-ring example as a Check, and record the HKW22 correction. Do not restrict Λ to a field or local ring. On the witness, the repaired condition holds with the displayed J, and the inverse-map argument in VS7.10 works componentwise in degrees 0 and 1.

2. **F02** (P2) Based dualizability needs a smooth diagonal

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:1854`, “If 𝔖(𝔛) and 𝔅(𝔛) are dualizable, so is 𝔛”.

   **Claim:** Source and base dualizability suffice in BCoCorr_S. But its morphisms require a cohomologically smooth right base leg (line 1843). The coevaluation has right base leg Δ_(T/S), which need not be smooth merely because T → S is smooth.

   **Witness:** Let p = 2, S = Spd C, X = T = (P¹_C)^♢ and A = B = Λ = F₃. Both forgotten objects are dualizable; Δ^!Λ = Λ(−1)[−2], while self-base-change gives id^!Λ = Λ: H⁰ is 0 versus F₃.

   Thus Δ is not cohomologically smooth: formation of its dualizing complex fails the base-change test of VS7.8. The usual coevaluation S ← T → T ×_S T is not an allowed based morphism. Forgetting to the bicategory of correspondences fixes this underlying duality span up to equivalence, so this is not repaired by an arbitrary alternative duality datum. HKW22 lines 1961–1966, proof of Theorem 4.5.3, p. 40, explicitly assumes smoothness of both π and Δ before asserting based dualizability. VS11.9 correctly retains both assumptions; the API here lost one.

   **Exact repair:** State: “If Δ_(T/S) is cohomologically smooth and 𝔖(𝔛), 𝔅(𝔛) are dualizable, then 𝔛 is dualizable, with dual (X → T, 𝔻_(X/S)A, K_(T/S) ⊗ B⁻¹).” Cite the proof on pp. 40–41 for this API fact. Add the smooth-curve diagonal as a negative Check and T = S as a positive Check. For T = S, Δ = id, both dualizing complexes are Λ and the ordinary CoCorr duality is recovered; the counterexample is excluded by exactly the failed hypothesis.

3. **F03** (P1) The universal-local-term torsor map is not equivariant

   **Location:** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:1979`, “the automorphism α₀ from (x, g, h) ↦ (x, gx, h).”

   **Claim:** This is an automorphism of the trivial G × G torsor defining G → BG × BG. The roadmap fixes right torsors in VS6.9 (line 376), and explicitly uses left multiplication for their equivariant automorphisms. Right multiplication by a variable noncentral x does not commute with the right action.

   **Witness:** Use G = S₃, x = (12), a = (123), g = h = b = 1. With (x,g,h)·(a,b) = (x,ga,hb), F(t·(a,1)) has second coordinate ax = (13), whereas F(t)·(a,1) has xa = (23).

   These are constant finite étale group diamonds over a geometric point, within VS11.11's hypotheses. HKW22 lines 2079–2081 gives the displayed formula, but its torsor convention is left-handed (HKW22 lines 1705–1708); VS6.9 and VS11.2 deliberately changed that convention. The theorem can remain, but this proposed input to its proof is not a morphism.

   **Exact repair:** Name the trivial **right** G × G torsor over G and its action, and use F(x,g,h) = (x,xg,h), with inverse (x,x⁻¹g,h). State that its first-component automorphism is α_x of VS6.9. Add the nonabelian Check: both equivariance composites now have second coordinate xga; on the unit section its inertia coordinate is x, so the central map in step 2 sends x to its own conjugacy class, as required. Carry this convention through the based-correspondence diagram rather than retaining the source's unconverted formula.

Three findings, all blocking. The eight preceding repairs are repaired. The new defects are a restriction on invertible coefficients, a missing smooth-diagonal hypothesis, and a torsor automorphism incompatible with the roadmap's right-action convention. No package content was changed in this review.

## Verified sound

### Previous findings, checked first

The preceding review had findings R01–R08, recorded as F01–F08 in the repair report. None was marked not actionable. These repairs were read against the current package and supplier heads; none is re-raised.

| Repair | Repaired passage in the package README | Status and recomputation |
|---|---|---|
| F01: base already has smooth stacky f_! | Line 5: “constructs exceptional pullback for cohomologically smooth stacky maps together with its left adjoint f_! on that smooth class” | **Repaired.** The new [Z_p_S/C₂] example has stabilizer size 2 and a dualizing germ of rank at least 2 over F_ℓ. It is fine but neither representable nor smooth. The agreement is also in the contract and VS7.8. |
| F02: arbitrary base in the distribution Check | Line 747: “For S a geometric point (Spd C or Spd k)” | **Repaired.** The point gives Dist(Z_p,Λ); two points give its square; empty S and Λ = 0 give the invertible zero unit. |
| F03: undefined nice maps | Line 34: “compactifiable, representable in locally spatial diamonds and locally of finite dim.trg” | **Repaired.** These are DiamondSixOperations S0.4's three conditions. P¹ has dimension 1; B(C₃) is not representable; an infinite-dimensional ball fails local finite dimension. |
| F04: fixed-locus projections | Line 37: “Δ′ : Fix(c) → C … and c′ : Fix(c) → X” | **Repaired.** Scoped to VS8.10 and VS9.8; other uses are locally named. For the two-point correspondence over a point, Δ′ = id, c′ = fold, trace (1,2) integrates to 3 in F₅. |
| F05: tensor over the wrong ring | Line 1408: “C(U, Λ) ⊗_(C(T,Λ)) M” | **Repaired.** For T of size 2 and M = Λ², U = T gives rank 2, a singleton U gives rank 1; tensor over Λ incorrectly gives rank 4 in the first case. |
| F06: general modular character attributed to a parabolic supplier | Line 39: “Write δ_G(g) = μ(Eg⁻¹)/μ(E) for the modular character of G” | **Repaired.** The affine group gives χ = p, δ_G = p⁻¹. The supplier's conjugation modulus with N = 1 is 1; equality with δ_G is now asserted only with unimodular Levi. |
| F07: spectral cohomological bound had no owner | Line 536: “DiamondEtaleCohomology §C8.44 (Spectral-space cohomological dimension)” | **Repaired.** Current supplier line 2687 states the spectral-space bound for any abelian sheaf. The curve computation is 2 + 1 = 3; point bound is 0. Contract, Needs and Dependencies agree. |
| F08: Künneth page range | Line 1901: “Theorem 4.5.3 and equation (4.5.2), p. 38, and proof, pp. 40–41” | **Repaired.** HKW22 lines 1837, 1840 lie on p. 38; lines 1961–1998 lie on pp. 40–41. |

The pattern search covered all references to the base's exceptional operations, geometric-point distribution computations, nice maps, c′/Δ′, tensor bases in VS10, Haar/modulus conventions, the spectral-bound route and §4.5 locators. The three new findings are independent of those eight repaired claims. In particular, correct source and base smoothness in VS11.9 does not cure the broader API statement of R02.

### Principles, coverage and shape

All 65 numbered sections and their API, Checks, proof routes and Needs were read. Changed passages received a fresh adversarial pass. Earlier computed rows were retained only after checking their instances against this head; sections previously summarized without values were read rather than treated as certified by that summary. The table below records the seeded targets, headlines, repaired passages and finding witnesses, with additional controls for the recurring defect classes.

There are six layers and 28 explicit definition/construction API blocks. Each such block has at least three Checks (VS8.1 has three; the others have four to eight). Every layer ends with Examples and Dependencies. The target source paragraphs give theorem/definition/equation locators and pages. The missing hypothesis and misleading characterization are findings above, not excused by these structural counts. Main-branch shape comparisons were `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:580`, `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2299` and `TauCetiRoadmap/DGAInfinity/README.md:431`.

No computational algorithm, source-chapter layer heading, copied table/figure, route-specific prime restriction, sorry'd data, set_option, extra import, process date, pull-request number, machine path or HTML anchor was found in the package's mathematical text. The old-to-new layer numbering table is an allowed migration map. No identifier attributed to this roadmap in backticks lacks a corresponding declaration: there are no such identifiers; the named identifiers are suppliers, library declarations or notation.

### Seeded source verification

All fifteen requested targets were checked in the legal cached texts, including hypotheses, theorem numbers and printed pages. No locator is marked unverified by the author. All eight works cited by the package have readable manifest entries; no source was fetched or added and no existing manifest entry was rewritten.

| Target | Text and locator checked | Outcome |
|---|---|---|
| 6.3 Decent stacks are Artin | GHW22 line 1001, Proposition 4.4, p. 20 | Exactly the implication and the quasiseparated locally-spatial diagonal assertion. |
| 7.2 Prespatial amplitude | GHW22 lines 704, 732, 758, 781, Proposition 3.7, Lemma 3.8, Corollary 3.9, Lemma 3.10, pp. 14–15 | Proper/separated prespatial hypotheses, factor 3 and exactness for quasicompact injections agree. The spectral bound is separately supplied. |
| 7.3 Weak compactifiability | GHW22 lines 786–832, Definition 3.11, Lemma 3.12, Scholium 3.13, p. 16 | Strong factorization and weak locality distinguished; the composition h_! Rp_* j_! agrees. The source leaves permanence proofs to the reader; the roadmap plans them. |
| 7.8 Intrinsic smoothness | GHW22 lines 1594–1619, Proposition 4.14, p. 31 | All three conditions, F_ℓ coefficients and every decent base change retained. |
| 7.9 Dualizing complex/integration | HKW22 lines 1178–1185, Definition 4.1.9, p. 24; lines 1526–1528, p. 31 | K = Rf^!Λ and integration by counit; the roadmap explicitly uses cohomologically proper maps for integration. |
| 7.10 Invertible twists | HKW22 lines 1187–1191, Lemma 4.1.10, p. 24; lines 1121–1123, p. 23 | The twisting theorem is supported; the parenthetical characterization is R01 and a source error. |
| 8.8 Dualizability criterion | HKW22 lines 1490–1510, Proposition 4.3.5, p. 31 | The dual tensor-to-internal-Hom comparison, dual and evaluation/coevaluation agree. |
| 8.10 Trace class | HKW22 lines 1533–1561, Definition 4.3.6 and preceding construction, p. 32; LZ22 lines 856–865, Notation 2.20, p. 18 | Same legs, fixed locus and exchange maps; the locally specified c′/Δ′ are correctly directed. |
| 9.1 Relative Lefschetz–Verdier | HKW22 lines 1572–1614, Theorem 4.3.8, pp. 32–33; LZ22 lines 866–932, Theorem 2.21, pp. 18–19 | Dualizability and proper pushforward hypotheses retained, with cohomological properness made explicit. |
| 9.2 Proper pushforward of cc | HKW22 lines 1615–1617, Corollary 4.3.9, p. 33; LZ22 lines 933–940, Corollary 2.22, p. 19 | The identity specialization of the preceding theorem agrees. |
| 9.4 Local terms | HKW22 lines 1633–1636, Definition 4.3.11, p. 33; lines 2295–2336, §5.3, pp. 47–48 | Proper open-and-closed fixed component and its integration agree; scheme comparison uses the named supplier contracts. |
| 10.7 Four operations at the point of BG | HKW22 lines 1234–1252, Example 4.2.2, pp. 25–26 | Forgetful pullback, Haar-twisted exceptional pullback and the two adjoints agree, with smooth representation carriers imported. |
| 11.6 Inertia trivialization | HKW22 lines 1802–1830, Lemma 4.5.2, pp. 37–38 | Both the structure map and diagonal are assumed cohomologically smooth. |
| 11.7 Based correspondences | HKW22 lines 1873–1960, Definition 4.5.4 and (4.5.3)–(4.5.9), pp. 39–40; lines 1961–1966, p. 40 | Object/morphism data and fibre-product twist agree; the extra API dualizability statement omits a hypothesis: R02. |
| 11.11 Universal local term | HKW22 lines 2000–2040, §4.6, pp. 41–42 | Construction over G, relative fixed locus and relative dualizing complex agree. The ordinary-CoCorr non-example is correct. Its headline identification in 11.12 has the separate torsor defect R03. |

### Adversarial computations

Shifts use Hⁱ(M[n]) = Hⁱ⁺ⁿ(M); permutation products are composed right to left. Numerical tests do not replace the source and hypothesis checks above.

| Statement | Instances tried | Computed values on the two sides / wrong model | Result; change |
|---|---|---|---|
| Base boundary, VS7.5 headline | S geometric, T = Z_p, trivial C₂ action, Λ = F₃ | Stabilizer has order 2 versus 1 for a sheaf; pullback of K has two independent germs versus rank 1 for an invertible F₃ complex concentrated in degree 0. | Fine nonsmooth stacky example distinguishes the extension from the base. |
| VS6.1–6.3 decency/Artin | BC₂ over a geometric point, and empty base | The finite étale chart has 2 sheets; diagonal fibres are C₂ torsors; empty-base chart is id_∅ with 0 points. | Artin conclusion holds; representability of the whole stack fails only in the nonempty example. |
| VS6.9 torsor labels | h = (123), f₂(t) = (12) in S₃ | f₁(t) = (23); h⁻¹f₁(t) = (13) = f₂(t)h⁻¹; wrong h gives (12) versus (23). | Correct in VS6.9; R03 finds the inconsistent later use. |
| VS6.11 proper/spatial test | Spd Z_p versus (P¹)^♢ | Spd Z_p has 2 points but the closed point lacks the required geometric quasi-pro-étale presentation; P¹ is a spatial diamond. | Spatiality of the underlying space alone is not used as sufficient. |
| VS7.1 and 7.3 hypotheses | Infinite disjoint union of points; infinite-dimensional ball | First is locally prespatial but not quasicompact; second has dim.trg = ∞ rather than a finite local bound. | Negative controls retained; id of a point has factorization id ∘ id ∘ id and Rf_! = id. |
| VS7.2 amplitude | Curve, point, empty space | 2·1 + 1 = 3·1 = 3; 2·0 + 0 = 0; all empty-space cohomology groups = 0. | Bound and spectral supplier match. |
| VS7.4 distributions | U_n = 2ⁿZ₂, W_n = 2ⁿ + 2^(n+2)Z₂ | Values of (δ₀,ν) on U_n and W_n are (1,0) and (0,1); 3·2ⁿ − 2ⁿ = 2^(n+1) is not in 2^(n+2)Z₂. | Two independent germs; a single evaluation distribution is the wrong model. |
| VS7.7 comparison and 2-morphisms | S → BC₂ over F₃; BC₃ → S, p = 2 | Swap matrix on F₃² is not identity. For BC₃, H⁻¹(Rf_!Λ) = F₃ while H⁻¹(Rf_*Λ) = 0, and H¹(Rf_*Λ) = F₃. | Properness and 2-morphism compatibility matter; no unjustified equality for all fine maps. |
| VS7.8 intrinsic smoothness | S → BZ_p versus BC₃ → S | First has invertible q^!Λ ≅ Λ but base-change dualizing stalk rank at least 2; second has K ≅ Λ and the smooth-stacky adjoint, with H⁻¹ coinvariants = F₃. | Invertibility alone is insufficient; base change retained. |
| VS7.9 dualizing/integration | S, P¹, Z_p_S; empty and two-point bases | K_S = Λ; K_P¹ = Λ(1)[2] and trace sends fundamental class to 1; distributions have germ rank ≥ 2. Empty: K = 0 is the unit; two points: Dist². | Repaired scope holds. |
| VS7.10 arbitrary invertible coefficients | Λ = F₃ × F₃, e₁Λ ⊕ e₂Λ[1] | Product with e₁Λ ⊕ e₂Λ[−1] is e₁Λ ⊕ e₂Λ = Λ; H⁰ and H⁻¹ both nonzero, versus one nonzero degree for L[n]. | R01; tensor-inverse formulation passes. |
| VS7.11 diagonal dualizing twist | Smooth curve over a point | K_Δ = Λ(−1)[−2], K_f = Λ(1)[2], tensor = Λ. | Invertibility of K_Δ does not imply smoothness of Δ; used in R02. |
| VS8.1 trace normalization | Λ ⊕ Λ[1], and the zero object | Supertrace(id) = 1 − 1 = 0; trace(id_0) = 0. Signless formula gives 2 over F₃. | Symmetry and degree convention discriminate. |
| VS8.2 trace functoriality | X = P¹, C = ∅, target a point | Trace of empty correspondence = 0; pushed endomorphism is 0 and trace(0) = 0. The comparison 2-cell is ∅ → X. | Direction and zero case hold. |
| VS8.3 Grothendieck construction | Unit base category, F constant Λ-modules | Fibre construction is Λ-modules; tensor of maps 2 and 3 on Λ = Z/5 is multiplication by 6 = 1, both before and after assembly. | Contravariant 2-cell orientation and tensor agree. |
| VS8.4 derived dualizability | Λ = Z/6, P = 3Λ; Λ ⊕ Λ[1] | Idempotent 3² = 3; projective trace = 3; native finite-basis trace = 0 because cardinality 2 is not 6ⁿ. Supertrace = 0. | Imported projective trace is necessary; no false identification with native trace. |
| VS8.5 truncated-DVR reflexivity | Z/9 module Z/3; infinite F₃-vector space | Dual of Z/3 is 3(Z/9), size 3; double dual size 3, evaluation bijective. For countable direct sum F₃, double-dual dimension is strictly larger than countable. | Finite nonprojective case differs from Mathlib's finite-projective instance. |
| VS8.8 and VS8.9 headline | A = F₃² at a point; A infinite free | dim(A* ⊗ A) = 4 = dim End(A); infinite case has only finite-rank operators on the left and misses id on the right. | Both directions of dualizable iff ULA/perfect have discriminating controls. |
| VS8.10 trace class | Two-point fold over S, weights 1 and 2 in F₅ | Fix = two points, Δ′ = id, c′ = fold; class = (1,2), pushforward = 3. | Source/target and exchange-map conventions correct. |
| VS8.11 characteristic class | Two-point space, constant rank-one coefficient | cc = (1,1); pushforward to point = 2 = trace(id on F₃²). | Both unit and multiplicity retained. |
| VS9.1 relative trace headline | Two-point fold, weights 1 and 2 | Integral of trace class = 1 + 2 = 3; trace of diagonal endomorphism diag(1,2) = 3 in F₅. | Proper pushforward square gives equal values. |
| VS9.2 cc pushforward headline | Two-point fold and zero complex | f_*cc(Λ) = 2 = cc(f_*Λ); for 0 both sides = 0. | Properness/dualizability retained. |
| VS9.3 Lefschetz trace | P¹, z ↦ az, a ≠ 1 | Two local terms 1 + 1 = 2; traces on H⁰ and H² sum to 2. | Proper support matters; the theorem retains it. |
| VS9.4 local terms | Above P¹ fixed components | Each point has H⁰(K) = Λ and integral of 1 = 1; empty component gives 0. | Open-and-closed proper-component domain is explicit. |
| VS9.5–9.6 universal trace/base change | A geometric fixed point after extending algebraically closed fields | Class 1 pulls back to 1; integration 1 = 1. Empty fixed locus remains empty with trace 0. | Coefficient and properness conditions retained. |
| VS9.7–9.8 perfect-scheme comparison | Perfect A¹ with translation x ↦ x + 1; identity on A¹; point | Translation has equation 1 = 0, hence empty fixed locus and trace 0 on both sites. Identity c₁ is proper but Fix = A¹ is not proper over k. Point trace = 1 on both sites. | c₁ proper does not imply fixed-locus properness; both are present. |
| VS10.1 restriction tensor | T size 2; U = T or singleton | R ⊗_R R has rank 2; eR has rank 1. Tensor over Λ gives rank 4 for U = T. | F05 repaired. |
| VS10.2 smooth/complete realizations | Two stalks of ranks 2 and 1; infinite discrete set | Global module rank 3 = 2 + 1; infinite discrete compact support gives ⊕Λ while global sections give ∏Λ. | The two realizations are distinguished. |
| VS10.3–10.4 distributions | Z_p, normalized Haar | μ(pⁿZ_p) = p⁻ⁿ, nonzero; a finite Dirac sum vanishes on a small open avoiding its finite support. | Distribution object is not finite-support measures. |
| VS10.5 Haar character | Affine group, p = 2, Λ = F₅ | χ(g) = 2, δ(g) = 3; χδ = 1. The wrong translation direction gives 2·2 = 4. | F06 repaired and convention propagated to VS11.3. |
| VS10.7 point of BG | Finite G = C₂, Λ = F₃, trivial/sign modules | q^* and q^! on a trivialization give the underlying one-dimensional space; q_!Λ = Λ[C₂] = q_*Λ, dimension 2; Hom_G(Λ[C₂],M) and Hom_Λ(Λ,M) each dimension 1. | Both adjoints, Haar factor 1, and finite control agree. |
| VS10.9–10.10 structure map/quotient | C₂ over F₃; G = 1 over Z/9 | Averaging (1 + σ)/2 gives invariants = coinvariants; sign gives 0, trivial gives F₃. Multiplying Haar generator by 3 gives map a ↦ 3a with kernel/image {0,3,6}. | Generator condition is necessary and present. |
| VS11.1 admissibility | Regular representation of Q₂ over F₃; zero coefficients | Z₂ invariants are ⊕_(Q₂/Z₂) F₃, infinite rank, not perfect; over Λ = 0 invariants = 0, perfect. | Noncompact and zero-ring controls hold. |
| VS11.2 right-torsor inertia | c = (12), y = (123) in S₃ | y⁻¹cy = (13); opposite convention ycy⁻¹ = (23). | Right convention correct here. |
| VS11.3–11.4 trace-distribution headline | C₂ sign representation; affine F₅ normalization | Character values (1,−1), distinct from (1,1); normalized conjugation integral 2·3 = 1, wrong direction 2·2 = 4. | Character, rather than dimension alone, detected. |
| VS11.5 modified Künneth | Two relative balls over a point, nonzero constant coefficients | Twisted target Λ(2)[4] has H⁻⁴ = Λ; untwisted Λ(1)[2] has H⁻⁴ = 0. With one input zero both are 0. | The extra dualizing twist is substantive. |
| VS11.6 inertia trivialization | T = S; T = BC₂ | First K = Λ and cc = 1; second inertia is two copies of BC₂, each K = Λ with value 1. | Both smoothness hypotheses hold. |
| VS11.7 based dualizability | X = T = P¹; positive control T = S | Curve diagonal K = Λ(−1)[−2], H⁰ = 0; self-base-change gives Λ, H⁰ = F₃. For T = S both are Λ. | R02; added smooth-diagonal condition passes. |
| VS11.9 Künneth headline | Point base, complexes of ranks 2 and 3 | cc(A₁)cc(A₂) = 2·3 = 6 = cc(A₁ ⊗ A₂); rank-zero factor makes both sides 0. | Smooth-base assumptions and repaired locator hold. |
| VS11.10 quotient inertia | Trivial G action on X | Fix = X × G on both descriptions, quotient X × [G//G]. For G = 1 this is X. | Quotient convention matches VS6.9. |
| VS11.11 universal local term | C₂ swapping two points; G_m acting on a point | Over 1 fixed pairs (a,1),(b,1), class (1,1); over σ empty and class 0. For G_m, α*Λ = Λ but α!Λ = Λ(1)[2]. | Relative construction over G is needed. |
| VS11.12 universal-local-term headline | G = S₃, x = (12), a = (123) | Original equivariance yields ax = (13) versus xa = (23); repaired left multiplication gives xga on both sides and inertia value x. | R03. |
| VS11.13 étale fixed locus | Affine transformations of P¹ near a = 1, b ≠ 0 | w(bw + a − 1) = 0 has a double root at w = 0 when a = 1; derivative there = 0, versus a simple étale root. | Isolated fixed points do not suffice; the roadmap already adds étaleness. |

### Pinned APIs, elaboration and headlines

The pins inspected are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` from the content manifest. These are the libraries used by the elaboration, not newer online versions.

`lake env lean` on the absolute package `Suggested.lean` path, from the content checkout, exited 0 with no output and **no warnings**. There is no Tau Ceti import requiring a module build. A separate scratch elaboration of `#check @…` for all 23 Mathlib names in the README also exited 0. The package has zero named declarations: the requested own-declaration binder audit and the one-tactic probe on every sorried theorem therefore each have **zero inputs**. There is no padding, no disguised substitute and no hypothesis silently dropped by a definition.

| Pinned file and line | Declaration/contract checked |
|---|---|
| `Mathlib/CategoryTheory/Monoidal/Category.lean:161`; `Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean:364` | MonoidalCategory; SymmetricCategory, including square of braiding = identity. |
| `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean:78`, `:104`, `:107`, `:237` | ExactPairing, coevaluation, evaluation, HasRightDual. Coevaluation has target X ⊗ Y, evaluation source Y ⊗ X. |
| `Mathlib/CategoryTheory/Bicategory/Basic.lean:61`; `Mathlib/CategoryTheory/Bicategory/Adjunction/Basic.lean:89`; `Mathlib/CategoryTheory/Bicategory/Functor/Pseudofunctor.lean:57` | Bicategory, Adjunction, Pseudofunctor. A bicategory does not include a monoidal structure. |
| `Mathlib/Topology/LocallyConstant/Basic.lean:212`; `Mathlib/Topology/LocallyConstant/Algebra.lean:92`; `Mathlib/Topology/Sets/Compacts.lean:777` | LocallyConstant, charFn and CompactOpens. Native CompactOpens does not require Hausdorffness; the roadmap's locally profinite hypotheses supply the clopen use. |
| `Mathlib/LinearAlgebra/Dual/Defs.lean:61`, `:70`, `:203`; `Mathlib/LinearAlgebra/Dual/Lemmas.lean:262`, `:284` | Dual, evaluation and IsReflexive; finite projective implies reflexive; reflexive over a field implies finite-dimensional. No arbitrary truncated-DVR converse is supplied by these instances. |
| `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:56`; `Mathlib/RingTheory/LocalRing/MaximalIdeal/Defs.lean:30`; `Mathlib/RingTheory/Finiteness/Defs.lean:121` | DVR is a nonfield local PID domain; maximalIdeal is the nonunits; Module.Finite is finite generation. |
| `Mathlib/LinearAlgebra/Trace.lean:75` | The actual body chooses a finite basis when one exists and returns zero otherwise; it is not the general projective trace. |
| `Mathlib/Algebra/Category/FGModuleCat/Basic.lean:265`; `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87` | Right rigid finite-dimensional modules over a field; derived category of an abelian category, without the needed symmetric monoidal enhancement. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:259` | IsSmoothDiscrete includes discrete topology and open point stabilizers. It does not define sheaves on a classifying v-stack. |

Object searches also inspected the perfectoid-ring and adic-space directories at both pins. Mathlib's perfectoid directory concerns pretilts, untilts and Fontaine's map; Tau Ceti's concerns perfectoid rings/fields and adic spaces. Neither supplies the v-site, small v-stacks, their étale derived categories or symmetric monoidal bicategories used by these headlines. Names containing “diamond” in the modular-form library are diamond operators, not geometric diamonds.

The seven headlines explicitly named by the summary are VS7.5 (fine exceptional functors), VS8.9 (ULA/dualizable equivalence), VS9.1 (relative trace), VS9.2 (proper cc pushforward), VS11.4 (characteristic class = trace distribution), VS11.9 (Künneth), and VS11.12 (universal local terms). Each is named in `Suggested.lean`'s module docstring with the missing carriers. VS9.3, VS9.6 and VS9.8 are additionally covered there. None can be stated at the pins using only a few simple definitions. No statement about a free scalar or a bare function is substituted for one.

### Ownership, supplier heads and order

The main folders, supplied open-head index and board package index were read. This is not a second copy of a roadmap on main. The supplied overlaps report has no conflicting head, dropped cited id or citation defined only by an open revision. The permitted former-numbering map preserves the moved layer ids. Open-head texts were retrieved through the roadmap service, and the object search used `roadmaps grep`, not just target-name matching.

The following table records resolved supplier sections. Paths in this table are all `TauCetiRoadmap/<name>/README.md`; line numbers are at the inspected main or open head. The broad layer citations are resolved by these substantive sections, not merely by a matching roadmap name.

| Supplier/head | Resolved sections and original README lines |
|---|---|
| VStackSheavesAndLisseCategories, PR #1230 | VS0.1:100; VS0.2:135; VS1.1:234; VS1.2:328; VS4.2:1219; VS5.2:1378. The named Artin, descent, smooth-shriek, ULA and classifying-stack targets and “Torsion ULA and perfect invariants” are present. |
| DiamondSixOperations, PR #927 | S0.1:119, S0.2:150, S0.4:215; S1.1–S1.5:262,281,308,342,368; S2.3:488, S2.4:541; S3.1–S3.4:590,609,643,663; S4.1–S4.5:706,768,829,872,900; S5.4:1030, S5.5:1070. These own representable eligible operations; VS7 extends them to fine maps. |
| DiamondsAndVStacks, PR #820 | D4.1:5780, D4.6:6300, D4.7:6367, D4.10:6586; D5.1:6870, D5.2:7046, D5.5:7328, D5.11:7637, D5.12:7697, D5.14:8134; D6.4:8954, D6.5:9035. Named geometry/representability/quotient slugs resolve. |
| DiamondEtaleCohomology, PR #922 | C8.44:2687. Spectral Krull-dimension cohomological bound is exactly the newly cited input. |
| SmoothRepresentationsOfLocalGroups, PR #1688 | SR.0.3:765; SR.0d.2:1737; SR.1.1:1050; SR.2.1:1916; SR.2.2:2045. Averaging, derived invariants/duality, ring-valued Haar, induction and modulus slugs resolve. HaarMeasureWithValues is in SR.1.1; δ_P is not a general δ_G. |
| EtaleDualityAndPerverseSheaves, PR #1040 | 6.1:6218, 6.2:6283, 6.3:6562; CohCorr.pullbackAlong:6427, CohCorr.restrictOpen:6429. Same c₁*/c₂! orientation. Its finite-ring bounded finite-Tor scope is accurately distinguished from the declared extensions. |
| AdicCoefficientsAndComparisons, PR #965 | L1:775 (scheme diamond target:787, comparison pullback:931); L3:1434 and its four named comparison targets. These supply the geometric comparison, not this roadmap's trace comparison. |
| EnhancedDerivedSheaves, main | E1.4:580, E2.6:2293, E3.2:1153, E3.4:1229, E5:abstract.1:1440. Generic ringed-diagram calculus does not silently include the four declared Liu–Zheng extensions. |
| SchemeAndStackFoundations, main | 0.23a:2204 and 0.24:2299; perfection_universalHomeomorphism:2313. |
| PivotalSpherical; AdicSpacesPartIII; DGAInfinity, main | PivotalSpherical Layers 2:318 and 7:477; AdicSpacesPartIII R3.8:11858 with both projective-trace targets; DGAInfinity Layer 5:431. The ordinary categorical/projective trace and compact-perfect inputs are imported; VS8 adds the bicategorical construction and derived criterion. |

The six gap slugs in `design/plan.json` and README lines 91–107 agree, with named suppliers and hypotheses: enhanced-operation-map, partial-adjoints, restricted-nerves and descent (all prefixed `vs-pii-`) belong to EnhancedDerivedSheaves E3.4; scheme-correspondences and scheme-local-terms belong to EtaleDualityAndPerverseSheaves 6.2–6.3. They are precise extensions, not unowned dependencies. Their absence today is not a finding. AnalyticStacks PR #1687, `TauCetiRoadmap/AnalyticStacks/README.md:9` and §0.3, also plans restricted nerves, but lies later in the order; this package does not claim that target or import that later roadmap. The declared earlier supplier remains EnhancedDerivedSheaves. The old VS10 ids in the plan's needs are mapped to VS9 by the README's numbering map.

Object-level comparisons distinguished the base's smooth stacky adjoints and kernel-adjoint criterion from fine-map operations and the Lu–Zheng CoCorr trace bicategory. HeckeStacksAndLocalShtukas owns Hecke/tower applications; AdicCoefficientsAndComparisons owns coefficient and scheme-site comparisons; AnalyticStacks uses analytic/solid geometric setups. The local-shtuka trace application at `TauCetiRoadmap/IgusaVarietiesAndTorsionConcentration/README.md:2453` (PR #1090, §7.9b) concerns bounded admissible local Shimura correspondences and rational descent, downstream of the generic torsion formalism here. Its local-term computation is outside this package's stated scope. `TauCetiRoadmap/DerivedModuleAlgebra/README.md:2695` owns Matlis duality on finite/Artinian classes; VS8.5's criterion for arbitrary modules over a truncated DVR is not that theorem. No declaration name can collide because this Suggested.lean declares nothing.

Every Needs line and layer dependency was compared with the contracts. The mechanical command prescribed in the brief, with `--movable`, returned exit 0 and this complete output:

```text
depcheck: 208 roadmaps, 1903 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The citation resolver's supplied empty result agrees with the resolved sections and library names above. No prohibited supplier is named.

Overlap check: read DiamondSixOperations, VStackSheavesAndLisseCategories, HeckeStacksAndLocalShtukas, AdicCoefficientsAndComparisons, AnalyticStacks, EnhancedDerivedSheaves; eligible representable six operations belong to DiamondSixOperations, smooth stacky adjoints/ULA and smooth-representation equivalence to VStackSheavesAndLisseCategories, Hecke applications to HeckeStacksAndLocalShtukas, scheme/coefficient comparison to AdicCoefficientsAndComparisons, generic higher-category inputs and the declared restricted-nerve extension to EnhancedDerivedSheaves; AnalyticStacks' analytic formalism is separate. Fine decent-stack operations and their torsion trace formalism belong to this Part II.

### Wording, arrangement and reuse

The fifteen seeded passages were compared with their source texts, as were six further passages: VS6.9 (HKW22 line 1053), VS8.3 (LZ22 line 364), VS10.1 (HKW22 line 3579), VS11.2 (HKW22 line 1705), VS11.9 (HKW22 line 1840) and VS11.12 (HKW22 line 2061). No nonmathematical sentence or clause-by-clause paraphrase requiring rewriting was found. Shared formulas, technical hypotheses and standard mathematical names were treated as mathematical content; R03 concerns an unconverted mathematical convention, not copied prose. The empty Lean namespace adapts no external formalization.

For a reproducible count, group repeated citations to the same work within a blank-line-delimited paragraph as one locator entry; count paragraphs containing an explicit theorem/definition/section/page/tag locator, before References. Counts are HKW22 122, GHW22 41, LZ22 23, Sch17 21, FS21 19, LiuZhengEnhanced 5, LiuZhengGluing 1, Stacks07LT 1: 233 entries. HKW22 has the largest share. Its contents at HKW22 lines 26–70 were opened. The comparison is VS6–VS7 ↔ parts of §4.1 plus GHW22; VS8 ↔ Lu–Zheng §1 plus HKW22 §4.3 and Appendix B.1; VS9 ↔ §4.3 and §5.3; VS10 ↔ §4.2 and Appendix B.2; VS11 ↔ §§4.4–4.6. This is not a same-order, one-to-one run of the source's sections. VS10 is deliberately independent of VS8–VS9 and placed after them; the Needs chains force geometry → operations → geometric correspondences → trace, then the final combination with representation theory. Generic category theory in VS8.1–VS8.5 is separately identified as nongeometric. No source examples/exercises were reproduced as a list or table.

Source independence: 21 passages compared with 3 sources, no expressive copying found; largest share HKW22, 122 of 233 grouped locator entries; contents compared with HKW22: independently organized around the required constructions and end theorems.

## Not verifiable

- No requested source text or contents page was inaccessible. No missing-reference request is needed.
- Elaboration certifies the deliberately empty target-signature file, not the future geometric theorems. Those carriers and the six declared supplier extensions are not implemented at these pins.
- The general assertion Rf_! ≅ Rf_* for every proper fine map is not established by the cited public GHW22 text. The package explicitly records this limitation and states its integration/trace pushforwards for cohomologically proper maps; that unclaimed stronger assertion is not certified here.

## Source issues

- **Error** in HKW22 at the paragraph before Theorem 4.1.6, printed p. 23 (line 1122): the source says tensor-invertibility is equivalent to being étale locally one shifted invertible coefficient module; it should allow different shifts on coefficient-ring idempotent factors; affects a stated result.
- **Error** in HKW22 at Example 4.1.1, printed p. 22 (line 1055): the source says maps BG → BH are homomorphisms G → H; it should include H-torsors with commuting G-actions, with homomorphisms describing trivialized torsors; affects a stated result.
- **Gap** in HKW22 at Theorem 4.1.8, printed p. 24: the source says GHW supplies comparison with ordinary pushforward for every proper fine map; it should distinguish the supplied six-functor theorem from this additional comparison assertion; affects a stated result.
- **Error** in HKW22 at Example 4.2.5, printed p. 27: the source says a Haar-measure choice gives the untwisted distribution identification; it should require a generator of the Haar module; affects a stated result.
- **Misprint** in HKW22 at Definition 4.3.4, printed p. 30 (line 1482): the source says the tensor-product correspondence ends with a mixed unprimed/primed coefficient pair; it should end with the two target coefficients A′₁ and A′₂; affects a stated result.
- **Error** in HKW22 at Example 4.3.10, printed p. 33: the source says properness of X suffices for its arbitrary-correspondence trace application; it should additionally require properness of the correspondence source over the base; affects a stated result.
- **Misprint** in HKW22 at the paragraph after Proposition 4.3.5, printed p. 31 (line 1514): the source says the ULA criterion is FS21 Theorem IV.2.24; it should cite Theorem IV.2.23, FS21 line 4801; affects nothing.
- **Misprint** in HKW22 at the proof of Theorem 4.5.3, printed p. 41 (line 1990): the source says the inertia fibre product is over In_S(T₁); it should be over In_S(T), the single base of the theorem; affects the proof.
- **Gap** in HKW22 at equations (4.5.8)–(4.5.9), printed p. 40 (line 1960): the source says the remaining functoriality and monoidality details are straightforward; it should supply the coherence of these two-isomorphisms; affects the proof.
- **Error** in HKW22 at §4.6 closing remark, printed p. 44 (line 2133): the source says isolated fixed points imply étaleness of the family of fixed loci; it should assume étaleness of that family, which isolated fibres do not ensure; affects a stated result.
- **Misprint** in HKW22 at §5.3, printed p. 48 (line 2320): the source says the trace construction precedes Definition 4.3.5; it should refer to Definition 4.3.6; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "cbf659a2ab6efc39b969e1ee8fcac9c1e121699b", "job": "REV-PKG-VStackSheavesAndLisseCategoriesPartII~7", "model": "gpt-6-astra", "worker": "chris-3"} -->
