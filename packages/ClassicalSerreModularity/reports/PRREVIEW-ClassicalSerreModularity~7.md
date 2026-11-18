# Review of ClassicalSerreModularity (pull request #1020 at 1123d34)

**Verdict:** needs changes

**Summary.** Changes are needed, for three findings, all about ownership; no stated result was found false. The three findings of the previous review are repaired (the Skinner–Wiles statements now agree with the source, and the twist-two vanishing has a complete route), but that vanishing is now a target of a roadmap on main, and two other targets (the nearly ordinary Hecke algebras, and soluble extensions with prescribed completions) are each planned a second time in a later open roadmap, the second in greater generality. There are five small corrections and two format notes, none blocking; four points are left for the human reviewers.

## R01 (P2) — The twist-two vanishing is a target of a roadmap on main, which this roadmap claims to own and proves again

Two roadmaps would prove one statement, and the one on main comes first. `R33.1/twist-two-vanishing` (README line 614) proves `H²(G_{L,S}, (E/𝒪)(2)) = 0` for every number field `L` and odd `p`, and "Owned here" (line 667) says "R33.1 owns this vanishing at twist two".

AnabelianGeometryAndNonabelianChabauty is on main. Its §7.0 (its README, line 8443) proves for odd `p`, every number field `F` and `k ≥ 2` that "After inverting p the degree-one map is an isomorphism and degree two vanishes", that is `H²(G_{F,T₀}, ℚ_p(k)) = 0` for `T₀` the places above `p`; its "Rational Tate change of ramification" in the same section makes inflation to every finite `T ⊇ T₀` an isomorphism in degrees one and two. At `k = 2` this is the statement here: from `0 → 𝒪(2) → E(2) → (E/𝒪)(2) → 0` and `H³(G_{L,S}, 𝒪(2)) = 0` (`cd_p G_{L,S} ≤ 2`, `p` odd), `H²(G_{L,S}, E(2))` maps onto `H²(G_{L,S}, (E/𝒪)(2))`, and `H²(G_{L,S}, E(2)) = H²(G_{L,S}, ℚ_p(2)) ⊗ E = 0`. That roadmap does not cite this one, so citing it creates no cycle.

Smallest change: cite AnabelianGeometryAndNonabelianChabauty §7.0 for the rational vanishing at `k = 2` and every finite `S`; keep here only the two-line passage to `(E/𝒪)(2)` with ArithmeticGaloisDuality §R02.4.4, and the Check; replace the ownership sentence of line 667 and the table row of line 689 by the deferral. The route through ArithmeticKTheory §§3.4 and 6.1 is sound, but it is a second proof of a target main already has.

## R02 (P2) — Hida's nearly ordinary Hecke algebra of the definite quaternionic tower is planned here and, with the same four theorems, in PadicFamilies

An implementer would build the same object twice, with two notations, and the consumer that uses both could not tell which statement is the reference. `I.1/nearly-ordinary-hecke-algebras` and `I.1/ordinary-control-and-weight-change` (README lines 306–310) construct `T^{n.o.}(U)` over `Λ_𝒪` for `p` odd, `F` totally real of even degree and `D` ramified exactly at infinity, and prove [SW99] Proposition 3.3, Corollary 3.4, Proposition 3.7 and Lemma 3.8.

