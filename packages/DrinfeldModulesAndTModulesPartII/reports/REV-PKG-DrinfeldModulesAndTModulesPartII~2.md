<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1436#issuecomment-6398715266 -->
Review (codex) of 9500295

Verdict: accepted
Conditional on the announced gaps: `general-power-sum-degree`, `anderson-thakur-generating-series`, `v-adic-mzv-specialisation`, `parent-carlitz-products`, `parent-period-analytic-field`, `parent-carlitz-omega`, `parent-effective-dual-motives`, `parent-twisted-analytic-rings`, `parent-abp-interface`, `abp-entire-from-equation`, `frobenius-constant-denominator`, `frobenius-fundamental-matrix`, `parent-small-power-sums`, `integral-positive-index-stuffle`

No package findings: 0 P1, 0 P2, 0 P3. Acceptance is conditional on the 14 declared supplier gaps listed below. The nine previous findings are repaired. The README, acceptance file, metadata, sources manifest and design were not changed by this review.

## Verified sound

### Previous findings, checked before the new pass

Locations in this table are in `packages/DrinfeldModulesAndTModulesPartII/README.md` unless a different file is named. Quoted fragments identify the repairs; computations are independent of the repair report. Previous review IDs R01–R09 correspond to repair-report IDs F01–F09.

| Previous finding | Repaired passage and location | Verification | Status |
|---|---|---|---|
| R01 / F01, missing coefficient in BC | Line 651: “BC_q(R_1) = B*_(q)(R_1) − D_1C_((1,q−1))(R_1)” | At q=2,d=1 the fixed parts are 0 and D₁⁻³. Corrected subtraction gives D₁⁻²=S₁(2,2); unscaled subtraction gives D₁⁻³. Line 652 retains the failed alternative as a negative control. | Repaired |
| R02 / F02, wrong scalar field | Line 1061: “kernel of the F(t)-linear map” | At w=0, residuals of 1,t,θ are 0,0,θᑫ−θ. `frobeniusResidual` is linear over the coefficient `RatFunc F`, representing F(t), with θ the polynomial variable. It is not K(t)-linear. | Repaired |
| R03 / F03, missing native headlines | Line 968: “The headline `zeta_algebra_graded` states the grading in (b) for MZVs”; line 1132 names `twisted_system_rigidity`. | Both are present in `Suggested.lean:153,222`. Grading uses the actual MZV series and compatible embeddings; rigidity uses the actual finite prefix tree and coefficient Frobenius. The added nondivisibility alternative is supported by the source's Case 1, not an invented strengthening. | Repaired |
| R04 / F04, omitted endpoint and q=2 | Line 1343: “For every q and w ≤ 3q − 2” | `Suggested.lean:361,389` has the Note's endpoint predicate and no q>2 hypothesis. At q=3,w=7 its count is 1040, not s(7)=1042; at q=2,w=4 its three tuples are 211,121,13. The old rule's dependent triple is excluded. | Repaired |
| R05 / F05, overly restrictive specialisation | Line 891 uses the “whole-tuple decay condition”; line 893 uses the initial-prefix column. | For q=3,s=(2,2),Q=(1,t+θ⁴), the full tuple decays although the final tail diverges. A zero Q gives the zero series. The full tail matrix in §3.6 still requires the stronger termwise condition. | Repaired |
| R06 / F06, vague compound contracts | Lines 77–107: generating-series identity and separately named “gap:parent-carlitz-omega”, “gap:abp-entire-from-equation”, “gap:frobenius-constant-denominator”, “gap:frobenius-fundamental-matrix”. | All 14 README slugs have the same supplier and needs in `design/plan.json`. The generating identity was checked on the AT90 page images and at d=0,1. The analytic, lifting and denominator interfaces are separated and retain their hypotheses. | Repaired |
| R07 / F07, missing dependency edges | Lines 243,847,1377 name “gap:general-power-sum-degree”, “gap:anderson-thakur-generating-series”, “gap:v-adic-mzv-specialisation”. | The corresponding layer summaries at lines 437,1040,1385 include these inputs. §1.3 includes the integral stuffle gap; §0.11 has a populated Needs line. All 68 target Needs lines and six layer dependency summaries were read. | Repaired |
| R08 / F08, insufficient Checks | Line 562 gives the q=3 square relation; line 1265 says “R_1 = 0, of dimension 1 − 1 = 0”. | §1.7 has four Checks. §5.7 has four, including kernel dimensions 0,1,2 in weights 1,2,3 at q=2. The displayed relations have zero residual through u³⁹ in the independent computations. | Repaired |
| R09 / F09, wrong Finsupp locator | Line 43: “`Finsupp.single` in `Mathlib/Data/Finsupp/Single.lean`” | Opened `Single.lean:47` and `Defs.lean:88` at the Mathlib pin. Support at coefficient zero is empty. The newly added `iSupIndep` locator also resolves. | Repaired |

I searched the remaining package for each repaired pattern: missing D₁ factors, K(t)-linearity of a coefficient-twisted residual, whole-tuple conditions incorrectly used for tails, endpoint count equality, q>2 restrictions, omitted gap edges, and the old Finsupp path. No recurrence of a repaired defect was found. No previous finding was marked not actionable.

### Scope and coverage

All 68 target passages were read: 14 in Layer 0, 8 in Layer 1, 13 in Layer 2, 12 in Layer 3, 7 in Layer 4 and 14 in Layer 5. For unchanged, non-sampled mathematics I retained only the previous review's computed rows, which cover these targets individually; I did not treat a summary such as “sound” as evidence. The repaired passages, all 15 seeded targets, their proof-route inputs and the headline signatures were reviewed again. The compact tables below report the sampled, headline and repair-sensitive computations rather than repeat the previous 68-target ledger.

