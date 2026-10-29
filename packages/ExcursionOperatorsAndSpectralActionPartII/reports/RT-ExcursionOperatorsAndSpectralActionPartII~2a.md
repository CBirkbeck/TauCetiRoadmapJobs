<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1289#issuecomment-6484798149 -->
Red team round 2 pass a (codex) of c9dafac

Verdict: needs_changes

1. **F01** (P1) The Hecke comparison supplier has moved

   **Location:** `packages/ExcursionOperatorsAndSpectralActionPartII/README.md:163`: “HeckeStacksAndLocalShtukas §HS3.11 identifies the Hecke functors of IG.F.18–IG.F.20 with those of HS1–HS3”. Also lines 7, 77, 167, 171 and 288.

   **Claim:** An existing HS3.11 supplies the comparison used to commute the imported centre with the character Hecke operators.

   **Witness:** `TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md:2215` is its last HS3 target. HS1.2, line 741, identifies the common AG2.6 functor. `TauCetiRoadmap/IgusaVarietiesAndTorsionConcentration/README.md:1811` imports AG2.6. HS3.11 does not exist.

   **Exact repair text:** Replace the HS3.11 comparison sentence by: “Use AutomorphicGaloisRepresentationsPartII AG2.6, ‘Bundle strata, lisse categories and the geometric Hecke action’ and ‘The parameter stack and geometric spectral action’, for the common lisse Hecke functor and normalized spectral action. HeckeStacksAndLocalShtukas HS1.2 identifies its lisse restriction with this functor; IgusaVarietiesAndTorsionConcentration IG.F.18 and IG.F.21 supply the adapters to their categories.” Replace all HS3.11 dependencies by these named sections. State the normalized label adapter explicitly as in S02. Replace the scope sentence about the universal action by: “This roadmap imports AG2.6’s action and proves no second universal-action construction.”

   **Repair test:** For the unit representation all three imported actions give the identity; for a nontrivial label the common carrier is AG2.6’s HeckeFunctor and its actual normalized action, so no nonexistent comparison is required. The relevant suppliers are earlier in the merge order.

2. **F02** (P2) Raw Hecke excursions are identified with the normalized spectral action

   **Location:** `packages/ExcursionOperatorsAndSpectralActionPartII/README.md:163`: “each imported excursion operator is the create–Weil-action–annihilate composite of HS4.2 for the Hecke family of HS4.1”. Also the raw HS4.2 reference in the new gap at line 79.

   **Claim:** The same representation label gives the imported normalized spectral excursion and the raw HS4.1 excursion.

   **Witness:** `TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:2613` specifies V↦T_(θ*V); line 2624 makes raw V↦T_V its pullback by φ↦θ∘φ. For Ĝ=G_m, θ(t)=t⁻¹: 2 becomes 1/2.

   **Exact repair text:** “Write T^HS_V for the HeckeStacksAndLocalShtukas HS1.2/HS4.1 functor and θ for the pinned Chevalley involution. Our Hansen-labelled functor is T^H_V=T^HS_(θ*V). The imported normalized excursion with datum V is the HS4.2 composite with datum θ*V, including its creation and annihilation maps. Raw HS excursions correspond instead to θ∘φ. All Layer 1 formulas use T^H.” In gap:general-parabolic-excursion-comparison, replace “each HS4.2 excursion operator” by “each normalized excursion obtained from HS4.2 on the θ-pulled-back Hecke family”; make the same change in the plan’s gap sentence. Add the Check: “For G_m and b of κ=1, T^HS_(χ₁) sends κ=1 to 0, whereas T^HS_(χ₋₁) sends it to 2. Hence the Hansen forward functor T^H_(χ₋₁)=T^HS_(χ₁) reaches the neutral stratum. At parameter value 2, normalized coordinate t evaluates to 2 and the raw θ-pulled-back coordinate to 1/2.”

   **Repair test:** The displayed κ computations use HS1.2’s torus formula κ↦κ−n. The adapter sends the forward source κ=1 to 0 and the reverse source 0 to 1; it also distinguishes the two spectral evaluations. HS4.2 calls the excursion AG2.6’s imported operator, but its displayed creation/evaluation API is on raw T_V; that name alone does not resolve the two conventions. The generic transport instruction in Conventions does not specify the adapter or justify the unqualified equality at line 163.

3. **F03** (P3) The new SL₂(D) example is not the required z-embedding

   **Location:** `packages/ExcursionOperatorsAndSpectralActionPartII/README.md:86`: “The reduced-norm z-embedding SL₂(D)↪GL₂(D) has quotient G_m and connected centre G_m”.

   **Claim:** This inclusion instantiates the z-embedding reduction described immediately above it.

   **Witness:** FS24 line 13001 requires Z(G′)(E)→D(E) surjective. For G′=GL₂(D), D quaternion, scalar λ has reduced norm λ⁴. Its valuation is divisible by four; a uniformizer has valuation one and is not in that image.

   **Exact repair text:** “SL₂(D)↪GL₂(D) has torus quotient via reduced norm and connected centre, but is not a z-embedding with the central-surjectivity property used in FS24: the centre maps by λ↦λ⁴, which misses a uniformizer. Use the genuine z-embedding supplied by gap:general-parabolic-excursion-comparison for that reduction. Separately, GL₂(D) is the basic inner form of GL₄ with κ=2 and slope 1/2; its proper block Levi corresponds to the standard (2,2) Levi.”

   **Repair test:** Nrd on all of GL₂(D)(E) is surjective, but Nrd on its centre is not. The replacement keeps these two maps distinct and retains the correct basic-inner-form calculation. This is a new error in the repair of r1a F01 / r1b F02, not a demand to implement the declared gap.

