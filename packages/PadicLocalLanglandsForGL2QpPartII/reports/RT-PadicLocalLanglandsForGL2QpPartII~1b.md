<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13092#issuecomment-6907850873 -->
Red team round 1 pass b (claude) of 82e78e7

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) One symbol M (and LL(M)) for two modules that differ by the shift [1]; the dictionary does not state the shift, and §7.2 is off by an unramified twist when read with the Conventions

   **Location.** `README.md:240` (§0.4(a)): "D_pst(V)[1] ≅ M for every V with Π(V) ∈ V(π), and M(π) and M agree up to the twist fixed by the base roadmap §1.7." `README.md:448` (§2.4): "Let M be a supercuspidal rank-two (φ,N,G_ℚ_p)-module … For M = M(π) with π as above, Δ is N_rig(π)". `README.md:1148` (§7.2): "For every supercuspidal M ∈ ΦNᵖ_n the same holds on M^p_n".

   **Claim.** Conventions (*Types*) and §§0.3, 3.3, 4.x use the CDN module M, with D_pst(V) ≅ M[−1] and LL(M) = π (CDN20 line 249). §2.4 uses Colmez's module, M = D_pst of the (φ,Γ)-module, with Colmez's LL_p, and takes "M = M(π)". §7.2 then applies Π(M,·) and Δ_(k+1,ℒ) of §2.4 to "every supercuspidal M ∈ ΦNᵖ_n".

   **Witness.** PadicLocalLanglandsForGL2Qp §6.9(i) has D_pst(V) ≅ M(π); §0.4(a) has D_pst(V)[1] ≅ M. So M ≅ M(π)[1], φ differing by the factor p (README §0.3, Check 3, computes the same factor). Values on the two sides of §7.2 for a type M with LL(M) = π of central character ζ:

   - centre of G on O(s)(M^p_n)[M]: x^(−s)·ζ⁻¹ (twist a^(−s), and Z(G) acts on a JL(M)-multiplicity by the inverse central character);
   - centre on Π(M°,s−1)′_b⊗det⁻¹ for a Colmez module M°: (x^(s−1)ω)⁻¹·x⁻², with xω the central character of LL_p(M°). For M° = M[−1] = M(π): LL_p(M°) = π, ω = x⁻¹ζ, value x^(−s)ζ⁻¹. Equal.
   - for M° = M (the literal reading): LL_p(M) = π⊗(unramified character of value p^(±1) at p)∘det, so the value at a = p is off by p^(±2) ≠ 1. Not equal.

   The same clash makes "LL(M) = π … (Colmez's LL_p(M))" at `README.md:451` false for the LL of Conventions when M = M(π).

   **Repair.**

   1. Replace §0.4(a) by: "(a) D_pst(V)[1] ≅ M for every V with Π(V) ∈ V(π). The base roadmap §6.9(i) has D_pst(V) ≅ M(π), so M ≅ M(π)[1]: the two modules have the same underlying semilinear G_ℚ_p-module, hence the same M_dR, and φ on M is p times φ on M(π). The classical correspondence of the base roadmap §1.7 (Colmez's LL_p) is applied to M(π) = M[−1], and that of CDN20 to M; both give π: LL_p(M[−1]) = LL(M)."
   2. Replace the first sentence of §2.4 by: "Let M be a supercuspidal type as in Conventions and M° = M[−1] its module in the normalisation of the base roadmap §1.7 (§0.4(a)), so that M° = M(π) when LL(M) = π; M° is absolutely irreducible as a (φ,N,G_ℚ_p)-module. Let Δ = Δ(M°) be the (φ,Γ)-module over the Robba ring of Hodge–Tate weights (0,0) with D_pst(Δ) = M°. The objects Δ_(k,ℒ), Π(M,k) and LL(M) below are Colmez's Δ_(k,ℒ), Π(M°,k) and LL_p(M°) for this M°; M_dR is that of M and of M°." Then replace "For M = M(π)" by "For LL(M) = π" at its four occurrences in §2.4 (lines 448, 459, 461).
   3. In §7.2, after "For every supercuspidal M ∈ ΦNᵖ_n the same holds on M^p_n", add: "with Π(M,·) and Δ_(k+1,ℒ) those of §2.4, attached to M[−1]".

   Tested on the refuting instance: with M° = M[−1], ω = x⁻¹ζ and both sides of §7.2 have central character x^(−s)ζ⁻¹; at s = 0 this is the dual of Π(M,−1)⊗det with central character x⁻²ζ·x² = ζ, as §3.3(i) requires.

