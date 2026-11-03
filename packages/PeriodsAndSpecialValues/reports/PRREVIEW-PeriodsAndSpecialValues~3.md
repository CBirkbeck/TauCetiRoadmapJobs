# Review of PeriodsAndSpecialValues (pull request #1496 at 147f30d)

**Verdict:** needs changes

Incremental re-review of the 26 lines changed since 58a34e8 (the relative K-theory supplier contracts), plus an account of the previous report's three findings. The changed passages are correct and resolved against the cited suppliers at their heads; the one blocking item is the previous report's R02, which this head does not touch and which needs a board-side repair, not a README edit.

## R01 (P2) — The plan still declares five supplier gaps the README no longer states, two of them for theorems already owned elsewhere

**Location:** `packages/PeriodsAndSpecialValues/design/plan.json`, top-level `gaps` (five entries: `modular-eigenprojector-motive`, `motivic-cohomology-adams`, `framed-relative-motives`, `k3-betti-even-unimodular`, `indefinite-lattice-classification`), against `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:38` and `:98–104`.

**Claim:** the plan asks K3SurfacesAndSymplecticBoundedness §3.3 to prove the K3 cup lattice even unimodular of signature (3,19), asks IntegralLattices for a Part II with primitive-embedding uniqueness and indefinite even-unimodular classification, and asks MotivesAndAlgebraicCycles for the newform eigenprojector motive, the Adams comparison and the framed relative motives.

**Witness:** the README contains no `gap:` slug (grep over all 2584 lines). Its contracts at lines 98–104 consume `TauCetiRoadmap/IntegralLattices/README.md:1541` (5G, primitive embeddings into an even unimodular lattice), `:1559` (5H, uniqueness) and `:1643` (6A, indefinite classification), all on main, and K3Surfaces K2, whose statement is `TauCetiRoadmap/K3Surfaces/README.md:314` at the open head of #1285 (even unimodular H² cup lattice of signature (3,19) by Poincaré duality, Wu and the signature formula). Line 38 says PS.1.6, PS.3.0 and PS.9.15 build the three motive-side objects here. So each plan gap asks a supplier for what the README already takes from a named owner or builds itself; honouring the two lattice gaps would give the K3 lattice theorem and the embedding theorems two owners each.

Re-raised: b/F08 in `packages/PeriodsAndSpecialValues/reports/FIX-RT-PeriodsAndSpecialValues~1.md`. That report's reason was that the completed IntegralLattices roadmap excludes classification and no supplier proves the geometric K3 theorem. The reason fails on both counts today: the active IntegralLattices roadmap on main has 5G, 5H and 6A at the lines above, and K3Surfaces #1285 states the geometric theorem and is what the README now cites. The previous review (r2, R02) raised exactly this and the head since then changes nothing about it.

**Repair:** board-side, no README edit. Retire `k3-betti-even-unimodular` and `indefinite-lattice-classification` from the plan's `gaps` so that intake announces no duplicate work to K3SurfacesAndSymplecticBoundedness or IntegralLattices; retire or re-scope the three MotivesAndAlgebraicCycles slugs to match line 38, where the objects are built locally (if the roadmap means to keep any of them as a supplier contract, the README must state it under Exact supplier contracts as `What MotivesAndAlgebraicCycles must provide (gap:<slug>)`, which it currently does not). Test on the application: Λ = U³ ⊕ E₈(−1)² has rank 22, determinant −1 and signature (3,19); the PS.8.4 complement has rank 19 and discriminant length 1, so 19 ≥ 1 + 2 and 5H applies with no extension of IntegralLattices.

## R02 (P3) — `gilletWaldhausen_general` is not a declaration of GeneralAlgebraicKTheory

**Location:** `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:204`: "Section 6.19 supplies gilletWaldhausen_general for bounded perfect-complex comparison".

**Claim:** GeneralAlgebraicKTheory §6.19 declares a statement with that name.

**Witness:** at the head of #1212 the name occurs neither in `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md` (§6.19 begins at line 1409 and names no Lean declaration) nor in its `Suggested.lean` (129 lines, no `gillet`). A `roadmaps grep` over main and all 439 open heads finds the name only in this README. The section itself does supply the comparison `K(E) ≃ K(Chᵇ(E), q)` for every essentially small exact category, which is what PS.3.1 uses.

