# Review of ModularCharactersAndBlocksPartII (pull request #2411 at c2e9927)

**Verdict:** needs changes

## R01 (P3) — The route of the declared gap states Isaacs 3.12 backwards

**Location** `TauCetiRoadmap/ModularCharactersAndBlocksPartII/README.md:517–519` (What InductionRestriction must provide): "the lifting to a finite central extension and the divisibility of the degree of an irreducible representation by the index of a central subgroup (isaacs Theorem 3.12)".

**Claim** "Divisibility of the degree by the index" means the index divides the degree. Isaacs 3.12 says the opposite: the degree divides the index of the centre. Schur's theorem needs the second, and the sentence as written is false.

**Witness** `G = Q₈`, `Z = Z(Q₈)`, `χ` of degree `2`: `|G : Z| = 4` does not divide `χ(1) = 2`, while `χ(1) = 2` divides `4`.

**Repair** Replace the clause with: "… which follows from the lifting to a finite central extension and the divisibility of the index of a central subgroup by the degree of an irreducible representation, `χ(1) ∣ |G : Z|` for `Z ≤ Z(G)` (isaacs Theorem 3.12)." The gap's `needs` sentence is correct as it stands. The gap's `detail` in `packages/ModularCharactersAndBlocksPartII/design/plan.json` has the same reversed phrase.

## R02 (P3) — The description's dependency paragraph is contradicted by the head and does not mention the declared gap

**Location** Pull-request description, third paragraph: "Dependencies (the roadmaps the README cites by name and section, and what they in turn need; the Lean imports none of them). … everything else named in the README is a consumer, not a prerequisite."

**Claim** The paragraph promises a list of dependencies and gives none. Its last clause is false. The description also never mentions the supplier gap that this roadmap places on a roadmap on main.

**Witness** README:159 names FiniteGroupInvariants §6.2 as the owner of a result not planned here. README:1812 says GlaubermanZStar consumes only the base. README:507–510 declare `gap:clifford-multiplicity-dvd-index` on InductionRestriction Layer 7.

