# GATE-CongruenceSpectralGap~5: reply to human review

The review comment has two numbered items. The first raises two separate defects, so it is split into H01 and H02 below. H03 is the second item. The closing request to move the label is a process note, not a finding.

## H01 (roed-math) — applied

The claim that AutomorphicSpectralTheoryPartII consumes the congruence gap is false at its current head 9fe55e7. Its scope paragraph (README line 18 there) says "no target here uses that gap", and none of its sections cites this roadmap. The claim is deleted from Scope and ownership (old line 7) and from Downstream consumers (old line 896, now line 919), and no section of AutomorphicSpectralTheoryPartII is named instead.

Repairing the same defect elsewhere: Downstream consumers also said that EtaleDualityAndPerverseSheaves §5.2 consumes the curve Euler–Poincaré formula of §4.2b. At its head 23180d4, that roadmap constructs `curveEulerPoincareSwan` itself and does not cite this roadmap. In the merge order it is now at line 96, before CongruenceSpectralGap at line 146, so the claim also pointed against the direction of supply. Ownership now goes to the earlier roadmap. Scope (line 19), the supplier contract (line 128) and §4.2b (line 694) cite EtaleDualityAndPerverseSheaves §5.2 for the algebraically closed formula. §4.2b keeps only the descent to a perfect base with residue-degree weights, and its route is now coefficient extension to ℚ̄_ℓ plus grouping into Galois orbits. The InverseGalois, §IG.0.T1 and Riemann–Hurwitz inputs of the old four-step route are no longer needed and are removed. A negative-control Check (line 703) covers the imperfect field 𝔽_p(s).

## H02 (roed-math) — applied

Two roadmaps were described as "Part II" of AutomorphicSpectralTheory. The title changes from "the congruence spectral gap — automorphic spectral theory and trace distributions, Part II" to "the congruence spectral gap" (line 1). The first sentence of Scope and ownership now says this is a separate roadmap built on AutomorphicSpectralTheory, not one of its Parts, and says where that roadmap stops: level one for the modular expansion, Γ₀(N) for the Laplacian (line 7). Every "this part" becomes "this roadmap" (lines 7, 14, 19 and 24). The folder has always had its own `metadata.toml`, as a standalone roadmap should.

## H03 (roed-math) — applied

At the head 539ae72 of AutomorphicSpectralTheory, §4.8 is the level-one PSL₂(ℤ) expansion only (its README lines 2403–2412), and nothing there specializes to GL₂ at K(N). The contract gap:all-level-spectral-realization (old line 82) is therefore deleted and replaced by a target here, new §0.5c "Principal-level adelic spectral decomposition" (line 297), placed next to §§0.5a–0.6 as the review suggested. It specializes the general AutomorphicSpectralTheory §§4.1–4.4, 4.6 and 4.14a, which do exist at that head, to GL₂ over ℚ at K(N), and proves three things:
- the residual part is spanned by τ∘det for all φ(N) Dirichlet characters modulo N;
- the continuous part is unitarily equivalent to L²((0,∞),ℂ^(h_N)), with the Casimir acting as multiplication by 1/4+t² and h_N=φ(N)·#cusps(Γ(N)), counted as B(ℚ)⁺\GL₂(𝔸_f)/K(N);
- the parts reduce the closed Casimir.

§0.5b (line 283) now uses only its geometric Rellich-plus-cusp-tail route, which never needed the contract. §0.6 (line 323) consumes §0.5c. The AutomorphicSpectralTheory supplier contract (line 80), Scope (line 15), How to read the build, Layer 0 Dependencies and the AdelicAlgebraicGroups §3.1 and GlobalNumberFields Layer 6 contracts (lines 90 and 98) are updated to match.

Repairing the same defect elsewhere: the other five "What X must provide (gap:…)" requests are also not yet carried at their suppliers' heads:
- UnboundedOperators #1027 a075503: no Rayleigh-infimum statement.
- AutomorphicFormsOnReductiveGroups #1037 753cac0: no K(N) text.
- AutomorphicLFunctionsAndLocalFactors #924 4ea5784 (three requests): ramified self-pair positivity, twist transport and the strip adapter are absent.
- DeligneWeightsAndPurity #929 6045677: no additive-character sheaf.

Unlike H03, each of these asks the owner of a carrier to extend it: the Friedrichs/form theory, the Maass adelization isometry `maassClassicalEquiv`, the canonical local factors, and the sheaf Lψ. Building them here would make a second owner of those carriers, so they stay as requests, in the form `TauCetiRoadmap/FlagVarieties/README.md` uses on main. The worker should raise them with those roadmaps.

## Adversarial pass on changed statements