Three findings: one missing supplier comparison, one normalization mismatch, and one incorrect reduction Check. Declared supplier contracts are accepted conditionally; their unimplemented status is not a finding.

## Verification of the previous findings

All seven numbered findings of the two earlier passes were rechecked against the current files, including the four components of r1b F04. The repair report is evidence of intended changes, not evidence of their correctness. Locations below are in `packages/ExcursionOperatorsAndSpectralActionPartII/README.md` unless qualified.

| Earlier finding | Status at this head | Repaired passage and verification witness |
|---|---|---|
| r1a F01: all-group parabolic comparison lacks a supplier | Partly repaired | Line 169 now says “Use the torsion-coefficient excursion comparison gap:general-parabolic-excursion-comparison”. The same slug is in the plan and line 79 names HS as supplier. This repairs ownership and retains arbitrary G. HS4.6 still assumes quasi-split G. New normalization and example errors remain: S02–S03. |
| r1a F02: independence of irreducible characters | Repaired | Line 97 now explicitly requests “pairwise nonisomorphic irreducible smooth complex representations” and “forces every a_i=0”. The same gap occurs in the plan and the Layer 1/4 consumers. ET2.16 supplies nonvanishing, not this independence. For GL₁ the new matrix has determinant −vol(𝒪_E×)², nonzero. |
| r1a F03: spherical normalization | Repaired | Line 38 says “raw double-coset operator … eigenvalue √q(2+3)=5√q” and “Satake-normalized operator … 2+3=5”. At q=2 these are 5√2 and 5; inverse half-modulus gives 11/√2. Line 185 agrees with current GS4's minuscule classical comparison. |
| r1b F01: character independence | Repaired | Same change and witness as r1a F02. The singleton Check is true: choose normalized compact-open idempotent e_K with π^K nonzero; its trace is dim π^K, e.g. 1 or 2, rather than infer a nonzero trace for an arbitrary nonzero operator. |
| r1b F02: general parabolic comparison | Partly repaired | Line 81 explicitly distinguishes “z-extensions G̃→G, not z-embeddings”. The declared HS gap owns the missing general reduction rather than assuming it from RG2.1.5. For SL₂(D), π₁=0, so a basic self-twist cannot reach SL₄. S03 refutes the replacement example's stronger z-embedding assertion. |
| r1b F03: wrong admissibility section | Repaired | Lines 61 and 187 cite “§SR.3a.1 (*admissibility-of-irreducibles*)”, including transport through ι. This is the current SR target, `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:2337`. Scalar endomorphisms over ℂ transport to ℚ̄_ℓ; continuity of ι is not asserted. |
| r1b F04(i): topology of stable-distribution span | Repaired | Line 29 specifies “weak-* closure, pointwise convergence on H(G)” and uses the annihilator condition. On H=ℂ², U=span(1,−1), annihilation is a−b=0, precisely span(1,1); (1,0) fails. No stronger topology is silently imported from ET2.4. |
| r1b F04(ii): Kazhdan density ownership | Repaired | Line 240 now cites “gap:kazhdan-cuspidal-decomposition”. For GL_n each regular stable class is one rational class; null f gives Θπ(z*f)=zπ·0=0, and this gap gives the converse to orbital nullity. |
| r1b F04(iii): algebraic representations assigned to RG2.5 | Repaired | Line 139 says “the algebraic representations V_μ come from ReductiveGroups Layer 10B”; line 143 retains “integral torus-weight character”. Main `TauCetiRoadmap/ReductiveGroups/README.md:1733` and line 1759 supply these targets. det and 1 on GL₂ have identical derived Lie restriction but central weights z² and 1. |
| r1b F04(iv): stable torus embeddings | Repaired; the repair's mathematical objection is valid | Line 95 now requires “x⁻¹σ(x)∈T for all σ”. E-rationality of Ad(x) on a fixed maximal torus implies precisely this since Z_G(T)=T. ET1.14 supplies the finite kernel class set. For elliptic SL₂ its size can be 2, whereas for GL_n it is 1. Line 513 uses embeddings, not full conjugacy saturation. |

No finding marked “not actionable in this package” is re-raised. External-owner slips mentioned only in the earlier repair's maintainer notes are not charged to this package. The current supplier drift S01 is independently witnessed at this round's supplied versions.

## Verified sound

Read all 718 README lines and all 64 Suggested.lean lines. The census is 28 numbered README sections, expanded to 32 statement units by separating §0.0's import, two comparisons and parameter, and §2.4(a)/(b). All appear below. Read the one Lean theorem, with no local definitions or instances. Tested all 84 Checks bullets (several bullets contain multiple tests); S03 is the failed bullet. Resolved 5 source texts and checked 32 target locator bundles and the source locators for all 16 declared supplier contracts. Cross-roadmap checking covered 11 named roadmap owners, including the nested LieHighestWeight roadmap; the section inventory is below. A locator count is a count of bundles, not a claim that a cited theorem proves every intervening sentence verbatim.