The scope remains a general multiple-depth library over every finite field. F₄ distinguishes q from p; no good-prime restriction or algorithmic deliverable is introduced. The finite rewriting result is a mathematical value-preservation and termination theorem. Generic compositions, polynomials, finitely supported functions, spans and completions remain native objects. The parent depth-one interfaces are declared contracts rather than duplicate constructions. The general stuffle product is assigned to its earlier owner; the retained product is the characteristic-p correction and its two realisations. No source passage copying, sorry'd data, `set_option`, vacuous replacement predicate or unowned foundational input was found.

### Seeded source verification

All 19 manifest entries have readable cached legal texts. There is no additional author-flagged unverified locator in this package. All 15 seeded targets were verified against theorem numbering, printed page, hypotheses and the actual proof where the roadmap consumes a proof step. Source years/version notes were read together with the cached versions; the table identifies the text actually checked. AT90 equations missing from the extraction were read on the cached images of printed pp. 185–186. AT09's digit bound was also checked on its page image.

| Target | Exact source passage read | Result of comparison |
|---|---|---|
| §0.6 Carlitz multiple polylogarithms | CHANG14 line 638, Definitions 5.1.1 and 5.1.3 and Remarks 5.1.4–5.1.5, printed p. 13; CCM23 line 307, §2.2, printed p. 7 | Strictly decreasing nonnegative degrees, ℓ denominators and whole-tuple versus smaller product domain agree. The degree-character realisation has the necessary product of γ factors. |
| §0.9 Weight-graded spans | ND21 line 120, printed p. 3; CHANG14 line 216, §2.2 and Theorem 2.2.1, printed p. 5; IKLNDP24 line 186, printed p. 4 | K-spans of ordinary/alternating values are distinguished from their K̄-spans. Weight zero is explicitly the scalar line. |
| §0.14 Eulerian values | CHANG14 line 235, §2.3 and Corollary 2.3.3, printed p. 6; CCM23 line 1182, printed p. 22, and line 1352, printed p. 24; IKLNDP24 line 4085, printed p. 36 | Quotient by π̃ʷ is the intended normalisation. The divisibility obstruction applies to nonzero K∞ values; zero is Eulerian without forcing divisibility. |
| §1.4 Realisation maps | CCM23 line 329 through line 394, Definition 2.2.2 and Remark 2.2.6, printed pp. 7–8 | The two realisations and their truncated versions match. The package deliberately corrects the source's inconsistent empty-cutoff convention; the difference law is restricted to positive depth. |
| §1.6 Controlled products | ND21 line 314, Proposition 2.1 and proof, printed pp. 6–7; IKLNDP24 line 758, Proposition 1.3, printed pp. 10–11, and line 4680, Proposition 4.2, printed p. 44; THAKUR-UPDATES line 308, printed pp. 7–8 | Weight, total character, prefix preorder and depth bounds agree. The mixed-product induction precedes the fixed-degree induction, as required by the correction. |
| §2.10 Rewriting theorem | CCM23 line 539, Theorem 3.2.4, printed p. 11; line 563, Corollary 3.2.5, printed p. 12; line 1673, Lemma A.3.7 and Theorem A.3.8, printed pp. 30–31 | Value preservation and finite iteration to the Thakur support are supported, for the stated realisations. The operator fixes the allowed family; the empty case is consistent. |
| §2.12 Strong alternating Brown theorem | IKLNDP24 line 3333, Theorem 1.11 and proof, printed p. 25; lines 3395–3451 for contraction and the matrix argument | The source permits repeated elements in the left generating presentation. The invertible matrix is not a claim that the larger generating family is a basis. |
| §3.7 Chang's MZ property | CHANG14 line 343, Definition 3.4.1, printed p. 8; line 376, product construction; line 392, Theorem 3.4.5, printed p. 9 | Nonzero Z, weight, determinant, c∈K×, first and last coordinates and Frobenius specialisations are retained. The arithmetic E condition places the specialised coordinates in a finite extension of K∞. |
| §4.6 Character-twisted system | IKLNDP24 line 4164, equations (3.4)–(3.5), printed p. 38; lines 4293–4298, root equation, p. 39; lines 4302–4386, Case 1, pp. 40–41; lines 4424–4478, Case 2, pp. 41–42 | Vanishing holds for positive weight if q−1 does not divide w or the total character is nontrivial. The remaining case embeds in the universal line; existence is not asserted for every restricted support. |
| §5.1 Small-entry independence | ND21 line 167, Theorem B, printed p. 3; lines 1316–1336, proof conclusion, printed pp. 21–22 | All positive parts at most q−1, arbitrary depth/weight, every prime power q. The final congruence uses this exact part range; q=2 is included. |
| §5.5 CMPL basis on IND | CCM23 line 1373, Theorem 5.2.1 and proof, printed p. 25 | Every positive weight, indices with q dividing no part, K-independence and spanning Z_w. It does not identify each such CMPL with the same-index MZV. |
| §5.10 Alternating Hoffman-like basis | IKLNDP24 line 4070, Theorem 3.6, printed p. 36 | The AS family is a K-basis of the alternating CMPL space. The package's AZ target uses the separately proved bridge. |
| §5.12 Ordinary lower bound | IKLNDP24 line 6489, Proposition 4.10 and proof, printed pp. 54–55 | Trivial-character q-indivisible CMPLs lie in Z_w, are independent and number d(w). No ordinary MZV independence for the same indices in unrestricted weight is claimed. |
| §5.13 Direct small-weight AMZVs | IKLNDP-NOTE line 191, family definitions, printed p. 3; line 245, Proposition 1.4, and line 262, Theorem 1.6, printed p. 4; line 1739, §5.9, pp. 29–33; line 1990, §5.10, pp. 33–35. Also IKLNDP24 line 6729, Remark 4.12 and Proposition 4.13, printed p. 57 | Independence reaches 3q−2 for every q. Cardinal equality only reaches 3q−3. The q=2 endpoint has its separate three tuples. Direct spanning reaches 2q−1. The endpoint proof's support reductions and degree bound were read, not inferred from the headline alone. |
| §5.14 Finite-place bound | CCM23 line 151, Corollary 1.2.7, printed p. 4; CM21 line 149, Theorem 1.2.2, printed p. 4; CCM-ALG line 176, Theorem 1.2.3, printed p. 4 | The weightwise specialisation and its algebra compatibility are correctly sourced separately. The killed ζ_A(q−1) ideal gives d(w)−d(w−q+1); the K̄ bound follows by scalar extension of a K-spanning family. |

