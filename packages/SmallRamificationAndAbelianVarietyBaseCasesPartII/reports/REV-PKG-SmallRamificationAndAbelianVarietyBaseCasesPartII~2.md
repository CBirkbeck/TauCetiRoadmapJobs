<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1646#issuecomment-6406482682 -->
Review (claude) of a92beaf

Verdict: accepted
Conditional on the announced gaps: `witt-proper-smooth-comparison`, `fl-acris-truncation`, `fl-weight-zero-unramified`, `fl-rank-one-inertia`, `fl-oriented-mod-p-splitting`, `pm-remove-inverse-e`, `finite-torsion-kernel-dictionary`, `completed-unramified-inertia`

1. **F01** (P3) The degree-ten step consumes a prose decimal of the supplier, not its declared row

   **Location.** `packages/SmallRamificationAndAbelianVarietyBaseCasesPartII/README.md:87` ("row (b)'s accompanying exact numerical lower bound is 7.00 at n=11 … every totally complex F with rd(F)<7 has [F:ℚ]≤10"); used at lines 427 ("rd(F′)<7 … [F′:ℚ]≤10"; "rd(F)<7 gives [F:ℚ]≤10"), 434, 437, 519, 647.

   **Claim.** The supplier SmallRamificationAndAbelianVarietyBaseCases §1.9 supplies "rd<7 ⇒ degree ≤10".

   **Witness.** At head d6e456e, `TauCetiRoadmap/SmallRamificationAndAbelianVarietyBaseCases/README.md:634` declares row (b) as `rd < 6.93 ⇒ n ≤ 10`; line 645 only reports the decimal "7.00" as the value of the exact inequality at n=11. Recomputing with the supplier's own kernel (§1.5 `g`, §1.7 `F_b`, `I₁`): I₁(17/4)=1.228965, exp(γ+log 8π−I₁−16·(17/4)/(11π²))=7.00114. The inference "rd<7 ⇒ n≤10" therefore holds, but with margin 0.00114 (an I₁ margin of 0.00017), and the supplier's packaged target `finrank_le_of_rootDiscr_lt_of_isTotallyComplex` states 6.93.

   **Repair** (tested on both fields of §2.4). Replace the sentence at line 87 by: "Row (b) gives [F:ℚ]≤10 for every totally complex F with rd(F)<6.93. For a Galois F/ℚ tame at 7 and unramified elsewhere, rd(F)=7^(1−1/e) with e the inertia order at 7; since e·f≤[F:ℚ] and e divides 7^f−1, [F:ℚ]≤287 forces e≤143 (e=6 when f=1), so rd(F)≤7^(142/143)<6.91<6.93." Then at line 427 replace both "rd<7" steps by this bound; at 434 and 647 say "rd(F′)≤7^(35/36)<6.64<6.93" for the tame fixed field (degree ≤36) and "rd(F)≤7^(142/143)<6.93" for tame F; at 437 and 519 cite "§1.9 row (b)" without the decimal. Instance check: F′ of degree 6n″≤36 has e≤36, 7^(35/36)=6.6317<6.93, so 6n″≤10 and n″=1; tame F of degree 6n′≤287 has 7^(142/143)=6.9054<6.93, so 6n′≤10 and n′=1. The route, the Sylow count and the four characters are unchanged.

2. **F02** (P3) One declared gap has a loosely worded third clause

   **Location.** `packages/SmallRamificationAndAbelianVarietyBaseCasesPartII/README.md:81` and the same `needs` in `design/plan.json`: "Supply the finite continuous p-primary Galois-module and kernel-field dictionary, fixed-point/cardinality detection of a splitting field, compatibility with the cyclotomic degree/action identification at seven."

   **Claim.** The `needs` sentence says exactly what ArithmeticGaloisRepresentations must add.

   **Witness.** The consumers use three determinate facts: §1.5 line 272 (U^{G(E)}=U iff L⊆E, for algebraic E not necessarily complete), §2.4 line 427 (the kernel field of U⊕𝔽₇(1) is E(ℚ(ζ₇))), and the same line (ℚ(ζ₇) has degree 6 with Gal≅(ℤ/7)^× acting through χ₇). The words "dictionary" and "compatibility with the … identification" do not name them. ArithmeticGaloisRepresentations §2.2 at head bef111d (`README.md:1573`) states unramifiedness and finiteness of the ramification set, not these facts.

   **Repair.** Keep the slug and supplier; replace the `needs` sentence in both places by: "For a profinite G acting continuously on a finite abelian p-group U with kernel H and kernel field L=K̄^H: L/K is finite Galois and, for every algebraic E/K inside K̄, U^{G(E)}=U iff L⊆E; the kernel field of U⊕U′ is the compositum of the kernel fields; the kernel field of 𝔽₇(1) over ℚ is ℚ(ζ₇), of degree 6, with Galois group (ℤ/7)^× acting through χ₇." Instance: for the weight-one object at p=3, L=ℚ₃(π), E=ℚ₃ gives U^{G(E)} of size 1<3 and L⊄E; E=L gives 3=3 and L⊆E.

