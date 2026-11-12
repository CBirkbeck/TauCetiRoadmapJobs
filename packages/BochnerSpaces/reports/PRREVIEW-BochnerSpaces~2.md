# Review of BochnerSpaces (pull request #2249 at 49a457d)

**Verdict:** needs changes

## R01 (P2) — Sorry'd data in two definitions

**Location:** `TauCetiRoadmap/BochnerSpaces/Suggested.lean:126–131` (`linftySigma`: "zero_mem' := by sorry / add_mem' := by sorry / smul_mem' := by sorry") and `:178–183` (`dunfordIntegral`: "cont := by sorry").

**Claim:** Two definitions have `sorry` in their bodies (gate `sorry-data (2)`). `dunfordIntegral.cont` is BS6.1's bound `‖D_A f‖ ≤ ‖T_f‖`, a theorem hidden inside data.

**Witness:** At this head a scratch file with the three fields below elaborates under `import Mathlib` with no `sorry`. For `f(s) = s^{-1/2}` on `(0,1)`, `‖D_A f‖ = 2 = ‖T_f‖` holds only through the closed-graph argument.

**Repair:** In `linftySigma`, replace the three fields with:
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

**Location:** `Suggested.lean:46`: "set_option autoImplicit false".

**Claim:** `Suggested.lean` may contain no `set_option` (gate `set_option (1)`).

**Witness:** The scratch file, which has no `set_option`, elaborates with `sorry` warnings only.

**Repair:** Delete line 46.

## R03 (P2) — Statable headlines absent; the docstring wrongly says a carrier is missing

**Location:** `Suggested.lean:31–32`: "BS4's completed projective-tensor identification needs the carrier constructed by BanachSpaceTheory B4, which is not provided at the dependency pin."

**Claim:** Three headlines are statable at the pins but absent: BS4.1 (the Minkowski contraction), BS4.4 (`L¹(μ) ⊗̂π X ≃ L¹(μ;X)`) and BS6.4 (the no-`c₀` criterion).

**Witness:** Pinned Tau Ceti has `TauCeti.CompletedProjectiveTensor` (`TauCeti/Analysis/Normed/Module/TensorProduct/Completion.lean:76`) and `liftIsometry` (`:196`). All three statements below elaborate at this head (scratch file).

**Repair:** Delete the docstring paragraph at lines 31–35. Add `import TauCeti.Analysis.Normed.Module.TensorProduct.Completion` and the following, with `variable {T : Type w} [MeasurableSpace T] (ν : Measure T)` in scope:
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
Name each of them in the README at BS4.1, BS4.4 and BS6.4.

## R04 (P2) — BS6.5 uniqueness is missing "the π-system contains S"

**Location:** `README.md:470–471`: "For a.e. strong-measurable Pettis integrable functions, prove uniqueness from a generating pi-system of set integrals."

**Claim:** A generating π-system does not determine set integrals unless it contains `S`. BS2.3 states that hypothesis; BS6.5 drops it.

**Witness:** `S = {1,2}` with counting measure, `P = {{1}}` (it generates `2^S`), `f = 1_{2}·x` with `x ≠ 0`, `g = 0`. Then `∫_{1} f = 0 = ∫_{1} g`, but `∫_S f = x ≠ 0`.

**Repair:** Replace the sentence with: "For a.e. strongly measurable Pettis integrable functions, prove a.e. equality from equality of their set integrals over a generating π-system that contains `S`." Add the instance above as a Check.

## R05 (P3) — Padding in Suggested.lean

**Location:** `Suggested.lean`, lines 104, 134, 142, 186, 196, 202, 209, 236, 241, 282, 303, 337, 342, 373 and 398 (the declarations listed in the repair).

**Claim:** Each of these restates a definition, closes with one library lemma or one term from another target, treats a boundary case, or restates a supplier's target.

**Witness:** `pettisIntegrable_of_integrable` closes at this head with the single term `⟨fun x' => x'.integrable_comp hf, fun _ _ => ⟨_, fun x' => (x'.integral_comp_comm hf.integrableOn).symm⟩⟩` (scratch file). `mem_linftySigma` is `Iff.rfl`.

