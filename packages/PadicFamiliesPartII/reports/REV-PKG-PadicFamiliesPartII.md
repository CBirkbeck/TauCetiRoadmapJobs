<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2279#issuecomment-6656900501 -->
Review (claude) of a93b409

Verdict: needs_changes

1. **F01** (P1) §6.4 reverses the BGG scaling identity; the two "source issues" it rests on are not source errors

   **Location.** `packages/PadicFamiliesPartII/README.md`, §6.4 (line 834: "Prove `θ_v U_source = p^{k_v−l_v+1} U_target θ_v`"; line 836: "the scaling identity is stated here in the direction forced by the derivative computation"; Checks at lines 842–844), and `### Source issues and conventions`, the bullet "**P20 Proposition 13.3.3.1 (p. 90).** The printed diagram intertwines U with `p^{−k−1}U` ... follow from the opposite direction ... The same holds for BCGP21 §6.4 (p. 154)".

   **Claim.** The sources print `U ∘ d₁ = p^{k+1} d₁ ∘ U` (equivalently `d₁ ∘ U = p^{−k−1} U ∘ d₁`); the README asserts the opposite, `θ ∘ U_source = p^{m} U_target ∘ θ` with `m = k_v − l_v + 1`, and justifies it by differentiating `f(pz)`.

   **Witness.** On q-expansions with `θ = q d/dq` and `U(Σ a_n qⁿ) = Σ a_{pn} qⁿ`: `θU f = Σ n a_{pn} qⁿ` while `Uθ f = Σ (pn) a_{pn} qⁿ = p·θU f`. Hence `U ∘ θ^m = p^m θ^m ∘ U`, i.e. `U_target ∘ θ = p^m θ ∘ U_source`: exactly BCGP21 line 7417 (`U_{v,2}∘θ = p^{(k_v−l_v)+1} θ∘U_{v,2}`, p. 154) and P20 lines 4133–4140 (Prop. 13.3.3.1, p. 90). The README's derivative witness `(f(pz))^{(m)} = p^m f^{(m)}(pz)` is the relation `θ V = p V θ` for `V: f(z) ↦ f(pz)`, not for U. With the printed direction the standard U on the reflected term is twisted by `p^{m}`, so its slopes are `≥ −3 + m` on `H^i` and `≥ m` on `H⁰` (BCGP21 Prop. 6.4.1): the slope-zero part is empty on `H⁰` for every `k ≥ l`, and in every degree when `k − l ≥ 3`, which is precisely BCGP21 Cor. 6.4.3 and P20 Cor. 13.3.3.1 (thresholds `k − 2` and `k + 1`, lines 4142–4156). With the README's direction the twist is `p^{−m}`, the slopes are `≥ −3 − m`, and no exclusion follows; the README's own third Check says so of "the opposite direction", which is the correct one. The supplier HigherHidaAndColemanTheory §9.6 item 4, cited in §6.4's *Needs* and declared "used as stated there" in Scope, states the printed direction (`packages/HigherHidaAndColemanTheory/design/README.md` line 1385), so §6.4 also contradicts its supplier.

   **Repair.** (1) In §6.4 replace the identity by `U_target ∘ θ_v = p^{k_v−l_v+1} θ_v ∘ U_source` (equivalently: the spectral sequence of the relative BGG resolution is Hecke-equivariant when the standard action of `U_{v,2}` on the term indexed by a set J of reflections is multiplied by `p^{k_v−l_v+1}` for each `v ∈ J`), delete the clause "the scaling identity is stated here in the direction forced by the derivative computation", and keep the conclusions (isomorphism on `H⁰`, injection on `H¹`, isomorphism on `H¹` when every gap is `≥ 3`). (2) Replace the three Checks by: the q-expansion witness `Uθ = pθU` (so a source eigenvector of slope s maps to a target eigenvector of slope `s + k_v − l_v + 1`); the gap-3 instance (twisted slopes `≥ −3 + 4 = 1 > 0`, so the ordinary projector kills the reflected term in every degree); and the negative control that the opposite direction gives twisted slopes `≥ −3 − (k_v − l_v + 1)` and no exclusion (the relation `θV = pVθ` for `f ↦ f(pz)` is the one the derivative computes). (3) Delete the Source-issues bullet on P20 Prop. 13.3.3.1 and BCGP21 §6.4 (both sources are correct), and the corresponding sentence in Scope and ownership is unaffected. Tested on the instance that refuted the original: `p = 3`, `k − l = 3`, an ordinary (slope 0) class on the reflected `H¹`: printed direction gives twisted slope 4, excluded; README direction gives twisted slope −4, not excluded.

