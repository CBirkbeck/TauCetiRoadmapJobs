# Review of BochnerSpaces (pull request #2249 at 35445d5)

**Verdict:** needs changes

## R01 (P2) — Sorry'd data in two definitions

**Location:** `TauCetiRoadmap/BochnerSpaces/Suggested.lean:126–131` (`linftySigma`: "zero_mem' := by sorry / add_mem' := by sorry / smul_mem' := by sorry") and `:178–183` (`dunfordIntegral`: "map_add' := by sorry … cont := by sorry").

**Claim:** Two definitions have `sorry` in their bodies (gate `sorry-data (2)`). `dunfordIntegral.cont` is the closed-graph boundedness of `x' ↦ ∫_A x'∘f`, which is a theorem hidden inside data.

**Witness:** the three `linftySigma` fields close in two lines each (scratch copy, elaborated). `cont` is BS6.1's bound `‖D_A f‖ ≤ ‖T_f‖`, which is a target in its own right.

**Repair:** In `linftySigma`, replace the three fields with the following, which was tested under `import Mathlib`:
```lean
  zero_mem' := let ⟨g, hg, h⟩ := aefinStronglyMeasurable_zero (α := S) (β := X) μ
    ⟨g, hg, (Lp.coeFn_zero X ∞ μ).trans h⟩
  add_mem' := fun {f g} hf hg => let ⟨k, hk, h⟩ := AEFinStronglyMeasurable.add hf hg
    ⟨k, hk, (Lp.coeFn_add f g).trans h⟩
  smul_mem' := fun c f hf => let ⟨k, hk, h⟩ := AEFinStronglyMeasurable.const_smul hf c
    ⟨k, hk, (Lp.coeFn_smul c f).trans h⟩
```
Delete `dunfordIntegral`, `dunfordIntegral_apply` and `inclusionInDoubleDual_pettisSetIntegral`. The README keeps BS6.1.

## R02 (P2) — `set_option` in Suggested.lean

**Location:** `TauCetiRoadmap/BochnerSpaces/Suggested.lean:46`: "set_option autoImplicit false".

**Claim:** `Suggested.lean` may contain no `set_option` (gate `set_option (1)`).

**Witness:** A copy with this line deleted and the header of R07 elaborates with only `sorry` warnings.

**Repair:** Delete line 46.

## R03 (P2) — Statable headlines absent; the docstring wrongly says a carrier is missing

**Location:** `Suggested.lean:31–35`: "BS4's completed projective-tensor identification needs the carrier constructed by BanachSpaceTheory B4, which is not provided at the dependency pin." Also `:33–35`: "The mixed-norm, … series-criterion … APIs are likewise specified in full in the README".

**Claim:** README milestones (lines 7–10) include the mixed-norm and tensor identifications and the Pettis integrability criteria. Three of them are statable at the pins but absent: BS4.1 (Minkowski contraction), BS4.4 (`L¹(μ) ⊗̂π X ≃ L¹(μ;X)`) and BS6.4 (the no-`c₀` criterion).

**Witness:** Pinned Tau Ceti has `TauCeti.CompletedProjectiveTensor` (`TauCeti/Analysis/Normed/Module/TensorProduct/Completion.lean:76`) and `liftIsometry` (`:196`). All three statements below elaborate at the pins (scratch copy).