**Repair:** Delete the following from `Suggested.lean`; the README keeps each statement as a target or Check: `integral_mem_domain_and_map`, `mem_linftySigma`, `linftySigma_eq_top`, `dunfordIntegral_apply`, `apply_pettisSetIntegral`, `pettisSetIntegral_unique`, `inclusionInDoubleDual_pettisSetIntegral`, `pettisIntegrable_of_integrable`, `pettisSetIntegral_eq_integral`, `hasRNP_of_reflexive` (BanachSpaceTheory B4.0 at `volume.restrict (Icc 0 1)`), `representableOperatorMap_apply`, `integrable_dual_pairing`, `bochnerDualMap_apply`, `exists_bochnerDualEquiv` and `aefinStronglyMeasurable_const_iff`.

## R06 (P3) — `pettisSetIntegral` is defined by choice

**Location:** `Suggested.lean:191–193`: "def pettisSetIntegral … := Classical.choose (hf.2 A hA)".

**Claim:** The body of a `def` uses choice (gate `statement-hygiene`, P3). Its only headline use is `exists_pettisVectorMeasure`.

**Witness:** The restatement below does not mention the definition, and it elaborates at this head (scratch file).

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

**Claim:** The header must be the single line `import Mathlib`, followed by the `TauCeti.*` modules the file uses (gate rules `imports`, `mathlib-subimports` and `no-import-mathlib`).

**Witness:** The scratch file's header (`import Mathlib`, `import TauCeti.Analysis.Normed.Module.TensorProduct.Completion`) elaborates with `sorry` warnings only.

**Repair:** Replace lines 5–15 with `import Mathlib` and `import TauCeti.Analysis.Normed.Module.TensorProduct.Completion` (for R03). `TauCeti.MeasureTheory.Function.Holder` serves only `integrable_dual_pairing`, which R05 deletes. Delete `@[expose] public section`.

## R08 (P3) — Suggested.lean form and README agreement

**Location:** `Suggested.lean:17–21`: "These are representative suggested definitions and target signatures, not an exhaustive checklist. … Discharging this file does not complete the roadmap." The section comments read `/-! ## BS1. … -/`.

**Claim:** The file is the acceptance test, not a sample. Its docstring must have the form "<title>: target signatures" and must name each headline that cannot be stated at the pins. The section comments must read `## Layer k: <title>`. No Lean name appears in the README.

**Witness:** `grep -c` on `README.md` gives 0 for `HasRNPWith`, `bochnerDualMap`, `integral_mem_graph` and `linftySigma`.

**Repair:** Use the docstring "Bochner spaces: target signatures. The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti." Name every headline that cannot be stated, with the carrier it lacks. Rename the section comments after the README's layers. Name each kept declaration in backticks at its README target.

## R09 (P3) — LaTeX and TeX in the README

**Location:** `README.md:6`: "the duality of vector-valued $L^p$ spaces"; `:62`: "Work over $\mathbb K=\mathbb R$ or $\mathbb C$"; the display at `:87–90`.

**Claim:** Mathematics must be written in Unicode, with ASCII only inside code spans (gate: `latex` 786, `tex` 41).

**Witness:** `grep -c '\$' README.md` gives 279 lines.

**Repair:** Rewrite every formula in Unicode or in a code span. For example, line 62 becomes "Work over `𝕂 = ℝ` or `ℂ`", and lines 87–90 become `L∞_σ(μ; X) = {f ∈ L∞(μ; X) : AEFinStronglyMeasurable f μ}`.

## R10 (P3) — Process text, a PR number and library claims off the pins

**Location:** `README.md:13–20` ("This README is the definitive specification … Suggested homes are"); `:113–116` (revision hashes); `:132–137` ("`VectorMeasure.scalarRNDeriv` … when available in the dependency"); `:140` ("Mathlib PR #45494").

**Claim:** The README must be timeless and carry no PR numbers (gate `prnum`). A library claim must hold at the pins.

**Witness:** `scalarRNDeriv` does not occur in pinned Mathlib (`1b1ccf4b`) or Tau Ceti (`2fd255d9`). Revision `396c3bd9` is not the pinned commit.

**Repair:** Delete lines 132–143, the revision sentence at 113–116 and the process sentences at 13–20. Cite only declarations that exist at the pins.

## R11 (P3) — Stray file `Coverage.md` indexes a private text section by section

