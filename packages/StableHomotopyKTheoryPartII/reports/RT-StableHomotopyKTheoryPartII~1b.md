<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1597#issuecomment-6404420793 -->
Red team round 1 pass b (claude) of e5cae53

Verdict: needs_changes

1. **F01** (P2) The imported sphere counterexample rests on the Segal theorem proved here

   Location: `packages/StableHomotopyKTheoryPartII/README.md:14` ("its §2.3 owns the Tate fixpoint lemma together with its sphere counterexample (S^(hC_p))^(t(C_(p²)/C_p))≃S_p^∧≠0"), `README.md:101` (same import in the RefinedTraceMethods contract), Layer 7 Examples (`README.md:924`), Downstream consumers (`README.md:1006`).

   Claim: the value (S^(hC_p))^(t(C_(p²)/C_p))≃S_p^∧ is consumed from RefinedTraceMethods §2.3 as a proved supplier statement.

   Witness: RefinedTraceMethods at its head states it under "The Tate fixpoint lemma" with the locator NS18 Example I.2.3(i) and no proof route (`TauCetiRoadmap/RefinedTraceMethods/README.md:575`); that example (ns18 lines 625–635) uses S^(tC_p)≃S_p^∧ twice, and RefinedTraceMethods records that equivalence only as "also establish … (Segal conjecture for C_p; NS18 Example II.1.2(ii))" at `README.md:563` and `README.md:690`, again without a proof route. The C_p Segal theorem is a target of this roadmap (§2.7, `README.md:304`), later in the merge order (RefinedTraceMethods 217, this roadmap 218). So the imported value has no owner earlier than this roadmap, and the Scope paragraph assigns ownership of a consequence of §2.7 to a supplier of §2.7. The last repair report noted this under "For the maintainer" but did not change the package.

   Repair (tested on the instance p=2: π₀ of the value is ℤ₂, which needs S^(tC₂)≃S₂^∧ from §2.7):

   1. `README.md:14`: replace "its §2.3 owns the Tate fixpoint lemma together with its sphere counterexample (S^(hC_p))^(t(C_(p²)/C_p))≃S_p^∧≠0, which Layer 7 applies beside its own KU orbit and tensor-diagonal counterexamples" by "its §2.3 owns the Tate fixpoint lemma; the sphere counterexample (S^(hC_p))^(t(C_(p²)/C_p))≃S_p^∧≠0 recorded there is a consequence of the C_p Segal theorem §2.7 of this roadmap and is derived in the Layer 7 Examples, beside the KU orbit and tensor-diagonal counterexamples".
   2. `README.md:101`: replace "From §2.3 consume also the Tate fixpoint lemma for bounded-above spectra with C_(p²)-action and its sphere counterexample: for S with trivial C_(p²)-action, (S^(hC_p))^(t(C_(p²)/C_p))≃S_p^∧≠0, with the residual quotient action induced by the extension rather than assigned independently" by "From §2.3 consume also the Tate fixpoint lemma for bounded-above spectra with C_(p²)-action, and its part (iii) (X^(tC_p)≃(X_p^∧)^(tC_p) for bounded-below X). The sphere value (S^(hC_p))^(t(C_(p²)/C_p))≃S_p^∧ that §2.3 lists beside the lemma, and the equivalence S^(tC_p)≃S_p^∧ that §§2.3 and 2.6 record, are outputs of §2.7 here and are not premises of any layer."
   3. Layer 7 Examples (`README.md:924`): replace "The sphere counterexample to the Tate fixpoint lemma is imported from RefinedTraceMethods §2.3: for S with trivial C_(p²)-action, (S^(hC_p))^(t(C_(p²)/C_p))≃S_p^∧, the residual quotient action being the one induced by the extension" by "The sphere counterexample to the Tate fixpoint lemma follows from §2.7: apply t(C_(p²)/C_p) to the norm sequence S_(hC_p)→S^(hC_p)→S^(tC_p)≃S_p^∧, whose residual action is trivial by the unit normalization of §4.1; the first term vanishes by the imported Tate orbit lemma, and the last is (S_p^∧)^(tC_p)≃S^(tC_p)≃S_p^∧ by RefinedTraceMethods §2.3(iii) and §2.7 again. Hence (S^(hC_p))^(t(C_(p²)/C_p))≃S_p^∧". Keep the p=2, p=3 and zero-spectrum values.
   4. Layer 7 Dependencies and Downstream consumers: replace "the sphere counterexample of RefinedTraceMethods §2.3" by "the sphere counterexample of the Layer 7 Examples" and add "§2.7; AInfCohomology §AI.7.2 (Tate orbit lemma)" to the Layer 7 Dependencies line.

   For the maintainer (not actionable here): RefinedTraceMethods §§2.3 and 2.6 state S^(tC_p)≃S_p^∧ with no proof and no supplier; its only owner is §2.7 of this later roadmap.

