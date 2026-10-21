<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/152#issuecomment-6320863700 -->
Red team round 1 pass a (codex) of 0c13697

Verdict: needs_changes

1. **F01** (P1) The regulator and Frobenius prerequisites form a cycle

   **Location:** packages/HabiroNahmSeries/README.md:948 and :1019: “the potential/constant congruences below”; “the full algebra congruence”.

   **Claim:** The full coefficient Frobenius congruence uses the potential and constant congruences of §6.3, while §6.3 declares the full algebra congruence as an input.

   **Witness:** §6.1 → §6.3 → §6.1 is explicit in the two Needs clauses. The potential specialization is itself listed as a prerequisite of membership at :1040.

   **Exact repair text:** “Prove the intrinsic modified-potential congruence and the refined constant-unit congruence first, using only étale Frobenius, the local polylogarithm suppliers and the Gaussian coefficient localization. Then combine these with the regular-part Dwork estimate to prove fullCoefficientFrobeniusCongruence.” Give each of these targets its own Needs clause; remove the full algebra congruence from the prerequisites of the potential and constant congruences.

2. **F02** (P3) Pull-request identifiers and a declaration catalogue remain in the package

   **Location:** packages/HabiroNahmSeries/README.md:11, :48, :458: “TauCetiRoadmap pull request #286”; packages/HabiroNahmSeries/Suggested.lean:318–338.

   **Claim:** The README identifies a supplier by a pull request, and the Lean file ends with a catalogue of omitted declarations.

   **Witness:** ThetaSeries is already a roadmap on main, with lattice Poisson summation in TauCetiRoadmap/ThetaSeries/README.md:423. The trailing Lean comment explicitly enumerates names rather than stating a signature.

   **Exact repair text:** Replace all three pull-request parentheticals with “ThetaSeries Layer 1”. Delete the trailing catalogue comment in Suggested.lean; retain the opening note that the README is definitive and the signatures are not exhaustive.

3. **F03** (P3) The source manifest is absent

   **Location:** packages/HabiroNahmSeries/README.md:1369–1383 (References).

   **Claim:** Ten cited works have no package sources.toml records.

   **Witness:** The head contains only README.md, Suggested.lean, metadata.toml and review.json in the package; no sources.toml exists.

   **Exact repair text:** Add sources.toml with schema tauceti-roadmap-sources/v1 and a record for each cited work, including the exact version, all used locators, cited_for sections and the source-service provenance/status fields. Keep any inaccessible work explicitly uncertified or in the missing-reference request.

4. **F04** (P1) The residue definition has the wrong normalization already at order one

   **Location:** packages/HabiroNahmSeries/README.md:1131–1135: “∏_i t_i^(−1/m) J_A(t^(1/m),w,ζ_m+x)∏_i dw_i/w_i”.

   **Claim:** This residue equals the product of the two formal Nahm series for every symmetric integral matrix.

   **Witness:** N=m=1, A=0: J(t,w,1)=(1−w)/(1−w−t), z=1−t. Its stated residue is −1/(1−t). Euler's identities give F₀(t,q)F₀(t,q⁻¹)=+1/(1−t).

   **Exact repair text:** “Define symmetrisation with the residue orientation and Jacobian normalization derived from the q-difference comparison, and require its constant augmentation to be +1 for every symmetric integral A. At A=0,m=1 the normalized residue is −Res_{w=1−t} t⁻¹J₀(t,w,1)dw/w=1/(1−t).” Re-derive the general normalization and shifted recurrence before asserting the product theorem; do not copy GSWZ (218) without this correction. Add this negative-control Check and a proved rational-function example.

5. **F05** (P1) The displayed finite residue sum has a pole at augmentation zero

   **Location:** packages/HabiroNahmSeries/README.md:1138–1143, the formula beginning “1/(m^Nδ_A(t))”.

   **Claim:** This finite expression is the constant root coefficient of the normalized symmetrisation.

   **Witness:** A=0,N=1,m=2,T²=t,z=1−t gives δ=z and Σ_{w²=z}(1+T/(1+w))=2+2/T. The displayed expression is (1+T⁻¹)/(1−T²), not a constant-one power series.

   **Exact repair text:** “Recompute the finite residue sum from the corrected Jacobian normalization, retaining all powers of t^(1/m). For A=0,m=2 its value must be 1/(1−T), T²=t.” Replace the displayed sum after this derivation; the missing factor in this boundary case is T. Also replace the product's argument by the consistently chosen root variable: the current residue uses F_A(t^(1/m),q)F_A(t^(1/m),q⁻¹), whereas :1135 writes F_A(t,q)F_A(t,q⁻¹).

6. **F06** (P2) Gaussian Fubini needs an invertible integration block

   **Location:** packages/HabiroNahmSeries/README.md:841–847: “for an invertible symmetric Λ”; “Fubini for block variables”.

   **Claim:** Arbitrary blockwise Gaussian integration is provided from invertibility of the full matrix alone.

   **Witness:** Λ=((0,1),(1,0)) is invertible, but its first principal block is zero, so the prescribed first Gaussian integral is undefined. Aarhus line 457 explicitly requires the integration block to be invertible.

   **Exact repair text:** “For Λ=[[A,B],[Bᵀ,C]], the iterated Gaussian/Fubini theorem assumes A and the Schur complement C−BᵀA⁻¹B invertible; equivalently require A and Λ invertible. The full Gaussian remains defined when a proposed integration block is singular, but that iterated formula does not apply.” Add the displayed 2×2 matrix as a negative Check.

7. **F07** (P2) The first-jet coefficient algebra is not étale when p divides m

   **Location:** packages/HabiroNahmSeries/README.md:973–984: “At p∤Δ and m prime to Δ take the full finite étale algebra”.

   **Claim:** These stated conditions make the cyclotomic/Kummer coefficient algebra finite étale and its displayed denominators units.

   **Witness:** K=ℚ, rank zero, Δ=6, p=m=5 satisfies both conditions. The algebra contains ℤ₅[ζ₅], ramified over ℤ₅. Also 1−ζ₅ is not a unit, contradicting the denominator argument at :984.

   **Exact repair text:** “For a prime p with p∤Δm, and m prime to Δ, take O=R̂_p[ζ_m,T,w]/(δT²−1,w_j^m−z_j).” Keep the p|m root reexpansion statements as separate all-order targets; this local étale calculation does not prove them.

8. **F08** (P2) The coefficient scheme has not inverted its proposed base's 2

   **Location:** packages/HabiroNahmSeries/README.md:896–901: “S_A=ℤ[…]”; “étaleness over ℤ[1/2,t_i^±1]”.

   **Claim:** The displayed S_A is an algebra étale over the base with 2 inverted.

   **Witness:** At N=0, S_A=ℤ[T]/(T²−1) has the quotient T↦1 onto ℤ, so 2 is not a unit. It admits no unital ℤ[1/2]-algebra structure.

   **Exact repair text:** “Prove S_A[1/2] is étale over ℤ[1/2,t_i^±1]. Keep S_A as the integral presentation; apply this étaleness statement to its p-completion only for p≠2.”

