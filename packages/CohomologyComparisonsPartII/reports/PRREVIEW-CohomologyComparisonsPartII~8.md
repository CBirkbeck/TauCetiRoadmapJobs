# Review of CohomologyComparisonsPartII (pull request #1364 at 0d00ac6)

**Verdict:** accepted

Incremental re-review of the 30 changed lines since 212f91b (`README.md` 29, `Suggested.lean` 1). No finding. Acceptance is conditional on the 34 declared supplier gaps.

## Previous findings

- R01 — repaired: `Suggested.lean` line 1 is `module`, line 2 `import Mathlib`; the worker's gate at this head reports `build=0`, every counter 0, `OK`; `lake env lean` exits 0 with no output.
- R02 — repaired: `packages/CohomologyComparisonsPartII/sources.toml` records `HuberKings` (arXiv math/0612611v1, sha 028c4f89…); README locators are now HuberKings line 413, 495, 532, 536, 543, 559, 563, 573, 605, each on its target (table below).
- R03 — repaired: "BesserI Proposition 6.3 (BesserI line 741–743)"; independence at "BesserI line 1116–1119"; Proposition 9.5 at "BesserI line 1141", its proof at "BesserI line 1146–1154".
- R04 — repaired: "present F^rRΓ_dR(X_K/K) by Ω^(≥r)(log D) on a de Rham datum of X_K … The datum P compactifies X_K alone and need not be X̄_K"; X̄ is an arbitrary V-compactification. The repair's new text is checked in rows F01–F08.
- R05 — repaired: "Fil^r_tub is the stupid filtration F^r on the overconvergent de Rham complex Ω•(U) of ColemanIntegration §L3.Fb.1, which that roadmap owns for X affine, X̄ projective and k algebraic over 𝔽_p"; supplier subsection and §2.2 *Needs:* added.

## Verified sound

### Adversarial table (statements the diff changes)

