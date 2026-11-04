<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1547#issuecomment-6397022389 -->
Review (codex) of 9df63cc

Verdict: needs_changes

1. **F01** (P2) Integral derivatives do not imply semistability

   **Location:** `packages/TriangulineVarietyAndItsLocalModel/README.md:58`, and the matching `dominant-trianguline-semistability` gap in `design/plan.json`: “with strictly decreasing integral labelled parameter weights, prove semistability”.

   **Claim:** The supplier contract asks for semistability from saturated triangulinity and integral decreasing derivative weights alone.

   **Witness:** Over ℚ₃, a nontrivial ramified finite-order character has derivative 0, a saturated rank-one triangulation, and no adjacent inequality, but is not semistable. The package itself gives this negative control at README line 1082.

   **Exact repair:** In both copies of the gap, require the full unit restriction `δ_i(u)=∏_τ τ(u)^k_(τ,i)` for every unit u, with the stated integral, strictly decreasing weights. Keep arbitrary finite K and every p. Carry that condition into invocations of the semistability step. BHSsmooth17 Lemma 2.10 uses algebraic unit restriction, not merely integral derivatives (BHSsmooth17 lines 617–624). The repaired hypothesis excludes the ramified character because its unit restriction is not 1; the unramified rank-one character of weight 0 remains included.

2. **F02** (P1) The regular-locus supplier is credited with an unstated contract

   **Location:** `packages/TriangulineVarietyAndItsLocalModel/README.md:11` and `:110`: “independently of its global patching data” and “its full-character projection is smooth”.

   **Claim:** CompletedCohomologyAndLocalGlobalCompatibility §5.2a already supplies an unrestricted local construction, its regular-locus geometry and smooth full-character projection.

   **Witness:** At head 7a5b2ea, `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:1834` retains §5.1's globalisation, adequacy, local-type, projectivity and coefficient-field hypotheses. Its local paragraph states smoothness/dimension, but does not state smoothness of the full-character projection.

   **Exact repair:** Keep ownership with that supplier and declare the missing unrestricted local interface as a precise gap, in both the README and the plan's gaps list. Quantify arbitrary finite K, n≥1 and residual representation; request the reduced closure, regular open dense locus, dimensions and smooth map to the full character space. Do not silently attach global patching hypotheses here or rebuild the supplier. BHS17 Definition 2.4 and Theorem 2.6, author pp. 8–9 (BHS17 lines 298–345), supply the intended mathematical statement. Test its rank-two ℚₚ instance: source dimension 7, character base dimension 4, relative dimension 3, with no globalization datum among the inputs. A source theorem does not by itself fill a missing roadmap contract.

3. **F03** (P1) Character-space ownership is misassigned

   **Location:** `packages/TriangulineVarietyAndItsLocalModel/README.md:98` and `:106`: “provide the rigid continuous-character spaces of K× and O_K×” and “Section 3a.1 supplies the rigid character space”.

   **Claim:** General-K character carriers are missing and belong in the LocallyAnalyticDistributions gap, while PadicMeasuresIwasawaAlgebras §3a.1 already provides the ℤₚ× rigid carrier.

   **Witness:** `TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md:1464`–1474 constructs both geometric carriers, universal characters and coefficient change. `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:2210` explicitly leaves construction of rigid geometry to consumers.

   **Exact repair:** Cite PhiGammaModulesAndIwasawaCohomology §4.0 for these carriers and maps; LocallyAnalyticDistributions §3.3 is its adapter, as that section explicitly says at line 1234. Limit PadicMeasuresIwasawaAlgebras to its point/function interface. Narrow `general-character-spaces` in the README and plan to additional results genuinely absent from that interface, specifying the logarithmic-derivative and algebraic-accumulation assertions precisely. Do not request a second carrier. The supplied product model gives unit dimension d and K× dimension d+1 and the smooth relative-one projection: for K=ℚ₂ it retains two sign components, each with a one-dimensional unit disc and an additional invertible uniformizer coordinate. This repairs the ownership claim without losing the dyadic components.

4. **F04** (P1) The localization Check confuses a finite shift with the limit

   **Location:** `packages/TriangulineVarietyAndItsLocalModel/README.md:694` and `:704`: “the H¹ map to the twist-localization limit is zero; weight 2 lies outside {1} and gives the isomorphism case”.

   **Claim:** The finite-shift weight test also determines the map into full localization.

   **Witness:** Take K=ℚ₃ and δ=unr(2)x². H¹ has dimension 1. Its map to H¹(t⁻¹R(δ)) has rank 1; its map to H¹(t⁻²R(δ)), hence to full localization, has rank 0.

   **Exact repair:** Name the map in the first clause as `H¹(R_E(δ)) → H¹(t^(−k)R_E(δ))`, with k a nonnegative embedding tuple. Replace the Check's “twist-localization limit” by this finite target, and add the weight-two computation above to distinguish the limit. BHS19 Lemma 3.4.1(ii)–(iii), printed p. 350 (BHS19 lines 2068–2076), gives respectively rank 1 at k=1 and rank 0 at k=2. Keep the separate fully localized period comparison of Lemma 3.4.2. Both nonalgebraicity assumptions hold for the displayed unramified twist.