The additional repair sources were checked directly: CPY19 line 275, (2.3.1), and line 325, Proposition 2.3.3, printed pp. 6–7, for whole-tuple specialisation; ABP04 line 346, Theorem 3.1.1, pp. 7–8, and line 409, Proposition 3.1.3, p. 9; CPY19 line 245, Proposition 2.2.1, p. 6; PAP08 line 346, §2.2, p. 8, line 564, Lemma 3.3.2, p. 12, and line 1033, §4.1.6, p. 22; AT90 line 750, §§3.6–3.7, printed pp. 185–186, with the displayed equations read on the scan. These support the split analytic contracts at their stated generality.

### Adversarial computations

Notation: D=θᑫ−θ and u=θ⁻¹. Rational-function, polynomial, cardinality and valuation entries below are exact. “Residual 0 mod u⁴⁰” means independently computed coefficients of u⁰ through u³⁹ vanish, not a proof of the infinite identity. The computations formed the defining monic-polynomial sums over F₂ and F₃, using series through u⁴⁷. Degrees through 8 and 5 respectively suffice: for k≥1, cancellation in S_d(k) gives the conservative order bound dk+(q−1)d(d+1)/2. Multiplication by the displayed D factors leaves the reported precision valid. General independence and identities were also checked in their sources; numerical truncation is not substituted for those proofs.

