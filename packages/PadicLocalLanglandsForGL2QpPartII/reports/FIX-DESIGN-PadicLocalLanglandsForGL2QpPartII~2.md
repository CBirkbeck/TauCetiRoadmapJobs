# Repair report: PadicLocalLanglandsForGL2QpPartII, design round 2

This round settles the fourteen findings of the review of `packages/PadicLocalLanglandsForGL2QpPartII/design/README.md`. The README is rewritten in TauCetiRoadmap form (findings F02 and F11 require this), and `design/plan.json` is rebuilt from it. `sources.toml` is new. Sources read:

- DLB17 at arXiv:1509.00606v2. Its numbering agrees with the review's and the README's; the HAL v1 copy does not, since for example its Théorème 9.6 is Théorème 9.7 in v2.
- CDN20, the authors' copy.
- CDN23, the HAL copy hal-04289191.
- COLMEZ19POIDS, the author's copy.

Locators are given as `<source id> line N` of these texts.

## F01 (P1) — applied differently

**What changed.** Every one of the eighteen old proof contracts is now either a target of this roadmap or a declared gap with supplier, section and a one-sentence `needs`. These appear in the plan's top-level `gaps` (keys `slug`, `supplier`, `section`, `needs`, `neededBy`) and as "What X must provide (gap:slug)" lines under "Exact supplier contracts".

**Where this differs from the review's table.**

- **G2.** PadicDifferentialEquationsAndRigidCohomology §RD.2.43 supplies the bijectivity of ∂ (its application step is DLB17 Prop. 6.4). The finiteness of ker P(∇) is part of target §1.2. Continuity of ∂⁻¹ is dropped, since no consumer uses it.
- **G4.** Dropped. tN_rig⊠ℙ¹ is imported from parent §4.2a, whose route is Colmez VI.6.41 and does not use DLB17 Prop. 8.4.
- **G6.** Dropped, together with the targets it served (F02).
- **G7.** Split. The CDN20 fundamental diagram is target §4.1: `roadmaps grep` finds no owner of pro-étale cohomology of the Drinfeld tower or of p-adic Stein spaces. Half-plane cohomology is §4.2 and the tree-cover patching is §4.9. Hyodo–Kato is LocallyAnalyticDistributions §0.CR.6.6 and the Stein covers are EndoscopicTransfer §12.21. Strauch's components are gap:drinfeld-components.
- **G9.** Kept as gap:cuspidal-projectivity-coefficients on SmoothRepresentationsOfLocalGroups §SR.3.2. It is now needed by the new §3.3.
- **G12.** Target §5.4, using parent §§5.1, 5.3. The extension to the non-compact target is CDN23 Prop. 5.21 itself, so it is owned here.
- **G13 and G14.** Target §6.1, comparing with parent §5.8 and using parent §5.12 `KisinRingLL.completion`.
- **G15.** Targets §6.3 and §6.5. LocalGaloisDeformationRings §3.8 states the PID decomposition and the universal trace but not a rigidity lemma, so CDN23 Lemme 5.12 is stated here.

**Other dispositions.** G1 is §0.4, G3 is §1.5, G5 is parent §4.2a plus §2.3, G8 is §3.1 plus §7.3, G10 is Mathlib plus §§4.5 and 4.13, G11 is §4.3, G16 is §§3.3 and 7.2, G17 is §7.4 and G18 is §7.6.

## F02 (P1) — applied differently

**Deleted.** The fourteen targets duplicated by parent §§4.2a, 4.11 and 6.9 are deleted and imported by name and section in "Scope and ownership". So is the `move` restructure. Kept as refinements, each with a clause on how it goes beyond the base: common-image (§2.1), homography (§2.2), kirillov-independence (§3.2) and pi-zero-irreducible (§2.3).

**Where this differs.** nonzero-comparison is not simply deleted. Parent §6.9 has only the *hypothesis* `DrinfeldComparison.global_nonzero_map`. Since the consumers in Layers 4–7 need the unconditional comparison, §3.1 discharges that hypothesis; it carries E3.

**Repairs inherited by parent §6.9.** These become four declared gaps on parent §6.9:

- E1 → gap:halfplane-module-continuity;
- E7 → gap:two-sided-resolvents, because the parent builds the resolvents (∂−x)⁻¹;
- E9 → gap:smooth-kernel-twisted-coefficients;
- E10 → gap:fixed-radius-divisibility.

**Repairs not inherited by the parent.**

- E5 concerns DLB17 Thm 8.3, which is used by §2.1 here.
- E6 concerns DLB17 Prop. 8.4, which the parent avoids by its Colmez route.
- E8 concerns §12.2, which is §7.6 here. The parent applies Thm 10.1 in the fixed ρ-sector, which is correct.

## F03 (P1) — applied differently

- **LR citations.** Repointed to parent §0.1 (LA, D(H,L), coadmissible modules, Schikhof duality, Π^an) and LocallyAnalyticDistributions §§0.0, 0.2 and 0.3. The derived Lie action is gap:derived-lie-action (LocallyAnalyticRepresentationsOfLocalGroups, Layer LR.0, *The derived action of the Lie algebra*): neither parent §0.1 nor any roadmap on main or in an open pull request states it.
- **SZ citations.** These became gap:modp-drinfeld-finite-length (Layer 5, *Finite length … (CDN Theorem 4.1)*) and gap:drinfeld-components (Layer 0, *Connected components … (Strauch)*). Both sections were read on the board's copy of that design. SZ.6 is not needed, because Corollaire 4.21(c) is clause (c) of the Layer 5 theorem.
- **MP.1.** Deleted, since no target uses it.
- **Gate.** The gate reports no problem with these suppliers (see below).

## F04 (P2) — applied

Every atlas label is replaced by the section that supplies it, checked against each supplier at the head of its open pull request:

- parent §§0.1, 0.2, 1.1–1.7, 2.5, 2.7, 3.1–3.11, 4.1k, 4.2a, 4.9, 4.11, 5.1–5.8, 5.12, 6.7 and 6.9;
- EndoscopicTransferAndUnitaryTraceComparison §§12.4, 12.5, 12.7, 12.14, 12.19 and 12.21;
- PadicHodgeTheory §§3.3, 4.4, 5.1–5.4 and 8.1;
- PhiGammaModulesAndIwasawaCohomology §§2.4, 5.4, 5.6a and 5.7, with their declaration names;
- GL2AutomorphicRepresentationsAndTransfer R16.3, R17.3 and R17.3.12;
- CompletedCohomologyAndLocalGlobalCompatibility §4.9;
- LocalGaloisDeformationRings §3.8.

Jacquet–Langlands is `DivisionAlgebraTypes.jacquetLanglands` (parent §6.9) throughout. `roadmaps resolve` finds no unresolved citation.

## F05 (P2) — applied

**New target §3.3.** For every supercuspidal M ∈ ΦNᵖ_n, of any central character ζ with ζ(p) = 1, it proves the functions and de Rham realisations on M^p_n. M_dR is kept distinct from M*_dR, and the dictionary §0.4(c) recovers parent §6.9 when ζ = 1. The sources are DLB17 Rem. 1.3(a) (line 159), CDN23 Prop. 5.7 with footnote 30 (lines 2438–2448) and CDN20 Thm 0.4 (line 268).

**Consumers updated.** §§4.1, 4.7, 4.12–4.14, 6.4–6.6, 7.2 and 7.5 now use §3.3.

**p = 7 Check.** The square of a character of μ₆ has order dividing 3, while ω|μ₆ has order 2. So no twist of π reaches trivial central character, but M ∈ ΦNᵖ because ω(7) = 1. This is a Check in §3.3 and in the Layer 0 Examples.

## F06 (P2) — applied

**Restated targets.** §§4.12, 4.13 and 4.14 (and §§4.1, 4.7, 4.11, 6.4 and 6.6) now require M ∈ ΦNᵖ_n. For the Steinberg branch they require Sp⊗δ ∈ ΦNᵖ_n, that is δ(p)² = 1 with δ∘Nrd of level ≤ n.

**Negative control.** Take χ unramified with χ(p) = 1+p. Then p acts on JL(M) by χ(p²) = (1+p)² ≠ 1, so the Hom vanishes. This Check appears in §§0.1, 4.12, 4.13 and 4.14.

