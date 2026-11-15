# FIX-RT-HigherHidaAndColemanTheory~2

Repair of red-team round 2 (passes a and b) of `packages/HigherHidaAndColemanTheory`. Files changed: `README.md` and `sources.toml`. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged, and no gap was added. The two §9.5 findings (2a/F02 and 2b/F02) concern different defects and are settled separately.

## RT-HigherHidaAndColemanTheory~2a/F01 (P1) — applied

Changed: §2.2(5) "each form a cofiltered category" → cofiltered or empty, cofiltered exactly when nonempty; parallel maps are equalized through a dense self-refinement; existence is assumed in §§2.4–2.7, concluded in §2.8(c), proved in §3.3. Two Checks: identity of 𝔸¹ (strict and compact categories empty), xy=1 (all empty). Tau Ceti contract: Cofiltered.lean:50 is `IsCofilteredOrEmpty`, :54 needs nonemptiness; `hom_unique` cited.

Verified: BP-Hida line 486–496 proves only common refinements. Mathlib `CategoryTheory.IsCofiltered` (Filtered/Basic.lean:589) includes `Nonempty`. For the identity of 𝔸¹, any compactification pulls the boundary back to (u^k), k≥1, at ∞ under both maps, and (u^(ka))⊂(u^(kb)) fails for a<b.

Pattern: the only other unconditional use was the Tau Ceti contract sentence, now corrected.

## RT-HigherHidaAndColemanTheory~2a/F02 (P2) — applied

Changed: §9.5 route, "these scalars times δ_P(a)⁻¹" → U_Kli,1 ↔ δ_P(a)⁻¹π_N(a)=δ_P(a)^(−1/2)r_P(a)=p²r_P(a), δ_P(a)=p⁻⁴; normalized scalars (wχ)(a) are usual Satake pair products, p⁻³αβ,… in the twisted normalization (Pilloni-Singular Remark 5.1.5.1). New Check: (1,1,9,9), p=3: 1/27, 1/3, 1/3, 3; ×9 gives the target, ×81 does not.

Verified: SmoothRepresentationsOfLocalGroups *jacquet-module* defines r_P=δ_P^(−1/2)⊗V_N, and *jacquet-invariants* gives the operator δ_P(a)⁻¹π_N(a). §SR.4.5 fixes T₀=q⁻³αδ, so the parameters there are p^(3/2) times the usual ones. In Roberts–Schmidt coordinates the W-orbit of χ(diag(p²,p,p,1)) is {σ²χ₂, σ²χ₁, σ²χ₁χ₂², σ²χ₁²χ₂}, the four pair products.

## RT-HigherHidaAndColemanTheory~2a/F03 (P3) — applied

Changed: §5.7 Needs AutomorphicBundlesPartII §§3.10, 3.12 → AdicSpacesPartIV §F1.10; route rewritten with the analytic closed-support triangles RΓ_(Z_(r+1)∖Z_s)→RΓ_(Z_r∖Z_s)→RΓ_(Z_r∖Z_(r+1)) and Hecke stability (BP-Coleman Lemma 5.5.4). New Check: analytic ℙ¹, closed disc, E₂=K, contrasted with completion. Layer 5 Dependencies drop §§3.10, 3.12; the §F1.10 contract bullet states what is consumed.

Verified: BP-Coleman line 931–951 (§2.3) and line 5317–5358 (§5.5.2, Lemmas 5.5.3–5.5.4) build the spectral sequence from RΓ_(Z/W)(X,F)=RΓ_(Z∖W)(X∖W,F). AutomorphicBundlesPartII §3.12 at its head is the completion/compact-support filtration and says it is not identified with local cohomology. AdicSpacesPartIV §F1.10 (*de-rham-cohomology-with-supports*, on main) states RΓ_Y of a sheaf, including coherent F, and the triangle for Z⊆Y.

Pattern: no other analytic target cites §§3.10–3.12; §§2.2, 2.8 and 3.6, which do, are scheme-level and keep them.

## RT-HigherHidaAndColemanTheory~2a/F04 (P3) — applied

Changed: §4.3 "tail" Check → cofinality count (rank (p−1)p^(n−1); constant tower rank p−1) plus the reviewer's derived-reduction Check. §7.3 D=∅ Check → the reviewer's A[ε]/(ε²) image-algebra Check. §9.4 "not finite" Check → fibre count (p lifts over ordinary, 1 over p-rank one; Pilloni-Singular Lemma 9.1.1.1, Remark 9.1.1.2) plus the reviewer's Igusa count, Isom (2,6,18) against Hom (3,9,27).

The §§4.3 and 9.4 replacements test the very property the replaced bullet restated. The reviewer's tests are kept as well.

## RT-HigherHidaAndColemanTheory~2b/F01 (P3) — applied

