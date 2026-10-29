# Review of ShimuraVarieties (pull request #933 at e7d7bdc)

**Verdict:** accepted

Incremental re-review of the 25 README lines changed since d377db7 (`Suggested.lean` and `metadata.toml` are byte-identical to the head the previous review read). All five previous findings are repaired, the gate passes with the dependency check clean, and the repairs introduced no blocking problem. Two P3 notes remain, both the author's to take or leave.

## R01 (P3) — §3.5a now owns product and fibre-dimension laws for every o-minimal structure, which AffineMorseLefschetz A4.1 already states for the semialgebraic one

**Location.** `TauCetiRoadmap/ShimuraVarieties/README.md` line 802 ("That layer does not state the product, projection and fibre-dimension laws; prove them here for every o-minimal structure of that layer") and line 83 ("Section 3.5a supplies … the product, projection and fibre-dimension laws, which that layer does not state").

**Claim.** The product, projection and fibre-dimension laws of definable dimension are unowned and are proved here for every o-minimal structure.

**Witness.** StratifiedSpacesAndTameTopology (open pull request, new folder) Layer 4 indeed states none of the three (its README lines 299–307 list only independence, bijection invariance, union and frontier), but its ownership table (line 72, fourth row) and §4.9(a) assign the semialgebraic product and fibre-dimension laws to AffineMorseLefschetz A4.1, which is on main: `TauCetiRoadmap/AffineMorseLefschetz/README.md` line 361 ("its independence, finite-union/product/closure and fiber-dimension API"). On `semialgebraicStructure` the general law of §3.5a and A4.1's law are the same statement once `dim_semialgebraic_eq` (StratifiedSpacesAndTameTopology §4.9) identifies the two dimensions.

**Repair.** Keep the general laws here (nothing earlier states them for a general o-minimal structure), but add one clause at line 802 or line 83: on `semialgebraicStructure` they specialize, through StratifiedSpacesAndTameTopology §4.9's `dim_semialgebraic_eq`, to AffineMorseLefschetz A4.1's product and fibre-dimension laws, which are not reproved. Tested on the instance `A = {xy = 0} ⊂ ℝ²` (semialgebraic): both laws give the same values (table below), so the clause is a reconciliation, not a change of statement.

## R02 (P3) — The pull request text no longer matches the README's suppliers

**Location.** The pull request description (data, outside the folder): "It depends on no other author's open pull request" and the `merge-order` block, which lists no StratifiedSpacesAndTameTopology.

**Claim.** None in the folder; the description is stale.

**Witness.** README line 83 and line 974 now import StratifiedSpacesAndTameTopology Layer 4, which is pull request #1519 by another author (`roadmaps list`: "#1519 StratifiedSpacesAndTameTopology (new) @mycaule 33180e1"), not on main and not in the merge order.

**Repair.** Add #1519 (StratifiedSpacesAndTameTopology, mycaule) to the "must merge first" list of the description's merge-order block. The README itself is right to cite it by roadmap name and section.

## Previous findings

