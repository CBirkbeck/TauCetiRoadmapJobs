# FIX-RT-HilbertModularVarietiesAndShimuraCurvesPartII~2

Repair of red-team round 2 (passes a and b). All seven findings were checked against the cited sources and supplier sections, and all seven hold. Files changed: `packages/HilbertModularVarietiesAndShimuraCurvesPartII/README.md`, plus a `module` header line in `Suggested.lean` (see the build-warning note below). `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged: no new gap and no new source were needed.

## RT-HilbertModularVarietiesAndShimuraCurvesPartII~2a/F01 (P2) — applied

§1.5 no longer requires some V_v to act trivially on σ_v. It now covers every continuous finitely generated σ_v and chooses V_v trivial on σ_v/pσ_v; the chain is M∞(σ_v)/𝔪∞ ≅ M∞(σ_v/pσ_v)/𝔪∞ ≅ finite-level Hom of σ_v/pσ_v ≅ Hom_K(σ_v,π)^∨. The route gets M∞(σ)/p ≅ M∞(σ/p) by exactness (σ ↠ pσ ↪ σ), with no torsion-freeness needed. The L₀ negative-control Check is added. §1.6 now states the general hypothesis instead of "as in §1.5".

Evidence: V(α_j) = Sym²⊗det⁻¹ is algebraic, and diag(1+pⁿ,1) acts on E₁₂ by 1+pⁿ, so L_j (§4.1) has no open kernel, while §4.7 applies §1.5 to L_j and N_j.

## RT-HilbertModularVarietiesAndShimuraCurvesPartII~2a/F02 (P2) — applied

§0.6 route: old "component consists of lifts not an unramified twist of a pure unramified one ⇒ discrete series" → at the places where D ramifies, τ_w is scalar or irreducible, with starred components when it is scalar (GK14 §5.2.6, lines 1278–1286). The argument is now: not discrete series ⇒ γ⊗(unramified principal series) ⇒ tempered (AutomorphicGaloisRepresentations §4.2) ⇒ Frobenius ratio of absolute value 1; but starred points have ratio q_w^{±1} (GK14 lines 1289–1294). The same restriction is added to the §0.6 datum, the supplier contract and Needs gain §4.2, and a Check rules out a principal-series type.

Evidence: GK14 Lemma 5.3.6 proof, lines 1413–1419, uses exactly the scalar/irreducible hypothesis. Under the old wording, a principal-series type χ₁⊕χ₂ with χ₁|I≠χ₂|I met the condition vacuously.

## RT-HilbertModularVarietiesAndShimuraCurvesPartII~2a/F03 (P3) — applied differently

Added three §4.1 Checks on the underlying O-lattices. (1) T′ = image of R′ and Y = T′/pT (dimension 1) versus T′/pT′ (dimension 3). (2) Basis of N = L×_Y T′ (rank 4), ker(N→L) = pT, and (0,e₁) ∈ L⊕T′∖N. (3) Instead of the reviewer's projection T→O², I model L_j ↠ N_j itself: L×_{R′/pR}R′ has rank 5 and maps onto N with kernel ⟨(0,pe₄)⟩. This is closer to the construction it tests.

## RT-HilbertModularVarietiesAndShimuraCurvesPartII~2a/F04 (P2) — applied

Parent §R18.3.9 explicitly assumes [F:ℚ] even. Old: "definite case uses §R18.3.9". New: run the same Gram argument on the class sets of §§R18.3.1, R18.3.3, with the degeneracy maps π₁*, π₂* of §R18.3.8 (arbitrary F). The Gram identity comes from the coset count with §R18.3.6's normalization, as in §R18.4.15's route; then §R18.4.16, with central parts via §R18.4.21. Supplier contract, §0.7 Needs and Layer 0 Dependencies are updated. Added a Check over ℚ: the Gram value is 8.

Pattern repair: §R18.3.14 (the KW Taylor–Wiles freeness, also an even-degree specialization) was cited in §0.4, §1.4, their Needs, the Layer 1 Dependencies and the contract. §0.4's direct free-orbit argument already proves the claim for every F, so all §R18.3.14 citations are removed.

## RT-HilbertModularVarietiesAndShimuraCurvesPartII~2a/F05 (P2) — applied

§0.7 route: old "nontrivial torus character ⇒ ramified principal series" → "ramified principal series or St⊗(χ∘det) with χ ramified tame". Depth-zero supercuspidals have no `V′_{w₁}`-invariants, and one-dimensional components are Eisenstein. In both cases inertia acts through a nontrivial tame character of order dividing Norm(w₁)−1, which is prime to p. Added the q=3 quadratic-twist Check (value −1 ≡ 28 in 𝔽₂₉).

## RT-HilbertModularVarietiesAndShimuraCurvesPartII~2b/F01 (P2) — applied

§1.3: "(ε det ρ̄)|_I ∘ Art" → "(ω⁻¹ det ρ̄)|_I ∘ Art", the reduction of the finite part ε⁻¹·det of the determinant εψ⁻¹. EGS15 lines 1588/1594 use determinant ψ_σε⁻¹, and BHHMS23 lines 4409–4410 give central character ψ⁻¹|_I. Condition (1) now says the locus is lifts with determinant εψ_σ. Added the p=29 Check (15 versus 2).

## RT-HilbertModularVarietiesAndShimuraCurvesPartII~2b/F02 (P3) — applied

§0.2: "b = (p, …, p)" → "s = (p−1, …, p−1) (`Sym^{p−1}` at every embedding; BDJ10's b⃗=(p,…,p) in its indexing det^a Sym^{b−1}, lines 1321–1322)". "Its subset J" → "some subset J realizing it", since membership needs c_ρ ∈ L_α for at least one J (BDJ10 line 1263).

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.5 fibre identity, non-smooth σ_v | f=1, σ=L₀; σ with p-torsion | g=diag(1+pⁿ,1): E₁₂ ↦ (1+pⁿ)E₁₂, never trivial; L₀/p finite ⇒ open kernel; M∞(σ)/p = coker M∞(×p) = M∞(σ/pσ) by σ↠pσ↪σ, valid with torsion | holds; Check added |
| §1.3 central character | p=29, ω(g)=2, det r̄_v^∨(g)=1 | ours 2⁻¹=15=ψ̄⁻¹(g); EGS formula 2·1=2 (and 2 for r̄_v) | corrected |
| §0.2 exceptional L_α | ρ = extension of 1 by ω, f=1 | s=p−1 ↔ b=p; J={0}; L_α=H¹ ⇒ Sym^{p−1}∈W(ρ) | consistent with the très ramifiée Check |
| §0.6 discrete series at ramified w | τ=χ₁⊕χ₂ distinct on I, q=3; scalar starred | PS: N=0, not discrete series ⇒ excluded; starred ratio 3 or 1/3, |·|≠1, versus tempered ratio |·|=1 | holds with the restriction |
| §0.7 torus characters | Ind(χ₁⊗χ₂), χ₁ ramified; St⊗χ, χ quadratic, q=3; unramified PS | (χ₁|,χ₂|)≠1; χ⊗χ≠1, inertia −1≡28≠1 mod 29; unramified PS has trivial torus character | holds |
| §0.7 definite Gram | F=ℚ, q=2, ratio 3 in 𝔽₂₉; ratio 2 | (2−3)(2−10)=8≠0; (2−2)(…)=0; identity (q+1)²−q(α+β)²/αβ = (q−α/β)(q−β/α) checked by expansion | holds for odd degree |
| §4.1 lattice Checks | model R=O⁴, T=O³ | dim Y=1, dim T′/pT′=3; rank N=4 with basis listed; ker=pT; (0,e₁)∉N; rank L×R′=5 → N, kernel ⟨(0,pe₄)⟩ | holds |
| §0.4 definite freeness without §R18.3.14 | G=C₂, S₃ over 𝔽₂₉ (existing Checks) | free orbit ⇒ 𝔽[G]-free; 𝔪-part a Hecke direct summand ⇒ projective (dim 1 vs 2, 1 vs 6) | unchanged conclusion, no parity used |

## Checks run

- `lake env lean packages/HilbertModularVarietiesAndShimuraCurvesPartII/Suggested.lean` from the content checkout: exit 0, no output. The file has zero named declarations, so there was nothing for the `#check @name` signature comparison to check; no binder changes.
- Dependency check: `depcheck: 190 roadmaps, 1256 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).
- `roadmaps resolve` on the README: no cross-roadmap citations or Lean names found nowhere.

## Gate failures repaired

- tex=10: ten subscripts written with braces outside code spans, which the gate reads as TeX. They are now code spans: `G_{F_w}` (§0.6 route), `q_{w₁}` (both §0.7 Checks), `G_{F_v}` (§1.3), `I_{F_v}` (§1.3 Check), `T_{2,j}` and `L_{j−1}` (§4.1 Check), and `L ×_{R′/pR} R′`, `R_{2,j}` and `T_{2,j}` (§4.1 Check). The text is otherwise unchanged. A rescan finds no `_{` or `^{` outside a code span. The dependency check, rerun, still reports no problem (latest run: `depcheck: 190 roadmaps, 1256 edges, 0 problem(s)`).

## Citations and ownership

- I re-read parent §§R18.3.6, R18.3.8, R18.3.9, R18.3.14, R18.4.14–R18.4.16 and R18.4.21 in HilbertModularVarietiesAndShimuraCurves (at its pull-request head, which is earlier in the merge order). §R18.3.8 states no parity condition. §R18.3.9 and the KW specializations (Conventions, "Definite algebras") assume [F:ℚ] even.
- AutomorphicGaloisRepresentations §4.2 (Hilbert Ramanujan–Petersson) was read at its head, and it is earlier in the order.
- No new construction is owned here: the definite Gram argument is a proof route through parent targets.

## Notes for the maintainer

- Build warning repaired: the targeted build warned that `Suggested.lean` imports `Mathlib`, which is designed for the module system, and suggested adding `module` at the start of the file. `Suggested.lean` now starts with a `module` line, followed by the unchanged single `import Mathlib` line and the unchanged docstring and namespace. No other import was added and nothing else in the file changed. Rerun with the header: `lake env lean packages/HilbertModularVarietiesAndShimuraCurvesPartII/Suggested.lean` exits 0 with no output. The file declares nothing, so a private (non-`public`) import exposes nothing that needs exporting. The README repair is the earlier run's work, re-verified against the sources (GK14 lines 1278–1294 and 1413–1419, EGS15 lines 1586–1594, BHHMS23 lines 4407–4410, BDJ10 lines 1261–1263 and 1320–1323) and against parent §§R18.3.8, R18.3.9 and R18.3.14.
