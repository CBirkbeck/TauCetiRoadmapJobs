# FIX-DESIGN-QuasicoherentSheavesOnPrestacks~11

Findings of `REV-DESIGN-QuasicoherentSheavesOnPrestacks~10` (one review, two P3 findings). Files changed: `packages/QuasicoherentSheavesOnPrestacks/design/README.md` and `packages/QuasicoherentSheavesOnPrestacks/design/plan.json`. `sources.toml` is unchanged: no new work is cited.

## F01 (P3) — applied differently

Old → new: Conventions (Universes), "applied in the universe u+1 exactly where the text says so (1.2, 2.1, 3.1)", becomes a rule with the complete list by section. It adds that presentable-category statements stay in u, and a witness from PresheavesAndCompletions §1.4.3. The routes of 1.5 and 2.3, three supplier contracts and the plan follow.

Verified. The finding is right. PresheavesAndCompletions §1.4.3 is stated "for a small simplicial set", with small meaning the base universe (its README, Conventions, Size). 2.3 applies it to `T^op`, which is not u-small. 2.5 straightens over the nerve of affine schemes, and 7.1 uses `PreStk_T` as a presheaf ∞-topos.

How the repair differs, and why. The suggested list was itself incomplete. It also misses:

- 1.5 and 2.2, coCartesian sections (EnhancedDerivedSheaves E0.7) over the (u+1)-small K and `Pts(X)`;
- 3.2, HTT Lemma 6.5.2.9 (HypercompletenessAndCoherence §6.1.1) on fpqc sheaves on `T^op`;
- 2.5 and 3.3, `spaceSheaves` and `hypercompleteSpaceSheaves` (E2.7);
- 1.2 and 2.1, `derivedFamily` and the Yoneda embedding (E0.5).

The rule reads: every supplier statement about small ∞-categories, presheaf ∞-categories or ∞-topoi that is applied to T, `T^op`, the nerve of affines, `Pts(X)`, a (u+1)-small index, `PreStk_T`, its slices or fpqc sheaves is applied in the universe u+1, with `Ŝ` and `Ĉat∞`. A second sentence covers the presentable side. `IsPresentable`, `presentable_limit`, `presentable_limit_right`, `adjointFunctorTheorem` and StableInfinityCategories §11.1.1 take presentability and smallness in u, because `D∞(ℤ)` is not (u+1)-presentable, as the existing K-coproduct witness shows.

The same pattern elsewhere:

- 1.5's route cited `presentable_limit_right` for limits along right adjoints over a (u+1)-small K. That statement covers only u-small diagrams of presentable ∞-categories, and `Mod_A` is not (u+1)-presentable. The route now rests on `coherentMate` on the E0.7 sections in u+1, as HA Corollary 4.7.4.18 is applied, and limits `presentable_limit_right` to u-small diagrams. The Needs line and the plan prerequisite (E5:presentability.2) are unchanged.
- The 2.3 route now says §1.4.3 is applied in u+1 to `T^op`.
- The supplier-contract bullets for PresheavesAndCompletions, InfinityTopoi and HypercompletenessAndCoherence carry the universe clause.
- HypercompletenessAndCoherence §6.1.1 was said to be "used in 3.2 and 7.1". 7.1 neither cites it nor lists it in its Needs or plan prerequisites, so this now reads "used in 3.2".
- The plan's supplier `what` fields for these three roadmaps mirror the change: "for 3.2, 3.4 and 7.1" becomes "for 3.2 and 3.4".

## F02 (P3) — applied

Old → new: 7.1 "G flat, so the atlas is an fpqc surjection, so geometric" → the atlas is affine and an fpqc surjection for every G (fpqc-local lifts, unit-split base change), and flat when G is flat (6.1), hence geometric (6.2). Added a non-flat-G Check; 6.1 and 6.2 join *Needs*; the plan follows.

Verified. The finding is right. Flatness of G was used to get the fpqc surjection, and "geometric" was inferred from the surjection. Surjectivity holds for every G, while 6.2(b) needs a flat atlas.

Computed witness, in the classical context over `S = Spec ℤ`:

- Take G with `O(G) = ℤ × 𝔽_ℓ`. Its R-points are the idempotents e with `ℓe = 0`. They are closed under `e + e′ − 2ee′`, since `ℓ(e + e′ − 2ee′) = 0`, so G is a closed subgroup scheme of ℤ/2.
- G is not flat over ℤ, since `𝔽_ℓ` is torsion.
- The base change of `S → BG` along itself is `G → S`, which the unit splits.

Wording against the suggested text. The suggested sentence derived surjectivity only from the base change along the atlas itself. That does not cover points that do not factor through X. The repaired bullet first lifts every point fpqc-locally: the atlas is the image under L of the effective epimorphism `X → |G^{×_S •} ×_S X|`. It then computes the base change over a lift as `G ×_S Spec R_i → Spec R_i`, using effectivity and the left exactness of L. The flatness step then descends along `R → ∏_i R_i` (6.1).

Also changed:

- New 7.1 Check with the non-flat G as a negative control, and `G_m` as the positive case (`ℤ[t, t⁻¹]` is free over ℤ), which 6.2's Check of the heart of `QCoh(BG_m)` uses.
- Plan 7.1: prerequisites gain `target:6.1` and `target:6.2`; `geometric_quotient` is rewritten to match; new test `nonflat_atlas`.

Same pattern searched: "fpqc surjection" and "geometric" in 3.3, 6.2, 6.4, 7.4 and 8.4. 8.4's "geometric stack `BGL_n`" and 7.4's flat affine atlas both rest on flat G (`GL_n`, respectively the flat G of 7.4), so they are consistent with the corrected bullet and need no change.

