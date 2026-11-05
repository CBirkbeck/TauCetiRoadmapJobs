# GATE-QSeriesPartitionsAndMockModularForms~2: answers to human review

Two distinct points, both from one comment (F01, F02). Commit `b0f44a82` on top of `e68263d`; only `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md` changed (7 insertions, 4 deletions). `Suggested.lean` is unchanged: neither point touches a Lean declaration.

## H01 (CBirkbeck) — applied

§4.8a's sentence "Riemann–Roch give existence and uniqueness of G₂, G₃ and the expansion of every element of S in the basis" was false (F=1 ∈ S has constant coefficient 1, every gₙ vanishes at infinity), and is replaced: README §4.8a now defines S^∞ and S⁰ (Atkin1967 lines 45–50), adds the Fricke-invariant B₁₁ ∈ S with simple poles at both cusps, integral coefficients beginning q⁻¹, normalized by constant coefficient 0 (Atkin1967 Lemma 3, lines 105–106), states the full expansion of S in Gᵣ, B₁₁, 1, gᵣ (Lemma 4, lines 112–116) and the S^∞ expansion in the gᵣ alone (Lemma 5, lines 118–120), and says only the S^∞ theorem is applied to X₁₁ and Y₁₁; a public-law bullet (line 747) and two negative-control Checks ("eleven full expansion", "eleven Fricke pole", line 762 onward) record this. The name B₁₁ avoids a clash with the ℓ=5,7 notation B=η(24τ) earlier in §4.8a.

## H02 (CBirkbeck) — applied

At its current head AutomorphicSpectralTheory §1.16 names only `weight_laplacian_slash`; the operator is defined in prose and the power law is the unnamed "Powers" bullet `Δ_k y^s=s(1−k−s)y^s` (s ∈ ℂ, y>0), so `weight_laplacian` and `weight_laplacian_power` were not supplier names. README lines 13, 109 and 1180: `weight_laplacian` → "the weight-k Laplacian Δ_k (of AutomorphicSpectralTheory §1.16)", `weight_laplacian_power` → "the Powers bullet of §1.16 … for complex s and y>0"; `weight_laplacian_slash` is kept because it is a real name there.

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Full expansion of S | F=1 | A₀=1, all other coordinates 0; any finite Σ cᵣgᵣ has constant coefficient 0 | holds; 1 ∉ span(gᵣ) |
| Full expansion, B₁₁ needed | F=B₁₁ | pole order 1 at ∞; span{1,Gᵣ,gᵣ} has pole order at ∞ in {0}∪{r≥2} | B₁₁ indispensable |
| Uniqueness | Σ A_{−r}Gᵣ+A_{−1}B₁₁+A₀+Σ Aᵣgᵣ = 0 | top pole order at ∞ forces A_{−r}=0 (distinct orders r≥2), then A_{−1}=0, then pole order at 0 forces Aᵣ=0, then A₀=0 | holds |
| Degenerate N=0 / N=1,M=0 | F holomorphic at ∞ / simple pole at ∞ only | N=0: A_{−1}=0 forced; N=1,M=0 is empty (genus 1: L(∞) = constants, dim 1) | holds |
| B₁₁ normalization | B₁₁+c | still Fricke-invariant with q⁻¹ leading term, so invariance does not fix c; constant coefficient 0 does; L(∞+0) has dimension 2 = span{1,B₁₁} by Riemann–Roch at genus 1 | normalization added |
| B₁₁ Fricke-invariant exists | w₁₁ acts on L(∞+0) with w²=1 | X₀(11)/w₁₁ has genus 0, its Hauptmodul pulls back to degree 2 with poles at the two (swapped) cusps | consistent with Lemma 3 |
| S^∞ expansion | F ∈ S^∞, pole order M at 0 | no Gᵣ, B₁₁ terms (no pole at ∞); A₀ = F(i∞) − Σ Aᵣgᵣ(i∞) = 0 | holds; M=1 case empty by genus 1 |
| gₙ pole at cusp 0 | gₙ(−1/(11τ)) = 11^(−θ(n))Gₙ(τ) | leading term q⁻ⁿ, so pole order n at 0 | as stated |
| Powers law (H02) | k=0, s=2; k arbitrary, s=0 | Δ₀y²=2(1−0−2)y²=−2y²; Δ_k 1=0 | matches supplier Checks |

`#check` comparison of elaborated signatures: not redone, because no Lean declaration changed (`Suggested.lean` is byte-identical to `e68263d`); the targeted build below elaborates it cleanly.

## Ownership and citations

No new carrier: S, S^∞, S⁰, B₁₁ are level-11 modular-function inputs already owned in §4.8a, with curve, genus and Riemann–Roch still taken from ModularForms Layers 10A–10B. AutomorphicSpectralTheory §1.16 checked at its current head via `roadmaps show`. Ownership against open pull requests: checked with `roadmaps grep` for `weight_laplacian` (hits only in AutomorphicSpectralTheory, MaassForms and this roadmap).

## Build and gate

- `lake build TauCetiRoadmap.QSeriesPartitionsAndMockModularForms.Suggested`: `Build completed successfully (8978 jobs).`, exit 0. The 15 warnings are all `declaration uses 'sorry'` in `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/Suggested.lean`; there are no errors. The earlier "no such file or directory" `.olean` errors (`Mathlib/Algebra/Order/Group/Unbundled/Abs.olean`, `Mathlib/CategoryTheory/NatIso.olean`) came from concurrent `lake build` runs of other roadmaps writing the same shared Mathlib build directory, which left truncated `setup.json` files and missing `.olean` outputs. Re-run with no other build active, the same command succeeds without any change to the roadmap.
- Depcheck: `depcheck: 210 roadmaps, 1445 edges, 0 problem(s)` (exit 0; no UPWARD, CYCLE or moved line).
- Gate: `gate QSeriesPartitionsAndMockModularForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (this summary line has no `build` field).
