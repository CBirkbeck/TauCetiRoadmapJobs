# Review of BochnerSpaces (pull request #2249 at 197be79)

**Verdict:** needs changes

The folder is byte-identical to `49a457d`; the only change since then is that `TauCetiRoadmap/BanachSpaces/` left the pull request. R13 and R18 are rewritten for that; R01–R12 and R14–R17 stand unchanged.

## R01 (P2) — Sorry'd data in two definitions

**Location:** `TauCetiRoadmap/BochnerSpaces/Suggested.lean:126–131` (`linftySigma`: "zero_mem' := by sorry / add_mem' := by sorry / smul_mem' := by sorry") and `:178–183` (`dunfordIntegral`: "cont := by sorry").

**Claim:** Two definitions have `sorry` in their bodies (gate `sorry-data (2)`). `dunfordIntegral.cont` is BS6.1's bound `‖D_A f‖ ≤ ‖T_f‖`, a theorem hidden inside data.

**Witness:** At this head a scratch file with the three fields below elaborates under `import Mathlib` with no `sorry`. For `f(s) = s^{-1/3}` on `(0,1)`, `X = ℝ`: `‖D_A f‖ = 3/2 = ‖T_f‖`, a bound that needs the closed-graph argument.

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

**Witness:** Pinned Tau Ceti has `TauCeti.CompletedProjectiveTensor` (`TauCeti/Analysis/Normed/Module/TensorProduct/Completion.lean:76`) and `liftIsometry` (`:196`). All three statements below elaborate at this head (scratch file, rerun this round).

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

**Claim:** A generating π-system does not determine set integrals unless it contains `S`. BS2 (`README.md:272`) states that hypothesis; BS6.5 drops it.

**Witness:** `S = {1,2}` with counting measure, `P = {{1}}` (it generates `2^S`), `f = 1_{2}·x` with `x ≠ 0`, `g = 0`. Then `∫_{1} f = 0 = ∫_{1} g`, but `∫_S f = x ≠ 0`.

**Repair:** Replace the sentence with: "For a.e. strongly measurable Pettis integrable functions, prove a.e. equality from equality of their set integrals over a generating π-system that contains `S`." Add the instance above as a Check.

## R05 (P3) — Padding in Suggested.lean

**Location:** `Suggested.lean`, lines 104, 134, 142, 186, 196, 202, 209, 236, 241, 282, 303, 337, 342, 373 and 398 (the declarations listed in the repair).

**Claim:** Each of these restates a definition, closes with one library lemma or one term from another target, treats a boundary case, or restates a supplier's target.

**Witness:** `pettisIntegrable_of_integrable` closes at this head with the single term `⟨fun x' => x'.integrable_comp hf, fun _ _ => ⟨_, fun x' => (x'.integral_comp_comm hf.integrableOn).symm⟩⟩` (scratch file, rerun this round). `mem_linftySigma` is `Iff.rfl`.

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

**Location:** `Suggested.lean:17–23`: "These are representative suggested definitions and target signatures, not an exhaustive checklist. … Discharging this file does not complete the roadmap." The section comments read `/-! ## BS1. … -/`.

**Claim:** The file is the acceptance test, not a sample. Its docstring must have the form "<title>: target signatures" and must name each headline that cannot be stated at the pins. The section comments must read `## Layer k: <title>`. No Lean name of the file appears in the README.

**Witness:** `grep -c` on `README.md` gives 0 for `HasRNPWith`, `bochnerDualMap`, `integral_mem_graph` and `linftySigma`.

**Repair:** Use the docstring "Bochner spaces: target signatures. The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti." Name every headline that cannot be stated, with the carrier it lacks. Rename the section comments after the README's layers. Name each kept declaration in backticks at its README target.

## R09 (P3) — LaTeX and TeX in the README

**Location:** `README.md:6`: "the duality of vector-valued $L^p$ spaces"; `:62`: "Work over $\mathbb K=\mathbb R$ or $\mathbb C$"; the display at `:87–90`.