9. **F09** (P2) The advertised coherent-root example does not enlarge the field

   **Location:** packages/HabiroNahmSeries/README.md:205: “The coherent-root example at A=1/2 shows why the coefficient field […] can be larger”.

   **Claim:** The example of §1.3 witnesses a strict extension of the field generated by x.

   **Witness:** That example has y=1−x and x=y². Consequently ℚ(y)=ℚ(x)=ℚ(√5).

   **Exact repair text:** “The A=1/2 example tests coherent choice of a root, with ℚ(y)=ℚ(x). The strict extension in coherentRadicalExtension (§2.6) tests enlargement of the coefficient field.”

10. **F10** (P3) The Gauss-sum APIs already exist at the pinned commit

   **Location:** packages/HabiroNahmSeries/README.md:52: “these postdate the pinned Tau Ceti commit”.

   **Claim:** The named Gauss-sum interfaces are available only after the pin.

   **Witness:** At a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, TauCeti/LinearAlgebra/FiniteBilinearModule/GaussSum.lean already defines gaussSum, IsNondegenerate.gaussSum_mul_conj and gaussSum_eq_card_mul_gaussSum_quotientOfLeQuadraticRadical.

   **Exact repair text:** “These declarations are available at the pinned Tau Ceti commit a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 in TauCeti/LinearAlgebra/FiniteBilinearModule/GaussSum.lean.”

11. **F11** (P1) Analytic polylogarithm contracts cite the wrong owner and unsupported extensions

   **Location:** packages/HabiroNahmSeries/README.md:9, :56–62, :209, :458, :929: “Polylogarithms Layers 1–2”; “supplier targets of Polylogarithms Layer 1”.

   **Claim:** That supplier provides the analytic functions, embedding regulators, circle-valued Rogers extension and trigonometric sum.

   **Witness:** TauCetiRoadmap/PolylogarithmFunctions/README.md:19 excludes algebraic regulators; :822 explicitly excludes the projective/circle-valued Rogers extension. Its functions are in §§1.1–1.7, 3.1–3.6, 5.1–5.8 and 6.1–6.5.

   **Exact repair text:** “Consume PolylogarithmFunctions §§1.1–1.7 and 3.1–3.6 for Li₂ and its analytic identities, §§5.1–5.8 for Bloch–Wigner values and relations, and §§6.1–6.5 for the interval Rogers function and its golden-ratio values. Construct the complementary projective circle-valued Rogers extension, its descent to the chosen integral Bloch convention, and the Andrews–Gordon trigonometric identity as separately named prerequisite targets here.” Cite the current function owner throughout; keep the algebraic regulator comparison separate.

12. **F12** (P1) The arithmetic and Habiro foundations have no available supplier contracts

   **Location:** packages/HabiroNahmSeries/README.md:56–81, :996–997, :1037, :1235, :1327, :1344.

   **Claim:** K3BlochGroups, BorelRegulators, HabiroNumberFields, HabiroRings, PadicHodgeRegulators, ArithmeticKTheory and HabiroCohomologyFoundations supply the named sections and extensions.

   **Witness:** None has a folder on supplied main/Completed, an entry in ORDER.txt, or an open new-roadmap pull request in the checked list. No design/plan.json or matching gap slug declares these prerequisites.

   **Exact repair text:** “Before consuming these interfaces, assign each missing prerequisite a named, sourced target in this roadmap: the integral-convention/Suslin and Borel comparisons; finite Chern injectivity and cyclic dilogarithms; number-field Habiro rings and K₃ modules with finite étale extension and effective descent; the integral local K₃ regulator lattice; and the relative Habiro–Hodge comparison.” Import already owned pieces instead: GeneralAlgebraicKTheory provides the K-theory carriers, KTheoryFiniteLocalFields §§1.8 and 7.4 provides the finite-Chern and local reduction inputs, and ColemanIntegration §L2.Fb supplies the antisymmetric pre-Bloch/boundary API; QWittVectors §6.1 supplies completed étale Frobenius. Alternatively register precise matching gap contracts with eligible earlier owners. Do not describe an unannounced future supplier extension as supplied. Retain full generality and all components in the moved targets.

13. **F13** (P1) The q-series dependency is neither available nor declared as a gap

   **Location:** packages/HabiroNahmSeries/README.md:9, :73, :444 and :1303: “QSeriesPartitionsAndMockModularForms […] QM.0–QM.1”.

   **Claim:** The finite/formal Pochhammer, q-Lucas, Andrews–Gordon, eta multiplier and modular Rogers–Ramanujan interfaces are supplied there.

   **Witness:** This name is absent from main/Completed and ORDER.txt and has no open new-roadmap pull request. Its board package has sources.toml but no README.md defining QM.0 or QM.1.

   **Exact repair text:** “Consume HabiroCyclotomicCompletions §1.1, QToolkit.pochhammer, pochhammerInf, reciprocalPochhammer, qBinomialSeries, integralPochhammerInf and their identities (its README:207–285), for the finite/formal toolkit. Register the remaining general q-Lucas, Andrews–Gordon and modular Rogers–Ramanujan inputs as precise locally owned targets or matching gaps with eligible earlier suppliers.” Do not rebuild the earlier toolkit; remove the nonexistent QM.0/QM.1 supplier assertions. The HabiroCyclotomicCompletions head explicitly assigns the q-series roadmap the role of consumer at :55–63.

14. **F14** (P1) Étale Frobenius is assigned to HabiroRings instead of its earlier owner

   **Location:** packages/HabiroNahmSeries/README.md:79, :935: “HabiroRings layer HR.1's étale Frobenius theorem”.

   **Claim:** HabiroRings owns the unique completed coefficient Frobenius used on S_A^(m).

   **Witness:** TauCetiRoadmap/QWittVectors/README.md:756–770 defines QWitt.completedEtaleFrobenius, its reduction, naturality and iteration, for étale algebras over a perfectly covered Λ-base, at the supplied sibling head.

   **Exact repair text:** “Consume QWittVectors §6.1, QWitt.completedEtaleFrobenius and completedEtaleFrobenius_natural, on the étale coefficient algebra over the specified Laurent Λ-base with ψ_p(t_i^(1/m))=t_i^(p/m). Verify perfect coverage of that base using QWittVectors Layer 1. Use §6.2 only for cyclotomic completed overlaps.” Replace the HR.1 citations throughout.

15. **F15** (P1) The declared roadmap direction is bidirectional

   **Location:** packages/HabiroNahmSeries/README.md:71 and :1365: “its analytic proof can consume Layer 2 below”; “HabiroNumberFields consumes […]”.

   **Claim:** HabiroNumberFields supplies Layers 2, 4 and 6 here while also consuming Layer 2 and the examples here.

   **Witness:** The supplier contracts at :64–77 and dependency list at :458 point HabiroNumberFields → HabiroNahmSeries; :71 and :1365 point HabiroNahmSeries → HabiroNumberFields.

   **Exact repair text:** “The supplier proves its cyclic identity without consuming this roadmap. The analytic acceptance calculation and Nahm examples are applications owned here and create no reverse dependency.” If the analytic calculation is essential to that general identity, move the needed analytic foundation to the earlier owner instead. Apply the same ownership correction to :1367's reverse consumption by the algebraic regulator owners.

