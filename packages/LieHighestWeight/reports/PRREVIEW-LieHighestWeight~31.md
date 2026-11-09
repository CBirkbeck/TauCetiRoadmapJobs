# Review of LieHighestWeight (pull request #1797 at df89c5d)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`

**Verdict:** needs changes

The gate passes at this head and `Suggested.lean` elaborates with 12 `sorry` warnings and nothing else. The 12 headlines are stated on native carriers, and every one I computed is true. Of the previous review's 21 findings, 15 are repaired, 3 are partly repaired and 3 are not (table under Verified sound). The blocking finding is R01: the two-way supply with ClassicalGroups and LieGroups, which was the previous R04.

## R01 (P2) — Two-way supply with ClassicalGroups and LieGroups; ClassicalGroups Layer 4's summit has two owners
Not repaired from the previous review (its R04).
- **Location:**
  - README 777–779: "Conclude P_λ=χ_λ|_T and hence the denominator-cleared Weyl character formula by this independent polynomial/Haar route". The precursor (643–818) consumes ClassicalGroups Layer 3 and LieGroups Layers 6–7.
  - README 919–921: Layer 6F consumes "ClassicalGroups Layers3–4's group-character comparison" and, at 967, LieGroups Layer 6.
  - README 1371–1377: Layer 9's LR application consumes ClassicalGroups Layers 2–4.
  - README 1693–1722: "Late compact-center application in LieGroups" plans a LieGroups target here.
  - `Suggested.lean` 52–55 concedes that the precursor "reproves by an independent route" the ClassicalGroups Layer 4 headline.
- **Claim:**
  - The type-A character identification has two owners.
  - Supply runs both ways between this roadmap and two roadmaps on main.
  - A theorem of LieGroups is planned in this roadmap.
- **Witness:**
  - ClassicalGroups `README.md:284–288` states `char (irreducible n μ) (diagonal x) = schurPoly n μ (x)` as "the summit of this layer". Its lines 239–240 say Layer 3 is "Built on … LieHighestWeight".
  - LieGroups `README.md:750` consumes this roadmap's Layer 0, and `:1432` its Layer 7.
  - The dependency check reports 0 problems only because this README has no `*Needs:*` line.
- **Repair:**
  1. Cite ClassicalGroups Layer 4 for `P_λ = χ_λ|_T` and delete the precursor's proof plan. If the Haar route is wanted, it belongs to ClassicalGroups Layer 4 as a second proof, or to a Part II placed after ClassicalGroups and LieGroups.
  2. Move Layer 6F's group-side comparison and torus Fourier transport to that same Part II. Keep only the Lie-algebra fixed-point identity here.
  3. Choose one of two options for the Layer 9 LR headline.
     - Route it through the Lie side only: native `TauCeti.isIrreducible_glIrreducible_restrict_sl`, the native `sl_n` character formula, SchurWeyl Layer 7's bialternant, and linear independence of Schur polynomials. No ClassicalGroups input is then needed.
     - Or hand it to ClassicalGroups Layer 4, which already claims the LR multiplicities of `V_λ` (`README.md:278–279`).
  4. Move the compact-centre theorem `Z(G) ≃ P∨/Y` into LieGroups as its own target. Here, list LieGroups under `## Downstream consumers`.
  5. Add `*Needs:*` lines so the dependency check sees these edges.

  After the repair, no section here consumes ClassicalGroups or LieGroups. Rerun the dependency check to confirm.

## R02 (P3) — The README is not in house shape
Not repaired from the previous review (its R16).
- **Location:**
  - Headings at 75 ("Standing conventions"), 170, 265 and 343.
  - Layers are `###` headings at 349–1366, with no `### k.n` subsections.
  - "Worked examples" (1484) comes before Layer 10 (1574).
  - "Ordering" is at 1724.
- **Claim:** none of the following exists:
  - `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` (From Mathlib, From Tau Ceti, From TauCetiRoadmap.<X>) and `## How to read the build`;
  - `## Layer k` / `### k.n`;
  - a per-layer `### Examples` and `### Dependencies`;
  - `**Checks.**` and `*Needs:*`;
  - `## Downstream consumers`.
