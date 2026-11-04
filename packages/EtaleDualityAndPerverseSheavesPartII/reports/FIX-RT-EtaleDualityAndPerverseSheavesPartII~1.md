# FIX-RT-EtaleDualityAndPerverseSheavesPartII~1

Two red-team reviews (pass a: F01–F05, pass b: F01–F03), eight findings in all. No two findings overlap: a.F01 and b.F01 concern different steps. All eight were verified against the cited sources and suppliers. All eight are applied, one in a different way from the one suggested (b.F02 took the reviewer's option (i); b.F03 took the docstring option).

## F01 (P2) — applied

Review RT-EtaleDualityAndPerverseSheavesPartII_r1a, finding F01 (cited below as a.F01).

Old (§5.6 route): "the cohomology of U depends only on the combinatorics of the boundary", with "same combinatorics" never defined. New: a named **Branch comparison** step in §5.6. It defines same combinatorics along F (regular strict henselizations; Z snc with branch equations f_i; images of g*f_i linearly independent in m/m² of X′_(z′)) and proves g*(Rj_*ℤ/n)|F′ ≅ (Rj′_*ℤ/n)|F′ from purity and Kummer classes (ILO XV 2.1.4–2.1.7, ILO14 line 10400). The route now states the hypercover form and requires the approximation to keep the branch images independent. Two Checks were added: the t ↦ u^ℓ negative control and a positive unit case.

Same pattern elsewhere: §0.7 "keeping … the combinatorics of the divisors" now reads "keeping each branch equation part of a regular system of parameters".

Evidence: ILO14 lines 10400–10425. The source's 2.1.4(iii) names the maximal ideal of Z′(z′); the README states it for X′(z′), because g*f_i vanishes on Z′.

## F02 (P2) — applied

Review RT-EtaleDualityAndPerverseSheavesPartII_r1a, finding F02 (cited below as a.F02).

Old: the ownership paragraph said "§2.1 adds equivariance and the birational quotient conclusion", and §2.1 rebuilt the stable-extension/equivariant curve step itself. New:
- Ownership names ClassicalAdicEtaleCohomology §5.4, the curve step of `PlurinodalAlteration.exists`, as owner of marked stable extension, flattening, marked sections, simultaneous-translate equivariance and nodal quotients.
- §2.1 uses that step and keeps only what it adds: the D/T′/Z control, generic étaleness, and the birational quotient. The birational quotient follows from DJ97 (2.2.1)+(2.2.5): the invariant extension is purely inseparable and separable, so it is trivial.
- The supplier contract, the §2.1 Needs and the Layer 2 Dependencies cite the supplier.

Verified at ClassicalAdicEtaleCohomology README §5.4 (open head, `roadmaps show`): the curve-step paragraph cites DJ97 2.4 and Remark 2.5. Its exported corollary records only a purely inseparable invariant extension, so §2.1's statement is not a duplicate.

## F03 (P3) — applied

Review RT-EtaleDualityAndPerverseSheavesPartII_r1a, finding F03 (cited below as a.F03).

- §0.6 (U(X)) had 2 Checks. The dimension-bound restatement was replaced by three computed Checks: X empty (zero members); the node xy = 0 (identity fails, normalisation gives 2 lines, each with one boundary point); Spec(k×k) (exactly 2 members).
- §8.1: the two endpoint bullets that restated the API were replaced by the 𝒪_C × 𝒪_C example (four opens; Spec 𝒪_C ⊔ Spec C matches Spec 𝒪_(C^♭) ⊔ Spec C^♭, not the swapped open). §8.1 now has three discriminating Checks.

## F04 (P2) — applied

Review RT-EtaleDualityAndPerverseSheavesPartII_r1a, finding F04 (cited below as a.F04).

Old (§2.4): "applied with the preimage of Z and of the degeneracy loci". New: a split construction. §2.2/§2.3 are applied to the matching object M with boundary only the preimage of Z. That preimage is nowhere dense because M is maximally dominant over X and Z contains no maximal point. The forced degenerate summands are copies of earlier regular levels. A new Check computes the X = Spec k, Z = ∅ witness. The source (ILO XIII 2.2.1, ILO14 line 9329) invokes the classical split construction.

## F05 (P3) — applied

Review RT-EtaleDualityAndPerverseSheavesPartII_r1a, finding F05 (cited below as a.F05).

Old: "Q6.3–Q6.7 supply … transfer of adic completeness". New: §Q6.2 supplies completeness transfer, under its hypothesis that ϖ^♭ divides ξ_0. Q6.3–Q6.7 supply valuation-ring tilting, completeness of localizations and algebraically closed fraction fields. Q6.2 was added in the ownership paragraph, the supplier contract, the §8.4 route and Needs, the §8.5 route and Needs, and the Layer 8 Dependencies. Verified at `packages/PerfectoidQuotientsPartII/design/README.md` §Q6.2.

## F01 (P1) — applied

Review RT-EtaleDualityAndPerverseSheavesPartII_r1b, finding F01 (cited below as b.F01).

Verified: SchemeAndStackFoundations (main) §0.13 states only flatness, quotients, noetherianity, colimits and integral base change for henselization. §0.16 states universal catenarity of CM rings. §0.21 states permanence only under finite type and localization. None of them states henselization permanence of (quasi-)excellence, or that a henselian quasi-excellent local ring is universally catenary. No other roadmap does either (`roadmaps grep` by object, plus the board packages).

Changes:
- New supplier gap `gap:henselian-quasi-excellent-catenary` (SchemeAndStackFoundations §0.21), added to the `gaps` list in `design/plan.json` and under "Exact supplier contracts", with sources ILO14 I 8.1 (line 850), I 6.3(ii) (line 768) and XIV 1.3.2 (line 9860).
- "including henselization" was replaced by "under finite type and localization".
- The gap is cited in the routes or Needs of §§0.6, 0.7, 5.1, 5.2, and also §§5.4, 5.6 and 6.1, which pass to strict henselizations of (quasi-)excellent schemes in the same way.

## F02 (P3) — applied

Review RT-EtaleDualityAndPerverseSheavesPartII_r1b, finding F02 (cited below as b.F02). Applied with the reviewer's option (i).

Verified: ILO14 lines 13886–13917 (XVII §5.2) contain the recalled t-structure, Definition 5.2.1 and Proposition 5.2.2, and no gluing statement. In the source, uniqueness of potential dualizing complexes comes from XVII 5.3.1(b)–(c) (line 13938) and 5.4.1.

Deleted: the stack sentence in §6.5, the stack API bullet, the descent sentence in the §6.5 route, and "Étale descent in the perverse heart glues …" in §6.6. The §6.6 uniqueness and τ≤0 claims now cite 5.3.1(b)–(c) and 5.4.1. The §6.5 route now states what Proposition 5.2.2 does provide. Nothing else used the stack property (grep for "stack" and "glue").

## F03 (P3) — applied

Review RT-EtaleDualityAndPerverseSheavesPartII_r1b, finding F03 (cited below as b.F03). Applied with the docstring option.

The `Suggested.lean` module docstring now says that Epp's theorem (README §1.3) is an intermediate theorem of the mixed-characteristic Cohen–Gabber proof, not a headline, and is not stated. It was not encoded in Lean because it is not one of the roadmap's end theorems (Summary, How to read the build).

## Checks run

- `lake env lean packages/EtaleDualityAndPerverseSheavesPartII/Suggested.lean` (from the content checkout): success. Output is six `declaration uses 'sorry'` warnings (lines 57, 79, 170, 214, 250, 268) and no errors. No `TauCeti.*` import.
- `#check @name` for all 9 declarations in one scratch file: elaborated with no errors. The types are identical to the supplied signatures. No declaration changed; only the docstring did. No binder was lost.
- Dependency check: `depcheck: 56 roadmaps, 654 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.

## Adversarial pass on added or changed statements

| Statement | Instances | Computed values | Result / change |
| --- | --- | --- | --- |
| Branch comparison (§5.6) | strict traits, t ↦ u^ℓ; t ↦ v·u; F = ∅ | u^ℓ ∈ m², image 0 in m/m²; H¹(η, ℤ/ℓ(1)) = ℤ/ℓ, class of t ↦ ℓ·[u] = 0, so the map is 0, not iso. v·u: image ≠ 0; [v] = 0 because units are ℓ-th powers, so the map is id on ℤ/ℓ. F = ∅: both sides 0 | hypothesis excludes the witness; both cases added as Checks |
| Same-combinatorics definition | z ∈ F ⊆ Z | r ≥ 1 at every z′, so (iii) is never vacuous; source misprint Z′ → X′ (with Z′, every g*f_i = 0 and (iii) would always fail) | stated with X′ |
| §2.4 split construction | X = Spec k, Z = ∅; X regular with snc Z | M = X₀ ×_X X₀ = point. Old boundary = M (not rare); new boundary = ∅. Constant hypercover: N_(n+1) = ∅ for n ≥ 0 | old failure removed; Check added |
| §2.1 quotient argument | G = 1 identity; P¹_L/K | identity: all invariant degrees 1. P¹_L: (2.1.5) fails, so (2.2.1) is not available, consistent with the existing Check | consistent |
| Gap statement | Nagata catenary non-u.c. local domain; field; k[t]_(t) | Nagata: not quasi-excellent, so the gap says nothing (as it must: henselization would not be u.c.). Field: henselian, excellent. k[t]_(t)^h: QE and henselian, so excellent; its δ = (1, 0) satisfies the drop-by-one rule | true; no reducedness needed (I 8.1 has none) |
| §0.6 Checks | ∅; xy = 0; Spec(k×k) | 0, 2 and 2 members; normalisation degree 1 on each line | correct |
| §8.1 product Check | 𝒪_C × 𝒪_C | V(ϖ) = {s₁, s₂}, 4 opens; complement {s₂} ↔ {s₂^♭} | correct |
| §6.6 uniqueness reroute | normal strictly local X of dimension 1 (strict DVR), δ(η) = 0 | φ(s) = max(0, 2·1 − 2) = 0, so T = τ≤0 Rg_*Λ = g_*Λ = Λ (ILO14 line 13953); a potential complex K maps isomorphically to T = Λ by 5.3.1(b) | consistent |

## Notes for the maintainer

- New supplier gap for SchemeAndStackFoundations §0.21: `henselian-quasi-excellent-catenary`.
- §2.1 now depends on the curve step inside ClassicalAdicEtaleCohomology §5.4, which that roadmap plans only as part of the proof route of `PlurinodalAlteration.exists`, not as a separately exported statement. If that roadmap ever drops the step, §2.1 has to reprove it.
- Ownership was checked by object against main, the board packages and every open roadmap pull request with `roadmaps grep` ("same combinatorics", split hypercovers, henselian quasi-excellent). No other owner was found. No Lean names changed, and no names cited by other roadmaps changed.
- The four citations the resolver could not find (AdicCoefficientsAndComparisonsPartII, ArcTopologyAndDescent, PerfectoidQuotientsPartII, PurityForFlatCohomology) are board design packages. They are present on the board, and the PerfectoidQuotientsPartII sections were reread for a.F05.
- No suspicious instructions were found in the reviews.
- No new source was needed; `needs-references.toml` was not created.