- R01 — repaired: the merge-order file no longer lists ClassFieldTheory or AlgebraicCurves (both on main); the dependency check at this head reports "201 roadmaps, 1322 edges, 0 problem(s)" with no UPWARD or CYCLE line. README line 61 still cites "ClassFieldTheory Layer 13, `cyclicHasseNorm` and `isGlobalNorm_iff_isLocalNormEverywhere`", which exist on main (previous report).
- R02 — repaired: `levelArithmetic_commensurable` occurs nowhere; lines 69, 217, 236 now cite "AdelicAlgebraicGroups §3.4, arithmetic subgroups attached to a level (the carrier `Reduction.levelArithmetic` and the commensurability of `Γ_{x,U}` and `Γ_{x′,U′}`)", and lines 228, 245 end "§3.4, arithmetic subgroups attached to a level." Verified at the AdelicAlgebraicGroups head: README lines 3258–3267 (the bullet, commensurability "for all `x, x′` and compact open `U, U′`", Milne Lemma 5.13) and `Suggested.lean` line 267 `def levelArithmetic` inside `namespace Reduction` (line 256).
- R03 — repaired: `chevalley_finiteIndex_congruence` occurs nowhere; lines 61 and 1526 cite "`chevalley_power_congruence` with its finitely generated subgroup `E=U`, empty excluded-place set and `n` the exponent of `U/U′`", line 1526 adding "so that `Uⁿ⊂U′`". Verified at the GL2AutomorphicRepresentationsAndTransfer head: `Suggested.lean` line 66 (`E : Subgroup Kˣ`, `[Group.FG E]`, `n`, `0 < n`, `T : Finset` of finite places; modulus with empty infinite part, support disjoint from `T`, `E ∩ IsCongrOne m ⊂ Eⁿ`) and README lines 581–583 (the finite-index consequence with `n = exponent(E/H)`).
- R04 — repaired: "(README-only)" and "Suggested.lean, …" occur nowhere; lines 307 and 309 now read "AdelicAlgebraicGroups §4.5, “Class sets of groups with simply connected derived group”" and "§4.1, “Hasse kernel and injectivity” … “Local `H¹` vanishing”".
- R05 — repaired: line 802 imports from StratifiedSpacesAndTameTopology Layer 4 "cell decompositions compatible with any finite family of definable sets, piecewise continuity of definable maps, and definable dimension with its independence of the decomposition, invariance under definable bijections, union and frontier laws", keeps `R_an,exp` and van den Dries–Miller here, and the supplier paragraph (line 83) and Layer 3 Dependencies (line 974) name the supplier. The one residue is R01 above.

## Verified sound

**Gate and dependency check.** The worker's gate at e7d7bdc: every scanner 0, `depcheck=0`, `build=0`, OK. I re-ran the dependency check with the brief's command:

```
depcheck: 201 roadmaps, 1322 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. StratifiedSpacesAndTameTopology is another author's open pull request adding a new folder (#1519), hence a permitted supplier; it is not in the merge order, so the check places it as a supplier without complaint. AdelicAlgebraicGroups (order line 30) and GL2AutomorphicRepresentationsAndTransfer (line 85) precede ShimuraVarieties (line 89). `git diff --stat origin/main...HEAD` outside the folder: empty.

**Lean.** `Suggested.lean` is unchanged since d377db7 (`git diff --stat d377db7 HEAD -- TauCetiRoadmap/ShimuraVarieties`: README only). I elaborated a scratch copy with `#check @` for all five declarations (`lake env lean`, 4.2 s): the only warnings are the two `sorry`s at lines 70 and 83; the five elaborated types are identical to the worker's `signatures.md` and to those in the previous report (no section binder lost: `[Fintype ι] [Nonempty ι] [∀ i, Field (F i)] [∀ i, NumberField (F i)] [∀ i, NumberField.IsCMField (F i)]` and `[NumberField k]` are all explicit). Imports, form, one-tactic probes, headline list and the not-statable docstring: as in the previous report, unchanged file.

**Supplier citations resolved at the changed lines** (each opened at the open head the brief allows, via `roadmaps show`, or on main):

