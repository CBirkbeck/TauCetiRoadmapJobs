# GATE-PadicHodgeRegulators~4: answers to human review

One review (roed-math, 2026-11-06, cross-PR overlap check) made five points, H01–H05. All edits are in `TauCetiRoadmap/PadicHodgeRegulators/README.md`; `TauCetiRoadmap/PadicHodgeRegulators/Suggested.lean` is unchanged. Commit `13305d88`, not pushed.

## H01 (roed-math) — applied differently

Every "LocalFieldsRamification Layers 1–2" citation (old README lines 13, 39, 516, 894, 924) now cites the pinned Tau Ceti declarations directly: `TauCeti.unitFiltration` (`TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean`), `TauCeti.hasSum_log_of_mem_unitFiltration_one` and `TauCeti.continuous_log_unitFiltration` (`TauCeti/NumberTheory/LocalField/Logarithm.lean`, convergence and continuity on U(K,1)), and `TauCeti.deepUnitExpLogEquiv K hi : U(K,i) ≃ₜ* Multiplicative (𝓂[K]^i)` for e < (p − 1)i (`TauCeti/NumberTheory/LocalField/DeepUnits/Basic.lean`). This differs from the suggestion because #617 revises an existing (Completed) roadmap, so it is not a dependency. Citing pinned declarations means the citation holds under both main's numbering and #617's. On main, Layer 2 of LocalFieldsRamification is unramified extensions, so "Layers 1–2" was imprecise there as well.

## H02 (roed-math) — applied

The rigid syntomic supplier section now uses CohomologyComparisonsPartII §2.2's fibre exactly: f_n(a,b)=((1−p⁻ⁿφ)a, bc(a)−sp_n(b)) from A⊕FⁿRΓ_dR to A⊕C. Any formula imported from the Huber–Kings order goes through §2.2's coordinate isomorphism (a,b;u,v)↦(b,a;−v,u). η is now defined as Huber–Kings' η (HK2011 Example 2.2.4 and Definition 2.2.5, pp. 14–15) carried through that isomorphism: η[(u,v)]=(1−σ/pⁿ)⁻¹u−v. The old Check "η([(0,c)])=(1−σ/pⁿ)⁻¹c" is replaced: at ℤₚ, n=2, the class with A-component c has η-value c/(1−p⁻²), and the class with C-component c has η-value −c. The reviewer's value −(1−σ/pⁿ)⁻¹c is what the C-normalized functional v−(1−σ/pⁿ)⁻¹u gives. That functional is −η, and a new Check records that it would make the weight-one regulator −logₚ. Because η is the same map as before, the downstream uses in §§4.1–4.5 are unchanged. §7.1's collapsed unramified model is unaffected, since the C-slot drops out when the fibre collapses (checked: b↦(sp b, b) is a chain map onto the A-slot with no sign).

## H03 (roed-math) — applied differently

All four "What CohomologyComparisonsPartII must provide (gap:…)" paragraphs (old lines 96–102) and every "gap:" reference are deleted. None of the four is carried as an undischarged hypothesis; each is now either supplied or owned here:

- rigid-negative-weights: supplied by CohomologyComparisonsPartII §§2.1–2.3. Its current head (212f91bd, newer than the 8858e49 the review checked) defines the fibre and products for every integer r, with Fʳ=F⁰ for r≤0.
- dagger-syntomic-filtration: supplied by CohomologyComparisonsPartII §2.2, which gives the tube-filtered (Besser/Huber–Kings) variant, the comparison κ_r, its equivalence for X proper (including Spec V) and the Huber–Kings identification. §2.2 explicitly leaves the Chern compatibility of κ_r as regulator content. That compatibility is now a target in §4.1, with an API bullet. Route: Besser2000 Proposition 9.5, author p. 30, plus uniqueness of the universal class by its de Rham image (HK2011 Proposition 2.2.7 and the paragraph before Definition 2.3.3, pp. 15–16).
- normalized-syntomic-boundary: CohomologyComparisonsPartII §3.4 supplies ω_Q∘δ_U=pʳ·δ_D. The Bloch–Kato sign, the range (isomorphism for i≤r−1, injection for i=r, from CN2017 Corollary 3.16, whose hypothesis is the same quasi-compact formal semistable X) and the exponential square were already §4.6's own statements. §4.6 is now unconditional.
- semistable-period-descent: no roadmap supplies it. NoncommutativeAndEquivariantIwasawa §F.6 owns D_pst and the filtered descent of D_dR, but not H¹_st or its complex. It is now a target in §7.7 ("Potentially semistable descent", parts (a)–(c)), proved from NN2016 §2.4 (definition of C_pst and Remark 2.12, p. 14; proof of Proposition 2.16, p. 15) and inflation–restriction with ℚₚ-coefficients. §§7.10–7.11 cite it.