The headline census is §0.0(a)/(b), §0.5, §§1.5–1.6, §2.4(a)/(b), §2.5, §3.3, §§4.2–4.3, §§5.1–5.3 and §§6.1–6.2. The only presently statable headline on actual pinned carriers is §2.4(a), and it is present. All remaining headline groups and their missing carriers are named in the module docstring. Generic linear subspaces, means or quotient rings would not make these geometric statements statable. No padding declaration was found: the quantitative highest-weight estimate requires the Weyl character identity and nontrivial Fourier bounds, not one library lemma or one tactic.

### Declaration and binder table

| Declaration; section | Variables and instances actually in the written type | Instances and computed values | Result/change |
|---|---|---|---|
| `weightPushforward_sum_abs_sub_uniform_le`, Suggested.lean:44; §2.4(a) | K,L arbitrary Type universes; Field K, CharZero K, IsAlgClosed K; LieRing L, LieAlgebra K L, IsKilling K L, FiniteDimensional K L; Cartan H; root base b; finite additive commutative A; φ from the additive root closure, explicitly surjective. ∃ real C≥0 precedes ∀m≥1 and ∀ finite-dimensional Lie modules M and v. Highest-weight and lieSpan=⊤ are explicit implications. There are no section variables to lose. | A₁, A=ℤ/2: m=1 gives (3/5,2/5), error 1/5≤1/4; m=2 gives (5/9,4/9), error 1/9≤1/8. A=ℤ/3: m=1 gives (1/5,2/5,2/5), error 4/15; m=2 gives (1/3,1/3,1/3), error 0. A₂, α↦1, β↦0 mod 2, m=1: counts 65 and 60 out of 125, error 1/25. Rank zero forces A=0 and dim M=1: error 0. | Sound as a mathematical signature. φ=0 into ℤ/2 is excluded: its error is 1 for every m. m=0 is excluded: error 1 versus total C/0=0. Zero M fails v≠0. No signature edit indicated; no fresh elaboration claimed. |

For the A₂ count, the three root factors have 5 terms each; the α and α+β factors contribute even/odd counts 3,2, giving (3²+2²)·5=65 and 2·3·2·5=60. These calculations test multiplicities, not just distinct weights. The proof of the arbitrary-field statement uses the integral character polynomial; complex Fourier analysis is on the finite quotient, so it does not require an embedding K→ℂ.

### Statement table

The common context for all local-group rows is E/ℚ_p finite, G smooth connected reductive, ℓ≠p, complex character coefficients transported from ℚ̄_ℓ, and the fixed normalized induction/measure dictionary. “Conditional” means the declared supplier contracts are inputs, not proved facts at the pins. Linear fixtures test formulas but are not asserted to be p-adic character spaces.

