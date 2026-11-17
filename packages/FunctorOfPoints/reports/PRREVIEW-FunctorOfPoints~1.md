# Review of FunctorOfPoints (pull request #2465 at 1ba6596)

**Verdict:** needs changes

## R01 (P1) — `qcoh_fpqc_descent_iff` is an equivalence between two theorems

**Location:** `TauCetiRoadmap/FunctorOfPoints/README.md` lines 751–754: "`qcoh_fpqc_descent_iff`: via §6.3 and §0.3, the presheaf statement above is equivalent to SchemeAndStackFoundations §1.1's `qcoh_fpqc_descent`".
**Claim:** The target is `P ↔ Q` with `P`, `Q` both closed theorems; it holds for any two true propositions and tests nothing about the transport.
**Witness:** `P` = `moduleCatExtendScalarsPseudofunctor_isStack` (line 747), `Q` = SchemeAndStackFoundations README line 2800; neither has a free variable, so `P ↔ Q` follows from `P` and `Q` separately.
**Repair:** Delete the `iff` target. Replace the bullet by: "Deduce `moduleCatExtendScalarsPseudofunctor_isStack` from SchemeAndStackFoundations §1.1 `qcoh_fpqc_descent` by restricting `Descent.qcohPseudofunctor` along `algSpec` and applying §6.2 on each affine; this is the only proof of descent."

## R02 (P2) — the absolute case `R = ℤ` exists only in universe 0

**Location:** README lines 105–107 and 440–447: "`overSpecIntEquiv : Over (Spec (CommRingCat.of ℤ)) ≌ Scheme.{u}` from `specZIsTerminal`"; "`CommAlgCat.intEquiv : CommAlgCat.{u} ℤ ≌ CommRingCat.{u}`".
**Claim:** Layers 0–2 take `R : Type u`; `ℤ : Type` instantiates them only at `u = 0`, so `schemeEquivAbsolute : Scheme.{u} ≌ …` is not the case `R = ℤ` of §2.2.
**Witness:** Scratch copy: `example : GrothendieckTopology (CommAlgCat.{u} ℤ)ᵒᵖ := zariskiTopology ℤ` fails, "has type `GrothendieckTopology.{0, 1}`"; Mathlib `specZIsTerminal` (`AlgebraicGeometry/Limits.lean:45`) lives in `Scheme.{0}`.
**Repair:** Use `ULift.{u} ℤ` throughout §2.4 and Convention 3: `CommAlgCat.{u} (ULift.{u} ℤ) ≌ CommRingCat.{u}`, `Over (Spec (.of (ULift.{u} ℤ))) ≌ Scheme.{u}` from Mathlib `specULiftZIsTerminal` (`Limits.lean:50`); amend Convention 4's "no other universe lift". `zariskiTopology (ULift.{u} ℤ)` elaborates.

## R03 (P2) — the front door is stated through a stand-in