16. **F16** (P2) A readily expressible arithmetic descent milestone is missing from Lean

   **Location:** packages/HabiroNahmSeries/README.md:429; packages/HabiroNahmSeries/Suggested.lean:180–213.

   **Claim:** unitSeries_descent is a required all-coefficient milestone of Layer 2, but only convergence and holomorphy are mirrored.

   **Witness:** Its carriers are only fields, algebraMap, PowerSeries, constantCoeff, powers and coefficient maps, all present under import Mathlib. No Bloch, Gaussian or Habiro carrier is needed.

   **Exact repair text:** Add unitSeries_descent with explicit characteristic-zero field/algebra binders, m>0, Φ.constantCoeff≠0 and Φ^m in the image of PowerSeries.map (algebraMap K L); conclude Φ=C(Φ.constantCoeff)·map(U) for some U over K with constant coefficient one. This is the README's existing milestone, not a substitute for its heavier endpoints.

17. **F17** (P1) The rational kernel's claimed coefficient ring omits necessary denominators

   **Location:** packages/HabiroNahmSeries/README.md:1129: “coefficients in the localisation generated by t_i,w_i^±1 and `(1−t_i^mP_i(w^m))⁻¹`”.

   **Claim:** Every coefficient of J at a root of unity lies in the displayed ring.

   **Witness:** A=0,N=m=1 gives [x]J(t,w,1+x)=wt(1−w)/(1−w−t)³. Substitute t=u,w=1−2u: all listed generators are regular at u=0, but this coefficient is 2/u−4.

   **Exact repair text:** “Use the explicit ambient localization ℤ[ζ_m,t_i,w_i^±1,(1−w_i^m)⁻¹,(1−t_i^mP_i(w^m))⁻¹] for the kernel expansion. Then separately prove any smaller ring claimed for the residue after cancellation.” Recheck the localization proof coefficient by coefficient; add the rank-one first coefficient as a negative control. GSWZ (216) also omits these denominators, so citing it does not repair the statement.

18. **F18** (P3) Statable negative controls and nonconstant coefficients have no Lean mirrors

   **Location:** packages/HabiroNahmSeries/README.md:100–101, :123, :125–128, :231, :717, :990; packages/HabiroNahmSeries/Suggested.lean:92–101, :135–159, :246–249, :281–289.

   **Claim:** The Checks exercise the stated definitions, but the Lean file omits these tests even where all carriers and definitions exist.

   **Witness:** formalNahmSeries has only a constant-coefficient example; replacing it by 1 passes that test. No example tests the declared nonconstant A=3 coefficients, denominator rejection, or the characteristic-five zero discriminant.

   **Exact repair text:** “Bundle the statable controls into at most two proved examples per kept definition: denominator/period acceptance and rejection for Q=n²/4 and Q=n/2; both characteristic-five signed roots; the 2×2 and degenerate discriminants; the rank-zero half-integral branch change; the first two A=3 formal coefficients; and the remaining zero, quartic and linear regularisationJet controls.” Retain the existing positive tests by conjunction where necessary. Do not replace these with admitted examples or unrelated library calculations.

19. **F19** (P3) The integral-model definition has only one Check

   **Location:** packages/HabiroNahmSeries/README.md:177–186: “Define `nahmIntegralModel`”; “`integralModelNonunit`”.

   **Claim:** This definition meets the requirement of three discriminating Checks.

   **Witness:** The sole Check about the model is rejection of a target where δ is not a unit. The other five bullets test Bloch boundaries, not the model's ring or evaluation.

   **Exact repair text:** “Add: (1) the signed cubic over ℤ[z,1/Δ], z³−z+1=0, with 138 dividing Δ and the stated arithmetic exclusions, where z⁻¹=1−z² and δ⁻¹=(2z²+3z−9)/23 give a valid evaluation; (2) its localization to ℤ[z,1/(5Δ)], checking that evaluation and class transport commute with localization; (3) the existing rejection when δ is not a unit.”

20. **F20** (P3) A computational Frobenius algorithm is included as a target

   **Location:** packages/HabiroNahmSeries/README.md:1290: “factor P modulo p into distinct irreducibles”; “The algorithm is an application”.

   **Claim:** The roadmap prescribes polynomial factorization, iterative lifting and finite-precision evaluation as part of its library plan.

   **Witness:** The paragraph specifies an input representation, factoring step, lifting procedure and compatibility between successive precisions. This is the computational algorithm excluded by the package contract.

   **Exact repair text:** “For a finite étale ℤ_p-algebra with a specified integral monogenic presentation of index prime to p, identify its unique continuous Frobenius lift with the unique roots congruent to the p-th powers of the residue generators. Prove preservation of P, reduction compatibility, and functoriality of evaluations of the Nahm coordinates and δ.” Cite the existing Hensel theorem and QWittVectors §6.1; delete the procedural factorization and finite-precision algorithm.

21. **F21** (P2) The general q-binomial product theorem is reduced to a cubic special case

   **Location:** packages/HabiroNahmSeries/README.md:1171–1178: “Prove the useful formal identity” for F₃ only.

   **Claim:** Garoufalidis–Wheeler Proposition 1.14 is used only to plan a rank-one cubic identity.

   **Witness:** GW line 539, Proposition 1.14, states the product formula for every symmetric integral N×N matrix. Its generalized q-binomial factors include negative upper indices; the cubic formula is a specialization.

   **Exact repair text:** “State and prove formalNahmSeries_symmetrisation_qBinomial for every symmetric integral matrix A, with the generalized q-binomial convention of GW Proposition 1.14, equation (47), including negative upper indices. Put the F₃ formula here as a Check and derive it from that theorem.” Keep the residue comparison as its separate general target; do not use a cubic-only route in place of the supplied general result.

22. **F22** (P2) Spec of the number-field coefficient ring is not zero-dimensional

   **Location:** packages/HabiroNahmSeries/README.md:1339: “the étale zero-dimensional scheme Spec R”.

   **Claim:** Spec R is zero-dimensional for R=𝒪_K[1/Δ].

   **Witness:** K=ℚ, Δ=6 gives R=ℤ[1/6], with the strict prime chain (0)⊊(5). Its Krull dimension is one.

   **Exact repair text:** “The unconditional type of the preceding export is degree zero for Spec R, which is étale of relative dimension zero over Spec ℤ[1/Δ].” Do not infer absolute dimension zero from étaleness or degree-zero cohomological concentration.

23. **F23** (P3) The Zagier equation locators do not match the legal edition

   **Location:** packages/HabiroNahmSeries/README.md:149, :547, :1377: “(3.3), p. 43”; “(3.7), p. 48”.

   **Claim:** These identify the Nahm equations and saddle constants in the cited Zagier text.

   **Witness:** Zagier line 2216 labels the equations (25); lines 2510, 2526 and 2530 label the asymptotic and its constants (28), (29), (30). None is labelled (3.3) or (3.7).

   **Exact repair text:** “Zagier, The Dilogarithm Function, author-hosted published edition, II.3A, equation (25), p. 43, and II.3B, equations (28)–(30), pp. 47–48.” Use that verified edition in the reference and sources.toml. Describe the cleared-Jacobian formula as the roadmap's derivation from (25), not as a formula printed there.

24. **F24** (P3) The congruence-series citation points to a coefficient ring

   **Location:** packages/HabiroNahmSeries/README.md:802: “Sources: GSWZ (35), p. 13”.

   **Claim:** Equation (35) locates the congruence-series definition used in §5.5.

   **Witness:** GSWZ line 585, equation (35), defines S. The congruence series is equation (32), GSWZ lines 535–540, printed p. 12.

   **Exact repair text:** Replace “GSWZ (35), p. 13” in §5.5 with “GSWZ (32), p. 12”; retain the later level and q-difference locators.

## Verified sound

