# Review of LogPluricanonicalForms (pull request #2122 at 3d4fd65)

**Verdict:** needs changes

## R01 (P3) — The negative-fiber implication holds on a nonempty open, so `VeryGeneral` and the countable union are not needed

**Location:** `TauCetiRoadmap/LogPluricanonicalForms/Suggested.lean` lines 57–63 and 77–82. README §4.3, lines 364–365: "takes the countable union of the closed complements of those opens". README §4.2, line 337: "the countable positive degrees in §2.2".

**Claim:** There are two cases.
- If `NegLogKodaira X hE` holds, the implication holds at every `y`.
- Otherwise, one nonzero section `s` in one positive degree is enough. §4.1 gives a nonempty open `U_s ⊆ V` over which every fiber has a nonzero pluriform.

So the implication holds on a nonempty open, and the very-general form is strictly weaker. The source argues with one section and does not mention countably many degrees.

**Witness:** openai-reverse-log-kodaira lines 220–223 (§2.2, p. 5) use one nonzero section, whose open nonvanishing locus has an image containing a dense open set. A scratch file at the pins proves that the open form implies `VeryGeneral V P`, taking `Z j := Uᶜ`.

**Repair:**
- In `Suggested.lean`, keep every binder and replace the conclusion with `∃ U : Y.Opens, U ≤ V ∧ (U : Set Y).Nonempty ∧ ∀ y : Spec (.of ℂ) ⟶ Y, y ≫ (Y ↘ Spec (.of ℂ)) = 𝟙 _ → Set.range y.base ⊆ (U : Set Y) → ∀ (F : Scheme.{0}) [F.Over (Spec (.of ℂ))] [IsIntegral F] [Smooth (F ↘ Spec (.of ℂ))] [IsProper (F ↘ Spec (.of ℂ))] (i : F ⟶ X), IsPullback i (F ↘ Spec (.of ℂ)) f y → ∀ (EF : F.IdealSheafData) (hEF : EF.IsEffectiveCartier), EF = E.comap i → NegLogKodaira F hEF → NegLogKodaira X hE`. This elaborates at the pins.
- Rename the theorem `negLogKodaira_of_general_fiber` and delete `VeryGeneral`.
- In §4.3, state the open form with the route "one nonzero section, then §4.1", and remove "countable choice" from its *Needs:*.
- Either delete §4.2, or keep it as a README definition whose dense-open bullet derives the very-general corollary. Remove "and the countable positive degrees in §2.2".
- Update the Summary, "How to read the build" and the module docstring to match.

## R02 (P3) — The chart-cover side of §1.1 is AdicSpacesPartIV's `SmoothPair.AlgebraicSmoothPair`, restated without a citation

**Location:** README lines 132–134: "equivalent to a Zariski cover by affine opens with `TauCeti.SmoothPair.AlgebraicChart` data and the same boundary ideal". Also Scope, lines 17–18.

**Claim:** This predicate is already a declared object on main. The README describes it inline, and neither the supplier contracts nor the *Needs:* line names its owner.

**Witness:** AdicSpacesPartIV README R4.7, lines 1252–1257. AdicSpacesPartIV `Suggested.lean` lines 140–151: `structure AlgebraicSmoothPair (K)` has a smooth `toSpec`, `D : X.IdealSheafData`, and `exists_chart : ∀ x, ∃ U : X.affineOpens, x ∈ U.1 ∧ Nonempty (AlgebraicChart K … (D.ideal U))`.

**Repair:**
- State §1.1 as: "for a smooth complex variety `X` and `D : X.IdealSheafData`, `IsStrictNormalCrossings D` holds iff `X`, its structure morphism and `D` form an `AdicSpacesPartIV.SmoothPair.AlgebraicSmoothPair ℂ`".
- Add `### From TauCetiRoadmap.AdicSpacesPartIV` (R4.7, `SmoothPair.AlgebraicSmoothPair`) to the supplier contracts.
- Cite it in Scope and in the *Needs:* line of §1.1.

## R03 (P3) — The §1.1 locator does not cover the étale-coordinate steps

**Location:** README lines 135–136: "(Stacks Definition 41.21.1 and Lemma 41.21.2, Tags 0BI9–0BIA)". The same locator appears in Conventions, line 50.

**Claim:** Tags 0BI9 and 0BIA give only the regular-parameter definition and its equivalence with the finite-family form. Neither mentions an étale map to affine space, and both directions of the chart comparison need one.

