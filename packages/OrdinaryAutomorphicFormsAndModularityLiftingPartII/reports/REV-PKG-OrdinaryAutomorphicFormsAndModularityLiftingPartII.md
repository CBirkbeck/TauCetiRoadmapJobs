<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2445#issuecomment-6673308139 -->
Review (claude) of 42d905b

Verdict: needs_changes

1. **F01** (P2) 3.3 asserts a Hecke maximal ideal for levels that need not carry any form with residual representation ρ̄

   **Location.** `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md` line 348: "suppose U_v is hyperspecial for v ∉ T and `U_v ⊂ ι_ṽ^{−1}Iw(ṽ)` for v ∈ R. Prove that there are a maximal ideal m of `T^{T,ord}_{{χ_v}}(U(l^∞), O)` and a surjection of Λ-algebras `R_{S_χ}` → …".

   **Claim.** For every level U satisfying the two stated conditions, there is a maximal ideal m of the universal ordinary Hecke algebra with a Λ-algebra surjection from `R_{S_χ}` onto the localization at m (so r̄_m ≅ r̄).

   **Witness.** The hypotheses constrain U_v only for v ∉ T and v ∈ R. Take v ∈ T ∖ (R ∪ S_2) at which `ρ̄|G_{F_ṽ}` is ramified (then π is ramified at ṽ, so v ∈ T by Hypothesis 5.7.5, and v ∉ R since R needs ρ̄ trivial), and U_v = GL_n(O_{F_ṽ}). Every lift of a ramified residual representation is ramified, so by local–global compatibility (AG2.5) no RACSDC π′ with `r̄_{π′,2} ≅ ρ̄` has a U_v-fixed vector; `S^{ord}_{0,{χ_v}}(U(l^∞), E/O)` has no constituent with residual representation ρ̄, the localization is zero, and no such m exists. The source has the same gap: BCGP25 Proposition 5.7.9 (BCGP25 line 6060) states the same hypotheses and asserts m; its two uses in the proof of Theorem 5.7.14 (BCGP25 lines 6152–6158: U_{v₁} torsion-free at an unramified place; lines 6293–6299: sufficiently deep U_v) satisfy the missing condition, as do the roadmap's uses in 4.3 and 4.8.

   **Repair.** In 3.3 add the hypothesis "and, for every v ∈ T ∖ (R ∪ S_2), U_v fixes a nonzero vector of π_ṽ (for instance U_v sufficiently deep in the sense of 3.5)", and let m be "the maximal ideal attached to the ordinary 2-stabilization of π, which exists because π contributes to `S^{ord}_{λ_π,{χ_v}}(U(l^{b,c}), ℚ̄₂)` for suitable b ≤ c (2.3) and hence, by 2.2(2), to level `U(l^∞)` in weight 0". Add the negative Check: "If U_v is hyperspecial at a place v ∈ T ∖ (R ∪ S_2) at which `ρ̄|G_{F_ṽ}` is ramified, no RACSDC π′ with `r̄_{π′,2} ≅ ρ̄` has U_v-fixed vectors, the localized ordinary Hecke algebra is zero and no such m exists." Record the source gap under Corrections (text in Source issues below). Tested: on the witness the repaired statement does not apply (its hypothesis fails), and on the two uses (4.3 with U_{v₁} torsion-free at the unramified place v₁, 4.8 with sufficiently deep U_v) the hypothesis holds, so nothing downstream changes.