Two non-blocking findings (both P3). No P1 or P2 finding. The acceptance is conditional on the eight declared supplier gaps listed at the end of this report.

## Repairs of the previous round, finding by finding

| Previous finding | Repaired passage (quoted, ≤40 words) | Status |
| --- | --- | --- |
| F01 (P2) Frobenius generation hypothesis missing | `packages/SmallRamificationAndAbelianVarietyBaseCasesPartII/README.md:202`: "Let M∈MFₜₒᵣ[0,r] … be killed by p … Fil⁰M=M, Filʳ⁺¹M=0 and the Frobenius generation condition Σᵢφᵢ(FilⁱM)=M." Carried into §§1.3–1.7 ("For M∈MFₜₒᵣ[0,r] killed by p", lines 232, 250, 268, 286, 304) and §1.8 ("for a generating M∈MFₜₒᵣ[0,r] killed by p", line 326). Negative control at line 226. | Repaired. The negative control recomputed: A(E)=𝔽₃[π]/(π²), φ₀(a+bπ)=a³=a, so Hom = {0,π,−π} (3 elements) while x³=0 has 1 solution; excluded because Σ Im φᵢ=0≠M. |
| F02 (P2) statable K3 headline absent | `Suggested.lean:74–90`: `geometricK3_hasBadWittPrime` with the five conditions `SmoothOfRelativeDimension 2 fbar ∧ IsProper fbar ∧ GeometricallyIntegral fbar ∧ Nonempty (Ω² ≅ O) ∧ Subsingleton H¹(O)` on the pullback to `AlgebraicClosure ℚ`; docstring at lines 13–15; README §4.2 line 605 names it. | Repaired. Elaborates (see below). Conditions match `IsK3` at `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/Suggested.lean:88–93` (head 14c5246), where `differentialForms k f 2` unfolds to the same sheaf exterior power. |
| F03 (P2) redundant root-discriminant gap | README line 87: "Section 1.9, row (b)'s accompanying exact numerical lower bound is 7.00 at n=11, b=17/4, and the bound increases with n. Thus every totally complex F with rd(F)<7 has [F:ℚ]≤10." Slug absent from README and `design/plan.json` (only the `gaps` key changed since the design commit). | Repaired as prescribed. The statement is true (I recomputed the bound: 7.00114 at n=11), but see R01: it rests on a prose decimal with margin 0.0011, not on the supplier's declared row. |
| F04 (P3) repeated / non-instance Checks | §1.6 line 298: "x²+3 takes only the residues 1,3,4,7 modulo 9"; §2.3 line 417: ramified transvection with a(g)=6; §3.2 line 554: eight pairs listed for ℙ²; duplicates at former lines 286, 324–325, 432, 580, 626 gone. | Repaired. Every section has ≥3 Checks (counts: 0.1:3, 0.2:3, 1.1:4, 1.2:6, 1.3–1.8:3 each, 2.1:3, 2.2:4, 2.3–2.4:3, 2.5:5, 2.6–2.8:3, 3.1–3.3:3, 4.1–4.3:3). Values recomputed below. |
| F05 (P2) compound gap | README lines 67, 69, 71: `gap:fl-weight-zero-unramified`, `gap:fl-rank-one-inertia`, `gap:fl-oriented-mod-p-splitting`, each with p, k, K, the interval and the quantifiers; §2.3 Needs (419), §2.5 Needs (457), §2.6 Needs (475) repointed; Layer 2 Dependencies (519) lists the three. `plan.json` `gaps` has the same three slugs with identical `needs`. | Repaired. Each contract is single-statement and precise; orientation j<i checked against the Fontaine–Laffaille basis-change computation below. |

No finding of the repair report was marked "not actionable"; nothing is re-raised.

## Verified sound

### Principles