Changed: a new subsection "From TauCetiRoadmap.LocallyAnalyticRepresentationsOfLocalGroups" sits between LocallyAnalyticDistributions and OverconvergentAutomorphicForms:
- §1.4 items (ii)–(iii): strict morphisms with closed image, and closed invariant subspaces are admissible;
- §5.1 items (i)–(ii): induction is closed, of compact type and admissible; B(F)G₁ is open and closed, so restriction gives the induction from B∩G₁ to G₁.
It also notes that roadmap's coefficient-field convention.

Verified against that roadmap's README at its open head (§1.4, §5.1, Conventions item 5: inductions unnormalized).

## RT-HigherHidaAndColemanTheory~2b/F02 (P3) — applied

Changed: SmoothRepresentationsOfLocalGroups §SR.2.3 is added to Layer 9's Dependencies. The contract §SR.2.2 bullet now names *jacquet-module* (r_P=δ_P^(−1/2)⊗V_N), *parabolic-induction* and *geometric-lemma*. A new §SR.2.3 bullet states *jacquet-invariants*: surjectivity, and [K₀aK₀]↔δ_P(a)⁻¹π_N(a) for contracting a, used with Kli(p) and diag(p²,p,p,1).

Verified against SmoothRepresentationsOfLocalGroups on main, §§SR.2.2–SR.2.3. A mechanical Needs-against-Dependencies comparison now gives the empty set both ways for Layers 1–9.

## RT-HigherHidaAndColemanTheory~2b/F03 (P3) — applied

Changed: §4.7 "act on the filtered colimit … then on the derived p-adic limit; relations persist" → transport through End_(D(Λ))(M_w^ε)≅lim End(M_w^ε⊗^L Λ/J_(m,n)) (DeformationAndDerivedPatchingAlgebra §7.8 per local factor; finite Hom groups kill lim¹), M⊗^L Λ/J_(m,n) being dual to the finite-level complex (§§4.1–4.5, CompletedCohomologyPartII §3.12). Route updated; Needs gain §4.1, §4.4, CompletedCohomologyPartII §3.12; new "unique lift" Check.

Difference from the proposed text: the lim¹ vanishing is cited from the supplier statement already in the Needs (complete noetherian local rings, bounded finite free complexes), applied factorwise to the semi-local Λ, instead of being reproved.

## RT-HigherHidaAndColemanTheory~2b/F04 (P3) — applied

Changed: §9.9 gains a **Checks.** block with three Checks:
- n=1, ν=(2,0): κ=(−3,1), (0,−2), and the inverse formula returns (2,0);
- the action convention at n=2, ν=(4,2,0): w₂ gives κ₂=(0,−2,−4), while the other convention gives (−6,1,−1), not M-dominant, and the involution w₁ cannot tell them apart;
- duality with 2ρ_nc=(1,1,−2): κ₀∨=(4,2,0)=κ₂(−w0ν) and κ₁∨=(4,−1,3)=κ₁(−w0ν).

Verified: w0M w₀ w0=(3,1,2)=w₂ and w0M w₁ w0=w₁. The identity κ_w(ν)∨=w(ν+ρ)−ρ uses w0Mρ_nc=ρ_nc.

## Checks run