5. **F05** (P2) The KL headline loses the non-de Rham case

   **Location:** `packages/TriangulineVarietyAndItsLocalModel/README.md:1218`: “For a de Rham generic regular point”.

   **Claim:** The weight-fibre KL identity is offered only for de Rham points.

   **Witness:** BHS19 Corollary 4.3.2 and equation (4.9), printed p. 380, impose no de Rham hypothesis (BHS19 lines 3203–3219). That hypothesis first appears at lines 3220–3224 to make all supported terms nonzero.

   **Exact repair:** State the identity for §9.1's generic points with integral distinct labelled Sen weights and x∈X_tri. Put de Rhamness only on the subsequent nonvanishing conclusion and retain the extremal-cycle criterion. On the rank-two nilpotent incidence model, `N=[[0,1],[0,0]]` has its unique stable line, nonzero N and zero Cartan coordinates; the zero-section component is absent. The general identity permits zero terms there. For N=0 and relative position e, the S₂ formula with w=s remains `C_e+C_s`, with both terms nonzero. The repaired statement covers both regimes without claiming de Rham nonvanishing in the first.

6. **F06** (P2) The last-filtration graded map is silently reversed

   **Location:** `packages/TriangulineVarietyAndItsLocalModel/README.md:1704`, `:2064` and `:2176`: “kappa_(G,2)=psi”.

   **Claim:** The general κ map records graded pieces in filtration order, but the later G formulas put the rank-one derivative second although G is the rank-one submodule followed by C₁.

   **Witness:** For n=3,d=1, the ordered G target is Hom(K×,E)×Ext¹(C₁,C₁), with dimensions (2,5). Ding25 equation (2.33), p. 25, deliberately orders it as (5,2) (Ding25 lines 1128–1133).

   **Exact repair:** Before §13.6, define explicitly `κ_F:Ext¹_F→Ext¹(D₁,D₁)×Hom(K×,E)` and the reordered `κ_G:Ext¹_G→Ext¹(C₁,C₁)×Hom(K×,E)`. State that κ_G is the swap of §11.6's filtration-ordered map. Do the same for modified and partial versions; carry these source/target conventions into §§13.9–13.15. For the scalar deformation D⊗R(1+ε log), the ordered G output is `(log,C₁⊗R(1+ε log))`; swapping makes its second component log and validates both displayed formulas. Add this discriminating Check.

7. **F07** (P2) The analytic gap is a compound, underspecified contract

   **Location:** `packages/TriangulineVarietyAndItsLocalModel/README.md:88` and the matching plan gap: “completed-ring injectivity above proper birational normalization” and “the relevant coherent Herr loci”.

   **Claim:** One sentence requests unrelated openness, completion, cohomology-change and constructibility results without specifying the injective map, the cohomology degrees/base-change conditions or the constructibility hypotheses.

   **Witness:** At `A=E[[x,y]]/(xy)`, normalization gives A→E[[x]]×E[[y]] with kernel 0, but either single-branch projection has nonzero kernel. Reducedness and proper birationality alone do not select the required injectivity statement.

   **Exact repair:** Replace this bundle by precise named subcontracts (and matching gap entries if split). For completion descent, specify the product over every normalization point above the chosen classical point, and the normal/excellent, locally projective birational stages used afterwards, as in NT21 Proposition 2.15's proof, pp. 37–38 (NT21 lines 1463–1485). State exactly which coherent Herr complexes and Tor/base-change loci are required; import their existing PhiGammaModulesAndIwasawaCohomology §§3.4a, 7.6–7.8 results instead of requesting them again. Separately quantify the rigid openness and constructibility comparisons actually missing. Keep §7.2's already-correct product route. On the node the corrected map sends y to (0,y), and its kernel is 0; the single-branch map kills y. This is a precision/minimality finding, not a finding that a declared gap is unimplemented.

8. **F08** (P2) Large-gap saturation is narrowed to make its proof route work

   **Location:** `packages/TriangulineVarietyAndItsLocalModel/README.md:1064` and `:1070`: “integral ... that are dominant” and “because dominance makes every other summand ... nonnegative”.

   **Claim:** Section 8.3 adds dominance to the cited large-gap theorem and proves only that restricted form.

   **Witness:** BHSsmooth17 Lemma 2.10, author p. 15 (BHSsmooth17 lines 617–624), assumes algebraic unit weights and the displayed gap inequalities, without dominance. Its proof's aggregate inequality at lines 642–648 needs an additional argument.

   **Exact repair:** Retain the full large-gap assertion as a named target at the source's generality; treat the presently justified dominant case as a corollary/Check. Add an explicit proof obligation establishing saturation without an a priori dominance assumption, with its actual geometric inputs and Needs, rather than assuming dominance to execute this route. Record the source proof gap below. If dominance is instead claimed essential, substantiate that with an actual point of X_tri and an erratum; the present numerical non-example does not establish it. Test the route on two embeddings with gaps −2 and prefix valuation −3: each inequality −2>−3 holds, while the attempted aggregate comparison −3<−4 fails. These numbers are not asserted to arise from a point. The repaired route must use the geometric hypotheses to handle or rule out this case; the valid e=2, slope 1, gap 3 test still gives 3>2.

