# Review of GanGrossPrasadUnitaryGroups (pull request #1404 at 7df8ca8)

**Verdict:** needs changes

Full review of the repaired head (226 changed lines since 7ec0f14). The change moves the Gelfand–Kazhdan criterion, the Fourier-averaging extension, quasi-character germs, the canonical Rankin–Selberg/Flicker–Rallis periods, the coarse Jacquet–Rallis expansion and the multiplier-matching theorem into new targets §§2.1a, 3.2a, 3.3a, 6.1a, 6.2a, 6.3a, retires three AutomorphicSpectralTheory gaps and adds a real Plancherel gap on AutomorphicFormsOnReductiveGroups. Of the previous review's three findings one is repaired and two are not. Three new blocking findings: §6.3a(i) states an "iff" whose extra vanishing clause makes one direction false; §3.3a defines quasi-characters by a property that admits non-quasi-characters and fixes no topology; §3.3a's route uses the nonarchimedean Harish-Chandra–Howe character expansion, which the cited supplier section does not state. The gate passes; the dependency check shows no UPWARD or CYCLE line.

## R01 (P2) — §6.3a(i): the vanishing clause breaks one direction of the "if and only if"

Location: `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md` line 1361, "(i) … have matching relative orbital integrals, Ω_□(γ)O(γ,f′)=O(δ,f_h) at every matching regular semisimple pair and zero orbital integrals of f′ on orbits matching no orbit of G_h, if and only if they have matching relative characters".

Claim: matching characters on G_h(F_□) are equivalent to matching orbital integrals on G_h together with vanishing of the orbital integrals of f′ off the G_h-image.

Witness: bplzz Lemma 4.9 (line 1710–1715) is the equivalence without the vanishing clause (Definition 4.4(1), line 1613–1621, compares only matching pairs). Counterexample to the added clause: □ contains the real places, where ℂ/ℝ is nonsplit, so for n ≥ 1 the regular semisimple orbits of G′(ℝ) matching the other signatures h′ ≠ h are nonempty. Take f′₂ whose orbital integrals vanish on every G_h-orbit but not on some G_{h′}-orbit; then (f′₂, 0) match on G_h, so by Lemma 4.9 itself I_{BC(σ)}(f′₂) = κ J_σ(0) = 0 for every distinguished tempered σ of G_h. For any (f′₁, f_h) matching on G_h, f′ = f′₁ + f′₂ satisfies κ J_σ(f_h) = I_{BC(σ)}(f′) for all such σ, but O(γ, f′) = O(γ, f′₂) ≠ 0 on an orbit matching no G_h-orbit. The right side holds, the left side fails. The README's own route for the converse ("recover orbital integrals by density … in L² of the regular semisimple quotient") recovers them on the G_h-image only.

Repair: delete the clause "and zero orbital integrals of f′ on orbits matching no orbit of G_h" from (i), so that (i) is exactly Lemma 4.9 (both directions as proved there). If the vanishing version is wanted for complete transfer to (f_h, 0, …), state it as a separate equivalence whose character side quantifies over every form h′ (κ J_{σ′}(0) = I_{BC(σ′)}(f′) = 0 for σ′ on G_{h′}, h′ ≠ h), which is what the counterexample above needs. With the clause removed the instance f′ = f′₁ + f′₂ is no longer a counterexample: both sides hold.

## R02 (P2) — §3.3a defines quasi-characters by a consequence that admits non-quasi-characters and fixes no topology

Location: `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md` line 699, "a quasi-character is a conjugation-invariant smooth function θ on the regular semisimple set G_rs(F) such that near every semisimple x it has an expansion D_G(xe^X)^(1/2)θ(xe^X)=D_G(xe^X)^(1/2)Σ_O c_(θ,O)(x)ĵ(O,X)+O(|X|) … the sum over the regular nilpotent orbits".

Claim: this is the quasi-character space on which §§3.3a–3.5 state continuity (the API bullet "linear and continuous on the quasi-character space", assertion (iii) "a continuous seminorm ν_L on the quasi-character space", §3.4 "m_geom is a continuous complex-linear functional on quasi-characters").