- Lean: `lake env lean packages/HigherHidaAndColemanTheory/Suggested.lean`, run from the content checkout, exits 0 with no messages. The file declares nothing (an empty namespace and the docstring), so the `#check @name` comparison has nothing to compare, and nothing changed. No headline was affected by these findings.
- Dependency check: `depcheck: 245 roadmaps, 2232 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line (run after all edits).
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. Names outside TauCetiRoadmap were not checked by the tool, so they were checked at the pins by hand: `TauCeti.Compactification.hom_unique` (Uniqueness.lean:45), `CategoryTheory.IsCofilteredOrEmpty` (Mathlib Filtered/Basic.lean:576, instance at Cofiltered.lean:50), `CategoryTheory.IsCofiltered` (:589).
- Layer consistency: external Needs equal Dependencies in Layers 1–9. Every roadmap named in a Needs line has a contract subsection; HodgeTateAndCanonicalSubgroups is consumed only through its two gaps.
- `sources.toml`: BP-Coleman's locator gains Lemma 5.5.4 (980 characters, under the 1000 limit). Pilloni-Singular Remark 5.1.5.1, Lemma 9.1.1.1 and Remark 9.1.1.2 already lie inside its §5.1.5 and §§9.1–9.4 locators. No new source; no `needs-references.toml`.
- No gate failures were listed for this round.

## Adversarial pass (new or changed statements)

| Statement | Instance | Computed | Result |
| --- | --- | --- | --- |
| §2.2(5) cofiltered or empty | identity of 𝔸¹/𝔽₂ | dynamical: ℙ¹, D+={∞}; strict: (u^(ka))⊄(u^(kb)) for a<b; compact: every neighbourhood of c meets C | strict and compact empty; Check |
| §2.2(5) | C={xy=1}, X=𝔸¹ | c∞↦(x̄,0), c0↦(0,x̄); x̄∈D+ forces p1(c0)∈D+ | all empty; Check |
| §2.2(5) | proper point | identity compactification, empty boundaries | nonempty, cofiltered |
| §2.2(5) parallel maps | dense self-refinement R→C′ | preimage of X in closure of Δ_X is X (graph closed), so strict; maps out of R unique | holds |
| §9.5 normalization | p=3, (1,1,9,9) | δ_P(a)=3⁻⁴; r_P scalars 1/27, 1/3, 1/3, 3; ×9 gives 1/3, 3, 3, 27; ×81 gives 3, 27, 27, 243 | p² fixed; Check |
| §9.5 orbit | RS (χ₁,χ₂,σ) | f=χ₁²χ₂σ²; s₂ fixes f; orbit {σ²χ₂, σ²χ₁, σ²χ₁χ₂², σ²χ₁²χ₂} | = α₀β₀, α₀γ₀, β₀δ₀, γ₀δ₀ |
| §5.7 closed supports | analytic ℙ¹, Z₁ = closed disc | E₁: H⁰(U), H⁰(U)/K; H⁰_Z=0, H²_Z=0; d₁ = quotient; E₂=K | equals H*(ℙ¹,O) |
| §5.7 contrast | 𝔸¹, t=0 | completion (k[[t]],0); closed support (0, k[t,t⁻¹]/k[t]) | differ |
| §4.3 cofinality | p=3, T_n=1+3^nℤ₃ | ranks 2, 6, 18, …; colimit C^0; constant tower rank 2 | discriminates |
| §4.3 derived reduction | ℤ/p^m tower | ℤ_p⊗^L𝔽_p=𝔽_p; 𝔽_p⊗^L𝔽_p=𝔽_p[1]⊕𝔽_p | discriminates |
| §7.3 image algebra | N=Ae₁⊕Ae₂, εe₂=e₁ | Ann(N)=0; Ann(Ae₁)=(ε); ranks 2 and 1 | same points, different structure |
| §9.4 transition degree | genus 2, m≥2 | p^(m−1)(p+1) summand lines; p lifts; 1 at p-rank one | not finite (Remark 9.1.1.2 agrees) |
| §9.4 torsor | p=3 | (ℤ/3^n)^×: 2, 6, 18; Hom: 3, 9, 27 | Isom ≠ Hom |
| §4.7 End bijection | Λ=ℤ₃[[X]], M=Λ[0] | Λ/J=ℤ/3^m[ℤ/3^n]; Hom^(−1)=0; 3²=6+3·1 in ℤ | unique lift |
| §4.7 semi-local Λ | p odd | Λ=∏ over characters of μ_(p−1)^(g+1) of local rings; p=2 local | §7.8 applies factorwise |
| §9.9 n=1 | ν=(2,0) | κ₀=(−3,1), κ₁=(0,−2); ν_w returns (2,0) twice | = |
| §9.9 convention | n=2, ν=(4,2,0) | w₂: (2,−1,5)→(0,−2,−4); other convention: (−1,5,2)→(−6,1,−1) | inverse convention needed |
| §9.9 duality | 2ρ_nc=(1,1,−2) | κ₀∨=(4,2,0)=κ₂((0,−2,−4)); κ₁∨=(4,−1,3)=κ₁((0,−2,−4)) | = |
| LARLG contract | B(F)G₁ ⊂ M(F) | finitely many open double cosets, so open and closed; restriction is an isomorphism onto the induction to G₁ | holds |

## Ownership and citations

No new target or construction was introduced. Ownership was compared against the files this brief gives:
- LocallyAnalyticRepresentationsOfLocalGroups and AutomorphicBundlesPartII at their open heads;
- CompletedCohomologyPartII and DeformationAndDerivedPatchingAlgebra through `roadmaps show`;
- SmoothRepresentationsOfLocalGroups and AdicSpacesPartIV on main.

Every cited section exists there with the content quoted.

## For the maintainer

- No section, target or Lean name of this roadmap changed, so citing roadmaps (PadicFamiliesPartII) are unaffected.
- Supplier edges:
  - §5.7 now consumes AdicSpacesPartIV §F1.10 (on main, already a supplier) instead of AutomorphicBundlesPartII §§3.10 and 3.12, which Layers 2–3 still consume.
  - §4.7 now also consumes CompletedCohomologyPartII §3.12, already in Layer 4's Dependencies.
  - The LocallyAnalyticRepresentationsOfLocalGroups and SmoothRepresentationsOfLocalGroups §SR.2.3 edges were already in Needs and now have contracts.
- No suspicious instructions were found in the reviews or in the texts read.