9. **F09** (P2) Earlier suppliers are promised as downstream consumers

   **Location:** `packages/TriangulineVarietyAndItsLocalModel/README.md:2272`: “PadicFamilies ... and ModularityAndLanglandsExtensions §4.3 use” and “its global conclusions ... can consume”.

   **Claim:** Earlier roadmaps, including suppliers used here, will consume this roadmap's new results.

   **Witness:** `merge-order/ORDER.txt:190`, `:247`, `:255` and `:303` place PadicFamilies, CompletedCohomologyAndLocalGlobalCompatibility and ModularityAndLanglandsExtensions before this roadmap. Their promised consumption would reverse supply; the latter two are also suppliers here.

   **Exact repair:** Delete these promises from Downstream consumers. Keep their independently owned inputs in Scope and ownership. Retain the genuine later consumer PadicHodgeParametersInLocallyAnalyticRepresentations TR1–TR5 (order line 304). Any new application to an earlier roadmap belongs in a separately owned later Part II, with an actual section, not a future dependency of the existing roadmap. The numerical order test then changes from consumers at 190/247/255 <303 to the declared consumer at 304>303. The mechanical dependency check reports no present cycle; this finding concerns the contradictory consumer contract, not a fabricated UPWARD line.

Nine blocking findings: three P1 and six P2. The local-model and higher-intertwining scope is repairable; this is not a rejection or a request to re-plan an existing roadmap. The four input files were left unchanged. No earlier review was supplied.

## Verified sound

**Coverage and principles.** Read all 93 numbered sections, their API bullets, all Checks, all 93 Needs lines, all 13 layer introductions/Examples/Dependencies, the conventions, supplier contracts, worked examples and references. Kept a computed 93-target ledger in the job scratch area; the selection below covers every seeded target, headline family and finding witness. Checked the 11 gap slugs against the plan: all are named, appear in both places and have named suppliers. R01, R03 and R07 concern their content, not their pending implementation. No route-specific prime exclusion, copied source passage, computational algorithm, sorry'd data or set_option was found. The dominant-only route and backwards consumer promises are separately reported above. No blanket claim of truth follows from the Lean build.

**Shape.** The README has the required summary, scope, conventions, per-supplier contracts, reading guide, 13 ordered layers, downstream section and references. Every construction/definition block has an API and at least three Checks; theorem-only sections need not have three. Each numbered section has its own locator and Needs line. Main-branch SchemeAndStackFoundations, RigidAnalyticGeometry and PadicFunctionalAnalysis were read for house shape. The checked mathematical prose is independently phrased, rather than copied source paragraphs. No package-input file was changed.

**Seeded source verification.** All eight manifest works were legally available in the supplied cache; the recorded versions were used. No author-flagged unverified locator or uncertified/waived entry was found. All 15 sampled passages were opened, including the proof steps used by the roadmap:

| Sample | Exact source read | Outcome |
|---|---|---|
| 2.4 | BHS19 Theorem 3.2.5, p. 341; lines 1680–1736 | Regular almost de Rham lattice and framing hypotheses retained. |
| 3.2 | BHS19 Lemma 3.3.4, pp. 343–344; lines 1805–1829; Definition 3.3.8, p. 347; lines 1953–2005 | Localization identifies algebraic twists; the residual parameter and its Artinian lift are retained. |
| 4.6 | DLB17 proof of Lemma 6.3, arXiv p. 31 / published p. 356; lines 1250–1256; Colmez08 Lemma 3.2 and Definition 3.4, p. 231, lines 700–722; Definition 4.1, p. 237, line 944 | Correct common φ/Γ eigenline repair, saturation and finite coefficient extension. |
| 5.4 | BHS19 Proposition 3.4.6 and Lemma 3.4.7, p. 354; lines 2219–2239 | Generic lifted-triangulation context and ν=0 splitting; repeated parameters correctly excluded. |
| 6.4 | BHS19 Corollary 3.5.8, pp. 359–360; lines 2413–2437, with hypotheses at lines 2305 and 2321 | Both period frames and relative dimension retained. |
| 8.3 | BHSsmooth17 Lemma 2.10 and proof, author p. 15; lines 617–656 | Unit algebraicity retained here; R01 concerns the gap, R08 the added dominance and proof gap. Numbering differs from arXiv v1 and is documented. |
| 8.4 | BHS19 Proposition 4.1.4, pp. 373–374; lines 2946–2956; BHSsmooth17 Proposition 2.12 proof, pp. 16–17, lines 674–729 | Flatness is supplemented by crystalline density; algebraic unit weights and generic regular setting retained. |
| 9.1 | BHS19 §4.3, pp. 378–379; lines 3126–3187 | Weight-fibre codimension, smooth descent and generic lengths agree. |
| 9.2 | BHS19 Corollary 4.3.2 and (4.9), p. 380; lines 3203–3224 | Formula and KL direction correct; unnecessary de Rham restriction is R05. |
| 10.6 | Ding25 Propositions 2.7–2.8, p. 14; lines 599–616, endpoint context at 579–598 | Selected-embedding annihilator is a line for every K; off-σ cutoff is the ambient minimum. |
| 11.1 | Ding25 (2.11), p. 15; lines 657–664, dimension context at 396–404 | Rank-one character derivatives and smooth/single-embedding dimensions agree. |
| 11.3 | Ding25 Proposition 2.10 and Lemma 2.11, pp. 16–17; lines 679–740 | Derivative surjectivity, smooth preimage and inverse-permutation convention agree. |
| 13.7 | Ding25 Corollary 2.33, p. 29; lines 1263–1271 | Correct intersection formula and full subtraction; source arithmetic typo was not propagated. |
| 13.9 | Ding25 definition before Corollary 2.34 and its proof, p. 30; lines 1274–1307 | Opposite twists, signs and existence of matched representatives agree; apply R06 to its κ_G identification. |
| 13.12 | Ding25 Theorem 2.37, p. 31; lines 1344–1355, partial image context at 1308–1338 | Correct partial hypotheses and K-Robba coefficient ring; apply R06 to graded-coordinate order. |