**Witness:** stacks-0BI9 lines 1163–1179 (Étale Morphisms, p. 26) contain only the local-ring definition and the criterion on components. The direction from charts to strict normal crossings is Lemma 41.21.3, Tag 0CBP (lines 1201–1215): strict normal crossings pull back along smooth morphisms.

**Repair:** Append to the locator: "; Lemma 41.21.3, Tag 0CBP, applied to the coordinate hyperplanes of `𝔸ⁿ`, for charts ⇒ strict normal crossings; Morphisms Lemma 29.37.15, Tag 02GU, pp. 80–81, for the étaleness at a closed point of the map given by a regular system of parameters extending the boundary equations".

## R04 (P3) — A §4.1 Check uses a nonconstant function on a proper base

**Location:** README lines 327–328: "Multiplying a product section by a base function that vanishes at a point can kill that fiber restriction".

**Claim:** In §4.1, `Y` is proper and integral, so `Γ(Y, 𝒪_Y) = ℂ`. The only base function that vanishes at a point is `0`, and multiplying by it kills the section itself rather than one fiber restriction. As written, the Check has no instance.

**Witness:** `Γ(ℙ¹, 𝒪) = ℂ`. In the elliptic product of Layer 3, `ω_X(E) ≅ 𝒪_X`, so every pluriform section is a constant multiple of `((dz/z) ∧ η)ᵐ`.

**Repair:** Replace the Check with: "For `C × ℙ¹ → ℙ¹` with `C` elliptic and `E = C × {0, 1, ∞}`, `ω_X(E) ≅ pr₂*𝒪(1)`. Pull back the section of `H⁰(ℙ¹, 𝒪(1))` that vanishes at `2`. It restricts to zero on the fiber over `2`, where `E_F` is the unit ideal, and is nonzero over every other point of `ℙ¹ ∖ {0, 1, ∞}`. So the open must depend on the section."

## R05 (P3) — The Conventions are narrower than §1.2 and the Lean definitions

**Location:** README line 39: "The section and pole constructions apply to smooth integral finite-type complex schemes."

**Claim:** §1.2 defines the line "for every smooth `X`". `logCanonical`, `pluriformSections` and `NegLogKodaira` assume only smoothness. Integrality is used only by the rational comparison of §2.1.

**Witness:** `#check @logCanonical` at the pins gives `(X : Scheme) → [X.Over (Spec ↧ℂ)] → [Smooth (X ↘ Spec ↧ℂ)] → {E : X.IdealSheafData} → E.IsEffectiveCartier → InvertibleSheaf X`.

**Repair:** Replace the sentence with: "The twisted canonical line, its tensor-power sections and the negative condition are defined for every smooth complex scheme; the rational comparison of §2.1 assumes `X` integral."

## R06 (P3) — The scope uses time-relative wording

**Location:** README line 33: "The vanishing predicate below is definite and does not depend on a future dimension API."

**Claim:** "future" dates the text: the sentence describes planned library work rather than the mathematics.

**Witness:** Neither pin has a Kodaira-dimension declaration, so "a future dimension API" refers to work that does not exist. The house style forbids wording of the "for later" kind.

**Repair:** Replace the sentence with: "The vanishing predicate below is definite and is stated without a Kodaira-dimension function."

## Verified sound

Previous review (at eae214f), finding by finding:

| Id | Passage at this head | Status |
|---|---|---|
| R01 | Docstring "Logarithmic pluricanonical forms: target signatures"; headline `negLogKodaira_of_veryGeneral_fiber`; §4.1 "let `E` be any effective Cartier divisor" | repaired |
| R02 | Scope: "It does not define a second normal-crossing notion"; §1.1: "not another definition of either presentation" | repaired (citation: R02 above) |
| R03 | Gate: `blob=0 imports=0 mathlib-subimports=0 no-import-mathlib=0` | repaired |
| R04 | §3.1: "No separate injectivity supplier is introduced"; the declaration is deleted | repaired |
| R05 | §3.1 *Needs:* AlgebraicVectorBundles §§3.2–3.3, PadicMeasuresIwasawaAlgebras §5.1; the declaration is deleted | repaired |
| R06 | Every subsection §1.1–§4.3 has a locator; line 405: "Tag 0FJ9 … determinants" | repaired (§1.1 partly: R03) |
| R07 | `# Roadmap:`, `**Summary.**`, Conventions, `### k.n`, Examples and Dependencies in each layer; 3–4 Checks per definition | repaired |
| R08 | "### From Tau Ceti" lists exact names; `Submodule.mem_of_localization_maximal` | repaired |
| R09 | "The vanishing predicate below is definite" | repaired (wording: R06) |
| R10 | §4.1 Check on the elliptic product; one-line provenance at line 407 | repaired |
| R11 | §3.1: "with inclusion `1 ↦ e₁` and the second projection … Over `𝔽₂` the sign is invisible" | repaired |

