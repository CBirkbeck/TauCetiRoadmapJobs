<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13046#issuecomment-6901081663 -->
Red team round 2 pass b (claude) of 1c4f533

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §3.2 states its hypothesis with a term the roadmap never defines

   Location: `packages/PadicHodgeTheoryPartII/README.md`:428 "Let (G, b, μ) be a local shtuka datum over Q_p in the GLX orientation with (b, μ) Hodge–Newton irreducible."

   Claim: "local shtuka datum" is a notion fixed in this roadmap or in a supplier.

   Witness: the term occurs once in the README (line 428) and in no roadmap on main or at an open head (`roadmaps grep -i 'local shtuka dat'`: no match). It is the wording of GLX26 line 1712, whose sentence the statement follows clause for clause.

   Repair: replace the first two sentences of §3.2 by

   > Let G be a connected reductive group over Q_p, {μ} a geometric conjugacy class of cocharacters of G with reflex field E_0, and b ∈ G(F) such that (b, μ) is Hodge–Newton irreducible in the sense of the Conventions; in particular [b] ∈ B(G,μ). Then for some finite extension K/F containing E_0, the admissible cell of HeckeStacksAndLocalShtukas §HS2.12 for b (its cell for μ⁻¹, written Gr^b_μ in GLX26) has a K-point x whose crystalline representation ξ_x: Γ_K → G(Q_p) (§HS2.11) meets the derived group in an open subgroup: ξ_x(Γ_K) ∩ G_der(Q_p) is open in G_der(Q_p).

   Tested on the instances of §3.2: for G = GL_2, b basic of slope 1/2 and μ = (1,0) the hypothesis holds (μ^◇ − ν_b = (1/2)α^∨) and the statement reads as before; for the norm-one torus with μ = 0 and κ(b) ≠ 0 the hypothesis [b] ∈ B(G,μ) fails, as the third Check requires.

2. **F02** (P3) σ_0 is not determined, and "σ_0^s = 1" fails for every choice in an instance the Conventions admit

   Location: `packages/PadicHodgeTheoryPartII/README.md`:34 "and that the Frobenius action σ_0 on the based root datum satisfies σ_0^s = 1"; :306 "σ_0 the Frobenius action on the based root datum"; :319 "reindexing with σ_0^s = 1".

   Claim: Frobenius acts on the absolute based root datum, and after the two preceding arrangements on s its s-th power is the identity.

   Witness: T = `Res_{L/Q_p}𝔾_m` with L/Q_p cyclic of degree 4, e = f = 2 (local class field theory: χ(p) = i, χ of order 2 on ℤ_p^×). At s = 2 the group is quasisplit and L/`Q_{p²}` is totally ramified, yet both Frobenius lifts g, g³ have square g² ≠ 1 on X^*(T) = ℤ[C_4].

   Computation. Only Γ_{Q_p} acts on the based root datum; "the Frobenius action" needs a lift of σ, and two lifts differ by inertia. What §§1.4–1.5 use is lift-independent: σ_0(O) for a `Γ_{Q_{p^s}}`-orbit O, and σ_0 on `Γ_{Q_{p^s}}`-invariant rational cocharacters such as μ̄. On both, σ_0^s is trivial with no further condition, because σ^s lifts into `Γ_{Q_{p^s}}`. In the witness: μ = e_1, μ̄ = (e_1 + e_{g²})/2, σ_0 μ̄ = (e_g + e_{g³})/2, σ_0² μ̄ = μ̄, and (μ̄ + σ_0 μ̄)/2 = (1/4)Σ_τ e_τ is the Galois average, as §1.5 needs.

   Repair: (a) in the Conventions replace "and that the Frobenius action σ_0 on the based root datum satisfies σ_0^s = 1" by

   > Fix a lift of σ to Γ_{Q_p} and let σ_0 be its action on the based root datum of the quasisplit inner form. On `Γ_{Q_{p^s}}`-orbits of weights and on `Γ_{Q_{p^s}}`-invariant rational cocharacters σ_0 does not depend on the lift, and σ_0^s acts trivially there, because the s-th power of the lift lies in `Γ_{Q_{p^s}}`. Only these two actions are used.

   (b) in §1.4 replace "σ_0 the Frobenius action on the based root datum" by "σ_0 as in the Conventions"; (c) in §1.5 replace "reindexing with σ_0^s = 1" by "reindexing with σ_0^s μ̄ = μ̄". Tested on the witness at s = 2 (values above) and on the cubic Check of §1.4, where inertia is trivial and σ_0(e_1) = e_σ is unchanged.

