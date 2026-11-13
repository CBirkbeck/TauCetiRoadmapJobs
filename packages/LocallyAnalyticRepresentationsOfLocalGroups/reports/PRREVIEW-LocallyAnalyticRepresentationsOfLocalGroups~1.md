# Review of LocallyAnalyticRepresentationsOfLocalGroups (pull request #2294 at 3a7730d)

**Verdict:** needs changes

## R01 (P2) — Two supplier gaps ask PadicLocalLanglandsForGL2Qp for what LocallyAnalyticDistributionsPartII §§1.4–1.5 already state

**Location** `TauCetiRoadmap/LocallyAnalyticRepresentationsOfLocalGroups/README.md` lines 86 and 88: "What PadicLocalLanglandsForGL2Qp must provide (gap:frechet-stein-general): the coadmissible-module theory of §0.1 for an arbitrary left K-Fréchet–Stein algebra", and "(gap:radius-algebras)"; also line 21 and the *Needs:* lines of 1.1, 1.2, 1.4, 1.5, 1.8.

**Claim** Both contracts are unowned at the suppliers and must be requested from PadicLocalLanglandsForGL2Qp §0.1.

**Witness** LocallyAnalyticDistributionsPartII at its open head, `README.md` line 58: the arbitrary Fréchet–Stein coadmissible theory "is §1.4 of this roadmap", the Banach stages in ordered coordinates "§1.5"; §1.4 (line 197) lists Theorems A and B, Corollaries 3.1–3.5, Lemmas 3.6 and 3.8; §1.5 (line 217) the norms ‖·‖_r under (HYP). Neither slug is in `design/plan.json`.

**Repair** Delete both "What PadicLocalLanglandsForGL2Qp must provide" paragraphs. Add to the LocallyAnalyticDistributionsPartII contract: "§1.4: Fréchet–Stein algebras over a discretely valued field and their coadmissible modules (Theorems A and B, base change A_n ⊗_A M ≅ M_n, the canonical Fréchet topology, closed = coadmissible submodules, finitely generated and finitely presented modules, change of algebra along A → B with B coadmissible). §1.5: the Banach radius algebras D_r(H, E) in ordered coordinates under (HYP), noetherian, the Banach stages of D(H, E)." Replace "gap:frechet-stein-general" by "LocallyAnalyticDistributionsPartII §1.4" and "gap:radius-algebras" by "LocallyAnalyticDistributionsPartII §1.5" in 1.1, 1.2, 1.4, 1.5, 1.8 and the Layer 1 Dependencies; in line 21 replace "requested from the same section as supplier gaps" by "(LocallyAnalyticDistributionsPartII §§1.4–1.5)".

## R02 (P2) — Sections 3.2, 3.4, 3.6 and 3.8 follow BCGP25 §§2.2.16–2.2.27 clause by clause

**Location** `README.md` line 691 (3.4): "Let M be a locally profinite group, viewed as a condensed group, E[M] its condensed group ring and E_■[M] its solidification: for compact M, … in general …"; line 724 (3.6, proof route); line 660 (3.2); line 748 (3.8, definition).

**Claim** The definitions and the proof route are in the roadmap's own words.

**Witness** BCGP25 lines 1044–1054 (3.4: seven clauses in the same order; longest shared run 8 words, "an action map M × V → V of condensed sets"); BCGP25 lines 1067–1071 (3.6: four proof steps in order, same intermediate identity); lines 1023–1038 (3.2); lines 1101–1109 (3.8).

**Repair** Replace the four passages.

3.4: "For a locally profinite group M, the coefficient algebra is the object E_■[M] of Mod(E) representing V ↦ V(M), the maps of condensed sets M → V; its product is induced by the group law, and it is the solidification of the condensed group ring. Prove: for M compact it is the rational Iwasawa algebra (lim_N O_E[M/N])[1/p], N open normal, with its weak topology; for a compact open M_0 ⊆ M it is the direct sum of the translates δ_m·E_■[M_0], m ∈ M/M_0. Mod_M(E) is the category of E_■[M]-modules in Mod(E); by the representing property, such a module structure on V is the same datum as a condensed action M × V → V."

