<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/156#issuecomment-6357465309 -->
Red team round 2 pass a (codex) of 7579926

Verdict: needs_changes

1. **F01** (P3) The zero-evaluator theorem is padding

   **Location:** `packages/HabiroRings/Suggested.lean:235`, “theorem zeroEvaluation”.

   **Claim:** This boundary Check belongs in the acceptance test.

   **Witness:** Its entire proof at line 236 is `simp`; it computes that the zero map cannot take an integer tensor to 1. README line 1171 already contains exactly this Check.

   **Exact repair text:** Delete `OrderOneFibre.zeroEvaluation` from `Suggested.lean`; retain the mathematical negative-control Check in README §6.4 as prose. The evaluated values remain 0≠1 over ℤ.

2. **F02** (P3) Two definitions serve only example catalogues

   **Location:** `packages/HabiroRings/Suggested.lean:48` and `:226`, “noncomputable def reduceMap” and “noncomputable def trivialization”.

   **Claim:** These are simple definitions needed to state the headline theorems.

   **Witness:** No admitted theorem mentions either definition. Their only applications are the examples at lines 59, 69–70, 240 and 246. `completedRegulatorTriviality` assumes its actual quotient equivalence directly.

   **Exact repair text:** Delete `EtaleDeformation.reduceMap`, `OrderOneFibre.trivialization`, and their four examples from `Suggested.lean`; retain their definitions and normalization Checks as prose in README §§0.1 and 6.4. Keep the independent headline theorems. Testing the deleted definitions gives ε·id·ε⁻¹=id, swap(1,0)=(0,1), and evaluator values 3 and −3; none is needed to type the completed-line theorem.

3. **F03** (P3) Repaired supplier API names have drifted again

   **Location:** `packages/HabiroRings/README.md:93`, “ArithmeticLambdaRing.perfection”, “LambdaPerfection.lift”; also lines 95–99, 59 and 651.

   **Claim:** The current suppliers export these exact named interfaces, including `QWitt.completedEtaleFrobenius` and `gaussianRectangle_product`.

   **Witness:** `TauCetiRoadmap/QWittVectors/README.md:357,381,789` states the corresponding mathematics without those names; its whole README and Suggested.lean contain none of them. `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md:404` supplies the integral identity without the claimed name.

   **Exact repair text:** Replace the invented exported identifiers by section-and-statement citations: “QWittVectors §2.3, arithmetic perfection and its universal property; §2.4, the three equivalent perfect-coverage conditions; §§4.3–4.6, relative q-Witt rings, ghosts and base change; §§5.1–5.3, étale preservation, ghost pushouts and completion; §§6.1–6.3, completed coefficient Frobenius and q-fixed cyclotomic overlaps.” Replace `gaussianRectangle_product` by “QSeriesPartitionsAndMockModularForms §3.1, the integral Gaussian product identity”, and the unexported Gaussian polynomial names by ArithmeticStatisticsPartIV §3.2's stated polynomial/product laws. Apply this throughout README and comments. The supplied formulas still give P₂=P₁²(1+q), and φ₃(i)=−i; no new mathematical gap is needed.

4. **F04** (P3) The discriminant-multiple statement duplicates the radical criterion

   **Location:** `packages/HabiroRings/Suggested.lean:198`, “theorem etale_localization_away_discr”.

   **Claim:** Both étale-localization declarations are independent acceptance milestones.

   **Witness:** From the theorem at line 206, the first follows by one application with `fun p _ hp => hp.trans hd`. The carriers, instances and conclusion are identical.

   **Exact repair text:** Delete `etale_localization_away_discr` from `Suggested.lean`, retaining the more general `etale_localization_away_of_prime_dvd`; keep the multiple-of-discriminant consequence in README §5.8 as prose. At F=ℚ(i), Δ=4 both hypotheses imply inversion of 2; at Δ=2 the retained criterion also applies, while −4∤2.

5. **F05** (P2) Statable localization and profile milestones are omitted

   **Location:** `packages/HabiroRings/README.md:423`, “There is a length-one free resolution”; line 660, “there are f,g:N→N tending to infinity”.

   **Claim:** These owned proof milestones may remain outside the acceptance test because the spectral and solid carriers are unavailable.

   **Witness:** Both are ordinary algebra/combinatorics. Mathlib supplies `Localization`, `Finsupp.linearCombination` (`Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean:52`), and exactness. The profile statement uses only functions on ℕ and inequalities; Q line 3713 supplies it independently of any solid category.

   **Exact repair text:** State the two milestones with `sorry`. For §2.2 use B=LaurentPolynomial ℤ, S the multiplicative closure of the positive factors 1−qⁱ, and T=Localization S; define d(eᵢ)=eᵢ−(1−qⁱ⁺¹)eᵢ₊₁ and ε(eᵢ)=1/Pᵢ with real bodies, and assert d injective, range(d)=ker(ε), and ε surjective. For §2.11 state: if h:ℕ×ℕ→ℕ satisfies ∀k ∃B ∀m n, B≤m+n → k≤h(m,n), then there exist f,g:ℕ→ℕ, both tending to infinity, such that ∀m n, f(m)+g(n)≤h(m,n). No spectral carrier or supplier assumption belongs in this latter signature. Keep the full comparisons as unavailable-carrier headlines in the module docstring. Tests: ε(d(e₀))=1−(1−q)/P₁=0; ε(d(e₁))=1/P₁−(1−q²)/P₂=0. For h(m,n)=m+n take f(m)=m,g(n)=n; for h=max(m,n) take f(m)=m/2,g(n)=n/2, giving f+g≤max; h=0 fails properness.

6. **F06** (P2) Line targets impose stronger discriminant multiplicities than their supplier

   **Location:** `packages/HabiroRings/README.md:1107`, “positive Δ divisible by 6·|disc(F)|”; also lines 1117 and 1209.

   **Claim:** The global line and supported field comparisons require divisibility by the product, although the gap contracts and the exported scalar statement require divisibility by 6 and the discriminants separately.

   **Witness:** F=ℚ(i), Δ=12: 6∣12 and −4∣12, but 24∤12. The coefficient ring is still ℤ[i][1/6]. G line 255 and line 426 impose prime exclusions, not these extra multiplicities.

   **Exact repair text:** “Choose positive Δ divisible by 6 and disc(F)” in §6.2 and its API; “choose one positive Δ divisible by 6, disc(F) and disc(E)” in §6.7. Keep 6·|disc(F)| as an example choice only. This admits Δ=12 for ℚ(i), agrees with the registered gaps, and preserves all localized rings and excluded primes.

7. **F07** (P2) The localization example has rank one, not infinite rank

   **Location:** `packages/HabiroRings/Suggested.lean:57`, “infinite-rank carrier ℤ[1/2]”.

   **Claim:** Failure of finite generation here is failure of finite rank.

   **Witness:** ℚ⊗_ℤℤ[1/2]≃ℚ, so the ℤ-module rank is 1. The elements 2⁻ⁿ require unbounded denominators, which obstruct finite generation, not finite rank.

   **Exact repair text:** If this explanation is retained in the README, write “the carrier ℤ[1/2] is not finitely generated as a ℤ-module, although it has rank one.” Delete the associated Lean example under S02. The rationalized dimension is then correctly 1.

8. **F08** (P3) The Lean file still carries an undeclared API catalogue

   **Location:** `packages/HabiroRings/Suggested.lean:4`, “representative target signatures”; lines 273–306; README line 45, “Declaration names specify the intended API”.

   **Claim:** A representative catalogue of intended identifiers can replace the required headline acceptance test and its missing-carrier inventory.

   **Witness:** The module says “not exhaustive”. `FiniteMonoidalDescent.Datum`, `relativeHabiro`, `completedScalarExtension` and `transportedRegulator` are only comments; README backticks many additional undeclared local names. The module docstring does not individually account for the Taylor equalizer or transported-line conclusions.

   **Exact repair text:** Use the title “HabiroRings: target signatures” and say: “README.md is the roadmap. This file states its headline theorems against the pinned APIs. The relative-ring, Taylor-equalizer, GSWZ-ring, completed-scalar-extension and transported-line theorems require the missing relative Habiro and indexed-line carriers. The general finite-descent and principal enhanced-universality theorems require enhanced algebra categories and mapping spaces; the spherical and solid comparisons require their respective spectral carriers.” Add the ordinary milestones of S05. Delete the catalogue comments; render undeclared local API and Check labels in README as prose, reserving declared Lean names for actual declarations. This leaves the finite-index theorem on actual finsets, and the completed-line theorem on actual invertible modules.

9. **F09** (P3) Degenerate finite-index computations are acceptance-test padding

   **Location:** `packages/HabiroRings/Suggested.lean:148`, `:152` and `:169`, “primeChain 0 1 2 = {1}”, “vertices 0 = ∅”.

   **Claim:** Boundary computations are acceptance milestones.

   **Witness:** These examples are `native_decide` computations of a small README value and junk values. They prove no part of the positive-order height theorem beyond evaluating the definitions on finitely many inputs.

   **Exact repair text:** Delete these three examples from `Suggested.lean`. Retain their computations in README: primeChain(4,1,2)={1,2,4}, primeChain(1,3,2)={3}, primeChain(0,1,2)={1}, primeChain(4,0,2)={0}, primeChain(4,3,0)={3}, vertices(1)={{1}}, vertices(0)=∅. The remaining example at line 177 tests maximality, inclusion-order orientation and mixed-prime chains together.

