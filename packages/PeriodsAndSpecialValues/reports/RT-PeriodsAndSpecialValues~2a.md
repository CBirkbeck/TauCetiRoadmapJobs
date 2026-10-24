<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/169#issuecomment-6378403246 -->
Red team round 2 pass a (codex) of 9f14c68

Verdict: needs_changes

1. **F01** (P2) The new regulator section duplicates two earlier owners

   **Location:** `packages/PeriodsAndSpecialValues/README.md:745`: “First prove Borel's stable comparison for every number field F”; line 747: “construct the renormalized Borel regulator”.

   **Claim:** PS.3.2a owns stable arithmetic comparison, rational K-ranks, Borel and Beilinson regulators, their factor two, and the Adams weight.

   **Witness:** `TauCetiRoadmap/ArithmeticKTheory/README.md:967` owns the stable comparison and ranks. `TauCetiRoadmap/BorelRegulators/README.md:790` states the identical regulator factor and determinant; line 812 states the Adams scalar. Both precede this roadmap.

   **Exact repair text:** “Import rational localization, stable arithmetic comparison and Borel ranks from ArithmeticKTheory §§3.2–3.4; import the Chern-normalized regulator, real isomorphism, point Deligne comparison and Adams weight from BorelRegulators §§2.1–2.3, 5.3 and 6.0a–6.3, with its declared finite-stage contract where needed. PS.3.2a only identifies these supplied maps and their ordered determinant with the number-field factors of PS.3.2.” Delete the duplicate constructions and redirect PS.9.8–PS.9.9 to these owners. With F=ℚ,j=2,3 the imported ranks remain 0,1 and determinant ratios remain 1,2; with a real quadratic field,j=3 the ratio remains 4 and det(ψ²)=64.

2. **F02** (P1) Modular-symbol periods are equated with the wrong Deligne periods

   **Location:** `packages/PeriodsAndSpecialValues/README.md:525`: “Ω_f^± ~ c^±(M_f) in E^×-classes”; also line 517.

   **Claim:** The supplier's signed modular-symbol period equals the same-sign inverse-comparison period without a Tate factor.

   **Witness:** In PS.0.5's CM Legendre example, c⁻=2K/det(B), det(B)∼2πi, and Ω⁻∼2iK. Thus c⁻/Ω⁻∼1/π∉ℚ. ModularSymbolsPadicLFunctions §1.2 instead normalizes L(f,1) by Ω⁺ in weight two.

   **Exact repair text:** “Let the weight be k and put j=m−1. Match the actual signed modular-symbol normalizer with the motivic one: for 1≤m≤k−1, (2πi)^m c^{(−1)^m}(M_f) ~ (−2πi)^{m−1} Ω_f^{(−1)^{k−m−1}}/(m−1)! in coefficient-field unit classes. Prove this through the marked geometric comparison; do not identify Ω_f^± with c^±(M_f). Retain the supplier's Gauss factor and sign when adding character twists.” Replace the first interface bullet with this statement. Add the weight-two Check “Ω_f⁺ ~ 2πi c⁻(M_f)”; in the Legendre calculation it gives 2K on both sides up to a rational unit. Deligne (7.8.3), Deligne line 999, supports the motivic normalizer; the supplier's §1.2 fixes the other one.

3. **F03** (P1) The quartic interface applies the transformed operator to the raw period

   **Location:** `packages/PeriodsAndSpecialValues/README.md:1433`: “The operator annihilates ∫_γΩ. Its ascending coefficients are −3/(32t⁴), (6/t³−t)/64, −3(t⁴+1)/(64t²), (1−t⁴)/(64t).”

   **Claim:** The operator with these coefficients annihilates the unnormalized residue period.

   **Witness:** These are L_z pulled back to t. The raw solution is t⁻¹(1+24/(256t⁴)+⋯). Its image under that operator starts t⁻¹/64, not zero; D_t annihilates it instead.

   **Exact repair text:** “D_t annihilates ∫_γΩ. The pulled-back L_z annihilates t∫_γΩ and has ascending coefficients −3/(32t⁴), (6/t³−t)/64, −3(t⁴+1)/(64t²), (1−t⁴)/(64t).” Add the raw t⁻¹ leading-term negative control; the corrected input starts 1 and its z coefficient 24 cancels L_z(1)=−24z. The main paragraph at line 1424 already uses this correct distinction.

4. **F04** (P2) The weight −1 compatibility cannot cover positive-rank elliptic motives

   **Location:** `packages/PeriodsAndSpecialValues/README.md:1172`: “For a motivic triple (V, D, Φ) of weight ≤ −1”; line 1178: “In weight −1 prove compatibility with the elliptic adapter”. Also the global-point and cocompactness claims at line 1080.

   **Claim:** The global Φ-triple formulation supplies the same weight −1 BSD compatibility as PS.6.3. Although the real and adelic regulator isomorphisms are explicit premises, they exclude every positive-rank elliptic input, making the advertised rank-one compatibility vacuous.

   **Witness:** For positive-rank E/ℚ, h¹(E)(1) has dim D=2, dim D⁰=dim V∞⁺=1 and D⁰+V∞⁺=D. Thus R∞ forces Φ=0, whereas Kummer forces dim H¹_f≥1. BK line 1304 restricts global triples to weight ≤−3.

   **Exact repair text:** “Construct local points and the regularized product measure for weights ≤−1 as above. The original Bloch–Kato global Φ-triple, arithmetic quotient, Proposition 5.14 and Conjecture 5.15 below retain the weight ≤−3 hypothesis. For h¹(E)(1), use the determinant formulation of PS.6.3, including the Mordell–Weil space and its nondegenerate height pairing; the local regularized measure supplies its local normalization, not a Φ-triple or a discrete quotient by positive-rank E(ℚ).” Apply this separation in PS.6.1, PS.6.2, PS.6.5 and the Checks. Delete the assertion that the original triple's weight−1 formula yields all scalar BSD identities. A concrete negative control is E:y²=x³−2: P=(3,5) is infinite order since x(2P)=129/100 contradicts integral torsion coordinates. Its finite Selmer space contains a nonzero Kummer line, while the displayed real quotient is zero. The repaired PS.6.3 keeps that line and its height determinant. This is a new error introduced by the repair of review-a F09, not a demand to discard the valid weight ≤−1 local measure.

5. **F05** (P3) Source-register locators were mixed between unrelated works

   **Location:** `packages/PeriodsAndSpecialValues/sources.toml:213`: “§§3–4; Burgos, Theorems 9.9, 9.12 and 10.9”; line 508 repeats the Burgos/DG material under Tate. README line 747 gives “pp. 72–74”.

   **Claim:** These locators identify passages of Kedlaya and Tate; the Burgos rank theorems occupy printed pages 72–74.

   **Witness:** Burgos line 3189 places Theorem 9.9 on printed page 79; line 3256 places Theorem 9.12 on page 80. The K and Tate entries name different authors' works; `packages/PeriodsAndSpecialValues/sources.toml:409` also includes BK, BV and HMS locators.

   **Exact repair text:** In the Burgos entry and remaining README citation use “Theorem 9.9, printed p. 79; Theorem 9.12, printed p. 80; §9.5, especially Definition 9.24; Theorem 10.9, printed pp. 95–97.” In K retain only Kedlaya locators, including “§§2.3.6, 2.3.8, 3–4” for the actual uses; in Tate-legal retain only “(3.4.3)–(3.4.7), printed p. 15”. Remove every other-work clause from each source's locator and restrict each cited_for list to actual uses of that source. Replace generic “Sections and equations cited in README” entries with the specific locators already given in the corresponding targets. Preserve the existing IDs, provenance and settled access statuses. The repaired 9.9/9.12 locators resolve to pages 79/80, and the K/Tate entries no longer assert that those works contain Burgos theorems.

6. **F06** (P3) Deleted Lean stand-ins survive as backticked own names

   **Location:** `packages/PeriodsAndSpecialValues/README.md:273`: “define `periodClass M`”; line 1379: “`quarticFamily`”; line 1847: “`quarticGram.det`”.

   **Claim:** These code-formatted names identify declarations of this package, despite the acceptance file having removed those carriers and matrices.

   **Witness:** All 43 declarations and supplied elaborated types contain none of periodClass, quarticFamily or quarticGram. The real marked lattice is a README target, and Suggested.lean explicitly says its geometric carrier is unavailable.

   **Exact repair text:** Replace these code references by the prose “the period class of M”, “the quartic family” and “the determinant of the displayed Gram matrix G₀”, respectively. Apply the same prose treatment to ETNC and other deferred own names; keep code formatting for actual declarations and mathematical expressions. Do not reintroduce deleted stand-ins. The displayed G₀ still has determinant −4, so this repair preserves the lattice Check without inventing a Lean matrix declaration.

7. **F07** (P3) The zeta-orientation Checks repeat the claims without testing them

   **Location:** `packages/PeriodsAndSpecialValues/README.md:1012`: “The target of ζ is d RΓ_c⁻¹, not d RΓ_c”; the next two bullets repeat the preceding interface.

   **Claim:** PS.5.3's Checks discriminate the inverse determinant, dual specialization and BF sign.

   **Witness:** Lines 1006–1008 already state exactly these three properties. None of the four Checks computes a determinant, character value or relative-class valuation; changing the asserted orientation throughout would leave all four as restatements.

   **Exact repair text:** Replace the first three Checks by: “For C=[ℤ₃ --3--> ℤ₃] in degrees 0,1, d(C) has lattice 3ℤ₃ and d(C)⁻¹ has lattice 3⁻¹ℤ₃; d(C[1]) has the latter lattice.” “For C₃ and χ(g)=ω, χ*(g)=ω²≠ω; the diagonal action on the Iwasawa factor uses g⁻¹.” “For L*=3 and θ∞(Ξ_ℤ)=3⁻¹ℤ, the BF obstruction has 3-adic valuation 1+(−1)=0; the reversed sign gives 2.” Keep the fourth as a type-domain Check. These give, respectively, opposite valuations ±1, distinct characters ω/ω², and obstruction valuations 0/2.

