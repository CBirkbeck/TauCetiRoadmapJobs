# FIX-PKG-SurfaceGroupCharacterVarieties~3

Findings of `REV-PKG-SurfaceGroupCharacterVarieties~2` (review of 04addf5), each settled on the
mathematics. Files changed: `packages/SurfaceGroupCharacterVarieties/README.md` and
`packages/SurfaceGroupCharacterVarieties/sources.toml`. `Suggested.lean`, `metadata.toml` and
`design/plan.json` are unchanged: none of the four findings touches a statement of
`Suggested.lean` (§§3.4, 5.4 (v) and 7.3 are README targets only), and no new supplier gap is needed.

## REV-PKG-SurfaceGroupCharacterVarieties~2/F01 (P3) — applied

Verified: `TauCeti.reductiveCommHopfAlgProperty.of_injective` (`Algebra/AlgebraicGroup/Reductive/Image.lean`
line 44, `[CharZero k]`); ReductiveGroups Layer 3 on main has images and identity components.

Change: §7.3 sketch "By §6.7 (c), the image … is reductive" → "`φ(Z)` closed (ReductiveGroups Layer 3);
`φ(Z⁰)` its identity component, reductive by `of_injective`". `of_injective` added to the Tau Ceti
contract, Layer 3 images to the ReductiveGroups contract, both to §7.3 *Needs:* and Layer 7
Dependencies.

## REV-PKG-SurfaceGroupCharacterVarieties~2/F02 (P3) — applied

Verified: `TopCat.singularCup_naturality` (`AlgebraicTopology/Cohomology/Cup.lean` line 223),
`TopCat.singularCap_naturality` (`AlgebraicTopology/Cohomology/Cap/Basic.lean` line 124). Pattern: the
final step `⟨(f⁻¹)^*(a ∪ b), [Σ]⟩ = ⟨a ∪ b, (f⁻¹)_*[Σ]⟩` also needs `TopCat.singularKronecker_naturality`
(`Kronecker.lean` line 89).

Change: new "Singular cohomology" paragraph in the Tau Ceti contract (these three, plus
`TopCat.integralCup_naturality`). §3.4's sketch cites them where they are used: naturality, then the
projection formula for `(f⁻¹)^* a`, then the final equality. Also added to §3.4 *Needs:* and Layer 3
Dependencies.

## REV-PKG-SurfaceGroupCharacterVarieties~2/F03 (P3) — applied

Verified: §§6.2–6.3 use no finite generation; Sikora2012 line 268 holds for every subgroup. Every
clause was recomputed for arbitrary groups (table below).

Change: §7.3 "for finitely generated `Γ`, `Γ'` … `𝒳(Γ, G^ℝ)`" → "for every group … `CharacterVariety Γ G^ℝ`",
and `𝒳` for finitely generated groups. Sketch: route through §§6.2–6.3, plus the closed-embedding
argument. New Check: `F_∞`, `ℝ^×`, squaring and diagonal. *Needs:* §6.7 → §§6.1–6.3. Layer 7 scope
bullet updated.

## REV-PKG-SurfaceGroupCharacterVarieties~2/F04 (P3) — applied

Verified: BohmLafuente2021 line 425 (`T = exp(𝔱)`, `𝔱 ⊂ Sym(V)` abelian) and Corollary 5.5, lines
445–447, for that `T`; §4's setting at lines 260–261 is the same.

Change: (v) "for a maximal abelian `𝔱 ⊆ 𝔭`" → "for every abelian subspace `𝔱` of `Sym(V)`; used for
maximal abelian `𝔱 ⊆ 𝔭`". New Check: `ℝ·diag(1,−1)`, the branches of `xy = 1`. Pattern: the sketch's
"monomial invariants" contradicted that Check, so it now names the sign-supported monomials (Lemma 4.6,
line 364). `sources.toml` locator updated.

## Checks

- **Elaboration.** `lake env lean packages/SurfaceGroupCharacterVarieties/Suggested.lean` from the
  content repository: exit 0, 13 warnings, all "declaration uses `sorry`" (lines 95, 113, 123,
  144, 203, 211, 219, 229, 239, 273, 323, 338, 360), no error. The file is unchanged.
- **Signatures.** A scratch copy of `Suggested.lean` with `#check @name` for all 24 named declarations
  and for the six library names this round cites (`TopCat.singularCup_naturality`,
  `TopCat.integralCup_naturality`, `TopCat.singularCap_naturality`,
  `TopCat.singularKronecker_naturality`, `TauCeti.reductiveCommHopfAlgProperty.of_injective`,
  `Subgroup.fg_of_index_ne_zero`) was elaborated once: exit 0, no error. Each elaborated type agrees
  with its README statement; nothing changed. The four flagged "dropped binders" are
  `[FiniteDimensional ℝ V]` on the Layer 5 definitions `symmetricPart`,
  `IsRealReductiveLinearGroup`, `minimalVectors`, `linearOrbit`. Their bodies do not use it, and
  all five Layer 5 theorems carry it in their elaborated types. The object file of
  `TauCeti.Algebra.AlgebraicGroup.Reductive.Image` was missing, so it was built first with
  `lake build TauCeti.Algebra.AlgebraicGroup.Reductive.Image` (completed; `Suggested.lean` does not
  import it).
