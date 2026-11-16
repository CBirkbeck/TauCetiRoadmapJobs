# FIX-PKG-MotivesAndAlgebraicCyclesPartII~8

The three findings of `REV-PKG-MotivesAndAlgebraicCyclesPartII~7`, each settled on the mathematics.

## REV-PKG-MotivesAndAlgebraicCyclesPartII~7/F01 (P2) — applied

**What changed.** In §2.7(a), "an étale morphism of schemes … induces an étale map" now reads "a quasi-compact étale morphism `g : Z′ → Z` … induces an étale map `Z′^arc → Z^arc`; without quasi-compactness the induced map is still finitary, but its geometric fibres are disjoint unions of possibly infinitely many copies of `Marc(C)`". The route, a new Check, the *Needs* line, the Layer 2 *Dependencies* and the Mathlib contract are updated to match.

**Verified.** Scholze line 2193 (Prop. 9.5, p. 52) defines étale maps as finitary maps with finite geometric fibres, and README §2.7 uses the same definition. Mathlib `AlgebraicGeometry.Etale` (Morphisms/Etale.lean, l. 36–40) is tested on affine opens only. So `⨿_ℕ Spec A → Spec A` is étale, and its geometric fibre `⨿_ℕ Marc(C)` is infinite. Mathlib `AlgebraicGeometry.QuasiCompact` is at Morphisms/QuasiCompact.lean l. 41.

**Details of the repair.**

- **Variable renamed.** The étale morphism is written `g : Z′ → Z`, not `Y′ → Y`. In (a), `Y` already names the smooth `A`-scheme, and reusing it would have restricted the clause to smooth targets.
- **Route.** "over a geometric point `C` a finite étale `C`-algebra is a finite product of copies of `C`" became "the fibre `Z′ ×_Z Spec C` is a quasi-compact étale `C`-scheme, hence a finite disjoint union of copies of `Spec C`, whose arc-stack is the corresponding finite disjoint union of copies of `Marc(C)`". The route also adds: "its charts `V → 𝔸ⁿ_A` are morphisms of affine schemes, hence quasi-compact, so the étale clause applies to them".
- **New Check.** The witness `⨿_ℕ Spec A` is now a Check. Its arc-stack is finitary, being a colimit of identities in the slice (§1.4), but it is not étale. Its free motive `⊕_ℕ ℤ` still exists by case 3. The degenerate case `A = 0` is étale.

**Same pattern elsewhere.** I searched the whole README for étale maps assumed to have finite fibres. Two more places needed attention:

- **§2.7(b).** Its hypothesis allows an étale morphism to affine space with infinite fibres. For example, `log(1 + T)` on the open unit disc over `ℂ_p` has derivative `(1 + T)⁻¹`, a unit, and the fibre over `0` is `{ζ − 1 : ζ ∈ μ_{p^∞}}`. The conclusion ("smooth without boundary") stays true, but only after shrinking the cover. The route now says: "refine the cover so that each member maps finite étale onto an open subset of `A^n_K`". The same Check records this example.
- **Tau Ceti contract for `AlgebraicGeometry.Smooth.exists_etale_affineSpace`.** The chart target was written `𝔸(Fin n; S)`. It is `𝔸(ULift (Fin n); S)` at the pin (EtaleCoordinates.lean l. 98–101, confirmed by `#check`), and the bullet now says so.

§8.5 already restricts étale maps to "finitary maps with finite geometric fibres". §§9.1, 9.5 and 10.6 use only "smooth without boundary". Neither needed a change.

## REV-PKG-MotivesAndAlgebraicCyclesPartII~7/F02 (P3) — applied

**What changed.** README "From TauCetiRoadmap.KTheoryFiniteLocalFields": "§1.5 (`perfect_positiveK_uniqueDivisible`: …)" became "§1.5 (for every perfect commutative `𝔽_p`-algebra `A` and `n ≥ 1`, multiplication by `p` on `K_n(A)` is an automorphism; `K₀` is excluded)". In the §7.7 *Needs* line, the name became "(unique `p`-divisibility of the positive K-groups of perfect `𝔽_p`-algebras)".

