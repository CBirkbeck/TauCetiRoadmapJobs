<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/392#issuecomment-6406007338 -->
Review (claude) of 4963bf9

Verdict: needs changes

1. **F01** (P2) §3.5 defines H̃K for Stein curves only, then applies it to proper curves, where the only definition given produces a different group

   **Location.** README line 545: "Let X be a smooth Stein curve over C"; line 548: "Put H̃K(X) = ker(H¹_proét(X, (𝔹⁺_cris)^{φ=p}) → H¹_proét(X, Ô) ≅ Ω¹(X)(−1))"; line 555, (c): "If Y is a proper smooth curve … then H̃K(Y_C) ≅ (B⁺_st⊗_{ℚ_p^nr} D_pst(H¹_ét(Y_C, ℚ_p)))^{φ=p,N=0}"; line 563, (d)'s route: "give H̃K(Sh_n(U))[M]".

   **Claim.** (c) and (d) use H̃K(Y_C) for a proper curve Y, and (c) identifies it with (B⁺_st⊗D_pst)^{φ=p,N=0}.

   **Witness.** The README defines H̃K only under the Stein hypothesis of line 545. Read with the one formula it gives, the kernel into H¹_proét(Y_C, Ô), (c) is false: CDN20 lines 1448–1457 display, for proper Y, the exact top row 0 → H¹_ét(Y_C,ℚ_p)(1) → (B⁺_cris)^{φ=p}⊗H¹_ét → C⊗H¹_ét → 0 with H¹_proét(Y_C, Ô) ≅ C⊗H¹_ét, so that kernel is H¹_ét(Y_C, ℚ_p(1)), a finite-dimensional ℚ_p-space. Instance: Y = E an elliptic curve with good ordinary reduction, D = D_cris(H¹_ét(E_C,ℚ_p)) of φ-slopes 0 and 1: the literal kernel is V_pE, of ℚ_p-dimension 2 and C-dimension 0, while (B⁺_cris⊗D)^{φ=p} contains (B⁺_cris)^{φ=p}⊗(slope-0 line) ⊃ ℚ_p(1) with quotient C, so the two sides differ. CDN20 line 1232–1234 defines H̃K(X) for every smooth X as the kernel of the composite H¹_proét(X,(𝔹⁺_cris)^{φ=p}) → H¹_proét(X,Ô) → Ω¹(X)(−1), Ω¹(X)(−1) being a quotient of H¹_proét(X,Ô); Proposition 3.12 (lines 1440–1466) computes exactly the kernel of (B⁺_cris)^{φ=p}⊗V → Ω¹(Y_K)(−1), and its proof at lines 1461–1465 is what (c) restates. The two definitions agree on Stein curves only because H¹_proét(X,Ô) ≅ Ω¹(X)(−1) there (CDN20 Lemme 3.2, line 1209–1212; README (a)).

   **Repair.** In (b), before the diagram, define H̃K(X) for every smooth rigid curve X over C as the kernel of the composite H¹_proét(X, (𝔹⁺_cris)^{φ=p}) → H¹_proét(X, Ô) → H⁰(X, R¹ν_*Ô_X) = Ω¹(X)(−1), the second map being the edge map of the Leray spectral sequence of ν (surjective, with kernel H¹(X, O_X)); add the sentence "For Stein X the edge map is an isomorphism by (a), so H̃K(X) is the kernel of the map to H¹_proét(X,Ô)". Keep (c) and (d) as they stand, and add to (c) the Check: "For an elliptic curve E over C, the kernel into H¹_proét(E,Ô) is H¹_ét(E,ℚ_p(1)), of C-dimension 0; the kernel into Ω¹(E)(−1) contains the preimage of H¹(E,O) = C and is the Banach–Colmez space of (c), of C-dimension 1". Tested on E ordinary: with the composite, the kernel of (B⁺_cris)^{φ=p}⊗H¹_ét → Ω¹(E)(−1) is (B⁺_cris⊗D)^{φ=p} ∩ (B⁺_dR⊗D_dR) = (B⁺_cris⊗D)^{φ=p} as CDN20 line 1465 computes, C-dimension 1, matching (c); with the kernel into H¹_proét(Ô) it is V_pE.