Adversarial pass:

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §1.1 chart comparison | `V(xy) ⊂ 𝔸²`; nodal cubic; empty boundary | `V(xy)`: identity chart `n=r=2`, ideal `(X₁X₂)`. Nodal cubic: étale-locally `xy`; irreducible Zariski equation, singular at the node, so no chart. Empty: `r=0`, ideal `⊤` | True; locator R03, citation R02 |
| §1.2 `logCanonical` | `𝔸¹`, `E=V(x)`; `Spec ℂ`; `ℙ¹`, `{0,∞}`; wrong model `𝒪(−E)` | `x·dx/x = dx` regular; `x·dx/x² = dx/x` not. Rank 0: `det = 𝒪`. Degree `−2+2 = 0`, `h⁰ = 1` (`dz/z`). With `𝒪(−E)`: `x·dx`, so `dx/x` excluded | True; Check 2 pins the dual |
| §2.1 rational comparison | `𝔸¹`, `t=x`, `m=2`; `t ↦ 2t`; `ℙ¹`, `{0,∞}`; `m=0` | `x²(dx)²/x²` regular, `x²(dx)²/x³ = (dx)²/x` not; `2ᵐ` a unit; `h⁰(𝒪) = 1` in every degree; `1 ∈ Γ(𝒪_X)` nonzero | True |
| §2.2 `NegLogKodaira` | `ℙ¹`, `E=⊤`; `ℙ¹`, `{0,∞}`; elliptic curve; `m=0` | `h⁰(𝒪(−2m)) = 0` for all `m>0`, so holds; `h⁰(𝒪) = 1`, fails; `ω_C ≅ 𝒪`, fails; `m=0` always has `h⁰ ≥ 1` | True; `m>0` needed |
| §3.1 determinant adjunction | `0→ℤ→ℤ²→ℤ→0`, two orientations; lift change; `ℤ[x]→ℤ[x,y]` vs `ℤ[x]→ℤ` | `e₁∧e₂` vs `e₂∧e₁ = −e₁∧e₂` (equal over `𝔽₂`); `e₁∧(e₂+e₁) = e₁∧e₂`; `H₁ = 0` gives injection; `H₁ = (x)/(x²) ≠ 0`, `ℤdx → 0` | True; base first as in AlgebraicVectorBundles §3.2 |
| §3.2 specialization | `f = id_X`; `Y = Spec ℂ`; `C×ℙ¹→ℙ¹`, `E = C×{0,∞}`; fiber over `0` | id: `F = Spec ℂ`, value `s(y) ∈ (ω_X)_yᵐ`; point base: `det Ω_Y = 𝒪`; `(dz/z)∧η ↦ η ≠ 0`; over `0`: `z ↦ 0`, ideal `0`, not Cartier | True; effectiveness hypothesis needed |
| §4.1 generic nonvanishing | elliptic product `s = (dz/z)∧η`; `E = C×{0,1,∞}`, `s = pr₂*σ` with `σ(2) = 0` | `U = ℙ¹∖{0,∞}`, restriction `η ≠ 0`; second case: restriction zero exactly over `y = 2` | True; Check wording R04 |
| §4.2 `VeryGeneral` | `Y = Spec ℂ`; `ℙ¹`; `V = ∅`; dense open `U` | Point: proper closed sets are `∅`. `ℙ¹`: proper closed sets finite, union countable. `V = ∅`: `range y.base ≠ ∅`, vacuous. `Z j := Y∖U` | True; not needed for the headline (R01) |
| Headline `negLogKodaira_of_veryGeneral_fiber` (§4.3) | `ℙ¹×Y→Y`, `E=⊤`; elliptic product; `Y` a point; `X` not negative | `h⁰(𝒪(−2m))·h⁰(ω_Yᵐ) = 0`; nonzero `s`, fibers not negative; `F ≅ X`; one `s` gives open `U_s` on which the implication holds | True; also true on a nonempty open (R01) |
| Headline binders | `#check @` on all 5 declarations | Integral, smooth and proper `X`, `Y`; `f.IsOver`; `Smooth (f ∣_ V)`; `F` binders present; `E.comap i` is `ker(pullback.fst i E.subschemeι)`, i.e. `I_E·𝒪_F` | Matches §4.3; no lost binder |
| Conventions vs Lean | `#check @logCanonical`, `pluriformSections`, `NegLogKodaira` | Lean assumes only `[Smooth (X ↘ Spec ℂ)]`; README line 39 assumes integral and finite type | Mismatch (R05) |
| Padding probe | headline; the 4 definitions | Headline needs adjunction and openness, no one-tactic proof; `logCanonical`, `pluriformSections`, `NegLogKodaira` needed to state it; `VeryGeneral` only for the very-general form | No padding beyond R01 |

