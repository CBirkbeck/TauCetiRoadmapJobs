# GATE-PadicHodgeRegulators~1: answers to the review of head 1a3728e

One review (CBirkbeck, AI-assisted, 2026-10-25T16:56Z) with ten numbered findings. Finding 1 makes three separable requests (normalization of Chern classes against the Chern character, a Suslin–de Jeu comparison, and removal of the residual sign in §6.2), so the points are H01–H12. The quoted review is truncated inside its "Checked and found sound" list; nothing after the ten findings asks for a change. All line numbers below are of `TauCetiRoadmap/PadicHodgeRegulators/README.md` at the repair commit 6961d55a, unless marked "old" (head 1a3728e).

## H01 (CBirkbeck) — applied

§4.1 (line 909; old 907) defined reg_syn := η∘`c^syn_{n,2n−1}` with ordinary Chern classes, while the imported ColemanIntegration §L3.Fb.2 map and its coefficient (−1)ⁿ(n−1)! are the multiplicative Chern character (BdJ2003 line 2514–2519, Appendix A, and line 1108, after Lemma 4.7). Now reg_syn := η∘`ch^syn_{n,2n−1}` and the Chern-class map is the separate reg^c_syn = (−1)ⁿ⁻¹(n−1)!·reg_syn (Conventions line 27, §4.1 line 911): the raw coefficients are +1, −2 (character) and −1, −4 (Chern class) at n = 2, 3 (§4.4 line 967 and its Check), the étale side has the matching r^(et,ch)_n (line 227), and §7.3 (line 1434) is stated for `ch^syn_{2,2}`, with c₂{f,g} giving −p_D[ε(f,g)] recorded as a Check.

## H02 (CBirkbeck) — applied differently

New §4.7 (line 1009) states s_F(dJ_F(ψ_F b)) = c₂·b on B(F)⊗ℚ with one rational c₂ ≠ 0 for all number fields, kept separate from the Chern factor −1 and transported to completed roots by §5.7 (line 1168: D_L := −c₂·λ_L, replacing "multiplied by the universal sign ε∈{±1}"). The value of c₂ is not pinned, because de Jeu (Compositio 96, 1995, printed p. 240, the diagram defining ψ₂) gives the comparison only "up to a non zero factor" and no supplier fixes it; §4.7 instead carries the calibration "c₂ is a unit at every p > 3" as part of the target, proves v_p(c₂) ≤ 0 from §§1.10, 5.5, and records that v_p(c₂) ≥ 0 is equivalent to the root generation of §5.9 (GSWZ Theorem 9).

## H03 (CBirkbeck) — applied

§6.2 (line 1260; old 1215) read "D_{F,p}(ξ) = ±Σ_i n_i D^{dil}…, the sign is the pinned sign of §5.7" and now reads "= Σ_i n_i D^{dil}…" with no residual sign. The Chern factor and c₂ are absorbed once in D_L, consistently with the plus-sign identities of §§5.7, 6.1 and 6.6, whose scalar dictionary (§6.6 (v), line 1320) now reads D_p = −c₂·log_BK∘r^et_2 = c₂·reg_syn.

## H04 (CBirkbeck) — applied

§8.12 (line 1816; old 1770) now uses the inverse external twist Tw_(χ^(−m)) with the denominator ℓ_(−1)⋯ℓ_(−m) unchanged, and a new paragraph (line 1818) derives it: z⊗e_m is Tw_(χ^m)-semilinear, Tw_(−m)(ℓ_i) = ℓ_(i−m) turns λ_m into the denominator, and with Tw_(χ^m) the map would be Tw_(χ^(2m))-semilinear. New Checks pin the direction by evaluation at χʲ and use the nonzero f₆ value −70/3·d₁ of §8.21.

## H05 (CBirkbeck) — applied

§9.33 (line 2530; old 2473) keeps Rodrigues Jacinto's formula (3) but labels its point η⁻¹κ (charts centred at η⁻¹), adds an "Overlap identity" target (line 2535) to be proved before gluing, and §9.34 (line 2557) states the interpolation at η⁻¹xʲ; §9.31 (line 2490) records, with RJ2018 Remark I.18 (pp. 915–916), that balls of one conductor overlap. The review's p = 5 example is a Check (line 2553): both charts now give θ(6) − 1 = η(6)⁻¹ζ₅⁻¹ − 1, whereas the printed labelling gives η(6)⁻¹ζ₅ − 1 and η(6)⁻¹ζ₅⁻¹ − 1 at one point.

