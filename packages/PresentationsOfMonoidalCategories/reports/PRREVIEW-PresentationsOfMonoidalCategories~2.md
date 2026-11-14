# Review of PresentationsOfMonoidalCategories (pull request #2308 at 48aa9d7)

**Verdict:** needs changes

## R01 (P2) — The extraction theorem is statable at the pins but absent

**Location:** `TauCetiRoadmap/PresentationsOfMonoidalCategories/Suggested.lean` lines 17–21: "Not stated here, because they are about the constructed category `FSymbols.Model P` … extraction and reconstruction (Layer 2)".

**Claim:** No Layer 1–6 headline is statable without `Model P`.

**Witness:** README lines 223–227 (extraction: "the `F` they define is an `FSymbols R N`") name only `C`, `S`, a fusion basis and `FSymbols`. The statement below elaborates on a scratch copy at the pins (`sorry` the only warning).

**Repair:** Add to `Suggested.lean`, under `/-! ## Layer 2: extraction and reconstruction -/`, and take "extraction" out of the docstring's not-stated list:

```lean
/-- **Extraction.** In a monoidal `R`-linear category with a split simple basis `S`, a fusion
basis `φ`, normalized through `e : 𝟙_ C ≅ S N.unit`, defines exactly one `FSymbols R N`: the
matrices expressing the left family in the right family across the associator. -/
theorem IsSplitSimpleBasis.existsUnique_fSymbols {R : Type v} [CommRing R] {C : Type u}
    [Category.{w} C] [Preadditive C] [Linear R C] [HasFiniteBiproducts C] [MonoidalCategory C]
    [MonoidalPreadditive C] [MonoidalLinear R C] {ι : Type*} [Fintype ι] [DecidableEq ι]
    {S : ι → C} (_h : IsSplitSimpleBasis R S) (N : FusionRules ι) (e : 𝟙_ C ≅ S N.unit)
    (φ : ∀ a b c, Module.Basis (Fin (N.N a b c)) R (S a ⊗ S b ⟶ S c))
    (_hl : ∀ a, φ N.unit a a (N.unitLeft a) = (e.inv ▷ S a) ≫ (λ_ (S a)).hom)
    (_hr : ∀ a, φ a N.unit a (N.unitRight a) = (S a ◁ e.inv) ≫ (ρ_ (S a)).hom) :
    ∃! P : FSymbols R N, ∀ (a b c d : ι) (x : N.Left a b c d),
      (φ a b x.1 x.2.1 ▷ S c) ≫ φ x.1 c d x.2.2 =
        ∑ y : N.Right a b c d, P.F a b c d x y •
          ((α_ (S a) (S b) (S c)).hom ≫ (S a ◁ φ b c y.1 y.2.1) ≫ φ a y.1 d y.2.2) := sorry
```

State the braided converse of Layer 4 (`RSymbols` of the extracted `P`) in the same form.

## R02 (P3) — The gate fails on `target-ids`; the layers have no subsections

**Location:** `TauCetiRoadmap/PresentationsOfMonoidalCategories/README.md` line 153, `## Layer 0: the data`, and every later layer; line 3 (opening paragraph); line 361.

**Claim:** The README has the roadmap shape.

**Witness:** Gate at 48aa9d7: `target-ids=1 FAIL`, "line 153: layered README states no targets (`### k.n` subsections or bold target names)". No layer has `### Examples` or `### Dependencies`; there is no `**Summary.**` and no `## Downstream consumers`.

