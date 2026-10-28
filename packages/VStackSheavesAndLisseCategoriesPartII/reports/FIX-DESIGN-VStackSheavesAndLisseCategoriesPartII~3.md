# FIX-DESIGN-VStackSheavesAndLisseCategoriesPartII~3

Files edited: `packages/VStackSheavesAndLisseCategoriesPartII/design/README.md`, `packages/VStackSheavesAndLisseCategoriesPartII/design/plan.json`. `sources.toml` is unchanged: every work cited is already recorded (GHW22, LiuZhengEnhanced and LiuZhengGluing for F02).

## F01 (P2) — applied

Verified: at its head, EtaleDualityAndPerverseSheaves §6.2 (line 6284) and §6.3 (line 6563) both restrict Λ to finite ℓ-power-torsion rings or finite extensions of ℤ_ℓ, ℚ_ℓ and complexes to `D^b_ctf`; "compatibly with perfection" is VS10.8 step 1's own reduction (SchemeAndStackFoundations §§0.24, 0.23a). Change: one compound gap → two one-sentence gaps. `gap:VS-PII/G-scheme-correspondences` (§6.2: correspondences between arbitrary `D(X_ét, Λ)` objects, composition, pullback, open restriction; needed by VS10.7, VS10.8) and `gap:VS-PII/G-scheme-local-terms` (§6.3: trace classes and local terms of f-ULA complexes, base change along extensions of separably closed fields; needed by VS10.8). The same pattern was repaired at every occurrence: plan `gaps`, VS10.7 prose, Needs line and Λ = F_ℓ[t] Check (now cites §6.2's range and the correspondences gap), VS10.8 prose, Needs line and Check, the Scope paragraph, the closing sentence of "Supplier gaps", the VS10 coverage note and the plan summary.

## F02 (P3) — applied

Verified: GHW22 line 219 cites "[LZ12b, Proposition 1.4.4]"; GHW22 lines 1635–1637 make LZ12b the gluing paper; LiuZhengGluing has Remark 1.4.4 (line 1887) and no Proposition 1.4.4; LiuZhengEnhanced line 3906 (page 79) is Proposition 2.2.4 (partial adjoint), Remark 2.2.5 at line 3977 (page 81). Change: the Liu–Zheng "numbering" bullet becomes a GHW22 misprint at "§1.2, item (3), p. 5" (line 219 lies in §1.2, page 5, not §2 as the review wrote). Added as `sourceIssues` E11 in `plan.json`, so the README and plan now both list 11 corrections.

## F03 (P3) — applied differently

Verified: the SmoothRepresentationsOfLocalGroups README at its head never mentions a "distribution character" or "trace distribution". The roadmap is also earlier in the merge order, so it cannot consume VS11.3. The bullet is deleted from README and plan (`uses`). The suggested Scope clause "for Λ = ℂ" contradicts the roadmap's coefficient convention (nΛ = 0, n prime to p), and "finite length" does not make `M^K` perfect over a non-field Λ: Λ = ℤ/ℓ², trivial module ℤ/ℓ of a finite group, `M^K = ℤ/ℓ` is not perfect. The clause added instead says this roadmap owns the Λ-valued distribution character: for M in degree 0 with each `M^K` finite projective (e.g. Λ a field, M admissible of finite length), `tr.dist(M)(h ⊗ μ) = tr(I_{h,μ} | M^K)`. It also says complex Harish-Chandra characters lie outside the convention. I did not add "no roadmap states it": EndoscopicTransferAndUnitaryTraceComparison §6.17 carries complex character distributions on twisted cosets.

## F04 (P3) — applied