3.6, proof route: "A smooth object is the union of its subobjects V^N, so it suffices to produce the action of a compact open M_0 on each V^N, N ⊆ M_0 open normal, compatibly in N. There the abstract group M_0 acts through the finite group M_0/N, and a module over E[M_0/N] does not see whether M_0 is discrete or profinite; this gives the E_■[M_0]-structure, and coset representatives of M/M_0 give the E_■[M]-structure, inverse to restriction."

3.2: "A solid representation of 𝔾 is a comodule in Mod(E) over the Hopf algebra O_𝔾: a solid V with c : V → V ⊗_E O_𝔾, coassociative for the comultiplication μ and counital for evaluation at the identity. D(𝔾) := Hom_E(O_𝔾, E) is an algebra by transposing μ, and contracting the O_𝔾-factor of c against a distribution makes every comodule a D(𝔾)-module."

3.8: "The solid space O_(𝔾_r,E) ⊗_E V of V-valued analytic functions on 𝔾_r has three commuting M_r-actions: on the argument from either side (∗_l, ∗_r) and on the values (∗_V). V^(M_r-an) := H^0(M_r, O_(𝔾_r,E) ⊗_E V) for ∗_l ⊗ ∗_V is the space of analytic orbit maps; ∗_r remains, and the value at e, taken at the same radius r, embeds it in V. V^la := colim_r V^(M_r-an)."

Merge 3.5–3.7 into one section "Smooth vectors and the Grothendieck category of smooth representations", so that the section sequence is no longer BCGP25 §2.2.23, Lemma 2.2.24, Lemma 2.2.25 one for one; keep RJRC22 §1.2.2 (line 119) and Definition 4.40 (line 1942) as the locators of 3.4 and 3.8.

## R03 (P2) — Two declared gaps ask LocallyAnalyticDistributions for what Mathlib and its own §0.0 provide

**Location** `packages/LocallyAnalyticRepresentationsOfLocalGroups/design/plan.json`, `gaps`: `barrelled-banach-steinhaus` ("… and the Banach–Steinhaus theorem that pointwise bounded families … are equicontinuous") and `compact-type-tensor` ("… agree, are of compact type, have strong dual …"), against `README.md` lines 70 and 72.

**Claim** The `needs` sentences announced to the supplier are minimal.

**Witness** `Mathlib/Analysis/LocallyConvex/Barrelled.lean` lines 122 (`BaireSpace.instBarrelledSpace`) and 192 (`PolynormableSpace.banach_steinhaus`) at the pin; LocallyAnalyticDistributions `README.md` line 989, *Compact-type tensor comparison*. README lines 52, 68, 70, 72 say so themselves.

**Repair** Replace the two `needs` by the README's sentences: line 70 from "for nonarchimedean locally convex E-spaces" to "inductive limits of barrelled spaces"; line 72 from "for spaces of compact type" to "nuclear Fréchet spaces".

## R04 (P3) — 3.2 calls a quasi-compact affinoid group Stein

**Location** `README.md` line 660: "Let 𝔾 be a Stein analytic group over Spa(E, O_E): the analytification of an affine algebraic group over E, or a quasi-compact affinoid open subgroup of one".

**Claim** Both cases are Stein in the sense of AdicSpacesPartIII §R3.4.

**Witness** 𝔾 = ℤ_p + p𝔻 (3.2, Checks; 3.3): an increasing affinoid cover of a quasi-compact 𝔾 is eventually 𝔾, and 𝔾 is not relatively compact in itself. The README's own 3.3 Check opposes "Stein, not quasi-compact".

**Repair** "Let 𝔾 be a quasi-Stein analytic group over Spa(E, O_E) (AdicSpacesPartIII §R3.4, *quasi-stein-space*) of one of two kinds: the analytification of an affine algebraic group over E, which is Stein, or a quasi-compact affinoid open subgroup of one"; retitle 3.2 "Solid representations of an analytic group" and the Layer 3 introduction accordingly.

## R05 (P3) — Layer 4 Dependencies cites LieHighestWeight layers that no target uses

**Location** `README.md` line 912: "LieHighestWeight Layers 3, 4, 5, 7, 9".

**Claim** Layer 4 consumes LieHighestWeight Layers 4 and 5.