8. **F08** (P3) The retained harmonic definition is unnecessary at the pin

   **Location:** `packages/PeriodsAndSpecialValues/Suggested.lean:78`: “def harmonic (n r : ℕ)”; its only use is line 84, twice at r=1.

   **Claim:** A local generalized harmonic-sum definition is needed to state the retained quartic headlines.

   **Witness:** `Mathlib/NumberTheory/Harmonic/Defs.lean:23` already defines harmonic n as the same rational sum of reciprocals. The local r=1 specialization simplifies to it by pow_one and one_div; no retained theorem uses another exponent.

   **Exact repair text:** Delete harmonic from Suggested.lean and change the body of quarticG to `4 * quarticA n * (_root_.harmonic (4 * n) - _root_.harmonic n)`. Cite the pinned harmonic declaration in the README; retain generalized H_n^(r) there as prose for PS.8.6's second correction. At n=0,1,2 the resulting quarticG remains 0,104,12276. Do not add a sorry'd equality or a replacement example proving the two definitions coincide.

## Verification of the previous findings

The two reports use overlapping IDs; `a/Fxx` and `b/Fxx` distinguish them. Quotations in this table are from the repaired README unless a Lean location is specified. “Repaired” concerns the old defect; it does not certify all surrounding mathematics. The two dispositions explicitly marked “not actionable in this package” are accepted as settled supplier contracts, not re-raised.

| Previous finding | Status | Repaired passage and verification witness |
|---|---|---|
| a/F01 | Repaired | Suggested.lean:1 has only `import Mathlib`; there is no `set_option`, PR number or head citation in its docstrings or the README. |
| a/F02 | Partly repaired | README:766 now asks for “ArithmeticLocallySymmetricSpaces ALS.0.4–ALS.0.9”; README:1229 transports an explicit witness. The phantom suppliers were removed, but the replacement regulator construction duplicates ArithmeticKTheory and BorelRegulators: S01. Completed/NumberFieldArithmetic exists, so its earlier alleged absence was not a valid defect. |
| a/F03 | Repaired by declared contracts | README:113–117 states “gap:modular-eigenprojector-motive”, “gap:motivic-cohomology-adams”, and “gap:framed-relative-motives”; plan.json contains exactly those slugs and named owners. MC §§5.7,6.7–6.9 actually supply the arbitrary-pair/evaluation material. Accept the repair's settled ownership reason. |
| a/F04 | Repaired | README:2408 says “imports MotivesAndAlgebraicCycles' realizations and evaluated periods”; PS.2 compares them with the inverse convention. The mechanical dependency check has zero problems. |
| a/F05 | Repaired | README:1260 promises “integral transformations, convergence and explicit error inequalities”. PS.7 contains mathematical inequalities and finite sums; the rounding, recovery and computational workflow was removed. |
| a/F06 | Repaired | Suggested.lean:154 states `mzv_allTwo (m : ℕ)` and line 221 states `det_ne_zero_of_padic_triangular (p : ℕ) [Fact p.Prime]`. Empty instances give 1=1 and det=1; p=3 gives det([[1,1],[3,1]])=−2. |
| a/F07 | Repaired | README:1096 restricts the integral exponential to “a sufficiently small open neighborhood of zero”; BK line 1252 has precisely that restriction, and line 1255 gives the rational exponential. No surjectivity from the entire rational tangent space to integral local points remains. |
| a/F08 | Repaired | README:862 explicitly uses “finite local complex RΓ_f”. For ℚ_p(1) at ℓ≠p, finite cohomology is zero while full local H¹,H² both have dimension one (README:879). |
| a/F09 | Partly repaired; new error | README:1080 extends local points to “weights ≤−1”, and the regularization at line 1100 matches BK (5.9.1). The repair also advertises a weight −1 BSD compatibility whose Φ-triple regulator premises exclude positive rank: S04. |
| a/F10 | Repaired | Suggested.lean:119,124 quantify over every prime, with no odd-prime binder. At p=2, B₂=1, the valuation slope is 1/4, and the logarithmic harmonic loss does not destroy convergence. |
| a/F11 | Repaired | README:79 cites `LinearAlgebra/TensorCoalgebra/Coaugmented/Basic.lean` and `IntegralLattice/StandardCoordinates.lean`; the pin contains TensorWords and the Gram-coordinate evaluation at the stated declarations. |
| a/F12 | Repaired | README:826 says “Krull dimension 1” and “cotangent dimension 2”. For ℤ₂[C₂], m/m² has generators 2 and g−1, so the ring is not regular; self-Ext¹ dimension 2 differs from group H¹ dimension 1. |
| a/F13 | Repaired differently | README Checks retain the scalar and boundary computations; Suggested.lean has no admitted examples or per-definition controls. One surviving definitional duplication is separately recorded in S08. The acceptance-test rule forbids restoring a quota of examples. |
| a/F14 | Partly repaired | Every retained Lean declaration now has a docstring; README:1909 describes `mzvDecodeAux`, including dropped trailing zeros. Reverse agreement still fails for deleted code names: S06. |
| a/F15 | Partly repaired | sources.toml exists with 30 stable IDs, legal provenance and two settled access dispositions. Some locator/cited_for fields combine unrelated works or have wrong pages: S05. |
| a/F16 | Repaired | README:581 says “completed Dedekind zeta”; Γℝ(2)ζ(2)=π/6. README:1560 gives “p=1±i/√2”; substituting either value into 1−1/(2(p−1)) returns the same value. |
| a/F17 | Repaired | README:298 defines sign periods “whenever I^± is an isomorphism”; criticality is subsequently a sufficient condition. README:808 computes the real Tate cochains before taking determinants, and line 770 defines the predicted order without ETNC. The three old cycles are absent. |
| a/F18 | Repaired | README:605 cites “Propositions 3.2.9 and 3.2.13 and Lemma 3.2.14”; HMS-book lines 3527,3541,3566 resolve to those statements. |
| b/F01 | Repaired | README:1229: “Assume an explicit witness of BBKRankZeroOne”. No L-value implication is imported from a later GanGrossPrasad or Selmer Part II roadmap. This is conditional transport, not an asserted rank theorem. |
| b/F02 | Repaired | README:171 names “FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P3, R07.P5”; Selmer §§4.7,4.9 supply their actual small-weight/finite-condition statements. Their extra comparison hypotheses are retained. |
| b/F03 | Repaired | README:601: “Properties of the imported marked evaluation”; MC §§5.7,6.7–6.9 own the construction. In degree (1,1), swapping both forms and cycles gives (−1)(−1)=+1, not a negative period product. |
| b/F04 | Partly repaired | README:517 now imports “ModularSymbolsPadicLFunctions §§1.1–1.2”, whose critical-value theorem exists. The new identification with same-sign c^± omits Tate factors and swaps the relevant signs: S02. |
| b/F05 | Repaired | README:688 imports “NoncommutativeAndEquivariantIwasawa §2.7”. That section supplies virtual objects and their determinant functor; GeneralAlgebraicKTheory remains the owner of ordinary relative K-groups. |
| b/F06 | Repaired | README:193 specifies “totally real abelian F/k”, with finite S containing infinity, p and ramification. IntegralIwasawaTheory §11.7 has that scope; §11.1 supplies the stated CM twist. |
| b/F07 | Repaired | README:165,808,886 explicitly include places above p and the real places in S. The dyadic calculation retains the complete real Tate complex, rather than invoking compact support on a forbidden open. |
| b/F08 | Repaired by declared contracts | README:97,103 names the indefinite-classification and K3 integral-lattice gaps; plan.json has both. K3 §§3.3,4.2 and Completed/IntegralLattices do not already supply the requested full statements. Accept the settled owner-extension reason. |
| b/F09 | Repaired | README:129 names “§§2.4–2.6 and §3.3” of ArithmeticGaloisRepresentations; those sections contain the Weil–Deligne, purity and conductor interfaces. SR.5.2 supplies Frobenius semisimplification. No fictitious R01 labels remain. |
| b/F10 | Repaired | README:147,195,203,207 cites duality “§§0.5–0.6”, crystalline “CR.3”, Tate n-gons “§3.6”, and “PolylogarithmFunctions”. MC Layers 3–6, NE.7.14, AG2.6 and the elliptic regulator basis statement also resolve at their current copies. |
| b/F11 | Repaired | README:27 uses `Completed/NumberFieldArithmetic/README.md`; line 183 names “IntegralHeckeAndGaloisDeterminants, §0.6”. Both owners exist in the authorized corpus. |
| b/F12 | Repaired | Suggested.lean:1 is its sole import. No TauCeti import is retained merely for a comment. |
| b/F13 | Repaired | The eight old one-tactic declarations, their unused scalar definitions and the 38-example catalogue are absent. No retained theorem is a definition restatement, scalar identity, or single-value boundary control. |

## Computed adversarial table: README targets

All 79 numbered target sections were read in full, including their interfaces and Checks. The table uses the PS numbering in `packages/PeriodsAndSpecialValues/README.md`. A calculation below tests the stated convention or a necessary premise; it is not a claim to have proved the eventual geometric theorem. Formal/motivic assertions remain conditional on their actual carriers and declared supplier contracts. All computations use the displayed hypotheses; zero rings, characteristic-p coefficient fields and inseparable extensions are outside the explicit number-field/characteristic-zero carriers, rather than hidden extra assumptions. Empty ranks, empty indices, vanishing factors, primes 2 and 3, zero maps and total-function junk values are tested where those carriers admit them.