2. **F02** (P3) AutomorphicBundles and ShimuraCompactifications are cited by letter labels that are not section numbers at their open heads

   **Location.** `README.md` `### From TauCetiRoadmap.AutomorphicBundles` (lines 110–114), `### From TauCetiRoadmap.ShimuraCompactifications` (lines 98–108), the three gap contracts there, Scope and ownership (line 11), and every `*Needs:*`/`### Dependencies` line naming `§B…` or `§C…`.

   **Claim.** `roadmaps resolve` reports `AutomorphicBundles §B2.3, §B4.16, §B5.1, §B5.10` and `ShimuraCompactifications §C3.1, §C4.12, §C5.16, §C5.19, §C5.22` found nowhere; at the open heads both roadmaps number sections `k.n` without letters.

   **Witness.** `AutomorphicBundles/README.md` at #1069 carries a translation table (line 217–221 of the shown file: "B2 = Layer 3 … B3 = Layer 5 (… B3.2 = 5.3) … B4 = Layer 11 and B5 = Layer 12 (B5.1a = 12.2, B5.n = 12.(n+1) for n ≥ 2)"); `ShimuraCompactifications/README.md` at #1053 has no table and no `§C` label (grep count 0). Resolved by title: B2.3 → 3.3 "Highest weights and coefficient conventions"; B3.2 → 5.3 "The canonical automorphic extension"; B3.4 → 5.4 "The subcanonical automorphic extension"; B4.16 → 11.16 "Siegel Schur and determinant coefficients"; B5.1 → 12.1 "The coefficient trace adapter"; B5.10 → 12.11 "Geometric Hecke operators on classical sections"; B5.14 → 12.15 "Fourier–Jacobi expansion with vector coefficients"; C3.1 → 4.1 "Refinement maps"; C3.3 → 4.3 "Toroidal Hecke correspondences"; C3.9 → 4.10 "Coherent cohomology does not depend on the cone system"; C4.12 → 6.12 "The Tate curve"; C4.16 → 6.16; C4.17 → 6.17 (Klingen correspondence and its acyclicity); C5.16 → 7.16 "The integral minimal compactification"; C5.19 → 7.19; C5.20 → 7.20; C5.21 → 7.21; C5.22 → 7.22 "The Koecher principle on normalized models"; C5.25 → 7.25; C5.26 → 7.26 (Hilbert–Siegel codimension and formal Koecher).

   **Repair.** Replace every letter label by the head's number as listed, in the supplier contracts, Scope, all `*Needs:*` and `### Dependencies` lines, and the three gap contracts (`gap:partial-hasse-regularity` → §7.20, `gap:mixed-cube-cover` → §7.25, `gap:tame-boundary-stabilizers` → §4.3). The `section` fields of those three gaps in `design/plan.json` carry the same old labels; the worker should decide whether the intake reads them from the README contract or from the plan. HigherHidaAndColemanTheory is cited by its design numbering, which is the only numbering it has; those citations all resolve.

3. **F03** (P3) §7.1 restates Fréchet–Stein coadmissibility that an earlier roadmap owns

   **Location.** `README.md` §7.1, line 898: "call a `Û(𝔤)`-module coadmissible when it is `lim_r M_r` with `M_r` finitely generated and compatible base changes (BCGP25 Definition 2.2.31, p. 24)"; its *Needs* line cites LocallyAnalyticDistributions §0.0, §0.3 and CompletedCohomologyPartII §F.4 only.

   **Claim.** Coadmissible modules over a Fréchet–Stein algebra are defined by PadicLocalLanglandsForGL2Qp §0.1 (merge order 32, earlier than this roadmap at 245): "prove that `D(H,L)` is Fréchet–Stein … Define coadmissibility of M by compatible finite modules over these stages, recovered by inverse limit" (that README at #1312, line 220, with three Checks at lines 224–226). OverconvergentAutomorphicForms (243) already consumes that category from there.

   **Repair.** Keep `Û(𝔤) = lim_r U(𝔤)_r` as this roadmap's object, state that it is Fréchet–Stein with the `U(𝔤)_r` as Banach stages, and take "coadmissible" from PadicLocalLanglandsForGL2Qp §0.1 (add it to §7.1's *Needs* and to the supplier contracts; the Scope sentence on §§7.1–7.2 then says that the completion and the localization, not the notion of coadmissibility, are owned here). The board design LocallyAnalyticDistributionsPartII (merge order 316, later) plans the same completed enveloping algebra; being later, it must import §7.1 from here, which is a note for that package, not a finding here.

4. **F04** (P3) the P20 sign remark in Source issues points at the wrong passage

   **Location.** `README.md`, Source issues bullet "**P20 §15.2.2 and proof of Theorem 15.2.1 (pp. 108–109).** The high-weight specialization has negative first coordinate `−k − 1`".

   **Claim.** The source states the negative first coordinate itself: §15.2.1 (line 4903, "λ₂ = 0 and 0 > λ₁") and §15.2.3 (line 4933, "`k = −λ₁ − 1`"). The only sign slip is in Proposition 15.2.4.1 (line 4988–4989, p. 109), whose hypothesis reads `λ = (λ₁, 0; c)` with `λ₁ > 0`, incompatible with `k = −λ₁ − 1 ≥ 0`.

   **Repair.** Relocate the bullet to "P20 Proposition 15.2.4.1 (p. 109): its hypothesis `λ₁ > 0` should read `λ₁ < 0`, as in §§15.2.1–15.2.3" and keep the sentence about a witness in every component of `Spec Λ₁` (the proof at line 5001 specializes at one large weight). §3.5 and its Check already use the negative coordinate and need no change.