3. **F03** (P3) the module docstring misstates what the pinned Tau Ceti has for parabolic subgroups

   Location: `packages/PadicHodgeTheoryPartII/Suggested.lean`:13–15 "Tau Ceti has reductivity of affine groups (`TauCeti.reductiveCommHopfAlgProperty`) and their representation categories, and parabolic subgroups only as a predicate."

   Claim: at the pin, parabolic subgroups exist only as a predicate.

   Witness: `TauCeti.Cocharacter.parabolicDefiningHopfIdeal` (`TauCeti/Algebra/AlgebraicGroup/Dynamic/Representability.lean`:98) constructs the dynamic parabolic P(λ) of a cocharacter as a Hopf ideal, with `parabolicPointsIso` (line 152); the predicate is `TauCeti.HopfIdeal.IsParabolic` (`…/Parabolic/Basic.lean`:248).

   Repair: replace the clause by "and parabolic subgroups as a predicate (`TauCeti.HopfIdeal.IsParabolic`) and as the dynamic parabolic `P(λ)` of a cocharacter (`TauCeti.Cocharacter.parabolicDefiningHopfIdeal`), but no quotient scheme `G/P`". The conclusion that §2.3 is not statable is unchanged: the generic point of Fl_μ needs the scheme G/P, which the same sentence already lists as missing.

4. **F04** (P3) §1.7 cites ReductiveGroups 10B for a statement it does not make, where a pinned theorem gives the step

   Location: `packages/PadicHodgeTheoryPartII/README.md`:339 "The derived group is generated by root subgroups, which act unipotently on a one-dimensional module and hence trivially, so L(λ) factors through G/G_der." and :107 "generation by root subgroups".

   Claim: ReductiveGroups Layer 10 (10B) supplies that G_der is generated by the root subgroups.

   Witness: 10B on main says "Prove root-subgroup generation, highest-weight order and Weyl-orbit convex-hull bounds", about the modules it has just built from a highest line; no layer states generation of G_der. The step is `GroupLike.sub_one_mem_derivedDefiningIdeal` (`TauCeti/Algebra/AlgebraicGroup/Derived/Character.lean`:39).

   Repair: replace the quoted sentence of line 339 by "A one-dimensional module is a character of G, and every character is trivial on the derived subgroup (Tau Ceti `GroupLike.sub_one_mem_derivedDefiningIdeal`), so L(λ) factors through G/G_der."; add that declaration to the *Needs:* of §1.7 and to the From Tau Ceti contract ("`GroupLike.sub_one_mem_derivedDefiningIdeal` (`TauCeti/Algebra/AlgebraicGroup/Derived/Character.lean`:39): a group-like element minus one lies in the derived defining ideal, that is, every character is trivial on the derived subgroup"); in line 107 delete "generation by root subgroups,". Tested on the Checks of §1.7: for SL_2 and λ = 0 the module is the trivial character; for GL_2 and λ = (1,1) it is det, trivial on SL_2.

Four new findings, all P3 (S01–S04). No P1 or P2. All ten round-1 findings are repaired at this head and no repair introduced an error. No finding of the last repair report was marked `not actionable in this package`, so nothing is re-raised.

## Round-1 findings at this head