- **Witness:** `grep -c` returns 0 for each of these markers.
- **Repair:**
  - Restructure into the house shape. The open revision #1220 already uses it.
  - Put the native list (303–339) and the ScatteringDiagrams and ClassicalGroups deferrals under Scope and ownership. Put every consumed native declaration, with its file, under From Tau Ceti.
  - Give each object this roadmap defines at least three discriminating Checks. These objects are the ℤ-submodule `P` of integral weights, the Grothendieck ring, the zero-fibre bracket, the formally real Albert algebra, the cross product and `Γ_root`. The computed examples already in the README are ready-made Checks:
    - sl₂ `Ω ↦ t²+2t`;
    - A₂ dimensions 3, 3, 8, 6, 10;
    - the gl₂ Casimir scalar 2 on `(1,0)`;
    - the staircase gap `4(t−s)`;
    - the branching determinant `−1`.
  - List the consumers: ClassicalGroups, LieGroups, AdoIwasawa, ChevalleyGroups, CharacteristicClasses C5.1, SpinRepresentations Layer 9, TangentialBordism §§9.1–9.2 and DGFloer.

## R03 (P3) — Layers 0 and 5 still plan as open results the pinned Tau Ceti proves
Partly repaired from the previous review (its R06).
- **Location:**
  - README 361–364, `V(n)`: "Construct it (as a `U(sl₂)`-module on `Kⁿ⁺¹` …) and prove it irreducible".
  - 370–373: sl₂ complete reducibility, "Prove it by the weight-string / primitive-vector argument".
  - 378: Clebsch–Gordan.
  - 620–623, Casimir: "Prove centrality and compute the eigenvalue".
- **Claim:** what exists at the pins is cited, not planned again. The module docstring (`Suggested.lean` 19–24) itself lists Layers 0 and 5 as native.
- **Witness:** native at the pin:
  - `TauCeti.Sl2Std` (`Algebra/Lie/Sl2/Standard.lean:153`)
  - `exists_isIrreducible_hasPrimitiveVectorWith` (`Standard.lean:1086`)
  - `TauCeti.exists_isCompl_sl_fin_two` (`Sl2/CompleteReducibility.lean:149`)
  - `TauCeti.Sl2Std.isInternal_cgSummand` and `nonempty_lieModuleEquiv_cgSummand` (`Sl2/ClebschGordan.lean:275,254`)
  - `TauCeti.casimirElement_mem_center` (`UniversalEnveloping/Casimir.lean:175`)
- **Repair:** rewrite these bullets as "Consume native …" with these names, as Layers 2–7 already do, and list them under From Tau Ceti.