Read all 1,383 README lines and all 342 Lean lines, plus the repository README and CONTRIBUTING rules. The Lean census is **46 declarations: 14 real-bodied definitions/structures, 11 admitted theorem signatures, and 21 proved examples**. All 25 named declarations appear in the README. There are **38 numbered README target blocks and 209 Check bullets**. The only bold mathematical target labels are the two datum definitions in the conventions; there are no bold theorem-name targets. Both datum definitions and every numbered block are covered below.

The finite computations executed **45 tests: 20 exact rational/quotient-ring computations and 25 numerical controls**. All returned the expected results, including the counterexample values in R04, R05 and R17. Exact tests include the quartic equations, discriminant and inverse, all five norms, trace Gram matrix and its determinant, polynomial discriminant, integral element equation, cubic inverse and cubic-pair square. Numerical controls are the two Gauss families for m=1,…,12 and the Andrews–Gordon tuple at n=7. These do not certify infinite integrality or exact Bloch orders.

All ten cited works were legally accessible through the sources service; both additional linked published versions were fetched too. **38 locator groups** are recorded below, with two groups requiring the corrections R23–R24. **15 named roadmap supplier/consumer contracts** were checked against main/Completed, the supplied sibling heads, and eligible new-roadmap heads; unavailable contracts are findings, not presumed gaps. The other five supplied sibling heads besides QWittVectors were searched for overlap. The open-pull-request inventory checked contained 309 entries. No prior repair report marked a finding settled.

The signs of the unsigned/signed cubic equations, the discriminant determinant, the cleared-Jacobian determinant, the full-column q-difference equation, parity of the formal exponent, the first Wick coefficient, the γ-dependent auxiliary rescaling, and the corrected Gauss companion are consistent with the tested boundary cases. The eleven Lean theorem signatures have no identified mathematical counterexample at their typed generality. Required positivity, symmetry, Jacobian, finite-generation and characteristic-zero assumptions are explicit where used; there is no section-variable disappearance. This is a statement audit, not an elaboration claim.

The package diff contains only its README, Suggested.lean, metadata.toml and review.json. Suggested.lean uses one `import Mathlib`, real-bodied data, `theorem`, and proved examples, with no `set_option`, admitted data or `True` placeholder. No forced heavy headline was found. The missing easy milestone is R16. No package source file was changed during this review.

### Declaration context and boundary ledger

All locations in this table are in packages/HabiroNahmSeries/Suggested.lean. Every implicit parameter or instance shown is in the declaration's own signature; there are no standing `variable` or `include` blocks. “Sound” means the stated mathematical check succeeded, not that Lean was run.

| Line / layer | Declaration | Parameter and instance context | Instances tried; result; change |
| --- | --- | --- | --- |
| 23 / 1 | quadraticExponent | N; rational A,B,C; integer vector n | Rank zero gives C; both Rogers–Ramanujan exponents; sound. |
| 29 / 1 | example, first exponent | n:ℤ | n=0,1,−1 and polynomial expansion; sound. |
| 36 / 1 | example, second exponent | n:ℤ | n=0,1,−1; linear and constant terms retained; sound. |
| 43 / 1 | NahmDatum | N; rational A,B,C; symmetry and real PosDef fields | N=0; A=3/2; singular all-ones matrix rejected; sound. |
| 51 / 1 | example, rational analytic datum | N fixed to 1 | A=3/2 positive, nonintegral; sound. |
| 63 / 1 | FormalNahmDatum | N; integer A and symmetry field | Empty, singular all-ones, nonsymmetric 2×2; sound. |
| 68 / 1 | example, singular formal datum | N fixed to 2 | All-ones symmetric, null vector (1,−1); sound. |
| 72 / 1 | example, nonsymmetric rejection | N fixed to 2 | Entries (0,1) and (1,0) disagree; sound. |
| 79 / 1 | IsDenominator | N,A,B,C rational; d:ℕ | d=0 rejected; rank-zero C=3/2; Q=n²/4; sound; missing mirrors R18. |
| 85 / 1 | IsStrongDenominator | N,A,B,C rational; D:ℕ | D=0 rejected; constants ignored; Q=n²/4 has period 2; sound; R18. |
| 92 / 1 | example, empty denominator | A,B on Fin 0 | 2·(3/2)=3; sound. |
| 98 / 1 | example, empty strong period | A,B on Fin 0 | Difference of constants zero; sound but omits nonempty control, R18. |
| 104 / 1 | isStrongDenominator_two_mul | N,A,hA:IsSymm,B,C,d,hd:IsDenominator | Empty, Q=n²/4, half-linear Q; quadratic finite differences prove 2d-periodicity; sound. |
| 110 / 1 | NahmEq | N; real A,x | Empty; A=1,x=1/2; x=0,1 excluded; sound. |
| 115 / 1 | example, empty equations | A,x on Fin 0 | Unique empty tuple; sound. |
| 119 / 1 | example, boundary rejection | Arbitrary real 1×1 A | x=1 violates strict upper bound regardless of rpow; sound. |
| 125 / 1 | existsUnique_nahmEq | N, real A, hA:PosDef | N=0; A=1,2,3/2; real PosDef includes symmetry; convex potential gives claimed generality. |
| 130 / 1 | SignedNahmEq | N; arbitrary universe R, CommRing; integer A; ε,z units | Zero ring allowed consistently; negative exponents defined on units; F₅ controls; sound. |
| 135 / 1 | example, F₅ root | A=2, ε=1, z=2 with inverse 3 | 1−2=2² mod 5; sound; second signed control missing, R18. |
| 142 / 1 | nahmDiscriminant | N; arbitrary universe K, Field; integer A; arbitrary K coordinates | Empty, z=0 totalization, A=3, F₅ degeneracy; sound as a total function; R18. |
| 149 / 1 | example, empty discriminant | Field K; Fin 0 A,z | Empty product and determinant are 1; sound. |
| 154 / 1 | example, cubic discriminant | Field K; z:K | Characteristic 2,3,5 and z=0; ring identity remains valid; sound. |
| 163 / 1 | nondegenerate_zero_isAlgebraic | N; square rational polynomial system, complex zero, nonzero Jacobian determinant | N=0; P=X−2; repeated root excluded; algebraicity follows from finite coordinate field. |
| 172 / 1 | nondegenerate_coordinateField_finite | Same explicit hypotheses | Empty field is ℚ; invertible derivative kills generating differentials; sound. |
| 183 / 2 | nahmSummand | N; NahmDatum N; τ:ℂ; natural vector n | Empty; n=0; upper-half-plane factors nonzero; τ branch retains C; sound. |
| 190 / 2 | example, empty summand | NahmDatum 0, τ, empty n | Equals exp(2πiτC); sound. |
| 195 / 2 | analyticNahmSum | N,D, arbitrary τ:ℂ | Totalized tsum outside convergence region makes no holomorphy claim there; sound. |
| 199 / 2 | example, empty sum | NahmDatum 0, τ | Singleton index set, not an empty tsum; equals exp(2πiτC); sound. |
| 204 / 2 | nahmSummand_summable | N,D,τ,hτ:0<τ.im | Negative B and C, nonintegral positive A, N=0; Gaussian domination works. |
| 209 / 2 | analyticNahmSum_holomorphic | N,D | Compact subsets of upper half-plane; denominator products bounded away from zero and normal convergence; sound. |
| 217 / 4 | torsion_of_unbounded_divisibility | Arbitrary universe G, AddCommGroup, Module.Finite ℤ G; g; unbounded positive divisors | G=0,ℤ,ℤ/2; nonzero free coordinate obstructs divisibility; ℚ excluded by finiteness; sound. |
| 226 / 5 | formalExponent | N; arbitrary integer A; natural vector n | n=0,1,2; negative A; nonsymmetric numerator can be odd but theorem requires symmetry; sound. |
| 231 / 5 | example, positive exponent | A=3,n=2 | Exponent 9; sound. |
| 235 / 5 | example, negative exponent | A=−1,n=2 | Exponent −3; sound. |
| 239 / 5 | formalNahmSeries | N; integer A; MvPowerSeries over RatFunc ℚ | A=0,1,3,−1; empty; rational denominators nonzero; real body correct. |
| 246 / 5 | example, constant coefficient | Arbitrary N,A | Value 1; alone also passes wrong series 1, R18. |
| 252 / 5 | formalNahmSeries_qDifference | N,A,hA:IsSymm,j:Fin N | A=0,1,3,−1; off-diagonal 2×2; coefficient ratio gives the full column; sound. |
| 261 / 5 | formalExponent_two_mul | N,A,hA,n | Diagonal n(n+1) and paired off-diagonal terms even; negatives and rank zero included. |
| 271 / 6 | regularisationJet | N; Field K, CharZero K; arbitrary covariance matrix and vertex vectors | Empty gives c; C=0 gives c; symmetric interpretation uses Wick; nonsymmetric polynomial still defined. |
| 281 / 6 | example, cubic jet | K=ℚ,N=1,C=T=1 | 1/8+1/12=5/24; sound. |
| 286 / 6 | example, mixed jet | K=ℚ,N=1,C=b=T=1 | 1/2+1/2+1/8+1/12=29/24; sound; further mirrors R18. |
| 293 / 7 | rationalGaussTaylor | m:ℕ | 0→2,1→1,2→0,3→1,4→2; zero excluded from root theorem; sound. |
| 297 / 7 | example, even orders | m=2,4 | Different even components; sound. |
| 301 / 7 | example, odd orders | m=1,3 | Both 1; sound. |
| 306 / 7 | rationalGaussTaylor_eq_gaussSum | m, hm:0<m; standard complex exponential | m=1,…,12; conjugate product and division by m correct. |
| 314 / 7 | rationalGaussTaylor_mul_odd | m,p:ℕ, hm:0<m, hp:Odd p | p=1,3,9; m=1,2,4; primality unnecessary; sound. |