Additional direct source checks included BHS17 Definition 2.4/Theorem 2.6; BHS19 Lemmas 3.4.1–3.4.3 and proof of Proposition 3.7.2; Ding19 Appendix A, Propositions A.3/A.5 and Corollary A.4; Ding25's paraboline, modification and recovery formulas; NT21 Lemmas 2.4/2.8, Definition 2.9, Example 2.10 and the proof of Proposition 2.15/Remark 2.16. Source discrepancies found while reading them are listed below.

**Computed adversarial selection.** “Excluded” means an explicit standing hypothesis excludes the instance, not that the computation is omitted. A=E[ε]/ε² in infinitesimal rows. These are finite diagnostic computations; they do not purport to prove the general theorems.

| Statement | Instances | Values computed on the two sides / competing models | Result and change |
|---|---|---|---|
| Conventions; 1.1–1.4 | Tate line; A; n=2,d=2 | φ(Tate)=1 versus φ(x)=p; weights +1/−1; filtration −1. ν=ε has ν²=0 but charpoly X−ε≠X. Frames 8 versus 4 versus 2. | Signs, infinitesimals and frames sound. |
| 2.1–2.4, sample/headline | n=2,d=1; n=1,d=2 | Resolution dimensions 1+3=4 and 0+2=2. Weights (0,2) give flag ranks 1,2; repeated (0,0) gives only 0,2. | Regularity and second resolution sound. |
| 3.2, sample | δ versus δx; δ(1+ε log) | Localized lines are isomorphic; lifted derivatives differ by ε despite equal residues. | Based parameter distinguishes wrong unmarked model. |
| 4.3–4.4, headline | Ordered weights 0,3; slope 2 | 2<3 true; 2<2 false. At two embeddings, gaps 3,1 reject slope 2. | Strict numerical criterion sound. |
| 4.6–4.7, sample/headlines | Unit⊕Tate over ℚ₂; P=1 and P=0 | φ(e₁+e₂)=e₁+e₂; γ-image=e₁+5e₂≠that line. Common eigenline gives ranks 1+1. ker(1)=0; ker(0)=whole module. | Simultaneous stability and nonzero P essential. |
| 5.1, 5.3–5.4, sample/headline | ν=0 versus Jordan; scalar derivative ε | (ker,coker) dimensions (2,2) versus (1,1); matching equation ε=ε holds, ε=0 fails. Repeated unit lines give two distinct flags. | Smooth comparison and splitting controls sound. |
| 5.2, R04 | ℚ₃,unr(2)x²,k=1,2,∞ | Source H¹ dimension 1; map ranks 1,0,0 respectively. | False limit Check; name finite target. |
| 6.3–6.4, sample/headline | n=2,d=2 and n=1,d=2 | 14=8+6; 4=2+2. | Double-flag relative dimensions sound. |
| 6.5–6.7, headline | n=1; dual-number Cartan coordinates | One component in rank one. w=(123) takes second graph coordinate to (2ε,3ε,ε), not (ε,2ε,3ε); all reduce to 0. | Component detection needs Artinian points. |
| 6.8–7.4, headline | n=2,d=2; n=1,d=2 | Galois/period comparison 10+8=14+4=18; local model 10+8=8+10=18. Rank one 3+2=2+3=5. | Both framings counted correctly. |
| 6.9, 8.5, headline | Smooth incidence; S₂; S₃ longest element | Tangent 4−8+6+8=10; bound 7−1+1=7; longest S₃ bound 15−1+3=17. | Reflection rank is not Coxeter length. |
| 7.2 and gap, R07 | Reduced node | ker(A→E[[x]])=(y)≠0; ker(A→E[[x]]×E[[y]])=0. | Target's product route sound; gap needs exact map and hypotheses. |
| 7.3 | Distinct versus repeated residual roots | (X−ε)(X−2−3ε)=X²−(2+4ε)X+2ε; (X−ε)(X+ε)=X². | Distinctness is needed for root matching. |
| 7.5–8.1, headline | n=2,d=1; xy=t | Source 7, full-character base 4, unit base 2: fibers 3 and 5. xy=t is flat, t=0 singular. | Normal/CM consequences and distinction from smooth projections sound. |
| 8.2, 8.4, sample/headline | p=2,3; weight sequence indexed by m | p-adic limits (a,b); real gap a−b+2(p−1)p^m→∞. At p=2 multiplier p−1=1. | Accumulation test sound with density input. |
| 8.3, sample; R01/R08 | e=2, slope 1; finite-order rank one; two embeddings | Gap 3>2; gap 2≯2. Finite-order derivative 0 but semistability false. Two negative gaps: −2>−3 each, aggregate −3<−4 false. | Unit hypothesis needed in gap; full source generality needs an additional route. Negative arithmetic data are not an asserted Galois point. |
| 8.6–8.7, headline | Rank-two distinct/equal eigenvalues; S₂ | Distinct ordered roots give 2 reduced points; equal roots give one point of length 2. w_x=e allows 2 parameters, w_x=s allows 1. | Étaleness and Bruhat direction sound. |
| 9.1, sample | (n,d)=(2,1),(2,2),(1,2) | Ambient minus weight codimension: 8−3=5; 12−6=6; 3−2=1. | Weight/full-character fibers correctly distinguished. |
| 9.2, sample/headline; R05 | S₂, w=s,w_x=e; N nonzero | Coefficients 1,1 give C_e+C_s; P_(s,e)=0. Nonzero rank-two nilpotent excludes zero section while Cartan remains 0. | Formula sound; restore non-de Rham regime and allow zero terms. |
| 9.4–9.5 | Signed cycles and triangular equations | Z+(−Z)=0 with nonzero summands. F₂=C₂,F₁=C₁+2C₂ yields C₁=F₁−2F₂; one zero equation admits all (a,−a). | All-family separating contract necessary; effectivity not smuggled into conjecture. |
| 9.6–9.9, headline | Generic split crystalline rank two, d=1,2 | At d=1 full fiber dimension 3, two component multiplicities 1, unit fiber 5; at d=2 full 4 versus unit 6. | Crystalline formula and worked example dimensions agree. |
| 10.2–10.6, sample/headline | n=3, off-σ (3,1,0), d=2 | Original endpoints (3,1),(1,0); modified both (0,0). Original annihilator 2, selected-embedding annihilator 1; d=1 both 1. | Ambient cutoff and recovery scope sound. |
| 10.7, headline example | a=2 versus a=0,1 | (1,−1,1)·(1,2,1)=0; at 0 line coordinate vanishes; at 1 plane-normal coordinate vanishes. | Discriminating noncritical example sound. |
| 11.1, sample | Rank one,d=2 | Hom dimensions smooth 1, σ-analytic 2, full 3; valuation(uniformizer)=1 with zero unit derivative, log derivative≠0. | Character derivative interface sound. |
| 11.3–11.4, sample/headline | n=3,d=1 and d=2 | Self/de Rham/refinement 10,4,7; target 6 gives kernel 1. At d=2 full 19 minus kernel 4 gives quotient 15. 3-cycle (1,2,3)→(3,1,2). | Dimensions and Weyl transport sound. |
| 11.5–11.7, headline | n=3,d=1, blocks 2,1 | dim P=4+2+1=7; Ext=8; quotient=8−1=7=4+3=5+2. Rank-two scalar enlargement has 3 directions versus de Rham 2. | Positive sign before n and ordered graded ranks sound. |
| 12.2–12.7, headline | n=3,d=2 | Partial 13, partial paraboline 11; zero spaces 4→1 with kernel 3. Quotients 13−4=10−1=9. Full modification image 19−3=16<19. | Surjectivity correctly restricted; modified full derivative kernel is not de Rham zero-space. |
| 13.1–13.5, headline | Identity/zero maps; n=3,d=2; n=4,d=1 | Identity signed range contains (1,−1), excludes (1,0),(1,1). Exceptional image/intersection/sum 4,1,7 and 6,3,9; generic injection image at n=3,d=2 is 5. | Matched-image and injection rigidity controls sound. |
| 13.6, 13.12, sample/headline; R06 | n=3,d=1; scalar log; partial log_σ | Ordered G target (2,5), intended target (5,2); (1−εψ)(1+εψ)=1. log_σ allowed, log_τ excluded for τ≠σ. | Explicit target reversal repairs the formulas. |
| 13.7–13.8, sample/headline | n=3,d=2; n=2,d=1 | 15+15−11=19; 4+4−3=5. | Full intersection, including constant 1, is subtracted. |
| 13.9–13.10, sample/headline | ψ and −ψ; n=3,d=1 | ψ+(−ψ)=0; common M maps to (pull M,−push M). V dimension 2(5+2)=14; target 9, kernel 5. | Signed relation and exact-sequence dimensions sound after R06. |
| 13.13–13.16, headline | n=3,d=2; n=2,d=2 | Both recovery targets 9 and middle terms 14, kernels 5. Rank-two original partial sum 5+5−4=6; modified sum 4+4−3=5. | Original/modified partial generation distinguished. |
| Character suppliers, R03 | ℚ₂× | Two sign components; unit dimension 1, full dimension 2, difference 1; −1 evaluates to +1 or −1. | Existing carrier suffices; do not discard torsion or re-own it. |
| Regular-locus contract, R02 | n=2,d=1 | 7−4=3 relative to full characters; 7−2=5 relative to units. | Desired local statement is precise; supplier contract must actually state it. |
| Supply direction, R09 | Merge positions | 190,247,255<303, but genuine downstream 304>303. | Delete backward consumer promises. |

