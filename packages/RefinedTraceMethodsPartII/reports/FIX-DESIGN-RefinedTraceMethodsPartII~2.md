# Repair report: design of RefinedTraceMethodsPartII, round 2

Files changed: `packages/RefinedTraceMethodsPartII/design/README.md`, `packages/RefinedTraceMethodsPartII/design/plan.json`. `sources.toml` was unchanged because no new source is cited. No `Suggested.lean` exists at the design stage.

## F01 (P1) — applied differently

Verified against akn-delta lines 1759–1786. Lemma 8.5 says that `can − cφ` on `N^{≥j}/p` is an automorphism of `N^{≥j}/p` followed by `can` into `N^{≥j−i}/p`. It is not an equivalence. In the proof of Proposition 8.6, the right column of the square is `can : N^{≥j}/p → N^{≥0}/p`, so the printed target quotient `N^{≥0}/N^{≥j}` is correct; the only error is the printed bound.

Change in §8.2: old → new. "can − cφ … is an equivalence; target `N^{≥0}/N^{≥j−i}`" → "for i ≥ 0 and (p−1)j > pi, the map factors as an automorphism followed by `can`; hence `fib((N^{≥i}/N^{≥j})/p → (N^{≥0}/N^{≥j})/p)`", with the proof route stated.

New Checks:
- Absolute 𝔽_2, j = 3: the formula gives 0, which is correct.
- Absolute 𝔽_2, j = 1: gives `𝔽_2 ⊕ 𝔽_2[−1]`, a negative control. The reviewer wrote `𝔽_2[−1]`; the derived reduction of ℤ_2/2 mod 2 adds the extra 𝔽_2.
- Breuil–Kisin, p = 2, i = 1: the true values are (H⁰, H¹) = (k, k²). The formula gives (k, k²) at j = 3 and (0, k) at j = 2, and the old target quotient gives (k, k).

Also added: the hypothesis i ≥ 0, because `can : N^{≥j} → N^{≥j−i}` is only defined when i ≥ 0.

plan.json 8.2 statement and tests were updated to match.

## F02 (P2) — applied

Verified at akn-delta lines 2116–2135 (Definition 10.6 and Remark 10.9). §8.5 changed from "a filtered δ-ring with a prism structure on the underlying ring" to: a prism (A, I) on F^0A with each `gr^iA` `I ⊗ gr^0A`-torsion free and `I ⊗ gr^0A`-complete, which is equivalent to strictness of the flat filtration on A/I.

New Check: the filtered Breuil–Kisin prism, with `gr^u = W(k)` and `I ⊗ gr^0 = (p)` (Example 10.7), plus the degenerate case of the trivial filtration. plan.json 8.5 statement and tests were updated.

## F03 (P3) — applied

The claim is right: `HC_0 = HH_0 = A`. The §2.4 Check now says that B is surjective, so the weight-m part of HC is ℚ·t^m in degree 0 and zero in degrees ≥ 1.

Same pattern fixed elsewhere: the Checks of §§2.2, 2.3 and 2.4 wrote `Π_1` for the polynomial monoid, which clashes with `Π_e` at e = 1 in §2.1 (= {0,1}). All three now write `⟨t⟩_+`. plan.json 2.4 test updated.

## F04 (P3) — applied

Verified at akn-delta lines 1986–2011. "(3), (4) and (6)" → "(4), (6) and agreement on relatively qrsp pairs with a chosen prism `(A′,I)` with Bhatt–Scholze's `Δ_{R/A′}`, or (4), (5) and that agreement (line 1991, Proposition 9.15)". plan.json 8.3 updated.

## F05 (P3) — applied

Verified at akn24 lines 501–504. "Amitsur complex of `W(k) → W(k)⟦z_0⟧`" → "of `W(k) → W(k)⟨z_0⟩`, each term completed along the augmentation `z_i ↦ 0`". The same wording was corrected in the `amitsur` API entry of plan.json 8.1. §9's reference to "the completed Amitsur complex of §8.1" already agrees.

## F06 (P3) — applied

`ℤ_p[z]` → `ℤ_p⟨z⟩`, citing PrismaticCohomologyPartIII §6.8 (syntomic complexes on p-complete rings). H¹ is the p-completion of `ℤ_p⟨z⟩^×` = {a_0 unit, a_n ∈ pℤ_p for n ≥ 1, a_n → 0}. This contains 1 + pz but not 1 + z, while `1 + zℤ_p⟦z⟧` does contain 1 + z, so the incompleteness point survives. plan.json 8.6 test updated.

## F07 (P3) — applied