### README adversarial ledger

This table groups the definitions, identities and API laws within each numbered target block. Every block and all its Checks were read; the tests below identify the discriminating instances used. “No new counterexample” does not certify the missing supplier contracts or replace the proof obligations listed under Not verifiable.

| Statement / location in packages/HabiroNahmSeries/README.md | Instances tried | Result / required change |
| --- | --- | --- |
| Conventions: analytic/formal data, q powers, radial/formal variables, integral Bloch conventions, full determinant algebra | Rank 0; A=3/2; singular A; C=1/2; q=ζexp(−ε/m); split T²−1 | Distinctions are mathematically consistent; no blanket positivity or chosen-component substitution. |
| §1.1: data operations; quadraticExponent; denominator and strong-period definitions, existence/multiples and two-multiple theorem | N=0; d,D=0; Q=n²/4,n/2,n²; A=3/2; nonsymmetric 2×2 | Definitions and period theorem sound; missing statable examples R18. |
| §1.2: NahmEq, signed equations, maps, discriminant, nondegenerate coordinate algebra, existence/uniqueness | A=1,2,3; zero ring; F₅; z=0,1; t=4/27,z=3/2; empty system | Real positive theorem and determinant signs sound; field discriminants −31/−23 distinct; R18. |
| §1.3: clearingPolynomial, clearedJacobian, coordinateField_differential_bridge, algebraicity, positiveRootLift and generated fields | Negative exponent −1; d=0,1,2,4; empty field; inseparable/repeated roots violate Jacobian hypothesis | Denominator clearing and unit factors give invertible Jacobian at positive solution; field bridge applies in arbitrary characteristic with its hypotheses. Locator R23. |
| §1.4: rational/integral classes, doubled signed class, convention transport, nahmIntegralModel | A=2; A=1/2 with y²=x; signed A=3; even diagonal; nonunit δ | Boundary is zero or killed by 2 as stated; no integral K₃ lift follows automatically. Supplier R12; model Checks R19. |
| §1.5: embedding regulator, torsion/zero iff all regulators vanish, algebraic-closure restriction, Rogers values | Empty; golden ratio; unsigned cubic real and conjugate embeddings; rational versus integral class | All-embedding quantifier and rational restriction are necessary and retained; algebraic comparison unowned, R11–R12; false strict-extension example R09. |
| §2.1: Pochhammer analytic comparison, summand/sum, summability, holomorphy, constant shift and block product | w=0,1; n=0,2; C=1/2 and τ↦τ+1; empty rank; singular A excluded | Nonvanishing condition and convergence scope sound; finite/formal owner R13; branch example R18. |
| §2.2: shifted Euler–Maclaurin, pochhammerRadialPsi, uniform remainder, Dedekind phase and Euler factor | f=1,s; M=0,1; θ=0,1; w=0; large negative shift; m=1; a/m=1/3,2/5 | Endpoint Bernoulli signs and phase witnesses correct; shifted zero-free guard retained; eta supplier R13. |
| §2.3: saddle expansion, finite Euler modulus and global tails | Rank one; B sign; A=2 first coefficient −1/60; m=3 complex denominators; canceled leading factor | Gaussian factor 1/2 and Euler correction consistent; additive tails do not divide by a vanishing constant. Uniform analytic proof not independently reconstructed. |
| §2.4: formalGaussian, analytic comparison and shifted lattice estimate | Polynomial 1,v,v²,v⁴; mixed v₁v₂ and v₁²v₂²; N=0; spacing mD√ε; unfiltered series rejected | Wick covariance M⁻¹ and lattice factor m^(−N/2) consistent; supplied Poisson/Gaussian owners checked. |
| §2.5: Gauss phase/refinement, congruence remainder and radial theorem | D=1; Q=n²/2 at m=3,D=2,4; C≠0; rank zero; order-one A=2 | Vanishing Gauss factor treated additively; refinement and C-factor correct. |
| §2.6: radialBaseField/radialKummerField, automorphism identity, Chern/eigenspace comparison, unitSeries_descent | d=m=1; d=2,m=3,x=1/4; A=1,B=1/4 or 1/2; Φ=0,ε; incompatible roots | Coherent roots and nonzero-constant guard correct; arithmetic identities remain substantive proof obligations; missing easy Lean milestone R16; owners R11–R13. |
| §2.7: Andrews–Gordon matrix, critical tuple, Λ, phase and cyclic acceptance | r=0,1,2; n=3,5,7 | Empty case Λ=0; tuple ordering at 7 satisfies both equations; cyclic class retains the source's projective symbols. Suppliers R11–R13. |
| §3.1: normalized cusp order, leading coefficient and width changes | f=0,1,j; periods w,rw; Γ(3); cusp 2/5 | k/w invariant under period enlargement; central sign accounted for; no new counterexample. |
| §3.2: uniform Laurent remainder, inverse chart, radial growth inequality | σ=S; σ=((2,1),(5,3)); q,q⁻¹; leading cancellation | Phase −3v/5, denominator 25y and sign of pole growth correct. Meromorphic/periodic hypothesis retained. |
| §4.1: residueMajorant, finite split and Euler lower bound | m=1,2; A=2,B=1,C=11/60; rank zero C=7,t=log2; n=1 | Shifted B=1/2,3/2 and exponents 11/60,131/60 correct; no imposed good-order restriction. General lower-bound estimate not independently reproved. |
| §4.2: cusp-order bounds, minimum exponent, zero weight and exponentially small remainder | A=2,B=−3,C=5; empty rank; Rogers–Ramanujan C=−1/60 | Double leading coefficient 2q³ and −1/60 cancellation correct; no erroneous equality iff B=0. |
| §4.3: fixed radical field, Chern lift, modular bounded power and unbounded good orders | n=1; rational A,B; unipotent product with d=1+L²k; phase at first Rogers–Ramanujan datum | Fixed field and excluded primes do not vary with d; inverse-transformation phase consistent; supplier and arithmetic bridges R11–R13. |
| §4.4: unbounded divisibility and modularity implies distinguished Bloch torsion | ℤ,ℤ/2,ℚ; fixed versus unbounded n; rationalized versus integral restriction | Elementary lemma true with finite generation; rational quotient modulo n correctly avoided. Endpoint depends on unowned inputs R12. |
| §5.1: mvLog/Exp, plethysticCoefficients, IsAdmissible, rootExpansion, V/δ/U and recognition | Euler/reciprocal series; wrong sign; exp(−t/(1−q)²); roots ±1; m=2; empty and mixed variables | Constant-one restrictions, Laurent poles and corrected U₂=(1+t)^(−1/2) consistent. Formal toolkit owner R13. |
| §5.2: formalExponent, F_A, q-system, block/permutation/q-inversion, deformed z and δ | A=0,1,3,−1; off-diagonal matrix; nonsymmetric matrix; N=0 | Parity, full-column shift, F_A(q)=F_(I−A)(q⁻¹), negative exponents and signed deformation consistent; R18. |
| §5.3: shiftRatio, orbitRatio, all-root residues, residuePotential and logarithmic Hessian | A=0,1,3,−1; m=2; mixed coefficient for ((2,1),(1,1)) | Inverse logarithmic Hessian has the stated sign; ordinary Hessian is not substituted; boundary coefficients consistent. |
| §5.4: finite Laurent support and admissible Dwork logarithm | A=0,1,3; mixed coefficient −q³; wrong-sign rational L₂; root order one | Simple polar term retained; finite support not confused with infinite Euler products; all-order proof remains an obligation. |
| §5.5: normalized congruence series, order-m system, restricted Adams coefficients and enlarged level ring | m=1,2,3; k=0,1; A=0,1; mixed monomial; Φ₄ denominator | Normalization, sign and allowed Φ₄ pole consistent; local source locator R24; general cancellation not independently proved. |
| §5.6: weighted Wick domain, Fubini, regularized ψ, Gaussian normalization, mixed regularity and identification | Empty; odd vertices; linear/cubic contraction; invertible matrix with singular block; h versus x | Fubini requires extra block hypotheses R06. Regularity and normalization are stated as targets rather than inferred from uniqueness. |
| §5.7: S_A, level algebras, étaleness, WKB series, quotient recursions and polynomiality | Rank zero S=ℤ[T]/(T²−1); p=2; A=0,1,3,−1; signed versus unsigned deformation | Missing inversion in étale assertion R08; WKB variable change and initial coefficients consistent. |
| §6.1: completed Frobenius, pSaturatedMap, transfer, coefficient localization and full Frobenius defect | p=2,3,5; product rings; one-branch projection; p-regular versus p-torsion target | Saturation/regularity guards retained; supplier R14; explicit dependency cycle R01; full transfer not implied by branch injectivity. |
| §6.2: regularisationJet and refined linear-coefficient integrality | Zero covariance; empty; pure cubic/quartic/linear; mixed bT; p=m=5 | Polynomial jet correct; finite-étale and unit claims need p∤m, R07; mirrors R18. |
| §6.3: modified potential W_p, convergence, regulator specialization and refined constant congruence | η=0; Iwasawa log(−1)=0; finite étale products; p=2,3 excluded by explicit p>3 | Positive D_p and linear ℓ₁ signs consistent; circular Needs R01; regulator lattice unowned R12. |
| §6.4: Kummer orientation, specialization, coefficient/module extension and membership | Rank zero; split B; z=0 or δ=0; rotated Kummer root; vanishing sum of constants | Preserves full algebra and distinguishes generator from module element. Finite étale module extension/effective descent unowned R12. |
| §6.5: auxiliary Ψ/P, two q-systems, uniqueness and unpowered-product gluing | γ=1,2,5; q=2; signed shifts; q=(2,1) in product ring; A=0 | 16t⁴ versus 16t² and regularity condition correct; inverted γ necessary; all-order gluing still a separate target. |
| §6.6: descendantPullback/transports, torsion powers and converse | ν=0,−1; m=2,ν=1; zero series; rational torsion without integral lift | Curve t=q^(mν) and varying prefactors retained; converse uses nonzero constants. No unrestricted theorem inferred from finite-order data. |
| §7.1: J kernel, residue family/descendants, product and constant formula | A=0,N=m=1; A=0,m=2; rank zero; A=3 selected versus all roots | False normalization R04, finite sum R05 and coefficient localization R17. |
| §7.2: cubic arithmetic, Riccati/divisibility, DT support/positivity, q-binomial formula and small-prime descent | n=1,2,3; m=1,2; δ inverse; primes 2,3,23 | Cubic inverse and corrected m=2 expression consistent; general product theorem missing R21; all-order small-prime inputs not verified. |
| §7.3: two quartic factors, coordinates, integral basis, norms, analytic normalization, torsion/rank certificates | Positive real factor; quartic quotient; five coordinate/discriminant norms; integral e; degree-zero scalar shift | Exact equations, norm values, trace matrix and discriminant computations passed; index maximality and torsion/rank certificates not inferred from them. Arithmetic supplier R12. |
| §7.4: knot matrices/dictionary, figure-eight and selected cubic pair | Singular figure-eight; δ at ζ₆; h↦log q; two cubic square roots; separate pretzel component | Scalar square correction and first symmetrized coefficient consistent; topological invariance not claimed from matrix algebra. High-order coefficients not certified. |
| §7.5: Frobenius presentation, rational/companion Gauss Taylor families, modular residue family | Bad power-basis index; m=0,…,12; p=2 and odd p; m=5 Rogers–Ramanujan component | Gauss signs and exclusion of m=0 correct; algorithm policy R20; pin availability R10; modular supplier R13. |
| §7.6: degree-zero export, completed diagram and coefficient line/Picard map | R=ℤ[1/6]; nonrational coefficients with arithmetic Frobenius; completed free line versus global line | ℤ[q]-algebra scope and extra global-module hypotheses retained; comparison/effective descent suppliers unowned R12. |
| §7.7: higherHabiroComparison, affine push-forward and geometric interface | Spec ℤ[1/6]; n=0 versus N>0; positive radius versus whole disc; no geometric input | Absolute dimension claim false R22; source's affine/degree/hypothesis distinctions otherwise retained; higher comparison unowned R12. |

