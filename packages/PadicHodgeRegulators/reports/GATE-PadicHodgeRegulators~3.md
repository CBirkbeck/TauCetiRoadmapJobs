# GATE-PadicHodgeRegulators~3: answers to the review of head a742adc

There is one review: CBirkbeck, AI-assisted, posted 2026-10-25T20:41Z. It has three numbered findings, H01–H03. Line numbers refer to `TauCetiRoadmap/PadicHodgeRegulators/README.md` at the repair commit 09a5b3a9. "Old" marks a line at head a742adc.

## H01 (CBirkbeck) — applied differently

The finding is correct. Sections 9.31–9.35 quantify over arbitrary de Rham (φ,Γ)-modules D over the Robba ring, and §9.34 applies exp and exp* to them. The only exponentials imported were representation-level ones:
- PhiGammaModulesAndIwasawaCohomology §5.7 (head 6ec1d64) re-exports NoncommutativeAndEquivariantIwasawa §F.6 "for … finite-dimensional continuous E-representation V".
- NoncommutativeAndEquivariantIwasawa §F.6 (head 3ec4ff3) builds the finite complex "for a de Rham L-representation V".
- PhiGammaModulesAndIwasawaCohomology §5.6a constructs N_dR(V) only for representations V.

PadicHodgeTheory §§4.5 and 5.2 (head 4c4f1e8) supply B-pairs, `herrBPairDerived` and Berger's modification, but no exponential. The reviewer's module R_E·d with φ(d)=5^(−1/2)d is de Rham and is not D_rig(V); its Herr cohomology is computed in the new Check at line 2556 (h⁰=h²=0, h¹=1).

The general maps are owned by no roadmap on main or in any open pull request (see "Ownership" below). I stated them here as a new target rather than requesting a supplier gap or narrowing §§9.31–9.35 to étale D. Narrowing would fall below RJ2018's generality, which §9.35's negative-slope Check uses. The new target is §9.30a (lines 2514–2560) and contains:
- the differential realization, D_dR(D) and its filtration (RJ2018 §§IB1–IB2);
- N_rig(D), uniquely characterized (Nakamura2014 Theorem 3.5, p.34; RJ2018 Proposition I.3, p.900). Its existence comes from PadicHodgeTheory §5.2's modification with the trivial filtration, and it agrees with PhiGamma §5.6a's N_dR(V) by uniqueness;
- exp_(F_n,D) for every D, as the connecting map of D→D[1/t]⊕D⁺_dif→D_dif (Nakamura2014 Theorem 2.8, Definition 2.10, Lemma 2.12(1));
- exp* for de Rham D, through D_dif (Nakamura2014 §2.4), with the adjunction (Proposition 2.16);
- the étale comparison with §§1.2 and 1.4 (Nakamura2014 Theorem 2.21, together with `herrBPairDerived`);
- the specialization convention;
- the differential interpolation theorem (Nakamura2014 Theorem 3.10; RJ2018 Théorème I.10).

Three convention defects were found while restating these and are fixed in §9.30a:
- **Coordinate order.** Nakamura's Herr complex puts the γ-coordinate first (Nakamura2014 line 459). RJ2018 §IB9 follows that order (RJ2018 line 1026), although its own §IB7 is φ-first (RJ2018 line 937). PhiGamma's convention is φ-first. In PhiGamma's convention the exponential cocycle is ((φ−1)x̃,(γ_n−1)x̃). The Check at line 2555 gives the witness: in the scalar model, d¹(1,2)=0 but d¹(2,1)=3.
- **Specialization.** RJ's ∫η·μ is base change along [γ]↦η(γ)⁻¹ (RJ2018 line 973), so it is PhiGamma §5.3's "specialization at η⁻¹".
- **RJ2018 Théorème I.10(ii) Gamma factor.** RJ2018 prints p^(m(−j−1))/Γ*(−j−h+1). I read the typeset formula on the page; the extracted text does not show the fraction. The correct factor is 1/Γ*(j−h+1)=1/(j−h)!. This is what Nakamura2014 Theorem 3.10(2) gives (p.37, "|Γ_(L,tor)|/((−h−k)! p^(m(L)))" with k=−j), what Berger2003 Theorem II.10 gives (Berger2003 lines 811–816), what RJ2018's own Théorème I.15 uses (Γ*(j−h+1), RJ2018 line 1285), and what a direct constant-term computation gives. Case (i) is printed correctly in RJ2018.

