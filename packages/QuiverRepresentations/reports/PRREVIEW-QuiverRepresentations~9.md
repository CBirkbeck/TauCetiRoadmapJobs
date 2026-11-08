# Review of QuiverRepresentations (pull request #1526 at eaba7a0)
Folder: `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/`

**Verdict:** needs changes

Two P2 and two P3. README and Suggested.lean below are the two files of the folder above; README line numbers are at `eaba7a0`. Library paths beginning `TauCeti/` and `Mathlib/` are at the pins of the pull request's `lake-manifest.json` (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`, unchanged since the previous review). Main is `eaf17b1`.

## Previous findings, checked first

The previous review (at `9044327`) had six findings. All six are repaired.

| Previous finding | Passage at this head | Disposition |
|---|---|---|
| R01 (P1) gate build counter failed on lake's `module` advisory | Suggested.lean:1 “module” | **Repaired.** The worker's gate at this head and a rerun here both end `OK`; `lake env lean` on Suggested.lean exits 0 with four `sorry` warnings (lines 52, 68, 77, 90) and nothing else. |
| R02 (P2) Layer 6 planned objects owned by ArtinAlgebras | README:64–67 “ArtinAlgebras, §4.2 and §§5.1–5.3, owns the stable equivalence τ : E/[P] ≌ E/[I] … both Auslander–Reiten formulas and the valued Auslander–Reiten quiver with its mesh” | **Repaired.** The stable-equivalence target, the companion formula and the valued mesh are gone from §§6.1–6.4; `projectiveFactorIdeal`, `injectiveFactorIdeal` and `exists_stable_translate_equivalence` are gone from Suggested.lean, whose docstring (lines 30–32) states the deferral. No `*Needs:*` edge to ArtinAlgebras was added. |
| R03 (P3) dropped ids 6A–6F and `arQuiver k A` had no old → new map | README:782–794 “6A, the radical and irreducible morphisms → §6.4 … `arQuiver k A` → the pinned `TauCeti.IrreducibleMorphismQuiver` with `ModuleCat.arTranslation`” | **Repaired.** Every id ArtinAlgebras cites on main (its lines 54, 60, 224, 859, 950, 1239) now has a target section. |
| R04 (P3) statement-hygiene: unmarked isomorphism named as a comparison | Suggested.lean:77 `nonempty_homDifferential_coker_linearEquiv_ext`; README:631, 641 | **Repaired.** Gate `statement-hygiene=0`. |
| R05 (P3) §4.1 restated the pinned bimodule resolution and Hom-cocycle Ext¹ | README:248–264 (contracts) and 609–634: “is the pinned standard bimodule resolution of kQ … tensored over kQ with M. Prove that identification” | **Repaired.** Every declaration named there exists at the pin (BimoduleResolution.lean:174, 461, 489, 508, 524, 649, 655; `Algebra/Module/HomCocycle/Basic.lean:41`; `Algebra/Category/ModuleCat/HomCocycle.lean:51, 71, 93, 120`), and the statements match the README's description (P₀ projective; no injectivity of f, no projectivity of P₁). |
| R06 (P3) manifest-status wording “cited by locator only (uncertified)” | README:945–948 | **Repaired.** The sentence is gone. |

The folder changed by 330 lines since `9044327`; this is a full review of all 954 README lines and 104 Lean lines.

## R01 (P2) — RootSystems is cited by layer numbers it no longer has

**Location:** README:57–58, “[RootSystems](../RootSystems/README.md), Layers 1, 2 and 5, owns positive roots, Weyl actions and finite-type root-system realization”; README:349–350, “Consume … Layer 5's finite-type classification and realization”; also README:741, 761, 778.

**Claim:** RootSystems Layers 1, 2 and 5 own and supply the positive roots, Weyl action and finite-type realization used by §5.1 and the headline `exists_rootPairing_titsForm` (§5.2).

**Witness:** main's `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md` (renumbered by commit `03a683f6`, 2026-11-04) has only Layer 1 (Coxeter geometric signs, line 248), Layer 2 (marked Weyl presentation, 432), Layer 3 (classification, 504); its lines 13–19 call positive roots and rational models consumed, “not additional construction targets”.