Scope is a Part II of SmallRamificationAndAbelianVarietyBaseCases (which stops at finite-flat and abelian-variety obstructions, head d6e456e §§1–3); nothing of that roadmap is re-planned. The local theory is stated for every perfect k and every 0<r<p−1; the global argument at seven is Fontaine's theorem, not a good-prime restriction, and the geometric hypothesis quantifies every prime including 2 (`hasEverywhereWittGoodReduction`, `Suggested.lean:50–53`). No algorithm, no copied passage (statements are paraphrased against Fontaine93 lines 93–103, 110–118, 141–156, 172–283, 285–414), no `set_option`, no `lemma`, no sorry'd data (the two `def`s have real bodies), imports are `import Mathlib` plus three `TauCeti.*` modules whose object files exist at the pin. Policy grep for process words, pull-request numbers and LaTeX delimiters: no hits.

### Elaboration and signatures

From the content checkout, `lake env lean` on `packages/SmallRamificationAndAbelianVarietyBaseCasesPartII/Suggested.lean`: exit 0, exactly two diagnostics, `declaration uses 'sorry'` at lines 60 and 74. A scratch copy appending `#check @name` for the four declarations elaborated with the same two warnings; the elaborated types keep `[Smooth f] [IsProper f]`, `hasEverywhereWittGoodReduction f`, `i ≠ j`, `i + j ≤ 3` on `lowDegreeHodgeVanishing`, and `[Smooth f] [IsProper f]` plus all five K3 conditions on `geometricK3_hasBadWittPrime`; `hasWittGoodReductionAt` keeps `[Fact p.Prime]`. No binder lost; generality equals the README (§§0.1, 3.2, 4.2).

One-tactic probe (same scratch copy): `lowDegreeHodgeVanishing` with `first | simp | rfl | infer_instance | (intro; infer_instance)` fails on all branches; `geometricK3_hasBadWittPrime` with `first | simp | rfl | infer_instance | (intro; simp) | (intro; infer_instance)` leaves the goal open after `simp` rewrites the conjunction into implications. Neither is padding. No `example`, no API lemma, no boundary theorem in the file.

### Dependency check

    tauceti-roadmap … gate --depcheck …/README.md --name SmallRamificationAndAbelianVarietyBaseCasesPartII --order …/ORDER.txt --movable
    depcheck: 56 roadmaps, 646 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. Merge order: CrystallineCohomology 21, K3SurfacesAndSymplecticBoundedness 45, ArithmeticGaloisRepresentations 47, FiniteFlatGroupsAndIntegralPadicHodgeTheory 52, DeligneWeightsAndPurity 91, SmallRamificationAndAbelianVarietyBaseCases 133, PadicHodgeTheory 136, this roadmap 137, EnriquesSurfacesAndIntegralNonexistence 142 (cited only as a consumer). LocalFieldsRamification, EtaleCohomologyFoundations, SchemeAndStackFoundations, EllipticCurves are on main (content ff983be2).

### Sources: seeded sample and author-flagged locators

No locator is flagged unverified in `sources.toml`. All three texts were read from the cache; Fontaine93 is the author preprint (printed pages 1–13), as the manifest's `version_note` says.