**Repair:** Give each layer `### k.n <topic>` subsections, one per target group (for Layer 2: `### 2.1 Split simple bases`, `### 2.2 Extraction`, `### 2.3 Reconstruction and round trip`, `### 2.4 Comparison with the abelian definitions`), each with its own `*Needs:*`; end each layer with `### Examples` (the present Checks' worked instances) and `### Dependencies` (the present layer-level `*Needs:*` line). Open with `**Summary.**`. Add `## Downstream consumers`: OcneanuRigidity, Layers 1, 6, 7 and 8 (`FSymbols`, `RSymbols`, `map`, `Model`, the gauge group, the Layer 5 criterion).

## R03 (P3) — Padding in `Suggested.lean`

**Location:** `Suggested.lean` line 95 `FSymbols.sum_N_mul_N`, line 141 `RSymbols.N_comm`, line 159 `IsSplitSimpleBasis.N`.

**Claim:** These are headline statements or definitions a headline needs.

**Witness:** On a scratch copy both theorems close with `by simpa using Matrix.square_of_invertible _ _ (…_mul_…) (…_mul_…)` (`Mathlib/LinearAlgebra/Matrix/InvariantBasisNumber.lean:92`). `IsSplitSimpleBasis.N` is `Module.finrank` renamed, with `_h` unused, and no statement mentions it.

**Repair:** Delete the three from `Suggested.lean`; README lines 164–166 and 225 keep the statements.

## R04 (P3) — The round trip omits the hypothesis that `R` is nontrivial

**Location:** README line 230: "**Round trip:** extracting from `Model P` with its standard basis returns `P`."

**Claim:** This holds over every commutative ring.

**Witness:** `R = 0`, `ι = {u}`: `Module.finrank 0 (simple u ⊗ simple u ⟶ simple u) = 0`, while `N_{uu}^u = 1`. Lines 199, 257 and 269 carry the hypothesis; this one does not.

**Repair:** "**Round trip:** for nontrivial `R`, extracting from `Model P` with its standard basis returns `P`." State the same hypothesis at line 225: "For nontrivial `R`, put `N_{ab}^c = Module.finrank R (S a ⊗ S b ⟶ S c)`."

## R05 (P3) — A Check announces its own formalisation

**Location:** README lines 99–100: "These fix the duality conventions, and are to be formalised as `example`s once Layers 5 and 6 exist."

**Claim:** Checks are timeless prose and name no Lean counterpart.

**Witness:** The sentence is a plan of work ("once Layers 5 and 6 exist") and promises `example`s.

**Repair:** Replace by "**Checks.** These fix the duality conventions."

## R06 (P3) — A Check identifies the model with all graded modules

**Location:** README lines 306–307: "the two R-symbols `R^{11}_0 = ±1` give the symmetric categories of `ℤ/2`-graded and super `R`-modules."

**Claim:** `Model P` is the category of graded modules.

**Witness:** Objects of `Model P` are `ι → FintypeCat` (line 186): only graded modules free of finite rank in each degree. Over `ℤ` the graded module `ℤ/2` in degree `0` is not in the model.

**Repair:** "… give the symmetric categories of `ℤ/2`-graded and of super modules over the base ring that are free of finite rank in each degree."

## R07 (P3) — The description names the PivotalSpherical revision for Layer 2 only

**Location:** Pull request description: "This roadmap depends on … #2311, which revises PivotalSpherical to own the ring-level dual-basis results that Layer 2 cites."

**Claim:** That is all this roadmap takes from the revision.

**Witness:** README line 145 and lines 274–279 cite `VecTwisted R G c` over a commutative ring. PivotalSpherical on main, Layer 8, has `Vec^ω_G` over a field `k` only; the ring form is at the revision's head.

**Repair:** "… which revises PivotalSpherical to own the ring-level dual-basis results that Layer 2 cites and the ring-level `Vec^ω_G` (`VecTwisted R G c`) that Layer 3 cites." Also say that the pull request adds `Suggested.lean` with the Layer 0 structures.

## Verified sound

Previous review (at 7e4cf77): R01 partly repaired (the file exists and elaborates; see R01, R03); R02 repaired (lines 199, 257, 269, 283); R03 repaired (line 97 `ExactPairing.tensor`, line 145); R04 repaired (lines 142–144, description); R05 repaired (lines 137, 321); R06 repaired (11 locators); R07 partly repaired (Checks added; see R02).

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Lean `pentagon` against README l. 64–70 and Mathlib `pentagon` | index type of each factor | `F^{pCD}_E`: `l : N_{pr}^E`; `F^{ABr}_E`: `(s,m,n)`; right: `F^{ABC}_q`, `F^{AtD}_E`, `F^{BCD}_s` over `t,x,y,z` | agree | none |
| Lean `hexagon_forward` against `BraidedCategory.hexagon_forward` | each factor's source and target | `Left a b c d → Right`, `R^{af}_d[l,m]`, `Left b c a d → Right b c a d (g,n,o)`; right `Left b a c d → (g,q,o)` | agree | none |
| Lean `hexagon_reverse` | each factor | `Right a b c d → Left`, `R^{ec}_d[j,m]`, `Right c a b d (e,i,m) → Left (g,n,o)`; right `Right a c b d (f,p,l)` | agree | none |
| `triangle` (l. 71–72, Lean l. 83) | `Left a u c d`, `Right a u c d` | only `e = a`, `f = c` nonempty; `(a ◁ e⁻¹) ▷ c ≫ ρ ▷ c = α ≫ a ◁ (e⁻¹ ▷ c ≫ λ)` | `F = 1` on the block | none |
| Normalization at `a = u` (l. 47) | `φ^{uu→u}_0` both ways | `(e⁻¹ ▷ S_u) ≫ λ` and `(S_u ◁ e⁻¹) ≫ ρ` both become `λ_𝟙 ≫ e = ρ_𝟙 ≫ e` after `e ⊗ e` | consistent | none |
| `FSymbols.ext` | uniqueness of the inverse | `Finv_P = Finv_P·F·Finv_Q = Finv_Q`; `simp`, `rfl`, `aesop` do not close it | true, kept | none |
| `sum_N_mul_N`, `N_comm` | one-lemma probe; `R = 0` | `card Left = Σ_e N_{ab}^e N_{ec}^d`, `card Right = Σ_f N_{bc}^f N_{af}^d`; close by `Matrix.square_of_invertible` | true, padding | R03 |
| `ℤ/2` Check (l. 175–178) | hexagon at `a=b=c=1`, `d=1`, `e=g=0` | left `ω·R^{10}_1·ω = 1`; right `(R^{11}_0)² ω`; so `(R^{11}_0)² = ω`; `ω=−1`: none in `ℤ`, `±i` in `ℤ[i]` | holds | none |
| `ℤ/2` duality Check (l. 102–105) | `s_1`, `Ρ^{110}`, `D^{11}_0`, dimensions | `s_1 = ω⁻¹ = ω`; `Ρ^{110} = ω⁻¹·ω⁻¹·1 = 1`; `D^{11}_0 = 1`; `t_1² = 1`; `leftDim = (t_1 ω)⁻¹ = ω t_1 = rightDim` | holds | none |
| Fibonacci, Yang–Lee (l. 107, 287) | `F^{τττ}_τ[(1),(1)]`, conjugation `√5 ↦ −√5` | `s_τ = φ⁻¹ ↦ −φ`; `rightDim = s_τ⁻¹`: `φ` and `−1/φ` | consistent with Layer 6 | none |
| Extraction (l. 223–227) and R01's statement | `R = 0`; nontrivial `R` | `R = 0`: unique `FSymbols`; nontrivial: left family is a basis by completeness, `F` a change of basis | true as restated | R01 |
| Round trip (l. 230) | `R = 0`, `ι = {u}` | `finrank = 0` against `N_{uu}^u = 1` | needs nontrivial `R` | R04 |
| Abelian comparison iff (l. 234–237) | both directions; infinite `ι` | ⇒: a mono `S_a^n → S_a` forces `n ≤ 1`; ⇐: Schur; `IsFiniteSemisimpleCategory` (`Semisimple/Basic.lean:56`) bounds no index | holds | none |
| Classification (l. 257) | `R = 0`; `R = k × k` | `0`: excluded by hypothesis; `k×k`: `End X ≅ R` gives `Σ n_a² = 1` | holds | none |
| Kernel `{(id, ∂η)}` (l. 269, 302) | `ι = ℤ/2`, `F = 1`, `g^{11}_0 = −1` | `(∂η)^{11}_0 = η_1² η_0⁻¹ = 1 ≠ −1`; `∂η` on `R`: `η_aη_bη_c⁻¹ R (η_bη_aη_c⁻¹)⁻¹ = R` | holds | none |
| `Aut_⊗(𝟭)` (l. 263) | `R = 0` | both sides trivial (`0ˣ = 1`) | holds | none |
| `Vec^ω_G` (l. 274–279) | pentagon with `F = ω⁻¹` against `IsThreeCocycle` at the revision head | `ω(h,k,l)ω(g,hk,l)ω(g,h,k) = ω(gh,k,l)ω(g,h,kl)`; fg projective components, free ones a full subcategory | consistent | R07 |
| Rigidity criterion (l. 316–319, 332) | `ε' = xε`, `η' = yψ`; `R = 0` | zigzag `x y s_a = 1`; `0` is a unit of the zero ring | holds | none |
| Spherical (l. 349) against `SphericalCategory` (`Pivotal/Spherical.lean:69`) | traces on a biproduct | `(t_a s_ā)⁻¹ = t_a s_a⁻¹ ⟺ t_a² = s_a/s_ā`; traces are sums over the diagonal | holds | none |
| Twist by `η` (l. 358) | `t ↦ η t` | `leftDim ↦ η_a⁻¹ leftDim`, `rightDim ↦ η_a rightDim` | holds | none |
| Graded-module Check (l. 306) | `ℤ/2` in degree `0` over `ℤ` | not of the form `ι → FintypeCat` | overclaim | R06 |
| `IsSplitSimpleBasis` against PivotalSpherical's split simple families (revision head, Layer 3) | three fields | scalar endomorphisms, `HomOrthogonal S`, `X ≅ ⨁ (S ∘ f)` with `κ` finite; `ι` arbitrary on both sides | same hypotheses | none |

- Source locators checked against the text: 11 of 11 (EGNO2015 lines 1589, 1795, 2086, 4010, 4046, 4087, 4165–4171, printed pages 24, 28, 33, 74, 75, 76, 77; Kitaev2006 lines 3660, 3696, 4507, 4602, 5146, pages 68, 69, 80–81, 89).
- Library declarations opened at the pins: 27, all present (`MonoidalCategory.ofTensorHom` `Monoidal/Category.lean:227`, `BraidedCategory.ofFaithful` `Braided/Basic.lean:209`, `ExactPairing.tensor` `Rigid/Basic.lean:141`, `HomOrthogonal.matrixDecomposition` `HomOrthogonal.lean:75`, `Mat` `Preadditive/Mat.lean:504`, `TauCeti.fusionCoeff` `GrothendieckRing.lean:240`, `SplitK0` `GrothendieckGroup/Split.lean:128`, `leftDim`/`rightDim` `Pivotal/Trace.lean:97–101`, `ExactPairing.biproduct`).
- Cross-roadmap citations resolved: PivotalSpherical on main and at the head of its open revision (Layer 3 dual bases, Layer 8 `VecTwisted R G c`); OcneanuRigidity (open) consumes this roadmap and owns none of its objects.
- Dependency check: `depcheck: 244 roadmaps, 2197 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Gate: fails, `target-ids=1` (R02); every other check 0. Elaboration of `Suggested.lean`: `sorry` the only warning (lines 91, 95, 141).
- `#check @name` for the 13 declarations compared with the README: no binder lost; `FSymbols.map` has a real, proved body and is kept as the test of base change.
- Overlap check: read OcneanuRigidity, PivotalSpherical (main and open revision), CategoricalOperatorAlgebras, TemperleyLieb; dual bases for split simple families and `Vec^ω_G`: owner PivotalSpherical, cited here; `FSymbols`, `RSymbols`, `Model`, gauge: owner this roadmap, cited by OcneanuRigidity.
- Source independence: 16 passages compared with 2 sources, none shared; largest share EGNO2015, 7 of 11 locators; contents compared with EGNO2015 (Chapters 2 and 4): independent.

## Not verifiable

- The Checks on `FDRep ℂ A₄` and Yetter–Drinfeld modules over `S₃` (README lines 246–247, 355–357): the computations are not in the pull request; only `N_{33}^3 = 2` was confirmed.

## Source issues

- none

## For the human reviewers

- **Licence.** EGNO2015 was read from an author's page; each page states it is the author's final version made available with the publisher's permission and that restrictions may apply to redistribution.