| Statement | Instances and computed values on the two sides | Result / change |
|---|---|---|
| PS.0.1 determinant comparison | Rank 0: det=1. Rank 1, P=α,A=2,C=1: P′=2α; A=1,C=2: P′=α/2. β=2πi gives I=(2πi)⁻¹. | Correct direction. |
| PS.0.2 infinity involution | ℚ(0),ℚ(1): F∞=1,−1 and dimensions (1,0),(0,1). Swapped 2-dimensional pair: projectors each rank 1. | Correct; dividing by 2 is legal over E. |
| PS.0.3 period class | Over ℚ, 2α/α=2; i/1=i∉ℚ. Over ℚ(√2), the unit √2 has embedding tuple (√2,−√2), never (√2,√2). Zero has no unit representative. | Correct simultaneous quotient; S06 naming. |
| PS.0.4 sign periods | ℚ(0): c⁺=c⁻=1 (second determinant empty). Twist: (d⁺,d⁻)=(1,0)→(0,1). Zero map ℂ→ℂ has det 0 and fails the isomorphism premise. | Correct nonvanishing domain. |
| PS.0.5 Tate/elliptic | n=−1,0,1,2: periods (2πi)⁻¹,1,2πi,−4π²; signs −,+,−,+. Inverse [[1,2],[0,1]] is [[1,−2],[0,1]]. Scalar K=1,J=0,H=2 gives det 8i; J=H=1 gives 0. Index-2 cycles multiply det β by 2 and det I by 1/2. | Correct. |
| PS.1.1 Euler product | Unit: P=1−T, local L=1/(1−q⁻ˢ). Steinberg N≠0 has ker N dimension 1 instead of 2. Unit over ℚ(i): conductor 4 versus 1 over ℚ; rank 0 gives 1. | Correct. |
| PS.1.2 Gamma factors | Γℂ,D(1)=1/π and Γℂ,B(1)=1/(2π); B(2)=1/(4π²), B(3)=1/(4π³). Two complex blocks give ratio 4. Odd (0,0) block uses Γℝ(s+1). | Correct. |
| PS.1.3 criticality | Unit at m=−1: Γℝ(−1),Γℝ(2) regular; at m=1: second argument 0 is a pole; m=0 first argument 0 is a pole. Weight k=2 gives exactly {1}. | Both directions tested; correct. |
| PS.1.4 Deligne predicate | ζ(2)/(2πi)²=−1/24; completed ratio=−1/(24π). L=0 gives coefficient 0, a nonunit; c=0 rejected. Tuples must share one E coefficient. | Correct finite-value distinction. |
| PS.1.5 Dirichlet/Tate | ζ(−1)=−1/12, ζ(0)=−1/2 but 0 not critical. Omitting a factor with χ(p)=1 at s=0 multiplies by 0 and raises order, rather than allowing division. | Correct. |
| PS.1.6 modular adapter | Weight 2,m=1: supplier denominator Ω⁺ versus motivic (2πi)c⁻. Untwisted c⁻/Ω⁻ is a nonzero rational multiple of 1/π in the CM Legendre instance. | False identification: S02. |
| PS.1.7 functional equation | Applying twice multiplies εε∨N⁻¹; nonzero Λ forces εε∨=N. Unit N=ε=1. Zero Λ would give 0=0 for any ε and is excluded. | Correct. |
| PS.1.8 Hasse–Weil | Dimension 0 has only H⁰. Over ℚ at s=2 its completed value is Γℝ(2)ζ(2)=π/6, not π²/6. For an elliptic curve the exponents H⁰,H¹,H² are +,−,+. | Correct repaired sign and completion. |
| PS.2.1 marked evaluation | Unit→1; Tate L→2πi and L⁻¹→(2πi)⁻¹, product 1. Degree-one cross-product exchange gives two signs, hence +1. | Correct imported construction. |
| PS.2.2 inverse marked point | β=diag(2,3) evaluates periods as (2,3); I=diag(1/2,1/3), det I=1/6. A general torsor point does not assert injective evaluation. | Correct direction. |
| PS.2.3 Tate torsor | ℚ[x,x⁻¹] at x=2πi sends x² to −4π² and x⁻¹ to (2πi)⁻¹; x=0 fails invertibility. | Correct localization domain. |
| PS.3.1 fundamental line | Empty factor gives 1; swapping rank-one factors gives det [[0,1],[1,0]]=−1. Real-quadratic unit regulator contributes R, while the opposite exponent gives R⁻¹. ΔΞ=1. | Correct signs with imported virtual objects. |
| PS.3.2 real trivialization | Empty regulator det 1; 2I₂ gives det 4=2²det I₂. Zero height matrix gives det 0 and no trivialization. | Correct explicit exactness premise. |
| PS.3.2a regulators | ℚ,j=2,3: ranks 0,1, ratios 1,2. Imaginary quadratic: ranks 1,1. Real quadratic,j=3: ratio 4 and det ψ²=8²=64. | Numbers correct; ownership S01, locators S05. |
| PS.3.3 leading terms | 3s²: order 2, L*=3, second derivative 6; 2/s: order −1,L*=2. ℤ and 2ℤ give the same ℚ-line and different integral generators. | Correct. |
| PS.4.1 integral lattice | Zero complex→O; [O→π³O] in degrees 0,1 gives π³O. ℤ₂[C₂] has Krull dimension 1 and embedding dimension 2; residue module is not perfect. | Correct restrictions. |
| PS.4.2 finite correction | Length H¹=3 gives exponent −(−3)=3; its shift gives −3. Unit differential gives exponent 0; zero differential has nonzero rational cohomology and is excluded. | Correct DVR formula. |
| PS.4.3 local factors | Eigenvalue 2 gives determinant −1 and inverse local factor −1. Eigenvalue 1 gives H⁰=H¹=1-dimensional and no acyclic determinant. ℚ_p(1) at ℓ≠p: finite dimensions 0,0 versus full 0,1,1. | Correct finite/full distinction. |
| PS.4.4 dyadic restriction | Trivial ℤ₂: Tate groups even ℤ/2, odd 0; sign action reverses them. Over ℚ₂ or odd-p lattices, multiplication by 2 is invertible and both groups vanish. | Correct; no deletion of integral tails. |
| PS.5.1 obstruction/gluing | At 2, L*=2 and regulator valuation −1 give 1−1=0; opposite sign gives 2. Patch g₂=2 to 2ℤ, valuation +1. Multipliers 1 and 2 for x=3 both give (v₂,v₃)=(0,1). Negative quaternionic scalar needs λ=−1. | Correct scalar/positivity tests. |
| PS.5.2 ETNC | θ∞Ξ=(L*)⁻¹O yields L*θ∞Ξ=O; replacing it by L*O gives (L*)²O, e.g. 4ℤ for L*=2. Rational membership alone accepts both ℤ and 2ℤ. | Correct predicate orientation. |
| PS.5.3 zeta orientation | C=[ℤ₃→³ℤ₃] has d-lattice 3ℤ₃; C[1] and inverse determinant have 3⁻¹ℤ₃. C₃ character values are ω and dual ω². BF valuations 1+(−1)=0. | Formula correct; replace restatement Checks, S07. |
| PS.5.4 proved-case transport | C₂ sign=regular−trivial has value −1 at the involution and is not a permutation character. Nontrivial C₃ character over ℚ₇ is not ℚ-valued. Finiteness/Leopoldt and total-real assumptions cannot be dropped. | Correct restricted transport; BG uncertified. |
| PS.6.1 motivic pairs | Zero pair has all comparison dimensions 0. ℚ(2) has weight −4; elliptic h¹(1) has weight −1. For positive-rank elliptic data the real regulator quotient has dimension 0 but finite Selmer space has dimension ≥1. | Pair axioms okay; triple extension S04. |
| PS.6.2 points/measure/Sha | Zero pair: all masses 1,L_S=1,r=0,C_S=1. Scaling form by 2 gives archimedean factor 2 and 2-adic factor 1/2, product 1. Positive-rank elliptic global Φ has incompatible dimensions 0 and ≥1. | Local regularization correct; global extension S04. |
| PS.6.3 elliptic determinant | Index m=2 changes height determinant by m²=4. Two real components double Ω. Rank 0 regulator is empty determinant 1; a rank-one singular height has determinant 0 and fails nondegeneracy. | Correct conditional determinant formulation. |
| PS.6.4 arithmetic-witness transport | Rank 0 requires nonzero L(E,1); rank 1 requires nonzero first derivative and a nonzero height. A double zero has L=L′=0 and provides neither witness. | Correct conditional transport. |
| PS.6.5 Tamagawa predicate | ⊕_p ℤ/p has each p-part finite but total cardinality infinite. Zero triple gives Tam=1=1/1. Positive-rank elliptic input fails the Φ regulator isomorphism before reaching this predicate. | S04. |
| PS.6.6 Rankin–Selberg prediction | Sign −1 forces central value 0; sign +1 does not force nonzero value (an order-2 germ s² has sign +1). Rank-order 0/1 witnesses are extra hypotheses. | No unconditional parity-to-rank implication. |
| PS.6.7 witness base change | Extending a finite 1-dimensional E-space to E′ keeps dimension 1; zero space stays 0. No witness is manufactured from these equalities. | Correct conditional scope. |
| PS.7.1 integrals/error | S₀=1,S₁=2/3,S₂=13/15. λ=0: K=π/2, midpoint₁=8/5. λ=1/2: D=1+u⁴,f(0)=2,f(1)=√2,midpoint₁=8/√17. λ=1: D(1)=0 and divergence; N=0: total midpoint 0, excluded. | Correct real-parameter statement. |
| PS.7.2 stability | (L,L₀,c,c₀)=(2,1,1,1) gives 1≤1; (1,1,1,2) gives 1/2≤1. Multiplying s by s² gives order 3, leading coefficient 1. | Correct δ>0 domain. |
| PS.7.3 covariance | Rank-2 scaling by 2: determinant factor 4; index-2 height lattice: factor 4; rank-4 epsilon with measure factor 2: factor 16. | Correct; Tate measure source waived. |
| PS.7.4 period conjecture | x↦1 on ℚ[x,x⁻¹] has kernel containing nonzero x−1 despite being a torsor point. xx⁻¹ maps to 1 without injectivity. | Correct distinction. |
| PS.8.1 quartic family | At t=0 polynomial is ΣX_i⁴. At t=1,(1,1,1,1): value and all partials 0. Group order 4⁴/4²=16, versus 64 without product-one. t=0 admitted, z-coordinate undefined there. | Correct domains; S06 code name. |
| PS.8.2 residue | t=0,z₃=1,2: coefficient πi/2,πi/16; z₃=0 fails chart denominator. Product-one diagonal action multiplies numerator/denominator compatibly by 1. | Correct. |
| PS.8.3 Picard–Fuchs | L_z(1)=−24z=−3/(32t⁴). Raw t⁻¹ solution under listed operator has leading t⁻¹/64≠0; normalized t·raw starts 1+24z and cancels degree one. | Interface error S03. |
| PS.8.4 K3 lattice | det G₀=−4; v=(p,−1,2p²) gives vᵀG₀v=0 and vᵀG₀v̄=8(Im p)². Integral sum determinant −16 versus ambient −1 gives index 4. Picard jump changes transcendental rank 3→2, not fixed complement rank. | Correct conditional gaps. |
| PS.8.5 monodromy | All five MᵀG₀M−G₀ are zero; ordered product is I₃. (M∞−I)² has sole entry −64 at (3,2), cube zero. At p=i, γ₁ gives i/2 and infinity gives 4+i. | Exact matrix multiplication verifies all five. |
| PS.8.6 Frobenius solutions | n=0,1,2,3: A=1,24,2520,369600; g=0,104,12276,5632160/3; h=0,0,10816,2293824. H₂¹=3/2,H₂²=5/4. Recurrence at n=1:24=4·1·2·3. | Correct coefficients and factor 1/2. |
| PS.8.7 symmetric square | Constant coefficients 1=1; linear coefficient w₀=24, ₂F₁=12, square=24; ₃F₂ coefficient=24. z=0 allowed, norm(256z)=1 excluded. | Correct. |
| PS.8.8 conifold reflection | Equal upper pair gives (1/8)²/(1/2)=1/32; wrong pair gives 3/32. R fixes ±i/√2; TRT⁻¹ fixes 1±i/√2. | Correct repaired branch marking. |
| PS.8.9 mirror coordinate | q coefficients 1,104,15188,2585184; inverse coefficients 1,−104,6444,−311744. Degree 3 composition:6444−21632+15188=0. | Correct. |
| PS.8.10 modular relation | Degree-3 residual is y₂+744−432−207−1=y₂+104, forcing y₂=−104. x=1/J instead has coefficient 1728≠1. | Correct normalized branch. |
| PS.8.11 integrality | m=1 quartic gives integer coefficients above. P=2y−2x−x²,x=q gives y=q+q²/2: integral over ℤ[1/2], not ℤ. Inverse cubic 2·104²−6444=15188. | Correct general denominator dependence. |
| PS.8.12 quintic family | λ=0 gives ∏x_i; λ=−1/5 at all-one point gives value 0 and vanishing derivatives. 125 averaging is a 3-adic unit; 120 is not. A transposition sends Ω to −Ω, so natural S₅ averaging kills it. | Correct G-sector and sign. |
| PS.8.13 formal connection | At λ=1/5, g=1/2, last column (−12,−25,−35/2,−5). N³e₀=e₃,N⁴=0. det J=Y₀⁴, det D=1. Euler contraction coefficient 5t≠0 though total charge 0. | Correct model/basis distinction. |
| PS.8.14 Dwork Frobenius | p=3:F_raw(e₃)=9e₃,F(e₃)=e₃; F(λe₃)=λ³e₃; pairing factor 27 rather than 1. | Correct stated geometric scope. |
| PS.8.15 Dwork sums | B₂=1 at p=2 and 1/2 at p=3; B₃=2/3,1/2 respectively. Pair weights n=0..5 are 0,0,0,1/2,1,35/24. p=2,n=1,2 actual valuations 0,0 dominate −7/4,−5/2. | Correct all-prime convergence slope. |
| PS.8.16 boundary matrix | p=3 diagonal 27,9,3,1; off-diagonal C=648Δ₃/25 in row 4,column 1. NF(e₀)=27e₁=pFN(e₀); det F=p⁶, pairing factor p³. Off-diagonal C cancels in alternating pairing. | Correct. |
| PS.8.17 geometric comparison | u_s↦(−1)^s s!r_s gives coefficients 1,−1,2,−6. R determinant 12, ranks mod 3 and 7 are 3 and 4. Boundary ∏X_i=0, not smooth; λ=−1/5 singular. | Correct separation of rational comparison and integral-lattice predicate. |
| PS.9.1 MZV definition/convergence | []: unique empty tuple, product 1,sum 1; [2,1] at (2,1):1/4; [3] at 2:1/8. [1] harmonic diverges; [1,2] diverges despite last entry 2. [0] fails positivity. | Correct descending convention and total-sum warning. |
| PS.9.2 word algebras | 01 shuffle 01 gives four 0011 and two 0101; [2]*[2] gives two [2,2] plus [4]. Encode [2,1]=011; decode 001101=[3,1,2]. Trailing 0 is discarded only outside valid ending-1 words. | Correct multiplicities/carriers. |
| PS.9.3 iterated integrals | Empty word=1 even a=b; a=b nonempty integral=0. I(1)=−log(1−b), divergent at 1 with regularized constant 0. Endpoint 001→ζ(3),011→ζ(2,1). | Correct largest-time convention. |
| PS.9.4 double shuffle | ζ(2)²=π⁴/36=4·π⁴/360+2·π⁴/120=2·π⁴/120+π⁴/90. | Correct. |
| PS.9.5 regularizations | [1,1] stuffle=(T²−ζ₂)/2 versus shuffle=T²/2. [1,2] differ by ζ₃−ζ₂₁; admissible evaluation agrees when ζ₂₁=ζ₃. | Correct polynomial, not finite ζ(1). |
| PS.9.6 rho | ρ(1)=1,ρ(T)=T,ρ(T²)=T²+ζ₂,ρ(T³)=T³+3ζ₂T−2ζ₃. Thus ρ(T)²≠ρ(T²). | Correct nonmultiplicative map. |
| PS.9.7 regularized shuffle | ρ((T²−ζ₂)/2)=T²/2; 1 shuffle 01 minus stuffle=011−001, evaluation ζ₂₁−ζ₃=0. | Correct. |
| PS.9.8 mixed Tate category | ℚ(0) fibre grade 0, ℚ(1) grade 1/Hodge weight −2. Kummer 2 has valuation 1 at 2 and is not unramified over ℤ. | Correct conditional construction; use regulator owner S01. |
| PS.9.9 Ext/Galois | Ext¹ in weights 1,2 is 0 over ℤ; odd weights 3,5,7 each dimension 1. Over ℚ, class of 2 in ℚ×⊗ℚ is nonzero, so weight 1 differs. | Correct. |
| PS.9.10 path torsor | Δ(01)=empty⊗01+0⊗1+01⊗empty; counit on outer cuts gives 01. Dropping outer cuts gives 0. Endpoints 0,1 are absent from X. | Correct tangential endpoints. |
| PS.9.11 motivic MZVs | per ζᵐ(2)=π²/6≠0; descending [2,1] maps to increasing-time word 110, whose period is ζ(3). Empty word maps to 1. | Correct; no numerical-kernel quotient. |
| PS.9.12 coaction | Δ1=1⊗1; Δζᵐ₂=1⊗ζᵐ₂, while πζᵐ₂=0; Δζᵐ₃=1⊗ζᵐ₃+ζᵃ₃⊗1. | Correct tensor-factor orientation. |
| PS.9.13 f-alphabet | d₀..d₈=1,0,1,1,1,2,2,3,4. Multiplying the series by 1−t²−t³ gives constant 1 and zero coefficients thereafter. | Correct upper bound. |
| PS.9.14 derivation kernel | N=3 has empty cut range and a 1-dimensional kernel; N=5,D₃ζ₅=0, D₃ζ₂₃=−2ζᴸ₃⊗ζᵐ₂≠0. | Correct nonzero kernel line. |
| PS.9.15 shifted all-two | n=1 gives −2ζᵐ₃; n=2 gives −2ζᵐ₃ζᵐ₂+2ζᵐ₅. All-two n=0,1,2 gives 1,π²/6,π⁴/120. | Correct factor 2, not source's intermediate misprint. |
| PS.9.16 coefficients | c(0,0,1)=1; c(1,0,1..2)=−2,9/2; c(0,1,1..2)=3,−11/2. At r=0 the total formula gives 0 but theorem excludes r=0. | Correct reversal and dyadic denominators. |
| PS.9.17 Zagier | a=b=0: ζ₃=1·ζ₃·1. (1,0),(0,1) formulas add to ζ₂ζ₃−ζ₅; coefficients −2+3=1 and 9/2−11/2=−1. | Correct. |
| PS.9.18 motivic lift | Same weight-5 coefficients; ambiguity αζᵐ₅ maps to αζ₅. ζ₅>0 forces α=0 without injectivity on all periods. | Correct proof route. |
| PS.9.19 Hoffman level/count | Weight 0: one empty word; weight 1:none; weight 5:[2,3],[3,2]. Weight6 levels 0,1,2 have cardinalities1,0,1. | Correct parity and empty cases. |
| PS.9.20 cut matrix | Weight3 matrix(1). Weight5 matrix[[3,−11/2],[−2,9/2]] has det5/2; scaling column2 by2 gives det5 and mod2 upper triangular diagonal(1,1). | Correct row convention. |
| PS.9.21 determinant criterion | p=2:[[1,1],[2,1]] det−1; all-one matrix det0 violates below-diagonal premise. Zero diagonal also rejected. p=3:[[1,1],[3,1]] det−2. Empty matrix det1. | Correct all-prime/nonzero hypotheses. |
| PS.9.22 motivic basis | Weight0 basis{1}; weight1 empty basis of 0; weight2,3 dimensions1; weight5 dimension2 with the two Hoffman words. | Correct motivic, not numerical independence. |
| PS.9.23 numerical spanning | Weight0 span{1} has dimension1=d₀; weight1 span empty has dimension0=d₁; weight5 span at most2=d₅. Inverse Tate evaluates to (2πi)⁻¹ only after localization. | Correct finite-dimensional upper bound. |