| Target | Locator read | Support |
| --- | --- | --- |
| 0.1 | Fontaine93 lines 93–103 (Theorem 1, Remark (a), p. 3); LMFDB32a3 lines 158–164 (y²=x³−x), 262–277 (Δ=64=2⁶, j=1728), 494–517 (p=2, Kodaira III, additive, ord₂Δ=6) | Remark (a) defines good reduction everywhere as a proper smooth Z over W(F̄ₚ) with Z⊗Frac W(F̄ₚ)≅X⊗Frac W(F̄ₚ) for every p, weaker than a ℤ-model: exactly the predicate. LMFDB values as stated. |
| 1.1 | lines 294–311 (§3.2, pp. 8–9) | b_E = {v₀>r/(p−1)} strict; Filⁱ from v₀≥i/p; φᵢ = x̂ᵖ/(−p)ⁱ; Filⁱ=0 for i>r by convention. Matches. |
| 1.5 | lines 361–368 (§3.6 Lemma 3, p. 10) | #J(E)≤p^d with equality iff a K-embedding L→E exists; proof via J(E)=J(K̄)^{H′}. Matches. |
| 1.6 | lines 369–399 (§3.7 Lemma 4, pp. 10–11) | (Pₘ) for m>1+r/(p−1); proof reduces to equal residue fields, lifts the uniformizer, gets an injective filtered map A_L→A_E. Matches; the roadmap's threshold is the same. |
| 1.7 | lines 110–118 (Theorem 2 as restated on p. 3), 400–414 (§3.8) | Main proof: u−1/e<m for all m>1+r/(p−1), refined to u≤1+r/(p−1), then v(𝔇)=u−i<u. The strict inequality uses i>0 (ramified case); unramified separately. The roadmap's route and gap:pm-remove-inverse-e correspond to "en étant un peu plus soigneux". |
| 2.1 | lines 172–183 (§2.2, p. 5) | Finite 7-primary continuous G-modules unramified outside 7; C^{[0,3]}_cris closed under sub, quotient, direct sum. Matches; the roadmap adds the explicit statement that an ambient extension needs the local condition on the middle term. |
| 2.2 | lines 141–146, 172–183 (Propositions 1, 1′) | V₄=0, Vᵢ={v: gv−χⁱ(g)v∈Vᵢ₊₁} for i=3,2,1,0, V₀=V. Order and congruence match. |
| 2.3 | lines 184–197 (§2.3 Lemma 1) | Trivial endpoints ⇒ Fil¹M=0 ⇒ unramified at 7 ⇒ unramified everywhere ⇒ trivial. Matches. |
| 2.4 | lines 198–213 (§2.4 Lemma 2, p. 6) | rd<7^{3/2}<18.52026, Diaz y Diaz gives n≤208; Sylow argument; tame fixed field with rd<7 and degree ≤10. The roadmap uses the weaker base bound 287 and recomputes n″≤6 (see table). |
| 2.5 | lines 220–239 (§2.5 Lemma 3, pp. 6–7) | Split unless i=0 and j=3; i>j by local FL and no everywhere-unramified cyclic degree-7 extension of ℚ(ζ₇); i<j via a cyclic degree-7 extension totally ramified at 7 with break j and 7^{53/42}<11.66. Matches, including orientation (sub F(j), quotient F(i)). |
| 2.6 | lines 240–273 (§2.6 Lemma 4, pp. 7–8) | Cyclic case through a character whose inertia restriction is χⁱ; induction on order; Ū not cyclic since j≠0; Lemma 3 splits the mod-7 piece. Matches; the roadmap supplies the Minkowski step the letter leaves implicit. |
| 3.1 | lines 147–156 (§2.1, p. 4) | Weil conjectures: V′=0 except m=2 where V′≅ℚ₇(−1)^{n}. Matches. |
| 3.2 | lines 93–103, 147–156, 184–193 (footnote 6) | (H^j(X,Ω^i)⊗C(i))^{G₇}-type identification; vanishing for i+j=1,3 and for i+j=2 with i≠j by (C(i))^{G₇}=0 for i≠0. Matches. |
| 3.3 | lines 93–103 | ℤ-models and independent ℤₚ-models give Witt witnesses by base change; the letter says this is weaker than a ℤ-model. Matches. |
| 4.3 | `TauCetiRoadmap/CrystallineCohomology/README.md:3345–3353` (head 013a921, §CR.3.5): H^q(ℙⁿ_A,Ω^p)=0 unless 0≤p=q≤n, rank one on the diagonal, over any base ring A; Fontaine93 lines 147–151 | Supplier owns the computation; the roadmap imports it as a worked example. |

Also read: §1.2 at lines 316–328 (column convention φ_{i_t}e_t=Σ_s λ_{s,t}e_s and the equation x_tᵖ=(−p)^{i_t}Σ_s λ̂_{s,t}x_s); §1.3 at 328–337 (n>re/(p−1)); §1.4 at 285–313, 341–360; §1.8 at 23–30; §4.1–4.2 at Schroeer23 lines 683–697 (h²⁰≠0 for the K3 generic fibre, Fontaine cited for W(F̄ₚ)-good reduction, bad reduction over W(F̄₂)).

### Computed adversarial table