**Source correction E16.** It cites CDN23 lines 2424–2473, whose proofs decompose over ΦNᵖ (line 2434). §4.14 notes that the full-tower statement, CDN23 Thm 5.1 (line 2357), keeps "level ≤ n".

## F07 (P2) — applied differently

Each gap now cites its provider:

- **G2.** RD.2.43, which gives the bijectivity of ∂.
- **G4.** Dropped (F01).
- **G5.** Parent §4.2a's `AnalyticBoxtimes.filtrationIndependentAction`, with irreducibility as §2.3.
- **G7.** LocallyAnalyticDistributions §0.CR.6.6 and EndoscopicTransfer §12.21.
- **G8.** GL2AutomorphicRepresentationsAndTransfer R17.3.12 and CompletedCohomologyAndLocalGlobalCompatibility §4.9 in §3.1.
- **G10.** The three Mathlib theorems, with the CDN23 Lemmes 5.4, 5.5 and 5.9 steps placed inside §§4.5 and 4.13.
- **G13.** Parent §5.8. §6.1 records the fibre Π(ρ_x(ε)) against Π(ρ_x)′_b.
- **G14.** Parent §5.12 `KisinRingLL.completion`.
- **G17.** `allLevelExp_iff_tNrig`, with freeness of rank two as §7.4.

**Two corrections to the review's suggestions:**

- RD.2.43 covers DLB17 Prop. 6.4 completely. The residual item is ker P(∇) of Lemme 6.3, now inside §1.2.
- §6.1's comparison with parent §5.8 is stated as a relation through the twist ε and duality, not as a new Check of a computed value.

## F08 (P2) — applied

**No compound gaps remain.** Each of the eight gaps names one result, with its domain, hypotheses and output. The old compound G7 and G8 are split into targets §§3.1, 4.1, 4.2, 4.9 and 7.3, plus gap:drinfeld-components.

**Process text removed.** "has no stage/node in this checkout" is gone.

**Consistency.** Slugs agree between README and plan.json, and every consumer's *Needs:* line lists its gaps. In the plan, `neededBy` is computed from the README.

## F09 (P3) — applied

**Supplier contract.** `NormedSpace.image_isVonNBounded_iff` (Bounded.lean:495) and `WithSeminorms.image_isVonNBounded_iff_seminorm_bounded` (WithSeminorms.lean:595) were checked at Mathlib 6b7abb3c. Both are cited under "From Mathlib", together with `WithSeminorms.isVonNBounded_iff_seminorm_bounded` (line 575) and `WithSeminorms.banach_steinhaus`.

**§4.8.** The two criterion bullets are deleted. The subspace and functoriality API is kept, and the "∀i ∃C_i, not ∃C ∀i" Check is retained.

## F10 (P3) — applied

The pins are now Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, in the README and in plan.json `baseline`. The Suggested.lean and lean-check sentences are deleted. plan.json `leanStatus` now says "Design stage: no Lean file …", and the README states that no headline theorem is statable at the pins.

## F11 (P3) — applied

The README now has the house sections in order:

- title and **Summary**;
- Scope and ownership, Conventions, Exact supplier contracts and How to read the build;
- Layers 0–7, each with its subsections, *Needs:* lines, Examples and Dependencies;
- Downstream consumers, Source corrections and References.

Removed: atlas and extraction IDs, the 137-row routing table (kept as data in plan.json with remapped targets), access dates, "Status: Recorded in PAPER-…" lines, "Atlas planet" lines, field-list formats and ownership "proposals". The plan's `restructure` list is emptied.

## F12 (P3) — applied

§2.3 now cites DLB17 Remarque 1.8 (DLB17 line 410) and Colmez's theorem. That theorem is COLMEZ19POIDS Théorème 0.3(ii) (line 179), fetched from the author's page and recorded in the manifest. Its Remarque 0.2(ii) (lines 161–166) identifies Π(π,0) with Π(M,−1). Printed Annals pages are dropped everywhere: the published copy was not read.

## F13 (P3) — applied

§1.6 now states (N⁺_dif,n(V̌))^⊥ = tN⁺_dif,n(V) for every de Rham V. The derivation is N⁺(V̌) = L_∞[[t]]⊗D_dR(V)*⊗t⁻¹dt, with residues of t^{m−1}dt. DLB17 Prop. 7.7(b) (line 1568) prints t^k. E4 now says the exponent is 1 for every k ≥ 1, the two forms agreeing at k = 1. A Check shows that te ∈ tN⁺ \ t²N⁺ is orthogonal at k = 2.