## Computed adversarial table: Suggested.lean declarations

The full namespace is `TauCetiRoadmap.PeriodsAndSpecialValues`. There are no section `variable` or `include` declarations. Every object and hypothesis below is an explicit parameter, except the local universe parameter of shuffles. The supplied signature extraction was compared for all 43 declarations; none loses a required binder. No Lean process was run in this read-only review. Theorems have admitted proofs; definitions have real bodies. “Same” means the numerical/domain test agrees with the matching README target, not that an admitted theorem was proved.

| Declaration / PS section | Explicit variable and instance context | Computed instance and result | Change |
|---|---|---|---|
| legendreRadicand /7.1 | lam,u:ℝ | λ=1/2 gives 1+u⁴; at u=0,1:1,2. λ=u=1 gives 0. | Same. |
| legendreIntegrand /7.1 | lam,u:ℝ | λ=1/2,u=0,1:2,√2; λ=u=1 gives total-field value 0 despite the nearby singularity. | Same; analytic theorems exclude λ=1. |
| legendreK /7.1 | lam:ℝ; volume interval integral | λ=0 gives π/2; λ=1 integrand diverges, and the total integral has junk value 0. | Same documented domain. |
| legendreMidpoint /7.1 | lam:ℝ,N:ℕ | N=0 gives 0; N=1,λ=0 gives 8/5; λ=1/2 gives 8/√17. | Same. |
| legendre_endpoint_integrable /7.1 | lam:ℝ; 0<lam∧lam<1 | λ=1/2 has integrable square-root endpoint; λ=1 has (1−t²)⁻¹ divergence and is rejected. | Same real generality. |
| legendre_substitution /7.1 | lam:ℝ; 0<lam∧lam<1 | t=2u/(1+u²), t′=2(1−u²)/(1+u²)²; λ=1/2 transformed integrand 2/√(1+u⁴), both integrals K₁/₂. | Same endpoint convention. |
| legendre_midpoint_error /7.1 | lam:ℝ,N:ℕ; interval hypothesis; N>0 | λ=1/2,N=1: bound4√2; λ=1 would falsely require 8/3≤0 because total integral0, so strict interval is material. | Same; excludes denominator zero. |
| harmonic /8.6 | n,r:ℕ | H₀ʳ=0; H₂¹=3/2; H₂²=5/4; H₂⁰=2. | Values correct; delete redundant bridge, S08. |
| quarticA /8.6 | n:ℕ | n=0,1,2,3:1,24,2520,369600; factorial denominators never0. | Same. |
| quarticG /8.6 | n:ℕ | n=0,1,2,3:0,104,12276,5632160/3. | Same. |
| quarticW0 /8.7 | z:ℂ; total tsum | z=0 gives1; coefficients z,z² are24,2520. Outside convergence the total sum is not asserted to be an analytic period. | Same. |
| quartic_symmetric_square /8.7 | z:ℂ; norm(256z)<1 | Constant1=1²; linear24=2·12. Boundary norm1 excluded. | Same native hypergeometric carrier. |
| quarticMirrorCoordinate /8.9 | no parameters; PowerSeries ℚ | Constant0, linear1, next104,15188; inner substitution has constant0 since g₀=0,w₀(0)=1. | Same well-defined formal substitution. |
| quarticMirror_integral /8.11 | no parameters | q coefficients1,104,15188; inverse1,−104,6444. Both degree-2 and degree-3 compositions have coefficients0. | Same two-sided inverse, not just one side. |
| dworkSeries /8.15 | p:ℕ; no primality needed for definition | p=2:1+z+z²+2z³/3; p=3:1+z+z²/2+z³/2. p=0 reduces to exp z and p=1 to exp(2z), outside convergence theorem. | Same. |
| dworkCoeff /8.15 | p,n:ℕ | p=2 B₂=1; p=3 B₂=1/2,B₃=1/2; below p gives1/n!. | Same. |
| dworkPairWeight /8.15 | n:ℕ | n=0,1,2,3,4,5:0,0,0,1/2,1,35/24. Both Ico lower bounds1 exclude zero denominators. | Same. |
| dworkSigma0_summable /8.15 | p:ℕ; Fact p.Prime; values ℚ_[p] | Sum index n=0 is B₁·0!=1; p=2 next term1; valuation lower bound slope1/4, logarithmic error. | Same all-prime scope. |
| dworkSigma2_summable /8.15 | p:ℕ; Fact p.Prime; values ℚ_[p] | n=0,1 weights0; p=2,n=2 term (2/3)·2·(1/2)=2/3. Harmonic loss ≤2log_p(n+1), still tending to zero. | Same shift by n+1. |
| PositiveIndex /9.1 | k:List ℕ | [],[1,2] true; [0] false. | Same. |
| Admissible /9.1 | k:List ℕ | [],[2,1] true; [1,2],[0] false. Empty head? imposes no lower bound. | Same. |
| DescendingTuple /9.1 | k:List ℕ; subtype of Fin length→ℕ | For length0 exactly one tuple; length2:(2,1) accepted,(1,2),(1,1),(1,0) rejected. | Same source/positivity. |
| mzvTerm /9.1 | k; n:DescendingTuple k | [] term1; [2,1] at(2,1) term1/4; [3] at2 term1/8. | Same. |
| multipleZeta /9.1 | k:List ℕ; total real tsum | []=1; [2]=π²/6; divergent [1] gives total-sum junk0, never a convergent ζ(1). | Same warning in module docstring. |
| mzv_summable_iff /9.1 | k; PositiveIndex k | []:true↔true; [2,1]:true↔true; [1],[1,2]:false↔false. | Same both directions. |
| mzv_allTwo /9.15 | m:ℕ | m=0,1,2:1=1/1!,π²/6=π²/3!,π⁴/120=π⁴/5!. | Same all m, no boundary-only theorem. |
| mzvEncode /9.2 | List ℕ→List Bool | []→[]; [1]→1; [2,1]→011; junk [0]→1 due Nat subtraction. | Same; positive domain needed for bijection. |
| mzvDecodeAux /9.2 | c:ℕ; word:List Bool | c=2,word1→[3]; c=2,word0→[]; c=0,001101→[3,1,2]. | Same dropped trailing zeros. |
| mzvDecode /9.2 | word:List Bool | 011→[2,1]; 0→[]; encode-decode fixes valid words ending1 and does not fix 0. | Same valid-word restriction. |
| shuffles /9.2 | α:Type u implicit; two List α | [] shuffle w=[w]; 01 shuffle01 has multiplicities4 of0011 and2 of0101; singleton a with itself gives two copies aa. | Same universe and multiplicities. |
| stuffles /9.2 | two List ℕ | []*w=[w]; [2]*[2]=[[2,2],[2,2],[4]]; merge coefficient+1. | Same. |
| mzv_stuffle /9.4 | k,l; Admissible k and l | k=l=[2]:π⁴/36=2·π⁴/120+π⁴/90. Empty factor multiplies by1. | Same no divergent inputs. |
| mzv_shuffle /9.4 | k,l; Admissible k and l | k=l=[2]:π⁴/36=4·π⁴/360+2·π⁴/120. Empty factor gives unchanged encoded word. | Same decode only on valid shuffles. |
| mzv_two_one /9.7 | no parameters | ζ₂₁−ζ₃=0, from regularized product difference011−001; positive convergent terms on both sides. | Genuine Euler relation; not an evaluated constant. |
| zagierCoeff /9.16 | a,b,r:ℕ | (0,0,1)=1; (1,0,1),(1,0,2)=−2,9/2; r=0 gives0. | Same rational cast before division. |
| oneThree /9.17 | a,b:ℕ | (0,0)=[3],(1,0)=[2,3],(0,1)=[3,2]; length≥1 always. | Same. |
| zagier_evaluation /9.17 | a,b:ℕ | a=b=0:range1 gives r+1=1, remaining-twos0, ζ₃=ζ₃. Weight5 two formulas add to ζ₂ζ₃−ζ₅. All r in range satisfy r≤a+b, so subtraction has no junk. | Same all nonnegative a,b. |
| det_ne_zero_of_padic_triangular /9.21 | p:ℕ, Fact p.Prime,n:ℕ,A:Fin n matrix ℚ; nonzero diagonal, nonpositive diagonal valuations, column minimum on nonzero entries, below-diagonal zero-or-valuation≥1 | Empty determinant1. p=2 example det−1; p=3 example det−2. Singular all-one matrix violates below test; zero-diagonal matrix fails hdiag although v_p(0)=0. | Same explicit zero alternatives. |
| IsHoffman /9.19 | k:List ℕ | [],[2,3] true; [1],[4] false even when weight matches another word. | Same. |
| hoffmanDim /9.13 | ℕ→ℕ | Values0..8:1,0,1,1,1,2,2,3,4; at6 recurrence d₄+d₃=2. | Same recurrence indices. |
| hoffman_count /9.19 | N:ℕ; Set.ncard | N=0 count1; N=1 count0; N=5 count2; N=6 count2. Bounded length≤N/2 ensures finite set, so ncard's infinite-set junk is not used. | Same. |
| numerical_spanning /9.23 | k; Admissible k | k=[] gives1 in span{1}; k=[4] gives ζ₄=(4/3)ζ₂₂, weight4 on both sides; weight5 lies in span of2 Hoffman values. | Same actual MZV object. |
| mzv_span_finrank_le /9.23 | N:ℕ | N=0 finite dimension1≤1; N=1 zero-dimensional finite span0≤0; N=5 dimension≤2. The explicit Module.Finite rules out infinite-dimension finrank junk0. | Same. |

