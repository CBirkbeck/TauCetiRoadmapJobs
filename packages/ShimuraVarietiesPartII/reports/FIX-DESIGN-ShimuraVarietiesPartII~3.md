# FIX-DESIGN-ShimuraVarietiesPartII~3

Files edited: `packages/ShimuraVarietiesPartII/design/README.md`, `packages/ShimuraVarietiesPartII/design/plan.json`, `packages/ShimuraVarietiesPartII/sources.toml`. There is no `Suggested.lean` at this stage (`acceptanceTest.declarations` stays empty), so no Lean name changed and no `#check` binder audit was needed.

## F01 (P2) — applied

4.11 used to say the points "are equal exactly when the quasi-isogeny … identifies the crystalline tensors". It now gives only HT Lemma 2.1.4's direction: if x·g₁ = x·g₂, the automorphism relating them lies in I_x(Z_(p)), so g ↦ x·g gives a well-defined surjection from the orbit onto I_x(Z_(p))\G(A_f^p). The converse is stated as not asserted. In `*Needs:*`, `SV2.1/tensor-separation` is replaced by `SV2.0/lift-independent-crystalline-tensors`, which the route actually uses (HT line 1003–1004 calls on Proposition 1.3.7).

Evidence: HT line 989–991 (Lemma 2.1.4) gives one direction only. HT line 1038–1039 (Proposition 2.1.6) uses only the surjection. The converse needs KZ Proposition 4.1.9(3), which is 1.3 here and carries the very-good hypotheses.

Also changed:
- The locator is now "HT, Lemma 2.1.4, p.22".
- The proof route and the closing line were rewritten; the closing line is the [−1] witness.
- In `plan.json`: the statement, `proofSteps`, `acceptance` and `prerequisites`, and the reverse `uses` edges of `tensor-separation` and `lift-independent-crystalline-tensors`.
- Layer 4 `### Dependencies` was recomputed.

## F02 (P2) — applied differently