Independent review of `packages/PadicFamiliesPartII/README.md`, `Suggested.lean`, `metadata.toml` and `sources.toml` (round 1, no previous review). Every cited supplier section was resolved at the supplier's current head or on main; the seeded sample of fifteen targets was read against the cached texts at the cited locators; the adversarial pass below carries computed values; `Suggested.lean` elaborates with no output. One blocking finding: §6.4 states the BGG scaling identity in the wrong direction and declares the two sources that print the correct direction to be misprinted.

## Verified sound

**Principles.** No route-specific shortcut, no re-planned roadmap (PadicFamilies and HigherHidaAndColemanTheory are imported by section), no copied passage, no algorithm, no sorry'd data, no `set_option`. Depcheck:

```
depcheck: 235 roadmaps, 2271 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The roadmap sits at merge-order position 245; every cited roadmap is earlier (PadicLocalLanglandsForGL2Qp 32, LocallyAnalyticDistributions 76, CompletedCohomologyPartII 208, PerfectoidShimuraVarieties 242, HigherHidaAndColemanTheory 244, and the rest of the list in the brief) or on main (LieHighestWeight, PadicMeasuresIwasawaAlgebras). Consumers found by grep are later: GSp4NonregularModularityLifting (276) cites "PadicFamiliesPartII E6/four-pieces and F8" (design node ids, a note for that roadmap), AbelianSurfacesModularity (277), LocallyAnalyticDistributionsPartII (316).

**Elaboration.** `lake env lean <Suggested.lean>` from the content checkout: exit 0, no output, no `sorry` warning (the file declares nothing). The `#check @name` scratch pass and the one-tactic padding probe have no declaration to run on; I say so explicitly. The import header is the single line `import Mathlib`; the module docstring has the required form and names each headline theorem with the carrier it lacks.

**Headline theorems and statability.** From the Summary: PEL small-slope classicality (§2.8, §2.9); the Klingen Euler characteristic theorem (§3.5) with the spherical amplitude (§3.3); Hilbert derived ordinary control (§4.7); the doubling injection (§5.8); the one-place rational comparison (§6.7); the four-piece filtration (§7.8) with the Eichler–Shimura spectral sequence (§7.5); de Rham ordinary classicality (§8.6) with the Sen–Cousin comparison (§8.4); the four projective modules (§§9.2–9.7). At the pins: Mathlib has no Shimura variety, overconvergent form, Igusa tower or completed cohomology; Tau Ceti at the pin has 0 files mentioning Overconvergent, Igusa, Klingen or Hida, its 124 "Shimura" hits are citations of Shimura's book, and its 2 "Siegel" hits and 5 "Coleman" hits are unrelated (checked by grep over `TauCeti/`). So none of the headline theorems is statable, the docstring says so for each, and the file correctly states nothing. The companion-operator identities (§5.6) are algebra on free endomorphisms and are rightly kept out. No padding, no stand-in.

**Seeded sample (fifteen targets), read at the locators.** Page convention: BPS printed page = PDF page − 1 (HAL cover page); P20, BCGP21, BCGP25 printed = PDF.
- §2.2: BPS Prop. 4.2.1, line 867, printed p. 19; Remark 4.2.2 (line 873) confirms that only finite slope is used. Matches.
- §2.4: BPS Thm. 4.4.1, lines 964–992, p. 22 (`U^N = ∐_{j<N} U^{N−1−j}∘T_j ∐ T_N`, `T_j` = j bad then one good); Prop. 4.3.10, line 945, p. 21. Matches, including the left factors.
- §2.6: BPS Def. 4.5.2 (line 1170, p. 27), Lemma 4.5.3 (1187), Lemma 4.5.5 (1199, bound `u_0^N M`), Prop. 4.5.6 (1224, p. 28), Prop. 4.5.7 (1239, p. 29, `A′_N = A_N − n_i − v(α_i)`). Matches.
- §3.2: P20 Prop. 7.4.2.2, line 2262, p. 49 (C independent of `K^p`, `k ≥ C`, `r ≥ p² + p`, `T₁` zero on the rank-zero loci); Lemma 7.4.2.6, line 2312, p. 50. Matches; the nilpotence on thickenings is the Artin–Rees step of the proof (lines 2294–2296).
- §3.5: P20 Thm. 15.2.1, line 4886, p. 107, for `f RΓ(X^{≥1}_{Kli(p)}, F^κ ⊗ ω²(−D))_m`, ρ̄ absolutely irreducible (line 4870); proof §15.2.5, line 5001, p. 109. Matches as "zero virtual rank"; see R04 for the sign remark.
- §5.2: BCGP21 Def. 5.6.2 (lines 6118–6131: quotient by `L_w × ∏_{v≠w} A[v]`, polarization `p² x_w λ`, marking `p^{−1}πη`), Prop. 5.6.3 (line 6143, p. 126: degree `p³`, `p²` on the divisor), `F_w^*ω_w ≅ ω_w^p` (line 6148). Matches.
- §5.5: BCGP21 Lemma 5.8.1, line 6432, p. 133: `U_Iw Z_w = U_{w,2}`; `U_Kli = U_Iw + Z_w` at line 6430. Matches.
- §5.6: the matrix `(U_Kli, U_{w,2}; −1, 0)` at lines 6443–6446, p. 133. Matches; identities recomputed below.
- §6.4: BCGP21 §6.4, lines 7373–7421, pp. 153–154. Does not match: R01.
- §7.3: BCGP25 §4.7, lines 4426–4430, p. 99 (`CC_λ(M) = RHom_𝔤(M, RΓ(Sh_{K^p}, ℚ_p)^{la})`). Matches.
- §7.6: BCGP25 Thm. 4.7.5, lines 4488–4492, p. 100 (Siegel or proper; slopes ≥ 0; `E₁^{p,q} = ⊕_{ℓ(w)=p} H^{2p+q−d}(HC^{=0}_{w,λ}(M(𝔪_w)_{λ+w^{−1}w_{0,M}ρ+ρ}))`); Cor. 4.7.6, line 4496 (proper, no antidominance). Matches.
- §7.8: BCGP25 Thm. 4.9.9, lines 4711–4721, pp. 105–106, with the four Sen scalars. Matches.
- §8.2: BCGP25 §4.10.8, lines 4794–4809, pp. 107–108 (eigenvalues `−1−w/2` twice, `−2−w/2` twice; sequence `0 → H³_{3w} → V[(Θ+1+w/2)²] → H²_{2w} → 0`; nilpotent `Θ + 1 + w/2` induces `Gr² → Gr³`). Matches.
- §9.4: BCGP25 Thm. 7.3.1(3), lines 7507–7515, p. 164 (M-dominant κ, `T(ℤ_p)`-invariant ordinary higher Coleman group, `−D` for lengths 0, 1). Matches.
- §9.6: BCGP25 Thm. 7.3.1(5), lines 7519–7527, p. 164, and Lemma 7.3.2, line 7554, p. 165 (Sylow criterion; prime-to-p stabilizers at line 7550). Matches.