| Statement | Instances tried | Values on the two sides / negative control | Result; change |
|---|---|---|---|
| Conventions, README:19–41 | Torus δ_t, t²≠1; GL₂ at q=2,4; quaternion twist; p=2 | (δ_t*f)(1)=f(t⁻¹)=0, δ₁(δ_t*f^vee)=f(t)=1. Raw GL₂ eigenvalue 5√2 versus normalized 5. Unnormalized induction at q=4 has trace 11/2 versus wrong twist 7. Quaternion transfer 3↦−3, not +3. | Arithmetic, inversion and sign sound; representation-label transport needs S02. q=1, ℓ=p, zero coefficients and equal characteristic are excluded, not silently handled. |
| 0.0 imported Ψ/action, :161–163 | Unit datum; zero creation; GL₁ parameter 2; zero compact object | 1↦identity, 0↦0; coordinates t,t⁻¹ evaluate to 2,1/2. Zero object has zero Hecke transforms for every wild subgroup. Raw same-label action instead inverts the parameter. | S01–S02; zero/rescaled maps fail the fixed evaluations. |
| 0.0(a) basic restriction, :165 | b=1; GL₁ nonneutral basic stratum | Both maps take 0↦0, 1↦1; translating degree retains intrinsic scalar 2 (and inverse 1/2). | Correct target; replace its missing comparison supplier by S01 and retain S02's label convention. |
| 0.0(b) normalized Levi compatibility, :169 | GL₂,T; P=G; SL₂(D) | res(trace)(2,3)=5=tr diag(2,3); opposite correction at q=4 gives 7 instead of 11/2 for unnormalized induction. P=G has 2ρ−2ρ=0. SL₂(D) has π₁=0 but a proper rational Levi. | General gap repairs the previous scope defect; S02–S03 remain. |
| 0.0 FS parameter, :187 | GL₁; semisimple diagonal GL₂; unipotent SL₂ | 2 and 1/2 on reciprocal Frobenius. diag(2,3),diag(3,2): (tr,det)=(5,6); diag(2,4): (6,8). Nonidentity unipotent and identity have (2,1). | Semisimplicity is essential; classification is of continuous conjugacy classes, not arbitrary complex-topological homomorphisms. |
| 0.1 stable central distributions, :203 | Torus; zero; δ₁; U=span(1,−1) | U(T)=0, hence all central distributions qualify. Zero evaluates to 0. For unstable f, δ₁(f)=f(1)=0 conditionally. Pairing gives a−b=0 iff a=b; (1,0) gives 1. | Correct annihilator definition; weak-* interpretation as stated. |
| 0.2 very stable subalgebra, :225 | Torus; GL_n; 0,1; diagonal model | 0*u=0 and 1*u=u; torus U=0. For GL_n, Θπ(z*f)=zπ·0=0 for null f. diag(a,b)(1,−1)=(a,−b) lies in U iff a=b. | Sound conditionally; zero-preservation alone does not define very stability. |
| 0.3 inclusion/module, :247 | Torus inversion; unit; scalar 2 | SO_t(f^vee)=0=SO_(t⁻¹)(f), reverse test 1=1. y*δ₁=y. Stable functional (3,3) becomes (6,6). | Sound with the inverse in the evaluation identity and the inversion contract. |
| 0.4 three-way criterion, :260 | U=span(1,−1), annihilator span(1,1) | diag(2,2) sends generators to (2,−2),(2,2), both in the respective lines. diag(1,0) sends both to (1,0), in neither. | Both directions agree; arbitrary characters are not substituted for stable tempered separation. |
| 0.5 faithful stable-tempered action, :272 | Scalar line; torus | 2·1=2≠0; 0·1=0. For a central z annihilating the stable characters, z*f^vee∈U and δ₁(z*f^vee)=z(f)=0. | Faithfulness follows conditionally; inversion is present. |
| 1.1 virtual-character Hecke operators, :294 | Cohomology dimensions 2,1 in degrees 0,1; shift; unit; zero | Euler value 2−1=1; shift gives −1, shift twice gives 1; unit functor gives the original character, zero gives 0; direct sum of two units gives 2. | Finite-length, boundedness and character independence are explicitly owned. |
| 1.2 Hecke/centre commutation, :317 | Unit/zero; two-coordinate negative control | Identity commutes; zero gives 0=0. Swap and diag(1,2) on (1,1) give (2,1) versus (1,2), so arbitrary operators would fail. | Correct geometric target; S01–S02 concern its imported realization. |
| 1.3 stable Hecke modulo induction, :329 | μ=0; A₁ dimension 5 and elliptic value 3; induced character | Unit gives Θ−Θ=0. For dimension 5 the elliptic values are 15 and 5·3=15; their difference is 0. An induced correction has elliptic value 0. | Sound with all-weight trace and the elliptic-kernel contract; not equality of full virtual characters. |
| 1.4 two inner-form operators, :341 | Torus degree 1; unit; zero; cohomological shift | Under Hansen labels forward weight −1 goes 1→0, reverse weight +1 goes 0→1. Dimensions are 1; zero gives 0; a single shift changes 1 to −1. | Correct Hansen formulas; S02 must identify them with the opposite raw HS labels. |
| 1.5 central commutation across forms, :364 | Scalar 2, transfer value −2; zero | Both sides −4. Replacing target scalar by 3 yields −6 and fails. Zero gives 0=0. | Sound for the same spectral element and corrected action comparison. |
| 1.6 stable inner Hecke formula, :376 | GL₂/quaternion, μ=(1,0); μ=0; zero | e(G)e(G_b)=−1; two weight multiplicities sum to 2, giving −2·3=−6. μ=0 gives +1·1·Θ; zero character gives 0. | Sign and multiplicity count correct. Basic weight-fibre existence is a declared input. |
| 2.1 finite stable average, :399 | Values (2,6); singleton 2; zero; repeated averaging | (2+6)/2=4 versus unnormalized sum 8 and weighted mean 5. Singleton 2/1=2; zero mean 0; averaging (4,4) gives 4. | Sound, with a genuine finite nonempty class set. |
| 2.2 dual-root sequence, :422 | Rank 0; A₁; B₂; m=0; GL₂ central weights | Empty product=1. A₁ μ₁=2α, dim=5, not 3. B₂ coroot sum=4e₁+2e₂ versus root sum=3e₁+e₂. m=0 gives μ=0,dim=1. GL₂ det(zI)=z² versus trivial 1. | Correct dual datum and central-weight retention. GL₂ κ(1,0)=1 excludes neutral class; κ(1,−1)=0 includes it. |
| 2.3 normalized weight kernel, :450 | SL₂ elliptic norm-one torus; GL₁; A₁ mod 2 | SL₂ coinvariants ℤ/2 with π₁=0 give H_g=ℤ/2, not rationalized 0. GL₁ kernel of ℤ→ℤ is 0. A₁ m=1 masses 3/5+2/5=1, m=2 masses 5/9+4/9=1. | Sound; finite root-quotient mass, not all cocharacters or an already-uniform kernel. |
| 2.4(a) root-lattice estimate, :474 | A₁ mod 2, mod 3; A₂ mod 2; rank zero; nonsurjective φ; m=0 | Values in the declaration table: errors 1/5,1/9; 4/15,0; 1/25; 0. Nonsurjective φ gives error 1 for every m, and m=0 gives 1 versus C/0=0. | Explicit surjectivity, m≥1, nonzero generated highest-weight module and uniform quantifier order are correct. |
| 2.4(b) local uniform estimate, :476 | Singleton torus; two finite torus types with constants 1/4 and 1 | Torus error 0. Choosing C_G=1 bounds errors ≤(1/4)/m and ≤1/m simultaneously; no dependence on the individual element g is introduced. | Finiteness of rational torus types is the declared contract; taking a finite maximum is valid. |
| 2.5 weighted character average, :488 | GL₂ discriminant; A₁ quotient character values (2,6) | D(diag(2,3))=(1−2/3)(1−3/2)=−1/6, norm over ℚ₅ is 1, invariant under swapping/inversion. Hecke means 18/5,34/9 differ from 4 by 2/5,2/9. | Correct. The split GL₂ example checks discriminant normalization, not the ellipticity hypothesis of the theorem. |
| 3.1 compact representative set, :511 | Empty C_T; torus {1}; SL₂ conjugacy orbit | Finite union of empty images is ∅; torus gives {1}. Conjugating [[0,−1],[1,0]] gives off-diagonal valuations 2n,−2n, unbounded as n grows. | Compact representatives are not compact full orbits; finite embedding classification is sufficient. |
| 3.2 cuspidal pairing convergence, :523 | Torus test; zero; measure 2 and bounds 3,5/m | O_t(f)=c f(t) with c>0; f=0 has empty support. Integral estimate is 2·3·5/m=30/m; zero gives 0. Constant 1 on E× lacks compact support. | Correct conditional estimate; two half-discriminants account for the full Weyl factor. |
| 3.3 very stable FS image, :536 | Rank zero; constant pairing; elliptic/cuspidal decomposition | Torus U=0. If a constant is 1, bound 30/m fails at m=31; thus the constant pairing is 0. For unstable f, its cuspidal component pairs to 0 with stable induced terms and with stable elliptic terms after subtracting the annihilating complementary component. | Source argument works from the declared dual stable decompositions without assuming zΘ stable. Generality is retained; S01–S02 must be fixed upstream in this package's proof route. |
| 4.1 atomic support, :558 | Zero; torus singleton/pair; ℂ³ fixture; stable line | Supports have sizes 0,1,2. Zero excluded; singleton atomic; pair not atomic. In span{(1,2,0),(1,1,1)}, (1,2,0) has support 2 versus 3; no proper nonzero 0/1 vector lies in that plane. In span(1,2), every nonzero vector has support 2. | Correct arbitrary-coefficient minimality; nonzero competitor condition repairs the source slip. |
| 4.2 scalar rigidity, :582 | Atomic vector (1,2), scalars (3,3) or (3,5) | (3,6)−3(1,2)=(0,0); (3,10)−3(1,2)=(0,4), nonzero with smaller support. | Sound: nonzero constituent coefficients permit cancellation. |
| 4.3 parameter constancy, :594 | Torus singleton; diagonal GL₂ | (2,3) and (3,2) have invariants (5,6); (2,4) gives (6,8). Singleton has one parameter. | Equality of all invariants, not trace alone, is used. No assertion of FKS packet atomicity is imported. |
| 5.1 kernel inclusion, :618 | b=1; quaternion inner GL₂; zero spectral element | b=1 gives identical kernels. Sign −1 times dimension 2 times detected value 3 is −6≠0. Zero maps to 0 on both forms. D× has no proper rational parabolic; the split diagonal torus is irrelevant. | Sound rank induction with basic-Levi lifts, faithfulness and both inner Hecke directions. |
| 5.2 image-centre surjection, :631 | Identity twist; nonneutral torus; ℂ[X]; two projections of ℂ² | Identity fixes 0,1 and torus coordinate 2. Evaluation quotient sends X↦0, X+2↦2. For projections, (0,1) would require τ(0)=1, impossible. | Correct direction of kernel inclusion and surjectivity onto image only. |
| 5.3 Levi square, :656 | M=G; spectral 0,1; nontrivial restriction a | Both composites are τ for M=G; on Ψ(a), both equal Ψ_M(res a); at 0,1 they give 0,1. | Correct induced map on actual FS subalgebras, using §0.0(b) and the basic lift. |
| 6.1 stable character transfer, :678 | Elliptic value 3, sign −1, scalar 2; irrelevant/induced summands | −1·(2·3)=2·(−1·3)=−6. Irrelevant summands give 0=0. Induced corrections have elliptic value 0. | Sign, Levi induction and elliptic injection match the contract. |
| 6.2 matching convolution, :690 | Signed pair (3,−3), scalar 2; irrelevant classes; unstable perturbation | Values become (6,−6). Irrelevant values remain 0. Unstable perturbations contribute stable orbital value 0. | Correct matching factor, using transfer duality and unstable-tempered separation. |