The supplier contracts were updated at lines 13 and 57. The Needs lines of §§9.31–9.35 and Layer 9's Dependencies (line 2695) now cite §9.30a in place of PhiGamma §5.6a for N_rig(D). Section 9.34 (line 2633) says explicitly that its exp and exp* are those of §9.30a for D(ηχ^(−j)). The References add **Nakamura2014** (line 2739). The Suggested.lean docstring now says the de Rham interpolation headlines lack Robba-ring (φ,Γ)-modules "étale or not, with their Herr cohomology and Bloch–Kato maps"; the old wording was "étale (φ,Γ)-module".

## H02 (CBirkbeck) — applied

The finding is correct, and the repair is the reviewer's first option.
- **§7.3 (line 1456).** reg_syn, regSynCan and regP are now defined on all of K_2(𝒳)⊗ℚ by `ch^syn_{2,2}` (AM18 line 31 uses this domain). The restriction to the weight-two summand of SchemeKTheoryOperations §6.9 is the motivic regulator. The bullet at line 1458 now reads "K_2(𝒳)_ℚ →ₗ[ℚ]"; the old text had `K_2(𝒳)^{(2)}_ℚ`.
- **§7.3, weight-three bullet.** The ambiguous old bullet "weight-three part maps to 0" now says that ch^syn_{3,2} lands in H⁴_syn(𝒳,3)=0. A new bullet records that ch^syn_{0,2}=0 and that ch^syn_{1,2} lands in H⁰_syn(𝒳,1)=0, so reg_syn(u·w)=rank(w)·reg_syn(u).
- **§7.5 (line 1495).** The domain is extended the same way.
- **§7.6(b) (line 1510).** The statement is now for u′∈K_2(𝒳′)⊗ℚ, with the transfer of SchemeKTheoryOperations §2.3. It cites Adams–Riemann–Roch ψ^k(π_*x)=π_*(θ^k(−T_π^∨)ψ^k x) (SchemeKTheoryOperations §7.5). Pullback and finite étale transfer preserve weight two (SchemeKTheoryOperations §6.11).

Three new Checks (lines 1521–1523) work out the reviewer's squaring map on ℙ¹_ℤ₅:
- π_*π^*a=2a+ah, with ψ^k-eigenvalues k² and k³.
- Adams–Riemann–Roch with θ²(−T_π^∨)=1+h′ gives ψ²(π_*π^*a)=8a+8ah. Omitting the correction would give 8a+4ah.
- regP(ah)=rank(h)·regP(a)=0, so both sides of (b) equal deg(π)·regP(a).

SchemeKTheoryOperations (merge position 37) is now a named supplier at line 63, citing §§2.3–2.4, 5.5, 6.4, 6.8–6.9, 6.11 and 7.5. The bare phrase "K-theory transfer" in §7.6's Needs line was replaced by these sections. Elsewhere, the transfers of §§5.6–5.9, 6.3 and 7.6(c) are along finite étale maps, which preserve weights (SchemeKTheoryOperations §6.11), so no other occurrence needed the change.

## H03 (CBirkbeck) — applied differently

