# Repair report

## F01 (P1) — applied differently

Import "from AutomorphicBundles §§B1.1–B1.3" → new `gap:absolute-hodge-padic-comparison` (AutomorphicBundles §B1.3), in the plan's `gaps` and the README contract. The tag is on the tensor-torsor target and the Layer 2 Dependencies. The torsor statement now names the B_dR equality explicitly. Departure from the suggested wording: the needs sentence covers every finite place, with the B_cris clause only at good-reduction places.

Evidence that the finding is right: the AutomorphicBundles §B1.3 API (`hodgeTensorRealizations_compare`) gives only the Betti–de Rham and Betti–étale comparisons. §B2.7 says it "does not add crystalline or `B_dR` assertions". Source A uses Blasius–Wintenberger for exactly this step (A line 1442). Why the wording differs: Blasius's theorem holds at every finite place, and the roadmap allows no good-primes-only request.

## F02 (P2) — applied differently

Docstring bullet "Distant ideal isogenies and subpolynomial individual CM heights" → only the individual-height headline is listed as not statable. Added `distant_cm_isogenies` on native Tau Ceti abelian varieties, `End` and `IsIsogeny`. Degree = Mathlib's `AlgebraicGeometry.Scheme.Hom.finrank` of the underlying morphism at `zeroPoint`, rather than the suggested point-count definition. Added the import, §10.2 restatement, Checks and contracts.

Why the departure: the pinned Mathlib already has the rank of a finite flat morphism (`Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean`, line 88). So a new degree definition would duplicate a library notion. The Mathlib rank is also the degree in every characteristic, not just over ℂ. It is the same rank that AbelianSchemesAndArithmeticModuli §A6.1 uses to define `Hom.deg`. In a scratch file, the identity isogeny gets rank 1 at the identity point (proved there by `isIso_iff_finrank_eq`), so the value is the real degree, not a junk 0.

## F03 (P2) — applied

§4.2c "with positive rank-two orthogonal complement" → a positive definite complement Λ=L^⊥⊂L⋄ of rank n⋄−2d+2, of any rank including zero. §4.3 (the average-error target) now says it consumes the general statement. §4.5 keeps rank two only for its existence argument. Added the rank-one Check U⊕U⊂U⊕U⊕⟨1⟩, with E=ℚ(i,√2) and ξ=√2.

Evidence: A §8.1 defines Λ with rank n⋄−2d+2 and no restriction (A lines 4808–4810). Theorem 8.3.4 needs only n⋄≥3, Hypothesis 8.3.1 and c_f(0,0)≠0 (A lines 4979–4991). Rank two appears only in the proof of Theorem 9.5.5 (A lines 5790–5794).

## F04 (P3) — applied

"with the support prescribed in A (8.3.1)" → "the support of §4.2a applied to L⋄ and n⋄ (A Theorem 4.8.1, pp. 454–455)", with the two clauses written out. Added a timeless note: the paragraph after A (8.3.1) reverses the odd-prime divisibility condition and writes L for L⋄. §4.2a itself is unchanged.

Evidence: A line 2605 has E_p=0 for odd p with p²∤D_L. A lines 4986–4988 put support at p²∤D_L and use L(2) where L⋄ is meant.

## F05 (P3) — applied differently

Layer 1: integral families §1.5 → §1.4, total reflex pair §1.4 → §1.5. Layer 2: tensor torsor §2.4 → §2.3, bundles §2.3 → §2.4. Layer 4: auxiliary data §4.3 → §4.1, adapter §4.1 → §4.2d, average error §4.2d → §4.3; §§4.4–4.6 keep their numbers. The adapter's Needs gains §4.1 and §4.2.

Why the departure: the adapter compares the GSpin Hodge line ω, which §4.2 constructs. So it must come after §4.2, not directly after the auxiliary data as the finding suggested; its old Needs line also omitted §4.2. All in-text references and the Scope range were updated. A mechanical scan finds no forward dependency edge; the old file had four.

## Check outcomes

