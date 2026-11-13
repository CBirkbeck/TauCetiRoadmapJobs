# FIX-RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~1

Repair of red-team round 1 (passes a and b) on `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII`. Files changed: `README.md` and the top-level `gaps` list of `design/plan.json`. `Suggested.lean`, `metadata.toml` and `sources.toml` are unchanged (no new source was fetched; every locator added below was read in the cached texts the manifest already records).

## RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~1a/F01 (P1) — applied

Verified: over F′ = F(ζ₅) the field of 𝔰𝔭₄^∨ is LF′ ∋ ζ₅, and H¹(SL₂(𝔽₅)≀C₂, A) ≅ H¹(SL₂(𝔽₅), 𝔰𝔩₂) = 𝔽₅. 5.2 bullet: "disjoint over F(ζ_{p^∞})" → that plus "ζ_p ∈ LF′ only if ζ_p ∈ L"; witness added as Check. Same pattern repaired in the 5.4 base-change bullet.

## RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~1a/F02 (P3) — applied

Verified: after 4.1, ℚ₂(√−1) ⊂ F⁺_v, so dyadic degrees are even. Degree 3 (d = 6, q = 5) → degree 4 (d = 8, q = 7): factors 17, R^loc 37, g = 1, dimensions 38 = 17 + 7 + 14; redundant prime gives 39; R_X ≥ 17. Repaired in 4.3 Checks 1, 3 and Layer 4 Examples.

## RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~1a/F03, RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~1b/F01 (P1) — applied

Both witnesses hold (dihedral: X = diag(1,0), ∂X = ψ; BCGP25 line 5642 asserts h¹ ≥ 1 for every problem). 1.4 now proves membership for all data and ψ ≠ 0 when ρ̄|G_{F·L⁺} is absolutely irreducible (implied by H¹(ρ̄(G_F),k) = 0, near adequacy), with proof; dihedral negative Check; Layer 1 intro, build summary, 4.3 route, Corrections updated.

## RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~1a/F04 (P2) — applied

Verified: BCGP25 line 458 (G-dominant ⇔ 0 ≥ k₁ ≥ k₂), line 467 (ρ = (−1,−2;0)), lines 636–638 (weight 2 = (1,1;2), not dominant). "k_v ≥ l_v ≥ 2" → regular algebraic (λ_v ∈ X*(T)⁺) or weight 2 per Definition 1.8.16, in 5.4, the AutomorphicGaloisRepresentationsPartII contract and the plan gap; convention Check added; Hypothesis 6.3.1 correction now cites Theorem 1.8.13.

## RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~1a/F05 (P2) — applied

Verified with the model T = Λ[z]/(z(z−u)), B = O⟦x,y⟧/(xy): T⊗_B B/(x) = Λ[z]/(z², uz), z ≠ 0 nilpotent; DeformationAndDerivedPatchingAlgebra §6.5 gives only A_red ≅ T_red. 6.3: "(R)_red ≅ T_{S_{1,π}}" → "(R)_red ≅ (T_{S_{1,π}})_red"; model added as Check; Summary item 2 and a Correction (BCGP25 Theorem 6.3.4, line 6696) added. 4.8 is unaffected (T^{T,ord}_m reduced by 2.2(1)).

## RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~1a/F06 (P1) — applied differently

Verified: LocalGaloisDeformationRings §6.31 gives regularity only at flagged points. BCGP25 (lines 6732–6734) needs only the selected rings, so no new gap: 6.2 now asserts depth = dim S_∞, support components of dimension dim S_∞, and dimension dim S_∞ for every component of R_{∞,π}, R^χ_{∞,π} (6.1, §§2.22, 1.4, 1.17). Integral model added as Check.

## RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~1a/F07 (P3) — applied

Verified: DeformationAndDerivedPatchingAlgebra §5.5 (balanced_module_patching) now states "for any prime p and in either characteristic" with a p = 2 Check. Contract sentence "stated for p ≥ 3 and is not used at p = 2" → "allows every prime p, including 2; not used here, its coefficient source O⟦x_1,…,x_{q−1}⟧ being regular while the weight algebra of 4.2 has torsion".

## RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~1a/F08 (P3) — applied

5.5 Checks replaced by three tests on the model B = O⟦x,y⟧/(xy): orientation (x↦0, y↦ϖ selects (x); x↦ϖ, y↦0 excluded), uniqueness (x=y=0 lies on both), scheme-theoretic selection (k[ε]-point x↦ε). The suggested wording "sole underlying point on the selected component" was corrected: the closed point lies on both components; the test is that pointwise membership does not imply factoring.

## RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~1a/F09 (P3) — applied

Verified: RAR⁻¹ = SAS⁻¹ = −A, η = ε̄; F = ℚ(√−23, √−47) over ℚ(√1081) is unramified at finite places with 2, 3 split; u = (J,−1)j has u² = 1 and fixes trace-zero matrices. 1.2 Check: "vanishes when ζ_p ∉ F" → "vanishes when Hom_{G_F}(ρ̄, ρ̄⊗ε̄) = 0", witness added; p = 2 clause corrected.

## RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~1b/F02 (P1) — applied

Verified: PotentialAutomorphyInfrastructurePartII §4.2 is stated in its l-odd Layer 3; Tho17 (lines 924–928) runs Tho12 §5 at p = 2. New target 3.6 (digit-only heading, not "3.3a"): type S_{χ,Q} with Λ[Δ_Q]-linearity, H₀(Q) ≅ H, freeness and coinvariants, with route and four Checks; 4.3 route, Needs, dependencies, Scope and contracts updated.

## RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~1b/F03 (P2) — applied

Verified: GlobalGaloisDeformations §8.1 fixes p odd; PotentialAutomorphyInfrastructurePartII requests the dyadic O-coefficient formulas from it (gap:two-adic-polarized-presentation). Same gap declared here (README contract plus plan entry, section §8.4); Scope, 1.1 bullets, 1.2 intro and route, Needs now cite it and state only Λ-forms. gap:cht-archimedean-ring-two-adic not added: only dim Z¹ = n(n+1)/2 is used, not formal smoothness.

## RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~1b/F04 (P2) — applied

Split into gap:dyadic-flag-ring-dimension (component dimension bound) and gap:dyadic-flag-ring-special-fibre (special-fibre components on torsion-trivial components), both on LocalGaloisDeformationRings §6.24, in the README contracts and the plan's `gaps`. 3.2(a) cites the first; 3.2(b), its Needs, the 4.8 Check and Layer 3 dependencies cite the second.

## RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~1b/F05 (P3) — applied

Verified: LocalGaloisDeformationRings §2.13 states R□ reduced, flat, lci of pure relative dimension d² for ℓ ≠ p; §2.24 is fixed-type rings. "§2.24" → "§2.13" in 3.2(a), 4.3 and the same pattern in 4.4 (characteristic-zero components at v₁); §2.13 added to Scope, contract, Needs of 3.2, 4.3, 4.4 and Layer 3–4 dependencies. §2.24 kept for 3.4, 3.5, 4.1.

## Checks run