| Statement or convention | Instances tried and values on both sides | Result |
| --- | --- | --- |
| §0.1 both predicates | ℙⁿ: ℙⁿ_W witnesses for all n≥0 (n=0 included). Empty X: empty Y, both pullbacks empty, so the predicate holds. y²=x³−x: v₃(64)=0 gives a ℤ₃-model; at 2, j=1728 integral (potential good reduction) but ord₂Δ_min=6 and Kodaira III, so inertia on E[3] is nontrivial (EllipticCurves Layer 4 NOS (iii), N=3, char k=2∤3), contradicting smooth proper base change for a W(F̄₂)-model. | Pass. Local ≠ everywhere ≠ potential; no nonemptiness or connectedness smuggled in. |
| §0.2 signs and purity | ℙ¹, q=2: geometric Frobenius on H² is 2, on the dual 1/2; HT weight of ℚ₇(−1) is −1 with HT(χ)=+1; (C₇(i)⊗H₂)^G=(C₇(i−1))^G ≠0 only for i=1, giving H¹(Ω¹)=ℚ of dimension 1. DeligneWeightsAndPurity example (head 6c2402d, after §7.15): ℚ_ℓ(1) has scalar q⁻¹, weight −2. | Pass; conventions agree between Layer 0, Layer 3 and the purity supplier. |
| §1.1 well-definedness of φᵢ | Changing the lift by y with v₀(y)>r/(p−1): for 1≤k≤p−1 the term C(p,k)x^{p−k}y^k/(−p)ⁱ has v₀ > r/(p−1) + 1 − i(p−k)/(p(p−1)) ≥ r/(p−1) + 2/p; the k=p term has v₀ > pr/(p−1) − i ≥ r/(p−1). Instance p=3, r=1, π²=−3: v₀(π)=1/2=r/(p−1), [π]≠0, φ₁([π])=[π³/(−3)]=[π]; with +3 one gets −[π]≠[π] since v₀(2π)=1/2 is not >1/2. | Pass; strict cutoff and sign pinned. |
| §1.2 generation (F01) | M=0: Σ Im φ=0=M, one solution each side. Unit weight 0 at p=3: x³=x has 3 roots, Hom has 3 elements. Zero-Frobenius 𝔽₃: Hom={0,π,−π} (3) vs x³=0 (1); excluded by 0≠M. | Pass; the counterexample of F01 is excluded exactly by the added hypothesis. |
| §1.2 column convention | Weights (0,1), λ rows (1,1),(0,1), p=3: x₁³=x₁, x₂³=−3(x₁+x₂). θ³+3θ+3=0: (1,θ) satisfies 1=1 and θ³=−3−3θ; v₀(θ)=1/3. Transpose would need 1=1+θ. | Pass. |
| §1.3 bijection, precision | p=3,r=1,e=2: n>re/(p−1)=1, so n=2 admitted, n=1 not. Roots π, −π differ by 2π of value 1/2, distinct under the strict cutoff, equal under v≥1/2. | Pass. |
| §1.5 iff, both directions | d=0: #J=1=p⁰ for every E and L=K. Weight-one unit at p=3: #J(ℚ₃)=1<3, L=ℚ₃(π)⊄ℚ₃; #J(L)=3 and any E⊇L still 3. | Pass. |
| §1.6 threshold and obstruction | c=1+1/2=3/2; m=2 admitted, m=3/2 not. L=ℚ₃(π)→ℤ₃/{v≥2}=ℤ/9 would need x²+3≡0 (9); x²+3 for x=0..8 is 3,4,7,3,1,1,3,7,4. | Pass. |
| §1.7 strict different | p=7,r=3: shifted bound 3/2, Serre bound 1/2. ℚ₃(ζ₃): u=1, ι=1/2, v₀(𝔇)=1/2<3/2. FFG §R07.6.2 (head 34f4657, `README.md:8179`): v_K(𝔇)=u−i with i=sup_{g≠1}i(g)>0 when ramified; its Check gives u(ℚₚ(ζ_{pⁿ}))=n, v(𝔇)=n−1/(p−1). Unrefined (ii) of §R07.6.3 gives only u≤c+1/e (c=3/2,e=2: u≤2). | Pass; the refinement is the declared gap. |
| §1.8 killed-p boundary | ℤ/3(1): different 1/2<3/2. ℤ/9(1): ℚ₃(ζ₉), e=6, v_L(𝔇)=9, v₀=3/2, equality: excluded as not killed by 3. | Pass. |
| §2.1 category | ℤ/49 trivial: 49 elements, 7·1≠0, admitted. 𝔽₇(i) scalars at tame value 3: 1,3,2,6 for i=0..3; i=4 gives 4, weight 4∉[0,3]. | Pass. |
| §2.2 step on general G, R | S₃ on ℚ³, χ=1: step₀(0)=ℚ(1,1,1) dim 1, step₀(top)=top dim 3; ℚ(1,0,0) not stable ((12) sends it to ℚ(0,1,0)). ℤ/25, C₅ by 6: powers 1,6,11,16 distinct units, yet (6−16)=−10 has kernel 5ℤ/25 of 5 elements. | Pass; field hypothesis of the pure-line Check is needed and stated. |
| §2.2 orientation | C₇⋊C₆, ρ(t)=diag(6,1), ρ(w)=((1,1),(0,1)): ρ(t)ρ(w)ρ(t)⁻¹=((1,6),(0,1))=ρ(w)⁶ (consistent with w↦w⁶). χ(t)=3: 3³=27≡6, so ⟨e₁⟩ is a χ³-line; quotient trivial; invariants 0. Order 3,2,1,0: dims (1,1,1,2); order 0,1,2,3: (0,0,0,1). | Pass; reversed order fails to exhaust. |
| §2.3 trivial endpoints | ℤ/49 trivial with sub 7ℤ/49: conclusion holds, group does not split. New Check: a(g)=(χ₇(g)⁶−1)/7 mod 7 is additive since χ₇⁶≡1 (7); χ₇(g)=8 mod 49 gives (8⁶−1)/7=37449≡6 (7); order-7 transvection, ramified at 7, so the middle term is outside C₇[0,3] by gap:fl-weight-zero-unramified. | Pass. |
| §2.4 (R01) | 42·6=252≤287<294=42·7 ⇒ n″≤6; Sylow count divides n″≤6 and ≡1 (7) ⇒ 1. Poitou at n=11, b=17/4: I₁=1.228965, bound 7.00114; at n=10: 6.57608; at n=12: 7.37628. Row (b) as declared: 6.93. Tame Galois F with inertia order e: rd=7^{1−1/e}; e≤36 ⇒ ≤7^{35/36}=6.6317; e≤143 ⇒ ≤7^{142/143}=6.9054; both <6.93. Normal 7-subgroup on simple 𝔽₇-module: `Representation.invariants_ne_bot_of_isPGroup` (`TauCeti/RepresentationTheory/Unipotent/PowerOrder.lean:158`, needs `[Nontrivial V]`, finite dimension, exponential characteristic p) plus normality gives the whole module. | Mathematics passes; R01 makes the degree-ten step rest on the declared row. |
| §2.5 orientation and differents | FL basis change: sub weight i₁, quotient weight i₂; e₂′=e₂+ce₁ is filtered only if i₁≥i₂, and then φ_{i₂}(e₁)=0 for i₁>i₂ (killed by p), so c=μ/λ splits; for i₁<i₂ no change is possible. Contravariance: MF sub ↔ Galois quotient, so Galois quotient weight i > sub weight j splits locally: exactly gap:fl-oriented-mod-p-splitting (0≤j<i). Twist a=j−i∈{1,2,3}: Serre break b/6≤a/6 ⇒ b≤a; θ_b(στσ⁻¹)=θ₀(σ)^bθ_b(τ) (LocalFieldsRamification Layer 3, `README.md:833`) against conjugation by χᵃ on the cocycle ⇒ b≡a (6) ⇒ b=a. d(F/ℚ)=6(a+1)+7·5=41+6a; e=42, f=1; 7^{47/42}=8.8248, 7^{53/42}=11.6529 (<12, contradiction with degree 42≥36), 7^{59/42}=15.3873 (>12, no contradiction). Unramified relative case: 7^{35/42}=7^{5/6}=5.0611<5.72 with degree 42>8. | Pass; exception exactly (i,j)=(0,3). |
| §2.6 decomposition | ℤ/49(1): g₁U has 49 elements, 7U≠0. 𝔽₇(1)⊕𝔽₇(2): orders 7,7, sum 49. Nonsplit χ³-by-trivial: trivial quotient of dim 1, invariants 0, so no direct sum; excluded by hypothesis. Unramified ratio λ: kernel field unramified at all finite primes is ℚ (SRAVBC §1.4 / Mathlib `NumberField.finrank_eq_one_of_unramified`, listed at SRAVBC `README.md:181`). | Pass. |
| §2.7 exhaustion | Induction step: U′ᵢ⊆Uᵢ by monotonicity of step from U′₄=0=U₄; G trivial on U/U′₁ by Lemma 1 (middle term a quotient of U, hence in the category) ⇒ U=U₀. ℤ/49(2): orders (1,1,49,49,49). Nonsplit χ³-by-trivial: dims (0,1,1,1,2). | Pass. |
| §2.8 rational filtration | The step filtration is canonical, so no choice of finite-level data is needed: Tᵢ=lim (T/7ⁿ)ᵢ is the intersection of preimages, satisfies Tᵢ=stepᵢ(Tᵢ₊₁), is saturated by induction from T₄=0, and Vᵢ=Tᵢ[1/7]; V₀=V from (T/7ⁿ)₀=T/7ⁿ. ℚ₇(1)⊕ℚ₇(2): dims (0,0,1,2,2). | Pass. The route's compactness remark is unnecessary but harmless. |
| §3.1 zero or Tate | q=2 dual grades have moduli 2⁰,2⁻¹,2⁻²,2⁻³; m=1 needs 2^{−1/2}=0.7071, m=3 needs 2^{−3/2}=0.3536: none. m=2: only i=1, so V₁=V, V₂=0: scalar action, not only semisimplification. Jordan block ((2,1),(0,2)) is pure but not scalar: excluded by the exhaustive single grade. | Pass. |
| §3.2 headline (`lowDegreeHodgeVanishing`) | Off-diagonal pairs with i+j≤3: (1,0),(0,1),(2,0),(0,2),(3,0),(0,3),(2,1),(1,2): eight. ℙ¹: h¹¹=1 at (1,1), excluded by i≠j. ℙ²: h²²=1 at total degree 4, outside. Empty X: all groups trivial. m=2: (C₇(i)⊗ℚ₇(−1))^G=0 unless i=1. | Pass; conclusion is `Subsingleton`, not a finrank on an unknown-dimensional space. |
| §3.3 integral models | Spec ℤ: h⁰⁰=1. ℙ¹_ℤ: h¹¹=1, others 0. y²=x³−x: ℤ₃-model exists, ℤ₂-model does not. | Pass. |
| §4.1–4.2 K3 headline (`geometricK3_hasBadWittPrime`) | Ω²≅O and geometric integrality give H⁰(X_ℚ̄,Ω²)≅H⁰(O)=ℚ̄, dimension 1; flat base change gives dim_ℚ H⁰(X,Ω²)=1 versus 0 at (i,j)=(2,0) from everywhere Witt models: contradiction, so some prime p (possibly 2) lacks a model. Empty scheme fails `GeometricallyIntegral`; E×E has h¹(O)=2 and fails `Subsingleton H¹(O)`; ℙ² has canonical O(−3). The five conditions equal `IsK3` at the K3 head (14c5246). | Pass; no second K3 predicate declared. |
| §4.3 projective space | ℙ⁰: h⁰⁰=1 only; ℙ¹: h¹¹=1, h²⁰=0; ℙ²: h²²=1, h¹²=h²¹=0; i>n: Ωⁱ=0 so all Hʲ=0. | Pass. |
| Gap precision and minimality | Each of the eight slugs occurs in README and `plan.json` with identical `needs`. fl-oriented-mod-p-splitting: (i,j)=(1,0) admitted at p=3,r=1; (0,1) excluded; p=2 has no pair. fl-rank-one-inertia: n=2 at p=7 (ℤ/49(1), 7·1≠0) not covered by §R07.3.9, which is killed-p simple objects. fl-weight-zero-unramified: arbitrary rank and length, beyond §R07.3.9. pm-remove-inverse-e: §R07.6.3(ii) gives m>u−1/e only. witt-proper-smooth-comparison: PadicHodgeTheory §8.1 (head 4c4f1e8, `README.md:1383`) is for finite K/ℚₚ. completed-unramified-inertia: not in LocalFieldsRamification Layer 2 (main). | Seven precise and minimal; R02 tightens the eighth's wording. |