The open roadmap PadicFamilies (pull request #1019, the next roadmap in the merge order) has, in `TauCetiRoadmap/PadicFamilies/README.md`: §5.3 (line 2596), the same algebra `T_∞(U, 𝒪)` over `Λ′_𝒪` under the same hypotheses; §5.6 (line 2652), freeness of the towers under the free-action hypothesis, "Skinner–Wiles Proposition 3.3"; §5.7 (line 2677), finite and torsion-free, Corollary 3.4; §5.8 (line 2691), the arithmetic specialisation, Proposition 3.7; §5.9 (line 2715), density of weight-two primes, Lemma 3.8. Neither README names the other, and OrdinaryAutomorphicFormsAndModularityLifting cites both (PadicFamilies §5.2 and `I.1/nearly-ordinary-hecke-algebras`).

This roadmap is the earlier of the two and already lists these targets under "Owned here". Smallest change: one sentence under "Consumers and boundaries" saying that PadicFamilies §§5.1 and 5.3–5.9 are these targets, with the dictionary `T^{n.o.}(U) = T_∞(U, 𝒪)` and `Λ_𝒪 = Λ′_𝒪`, so that the later roadmap cites them; what only this roadmap has (the pseudo-representation into `T_𝔪`, the permissible maximal ideals) can be marked as such. If the author prefers PadicFamilies as owner, these two targets leave this roadmap and the order of the two changes; that is the author's choice.

## R03 (P2) — `I.0/soluble-totally-real-base-change` is the totally real case of a lemma that a later roadmap states in general, with the same proof

The roadmap states less than its own route proves, and the general statement is then planned again downstream. The target (README line 268) takes `K` totally real, prescriptions at finite places only, and a further split set `S′`.

Clozel–Harris–Taylor's Lemma 4.1.2 (`cht` line 5723, printed p. 116) is: `F` any number field, `D/F` finite Galois, `S` any finite set of places, `E′_v/F_v` finite Galois; then a finite soluble Galois `E/F`, linearly disjoint from `D`, has `E_w/F_v ≅ E′_v/F_v` for every `w | v ∈ S`. The target here is the case `F` totally real, `E′_v = ℝ` at the real places and `E′_v = F_v` on `S′`; its Grunwald–Wang induction is the proof of the general lemma. GL2ModularityLifting §1.7 (its README, lines 240–242) states the general lemma, says that this target "states the totally real case of this lemma", proves it by the same induction, and declares it in Lean as `cht_soluble_prescribed_completions` (its `Suggested.lean`, line 88), which also shows the statement is expressible at the pins.

Smallest change: state the target for an arbitrary number field and a finite set of places, archimedean ones included (`ℝ` or `ℂ` at a real place), and record the totally real form with `S′` as its corollary; cite the lemma above. GL2ModularityLifting §1.7 then cites this target. The module docstring of `Suggested.lean` should either state the lemma or name what it lacks; at present it is silent on it.

## C01 — The module docstring still does not account for the two Skinner–Wiles theorems

The Summary (README line 7) names "Skinner and Wiles's theorems" among the results; the docstring's list of headlines not statable at the pins (Suggested.lean, lines 14–34) has no entry for I.1. Add the entry with the carrier each lacks (a characteristic-zero attachment of a `p`-adic representation of `G_ℚ` to a newform, and a reduction of `ρ` for `ρ̄^ss = 1 ⊕ χ`), or state the residually reducible theorem over `ℚ` if the author finds it expressible with `G_ℚ`, inertia at `p` and `TauCeti.localCyclotomicCharacter`; I did not write a statement, so I do not claim it is.

## C02 — "Owned here" lists Khare–Wintenberger's Lemmas 6.1 and 6.2, which the target hands to other roadmaps

Line 666 lists as owned "Lemmas 6.1 and 6.2 (solvable dyadic images are dihedral; dihedral modularity at the optimal weight and level; the weights of bad-dihedral representations)". The target (line 571) says "each is proved by its owner", and Lemma 6.2(ii) is AlgebraicModularFormsAndSerreWeights §4.14 on main (its README, line 1198: `k = (p+1)/2` or `(p+3)/2`). Say in line 666 that R27.1 collects these statements from their owners.

## C03 — "How to read the build" says R33.1 uses only I.0 from the other layers

Line 21: "R33.1 uses I.0 for its globalisation and is otherwise independent of the other layers." The globalisation target needs "`I.2/potentially-barsotti-tate-lifting` at the auxiliary odd prime" (line 608), and the layer's Dependencies paragraph (line 628) omits it as well. Add I.2 in both places.

## C04 — The description's summary still states the twist-two vanishing for a totally real field

The summary block says "the vanishing of the second Galois cohomology of a totally real field twisted by the square of the cyclotomic character". The head states it for every number field and odd `p` (README lines 9 and 614), as a later paragraph of the same description says. Text that would be right: "for odd `p`, the vanishing of the second Galois cohomology of a number field twisted by the square of the `p`-adic cyclotomic character"; after R01 it would also say where that vanishing is proved.

## C05 — [SW01] Lemma 2.2 does not assume the inducing field real; it uses a bound that is false for a CM field

Line 337 says the printed proof "assumes the inducing field real". The source states no such assumption: before the lemma it bounds by `d/2`, citing Waldschmidt, the `ℤ_p`-rank `δ` of the part of `Gal(L′_Σ/F′)` on which `Gal(F′/F)` acts by `−1` (`sw01` lines 233–246). For `F = ℚ` and `F′` imaginary quadratic that part contains the anticyclotomic `ℤ_p`-extension, so `δ = 1 > 1/2`; for `F′` real quadratic `δ = 0`. Saying which bound fails, and where, tells the implementer what the corrected argument must replace.

## N01 — Four statements of I.2 and I.3 have no `*Needs:*` line of their own

The paragraph on the minimal ring over `ℚ` (line 366) and the three targets of I.3 (lines 431, 447, 463) rely on the layer's Dependencies paragraph alone, so an implementer cannot see which suppliers each one needs.

## N02 — "Input I.2" and "Input I.3" name subsections that are called I.2 and I.3 everywhere else

Lines 21, 487, 496, 510, 551, 586, 647 and 650; one name would do.

## Questions for the author

- `I.2/same-weight-crystalline-lifting` gives the range `2 ≤ h ≤ 2p−1` and the hypothesis `End_{𝔽[G_{ℚ_p}]}(ρ̄) = 𝔽` from [Ki], Proposition (3.13) and Theorem (3.14). The author's file is a DVI that could not be read: are these the hypotheses of (3.14) as printed, and is the seed there required to have level prime to `p`?

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| Moret-Bailly's theorem (I.0) | `mb` lines 36–49, 54, 82–88; `𝔸¹`, `S = {∞, 2}`; Galois-closure and disjointness refinements | Déf. 1.2 p. 181, Th. 1.3, Rem. 1.5 p. 182; `2/3 ∈ (0,1)`, `v₂ = 1`; `1/2`: `v₂ = −1`; normal closure of Frobenius classes | agrees |
| Controlled residual potential modularity | `kw2` lines 2463–2487, 2606–2639 | Thm 6.1 pp. 53–54, (i), (ii), (iii)(a)–(d) match; proof p. 57 treats `ℓ_i ≠ 2, p` only | agrees; source gap recorded |
| Soluble base change (I.0) | `K = ℚ`, `E₂` unramified quadratic, `S′ = {11}`; degree 8; `cht` line 5723 | `5 ≡ 5 (8)`: 2 inert; `5 ≡ 4² (11)`; `16` an eighth power away from `ℚ₂`; lemma holds for any number field | true; R03 |
| Residually reducible ordinary lifting | `sw99` lines 93–98, 2468–2479 | Intro theorem p. 6: `ρ̄^ss = 1 ⊕ χ`, `χ|D_p ≠ 1`, `det = ψε^{k−1}`; Theorem A p. 74 | agrees |
| Pseudo-deformation rings and pro-modularity | `sw99` lines 199–227, 529–535, 1995–2000, 2018–2024, 2076, 2161, 2430–2442, 4076 | datum `(𝒪, Σ, c, ℳ)` p. 9; primes of `R_𝒟`; Props 4.1, 4.2, 8.4; Main Theorem (i)–(iv) p. 73 | agrees; earlier R01 repaired |
| Nearly ordinary Hecke algebras | `sw99` lines 1091, 1110, 1157, 1178; `U_p = 4, 3` on `ℤ₃` | `4^{n!} mod 9 = 4, 7, 1`; `v₃(4^m − 1) = 1 + v₃(m)`; `τ(11) = 534612 ≡ 1 (11)` | agrees; R02 |
| Residually irreducible ordinary lifting | `sw01` lines 73–85, 233–246, 667–672, 708–715; `F = ℚ`, `F′` imaginary quadratic | Thms 5.1–5.2 pp. 203–204; minus rank `δ = 1 > d/2 = 1/2`; real quadratic `δ = 0` | locators agree; C05 |
| Ordinary exact level | `kh` lines 919–922 | Lemma 5.4 p. 22: unramified outside `p`, crystalline `(k−1, 0)`, `k` even `≤ p+1`, `ρ̄` modular; cited as the level-one instance | agrees |
| Global finiteness, full range | `kw2` lines 2140–2149, 3464–3496, 4125–4142, 4200–4205; `x³−2` over `𝔽₅` | Thm 10.1 p. 90; (A), (B), (C) of §8.3.3; Cor. 4.7 p. 45; disc `−108`, unramified at 5, weight `p = 5` | agrees |
| Crystalline lifting, matching-weight seed | `kw2` lines 4206–4215 | §10.2 p. 92: non-ordinary weight `p+1`, residual weight 2 (Berger–Li–Zhu), Hasse invariant | [Ki] not read |
| Classical modularity lifting | `kw1` lines 270–277; `kw2` lines 4075–4081, 4219–4229 | Thm 4.1 p. 7: `p = 2` branches; `p > 2` crystalline `2 ≤ k ≤ p+1` or weight two; Thm 9.7 p. 89 | agrees |
| Potentially Barsotti–Tate lifting and (H) | `kiff` lines 3964–3983, 4068–4099; `kw1` lines 782–787 | (3.5.5) p. 1170 with the `PGL₂(𝔽₅)` clause; (3.5.8) p. 1173 over `ℚ(√p*)`; (H) p. 18 | agrees |
| The four prescribed lifts | `kw1` lines 366–429; `(p,q) = (2,5), (2,7)` | Thm 5.1 pp. 9–10; `0 < i ≤ q−2`, `i` even at `p = 2`; `v₂(8) = 3`, `v₂(6) = 1` excluded | agrees |
| Residual links and modularity transfer | `dp` lines 297–315; `kw1` lines 768–779 | Remark 4 p. 7: one modular member gives all; linked systems with Thm 4.1 | agrees |
| Almost strictly compatible systems (§2.3) | `kw1` lines 316–326; `dp` lines 297–301 | exceptions: reducible `ρ̄_λ` and (`ℓ = 2` or ramified parameter); same in both sources | agrees |
| Böckle's presentation | `bo` lines 9–11, 37–46, 61–68, 77–84, 121–136, 140–156, 170–200 | Thm 1 p. 1, Prop. 1 p. 2 (oddness once), Lemma 1, Cor. 1 p. 4, Lemma 2 p. 5; Carayol in proof | agrees |
| Good-dihedral definition and Lemma 6.3 | `kw1` lines 174–184, 472–506; `q = 41, t = 7`; `q = 241, p = 7` | `7 ∣ 42`, `7 > 5`, `41 ≡ 1 (8)`; `241 ≡ 1` mod 8, 3, 5, `≡ 3 (7)` | agrees |
| Lemma 8.2, and `lemma_8_2` in Lean | `kw1` lines 739–766; `p = 5`, `q = 409`; `p = 13`, `406561`; trivial `ρ` | `409` prime, `≡ 1, 1, 4` mod 8, 3, 5; `406561` prime, `≡ 1` mod 8, 3, 5, 7, 11, `≡ 12 (13)`; `ρ(c)` non-scalar | true; no one-tactic proof |
| Rank-two irreducibility | `blggt` lines 1473–1475, 3787–3792; `ψ₁ ⊞ ψ₂` | §2.1 p. 32; Thm 5.5.2 p. 81: density-one set under extreme regularity; isobaric sum not cuspidal | agrees |
| Globalization and unitary tower | `tua` lines 433–449; `tub` lines 965–1000 | §3 p. 9: CM field, `T = S_p ∪ {v₁}`; Def. 4.3.2 p. 20, Lemma 4.3.3 p. 21: even degree, seed | agrees |
| Twist-two vanishing | `pan` lines 5337–5350; `S = {3, ∞}`, `{3, 7, ∞}` over `ℚ` | `K₂(ℤ[1/3])` of order 4, 3-part 0; `(𝔽₇^×){3} = ℤ/3`, killed in the limit; `H³ = 0` | true; earlier R02 repaired; R01 |
| Attachment Checks (§2.2) | level 11 at `p = 3, 7`; `Δ` at 691; level 23 at 11 | `−2 ≡ 1 (3)`, det 2; `2⁻¹ = 4 (7)`; `2049 ≡ 667 ≡ −24`, `2048 ≡ 666`; roots 3, 7 of `x²+x−1` | Checks true |
| S-type Checks | `X³−4X+1`; `GL₂(𝔽₂)` | disc `256 − 27 = 229 > 0`, nonsquare; conjugation trivial, `det = 1 ≠ −1` in `𝔽₅`, `= −1` in `𝔽₂` | Checks true |

- Source locators checked against the text: 52, in 16 sources (`mb`, `kw1`, `kw2`, `kwann` by its citing passages only, `kh`, `sw99`, `sw01`, `bo`, `kiff`, `tua`, `tub`, `pan`, `dp`, `blggt`, `ri`, `cht`); pages agree with the numbering the README names.
- Library declarations resolved at the pin: `IsArithFrobAt` (`Mathlib/RingTheory/Frobenius.lean` 184), `HasDirichletDensity` (`Mathlib/NumberTheory/NumberField/DirichletDensity.lean` 81), `ComplexEmbedding.IsConj` (`…/InfinitePlace/Embeddings.lean` 259), `Nat.maxPrimeFac` and four lemmas (`Mathlib/Data/Nat/MaxPrimeFac.lean` 40–109), `Matrix.GeneralLinearGroup.map` (`…/GeneralLinearGroup/Defs.lean` 188), `Representation.invariants`, `Representation.IsIrreducible`, the three Chebotarev declarations (`TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean` 51, 74), `TauCeti.localCyclotomicCharacter` (33, 41), `HeckeRing.GL2.Newform` (104). No pinned declaration states `lemma_8_2`; Mathlib's `Algebra.IsUnramifiedAt` is a different notion from `IsUnramifiedAt` here.
- Cross-roadmap citations resolved: the section ids of the suppliers on main (among them ArithmeticKTheory §§3.4, 6.1; SelmerIwasawaCohomology §3.15; ArithmeticGaloisDuality §§R02.4.4, R02.4.5b, R02.4.6; SmallRamificationAndAbelianVarietyBaseCases §§5.0b–5.0e; LocalGaloisDeformationRings §§0.3, F.2.11, 6.2, 8.17, 8.19; GlobalGaloisDeformations §§3.7, 6.6–6.8, Layer G7; AlgebraicModularFormsAndSerreWeights §§3.1, 5.10, 7.5 and its R15 identifiers at line 17) and of AutomorphicGaloisRepresentations at its open head (§§1.5, 3.10–3.14, 4.4, 4.7, 4.10–4.12, 6.8–6.12, 7.1, 7.3).
- Dependency check: `depcheck: 200 roadmaps, 2204 edges, 0 problem(s)`; no UPWARD or CYCLE line. The automatic checks all passed at this head. Nothing in the pull request lies outside the folder.
- Elaboration: `Suggested.lean` gives one `sorry` warning (line 89) and nothing else. The elaborated types of the eight declarations were compared with the README; none lost a binder. `lemma_8_2` was tried with `simp`, `rfl`, `infer_instance`, `trivial`, `aesop`, `simp` with the two definitions unfolded and `exact ⟨_, one_pos, by simp⟩`; none closes it.
- Earlier review (at 4a4f50e): R01 repaired ("A prime `𝔮` of `R_𝒟` is *pro-modular* when the map `R^{ps}_𝒟 → R_𝒟/𝔮` … factors", line 322, with the Main Theorem as printed); R02 repaired (the route of line 614 through SelmerIwasawaCohomology §3.15 and ArithmeticKTheory §§3.4, 6.1); R03 repaired as asked ("R33.1 owns this vanishing at twist two"), and superseded by R01 here because the other roadmap has since reached main. C01–C06, C08, C09, N01, N02 repaired; C07 partly (C01 here).
- Pull-request text: the title and prose agree with the head (a new roadmap; one theorem and seven definitions in Lean; the former layer ids; ArithmeticKTheory and SelmerIwasawaCohomology named as suppliers) except for C04.
- Wording: 24 passages set beside their sources; the longest shared runs are lists of hypotheses that admit one wording (three to four words).

Overlap check: read SerreModularityByCompatibleSystems, GL2ModularityLifting, PotentialModularityAndCompatibleSystems, OrdinaryAutomorphicFormsAndModularityLifting, ModularityAndLanglandsExtensionsPartII, AlgebraicModularFormsAndSerreWeights, SerreWeightAndLevelOptimisation, GlobalGaloisDeformations, and beyond the lists PadicFamilies and AnabelianGeometryAndNonabelianChabauty. Shared objects: the twist-two vanishing (owner AnabelianGeometryAndNonabelianChabauty §7.0, on main; R01); the nearly ordinary Hecke algebra and its four theorems (owner this roadmap, also in PadicFamilies §§5.1–5.9; R02); soluble extensions with prescribed completions (owner this roadmap, general form in GL2ModularityLifting §1.7; R03); Khare–Wintenberger's Lemma 6.2(ii) (owner AlgebraicModularFormsAndSerreWeights §4.14; C02). Moret-Bailly's theorem, the lifting theorems of I.1–I.2, the prescribed lifts and Lemma 8.2 are cited from this roadmap by the others; PotentialModularityAndCompatibleSystems Layer 2 cites `I.0/moret-bailly-split-points` for the number-field theorem.

Source independence: 24 passages compared with 16 sources, none shared; largest share `kw2`, 19 of about 110 citations; contents compared with `kw2` (its ten sections against I.0–I.3, R26.1, R27.1, R33.1): independent, only I.0 ↔ §6 and parts of I.2 ↔ §§9–10 correspond, in a different order; [Ki] could not be read.

Research link: Layer I holds the theorems of Moret-Bailly (1989), Skinner–Wiles (1999, 2001), Kisin (2009) and Khare–Wintenberger (2009) from which Khare–Wintenberger and Dieulefait–Pacetti (2022) prove Serre's conjecture; R33.1 serves Tung (2018, 2019) and Pan (2022). Rests on the README's summary and the sources read.

## Not verifiable

- [Ki], Proposition (3.13) and Theorem (3.14): the author's file is a DVI the sources service does not read; a search by title found no other legal copy.
- [Ki2]: behind a paywall; cited by locator only, as the README says.
- Skinner's correction to [SW01] for the imaginary-quadratic dihedral case: unpublished, not in the References.
- [Di] §3, [Fu] Theorem 0.2, [Ta] Theorem 3.2 and [Wa]: cited inside routes as the primary sources cite them; not opened.
- [KW-Ann] Theorem 2.1, Theorem 3.3 and Proposition 3.8: the text was fetched but these three locators were checked only through [KW-II]'s citations of them.
- Lichtenbaum's Proposition 9.6: not in the References; not fetched.
- The description's sentence on which AI tools assisted.

Automatic checks set aside as false positives: none; every check passed. A resolver's two leads (AlgebraicModularFormsAndSerreWeights R15.3 and R15.4 "found nowhere") resolve through that roadmap's identifier sentence at its line 17.

## Source issues

- **Error** in sw01 at the paragraph before Lemma 2.2 and Lemma 2.2, printed p. 191: the source says the rank of the minus part of the Galois group of the maximal abelian pro-`p` extension of the quadratic field is at most half the degree; it should be restricted to quadratic fields that are not CM (over the rationals an imaginary quadratic field gives rank one); affects a stated result.
- **Gap** in kw2 at Theorem 6.1(iii)(b) and its proof, printed pp. 54 and 57: the statement allows any primes different from the residue characteristic, the proof treats those also different from two; it should cover the prime two for odd residue characteristic (prime-degree steps avoid the exceptional case); affects a stated result.
- **Gap** in pan at proof of Lemma 7.4.15, printed p. 120: the source says the twist-two vanishing for an arbitrary finite set of places follows from the case of the places above the prime, without argument; it should give the localisation step; affects the proof.
- **Misprint** in ri at proof of Proposition 2.2, printed p. 280: the source says the cyclic inertia image lies in the centre of the dihedral group and takes the quadratic field of that centre; it should be the cyclic subgroup of index two; affects nothing.

## For the human reviewers

- Scope: the imaginary-quadratic dihedral branch of `I.1/residually-irreducible-ordinary-lifting` (README lines 337 and 650) rests on Skinner's unpublished correction to [SW01]; Khare–Wintenberger cite it (`kw1` lines 688–689, 1019); the README makes the corrected argument a proof target with no reference.
- Licence: README lines 43 and 355 say the trace/determinant and classifying-map interfaces follow the Imperial College London FLT project; `Suggested.lean` was not compared with that repository.
- Licence: [KW-Ann] and [KiFF] were read from the Annals' own archive, [Ri] from the publisher's archive, [Bö] from a research group's site, [KW-I] and [KW-II] from an author's page; these hosts are in no configured licence class.
- Not tested: [Ki] (three citations, two targets) could not be read, so the hypotheses of `I.2/same-weight-crystalline-lifting` were not compared with it.