**Further locators read while checking hypotheses.** BPS Props. 3.1.1/3.1.3 (p. 15–16), 3.2.1/Cor. 3.2.2 (pp. 16–17), 4.1.2 (p. 18), Lemma 4.4.3 (p. 24), Lemma 4.4.5 and Hyp. 4.5.1 (p. 25), Thm. 5.3.1 and Remark 5.3.2 (p. 31); P20 Lemma 7.1.1 (p. 38; divisibility iff `k + r ≥ 2`), §7 opening (p. 37, `T = T_{p,1} + (1+p+p²+p³)T_{p,0}`), Lemma 8.2.1 and Prop. 8.2.1 (pp. 52–53), Prop. 13.3.3.1/Cor. 13.3.3.1 (p. 90), Cor. 14.6.2 (p. 99), Prop. 15.1.1 (p. 106), Prop. 15.2.4.1 (p. 109); BCGP21 Thm. 3.10.1 (p. 70), Thm. 4.2.1 (p. 77), Prop. 4.4.3 (p. 99), Thm. 4.6.1 (pp. 105–106), Prop. 4.6.19 and proof (pp. 113–114), §5.4 definitions of `U_Iw = p^{−3}Θ^{et}` and `Z_w = p^{−l_w−1}Θ^{m-et}` (line 5885), Lemma 5.7.2 and Prop. 5.7.3 (p. 129), Thm. 5.8.4 (p. 134), Thm. 5.8.6 and Remark 5.8.7 (p. 135), Thm. 6.2.6 (p. 145), Lemma 6.3.14 and Thm. 6.3.16 (p. 152), Thm. 6.5.8 and Remarks 6.5.9–6.5.10 (p. 156), Props. 6.6.1–6.6.2, Thms. 6.6.4–6.6.5 (pp. 164–167); BCGP25 Def. 2.2.31, Thm. 2.2.39 (pp. 24–25), Prop. 3.4.3, Remark 3.4.4, Def. 3.4.5, Lemma 3.4.6 (pp. 53–54), Thm. 3.5.11 (p. 58), Thm. 3.6.9 (p. 64), Prop. 3.6.15 (p. 66), Thm. 4.7.1–4.7.2, Cor. 4.7.3 (pp. 99–100), Thm. 4.9.4 and Cor. 4.9.5 (p. 104), Props. 4.10.3, 4.10.6, Remark 4.10.7 (pp. 106–107), Thm. 4.10.12 (p. 108), Lemma 4.12.3, Thm. 4.12.4, Remark 4.12.5 (pp. 113–114), Lemmas 7.3.5–7.3.8 and the choice of r (pp. 166–167). All agree with the README's statements and hypotheses.

**Pinned library declarations opened (file:line at the pin).** `Module.End` (Mathlib/Algebra/Module/LinearMap/End.lean:32), `LinearMap.prod` (Mathlib/LinearAlgebra/Prod.lean:95), `LinearMap.coprod` (Mathlib/LinearAlgebra/Prod.lean:199), `Module.End.genEigenspace` (Mathlib/LinearAlgebra/Eigenspace/Basic.lean:71), `Polynomial.aeval` (Mathlib/Algebra/Polynomial/AlgebraMap.lean:259), `Module.Projective` (Mathlib/Algebra/Module/Projective.lean:70), `DerivedCategory` (Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87), `LinearMap.eventually_isCompl_ker_pow_range_pow` (Mathlib/RingTheory/Artinian/Module.lean:308, with `[IsNoetherian R M]` in its own signature and the Artinian hypothesis in scope), `TauCeti.VermaModule` (TauCeti/Algebra/Lie/HighestWeight/Verma.lean:195, under `[IsKilling K L] [FiniteDimensional K L] [CharZero K]` as the README says). All exist as cited.