Each *Needs:* line is now the union of what the paragraph uses and what plan.json lists:
- §2.4: added §2.2.
- §2.5: added §1.4.
- §2.6: added §1.1 to the README, and `target:2.3` to plan.json 2.6.
- §3.3: added KTheoryFiniteLocalFields §5.1.
- §4.2: added §4.1.

The first Check of §2.1 was split in two (Π_0 with the rank-2 unquotiented algebra, and Π_e), so the README has 4 Checks against 4 plan tests. The test counts of §8.2 (4/4) and §8.5 (4/4) also agree after F01 and F02.

## F08 (P3) — applied

"No roadmap on main, in an open roadmap pull request, or among the board's packages cites these calculations." → "No existing roadmap cites these calculations."

## F09 (P3) — applied differently

The roadmap does exist: GeneralAlgebraicKTheoryPartII is in the merge order (line 223) and its design is the board package `packages/GeneralAlgebraicKTheoryPartII/design/README.md`. That package states the chromatic purity theorem in KII.5 ("The chromatic purity theorem", for every E₁-ring and n ≥ 1). The reviewer's search of main and the open pull requests missed it.

Changes:
- The Scope deferral now cites "GeneralAlgebraicKTheoryPartII KII.5 (The chromatic purity theorem)". It adds the one-line derivation `L_{T(1)}K(ℤ/p^n) = L_{T(1)}K(0) = 0`, which holds because ℤ/p^n is T(0)- and T(1)-acyclic.
- The Downstream-consumer bullet was removed, together with the plan.json `consumers` entry. That package does not cite this roadmap and proves the result through purity, so it is not a consumer.

## Checks run

Dependency gate:

```text
candidate: RefinedTraceMethodsPartII is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 56 roadmaps, 650 edges, 0 problem(s)
```

No UPWARD or CYCLE line. GeneralAlgebraicKTheoryPartII appears only in a Scope deferral, never in a *Needs:* line or as a supplier.

`roadmaps resolve` on the edited README: no unresolved cross-roadmap citation and no unresolved Lean name. The earlier lead `BigWitt.TruncationSet` is declared in QWittVectors (README lines 114 and 122, at its open head). The new citation GeneralAlgebraicKTheoryPartII KII.5 is a board package, so the resolver does not index it; I checked it by reading that package's README.

Lean: no `Suggested.lean` exists at the design stage, so the `#check` comparison was not applicable.

## Adversarial pass on changed statements

| Statement | Instances | Values | Result / change |
| --- | --- | --- | --- |
| §8.2 finite-stage formula | BK (ℤ_2⟦z⟧, ℤ_2), i=1, j=2,3; absolute 𝔽_2, i=1, j=1,3; i<0 | truth (k,k²); j=3 (k,k²); j=2 (0,k); old target j=3 (k,k); 𝔽_2 j=3: 0, j=1: 𝔽_2⊕𝔽_2[−1]; for i<0, `can: N^{≥j}→N^{≥j−i}` is undefined | restated; added the hypothesis i ≥ 0 |
| §8.5 filtered prism | z-adic W(k)⟦z⟧; trivial filtration | gr^u = W(k), I⊗gr^0 = (p), torsion free and complete; trivial: the prism axioms | sound |
| §8.3 uniqueness | akn-delta 1986–2011 | ($),(4),(6) or ($),(4),(5) | restated |
| §2.4 Check | ℚ[t], weight m | HC_0 = ℚt^m, HC_q = 0 for q ≥ 1, (ℚ⊗(T/C_m)_+)_{hT} = ℚ | corrected |
| §8.6 Check | ℤ_p⟨z⟩ vs ℤ_p⟦z⟧ | 1+pz ∈ ℤ_p⟨z⟩^×, 1+z ∉; 1+z ∈ ℤ_p⟦z⟧^× | corrected |
| §2.1 Check split | Π_0 | k(Π_0) = k, rank 1; MonoidAlgebra k Π_0 = k×k, rank 2 | sound |
| Purity derivation | ℤ/p^n | Hℤ/p^n ⊗ S[1/p] = 0; T(1)-acyclic; L_{T(1)}K(0) = 0 | sound |

## For the maintainer

- No Lean names changed.
- The plan.json `consumers` list is now empty.
- Ownership against open pull requests was checked with `roadmaps grep`. The only new citation is the board package GeneralAlgebraicKTheoryPartII KII.5.
- No suspicious instructions were found in the review text.
- The source issue in akn-delta Proposition 8.6 that the review raised is real, but only the bound is wrong: the strict bound (p−1)j > pi is needed, and the printed target quotient `N^{≥0}/N^{≥j}` is correct.