## H06 (CBirkbeck) — applied

§9.35 (line 2570; old 2506) no longer asserts that Λ_{D,z} extends to all of weight space; it states Λ_{D,z}(θ) = φ⁻ⁿ(𝔐_z(θ)) on conductor-pⁿ points, with 𝔐_z the global Amice transform of (1−φ)z (the §8.8 regulator on the Layer 8 range, and RJ Proposition I.28, p. 920, in an eigenbasis). The review's rank-one φ = 2 example is the first Check (line 2592): Λ is 2⁻ⁿd on conductor-5ⁿ balls while 𝔐_z = d, a counterexample to RJ Corollary I.29 as printed.

## H07 (CBirkbeck) — applied

§4.3 (line 952; old 944) and §4.4 (line 967; old 958) now draw the Bloch–Kato conclusion only "when K/ℚ_p is finite", and assert only the syntomic identity for an infinite complete discretely valued K. The completion of ℚ_p^ur is a new negative Check in §4.3.

## H08 (CBirkbeck) — applied

Scope (line 7) now makes this roadmap the single owner of §4.7, the completed root classes, the normalized local regulator with naturality and transfer, the lattice isomorphism, root generation and presentations (§§5.6–5.9), and lists HabiroNumberFields §§3.0a–3.0b and HabiroNahmSeries (supplier contract, §6.3) as consumers there, in Layer 6 Dependencies and in Downstream consumers (line 2622); HabiroNumberFields is at merge-order position 215, after this roadmap (209). The matching edit in HabiroNumberFields §§3.0a–3.0b, which at head 8617991 still constructs D_L, belongs to that roadmap and was outside this job.

## H09 (CBirkbeck) — applied

The pre-Bloch/Bloch carriers, taken from ColemanIntegration §L2.Fb at old lines 7, 59, 821, 899 and in the §5.6 Check, now come from K3BlochGroups Layer 3 (§§3.1, 3.3–3.6), which declares that ownership and the supply direction K3BlochGroups → ColemanIntegration; ColemanIntegration §L2.Fb supplies only the p-adic evaluation and branch descent, transported through K3BlochGroups §§3.4–3.5 (Scope line 7, supplier contract line 59, §3.3 line 823). The duplicate construction inside ColemanIntegration §L2.Fb at head ae078af is that roadmap's to remove.

## H10 (CBirkbeck) — applied

§8.22 (line 1987; old 1935) now fixes ω_A as the Néron differential of a minimal Weierstrass model (Rubin2000 line 2170, III §5.2, printed p. 47, before Proposition 5.14 on p. 52), and its rescaling bullet says the map lands in c⁻¹Λ, which is Λ exactly when c ∈ ℤ_pˣ (new 5ᴺ-versus-2 Check). §9.36 (line 2599) consumes the Néron-normalized map and notes that augmentation containment survives rescaling while the integral codomain does not.

## H11 (CBirkbeck) — applied

The §3.3 Check (line 843; old 839) "blochDilog vanishes on the subgroup generated by [x] + [x⁻¹]" now attributes the vanishing to preBlochDilog and adds the witness ∂⟨2⟩ = 2⊗(−2) over ℚ, detected by the pairing v₂(u)s(v) + s(u)v₂(v) mod 2 with value 1, so ⟨2⟩ ∉ B(ℚ) (K3BlochGroups §3.6). The §3.3 text records the inversion law D(x⁻¹) = −D(x) behind the vanishing and that 2⟨x⟩ = 0, so the subgroup disappears with odd-primary coefficients.

## H12 (CBirkbeck) — applied

The §6.2 Check (line 1271; old 1226) "The empty presentation gives ξ=0 and regulator 0" now reads "zero image of ξ in B(F)⊗ℚ and regulator 0; it does not force ξ=0", with the witness {−1,−1,−1} ∈ K₃(ℚ), nonzero of order two (K3BlochGroups §2.3).