**Claim:** Mathematics must be written in Unicode, with ASCII only inside code spans (gate: `latex` 786, `tex` 41).

**Witness:** Gate at this head: `latex=786 tex=41`.

**Repair:** Rewrite every formula in Unicode or in a code span. For example, line 62 becomes "Work over `𝕂 = ℝ` or `ℂ`", and lines 87–90 become `L∞_σ(μ; X) = {f ∈ L∞(μ; X) : AEFinStronglyMeasurable f μ}`.

## R10 (P3) — Process text, a PR number and library claims off the pins

**Location:** `README.md:13–20` ("This README is the definitive specification … Suggested homes are"); `:113–116` (revision hashes); `:132–137` ("`VectorMeasure.scalarRNDeriv` … when available in the dependency"); `:140` ("Mathlib PR #45494").

**Claim:** The README must be timeless and carry no PR numbers (gate `prnum`). A library claim must hold at the pins.

**Witness:** `scalarRNDeriv` occurs 0 times in pinned Mathlib (`1b1ccf4b`) and Tau Ceti (`2fd255d9`). Revision `396c3bd9` is not the pinned commit.

**Repair:** Delete lines 132–143, the revision sentence at 113–116 and the process sentences at 13–20. Cite only declarations that exist at the pins.

## R11 (P3) — Stray file `Coverage.md` indexes a private text section by section

**Location:** `TauCetiRoadmap/BochnerSpaces/Coverage.md` ("The source is the author-supplied updated `Integration.tex`, main text sections 1.1–1.3 …"); `README.md:29–32` and `:688–693`.

**Claim:** `Coverage.md` is not a roadmap file (gate `stray-files`). It summarises a source section by section, by line numbers of a text no reader can obtain.

**Witness:** `Coverage.md` lines 8–20 locate statements by line numbers of an unpublished TeX file, identified only by its SHA-256.

**Repair:** Delete it; sources are the README's references. Delete `README.md` lines 29–32, and at lines 688–693 delete the `Integration.tex` and `Coverage.md` sentences.

## R12 (P3) — The layers follow the source's section titles

**Location:** `README.md:687`: "Chapter 1, “Bochner spaces,” §§1.1–1.3". The headings include `## BS7. More about the Radon–Nikodým property`, item 8.1 "Elementary duality results" and item 1.1 "Functions on a measurable space".

**Claim:** The organisation is the book's chapter, and the layer and item names reproduce the source's section titles.

**Witness:** `Coverage.md`'s headings ("### More about the Radon–Nikodým property", "### Elementary duality results", "### Functions on a measurable space") index the source's sections and coincide with these README titles.

**Repair:** Name the layers by their mathematics, for example "Layer 7: the Radon–Nikodým property and representable operators", "8.1 The integral pairing J and its isometry" and "1.1 Pettis measurability on a measurable space". Delete the chapter-coverage claim at lines 686–693.

## R13 (P3) — README shape

**Location:** `README.md:1` "# Bochner spaces"; `:111` "## Existing library interfaces"; `:145` "## BS1. Measurability"; `:682` "## Sources".

**Claim:** The README needs:
- the title `# Roadmap: bochner spaces`, with a `**Summary.**` paragraph;
- `## Exact supplier contracts` and `## How to read the build`;
- `## Layer k:` headings with `### k.n` subsections, each layer ending with `### Examples` and `### Dependencies`;
- `## Downstream consumers` and `## References`.

**Witness:** `grep -n '^## '` lists only lines 22, 60, 111, the nine `## BS` headings and 682.

**Repair:** Restructure to the house shape. Move the table at lines 118–130 into per-supplier contracts. Give each item a `### k.n` subsection with a `*Needs:*` line. Rename `## Sources` to `## References`. Add `## Downstream consumers`, naming each consuming roadmap with the BS targets it uses. BanachSpaces has left this pull request and no roadmap on main or in an open pull request cites BochnerSpaces at this head, so the previous round's BanachSpaces line is no longer asked for.

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