| Round-1 id | Status | Witness at `1c4f533` (file `packages/PadicHodgeTheoryPartII/README.md`) |
|---|---|---|
| 1a/F01 (PadicLocalLanglandsForGL2Qp §0.2 contract) | repaired | Line 63: "PadicHodgeTheory §3.4 records what that API contains: strictness of morphisms between weakly admissible objects, weak admissibility of their kernels, images and cokernels". PadicHodgeTheory §3.4 at its open head has that sentence ("Import from PadicLocalLanglandsForGL2Qp §0.2's exact-category API … strictness of morphisms between weakly admissible objects"). §0.5 *Needs:* (line 193) reads "§0.2 with PadicHodgeTheory §3.4 (strict morphisms of weakly admissible objects)". |
| 1a/F02 and 1b/F03 (ArithmeticGaloisRepresentations §7.6) | repaired | Line 87: "the equality, over an algebraically closed field, of the closure of α(Σ) with α of the closure", then the Q_p form with its own argument. Recomputed: I(α(Σ)) = {f : α*f ∈ I(Σ)} = ker(O(G′) → O(G)/I(Σ)). Squaring on 𝔾_m with Σ = {±1}: kernel of k[y, y⁻¹] → k[x]/(x² − 1), y ↦ x², is (y − 1), the closure of {1}. §§3.2 and 3.5 cite "the form over Q_p of the supplier contract"; §3.5 says "a G(Q_p)-conjugate of H". |
| 1a/F03 and 1b/F06 (E ⊆ K in §2.3) | repaired | Line 384: "let E ⊆ K be the compositum of `Q_{p^s}` ⊂ F ⊆ K and the reflex field E_0 ⊆ K". Recomputed on D^×, {μ} = (1,0), K = F, s = 2: E = `Q_{p²}` ⊂ F, μ = (1,0) is fixed by Γ_E, Fl_μ ⊗ E = ℙ¹_E, the fibre of the projection over the generic point is Spec of the field κ(Fl_μ) ⊗ E, one point. |
| 1a/F04 ("rank-two") | repaired | Line 244: "For the rank-one coefficient object X(1, −1) with s = 2 (of dimension 2 over F)". k = 1 − 1 = 0, F-dimension 2 = s. |
| 1b/F01 (H = H°) | repaired | Line 230: "Connectedness: H = H°. This uses that the residue field of K is algebraically closed." Proof at line 232 recomputed: W = O(H/H°) has finite Galois image, single jump 0, so t_H = 0 on every subobject; each isoclinic summand has slope ≥ 0 and the slopes sum to t_N = 0; slope 0 over F is a sum of units; full faithfulness gives trivial action. Negative control (line 240): φ(e) = −e over Q_p is not the unit, and σ(√u) = −√u (p odd), σ(√−3) = −√−3 (p = 2) over F. Line 36 no longer attributes a slip to GLX26. |
| 1b/F02 (direction of σ_0) | repaired | Line 311: the cubic Check. Recomputed: (1⊗σ)(x⊗y) ↦ (τ(x)σ(y))_τ = (σ(w_{σ⁻¹τ}))_τ, so support {1} goes to support {σ}; the inverse model gives {σ²} ≠ {σ} in a group of order 3. |
| 1b/F04 (Milne 8.20–8.21) | repaired | Lines 47 and 450 cite 8.20 and 8.21(b), p. 131, for generation and connectedness and 8.22, 8.23, p. 132, for the points (MilneiAG line 5319–5333, page marker at line 5313), and say "Milne states no image equality". |
| 1b/F05 (μ^♮ versus μ♯) | repaired | Line 33: "the Hodge invariant written μ♯ in BunGAndNewtonStrata §§1.7 and 1.23 and μ^♮ in GLX26 §2 ¶2 (arXiv v3 p. 14)". BunGAndNewtonStrata §1.7 at its head: "Put `μ♯=[μ*]`"; GLX26 line 582 is on page 14 (page-15 marker at line 591). |

## Dependency check