- Gate (own run, merge order on main): every text and Lean-form check is 0; the only failure is `depcheck: NOT IN ORDER`, because the main order does not list this roadmap yet. Dependency check against the candidate order: `depcheck: 230 roadmaps, 2064 edges, 0 problem(s)`, with no UPWARD or CYCLE line. `git diff --stat` shows no change outside the folder.
- Elaboration: `lake env lean` on a copy with `#check @` for every declaration gives one `sorry` warning (the headline). The open form of R01 elaborates, and "open form ⇒ `VeryGeneral`" is proved there without `sorry`.
- Source locators checked against the text (12):
  - openai-reverse-log-kodaira lines 64–76 (§1) and 220–224 (§2.2, p. 5);
  - Esnault–Viehweg Definition 2.1 and Properties 2.2(b,c), pp. 11–12 (lines 460–485);
  - Stacks 0BI9 and 0BIA (Étale Morphisms, p. 26), 0CBP, 02G1 (Lemma 29.35.12, p. 70), 02GU (pp. 80–81), 0FJ9 (p. 369), 0FJB (Lemma 15.120.2, p. 370).
- Mathlib declarations opened at the pin:
  - `IdealSheafData.comap` (`IdealSheaf/Functorial.lean:39`), `H1Cotangent.exact_δ_mapBaseChange` (`JacobiZariski.lean:552`), `exact_zero_iff_injective` (`Exact/Basic.lean:277`);
  - `Submodule.mem_of_localization_maximal` (`LocalProperties/Submodule.lean:48`), `tensorKaehlerEquiv` (`Kaehler/TensorProduct.lean:238`);
  - `Scheme.Hom.isOpenMap` (`UniversallyOpen.lean:43`), with Smooth ⇒ Flat (`Smooth.lean:108`) ⇒ UniversallyOpen (`UniversallyOpen.lean:143`).
- Tau Ceti declarations opened at the pin:
  - `relativeDifferentials` (`LocallyFree.lean:95`), `rank_relativeDifferentials_apply` (`Rank.lean:74`), `det` (`LocallyConstantRank.lean:62`), `pullbackDetIso` (`Pullback.lean:156`);
  - `dual` (`Dual.lean:44`), `tensorProduct` (`LineBundle/TensorProduct.lean:65`), `rationalDifferential` and its companions (`Rational.lean:61–102`), `toInvertibleSheaf` (`Invertible.lean:307`; it is the ideal itself);
  - `tensorPow` and `tensorPowAddIso` (`TensorPow.lean:54, 68`), `Scheme.Modules.instMonoidalCategory` (`Modules/TensorProduct.lean:55`), `AlgebraicChart` (`AlgebraicChart.lean:45`), `equivBaseChange`, `exteriorPowerEquiv`, `ideal_comap_of_le`.
- Cross-roadmap citations resolved on main:
  - SchemeAndStackFoundations §4.17 (README line 6389: `SNCData`, `IsStrictNormalCrossings` and its API);
  - AlgebraicVectorBundles §3.2 (line 669: `γ` with the submodule factor first, the same orientation Check) and §3.3 (line 766, built on PadicMeasuresIwasawaAlgebras §5.1);
  - PadicMeasuresIwasawaAlgebras §5.1 (line 3172).
- Ownership, searched by object on main and at the open heads (plurigenera, Kodaira dimension, canonical line or sheaf, `AlgebraicChart`, very general):
  - no other owner of the twisted canonical line, pluriform sections or the negative condition;
  - SchemeAndStackFoundations §2.20 owns the dualizing module, a different construction;
  - HilbertModularSurfaces, StableReductionPartII and ComplexComparisonPartII (open) do not own these objects;
  - AdicSpacesPartIV is R02;
  - `overlaps.md` (none) confirmed.
- Pull request text: no sentence is contradicted by the head (a new roadmap, four definitions and one theorem, the same suppliers). After R01, its two "very-general" phrases should follow the repaired statement.

## Not verifiable

- The claim that TauCeti#35874 "has landed in Tau Ceti": the pinned Tau Ceti checkout is shallow, and this review makes no GitHub reads.
- The openai/math family 033 Lean files at `4eaee875`: not opened, since no target depends on them.

## Source issues

- none