2. **F02** (P3) The 3.2(b) route calls the rank-one pairing "a computation"; it is a condition (design note F01 not applied)

   **Location.** README line 334: "⟨o_1, ψ′⟩ = 0 is a computation with this map and the Kummer class of L⁺/F⁺. The source states (b) without this step".

   **Claim.** The last step of the route to (b), the vanishing of the rank-one pairing ⟨o_1, ψ′⟩, is a computation in the completed group rings given by class field theory.

   **Witness.** Recomputed: in rank one the presentation `P_1 = O⟦G_loc × ℤ₂^{h¹}⟧ ↠ R^T_1 = O⟦Γ × ℤ₂^{2#T−1}⟧` is induced by a surjection of pro-2 abelian groups with kernel K; `J_1/m J_1` has d(K) = rank K + d(K_tors) generators with rank K = (#T + d + h¹) − (d + 2#T − 1) = h¹ − #T + 1 = h² − 1 (using h¹ − h² = #T − 2 from h³ = 1). Injectivity of the adjoint of o_1 gives d(K) ≤ h², so K_tors is cyclic, and ⟨o_1, ψ′⟩ = 0 forces d(K) ≤ h² − 1, i.e. K torsion-free: no nontrivial tuple of 2-power roots of unity `(ζ_v)_{v∈T}` with trivial Artin image in Γ. That is a global condition on F⁺, F and T (for a T-unit α of F⁺ with an odd number of negative embeddings the dihedral character η_α detects the diagonal tuple (−1)_v by Hilbert reciprocity; nothing detects it in general), not a computation. Conversely, since ⟨o, ψ⟩ is the image of ⟨o_1, ψ′⟩ under `J_1/m J_1 → J/m_P J`, which need not be injective, the reduction is only sufficient. This is the accepted design review's F01 (its repair text is at `reports/REV-DESIGN-OrdinaryAutomorphicFormsAndModularityLiftingPartII~3.md`, finding 1); the package report lists no change to it.

   **Repair.** Replace the quoted sentence by: "⟨o_1, ψ′⟩ = 0 holds exactly when the kernel K of `∏_{v∈T} F_ṽ^×(2) × ℤ₂^{h¹_{1,T}} ↠ Γ × ℤ₂^{2#T−1}` is torsion-free and the hyperplane of `H²_{1,T}` spanned by the relations is ψ′^⊥; the first condition says that no nontrivial tuple of 2-power roots of unity at T has trivial Artin image in Γ. The reduction is only sufficient: ⟨o, ψ⟩ is the image of ⟨o_1, ψ′⟩ under `J_1/m J_1 → J/m_P J`." Add one sentence naming GlobalGaloisDeformations §§4.8–4.11 (the rank-two determinant torsor and dyadic twisting action) as a second route an implementer may take. Keep (b), its locator and the correction. Tested: the rank-one Check at line 340 (count d versus dim O⟦Γ⟧ = 1 + d) stays a dimension check and no longer reads as a proof of the pairing; 4.8's Check at line 511, which already names the step as unsourced, is unchanged.

3. **F03** (P3) 4.3's freeness over `Λ[Δ_{Q_N}]` needs the b₀ = 1 clause (design note F02 not applied)

   **Location.** README line 436: "The Hecke modules at level Q_N are finite free over `Λ[Δ_{Q_N}]` by sufficient smallness and 2.2(1)".

   **Claim.** 2.2(1) gives freeness over Λ = O⟦T(l)⟧.

   **Witness.** 2.2(1) (README line 258) gives freeness over `O⟦T(l^{b₀})⟧` for b₀ with `U(l^{b₀,b₀})` sufficiently small (Ger19 Proposition 2.5.3, Ger19 line 716); Λ itself is the case b₀ = 1, which holds here only because `U_{v₁}` is torsion-free, so every `U(l^{b,c})` is sufficiently small (BCGP25 lines 6152–6156). Without that component the 2.2 Check at line 271 shows `[−1_n] − ε₀` acting by zero, so the module is not free over Λ.

   **Repair.** Write "finite free over `Λ[Δ_{Q_N}]`, because `U_{v₁}` is torsion-free, so `U(l^{1,1})` is sufficiently small and 2.2(1) applies with b₀ = 1, `O⟦T(l^{b₀})⟧ = Λ` (BCGP25 Remark 5.7.15 and the choice of `U_{v₁}`)". Tested: the instance of the 2.2 Check (U_v ∋ −1_n at every finite v ∤ 2) is excluded by the torsion-free `U_{v₁}`, and 4.2's hypothesis "H_N finite free over S_N" is met.

4. **F04** (P3) AutomorphicBundles no longer has a "Layer B5"; the cited layer is Layer 12, §§12.11–12.13

   **Location.** README line 128 ("Layer B5 (B5.10–B5.12)"), lines 129–131 (three gap lines "section Layer B5"), the design's `plan.json` gaps `section` fields.

   **Claim.** The geometric Hecke operators, convolution law and non-neat case are AutomorphicBundles B5.10–B5.12 in "Layer B5: Hecke action and Fourier expansions".

   **Witness.** AutomorphicBundles at its open head (pull request head fd74684) has `## Layer 12: Hecke action and Fourier expansions` (its README line 4506) with 12.11 "Geometric Hecke operators on classical sections", 12.12 "Convolution law for the geometric Hecke action", 12.13 "Hecke action at non-neat level" (lines 4929, 4982, 5011), and records the renaming at its line 222: "B4 = Layer 11 and B5 = Layer 12 (B5.1a = 12.2, B5.n = 12.(n+1) for n ≥ 2)". No heading "B5" exists. The content cited (four settings, no Hilbert–Siegel variety, no Hida theory) is unchanged (lines 4508–4519), so the three gaps remain needed.

   **Repair.** Cite "AutomorphicBundles Layer 12 (§§12.11–12.13, formerly B5.10–B5.12)" at line 128 and "(section Layer 12: Hecke action and Fourier expansions)" in the three gap lines and in the 5.6 and 6.2 `*Needs:*` lines where the slugs appear. The slugs are unchanged, so the plan's gap entries still match by slug; if the intake permits, update their `section` strings likewise. Tested: `roadmaps show AutomorphicBundles` resolves "Layer 12" and "12.11" as headings; "B5.10" resolves only through the alias line.

5. **F05** (P3) LocalGaloisDeformationRings §1.22 is cited for residual formal smoothness, which its §1.4 states

   **Location.** README line 85: "§1.22: smooth points of the generic fibre; R^□_v is formally smooth over O when H⁰(F_v, ad⁰ρ̄(1)) = 0"; used at line 589 (5.4 API), line 662 (6.2) and line 676 (6.3).

   **Claim.** §1.22 of LocalGaloisDeformationRings states that vanishing of H⁰(F_v, ad⁰ρ̄(1)) makes the framed ring formally smooth over O.

   **Witness.** LocalGaloisDeformationRings §1.22 (its README lines 1605–1611, head 23fae83) is about closed characteristic-zero points of the generic fibre: "a closed characteristic-zero point is regular iff H²(ad⁰ρ_x) = H⁰(ad⁰ρ_x(1)) = 0"; it says nothing about the residual representation or formal smoothness over O. Its §1.4 (line 1334) states "H² = 0 gives formal smoothness and equality", the residual statement needed, with H²(F_v, ad⁰ρ̄) = 0 ⟺ H⁰(F_v, ad⁰ρ̄(1)) = 0 by local duality, and §1.17 (line 1509) gives the G-valued fixed-multiplier form with tangent space Z¹(Γ, Lie G).

   **Repair.** In the contract write "§1.4 (with §1.17 for the fixed-similitude GSp₄ form): R^□_v is formally smooth over O when H²(F_v, ad⁰ρ̄) = 0, equivalently H⁰(F_v, ad⁰ρ̄(1)) = 0; §1.22: regular points of the generic fibre", and change the three uses to "§1.4". Tested: the 5.4 API bullet "(6) gives H⁰(G_{F⁺_{w₀}}, ad⁰ρ̄(1)) = 0, so R^□_{w₀} is formally smooth over O" then cites a section that states it.

6. **F06** (P3) 4.2 cites KT17 §4 for patching over Λ; the patching is KT17 §3, Proposition 3.1

   **Location.** README line 422: "This is the patching of Tho12 Theorem 8.6 and KT17 §4 over Λ"; `sources.toml` KT17 entry, `locator = "§4"`, `cited_for = ["1.2", "4.2"]`.

   **Claim.** KT17 §4 contains the abstract patching over a weight algebra.

   **Witness.** KT17 line 627: "3 Abstract patching", with Proposition 3.1 at line 630: "Fix Λ ∈ CNL_O and q ≥ 1, and define S_∞ = Λ⟦S_1, …, S_q⟧ …" (the Λ-coefficient patching). KT17 line 745: "4 Galois deformation theory", which assumes p > n and p odd (line 749) and is the right citation for 1.2's Λ-coefficient deformation theory, not for 4.2.

   **Repair.** In 4.2 write "KT17 §3, Proposition 3.1"; in the manifest set the KT17 locator to "§3 (Proposition 3.1), §4" (the author's entry is kept, the locator is extended). Tested: Proposition 3.1 at KT17 line 630 is the statement 4.2's route uses (S_∞ = Λ⟦S⟧, a = ker(S_∞ → Λ), patched complexes and R_∞).

7. **F07** (P3) Two locators are line numbers of the worker's text extraction

   **Location.** README line 175: "(Tho17 line 390)"; line 225: "(Ger19 line 144)".

   **Claim.** These locate the vanishing of h^i for i ≥ 4 and Geraghty's choice of an arbitrary prime l.

   **Witness.** "line 390" and "line 144" are line numbers of the cached extractions, which no reader of the roadmap has; the brief's locators are theorem, section and page numbers. Tho17 line 390 lies on p. 9 in the proof of Lemma 2.13 (page marker at Tho17 line 352); Ger19 line 144 lies on p. 4 of the preprint, the opening paragraph of §2 (page marker at Ger19 line 137).

   **Repair.** Replace by "(Tho17, proof of Lemma 2.13, p. 9)" and "(Ger19 §2, opening paragraph, p. 4)". Tested: both statements are on those pages.

8. **F08** (P3) The baseline commits named in the supplier contracts are not the pinned revisions

   **Location.** README line 49: "The baseline is Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`"; line 60: "The baseline is Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`".

   **Claim.** The declarations were read at those commits, the pins.

   **Witness.** The content checkout's `lake-manifest.json` pins mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and TauCeti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. All eight declarations exist at those pins (file and line under Verified sound), so nothing else changes.

   **Repair.** Name the pinned revisions (or drop the hashes and say "at the pinned Mathlib and Tau Ceti"). Tested: each file and line cited below was opened at the pinned revisions.

9. **F09** (P3) "Downstream consumers" misstates how AbelianSurfacesModularity uses this roadmap

   **Location.** README line 711: "AbelianSurfacesModularity consumes 5.2 for its allowed mod-3 images and, through GSp4NonregularModularityLifting, the two end theorems."

   **Claim.** AbelianSurfacesModularity consumes GSp₄-reasonableness from 5.2.

   **Witness.** AbelianSurfacesModularity at its head (ce7b798) never names this roadmap; it declares "What ArithmeticGaloisRepresentations must provide (gap:near-adequacy-reasonableness): Provide Whitmore Definition 3.19 reasonableness …" (its README line 87) and cites "ArithmeticGaloisRepresentations §7.9 (reasonableness contract)" at its lines 397 and 978, while taking near adequacy from PotentialAutomorphyInfrastructurePartII PL.4 (line 12). GSp4NonregularModularityLifting does cite §5.2 of this roadmap (its lines 176–180, 1574–1576). ArithmeticGaloisRepresentations at its head (cdbe447) contains no reasonableness (grep "reasonable": no match), so today this roadmap is the only owner; the AbelianSurfacesModularity gap would create a second owner if ArithmeticGaloisRepresentations accepts it.

   **Repair.** Write: "AbelianSurfacesModularity consumes the two end theorems through GSp4NonregularModularityLifting; GSp4NonregularModularityLifting consumes 5.2." Flagged for the intake: the gap `near-adequacy-reasonableness` that AbelianSurfacesModularity declares on ArithmeticGaloisRepresentations asks for the object of 5.2; one owner should be chosen before that gap is announced. Tested: `roadmaps grep "GSp₄-reasonable|GSp4-reasonable|Ĝ-reasonable"` returns only AbelianSurfacesModularity (uses) and GSp4NonregularModularityLifting (cites this roadmap).

10. **F10** (P3) 2.1 phrases sufficient smallness as a standing assumption of the carrier

   **Location.** README line 229: "… the level acting through its components at S_2 ∪ R, and U is sufficiently small in the sense of AutomorphicFormsOnReductiveGroups §7.5."

   **Claim.** (As written) every level U of 2.1 is sufficiently small.

   **Witness.** 2.2 then assumes only that `U(l^{b₀,b₀})` is sufficiently small for some b₀ ≥ 1, and the 2.2 Check at line 271 needs a U with −1_n ∈ U_v at every finite v ∤ 2, which is not sufficiently small; BCGP25 line 5908 defines the carrier for every compact open U and "sometimes" assumes sufficient smallness. The sentence imports the notion, but reads as a hypothesis that the later Check violates.

   **Repair.** Write "…; sufficient smallness of a level is that of AutomorphicFormsOnReductiveGroups §7.5 (torsion-free projection to one finite place)". Tested: the 2.2 hypothesis and its faithfulness Check are then consistent with 2.1.

11. **F11** (P3) The README's statement of gap:gsp4-semisimple-taylor-wiles-places drops p ≥ 3

   **Location.** README line 91: "Whitmore's local problem for GSp₄ with fixed similitude at a place v with q_v ≡ 1 mod p^n and ρ̄(Frob_v) semisimple …".

   **Claim.** The gap as declared.

   **Witness.** The plan's `needs` reads "For GSp₄ with fixed similitude, p ≥ 3, q_v ≡ 1 mod p^n and ρ̄(Frob_v) semisimple, …"; the README line omits "p ≥ 3", the hypothesis under which 5.3 and 6.2 use it and under which WHI22 §3 works.

   **Repair.** Insert "p ≥ 3," after "fixed similitude". Tested: the sentence then equals the plan's `needs` up to wording.

Reviewed read-only: `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md` (751 lines, 30 targets in six layers), `Suggested.lean` (42 lines, a module docstring and an empty namespace), `metadata.toml`, `sources.toml` (13 certified entries, no local path), the design's `plan.json` (7 gaps), the three design reviews and the package report. No previous package review exists. The design was accepted in its third round with two non-blocking notes (F01, F02) that the package stage was to apply; neither is applied (R02, R03). One finding is blocking (R01, a missing hypothesis in target 3.3); the rest are locator, drift and wording repairs. Every repair below was tested on the instance that refuted the original text.

## Verified sound

**Gate (verbatim).**

```
depcheck: 241 roadmaps, 2431 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. Every supplier named is earlier in the merge order or on the board (PotentialAutomorphyInfrastructurePartII, an accepted board design); none of the forbidden suppliers (none) is cited.

**Elaboration.** `lake env lean` on the absolute path of `Suggested.lean` from the content checkout: exit 0, no output, 12 s. The file has a single `import Mathlib`, one module docstring "…: target signatures" saying the roadmap is README.md, and an empty namespace. No declaration, so no `sorry`, no padding, no `#check` comparison to run. The docstring names seven headlines as not statable with their missing carriers; checked at the pins: Tau Ceti `358314d4` has no deformation, Hecke-algebra, automorphic or adequacy declaration (grep over `TauCeti/*.lean` hits only knot-theory and divisor-table files), and Mathlib `f6090c70` has no Galois deformation functor, no `G_{F,S}` and no automorphic representation. A headline statable at the pins but absent: none. README API bullets and Checks name no Lean declaration of this roadmap (only the eight library names below).

**Principles.** General statements at the generality of BCGP25 Theorems 5.7.14 and 6.3.4; the parent roadmap (OrdinaryAutomorphicFormsAndModularityLifting, head 61b27fa) is the GL₂ Skinner–Wiles theory at odd p and is not re-planned, as the summary says; no cycle; no copied passage (spot-checked 1.1, 1.3, 2.1, 3.1, 4.1, 5.1, 5.2, 5.4, 6.3 against the source lines); no algorithm; no `set_option`, no sorry'd data; no LaTeX delimiter (grep 0), no process word, pull-request number, path or "optional/deferred" (grep 0); the two line-number locators are R07.

**Seeded sample (15 targets), each read at its locator.**
1. 1.1: BCGP25 lines 5448–5509 (standing hypotheses, liftings, Ĝ_n-stable local problems, the tuple 𝒮, strict equivalence by Ĝ_n(A), T-framed lifts, representability by Tho17 Lemmas 2.8 and 2.10, relative dimension (n² + 1)#T − 1 at line 5503, R^loc_{𝒮,T} and its map), Lemma 5.1.2 and Remark 5.1.3 (lines 5180–5193); Tho17 Lemma 2.8 (line 274, stabilizer = i(ĜL₁)), Lemma 2.11 (line 297). Matches.
2. 1.3: BCGP25 Lemma 5.3.1 with proof (lines 5402–5420), Definitions 5.3.2–5.3.3 and Remark 5.3.4 (lines 5421–5437); PotentialAutomorphyInfrastructurePartII PL.4 relaxed adequacy (board design lines 1877–1895: finite H, k containing the eigenvalues, H¹(H, k) = H¹(H, ad) = 0, trace condition). Matches.
3. 2.2: BCGP25 lines 5993–6001 (finite over Λ by Ger19 Cor. 2.21 = Cor. 2.5.4, reduced by Lem. 2.14 = Lem. 2.4.4, ℘_λ dense by the proof of Cor. 3.4, (5.7.4) by Lem. 2.25 = Lem. 2.6.4); Ger19 Proposition 2.5.3 (line 716, free over Λ_{b₀}), Corollary 2.5.4 (line 749), Lemma 2.4.4 (line 600), Proposition 2.6.1 (line 771, A = O/ϖ^r or ϖ^{−r}O/O, twist (w₀λ)(u)), Lemma 2.6.4 (line 954), Lemma 2.4.7 (line 632), §2 fixing an arbitrary prime (line 144). Matches.
4. 3.1: BCGP25 lines 6023–6043 (r̄ by Lemma 5.1.2, T ⊃ S_2 split, R, χ_v, Hypothesis 5.7.5, Λ_v, (5.7.6) with multiplier ε^{1−n}δ^n, Λ-structure by local class field theory), Definition 5.7.11 (line 6076). Matches.
5. 3.5: Definition 5.7.13 (line 6085) and Lemma 5.7.12 (line 6080). Matches.
6. 4.1: BCGP25 lines 6113–6139 (F = F⁺(√−1); ρ̄ trivial at T; [F⁺_v:ℚ₂] > n(n−1)/2 + 1; Iwahori vectors; 2^N ∥ q_v − 1 with 2^N > n and roots of unity; H¹(ρ̄(G_F), k) = 0 forbids index 2; v₁ by (5)); Remark 5.7.15 (line 6110); lines 6152–6156 (torsion-free U_{v₁}); Lemma 5.6.2 (line 5794: every lifting of ρ̄|G_{F_ṽ} becomes unipotently ramified over a finite extension). The unipotence clause is the roadmap's addition, recorded at README line 732. Matches.
7. 4.2: Tay08 Lemma 2.3 (line 227: depth ≥ dim A gives equality and support a union of components); Tho12 Theorem 8.6 (line 2084) as the pattern; KT17 Proposition 3.1 (line 630) is the Λ-patching (R06 repoints the citation); DeformationAndDerivedPatchingAlgebra §5.5 first part (its line 1098: S regular local, free module, l = 0) and §§5.2–5.4 (lines 1050–1098, S = O⟦z⟧, applied to Λ⁰⟦X⟧). Matches with R06.
8. 4.5: BCGP25 lines 6221–6249 (Q fixed, support nonempty from π, (4)–(5), R^loc_X, R_X, Hecke quotient, finiteness by topological Nakayama, dominance over Spec Λ/Q, a ℚ̄₂-point above some ℘_λ, π_Y with single components by genericity). The roadmap's route reads the dimension of R_X off the patched module instead of Lemma 5.7.7 (line 6236); both inclusions of Spec R_X = C_X ∩ V(a_∞) recomputed. Matches.
9. 4.7: Theorem 5.7.14 (lines 6088–6109), end of proof (lines 6280–6292: BLGGT14 Lemma 1.2.3(1) at p = 2 with Tho17 Lemma 2.4 for CHT08 Lemma 2.1.12); BLGGT14 Lemma 1.2.3 (line 676); Tho17 Lemma 2.4 (line 218). Matches.
10. 4.8: lines 6293–6302 (density from Lemma 5.7.7, (5.7.4), solvable base change). Matches; the roadmap's 3.2(b) replaces Lemma 5.7.7 and says so.
11. 5.1: BCGP25 Definitions 6.1.1–6.1.4 and (6.1.5) (lines 6345–6401: D^□_v(k[ε]) = Z¹(F_v, ad⁰ρ̄), ĜSp₄-conjugacy by H¹(F_v, ad ρ̄), relative dimension 11#T − 1, torsor under (∏ĜSp₄)/Ĝ_m, G_F printed at line 6398). Matches.
12. 5.2: WHI22 Definition 3.15 (lines 985–994: 1a–1c and 2 with z ∈ Lie Z(M_h) ∩ ĝ⁰), Definition 3.19 (lines 1064–1068: 1a and 2 for all large n, conditional H¹), Lemma 3.20 (line 1073); BCGP25 Remark 6.4.5 (lines 6838–6855, class in H¹(G, ∧²ρ)); ArithmeticGaloisRepresentations §7.11 at head cdbe447 (its line 5095: Sp₄(F_p) enormous for p ≥ 3, BCGP21 Lemma 7.5.15). Matches.
13. 5.4: BCGP25 lines 6620–6662 (π ordinary cuspidal of central character |·|² and weight ((k_v, l_v; 2)), ρ_{π,p} from Theorem 1.8.17, R, Hypothesis 6.3.1 (1)–(5), Remarks 6.3.2–6.3.3, w₀). Theorem 1.8.17 (line 641) is for ordinary weight 2, as the gap says. Matches.
14. 6.3: Theorem 6.3.4 and proof (lines 6694–6746). Matches.
15. 6.4: Theorem 6.3.4, first clause (line 6695), with DeformationAndDerivedPatchingAlgebra §4.1 (its line 899). Matches.

Also read: BCGP25 §5.4 (5.4.1)–(5.4.3) and the vanishing claim (lines 5523–5571), Remark 5.4.4 (5572–5605), Lemma 5.5.3 with proof (5640–5687), Proposition 5.5.6 (5694–5704), Lemma 5.6.3, Propositions 5.6.4 and 5.6.6 (5801–5846), Lemma 5.7.7 with proof (6044–6059), Proposition 5.7.9 (6060–6075), proof of Theorem 5.7.14 lines 6157–6220 and 6250–6277, Lemma 6.2.6 (6596–6605), Lemma 8.2.2 and Remark 8.2.3 (8391–8406); Tho17 Lemmas 2.2 and 2.4 (199–233), 2.12–2.17 and Corollary 2.14 (353–497), Proposition 2.21 with proof (597–638, where h³ = 1 is used at line 614); WHI22 Lemma 3.14 (939), Lemma 3.16 (1001), Proposition 3.18 with proof (1013–1061, Lemma 3.16 invoked at 1046), Propositions 7.5–7.6 (3104, 3112), Theorems 7.7–7.8 (3155, 3188), Lemma 7.10 and Proposition 7.11 with proof (3299–3389); Ger19 Proposition 2.7.2 (1065–1089), Lemma 3.2.3 (1582–1589); CHT08 Corollary 2.3.5 (1415–1427, the −h⁰(ad r̄(1)) term), Lemmas 2.1.4, 2.1.12, 2.2.11, Corollary 2.2.12, Propositions 3.4.2, 3.4.4 (355, 551, 1018, 1038, 5157, 5212); Sho18 Theorem 2.5 (305); BCGNT25 Lemma 3.2.4 (1636); BLGHT11 Lemma 3.3 (786); BCGP21 Theorem 7.9.4 (10285), Lemma 7.5.9 (9437), Propositions 7.4.7–7.4.8 (8961, 8965), Hypothesis 7.8.1 (9943), Definition 7.5.11 (9489), Lemma 7.5.15 (9509).

**Adversarial table.** One row per statement, values recomputed this round.

| # | Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | Conventions | p = 7, q_v = 2; n = 4; n = 2, d = 2 | 2·4 = 8 ≡ 1 so 2^{−1} ≡ 4 ≠ 2; ε^{−3}δ⁴ = ε^{−3}; T(l) ≅ ({±1}×ℤ₂)^4, dim Λ = 1 + 4 | OK | — |
| 2 | 1.1 | n = 4, #T = 3; T = ∅; (1, a)·(B, b)j·(1, a)^{−1}; (µ1_n, 1); A = k[ε] | 17·3 − 1 = 50 vs 47; R^T = R; (a^{−1}B, b)j; (µ²B, b)j equal iff µ² = a^{−1}; (x + yε)² = x² so 1 + ε is no square | OK | — |
| 3 | 1.2(1)–(3) | r̄(c_v) = (B, 1)j on 1_n; n = 2, d = 2, #T = 3, q = 5 | Ad((B,1)j)1_n = −B·1·B^{−1} = 1_n in char 2, h³ = 1 (Tho17 Lemma 2.15 line 433, used at Prop. 2.21 line 614); χ = 1 − 3 − 5 + 2 = −5 (ℓ¹ = 3 at real places, 5 at Q); h¹ = 0 + 1 − 1 + 5 = 5 = g = 5 + 3 − 1 − 2 | OK | — |
| 4 | 1.2(5) | B = 1_2; B = Ψ_2 | (1 + c)X = (Y + ᵗY)B^{−1} with Y = XB, so 1_n ∈ (1 + c)ad iff B alternating: 1_2 no, Ψ_2 yes | OK | — |
| 5 | 1.3 | H = {1} ⊂ GL₂; GL₂(𝔽₂) ≅ S₃; A₅ | dim U = 3; semisimple elements 1, A, A² (involutions unipotent in char 2) span 𝔽₄, dimension 2 < 4, U of dimension 2 ≠ 0; H¹(A₅, ad/k) ≅ H²(A₅, k) = k (Remark 8.2.3) | OK | — |
| 6 | 1.4 | √2 ∉ F⁺; F⁺ = ℚ(√2); ℚ(√5); n even/odd; F⁺ = ℚ | least m = 3, L⁺ = F⁺(√2), quadratic since F⁺ ∩ K⁺_m = K⁺_{m−1}; m = 4, [ℚ(ζ₁₆)⁺:ℚ] = 4; ℚ(√5) in no K⁺_m; n·⟨,⟩ = 0 for n even; Hilbert symbol of units trivial at v ∤ 2, c_{F,v} = 0 at v | 2; ℚ has no unramified CM extension | OK | — |
| 7 | 2.1 | n = 1; n = 2; λ = (1, 0), j = 1 vs 2; two ℚ₂-places | twist ∏τ(u_1)^0 = 1; u ↦ ∏τ(u_2)^{−1}; X² − T¹X + qT²; (w₀λ)(α^1) = ϖ^{λ_2} = 1, (w₀λ)(α²) = ϖ^{λ_1+λ_2} = ϖ; ({±1}×ℤ₂)^4, 16 components of dimension 5 | OK | R10 (wording) |
| 8 | 2.2 | b₀ = 1 vs ≥ 2; U_v ∋ −1_n for v ∤ 2; nd = 4, 8 | Ger19 Prop. 2.5.3 frees over Λ_{b₀}; −1 ≡ 1 mod ṽ so −1_n ∈ T(l); twist sign (−1)^{dn(n−1)/2} = +1 for nd ≡ 0 mod 4 (2·2·1/2 = 2; 1·4·3/2 = 6); [−1_n] − ε₀ ≠ 0 acts by 0; such U is not small, consistent with faithfulness only over Λ_{b₀}, b₀ ≥ 2 | OK | R03 (4.3's use) |
| 9 | 2.3 | n = 1; λ = 0, n ≥ 2 | r^c = r^{−1}; Speh(1, n) gives n characters 1, ε^{−1}, …, Eisenstein; Ger19 Prop. 2.7.2 (1)–(3), (6) at arbitrary l | OK | — |
| 10 | 3.1 | n = 3; n = 4; k of char 2 | ε^{−2}δ with (−1)^{−2}(−1) = −1 at c_v; ε^{−3}; every element of k^× a square, GL_n(k)- and 𝒢_n⁰(k)-classes agree | OK | — |
| 11 | 3.2(a) | n = 2, d = 2, #T = 3; general | dim R^loc = 1 + 12 + 6 = 19; h¹ − h² = −1 − (1 − 3 + 2) = −1; 19 − 1 − 14 = 4 = nd; general (1 + n²#T + dn(n+1)/2) + (#T − 2 − dn(n−1)/2) − ((n²+1)#T − 1) = nd | OK | — |
| 12 | 3.2(b) | same; rank one; det | printed 1 + n[F:ℚ] = 9 > 5 = dim Λ contradicts 4.7; rank one (1 + #T + d) + (#T − 2) − (2#T − 1) = d vs dim O⟦Γ⟧ = 1 + d with rank Γ = d (δ_F = δ_{F⁺}); ν(det (g,a)j) = −a^n = (−1)^{n+1}ν^n, value −1 at c_v; det is a homomorphism: j(g,a)j^{−1} ↦ (a^n det g^{−1}, a^n) both ways; rank-one kernel: d(K) = h² − 1 + d(K_tors) | statement as sourced; route's last step is a condition | R02 |
| 13 | 3.3 | U_v = GL_n(O) at v ∈ T∖(R∪S_2) with ρ̄ ramified at ṽ | no π′ ≡ ρ̄ has U_v-fixed vectors; localized ordinary Hecke algebra 0; no m | FALSE as stated | R01 |
| 14 | 3.4 | n = 1, q_w ≡ 1 mod 4; GL₂ trivial vs Steinberg | order-4 characters ≡ 1 mod ϖ, conductor 1; same block [T, 1], N = 0 vs N ≠ 0 | OK | — |
| 15 | 3.5 | U′ ⊂ U; all lifts unramified; n = 1, q ≡ 1 mod 4 | π^U ⊂ π^{U′}; GL_n(O) deep; O^× not deep, 1 + ϖO deep (1 + ϖO pro-ℓ, ℓ ≠ 2) | OK | — |
| 16 | 4.1 | ψ ⊕ 1^{n−1} over F′; √−1; U_{v₁} | (X − ψ(σ))(X − 1)^{n−1} ≠ (X − 1)^n; H¹(H, k) = 0 forbids index 2; π unramified at v₁ and U_{v₁} ⊂ g GL_n(O) g^{−1} so π^{U_{v₁}} ≠ 0 | OK | — |
| 17 | 4.2 | q = j = 0; F⁺ = ℚ(√105), F = ℚ(√−7, √−15); dim R_∞ = dim S_∞ + 1 | H free over Λ; 3, 5, 7 ramify in F⁺ with e = 2 in F/ℚ so F/F⁺ unramified at finite places, −7 ≡ −15 ≡ 105 ≡ 1 mod 8 so 2 splits, Λ of rank 16 over Λ⁰ and (1 − [−1])(1 + [−1]) = 0; depth ≤ dim S_∞ < dim R_∞ | OK | R06 (locator) |
| 18 | 4.3 | n = 2, d = 2, #T = 3, q = 5; q = 0 | g = 5; dim R_∞ = 1 + 12 + 6 + 5 = 24; dim S_∞ = 5 + 5 + 15 − 1 = 24 (BCGP25 (5.7.17), line 6178); S_∞ = Λ⟦14 variables⟧ | OK | R03 |
| 19 | 4.4 | #R = 0; n = 2, v ∈ R | components of R^□_{v₁}; R^{χ_v}_v irreducible vs R¹_v two components (Prop. 5.6.4) | OK | — |
| 20 | 4.5 | same numbers; both inclusions | 24 − 19 = 5 = dim Λ; Spec R_{S_1} ⊂ V(a_∞); C_X ∩ V(a_∞) ⊂ Supp H_1 ⊂ Spec R_{S_1} | OK | — |
| 21 | 4.6 | T′ without S_2(L⁺); #R = 0 | ordinary condition lost (line 6261); one C′_Y per choice above 2 | OK | — |
| 22 | 4.7 | tame non-unipotent lift over F′ | lands in R′_{L/F,T′} only as a restriction from F (Lemma 5.6.2 for lifts of ρ̄|G_{F_u}) | OK | — |
| 23 | 4.8 | component of dimension dim Λ − 1; density | could lie over V(ϖ) with no ℘_λ, excluded by (b); for Z finite surjective onto an irreducible Λ-component, preimage of the dense {℘_λ} is dense (a proper closed W ⊂ Z has f(W) ≠ Y), and each Z ∩ V(℘_λ) has dimension ≥ 1 with flat components | OK given 3.2(b) | — |
| 24 | 5.1 | #T = 1, 3; GL₄ framing | 10; 32 vs 47; dim ad = 11, ad⁰ = 10 | OK | R05 (contract) |
| 25 | 5.2 | torus image; Sp₄(𝔽₃); regular h; p = 2 | (a) fails; Sp₄(𝔽₃) perfect so H_n ⊇ Sp₄(𝔽₃), enormous by BCGP21 Lemma 7.5.15 (AGR §7.11 line 5095); tr on 𝔱 = 2(xx′ + yy′); vanishes at p = 2 | OK | — |
| 26 | 5.3 | ρ̄(Frob_v) = 1; ζ_p ∈ L not enormous; torus | N_v = 0; Lemma 3.16(2); H⁰ ≠ 0 breaks the inflation–restriction kernel (Prop. 3.18 line 1046) | OK | — |
| 27 | 5.4 | p = 3: 19, 7; q_{w₀} ≡ 1; general type | 19 ≡ 1 mod 9, 7 ≢ 1; ratio 1 = q so 𝔱 ⊂ (ad⁰ρ̄(1))^{Frob}; absolute irreducibility of ρ̄ forces general type, so the added clause narrows nothing | OK | — |
| 28 | 5.5 | p-distinguished | Spec R^△_v[1/p] irreducible, R^{△,π}_v its flat reduced quotient (Remark 6.3.2) | OK | — |
| 29 | 5.6 | weights l_v > 2 vs 2 | WHI22 Thm 7.7 needs k_v ≥ l_v > 2; only large-weight π enter through the classicality gap; weight 2 through the Galois gap | OK | R04 (gap section) |
| 30 | 6.1 | p > 2 split; p = 2 | Λ_{GSp₄,v} = O⟦x, y⟧ a domain of dimension 3, 16 over O = 14 over Λ_v; torsion at p = 2 | OK | — |
| 31 | 6.2 | F⁺ = ℚ, #S = 3, t = 7 | g = 7 − 4 + 3 − 1 = 5; 5 + 30 + 4 = 39 = 7 + 33 − 1 (WHI22 lines 3386–3388) | OK | R04 |
| 32 | 6.3 | support only nonzero | another factor above p possible; seed + Z select R^{△,π}_v; factor-by-factor single components (Lemma 6.2.6, Prop. 7.4.7, w₀) | OK | — |
| 33 | 6.4 | nilpotent kernel onto a finite algebra | R/m_Λ R → T/m_Λ T with nilpotent kernel, Artinian target, so finite length; §4.1 | OK | — |

**Library declarations opened at the pins** (mathlib `f6090c70`, TauCeti `358314d4`): `Matrix.trace` (`Mathlib/LinearAlgebra/Matrix/Trace.lean` line 43), `Matrix.trace_one` (line 144), `Module.End.IsSemisimple` (`Mathlib/LinearAlgebra/Semisimple.lean`, module header line 26), `Submodule.span` (`Mathlib/LinearAlgebra/Span/Defs.lean` line 46), `Matrix.symplecticGroup` (`Mathlib/LinearAlgebra/SymplecticGroup.lean` line 101, a `Submonoid`, so Sp not GSp as the contract says), `LieAlgebra.Symplectic.sp` (`Mathlib/Algebra/Lie/Classical.lean` line 157, a `LieSubalgebra` of `Matrix (l ⊕ l) (l ⊕ l) R`), `groupCohomology` (`Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean` line 184, `Rep k G → ℕ → ModuleCat k`), `TauCeti.completedGroupAlgebra` (`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean`, header lines 55–57: the inverse limit of `R[Γ ⧸ U]` over open normal `U`, with `proj`, `of`, `lift`). All exist; the contract's descriptions are accurate (R08 concerns only the named baseline hashes).

**Cross-roadmap citations resolved** (each opened at the named copy): LocalGaloisDeformationRings (head 23fae83) §§1.3 (line 1309), 1.9 (1407), 1.17 (1509), 1.22 (1605), 2.17 (1945, four distinct eigenvalues only, so the gap is needed), 2.22 (2035), 2.23 (2049), 2.24 (2073), 2.29 (2205: Lemma 5.6.2, Prop. 5.6.4, sums of characters), F.2.6 (746), 6.24 (3325: ρ̄ = 1 and f > d(d−1)/2 + 1, so the gap is needed), 6.27 (3355), 6.29 (3412), 6.31 (3505), 6.35 (3575: Lemma 6.2.6 with surjectivity as hypothesis); GlobalGaloisDeformations (c3a764e) §§3.3 (406), 4.2 (713), 8.1–8.4 (1878–1996, p odd); DeformationAndDerivedPatchingAlgebra (1548fe7) §§1.12 (282), 4.1 (899), 4.2 (915), 4.6 (991), 5.2–5.5 (1050–1098), 6.1 (1224), 6.3 (1259), 6.5 (1284), 6.7 (1303), Layer 8 §§8.2–8.5 (1606–1673), 9.6 (1866); ArithmeticGaloisRepresentations (cdbe447) §§7.4 (4364), 7.5 (4541), 7.9 (4904), 7.11 (5059); AutomorphicFormsOnReductiveGroups (753cac0) §§7.4 (1220), 7.5 (1247); AutomorphicGaloisRepresentationsPartII (902b706) *GSp₄ construction and normalization* (537), AG2.2 *Twisting…* (1286), AG2.3 *Arbitrary regular conjugate-self-dual existence* (1365, "prime ℓ" unrestricted), AG2.5 *Caraiani's full away-prime compatibility* (1858, every ℓ) and *Temperedness…* (2013); PotentialAutomorphyInfrastructure (0f3131e) §§3.44 (1779), 3.47 (1838); SmoothRepresentationsOfLocalGroups (4178a1e) §SR.3.2 (2691); ModularityAndLanglandsExtensions (e3a0748) §3.9 (1883); AutomorphicBundles (fd74684) Layer 12 (R04); PotentialAutomorphyInfrastructurePartII (board design): PL.0, PL.1, PL.2 (*Algebraic modular forms* hypothesis 1 "l odd", line 932; *Galois representations attached to constituents*, 1063; *Base change and descent*, 1130, no parity condition), PL.3 *Taylor–Wiles data when F contains ζ_p, including p = 2* (1606: O-coefficients, GHT-adequacy, q = h¹ − 1), PL.4 (*Strong residual oddness*, 1793; *Adequacy relaxed*, 1877). The two downstream roadmaps: GSp4NonregularModularityLifting (11b3de3) cites §§1.3, 2.1–2.2, 3.1–3.2, 4.7–4.8, 5.2, 5.4–5.6, 6.3–6.4 of this roadmap (its lines 174–180); AbelianSurfacesModularity (ce7b798): R09.

**Duplication by object** (`roadmaps grep` over main and the 457 open heads): "nearly adequate" (only uses in AbelianSurfacesModularity and the GSp4NonregularModularityLifting contract), "GSp₄-reasonable" (R09), "Thorne's complex" (no match), "Theorem 5.7.14" (only GSp4NonregularModularityLifting citing this roadmap), "Theorem 6.3.4" (other sources' theorems with that number), "sufficiently deep" (unrelated uses), "universal ordinary Hecke algebra" (AutomorphicCongruences for a different Hecke algebra; GSp4NonregularModularityLifting citing this roadmap), "Hilbert–Siegel … Hida" (no match). The l = 2 constituent representations, the dyadic Ĝ_n problems over Λ, GSp₄-reasonableness and the two end theorems have no other owner. Ownership against the open pull requests the brief names was checked through the same grep.

**Gaps (7).** Each has a named supplier earlier in the order, the same slug in `plan.json` and the README, a section that exists at the supplier's copy (AutomorphicBundles under its new name, R04), and one `needs` with hypotheses (R11 restores one): `dyadic-flag-ring-dimension` (§6.24 gives ρ̄ = 1 and large degree only; Ger19 Lemma 3.2.3 at line 1582 is a route), `gsp4-semisimple-taylor-wiles-places` (§2.17 is for four distinct eigenvalues; L_v^⊥ = H¹_ur(F_v, M_v^∨(1)) is WHI22 (3.5)), `inertial-types-and-block-levels` (clause (i) forgets N, as the GL₂ Steinberg Check requires), the three `hilbert-siegel-*` gaps (AutomorphicBundles Layer 12 has no Hilbert–Siegel variety and no Hida theory; WHI22 Propositions 7.5–7.6 at lines 3104–3113; BCGP21 §7.9), `gsp4-galois-representations-totally-real` (the supplier section is over ℚ; BCGP25 Theorem 1.8.17 is for ordinary weight 2). None is unowned, compound or already provided.

**Shape.** Every definition (1.1, 1.3, 2.1, 3.1, 3.5, 4.2's data, 5.1, 5.2, 5.4, 5.5) has an API list and three to five Checks; every theorem its hypotheses and a locator; every layer ends with Examples and Dependencies; Unicode mathematics with ASCII in code spans; no target tables or field lists; `metadata.toml` has `topic = "math.NT"`; the manifest records every cited work once, with no local path. Convention witnesses recomputed in the suppliers: geometric Artin maps and inverse cyclotomic similitude (WHI22 line 3319; LocalGaloisDeformationRings §1.3), the Hecke polynomial `Σ(−1)^j q^{j(j−1)/2}T^jX^{n−j}` (BCGP25 line 6070; Ger19 Prop. 2.7.2), dim Λ = 1 + nd ((5.7.17), line 6179).

## Not verifiable

- **The rank-one step of 3.2(b)** (R02): no cached or legal source states it; I reduced it to the torsion-freeness condition recorded in R02 and could neither prove nor refute that condition in general. The statement (b) is BCGP25 Lemma 5.7.7, cited by its locator; the roadmap records that the source's proof is one relation short. The intake's acceptance of the design left this to a human; it stands.
- **Geraghty, published version** (Math. Ann. 373): paywalled; the preprint numbering is used with the manifest's concordance.
- **Labesse (Corollaire 5.3, Théorème 5.4) and Chenevier–Harris (Theorem 3.2.5)**, entering 2.3 through the proof of Ger19 Proposition 2.7.2 (line 1087): not in the manifest and not opened; they are cited through Ger19 and the suppliers PL.2 and AG2.3, which own them.

## Source issues

- **Gap** in BCGP25 at Proposition 5.7.9, printed page 134: the source asserts a maximal ideal m with a surjection from the global ring onto the localized ordinary Hecke algebra for every level with hyperspecial U_v off T and Iwahori-contained U_v on R; it should assume that some form with residual representation ρ̄ has U_v-fixed vectors at the places of T outside R ∪ S_2 (its uses on pp. 136 and 139 do); affects a stated result.
- **Error** in BCGP25 at §5.4, printed page 123: the source says the cohomology of Thorne's complex vanishes outside degrees 1 and 2 when T is nonempty; it should give h³ = h⁰(F(S)/F⁺, ad r̄(1)) = 1 at p = 2 (Tho17 Lemma 2.15, used in Thorne's own proof of Proposition 2.21); affects a stated result.
- **Gap** in BCGP25 at Lemma 5.7.7, proof, printed pages 133–134: the source bounds the relations by n²#T + [F⁺:ℚ]n(n−1)/2 as in CHT08 Corollary 2.2.12; it should carry the −h⁰(ad r̄(1)) term of CHT08 Corollary 2.3.5, which makes the count dim Λ − 1 at p = 2; affects the proof.
- **Misprint** in BCGP25 at Lemma 5.7.7, statement, printed page 133: the source prints dim Λ = 1 + [F:ℚ]n; it should be 1 + [F⁺:ℚ]n, as (5.7.17) uses; affects nothing.
- **Gap** in BCGP25 at Lemma 5.7.7, proof, printed page 133: the source takes equidimensionality of the local ring from Proposition 5.6.6, stated for trivial residual representation and large local degree, while the lemma is applied on page 139 at the unprepared field; it should use only a lower bound valid for every residual representation; affects the proof.
- **Misprint** in BCGP25 at Remark 5.4.4, display (5.4.5), printed page 124: the source ends the inflation–restriction sequence in H² with trivial coefficients; it should be H²(F(S)/F⁺, ad r̄); affects nothing.
- **Gap** in BCGP25 at Remark 5.4.4, printed page 124: the source deduces surjectivity of restriction from injectivity into H² with trivial coefficients at a real place; injectivity into H²(F⁺_v, ad r̄) is needed, which holds exactly when r̄(c_v) = (B, 1)j has B not alternating; affects nothing.
- **Misprint** in BCGP25 at proof of Lemma 5.5.3, printed page 125: the source assumes K⁺_{m−1} ⊆ F⁺ ⊊ K⁺_m; it should choose the least m with K⁺_m ⊄ F⁺, most F⁺ lying in no K⁺_m; affects nothing.
- **Misprint** in BCGP25 at proof of Lemma 5.5.3, printed page 126: the source attributes the class of ψ to L/L⁺ and calls L⁺/L unramified outside 2; it should be L⁺/F⁺ in both places; affects nothing.
- **Misprint** in BCGP25 at Proposition 5.5.6 (i), printed page 126: the source writes µ(c_v) = −1; it should be χ(c_v) = −1, χ the multiplier of 𝒮; affects nothing.
- **Misprint** in BCGP25 at (5.7.3), printed page 131: the source ends the sequence defining T(l) in a product of k(v)^×; it should be a product of T(k(v)) = (k(v)^×)^n; affects nothing.
- **Misprint** in BCGP25 at §5.7, the module M_λ, printed page 130: the source takes the tensor product over τ ∈ S̃_2; it should be over the embeddings Ĩ_2 inducing those places; affects nothing.
- **Misprint** in BCGP25 at §5.6.1, printed page 129: the source evaluates the characters χ_{v,j} at the Artin map of an inertia element; it should be the inverse Artin map, as in Ger19; affects nothing.
- **Misprint** in BCGP25 at §5.4, printed pages 121–122, and Definition 6.1.4, printed page 141: the source writes the global representations with domain G_F; it should be G_{F⁺,S}, and in §6 the base field is F⁺; affects nothing.
- **Misprint** in BCGP25 at proof of Theorem 5.7.14, printed page 137: the source says Spec R_X lies in the support of H′_{1,∞}, a module introduced only after the second base change; it should be the support of H_1; affects nothing.
- **Misprint** in BCGP25 at proof of Theorem 5.7.14, printed page 138: the source replaces T by T′ = R′ ∪ {v′₁} over L; it should include the places of L⁺ above 2, keeping the ordinary condition; affects nothing.
- **Gap** in BCGP25 at proof of Theorem 5.7.14, preparation list, printed page 135, and final step, printed page 139: the source does not ask the preparation to make lifts at T ∖ S_2 unipotently ramified, yet maps R′_{L/F,T′} to R^{T,ord} by the choice of L; it should add that every lift of the original local representation becomes unipotently ramified over the prepared field (Lemma 5.6.2); affects the proof.
- **Misprint** in BCGP25 at §6.3, paragraph before S_1, printed page 147: the source specifies the unramified characters by α_p and β_p; it should be α_v and β_v, the stabilization at v; affects nothing.
- **Gap** in BCGP25 at Hypothesis 6.3.1 and the paragraph before it, printed page 146: the source allows π of regular weight but takes ρ_{π,p} from Theorem 1.8.17, stated for ordinary weight 2; it should cite a regular-weight construction over F⁺; affects nothing.
- **Gap** in WHI22 at Proposition 3.18, printed page 22 (arXiv v3): the source assumes condition 2 of Definition 3.15 and the conditional H¹ vanishing; its proof uses Lemma 3.16, which also assumes H⁰(ρ̄(G_{F(ζ_{p^n})}), ĝ^{0,∨}) = 0; affects a stated result (Definition 3.19 includes 1a, so the theorems using it are unaffected).
- **Misprint** in Tho17 at §2.2, definition of C^i_{𝒮,T} for i ≥ 3, printed page 8: the source sums the local terms over C^{i−1}(F(S)/F⁺, ad r̄); it should be C^{i−1}(F⁺_v, ad r̄), as BCGP25 page 122 notes; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "42d905b759591890d5819f7082d803466bc7a856", "job": "REV-PKG-OrdinaryAutomorphicFormsAndModularityLiftingPartII", "model": "fable", "worker": "chris-x9"} -->
