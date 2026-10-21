<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/118#issuecomment-6312547829 -->
Review (claude) of 15139fb

Verdict: needs_changes

1. **F01** (P2) Nonsingularity away from p has no unramifiedness owner

   **Location.** `packages/SelmerIwasawaCohomologyPartII/design/README.md` line 698 (also line 702 and `design/plan.json` line 1370). Quote: "loc_w(c₁) nonsingular for w outside Σ⁺min∪Σ⁺ℓ∪{p}" and "nonsingular localizations outside Σ⁺min∪Σ⁺ℓ∪{p₁,p₂}".

   **Claim.** `onePlaceAnnihilator` and `twoPlaceAnnihilator` deliver classes nonsingular at every finite place away from Σ⁺min, ℓ and the detecting places, including the other places of F⁺ above the rational primes p, p₁, p₂.

   **Witness.** ltxzz lines 6700–6701 obtain (8.5) only because "both Sh′n and Sh′n+1 have smooth models over O_Fw for which (an analogue of) Lemma 4.2.4 holds" (Lemma 4.2.4 is ltxzz line 1744). In rank one, ltxzz lines 6901–6902 (footnote 34) add that for F⁺≠ℚ proper smooth reduction above Σ⁺_p₁∖{p₁} is needed, by Remark 5.2.8 (ltxzz line 2754), since Σ⁺_I ⊇ Σ⁺_p₁ and (8.14) says nothing at those places. The design's §7.3 *Needs* line cites 3.6, 3.7, 4.6, 5.6, 6.4, 7.2 and Selmer/Euler/Duality sections only; gap `native-shimura` (README line 166) supplies models and specialization maps only for the special-level model at p; no sentence in the README states that H²ⁿ⁻¹ét((Sh′_n₀×Sh′_n₁)_Fbar,Oλ)/(n₀,n₁) is unramified at hyperspecial places.

   **Exact repair.** In §7.3 state the input explicitly for both constructions: for every finite w ∉ Σ⁺min∪Σ⁺ℓ∪{p} (resp. {p₁,p₂}), including the places above the rational primes p, p₁, p₂ other than p, p₁, p₂, the module H²ⁿ⁻¹ét((Sh′_n₀×Sh′_n₁)_Fbar,Oλ)/(n₀,n₁) is unramified at w. Own it: cite PELModuli §§M2.8, M4.3 (smooth hyperspecial models at odd unramified primes) with EtaleCohomologyFoundations §F.4.0 for the proper case F⁺≠ℚ, and extend the `needs` sentence of gap `native-shimura` (README line 166 and the plan's gap entry) to the hyperspecial-level nonproper specialization isomorphism of ltxzz Lemma 4.2.4 at every such w, together with the models of Remark 5.2.8 above Σ⁺_p∖{p}. Add a Check to §7.3: with F⁺≠ℚ a place w above p₁ other than p₁ lies inside Σ⁺_I of the second edge, so (8.14) gives no nonsingularity there and the smooth-model input is what supplies it. Update §8.1 and §8.2 *Needs* accordingly.

2. **F02** (P2) Rigidity at the added raising place p₁ is not derived

   **Location.** `packages/SelmerIwasawaCohomologyPartII/design/README.md` line 748 (§8.2 proof chain) and line 698 (§7.3 hypotheses "the hypotheses of 5.6 or 6.4"); `design/plan.json` line 1484. Quote: "By 7.3 the dual c₂ has singular exponent ≥m−mper−c−mlat at p₂."

   **Claim.** §8.2 applies the first reciprocity law at p₂ with Σ⁺lr,I={p₁}, whose hypothesis A7.2.2 is rigidity of ρ̄Π₀,λ,+ for (Σ⁺min,{p₁}); §8.2 assumes only admissibility, whose L6 is rigidity for (Σ⁺min,∅).

   **Witness.** ltxzz lines 6896–6897: the second claim is proved "using (8.12) and the fact that ρ̄Π₀,λ,+ is rigid for (Σ⁺min, Σ⁺lr,I)"; ltxzz lines 5660–5661 derive rigidity for (Σ⁺min, Σ⁺lr∪{p}) from (P4). Every occurrence of "rigid for" in the README (lines 232, 387–421, 556–599) is a hypothesis; none is an inference from PII4.

   **Exact repair.** Add to §7.3 (or §8.2) a named lemma `rigid_of_levelRaisingSpecial`: if r̄ is rigid for (Σ⁺min,Σ) and p ∉ Σ⁺min∪Σ∪Σ⁺ℓ is a special inert place at which Pα(Π_p) modulo λ is level-raising special, then r̄ is rigid for (Σ⁺min,Σ∪{p}) (clauses (2) and (4) of ltxzz Definition 6.3.4, lines 5623–5632; lines 5660–5661). *Needs:* contract gap `rigidity`; SmoothRepresentationsOfLocalGroups §SR.4.4 (unitary-genericity); AutomorphicGaloisRepresentationsPartII AG2.5 (local-global compatibility at p). Invoke it in §8.2's chain before the p₂ edge and list it in §7.3's hypotheses; add a Check: a special inert place at which the residual pair {p^(−N),p^(−N+2)} occurs twice fails PII4 and fails clause (2). Synchronize the plan's statement, hypotheses and proof sketch.

3. **F03** (P2) Selmer membership omits good reduction at ℓ

   **Location.** `packages/SelmerIwasawaCohomologyPartII/design/README.md` line 496; `design/plan.json` line 847. Quote: "For the diagonal datum, H(n),H(n+1), and λ with Σ⁺min∩Σ⁺ℓ=∅, AJλ(Δ) belongs to H¹_f(F,Wλ)."

   **Claim.** Membership above ℓ is proved by "the crystalline regulator comparison for the actual smooth integral model", with L2 as the only hypothesis on ℓ.

   **Witness.** A smooth PEL model at w|ℓ needs ℓ unramified in F: PELModuli §M2.8 supplies representability and smoothness "at odd unramified p", and gap `purity-crystalline-regulator` (README line 190) presupposes "good smooth integral reduction above ℓ". The source uses (L1) through admissibility: ltxzz lines 6795–6796 invoke Lemma 8.1.6 and (L2) inside Theorem 8.3.2, where (L1) "ℓ>4n and ℓ is unramified in F" (line 6370) is in force. H(n), H(n+1) play no role in membership.

   **Exact repair.** Add "ℓ odd and unramified in F (L1)" (or "admissible λ") to the hypotheses of §4.4, and move H(n),H(n+1) out of the membership clause (they remain in §4.5). Add a Check: with ℓ ramified in F there is no smooth hyperspecial model at w|ℓ and the crystalline input of the gap is unavailable. Synchronize the plan entry.

4. **F04** (P3) Rational middle-degree concentration in §4.3 has no cited owner

   **Location.** `packages/SelmerIwasawaCohomologyPartII/design/README.md` line 480; `design/plan.json` line 790. Quote: "Cuspidality gives rational geometric cohomology vanishing outside degree 2n−1, independently of H(n),H(n+1)."

   **Claim.** The vanishing defines AJλ(Δ) at every diagonal-datum level, including the nonproper case F⁺=ℚ.

   **Witness.** §4.3's *Needs* (line 486) cite 4.2, the two gaps, EtaleCohomologyFoundations §§F.2.6, F.4.5, F.4.6, MotivesAndAlgebraicCycles §§7.16–7.18 and SchemeAndStackFoundations §2.15; none states concentration. The supplier contract (line 102) lists AutomorphicGaloisRepresentationsPartII AG2.1b (archimedean packet multiplicity, middle-degree concentration) and gap `boundary-cohomology` is stated under residual absolute irreducibility. ltxzz line 6767 asserts the vanishing from cuspidality.

   **Exact repair.** Cite AG2.1b (middle-degree concentration; the archimedean packet multiplicity) in §4.3's *Needs*, and for F⁺=ℚ cite contract gap `boundary-cohomology` (or IgusaVarietiesAndTorsionConcentration §IG.7.7 with its hypotheses); if the boundary exclusion is owned only under residual absolute irreducibility, add A7.1.1 to §4.3's hypotheses for F⁺=ℚ.

5. **F05** (P3) Loss-constant notation disagrees with the supplier

   **Location.** `packages/SelmerIwasawaCohomologyPartII/design/README.md` line 681 (§7.2 statement). Quote: "when the supplier proves c=f(r)rR use f(1)=1 and f(2)=4".

   **Claim.** The supplier's loss constant is f(r)·r_R.

   **Witness.** EulerSystemsAndKolyvaginSystems §4.4 states "Put c = 𝔣(r)d_R" with d_R the reducibility depth of its §1.3 (which names both r_R and d_R); ltxzz line 890 writes f(r)r_R. The README uses r_R nowhere else.

   **Exact repair.** Write "c = 𝔣(r)·d_R, with d_R the reducibility depth of EulerSystemsAndKolyvaginSystems §1.3 (ltxzz r_R)" in §7.2 and the plan.

Three P2 findings and two P3 notes. None re-raises a settled finding. All seven round-2 findings are repaired (table below), the seeded sample verifies against the cached texts, the dependency gate reports no problem, and no duplication of Mathlib, Tau Ceti, a roadmap on main or an open roadmap pull request was found. The remaining defects are three places where the proof chain of the rank theorems consumes a fact that no layer, cited supplier section or declared gap states.

## Verified sound

### Round-2 findings, checked one by one

Quotations are from `packages/SelmerIwasawaCohomologyPartII/design/README.md` at the reviewed head.

| Finding | Status | Repaired passage and independent check |
| --- | --- | --- |
| F01 (P1) positive-loss basis | repaired | Line 681: "The supplied scaled inverse C satisfies DC=CD=π^c I … For c=0 these form a basis; positive loss gives only the stated submodule conclusion". Line 698: "No basis or unit coefficient in the scaled-inverse columns is used." Supplier EulerSystemsAndKolyvaginSystems §4.4 is imported (line 86) and its scaled inverse and rank-two primitive vector t=(−u₂,u₁) match the supplier text. The linear algebra was recomputed: for D=[[π,1],[0,π]] over A₅, C=[[π,−1],[0,π]], DC=π²I; v=e₂ gives D₁v=1, t=(−1,π) gives D₁t=0, D₂t=π² of exponent 3; det(e₁,t)=π. The rank-one total loss 2c in §§7.3, 8.2–8.4 matches ltxzz line 6921 with 4rR replaced by c. |
| F02 (P1) Cartesian refinement | repaired | Line 453: "Compatible neat refinement gives a commutative square … Cartesian base change requires additionally that (a,sh′↑):Sh′_n→Sh_n×_(Sh_n+1)Sh′_n+1 is an isomorphism". Line 459 `diagonal_refine_source_only` is the requested negative control. §4.2 pushforward uses the source degree (line 466), §4.6 pulls back to the full inverse-image cycle Z (line 516). ltxzz lines 1149–1154 impose only the two inclusions. |
| F03 (P1) blowup converse | repaired | Line 342: "For f:T→P whose scheme-theoretic inverse image of P°° is an effective Cartier divisor … there is a unique lift T→Q over P. This is the supplied blowup lifting property, not a characterization of arbitrary maps into Q". stacks-blowup lines 3750–3765 (Tag 0806) state exactly this; StableReduction Layer 4 on main owns the Rees blowup and universal property; the four affine-chart declarations exist at the Tau Ceti pin. Line 352 `product_exceptional_point` is the negative control. |
| F04 (P2) torus-invariant carrier | repaired | Line 29: "Every cohomology, nearby-cohomology, localized group and spectral-sequence term attached to those models means the supplied H_𝔗 or H_𝔗,c carrier"; H_𝔗 now appears in §§2.4–2.6, 3.1–3.6, 5.3–5.5, 6.2–6.3. `torus_two_point_control` (line 43) and `link_torus_trace_control` (line 310) compute the 𝔽₂ two-point example. PELModuli §M4.9 supplies exactly `torusInvariantCohomology`, `torusTrace`, `torusTrace_indep` with the free-component-action and separated-finite-type hypotheses quoted. |
| F05 (P2) finiteness of exceptional sets | repaired | Line 19: "Every exceptional or raising set Σ⁺min, Σ⁺lr, Σ⁺, Σ⁺lr,I, Σ⁺I, Σ⁺lr,II and Σ⁺II is a finite set of finite places of F⁺". §§2.1, 5.1, 6.1 and 1.6 repeat "finite"; the plan's hypotheses lists carry the same sentence. ltxzz lines 5139–5142, 5839–5841, 6195–6197 verified. `level_infinite_exclusion` (line 276) is the negative control. |
| F06 (P2) two model owners | repaired | Line 11: "ShimuraVarieties owns construction and strict semistability of the native special-level model, its link charts and generic-fibre/specialization comparison through gap native-shimura." Line 290: "take the native strictly semistable M … from gap native-shimura" and line 296: "No construction or semistability proof for M is part of this target." Theorem 5.2.5 (ltxzz line 2653) is cited only in the gap; §2.3 retains Theorems 5.3.4, 5.4.4, 5.5.3 and Corollary 5.3.5 (lines 2823, 2901, 2985). |
| F07 (P2) oldform supplier domain | repaired; disposition settled | Line 106: "The supplied §§13.7 and 13.9 theorems require Σmin⊇S_FL, Σlr∩S_FL=∅ and sufficiently small levels at S_FL as in §6.14"; line 180 gap `old-form-dimension` requests the residual all-place transfer and oldform comparison; line 389 uses §13.9 "on its Σmin⊇S_FL … domain, and by gap old-form-dimension elsewhere"; `oldform_supplier_domain` (line 394). The supplier text (EndoscopicTransferAndUnitaryTraceComparison §§13.7, 13.9) carries exactly the S_FL conditions quoted. The repair report labels this "not actionable in this package" because the supplier extension itself must be done elsewhere; the design-side repair requested in round 2 (bind the domain, declare the residual gap) is in place, so the disposition is settled and not re-raised. |

### Principles

The roadmap is a Part II of SelmerIwasawaCohomology and imports the base's §§0.12–0.13, 2.6–2.7, 4.9–4.11, 4.24–4.25 by section; no base target is re-planned. No route-specific restriction was introduced: F⁺=ℚ, ramified Eλ, positive detection loss, both parities and nonproper models stay in scope, with the uniform realised Frobenius span condition carried as an explicit premise rather than silently assumed. No copied passage, computational algorithm, `set_option`, `lemma`, sorry'd data or process narrative was found (the only hit of a style scan is the mathematical word "packet"). No source text contained instructions. The gate places the roadmap after IgusaVarietiesAndTorsionConcentration and reports no UPWARD or CYCLE line.

### Seeded sample

Every locator below was read in the cached text; page numbers were checked against the `=== page N ===` markers (the preprint's "⩾" is rendered as ">" by the extraction, so "r > 1" at ltxzz line 4021 and "N > 4 and N = 2" at line 4177 mean r ≥ 1 and N ≥ 4, which is consistent with the design's N=2 variant of the even incidence matrix).

| Target | Text checked | Result |
| --- | --- | --- |
| 2.2 unitaryBasicCorrespondence | ltxzz lines 1788–1800, 1871–1890 (Definition 4.3.1, Theorem 4.3.5, pp. 38–41) | Tangent Hom(ωA∨,τ∞,ker α*/ωA∨), normal Hom(ωA∨,τ∞,im α*), fibre DL(V_s,{,},⌈(N+1)/2⌉), dimension ⌊(N−1)/2⌋, codimension ⌊N/2⌋ all match; Checks `basic_N2`, `basic_N3` recomputed. |
| 2.3 unitarySemistableStrata | ltxzz lines 2653–2662, 2823–2830, 2901–2910, 2985–2995 (Theorems 5.2.5, 5.3.4, 5.4.4; Corollary 5.3.5) | Model and semistability now imported; balloon ℙ(V_s), ground normal O(−(p+1)) and ground fibre DL• match. `strata_normal_sign` recomputed: quartic in ℙ², degrees ±16. |
| 2.4 unitaryLinkAndIntersection | ltxzz lines 3349–3359, 3518–3545, 3722–3743 (Lemma 5.6.2, Theorems 5.7.7–5.7.8) | Freeness, restriction isomorphism off degrees N−2, 2N−2 when p+1 is a unit, trivial even-rank Frobenius, count ∏(p^(2i−1)+1), fibre ℙ of dimension ⌊N/2⌋−j and excess bundle σ*H⊗O(1) match. |
| 2.5 unitaryIncidenceWeightComplex | ltxzz lines 4023–4063, 4066–4081, 4110–4182, 4213–4224 (Constructions 5.9.1, 5.9.4; Lemmas 5.9.2–5.9.3) | Columns, d₁ signs, odd matrix [[1,0,0],[0,−(p+1)²,T°•],[0,T•°,T•]], even matrix and its N=2 corner variant, three-step filtration, monodromy by the identity, singular sequence with invariants, ∇₁/∇₀ combinations all match. |
| 3.1 localizedUnitaryCohomology | ltxzz lines 5204–5258 (Assumptions 6.1.4/6.1.6, Remark 6.1.5, Lemmas 6.1.9–6.1.11) | Intertwiner isomorphisms under (P5), concentration from cohomological genericity via the universal coefficient theorem, ordinary/compact identification under residual irreducibility match; the last is correctly a gap. |
| 3.3 evenIntegralFreeness | ltxzz lines 5634–5644 (Theorem 6.3.5(1)–(2)) | Hypotheses (a)–(d) and conclusions match. |
| 3.6 evenCongruenceGaloisRealization | ltxzz lines 5655–5657 (Theorem 6.3.5(5)) | μ, c-conjugate and lattice unique up to homothety match. |
| 4.3 projectedDiagonalAbelJacobi | ltxzz lines 6152–6157, 6767–6772 | Rational concentration and the Hochschild–Serre coboundary match; integral version under A7.1.1/A7.2.3 matches; owner missing in *Needs* (R04). |
| 4.4 rankinSelbergPurityAndSelmer | ltxzz lines 6484–6488, 6794–6800 (Lemma 8.1.6; proof of Theorem 8.3.2) | Weight −1 purity matches; membership proof uses (L2) under admissibility (R03). |
| 4.5 diagonalMultiplicityRealization | ltxzz lines 1259–1277, 745–751, 6805–6809 | H(N), Lemma 2.4.5 conjugation and the non-canonical coordinate choice match. |
| 4.6 diagonalRegulatorNaturality | ltxzz lines 2488–2521 (Construction 4.6.1) | loc′_p, graph class and the correspondence graph match; the Cartesian restriction is correctly stated. |
| 7.1 admissibleImageLift | ltxzz lines 918–936 (Lemma 2.7.1) | (a)–(e) with P=T²−1, prime-to-ℓ powering and simultaneous choice match. |
| 7.3 rankinSelbergLevelRaisingSystem | ltxzz lines 6633–6639, 6875–6893, 6896–6926, 196–206 | (8.4)–(8.5), (8.13)–(8.14) and the pairing computation match with 4rR replaced by c; two unowned inputs in the chain (R01, R02). |
| 8.1 rankinSelbergSelmerRankZeroOfPeriod | ltxzz lines 6548–6582, 6594–6663 (Lemma 8.2.1, Theorem 8.2.2) | Period witness, mper, mlat, Σ⁺I=Σ⁺min, threshold m>mper+mlat+mΣ+rR+mdif match with c for rR. |
| 8.5 hilbertPrecursorCompatibility | liu-tian lines 1384–1413, 1477–1500 (Assumption 4.1, Definition 4.5, Theorem 4.7, pp. 30–32) | Odd degree, LIInd, residual dimension equality, (L1)–(L3), the twist (g+1)/2 and surjectivity match. |

Also read: ltxzz lines 648–700 (Lemmas 2.3.3–2.3.5, matching L5-1), 846–898 (Lemma 2.6.4, Definition 2.6.5, Propositions 2.6.6–2.6.7), 1147–1156 (Definition 3.1.11(3)), 1637–1657 (H_𝔗 and the trace), 1737–1750 ((4.2), Lemma 4.2.4), 2286, 4432, 4461 (special-map squares), 4708–4761 (Notation 5.11.1, Lemmas 5.11.2–5.11.3), 4899–4925 (Theorem 5.11.5), 5076–5126 (∇ and the potential map (5.28)), 5134–5202 (§6.1 datum and (P1)–(P6)), 5295–5312 (Lemma 6.2.2, Theorem 6.2.3), 5741–5748 (Lemma 6.4.2), 5833–5927 (§7.2 datum, (PI1)–(PI7), A7.2.2–A7.2.4), 5931–5954 (Lemma 7.2.5), 6020–6050 (Proposition 7.2.7, Theorem 7.2.8), 6192–6261 (§7.3 datum, Lemma 7.3.3), 6303–6313 (Theorem 7.3.4), 6366–6462 (Definition 8.1.1, Remark 8.1.2, Lemmas 8.1.3–8.1.5), 6489–6544 (Lemma 8.1.7), 9612–9648 (Definition D.2.1, Lemma D.2.2, Proposition D.2.3); ltxzz-published lines 1533–1556 (intersection reflexive closure, special and very special inert) and 7345–7386 (published Definition 8.1.1); ltxzz-deformation lines 1444–1456 (Theorem 3.6.3 with D0–D4), 1761–1767 (Corollary 4.1.2), 1880–1896 (Theorem 4.2.6); stacks-blowup lines 3750–3765. The five manifest entries are certified at legal origins; the manifest was not changed and no `needs-references.toml` entry was needed.

### Adversarial pass

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions (twist, weight, Frobenius, hγ, coboundary) | n=2; inert p=3; γ=(I,−1)c; sign action of C₂ | Tensor rank 6, twist 2, weight (n₀−1)+(n₁−1)−2n=−1; Frobenius 9 on Eλ(1) at a degree-one inert place; γ² has GL component −I; coboundary −2 | None |
| Torus carrier and trace | Free C₂-orbit of two points, L=𝔽₂ | H⁰_𝔗≃L, orbit trace 1, total trace 0; nothing divides by 2 | None |
| 1.5 specialInertPlace | ℚ(i) at 3, 5, 2; local degree two | 3 very special inert with residue size 9; split, even/ramified and degree-two cases fail; "splits completely in F⁺rflx" equals one degree-one place since F⁺rflx/F⁺ is Galois | None |
| 1.6 rankinSelbergAdmissible | ℓ=3; ξ=±1; scalar 1; homothety | L1 fails at ℓ=3; L5-1 branch (a) needs a nontrivial scalar (ltxzz line 679); ξ²−1≠0 excludes ±1 | None |
| 2.1 unitaryLevelRaisingDatum | m=0; Σ⁺lr=∅; infinite Σ⁺; N=2 | m≥1 required; (P5) follows from (P2),(P4) at N=2 (ltxzz line 5194), consistent with keeping it as a clause | None |
| 2.2–2.3 strata | N=2 node; N=3, p=3 quartic; p inverted | Two reduced branches; ±16; smooth generic fibre | None |
| 2.4 link cohomology | N=2 (degrees 0 and 2 excluded); ℓ∣p+1 | Restriction fails exactly in the excluded degrees; isomorphism not exported when p+1 is not a unit | None |
| 2.5 weight complex | N=2; p=3; Frobenius 4 on ℤ₃ | Corner-only N=2 matrix matches ltxzz lines 4172–4174; invariants 0, coinvariants ℤ/3 | None |
| 2.6 product resolution | Empty centre; exceptional point | Identity off the centre; exceptional point has image ideal 0, so lifting is not characterized | None |
| 3.1–3.7 even/odd comparisons | A6.1.4 alone; unipotent Frobenius; zero localization | Surjectivity of ∇₁ needs no assumption; eigenvalue/coinvariant claims need A6.1.6 and H(N); unipotent block defeats invariants→coinvariants | None |
| 4.1–4.2 datum and graph | Source-only refinement of degree d; zero cycle | Commutative but not Cartesian; pushforward dΔ | None |
| 4.3 AJ | ℙ¹ point; F⁺=ℚ | No edge without concentration; concentration owner missing | R04 |
| 4.4 membership | ℓ ramified in F; w∤ℓ bad place | No smooth model at w∣ℓ; away from ℓ purity and both H⁰ vanishings suffice | R03 |
| 4.5–4.6 | μ>1; non-Cartesian square | Nonzero tuple has a nonzero coordinate; pullback uses all of Z | None |
| 5.1 firstReciprocityDatum | 𝔽₁₁ with roots {2,6},{1,4,3} | Tensor eigenvalue 2 repeats (2·1=6·4 mod 11), PI7 fails while PI4/PI5 hold | None |
| 5.2–5.6 first law | p=3 singleton graph; nonunit scalar | Value 4·φΠ₀(I°)φΠ₁(T°); exponent equality needs the three units of PI2, PI4, PI5 (ltxzz lines 6189–6190) | None |
| 6.1–6.4 second law | O/π²→O/π; both parities | Exponent can drop strictly; inequality direction matches ltxzz line 6308 | None |
| 7.1 image lift | m=1; ξ with ξ²=1 | Base case from L5-2; (a) fails for ξ=±1 | None |
| 7.2 detection | D=[[π,1],[0,π]] over A₅; c≥k; v=e₁ | No diagonalizing basis; C=0 when c≥k; (v,t) need not be a basis; t primitive with D₁t=0, exp D₂t=3 | None |
| 7.3 annihilators | w above p other than p, F⁺≠ℚ; Σ⁺lr,I={p₁} rigidity | Nonsingularity and rigidity inputs unowned | R01, R02 |
| 7.4 families | F⁺=ℚ; CM curve | Excluded by hypothesis; no universal claim | None |
| 8.1–8.2 rank theorems | c=0; c>0; m small | Thresholds m>m₀+c+mper+mlat+mdif and m>m₀+mper+2c+mlat+mdif match ltxzz lines 6659 and 6922 with c for rR; AJ=0 gives nothing | R01–R03 through §§7.3, 4.4 |
| 8.3–8.4 domains | n=2, F⁺=ℚ; n=3, F⁺=ℚ; n≥3, F⁺≠ℚ | H(2),H(3) unconditional; H(4) at F⁺=ℚ not discharged; matches ltxzz line 1273 | None |
| 8.5 Hilbert precursor | g even; LIInd absent | Outside the stated domain; supplier gap only | None |

### Duplication and supplier audit

Pinned Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were read from local checkouts containing those commits. Verified present with the stated roles: `Polynomial.reflect`, `coeff_reflect` (`Mathlib/Algebra/Polynomial/Reverse.lean` lines 88, 95), `Polynomial.eval`, `eval_X`, `derivative`, `derivative_X`, `Module.torsion_by_prime_power_decomposition` (`Mathlib/Algebra/Module/PID.lean` line 168), `Module.free_iff_isTorsionFree` (`Mathlib/LinearAlgebra/FreeModule/PID.lean` line 397), `TopRep.homogeneousCochains`, `continuousCohomology`, `ContinuousCohomology.cochainsMap`, `map`, `map_id`, `map_comp`, `reesAlgebra`, `mem_reesAlgebra_iff`; `TauCeti.AlgebraicGeometry.affineBlowupι`, `opensRange_affineBlowupι`, `iSup_opensRange_affineBlowupι`, `affineBlowupι_toSpecZero`; `TauCeti.ContCohomology.d0`, `H1`, `H1pi`, `subsingleton_H1_of_subsingleton`, `subsingleton_H1_of_subsingleton_coefficients`, `nsmul_H1_eq_zero`. No pinned object is restated.

Supplier sections were read at the open-pull-request snapshots recorded in the project's pull-request index (EulerSystemsAndKolyvaginSystems `4fb7ae99`, SelmerIwasawaCohomology `17f6056`, SmoothRepresentationsOfLocalGroups/IntegralHeckeAndGaloisDeterminants/ReductiveGroupsPartII `0d37c3f`, ArithmeticGaloisDuality `5b7027c`, AutomorphicGaloisRepresentationsPartII `c4cc6a1`, EndoscopicTransferAndUnitaryTraceComparison `f8f8c2b`, IgusaVarietiesAndTorsionConcentration `55adf55`, PELModuli `2d82d07`, ShimuraVarieties `ce10821`, LefschetzPencilsAndVanishingCycles `1b8f741`, MotivesAndAlgebraicCycles `c3dad31`, GlobalGaloisDeformations `29e415c`, ArithmeticGaloisRepresentations `81f6496`, LocalGaloisDeformationRings `e189846`, ShimuraCompactifications `b5675ac`, HilbertModularVarietiesAndShimuraCurves `5db7b73`, AdelicAlgebraicGroups `7b84aae`) and on main for EtaleCohomologyFoundations, SchemeAndStackFoundations (§2.15 `hochschildSerre_galois_covering` at line 3846, Layer 5), StableReduction (Layer 4), ProfiniteCohomology and Chebotarev. Every cited section heading exists: EulerSystems §§1.2, 1.3, 1.6, 1.11, 1.15, 4.4; Selmer §§0.12, 0.13, 2.6, 2.7, 4.9–4.11, 4.24, 4.25 with `IsWeaklySemisimple`, `invariantCoinvariantMap`, `weaklySemisimple_of_surjective`, `weaklySemisimple_integral_lift`, `localAnnihilation_uniform`; Smooth §§SR.4.1, SR.4.4 with the three named predicates; Duality §§R02.4.2, R02.4.3, D7.4, D7.7; AG2.1b, AG2.2, AG2.5, AG2.6, AG2.7 with all twelve named subsections; Endoscopic §§6.14, 9.1, 11.2–11.4, 12.12–12.15, 13.1, 13.5–13.9 with `CompactUnitaryRaw.multiplicity`, `TransferableLevel` and `UnitaryClassificationInputs`; Igusa §§IG.7.2, IG.7.5, IG.7.7 with `IsCohomologicallyGeneric`; PEL §§M0.25, M0.26, M2.8, M2.12–M2.14, M4.3, M4.5–M4.9 with the seven named declarations; Shimura §§5.1, 6.7; Lefschetz §§7a.7–7a.9 (rational weight spectral sequence, so the integral gap is genuine); Motives §§7.16–7.18; GlobalGaloisDeformations §§3.3–3.8, 5.2 with `IsCyclotomicAbsIrred`; Adelic §4.1. ProfiniteCohomology and Chebotarev use numbered chapters rather than "Layer" headings; the citations "Layers 1–3, 5–8, 10" and "Layers 1–2, 10" resolve to their build sections. No upward or cyclic citation: every supplier is earlier in `merge-order/ORDER.txt` or on main; the lone consumer PeriodsAndSpecialValues supplies nothing.

All 20 gaps have a named supplier, a section or explicit new obligation, a one-sentence `needs`, the same slug in README and plan, and `neededBy` lists equal to the targets that cite them (checked mechanically). Siblings on the board: ArithmeticLevelRaisingAndBipartiteEulerSystems is the intake target that this roadmap realizes (its target file names SelmerIwasawaCohomologyPartII), and GanGrossPrasadConjecturesForClassicalGroups owns period nonvanishing only, as the Scope paragraph records. The open pull requests QWittVectors (`4605fbb`), ErdosProgressionPowers (`72b6157`) and ArithmeticDynamics (`85e78c0`) were read at the recorded heads; none mentions level raising, diagonal cycles, Abel–Jacobi classes or unitary Shimura varieties.

### Dependency command

The brief's command names `packages/SelmerIwasawaCohomologyPartII/README.md`, which does not exist at the design stage; it fails with a file-not-found error. Run with the candidate `packages/SelmerIwasawaCohomologyPartII/design/README.md`, exit 0, complete output:

```text
candidate: SelmerIwasawaCohomologyPartII is not in the merge order yet; checked as if placed after IgusaVarietiesAndTorsionConcentration (the intake inserts it when its design is accepted)
depcheck: 4 roadmaps, 42 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Nothing in the tooling or the merge-order file was edited.

### Shape and completeness

README: title, Summary, Scope and ownership, Conventions (with 8 Checks), Exact supplier contracts (per supplier, by section and declaration, plus the gap obligations), How to read the build, eight layers each ending in Examples and Dependencies, Downstream consumers, References. Plan: 8 layers, 40 targets, 45 API entries, 59 target Checks, 20 gaps; every target has a locator; every definition or construction has at least three Checks; every API and Check name appears in the README; every target prerequisite points backwards; no dangling gap; sources.toml parses with five certified entries. StableReduction, EtaleCohomologyFoundations and ProfiniteCohomology on main were read for shape. Mathematics is in Unicode with no LaTeX delimiters; no process words, pull-request numbers or machine paths occur.

## Not verifiable

- Lean elaboration: not available. This design package has no `Suggested.lean` and the brief supplies no elaboration command for the design stage; no Lean process was started.
- Fulfilment of the 20 declared supplier gaps is not certified; they are contracts. In particular gap `old-form-dimension` asks the supplier for hyperspecial transfer at every residue characteristic, which the supplier currently restricts through S_FL; whether that extension is provable is the supplier's decision, not a defect of this design.
- The Checks `hecke_rank2` and `hecke_rank3` quote values of the imported SmoothRepresentationsOfLocalGroups §SR.4.4 formulas (16, 0, 9/2, 105/2); the formulas themselves were not recomputed here.
- The extraction of ltxzz renders "⩾" as ">" and loses some sub/superscripts; the affected statements (ltxzz lines 4021, 4152, 4177, 5115–5117) were cross-checked against their proofs (lines 4190–4197, 5121–5126) rather than read from the flattened symbols.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "15139fbdd84b1c5ef26b6f6a3498f85907bb5586", "job": "REV-DESIGN-SelmerIwasawaCohomologyPartII~3", "model": "fable", "worker": "chris-f"} -->