Witness: bp-arch defines quasi-characters otherwise. For F p-adic (§4.1, line 3044–3051 and 3067–3073) θ must satisfy an exact equality θ(xe^Y) = Σ_{O∈Nil(g_x)} c_{θ,O}(x) ĵ(O,Y) on a G_x-excellent neighbourhood, summed over all nilpotent orbits, and QC(Ω) carries the projective-limit topology of line 3055–3064 and 3074–3080; for F = ℝ (§4.4, line 3793–3808) θ ∈ C^∞(Ω_reg)^G with D_G^{1/2} zθ locally bounded and z T_θ = T_{zθ} for every z ∈ Z(g), with the seminorms q_{L,z}. The regular-orbit expansion with error O(|X|) is derived from these definitions in §4.5 (line 3986–3992). Instance separating the two: on GL₂(F), F p-adic, θ(g) = |det g|^{1/2}|a − b| (a, b the eigenvalues) is invariant and locally constant on G_rs; near x = 1, D_G(e^Y)^{1/2}θ(e^Y) = |a − b|² = O(|Y|²), and near a regular x the expansion holds with c = θ(x), so θ satisfies the README's definition with every coefficient zero at 1; but θ(e^Y) has homogeneity degree +1 in Y while ĵ(0,·) = 1 and ĵ(O_reg,·) have degrees 0 and −1, so no exact expansion of bp-arch's form exists on any neighbourhood of 1: θ is not a quasi-character. The continuity assertions have no topology to refer to.

Repair: define quasi-characters as in bp-arch §4.1 (p-adic: exact expansion over Nil(g_x) on a G_x-excellent neighbourhood of every semisimple x, with the finest-locally-convex/projective-limit topology) and §4.4 (real: the Z(g)-conditions above with the seminorms q_{L,z}); then state the regular-orbit expansion with O(|X|) as the first theorem of §3.3a (bp-arch §4.5, line 3986–3992) and derive the uniqueness of c_{θ,O}(x) from the homogeneity and linear independence of the ĵ(O,·). On the instance θ = |det g|^{1/2}|a − b| the repaired definition correctly rejects it.

## R03 (P2) — §3.3a uses the nonarchimedean local character expansion, which EndoscopicTransferAndUnitaryTraceComparison §2.16 does not state

Location: `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md` line 703, "Prove the expansion from the local character expansion of Harish-Chandra at finite places", and line 712, "*Needs:* … EndoscopicTransferAndUnitaryTraceComparison §2.16 (Harish-Chandra's character theorem and the Weyl integration formula over p-adic fields)"; also line 699, "Characters of admissible representations … are quasi-characters".

Claim: the Harish-Chandra–Howe expansion θ_π(xe^Y) = Σ_{O∈Nil(g_x)} c_O ĵ(O,Y) near every semisimple x (the p-adic input to "θ_π is a quasi-character", bp-arch Proposition 4.1.1, line 3083–3085) is supplied by §2.16.

Witness: at the head of pull request #999, `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md` §2.16 states (a) finite rank of π(f), (b) local integrability of θ_π, local constancy on G_rs and local boundedness of |D|^{1/2}θ_π, (c) the Weyl integration formula and (d) elliptic determination; the orbital-Fourier expansion appears only inside its proof route ("express the descended distribution locally by Fourier transforms of nilpotent orbital measures"). §2.6 states Shalika germs for orbital integrals, not for characters; §2.3 is the real regularity theorem. A grep of main and the 466 open heads for "character expansion", "Harish-Chandra–Howe" and "wavefront" finds no roadmap stating it; ExceptionalThetaCorrespondencesForG2 requests a wavefront gap from SmoothRepresentationsOfLocalGroupsPartII, which is later than this roadmap and cannot be cited here.

Repair: either state the expansion as a target of §3.3a in the author's words ("for F nonarchimedean, π irreducible admissible and x semisimple, there are a G_x-excellent neighbourhood ω_x of 0 and coefficients c_O, O ∈ Nil(g_x), with θ_π(xe^Y) = Σ_O c_O ĵ(O,Y) for Y ∈ ω_x,reg"; locator bp-arch Proposition 4.1.1, p. 81, line 3083–3085, with the §2.16 inputs it uses), or declare `gap:local-character-expansion` on EndoscopicTransferAndUnitaryTraceComparison §2.16 with the same slug in `design/plan.json`. Then "characters of admissible representations are quasi-characters" has an owned input at finite places (its real input, Harish-Chandra's regularity theorem, is §2.3(b) and is correctly cited).

## R04 (P3) — `design/plan.json` still disagrees with the README's gaps (one slug missing, three stale, five relabelled)

Location: `packages/GanGrossPrasadUnitaryGroups/design/plan.json`, `gaps`; `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md` line 108 (gap:real-plancherel-decomposition), lines 408, 647, 697 (§§2.1a, 3.2a, 3.3a now own the former gaps).

Claim: every gap the README declares is declared where the intake reads it, with the same supplier and section.