### Locator verification ledger

Source identifiers below designate the legal source-service extractions, not repository files. GSWZ is arXiv:2412.04241v2; CGZ is arXiv:1712.04887v3; GZ is arXiv:1812.07690v1; VZ is arXiv:1104.4008v1; GSW is arXiv:2305.14884v2; GW is arXiv:2505.19885v1; Aarhus is arXiv:math/9801049v4. Zagier is the author-hosted published text. Wagner is the cited author-hosted thesis. Stacks is tag 00UO. The two “published” identifiers are the additional linked legal editions. A matching locator does not validate a source misprint or a stronger target.

| # | Locator group checked | Extraction anchor and result |
| --- | --- | --- |
| 1 | CGZ Definition 2.1 and Lemma 2.2 | CGZ line 380 and line 389; integral boundary/convention passage located. |
| 2 | CGZ Theorem 7.1, (43)–(44) | CGZ line 1716 and line 1724; field and normalization claims compared with the roadmap's explicit corrections. |
| 3 | CGZ Corollary 7.2 and Remark 7.3 | CGZ line 1726 and line 1735; nonzero constant is explicit; supports R16. |
| 4 | CGZ Theorem 7.4, (45)–(52) | CGZ line 1742; rank-zero n=3 included, and source's reversed tuple at line 1764 was checked against n=7. |
| 5 | CGZ Theorem 7.5 and remarks | CGZ-published line 2185; finite-index invariance and distinguished class, not every solution. |
| 6 | CGZ published pagination | CGZ-published line 1886 and line 2134; Theorem 7.1 at p.419, Theorem 7.5 at pp.422–423. Equation numbers differ from the cited preprint, whose version is explicit. |
| 7 | GZ Lemma 2.1, (4)–(5) | GZ line 125; shift, cyclic logarithm and Bernoulli terms checked. |
| 8 | GZ Theorem 3.1, (18)–(21) | GZ line 282 and line 317; odd-order hypotheses and coherent coefficient field read. |
| 9 | GZ (24)–(25) | GZ-published line 465 and line 470; congruence splitting and summand located with unchanged numbering. |
| 10 | GZ Proposition 7.1, (50)–(54) | GZ-published line 784; width-normalized valuation compared; package avoids division by zero leading constant. |
| 11 | VZ Lemma 2.1 | VZ line 54; positive solution through strictly convex potential. |
| 12 | VZ Lemma 2.2 and Theorem 2.3 | VZ line 106 and line 244; estimate, expansion, covariance and Euler correction compared. |
| 13 | Zagier II.1A, pp.23–24 | Zagier line 1023 and line 1064; increasing Rogers convention and special values verified. |
| 14 | Zagier II.3A–B equation locators | Zagier line 2216, line 2510 and line 2526; cited (3.3)/(3.7) fail, R23. |
| 15 | GSWZ (31)–(37) | GSWZ line 535 and line 569; formal series, q-system, field algebra and discriminant located; §5.5's (35) is wrong, R24. |
| 16 | GSWZ Theorems 3–5, (38)–(42) | GSWZ line 600, line 602 and line 640; all-component/formal comparison, Frobenius and membership scopes compared. |
| 17 | GSWZ Lemma 2.3, (65)–(73), Corollary 2.4 | GSWZ line 953 and line 1009; the sign in U was checked against the elementary Euler series. |
| 18 | GSWZ Theorem 6, (81)–(89) | GSWZ line 1105; symmetric integral A, finite support, and cyclotomic cancellation route located. |
| 19 | GSWZ Theorem 7 and level formulas | GSWZ line 1264; printed smaller ring distinguished from the roadmap's enlarged ring and explicit extra proof target. |
| 20 | GSWZ Gaussian formulas (110)–(120) | GSWZ line 1480, line 1487 and line 1556; normalization/remainder/discriminant compared; source formulas are not accepted without the package's corrections. |
| 21 | GSWZ (129)–(136) | GSWZ line 1624; potential and constant congruence passage read; dependency cycle is local R01. |
| 22 | GSWZ Lemma 2.16 and Corollary 2.17 | GSWZ line 1766 and line 1817; b₁, higher b_k and c_k polynomiality and initial conditions read. |
| 23 | GSWZ Theorem 8, (163)–(169) | GSWZ line 1835 and line 1888; q-system, regularity assertion and mistaken ordinary Hessian compared. |
| 24 | GSWZ Theorem 9, (174)–(183) | GSWZ line 2013 and line 2015; unramified factors and p>3 assumptions explicit; supplier absent R12. |
| 25 | GSWZ local generator criterion, (184)–(195) | GSWZ line 2034; both Dwork defect and first linear coefficient required. |
| 26 | GSWZ Theorems 11–12, (215)–(231) | GSWZ line 2318, line 2329, line 2335 and line 2376; copied formula defects R04, R05 and R17. |
| 27 | GSWZ cubic, (234)–(249) | GSWZ line 2443 and line 2507; cubic recurrence, product support and δ-powers located. |
| 28 | GSWZ quartic, (256)–(263) | GSWZ line 2589 and line 2631; both factors and coefficient formulas located; finite experiments distinguished from torsion/gluing proof. |
| 29 | GSWZ figure-eight, (276)–(278) | GSWZ line 2719 and line 2739; h/x distinction and Pochhammer normalization located. |
| 30 | GSWZ cubic pair, (279)–(288) | GSWZ line 2769 and line 2780; erroneous simplified square-root product rejected by exact quotient-ring calculation. |
| 31 | GSWZ Gauss examples, (289)–(290) | GSWZ line 2836 and line 2848; norm formula checked, companion sign at 4 corrected in package. |
| 32 | GSWZ Rogers–Ramanujan residues, (291)–(295) | GSWZ line 2865 and line 2914; constancy, embedding dependence and polynomial identity located. |
| 33 | GSW Lemmas 3.1–3.2, (22)–(25) | GSW line 456 and line 484; change of variables, Wick and block inversion read; R06. |
| 34 | Aarhus II Proposition 2.13 | Aarhus line 457; integration-block invertibility explicit; R06. |
| 35 | GW Proposition 1.14 / Theorem 1.13, (47), (173), (182) | GW line 539 and line 1602; arbitrary symmetric integral matrix, generalized q-binomial and cubic numerator checked; R21. |
| 36 | GW Definition 1.2 and Theorem 1.18, (50)–(53) | GW line 203 and line 579; whole-disc H(V) condition distinguished from positive-radius affine push-forward; no automatic derived comparison supplied. |
| 37 | Wagner Corollaries 2.13 and 3.13 | Wagner line 1490 and line 1826; printed pp.33,41 and étale hypotheses correct. |
| 38 | Stacks Lemma 10.148.3, tag 00UO | Stacks line 18677; Ω=0/formally-unramified equivalence, not by itself the finiteness theorem. |