- `lake env lean packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/Suggested.lean` from the content checkout: no output, no errors (the file is unchanged: module docstring and empty namespace, no declarations).
- Mechanical `#check` audit: `Suggested.lean` declares nothing, so there is nothing to `#check` and no elaborated type to compare; nothing changed.
- Dependency check (`gate --depcheck … --movable`): `depcheck: 237 roadmaps, 2151 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- A scan for TeX-like `_{`/`^{` outside backticks in the README: none.
- No gate failures were listed for this round.

## Adversarial pass on changed and added statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 5.2 base-change bullet | F′ = F(ζ₅), H = SL₂(𝔽₅)≀C₂ | H′_n = H_n (F′(ζ_{5^n}) = F(ζ_{5^n})); LF′ ∋ ζ₅; H¹(H,A) = H¹(SL₂(𝔽₅),𝔰𝔩₂) = 𝔽₅ | old bullet false; new hypothesis excludes it |
| 5.2 witness (a),(b) | h = (diag(2,3),1); h = (diag(2,3),1)σ | 𝔷_h = Cartan of first 𝔰𝔩₂ (x+y = 2z, x+y = 0 ⇒ (x,−x,0)); xσ has x² = (g,g), eigenvalues ±√2, ±√3 in 𝔽₂₅, order 8; 𝔷 ∩ A one-dimensional | (a),(b) hold; Check correct |
| 5.2 sufficient condition | F′ ∩ E(ζ_{p^∞}) = F | Gal(KM/K(ζ_{p^∞})) ≅ Gal(M/F(ζ_{p^∞})); KL ∩ L(ζ_p) = L | both conditions follow |
| 4.3 / Layer 4 example | n = 2, two dyadic places of degree 4, #T = 3, q = 7, 8 | 1+4+12 = 17; 17+17+5−2 = 37; g = 7+3−1−8 = 1; 37+1 = 38 = 17+7+14; q = 8: 39 = 39; q = 5 gives g = −1 | consistent; q ≥ 6 forced |
| 1.4 nonvanishing | ρ̄|G_{FL⁺} abs. irr.; dihedral n = 2 | X fixed by G_{FL⁺} ⇒ scalar ⇒ ∂X = 0 ≠ ψ; dihedral: antidiagonal g sends diag(1,0) to diag(0,1) = X + 1₂, B diagonal since θ⁻¹ ≠ (θ^τ)⁻¹, ψ = ∂X | hypothesis needed and sufficient for the claim |
| 1.4 near adequacy ⇒ hypothesis | index of ρ̄(G_{FL⁺}) in ρ̄(G_F) | index ≤ 2; index 2 ⇒ nonzero map to 𝔽₂ ⊂ k ⇒ H¹ ≠ 0 | holds |
| 1.2 Check p odd | p = 3, D₈, F = ℚ(√−23,√−47) | RAR⁻¹ = [[0,−1],[−1,0]] = −A; SAS⁻¹ = −A; η = ε̄; u² = (−J², 1) = 1; −JᵗXJ⁻¹ = X − tr X | h³ ≥ 1 with ζ₃ ∉ F |
| 5.4 weights | (1,1;2), (2,2;2), (0,0;2) | (1,1)+ρ = (0,−1) dominant, (1,1) not; (2,2)+ρ = (1,0) not dominant, HT 1,0,1,0; (0,0;2) HT −1,0,1,2 | new alternatives admit the seed, exclude (2,2;2) |
| 6.3 conclusion | T = Λ[z]/(z(z−u)), B → T | xy ↦ z²(z−u) = 0; T/(z²) = Λ[z]/(z², uz) ≅ Λ ⊕ Λ/u as Λ-module, z ≠ 0, z² = 0 | only (R)_red ≅ (T)_red |
| 6.2 dimensions | F⁺ = ℚ, #S = 3, t = 7 | 14d + 10(#S−d) + g = 10#S + 4d + g = 30+4+5 = 39; t+11#S−1 = 39 | agree for selected rings |
| 6.2 depth model | R = O⟦x,y⟧/(ϖx,ϖy), M = O | depth_R M = 1; R′ = O, dim 1; V(ϖ) ∪ V(x,y) ⇒ dim R = 2 | MCM over R not claimed |
| 6.2 support components | M free over S_∞ | P ∈ Ass: depth ≤ dim R/P; R/Ann M ⊂ End_{S_∞}(M) finite ⇒ dim ≤ dim S_∞ | each = dim S_∞ |
| 5.5 Checks | B = O⟦x,y⟧/(xy) | (0,ϖ): y ↦ ϖ ≠ 0 so not on V(y); (ϖ,0) does not kill x; (0,0) kernel (x,y) ⊇ both; k[ε]: x ↦ ε ≠ 0 | discriminating |
| 3.6 (1)–(3) | Q = ∅; n = 2, d_ṽ = 1 | Q = ∅: U₀ = U₁ = U, pr = id; Iwahori invariants of unramified PS: V¹ eigenvalues A, B, pr = V¹ − B has rank 1 = dim spherical line | consistent with (2) |
| 3.6 Δ_Q | q_ṽ = 17, 3 | Δ = ℤ/16, ℤ/2; Λ[Δ_Q] local (2-group) | summand of free is free |
| 3.6 freeness | non-free action | element of t⁻¹G(F⁺)t ∩ U₀(Q) with nontrivial image ⇒ Δ_Q stabilizer ⇒ not free | sufficient smallness needed (from 4.1's U_{v₁}) |
| b/F03 transfer | Λ_v versus O | Λ_v → k[ε] factors through k; cochains and L_v¹ residual | (2),(3) transfer verbatim |
| 1.2(3) archimedean term at p = 2 | B = 1_n; B = Ψ₂ | dim Z¹(C₂, M_n) = dim M^σ = n(n+1)/2 in both cases (n = 2: 3) | no formal-smoothness input needed |

## Ownership and overlap

- 3.6 (Taylor–Wiles level structures at l = 2): `roadmaps grep` for the parahoric projection and Tho12 Propositions 5.9–5.12 finds only PotentialAutomorphyInfrastructurePartII §4.2, stated in its l-odd Layer 3 (§3.2 fixes l odd, §3.4 the l-odd freeness). This roadmap already owns the l = 2 extension of that Hecke theory (Layer 2), so it owns 3.6; it imports the definitions of §4.2 by name.
- gap:two-adic-polarized-presentation: the same slug, supplier and request as in PotentialAutomorphyInfrastructurePartII's contracts, so GlobalGaloisDeformations receives one request.
- Ownership against the open pull requests was checked for these objects through the open heads listed in the brief; `scratch/overlaps.md` reported no open pull request changing this roadmap and no dropped id.

## For the maintainer

- The node statements inside `design/plan.json` (for example the ordinary seed datum's statement with "k_v ≥ l_v ≥ 2", and the 6.3 node's reduced-ring identification) still carry the pre-repair text; this round may edit only the plan's `gaps` list. The README is authoritative.
- New gap slugs: `dyadic-flag-ring-special-fibre` (LocalGaloisDeformationRings §6.24) and `two-adic-polarized-presentation` (GlobalGaloisDeformations §8.4, shared with PotentialAutomorphyInfrastructurePartII). The needs of `dyadic-flag-ring-dimension` and `gsp4-galois-representations-totally-real` changed.
- Consumers: GSp4NonregularModularityLifting cites 6.3; its conclusion is now `(R_{S_{1,π}})_red ≅ (T_{S_{1,π}})_red`. Base change of seed data (5.4) now needs linear disjointness from `E(ζ_{p^∞})`, not only from E. Section numbers are unchanged; 3.6 is new.
- PotentialAutomorphyInfrastructurePartII §5.3 runs its §4.5 at p = 2 although its Layer 3 fixes l odd; that is outside this package and is noted only because 3.6 now covers the ordinary l = 2 case here.
- No suspicious instructions were found in the reviews or the fetched texts. No source was fetched; `scratch/needs-references.toml` was not created.
