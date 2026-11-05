# FIX-PKG-SchemeKTheoryOperationsPartII~2

One review, two findings. Both verified against the supplier text: AdicSpacesPartIII on main, and SchemeKTheoryOperations at the head of its new-roadmap pull request, as given by `roadmaps show`. Edited: `packages/SchemeKTheoryOperationsPartII/README.md` and the top-level `gaps` entry of `packages/SchemeKTheoryOperationsPartII/design/plan.json`. `Suggested.lean`, `metadata.toml` and `sources.toml` are unchanged.

## F01 (P2) — applied

Verified. Take AdicSpacesPartIII F0.6 *formal-direct-image-comparison* with Y = X = Spec B, f = id (proper) and Y′ = V(J). Then X̂ = Spf B, and F̂ = M^Δ by the definition in *associated-formal-module*. The comparison gives `H^q(Spf B, M^Δ) ≅ H^q(Spec B, M~)^∧`, and this is 0 for q > 0 by SchemeAndStackFoundations §2.6 (`serre_affineness_criterion`, Check `test_affine_vanishing`). By *affine-coherent-equivalence* (iv)(c), every coherent module on Spf B is some M^Δ.

Old → new:
- Gap sentence (README contract and plan `gaps[0].needs`): "…, the Mittag–Leffler assertion …, and positive-degree coherent acyclicity on every affine formal scheme" → "… and the Mittag–Leffler assertion on every noetherian target open". The slug, supplier and section are unchanged.
- The AdicSpacesPartIII contract has a new paragraph that imports this specialisation. It names its inputs and gives the witness B = k⟦t⟧, M = B/(t²): H⁰ = M (length 2) and H¹ = 0.
- §4.7: the proof route now cites the imported affine acyclicity separately from the requested contract. Its *Needs* line gains `gap:proper-formal-coherent-direct-images` and the F0.6/SchemeAndStackFoundations §§2.2, 2.6 inputs.
- The Layer 4 Dependencies line now names F0.6 and the gap slug.

## F02 (P3) — applied differently

Verified against the SchemeKTheoryOperations head: §2.2 is derived pullback, §2.3 proper images and transfers, §2.4 base change and projection formulas. In AdicSpacesPartIII on main, F0.2 runs from line 1052 to line 1309, and *spf-morphism-correspondence* is at line 1211.

Old → new:
- Contract (SchemeKTheoryOperations): "§§2.1–2.3 for coherent G₀ and proper pushforward with base change" → §2.1 G₀; §2.2 derived pullback and underived flat pullback on G₀; §2.3 proper pushforward with its alternating formula and composition; §2.4 Tor-independent base change and the projection formula.
- AdicSpacesPartIII contract: *spf-morphism-correspondence* moved from F0.3 to F0.2. F0.3 keeps the formal-scheme carrier and the scheme embedding.
- §4.2 *Needs*: SchemeKTheoryOperations §2.2 → §2.3.
- §4.4 *Needs*: adds §2.4 and keeps §2.2 (flat pullback a ↦ a_{A′}) and §2.3 (composition, for part (a)).
- §4.7 *Needs*: keeps §2.2.
- Layer 4 Dependencies: §§2.2–2.3 → §§2.2–2.4, and F0.3–F0.4 → F0.2–F0.4.
- The same pattern in the Scope paragraph: it now names base change and projection formulas (§2.4).