| Statement / target | Instances tried | Values computed on each side or against the wrong model | Result / change |
|---|---|---|---|
| Conventions; native carriers | F₂,F₃,F₄; q=1; zero ring | At F₄, q=4,p=2: 4∤2 but 2∣2. No field has cardinality 1. Field gives 0≠1. | Prime-power scope retained; no change. |
| Carlitz signs; §§0.2,0.8 | q=3,d=0,1 | ℓ₀=D₀=1; ℓ₁=−D; S₁(1)=−D⁻¹, S₁(2)=D⁻². At k=4, S₁(4)=D⁻⁴−D⁻² differs from ℓ₁⁻⁴=D⁻⁴. | Correct sign and sharp small-power range. |
| §0.5 nonzero headline | q=2,s=empty,1,11; q=3,s=11 | Leading terms 1,1,u²,2u³ respectively. The leading degree tuple for q=2,11 gives degrees −2 versus −6,−8 for the next tuples. | Leading-term witness excludes zero; general degree theorem is a declared input. |
| §0.6 general CMPL domain | q=3,s=(2,2),z=(1,θ⁴); z₂=0 | Normalised term exponent −3·3^d₁+3^d₂ ≤ −(8/3)3^d₁ for d₁>d₂. Isolated tail exponent +3^d₂ diverges. A zero coordinate gives 0. | Whole-tuple domain is genuinely larger; no narrowing. |
| §0.6 character convention | q=3,γ²=ε=−1,d=1,2 | γ³/γ=−1=ε; γ⁹/γ=1=ε². | Degree powers and γ normalisation agree. |
| §0.9 four weight spaces | w=0,1;q=3 | At w=0 all four have sole generator 1 and dimension 1. At w=1 ordinary index count 1, alternating array count 2. v∞(ρ)=−1/2, so ρ∈K̄ but ρ∉K∞. | K and K̄ carriers are not conflated. |
| §0.14 Eulerian condition | q=3,w=1,2; z=0 | ζ₂/π̃²=−D⁻¹∈K. A nonzero weight-one K∞ value divided by π̃ has half-integral valuation, not an integer. Zero quotient is 0 in every weight. | Both the example and nonzero qualification pass. |
| §1.4 realisations and cutoff | s=1 and empty,d=0 | Nonempty: 1=1−0. Empty: fixed value 1 but truncated difference 1−1=0. | Positive-depth restriction essential and present. |
| §1.4 distinct realisations; §2.8 bridge | q=3,s=4 | Li₄−ζ₄=u⁶+2u⁸+u¹²+2u¹⁴+… ≠0. Both weight spaces have six Thakur generators, not equality of these singleton values. | Correct equality of spans, not pointwise maps. |
| §1.6 fixed and mixed products | q=3,d=1,a=b=1 | Fixed: (−D⁻¹)²=D⁻²=S₁(2). Mixed: (−D⁻¹)·1=−D⁻¹=S₁(1,1). Depths 1 and 2; weight 2; prefixes (1,2)≤(2,2). | Weight/depth/preorder bounds compatible. |
| §1.7 ordinary multiplication Checks | q=3 square; q=2 mixed | ζ₁²−ζ₂−2ζ₁₁=0 mod u⁴⁰; ζ₁ζ₂−ζ₃−ζ₁₂=0 mod u⁴⁰. At q=3 the wrong square difference ζ₁²−ζ₂ starts u³+u⁵. | Added Checks discriminate; no change. |
| §1.7 alternating square and unit | q=3,ε=−1; empty | ζ(−1;1)²−ζ₂−2ζ(−1,−1;1,1)=0 mod u⁴⁰; empty value times ζ₁ equals ζ₁. | Characters and unit pass. |
| §2.2 fundamental relation | q=2,3 | ζ(q)+Dζ(1,q−1)=0 mod u⁴⁰. At q=3,d=0, fixed identity is 1+D(−D⁻¹)=0; wrong sign gives 2. | Normalisation agrees across layers. |
| §2.3 repaired cancellation | q=2,d=1 | B fixed part 0; C fixed part D⁻³; 0−D·D⁻³=D⁻²=S₁(2,2), whereas 0−D⁻³=D⁻³. | Repair passes its original counterexample. |
| §2.7 Brown generation | q=2,w=3; w=0 | Four compositions reduce to 111,21: ζ₁₂=D(ζ₁₁₁+ζ₂₁), ζ₃=D²(ζ₁₁₁+ζ₂₁), both residuals 0 mod u⁴⁰. Empty value is 1. | Ordinary and, at q=2, alternating statements agree. |
| §2.10 rewriting | q=2,s=3 | U(3)=D[12], U²(3)=D²([111]+[21]), U³(3)=U²(3). Realised residuals 0 mod u⁴⁰. | Value preservation plus actual stabilisation, not an arbitrary operator. |
| §2.12 strong Brown | q=3,w=4; q=4,w=5 | Counts AT/AS are 48/46 and 756/750. For contraction of (4) at q=3, diagonal residue is −1=2 mod D, nonzero. | Invertible presentation does not imply equal basis counts. |
| Repaired generating-series contract | d=0,1, all q | Both sides at d=0 are (1−x)⁻¹. At d=1 both are 1/(ℓ₁+xᑫ−x), constant term ℓ₁⁻¹. γ_j(θ^(q^d))=0 for j>d via its i=j−d factor. | Formula and finite summation limit pass. |
| §3.1 factorial and polynomial indices | q=3,n=1,3,4 | Γ₁=Γ₃=1, Γ₄=D; H₁=H₃=1, H₄=2t³−t−θ³. Degree 3≤9/2. | n versus n−1 shift correct; AT09 digit typo is not inherited. |
| §3.5 repaired whole-tuple specialisation | q=3,s=(2,2),Q=(1,t+θ⁴); Q=(1,0) | Same full exponent bound −(8/3)3^d₁ tends to −∞, while the tail's norm is 3^(3^d₂). Zero-factor full series and its specialisations are all 0. | Initial-prefix proof covers the weaker hypothesis; no tail matrix inferred. |
| §3.5 period factors | q=3,s=2,Q=1,j=0,1 | Normalised value −D⁻¹; its q-th power −D⁻³. Frobenius specialisation predicts precisely −D⁻³. Γ₂=1. | Correct period and factorial factors. |
| §3.7 MZ witness | q=3,Z=ζ₂,w=2 | Φ=((t−θ)²,0;(t−θ)²,1), det=(t−θ)². ψ(θ)=(π̃⁻²,−D⁻¹); at θ^(3^N), N≥1, coordinates are (0,(−D⁻¹)^(3^N)). c=1. Z=0 fails the explicit nonzero condition. | Concrete witness and wrong-zero model checked. |
| §3.7 product law | Two depth-one weights 1,1 | Tensor first coordinate π̃⁻¹π̃⁻¹=π̃⁻²; last coordinate c₁Z₁π̃⁻¹·c₂Z₂π̃⁻¹=c₁c₂Z₁Z₂π̃⁻²; c₁c₂∈K×. | Weight addition and constants agree. |
| §3.9 new grading headline | q=3,weights 0,1,2 | Thakur index counts 1,1,2. For the wrong normalised family, K̄·1=K̄·(ζ₂/π̃²), since ζ₂/π̃²=−D⁻¹≠0. | The theorem uses raw MZVs and both scalar towers; Chang supplies independence across weights. |
| §4.1 F(t)-linearity | w=0,q=3,f=1,t,θ | Root residuals 0,0,θ³−θ. Outside-tree residual equals f, so kernel forces zero there. | Repaired field and support are exact. |
| §4.5 full solution kernel | q=3,w=0,1,2 | w=0 has root 1. At w=1 constant θ-coefficients a,b satisfy a=(a+b)(t−θ), forcing a=b=0. At w=2, root t³−θ and leaf t−t³ give t³−θ³ on both sides. Dimensions 1,0,1 match divisibility by 2. | Explicit finite-dimensional conjunction prevents finrank's infinite-rank junk value. |
| §4.6 new twisted rigidity | q=3,w=2,γ=1 versus γ²=−1 | Root t³−θ³, leaf t−t³: for γ=1, both root sides t³−θ⁹. For nontrivial γ, residual (1−γ)(t−t³)(t−θ³)²≠0. | Ordinary line does not survive the character twist. |
| §4.6 positive-weight boundary | w=0,any ε; q=2,w>0 | At w=0, δ_root=1 solves 1=1 regardless of ε. At q=2, q−1=1 divides every weight and the only ε is 1, so the vanishing disjunction is false. | Positive-weight hypothesis is necessary; q=2 is not falsely forced to vanish. |
| §4.7 two-row endpoint | q=3,k=2,a=1 | δ₁=(t−θ)⁶, δ₂=a₂=0,a₁=t³−t. First equation has both sides (t−θ³)⁶; second has both sides 0. | Nonzero endpoint line retained; strict-range vanishing not extended. |
| §5.1 small-entry independence | q=2,w=0,1,2 | Only values 1,ζ₁,ζ₁₁; leading coefficients 1,1,u² respectively, all nonzero. At q=3,w=4 the small family has five indices, rather than all six IND indices. | Small family is correctly defined; general theorem checked in ND21. |
| §5.3 q-indivisible independence | q=3,w=4 versus 5 | IND₄ has 6 indices. At w=5, ζ₅+Dζ₁₄=0 has two q-indivisible indices and coefficients 1,D≠0 (retained prior exact binary-relation check). | Upper weight 2q−2 and q>2 retained. |
| §5.5 CMPL IND basis | q=3,w=4; q=2,w=1 | IND count 6=d(4); Li₄−ζ₄ begins u⁶. At q=2,w=1 the one CMPL has leading term 1. | Basis is CMPL, not the generally dependent ordinary IND family. |
| §5.6 Thakur basis, dimension, extension | q=2,w=2,3,4;q=3,w=4,5 | Thakur counts 1,2,3 and 6,11; d₃(5)=6+3+2=11. Any field embedding sends empty value 1 to 1. | Cardinalities and compatible-field formulation agree. |
| §5.7 complete kernel Checks | q=2,w=1,2,3 | Dimensions 1−1=0,2−1=1,4−2=2. Relations [2]+D[11], [12]+D([111]+[21]), [3]+D[12] realise to 0 mod u⁴⁰. The last two pivots are different. | Added Checks detect the whole-space and missing-relation wrong models. |
| §5.8 character roots | q=3,roots 1,i,i²=−1 | Frobenius eigenvalues 1,−1. From a+bi=0 and a−bi=0, subtraction gives 2bi=0, hence a=b=0. Repeated roots 1,1 instead have relation 1−1=0. | Injectivity and compatible constant-field embeddings retained. |
| §§5.10–5.11 alternating basis/dimension | q=3,w=1,3,4;q=4,w=4 | AS counts 2,16,46 and 189; weak AT count at q=3,w=4 is 48. At w=0 all counts are 1. | Counts match the asserted sequence and distinguish the two families. |
| §5.12 lower bound | q=3,w=4 | Six trivial-character IND arrays sit inside 46 AS arrays; bridge sends their span into Z₄. Lower bound 6 equals d(4)=6. | No stronger ordinary IND claim used. |
| §5.13 direct families before endpoint | q=3,w=4,6 | Direct array counts 46 and 368; at w=6, 231 and 123 are admitted while 321 is excluded. | Adjacency, not merely occurrence of q, determines membership. |
| §5.13 repaired endpoint | q=3,w=7;q=4,w=10;q=5,w=13 | Direct counts 1040,733902,967074552; s(w)=1042,733908,967074564. At q=3,43 and 25 are admitted; 7 and 223 are excluded. | Independence, not basis/cardinality equality, asserted at endpoint. |
| §5.13 q=2 endpoint | w=4 | New indices 211,121,13 number 3=d(4). Old triple 1111,112,121 satisfies ζ₁₁₂+D(ζ₁₁₁₁+ζ₁₂₁)=0 mod u⁴⁰. | The original counterexample now tests the rejected rule. |
| §5.14 finite-place upper bound | q=3,w=1,2,4;q=2,w=1 | d(w)−d(w−q+1)=1−0=1,2−1=1,6−2=4; at q=2 it is 1−1=0. | Domain property and nonzero ζ(q−1) make multiplication injective; specialisation is a declared contract. |