- AdelicAlgebraicGroups (#792 head): `## Layer 3: reduction and arithmetic quotients` (README line 2435), `### 3.4 Adelic reduction and arithmetic quotients` (line 3141), bullet "Arithmetic subgroups attached to a level" (lines 3258–3267: definition `Reduction.levelArithmetic x U := G(F) ∩ xUx⁻¹`, discreteness, conjugation law, finite index for `U′ ≤ U`, commensurability for all `x, x′, U, U′`, for any affine algebraic group over a number field); `Suggested.lean` line 267 in `namespace Reduction`. The README's use (reductive `G/ℚ`, intersected with the finite-index `G(ℚ)_+`) is an instance.
- GL2AutomorphicRepresentationsAndTransfer (#931 head): `### R16.1.7 Congruences detecting finite-index subgroups of S-units` (README line 581), statement line 583, `theorem chevalley_power_congruence` (`Suggested.lean` line 66). The README's instantiation is valid: a finite-index subgroup `U` of `O_F×` is finitely generated (Dirichlet), `T = ∅` is allowed, and `n = exponent(U/U′) ≥ 1`.
- StratifiedSpacesAndTameTopology (#1519 head): `### Layer 4: o-minimal structures, cells, dimension, triangulation` (README line 268; the anchor in the README's link matches this heading), items 1 (structures, products via `Fin.append`, projections, fibres), 4 (cell decomposition parts (I) and (II)), 5 (dimension in `WithBot ℕ` with `dim ∅ = ⊥`; independence, definable-bijection invariance, union, frontier); `Suggested.lean` line 201 `structure OMinimalStructure (R) [LinearOrder R]`, line 266 `exists_isCellDecomposition` under `[DenselyOrdered R] [NoMinOrder R] [NoMaxOrder R]` (satisfied by `ℝ`). Its scope (lines 24–44) leaves the o-minimality of `ℝ_an` and `ℝ_exp` to RealAnalyticGeometry; RealAnalyticGeometry on main contains no o-minimal statement (grep for "o-minimal", "R_an", "ℝ_an", "ℝ_exp": nothing), so §3.5a's ownership of `R_an,exp` stands as in the previous report. The product, projection and fibre laws are absent from Layer 4 as the README says (R01 for the semialgebraic overlap).
- ClassFieldTheory Layer 13 names and AlgebraicCurves Layer 12: on main, as resolved in the previous report (unchanged lines).

**Adversarial table.** Rows for the changed statements first, with the values computed; the rows for untouched statements are carried from the review at d377db7 (marked "carried"), whose values I did not recompute.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §5.9a: `n = exponent(U/U′)` gives `Uⁿ ⊂ U′` and a congruence kernel inside `U′` | `F = ℚ(√2)`, `U = ⟨ε⟩`, `ε = 1+√2` (torsion-free, index 2 in `O_F×`), `U′ = ⟨ε²⟩`; and `U′ = U` | `U/U′ ≅ ℤ/2`, exponent 2, `U² = U′`; Chevalley modulus `m = (3)`: 3 inert, `O/3 = 𝔽₉`, `ε² ≡ 2√2`, `ε⁴ ≡ 8 ≡ −1`, `ε⁸ ≡ 1`, so `U ∩ ker(mod 3) = ⟨ε⁸⟩ ⊂ U′`, index 8; `U′ = U`: exponent 1, unit modulus | the finite-index consequence as cited; hypotheses (`Group.FG`, `0 < n`, `T = ∅`) met | — |
| §3.5a product law `dim(A×B) = dim A + dim B` with `dim ∅ = ⊥` | `A = ∅, B = ℝ`; `A = {0}, B = ℝ`; `A = B = ℝ` | `⊥ = ⊥ + 1` (`WithBot.bot_add`); `1 = 0 + 1`; `2 = 1 + 1` (`ℝ²` is a `(1,1)`-cell) | holds with the supplier's `⊥` convention | — |
| §3.5a projection law `dim f(A) ≤ dim A` | `A = graph(exp) ⊂ ℝ²`, `f` = first projection; `A = ℝ²`, same `f`; reverse inequality | `1 ≤ 1` (bijection, equality); `1 ≤ 2`; `2 ≤ 1` false | inequality is the right direction; equality only under injectivity | — |
| §3.5a fibre law (locus `dim A_x = d` definable, part over it has `dim = dim(locus) + d`) | `A = {xy = 0} ⊂ ℝ²`, `d = 1, 0, ⊥` | `d = 1`: locus `{0}` (dim 0), part `{0}×ℝ` dim `1 = 0+1`; `d = 0`: locus `ℝ∖{0}` (dim 1), part dim `1 = 1+0`; `d = ⊥`: locus `∅`, part `∅`; union law gives `dim A = max(1,1) = 1` | consistent with the union law and with A4.1's semialgebraic values (R01) | — |
| §3.5a: Mathlib-definable sets of `R_an,exp` form an `OMinimalStructure ℝ` | the seven axioms of SST 4.1 | Boolean algebra (∧, ¬), cylinders (dummy variable), diagonals and `{x₀ < x₁}` (atomic formulas of the ordered field), projection (∃), one-variable axiom = van den Dries–Miller o-minimality; converse of the one-variable axiom: points and intervals are definable from `<` | bridging statement is exactly the o-minimality theorem plus formal closure | — |
| §0.1–0.2: commensurability of `Γ_{x,U}` and `Γ_{x′,U′}` as cited | `G = GL₂/ℚ`: `x = x′ = 1`, `U = GL₂(ℤ̂)`, `U′ = K(N)`; `x = diag(p,1)`, `x′ = 1`, `U = U′ = GL₂(ℤ̂)` | `GL₂(ℤ) ⊃ Γ(N)` finite index; `xGL₂(ℤ_p)x⁻¹ = {[[a, pb],[c/p, d]]}`, so `Γ_{x,U} ∩ GL₂(ℤ) = Γ⁰(p)`, index `p+1` in both (`= 3` at `p = 2`) | matches Milne Lemma 5.13; `Γ_{x,U}` is not integral, so the intersection step is needed | — |
| §3.5a Check "graph of `exp` has dimension one and point fibres" | `A = graph(exp)` | `A_x = {eˣ}`, dim 0 for every `x`; locus `d = 0` is `ℝ`, part dim `1 = 1+0` | agrees with the fibre law above | — |
| `CMType` partition vs Milne Def. 1.8 (carried) | `E=ℚ(i)`, `Φ={i↦i}`; `Φ=∅`; `Φ=Hom`; `E=ℚ` | exactly one of `φ, ιφ` in `Φ`; `∅` and `Hom` fail; `ℚ` has no CM type | equivalent to `Hom = Φ ⊔ ιΦ` | — |
| ring homs from a product factor through one projection (carried) | `φ:(ℚ×ℚ)→+*ℂ` | `φ(1,0)·φ(0,1)=0` in a field | `Hom(∏F_i,ℂ)=⊔Hom(F_i,ℂ)` | — |
| `reflexField_isCMField` degenerate `ι` (carried) | `ι=∅`; singleton `ℚ(i)` | zero ring: `reflexField=ℚ`, not CM, excluded by `[Nonempty ι]`; singleton: `E*=ℚ(i)` | hypothesis needed and present | — |
| `E*` never totally real (carried) | any `Φ≠∅` | `ιΦ=Hom∖Φ≠Φ` | consistent | — |
| `reflexField_representation` both directions (carried) | `k=ℚ`, `E=ℚ(i)`, `Φ={id}`; `n=0` | `typeTrace(i)=i∉ℚ`; `n=0` trace `0≠|Φ|` | both sides false together | — |
| same, uniqueness clause (carried) | `E⊗k` a product of fields | multiplicities determine modules | correct | — |
| Conventions: right translation order (carried) | `u=[[1,1],[0,1]]`, `v=[[1,0],[1,1]]` | `uv≠vu` | as stated | — |
| Conventions: Hecke apex `g=diag(p,1)` (carried) | `M∈GL₂(ℤ_p)` | `p∣b`; index `p+1` | matches | — |
| Conventions: `art` vs `rec` (carried) | `u=χ_cyc(σ)` | `χ_cyc(art(u))=u`, `χ_cyc(rec(u))=u⁻¹` | matches 2007c Lemma 3.4 | — |
| Conventions: reflex norm on split `G_m` (carried) | `μ(t)=tⁿ`, `n=0,−1,2` | `1, s⁻¹, s²` | matches | — |
| Conventions / §5.11 polarization multiplier (carried) | `s=2`, `σ=id` | `c=1/4` both ways | matches 2007c (24) | — |
| Conventions / §2.3 induced weight (carried) | genus `g` | `det(CZ+D)^{−(g+1)}`: weights `2n`, `3n` | matches | — |
| Conventions / §8.13 row action (carried) | two generators | `(P,P+Q)`, `(−Q,P)` | matches ModularCurves item 5 | — |
| Conventions / §§8.6, 8.11 component counts (carried) | `N=1,2,3,5` | `φ(N)` and `φ(N)/2` points; `ℚ(√5)` at `N=5` | matches | — |
| §1.3 Check `K(3)→K(21)` (carried) | `H=ker((ℤ/21)^×→(ℤ/3)^×)` | regular `C₆` | matches | — |
| §1.5 Check `Y₀(2)×_{Y(1)}Y₀(2)` (carried) | `j=256t³/(t−1)` | node at `(0,0)` | nonnormal, as claimed | — |
| §4.9 functoriality (carried) | `G_m`, general | `s^{mn}` both sides | holds | — |
| §4.4 Check `not_arbitrary_subset` (carried) | `K(5)`, `χ_cyc(σ)=2` | swaps the two classes | discriminating | — |
| §4.10 witness for `GL₂` (carried) | odd `p` unramified in `L` | `ℚ(√−p)⊄L` | matches | — |
| §4.9a / §4.10 `Res_{ℚ(i)/ℚ}G_m` (carried) | regular open `V` | `W` integral over `ℚ` | matches Deligne 5.1.2 | — |
| §5.1 Checks (carried) | `ℚ(ζ₈)`, `{1,3}`; `k=ℚ(i,√2)` | `E*=ℚ(√−2)`; `N_{k,Φ}(√2)=−2`; `(2+i)(2−i)=5` | correct | — |
| §5.1 `ιΦ` has the reflex field of `Φ` (carried) | any `Φ` | `σΦ=Φ ⟺ σ(ιΦ)=ιΦ` | true | — |
| §3.9 / §8.17 Checks (carried) | `GL₂`; Hilbert data | `GL₂/SL₂=(G_m,{±1})`; no codimension-one strata | matches Pink | — |
| §7.5 Check `sl2_conjugation` (carried) | `τ` = conjugation | `τμ_h=μ_h⁻¹`, class `1` | split twist | — |
| §7.0e Lemma 3.8 hypothesis (carried) | `SL₂`, `A₄` | centre `μ₂`; `A₄` excluded | matches the scan | — |
| §8.1 / §8.3 degrees (carried) | `N=3`, `j=0` | `24/3=8` points, ramification 3 | matches | — |
| §8.6 Galois action (carried) | `(G_m,{±1})`, `K(N)` | `σ[a]=[χ_cyc(σ)a]` | matches | — |
| §6.4 reconstruction index set (carried) | left `Λ`-action | `U\Ind=⨿(γ⁻¹Uγ∩Λ_e)\T` | agrees with Deligne 2.7.3 | — |
| §8.5 `E(D′)⊂E(D)` (carried) | general `f` | stabilizers compare | no injectivity needed | — |

**Sources.** The seeded sample's targets (0.3, 1.4, 2.3, 3.1, 3.3, 3.4a, 4.10, 4.11, 5.9, 5.10, 7.0i, 7.3, 7.14, 8.4, 8.20) are untouched by the diff; the previous review's sample verification (Milne SVI, Pink, Deligne 1971/1979, Milne 1983a/1984/1999/2007c/CM, AGHMP) stands, and the only changed locator is the new van den Dries reference (below). Nothing in the changed lines is a source passage.

**Ownership and duplication at the changed lines.** The three objects the diff touches are an imported carrier (`Reduction.levelArithmetic`, owner AdelicAlgebraicGroups), an imported theorem (`chevalley_power_congruence`, owner GL2AutomorphicRepresentationsAndTransfer) and the general o-minimal cell and dimension theory (now imported from StratifiedSpacesAndTameTopology, which names itself owner at its README line 72). The one overlap introduced is R01. Ownership against open pull requests the brief lists without files was not checked beyond the `roadmaps grep`/`roadmaps show` index.

**Shape at the changed lines.** The supplier paragraph is in `## Exact supplier contracts` under the supplier's name with the layer cited; the Dependencies line of Layer 3 names it; the new reference entry has author, title, series, publisher, year and locator; no process words, pull-request numbers, LaTeX or machine paths were added.

## Not verifiable

- L. van den Dries, *Tame Topology and o-minimal Structures* (CUP 1998), cited at §3.5a for Chapter 4 §1: the sources service found only the publisher's landing page (DOI 10.1017/CBO9780511525919), in no licence class; cited by locator only, uncertified. The chapter and section are the book's dimension section, where the product, image and fibre laws live, so the locator is plausible; the pages were not read.
- Kazhdan 1983, the Annals pagination of AGHMP, and the texts listed in the previous report outside the seeded sample: unchanged, not re-attempted.
- The folder still carries no `sources.toml`; nothing is certified in the manifest.

## Source issues

- none