**Repair:** Delete the docstring paragraph at lines 31–35. Add `import TauCeti.Analysis.Normed.Module.TensorProduct.Completion` and the following (with `variable {T : Type w} [MeasurableSpace T] (ν : Measure T)` in scope):
```lean
theorem exists_lpOneTensorEquiv [NormedSpace ℝ X] [IsScalarTower ℝ 𝕜 X] [CompleteSpace X] :
    ∃ e : TauCeti.CompletedProjectiveTensor 𝕜 (Lp 𝕜 1 μ) X ≃ₗᵢ[𝕜] Lp X 1 μ,
      ∀ (φ : Lp 𝕜 1 μ) (x : X),
        (e ((⟨φ ⊗ₜ x⟩ : TauCeti.ProjectiveTensor 𝕜 (Lp 𝕜 1 μ) X) :
          TauCeti.CompletedProjectiveTensor 𝕜 (Lp 𝕜 1 μ) X) : S → X) =ᵐ[μ] fun s => φ s • x := by
  sorry

theorem exists_minkowskiContraction (p q : ℝ≥0∞) [Fact (1 ≤ p)] [Fact (1 ≤ q)] (hpq : p ≤ q)
    (hq : q ≠ ∞) :
    ∃ L : Lp (Lp X q ν) p μ →L[𝕜] Lp (Lp X p μ) q ν, ‖L‖ ≤ 1 ∧ Function.Injective L ∧
      ∀ (A : Set S) (B : Set T) (hA : MeasurableSet A) (hB : MeasurableSet B) (hμA : μ A ≠ ⊤)
        (hνB : ν B ≠ ⊤) (x : X),
        L (indicatorConstLp p hA hμA (indicatorConstLp q hB hνB x)) =
          indicatorConstLp q hB hνB (indicatorConstLp p hA hμA x) := by
  sorry

theorem pettisIntegrable_of_forall_not_antilipschitz [CompleteSpace X]
    (hX : ∀ (T : ZeroAtInftyContinuousMap ℕ 𝕜 →L[𝕜] X) (K : NNReal), ¬ AntilipschitzWith K T)
    {f : S → X} (hf : AEStronglyMeasurable f μ) (hw : WeaklyIntegrable (𝕜 := 𝕜) f μ) :
    PettisIntegrable (𝕜 := 𝕜) f μ := by
  sorry
```
Name each of these in the README at BS4.1, BS4.4 and BS6.4.

## R04 (P2) — BS6.5 uniqueness is missing "the π-system contains S"

**Location:** `README.md:470–471`: "For a.e. strong-measurable Pettis integrable functions, prove uniqueness from a generating pi-system of set integrals."

**Claim:** A generating π-system does not determine set integrals unless it contains `S`. BS2.3 states that hypothesis; BS6.5 drops it.

**Witness:** Take `S = {1,2}` with counting measure, `P = {∅,{1}}` (it generates `2^S`), `f = 1_{2}·x` with `x ≠ 0`, and `g = 0`. The set integrals agree on `P` (both are 0), but `f ≠ g` on `{2}`, which has measure 1.

**Repair:** Replace the sentence with: "For a.e. strongly measurable Pettis integrable functions, prove a.e. equality from equality of their set integrals over a generating π-system that contains `S`." Add the instance above as a Check.

## R05 (P3) — Padding in Suggested.lean

**Location:** `Suggested.lean` lines 104, 134, 142, 186, 196, 202, 209, 236, 241, 282, 303, 337, 342, 373, 398 (the declarations in the repair).

**Claim:** These declarations restate a definition, close by one library lemma or by one term from another target, treat a boundary case, or restate a supplier's target.

**Witness:** Each of these has a one-term proof that elaborates in a scratch copy. For example, `pettisIntegrable_of_integrable` follows from `ContinuousLinearMap.integrable_comp` and `integral_comp_comm`. `hasRNP_of_reflexive` is BanachSpaceTheory B4.0 at `volume.restrict (Icc 0 1)`.

**Repair:** Delete from `Suggested.lean` the following; the README keeps each statement as a target or Check:
- `integral_mem_domain_and_map`
- `mem_linftySigma`
- `linftySigma_eq_top`
- `dunfordIntegral_apply`
- `apply_pettisSetIntegral`
- `pettisSetIntegral_unique`
- `inclusionInDoubleDual_pettisSetIntegral`
- `pettisIntegrable_of_integrable`
- `pettisSetIntegral_eq_integral`
- `hasRNP_of_reflexive` (the README cites B4.0 for it)
- `representableOperatorMap_apply`
- `integrable_dual_pairing`
- `bochnerDualMap_apply`
- `exists_bochnerDualEquiv`
- `aefinStronglyMeasurable_const_iff`

## R06 (P3) — `pettisSetIntegral` is defined by choice

**Location:** `Suggested.lean:191–193`: "def pettisSetIntegral … := Classical.choose (hf.2 A hA)".

**Claim:** Choice in the body of a `def` (gate `statement-hygiene`). Its only headline use is `exists_pettisVectorMeasure`.

**Witness:** The restatement below, which does not use the definition, elaborates at the pins (scratch copy).