**Repair:** cite the statement, not an invented name: "Section 6.19 supplies the general Gillet–Waldhausen equivalence `K(E) ≃ K(Chᵇ(E), q)` for bounded complexes over an essentially small exact category". At this head only line 204 carries the name.

## R03 (P3) — KZ and Scholl are still unregistered in the source manifest

**Location:** `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:2563` (KZ) and `:2584` (Scholl); `packages/PeriodsAndSpecialValues/sources.toml`.

**Claim:** both works are cited with locators (KZ §1.2 Conjecture 1 and §4.1 for PS.7.4; Scholl Theorems 1.2.1 and 1.2.4 for PS.1.6).

**Witness:** the manifest has no entry whose author, title or URL matches either work (its only Zagier entries are `IKZ` and `Z`). Carried from the previous report's R03; this head changes only the README's Layer PS.3/PS.5 contracts.

**Repair:** as before: one record per work with keys `KZ` and `Scholl`, locator schemes `section` and `theorem`, the author-copy URLs the References already give, `cited_for` PS.7.4 and PS.1.6, and the sources-service provenance. This review edits no manifest.

## Previous findings

- R01 — repaired: `README.md:197–205` now cites AlgebraicKTheory §§2.2, 3.2–3.3 for K₁ᴮ(C), the relative triple group, the difference map and the summand-dense boundary, and GeneralAlgebraicKTheory §§4.16–4.17 only for the Q-comparison and exactness at K₁ᴮ(D) without fullness; the `*Needs:*` lines at 793 and 1063, the Dependencies at 884 and 1145, the Layer PS.5 opening at 1009 and the PS.5.1 text at 1011 follow suit, and no `§4.15` or `GeneralAlgebraicKTheory Layer 4` remains. The new PS.5.1 Check at line 1055 is the ℤ→ℚ test the repair asked for, with the right values (table below). The repair introduced one new problem, the invented name in R02 above.
- R02 — not repaired: `design/plan.json` still lists the five gaps; the README cites IntegralLattices 5G–5H/6A and K3Surfaces K2 directly (lines 98–104) and declares no gap. Written again as R01 above.
- R03 — not repaired: `sources.toml` still lacks KZ and Scholl. Written again as R03 above.

## Verified sound

**Scope.** The diff is 15 insertions and 11 deletions in `README.md` only; `Suggested.lean` and `metadata.toml` are byte-identical to 58a34e8 (`git diff --stat 58a34e8..HEAD`), and the diff outside the roadmap folder is empty. The seeded sample targets (PS.8.17 "Fixed-fibre projective map" and "Residue coordinates and the small prime") are untouched by the diff; the previous report's locator checks stand, and their anchors were re-opened to confirm the cache is unchanged: Park Definition 4.8 at Park line 1173 and Theorem 4.11 at line 1233; SH Lemma 4.8 at SH line 271; SG Lemma 5.6 with its p > dim V hypothesis at SG line 1082.

**Gate.** The worker's gate at 147f30d passes every check (set_option 0, sorry-data 0, residue 0, imports 0, readme-ids-missing 0, depcheck 0, stray-files 0, outside-folder 0, build 0). The dependency check rerun from this review:

```text
depcheck: 204 roadmaps, 1641 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. AlgebraicKTheory (ORDER line 11) and GeneralAlgebraicKTheory (line 13) both precede PeriodsAndSpecialValues (line 297). One observation for the worker's placement, not a finding on unchanged text: K3Surfaces (this roadmap's cited supplier at line 102, open as #1285 by the same author) is not in `ORDER.txt` and is absent from the pull request's merge-order block, although the citation resolver and the dependency check both accept it.

**Elaboration.** `lake env lean` on `Suggested.lean` from the worktree (Mathlib 6b7abb3c, Tau Ceti a91d3aaf, matching `lake-manifest.json` and the shared packages directory) exits 0 with exactly 13 `declaration uses sorry` warnings and no other diagnostic. The file is unchanged since r2, so the 38 elaborated signatures in the worker's `signatures.md` (25 definitions, 13 theorems, 0 dropped binders) are the ones the previous report compared with the README; no `#check` re-run was needed and no one-tactic probe was repeated, the previous report having found all 13 theorems unprovable by `simp`, `rfl`, `infer_instance` or one library lemma.

**Supplier resolutions for the changed passages** (file and line at the cited head):

