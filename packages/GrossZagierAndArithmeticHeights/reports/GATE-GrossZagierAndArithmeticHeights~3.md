# GATE-GrossZagierAndArithmeticHeights~3: answers to human review

Commit `38fb7305` on the PR branch: README only. `Suggested.lean` is unchanged because none of the points touch its single statement.

## H01 (CBirkbeck) — applied

§6.10 assumed "(C) and (H)" (Heegner splitting at every p|N), but the ε(N)=−1 chain 6.69 → 6.41 → 6.29 → 6.10 needs it under (C) alone. Gross–Zagier Chapter IV (0.1) and (0.3) (gz86 lines 1679–1712, pp. 267–268) define L_𝒜 and its character sums for every N prime to D. I changed §6.10 to "Assume (C)", with the Heegner case as a specialization. Its outline now covers both kinds of level prime: a split p∥N goes through the Steinberg expansion as before. For an inert p∥N, the only ideals of p-power norm are the principal (pⁱ), so the local factor is Σ a(p)^(2i)p^(−2is) = (1−p^(2k−2−2s))^(−1). That is the Steinberg × {±1} Rankin factor. I added a Check for N=11, D=−3, f=11a, where the 11-part is (1−11^(−2s))^(−1). §§6.26–6.27 also now assume (C) only. A script computing the transitive *Needs* closure of §§6.29, 6.41, 6.65, 6.66, 6.69, 6.73, 6.75 and 6.77 found §6.10 as the only (H)-restricted target in it. §6.68 keeps (H) because it is the Heegner ε(N)=+1 statement.

## H02 (CBirkbeck) — applied

The counterexample holds. I recomputed it: c₄=−71, Δ=−2160, and point counts give a₂=−1, a₃=+1, a₅=−1, a₇=−4. The prime 3 ramifies in ℚ(√−3), 2 and 5 are inert, and 7 splits. With χ((α))=α⁷ᾱ^(−5), χ((√−3))=3, so the Saito–Tunnell set is {2,3,5} and the sign is −1. The error comes from Brooks §8.1, p. 4230 (brooks line 1763), which infers the sign from the parity of N⁻ alone; that is valid only when (N,d_K)=1.

- **§9.9:** now assumes (ST): every ℓ ∈ S_f lies outside the Saito–Tunnell set of §4.2. By Tunnell this means χ°_ℓ ≠ μ_ℓ∘N for π_ℓ = St⊗μ_ℓ. With trivial nebentypus it reads a_ℓ(f)χ(𝔩) = −ℓ^(k−1), which is Castella–Hsieh (ST) (castella-hsieh line 572). The text also says why it is needed: without (ST) the CM sum vanishes while the L-value need not. The conductor-30 case is a negative-control Check.
- **§9.11:** the false clause "sign +1 (an even number of primes divide N⁻)" is replaced by (ST). The completion Σ̂_cc stays inside (ST), because ψ_t(𝔩) = (ᾱ/α)^(6t) = 1 for the even indices t = pⁿ(p−1).
- **§9.15:** now assumes a_ℓ(f) = −1 for every ℓ | (N,D_K). For every ψ ∈ Σ_cc, Frob_𝔩 is 2-torsion in Γ ≅ ℤ_p, so ψ(𝔩)=1 and χ(𝔩)=ℓ. That reduces (ST) to Skinner's (ram), and it gives sign +1 on the whole family.
- **§§9.16, 9.18:** carry the same hypothesis.
- **§8.3:** its consequence paragraph now points to (ST).

The reviewer's suggestion to state the full local distinction condition is followed literally in §9.9. The GL₂ branch (§9.14) already required (ST).

## H03 (CBirkbeck) — applied

§7.36 outline: "the Eisenstein Hecke eigenvalue σ₁(m)" → "m^s σ_(1−2s)(m) in Re(s)>1, which specializes only at s=1 to m·σ_(−1)(m) = σ₁(m)". I added a Check: at m=2, s=2 the eigenvalue is 4·(9/8) = 9/2, against σ₁(2) = 3.

## H04 (CBirkbeck) — applied

At #913 head `35be0c8`, ModularCurvesPartII §§2.1–2.3 are semistable genus-one curves, generalized elliptic curves and polygon automorphisms. The semistable X₀(N) model is in §§11.2–11.5, with the p>3 local models, corrected singular locus, regular resolution and one-factor model; the dual graph and thicknesses are in §12.1. In §9.5 *Needs*, "`ModularCurvesPartII:§§2.1–2.3` for the semistable modular model" → "ModularCurvesPartII §§11.2–11.5 (p≥5, p∥N, with its fine/coarse and resolution distinctions), §§5.1–5.4, §12.1". The Layer 9 dependency list now says the same. A new supplier-table row records §§5.1–5.4, 11.2–11.5 and 12.1 for §9.5. Other targets still cite §§2.1–2.3, but each for generalized elliptic curves or level moduli, which is what those sections contain.