**Location:** `TauCetiRoadmap/BochnerSpaces/Coverage.md` ("The source is the author-supplied updated `Integration.tex`, main text sections 1.1–1.3 …"); `README.md:29–32` and `:688–693`.

**Claim:** `Coverage.md` is not a roadmap file (gate `stray-files`). It summarises a source section by section, by line numbers of a text no reader can obtain.

**Witness:** `Coverage.md` lines 8–20 locate statements by line numbers of an unpublished TeX file, identified only by its SHA-256.

**Repair:** Delete it; sources are the README's references. Delete `README.md` lines 29–32, and at lines 688–693 delete the `Integration.tex` and `Coverage.md` sentences.

## R12 (P3) — The layers follow the source's section titles

**Location:** `README.md:687`: "Chapter 1, “Bochner spaces,” §§1.1–1.3". The headings include `## BS7. More about the Radon–Nikodým property`, item 8.1 "Elementary duality results" and item 1.1 "Functions on a measurable space".

**Claim:** The organisation is the book's chapter, and the layer and item names reproduce the source's section titles.

**Witness:** `Coverage.md` headings at lines 27–164 index the source's sections, and they coincide with these README titles.

**Repair:** Name the layers by their mathematics, for example "Layer 7: the Radon–Nikodým property and representable operators", "8.1 The integral pairing J and its isometry" and "1.1 Pettis measurability on a measurable space". Delete the chapter-coverage claim at lines 686–693.

## R13 (P3) — README shape; the new downstream consumer is unrecorded

**Location:** `README.md:1` "# Bochner spaces"; `:111` "## Existing library interfaces"; `:145` "## BS1. Measurability"; `:682` "## Sources".

**Claim:** The README needs:
- the title `# Roadmap: bochner spaces`, with a `**Summary.**` paragraph;
- `## Exact supplier contracts` and `## How to read the build`;
- `## Layer k:` headings with `### k.n` subsections, each layer ending with `### Examples` and `### Dependencies`;
- `## Downstream consumers` and `## References`.

BanachSpaces, which this pull request adds, now consumes this roadmap, and nothing here records it.

**Witness:** `grep -n '^## '` lists only lines 22, 60, 111, the nine `## BS` headings and 682. BanachSpaces `README.md:37` cites BS1.1, BS1.3, BS1.5, BS2 and BS3.1–BS3.3. Its line 38 cites BS7.1.

**Repair:** Restructure to the house shape. Move the table at lines 118–130 into per-supplier contracts. Give each item a `### k.n` subsection with a `*Needs:*` line. Rename `## Sources` to `## References`. Add `## Downstream consumers`: "BanachSpaces BN3.3 and BN8.2 (BS3.3), BN3.4 (BS7.1), BN7.3 (BS1.1, BS1.3, BS1.5, BS2)."

## R14 (P3) — No definition has Checks

**Location:** `README.md`, every layer. The definitions are `L∞_σ` (BS3.1), the Dunford integral (BS6.1), Pettis integrability (BS6.2), the relative and intrinsic RNP (BS7.2), the representable-operator map (BS7.3) and `J` (BS8.1).

**Claim:** Each definition needs at least three discriminating `**Checks.**` bullets.

**Witness:** `grep -c Checks README.md` gives 0.

**Repair:** Add Checks with computed values, mostly from BS9:
- `L∞_σ`: on uncountable counting measure, `1 ∈ L∞ ∖ L∞_σ`; on a singleton of infinite measure, `L∞_σ = 0 ≠ L∞`.
- Pettis integrability: the `c₀` example has Dunford integral `(1,1,…) ∉ c₀`; `Σ 1_{A_n}(2ⁿ/n)eₙ` has `∫‖f‖ = Σ 1/n = ∞` but is Pettis integrable.
- RNP: `m(A) = Σ_{j∈A} j⁻¹eⱼ` has `|m|(ℕ) = ∞`.
- `J`: the `(1,∞)` pairing is zero on a singleton of infinite measure.

## R15 (P3) — No target carries a locator