### Supplier contracts and ownership

All 16 gap slugs occur both in `packages/ExcursionOperatorsAndSpectralActionPartII/design/plan.json` and under the appropriate exact supplier subsection of its README. Every supplier is named. The contracts specify the local field and coefficient context, domains, codomains and required compatibility. Their several clauses specify one interface each; none is an unrelated bundle of new theories. The finite arithmetic mean, finite Fourier basis, Weyl formula and quotient-to-image equivalence are imports, not gap requests. S02 requires correcting the label convention in one gap. No other gap was found to ask for an already supplied complete interface.

| Gap slug | Supplier and minimal missing interface | Computed boundary/control values |
|---|---|---|
| bernstein-distribution-realization | SmoothRepresentationsOfLocalGroups SR.3.2; extend its existing corner-centre description to distribution evaluation | δ_t on f(t)=1,f(t⁻¹)=0: z(f)=1=(z*f^vee)(1), whereas (z*f)(1)=0. |
| normalized-bernstein-levi | SmoothRepresentationsOfLocalGroups SR.3.2; restriction acting compatibly on normalized induction and constant terms | Scalar 2 and trace 3 give 6=6; z=1 gives 3=3; f=0 gives 0=0. |
| all-weight-shriek-trace | HeckeStacksAndLocalShtukas HS3.8/HS3.10 continuation; trace after duality/inversion, not star=shriek | μ=0 gives 1·Θ; quaternion μ=(1,0) gives sign −1 and dimension 2, hence value −6 for input 3. |
| elliptic-torus-representatives | EndoscopicTransferAndUnitaryTraceComparison §§1.3–1.16; finiteness of torus types, beyond finiteness within a fixed class | A torus has exactly one maximal-torus type; an SL₂ conjugacy orbit still has valuations ±2n and is unbounded. |
| stable-orbital-inversion-duality | EndoscopicTransferAndUnitaryTraceComparison §§2.1/2.4; measure-compatible inversion | Torus test gives 0=0 at t and 1=1 at t⁻¹. |
| basic-invariant-comparison | BunGAndNewtonStrata §1.36; compare its integral invariant to ET's cocycle | Norm-one torus coinvariants are ℤ/2; the nonzero class maps to 1, not to 0 as after rationalization. |
| weight-fibre-classes | BunGAndNewtonStrata §§1.18–1.19/1.23/1.36; actual matching rational-class fibres | GL₂ quaternion standard weights both have invariant 1 and contribute total multiplicity 2; neutral torus weight 0 has one class, multiplicity 1. |
| basic-levi-lift | BunGAndNewtonStrata §§1.18–1.19/1.24; existence of lifts for rational inner-form Levis | D× has only its full Levi; GL₂(D) block D××D× corresponds to GL₂×GL₂ with basic invariants (1,1) mapping to 2. |
| kazhdan-cuspidal-decomposition | EndoscopicTransferAndUnitaryTraceComparison §2.16; common null spaces and cuspidal splitting | In torus rank zero there is no proper induction and null space is 0. In a two-summand pairing fixture (1,0) is detected by the first dual vector and annihilated by the second. |
| arthur-stable-decompositions | EndoscopicTransferAndUnitaryTraceComparison §2.16; stable dual splittings and elliptic kernel/injection | Diagonal central scalar 2 preserves both coordinate summands; an induced character restricts to 0 on the elliptic locus. |
| unstable-tempered-separation | EndoscopicTransferAndUnitaryTraceComparison §§2.4/2.11; stable annihilator and δ₁ | U=span(1,−1) annihilator consists of (a,a); (1,0)(1,−1)=1. For unstable f the required δ₁ value is 0. |
| stable-tempered-projection | EndoscopicTransferAndUnitaryTraceComparison §2.16; projection with finite arithmetic elliptic average | (2,6)↦(4,4) and then (4,4)↦(4,4); weighted (1/4,3/4) average would be 5 and fails. |
| bounded-elliptic-orbital-integrals | EndoscopicTransferAndUnitaryTraceComparison §2.1; compact support closure, distinct from bounded values | Torus f=1_(𝒪_E×) has orbital support 𝒪_E×; f=0 has ∅; constant 1 on E× is not a test function. |
| stable-inner-character-transfer | EndoscopicTransferAndUnitaryTraceComparison §§1.6/1.13/2.11/2.16; signed transfer and induction duality | e(D×)=−1 sends 3→−3; applying scalar 2 gives −6 by either route; irrelevant summand gives 0. |
| irreducible-character-independence | EndoscopicTransferAndUnitaryTraceComparison §2.16; independence, beyond single-character nonvanishing | GL₁ matrix determinant −vol²≠0. Vectors (1,1),(2,2) have determinant 0 despite nonvanishing. Empty family has zero sum and no coefficients to recover. |
| general-parabolic-excursion-comparison | HeckeStacksAndLocalShtukas HS4.6 continuation; arbitrary inner forms, as normalized by S02 | GL₂ q=4: corrected trace 11/2 versus inverse correction 7; identity Levi twist 1; SL₂(D) has π₁=0; centre of proposed GL₂(D) enlargement maps by λ⁴ and misses valuation 1 (S03). |