**Repair:** Delete `pettisSetIntegral` and replace `exists_pettisVectorMeasure` with:
```lean
theorem exists_pettisVectorMeasure [CompleteSpace X] (f : S → X)
    (hf : PettisIntegrable (𝕜 := 𝕜) f μ) :
    ∃ m : VectorMeasure S X, ∀ A : Set S, MeasurableSet A →
      ∀ x' : StrongDual 𝕜 X, x' (m A) = ∫ s in A, x' (f s) ∂μ := by
  sorry
```

## R07 (P3) — Imports and module header

**Location:** `Suggested.lean:5–15, 42`: "module / public import Mathlib.Analysis.Normed.Module.DoubleDual … public import TauCeti.MeasureTheory.Function.Holder … @[expose] public section".

**Claim:** The header must be the single line `import Mathlib` followed by the `TauCeti.*` modules the file uses (gate rules `imports`, `mathlib-subimports` and `no-import-mathlib`).

**Witness:** A copy with the header below (and line 46 deleted) elaborates with `sorry` warnings only.

**Repair:** Replace lines 5–15 with `import Mathlib` and `import TauCeti.Analysis.Normed.Module.TensorProduct.Completion` (R03). `TauCeti.MeasureTheory.Function.Holder` is used only by `integrable_dual_pairing`, which R05 deletes. Delete `@[expose] public section`.

## R08 (P3) — Suggested.lean form and README agreement

**Location:** `Suggested.lean:17–23`: "These are representative suggested definitions and target signatures, not an exhaustive checklist. … Discharging this file does not complete the roadmap." Section comments read `/-! ## BS1. … -/`.

**Claim:** The file is the acceptance test, not a sample. The module docstring must have the form "<title>: target signatures" and must name each headline that cannot be stated at the pins. Section comments must read `## Layer k: <title>`. In addition, none of the 44 Lean names appears in the README.

**Witness:** `grep -c` in `README.md` gives 0 for every declaration name, including `HasRNPWith`, `bochnerDualMap` and `integral_mem_graph`.

**Repair:** Use this module docstring: "Bochner spaces: target signatures. The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti." Then list any headline that cannot be stated, with the carrier it lacks. Rename the section comments to the README's layer titles. Name each kept declaration in backticks at its README target.

## R09 (P3) — LaTeX and TeX in the README

**Location:** `README.md:6`: "the duality of vector-valued $L^p$ spaces"; `:62`: "Work over $\mathbb K=\mathbb R$ or $\mathbb C$"; display at `:87–90`. The gate reports 786 `latex` and 41 `tex` hits.

**Claim:** Mathematics must be written in Unicode, with ASCII only inside code spans; `$…$`, `$$…$$` and `\mathbb` are not allowed.

**Witness:** `grep -c '\$' README.md` gives 279 lines.

**Repair:** Rewrite every formula in Unicode or a code span. For example, line 62 becomes "Work over `𝕂 = ℝ` or `ℂ`", and lines 87–90 become the code span `L∞_σ(μ; X) = {f ∈ L∞(μ; X) : AEFinStronglyMeasurable f μ}`.

## R10 (P3) — Process text, a PR number and claims about libraries off the pins

**Location:** `README.md:13–20` ("This README is the definitive specification … Suggested homes are"); `:113–116` (revision hashes); `:132–137` ("Tau Ceti scalar Radon–Nikodým extension, at revision `396c3bd9…`, with `VectorMeasure.scalarRNDeriv` … when available in the dependency"); `:140` ("Mathlib PR #45494").

**Claim:** The README must be timeless and contain no PR numbers (gate `prnum`). Library claims must be checked at the pins.

**Witness:** `scalarRNDeriv` occurs nowhere in pinned Mathlib or Tau Ceti. Revision `396c3bd9` is not the pinned Tau Ceti commit (`2fd255d9`).

**Repair:** Delete lines 132–143, the revision sentence at 113–116, and the process sentences at 13–20. Cite only declarations present at the pins.

## R11 (P3) — Stray file `Coverage.md` indexes a private text section by section

**Location:** `TauCetiRoadmap/BochnerSpaces/Coverage.md`: "The source is the author-supplied updated `Integration.tex`, main text sections 1.1–1.3 …". Also `README.md:29–32` and `:688–693`.