2. **F02** (P2) §1.2 hands the bijectivity of ∂ to a supplier step that itself consumes §1.2's own first statement

   **Location.** `README.md:280` (§1.2): "If moreover V is de Rham, ∂ = t⁻¹∇ is bijective on N_rig(V). This is DLB17 Proposition 6.4 (line 1259) and is supplied by PadicDifferentialEquationsAndRigidCohomology §RD.2.43, application step."

   **Claim.** The bijectivity is a supplier's result; this roadmap only cites it.

   **Witness.** PadicDifferentialEquationsAndRigidCohomology §RD.2.43, proof sketch, step 4: "DLB Lemma 6.3 gives ∂-injectivity using t^hN⊂D_rig … Applying the same result to V̌ and perfectness for surjectivity gives their Proposition 6.4." That roadmap has no target for DLB17 Lemme 6.3 (no other occurrence in its README); the lemma is the first statement of §1.2 here, in a roadmap later in the merge order. TriangulineVarietyAndItsLocalModel (README line 20) already records "PadicLocalLanglandsForGL2QpPartII §1.2 owns" both statements.

   **Repair.** Replace the two sentences by: "If moreover V is de Rham, prove that ∂ = t⁻¹∇ is bijective on N_rig(V) (DLB17 Proposition 6.4, line 1259). Injectivity: choose h with t^hN_rig ⊂ D_rig; then (∇−h)(t^hx) = t^(h+1)∂x, and ∇−h is injective on D_rig(V) by the first statement at P = X−h. Surjectivity: V̌ is again absolutely irreducible, two-dimensional, de Rham and nontrianguline, so N_rig(V̌)^(∂=0) = 0 by the same argument, and the perfect residue pairing of PadicDifferentialEquationsAndRigidCohomology §RD.2.43 identifies N_rig(V)/∂N_rig(V) with the dual of that kernel. §RD.2.43 supplies the perfect pairing; the polynomial injectivity it quotes in its application step is the first statement here." The `*Needs:*` line is unchanged.

   Tested: at weights {0,1}, h = 1 and (∇−1)(tx) = t∇x = t²∂x, the computation of §1.2, Check 3; for the rank-one trivial equation the kernel of ∂ contains 1 and the argument correctly does not apply (Check 1).

3. **F03** (P3) §3.1(a) uses "Π^an/π has no nonzero smooth vectors" with no owner

   **Location.** `README.md:508`: "its dual H¹_dR,c(Σ_r)^ρ → Π^an/π goes from a smooth representation (the smoothness above) to one without nonzero smooth vectors."

   **Claim.** The quotient Π^an/Π^lisse has no nonzero smooth vector.

   **Witness.** DLB17 line 1207 leaves this as an exercise. No target of Layers 0–3 states it, and the `*Needs:*` line of §3.1 (`README.md:526`) lists §§0.2 and 2.1 only. §3.3 reuses the step for nontrivial ζ ("as in the proof of (i) and §3.1(a)", `README.md:562`).

   **Repair.** At `README.md:508` replace "to one without nonzero smooth vectors" by "to one without nonzero smooth vectors: Π^an/π is topologically irreducible (§2.3; for a general central character, COLMEZ19POIDS Théorème 0.3(ii) with Théorème 0.6(iii), as in §2.4(ii)), its smooth vectors are the closed G-stable subspace killed by gl₂, and it is not smooth, since u⁺ acts on its dual E_π ⊂ tN_rig(π)⊠ℙ¹ by multiplication by t on both charts (§§1.5 and 2.1), which is injective". Add §2.3 to the `*Needs:*` lines of §3.1 and §3.3, and §2.4 to that of §3.3. No cycle arises: §§2.3 and 2.4 need only Layers 0–1, §2.1 and the base roadmap.

