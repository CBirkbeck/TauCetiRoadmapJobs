# GATE-AutomorphicSpectralTheoryPartII~1: answers to human review

Review answered: roed-math, 2026-11-06 (one comment, four numbered items; item 1 has a separate sub-point and item 3 two requests, giving six findings). Repairs are in commit 9fe55e7 on top of 219f824. Files: `TauCetiRoadmap/AutomorphicSpectralTheoryPartII/README.md` and `TauCetiRoadmap/AutomorphicSpectralTheoryPartII/Suggested.lean` (module docstring only).

## H01 (roed-math) — applied

At #925's head 539ae72 all 14 requested items were checked. Absent: §0.14 is vector-valued Schwartz spaces on a finite-dimensional V, §0.15 meromorphic operator families, §0.11 nuclear LF test spaces; §6.3 covers only compactly supported W-invariant distributions, §6.4 only `K_f` and `K_{P,f}`, and §4.5 gives only finite dimensionality. Partial: §§1.5–1.10 on G(𝔸)¹, §2.3a and §§4.1–4.4. README line 45 now lists only what #925 supplies, and the 14 "must provide" blocks are gone. The missing material (the extension of AutomorphicSpectralTheory that this Part II needs) becomes targets here:
- nash-schwartz-analysis → §1.1;
- rapid-semisimple-centre, split-centre-fourier-laplace and frechet-bilinear-continuity → new §1.2a;
- slf-isotypic-sums → §2.5;
- tensor-holomorphy → §2.15;
- cuspidal-data-central-comparison → new §2.15a;
- arthur-factorization-comparison → §3.2;
- compact-eisenstein-comparison → §3.6;
- hereditary-intertwining-bounds → new §3.6a;
- the two compact-kernel comparisons → §§3.8 and 3.10;
- discrete-spectrum-casimir-counting → new §4.5a;
- refined-langlands-discrete-data → §5.7.

## H02 (roed-math) — applied differently

discrete-spectrum-casimir-counting is now neither a request to #925 nor a hypothesis of §5.7. It is target §4.5a, Müller's theorem [Mül89, Theorem 0.1], which BPLZZ Remark 3.20 uses as a proved input in place of Donnelly's bound (bplzz line 1460). §5.7 is stated unconditionally, and the Scope sentence "retains its additional polynomial-counting hypothesis" (old line 7) is deleted. A hypothesis would have bypassed a theorem, and #925 does not plan the statement. §4.6 also takes its cuspidal case from §4.5a, which replaces the AutomorphicFormsOnReductiveGroups request cuspidal-polynomial-counting.

## H03 (roed-math) — applied

At GanGrossPrasadUnitaryGroups' current head 7df8ca8, which is newer than the 64fad778 the review links, BPLZZ Proposition 4.8 is that roadmap's own §6.3a, "Base-change-compatible multipliers preserve matching". Its spectral-isolation request says matching and transfer "are not part of this contract". README line 17 changes from "outside this Part II's scope and belongs with the relative comparison" to "its §6.3a owns the theorem …". Downstream consumers (line 1657) changes from "an independently supplied transfer-preservation theorem" to naming GanGrossPrasadUnitaryGroups §6.3a.

## H04 (roed-math) — answered

At GanGrossPrasadUnitaryGroups head 7df8ca8 no request goes to a "Part II local extension" any more:
- distribution-gk, local-schwartz-germs and local-fourier-extension are its own §§2.1a, 3.2a and 3.3a;
- local-tempered-bounds, local-plancherel and local-smoothing-trace are addressed to AutomorphicSpectralTheory §0.48 and §§2.1–2.2.

None of the six belongs to this Part II. README line 17 now says that harmonic analysis over nonarchimedean local fields (Plancherel inversion, tempered matrix-coefficient bounds, smoothing traces, Harish-Chandra descent, Schwartz germs, Fourier-averaging extensions) is outside this roadmap.

## H05 (roed-math) — answered

For the real Plancherel theorem the two roadmaps already name one owner: both request AutomorphicFormsOnReductiveGroups `real-plancherel-decomposition` (GanGrossPrasadUnitaryGroups line 108: "the same real Plancherel request, with the same owner"). README line 17 now says so. The nonarchimedean Plancherel theorem is GanGrossPrasadUnitaryGroups' request to AutomorphicSpectralTheory §§2.1–2.2 and is not used here. Note for the worker: at AutomorphicFormsOnReductiveGroups head 753cac0 the real Plancherel theorem is not yet planned (its Scope leaves Plancherel for SL₂ to NoncompactQuantumSymmetry), so that shared request is still open on that pull request.

## H06 (roed-math) — answered

