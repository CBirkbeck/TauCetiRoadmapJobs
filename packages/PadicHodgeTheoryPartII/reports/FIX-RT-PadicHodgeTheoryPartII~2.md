# FIX-RT-PadicHodgeTheoryPartII~2

This round repairs the findings of red-team round 2, passes a and b, on head `1c4f533`. There are five P3 findings and none of them overlap. All five are right on their main point, so none is disputed.

- Four are applied as proposed, some with extra pattern repairs.
- 2b/F03 is applied differently, because the reviewer's own replacement text would also be false at the pin.
- 2b/F02's witness does not refute the old Convention as it was written. The finding still holds, because σ_0 was not well defined and the condition was never needed.

Files changed:
- `packages/PadicHodgeTheoryPartII/README.md`
- `packages/PadicHodgeTheoryPartII/Suggested.lean` (module docstring only; it still declares nothing)
- `packages/PadicHodgeTheoryPartII/sources.toml`: the GLX26 locator now lists equations (2.6)–(2.7), p. 15.

`metadata.toml` and the `gaps` list of `design/plan.json` are unchanged.

## RT-PadicHodgeTheoryPartII~2a/F01 (P3) — applied

The finding is right. DiamondsAndVStacks §D3.10 defines G̲-torsors, but it attaches no torsor to a homomorphism. The Γ_K-torsor Spd Ω → Spd K comes from §D6.3: §D6.7 there calls it "the G̲_K-torsor … of D6.3".

What changed in §4.1:
- Old: "T_ξ → Spd K its locally profinite G(Q_p)-torsor".
- New: T_ξ is the change of group along ξ of the Γ_K-torsor Spd Ω → Spd K (§D6.3), by contracted product (SchemeAndStackFoundations §2.3, for the torsors of §D3.10). Explicitly, T_ξ = (Spd Ω × G(Q_p))/Γ_K with γ·(x, g) = (γx, gξ(γ)⁻¹), and G(Q_p) acts on the left.
- The completed algebraic closure is written Ω, not C as the reviewer had it, because §4.1 already uses C for ξ(Γ_K).

The same pattern elsewhere:
- D6.3 and SchemeAndStackFoundations §2.3 are added to the §4.1 *Needs:*, the Layer 4 Dependencies and the Scope paragraph.
- DiamondsAndVStacks had no supplier contract at all. A new "From TauCetiRoadmap.DiamondsAndVStacks" paragraph states what §§D0.6, D3.10, D5.3, D5.16, D6.3 and D6.5 supply. The SchemeAndStackFoundations contract now includes §2.3.
- §4.2 used T_y without saying it is T_ξ for ξ = ξ_y. It now says so: T_y is the fibre of the HeckeStacksAndLocalShtukas §HS2.11 torsor, made a left torsor by g·τ = τ∘g⁻¹, and inverting the second factor identifies it with T_{ξ_y}.
- The `Suggested.lean` docstring bullet for §4.1 now says how T_ξ is built.

## RT-PadicHodgeTheoryPartII~2b/F01 (P3) — applied

The finding is right. `roadmaps grep -i 'shtuka dat'` finds nothing on main or at any open head, and the README used the term only once.

What changed in §3.2:
- Old: "Let (G, b, μ) be a local shtuka datum over Q_p in the GLX orientation…".
- New: G is connected reductive over Q_p, {μ} has reflex field E_0, and b ∈ G(F) with (b, μ) Hodge–Newton irreducible in the sense of the Conventions (so [b] ∈ B(G,μ)). The conclusion is a point over Spd K, K ⊇ E_0, of the HeckeStacksAndLocalShtukas §HS2.12 admissible cell (its cell for μ⁻¹, written Gr^b_μ here) with open derived image.

The `Suggested.lean` docstring bullet for §3.2 now carries the same hypotheses. Before, it stated none.

## RT-PadicHodgeTheoryPartII~2b/F02 (P3) — applied