## R04 (P3) — Names this pull request drops that open roadmaps cite, with no old → new line
- **Location:** README 1264–1335, where the formally real Albert supplier is now prose without names, and the old → new list at 322–339.
- **Claim:** the list maps PBW and Chevalley names but not the compact Albert names that main's text exported.
- **Witness:**
  - Main's `README.md:1333–1398` names `compactAlbertAlgebra`, `compactAlbertDerivation_complexification` and `compactAlbertDerivation_killing_negDef`.
  - TangentialBordism (#942 head) cites them at `README.md:333`, 2513 and 2579–2580.
  - DGFloer (#963 head) cites `compactAlbertAlgebra`.
- **Repair:** add one line per dropped name. For example: "`compactAlbertAlgebra`, `compactAlbertDerivation_complexification`, `compactAlbertDerivation_killing_negDef` → the formally real Albert supplier of Layer 8 (a README target; not statable at the pins, see the module docstring)."

## R05 (P3) — `module_finite_of_central_monic_relations` is an adapter, not a headline
- **Location:** `Suggested.lean` 70–82. README 459–466 says: "The central-subalgebra adapter … converts its explicit monic relations to `IsIntegral` before applying those native theorems … it does not rebuild native finite-spanning or module-finiteness machinery."
- **Claim:** by the README's own account, this is type-class plumbing around a native theorem. `Suggested.lean` is the acceptance test, not an API catalogue.
- **Witness:**
  - Native `TauCeti.UniversalEnvelopingAlgebra.moduleFinite_of_isIntegral_of_span_eq_top` (`PBW/Finite.lean:180`) already gives `Module.Finite S A` for any commutative central `S` over which a finite spanning family is integral.
  - The statement does not use `[LinearOrder κ]`.
  - `exact?` does not close it: only the passage from a subalgebra to a commutative scalar ring remains.
- **Repair:** delete it from `Suggested.lean`. Keep the target in the README, without backticks, as the AdoIwasawa Layer 1 contract. Add an old → new line for AdoIwasawa's `Suggested.lean` comment, and say in the module docstring that Layer 3's headlines are native.

## R06 (P3) — The composition order in `existsUnique_fundamentalAlcoveStabilizerToPerm_mul` contradicts its prose
- **Location:**
  - The `Suggested.lean` 181–183 docstring and README 1653–1655 say "the wall permutation of an element of Ω followed by a symmetry … fixing the affine node".
  - The Lean (line 192) states `σ = RootPairing.fundamentalAlcoveStabilizerToPerm b p.1 * p.2`.
- **Claim:** `Equiv.Perm` multiplication is composition, `(f * g) x = f (g x)`, so the fixing symmetry `p.2` acts first. The prose describes the other decomposition.
- **Witness:** take A₂, nodes {0,1,2} and σ = (0 1).
  - In the Lean order, π(ω)(0) = σ(0) = 1. So π(ω) is the rotation 0↦1↦2↦0 and τ = (1 2).
  - In the prose order σ = τ′∘π(ω′), the fixing condition forces π(ω′)(1) = 0. So π(ω′) is the inverse rotation.
  - Both decompositions exist uniquely, but their Ω-components differ.
- **Repair:** write "a symmetry fixing the affine node, followed by the wall permutation of an element of Ω" (σ = π(ω) ∘ τ). This matches the existence argument at README 1657–1659, which moves σ(0) back to 0 by π(ω)⁻¹.

## R07 (P3) — Wrong page numbers and misattributed locators
- **Location and witness:**
  - **Garnier, page numbers.** README 1637–1638 and `Suggested.lean` 172 cite "Prop.-Def. 2.2.1, p. 12". README 1655 and `Suggested.lean` 184 cite "Cor. 2.2.7, p. 14".
    - GarnierAlcoves line 386 prints page 7 at the foot of PDF page 11, and line 664 prints 10 at the foot of PDF page 14. The manifest's `version_note` says the citation uses printed page numbers.
    - So the two results are on pp. 8 and 10. `Ω ≃ P∨/Q∨` itself is stated in §2.2, p. 7 (line 362).
  - **Stembridge, specialization.** README 1461–1462 says "second Corollary, p. 3, line 109, at `ν = ∅` …; line 118 notes that it counts the same tableaux as the lattice-word formulation".
    - Stembridge2002LR lines 115–120 make that remark about the `λ = ∅` specialization, that is, skew shapes.
    - At `ν = ∅` (line 121), the sum runs over tableaux of straight shape `μ` with weight `ν−λ`, not over `LRTableau λ ν μ` (shape `ν/λ`, content `μ`).
  - **Baez, definitions and edition.** `Suggested.lean` 108 and 115, and README 1148 and 1170, cite "Baez, §4.1, p. 35" and "§4.2, p. 39" for `Der(𝕆) ≅ g₂` and `Der(H₃(𝕆)) ≅ f₄`.
    - BaezOctonions line 1601 ("take these facts as definitions") and lines 1779–1782 take both as definitions, attributing them to Cartan and to Chevalley–Schafer. The dimension 14 is computed on p. 36 (line 1623).
    - The References entry (1804) gives Bull. AMS 39 (2002), pp. 145–205, but the page numbers used are those of arXiv v4.
- **Repair:**
  - **Garnier:** "§2.2, p. 7 (line 362); Prop.-Def. 2.2.1, p. 8" and "Cor. 2.2.7, p. 10".
  - **Stembridge:** cite the `λ = ∅` specialization (lines 115–120) for the count over `LRTableau λ ν μ`, together with `⟨s_{ν/λ}, s_μ⟩ = ⟨s_ν, s_λ s_μ⟩`. Alternatively, cite `ν = ∅` and describe its tableaux correctly.
  - **Baez:**
    - Cite a source that proves the two identifications by theorem number: Chevalley–Schafer, PNAS 36 (1950), for `F₄`; Schafer's or Jacobson's book, already in References, for `G₂`.
    - Keep Baez as background, noted "(taken there as the definition)".
    - Write "arXiv:math/0105155v4" in References.

## R08 (P3) — Open targets without locators; three manifest sources never cited
Partly repaired from the previous review (its R17).
- **Location:**
  - The seeded paragraphs "Integral weights, finite induction and virtual characters" (677–714), "Polynomiality before character identification" (716–749), "Type-A coefficient and branching applications" (782–818), "The positive division-octonion algebra and its invariant tensors" (1215–1240) and "Complex scalar-extension boundary" (1242–1249).
  - The PBW Rees deformation and its bracket (467–540).
  - Layer 6F's cone and Fourier statements (917–978).
- **Claim:** every theorem carries a locator at the claim.
- **Witness:**
  - None of these paragraphs has a theorem, section or page locator.
  - The manifest keys `GuttDeformationQuantization`, `DeConciniProcesiVergneBoxSplines` and `LandsbergManivelMagicSquare` never occur in the README. The References entry at 1804 names Landsberg–Manivel without a key or locator.
- **Repair:**
  - Cite Gutt at the Rees bracket, De Concini–Procesi–Vergne at the 6F cone and Fourier statements, and Landsberg–Manivel at the magic-square models, each by its manifest locator.
  - Give each remaining open target a locator in a manifest source. If R01 removes the precursor, its paragraphs leave with it.

## R09 (P3) — The type-A stable range is stated with an unnecessarily strict inequality
- **Location:** README 785, "`λᵢ−λ_(i+1)>μ₁−μₙ` for every adjacent pair", and 794–795, "Keep … the strict inequality".
- **Claim:**
  - The decomposition `V_λ ⊗ V_μ ≅ ⊕_γ V_(λ+γ)^(mult_γ)` holds whenever every `λ+γ` is dominant, that is, under `≥`.
  - The README's own argument works with `≥`, because ρ adds 1 to each gap.
- **Witness:** these cases all have a gap equal to the spread, and all hold (character products computed by tableau enumeration):
  - n=2, λ=μ=(1,0): `s_(1,0)² = s_(2,0)+s_(1,1)` = Σ_γ s_(λ+γ) over γ ∈ {(1,0),(0,1)}.
  - λ=(2,1,0), μ=(1,0,0).
  - λ=(4,2,0), μ=(2,1,0).
- **Repair:** state it with `≥` (equivalently, "λ+γ dominant for every weight γ of V_μ"), and add λ=μ=(1,0) as a Check. If R01 moves the precursor, this moves with it.

## R10 (P3) — Stale or unqualified library names
- **Location:**
  - README 104: `LieAlgebra.IsNilpotent`.
  - README 1614: `DynkinType.IsLongSimpleRoot`.
- **Witness:**
  - The pinned Mathlib has no `LieAlgebra.IsNilpotent`. Nilpotency of an algebra is `LieModule.IsNilpotent K L L` (`Mathlib/Algebra/Lie/Nilpotent.lean:260`) or `LieRing.IsNilpotent` (`:748`).
  - The predicate is Tau Ceti's `TauCeti.DynkinType.IsLongSimpleRoot` (`LinearAlgebra/RootSystem/RootLength.lean:240`).
- **Repair:** write `LieRing.IsNilpotent L` (or `LieModule.IsNilpotent K L L`) and `TauCeti.DynkinType.IsLongSimpleRoot`.

## R11 (P3) — A conflicting open pull request, with no stated order
Not repaired from the previous review (its R21).
- **Location:** `README.md` and `Suggested.lean` of this folder, which the open revision #1220 ("LieHighestWeight: tensor strings, reductive centers and opposition") also rewrites.
- **Witness:**
  - The overlap listing reports "#1220 and #1797 conflict in `README.md`, `Suggested.lean`".
  - #1220's head is a house-shape rewrite (`## Scope and ownership`, `## Layer 0: normalized rank-one tensor comparisons`, …).
  - Its `Suggested.lean` states other headlines: `invariantForm_isSymm_iff_tits_sign`, `exists_productCenterEquiv` and `finrank_e6_e7`.
  - This pull request's description does not mention #1220.
- **Repair:** say in the description which pull request rebases on the other. Do not restate here what #1220 adds.

## Verified sound

**Previous review (657389a), finding by finding.**

| Previous | Status | Evidence at this head |
|---|---|---|
| R01 `sorry`'d data | repaired | `Suggested.lean` has no `def`/`abbrev`/`instance`; 12 theorems |
| R02 vacuous `right_alternative` | repaired | deleted; README 1196 cites native `TauCeti.CayleyDickson.right_alternative` (`Quaternion.lean:212`) |
| R03 stand-in carriers | repaired | headlines on `TauCeti.Octonion`, `TauCeti.AlbertAlgebra`, `TauCeti.DivisionOctonionReal`, `TauCeti.glIrreducible`, `TauCeti.LRTableau` |
| R04 two-way supply | not repaired | R01 |
| R05 branching needs dominant μ | repaired | 799–808 add `μ₁≥⋯≥μ_(n−1)` and the −1 example |
| R06 natives planned again | partly | Layers 2–10 consume natives; Layers 0, 5 remain (R03) |
| R07 CompactGroups anchor | repaired | 650, 963 cite native `ContRepresentation.inner_characterLp_eq_finrank_contIntertwiningMap` (`Compact/Intertwiner/Dimension.lean:145`) |
| R08 padding | partly | 69 proved theorems and 35 aliases gone; one adapter remains (R05) |
| R09 docstrings | repaired | one module docstring naming four non-statable headlines; every theorem has a docstring |
| R10 sub-import | repaired | `import Mathlib` + 9 `TauCeti.*` modules |
| R11 31 warnings | repaired | 12 `sorry` warnings only |
| R12 hygiene | repaired | gate `statement-hygiene=0`; F₄ is `nonempty_*`, Serre is `Function.Injective (TauCeti.serreLift hS)` |
| R13–R15 blob, prnum, private path | repaired | gate 0; README 1179 cites BaezOctonions §3.4 lines 1479–1481 |
| R16 house shape | not repaired | R02 |
| R17 locators | partly | Etingof, Woit, Baez, Garnier, Stembridge added; some wrong (R07), some missing (R08) |
| R18 stale ids | repaired | TensorProductCombinatorics §1.6/§2.6, TangentialBordism §§9.1–9.2, `lieModuleDerivation`, `exists_isCartanSubalgebra_engel`; new stale name in R10 |
| R19 README/Lean names | repaired | compact names now prose; the side-effect is R04 |
| R20 process wording | repaired | no hit for the old phrases; the paragraph after References is gone |
| R21 order with #1220 | not repaired | R11 |

**Adversarial table** (values computed on each side).

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| `module_finite_of_central_monic_relations` | κ=∅; L=K abelian, R=K[x²] | U=K, R=K: rank 1 / finite; x²−x²=0 monic, U=R⊕Rx: rank 2 / finite; R=K: no monic relation, K[x] infinite / hypothesis fails | true | R05 (adapter) |
| `serreLift_injective_of_base` | A₁; B₂ transpose test | dim ToLieAlgebra=3 / dim sl₂=3; with A=[[2,−2],[−1,2]], `⁅h₁,e₂⁆=α₂(h₁)e₂=−e₂=Aᵀ₁₂e₂`; untransposed would give −2 | true; transpose needed | — |
| `g₂ToDerivationLieAlgebra_injective` | dims | Serre g₂: 2+12=14 / native `Octonion.finrank_derivationLieAlgebra`=14, surjective | true | R07 locator |
| `nonempty_derivationAlbert_lieEquiv_f₄` | dims | 4+48=52 / native `AlbertAlgebra.finrank_derivationLieAlgebra`=52 | true | R07 locator |
| compact G₂ dim, Killing | ℂ⊗Der(A) vs Der(Octonion ℂ); split g₂(ℝ) | 14 / 14; split Killing signature (8,6) indefinite / compact negative definite | true | — |
| `finrank_e₆/e₇/e₈` | rank + #roots | 6+72=78, 7+126=133, 8+240=248 / Baez line 2175: 28+28+3·64=248 | true | — |
| LR headline | N=2, λ=μ=(1); N=1, ν=(1,1); N=0 | ν=(2):1, (1,1):1 / `V⊗V=Sym²⊕Λ²`; without `hnu`: c=1 / Hom(L(1),L(2))=0 (so `hnu` needed); 1 / 1 | true | R07 locator |
| `fundamentalAlcoveStabilizerToQuotient_bijective` | A₁, A_r, E₈ | Ω: C₂, C_{r+1}, 1 / P∨/Q∨ (Garnier Table 1, line 365) | true | R07 page |
| `existsUnique_…ToPerm_mul` | A₁, A₂, D₄, E₆; A₂ σ=(0 1) | |Aut|=2=2·1, 6=3·2, 24=4·6, 6=3·2; Lean ω: 0↦1 / prose ω′: 1↦0 | true; prose order wrong | R06 |
| Weyl character formula, Layer 6 (seeded) | sl₂ λ=ω; A₂ adjoint, standard | `e^ω−e^{−3ω}` / same; A₂ `ch·∏(1−e^{−α})` = `Σ sgn e^{w(λ+ρ)−ρ}` (script); Etingof Thm 26.4 Δ=e^ρ∏(1−e^{−α}) | holds | — |
| Weyl character formula, 6F fixed point (seeded) | sl₂ λ=ω | `e^ω/(1−e^{−2ω})+e^{−ω}/(1−e^{2ω})=e^ω+e^{−ω}` / ch; `sρ−ρ=−α` / `−Σ_{inverted}α` | holds | — |
| Integral weights and score (seeded) | 3000 random n≤6, x strictly decreasing; x=(3,2,1) | identity 0 mismatches, every bracket >0; score(1,1,−2)=3 / score(2,−1,−1)=3 | holds | R08 locator |
| Polynomiality (seeded) | n=2, λ=(1,0); n=0 | `C_λ=t₁²/(t₁−t₂)+t₂²/(t₂−t₁)=t₁+t₂` / `s_(1)`; `D·P=(t₁²−t₂²)/t₁` / `t^{−ρ}A_(2,0)`; 1 / 1 | holds | R08 |
| Haar norm (seeded) | U(n); Woit Thm 1 | `(1/n!)Σ_{w,v}sgn·sgn·δ=n!/n!=1` / 1; `\|D\|²=∏_{α}(1−e^{−α})` / Woit `J(t)` line 108; `det(I−Ad_t)=det(I−Ad_{t⁻¹})` (dim g/t even, det Ad_t=1) | holds | — |
| Branching determinant (seeded) | 6965 dominant cases n=2,3,4; three README examples | value 1 iff interlacing, else 0; −1, 1, 0 / README −1, 1, 0 | holds | — |
| Stable tensor range (seeded) | λ=μ=(1,0); (2,1,0),(1,0,0); (4,2,0),(2,1,0) | product / Σ_γ s_(λ+γ): equal in all three with gap = spread | holds under ≥ | R09 |
| Division octonions (seeded) | 300 random rational pairs, README product | N(xy)=N(x)N(y); left and right alternative, flexible, two Moufang laws, `(xy)*=y*x*`, `xx*=N·1`: 0 failures; product equals native `CayleyDickson` `mul_fst/mul_snd` (`Basic.lean:202`) | holds | — |
| Cross product (seeded) | 300 random imaginary triples | `vw=−g+v×w`, `u×(u×v)=g(u,v)u−g(u,u)v`, trilinear identity: 0 failures; wrong-sign trilinear and 3-D triple-product: 300/300 failures | holds; controls fail | — |
| Associativity fails | i, j, ℓ | associator=(0;0,0,0,2) / ≠0 | holds | — |
| Complex scalar extension (seeded) | i⊗x | positive extension `i⊗x̄` / tensor star `−i⊗x̄` (distinct for x̄≠0); dim_ℂ ℂ⊗Der A=14 / native 14 | holds | R08 |
| Baez vs native product | random pair | Baez `(ac−db*, a*d+cb)` ≠ README product; both multiplicative | distinct conventions, as stated | — |
| Albert determinant | Baez §3.4 vs `six_mul_det` | `6·(⅓tr a³−½tr a²tr a+⅙(tr a)³)` / `2tr a³−3tr a tr a²+(tr a)³` | holds | — |
| Kostant | Etingof Ex. 26.7(ii) | `p(w(λ+ρ)−ρ−γ)` / README `P(w(λ+ρ)−(μ+ρ))` | holds | — |
| sl₂ centre | Ω=h²+2h+4fe; κ(h,h)=8, κ(e,f)=4 | HC raw t²+2t, `(−t−2)²+2(−t−2)=t²+2t`; linear `(t−1)²+2(t−1)=t²−1`; `(h²+2ef+2fe)/8=Ω/8` | holds | — |
| Freudenthal sl₂ V(1) | μ=−ω | `4⟨ω,ω⟩m` / `2·1·⟨ω,2ω⟩=4⟨ω,ω⟩` ⇒ m=1 | holds | — |
| Serre convention | Mathlib `pairing i j = root i (coroot j)` (`Defs.lean:195`) | `A i j=αᵢ(hⱼ)` / README 1108 | holds | — |
| gl₂ Casimir | (1,0) | `ΣE_ijE_ji=2·I` / `1·2+0=2` | holds | — |
| Staircase separation | ν=(N−½,…,½) | `C(ν−ε_t)−C(ν)=−3N+3+4t` / differences 4(t−s) | holds | — |
| CAR scalar | Σ F_ii | `½(N+N(N−1))=N²/2` / `Σν_i=N²/2`; `2^{N²}/2^{N(N−1)/2}=2^{N(N+1)/2}` | holds | — |
| Rees sl₂ | `j(h)²+2ħj(h)+4j(f)j(e)` | `t²(h²+2h+4fe)=t²Ω` central / symbol `h²+4ef` | holds | — |
| Dimension formula | A₂ at ω₁, ω₂, ω₁+ω₂, 2ω₁, 3ω₁ | 3, 3, 8, 6, 10 / README | holds | — |
| Docstring "not statable" claims | grep at pins | no formally real Albert carrier (native `AlbertAlgebra` uses split `Octonion R`, `Basic.lean:118`); `E8/Vinberg.lean` only has finrank lemmas; no Poisson class; tori are algebraic weight tori only | as stated | — |

**Gate, build and probes.**
- Gate: the worker's gate passes (all checks 0, build 0). In my rerun every content check is 0. Its `outside-folder=53` hits are exactly this pull request's own AlgebraicTopology (9), GeometricTopology (30), IntegralLattices (2), QuadraticFormInvariants (3) and ReductiveGroups (9) files. The brief names those folders as the pull request's own, so they are not a finding.
- `lake env lean` on `Suggested.lean`: 0 errors, 12 `sorry` warnings, no other warning.
- Signatures: I compared the 12 elaborated types in `signatures.md` with the README statements. Every hypothesis is present, and no section binder was dropped. The F₄ statement's `[Invertible (2 : K)]` is what the native `AlbertAlgebra` product needs.
- One-tactic probe on a scratch copy (`first | rfl | simp | infer_instance | exact?`, then `exact?` alone on the six that timed out): none of the 12 closes.
  - `module_finite…`, `g₂…`, `f₄…` and both alcove theorems: `exact?` finds nothing.
  - Serre: `simp` leaves goals open.
  - Compact G₂ (two theorems), `finrank_e₆/e₇/e₈` and LR: `exact?` times out. A grep at the pins finds no declaration with these conclusions; Tau Ceti's `LittlewoodRichardson/Basic.lean` says the LR rule "is not proved here".
  - `fundamentalAlcoveStabilizerToQuotient_bijective` is a short assembly of the native surjectivity, the kernel `Ω ∩ W_aff` and `eq_one_of_mem_affineWeylGroup_of_mapsTo`. It is not one tactic and is the classical headline, so I keep it.
- `git diff --stat` outside the named folders is empty.
- Dependency check (verbatim):

      depcheck: 237 roadmaps, 2311 edges, 0 problem(s)

  It sees no `*Needs:*` line here, so it cannot see R01.

**Library declarations opened at the pins.**
- **Mathlib:**
  - `IsSl2Triple`, `HasPrimitiveVectorWith` (`Algebra/Lie/Sl2.lean:38,79`)
  - `exists_isCartanSubalgebra_engel` (`CartanExists.lean:374`)
  - `HasTrivialRadical.instIsKilling` (`CartanCriterion.lean:257`)
  - `RootPairing.pairing` (`RootSystem/Defs.lean:195`), `cartanMatrixIn` (`CartanMatrix.lean:53`)
  - `Algebra.TensorProduct.tmul_mul_tmul`, `isScalarTower_right`, `sMulCommClass_right`, `instNonAssocRing` (`RingTheory/TensorProduct/Basic.lean:102,124,137,361`)
  - `Module.Basis.symmetricAlgebra` (`SymmetricAlgebra/Basis.lean:71`)
  - `mFourierCoeff` (`Fourier/AddCircleMulti.lean:251`)
- **Tau Ceti, PBW and Serre:**
  - `moduleFinite_of_isIntegral_of_span_eq_top` (`PBW/Finite.lean:180`)
  - `IsSerreSystem`, `serreLift`, `serreLift_surjective` (`Presentation/Serre.lean:256,507,601`)
  - `exists_isSerreSystem_of_base` (`Serre/Killing.lean:196`)
- **Tau Ceti, octonions and Albert:**
  - `CayleyDickson` product and star (`CayleyDickson/Basic.lean:202,220`)
  - `DivisionOctonionReal` (`Quaternion.lean:312`)
  - `AlbertAlgebra` (`AlbertAlgebra/Basic.lean:118`), `det`, `mul_mul_self`, `six_mul_det`, `det_eq_invOf_two_mul_invOf_three_mul` (`Determinant.lean:101,248,310,319`)
  - `AlbertAlgebra.finrank_derivationLieAlgebra` (`Derivation/Finrank.lean:384`)
  - `Octonion.isSimple_derivationLieAlgebra` (`Octonion/Simple.lean:515`)
- **Tau Ceti, gl_n:**
  - `glIrreducible` (`GeneralLinear/Carrier.lean:204`; junk off dominant weights, as the file says)
  - `LRTableau inner outer μ` (`Young/LittlewoodRichardson/Basic.lean:71`; the rule is not proved there)
  - `glCasimir` (`Casimir.lean:81,136,234`)
  - `IsRationalRep.differential` (`ClassicalGroups/Differential.lean:245`)
- **Tau Ceti, alcoves:**
  - `fundamentalAlcoveStabilizerToQuotient`, its kernel and surjectivity (`ExtendedAffine/Alcove.lean:157,172,218`)
  - `eq_one_of_mem_affineWeylGroup_of_mapsTo` (`Affine/Alcove.lean:379`)
  - `fundamentalAlcoveStabilizerToPerm` (`ExtendedAffine/Wall.lean:165,201`)
  - `matrixSymmetryGroup` (`Matrix/Submatrix.lean:64`)
- **Tau Ceti, E₇, sl₂ and compact groups:**
  - `E7Minuscule` tables and `serreRepresentation` (`E7/Minuscule/Basic.lean:107–169`)
  - the sl₂ natives listed in R03
  - `ContRepresentation.inner_characterLp_eq_finrank_contIntertwiningMap` (`Dimension.lean:145`)
- **Name check:** a scratch scan of all 443 backticked README names found every Tau Ceti and Mathlib name at the pins, except the two in R10.

**Cross-roadmap citations resolved.**
- **On main:**
  - ScatteringDiagrams §0.4 (`exists_pbwSymmetrizationEquiv`, `Suggested.lean:85`; its README line 41 confirms the split of ownership)
  - CharacteristicClasses C5 anchor
  - TensorProductCombinatorics §1.6, §2.6 (`README.md:694,1191`)
  - LieGroupoidsPoisson §G4.6A, positive Lie–Poisson (`README.md:1325`)
  - HamiltonianReduction R2
  - GroebnerGeometry G4
  - SchurWeyl Layer 7 and LieGroups Layer 6 anchors
  - ChevalleyGroups' `DynkinType.serreLift_injective`, which specializes Layer 7 (consumer, not a second owner)
  - AdoIwasawa Layer 1 contract
- **At #942:** TangentialBordism §§9.1–9.2.
- **Mutual supply:** ClassicalGroups and LieGroups (R01).
- **Ownership:** no second owner of Serre injectivity, `Ω ≃ P∨/Q∨` or the E-series dimensions in KacMoody, AffineLieAlgebras, RootSystems, RootSystemsPartII (#1731), ReductiveGroups or ReductiveGroupsPartII.

**Sources read at their locators.**
- EtingofLieGroupsLieAlgebras (v5): Thm 26.4, p. 131 (line 5190); Ex. 26.7(ii), p. 133 (line 5294).
- EtingofRepresentationsLieGroups (v2): Thm 10.1, p. 51 (line 2153); Thm 14.1, pp. 70–71 (line 3041).
- WoitWeylCharacterFormula: Thm 1, p. 3 (line 108); Thm 2 outline, p. 5 (lines 200–242).
- BaezOctonions (v4): §2.2 eq. (2), p. 8 (line 354); §3.4, p. 32 (lines 1479–1481); §4.1 (line 1598); §4.2 (line 1768); §4.6 (line 2175).
- GarnierAlcoves: lines 362, 389, 642.
- Stembridge2002LR: lines 109–121.

All of these agree with the README's statements, apart from the misattributions in R07.

## Not verifiable

- **Seeded targets without a locator.** "Integral weights, finite induction and virtual characters", "Polynomiality before character identification", "Type-A coefficient and branching applications", "The positive division-octonion algebra and its invariant tensors" and "Complex scalar-extension boundary" carry no locator, so no source passage could be checked. I verified their mathematics by computation (table above).
- **HumphreysIntroLieAlgebras §18.3** (Serre's theorem) is `uncertified` in the manifest: cited by its locator, not read.
- **Paywalled references without an open copy in the manifest:** Serre, Fulton–Harris, Humphreys GSM 94, Bourbaki VII–VIII, Jantzen, Jacobson, Schafer, Goodman–Wallach, Dixmier and Molev. The README cites them by chapter or not at all.

## Source issues

- **Error** in WoitWeylCharacterFormula at Corollary 3, p. 6: the source gives the alternating partition sum with argument `w(λ+ρ)+w′(µ+ρ)−ν−2ρ` as the multiplicity of `V_λ` in `V_µ⊗V_ν`; it should be the multiplicity of `V_ν` in `V_λ⊗V_µ` (SU(3), λ=0, µ=ω₁, ν=ω₂ gives 0 against the true 1); affects nothing.
- **Misprint** in WoitWeylCharacterFormula at the proof outline of Theorem 2, p. 5: the source says `A_(λ+δ)` occurs in `χδ` with coefficient 1, with δ the denominator function; it should be `A_(λ+ρ)`; affects nothing.
- **Misprint** in WoitWeylCharacterFormula at the U(n) integration formula, p. 4: the source writes the integrand's last argument as `θ₂`; it should be `θₙ`; affects nothing.