**Supplier citations resolved (every section, at the head named).** HigherHidaAndColemanTheory (board design): §§1.1, 1.2, 2.3, 3.7, 4.5, 4.6, 4.8, 4.9, 5.1, 5.5, 5.6, 5.8, 6.1–6.3, 6.6, 8.3, 8.5, 9.1, 9.4–9.8 all present with the stated content (§4.9 gives amplitudes `[ℓ(w), d]` and `[0, ℓ(w)]` used in §9.1's Check; §9.1 gives the weights `(5,3),(5,1),(2,−2),(0,−2)` and `κ∨ = (3−κ₂, 3−κ₁)` used in §§9.3, 9.5). PadicFamilies #1019: §§0a.22, 0a.25, 2a.15, 2a.16. PELModuli #966: M0.21, M0.27, M1.13, M2.8–M2.10, M4.5, M4.6, M5.1, M5.4. HodgeTateAndCanonicalSubgroups #1084: §§0.6–0.8, 0.14–0.16, 0.28, 3.6, 5.1, 5.5, 5.8. AdicSpacesPartIII (main): R2.10, R3.4, R3.6, R3.7. SchemeAndStackFoundations (main): §§2.19, 2.20. SmoothRepresentationsOfLocalGroups #1688: SR.1.4, SR.4.5. IntegralHeckeAndGaloisDeterminants #1689: §§2.3, 3a.2. AutomorphicFormsOnReductiveGroups #1037: §§6.4–6.6 (§6.6 states the `Res_{F/ℚ}GSp₄` large-weight theorem and the sign-corrected Pilloni 15.2.2.1(2), not Prop. 15.2.4.1 nor weight-(2,2) stability, so both gaps on it are minimal). EndoscopicTransferAndUnitaryTraceComparison #999: §11.1. CompletedCohomologyPartII #1035: §§2.2, 6.7, 7.1, 7.8 (which assigns the `GSp₄` boundary vanishing to the arithmetic consumer, so §7.7 is owned here), F.4. PerfectoidShimuraVarieties #1085: §§3.6, 6.3. PadicHodgeTheory #1062: §4.4. ArithmeticGaloisRepresentations #856: §§5.11, 7.6. AutomorphicGaloisRepresentations #1007: §1.1 (GL₂ coefficient Eichler–Shimura; the `GSp₄` relation is a gap, minimal). PadicMeasuresIwasawaAlgebras (main): §§1.1, 1.7. DeformationAndDerivedPatchingAlgebra #1034: §5.9 (exactly BCGP25 Lemma 7.3.2), §§7.1, 7.3. LieHighestWeight (main): "Layer 3: enveloping algebra, Verma modules, and L(λ)". LocallyAnalyticDistributions #854: §§0.0, 0.3, 4.16. FiniteFlatGroupsAndIntegralPadicHodgeTheory #879: R07.P7.2. AutomorphicBundles #1069 and ShimuraCompactifications #1053: see R02.

**Declared gaps (14).** The same fourteen slugs appear in `design/plan.json` `gaps` and in the README contracts, each with a named supplier and a one-sentence `needs`. Minimality checked against the supplier sections: PELModuli M4.5 normalizes integral models for a general datum and M5.4 is the GL₂-type Hilbert datum, so the Iwahori complements, the Hilbert–Siegel datum and the `O_F`-linear Kodaira–Spencer isogeny compatibility are not provided; HodgeTateAndCanonicalSubgroups' Hilbert data are of GL₂ type (its summary and Conventions), so the Hilbert–Siegel partial Igusa torsor and frame torsor are not provided; AdicSpacesPartIII R2.10 defines section and Hasse domains, not completeness and gluing of bounded sections; ShimuraCompactifications 4.3, 7.20, 7.25 do not state the prime-to-p boundary stabilizers, the partial-Hasse regularity or the `[2,3]^I` cube cover; SchemeAndStackFoundations §2.19 is the abstract `a_f`, not the lci fundamental class; PerfectoidShimuraVarieties §3.6 is the Levi-torsor identification, not `VB_red` with the Sen comparison. None is unowned, vague or already supplied.

**Ownership against open work.** `roadmaps grep` over main and the 454 open roadmap pull requests: "Kassaei" and "Bijakowski" (outside PELModuli/ShimuraCompactifications' citations) occur nowhere else, so the BPS continuation has no other owner; "four-piece" occurs only in GSp4NonregularModularityLifting (276), as a consumer; "coadmissible" occurs in PadicLocalLanglandsForGL2Qp §0.1 (R03) and in later roadmaps; "Klingen" in AutomorphicCongruences is the Klingen Eisenstein series and in SiegelModularForms (#1714, not read) the classical parabolic, different objects. Board packages: LocallyAnalyticDistributionsPartII (316) plans Fréchet–Stein algebras and `Û(𝔤)` and is later, so this roadmap keeps §7.1 (noted in R03). Open pull requests whose files the brief does not give were not searched beyond the grep tool.

**README shape and house style.** 62 target subsections, each a prose paragraph with hypotheses, a locator in parentheses and a `*Needs:*` line; every definition has an API list and at least three Checks (63 `**Checks.**` blocks); every layer ends with Examples and Dependencies; no LaTeX delimiters, no process words, no pull-request numbers, no machine paths, no `lemma`; sources manifest records all five cited works with hashes and `certified` status; BP26 is recorded as background with `cited_for` Layer 9. The manifest was not changed.

**Adversarial pass.** Values computed by me, not copied from the package report.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions, shift | `ℤ` in degree 0 | `H^{−1}(C[1]) = H^0(C) = ℤ`, `H^0(C[1]) = H^1(C) = 0` | holds | none |
| Conventions, slope rescaling | `p = 3`, eigenvalue 9, `a = 3` | `9·3^{−3} = 1/3`, slope `2 − 3 = −1` | holds | none |
| Conventions, Sen | `ℚ_p(1)` | Sen `+1`, HT weight −1; FFGIPHT R07.P7.2 exists at #879 | holds | none |
| §1.1 degree range | étale; multiplicative of height `da`; supersingular `E[p]` line | 0; `da`; `1/(p+1)` | holds | none |
| §1.2 `n_i` | type C `d=a=1`; `d=1,a=2`; type A `d=a=b=1` | `1·1·2/2 = 1`; `1·2·3/2 = 3`; `1` (BPS Hyp. 4.5.1 exponents) | holds | none |
| §1.4 band | half-open strip; `η = ν` | no uniform N from compactness alone; `N = 0` | holds | none |
| §2.1 region | `(n,c,s) = (3,4,0),(3,3,0),(3,4,½)` | `3 < 4(1−ε)` iff `ε < ¼`; `3 < 3` false; `3.5 < 4(1−ε)` iff `ε < 1/8`; `n+s < c` forces `c > 0` | holds | none |
| §2.2 first extension | `α_i = 0`; `N → N+1` | undefined; `α^{−N−1}U^{N+1}f = α^{−N}U^N(α^{−1}Uf) = α^{−N}U^N f` | holds | none |
| §2.4 words at `N = 2` | GG, GB, BG, BB | `U∘T_0` ∋ GG, GB; `T_1` = BG; `R_2` = BB, each once; `N = 1`: `U = T_0 + R_1` | holds | none |
| §2.5 contraction | `n=3,c=4,s=0,ε=1/8`; `c=3` | `3 − 4·7/8 = −1/2`; `3 − 3(1−ε) = 3ε > 0` | holds | none |
| §2.6 path sums | bad part 0; `N = 1` | all `f_N = α^{−1}U f`; `α^{−1}U^{good}f`; precision loss `n_i + v(α_i)` (BPS line 1258) | holds | none |
| §2.8 classicality | modular curve `n=1,c=k`; Siegel `κ=(k₁,k₂)`, `n=3`; `κ=(6,6)` | `s < k−1`; `s < k₂−3`, none at `k₂=3`; `s < 3`; agrees with BCGP21 Thm. 6.5.8 at `I=∅` (`< l_v − 3`) | holds | none |
| §2.9 dimension one | compact Shimura curve; modular curve | no boundary; poles at cusps, BPS Remark 5.3.2 | holds | none |
| §3.1 spherical T | `r = 3`; `p = 2`; index computation | scalar `p^0 = 1`; `[K : K ∩ gKg^{−1}]` for `g = diag(1,p,p,p²)` = (isotropic lines `1+p+p²+p³`)·p = `p+p²+p³+p⁴` = 30 at `p=2`; `T = T_{p,1} + (1+p+p²+p³)T_{p,0}` (P20 line 1671) | holds | none |
| §3.2 rank zero | `k = 0`; `p = 2, 3` | nothing asserted; `r ≥ 6, 12` | holds | none |
| §3.3 amplitude | `r = 2` vs `r ≥ 3` | `H⁰` iso and `H¹` injective only; quasi-iso (P20 Prop. 8.2.1 lines 2427–2432) | holds | none |
| §3.4 away-p scalars | `ℓ = 2` | `ℓ^{−3} = 1/8`, `ℓ^{−6} = 1/64` (P20 line 4862) | holds | none |
| §3.5 Euler characteristic | `Λ₁ --0--> Λ₁`; sign of `λ₁` | `χ = 1 − 1 = 0` with free cohomology; source `k = −λ₁ − 1`, so `λ₁ = −k−1 < 0`; Prop. 15.2.4.1 prints `λ₁ > 0` | holds; locator slip | R04 |
| §4.2 coefficients | `(2,2)`; two places, `|I| = 1`; `Δ = ℤ/p` on `𝔽_p[Δ]` | trivial character; `1 + 2 = 3`; invariants = norm line, not a summand of an indecomposable | holds | none |
| §4.3 normalizations | `I = ∅`; `I = S_p`; `U_{v,2}` | `∏U_{v,1}U_{v,2}`; `∏U_{v,2}`; `p^{−2}·p^{−1} = p^{−3}`, with `det` factor `p^{−l}`: `p^{−5}` at `l = 2` (BCGP21 line 5129) | holds | none |
| §4.4 amplitude | `I = ∅`; `F = ℚ`; `l_v = 2` | `[0,0]`; `[0,1]` = §3.3; endpoints only (Thm. 4.2.1(2)–(4)) | holds | none |
| §4.5 derived fibre | `[Λ --T--> Λ]` at `T = 0` | derived fibre `ℤ_p` in degrees 0 and 1; `H^0(M) = ker T = 0` so `H^0 ⊗ Λ/T = 0` | holds | none |
| §4.6 dévissage | `k[x,y]/(x^n,y^n)` at `n = 2` | length `4`; recursion `(n−1)²+1 = 2`; the displayed sequence in BCGP21 Prop. 4.6.19 (lines 5564–5579) is not exact for `|J| ≥ 2` | holds | none |
| §4.7 control | `I = ∅`; `F = ℚ` | `[0,0]`; `[0,1]` = HHCT §9.8 | holds | none |
| §5.1 operators | `l = 1, 2, 3` | `p^{−3}(raw_et + raw_me) = U_Iw + p^{−3}p^{l+1}Z`: `U_Iw + pZ` at 3, `U_Iw + Z` at 2; `p^{−l−1}` normalization at `l=1`: `pU_Iw + Z` | holds | none |
| §5.2 partial Frobenius | degrees | `p³` on `Y₁^I`, `p²` on `D_w`; polarization `p²x_wλ`; marking `p^{−1}πη` (BCGP21 lines 6126–6131) | holds | none |
| §5.3 unit | `Norm(x_w)³/p³` | valuation `3·1 − 3 = 0` | holds | none |
| §5.4 degree | `p⁴` vs `F_w²` on `D_w` | Lemma 5.7.2: `p⁴`; `(p²)² = p⁴` | holds | none |
| §5.5 quadratic | `α = 2, β = 3` | `U_Kli = 5`, `U_{w,2} = 6`: `4 − 5·2 + 6 = 0` | holds | none |
| §5.6 companion | `T=5,U=6,(2,3)`; symbolic; sign flip | `C(2,3) = (28,−2)`; `C²(x,y) = (T²x+TUy−Ux, −Tx−Uy)`, `diag(T)C = (T²x+TUy, −Tx)`, difference `+ (Ux,Uy)` is `(0,0)` with no commutation; inverse checked both sides; `−x ↦ x` gives `X² − TX − U` | holds | none |
| §5.7 no eigenvector | `β = 0` | hypothesis `α_w,β_w ≠ 0` is in Thm. 5.8.4 (line 6489) | holds | none |
| §5.8 equivariance | symbolic | `U_Iw(f+Zg) = U_Iw f + U_{w,2}g = (U_Kli − Z)f + U_{w,2}g = Δ(C(f,g))` | holds | none |
| §5.9 refinements | `α=2, β=3` | `ι_2` image `(1 − 3U_Iw^{−1})f` (Remark 5.8.7 line 6556) | holds | none |
| §6.1 character | `(2,2)` | `κ_A = 0` | holds | none |
| §6.2 cube cover | `|I| = 1, 3` | two affinoids, two-term complex; `2³ − 1 = 7` Čech length vs amplitude 3 | holds | none |
| §6.3 trace factors | `U_{v,1}U_{v,2}`; `U_{v,2}` | `p^{−3}·p^{−3} = p^{−6}`; `p^{−3}` | holds | none |
| §6.4 BGG scaling | q-expansions; gap 3, slope 0 | `Uθ = pθU`, so `U_target∘θ^m = p^m θ^m∘U_source`; twisted slope `0 + 4 = 4 > 0` under the printed direction, `0 − 4 = −4` under the README's | **fails** | R01 |
| §6.5 polynomial inverse | `P = (X+1)²`, `U = −1` | `R = −(X²+2X)`, `R(−1) = 1`; `Q = −X−2`, `UQ(U) = (−1)(−1) = 1`; `F=ℚ`: `k_v + l_v − 3 = k + 2r − 3` | holds | none |
| §6.6 Euler constancy | `H⁰ = H¹ = E` vs `0` | `χ = 0` both, dimensions jump | holds | none |
| §6.7 Euler identity | symbolic; `|I| = 3` | `(h⁰_s − h¹_s) − (h⁰_t − h¹_t) = −a − b` with `a = h⁰_t − h⁰_s ≥ 0`, `b = h¹_s − h¹_t ≥ 0`; four degrees uncontrolled | holds | none |
| §7.1 BGG category | `GL₂` standard rep, `𝔫` | `H⁰(𝔫,M) = ⟨e₁⟩`, `H¹ = M/𝔫M ⊗ 𝔫^∨` one-dimensional, total `2 = |W|` | holds; coadmissibility owned earlier | R03 |
| §7.2 non-Liouville | integral λ | `⟨λ+ρ,α^∨⟩ ∈ ℤ` | holds | none |
| §7.3 functor | zero module; split sequence | zero complex; zero connecting map | holds | none |
| §7.6 degrees | `p = 0, q = d` | `H^{2·0+d−d} = H⁰` | holds | none |
| §7.8 Sen scalars | `λ = (1,1;2)`; `(1,1;−2)`; sum | `−2,−2,−3,−3`; `0,0,−1,−1`; `(−12 − 4w)/2 = −6 − 2w` | holds | none |
| §8.1 Cousin | twists | degree 2 `ℂ_p(2,0;0)`, degree 3 `ℂ_p(0,0;0)` (BCGP25 lines 4796–4797); slopes `−(2,2;w)`, `(0,−2;−w)` vs `−(1,1;w)` (line 4744) | holds | none |
| §8.2 Sen block | `w = 2`; Jordan block | `a = −2`; `[[a,1],[0,a]]` has `N_a ≠ 0` with equal graded scalars | holds | none |
| §8.3 operators | `x∂_x + 1`; `(x+1)∂_x + 1` on `1/(1+x)` | `Σ(n+1)a_n xⁿ`; `−1/(1+x) + 1/(1+x) = 0` | holds | none |
| §8.5 torsion | `M = E[T]/(T−a)²` | `M[T−a] = S`, `(M/S)[T−a] = E`, map `S → E` zero: not exact; Thm. 4.12.4(3) is the independent hypothesis | holds | none |
| §8.6 classicality | hypotheses (1)–(4) | matched to BCGP25 lines 5083–5091; de Rham = semisimple Sen with eigenvalues `−1−w/2, −2−w/2` (line 5078) | holds | none |
| §9.3 weights | `ν = (0,−2)` | `(3−ν₂,3−ν₁) = (5,3)`, `(3−ν₂,ν₁+1) = (5,1)`, `(2−ν₁,ν₂) = (2,−2)`, `(ν₁,ν₂) = (0,−2)` | holds | none |
| §9.5 duality | `κ = (5,3)` | `(3−3, 3−5) = (0,−2)`; lengths `0+3 = 1+2 = 3` | holds | none |
| §9.6 projectivity | `Δ = ℤ/p` | regular representation: invariants not a summand; DDPA §5.9 = Lemma 7.3.2 | holds | none |
| §9.7 choice of r | `p = 2, r = 7`; `p = 3, r = 7, 11` | `7 ≡ 3 mod 4`, `(𝔽₇^×)/±1` of order 3; `7 ≡ 1 mod 3` fails; `11 ≡ 2 mod 3`, order `5` | holds | none |

**Context and generality.** `Suggested.lean` has no `variable` block and no declaration, so the context check is vacuous; the README's generality is that of its sources at every sampled target (§2.8 covers every datum with §2.9 for dimension one, as BPS Thm. 5.3.1 and Remark 5.3.2; §5.6 needs no commutation, as computed).

## Not verifiable

- BCGP21 Proposition 3.8.3's proof (pp. 55–56), on which the README's claim that Proposition 4.4.3 needs `p ∤ |Δ|` rests: read only its first lines; the README keeps the hypothesis, so nothing depends on the verdict.
- P20 §7.2 (p. 40), the divisibility of `T₂′` by p for `r ≥ 1` in §3.1: not read; §7.1 and Lemma 7.1.1 were.
- BCGP25 §3.6.2 and the character `η = (0,−1;1)` and `µ₀` of §8.3: Theorem 3.6.9 and Proposition 3.6.15 were read; the definition of η was not.
- HodgeTateAndCanonicalSubgroups' exclusion of Hilbert–Siegel data: inferred from its summary, Conventions and §5.1's title, not from an explicit exclusion sentence.
- SiegelModularForms (#1714) and the open pull requests whose files the brief does not provide: ownership was checked only through `roadmaps grep`.

## Source issues

- **Misprint** in P20 at Proposition 15.2.4.1, printed page 109: the source takes the singular parameter with positive first coordinate; it should be negative, as §§15.2.1–15.2.3 set `k = −λ₁ − 1`; affects nothing.
- **Error** in BPS at Lemma 4.4.3, HAL printed page 24: the proof calls the product of the quotient coordinates from the k-tuple space to the k-fold product of the Shimura variety finite étale; for k above one source and target have different dimensions, and only the single coordinate maps are finite étale; affects the proof.
- **Gap** in BCGP21 at Proposition 4.6.19, proof, printed pages 113–114: the displayed short exact sequence of quotients by sums of powers of partial Hasse invariants is not exact when two or more places are involved (lengths n² against (n−1)²+1); the dévissage must run one exponent at a time; affects the proof.
- **Gap** in BCGP21 at Theorem 6.6.4, proof, printed page 167: the two dimension defects are compared for the full overconvergent cohomology while Proposition 6.6.1 bounds the restriction from the multiplicative-locus complex; the argument closes with the defects of that restriction map; affects the proof.
- **Misprint** in P20 at Corollary 14.6.2, proof, printed page 99: the displayed polynomial inverse omits the coefficient of the linear term; it should carry that coefficient, as the general formula `Q = −(P − P(0))/(X·P(0))` does; affects nothing.
- **Misprint** in BCGP25 at Remark 4.10.7, printed page 107: the degree-zero term is displayed with the weight of the degree-three term; it should carry the dual weight, as in §4.10.8; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a93b4095264ed512203a6e4c357456154414212b", "job": "REV-PKG-PadicFamiliesPartII", "model": "fable", "worker": "chris-x19"} -->