The finding is right that "the Frobenius action σ_0 on the based root datum" is not determined: only Γ_{Q_p} acts on the root datum, and two lifts of σ differ by inertia.

The witness only partly holds. The old Convention said "enlarging s, arrange … σ_0^s = 1". For the cyclic quartic torus, fixing one lift and taking s = 4 does arrange it. So s = 2 is not a value of s that the old Convention admitted. But the condition was never needed:
- §1.4 uses σ_0 only on Γ_{Q_{p^s}}-orbits.
- §1.5 uses it only on the Γ_{Q_{p^s}}-invariant μ̄.
- On both, σ_0 does not depend on the lift, and σ_0^s acts trivially with no further condition.
- GLX26 (2.7) (GLX26 line 595–596, p. 15) likewise requires only that φ_0^N fix μ̄.

What changed:
- Conventions: the reviewer's text (a), giving a fixed lift σ̃, the *-action and lift-independence, with the GLX26 (2.7) locator.
- §1.4: "σ_0 as in the Conventions".
- §1.5: "reindexing with σ_0^s μ̄ = μ̄".
- New Checks in §1.4 and §1.5 record the witness.

## RT-PadicHodgeTheoryPartII~2b/F03 (P3) — applied differently

The finding is right. At the pin, `TauCeti.Cocharacter.parabolicDefiningHopfIdeal` (`TauCeti/Algebra/AlgebraicGroup/Dynamic/Representability.lean`:98) builds the dynamic parabolic, so parabolics are not "only a predicate".

The proposed replacement, "but no quotient scheme G/P", is false at the pin too:
- `TauCeti.HopfIdeal.exists_fppfHomogeneousQuotient_iso_projectiveOrbitPoints` (`…/ProjectiveOrbit/Quotient.lean`:241) represents the fppf quotient `CommHopfAlgCat.fppfHomogeneousQuotient` by a scheme for reduced G of finite type over an algebraically closed field.
- `TauCeti.HopfIdeal.fppfHomogeneousQuotientIsoCoinvariantsPoints` (`…/Fppf/Quotient/Homogeneous/Coinvariants.lean`:236) does the same over any field, but only for linearly reductive N.

The new docstring says this, and adds that a proper parabolic is not linearly reductive. Fl_μ is still missing as a scheme over the p-adic reflex field, so §2.3 stays unstatable.

## RT-PadicHodgeTheoryPartII~2b/F04 (P3) — applied

The finding is right. ReductiveGroups 10B on main says "Prove root-subgroup generation, highest-weight order and Weyl-orbit convex-hull bounds", and its next sentences are about modules generated by a highest line. No layer states that G_der is generated by root subgroups.

What changed in §1.7: the step now reads "a one-dimensional module over a splitting field E′ is a character of G_{E′}, trivial on its derived subgroup (`GroupLike.sub_one_mem_derivedDefiningIdeal`, `…/Derived/Character.lean`:39), which is (G_der)_{E′} (`TauCeti.CommHopfAlgCat.baseChangeHopfIdeal_derivedDefiningIdeal`, `…/Derived/FreeBaseChange.lean`:89)". I added the base-change declaration because L(λ) lives over E′.

Also changed:
- "generation by root subgroups," is deleted from the ReductiveGroups contract.
- Both declarations are added to the §1.7 *Needs:*, the Layer 1 Dependencies, the Tau Ceti contract and the Scope list.

## Checks