The independent composition enumeration additionally produced these cross-checks; entries are counts, not a numerical proof of value independence:

| q,w | Thakur = IND | AS = AJ¹ | AT | Direct arrays |
|---|---:|---:|---:|---:|
| 2,4 | 3 | 3 | 3 | 3 |
| 3,4 | 6 | 46 | 48 | 46 |
| 3,6 | 20 | 368 | 408 | 368 |
| 3,7 | 37 | 1042 | 1192 | 1040 |
| 4,5 | 14 | 750 | 756 | 750 |
| 4,9 | 193 | 185151 | 191241 | 185151 |
| 4,10 | 372 | 733908 | 762696 | 733902 |
| 5,12 | 1732 | 193614004 | 194700160 | 193614004 |
| 5,13 | 3405 | 967074564 | 973251264 | 967074552 |

### Supplier contracts and ordering

The exact contract slugs in the README and `design/plan.json` agree, with named suppliers and the same needs sentences. The following 14 contracts are the conditions of acceptance. They ask for related parts of identified mathematical interfaces; no request for an unrelated construction remains hidden inside the ABP contract. Generic restricted series, native finite fields and linear algebra are already imported and are not requested again.

| Gap slug | Owner and section | Precision/minimality check and witness |
|---|---|---|
| general-power-sum-degree | DrinfeldModulesAndTModules DM.6 | All q,k≥1,d≥0; nonzero sums and strict degree descent. At q=2,k=1, degrees at d=0,1,2 are 0,−2,−6. This is not supplied by generic valuation theory. |
| anderson-thakur-generating-series | DrinfeldModulesAndTModules DM.6 | Explicit K[[x]] identity, nonzero ℓ_d,D_j and vanishing γ terms. d=0,1 values computed above and AT90 equations read. |
| v-adic-mzv-specialisation | DrinfeldModulesAndTModules DM.6/v-adic-special-values | Every finite place and weight; K-algebra map and killed ζ_A(q−1). Neither the generic global-field roadmap nor the infinity completion defines these values. |
| parent-carlitz-products | DrinfeldModulesAndTModules DM.0/carlitz-products | Explicit ℓ_d,D_d in conventions, with recursion, nonvanishing and norms. At q=3,d=1: ℓ₁=−D₁, both of norm 3³. The simple finite-product acceptance definition is not a second proof of this API. |
| parent-period-analytic-field | DrinfeldModulesAndTModules DM.2 | Defined exponential, logarithm disc and kernel/product normalisation. The logarithm term norm is q^(q/(q−1)) times (|z|/q^(q/(q−1)))^(q^d); at the boundary it does not tend to zero. |
| parent-carlitz-omega | DrinfeldModulesAndTModules DM.2/omega | Explicit entire product, twist and period valuation. Replacing ρ by ξρ multiplies π̃ by ξ; π̃^(q−1) is unchanged. Inverse twist contributes ρ^(q−1)(1−t/θ)=t−θ. |
| parent-effective-dual-motives | DrinfeldModulesAndTModules DM.4/inverse-twist-dual-motive | Finite-free inverse-semilinear matrix interpretation with injectivity and (t−θ)-power torsion cokernel; no extra σ-finite-generation condition. Rank-one Φ=1 has cokernel 0 and is allowed. |
| parent-twisted-analytic-rings | DrinfeldModulesAndTModules DM.8 | Coefficient twist fixes t, preserves the analytic rings and has specified fixed rings/fields. For a+bt, twist is aᑫ+bᑫt, not aᑫ+bᑫtᑫ. Fixed restricted coefficients lie in F_q and tend to 0, hence only finitely many are nonzero. |
| parent-abp-interface | DrinfeldModulesAndTModules DM.8/abp-lifting | Polynomial Φ, det=c(t−θ)^m with c≠0, entire ψ, a relation at θ and polynomial lift with prescribed value. For Φ=((t−θ,0),(t−θ,1)), det=t−θ; the zero matrix fails. |
| abp-entire-from-equation | DrinfeldModulesAndTModules DM.8/entire-from-equation | Tate ψ plus equation and det Φ(0)≠0. Same 2×2 example has det Φ(0)=−θ≠0; zero matrix fails. Distinct from lifting a relation. |
| frobenius-constant-denominator | DrinfeldModulesAndTModules DM.8/constant-denominator | Rational intertwiner and both prescribed determinants. With Φ_i=1,U=1/t, denominator t lies in F_q[t]. U=1/(t−θ) fails the equation. Polynomial-only U would trivialise the claim. |
| frobenius-fundamental-matrix | DrinfeldModulesAndTModules DM.8/fundamental-matrix | Two invertible solutions in Frac(T), unique right constant C. Φ=I,Ψ=I,Ψ′=diag(t,1) gives C=diag(t,1); replacing t by t−θ fails fixedness. |
| parent-small-power-sums | DrinfeldModulesAndTModules DM.6/small-power-sum | Exact range 1≤n≤q and signed ℓ_d. Computed n=q+1 negative control above shows why the range is substantive. |
| integral-positive-index-stuffle | PeriodsAndSpecialValues PS.9.2 | Integer multiplicities and specialisation to any commutative coefficient ring. [1]*[1]=2[11]+[2], becoming [2] in characteristic 2. The existing rational presentation alone supplies no ℚ→F_p specialisation. |

