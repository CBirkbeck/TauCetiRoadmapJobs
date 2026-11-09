# Review of SiegelModularForms (pull request #1714 at 4013044)

**Verdict:** needs changes

This is a full review. The folder is byte-identical to the head the previous review read, so the previous R01 is still open (R02 below). This round adds:
- one P2: the level-one Siegel theory overlaps LevelOneAutomorphicFormsForClassicalGroups, and the overlap is not recorded;
- twelve further P3s.

## R01 (P2) — The level-one `Φ`, `ker Φ = S` and vanishing theorems are planned again without citing LevelOneAutomorphicFormsForClassicalGroups §§6.1–6.2

**Location:** four statements in `TauCetiRoadmap/SiegelModularForms/README.md`, in `Suggested.lean`, and in the scope section.
- `README.md:761`: "hence `M_k(Γ_g) = 0` for `kg` odd".
- `:906`: "Corollaries: `M_k(Γ_g) = 0` for `k < 0`".
- `:956`: "so `S_k(Γ_g) = 0` for `2k < g`".
- `:1024`: "`S_k(Γ_g)` is the kernel of `Φ` on `M_k(Γ_g)`".
- `Suggested.lean`: `scalar_eq_zero_of_odd`, `isSingular_iff`, `isCuspForm_iff_fourierCoeff`.
- *Scope and ownership* (`:125–127`) names that roadmap only for the theta map.

**Claim:**
- LevelOneAutomorphicFormsForClassicalGroups comes earlier in the merge order (line 366 against 394). Its §§6.1–6.2 plan all four level-one statements, on AutomorphicBundles' classical forms, and they precede any consuming Siegel roadmap.
- This README states the same theorems in 1.3, 2.4, 2.6 and 3.2. It records neither the overlap nor a comparison between the two carriers.
- The supplier's §§7.3 and 7.9 also prove level-one cusp dimensions (degree ≤ 8 for `k_g > g`; every degree through weight 13). These overlap 6.3, 6.4 and 6.9 here, again without a recorded comparison.
- The README cites the supplier by the design-target ids `LO.6/higher-genus-theta` and `LO.6/harmonic-theta`, which its README never uses.

**Witness:** `packages/LevelOneAutomorphicFormsForClassicalGroups/README.md`:
- `:111–115`: "stated here because this roadmap needs them before any Siegel roadmap that consumes it".
- `:2009`: "`ker Φ_g = S_k(Γ_g)` at level one".
- `:2031–2038`: odd and negative weight, and "`S_k(Γ_g) = 0` for `g > 2k`".
- Theta maps: §6.4 (`:2081`) and §6.7 (`:2145`).

**Repair:**
- Add a bullet to *Not owned here* and a contract "From TauCetiRoadmap.LevelOneAutomorphicFormsForClassicalGroups". It should say that §§6.1–6.2 own these statements at level one, and that Layers 1–3 here prove them on the analytic carrier for every arithmetic `Γ`.
- Add a comparison Check: at level one, 3.1's `Φ` is §6.1's `Φ_g` under AutomorphicBundles §11.9.
- In 6.3 and 6.9, add comparison Checks against §7.9. Two examples: `dim S₁₂(Γ₄) = 2` is two rows there, and `dim S₁₂(Γ₃) = 1` is one row.
- Cite "§6.4" and "§6.7" in place of the `LO.6/…` ids (`README.md:126, 334, 1300, 1309, 1417, 2390`; `Suggested.lean:66`).

## R02 (P3) — Previous R01 unrepaired: Tau Ceti names are taken from main's pin, while the head pins `358314d`

**Location:**
- `README.md:255`, `:277` and `:491` cite `Matrix.transpose_mul_J_mul_eq_smul_iff`.
- `:293–299` cite `TauCeti.NumberTheory.ModularForms.ThetaSeries.*`: `ZLattice.thetaSeries`, `thetaSeries_S_smul` and `thetaForm`.

**Claim:**
- `lake-manifest.json` still pins Tau Ceti at `358314d`.
- At that pin the multiplier lemma has the one-directional name, and no theta-series module exists.

**Witness:** at `358314d`:
- `TauCeti/LinearAlgebra/Matrix/SymplecticMultiplier.lean` declares only `transpose_mul_J_mul_eq_det_smul` (`:76`), `det_eq_of_transpose_mul_J_mul_eq_smul` (`:86`) and `det_eq_of_symplectic_adjoint_of_mul_eq_smul_one` (`:94`).
- `TauCeti/NumberTheory/ModularForms/` has no `ThetaSeries` directory.

**Repair:** as in the previous review. Rebase on main, which moves the pin to `2fd255d` where these names exist, and rerun the targeted build. Otherwise, write `det_eq_of_transpose_mul_J_mul_eq_smul` and say that the pinned Tau Ceti has no theta-series module.

## R03 (P3) — Mathlib and Tau Ceti names that do not exist under the cited names at the pins

**Location:**
- `README.md:230–231`, `:728`, `:733`, `:808`: `ModularForm.slash`.
- `:231`, `:1142`, `:1154`, `:1283`: `EisensteinSeries.E`.
- `:303–304`, `:1101`: `ModularForm.sturm_bound_finiteIndex` and `ModularForm.sturm_bound_finiteIndex_SL2Z`.
- `Suggested.lean:704` (docstring): `ModularForm.slash`.

**Claim:** at the pins, two of these Mathlib names do not exist, and the Tau Ceti theorems sit in another namespace.