2. **F02** (P2) §7.1 puts O(k)(Σ_r)^ρ on the wrong side of the duality: it is E_π[k] itself, not its strong dual

   **Location.** README line 1106: "Under §3.1 the strong dual of E_π[k] realises O(k)(Σ_r)^ρ (DLB17, Remarque 11.12, line 2718; …)".

   **Claim.** (E_π[k])′_b ≅ O(k)(Σ_r)^ρ.

   **Witness.** At k = 0 the bullet reads (E_π)′_b = Π(π,0) ≅ O(Σ_r)^ρ, while §3.3(i) (line 495) and the base `DrinfeldComparison.functions_dual` give O(Σ_r)^ρ ≅ (Π^an/π)′_b = E_π; Π(π,0) is of compact type and O(Σ_r)^ρ is Fréchet, both infinite-dimensional, so they are not isomorphic. DLB17 lines 2718–2720: for O(k), Théorème 1.2 holds with Π(π,0) replaced by the representation whose dual is Π(π,0)* with the action twisted by (a−c∂)^{−k}; Théorème 1.2 identifies O(k)(Σ_n)^ρ with the dual of that representation, that is with E_π[k] (line 2719–2720 against line 232–237 for the k = 0 form). The README's own uses agree with E_π[k] = O(k): §7.1 Check 3 (line 1112, E_π[2]⊗det is the action on Π(π,2)′_b, and Ω¹(Σ_r)^ρ ≅ Π(π,2)* at DLB17 line 408), §7.2 line 1118 (the preimage in O(k+2)⊗det^{k+1} is a strong dual; the multiplicity space of O(k) is the strong dual of Π(M,k−1), as COLMEZ19POIDS Conjecture 0.10(i), line 329–330, prints).

   **Repair.** Replace the bullet by: "Under §3.1, E_π[k] is O(k)(Σ_r)^ρ, the functions of §7.2 with the twisted action, and its strong dual is the locally analytic representation Π(π,k) of DLB17 Remarque 11.12 (line 2718), with Π(π,0) that of §2.1 (DLB17, Remarque 11.12, line 2718; COLMEZ19POIDS lines 310–321 give the same twist in a right-action convention)". Tested at k = 0 (E_π[0] = E_π ≅ O(Σ_r)^ρ by §3.3(i)) and k = 2 (E_π[2]⊗det ≅ Ω¹(Σ_r)^ρ ≅ Π(π,2)′_b, DLB17 line 408 and §7.2's first Check).

3. **F03** (P2) §3.5(c)'s Hyodo–Kato clause is stated for every proper curve with a semistable model but is owned only for quaternionic curves

   **Location.** README line 555: "If Y has a proper strictly semistable model, D_pst may be replaced by its Hyodo–Kato cohomology"; line 562, the route: "For quaternionic Shimura curves, HilbertModularVarietiesAndShimuraCurves §R18.4.24a identifies D_pst with Hyodo–Kato cohomology".

   **Claim.** For every proper smooth curve Y over K with a proper strictly semistable model, D_pst(H¹_ét(Y_C,ℚ_p)) is the Hyodo–Kato cohomology of the model.

   **Witness.** This is the étale–semistable comparison (CDN20 line 1445–1446 cites Tsuji for it). The route supplies it for quaternionic Shimura curves only (§R18.4.24a, its line 3760: "proper regular strictly semistable model of a quaternionic curve"); the *Needs:* line 571 names no other owner; CrystallineCohomology (open head 013a921) states the Hyodo–Kato comparison between log-crystalline and de Rham cohomology (§CR.6.2, its line 10385) but no comparison with étale cohomology was found there; (d) uses the clause for Sh_n(U) only.

   **Repair.** Scope the clause: "If Y is a quaternionic Shimura curve with a proper regular strictly semistable model, D_pst is its Hyodo–Kato cohomology (HilbertModularVarietiesAndShimuraCurves §R18.4.24a)". Tested on (d): Sh_n(U) is quaternionic, so (d)'s route is unchanged; the general curve is no longer claimed.

4. **F04** (P3) §7.2 prints (u⁺)^{k+1} = (d/dz)^{k+1} against the Conventions' u⁺f = −f′

   **Location.** README line 1118: "whose first map is (u⁺)^{k+1} = (d/dz)^{k+1}"; Conventions line 47: "u⁺f = −f′".

   **Claim.** The operators agree for every k ≥ 0.

   **Witness.** At k = 0, u⁺ = −d/dz (line 47; §3.1(a) line 459 uses "u⁺ = −d/dz"); the two sides differ by (−1)^{k+1}. The image, hence the exact row, is unaffected.

   **Repair.** Write "(u⁺)^{k+1} = (−d/dz)^{k+1}, with the same image as (d/dz)^{k+1}". Tested at k = 0 (−d/dz, the de Rham sequence of §3.3) and k = 1 ((d/dz)², unchanged).

5. **F05** (P3) §7.3's form g is on the indefinite algebra, not the form of CompletedCohomologyAndLocalGlobalCompatibility §6.4

   **Location.** README line 1137: "Let g be a quaternionic form with π(g)_p ≅ ρ and r̄_g absolutely irreducible at p, obtained from CompletedCohomologyAndLocalGlobalCompatibility §6.4 as in §3.1"; line 1137 later: "By §4.9 there".

   **Claim.** The form of §6.4 has p-component ρ.

   **Witness.** §6.4 (README line 114) produces a form f on the definite algebra B̄ of discriminant ℓ, split at p, with π(f)_p ≅ π⊗ξ∘det, a representation of GL₂(ℚ_p); ρ = JL(π) is a representation of D^×, so "π(g)_p ≅ ρ" names the Jacquet–Langlands transfer of the twisted f to the indefinite algebra of discriminant pℓ, which §3.1(b) (line 466) obtains from GL2AutomorphicRepresentationsAndTransfer R17.3 and which is the form of DLB17 line 2745 and 2753; §4.9 of that roadmap applies to f, the form on the definite algebra.

   **Repair.** Write "Let f be the form of CompletedCohomologyAndLocalGlobalCompatibility §6.4, twisted as in §3.1(a), and g its Jacquet–Langlands transfer to the indefinite algebra of discriminant pℓ (R17.3), so that π(g)_p ≅ ρ; r_g is the representation ρ_f of §R18.3.29 attached to g"; in the §4.9 step write "By §4.9 there applied to f". Tested on §3.1(b), which already names both forms in this order.

6. **F06** (P3) §3.4's third Check excludes one model over ℤ_{p²}, not every semistable model

   **Location.** README line 538: "Over the unramified base ℤ_{p²}, the first cover has the local equation y^{p²−1} = p(z−z^p)^{p−1}, whose special fibre y^{p²−1} = 0 is not reduced (§7.3). So the finite extension K in (a) cannot be dropped."

   **Claim.** No semistable model exists over an unramified base.

   **Witness.** Non-reducedness of one model does not exclude another model over the same base; the Check as reasoned also holds for a curve that does have a semistable model over ℤ_{p²} and a bad equation. What excludes every semistable model over ℤ_{p²} is TEI90 lines 256–259: the minimal regular model has no component of multiplicity one, whereas a semistable model has reduced special fibre and its components keep multiplicity one in the minimal regular model.

   **Repair.** End the Check with "and by TEI90 lines 256–259 the minimal regular model over ℤ_{p²} has no component of multiplicity one, which no curve with semistable reduction over ℤ_{p²} can satisfy; so the extension K cannot be dropped". Tested on the equation y′^{p²−1}+(z−z^p)^{p−1} = 0 over K of §7.3's fourth Check, whose p−1 smooth components have multiplicity one.

Reviewed at head 4963bf9 of the board pull request (the checkout was at that head; the pull request's recorded head is the same). Files: `packages/PadicLocalLanglandsForGL2QpPartII/design/README.md` (1252 lines), `design/plan.json` (53 nodes, 5 gaps, 0 requests, 19 source issues, empty `restructure`) and `sources.toml` (5 certified entries, unchanged). Suppliers were read at the heads the roadmap index of 2026-10-26 lists: PadicLocalLanglandsForGL2Qp 9971d01, HilbertModularVarietiesAndShimuraCurves 893083d, CompletedCohomologyAndLocalGlobalCompatibility 7a5b2ea, GL2AutomorphicRepresentationsAndTransfer 69bcab7, EndoscopicTransferAndUnitaryTraceComparison 40d60b6, LocallyAnalyticDistributions 3a4526a, SmoothRepresentationsOfLocalGroups 1383569, AInfCohomology b47987b, PadicPeriodRings 8839b29, PadicHodgeTheory 4c4f1e8, LocalGaloisDeformationRings 11b2c65, PhiGammaModulesAndIwasawaCohomology 6ec1d64, PadicDifferentialEquationsAndRigidCohomology 5ea2fe1, VectorBundlesAndIsocrystals (open head), CrystallineCohomology 013a921; AdicSpacesPartIII and StableReduction on the content repository's main 7115af0. Line numbers in other roadmaps are those of the `roadmaps show` output.

Six findings: three P2, three P3. Two of the P2 findings sit in passages the round-3 repairs added or rewrote (§3.5 is new; §7.1 is read together with the rewritten §7.2), and one is in the pre-existing §7.1 API, which no earlier round had reviewed with computed values.

## Verified sound

**Round-3 findings, repair by repair** (witnesses at 4963bf9):

| Finding | Status | Witness |
| --- | --- | --- |
| F01 (P1) three unowned inputs in §4.1 | repaired, with a new defect inside the new target (R01, R03) | §3.4 (lines 516–541) constructs the equivariant semistable models at every level: (a) follows CDN20 lines 253–259 and Appendix A.3 (its lines 2187–2226: Γ free on the tree, L/F finite Galois with a stable model, minimal semistable model by functorial blow-ups, fibre product with the refinement of Ω̂ over the minimal model of Γ\Ω, étale hence semistable) and Proposition A.1 (line 2227–2245: the action of Aut extends because the triangulation is Aut-invariant); (b) is CDN20 Proposition 5.7 (line 1874: M̆ ≅ Hom_G(LL(M)*, H¹_HK(M^ϖ_n)[M]) as (φ,N,G_F)-modules, with the ι_HK square) and Théorème 5.10 (lines 1955–1971), by Lemme 5.6 (1856), Remarque 5.5(ii)–(iii) (1823–1835), Proposition 5.2 (1761) and lines 1897–1914, each opened. §3.5 (lines 543–571) owns the Stein pro-étale computation: (a) is CDN20 Lemme 3.2 (1209–1216, Kiehl for Stein); (b) is Théorème 3.3 (1235–1248: rows exact, all maps of closed image, ker ι_can = ker dlog) with the exponential of lines 1265–1272 and (3.4) at 1279; (c) is Proposition 3.12 (1440–1466); (d) is Proposition 5.12 (1996–2014) with 5.14–5.16 (2022–2050). §4.1 (lines 585–609) consumes §§3.4–3.5 and no longer cites CDN20 Théorème 0.4 as supplied; its *Needs:* line 609 lists §§3.3, 3.4, 3.5. §7.3 line 1136 applies §3.4(b) at n = 1. Scope lines 18 and 39 record the move; the LocallyAnalyticDistributions contract (line 96) says that section takes the models as hypotheses. Owners added: R18.5.3 `DrinfeldFormalModel` (HilbertModularVarietiesAndShimuraCurves line 1797–1808: flat regular semistable, components by vertices, nodes xy = π, PGL₂ action), R18.5.14 `WeightedArithmeticQuotientGraph` (line 2045–2047: Γ discrete cocompact, normal proper flat model, nodal special fibre), AInfCohomology §AI.3.1 `AInf.completed_structure_first_image` (its line 2097: smooth X over C, R¹ν_*Ô ≅ Ω¹(−1)) and `AInfSheaf.ainf`, `AInfSheaf.deRhamPeriods` (lines 1960, 2041), §AI.5.1 `AInf.primitive_integral_comparison` (line 2551, proper smooth over C), AdicSpacesPartIII §R3.4 (main line 10053, quasi-Stein) and §R3.7 (11218, proper GAGA), StableReduction Layer 7 (main line 550, "semistable reduction": at-worst-nodal model after a finite separable extension for genus ≥ 2, its line 35), PadicPeriodRings §4.3 (line 413–417, the fundamental exact sequence), PadicHodgeTheory §5.1 (line 982, the monodromy theorem at 992), §5.3 (1021), §8.1 (1383). |
| F02 (P1) V^{(k)} for k ≥ 2 | repaired | §2.4 line 418: det Δ_{k,ℒ} = x^k·det Δ from Δ/Δ_{k,ℒ} ≅ R/t^kR (COLMEZ19POIDS line 211), étale iff p^k·det Δ(p) is a unit, δ_k with δ_k(p)² = (p^k det Δ(p))⁻¹, Δ_{k,ℒ}⊗δ_k = D_rig(V^{(k)}), Π(Δ_{k,ℒ}) = Π(V^{(k)})^an⊗δ_k⁻¹ by Remarque 0.2(i)–(ii) (lines 153–162, opened: Π(Δ⊗δ) = Π(Δ)⊗δ for de Rham nontrianguline Δ of weights 0, k); (ii) line 421 ends in Π(Δ_{k,ℒ}); the k = 2 negative control is line 431; §7.2 line 1118 names the dual of Π(Δ_{k+1,ℒ}) with DLB17 Remarque 11.12 (line 2723 opened: "représentations à poids 0, k+1"); §7.2's second Check (line 1123) carries δ_2. The generalisation of the suggested δ_k(p)² = p^{1−k} to (p^k det Δ(p))⁻¹ is right: for det Δ = \|x\| the two agree. |
| F03 (P3) which representation is r_g | repaired | §7.3 line 1137: r_g = ρ_f of §R18.3.29, the contragredient of ρ_π, det r_g = χ·ψ_g, weights {0,1} under Conventions with the opposite-index note; line 1147 the ρ_π Check (Fil⁰ two-dimensional); the §R18.3.29 contract (line 126) states the conversion; §3.4(b) route (line 531) applies §R18.3.29(c) to ρ_f. HilbertModularVarietiesAndShimuraCurves line 3837 unchanged at 893083d. |

The repaired patterns were searched for in the rest of the design. F01's pattern (an input written as supplied): every citation the repair added resolves (table above); the one residue is the general-curve clause of §3.5(c) (R03). F02's pattern (an object identified with a carrier that does not exist or is the wrong one): §7.1's bullet identifies O(k) with the dual of the space that is O(k) (R02); §7.2 is now consistent. F03's pattern (an unnamed choice among two objects): §7.3's g versus f (R05); §3.4(b) names ρ_f.

**Principles.** No route-specific shortcut (p > 2 in Layer 5 and p > 3 in §§6.5–6.6 are the sources' hypotheses, CDN23 lines 1776–1779 and 93; F = ℚ_p only, stated at line 601); no re-planning (the base §6.9 names are imported at lines 23–27 and 86, the five refinements say in one clause how they differ, lines 31–35); no copied passage (every sampled statement is a paraphrase of the French texts); no algorithm; no Lean file, so no sorry'd data or `set_option`; policy greps by script: `$`, `\(`, `set_option`, `#` followed by digits, machine paths, "so far", "current", "TODO": 0 hits each; "removed" 3 hits, all mathematical; "lemma" once, prose about CDN20 Lemme 2.18. No instruction was found in any text read.

**Dependency check** (verbatim):

    candidate: PadicLocalLanglandsForGL2QpPartII is not in the merge order yet; checked as if placed after CompletedCohomologyAndLocalGlobalCompatibility (the intake inserts it when its design is accepted)
    depcheck: 56 roadmaps, 644 edges, 0 problem(s)

No UPWARD or CYCLE line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. By script: all 53 `statement`s of plan.json occur verbatim in the README; every internal prerequisite names an earlier node (0 forward edges); the 5 gap slugs agree between plan.json and the README and each `neededBy` list matches the `*Needs:*` lines (drinfeld-components now also lists §§3.4, 3.5, 4.1); every numbered section (53) has exactly one `*Needs:*` line, a locator and at least three Checks; the two new nodes `GR.3/semistable-models-hyodo-kato` and `GR.3/stein-proetale-cohomology` carry the README's prerequisites. Every supplier named is on main or earlier in the allowed list; StableReduction is cited on main (its open pull request revises an existing roadmap and is not a dependency).

**Declared gaps.** Unchanged in substance since round 3 (suppliers at the same heads 1383569, 9971d01 and the board's designs): each has a named supplier, a one-sentence `needs`, and is declared in both files; none asks for what a pin or an earlier roadmap provides. The only change is `neededBy` of gap:drinfeld-components, which the new §§3.4 and 3.5 use for the finiteness of π₀ and the Nrd action (CDN20 line 1990 and 2012–2014 use exactly this).

**Seeded source sample** (every locator opened at the line cited):

| Target | Text checked | Result |
| --- | --- | --- |
| 0.4 | DLB17 lines 187–189 (M(π), M_dR(π)), 232–237 (Thm 1.4: M*_dR⊗π*, preimage of ℒ^⊥⊗π*); CDN20 240–249 (WD, LL, JL of M; D_pst(V)[1]); CDN23 2447–2448 (footnote 30: implicit M_dR ≅ dual in DLB) | correct |
| 1.1 | DLB17 lines 1333–1345 (N_rig depends on D_pst without filtration; Déf. 6.7); the Fil⁰ formula recomputed below | correct |
| 1.2 | DLB17 lines 1250–1256 (Lemme 6.3: abs. irr. dim 2 nontrianguline, P(∇) injective; kernel finite-dimensional, φ-stable, eigenvector contradicts nontriangulinity), 1259–1262 (Prop. 6.4, (∇−h)(t^hx) = t^{h+1}∂x) | correct; the finite-dimensionality step cites an external proposition in the source and is proved here, as the README says |
| 1.4 | DLB17 lines 1530–1534 (ε(b) = ζ_{p^n}^{bp^n}; ((a b;0 1)φ)(x) = ε(bx)e^{tbx}φ(ax)) | correct |
| 2.3 | COLMEZ19POIDS lines 153–166 (Rem. 0.2), 177–180 (Thm 0.3(ii)); DLB17 line 410 (Rem. 1.8) | correct |
| 2.4 | COLMEZ19POIDS lines 146–152 (Prop. 0.1, ω = (x\|x\|)⁻¹det Δ), 203–211 (M, ℒ, Δ_{k,ℒ}, R/t^k), 215–236 (Thm 0.6), 237–253 (Rem. 0.7, footnote 4), 262–271 (Thm 0.8) | correct |
| 3.4 | CDN20 lines 253–259, 2181–2228 (A.3, footnote 34 at 2218, Prop. A.1), 2230–2245 (proof), 1761 (Prop. 5.2), 1804–1835 (Prop. 5.4, Rem. 5.5), 1856 (Lemme 5.6), 1874–1883 (Prop. 5.7), 1897–1914, 1955–1971 (Thm 5.10); DLB17 2738–2749, 2763 (footnote 53) | correct; the README's "corresponding refinement of Ω̂⊗O_K" is more careful than the source's Ω⁺_{Dr,L} |
| 3.5 | CDN20 lines 1206–1216 (Prop. 3.1, Lemme 3.2), 1220–1248 (§3.2, the definition of H̃K at 1232–1234, Thm 3.3), 1249–1286 (proof: exp, (3.4), closed images), 1287–1300 (the disc), 1440–1466 (Prop. 3.12), 1996–2014 (Prop. 5.12), 2022–2050 (5.14–5.16) | (c) as written: R01, R03; the rest correct |
| 4.1 | CDN20 lines 320–332 (Thm 0.8), 762–774 (Cor. 2.1: slope 1/2, injective closed vertical maps, N = 0), 779–800 (Kummer, Rem. 2.2), 1978–1993 (Thm 5.11 and its three inputs); CDN23 2501–2514; DLB17 641–651 (Prop. 3.1, the Stein covering τ⁻¹(B_i)) | correct |
| 4.3 | CDN20 lines 1171–1172 (Lemme 2.18); the proof lines 1186–1193 were verified in round 3 (E13) and relied on | correct |
| 4.5 | CDN20 lines 822–854 (Prop. 2.4 and proof: injectivity of H¹(G_F, C⊗̂O[M]⊗V*) → H¹(G_F, C⊗̂Ω¹[M]⊗V*) by finite rank of H¹(G_F, C⊗V*)) | correct |
| 4.7 | CDN20 lines 917–951 (§2.1.5: W′, ℒ^⊥, ℒ⁻¹ = M*_dR/ℒ^⊥, W_{M,ℒ}), 952–954 (Prop. 2.9, F = ℚ_p, from DLB17 Thm 1.4), 962–963 (Prop. 2.10) | correct |
| 4.9 | CDN20 lines 1012–1021 (bounded sets, G-bounded vectors, Prop. 2.12); CDN23 2417–2422 (Prop. 5.6), 2633, 2642 (finite H⁰), 2791–2793 (bounded functions constant, affinoid with G-translates covering, O[M]^b = 0) | correct |
| 4.13 | CDN23 lines 2401–2408 (Lemme 5.4, nuclear Fréchet), 2465–2473 (Thm 5.8, "niveau ≤ n": E15), 2478–2500 (Lemme 5.9), 2501–2516 | correct |
| 5.4 | CDN23 lines 2716–2741 (Prop. 5.21: block decomposition of (X/p^k)^{G_K}, colim over K by compactness of P_B, surjectivity of reduction by finite length and projectivity, p-adic completion) | correct, the four steps are the source's |

Further locators opened: DLB17 102–118 (levels, Σ₀, parity of det), 229–237, 408–412, 759–762 (Lemme 3.5 at k = 0: a⁺ = u⁺∂+1), 2439–2450, 2683–2690 (Prop. 11.10, E9), 2714–2725 (Rem. 11.12), 2732–2782 (§11.3: Teitelbaum's model and K, the three-lines argument); COLMEZ19POIDS 308–340 (O_n(k), Conj. 0.10, Rem. 0.11); CDN23 2339–2349 (ΦN, ΦNᵖ, ΦNᵖ_n, the decomposition), 2411–2416 (Lemme 5.5), 2440–2448; TEI90 1–60 (introduction: no hypothesis on p stated), 175–179 (Thm 5), 230–240 (Cor. 6), 250–259 (the equation over ℤ_{p²} and the minimal regular model), 296–300 (Thm 8). All agree with the README except as recorded above. No locator is flagged unverified by the author; no `needs-references.toml` exists.

**Adversarial pass** (values computed by the reviewer; the repaired and new passages, the sampled targets, the headline theorems and every target a finding touches):

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions, Lie action (line 47) | Lemme 3.5 at k = 0 | a⁺ = u⁺∂+1: a⁺f = −(zf)′+f = −zf′; u⁻ = −∂²u⁺: z²f′ | sound | — |
| §0.4(c) | basis e₁, e₂, ℒ = Le₁ | e₁ ↦ (w ↦ e₁∧w) kills e₁, e₂ ↦ e₁∧e₂: ℒ ↦ Le₂*⊗∧² = ℒ^⊥⊗∧² | sound | — |
| §1.1 Fil⁰ formula | weights {0,1}; {0,2} | Fil⁻¹ = M_dR, Fil⁰ = ℒ, Fil¹ = 0: Σ t^{−i}Fil^i = tN⁺ + ℒ[[t]]; weights {0,2}: t²N⁺ + ℒ[[t]] ⊃ t²N⁺, not tN⁺ | sound | — |
| §1.2 | rank-one R; V trianguline; weights {0,1} | ∇(1) = 0, so P = X kills 1; R(δ) ⊂ D_rig with ∇e = κ(δ)e, P = X−κ(δ) kills e; (∇−1)(tx) = t∇x = t²∂x | sound | — |
| §1.4 | one shell; shells j ≥ 0; u(b) at b = 0 | one coordinate; closure ℤ_p, compact in ℚ_p not ℚ_p^×; ε(bx) = 1 for small b, derivative of e^{tbx} is tx | sound | — |
| §2.3 | k = 1, ζ = 1 | det Δ_{1,ℒ} = x\|x\| forces det Δ = \|x\|, ω = x⁻¹; Π(M,−1) has x⁻²; ⊗det gives 1 | sound | — |
| §2.4 determinant | tR ⊂ R; k = 1, 2, 3 for M(π), ζ = 1 | det(tR) = x·det R; det Δ_{k,ℒ}(p) = p^k·p⁻¹ = 1, p, p²: étale at k = 1 only | sound | — |
| §2.4 twist | k = 2 | δ_2(p)² = p⁻¹, det(Δ_{2,ℒ}⊗δ_2)(p) = p·p⁻¹ = 1; nontrianguline rank two is isoclinic, slope 0 iff the determinant value is a unit | sound | — |
| §2.4 central character and Casimir | aI₂; k = 0, 1, 2 | (iii) a^kω(a); (ii) x^{−k}ω·x^{2k} = x^kω; (k²−1)/2 = −1/2, 0, 3/2, with §1.5 at (0,1) giving 0 | consistent | — |
| §2.4 Π(Δ⊗δ) | Rem. 0.2(ii) line 162 | Π(Δ_k) = Π(Δ_k⊗δ_k)⊗δ_k⁻¹ = Π(V^{(k)})^an⊗δ_k⁻¹ | sound | — |
| §3.3 (headline) | p = 7, ζ = ω | squares of characters of μ₆ have order dividing 3, ω\|μ₆ has order 2; ω(7) = 1 so M ∈ ΦNᵖ | sound (round 3 row relied on) | — |
| §3.4(a), n = 0 | M̂ = Ω̂⊔Ω̂ | level-0 JL(M) factors through Ǧ/O_D^× ≅ ℤ, one-dimensional after splitting: no supercuspidal M, (b) empty | sound | — |
| §3.4(a), K | ℤ_{p²} model | special fibre y^{p²−1} = 0 non-reduced; TEI90 line 258–259: no multiplicity-one component in the minimal regular model | sound, the Check's reasoning short | R06 |
| §3.4(a), genus for StableReduction Layer 7 | cocompact free Γ ⊂ PGL₂(ℚ_p) | quotient graph (p+1)-regular on V vertices: rank = 1+(p−1)V/2 ≥ 2 (p = 2: V even, rank ≥ 2); an étale cover of a genus-g curve has genus ≥ g | the g ≥ 2 hypothesis of its line 35 holds | — |
| §3.4(a), the fibre product | Γ free on the tree | M^p_n = (Γ\M^p_n) ×_{Γ\Ω} Ω since Γ acts freely on Ω; Ω̂′ → (Γ\Ω)° étale, so the product is étale over (Γ\M^p_n)°: semistable | sound (CDN20 2222–2226) | — |
| §3.4(b) uniqueness and slope | WD(M) irreducible; Ω vs M | End_{(φ,N,G)}(M) = L; dlog(z−a) on Ω has φ = p (slope 1), M has slope 1/2 | sound | — |
| §3.4(b), level 2 | ρ trivial on 1+pO_D, not on 1+ϖ_DO_D | 1+ϖ_DO_D acts trivially on the first cover, so Hom_Ǧ(ρ, −) = 0 there; (a) at n = 2 gives the model | sound | — |
| §3.5(a) | open disc; elliptic curve E | Stein: H¹(O) = H²(O) = 0, H¹_proét(Ô) = Ω¹(−1); E: 0 → H¹(E,O) = C → H¹_proét(E,Ô) → Ω¹(E)(−1) = C → 0, dimension 2 | sound | — |
| §3.5(b) | open disc D; open annulus | H¹_dR(D) = 0, exp an isomorphism (CDN20 1287–1300 log inverse on smaller discs), H̃K(D) = 0; dlog(Kummer class of z) = dz/z spans H¹_dR of the annulus, ι_can ≠ 0 | sound | — |
| §3.5(b) constants | π₀ finite | H⁰((𝔹⁺_cris)^{φ=p}) = (B⁺_cris)^{φ=p}⊗ℤ[π₀] (CDN20 (3.4)) → C^{π₀}, kernel ℚ_p(1)^{π₀}; kernel of exp = constants | sound | — |
| §3.5(b) snake | rows exact, left map identity | ker(dlog) → ker(ι_can) → coker(id) = 0: ker ι_can = ker dlog (CDN20 1247) | sound | — |
| §3.5(c) definition | E ordinary, D of slopes 0, 1 | kernel into H¹_proét(Ô): V_pE, ℚ_p-dim 2, C-dim 0; (B⁺_cris⊗D)^{φ=p} ⊇ (B⁺_cris)^{φ=p} ⊃ ℚ_p(1) with quotient C: C-dim 1 | false as literally defined | R01 |
| §3.5(c) general clause | a proper curve that is not quaternionic | no supplier named for D_pst = H¹_HK; (d) uses Sh_n(U) only | overclaim | R03 |
| §3.5(d) | N = 0 | (B⁺_st⊗M̆)^{N=0,φ=p} = (B⁺_cris⊗M)^{φ=p} = X⁺_st(M); H⁰[M] = 0 since Ǧ acts on π₀ through Nrd and dim JL(M) ≥ 2 | sound | — |
| §4.1 | slope 1/2 vs 0; dim JL(M) ≥ 2 | (B⁺_cris⊗M)^{φ=1} = 0 iff slope > 0 (CDN20 817); constants have zero M-part | sound; the φ-compatibility now comes from §3.4(b) | — |
| §4.3 | d = 2, S = Le₁, Ae₁ = e₂; S = 0; S = E | Be₂ = −λ₁λ₂e₁+(λ₁+λ₂)e₂: trace λ₁+λ₂, det λ₁λ₂; all-positive column gives det −λ₁λ₂; S = 0 any diagonal B; S = E has T = E stable | sound | — |
| §4.5 | V = 0; V = L, F = ℚ_p | 0; H_C(L) = L, H_M(L) = 0 (no character embeds, §4.6), so H¹_proét[M]^{G_ℚ_p} = exp(O[M]), consistent with X⁺_st(M)^{G_ℚ_p} = H_M(L) = 0 | sound | — |
| §4.7 | e ↦ ae; ℒ ≠ ℒ′ | a⁻¹e* restores the normalised quotient; W′_ℒ ∩ W′_{ℒ′} = preimage of (ℒ∩ℒ′)⊗LL′ = 0, i.e. dO[M] | sound | — |
| §4.9 | constant function; p^k-torsion | constant: bounded, trivial sector, M-part 0; L⊗(ℤ/p^k) = 0 so lim_k(L⊗−) kills the integral tower | sound | — |
| §4.13 | Π = Π_{M,ℒ}; the unramified twist | V_{M,ℒ}⊗JL(M), dimension 2·dim JL(M); kernel X⁺_st(M) ∩ (ℒ⊗C) = θ⁻¹(C⊗ℒ) = V_{M,ℒ} by §0.3; twist with χ(p) = 1+p: M ∉ ΦNᵖ, answer 0 | sound | — |
| §4.14 (headline) | dim 3; δ with δ(p)² = 1; χ(p) = 1+p | 0; Steinberg branch; 0 on M^p_n (CDN23 Thm 5.1 is on M_n) | sound; its route through §4.13 and §4.1 now rests on §§3.4–3.5 | — |
| §5.4 | infinitely many blocks | finite block support mod p^k, support may grow with k: completed sum is neither ⊕ nor ∏ | sound | — |
| §6.6 (headline) | Steinberg block; one closed point | (St^cont)′⊗1⊗1; Π(ρ_x)′⊗ρ_x⊗JL(M) | sound (round 3 rows relied on for §§6.3–6.5) | — |
| §7.1 cocycle | g, g′ | (a−cz)(a′−c′(dz−b)/(a−cz)) = (aa′+bc′)−(ca′+dc′)z, the left column of gg′ | sound | — |
| §7.1 API bullet | k = 0; k = 2 | (E_π)′ = Π(π,0), compact type, against O(Σ_r)^ρ ≅ E_π, Fréchet; E_π[2]⊗det ≅ Ω¹ ≅ Π(π,2)′ (DLB17 408) | reversed dual | R02 |
| §7.2 | k = 0; k = 1 | k = 0: 0 → O(0) → O(2)⊗det = Ω¹ → H¹_dR → 0 with u⁺ = −d/dz; k = 1: cokernel π′⊗M*_dR⊗Sym¹ = 4 copies, Δ_{2,ℒ} of determinant value p, δ_2(p)² = p⁻¹ | sound except the sign | R04 |
| §7.3 r_g | ρ_π vs ρ_f | ρ_π: jumps 0, 1, Fil⁰ two-dimensional; ρ_f: jumps −1, 0, Fil⁰ a line; det r_g\|G_ℚ_p = χ since ψ_g is trivial at p | sound | — |
| §7.3 g | the form of §6.4 | π(f)_p ≅ π⊗ξ∘det on GL₂(ℚ_p); ρ is a representation of D^×: g is the transfer | naming | R05 |
| §7.3 K and the model | K = ℚ_{p²}((−p)^{1/(p²−1)}); p = 2 | μ_{p²−1} ⊂ ℚ_{p²}, so K/ℚ_p is Galois and K·ℚ̆_p is finite over ℚ̆_p; y′^{p²−1}+(z−z^p)^{p−1} = ∏_{ζ^{p−1}=−1}(y′^{p+1}−ζ(z−z^p)), p−1 smooth factors (∂_z(z−z^p) ≡ 1); p = 2: one factor y′³ = −(z−z²) | sound | — |
| §7.4, 7.5, 7.6 (headlines) | V = 0; Σ₀ with f = (1,−1); ρ = 1 | both sides 0; primitives (z^j/j!, −z^j/j!) not of the form (h,h); H⁰_dR ≠ 0 excludes the trivial sector | sound (round 3 rows relied on) | — |
| gaps (5) | suppliers at their heads | unchanged since round 3 except `neededBy` | precise, minimal | — |

**Library declarations.** The Mathlib block (lines 59–68) and the §§4.3, 4.8, 4.10, 6.3 uses are unchanged since round 2, which opened `Bornology.IsVonNBounded`, `NormedSpace.image_isVonNBounded_iff`, `WithSeminorms.isVonNBounded_iff_seminorm_bounded`, `WithSeminorms.image_isVonNBounded_iff_seminorm_bounded` and `WithSeminorms.banach_steinhaus` at 6b7abb3c with their files and lines; those rows were relied on, not reopened. Tau Ceti a91d3aa has no carrier for the roadmap's objects (unchanged pin).

**Cross-roadmap citations resolved this round.** All citations of the unchanged text were resolved in round 3 at the same supplier heads (the index of 2026-10-26 lists PadicLocalLanglandsForGL2Qp, HilbertModularVarietiesAndShimuraCurves, CompletedCohomologyAndLocalGlobalCompatibility, GL2AutomorphicRepresentationsAndTransfer, EndoscopicTransferAndUnitaryTraceComparison, LocallyAnalyticDistributions and SmoothRepresentationsOfLocalGroups at the heads round 3 read) and were relied on. Newly cited or re-opened this round: HilbertModularVarietiesAndShimuraCurves §§R18.5.3 (1797), R18.5.14 (2045), R18.4.24a (3760), R18.3.29 (3837), R18.5.21 (2380), R18.5.16 (2261), R18.4.25 (3816); AInfCohomology §§AI.3.1 (1899; `AInfSheaf.ainf`, `AInfSheaf.deRhamPeriods`, `AInf.completed_structure_first_image` at 2097) and AI.5.1 (2505; `AInf.primitive_integral_comparison` at 2551); AdicSpacesPartIII §§R3.4 (10053), R3.7 (11218) on main; StableReduction Layer 7 (550) on main; PadicPeriodRings §4.3 (413); PadicHodgeTheory §§3.3 (677), 4.4 (888), 5.1–5.4 (982, 1004, 1021, 1049), 8.1 (1383); LocalGaloisDeformationRings §3.8 (2504: R_{B,M}, R⁺_{B,M}, the kernel I_{B,M}, R_{B,M} = 0 when the type locus is empty); PhiGammaModulesAndIwasawaCohomology §§2.4 (931, `oneSubPhiOnPsiOne`), 5.4 (1865), 5.6a (1950, `deRhamDiffEq`), 5.7 (1997); PadicDifferentialEquationsAndRigidCohomology §§RD.1.73 (4288), RD.2.43 (5605). Supplier drift found: none; the AInfCohomology contract (README line 131) correctly names 𝔸_inf,X and 𝔹⁺_dR as the supplied sheaves and leaves (𝔹⁺_cris)^{φ=p} to §3.5(b).

**Ownership against open work.** `roadmaps grep` over main and the 367 open heads (index of 2026-10-26T00:43Z): the pro-étale cohomology of Stein curves and H̃K (no match); Teitelbaum's model and semistable models of Drinfeld covers (no owner; the hits are Schneider–Teitelbaum and Mazur–Tate–Teitelbaum); the sheaf (𝔹⁺_cris)^{φ=p} (hits are unrelated: Tate modules in FiniteFlatGroupsAndIntegralPadicHodgeTheory, prismatic constants, Banach–Colmez dimensions). VectorBundlesAndIsocrystals (an allowed supplier) states at its "Dimension of the semistable period space" that X⁺_st(M) is a Banach–Colmez space of L-Dimension ([L:ℚ_p],2) citing CDN20 §2.1.2 and says it does not deduce the one-dimensional multiplicity of Lemme 2.7: §§0.3 and 4.4 here own that statement, no duplication. The board packages index (12 packages) was read; VectorBundlesAndIsocrystalsPartII's design README at e81e8ff (almost C-representations, quasi-Banach–Colmez spaces) does not touch the Drinfeld tower, V_{M,ℒ} or X⁺_st(M); the other eleven are unrelated by title and were not opened. The brief named the sibling checkouts without paths; the grep tool covered their heads.

**Shape.** 53 targets in 8 layers; every definition has an API list and three or more Checks; every layer ends with Examples and Dependencies; Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Downstream consumers, Source corrections, References present; no LaTeX, no `set_option`, no process word, no pull-request number, no machine path. The manifest is unchanged, five certified entries, no local path.

**Headline theorems.** The Galois-socle theorem (§4.14), the factorisation (§6.6), the general-central-character realisation (§3.3), the irreducibility of Π(π,0) (§2.3), the weight change (§2.4), the Iwasawa invariants (§7.4), the infinite-primitives containment (§7.5) and the filtered derived realisation (§7.6). None is statable at the pins (no Drinfeld tower, Banach or locally analytic representation, Robba ring or (φ,Γ)-module carrier in Mathlib 6b7abb3c or Tau Ceti a91d3aa); README line 69 and plan.json `leanStatus` say so. Padding: not applicable at the design stage (no Lean file).

**Lean.** Not available (this lane does not elaborate); the design has no Lean file, so no `#check` binder comparison was possible.

## Not verifiable

- CDN20 published (JAMS) and COLMEZ19POIDS published (JEMS) numbering against the authors' copies: the paywalled versions were not read; the README cites the copies it read, as the manifest records.
- DLB17 printed pages are not cited by the README; arXiv v2 was read.
- CDN20 §§3.2.2–3.2.3 (closed images of dlog and ι_can, the kernel statement) were located through Théorème 3.3's proof (line 1285–1286) but not re-derived; the primitive comparison for the sheaf (𝔹⁺_cris)^{φ=p} on a proper curve is taken from CDN20 line 1458 ("cf. [60]") and AInfCohomology §AI.5.1, not re-derived.
- TEI90's hypotheses on p: the introduction (lines 27–60) states none; the body beyond Theorem 5, Corollary 6, lines 251–259 and Theorem 8 was not read.
- Whether any roadmap among the 367 open heads states the étale–semistable comparison for a general proper semistable curve (R03) was searched by keyword in CrystallineCohomology only; the general clause is not needed by any route here.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4963bf9", "job": "REV-DESIGN-PadicLocalLanglandsForGL2QpPartII~4", "model": "fable", "worker": "fable-rev174"} -->

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4963bf9", "job": "REV-DESIGN-PadicLocalLanglandsForGL2QpPartII~4", "model": "fable", "worker": "fable-rev174"} -->