**Repair (tested):** repoint every citation. At README:57–58: “RootSystems, §3.1, owns the base-independent and rational classification of finite root systems; positive roots, Weyl groups and the numbered rational models are native (`TauCeti.posRoots`, `RootPairing.weylGroup`, `TauCeti.DynkinType.rationalRootSystem`).” Add these, with `TauCeti.DynkinType.rationalBase` and `TauCeti.DynkinType.cartanMatrix_rationalBase`, to the Mathlib and Tau Ceti contracts with their files (`Mathlib/LinearAlgebra/RootSystem/WeylGroup.lean:55`; `TauCeti/LinearAlgebra/RootSystem/Positive.lean:131`; `TauCeti/LinearAlgebra/RootSystem/SimplyConnectedRootDatum/Rational.lean`, lines 80, 95 and 243 at the pin). Replace the RootSystems contract at 349–350 by “Consume §3.1: the classification of finite reduced crystallographic root systems independent of a base, and over ℚ up to isomorphism” (or drop RootSystems as a supplier if the §5.2 route does not identify the root set with a native model). At 741 write “`TauCeti.posRoots` supplies positive-root language”; at 761 and 778 “RootSystems §3.1”. A scratch copy of the README with exactly these replacements passes the dependency check (`depcheck: 243 roadmaps, 2459 edges, 0 problem(s)`), and all 151 of its backticked names resolve at the pins.

## R02 (P2) — §3.1's duality exchange is ArtinAlgebras §2.3 at R = k

**Location:** README:466–469, “What is new is the duality exchange. Prove that the k-dual D = Homₖ(−, k) … carries a projective cover P → D M of the right module D M to an injective envelope M → D P”; the presentation exchange, README:491–508; README:189–190, “§3.1 proves that exchange”.

**Claim:** this roadmap owns the k-duality exchange of projective covers with injective envelopes, and of minimal projective with minimal injective presentations.

**Witness:** main's `TauCetiRoadmap/RepresentationTheory/ArtinAlgebras/README.md` §2.3 (lines 628–641): `D_R` exchanges f.g. left/right modules and projectives/injectives; every f.g. `M` has injective hull “`D_R` of a projective cover of the right module `D_R M`”. With `E_k = k` (its Conventions 6) this is §3.1.

The two roadmaps even share the test case: ArtinAlgebras' §2.3 Check “for `A = k[ε]/(ε²)` … the injective hull of `k` is `A`” is this roadmap's second §3.1 Check (README:484–486). ArtinAlgebras' scope (its lines 54–60) makes its general constructions replace the field ones. Two roadmaps on main therefore own one object. ArtinAlgebras lists this roadmap among its suppliers (its line 224), so the object cannot be imported here by a `*Needs:*` edge. The fix is a deferral, as with Layer 6.

**Repair (tested for direction):** append to the ArtinAlgebras sentence at README:64–71: “ArtinAlgebras §2.3 likewise owns the duality between finitely generated left and right modules, its exchange of projectives and injectives, and injective hulls as duals of projective covers.” Delete, in §3.1, the sentence beginning “What is new is the duality exchange” through the end of its paragraph (466–469), the duality-exchange API and its three Checks (471–487; the A = k and zero-module Checks may stay, reworded as Checks of the pinned `TauCeti.IsInjectiveEnvelope`), and the presentation-exchange sentence, API and Checks (491–508). Keep the consumed envelope sentence and the pinned `TauCeti.IsMinimalInjectiveCopresentation` sentence (489–491, up to “are consumed.”). At 189–190 write “No pinned statement exchanges covers and envelopes under k-duality; ArtinAlgebras §2.3 owns that exchange.” At 786–787 write “6B, minimal projective and injective presentations → the pinned `TauCeti.IsMinimalProjectivePresentation` and `TauCeti.IsMinimalInjectiveCopresentation`, consumed in §3.1”. Nothing else in the roadmap uses the exchange: §§3.2, 3.3, 6.1 and the Layer 6 dependencies (lines 562, 591, 810, 837, 923) use only covers and the pinned envelope. The scratch copy of R01 also carries this sentence; it passes the dependency check with 0 problems.

## R03 (P3) — §6.1's comparison restates pinned declarations

**Location:** README:807–810, “Prove that between finite-dimensional modules it agrees with the quotient by maps through finite-dimensional injectives”, with the API bullets at 814–819; Summary 9–10 and How to read the build 360 list it as this roadmap's own contribution.

**Claim:** identifying the pinned injective-stable Hom with Hom modulo maps through finite-dimensional injectives is new work of this layer.