**Repair** Replace the paragraph with: "Dependencies: ModularCharactersAndBlocks (open; its Conventions and §§0.2–8.2) and InverseGaloisAndArithmeticFundamentalGroups IG.3.4 (open), both in the merge order below; on main, RepresentationTheory/CharacterTheory §§2.1, 3.5, 3.6, 4.1, 4.3–4.5 and RepresentationTheory/InductionRestriction Layers 1, 2, 5 and 7. One declared supplier gap, `gap:clifford-multiplicity-dvd-index`: InductionRestriction Layer 7 is to prove that `χ(1)/θ(1)` divides `|G : N|` (Isaacs, Corollary 11.29), which §8.3 uses. FiniteGroupInvariants and GlaubermanZStar are named only to mark scope; the Lean imports no roadmap."

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.1 `Irr_S(Γ)`, `(s·χ)(g) = χ(s⁻¹•g)` | `C₇` with `C₃` (`r ↦ r²`); `Q₈` with `C₃`; `S = 1` | `(s·χ)(r) = ζ₇⁴`, wrong model `ζ₇²`; `Irr_S(Q₈) = {1, χ₂}`, `C = {±1}`; `Irr_S = Irr`, `C = Γ` | holds; glauberman l.94, hartley-turull l.302 match | none |
| §2.2 canonical extension | `SL(2,3)`, `χ₂`; trivial action; `S₃ = C₃ ⋊ C₂`, `1` | `χ̂(a) = −1`; `det(χ̂λ) = λ² ≠ 1` on `S`; `χ̂ = χ × 1`; `1` (`sgn` has det `−1`) | holds; glauberman l.234 Thm 2(a), l.263; hartley-turull l.304 | none |
| §2.4 Gallagher | `SL(2,3)` over `χ₂`; `N = G`; `N = 1`, `G = C₂`, `χ̂ = sgn`; `Z(Q₈)` | `3 = 3` characters; `{θ}`; swaps `1, sgn`; no extension, `1` vs `4` | holds; glauberman l.240 Thm 2(c) (case `G ⊴ GA`), general form isaacs 6.17 | none |
| §3.3 one element | `SL(2,3)`, `a` of order 3; `a = 1`; `C₃ × C₃` on `Q₈` | `C_a = {±1}`, `ε = −1`, `λ = sgn`; `C_a = Γ`, `ε = 1`, `λ = χ`; kernel element: `ε = 1`, `λ = χ₂` | holds; glauberman l.364 Cor 4 | none |
| §3.4 restriction formulas | `SL(2,3)`, `B = 1`; `3^{1+2}_+` with `C₂`; with `C₄` (`a·(x,y,z) = (−y,x,z−xy)`) | `(2sgn+sgn)/3 = sgn`; `ω` and `2ω`; eigenvalues `i, −i, 1`, `χ̂(a) = 1`, `ε' = −1`, `(3ω+ω)/4 = ω` | holds; Cor 5 l.375 is existential in `ε`, `θ₀`; Cor 6(c) l.454 | none |
| §4.2 `p`-group case | `SL(2,3)`; `3^{1+2}_+` with `C₂`; `S = 1`; `D₈ ≤ GL₂(3)` on `𝔽₃²` | `3·sgn`, quotient `sgn`; `(3ω−ω)/2 = ω`; `0`; swap moves `𝔽₃×0` to `0×𝔽₃` | holds; route through `S₁` avoids the gap in glauberman l.547 | none |
| §4.3 series independence | `C₁₅` on `Q₈ × C₁₁`, both series; `C₉` on `C₁₉`; trivial action | both give `χ₂ × 1`; `C = 1`, `Irr_S = {1}`; identity | holds; glauberman l.542 Thm 4(b),(c), l.562 | none |
| §4.5 correspondence | `SL(2,3)`; `C₂` swapping `C₃²`; `C₂` swapping `C₂²`; `S = 1` | `χ₂* = sgn`, `2 ≡ −1 (3)`; `ψ_{2a}`; both invariant characters restrict to `1` (no injection); `θ* = θ` | holds; Thm 4, Cor 7–8; spath-vallejo l.118–130 | none |
| §4.6 equivariance | swap on `C₃²` with inversion `α`; `j = 2`; `SL(2,3)` | `ψ_{−2a} = ψ_{2a}∘α⁻¹`; `ψ_{4a} = ψ_a` both sides; `ℚ = ℚ`, `[χ₂|_C, sgn] = 2` | holds; glauberman l.636 Thm 5(a)–(d) | none |
| §5.1 degree bound | `SL(2,3)`; `3^{1+2}_+`; reverse with `θ = 1` | `2 ∣ 4·1`; `3 ∣ 9·1`; `|Γ:C| ∤ 1` | holds; glauberman l.644 Thm 5(e) | none |
| §5.2 degree-divisibility | `SL(2,3)`; abelian `Γ`; reverse variant | `1 ∣ 2`; `1 ∣ 1`; `2 ∤ 1` | holds; geck l.29–36, hartley-turull l.84, l.91 | none |
| §7.2 covering | `S₃`, `N = C₃`, `p = 2`; `S₄`, `N = A₄`, `p = 2`; `N = 1`, `N = G` | `ω_std = −1 = λ(r)+λ(r²)`; `Ind λ ≅ W`, Brauer character `2, −1`; all cover; `B = b` | holds; martinez Prop 7.6, 7.9, 7.11, Cor 7.8, Lemma 8.6 | none |
| §7.3 domination | `S₃`, `N = C₃`, `p = 2, 3`; `S₃ × C₂`, `N = S₃`; `N = G` | `π(1+r+r²) = 1`, `π(r+r²) = 0`; `1 = e₊+e₋`; images `1, 0`, `DN/N = C₂`; `B₀` alone | holds; martinez Cor 8.2, Def 8.3, Prop 8.4, Thm 8.5 | none |
| §8.3 heights, normal `D` | `SL(2,3)`, `p = 2`; `A₄`, `p = 2`; `D × H` | `{0,1} = {ν(1), ν(2)}`; `{0}`; `h = ν(ξ(1))` | holds; reynolds Thm 8 l.531–540, martinez l.2331–2347 | R01 (route of its gap) |
| §8.4 Reynolds | `D = 1`; `D₈`; `A₄`, `SL(2,3)` at `p = 2` | `{χ} = Irr₀`; height `1` and nonabelian; `V₄` all `0`; `Q₈` height `1` | holds; reynolds Thm 9 l.542, martinez Thm 9.8 l.2328 | none |
| Isaacs 3.12 direction (R01) | `Q₈`, `Z = Z(Q₈)` | `χ₂(1) = 2`, `|G:Z| = 4`: `2 ∣ 4` true, `4 ∣ 2` false | README wording reversed | R01 |
| `existsUnique_canonicalExtension` | `S = 1`; `SL(2,3)` | `ψ = χ`; three extensions of `χ₂`, only the natural one has det `1` on `S` | holds | none |
| `canonicalExtension_values` | `SL(2,3)`; trivial `C₂` on `C₃` | values `2,−2,0,−1,1`, `ℚ = ℚ`; `χ̂(s) = 1`, `ℚ(ζ₃)` both sides | holds | none |
| `gallagher_bijOn` | `N = G`; `N = 1`, `C₂`, `η = sgn`; `Q₈ ⊴ SL(2,3)` | `{1} → {η}`; permutation swapping `1, sgn`; `3 ↔ 3` | holds | none |
| `ncard_invariantIrreducibleCharacters` | `SL(2,3)`; `C₇⋊C₃` with inversion; `3^{1+2}_+` with `C₂` | `2 = 2 = 2`; `3 = 3 = 3`; `3 = 3 = 3` | holds | none |
| `existsUnique_restrict_pairing_not_dvd` | `S = 1`, any `p`; `SL(2,3)`, `p = 3` | `m = 1` for `χ`, `0` else; `[χ₂|_C, sgn] = 2 ≡ −1`, `[χ₂|_C, 1] = 0` | holds | none |
| `IsGlaubermanFamily` / `exists_isGlaubermanFamily` | law at `T = ⊥`, `T = ⊤`; `S = C₆`, `T = C₃` | `π(C, 1) = id` (trivial group a `p`-group for all `p`); naturality only; factors fixed at `p = 3, 2` | satisfiable: Glauberman's construction, series through `T` | none |
| `IsGlaubermanFamily.apply_eq` | induction through `T` of prime index `q`; `S = 1` | both pick the unique prime-to-`q` constituent (Thm 4(a)); `S = 1`: restriction | holds | none |
| `IsGlaubermanFamily.restrict_pairing_ne_zero` | `SL(2,3)` | `Σ_{t∈C} χ₂(t) sgn(t⁻¹) = 2 + (−2)(−1) = 4 ≠ 0` | holds | none |
| `IsGlaubermanFamily.adjoin_range_eq` | `SL(2,3)`; swap on `C₃²`, `ψ₁ × ψ₁` | `ℚ = ℚ`; `ℚ(ζ₃) = ℚ(ζ₃)` | holds | none |
| `IsGlaubermanFamily.exists_sign_of_isCyclic` | `SL(2,3)`, generators `a`, `a²`; `S = 1` | `ψ(a) = −1`, `ψ(−a) = 1`: `ε = −1`, `sgn`; `ε = 1`, `π = χ` | holds | none |
| `IsGlaubermanFamily.index_mul_degree_eq` | `SL(2,3)`; `3^{1+2}_+` | `4·1 = 2·2`; `9·1 = 3·3` | holds | none |
| `IsBlockDefectGroup` | `k[S₃]`, `p = 2`, `1+r+r²`, `r+r²`; `k[S₄]`, `p = 3`, `e_{χ₃}` | `⟨t⟩` yes, `1` fails maximality; `1` yes; coefficients `0,2,1,0,1`, defect group `1`, normaliser model accepts `⟨(123)⟩` | discriminating | none |
| `blockCharacters` | `ℤ₂[ζ₃][S₃]`: `(1+r+r²)/3`, `(2−r−r²)/3`, `1`, `0`; `ℤ₂[C₃]` | `{1, sgn}`; `{std}`; all; `∅`; `{(2,−1,−1)}`, not `λ, λ̄` | discriminating | none |
| `brauer_height` | `A₅`, `p = 2`; `C₃` over `(ℚ₂, ℤ₂, 𝔽₂)`; `G = 1` | `B₀`: `1,3,3,5`, `a−d = 0`; degree `2`, `ν = 1 ≠ 0` (excluded by `hζ`); `1` | holds; `hζ` needed | none |
| `fongReynolds` | `S₃`, `N = C₃`, `p = 2`, `b = {λ}`; `p = 3` | `T = C₃`, `λ^G = std`, heights `0 = 0`; `T = S₃`, identity | holds | none |
| `existsUnique_fongReynolds` | `N = 1`; `S₄`, `N = V₄`, `p = 3` | `T = G`, identity; two extensions of `λ` ↦ two distinct degree-3 blocks | holds | none |
| `reynolds_heights` | `D = 1`; `SL(2,3)`, `p = 2`; `G = D₈` | `{0} = {0}`; `{0,1} = {0,1}`; `{0,1} = {0,1}` | holds | none |
| `reynolds` | `A₄`, `SL(2,3)` at `p = 2`; `D = 1` | all `0` ↔ `V₄` abelian; height `1` ↔ `Q₈` nonabelian; true ↔ true | holds | none |