No section of this roadmap uses the congruence gap. README line 17 now ends with "no target here uses that gap" and records that CongruenceSpectralGap §5.1, the O(m)-spherical Luo–Rudnick–Sarnak bound over ℚ, is a special case of the archimedean bound proved in §3.6a. The sentence in #1504 that this roadmap "consumes the congruence gap" is #1504's to correct.

## Build and gate

- `lake build TauCetiRoadmap.AutomorphicSpectralTheoryPartII.Suggested`: `Build completed successfully (8954 jobs).` The only warnings are the three expected `declaration uses 'sorry'` (Suggested.lean lines 95, 108 and 118).
- Gate at 9fe55e7: `gate AutomorphicSpectralTheoryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Direction check: `depcheck: 239 roadmaps, 2350 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. The one new edge is PseudodifferentialOperators (on main, earlier in the order), used for elliptic parametrices in §3.2.
- Signatures: no declaration of Suggested.lean changed, only its module docstring headline list, so the 10 elaborated types in `scratch/signatures.md` still apply (0 dropped binders). The README statements of `finite_rank_weierstrass_product`, `polynomial_zero_fiber_interpolation` and `affine_lattice_interpolation` (§§0.2–0.3) are unchanged. No scratch `#check` file was elaborated, because that command is not among those the brief allows.

## What changed, by place

- Scope: the AutomorphicSpectralTheory paragraph lists the sections actually supplied (§§0.11–0.15, 0.50, 1.5–1.10, 2.1–2.5, 3.1–3.4, 4.1–4.5, 6.1–6.4, 7.1a) and the extensions owned here. The GanGrossPrasadUnitaryGroups and CongruenceSpectralGap sentences are as in H03–H06, and PseudodifferentialOperators Layer 6 is named.
- Supplier contracts: the AutomorphicSpectralTheory block is rewritten (14 requests removed). AutomorphicFormsOnReductiveGroups cuspidal-polynomial-counting is removed (now §4.5a). A PseudodifferentialOperators contract is added (Layer 6, §6.1, and Layer 5, §5.1).
- §0.5 gains an API bullet and a Check for pullback of moderate symbols along Cartan maps (BPLZZ proof of Lemma 4.12, bplzz line 1829). GanGrossPrasadUnitaryGroups' spectral-isolation request asks this continuation for it.
- New targets:
  - §1.2a: Delorme [Del86, Théorème 1.7]; Sakellaridis [Sak, Theorem 2.1.2]; Trèves [Trè67, Theorem 34.1]. Located at bplzz lines 2099–2198.
  - §2.15a: transport of the cuspidal-data decomposition to [G] and to a fixed split central character. BPCZ (2.9.2.1), bpcz line 2063; BPLZZ Definition 3.9 and (3.1), bplzz lines 1158 and 1170.
  - §3.6a: Lapid (UT) and (WR) for products of `Res GLₙ`, with WR constant min 2/(n_i²+1), and the derivative bounds under (HP). Lapid Definitions 3.2 and 3.7, Proposition 3.4, Theorem 3.8, Lemmas 3.3 and 3.11, Corollary 3.13, Appendix A.
  - §4.5a: Müller's polynomial count.
- Folded into existing targets: §1.1 (product comparison [AG10, Corollary 2.6.3] and the Paley–Wiener isomorphism for split tori), §2.5 (BPCZ Lemma 2.5.4.1 proof), §2.15 (BPCZ (A.0.3.1)), §3.2 (Arthur [Art78] Lemma 4.1 and Corollary 4.2, bpcz line 2059, parametrix route), §3.6 (transport of AutomorphicSpectralTheory §§1.5 and 1.8), §3.8 (compact-test kernel formula and the `K⁰` identity proved first), §3.10 (compact-test expansion from AutomorphicSpectralTheory §§4.2–4.3, [Art78] §4, bpcz line 2480) and §5.7 (Langlands discrete-data decomposition, unconditional).
- Layers 4–5 now cite the fixed-ω cuspidal components of §2.15a rather than "AutomorphicSpectralTheory §1.9 components", which live on G(𝔸)¹ without ω. *Needs* lines, Layer dependency paragraphs, How to read the build, Downstream consumers and the References closing paragraph are updated to match.
- Suggested.lean docstring: the not-statable headline list now names Delorme's multipliers, Lapid's (HP) for `GLₙ` products and discrete-spectrum counting. The §5.7 headline is no longer "under polynomial counting".