The three compound gaps are gone. In their place are nine single-statement gaps plus two existing upstream targets. The reviewer's split was not used verbatim because several of its locators and owners are wrong:
- "KPZ Proposition 7.2.5" does not exist.
- KPZ Lemma 7.2.5 (KPZ line 3429–3434) is the global multiplier exact sequence, not parahoric exactness.
- The connected-fixer criterion (reviewer's (d), KZ Lemma 4.2.4) is already ReductiveGroupsPartII RG2.3.3 *fixer-versus-parahoric* (5), which cites KZ Lemma 4.2.4 (ReductiveGroupsPartII README, *fixer-versus-parahoric*).
- Faithful tensor generation (reviewer's (f)) is MotivesAndAlgebraicCycles §6.3 (Deligne–Milne Propositions 2.20–2.21: "closed immersion exactly when every object … is a subquotient").
- KZ Proposition 2.4.13 and arbitrary adjoint association are used by no consumer of the old gap. RG2.3 already supplies central-surjection association and split-kernel exactness, so they are dropped.
- Statements about Shimura data (KPZ Lemmas 7.2.5 and 7.2.8, KZ Lemma 4.3.8) go to ShimuraData Layer 4, not to a reductive-groups roadmap.

New gaps, each with hypotheses and a page locator:

| Gap | Supplier | Source | Consumers |
| --- | --- | --- | --- |
| `cr-crystalline-parallel-transport` | CrystallineCohomology §CR.7.3 | HT Prop 1.3.7, HT line 784–807 | 0.5 |
| `cr-isocrystal-tensor-descent` | CrystallineCohomology §CR.7.1 | HT Cor A.7, line 1794–1797 | 0.6 |
| `multiplier-exact-sequences` | ShimuraData L4 | KPZ L7.2.5 | 2.3, 2.4, 2.5, 5.2 |
| `matched-fibre-product-centre` | ShimuraData L4 | KZ L4.3.8, line 1785–1797 | 5.2, 5.3, 5.6 |
| `fundamental-invariant-form` | ShimuraData L4 | KPZ L7.2.8, line 3466–3469 | 2.3, 2.4 |
| `rg3-r-smooth-tori` | RG3.2 | KZ P2.4.6, line 608–612 | 2.3–2.6, 5.3 |
| `rg3-r-smooth-abelian-type` | RG3.2 | KPZ L7.2.11, line 3555–3564 | 2.3, 2.4, 2.5, 5.3 |
| `rg3-stabilizer-closed-immersion` | RG3.2 | KPZ P2.1.5(3), line 454–457 | 2.4, 2.5 |
| `rg3-conj-prime-centralizer-dimension` | RG3.0 | HT §2.1.8, line 1083–1092, 1102–1104 | 4.13 |

Plus: 2.6 and 5.3 get the connected-fixer criterion from ReductiveGroupsPartII:§RG2.3, which they already cited. 7.3 now cites MotivesAndAlgebraicCycles:§6.3.

Consumers per gap are from the proofs: KPZ line 3541–3542, 3574, 3703, 3717–3723; KZ line 1785–1803.

Also updated:
- The RG2.3, MotivesAndAlgebraicCycles and ShimuraData contract lines.
- The 5.2 route sentence.
- `plan.json` `gaps`, `coverage` and `neededBy`.
- The Layers 0, 2, 4, 5 and 7 Dependencies lines.

## F03 (P3) — applied

"(KZ §4.3.5, lines 1761–1763)" → "(KZ §4.3.5, p.40)" in the README Check and the `plan.json` test. §4.3.5 begins at KZ line 1751, on extraction page 40.

## F04 (P3) — applied

- Scope: "Layer C6 owns compactification geometry" → "Layers C0–C5 own compactification geometry".
- Gap section → "Layer C5, Hodge-type integral extension (new section)", in both files.

Checked at the head of ShimuraCompactifications: C5 is "integral PEL compactifications" and C6 is "Hilbert and modular specializations".

## F05 (P3) — applied

Removed:
- "that ownership decision is outside this package" and the "certify its supply direction" sentence. Line 11 now says the RG3.5 consumers belong to a roadmap after this one.
- "the roadmap lies outside the prescribed merge order".
- "not assertions/not claimed as existing targets"; those gaps are now replaced.
- All triple newlines.

The companion gap now reads exactly as the reviewer proposed. GlobalShtukas §6.2 states the p-plain irreducible case.

The same pattern was repaired in two more places:
- compact-quotient-borel: "absent from the existing point-topology scope" was removed.
- arbitrary-dvr-good-reduction: "the existing §§5.1–5.2 only state" → "§§5.1–5.2 state".

## F06 (P3) — applied

`closure(Z°(Z_(p))) *_(G°(Z_(p))_+/Z°(Z_(p)))` → `closure(Z(Z_(p))) *_(G°(Z_(p))_+/Z(Z_(p)))`. Z is now defined as the Zariski closure of Z_G in the full model G_Z(p), with the closure taken in G(A_f^p). This matches KP (4.6.3), line 3138–3144. Z° appears only in the tilde groups, KP line 3126–3136. Both files were updated. The 𝔾_m Check is unaffected: both closures are the closure of ℤ_(p)^× in 𝔸_f^{p,×}.

## Checks

The dependency gate, exit 0:

```text
candidate: ShimuraVarietiesPartII is not in the merge order yet; checked as if placed after HeckeStacksAndLocalShtukas (the intake inserts it when its design is accepted)
depcheck: 56 roadmaps, 647 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. The new suppliers on the merge order are ShimuraData, MotivesAndAlgebraicCycles, ReductiveGroupsPartII and CrystallineCohomology.

`roadmaps resolve` returns one lead, the same as before: "ReductiveGroupsPartIII RG3.0". That is a board package, consumed only through declared gaps.

Script checks:
- 34 gaps in `plan.json` = 34 README contract lines, and the texts are identical.
- Every `gap:` in a `*Needs:*` line is declared, and every declared gap is used.
- All 63 node `prerequisites` equal the README `*Needs:*` lines.
- `neededBy` and the `uses` reverse edges are consistent.
- The layer Dependencies lines equal the union of each layer's node needs. The original file satisfied the same rule.
- `sources.toml` parses. Its KZ, HT, KPZ and KP locators were extended with the newly cited items.

## Adversarial pass (changed statements)

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| 4.11 one direction | GL₂ hyperspecial, g₂ = −g₁ | [−1] ∈ Aut(E) scales ψ by (−1)² = 1 and fixes the crystalline tensors, so −1 ∈ I(Z_(p)) and the classes agree | holds | witness added |
| 4.11 surjection | composite G(A_f^p) → orbit → quotient | equals the projection (HT line 1038–1040), so it is surjective | holds | — |
| multiplier sequences | GL₂ = GSp₂ | G^c = SL₂, c = det, ker = SL₂; Z = 𝔾_m, c(z) = z², Z^c = μ₂ = Z_{SL₂}; Z_{G,0} = 1 | exact | — |
| product corollary | two GL₂ factors, common det | Z = {(a,b): a² = b²}; map to 𝔾_m by a² with kernel μ₂ × μ₂; surjective fppf | holds | — |
| matched centre | G = G₂ = GL₂ | G₃ = (GL₂ ×_{PGL₂×𝔾_m} GL₂)°: pairs (g,±g) with equal det, identity component is the diagonal ≅ GL₂; Z^c = μ₂, but the formula gives μ₂ × μ₂ | Z^c are not tori here (hypothesis fails), so the formula need not hold, as the gap's torus hypothesis requires | hypothesis kept |
| R-smooth tori | 𝔾_m; Res_{K/ℚ_p} 𝔾_m for wild K | split, R-smooth; Weil restriction of a split torus is R-smooth by (1) whatever the ramification of K | holds | — |
| stabilizer immersion | p = 2 | KZ Prop 2.4.10 assumes p > 2 (KZ line 703) | p > 2 stated | — |
| Conj′ dimension | SO₈, γ = diag rotation (θ₁,θ₂,θ₃,θ₄) vs. one sign flipped | conjugate under O(8); centralizers both rank-4 tori for generic angles | equal | — |
| tensor generation (7.3) | 𝔾_m, V = degree-1 character | χ^{−1} ∈ V^∨, so it is not a subquotient of V^{⊗n} alone; with V^∨ it is | needs V^∨, as stated | — |
| A_int with Z | T = 𝔾_m | Z = 𝔾_m over ℤ_(p); closure of ℤ_(p)^× in 𝔸_f^{p,×}, same as with Z° | Check unchanged | — |

## For the maintainer

- These gap slugs were removed: `gap:r-smooth-integral-groups`, `gap:hodge-representation-algebra`, `gap:crystalline-hodge-families`. Nine new gaps were added. Three of them ask ShimuraData for new Layer 4 targets, and two ask CrystallineCohomology for new §CR.7 targets.
- `SV2.1/tensor-separation` now has no consumer inside the roadmap. It remains a stated theorem, KZ Proposition 4.1.9(3).
- KZ arXiv v2 cites KPZ by preprint numbers ("Lemma 7.2.6", "Proposition 7.2.14"). The gaps cite the published KPZ numbers recorded in `sources.toml`: Lemma 7.2.11 and Proposition 7.2.19.
- Ownership against open pull requests was checked for the new objects: R-smoothness, tensor generation and connected fixers, with `roadmaps grep` and by reading ReductiveGroupsPartII, MotivesAndAlgebraicCycles, ShimuraData and RelativeFarguesFontaine at their heads.
- No suspicious instructions were found in the review text.
