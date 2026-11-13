# Repair of red-team round 1 (reviews ~1a and ~1b) of LocallyAnalyticRepresentationsOfLocalGroups

Sixteen findings were read and settled. RT~1a/F07 and RT~1b/F01 describe the same defect and are settled together in one section. That leaves fifteen sections: thirteen applied, one applied differently and one disputed. Files changed: `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md`, `Suggested.lean` (docstring only), `sources.toml` (`cited_for` and the CD14 locator) and `design/plan.json` (the top-level `gaps` list only; two entries removed).

## RT-LocallyAnalyticRepresentationsOfLocalGroups~1a/F01 (P2) — disputed

The weak-null theorem (README 0.8) is not a headline, so `Suggested.lean` does not state it. It is a statement about an arbitrary Hausdorff locally convex space over a spherically complete field, and it mentions none of the roadmap's objects: no representation, no D(G, E), no coadmissible module. The brief's vacuity rule makes "a headline whose statement mentions none of the objects the roadmap defines" a defect, so the proposed signature would be one.

The theorem is a supporting input, not something the roadmap is built to reach. Its only consumer is the Mahler-stage target added for 1a/F05 (CD14 Théorème IV.6 uses it as Lemme IV.7, CD14 line 1719). The roadmap's headline list (Summary; the Suggested.lean docstring) never included it.

The other half of the claim was that the module docstring does not name it. One sentence now records that the general locally convex inputs of Layer 0, the weak-null theorem among them, are README targets and not headlines. The mathematics is not in doubt: e_n in c_0 pairs to 1 with (1, 1, …), and p^n e_n is null in both senses.

## RT-LocallyAnalyticRepresentationsOfLocalGroups~1a/F02 (P2) — applied

Both gaps removed (README, `plan.json`) → LocallyAnalyticDistributionsPartII §1.4 (general Fréchet–Stein theory; covers every item of the old gap) and §1.5 (radius algebras), noetherian only at r ∈ p^ℚ ∩ (1/p, 1) (ST03 line 876). Rerouted in 1.1, 1.2, 1.4, 1.5, 1.8, the Layer 1 Dependencies, the Scope and the contract.

## RT-LocallyAnalyticRepresentationsOfLocalGroups~1a/F03 (P3) — applied

"RG2.0.2 (*…*, *general-linear-points-homeomorphism*)" → "RG2.0.2 (*points-topological-group*, *smooth-group-analytic-charts*) and RG2.0.3 (*general-linear-points-homeomorphism*)". This was confirmed on main: ReductiveGroupsPartII README line 729 starts RG2.0.3, and the target is at line 746. Applied in the supplier contract, in the 0.1 *Needs* and in the Layer 0 Dependencies (a third occurrence).

## RT-LocallyAnalyticRepresentationsOfLocalGroups~1a/F04 (P2) — applied

§8.1 (v) now defines Hom_(P,g′) = {ψ : ψ − Σ_jψ_j∘det_j smooth} (DING25 line 859, (2.21), p. 21). §8.1 proves it equals ∏_j Hom_(g′)(T_j), of dimension n + r·d_L, adds an API bullet and Checks (B: 6, G: 4, (2, 1): 5). §9.6 (3) cites 8.1, gains a route, and gains a Check that the transition fails off Hom_(P,g′).

## RT-LocallyAnalyticRepresentationsOfLocalGroups~1a/F05 (P1) — applied

§2.3 gains a *Mahler-analytic stages* target. The definition is cited to PadicLocalLanglandsForGL2Qp §2.5, its owner; no roadmap owns the rest. The target proves flatness of D^((h)) = D_(<s_h) (LocallyAnalyticDistributionsPartII §1.5), base change (CD14 line 1799), exactness (CD14 line 1826), and B^(G_n-an) ⊆ B^((n+2)) ⊆ B^(G_(n+1)-an) (PAN22 line 581). It has five Checks. §2.5 is rerouted through it.

## RT-LocallyAnalyticRepresentationsOfLocalGroups~1a/F06 (P2) — applied