```text
depcheck: 242 roadmaps, 2246 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.

## The adversarial pass: record

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions: orientation, Q_p(1) | 𝔾_m, b = p^m, μ = z^m | κ(b) = m = μ^♮; φ = p^m σ with jump m; PadicHodgeTheory §3.3 Check gives Q_p(n) ↔ (p^{−n}σ, jump −n), so ξ = χ^{−m} | agrees with §0.7 Check 2 | none |
| Conventions: decency under `G(Q_{p^s})` | b′ = gbσ(g)⁻¹, σ^s g = g | (b′σ)^s = g(sν)(p)σ^s g⁻¹ = (g·sν·g⁻¹)(p)σ^s | decent, ν conjugated | none |
| Conventions: σ_0^s = 1 | C_4 torus, e = f = 2, s = 2 | every lift squares to g² ≠ 1 on ℤ[C_4]; on μ̄ the square is 1 | literal claim fails, used claim holds | S02 |
| §0.1 jump | 0; e_1 + e_2 in the three-step example | no jump; 2, −1, sum −1 = min | true | none |
| §0.2 degree sum | 2-cycle (1, −1); 3-cycle (2, 0, −5) | 0; d_3 = −3, d_2 = 2 | true | none |
| §0.3 `V^{s,k}` | 𝔾_m, b = p^a, weight h; GL_2, diag(p,1), rational flag | k = sa and k = sh; e_1 ∈ `V^{1,1}`, e_2 ∈ `V^{1,0}`, e_1 + e_2 in none | true | none |
| §0.4 ω_s | slope 1/2 block, s = 2; φ = pσ; decent b | φ²e_1 = pe_1, dim 2; unnormalised fixed space 0; x ∈ V_λ⊗F with σ^s x = x is V_λ⊗`Q_{p^s}` | true | none |
| §0.5 rank-one objects | X(1, −1); wraparound p with Σd = 0; coefficient action | lines F(e_0 + ce_1), cσ(c) = 1, t_H = −1 ≤ 0 = t_N; t_N = 1 ≠ 0; φ(a·e_i) = σ^{i+1}(a)e_{i+1} = a·φ(e_i) | true | none |
| §0.5 Hom description | v with φ^s v = p^k v | components: σ^s v_λ = p^{k−sλ}v_λ forces k = sλ and v_λ rational over `Q_{p^s}`; Σ deg(φ^i v) ≥ Σ d_i = k with equality by strictness | true | none |
| §0.6 line criterion | 𝔾_m, b = p^m; b = 1, μ = 0, V ⊕ 1 | H_cris,1 = 𝔾_m (fixing v would give 1); common scalar forced to 1 | true | none |
| §0.7 connectedness | 𝔾_m (m ≠ 0, m = 0); ε unramified quadratic over Q_p | H = 𝔾_m, H = 1; closure μ_2, D = (Q_p, −1) not the unit over Q_p, unit over F | true; residue hypothesis needed | none |
| §1.1 generic filtration | GL_2 standard, det; cubic restriction torus over Q_5 | Fil^1_gen = 0; Fil^1_gen det = det; x² + ax + a² irreducible over E (no ζ_3 in a totally ramified extension of Q_5), V ∩ (E × 0) = 0 | true | none |
| §1.2 threshold | cubic torus; GL_2; trivial weight, E/k quadratic | pairings 1, 0 on Γ_E-orbits of sizes 1, 2, m_O = 0; 0 and 1; one orbit, v_O = v | true | none |
| §1.3 orbit bound | sizes 1, 2 with pairings 0, 3; cubic torus | 0 ≤ (0 + 6)/3 = 2; 0 ≤ 0 ≤ 1/3; orbit average = group average of ⟨w_0γλ, μ⟩ = ⟨w_0λ, μ̄⟩ | true | none |
| §1.4 transport | quadratic and cubic unramified tori | swap; e_1 ↦ e_σ, inverse model e_σ² | true | none |
| §1.5 full-period inequality | GL_2 basic, b = [[0,p],[1,0]], s = 2 | (bσ)² = pσ², every generic jump 0, d_2 = 0 < 1, `V^{2,1}` empty | true | none |
| §1.6 Newton inequality | rational v, λ ∈ O with v_O ≠ 0 | γ(v_O^λ) = v_O^{γλ}, so every λ ∈ O has a nonzero component; then ⟨w_0λ, ν⟩ ≤ ⟨χ, ν⟩ = k/s | true | none |
| §1.7 strict positivity | SL_2, c > 0, weight −n; GL_2 ordinary, c = 0 | −cn < 0; 0 ≤ 0 ≤ 0 with ⟨λ, α^∨⟩ = 1 | true; strictness needed | S04 (citation only) |
| §2.1 descent | diag(p,1); simple block | Fe_1, Fe_2; 0 and the block | true | none |
| §2.2 semicontinuity | telescoping; plane with line L | Σ i(f_i − f_{i+1}) = A f_A + Σ_{i>A} f_i with f_A = r; 1 at [L], 0 elsewhere | true | none |
| §2.3 generic admissibility | GL_2, diag(p,1), flag Ke_2 and generic; D^×, K = F | t_H(Fe_2) = 1 > 0, then 0; E = `Q_{p²}` ⊂ K | true | none |
| §2.4 derived monodromy | GL_2 basic; GL_2 ordinary generic; GL_2, b = p, μ = (1,1) | SL_2 ⊆ H°; `V^{1,0}` = Q_p^×e_2, ξ reducible; μ^◇ − ν = 0, H = 𝔾_m ⊉ SL_2, hypothesis fails | true; hypothesis needed | none |
| §3.1 generic points | ℙ¹; n = 0 | transcendental coordinate; X = Spec E, K = FE | true | none |
| §3.2 open image | norm-one torus, μ = 0, κ(b) ≠ 0 | slopes and jumps 0 (weakly admissible), κ(b) − μ^♮ ≠ 0 in ℤ/2, no admissible point; matches HeckeStacksAndLocalShtukas §HS2.12 | true | S01 (wording) |
| §3.3 Zariski density | 𝔾_m with 1 + pℤ_p (p = 2: ℤ_2^×); O(2); diagonal subgroup; anisotropic torus | infinite, closure 𝔾_m; SO(2); torus; J(E) compact of dimension dim J, closure J | true | none |
| §3.4 central lifting | GL_2 → PGL_2, J = SL_2, torus; det; G̃ a torus | dim D(J°) = 3 = dim PGL_2; hypothesis fails; kernel not central, conclusion fails; 1 ⊇ 1 | true | none |
| §3.5 z-extension | GL_2 → PGL_2 | index [Q_p^× : Q_p^{×2}] = 4 (p odd), 8 (p = 2); f(H̃°) connected of finite index in f(H̃), so it is f(H̃)° | true | none |
| §4.1 components | C = {1, diag(1,−1)}, g = [[1,1],[0,1]] | gcg⁻¹ = [[1,−2],[0,−1]] ∉ C for every p; the space of T_ξ is G(Q_p)/C, totally disconnected | true | none |
| §4.2 ambient stabilizers | Y a point; Y = T_y ⊔ (G(Q_p) × Spd K); trivial ξ for GL_2 | G(Q_p); trivial, not open when G_der ≠ 1; {1} not open in SL_2(Q_p) | true; hypotheses needed | none |

## Verified sound

- Declarations read: 0 of 0. `packages/PadicHodgeTheoryPartII/Suggested.lean` (53 lines, read whole) has the single line `import Mathlib`, one module docstring, an empty namespace `TauCetiRoadmap.PadicHodgeTheoryPartII`, no `set_option`, no `sorry`, no declaration. The `#check @name` comparison has no candidate; it was not run and nothing changed.
- Headlines (README line 7): §2.3, §2.4, §3.2, §3.5, §§4.1–4.2. Each is named in the docstring with its missing carriers, in the README's generality. Confirmed at the pins: no σ-conjugacy set, no filtered isocrystal with weak admissibility, no crystalline-representation predicate, no scheme G/P, no B_dR-Grassmannian, no diamond. None is statable; nothing is stated in its place; no padding. §§3.3 and 3.4 have pinned carriers but are auxiliary statements that name no object of this roadmap and are not listed as headlines.
- Targets read: 25 numbered sections, the Conventions, every supplier contract, the five Examples and five Dependencies paragraphs.
- Checks tested: 85 Check bullets read, those with computable values recomputed (table above); none false. Each of the six definitions (§§0.1–0.5, 1.1) has at least three.
- Pinned declarations: 5 Mathlib and 15 Tau Ceti declarations of the contracts opened at the pins; each is at the stated file and line with the stated hypotheses (`faithfullyFlat_derivedMap`: `[IsAlgClosed k]`, `[IsReduced H]`; `isClosedEmbedding_comap_of_surjective`: `[T1Space R]`; `isOpenEmbedding_mapValue_integer`: finite type). Also `TauCeti.reductiveCommHopfAlgProperty` and `BDeRhamPlus` of the docstring.
- Sibling citations checked: 48 section or target citations in 16 roadmaps, 12 at their open heads and 4 on main; every heading exists. Bodies read this round: PadicHodgeTheory Conventions, §§3.3, 3.4, 3.6, 4.4, 5.5; PadicPeriodRings §4.2 (general-base functors, for the use of §3.3 over finite K/Q̆_p); BunGAndNewtonStrata §§1.7, 1.9, 1.12, 1.23, 1.43; HeckeStacksAndLocalShtukas §§HS2.11, HS2.12, HS2.13, HS2.15, HS2.16; ArithmeticGaloisRepresentations §7.6; DeligneWeightsAndPurity §2.2; ShimuraData §3.8; ReductiveGroupsPartII §§RG2.0.2, RG2.0.4; ReductiveGroups 10B. One mismatch (S04).
- Declared gaps: both slugs have the same `needs` sentence in `design/plan.json` and in the README, with a named supplier and section; PadicHodgeTheory §4.4 at its head still states only the zero-Sen-operator theorem for finite K/Q_p, and ReductiveGroups 10B only split groups, so neither gap asks for what is provided.
- Ownership: searched main and the open heads by object for Hodge–Newton irreducibility, generic filtrations, GLX26 Theorem 5.8, Proposition 5.9 and Lemma 6.12, Zariski density of open subgroups, crystalline Mumford–Tate groups. No second owner. DeligneWeightsAndPurity §2.2 is the Sp(V) case of §3.3 and is cited as such. The only roadmap that names this one is GaloisActionOnEtaleCohomology (a mention, no id cited).
- Merge order: this roadmap is at position 192; every supplier is on main or earlier; none is on the never-cite list.
- Policy: the pull request changes only `packages/PadicHodgeTheoryPartII/`; no pull-request number, process narrative, `lemma`, `set_option` or algorithm in the README or the Lean file; every numbered section has a locator.
- Locators verified this round: 25. GLX26 line 582 (§2 ¶2, p. 14), 594 ((2.6), p. 15), 607–611 (Definition 2.1), 616–625 (Definition 2.3, ¶4), 1275–1322 (¶13–15, Definition 5.1, Theorem 5.2, (5.2)–(5.5), pp. 32–33), 1340–1380 (Definition 5.3, (5.9)), 1494–1510 (Proposition 5.7), 1588–1600 (Theorem 5.8), 1640–1643 ((5.29)), 1655–1711 ((5.30)–(5.38), end of proof), 1712–1726 (Proposition 5.9), 1727–1736 (Lemma 5.10), 1991–1996 (Proposition 6.7), 2142–2150 (Lemma 6.12). Chen14 line 711 (§3.1), 974–981 (Proposition 3.3.4), 1008–1014 (Lemme 3.3.5). MilneiAG line 5271, 5313 (pages 131, 132), 5319–5333 (8.22, 8.23). Stacks line 2128 (01UA, Lemma 26.10), 3577 (02GL, 37.7), 3611 (03WT, 37.13), 3743 (054L, 37.21).
- Wording: 12 passages set beside their sources: §3.2 and the third docstring bullet with GLX26 line 1712–1717; §§2.3–2.4 with line 1588–1594; §3.1 with line 1727–1736; §0.3 with line 1300–1322; §1.1 with line 1340–1380; the Hodge–Newton and decency conventions with line 607–625; §1.7 with line 1703–1711; §4.2 with line 2142–2150; §0.5 with Chen14 line 1008–1014; §3.4 with MilneiAG line 5319–5333. The statement of §3.2 shares 9 consecutive words with GLX26 line 1712 and its clause order (S01 rewrites it); the others share formulas and standard names only. No table, figure or list is taken over.
- Arrangement against GLX26 (§§5.1, 5.2, 5.3, 6.2, 6.7): Layer 0 draws on §5.1 and Chen14 §3; Layer 1 on §5.2 and the inequalities inside the proof in §5.3; Layer 2 on Theorem 5.8; Layer 3 on the end of §5.3, one step of §6.2 and two statements GLX26 does not contain (§§3.3, 3.4); Layer 4 on one lemma. No one-to-one run; the order is forced by the *Needs:* lines of §1.1 (§0.1), §2.4 (§§0.6, 0.7, 1.5–1.7), §3.2 (§§2.3, 2.4, 3.1) and §4.2 (§§3.2, 4.1).