**Location:** `README.md:244–252` (Hille's theorem), `:511–518` (the RNP equivalences), `:588–591` (duality ⇔ RNP), and every other target.

**Claim:** Every theorem needs its theorem number and page in a citable source. The book is cited only by chapter, and Diestel–Uhl not at all.

**Witness:** `grep -cE "Theorem [0-9]|Prop\. [0-9]|Lemma [0-9]|p\. [0-9]" README.md` gives 0.

**Repair:** Add the published locator at each claim, for example "(Hytönen–van Neerven–Veraar–Weis 2016, Theorem N, p. M)" or a Diestel–Uhl chapter and theorem. Record each source in `sources.toml`.

## R16 (P3) — BS2, BS3.1 and BS7.4 restate pinned Mathlib as targets

**Location:** `README.md:218–236`: "Identify the integral of a finite-support simple function with its finite sum … Record additivity … give the equivalence of integrability for f under μ.map φ …". Also `:534–537` (conditional expectation and the `L¹` contraction).

**Claim:** These facts are at the pin. They must be cited under From Mathlib, not planned again.

**Witness:** `SimpleFunc.integral_eq_sum` (Integral/Bochner/Basic.lean:557), `integral_add` (:239), `tendsto_integral_of_dominated_convergence` (DominatedConvergence.lean:58), `integrable_map_measure` (L1Space/Integrable.lean:355), `integral_prod` (Integral/Prod.lean:443).

**Repair:** List these, `Integrable.prod_right_ae` (:249) and `Integrable.integral_prod_left` (:334) under From Mathlib. Name them in BS2's *Needs:* line, so that BanachSpaces BN7.3.2, which consumes them through BS2, still finds them. Keep as BS2 targets only the localized Fubini theorem for arbitrary measures, Hille's theorem, convexity and detection. In BS7.4, cite `condExpL2` and the native `condExp` contraction.

## R17 (P3) — Supplier rows cite a roadmap for a pinned carrier, or cite no section

**Location:** `README.md:38`: "Completed projective tensor products and their universal property | Banach space theory, B4". `:41–42`: the rows for "Unbounded operators" and "Partial differential equations", which cite no section.

**Claim:** The carrier and its universal property are pinned Tau Ceti declarations. The other two rows name no section.

**Witness:** `TauCeti.CompletedProjectiveTensor` is at `Completion.lean:76` and `TauCeti.CompletedProjectiveTensor.liftIsometry` at `:196`, at the pinned Tau Ceti.

**Repair:** Under From Tau Ceti, cite `TauCeti.CompletedProjectiveTensor`, `TauCeti.ProjectiveTensor.tmulL` and `TauCeti.CompletedProjectiveTensor.liftIsometry`. Cite the UnboundedOperators and PDE sections actually consumed, or delete the two rows (BS2 uses only Mathlib's `LinearPMap`).

## R18 (P3) — The title and description name one roadmap; the pull request adds two

**Location:** Title: "Add roadmap BochnerSpaces". Description: "This PR is a first step: a roadmap for Bochner spaces, covering Chapter 1 of Volume 1. The roadmap is organized by mathematical topic".

**Claim:**
- The pull request now also adds BanachSpaces, which consumes BochnerSpaces; the text leaves it unstated.
- "Organized by mathematical topic" is contradicted (R12).
- The coverage audit is to be deleted (R11).
- The supplier BanachSpaceTheory is not named.

**Witness:** `git diff --stat origin/main...HEAD` lists four files under `TauCetiRoadmap/BanachSpaces/`. BanachSpaces `README.md:37` consumes BS1.1–BS3.3. BochnerSpaces `README.md:39` consumes B4.0.

**Repair:** Title: "Add roadmaps BochnerSpaces and BanachSpaces". Description: "Adds two new roadmaps. BochnerSpaces (README.md, Suggested.lean, metadata.toml): Pettis measurability, Hille's theorem, Bochner–Fubini and L¹ ⊗̂π X identifications, Pettis integrability criteria, the Radon–Nikodým property and Bochner-space duality. Its suppliers are Mathlib, Tau Ceti and BanachSpaceTheory B1–B5 (B4.0's reflexive density theorem). BanachSpaces: normed and Banach spaces and bounded operators. It consumes BochnerSpaces BS1.1, BS1.3, BS1.5, BS2, BS3.1–BS3.3 and BS7.1, so BochnerSpaces merges first."

## Previous findings

- R01 — not repaired: `Suggested.lean:129–131` "zero_mem' := by sorry / add_mem' := by sorry / smul_mem' := by sorry"; `:183` "cont := by sorry".
- R02 — not repaired: `Suggested.lean:46` "set_option autoImplicit false".
- R03 — not repaired: `Suggested.lean:31–32` "BS4's completed projective-tensor identification needs the carrier constructed by BanachSpaceTheory B4, which is not provided at the dependency pin."
- R04 — not repaired: `README.md:470–471` "For a.e. strong-measurable Pettis integrable functions, prove uniqueness from a generating pi-system of set integrals."
- R05 — not repaired: all 15 declarations remain, e.g. `Suggested.lean:142` `linftySigma_eq_top`, `:236` `pettisIntegrable_of_integrable`.
- R06 — not repaired: `Suggested.lean:193` "Classical.choose (hf.2 A hA)".
- R07 — not repaired: `Suggested.lean:5–7` "module / public import Mathlib.Analysis.Normed.Module.DoubleDual".
- R08 — not repaired: `Suggested.lean:19–20` "These are representative suggested definitions and target signatures, not an exhaustive checklist."
- R09 — not repaired: `README.md:62` "Work over $\mathbb K=\mathbb R$ or $\mathbb C$" (gate `latex` 786, `tex` 41).
- R10 — not repaired: `README.md:133` "`VectorMeasure.scalarRNDeriv`"; `:140` "Mathlib PR #45494".
- R11 — not repaired: `Coverage.md` is present; `README.md:29` "The [source coverage index](Coverage.md) accounts for the main-text definitions".
- R12 — not repaired: `README.md:687` "Chapter 1, “Bochner spaces,” §§1.1–1.3"; `:480` "## BS7. More about the Radon–Nikodým property".
- R13 — not repaired: `README.md:1` "# Bochner spaces"; `:111` "## Existing library interfaces".
- R14 — not repaired: `grep -c Checks README.md` = 0.
- R15 — not repaired: `README.md:244` "**Hille's theorem.**", with no theorem number or page; 0 locators in the file.
- R16 — not repaired: `README.md:218–220` "Identify the integral of a finite-support simple function with its finite sum … Record additivity".
- R17 — not repaired: `README.md:38` "Completed projective tensor products and their universal property | Banach space theory, B4".
- R18 — not repaired: description "a roadmap for Bochner spaces, covering Chapter 1 of Volume 1"; the head now also adds BanachSpaces.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| BS3.3 zero-space case (cited by BanachSpaces BN8.2) | `S={*}`, `μ{*}=∞`; counting on `{1,2}` | `∞`-singleton: measures 0 or ∞, `L¹=0`, `‖∫‖=0`; counting: `L¹≅𝕂²`, `‖∫ 1_{1}‖=1` | holds; consistent with BN8.2's 0/1 norm | none |
| BS3.3 separability criterion | `μ=δ`, `X=ℓ²(ℝ)`; uncountable counting, `X=ℝ` | δ: `Lᵖ≅X`, nonseparable, X fails; counting: finite sets mutually at distance ≥1, `ℓᵖ(I)` nonseparable | both sides agree | none |
| BS7.1 partition formula (cited by BanachSpaces BN3.4) | `m{0}=x`, `m{1}=−x` on `{0,1}` | partition `{S}`: 0; `{{0},{1}}`: `2‖x‖`; `\|m\|(S)=2‖x‖ ≠ ‖m(S)‖=0` | holds; it is the pinned definition | remark |
| BS2 simple integral (cited by BanachSpaces BN7.3.2) | `1_[0,1]x + 1_[0,2]y`, Lebesgue | overlapping representation `x+2y`; disjoint refinement `(x+y)+y = x+2y` | equal; `SimpleFunc.integral_eq_sum` proves it | R16 |
| `linftySigma` closure fields | scratch file | three fields close by `aefinStronglyMeasurable_zero`, `.add`, `.const_smul` | no `sorry` needed | R01 |
| `dunfordIntegral.cont` | `X=ℝ`, `f=s^{-1/2}` on `(0,1)` | `‖T_f‖ = ∫\|f\| = 2`; `D_A f = ev(2)`, norm 2 | the bound is BS6.1's theorem | R01 |
| BS4.1 Minkowski contraction | `p=1`, `q=2`, counting on `{1,2}`, `F=1_{s=t}` | `‖F‖_{L¹(L²)} = 2`; `‖F‖_{L²(L¹)} = √2` | `p≤q` direction correct; the reverse needs `2≤√2`, false | R03 |
| BS4.4 `L¹ ⊗̂π X` | `μ=δ`, X complete | `𝕂 ⊗̂π X ≅ X ≅ L¹(δ;X)` | holds; elaborates | R03 |
| BS6.4 no-`c₀` criterion | `X=c₀`, `f=Σ1_{Aₙ}eₙ/\|Aₙ\|` | identity is 1-antilipschitz, so `hX` fails; Dunford integral `(1,1,…) ∉ c₀` | hypothesis needed | R03 |
| BS6.5 π-system uniqueness | `S={1,2}`, `P={{1}}`, `f=1_{2}x`, `g=0` | `∫_{1}f = 0 = ∫_{1}g`; `∫_S f = x ≠ 0` | false without `S ∈ P` | R04 |
| `exists_pettisVectorMeasure` (restated) | `ℓ²`-valued `Σ1_{Aₙ}(2ⁿ/n)eₙ`, `\|Aₙ\|=2⁻ⁿ` | `m(Aₙ)=eₙ/n`; tail norm `(Σ_{n>N} n⁻²)^{1/2} → 0` | restatement elaborates without choice | R06 |
| `pettisIntegrable_of_integrable` | scratch file | closes by `integrable_comp` and `integral_comp_comm` in one term | padding | R05 |

The rows for the untouched statements stand as in the previous review, of `35445d5`.

- **Gate:** FAIL on the same 10 rules as the previous round (`set_option` 1, `latex` 786, `tex` 41, `prnum` 1, `sorry-data` 2, `imports` 1, `mathlib-subimports` 8, `no-import-mathlib` 1, `statement-hygiene` 1, `stray-files` 1). The 4 `outside-folder` hits are BanachSpaces, which this pull request adds. The build passes. Dependency check: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 35 `sorry` warnings and nothing else. The folder is byte-identical to `35445d5`.
- **Scratch probe** (`import Mathlib` plus the Tau Ceti Completion module): the R01 fields, R03's three statements and the R06 restatement elaborate, and R05's one-term proof closes.
- **Library declarations opened at the pins:** 12, including `SimpleFunc.integral_eq_sum` (Bochner/Basic.lean:557), `VectorMeasure.variation` (Variation/Defs.lean:51), `preVariationFun` (Measure/PreVariation.lean:53), `TauCeti.CompletedProjectiveTensor` (Completion.lean:76) and `liftIsometry` (:196). `scalarRNDeriv` is absent from both libraries.
- **Cross-roadmap citations:** BanachSpaceTheory B1–B5 and B4.0 resolve on main (the density prerequisite is at README lines 379–384), and the UnboundedOperators and PDE paths exist. BanachSpaces cites BS1.1, BS1.3, BS1.5, BS2, BS3.1–BS3.3 and BS7.1, and all of these exist here. No upward or cyclic edge: BanachSpaces is downstream.
- **Overlap check:** read BanachSpaceTheory, StandardDistributions and MarkovChainsAndRenewal (main), and BanachSpaces (this PR), SobolevMapsBetweenManifolds, FrobeniusGeometry, EllAdicRealization and CompactSupport (open). Shared: Bochner integration and measurability (owner BochnerSpaces BS1–BS2, consumed by BanachSpaces), reflexive densities (owner BanachSpaceTheory B4.0) and the tensor carrier (owner: pinned Tau Ceti). No `Suggested.lean` name collides with `TauCetiRoadmap.BanachSpaces`.
- **Remark:** BS7.1's partition formula for variation is the pinned definition of `VectorMeasure.variation` (`preVariationFun`), which BanachSpaces BN3.4 cites as BS7.1's.

## Not verifiable

- The sampled targets "Spaces and scalars", "Measurability", "Bochner spaces", "Measures and endpoints", "Operator-valued functions" and "Dominated convergence, substitution rule and Fubini's theorem" carry no locator (R15). HNVW16 (doi 10.1007/978-3-319-48520-1) is paywalled: the previous round's fetch returned uncertified, and the text is unchanged.
- `Integration.tex` (author-supplied) is not a published or legally obtainable text.
- Diestel–Uhl, *Vector Measures* (AMS 1977) is cited without a locator, so there is nothing to verify.

## Source issues

- none