4. **F04** (P3) §4.10(c) drops the central-character hypothesis of the supplier it cites

   **Location.** `README.md:763`: "(c) If Π is admissible unitary of finite length, then ((Π^an)′_b)^b = Π*." with `README.md:767`: "It proves (c) by the analytic universal-completion theorem of the base roadmap §2.5."

   **Witness.** PadicLocalLanglandsForGL2Qp §2.5: "For Π in the admissible finite-length unitary category with central character, the universal unitary completion of Π^an is Π." CDN23 line 2396 reduces (c) to that theorem and prints no central character (lines 2385–2386).

   **Repair.** In (c) write "If Π is admissible unitary of finite length with a central character". Every use satisfies it: Π_(M,ℒ) and St^cont⊗δ_G in §§4.10–4.13 are absolutely irreducible, and §4.11 applies (c) to a finite sum of analytic duals of such representations, summand by summand. Tested on the two instances of §4.10, Checks: Π = L (trivial central character) and Π = St^cont (trivial central character).

5. **F05** (P3) Two definitions have only two discriminating Checks

   **Location.** `README.md:659` (§4.4): "Both spaces vanish at V = 0." `README.md:1231` (§7.7): "The empty open has zero sections."

   **Witness.** Both hold for any additive functor, resp. any presheaf of vector spaces sending ∅ to 0 (for example with the wrong coefficients C(1), or without the collar limit). They leave §4.4 (H_M, H_C) and §7.7 (F_π) with two Checks that test the definition.

   **Repair.** Replace the §4.4 Check by: "For V = L(1), H_C(V) = (C(−1)⊗L)^(G_F) = 0 by Tate's theorem, while H_C(L) = F⊗L: the functor sees the Hodge–Tate weight, and C(1) in place of C would exchange the two values. For both characters H_M(V) = 0 (§4.6)." Replace the §7.7 Check by: "For U = ℙ¹(ℚ_p), V(U) is the whole tree and the sections are colim_i O(τ⁻¹(T∖B_i))^ρ. Restriction O(Σ_r)^ρ → F_π(ℙ¹(ℚ_p)) is injective, since every component of the smooth curve Σ_r meets every collar, and not surjective: its cokernel is the ρ-part of H¹_c(Σ_r, O) ≅ Ω¹(Σ_r)′ (DLB17 lines 2862–2865), nonzero by §3.1. A presheaf without the limit over collars would return O(Σ_r)^ρ." Values: Tate gives H⁰(G_F, C(j)) = 0 for j ≠ 0 and F for j = 0; Ω¹(Σ_r)^ρ ≠ 0 because it contains dO(Σ_r)^ρ and O(Σ_r)^ρ ≅ E_π ≠ 0.

Scope of the pass: every line of `packages/PadicLocalLanglandsForGL2QpPartII/README.md` (1285 lines, 51 numbered subsections) and of `packages/PadicLocalLanglandsForGL2QpPartII/Suggested.lean` (78 lines, no declaration) was read. Two findings are P2, three are P3. No finding re-raises a settled one: the last repair report marks nothing `not actionable in this package`.

Dependency check (run as the brief gives it, on this README, `--movable`):

    depcheck: 248 roadmaps, 2341 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The roadmap is in `merge-order/ORDER.txt` (line 383), after all fifteen suppliers it names.

## Verified sound

**Counts.** Declarations read: 0 (the file states none; `#check` comparison of elaborated types is vacuous, and no Lean was run). Targets read: 51 subsections, all bold statements. Locators verified against the cached texts: 71 (DLB17 38, CDN23 15, CDN20 9, COLMEZ19POIDS 6, TEI90 3). Checks tested: 202 read, about 130 with a computable value recomputed (the table below records the values). Sibling citations checked: 15 roadmaps, 58 section ids resolved at their current heads (main for SmoothRepresentationsOfLocalGroups, the open heads for the other fourteen), the statements read for 24 of them. Pinned declarations checked: 5 Mathlib theorems and the carrier names, at the pin.

