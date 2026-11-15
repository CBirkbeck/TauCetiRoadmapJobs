# FIX-PKG-PadicHodgeTheoryPartII~4

One review, `REV-PKG-PadicHodgeTheoryPartII~3`, with one finding.

## F01 (P3) — applied

Verified. At its open head, VectorBundlesAndIsocrystals has no layer or section called VB0. Its "Layer 1: Finite isocrystals and division algebras" contains the four subsections this roadmap names: "Finite isocrystals over the completed maximal unramified coefficient field", "Rational standard Frobenius blocks", "Dieudonné–Manin classification of finite isocrystals" and "Tensor and dual calculus for isocrystals". The label "Layer 0" would also be wrong: that layer is "relative coefficient and curve foundations" and contains none of the four.

Change: `VectorBundlesAndIsocrystals VB0` → `VectorBundlesAndIsocrystals Layer 1` (README lines 19, 43, 172, 193, 246, 357, 407), and the contract sentence "Layer VB0 supplies" → "Layer 1 supplies" (line 67). The four quoted subsection titles and all the mathematics are unchanged.

Pattern search: the README has no other occurrence of VB0. I checked every other prefixed supplier label against its owner's headings: HeckeStacksAndLocalShtukas HS2.11, HS2.12, HS2.13, HS2.15 and HS2.16; DiamondsAndVStacks D0.6, D3.10, D5.3, D5.16 and D6.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3.1 and R07.3.2, at their open heads; ReductiveGroupsPartII RG2.0.2, RG2.0.4 and RG2.1.5, and ReductiveGroups Layers 1, 2, 3, 6, 7 and 10 with subsection "10B", on main. Every one resolves to an existing heading.

The same VB0 label also appears in `design/plan.json` outside its top-level `gaps` list: lines 30, 358, 359, 431, 432, 912 and 1433. This job may not edit those fields, so they are left unchanged (see "For the maintainer").

## Checks

- **Elaboration.** From the content checkout, `lake env lean packages/PadicHodgeTheoryPartII/Suggested.lean` exited 0 with no output, no errors and no warnings. No `TauCeti.*` import is used, so nothing had to be built first. `Suggested.lean` was not changed. It still has one `import Mathlib`, one module docstring and the namespace, with 0 declarations.
- **Signature audit (`#check @name`).** There are 0 declarations to audit, so no scratch `#check` file was needed and nothing changed.
- **Dependency direction.** Output of the prescribed gate:

  ```text
  depcheck: 245 roadmaps, 2241 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- **Citation resolver** (rerun on the edited README): "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."
- **Gate failures listed in the brief:** none.

## Adversarial pass on changed text

Only a supplier locator changed. For each statement that cites the relabelled supplier, I recomputed its witness against VectorBundlesAndIsocrystals Layer 1 as written at its head.

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| Contract: Layer 1 for E = `Q_{p^s}` with the q-Frobenius | s = 1, 2; residue field of `Ĕ` | For E = `Q_{p^s}`: q = p^s, `Ĕ` = Q̆_p, and the residue field F̄_p is algebraically closed, as the supplier's Dieudonné–Manin requires. The coefficient Frobenius is σ^s: σ for s = 1, σ² for s = 2 (the supplier's own Check gives σ², not σ, for the unramified quadratic E). Since E is unramified, v(π) = v(p) = 1, so the slope normalization agrees with v_p. | Matches; locator only. |
| Supplier "Rational standard Frobenius blocks" as used in §0.5 | D(1,2) and D(−1,2) over E = Q_p; D(2,2) | D(1,2): rank 2, Φ² = pσ², slope 1/2. D(−1,2): Φ²(e₀) = p⁻¹e₀, slope −1/2. D(2,2) has slope 1 and splits as D(1,1)² (not simple). In §0.5 with s = 2 and jumps (1, −1): Σd_i = 0 = v_p(det of the swap). | Unchanged. |
| §0.4 fibre ω_s from slope-zero Dieudonné–Manin | Unit; Q_p(1) (φ = p⁻¹σ, s = 1); slope-1/2 block with s = 2; zero | Unit: fibre rank 1. Q_p(1): p^{1}φ = σ, fixed space Q_p, rank 1. Slope-1/2 block: p⁻¹φ² = σ², fixed space `Q_{p²}²`, rank 2. Zero object: rank 0. Negative control: without normalization, the vectors fixed by pσ have rank 0. | Unchanged. |
| Supplier tensor and dual calculus, as used in §0.4 | Q_p(1) ⊗ Q_p(−1); D(1,2)∨; D(1,2) ⊗ D(1,2) | Slopes −1 + 1 = 0. The dual of D(1,2) is D(−1,2), with slope −1/2. h_a = h_b = 2 and a + b = 1, so h_{a+b} = 1 and the multiplicity is 2·2/1 = 4: D(1,2) ⊗ D(1,2) ≅ D(1,1)⁴, rank 4 = 2·2. | Unchanged. |
| §2.1 uniform descent (supplier: distinct slopes have no morphisms, short exact sequences split) | diag(p,1) on Q_p²; coprime D(1,2); unit | diag(p,1): slopes {1, 0}; the subobjects are the lines e₁ and e₂, both defined over Q_p. D(1,2) is simple, so its subobject ranks are only 0 and 2. Unit: the only subobjects are 0 and the whole object. | Unchanged. |

No statement, hypothesis, Check or worked example was altered, so no other row needed recomputing.

## Ownership and suppliers

- **Placement.** VectorBundlesAndIsocrystals is earlier than this roadmap in the merge order. It is a new-roadmap pull request, not a revision, so citing its own Layer 1 numbering adds no "only an open revision defines" dependency.
- **Contract content.** The supplier's Layer 1 states finite E-isocrystals for every nonarchimedean local field E with q-Frobenius over `Ĕ`, the coprime blocks D(s,r), the classification over an algebraically closed residue field (with Hom vanishing between distinct slopes and splitting), and the tensor and dual slope rules. That is exactly what line 67 records.
- **Ownership.** No target was added or moved, and no new carrier was introduced, so ownership is unchanged from the previous round.
- **Reviewer's notes.** The review's "Source issues" and "Not verifiable" sections list no finding. The review contains no suspicious instruction.

## For the maintainer

- `design/plan.json` still says "VectorBundlesAndIsocrystals VB0" at lines 30, 358, 359, 431, 432, 912 and 1433, in fields outside the `gaps` list that this job may not edit. The design record should be relabelled "Layer 1" the next time it may be edited, so that it matches the README.
- No name that other roadmaps cite changed. No Lean declaration changed, because `Suggested.lean` declares none. The two supplier gaps, `quasisplit-highest-weights` and `serre-sen-openness`, are unchanged.
