# FIX-DESIGN-PadicLocalLanglandsForGL2QpPartII~5

Files edited: `packages/PadicLocalLanglandsForGL2QpPartII/design/README.md`, `packages/PadicLocalLanglandsForGL2QpPartII/design/plan.json`. `sources.toml` is unchanged: no new source was cited, and TEI90 was already recorded.

## F01 (P2) — applied

Verified. CDN20 lines 1232–1234 define H̃K(X) for every smooth X as the kernel of the composite into Ω¹(X)(−1). CDN20 lines 1448–1457 show that for a proper Y the kernel into H¹_proét(Y,Ô) is H¹_ét(Y,ℚ_p)(1). Old: §3.5 assumed X Stein from the start and defined H̃K only as the kernel into H¹_proét(X,Ô) ≅ Ω¹(X)(−1). New: the opening paragraph defines H̃K for every smooth rigid curve through the Leray edge map, whose kernel is H¹(X,O_X) (CDN20 Lemme 3.2). (a) and (b) keep the Stein hypothesis, and (a) adds that for Stein X the edge map is an isomorphism. I added the elliptic-curve Check to §3.5. plan.json: the 3.5 statement and its tests are updated.

## F02 (P2) — applied

Verified. In DLB17 lines 2718–2720, O(k)(Σ_n)^ρ is the dual of the twisted representation, so it is E_π[k] itself. DLB17 line 408 (Ω¹ ≅ Π(π,2)*) agrees, and so does §3.3(i) at k = 0. Old: "the strong dual of E_π[k] realises O(k)(Σ_r)^ρ". New: "E_π[k] realises O(k)(Σ_r)^ρ; its strong dual is the representation replacing Π(π,0) in DLB17 Théorème 1.2 for O(k)", plus the k = 0 case. I did not use the suggested name "Π(π,k)". DLB17 does not use that name, and it would clash with the base roadmap's Π(π,2), which is the det-twist. plan.json: the §7.1 API bullet is updated.

## F03 (P2) — applied differently

The overclaim was real: the general clause had no supplier. But scoping it down to quaternionic curves would narrow it below what the sources support. WeightsInEtaleCohomology (earlier in the merge order; its section *R34.3: the geometric semistable-period comparison*, under "Arithmetic construction contracts") constructs the B_st comparison between étale and Hyodo–Kato cohomology for every proper strictly semistable model over O_K, K/ℚ_p finite. So the clause keeps its generality. It now reads: D_pst(H¹_ét) = ℚ_p^nr⊗_{K₀}H¹_HK of the model. The route cites WeightsInEtaleCohomology R34.3, and R18.4.24a stays for quaternionic curves. The supplier is added to the *Needs:* line, the 3.5 prerequisites in plan.json, the scope paragraph and the supplier contracts.

## F04 (P3) — applied

Verified: Conventions give u⁺f = −f′, so (u⁺)^{k+1} = (−1)^{k+1}(d/dz)^{k+1}. Old: "(u⁺)^{k+1} = (d/dz)^{k+1}". New: "(u⁺)^{k+1} = (−d/dz)^{k+1}, with the same image as (d/dz)^{k+1}". I searched for the same pattern elsewhere. §3.1 already writes u⁺ = −d/dz. §7.5 uses d/dz without reference to u⁺ (infinite primitives), and the sign does not matter there. plan.json: the 7.2 statement is updated.

## F05 (P3) — applied

Verified. The §6.4 form f lives on the definite algebra, with π(f)_p a representation of GL₂(ℚ_p). ρ is a representation of D^×. §3.1(b) already passes to the partner of f on the indefinite algebra by R17.3. New §7.3 "One line": f is the twisted §6.4 form, g is its Jacquet–Langlands transfer to the indefinite algebra of discriminant pℓ, π(g)_p ≅ ρ and r̄_g = r̄_f. The §4.9 step now says "applied to f". The §7.3 Needs line already lists R17.3.

## F06 (P3) — applied