- Source locators checked against the text: 99, in 10 sources (glauberman 25, martinez 43, reynolds 8, sambale 6, hartley-turull 5, mnst 4, ruhstorfer 3, spath-vallejo 2, geck 2, kessar-malle 1). All support the statement as written. The misprint the README flags at martinez l.725 is real.
- Library declarations: 62 cited names confirmed with `#check` against the pinned Mathlib and Tau Ceti. Opened and compared: `TauCeti/RepresentationTheory/CharacterTable/Table.lean:114`, Mathlib `RepresentationTheory/Irreducible.lean:29`, `Induction/Clifford/Dimension.lean:113`, `Induction/Cyclotomic/SplittingField.lean:107`. Instance search finds the action `MulDistribMulAction (S ⧸ T) (FixedPoints.subgroup T Γ)`.
- Cross-roadmap citations resolved: ModularCharactersAndBlocks (#1775 head 8379fba): Conventions, §§0.2, 1.1–1.3, 2.1–2.4, 3.1, 4.1–4.2, 5.1, 6.1–6.3, 7.1–7.2, 8.1–8.2 and the six named base declarations. InverseGaloisAndArithmeticFundamentalGroups IG.3.4. CharacterTheory §§2.1, 3.5, 3.6, 4.1, 4.3–4.5. InductionRestriction Layers 1, 2, 5, 7. FiniteGroupInvariants §6.2.
- Gate: every check OK. Depcheck output: `depcheck: 239 roadmaps, 2255 edges, 0 problem(s)`.
- `lake env lean` on `Suggested.lean`: 16 `sorry` warnings only. `#check @name` for all 20 declarations in one scratch file: every elaborated type carries the README's hypotheses, and nothing changed. Probes (`rfl`, `infer_instance`, `simp`, `decide`): 0 of 16 close.
- Gap `gap:clifford-multiplicity-dvd-index`: the same slug is in `plan.json` and the README, and the `needs` sentence is precise. It is not provided elsewhere: Tau Ceti `Dimension.lean:113` gives only `dim V ∣ dim W`, InductionRestriction Layer 7 states no degree divisibility, and no roadmap plans Isaacs 11.29.
- Targets carrying no source locator, by design: the change of system (§6.1) and the change of place and of level (§6.3). Each has a route whose every input is cited.
- Headline theorems: the 16 named in the Summary are all stated. The docstring correctly names the three cited predicates (§5.2, §§9.1–9.2) as not stated.

Overlap check: read ModularCharactersAndBlocks, GlaubermanZStar, OddOrderTheorem, LocalFiniteGroupTheory, FiniteGroupInvariants, CharacterTheory, InductionRestriction, FiniteGroupExtensionSplitting; shared objects and owners: covering and domination (here for an arbitrary normal subgroup, the base for normal `p`/`p'`-subgroups and the covering criterion, cited); Brauer's permutation lemma (FiniteGroupInvariants §6.2 for the Galois action, here for an automorphism); conjugacy of coprime complements (InverseGaloisAndArithmeticFundamentalGroups IG.3.4, cited here and by OddOrderTheorem); Glauberman's lemma and invariant cosets (here §1.2, also planned by LocalFiniteGroupTheory L3, see the human reviewers).

Source independence: 21 passages compared with 7 sources. None is shared beyond formula-forced runs; the longest is 10 words, "every defect group of B is a defect group of B^G" (martinez l.1833). Largest share: martinez, 44 of 117 locators. Contents compared with martinez (Lectures 2–9): independent; Layer 7 merges Lectures 3.1, 4.2, 7, 8.1 and 9.1–9.2 in another order. Glauberman §§2–4 correspond to Layers 2–4 in order, an order forced by the *Needs:* chain §3.2 ← §§2.2–2.4, §4.1 ← §3.2, §4.2 ← §3.4. §§2.1, 2.4, 4.5 and 5.2 go beyond the paper.

## Not verifiable

- isaacs (1976): Theorems 3.12, 6.32, Corollaries 6.17, 11.29, Chapter 13. Settled as uncertified; no legal copy, cited by locator only.
- navarro-1998: Chapter 3, Theorem 5.9. Uncertified. Theorem 5.9 is corroborated by martinez l.2013, which cites it for the same statement.
- navarro-2018: Chapter 2. Uncertified. geck l.24 places the Glauberman correspondence at §2.5 of this text.
- feit (1982): Chapter IV. Uncertified.
- geck, kessar-malle, mnst, ruhstorfer: read as arXiv 1904.04586v1, 1112.2642v2, 2209.04736v2 and 2204.06373v1. Their numbering against the cited Annals versions was not compared, as those are paywalled.

## Source issues

- **Gap** in glauberman at Theorem 4(a), proof, p. 1478: the induction is applied to the series cut at its last term `A_{n−1}`, which need not be normal in `A`, so `A` need not act on `C_G(A_{n−1})`. It should induct through the first term `A₁`, which is normal of index `p`; affects the proof.
- **Misprint** in martinez at §3.2, p. 18: the height-zero condition reads `d(B) = χ(1)_p`; it should be `p^{a−d(B)} = χ(1)_p`; affects nothing.
- **Misprint** in martinez at §3.2, p. 18: the height is introduced for every `χ ∈ Irr(G)`; it should be every `χ ∈ Irr(B)`; affects nothing.
- **Misprint** in martinez at §7.1.2, p. 43: Brauer characters of the conjugate block are written `IBr(b^G) = {φ^g | φ ∈ Irr(b)}`; it should be `IBr(b^g) = {φ^g | φ ∈ IBr(b)}`; affects nothing.
- **Misprint** in martinez at Theorem 8.5, proof, pp. 52–53: the proof treats parts "(a)", "(b)", "(c)" while the statement labels them (i)–(iii); affects nothing.
- **Misprint** in sambale at Proposition 1.17 (ii)–(iii), p. 17: the covering criterion asks for `(χ_N, ψ)_N ≠ 1`; it should be `≠ 0`; affects nothing.

## For the human reviewers

- LocalFiniteGroupTheory (open draft, on the list of roadmaps never cited as suppliers) plans in its L3 Glauberman's lemma and invariant cosets modulo a normal subgroup. This roadmap's §1.2 states and proves the same objects, with the coset statement for any invariant subgroup.
- The largest share of locators (44 of 117) goes to martinez: unpublished course notes (Firenze 2024) read from the author's university page. The results cited there are standard; the main ones are also cited to reynolds, sambale and navarro-1998.