**Witness:**
- `#check @EisensteinSeries.E`: unknown identifier. The series is `ModularForm.E` (`EisensteinSeries/Basic.lean:47`).
- `#check @ModularForm.slash`: unknown constant. The slash is the private `privateSlash` (`SlashActions.lean:89`).
- Tau Ceti has `TauCeti.ModularForm.sturm_bound_*` (`SturmBound.lean:79, 87`).

**Repair:**
- Write `ModularForm.E`.
- Write "the `SlashAction` instance `f ∣[k] γ`". Its factor is `|det γ|^{k−1}`, which is `det^{k−1}` for `det γ > 0`.
- Add the `TauCeti.` prefix to the two Sturm-bound names.

## R04 (P3) — 2.3 is stated for period-1 functions, but 2.4 applies it to slashes whose period is only `N`

**Location:**
- `README.md:889–892`: "a holomorphic `f` … invariant under `τ ↦ τ + S` and under `τ ↦ UτUᵀ` for `U ∈ GL_g(ℤ)` … is bounded on every `{Im τ ≥ c·1}`".
- `:902`: "(2.3 applied to each `f ∣_ρ δ`, which is invariant under the arithmetic group `δ⁻¹Γδ`)".

**Claim:**
- For general arithmetic `Γ`, `f ∣_ρ δ` is invariant only under `τ ↦ τ + NS` and under the `U` with `m(U) ∈ δ⁻¹Γδ`. 2.3's hypotheses therefore fail where 2.4 uses it.
- The bound itself never uses the `GL_g(ℤ)` hypothesis.

**Witness:**
- `f(τ) = ψ₄(τ/2)`, that is `ψ₄` slashed by `diag(1, 1, 2, 2)`, is `Γ₂(2)`-invariant.
- `f(τ + diag(1, 0)) ≠ f(τ)`, because `a(ψ₄; (1, 0, 0)) = 240` picks up the factor `e(1/2) = −1`.
- This is the degree-two analogue of 2.2's `E₄(τ/2)` Check.

**Repair:** restate 2.3 with period `N`:
- If `f` is holomorphic, invariant under `τ ↦ τ + NS` for `S ∈ Sym_g(ℤ)`, and `fourierCoeff N f` is supported on `T ≥ 0`, then `f` is bounded on `{Im τ ≥ c·1}` by `∑ |a(T)| e^{−2πc·tr T/N}`.
- Drop the `GL_g(ℤ)` hypothesis.

## R05 (P3) — 7.3 asserts that the paramodular operators at `p ∣ N` "are not self-adjoint", which fails on zero spaces

**Location:**
- `README.md:2112–2113`: "which exist for every `p` but are not self-adjoint when `p ∣ N`".
- `:2135`, Check: "At `p ∣ N` the two paramodular operators exist but are not self-adjoint".

**Claim:**
- This is an unconditional negative with no source. On a zero space every operator is self-adjoint.
- The intended statement is that self-adjointness is not asserted.