**Repair:** Add the published locator at each claim, for example "(Hytönen–van Neerven–Veraar–Weis 2016, Theorem N, p. M)" or a Diestel–Uhl chapter and theorem.

## R16 (P3) — BS2, BS3.1 and BS7.4 restate pinned Mathlib as targets

**Location:** `README.md:218–236`: "Identify the integral of a finite-support simple function with its finite sum … Record additivity … give the equivalence of integrability for $f$ under $\mu.map\,\phi$ …". Also `:534–537` (conditional expectation and the `L¹` contraction).

**Claim:** These facts are at the pin. They must be cited under From Mathlib, not planned again.

**Witness:** `SimpleFunc.integral_eq_sum` (Integral/Bochner/Basic.lean:557), `integral_add` (:239), `tendsto_integral_of_dominated_convergence` (DominatedConvergence.lean:58), `integrable_map_measure` (L1Space/Integrable.lean:355), `integral_prod` (Integral/Prod.lean:443); all reopened at the pin this round.

**Repair:** List these, `Integrable.prod_right_ae` (Prod.lean:249) and `Integrable.integral_prod_left` (:334) under From Mathlib, and name them in BS2's *Needs:* line. Keep as BS2 targets only the localized Fubini theorem for arbitrary measures, Hille's theorem, convexity and detection. In BS7.4, cite `condExpL2` and the native `condExp` contraction.

## R17 (P3) — Supplier rows cite a roadmap for a pinned carrier, or cite no section

**Location:** `README.md:38`: "Completed projective tensor products and their universal property | Banach space theory, B4". `:41–42`: the rows for "Unbounded operators" and "Partial differential equations", which cite no section.

**Claim:** The carrier and its universal property are pinned Tau Ceti declarations. The other two rows name no section.

**Witness:** `TauCeti.CompletedProjectiveTensor` is at `Completion.lean:76` and `TauCeti.CompletedProjectiveTensor.liftIsometry` at `:196`, at the pinned Tau Ceti.

