# FIX-DESIGN-PadicLocalLanglandsForGL2QpPartII~4

Files changed: `packages/PadicLocalLanglandsForGL2QpPartII/design/README.md` and `design/plan.json`. `sources.toml` is unchanged: every new locator is in CDN20, DLB17 or COLMEZ19POIDS, which the manifest already records. The design has no `Suggested.lean`, so no `#check` binder comparison applies.

## F01 (P1) — applied

The finding is right. LocallyAnalyticDistributions §0.CR.6.6 (its *Hyodo–Kato cohomology of semistable curve towers*, read at the open head) takes the semistable models as hypotheses and says nothing about pro-étale cohomology. CDN20 §5.4 needs Théorème 3.3 (line 1235), Proposition 3.12 (line 1440) and Proposition 5.12 (line 1996). The φ-compatible identification is Proposition 5.7 (line 1874).

What changed:
- Old: §4.1 cited CDN20 Théorème 0.4 and LocallyAnalyticDistributions §0.CR.6.6 as if they supplied these inputs.
- New: two targets in Layer 3.
  - §3.4 constructs equivariant semistable models at every level n (CDN20 App. A.3 and Prop. A.1). Its (b) gives the (φ,N,G_ℚ_p)-isomorphism M̆ ≅ Hom_G(LL(M)′, H¹_HK[M]), compatible with ι_HK and §3.3(ii), for any model with the properties in (a).
  - §3.5 covers pro-étale cohomology of Stein curves, H̃K, the proper case and H̃K(M^p_n)[M] ≅ X⁺_st(M)⊗̂LL(M)′.
- §4.1's route now consumes §§3.4–3.5. §7.3 applies §3.4(b) to Teitelbaum's model at n = 1.

Owners used, all in the allowed list and checked at main or the open heads:
- HilbertModularVarietiesAndShimuraCurves §§R18.5.3 (`DrinfeldFormalModel`), R18.5.14, R18.4.24a and R18.3.29.
- AInfCohomology §AI.3.1 (`AInf.completed_structure_first_image`) and §AI.5.1 (`AInf.primitive_integral_comparison`).
- AdicSpacesPartIII §§R3.4 and R3.7 (main).
- StableReduction Layer 7 (main).
- PadicPeriodRings §4.3.

Where the suggested repair was changed:
- I used HilbertModularVarietiesAndShimuraCurves §R18.4.24a rather than CrystallineCohomology for the proper semistable comparison. The curves involved are quaternionic Shimura curves, and that roadmap already states the comparison for them, including over finite extensions of ℚ̆_p.
- Ω̂ comes from §R18.5.3 of that roadmap, not EndoscopicTransferAndUnitaryTraceComparison §12.4. §12.4 builds the formal moduli but asserts no semistability.

Search for the same pattern:
- §4.7 depends on this only through §4.1. Layer 4 Dependencies and §7.3 Needs no longer list LocallyAnalyticDistributions §0.CR.6.6 directly.
- The Scope paragraph and the LocallyAnalyticDistributions supplier contract now say that §3.4 supplies the models.

## F02 (P1) — applied

The finding is right. COLMEZ19POIDS line 211 gives Δ/Δ_{k,ℒ} ≅ R/t^kR, so det Δ_{k,ℒ} = x^k·det Δ. A non-trianguline rank-two module is étale exactly when its determinant has a unit value at p.

- Old: "Every line is weakly admissible, so Δ_{k,ℒ} = D_rig(V^{(k)}_{M,ℒ})".
- New, §2.4: δ_k is unramified with δ_k(p)² = (p^k·det Δ(p))⁻¹, and Δ_{k,ℒ}⊗δ_k = D_rig(V^{(k)}_{M,ℒ}). The exact sequence of §2.4(ii) ends in Π(Δ_{k,ℒ}) = Π(V^{(k)})^an⊗δ_k⁻¹ (Rem. 0.2(i)–(ii), lines 153–162).
- New negative-control Check at k = 2, where det Δ_{2,ℒ}(p) = p.

This generalises the reviewer's δ_k(p)² = p^{1−k}, which holds only for M = M(π) with det Δ = |x|. §2.4 is stated for every supercuspidal M.

Same pattern elsewhere:
- The §2.4 k = 1 Check now reads Π(Δ_{1,ℒ}).
- §7.2 now names the dual of Π(Δ_{k+1,ℒ}) = Π(V^{(k+1)})^an⊗δ_{k+1}⁻¹, citing DLB17 Remarque 11.12 (line 2723). Its k = 1 Check was extended.

## F03 (P3) — applied

The finding is right. HilbertModularVarietiesAndShimuraCurves §R18.3.29 (Normalization paragraph and its first Check) prints ρ_π with weights {0,k−1} and ρ_f = ρ_π^∨ with weights {0,1−k}, in an index convention where ε_p has weight −1. Under this roadmap's Conventions, ρ_f has weights {0,1} and ρ_π has weights {0,−1}. DLB17 lines 2754–2755 take r_p of weights {0,1}.

- Old: "ℒ_g = Fil⁰D_dR(r_g|G_ℚ_p)" with r_g unspecified.
- New: r_g = ρ_f, the contragredient of the H¹ realisation, with det r_g = χ·ψ_g and weights {0,1}. D_pst(r_g)[1] ≅ M through §0.4(a), so r_g = V_{M,ℒ_g}.
- New Check: for ρ_π, Fil⁰D_dR is two-dimensional.
- The §R18.3.29 supplier contract now states the convention conversion. §3.4(b) uses ρ_f in the same way.

## Checks

Dependency check, output verbatim:

    candidate: PadicLocalLanglandsForGL2QpPartII is not in the merge order yet; checked as if placed after CompletedCohomologyAndLocalGlobalCompatibility (the intake inserts it when its design is accepted)
    depcheck: 56 roadmaps, 644 edges, 0 problem(s)