## Additional bold conventions and worked instances

These rows cover the bold mathematical labels outside the numbered target headings. They supplement, rather than replace, the target table.

| Statement / README line | Computed values | Result / change |
|---|---|---|
| Comparison direction /44 | P=diag(2,3), A=diag(2,1), C=diag(1,3): C⁻¹PA=diag(4,1), determinant 4=6·2/3. | Correct. |
| Tate objects /46 | n=−1,0,1: periods (2πi)⁻¹,1,2πi; signs −1,1,−1; Hodge types (1,1),(0,0),(−1,−1). | Correct inverse convention. |
| Euler and Gamma factors /48 | At q=2,s=2 the unit local factor is 4/3 rather than 3/4. Γℂ,D(1)/Γℂ,B(1)=2. Germ 3s² has order2 and coefficient3, not derivative6. | Correct. |
| Determinants /50 | Differential3 in degrees0,1 gives lattice3ℤ; degrees−1,0 gives(1/3)ℤ. Swap of two degree-zero lines has sign−1. | Correct; same supplier convention. |
| Quartic convention /52 | t=i√2 gives t⁴=4,z=1/1024,256z=1/4. Raw leading t⁻¹ becomes normalized leading1. Period vector gives square0 and Hermitian norm8(Im p)². | Correct here; interface regression S03. |
| Quintic convention /54 | At p=3, π²=−3, F_raw(e₃)=9e₃, normalized F(e₃)=e₃; F(λe₃)=λ³e₃. | Correct. |
| MZV convention /56 | Descending [2,1] encodes011; reversed increasing-time word110. Empty value1. Weight-five cut determinant5/2, and not its numerical-span determinant. | Correct. |
| Fixed-fibre projective map /1789 | s=0 gives ρ(ω)=1/(ℏ⁶πtφ) times the top form. θ_cθ_w contributes−tΩ, hence −πℏ⁶θ_cθ_wρ(ω)=Ω/φ. At q=3 the two contractions and residue give F_raw=9Fr_V. | Correct sign and normalization, conditional on the named comparisons. |
| Residue coordinates /1802 | u_s→r₀,−r₁,2r₂,−6r₃; det R=12. At p=3, Δ₃=25/648 gives v₃=−4 and C=1. At p≥7, v_p(24/25)=0 and integral C requires v_p(Δ₃)≥−3. | Correct rational/integral separation. |
| Tate final example /2395 | ζ(2)/(2πi)²=−1/24; ζ(−1)=−1/12; ζ(0)=−1/2 is excluded from criticality. | Correct. |
| Legendre final example /2396 | Doubling K doubles the bound: 2·2/(N(1/2)√(1/2))=8√2/N. | Correct. |
| 11a1 final example /2397 | With the stated arithmetic witness, Reg=1, c₁₁/tors²=5/25=1/5 and Sha=1, hence L/Ω=1/5. | Scalar consequence correct; this review does not independently certify the arithmetic witness. |
| Quartic final example /2398 | Inverting z+104z²+15188z³ gives q−104q²+(21632−15188)q³=q−104q²+6444q³. | Correct. |
| Weight-five final example /2399 | Coefficients add to (1,−1); determinant27/2−11=5/2; number of Hoffman words2. | Correct. |

