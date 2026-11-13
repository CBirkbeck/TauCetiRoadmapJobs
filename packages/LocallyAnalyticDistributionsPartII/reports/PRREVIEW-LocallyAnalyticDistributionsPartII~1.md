# Review of LocallyAnalyticDistributionsPartII (pull request #2283 at d3a9192)

**Verdict:** needs changes

## R01 (P2) — §1.5 proves again the Fréchet–Stein theorem that PadicLocalLanglandsForGL2Qp §0.1 owns

**Location:** `TauCetiRoadmap/LocallyAnalyticDistributionsPartII/README.md` lines 222–223 (§1.5, third and fourth "Prove" bullets): "the transition map D_r(H, K) → `D_{r′}(H, K)` is flat on both sides … present D(H, K) as a two-sided Fréchet–Stein algebra".

**Claim:** Noetherianity of the stages at r ∈ p^ℚ, flatness of the transitions and the Fréchet–Stein property of D(H, K) are targets of the supplier; line 20 of this README says they are left to it and not restated.

**Witness:** PadicLocalLanglandsForGL2Qp (#1312) README §0.1, fourth paragraph: "prove that `D(H,L)` is Fréchet–Stein, with noetherian Banach radius algebras and flat transitions", with ST03 Remark 4.6 and Theorems 4.9–4.11 as its sources.

**Repair:** In §1.5 keep as targets the expansion, the norms, D_r versus `D_{<r}`, the graded rings, multiplicativity and `D_{1/p}`. Replace the noetherianity clause of the third bullet and the fourth bullet by: "By PadicLocalLanglandsForGL2Qp §0.1, D(H, K) is Fréchet–Stein with noetherian Banach radius algebras and flat transitions. Prove the comparison: for H satisfying (HYP), the radius algebras of §0.1 at r ∈ p^ℚ ∩ (1/p, 1) are the completions D_r(H, K) for the coordinate norms ‖·‖_r, so the coadmissible modules of §1.4 for this sequence are those of §0.1; and prove the statements for the opposite algebras (right noetherian, flat as a left module), which make the presentation two-sided." Move ST03 Theorems 4.5(ii), 4.9, 4.10 from "Prove" to the supplier contract of §0.1.

## R02 (P2) — §1.4 is narrower than its source, and the general Fréchet–Stein interface has a second owner

**Location:** README line 198 (§1.4): "Let K be a complete discretely valued field (Conventions, item 1) and A a K-Fréchet algebra, not necessarily commutative"; line 12: "Fréchet–Stein algebras over a complete discretely valued field".

**Claim:** The source proves every statement of §1.4 over any complete nonarchimedean field. The restriction leaves the general notion to be stated a second time by a later roadmap.

**Witness:** ST03 line 138 (p. 4): K is any field complete for a non-trivial nonarchimedean absolute value; discreteness starts at ST03 line 553 (§4). RelativeFarguesFontainePartII (#1825) README line 1763 constructs the same interface "over any complete nontrivially valued nonarchimedean field K"; merge order 349 against 200.

**Repair:** Line 198: "Let K be a field complete for a nontrivial nonarchimedean absolute value, not necessarily discretely valued (the standing assumption of Schneider–Teitelbaum 2003, §3, p. 4), and A a K-Fréchet algebra, not necessarily commutative." Line 12: "Fréchet–Stein algebras over a complete nonarchimedean field". The three Checks of §1.4 (A = K; K[ε]/(ε²); 𝒪(B°) over ℚ_p(√p)) use no discreteness and stand unchanged. §1.4 is then the single owner that RelativeFarguesFontainePartII §8.4 cites.

## R03 (P3) — the crossed product R[[G]] = `R[[G^{p^n}]]` ∗ H_n for an infinite residue field is asserted in a dependency line

**Location:** README line 466 (§3.8, *Needs:*): "for an unramified R with infinite residue field the decomposition of R[[G]] as a free `R[[G^{p^n}]]`-module … by the argument of step 1 of the proof of §0.3, which applies verbatim".

**Claim:** §3.8 (U_n ∗ H_n, (P), (a)) uses this decomposition; it is no target, has no locator, and rests on a step inside a supplier's proof, not on a supplier statement.

**Witness:** NoncommutativeAndEquivariantIwasawa (#1307) §0.3 gives freeness for ℤ_p[[H]] and, through O ⊗ Λ(H) ≅ O[[H]], for O finite free over ℤ_p. For R = W(𝔽̄_p) that comparison fails (this README, §3.2, third Check).

**Repair:** Add to §3.2 the target: "For every open normal subgroup N of G, R[[G]] is free as a left and as a right R[[N]]-module on any set of coset representatives of G/N, and is the crossed product R[[N]] ∗ (G/N), for every unramified R with finite or infinite residue field: the decompositions R[G/U] = ⊕_γ γ·R[N/U], for U ⊆ N open normal in G, are compatible in U and pass to the inverse limit (Ardakov–Wadsley 2013, §10.6, proof of the Proposition (b), (c), p. 72)." In line 466 replace the parenthesis by "§3.2 (the crossed product over an open normal subgroup)".

## R04 (P3) — §3.8 and §4.13 define objects without a Checks list

**Location:** README line 453 (§3.8): "define the Lie modules as the objects of ℳ obtained from finite-dimensional U₀-modules … and the Artin modules as those on which an open subgroup of G acts trivially"; line 671 (§4.13): "V̂^λ = … the affinoid Verma module".

**Claim:** Each defining section needs a `**Checks.**` list of at least three discriminating tests; these two have none.

**Witness:** Lines 453–466 and 669–677 contain no `**Checks.**` heading; the fourteen other defining sections each have three or more.

**Repair:** §3.8, add: (1) the trivial module K is a Lie module and an Artin module; (2) for G₁ and Sym²(ℚ_p²), exp(pe) sends y² to y² + 2p·xy + p²·x², and its p^n-th power exp(`p^{n+1}`e) is never the identity: a simple Lie module that is not Artin; (3) the character Check now closing §3.9 (Artin, not Lie); (4) for G = ℤ_p, K[[G]]/((γ − 1)²) is not semisimple. §4.13, add: (1) for sl₂, n = 0 and λ(h) = a ∈ R, V̂^a = {Σ c_j f^j v : c_j → 0} with h·f^j v = (a − 2j) f^j v and e·f^j v = j(a − j + 1) `f^{j−1}` v, and Δ acts on f v by ½(a − 2)² + (a − 2) + 2a = ½a(a + 2); (2) for a = k ∈ ℕ, e·`f^{k+1}` v = (k + 1)(k − k) f^k v = 0, so `f^{k+1}` v generates a proper closed submodule with quotient Sym^k of dimension k + 1, while Σ p^j f^j v lies in V̂^k and not in the algebraic Verma module; (3) the paragraph "The index matters" as a Check.

## R05 (P3) — wrong page for Fu's equation (16)

**Location:** README line 754 (Source corrections, item 1): "Fu, §4, equation (16), p. 14 (arXiv v2)".

**Claim:** Equation (16) is on p. 13.

**Witness:** FU24 line 675 carries the tag (16); the page-14 marker is FU24 line 676, and p. 14 opens with Theorem 4.2.

**Repair:** "Fu, §4, equation (16), p. 13 (arXiv v2)".

## R06 (P3) — two works cited directly are missing from the References

**Location:** README line 104: "(Ardakov–Wadsley 2013, §10.2, p. 68; Dixon–du Sautoy–Mann–Segal, Theorem 4.30)"; line 184: "The crossed product is that of McConnell–Robson §1.5.8".

**Claim:** Both are cited for a statement in their own right, and neither has an entry under `## References` (lines 768–780).

**Witness:** `## References` lists eleven works; "Dixon" and "McConnell" occur in none of the entries.

**Repair:** Add: "- **Dixon–du Sautoy–Mann–Segal.** J. D. Dixon, M. P. F. du Sautoy, A. Mann and D. Segal, *Analytic pro-p groups*, second edition, Cambridge Studies in Advanced Mathematics 61, Cambridge University Press, 1999; cited by numbered statement." and "- **McConnell–Robson.** J. C. McConnell and J. C. Robson, *Noncommutative Noetherian rings*, revised edition, Graduate Studies in Mathematics 30, American Mathematical Society, 2001; §1.5.8."

## R07 (P3) — the description's "It builds on:" names nothing

**Location:** Pull request description, first paragraph: "It relates Iwasawa algebras of compact p-adic Lie groups to completed enveloping algebras. It builds on:".

**Claim:** The sentence ends at the colon. The direct suppliers are not stated; the next paragraph lists 24 pull requests, most of them indirect.

**Witness:** The README's supplier contracts (lines 53–89) name nine roadmaps; the description names none of the five on main and does not separate the four direct open suppliers from the other twenty.

**Repair:** "It builds on PadicLocalLanglandsForGL2Qp §0.1, NoncommutativeAndEquivariantIwasawa Layer 0, LocallyAnalyticDistributions §§0.0–0.3 and DeformationAndDerivedPatchingAlgebra §1.10 (open pull requests), and on PadicFunctionalAnalysis §§4.4 and 4.7, PadicMeasuresIwasawaAlgebras, LieHighestWeight §9.2, ReductiveGroups §9B.1 and Layer 9D, and ReductiveGroupsPartII RG2.0.2 (on main)."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.2 first congruence subgroups | p = 3, 5, 2 | p(p² − 1) = 24, 120; rows (1,p),(0,1) in G₁, rows (1,1),(0,1) not; −I ≡ I mod 2 | holds | none |
| §0.3 Lie lattice of G₁ | p odd | [pe, pf] = p²h ∈ pL ∖ p²L; successive indices p³; FU24 lines 598–601, 941–945 | holds | none |
| §1.2 one-sided bases | S₃, H = ⟨(12)⟩ | H(23) = H(123) = {(23), (123)}; left span of δ₁, δ₍₂₃₎, δ₍₁₂₃₎ has dimension 4 < 6 | holds | none |
| §1.3 centrality of Z(g) | O(2), SO(2) | Ad(s)x = −x gives δ_s x̃ δ_s⁻¹ = −x̃; ST02 lines 635–644 state connected 𝔾 | holds | none |
| §1.4 Fréchet–Stein algebras | K; K[ε]/(ε²); 𝒪(B°) over ℚ_p(√p) | K ⊗_A (Aε → A) is the zero map K → K; q₁(T/a) = `p^{−1/2}` < 1; ST03 line 138: any complete K | narrower than source | R02 |
| §1.5 radius algebras | ℤ_p at `p^{−1/p}`; SL₂(ℤ₃) | ‖T^p/p‖ = p·p⁻¹ = 1; `|p^{−j}|·r^{pj}` = 1, bounded not null; ω(−I) = ω(−I) + 1 impossible | holds; second owner | R01 |
| §2.3 Frommer's theorem | r₁; r < `p^{−1/(p−1)}` | terms `p^{k − p^{k−1}}`: p^{−1/p}, 1, `p^{2−p}`, so ℓ = p; r^p·p < r, so ℓ = 1; KOH07 lines 665–699 | holds | none |
| §2.4 crossed product at r_n | k = n − 1, n, n + 1; p = 2 | `p^{n−1−1/p}`, `p^{n−1}`, `p^{n+1−p}` ≤ `p^{n−2}`; `p^{−k+v_p(k!)}` ≤ `p^{−k(p−2)/(p−1)}`; at p = 2, 2¹ = 1 + 1 ties | holds for p odd | none |
| §2.5 Arens–Michael envelope | E = ℚ₃, j = 1; exp(x) | unit ball |a_n| ≤ `3^{−|n|}` = span of (3x)^n; |1/n!|·r^n = `p^{−s_p(n)/(p−1)}` at r = `p^{−1/(p−1)}`, not null | holds | none |
| §3.3 Ore set S₀ | G = 1, R = ℤ₃; ℤ_p[[b]]; ℤ_p[√p] | S₀ = ⋃ 3^a(1 + 3ℤ₃), 2 ∉ S₀; p + b² ∈ S₀, b + p² ∉ S₀; 0 = p − p ∈ p + m² | holds | none |
| §3.4 microlocalisation | G = ℤ_p, p odd; p = 2 | b ↦ exp(pu) − 1 = pu·unit, target ℚ_p⟨u⟩; v₂(2^k/k!) = s₂(k) = 1 at k = 2^j, so exp(2u) diverges | holds for p odd | none |
| §3.6 ramified coefficients | ℚ₃(√3), G = ℤ₃ | ‖b/3‖ = 1 in K⟨u⟩, `3^{1/2}` in K⟨b/π⟩; |c_n|·`3^{n/2}` = `3^{n/2 − ⌈n/4⌉}` → ∞; R = R′ ⊕ R′π | holds | none |
| §3.7 microlocalised modules | M = ℚ_p[[b]]/((1 + b)^p − 1) | image p²u·v, ‖v − 1‖ ≤ `p^{−2+v_p(2)}` < 1; M̂ = ℚ_p⟨u⟩/(u), dimension 1 against p | holds | none |
| §3.8 PGL₃ example | p = 3 | [q, E₁₃] = (1/3 + 2/3)E₁₃; det q = −2/27; 1 − 3q = diag(0, 0, 3); 3X − tr(X)·I ∈ sl₃(ℤ₃) | holds | none |
| §3.8 crossed product input | R = W(𝔽̄_p) | Σ [x_n] b^n ∉ R ⊗ ℤ_p[[G]]; supplier §0.3 covers O finite free only | unowned step | R03 |
| §4.2 induced characters | sl₂; p = 3, 5, 7; SL₃ | HC(Δ) = ½h² + h, 2λ + 1 = (c + 1)²; 3 nonsquare at 3 and 5; 7 square at 3, not at 7; −6 against 6 | holds | none |
| §4.5 density and antipode | torus 1 + 3ℤ₃, f(g) = g | x·f = −f; x·(f ∘ inv) = +f ∘ inv; (x̃ + δ₁)(f) = 2, (x̃ − δ₁)(f) = 0 | holds | none |
| §4.7 symbols | r′ ∈ (1/p, `p^{−1/2}`); r_n | p⁻¹r′ < r′², p⁻² < r′²; at r_n norms `p^{2n−2}` > `p^{n−2}`, symbol `p^{−2n}(½H² + 2EF)^{p^n}` | holds | none |
| §4.9 Frobenius pairing | ℚ[u]/(u² − 2), C₂ | α(f) = u/2; β(u/2)(u) = pr₁(1) = 1; without the cocycle 1/2 | holds | none |
| §4.10 normal form | weight ρ = p^n | ‖e‖ = p·`p^{n−1}`; h² = 2(Δ − λ) + 2λ + 2h − 4ef has weights ρ², ≤ 1, ρ, ρ² | holds | none |
| §4.11 direct route | m = 1 | rank of `D_{r_n}` over `U_{r_n}` = `p^{3n}` = [G₁ : `G₁^{p^n}`]; (i) and (ii) carry the domain hypothesis | holds as stated | none |
| §4.13 affinoid Verma modules | sl₂, a = k; π² = 3, n = 1 | e·`f^{k+1}`v = (k + 1)·0; Δ·fv = ½a(a + 2)·fv; ‖3h‖ = |π| in `Û(b⁺)_{1,K}`, 1 in `Û(b⁺)_{2,K}` | holds; no Checks | R04 |
| §4.14 Fu's injectivity theorem (headline) | p = 3, λ = 1 | a = −1 + √3, a(a + 2)/2 = (3 − 1)/2 = 1; Δv = (½a² − a + 2a)v; FU24 lines 163–164 | holds; not statable | none |
| §5.1 algebraic functions | n = 0…3; {±I} | (n + 1)(6n + 6)/6 = 1, 4, 9, 16; x − w vanishes on ±I | holds | none |
| `isSemisimpleModule_of_finiteDimensional` (headline) | m = 0; G = ℤ_p | algebra is ℚ_p; K[[ℤ_p]]/((γ − 1)²) nonsplit, so semisimplicity of 𝔤 is used; AW13 lines 3705–3706 | holds | none |
| `exists_surjective_algHom_end_symPower` (headline) | m = 0; k = (1) | End_K(K) = K; dim End(K²) = 4; (g₁⁻¹g)₁₁ = g₁₁ for lower unipotent g₁, (gn)₁₁ = g₁₁ for upper unipotent n | holds | none |

- Source locators checked against the texts: about 100 (FU24 32, AW13 22, ST03 20, BCGP25 6, AW14 5, SCHM13 5, ST02 4, KOH07 4, AB07 2); one wrong (R05). All fifteen sampled targets are covered.
- Library declarations: 79 backticked names resolved at the pins; opened `TauCeti.completedGroupAlgebra` (`CompletedGroupAlgebra/Basic.lean:145`), `TauCeti.symPowerRep` (`SymmetricPower.lean:57`), `TauCeti.casimirElement` (`Casimir.lean:125`, `:175`), `TauCeti.exists_isCompl_of_isKilling` (`CompleteReducibility.lean:259`), `Subalgebra.centralizer_range_includeRight_eq_center_tensorProduct` (`Centralizer.lean:170`), `AdicCompletion` ring instance (`AdicCompletion/Algebra.lean:40`, `:97`, commutative only).
- Cross-roadmap citations resolved: 24 sections or targets in 9 roadmaps (4 at open heads, 5 on main); all exist and state what is assumed of them.
- Gate: every check passed. Dependency check: `depcheck: 238 roadmaps, 2162 edges, 0 problem(s)`. No change outside the folder.
- Elaboration: `sorry` the only warning (lines 79 and 99). `#check` types of the 4 declarations match the README; no binder lost. One-tactic probes (`simp`, `rfl`, `infer_instance`, `exact?`) close neither theorem; no padding.
- In `exists_surjective_algHom_end_symPower`, `hp` and `[FiniteDimensional ℚ_[p] K]` are not needed for truth (an open subgroup is Zariski dense at every p); the README has the same hypotheses, so no change is asked.
- Declared gaps `frechet-stein-general` and `radius-algebras`: the head cites neither slug; §§1.4–1.5 state their content here (R01, R02).
- Overlap check: read LocallyAnalyticDistributions, LieHighestWeight, CompletedCohomologyPartII, CompletedCohomologyAndLocalGlobalCompatibilityPartII, PadicFamiliesPartII; nothing shared with these (PadicFamiliesPartII imports §2.5). Shared outside the lists: the Fréchet–Stein property of D(H, L), owner PadicLocalLanglandsForGL2Qp §0.1 (R01); the general Fréchet–Stein interface, owner this roadmap §1.4, also stated by RelativeFarguesFontainePartII §8.4 (R02).

Source independence: 14 passages compared with 8 sources, none shared beyond formula-forced clauses of at most 7 words (AW13 line 3655, the definition of Lie modules); largest share FU24, 44 of 135 locators; contents compared with FU24: independent (Layers 3–5 meet its §§4–6 in an order forced by the *Needs:* lines of §§3.10, 4.11 and 5.2, each with a wider scope, and its Proposition 5.3 and Lemma 5.6 sit in Layers 2 and 0).

## Not verifiable

- SCH11 (uncertified): Theorem 28.3, p. 199; Corollary 31.7, p. 229; Theorem 32.1, p. 232. Cited by locator only.
- FROM03, DDMS99, MR01, DG70 (waived): Frommer's orthogonality lemma is read only through KOH07 lines 662–699; DDMS Theorem 4.30, Lemma 4.10 and Chapter 9, Exercise 9, McConnell–Robson §1.5.8 and Demazure–Gabriel II §6.1.5 not read.
- Lazard, Bourbaki and Li–Van Oystaeyen are cited only through the sources that cite them; not read.
- Ownership against LocallyAnalyticRepresentationsOfLocalGroups (named as a consumer; no checkout supplied) was not checked.
- README Source corrections items 5, 8, 10 and 12 were not recomputed against the texts in full.

## Source issues

- **Error** in AW13 at §10.4, proof of the Theorem, p. 70: the source says exp(u) converges in Û(h)_K for every u in L_G, for every prime; it should be restricted to odd p, since for G = ℤ₂ the coefficients 2^k/k! have valuation 1 at k = 2^j; affects the proof.
- **Error** in FU24 at §4, equation (16), p. 13: the source says the completion D_r(G, K) consists of the series with bounded |λ_α|·r^|α|; it should be those with |λ_α|·r^|α| tending to zero; affects nothing.
- **Gap** in FU24 at Theorem 4.2, p. 14: the source says D_r(G, K) is noetherian for every real r in [1/p, 1); it should be for r in p^ℚ and r = 1/p, which is what ST03 Theorem 4.5 and Remark 4.6 prove; affects a stated result.
- **Error** in FU24 at §4, equation (17), p. 14: the source says the set ⋃(p^a + m^(a+1)) is formed over the integers of any finite extension of ℚ_p; it should be over an unramified ring, since otherwise it contains 0; affects a stated result.
- **Error** in FU24 at Theorem 5.7, p. 20: the source says the central quotient of D_r is an integral domain for every character; it should require an integral parameter, since the proof's first branch gives the zero ring; affects a stated result.
- **Error** in FU24 at Remark 5.8, second bullet, p. 21: the source says a character is induced exactly when its parameter has valuation at least 2; it should be only the forward implication (at p = 3, parameter 1 fails); affects nothing.
- **Misprint** in FU24 at §6, p. 22: the source says x^k is right invariant under a "lower upper" triangular nilpotent subgroup; it should be the upper triangular unipotent subgroup; affects nothing.
- **Error** in AW14 at §5.2, proof of the Lemma, p. 14: the source says D_(1/p)(G, K) consists of the series whose weighted coefficients are bounded; it should be those tending to zero; affects nothing.
- **Error** in AB07 at §5.4, proof of the Lemma, p. 17: the source says the inverse map sends Σ r_g ḡ to the functional with value r_(h⁻¹) at h̄; it should include the twisting factor τ(h⁻¹, h); affects the proof.
- **Gap** in SCHM13 at the remark following Proposition 3.2.3, p. 6: the source says the single-norm completion is noetherian and flat under the envelope for every r > 1; it should be for r in p^ℚ, the radii its cited arguments treat; affects a stated result.

## For the human reviewers

- **Licence.** BCGP25 (arXiv:2502.20645v1, 2025) is an unpublished preprint; README §2.5 takes five locators from it, each paired with a locator in SCHM13 or ST02.
- **Licence.** Frommer's theorem (README §2.3) rests on an unpublished Münster preprint (FROM03, waived); the README states it from the published summary in KOH07, §1.4.