There is no UPWARD or CYCLE line. `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name missing everywhere.

plan.json: 53 nodes (two new, `GR.3/semistable-models-hyodo-kato` and `GR.3/stein-proetale-cohomology`), checked by script:
- every node `statement` occurs verbatim in the README;
- every internal prerequisite is an earlier node;
- `gap:drinfeld-components` `neededBy` now also lists §§3.4, 3.5 and 4.1.

No gate failures were listed for this round.

## Adversarial pass

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §2.4 det Δ_{k,ℒ} | rank-one analogue tR ⊂ R; k = 1, M(π) | det(tR) = x·det R; det Δ_{1,ℒ} = x·|x| = x|x| = det D_rig(V) for det V = χ | consistent with the §2.4 Check | — |
| §2.4 étaleness | M(π), k = 1, 2, 3 | det Δ_{k,ℒ}(p) = p^k·p⁻¹ = 1, p, p² | étale only at k = 1 | twist δ_k; Check added |
| §2.4 δ_k | k = 2 | δ_2(p)² = p⁻¹; determinant value p·p⁻¹ = 1 | étale after the twist | — |
| §2.4 Π(Δ⊗δ) | Rem. 0.2(ii), line 162 | Π(Δ_k) = Π(Δ_k⊗δ_k)⊗δ_k⁻¹ = Π(V)^an⊗δ_k⁻¹ | sound | — |
| §7.2 preimage | k = 0, 1 | k = 0: Δ_{1,ℒ} étale, δ_1 = 1; k = 1: Δ_{2,ℒ} not étale | old text named a nonexistent V | fixed |
| §3.4(a) | n = 0 | M̂ = Ω̂⊔Ω̂ over ℚ̆_p; JL(M) of level 0 factors through Ǧ/O_D^× ≅ ℤ, so it is one-dimensional | (b) empty, consistent | Check |
| §3.4(a) | n = 1 over ℤ_{p²} | special fibre y^{p²−1} = 0, not reduced | extension K needed | Check |
| §3.4(a) | Γ′ ≠ Γ | Γ′ free on the tree, so point stabilisers on Ω̂ are trivial; free on M̂ | Γ′\M̂ semistable | — |
| §3.4(b) uniqueness | WD(M) irreducible | End = L, so unique up to L^× | sound | — |
| §3.4(b) slope | Ω vs M | dlog class: φ = p, slope 1; M: slope 1/2 | distinguishes | Check |
| §3.4 level 2 | ρ trivial on 1+pO_D, not on 1+ϖ_DO_D | ρ^{1+ϖ_DO_D} = 0, so the sector on the first cover is 0 | needs n = 2 model | Check |
| §3.5(a) | elliptic curve E (not Stein) | 0 → H¹(O) = C → H¹(Ô) → Ω¹(−1) = C → H²(O) = 0: dimension 2 ≠ 1 | Stein needed | Check |
| §3.5(b) | open disc D | H¹_dR(D) = 0, exp iso, H̃K(D) = 0 | sound | Check |
| §3.5(b) | open annulus | dlog(Kummer class of z) = dz/z spans H¹_dR | ι_can ≠ 0 | Check |
| §3.5(b) constants | π₀ finite | H⁰((𝔹⁺_cris)^{φ=p}) = (B⁺_cris)^{φ=p}⊗ℤ[π₀] → C^{π₀}, kernel ℚ_p(1)^{π₀} | kernel of exp = constants | — |
| §3.5(d) | N = 0 on supercuspidal M | (B⁺_st⊗M)^{N=0,φ=p} = (B⁺_cris⊗M)^{φ=p} = X⁺_st(M) | sound | — |
| §4.1 constants | dim JL(M) ≥ 2 | Ǧ acts on π₀ through Nrd: [M] = 0 | sound | — |
| §7.3 r_g | ρ_π vs ρ_f | ρ_π: jumps 0, 1, so Fil⁰ = 2-dim; ρ_f: jumps −1, 0, so Fil⁰ = line | ρ_f required | fixed; Check |
| §7.3 K | K = ℚ_{p²}((−p)^{1/(p²−1)}) | Galois over ℚ_p (μ_{p²−1} ⊂ ℚ_{p²}); K·ℚ̆_p finite over ℚ̆_p | meets §3.4(a) | — |
| §7.3 det r_g | trivial central character at p | det r_g|G_ℚ_p = χ = det V_{M,ℒ} | consistent | — |

## Ownership and citations

`roadmaps grep` over main and the 367 open heads found the following:
- No owner for the pro-étale cohomology of Stein curves, (𝔹⁺_cris)^{φ=p} as a pro-étale sheaf, or semistable models of Drinfeld covers at positive level. This roadmap is therefore their owner (§§3.4–3.5).
- An owner for Rν_*Ô and the primitive comparison: AInfCohomology. An owner for Kiehl's Theorem B and GAGA: AdicSpacesPartIII. An owner for the Drinfeld formal model and Mumford quotients: HilbertModularVarietiesAndShimuraCurves.

All of these are cited by name and section. Every new cross-roadmap citation was checked at main (AdicSpacesPartIII, StableReduction) or at the open head (AInfCohomology, PadicPeriodRings, HilbertModularVarietiesAndShimuraCurves, LocallyAnalyticDistributions, EndoscopicTransferAndUnitaryTraceComparison).

## Notes for the maintainer

- No name that other roadmaps cite was changed.
- Two new plan nodes were added in Layer 3, and Layer 3 now depends on AInfCohomology, AdicSpacesPartIII, StableReduction and PadicPeriodRings. All of these precede it in the merge order, or are on main.
- No suspicious instructions were found in the review text.