10. **F10** (P3) The obstruction's Needs line points to itself

   **Location:** `packages/HabiroRings/README.md:1283`, “*Needs:* [§7.4](#74-the-finite-stage-obstruction)”.

   **Claim:** One dependency list serves both the general obstruction and its cubic corollary.

   **Witness:** Section 7.4 points to §7.4. Its first theorem needs the q-Witt Frobenius pushout and completed Frobenius, whereas the later corollary consumes that theorem. W lines 1739–1780 distinguish these two steps.

   **Exact repair text:** Give the general obstruction its own Needs line: “QWittVectors §§5.1–5.2 and 6.1; the injectivity R→R̂_p in the statement.” Label the following assertion “Cubic finite-stage corollary”, with Needs “the preceding obstruction; §§5.1, 5.8 and 7.3; HabiroCohomologyFoundations §0.3”. Remove the self-link. The general statement gives identity Frobenius on ℤ; its corollary excludes the cubic example at p=5 without circular dependency.

11. **F11** (P2) The radical formula needs an ambient-ring qualification

   **Location:** `packages/HabiroRings/README.md:704`, “its radical is (p,Φ_d(q))”.

   **Claim:** This unqualified formula supplies cyclotomic supports for the arbitrary coefficient rings used by descent.

   **Witness:** In A=𝔽₂[ε]/(ε²), m=2 and S={1,2}, I_S=(q−1), but √I_S=(ε,q−1)≠(2,Φ₁)=(q−1). QWittVectors §6.2 correctly uses equality of radicals over arbitrary A.

   **Exact repair text:** “In ℤ[q], the radical of I_S for such a chain is (p,Φ_d). After extension to an arbitrary commutative A, the formula is √(I_S A[q])=√((p,Φ_d)A[q]); consequently the completion categories agree.” Add the square-zero example as a Check. Both sides of the repaired arbitrary-base formula are (ε,q−1); the original integral formula remains valid.

12. **F12** (P3) Two remaining supplier labels have no current target

   **Location:** `packages/HabiroRings/README.md:17`, “StableHomotopyKTheory:H.5:spectra, H.5:S-delooping and H.6”; line 380, “PrismaticCohomology:PR.0”.

   **Claim:** These labels resolve the generic spectral and relative-input prerequisites; several Needs lines also cite StableHomotopyKTheory Layer 6 for completion/tensor arguments.

   **Witness:** StableHomotopyKTheory README:2098 has §5.18, delegating ambient spectra to BordismFormalGroups F6.5; its Layer 6 at 2134 assembles K-theory. PrismaticCohomology README:306 calls its foundation “Layer 0”; neither cited PR.0 nor H.5 label exists.

   **Exact repair text:** Replace the old H.5/H.6 labels and the irrelevant Layer-6 inputs by “BordismFormalGroups F6.5; GeneralizedCohomology G2.1–G2.7; EnhancedDerivedSheaves E5:abstract and E5:spectra-comparison”, choosing the actual input for each Needs line. Keep StableHomotopyKTheory §5.18 only for its connective comparison. Delete PrismaticCohomology:PR.0 from §1's dependencies: the relative-input category uses precisely the already cited QWittVectors Λ-ring/perfect-coverage interfaces and étale base change. For the sphere, π₀=ℤ and π₁=ℤ/2; no K-theory assembly is required to define these coefficient carriers.

13. **F13** (P3) The thesis manifest still places two paragraphs in the wrong subsection

   **Location:** `packages/HabiroRings/sources.toml:120`, “numbered paragraphs 5.1–5.3 within §5.1”.

   **Claim:** All three numbered paragraphs lie inside subsection §5.1.

   **Witness:** T lines 3797 and 3812 begin paragraphs 5.1 and 5.2; subsection §5.1 starts only at line 3823. Paragraph 5.3 starts at line 3832 inside it.

   **Exact repair text:** Set the version note to “Thesis, 15 August 2025; numbered paragraphs 5.1–5.3, printed pp.85–86 (PDF pp.89–90); paragraph 5.3 lies within subsection §5.1.” Keep the corrected README locator. The null-sequence recollection and compact-generator claim are then located respectively before and inside that subsection.

## Verification of the earlier findings

The identifiers below distinguish the fourteen pass-a findings from the four pass-b findings. A settled unavailable-supplier finding is not re-raised: its registered contract is accepted conditionally.

| Earlier finding | Status at this head | Repaired passage and independently checked witness |
|---|---|---|
| a/F01, stale pins | Repaired | README:45, “Mathlib **6b7abb3** and Tau Ceti **a91d3aa**”. These prefixes match `lake-manifest.json`. |
| a/F02, QWitt supplier drift/ownership | Partly repaired | README:15, “QWittVectors §§1.1–1.6, 2.1–2.5, 3.1–3.7, 4.1–4.6, 5.1–5.3 and 6.1–6.3”; README:77 registers cross-base naturality. The mathematics exists at the supplied head, but its asserted names do not: S03. |
| a/F03, prime-generated ideal at m=1 | Repaired | README:79, “For m>1”; “at m=1 retain the separate empty ideal (0)”. Empty generators give 0, whereas Φ₁=q−1≠0 in ℤ[q]. At m=2 the sole generator is q+1=Φ₂. |
| a/F04, derived-completion owner | Repaired | README:57, “DerivedModuleAlgebra §§1.1–1.1.1”, “§1.5 … retaining its regular-sequence or bounded-torsion hypotheses”. Main §§1.2–1.5 contain the named completion, Nakayama and Koszul targets. |
| a/F05, locally nilpotent étale invariance duplicated | Repaired | README:241 imports “SchemeAndStackFoundations §0.23a”; main README:1510–1543 gives universal-homeomorphism étale equivalence and nil-ideal reduction. In 𝔽₂[x_i]/(x_i²), every element of (x_i) is nilpotent but x₁⋯x_N≠0 for all N. |
| a/F06, missing finite-index theorem | Repaired | Suggested.lean:186, “theorem height_one”; all three memberships and both inclusions are explicit. P(4) has four vertices and only singleton-to-maximal-chain strict arrows. S09 concerns newly added padding, not this theorem. |
| a/F07, six library-only examples and instance docstring | Repaired | Those six examples are absent. Suggested.lean:256, “R is an R[[X]]-algebra by constant coefficient, so X acts as zero.” Its scalar action sends X to 0 and 3 to multiplication by 3. Remaining padding is separately identified in S01–S02/S09. |
| a/F08, evaluator Checks/general coefficients | Repaired | Suggested.lean:240 quantifies over every commutative R; README:1170 computes “t(1⊗3)=−3”; README:1171 uses the actual zero-evaluator name. Over R=ℤ×ℤ the unit map sends 1⊗(2,3) to (2,3). The new rank error is S07. |
| a/F09, absent source manifest | Repaired | `packages/HabiroRings/sources.toml` contains twelve distinct source keys, legal retrieval metadata and locators; the two More on Algebra tags share Stacks0ALI. All twelve supplied extractions are readable. |
| a/F10, Gaussian supplier/duplication | Partly repaired | README:59 imports “QSeriesPartitionsAndMockModularForms §3.1”; its README:404 supplies the integral product identity. The invented exported names remain S03. At a=b=1, P₂=P₁²(1+q), including q=1 and characteristic 2. |
| a/F11, unavailable upstream contracts | Repaired as a declared dependency; settled | README:71–89 uses named “What … must provide (gap:…)” contracts. All ten slugs match `design/plan.json`. The unavailable completion/solid/number-field implementations are not reported as package defects. |
| a/F12, false ω₁-filtered profile interchange | Repaired | README:616 says “filtered”, and §2.12 uses countable subcoproducts for the ω₁-filtered argument. For f_k(n)=max(n−k,0), a common lower profile would have g(n)≤f_n(n)=0, contradicting g→∞; countable unions of countable subsets remain countable. |
| a/F13, thesis locator | Partly repaired | README:598, “numbered paragraph 5.3 within §5.1”. T line 3832 is that paragraph; it is not subsection 5.3. The manifest introduces a separate placement error, S13. |
| a/F14, enhanced-category locators | Repaired | README:57 names BordismFormalGroups F6.5, GeneralizedCohomology G2.1–G2.7 and EnhancedDerivedSheaves E2:towers/E5:abstract.2–3. The main files contain these sections and the stated delegation. |
| b/F01, failed characteristic-two example | Repaired by deletion | The offending example is absent; Suggested.lean:117 retains the general regularity theorem. In 𝔽₂[q±1], (q²−1)·1=q²+1≠0, whereas at m=0 the multiplier is 0. No Lean execution was performed in this review. |
| b/F02, unavailable HabiroNumberFields locators | Repaired as declared gaps; settled | README:83–89 registers ring, line, integral-evaluation and supported-pullback contracts. HB.6/HB.7/HB.10 are gone. No unavailable head is certified. |
| b/F03, unsupported TeX | Repaired | The current README uses Unicode and code spans; the old display/inline TeX delimiters are absent. Its formulas retain P₀=1 and λ²=−c₂. |
| b/F04, algebraization locator | Repaired | README:21, “DerivedDeRhamCohomology §1.12”. That section contains the algebraization theorem; it is a scope deferral, while §0.6 uses the direct principal argument. |

## Computed adversarial ledger

Rows give calculations, not proofs of the general assertions. Spectral and arithmetic rows retain their registered supplier hypotheses. Group schemes, nonabelian induction, fans and geometric separation have no carriers in these statements; no conclusions about those unrelated classes are inferred.

### Headed targets and conventions

| Statement (README line) | Instances | Computed values | Result / repair |
|---|---|---|---|
| §0.1 Marked étale deformations and their maps (196) | B=ℤ, I=0; split marking; a=0,2 | id(3)=3; swapped id(1,0)=(0,1); ℤ[1/0]=0; rank ℤ[1/2]=1 | S02/S07/S08 |
| §0.2 Existence over an arbitrary quotient ideal (225) | I=0, I=B; quadratic algebra over 𝔽₂ | E=D; D=0 admits E=B or 0; discr(x²+x+1)=−3, inverted in E; reduced dimension=2 | sound |
| §0.3 Locally nilpotent reduction and marked rigidity (239) | B=ℤ/4; infinite square-zero variables; B=0 | swap²(1,0)=(1,0); x₁⋯x_N≠0 for every N, each finite-support element nilpotent; zero-category map count=1 | sound |
| §0.4 The ordinary completion of a marked lift (253) | I=0,(2)⊂ℤ/4,(t)⊂ℤ[t], or B | completions E,E,ℤ[1/2][[t]],0 respectively; ∑tⁿ/2ⁿ has unbounded denominators | sound |
| §0.5 Maps into any ordinary complete target (290) | E=B=ℤ, I=(2), C=ℤ₂ or 𝔽₂; incomplete C=ℤ | complete-target map count=1 in both cases; ℤ₂→𝔽₂ has kernel 2ℤ₂; ℤ₂→ℤ impossible because 3·h(1/3)=1 | sound |
| §0.6 Regular principal derived universality (313) | B=ℤ, f=2; f a unit; f=0 | W=ℤ₂; 𝔽₂/ᴸ2 has π₀=π₁=𝔽₂ so wrong static lift excluded; unit-complete C=0; f=0 is not regular | sound |
| §1.1 The category of relative inputs (347) | toric ℤ[t], shift t↦t+1; conjugation on ℤ[i][1/2] | fψ²(t)=t²+2t+1 versus ψ²f(t)=t²+1; φ₃(i)=−i, conjugation commutes; identity gives i↦i | S03/S12 |
| §2.1 Habiro completion in the Laurent convention (386) | q=1 on ℤ or 𝔽₂; Laurent localization; P₂ | L_H(R_r)=0 versus R_r≠0; q(1+q−q²)−1=−P₂; ℤ[[t]]/(t+2)=ℤ₂ versus H/(q+1)=ℤ | sound |
| §2.2 A free resolution of the rational localization (421) | e₀,e₁; input 2e₂+e₃ | εd(e₀)=1−1=0; εd(e₁)=1/P₁−1/P₁=0; coefficient of e₂ after d remains 2 | S05 |
| §2.3 Completeness of homotopy modules (441) | static ℤ at q=1; R_r; B=ℤ[q±1] | Hom(R_r,ℤ)=Ext¹(R_r,ℤ)=0; Hom(R_r,R_r) contains id≠0; Hom(R_r,B)=0 but Ext¹ measures nonzero completion defect | sound |
| §2.4 Ordinary and derived completion of polynomial coefficient modules (453) | M=0; M=𝔽₂; m=0,1,2 | zero limit=0; (q²−1)·1=q²+1≠0; m=0 sends 0 and 1 to 0; q=1 on a non-induced 𝔽₂ module gives π₁=𝔽₂ | sound |
| §2.5 The completed tensor: Laurent form and coefficient base change (482) | orders 2 and 3 over ℤ; identity and zero base maps | tensor π₀=ℤ, π₁=ℤ·(1+q); id*H=H; zero-base tensor=0; ∑P_n tⁿ is completed but not in H[t] | sound |
| §2.6 Spherical cyclotomic localization (504) | π₀,π₁; n=1,2; quotient by q−1 | π₀T=R_r; π₁T=𝔽₂[q±1,(qᵐ−1)⁻¹]≠0; P₂/P₁=1−q²; T/(q−1)=0 | sound |
| §2.7 Spectral completion and its unit (530) | M=0,T,ℛ/(q−1),Hℤ[q±1] | L_H values 0,0,ℛ/(q−1),H(H); π₀T≠0; on zero map both naturality composites are 0 | sound |
| §2.8 Complete solid modules and the discrete embedding (564) | unit; ℤ at q=1; countable sum | finite quotient sphere ranks 1,3 at n=1,2; toSolid(ℤ)=discrete ℤ; ∑P_n e_n has infinite support but completed coordinates | conditional on solid gap |
| §2.9 Solid idempotence of the unit (590) | n=1,2; balanced versus absolute tensor | quotient ranks 1 and 3; balanced q₁−q₂=0; absolute tensor keeps q₁−q₂≠0 before balancing | conditional on solid gap |
| §2.10 Completed sums of countable products (610) | empty blocks, one singleton, all singleton blocks | C_empty=0; C_single=SH; constant 1 has infinite support mod P₁; P_n vanishes mod P_k for n≥k | conditional on solid gap |
| §2.11 Tensor products of completed countable sums (645) | a=b=1 or a=0; h=m+n or max(m,n) | P₂=P₁²(1+q); P₀=1; f=m,g=n gives equality for m+n; floors m/2,n/2 have sum≤max(m,n) | S03/S05 |
| §2.12 Bounded-below solid tensor closure (669) | M=0,SH; shifts Σ^(−n)SH | unit tensor values 0,SH; inf_n(−n)=−∞ excludes the unbounded family; a countable union of countable index sets is countable | conditional on solid gap |
| §3.1 Cyclotomic intersections (702) | S={1,6},{1,4},{3,9}; square-zero coefficients | I_{1,6}=1 since Φ₆−qΦ₁=1; I_{1,4}=(2,q−1); √I_{3,9}=(3,q−1); over 𝔽₂[ε]/ε², √I_{1,2}=(ε,q−1) | S11 |
| §3.2 The finite prime-chain index (712) | m=0,1,2,4,6,12; d=0 or p=0 | vertex counts 0,1,3,4,8,11; {1,4}∉P(4); primeChain(4,0,2)={0}, primeChain(4,3,0)={3} | S09 for Lean boundary examples |
| §3.3 Height one of the reduced index (741) | m=4, S={1},T=U={1,2,4}; m=1 | S≠T but T=U, so false∨true=true; at m=1 both equalities true; no pair of strict composable arrows | sound |
| §3.4 Consecutive prime edges determine chain data (751) | chain 1,2,4; consecutive maps negation,negation | composite (−1)(−1)=1 from first to third; omitting the middle vertex loses the specified composite | sound |
| §3.5 Finite descent for tensor-compatible localizations (761) | identity, disjoint two-piece, empty, wrong overlap | identity reconstruction=id; disjoint reconstruction=(x₁,x₂); empty conservativity forces 0; wrong id/id restrictions give diagonal, missing (1,0) | sound |
| §3.6 Mapping spaces of prime-edge data (802) | m=1,2,6 | edge counts 0,1,4; empty comparison target=*; at 2 one path between two restrictions; at 6 four paths, not four pairwise strict compositions | sound |
| §4.1 The finite stages as functors on pairs (834) | m=1; R=A; ℤ[1/2],m=2; conjugation | stage₁=R[[q−1]]; a⊗b↦ψᵈ(a)b; localized stage₂=R[[q−1]]×R[[q+1]]; conjugation sends e=(1−iq)/2 to 1−e | conditional on coefficient gap |
| §5.1 The relative Habiro ring (872) | R=0,A; Gaussian R, order4; m=1 | H_0=0; H_ℤ=H; H_Gaussian/Φ₄=R×R; H/(q−1)=R; q−1 has constant coefficient 0, hence is not a unit | conditional on coefficient gap |
| §5.2 Compatible roots and the two Taylor maps (904) | m=1,3,6; p=2; Gaussian order4 | ζ₃−ζ₆=2ζ₃; ordinary exponential roots instead give −1; τ₃(1−q³)=−3ζ₃²X−3ζ₃X²−X³; φ₂,₁(q+1)=X+2 | sound |
| §5.3 Prime-adic and rational Taylor comparison (941) | m=5,p=11; m=1 | Φ₅ mod11 has roots 3,4,5,9 and quotient 𝔽₁₁⁴; at m=1 the Taylor comparison is identity on R[[X]] | sound |
| §5.4 The Taylor equalizer (951) | R=0,ℤ,ℤ[i][1/2] | equalizer_0=0; integral edges use identity coefficient Frobenius; Gaussian order4 has two components, e=(1−iq)/2≠0,1 | conditional on coefficient gap |
| §5.5 When the twists can be removed (970) | R=ℤ, toric A=R, cubic R | ψᵈ on ℤ=id; T⊗1=1⊗Tᵈ in self twist, so maps to Tᵈ; cubic generator has φ₅(α)≠α on quadratic component | sound |
| §5.6 Completed base change of the ring (980) | identity map, zero target, toric ℤ→ℤ[t] | id comparison=id; zero comparison=0≃0; completed base change contains ∑P_n tⁿ, ordinary H[t] has bounded t-degree | sound |
| §5.7 The classical Habiro ring (1007) | self pair ℤ; q modulo P₂ | both rings have q inverse 1+q−q² mod P₂, since product equals 1; projection at q=1 gives ℤ | sound |
| §5.8 Unramified number-field coefficients (1021) | F=ℚ,Δ=1; F=ℚ(i),Δ=2,1 | discriminants 1,−4; first two rings étale; Δ=1 leaves 𝔽₂[i]=𝔽₂[ε]/ε², not étale; completion at an inverted prime=0 | S04 |
| §5.9 The GSWZ ring comparison (1042) | F=ℚ,Δ=1,2; F=ℚ(i),Δ=2 | κ is identity classical comparison for ℚ; Δ=2 kills 2-adic edges; Gaussian coefficient ring at4 is R×R on both sides | conditional on number-field gap |
| §6.1 Scalar extension of complete modules (1075) | M=0,H,H²; f=id; q² quotient after inverting2 | base changes 0,H′,(H′)²; id*=id; quotient becomes R[q]/(q²−1)=R×R for R=ℤ[1/2] | sound |
| §6.2 Transporting the K-theory line bundles (1105) | ξ=0, ξ+(−ξ); F=ℚ(i),Δ=12 | M₀=H; M_ξ⊗M_−ξ≃H; 6 and −4 divide12 but24 does not; coefficient ring is ℤ[i][1/6] | S06; conditional on line gap |
| §6.3 The q−1 completion map (1125) | q,q²; zero ring; ℤ[1/2] idempotent in second factor | q↦1+X; q²↦1+2X+X²; 0→0; e≠0 supported at v₂(order)=1 maps to0 | sound |
| §6.4 Trivializing the order-one fiber (1145) | unit evaluator, negative evaluator, zero evaluator | values at1⊗3 are3,−3,0; inverse unit is1,−1,absent over ℤ; over zero ring 0=1 and unique map is an equivalence | S01/S02 |
| §6.5 From the first fiber to the completed line (1173) | P=R[[X]]; R=ℤ×ℤ; R=0 | lifts 1 and1+X both have constant1 but differ; (1+X)⁻¹=1−X+X²−⋯; product ring need not be local; zero ring unique module=0 | sound |
| §6.6 Vanishing of the completed Picard class (1193) | ξ=0; pair ξ,−ξ; zero coefficient ring | completed Picard classes 0, [M]+[M⁻¹]=0,0; trivializations need not be unique since 1 and1+X have equal constant1 | conditional on line/evaluation gaps |
| §6.7 Supported field scalar comparison (1207) | identity embedding; ℚ→ℚ(i), common Δ=6; composition | unit section1↦1↦1 equals composite1↦1; Δ=6 omits discriminant multiplicity4 but inverts the same primes; declared divisibility-by-discriminant contract uses Δ=12 | S06; conditional on naturality gap |
| §7.1 All four factors of Φ₅ modulo 11 (1238) | all four roots mod11 and mod11⁴ | Φ₅ roots3,4,5,9; lifted roots2786,7825,1963,2066 all give residue0 mod14641; four factors, not one | sound |
| §7.2 The components after inverting p (1248) | R=ℤ[1/2]; idempotents supported on v₂(order)=0,1 | e₀²=e₀,e₁²=e₁,e₀e₁=0; q=1 Taylor sends e₀↦1,e₁↦0; both idempotents nonzero | sound |
| §7.3 Constants over the localized cubic ring (1258) | α³=2; p=5; quadratic residue β²=2β+1 | β³=2 and β⁵=4β+2≠β; φ₅ changes α locally, global endomorphism fixes α; p=2,3 completions=0 | sound |
| §7.4 The finite-stage obstruction (1268) | R=ℤ; cubic R,p=5; m=1 | forced map sends3↦3; cubic residue β would need β=4β+2, false; at m=1 no prime divides m and obstruction hypotheses have no instance | S10 |

Conventions at README:29–43 were also instantiated: P₀=1, P₁=1−q, P₂=1−q−q²+q³; ψ²(2)=2, c₂(2)=−1 and λ²(2)=1; W on {1,2} has two coordinates and ghost₂(a)=a₁²+2a₂. Frobenius and restriction on this big Witt object are different operations. Derived quotient of zero on 𝔽₂ has π₀=π₁=𝔽₂. The spherical unit has π₁=𝔽₂ while Hℤ has π₁=0. For the self twist of toric ℤ[t], t⊗1=1⊗tᵐ, whereas the coefficient structure through the right factor sends t to 1⊗t. These fix signs, degree conventions and scalar direction. For the localized number-field theorems, Δ=0 makes the localization the zero ring (0=1), which is étale over ℤ; the explicit nonzero-Δ hypothesis excludes this degenerate arithmetic input. A number field cannot be inseparable over ℚ; the characteristic-p failures are instead tested on the induced Laurent module and the ramified residue algebra. No division by a vanishing q-factorial is performed in the integral Gaussian identities.

### Individual API bullets and Checks

Each label is the roadmap's label, not certification that an undeclared identifier is exported. “Sound on instance” means the displayed computation agrees; it does not certify absent supplier implementations.

| README line / statement | Kind and section | Instance and computed values | Result / change |
|---|---|---|---|
| 206: EtaleDeformation.ofAlgebra | API, §0.1 | B=ℤ, I=0; split marking; a=0,2; id(3)=3; swapped id(1,0)=(0,1); ℤ[1/0]=0; rank ℤ[1/2]=1 | S02/S07/S08 |
| 207: EtaleDeformation.carrier_etale | API, §0.1 | B=ℤ, I=0; split marking; a=0,2; id(3)=3; swapped id(1,0)=(0,1); ℤ[1/0]=0; rank ℤ[1/2]=1 | S02/S07/S08 |
| 208: EtaleDeformation.reduction_etale | API, §0.1 | B=ℤ, I=0; split marking; a=0,2; id(3)=3; swapped id(1,0)=(0,1); ℤ[1/0]=0; rank ℤ[1/2]=1 | S02/S07/S08 |
| 209: EtaleDeformation.transportMarking | API, §0.1 | B=ℤ, I=0; split marking; a=0,2; id(3)=3; swapped id(1,0)=(0,1); ℤ[1/0]=0; rank ℤ[1/2]=1 | S02/S07/S08 |
| 210: EtaleDeformation.reduceMap | API, §0.1 | B=ℤ, I=0; split marking; a=0,2; id(3)=3; swapped id(1,0)=(0,1); ℤ[1/0]=0; rank ℤ[1/2]=1 | S02/S07/S08 |
| 211: EtaleDeformation.reduceMap_id | API, §0.1 | B=ℤ, I=0; split marking; a=0,2; id(3)=3; swapped id(1,0)=(0,1); ℤ[1/0]=0; rank ℤ[1/2]=1 | S02/S07/S08 |
| 212: EtaleDeformation.reduceMap_comp | API, §0.1 | B=ℤ, I=0; split marking; a=0,2; id(3)=3; swapped id(1,0)=(0,1); ℤ[1/0]=0; rank ℤ[1/2]=1 | S02/S07/S08 |
| 213: EtaleDeformation.unit | API, §0.1 | B=ℤ, I=0; split marking; a=0,2; id(3)=3; swapped id(1,0)=(0,1); ℤ[1/0]=0; rank ℤ[1/2]=1 | S02/S07/S08 |
| 214: EtaleDeformation.split | API, §0.1 | B=ℤ, I=0; split marking; a=0,2; id(3)=3; swapped id(1,0)=(0,1); ℤ[1/0]=0; rank ℤ[1/2]=1 | S02/S07/S08 |
| 215: EtaleDeformation.localisation | API, §0.1 | B=ℤ, I=0; split marking; a=0,2; id(3)=3; swapped id(1,0)=(0,1); ℤ[1/0]=0; rank ℤ[1/2]=1 | S02/S07/S08 |
| 219: EtaleDeformation.test_unit | Check, §0.1 | B-map ℤ→E is forced by 1↦1; tensor reduction sends 3↦3. | S02/S07/S08 |
| 220: EtaleDeformation.test_split_swap | Check, §0.1 | With nonzero B/I, (1,0)↦(0,1)≠(1,0); zero quotient would erase the distinction. | S02/S07/S08 |
| 221: EtaleDeformation.test_localisation | Check, §0.1 | rank ℤ[1/2]=1, but denominators 2ⁿ unbounded; localization at0=0 and at1=ℤ. | S02/S07/S08 |
| 233: I=0 permits E=D with its specified B-action. For… | Check, §0.2 | I=0 gives E=D; I=B gives D=0 and distinct possible E=B,0. | sound on instance |
| 234: Over B=ℤ and I=(2), the algebra 𝔽₂[x]/(x²+x+1) lifts… | Check, §0.2 | x²+x+1 has derivative1 mod2, discriminant−3; invert3 and reduce to 𝔽₄. | sound on instance |
| 235: Over B=ℤ[t], I=(t), both B and B[1/(1−t)] lift… | Check, §0.2 | 1−t is nonunit in ℤ[t] and unit in its localization; both completions are ℤ[[t]]. | sound on instance |
| 247: For B=ℤ/4, I=(2), D=𝔽₂, the unit deformation has… | Check, §0.3 | Marked unit has one self-map; split swap(1,0)=(0,1) modulo2 and modulo4. | sound on instance |
| 248: In B=𝔽₂[x₁,x₂,…]/(x₁²,x₂²,…), the ideal generated by all x_i… | Check, §0.3 | x₁⋯x_N≠0 for every N; each finite-support ideal has nilpotence bound one more than its number of variables. | sound on instance |
| 249: The B=ℤ[t], I=(t) example of §0.2 excludes rigidity… | Check, §0.3 | Uncompleted lifts B and B[1/(1−t)] differ; B=0 admits only E=0. | sound on instance |
| 263: CompletedEtaleLift.instCommRing | API, §0.4 | I=0,(2)⊂ℤ/4,(t)⊂ℤ[t], or B; completions E,E,ℤ[1/2][[t]],0 respectively; ∑tⁿ/2ⁿ has unbounded denominators | sound on instance |
| 264: CompletedEtaleLift.instAlgebra | API, §0.4 | I=0,(2)⊂ℤ/4,(t)⊂ℤ[t], or B; completions E,E,ℤ[1/2][[t]],0 respectively; ∑tⁿ/2ⁿ has unbounded denominators | sound on instance |
| 265: CompletedEtaleLift.of | API, §0.4 | I=0,(2)⊂ℤ/4,(t)⊂ℤ[t], or B; completions E,E,ℤ[1/2][[t]],0 respectively; ∑tⁿ/2ⁿ has unbounded denominators | sound on instance |
| 266: CompletedEtaleLift.complete | API, §0.4 | I=0,(2)⊂ℤ/4,(t)⊂ℤ[t], or B; completions E,E,ℤ[1/2][[t]],0 respectively; ∑tⁿ/2ⁿ has unbounded denominators | sound on instance |
| 267: CompletedEtaleLift.reductionEquiv | API, §0.4 | I=0,(2)⊂ℤ/4,(t)⊂ℤ[t], or B; completions E,E,ℤ[1/2][[t]],0 respectively; ∑tⁿ/2ⁿ has unbounded denominators | sound on instance |
| 268: CompletedEtaleLift.reduction_of | API, §0.4 | I=0,(2)⊂ℤ/4,(t)⊂ℤ[t], or B; completions E,E,ℤ[1/2][[t]],0 respectively; ∑tⁿ/2ⁿ has unbounded denominators | sound on instance |
| 269: CompletedEtaleLift.homEquiv | API, §0.4 | I=0,(2)⊂ℤ/4,(t)⊂ℤ[t], or B; completions E,E,ℤ[1/2][[t]],0 respectively; ∑tⁿ/2ⁿ has unbounded denominators | sound on instance |
| 270: CompletedEtaleLift.map | API, §0.4 | I=0,(2)⊂ℤ/4,(t)⊂ℤ[t], or B; completions E,E,ℤ[1/2][[t]],0 respectively; ∑tⁿ/2ⁿ has unbounded denominators | sound on instance |
| 271: CompletedEtaleLift.map_reduction | API, §0.4 | I=0,(2)⊂ℤ/4,(t)⊂ℤ[t], or B; completions E,E,ℤ[1/2][[t]],0 respectively; ∑tⁿ/2ⁿ has unbounded denominators | sound on instance |
| 272: CompletedEtaleLift.map_id | API, §0.4 | I=0,(2)⊂ℤ/4,(t)⊂ℤ[t], or B; completions E,E,ℤ[1/2][[t]],0 respectively; ∑tⁿ/2ⁿ has unbounded denominators | sound on instance |
| 273: CompletedEtaleLift.map_comp | API, §0.4 | I=0,(2)⊂ℤ/4,(t)⊂ℤ[t], or B; completions E,E,ℤ[1/2][[t]],0 respectively; ∑tⁿ/2ⁿ has unbounded denominators | sound on instance |
| 274: CompletedEtaleLift.equivOfMarking | API, §0.4 | I=0,(2)⊂ℤ/4,(t)⊂ℤ[t], or B; completions E,E,ℤ[1/2][[t]],0 respectively; ∑tⁿ/2ⁿ has unbounded denominators | sound on instance |
| 275: CompletedEtaleLift.equivOfMarking_reduction | API, §0.4 | I=0,(2)⊂ℤ/4,(t)⊂ℤ[t], or B; completions E,E,ℤ[1/2][[t]],0 respectively; ∑tⁿ/2ⁿ has unbounded denominators | sound on instance |
| 276: CompletedEtaleLift.equivOfMarking_trans | API, §0.4 | I=0,(2)⊂ℤ/4,(t)⊂ℤ[t], or B; completions E,E,ℤ[1/2][[t]],0 respectively; ∑tⁿ/2ⁿ has unbounded denominators | sound on instance |
| 282: CompletedEtaleLift.test_zero_ideal | Check, §0.4 | I=0: E/IⁿE=E for n≥1, lim=E. | sound on instance |
| 283: CompletedEtaleLift.test_nilpotent | Check, §0.4 | In ℤ/4 with I=(2), I²=0, so tower is E from stage2 onward. | sound on instance |
| 284: CompletedEtaleLift.test_split_swap | Check, §0.4 | Completion ℤ₂² has reduced swap (1,0)↦(0,1), not the identity. | sound on instance |
| 285: CompletedEtaleLift.test_localisation_series | Check, §0.4 | Coefficients of ∑tⁿ/2ⁿ lie in ℤ[1/2], with no common denominator 2ᴺ. | sound on instance |
| 286: For I=B, every quotient and W_L are zero;… | Check, §0.4 | IE=E makes every quotient0, limit0; 0→C is unital only if 1_C=0. | sound on instance |
| 306: For E=B, the hom-set contains only the completed… | Check, §0.5 | E=B: both Hom sets are singletons, determined by 1↦1. | sound on instance |
| 307: The split identity and swap are distinguished by… | Check, §0.5 | Swap and id have different images (0,1),(1,0); completed localizations give the same ℤ[[t]]. | sound on instance |
| 308: For B=ℤ, I=(2), W_L=ℤ₂ and C=𝔽₂, there is… | Check, §0.5 | Unique ℤ₂→𝔽₂ sends2↦0, but 2≠0 in ℤ₂; not an isomorphism. | sound on instance |
| 309: Dropping completeness fails already for E=B, C=ℤ and… | Check, §0.5 | 3 has inverse in ℤ₂, none in ℤ, so a unital ℤ₂→ℤ cannot exist. | sound on instance |
| 327: For B=ℤ, f=2 and D=𝔽₂, W_L=ℤ₂. The static… | Check, §0.6 | 𝔽₂/ᴸ2=𝔽₂⊕Σ𝔽₂ whereas ℤ₂/ᴸ2=𝔽₂; π₁ distinguishes them. | sound on instance |
| 328: For B=ℤ[t], f=t and D=ℤ[1/2], W_L=ℤ[1/2][[t]], including the… | Check, §0.6 | Completion is ℤ[1/2][[t]]; split algebra gives its square, with swap moving(1,0). | sound on instance |
| 329: A unit f is regular and has B/(f)=0.… | Check, §0.6 | Unit multiplication has cofiber0, complete objects=0, equivalence fibre=point. | sound on instance |
| 330: For f=0 on B=ℤ, regularity fails: the derived… | Check, §0.6 | Multiplication by0 on ℤ has kernelℤ, not0; derived quotient has π₀=π₁=ℤ. | sound on instance |
| 359: EtalePair | API, §1.1 | toric ℤ[t], shift t↦t+1; conjugation on ℤ[i][1/2]; fψ²(t)=t²+2t+1 versus ψ²f(t)=t²+1; φ₃(i)=−i, conjugation commutes; identity gives i↦i | S03/S12 |
| 360: EtalePair.Hom | API, §1.1 | toric ℤ[t], shift t↦t+1; conjugation on ℤ[i][1/2]; fψ²(t)=t²+2t+1 versus ψ²f(t)=t²+1; φ₃(i)=−i, conjugation commutes; identity gives i↦i | S03/S12 |
| 361: EtalePair.instCategory | API, §1.1 | toric ℤ[t], shift t↦t+1; conjugation on ℤ[i][1/2]; fψ²(t)=t²+2t+1 versus ψ²f(t)=t²+1; φ₃(i)=−i, conjugation commutes; identity gives i↦i | S03/S12 |
| 362: EtalePair.Hom.base | API, §1.1 | toric ℤ[t], shift t↦t+1; conjugation on ℤ[i][1/2]; fψ²(t)=t²+2t+1 versus ψ²f(t)=t²+1; φ₃(i)=−i, conjugation commutes; identity gives i↦i | S03/S12 |
| 363: EtalePair.Hom.alg | API, §1.1 | toric ℤ[t], shift t↦t+1; conjugation on ℤ[i][1/2]; fψ²(t)=t²+2t+1 versus ψ²f(t)=t²+1; φ₃(i)=−i, conjugation commutes; identity gives i↦i | S03/S12 |
| 364: EtalePair.forget | API, §1.1 | toric ℤ[t], shift t↦t+1; conjugation on ℤ[i][1/2]; fψ²(t)=t²+2t+1 versus ψ²f(t)=t²+1; φ₃(i)=−i, conjugation commutes; identity gives i↦i | S03/S12 |
| 365: EtalePair.baseChange | API, §1.1 | toric ℤ[t], shift t↦t+1; conjugation on ℤ[i][1/2]; fψ²(t)=t²+2t+1 versus ψ²f(t)=t²+1; φ₃(i)=−i, conjugation commutes; identity gives i↦i | S03/S12 |
| 369: EtalePair.not_hom_of_non_lambda | Check, §1.1 | t²+2t+1 versus t²+1 differ by2t≠0. | S03/S12 |
| 370: EtalePair.hom_self | Check, §1.1 | Commuting square with both structure maps id forces g=f on each element. | S03/S12 |
| 371: EtalePair.conj_frobenius | Check, §1.1 | gφ₃(i)=g(−i)=i=φ₃g(i); φ₅(i)=i. | S03/S12 |
| 372: EtalePair.baseChange_toric | Check, §1.1 | Coefficient conjugation sends i↦−i, fixes t, and both square composites send i↦−i. | S03/S12 |
| 400: habiroLocalisation | API, §2.1 | q=1 on ℤ or 𝔽₂; Laurent localization; P₂; L_H(R_r)=0 versus R_r≠0; q(1+q−q²)−1=−P₂; ℤ[[t]]/(t+2)=ℤ₂ versus H/(q+1)=ℤ | sound on instance |
| 401: habiroLocalisation_eq_cyclotomic | API, §2.1 | q=1 on ℤ or 𝔽₂; Laurent localization; P₂; L_H(R_r)=0 versus R_r≠0; q(1+q−q²)−1=−P₂; ℤ[[t]]/(t+2)=ℤ₂ versus H/(q+1)=ℤ | sound on instance |
| 402: IsHabiroComplete | API, §2.1 | q=1 on ℤ or 𝔽₂; Laurent localization; P₂; L_H(R_r)=0 versus R_r≠0; q(1+q−q²)−1=−P₂; ℤ[[t]]/(t+2)=ℤ₂ versus H/(q+1)=ℤ | sound on instance |
| 403: habiroCompletion_polynomial_eq_laurent | API, §2.1 | q=1 on ℤ or 𝔽₂; Laurent localization; P₂; L_H(R_r)=0 versus R_r≠0; q(1+q−q²)−1=−P₂; ℤ[[t]]/(t+2)=ℤ₂ versus H/(q+1)=ℤ | sound on instance |
| 404: isHabiroComplete_iff_restrictScalars | API, §2.1 | q=1 on ℤ or 𝔽₂; Laurent localization; P₂; L_H(R_r)=0 versus R_r≠0; q(1+q−q²)−1=−P₂; ℤ[[t]]/(t+2)=ℤ₂ versus H/(q+1)=ℤ | sound on instance |
| 405: IsHabiroComplete.of_adicComplete | API, §2.1 | q=1 on ℤ or 𝔽₂; Laurent localization; P₂; L_H(R_r)=0 versus R_r≠0; q(1+q−q²)−1=−P₂; ℤ[[t]]/(t+2)=ℤ₂ versus H/(q+1)=ℤ | sound on instance |
| 406: IsHabiroComplete.limit | API, §2.1 | q=1 on ℤ or 𝔽₂; Laurent localization; P₂; L_H(R_r)=0 versus R_r≠0; q(1+q−q²)−1=−P₂; ℤ[[t]]/(t+2)=ℤ₂ versus H/(q+1)=ℤ | sound on instance |
| 407: habiroCompletion_eq_zero_iff | API, §2.1 | q=1 on ℤ or 𝔽₂; Laurent localization; P₂; L_H(R_r)=0 versus R_r≠0; q(1+q−q²)−1=−P₂; ℤ[[t]]/(t+2)=ℤ₂ versus H/(q+1)=ℤ | sound on instance |
| 408: habiroComplete_spectral_comparison | API, §2.1 | q=1 on ℤ or 𝔽₂; Laurent localization; P₂; L_H(R_r)=0 versus R_r≠0; q(1+q−q²)−1=−P₂; ℤ[[t]]/(t+2)=ℤ₂ versus H/(q+1)=ℤ | sound on instance |
| 412: habiroCompletion_localisation_eq_zero | Check, §2.1 | All qᵐ−1 become units on R_r; every quotient=0, L_H R_r=0, id_Rr≠0. | sound on instance |
| 413: isHabiroComplete_powerSeries | Check, §2.1 | On ℤ[[t]], t-adic completion gives ℤ[[t]] and q=1+t is a unit. | sound on instance |
| 414: habiroCompletion_ne_powerSeries | Check, §2.1 | At Φ₂, the two quotients are ℤ₂ and ℤ, hence unequal. | sound on instance |
| 415: habiroCompletion_q_inverse | Check, §2.1 | q+q²−q³−1=−(1−q−q²+q³)=−P₂. | sound on instance |
| 416: not_isHabiroComplete_laurent | Check, §2.1 | The limit contains ∑P_n; its compatible truncations have unbounded degree, not a fixed Laurent polynomial. | sound on instance |
| 417: habiroCompletion_ne_smashing | Check, §2.1 | Inverting t leaves a nonzero subring ℤ((t)); L_H ℤ[[t]]=ℤ[[t]], so localization tensor does not detect orthogonality. | sound on instance |
| 418: habiroCompletion_laurent_cofiber | Check, §2.1 | q[q⁻¹]=[1]=0 in Laurent/polynomial quotient; q^r[q⁻r]=0 for every r. | sound on instance |
| 419: isHabiroComplete_restrict_F2 | Check, §2.1 | q−1 acts0 on 𝔽₂; completion is 𝔽₂ for either coefficient ring. | sound on instance |
| 437: For i=0, d(e₀)=e₀−(1−q)e₁ has augmentation 1−(1−q)/P₁=0. A plus… | Check, §2.2 | 1−(1−q)/P₁=0; replacing minus by plus gives2. | S05 |
| 438: For i=1, the two augmentation terms are 1/P₁… | Check, §2.2 | 1/P₁−(1−q²)/P₂=0; wrong multiplier1−q gives q/((1−q)(1+q))≠0. | S05 |
| 439: A nonzero finite-support input has its first nonzero… | Check, §2.2 | For input2e₂+e₃, output e₂-coefficient=2, proving the output nonzero. | S05 |
| 467: OrdinaryDerivedComparison.laurent_regular | API, §2.4 | M=0; M=𝔽₂; m=0,1,2; zero limit=0; (q²−1)·1=q²+1≠0; m=0 sends 0 and 1 to 0; q=1 on a non-induced 𝔽₂ module gives π₁=𝔽₂ | sound on instance |
| 468: ordinaryDerivedComparison | API, §2.4 | M=0; M=𝔽₂; m=0,1,2; zero limit=0; (q²−1)·1=q²+1≠0; m=0 sends 0 and 1 to 0; q=1 on a non-induced 𝔽₂ module gives π₁=𝔽₂ | sound on instance |
| 469: ordinaryDerivedComparison.pi_zero | API, §2.4 | M=0; M=𝔽₂; m=0,1,2; zero limit=0; (q²−1)·1=q²+1≠0; m=0 sends 0 and 1 to 0; q=1 on a non-induced 𝔽₂ module gives π₁=𝔽₂ | sound on instance |
| 470: ordinaryDerivedComparison.finiteProjection | API, §2.4 | M=0; M=𝔽₂; m=0,1,2; zero limit=0; (q²−1)·1=q²+1≠0; m=0 sends 0 and 1 to 0; q=1 on a non-induced 𝔽₂ module gives π₁=𝔽₂ | sound on instance |
| 471: ordinaryDerivedComparison.naturality | API, §2.4 | M=0; M=𝔽₂; m=0,1,2; zero limit=0; (q²−1)·1=q²+1≠0; m=0 sends 0 and 1 to 0; q=1 on a non-induced 𝔽₂ module gives π₁=𝔽₂ | sound on instance |
| 475: ordinaryDerivedComparison.zero | Check, §2.4 | M=0 yields all stages0; P₀=1 yields quotient0 for any M. | sound on instance |
| 476: ordinaryDerivedComparison.integral_unit | Check, §2.4 | Finite quotients are ℤ[q]/P_n; at n=1 this is ℤ, at n=2 a free rank3 module. | sound on instance |
| 477: ordinaryDerivedComparison.coefficient_torsion | Check, §2.4 | In 𝔽₂[q±1], q²−1=(q−1)²≠0, and multiplication has kernel0. | sound on instance |
| 478: ordinaryDerivedComparison.positive_order | Check, §2.4 | m=0: 0·0=0·1=0 while0≠1. | sound on instance |
| 479: ordinaryDerivedComparison.q_one_torsion | Check, §2.4 | At q=1 on 𝔽₂, cofiber0=𝔽₂⊕Σ𝔽₂, not a static quotient. | sound on instance |
| 480: ordinaryDerivedComparison.coefficient_map | Check, §2.4 | Reduce P₂=1−q−q²+q³ mod2: 1+q+q²+q³ on either route. | sound on instance |
| 494: habiroTensor_baseChange | API, §2.5 | orders 2 and 3 over ℤ; identity and zero base maps; tensor π₀=ℤ, π₁=ℤ·(1+q); id*H=H; zero-base tensor=0; ∑P_n tⁿ is completed but not in H[t] | sound on instance |
| 498: habiroTensor_unit_int | Check, §2.5 | q(1+q−q²)=1 modP₂. | sound on instance |
| 499: habiroTensor_torsion | Check, §2.5 | In ℤ[q]/(q²−1), q³−1=q−1; kernel of multiplication is ℤ·(1+q); π₀=ℤ. | sound on instance |
| 500: ordinary_tensor_not_complete | Check, §2.5 | After completing, multiplication H⊗H→H is equivalence; before it, x⊗1−1⊗x is nonzero for x transcendental over ℚ(q). | sound on instance |
| 501: habiroTensor_baseChange_id | Check, §2.5 | Identity base change gives M; zero coefficient target gives0. | sound on instance |
| 502: habiroTensor_baseChange_flat | Check, §2.5 | ∑P_n tⁿ has unbounded t-degree; every element of H[t] has bounded degree. | sound on instance |
| 516: SphericalCyclotomicLocalization | API, §2.6 | π₀,π₁; n=1,2; quotient by q−1; π₀T=R_r; π₁T=𝔽₂[q±1,(qᵐ−1)⁻¹]≠0; P₂/P₁=1−q²; T/(q−1)=0 | sound on instance |
| 517: SphericalCyclotomicLocalization.map | API, §2.6 | π₀,π₁; n=1,2; quotient by q−1; π₀T=R_r; π₁T=𝔽₂[q±1,(qᵐ−1)⁻¹]≠0; P₂/P₁=1−q²; T/(q−1)=0 | sound on instance |
| 518: SphericalCyclotomicLocalization.invert | API, §2.6 | π₀,π₁; n=1,2; quotient by q−1; π₀T=R_r; π₁T=𝔽₂[q±1,(qᵐ−1)⁻¹]≠0; P₂/P₁=1−q²; T/(q−1)=0 | sound on instance |
| 519: SphericalCyclotomicLocalization.idempotent | API, §2.6 | π₀,π₁; n=1,2; quotient by q−1; π₀T=R_r; π₁T=𝔽₂[q±1,(qᵐ−1)⁻¹]≠0; P₂/P₁=1−q²; T/(q−1)=0 | sound on instance |
| 520: SphericalCyclotomicLocalization.fibre | API, §2.6 | π₀,π₁; n=1,2; quotient by q−1; π₀T=R_r; π₁T=𝔽₂[q±1,(qᵐ−1)⁻¹]≠0; P₂/P₁=1−q²; T/(q−1)=0 | sound on instance |
| 521: SphericalCyclotomicLocalization.pi | API, §2.6 | π₀,π₁; n=1,2; quotient by q−1; π₀T=R_r; π₁T=𝔽₂[q±1,(qᵐ−1)⁻¹]≠0; P₂/P₁=1−q²; T/(q−1)=0 | sound on instance |
| 525: SphericalCyclotomicLocalization.pi_zero | Check, §2.6 | π₀T=ℤ[q±1,(qᵐ−1)⁻¹]=R_r. | sound on instance |
| 526: SphericalCyclotomicLocalization.first_transition | Check, §2.6 | P₁(1−q²)=1−q−q²+q³=P₂. | sound on instance |
| 527: SphericalCyclotomicLocalization.cyclotomic_tensor_zero | Check, §2.6 | q−1 invertible onT implies cofiber(q−1:T→T)=0. | sound on instance |
| 528: Its zeroth homotopy is R_r, while its higher… | Check, §2.6 | π₁T=𝔽₂[q±1,(qᵐ−1)⁻¹]≠0; π₁H(R_r)=0. | sound on instance |
| 542: SpectralHabiroCompletion | API, §2.7 | M=0,T,ℛ/(q−1),Hℤ[q±1]; L_H values 0,0,ℛ/(q−1),H(H); π₀T≠0; on zero map both naturality composites are 0 | sound on instance |
| 543: SpectralHabiroCompletion.factorial | API, §2.7 | M=0,T,ℛ/(q−1),Hℤ[q±1]; L_H values 0,0,ℛ/(q−1),H(H); π₀T≠0; on zero map both naturality composites are 0 | sound on instance |
| 544: SpectralHabiroCompletion.adjunction | API, §2.7 | M=0,T,ℛ/(q−1),Hℤ[q±1]; L_H values 0,0,ℛ/(q−1),H(H); π₀T≠0; on zero map both naturality composites are 0 | sound on instance |
| 545: SpectralHabiroCompletion.idempotent | API, §2.7 | M=0,T,ℛ/(q−1),Hℤ[q±1]; L_H values 0,0,ℛ/(q−1),H(H); π₀T≠0; on zero map both naturality composites are 0 | sound on instance |
| 546: SpectralHabiroCompletion.tensor | API, §2.7 | M=0,T,ℛ/(q−1),Hℤ[q±1]; L_H values 0,0,ℛ/(q−1),H(H); π₀T≠0; on zero map both naturality composites are 0 | sound on instance |
| 547: SpectralHabiroCompletion.homotopy_exact | API, §2.7 | M=0,T,ℛ/(q−1),Hℤ[q±1]; L_H values 0,0,ℛ/(q−1),H(H); π₀T≠0; on zero map both naturality composites are 0 | sound on instance |
| 548: SpectralHabiroCompletion.complete_iff_pi | API, §2.7 | M=0,T,ℛ/(q−1),Hℤ[q±1]; L_H values 0,0,ℛ/(q−1),H(H); π₀T≠0; on zero map both naturality composites are 0 | sound on instance |
| 549: SpectralHabiroCompletion.nakayama | API, §2.7 | M=0,T,ℛ/(q−1),Hℤ[q±1]; L_H values 0,0,ℛ/(q−1),H(H); π₀T≠0; on zero map both naturality composites are 0 | sound on instance |
| 550: SpectralHabiroCompletion.detect_degree | API, §2.7 | M=0,T,ℛ/(q−1),Hℤ[q±1]; L_H values 0,0,ℛ/(q−1),H(H); π₀T≠0; on zero map both naturality composites are 0 | sound on instance |
| 551: SpectralHabiroCompletion.restrict_HZ | API, §2.7 | M=0,T,ℛ/(q−1),Hℤ[q±1]; L_H values 0,0,ℛ/(q−1),H(H); π₀T≠0; on zero map both naturality composites are 0 | sound on instance |
| 552: SpectralHabiroCompletion.map | API, §2.7 | M=0,T,ℛ/(q−1),Hℤ[q±1]; L_H values 0,0,ℛ/(q−1),H(H); π₀T≠0; on zero map both naturality composites are 0 | sound on instance |
| 553: SpectralHabiroCompletion.map_id | API, §2.7 | M=0,T,ℛ/(q−1),Hℤ[q±1]; L_H values 0,0,ℛ/(q−1),H(H); π₀T≠0; on zero map both naturality composites are 0 | sound on instance |
| 554: SpectralHabiroCompletion.map_comp | API, §2.7 | M=0,T,ℛ/(q−1),Hℤ[q±1]; L_H values 0,0,ℛ/(q−1),H(H); π₀T≠0; on zero map both naturality composites are 0 | sound on instance |
| 555: SpectralHabiroCompletion.unit_naturality | API, §2.7 | M=0,T,ℛ/(q−1),Hℤ[q±1]; L_H values 0,0,ℛ/(q−1),H(H); π₀T≠0; on zero map both naturality composites are 0 | sound on instance |
| 559: SpectralHabiroCompletion.zero | Check, §2.7 | L_H(0)=0 at every factorial quotient. | sound on instance |
| 560: SpectralHabiroCompletion.local_zero | Check, §2.7 | L_HT=0 but π₀T contains1≠0. | sound on instance |
| 561: SpectralHabiroCompletion.cyclotomic_fixed | Check, §2.7 | q−1 acts0 on ℛ/(q−1); its π₀=ℤ and π₁=𝔽₂ are both complete. | sound on instance |
| 562: SpectralHabiroCompletion.integral_unit | Check, §2.7 | Surjective static quotient tower has lim¹=0; output π₀=H and other π=0. | sound on instance |
| 578: IsHabiroCompleteSolid | API, §2.8 | unit; ℤ at q=1; countable sum; finite quotient sphere ranks 1,3 at n=1,2; toSolid(ℤ)=discrete ℤ; ∑P_n e_n has infinite support but completed coordinates | conditional on solid gap |
| 579: habiroCompletionSolid | API, §2.8 | unit; ℤ at q=1; countable sum; finite quotient sphere ranks 1,3 at n=1,2; toSolid(ℤ)=discrete ℤ; ∑P_n e_n has infinite support but completed coordinates | conditional on solid gap |
| 580: toSolid | API, §2.8 | unit; ℤ at q=1; countable sum; finite quotient sphere ranks 1,3 at n=1,2; toSolid(ℤ)=discrete ℤ; ∑P_n e_n has infinite support but completed coordinates | conditional on solid gap |
| 581: toSolid_fullyFaithful | API, §2.8 | unit; ℤ at q=1; countable sum; finite quotient sphere ranks 1,3 at n=1,2; toSolid(ℤ)=discrete ℤ; ∑P_n e_n has infinite support but completed coordinates | conditional on solid gap |
| 582: toSolid_eval_point | API, §2.8 | unit; ℤ at q=1; countable sum; finite quotient sphere ranks 1,3 at n=1,2; toSolid(ℤ)=discrete ℤ; ∑P_n e_n has infinite support but completed coordinates | conditional on solid gap |
| 586: toSolid_unit | Check, §2.8 | Ranks degP₁=1 and degP₂=3, matching one and three spheres. | conditional on solid gap |
| 587: toSolid_torsion | Check, §2.8 | On ℤ with q=1, no further completion: toSolid(ℤ)=discrete ℤ. | conditional on solid gap |
| 588: toSolid_sum_ne_discrete | Check, §2.8 | ∑P_n e_n has infinitely many nonzero coordinates, but finitely many mod each P_k; not in discrete direct sum. | conditional on solid gap |
| 602: SolidHabiroCompletion.unit_idempotent | API, §2.9 | n=1,2; balanced versus absolute tensor; quotient ranks 1 and 3; balanced q₁−q₂=0; absolute tensor keeps q₁−q₂≠0 before balancing | conditional on solid gap |
| 606: At n=1, ℛ/P₁ is one sphere; at n=2… | Check, §2.9 | n(n+1)/2 at1,2 equals1,3, not1,2. | conditional on solid gap |
| 607: The unit law is the ℛ-balanced multiplication S_H⊗^■_ℛS_H→S_H.… | Check, §2.9 | Balanced q₁−q₂=0; unbalanced two-variable class is nonzero. | conditional on solid gap |
| 608: After reduction by P_n the multiplication comparison is… | Check, §2.9 | ModuloP₂ basis1,q,q² has3 elements; scalar splitting need not respect q-action. | conditional on solid gap |
| 626: CountableSolidHabiroFree | API, §2.10 | empty blocks, one singleton, all singleton blocks; C_empty=0; C_single=SH; constant 1 has infinite support mod P₁; P_n vanishes mod P_k for n≥k | conditional on solid gap |
| 627: CountableSolidHabiroFree.ideal | API, §2.10 | empty blocks, one singleton, all singleton blocks; C_empty=0; C_single=SH; constant 1 has infinite support mod P₁; P_n vanishes mod P_k for n≥k | conditional on solid gap |
| 628: CountableSolidHabiroFree.null_family | API, §2.10 | empty blocks, one singleton, all singleton blocks; C_empty=0; C_single=SH; constant 1 has infinite support mod P₁; P_n vanishes mod P_k for n≥k | conditional on solid gap |
| 629: CountableSolidHabiroFree.inclusion | API, §2.10 | empty blocks, one singleton, all singleton blocks; C_empty=0; C_single=SH; constant 1 has infinite support mod P₁; P_n vanishes mod P_k for n≥k | conditional on solid gap |
| 630: CountableSolidHabiroFree.ext | API, §2.10 | empty blocks, one singleton, all singleton blocks; C_empty=0; C_single=SH; constant 1 has infinite support mod P₁; P_n vanishes mod P_k for n≥k | conditional on solid gap |
| 631: CountableSolidHabiroFree.complete | API, §2.10 | empty blocks, one singleton, all singleton blocks; C_empty=0; C_single=SH; constant 1 has infinite support mod P₁; P_n vanishes mod P_k for n≥k | conditional on solid gap |
| 632: CountableSolidHabiroFree.transition | API, §2.10 | empty blocks, one singleton, all singleton blocks; C_empty=0; C_single=SH; constant 1 has infinite support mod P₁; P_n vanishes mod P_k for n≥k | conditional on solid gap |
| 633: CountableSolidHabiroFree.map | API, §2.10 | empty blocks, one singleton, all singleton blocks; C_empty=0; C_single=SH; constant 1 has infinite support mod P₁; P_n vanishes mod P_k for n≥k | conditional on solid gap |
| 634: CountableSolidHabiroFree.map_id | API, §2.10 | empty blocks, one singleton, all singleton blocks; C_empty=0; C_single=SH; constant 1 has infinite support mod P₁; P_n vanishes mod P_k for n≥k | conditional on solid gap |
| 635: CountableSolidHabiroFree.map_comp | API, §2.10 | empty blocks, one singleton, all singleton blocks; C_empty=0; C_single=SH; constant 1 has infinite support mod P₁; P_n vanishes mod P_k for n≥k | conditional on solid gap |
| 636: CountableSolidHabiroFree.inclusion_naturality | API, §2.10 | empty blocks, one singleton, all singleton blocks; C_empty=0; C_single=SH; constant 1 has infinite support mod P₁; P_n vanishes mod P_k for n≥k | conditional on solid gap |
| 640: CountableSolidHabiroFree.empty | Check, §2.10 | Every empty product is zero object in the stable category; sum/completion=0. | conditional on solid gap |
| 641: CountableSolidHabiroFree.one_block | Check, §2.10 | One singleton block gives F=SH, L_HF=SH. | conditional on solid gap |
| 642: CountableSolidHabiroFree.constant_not_null | Check, §2.10 | ModuloP₁ every coordinate is1≠0, so infinite support excludes the constant family. | conditional on solid gap |
| 643: CountableSolidHabiroFree.decaying_family | Check, §2.10 | P_n=0 modP_k for n≥k, giving finite support in every quotient. | conditional on solid gap |
| 659: CountableSolidHabiroTensor.comparison | API, §2.11 | a=b=1 or a=0; h=m+n or max(m,n); P₂=P₁²(1+q); P₀=1; f=m,g=n gives equality for m+n; floors m/2,n/2 have sum≤max(m,n) | S03/S05 |
| 660: CountableSolidHabiroTensor.separable_weights | API, §2.11 | a=b=1 or a=0; h=m+n or max(m,n); P₂=P₁²(1+q); P₀=1; f=m,g=n gives equality for m+n; floors m/2,n/2 have sum≤max(m,n) | S03/S05 |
| 661: CountableSolidHabiroTensor.radial_max | API, §2.11 | a=b=1 or a=0; h=m+n or max(m,n); P₂=P₁²(1+q); P₀=1; f=m,g=n gives equality for m+n; floors m/2,n/2 have sum≤max(m,n) | S03/S05 |
| 665: For a=b=1, P₂=P₁²(1+q); this fixes the factorial divisibility… | Check, §2.11 | (1−q)²(1+q)=1−q−q²+q³=P₂. | S03/S05 |
| 666: With a=0 or b=0 the Gaussian quotient is… | Check, §2.11 | P₀P_b=P_b; 1+1=2 overℤ and0 over𝔽₂. | S03/S05 |
| 667: For singleton blocks weighted by P_n and P_m,… | Check, §2.11 | At singleton indices(m,n), profiles m+n→∞; constant profile0 never reaches1. | S03/S05 |
| 681: CountableSolidHabiroTensor.bounded_below | API, §2.12 | M=0,SH; shifts Σ^(−n)SH; unit tensor values 0,SH; inf_n(−n)=−∞ excludes the unbounded family; a countable union of countable index sets is countable | conditional on solid gap |
| 682: SolidHabiroCompletion.boundedBelow_monoidal | API, §2.12 | M=0,SH; shifts Σ^(−n)SH; unit tensor values 0,SH; inf_n(−n)=−∞ excludes the unbounded family; a countable union of countable index sets is countable | conditional on solid gap |
| 683: SolidHabiroCompletion.boundedBelow_tensor | API, §2.12 | M=0,SH; shifts Σ^(−n)SH; unit tensor values 0,SH; inf_n(−n)=−∞ excludes the unbounded family; a countable union of countable index sets is countable | conditional on solid gap |
| 687: For complete bounded-below M, `e(S_H)⊗^■_{S_H}e(M)≃e(M);` with M=0 the… | Check, §2.12 | SH⊗SH=SH; SH⊗0=0 under the specified comparison. | conditional on solid gap |
| 688: A connective resolution remains uniformly bounded below under… | Check, §2.12 | Connective terms have uniform lower bound0; Σ^(−n)SH has nonzero π_−n so no common bound. | conditional on solid gap |
| 724: CyclotomicIndex.primeChain | API, §3.2 | m=0,1,2,4,6,12; d=0 or p=0; vertex counts 0,1,3,4,8,11; {1,4}∉P(4); primeChain(4,0,2)={0}, primeChain(4,3,0)={3} | S09 for Lean boundary examples |
| 725: CyclotomicIndex.vertices | API, §3.2 | m=0,1,2,4,6,12; d=0 or p=0; vertex counts 0,1,3,4,8,11; {1,4}∉P(4); primeChain(4,0,2)={0}, primeChain(4,3,0)={3} | S09 for Lean boundary examples |
| 726: CyclotomicIndex.mem_vertices | API, §3.2 | m=0,1,2,4,6,12; d=0 or p=0; vertex counts 0,1,3,4,8,11; {1,4}∉P(4); primeChain(4,0,2)={0}, primeChain(4,3,0)={3} | S09 for Lean boundary examples |
| 727: CyclotomicIndex.vertex_subset | API, §3.2 | m=0,1,2,4,6,12; d=0 or p=0; vertex counts 0,1,3,4,8,11; {1,4}∉P(4); primeChain(4,0,2)={0}, primeChain(4,3,0)={3} | S09 for Lean boundary examples |
| 728: CyclotomicIndex.vertex_nonempty | API, §3.2 | m=0,1,2,4,6,12; d=0 or p=0; vertex counts 0,1,3,4,8,11; {1,4}∉P(4); primeChain(4,0,2)={0}, primeChain(4,3,0)={3} | S09 for Lean boundary examples |
| 729: CyclotomicIndex.le_iff_subset | API, §3.2 | m=0,1,2,4,6,12; d=0 or p=0; vertex counts 0,1,3,4,8,11; {1,4}∉P(4); primeChain(4,0,2)={0}, primeChain(4,3,0)={3} | S09 for Lean boundary examples |
| 730: CyclotomicIndex.nerve_quasicategory | API, §3.2 | m=0,1,2,4,6,12; d=0 or p=0; vertex counts 0,1,3,4,8,11; {1,4}∉P(4); primeChain(4,0,2)={0}, primeChain(4,3,0)={3} | S09 for Lean boundary examples |
| 734: CyclotomicIndex.test_one | Check, §3.2 | P(1)={{1}} and P(0)=∅. | S09 for Lean boundary examples |
| 735: The chain computation gives primeChain(4,1,2)={1,2,4}; primeChain(1,3,2)={3}. At the… | Check, §3.2 | Chains (4,1,2)={1,2,4}; (1,3,2)={3}; (0,1,2)={1}; (4,0,2)={0}; (4,3,0)={3}. | S09 for Lean boundary examples |
| 736: CyclotomicIndex.test_four | Check, §3.2 | P(4) has {1},{2},{4},{1,2,4} and exactly4 vertices. | S09 for Lean boundary examples |
| 737: CyclotomicIndex.test_six | Check, §3.2 | P(6) has4 singletons and4 chains=8; P(12) has6 singletons and5 chains=11. | S09 for Lean boundary examples |
| 738: CyclotomicIndex.test_not_pair_four | Check, §3.2 | {1,4}≠{1,2,4}, so excluded from P(4); its intersection ideal (2,q−1)≠1. | S09 for Lean boundary examples |
| 739: CyclotomicIndex.test_incomparable_singletons | Check, §3.2 | 1∣2=true but {1}⊆{2}=false and {2}⊆{1}=false. | S09 for Lean boundary examples |
| 765: Each D_T⊆D is a full presentable stable reflective… | API, §3.5 | identity, disjoint two-piece, empty, wrong overlap; identity reconstruction=id; disjoint reconstruction=(x₁,x₂); empty conservativity forces 0; wrong id/id restrictions give diagonal, missing (1,0) | sound on instance |
| 766: Each localization is tensor-compatible: L_T(x⊗y)≃L_T(L_Tx⊗y), compatibly with its… | API, §3.5 | identity, disjoint two-piece, empty, wrong overlap; identity reconstruction=id; disjoint reconstruction=(x₁,x₂); empty conservativity forces 0; wrong id/id restrictions give diagonal, missing (1,0) | sound on instance |
| 767: Put `Z_S=∧_{i∈S}Z_i` for nonempty S⊆J and Z_∅=Z. For… | API, §3.5 | identity, disjoint two-piece, empty, wrong overlap; identity reconstruction=id; disjoint reconstruction=(x₁,x₂); empty conservativity forces 0; wrong id/id restrictions give diagonal, missing (1,0) | sound on instance |
| 769: The restrictions `L_{Z_i}:D_Z→D_{Z_i}` are jointly conservative. For an… | API, §3.5 | identity, disjoint two-piece, empty, wrong overlap; identity reconstruction=id; disjoint reconstruction=(x₁,x₂); empty conservativity forces 0; wrong id/id restrictions give diagonal, missing (1,0) | sound on instance |
| 781: FiniteMonoidalDescent.Datum.localize | API, §3.5 | identity, disjoint two-piece, empty, wrong overlap; identity reconstruction=id; disjoint reconstruction=(x₁,x₂); empty conservativity forces 0; wrong id/id restrictions give diagonal, missing (1,0) | sound on instance |
| 782: FiniteMonoidalDescent.Datum.overlap | API, §3.5 | identity, disjoint two-piece, empty, wrong overlap; identity reconstruction=id; disjoint reconstruction=(x₁,x₂); empty conservativity forces 0; wrong id/id restrictions give diagonal, missing (1,0) | sound on instance |
| 783: FiniteMonoidalDescent.restrict | API, §3.5 | identity, disjoint two-piece, empty, wrong overlap; identity reconstruction=id; disjoint reconstruction=(x₁,x₂); empty conservativity forces 0; wrong id/id restrictions give diagonal, missing (1,0) | sound on instance |
| 784: FiniteMonoidalDescent.reconstruct | API, §3.5 | identity, disjoint two-piece, empty, wrong overlap; identity reconstruction=id; disjoint reconstruction=(x₁,x₂); empty conservativity forces 0; wrong id/id restrictions give diagonal, missing (1,0) | sound on instance |
| 785: FiniteMonoidalDescent.maps | API, §3.5 | identity, disjoint two-piece, empty, wrong overlap; identity reconstruction=id; disjoint reconstruction=(x₁,x₂); empty conservativity forces 0; wrong id/id restrictions give diagonal, missing (1,0) | sound on instance |
| 786: FiniteMonoidalDescent.commAlgebra | API, §3.5 | identity, disjoint two-piece, empty, wrong overlap; identity reconstruction=id; disjoint reconstruction=(x₁,x₂); empty conservativity forces 0; wrong id/id restrictions give diagonal, missing (1,0) | sound on instance |
| 787: FiniteMonoidalDescent.refinement | API, §3.5 | identity, disjoint two-piece, empty, wrong overlap; identity reconstruction=id; disjoint reconstruction=(x₁,x₂); empty conservativity forces 0; wrong id/id restrictions give diagonal, missing (1,0) | sound on instance |
| 788: FiniteMonoidalDescent.sheaf | API, §3.5 | identity, disjoint two-piece, empty, wrong overlap; identity reconstruction=id; disjoint reconstruction=(x₁,x₂); empty conservativity forces 0; wrong id/id restrictions give diagonal, missing (1,0) | sound on instance |
| 792: A singleton identity cover has L_Z²≃L_Z; reconstruction, its… | Check, §3.5 | One identity localization: L²=L=id; reconstruction=id on objects/maps/algebras. | sound on instance |
| 793: For disjoint summands D=D₁×D₂, the localizations (x₁,x₂)↦(x₁,0) and… | Check, §3.5 | Disjoint components give (x₁,0),(0,x₂), overlap0; limit=(x₁,x₂). | sound on instance |
| 794: On a site with two disjoint opens covering… | Check, §3.5 | Wrong identity restrictions force diagonal(x,x), so (1,0) cannot reconstruct. | sound on instance |
| 795: For an empty cover, conservativity to the terminal… | Check, §3.5 | Conservative functor to zero category forces id_x to be equivalence to0 for every x; source=0. | sound on instance |
| 814: CyclotomicIndex.mapEqualizer | API, §3.6 | m=1,2,6; edge counts 0,1,4; empty comparison target=*; at 2 one path between two restrictions; at 6 four paths, not four pairwise strict compositions | sound on instance |
| 818: At m=1 the product W is empty, hence… | Check, §3.6 | m=1: comparison product is*=empty product; equalizer=Map(E₁,F₁). | sound on instance |
| 819: At a prime m=p there is one edge,… | Check, §3.6 | m=2: one homotopy between the two restrictions, giving the displayed homotopy pullback. | sound on instance |
| 820: At m=6 the four edges (p,d)=(2,1),(2,3),(3,1),(3,2) form a… | Check, §3.6 | m=6 gives edges(2,1),(2,3),(3,1),(3,2): four; no two strict arrows compose. | sound on instance |
| 846: RelHabiroStage | API, §4.1 | m=1; R=A; ℤ[1/2],m=2; conjugation; stage₁=R[[q−1]]; a⊗b↦ψᵈ(a)b; localized stage₂=R[[q−1]]×R[[q+1]]; conjugation sends e=(1−iq)/2 to 1−e | conditional on coefficient gap |
| 847: RelHabiroStage.map | API, §4.1 | m=1; R=A; ℤ[1/2],m=2; conjugation; stage₁=R[[q−1]]; a⊗b↦ψᵈ(a)b; localized stage₂=R[[q−1]]×R[[q+1]]; conjugation sends e=(1−iq)/2 to 1−e | conditional on coefficient gap |
| 848: RelHabiroStage.equivOfIso | API, §4.1 | m=1; R=A; ℤ[1/2],m=2; conjugation; stage₁=R[[q−1]]; a⊗b↦ψᵈ(a)b; localized stage₂=R[[q−1]]×R[[q+1]]; conjugation sends e=(1−iq)/2 to 1−e | conditional on coefficient gap |
| 849: RelHabiroStage.selfEquiv | API, §4.1 | m=1; R=A; ℤ[1/2],m=2; conjugation; stage₁=R[[q−1]]; a⊗b↦ψᵈ(a)b; localized stage₂=R[[q−1]]×R[[q+1]]; conjugation sends e=(1−iq)/2 to 1−e | conditional on coefficient gap |
| 853: RelHabiroStage.one | Check, §4.1 | m=1: stage=R[[q−1]], edge count0. | conditional on coefficient gap |
| 854: RelHabiroStage.int | Check, §4.1 | A=R=ℤ: φ_p(a)=a, overlap coefficients unchanged. | conditional on coefficient gap |
| 855: RelHabiroStage.selfEquiv | Check, §4.1 | a⊗b maps toψᵈ(a)b; for toric t, t⊗1 maps to tᵈ. | conditional on coefficient gap |
| 856: RelHabiroStage.localised | Check, §4.1 | 2 inverted gives p-completion0; stage₂=R[[q−1]]×R[[q+1]]. | conditional on coefficient gap |
| 857: RelHabiroStage.map_conj | Check, §4.1 | e=(1−iq)/2 is sent to(1+iq)/2=1−e, which differs frome. | conditional on coefficient gap |
| 858: For the zero étale algebra R=0 every stage… | Check, §4.1 | R=0 gives each stage0; E→0 unique; 0→E exists only when E=0. | conditional on coefficient gap |
| 884: HabiroRings.relativeHabiro | API, §5.1 | R=0,A; Gaussian R, order4; m=1; H_0=0; H_ℤ=H; H_Gaussian/Φ₄=R×R; H/(q−1)=R; q−1 has constant coefficient 0, hence is not a unit | conditional on coefficient gap |
| 885: HabiroRings.relativeHabiro.proj | API, §5.1 | R=0,A; Gaussian R, order4; m=1; H_0=0; H_ℤ=H; H_Gaussian/Φ₄=R×R; H/(q−1)=R; q−1 has constant coefficient 0, hence is not a unit | conditional on coefficient gap |
| 886: HabiroRings.relativeHabiro.ext | API, §5.1 | R=0,A; Gaussian R, order4; m=1; H_0=0; H_ℤ=H; H_Gaussian/Φ₄=R×R; H/(q−1)=R; q−1 has constant coefficient 0, hence is not a unit | conditional on coefficient gap |
| 887: HabiroRings.relativeHabiro.lift | API, §5.1 | R=0,A; Gaussian R, order4; m=1; H_0=0; H_ℤ=H; H_Gaussian/Φ₄=R×R; H/(q−1)=R; q−1 has constant coefficient 0, hence is not a unit | conditional on coefficient gap |
| 888: HabiroRings.relativeHabiro.factorialEquiv | API, §5.1 | R=0,A; Gaussian R, order4; m=1; H_0=0; H_ℤ=H; H_Gaussian/Φ₄=R×R; H/(q−1)=R; q−1 has constant coefficient 0, hence is not a unit | conditional on coefficient gap |
| 889: HabiroRings.relativeHabiro.completionEquiv | API, §5.1 | R=0,A; Gaussian R, order4; m=1; H_0=0; H_ℤ=H; H_Gaussian/Φ₄=R×R; H/(q−1)=R; q−1 has constant coefficient 0, hence is not a unit | conditional on coefficient gap |
| 890: HabiroRings.relativeHabiro.cyclotomicCompletionEquiv | API, §5.1 | R=0,A; Gaussian R, order4; m=1; H_0=0; H_ℤ=H; H_Gaussian/Φ₄=R×R; H/(q−1)=R; q−1 has constant coefficient 0, hence is not a unit | conditional on coefficient gap |
| 891: HabiroRings.relativeHabiro.quotientEquiv | API, §5.1 | R=0,A; Gaussian R, order4; m=1; H_0=0; H_ℤ=H; H_Gaussian/Φ₄=R×R; H/(q−1)=R; q−1 has constant coefficient 0, hence is not a unit | conditional on coefficient gap |
| 892: HabiroRings.relativeHabiro.map | API, §5.1 | R=0,A; Gaussian R, order4; m=1; H_0=0; H_ℤ=H; H_Gaussian/Φ₄=R×R; H/(q−1)=R; q−1 has constant coefficient 0, hence is not a unit | conditional on coefficient gap |
| 896: HabiroRings.relativeHabiro_zero | Check, §5.1 | H_0=lim0=0. | conditional on coefficient gap |
| 897: HabiroRings.relativeHabiro_self | Check, §5.1 | R=A=ℤ gives classical H; at q=1 completion=ℤ[[X]]. | conditional on coefficient gap |
| 898: HabiroRings.relativeHabiro_quotient_Phi4_gaussian | Check, §5.1 | AtΦ₄ overR=ℤ[i][1/2], quotient R×R; e=(1−iq)/2 maps to(1,0). | conditional on coefficient gap |
| 899: HabiroRings.relativeHabiro_qMinusOne | Check, §5.1 | Both first completion and stage₁ are R[[q−1]]. | conditional on coefficient gap |
| 900: HabiroRings.relativeHabiro_quotient_qWitt | Check, §5.1 | A=R=ℤ,m=2: quotient ℤ[q]/(q²−1), with basis1,q. | conditional on coefficient gap |
| 901: HabiroRings.relativeHabiro_not_localisation | Check, §5.1 | q−1↦X has constant0; not a unit in ℤ[[X]]. | conditional on coefficient gap |
| 902: HabiroRings.relativeHabiro_not_naive | Check, §5.1 | Cubic generator β in the quadratic mod5 factor obeys φ₅β=4β+2≠β, excluding naive stage. | conditional on coefficient gap |
| 918: HabiroRings.CompatibleRoots | API, §5.2 | m=1,3,6; p=2; Gaussian order4; ζ₃−ζ₆=2ζ₃; ordinary exponential roots instead give −1; τ₃(1−q³)=−3ζ₃²X−3ζ₃X²−X³; φ₂,₁(q+1)=X+2 | sound on instance |
| 919: HabiroRings.CompatibleRoots.standard | API, §5.2 | m=1,3,6; p=2; Gaussian order4; ζ₃−ζ₆=2ζ₃; ordinary exponential roots instead give −1; τ₃(1−q³)=−3ζ₃²X−3ζ₃X²−X³; φ₂,₁(q+1)=X+2 | sound on instance |
| 920: HabiroRings.coeffAlgebra | API, §5.2 | m=1,3,6; p=2; Gaussian order4; ζ₃−ζ₆=2ζ₃; ordinary exponential roots instead give −1; τ₃(1−q³)=−3ζ₃²X−3ζ₃X²−X³; φ₂,₁(q+1)=X+2 | sound on instance |
| 921: HabiroRings.taylorFactor | API, §5.2 | m=1,3,6; p=2; Gaussian order4; ζ₃−ζ₆=2ζ₃; ordinary exponential roots instead give −1; τ₃(1−q³)=−3ζ₃²X−3ζ₃X²−X³; φ₂,₁(q+1)=X+2 | sound on instance |
| 922: HabiroRings.canonicalMap | API, §5.2 | m=1,3,6; p=2; Gaussian order4; ζ₃−ζ₆=2ζ₃; ordinary exponential roots instead give −1; τ₃(1−q³)=−3ζ₃²X−3ζ₃X²−X³; φ₂,₁(q+1)=X+2 | sound on instance |
| 923: HabiroRings.frobeniusMap | API, §5.2 | m=1,3,6; p=2; Gaussian order4; ζ₃−ζ₆=2ζ₃; ordinary exponential roots instead give −1; τ₃(1−q³)=−3ζ₃²X−3ζ₃X²−X³; φ₂,₁(q+1)=X+2 | sound on instance |
| 924: HabiroRings.taylorComponent | API, §5.2 | m=1,3,6; p=2; Gaussian order4; ζ₃−ζ₆=2ζ₃; ordinary exponential roots instead give −1; τ₃(1−q³)=−3ζ₃²X−3ζ₃X²−X³; φ₂,₁(q+1)=X+2 | sound on instance |
| 925: HabiroRings.CompatibleRoots.sub_topologicallyNilpotent | API, §5.2 | m=1,3,6; p=2; Gaussian order4; ζ₃−ζ₆=2ζ₃; ordinary exponential roots instead give −1; τ₃(1−q³)=−3ζ₃²X−3ζ₃X²−X³; φ₂,₁(q+1)=X+2 | sound on instance |
| 926: HabiroRings.frobeniusMap_int | API, §5.2 | m=1,3,6; p=2; Gaussian order4; ζ₃−ζ₆=2ζ₃; ordinary exponential roots instead give −1; τ₃(1−q³)=−3ζ₃²X−3ζ₃X²−X³; φ₂,₁(q+1)=X+2 | sound on instance |
| 927: HabiroRings.CompatibleRoots.galoisEquiv | API, §5.2 | m=1,3,6; p=2; Gaussian order4; ζ₃−ζ₆=2ζ₃; ordinary exponential roots instead give −1; τ₃(1−q³)=−3ζ₃²X−3ζ₃X²−X³; φ₂,₁(q+1)=X+2 | sound on instance |
| 931: HabiroRings.CompatibleRoots.standard_two_adic | Check, §5.2 | ζ₆=−ζ₃, difference2ζ₃ has2-adic valuation1; usual exp roots have difference−1. | sound on instance |
| 932: HabiroRings.taylorComponent_value_ne_expansion | Check, §5.2 | Both root values0; expansions0 and−3ζ₃²X−3ζ₃X²−X³ differ. | sound on instance |
| 933: HabiroRings.coeffAlgebra_gaussian | Check, §5.2 | e maps to(1,0), 1−e to(0,1); dropping either factor loses a nonzero idempotent. | sound on instance |
| 934: HabiroRings.frobeniusMap_int_example | Check, §5.2 | q+1=X+2 after expansion at1; leaving X unchanged would giveX. | sound on instance |
| 935: HabiroRings.CompatibleRoots.galoisEquiv_neg_one | Check, §5.2 | Conjugation sends ζ₃ toζ₃² and −ζ₃ to−ζ₃²; both shifted-variable routes give q−ζ₃². | sound on instance |
| 936: HabiroRings.rex_needs_completion | Check, §5.2 | (ζ₃−1)²=−3ζ₃; powers tend0 3-adically, not in the discrete coefficient ring. | sound on instance |
| 937: At m=1 the compatible root is 1, C₁=R… | Check, §5.2 | ζ₁=1,C₁=R,T₁=R[[X]]; can(X)=X, φ₂,₁(q+1)=X+2. | sound on instance |
| 938: For R=0 every full coefficient algebra and Taylor… | Check, §5.2 | R=0 gives C_m=T_m=0; m=1 gives C₁=R, so no domain hypothesis. | sound on instance |
| 939: For toric A=R=ℤ[t], a⊗b↦ψ^m(a)b identifies R^(m) with A… | Check, §5.2 | t⊗1=1⊗tᵐ in the twisted tensor, maps to tᵐ; 1⊗t maps to t, proving surjectivity despite nonsurjective ψᵐ. | sound on instance |
| 967: For A=R=ℤ the prime-edge maps are coefficient extension… | Check, §5.4 | Integral coefficient Frobenius=id; q maps toζ_m+X_m, and both prime-edge routes retain q. | conditional on coefficient gap |
| 968: For R=0 both products and their equalizer are… | Check, §5.4 | Zero products/equalizer=0; Gaussian order4 factor=R×R, notR. | conditional on coefficient gap |
| 997: HabiroRings.relativeHabiro.stage_baseChangeEquiv | API, §5.6 | identity map, zero target, toric ℤ→ℤ[t]; id comparison=id; zero comparison=0≃0; completed base change contains ∑P_n tⁿ, ordinary H[t] has bounded t-degree | sound on instance |
| 998: HabiroRings.relativeHabiro.baseChangeEquiv | API, §5.6 | identity map, zero target, toric ℤ→ℤ[t]; id comparison=id; zero comparison=0≃0; completed base change contains ∑P_n tⁿ, ordinary H[t] has bounded t-degree | sound on instance |
| 999: HabiroRings.relativeHabiro.baseChangeEquiv_flat | API, §5.6 | identity map, zero target, toric ℤ→ℤ[t]; id comparison=id; zero comparison=0≃0; completed base change contains ∑P_n tⁿ, ordinary H[t] has bounded t-degree | sound on instance |
| 1003: For the identity Λ-map A→A, the comparison is… | Check, §5.6 | Identity comparison sends each element and projection to itself. | sound on instance |
| 1004: For R=0 or A′=0 the base-changed étale algebra… | Check, §5.6 | R=0 or A′=0 gives R′=0 and L_H(0)=0. | sound on instance |
| 1005: For A=R=ℤ and toric A′=ℤ[t], the series `Σ_{n≥0}P_n(q)t^n`… | Check, §5.6 | ∑P_n tⁿ has infinitely many nonzero t-coefficients, unlike every polynomial inH[t]. | sound on instance |
| 1019: HabiroRings.relativeHabiro.classicalEquiv | API, §5.7 | self pair ℤ; q modulo P₂; both rings have q inverse 1+q−q² mod P₂, since product equals 1; projection at q=1 gives ℤ | sound on instance |
| 1033: etale_localization_away_discr | API, §5.8 | F=ℚ,Δ=1; F=ℚ(i),Δ=2,1; discriminants 1,−4; first two rings étale; Δ=1 leaves 𝔽₂[i]=𝔽₂[ε]/ε², not étale; completion at an inverted prime=0 | S04 |
| 1034: etale_localization_away_of_prime_dvd | API, §5.8 | F=ℚ,Δ=1; F=ℚ(i),Δ=2,1; discriminants 1,−4; first two rings étale; Δ=1 leaves 𝔽₂[i]=𝔽₂[ε]/ε², not étale; completion at an inverted prime=0 | S04 |
| 1038: For F=ℚ and Δ=1, the ring is ℤ… | Check, §5.8 | discℚ=1, Δ=1 gives ℤ→ℤ=id, étale. | S04 |
| 1039: For F=ℚ(i), Δ=2 inverts the same discriminant primes… | Check, §5.8 | discℚ(i)=−4; radical hypothesis atΔ=2 holds, while −4∤2. | S04 |
| 1040: For F=ℚ(i), Δ=1 leaves the ramified prime 2… | Check, §5.8 | AtΔ=1, mod2 gives 𝔽₂[ε]/ε², not étale; atΔ=2 the2-completion is0. | S04 |
| 1056: HabiroRings.relativeHabiro.numberFieldEquiv | API, §5.9 | F=ℚ,Δ=1,2; F=ℚ(i),Δ=2; κ is identity classical comparison for ℚ; Δ=2 kills 2-adic edges; Gaussian coefficient ring at4 is R×R on both sides | conditional on number-field gap |
| 1060: For F=ℚ and Δ=1, κ is the classical… | Check, §5.9 | F=ℚ,Δ=1 givesH; Δ=2 gives zero2-adic gluing and nonzero idempotents by valuation. | conditional on number-field gap |
| 1061: For F=ℚ(i), the order-four coefficient ring over ℤ[i][1/2]… | Check, §5.9 | Both sides atorder4 have coefficient ringR×R and idempotents(1,0),(0,1). | conditional on number-field gap |
| 1087: HabiroRings.completedScalarExtension | API, §6.1 | M=0,H,H²; f=id; q² quotient after inverting2; base changes 0,H′,(H′)²; id*=id; quotient becomes R[q]/(q²−1)=R×R for R=ℤ[1/2] | sound on instance |
| 1088: HabiroRings.completedScalarExtension.adjunction | API, §6.1 | M=0,H,H²; f=id; q² quotient after inverting2; base changes 0,H′,(H′)²; id*=id; quotient becomes R[q]/(q²−1)=R×R for R=ℤ[1/2] | sound on instance |
| 1089: HabiroRings.completedScalarExtension.monoidal | API, §6.1 | M=0,H,H²; f=id; q² quotient after inverting2; base changes 0,H′,(H′)²; id*=id; quotient becomes R[q]/(q²−1)=R×R for R=ℤ[1/2] | sound on instance |
| 1090: HabiroRings.completedScalarExtension.map_id | API, §6.1 | M=0,H,H²; f=id; q² quotient after inverting2; base changes 0,H′,(H′)²; id*=id; quotient becomes R[q]/(q²−1)=R×R for R=ℤ[1/2] | sound on instance |
| 1091: HabiroRings.completedScalarExtension.map_comp | API, §6.1 | M=0,H,H²; f=id; q² quotient after inverting2; base changes 0,H′,(H′)²; id*=id; quotient becomes R[q]/(q²−1)=R×R for R=ℤ[1/2] | sound on instance |
| 1092: HabiroRings.completedScalarExtension.perfect | API, §6.1 | M=0,H,H²; f=id; q² quotient after inverting2; base changes 0,H′,(H′)²; id*=id; quotient becomes R[q]/(q²−1)=R×R for R=ℤ[1/2] | sound on instance |
| 1093: HabiroRings.completedScalarExtension.quotient | API, §6.1 | M=0,H,H²; f=id; q² quotient after inverting2; base changes 0,H′,(H′)²; id*=id; quotient becomes R[q]/(q²−1)=R×R for R=ℤ[1/2] | sound on instance |
| 1094: HabiroRings.picMap | API, §6.1 | M=0,H,H²; f=id; q² quotient after inverting2; base changes 0,H′,(H′)²; id*=id; quotient becomes R[q]/(q²−1)=R×R for R=ℤ[1/2] | sound on instance |
| 1095: HabiroRings.picMap_eq | API, §6.1 | M=0,H,H²; f=id; q² quotient after inverting2; base changes 0,H′,(H′)²; id*=id; quotient becomes R[q]/(q²−1)=R×R for R=ℤ[1/2] | sound on instance |
| 1099: HabiroRings.completedScalarExtension_id | Check, §6.1 | id*H=H and Pic(id)([L])=[L]. | sound on instance |
| 1100: HabiroRings.completedScalarExtension_quotient_example | Check, §6.1 | R=ℤ[1/2]: R[q]/(q²−1)=R×R, since2 is a unit. | sound on instance |
| 1101: HabiroRings.directSum_not_habiroComplete | Check, §6.1 | ∑P_n e_n has infinitely many nonzero coordinates but finite support mod everyP_k. | sound on instance |
| 1102: HabiroRings.completedScalarExtension_free | Check, §6.1 | n=0 gives0; n=1 givesH′; n=2 gives(H′)². | sound on instance |
| 1103: HabiroRings.completedScalarExtension_adjunction_unit | Check, §6.1 | Hom(H′,N)≃N by evaluation at1; adjunction sends n to n. | sound on instance |
| 1117: HabiroRings.transportedRegulator | API, §6.2 | ξ=0, ξ+(−ξ); F=ℚ(i),Δ=12; M₀=H; M_ξ⊗M_−ξ≃H; 6 and −4 divide12 but24 does not; coefficient ring is ℤ[i][1/6] | S06; conditional on line gap |
| 1121: For ξ=0 the transported line is H with… | Check, §6.2 | M₀=H; M_ξ⊗M_−ξ≃H gives Picard sum0. | S06; conditional on line gap |
| 1122: Taking Δ=6·∣disc(F)∣ meets both source restrictions. Taking Δ=∣disc(F)∣… | Check, §6.2 | Forℚ, disc1 allowsΔ1 for the ring but not lines; Δ6 inverts2,3. Forℚ(i),Δ12 meets separate divisibilities. | S06; conditional on line gap |
| 1123: Neither a free p-adic section at each prime… | Check, §6.2 | Changing local generators1 to−1 changes their gluing coordinates; a bare Picard class has no chosen evaluator. | S06; conditional on line gap |
| 1137: HabiroRings.qMinusOneCompletion | API, §6.3 | q,q²; zero ring; ℤ[1/2] idempotent in second factor; q↦1+X; q²↦1+2X+X²; 0→0; e≠0 supported at v₂(order)=1 maps to0 | sound on instance |
| 1141: For R=ℤ the classical Taylor map is injective.… | Check, §6.3 | Idempotent e supported atv₂(order)=1 is nonzero but c(e)=0; integral classical c is injective. | sound on instance |
| 1142: The zero coefficient ring gives the unique zero… | Check, §6.3 | Zero coefficients: unique0 map; composing Taylor with constant coefficient sends q↦1. | sound on instance |
| 1143: Over ℤ the polynomial q maps to 1+X… | Check, §6.3 | q²↦(1+X)²=1+2X+X²; sign reversal would give coefficient−2. | sound on instance |
| 1159: OrderOneFibre.map_eq_eval | API, §6.4 | unit evaluator, negative evaluator, zero evaluator; values at1⊗3 are3,−3,0; inverse unit is1,−1,absent over ℤ; over zero ring 0=1 and unique map is an equivalence | S01/S02 |
| 1160: OrderOneFibre.inverse_one | API, §6.4 | unit evaluator, negative evaluator, zero evaluator; values at1⊗3 are3,−3,0; inverse unit is1,−1,absent over ℤ; over zero ring 0=1 and unique map is an equivalence | S01/S02 |
| 1161: OrderOneFibre.coordinates | API, §6.4 | unit evaluator, negative evaluator, zero evaluator; values at1⊗3 are3,−3,0; inverse unit is1,−1,absent over ℤ; over zero ring 0=1 and unique map is an equivalence | S01/S02 |
| 1162: OrderOneFibre.unique | API, §6.4 | unit evaluator, negative evaluator, zero evaluator; values at1⊗3 are3,−3,0; inverse unit is1,−1,absent over ℤ; over zero ring 0=1 and unique map is an equivalence | S01/S02 |
| 1163: OrderOneFibre.rescale | API, §6.4 | unit evaluator, negative evaluator, zero evaluator; values at1⊗3 are3,−3,0; inverse unit is1,−1,absent over ℤ; over zero ring 0=1 and unique map is an equivalence | S01/S02 |
| 1164: OrderOneFibre.naturality | API, §6.4 | unit evaluator, negative evaluator, zero evaluator; values at1⊗3 are3,−3,0; inverse unit is1,−1,absent over ℤ; over zero ring 0=1 and unique map is an equivalence | S01/S02 |
| 1165: OrderOneFibre.trivialization | API, §6.4 | unit evaluator, negative evaluator, zero evaluator; values at1⊗3 are3,−3,0; inverse unit is1,−1,absent over ℤ; over zero ring 0=1 and unique map is an equivalence | S01/S02 |
| 1169: OrderOneFibreTests.identity | Check, §6.4 | Tensor-unit map sends1⊗3↦3; overℤ×ℤ sends1⊗(2,3)↦(2,3). | S01/S02 |
| 1170: OrderOneFibreTests.negativeUnit | Check, §6.4 | Negative evaluator sends1⊗3↦−3, not3. | S01/S02 |
| 1171: OrderOneFibre.zeroEvaluation | Check, §6.4 | Zero evaluator has image{0}, excludes1 overℤ; over zero ring1=0, so nonzero control matters. | S01/S02 |
| 1185: completedRegulatorTriviality | API, §6.5 | P=R[[X]]; R=ℤ×ℤ; R=0; lifts 1 and1+X both have constant1 but differ; (1+X)⁻¹=1−X+X²−⋯; product ring need not be local; zero ring unique module=0 | sound on instance |
| 1189: For P=R[[X]] and the identity fiber marking, any… | Check, §6.5 | 1 and1+X both reduce to1 and are unequal units; inverse of1+X is1−X+X²−⋯. | sound on instance |
| 1190: Take R=ℤ×ℤ, which is not local. The same… | Check, §6.5 | ℤ×ℤ has distinct maximal ideals, but the trivial module quotient isℤ×ℤ and lifts to its power-series module. | sound on instance |
| 1191: For R=0 the unique module and both equivalences… | Check, §6.5 | R=0 yields P=0 and unique equivalence0≃0; local trivializations alone do not choose a global integral marking. | sound on instance |
| 1205: HabiroRings.transportedRegulator_completed | API, §6.6 | ξ=0; pair ξ,−ξ; zero coefficient ring; completed Picard classes 0, [M]+[M⁻¹]=0,0; trivializations need not be unique since 1 and1+X have equal constant1 | conditional on line/evaluation gaps |
| 1219: HabiroRings.transportedRegulator_scalar | API, §6.7 | identity embedding; ℚ→ℚ(i), common Δ=6; composition; unit section1↦1↦1 equals composite1↦1; Δ=6 omits discriminant multiplicity4 but inverts the same primes; declared divisibility-by-discriminant contract uses Δ=12 | S06; conditional on naturality gap |
| 1223: The identity field embedding gives the tensor-unit isomorphism.… | Check, §6.7 | Identity transports1↦1; two identity/composed embeddings also send1↦1 and preserve tensor unit. | S06; conditional on naturality gap |
| 1224: A common Δ divisible by 6 and both… | Check, §6.7 | Forℚ→ℚ(i),Δ12 admits both rings; tensor over unlocalized integers does not already invert2,3. | S06; conditional on naturality gap |
| 1274: For R=ℤ the equivalence exists and the forced… | Check, §7.4 | Onℤ, completedφ₃(3)=3 and globalidentity(3)=3. | S10 |
| 1275: For R=ℤ[∛2][1/6] and p=5 the global generator would… | Check, §7.4 | β²=2β+1 impliesβ⁵=4β+2≠β, contradicting the forced global map. | S10 |
| 1276: At m=1 there is no p∣m, so qW₁(R)=R… | Check, §7.4 | m=1 has no prime divisors; qW₁(R)=R, so the general equivalence alone cannot imply a prime Frobenius. | S10 |

### Suggested.lean declaration and binder ledger

All names below are in `TauCetiRoadmap.HabiroRings`. I compared the twelve supplied elaborated named signatures with the source and README, and separately inspected the local instance and all eight examples. I did not run Lean. No dropped section binder was found. In particular, the completed-line conclusion retains both invertibility and the actual quotient equivalence; the ordinary mapping theorem retains finite generation of I and completeness of C.

| Declaration / line | Section; actual variable and instance context | Instance; computed values | Result / repair |
|---|---|---|---|
| EtaleDeformation.reduceMap, 48 | §0.1; B:u, E:v, E′:w commutative; B-algebras; I; D,D′ quotient-algebras; two actual markings; g | Same marking: ε id ε⁻¹(3)=3; target swap: (1,0)↦(0,1) | True; unnecessary definition, S02 |
| example, 59 | Same context; no étaleness needed for this algebraic identity | ε id ε⁻¹=id, value3=3 | S02; accompanying rank claim S07 |
| example, 66 | Same context plus Nontrivial(B/I); target split algebra | (1,0)↦(0,1)≠(1,0); zero quotient would make inequality false | S02 |
| EtaleDeformation.exists_lift, 78 | §0.2; B:u commutative, arbitrary I, D:v étale over B/I; E in CommAlgCat at max(u,v) | I=0: E=D; I=B: D=0 admits E=0; quadratic mod2 lift has discriminant−3 inverted | Sound; no uniform nilpotence/finite-generation assumption added |
| CompletedEtaleLift.mapUnique, 101 | §0.5; B:u,E:v,C:w commutative B-algebras; E étale; I.FG; C complete for mapped ideal; actual g | E=B=ℤ, I=(2): C=ℤ₂ or 𝔽₂ gives one map; C=ℤ has none since3 would become invertible | Sound; not a one-lemma copy because the domain is the completed E |
| OrdinaryDerivedComparison.laurent_regular, 117 | §2.4; R:u commutative, M:v additive group and R-module; m>0 explicit | R=M=𝔽₂,m=2: (q²−1)·1=q²+1≠0; m=0 sends1 and0 to0; M=0 gives injective singleton map | Sound; induced Laurent module is essential |
| CyclotomicIndex.primeChain, 144 | §3.2; m,d,p:ℕ only; total definition | (4,1,2)↦{1,2,4}; (0,1,2)↦{1}; (4,0,2)↦{0}; (4,3,0)↦{3} | Sound; three boundary conventions computed |
| example, 148 | Closed decidable finset equality | {1,2,4}={1,2,4} | Delete small-value padding, S09 |
| example, 152 | Closed boundary conjunction | Four sides evaluate to {3},{1},{0},{3} respectively | Delete, S09 |
| CyclotomicIndex.vertices, 163 | §3.2; m:ℕ only | Counts at0,1,2,4,6,12 are0,1,3,4,8,11; {1,4} excluded at4 | Sound; inclusion order differs from divisibility |
| example, 169 | Closed boundary conjunction | vertices1={{1}}; vertices0=∅ | Delete, S09 |
| example, 177 | Closed mixed-order finset conjunction | P4 has4 vertices, P6 has8, P12 has11; singleton inclusions both false | Nontrivial convention test of kept definitions |
| CyclotomicIndex.height_one, 186 | §3.3; m>0; S,T,U:Finset ℕ; all three memberships; both inclusions | S={1},T=U={1,2,4}: disjunction false∨true; m=1: true∨true | Sound; at m=0 membership is impossible, so positivity could be omitted but is appropriate scope |
| etale_localization_away_discr, 198 | §5.8; F:u field and NumberField; Δ:ℤ nonzero; discr F∣Δ; R:v commutative, O_F-algebra, localization away Δ | ℚ,Δ1 gives ℤ; ℚ(i),Δ4 gives ℤ[i][1/2] | True; immediate from next theorem, delete S04 |
| etale_localization_away_of_prime_dvd, 206 | Same; prime-support implication replaces divisibility | ℚ(i),Δ2 qualifies, Δ1 fails; residual i+1 is nonzero square-zero at2 before localization | Sound; retains ordinary étale finite-presentation target |
| OrderOneFibre.trivialization, 226 | §6.4; H:u,R:v commutative, R H-algebra; M:u additive H-module and invertible; actual R-linear evaluator with preimage1 | Evaluators ±identity give±3; zero gives0≠1 overℤ; zero ring has unique isomorphism | True; native bijectivity criterion; delete S02 |
| OrderOneFibre.zeroEvaluation, 235 | No hidden section variables; fixed ℤ tensor ℤ | Image{0}, so 1 not in image | Delete S01 |
| example, 240 | R:u commutative, r:R; tensor-unit evaluator | r=3 gives3; R=ℤ×ℤ,r=(2,3) gives(2,3) | Delete S02 |
| example, 246 | Fixed integers; negative tensor-unit evaluator | Input1⊗3 gives−3; preimage of1 is1⊗(−1) | Delete S02 |
| completedLineCoeffAlgebra, 257 | §6.5; R:u, CommRing R explicit in instance type | X acts as0; constant3 acts by multiplication by3 | Sound; necessary scalar convention |
| completedRegulatorTriviality, 265 | R:u commutative; P:v additive group, PowerSeries R-module and invertible; Nonempty(P/XP≃ₗ R), R acted on via constant coefficient | P=R[[X]], R=ℤ×ℤ: quotientR; generators1,1+X distinct but both units; R=0 gives0≃0 | Sound; no local/Noetherian hypothesis needed |

### Headline coverage

| README milestone | Acceptance status |
|---|---|
| Arbitrary-ideal étale object lifting; ordinary completed mapping property (§§0.2,0.5) | Stated with their full ordinary hypotheses. |
| Regular-principal enhanced uniqueness (§0.6) | Not statable with only ordinary algebra carriers; needs the enhanced complete algebra category and marked mapping fibre. |
| Laurent/completion equivalence, homotopy criterion and ordinary/derived comparison (§§2.1–2.4) | Enhanced comparisons unavailable; positive Laurent regularity stated. The ordinary resolution can be stated: S05. |
| Spherical completion and its homotopy detection (§§2.6–2.7) | Missing spectral module/algebra carriers. |
| Solid embedding, unit idempotence, countable tensor and bounded-below closure (§§2.8–2.12) | Missing light solid spectral carriers; ordinary proper-profile milestone is statable: S05. |
| Prime-chain height (§3.3) | Stated using real native finset definitions. |
| General coherent finite descent and prime-edge mapping spaces (§§3.5–3.6) | Missing enhanced categories, coherent localizations and mapping-space limits. |
| Relative-ring quotients, full Taylor equalizer and completed coefficient base change (§§5.1–5.6) | Missing supplied relative Habiro and q-Witt carriers. |
| Classical/GSWZ comparisons (§§5.7,5.9) | Missing the comparison ring carriers; ordinary number-field étaleness is stated at the full radical generality. |
| Completed scalar extension and actual indexed-line transport (§§6.1–6.7) | Missing complete-module/indexed-line carriers; general completed-line triviality is stated. Module-docstring inventory needs S08. |
| Naive-quotient Frobenius obstruction (§7.4) | Missing q-Witt carrier; must be named among unavailable headlines, not replaced by a theorem about arbitrary scalars. |

### Supplier-contract statements and Checks

These are conditional imported contracts, not alternative constructions owned here.

| README statement | Instance and computed values | Result |
|---|---|---|
| 103: prime-generator Check | m=1: 0≠(q−1); m=2: generator1+q=Φ₂; m=6: (1+q²+q⁴)−q(1+q³)=q²−q+1 | Correct boundary repair |
| 104: absolute versus relative Check | At q=−1, absolute image lies in ℤ[T²], excludes T; relative self-ring contains T | Correct distinction |
| 105: completed Frobenius Check | i³=−i mod3; i⁵=i mod5; φ₃(i)=−i and φ₅(i)=i | Correct coefficient convention |
| 113: reflection and tower | M=0 gives0; localized B gives0 despite1≠0; q=1 on ℤ gives ℤ | Conditional, not vacuous identity on all modules |
| 123: unit Check | q(1+q−q²)−1=−P₂, so product=1 in the second quotient | Correct |
| 124: divisibility indexing Check | q²−1 does not divide q³−1; q^m−1 divides q^(m! )−1 for positive m | Correct; size order is wrong |
| 125: derived quotient Check | ℤ with q=1 has derived quotient ℤ⊕Σℤ; π₁=ℤ versus0 for underived quotient | Correct |
| 129: detection | Complete0 has all reductions0; noncomplete R_r also has all reductions0 but is nonzero | Completeness necessary |
| 135: localization Check | R_r/Φ_d=0 for every d; R_r≠0 and L_H R_r=0 | Correct |
| 136: staticity Check | Static ℤ at q=1 has π₁(ℤ/ᴸ(q−1))=ℤ | Converse correctly rejected |
| 140: completed tensor | Unit H gives H⊗̂H=H; orders2,3 give π₀=π₁=ℤ | Conditional; higher Tor retained |
| 146: finite descent datum | m=1 gives one category; m=6 has nonzero {1,2} overlap and zero {1,6} overlap | Conditional |
| 148: reconstruct | m=1 reconstructs E₁; zero section reconstructs0 | Conditional |
| 149: maps | m=1 comparison product is a point; mapping-space limit=Map(E₁,F₁) | Conditional |
| 150: arithmetic fracture | m=2,p=2 gives one common2-complete piece; after inverting2 gives two completed factors | Conditional; rational completion retained |
| 151: divisor restriction | m=2,n=1 sends q to q; on quotient q²−1=0 becomes q−1=0 | Correct direction |
| 152: naturality | Coefficient conjugation sends i↦−i on both projection routes, q↦q | Conditional on relevant naturality |
| 160: reduced-index Check | At4, the {1,4} overlap is (2,q−1)-complete and reconstructed through1→2→4 | Correct |
| 161: nonoverlap Check | Φ₆(1)=1; Φ₆−qΦ₁=1, so {1,6} category=0 | Correct |
| 162: self/zero reconstruction Check | Self sections reconstruct A[q]^∧_(qᵐ−1); zero sections reconstruct0 | Conditional |
| 163: rational completion Check | ∑tʳ/2ʳ has unbounded denominator exponents; no single 2ᴺ clears them | Correct |
| 167/169: marked coefficient stage | m=1 gives R[[q−1]], R=0 gives0 | Conditional |
| 170: uniqueness | Split unmarked lift has swap≠id when A≠0; fixed marking excludes swap | Marking necessary |
| 171: ghost | Self twist maps a⊗b toψᵈ(a)b; toric t⊗1 maps to tᵈ, not t | Correct scalar direction |
| 172: transition | m=6,n=2 uses F₃ with target qW₂; target index is not3 | Corrected source misprint not propagated |
| 173: limit | Zero input gives static0; self ℤ gives H with first completion ℤ[[q−1]] | Conditional |
| 181: order-one Check | ℤ[1/2][[h]] contains ∑hⁿ/2ⁿ; ℤ[[h]][1/2] does not | Correct |
| 182: marking Check | Split transposition sends(1,0) to(0,1), unequal for nonzero A | Correct |
| 183: quotient/lift Check | Static A[q]/f has π₁ of derived reduction equal to A[q]/f; the completed flat lift has π₁=0 | Correct |
| 184: Frobenius Check | At m=6,d=2, transition has Frobenius index3 and target2; ordinary Witt restriction is a different operation | Correct |

The bold mathematical phrase “specified overlap equivalence” at README:767 is tested by the wrong-overlap/diagonal example at 794 above. The bold standing hypothesis at 31 is tested by the toric translation and the non-étale mod-2 Gaussian algebra. Other bold spans are supplier labels, Check headings, pins, consumer names or bibliography entries; their associated claims are covered by the supplier and source tables below, not counted as additional independent theorems.

### Declared gaps and ownership

All ten plan slugs occur identically in README's supplier-contract declarations; each has a named supplier. The needs sentences are read with their explicit expanded contracts: the spectral tower, realization and countability hypotheses are retained, as are the arithmetic support and integral-evaluation hypotheses. These are coherent interfaces, not unspecified promises to prove the eventual HabiroRings conclusion. No gap requests an existing pinned implementation of the same object.

| Gap | Discriminating instance/value | Ownership result |
|---|---|---|
| habiro-completion | Localized B maps to0; ℤ at q=1 staysℤ | Enhanced specialized reflection is conditional upstream; Laurent comparison remains here |
| cyclotomic-descent | m=1 one vertex; m=4 maximal chain has3 entries | Specialized cyclotomic descent upstream; general coherent localization descent and index combinatorics here |
| etale-habiro-coefficients | m=1 gives full R[[h]], not bounded-denominator localization | Upstream marked stages; ordinary presentation and pair functoriality here |
| completed-frobenius-base-naturality | ℤ→toric ℤ[t] transports i↦−i at3 and fixes q | Current QWittVectors §6.1 covers fixed-base naturality; cross-base coherence remains an actual gap |
| cyclotomic-prime-ideal | m=1 empty ideal0; m=6 generators reduce toΦ₆ | HC §4.1 supplies pairwise intersections; prime-generator theorem is separately required, also acknowledged by QWittVectors |
| light-solid-spectra | π₁ sphere=𝔽₂, unlike ordinary abelian unit; countable profile family has no proper common lower bound | LightCondMod and VS2.1 do not supply this spectral/tower contract |
| number-field-ring | Gaussian order4 coefficient algebra has two factors | Ordinary GSWZ object upstream; comparison here |
| number-field-lines | Unit index gives H; inverse pair gives tensor H | Actual indexed objects/pairings upstream; transport here |
| integral-linear-jet | Evaluation of specified section=1; zero evaluator gives0≠1 overℤ | Arithmetic evaluator upstream; native invertible-module argument is already in Mathlib |
| arithmetic-line-naturality | Identity sends section1 to1; common Δ12 works for ℚ→ℚ(i) | Supported arithmetic maps/coherences upstream; scalar transport here |

Ownership searches used the roadmap service and local object searches in main, Completed, board packages and all nineteen supplied open checkouts. No duplicate fully qualified declaration from this Lean file was found. Hits in ArithmeticKTheory concern Galois-cohomological cyclotomic descent; ArithmeticDynamics concerns local power-series dynamics; neither owns these carriers. QWittVectors and QSeriesPartitionsAndMockModularForms own the imported arithmetic and Gaussian objects, with the stale-name issue S03. HC §5.3 already supplies the component decomposition used as the §7.2 example. GeneralizedCohomology/Bordism/EnhancedDerivedSheaves own generic spectra and enhancement; HabiroRings only owns the specialized localization comparisons. Generic derived completion and nil-ideal invariance remain with the cited owners.

| Supplier citation checked at current accessible version | Evidence and scope |
|---|---|
| QWittVectors §§1.1–6.3 | Supplied open README:305,357,381,713,731,747,789,811,834: Λ-rings, perfection, coverage, étale pushouts/completion and Frobenius. Missing identifier spellings are S03. |
| QSeriesPartitionsAndMockModularForms §3.1 | Supplied open README:399–408: arbitrary-ring integral Gaussian identity; no exported gaussianRectangle_product identifier. |
| ArithmeticStatisticsPartIV §3.2 | Current roadmap README:130: Gaussian polynomial and product/Pascal laws; source of the underlying polynomial, not the integral rectangle extension. |
| HabiroCyclotomicCompletions §§1.1,1.4,2.3,3.1,3.3,4.1,4.3,5.1,5.3 | Current README:217,581,879,937,1064,1165,1314,1954,2178: actual q-factorial, Laurent, root, ideal, module and component interfaces. Close roots require compatible prime-to-p parts; domain/injectivity conclusions retain separation assumptions. |
| DerivedModuleAlgebra §§1.1–1.5 | Main README:1573,1666,1693,1733,1788,1808: enhanced module input, completion, Nakayama, Koszul and ordinary comparison; bounded torsion/regularity not dropped. |
| DerivedDeRhamCohomology §1.12 | Current README:596: algebraization theorem. Scope deferral only; no need to rebuild it here. |
| SchemeAndStackFoundations §0.23a | Main README:1510–1543: universal-homeomorphism étale equivalence includes elementwise nil ideals. |
| EnhancedDerivedSheaves E0.7, E2:towers, E3.2, E5:abstract.2–3, E5:presentability.2, E5:spectra-comparison | Main README:364,1296,1179,1472,1624,1846,1870: coherent sections, towers, localization/algebra objects and concrete comparison; generic foundations delegated to Bordism. |
| BordismFormalGroups F6.5 | Main README:1526 onward: categorical models, marked straightening, coherent limits and monoidal/enhanced structures. |
| GeneralizedCohomology G2.1–G2.7 | Main G2 numbered items: concrete simplicial/symmetric spectra and ring/module models; not itself a solid spectral category. |
| StableHomotopyKTheory §5.18 and Layer 6 | Current README:2098 and2134: connective comparison versus K-theory assembly; old H.5/H.6 labels require S12. |
| PrismaticCohomology PR.0 | No such label in current roadmap; its Layer0 starts at306. Remove unused dependency under S12. |
| VStackSheavesAndLisseCategories VS2.1 | Current README:603 onward: abelian/derived solid coefficient interface; does not supply the full spherical light-solid contract. |

### Source-locator audit

The following 38 locator groups were checked against the twelve provided legal cached texts. No source passage is reproduced. Grouping adjacent numbered results avoids counting repeated citations as independent verifications.

| Source / locator group | Extraction witness and result |
|---|---|
| Hab §7.1, Proposition7.1 and Laurent comparison | Hab lines665,683: q is invertible in the full cyclotomic completion; matches Laurent convention. |
| Hab §7.3 | Hab line764: coefficient-module completion and functoriality. |
| Stacks04D1, 10.143.10 | Stacks04D1 line18048: arbitrary-ideal étale object lift; determinant-inversion construction at18054. |
| Stacks0ALI, 15.11.2 | Stacks0ALI line1299: locally nilpotent ideal equivalence; no common nilpotence exponent. |
| Stacks0ALI, 15.93.18 / 0920 | Stacks0ALI line12293: finite-generator Koszul completion comparison. |
| Q 1.22(e) | Q line493: perfect coverage and its faithful-flatness conditions. |
| Q Setup2.1 | Q line524: derived support-completion category and its tensor. |
| Q Lemma2.2 | Q line546: finite descent under cover hypotheses. |
| Q Remark2.3 | Q line575: passage to finitely generated closed supports. |
| Q Corollary2.4 and Remark2.5 | Q lines583,601: reduced prime-chain diagram and its overlaps. |
| Q 2.6–2.7 | Q lines619,647: fracture and completed coefficient Frobenius. |
| Q Theorem2.9 and Remark2.10 | Q lines659,679,727: marked stages, proof and Frobenius transitions; standing étaleness is at512. |
| Q 2.11 | Q line734: compatible roots and re-expansion. |
| Q Lemma2.12 | Q line750: full Taylor comparison; its finite-field irreducibility error is corrected by the four-factor example. |
| Q Corollary2.13 and Remark2.14 | Q line821: discriminant-localized coefficients and resulting ring comparison. |
| Q Theorem3.11(a), Corollary3.13 | Q lines1089,1174: cohomological comparison remains with the supplier; not reproved here. |
| Q TheoremA.1 | Q line3141: smooth q-de Rham functor over torsion-free Λ-bases. Background for pair naturality, not a theorem defining the category of arbitrary pairs. |
| Q B.1 | Q line3545: spherical localization and completion setup. |
| Q LemmaB.2 | Q line3562: reflection, two-term localization resolution and homotopy criterion; differential at3599 needs the package's corrected sign/index. |
| Q LemmaB.3, CorollaryB.4, RemarkB.5 | Q lines3607,3626,3637: reduction detection and individual homotopy degrees. |
| Q B.6–B.7 | Q lines3643,3658: light condensed/solid completion and embedding. |
| Q B.8 and proof | Q lines3666,3672,3688,3693,3713: product/tower, countable-subset argument, factorial profiles and separable bounds. Extra spectral inputs remain declared. |
| W Lemmas2.1–2.2 | W lines305,320: intersections; prime-generated ideal has the m=1 exception found previously. |
| W Lemma2.46 and Remark2.47 | W lines1583,1621: Λ-base change, perfect coverage and relative comparison. |
| W Proposition2.48 and Corollary2.51 | W lines1651,1713: étale preservation and pushouts. Frobenius target must be W_d; displayed line1656 has the source misprint. |
| W Corollary2.52 and proof | W line1739: injective R→R̂_p, p∣m and marked ℤ[q]-comparison are essential; proof at1747–1780. |
| H §§1–2 | H lines223,711,753,763,787,1046: ghosts, comonad, coalgebras, Adams/exterior-coordinate distinction and cofree adjunction. |
| B §§1.17–1.18 | B lines603,615,628: arithmetic Λ interpretation and free adjunction. |
| G Definition1.1 | G line255: discriminant-localized ring and full Taylor/Frobenius data. |
| G Definition1.4, Theorem2 and §3.3 proof | G lines410,426,2213: lines and tensor multiplication with the extra prime exclusions. |
| G Proposition1.5(f), §3.3 proof | G lines471,2285: first-fiber motivation; does not replace the separately declared integral global evaluator. |
| Bosco PropositionA.3, LemmaA.4 | Bosco lines3459,3488: abelian p-adic boundedness and null-family calculation; not unrestricted spectral tower compatibility. |
| T paragraphs5.1–5.3 | T lines3797,3812,3832: scalar category, p-completion and compact generator; manifest placement needs S13. |
| HA Proposition2.2.1.9 | HA line7363: compatible monoidal localization. |
| HA Corollaries3.2.2.4–3.2.2.5 | HA lines13535,13543: limits of algebra objects. |
| HA Theorem7.1.2.13 | HA line46530: symmetric monoidal ordinary-derived/HR-module comparison. |
| HA Definition7.1.3.17, Proposition7.1.3.18 | HA lines46752,46757: static algebra mapping spaces. |
| MW §4.1, paragraph4.1 | MW lines1748–1763: discrete embedding, Null criterion and monoidal solidification; no claim that it proves the extra tower contract. |

## Verified sound

Read all **1,373 README lines** and **308 Suggested.lean lines**, the repository rules, both earlier reviews and the repair report. The audit records **21 Lean declarations** (four definitions, one local instance, eight theorems, eight proved examples), **46 numbered mathematical targets**, **170 API bullets** including the ten supplier-interface bullets, and **154 explicit Checks** including sixteen in the supplier contracts. These counts describe the inventory, not 216 independent headline theorems. The tables give the computations and flag conditional or defective rows. All bold mathematical targets are represented; bold bibliography, pins and owner labels are separately resolved.

Verified **38 source-locator groups across twelve source entries**, **thirteen accessible supplier-roadmap citation groups**, and the matching declarations of **ten gaps**. Ownership searches also covered all **nineteen supplied open checkouts**, main, Completed and board packages. No false admitted Lean theorem or lost standing binder was found. The finite prime-chain repair, m=1 prime-ideal repair, locally nilpotent invariance import, principal regularity qualification, full Taylor coefficient algebras, Frobenius normalization, derived Tor example and completed-line theorem withstand the recorded boundary tests. The four lifted roots were also independently evaluated modulo 11⁴: their residues are (3,0),(4,0),(5,0),(9,0), recording (root mod11, Φ₅(root) mod11⁴).

Pinned-definition and proof-route checks included:

- `Algebra.Etale` retains finite presentation and formal étaleness (`Mathlib/RingTheory/Etale/Basic.lean:205`). The ordinary lift uses `Algebra.Etale.iff_isStandardSmoothOfRelativeDimension_zero` at `Mathlib/RingTheory/Smooth/StandardSmoothOfFree.lean:90` and `Algebra.SubmersivePresentation.isStandardSmoothOfRelativeDimension` at `Mathlib/RingTheory/Smooth/StandardSmooth.lean:104`.
- Complete-target existence and separation-based uniqueness are `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete` (`Mathlib/RingTheory/Smooth/AdicCompletion.lean:94`) and `Algebra.FormallyUnramified.ext_of_iInf` (`Mathlib/RingTheory/Unramified/Basic.lean:161`). `AdicCompletion.isAdicComplete`, `pow_smul_top_eq_ker_eval` and `ker_evalOneₐ_eq_map` retain I.FG (`Mathlib/RingTheory/AdicCompletion/Completeness.lean:181`, 151, 195). The source actually defines the completion as compatible quotient data (`Mathlib/RingTheory/AdicCompletion/Basic.lean:171`); it is not a new sorry-defined carrier here.
- Native `Module.Invertible` means bijectivity of the dual contraction (`Mathlib/RingTheory/PicardGroup.lean:77`), not merely a claimed rank. Its bijective-of-surjective criterion is at276, free-equivalence criterion at236 and Picard scalar maps/laws at the end of that file. The completed-line proof needs Jacobson control and finite-generation Nakayama: `LinearMap.surjective_of_surjective_comp_mkQ` is at `Mathlib/RingTheory/Nakayama.lean:228`; power-series unit control is at `Mathlib/RingTheory/PowerSeries/Inverse.lean:109`. This is a real assembly theorem rather than the zero-evaluator padding.
- The discriminant test is `NumberField.not_dvd_discr_iff_isUnramifiedIn` (`Mathlib/NumberTheory/NumberField/Discriminant/Different.lean:191`); final étale assembly retains finite presentation, flatness and formal unramifiedness through `Algebra.Etale.of_formallyUnramified_of_flat` (`Mathlib/RingTheory/Smooth/Fiber.lean:245`).
- The finite-index prerequisites exist: `Nat.divisors` has its total finset definition at `Mathlib/NumberTheory/Divisors.lean:52`; `Nat.Prime.factorization_pow` is at `Mathlib/Data/Nat/Factorization/Defs.lean:240`; `Nat.exists_eq_pow_mul_and_not_dvd` is at `Mathlib/Data/Nat/Factorization/Basic.lean:279`. `CategoryTheory.Nerve.quasicategory` is the instance at `Mathlib/AlgebraicTopology/Quasicategory/Nerve.lean:32`; the general nerve fact is imported, not a new acceptance theorem.
- Cyclotomic divisor and separability inputs are at `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:337`, 347, 652, with positive-index and characteristic hypotheses retained. Rational irreducibility at `Mathlib/RingTheory/Polynomial/Cyclotomic/Roots.lean:190` is not finite-field irreducibility. The CRT input is `Ideal.quotientInfRingEquivPiQuotient` (`Mathlib/RingTheory/Ideal/Quotient/Operations.lean:248`). Tau Ceti's all-conjugates maps at `TauCeti/RingTheory/Cyclotomic/Lift.lean:225` and385 require an actual primitive root; e=5,p=11 satisfies those hypotheses.
- `DerivedCategory` is the ordinary quasi-isomorphism localization at `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87`; that definition alone gives no enhanced mapping spaces. `LightCondMod` is `LightCondensed (ModuleCat R)` at `Mathlib/Condensed/Light/Module.lean:42`; it alone supplies neither solidity nor a spherical coefficient category. Searches for the objects, not just this package's names, found no existing pinned completed-Picard theorem or specialized relative Habiro/spherical-solid carrier replacing the declared contracts.

The required dependency check returned exactly:

```text
moved: HabiroRings moved in the merge order from #159 to #160, right after its last supplier RefinedTraceMethods; checked as moved (the worker moves it there when it submits)
depcheck: 20 roadmaps, 150 edges, 0 problem(s)
```

There is **no UPWARD or CYCLE output**. The “moved” line is not a finding. RefinedTraceMethods is described as a consumer in this README, not a consumed mathematical interface; the scanner's supplier classification there is broader than the actual proof dependency. The internal self-link found in S10 is a separate dependency-list defect.

The read-only git check confirms head `7579926` and seven changed files, all inside `packages/HabiroRings/`, with 2,409 insertions. The Lean file has one `import Mathlib`, no sorry-defined data, no `set_option`, no `lemma`, no admitted example, and no imported roadmap module. No computational algorithm is proposed by the reviewed package. No source, roadmap, pin, merge-order file or tracked package file was changed during this review; only this report and scratch notes were written.

## Not verifiable

- **Fresh elaboration/build:** prohibited by the read-only brief. The supplied twelve elaborated signatures were compared with source; this is not an independently rerun Lean build. The eight examples and local instance were inspected manually. The previous repair report's additional scratch-only evaluator examples were not available as independent Lean artifacts.
- **Unimplemented supplier contracts:** HabiroCohomologyFoundations, HabiroNumberFields and SolidAnalyticRings are not available as inspectable roadmap implementations here. Their registered contracts are accepted conditionally, as instructed; their absence is not re-raised. The full spectral tower/realization and arithmetic integral-evaluation/naturality assertions have not been proved by this review.
- **Open work beyond the supplied checkouts:** service-wide object searches were used as leads, but no claim is made to have read every line of every unrelated open roadmap. All nineteen explicitly supplied checkouts were searched, and relevant current supplier passages were read. Main versions, rather than revision-only pull requests, were used for existing roadmap owners.
- **Formal proof certification:** computed instances and source comparisons do not prove the admitted theorems. In particular, the enhanced finite descent and light-solid tensor comparisons remain conditional on their precise higher-categorical supplier contracts. All cited texts were legally readable; no additional missing-reference request is needed.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "75799264ac98059e89350ebce806bce02958fcd1", "job": "RT-HabiroRings~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