## Build

`lake build TauCetiRoadmap.PadicHodgeRegulators.Suggested`: `Build completed successfully (8976 jobs).` The only messages are three `declaration uses sorry` warnings, at `Suggested.lean` lines 42, 80 and 101 (the three headline theorems). `Suggested.lean` is unchanged: no review point concerns it, and its docstring's not-statable list still covers the local K₃, Bloch–Kato and de Rham headlines.

Signature check: all seven declarations (`finitePolylog`, `residueDilogValue`, `residueDilogValue_spans`, `evaluationConstraints`, `constraint_basis_and_determinant`, `coordinateImageGenerator`, `evaluationConstraints_coordinate_image`) were put as `#check @…` in one scratch file importing the built module and elaborated once with `lake env lean`. Each elaborated type matches its README statement. Every theorem carries `[Field E] [CommRing R] [Algebra E R] [IsDomain R]` and its explicit evaluation hypotheses; the defs carry only the binders their types mention. Nothing changed.

## Gate

`gate PadicHodgeRegulators: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck (`--movable`): `depcheck: 55 roadmaps, 631 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. The new suppliers BorelRegulators (position 162), K3BlochGroups (109) and ColemanIntegration (150) all precede this roadmap (209).

`roadmaps resolve` reports one lead, "FontaineBPR1994, §2.1: no roadmap FontaineBPR1994". This is a false positive: FontaineBPR1994 is a source id in the §1.10 locator line, not a roadmap, and the line predates this round.

## Ownership, sources and notes

- **Ownership of the new §4.7.** It was checked by object over main and all open roadmap pull requests ("de Jeu", "Suslin", Bloch–Wigner regulator comparisons). ColemanIntegration §L3.Fa.4 has de Jeu's map but no Suslin comparison, and K3BlochGroups has Suslin's map but no de Jeu comparison. EllipticKTheory and MotivicEtaleKTheory mention de Jeu only in unrelated contexts. The ZagierConjecturePolylogarithms design delegates Suslin inputs to K3BlochGroups. Polylogarithms §2.3, which plans a Borel calibration of the Bloch regulator, is later in the merge order (223) and is not cited as a supplier. This roadmap is therefore the owner; it already owns "normalization and comparison of regulators".
- **New source dJ1995.** R. de Jeu, *Zagier's conjecture and wedge complexes in algebraic K-theory*, Compositio Math. 96 (1995), 197–247, was fetched through the sources service from Numdam (open repository). It is cited in §4.7 for Proposition 4.1 (printed p. 235), Remark 5.2 (pp. 238–239) and §5's construction of ψ₂ (p. 240), and added to README References as **dJ1995**. This job may not edit `sources.toml`, so the manifest entry (id `dJ1995`, numdam URL, locator_scheme theorem, cited_for §4.7) still has to be recorded by the worker. `needs-references.toml` is empty: a stale entry from a first fetch attempt was removed after the second attempt succeeded.
- **Factor between c and ch.** The README uses Newton's factor cₙ = (−1)ⁿ⁻¹(n−1)!·chₙ on K_m, m ≥ 1, for classes induced by the same universal classes (decomposables vanish there). Besser2000 Definition 7.6 (author p. 24) prints the Chern character with an extra leading minus sign. Tamme2014's remark after Corollary 5.21 uses (−1)ⁿ/(n−1)!, which also involves his comparison with the Huber–Kings normalization. §4.2 now says that formulas imported from Tamme are converted by his printed factor. The magnitude (n−1)!, and hence the reviewer's −2 versus −4 at n = 3, does not depend on this sign.
- **§5.7 bullet narrowed.** The special-unit bullet of §5.7 now covers Bloch elements coming from a number field F ⊂ L. Before, it covered all special-unit presentations over O_L, but the Suslin–de Jeu comparison is proved only for number fields; roots and §6.2 are of this kind.
- **Untrusted text.** The review contained no instruction addressed to this job and nothing suspicious. Its claims were checked against the sources listed above and the supplier roadmaps at the heads given in the brief.