The parent is not present in the main/open index or among the package names in the supplied board index. I do not infer that it exists nowhere: all parent consumption is explicitly covered by declared contracts, and some other board-head files were unreadable. Its absence today is not counted as a finding.

The prescribed dependency command completed with the following complete output:

```text
depcheck: 52 roadmaps, 585 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. `roadmaps resolve` reported no unresolved cross-roadmap citation and no unresolved Lean name; its library-name result was supplemented by direct inspection of the pinned files below. Every target's Needs line and each supplier citation was resolved or matched to an explicit gap. Layer 5's use of earlier results and its separate direct/CMPL routes introduce no backwards proof dependence; internal strong induction in §5.9 is on smaller weight.

### Pinned-library audit by object

The content checkout is at `e98875dbbea872d0496e323bc880e2b7fd00beb9`. Its manifest pins Mathlib to `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti to `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following are repository-relative paths inside those pinned libraries, opened directly. Searches by Carlitz denominators, multiple zeta/polylogarithm values, Anderson–Thakur interpolation, stuffle/quasi-shuffle and Frobenius difference objects found no duplicate specialised theorem at the pins.

| Object / declaration | Pinned file and line | Definition or hypothesis checked |
|---|---|---|
| `Composition`, blocks, length, blocksFun, sizeUpTo, `composition_card` | `Mathlib/Combinatorics/Enumerative/Composition.lean:101,147,155,217,1033` | Positive list entries and prescribed sum; no real-MZV admissibility. Empty weight-zero composition exists. The cardinal formula's natural subtraction gives 2⁰=1 at weight zero. |
| `Polynomial`, `Polynomial.Monic` | `Mathlib/Algebra/Polynomial/Basic.lean:69`; `Mathlib/Algebra/Polynomial/Degree/Defs.lean:59` | Polynomial is a finitely supported coefficient object; Monic means leading coefficient 1. It excludes zero only with nontrivial coefficients, supplied here by Field. |
| `RatFunc` | `Mathlib/FieldTheory/RatFunc/Defs.lean:67` | Fraction-ring presentation of polynomials; the field instance is used with Field F. |
| `RatFunc.inftyValuationDef`, valuation, X, X_inv, polynomial, completion | `Mathlib/FieldTheory/RatFunc/Valuation.lean:51,81,97,103,109,138` | Zero has valuation 0; nonzero values use integer degree exponents. X and X inverse have exponents 1 and −1. Polynomial formula assumes nonzero. Completion derives Field and K-algebra and retains DecidableEq K. |
| `Finsupp`, `Finsupp.single` | `Mathlib/Data/Finsupp/Defs.lean:88`; `Mathlib/Data/Finsupp/Single.lean:47,50,57` | Finite support, support iff value nonzero, singleton evaluation and empty support at coefficient zero. |
| `Submodule.span`, `LinearIndependent` | `Mathlib/LinearAlgebra/Span/Defs.lean:46`; `Mathlib/LinearAlgebra/LinearIndependent/Defs.lean:98` | Span is the infimum of containing submodules; independence is injectivity of the finite linear-combination map. The headline families are indexed, not silently converted to sets losing repetitions. |
| `iSupIndep` | `Mathlib/Order/SupIndep.lean:328` | Each member is disjoint from the supremum of all others. The coincident nonzero normalised lines in the grading negative control fail it. |
| `Module.finrank` | `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61` | Cardinal rank converted to Nat, hence infinite rank can give zero. The solution-dimension theorem explicitly also asserts Module.Finite; value spaces have finite composition/character spanning families. |
| `FiniteField.card'`, `sum_pow_units`, `frobeniusAlgHom` | `Mathlib/FieldTheory/Finite/Basic.lean:266,290,333` | Positive prime-power cardinality; power sum −1 when q−1 divides the exponent, otherwise 0; q-power F-algebra homomorphism. At q=3, exponents 0,1,2 give 2,0,2. |
| `Nat.choose` | `Mathlib/Data/Nat/Choose/Basic.lean:50` | Base values choose(n,0)=1 and choose(0,k+1)=0; Pascal recursion. No problematic binomial extension to negative naturals is introduced. |
| `Polynomial.comp`, `mapRingHom` | `Mathlib/Algebra/Polynomial/Eval/Defs.lean:380,533` | Substitution changes the polynomial variable; coefficient mapping fixes it. These are the different operations needed in §§4.1 and 4.7. |
| `HasSum`, `tsum` | `Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:89,106,132,142` (additive declarations generated there) | Unconditional finite-set convergence; tsum defaults to zero if no sum exists. These definitions alone include neither separation nor convergence. The actual completion is a field completion and the README proves convergence of the specified positive-index series. |
| `TauCeti.PowerSeries.norm_eq_gaussNorm`, `norm_coeff_mul_pow_le`, `norm_C`, `norm_X`, completeness | `TauCeti/RingTheory/PowerSeries/TateAlgebra.lean:63,76,80,94,105,138` | Ultrametric normed ring and positive radius; norm_X additionally needs NormOneClass. Complete coefficients give complete restricted series. These declarations do not include the arithmetic E condition or coefficient Frobenius. |