**Location:** `TauCetiRoadmap/FunctorOfPoints/Suggested.lean` lines 74–76: "`theorem schemeEquiv_exists : Nonempty (Over (Spec (CommRingCat.of R)) ≌ LocallyRepresentable R)`".
**Claim:** The statement does not mention `pointsFunctor`; any equivalence proves it, so it does not test README §2.2 ("whose functor is `pointsFunctor`"). The gate's `statement-hygiene` also refuses it (line 75).
**Witness:** An equivalence whose functor is `pointsFunctor` precomposed with any autoequivalence of `Over (Spec R)` satisfies the Lean statement and not §2.2.
**Repair:** Replace it by the two statements (both elaborate at the pins, with the existing `pointsFunctor_full`, `pointsFunctor_faithful`): `∀ X, IsLocallyRepresentable ((pointsFunctor R).obj X)` and `IsLocallyRepresentable F ↔ ∃ X, Nonempty ((pointsFunctor R).obj X ≅ F)` (README's `isLocallyRepresentable_iff`).

## R04 (P2) — statable headline theorems are absent, and the docstring does not name the unstatable ones

**Location:** `Suggested.lean` lines 15–18: "The lifting criteria and coherent module-family category are specified in the README; they require the earlier formal-morphism and module-coherence interfaces".
**Claim:** §1.3 (closed immersions), §4.2 (discrete valuation rings suffice) and §5.2 (Grassmannian is locally representable) are statable at the pins and not stated; the docstring names no theorem and no missing carrier.
**Witness:** Elaborated in a scratch copy: `IsClosedImmersion f.left ↔ ∃ G, IsClosedSubfunctor G ∧ …`; `UniversallyClosed f ↔ ∀ V [IsDiscreteValuationRing V] …` under `[IsLocallyNoetherian Y] [LocallyOfFiniteType f] [QuasiCompact f]`; `IsLocallyRepresentable (unopUnop _ ⋙ Module.Grassmannian.functor k)`.
**Repair:** State these three. In the docstring list, per theorem: §3.2 `formallySmooth_iff_points` (no scheme-level `FormallySmooth` at the pins), §6.3 `moduleEquivQuasicoherent` and §6.4 (no `Module F` carrier), §3.1 (no `tangentSpace` module structure).

## R05 (P2) — supplier declarations cited that do not exist at the pins

**Location:** README lines 718, 786, 758, 365, 675, 727: "`tildeEquivFunctorCompPullbackIso`"; "`TauCeti.DescentDatum.exists_isAffineHom_baseChange_hom_isIso_of_quasiCompact`"; "Tau Ceti `ModuleCat/RealDescent.lean`"; "Tau Ceti `IsoLocus`"; "its fpqc prestack property"; "`bigRingCatSheaf`".
**Claim:** None of the six is in the pinned Tau Ceti or Mathlib, and `bigRingCatSheaf` is in no roadmap; §6.3's `baseChange` is built from the first.
**Witness:** Pinned Tau Ceti has `tildeFunctorCompPullbackIso` (`AlgebraicGeometry/Modules/Tilde/Basic.lean:219`) and `exists_isAffine_baseChange_hom_isIso` (`AlgebraicGeometry/Descent/Affine.lean:532`); no file `RealDescent.lean`, no `IsoLocus`, no `IsPrestack` theorem for `qcohPseudofunctor`.
**Repair:** Cite the two pinned names above; drop `RealDescent.lean`, `IsoLocus` and "its fpqc prestack property" (or state the prestack property as a §6.4 target); cite SchemeAndStackFoundations §2.9 by `bigSheaf_fullyFaithful` only.

## R06 (P2) — §4.2's proof route does not reach the statement

**Location:** README lines 576–579: "The proof reduces to Mathlib's criterion through the existence of a dominating discrete valuation ring for a specialization of points of a Noetherian scheme (Stacks 00PH for the algebra)."
**Claim:** Mathlib's criterion needs lifts for every valuation ring; 00PH produces discrete valuation rings only, so existence for arbitrary `V` is not derived, and no listed input closes the gap.
**Witness:** Stacks Lemma 32.15.4 (05JY) passes through its condition (2), closedness of `𝔸ⁿ × X → 𝔸ⁿ × S` for all `n`, with Lemma 32.15.1 (0CM2); neither is in `*Needs:*`.
**Repair:** Route: universally closed iff `𝔸ⁿ_Y ×_Y X → 𝔸ⁿ_Y` is closed for all `n` (state it as a §4.2 target, 05JY (1)⇔(2)); closedness on locally Noetherian targets by lifting specializations to discrete valuation rings (0CM2, using 00PH). Add both to `*Needs:*`.

## R07 (P2) — suppliers listed as consumers

**Location:** README lines 802–805: "AlgebraicModuliForArithmeticGeometry (Weil restriction and projective bundles, which may use §§5.3–5.4 and §6.5 as their affine interface), ModularCurves (moduli problems on `(CommAlgCat R)ᵒᵖ`)".
**Claim:** Both are suppliers on main (§5.3 and §6.5 consume AlgebraicModuliForArithmeticGeometry §1.1; Scope consumes ModularCurves); naming them consumers of the same sections is a cycle. Neither README cites this roadmap.
**Witness:** README line 631: "is AlgebraicModuliForArithmeticGeometry §1.1 (`projectiveBundle` … `rankOneGrassmannComparison`)"; line 774 likewise. Lines 802–803 also list ReductiveGroups with "they do not depend on this roadmap".
**Repair:** Downstream consumers: "SemiringSchemes (the ring case of its §4.1 and §5.3), FlagVarieties and SchubertGeometry (Grassmannian and flag functors)." Delete AlgebraicModuliForArithmeticGeometry, ModularCurves, ReductiveGroups and ReductiveGroupsPartII from the list.

## R08 (P2) — the generic open-immersion layer has two claimed owners

**Location:** README lines 86–88: "The generic layer of this roadmap (a site with a class of open subfunctors and a locally representable full subcategory) is instantiated for commutative semirings".
**Claim:** No layer here states a generic site-with-open-immersions theory (Layers 0–2 are on `(CommAlgCat R)ᵒᵖ` with ideals), and the open SemiringSchemes roadmap owns exactly that object.
**Witness:** SemiringSchemes README (pull request #2466) lines 48–53: "*The generic layer* (§4.1) … **This roadmap owns it**"; its line 633 defines `IsOpenSubfunctor P J X U` for a general site.
**Repair:** Replace the sentence by: "The generic theory of open subfunctors and schemes over a site with a class of basic open immersions (Toën–Vaquié) is SemiringSchemes §4.1; this roadmap states the commutative-ring case only."

## R09 (P3) — §4.2 locators and hypotheses

**Location:** README lines 574–576: "For `f` of finite type, `Y` locally Noetherian, `f` quasi-separated: `f` is universally closed iff … (EGA II, Théorème 7.3.8; Stacks, Section 32.15); likewise for separatedness".
**Claim:** EGA II 7.3.8 gives the discrete-valuation form for properness (bijectivity) only; the separatedness lemma needs only locally of finite type; quasi-separatedness is not a hypothesis of any of the three lemmas.
**Witness:** EGA II (PMIHES 8) line 5705–5712: locally Noetherian, finite type, proper ⇔ bijective for discrete valuation rings. Stacks 0207: `S` locally Noetherian, `f` locally of finite type; 05JY, 0208: finite type.
**Repair:** "Let `Y` be locally Noetherian. For `f` of finite type: universally closed iff surjective for all discrete valuation rings (Stacks Lemma 32.15.4 (05JY)); proper iff bijective (Lemma 32.15.3 (0208); EGA II 7.3.8). For `f` locally of finite type: separated iff injective (Lemma 32.15.2 (0207))."

## R10 (P3) — `tangentSpaceEquivZariski` carries an unneeded hypothesis

**Location:** README lines 493–496: "For `k` a field, `X` locally of finite type over `k` and a rational point `x`, `tangentSpace (pointsFunctor X) x ≃ₗ[k] Module.Dual k (CotangentSpace …)` … Stacks Section 33.16".
**Claim:** The identification holds for every `k`-scheme at a `k`-rational point; the source assumes only equality of residue fields.
**Witness:** Stacks Lemma 33.16.5 (0B2E): `f : X → S`, `κ(x) = κ(s)`, no finiteness. Instance: `X = Spec k[x₁, x₂, …]` at the origin, both sides `Hom_k(𝔪/𝔪², k)`.
**Repair:** "For `k` a field, `X` a `k`-scheme and `x` a `k`-rational point, … (Stacks Lemma 33.16.5 (0B2E))."

## R11 (P3) — two reference glosses do not match the texts

**Location:** README line 832: "01BG (pullback of modules is a pseudofunctor)"; lines 823–825: "Strickland … §§2–4 (schemes as functors, open and closed subfunctors, modules over functors)".
**Claim:** 01BG is about quasi-coherence of a pullback; Strickland's §4 is formal schemes, and subschemes and modules are subsections of §2.
**Witness:** Stacks 01BG = Lemma 17.10.4, pullback of a quasi-coherent module is quasi-coherent. Strickland (arXiv math/0011121v1) lines 13–24: 2.3 Subschemes, 2.6 Sheaves, modules and vector bundles, 2.7 Faithful flatness and descent, 3 Non-affine schemes, 4 Formal schemes.
**Repair:** "01BG (pullback preserves quasi-coherence)"; "Strickland, §2.1 (schemes as functors), §2.3 (subschemes), §§2.6–2.7 (modules, faithfully flat descent), §3 (non-affine schemes)".

## R12 (P3) — a layer is described as a source's sections

**Location:** README line 672: "This layer is Demazure–Gabriel I.2.5 and Jantzen I.2.8–I.2.11 in Mathlib's language".
**Claim:** A roadmap does not say that a layer follows a source; results are cited with locators at the claim.
**Witness:** The sentence itself; §§6.1–6.6 then carry no locator at any claim.
**Repair:** "A quasi-coherent module on a functor `F` is a rule assigning an `A`-module to each `A`-point, compatible with base change." Put the locators at the claims: §6.1 definition, §6.3 equivalence (each with its own verified locator).

## R13 (P3) — gate: residue

**Location:** README line 749: "(the TODO in Mathlib's `ModuleCat/Descent.lean` docstring, here in the form needed on affine test objects)".
**Claim:** The gate's `residue` rule refuses the word.
**Witness:** `gate.md`, residue (1), line 749.
**Repair:** "(Mathlib's `ModuleCat/Descent.lean` proves comonadicity of extension of scalars and does not state the stack property; it is stated here on affine test objects)".

## R14 (P3) — gate: backticked names of this roadmap not declared in `Suggested.lean`

**Location:** README lines 190, 230, 235, 331, 425–426: "`zariskiTopology_def`, `fpqcTopology_def`", "`pointsFunctor_obj_isSheaf`", "`pointsFunctor_preservesLimits`", "`isOpenSubfunctor_iff`", "`isLocallyRepresentable_of_isRepresentable`", "`IsLocallyRepresentable.affine_iff`".
**Claim:** The gate's `readme-ids-missing` rule lists these seven.
**Witness:** `gate.md`, readme-ids-missing (7).
**Repair:** State each fact in prose without the backticked name (or in italics), as the rule says; do not add declarations.

## R15 (P3) — padding and unused material in `Suggested.lean`

**Location:** `Suggested.lean` lines 5, 35–37, 92–102: "`theorem pointsFunctorUliftIso_exists … := by exact ⟨Iso.refl _⟩`"; "`theorem pointsFunctorAlgSpecIso_exists`"; "`public import TauCeti.AlgebraicGeometry.Modules.Quasicoherent.Basic`".
**Claim:** The first closes by `rfl`; the second is the affine boundary case, pointwise `algSpec.fullyFaithful.homEquiv`; `fpqcTopology` and the second import are used by no statement. The gate's `statement-hygiene` refuses lines 94 and 100.
**Witness:** Scratch copy: `(pointsFunctor R).obj X ⋙ uliftFunctor = (pointsSheaf X).obj := rfl` elaborates; the file elaborates with the `Quasicoherent.Basic` import removed.
**Repair:** Delete both theorems, `fpqcTopology` and the unused import from `Suggested.lean` (the README keeps the statements).

## R16 (P3) — `Suggested.lean` form

**Location:** `Suggested.lean` lines 8, 31–71, 86–90: "# The functor of points: suggested interfaces".
**Claim:** The module docstring is not "…: target signatures" and does not say the file states the headline theorems against the pinned APIs; nine declarations have no docstring; no `/-! ## Layer k -/` sections; four Lean names are not in the README.
**Witness:** No docstring on `zariskiTopology`, `fpqcTopology`, `pointsFunctor`, `IsOpenSubfunctor`, `IsClosedSubfunctor`, `IsLocallyRepresentable`, `LocallyRepresentable`, `pointsFunctor_full`, `pointsFunctor_faithful`; README has `IsOpenImmersion.iff_pointsFunctor`, Lean `isOpenImmersion_iff_points`.
**Repair:** Retitle and complete the docstring (with R04's list); add a mathematical docstring to every declaration; add layer section comments; use one name per target in both files.

## R17 (P3) — README shape and policy

**Location:** README lines 138, 140, 158, 662: "## Supplier interfaces and ownership"; "the Lean prototype"; "[the QuasicoherentSheavesOnPrestacks proposal](https://github.com/TauCetiProject/TauCetiRoadmap/pull/2450)"; "### 5.5 Hilbert and Quot functors **[not a target here]**".
**Claim:** The supplier section is not `## Exact supplier contracts` with per-supplier lists; a pull-request link and process words appear; §5.5 is a non-target section; no layer ends with `### Examples` and `### Dependencies`; §§2.3–2.5, 3.1, 5.1–5.4, 6.1–6.2, 6.4–6.6 have no `*Needs:*`.
**Witness:** SchemeAndStackFoundations README lines 401, 2746, 2754 show the shape on main.
**Repair:** Rename and split the section into `### From Mathlib`, `### From Tau Ceti`, `### From TauCetiRoadmap.<X>`; cite "QuasicoherentSheavesOnPrestacks (Scope and ownership)"; delete §5.5 (Scope line 86 already defers it); add the two closing subsections per layer and the missing `*Needs:*` lines.

## R18 (P3) — Checks

**Location:** README lines 271–274 (§0.3) and §§2.1–2.2, 2.4, 2.5, 3.1b, 5.1, 5.2, 5.4, 6.1, 6.2, 6.3, 6.5: "The equivalence sends the terminal sheaf to the terminal sheaf."
**Claim:** The quoted Check holds for every equivalence of categories; the listed sections define objects with fewer than three Checks (most with none); §§0.3, 1.2, 1.3 have two.
**Witness:** Any equivalence preserves terminal objects, so the Check does not separate restriction along `algSpec` from another functor.
**Repair:** Replace the quoted Check by "the image of the Yoneda sheaf of `𝔸¹_R` has `A`-points `A`". Add three discriminating Checks per definition, e.g. §5.4: `Res_{ℂ/ℝ} 𝔾_m(ℝ) = ℂˣ`; `Res_{(R×R)/R} F = F × F`; `Res` of `D(t) ⊂ 𝔸¹` along `R → R[ε]` is `D(t₀)`.

## R19 (P3) — targets stated conditionally on what the library turns out to contain

**Location:** README lines 265–267, 440–442, 744–746, 116–117: "If Mathlib's `Functor.IsDenseSubsite.sheafEquiv` applies at these universes, use it and record the hypotheses it needed; if it does not…"; "build it if Mathlib has none"; "where it exists at these universes; otherwise state the theorem for a given locally bijective `α`".
**Claim:** A roadmap is definite about scope and timeless; these leave the statement to be chosen later and address contributors.
**Witness:** Mathlib `IsDenseSubsite.sheafEquiv` (`CategoryTheory/Sites/DenseSubsite/Basic.lean:788`) needs limits over structured arrows of the large category `CommAlgCat.{u} R`, which `Type u` lacks.
**Repair:** §0.3: state the explicit inverse as the construction. §2.4: state both equivalences as targets (with R02). §6.4: keep only the theorem for a locally bijective `α`; delete the sheafification bullet. Delete "Contributors must not change universes to make an instance fire."

## R20 (P3) — `pointsFunctorAlgSpecEquiv` restates a Tau Ceti declaration

**Location:** README lines 237–238: "`(pointsFunctor (algSpec B)).obj (op (op A)) ≃ (B →ₐ[R] A)` (`pointsFunctorAlgSpecIso`, `pointsFunctorAlgSpecEquiv`)".
**Claim:** The pointwise equivalence is at the pin.
**Witness:** Tau Ceti `algSpecHomEquivAlgHom : ((algSpec R).obj (op B) ⟶ (algSpec R).obj (op A)) ≃ (A →ₐ[R] B)`, `AlgebraicGeometry/Scheme/SpecOver.lean:106`.
**Repair:** Drop `pointsFunctorAlgSpecEquiv`; cite `algSpecHomEquivAlgHom` under the Tau Ceti contracts and keep only the naturality statement.

## R21 (P3) — the stated layer order contradicts the sections

**Location:** README lines 166–167: "Layers 3, 4 and 5 depend on Layers 0–2 and are independent of each other."
**Claim:** §5.3 uses Layer 4 and its Check uses §3.1; §6.5 uses §5.3.
**Witness:** README line 636: "the valuative criterion in points form for `ℙⁿ_R → Spec R` (via Layer 4 and the local description)"; line 773: "The tautological quotient on `ℙⁿ` (§5.3)".
**Repair:** "Layers 3 and 4 depend on Layers 0–2 and are independent of each other; Layer 5 depends on Layers 0–2 and, for §5.3's properness statement, on §4.1; Layer 6 depends on Layers 0–2, on §3.1b for §6.6 and on §5.3 for §6.5."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 standard covers, fpqc criterion | `R × R`; zero algebra; `{ℤ→ℤ[1/p], ℤ→ℤ_(p)}` | idempotent cover, overlap `0`; empty span = `⊤` iff `A = 0`; a Zariski refinement needs `p ∣ fᵢ` for all `i`, span ≠ `⊤` | holds; 03O1 = Lemma 59.15.6 | none |
| 0.2 points functor | empty scheme; `Spec R ⊔ Spec R` at `A = R × R`; `𝔸ⁿ` | `∅(A) = ∅` for `A ≠ 0`, one point at `0`; 4 idempotents; `Fin n → A` via `homOverEquiv` | holds | R15, R20 |
| 1.1 lattice laws | `k[x,y]`, `(xy)`; `D(x)` vs `D(x²)`; `(2,x) ⊂ ℤ[x]` | `V(I∩J) ⊆ V(IJ)`; `V(x) ≠ V(x²)` at `k[x]/(x²)`; closed point of a regular surface, complement not affine | holds | none |
| 1.2 open/closed subfunctor | `Aˣ ⊂ A`; `{0}`; nilradical; `B = 0` | `I = (x)`; `I = (x)`; closed forces `I ⊆ ⋂(tⁿ) = 0`, open forces `U = {origin}`; zero-ring point always in `G` | holds | none |
| 1.3 immersion dictionary | `ℙ¹` at `A = k[x]`, `(x, 1−x)`; `V(t²)` vs `V(t)` | point in neither `U₀(A)` nor `U₁(A)`, in `Uᵢ` over `A_x`, `A_{1−x}`; converse direction via field points and `V(I) = V(J) ⇔ I = J` | holds | R04 (closed case absent in Lean) |
| 2.2 front door | empty functor; idempotents functor; Lean statement | empty cover covers only `A = 0`; `Spec(R × R)`; `Nonempty (≌)` satisfied by any equivalence | README holds; Lean is a stand-in | R03 |
| 2.3 closure properties | `Aˣ/μ₂` at `ℚ → ℚ(√2)`; `Pic` presheaf | `√2 ⊗ 1` and `1 ⊗ √2` differ by a square root of 1; Zariski sheafification is a point | holds | none |
| 2.4 absolute case | `u = 0`; `u` arbitrary | `zariskiTopology ℤ : GrothendieckTopology.{0,1}`; mismatch at `.{u, u+1}` | fails for `u ≠ 0` | R02 |
| 2.5 presheaves on all schemes | `yoneda X` | restriction is the absolute points functor; `SchemePresheaf = Scheme.{u}ᵒᵖ ⥤ Type u` (`AlgebraicSpace/Basic.lean:68`) | holds given R02 | R02 |
| 3.1 tangent spaces | `μ_p/𝔽_p`; cusp; `Spec k[x₁,x₂,…]` | `k[t]/(t−1)^p`: `T = k`; `k²`; identification holds without finite type | holds; hypothesis unneeded | R10 |
| 3.2 infinitesimal lifting | origin in `𝔸¹_k`; `k[t]/(t²)`; `μ₂/𝔽₂`, `A = 𝔽₂[u]/(u⁴)`, `I = (u²)` | target `{t ↦ cε}`, image `c = 0`; `t ↦ 0, ε` collide; `(1+u+cu²+du³)² = 1+u² ≠ 1` | holds; 02H0 thickenings affine as in SchemeAndStackFoundations §4.1 | none |
| 4.1 lifting map | `𝔸¹_ℤ`, `V = ℤ_(p)`, `1/p`; doubled origin | no lift; two lifts; Mathlib tags 01KF, 01L0, 01KZ, 0BX5 at `ValuativeCriterion.lean:231–341` | holds | none |
| 4.2 discrete valuation rings | Stacks 05JY, 0207, 0208; EGA II 7.3.8 | 05JY: finite type; 0207: locally finite type; EGA: proper ⇔ bijective only | statement holds; locators, route wrong | R06, R09 |
| 5.1 affine space | `n = 0`; `V(Tᵢ)`, `D(Tᵢ)` | one point; `xᵢ = 0`, `xᵢ ∈ Aˣ` | holds | R18 |
| 5.2 Grassmannians | local `A`, `k × n` matrices; `Module.Grassmannian.functor` type | surjective ⇔ a unit `k × k` minor, `GL_k` on the left; `CommAlgCat R ⥤ Type (max v w)` (`RingTheory/Grassmannian.lean:185`) | holds; statable | R04 |
| 5.3 projective space | `n = 0`; `A = 0`; `ℤ[√−5]`, `(2, 1+√−5)`; `k[ε]` | `Spec R`; one point; non-free rank-one quotient of `A²`; fibre over `[1:0]` is `k` | holds; quotient convention consistent with §1.3, §6.6 | R21 |
| 5.4 Weil restriction | closed `V(I)`, open `D(I)`, `B` finite projective | coefficient ideal in `T`; complement of the finite image of `V(I)` | holds | R18 |
| 5.5 Hilbert and Quot | SchemeAndStackFoundations §4.14, AlgebraicModuliForArithmeticGeometry Layer 2 | both sections exist on main (README lines 7025; 1078) | citation resolves; section is a non-target | R17 |
| 6.2 affine case | `F = ∗ = h_R`; `B → B'` | `Module ∗ ≌ ModuleCat R`; pullback is extension of scalars | holds | R18 |
| 6.4 fpqc invariance | `ℝ → ℂ`; `ℤ → ℤ[1/2] × ℤ_(2)`; `ℤ → ℚ`; `qcoh_fpqc_descent_iff` | involution datum; overlap `ℚ`; `ℤ/2 ⊗ ℚ = 0`; `P ↔ Q` of closed theorems | theorem holds; one bullet vacuous | R01, R05, R13, R19 |
| 6.6 affine morphisms | `Spec Sym(L)` over `ℙ¹` | points `A² ↠ L_x → A`, a form in the line `L_x^∨`: blow-up of `𝔸²` at the origin | holds | none |
| `isOpenImmersion_iff_points` (Lean) | `f` a non-open monomorphism `Spec k → 𝔸¹` | image subfunctor is `V(t)`, not of the form `D(I)`: right side false, left side false | holds | none |
| `pointsFunctor_full`, `_faithful` (Lean) | `infer_instance` | fails; not one-tactic | kept | none |

- Source locators checked against the text: 18 (Stacks 03O1, 0CM1 with 0CM2/0207/0208/05JY, 00PH, 0B28/0B2E, 023T, 01BG, 0GN7, 02H0, 02HG; EGA II 7.3.8; Strickland contents; seven tags against Mathlib's `@[stacks]` attributes).
- Library declarations opened at the pin: 31 (among them `algSpec` `Group/Affine.lean:72`, `fpqcTopology` `Sites/Fpqc.lean:76`, `LocalRepresentability.isRepresentable` `Sites/Representability.lean:202`, `pointsSheaf` `CommAlgCat/Fppf.lean:155`, `IsFirstOrderThickening.SpecMap_iff` `Morphisms/Thickening.lean:203`, `comonadicExtendScalars` `ModuleCat/Descent.lean:62`).
- Cross-roadmap citations resolved: 14 (SchemeAndStackFoundations §§1.1, 2.9, 4.1, 4.14; AlgebraicModuliForArithmeticGeometry §§1.1, 1.3, 3.4, Layer 2; ModularCurves 0F–0G through its table at line 4508; AlgebraicVectorBundles L0A–L1B through its line 346; ReductiveGroups Layers 1, 2; SemiringSchemes; QuasicoherentSheavesOnPrestacks).
- Gate at 1ba6596: FAIL (residue 1, statement-hygiene 3, readme-ids-missing 7; build 0, depcheck 0, set_option 0, sorry-data 0).
- Dependency check: `depcheck: 261 roadmaps, 2596 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates, `sorry` the only warning (5); `#check @name` types of all 14 declarations compared with the README, no section binder lost.
- One-tactic probe: `pointsFunctorUliftIso_exists` closes by `rfl`; `pointsFunctor_full`/`_faithful` do not close by `infer_instance`; the four replacement statements of R03–R04 elaborate.
- Pull request text read against the head: no sentence contradicted; changes outside the folder: none.

Overlap check: read SemiringSchemes, QuasicoherentSheavesOnPrestacks, SchemeAndStackFoundationsPartII (titles and scope), SchemeAndStackFoundations, AlgebraicModuliForArithmeticGeometry, AlgebraicVectorBundles; the generic open-immersion layer is SemiringSchemes §4.1's (R08); scheme-level fpqc descent is SchemeAndStackFoundations §1.1's; the coalgebra form of affine module descent is AlgebraicModuliForArithmeticGeometry §3.2's; derived `QCoh` on prestacks is PrismaticCohomologyPartII §4.0's and QuasicoherentSheavesOnPrestacks'; nothing else shared.

Source independence: 9 passages compared with 4 sources (Stacks project, EGA II, Strickland, Toën–Vaquié), none shared; largest share Stacks project, 8 of 19 in-text locators; contents compared with the Stacks project: independent (the tags cited lie in Chapters 10, 26, 32, 33, 59). Demazure–Gabriel, Jantzen, Eisenbud–Harris, Bosch–Lütkebohmert–Raynaud and Milne could not be read.

Research link: Layers 0–2 are the commutative-ring case of the relative schemes of Toën–Vaquié (2009), which the SemiringSchemes roadmap instantiates; the remaining layers restate Demazure–Gabriel (1970) and Jantzen (2003) for use by flag-variety roadmaps. Rests on the README's Scope, Downstream consumers and References.

## Not verifiable

- Demazure–Gabriel I.1.3.6, I.2.4.1, I.1.3.11, I.2.5 (§§1.2, 2.1, Layer 6): no legal copy found by the sources service.
- Jantzen I.1.7, I.1.12, I.2.8–I.2.11 (§1.2, Layer 6, References): no legal copy; the publisher's contents page refused the request. Whether Chapter I.2 treats modules over a `k`-functor could not be confirmed.
- Eisenbud–Harris Theorem VI-14, VI.1 (§§2.1, 3.1): no legal copy found.
- Bosch–Lütkebohmert–Raynaud 7.6/4 (§5.4): paywalled; cited by locator, uncertified.
- Milne, Chapter 1 and Appendix A (References only): publisher page in no licence class.

## Source issues

- none

## For the human reviewers

- Scope: the headline theorems are textbook results (Demazure–Gabriel 1970, EGA II 1961, Stacks project); the only research article in `README.md` References is Toën–Vaquié 2009, cited for an out-of-scope extension.
- Licence: the pull request description says the folder was adapted from a "supplied draft" whose "original repository and source PR are preserved"; the draft's repository and licence are not named in the folder or the description.
- Not tested: Layers 1, 2 and 6 cite Demazure–Gabriel Chapitre I (§§1, 2) most among the books; its table of contents could not be read, so the arrangement of those layers was not compared with it.