This roadmap already owned the Suslin–de Jeu comparison, both complex evaluations and κ₂ (§4.7). It is also the earliest of the roadmaps involved in the merge order: PadicHodgeRegulators is at 209 and Polylogarithms at 223, while K3BlochGroups and BorelRegulators come earlier but do not consume the evaluation. So the overlap the reviewer describes is real. At the current heads:
- Polylogarithms §2.3 (cc121bb, line 190) still plans `weightTwoRegulator_borel` and `borelCalibration_two` with the full scalar.
- BorelRegulators line 13 (0faed68) and K3BlochGroups lines 17 and 2286 (5b6774f) still name Polylogarithms Layer 2 as owner of that scalar.

Those reciprocal edits belong to those roadmaps and are outside this job. On this side, the Scope sentence (line 7) and the Downstream consumers sentence (line 2699) now state the split exactly as the reviewer proposes. Polylogarithms §2.3 is supplied with §4.7's evaluation, κ₂ (−2κ₂ in the Borel coordinate) and the computation of κ₂. The conversion to its Borel and Tate coordinates, and its §2.2 analytic cocycle, remain Polylogarithms' own. The direction of supply is unchanged: depcheck reports no upward edge.

## Build

`lake build TauCetiRoadmap.PadicHodgeRegulators.Suggested` gives `Build completed successfully (8976 jobs).` The only messages are three `declaration uses sorry` warnings, at `Suggested.lean` lines 43, 81 and 102: the three headline theorems, shifted by one line by the docstring edit.

Signature check: I put `#check @…` for all seven declarations in one scratch file importing the built module and elaborated it once with `lake env lean`. The declarations are `finitePolylog`, `residueDilogValue`, `residueDilogValue_spans`, `evaluationConstraints`, `constraint_basis_and_determinant`, `coordinateImageGenerator` and `evaluationConstraints_coordinate_image`. Every elaborated type is identical to the job's signature file and to its README statement, and no binder was lost. Only the module docstring changed.

## Gate

`gate PadicHodgeRegulators: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck (`--movable`): `depcheck: 55 roadmaps, 634 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. The one new edge is SchemeKTheoryOperations (position 37); PadicHodgeTheory (136) and PhiGammaModulesAndIwasawaCohomology were already suppliers.

`roadmaps resolve` reports "Lean names found nowhere: None". Its one cross-roadmap lead, "631: FontaineBPR1994, §2.1", is a false positive: FontaineBPR1994 is a source key in a locator, not a roadmap. The job's other lead, `KTheoryQ.dvr_localization_iso`, exists in ColemanIntegration §L3.Fa.1 (README line 2413 at head ae078af).

## Ownership, citations and sources

- **Ownership.** I searched main and all open heads by object: Nakamura, Bloch–Kato exponentials of B-pairs or (φ,Γ)-modules, exp_D/exp*_D/H¹_e(D), and differential-module adapters. Nothing outside this roadmap states the general-module exponential, dual exponential or differential interpolation. PhiGamma §§5.6a–5.7 and NoncommutativeAndEquivariantIwasawa §F.6 are representation-level. PadicHodgeTheory §4.5 supplies B-pair cohomology and `herrBPairDerived` but no boundary map. This roadmap is their first and only consumer, so it owns them (§9.30a), built only from the named supplier sections. Transfers, Adams weights and Adams–Riemann–Roch have an owner, SchemeKTheoryOperations, and are imported from it. No declaration of `Suggested.lean` has another roadmap's fully qualified name. Ownership was checked against the sibling checkouts this brief lists and the `roadmaps` index of 367 open pull requests.
- **Citations checked at the heads this round:**
  - PhiGammaModulesAndIwasawaCohomology at 6ec1d64: Conventions with the complex `d⁰x=((φ−1)x,(γ−1)x)`; §3.2 (F¹(a,b)=(−ψa,b)); §3.4a; §5.3 ("specialization at η is M(η⁻¹)"); §§5.6a and 5.7.
  - PadicHodgeTheory at 4c4f1e8: §4.2, §4.5 (`herrBPairDerived`) and §5.2.
  - NoncommutativeAndEquivariantIwasawa at 3ec4ff3: §F.6.
  - SchemeKTheoryOperations at 88dbd5a: §§2.3, 2.4, 5.5, 6.4, 6.8, 6.9, 6.11 and 7.5.
  - Polylogarithms at cc121bb, BorelRegulators at 0faed68 and K3BlochGroups at 5b6774f, for H03.