**Adversarial table** (statement; instances; values on each side; result; change).

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| Conventions, levels | r = 1; n = 0 | 1+pO_D = 1+ϖ_D²O_D = K_D(2); Ǧ/K_D(0) = ℤ, mod p: ℤ/2 | holds | none |
| §0.1 deck group | p = 2, 3 | p²−1 = 3, 8 | holds | none |
| §0.1 ΦNᵖ for Sp⊗δ | δ(p) = −1; χ(p) = 1+p | Nrd(p) = p²: δ(p)² = 1 in; (1+p)² ≠ 1 out | holds | none |
| §0.2 H¹(p^ℤ, H⁰) = 0 | a_h = 1 | f_(h+2) − f_h = a_h, f₀ = f₁ = 0: f_h ∈ ℤ, norm ≤ 1 | holds | none |
| §0.3 shift | ℚ_p(1) | φ = p⁻¹ on D_cris; t_N(M[−1]) = −1 = t_H for jumps −1, 0 | holds | none |
| §0.3 line | V_(M,ℒ) | M_dR ∩ (B⁺_dR⊗V) = ℒ; Fil⁻¹ = M_dR, Fil¹ = 0 | holds | none |
| §0.4(c) | ℒ = Le₁ | e₁ ↦ (e₂ ↦ e₁∧e₂): image Le₂*⊗∧² | holds | none |
| §0.4(a), §§2.4, 7.2 | central character at a = p | see R01 | fails as written | R01 |
| §1.1 sandwich | weights {0,1}, {0,k}, jumps 0 and 1 | tN⁺+ℒ; t^kN⁺+ℒ; N⁺+t⁻¹ℒ | holds | none |
| §1.2 | trivial rank one; weights {0,1} | ∇1 = 0; (∇−1)(tx) = t²∂x | holds | R02 (ownership) |
| §1.3 third bullet | b = p⁻¹, m = 1, N = 2, k = 1 | Σ_(i<p²)ε(ix) = p·Σζ_p^(iu) = 0 on p⁻¹ℤ_p^×; general: Σu(i)(1−u(c)) ∈ (u(p^N)−1)·ℤ[u] | holds | none |
| §1.3 vs base §4.9 | base definition (two conditions) | (1−u(1))S_n = 1−u(pⁿ), so S_n^k diag(p^m,1)v = 0 gives (u(p^(n−m))−1)^k v = 0 | agree | none |
| §1.4 action | two elements of P | (a₁,b₁)(a₂,b₂): ε((b₁+a₁b₂)x)e^(t(b₁+a₁b₂)x)φ(a₁a₂x) | left action | none |
| §1.5 gl₂ | general a, b; (0,1); (1,2); X²−c | [u⁺,u⁻] = 2∇+1−k = a⁺−a⁻; Casimir (k²−4ab−1)/2: 0, 0, (4c−1)/2 | holds | none |
| §1.6 annihilator | V = L; weights {0,2} | constant term of fg: orthogonal tL_∞[[t]]; te pairs to 0, te ∉ t²N⁺ | holds | none |
| §2.2 covariance | w; u(b); aI₂; O(Ω) | w∂w = ∂⁻¹; ∂−b; (a²)⁻¹a² = 1; g′(g⁻¹z) = (a−cz)²/det g | holds | none |
| §2.4 central characters | k ∈ ℤ; trivial ζ | Π(M,−k)⊗x^k: x^(−k)ω·x^(2k) = x^kω; ω = x⁻¹; Π(M,−1)⊗det: 1 | holds | none |
| §2.4 étaleness | k = 1, 2 | det Δ_(k,ℒ)(p) = p^k·p⁻¹: 1, p; δ₂(p)² = p⁻¹ gives 1 | holds | none |
| §3.1 Lie action | O(k); Ω¹′ | a⁺ = u⁺∂+1−k, u⁻ = −∂²u⁺+k∂; dual of O(2)⊗det: a⁺ = ∂u⁺, a⁻ = −∂u⁺, u⁻ = −∂²u⁺, [∂,u⁺] = 1 | holds, equals DLB17 line 762–766 | none |
| §3.1 Ω¹ = O(2)⊗det | g general | d(g⁻¹z) = det g·(a−cz)⁻²dz | holds | none |
| §3.1 Checks | u(p⁻¹); O′ | (p 1; 0 p): divisors 1, p², distance 2; a⁺ = ∂u⁺−1 = −1 on ker u⁺ | holds | none |
| §3.3 uniqueness | A = diag(1,2) | fixes Le₁, Le₂, moves L(e₁+e₂) | holds | none |
| §3.3 Check, p = 7 | ω quadratic on 𝔽₇^× | θ = g³ on 𝔽₄₉^×: θ|𝔽₇^× of order 2, θ⁷ ≠ θ; squares on μ₆ have order dividing 3 | holds | none |
| §4.2 | δ₀−δ_∞, u(pⁿ) | g_nμ−μ = δ_(pⁿ)−δ₀, norm 1, → 0 on compacts | holds | none |
| §4.2, §4.12–4.14 special type | sector of π₀ | ω = δ⁻¹: G by δ_G⁻¹, Ǧ by δ∘Nrd, W by δ (geometric); diagonal centre δ(a²)⁻¹δ(a²) = 1 | consistent with ProetaleCohomologyOfPAdicCurvesAndTowers §7.1 | none |
| §4.3 | d = 2; d = 3, Ae₁ = e₃, Ae₂ = e₁+e₃ | det = λ₁λ₂; char. poly λ³ − zλ² − (x+y)λ − y, all coefficients free | holds | none |
| §4.5 Check | E = Le₁⊕Le₂ | cocycle lg·e₂ + lg²/2·e₁: c(gh) = c(g)+g·c(h) | holds | none |
| §4.6 (i) | shift | (D_pst(V*)⊗M)^(φ=p) = Hom(M*[1], D_pst(V*)), M[−1]* = M*[1] | holds | none |
| §4.9 | z on Ω; p^(−\|h\|) | unbounded; in ∏L, not in L⊗∏O_L | holds | none |
| §4.10 Check | ℓ(f) = f′(0), g = diag(p^m,1), F_m | gℓ = p^mℓ; ‖F_m‖ ≤ p^(−m), \|ℓ(F_m)\| = p^m | holds | R04 (hypothesis) |
| §5.6, §6.2 | Sp⊗δ; χ of order 3 at p = 7 | δ_M = δ⁻²; dual scalar η(a²)⁻¹ζ₃ | holds | none |
| §6.3 | DVR, χ(p) = 1+p; A a PID | traces differ; rank H ≤ 1, det φ a unit | holds | none |
| §6.6 Check | A = L⟨T⟩ | Ǎ/TǍ = 0, Ǎ[T] = L·ev₀ | holds | none |
| §7.1 cocycle | g, g′ | a′(a−cz) − c′(dz−b) = (aa′+bc′) − (ca′+dc′)z | holds | none |
| §7.2 row | aI₂; k = 1 | a^k on all three terms; p⁻³p⁴ = p = p⁻¹p² | holds | R01 (which M) |
| §7.3 Check | ϖ_K^(p²−1) = −p | y′^(p²−1) + (z−z^p)^(p−1) = ∏_(ζ^(p−1)=−1)(y′^(p+1) − ζ(z−z^p)) | holds | none |
| §7.5 | f = (1,−1) on Ω⊔Ω | primitives (z^j/j!, −z^j/j!); sector ϖ_D ↦ −1 | holds; DLB17 line 2797–2804 fails here | none |