The current cross-roadmap section inventory is:

- SmoothRepresentationsOfLocalGroups SR.0.4, SR.0d.2, SR.1.1, SR.1.3, SR.2.2, SR.3.1–SR.3.3 and SR.3a.1: categories, normalized induction, duality, corner centres, finite length and admissibility. Complex coefficients satisfy the invertible-pro-order duality hypotheses; no modular-coefficient biduality is silently used.
- HeckeStacksAndLocalShtukas HS0.6, HS1.1–HS1.3, HS1.5–HS1.7, HS3.8, HS3.10, HS4.1–HS4.3 and HS4.6: inner twist, Hecke/duality and excursion diagrams. HS3.11 is absent. Its current shared lisse functor is AG2.6; its torus shifts have the opposite raw labels (S01–S02).
- EndoscopicTransferAndUnitaryTraceComparison §§1.2(a), 1.3, 1.6(ii)–(iii), 1.11, 1.13–1.16, 2.1, 2.4, 2.11, 2.16 and 4.7: integral invariants, signs, stable classes, character bounds and transfer. The resolver's `TauCeti.IsStableDistribution` and `TauCeti.normalizedOrbitalIntegral_bounded` leads refer to actual planned ET targets, not missing pinned declarations. The package explicitly chooses weak-* closure for the former and accounts for the finite centralizer measure factor for the latter.
- BunGAndNewtonStrata §§0.5–0.6, 1.11, 1.13, 1.18–1.19, 1.23–1.24, 1.36 and 1.44: both invariants, basic inner forms, acceptable classes, integral torus coinvariants and the connected-centre quasi-split lift. An arbitrary basic class can be lifted to a dominant μ; the full κ condition is retained.
- GeometricSatakeAndFusion GS4, “Integral identification, normalization and functoriality”: duality and normalized Satake, with the minuscule trace/classical comparison at `TauCetiRoadmap/GeometricSatakeAndFusion/README.md:2183` and line 2220. The canonical trace has the component sign correction; the negative raw alternating perverse trace is not substituted for it.
- ReductiveGroupsPartII RG2.1.5 and RG2.5: integral π₁, root data and pinned dual/Levi data. Its z-extension is a surjection, not the enlargement required in FS24. Main ReductiveGroups Layers 1, 2, 7, 10A–10B supply the actual rational group representations, including central weights.
- RepresentationTheory/LieHighestWeight Layer 6 supplies the general character/dimension direction; the package uses the actual pinned Tau Ceti implementations rather than planning them again.
- IgusaVarietiesAndTorsionConcentration IG.F.18–IG.F.22 and AutomorphicGaloisRepresentationsPartII AG2.6: both use the common normalized action. The all-group parameter attachment is present; IG.F.22's extra GL_n compatibility assertions are not promoted to arbitrary G.
- LanglandsParameterStacks LP1.2, LP2c.5 and LP2c.8: wild-kernel strata, continuous semisimple reconstruction and Schur objects. Finite-wild opens are not asserted disjoint. A Schur irreducible is considered through the fully faithful stratum embedding and ambient Hecke datum; the stratum itself need not be stable under all Hecke operators.

