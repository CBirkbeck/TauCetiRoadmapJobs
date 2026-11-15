<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17136#issuecomment-6903346596 -->
Red team round 2 pass b (claude) of eb09c38

Verdict: needs_changes

1. **F01** (P3) §5.1: the fundamental domain of the smaller lattice is on the wrong side

   **Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/README.md:449`: "for a measurable
   fundamental domain F of Λ … and a set R of representatives of Λ/Γ, the set F·R is a fundamental
   domain of Γ of measure |R|·μ(F)".

   **Claim.** With the convention fixed three lines earlier (`README.md:446`: "Γ acting by left
   multiplication has a fundamental domain"; `IsLattice` uses `IsFundamentalDomain Γ s μ` for
   γ • g = γg; §5.3 uses p⁻¹(F) for the left action), F·R is a fundamental domain of Γ.

   **Witness.** L = Λ = S₃ (counting measure), Γ = {1, s}, F = {1}, R = {1, r, r²s}, representatives
   of the cosets Γ, rΓ, r²Γ. Then F·R = R and sR = {s, r²s, r}: the translates overlap and miss r² and
   rs. The formula is the one for the right action (the convention of WitteMorris2015 and of
   VonNeumannAlgebras Layer 9).

   **Repair.** Replace the clause by: "for a measurable fundamental domain F of Λ for left
   multiplication, of positive Haar measure because countably many translates of F cover L, and a set
   R of representatives of the right cosets Γ\Λ, the set R·F is a fundamental domain of Γ for left
   multiplication, of measure |R|·μ(F) by left invariance". In the first paragraph of §5.1, after
   "and any two Haar measures are proportional", add: "VonNeumannAlgebras Layer 9 takes fundamental
   domains for the right action; g ↦ g⁻¹ exchanges the two actions and preserves Haar measure, G
   being unimodular, so the two notions of lattice and of covolume agree." Tested on the witness:
   Γ\Λ has representatives {1, r, r²}, R·F = {1, r, r²} and s·{1, r, r²} = {s, sr, sr²}, a partition
   of S₃, of measure 3 = [Λ : Γ]·μ(F).

2. **F02** (P3) §10.5: the injectivity step assumes the fibre has two points

   **Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/README.md:789`: "if y ≠ y′ had
   the same image p, choose disjoint open U ∋ y and U′ ∋ y′; as f is closed, some V as above has
   f⁻¹(V) ⊂ U ∪ U′".

   **Claim.** Closedness of f gives a neighbourhood V of p with f⁻¹(V) ⊂ U ∪ U′.

   **Witness.** That needs f⁻¹(p) ⊂ U ∪ U′. If f⁻¹(p) = {y, y′, y″} (three boundary points of Y in
   one cusp end, the case the argument must also exclude), every f⁻¹(V) contains y″, which U ∪ U′
   need not contain.

   **Repair.** Replace the sentence by: "It is injective because Y is Hausdorff: if the fibre f⁻¹(p),
   a subset of the finite set Y ∖ X_Γ, had points y₁, …, y_k with k ≥ 2, choose pairwise disjoint
   open U_i ∋ y_i; as f is closed, some V as above has f⁻¹(V) ⊂ U₁ ∪ … ∪ U_k, and the connected set
   V ∖ {p} would be the disjoint union of its open parts in the U_i, each nonempty because X_Γ is
   dense near y_i." Tested on k = 3: the three parts are nonempty, open and disjoint, which the
   connectedness of V ∖ {p} excludes.