## F14 (P3) — applied differently

The package had no `sources.toml` in this checkout, so it was created through the sources service with four entries:

- DLB17, from arXiv v2 rather than the review's HAL or Annals copies, because the numbering must match;
- CDN20, the authors' copy;
- CDN23, from HAL, with the DOI;
- COLMEZ19POIDS, from the author's page, with the DOI.

The other works the review names are no longer cited directly. Frommer and Kohlhaase belonged to targets now imported from parent §6.9. Kedlaya is reached through PadicDifferentialEquationsAndRigidCohomology §RD.2.43. Dospinescu's thesis is not needed: §7.5 uses parent §6.9's vanishing of ∩(u⁺)^j, which is DLB17 Rem. 12.1's alternative route. KPX belonged to E6, which this roadmap does not use. Teitelbaum's model is mentioned only "as recalled in DLB17 Remarque 11.13". `sources check` reports 0 problems. No text is missing: the request file written during an intermediate fetch was resolved and removed.

## Checks run

**Dependency gate**, verbatim:

    candidate: PadicLocalLanglandsForGL2QpPartII is not in the merge order yet; checked as if placed after CompletedCohomologyAndLocalGlobalCompatibility (the intake inserts it when its design is accepted)
    depcheck: 56 roadmaps, 636 edges, 0 problem(s)

There is no UPWARD or CYCLE line.

**Other checks:**

- `roadmaps resolve` on the new README: no cross-roadmap citation and no Lean name found nowhere.
- `sources check sources.toml`: 0 problems.
- `plan.json` parses: 50 nodes, 8 gaps, 20 source issues and 137 routing rows. No routing target points at a deleted node; deleted nodes route to parent sections as `import`.

**Lean.** No Suggested.lean exists at the design stage. The `#check` binder comparison was therefore not applicable, and no Lean command was run.

**Ownership against open work.** Checked with `roadmaps grep` over main and the open roadmap pull requests, by object:

- derived Lie-algebra action on p-adic locally analytic representations: no owner;
- the CDN fundamental diagram and pro-étale cohomology of p-adic Stein spaces or the Drinfeld tower: no owner. LocallyAnalyticDistributions §0.CR.6.6 owns Hyodo–Kato only;
- Breuil–Strauch, Π(π,0), P-finite vectors and the coordinate operator: the parent only;
- PID rigidity: not stated in LocalGaloisDeformationRings §3.8.

So §§4.1 and 6.3 are owned here, and the derived Lie action is a supplier gap.