## Adversarial mathematics pass (added or changed statements)

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §0.5 pullback along Cartan maps | ι(z)=(z,z), W₂=swap; ι(z)=(z,0), W₁={±1}; ι=0; h₁*=0 | z₁z₂↦z², 4 at z=2; z₁−z₂↦0; z₁+z₂↦z with values 1, −1 at ±1; ι=0 gives the constant μ(0) | Holds with the orbit hypothesis; invariance fails without it (Check added) |
| §1.1 product S(G₁)⊗̂S(G₂)≅S(G₁×G₂) | G₁=G₂=ℝ; G₁ trivial; G₁ compact | `exp(−π(x²+xy+y²))` has an infinite-rank kernel, so it is in the completion but is not a finite sum of pure tensors; S(pt)=ℂ; C∞(K)⊗̂S(G₂) | Holds; Check added |
| §1.1 split-torus Paley–Wiener | `exp(−(log t)²)`; `1/cosh(log t)`; rank 0 | √π·exp(λ²/4), value √π≈1.772 at 0 =∫e^{−x²}; π/cos(πλ/2), value π at 0, poles ±1; S(pt)=N(0)=ℂ | Positive and negative instances behave as claimed; Check added |
| §1.2a Delorme multiplier | SL₂(ℝ) with μ=λexp(λ²); μ=exp(λ²); G_s trivial; G_s compact | μ(1)=e, μ(−1)=−e, so μ(χ_π) is undefined; exp(λ²) is even; trivial group gives c·f; compact group gives finitely many scalars | W-invariance is necessary (Check added) |
| §1.2a split-torus multiplier | ℝ_{>0}, μ=exp(λ²) | `k(x)=(4π)^{−1/2}exp(−x²/4)`, k(0)≈0.2821, ∫k=μ(0)=1; compactly supported output impossible (Cartwright-class argument) | Holds; output not compactly supported (Check) |
| §1.2a joint continuity | ℂ×ℂ multiplication; ℓ² with weak topology in both variables | ⟨e_n,e_n⟩=1 while e_n→0 weakly | The Fréchet hypothesis is necessary (Check added) |
| §1.3 route via Lemma A.2 | G=ℝ_{>0} (z*=ℝ, h_der*=0); G=SL₂(ℝ) (z*=0) | N(ℝ_ℂ)⊗̂ℂ; ℂ⊗̂N(h*_der)^W | Decomposition consistent in both degenerate cases |
| §2.5 K_f-isotypic decomposition | GL₁, ε of order 2 nontrivial or trivial on K_f; V=0 | 2 lines of types 1 and ε, or one 2-dimensional summand; empty sum | Isotypic, not irreducible, decomposition (Check added) |
| §2.15 tensor holomorphy | e=λ, f=λ²; f=conj λ; Gaussians in S(ℝ²) | λ³; \|λ\|² with ∂/∂λ̄ = λ ≠ 0; value 1 at origin for λ=0 | Holds; both factors must be holomorphic (Checks added). Nuclearity is used by the route only (P3 note) |
| §2.15a full-quotient blocks | G=G_m/ℚ; G anisotropic mod centre | L²(ℝ_{>0})⊗̂⊕(characters of ℚ^×∖𝔸¹); only M=G blocks | Holds ([G]=A_G∞×[G]¹ because G(F)⊂G(𝔸)¹) |
| §2.15a fixed-ω blocks and restriction | G_m with Z=G; GL₂ σ vs `σ⊗\|det\|^{it}`; GL₂ Borel χ₁⊠χ₂; A_G∞⊂Z(𝔸) for GL₂ over a quadratic field | one line ω, (a_G^G)*=0; central characters differ by e^{2it} at z=e, −1 at t=π/2; Weyl-conjugate pairs give one block; ℚ-scalars ℝ_{>0}⊂(F⊗ℝ)^× | Holds; the AutomorphicSpectralTheory data forget the A_G∞-character and ω pins it (Checks added) |
| §3.2 Arthur factorization | ℝ, Δ=1−d²/dx², k=1, m=0 | E=e^{−\|x\|}/2, E″=E−δ so ΔE=δ; E∈C⁰∖C¹; 2k=2>m+dim=1; δ=Δ(φE)+h | Holds; a smooth g₂ is impossible (Check added; sign fixed to f=f*h+(f*Δ)*(φE)) |
| §3.6 transport of AutomorphicSpectralTheory §§1.5, 1.8 | GL₂ Borel, δ_P=4 | factor 2 at s=1, 1/2 at s=0 (existing Checks unchanged) | Consistent |
| §3.6a (UT)+(WR) for GL products | GL₁; GL₂ Borel χ⊗χ; GL₂×Res GL₃ | no maximal parabolic; n_β(π,−s)=L_F(1−s)/L_F(1+s), value −1 at s=0, modulus 1 on Re s=0; constants 2/5, 1/5, min 1/5 | Holds as in Lapid Proposition 3.4 and Theorem 3.8; constant for products = minimum (Checks added) |
| §3.6a bounds under (HP) | M=G | no intertwiner, statement vacuous | Consistent |
| §3.7 now cites §3.6a | GL_n products | (HP) proved in §3.6a, hypothesis unchanged for general G (BPCZ Theorem 2.9.8.1 is for products of Res GL) | Generality unchanged |
| §3.8 compact-test kernel | P=G, G=G_m/ℚ; f=0; trivial group | K(x,y)=Σ_{γ∈ℚ^×}f(x⁻¹γy); 0; f(1) | Agrees with AutomorphicSpectralTheory §6.4 at P=G |
| §3.10 compact-test expansion | mass-one circle, f=e_{−n} | kernel e_n(x)conj(e_n(y)), one term | Existing Checks consistent |
| §4.5a Müller count | PGL₂/ℚ at level PGL₂(Ẑ), trivial type; definite quaternion units mod centre; continuous spectrum | Weyl law ≈R/12 (volume π/3), so d=1 attainable and d=0 fails; bounded count, d=0; [1/4,∞) gives an infinite count | Holds for L²_disc only (Checks added) |
| §4.6 via §4.5a | M with M_der trivial | M_der={1}, one eigenvalue 0 | Consistent; the central condition of §4.5 is still needed (existing Check) |
| §5.7 refined decomposition | PGL₂ residual vs Borel at λ=it; GL₁ | q(λ)=λ²−1/4: −t²−1/4 vs 0; D′=D for tori | Existing Checks consistent; now unconditional |