2. **F02** (P3) Spherical Witt lift of a finite field is also built by a later open roadmap

   Location: `README.md:569` (§4.8 "Define SW(k) to be the p-complete connective E∞-algebra étale over S_p^∧ …"), Scope and ownership (`README.md:5–7`), Downstream consumers (`README.md:1006`).

   Claim: §4.8 owns SW(k) for finite fields k.

   Witness: HabiroCohomologyFoundationsPartII at its head (`TauCetiRoadmap/HabiroCohomologyFoundationsPartII/README.md:146`) constructs "the unique p-complete connective E∞ spherical lift S_B of a perfect p-complete δ-ring B … by spherical Witt vectors, with reduction B" as its own construction target; B=W(k) gives SW(k). That roadmap is at merge position 224, after this one (218), so this roadmap is the earlier owner of the finite-field case and nothing here is upward; but neither README names the overlap, so two open pull requests build the same object.

   Repair: in Scope and ownership append after "the spherical finite-field Witt Frobenius": "(§4.8 owns the spherical lift SW(k) of a finite field; spherical lifts of general perfect δ-rings are not built here)". In Downstream consumers append: "Roadmaps building spherical lifts of perfect δ-rings import §4.8 for the finite-field case W(k) rather than constructing SW(k) again." Report the overlap on the HabiroCohomologyFoundationsPartII job.

3. **F03** (P3) The declared gap asks for an identification Mathlib already has

   Location: `README.md:105` ("What RefinedTraceMethods must provide (gap:finite-field-witt-etale-frobenius): … free of rank d over W(𝔽_p)=ℤ_p …") and `design/plan.json:2934`.

   Claim: the gap's needs sentence includes W(𝔽_p)=ℤ_p.

   Witness: `WittVector.equiv : 𝕎 (ZMod p) ≃+* ℤ_[p]` at `Mathlib/RingTheory/WittVector/Compare.lean:199` of the pin. The remaining content (W(k) finite étale and free of rank d over ℤ_p; ℤ_p-algebra endomorphisms of W(k) identified with 𝔽_p-endomorphisms of k, Witt Frobenius to a↦a^p) is not at the pins, so the gap stands; only this clause is already provided.

   Repair: in the Mathlib contract (`README.md:37`) add "Use `WittVector.equiv` in Mathlib/RingTheory/WittVector/Compare.lean for W(𝔽_p)≅ℤ_p; it is not part of the gap below." In the gap sentence, in both the README and `plan.json`, replace "over W(𝔽_p)=ℤ_p" by "over ℤ_p (identified with W(𝔽_p) by the pinned `WittVector.equiv`)". Tested on d=1: the gap then asks nothing (rank 1, Frobenius the identity by `WittVector.frobenius_zmodp`), which matches the §4.8 Check.

4. **F04** (P3) Two definitions have fewer than three discriminating Checks

   Location: §2.1 Checks (`README.md:186`), §2.5 Checks (`README.md:278`), §4.4 Checks (`README.md:505`).

   Claim: each definition has at least three discriminating Checks.

   Witness: §2.1 "The zero tower has zero continuous cohomology" and §2.5 "All stages are zero when B=0" hold for every additive construction, including the wrong one (ordinary cohomology of the limit; D_(C_p)(B) without the suspension); each section then keeps two discriminating Checks. §4.4 "For R=H𝔽_p and X=pt, P_p(a)=a^p=a" does not distinguish P_p from the identity on 𝔽_p.

   Repair: §2.1: add "For the tower with stages Σ^(−n)H𝔽_p and zero transition maps, H_c^*=0 although every stage is nonzero; the identity-transition tower on the same stage gives H*(Σ^(−n)H𝔽_p)." §2.5: add "U_0(ΣS)=Σ(S^ρ)_(hC_p)=Σ(BC_p)^ρ has bottom cell in degree p+1, whereas ΣU_0(S)=Σ²Σ∞_+BC_p has bottom cell in degree 2; U_n does not commute with suspension." §4.4: replace the 𝔽_p Check by "For R=H𝔽_p and X=BC_p, p odd, P_p(x) for x∈H⁰ is x^p=x, while for the degree-zero class 1+0 the restriction test gives 1; the identity map on R⁰(X×BΣ_p) fails the restriction law x↦x^p already for R=Hℤ, X=pt, x=2." (Values: 2^2=4≠2 at p=2.)