Each item:
- VS9 Dependencies: `EnhancedDerivedSheaves:E5:spectra-comparison` → `E5:abstract`. I also added PivotalSpherical (Layers 2, 7), AdicSpacesPartIII R3.8 and DGAInfinity 5, which VS9's Needs use.
- Line 1423: now "(HKW22 Definition 4.3.4, with the target corrected in Corrections to the sources)".
- `liftAlong`, `pushAlongProper`, `omega`, `comp` → prose names (the unique lift of Lu–Zheng Lemma 1.11; the pushed endomorphism; the description of ΩCoCorr_S; compatibility of κ with composition), in both the README and the plan proof steps.
- Line 497: dropped "DiamondEtaleCohomology"; EnhancedDerivedSheaves E2 is kept.
- VS9.7: "proper q, p" → "proper nice q, p" and "proper p" → "proper nice p" (README and plan).
- Duplicates removed from every Needs line. That covers the 5 lines named in the review and 4 more: S0.2 in VS7.1, S3.2, S4.5 and S1.3. All plan `prerequisites` are deduplicated too.
- The trailing VS4 sentences at VS8.9 and VS11.1 are merged into their lists.
- Every layer's Dependencies line is now the union of its Needs lines, recomputed mechanically:
  - VS6: + S1, S5, E2, E3
  - VS7: + VStackSheavesAndLisseCategories VS1, D4, D5, S0, E1
  - VS8: + D4, S2, S3
  - VS10: + VS6
  - VS11: + VS6, VS7, VStackSheavesAndLisseCategories VS4
- "records" → "record" (line 244; plan as well).

The review's test grep for `liftAlong|pushAlongProper|, omega\)|, comp\)|spectra-comparison|corrected\)` returns nothing in the README.

## Adversarial pass on changed statements

| Statement | Instances | Values | Result |
|---|---|---|---|
| G-scheme-correspondences needs | Λ = F_ℓ[t], ℓ ≠ p; Λ = ℤ/ℓ² | ℓΛ = 0, Λ infinite: in the needs, outside §6.2 (finite rings); ℤ/ℓ²: inside both | gap is exactly the coefficient range |
| G-scheme-local-terms needs | X = Spec k̄, c = id, F = Λ[0], Λ = F_ℓ[t] | Tr = 1 = LT; F f-ULA (Λ is dualizable) but Λ outside §6.3 | consistent with VS10.8 Check |
| G-scheme-local-terms, base change | k̄ ⊂ K both algebraically closed, X = P¹, g = az | Λ-valued sum of local terms is 2 over both fields | base change preserves the value |
| VS10.8 perfection step (left out of the gaps) | X = perfection of A¹_k | same étale site as A¹_k (§0.23a), Fix of x ↦ x + 1 empty on both | stays in VS10.8 step 1 |
| F03 clause | G = ℤ/2, Λ = F_3 (p ≠ 3), sign representation, counting measure | `I_{1_σ}` = σ, trace −1 = 2 ∈ F_3; `I_{1_1}` = id, trace 1 | equals the character |
| F03 clause, non-field Λ | Λ = ℤ/ℓ², G finite of order prime to ℓ, M = ℤ/ℓ trivial | `M^G = ℤ/ℓ` not projective over ℤ/ℓ², so the trace is undefined | needs the finite-projective hypothesis, as stated |
| F02 correction | GHW22 line 219, bibliography 1635–1637; LiuZhengGluing 1887; LiuZhengEnhanced 3906 | gluing paper: Remark 1.4.4, no Proposition 1.4.4; enhanced paper: Proposition 2.2.4 on p. 79 | correct |

## Checks

Dependency gate, run on the edited README:

    candidate: VStackSheavesAndLisseCategoriesPartII is not in the merge order yet; checked as if placed after VStackSheavesAndLisseCategories (the intake inserts it when its design is accepted)
    depcheck: 56 roadmaps, 640 edges, 0 problem(s)

There is no UPWARD and no CYCLE line. The citation resolver finds no cross-roadmap citation and no Lean name that is missing everywhere.

`Suggested.lean`: none at the design stage, so no elaboration or `#check` comparison was run.

Ownership was checked against main and the open roadmap pull requests via `roadmaps grep` ("distribution character", "Harish-Chandra character", "character distribution").

## For the maintainer

- The gap slug `VS-PII/G-scheme-local-terms` keeps its id, but its scope shrinks to §6.3 (trace classes and local terms).
- The new slug `VS-PII/G-scheme-correspondences` targets EtaleDualityAndPerverseSheaves §6.2.
- No names that other roadmaps cite were changed.