### Supplier and pinned-library verification

| Contract named in package | Check / disposition |
| --- | --- |
| K3BlochGroups | No eligible current folder/section; R12. ColemanIntegration §L2.Fb supplies the existing antisymmetric presentation, which must be imported. |
| Polylogarithms | Actual earlier name is PolylogarithmFunctions; its §§1,3,5,6 checked. Its exclusions at README:19 and :822 prevent using it for the algebraic/projective extension; R11. |
| BorelRegulators | No eligible current folder/section; R12. |
| HabiroNumberFields | No eligible current folder/section; R12 and R15. HabiroCyclotomicCompletions README:32–38 expressly distinguishes its ordinary completion from this arithmetic ring. |
| HabiroRings | No eligible current folder/section; R12. Completed Frobenius belongs to QWittVectors §6.1, R14. |
| PadicHodgeRegulators | No eligible current folder/section; R12. KTheoryFiniteLocalFields README:9 and :1607 explicitly leaves regulator construction outside its scope. |
| ArithmeticKTheory | No eligible current N.6; R12. GeneralAlgebraicKTheory and KTheoryFiniteLocalFields supply earlier K-theory infrastructure, not the promised global tame-kernel certificate. |
| HabiroCohomologyFoundations | No eligible current Layers 5–9; R12. Wagner's theorem is a mathematical source, not a supplied roadmap carrier. |
| QSeriesPartitionsAndMockModularForms | No eligible QM.0/QM.1; R13. Earlier HabiroCyclotomicCompletions §1.1 already owns the finite/formal Pochhammer, Euler and q-binomial toolkit. |
| ColemanIntegration | Current §L2.Fb, §L2.13 and §L2.18 checked for group conventions, integral modified functions and reflection; these do not supply the entire K₃ regulator lattice. |
| ThetaSeries | Main Layer 1, README:423–468, supplies lattice Schwartz Poisson and Gaussian transform; contract fits the application. R02 removes process identifier. |
| FuchsianOrbifolds | Main Layers 3–5, especially README:263–282, supply cusp charts and finite-principal-part criterion; scalar estimates add no second modular curve. |
| StandardDistributions | Main Layer 1 moments and Layer 5 covariance/affine framework checked, including README:547–575; correct covariance/positivity usage. |
| ModularForms | Existing general modular-form geometry is mentioned only as ownership; the package does not create a replacement modular curve. |
| ArithmeticQuantumTopology | Mentioned for downstream topological interpretation. No matrix calculation here is treated as proof of presentation independence; its future interpretation is not a supplier proof of scalar membership. |

