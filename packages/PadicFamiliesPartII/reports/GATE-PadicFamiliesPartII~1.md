# GATE-PadicFamiliesPartII~1: answers to the human review of pull request head 4294fd1

There is one unanswered comment: CBirkbeck, 2026-11-13T17:19:49Z. It carries the round-7 package review of `40706dd`, with findings F01–F06, numbered here as H01–H06 in order. The repairs are in commit `96049386` (`TauCetiRoadmap/PadicFamiliesPartII/README.md` only; `Suggested.lean` is unchanged). Line numbers below are at `96049386`.

## H01 (CBirkbeck) — applied

§5.2, line 784: "polarization descended from `p² x_w λ`" → "`(p²/x_w)λ`", with each `x_v` now fixed in the Layer 4–6 standing hypotheses (line 587) as a totally positive uniformizer at v and a unit at the other places above p (BCGP21 §3.6, p. 54, line 2638), the normalization the §5.3 Check on `Norm(x_w)³/p³` already used. The vacuous first Check of §5.2 is replaced (line 797) by the degree count `|ker(Frob) × ∏_{v≠w}A[v]| = p^{4d−2}` against `|A[w] × ∏_{v≠w}A[v²]| = p^{8d−4} = (p^{4d−2})²`, with the F = ℚ witness `deg pλ = p⁴ = (p²)²`, whereas `p³λ` would leave a polarization of degree `p¹²/p⁴ = p⁸`.

## H02 (CBirkbeck) — applied

Both claims hold: the old wording admits the zero section `Spec ℤ_p → ℙ¹_{ℤ_p}` (where `i^!O = O[−1]`), whereas P20 §4.2.1 (lines 730–735) needs equal pure relative dimension and smooth opens, and AlgebraicModuliForArithmeticGeometry §7.5 (`fundamental_class_boundary`, merge-order entry 35, before this roadmap at 258) and SchemeAndStackFoundations §0.6 on main (`coherent_hartogs`) already supply the construction and the Hartogs extension. The gap:lci-fundamental-class contract is deleted and replaced by an AlgebraicModuliForArithmeticGeometry §7.5 contract with the determinant-case hypotheses, boundary hypotheses and open base change (line 167) and a SchemeAndStackFoundations §0.6 bullet (line 171), both deferrals are listed in Scope and ownership (line 15), every *Needs* and Dependencies line that cited the gap (§§3.1, 4.4a, 5.3, 5.4, Layers 3–5) now cites these sections, and the §3.1 route (line 499), which relied on a special-fibre base change that neither contract supplies, now reduces modulo p through `f^!K ≅ Lf^*K ⊗^L f^!O` (SchemeAndStackFoundations §2.19; P20 §7.4, p. 42, line 1919).

## H03 (CBirkbeck) — applied

§5.9, line 910: "Let M be a finite-dimensional subspace" → "Let M be a nonzero finite-dimensional subspace", since for M = 0 the algebra E is the zero ring and a local ring is nontrivial (Mathlib/RingTheory/LocalRing/Defs.lean:30); §5.9 has no consumer inside the roadmap. A new Check (line 919) excludes M = 0, where the maps out of 0 are injective trivially, and computes the one-dimensional case over 𝔽̄₃ with α = 1, β = 2: `U_Kli = 0`, `U_{w,2} = 2`, E = 𝔽̄₃, and `C(x,y) = (2y, −x)` satisfies `(C−1)(C−2) = C² + 2 = 0`.

## H04 (CBirkbeck) — applied

The parity `k_v ≡ l_v mod 2` of line 587 is that of BCGP21 §4.2 (line 3749), so the three Checks move as proposed: §6.4 line 1003, gap 3 → gap 4 with `m_v = 5` and bound `−3 + 5 = 2`, plus a clause that parity makes "gap ≥ 3" mean gap ≥ 4; §6.4 line 1005, k = 3 → k = 4 with `2 = k − 2`, `5 = k + 1` and reversed exponent −8; §6.5 line 1023, weight (5,2) → (6,2) with thresholds 5 and 2, k = 4 being the first even k that admits slope 0 (k = 2 gives `min(3, 0) = 0`). The same defect also stood in the §4.6 Check at line 738 (`r = min(k_w − l_w) = 1`), which now uses two places in `Jᶜ`: at `r = 2 = |Jᶜ|` the congruence gives the vacuous `p²T̃ⁿf ∈ p²A_κ`, and `r = 4` gives `T̃ⁿf ∈ p²A_κ`.

## H05 (CBirkbeck) — applied

§6.1, line 943: "the line bundle `ω^κ(−D)`" → "the finite locally free sheaf `ω^κ(−D)` of rank `∏_v (k_v − l_v + 1)`", the only such occurrence in the README. The existing classical-against-analytic Check (line 964) now carries the rank comparison: rank 1 at weight (2,2) and rank 3 for `Sym²ω ⊗ det(ω)²(−D)` at weight (4,2).

## H06 (CBirkbeck) — answered