**Headline and Lean audit.** All 17 headline groups below occur by name in the module docstring, with the missing carriers identified. The pin searches found no actual Robba/period deformation or trianguline moduli carrier from which these can be stated by a few simple native definitions. The generic modules, matrices, schemes and cycles that do exist do not encode these objects. Thus an empty namespace is appropriate; adding abstract linear algebra substitutes would be a defect.

| Headline group in README | Target sections | Missing pinned carrier named in Suggested.lean |
|---|---|---|
| Framed almost de Rham and regular lattice equivalences | 1.2–2.4 | Coefficient period representations/lattices and Artinian deformation groupoids |
| Filtered localized period smoothness | 5.3 | Localized Robba modules and period comparison |
| Double-flag model and normal component rings | 6.4–6.6 | Robba deformation functors and incidence components |
| Galois component detection/indexing/tangents | 6.7–6.9 | Localized trianguline condition and period/Cartan maps |
| Analytic completed local model | 7.4 | Rigid trianguline variety and completions |
| Normality, CM and character flatness | 7.5, 8.1 | Variety and character projections |
| Crystalline accumulation and companions | 8.4, 8.7 | Crystalline and refined deformation spaces |
| Weight KL and full-character multiplicities | 9.2, 9.8 | Analytic fibers, completed cycle transfer and constituents |
| Injection-line Hodge recovery | 10.4, 10.6 | Crystabelline modules, endpoints and periods |
| Refinement transport and paraboline products | 11.3, 11.7 | Robba self-Ext and derivative maps |
| Partial modification/quotient comparison | 12.5, 12.7 | Selective modification and partial Ext |
| Injection-image/matched-relation rigidity | 13.3, 13.5 | Actual Robba Ext and induced maps |
| Higher intertwining/tangent generation | 13.6–13.8, 13.12, 13.16 | Filtration deformations and infinitesimal twists |
| Original/single-embedding recovery sequences | 13.10, 13.14–13.15 | Higher-intertwining relation on tangent quotients |
| Numerical WD noncriticality | 4.4 | De Rham representations, WD flags and triangulations |
| No finite-dimensional stable subspace | 4.6 | Robba realization and triangulinity condition |
| Polynomial-connection injectivity | 4.7 | Robba realization and Gamma connection |

