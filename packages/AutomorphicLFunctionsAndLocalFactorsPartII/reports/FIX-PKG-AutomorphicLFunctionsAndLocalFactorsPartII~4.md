# FIX-PKG-AutomorphicLFunctionsAndLocalFactorsPartII~4

The review REV-PKG-AutomorphicLFunctionsAndLocalFactorsPartII~3 has three findings. All three are correct and all three are applied. Repairing F02 turned up a second defect of the same kind: the entireness theorem §9.4 is false for SO₂ and GSpin₂ under its stated hypotheses. That is repaired under F02.

## F01 (P2) — applied

**Verification.** CFK fixes θ only for H=GSpin_(2kc), where the Siegel Levi is GL_(kc)×G₀ with G₀=GL₁. Outside GSpin, θ=1 (CFK lines 1503–1507). Theorem 4.1 repeats the restriction (CFK lines 1516–1518). The reviewer's witness checks out: on H=Sp₂=SL₂ with k=c=1, τ=1 and θ quadratic of conductor 5, θ(u)=−1 at a 5-adic unit where every |u|^(it)=1, so the exclusion holds. Yet the spherical series, with covariance |a|^(s+1) and parameter (s+1)/2, has residue 2·(3/π)=6/π at s=1.

**Change.** §8.1: "For unitary Hecke character θ … form" → the Levi is GL_(kc)×G₀; θ is a unitary character on G₀=GL₁ for GSpin_(2kc), and θ=1 for Sp/SO. The Assume lines of §§8.1–8.4 now carry "θ=1 outside GSpin". The §8.4 base case notes that outside GSpin the hypothesis reads |det|^(it)τ≄τ∨. The SL₂ negative control is a new §8.1 Check. The local speh-cusp-normalized-intertwiner contract keeps an arbitrary θ.

**Pattern search.** Every θ in Layer 8 was edited (README §§8.1, 8.2 twice, 8.3, 8.4 three times). Other θ's in the README are different objects: the MVW involution in §3.2 and the normalizing scalar θ(s) in §6.5. §9.1 now says θ=χ_π, which is 1 outside GSpin by §0.3; that was already consistent. §8.5 and §9.4 use χ_π, so they need no change.

## F02 (P1) — applied

**Verification.** For split SO₂≅Gₘ and GSpin₂, G/C_G^• is a one-dimensional split torus, so C_G^•(A)G(F)⧸G(A) has infinite volume. The Petersson pairing of two automorphic characters over it is infinite. The reviewer's witness is right:
- SO₄ is the image of SL₂×SL₂ acting by X↦AXB⁻¹, and the Siegel parabolic contains one whole SL₂ factor.
- The Eisenstein section is equivariant by a character that is trivial on that perfect normal factor, so the kernel is constant along it.
- The doubled torus has coordinates t₁=a/b and t₂=ab.
- With π=τ=1 the truncated integral is ≥C·log R.

GK itself assumes "G admits nontrivial unipotent subgroups" (GK lines 4161–4163). CFK lines 1691–1693 claim convergence from cusp-form decay, which does not hold for tori.

**Second defect found.** The hypotheses of §9.4 (CFK Theorem 4.8) do not give entireness for these groups.
- **SO₂.** Take F=ℚ(√−23), which has class number 3, μ a class-group character of order 3, and τ=μ⁻¹. The exclusion μ²≠|·|^(it) holds, and π is unramified everywhere, so the bad-place condition is empty. Yet L=Λ_F(s)Λ(s,μ⁻²) has a pole at s=1.
- **GSpin₂.** (α,β)=(μ,1) with τ=μ⁻¹ fails the same way.

