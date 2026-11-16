# Review of LocalLanglandsCorrespondenceForG2 (pull request #2458 at 8d99a61)

**Verdict:** needs changes

## R01 (P2) — §10.7 has no route and no supplier for its key step

**Location** `TauCetiRoadmap/LocalLanglandsCorrespondenceForG2/README.md` line 1212: "prove that all σ ∈ X have the same φ_τ ⊕ φ_τ∨ and hence the same L_w (GS, proof of Theorem 12.7(ii), p. 39)"; *Needs:* §9.2, §10.1, ModularityAndLanglandsExtensions §3.19, pgsp6-lower-tower-parameters, §§4.7a, 10.30.

**Claim** No listed input relates the members of one of Xu's packets to their lower-tower theta data, and the cited page proves nothing; the §10.6 argument does not transfer (members in Irr♠ have zero lift to split PGSO₈). §10.9 inherits the gap.

**Witness** GS line 1647: the Irr♠♣ case is "checked along similar lines and we leave it to the reader". ModularityAndLanglandsExtensions §3.19 mentions no theta lift. §10.7's first Check: the common q-image 1 ⊕ Λ²φ_τ does not fix φ_τ ⊕ φ_τ∨.

**Repair** Add the input as a declared contract (plan.json `gaps`, and under the supplier's heading), e.g. "What ModularityAndLanglandsExtensions must provide (gap:pgsp6-lower-tower-xu-packets): for a discrete φ_τ : WD_F → SL₄(ℂ) with 1 ⊕ Λ²φ_τ discrete, the similitude theta lifts to PGSp₆(F) of the representations of PGO₆(F) above τ and of PGO₅,₁(F) above JL(τ) form exactly one of Xu's packets over 1 ⊕ Λ²φ_τ (§3.19)." Cite it in §10.7 *Needs:* and the Layer 10 Dependencies, and add "*Route:* every σ ∈ X is a lift of some τ′ with Λ²φ_τ′ = Λ²φ_τ (pgsp6-lower-tower-parameters contract); the contract puts all lifts of τ′ in one of Xu's packets, which is therefore X, so every member has φ_τ′ ⊕ φ_τ′∨."

## R02 (P3) — §3.8 omits the reducibility input its route uses

**Location** `TauCetiRoadmap/LocalLanglandsCorrespondenceForG2/README.md` line 636: "*Route:* rank-one R-groups for the two maximal Levis and the torus, with the explicit reducibility lists. *Needs:* §3.6, §3.7; SmoothRepresentationsOfLocalGroups, SR.2."

**Claim** The reducibility lists are ExceptionalThetaCorrespondencesForG2, Layer 1 (§§1.1–1.6); neither this *Needs:* line nor the Layer 3 Dependencies (line 757) cites that layer, and SR.2 contains no G₂ list.

**Witness** For φ : W_F → T[2] through the three nontrivial quadratic characters (p odd), S_φ = {±1} ⊂ W(G₂); its two-member fibre is ExceptionalThetaCorrespondencesForG2 §1.6 (its README line 433: "generic⊕nongeneric").

**Repair** Append "ExceptionalThetaCorrespondencesForG2, Layer 1, §§1.1–1.6 (reducibility of the P-, Q- and Borel series)" to the *Needs:* line of §3.8, and "ExceptionalThetaCorrespondencesForG2, Layer 1" to the Layer 3 Dependencies.

## R03 (P3) — Two Checks on diamond fibres test a case that cannot occur

**Location** `TauCetiRoadmap/LocalLanglandsCorrespondenceForG2/README.md` line 983: "The fibre size is |Irr(S_φ)|, which differs from |S_φ| whenever S_φ is nonabelian (for S₃ the counts are 3 and 6)"; line 969: "not |S_φ| when S_φ is nonabelian".

**Claim** For φ ∈ Φ♦_ds(G₂), S_φ is an elementary abelian 2-group, so |Irr(S_φ)| = |S_φ| and neither Check separates labelling by characters from labelling by elements.

**Witness** §0.3's route gives Z_Spin₇(i∘φ) = i(Z_G₂(φ)) × μ₂, and q embeds i(Z_G₂(φ)) in Z_SO₇(v∘φ) ≅ (ℤ/2)^(k−1), v∘φ discrete with k summands (§0.4). S₃ occurs only on the A₂ image (§4.3).

**Repair** Replace the Check at line 983 with: "For φ ∈ Φ♦_ds(G₂), S_φ embeds in Z_SO₇(v ∘ φ) ≅ (ℤ/2)^(k−1), k the number of irreducible summands of v ∘ φ (§§0.3–0.4), so the fibre has 2^m ≤ 2^(k−1) members; for φ principal (k = 1) it is {St_G₂}, and a three-member fibre, as over the subregular parameter, does not occur on Φ♦_ds(G₂)." At line 969 replace "not |S_φ| when S_φ is nonabelian" by "a power of two, at most 2^(k−1)".

## Verified sound

| Statement | Instances tried | One side | Other side | Result |
| --- | --- | --- | --- | --- |
| `griess_conjugacy` (§0.0) | Γ = ℤ/5, ρ(1) = t = diag(ζ,ζ,ζ³), ρ′(1) = t²; Γ trivial | octonion eigenvalues of t: 1,1,ζ,ζ,ζ³,ζ⁴,ζ⁴,ζ² | of t²: 1,1,ζ²,ζ²,ζ,ζ³,ζ³,ζ⁴; ζ multiplicity 2 vs 1, so no intertwiner; trivial Γ: g = 1 | hypothesis and conclusion fail together; holds |
| §0.4 standard injectivity | j∘φ_τ vs j∘φ_τ∨; Spin₇ pair φ, η·φ of §0.8 | both v-images 1 ⊕ φ_τ ⊕ φ_τ∨, G₂-conjugate by the duality element | equal q- and s-images, not Spin₇-conjugate | true for G₂, correctly not claimed for Spin₇ |
| §0.6 weak equivalence | trivial vs Frobenius ↦ −1; Frobenius ↦ i(j(diag(−1,1,−1))) vs its −1 twist | (q-trace, s-trace) = (7, 8) vs (7, −8) | (−1, 0) vs (−1, 0) | two weak classes; one weak class, as the Checks say |
| §0.7 weak ⇔ elementwise | γ = i(j(diag(−1,1,−1))); s = e₁e₂e₃e₄ with u, u′ the two very even SO₄ unipotent classes | γ has eigenvalue −1 on E and spin trace 0, so γ ~ −γ (CG Lemma 3.10) | q(su) ~ q(su′) but spin Jordan types differ ([2,2] on +1 vs on −1); su ≁ su′ | no counterexample |
| `spin7_not_acceptable` (§0.8) | Γ = μ₄ × μ₄ | V weights (1,0),(1,2),(0,1),(2,1), sum ≡ 0 | η⊗V: (1,2),(1,0),(0,3),(2,3) ≠ V, ≠ V∨; Γ = ker a² ∪ ker b² ∪ ker (ab)² | holds (CG Example 1) |
| `spin7_not_acceptable_weilGroup` | K = ℚ₅, ℚ₃; r, η trivial; r trivial, η ≠ 1 | ℚ₅×/ℚ₅×⁴ ≅ (ℤ/4)²; ℚ₃×/ℚ₃×⁴ has order 8 | trivial pair refuted only by last clause (g = 1); 1 ≁ −1 kills the second | content in last clause; CG Prop 8.3 covers every p |
| §1.1 octonion and quaternion facts | k = ℚ(√2), c = −(1+√2); S = {2}, D = (−1,−3)_ℚ | c ↦ −2.414 (definite) and 0.414 (indefinite) | Hilbert symbols −1 at ∞, −1 at 3, +1 at 2 | Checks hold |
| §1.7 spin-regular weights | t = 1, t = 0 | h = (11,6,3): spin weights ±10, ±7, ±4, ±1, distinct | h = (3,2,1): weight 0 twice | t ≥ 1 needed, as stated |
| §2.2 SpinLift | unramified σ with trivial parameter, then central −1 twist | spin eigenvalues 1⁸ (trace 8), standard 1⁷ | (−1)⁸ (trace −8), standard 1⁷ | spin lift not read from standard data |
| §2.4 spin γ-factors (Check) | ℚ₅, trivial spin Satake class, s = 2; ψ₅ = ψ₀(5·) | Tate factor (1−5⁻²)/(1−5) = −6/25, product (6/25)⁸ | with ψ₅: 5⁻¹²(6/25)⁸ on both sides | holds |
| §3.5 nontempered | trivial representation of G₂ | v∘L(1): Frobenius eigenvalues q⁻³,…,q³, N = 0 | St_G₂: same semisimple part, N ≠ 0 | distinguished by N |
| §3.8 tempered fibres | φ into T[2] by three quadratic characters (p odd) | S_φ = Stab_W(T[2]) = {±1}, order 2 | Borel series generic ⊕ nongeneric: 2 members | 2 = \|S_φ\|; input not cited (R02) |
| §3.11 γ-family characterization | ζ functional equation, s = 2; ψ_a with a transcendental | γ_∞(2) ζ(−1) = −2π² · (−1/12) = π²/6 = ζ(2) | inverted form gives ζ(−1) = −π⁴/3; such ψ_a are no global components | direction pinned; rule (e) needed |
| §3.13 characterization by γ (headline) | St_G₂ × 1; A₂ image | γ(s, Sym⁶) = Steinberg factor of GL₇ | v∘L = 1 ⊕ φ_τ ⊕ φ_τ∨ reducible, so the generic converse contract is needed | holds |
| §3.15 global–local (headline) | Steinberg place; infinitesimal character ρ | Weil–Deligne representation Sym⁶, N ≠ 0 | v-weights 3,2,1,0,−1,−2,−3, distinct | holds |
| §4.3 self-dual A₂ packets | φ_τ = Sym² (subregular) | \|Irr(S₃)\| = 3, \|S₃\| = 6 | std₂ restricted to μ₃ = χ ⊕ χ⁻¹, trace at ζ₃ = −1 | three members, labels 1, sgn, std₂ |
| §5.6 spin identity | π_gen[1] | θ(π_gen[1]) = I₃(St)_gen, tempered, not discrete (HD Theorem 15.2(iii)) | spin parameter Sym² ⊕ Sym² ⊕ 1 ⊕ 1, dimension 8 | holds with generic tempered middle |
| §6.2 unique generic member | φ principal | generic member St_G₂, partner St_PGSp₆ | St ⊗ χ∘sim: spin image χ ⊗ (1 ⊕ Sym⁶) has no invariant line, no G₂ lift | holds |
| §§6.6–6.7 enhancement counts | diamond φ, v∘φ with k summands | S_φ ↪ (ℤ/2)^(k−1), abelian | \|Irr(S_φ)\| = \|S_φ\| always; S₃ never occurs | Checks vacuous (R03) |
| §7.1 LLC for G₂ (headline) | subregular, principal, trivial-representation parameters | fibre sizes 3, 1, 1 | \|S_φ\| = 6, 1, 1; \|Irr(S_φ)\| = 3, 1, 1 | labelling by Irr(S_φ) consistent |
| §7.2 generic supercuspidal | π_sc[1]; non-self-dual φ_τ trivial on SL₂, p ≠ 3 | π_sc[1] supercuspidal, nongeneric, parameter nontrivial on SL₂ | fibre of j∘φ_τ: 3 members, 1 generic | bijection as stated |
| §7.3 partial PGSp₆ correspondence | χ = 1; χ fixing i∘φ | X*(φ) ↦ i∘φ | self-twists of members equal α(S_φ) (ModularityAndLanglandsExtensions §3.19) | well defined |
| §8.1 heart lift | unramified components under Jacquet–Shalika; trivial representation | \|λ_i\| ∈ (q^(−1/2), q^(1/2)) gives root values in (q⁻¹, q), never q^(±1) | trivial: λ = (q³,q²,q), λ₁/λ₂ = q reducible, \|λ₁\| = q³ excluded | holds |
| §9.1 extended SpinLift | lower tower, τ = St_PGL₄, φ_τ = Sym³ | φ_τ ⊕ φ_τ∨ = Sym³ ⊕ Sym³, dimension 8 | 1 ⊕ Λ²Sym³ = 1 ⊕ 1 ⊕ Sym⁴, dimension 7 | holds |
| §10.1/§10.9 weak correspondence (headline) | St_PGSp₆; σ ⊗ χ∘sim, χ unramified quadratic | L_w(St) principal, fibre {St_PGSp₆} | spin trace 8 → −8, q-image unchanged | holds; §10.9 depends on §10.7 (R01) |
| §10.6 diamond constancy | σ = St | X = {St}, constant | Steinberg place: trivial global component group (contract) | holds |
| §10.7 lower-tower constancy | unramified φ_τ with eigenvalues a, b, c, (abc)⁻¹; χ unramified quadratic | Λ² eigenvalues ab, ac, … unchanged (χ² = 1) | eigenvalues of φ_τ ⊕ φ_τ∨ change sign | constancy needs an input not supplied (R01) |

- Source locators checked against the text: 46 (GS 22, CG 10, HD 6, HKT 6, C 1, GS20 1), including all fifteen sampled targets; no README locator is flagged unverified.
- Library declarations opened at the pins: 24 Tau Ceti (e.g. `TauCeti.Octonion` Algebra/Octonion/Basic.lean:143, its product :279, `TauCeti.spinRep` RepresentationTheory/Spin/Representation.lean:62, `instTopologicalSpaceWeilGroup` WeilGroup/Topology.lean:78) and 10 Mathlib (e.g. `spinGroup` LinearAlgebra/CliffordAlgebra/SpinGroup.lean:293).
- Cross-roadmap citations resolved at main or the open heads: every cited section id and named anchor in 20 roadmaps (ExceptionalThetaCorrespondencesForG2 31, SmoothRepresentationsOfLocalGroupsPartII 11, ModularityAndLanglandsExtensions 9, EndoscopicTransferAndUnitaryTraceComparison 8, sixteen others 1–6 each); none missing.
- Gate at 8d99a61: every check passes. Dependency check: `depcheck: 261 roadmaps, 2526 edges, 0 problem(s)`.
- `lake env lean` on `Suggested.lean`: three `declaration uses sorry` warnings (lines 124, 143, 158), no error; `#check @` of all six declarations matches the README statements, no binder lost.
- One-tactic probe (`simp`, `rfl`, `infer_instance`, `aesop`, `decide`) on the three theorems: none closes; no padding.
- Declared gaps: 27 slugs, identical in plan.json and the README contracts, each with a named supplier earlier in the merge order; the GL_n generic local converse is stated by no supplier (searched EndoscopicTransferAndUnitaryTraceComparison, AutomorphicLFunctionsAndLocalFactors).
- Mechanical comparison of README and `Suggested.lean` wording with GS, HD, CG, HKT, GF and C: no shared run longer than 9 words outside formulas and the References.

Overlap check: read ExceptionalThetaCorrespondencesForG2, AutomorphicLFunctionsAndLocalFactorsPartII, ModularityAndLanglandsExtensions, TwistedAutomorphicDescents, GanGrossPrasadUnitaryGroups, AutomorphicFormsOnReductiveGroups, SpinRepresentations; shared: the octonion automorphism group (owner ExceptionalThetaCorrespondencesForG2 §0.1, cited; `octonionAut` is its ℂ-points carrier, and that roadmap's `Suggested.lean` declares nothing), Xu's packets (owner ModularityAndLanglandsExtensions §3.19, imported), the PGSp₆ spin factor (AutomorphicLFunctionsAndLocalFactorsPartII by declared gap); Griess's theorem, Spin₇ unacceptability, the G₂ parameter map, G₂ × GL_r factors, SpinLift and L_w occur in no other roadmap.

Source independence: 24 passages compared with 6 sources (GS, HD, CG, HKT, GF, C), none shared beyond formulas and stock phrases; largest share GS, 111 of 179 locators; contents compared with GS: independent (Layers 1–2 supply GS §§3–4 material and precede it, Layer 3 adds GF, Layers 8–10 reorder GS §12; the remaining order Layers 4→7 is forced by §6.1 needing §5.2 and §7.1 assembling §§4–6).

## Not verifiable

- Griess, Theorem 1 (§0.0 and `griess_conjugacy`): manifest records it uncertified (paywalled Invent. Math.); the text was not read.
- SpV, Theorems 1.7.1, 1.8.1 and §1.5 (§1.1(i)–(iii)): manifest records it uncertified (Springer monograph); the text was not read.

## Source issues

- **Gap** in GS at proof of Proposition 3.2, pp. 14–15: the source says the centralizer of every parameter in the discrete PGL₃ image has order three; it should be S₃ for self-dual φ_τ (Lemma 2.4(i)), treated separately; affects the proof.
- **Misprint** in GS at Main Theorem (ix), p. 4: the source says γ(s, std ∘ L(π)) ⊗ φ_τ, ψ), closing the parenthesis early; it should be γ(s, (std ∘ L(π)) ⊗ φ_τ, ψ), as on p. 13; affects nothing.
- **Error** in GS at Main Theorem (vi), p. 4: the source says the middle row of the spin diagram is the generic discrete series of PGSp₆; it should be generic tempered, since θ(π_gen[1]) = I₃(St)_gen (HD Theorem 15.2(iii)); affects a stated result.
- **Misprint** in GS at proof of Proposition 4.1, p. 18: the source says L^S(1 − s, ·∨) equals the gamma product times L^S(s, ·); it should be L^S(s, ·) = ∏ γ · L^S(1 − s, ·∨) for γ = ε·L(1 − s, ·∨)/L(s, ·); affects nothing.
- **Gap** in GS at proof of Proposition 4.1, p. 18: the source says one global additive character has component ψ at u, w and every place of T; it should be ψ_F(c ·), c ∈ k, with the change-of-character rule; affects the proof.
- **Gap** in GS at proof of Proposition 4.1, p. 18: the source says every other finite place is spherical; it should be all but one, since Proposition 10.7, p. 29, leaves one place uncontrolled; affects the proof.
- **Gap** in GS at proof of Lemma 8.3, p. 25: the source says GS20 Theorem 1.1 applies over a totally real field; it should be a totally real version, GS20 stating it over ℚ only; affects the proof.
- **Gap** in GS at proof of Theorem 12.7(ii), p. 39: the source says the case of fibres inside Irr♠♣(PGSp₆) is left to the reader; it should be argued, the PGSO₈ argument not reaching Irr♠; affects the proof.
- **Gap** in HKT at proof of Lemma 4.6, p. 21 (arXiv v3): the source says every nonzero spinor has stabilizer conjugate to G₂(ℂ); it should be every nonisotropic spinor, chosen by complete reducibility; affects the proof.

## For the human reviewers

- Griess (Theorem 1) and SpV (Theorems 1.7.1, 1.8.1) are cited by locator only (manifest: uncertified); `griess_conjugacy` (`Suggested.lean` line 124) and §1.1(i) rest on texts this review did not read.