Ran the prescribed `lake env lean` on the package's Suggested.lean from the pinned content checkout: **exit 0, no warnings**. The file has the single `import Mathlib`, one module docstring and the required namespace. It contains **zero declarations, zero sorries, zero examples, zero TauCeti imports and zero options**. Consequently the per-declaration `#check @name` comparison and one-tactic probe each have zero cases; no scratch substitute theorem was invented. There is no sorry'd data, stand-in or padding to delete. No targeted TauCeti build was needed. No Lean process was left running.

**Pinned library audit.** Pins read from the manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Opened the following bodies and hypotheses, rather than relying on names:

| Pinned declaration | File and line | What it supplies, and does not supply |
|---|---|---|
| `LinearMap.prod` | `Mathlib/LinearAlgebra/Prod.lean:95` | Pairing on one source; no independent-preimage matched range |
| `LinearMap.range` | `Mathlib/Algebra/Module/Submodule/Range.lean:57` | Actual map image; no period or saturation condition |
| `LinearMap.ker` | `Mathlib/Algebra/Module/Submodule/Ker.lean:59` | Zero preimage; no de Rham condition |
| `Submodule.finrank_sup_add_finrank_inf_eq` | `Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean:53` | Dimension formula with finite-dimensional subspaces |
| `LinearMap.finrank_range_add_finrank_ker` | Same file, line 173 | Rank-nullity with finite-dimensional source |
| `AdicCompletion` | `Mathlib/RingTheory/AdicCompletion/Basic.lean:171` | Compatible quotient system; does not itself construct a deformation moduli space or automatically supply every completion comparison |
| `Module.length` | `Mathlib/RingTheory/Length.lean:30` | Length valued in ℕ∞; finiteness needed before integer multiplicities |
| `AlgebraicGeometry.AlgebraicCycle` | `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44` | Locally finite cycle functions; integer specialization does not quotient by rational equivalence |

Object searches in both pinned libraries covered Robba modules, B-pairs, period realizations, trianguline/crystabelline deformations, Orlik–Strauch and simultaneous-resolution/incidence objects. Mere occurrences of “Springer” as a publisher and unrelated Steinberg group endomorphisms were not counted as these carriers. There is no named package declaration that could collide with another roadmap's fully qualified Lean name.

**Ownership and resolved cross-roadmap citations.** Main was checked at `5f173a7b9ac37eb6b62d01eb3db5047b92d19363`. Used the roadmap service's indexed open heads and object searches, not just this package's identifiers. Its resolver returned no unresolved citations/names, but that is only a lead: it did not inspect the pinned packages, which were opened separately. The substantive drift is R02/R03. Representative resolution evidence, including all supplier families consumed by the Needs lines:

| Owner / snapshot | Sections and opened locations | Ownership conclusion |
|---|---|---|
| PadicHodgeTheory, head 4c4f1e8 | §§3.2, 4.3–4.5, 5.2, 6.3; README lines 659, 853, 887, 927, 1003, 1175 | Tate sign, Sen/period realizations, field B-pair equivalence, full-rank quotient invariants and filtered-module modification belong there. Artinian and selective extensions remain named contracts, with R01 correction. |
| PhiGammaModulesAndIwasawaCohomology, head 6ec1d64 | §§1.0c, 1.1–1.2, 3.1, 3.4a, 3.8–3.9, 4.0, 7.1–7.8; README lines 616, 675, 705, 1020, 1131, 1383, 1412, 1457, 2254, 2291, 2342, 2377, 2422, 2444, 2507, 2542 | Robba/Herr/character/triangulation foundations are imported. Artinian localization does not itself identify the period-deformation adapters here. Character-space duplication is R03. |
| LocalGaloisDeformationRings, head 11b2c65 | §§0.4, 1.1, 1.4, 1.12, 1.18, 1.23, 3.4, 3.6, 3.10; README lines 1259, 1293, 1357, 1485, 1585, 1674, 2415, 2446, 2535 | Actual lifting rings and individual tangent dimensions are supplied; simultaneous-refinement derivative relations are additional. The monodromy witness Nφ(e₂)=p e₁=pφN(e₂) agrees. |
| CompletedCohomologyAndLocalGlobalCompatibility, head 7a5b2ea | §5.2a, README lines 1830–1853 | Reduced closure and local geometry are assigned there, but the advertised unrestricted full projection contract is not present: R02. |
| ModularityAndLanglandsExtensions, head 2d70821 | §4.3, README lines 2671–2726 | Ordered regular deformation functors, tangent inclusion and density repair resolved. They do not replace the retained numerical WD or ordinary-flag results. |
| LocallyAnalyticDistributions, head 3a4526a | §§3.3–3.4, README lines 1228–1250, 1314–1337 | Geometric/Mellin adapters resolved; §3.3 explicitly imports PhiGamma §4.0. |
| PadicFunctionalAnalysis; PadicMeasuresIwasawaAlgebras, main | §§5.1–5.3, README lines 837–941; §3a.1 context, lines 2201–2241 | Point/coordinate and function interfaces resolved, including both dyadic torsion components; the latter is not the rigid carrier owner. |
| DeformationAndDerivedPatchingAlgebra, head a3b5dea | §§1.6–1.9, 1.11, 1.13–1.14, 2.1–2.7, 3.1–3.2; README lines 178–338, 388–502 | Coefficient, completion, hull and obstruction inputs resolved; exact finite coefficient and finiteness conditions matter. Normal/excellent completion support also comes from SchemeAndStackFoundations, not a bare dimension identity. |
| SchemeAndStackFoundations, main | §§0.16–0.17, 0.21, 4.3–4.5; README lines 1099, 1138, 1394, 5135, 5194, 5244 | General local algebra and Schlessinger ownership resolved. |
| RigidAnalyticGeometry; AdicSpacesPartII, main | §§1.2, 7.3, 8.1–8.3, README lines 205, 617, 690, 720, 738; R1.1/R1.5/R1.7/R1.9, lines 8486, 9575, 9806, 10509 | Rigid local rings/completion and adic transport resolved. Remaining analytic contracts need the precision of R07. |
| PadicDifferentialEquationsAndRigidCohomology, head 5ea2fe1 | RD.2.43, README lines 5604–5630 | Connection/differential-equation owner; the arbitrary-polynomial finiteness extension is declared. Its de Rham applications do not duplicate the all-nontrianguline obstruction here. |
| SpringerResolutionAndCharacteristicCycles, board design | `packages/SpringerResolutionAndCharacteristicCycles/design/README.md`: F targets at 50/80/100; G at 174; I at 264/372/402; C at 522/542; N at 566/620; S at 764; Y at 785/815/845; K at 1445/1464; P at 1518; T at 1589/1609/1627; E at 1650/1683/1733 | Every cited target ID exists. General flag/incidence/KL/completion theory stays there; this roadmap owns its period/Galois transfer. These are read design contracts, not invented implemented declarations. |
| LocallyAnalyticRepresentationsOfLocalGroups, board design | `packages/LocallyAnalyticRepresentationsOfLocalGroups/design/README.md`: LR.4 principal-series at 1047; LR.5 functor/exactness/irreducibility/Jordan–Hölder/products at 1176/1212/1240/1256/1272 | Actual representation carriers and multiplicities imported. GL_n has no small-p exclusion here. BHS-specific convention and all-family separating extensions are explicitly contracted. |
| PadicHodgeParametersInLocallyAnalyticRepresentations, board design | `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/design/README.md:59`, 65, 71, 77, 83 | TR1–TR5 are genuine later consumer contracts for these Hodge/deformation adapters and recovery sequences. |