**Witness** No *Needs:* line of 4.1–4.6 and no supplier contract (line 116) names Layer 4 or 5. On main, `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md` line 79 has Layer 4 only as a table row deferring to Tau Ceti.

**Repair** "LieHighestWeight Layers 3, 7, 9".

## R06 (P3) — The description's validation sentences do not describe the head

**Location** Pull request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim** The file has declarations and a `sorry` warning.

**Witness** `Suggested.lean` at the head is a module docstring and an empty namespace (lines 51–53); `lake env lean` on it prints nothing.

**Repair** "`Suggested.lean` declares nothing: its docstring names each headline and the carrier it lacks. The targeted Lake build succeeds with no warning."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 0.1 (iv) splitting, BR16 (3) | L = ℚ_p(√p), E ⊇ L | √p ⊗ 1 ↦ (√p, −√p); BR16 line 255, p. 7 | holds |
| 0.6 duality, ST02 Cor. 3.3 | χ(x) = x on ℚ_p^×; V = 0 | dual line: δ_x ↦ x⁻¹; ST02 line 553, p. 14 | holds |
| 1.3 anti-equivalence | G discrete; G non-compact | H = 1: coadmissible = finite-dimensional; D(G, E) free of infinite rank over D(H, E) | holds |
| 1.8 Ext¹ = extensions, BR19 Lemme 2.1.1 | G = ℚ_p^× | Hom(ℚ_p^×, E) = ⟨val, log_p⟩, dim 2; smooth part dim 1; BR19 line 405, p. 10 | holds |
| 1.10 (2), SCH11 Prop. 4.7 | GL_2(ℚ_p), W_i = 1; generic principal series | H¹ = H² = 0 so n ≤ 2 only row q = 0; Hom_sm(PGL_2, E) = 0; n − 1 ≠ 0 | holds; printed form fails |
| 2.3 R^iLA, PAN22 Def. 2.2.1 | G finite; B = C(ℤ_p, E) | G_0 = 1; R⁰ = C^la; PAN22 lines 537–545, pp. 12–13 | holds |
| 2.5 strong LA-acyclicity, PAN22 Thm 2.2.3 | c_0 with trivial ℤ_p-action | not admissible (dual not finitely generated); covered by E ⊗̂ c_0(ℕ, ℚ_p); PAN22 line 581 inclusions | holds |
| 3.1 solid duality, RJRC22 Thm 3.40 | V = c_0(ℕ, E) | V^∨ = (∏ O_E)[1/p] ≠ ∏ E; Hom(V, V) ∌ id in V^∨ ⊗ V; RJRC22 lines 784, 1279 | holds |
| 3.2 comodules, BCGP25 §2.2.16 | 𝔾 = ℤ_p + p𝔻, character trivial on p²ℤ_p | constant on infinitely many points of p𝔻 ⇒ constant; contradiction | holds; see R04 |
| 3.5 λ-smooth, BCGP25 Def. 2.2.26 | x^k on ℤ_p^×, k ≠ 0 | not smooth; x^k ⊗ x^(−k) trivial, smooth | holds |
| 3.7 Grothendieck category, BCGP25 Lemma 2.2.25 | M = 1 | generators E_■[S]; Hom = V(S) | holds |
| 3.8 solid analytic vectors, RJRC22 Def. 4.40 | M_0 = ℤ_2, 𝔾_1 = 2𝔻 | O(𝔾_1) has 2 idempotents, O(M_0·𝔾_1) has 4 | holds |
| 4.4 BGG duality, BR15 line 592 | gl_2, λ = (1, 0) | L^∨ weight (1, 0); contragredient −w_0λ = (0, −1) | holds |
| 4.5 / 4.6 weights | gl_2, λ = (1, 1) and (k, 0) | s·λ = (0, 2); H_1(𝔫⁻) weight (−1, k+1); H_1(𝔫) weight (k+1, −1) | holds |
| 5.3 torus Ext, DING25 line 779 | n = 0, 1, 2; d_L = 1, 2 | n(1+d_L): 6; Hom_g′: 0 (n = 0), n + d_L = 4; Hom_σ(L^×) = 2 | holds |
| 5.5 spectral sequence, SCH11 Cor. 4.9 | GL_2(ℚ_p), Σ = 1, ρ = z^((0,2)) | H_0, H_1 weights (0,0), (−1,1) ≠ (0,2): Ext = 0 | holds |
| 6.3 / 6.4 irreducibility | unnormalised Ind_(B⁻) of GL_2, χ_1 = χ_2; χ_1χ_2⁻¹ = \|·\| | normalised ratio (χ_1χ_2⁻¹)\|·\|: reducible iff ratio ∈ {1, \|·\|⁻²}; π = 0 gives F = 0 | holds |
| 6.7 Ext¹ vanishing, DING19 Lemma 2.26 | n = 2: d_L = 1, 2 | no s of length 2 for d_L = 1; (s, s) for d_L = 2; DING19 line 1084, p. 29 | holds |
| 7.1 / 7.4 adjunctions, Convention 5 | GL_2(ℚ_p), m = diag(p, 1) | index p, δ_B(m) = p⁻¹, average = 1; Hom_T(δδ_B, V_N) from normalised second adjointness | holds |
| 8.1–8.3 characters | n = 2, 3 | η = \|det\|^((n−1)/2)δ_(B⁻)^(1/2); ηz^λ = z^h·ε(t_2) for n = 2; (1 2 3)(φ) = φ_3 ⊠ φ_1 ⊠ φ_2 | holds |
| 8.5 labels, DING25 line 1505 | n = 3, w = (1 2 3), w′ = (2 3)w | w⁻¹(1) = w′⁻¹(1) = 3; w(1) = 2, w′(1) = 3 | holds with w⁻¹ |
| 8.7 π_1, DING25 (3.2)–(3.3), BH20 Prop. 5.9 | n = 1, 2, 3 | lengths 1, 1 + 2d_L, 1 + 6d_L; DING25 lines 1525–1537; BH20 line 1236 | holds |
| 8.8 (2) transition | n = 3, φ(3) = (2, 4, 8) | symmetric values (14, 56, 64), first-order (2, 24, 64) on both sides | holds |
| 8.12 dimension | n = 1, 2, 3; d_L = 1, 2 | (n + d_L) + (2^n − 2)d_L: 2, 5, 10; 8 for n = d_L = 2 | holds |
| 9.4 / 9.6 parabolic | n = 3, blocks (2, 1), L = ℚ_p; P = B, G | 3 + 2 + 2 = 7 both sides; n(1 + d_L); n + (2^n − 1)d_L | holds |
| 9.7 endpoints | n = 2, 3 | 2(n + 2d_L + (2^(n−1) − 2)d_L) − (n + d_L) = n + (2^n − 1)d_L; labels split 3 + 3 | holds |
| 10.3, DING25 Lemma 3.15 | n = 1, 2; d_L = 2 | (n − 1) + 2 = n + 1: 2, 3; full Ext¹ = 4; DING25 line 1962 | holds |
| 10.5 / 10.6, DING25 Prop. 3.19 | n = 2, d_L = 2; blocks (2, 1) | 5 per σ; (5 − 2)·2 = 8 − 2; Σ(n_i + 2^(n_i) − 1) = 7; DING25 line 2027 | holds |