§7.3: "induced (g, P)-map … (through evaluation)" → "induced U(g)-linear map". Evaluation is U(p)-linear, depends on N_0, and is not P-equivariant (EMJ2 lines 80–100). N_0-independence is cited to EMJ2 lines 109–111 and 186 (Lemma 0.18). New Check: 1_(ℤ_p) becomes 1_(pℤ_p) under diag(p, 1). 7.4's (g, P)-map out of U(g) ⊗ C^sm_c(N, U) is correct and unchanged.

## RT-LocallyAnalyticRepresentationsOfLocalGroups~1a/F07, RT-LocallyAnalyticRepresentationsOfLocalGroups~1b/F01 (P1) — applied

0.4 (iv) → U(g ⊗_F E) ↪ D_F(H, E). For F = L the ℚ_p-embedding composed with (vi) factors through U(g ⊗_L E), killing g_τ, τ ≠ σ_0. Injectivity is proved here by PBW pairing (ST02 lines 343–401; `Module.Basis.pbwBasis`). Also updated: 0.3 (v), API, Needs, contract, Scope. New Check: L = ℚ_p(√p), x_τ ↦ 0.

## RT-LocallyAnalyticRepresentationsOfLocalGroups~1a/F08 (P3) — applied

`Suggested.lean` docstring: a Layer 4 bullet is added. It names the headlines and what the pins lack: Verma modules exist only for nondegenerate-Killing algebras with a split Cartan subalgebra (excluding gl_n), and there is no category O and no generalised Verma module (verified by grep). The Layers 5–6 bullet now refers to Layer 4 instead of repeating it.

## RT-LocallyAnalyticRepresentationsOfLocalGroups~1b/F02 (P3) — applied differently

LieHighestWeight's scope (main, lines 11–30) says its consumers cite Tau Ceti declarations, so Layers 3, 4, 5 and 7 are all replaced, not only 4 and 5. "From Tau Ceti" gains the five pinned declarations with their elaborated hypotheses; LieHighestWeight is kept for §§9.1–9.2. Updated: 4.1, 4.4, 1.10, the Scope and the Dependencies.

## RT-LocallyAnalyticRepresentationsOfLocalGroups~1b/F03 (P3) — applied

The 0.5 Check is now "For compact G …" (EM17 line 3463, Proposition 3.5.12, p. 67). A non-example is added: for G = ℚ_p and f = 1 on ∪_m (p^(−m) + p^mℤ_p), evaluation at p^(−m) gives 1_(p^mℤ_p), which is not a power series on p^Nℤ_p for m > N.

## RT-LocallyAnalyticRepresentationsOfLocalGroups~1b/F04 (P3) — applied

PadicLocalLanglandsForGL2Qp contract: "which contains its injectivity and the density of its image" → "which contains its injectivity (the density of the Dirac span is LocallyAnalyticDistributionsPartII §1.1)". E → E⟨T⟩ is faithfully flat with closed image. No other density-from-flatness claim exists in the README (checked by grep).

## RT-LocallyAnalyticRepresentationsOfLocalGroups~1b/F05 (P3) — applied

1.9 (iii): "is the isomorphism … of 5.3" → "is an isomorphism …", proved in place through 1.8 (t ↦ χ(t)(1 a(t); 0 1), with a additive). 5.3 (2) now reads "by 1.9 (iii), …" and its duplicate route clause is deleted. The citations are now acyclic: 5.3 needs 1.9, and 1.9 needs only 1.7 and 1.8.

## RT-LocallyAnalyticRepresentationsOfLocalGroups~1b/F06 (P3) — applied

8.11 (1): "ζ_w : Hom(T(L), E) ≅ Ext¹(π_alg, PS(w(φ), h))" → "the composite of (3.10) with the push-forward along PS_1 ↪ PS (the pull-back of the deformed principal series along π_alg ↪ PS) is an isomorphism …". A clause notes that ζ_w targets π_1 and is not onto for n ≥ 2. 10.4 and 8.14 are correct.

## RT-LocallyAnalyticRepresentationsOfLocalGroups~1b/F07 (P3) — applied

1.10: "𝐆 split reductive" → "𝐆 split connected reductive over L". The route now proves that Z(U(g ⊗ E)) is central in D(G, E): LocallyAnalyticDistributionsPartII §1.3, plus Ad(g)-invariance for connected 𝐆. The Needs were updated. 5.2, 5.5 and 6.6 already carry the connected standing hypotheses of Layers 5–6.