The object audit also distinguished the rank-two field period models of PadicLocalLanglandsForGL2Qp from arbitrary-rank Artinian period deformation groupoids, and the geometric Hodge/Grassmannian objects of AdmissiblePairsAndPadicHodgeStructures from the almost-de-Rham nilpotent lattice adapter here. Open-head character-space adapters in OverconvergentAutomorphicForms explicitly confirm PhiGamma §4.0's ownership. No generic matrix, flag, cycle or linear-map API is re-declared in Suggested.lean. The inaccessible board package heads are listed under Not verifiable; no absence claim is based on their failed fetches.

**Dependency check.** Ran the requested movable dependency check with the supplied configuration and order, without editing either. Its exact output was:

```text
depcheck: 51 roadmaps, 592 edges, 0 problem(s)
```

Exit status 0; no UPWARD, CYCLE or moved line. Independently read all Needs lines and verified internal dependencies point to earlier sections. Section 11.7 explicitly avoids using §13.8 in a circular proof route. R09 records prose promises not represented by a current dependency edge. Missing implementation of the remaining declared supplier gaps is not treated as an unowned prerequisite.

## Not verifiable

- The board package index was read before the ownership audit. Fetches at its recorded heads returned HTTP 404 for these 15 README files: ArithmeticLocallySymmetricSpacesPartII (84a41ac), CompletedCohomologyAndLocalGlobalCompatibilityPartII (948c94c), CrystallineCohomologyPartII (84ea77e), EndoscopicTransferAndUnitaryTraceComparisonPartII (80a66cc), HigherHidaAndColemanTheory (da88512), LawrenceVenkateshMethod (9ee7ac3), OrdinaryAutomorphicFormsAndModularityLiftingPartII (7e88c38), PELModuliPartII (d4bb48d), PadicHodgeTheoryPartII (6502997), PadicLocalLanglandsForGL2QpPartII (3e0777d), RealSurfacePeriodIndex (875bca4), SchemeAndStackFoundationsPartII (accb0a0), ShimuraVarietiesPartII (57dc0a4), VStackSheavesAndLisseCategoriesPartII (0987ba7), VectorBundlesAndIsocrystalsPartII (b58d862). Ownership against those package contents is not certified. The other five indexed package READMEs were accessible and yielded no matching local-model/Robba/partial-de-Rham/Hodge-recovery objects in the object search. Main and the roadmap service's open heads were searched separately.
- No sampled mathematical text was inaccessible. No additional source fetch or missing-reference request was needed, and no source manifest entry was altered. The proof gaps identified in readable sources are findings/source issues, not classified as inaccessible text.

## Source issues

- **Misprint** in Ding25 at Lemma 2.11 proof, printed p. 16 (Ding25 line 708): the source says the last triangulation factor carries the first Hodge weight; it should be the last Hodge weight h_n; affects the proof.
- **Misprint** in Ding25 at Corollary 2.14 proof, printed p. 19 (Ding25 line 860): the source says the quotient dimension subtracts n from d times the Borel–Levi dimension; it should be d times that dimension plus n; affects the proof.
- **Misprint** in Ding25 at Theorem 2.32, printed p. 28 (Ding25 line 1236): the source says the cancelling rank-one twist uses a Robba coefficient symbol without K; it should be the K-Robba ring over the dual-number coefficients; affects a stated result.
- **Misprint** in Ding25 at Corollary 2.33 proof, printed p. 29 (Ding25 line 1270): the source says a malformed expression subtracts and adds parts of the intersection dimension; it should be twice the paraboline dimension minus the entire intersection dimension; affects the proof.
- **Misprint** in Ding25 at Theorem 2.37, printed p. 31 (Ding25 line 1352): the source says the cancelling twist has a coefficient-ring symbol omitting K; it should be the K-Robba ring over the dual-number coefficients; affects a stated result.
- **Misprint** in NT21 at Lemma 2.4 proof, printed p. 29 (NT21 lines 1105–1107): the source says the next graded parameter is indexed for every i through n; it should be indexed only for 0≤i<n; affects the proof.
- **Gap** in DLB17 at Lemma 6.3 proof, arXiv p. 31 / published p. 356 (DLB17 lines 1253–1256): the source says a Frobenius eigenvector suffices to invoke the rank-one saturation argument; it should be a common Frobenius–Gamma eigenvector obtained from the stable finite-dimensional kernel; affects the proof.
- **Gap** in BHS19 at Proposition 3.7.2 proof, printed p. 367 (BHS19 lines 2691–2694): the source says reducedness makes the completed map at one chosen point upstairs injective; it should be a justified injective product over branches, followed by descent of the ideal; affects the proof.
- **Gap** in BHSsmooth17 at Lemma 2.10 proof, author p. 15 (BHSsmooth17 lines 642–648): the source says the individual gap bounds force its summed permutation inequality; it should be justified using the geometric hypotheses when dominance has not been assumed; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9df63ccddf879ccbb2ed1688d6a3ab3e7e0d9903", "job": "REV-PKG-TriangulineVarietyAndItsLocalModel", "model": "gpt-6-astra", "worker": "chris-7"} -->