- Source locators checked against the text: 59, in DING25, DING19, ST02, BR19, BR16, BR15, PAN22, CD14, RJRC22, BCGP25, BH20, SCH11; all found at the page cited.
- Library declarations opened at the pins: `Barrelled.lean` lines 90, 122, 164, 192; `LocallyConvex.lean` line 51; `Ext.lean` line 41; `Ext/Basic.lean` line 118; `ContCohomology/Basic.lean` line 131; `DualNumber.lean` line 46; `UniversalEnveloping.lean` lines 65, 92; `LieGroup.lean` line 72; the eight Tau Ceti declarations of the contract.
- Cross-roadmap citations resolved at main or the open heads: the section and target ids of all 14 supplier roadmaps named in the contracts; all exist except as R01 and R05 say.
- Gate: every check passed. `gate --depcheck`: `depcheck: 239 roadmaps, 2171 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output; no declaration, so no `#check` comparison and no one-tactic probe apply.
- Headlines (1.3, 1.8, 2.5, 3.7–3.8, 5.5, 6.4–6.5, 7.4, 7.6, 8.10–8.14, 9.6, 10.5): none statable; the pins have `LocallyConvexSpace` only over ordered scalars, Verma modules only for Killing algebras, no D(G, E), no solid E-vector spaces. The docstring names each.
- Declared gaps kostant-split-reductive, generic-principal-series-, principal-series-jacquet-, finite-length-finite-coefficients, ordered-character-map: same slug in plan and README, supplier sections exist (ALS.4.5, SR.2.2, SR.3.1, SR.3.2), each precise; conditional on them.
- Overlap check: read PadicHodgeParametersInLocallyAnalyticRepresentations, LocallyAnalyticDistributionsPartII, ModpRepresentationsOfGL2OverLocalFields, CompletedCohomologyAndLocalGlobalCompatibility, PadicLocalLanglandsForGL2Qp; Fréchet–Stein coadmissible theory and the radius algebras D_r: owner LocallyAnalyticDistributionsPartII §§1.4–1.5 (R01); category O of split reductive Lie algebras: owner here (PadicFamiliesPartII and SpringerResolutionAndCharacteristicCycles cite §4.2); nothing else shared.
- Source independence: 26 passages compared with 12 sources, 4 shared (R02, all BCGP25); largest share DING25, about 55 of about 235 locators; contents compared with DING25: independent (Layers 0–7 match no section; Layers 8–10 lie in its §3.1, in the order that 9.1 needs 8.7 and 10.6 needs 9.6 force).