The nonabelian tests use the matrix torsor heap and quaternionic reduced norms. In PS.2.2, PQ⁻¹R=[[3/2,1],[1,1]] whereas RQ⁻¹P=[[1/2,1/2],[1/2,3/2]]. In PS.5.1, Hamiltonian reduced norms are positive: Nrd(1+i)=2 and −1 is excluded; the sign correction restores the domain of the extended boundary. Thus commutative scalar tests alone were not used for these constructions. S₅ in PS.8.12 supplies a further nonabelian test: a transposition acts by −1 on the holomorphic residue, although the order-125 diagonal subgroup acts by +1.

## Suppliers, ownership and dependency direction

The 33 subsections under “Exact supplier contracts” (two pinned-library headings and 31 roadmap-contract headings) were resolved against the authorized main/head copies. The table records the substantive interfaces, including citations outside that list. Paths in this table are roadmap-repository paths; open-head files mean the heads supplied in the brief, or the current indexed new-roadmap head returned by the roadmap service. Revisions of existing roadmaps were not substituted for main.

| Supplier / checked section | Witness and scope retained |
|---|---|
| EllipticCurves, Layers1,2,4,6,7 | `TauCetiRoadmap/EllipticCurves/README.md:1222`, 1262,1290: height, Sha and conditional BSD. The scalar adapter retains finite Sha, actual height and all-components period. |
| ModularForms, Layers0,7,8; ModularSymbolsPadicLFunctions §§1.1–1.2 | Modular-symbol period lines and the parity formula occur at `TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md:1304`,1361,1389. Their normalization does not support the proposed same-sign equality: S02. |
| NumberFieldArithmetic, completed | `Completed/NumberFieldArithmetic/README.md`: the Dirichlet regulator/class-number owner exists; j=1 is not a missing Borel-rank target. |
| PadicMeasuresIwasawaAlgebras §5.1 | `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:3172`: graded determinant of finite projectives and perfect complexes, with shift/inverse and swap sign. |
| ClassicalArithmeticCompletion §§7.10,7.60; IntegralHeckeAndGaloisDeterminants §0.6 | `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:14550`,15856: componentwise reduced norm and ramified-real positivity. The Azumaya law is imported from the latter owner. |
| IntegralLattices, completed Layers1–5 | `Completed/IntegralLattices/README.md`: Gram forms, discriminants and gluing. Primitive-embedding uniqueness and indefinite classification remain the declared Part II contract, not a nonexistent supplied theorem. |
| K3SurfacesAndSymplecticBoundedness §§3.3,4.2 | Supplied head supplies K3 cohomology/Picard theory; the full integral even-unimodular signature statement remains the registered gap. |
| SchemeAndStackFoundations §§1.17,1.23,4.11; StableReduction Layer4 | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2624`,3021,5528: finite quotients and modifications; `TauCetiRoadmap/StableReduction/README.md:468`: general blowups. PS.8 retains the separate chart and smoothness proofs. |
| AlgebraicTopology Stage6 | Main supplies surface homology, intersection form and integral duality; the explicit slit-cover cycles and orientation calculation remain PS.0.5's task. |
| MotivesAndAlgebraicCycles MC.2, §§5.7,6.7–6.9 | Actual realization, arbitrary-pair comparison, evaluated period algebra and torsor targets exist. PS.2 imports evaluation. Three missing extensions are registered gaps, not supplied theorems. |
| ComplexComparisonPartII C5 | Proper de Rham–Betti comparison, multiplicative interface and curve localization support PS.0–PS.2; the arbitrary-pair comparison is attributed to MC, not inferred from proper smooth comparison. |
| ArithmeticLocallySymmetricSpaces ALS.0.4–ALS.0.9, ALS.F.5, ALS.5b.1 | Arithmetic quotient, relative Lie-cochain and invariant-form infrastructure exists. Stable comparison itself is already owned by ArithmeticKTheory: S01. |
| ArithmeticGaloisRepresentations §§2.4–2.6,3.3; SmoothRepresentationsOfLocalGroups SR.5.2 | Weil–Deligne and conductor statements resolve. `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:4523` constructs Frobenius semisimplification with finite inertia and characteristic zero, retaining N. |
| AutomorphicLFunctionsAndLocalFactors AL.1,3,4,5 | Hecke functional equation, local parameters, epsilon/Gamma factors and imprimitive leading-term correction. The roadmap does not divide by a vanished Euler correction. |
| NeronModelsAndSemistableAbelianVarieties §6.10; WeilConjectures WC.1–WC.2 | Bad-place H¹ compatibility and pure good-place realizations resolve separately; no good-reduction restriction is substituted for the bad-place input. |
| EtaleDualityAndPerverseSheaves §§0.5–0.6 | Geometric/arithmetic trace and cup-product interfaces resolve; these are the corrected labels, not the earlier fictitious numbered layers. |
| DirichletPadicLFunctions L0 | Character values, Gauss normalization and the conductor-one B₁=+1/2 endpoint are explicit; comparison with Mathlib's −1/2 convention is required. |
| NoncommutativeAndEquivariantIwasawa §§2.7,7.9,7.13–7.15 | Virtual determinant category and shifted zeta specialization resolve. NE.7.13 uses C[1]; NE.7.14 restricts the induction argument to rational-valued characters. |
| EllipticKTheory | The regulator theorem is explicitly a named supplier gap. No arithmetic theorem is silently attributed to an unavailable subsection. |
| ArithmeticGaloisDuality D7 | Compact support and duality retain S containing infinity, p and ramification. |
| SelmerIwasawaCohomology §§2.9,2.21,2.23–2.24,3.14,4.7,4.9 | Finite conditions, Selmer complexes and inverse fundamental-line convention resolve. The small-weight theorem has p>2 and its weight interval; it does not independently cover all small primes. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.P3,P5 | `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:1356`,1430: rational period sequences/exponential and comparison realizations; an integral exponential still needs a sufficiently small neighborhood. |
| AutomorphicGaloisRepresentationsPartII AG2.5–AG2.6 | Strong coefficient fields and uniform realizations exist. PS.6.7 transports an explicit BBK witness, rather than importing a theorem from a later rank-one supplier. |
| GeneralAlgebraicKTheory Layer4 | Relative K-groups and localization; the virtual determinant category is separately imported from NE §2.7. |
| IntegralIwasawaTheory §§11.1,11.7 | CM twist versus totally real abelian theorem are distinguished. S contains infinity,p,ramification; no arbitrary-CM assertion is attributed to §11.7. |
| CrystallineCohomology CR.3,CR.5–CR.7, especially CR.6.3 | Cup products, finite-level PD comparison and proper one-parameter log comparison exist; the roadmap retains finite-projectivity/base-change obligations. |
| PadicDifferentialEquationsAndRigidCohomology RD.1.46,1.63,3,4.20–4.24,4.29,4.31,4.36–4.38,7.1,7.10 | Dwork connection, Artin–Hasse integrality, dagger/Gysin/descent and rational rigid–crystalline comparisons resolve. RD.4.29 requires a smooth liftable pair; PS.8 uses it on smooth fibres and a separate log comparison at the boundary. |
| ModularCurvesPartII §3.6 | Tate cusp j=q⁻¹+744+⋯ exists. Its formal cusp is not credited with PS.8.10's Schwarzian identity. |
| PolylogarithmFunctions | Principal classical Li_n and its unit-disc series exist; this does not already construct Brown's motivic MZVs. |
| AnabelianGeometryAndNonabelianChabauty NC.2 | Unipotent fundamental groups and realizations exist; the mixed Tate tangential path object is constructed here with DG's hypotheses. |
| ArithmeticKTheory §§3.2–3.4; BorelRegulators §§6.0a–6.3 | Current supplied heads own the rational ranks, comparison and Adams normalization duplicated by PS.3.2a: S01. |

All six gap slugs agree between `packages/PeriodsAndSpecialValues/design/plan.json` and the README. Every gap has a named supplier; the README refines the signatures and relevant hypotheses. The three motivic extensions, K3 integral form, CM regulator theorem and indefinite-lattice Part II were not treated as missing supplied declarations. The earlier settled ownership dispositions remain accepted. A lead suggesting a rational motivic comparison in MotivicEtaleKTheory could not be resolved to an available roadmap by the service; it is not evidence that the declared Adams-comparison gap duplicates an existing target.

Ownership searches used the required roadmap grep/show service, the main active/completed folders, board packages, and all 28 supplied open-roadmap checkouts. Objects searched included formal/evaluated periods, realization torsors, mixed Tate motives, MZVs/Hoffman, regulators, stable arithmetic cohomology, Dwork and K3 periods. The regulator duplication is S01. Generic formal periods remain MC's property. Classical polylogarithm regulators and Bloch groups are different from the mixed Tate MZV algebra constructed here. No foreign declaration in the inspected corpus reused this package's namespace. Broad search hits on dynamical “formal periods” and Hoffman–Wielandt were discarded as different objects.

The read-only dependency check returned exit status 0 and exactly:

```text
depcheck: 29 roadmaps, 277 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Internal forward references used only as Checks were distinguished from proof inputs; for example PS.9.14's weight-five Check cites PS.9.18, while its derivation-kernel proof uses the earlier coaction/free-Lie structure, not that Check.