3. **F03** (P3) §10.4: statement (b) has no proof route, and the obvious one runs through §10.6

   **Location.** `packages/BallQuotientsAndComplexHyperbolicLattices/README.md:779`: "(b) for an
   arbitrary lattice Γ, (S_Γ, φ_Γ) of §9.5 is, up to unique isomorphism, the only quasi-projective
   model (S, φ) of X_Γ for which some torsion-free normal Γ′ ◁ Γ … admit a finite morphism S′ → S".

   **Claim.** The paragraph proves (a), (b) and (c); its `*Needs:*` line and `README.md:116` ("§10.4
   (b) the normality statement") list inputs for (b).

   **Witness.** The route after the citations begins "For (a)" and ends with the uniqueness of f in
   (a); nothing derives (b). The natural input, the finite morphism S_Γ′ → S_Γ, is §10.6, whose
   `*Needs:*` (`README.md:801`) names §§10.4–10.5: used for (b) it would be a cycle.

   **Repair.** Append to the route, before `*Needs:*`: "For (b), by (a) S′ is S_Γ′, the model of §9.5
   for Γ′. Take Γ″ ⊂ Γ′ neat, normal in Γ and of finite index (§6.4); by the independence statement
   of §9.5, S_Γ′ = S_Γ″/(Γ′/Γ″) and S_Γ = S_Γ″/(Γ/Γ″), so S_Γ = S_Γ′/F with F = Γ/Γ′, and S_Γ
   satisfies the condition. Conversely the finite morphism S′ → S is F-invariant on complex points,
   hence F-invariant, and factors through a finite morphism h: S_Γ → S (the categorical quotient of ShimuraVarieties §3.4a) with
   h^an = φ⁻¹ ∘ φ_Γ. So h is bijective on complex points, hence birational, and S is normal
   because S^an ≅ X_Γ is (gap:normality-analytification, §7.1); a finite birational morphism onto a
   normal variety is an isomorphism. Uniqueness is as in (a). (c) is §§7.1–7.2 composed with
   φ_Γ⁻¹." Tested on Γ = PSL(2,ℤ), Γ′ the image of Γ(2): S′ = ℙ¹ ∖ {0, 1, ∞}, F = S₃, S = 𝔸¹ and
   h = id; the route uses §9.5 only, not §10.6.

Three findings, all P3 (S01–S03): one left/right convention slip in a proof bullet, two proof-route
steps. No P1 or P2 finding survived the pass. Read in full:
`packages/BallQuotientsAndComplexHyperbolicLattices/README.md` (980 lines) and
`packages/BallQuotientsAndComplexHyperbolicLattices/Suggested.lean` (218 lines). No Lean was run.

## Round 1: verification of the earlier findings

| Earlier finding | Status | Witness at this head |
|---|---|---|
| 1a/F01 (P2), Selberg's lemma and "neat" below the sources | repaired | `README.md:36`: "the eigenvalues of Ad(γ) generate a torsion-free subgroup of ℂ^×"; `README.md:520`: "the subgroup … generated by the eigenvalues of g contains no nontrivial root of unity"; `Suggested.lean:190-192` and `:207-209` quantify over `Subgroup.closure {…}` with `IsOfFinOrder ζ → ζ = 1`. WitteMorris2015 line 3002 to line 3005 and line 3445 opened: they say what the README cites them for. Recomputed: diag(1/2, i, 2) has Ad-ratios 2i and i/2 with product −1, so ⟨γ⟩ is not `IsNeat`; γ^(2k) gives ⟨(−4)^k⟩, torsion-free. No residue of the old notion (searched "weaker"). |
| 1a/F02 (P3), §10.4(a) applied §10.3 to a target it does not cover | repaired | `README.md:779`: "§10.3 covers only maps into S_Γ^an, so compare each model with (S_Γ, φ_Γ) of §9.5". The criterion cited exists: ShimuraVarieties §3.3 proves that a morphism of smooth finite-type complex schemes with invertible analytic derivative, bijective on complex points, is an isomorphism (étale monomorphism, then surjective). The repair left (b) without a route: S03. |
| 1a/F03 (P2), wording of the two gaps | repaired | `design/plan.json` `gaps[0].needs` and `gaps[1].needs` are word for word the sentences of `README.md:116` and `README.md:124`; same slugs, supplier ComplexComparisonPartII, sections §C−1.2 and §C0.6. ComplexComparisonPartII §C0.6 at its head constructs the finite analytic normalization and its stalk description, and states neither gap. |
| 1a/F04 and 1b/F02 (P3), Mostow locator for cocompactness | repaired | `README.md:481` now cites line 95 and line 3096. Mostow1980 line 95 and line 3096 opened: each says that the lattices of the family that are not cocompact are arithmetic. |
| 1b/F01 (P3), locator of the definition of an arithmetic lattice | repaired | `README.md:821`: "BaldiUllmo2023 line 280 to line 284, which states the definition with p defined on the whole of 𝐆(ℝ)". Opened: line 280 to line 284 is that definition. `design/plan.json` keeps the old locator outside `gaps`, which the package stage does not edit; not raised. |
| 1b/F03 (P3), two `*Needs:*` lines | repaired | `README.md:918` ends "10.2–10.3, 10.6, 12.1; …"; `README.md:928`: "10.6 (the finite morphism S_Γ′ → S_Γ, for the reduction to a neat subgroup), 12.1". |

No repair introduced a false statement. The strengthened `selberg_lemma` was recomputed on ι = ∅
(characteristic polynomial 1, no root, closure trivial), on ⟨diag(2, −1/2)⟩ (Λ′ = Λ fails because
2·(−1/2) = −1; the route with 𝔞 = 15ℤ[1/2] gives ⟨g⁴⟩, since 2 has order 2 modulo 3 and 4 modulo 5)
and on the characteristic-p example (eigenvalue groups ⟨t^k⟩).

## Dependency check

    depcheck: 237 roadmaps, 2251 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The roadmap is line 122 of `merge-order/ORDER.txt`.
RealSemisimpleLieGroups is an open pull request of another author that adds a new roadmap folder;
it has no line in the merge order. ShimuraCompactifications (line 170, later) and GeometricTopology
occur only in the scope demarcation and under Downstream consumers, in no `*Needs:*` line and in
no supplier contract.

## The pass: `Suggested.lean` (16 declarations)

One namespace, `open Matrix MeasureTheory Metric Set`, no `variable` and no `include`: every binder
is in the declaration's own signature. The elaborated types of the job's signature file were
compared with the README statements one by one (its entry `of`, line 100, is the word "class" of a
docstring, not a declaration); `#check` was not run.

| Declaration (line) | Context | Instances and values | Result |
|---|---|---|---|
| `indefiniteUnitaryGroup` (58) | `(n : ℕ)`, `Subgroup (GL (Fin 1 ⊕ Fin n) ℂ)` | h_t: diagonal cosh² − sinh² = 1, off-diagonal i·cosh·sinh − i·sinh·cosh = 0; S: SᴴJS = −J; 2·1: 4J; n = 0: U(1) | real body, determines U(1,n) |
| `projectiveUnitaryGroup` (82) | `(n : ℕ)`, quotient by `Subgroup.center` | n = 0: abelian, quotient trivial; i·1 ↦ 1; JgJ = λg forces a = λa, so λ = 1 since \|a\|² − \|c\|² = 1 | sound |
| `ballMap` (90) | `{n}`, any `g : GL` | h_t·0 = −i sinh t / cosh t; diag(2,1): w/2; scalar: identity; \|a\| > \|b\| on U(1,n) | sound |
| `biholomorphic_ball_iff` (101) | `(n)`, `f` on `EuclideanSpace ℂ (Fin n)` | n = 0: ball = {0}, both sides true, unique class; w/2: both false; two lifts g, λg: one class | true as typed |
| `ballDist` (116) | `{n}` | 0, (1/2,0): 1/√(3/4) = 2/√3, arcosh = (1/2) log 3, distance 0.7768; argument ≥ 1 by (1 − ab)² − (1 − a²)(1 − b²) = (a − b)² | sound |
| `IsParabolic` (123) | `{n}`, on a lift | T_t: fixed set the line {w₂ = 1}, on the sphere only b₀; identity fixes B; a_s: two sphere points; three null eigenlines force a positive one | sound |
| `margulis_lemma` (131) | `(n)`; order ∃ε ∃m ∀Δ ∀x | n = 0 trivial; C_m: index 1; S₃ ⊂ U(2): A₃, index 2; coset chain C₀ ⊊ … ⊊ C_m needs m + 1 cosets against ≤ m translates; left cosets pΛ₀ with p⁻¹p′ ∈ V⁻¹V | true as typed |
| `IsLattice` (144) | `{n}`, Haar measure existential | trivial Γ, n ≥ 1: μ(G) = ∞; n = 0: lattice; ⟨T_1⟩: (ε⁻¹ − 1)/2 → ∞; σ-algebra Borel (comap on units, subtype, Suslin on the quotient) | sound |
| `IsCuspPoint` (152) | `{n}` | PSL(2,ℤ): ∞; n = 0: sphere empty | sound |
| `IsLattice.exists_finset_cuspPoint_orbits` (160) | `{n} {Γ}`, `hΓ` | PSL(2,ℤ): F = {∞}; cocompact or n = 0: F = ∅ | true as typed |
| `IsLattice.compactSpace_quotient_iff` (169) | `{n} {Γ}`, `hΓ` | n = 0: compact, no cusp; PSL(2,ℤ): neither; cocompact: inf of displacement attained, no parabolic | true as typed |
| `IsLattice.isFinitelyPresented` (175) | `{n} {Γ}`, `hΓ` | n = 0: trivial group; [F₂,F₂]: infinite rank, infinite covolume | true as typed |
| `selberg_lemma` (187) | `F : Type*` field, `ι` finite, `Group.FG Λ` | see round 1; Γ(3): traces ≡ 2 mod 3 exclude −2, 0, 1; e ∈ 𝔐 forces ℓ ∣ e; d = ℓ₁^a = ℓ₂^b gives d = 1 | true as typed |
| `conjugationMap` (197) | `ι` finite, `GL ι ℂ` | mulLeft g ∘ mulRight g⁻¹ = (X ↦ gXg⁻¹); scalars give the identity | sound |
| `IsNeat` (205) | `{n}`, all lifts | n = 0: closure {1}; diag(1, e^{2πi/3}, 1): not neat; diag(1/2, i, 2): −1 in the closure | sound, equals `Neat.IsNeatAut` on Ad |
| `IsLattice.exists_neat` (213) | `{n} {Γ}`, `hΓ` | n = 0: Γ; PSL(2,ℤ): image of Γ(3), λ² never a nontrivial root of unity | true as typed |

Headlines (`README.md:7`): seven stated; the others (§§3.3, 7.1, 8.2, 9.3–9.5, 10.2–10.5,
11.3–11.4, 12.2–12.4) are named in the module docstring with the missing carrier. By object,
neither pin has complex-analytic subsets, complex analytic spaces, an analytification functor, an
indefinite unitary group, a lattice predicate for groups, Selberg's lemma or a Zassenhaus or
Margulis lemma outside `TauCeti/Analysis/Complex/Fuchsian/`. One-tactic probe: none of the seven
theorems follows from a pinned lemma or restates a definition; the nine definitions are each used
by a theorem. No padding, no `example`, no `set_option`, a single `import Mathlib`.

## The pass: README targets (57)

| Target | Instances and values | Result |
|---|---|---|
| Conventions | (1,0)(i,0) = (1+i, −2), commutator T₋₄; g = \|dv\|²/(2y²) on u = 0, ℓ(a_s) = √2 log s, T_t: √2 arcsinh(\|t\|/2y); ρ∘C = (1 − \|w\|²)/\|1 − wₙ\|² | consistent |
| 1.1 | z = (1, i/2), w = (1, 1/2): 1 + i/4 against 1 − i/4; ⟨z,z⟩ = 3/4 | sound |
| 1.2 | diag(1, e^{iθ}, 1): five 1, two e^{iθ}, two e^{−iθ}; h_t: e^{2t}, 1, 1, e^{−2t}; closed image c = lim\|λ_k\|² > 0 | sound |
| 1.3 | C(0,1/2) = (0,3i), ρ = 3; C(0,2) = (0,−3i); C⁻¹: 1 − wₙ = 2i/(v+i) | sound |
| 1.4 | Y_uY_v = diag(uᴴv, uvᴴ); diag(a,A)Y_v diag(a,A)⁻¹ = Y_(āAv); exp(tY_(−ie₁)) = h_t; [Y_(e₁),Y_(ie₁)] = diag(2i, −2i e₁e₁ᴴ); n² + 1 < n² + 2n | sound |
| 1.5 | (p+iq,t) ↦ (p,q,−t/4+pq/2): z + z′ + pq′; C(tanh τ·eₙ) = (0, ie^{2τ}); M = [diag(a,D′,a)]; 1+1+3 = 8−4+1 | sound |
| 1.6 | C(−w) = −1/C(w); order 4 in SL₂(ℝ), 2 in PSL₂(ℝ) | sound |
| 2.1 | (w − 1/2)/(1 − w/2): tanh t = −1/2; w/2: derivative 1/2; z + z² on ℂ | sound |
| 2.2 | h(e₁,e₁) at (1/2,0) = 4/3 + 4/9 = 16/9, g = 32/9 both ways; volume 2ⁿ det h; π/6, 2π/3 | sound |
| 2.3 | n = 1: ‖dw‖² = (1−\|w\|²)², iΘ(K_B) = +2ω; Killing −1/3, −1/12 times 6 = −2, −1/2 | sound |
| 2.4 | d(0, tanh t e₁) = √2\|t\|; boost: (0,1/2) ↦ (1/2,4/5), (3/5)/(3√3/10) = 2/√3; ratio √(2(n+1)) | sound |
| 2.5 | (ζ,ζ)/√2: 1; (ζ/2,ζ/2): 1/√2 | sound |
| 3.1 | {w₁ = 1/2}: (3/4)\|z₀\|² − \|z₂\|²; m = 0: point; kernel of r_W compact | sound |
| 3.2 | p = (1/2,0), T = ℂe₂: W = {z₁ = z₀/2}; {w₂ = w₁²} not in {w₂ = 0} | sound |
| 3.3 | n = 1: only B; two lines: reducible; Y = closure of Y^reg ⊂ 𝔹(W) | sound |
| 3.4 | positive eigenlines lie in the one eigenspace of signature (1,·); diag(1,ζ,ζ): only 0 | sound |
| 4.1 | two null eigenvectors: λ̄μ = 1; \|λ\| = 1 gives a positive eigenvector; Jordan block: λ̄⟨v,v⟩ = 0 | sound |
| 4.2 | T_t at ρ = \|t\|/2: √2 arcsinh 1; n_(a,0) at (0,iy): arcosh(1 + \|a\|²/2y) ≈ \|a\|/√y | sound |
| 4.3 | a_(1/2)^k T_1 a_(1/2)^(−k) = T_(4^(−k)); conjugates (s^k ma, s^(2k)t) distinct | sound |
| 4.4 | see `margulis_lemma`; preimage of Δ in SU(1,n) discrete, kernel μₙ₊₁ | sound |
| 4.5 | ⟨n_(1,0), n_(i,0)⟩ ∋ T₋₄, Λ = ℤ[i]; isotropic real subspace of dimension ≤ n − 1 | sound |
| 5.1 | π/6, index 6 gives π; strip (ε⁻¹−1)/2; F·R on S₃ | S01 |
| 5.2 | w ↦ −w: Γ₀ of order 2; irrational rotation: infinite stabiliser | sound |
| 5.3 | (2(n+1))ⁿ volume ratio; ∫_N^∞ ρ^(−(n+1)) dρ < ∞ | sound |
| 6.1 | zᴴHz = 2(Im v − \|u\|²); R̃, T̃ of determinant 1; √2 arcsinh(1/2000) = 0.000707107; ⟨R,T⟩ ≅ C₂ × ℤ; the Siegel sets of BaldiUllmo2023 are at a Γ-rational parabolic (line 617) | sound |
| 6.2 | γF ∩ F ≠ ∅ finite: Γ_b on a relatively compact region of a horosphere, others by precise invariance; WitteMorris2015 line 2754 to line 2759 has these hypotheses | sound |
| 6.3 | see `selberg_lemma` | sound |
| 6.4 | γ = m·η: eigenvalues those of m; γ^(2k): 1, (−4)^(±k), 16^(±k) | sound |
| 7.1–7.4 | w ↦ −w: cone (n = 2), w² (n = 1); (w₁, w₂²) smooth; Γ(3): index 12, four cusps, genus 0 | sound |
| 8.1 | \|q\|² = e^(−4π Im v/τ); exponent defect −(4π/τ)i Im⟨a,a′⟩ against χ(a+a′)/(χ(a)χ(a′)); τ = 4λ², χ((1+i)λ) = −1; ρ > N ⇔ μ < e^(−4πN/τ) | sound |
| 8.2 | πH_b(u,a) + πH_b(a,a)/2 = −(4π/τ)⟨a,u⟩ − (2π/τ)\|a\|²; E′(iλ,λ) = 1; degree of L_b⁻¹ = 1 | sound |
| 8.3 | log‖(u,q)‖ = −(2π/τ)ρ; n = 1: i dq∧dq̄/(4\|q\|² log²\|q\|) | sound |
| 8.4 | dq/q + d log e_a(u) wedge du = dq/q wedge du; r⁻¹(−log r)^((ℓ−1)(n+1)) divergent iff ℓ ≥ 1; K\|T = K_T ⊗ N⁻¹ | sound |
| 8.5 | β∧β = 0; ∫ dr/(r log² r) = 1/(−log δ) | sound |
| 9.1 | e^(−φ) = \|z\|^(−2n−2) forces a zero 1-jet of u; deg K^ℓ ≥ 2g + 1; g = 2, ℓ = 2: 4 < 5 | sound |
| 9.2 | Γ(2): E = O(1), ℓ + 1, O(ℓ − 3), ℓ − 2 = dim S_(2ℓ)(Γ(2)); ∂̄(χν^ℓ) compactly supported in X | sound |
| 9.3 | E^ℓ trivial near T_b, sections constant there | sound |
| 9.4 | Φ_ℓ\|X proper injective immersion onto Z ∖ {ζ_b}; local irreducibility at ζ_b | sound |
| 9.5 | PSL(2,ℤ): ℙ¹, 𝔸¹; (w₁², w₂²); π₁ of a punctured neighbourhood = Γ_x | sound |
| 9.6 | Γ₀(11): (−1/11) = (−3/11) = −1, 1 + 12/12 − 2/2 = 1 | sound |
| 10.1 | 2πr/(√2 r\|log r\|) = √2π/\|log r\| | sound |
| 10.2 | exp(1/z) into the j-line | sound |
| 10.3 | exp: 𝔸¹ → ℂ not algebraic | sound |
| 10.4 | (a): S₂ ≠ S_Γ, f = g₂⁻¹g₁; (b): no route | S03 |
| 10.5 | Γ₀(2): 1 + 3/12 − 1/4 − 1 = 0, ℂ*; six points, not Hausdorff; nodal cubic; fibre of three points | S02 |
| 10.6 | degree 6, 12; index 24 in SL₂(ℤ); a parabolic of Γ has a power in Γ′ | sound |
| 11.1 | A⁻¹gA = [[a, b/2],[2c, d]]: Γ⁰(2), index 3; PGL₂(ℤ) ⊃ PSL₂(ℤ) index 2; commuting normal images: one is G | sound |
| 11.2 | SL₂ isotropic; a definite place makes the form anisotropic | sound |
| 11.3 | \|det g\|² = (−1)^(n+1): −1 for n = 2, 1 for n = 1; Ad(h₀(z)) = z/z̄ on 𝔭⁺; compact adjoint real groups are connected, so C = C⁺ | sound |
| 11.4 | ⟨f(0), f(ζ)⟩ ≡ 1 forces f constant; bidisc has boundary discs | sound |
| 11.5 | Im(Zₙ conj Z₀) − \|Z′\|² = \|z₀\|² − \|z₂\|² − \|z₁\|² in y-coordinates | sound |
| 12.1 | Z = S_Γ special; points excluded | sound |
| 12.2 | h parabolic on W and unitary on W^⊥ is parabolic in G (a positive eigenvector would project to one in W) | sound |
| 12.3 | image of a non-lattice sub-ball: a closed algebraic image would be totally geodesic, hence special | sound |
| 12.4 | Q = B × {s}: 0 = 1 − 1; B × S_Γ: n = 2n − n; {x₀} × S_Γ: 0 = n − n | sound |

## Verified sound

- Declarations read: 16 of 16. Targets read: 57 of 57. Checks read: 224 (60 blocks); about 150
  recomputed in this pass (the values above), the others read; none false, vacuous or a
  restatement; every definition has at least three.
- Pinned declarations opened in this pass, 11 `file:line` pairs, all exact:
  `Ideal.height_le_spanFinrank`, `Ideal.exists_ideal_over_maximal_of_isIntegral`, `IsJacobsonRing`,
  `isJacobsonRing_of_finiteType`, `finite_of_finite_type_of_isJacobsonRing`,
  `TauCeti.riemannianVolume`, `Group.IsFinitelyPresented`,
  `ProperlyDiscontinuousSMul.finite_stabilizer'`, `Complex.dist_le_div_mul_dist_of_mapsTo_ball`,
  `Subgroup.FiniteIndex`, `Real.arcosh`. Mathlib's `Submodule.IsLattice` is a different notion in
  another namespace.
- Sibling citations resolved at main or at the open head: RealSemisimpleLieGroups §5.7 (read in
  full: the contract of `README.md:78` agrees clause by clause, the Killing values −1/3 and −1/12
  included) and its headings §§3.1, 5.2, 5.3, 5.4, 5.6; ShimuraVarieties 13 headings (§§P.1, P.2,
  P.6, 0.1, 0.4, 0.5, 1.2, 2.1, 2.2, 2.7, 3.3, 3.4a, 3.5) and the text of §3.3;
  ComplexComparisonPartII 9 headings, 11 declaration names and the text of §§C0.6 and C1.4;
  AdelicAlgebraicGroups §3.4 (arithmetic lattices in a real Lie group, `Reduction.levelArithmetic`,
  `Reduction.arithmetic_finite_volume_iff`) and §4.3 (`Neat.IsNeatAut`: eigenvalues generate a
  torsion-free subgroup of ℂ^×); AbelianSchemesAndArithmeticModuli §A5.3 (`appellHumbert`: H linear
  in the first variable, factor α(λ)exp(πH(z,λ) + πH(λ,λ)/2), c₁ = −E); VonNeumannAlgebras Layer 9
  (lattices, fundamental domains for the right action: S01). All exist with the cited content.
- Ownership: `roadmaps grep` over the open heads and main for `IsLattice`, `IsNeat`, Selberg,
  Margulis, `indefiniteUnitaryGroup`, `IsParabolic`, `IsCuspPoint` in `Suggested.lean` files: no
  second declaration of any of the 16 names and no second owner of the objects. The overlap list
  names no roadmap close in results.
- Declared gaps: both precise, both absent from the supplier's head, same slug in
  `design/plan.json` and in the README.
- Source locators: 83 cited passages opened in the cached texts (WitteMorris2015 21,
  BaldiUllmo2023 25, Mok2012 12, MilneSVI 13, Kiernan1972 4, Deng2020 3, Mostow1980 4,
  DeligneMostow1986 1); each supports what it is cited for. BaldiUllmo2023 Theorem 3.4.3 is stated
  for Siegel sets of a Γ-rational parabolic subgroup (line 617), as §6.1 (2) restates it.
- Policy: the pull request changes only the package folder (nine files); no pull-request number
  or process narrative in the README or the docstrings; `theorem` throughout; no `set_option`; no
  algorithm; every target has a locator.
- Copyright. Wording: 17 passages set beside their sources (§4.1 with Mok2012 line 331 to line
  335; §8.1 with line 138 to line 180; §8.3 with line 295 to line 302; §9.1 with line 495 to line
  514; §9.3 with line 546 to line 562; §5.1 with WitteMorris2015 line 1893 to line 1895; §5.2 with
  line 18549 to line 18561; §6.3 and the docstring of `selberg_lemma` with line 2972 to line 3005;
  §11.1 with line 3732 to line 3739 and BaldiUllmo2023 line 280 to line 284; §6.1 (2) with line 649
  to line 655; §12.1 with line 49 to line 50 and line 468 to line 473; §12.4 with line 91 to line
  97; §10.1 with Kiernan1972 line 57 to line 75; §10.2 with line 111 to line 116 and MilneSVI line
  1746 to line 1748; §10.3 with line 1742 to line 1769; §11.3 with line 2381 to line 2392). The
  longest shared run is six words, in the eigenvalue condition, which the mathematics fixes.
  Arrangement: BaldiUllmo2023 has the largest share; its sections (introduction, lattices and
  arithmeticity, real Shimura data, the ball, toroidal compactification, Siegel sets, Hodge theory)
  correspond only to parts of Layers 3, 8 and 6, in another order; Mok2012 (§§1.1–1.3, 2.1–2.2)
  covers Layers 8–9, which split and reorder it. Reuse: no table, figure or list is taken over; the
  seven parameter values of Mostow1980 Theorem 17.3 are not reproduced.

Source independence: 17 passages compared with 6 sources, none shared; largest share BaldiUllmo2023, 38 of 131 locators; contents compared with BaldiUllmo2023 and Mok2012: independent.

## Not verifiable

- Goldman1999, Raghunathan1972, Borel1969, Borel1972, Alperin1987, BailyBorel1966, SiuYau1982,
  Cartan1957 (uncertified) and GarlandRaghunathan1970 (waived): the texts were not read. Borel1969
  Corollary 17.7 and Raghunathan1972 Theorem 6.11 are confirmed as locators by WitteMorris2015 line
  3445, and the two Garland–Raghunathan theorems by BaldiUllmo2023 line 656 to line 658.
- §10.2: that the proofs of Kiernan1972 Theorems 1 and 2 go through with d_Γ in place of the
  Kobayashi distance was checked at the statements and the definition (line 57 to line 75, line
  111 to line 116, line 157 to line 160), not through the proofs.
- Mok2012 was read in the preprint the README names; its numbering was not compared with the
  published volume.
- Elaboration: no Lean was run; the elaborated types are those the worker produced for this head.
- RealSemisimpleLieGroups, ShimuraVarieties and ComplexComparisonPartII were read through
  `roadmaps show`, their folders not being among the listed checkouts.

## Source issues

- **Error** in Mok2012 at §1.1, equation (5), printed page 5 (line 173): the source says every element of the cusp group has vertical part an integer multiple of τ; it should allow τ/2 modulo τ, giving a factor ±1 in the multiplier of equation (6); affects a stated result.
- **Error** in Mok2012 at §1.3, printed pages 8–9 (line 349 to line 354): the source says the parabolic isometries fixing a boundary point, with the identity, are exactly the unipotent radical; it should allow parabolic elements with a rotation part, absent for neat lattices; affects a stated result.
- **Misprint** in Mok2012 at §2.2, proof of the Main Theorem (line 604): the source says E is the canonical bundle twisted by the inverse of the boundary divisor bundle; it should be the twist by the divisor bundle itself, as in the Main Theorem (line 550); affects nothing.
- **Misprint** in MilneSVI at Remark 3.13, printed page 39 (line 1727 and line 1734): the source says two successive items both carry the label (c); it should label the second (d); affects nothing.
- **Error** in BaldiUllmo2023 at §3.2 (line 500 to line 502): the source says the stabiliser of a sub-ball is isomorphic to the product of PU(1,m) and a compact group; it should be the image of U(W) × U(W^⊥), which maps onto PU(1,m) with compact kernel; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "eb09c38c6847f9e237d7d5f27ee4f547a341dd03", "job": "RT-BallQuotientsAndComplexHyperbolicLattices~2b", "model": "fable", "worker": "chris-x55"} -->