## Not verifiable

- SCHN11 (§13, p. 90; Proposition 6.4, pp. 42–43, cited in 0.1): uncertified, text not read.
- HUM08 (Theorems 3.3, 4.6, 5.1, §§9.3–9.4, cited in 4.3–4.5): uncertified, text not read; 4.4 was checked through BR15 line 592.
- NFA02 (§6, cited in the barrelled gap): uncertified, text not read.

## Source issues

- **Misprint** in DING25 at the paragraph after Proposition 3.1 and Lemma 3.2, p. 37: the source says the label of C(w, s_(i,σ)) is the image of {1, …, i} under w; it should be the inverse image, as Proposition 3.1(4) requires; affects a stated result.
- **Misprint** in DING25 at (3.1) and Lemma 3.2, p. 37: the source says the inducing character has weight −s_(i,σ)·λ; it should be +s_(i,σ)·λ, the negative weight being the category-O argument; affects a stated result.
- **Misprint** in DING25 at Lemma 3.2(1), p. 37: the source says the Hom is over the ℚ_p-points of the torus; it should be over T(K); affects nothing.
- **Misprint** in DING25 at (3.12), pp. 41–42: the source says I runs over subsets of {1, …, n − 1}; it should be subsets of {1, …, n}, as the count (2^n − 2)d_K needs; affects a stated result.
- **Misprint** in DING25 at the line before (3.3), p. 38, and §3.1.4, p. 48: the source says the amalgam is over π_alg(φ, λ); it should be π_alg(φ, h); affects nothing.
- **Error** in SCH11 at Proposition 4.7(2), p. 80: the source says Ext^n with fixed central character vanishes for n ≤ i_0 + 2, n ≠ i_0; it should be Ext^n ≅ smooth Ext^n for n ≤ 2, as its spectral sequence (4.27) gives; affects a stated result.
- **Misprint** in BCGP25 at §2.2.27, p. 23: the source says evaluation at the identity is on functions of a second radius r′; it should be the radius r of the vectors being defined; affects nothing.
- **Error** in BCGP25 at §2.2.16, Definition 2.2.17 and Remark 2.2.18, p. 21: the source says a quasi-compact affinoid open subgroup is a Stein group; it should be quasi-Stein, since an affinoid is not relatively compact in itself; affects nothing.

## For the human reviewers

- Licence: EMJ2 (Emerton, Jacquet modules II) is cited as an unpublished preprint from the author's page (`README.md` line 1747); 7.2–7.5 and 8.6 rest on it.
- Licence: BCGP25 is an arXiv preprint (`README.md` line 1760) and the main source of Layer 3; OR19 (line 1750) is an arXiv preprint cited for 6.5 (4).
- Not tested: SCHN11, NFA02 and HUM08 are uncertified books; wording was not compared with them.