Source independence: 12 passages compared with 3 sources (GLX26, Chen14, MilneiAG), none shared beyond the statement of §3.2 (9 consecutive words, rewritten in S01); largest share GLX26, 42 of 68 locators; contents compared with GLX26: independent.

## Not verifiable

- The published (Inventiones) numbering of GLX26: only arXiv v3 is in the cache; the README cites v3 explicitly.
- Elaboration of `Suggested.lean`: no Lean command is given for this pass; the file has no declaration.
- The supplier roadmaps of this README are open pull requests that are not among the 209 checkouts listed with a path; they were read through `roadmaps show` at their indexed heads (index of 2026-11-15T20:31:00Z).
- DiamondsAndVStacks §§D0.6, D5.3, D6.5 and MotivesAndAlgebraicCycles §§6.1–6.3, 6.8: headings confirmed, bodies not compared sentence by sentence with their uses in §4.1 and §0.4.
- Board packages that are not yet roadmap pull requests could not be read; ownership against them was not checked.

## Source issues

- **Error** in GLX26 at Proposition 5.7, formula (5.18), arXiv v3 p. 36: the source says the threshold is tested on the orbits of τ(λ) for τ in the automorphism group of E over the base field; it should be tested on every Γ_E-orbit inside the orbit of λ, since E need not be normal; affects a stated result.
- **Error** in GLX26 at equation (5.29), proof of Theorem 5.8, arXiv v3 p. 38: the source says an isotypic component is the sum of its refined components over the automorphisms of E; it should be the sum over the distinct Γ_E-orbits, each once; affects the proof.
- **Misprint** in GLX26 at equation (5.34), proof of Theorem 5.8, arXiv v3 p. 39: the source says the i-th power of the Frobenius action moves across the pairing unchanged; it should become the inverse power, the full-period sum being the same; affects nothing.
- **Misprint** in GLX26 at Lemma 5.10, proof, arXiv v3 p. 40: the source says the étale chart of the flag variety lies over affine space over Q_p; it should be affine space over the field of definition of the flag variety; affects nothing.
- **Gap** in GLX26 at Proposition 6.7, crystalline step, arXiv v3 p. 47: the source says openness transfers because the Galois image lies in the derived group of the z-extension; it should compare intersections with the derived groups, the image having a central part; affects the proof.
- **Misprint** in Chen14 at Lemme 3.3.5, p. 744: the source says the underlying module is a sum of lines over the degree-s unramified field; it should be a sum of lines over K_0, on which that field acts through its embeddings; affects nothing.
- **Error** in Chen14 at the proof of Proposition 3.3.4(2), p. 743: the source says every representation embeds in one mixed tensor power of a faithful one; it should allow direct sums and subquotients of such powers; affects a stated result.

GLX26 §5.1 ¶14 (identity component as Tannakian group) is not an error: over a finite K/Q̆_p the closure is connected, as §0.7 now proves. The `sourceIssues` entry `PadicHodgeTheoryPartII/E1` of `packages/PadicHodgeTheoryPartII/design/plan.json` still records it as one and should be withdrawn by whoever maintains the errata register.

## For the human reviewers

- **Scope.** §1.2, §§3.4–3.5 and §4.1 state corrected forms of GLX26 Proposition 5.7, Proposition 6.7 and Lemma 6.12 (`packages/PadicHodgeTheoryPartII/README.md` lines 279, 450, 482), and §0.7 a connectedness statement of the roadmap's own (line 230); no refereed source states them in this form.
- **Licence.** `packages/PadicHodgeTheoryPartII/sources.toml` records MilneiAG, fetched from the author's page, and Serre79, whose Numdam copy reserves rights to the Société mathématique de France, both as `open-repository`.
- **Not tested.** The published text of GLX26 was not read; wording and arrangement were compared with arXiv v3 only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1c4f5337d47c4d4cc810b5f4f3bac6ae055fc5dc", "job": "RT-PadicHodgeTheoryPartII~2b", "model": "fable", "worker": "chris-x79"} -->