## Source and pin verification ledger

The following 28 source entries each have at least one locator resolved in the legal text. The table records 28 primary locator checks, with additional checked anchors in the last column. A resolved locator certifies the stated passage and its hypotheses, not an independent proof of its whole paper. Serre's displayed formulas have the extraction limitation recorded below. BG and Tate-legal retain their settled dispositions.

| Source | Primary locator resolved | Source-line witness and additional checks |
|---|---|---|
| BCGP | Proposition2.8.1, p.36 | BCGP line1775: compatibility including bad places; line1831 gives the Gamma convention; line1858 has the alternating-exponent error. |
| B | Theorem1.1, p.1 | B line38: motivic Hoffman basis. Lemma3.8 at line490; determinant criterion at line885; Theorems7.3–7.4 at lines910,919. |
| BK | Definition5.9/(5.9.1), p.374 | BK line1277: regularized measure; line1304 limits global triples to weight≤−3; local weight≤−1 at line1236 and local exponential neighborhood at line1252. |
| BV-final | Corollary5.7, published p.196 | BV-final published line1361 says rational-valued, versus author-final line1154. Published Definitions2.5,3.7 at lines262,516 and Remark5.6 at line1273 confirm the determinant-domain issue. |
| Deligne | Proposition–Definition2.3(ii), translation p.10 | Deligne line407: dual argument misprint; (7.8.3) at line999 fixes the modular motivic normalizer. Tate and inverse comparison conventions checked against §§0,3,5. |
| DG | Theorem4.4, preprint pp.47–50 | DG line1322: motivic path torsor with tangential basepoints. Proposition1.9 at line456, Proposition2.14 at line681, Proposition3.10 at line1091. |
| H | Theorem4.12, p.15 | H line693: missing ambient unimodularity and ill-typed composition. Proposition4.26/Example4.27 at lines964–979; Theorem4.28 at line1019; normalization proof at line1038. |
| HMS | Theorem2.10, pp.10–11 | HMS line447: period algebra/comparison algebra. Theorem3.3 at line530; these support imported evaluation, not numerical injectivity. |
| HMS-book | Proposition3.2.9 | HMS-book line3527: corrected relative-comparison locator; Proposition3.2.13 at line3541, Lemma3.2.14 at line3566. Second-kind cohomology and periods: lines10780,10820,10836. |
| Huybrechts | Chapter1 Proposition3.5, p.17 | Huybrechts line500 onwards gives rank22 and the even unimodular K3 lattice; line533's characteristic-class discussion is used on the torsion-free K3 lattice. |
| IKZ | Theorem1, p.310 | IKZ lines179–215: A(u), the linear operator ρ and regularization comparison; Proposition1 at line141. The T²,T³ coefficient tests match these formulas. |
| K | Lemma2.3.6, p.4 | K line158: four uniqueness hypotheses. Lemma2.3.8 at line175 supplies extension at integral exponents; irreducibility is separate, not a formal-disc uniqueness assertion. |
| LYA | §6, (6.1)–(6.4), p.22 | LYA lines772–798: integrality recurrence, with omitted input normalization in the source. Equation(5.19) at lines742–766 supplies the quartic polynomial. |
| LYH | Proposition3.1, pp.3–4 | LYH line116: symmetric-square family, specialized at λ=256,ν=1/4; not a theorem about a different hypergeometric normalization. |
| NS | Equation(26), pp.12–13 | NS line536 and line549: equal upper parameters after the continuation; equation(39) at line784 supplies the local ratio. |
| Serre | §§3.1–3.3, pp.19-10–19-11 | Serre lines292,298,309 locate the complex/real Hodge decompositions and cohomological application. Several displayed formulas are missing from this extraction; their exact typography is uncertified here. |
| Qian | Lemma2.1, pp.4–8 | Qian line183: equivariant blowup with TU=∏Z_i charts; Remark2.2 at line362. Theorem3.2 at line647 uses the finite-level PD comparison before the inverse limit. |
| SG | Lemma5.6, p.30 | SG line1082 explicitly assumes p>dim(V). Theorems4.16/4.18 at lines964,972 give the smooth projective comparisons; no p=3 threefold divisibility is imported from Lemma5.6. |
| SH | Theorem5.13, pp.13–14 | SH line517: pairing coefficients; Definition6.1 at line586, Lemma6.2 at line592, Lemma6.3 at line636. Natural symmetric-group invariance at line144 needs the sign correction. |
| SO | Proposition4.24, pp.23–24 | SO line1040: equality of framed motives, with frame-compatible product maps in lines1044–1055. The roadmap asks for the actual framed-relative-motive contract. |
| SS | §3, pp.12–13 | SS lines572–581 distinguish the unproved crystalline identification and the two parameter-Frobenius choices; “former/latter” is reversed. Constraint de Rham complexes were checked in §2. |
| Z | Theorem1, p.979 | Z line239: all a,b≥0 and the ascending-index coefficients. Propositions4–6 at lines481,516,600 are the analytic continuation/growth route; reversal gives the displayed weight-five formulas. |
| BF | Remark7, p.534 | BF line1555: missing reciprocal. Lemma9 at line1597 and Conjecture4 at line1625 use the extended boundary and the positive obstruction sign; they are not unconditional ETNC proofs. |
| IL | Completed Layers1–5 | IL line446 starts the lattice layer; line632 starts the rank-one/ADE layer. The completed file does not prove the requested indefinite classification. |
| LTXZZ | Theorem8.3.2, pp.315–316 | LTXZZ line7833 retains Hypothesis3.2.10, admissibility and a nonzero Abel–Jacobi class; line7853 gives Selmer dimension1. PS.6.7 instead requires an explicit arithmetic witness, so no unrestricted converse is claimed. |
| Park | Proposition5.2, p.449 | Park line1568: the q factor in the Frobenius diagram. Corollary4.12 at line1345 applies to smooth complete intersections; it is not an integral residue-basis theorem. |
| Burgos | Theorem10.9, pp.95–97 | Burgos line4139: Borel=2·Beilinson. Theorems9.9,9.12 at lines3189,3256 occupy pp.79,80, not pp.72–74. |
| Stacks | Tag00OC, Proposition10.110.5 | Stacks line12552: Noetherian local regularity versus finite projective dimension of the residue field; applicable to ℤ₂[C₂]. |

The published BV text was fetched through the sources service from the legal EMIS/GWDG archive under the existing BV-final key. Its published line numbers above refer to that version; unqualified author-final line numbers refer to the supplied author text. No package manifest was changed. The initial licence-class lookup failure was resolved by that successful institutional fetch; it is not an outstanding source request.

At the pinned libraries, the following declarations and relevant domains were checked directly:

| Pinned file | Declaration/domain and value test |
|---|---|
| `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:141`,275,798; `Mathlib/LinearAlgebra/Matrix/Block.lean:389` | det_mul, det_smul, det_fin_zero, det_of_isUpperTriangular; empty determinant1, rank-two scaling factor4. |
| `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean:409` | det_nonsing_inv is the total inverse identity; it does not make a singular comparison invertible. |
| `Mathlib/RingTheory/Localization/Away/Basic.lean:62`,147; `Mathlib/Algebra/Polynomial/Laurent.lean:551` | mul_invSelf, lift requiring IsUnit, eval₂_T; x·x⁻¹=1 requires a unit image. |
| `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:45`,53; `Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean:123`,397,447 | Gammaℝ, Gammaℂ, beta comparison with positive real parts, reflection, zero-at-pole convention. Γℂ(1)=1/π; total Γ(0)=0 is not an analytic value. |
| `Mathlib/NumberTheory/LSeries/RiemannZeta.lean:105`,222; `Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean:189`,226,232,251 | Completed functional equation, tsum for natural k>1, Hurwitz negative values with k≠0, ζ(2),ζ(4),Bernoulli specialization. The conductor-one endpoint is separately compared. |
| `Mathlib/NumberTheory/EulerProduct/DirichletLSeries.lean:104`; `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:271`,283 | Euler product requires Re(s)>1; rootNumber and primitive-character functional equation retain primitivity and the dual character. |
| `Mathlib/Analysis/Meromorphic/Order.lean:50` | meromorphicOrderAt takes values in WithTop ℤ; a nonzero germ excludes the identically-zero infinite-order case. |
| `Mathlib/Probability/ProductMeasure.lean:354`; `Mathlib/MeasureTheory/Measure/Haar/Basic.lean:520` | infinitePi has probability-measure hypotheses; Haar measure uses PositiveCompacts and the locally compact Borel setting. Factors of mass1/2 require normalization. |
| `Mathlib/MeasureTheory/Integral/IntervalIntegral/IntegrationByParts.lean:520`; `Mathlib/MeasureTheory/Integral/DominatedConvergence.lean:57`,88 | integral_comp_mul_deriv', dominated convergence and integral_tsum have differentiability/integrability hypotheses; the roadmap handles the singular endpoint by a limit. |
| `Mathlib/Analysis/Complex/PhragmenLindelof.lean:113` | horizontal_strip requires DiffContOnCl and boundary/growth data; the Zagier proof plan supplies the continuation and growth argument rather than applying it to an arbitrary germ. |
| `Mathlib/Analysis/SpecialFunctions/OrdinaryHypergeometric.lean:81`; `Mathlib/RingTheory/PowerSeries/Substitution.lean:456` | Native ₂F₁ and substInv exist; no native ₃F₂ or geometric marked period is inferred. The retained mirror series has constant0 and linear1. |
| `Mathlib/NumberTheory/Harmonic/Defs.lean:23`; `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean:620` | Native harmonic duplicates the retained r=1 use, S08; factorial valuation requires Fact p.Prime. Values at p=2,3 were explicitly recomputed. |
| `TauCeti/Geometry/Hodge/Tate/Basic.lean`; `TauCeti/LinearAlgebra/TensorCoalgebra/Coaugmented/Basic.lean:84`,228; `TauCeti/LinearAlgebra/IntegralLattice/StandardCoordinates.lean:53` | Tate's lattice inclusion is ordinary ℤ→ℂ; TensorWords/deconcatenation includes the empty cuts but no shuffle product; the Gram-coordinate formula is present. |