Witness: script comparison of the 36 plan slugs with the 34 README slugs: `real-plancherel-decomposition` is in the README only (so it is not a declared gap for the intake); `distribution-gk`, `local-fourier-extension`, `local-schwartz-germs` are in the plan only (the intake would announce on AutomorphicSpectralTheory's job three requests the README no longer makes); the five supplier/section disagreements of the previous review's R01 (`enhanced-packets`, `global-parameters`, `ordinary-endoscopy`, `spectral-isolation`, `hermitian-unitary`) persist, the plan being byte-identical to the one read at 7ec0f14 (last changed at the package submission).

Repair: in the plan's `gaps` list add `real-plancherel-decomposition` (supplier AutomorphicFormsOnReductiveGroups, section "§§2.4, 2.7: real Plancherel supplement", `needs` the README's first sentence at line 108), delete the three retired entries, and set the five entries' `supplier`, `section` and `needs` to the README's. Carried from the previous review's R01.

## R05 (P3) — `sources.toml` still lacks `bpc-bessel` and `kmsw`

Location: `packages/GanGrossPrasadUnitaryGroups/sources.toml` (17 keys); README References lines 1568 and 1570; line citations at README line 583 (kmsw line 1074–1113, 2578–2619) and line 1010 (bpc-bessel line 268–284, 352–379).

Claim: every cited work is recorded in the manifest and its line locators refer to a cached extraction.

Witness: `grep -c 'bpc-bessel\|kmsw'` on the manifest returns 0. Fetched this round through the sources service into a scratch copy of the manifest: kmsw from arXiv 1409.3731v1 (§0.4.4 at line 1074–1113, pp. 27–28; §1.2.4 at line 2578–2619, p. 62, both as cited) and bpc-bessel from the author page named in References (Theorem 1.3.3.1 at line 268–284, pp. 6–7; §1.3.6, Theorem 1.3.6.1 and Remark 1.3.6.2(3) at line 352–379, pp. 8–9, as cited). The line locators are correct against those extractions, so only the manifest records are missing.

Repair: add both keys with the service's provenance (kmsw: arXiv 1409.3731v1, open repository; bpc-bessel: the author page, licence class author-page) and the locators above. Carried from the previous review's R02.

## R06 (P3) — §6.1a cites the Flicker–Rallis intertwining period at p. 51; it is on p. 50

Location: `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md` line 1248, "(bpcz §4.1.5, p. 51, bpcz line 2584–2593)".

Claim: J(φ) and its nonvanishing criterion are on p. 51 of bpcz.

Witness: in the bpcz extraction the page-50 marker is at line 2551 and the page-51 marker at line 2602; lines 2584–2593 (§4.1.5, J(φ) = ∫ φ(g)dg over A_{M′}^∞ M′(F) N_{P′}(A)\G′(A), nonzero iff every σ_i is distinguished) lie on p. 50.

Repair: write "p. 50".

## Previous findings

