# Review of PadicHodgeTheoryPartII (pull request #2412 at b7f4b9b)

**Verdict:** needs changes

## Previous findings

The previous review, of this same head, raised no finding; the four it recorded as repaired (`birkhoffSum` in §0.2, the pinned derived-image equality in §3.4, the μ^◇ agreement in §1.5, the description's validation sentence) were read again at README:141, :455, :321 and in the description, and stand.

## R01 (P3) — a pinned Mathlib statement is described as giving finite extensions

**Location:** `TauCetiRoadmap/PadicHodgeTheoryPartII/README.md`:43, used at :423: "`Algebra.FormallyEtale.iff_exists_algEquiv_prod` … identifies a formally étale, essentially finite type algebra over a field with a finite product of finite separable field extensions."

**Claim:** The pinned declaration concludes only that each factor is separable. Finiteness of the factors, which §3.1 needs to make K finite over Q̆_p, is provided by no declaration the README cites.

**Witness:** At the pin (`Mathlib/RingTheory/Etale/Field.lean`:194) the conclusion is `∃ I, ∃ (_ : Finite I), ∃ Ai …, ∀ i, Algebra.IsSeparable K (Ai i)`; no `Module.Finite K (Ai i)`.

**Repair:** Replace the sentence at :43 by: "`Algebra.FormallyEtale.iff_exists_algEquiv_prod` (`Mathlib/RingTheory/Etale/Field.lean`:194, Stacks 02GL) identifies a formally étale, essentially finite type algebra over a field with a finite product of separable field extensions; it does not state that the factors are finite. `Algebra.FormallyUnramified.finite_of_free` (`Mathlib/RingTheory/Unramified/Finite.lean`:167) makes a formally unramified, essentially finite type algebra over a field finite over it, so each factor is a finite separable extension." Cite both in §3.1 where K is chosen, in its *Needs:* line and in the Layer 3 Dependencies. Tested: `#check @Algebra.FormallyUnramified.finite_of_free` elaborates at the pin to `[Algebra.FormallyUnramified R S] [Algebra.EssFiniteType R S] [Module.Free R S] : Module.Finite R S`.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §0.1 jump (sampled) | Fil = V (i ≤ −1), Ke₁ (0 ≤ i ≤ 2), 0 (i ≥ 3); v = 0 | e₁: 2; e₂: −1; e₁+e₂: −1 = min(2, −1); zero lies in every step, no jump | holds | none |
| §0.4 ω_s (sampled) | slope-½ block, s = 2; φ = pσ; b = [[0,p],[1,0]] | φ²(ae₁+be₂) = p(σ²a·e₁+σ²b·e₂), dim 2 over Q_{p²}; {φ^s x = x} = 0 but ω_s of dim 1; (bσ)² = pσ² | holds | none |
| §0.5 rank-one objects (sampled) | X(1,−1), s = 2; wraparound p·e₀; image w of e₀ | φ(a·e_{s−1}) = σ^s(a)p^k e₀ = a·φ(e_{s−1}); lines F(e₀+ce₁), cσ(c) = 1: t_H = −1 ≤ 0; wraparound p: t_N = 1 ≠ 0; p^{sλ}σ^s w_λ = p^k w_λ forces w ∈ V⊗Q_{p^s} | holds | none |
| §0.6 line criterion (sampled) | 𝔾_m, b = p^m, μ = z^m; b = 1, μ = 0 on V ⊕ 1 | e ∈ V^{1,m}, intersection 𝔾_m (vector-fixing model: 1); all lines of V ⊕ 1 stabilized ⇒ scalar 1 ⇒ trivial = H_cris | holds | none |
| §0.7 monodromy, connectedness (sampled) | 𝔾_m, m ≠ 0; unramified quadratic ε over Q_p; finite quotient W over F | ξ = χ^{−m}, H = 𝔾_m; ε: φ(e) = −e, H = μ₂; over F, σ(x) = −x solved by √u (√−3 at p = 2); slopes ≥ 0 with sum 0 ⇒ all 0 | holds | none |
| §1.1 generic filtration (sampled) | GL₂ standard and det; Res torus of Q₅(5^{1/3}) | Fil¹_gen = 0; Fil¹_gen det = det; 3 ∤ 4 so E⊗E = E × E(ζ₃), V ∩ weight-1 factor = 0 | holds | none |
| §1.2 threshold (sampled) | cubic torus, λ = e₁; GL₂ | pairings (1,0,0), m_O = 0 = direct value; formula over Gal(E/k) = {1} at e₁ gives 1; GL₂: 0 standard, 1 det | holds; source formula fails | none |
| §1.5 Galois average | Res of Q_{p³}; quartic torus e = f = 2, s = 2 | ((1⊗σ)w)_τ = σ(w_{σ⁻¹τ}), e₁ ↦ e_σ; Σ_i ⟨w₀λ, σ₀^{−i}μ̄⟩ = s⟨w₀λ, μ^◇⟩; μ^◇ = ¼Σe_τ with σ₀² ≠ 1 | holds | none |
| §1.6 Newton inequality (sampled) | GL₂, ν = (a,b), a ≥ b; torus | ⟨(0,1), ν⟩ = b ≤ k/s ∈ {a, b}; torus: equality | holds | none |
| §2.3 generic admissibility (sampled, headline) | GL₂, b = diag(p,1), μ = (1,0); Abel sum on jumps (1,0) | flag Ke₂: t_H = 1 > 0 = t_N; generic: Fe₂ 0 ≤ 0, Fe₁ 0 ≤ 1, total 1 = 1; t_H = A·r + Σ dim(D′∩Fil^i) = dim(L∩ℓ_x) | holds | none |
| §2.4 derived monodromy (sampled, headline) | GL₂ basic slope ½; GL₂ ordinary | d₂ ≤ 0 < 1 = k, V^{2,1} = ∅, c = ½; ordinary: c = 0, V^{1,0} = Q_p^×e₂, sandwich holds with ⟨λ, α^∨⟩ = 1, H in a Borel | holds; strictness needed | none |
| Conventions on s | f ∣ s; s ↦ ms; conjugation by g ∈ G(Q_{p^s}) | L·Q_{p^s}/Q_{p^s} has residue degree 1; (bσ)^{ms} = (msν)(p)σ^{ms}; (gbσ(g)⁻¹σ)^s = g(sν)(p)g⁻¹σ^s | holds | none |
| §3.1 generic point (sampled) | ℙ¹; n = 0; the pinned étale-over-a-field statement | t transcendental over E; K = FE; pinned conclusion `Algebra.IsSeparable K (Ai i)`, finiteness from `finite_of_free` | holds; contract wording wrong | R01 |
| §3.2 open-image point (headline) | torus; norm-one torus, μ = 0, κ(b) ≠ 0 | G_der = 1 automatic; π₁(T)_Γ = ℤ/2, [b] ∉ B(T,0), no point; open in H(Q_p) and G_der ⊆ H ⇒ open in G_der(Q_p) | holds | none |
| §3.3 Zariski density | 𝔾_m, 1+pℤ_p; O(2) ⊃ SO(2)(Q_p); diagonal in GL₂(ℤ_p) | closure 𝔾_m; closure SO(2) ≠ O(2); closure the torus ≠ GL₂ | holds | none |
| §3.4 central lifting (sampled) | GL₂ → PGL₂, J = SL₂, J = T; det, J = T | dim D(J°) = 3 = dim SL₂; J = T: hypothesis fails; det: f(T) ⊇ 1, T ⊉ SL₂ | holds; centrality needed | none |
| §3.5 z-extension (sampled, headline) | GL₂ → PGL₂; G × 𝔾_m → G | image of SL₂(Q_p) of index 4 (8 at p = 2), open; f(H̃°) connected of finite index in f(H̃) | holds | none |
| §4.1 torsor components (sampled, headline) | C = {1, diag(1,−1)}, g = [[1,1],[0,1]]; trivial ξ | gcg⁻¹ = [[1,−2],[0,−1]] ∉ C; the space of T_ξ is G(Q_p)/C, totally disconnected, so components are cosets | holds | none |
| §4.2 ambient stabilizers (sampled, headline) | Y a point; Y = T_y ⊔ (G(Q_p) × Spd K); trivial ξ, GL₂ | stabilizer G(Q_p); second summand: trivial stabilizers; {1} not open in SL₂(Q_p) | holds; hypotheses needed | none |

- Source locators checked against the cached texts: 42 (GLX26 22, Chen14 11, MilneiAG 4, Stacks 4, Serre79 1); every number, page and hypothesis agrees, including GLX26 lines 1303–1330, 1361–1440, 1501–1590, 1595–1720, 1998–2010, 2143–2186 and Chen14 lines 777–1066, 1133–1150, 1303–1397.
- Library declarations: 36 names `#check`ed in one scratch file with no error: the 28 of the contracts (10 Mathlib, 18 Tau Ceti), each at the file and line the README gives, and the 8 named in the `Suggested.lean` docstring; the `decide` values −3 and 2 of §0.2 confirmed. `Suggested.lean` declares nothing, so there is no signature to compare.
- Cross-roadmap citations resolved at main or the open head: 51 section, layer or heading ids in 16 roadmaps, all present; content read against the citation for PadicHodgeTheory, BunGAndNewtonStrata, HeckeStacksAndLocalShtukas, ArithmeticGaloisRepresentations §7.6, ReductiveGroupsPartII, ReductiveGroups Layers 7 and 10, DiamondsAndVStacks §§D3.10, D5.16, D6.3 and SchemeAndStackFoundations §2.3. Both gaps are in the plan under the same slugs, and neither supplier section already states its `needs`.
- Gate: every check 0, OK. Dependency check: `depcheck: 236 roadmaps, 2232 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean`: exit 0, no output. No change outside the folder.
- Headlines (§§2.3, 2.4, 3.2, 3.5, 4.1, 4.2): none statable at the pins (no B(G), filtered isocrystals over finite extensions of Q̆_p, crystalline representations, Fl_μ over the reflex field, diamonds); the docstring names each. No declaration, so no padding probe applies.
- Pull-request text against the head: no sentence contradicted; it says the roadmap is added, names the gaps and the suppliers.
- Overlap check: read AdmissiblePairsAndPadicHodgeStructures, BunGAndNewtonStrata, ReductiveGroupsPartIII, HeckeStacksAndLocalShtukas, PadicHodgeTheory, ReductiveGroupsPartII, ReductiveGroups, AdelicAlgebraicGroups; Serre–Sen openness → PadicHodgeTheory §4.4 (this roadmap and AdmissiblePairsAndPadicHodgeStructures §3.3 both declare a gap to it); Zariski closure of the crystalline image of a pair (b, μ) → here, §0.7 (the later AdmissiblePairsAndPadicHodgeStructures §§2.5, 3.3 treats pairs over C on its own carrier); μ^◇, B(G,{μ}) → BunGAndNewtonStrata; period towers → HeckeStacksAndLocalShtukas.
- Source independence: 14 passages compared with 5 sources, none shared beyond formulas; largest share GLX26, 43 of 66 locators; contents compared with GLX26: independent (Layers 2 and 3 both draw on its §5.3, Layer 1 on §5.2 and the proof in §5.3, Layer 3 also on §6.2; the order is forced by the *Needs:* lines §0.1 → §0.3 → §0.6 → §1.5 → §2.4 → §3.2 → §4.2).

## Not verifiable

- none

## Source issues

- **Error** in GLX26 at Proposition 5.7, equation (5.18), printed p. 36: the source says the generic step is cut out by pairings of the Γ_E-orbit averages of τ(λ) for τ in Gal(E/K); it should be the minimum over all Γ_E-orbits inside the Γ_K-orbit of λ, which differ when E/K is not normal; affects a stated result.
- **Misprint** in GLX26 at proof of Theorem 5.8, equation (5.34), printed p. 39: the source says each summand ⟨w₀φ₀^iλ, μ̄⟩ equals ⟨w₀λ, φ₀^iμ̄⟩; it should be φ₀^{−i}μ̄, the full-period sums agreeing after reindexing; affects nothing.
- **Misprint** in Chen14 at Lemme 3.3.5, printed p. 744: the source says the underlying space of a rank-one object is a sum of s lines over Q_{p^s}; it should be a sum of s lines over K_0; affects nothing.

## For the human reviewers

- none