**Repair:** Under From Tau Ceti, cite `TauCeti.CompletedProjectiveTensor`, `TauCeti.ProjectiveTensor.tmulL` and `TauCeti.CompletedProjectiveTensor.liftIsometry`. Cite the UnboundedOperators and PDE sections actually consumed, or delete the two rows (BS2 uses only Mathlib's `LinearPMap`).

## R18 (P3) — The description contradicts the head and names no supplier

**Location:** Description: "The roadmap is organized by mathematical topic, with the book as its principal source … It includes a coverage audit of the chapter’s main text".

**Claim:**
- "Organized by mathematical topic" is contradicted by the layer titles (R12).
- The coverage audit is `Coverage.md`, which is to be deleted (R11).
- The supplier BanachSpaceTheory is not named.

The title is right again now that BanachSpaces has left the pull request.

**Witness:** `git diff --stat origin/main...HEAD` lists only the four files of `TauCetiRoadmap/BochnerSpaces/`. `README.md:36–40` consumes BanachSpaceTheory B1–B5, and `:563` B4.0.

**Repair:** Keep the title. Description, once R11 and R12 are repaired: "Adds the new roadmap BochnerSpaces (README.md, Suggested.lean, metadata.toml): Pettis measurability, Hille's theorem, Bochner–Fubini and `L¹ ⊗̂π X` identifications, Pettis integrability criteria, the Radon–Nikodým property and Bochner-space duality. Its suppliers are Mathlib, Tau Ceti and BanachSpaceTheory B1–B5 (B4.0's reflexive density theorem)."

## Previous findings

- R01 — not repaired: `Suggested.lean:129–131` "zero_mem' := by sorry / add_mem' := by sorry / smul_mem' := by sorry"; `:183` "cont := by sorry".
- R02 — not repaired: `Suggested.lean:46` "set_option autoImplicit false".
- R03 — not repaired: `Suggested.lean:31–32` "BS4's completed projective-tensor identification needs the carrier constructed by BanachSpaceTheory B4, which is not provided at the dependency pin."
- R04 — not repaired: `README.md:470–471` "For a.e. strong-measurable Pettis integrable functions, prove uniqueness from a generating pi-system of set integrals."
- R05 — not repaired: all 15 declarations remain, e.g. `Suggested.lean:142` `linftySigma_eq_top`, `:236` `pettisIntegrable_of_integrable`.
- R06 — not repaired: `Suggested.lean:193` "Classical.choose (hf.2 A hA)".
- R07 — not repaired: `Suggested.lean:5–7` "module / public import Mathlib.Analysis.Normed.Module.DoubleDual".
- R08 — not repaired: `Suggested.lean:20–21` "These are representative suggested definitions and target signatures, not an exhaustive checklist."
- R09 — not repaired: `README.md:62` "Work over $\mathbb K=\mathbb R$ or $\mathbb C$" (gate `latex` 786, `tex` 41).
- R10 — not repaired: `README.md:133` "`VectorMeasure.scalarRNDeriv`"; `:140` "Mathlib PR #45494".
- R11 — not repaired: `Coverage.md` is present; `README.md:29` "The [source coverage index](Coverage.md) accounts for the main-text definitions".
- R12 — not repaired: `README.md:687` "Chapter 1, “Bochner spaces,” §§1.1–1.3"; `:480` "## BS7. More about the Radon–Nikodým property".
- R13 — not repaired: `README.md:1` "# Bochner spaces"; `:111` "## Existing library interfaces". The BanachSpaces consumer line is withdrawn: that folder left the pull request.
- R14 — not repaired: `grep -c Checks README.md` = 0.
- R15 — not repaired: `README.md:244` "**Hille's theorem.**", with no theorem number or page; 0 locators in the file.
- R16 — not repaired: `README.md:218–220` "Identify the integral of a finite-support simple function with its finite sum … Record additivity".
- R17 — not repaired: `README.md:38` "Completed projective tensor products and their universal property | Banach space theory, B4".
- R18 — partly repaired: the head again adds one roadmap, so the title "Add roadmap BochnerSpaces" is right; the description still says "organized by mathematical topic … It includes a coverage audit" and names no supplier.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `linftySigma` closure fields | scratch file; singleton with `μ{*}=∞` | fields close by `aefinStronglyMeasurable_zero`, `.add`, `.const_smul`; on the singleton the carrier is `{0}`, closed under `+` and `•` | no `sorry` needed | R01 |
| `dunfordIntegral.cont` | `X=ℝ`, `f=s^{-1/3}` on `(0,1)` | `‖T_f‖ = ∫\|f\| = 3/2`; `D_A f` is multiplication by `3/2`, norm `3/2` | the bound is BS6.1's theorem | R01 |
| BS4.1 Minkowski contraction | `p=1`, `q=2`, counting on `{1,2}`, `F=1_{s=t}` | `‖F‖_{L¹(L²)} = 1+1 = 2`; `‖F‖_{L²(L¹)} = √(1+1) = √2` | `√2 ≤ 2`: direction `p≤q` correct; the reverse needs `2 ≤ √2`, false | R03 |
| BS4.4 `L¹ ⊗̂π X` | counting on `{1,2}`, X complete | `ℓ¹₂ ⊗̂π X ≅ X ⊕₁ X`; `‖e₁⊗x + e₂⊗y‖π = ‖x‖+‖y‖ = ‖(x,y)‖_{L¹(μ;X)}` | holds; elaborates | R03 |
| BS6.4 no-`c₀` criterion | `X=c₀`, `f=Σ1_{Aₙ}eₙ/\|Aₙ\|`, `Aₙ` disjoint | identity of `c₀` is 1-antilipschitz, so `hX` fails; `x'(f)` integrable for `x' ∈ ℓ¹`; Dunford integral `(1,1,…) ∉ c₀` | hypothesis needed | R03 |
| BS6.5 π-system uniqueness | `S={1,2}`, `P={{1}}`, `f=1_{2}x`, `g=0` | `σ(P)=2^S`; `∫_{1}f = 0 = ∫_{1}g`; `∫_S f = x ≠ 0` | false without `S ∈ P` | R04 |
| `exists_pettisVectorMeasure` (restated) | `f` Bochner integrable; `ℓ²`-valued `Σ1_{Aₙ}(2ⁿ/n)eₙ`, `\|Aₙ\|=2⁻ⁿ` | integrable: `m=μ.withDensityᵥ f`, `x'(m A)=∫_A x'∘f`; second: `m(Aₙ)=eₙ/n`, tail `(Σ_{n>N} n⁻²)^{1/2} → 0` | restatement elaborates without choice | R06 |
| `pettisIntegrable_of_integrable` | scratch file | closes by `integrable_comp` and `integral_comp_comm` in one term, no `sorry` | padding | R05 |
| BS2 simple integral | `1_[0,1]x + 1_[0,2]y`, Lebesgue | overlapping representation `x+2y`; disjoint refinement `(x+y)+y = x+2y` | equal; `SimpleFunc.integral_eq_sum` proves it | R16 |

The diff changes no statement. The rows for the untouched statements stand as in the previous review, of `49a457d`.

- **Change since `49a457d`:** `git diff --stat 49a457d 197be79` shows only the deletion of the four files of `TauCetiRoadmap/BanachSpaces/` (1369 lines); the BochnerSpaces folder has 0 changed lines. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/BochnerSpaces'` is empty.
- **Gate:** FAIL, rerun at this head, on the same 10 rules (`set_option` 1, `latex` 786, `tex` 41, `prnum` 1, `sorry-data` 2, `imports` 1, `mathlib-subimports` 8, `no-import-mathlib` 1, `statement-hygiene` 1, `stray-files` 1); `outside-folder=0`, `build=0`. Dependency check: `depcheck: 207 roadmaps, 1896 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 35 `sorry` warnings and nothing else.
- **Scratch probe** (`import Mathlib` plus the Tau Ceti Completion module), rerun at this head: the R01 fields, R03's three statements and the R06 restatement elaborate; R05's one-term proof closes; 4 `sorry` warnings, no error.
- **Library declarations reopened at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`):** 9 — `SimpleFunc.integral_eq_sum` (Bochner/Basic.lean:557), `integral_add` (:239), `tendsto_integral_of_dominated_convergence` (DominatedConvergence.lean:58), `integrable_map_measure` (L1Space/Integrable.lean:355), `Integrable.prod_right_ae` (Prod.lean:249), `Integrable.integral_prod_left` (:334), `integral_prod` (:443), `TauCeti.CompletedProjectiveTensor` (Completion.lean:76), `liftIsometry` (:196). `scalarRNDeriv`: 0 occurrences.
- **Cross-roadmap citations:** BanachSpaceTheory B1–B5 and B4.0 resolve on main (`## B1`–`## B5` at README lines 54, 135, 177, 239, 800; `### B4.0` at 359); the UnboundedOperators and PDE paths exist. No README on main or at an open head cites BochnerSpaces. The overlap list reports no dropped id and no other pull request changing this folder.
- **Overlap check:** read BanachSpaceTheory, StandardDistributions, MarkovChainsAndRenewal (main), SobolevMapsBetweenManifolds, FrobeniusGeometry, EllAdicRealization, CompactSupport (open); shared: reflexive densities (owner BanachSpaceTheory B4.0), the completed projective tensor carrier (owner: pinned Tau Ceti, R17); nothing else shared.

## Not verifiable

- The sampled targets "Spaces and scalars", "Measurability", "Bochner spaces", "Measures and endpoints", "Operator-valued functions" and "Dominated convergence, substitution rule and Fubini's theorem" carry no locator (R15), so there is no theorem number or page to check. HNVW16 (doi 10.1007/978-3-319-48520-1) is paywalled; an earlier round's fetch returned uncertified, and the text is unchanged.
- `Integration.tex` (author-supplied) is not a published or legally obtainable text.
- Diestel–Uhl, *Vector Measures* (AMS 1977) is cited without a locator, so there is nothing to verify.

## Source issues

- none