The difference from the requested repair is in §4.1. Its *Needs* line now cites AdicSpacesPartIII §F0.2 (*spf-morphism-correspondence*) and §F0.3, and replaces SchemeKTheoryOperations §2.2 with SchemeAndStackFoundations §2.6, not with SchemeKTheoryOperations §2.3. §4.1 forms no G₀ class. Its input is finiteness of coherent cohomology on schemes proper over a noetherian ring, with a bound over an affine base. That is stated in SchemeAndStackFoundations §2.6. SchemeKTheoryOperations §2.3 presupposes it and does not state it: its text names JacobianChallenge Layer C as the supplier of coherence. The SchemeAndStackFoundations contract sentence now says §2.6 supplies this finiteness.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| Shortened gap (proper formal direct images, inverse limit, ML) | p = id on Spf B; non-algebraisable proper formal family over Spf k⟦t⟧ | id: R⁰ = F and Rᵠ = 0 for q > 0, already covered by the import. A formal family that is not the completion of an algebraic morphism is outside *formal-direct-image-comparison*, so the general contract is still needed. | The gap is minimal; the affine clause was dropped. |
| Imported affine acyclicity on Spf B | B = k⟦t⟧, M = B/(t²); B = ℤ_p, M = ℤ/p^k; J = 0 (discrete B); B = 0; M = 0 | H⁰ = M of length 2 and H¹ = 0; H⁰ = ℤ/p^k and Hᵠ = 0 for q > 0; Spf B = Spec B and M^Δ = M~, which is scheme affine acyclicity; Spf 0 = ∅ gives 0; zero module gives 0 | Holds. Witness added to the contract. |
| §4.7 Čech bound "vanishing in degrees ≥ number of opens" | Spf B (N = 1); completion of P¹_{k⟦t⟧} along t = 0 (N = 2) | N = 1: vanishing for q ≥ 1. N = 2: vanishing for q ≥ 2, while H¹(Ô(−2)) = k⟦t⟧ ≠ 0 in degree 1, so the bound is sharp. | Holds. Wording fixed from "the number of opens" to "degrees at least the number of opens". |
| §4.1 through SchemeAndStackFoundations §2.6 | Spec A/ϖ³; P¹_k; A¹_k; Spec ℚ_p → Spf ℤ_p | H⁰ = A/ϖ³ of length 3; H⁰ = k and H¹ = 0; A¹_k is not proper and H⁰ = k[t] has infinite length, so the hypothesis is used; there is no continuous ℤ_p → ℚ_p (p is not nilpotent), hence no factorisation (F0.2 correspondence) | Existing Checks unchanged and consistent. |
| §4.2 through SchemeKTheoryOperations §2.3 | [O_{Spec A/ϖ²}]; O(m) on P¹_k at m = −2, 0; a closed point of degree f | Pushforward is [A/ϖ²] with degree 2; −1 and 1, which agree with SchemeKTheoryOperations §2.3's Check p_*[O(n)] = n+1; f | Consistent with the supplier's Checks. |
| §4.4(c) through SchemeKTheoryOperations §2.4 | A′ = A[ϖ^{1/2}], W = Spec k; A′ = completed maximal unramified extension; scope of f′ | g flat, so Tor-independent. W′ = Spec(A′/ϖA′) has length 2 = e·1. With e = 1 the degree is preserved. All four schemes are noetherian (W′ is of finite type over A′/ϖⁿA′), so f′ is in the §2.3 transfer scope. | Holds. §2.4's hypotheses are met. |
| *spf-morphism-correspondence* (F0.2) | Spec A/ϖ² → Spf A; Spec ℚ_p → Spf ℤ_p | The quotient A → A/ϖ² is continuous; the second has no morphism | Consistent with §4.1. |

## Checks

- `lake env lean packages/SchemeKTheoryOperationsPartII/Suggested.lean`, run from the content checkout: exit 0, no errors and no warnings. The file imports only `Mathlib`, so no `TauCeti.*` build was needed. Nothing was left running.
- Signature comparison: `Suggested.lean` declares nothing (no theorem, def, instance or opaque), so the `#check @name` scratch file would be empty and there is nothing to compare. Nothing changed.
- Dependency direction, exact output:

```text
depcheck: 56 roadmaps, 637 edges, 0 problem(s)
```

  There are no UPWARD, CYCLE or moved lines.
- `roadmaps resolve` on the README reports no cross-roadmap citations and no Lean names found nowhere.
- Gate failures: none were listed for this round.

## Ownership and citations

No new construction was added. The affine acyclicity is imported from AdicSpacesPartIII F0.6 on main, and every other edit is a locator. All cited sections were rechecked as follows:
- AdicSpacesPartIII F0.2, F0.3, F0.6 (*formal-direct-image-comparison*, *associated-formal-module*, *affine-coherent-equivalence*): in the main content checkout.
- SchemeAndStackFoundations §2.6: in the main content checkout.
- SchemeKTheoryOperations §§2.1–2.4: at its new-roadmap pull-request head.

## For the maintainer

- `design/plan.json` repeats the dropped clause in two places outside its top-level `gaps` list: line 43 ("plus affine coherent acyclicity for the bounded Čech argument") and the §4.7 route at line 3253. This job may not edit those fields. The README and the declared gap now agree that affine acyclicity is imported, not requested.
- The gap slug `proper-formal-coherent-direct-images` is unchanged and only its `needs` sentence is shorter. When AdicSpacesPartIII answers the gap, it should use the shortened text.
- No Lean name of this roadmap changed, so no other roadmap's citation is affected.
- The review contains no instruction-like text.