### Pinned declarations opened

Mathlib `6b7abb3c…`, Tau Ceti `a91d3aaf…` (from `lake-manifest.json`). `AlgebraicGeometry.Smooth` class at `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:59`, `SmoothOfRelativeDimension` at line 127, `IsProper` (extends `IsSeparated`, `UniversallyClosed`, `LocallyOfFiniteType`) at `Morphisms/Proper.lean:41`, `GeometricallyIntegral` at `Geometrically/Integral.lean:40`; `SheafOfModules.exteriorPower` at `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower.lean:49` (sheafified sectionwise exterior power); `Scheme.Modules.Cohomology` at `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:61` (an `abbrev` for the group Hⁱ(X,M)); `Representation.invariants_ne_bot_of_isPGroup` at `TauCeti/RepresentationTheory/Unipotent/PowerOrder.lean:158`; `TauCeti.Hodge.tate_piece` at `TauCeti/Geometry/Hodge/Tate/Basic.lean:111` (nonzero piece at (−m,−m)). Object greps for `FontaineLaffaille`, `IsCrystalline`/`D_cris` and étale cohomology carriers in both pinned trees: no hits, so the Layer 1–3 headlines are correctly declared unstatable. `HasGoodReduction` exists only for Weierstrass curves (`TauCeti/AlgebraicGeometry/EllipticCurve/LocalPolynomial.lean`), not for schemes over Witt rings: the model predicates are not duplicates.