- R01 (plan.json suppliers and sections) — not repaired: the plan is byte-identical; the mismatch has grown (this report's R04).
- R02 (bpc-bessel and kmsw missing from the manifest) — not repaired: 17 keys, neither present (this report's R05).
- R03 (gap:hermitian-unitary citing RG2.2.4 and "on main") — repaired: line 75 now reads "appear only as the three-variable quasi-split unitary example of RG2.1 (its root data in RG2.1.2–RG2.1.4 and its parahoric models in RG2.3.1 and RG2.3.4) and the quaternionic Hermitian forms of RG2.3.5", the wording the previous review asked for; no "on main" remains.

## Verified sound

**Gate and build.** The worker's gate at 7df8ca8 passes every check (`build=0`, `depcheck=0`, `stray-files=0`, `outside-folder=0`). My dependency check: `depcheck: 239 roadmaps, 2359 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GanGrossPrasadUnitaryGroups'` is empty. `lake env lean` on `Suggested.lean` at the pins recorded in `lake-manifest.json` (Mathlib 6b7abb3c, Tau Ceti a91d3aaf, the same pins the README names at line 46) exits 0 with no output in 16 s. The file declares nothing: one module docstring naming every headline theorem with the carrier it lacks, an empty namespace. There is therefore no `#check` probe and no one-tactic padding probe to run, no sorry'd data and no `set_option`. Statability at the pins: no smooth admissible or Casselman–Wallach category, no local-field class, no arbitrary-form unitary group, no adelic automorphic realization exists in Mathlib or Tau Ceti at these pins (checked by grepping the pinned trees for `Representation`/`unitaryGroup`/`Schwartz` carriers), so the docstring's "not statable" list is correct for all eleven headline groups of README line 201, and no auxiliary identity is stated in their place.

**Scope and principles.** No route-specific shortcut, no replanned roadmap: the six new sections own objects that no roadmap on main or at an open head builds (grep over the 466 open heads and main for "Gelfand–Kazhdan", "Harish-Chandra descent", "Luna slice", "Fourier-averaging", "Flicker–Rallis", "Jacquet–Rallis", "cuspidal datum", "Schwartz multiplier", "Bessel model", "Bessel period", "germ coefficient", "quasi-character": the only other hits are AutomorphicSpectralTheoryPartII at #1761, whose Scope paragraph (line 18) says the local harmonic analysis is outside it and that GanGrossPrasadUnitaryGroups §6.3a owns multiplier-matching preservation; TwistedAutomorphicDescents at #1758, which consumes this roadmap's §§1.2–1.3, 2.1–2.6, 4.1–4.4 and 7.1 and builds no unitary Bessel object; and AutomorphicLFunctionsAndLocalFactors, where "quasi-character" means a Hecke quasi-character). Ownership against the open pull requests without files in this brief was not checked beyond those greps.

**Cross-roadmap citations resolved this round** (via `roadmaps show` at the open heads):
- AutomorphicFormsOnReductiveGroups #1037: §0.1a "Test functions on the archimedean group", §0.3 "Schwartz functions on the group", §§2.1–2.4 (compact-finite vectors; infinitesimal characters; normalized real induction; temperedness and discrete series), §2.6, §2.7 "Smooth Fréchet representations and globalization" — all headings exist with these subjects.
- AutomorphicLFunctionsAndLocalFactors #924: AL.0.3.1 "The local Schwartz–Bruhat space S(F), its F^×-action and tempered distributions" (exact title), AL.3.1.2, AL.3.2.1–AL.3.2.3, AL.3.8.1, AL.R.1.
- AutomorphicSpectralTheory #925: §0.9 "Complex operator trace", §0.48, §0.49, §2.1 "Local standard intertwining operators", §2.2 "Harish-Chandra μ-function", §2.4 "Langlands meromorphic continuation and functional equations", §2.14 "GLₙ isobaric automorphic sums", §3.1 "Parabolic truncation cones", §3.2 "Arthur truncation operator", §6.3 "Arthur spectral multipliers", §6.4 "Automorphic convolution kernels", §6.5 "Coarse truncated trace kernels".
- EndoscopicTransferAndUnitaryTraceComparison #999: §2.3 "Harish-Chandra's character theory for real reductive groups" (its (b) is the regularity theorem §3.3a uses at ℝ), §2.6 "Shalika germs on p-adic Lie algebras", §2.16 (R03), §§11.0d–11.0e, 11.2–11.4 as in the previous review.
- AutomorphicSpectralTheoryPartII #1761 declares `gap:real-plancherel-decomposition` on AutomorphicFormsOnReductiveGroups (line 56) and says it is "the same request with the same owner as in GanGrossPrasadUnitaryGroups" (line 18): README line 108's sentence to that effect is accurate.
- ReductiveGroupsPartII on main: RG2.1.2–RG2.1.4, RG2.3.1, RG2.3.4, RG2.3.5 as located in the previous review (R03 repair checked against them).

**Gap audit.** 34 `gap:` slugs in the README; every one names a supplier earlier in the merge order; each `needs` sentence is a single precise request with its hypotheses (the new `real-plancherel-decomposition` names the Schwartz algebras, the Levi disintegration, formal degrees and elliptic character independence it needs, and says it is not the relative trace identity). No gap asks for what Mathlib, Tau Ceti or an earlier roadmap already provides: the three retired AutomorphicSpectralTheory gaps are now targets here (§§2.1a, 3.2a, 3.3a) and nothing else owns them. The plan/README mismatch is R04.

**Sources, seeded sample** (every locator opened in the cached extraction; page markers checked; the statement supports the README as written unless a finding says otherwise):
- 2.1a: ag-descent Theorem 3.1.1, p. 9, line 406–410 (descent to normal spaces at G-semisimple points with the restricted character); Theorem 5.1.5, p. 13, line 583–586 (ρ(t)ξ = δ_B(t)|t|^{dim V/2}ξ, ξ = γ(B)⁻¹F_B ξ, zero for odd dim V, with an auxiliary B-analytic M); Definition 5.1.6, line 589–595; Theorem 5.1.7, line 596–599 (Nash M, a nonzero F_B- and B-stable subspace contains a nonzero adapted distribution); Theorem 8.1.5, p. 25, line 1189–1191, with GP2 at line 1175–1176 (dim Hom_H(E,ℂ)·dim Hom_H(Ẽ,ℂ) ≤ 1 for irreducible admissible E, Fréchet at ∞ by Definition 8.1.1); agrs Proposition 1.1 and Corollary 1.1, pp. 6–7, line 220–235 (unimodular M, N; biinvariant and conjugation-invariant forms).
- 2.7: harris Proposition 2.1, p. 5, line 250; weak inequality line 239–242; bpcz line 166.
- 3.2: ggp Theorem 6.1(3), p. 20, line 732–737 (χ′_N = χ_N·det(M^a⊗N)(t)); §18, pp. 71–72, line 2503–2519 (parameter under J(θ^t) is (φ, χ·η)).
- 3.2a: bp-arch Proposition 7.1.1, p. 177, line 6635–6640, proof line 6641–6743 (p-adic averaging over K_a = a⁻¹(K∩A(F)) with the Fourier transform of |·|⁻¹1_{K_a}; real case by elliptic regularity and Fourier decay (1+|x|)^{−2m+2}); Lemma 7.1.2, pp. 179–180, line 6753–6770 (P_{H,ξ}(Ad_a(φ)f) = ∫ f(h) φ̂′(λ(h)) dh with φ′(t) = |t|⁻¹δ_P(a(t))φ(t), δ_H in the proof at line 6739); Lemma 6.5.1(iii), p. 155, line 5738–5743, is the convergence input the README abstracts into its weight hypothesis.
- 3.3a: bp-arch §4.5, p. 106, line 3984–4011 (expansion over Nil_reg(g_x), uniqueness, c_θ as the average, Proposition 4.5.1(i)–(iii)); Proposition 4.8.1(i), p. 115, line 4298–4301 (c_{π,O}(1) = 1 iff π has a Whittaker model of type O). Definitions: §4.1 line 3041–3080, §4.4 line 3791–3813 (R02); Proposition 4.1.1 line 3083–3085 (R03).
- 3.4: bp-arch (11.1.3) and the Γ measure, pp. 259–260, line 10057–10078 (|W(T)|⁻¹ν(T), mass-one tori, 1 an atom of mass 1); (11.2.1), p. 263, line 10204–10208; Proposition 11.2.1, p. 265, line 10248–10252; Lemma 11.3.1, p. 272, line 10538–10539; Proposition 4.5.1(1)(i), line 3999–4000.
- 3.5: bp-arch Theorems 11.4.1–11.4.3, p. 273, line 10551–10559; bp-unitary-tempered Théorème 17.1.1, line 5003–5004.
- 3.9: xue-real Theorem 2.2, p. 1000, line 213–216; Propositions 2.3–2.4 and Corollary 2.5, p. 1001, line 238–255; line-sign remark, p. 999, line 179–182.
- 4.4: ggp Conjecture 24.1, p. 90, line 3175–3182; bpc-bessel Theorem 1.3.3.1, pp. 6–7, line 268–277 and Remarks 1.3.3.2, line 278–285 (m = 0 is the Whittaker coefficient); §1.3.6 and Theorem 1.3.6.1, pp. 8–9, line 352–373; Remark 1.3.6.2(3), line 378–379.
- 5.1: bpcz §1.1.6, p. 4, line 148–169 (L(s,σ) quotient, absolute convergence by Har14 2.1, no zero or pole at 1/2); harris Remark 1.4, p. 3, line 149–157 (L_F(s,π_i,Ad) = L_F(s,BC(π_i),As^{(−1)^i})).
- 5.1a: zhang-period Proposition 4.10, p. 31, line 1543–1551 (α = λ·λ for tempered π, via multiplicity one and nonvanishing of the local integral); (3.23)–(3.26), p. 19, line 962–986; measure warning, p. 9, line 424–440; change of measures, p. 29, line 1437–1440; Lemma 4.9, pp. 30–31, line 1523–1542.
- 5.2: bpcz (1.1.6) P♮ definition, line 159–169; harris pairings, pp. 2–3, line 92–111.
- 5.4: bpcz line 160–188 and (1.1.6.1); §2.3.2, p. 15, line 679–682.
- 6.1a: bpcz 7.1.2 (H-generic), p. 71, line 3784–3793; Theorem 7.1.3.1, line 3794–3801; Theorem 7.1.4.1, pp. 71–72, line 3802–3811 (P_H(f) = Z^RS(0,f) on T_χ); 4.3.2 (∗-generic), p. 54, line 2791–2795; 6.2.4 (β_n with (Δ^{S,∗}_{G′})⁻¹L^{S,∗}(1,Π,As)), p. 63, line 3267–3281; Theorem 6.2.5.1(2) (2^{1−k}φ̂(0)β_n), Theorem 6.2.6.1 (factor 1/2), Corollary 6.2.7.1 (2^{−dim A_P}), pp. 63–64, line 3287–3319; 4.1.5, line 2584–2593 (R06 for its page); 4.1.3, line 2577–2578.
- 6.2: bpcz 2.8.3, p. 25, line 1167–1170; Proposition 2.8.4.1, line 1174–1186; 5.1.5 and Proposition 5.1.5.1, p. 59, line 3040–3058; 8.1.3, p. 78, line 4225–4233; 10.1.2, p. 87, line 4694–4701; 10.3.1, pp. 90–91, line 4873–4888.
- 6.2a: bpcz (3.2.3.1) and Remark 3.2.3.1, p. 35, line 1667–1684; Theorem 3.2.4.1, pp. 35–36, line 1686–1711 (the four assertions as restated).
- 6.3a: bplzz Definition 4.4 and Remark 4.5, p. 33, line 1613–1635; Proposition 4.8, pp. 34–35, line 1685–1709; Lemma 4.9, pp. 35–36, line 1710–1771 (R01); Lemma 4.12, p. 37, line 1811–1831 (μ̃′ = (μ′)²∏cb^V((μ^V)²), μ̃^V = bc^V(μ̃′)).
- 7.3: harris Conjecture 1.3, p. 3, line 132–144 (Δ_{G_{n+1}}, 2^β = |S_{ψ_{n+1}}||S_{ψ_n}|); bpcz Theorem 1.1.6.1, pp. 4–5, line 179–192.
- 7.1, 7.2, 7.4: bpcz Theorem 1.1.5.1, p. 3, line 124–134; bplzz Definition 1.5, p. 3, line 128–131; Theorem 1.8, p. 4, line 157–170; Theorem 1.10, p. 4, line 185–186.
- 3.1 (kmsw): §0.4.4, pp. 27–28, line 1074–1113 (S_φ, S_φ^rad, S_φ^♮); §1.2.4, p. 62, line 2578–2619 (S_ψ ≃ ∏O(ℓ_i)×∏Sp×∏GL, split case S̄_ψ = {1}).

**Adversarial table** (values computed this round; rows marked r1 are carried from the first review and were not recomputed).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.1a null-cone homogeneity, odd dimension | V=F, B(x,y)=xy, ξ=δ₀ | null cone {0}; F_B δ₀ = constant 1, support F; no nonzero ξ has both supports in {0}; dim 1 odd ⇒ 0 | holds | none |
| 2.1a homogeneity exponent | split plane, ξ = Haar on x₂=0 | F_B ξ(φ)=∫φ(y₁,0)dy₁ = ξ(φ); dilation scales by |t|¹; |t|^{dim V/2}=|t|¹; δ_B=γ(B)/γ(tB)=1/1 | holds | none |
| 2.1a Gelfand–Kazhdan criterion, degenerate | N=M; N=1, τ=transpose on GL₂ | biinvariant = c·Haar, inversion-invariant, Hom_M(π,ℂ)≠0 only for trivial π, 1·1=1; N=1: δ_g (g≠gᵗ) not τ-invariant, Hom_1(π,ℂ)=π* infinite-dimensional | holds | none |
| 2.7 temperedness needed | split GL₂×GL₁ trivial; compact U(1) | ∫_{F×}1 = ∞; vol(U(1)) < ∞ | holds | none |
| 3.2 change of ψ_E | dim (2,1), t nonnorm, 1-dim ρ on V | V generator ×det(ρ⊗φ_W)(t)=η(t)=−1; W generator ×det(φ_V⊗ρ′)(t)=η(t)²=1 | holds | none |
| 3.2a cocharacter and modulus | GL₂, H=N, a(t)=diag(t,1); diag(1,t) | a n(x) a⁻¹ = n(tx), λ scales by t, δ_H(a(t))=|t|, |t|⁻¹δ_H=1; diag(1,t) gives n(t⁻¹x), λ scales by t⁻¹ ≠ t | holds | none |
| 3.2a Fourier-averaging identity | f|_N = min(1,|x|⁻¹), φ=1_{O×}, conductor-zero ψ | vol_{d×t}(O×)=1−q⁻¹; F(1_{O×})=1_O−q⁻¹1_{ϖ⁻¹O}; ∫f·F(φ) = 1−q⁻¹(1+(1−q⁻¹)) = (1−q⁻¹)²; T(f)=1−q⁻¹ (=1/2 at q=2); truncated ∫_{|x|≤q^k} fψ = 1 + (0−1)q⁻¹ + 0 = 1−q⁻¹ for k≥1; ∫|f| = 1+k(1−q⁻¹) | holds | none |
| 3.2a weight hypothesis | λ=0 | (1+|λ|)^{−δ}=1 forces ∫w<∞; min(1,|x|⁻¹) has ∫=∞ | holds | none |
| 3.3a regular coefficient at 1 | GL₂(F) trivial, principal series χ, Steinberg | c_θ(x)=θ(x)=1 at regular x; D^{1/2}·1→0 so c(1)=0; D^{1/2}θ_χ(t)→χ(1)+χ^w(1)=2, c=½·2=1; St = Ind − 1 gives 1−0=1; without |W|⁻¹: 2 ≠ dim Whittaker = 1 | holds | none |
| 3.3a compact centralizer | U(2) at x=1 | nilcone of u(2)(ℝ) = {0}, not regular in rank 2 ⇒ Nil_reg = ∅, c_θ(1)=0; U(2) not quasi-split | holds | none |
| 3.3a definition determines the space | θ=|det g|^{1/2}|a−b| on GL₂(F), F p-adic | near 1: D^{1/2}θ = |a−b|² = O(|Y|²), README expansion holds with c=0; near regular x: c=θ(x); θ(e^Y) has degree +1, ĵ(0)=1 degree 0, ĵ(O_reg) degree −1 ⇒ no exact bp-arch §4.1 expansion | README definition admits a non-quasi-character | R02 |
| 3.3a characters are quasi-characters at finite places | input needed: θ_π(xe^Y)=Σ_{Nil(g_x)} c_O ĵ(O,Y) | ETUTC §2.16 states (a)–(d) only; no owner on main or at open heads | unowned input | R03 |
| 3.4 Δ and c_θ | W=ℂ, x=−1; x=1; compact U(2)×U(1) | |N_{ℂ/ℝ}(2)|=4 (reciprocal 1/4 wrong); zero quotient determinant 1; c_θ(1)=0 with 1∈Γ (trivial torus, mass 1) | holds | none |
| 3.5 W=0 and induction factor | W=0; L=L_GL×G̃ | Γ={1}, m_geom(θ_π)=c_{θ_π}(1)=1 iff Whittaker model (Prop 4.8.1) = m(π); m_geom(i_L^G(θ_GL⊗θ̃)) = c_{θ_GL}(1)·m_geom(θ̃), c=1 for generic tempered GL | holds | none |
| 3.9 interlacing | U(2) weight (1,0), U(1) weight ∓1 | restriction weights {1,0}; bilinear pairing with −1: 1+(−1)=0 ⇒ m=1; with +1: no zero sum ⇒ m=0 | holds | none |
| 4.4 degenerate and character | W=0; line ⟨2⟩→⟨1⟩, ν(h)=i | L=1, condition = nonzero Whittaker coefficient (bpc-bessel Remark 1.3.3.2); scaling by 1/2 keeps U(h); source ψ_{B_h}=ν⁻¹=−i on both sides | holds | none |
| 5.1 Δ_{n+1} | n=1; split place | L(1,η)L(2,η²)=L(1,η)L(2,1); η_v=1 ⇒ ζ_v(1)ζ_v(2) finite for q_v>1 | holds | none |
| 5.1a rescaling | n=1, dt→2dt, B fixed | N₁=1, λ(W)=∫_{F×}W₂(diag(t,1))χ(t)dt unchanged; left side ×2 ⇒ coefficient a·b=2·1 | holds | none |
| 5.2 normalized form | U(1) mass a, B(1,1)=1; x→cx; x=0 | α(1,1)=a/C_v=q(1); q(cx)=|c|²α/(|c|²B)=q(x); α(0,0)=0, q not formed | holds | none |
| 5.3 split ℚ₂, n=1 | π_V=Ind(1⊠ω), ω(2)=−1, π_W=1, vol(ℤ₂×)=1 | Δ₂=ζ₂(1)ζ₂(2)=2·4/3=8/3; L(1/2,π_V×1)L(1/2,π_V^∨×1)=2·2=4; L(1,Ad)=(1+½)^{−2}(1−½)^{−2}·(1−½)^{−1}=16/9·2=32/9; C=(8/3)(4)(9/32)=3; Φ(diag(2^k,1)) = 2^{−k/2}(1+(−1)^k)/2; raw = 1+2Σ_{m≥1}2^{−m}=3; α=q=1=vol(ℤ₂×) | holds | none |
| 5.3 unramified E/ℚ₂, n=1 | W=⟨1⟩, V=⟨1,1⟩, σ_W=1, Satake t,t⁻¹ | Δ₂=L(1,η)L(2,1)=(2/3)(4/3)=8/9; L(1,σ_V,Ad)=L(1,As⁺)=(1−t/2)⁻¹(1−t⁻¹/2)⁻¹(1−¼)⁻¹=(4/3)L_E(1/2,BC(σ_V)×1); L(1,σ_W,Ad)=L(1,η)=2/3; product (8/9)L_E(1/2); C=1; H=K_W compact, raw=1=α | holds | none |
| 5.4 rescaling laws | B_v→2B_v; dt_v→a dt_v; global H Haar ×2 | α,B both ×2, q fixed; q×a; |P|²×4 | holds | none |
| 6.1a H′-generic datum | n=1, (GL₁×GL₁, χ⁻¹⊠χ′); χ″ with χχ″, χχ′ finite-order nontrivial | L(s,χ×χ⁻¹)=ζ_E(s), pole at 1 ⇒ not H′-generic; L(s,χχ″), L(s,χχ′) entire ⇒ generic | holds | none |
| 6.1a Flicker–Rallis coefficient | one constituent per degree; k=2 in one degree | 2^{1−1}·½=½ each, product ¼=2^{−2}; 2^{1−2}·½=¼=2^{−k} | holds | none |
| 6.1a central argument | Z_RS at s=0 vs s=1/2 | unramified factor L(s+1/2,Π_λ): s=0 → L(1/2), s=1/2 → L(1) | holds | none |
| 6.2 relative characters | one-dim realization; f_v=1_K/vol(K), unit K-fixed x | J_σ(f)=σ(f)|P(e)|²/⟨e,e⟩; σ_v(f_v)=T_{x,x}, J=∫B(σ(t)x,x)dt=C_vα_v(x,x); dg×c scales 1_K/vol(K) by 1 | holds | none |
| 6.2a purely polynomial part; η_{G_R} | 5+Te^T; 5+T; n=1 | parts 5 (no limit as T→∞); 5+T not constant, excluded; η(det g₁)²η(det g₂)=η(det g₂) | holds | none |
| 6.3a(i) iff with vanishing clause | f′=f′₁+f′₂, (f′₂,0) matching on G_h, real place ℂ/ℝ, h′≠h | Lemma 4.9 ⇒ I_{BC(σ)}(f′₂)=κJ_σ(0)=0 for every distinguished tempered σ of G_h; character identity holds for (f′,f_h); O(γ,f′)=O(γ,f′₂)≠0 on a G_{h′}-orbit | false direction | R01 |
| 6.3a(ii) scalar action | μ′ on BC(σ) by 3, μ_h on σ by 3; by 2 | 3κJ_σ=3I persists; 2κJ_σ=3I fails when I≠0 | holds | none |
| 6.3a(iii) compatible multipliers | μ′(ψ′)=2, μ_h(ψ_h)=3, one form | μ̃′(ψ′)=μ′(ψ′)²·cb_h(μ_h²)(ψ′)=4·9=36 (bc_h∘cb_h=id, ψ′=bc(ψ_h)); μ̃_h(ψ_h)=μ̃′(bc ψ_h)=36; at χ: 1·1=1 | holds | none |
| 7.3 constituent coefficient | counts (1,1), (2,1); f=0 | |S_Π|⁻¹=1/4, 1/8; zero vector excluded before the Petersson quotient | holds | none |
| Conventions: period covariance and split rank one | ν(h)=i; E=F×F rank 1 | P(R(h)f)=iP(f), weighting by ν gives −i; U(h)=F× (GL₂ would be F-dimension) | holds | none |
| 3.1 epsilon character at z_φ | ℂ/ℝ, φ_V=χ₁⊕χ₋₁, φ_W=1 | ε(χ₁)ε(χ₁^∨)=χ₁(−1)=−1=χ_W(z) | holds | none |
| r1 rows (1.1, 1.2, 2.1–2.6, 3.6–3.8, 3.10–3.11, 4.1–4.3, 5.5, 6.4–6.5, 7.1–7.2, 7.4) | as in the first review | as computed there | hold | none |
| Headline statability | each group of README line 201 | no carrier at the pins; docstring names each | docstring correct | none |

**Supplier-order audit.** Every `*Needs:*` line and supplier contract names a roadmap in the brief's earlier list or on main (AutomorphicSpectralTheoryPartII is never cited; the multiplier request is the declared gap on AutomorphicSpectralTheory), the dependency check reports 0 problems, and no supplier cites this roadmap back (AutomorphicSpectralTheoryPartII and TwistedAutomorphicDescents cite it as later consumers).

**Settled findings.** The board's repair reports mark one finding `not actionable in this package` (F04: successor scope and ownership of Part II); I do not re-raise it.

## Not verifiable

- xue-real (3.12) and (3.14), p. 1010: the epsilon-factor conjugation convention cannot be read from the cached extraction (symbol font lost); unchanged from the previous reviews.
- xue-bessel: waived in the manifest; cited by locator only.
- bpcz line 155, the definition of L(s,σ): the extraction drops the fraction bar, so the position of L(s+1/2,σ,Ad) in the quotient was checked by the consistency of the two §5.3 numerical Checks (C=3 and C=1 both require it in the denominator), not by rendering that page.

## Source issues

- **Misprint** in bpcz at (7.1.2.1), p. 71 (line 3792–3793; confirmed on the rendered page): the source says the datum is H-generic when π_{n,i} ≠ π_{n+1,j}, "or equivalently" when L(s,π_{n,i}×π_{n+1,j}) is entire; it should compare π_{n+1,j} with the contragredient of π_{n,i}, since the Rankin–Selberg L-function of two cuspidal representations has a pole exactly when one is the contragredient of the other; affects nothing (the README states the contragredient form).