Other supplied sibling heads—K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, ColemanIntegrationPartII, ErdosProgressionPowers and ArithmeticDynamics—did not supply the missing arithmetic Habiro or Bloch contracts. QWittVectors was read from its supplied local head, specifically README:756–782; no web version was substituted for that sibling.

Pinned Mathlib commit: `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Pinned Tau Ceti commit: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches were followed by reading the files at these commits. Relevant positive checks:

| Pinned file | Declaration / hypothesis verified |
| --- | --- |
| Mathlib/LinearAlgebra/Matrix/PosDef.lean | Matrix.PosDef, real symmetric/Hermitian condition and quadratic-form characterization. |
| Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean:662 | IntermediateField.fg_adjoin_of_finite. |
| Mathlib/FieldTheory/IntermediateField/Adjoin/Algebra.lean:118 | IntermediateField.essFiniteType_iff. |
| Mathlib/RingTheory/Kaehler/Basic.lean:251 | KaehlerDifferential.span_range_derivation. |
| Mathlib/RingTheory/Unramified/Finite.lean:158 | Algebra.FormallyUnramified.finite_of_free, with essential finite type and formal unramifiedness in scope. |
| Mathlib/RingTheory/PowerSeries/Basic.lean:466 | PowerSeries.map and its constant-coefficient interface; carriers needed for R16 exist. |
| Mathlib/RingTheory/MvPowerSeries/Substitution.lean:633 | MvPowerSeries.rescale acts by multiplying the coefficient of X^n by the corresponding scaling monomial. |
| Mathlib/NumberTheory/ModularForms/DedekindEta.lean:56 | eta, multipliableLocallyUniformlyOn_eta (:102), eta_ne_zero (:113). |
| Mathlib/NumberTheory/ModularForms/ArithmeticSubgroups.lean:108 | Subgroup.isArithmetic_iff_finiteIndex for subgroups of SL₂(ℤ), without congruence assumption. |
| Mathlib/NumberTheory/ModularForms/Cusps.lean:115 | isCusp_SL2Z_iff and strictWidthInfty (:317); strict/projective distinction retained. |
| Mathlib/RingTheory/Henselian.lean:96 | HenselianRing.is_henselian; IsAdicComplete.henselianRing (:170), including the ideal and monicity/unit hypotheses. |
| TauCeti/Probability/Distributions/Gaussian/Density.lean:171 | multivariateGaussian_eq_withDensity requires positive definite covariance. |
| TauCeti/Probability/Distributions/Gaussian/PolynomialMemLp.lean:81 | integrable_pow_gaussianReal and integrable_eval_mul_gaussianEnvelope (:100), the latter with nonzero variance. |
| TauCeti/NumberTheory/ModularForms/Norm/Cusps.lean:148 | cuspTranslationOrbitWidth and representative formula (:162); strict orbit period. |
| TauCeti/LinearAlgebra/FiniteBilinearModule/GaussSum.lean | gaussSum, nondegenerate norm-square and quadratic-radical quotient formulas; R10. |

### Mechanical dependency result

The required read-only dependency command returned exit status 1 and exactly:

```text
NOT IN ORDER: HabiroNahmSeries (insert it after its last supplier)
depcheck: 7 roadmaps, 43 edges, 1 problem(s)
```

There is no UPWARD or CYCLE output line. Absence from ORDER.txt is not raised as a finding. This output does not validate the nonexistent contracts: the tool recognized only seven roadmaps. The explicit internal and reverse-supply cycles are witnessed independently in R01 and R15. Repair by importing the earlier owners identified above and moving any genuinely missing foundation to an eligible earlier owner or a named local target; do not add a later supplier.

## Not verifiable

- Lean elaboration and proof execution were not run, as the read-only brief forbids Lean builds. The 21 examples were read and their mathematics checked; successful elaboration is not asserted.
- The all-coefficient arithmetic radial descent, finite-Chern comparison and inverse-cyclotomic transformation in §2.6 were not proved independently. Their source statements contain normalization/general-field subtleties; explicit targets do not supply the unavailable arithmetic contracts in R11–R13.
- The general uniform saddle/tail estimates, all-rank finite-support induction, corrected level-admissibility cancellation, Gaussian mixed regularity, full-algebra p-saturation, and all-order product gluing were checked for stated dependencies and boundary failures, not reconstructed as complete new proofs. In particular no branch calculation certifies full-algebra p-integrality.
- The p=2,3 all-order improvements, unrestricted torsion powers, finite étale effective module descent and completion-triviality have no certified proofs in this package. The report does not infer them from a conditional endpoint or from small-order checks.
- Exact quartic Bloch order, maximality of the displayed integral basis, Galois-group certificates, eight-descendant rank, tame-kernel order, and degree-27/degree-400 coefficient claims were not certified in full. The exact polynomial/norm/trace computations above verify only their stated finite subclaims. The source itself presents some high-order data as computations.
- The complete general correction to the residue normalization and finite sum remains to be derived. R04, R05 and R17 give exact low-rank counterexamples; they do not pretend that inserting one scalar repairs every shifted residue theorem.
- No legal reference is currently missing: all ten works and the two linked published editions were obtained. The original Durham Zagier URL timed out; the author-hosted published edition supplied the text and revealed R23. No inaccessible-source waiver or paywall assumption was used.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "0c13697aff59a5a14fe29640292d99d705ec12f8", "job": "RT-HabiroNahmSeries~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