## Adversarial pass on added or changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| cₙ = (−1)ⁿ⁻¹(n−1)!·chₙ on K_m, m ≥ 1 (Conventions, §4.1) | n = 1, 2, 3, 4; m = 0 | factors 1, −1, 2, −6; on K₀ c₂([𝒪(1)]+[𝒪(1)]) = h² ≠ 0 = 2c₂([𝒪(1)]) | holds for m ≥ 1, fails for m = 0 as excluded | Whitney Check kept for m = 0 |
| Raw coefficient, Chern character vs Chern class (§§4.1, 4.4) | n = 2, 3, 4 | (−1)ⁿ(n−1)! = 1, −2, 6; −((n−1)!)² = −1, −4, −36 | product formula verified at each n | Checks at n = 2, 3 |
| Symbol {f,g}: ch₂ vs c₂ (§§4.1, 7.3) | Newton at i = 2 | ch₂{f,g} = ch₁f∪ch₁g; c₂{f,g} = −c₁f∪c₁g | sign −1 | §7.3 Check |
| r^(et,ch)ₙ = ((−1)ⁿ⁻¹/(n−1)!)r^etₙ (étale contract) | n = 1, 2, 3 | Kummer = Kummer; r^(et,ch)₂ = −r^et₂ integral; r^et₃ = 2r^(et,ch)₃ | consistent with §4.2 | Check at n = 3 |
| §4.2 at ℚ₅, ζ = ω(2) | both normalizations | log_BK r^(et,ch)₂ = Li₂(ω(2)) ≡ 25 mod 125; Chern class −Li₂(ω(2)) | valuation 2 both | Check rewritten |
| §4.3–4.4 field hypothesis | K = ℚ₅; K = completion of ℚ₅^ur | ℚ₅ finite, BK log defined; ℚ̂₅^ur residue 𝔽̄₅, [K:ℚ₅] = ∞, outside §1.3 | conclusion restricted | Check added |
| §4.7 rational cocycle ↔ B(F)⊗ℚ | x = 2 over ℚ | ∂[x] = x⊗(1−x) ↦ x∧(1−x) = −(1−x)∧x = −d[x]₂ | signs agree up to −1 | none |
| §4.7 comparison, degenerate fields | F = ℚ; F totally real | B(F)⊗ℚ = 0; identity holds for every c₂ | vacuous, cannot calibrate | Check |
| §4.7 comparison, F = ℚ(√−3) | b = 2[ω], ω⁶ = 1 primitive | 1−ω = ω⁻¹ so d[ω]₂ = 0; 2∂[ω] = 0, so 2[ω] ∈ B(F); P₂(ω) = Cl₂(π/3) ≈ 1.0149 ≠ 0, so 2[ω] ≠ 0 rationally; image 2c₂[ω] | c₂ is determined by one class | Check |
| §4.7 consequence at ℚ(i), p = 5 | b = 4[i], σ_v(i) = ω(2) | 4∂[i] = (i⁴)⊗(1−i) = 0; value 4c₂⁻¹Li₂(ω(2)), valuation 2 − v₅(c₂); Chern-class line negated | consistent with §5.7 | Check |
| §4.7 half-calibration v_p(c₂) ≤ 0 | L unramified, p > 3 | image of K₃(L;ℤ_p) is p²𝒪_L; root values c₂⁻¹Li₂(ζ) lie in it; span of Li₂(ζ) is p²𝒪_L, so c₂⁻¹p²𝒪_L ⊆ p²𝒪_L | v_p(c₂⁻¹) ≥ 0 | stated |
| §4.7 universality in F | F ⊂ F″, F′ ⊂ F″ | naturality of dJ (L3.Fa.4 map_of_extension) and s (K3BlochGroups §4.20); rational restriction injective | c_F = c_F″ = c_F′ when r₂ > 0 | stated as route |
| §4.7 torsion | {−1,−1,−1} ∈ K₃(ℚ) | s = 0, regulator 0, class ≠ 0 of order 2 | invisible to the rational statement | Check |
| §5.7 D_L = −c₂λ_L | L = ℚ₅, ω(2): de Jeu class, Suslin class | λ(dJ) = −Li₂; λ(Suslin) = −c₂⁻¹Li₂; D = Li₂ ≡ 25 mod 125; L = 0: D = 0 | root normalization holds | Checks |
| §5.7 bullet on syntomic regulator | image of K₃(𝒪_L) | D_L = c₂·reg_syn = −c₂·reg^c_syn | consistent with §4.2 | Check rewritten |
| §5.8 two statements | L = ℚ₅; ℚ₂₅×ℚ₅; p = 3; hypothetical p ∣ c₂ | λ onto 25ℤ₅; rank 3; ℤ₃⊕ℤ/3 torsion excluded; c₂p²𝒪_L proper in p²𝒪_L | first statement free of c₂, second needs the calibration | Check added |
| §5.9 index without calibration | v_p(c₂) = −1, [L:ℚ_p] = 1 | D(K₃) = p𝒪_L, roots span D⁻¹(p²𝒪_L), index p = p^(−(−1)·1) | formula p^(−v_p(c₂)[L:ℚ_p]) | stated |
| §6.2 no residual sign | GSWZ cubic ξ at p = 5; ℚ(ζ_m) | D_{F,p}(ξ) = c₂·c₂⁻¹·ΣnᵢD(zᵢ) = ΣnᵢD(zᵢ); D([ζ_m]) = Li₂ | plus sign | ± removed |
| §6.2 empty presentation | ξ = {−1,−1,−1} ∈ K₃(ℚ) | image in B(ℚ)⊗ℚ = 0, D = 0, ξ ≠ 0 | old Check false | Check rewritten |
| §3.3 inversion subgroup | x = 2, x = −1, x = p over ℚ | ∂⟨2⟩ = 2⊗(−2), pairing value 1 ≠ 0; ∂⟨−1⟩ = 2((−1)⊗2) = 0; D⁰(p)+D⁰(1/p) = −½log²(−p)+½log²p = 0 with log(−1) = 0 | vanishing holds on P(K), subgroup not in B(K) | Check rewritten |
| §8.12 twist direction | m = 0, 1, 2; j = 3 | T₋₁(ℓ₀)(χʲ) = j+1 = ℓ₋₁(χʲ); λ₂(χ³) = 6 = Γ*(4)/Γ*(2); T₋₂(ℓ₀) = ℓ₋₂ cancels in m = 1 vs 2; with T₊ₘ, T₂(γ) = χ(γ)⁻²γ ≠ γ | inverse twist correct | Checks added |
| §8.22 differential rescaling | c = 2, c = 5ᴺ at p = 5 | coefficient of valuation 0 times 1/2 stays integral; times 5⁻ᴺ leaves ℤ₅ | codomain needs Néron differential up to units | Check added |
| §9.36 augmentation | split α = 1, p = 5; rescaling c | multiplier (1−1)/(1−1/5) = 0; c·(augmentation ideal) ⊆ augmentation ideal | containment survives rescaling | stated |
| §9.31 overlapping balls | p = 5, ε of conductor 25, ε(6) = ζ₅ | exp(5) ≡ 1+5 ≡ 6 mod 25; v₅(ζ₅−1) = 1/4 > 5^(N(D)−m) for m large | balls of one conductor overlap | Check added |
| §9.33 relabelled charts | trivial D, z = Σ((1+T)^(6·5ʳ)−(1+T)^(5ʳ)) | (1−φ)z = (1+T)⁶−(1+T), ψz = z; chart value η(6)⁻¹κ(6)−1 = θ(6)−1; both charts η(6)⁻¹ζ₅⁻¹−1; printed labelling η(6)⁻¹ζ₅−1 vs η(6)⁻¹ζ₅⁻¹−1 | relabelled formula glues on this example | Check added |
| §9.34 interpolation point | θ = η⁻¹xʲ | integrand ηχ⁻ʲ = θ⁻¹ | consistent with RJ I.27's computation of F(η,χʲ) | restated |
| §9.35 comparison | rank one φ = 2; −1 < v₅(α) < 0; ℚ₅(1); non-crystalline D; z = 0 | A−2φ(A) = 1+T, ψ(A) = 2A, Λ = 2⁻ⁿd vs 𝔐 = d; α⁻ⁿd; φ⁻ⁿd₁ = 5ⁿd₁; D_cris too small; 0 | global extension holds for 𝔐_z, not for Λ | rewritten, Checks |