The import this finding asks for has been present since `88b66ee` and is at `40706dd`: §3.1 (line 497) takes `T₁`, `T₂` and `T = T₁ ∘ T₂` from AlgebraicModularFormsAndSerreWeightsPartII §7.5 ("written `C_r` there") and adds only fan independence, prime-to-p Hecke commutation and the sheaf-level special-fibre reductions that §§3.2–3.3 use, with the deferral in Scope and ownership (lines 9 and 15) and in the supplier contract (line 157). The former-numbering table maps `K2/spherical` to "§3.1, with AlgebraicModularFormsAndSerreWeightsPartII §7.5" (line 22), and no factor bound outside r ≥ 2 is stated, so no change is needed.

## Build, gate and checks

- **Build.** `lake build TauCetiRoadmap.PadicFamiliesPartII.Suggested` printed `Build completed successfully (18239 jobs).` `Suggested.lean` declares nothing, so the `#check @name` comparison has nothing to elaborate, and no Lean statement changed.
- **Gate.** `gate PadicFamiliesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- **Dependency check.** `depcheck: 239 roadmaps, 2175 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` lists one lead, unchanged from before this round: "HigherHidaAndColemanTheory §§9.6: no roadmap HigherHidaAndColemanTheory on main or in an open pull request". That roadmap exists as a board package and is entry 257 of the merge order. This round did not touch it.
- **Ownership.** I checked ownership of the fundamental class against the open pull requests. AlgebraicModuliForArithmeticGeometry §7.5 owns the construction. AlgebraicModularFormsAndSerreWeightsPartII §7.5 still addresses its own gap:lci-fundamental-class to SchemeAndStackFoundations; that is a matter for that roadmap and was not edited.
- **Missing question.** The comment says it "raises 1 question that a human decides" in a section at its end. The comment as posted ends after F06 and its summary, so there is no question to answer.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §5.2 polarization `(p²/x_w)λ` | F = ℚ, x_w = p, p = 3; d = 2, p = 3; x_w also of valuation 1 at a second place | `deg 3λ = 3⁴ = 81 = 9²`; `27λ` gives `3¹²/3⁴ = 3⁸`; d = 2: `3⁴·3⁸ = 3¹² = (3⁶)²`; wrong normalization gives `p^{8d−8} ≠ p^{8d−4}` | holds; the normalization of `x_w` is needed | factor fixed; normalization of `x_v` stated; Check added |
| `Norm(x_w)³/p³` unit (§5.3) under the new normalization | p split, d arbitrary | `v_p(Norm x_w) = Σ_{v|p} v_v(x_w) = 1` | consistent | none |
| AlgebraicModuliForArithmeticGeometry §7.5 contract | zero section `Spec ℤ_p → ℙ¹`; blow-up chart `(x,t) ↦ (x,xt)`; finite flat trace | relative dimensions 0 ≠ 1, so excluded (`i^!O = O[−1]`); Jacobian determinant `x`, both dimensions 2, so included | hypotheses exclude the bad case | contract replaces the gap |
| SchemeAndStackFoundations §0.6 divisibility extension | `Spec ℤ_p[x,y] ∖ V(x,y)` with section `p·x`; `𝔸¹ ∖ 0` | quotient `x` extends uniquely; codimension 1 gives `k[x,x⁻¹] ≠ k[x]` | codimension ≥ 2 is needed and stated | bullet added |
| §3.1 reduction route | `f^!(Ω/p)` for lci f, Ω flat | `≅ (f^*Ω ⊗ f^!O)/p`, since `f^!O` is invertible | matches P20 §7.4 | route repointed |
| §5.9 E local Artinian | M = 0; dim 1 over 𝔽̄₃ (α,β) = (1,2); 2×2 Jordan block | E = 0 is not local; `T = 0, U = 2, C² = 1, (C−1)(C−2) = 0`, `α−β = −1` a unit; `E = 𝔽̄₃[N]/(N²)` local | holds for M ≠ 0 | hypothesis and Check added |
| §6.4 gap Check | gaps 2, 3, 4 | `m = 3, 4, 5`; bounds 0, 1, 2; gap 3 violates parity | gap 4 kills reflected terms; gap 2 does not | Check changed |
| §6.4 F = ℚ Check | k = 4, r = 2 | `−3+5 = 2 = k−2`; `0+5 = 5 = k+1`; reversed exponent gives `−8` | agrees with HigherHidaAndColemanTheory §9.6 ranges | Check changed |
| §6.5 thresholds | (2,2), (4,2), (6,2) | min = −2, 0, 2 | slope 0 is admitted first at (6,2) | Check changed |
| §4.6 threshold `r > |Jᶜ|` | two places with r = 2 and r = 4; one place with r = 2 | `p²T̃ⁿf ∈ p²A` is vacuous; `T̃ⁿf ∈ p²A`; `T̃f ∈ 3A` | holds; all gaps even | Check changed |
| §6.1 rank of `ω^κ(−D)` | (2,2), (4,2), ((4,2),(2,2)), ((4,2),(4,2)) | 1, 3, 3, 9 | a line bundle only when every gap is 0 | wording fixed; Check extended |