**Witness:** `TauCeti/CategoryTheory/Exact/Stable/Injective.lean` proves `homCokernelEquivInjectiveStableHom` (line 97) and `injectiveStableFunctor_map_eq_zero_iff_mem_range` (88). Both apply to any inflation into a relative injective. `isZero_injectiveStableFunctor_obj_iff` (76) is the third API bullet verbatim. `Exact/Injective.lean:85` gives `factorsThrough_injective_iff_exists_extension`.

The target follows from these with no new mathematics. A scratch file applies the pinned `homCokernelEquivInjectiveStableHom` to the inflation given by `TauCeti.exists_isInjectiveEnvelope_of_finite`, using `ExactStructure.abelian_isInflation_iff`, `ExactStructure.abelian_isInjective_iff` and `Module.injective_iff_injective_object`. It proves, without `sorry`, that for a finitely generated module M over a finite-dimensional algebra there is a finite-dimensional envelope M → Q with `HomCokernel k (M → Q) N ≃ₗ[k]` the stable Hom from M to N. `lake env lean` exits 0 on it.

**Repair:** add the four declarations to the Tau Ceti contracts. Replace “Prove that … pp.109–110)” by a consumption sentence: “Between finite-dimensional modules this Hom is Homₐ(M,N) modulo maps extending across a finite-dimensional injective envelope M → I (`TauCeti.ExactStructure.homCokernelEquivInjectiveStableHom` applied to `TauCeti.exists_isInjectiveEnvelope_of_finite`), which are exactly the maps through finite-dimensional injectives (ASS IV.2, pp.109–110).” Turn the three API bullets into citations or delete them, and keep the six Checks, which test the pinned objects correctly (values in the table below). In the Summary, “How to read the build”, the Scope sentence at 70 (“adds only the quiver examples and the comparison of §6.1”) and the Layer 6 Dependencies (923), describe Layer 6 as consumption and examples.

## R04 (P3) — ARS IV.4.1 and IV.4.6 are cited for the natural isomorphism; they prove an equality of lengths

**Location:** README:110–111, “ARS is cited for them by locator: … the Auslander–Reiten formula (ARS IV.4.1 and IV.4.6)”; README:847–848, natural in N and in the presentation, “over any field and without minimality (ASS Theorem IV.2.13, pp.117–119; ARS IV.4.1 and IV.4.6)”.

**Claim:** ARS IV.4.1 and IV.4.6 give the arbitrary-field Auslander–Reiten duality as a natural isomorphism.

**Witness:** `ars line 4992` (IV.4.1, p.129) equates lengths of covariant and contravariant defects. `ars line 5081` (IV.4.6, p.131) equates lengths of Ext¹(X,A) and stable Hom. The notes (`ars line 5213`, p.132) attribute the functorial isomorphism to another paper. ASS IV.2.13 assumes K algebraically closed (`ass line 302`).

**Repair:** at 110–111 write “the Auslander–Reiten formula as an equality of lengths (ARS IV.4.1, p.129, and IV.4.6, p.131)”. At 848 write “(ASS Theorem IV.2.13, pp.117–118, over an algebraically closed field; ARS IV.4.6, p.131, as an equality of lengths over any Artin algebra; the natural isomorphism over any field is the pinned declaration)”. This matches how ArtinAlgebras §4.2 on main (its lines 835–837) cites the same passages.

## Verified sound

### Gate, elaboration, signatures, padding