### Cross-roadmap ownership and citation resolution

I used `roadmaps grep` by object over main and all 363 indexed open heads, read the matching owners with `roadmaps show`, searched the board checkout and read the supplied board-package index before drawing ownership conclusions. A separate search for this package's namespace and the two new headline names found no duplicate fully qualified declaration on main or at an indexed open head. The index's main revision was `1ce5c4f`; pinned library claims above use the content checkout's libraries, not the resolver's index.

| Object | Resolved owner and location | Ownership conclusion |
|---|---|---|
| General restricted and entire series | `TauCetiRoadmap/RestrictedPowerSeries/README.md:193,207,224,247,264,306,723`, §§0.1–0.3,1.1–1.2,2.1,7.2, on main | All named sections exist and were read. Evaluation at θ needs an entire series because |θ|=q>1. This package adds the arithmetic finite-extension/Frobenius condition through its parent contract, not another general analytic carrier. |
| Positive-index stuffle and classical MZVs | `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:1990,2013`, PS.9.1–PS.9.4 at the supplied open head | PS.9.2 owns the positive-index product, presently described over ℚ. Integer multiplicities/base change to characteristic p are the precise declared gap. PS.9.1's classical admissibility does not restrict the present positive-index function-field values. |
| Function-field arithmetic | `TauCetiRoadmap/FunctionFieldArithmetic/README.md`, scope and Layers 0–5, including §§0.1,2.1–2.3 at the supplied open head | Global fields, divisor arithmetic, lattice/Fourier methods and divisor zeta functions are distinct from these multiple-depth Carlitz series. No duplicate basis theorem found. |
| Drinfeld objects and shtukas | `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md`, scope and Layers 0–3, including §2.7 at the supplied open head | Elliptic sheaves/shtukas and their geometric comparison are assigned there. Its depth-one Drinfeld-module boundary is compatible with the parent contracts; the multiple-depth special-value statements here are not already owned there. |
| Depth-one Carlitz/ABP interfaces | Named DrinfeldModulesAndTModules DM.0,DM.2,DM.4,DM.6,DM.8 contracts | No readable parent folder in the main/open index or named board list. All consumed interfaces match declared gaps. This is conditional supply, not an assertion that absent sections already provide theorems. |
| The new multiple-depth constructions | This package Layers 0–5 | Searches for the objects, not merely their proposed names, found no competing construction at the pins or in the readable roadmap corpus. It is the Part II continuation; generic foundations remain with earlier owners. |

The four additional board-head READMEs that could be read were AnalyticNumberTheory (`310e834`), AutomorphicCongruences (`08f531f`), KatoEulerSystems (`a3ba9c5`) and LogicAndDefinabilityInNumberTheory (`d36cfa5`). Their object searches found no competing multiple-depth Carlitz construction. The unreadable exact-head paths are listed separately below; no claim of exhaustive ownership against those contents is made.

### Shape, signatures, headlines and padding

The README has the prescribed summary, scope, conventions, supplier contracts, reading guide, six ordered layers, examples/dependencies per layer, consumers and references. Definition interfaces and discriminating Checks were read, including the separately headed five Checks for `directIndices` in §5.13. The missing Checks in §§1.7 and 5.7 have been supplied. Main-branch style examples read were RestrictedPowerSeries, PadicMeasuresIwasawaAlgebras and ComplexTori. Metadata is `topic = "math.NT"`. The 400-line Lean file has one `import Mathlib`, 16 definitions with real bodies, 20 headline theorems with `sorry`, declaration docstrings and ordered layer comments. There is no required Tau Ceti object-file build.

The prescribed original-file elaboration, run from the pinned content checkout, exited 0 with exactly 20 warnings, all “declaration uses `sorry`”, and no errors. A single scratch elaboration adding `#check @name` for all 36 declarations also exited 0. I compared every elaborated type with the README, including every field/finite-field binder, completion equality binder, common-overfield algebra and scalar tower, weight restriction, character equation, support restriction and map direction. No binder was lost; there are no section variables to be silently dropped. The repairs add two headlines and extend the direct-independence range; no further signature change is needed.

Each of the 20 sorried theorems was tried with the single tactic `simp` on a scratch copy, under the same pins and default options. All 20 failed to close; there were exactly 20 resulting diagnostics. Reading their definitions and the pinned-object searches also excluded reflexive identities, one-library-lemma restatements, small-value Checks and boundary-only statements. No padding deletion is requested. The fact that a general theorem includes weight zero does not make it a boundary-case theorem.