| ID / statement | Instance tried | Values computed on each side | Result |
|---|---|---|---|
| F01 §2.2 κ_r through a de Rham datum | X=A¹_V, r=1, X̄=Y=ℙ¹_V, P=ℙ¹_K, D=∞ | Source: RΓ(ℙ¹_K,Ω¹(log∞))=RΓ(O(−1))=0. Target H¹=K⟨x⟩†dx (discs \|x\|≤ρ, ρ>1). κ_1 filtered component 0→K⟨x⟩†dx | Defined; not an equivalence, as the Check says. |
| F02 §2.2 κ_r, nonzero filtered class | X=G_m,V, r=1, P=ℙ¹_K, D={0,∞} | Ω¹(log D)≃O, H⁰=K·dx/x. Restriction, analytification and restriction to annuli λ≤\|x\|≤1/λ give dx/x; its image in C is the generator of H¹_rig(G_m,k/K)=K, equal to sp_1(dx/x) | Composite with the forgetful map is sp_1; κ_1 is a map of fibres. |
| F03 §2.2 cuspidal-cubic Check | C: y²z=x³, t↦[t:1:t³], ν:[u:w]↦[uw²:w³:u³] | t-image: y²z=t³=x³. y=0 forces x=0: boundary [0:0:1]. Chart y=1: z=x³, smooth in every characteristic; chart z=1: y²=x³, singular. ν: y²z=w⁶u³=x³; ν(w=1)=[u:1:u³]; ν(w=0)=cusp. Near the cusp x=t^(−2), so \|x\|≥λ ⇔ \|t\|≤λ^(−1/2) | Every clause of the Check holds; C_K is not a de Rham datum, P=ℙ¹_K is. |
| F04 §2.2 X_K^an is a strict neighbourhood of ]X_k[ in X̄_K^an | X=Spec K⊂X̄=Spec V; X=A¹_V⊂ℙ¹_V | Spec K: ]∅[=∅, X_K^an=X̄_K^an=point, cofinal strict neighbourhood ∅: Fil^r_tub=0, κ_0:K→0. A¹: X_K^an=A¹,an ⊃ every disc \|x\|≤ρ | BesserI line 677–678 used at its generality (X̄ proper over V); consistent with "no equivalence for general affine X". |
| F05 §2.2 Y=X̄ allowed; ]X_k[ avoids the singularities of X̄_K | X smooth, X̄ arbitrary | Points of X̄_K^an specialising into X_k lie on the completion of X̄ along X_k, which is that of X (X open), smooth; hence ]X_k[⊂X_K^an and j†Ω^j is computed on smooth neighbourhoods | "Smooth in a neighbourhood of X" (BesserI line 1106–1108, Remark 9.2 at line 1126) suffices; I=0. |
| F06 §2.2 proper case | X=ℙ¹_V, X̄=Y=X, P=X_K, r=1 | D=∅; source RΓ(ℙ¹_K,Ω¹): H¹=K, H⁰=0; target RΓ(ℙ¹,an,Ω¹): H¹=K, H⁰=0; κ_1 is analytification | Equivalence by proper GAGA (RigidAnalyticGeometry §8.4). |
| F07 §2.2 identification with ColemanIntegration §L3.Fb.1 | X=A¹_V⊂ℙ¹_V, h=w, point [u:w] with max(\|u\|,\|w\|)=1 | U_λ={\|w\|>λ}={\|x\|<1/λ}, cofinal with the discs \|x\|≤ρ, ρ>1; F^nΩ^j=Ω^j for j≥n there, I^(r−j)Ω^j with I=0 here: the same complex | Same object on the common domain; the roadmap there assumes κ algebraic over 𝔽_p (its regulator-layer standing hypotheses), as line 78 says. |
| F08 §§2.1–2.2 existence and domination of V-compactifications | X→Spec V smooth separated of finite type; X=Spec K | EtaleCohomologyFoundations `nagataCompactification`: f separated, locally of finite type, quasi-compact over a compact quasi-separated base; Spec V qualifies. `compactificationCommonRefinement`: a dense C with maps to C₁, C₂; maps of compactifications are proper there | Hypotheses met; Spec K⊂Spec V is an instance. |
| F09 §2.2 independence bullet | A¹_V with X̄=ℙ¹_V and X̄=C_V; P=ℙ¹_K | Both tube terms equal colim_ρ Γ(\|t\|≤ρ,Ω^(≥r)) through ν (F03); κ_1=0 in both (F01) | Independent of X̄ in this instance. |

The rows of the previous reviews for statements this change leaves untouched stand as in the previous review, of 212f91b.

### Changed locators against the texts

| README locator | At that line of the extraction |
|---|---|
| BesserI line 741–743 | cone with components (rig/K0 ⊕ Filⁿ dR) → (rig/K0 ⊕ rig/K), shifted by −1 |
| BesserI line 677–678 | X_K^an is a strict neighbourhood of the tube inside X̄_K^an (manuscript p. 18) |
| BesserI line 1106–1115 | compactification, embedding in Y smooth near X, Definition 9.1 with the I-adic filtration |
| BesserI line 1116–1119 | smooth change of Y and proper change of X̄ give quasi-isomorphisms |
| BesserI line 1126, 1131, 1141, 1146–1154 | Remark 9.2; Definition 9.3; Proposition 9.5; its proof through a de Rham datum |
| HuberKings line 413 | base finite over ℤ_p (p. 11) |
| HuberKings line 495, 532, 536, 543 | Proposition 2.1.6; Proposition 2.1.7; §2.2; Definition 2.2.1 |
| HuberKings line 559, 563, 573, 605 | map (a,b)↦(a−b,(1−Φ*/pⁿ)b); Remark 2.2.2; Example 2.2.4; Proposition 2.2.7 |

- Source locators checked against the text: 18 (9 BesserI, 9 HuberKings), plus BesserI line 625, 648, 663 for the sampled §2.1; the other sampled targets lie outside the diff.
- Library declarations opened: none (the diff adds no library citation; `Suggested.lean` declares nothing, so there is no signature to compare and no statement to probe for padding).
- Cross-roadmap citations resolved: EtaleCohomologyFoundations §§G.2–G.3 on main (`nagataCompactification`, `compactificationCommonRefinement`, its `Suggested.lean` lines 155 and 161); ColemanIntegration §L3.Fb.1 at its open head; RigidAnalyticGeometry §8.1 on main; RigidAnalyticGeometry §8.4, which an open revision moves with a stated old → new entry (AdicSpacesPartIII R3.7), so the citation stays valid.
- Gate, rerun on this head: every counter 0, `OK` (the worker's run also `build=0`). Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/CohomologyComparisonsPartII/Suggested.lean` exits 0 with no output. No change outside the roadmap folder.
- Declared gaps: the 34 slugs of `design/plan.json` all occur in the README; the diff touches no contract.
- Pull request text against the head: adds the roadmap (three files); eleven not-statable headline groups equal the docstring's eleven bullets; Besser and Huber–Kings named for the rigid syntomic fibre; ColemanIntegration listed among the open suppliers; "no warning" agrees with the elaboration. No sentence contradicted.
- Headline theorems: none statable at the pins, each named in the module docstring with its missing carriers; unchanged.

Overlap check: read PadicHodgeRegulators, CohomologyComparisons, ProetaleCohomologyOfPAdicCurvesAndTowers, CstConjectureForDaggerVarieties, AInfCohomology (open, by vocabulary; the two other lists are empty) and ColemanIntegration; the tube-filtered fibre and κ_r are owned here and cited by PadicHodgeRegulators; the affine stupid-filtered overconvergent complex is owned by ColemanIntegration §L3.Fb.1 and cited here; nothing else shared.

Source independence: changed passages only; 7 passages compared with 2 sources (BesserI, HuberKings), none shared; largest share AM, 93 of 335 line locators; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- The cited sections of AInfCohomology, CohomologyComparisons, CrystallineCohomology, PadicPeriodRings, PadicHodgeTheory, PadicDifferentialEquationsAndRigidCohomology and PrismaticCohomologyPartIII are not on main; the diff adds no citation of them and they were not read again.
- The extraction of BesserI drops the bars at line 1106–1108, so "smooth in a neighbourhood of X" (not X̄) is read from Remark 9.2 (line 1126–1127), which allows Y=X̄ because X is smooth.
- BesserII remains settled as uncertified; no changed line uses it.

## Source issues

- none

## For the human reviewers

- none