Ownership searches used `roadmaps grep` on both README and Lean files, plus object searches in the provided main/completed and open-head collection, board packages and both pinned libraries. Searches for the declared theorem name, weight equidistribution, atomic support and very stable Bernstein distributions found no competing theorem owner. The generic finite mean, Fourier basis, exact K₀ and algebra image operations do have earlier owners and are cited rather than redeclared. The package owns the specialized root-lattice estimate and the stable-distribution consequences of the geometric action. It does not own the geometric spectral action itself; S01 repoints to its current owner. No duplicate fully qualified Suggested.lean name was found. No later roadmap is required to supply a target, and no ownership move to a later roadmap is proposed.

### Pinned declaration audit

Pins read from `lake-manifest.json`: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Paths in this table are library-relative.

| Native input | Declaration / file witness | Scope checked |
|---|---|---|
| Finite support | `Finsupp.mem_support_iff`, `Mathlib/Data/Finsupp/Defs.lean:158` | Membership is exactly nonzero coefficient; supplies neither representations nor character independence. |
| Linear/algebra subobjects | `Mathlib/Algebra/Module/Submodule/Defs.lean`; `Mathlib/Algebra/Algebra/Subalgebra/Basic.lean` | Genuine closure predicates; no assertion that a stable subspace is an algebra is smuggled into Z_st. |
| Arithmetic mean | `Finset.expect`, `Fintype.expect_eq_sum_div_card`, `Mathlib/Algebra/BigOperators/Expect.lean:371` | Cardinal division over a field; nonempty class set supplies nonzero denominator. |
| Fourier basis | `AddChar.complexBasis`, `Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean:125`; `AddChar.wInner_cWeight_eq_boole`, `Orthogonality.lean:58` in the same directory | Finite additive commutative group, complex character orthogonality; no representation-weight assertion included. |
| Image and quotient | `AlgHom.range`/`rangeRestrict`/`rangeRestrict_surjective`, `Mathlib/Algebra/Algebra/Subalgebra/Basic.lean:545`, line 582, line 588; algebra version of `Ideal.quotientKerEquivRange`, `Mathlib/RingTheory/Ideal/Quotient/Operations.lean:819` | Surjectivity onto range, not the whole codomain; quotient map still needs the package's geometric kernel inclusion. |
| Integral estimate | `MeasureTheory.norm_integral_le_of_norm_le_const`, `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean:999` | Finite measure and nonnegative real bound; applied only on compact restricted torus pieces. |
| Grothendieck/Euler carriers | `TauCeti.ExactK0`, `.lift`, `TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean:324`; `TauCeti.AbelianK0.homologyEulerChar`, `TauCeti/CategoryTheory/GrothendieckGroup/EulerCharacteristic.lean:307` | Exact/additive, essentially small category with the stated biproduct hypotheses; finite integer-degree sum. Neither finite-length output nor injectivity of the character map is supplied by these definitions. |
| Highest weight | `TauCeti.IsHighestWeightVector`, `TauCeti/Algebra/Lie/HighestWeight/Basic.lean:122` | Includes v≠0, eigenvector and positive-nilradical conditions. Lie-span generation is a separate explicit hypothesis in Suggested.lean. |
| Character and Weyl vector | `TauCeti.formalCharacter`, `TauCeti/Algebra/Lie/Weights/FormalCharacter.lean:156`; `TauCeti.twoWeylVector`, `TauCeti/LinearAlgebra/RootSystem/Weyl/Vector.lean:102` | Generalized-weight dimensions as integer coefficients; full positive-root sum, hence 2m times it is 4mρ. |
| Weyl formulas | `TauCeti.formalCharacter_mul_weylDenominator_eq_weylNumerator`, `TauCeti/Algebra/Lie/HighestWeight/Weyl/Character.lean:319`; `TauCeti.finrank_eq_prod_coweightPairing_div`, `TauCeti/Algebra/Lie/HighestWeight/Weyl/Dimension.lean:113` | Killing-semisimple, algebraically closed characteristic zero, finite-dimensional generated highest-weight module, and finite Weyl enumeration where required. These do not themselves state the finite-quotient C/m estimate. |