## Ownership and overlap

- Searched by object over main and the open roadmap pull requests (`roadmaps grep`) for Delorme's rapid multiplier, Trèves' joint-continuity theorem, Müller's discrete counting and trace class, Brumley's lower bound, the Luo–Rudnick–Sarnak and Müller–Speh bounds, (HP), Nash Schwartz products and the separately-continuous-bilinear theorem.
  - None is owned elsewhere, apart from:
    - the finite-place Luo–Rudnick–Sarnak bound, AutomorphicSpectralTheory §7.1a, which is consumed;
    - the O(m)-spherical bound over ℚ, CongruenceSpectralGap §5.1, a special case;
    - Clozel–Delorme Paley–Wiener, AutomorphicSpectralTheory §6.1 and EndoscopicTransferAndUnitaryTraceComparison, which are different theorems.
  - This roadmap owns these items as the Part II of AutomorphicSpectralTheory; they extend that roadmap where it stops, at compactly supported tests on G(𝔸)¹.
- Moves: no notion was moved down from a later roadmap. The items above moved from requests on AutomorphicSpectralTheory, which is earlier but does not plan them, into this roadmap. No declaration of Suggested.lean reuses a qualified name of another roadmap. No id this roadmap cites is dropped by an open pull request (overlaps tool: none).
- Other suppliers' requests (the same pattern, not repaired here). Sixteen requests remain, all to suppliers in their own direction:
  - AutomorphicFormsOnReductiveGroups (#1037): six requests. A text search finds none of them stated at the head.
  - AdelicAlgebraicGroups (#792): five requests. Only §3.6's deep-Siegel-set disjointness bears on deep-cusp-uniqueness.
  - SmoothRepresentationsOfLocalGroups (#1688): one request. No exponential-polynomial Satake statement was found.
  - ReductiveGroups Layer 7 on main: no real-points root datum.
  - LieGroups Layer 7 on main: real forms are present.
  - PDE Lane A on main: Sobolev embedding and Morrey are present.
  - VonNeumannAlgebras V4.Core on main: trace class and Hilbert–Schmidt pairings, but the composite bound ‖BC‖₁≤‖B‖₂‖C‖₂ is not explicit.

  These are recorded requests to those roadmaps, which this review did not raise, and the worker may raise them on those pull requests.

## Sources

No source was fetched and `scratch/needs-references.toml` was not written. All new locators point into the manifest's sources at the places where the original theorems are used:
- [Del86], [Sak], [AG10], [Trè67], [Don82] and [Mül89] through BPLZZ (bplzz lines 2099–2198, 1267 and 1460; bibliography at lines 2204–2307);
- [Art78] through BPCZ (bpcz lines 2059 and 2480);
- [MS04] Propositions 3.3 and 4.2 and Brumley's bound through Lapid (lapid lines 619, 647, 724 and 1178).

Lapid page numbers are the printed ones, as elsewhere in the README (printed = extraction page − 1). The manifest is not in this job's editable files: if these works should have their own entries, the worker adds them. Legal copies of [Sak] (arXiv 1804.02383) and [AG10] are on arXiv; [Del86], [Mül89] and [Art78] are journal papers.

## Untrusted text

The review contains no instruction to run commands or change tooling. Its request to switch the label back to awaiting-review is a GitHub action for the worker.