**Verified.** KTheoryFiniteLocalFields is an open new-roadmap pull request (head `0bca594`) and comes earlier in the merge order. `roadmaps grep --fixed perfect_positiveK_uniqueDivisible` finds no match on main or at any open head. The head's §1.5 states the fact in prose ("For every perfect commutative 𝔽p-algebra A prove that multiplication by p on Kₙ(A), n≥1, is an automorphism"), and its Checks exclude `K₀`. §7.7 uses exactly this fact to get `K(k)^∧_p ≃ ℤ_p`. No other occurrence remains: `grep perfect_positiveK` on the README and `design/plan.json` returns nothing.

## REV-PKG-MotivesAndAlgebraicCyclesPartII~7/F03 (P3) — applied

**What changed.** The Mathlib contract said "Mathlib at the pin has no projective-space scheme, so §0.8 glues `ℙⁿ` from affine charts". It now says "The scheme `ℙⁿ_ℤ` of §0.8 is the projective spectrum `AlgebraicGeometry.Proj` … of the symmetric algebra of `ℤ^{n+1}` with the grading Tau Ceti gives it". "From Tau Ceti" gains three bullets, for `projToSpec`, `projectiveLine` and `puncturedAffineSpace`. The §0.8 text, its *Needs* line and the Layer 0 *Dependencies* name them.

**Verified at the pins** (`lake env lean` on a scratch file of `#check`s):

- **Mathlib.** `AlgebraicGeometry.Proj` (ProjectiveSpectrum/Scheme.lean l. 855).
- **Tau Ceti, built modules.**
  - `TauCeti.SymmetricAlgebra.projToSpec (R M : Type u)`, together with `homogeneousSubmodule` and `instIsProperProjToSpec [Module.Finite R M]`.
  - `TauCeti.AlgebraicGeometry.projectiveLine` = `Proj (homogeneousSubmodule R (Fin 2 → R))`, with `projectiveLine.polynomialChartι` and `range_polynomialChartι_union_range_polynomialChartι`.
- **Tau Ceti, read in source.** The module of `TauCeti.puncturedAffineSpace` and `TauCeti.PuncturedAffineSpace.homEquiv` has no object file at the pin. I read them in the source: namespaces at l. 54/82/243, definition l. 76, `homEquiv` l. 208.

**Details of the repair.** The suggested sentence is used, with "in the form Tau Ceti provides" replaced by an exact pointer to the grading declaration. The §0.8 definition sentence now names its carriers: `ℙⁿ_ℤ = Proj(Sym ℤ^{n+1})`, the punctured plane, `GL_{n,ℤ} = Spec ℤ[x_{ij}, det⁻¹]`.

**Other occurrences of the claim.** None. `grep -n "glue\|projective-space"` finds only the doubled-origin Check of §0.8, which is about a different object.

## Checks run

- **`lake env lean packages/MotivesAndAlgebraicCyclesPartII/Suggested.lean`**, run from the content checkout: exit 0, no output. `Suggested.lean` is unchanged: one `import Mathlib`, the module docstring and an empty namespace. No headline became statable, because the new carriers are schemes, not motivic categories.
- **Binder audit (`#check @name`).** `Suggested.lean` declares nothing, so there is nothing to compare and nothing changed. I ran the same mechanical check on every Lean name newly cited in the README: `AlgebraicGeometry.Proj`, `AlgebraicGeometry.QuasiCompact`, `AlgebraicGeometry.Etale`, `TauCeti.SymmetricAlgebra.projToSpec`, `TauCeti.SymmetricAlgebra.homogeneousSubmodule`, `TauCeti.SymmetricAlgebra.instIsProperProjToSpec`, `TauCeti.AlgebraicGeometry.projectiveLine`, `TauCeti.AlgebraicGeometry.projectiveLine.polynomialChartι`, `TauCeti.AlgebraicGeometry.projectiveLine.range_polynomialChartι_union_range_polynomialChartι` and `AlgebraicGeometry.Smooth.exists_etale_affineSpace`. Each elaborated with the hypotheses the README states:
  - `projToSpec` needs `R` and `M` in one universe;
  - properness needs `Module.Finite`;
  - the étale charts are `AffineSpace (ULift (Fin n)) S`, so the contract bullet was corrected.
- **`roadmaps resolve`** on the README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None." In this run the tool also printed "Lean names outside TauCetiRoadmap were not checked: no pinned Lake packages on this host". The pinned Mathlib and Tau Ceti names added in this round were therefore checked by the `#check` file above instead.
- **Dependency check:**