The module has the single `import Mathlib`, three existing used Tau Ceti imports, one theorem with `sorry`, and no data placeholder, `lemma`, `set_option`, `#eval`, arbitrary free predicate or hypothesis containing its conclusion. Its own backticked theorem name appears in the README. No computational algorithm is planned. `git diff --stat origin/main...HEAD` reports 10 changed files, 1787 insertions and 44 deletions, all within this package. No README/docstring pull-request number or process instruction was found.

The standing field/group hypotheses rule out zero rings, inseparable ground extensions, nonreduced bases and arbitrary non-quasi-separated spaces. These are not valid substitutions for E/ℚ_p and a smooth connected reductive G. S₃ and Q₈ are not such G, nor candidate finite additive abelian quotients A; they were not used to manufacture irrelevant counterexamples. Empty sets are valid in support/compact-representative tests, but R_g and A cannot be empty. There is no natural subtraction/division indexing a dimension in Suggested.lean; the only relevant total-division trap is m=0, explicitly excluded. At p=2 or 3, choosing ℓ different from p leaves all complex-character targets within scope, and the tests retain q≥2 and invertible nonzero dimensions. No good-prime shortcut was introduced.

### Dependency check

The requested read-only dependency check completed with:

```text
depcheck: 186 roadmaps, 1219 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Locally, §0.0 precedes character commutation, Layer 2 precedes the integrated estimate, Layer 3 precedes scalar rigidity and kernel inclusion, and §5.3 precedes transfer induction. Proper rational parabolic Levis have smaller absolute semisimple rank. The missing citation S01 is not detected by a roadmap-level order check and remains a finding.

## Not verifiable

- Fresh Lean elaboration and mechanically printed binders: not performed, as this review is read-only and forbids builds. The supplied signature attempt exited 1 because the pinned `TauCeti/Algebra/Lie/HighestWeight/Basic.olean` object was unavailable. The previous repair reports a successful earlier elaboration, but that is not substituted for a run at the current pins. The explicit source-level binder audit above found no lost hypothesis.
- The substantial geometric, harmonic-analysis and arithmetic suppliers are planned work. This review verifies their stated contracts and ownership, not their future Lean proofs. Acceptance of the downstream statements is conditional on the 16 declared gaps, with the convention correction in S02.
- No source text was missing: all five cited works were available as the legally cached versions recorded in `sources.toml`. No additional reference request or manifest edit was made. External works cited inside those five works were not recursively certified; where a supplied theorem is used, this report certifies that theorem's actual statement and the inspected proof step, not every reference in its bibliography.
- No Lean build, repository-source edit, git write or external post was made. Output is limited to this report and scratch review notes.

## Source issues

- **Misprint** in H26 at atomic-stability definition, p. 2 (H26 line 74): the source says no smaller supported linear combination is stable; it should be no nonzero smaller supported combination is stable, since zero is always stable; affects a stated result.
- **Misprint** in H26 at Lemma 2.3 proof and preceding paragraph, p. 6 (H26 line 281 and line 287): the source says convolution evaluated at identity equals evaluation on the original test; it should be evaluation on the inverted test under usual convolution, or use f^vee before convolving; affects the proof.
- **Misprint** in H26 at the averaging sequence before Lemma 2.6, p. 8 (H26 line 365): the source says the highest-weight sequence uses positive roots of G; it should be positive roots of the dual group, equivalently positive coroots of G; affects a stated result.
- **Gap** in H26 at §2.3, p. 11 (H26 line 501): the source says the previously defined stable projection is applied to every element of D(G); it should be restricted to D_temp(G), the domain defined earlier and sufficient for the argument, or extended explicitly; affects the proof.
- **Misprint** in H26 at §2.4 reverse Hecke composite, p. 13 (H26 line 622): the source says the extension has subscript i; it should be the neutral-stratum extension i₁!, as required by the domain; affects the proof.
- **Error** in HKW22 at Lemma 3.1.1 proof, p. 13 (HKW22 line 580): the source says all H¹(F,N_G(T)) classes classify maximal tori inside the fixed G; it should be the kernel of H¹(F,N_G(T))→H¹(F,G); affects the proof.
- **Misprint** in HKW22 at equation (3.3.3), p. 18 (HKW22 line 848): the source says ρ is the full positive-root sum; it should be the half-sum, so the exponent uses the full sum once; affects a stated result.
- **Misprint** in HKW22 at compatible torus measures, §3.4, p. 19 (HKW22 line 886 and line 887): the source says the torus determinant line is the dim(G)-th exterior power; it should be the dim(T)-th exterior power of the torus cotangent space; affects the proof.
- **Misprint** in FU25 at proof of Theorem 4.3.1, p. 26 (FU25 line 1052): the source says the formal character belongs to the root lattice; it should be an element of the lattice group algebra, with support in that lattice; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c9dafac4cf268a575d26e859c2254bc488d8677b", "job": "RT-ExcursionOperatorsAndSpectralActionPartII~2a", "model": "gpt-6-astra", "worker": "chris-30"} -->