## H04 (roed-math) — applied

Polylogarithms comes before this roadmap in the merge order (line 290 against 311). Its §2.1 (blochWignerDesc, weightTwoRegulator) and §2.3 (weightTwoRegulator_borel, borelCalibration_two) state the Borel regulator on Suslin's Bloch classes with the exact scalar, and Polylogarithms never cites this roadmap. So our scope line claiming that Polylogarithms §2.3 consumes κ₂ from us was a cycle. Changes:

- Scope (line 7), the BorelRegulators/Polylogarithms supplier paragraph and the ColemanIntegration contract now say that this evaluation is consumed.
- §4.7's "Suslin–Bloch–Wigner evaluation" is now a supplied statement. κ₂ is defined as the supplied constant converted to the reg_∞ coordinate by BorelRegulators §§6.0a, 6.2 and P₂=i·D_BW.
- §4.7 keeps the de Jeu evaluation and the de Jeu–Suslin comparison c₂=κ₂⁻¹.
- The G1995 route and reference are removed (G1995 is no longer cited). K3BlochGroups §§4.12–4.14 are dropped from §4.7's Needs and from the Layer 4 dependencies.
- The Downstream-consumers paragraph now names Polylogarithms as a supplier.

BorelRegulators (head c564441e) line 13 already assigns the de Jeu–Suslin comparison to §4.7 and the polylogarithmic calibration to Polylogarithms §2.3.

## H05 (roed-math) — applied

The ColemanIntegrationPartII contract (line 100) now cites:

- §§2.1–2.3 for the annular functions and the local double index;
- §§3.1a, 3.2–3.4 for wide-open reciprocity, normalized primitives, the graph correction and the graph-corrected pairing;
- §§4.0c, 4.2–4.4 for single integration, harmonic realization, the valuation term and the Vologodsky point-sum;
- §§5.1–5.5 for the local triple index;
- §§6.0–6.4 for global wide-open triple sums.

The reviewed head 4acd07e6 is still the current head. The *Needs* of §7.7 and the Layer 7 Dependencies now list §§1.1–1.3, 2.1–2.3, 3.0a–3.0c, 3.1a, 3.2–3.4, 4.2–4.4, 5.1–5.5, 6.0–6.4 and 7.3–7.6. §7.11's *Needs* gives the same sections item by item, each with its use.

## Build and gate

- `lake build TauCetiRoadmap.PadicHodgeRegulators.Suggested`: Build completed successfully (8976 jobs). The only warnings are the three `declaration uses 'sorry'` lines, at Suggested.lean:43, 81 and 102.
- Gate summary line: `gate PadicHodgeRegulators: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Direction check (`gate --depcheck … --movable`): `depcheck: 239 roadmaps, 2359 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- Signatures: Suggested.lean is unchanged, so its 7 elaborated signatures are those in `scratch/signatures.md` (0 dropped binders). None of the five points touches a Lean declaration, so no `#check` rerun was needed.
- `roadmaps resolve` on the README lists only `FontaineBPR1994, §2.1`. This is a source key, not a roadmap, so it is a false lead, and it predates this job. The new Tau Ceti names were checked by hand at the pin: UnitFiltration/Basic.lean:104, Logarithm.lean:98 and 163, DeepUnits/Basic.lean:117. Mathlib `NormedSpace.log` is in `Mathlib/Analysis/Normed/Algebra/Logarithm.lean`.

## Citations resolved at open heads

- CohomologyComparisonsPartII #1364 at 212f91bd: §2.2 (fibre coordinates, all integer weights, coordinate isomorphism, tube-filtered variant, κ_r) and §3.4 (ω_Q∘δ_U=pʳδ_D). These are newer than the head the review checked.
- Polylogarithms #1424 at fc000435: §§2.1, 2.3.
- ColemanIntegrationPartII #1360 at 4acd07e6.
- BorelRegulators #1461 at c564441e: §§2.1–2.3, 6.0a, 6.2.
- K3BlochGroups #1430 at c9ca3118.
- NoncommutativeAndEquivariantIwasawa #1307 §F.6, read with `roadmaps show`.

All of these are new-roadmap pull requests earlier in the merge order. None is a revision, and no id this README cites is dropped by an open pull request (overlaps: none). For the worker: K3BlochGroups line 2289 still lists §§4.12–4.14 among what this roadmap consumes. That over-listing by a supplier is harmless but stale.