```text
depcheck: 246 roadmaps, 2258 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

- **Unchanged files.** `design/plan.json`, `sources.toml` and `metadata.toml` were not changed. No new supplier gap and no new source were needed. Every cited source is already in the manifest, and nothing was added to `needs-references.toml`.

## Adversarial pass (new and changed statements)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §2.7(a) quasi-compact étale `Z′ → Z` gives an étale arc map | `⨿_ℕ Spec A`, `A ≠ 0`; `A = 0`; identity; `D(f) ⊂ Spec A`; `Spec ℂ → Spec ℝ`; doubled-origin line `→ A¹` | not qc, fibre `⨿_ℕ Marc(C)` (excluded); `∅ → ∅`, étale; 1 copy; 1 or 0 copies (0 = empty union); `ℂ ⊗_ℝ ℂ = ℂ × ℂ`, 2 copies; qc, non-separated, fibres of 2 or 1 points | Holds with qc; qc alone suffices, separatedness not needed |
| §2.7(a) "without qc: finitary, possibly infinite fibres" | `⨿_ℕ Spec A` | `Y(B)` for strict `B` = locally constant `M(B) → ℕ`; `M(colim B_i) = lim M(B_i)` profinite, so locally constant maps = colimit; finitary by §1.4 colimit stability | Holds |
| §2.7 route: fibre over `C` | qc étale over algebraically closed `C` | étale over a field = disjoint union of `Spec` of finite separable extensions = copies of `Spec C`; qc ⇒ finitely many | Holds |
| §2.7 route: charts quasi-compact | `V` affine, `𝔸(ULift (Fin n); Spec A) = Spec A[x]` affine | qc source, quasi-separated target ⇒ qc morphism | Holds |
| §2.7(b) refinement; `log(1 + T)` | open disc over `ℂ_p`, `p = 2, 3` | `|1 + T| = 1` on `|T| < 1`, so derivative a unit; zeros `ζ_{p^k} − 1` with `|ζ_{p^k} − 1| = p^{−1/(p^{k−1}(p−1))} < 1`; `p = 2`: `ζ = −1` gives `|−2| = 1/2` | Infinite fibre confirmed; refinement needed and stated |
| New Check: free motive `⊕_ℕ ℤ` | case 3 with `Y_i = Marc(A)` over `X = Marc(A)` | `ℤmot[X/X] = ℤ` (degenerate Check of §2.7), coproduct `⊕_ℕ ℤ` | Holds |
| F02 restated supplier fact | `𝔽₄`, `K₁ = ℤ/3`; `𝔽_p`, `K₀ = ℤ`; zero algebra; §7.7 use | ×2 invertible on `ℤ/3`; ×p not onto `ℤ` (excluded); all groups zero; `K(k;ℤ/p) = ℤ/p[0]`, so `K(k)^∧_p = ℤ_p` | Agrees with §1.5 at the head |
| F03 `ℙⁿ_ℤ = Proj(Sym ℤ^{n+1})` | `n = 0, 1`; properness | `Proj ℤ[x₀] = Spec ℤ` matches one degree-0 polydisc `= X` in the §0.8 API; `n = 1` is `projectiveLine ℤ` with 2 charts, as in the `ℙ¹_X` Check of §2.7; `ℤ^{n+1}` is finite, so proper | Holds; the coordinate convention (M = linear forms) gives `ℙⁿ` either way for free `M` |
| F03 punctured plane | `B` strict; `ι = Fin 2` | `B`-points = pairs generating `B` = at every point of `M(B)` not both zero, the open locus of §0.8 | Holds |

## Ownership

The new contract lines cite pinned Tau Ceti and Mathlib declarations and add no target. Ownership is unchanged from round 7: this roadmap owns the Banach arc-site and the arc-stacks of schemes, and no other roadmap plans them. A `roadmaps grep` for "arc-stack" and "Marc(" over main and the open heads still finds no other owner.

## For the maintainer

- **Renamed citation.** This roadmap no longer cites the name `perfect_positiveK_uniqueDivisible`; it cites KTheoryFiniteLocalFields §1.5 by section. If that roadmap later declares such a name, nothing here needs to change.
- **No other roadmap affected.** No name or section id defined by this roadmap changed, so no other roadmap's citation breaks.
- **No suspicious text.** No passage in the review asked for anything outside this job.