| README headline | Acceptance coverage |
|---|---|
| §0.5 nonvanishing of all AMZVs | `multipleZeta_ne_zero`, including ordinary and empty cases. |
| §2.7 ordinary and weak alternating Brown generation | `brown_spanning`, `alternating_brown_spanning`. |
| §2.8 the two value-space bridges | `value_space_bridges`. |
| §2.12 strong alternating Brown generation | `strong_brown_spanning`. |
| §§3.2,3.5 Anderson–Thakur interpolation and entire Frobenius specialisation | Explicitly named as not statable in the module docstring: missing Carlitz period, Ω and analytic twist interfaces. |
| §3.9 Chang descent and weight grading | General MZ-property descent is named as not statable; its actual ordinary weight-grading consequence is now `zeta_algebra_graded`. |
| §§3.11–3.12 ABP independence criterion and Eulerian suffix theorem | Named as not statable: missing merged analytic prefix system. |
| §4.5 full Frobenius solution dimension | `frobenius_solution_dimension`, with Module.Finite and the unbounded polynomial kernel. |
| §4.6 twisted-system vanishing | Now `twisted_system_rigidity`, for positive weight and the full supported disjunction. |
| §4.7 two-row rigidity | `two_row_rigidity`, including the nonzero endpoint line. |
| §§5.1–5.4 small-entry and small-weight independence/bases | `small_entry_independent`, `q_indivisible_independent`; the all-weight Thakur basis also covers the lower-weight basis consequences. |
| §§5.5–5.6 CMPL basis, Thakur basis, Todd formula and algebraic-closure basis | `cmpl_ind_basis`, `thakur_basis`, `todd_dimension`, `thakur_basis_algebraicClosure`. |
| §5.7 complete relation kernel | Named as not statable: constructed q-shuffle rewriting operator is absent; no arbitrary substitute operator is used. |
| §§5.8–5.9 character roots, period splitting, normalised period relations | `character_roots_independent` for the native root theorem; period conclusions named as not statable because their realisation is absent. |
| §§5.10–5.12 alternating basis, dimensions, ordinary lower bound | `alternating_hoffman_basis`, `alternating_dimension`; `todd_dimension` already states the stronger ordinary equality. |
| §5.13 direct small-weight AMZV results | `direct_small_weight_spanning`, `direct_small_weight_independent`, now through the exact endpoint for all q. |
| §5.14 finite-place dimension bound | Named as not statable: missing v-adic MZV realisation and specialisation homomorphism. |

The non-statable results require substantial constructions, not just a missing easy predicate. No headline presently expressible with the kept native definitions is omitted. Every own Lean name appears in the README; imported generic declarations are cited rather than redeclared.

## Not verifiable

No cited source was unreadable; no additional source request or manifest addition was needed. The supplier gaps are future contracts, not claimed existing proofs, and acceptance is conditional on their fulfilment.

Ownership against the following exact board-head README paths could not be checked: each read returned HTTP 404 at the supplied head. This says nothing about whether a differently located or later version exists. The main/open-head roadmap search completed independently. Paths below are relative to the corresponding board checkout.

| Exact path | Supplied head | Reason |
|---|---|---|
| `packages/ArithmeticLocallySymmetricSpacesPartII/README.md` | `c1b8f80` | HTTP 404 |
| `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md` | `777a863` | HTTP 404 |
| `packages/CrystallineCohomologyPartII/README.md` | `84ea77e` | HTTP 404 |
| `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md` | `80a66cc` | HTTP 404 |
| `packages/HigherHidaAndColemanTheory/README.md` | `da88512` | HTTP 404 |
| `packages/LawrenceVenkateshMethod/README.md` | `9ee7ac3` | HTTP 404 |
| `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md` | `7e88c38` | HTTP 404 |
| `packages/PELModuliPartII/README.md` | `d4bb48d` | HTTP 404 |
| `packages/PadicHodgeTheoryPartII/README.md` | `6502997` | HTTP 404 |
| `packages/PadicLocalLanglandsForGL2QpPartII/README.md` | `3e0777d` | HTTP 404 |
| `packages/RealSurfacePeriodIndex/README.md` | `875bca4` | HTTP 404 |
| `packages/SchemeAndStackFoundationsPartII/README.md` | `accb0a0` | HTTP 404 |
| `packages/ShimuraVarietiesPartII/README.md` | `57dc0a4` | HTTP 404 |
| `packages/VStackSheavesAndLisseCategoriesPartII/README.md` | `0987ba7` | HTTP 404 |
| `packages/VectorBundlesAndIsocrystalsPartII/README.md` | `b58d862` | HTTP 404 |

## Source issues

- **Misprint** in CCM23 at §2.2 before Definition 2.2.2, printed p. 7 (CCM23 line 329): the source says the power-sum denominator has exponent d; it should be exponent s; affects a stated result.
- **Error** in CCM23 at Definition 2.2.2, (2.2.4) and the following factorisation, printed p. 8 (CCM23 lines 354, 378): the source says empty truncation at zero is zero while the depth-one factorisation applies there; it should be restricted to positive cutoff or use empty truncation one with adjusted difference laws; affects a stated result.
- **Misprint** in IKLNDP24 at §3.3, definition of J₀, printed p. 37 (IKLNDP24 lines 4154–4157): the source says children belong to the proper-prefix set I; it should be the full set J, including leaves; affects a stated result.
- **Error** in THAKUR10 at Theorem 3 proof, fourth display equality, printed p. 1979 (THAKUR10 lines 267–276): the source says ordering leading degrees permits concatenating entire vector tails; it should be the corrected mixed-product induction followed by the equal-degree induction; affects the proof.
- **Misprint** in CPY19 at Proposition 2.2.1, printed p. 6 (CPY19 line 248): the source says the rationalised module homomorphism has its matrix over K̄[t]; it should be over K̄(t), before applying the denominator conclusion; affects a stated result.
- **Misprint** in AT09 at §2.3, printed p. 4 (AT09 line 195, also confirmed on the page image): the source says base-q digits may satisfy 0≤n_i≤q; it should be 0≤n_i<q, ensuring the unique base-q expansion used for the Carlitz factorial; affects a stated result.

The author’s correction to THAKUR10 is recorded in THAKUR-UPDATES entry 36, printed pp. 7–8 (THAKUR-UPDATES lines 308–334). These are source errata, not package findings. The package uses the corrected exponent, empty convention, full tree, mixed-product induction, rational intertwiner and ordinary base-q expansion. For the last item, n=q would otherwise allow digits (q,0) or (0,1), giving factorials 1 or D₁; §3.1's base-q convention and Check Γ_(q+1)=D₁ choose the correct one.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9500295f50d3ee0b34eea0f8d44847758e13689c", "job": "REV-PKG-DrinfeldModulesAndTModulesPartII~2", "model": "gpt-6-astra", "worker": "chris-22"} -->