## Ownership against open work

Each new owned statement was searched for by object:

- Potentially semistable descent of H¹_st and its complex: `roadmaps grep` for H¹_st/D_pst descent finds only NoncommutativeAndEquivariantIwasawa §F.6 (D_pst and D_dR descent) and PadicHodgeTheory's imports of it.
- Chern compatibility of κ_r: CohomologyComparisonsPartII §2.2 assigns it to regulator content.

No declaration of Suggested.lean changed, so no name collision is possible.

## Adversarial pass (changed statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Rigid fibre f_n, point H¹ (n≥1) | Spec ℤₚ, n=2, p=5 | image {((1−1/25)a, a)}; η(1,0)=25/24, η(0,1)=−1; η((24/25)a, a)=a−a=0 | consistent with #1364 Check "C-component c ↦ −c" | Checks rewritten |
| η transport vs HK Def 2.2.1 | HK class (x,y)=(c,0) ↦ (u,v)=(0,−c) | η_HK(c,0)=c; new η(0,−c)=c | same map | η formula stated |
| Weight 0 point | Spec ℤₚ, n=0 | f(a,b)=(0,a−b): H⁰=ℚₚ (diagonal), H¹=ℚₚ | holds | Check kept, map shown |
| Weight −1 point | Spec ℤₚ, n=−1 | f(a,b)=((1−p)a,a−b), det ≠0 for all p | all H^q=0; F⁻¹=0 would give H¹=ℚₚ | new negative Check |
| 1−σ/pⁿ invertible | n=0 vs n≥1 | n=0: kernel ℚₚ; n≥1: −(σ/pⁿ)(1−pⁿσ⁻¹), second factor a unit | η only for n≥1 | hypothesis kept |
| Sign witness for η | weight-one reg with −η | reg(1+p)=−log(1+p)=−(p−p²/2+…) | excluded by §4.1's log_p law | new Check |
| κ_i Chern compatibility | X=Spec R; X=A¹_V (κ not an equivalence) | κ=id at Spec R, so the regulators agree; on A¹ only a map is claimed | no iso claimed on affines | target + API bullet |
| §4.6 range | r=1; r=2, i=1, p=5 | r=1: injectivity at i=1 only; r=2: unscaled boundary is 25·exp_BK | matches CN Cor 3.16 (same hypothesis) | gap removed |
| §4.6 rescaling legs | ω legs (pʳ,id,pʳ) vs (p,id,id) at r=1 | #1364 §3.4 Check: (p,id,id) is not a chain map | rescaling ω_Qδ_U=pδ_D | domain caveat added |
| Descent (a) | V=η ramified quadratic, K=ℚₚ (p odd), L=ℚₚ(√p) | H¹_st(L,V)=1-dim unramified line, τ acts by −1, invariants 0; dim H¹_g(ℚₚ,η)=0 | equal | target added |
| Descent (a) inverse | any finite G, incl. S₃ | [L:K]⁻¹cor∘res=id; res∘[L:K]⁻¹cor=[L:K]⁻¹Σ_g g=id on invariants | holds (ℚₚ coefficients) | stated |
| Descent (b) | same η | invariant complex: D_st,K(η)=0, D_dR/F⁰=0, so H¹=0 | equals H¹_st(K,η)=0; with D_dR in place of D_dR/F⁰ it would give 1 | uses D_K/F⁰ as in NN2016 |
| Descent, trivial case | L=K | G=1 | tautology | — |
| κ₂ conversion | ℚ(√−3), b=2[ω] | reg(s⁻¹b)=2κ₂P₂(σω); reg(dJψb)=2P₂(σω), so s(dJψb)=κ₂⁻¹b=c₂b; Borel: −4κ₂P₂ vs −4P₂ | consistent | Check restated |
| κ₂ degenerate | ℚ, totally real F | B(F)⊗ℚ=0 | no constraint | Check kept |
| Unit-log Tau Ceti hypotheses | i=0; K=ℚ₂, i=1,2; ℚₚ unramified p odd, i=1 | e<(p−1)·0 false; ℚ₂: 1<1 false, 1<2 true; ℚₚ: 1<p−1 iff p>2 | matches §3.5(a)'s "p odd" | citations replaced |
| ColemanIntegrationPartII sections | headings at 4acd07e6 | §2.2 alternating local index; §§3.3–3.4 graph-corrected pairing; §§5.1–5.5 local triple; §§6.0–6.4 global | matches the reviewer | Needs corrected |

## Notes

- The review asks for the label to be switched back to awaiting-review. That is a worker action, not an edit here.
- No passage in the review text asks for anything outside this job.