| Contract claim at this head | Resolved where |
|---|---|
| AlgebraicKTheory §2.2: K₁ᴮ(C) by [X,α], composition, direct sums, conjugation; K₁ᴮ(Proj(R)) ≅ K₁(R) | `TauCetiRoadmap/AlgebraicKTheory/README.md:298` at #1142 (98260b1); API bullets give exactly those laws |
| §3.2: K₀(T) by triples (P,α,Q); difference map [P]−[Q]; commuting-square functoriality; agreement with Weibel's presentation only for full T | `:355`; its last Check is the ℤ→ℚ non-full example |
| §3.3: boundary δ:K₁ᴮ(D)→K₀(T) for summand-dense T, complement-independent, natural; exact at K₀(T), K₀(C); equality criterion and exactness at K₁ᴮ(D) only for full T | `:372`; its Checks compute δ(2) ≠ 0 and ker δ = {±1} for ℤ→ℚ |
| GeneralAlgebraicKTheory §4.16: K₁ᴮ(C) ≅ split-exact K₁(C), compared with the normalized matrix map | `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md:900–914` at #1212 |
| §4.17: ker δ = im K₁ᴮ(T) for every summand-dense additive T, no fullness, no terminal surjectivity | `:916–930`; its route is the Z, γ stabilization argument |
| §6.19: Gillet–Waldhausen `K(E) ≃ K(Chᵇ(E), q)` for essentially small exact E | `:1409`; no declaration name (R02) |
| §12.11: negative K-groups vanish for regular noetherian rings of finite global dimension | `:2860` |
| NoncommutativeAndEquivariantIwasawa §2.7 supplies the determinant Picard category | `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:1183` at #1307: construction step 1 builds V(R) as Deligne's Picard groupoid of virtual objects with d_R and detPerfect_* laws; it itself cites GeneralAlgebraicKTheory §6.19 for the complex extension, consistent with this README |
| IntegralLattices 5G, 5H, 6A (for R01) | `TauCetiRoadmap/IntegralLattices/README.md:1541`, `:1559`, `:1643` on main (929496d) |
| K3Surfaces K2 (for R01) | `TauCetiRoadmap/K3Surfaces/README.md:314` at #1285 (771182d) |

**Computed adversarial table.** Rows for statements the diff leaves untouched are carried from the previous report (its 105-row table, cited as "r2"); rows marked "new" are computed here for every changed statement.