Inputs read in full: `packages/StableHomotopyKTheoryPartII/README.md` (1028 lines, 38 bold targets in 8 layers, 7 supplier contracts, 1 declared gap), `packages/StableHomotopyKTheoryPartII/Suggested.lean` (62 lines: module docstring, empty namespace, no declaration), `design/plan.json` (`gaps` and `sourceIssues`), `sources.toml`, the two earlier reports. Suppliers were resolved on main (GeneralizedCohomology, BordismFormalGroups, EnhancedDerivedSheaves, AlgebraicTopology) and at the open heads (TangentialBordism #942, TopologicalKTheory #894, AInfCohomology #1044, StableHomotopyKTheory #1227, KTheoryFiniteLocalFields #1281, RefinedTraceMethods #1493 at the checkout the brief names). Library declarations were checked at the pinned Mathlib and Tau Ceti.

## Verified sound

- Declarations read: 0 (Suggested.lean declares nothing). No `#check` elaboration was possible; the module docstring lists 14 headlines as not statable, and each named carrier (spectra, Steenrod algebra, spectral Tate, KU, THH, genuine spectra, Witt-vector spectral lifts) is absent at the pinned Tau Ceti (`TauCeti/AlgebraicTopology` has cellular, singular, Eilenberg–MacLane and sphere material only; no spectrum, Steenrod or Tate-spectrum file) and at the pinned Mathlib. No headline is statable; no padding; no `set_option`, no `lemma`, imports are the single `import Mathlib`.
- Targets read: 38 bold targets plus 7 supplier contracts and the Conventions, every line.
- Depcheck output, run as the brief prescribes: `depcheck: 56 roadmaps, 639 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line. The diff against origin/main touches only the package folder (README, Suggested.lean, design/plan.json `gaps` only, metadata, reports, sources.toml).
- Sibling citations checked (58 section citations across 10 suppliers): GeneralizedCohomology G2.8 (free commutative algebra as wedge of extended powers `(V∧…∧V)_(hΣ_m)`, localization at an even class), G3.8 (holim, Milnor sequence, Postnikov covers), G3.9 (localization, derived p-completion with the `F(S[1/p],E)=0` criterion and the function-spectrum model), G4.2 (Thom spaces), G5.3 (Thom spectra from diagrams), G5.4 (KU/ku at `README.md:1655`); BordismFormalGroups F6.1 (Bousfield classes, smashing not assumed), F6.3 (finite Steenrod sub-Hopf algebras, `README.md:1004`), F6.4 (smashing, E(n) classes), F6.5 (Borel norm/Tate, restriction, transfer, Frobenius reciprocity, and item 5: `R_G=(L_nS)^(tG)` is E(n−1)-local); TangentialBordism B4 items 1, 2, 7, 8 (Sq, P, β, admissible basis, Milnor dual with the stated degrees and coproduct, mod-p Adams tower, Ext page, convergence); TopologicalKTheory T1–T5 and T2.5 (Adams operations); AInfCohomology §AI.7.2 targets "Spectral Tate diagonal" (`README.md:3850`) and "Circle actions, homotopy fixed points and Tate constructions" (`README.md:3818`); KTheoryFiniteLocalFields §4.0, §4.4 (norm/restriction sequence, genuine/modern comparison), §4.5 (Tate cochains, cyclic resolution, Tate spectral sequence); StableHomotopyKTheory Layer 5, §7.9, §§7.14–7.19, §7.26; RefinedTraceMethods §2.1, §2.3 (Lemmas I.2.6/I.2.8/I.2.9 and the fixpoint lemma), §2.4, §2.5, §2.6, §2.8 (E∞ Tate-valued Frobenius as `a^(tC_p)∘φ_p∘i`, equal to multiplication after Δ_p), §2.10, §§2.11–2.13, §2.16, §5.1 (Snaith ψ^k on KU[1/k], β↦kβ), §5.3, §6.1 (Lurie HA 7.5.0.6 étale lifting; the gap section exists). EnhancedDerivedSheaves E3 and E5:abstract and AlgebraicTopology Stage 6 exist on main. TangentialBordism and TopologicalKTheory are new-roadmap pull requests of another author, which the brief allows.
- RefinedTraceMethods §5.3's displayed value "β↦(ζ_p−1)u, u=t^(−1)" equals β itself (since q−1=βt), i.e. the constant-map value; that target describes the Frobenius of the trivial cyclotomic structure, so it does not conflict with §7.3's pβ for the Tate-valued Frobenius (ns18 line 5057). No change needed; the README cites §5.3 only for the orientation.
- Mathlib declarations verified at the pin with their hypotheses: `CategoryTheory.Functor.eventualRange`, `isMittagLeffler_of_exists_finite_range`, `toEventualRangesSectionsEquiv`, `surjective_toEventualRanges`, `eval_section_surjective_of_surjective` and `eventually_injective` (`CofilteredSystem.lean:125–323`; the last two live in the `FiniteCofilteredSystem` section with nonempty finite objects and surjective transitions, `eventually_injective` also `[Finite F.sections]`, as the README's contract says), `nonempty_sections_of_finite_cofiltered_system` (root namespace, line 79), `CategoryTheory.Functor.sections` (`Types/Basic.lean:222`), `frobenius` (`Algebra/CharP/Lemmas.lean:321`, `ExpChar`), `WittVector.frobenius`, `coeff_frobenius_charP` (needs `CharP R p`), `frobenius_zmodp` (`Frobenius.lean:218–275`).
- Locators verified (41): ns18 Definition I.1.13 p.218 (line 583); Example I.2.3(i),(iii) pp.219–220 (618–666); Lemmas I.2.6, I.2.9 (726, 774); Lemma II.4.1 (2214), Corollary II.4.9 (2357); Theorem III.1.7 and proof pp.287–290 (3271–3345), the KU remark p.288 (3283), Lemma III.1.8 p.289 (3331); Definition IV.1.1 and Example IV.1.2 pp.324–325 (4836–4865); Lemma IV.1.3, Corollaries IV.1.4–5, Remark IV.1.6 (4868–4917); Lemma IV.1.7, Corollaries IV.1.8–10, Remark IV.1.11 pp.327–328 (4920–4985); display (11) and Proposition IV.1.12 pp.329–330 (4990–5060); displays before Theorem IV.1.15, Theorem IV.1.15, Proposition IV.1.16 pp.332–333 (5098–5170); (12), Lemma IV.1.17 pp.333–334 (5189–5196); Lemmas IV.1.19–20, Theorem IV.1.21, proof of IV.1.16 pp.336–340 (5256–5435); Theorem IV.3.7 and proof pp.354–355 (5978–6007). lnr12 Proposition 2.2 (265), Definition 2.3 (400), Definition 3.1 with (3.1)–(3.3) (641–713; the README's formulas agree term by term), Proposition 3.3, Theorem 3.4, Corollary 3.5 (722–745), Definition 4.3, Lemmas 4.4, 4.6, 4.10 (1148–1309), Theorem 5.2 (1684), Proposition 5.7 (1935: `(B^∧p)^(tC_p)[1−(p−1)n]≃Σ^(1+n)D_(C_p)(Σ^(−n)B)`), Theorem 5.9 (1964), Definition 5.10, Lemma 5.11, Proposition 5.12 (2002–2038), Theorem 5.13 (2109). agm85 Theorem 1.3 (90), Lemma 2.1 (236). bmms86 VIII.1 (4297), VIII.2 Proposition 2.2(ii),(v) and 2.4(vi) (4464–4481), χ=m!u^m, βb=u, ω=m!bu^(m−1) (4501–4508), VIII.4 (4664–4680). milnor58 Theorem 2 (406). kuhn04 Theorems 6.2, 6.6 (596, 625). malkiewich17 Proposition 2.22 with the fibre formula `Ω^nΣ∞X^∧n ∨ Ω^nΣ∞X^∧(n+1)` (609–626). cartan55-I/II/III lines 131, 153, 114 are the cited theorems. ns19-correction read in full (166 lines): typesetting only.
- Checks tested: 131 README Checks evaluated; all true except the three non-discriminating ones of R04. Representative values: §1.1 at p=3, b↦2b gives u'=2u, t'=2t, e'=e, t'²=t²; β(b·u⁻¹)=u·u⁻¹=1; (−t,−e) has β(−e)=−1. §2.3: Sq¹(x⁻¹⊗1)=binom(−1,1)x⁰=1 in 𝔽₂; ε(Σxy⁻¹⊗1)=(−1)⁰P⁰(1)=1. §2.5: U_n(S)=Σ(BC_p)^(−nρ̄), bottom degrees 1,0,−1 at n=0,1,2 for p=2. §4.3 at X=H𝔽₂: P(1+1)=P(1)+P(1)+tr(1) gives 2·1=tr(1)≠0 (π₁H𝔽₂=0 makes the transfer injective), so π₀=ℤ/4. §4.5: gcd of binom(5,i), 0<i<5, is 5; 2⁵−2=30 dies mod 5, survives mod 120. §5.1: V of rank −1 at a point gives [S¹,R]=π₁R; Möbius line gives H¹(S¹;ℤ_sign)=ℤ/2. §5.2 at p=2, n=−1: ΣHℤ gives π₂=0, Σ²Hℤ gives ℤ. §6.2 even part: P(v)=v(v+u)(v+2u)=v³−vu² at p=3, quotient by −u² is v−v³t²; general n: dividing Σ(−1)^(mi+mn(n−1)/2)P^i(x)χ^(n−2i) by its leading term and using (m!)²=(−1)^(m+1) gives (−1)^iP^i(x)t^((p−1)i), checked at p=3 and p=5. §6.2 odd part: (x−ye)(z−we)=xz−xwe+yze=xz+β(xz)e with β(xz)=yz−xw; the unsigned version gives xz+xwe−yze≠xz+(yz−xw)e. Independently, with β a left derivation, applying β to bmms86's 2.4(vi) expansion gives Σ[βP^ix−βP^ix]χ^(q−2i)=0, which is its Proposition 2.2(v); the unsigned Bockstein term would give 2βP^ix·χ^(q−2i)≠0 for odd q. §6.3: θ₀(x)=−y in degree 1, θ₀(xz)=yz−xw in degree 2. §7.1 at p=2: tensor square of ℂ² is 3·1+sign, character 2; (−1)^(⊗2) is sign in even degree, character −1. §7.2: ℚ₂-dimensions 1 and 1+2=3; at p=3, 2 and 2+6=8. §7.3: (1+β)^p=1+pβ. §7.5: (L₁S)^(tC₂) is E(0)-local by F6.5 item 5; C₂-Tate is 2-local. §8.1 at Y=S²: bottom degrees n and n+2; Y=S¹: 0.
- Gap: precise, minimal up to R03, declared with the same slug in `plan.json` and in the README under the RefinedTraceMethods contract; the named section 6.1 exists at the head.
- Conventions: left-derivation Bockstein with suspension coordinates on the left, Tate coefficients on the right, t=u⁻¹, e=bu⁻¹, βe=1, W weight a on t and 1 on e (ns18 line 5111 states the inverse action on t⁻¹e and trivial action on e, in agreement). The README's own §6.2/§6.3 are consistent with these conventions, with bmms86 2.2(v) and 2.4(vi), and with each other in every Check; its reading of ns18 Proposition IV.1.16 as unsigned is correct (ns18 lines 5167–5170).
- Ownership: no roadmap on main or at an open head builds the Singer construction, the inverse-limit Adams comparison, the all-degree Frobenius comparison, the total Steenrod identification, Atiyah's cyclic power or the free-loop Segal theorem (`roadmaps grep`, seven queries). Ownership against open pull requests whose files the brief does not give was not checked beyond `roadmaps grep`.
- Policy: no pull-request numbers or process words in README or docstring; every target has a locator; no computational algorithm.

## Not verifiable

- The global sign of the Bockstein component (x↦x−ye rather than x+ye on a degree-one class with βe=1) depends on reading bmms86's β in 2.4(vi) as the left-derivation connecting homomorphism; the multiplicativity test fixes only the degree dependence (−1)^n. The README's reading is the one consistent with bmms86 Proposition 2.2(v) under the left Leibniz rule, as computed above, and the scan is OCR of a two-page spread, so I could not read the surrounding text well enough to exclude a right-derivation convention there.
- bmms86 is a scan whose OCR interleaves two pages; Propositions 1.1–1.4 of VIII.1 (line 4297) and the VIII.4 statements (lines 4664–4680) were identified by their numbers and fragments, not read in full.
- The identification of LNR's ε_B with the Tate diagonal Δ_p (§2.6) is a proof-route claim resting on the unit normalization of AInfCohomology's Tate diagonal; no source states it in this form.
- The exactness of the IV.1.17 comparison as a module map over the Tate coefficient ring, which the §6.2 proof route needs for its "unit of Ĥ^(n(p−1))" step, is asserted by the route, not by ns18.

## Source issues

- **Error** in ns18 at Proposition IV.1.16, printed p.333: the source says the Frobenius on a degree-n class is the unsigned sum of P^i(x)t^((p−1)i) and βP^i(x)t^((p−1)i)e; it should carry (−1)^i on both parts and (−1)^n on the Bockstein part when β is the connecting homomorphism, since the unsigned map is not multiplicative and the Euler class of L⊗ℂ[C_3] gives v−v³t²; affects a stated result.
- **Misprint** in ns18 at Theorem IV.1.15 and the displays before it, printed p.332: the source says the odd-primary summands are H𝔽_p[n(p−1)] and the P^i component lands in H𝔽_p[i(p−1)]; it should be H𝔽_p[2n(p−1)] and H𝔽_p[2i(p−1)], the degree of P^i; affects nothing.
- **Misprint** in ns18 at Example I.2.3(iii), printed p.220: the source says [p](x)=(x−1)^p−1 and [p²](x)=(x−1)^(p²)−1; it should be (1+x)^p−1 and (1+x)^(p²)−1, which vanish at x=0; affects nothing.
- **Error** in ns18 at Example IV.1.2(ii), printed p.325: the source says the constant-to-Tate comparison is an equivalence for R compact in p-complete spectra, with S_p^∧ as an example; S_p^∧ is not compact there (the p-inversion colimit is 0 in complete spectra while the colimit of π₀ maps is ℚ_p), so it should say dualizable, or p-completions of finite spectra and their retracts; affects a stated result.
- **Misprint** in ns18 at Remark IV.1.11, printed p.328: the source says the transfer ideal is taken in R⁰(BΣ_p); it should be R⁰(X×BΣ_p), as its own next display has; affects nothing.
- **Misprint** in ns18 at Lemma III.1.8, printed p.289: the source says the sets are indexed by n>0 and does not mention empty sets; it should allow n≥0 and empty stages, which the proof handles; affects nothing.

## Adversarial pass table

One row per target and convention. "Both sides" gives the values computed on each side of the instance.

| Statement | Instances tried | Values on each side | Result / change |
|---|---|---|---|
| Conventions: Rⁿ(X)=[Σ∞_+X,ΣⁿR] | X=pt, n=−1 | π₁R on both readings of §5.1 | sound |
| Conventions: binom(−1,1) | p=2 | −1=1 in 𝔽₂ | sound |
| Conventions: Bott class β=[H]−1 | S², p=2 | H²=1+2β, β²=0 | sound |
| §1.1 Tate coefficients, weights | p=3, a=−1; b↦2b; (−t,−e) | t weight −1, t² weight +1, degree −4; u'=2u, t'=2t, e'=e, t'²=t²; β(−e)=−1 vs βe=1 | sound |
| §1.1 Hℤ Tate | p=2; p=3 | π₀=ℤ/2, π₁=0; invariant period 4 | sound |
| §2.1 continuous cohomology | constant tower; zero tower; Singer tower of S at p=2 | H*(B); 0; Σ𝔽₂[x^±] vs H*(S₂^∧)=0 in negative degrees | sound; R04 adds a Check |
| §2.2 inverse-limit Adams | zero tower; constant H𝔽_p; Singer sphere tower | 0; E₂=𝔽_p at (0,0), π₀=𝔽_p; bottom degrees 1,0,−1 | sound (lnr12 2.2 hypotheses retained) |
| §2.3 Singer formulas and ε | Sq¹(x⁻¹⊗1); β(xy⁻¹⊗1); ε(Σx⁻¹⊗1); ε(Σxy⁻¹⊗1); degrees of both odd-p sums | 1; 1; Sq⁰(1)=1; (−1)⁰P⁰(1)=1; 2r+2s(p−1)+|a| on every term | sound, agrees with lnr12 (3.1)–(3.3) |
| §2.4 Tor-equivalence | M=0; M=N=𝔽_p; N=Σ⁻¹𝔽_p | 0; Hom of dimension 1, unit↦1; shift −1 | sound (agm85 1.3, lnr12 3.3–3.5) |
| §2.5 U_n(B) | B=0; n=0; B=S, p=2 | 0; ΣD_(C_p)(B); Σ(ℝP^∞_(−n)), bottom 1−n; holim Σℝ P^∞_(−∞)=S₂^∧ (Lin) | sound (lnr12 5.7); R04 adds a Check |
| §2.6 cohomology comparison | B=0; B=S p=2; odd p | 0; Σx⁻¹ degree 0 ↦1; Σxy⁻¹ degree 0 ↦1, y⁻¹ degree −2 | sound (lnr12 5.9, 5.12) |
| §2.7 finite-type Segal | S; H𝔽_p; Hℚ | π₀=ℤ_p, negative π=0; identity on 𝔽_p; 0=0 | sound (lnr12 5.13); ownership vs RefinedTraceMethods: R01 |
| §3.1 finite towers | constant 2-set; constant ∅; {a,b}←{a}←…; {0,1}ⁿ deletion | stable image 2; 0; limit {a}, image {a}, transition not onto; limit uncountable, 0^∞ and 0ⁿ10^∞ agree at n | sound; Mathlib hypotheses as stated |
| §3.2 truncated Tate | X=0; n<0 for H𝔽_p; H𝔽_p⊕H𝔽_p; lim over n | 0; τ_(≤n)=0 so 0; mixed words free orbits, two diagonal terms; H𝔽_p | sound (ns18 lines 3316–3330) |
| §3.3 HV | V=0; 𝔽_p; 𝔽_p²; uncountable basis | 0; identity on p elements; dimension 2; direct sum, not product | sound (ns18 3338–3345) |
| §3.4 bounded-below Segal | S; Σ⁻¹H𝔽_p; H(⊕_J𝔽_p); KU at p=2 | ℤ_p; 𝔽_p in degree −1 both sides; identity; KU₂^∧/2=𝔽₂ vs T₂(KU)/2=0 | sound (ns18 III.1.7) |
| §4.1 Weyl refinement | p=2; p=3; S; S[ℕ] | W trivial; |W|=2 invertible on p-complete target; 1↦1; z↦z^p | sound (ns18 IV.1.3–6) |
| §4.2 space diagonal | X=0; Hℤ p=2; sphere unit | contractible; 2↦4≠2+2; 1↦1 | sound (IV.1.7) |
| §4.3 norm splitting | X=0; H𝔽_p; H𝔽₂ p=2 | 0; 0→𝔽_p→π₀→𝔽_p→0; 2·P(1)=tr(1)≠0 so ℤ/4 | sound (IV.1.8) |
| §4.4 P_p | 0,1; Hℤ p=2; 𝔽_p; restriction | 0,1; 4≠2; a^p=a (non-discriminating); x^p | sound; R04 replaces one Check |
| §4.5 transfer ideal | Hℤ, pt, p; p=5; H𝔽_p | gcd binom(p,i)=p; 30≡0 mod 5, 30≢0 mod 120; binom(p,i)≡0 so I=0 | sound (bmms86 1.1(vi), ns18 IV.1.11) |
| §4.6 degree-zero comparison | Hℤ p=2; H(𝔽₃[z]); X=∅ | 2↦4≡0; z↦z³; both 0 | sound (IV.1.9–11) |
| §4.7 HA and finite p-complete | ℤ p=3; ℚ; zero ring; 𝔽₄ p=2; S_p^∧ | 2³=8≡2; A/pA=0; 0→0; a²=a+1≠a; 1↦1, p-inversion colimit 0 vs ℚ_p | sound (IV.1.2); compactness reformulated correctly |
| §4.8 SW(k) | d=1; Teichmüller [a]; d-th iterate | S_p^∧, identity; [a]↦[a^p]; Frob^d=id on W(𝔽_(p^d)), uniqueness via étale lifting | sound; gap R03; overlap R02 |
| §5.1 twisted cohomology | V=0; rank −1 at pt; Möbius λ on S¹; ρ₂ | Σ∞_+X; [S¹,R]=π₁R; H¹(S¹;ℤ_sign)=ℤ/2 vs ℤ; swap degree −1, square +1 | sound (IV.1.19 proof) |
| §5.2 Thom adjunction | n=0; X=pt n=−1; p=2 n=−1 ΣHℤ, Σ²Hℤ; n=1,2 | ordinary Borel cohomology; π_pR; 0 and ℤ (rank −1 reading: ℤ and 0); degrees −1,+1 | sound |
| §5.3 P_p^n | 0; n=0; n=1; n=−1 | 0; P_p; twist nρ not untwisted; S^(−ρ)⊗S^ρ=S | sound ((12), IV.1.20) |
| §5.4 Tate suspension | n=0; H𝔽₂ n=1 p=2; n=−1 then n=1 | identity; π_i=π_(i−1)H𝔽₂^(tC₂)=𝔽₂; total shift 0 vs 4 | sound (IV.1.17) |
| §5.5 Thom description | X=pt V=0; rank 1 p=2; rank −1 | Σ∞_+BΣ_p; rank −2, det −1 vs +1; ΣS, twist +ρ | sound (IV.1.20) |
| §5.6 all-degree comparison | n=0; p=2 n=1 u; n=−1 | §4.6 value 0; u+u²s degrees 1,1; twist −ρ, rank 0 after +ρ | sound (IV.1.21) |
| §6.1 splittings | p=3; Hℤ p=2; degree count | summands at 4 and 5; π₁=0, π₀=𝔽₂; one summand per degree | sound (ns18 5116–5126, degrees corrected by factor 2) |
| §6.2 components | u∈H¹(ℝP∞); v∈H²(ℂP∞;𝔽₃); x∈H¹(BC₃); x,z on BC₃×BC₃; p=5 | u+u²s; P(v)=v³−vu², quotient v−v³t²; x−ye; (x−ye)(z−we)=xz+(yz−xw)e=F(xz), unsigned product xz+(xw−yz)e≠F(xz); (2!)²=4≡−1 gives (−1)^i | sound; bmms86 2.4(vi) with (−1)^q and 2.2(v) agree under left Leibniz |
| §6.3 spectrum components | p=2 unit; p=3 v; p=3 x, xz; Hℤ | 1↦1; −v³, 0; −y, yz−xw; even components only | sound; stability of θ_i checked on ι×x |
| §7.1 Atiyah power | 0,1; ℂ² p=2; −1 p=2; line L | 0,1; 3·1+sign, rank 4, character 2; sign, character −1=ψ²(−1); [L]^p | sound (bmms86 VIII.4, ns18 IV.1.12 proof) |
| §7.2 KU Tate coefficients | p=2 r=1,2; p=3 r=1; x=0 | ℚ₂; ℚ₂⊕ℚ₂(i) dims 1,3; ℚ₃(ζ₃) degree 2, invariants ℚ₃; (1+0)^p−1=0 vs (0−1)^3−1=−2 | sound; ns18 misprint recorded |
| §7.3 KU Frobenius | H on S²; β,β⁻¹; 0,1,−1 | (1+β)^p=1+pβ; pβ·β⁻¹/p=1 vs p; 0,1,−1 | sound (IV.1.12(ii)); RefinedTraceMethods §5.3 value is the constant map's, no conflict |
| §7.4 KU orbit counterexample | p=2; p=3; Hℚ | dims 3 vs 1; 8 vs 2; both 0 | sound (I.2.3(iii)) |
| §7.5 unbounded failure | degree 0; degrees ±2; S | 𝔽₂ vs 0; same by Bott; ℤ₂ not rational | sound; F6.5 item 5 at n=1 gives E(0)-locality |
| Layer 7 Examples sphere counterexample | p=2; p=3; 0 | π₀=ℤ₂, ℤ₃; 0 | value sound; provenance: R01 |
| §8.1 free-loop totalization | Y=pt; Y=S² n=1,2; Y=S¹; wedge of κ copies of S² | S; (1,3),(2,4); bound 0; same bounds | sound (malkiewich17 2.22 fibre formula) |
| §8.2 Tate and towers | constant tower; fibres ΣⁿH𝔽_p; S² tower | identities; no orbit groups below n; (1,3),(2,4) | sound (ns18 5996–6004) |
| §8.3 free-loop Segal | Y=pt; Y=S² and wedges; n=1,2,0 | S→S^(tC_p), π₀ ℤ_p, genuine π₀ rank 2; same bounds; one and two pullbacks, identity | sound (IV.3.7, II.4.9) |
| Gap finite-field-witt-etale-frobenius | d=1; 𝔽₄ | rank 1, Frobenius identity (Mathlib `frobenius_zmodp`); a↦a+1 | precise; W(𝔽_p)=ℤ_p already pinned: R03 |
| Suggested.lean | all 14 headlines | no carrier at the pins for any | nothing statable; docstring complete |

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e5cae53d723ef8212222feb7e9e31657e515e7ee", "job": "RT-StableHomotopyKTheoryPartII~1b", "model": "fable", "worker": "chris-k"} -->