## Adversarial mathematics pass

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Levels (Conventions, §0.1) | r = 1; Endoscopic §12.4 index m | 1+pO_D = 1+ϖ_D²O_D ⊊ 1+ϖ_DO_D; m ↔ ϖ_D-level 2m | sound | Check kept |
| ΦNᵖ (§0.1) | π₀⊗χ∘det, χ(p) = 1+p; Sp⊗δ | p acts on JL by (1+p)² ≠ 1; on δ∘Nrd by δ(p)² | ΦNᵖ needed | Check added; F06 |
| Multiplicity space (§0.2) | Z = W⊗JL(M), dim JL = 2 | Z[M] = W, dim 1·dim W, versus W⊗JL of twice the dimension | sound | — |
| Dual action (§0.2) | z acting by χ(z) | on E′: χ(z)⁻¹ | sound | — |
| Hodge–Tate convention | ℚ_p(1) | D_dR spanned by t⁻¹e₁ ∈ Fil⁻¹ ∖ Fil⁰; D_pst(ℚ_p(1)) has φ = p⁻¹, and [1] gives φ = 1 | sound | witness in Conventions and §0.3 |
| V_{M,ℒ} (§0.3) | two lines; C⊗V | C⊗V ≅ (L⊗C)⊕(L⊗C)(1); dim 2 | sound | — |
| Dictionary (§0.4) | e₁, e₂ basis, ℒ = Le₁ | v ↦ (w ↦ v∧w) sends e₁ to e₂*⊗(e₁∧e₂), so ℒ ↦ ℒ^⊥⊗∧² | sound | new target (G1) |
| Lattice sandwich (§1.1) | jumps (−1,0) versus (0,1) | Σt^{−i}Fil^i = tN⁺+L[[t]]ℒ versus N⁺+t⁻¹L[[t]]ℒ | sound for weights {0,1} | Checks |
| P(∇) injective (§1.2) | rank-one R; R(δ) ⊂ D_rig trianguline | ∇1 = 0; (∇−κ(δ))e = 0 | hypothesis needed | Checks |
| ∂ on N_rig (§1.2) | h = 1 | (∇−1)(tx) = t²∂x | sound | supplied by RD.2.43 |
| Infinite slope (§1.3) | trivial representation; 0 | trace^k acts by p^{nk} ≠ 0; 0 satisfies both | sound | — |
| LP versus LP_c (§1.4) | support ∪_{j≥0}p^jℤ_p^× | closure ℤ_p: compact in ℚ_p, not in ℚ_p^× | sound | — |
| Lie action (§1.5) | (a,b) = (0,1) | Casimir ((−1)²−1)/2 = 0; u⁻ = −t∂² | sound | — |
| Residue orthogonal (§1.6) | V = L; weights {0,2} | orthogonal of N⁺(L(1)) is tL[[t]]; te orthogonal but ∉ t²N⁺ | source wrong for k ≥ 2 | F13, E4 |
| Smooth criterion (§1.7) | trivial representation | P-smooth but not of infinite slope | sound | — |
| Common image (§2.1) | Le₁, Le₂ | same E_π, different Π(V)^an | sound refinement | E5 kept |
| Homography (§2.2) | w; u(b); aI₂ | w∂w = ∂⁻¹; wu⁺w f = z²f′ = −∂²u⁺f; u(b): ∂−b; aI₂ factor 1 | sound | — |
| Π(π,0) irreducible (§2.3) | Π(V)^an | reducible, with sub π; quotient Π(M,−1) irreducible (Colmez) | sound | F12 locator |
| Global map (§3.1) | twist η∘det | sector JL(π)⊗η∘Nrd ≠ ρ unless isomorphic | twist removal needed | E3 |
| Kirillov twist (§3.2) | γ on t⁻¹e | acts by χ(γ)⁻¹ | sound | E9 |
| General central character (§3.3) | p = 7, ω; ζ = 1; M ∉ ΦNᵖ | no χ with χ² = ω on μ₆; ζ = 1 gives Le₁ ↔ Le₂*; zero sector | sound | new target (F05) |
| Fundamental diagram (§4.1) | slope 1/2 versus 0 | (B⁺_cris⊗M)^{φ=1} = 0 iff slope > 0 | sound | new owned target |
| Steinberg (§4.2) | δ_x − δ_y; aI₂ | mass 0; δ(a²) on both sides | sound | — |
| Partial operator (§4.3) | d = 2, Ae₁ = e₂; S = 0; S = E | column (−λ₁λ₂, λ₁+λ₂): trace λ₁+λ₂, det λ₁λ₂; all-positive gives det −λ₁λ₂; S = E violates the hypothesis | sound; source misprint | E14 also records the unproved complement step |
| H_M, H_C (§4.4) | V = 0, V = L | 0; H_C(L) = F⊗L | sound | — |
| Hom diagram (§4.5) | V = 0 | all terms 0 | sound | — |
| Classification (§4.6) | F = ℚ_p; [F:ℚ_p] = 2 | κ ≥ 0 with Σκ = 1 forces {0,1}; for degree 2, (0,0),(1,1) allowed | sound | E15 |
| W_{M,ℒ} (§4.7) | e ↦ ae | dual a⁻¹e*, quotient unchanged | sound | now from §3.3 |
| Bounded vectors (§4.8) | ℤ on ℚ_p by p^n | \|p^nx\| = p^{−n}\|x\| unbounded | sound | Mathlib-backed (F09) |
| Étale = bounded (§4.9) | constants | trivial sector only, since dim JL(M) > 1 for supercuspidal M | sound | bounded-functions lemma added |
| Bounded duals (§4.10) | Π = L; π₀ = St^sm | L; (St^cont)′ | sound | — |
| Finite length (§4.11) | V_{M,ℒ}⊕V_{M,ℒ′}; a character | length 2; 0 | sound | — |
| Banach multiplicities (§§4.12–4.13) | χ(p) = 1+p twist | Hom = 0, versus the printed ℒ⊗JL(M) | source wrong | F06, E16 |
| Galois socle (§4.14) | dim 3; δ with δ(p)² = 1; twist | 0; Steinberg term; 0 on M^p_n | sound | ΦNᵖ_n |
| Arithmetic completion (§5.1) | L⊗lim versus lim(L⊗) | the latter is 0 on torsion | sound | — |
| Saturation (§5.2) | p·H⁺ | torsion-free and complete but not saturated | sound | Check replaced |
| Block multiplicity (§5.3) | X = Y⊗JL(M) | m_{B,M} = Hom(P_B, Y); m̌ is the O_L-dual, not m itself | old "m̌ = m" was wrong | fixed |
| Integral evaluation (§5.4) | infinitely many blocks | p-adically null sums are allowed; the product is not | sound | — |
| Finite generation (§5.5) | block with no constituent | m̌ = 0 | sound | — |
| Central character (§5.6) | Sp⊗δ | δ_M = δ⁻² | sound | — |
| Π*(ρ) (§6.1) | R = 0 | Π* = 0 | sound | parent §5.8 relation noted |
| PID rigidity (§6.3) | DVR, ρ versus ρ⊗χ with χ ≡ 1 | isomorphic reductions, non-isomorphic | hypothesis needed | new target; Check |
| Type annihilator (§6.4) | N = L[T]/(T²), I = (T) | kills every fibre, T·1 ≠ 0 | point fibres insufficient | Check |
| Structure (§6.5) | R = L | m ≅ m_B(Π(ρ_x)′)⊗ρ_x | sound | E12, E13, E18 |
| Factorisation (§6.6) | Steinberg block, M = Sp | (St^cont)′⊗1⊗1 | sound | — |
| Weighted action (§7.1) | gg′; k = 0; aI₂ | a′(a−cz)−c′(dz−b) = (aa′+bc′)−(ca′+dc′)z; identity; a^{−k} | sound | cocycle formula corrected |
| BGG row (§7.2) | k = 0, 1 | de Rham row; cokernel π′⊗M_dR⊗Sym¹ = four copies of π′ | sound | rank corrected |
| Original Breuil–Strauch (§7.3) | diag(1,c) | fixes 0 and ∞, moves 1 unless c = 1 | three lines needed | E11 |
| Iwasawa (§7.4) | V = 0 | both sides 0 | sound | E19 |
| Infinite primitives (§7.5) | Σ₀ = Ω⊔Ω, f = (1,−1) | primitives (z^j/j!, −z^j/j!), f not a pullback | source wrong | E2, E20 |
| Derived realisation (§7.6) | ρ = 1 | H⁰_dR ≠ 0, excluded | sound | E8 |
| Boundary sheaf (§7.7) | ∅; B_{i+c}; U₁⊔U₂ | 0; same germs; product | sound | Serre-row API bullet dropped (no consumer) |

## For the maintainer

- **Gaps on the parent.** PadicLocalLanglandsForGL2Qp §6.9 now carries four declared gaps from this roadmap: halfplane-module-continuity, two-sided-resolvents, smooth-kernel-twisted-coefficients and fixed-radius-divisibility. Its hypothesis `DrinfeldComparison.global_nonzero_map` is discharged here (§3.1), so the base can cite §3.1 of this Part II only as a downstream discharge, never as a supplier.
- **Gaps on board designs not in the merge order.** Three gaps name such designs: LocallyAnalyticRepresentationsOfLocalGroups (derived-lie-action) and ScholzeFunctorAndModpCohomologyOfTheLubinTateTower (modp-drinfeld-finite-length and drinfeld-components). The gate accepts them. When those designs are accepted they must precede this roadmap.
- **Renamed node ids.** Node ids in plan.json changed. New ids: GR.0/normalisation-dictionary, GR.3/global-nonzero-map, GR.3/general-central-character, GR.4/fundamental-diagram and GR.6/pid-rigidity. Fourteen ids were deleted. No roadmap cites any of these names.
- **Moved owners.** No notion moved down from a later roadmap.
- **Suspicious text.** None was found in the review or the fetched texts.