### Cross-roadmap citations resolved

All at the heads the brief gives: SmallRamificationAndAbelianVarietyBaseCases d6e456e (§1.1 line 283, §1.4 line 430, §1.7 line 522, §1.9 line 624 with rows (b),(d),(f) at 634–638 and the n≥36⇒rd>12 statement in §1.7); FiniteFlatGroupsAndIntegralPadicHodgeTheory 34f4657 (R07.3.4 line 4709 with the generating/ambient distinction and the zero-Frobenius Check, R07.3.5 4757, R07.3.6 4785, R07.3.7 4827, R07.3.9 4885, R07.3.10 4912, R07.3.12 4978, R07.3.15 5074, R07.3.17 5146, R07.6.1a 8123, R07.6.2 8179, R07.6.3 8224, R07.6.5 8312); K3SurfacesAndSymplecticBoundedness 14c5246 (§1.1 line 257, §1.2 286, §1.3 300, §1.4 318, §2.4 441; `Suggested.lean:88` `IsK3`); CrystallineCohomology 013a921 (§CR.3.5 line 3116, formula at 3345–3347); PadicHodgeTheory 4c4f1e8 (§0.1 115, §0.4 193, §3.2–3.5 660–748, §5.5 1076, §8.1 1383); DeligneWeightsAndPurity 6c2402d (§0.8 917, §0.9 929, §7.15 2679); ArithmeticGaloisRepresentations bef111d (§1.1 671, §1.2 769, §1.3 879, §1.6 992, §1.9 1106, §2.2 1573); on main: LocalFieldsRamification Layers 2–3 (lines 561, 705, action formula at 833), EtaleCohomologyFoundations F.2.1 504, F.2.2 522, F.3a 776, F.4.0 850, F.4.1 959, F.4.5 1041, F.4.6 1089, SchemeAndStackFoundations §0.9 848, §0.11 938, §2.6 3437, §2.20 4275, §3.3 4713, §4.8–4.10 5383–5487, EllipticCurves Layer 4 at 793 with NOS at 851 and potential good reduction at 820. The citation resolver reported nothing missing. Ownership: `roadmaps grep` over all open roadmap pull requests and main for the four Lean names returns no match; grep for Fontaine's theorem, "everywhere-good-reduction" and Witt-ring scheme models finds only the consumer EnriquesSurfacesAndIntegralNonexistence (head e030a1b, `README.md:99–100`), whose gap still routes to "PadicHodgeTheory, Part II §everywhere-good-reduction"; the local board package PadicHodgeTheoryPartII holds only reports and FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII's design does not plan Fontaine's higher-weight theorem. This roadmap is the owner of the endpoint; the consumer's routing is a board matter, not a defect here.