## Checks run

**Dependency gate** (`gate --candidate … --only QuasicoherentSheavesOnPrestacks`), after the edits:

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after HabiroCohomologyFoundations (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2244 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Layer 6 precedes Layer 7, so the new 7.1 → 6.1 and 7.1 → 6.2 edges point downward.

**Citations** (`roadmaps resolve` on the edited README): no cross-roadmap citation and no Lean name found nowhere.

**README and plan agreement.** A script compared the `target:` prerequisites of all 33 plan targets with the local ids of the README *Needs* lines. They agree; the only reported difference is regex noise from "§§1.27–1.28" in 7.3.

**Style scan** of the README: no LaTeX delimiters, process words, pull-request numbers or machine paths.

**Lean.** The design stage has no `Suggested.lean`, so nothing was elaborated or `#check`ed. No Lean name was added.

**Sources.** No new citation. The locators used were read this round:

| Locator | Lines | Content |
| --- | --- | --- |
| HA Corollary 4.7.4.18 | HA lines 26640–26646 | stated for a simplicial set S and `Cat∞`, so applying it to (u+1)-small K in `Ĉat∞` is the same statement one universe up |
| PresheavesAndCompletions §1.4.3 and its Size convention | its README lines 95 and 457 | read through `roadmaps show` |
| EnhancedDerivedSheaves E0.7, E3.1 and E5:presentability.2 (`presentable_limit`, `presentable_limit_right`, both for small diagrams) | its README on main, lines 360–374, 1121–1125 and 1638–1648 | |

## Adversarial pass (new or changed statements)

| Statement | Instances tried | Values computed | Result, change |
| --- | --- | --- | --- |
| Universe rule: small-base supplier statements applied in u+1 | §1.4.3 on `T^op`; `Pts(Spec A)`; Δ-indexed limits of `Mod_{A_n}` | `CommRingCat.{u}` has a (u+1)-set of objects, not u-small; `P(T^op) = Fun(T, Ŝ) = PreStk_T`; target `CAlg(Ĉat∞)^op` has (u+1)-small colimits; a Δ-limit in `Ĉat∞` is a u+1 limit of coCartesian sections | holds; list complete against every *Needs* entry naming E0.5, E0.7, E2.7, E3.2, PresheavesAndCompletions, PresentableInfinityCategories, HypercompletenessAndCoherence and InfinityTopoi |
| Presentable statements stay in u | `D∞(ℤ)` in u+1; `presentable_limit` in 2.3, 3.4, 6.2; `adjointFunctorTheorem` in 8.2 | a coproduct of K copies of ℤ (K not u-small) would have `π₀Map(C, ℚ/ℤ) = ∏_K ℚ/ℤ`, of size at least `2^|K|`; all three `presentable_limit` uses are along u-small diagrams; `q^* : D∞(ℤ) → QCoh(X)` between u-presentable categories | holds; `PreStk_T` is (u+1)-presentable, so `accessibleLocalization` in 3.1 is correctly on the u+1 side |
| 1.5 route | K = ∅; K = `Pts(⨿_K Spec ℤ)`; K = pushout shape | empty limit: terminal category, identity adjoint; discrete K-indexed product: componentwise right adjoint on `∏_K D∞(ℤ)`, a (u+1)-small limit that `presentable_limit_right` does not cover | route changed to `coherentMate` on E0.7 sections in u+1 |
| HypercompletenessAndCoherence used in 3.2, 3.4 only | 7.1 text and *Needs* | 7.1 cites no HTT 6.5.x; its hypercompleteness of affines comes from 3.2 | contract corrected |
| 7.1 atlas affine and fpqc surjection for every G | G = 1; `S = Spec 0`; R = 0 (empty cover); G with `O(G) = ℤ × 𝔽_ℓ` | G = 1: atlas `X → L X = X` is the identity; `Spec 0`: all terms `Spec 0`; R = 0: empty family, lifts vacuous; base change along itself `Spec(ℤ × 𝔽_ℓ) → Spec ℤ`, unit section `(a, b) ↦ a` | holds |
| 7.1: G flat ⇒ atlas flat | `G_m` over ℤ; G with `O(G) = ℤ × 𝔽_ℓ`; `X = Spec 0` with that G; derived contexts | `ℤ[t, t⁻¹]` free with basis `tⁿ`; `𝔽_ℓ` not flat over ℤ (`Tor₁(𝔽_ℓ, 𝔽_ℓ) = 𝔽_ℓ`); for `X = Spec 0` the atlas is the identity of `Spec 0`, flat although G is not, so the converse is false; derived base change `O(G) ⊗_{O(S)} R_i` is flat when `O(S) → O(G)` is | holds; only sufficiency is claimed, and the new Check's lead says "can fail to be flat" rather than "flat only with it" |
| Group law of the new Check | e = 0; e = e′; ℓ = 2 | `0 + e′ − 0 = e′`; `2e − 2e = 0`; `2(e + e′ − 2ee′) = 0` in an `𝔽₂`-algebra | closed, inverse the identity |
| 7.1 effectivity used for the base change | `X ×_{[X/G]} X` | `L(X ×_{|X_•|} X) = L(G ×_S X) = G ×_S X`, since L is left exact and `G ×_S X` is affine | holds |

## For the maintainer

- No name of this roadmap that other roadmaps cite changed. No section was renumbered, no target added or deleted, and the plan still has 33 targets.
- Ownership: no new construction was introduced, so no new ownership question arises. The only new statement is the non-flat-subgroup Check of 7.1, a computation.
- The design has no `Suggested.lean`, so the mechanical `#check` comparison does not apply this round.
- No suspicious instructions were found in the review text.