**Change.**
- **Conventions.** Now name the split-torus cases and point to §§6.11 and 9.5.
- **§9.1.** Now restricted to Sp_c (c≥2 even), SO_c (c≥3) and GSpin_c (c≥3). It cites the GK assumption and says the period diverges for the tori. The GSpin₂ dimension Check there was replaced by the log R divergence Check.
- **§§9.2–9.4.** The continuation, functional equation and entireness theorem are restricted to the same groups. §9.4 points to the counterexample.
- **New §6.11.** At every place, the local γ, L and ε factors of SO₂ and GSpin₂ are products of two GL₁×GL_k factors, for (α,β)=(μ,μ⁻¹) and for (σ,σ⁻¹χ_π) respectively. It has five Checks.
- **New §9.5.** The completed L-function is Λ(s,ατ)Λ(s,βτ), with its ε, functional equation, and strip bounds when entire. For unitary π it is entire exactly when k≥2 or neither ατ nor βτ is a norm character. It has three Checks: Λ_ℚ(s)² with L_v=4, and the two ℚ(√−23) counterexamples.
- **§§10.4–10.7.** For the tori the transfer is the isobaric sum α⊞β with no converse theorem. §10.5 uses the §9.5 functional equation, §10.6 uses §6.11 directly, and §10.7 routes a torus cuspidal factor through §10.4.
- **Bookkeeping.** Layer 6, 9 and 10 Examples, Dependencies and Needs lines; the scope paragraph, the AL contract and "How to read the build" now mention the torus branch.

No route-specific restriction was introduced: bad and infinite places stay in scope for the tori.

**Pattern search.** The same unremoved-centre problem was searched wherever a global integral over G(F)⧸G(A) appears: §§3.1–3.4, the unitary groups, have compact or finite-volume quotients after removing their split centre. It was also searched wherever c>1 is claimed globally: §0.3, §10.4 and §10.7, all updated. Local statements (§§5.4, 6.1–6.10) stay valid for c=2: a local integral over a torus converges in a half-plane.

## F03 (P3) — applied

**Verification.** The HLS text records 68 pages (HLS line 1), and its last page has printed number 68 (HLS lines 2737–2738).

**Change.** In the README References, "internal pp.1–72" → "internal pp.1–68". The cited pp.43–50 and the journal range 393–464 are kept.

**Elsewhere.** `design/plan.json` still has "internal pp.1–72" at two entries, lines 164 and 264. Those are outside the `gaps` list, so this job may not edit them. The `sources.toml` locator was already correct.

## Checks run

- **Elaboration.** `lake env lean packages/AutomorphicLFunctionsAndLocalFactorsPartII/Suggested.lean` was run from the content checkout. It exited 0 with no output. No TauCeti import was needed.
- **Declaration audit.** `Suggested.lean` declares nothing; only the module docstring changed. The §§9.1–9.3 and §9.4 bullets now name the split-torus branch (§§6.11, 9.5). The count stays at seventeen headlines, matching README "How to read the build". With no declarations, the `#check @name` audit has nothing to compare and found no binder changes.
- **Depcheck.** Exit 0. Output:

  ```text
  depcheck: 52 roadmaps, 592 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` lists no unresolved cross-roadmap citations or Lean names; it checked main and the 363 open heads. The cited AL items were read at that roadmap's open head: Representation prerequisites (GLₙ isobaric sums); AL.3 pole criterion, global RS functional equation, boundary nonvanishing and "Hecke, eigensystem and Rankin–Selberg data" with strip bounds; AL.1 canonical archimedean factors.
- **Sources and gaps.** No new source was cited. CFK and GK `cited_for` already cover Layers 6 and 9. `needs-references.toml` is not needed. No supplier gap was added.
- **Ownership.** The new targets import the GL₁×GL_k theory from AutomorphicLFunctionsAndLocalFactors. `roadmaps grep` for split-torus doubling found no other owner: the only doubling owner is MetaplecticAutomorphicForms (k=1, classical).

## Adversarial pass