### Shape

Headings and order as upstream; Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, nine roadmaps), How to read the build, Layers 0–4 each with Examples and Dependencies, Downstream consumers, Worked examples, References. Every target has a locator and a `*Needs:*` line; every definition has an API list and ≥3 Checks (counts above). Lean names in the README: four, all declared.

## Not verifiable

- The eight declared supplier contracts are future library work; their statements were checked for precision and minimality, not proved.
- Fontaine93 displays damaged by OCR (lines 110–118, 203, 225, 232, 390) were read through the surrounding text and the restatements on pp. 1 and 3; the previous review's remarks on lines 212–213, 238–239 and 410–411 were not re-verified from the garbled lines and are not repeated below.
- The Enriques consumer's routing of its gap to a different supplier was observed, not resolved; no consumer file is in scope.
- Successful elaboration with `sorry` certifies statability, not truth; the adversarial rows above are instance computations.

## Source issues

- **Misprint** in Fontaine93 at the plan of the letter, printed p. 4 (line 125): the source says §3 proves Theorem 1; it should be Theorem 2, as §3's heading at line 284 confirms; affects nothing.
- **Misprint** in Fontaine93 at §3.6, printed p. 10 (line 361): the source says the notation is that of Theorem 1; it should be Theorem 2, which introduces K, r and M; affects nothing.
- **Misprint** in Fontaine93 at §3.7, proof of Lemma 4, printed p. 11 (lines 379–381): the source takes e and the uniformizer a for E; they should be those of L, since a is then reduced in A_L and its Eisenstein polynomial is evaluated at a lift in E; affects the proof.
- **Misprint** in Schroeer23 at Proposition 5.5 proof, printed p. 16 (line 686): the source calls W(F₂^sep) the maximal unramified extension of ℤ₂; it is the completion of that extension; affects nothing.

## Conditional gaps

witt-proper-smooth-comparison, fl-acris-truncation, fl-weight-zero-unramified, fl-rank-one-inertia, fl-oriented-mod-p-splitting, pm-remove-inverse-e, finite-torsion-kernel-dictionary, completed-unramified-inertia.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a92beafda684fd68962e782799b4fb2d14f612a8", "job": "REV-PKG-SmallRamificationAndAbelianVarietyBaseCasesPartII~2", "model": "fable", "worker": "chris-i"} -->