| Statement | Instances tried | Computed values on the two sides / wrong-model control | Result | Change |
|---|---|---|---|---|
| PS.5.1 boundary on scalar extension, [Oⁿ,g,Oⁿ] (new) | O=ℤ, A=ℚ, n=1, g=2, 1, 6, 1/2 | δ[ℚ,2] = [(ℤ,2,ℤ)]; via (P,α,Q) ↦ det α mod ±1 its value is 2, v₂=1; g=1 gives (ℤ,id,ℤ)=0; (ℤ,6,ℤ)=(ℤ,2,ℤ)+(ℤ,3,ℤ) by the composition relation, valuations (1,1) at (2,3); (ℤ,1/2,ℤ) = −(ℤ,2,ℤ), v₂=−1. Inverse convention would give −1 for g=2 | Consistent with AlgebraicKTheory §3.3's own Check; controls discriminate | Retain; the Check at line 1055 states these values |
| PS.5.1 triple isomorphism, gluing direction (new) | (2ℤ,id,ℤ) versus (ℤ,2,ℤ) | f:ℤ≅2ℤ, 1↦2, g=id satisfies α′∘T(f) = 2 = T(g)∘α, so the two triples are equal in K₀(T); det of id:2ℤ⊗ℚ→ℤ⊗ℚ in integral bases is 2, v₂=+1; replacing 2 by 1/2 gives −1 | Consistent | Retain source/target direction |
| K₀(ℤ,ℝ) and "rational classes retain their signs" (new) | O=ℤ, A_ℝ=ℝ | {±1}→ℝ^×→K₀(ℤ,ℝ)→ℤ→ℤ with the last map an isomorphism and im(K₀(T)→K₀(ℤ)) = 0 (ranks of P and Q agree), so K₀(ℤ,ℝ) ≅ ℝ^×/{±1} ≅ ℝ_{>0}; ℚ_{>0}→ℝ_{>0} is injective, so ∂(2) ≠ 0 and ∂(1/2) = −∂(2) survive; a model identifying K₀(ℤ,ℝ) with K₀(ℤ,ℚ)⊗ℝ-torsion would kill them | Consistent | Retain; wording "retain their signs" means injectivity of the rational classes, which holds |
| Summand density and non-fullness of O→A_ℝ (new) | ℤ→ℝ; ℤ→ℚ | every finitely generated projective A_ℝ-module is a summand of A_ℝⁿ = T(Oⁿ), so §3.3's boundary exists; the map 1/2 on ℝ = T(ℤ) is not T of an integral map, so T is not full and the equality criterion is unavailable, exactly as the contract says; §4.17 supplies ker ∂ = im K₁(O) without it | Consistent | Retain the split of citations between §3.3 and §4.17 |
| Five-term sequence exact at three interior terms, no terminal surjectivity (new) | ℤ→ℚ | K₁(ℤ)={±1}→ℚ^×→K₀(T)→ℤ→ℤ: ker ∂ = {±1} = im K₁(ℤ) (AlgebraicKTheory §3.3 Check, via the determinant mod ±1); K₀(T) = ℚ^×/{±1} ≅ ⊕_p ℤ; im(K₀(T)→ℤ) = 0 = ker(ℤ→ℤ); the last map is onto here but the contract asserts nothing about it | Consistent | Retain |
| PS.5.1 extended boundary, unit −1 and quaternion sign (new values; r2 row carried) | ℍ over ℝ, x=−1; scalar O=ℤ, x=−1 | Nrd(ℍ^×) = ℝ_{>0}, so −1 is not a reduced norm; λ=−1 gives λx=1; δ̂(−1) = ∂_ℝ(1) − Σ_p ι_p ∂_p(−1) = 0 − 0 since −1 ∈ im K₁(ℤ_p) at every p; so the unit −1 has zero class while 2 has v₂=1, as the third Check says | Consistent | Retain |
| PS.5.1 multiplier independence (r2) | x=3, λ=1,2 | ∂ℝ(3) versus ∂ℝ(6) − ι₂∂₂(2): at 2, 1−1=0; at 3, 1; omitting or adding the correction gives 1 or 2 at 2 | Consistent | Retain |
| PS.5.2 ETNC obstruction sign (r2) | boundary 1, regulator class −1 | 1−1=0; subtraction gives 2 | Consistent | Retain |
| PS.3.1 determinant line, virtual objects (r2, Needs repointed) | two odd lines; torsion module ⊗ℚ | interchange sign −1 (permutation matrix determinant −1); rationalized torsion = 0 with determinant 1; NE §2.7's d_R(C) = ⊗ d(Cⁱ)^((−1)^i) gives unit for the zero complex and inverse under shift | Consistent | Retain; name in R02 to drop |
| PS.3.0 Tate-Hom/Adams, negative-degree vanishing (r2, §12.11 citation unchanged in substance) | K₋₂ of a regular noetherian ring, e.g. ℤ | 0 by §12.11 versus the erroneous K₀=ℚ | Consistent | Retain |
| PS.8.4 lattice inputs (for R01) (r2) | Λ=U³⊕E₈(−1)²; PS.8.4 complement | rank 22, det −1, signature (3,19); complement rank 19, discriminant length 1, 19 ≥ 1+2 | Consistent | Retain; gaps redundant (R01) |
| All other PS.0–PS.9 statements and the 38 Lean declarations | as in r2 | values as in the previous report's table (105 rows) | unchanged text, unchanged Lean | Retain |

**Ownership and duplication.** The repointed contracts cite the constructions' owners rather than restating them: no relative K-group, boundary or determinant functor is built in this roadmap (PS.3.1 and PS.5.1 consume them). `roadmaps grep` for `gilletWaldhausen_general` across main and all 439 open heads finds only this README (R02). Ownership against open pull requests for the changed objects was checked through AlgebraicKTheory #1142, GeneralAlgebraicKTheory #1212 and NoncommutativeAndEquivariantIwasawa #1307 as read above; the previous report's audit covers the unchanged objects.

**Declared gaps.** All five plan gaps have a named supplier (none is `none`), their `needs` sentences are single and precise, but none is declared in the README and each asks for what a named owner or this roadmap already provides (R01).

## Not verifiable

- **BG** stays settled as uncertified and **Tate-legal** as waived; neither was requested and nothing about their unseen text is asserted.
- The finite computations and the sorry build certify elaboration and the instances above, not the future proofs; in particular the extended boundary's independence of λ for a general noncommutative order rests on BF diagram (14) as the README says.

## Source issues

- none