**Witness:**
- `ibukiyamaDim 5 2 = 0` (recomputed; 10.1's Check), so `S₅(K(2)) = 0`.
- In odd weight `M₅(K(2)) = S₅(K(2))`, so both operators are `0` there.

**Repair:** write "need not be self-adjoint when `p ∣ N`", and in the Check "no Check may assert self-adjointness there".

## R06 (P3) — 7.5 gives a coset type outside `GSp`, and lists the coset types in the wrong order

**Location:** `README.md:2191–2193`: "the three terms are the cosets with `(A, D) = (p·1, 1)`, `(pU^{−ᵀ}, Uᵀ)`-type with `p` values of `B` each, and `(1, p·1)` with `p³` values of `B`".

**Claim:**
- `[[A, B], [0, D]]` has multiplier `p` exactly when `A Dᵀ = p·1`.
- `(pU^{−ᵀ}, Uᵀ)` fails this for non-symmetric `U`. The type that produces `a(p⁻¹UᵀTU)` is `(pU⁻¹, Uᵀ)`.
- The list also runs opposite to the formula: `(p·1, 1)` gives `p^{2k−3}a(T/p)`, and `(1, p·1)` gives `a(pT)`.

**Witness:** for `U = [[2, 1], [0, 1]]` and `p = 2`:
- `pU^{−ᵀ}·U = [[2, 1], [−2, 1]] ≠ 2·1₂`.
- `pU⁻¹·U = 2·1₂`.

**Repair:** write "the cosets with `(A, D) = (1, p·1)` (`p³` values of `B`), `(pU⁻¹, Uᵀ)` (`p` values each), and `(p·1, 1)`", in the order of the three terms.

## R07 (P3) — 7.6 states the Klingen Satake parameters with no locator, and has no Checks

**Location:** `README.md:2208–2215`: "`E_{g,r,k}(f)` an eigenform when `f` is and the Satake parameters … being those of `f` extended by the Eisenstein ones `p^{k−r−1}, …, p^{k−g}`". 7.6 also "Define[s], as targets, the eigenvalue lists" and has no **Checks.** block.

**Claim:**
- The theorem is consumed by 8.2 and 11.3, but no source is cited for it.
- The defined eigenvalue lists have no Checks.

**Witness:**
- The statement is consistent. For `g = 2`, `r = 1`: `α₀²α₁α₂ = ββ̄·p^{k−2} = p^{2k−3}`.
- No reference supports it.
- LevelOneAutomorphicFormsForClassicalGroups §6.1 proves its standard-`L` form, the Zharkovskaya relation `L(s,F,St) = L(s,ΦF,St) ζ(s−(g−k)) ζ(s+(g−k))`.

**Repair:**
- Cite §6.1 there, together with a classical source with a theorem number for the spinor form.
- Add three Checks:
  - `E_{2,1,12}(Δ)` at `p = 2` has parameters `(β, β̄/β, 2¹⁰)`, with `λ(T(2)) = −24·(1 + 2¹⁰) = −24600` and `α₀²α₁α₂ = 2²¹`.
  - Extending by `p^{k−r}` instead gives `2²² ≠ 2^{2k−3}`.
  - `r = 0` returns `(1, p^{k−1}, p^{k−2})`.

## R08 (P3) — Layer 8 needs Layer 9, and several layer *Dependencies* sections are incomplete

**Location:**
- `README.md:432`: "Layer 8 (`L`-functions) needs Layer 7 and `LFunctions` *Layer 0*".
- `:2428`: "The Maass pole computation additionally needs 9.5".
- `:2520–2524`: Layer 8 *Dependencies*.
- `:2238`: "7.6 needs Layers 4 and 6. Independent of Layers 5–6."

**Claim:**
- 8.3, and 8.4's polar divisor `{k}` for a Saito–Kurokawa lift, use 9.5, while Layer 9 needs Layer 8.
- Layer 8's *Dependencies* omit 2.5, 3.2, 4.3, 5.3 and 9.5. They also omit the suppliers 8.3 names: AutomorphicLFunctionsAndLocalFactorsPartII §§9.1–9.3, AdelicAlgebraicGroups §§2.2–2.3 and AutomorphicFormsOnReductiveGroups §§3.1–3.2.
- Other layers have the same gap:
  - Layer 0 omits AutomorphicFormsOnReductiveGroups §6.4 and MetaplecticAutomorphicForms 8.10.
  - Layer 5 omits LevelOneAutomorphicFormsForClassicalGroups and MetaplecticAutomorphicForms 8.18.
  - Layer 6 omits PELModuli M5 and Layer 3.
  - Layer 10 omits SmoothRepresentationsOfLocalGroups and `LFunctions` *Layer 0*.

**Witness:**
- 9.5's *Needs:* (`:2677`) are "7.4, 8.1, 8.2, 9.3, 9.4".
- 8.3's *Needs:* (`:2425–2429`) include 9.5.

**Repair:**
- Move the Maass-space pole statement and the polar divisor `{k}` into 9.5, as corollaries of its factorization.
- Rebuild each layer's *Dependencies* section, and the build paragraph, from its targets' *Needs:* lines.
- Write "7.1–7.5 are independent of Layers 4–6".

## R09 (P3) — 0.3 calls MetaplecticAutomorphicForms' `SiegelSpace` "one type" with `ℍ[2]`; the two are only equivalent

**Location:**
- `README.md:543–545`: "`SiegelSpace` … is `ℍ[2]` … so a consumer of both sees one type up to the definitional unfolding of `Sym 2`".
- `:392–393`: "states the identity of the two subtypes".

**Claim:** one is a single subtype with a conjunction, the other a nested subtype. They are canonically equivalent, not one type.

**Witness:**
- MetaplecticAutomorphicForms `Suggested.lean:200–201`: `{Z : Matrix (Fin 2) (Fin 2) ℂ // Zᵀ = Z ∧ (Z.map Complex.im).PosDef}`.
- Here `Suggested.lean:225–226`: `{τ : Sym g // …}`, where `Sym g = ↥(symSubmodule g)`.

**Repair:** state 0.3's comparison as a homeomorphism `ℍ[2] ≃ₜ SiegelSpace` that keeps the underlying matrix, and drop "one type up to the definitional unfolding".

## R10 (P3) — The spinor `L`-function source is attributed to the wrong author

**Location:**
- `README.md:3471`: "T. Hayashi, *The spinor L-function of Miyawaki–Ikeda lifts*, arXiv:1305.1076".
- `:2763`: "Hayashi 2013".

**Claim:** the paper is by Shuichi Hayashida, and its title is "On the spinor L-function of Miyawaki–Ikeda lifts".

**Witness:**
- `hayashi2013` lines 6–7 give the title and author.
- Theorem 1.1 at lines 56–69 supports 9.8 as stated, including the case `(n, k) = (2, 10)` attributed to Heim.

**Repair:** write "S. Hayashida, *On the spinor L-function of Miyawaki–Ikeda lifts*", with the DOI the manifest records, and "Hayashida 2013" in 9.8.

## R11 (P3) — 6.9's Poor–Yuen 2007 locator is wrong and flagged "unread", although the text is cached; it covers even weights only

**Location:** `README.md:1979–1981`: "Poor–Yuen 2007, the dimension table of the introduction and its main theorem, cited by locator, the text being unread here … zero for the other `k ≤ 16`".

**Claim:**
- The introduction contains neither the table nor a main theorem.
- The values are worked examples in §13, and they treat even weights only.

**Witness:**
- `pooryuen2007` line 1194: "13. Examples".
- Lines 1269–1322: `S₂, S₄, S₆ = 0`, `S₈ = S₁₀ = 1`, `S₁₂ = 2`.
- Line 1523: `S₁₄ = 3`. Line 1590: `S₁₆ = 7`.
- Line 144: only even weights are considered.

**Repair:**
- Cite "§13, Examples 1–8, pp. 208–215" and drop the "unread" flag.
- Restrict the claim to even `k`, or cite LevelOneAutomorphicFormsForClassicalGroups §7.9 for odd `k ≤ 13` and a source for `k = 15`.

## R12 (P3) — 6.4 states Ibukiyama's `j = 4, 6` generators "by citation", with neither content nor locator

**Location:** `README.md:1683–1685`: "State Ibukiyama's generators of the modules `⨁_k M_{k,4}(Γ₂)` and `⨁_k M_{k,6}(Γ₂)` … (Ibukiyama 2012, …, Theorems for `j = 4, 6`), by citation."

**Claim:**
- The generators are not given, so the target cannot be stated from the README.
- No theorem number or page is given.
- "By citation" contradicts `:75`: "Every nonconjectural theorem specified below includes its proof as a target".
- The work is not in the manifest.

**Witness:** `sources.toml` has 19 keys, and none is Ibukiyama 2012.

**Repair:**
- Give the theorem numbers and pages.
- State the generators' weights and each module's Hilbert series, as 6.4 does for `j = 2`. Otherwise cut the item.

## R13 (P3) — Humbert surfaces are handed to this roadmap, which owns them nowhere

**Location:** `README.md:3279`: "`HilbertModularSurfaces` name this roadmap … for the Humbert surfaces in the Siegel threefold; nothing of theirs is consumed here".

**Claim:**
- HilbertModularSurfaces excludes Humbert surfaces in favour of this roadmap.
- No target here defines them.
- *Not owned here* excludes "the geometry of `A_2`" without naming an owner.

**Witness:**
- HilbertModularSurfaces, at the head of its pull request, under "Explicit scope exclusions": "Humbert surfaces and the map to the Siegel threefold (the sibling `SiegelModularForms` …)".
- `roadmaps grep -i humbert` finds no owner.

**Repair:** choose one.
- Add a target for the modular embedding `ℍ × ℍ → ℍ₂` of a real quadratic order and its image. 2.6's route for Proposition 4.6 already pulls back along such embeddings.
- Or state under *Not owned here* that these surfaces are owned by no roadmap, or name the owner, and reword `:3279` so that the sibling can repoint.

## R14 (P3) — 26 theorems and the core definitions of `Suggested.lean` are never named in the README

**Location:**
- Theorems: `koecher`, `hasSum_fourier`, `fourierCoeff_conj`, `fourierCoeff_eq_zero_of_hasSum`, `bounded_of_invariant`, `fourierCoeff_isBigO`, `fourierCoeff_cusp_isBigO`, `isCuspForm_iff_fourierCoeff`, `finiteDimensional`, `eq_zero_of_fourierCoeff_eq_zero`, `exists_unique_reduced`, `finite_posSemidef_trace_le`, `scalar_eq_zero_of_odd`, `vector_eq_zero_of_odd`, `siegelEisensteinFun_mem`, `fourierCoeff_siegelTheta`, `siegelTheta_symJ_smul`, `chi10_isCuspForm`, `chi12_isCuspForm`, `wronskian_mem`, `igusa_even`, `igusa_odd`, `igusaGenerators_algebraicIndependent`, `finrank_eq_igusaDim`, `coeffTriple_heckeT`, `finrank_cusp_277`.
- Definitions: `siegelEisenstein`, `siegelTheta`, `cuspSubmodule`, `chi10`, `chi12`, `chi35`, `wronskian`, `phi`, `rho`, `detWeight`, `slashE`, `IsMaassForm`.

**Claim:** README and Lean must agree in both directions. The README already names its acceptance statements in 1.3, 2.6, 6.4, 6.5, 7.2, 9.4, 9.5, 10.1 and 11.2, but not those of 2.1–2.5, 3.2, 3.5, 4.1, 5.1–5.2, 6.1–6.3, 7.5 and 10.5.

**Witness:** an exact match of the 208 declared names against the README's code spans leaves exactly these unmatched.

**Repair:**
- Add "`Suggested.lean` states this as `…`" at each target.
- For the remaining proof obligations and helpers, one sentence per layer.

## Previous findings

- R01 (previous review), Tau Ceti names at main's pin: **not repaired**. The folder is unchanged since that review, and `README.md:255, 277, 293–299` still cite the `2fd255d` names. See R02.

## Verified sound

### Gate, dependency check, elaboration, signatures, padding

- **Worker's gate** (`scratch/gate.md`): every check is `0`, `build=0`, result `OK`.
- **My gate rerun:** every check is `0` except `depcheck: NOT IN ORDER: SiegelModularForms`. That comes from the board's order file, and the brief says it is not a finding.
- **Dependency check** with the candidate order, `--movable` and main:

```text
depcheck: 239 roadmaps, 2355 edges, 0 problem(s)
```

- **Elaboration:** `lake env lean` on `Suggested.lean` exits `0` in 33 s with exactly 72 `declaration uses sorry` warnings and nothing else.
- **Signatures:** a scratch copy with `#check @…` for all 208 declarations elaborates with 0 errors. I compared the elaborated types with the README statements.
  - Every binder is carried in the declaration's own signature: `IsArithmetic Γ` in `finiteDimensional`; `2 ≤ g`, `IsArithmetic` and period `N` in `koecher`; `0 < g` in `isSingular_iff`; `Even k` and `4 ≤ k` in the Maass and Saito–Kurokawa theorems; the ranges in the Tsushima, Cléry–van der Geer–Grushevsky and Ibukiyama theorems.
  - Nothing was lost through `variable` blocks.
- **Padding probe:** I replaced each `sorry` by `first | (rfl; done) | (simp; done) | (infer_instance; done) | (trivial; done) | (norm_num; done) | (decide; done)`. All 72 sites still error, so none closes in one tactic.
- **Headlines:**
  - The headlines that are statable at the pins are all stated.
  - The module docstring names the ones that are not, with the missing carrier: Petersson product, Maass–Cohen and `H(r, N)`, Klingen, odd-rank theta, the level 2/3/4 rings, Satake and `L`-functions, the Jacobi side, Ikeda and Miyawaki, and the paramodular `L`-theory and conjecture.

### Seeded sample (15 targets) and flagged locators

- **0.1:** van der Geer Exercise 2.1 (p. 5, line 160) gives the block conditions, with `Dᵗ A − Bᵗ C = 1`, the transpose of the README's `AᵀD − CᵀB = 1`. Exercise 2.2 (p. 7, line 255) gives the generation of `Γ_g` by `[[1, s], [0, 1]]` and `[[0, 1], [−1, 0]]`; that is the inverse of Mathlib's `J`, so the same group.
- **0.2:** checked against its suppliers, ClassicalGroupsPartII CG.0.1 (its README line 399) and AutomorphicFormsOnReductiveGroups §6.4 (line 1021). Values in the table.
- **0.6:** van der Geer p. 7 (line 235) defines `Γ_g(n)`. The orders and indices are recomputed in the table.
- **0.7:**
  - Poor–Yuen 2015, p. 1 (lines 31–41) and line 224: their `K(N)` is the conjugate convention, with support at `N ∣ a`.
  - The README fixes its own convention, `ℤ ⊕ ℤ ⊕ ℤ ⊕ Nℤ` with coordinates `(n, r, Nm)`, and quotes only conjugation-invariant data from Poor–Yuen. I checked the entry shape against `L` and `L^∨` (below).
- **1.1:** van der Geer p. 9 (lines 324–350): `ρ_{j,k}` has highest weight `(j + k, k)`.
- **1.3:** van der Geer §3 (lines 359–363), the polynomial product, and Corollary 4.2 (p. 11, line 439).
- **2.3:** van der Geer Theorem 4.3 (p. 11, line 442). R04 is about the generality, not the source.
- **2.4:** van der Geer Theorem 4.4 and Corollary 4.5 (p. 11, lines 470 and 475), for `Γ_g`.
- **4.1:** van der Geer Theorem 5.4 (p. 13, line 584), even `k > g + r + 1`, with `r = 0`.
- **6.3:** van der Geer Theorem 9.1 (p. 19, line 858), the exact sequence (line 875) and `R` on [52] p. 849 (line 862).
- **6.4:**
  - Tsushima's formula reproduces all 161 in-range entries of van der Geer's §25 table (p. 46, lines 2262–2272), and also gives `0` throughout the column `k = 4`.
  - Taïbi pp. 6–7 (lines 189–195): Tsushima's range is `m₁ > m₂ ≥ 5` or `m₁ = m₂ ≥ 4`; Arthur's classification extends it to `m₁ > m₂ ≥ 3`.
  - Satoh's generation of the `j = 2` module: van der Geer line 2255.
  - Ibukiyama 2012: R12.
- **7.3:** the Check value is recomputed in the table. The overclaim is R05.
- **7.6:** no locator; R07.
- **8.1:**
  - van der Geer §18 (lines 1673–1683): `F(X)` and `∑ T(pⁱ) zⁱ = (1 − p²T₂(p²)z²)/z⁴F(1/z)`.
  - §19 (lines 1701–1708): `α₀²∏α_i = p^{∑λ_i − g(g+1)/2}`, and the elliptic and Eisenstein parameters.
  - §20 (lines 1741–1776): `Z_f`, `D_f`, `ζ(2s − j − 2k + 4)`, `Δ(f, s)` and Andrianov's sign `(−1)^k`.
- **11.4:** each of the 13 rows names a milestone that states that invariant. The LMFDB column names are under *Not verifiable*.
- **Also verified:**
  - Ikeda 2006 Theorem 1.1 (lines 55–83): parity `n + r ≡ k mod 2`.
  - Hayashida 2013 Theorem 1.1 (lines 56–69).
  - Gelbart–Jacquet Theorem 9.3 (1), journal p. 534 (lines 2134, 2151–2154).
  - Poor–Yuen 2015 Theorems 1.2–1.3 (lines 64–69), and Theorem 3.1 with Table 1 (lines 235–239).
  - Cléry–van der Geer–Grushevsky Theorem 12.1 and Remark 12.2 (p. 20, lines 934–944), and Theorem 14.1 (p. 22, line 1036).
  - van der Geer §21: the Maass relation (line 1830), Theorem 21.1 (line 1841), the `V_l` coefficient law (lines 1864–1873), Ikeda's Satake parameters (lines 1917–1920) and Example 21.2 (line 1936).
- **Flagged locators:** Poor–Yuen 2007 is now verified (R11). Tsuyumine's series is internally consistent: it expands to `1, 1, 1, 2, 4, 3, 7, 8, 11` at `k = 4, …, 20`, and the numerator is palindromic of degree 114. The others are under *Not verifiable*.

### Library declarations opened at the pins

- **Mathlib:** 57 names `#check`ed; every README name resolves except the two in R03.
  - `LinearAlgebra/SymplecticGroup.lean` (`J`, `det_eq_one`, `mem_iff'`, `neg_mem`, `transpose_mem`, `inv_eq_symplectic_inv`).
  - `LinearAlgebra/Matrix/PosDef.lean:550` (`det_pos`).
  - `GroupTheory/Commensurable.lean:58`.
  - `NumberTheory/HeckeRing/Defs.lean`.
  - `QExpansion.lean:171` (`UpperHalfPlane.qExpansion`).
  - `EisensteinSeries/Basic.lean:47`.
  - `SlashActions.lean:78–89`.
- **Tau Ceti at `358314d`:** about 30 names resolved by grep and 21 by `#check`.
  - `Symplectic/Basic.lean:116–127`.
  - `TorusGeneration.lean:140–148`: `eq_top_of_root_subgroups` is over `[Field K]`, as the README says.
  - `Newforms/Newform.lean:104–108`: `isNorm`, `a₁ = 1`, which `saito_kurokawa` relies on.
  - `LevelOne/GradedRing.lean:746`.
  - `EisensteinSeries/Normalized.lean:52, 62`.
  - `Petersson/Normal.lean`, `CharacterDecomp.lean`, `LFunction/*`.

### Cross-roadmap citations resolved (28)

- **HalfIntegralWeightModularForms** at `1a78fdd`: 6.1–6.4 (lines 1562–1712).
- **MetaplecticAutomorphicForms** at `ebe857f`: 6.18, 6.20, 8.10–8.12, 8.18 (`√(2a)ℤ`, `W = ν = 0`), 8.19 and 8.76–8.80.
- **AutomorphicFormsOnReductiveGroups** at `4a03177`: §3.1 `classicalEquiv` and §6.4 `positiveSimilitude`.
- **ClassicalGroupsPartII** at `ce69dfc`: CG.0.1.
- **Other open heads:**
  - QSeriesPartitionsAndMockModularForms §9.1.
  - LatticePackingsAndPerfectForms 5.6. Its line 129 defers degree-`g` theta here, so supply runs one way.
  - HyperellipticCurves 5.3 and 5.6.
  - AbelianVarietiesOverFiniteFields 1.3.
  - SmoothRepresentationsOfLocalGroups SR.0.1, SR.0.3, SR.0.4 and SR.1.1–SR.1.3.
  - AdelicAlgebraicGroups §§2.2–2.3.
  - AutomorphicLFunctionsAndLocalFactorsPartII §§9.1–9.3.
  - PELModuli M5 and M6.
  - ShimuraCompactifications 2.8 and 7.16.
  - AutomorphicBundles 11.1, 11.9 and 11.16.
- **Board package:** LevelOneAutomorphicFormsForClassicalGroups §§6.1–6.7, 6.12, 7.3 and 7.9.
- **On main:** ModularForms Layers 2, 3, 4, 7 and 9 (Satake `{α_p, β_p}`, line 980); ThetaSeries Layers 1–7, 2E and 6F; IntegralLattices Layer 2 and 6D; `LFunctions` *Layer 0* records; CharacterSumsOverFiniteFields' Conrey record (line 265).
- **Overlaps:** `scratch/overlaps.md` lists no conflicting or dropping pull request.
- **Closest open roadmaps:** HilbertModularForms and MaassForms defer Siegel objects here, and BianchiModularForms names none, so there is no double owner. Humbert surfaces are the exception (R13).

### Adversarial table

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.1 block form | `g = 1`: `diag(2, ½)`, `diag(1, −1)` | `MJMᵀ = J`; `= −J`, det `−1` | Pass |
| 0.2 `GSpPos.mult` | `diag(1, 2)` at `g = 1`; `diag(1,1,−1,−1)`; `c·1` | entry `−2` ⇒ `μ = 2`; `μ = −1` with det `+1`, rejected; `μ = c²` | Pass |
| 0.2 `M^∨` | Mathlib `J` | `−J Mᵀ J = [[Dᵀ, −Bᵀ], [−Cᵀ, Aᵀ]] = μM⁻¹` | Pass |
| 0.6 orders and indices | `p = 2, 3`; `N = 0` | `720`, `51840`; `15`, `40`; `−1 ∈ Γ(2)`, `∉ Γ(3)`; `Γ(0) = {1}` | Pass |
| 0.7 `K(N)` | `L = ℤ³ ⊕ Nℤ`, `L^∨ = ℤ ⊕ N⁻¹ℤ ⊕ ℤ ⊕ ℤ` | entry shape matches; `n(diag(0, 1/N)) ∈ K(N) ∖ Γ₂`; `μ_N L = √N L^∨`; `(τ′, z, τ″) ↦ (Nτ″, z, τ′/N)`; `δ = diag(1, 1, 1, N)` gives `Γ^{para}(1, N)` | Pass |
| 0.7 index | `p = 2, 3` | hyperplanes of `𝔽_p⁴`: `15`, `40` | Pass |
| 1.1 `ρ_{k,j}` | `diag(a, b)` on `X₀^j`; `A = [[1,1],[0,1]]`, `B = [[1,0],[1,1]]` | `a^{k+j}b^k`; `AᵀBᵀ = [[1,1],[1,2]] ≠ (AB)ᵀ = [[2,1],[1,1]]` | Pass |
| 1.3 `eq_zero_of_neg_one_mem` | `g = 1`, `ρ = det⁰ ⊕ det¹`, `f = (1, 0)` | `ρ(−1) = diag(1, −1)`; `f ≠ 0`; the fixed-vector hypothesis fails, as needed | Pass |
| `exists_equiv_modularForm_degreeOne` | pinned slash `σγ·|det γ|^{k−1}·denom^{−k}` | `= det^{k−1}(cτ+d)^{−k}` for `det > 0`; `dim M₁₂ = 2` on both sides | Pass (names: R03) |
| 2.1 `exists_unique_reduced` | `(2, ±1, 3)`; `(2, 2, 2)` | only `r = 1` reduced; content `2`, entry gcd `1` | Pass |
| 2.2 `fourierCoeff` | `e(tr(T₀τ))` at `Y = 1, 2·1`; `E₄(τ/2)` | `a(T₀) = 1`; period-1 jump at `i` is `−21.836` | Pass |
| 2.3 | `ψ₄(τ/2) ∈ M₄(Γ₂(2))` | invariant only under `τ + 2S`; `e(½) = −1` at `(1, 0, 0)` | R04 |
| 2.4 `koecher` | `(1, 1, 0)`; `g = 1`, `j` | `4nm − r² = −1` ⇒ `0`; `j` excluded by `2 ≤ g` | Pass |
| 2.6 `isSingular_iff` | `(g, k) = (1, 0)`; `(9, 4)` `θ_{E₈}`; `(2, 10)` `χ₁₀` | `0 < 1`; `8 < 9`; `a(1,1,1) = 1` and `20 < 2` false | Pass |
| 4.1 odd `k` | `g = 2`, `k = 5`: `(0, 1₂)`, `(0, diag(−1, 1))` | `det^{−5} = 1`, `−1` | Pass |
| 4.2 Maass–Cohen | `ψ₄` at 6 `T`; `ψ₆` at 4; `H(3, ·)`, `H(2, 1)` | `240, 13440, 30240, 240, 138240, 181440`; `44352, 166320, −504, 2128896`; `−1/252, 0, 0, −2/9, −1/2`; `−1/12` | Pass |
| 6.1 `chi10`, `chi12` | 11 + 8 coefficients via products of `ψ_k` | `1, −2, −16, 36, 99, −272, 240, −240, 32, 2736, −43920`; `1, 10, −88, −132, 1275, 736, 2784, 17600`, all as stated | Pass |
| 6.3 `igusa_even`, `igusa_odd`, `finrank_eq_igusaDim` | `k = 0, …, 24`; odd `k < 35` (ℕ subtraction gives `0`) | `1,0,1,1,1,2,3,2,4,4,5,6,8`; `M₃₅ = 1`, `M₃₇ = 0`, `M₃₉ = 1`; constant `P` with `χ₃₅P = 0` forces `P = 0` | Pass |
| 6.4 `tsushimaDim` | van der Geer §25 | `161/161`; `(35,0) → 1`, `(24,0) → 5`, `(30,0) → 8`, `(45,0) → 2`; reading `m` as `j` at `(8,6)` gives `2` | Pass |
| 6.4 `satohDim`, bracket | `k = 10, …, 22`; `k = 28`; `[ψ₄, ψ₆]` | `1,0,2,3,3,4,7`; `12`; `144` and `−3456 = 144·τ(2)` | Pass |
| 6.5 `finrank_gammaTwo_*` | `(3, 2)`, `(5, 0)`, `(4, 2)` | `0`, `1`, `15` | Pass |
| 6.9 Tsuyumine, Poor–Yuen 2007 | expand `N/D`; §13 | `1,1,1,2,4,3,7,8,11`; `0,0,0,1,1,2,3,7` at `k = 2, …, 16` (even) | Pass (locator: R11) |
| 7.1 coset counts | `p = 2, 3` | `151`, `1201` `= p(p+1)(p²+1)² + 1`; `deg T(p)²` identity holds | Pass |
| 7.3 Check | cubic `χ` mod 7, `χ(3) = ω` | `χ(2) = ω²`; `T₂* = ωT₂`; `a(2) = c₁ − 24c₀ = −72.714 + 32.662i = (−377 + 264ω)/7` with `c₀ = L(−3, χ)/2` | Pass (wording: R05) |
| 7.4 Satake | `ψ₄`, `p = 2`; `τ₁`-image | `(1, 8, 4)`: `λ = 45`, `α₀²α₁α₂ = 2⁵`; `(8, 1/8, 4)`: `45` | Pass |
| 7.5 `coeffTriple_heckeT` | `χ₁₀`, `p = 2`, `T = (1,1,1)`, `(1,0,1)` | `240 = 240·1`; `32 + 2⁸·a(2,2,1) = 32 − 512 = −480 = 240·(−2)` | Pass (text: R06) |
| 7.6 | `E_{2,1,12}(Δ)`, `p = 2` | `α₀²α₁α₂ = 2²¹`; `λ = −24600`; `r = 0` gives `(1, p^{k−1}, p^{k−2})` | Pass (locator: R07) |
| 8.1 degree-two `Q_p` | `χ₁₀`, `p = 2` | `Q₂ = 1 − 240X − 143360X² − …`; `λ(4) = 135424 = 200960 − 2¹⁶` | Pass |
| 8.2 half-planes | `ψ₆`; `E_{2,1,12}(Δ)`; `χ₁₀` | `>10`, `>6`; `>33/2`, `>11`; `>10`, `>3/2` | Pass |
| 8.3 Saito–Kurokawa poles | `k − 1`, `k` | pole of `ζ(s−k+2)` cancelled by the central zero (root number `−1`); `L(k, f) ≠ 0` since `k > k − 1/2` | Pass (order: R08) |
| 8.5 Check | `χ₁₀`, `p = 2` | `α₁ + α₂ = −33/16`, `α₁α₂ = 2`, `b_st(2) = −67/32` | Pass |
| 9.4 `IsMaassForm` | `ψ_k` at `(0, 0, m)`; `χ₁₀` at `(2,2,2)`, `(1,2,4)` | `−(2k/B_k)σ_{k−1}(m)` on both sides; `240 = −272 + 512`; `−272` | Pass |
| `saito_kurokawa` | `χ₁₀` at `p = 2, 3`; `χ₁₂` at `p = 2`; wrong `p^{k−3}` | `240`, `21960`, `2784`; `112` | Pass |
| `finrank_maassSubmodule*` | `k = 4, 6, 20` | `1, 1, 3` and `0, 0, 2` | Pass |
| 9.8 parity | `n = r = 1`, `k = 10` | Ikeda's `n + r ≡ k` admits `F₁₂`; van der Geer's "`k − n` even" excludes it | Pass (source issue) |
| `ibukiyamaDim` | `p = 2, 3, 5, 13`; `5 ≤ k ≤ 40`, `p < 100` | the README's columns; 0 non-integral or negative values | Pass |
| `finrank_cusp_paramodular_four` | `p = 5, …, 67` | `0,1,1,2,2,3,3,4,6,8,7,9,8,10,11,16,17`, equal to Poor–Yuen Table 1 | Pass |
| 10.5–10.6 curve `277.a.277.1` | point counts | `a_p` agree at 11 primes; `L₂, L₃, L₅` equal `Q₂, Q₃, Q₅`; `disc(4f + h²) = 2¹²·277` | Pass |
| `finrank_cusp_277` | Poor–Yuen Theorem 1.3 | `10 + 1 = 11` | Pass |
| `eigenvalue_isIntegral`, coefficient field | `k = 0` (excluded); `k = 2, 3`; `χ₁₀` | `15/8`; `M₂ = M₃ = 0`; `240`, `21960`, `1317900` | Pass |
| `exists_eigenform_basis` | `ψ₄`, `e = 5` against `6` | `45` against `90`; the rescaling is real and positive | Pass |
| `siegelTheta_symJ_smul` | `L = 2ℤ²`, `g = 2`, `τ = i·1₂`; `g = 0` | `1.0000279 = 16.000446/16`; `1 = 1` | Pass |
| `fourierCoeff_siegelTheta` | `E₈`, `g = 2` | `r(1, 1, 1) = 13440 = a(ψ₄)` | Pass |
| 11.1 levels | `Γ₂(2) ≤ K(4)`? | no: the `(4, 1)` entry needs `4` | Pass |

## Not verifiable

- **Paywalled, waived, uncertified or uncached texts:**
  - Tsushima 1983 and Ibukiyama 1985: the cache holds only a blocked-page stub. I tested the formulas against van der Geer's table and Poor–Yuen's Table 1 instead.
  - Satoh 1986, Arakawa 1983, Weissauer 2009 and Mizumoto 1991: uncertified. The manifest records unrelated titles for `satoh1986`, `arakawa1983` and `mizumoto1991`; the manifest lies outside this folder.
  - Tsuyumine 1986 and Klingen 1990: waived.
  - Not in the cache: Freitag 1983 (Hilfssatz I.5.1, Koecher for arithmetic `Γ`), Andrianov 1974, Andrianov–Kalinin, Böcherer 1985/1989, Igusa 1962/1964/1967/1981, Ibukiyama 1991/2007/2012, Aoki–Ibukiyama 2005, Maass, Cohen, Gritsenko, Ikeda 2001, Kohnen 2002, Roberts–Schmidt, Brumer–Kramer, Heim 2012, Miyawaki 1992.
- **LMFDB:** knowls and table columns were not fetched.
- **Build at `2fd255d`:** not run (R02).

## Source issues

- **Misprint** in vdg at Definition 4.1, p. 10: the source says a half-integral matrix lies in `GL(g, ℚ)`; it should be any symmetric rational matrix, as its expansions and `Φ` use singular ones such as `0`; affects nothing.
- **Misprint** in vdg at §8, p. 18: the source says `χ₁₀`'s `z²`-term is `E₁₀(τ₁) ⊗ E₁₀(τ₂)`; it should be `Δ(τ₁) ⊗ Δ(τ₂)`, as its own p. 19 states; affects nothing.
- **Error** in vdg at §8, p. 18: the source says `E₁₂ − E₆²` is a cusp form of weight 12; it should be `441E₄³ + 250E₆² − 691E₁₂`, since `Φ(E₁₂ − E₆²)` has `q`-coefficient `65520/691 + 1008`; affects nothing.
- **Error** in vdg at Conjecture 21.3, p. 40: the source says `k − n` even, the lift is in `S_{k+n}(Γ_{2n})`, factor `Z_g`; it should be `k ≡ n + r mod 2`, the lift in `S_{k+n+r}(Γ_{2n+2r})`, and the standard `D_g`; affects nothing.