**Claim:** The file is not a roadmap file (gate `stray-files`). It summarises a source section by section, with line numbers into a text no reader can obtain.

**Witness:** Coverage.md lines 8–20 locate statements by line numbers of an unpublished TeX file identified only by its SHA-256.

**Repair:** Delete it; the sources are the README's references. Delete README lines 29–32, and at 688–693 delete the `Integration.tex` and `Coverage.md` sentences.

## R12 (P3) — The layers follow the source's section titles

**Location:** `README.md:686–687`: "Chapter 1, “Bochner spaces,” §§1.1–1.3". Headings: `## BS7. More about the Radon–Nikodým property`, item 8.1 "Elementary duality results", item 8.2 "Duality and the Radon–Nikodým property", item 1.1 "Functions on a measurable space".

**Claim:** The roadmap's organisation is the book's chapter. The title and the layer and item names reproduce the source's section titles.

**Witness:** The headings of `Coverage.md` (lines 27–164) index the source's sections, and they coincide with these README titles.

**Repair:** Name layers by their mathematics. For example: "Layer 6: the Radon–Nikodým property and representable operators", "8.1 The integral pairing J and its isometry", "8.2 Surjectivity of J and the RNP of X*", "1.1 Pettis measurability on a measurable space". Delete the chapter-coverage claim at lines 686–693.

## R13 (P3) — README shape

**Location:** `README.md:1` "# Bochner spaces"; `:111` "## Existing library interfaces"; `:145` "## BS1. Measurability"; `:682` "## Sources".

**Claim:** The README lacks the required shape.
- The title must be `# Roadmap: bochner spaces`, followed by a `**Summary.**` paragraph.
- `## Exact supplier contracts` (From Mathlib / From Tau Ceti / From TauCetiRoadmap.BanachSpaceTheory) and `## How to read the build` are missing.
- Layers use numbered items instead of `## Layer k:` with `### k.n` subsections.
- No layer ends with `### Examples` and `### Dependencies`.
- `## Downstream consumers` and `## References` are missing.

**Witness:** `grep -n '^## \|^### '` on `README.md` lists only the nine headings `## BS1.`–`## BS9.` and the headings at lines 22, 60, 111 and 682.

**Repair:** Restructure to the house shape. Move the table at lines 118–130 into per-supplier contracts that name each declaration consumed. Turn each numbered item into a `### k.n` subsection with a `*Needs:*` line. Rename `## Sources` to `## References`.

## R14 (P3) — No definition has Checks

**Location:** `README.md`, every layer. The definitions are `L∞_σ` (BS3.1), the τ(X,Y)/Dunford integral (BS6.1), Pettis integrability (BS6.2), relative and intrinsic RNP (BS7.2), the representable-operator map (BS7.3) and `J` (BS8.1).

**Claim:** Each definition needs at least three discriminating `**Checks.**` bullets.

**Witness:** `grep -c Checks README.md` gives 0.

**Repair:** Add Checks with computed values. Most come from BS9:
- `L∞_σ`: on uncountable counting measure, `1 ∈ L∞ ∖ L∞_σ`; on a singleton of infinite measure, `L∞_σ = 0 ≠ L∞`.
- Pettis integrability: the `c₀` example has Dunford integral `(1,1,…) ∉ c₀`; `Σ 1_{A_n}(2ⁿ/n)eₙ` has `∫‖f‖ = Σ 1/n = ∞` but is Pettis integrable.
- RNP: `m(A) = Σ_{j∈A} j⁻¹eⱼ` has `|m|(ℕ) = ∞`.
- `J`: the `(1,∞)` pairing is zero on a singleton of infinite measure.

## R15 (P3) — No target carries a locator