Verified with TEI90 lines 256–259: the minimal regular model over ℤ_{p²} has no component of multiplicity one. A semistable model over ℤ_{p²} has a reduced special fibre, and its multiplicity-one components survive in the minimal regular model, so none exists. Old: "special fibre not reduced, so K cannot be dropped". New: that excludes this model only, followed by the TEI90 argument. I searched for the same pattern elsewhere. The fourth Check of §7.3 already says "no unramified base gives a semistable model *of this shape*", which is correctly qualified, so it is unchanged. plan.json: the 3.4 test is updated.

## Checks

Dependency check (verbatim):

    candidate: PadicLocalLanglandsForGL2QpPartII is not in the merge order yet; checked as if placed after CompletedCohomologyAndLocalGlobalCompatibility (the intake inserts it when its design is accepted)
    depcheck: 56 roadmaps, 645 edges, 0 problem(s)

There is no UPWARD or CYCLE line. The edge count went from 644 to 645 because of the new WeightsInEtaleCohomology edge, which is earlier in ORDER.txt.

`roadmaps resolve` on the README found no cross-roadmap citations and no Lean names that resolve nowhere. A script checked that every plan.json `statement` (node, API and test) occurs verbatim in the README: 0 missing.

No Lean file exists at the design stage, so there was no `#check` comparison.

## Adversarial pass (changed statements)

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §3.5 definition of H̃K | open disc D (Stein) | H¹(D,O) = 0, so the edge map is an iso and H̃K(D) = 0, as in Check 1 | agrees with (a), (b) | — |
| §3.5 definition of H̃K | E ordinary over K | kernel into H¹_proét(Ô) is V = H¹_ét(ℚ_p(1)): ℚ_p-dim 2, C-dim 0. Composite kernel: extension of H¹(E,O) = C by V, Dimension (1,2) | matches (c) | new Check |
| §3.5(c) | E ordinary; E supersingular | ordinary: (B⁺_cris)^{φ=p} ⊕ (B⁺_cris)^{φ=1} = Dim (1,1)+(0,1) = (1,2). Supersingular, slope 1/2, rank 2: C-dim 2·(1−1/2) = 1, height 2 | both (1,2), as the definition requires | — |
| §3.5(c) HK clause | good reduction (N = 0); Tate curve | good reduction: ℚ_p^nr⊗H¹_cris, N = 0. Tate curve over K: N of rank 1 on H¹_HK, so (B⁺_st⊗D)^{N=0} ≠ (B⁺_cris⊗D) | the general supplier covers both | supplier added |
| §3.5(d) route | Sh_n(U), proper | H̃K(Sh_n(U)) is now defined by the composite. (c) then gives (B⁺_st⊗M̆)^{φ=p,N=0} = X⁺_st(M) | consistent | — |
| §7.1 bullet | k = 0; k = 2 | k = 0: E_π ≅ O(Σ_r)^ρ, dual Π(π,0) (§2.1). k = 2: E_π[2]⊗det ≅ Ω¹ ≅ Π(π,2)′_b (DLB17 line 408), as in Check 3 | consistent | rewritten |
| §7.2 sign | k = 0; k = 1 | k = 0: (u⁺)¹ = −d/dz. k = 1: (−d/dz)² = d²/dz². Images equal | consistent | rewritten |
| §7.3 g vs f | the §6.4 form | f: π(f)_p on GL₂(ℚ_p). g = JL(f) on the indefinite algebra of discriminant pℓ: π(g)_p = JL(π) = ρ on D^×. r̄_g = r̄_f | consistent with §3.1(b) | rewritten |
| §3.4 Check 3 | ℤ_{p²} vs K | ℤ_{p²}: fibre y^{p²−1} = 0 and the minimal regular model has no multiplicity-one component (TEI90 258–259), so no semistable model. K: p−1 smooth factors of multiplicity one (§7.3 Check 4) | consistent | rewritten |

## Notes for the maintainer

- New supplier: WeightsInEtaleCohomology, section *R34.3: the geometric semistable-period comparison*. It is an open pull request that adds a new roadmap folder, and it is earlier in the merge order.
- No names that other roadmaps cite were changed. No Lean names were added or removed.
- Ownership: the general étale–Hyodo–Kato comparison is now cited to its owner rather than claimed here. Ownership against open pull requests was checked with `roadmaps grep` over main and the 367 open heads.
- The review text contained no instructions.