- The worker's gate at `eaba7a0`: every counter 0, including `build=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0` and `statement-hygiene=0`; a rerun here ends `OK`. The prescribed diff outside the folder and the family files is empty, and the family index files are unchanged from main. `git status` stayed clean throughout.
- `lake env lean` on Suggested.lean: exit 0, exactly four `declaration uses sorry` warnings (52, 68, 77, 90).
- `#check @name` for all four declarations (the worker's signature file, which is Suggested.lean plus the four `#check` lines): exit 0. Each elaborated type matches its README statement:
  - `exists_admissible_presentation` carries `[IsAlgClosed k]`, `[FiniteDimensional k A]` and `IsBasic A` (README:534–539).
  - `pathAlgebra_higher_ext_vanish` and the Ext comparison carry `[Fintype Q]` and finite arrow types, with no acyclicity and no finiteness of modules or vertex spaces (README:618–621, 634–636).
  - `exists_rootPairing_titsForm` carries `[Nonempty Q]`, connectedness and `PosDef` on `Type`-level vertex and root types (README:116, 745–749).
  - No declaration uses a section `variable`, so no binder can be lost.
- One-tactic padding probe on a scratch copy: each of the four theorems tried with `simp`, `rfl`, `infer_instance`, `exact ⟨⟩` and `aesop`. All 20 attempts fail (no progress, unsolved goals, not a relation, failed synthesis, missing fields). No declaration restates a definition, mirrors a Check or computes a value. The file has no definitions, no `set_option`, no `lemma`, a single `import Mathlib` plus five Tau Ceti modules that exist at the pin, and the required docstring.
- README ↔ Lean names: all four Lean names occur in the README (534, 618, 631/641, 745). All 148 backticked names of the README resolve to declarations at the pins or in Suggested.lean. All 68 cited file paths exist at the pins: brace forms were expanded, and paths given relative to a preceding directory were resolved against it.
- No process wording, LaTeX delimiter, pull-request number or round label in either file.

### Headline theorems

| Headline (README Summary 5–8) | Status |
|---|---|
| Ext-quiver form of Gabriel's presentation | `exists_admissible_presentation`, Lean:52. The pinned `TauCeti.IsBasic.exists_surjective_pathAlgebra_isAdmissibleIdeal_ker` gives only the surjection. |
| Heredity of every finite path algebra | `pathAlgebra_higher_ext_vanish`, Lean:68. Pinned: only finite-length or finitely generated modules over acyclic Q (`Projective/Dimension.lean:49, 69, 81`) and vertex simples (`VertexSimpleModule.lean:202`). |
| Hom-differential cokernel ≅ Ext¹ | `nonempty_homDifferential_coker_linearEquiv_ext`, Lean:77. The ingredients are pinned (R05 of the previous review); the composite is not. |
| Marked rational root system of a Dynkin quiver | `exists_rootPairing_titsForm`, Lean:90. No `RootPairing` occurs under the pinned `RepresentationTheory/Quiver/`. |
| Euler–Hom–Ext identity | Stated in the README as a corollary of the pinned `eulerForm_eq_finrank_hom_sub_finrank_coker` and Lean:77. The docstring says why it is not stated separately. |
| AR duality, almost-split existence, AR quiver and k-mesh | Consumed from the pin. Declarations are resolved below. |

### Sources: all 14 seeded targets

Cache ids: `ass` (pdf page = printed + 11), `ars` (+14), `bgp` (pdf = printed − 16), `etingof` (v5, pdf = printed). All four are the legal copies linked in the README. The README flags no locator as unverified.

| Target | Locator read | Support |
|---|---|---|
| 0.1 | ASS II.1.2 p.43 `ass line 2302`; II.1.4(b),(c) p.45 `ass line 2394`; II.1.8 p.48 `ass line 2524` | as stated; ASS concatenates left to right, adapted explicitly (README:85–90) |
| 1.1 | ASS III.1.6 p.72 `ass line 3897`; III.2.4 p.79 `ass line 4322`; III.2.6 p.81 `ass line 4445` | as stated; the README's full dual and “dual path basis only when finite” avoid the source errors below |
| 2.1 | ASS I.4.8 pp.22–23 `ass line 1321`; I.4.10 pp.23–24 `ass line 1370` | as stated (multiset uniqueness) |
| 3.1 | ASS I.5.12–5.14 pp.30–31 `ass line 1747`, `1755`, `1779`; I.5.13(d) `ass line 1774`; I.5.15–5.16 pp.31–32 `ass line 1790`, `1802`; I.6.3 p.33 `ass line 1893`; I.6.10 p.37 `ass line 2044`; ARS II.2.6 p.36 `ars line 1682`, II.3.3 p.38 `ars line 1760`, II.4.1 p.40 `ars line 1805`, II.4.6 p.42 `ars line 1893` | as stated; ARS II.4.6 is the semisimple case (ownership: R02) |
| 3.2 | ASS II.2.1 p.53 `ass line 2782`; II.3.7 pp.64–65 `ass line 3404` (basic and connected); III.2.12 pp.84–85 `ass line 4621`, `4626`–`4628` | as stated; the README's disconnected and zero cases are the block decomposition of the connected source case |
| 3.3 | ASS III.3.7–3.13 pp.89–91 `ass line 4822`, `4848`, `4891`, `4912`, `4958` | as stated; row/column transposition explicit |
| 4.1 | ASS VII.1.4 p.245 `ass line 12128`; VII.1.7(a) p.248 `ass line 12279` (finite connected acyclic) | the README says the source states the acyclic case and the target removes it |
| 4.2 | BGP Theorem 1.1 pp.21–22 `bgp line 173`; Etingof Definitions 5.26–5.27 p.90 `etingof line 4007`, `4021` | as stated |
| 5.1 | BGP Lemma 2.3 p.28 `bgp line 430`; Theorem 3.1 p.28 `bgp line 447`; Note 1 p.30 `bgp line 527`; Etingof Theorem 5.23 p.89 `etingof line 3991` | as stated |
| 5.2 | BGP Definition 2.2 and Lemma 2.2 p.27 `bgp line 404`, `407`; Etingof Definition 5.20, Remark 5.21 p.89 `etingof line 3977`, `3980` | as stated |
| 6.1 | ASS IV.2 construction p.109 `ass line 5922`–`5936`; IV.2.2 p.110 `ass line 5944`; IV.2.10–2.11 p.116 `ass line 6267`, `6283` | as stated (pinned: R03) |
| 6.2 | ASS IV.2.13 pp.117–118 `ass line 6331`–`6339`; ARS IV.4.1 p.129 `ars line 4992`; IV.4.6 p.131 `ars line 5081`; notes p.132 `ars line 5213` | ASS as stated (algebraically closed); ARS only lengths (R04) |
| 6.3 | ASS IV.1.11–1.13 pp.104–105 `ass line 5675`, `5697`, `5723`; IV.3.1 p.120 `ass line 6441`; ARS V.1.14 p.144 `ars line 5511`; V.1.15 p.145 `ars line 5541` | as stated |
| 6.4 | ASS (IV.4.1) p.125 `ass line 6725`; IV.4.2 p.126 `ass line 6735`; IV.4.4 p.128 `ass line 6867` | as stated |

Also read: the ASS standing algebraically-closed convention, p.1 (`ass line 302`, README:108), and Etingof Example 1.19(2), p.9 (`etingof line 324`, README:769, “split case”).

### Adversarial mathematics: computed values

Conventions as in the README: A₂ is 1 → 2 with arrow a, left modules, later factor first. S₁ = (k,0), S₂ = (0,k), P₁ = (k →id k), P₂ = S₂, I₁ = S₁, I₂ ≅ P₁. T = k[ε]/(ε²). E(d,e) = ∑dᵢeᵢ − ∑ₐ dᵢeⱼ, and B(e₂,(a,b)) = 2b − a on A₂. A wrong model is in brackets.

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 0.1 multiplication, unit, dimension | A₂; ∅, A₁, loop | e₂a = a = ae₁, e₁a = ae₂ = 0 [pointwise product: e₂a = 0]; path counts 0, 1, 3, ∞; 1 = 0 in the empty algebra | pass | none |
| 1.1 vertex projectives and injectives | A₂ | P₁ = span{e₁,a} = (1,1); P₂ = (0,1); I₁ = D(e₁A) = D span{e₁} = (1,0); I₂ = D span{e₂,a} = (1,1); regular (1,2), total 3 [reversed paths swap P and I] | pass | none |
| 1.1 cover | A₁; loop | id k: kernel 0; k[X] → k at 0: (X−1) is proper and maps onto k, so not a cover | pass | none |
| 2.1 decomposition | 0, k, k², T | 0, 1, 2, 1 summands; End T = T local with ε nilpotent, nonzero and noninvertible | pass | none |
| 3.1 duality exchange | T | cover T → k of the right simple dualises to k → D T ≅ T, 1 ↦ ε; ideals 0, kε, T, so kε is essential; this is ArtinAlgebras §2.3's own Check | value pass | R02 |
| 3.1 Morita | A₂; M₂(k) | ann of αe₁+βe₂+γa on P₁ is zero only for α=β=γ=0, so P₁ is faithful; dim End P₁ = 1 ≠ 3 = dim A; E₁₂² = 0, so M₂(k)/rad is not reduced | pass | none |
| `exists_admissible_presentation` | A₂; T; k×k; A = 0; ℂ over ℝ | A₂: 0 → S₂ → P₁ → S₁ → 0 nonsplit, so dim Ext¹(S₁,S₂) = 1 = #(1→2), and Ext¹(S₂,S₁) = 0 = #(2→1) [arrows j → i give 0 ≠ 1]. T: J = (X), I = (X²) = J², dim Ext¹(k,k) = 1 loop. k×k: two vertices, J = I = 0. A = 0: Q = ∅, kQ = 0, ker = ⊤ = ⊥ is admissible, no simples, so every clause is vacuously true. ℂ over ℝ: End of the simple has dimension 2, so no ℝQ/I works; excluded by `IsAlgClosed` | pass | none |
| 3.3 matrices | A₁; A₂; k×k | A₂: C = [[1,1],[0,1]], E = [[1,−1],[0,1]], CE = I, B = [[2,−1],[−1,2]]; pinned `cartanMatrix i j` = [P_j:S_i] = Cᵀ = [[1,0],[1,1]] (`CartanMatrix.lean:148`); A₁: [1], [1], [2] | pass | none |
| `pathAlgebra_higher_ext_vanish` | loop; two loops; ∅; T | k[X] is a PID, so Ext² = 0; k⟨x,y⟩ is a free ideal ring, hereditary; empty quiver gives the zero ring, Ext = 0; T has Ext²(k,k) = k but is not a path algebra | pass | none |
| `nonempty_homDifferential_coker_linearEquiv_ext` | A₂ both orders; loop k_λ,k_μ; loop M = k[X], N = k₀ | A₂ (S₁,S₂): HomVertex = 0, HomArrow = Hom(k,k), coker 1 = Ext¹; (S₂,S₁): HomArrow = 0 = Ext¹. Loop: f ↦ (μ−λ)f, coker 1 iff λ = μ = dim Ext¹. Infinite-dimensional: f ↦ −f∘X is onto because ·X is injective, so coker 0 = Ext¹(k[X],k₀) | pass | none |
| Euler corollary | A₂ | E((1,0),(0,1)) = −1 = 0 − 1; E((0,1),(1,0)) = 0 = 0 − 0 [ℕ-subtraction 0 − 1 = 0]; P₁: q(1,1) = 1 = 1 − 0 | pass | none |
| 4.2 sink reflection | A₂ at 2; shift on k^(ℕ) | S₁ ↦ (k ← k), (1,0) ↦ (1,1) = s₂(1,0); P₁ ↦ (k ← 0), (1,1) ↦ (1,0); S₂ ↦ 0 and s₂(0,1) = (0,−1); s₂(a,b) = (a, a−b) [s₁(a,b) = (b−a,b) gives (1,0) ↦ (−1,0)]; shift: finranks (0,0) ↦ (0,1) ≠ s₂(0,0) | pass (the pull request's original correction is right) | none |
| 4.2 Coxeter | A₂, order [2,1] | S₁ → (k ←id k) → (0 → k) = S₂; s₁s₂(1,0) = s₁(1,1) = (0,1) | pass | none |
| 5.1 roots | A₂; D₄ to the centre | q(a,b) = a²+b²−ab: (1,0),(0,1),(1,1); D₄: B(e_c,(1;1,1,1)) = −1, so (2;1,1,1), q = 4+3−6 = 1, height 4 → 5; 3+8+1 = 12 = N(N−1) at N = 4 (`etingof line 3973`) | pass | none |
| `exists_rootPairing_titsForm` | A₁; A₂; Kronecker; loop; ∅; A₁⊔A₁ | Cartan [2]; [[2,−1],[−1,2]], six roots, q(1,−1) = 3; Kronecker q(1,1) = 0 and a loop q(eᵢ) = 0 fail PosDef; ∅ excluded by `Nonempty`; A₁⊔A₁ reducible, excluded by connectedness; q(2d) = 4, so reduced | pass | R01 (supplier citation) |
| 5.2 supplier citation | main's RootSystems | headings Layers 1, 2, 3 only; 0 occurrences of “Layer 4” or “Layer 5” | fail | R01 |
| 6.1 comparison | A₂ with N = S₂; A = k; T | envelope S₂ → I₂ ≅ P₁ and Hom(P₁,S₂) = e₁S₂ = 0, so Hom/(extensions) = k/0, dimension 1; A = k: Hom(k,k)/Hom(k,k) = 0; T: k → T → k is always 0, so 1. The pinned Hom cokernel gives the same three values | value pass | R03 |
| 6.1 translate | A₂; T; A = k | S₁: P₂ —·a→ P₁ → S₁, Tr = e₂A/aA (right simple at 2), D = S₂; τP₁ = τS₂ = 0; τk = k for T; 0 for A = k | pass | none |
| 6.2 duality | A₂ (S₁,S₂), (S₁,S₁); T | 1 = dim Ext¹ = costable Hom(S₂,S₂); 0 = 0; T: 1 = 1 | value pass | R04 (locator) |
| 6.3 almost split | A₂; T; rescaling | 0 → S₂ → P₁ → S₁ → 0, dimensions 1,2,1, nonsplit; 0 → k → T → k → 0; components (a⁻¹,1,1): (af)a⁻¹ = f and g·1 = 1·g | pass | none |
| 6.4 mesh | A₂; T | Irr(S₂,P₁) = Irr(P₁,S₁) = k and Irr(S₂,S₁) = 0 (Hom = 0); ε on T factors as T → k → T, so it lies in rad² and gives no loop | pass | none |
| Conventions: matrix model | A₂ | E₂₂E₂₁E₁₁ = E₂₁ = a, lower triangular | pass | none |

### Library declarations opened at the pins

Tau Ceti (file:line):

- **Bimodule resolution.** `PathAlgebra.arrowTensorBimodule` (BimoduleResolution.lean:174), `vertexTensorBimodule` (461), `vertexTensorMul` (489), `vertexTensorMul_surjective` (508), `arrowTensorDifferential` (524), `arrowTensorDifferential_injective` (649), `exact_arrowTensorDifferential_vertexTensorMul` (655).
- **Hom cocycles.** `LinearMap.HomCocycleQuotient` (`Algebra/Module/HomCocycle/Basic.lean:41`); `homCocycleQuotientEquivExt`, `_mk`, `_naturality`, `_precomp` (`Algebra/Category/ModuleCat/HomCocycle.lean:51, 71, 93, 120`; variables at 45–48: P₀ projective, nothing on f or P₁).
- **Hom differential.** `QuiverRep.HomArrow`, `homDifferential` (N(a)fᵢ − fⱼM(a)), `eulerForm_eq_finrank_hom_sub_finrank_coker` (`HomDifferential.lean:63, 66, 159`).
- **Projective dimension.** `hasProjectiveDimensionLT_two_pathAlgebra` and its finite-dimensional and finitely generated variants (`Projective/Dimension.lean`).
- **Injective stable category.** `ExactStructure.InjectiveStableCategory`, `injectiveStableFunctor_map_eq_zero_iff`, `isZero_injectiveStableFunctor_obj_iff`, `injectiveStableFunctor_map_eq_zero_iff_mem_range`, `homCokernelEquivInjectiveStableHom` (`CategoryTheory/Exact/Stable/Injective.lean:54, 70, 76, 88, 97`); `factorsThrough_injective_iff_exists_extension` (`Exact/Injective.lean:85`).
- **Injective envelopes.** `exists_isInjectiveEnvelope_of_finite` (`Envelope/FiniteDimensional.lean`, envelope in `Type (max u v)`, finite-dimensional); `IsInjectiveEnvelope` (`Envelope/Basic.lean:95`); `IsMinimalInjectiveCopresentation` and `isInjectiveEnvelope_cokernelMap` (`Copresentation/Basic.lean:69, 102`).
- **Translate.** `ModuleCat.arTranslate`, `nonempty_iso_arTranslate`, `isZero_arTranslate_iff`, `indecomposable_arTranslate_iff`, `injective_arTranslate_iff`, `nonempty_iso_arTranslate_iff`, `exists_nonempty_iso_arTranslate` (`AuslanderReiten/Translate.lean:74, 80, 100, 109, 128, 136, 156`; statements as README:304–312).
- **Duality.** `LinearMap.auslanderReitenExtEquiv_naturality` (`Basic.lean:191`), `_presentation_naturality` (`Naturality.lean:66`).
- **Almost-split sequences.** `ModuleCat.exists_isAlmostSplit_of_not_injective`, `exists_isAlmostSplit_X₁_eq_iff` (`Sequence.lean:110, 123`).
- **AR quiver.** `IrreducibleMorphismQuiver.card_arrows` (`IrreducibleMorphismQuiver/Basic.lean:160`); `ARTranslation.existsUnique_translate_eq_some_iff` (`Translation.lean:170`, namespace `TauCeti.ARTranslation`); `IsRepresentationFinite.finite_irreducibleMorphismQuiver_arrows` and `ModuleCat.arTranslation` (`AuslanderReiten/Quiver.lean:80, 99`); the mesh theorem in `Mesh.lean` (docstring: counts are k-dimensions); `ShortComplex.IsAlmostSplit.exists_iso_τ₃_eq` (`AlmostSplit/Uniqueness.lean:129`).
- **Cartan and Ext-Euler.** `cartanMatrix_apply` (`CartanMatrix.lean:148`: [P_j : S_i]); `extEulerMatrix_eq_inverseCartanMatrix_transpose` (`ExtEulerMatrix.lean:194`, with `finrank End = 1` and finite resolutions).
- **Radical layer and covers.** `IsAdmissibleIdeal.finrank_radicalLayer` (`Radical/Layer.lean:177`); `isEssentialEpi_indecProjRepToSimpleRep` (`Projective/Cover.lean:191`, hypothesis: every closed path at i is trivial).
- **Semiperfect and basic.** `IsSemiperfectRing.exists_isIdempotentElem_full_isBasic_corner`, `exists_isBasic_isMoritaEquivalent` (`Morita/BasicAlgebra.lean:62, 75`); `isSemiperfectRing_of_finiteDimensional` (`Jacobson/Semiperfect.lean:84`).
- **No cover/envelope duality theorem** exists under `Algebra/Module/Injective/` (README:189–190 is right at the pin; ownership: R02).

Mathlib: `RootPairing.weylGroup` (`LinearAlgebra/RootSystem/WeylGroup.lean:55`), `Module.injective_iff_injective_object`, `CategoryTheory.Abelian.Ext`, `Quiver.Path` (`Combinatorics/Quiver/Path.lean`), `Ext/Linear.lean`.

### Cross-roadmap citations and supply direction

- **Dependency check at this head:** `depcheck: 243 roadmaps, 2459 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. This roadmap, ArtinAlgebras, SemisimpleAlgebras, RootSystems and GrothendieckEulerForms are on main and not in the merge order. QuiverRepresentationsPartII (merge order line 264) and McKaySkewGroup (313) cite this roadmap downward.
- **SemisimpleAlgebras Layers 1.5 and 2** (main, headings at 200 and 212): resolved as cited.
- **GrothendieckEulerForms on main:** Layers 0–7 exist; it is cited as owner and consumer, not as a supplier.
- **QuiverRepresentationsPartII:** §§1.1–1.6 and Layers 2–4 exist at its open head.
- **ArtinAlgebras on main:** its citations 6A–6F, 6E, 6F and `arQuiver k A` resolve through README:782–794.
- **Consumers.** ModularCharactersAndBlocks (open, Layer 3, its lines 65–68, 526) and ZigzagPreprojective (main 179; head 762) use Layer 1 and Layer 3 objects. These still exist, and the A₂ Cartan orientation [[1,1],[0,1]] agrees with README:587. McKaySkewGroup (head, line 274) uses Layer 3 Morita.
- **Overlaps.** The tool lists no open pull request changing this roadmap and no dropped id. No sibling Suggested.lean declares a name in `TauCetiRoadmap.QuiverRepresentations`.
- **Ownership search by object.** Ext-quiver, heredity of path algebras, Hom differential and Tits-form root systems were searched across main and all open heads; none has a second owner.
- **`*Needs:*` lines.** All 14 were read. The only intra-roadmap forward edge is §3.3's use of the pinned finite resolutions, which are not this roadmap's §4.1, and README:603 excludes the reverse. Layer 6's internal order 6.1 → 6.2 → 6.3 → 6.4 is acyclic.
- **Pull-request description.** It describes only the A₂ sink-reflection correction (recomputed above: right). The folder's diff against main is a full rewrite (+1037/−853 lines over both files), so the human approver should read the head rather than the description.

## Not verifiable

- Nothing. All four sources are readable from the legal copies the README links, and no request for a missing text was filed.
- Ownership against open pull requests was checked against the sibling checkouts the brief lists and the open-roadmap search index. The three packages on the board are unrelated to quivers.

## Source issues

- **Misprint** in ASS at I.5.10, proof, printed p.30 (`ass line 1722`): the source says the projective cover of the kernel of p₀ has domain P₀; it should be a new projective P₁, as in the displayed presentation that follows; affects the proof.
- **Error** in ASS at III.2.4(a) and III.2.6(b), printed pp.79 and 81 (`ass line 4324`–`4326`, `ass line 4447`–`4449`): the source says the residual classes of all paths from a to b form a basis of the vertex space; they only span it when a relation identifies two paths, e.g. p − 2q for parallel length-two paths; it should say spanning set, or a basis when I is monomial; affects a stated result.
- **Error** in ASS at III.2.6(c), printed p.81 (`ass line 4453`–`4455`): the source says I(a)/S(a) at b is spanned by classes of paths from b to a of length at most one; on 1 → 2 → 3, I(3)/S(3) is one-dimensional at 1 through the length-two path; it should say all nonstationary paths; affects a stated result.