## Verified sound

Read all 2,442 README lines and all 259 Suggested.lean lines, both repository rules files, all 31 prior findings and the repair dispositions. The report contains 79 numbered-target computation rows, 43 declaration rows (26 definitions and 17 theorems), and 14 additional convention/example rows. All 307 section Check bullets and the eight opening normalization Checks were inspected against their formulas and domains; the tables record grouped computations, not 315 independently executed tests. Each numbered section has at least three Checks; S07 identifies the orientation section's non-discriminating ones. Exact rational and integer arithmetic independently reproduced the five monodromy isometries, their product, nilpotence, quartic coefficients, inverse coefficients, Dwork coefficients/weights and Zagier coefficients.

Supplier checking covered all 31 roadmap-contract headings, the two pinned-library headings, the further named citations summarized above, and object searches in all 28 supplied sibling heads. The source ledger contains 28 resolved primary locators, with additional named locator checks recorded alongside; 27 of those primary passages have readable mathematical statements, while Serre's section headings resolve but its missing displayed formulas remain uncertified. The published BV correction was separately resolved. The six registered supplier gaps remain conditional contracts. The dependency checker reports 277 edges and zero problems.

All 43 supplied elaborated types were compared with their README statements. No required section binder was lost; in particular the prime hypotheses on the two Dwork convergence theorems and the determinant theorem are explicit, and the finite-dimensionality conclusion accompanies finrank. Every theorem uses the actual retained numerical object. No retained theorem states True, assumes its conclusion, or depends on admitted data. The one-tactic/definition-duplication probe found S08; the deleted old scalar lemmas and admitted examples were not restored.

The headline inventory is: motivic period normalization and algebraicity; marked formal-period comparison; fundamental-line/regulator, ETNC and Bloch–Kato/elliptic comparisons; Legendre transformation and error estimate; geometric quartic Picard–Fuchs/monodromy, hypergeometric identity and mirror integrality; Dwork weighted convergence and geometric quintic boundary Frobenius; regularized/motivic double shuffle, Zagier evaluation, motivic Hoffman basis and numerical spanning/dimension. The statable Legendre, hypergeometric, mirror-integrality, Dwork-convergence, numerical-MZV, determinant and Hoffman-count/span assertions occur among the 17 theorems. The module docstring names the missing motivic, torsor, determinant-category, Selmer, marked-family and log-crystalline carriers for the geometric headlines. No additional statable headline was found to be missing; the regulator headline's ownership must change under S01.

The checked head is 9f14c68e80529a59825e1d67cc9edf2091ff2f3a. Its diff against origin/main changes seven files, all within `packages/PeriodsAndSpecialValues/`, with 4,245 insertions. Mathlib and Tau Ceti pins were respectively 6b7abb3c7686292736be2955bd3eb9ebf63b456a and a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Suggested.lean has a single import Mathlib, no set_option, no lemma, no admitted data and no admitted examples. The package's mathematical text has no PR-number/process narrative; finite sums and analytic error bounds no longer prescribe computational algorithms. Only this report and scratch review material were written; no Lean process, package mutation, Git write or external post was performed.

## Not verifiable

- BG remains the settled uncertified citation, by the abelian Tate locator recorded in BF Remark10, p.537. Its unavailable proof was not certified and was not requested again.
- Tate-legal remains waived at (3.4.3)–(3.4.7), printed p.15. The local-constant convention was not certified from that text and was not requested again.
- Serre §§3.1–3.3 resolve in the legal extraction, but displayed Gamma products are absent at Serre lines287–308 and336–337. The normalizations were checked independently against Deligne, BCGP and the pinned Gamma definitions. The exact typography of Serre's displays was not certified; no mathematical defect is inferred from missing OCR content.
- The actual future geometric objects and the six supplier extensions are not implemented acceptance-test carriers at these pins. Computed convention checks and conditional proof-plan audits do not establish those constructions or the conjectural predicates.
- No Lean elaboration/build was run, as required by the read-only brief. The supplied 43-type extraction is the signature evidence; this review makes no independent build claim.
- The arithmetic facts about 11a1 in the final example were used as the displayed arithmetic witness; its scalar substitution was checked, but a separate proof of its rank, Sha and L-value was not reconstructed.

## Source issues

- **Misprint** in BCGP at §2.8, display after (2.8.5), printed p.37: the source says the alternating cohomological exponent depends on the complex variable s; it should be the integer cohomological degree i; affects nothing.
- **Misprint** in Deligne at Proposition–Definition2.3(ii), English translation p.10: the source says to evaluate the twisted-dual infinity factor at s; it should be evaluated at −s, equivalently the untwisted dual at 1−s; affects nothing.
- **Misprint** in BF at Remark7, printed p.534: the source says the Euler factor is the characteristic polynomial evaluated at the norm power; it should be its reciprocal; affects nothing.
- **Error** in BV-final at author-final Corollary5.7, internal p.27: the source says Artin induction applies to arbitrary p-adic-rational characters; it should be restricted to rational-valued characters, since nontrivial C₃ characters over ℚ₇ are counterexamples; affects nothing; corrected in print at Corollary5.7, p.196.
- **Gap** in BV-final at Definitions2.5,3.7, Conjecture4.1 and Remark5.6, printed pp.170–171,177,188,194–195: the source says the inverse-determinant zeta morphism forms a leading-term pair with the unshifted compact-support complex; it should be paired with the shifted complex and its compatible order, boundary and Bockstein normalization; affects the proof.
- **Error** in BV-final at proof of Corollary5.7, printed p.196: the source says an integral virtual combination of permutation characters is a permutation character; it should be only the forward implication, since the C₂ sign character equals regular minus trivial; affects nothing.
- **Gap** in BV-final at §5.2, map after (23), printed p.193: the source says the p-adic regulator map μ_p is an isomorphism without a nonvanishing hypothesis; it should be inverted only after the required regulator nonvanishing, including Leopoldt in permutation cases; affects nothing.
- **Misprint** in H at Proposition4.26 and Example4.27, printed p.21: the source says to rescale the residue form by t⁻¹ and uses multiplication by t in the transformed operator; it should be tΩ and multiplication by 1/t inside the transformed operator; affects a stated result.
- **Misprint** in H at Theorem4.28, printed p.22: the source says the continued regular solution has upper parameters 1/8 and 3/8; it should be the equal pair 1/8,1/8, with linear coefficient1/32; affects nothing.
- **Error** in H at Theorem4.12, printed p.15: the source says the stated inequalities imply uniqueness of primitive embeddings into any even nondegenerate ambient lattice; it should be restricted to an even unimodular ambient lattice under those inequalities; affects nothing.
- **Misprint** in H at Theorem4.12, printed p.15: the source says i=j∘α with α an automorphism of the ambient lattice; it should be i=α∘j, which has the required domain; affects nothing.
- **Error** in H at the paragraph before Theorem4.12, printed p.15: the source says the full-rank embedding M₂⊕T₀ into K3 cohomology is primitive; it should be an index-four embedding, since its determinant is −16 and the ambient determinant is −1; affects nothing.
- **Gap** in H at proof of Theorem4.29, printed p.23: the source says the two based conifold loops have identical monodromy images; it should be conjugation by p↦p+1, with fixed points differing by1; affects nothing.
- **Misprint** in B at proof of Lemma3.8, v1 printed p.11: the source says the intermediate alternating sum has coefficient−2; it should be −1 there, yielding the stated factor2 only after combination with (3.8); affects nothing.
- **Error** in SH at §§3.1–3.2, v2 printed pp.3–4: the source says the rank-four holomorphic sector is invariant under the natural combined diagonal and permutation action; it should be diagonal-invariant and permutation-sign-equivariant, or permutation-invariant only after a sign twist; affects nothing.
- **Error** in LYA at §6, (6.1)–(6.4), printed p.22: the source says any integral input series suffices for the stated normalized-branch integrality criterion; it should be x=q+O(q²): P=(y−x)(2y−x), x=2q+q² gives m=1 but y=q+q²/2; affects nothing.
- **Misprint** in SS at §3, printed p.13: the source says raising λ to its p-th power preserves fibres, while fixing λ mixes them; it should be the reverse, as the displayed correction involving λ^p itself shows; affects nothing.
- **Error** in HMS-book at Theorem14.5.3, printed pp.277–278: the source says the first/second/third-kind decomposition is unique modulo exact forms under the stated exclusions; it should be existence without uniqueness: transfer a nonexact holomorphic form between the first and second summands without changing their pole types; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9f14c68e80529a59825e1d67cc9edf2091ff2f3a", "job": "RT-PeriodsAndSpecialValues~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