## H05 (CBirkbeck) — applied

At #1494 head `44a1641`, TropicalAndBerkovichArithmetic provides what §2.3 needs:

- §§2.10–2.13: rank-one semistable reduction, the formal-model skeleton, vertex genera, and refinement with retraction composition and valued extension.
- §§3.1–3.3: polarized metric graphs and the weak Laplacian.
- §6.6: the admissible measure and symmetric mean-zero Green kernel, including the one-point and genus-one cases.
- §§6.7–6.8: model curvature and the unit/natural-log scaling.

I deleted the gap paragraph `gap:polarized-skeleton-green`. Its supplier-table row, every mention in §2.3 (statement, outline, Check, *Needs*) and the Layer 2 dependency line now cite those sections. The Scope section records that roadmap's ownership and keeps only the arithmetic normalization in §2.3. TropicalAndBerkovichArithmetic is earlier in the merge order, and depcheck shows no upward edge.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §6.10 inert p∥N factor | N=11, D=−3, f=11a, k=1 | r_𝒜(11^odd)=0; 11-part Σ11^(−2is)=(1−11^(−2s))^(−1); Steinberg×{1,−1}: (1−11^(−s−1/2))^(−1)(1+11^(−s−1/2))^(−1) at the unitary shift = same | agrees | outline and Check added |
| §6.10 split p∥N | Heegner specialization | unchanged formula | agrees | none |
| §6.10 higher conductor | p²∣N | a(p)=0 ⇒ local series 1 | agrees | stated |
| §9.9 (ST) | conductor 30, ℓ=3, χ=(7,−5) | a₃χ(𝔩)=+3 ≠ −3; Σ={2,3,5}; sign −1 | (ST) fails, sign −1 as predicted | negative Check |
| §9.9 (ST) | 8.3's 11a1, K=ℚ(√−11), χ=1 | a₁₁=+1, χ°(𝔩)=1 ⇒ ℓ∈Σ | consistent with §8.3 | none |
| §9.9 (ST), general k | |a_ℓ|=ℓ^(k/2−1), |χ(𝔩)|=ℓ^(k/2) | product ±ℓ^(k−1) | normalization consistent | none |
| §9.11 ψ_t preserves (ST) | K=ℚ(√−3), 𝔩=(√−3); K=ℚ(i), 𝔩=(1+i) | ᾱ/α=−1 ⇒ 1; ᾱ/α=−i, t even ⇒ (−i)^(6t)=1; t odd would give −1 | holds for t=pⁿ(p−1) | even-t clause added |
| §9.15 ψ(𝔩)=1 | Γ≅ℤ_p, p odd | c·Frob_𝔩·c⁻¹=Frob_𝔩=Frob_𝔩⁻¹ ⇒ 2-torsion ⇒ 1 | holds | stated |
| §9.15 χ(𝔩)=ℓ | conductor-30 example | χ((√−3))=3=ℓ | matches | none |
| §7.36 eigenvalue | m=2, s=2 and s=1 | 9/2 vs 3; at s=1: 2·(3/2)=3 | specialization only at s=1 | Check added |

`Suggested.lean` is unchanged, so no `#check` comparison was rerun; its single declaration's binders are as before.

## Ownership, citations, sources

- **Ownership:** the polarized skeleton and Green kernel now belong to TropicalAndBerkovichArithmetic, and the semistable X₀(N) model to ModularCurvesPartII. This roadmap keeps only the arithmetic normalization (§2.3) and the integration adapter (§9.5).
- **Citations:** both new ones were checked at their PR heads (`44a1641`, `35be0c8`).
- **Sources:** every new locator is in sources already in the manifest (gz86, brooks, castella-hsieh, jsw). No new source was needed, and `needs-references.toml` was not written.

## Build and gate

- `lake build TauCetiRoadmap.GrossZagierAndArithmeticHeights.Suggested`: Build completed successfully (8981 jobs), with the single expected `declaration uses 'sorry'` warning at Suggested.lean:38.
- Gate (after commit): `gate GrossZagierAndArithmeticHeights: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 55 roadmaps, 641 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