**Location:** `README.md:244–252` (Hille's theorem), `:511–518` (RNP equivalences), `:588–591` (duality ⇔ RNP), and every other target.

**Claim:** Every theorem needs its theorem number and page in a citable source. The README cites the book only by chapter, and Diestel–Uhl without any locator.

**Witness:** `grep -cE "Theorem [0-9]|Prop\. [0-9]|Lemma [0-9]|p\. [0-9]" README.md` gives 0.

**Repair:** At each claim, add the published locator, for example "(Hytönen–van Neerven–Veraar–Weis 2016, Theorem N, p. M)", or a Diestel–Uhl chapter and theorem. Record each source in `sources.toml`.

## R16 (P3) — BS2, BS3.1 and BS7.4 restate pinned Mathlib as targets

**Location:** `README.md:218–236`: "Identify the integral of a finite-support simple function with its finite sum … Record additivity … give the equivalence of integrability for f under μ.map φ … On products of σ-finite measure spaces …". Also `:534–537` (conditional expectation as an orthogonal projection, and the `L¹` contraction).

**Claim:** These facts exist at the pin. They must be cited under From Mathlib, not planned again.

**Witness:**
- `SimpleFunc.integral_eq_sum` (Integral/Bochner/Basic.lean:557)
- `integral_add` (:239)
- `tendsto_integral_of_dominated_convergence` (DominatedConvergence.lean:58)
- `integrable_map_measure` (L1Space/Integrable.lean:355)
- `integral_prod` (Integral/Prod.lean:443)
- `Integrable.prod_right_ae` (:249)
- `Integrable.integral_prod_left` (:334)

**Repair:** List these declarations under From Mathlib. Keep as BS2 targets only what is new: the localized Fubini theorem for arbitrary measures, Hille's theorem, convexity and detection. In BS7.4, cite `condExpL2` and the native `condExp` contraction instead of re-proving them.

## R17 (P3) — Supplier rows cite a roadmap for a pinned carrier, or cite no section

**Location:** `README.md:38`: "Completed projective tensor products and their universal property | Banach space theory, B4". `:41–42`: rows citing "Unbounded operators" and "Partial differential equations" with no section.

**Claim:** The carrier and its universal property are pinned Tau Ceti declarations, so they should be cited as Tau Ceti, not as BanachSpaceTheory B4. The other two rows name no section.

**Witness:** `TauCeti.CompletedProjectiveTensor` is at `Completion.lean:76`, and `TauCeti.CompletedProjectiveTensor.liftIsometry` at `:196`. BanachSpaceTheory's open revision lists both under its own From Tau Ceti contracts.

**Repair:** Under From Tau Ceti, cite `TauCeti.CompletedProjectiveTensor`, `TauCeti.ProjectiveTensor.tmulL` and `TauCeti.CompletedProjectiveTensor.liftIsometry`. Cite the UnboundedOperators and PDE sections actually consumed, or delete those rows, since BS2 uses only Mathlib's `LinearPMap`.

## R18 (P3) — The pull-request description

**Location:** Description: "a roadmap for Bochner spaces, covering Chapter 1 of Volume 1. The roadmap is organized by mathematical topic, with the book as its principal source … It includes a coverage audit of the chapter's main text".

**Claim:** The head contradicts "organized by mathematical topic" (see R12). The coverage audit is to be deleted (R11). The description omits the supplier: BanachSpaceTheory B1–B5, including B4.0's reflexive density theorem.

**Witness:** README line 39 and line 563 consume B4.0. The README's layer titles coincide with the source's section titles (Coverage.md 27–164).

**Repair:** Use this description: "Adds the new roadmap BochnerSpaces (README.md, Suggested.lean, metadata.toml): Pettis measurability, Hille's theorem, Bochner–Fubini and L¹ ⊗̂π X identifications, Pettis integrability criteria, the Radon–Nikodým property and Bochner-space duality. Suppliers: Mathlib, Tau Ceti, BanachSpaceTheory B1–B5 (B4.0's reflexive density theorem)."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Spaces and scalars (bilinear pairing) | X=ℂ, x=i, x*=id, c=i | ⟨cx,x*⟩=−1=c⟨x,x*⟩; a conjugate-linear pairing gives +1 | holds; `bochnerDualMap_apply` integrand `g s (f s)` is bilinear | none |
| Measurability (finite-support convention) | uncountable counting μ, f≡x≠0 | AEStronglyMeasurable: yes; AEFinStronglyMeasurable: no | the two notions differ as stated | none |
| Bochner spaces (`L∞_σ`) | uncountable counting μ, f≡1; σ-finite μ | 1∈L∞, 1∉L∞_σ; σ-finite: equality proved in two lines | holds | R01, R05 |
| Measures and endpoints (trimmed measure) | Lebesgue on ℝ, sub-σ-algebra {∅,ℝ} | trimmed measure takes only the values 0 and ∞: not σ-finite | holds | none |
| Operator-valued functions | translations τ_s on L²(ℝ) | orbits continuous; ‖τ_s−τ_t‖=sup\|e^{i(s−t)ξ}−1\|=2 for s≠t | not essentially separable in operator norm | none |
| Dominated convergence, substitution, Fubini | Lebesgue×counting on [0,1], 1_Δ | iterated integrals 1 and 0; Δ lies in no countable union of finite rectangles | localized hypothesis excludes it | R16 |
| `stronglyMeasurable_iff_scalar_tests` | f=id on ℓ²(I), I uncountable; S=∅ | both sides false (no separable E ⊇ ℓ²(I)); S=∅: both true with E=⊥ | holds | none |
| `aestronglyMeasurable_iff_scalar_tests` | arbitrary μ; countable norming x*ₙ on E | change f off a measurable null set: ‖h−x‖=supₙ\|x*ₙ(h−x)\| is measurable | holds without σ-finiteness | none |
| `aefinStronglyMeasurable_iff_scalar_tests` | uncountable counting μ, f≡x≠0 | LHS false; RHS false, since x*∘f≡x*(x)≠0 | holds in both directions | none |
| `integral_mem_graph` | domain ⊥ (graph {(0,0)}); μ=0 | f=g=0 a.e. gives (0,0)∈graph; μ=0 gives (0,0) | holds | none |
| `ae_mem_of_set_averages` | μ=0; C=∅ with σ-finite μ≠0 | μ=0: conclusion holds; C=∅: some 0<μA<∞ falsifies the hypothesis | holds | none |
| `exists_fubiniEquiv` | p=1, μ=ν counting on {1,2}, F=δ_st | ‖F‖=2 in both spaces; the section formula pins e | holds | none |
| `exists_pettisVectorMeasure` | ℓ²-valued Σ1_{Aₙ}(2ⁿ/n)eₙ, \|Aₙ\|=2⁻ⁿ | tail norm ≤(Σ_{n>N}1/n²)^{1/2}→0 | holds | R06 |
| `pettisIntegrable_of_reflexive` | same f in ℓ² | ∫‖f‖=Σ1/n=∞; ∫\|⟨f,a⟩\|≤‖a‖₂(Σ1/n²)^{1/2} | Pettis, not Bochner: consistent | none |
| `HasRNPWith` (definition) | μ=δ; c₀ with μ=λ on [0,1]; ℓ²-valued Σj⁻¹eⱼ | δ: every X has it; c₀: Rademacher operator not represented; \|m\|(ℕ)=∞ is excluded | determines the notion | R14 |
| `hasRNP_iff_finite_measures`, `…_sigmaFinite_…` | ν=0; universe u | m≪0 forces m=0=0.withDensityᵥ 0; not all measures quantified | holds | none |
| `hasRNP_strongDual_of_separable` | X=c₀ (X*=ℓ¹); X=ℓ¹ (X*=ℓ∞) | ℓ¹ has RNP; ℓ∞ is not separable, so no claim | holds | none |
| `norm_representableOperatorMap` | singleton of infinite measure; σ-finite μ | non-σ-finite: L¹=0, so ‖Tg‖=0≠‖g‖; σ-finite: averaging gives ‖g‖∞ | σ-finite hypothesis needed and present | none |
| `representableOperatorMap_surjective_iff` | μ=0; X=L¹(0,1), μ=λ | μ=0: both true; Rademacher sets are 1/2-separated, so id is not representable | holds | none |
| `norm_bochnerDualMap` | (p,q)=(∞,1), (1,∞); μ=0 | simple g with norming xₙ gives ∫‖g‖; f=1_A x/μ(A) gives ‖g‖∞; μ=0: 0=0 | holds at both endpoints | none |
| `norm_bochnerDualMap_of_one_lt` | non-σ-finite μ, 1<p<∞ | q<∞ makes g σ-finitely supported, reducing to the σ-finite case | holds | none |
| `norm_le_of_dual_pairing_bound` | p=∞, σ-finite μ; X=0 | g=1_A x*/μ(A), ‖g‖₁=1, pairing ≥‖f‖∞−ε | holds | none |
| `bochnerDualMap_surjective_iff` | μ=0; μ=δ | μ=0: both true; δ: Lq(δ;X*)≅X*≅(Lp(δ;X))*, and RNP for δ holds | holds | none |
| `bochnerDualMap_surjective_of_hasRNP` | p=1 (excluded); non-σ-finite μ | maximal σ-finite support exists by additivity of ‖·‖_q^q (needs q<∞) | holds for 1<p<∞ | none |
| `norm_bochnerDualMap_linftySigma` | singleton of infinite measure | L∞_σ=0 there, so 0=0; native L∞ would give 0≠‖g‖ | holds | none |
| BS6.5 π-system uniqueness | S={1,2}, P={∅,{1}}, f=1_{2}x, g=0 | integrals over P equal 0; ∫_S f=x≠0 | false without S∈P | R04 |
| no-c₀ Pettis criterion | X=c₀, f=Σ1_{Aₙ}eₙ/\|Aₙ\| | Dunford integral (1,1,…)∉c₀ | the hypothesis is needed; the statement elaborates | R03 |
| `L¹(μ)⊗̂πX ≃ L¹(μ;X)` | μ=δ; X incomplete | δ: the sides are X̂ and X, equal only if X is complete | CompleteSpace required (included) | R03 |
| Minkowski contraction | p=1, q=2, counting on {1,2}, F=δ_st | ‖F‖=2 in L¹(L²) and √2 in L²(L¹) | direction p≤q correct | R03 |
| `hasRNP_of_reflexive` | B4.0 at μ=λ on [0,1] | B4.0's density theorem at this μ is exactly the statement | restates the supplier | R05 |
| `dunfordIntegral.cont` | weakly integrable f | ‖D_A f‖≤‖T_f‖ comes from the closed graph theorem (X* complete) | a theorem inside data | R01 |

- **Gate:** FAIL on 10 rules (all reported above). Dependency check: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives only `sorry` warnings. All 44 elaborated signatures were compared with the README. The one flagged lead, `integrable_dual_pairing`, omits the `Fact` binders on purpose; it is not a defect.
- **Scratch probes:**
  - 10 padding probes elaborate.
  - The 4 new statements of R03 and R06 elaborate.
  - A repaired copy (plain `import Mathlib`, no `set_option`, `linftySigma` fields proved) elaborates.
- **Library declarations opened:** 18 in Mathlib at `1b1ccf4b` and 14 in Tau Ceti at `2fd255d9`. These include `VectorMeasure.variation` (Variation/Defs.lean:51), `Measure.withDensityᵥ` (WithDensity.lean:45), `ContinuousLinearMap.lpPairing` (Function/Holder.lean:149) and `TauCeti.CompletedProjectiveTensor` (Completion.lean:76).
- **Cross-roadmap citations:** 8 resolved. BanachSpaceTheory B1–B5 and B4.0 on main (B4.0 is kept at line 749 of the open revision), plus the paths OperatorTheory/UnboundedOperators and PDE. No upward or cyclic supplier.
- **Ownership:** no Hille theorem, Pettis integral, Banach-valued RNP or Bochner duality at the pins or in any roadmap. This roadmap owns them.
- **Overlap check:** read BanachSpaceTheory (main and its open revision), StandardDistributions, MarkovChainsAndRenewal, SobolevMapsBetweenManifolds, FrobeniusGeometry, EllAdicRealization, CompactSupport, plus PDE §6.1, NoncommutativeIntegration §4.4 and VonNeumannAlgebras. Shared objects: reflexive-target densities on finite measures (owner BanachSpaceTheory B4.0) and the completed projective tensor carrier (owner: pinned Tau Ceti). Nothing else is shared.
- **Source locators checked:** 0. The README has none (R15).

## Not verifiable

- The sampled targets “Spaces and scalars”, “Measurability”, “Bochner spaces”, “Measures and endpoints”, “Operator-valued functions” and “Dominated convergence, substitution rule and Fubini's theorem” carry no locator. The source, HNVW16 (doi 10.1007/978-3-319-48520-1), is paywalled: the sources service returned uncertified, and the Springer chapter page redirects to authentication.
- `Integration.tex` (author-supplied) is not a published or legally obtainable text.
- Diestel–Uhl, *Vector Measures* (AMS 1977) is cited with no locator; there was nothing to verify.

## Source issues

- none
