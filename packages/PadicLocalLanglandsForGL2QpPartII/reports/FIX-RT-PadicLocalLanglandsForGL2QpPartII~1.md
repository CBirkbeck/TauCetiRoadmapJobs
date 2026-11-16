# FIX-RT-PadicLocalLanglandsForGL2QpPartII~1

Repair of red-team round 1 (passes a and b). Files changed: `packages/PadicLocalLanglandsForGL2QpPartII/README.md`, `Suggested.lean` (module docstring only), `design/plan.json` (one `gaps` entry), `sources.toml` (one `cited_for` list).

## RT-PadicLocalLanglandsForGL2QpPartII~1a/F01 (P2) — applied differently

Verified: GL2AutomorphicRepresentationsAndTransfer R16.2.10 owns fixed-ω projectivity over ℂ and names the L-descent without stating it. SR.3.2 has no fixed-ω category. Making SmoothRepresentationsOfLocalGroups (earlier) supply R16.2.10's descent would reverse the direction of supply.

Change: the gap supplier moves from SR §SR.3.2 to GL2AutomorphicRepresentationsAndTransfer R16.2.10 (README and `plan.json`). Added an R16.2.10 supplier bullet, and R16.2.10 in Scope, §3.3 (input and *Needs:*) and the Layer 3 Dependencies.

## RT-PadicLocalLanglandsForGL2QpPartII~1a/F02, RT-PadicLocalLanglandsForGL2QpPartII~1b/F03 (P2) — applied differently

Verified: the fact is unowned (DLB17 line 1207, "exercice"; nothing in the base roadmap).

Change: §2.3 proves that Π(V)^an/π, and Π^an_(M,ℒ)/LL(M) for every supercuspidal type, has no nonzero smooth vector, with two Checks. §§3.1(a) and 3.3 cite it, and three *Needs:* lines are updated. The route uses (u⁺)² = 0 and Res_ℤ_p∘(u⁺)² = t²·Res_ℤ_p on both charts. a/F02's tN_rig^(ψ=1) ≠ 0 is unproved here, and b/F03's "t on both charts" fails since wu⁺w = u⁻.

## RT-PadicLocalLanglandsForGL2QpPartII~1a/F03 (P3) — applied

Verified: DLB17 lines 431–443 print 1+pⁿℤ_p for n ≥ 0.

Change: in §7.4, "∫_(1+p^mℤ_p), m ≥ 0" → "∫_(Γ_m), m ≥ 1", with ∫_(Γ_m) defined. The level-zero condition now follows by corestriction (exp commutes with corestriction). Added an m = 0 / p = 2 Check, updated Check 1, and extended E18.

## RT-PadicLocalLanglandsForGL2QpPartII~1a/F04 (P3) — applied

Verified: DLB17 lines 1572–1581.

Change: §1.7 now first proves Π(V)_c^P-fin ⊂ Π(V)^an, defines m(V) through the analytic-radius sequence of the base §3.11, and gives i_(j,n) its target D⁺_dif,n(V̌). New Check: φ_v(1) = t⁻²e is moved by every u(p^N), so v lies in Π^an and not in π. This also defines the r_m(V) used in §2.1.

## RT-PadicLocalLanglandsForGL2QpPartII~1a/F05 (P3) — applied

Verified (CDN20 line 860). §4.6 now defines X_st(M) = (B_st⊗M)^(N=0, φ=p), notes that it equals (B_cris⊗M)^(φ=p) because N = 0, and that it contains X⁺_st(M). The third bullet now says that H_M is the Hom into X⁺_st(M).

## RT-PadicLocalLanglandsForGL2QpPartII~1a/F06 (P3) — applied

Verified (DLB17 line 1537 prints a direct limit). In §1.4, "lim_n" → "colim_n". This was the only occurrence: §1.5 already had colim, and the lim_n of §1.6 is a limit of numbers, which is correct.

## RT-PadicLocalLanglandsForGL2QpPartII~1a/F07 (P3) — applied

Verified: COLMEZ19POIDS lines 310–332 use a right action, the JL(M)* multiplicity and x⁻².

Change: §7.2 says "in the normalisation of Conventions" and lists source against README conventions (right/left action, JL(M)*/Hom_Ǧ(JL(M),−), x⁻²/det⁻¹). New centre Check: both sides give a⁻ˢζ(a)⁻¹, and det⁻² would be off by p⁻². Whether the source's x⁻² is a misprint is not asserted.

## RT-PadicLocalLanglandsForGL2QpPartII~1a/F08 (P3) — applied differently

Verified: DLB17 line 2815 uses all coadmissible D(G)-modules; a D(G)-module has no Ǧ-sector.

