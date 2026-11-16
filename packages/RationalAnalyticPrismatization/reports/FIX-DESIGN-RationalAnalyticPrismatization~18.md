# FIX-DESIGN-RationalAnalyticPrismatization~18

This round settles the findings of REV-DESIGN-RationalAnalyticPrismatization~17. There is one review, so the ids are unqualified.

Files changed:
- `packages/RationalAnalyticPrismatization/design/README.md`
- `packages/RationalAnalyticPrismatization/design/plan.json`

`sources.toml` is unchanged. The only locators used (ALRS Remark 6.4.3, Remark 1.22, Proposition 4.2.13) are in ALRS, which the manifest already records. The package has no `Suggested.lean` at the design stage.

Both findings are right, and both are applied. No section, target, layer id or name changed. One Check was added to 11.9 (plan test `torsor_trivialG_cohomology`).

## F01 (P3) — applied

Old (11.9 statement): "Γ(X^{Div¹}, O) = Γ(G^la, Γ(FF_{X̃}, O)^{G-la}) for a perfectoid pro-étale G-torsor X̃^⋄ → X^⋄". New: "Γ(G^la, Γ(FF_{X̃^⋄}, O)^{G-la}), with (−)^{G-la} the derived G-locally analytic vectors, for every pro-étale G-torsor X̃^⋄ → X^⋄". New Check: for G trivial the formula is the first isomorphism of 11.7 (K = ℚ_p), a case the perfectoid restriction excluded.

Verification:
- ALRS line 8351–8352 (Remark 6.4.3) fixes X partially proper smooth over ℚ_p, G a p-adic Lie group and an arbitrary pro-étale G-torsor X̃^⋄ → X^⋄. The formula is at line 8373, with FF_{X̃^⋄}.
- "Perfectoid", together with "G compact", occurs only in Remark 1.22 (ALRS line 460–461). That remark is about the open identification X^{Div¹} = FF^la_{X̃}/G^la. Its formula at line 468 is quoted from Remark 6.4.3.
- The word "derived" comes from line 8360–8361: h_* = h_! computes derived G-locally analytic vectors, by RJRC Proposition 6.1.5. This is the same pushforward as in README 10.2 (line 1541).
- The standing hypotheses of 11.9 (smooth, partially proper, over ℚ_p) are those of the remark. The route uses α_{X,*}O = O (11.6), which 11.9 already lists under *Needs:*.

Pattern search for the same narrowing:
- I searched for "perfectoid pro-étale", "perfectoid torsor", "6.4.3", "1.22", "X̃" and "G-la".
- The Scope paragraph (line 13) and the fourth Check of 11.9 name the open identification of Remark 1.22 without the remark's hypotheses, and they assert nothing about it. They are unchanged.
- 11.10 cites the hypotheses of Proposition 6.4.12 (G compact, a profinite étale Galois extension) correctly.
- No other occurrence was found.

## F02 (P3) — applied

Old (8.5, third Check; `radius_reversed`): "for X = GSpec(ℚ_p) the isomorphism would extend by Frobenius over (0, p) and identify". New: "the isomorphism would hold over κ ∈ (0, 1) and extend by Frobenius, which multiplies κ by p, over κ ∈ (0, p) (that is, over (1/p, ∞) in the radius of 𝒳_T), and identify". The suggested repair is applied verbatim.

Verification:
- ALRS line 3310–3316: φ: X^Δ_{(1,∞)} ≅ X^Δ_{(p,∞)} and φ: X^Δ_{(0,1)} ≅ X^Δ_{(0,p)}. So Frobenius multiplies κ by p.
- ALRS line 3327–3329: 𝒳_{T,(r,s)} corresponds to X^Δ_{(1/s,1/r)}.
- The sentence reads part (1) in the radius ρ = 1/κ, so its "(1, ∞)" means κ ∈ (0, 1). That interval contains κ = p^{−n}, the translates at ρ = p^n.
- Frobenius sends κ ∈ (0, 1) to κ ∈ (0, p). In ρ this is (1, ∞) → (1/p, ∞).
- The old "(0, p)", read in ρ, is κ ∈ (1/p, ∞). That interval contains the Hodge–Tate locus and is not the image.
- The coequalizer of φ and id over X^Δ_{(0,1)} → X^Δ_{(0,p)} is X^{Div¹} (8.5(2), ALRS line 3316). The coequalizer over the same region of the de Rham stack of the punctured disc is FF^dR = Q_p^HK (8.6). The Check's conclusion is therefore unchanged.

Pattern search: I listed every interval (0, p), (1, ∞), (1/p, ∞), (0, 1), (p, ∞), (0, 1/p) and (1, p) in the README, and every use of "radius". Each one has a single coordinate:
- 8.5 statement and Corollary 4.2.14: κ.
- 8.5 proof route: ρ of 𝒳_T, matching ALRS line 3347–3359.
- 8.5 first Check: names both coordinates explicitly.
- 12.5 Chern classes, "(0, p)" for pro-étale and "(1, ∞)" for Hyodo–Kato: κ (ALRS line 9034 uses the radius map of Remark 4.2.12).
- 6.1 Check (line 989) and 7.2 Check (line 1090): the disc radius and the 𝒳_T radius.
- 10.3 "r ∈ (0, 1)": a different variable, the radius of G_r.