- Elaboration of `Suggested.lean`, run from the content checkout with `lake env lean` on `packages/PadicHodgeTheoryPartII/Suggested.lean`: exit 0, no output. The file has one `import Mathlib`, the module docstring and an empty namespace.
- Signatures: `Suggested.lean` declares nothing, so the `#check @name` comparison has no declaration to compare. I still elaborated one scratch file of `#check @…` lines for every library name the new text cites:
  - `GroupLike.sub_one_mem_derivedDefiningIdeal`: `[CommRing R] [CommRing H] [HopfAlgebra R H]`.
  - `TauCeti.CommHopfAlgCat.baseChangeHopfIdeal_derivedDefiningIdeal`: `[Module.Free k K]`.
  - `TauCeti.Cocharacter.parabolicDefiningHopfIdeal`.
  - `TauCeti.HopfIdeal.IsParabolic`: `[Field k] [Algebra.FiniteType k H]`.
  - `CommHopfAlgCat.fppfHomogeneousQuotient`: `[CommRing R]`.
  - `TauCeti.HopfIdeal.exists_fppfHomogeneousQuotient_iso_projectiveOrbitPoints`: `[IsAlgClosed k] [Algebra.FiniteType k H] [IsReduced H]`.
  - `TauCeti.HopfIdeal.fppfHomogeneousQuotientIsoCoinvariantsPoints`: `[Field k] [Algebra.FiniteType k H] [Algebra.IsGeometricallyReduced k H]`, linearly reductive quotient.
  - `TauCeti.reductiveCommHopfAlgProperty`.

  Each elaborated type matches what the README and docstring say. The object file of `TauCeti.Algebra.AlgebraicGroup.Derived.FreeBaseChange` was missing, so I built it first with `lake build` of that module (it was unpacked from the cache).
- Dependency check (`gate --depcheck … --name PadicHodgeTheoryPartII --movable`), run after the last edit:

```
depcheck: 242 roadmaps, 2259 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line. The new supplier citations, DiamondsAndVStacks §D6.3 and SchemeAndStackFoundations §2.3, are both on main.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- `sources.toml` parses as TOML.

Gate failure `tex=6` (TeX-only `_{` outside code spans in the README), repaired in place with nothing else changed:

- Line 318, §1.4 Check on the cyclic quartic torus: `e_{g²}` and `e_{g³}` in the two orbits are now code spans.
- Line 331, §1.5 Check on the same torus: the same two subscripts in μ̄ and σ_0μ̄ are now code spans.
- Line 345, §1.7: `G_{E′}` and `(G_der)_{E′}` are now code spans.

The mathematics is unchanged. Run on the README again, the gate's TeX scanner and LaTeX-delimiter scanner both report 0 hits. The dependency check above was rerun after this repair.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: σ_0 from a lift σ̃ | L/Q_p cyclic quartic, e = f = 2, s = 2; same with s = 4; `Res_{Q_{p³}/Q_p}𝔾_m`; split G | lifts act by g or g³ on ℤ[⟨g⟩], (g³)² = g⁶ = g², so σ_0² ≠ 1 for both, while σ_0⁴ = 1; σ_0(e_1) = e_σ for every lift (inertia acts trivially); σ_0 = id | lift-independent only on orbits and invariants; "σ_0^s = 1" was arrangeable for a fixed lift but ill-defined and unused | Conventions rewritten |
| §1.4 transport on orbits | quartic torus, orbit {e_1, e_{g²}} | g: ↦ {e_g, e_{g³}}; g³: ↦ {e_{g³}, e_{g⁵} = e_g}; image of {e_g, e_{g³}} is {e_{g²}, e_1} | same orbit for both lifts | Check added |
| §1.5 reindexing | quartic torus, s = 2, μ = e_1, λ = e_1^* (w_0 = 1) | μ̄ = (e_1+e_{g²})/2, σ_0μ̄ = (e_g+e_{g³})/2, σ_0²μ̄ = μ̄; Σ_{i<2}⟨λ, σ_0^{−i}μ̄⟩ = 1/2 + 0 = 1/2 = 2·⟨λ, (1/4)Σ_τ e_τ⟩ | identity holds; μ^◇ is the Γ_{Q_p}-average | Check added; "σ_0^s μ̄ = μ̄" |
| §3.2 restated | GL_2 basic slope 1/2, μ = (1,0); norm-one torus μ = 0, κ(b) ≠ 0; 𝔾_m, b = p^m, μ = z^m; GL_2 ordinary | c = 1/2 > 0 and κ(b) = 1 = μ^♮, so the hypothesis holds and SL_2 ⊆ H°; [b] ∉ B(T,0), the hypothesis fails and no point exists; Δ = ∅ and G_der = 1, automatic; c = 0, not irreducible, and every admissible flag has Fe_2 with t_H = t_N = 0, so ξ is reducible and the image is not open in SL_2 | the stated hypotheses are needed and sufficient for the Checks | rewritten |
| §4.1 T_ξ by change of group | action law; trivial ξ; C = {1, diag(1,−1)}, g = [[1,1],[0,1]]; geometric fibre | γ(δ(x,g)) = (γδx, gξ(δ)⁻¹ξ(γ)⁻¹) = (γδ)(x,g); left G-multiplication commutes; trivial ξ: (Spd Ω/Γ_K) × G = Spd K × G(Q_p); identity coset gives Spd K′, K′ the quadratic fixed field of ker ξ, stabilizer C; gdg⁻¹ = [[1,−1],[0,−1]]·[[1,−1],[0,1]] = [[1,−2],[0,−1]] ∉ C; fibre (Γ_K × Spd Ω × G)/Γ_K ≅ Spd Ω × G by (δ, y, g) ↦ (y, gξ(δ)), Γ acting by right multiplication through ξ | agrees with the Torsors convention and all §4.1 Checks | definition added |
| §4.2 T_y = T_{ξ_y} | right torsor P = (Spd Ω × G)/Γ, γ(x,h) = (γx, ξ(γ)h); map [x,h] ↦ [x,h⁻¹] | (γx, ξ(γ)h) ↦ (γx, h⁻¹ξ(γ)⁻¹) = γ·(x,h⁻¹); left actions [x,hg⁻¹] ↦ [x,gh⁻¹] = g·[x,h⁻¹]; the map without inversion breaks both equations unless ξ = 1 | identification holds | sentence added |
| §1.7 characters kill G_der | SL_2, λ = 0; GL_2, λ = (1,1); torus; SL_2 standard | trivial character; det, det − 1 ∈ I(SL_2); G_der = 1, χ − 1 in the augmentation ideal; 2-dimensional, not group-like, lemma does not apply (and §1.7 excludes it: ⟨λ, α^∨⟩ = 1) | true; base change holds for every field extension (free) | step re-derived from pinned declarations |
| Docstring: pinned parabolics and G/P | Borel B ⊂ GL_2 in characteristic 0 | k² restricted to B has the invariant line ke_1 with no B-stable complement, so B is not linearly reductive and the affine-quotient theorem does not apply; the algebraically closed theorem does not give Fl_μ over a p-adic field | §2.3 still not statable | docstring corrected |
| DiamondsAndVStacks contract, D6.3 for K | K finite over Q̆_p | Tate with pseudo-uniformizer p, O_K open and integrally closed; the tower of finite Galois extensions has colimit K̄ with no nonsplit finite étale covers and perfectoid completion Ω; limit group Γ_K | hypotheses of D6.3 met | contract added |

## For the maintainer

- No id of this roadmap changed and no Lean name was added or removed (`Suggested.lean` still declares nothing). `roadmaps overlaps` lists no roadmap that cites this one.
- Ownership: T_ξ is notation of this roadmap's §4.1, built from DiamondsAndVStacks §D6.3 and SchemeAndStackFoundations §2.3. I searched main and the open heads for a torsor attached to a Galois representation over Spd K and found no second owner. HeckeStacksAndLocalShtukas §HS2.11 only states that its fibres are such torsors, and §4.2 cites it for exactly that.
- Both reviews note that `design/plan.json` still has the `sourceIssues` entry `PadicHodgeTheoryPartII/E1`, which records GLX26 §5.1 ¶14 as an error, while §0.7 shows that passage is correct. This repair may edit only the plan's `gaps` list, so the entry is unchanged. Whoever maintains the errata register should withdraw it.
- No untrusted text contained instructions; nothing suspicious to quote.