- **Dependency check** (output, verbatim): `depcheck: 239 roadmaps, 2263 edges, 0 problem(s)`. No
  UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found
  nowhere. The four Lean-name leads of the worker's list (`StandardSurface.*`,
  `Surface.IsOrientable`) are TeichmullerGeometry declarations that its `Suggested.lean` states. They
  are not pinned names and are not touched here.
- **Ownership.** No new object or target is introduced. The added inputs are pinned Tau Ceti
  declarations and ReductiveGroups Layer 3 on main, both already suppliers. §7.3's functoriality was
  already owned here; the search by object done in the review round (character varieties with their
  topology in no other roadmap, open or on main) stands, and this round adds nothing that another
  roadmap could own.
- No source text was missing; `needs-references.toml` was not written.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §3.4 sign via projection formula | contravariance of `(f⁻¹)^*` | `f^*((f⁻¹)^* a) = (f⁻¹ ∘ f)^* a = a`, so `f_*(a ∩ [Σ]) = f_*[Σ] ∩ (f⁻¹)^* a = ε_f (f⁻¹)^* a ∩ [Σ]` | holds | none |
| §3.4 `î(f_*u, f_*v) = ε_f î(u, v)` | torus `diag(1,−1)`; shear `[[1,0],[1,1]]`; identity | `ε = det = −1`, `î(e₁, −e₂) = −1`; `ε = 1`, `î(e₁+e₂, e₂) = 1`; `ε = 1` | holds | Kronecker naturality named |
| §5.4 (v), every abelian `𝔱 ⊂ Sym(V)` | `𝔱 = 0`; `ℝ·diag(1,−1)` on `ℝ²`; `ℝ·1` on `ℝ` | Urysohn on the metric `V`; `f = 0` on `{xy=1, x>0}`, `1` on `{xy=1, x<0}`, `1/2` on the axes, both formulas `→ 1/2` as `xy → 0`; invariant closed sets `∅, {0}, [0,∞), (−∞,0], ℝ`, no two nonempty disjoint | holds | Check added |
| §5.4 sketch, separating functions | the branches above | every polynomial invariant is a function of `xy`, equal to `1` on both; sign-supported `(xy)^{1/2}` on the open first quadrant is `1` and `0` | "monomial invariants" alone insufficient | wording made exact |
| §7.3 postcomposition | `SO(2) ⊆ SL₂(ℝ)`, `ρ(1)` rotation of infinite order; `φ` trivial; `Sym² : SL₂ → SL₃`, `diag(2,1/2)`; squaring on `GL₁`, `F_∞` | closure `𝔾_m`, image a torus of `SL₂`; constant map, trivial image reductive; `diag(4,1,1/4)` semisimple; `(x_i) ↦ (x_i²)` continuous on `(ℝ^×)^ℕ` | holds for every group | restated |
| §7.3 surjection | `ℤ ↠ ℤ/2` in `SL₂(ℝ)`; `ℤ ↠ 1`; identity; `F_∞ ↠ ℤ` | `g² = 1` with `det g = 1` semisimple gives `g = ±1`, two closed points; trivial class, closed point; identity; diagonal `ℝ^× ⊂ (ℝ^×)^ℕ`, closed, inverse the first coordinate | closed embedding | restated, argument added |
| §7.3 finite index | `2ℤ ≤ ℤ`, `ρ(1)` rotation by `π/2`; index one; `⟨a⟩ ≤ F₂` | closure of `ρ(ℤ)` cyclic of order 4, `Z' = {±1}`, `Z⁰ = Z'⁰ = 1`; identity; infinite index, unipotent restriction not reductive | finite index needed, finite generation not | restated |
| §7.3 closed embedding over a general topological field | `k` with a non-T1 topology | `{ρ' : ρ'(n) = 1}` need not be closed | true for real data only | statement kept on real reductive data |
| Scope bullet, Layer 7 | §7.4's `exists_outAction_characterVariety` (every `Γ`) and new §7.3 | both for every group | agrees | reworded |

## For the maintainer

- No name that other roadmaps cite changed: no Lean declaration was added, renamed or removed, and no
  section, layer or target id moved. §7.3 now uses the backticked `CharacterVariety`, already
  declared in `Suggested.lean`.
- New supplier citations, all already-accepted suppliers: Tau Ceti `TopCat.singularCup_naturality`,
  `TopCat.integralCup_naturality`, `TopCat.singularCap_naturality`,
  `TopCat.singularKronecker_naturality`, `TauCeti.reductiveCommHopfAlgProperty.of_injective`;
  ReductiveGroups Layer 3 (images), on main.
- The review's "For the human reviewers" items (`Out⁺(Π)` ownership against TeichmullerGeometry,
  the shared `gap:adjoint-kernel` with AdmissiblePairsAndPadicHodgeStructures, the BohmLafuente2021
  version, the waived and uncertified sources) are for humans and are not acted on here.
- No suspicious instructions were found in the review text.