## RT-LocallyAnalyticRepresentationsOfLocalGroups~1b/F08 (P3) — applied

4.2 (iii), a tautology under the definition, → for M ∈ O^p_alg, finite-dimensional 𝔩_P- or 𝔭-stable subspaces carry unique algebraic L_P- or P-actions with the given differential; conversely, algebraic 𝔩_P-summands force weights in X (OS15 lines 326–353). A route was added (Jantzen lifting, exponentiating 𝔲_P), and the Needs gained ReductiveGroups Layer 2.

## Checks

- **Elaboration.** `lake env lean` on the absolute path of `packages/LocallyAnalyticRepresentationsOfLocalGroups/Suggested.lean`, run from the content checkout: exit 0, no output. The file still has no declarations, a single `import Mathlib` and no `set_option`.
- **`#check` comparison.** `Suggested.lean` declares nothing, so there is no own-declaration comparison. Instead I put `#check @…` for every library name newly cited in the README into one scratch file and elaborated it once: `TauCeti.VermaModule`, `TauCeti.irreducibleQuotient`, `TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible`, `TauCeti.exists_isCompl_of_isKilling`, `TauCeti.complementedLattice_lieSubmodule_of_isSemisimple_center`, `TauCeti.harishChandraIso`, `TauCeti.vermaCentralCharacter_eq_iff`, `Module.Basis.pbwBasis` and `LieAlgebra.HasCentralRadical`. All exist at the pins (exit 0). The README's hypothesis wording was matched to the elaborated binders: `[IsAlgClosed K]` only on the classification and Harish-Chandra statements, `[IsTriangularizable K H L]` on the Verma modules, and `[HasCentralRadical]` plus a triangularisable centre on the reductive theorem.
- **Dependency check.** The required command printed `depcheck: 239 roadmaps, 2175 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Citation resolver.** `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name found nowhere.
- **Gap consistency.** The README gap slugs and `plan.json` `gaps` are the same seven: barrelled-banach-steinhaus, compact-type-tensor, kostant-split-reductive, generic-principal-series-finite-coefficients, principal-series-jacquet-finite-coefficients, finite-length-finite-coefficients and ordered-character-map. Each has a "What … must provide" line.

## Adversarial pass on new and changed statements