- `lake env lean packages/ComplexMultiplicationAndExplicitReciprocityPartII/Suggested.lean`, run from the content checkout: exit 0. The only output is two `declaration uses sorry` warnings, at lines 49 (`relative_class_number_growth`) and 71 (`distant_cm_isogenies`). The object file for `TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny` was present, so no targeted build was needed.
- Binder check: I put `#check @…` for both theorems in one scratch file and elaborated it once. `relative_class_number_growth` is unchanged. `distant_cm_isogenies` keeps every binder of §10.2: `g`, `0<g`, `ε`, `0<ε`, the field/number-field/CM instances, `finrank ℚ E = 2*g`, `A`, `A.dim = ↑g`, `ι : 𝓞 E ≃+* A.End`, `B`, `κ`, the intertwining isogeny, and the bound over every isogeny with `Scheme.Hom.finrank (Hom.toSchemeHom f) B.zeroPoint`. Nothing was lost. The file has no `def`, `instance`, `set_option` or admitted example. Its imports are `import Mathlib` plus the one Tau Ceti module.
- Dependency direction (command as in the brief), complete output:

```text
depcheck: 51 roadmaps, 601 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the README found no cross-roadmap citation and no backticked Lean name that is missing everywhere. The tool did not check names outside TauCetiRoadmap, so I checked every new library name at the pins by hand:
  - Mathlib `AlgebraicGeometry.Scheme.Hom.finrank` (FlatRank.lean:88), `…one_le_finrank_iff_surjective` (:201, under `[Flat f] [IsFinite f]`) and `…isLocallyConstant_finrank` (:231, which also needs `LocallyOfFinitePresentation`).
  - Tau Ceti `AbelianVariety` (Basic.lean:95), `dim` (:118), `zeroPoint` (:171), `End` (End/Basic.lean:83), `End.toHom` (:92), `Hom.toSchemeHom` (Hom/Basic.lean:133) and `IsIsogeny` (Isogeny.lean:61).
  - Nothing at the pins proves that isogenies are flat; there is no `Flat` lemma under `AbelianVariety/` and no miracle-flatness theorem in Mathlib. The README says so.
- Gaps: the plan has eight entries. Each slug, supplier and needs sentence matches its README contract line character for character, and all eight `(gap:…)` tags occur in the README.

## Ownership and citations

- **Blasius–Wintenberger p-adic comparison.** I searched by object ("Blasius", "Wintenberger", absolute Hodge with B_dR, crystalline or p-adic) on main, at all 362 open heads and in the board packages. No roadmap states it.
  - FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII records it as an unowned global input (design gap G8).
  - HodgeTateAndCanonicalSubgroups (README line 772) already treats AutomorphicBundles B1 as the supplier of "Deligne–Blasius–Wintenberger compatibility".
  - This is a general theorem about abelian varieties, so this roadmap does not own it. AutomorphicBundles §B1.3 is the section that builds descended étale and de Rham realizations of absolute Hodge tensors (on top of ShimuraVarieties §7.0i). AutomorphicBundles precedes this roadmap in the merge order.
- **`distant_cm_isogenies`.** It is owned here. `roadmaps grep` finds no statement of Tsimerman's Proposition 2.2 or of this name on main or at any open head. No declaration in `Suggested.lean` reuses a fully qualified name from a readable roadmap.
- **Citations re-resolved against the AutomorphicBundles head** (the open new-roadmap pull request): B1.1 at line 802, B1.2 at 827, B1.3 at 859, B2.7 at 1534. **Against the AbelianSchemesAndArithmeticModuli head**: A6.1 at line 2743 (`Hom.deg` = `Scheme.Hom.finrank` at the zero point for an isogeny), A6.4 at 2800, A6.5 at 2833, A6.8 at 2885, A6.37 at 3699. ComplexMultiplicationAndExplicitReciprocity §2.1 (`arbitraryCMClassification`: Pic(O_E)-torsor, ideal isogenies of degree N(a)) supports the §10.2 route.
- **Sources.** No new source. T (§2.2, Proposition 2.2) and A (Theorem 4.8.1, §8, Proposition 3.5.5) are already in the manifest with these locators. `sources.toml` and `needs-references.toml` are untouched.

## Adversarial mathematics pass

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| Gap absolute-hodge-padic-comparison | tensor unit; identity endomorphism in H¹⊗H¹∨; polarization in its Tate line; bad-reduction place; p=2 | comparison(1)=1; comparison(id)=id (tensor functor); polarization ↦ de Rham pairing in Fil⁻¹ of the de Rham ℚ(1). At bad reduction only the B_dR clause is asserted, since B_cris is meaningless there. | Suggested "good reduction only" → every finite place, B_cris clause at good places; Blasius's theorem has no reduction hypothesis. |
| §2.3 integral tensor torsor | ramified level (D contains p); split p=5 for E=ℚ(i); zero tensor; similitude | Extension over all of Y_K needs only Kisin's comparison at every DVR O_y; the torsor statement is only over Y_K[1/D]. Adding the tensor 0 leaves the stabilizer T. Fixing ψ's value instead of its line gives ker(ν)=T¹≠T, since ν(z)=zz̄ is surjective onto a rank-one torus. | Correct; p-adic equality now attributed to the gap; similitude remark added. |
| §2.4 route ("rational comparison of §2.3") | geometric point y over q ramified in E | The lattice at Spec O_y and the generic bundle agree after inverting p because of the §2.3 frame torsor over Frac(O_y) (A lines 1446–1451). | Dependency now points backward (2.3 → 2.4). |
| AutomorphicBundles contract | B1.3 API; B2.7 | Three B1.3 API items: horizontal, Betti–dR/Betti–ét compare, Galois descent. None is a B_dR item. | Text restricted to what is supplied. |
| `distant_cm_isogenies` | g=1, E=ℚ(i) (D=4), ℚ(√−3) (D=3); ε=1/8, c=4^(−1/8); ε≥1/4; A a very general unitary threefold (dim 3, End=O_K) | h_E=1 ⇒ B≅A, min degree 1 ≥ 4^(−1/8)·4^(1/8)=1 and ≥(3/4)^(1/8)=0.96468. For ε≥1/4, D^(1/4−ε)≤1, so c≤1 suffices. Without `A.dim = g` the threefold satisfies End≅O_K with no CM, so the hypothesis is needed for the CM reading. | Statement true, nontrivial for small ε; all binders present. |
| Degree via `Scheme.Hom.finrank` | identity; [2] on an elliptic curve; zero map | Identity: rank 1 (proved in scratch). [2]: finite flat of rank 4 = #E[2]. Zero map A→B, dim A>0: not finite, so not an isogeny and never evaluated. Wrong model "lattice multiplier" gives 2 for [2]. | Native degree; no new definition. |
| Every isogeny A→B is O_E-linear | f = g∘h with g intertwining, h∈End⁰(A)=E | f∘ι(a) = g∘h∘ι(a) = g∘ι(a)∘h = κ(a)∘g∘h = κ(a)∘f | So the bound over all isogenies equals T's bound over ideal isogenies. |
| A simple with primitive CM | End(A)≅O_E with dim A=g, [E:ℚ]=2g | If A~∏A_i^{n_i} has two factors or some n_i≥2, End⁰ has zero divisors; a field forces A simple, and degree 2g = 2·dim gives CM. | Correct. |
| §10.2 route: counting | X with C′X^(1+ε′)=h_E/2 | Count of reachable (B,κ) ≤ h_E/2 < h_E, and h_E ≥ C D^(1/4−ε/2), so X ≥ c D^((1/4−ε/2)/(1+ε′)) ≥ c D^(1/4−ε) for ε′ small. Bounded D handled by Hermite finiteness. | Correct, uniform in g. |
| §10.2 Check (1+i) | ℂ/ℤ[i], I=(1+i) | A[I]=(1+i)⁻¹ℤ[i]/ℤ[i] has order |ℤ[i]/(1+i)|=2=N(1+i); the quotient is ℂ/(1+i)⁻¹ℤ[i]≅ℂ/ℤ[i] | Correct. |
| §4.2c, general complement | rank 0 (d≥3, L⋄=L); rank 1 (U⊕U⊕⟨1⟩); rank 2 (A §9.5) | Rank 0: Hypothesis 8.3.1 is vacuous, and with ξ(f)=0 the result reduces to §4.2b plus §4.2a. Rank 1: n⋄=3≥3, D_L⋄=2, D⁻¹Λ=½ℤ represents k²/4. d=2 with rank 0 would give n⋄=2<3, which is excluded. | Generalized to the source's generality. |
| §4.2c rank-one Check | E=ℚ(i,√2), F=ℚ(√2), ξ=√2 | Tr_F/ℚ(√2(a²+b²)) = 8(a₁a₂+b₁b₂), signature (2,2). ⟨1⟩ has dual ½ℤ with Q(½)=¼∉ℤ, so it is maximal. L⋄ is maximal of signature (3,2). Required vanishing c_f(−1/4,½)=c_f(−1,0)=0. 2f gives 2E/(2c·deg Y)=E/(c·deg Y). | Check added; agrees with the existing norm-1 Check. |
| §4.2c support pointer | odd p with v_p(D_L⋄)=1, 2; n⋄=5 with L⋄ self-dual at 2; rank-one example | v_p=1: E_p=0; v_p=2: not covered; n⋄≥5 and self-dual at 2: E=0. Example: D_L⋄=2, so every odd component vanishes and n⋄=3 leaves the dyadic part unconstrained. | Matches §4.2a Checks; misprint recorded. |
| §4.3 average error | rank-one complement, E_error degree 8, c=2, deg Y=1 | 8/(4·2·1)=1 for any complement rank; A Proposition 9.5.1 has no rank hypothesis | Now explicitly general. |
| §4.2d adapter Needs | ω from §4.2; V and L from §4.1 | The statement names ω|Y on the GSpin model of the §4.1 lattice. | Needs gains §4.1 and §4.2; adapter placed after §4.2. |
| Reordering | 1.4→1.5, 2.3→2.4, 4.2b/4.2c→aux data, adapter→ω | The scan over 68 numbered targets finds 0 forward dependency edges (4 before). The remaining forward mentions are source locators (A §§3.1, 6.1–6.3) or remarks (in §§4.2, 4.2c, 12.1). | Correct. |
| Scope range "§§4.2–4.2c, 4.3 and 4.5" | contents of the old §§4.2–4.2d | old 4.2–4.2c keep their numbers; old 4.2d is now 4.3; the adapter (now 4.2d) is CM-specific and was outside the old range | Same coverage as before. |
| Mathlib finrank contract | hypotheses of the cited lemmas | `one_le_finrank_iff_surjective` needs Flat and IsFinite; `isLocallyConstant_finrank` also needs LocallyOfFinitePresentation | Contract text states exactly these. |

No other Check or worked example uses an object changed here. The renumbering changes no value, and the averaged-formula chain (§§4.2c → 4.3 → 4.5 → 9.1) is unchanged in its constants.

## Maintainer notes

- **New supplier request.** AutomorphicBundles §B1.3 is asked for the de Rham (B_dR) property of absolute Hodge tensors on abelian varieties at every finite place, plus B_cris compatibility at good-reduction places. FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (design gap G8) and HodgeTateAndCanonicalSubgroups need the same input. A single owner would settle all three.
- **Renumbered targets inside this roadmap.** §1.4 ↔ §1.5, §2.3 ↔ §2.4, and Layer 4 §4.1 (auxiliary data, was §4.3), §4.2d (adapter, was §4.1), §4.3 (average error, was §4.2d). No other roadmap or board package cites these section numbers; I grepped main, all open heads and the board.
- **New Lean name** `TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocityPartII.distant_cm_isogenies`. No name was deleted. `Suggested.lean` now imports `TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny`.
- **Source misprint in A.** The paragraph after (8.3.1), p. 508, gives the odd-prime support condition as p²∤D_L, where Theorem 4.8.1 has vanishing in that case. It also writes L(2) for L⋄(2). The README records this at §4.2c.
- **Ownership against open pull requests** was checked through the open-head index and `roadmaps grep`, plus the board packages.