**Lean versus README.** `Suggested.lean` has the single import, the namespace, no declaration, no `set_option`, no `sorry`. Its docstring names every end theorem of the README Summary and of Layers 2, 3 and 7 with the carriers each lacks. At the pins: no rigid-analytic Drinfeld tower, no étale cohomology of rigid spaces, no Banach or locally analytic representations of GL₂(ℚ_p), no Robba ring, no (φ,Γ)-modules, no Weil–Deligne types (grep of the pinned Mathlib and Tau Ceti; Tau Ceti's `TauCeti.LocallyAnalytic` is an untopologised direct limit of analytic stages on ℤ_p and makes none of the headlines statable). No headline is statable and absent. §4.3 and §6.3 are statable linear algebra but are auxiliary lemmas, not headlines; their absence is correct.

**Pinned declarations.** `Bornology.IsVonNBounded`, `NormedSpace.image_isVonNBounded_iff` (Bounded.lean:495), `WithSeminorms.isVonNBounded_iff_seminorm_bounded` (WithSeminorms.lean:659), `WithSeminorms.image_isVonNBounded_iff_seminorm_bounded` (:679), `WithSeminorms.banach_steinhaus` (Barrelled.lean:164, barrelled source) exist as the README describes them.

**Suppliers.** All 58 cited section ids exist under the cited titles. Statements compared and found to agree: PadicLocalLanglandsForGL2Qp §§1.7, 2.5, 3.11, 4.1k, 4.2, 4.2a, 4.9, 4.11, 5.6, 5.8, 5.12, 6.9; ProetaleCohomologyOfPAdicCurvesAndTowers §§7.1–7.5; ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4; LocallyAnalyticDistributions §§0.0, 0.2, 0.3; CompletedCohomologyAndLocalGlobalCompatibility §6.4; HilbertModularVarietiesAndShimuraCurves §R18.3.29 (weights {0,1−k}, ρ_f = ρ_π^∨, as the README converts them); GL2AutomorphicRepresentationsAndTransfer R16.1.8; PadicDifferentialEquationsAndRigidCohomology §RD.2.43 (see R02).

**Gaps.** The four slugs of `design/plan.json` are the four of the README, each under its supplier's subsection as `What <Supplier> must provide (gap:<slug>)`, each with a named supplier and section, one need, its hypotheses, and nothing the supplier's current text already provides (SmoothRepresentationsOfLocalGroups SR.3.2 is stated for complex coefficients; CompletedCohomologyAndLocalGlobalCompatibility §6.4 gives one form).

**Ownership.** No other roadmap, on main or at an open head, states the targets of Layers 1–7 (`roadmaps grep` for the Breuil–Strauch comparison, the factorisation, infinitely primitivable functions, the weight change). PadicLocalLanglandsForGL2Qp line 23 and ProetaleCohomologyOfPAdicCurvesAndTowers lines 43 and 1009 hand exactly these to this roadmap. TriangulineVarietyAndItsLocalModel line 20 names §1.2 as owner and uses nothing of it, so "No roadmap cites this one as a supplier" holds. `Suggested.lean` declares no name, so no fully qualified name collides.

**Policy.** The pull request changes only the package folder. No pull-request number, process narrative, `lemma` declaration, `set_option` or algorithm in the README or the Lean file. Every target carries a locator.

**Copyright.** Wording: the 71 verified locators and 9 further passages (the definitions of §§0.3, 1.3, 1.4, 4.8, 7.7, the proof plans of §§3.1(a), 4.11, 6.4, and the Lean docstring on §4.14) were set beside the French texts. The README states them in English in its own order of clauses; the longest run shared with a source is a displayed formula. Arrangement: DLB17 has the largest share. Its sections are 3, 4, 5 (tower and global inputs), 6, 7 (Robba ring, Kirillov), 8, 9, 10, 11, 12. The README has Layer 1 ↔ §§6–7, Layer 2 ↔ §§8–9 with COLMEZ19POIDS, Layer 3 ↔ §§3, 5, 4, 11.2 with its own §3.3, nothing for §10 (base roadmap), Layers 4–6 from CDN20 and CDN23, Layer 7 ↔ Remarques 11.12–11.13 and §12. The map is neither one to one nor in the source's order, and Layer 1 before Layer 2 is forced by the `*Needs:*` of §2.1 (§§1.1, 1.2, 1.6, 1.7). Reuse: no table, figure or list is taken over.

Source independence: 80 passages compared with 5 sources, none shared; largest share DLB17, 109 of 235 source mentions; contents compared with DLB17: independent.

## Not verifiable

- The statements of the base roadmap §§0.1, 0.2, 5.1–5.5, 6.7, EndoscopicTransferAndUnitaryTraceComparison §§12.4–12.19, LocallyAnalyticDistributionsPartII §§1.5, 2.2–2.3, LocallyAnalyticRepresentationsOfLocalGroups §§0.3, 0.5, PhiGammaModulesAndIwasawaCohomology §§2.4, 5.4, 5.6a, 5.7, PadicHodgeTheory, LocalGaloisDeformationRings §3.8 and HilbertModularVarietiesAndShimuraCurves §§R18.4.24a, R18.4.25, R18.5.x: the headings were resolved, the texts were not compared line by line with what the README says they supply.
- The (HYP) verification for G_i at p = 2 in the LocallyAnalyticDistributionsPartII contract (`README.md:102`): the valuations were recomputed (2+2 > 2), saturation of the shifted valuation was not.
- §§5.1–5.5 and 6.4–6.5 (topologies of the arithmetic completion, block evaluation, type annihilator): read against CDN23 lines 2627–2861 for the statements; the proof routes were not recomputed beyond their Checks.
- Source corrections E1, E5–E9, E12, E13 (complement step), E16, E17, E21, E23: the locators exist; whether each gap is a gap was not re-derived.
- Whether three forms with pairwise distinct period lines exist (gap:three-period-line-globalisation): a declared gap, not assessed.
- No Lean was run: the brief allows none here, and the file has no declaration to elaborate.

## Source issues

- **Error** in DLB17 at Théorème 1.10, line 447 (proof lines 2797–2804): the source says infinitely primitivable functions on a cover lie in the functions of the half-plane, treating every nontrivial type as supercuspidal; it should be the span of locally constant functions times functions of the half-plane; affects a stated result.
- **Error** in DLB17 at Proposition 7.7(b), line 1568: the source says the orthogonal of the dual unfiltered lattice is t^k times the lattice for weights 0 and k; it should be t times the lattice for every k ≥ 1; affects a stated result.
- **Error** in DLB17 at §1.1, lines 114–116: the source says the level-zero space over ℚ_p is two copies of the half-plane; it should be so only over the unramified quadratic extension, the ℚ_p-space being connected; affects nothing.
- **Misprint** in DLB17 at Théorème 1.9, line 434: the source uses one letter for the cover level and the cyclotomic level; it should use two indices; affects nothing.
- **Misprint** in CDN20 at the proof of Proposition 2.5, lines 875–876: the source says the Hom has dimension 0 or 1 according as the modules are isomorphic or not; it should be 1 when isomorphic and 0 otherwise; affects nothing.
- **Misprint** in CDN20 at the proof of Lemme 2.18, line 1186: the source says the completing column has the symmetric functions as coefficients; it should carry the alternating signs of the characteristic polynomial; affects the proof.
- **Error** in CDN23 at Proposition 5.7 and Théorème 5.8, lines 2430 and 2471: the source says the nonzero cases are the types of level at most n; it should also require p to act trivially on JL(M), as its proof at line 2434 does; affects a stated result.
- **Misprint** in CDN23 at Théorème 5.15, line 2624: the source defines the dual of the type ring as the dual of itself; it should be the continuous L-dual of the type ring, as in Théorème 0.1; affects nothing.
- **Misprint** in COLMEZ19POIDS at §0.4, line 321, and Remarque 0.11(i), line 333: the source says the k-th derivative maps weight −k to weight k+2 and acts as u⁺; it should be the (k+1)-st derivative, acting as the (k+1)-st power of u⁺; affects nothing.
- **Misprint** in COLMEZ19POIDS at Remarque 0.2(ii), lines 161–163: the source says the quotient of Π(Δ) by its algebraic vectors is Π(M,−k); it should be Π(M,−k) twisted by x^k, as in Théorème 0.6(iii), line 234; affects nothing.

## For the human reviewers

- **Licence.** CDN20 and COLMEZ19POIDS are read from authors' pages (`sources.toml`: `licence_class = "author-page"`), not from the journals; the README cites theorem numbers and lines of those copies.
- **Scope.** §7.7 constructs a sheaf whose only stated use is DLB17 Conjecture 12.4 (line 2876), which the README does not assert (`README.md:1220`, `README.md:1247`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "82e78e7b6291db4746d1e7343abd28eb51926753", "job": "RT-PadicLocalLanglandsForGL2QpPartII~1b", "model": "fable", "worker": "chris-x30"} -->
