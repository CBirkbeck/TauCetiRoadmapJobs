<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13169#issuecomment-6862666912 -->
Red team round 2 pass b (claude) of 4756c29

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) 2.5: the route for B ⊗̂ M stops before the statement

   **Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:624` (2.5): "For B ⊗̂ M, H^•_cont(G_n, B ⊗̂ M) = H^•_cont(G_n, B) ⊗̂ M because the cochain complex of B is strict, the cohomology of the unit ball being finitely generated over ℤ_p."

   **Claim:** This identity gives the strong LA-acyclicity of B ⊗̂_(ℚ_p) M.

   **Witness:** Strong acyclicity concerns H^i_cont(G_n, B ⊗̂ M ⊗̂ C^an(G_n, ℚ_p)). The coefficient B ⊗̂ C^an(G_n, ℚ_p) is not admissible: for B = C(G_0, E) its unit-ball H^0 is the unit ball of B^(G_n-an), of infinite rank. The step is PAN22 lines 590–598, taken as it stands.

   **Repair:** replace the proof route of 2.5 (the whole paragraph "The proof route: …") by:

   "The proof route. By 2.3 the statement does not depend on G_0; take G_0 uniform with an ordered basis that is a minimal generating set. Schikhof duality (PadicLocalLanglandsForGL2Qp §0.1) turns a surjection E[[G_0]]^d → B′ into a strict exact sequence 0 → B → P → C → 0 of admissible Banach representations of G_0 with P = C(G_0, E)^(⊕d). Restricted to G_n, P is a finite sum of copies of the coinduced module C(G_n, E), so by Shapiro's lemma its cohomology with coefficients twisted by C^an(G_n, ℚ_p) vanishes in positive degrees. By 2.4 (1), H¹_cont(G_n, B ⊗̂ C^an(G_n, ℚ_p)) is then the cokernel of P^(G_n-an) → C^(G_n-an), and the degree i + 1 group of B is the degree i group of C for i ≥ 1, compatibly with n. Degree one: a vector c ∈ C^(G_n-an) lies in C^((n+2)) (2.3 (v)); the Mahler stages are exact on admissible representations (2.3 (iv)), so c is the image of some x ∈ P^((n+2)), and x ∈ P^(G_(n+1)-an) (2.3 (v)); the class of c therefore vanishes at level n + 1. Higher degrees follow by induction on i, applied to all admissible representations at once, since C is admissible. For B ⊗̂_(ℚ_p) M write M ≅ c_0(I, ℚ_p) (ℚ_p is discretely valued), so that X ⊗̂ M = c_0(I, X) for a Banach space X. The functor c_0(I, −) commutes with kernels of continuous maps, hence with X ↦ X^(G_n-an), and it preserves surjectivity of an open surjection of Banach spaces, because a null family lifts to a null family. Apply it to 0 → B → P → C → 0: P ⊗̂ M = C(G_0, E ⊗̂ M)^(⊕d) is again coinduced, the degree-one argument applies to c_0(I, P^((n+2))) → c_0(I, C^((n+2))), and the induction is the same."

   Tested on the witness: no cohomology of B ⊗̂ C^an(G_n, ℚ_p) is tensored with M; only H^0 (a kernel) and an open surjection pass through c_0(I, −). For M = ℚ_p the route is the first part; for B = E trivial and M = c_0(ℕ, ℚ_p) it gives the last Check of 2.5 (P = C(G_0, E), C = P/E).

2. **F02** (P2) The proof routes of 2.4 and 2.5 follow Pan's proofs clause by clause

   **Location:** `README.md:610` (2.4): "strictness bounds the p-power torsion in the cohomology of the unit balls, so M^• ⊗̂ C^an(G_n, ℚ_p) stays exact; taking continuous G_n-cohomology and the colimit over n gives (1) …"; `README.md:624` (2.5), first six sentences.

   **Claim:** The routes are the roadmap's own wording.

   **Witness:** PAN22 lines 563–569 (2.4: five clauses, same order, words exchanged) and PAN22 lines 574–586 (2.5: ten clauses, same order; five consecutive words and three formulas shared in "the image of … in … contains …"). In 8.12, "varying w covers the target" repeats the wording of DING25 line 1688.

   **Repair:** 2.5 is rewritten in S01. Replace the route of 2.4 by:

   "The proof route. The monomials of the ordered-basis coordinates, scaled by p^(−n|k|), are an orthonormal basis of C^an(G_n, ℚ_p), so X ⊗̂_(ℚ_p) C^an(G_n, ℚ_p) = c_0(ℕ^d, X) for a Banach space X, and likewise C(G_n^j, X) = c_0(J_j, X) for the continuous cochains. A continuous surjection of Banach spaces is open (LocallyAnalyticDistributions §0.2, *Fréchet open mapping*), and null families lift through an open surjection; hence c_0(J, −) carries the given short exact sequence to a short exact sequence, the cochain complexes of the three twisted coefficient modules form a short exact sequence of complexes, and its long exact sequence, followed by the exact filtered colimit over n, is (1). For (2) and (3) cut M^• into the short exact sequences 0 → Z^q → M^q → B^(q+1) → 0 and 0 → B^q → Z^q → H^q(M^•) → 0, all strict by hypothesis, and apply (1) to each: induction on q, starting at the left end of the bounded complex, shows that every Z^q and B^q is LA-acyclic, so (−)^la is exact on both families of sequences, which is (2); (3) is the same bookkeeping for the resolution, with 'essentially zero' in place of 'zero' for the strong form."

   In 8.12 replace "every C(I, s_(i,σ)) is a C(w, s_(i,σ)) for some w, so varying w covers the target" by "each label I equals w⁻¹({1, …, i}) for some w (8.5), so the images of these maps for the different w together span the direct sum". Tested: 2.4 Check 3 (the non-strict x_n ↦ p^n x_n) fails the open-surjection hypothesis of the new route, as it must.

3. **F03** (P3) Statements that use a later target: 0.3 (v) ↔ 0.5, and "locally σ-analytic" before 10.1

   **Location:** `README.md:211` (0.3 (v)): "after 0.5, x acts as the distribution x̃ ∈ D_F(G, E) of 0.4 (iv)"; `README.md:479` (1.8): "the same holds for locally σ-analytic representations with D_σ(G, E)"; `README.md:927` (5.1 (vi)): "(10.1)"; `README.md:1223` (7.6): "the σ-analytic variant holds".

   **Claim:** Each target needs only what its *Needs* line lists.

   **Witness:** 0.5 *Needs* "0.2, 0.3, 0.4" (line 261) and already proves "that it extends the action of U(g ⊗_F E) of 0.3"; 0.3 (v) needs 0.5. "Locally σ-analytic" and D_σ(G, E) are first defined at line 1613 (10.1), whose *Needs* lists 1.8 and 5.1.

   **Repair:** (a) delete "(v) after 0.5, … quotient of 0.4 (vi)" from 0.3, the sentence "These steps use only the analytic charts; (v) is a later compatibility, proved from the integration formula of 0.5", and "0.4 (iv), (vi) and LocallyAnalyticDistributionsPartII §1.1 (for (v));" from its *Needs*; in 0.5 write "that x ∈ g acts as x̃ ∈ D_F(G, E) (0.4 (iv); for F = L the image of the ℚ_p-analytic x̃ under 0.4 (vi)), so that the module structure extends the action of U(g ⊗_F E) of 0.3". (b) Add to 0.2, after the definition: "For σ ∈ Σ_L a locally σ-analytic representation is a locally L-analytic representation for the E-structure σ : L → E; by 0.3 (iv) it is a locally ℚ_p-analytic representation on which g ⊗_(ℚ_p) E acts through g_σ. D_σ(G, E) is D_L(G, E) of 0.4 for this structure, a quotient of D(G, E) by 0.4 (vi)." In 10.1 replace the first definition by "Locally σ-analytic representations and D_σ(G, E) are those of 0.2 and 0.4"; in 5.1 (vi) replace "(10.1)" by "(0.2)". Tested on L = ℚ_p(√p), χ = σ(x)^k: g_τ acts by 0 (0.3 Check), so χ is locally σ-analytic under both wordings.

4. **F04** (P3) 2.3 (ii) and (v) use inputs that no *Needs* entry supplies

   **Location:** `README.md:584`: "(ii) composes the flat maps E[[H]] → D_(s_h)(H, E) → D_(<s_h)(H, E)" and "(v): by Amice's theorem a function on H is analytic on the cosets of G_n exactly when …"; *Needs* at `README.md:592`.

   **Claim:** Both flat maps and the fixed-radius form of Amice's theorem are available.

   **Witness:** LocallyAnalyticDistributionsPartII §1.5 (its README lines 216–224) defines D_(<r) and proves no flatness; the flatness of D_r → D_(<r) is ST03 line 910 (Lemma 4.8). The one-variable fixed-radius basis ⌊n/p^h⌋!·binom(x, n) is `TauCetiRoadmap/PadicFunctionalAnalysis/README.md:706` (§4.4), not cited.

   **Repair:** in the route write "(ii): E[[H]] → D(H, E) is flat (PadicLocalLanglandsForGL2Qp §0.1) and D(H, E) → D_(s_h)(H, E) is flat (LocallyAnalyticDistributionsPartII §1.4, flatness of the stages), s_h being a rational radius; the flatness of D_(s_h)(H, E) → D_(<s_h)(H, E) is proved here: after a finite extension of E the degree-zero graded map for ‖·‖_(s_h) is the inclusion k[u_1, …, u_d] → k[[u_1, …, u_d]], flat between noetherian rings, and flatness lifts through the complete filtrations (Schneider–Teitelbaum 2003, Lemma 4.8 and its proof, p. 23, with Propositions 1.1–1.2)" and "(v): for d = 1 the criterion is PadicFunctionalAnalysis §4.4 (the orthonormal basis ⌊k/p^n⌋!·binom(x, k) of the functions analytic on the cosets of p^nℤ_p, with coefficients in a Banach space); for d variables it is its completed tensor power, proved here". Add to *Needs*: "PadicLocalLanglandsForGL2Qp §0.1 (flatness of E[[H]] → D(H, E)); LocallyAnalyticDistributionsPartII §1.4 (flat stages); PadicFunctionalAnalysis §4.4". Tested on H = ℤ_p: E⟨T/s⟩ → bounded functions on the open disc of radius s, both principal ideal domains, torsion-free hence flat.

5. **F05** (P3) 4.2 (iii): the lifting step rests on a criterion no supplier states

   **Location:** `README.md:833`: "lifts uniquely to L_P in characteristic zero (Jantzen's lifting criterion, as recalled in the proof of Orlik–Strauch, Lemma 2.8)".

   **Claim:** The lifting of a finite-dimensional 𝔩_P-module with weights in X to L_P is supplied.

   **Witness:** 4.2 *Needs* (line 840) lists ReductiveGroups Layers 1, 2, 4, 7, 8; none states this criterion (grep of ReductiveGroups on main: no lifting criterion for (𝔤, T)-modules). OS15 lines 343–345 quote it from Jantzen.

   **Repair:** replace the clause by "is a direct sum of simple modules L_(𝔩_P)(μ) with μ ∈ X dominant for 𝔩_P (4.1 (ii)–(iii) for 𝔩_P, the centre of 𝔩_P lying in 𝔥 and so acting semisimply), and each L_(𝔩_P)(μ) is the differential of the simple algebraic L_P-module of highest weight μ (ReductiveGroups §10B; in characteristic zero the subspaces stable under a connected group and under its Lie algebra agree, ReductiveGroups Layer 2), which gives the algebraic action", and add "ReductiveGroups Layer 10, §10B" to the *Needs* of 4.2 and to the Layer 4 Dependencies. Tested on sl_2 with PGL_2: the standard module has weights ±ϖ ∉ X = 2ℤϖ, is not a sum of L(μ) with μ ∈ X, and does not lift (4.2 Check 3); with SL_2 it is L(ϖ) and lifts.

6. **F06** (P3) Lists and one Check out of step with the targets

   **Location and witness:**

   1. `README.md:245` (0.4 *Needs*) uses "Tau Ceti `Module.Basis.pbwBasis`"; the "From Tau Ceti" contracts (lines 60–65) and the Layer 0 Dependencies (line 345) do not list it. It exists at the pin: `TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Basis.lean:96`, namespace `Module.Basis`.
   2. `README.md:919` (Layer 4 Dependencies): "ReductiveGroups Layers 1, 4, 7 and 8"; 4.2 *Needs* (line 840) has "Layers 1, 2, 4, 7 and 8".
   3. `README.md:1188` (7.3 Check 2): "the relevant lower Verma module is simple". The module of 7.3 is U(g) ⊗_(U(b)) U for the upper b (Check 3, line 1189, writes it M(λ)).
   4. `README.md:559` (2.2 (ii)): "Emerton's memoir, Proposition 6.5.9" has no page; EM17 line 6696 is on p. 134.

   **Repair:** 1. add under "From Tau Ceti": "`Module.Basis.pbwBasis` (`TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Basis.lean`): the basis of ordered monomials of the universal enveloping algebra of a Lie algebra with a basis, used for the injectivity in 0.4 (iv)", and add the name to the Layer 0 Dependencies. 2. write "ReductiveGroups Layers 1, 2, 4, 7 and 8". 3. write "the Verma module U(g) ⊗_(U(b)) z^((0,2)) = M((0, 2)) is simple, since ⟨(0, 2) + ρ, α^∨⟩ = −1 is not a positive integer". 4. add ", p. 134". Tested: (0, 2) + ρ = (1/2, 3/2), pairing −1; for (1, 1) the pairing is 1 and M((1, 1)) is not simple, as Check 3 says.

Two P2 findings (S01, S02) and four P3 findings (S03–S06). All sixteen findings of round 1 are
repaired at this head, except 1a/F01, which was disputed and whose reason holds.

## Round 1 findings at this head

| Finding | State | Witness at 4756c29 (`packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md` unless said) |
|---|---|---|
| 1a/F01 (weak-null theorem as a headline) | disputed; the reason holds | `Suggested.lean:56–59`: "they are README targets, not headlines". The statement is CD14 line 1719 (Lemme IV.7), a textbook input; the Summary's headline list does not contain it. Not re-raised. |
| 1a/F02 (two gaps duplicated a supplier) | repaired | Line 77: "§1.4: for a Fréchet–Stein algebra A …", "§1.5: … Noetherianity is used only at these rational radii"; `design/plan.json` has seven gaps, the README the same seven slugs. Supplier head read: §1.4 and §1.5 exist there. |
| 1a/F03 (RG2.0.3) | repaired | Lines 99, 176, 345: "RG2.0.3 (*general-linear-points-homeomorphism*)"; ReductiveGroupsPartII on main has the target under RG2.0.3. |
| 1a/F04 (Hom_(P,g′) undefined) | repaired | Line 1250, 8.1 (v): "Hom_(P,g′)(T(L), E) := {ψ … : ψ − Σ_(j=1)^r ψ_j ∘ det_j ∈ Hom_sm(T(L), E) …}"; agrees with DING25 line 859; dimensions 6, 4, 5 recomputed. |
| 1a/F05 (Mahler stages unowned) | repaired, with S01, S02 and S04 on the new text | Line 582, "*Mahler-analytic stages.*" (i)–(v); CD14 lines 1610, 1799, 1826 and PAN22 line 581 support it. |
| 1a/F06 (evaluation not P-equivariant) | repaired | Line 1176: "the induced U(g)-linear map … in general not P-equivariant"; Check at line 1190 recomputed (support pℤ_p). |
| 1a/F07 = 1b/F01 (U(g ⊗_L E) in D_L) | repaired | Line 233, 0.4 (iv), and line 235: "For F = L it is proved here"; ST02 lines 360–367 and 394–401 give the embedding and the pairing. Check at line 253 recomputed: (1, 0). |
| 1a/F08 (Layer 4 in the docstring) | repaired | `Suggested.lean:32–41`. |
| 1b/F02 (LieHighestWeight layers) | repaired | Lines 61–65 and 115; binders checked at the pin: `[IsAlgClosed K]` on `Existence.lean:95` and `CentralCharacter/Isomorphism.lean:61`, none on `exists_isCompl_of_isKilling` (`CompleteReducibility.lean:259`, outside the `AlgClosed` section), `[IsTriangularizable K (center K L) M]` on `Reductive/CompleteReducibility.lean:107`. |
| 1b/F03 (regular representation, G compact) | repaired | Lines 266–267. |
| 1b/F04 (density from flatness) | repaired | Line 85: "which contains its injectivity (the density of the Dirac span is LocallyAnalyticDistributionsPartII §1.1)". |
| 1b/F05 (1.9 ↔ 5.3) | repaired | Line 493 proves the isomorphism in place; line 969: "(2) by 1.9 (iii)". |
| 1b/F06 (target of ζ_w in 8.11) | repaired | Line 1424: "the composite of (3.10) with the push-forward along PS_1(w(φ), h) ↪ PS(w(φ), h) … is an isomorphism". |
| 1b/F07 (connected in 1.10) | repaired | Line 511: "𝐆 split connected reductive over L"; line 513 cites LocallyAnalyticDistributionsPartII §1.3, whose hypothesis (connected group over ℚ_p, open compact subgroup) is met by Res_(L/ℚ_p)𝐆. |
| 1b/F08 (4.2 (iii) a tautology) | repaired, with S05 on the new route | Line 833, 4.2 (iii). |

## Verified sound

Counts: declarations read 0 (`Suggested.lean` declares nothing; 63 lines read). Targets read 86 of
86 (0.1–10.7), every line of the README (1778 lines). Checks tested 321 bullets in 86 blocks, each
block with at least three; every one with a computable value was recomputed. Locators verified
this round 53, in CD14, PAN22, ST02, ST03, EM17, EMJ2, BR16 and DING25 (listed below). Sibling
citations checked 38 section or target ids in 13 roadmaps. Pinned declarations checked 17.

**Suggested.lean.** No declaration, one `import Mathlib`, no `set_option`, no `lemma`; the
elaborated-signature comparison has no input and nothing changed. Headlines listed in the README
(anti-equivalence and Ext¹, strong LA-acyclicity, the solid Grothendieck and comparison theorems,
category O^p_alg with BGG duality and Kostant homology, Schraen's spectral sequence, the
Orlik–Strauch theorems, the adjunctions of Emerton and Breuil, Ding's four theorems) are each named
in the docstring with the missing carrier; none is statable at the pins (no D(G, E), no locally
analytic functions on a manifold, no solid E-vector spaces, no category O for reductive algebras:
grep of both pins). 4.1 (iii) alone has pinned carriers (`LieAlgebra.HasCentralRadical`,
`LieSubmodule`); it is a descent step toward the Layer 4 headlines, not one of them, and is not
raised. No padding is possible.

**Dependency check** (run as given): `depcheck: 239 roadmaps, 2175 edges, 0 problem(s)`. No UPWARD,
CYCLE or moved line. The pull request changes only `packages/LocallyAnalyticRepresentationsOfLocalGroups/`
(`git diff --stat origin/main...HEAD`: 11 files, all in the folder). No pull-request number, process
word or machine path in the README or the Lean file ("lemma" occurs only in "Shapiro's lemma",
"Schur's lemma", "Jacquet's lemma").

**Gaps.** The seven slugs of `design/plan.json` are the seven of the README, each with a named
supplier and section and a "What … must provide" line. None asks for what exists: LocallyAnalyticDistributions
has no barrelledness and no tensor exactness target (grep of its head), PadicFunctionalAnalysis on
main owns neither, ALS.4.5 is stated for Weil restrictions, SR.3 is over ℂ.

**Suppliers resolved** (on main, or at the open head): LocallyAnalyticDistributions §0.0 (six named
targets), §0.2 (three named targets); LocallyAnalyticDistributionsPartII §§1.1, 1.2, 1.3, 1.4, 1.5,
2.5 (§1.3 hypothesis and §1.5 (HYP) read); PadicLocalLanglandsForGL2Qp §0.1, §2.4, §2.5 (Π_H^((h))
with r_h as cited), §4.8; CompletedCohomologyPartII F.1, F.4; NoncommutativeAndEquivariantIwasawa
§§0.1–0.3, 0.6–0.7; OverconvergentAutomorphicForms §0.6; ReductiveGroupsPartII RG2.0.2, RG2.0.3,
RG2.4.2, RG2.4.4 (five targets); SmoothRepresentationsOfLocalGroups (20 targets, each in the section
named); ReductiveGroups Layers 1, 2, 4, 7, §8.1, §10B; LieHighestWeight §§9.1–9.2;
ArithmeticLocallySymmetricSpaces ALS.4.5; VStackSheavesAndLisseCategories VS2.1–VS2.2;
AdicSpacesPartIII R3.4 (two targets); PadicMeasuresIwasawaAlgebras §1.7. All suppliers are on main
or earlier in `merge-order/ORDER.txt` (this roadmap is at line 253; the latest supplier,
OverconvergentAutomorphicForms, at 251).

**Pins.** `Ext`, `CategoryTheory.Abelian.Ext`, `BarrelledSpace`, `BaireSpace.instBarrelledSpace`,
`WithSeminorms.banach_steinhaus`, `PolynormableSpace.banach_steinhaus`, `continuousCohomology`
(`ContCohomology/Basic.lean:131`), `DualNumber`, `UniversalEnvelopingAlgebra.lift`;
`TauCeti.completedGroupAlgebra` (`…/CompletedGroupAlgebra/Basic.lean:145`), `TauCeti.VermaModule`,
`TauCeti.irreducibleQuotient`, the five highest-weight declarations of 1b/F02,
`Module.Basis.pbwBasis`, `TauCeti.AnalyticStage`, `TauCeti.LocallyAnalytic`.

**Ownership** (`roadmaps grep`, by object): Orlik–Strauch, LA-acyclic, very strongly admissible,
closed induction, Smith space, generalised Verma: only this roadmap and its two named consumers.
"Weakly null": BanachSpaceTheory on main (archimedean) only. The overlap list names only this
roadmap's own open pull request; main has no folder of this name, so it is not a second copy, and
the former-numbering table (lines 137–164) keeps the ids citing roadmaps use.

**Adversarial pass, computed values** (rows new in this round or recomputed after the repairs):

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| 0.4 (iv), F = L | L = ℚ_p(√p), f(z) = z | x_(σ_0) ↦ (1, 0), acts by ½(1 + 1) = 1; x_τ ↦ (0, 1), acts by ½(1 − 1) = 0 | ok |
| 0.2 non-example | f = Σ p^n 1_(p^n + p^(2n)ℤ_p) | f(p^n) = p^n, f(2p^n) = 0 (p odd), zeros accumulate at 0 | ok |
| Examples, cubes | units of ℤ_3 mod 9 | cubes ∈ {1, 8}; 4 is not | ok |
| 1.10 (2) | H^q(g′, End F_λ) = 0 for q = 1, 2 | E_2^(n−q, q) with q ≥ 3 needs n ≥ 3; d_r into E^(n,0) needs r ≥ 4 | ok for n ≤ 2 |
| 1.10 Check 2 | GL_2(ℚ_p), λ = 0 | Hom_sm(PGL_2(ℚ_p), E) = 0; Hom(ℚ_p^×, E) ∘ det of dimension 2 | ok |
| 2.3, s_h | p = 3 and p = 2, h = 1 | 3^(−1/2); κ = 2, r_1 = 1, 2^(−1/2); both in (1/p, 1) | ok |
| 2.3, (HYP) | ω = κ + min v_p | p odd: 1 + 1 > p/(p − 1); p = 2: 2 + 2 > 2 | ok |
| 2.3 (iii), action | λ = Σ c_j b^j on LA^((h))(ℤ_p) | v((λf)_k) − kr_h ≥ −C + inf_(m≥k)(v(a_m) − mr_h) → ∞ | ok |
| 2.3 (v) | ζ^a on ℤ_p | G_0-an = 0 ⊆ Π^((2)) = E ⊆ G_1-an = E | ok |
| 2.3 (v), bounds | m = ⌊a/p^n⌋ | v_p(m!) ≤ a·r_(n+1); ≥ a·r_(n+1) − 2 − log_p(a + 1) | ok |
| 2.3 Check (shift) | k = p^m − 1 | v_p(k!) = k/(p − 1) − m; ⌈√m⌉ − m → −∞; ⌈√m⌉ − m + k/p → ∞ | ok |
| 2.5, B ⊗̂ M | B = C(G_0, E) | unit-ball H^0 of B ⊗̂ C^an(G_n) of infinite rank | S01 |
| 3.2 Check 4 | ℤ_p + p𝔻 | a function constant on cosets of p²ℤ_p in pℤ_p takes a value infinitely often | ok |
| 3.8 Check 4 | f(g) = χ(g)v | (h·f)(g) = χ(h)χ(h⁻¹g)v = f(g); right translate at e: χ(h)v | ok |
| 4.1 Check 4 | gl_2 | s·(0, 0) = (−1, 1); (1, −1) ∉ {(0, 0), (−1, 1)} | ok |
| 4.3 (iii), 4.5 (iii) | α ∈ I and α ∉ I | L(s_α·λ) is the top of M(s_α·λ), killed for α ∈ I; for α ∉ I it is in no M(s_β·λ), β ∈ I | ok |
| 4.5 Check | λ = (1, 1) | s(3/2, 1/2) − (1/2, −1/2) = (0, 2) | ok |
| 4.6 | GL_2, λ = (k, 0) | H_1(𝔫⁻) = (−1, 1) + (0, k); H_1(𝔫) = (1, −1) + (k, 0); −(s·(0, −k)) = (k + 1, −1) | ok |
| 5.1 Check 4 | χ = z^λ, λ ≠ 0 | f(bg) = z^λ(b)f(g) = f(g) for small b forces f(g) = 0 | ok |
| 5.5 Check 3 | Σ = 1, ρ = z^((0,2)) | weights (0, 0), (−1, 1) ≠ (0, 2) | ok |
| 6.3 Check 3, 8.1 genericity | n = 2, χ = φη | δ_(B⁻)(a, d) = \|d/a\|; reducible iff χ_2χ_3⁻¹ ∈ {1, \|·\|^(−2)} iff φ_1φ_2⁻¹ ∈ {\|·\|^(±1)} | ok |
| 6.6 Check 2 | GL_2(ℚ_p) × GL_2(ℚ_p(√p)) | 2·4 = 8; 3·4 = 12 | ok |
| 7.3 Checks 2–3 | (0, 2) and (1, 1) | pairings −1 (simple) and 1 (not simple) | S06 (wording) |
| 8.1 (v) | n = 3, ℚ_p, blocks (2, 1) | a_1 = a_2: 3 + 2 = 5 | ok |
| 8.5 Checks | w = (1 2 3), w′ = (2 3)w | w⁻¹(1) = w′⁻¹(1) = 3; w(1) = 2, w′(1) = 3 | ok |
| 8.8 sequences | general n | (n − 1) + (1 + d_L) = n + d_L; Hom_(g′) → Hom(Z, E) onto, ψ_0(a^n) = nψ_0(a) | ok |
| 8.8 Check 4 | (2, 4, 8) | e = (14, 56, 64); first-order (2, 24, 64); exponent (i − 1) + (n + 1 − 2i)/2 = (n − 1)/2 | ok |
| 8.11, 8.12 | general n | n(1 + d_L) − (n + d_L) = (n − 1)d_L; (n + d_L) + (2^n − 2)d_L | ok |
| 9.2–9.4, 9.7 | blocks (n − 1, 1), (1, n − 1) | 2^(n−1) − 1 labels each; 2(n + 2d_L + (2^(n−1) − 2)d_L) − (n + d_L) = n + (2^n − 1)d_L | ok |
| 9.5 Check 3 | blocks (2, 1) | (2 + 3d_L) + (1 + d_L) = 3 + 2d_L + 2d_L | ok |
| 10.3–10.7 | n = 2, d_L = 2 | 3; 4; 5; (5 − 2)·2 = 8 − 2; 4 + 4 − 3 = 5 | ok |
| 10.1 Check 5 | H = 1 + 3O_L, j(g) = g² | χ_1 ∘ j⁻¹ = χ_(1/2); 2m = 1 has no integer solution | ok |

**Locators confirmed** (source id line): CD14 1516 (§IV.1, p. 36), 1551, 1610 (Proposition IV.2,
p. 38), 1615 (s_h), 1663, 1682, 1695, 1719, 1722 (p. 40), 1799 (p. 42), 1826, 1831, 1850 (p. 43);
PAN22 563, 573, 581, 588; ST03 348, 394, 401, 416, 430, 474, 542, 872, 896 (p. 22), 910 (p. 23),
934, 1256, 1333, 1343, 1416, 1515; ST02 330, 343–367, 376, 394–401, 514, 527, 553; EM17 3463, 5898,
6196, 6696; EMJ2 132, 137–139, 142, 147, 186, 977, 2089, 2835; BR16 234–236; DING25 859–861,
1604–1636, 1641–1644, 1646, 1659–1691, 1890.

**Arrangement.** DING25 has the largest share of the locators. Pairs by number: Layer 8 ↔ §§3.1.1–3.1.2,
Layer 9 ↔ §3.1.3, Layer 10 ↔ §3.1.4. The order is forced by 9.1 *Needs* 8.7, 9.3 *Needs* 8.7,
10.2 *Needs* 8.7 and 9.3, 10.6 *Needs* 9.6, 10.7 *Needs* 9.7. Layers 0–7 (58 of 86 targets) have no
counterpart in that paper's contents. Not a finding; the pairs are reported to the human reviewers.

**Reuse.** No table, figure or example list is taken over; no Lean declaration to compare.

Source independence: 12 passages compared with 7 sources, 2 shared (2.4 and 2.5 with PAN22, S02); largest share DING25, 50 of about 250 locators; contents compared with DING25: Layers 8, 9, 10 parallel to its §§3.1.2, 3.1.3, 3.1.4 in an order the *Needs* lines force, Layers 0–7 independent.

## Not verifiable

- SCHN11, NFA02, HUM08: settled as uncertified; their locators were not checked against text.
- No Lean was elaborated: the file has no declaration and this pass runs no build.
- The open heads of PadicLocalLanglandsForGL2Qp, CompletedCohomologyPartII, NoncommutativeAndEquivariantIwasawa, LocallyAnalyticDistributions, ArithmeticLocallySymmetricSpaces and VStackSheavesAndLisseCategories have no checkout path in the list; they were read with `roadmaps show`.
- The deep theorems (Orlik–Strauch irreducibility, Emerton's adjunction, Ding's bijectivity statements) were checked for hypotheses, conventions and dimensions against the sources, not reproved.
- The statement of 0.8 over an arbitrary spherically complete field rests on the reference CD14 gives at line 1721, which is not among the cached texts; the discretely valued case, the only one used, was checked by the gliding-hump argument on c_0(I).
- The Source corrections the README makes to DING25, BCGP25 and BR16 were not all recomputed against the source lines in this round; the README's own statements at those places were (rows above).

## Source issues

- **Gap** in PAN22 at Corollary 2.2.4, p. 14 (PAN22 lines 590–598): the source says cohomology of B commutes with the tensor product by M and then invokes the theorem; it should rerun the theorem's proof for the tensored sequence, the twisted coefficients not being admissible; affects the proof.
- **Gap** in DLB17 at Lemme 5.10, p. 29 (DLB17 lines 1167–1168): the source says null and weakly null sequences coincide over a spherically complete field, without proof or reference; it should cite the reference CD14 gives at Lemme IV.7; affects nothing.

## For the human reviewers

- **Scope/arrangement.** Layers 8, 9, 10 (`README.md:1244`, `:1491`, `:1607`) cover the same ground, in the same order, as DING25 §§3.1.2, 3.1.3, 3.1.4; the order is dependency-forced; whether Layer 10 should be folded into Layers 8–9 is a judgement.
- **Licence.** EM17 and EMJ2 are read from the author's university page (`sources.toml`, `licence_class = "author-page"`); EMJ2 is an unpublished preprint, cited for Layer 7.
- **Licence.** BCGP25 (arXiv:2502.20645v1) and OR19 (arXiv:1802.07514v2) are cited in preprint form; Layer 3's definitions rest on BCGP25 §2.2 and RJRC22.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4756c29e6de35ffbde1fe1cce6814457475d978f", "job": "RT-LocallyAnalyticRepresentationsOfLocalGroups~2b", "model": "fable", "worker": "chris-x30"} -->