| Statement | Instances | Values computed | Result / change |
|---|---|---|---|
| §8.1 θ domain | SL₂, k=c=1, τ=1, θ quadratic mod 5; GSpin₄, k=1,c=2 | θ(u)=−1 vs \|u\|^(it)=1; residue 6/π at s=1. With θ=1, τ=θτ∨ at t=0, so excluded. GSpin₄ Levi GL₂×GL₁ carries θ | θ=1 outside GSpin; Check added |
| §8.4 base case | Sp₂ₖ, c=1, θ=1 | hypothesis \|det\|^(it)τ≄τ∨; τ=1 fails it at t=0 | consistent |
| Conventions: volume | SO₂, GSpin₂, SO₃≅PGL₂, GSpin₃≅GL₂, Sp₂=SL₂ | dim G/C^• torus = 1, 1; finite volume for the other three | split-torus cases named |
| §9.1 period | SO₂/ℚ, k=1, π=τ=1, t₁=a/b, t₂=ab | kernel constant along r; ∫₁^R dr/r = log R → ∞ | restricted; Check added |
| §9.4 hypotheses | ℚ(√−23), h=3, μ³=1, τ=μ⁻¹ (SO₂); (μ,1), τ=μ⁻¹ (GSpin₂) | μ²≠\|·\|^(it); pole of Λ_F at 1, Λ(1,μ)≠0 | false for tori; restricted |
| §6.11 γ/L/ε | ℚ₂ μ=τ=1, s=1; odd p, μ quadratic ramified, τ=μ; ℝ, μ=sgn; q=3 GSpin₂ χ_π(ϖ)=−1 | 4 (one-factor model 2); bZ=(4/3)·3=4; (1−p^(−s))⁻²; Γ_ℝ(s+1)²; 9/8 vs wrong pair 9/4 | Checks added |
| §6.11 vs §6.6 laws | ψ_b; duality; FE | product ψ-change χ_π(b)^kχ_τ(b)²\|b\|^(2k(s−1/2)) = §6.6 with N=2; duality via αχ_π⁻¹=β⁻¹; γ(s)γ(1−s)=1·1 | consistent; ψ Check added |
| §9.5 | ℚ, π=τ=1; k≥2; non-unitary μ=\|·\|^r μ₀ | Λ_ℚ(s)², double poles at 0 and 1, ε=1, L₂(1)=4. At k≥2 unequal ranks, so entire. For non-unitary μ a zero of Λ(1−2r,μ₀⁻²) can cancel the pole | criterion stated for unitary π only |
| §10.4 torus transfer | SO₂ μ(ϖ)=3; GSpin₂ | (1−3T)(1−T/3)=1−(10/3)T+T²; product of roots χ_π(ϖ) = det of §0.3 (n=1) | Layer 10 Example added |
| §10.6 torus | SO₂, μ=\|·\|^(1/2) | α×β has constituents 1 and St, both with support {ν^(1/2),ν^(−1/2)}; by the segment formula both have γ(s,α×τ)γ(s,β×τ) | consistent with the §10.2 Checks |
| Layer 6 Example | SO₂, μ(ϖ)=2, q=3, s=1 | (1−2/3)⁻¹(1−1/6)⁻¹ = 3·6/5 = 18/5 | added |
| HLS range | last page | 68 = 68 | fixed |

## For the maintainer

- **CFK Theorem 4.8 (CFK lines 1719–1723)** is false for SO₂ and GSpin₂ as printed; see the ℚ(√−23) Checks in §9.5. The CFK §4.3 convergence claim (CFK lines 1691–1693) fails for the same groups. Neither affects CFK's transfer theorem, which the isobaric sum α⊞β gives directly.
- **MetaplecticAutomorphicForms §6.10a** derives continuation from a global doubling integral for orthogonal groups. A split binary orthogonal datum may have the same divergence there. This roadmap consumes only that roadmap's local factors and gcd at k=1 and its unitary global product, so it is not affected.
- **New section numbers.** §§6.11 and 9.5 are new; no name cited by other roadmaps changed.
- **Ownership.** Ownership against open pull requests was checked only through the indexed `roadmaps grep`.