| statement | instances | computed values | result | change |
|---|---|---|---|---|
| §0.5c residual dimension φ(N) | N=1,2,3,4 | 1, 1, 2, 2; at N=3, 1∘det and χ₃∘det take values (1,1) and (1,−1) on components 1 and 2 | agrees with §0.6 "residual = constants" | Check added |
| §0.5c residual, primitive-only alternative | N=2 | primitive characters mod 2: none, so the alternative gives 0 and loses the constants | wrong model excluded | Check added |
| §0.5c continuous multiplicity h_N=φ(N)c(N) | N=1,2,3,4 | c=1,3,4,6, so h=1,3,8,12 (c(3)=12/3, c(4)=24/4) | agrees with §0.6 Γ(1), Γ(2) checks | Check added |
| §0.5c, B(ℚ) in place of B(ℚ)⁺ (O(2) quotient) | N=2, N=3 | N=2: diag(−1,1) fixes cusps ∞, 0, 1∼−1, giving 3 (no difference); N=3: it swaps the two components, giving 4≠8 | N=3 discriminates | Check added |
| §0.5c double coset count | N=1 | T(ℚ)⁺\T(𝔸_f)/T(ℤ̂)=(ℚ_(>0))²-orbit: one point, equal to h_1=1 | agrees | none |
| §0.5c Casimir on Eisenstein fibre | y^s, s=1/2+it | −y²∂ᵧ²y^s=s(1−s)y^s; t=0: 1/4; t=1/2: 1/2; opposite sign s(s−1)=−1/4−t² | positive normalization fixed | Check added |
| §0.5c n_B=2 vs AST §4.8 | level one | (4π)⁻¹∫_ℝ = (2π)⁻¹∫_(t>0), since \|φ(1/2+it)\|=1 makes the integrand even; multiplicity 1, not 2 | agrees | Check added |
| §0.5c reducing claim | residual | τ∘det is constant per component, so it is in Dom ΔΓ(N) with Δ=0 (§0.2 Check "1 in domain"); a finite-dimensional subspace of the kernel reduces; the continuous part is the complement of two reducing parts | route closes | route text |
| §0.5c, 1/4 not an eigenvalue | multiplication by 1/4+t² on L²((0,∞)) | level set {t=0} has measure 0 | a.c. spectrum [1/4,∞), no eigenvector | Check added |
| §0.5b without the adelic route | Γ(3) widths 3; Γ(2) three cusps | tail constants 9/(4π²R²); max of three constants | geometric route complete | contract input removed |
| §4.2b perfect-base Euler–Poincaré | Gₘ / P¹ constant rank r | r(2−0−2)=0; 2r | agrees | none |
| same | Lψ(xᵃ) on A¹ | 1·(2−1)−a: a=1 gives 0, a=2 gives −1 | agrees | none |
| same | 𝔽₃, pole at x²+1 | weighted (2−2)−2·1=−2; geometric (2−2)−(1+1)=−2 | perfect-base and geometric agree | none |
| same | imperfect 𝔽_p(s), point x^p−s, L constant | geometric χ_c=2−1=1; weighted 2−p | perfectness needed | negative Check added |
| same vs EtaleDualityAndPerverseSheaves §5.2 | deg_k(x)=1, U=C, characteristic 0 | identical formula; U=C gives rank·(2−2g); char 0 Swan 0 | supplier covers the algebraically closed case | supplier now cited |
| `hyperKloosterman_bound` with `[Finite F]`, `Nat.card` | 𝔽₂,k=1,r=1; 𝔽₃,k=2,r=±1; k=0 | ‖ψ(1)‖=1≤1·2⁰; ‖−1‖, ‖2‖ ≤ 2√3≈3.46; k=0 gives sum 1 at r=1 vs bound 0 (binder kept) | true; Nat.card F=\|F\| under `[Finite F]` | binders changed |

## Signature check

I appended `#check @name` for all four declarations to `Suggested.lean` temporarily, elaborated it once with the module build, and then restored the file. Results:
- `hyperKloosterman` and `hyperKloosterman_bound` now have `[Finite F]` in place of `[Fintype F]`, and the bound uses `Nat.card F` in place of `Fintype.card F`. The definition gets its `Fintype` instance internally from `Fintype.ofFinite`.
- `gauss_power_even_average_bound` and `congruence_eigenvalue_bound` are unchanged.

No binder was dropped, and each type matches its README statement in §4.2b, §4.3 and §5.3. The README writes |F| for the cardinality, so it needed no change. The gate's new statement-hygiene check had flagged the `[Fintype F]` binder on lines 42 and 51, and this change clears it.

## Ownership, citations and sources

- §0.5c (GL₂/ℚ principal-level adelic spectral decomposition): I searched by object across main and all 466 open roadmap pull requests with `roadmaps grep`. AutomorphicSpectralTheory has level one only. AutomorphicFormsOnReductiveGroups has no K(N). AutomorphicSpectralTheoryPartII does not use it. MaassForms (#1717, not in the merge order) consumes this roadmap's §§0.5b and 0.6 and does not build it. No other owner exists, so this roadmap owns it, as the review suggested.
- MaassForms cites §§0.1, 0.2, 0.5b, 0.6 and 5.3 here. No section is renumbered, and the statements of §0.5b and §0.6 are unchanged.
- `roadmaps resolve` on the new README finds no cross-roadmap citation and no Lean name missing. The earlier lead `VanishingCycles.curveEndomorphismTrace` is gone with the old route.
- No new source is cited. `needs-references.toml` was not written.
- Observation, no change: PadicDifferentialEquationsAndRigidCohomology is at merge-order line 111 and cites CongruenceSpectralGap §§4.2a–4.2b, at line 146. That is an upward citation on its side.
- AutomorphicSpectralTheoryPartII §3.6a proves the archimedean parameter bound for every number field. It describes our §5.1 as its spherical case over ℚ and does not consume it.
- No reviewed text contained instructions.

## Build and gate

- `lake build TauCetiRoadmap.CongruenceSpectralGap.Suggested`: Build completed successfully (8976 jobs). The only warnings are `declaration uses sorry`, at lines 52, 63 and 79.
- Gate, on the committed head 03c49e7: `gate CongruenceSpectralGap: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 239 roadmaps, 2358 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines.
- Commit: `03c49e7 CongruenceSpectralGap: review repairs (standalone title, principal-level spectral target, Euler–Poincaré owner, Finite fields)`. It is not pushed.