Change: in §7.6, "fixed ρ-sector … Construct here" → the bounded-cohomology part of Mathlib `DerivedCategory` of 𝒞_G from LocallyAnalyticRepresentationsOfLocalGroups §1.1. That roadmap owns 𝒞_G, so §7.6 cites it rather than rebuilding it from the base §0.1. Ω¹^ρ is shown coadmissible as a cokernel over two lines. Contracts and *Needs:* updated.

## RT-PadicLocalLanglandsForGL2QpPartII~1a/F09 (P3) — applied

Summary bullet 3: "consequences of Dospinescu–Le Bras §§11–12" → a list of the end theorems by their mathematics, each with its section: §§7.2, 7.4, 7.5 and 7.6, as suggested, plus the first-cover form §7.3, which the suggestion left out.

## RT-PadicLocalLanglandsForGL2QpPartII~1b/F01 (P2) — applied

Verified: CDN20 line 249 (M = D_pst(V)[1]), the base §6.9(i) (D_pst(V) ≅ M(π)) and COLMEZ19POIDS lines 206–211 (Colmez's M = D_pst(Δ)).

Change: §0.4(a) now states M ≅ M(π)[1] and LL(M) = LL_p(M[−1]), with a Check. §§2.3–2.4 use M° = M[−1], with a Check that Δ(M) would give central character p² at p. The general-M sentence of §7.2 names M[−1]. E25 aligned.

## RT-PadicLocalLanglandsForGL2QpPartII~1b/F02 (P2) — applied

Verified: the application step of PadicDifferentialEquationsAndRigidCohomology §RD.2.43 quotes DLB17 Lemme 6.3, which that roadmap does not state. §1.2 now proves the bijectivity:
- injectivity from (∇−h)(t^hx) = t^(h+1)∂x and its own first statement;
- surjectivity from the perfect pairing of §RD.2.43 applied to V̌.

The Scope paragraph and the PadicDifferentialEquationsAndRigidCohomology contract now say that §RD.2.43 supplies only the pairing.

## RT-PadicLocalLanglandsForGL2QpPartII~1b/F04 (P3) — applied

Verified: the base §2.5 assumes a central character, and CDN23 lines 2385–2386 omit it. In §4.10, (c) → "of finite length with a central character", plus one sentence checking every use: Π_(M,ℒ) is absolutely irreducible (base §3.8), St^cont⊗δ_G has central character δ², and §4.11 applies (c) summand by summand.

## RT-PadicLocalLanglandsForGL2QpPartII~1b/F05 (P3) — applied

Verified: both Checks hold for any additive functor or presheaf.

Change:
- §4.4: "vanish at V = 0" → H_C(L(1)) = 0 against H_C(L) = F⊗L (Tate); C(1) swaps the two; H_M = 0 on both characters (F = ℚ_p).
- §7.7: "empty open" → restriction to F_π(ℙ¹(ℚ_p)) is injective with cokernel (Ω¹(Σ_r)^ρ)′ ≠ 0 (DLB17 lines 2861–2865; ρ ≅ ρ^∨).

## Checks run

- `lake env lean packages/PadicLocalLanglandsForGL2QpPartII/Suggested.lean` from the content checkout: exit 0, no output (run before and after the docstring edit). No `TauCeti.*` import, so nothing was built.
- Dependency check:

      depcheck: 251 roadmaps, 2394 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line. The new suppliers are earlier in `merge-order/ORDER.txt`: GL2AutomorphicRepresentationsAndTransfer is line 101, LocallyAnalyticRepresentationsOfLocalGroups line 253, and this roadmap line 383.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- `#check` comparison: `Suggested.lean` declares nothing, so there is nothing to compare. The only Lean change is a docstring clause on §7.6 (Mathlib's `DerivedCategory` exists; the coadmissible category it would be applied to is missing at the pins).
- Style scan of the added text: no LaTeX, no machine path, no process words.

## Adversarial pass (new or changed statements)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §0.4(a) M ≅ M(π)[1] | ℚ_p(1)-type shift; trivial ζ | φ(M) = p·φ(M(π)); LL_p(M) = π⊗η∘det, η(p)² ∈ {p², p⁻²} ≠ 1 | holds | Check added |
| §1.2 injectivity | weights {0,1}, h = 1; trivial rank one | ∇(t^hx) = ht^hx + t^(h+1)∂x; R: ∇1 = 0 (hypothesis needed) | holds | prose |
| §1.2 surjectivity | V̌ = V*(1) | nontrianguline, de Rham, abs. irr.; ker ∂ on N_rig(V̌) = 0 ⇒ coker = 0 by RD.2.43 | holds | prose |
| §1.4 colim | n → n+1 | L_n((t))/L_n[[t]] ↪ L_(n+1)((t))/L_(n+1)[[t]] injective; t⁻ʲe killed by tʲ not tʲ⁻¹ | holds | lim → colim |
| §1.7 m(V) | n ≥ m(V) | r_n ≤ r_m ⇒ D^(]0,r_m]) ⊂ D^(]0,r_n]); i_(j,n) lands in D⁺_dif,n(V̌) | holds | defined |
| §1.7 new Check | φ_v(1) = t⁻²e, N ≥ 0 | (e^(tp^N)−1)t⁻²e ≡ p^N t⁻¹e ≠ 0 mod D⁺ | v ∈ Π^an∖π | Check |
| §2.3 smooth vectors | Π(V)^an vs quotient; derivative | smooth(Π^an) = π ≠ 0; p⁻ᴺ((1+T)^(p^N)−1) = t + p^N t²/2 + ⋯ → t; t² injective | holds | target + 2 Checks |
| §2.3 route alternatives | w-chart | wu⁺w = u⁻ ≠ t (b/F03's "both charts" wrong) | rejected | — |
| §2.4 M° | LL(M) = π, ζ(p) = 1 | ω = x⁻¹ζ; det Δ(M°)(p) = p⁻¹; from M: det Δ(p) = p, centre p² ≠ 1 | holds | Check |
| §7.2 identification | s ∈ ℤ, ζ arbitrary | LHS a⁻ˢζ⁻¹; RHS (a^(s−2)ζ)⁻¹a⁻² = a⁻ˢζ⁻¹; det⁻²: a⁻ˢ⁻²ζ⁻¹; M not M°: off by p⁻² | holds | Check |
| §7.2 existing Check k = 1 | a = p | middle p⁻³p⁴ = p; preimage p⁻¹p² = p | unchanged | none |
| §7.4 domain | m = 0; p = 2, m = 1; p odd | ℤ_p ∌⊂ Γ; Γ_1 = Γ, ℚ_2(μ_2) = ℚ_2; [Γ:Γ_1] = p−1 = [ℚ_p(μ_p):ℚ_p] | fixed | m ≥ 1, Check |
| §7.4 corestriction | D(Γ) → L[Γ/Γ_1] → L | composite μ ↦ μ(1_Γ); cores∘exp = exp∘Tr | level 0 implied | prose |
| §4.4 Check | L, L(1); C(1) variant | H_C = F⊗L, 0; swapped: 0, F⊗L; H_M = 0 (F = ℚ_p) | holds | Check |
| §4.6 X_st | N = 0 | (B_st⊗M)^(N=0) = B_cris⊗M ⊃ B⁺_cris⊗M | holds | defined |
| §4.10(c) | L, St^cont, ⊕Π_(M,ℒ_i) | central chars 1, 1, ζ each; (−)^b commutes with finite ⊕ | all uses satisfy | hypothesis |
| §7.6 Ω¹^ρ coadmissible | ℒ₁ ≠ ℒ₂ | ℒ₁^⊥ + ℒ₂^⊥ = M*_dR, ℒ₁^⊥ ∩ ℒ₂^⊥ = 0 ⇒ W₁ + W₂ = Ω¹^ρ, W₁ ∩ W₂ = O^ρ | holds | prose |
| §7.7 Check | U = ℙ¹(ℚ_p) | kernel 0 (identity theorem); coker H¹_c(O)^ρ = (Ω¹^(ρ^∨))′ = (Ω¹^ρ)′ ⊃ dual of dO^ρ ≅ E_π ≠ 0 | holds | Check |
| Gap (R16.2.10, L-coefficients) | ζ = 1 (DLB footnote 52, DLB17 line 2726) | projectivity splits the quotient π^⊕2; char 0 needed for an L-valued Haar measure on G/Z | true | moved |

## Ownership

- Fixed-ω cuspidal projectivity: owned by GL2AutomorphicRepresentationsAndTransfer R16.2.10 (open, earlier). Cited, with the gap there.
- Coadmissible D(G,L)-modules for non-compact G: owned by LocallyAnalyticRepresentationsOfLocalGroups §1.1 (open, earlier). Cited.
- "Π^an/π has no smooth vectors": no owner found (`roadmaps grep` on main and the open heads; base roadmap read). Owned here, §2.3.
- Bijectivity of ∂ (DLB17 Proposition 6.4): owned here, §1.2. TriangulineVarietyAndItsLocalModel already records §1.2 as its owner.

## For the maintainer

- GL2AutomorphicRepresentationsAndTransfer R16.2.10 is now the supplier of gap:cuspidal-projectivity-coefficients: that section must state the characteristic-zero L-coefficient form, projective and injective. SmoothRepresentationsOfLocalGroups is no longer asked for anything.
- The application step of PadicDifferentialEquationsAndRigidCohomology §RD.2.43 quotes DLB17 Lemme 6.3 without a target there. This roadmap no longer relies on that step; the supplier may want to cite §1.2 here or drop the step.
- No section id, heading or Lean name of this roadmap changed. No new source was needed, so no `needs-references.toml` was written. `sources.toml`: COLMEZ19POIDS is now also cited for §0.4.
- No suspicious instructions were found in the reviews.