- **Sources.** Nakamura2014 (K. Nakamura, *Iwasawa theory of de Rham (φ,Γ)-modules over the Robba ring*, arXiv:1201.6475v2; J. Inst. Math. Jussieu 13(1) (2014) 65–118) was fetched through the sources service from arXiv. Its licence class is open repository. It is cited in §9.30a for §2.2, Theorem 2.8, Definition 2.10, Remark 2.11, Lemma 2.12(1), §2.4, Proposition 2.16, Theorem 2.21, Theorem 3.5, Lemma 3.6 and Theorem 3.10, with arXiv v2 page numbers. This job may not edit `sources.toml`, so the worker still has to record three entries:
  - Nakamura2014: locator scheme theorem, locator "Theorem 3.10", cited_for §9.30a.
  - G1995: from the previous round.
  - dJ1995: from the previous round.

  Every other text cited was already cached: RJ2018, Berger2003 and AM18. No `needs-references.toml` was written; every text needed was read.
- **Untrusted text.** The review contains no instruction addressed to this job and nothing suspicious. Its claims were verified against the sources and supplier heads above; none was taken on trust.

## Adversarial pass on added or changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| D_dR(D), Fil, de Rham (§9.30a) | R_E; R_E(1); R_E·d with φ(d)=5^(−1/2)d; D=0 | E with Fil⁰=E; E·t⁻¹e₁ with Fil⁰=0 and Fil⁻¹=all; E·d=Fil⁰; 0 | dimension equals rank in all four, and the jumps match the weight convention (ℚₚ(1) has weight +1) | stated |
| N_rig(D) characterization | R_E; R_E(1); the non-étale line; wrong model "impose Fil⁰" | R_E; t⁻¹D with ∇(t⁻¹e₁)=0; D; the wrong model gives D for R_E(1), where ∂e₁=t⁻¹e₁∉D | the unfiltered lattice is forced, and the bounds t^(−a)D⊆N⊆t^(−b)D hold with [a,b]=[1,1] | stated, Check added |
| exp cocycle in φ-first order | scalar φ=2, γ_n=3, x̃=1; D=R_E | d¹(1,2)=2·1−1·2=0 and d¹(2,1)=2·2−1·1=3; exp=0 since Fil⁰=D_dR | the γ-first transcription is not a cocycle | order fixed, Check added |
| exp* on R_E, n=0 | (0,log χ(γ_0)) and (c,0) | 1 and 0; §1.4 gives dualExp(log χ)=1, and the unramified line is H¹_g | swapping coordinates exchanges the two values | Check added |
| Adjunction sign | Nakamura2014 Proposition 2.16 against §1.4; normalization through Nakamura2014 Lemma 2.14 | ⟨exp x,y⟩=Tr[x,exp* y] in both; ⟨κ(b),log χ⟩=log b, as in §2.4's P(κ(6),log χ)=log₅6 | same positive adjunction | stated |
| Specialization convention | η of order 4 at p=5 | RJ: γ(x⊗1)=η(γ)γx⊗1, landing in D(η); PhiGamma at η: γ(e)=η(γ)⁻¹e, landing in D(η⁻¹) | R_E(η)≇R_E(η⁻¹) since η²≠1 | adapter stated, Check added |
| Interpolation (i) factor | étale crystalline D, j=0, h=1,2,3 | Γ*(1−h)⁻¹=1,−1,2; Berger2003 Theorem II.3 gives (−1)^(h−1)(h−1)!=1,−1,2 | agrees; the multiplied wrong model Γ*(−2)=1/2 is off by 4 | stated, Check added |
| Interpolation (ii) factor | (j,h)=(1,1) and (2,1); direct constant term | constant term of φ^(−n)(∇_h z⊗e_(−j)) = [j]_h·d_j with d_j=p^(−nj)[φ^(−n)∂^j z]_0/j!, giving 1/(j−h)! = 1 and 1; printed RJ 1/Γ*(1−j−h) = −1 and 2 | RJ2018 prints the wrong factor; Nakamura2014 Theorem 3.10(2), Berger2003 Theorem II.10 and RJ2018 Théorème I.15 agree with 1/(j−h)! | corrected, Check added |
| p-power normalization of (i) and (ii) | ψz_j=p^(−j)z_j, ψ∂^j z=p^j∂^j z, Tr_(F_m/F_n)∘φ^(−m)=p^(m−n)φ^(−n)∘ψ^(m−n) | p^(m(j−1))·p^((m−n)(1−j))=p^(n(j−1)); p^(−m(j+1))·p^((m−n)(1+j))=p^(−n(j+1)), which are Berger's level-n powers | consistent with m≫0 | stated |
| Non-étale example cohomology | R_E·d, φ(d)=5^(−1/2)d, γ(d)=d | h⁰=0 (5^(−1/2)≠1); h²=0 (c·t⁻¹∉R_E); χ=−1, so h¹=1 | exp=0 and exp* goes from this line to E·d; §§1.2 and 1.4 do not apply | Check added |
| reg_syn on all K₂⊗ℚ (§7.3) | ℙ¹_ℤ₅ squaring map; a∈K₂(ℤ₅)^(2)⊗ℚ | π_*π^*a=2a+ah; ψ^k eigenvalues k² and k³; ah≠0 iff a≠0 (projective bundle); dlog{x,y}=dx/x∧dy/y≠0 | the old domain excludes π_*π^*a | domain extended, Checks added |
| Adams–Riemann–Roch witness | same map, k=2 | T_π^∨=[𝒪(−2)]−[𝒪(−4)], θ²(−T_π^∨)=(2+4h′)/(2+2h′)=1+h′; π_*h′=h; ψ²(π_*π^*a)=8a+8ah, equal to direct ψ²(2a+ah); without the correction 8a+4ah | the correction is necessary | Check added |
| reg_syn(u·w)=rank(w)reg_syn(u) | u=a, w=h; u=a, w=[π_*𝒪] | ch_{2,2}(ah)=ch_{2,2}(a)·0=0, using ch_{0,2}=0 and H⁰_syn(𝒳,1)=0 (Fil¹H⁰_dR=0); regP(π_*π^*a)=2regP(a)=deg(π)regP(a) | consistent with (b) and with the projection formula | bullet added |
| H⁴_syn(𝒳,3)=0 | smooth proper curve over 𝒪_K | H³_rig(𝒳_k)=0, H⁴_dR(X_K)=0, H⁴_rig=0 | target zero | bullet reworded |
| §7.6(b) on all K₂⊗ℚ | multiplication by n on an elliptic curve; squaring on ℙ¹; unramified quadratic base change | π_*π^*=n²: both sides n²·regP(u); both sides 0 on ℙ¹; the finite étale norm keeps weight two (SchemeKTheoryOperations §6.11) | holds; (c) unchanged | restated |
| §7.5 extended domain | u of weight ≠2 | §4.2's compatibility ρ_syn∘c^syn_{i,j}=c^et_{i,j} holds on all K_j; H⁰(K,H²(X_K̄,ℚₚ(2)))=H⁰(K,ℚₚ(1))=0, so the edge map is defined | holds | restated |
| κ₂ contract (Scope and Downstream) | heads cc121bb, 0faed68, 5b6774f; merge positions 209 and 223 | the earlier roadmap owns; the consumer keeps only the coordinate conversion and its §2.2 cocycle | no upward edge (depcheck) | sentences made explicit |