No other mixed sentence was found.

## Adversarial pass (changed statements)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 11.9 formula | G = 1, X = GSpec(ℚ_p) | LHS RΓ(Div¹, O) = RΓ(Gal_{ℚ_p}, ℚ_p) (11.7): dims 1, 2, 0; RHS Γ(1, RΓ(FF_{Spd ℚ_p}, O)) = RΓ_v(Spd ℚ_p, ℚ_p): dims 1, 2, 0; χ = −1 on both sides | holds; excluded by the old "perfectoid" (ℚ_p discretely valued) | statement, new Check |
| 11.9 formula | G = 1, X = GSpec(K), [K : ℚ_p] = n | both sides RΓ(Gal_K, ℚ_p): dims 1, n + 1, 0 | holds | — |
| 11.9 formula | G finite of order m, X = GSpec(ℚ_p), X̃ = GSpec(L), L/ℚ_p Galois with group G (not perfectoid) | RHS: every vector la (G^la = G^sm), Γ(G, −) = invariants (m invertible); H¹(Gal_L, ℚ_p) = (ℚ_p ⊕ L)^∨, L ≅ ℚ_p[G], so invariants dim 1 + 1 = 2; H⁰ = ℚ_p; H² = 0; LHS 1, 2, 0 | holds | — |
| 11.9 formula | X = ∅ | both sides 0 | holds | — |
| 11.9 hypotheses | partial properness | the formula uses α_{X,*}O = O (11.6), stated for partially proper X; the 11.9 sentence keeps X partially proper | holds | — |
| 11.9 new Check vs fourth Check | G = 1 | X^{Div¹} vs FF^la_{X̃}/G^la = FF_{X^⋄}^la: not asserted; the new Check concerns cohomology only (11.6, O ≅ α_*O) | consistent | — |
| 8.5 Check 3, intervals | ρ = 1/κ | ρ ∈ (1, ∞) ↔ κ ∈ (0, 1); ρ = p, p² ↔ κ = 1/p, 1/p²; φ: κ ↦ pκ gives (0, 1) → (0, p), i.e. ρ: (1, ∞) → (1/p, ∞); old "(0, p)" in ρ = κ ∈ (1/p, ∞) ∋ 1 | old sentence mixed coordinates | Check |
| 8.5 Check 3, coequalizers | X = GSpec(ℚ_p) | coeq over X^Δ_{(0,1)} ⇉ X^Δ_{(0,p)} = Div¹ (8.5(2)); same region of (D^×_{FF})^dR gives (D^×/φ^ℤ)^dR = FF^dR = Q_p^HK | holds | — |
| 8.5 Check 3, failure at the HT locus | X = GSpec(ℚ_p), test ring ℚ_p[ε]/ε² | fibre of A¹/G_m → A^{1,dR}/G_m^dR over 0 is G_a^†/G_m^† with classes 0 ≠ ε | not an isomorphism, as the Check concludes | — |
| 8.5 route vs statement | φ on 𝒳_T | 𝒳_{T,(1/p,∞)} ≅ 𝒳_{T,(1,∞)} ↔ X^Δ_{(0,p)} ≅ X^Δ_{(0,1)}; 𝒳_{T,(0,1/p)} ≅ 𝒳_{T,(0,1)} ↔ X^Δ_{(p,∞)} ≅ X^Δ_{(1,∞)} | consistent | — |
| 12.5 Chern classes, regions | κ | (0, p): pro-étale region, O{1} the Tate twist (ALRS line 9034); (1, ∞): Hyodo–Kato region (8.5(1)) | consistent | — |

## Checks run

**Plan–README agreement (scripted):** all 627 `statement` strings of `plan.json` occur verbatim in the README (0 missing). The count was 626 before; the new one is the added Check. `plan.json` round-trips in its existing format (indent 1, trailing newline), and the diff touches only the two changed strings and the new test entry.

**Policy grep on the changed lines:** no LaTeX delimiters, machine paths, pull-request numbers or process words.

**Dependency check:**

```
candidate: RationalAnalyticPrismatization is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCyclesPartII (the intake inserts it when its design is accepted)
depcheck: 235 roadmaps, 2251 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

**Lean `#check` pass:** not applicable. There is no `Suggested.lean` at the design stage, and this round changed no Lean name.

**Ownership:** no new construction, target or citation of another roadmap was added, so there is no new ownership question. Both repairs concern statements this roadmap already owns (8.5, 11.9).

## Notes for the maintainer

- **No downstream impact.** No name, id or citation that other roadmaps use has changed.
- **For the human reviewers section.** Nothing in that section was acted on, as the brief requires. This covers scope, licence, the two `none` supplier gaps, the AnalyticStacks consumer note and the 11.1 source correction.