| Statement | Instances | Values computed | Result / change |
|---|---|---|---|
| 0.4 (iv), F = L | L = ℚ_p(√p), H = O_L; F = L = ℚ_p; H = 1 | x_(σ_0)(z) = ½(1 + 1) = 1, x_τ(z) = ½(1 − 1) = 0; x_(σ_0)^k pairs with z^k to k!; for L = ℚ_p there is no τ and the composite is the supplier's map; for H = 1, U = E → D = E | holds; kernel of the ℚ_p-composite is (x_τ) |
| 0.3 (v), F = L | χ = σ_0^k on L^× | x_(σ_0) acts by k both as a derivative and through the image of x̃ in D_L; x_τ acts by 0 | consistent with the 0.3 Check (1, 0) |
| 0.5 Check | G = ℤ_p; G = ℚ_p | compact: δ_g∗f = f(· − g); ℚ_p: evaluation at p^(−m) gives 1_(p^mℤ_p)(g), nonanalytic on p^Nℤ_p for m = N + 1 | compactness added |
| 1.9 (iii) | T = ℚ_p^×, χ = 1; T = 1 | dim Hom = 2 (valuation, log) = dim Ext¹; (1 a; 0 1)(1 b; 0 1) = (1 a+b; 0 1); conjugation by (1 c; 0 1) fixes a; T = 1 gives 0 = 0 | holds |
| 1.10, connectedness | O_2; SO_2; GL_2 with Sym^k vs Sym^k′ | Ad(r)x = −x in so_2, so x is not central; trivial and det both have weight 0; SO_2 is fine; distinct dot orbits give Ext = 0 | "connected" added |
| 1.1/1.5 through LocallyAnalyticDistributionsPartII §§1.4–1.5 | H = 1; H = ℤ_p; r = p^(−1/2) | D_r = E, coadmissible = finite-dimensional; D_r(ℤ_p) = closed-disc algebra; D_r(ℤ_p²) = D_r ⊗̂ D_r at rational r | holds; irrational r unused |
| 2.3 Mahler (i)–(iv) | trivial line; ζ^a; 3^a at p = 2; unipotent E²; H = 1 | stages E; v_p − kr_h = k(1/(p − 1) − r_h), so stage 1 is 0 and stage 2 is E; k(1 − r_h) gives 0, then E; b² = 0, exact at every h; D^((h)) = E | holds |
| 2.3 Mahler, s_h | p = 3, h = 1; p = 2, h = 1 | s_1 = 3^(−1/2) ∈ (1/3, 1); s_1 = 2^(−1/2) ∈ (1/2, 1) | in the range of ST03 Lemma 4.8 |
| 2.3 (v) | f = Σ p^⌈√m⌉ (p^m − 1)! binom(x, p^m − 1) | at k = p^m − 1: v(a_k) − v(k!) = ⌈√m⌉ → ∞; v(a_k) − kr_1 = ⌈√m⌉ − m → −∞; v(a_k) − kr_2 = ⌈√m⌉ − m + (p^m − 1)/p → ∞ | the shift by 2 is needed and suffices |
| 2.5 route | finite G (G_0 = 1) | all stages equal B, every H^i = 0 | consistent |
| 4.1 (iii) | k = ℚ_3, 𝔤 = 𝔥 with t ↦ (0 3; 1 0) | not triangularisable over ℚ_3; over ℚ_3(√3) the eigenvalues are ±√3; semisimplicity descends | base-change route covers it |
| 4.1 (iv) | gl_2: (0, 0), (−1, 1), (1, −1) | sl_2 weights 0, −2, 2, central weights 0, 0, 0; dot orbit of 0 is {0, −2} | same, same, different |
| 4.2 (iii) | sl_2 with SL_2 / PGL_2; gl_2, 𝔟, λ = (1, 1) | ±ϖ ∈ ℤϖ lifts; ∉ 2ℤϖ does not lift; span{v, f·v} is 𝔟-stable (e·f·v = λ(h)v = 0) and lifts with T-weights (1, 1), (0, 2) | holds |
| 7.3 | GL_2, U = 1, m = diag(p, 1); P = G | (m·f)(n(x)) = 1_(pℤ_p)(x) ≠ c·1_(ℤ_p); for P = G, N = 1 and evaluation is the identity | U(g)-linear only |
| 8.1 Hom_(P,g′) | n = 3, d = 1: B, G, (2, 1); n = 1 | 6, 4, 5; log t_1 ∉, log(t_1t_2) ∈; n = 1 gives 1 + d | holds |
| 9.6 (3) | (2, 1), ℚ_p | 5 = (2 + 1) + (1 + 1); on all of Hom (dimension 6), Ext¹_1 ≠ Ext¹_s for the GL_2 block (4 + 4 − 3 = 5) | the restriction is needed |
| 8.11 (1) | n = 2, ℚ_p; n = 2, ℚ_p(√p); n = 1 | 4 = 4 < 5; 6 = 6; n = 1 gives PS = π_1 = π_alg | relabelled map |

## Other notes for the maintainer

- **Suppliers.** The two supplier requests to PadicLocalLanglandsForGL2Qp are withdrawn. This roadmap now also cites LocallyAnalyticDistributionsPartII §§1.3, 1.4 and 1.5 and PadicLocalLanglandsForGL2Qp §2.5; all exist at their open heads, and both suppliers precede this roadmap in the merge order. No section was renumbered, no heading renamed, and no name that other roadmaps cite changed.
- **Ownership.** The new 2.3 target is owned here: `roadmaps grep` found only PadicLocalLanglandsForGL2Qp §2.5, which defines the stages; no roadmap proves their exactness.
- **Overlaps.** The overlap index lists only this roadmap's own open pull request; it drops no cited id.
- **Sources.** No new source was fetched, and `needs-references.toml` was not written. `sources.toml`: CD14 is now cited for 2.3 and the supplier contracts, with its locator widened; ST03 gains 2.3; EM17 gains 0.5; DING25 gains 8.1 and 9.6.
- **Suspicious text.** No reviewed text contained instructions to act outside the job.
