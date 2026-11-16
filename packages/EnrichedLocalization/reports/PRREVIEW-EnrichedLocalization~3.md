# Review of EnrichedLocalization (pull request #2269 at 2a6d75e)
Folder: `TauCetiRoadmap/ModelCategoryTheory/EnrichedLocalization/`
**Verdict:** needs changes

## R01 (P1) — The acceptance test does not build at the pin

**Location:** `TauCetiRoadmap/ModelCategoryTheory/EnrichedLocalization/Suggested.lean`:4 — `public import TauCeti.AlgebraicTopology.SimplicialSet.WeakHomotopyEquivalence`.

**Claim:** Gate rules `imports` (1) and `build` (3) fail: the module is not in the pinned Tau Ceti (2fd255d), so no declaration elaborates.

**Witness:** Pinned `TauCeti/AlgebraicTopology/SimplicialSet/` has `WeakEquivalence.lean` and `WeaklyContractible.lean`, no `WeakHomotopyEquivalence.lean`; the targeted build stops at "bad import".

**Repair:** Either import `TauCeti.AlgebraicTopology.SimplicialSet.WeakEquivalence`, add `open scoped SSet.modelCategoryQuillen` and write `HomotopicalAlgebra.WeakEquivalence` for `SSet.IsWeakHomotopyEquivalence` (a scratch copy with exactly this substitution elaborates, `sorry` the only warning); or delete the three declarations and name §3.2 in the docstring as not statable, lacking combinatorial weak homotopy equivalences.

## R02 (P1) — Supplier contract cites Tau Ceti declarations absent at the pin

**Location:** `README.md`:99–103 — "`SSet.IsWeakHomotopyEquivalence` (`TauCeti/AlgebraicTopology/SimplicialSet/WeakHomotopyEquivalence.lean`) … `CategoryTheory.EnrichedCat.category` (`TauCeti/CategoryTheory/Enriched/EnrichedCat.lean`)"; `Suggested.lean`:25–26.

**Claim:** Neither file exists at the pin, nor does `CategoryTheory.EnrichedFunctor.IsDwyerKanEquivalence`, which the docstring says Tau Ceti "has". The carrier of `Cat_S` has no supplier.

**Witness:** Pinned `TauCeti/CategoryTheory/Enriched/` contains only `NaturalTransformation.lean`, `OppositeFunctor.lean`, `TensorProduct.lean`; pinned `Mathlib/CategoryTheory/Enriched/EnrichedCat.lean`:32,111 gives `EnrichedCat` and its bicategory, no 1-category instance.

**Repair:** In "From Tau Ceti" keep `SSet.IsWeaklyContractible` and `TauCeti.tensorEnrichedCategory` (both present). Cite Mathlib `EnrichedCat`; make the ordinary category of S-enriched categories and Dwyer–Kan equivalences explicit targets of Part SimplicialCategories §5.1 and cite them there. Docstring: "neither Mathlib nor Tau Ceti has the category of enriched categories or its weak equivalences".

## R03 (P1) — §4.3.1 as reindexed excludes its own application

**Location:** `README.md`:1057 — "`B = {(a, b) ∈ Aᵒᵖ × A : a ≤ b}`"; :1090 — "a P defined on all of `Aᵒᵖ × A`, as in §4.4.3, restricts to it".

**Claim:** With spans functorial on `{a ≤ b}`, the arrows `(a,a) → (a′,a) ← (a′,a′)` for `a′ ≤ a` force `Z(a) → Z(a′)` to be an isomorphism in `hM`. §4.4.3's P has no map to X when `a < b`.

**Witness:** README's instance (`Y₀ = ∗`, `Y∞ = X = 2`, `Z = X^Y`): `P(0,∞) = 2 × 2 → 2` would need `e(f(0), y) = f(y)`; `f = (0,0), (0,1)`, `y = 1` give 0 and 1.

**Repair:** Restore `B = {(a, b) : b ≤ a}` in the statement and in hypothesis (i). Replace the route from "Index the comparison by B itself" to the end of :1091 by: "Let `T = {(a, b, c) ∈ Aᵒᵖ × A × Aᵒᵖ : c ≤ b ≤ a}` and `E(a, b, c) = Map(C, Z(a)) ×_{Map(W(c), Z(a) × Y(b))} Map(W(c), P(a, b))`, the left leg through `W(c) → C × Y(c) → C × Y(b)`. The projection `α : E → π_a^* G`, `G(a) = Map(C, Z(a))`, is a pointwise trivial fibration (§4.2.4 (a)); evaluation gives `β : E → π_c^* G′`, `G′(c) = Map(W(c), X)`, an equivalence at `(a, a, a)` by (ii) and §4.2.4 (b). Take homotopy right Kan extensions along `π_a : T → Aᵒᵖ` (Part SimplicialCategories §3.4): the comma poset at `a₀` retracts onto `Q = {a = a₀}` by `(a, b, c) ↦ (a₀, b, c)`; Q contracts through `(b, c) ≤ (a₀, c) ≥ (a₀, a₀)`, and `(b, c) ↦ c` has adjoint `c ↦ (a₀, c)` into `(A_{≤a₀})ᵒᵖ`, which has initial object `a₀`. So the extensions of E and of `π_c^* G′` are G and G′, and β at `(a₀, a₀, a₀)` identifies them." In the instance every `E(a, b, c) = Z(a)`, and the conclusion reads `4 ≅ 2 × 2`. Delete :1079–1091.

## R04 (P2) — The simplicial constructions have a second owner on main

**Location:** `README.md`:27–40 (Scope and ownership names no BordismFormalGroups); §§1.1–1.3, 2.1–2.2, 4.3–4.4.

**Claim:** BordismFormalGroups §F6.5 item 1, on main, plans chunks, the internal-hom comparison, `C[W⁻¹]`, the Grothendieck and product comparisons and the diagram homotopy-limit theorem for simplicial enrichment. A roadmap on main is the earlier owner.

**Witness:** Main `TauCetiRoadmap/BordismFormalGroups/README.md`:1623 (chunks), :1641 (HTT A.3.4), :1655 (`C[W⁻¹]`), :1667–1685 (Grothendieck, product), :1741 (HTT A.3.6).

**Repair:** Add to Scope and ownership: "BordismFormalGroups §F6.5 item 1 plans, for simplicial enrichment, model chunks, the internal-hom comparison, enriched localization, the Grothendieck and product comparisons and the diagram homotopy-limit theorem. The targets of §§1.1–1.3, §§2.1–2.2 and §§4.3–4.4 state these for an excellent base S; for S simplicial sets they are the §F6.5 targets." Add a "From TauCetiRoadmap.BordismFormalGroups" contract citing those passages.

## R05 (P2) — §3.3.1 drops the hypotheses its route and supplier need

**Location:** `README.md`:789 — "every functor `γ : C → M` from a small category into a model category has a cosimplicial resolution".

**Claim:** The route factors in the Reedy structure on `Fun(Δ, M)`; the supplier asks small limits and colimits, and naturality in c needs functorial factorizations. Neither is assumed.

**Witness:** Part ModelCategories §7.7.1: "a model category A with small limits and colimits"; pinned `Mathlib/AlgebraicTopology/ModelCategory/Basic.lean`:47–48,57–60 has finite (co)limits and `HasFactorization` only. Dug01a line 173 follows Hovey's conventions.

**Repair:** State §3.3.1 and §3.3.2 for combinatorial M (the case §3.4 uses). Route: "factor `∅ → const γ` in the Reedy structure on `Fun(Δ, Fun(C, M))`, `Fun(C, M)` carrying the projective structure (Part ModelCategories §7.2.1, §7.7.1); evaluation at c preserves Reedy cofibrancy". For `M = SSet`, γ the point, this still gives `Δ[•]`.

## R06 (P3) — Direction of the structure maps in the resolution API

**Location:** `README.md`:799 — "Each `Γ(c, n) → Γ(c, 0)` induced by `[0] → [n]` is a weak equivalence".

**Claim:** Γ is covariant in Δ (`Γ : C × Δ → M`, :790), so `[0] → [n]` induces `Γ(c, 0) → Γ(c, n)`.

**Witness:** For `Γ = Δ[•]`, `[0] → [n]` gives a vertex `Δ[0] → Δ[n]`; the map `Δ[n] → Δ[0]` comes from `[n] → [0]`.

**Repair:** "Each `Γ(c, n) → Γ(c, 0)` induced by `[n] → [0]` is a weak equivalence, and so is each `Γ(c, 0) → Γ(c, n)` induced by a vertex `[0] → [n]`".

## R07 (P3) — Section-level references with clause letters are ambiguous

**Location:** `README.md`:308–310 — "by §1.1 (b) assume `C' = U°` … enlarge to D-chunks (§1.1 (a))"; also :326, :329, :1104, :1168.

**Claim:** §1.1.3 and §1.1.5 both have clauses (a) and (b), so "§1.1 (a)" names two statements; "§1.2 (a)/(b)" has the same defect.

**Witness:** :195 "(a) For a chunk U and a family" (§1.1.3) and :245 "(a) For a small family" (§1.1.5).

**Repair:** Write the targets: :308 "§1.1.5 (b)", :309 "§1.1.3 (a)", :310 "§1.1.5 (a)" and "§1.1.3 (b)"; :326 "§1.2.3 (a)" and "§1.1.2"; :329 and :1104 "§1.2.3 (b)"; :1168 "§1.1.5 (a)".

## R08 (P3) — A sentence about the roadmap's own editing

**Location:** `README.md`:647–648 — "This is a large target: the argument it transposes occupies HA, pp. 498–501, and names no intermediate result, so it stays one statement."

**Claim:** This answers a question about how the target was cut; it is not mathematics and is not timeless.

**Witness:** The locator it carries is already at :649 ("HA, proof of Lemma 4.1.8.13, pp. 498–501").

**Repair:** Delete the sentence.

## R09 (P3) — The description's overlap list omits this Part's shared material

**Location:** Pull-request description — "**BordismFormalGroups §F6.5 item 1:** the Bergner model structure, the excellence … weak exponentials and Reedy structures."

**Claim:** The list leaves out what §F6.5 item 1 shares with EnrichedLocalization: chunks, the internal-hom comparison, enriched localization, the Grothendieck and product comparisons and the diagram homotopy-limit theorem.

**Witness:** Main `TauCetiRoadmap/BordismFormalGroups/README.md`:1623–1685 and :1741 against this README §§1.1–1.3, 2.1–2.2, 4.4.

**Repair:** Append to that bullet: "and, shared with Part EnrichedLocalization, model chunks and the internal-hom comparison (HTT §A.3.4), enriched localization with the Grothendieck and product comparisons (HTT §A.3.5) and the diagram homotopy-limit theorem (HTT §A.3.6)."

## Previous findings

- R01 — not repaired: `Suggested.lean`:4 unchanged (now R01).
- R02 — not repaired: `README.md`:101 still gives "`CategoryTheory.EnrichedCat.category` (`TauCeti/CategoryTheory/Enriched/EnrichedCat.lean`)" (now R02).
- R03 — not repaired: the BordismFormalGroups citation was removed, and Scope and ownership (:27–40) names no owner (now R04).
- R04 — not repaired: the three-index comparison was replaced by "`B = {(a, b) ∈ Aᵒᵖ × A : a ≤ b}`" and a section `s(a) = (a, ∞)`; the new hypothesis fails (now R03).
- R05 — repaired: :399–415 (mapping cylinder API, three Checks) and :796–814 (resolution API, three Checks); one direction slip, R06.
- R06 — repaired: :463–469 lists the three API facts as bullets.
- R07 — repaired: the coend at :821 is one code span; gate `tex=0`.
- R08 — repaired: the README cites no BordismFormalGroups target, so "Consumed from other roadmaps: none" agrees with the head; see R09.

## Verified sound

| Statement | Instances tried | Left side | Right side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| §1.1.1 chunk | `∅`; `{Δ[0]}`; `{∅}`; Kan complexes | (b) on `Δ[0] ⊔ Δ[0] → Δ[0]`: needs a mono into `Δ[0]` | none exists; `{∅}`: `∅ → ∅ → Δ[0]` works | `{Δ[0]}` rejected, others chunks | none |
| §1.1.4 C-chunk | countable Kan complexes; K free on uncountable set; `[1]_K` | cofibrant Z over `Δ[0]`: orbit of a vertex has size of K | values must be countable | not a C-chunk; K = ℕ is | none |
| §1.2.1 `P(U)`, τ | `Z = Ex^∞ S¹`; `Z = ∂Δ[1]` | diagonal fibre a point ⇒ `π₁`: ℤ → ℤ × ℤ onto | image is the diagonal, index infinite | diagonal not a fibration; discrete case is | none |
| §1.3.1 representability (headline) | A = SSet, `C = [0]_S`; `C = ∅` | classes of `A^C`: homotopy types; one point | `Hom_{hCat}([0], Kan)`: iso classes of `hKan`; one point | agree | none |
| §2.1.1 `C[W⁻¹]` | `W = ∅`; `[1]_S`, W its arrow; `BN`, W = {1} | C; `≃ [1]^∼ ≃ [0]`; `π₀ Map = ℤ` | collapse along `[1] → [0]` would give `[0]` for BN | distinguishes gluing E | none |
| §2.1.3 cylinder | `id_∗`; `∅ → D`; `∗ → {0,1}` | `[1]_S`; D; one non-identity arrow `X → 0` | symmetrized: `[1]^∼`; all-`𝟙`: two arrows | agree with Checks | none |
| §2.2.3–2.2.5 (headline A.3.5.15) | A = `{0<1}`, p = id of `[0]`; A a point; A discrete | Groth = `[1]_S`, W(p) = 3 arrows, localization `≃ [0]` | hocolim of constant point on contractible poset = point | agree | none |
| §2.3.1 homotopy limits | J empty; J a point | limit `[0]_S`, `Map = 𝟙` terminal; `Map_C` itself | holim of empty diagram in S terminal; same | agree | none |
| §2.4.3–2.4.5 sifted | terminal object; two-point discrete; `{1 ← 0 → 2}`; `Δᵒᵖ` | cospans: terminal object; empty; empty; simplices of `Δ[m] × Δ[n]` | contractible; not; not; contractible | matches HTT 5.5.8.1 via Thm 4.1.3.1 | none |
| §3.1.1, `IsLocal`, `localEquivalences` | S = `{∂Δ[1] ⊆ Δ[1]}`, `{∅ ⊆ Δ[0]}`; Z = ∅, `Δ[0]`, `Ex^∞ S¹` | `Z → Z × Z`: ∅ → ∅, pt → pt, `π₁` ℤ → ℤ² | w.e.: yes, yes, no; second S: ∅ → pt no | local: ∅ and contractible / contractible only | R01 (import) |
| §3.2.1 `exists_localizedModelCategory` (headline) | S = ∅; S = `{∅ ⊆ Δ[0]}` | W = w.h.e., fibrant = Kan; W = all maps, fibrant = contractible Kan | Kan–Quillen; monos ∩ all maps generated by a small J | consistent; left properness and □ clauses hold for both | R01 |
| §3.3.1 resolution | `Δ[•]`; constant `Δ[0]`; constant ∅ | latching in degree 1: `∂Δ[1] ⊆ Δ[1]`; `2 → 1`; `∅ → ∅` | cofibration: yes; no; yes | distinguishes Reedy cofibrancy | R05, R06 |
| §3.3.2 coend | `C = ∗`, `X = Δ[m]`; finite sets, X = ℕ | `Δ[m] ⊗_Δ Γ = Γ(m)`; m = 0 gives `Γ(−,0)` | countable coproduct of 1 absent in finite sets | Yoneda composite correct; colimits needed | R05 |
| §3.4.4–3.4.5 Dugger (headline) | M = SSet, C a point, S = ∅ | `U C` = SSet, L = id | Quillen equivalence id; left proper, simplicial | agree with Dug01b Thm 1.1, Cor 1.2 | none |
| §4.1.1 weak exponential | X fibrant, `Y = Δ[0]`, `Z = Δ[0]`; `Y = ∅` | `[W, pt] → [W, X]` bijective for all W | forces X contractible; `Y = ∅`: `[Z]` terminal | `Δ[1]` yes, `∂Δ[1]` no | none |
| §4.2.1 multiplication | SSet; pointed SSet, two-point poset, `F = ∗`, `F′ = Y` | `colim F′ = Y ∨ Y` | homotopy product `∗ × Y = Y` | fold is a w.e. only for contractible Y | none |
| §4.2.4 mapping-space form | M = SSet, `P = Map(Y,X) × Y`, `W′ → W × Y` | `E(W, W′) ≅ Map(W, Map(Y, X))` | `Map(W′, X) ≃ Map(W × Y, X)` | equivalence by adjunction | none |
| §4.3.1 with `B = {a ≤ b}` | A₀ two points, `Y₀ = Y₁ = ∗`, `Y∞ = X = 2`, `Z = X^Y` | needed `e : P(0,∞) = 2 × 2 → 2` with `e(f(0), y) = f(y)` | `f = (0,0), (0,1)`, `y = 1`: 0 ≠ 1 | no such P; hypotheses force `Z(a) ≅ Z(a′)` | R03 |
| §4.3.1 with `B = {b ≤ a}` and T | same instance | `E(a, b, c) = Z(a)`; `G(∞) = 4` | `holim G′ = Map(Y₀, X) × Map(Y₁, X) = 2 × 2` | `4 ≅ 4`; Q: 5-point zigzag-contractible poset | R03 repair |
| §4.4.3–4.4.4 (headline A.3.6.18) | `C_a = ∅`, `C_{a′}`= `[0]`; evaluation leg | `P(a, b) → U_f[W⁻¹]` needs `C_b → C_a` | exists only for `b ≤ a` | route needs HTT's indexing | R03 |

- Source locators checked against the text: 70 (HTT 58: Def. A.3.4.1–Lemma A.3.4.15, Notation A.3.5.1–Thm. A.3.5.15, Def. A.3.6.1–Cor. A.3.6.18, §A.3.7 to Prop. A.3.7.6, A.3.2.27–28, Thm. 4.1.3.1, 5.5.8.1–7; HA 3; Dug01a 4; Dug01b 8; Riehl 1, Cor. 13.2.4); all statement numbers, pages and hypotheses agree.
- Library declarations opened at the pin: `ModelCategory` (`Mathlib/AlgebraicTopology/ModelCategory/Basic.lean`:43), `SSet.KanComplex` (`…/SimplicialSet/KanComplex.lean`:40), `MonoidalClosed.pre` (`…/Monoidal/Closed/Basic.lean`:241), `MorphismProperty.IsSmall` (`…/MorphismProperty/IsSmall.lean`:35), `HasSmallObjectArgument` (`…/SmallObject/Basic.lean`:88), `ReedyStructure` (`…/Reedy/Basic.lean`:45), `EnrichedCat` (`…/Enriched/EnrichedCat.lean`:32), `TauCeti.tensorEnrichedCategory` (`TauCeti/CategoryTheory/Enriched/TensorProduct.lean`:97), `SSet.IsWeaklyContractible` (`TauCeti/AlgebraicTopology/SimplicialSet/WeaklyContractible.lean`:19).
- Cross-roadmap citations resolved at the head: 55 target ids (23 ModelCategories, 7 KanQuillen, 25 SimplicialCategories) plus ModelCategories §8.2, §8.3, KanQuillen §3.5, §3.6 and SimplicialCategories §5.3; none missing.
- Gate at this head (worker): `imports=1 build=3 FAIL`, every other rule 0. Dependency check: `depcheck: 261 roadmaps, 2594 edges, 0 problem(s)`. Changes outside the family folder: 0.
- Elaboration: the head stops at the import (R01). A scratch copy with R01's substitution elaborates with `sorry` as the only warning; `#check @IsLocal`, `@localEquivalences`, `@exists_localizedModelCategory` show `S`, `[S.IsSmall]` and `S ≤ monomorphisms` explicit, as README §3.2.1 states.
- Padding probe: `first | simp | rfl | infer_instance | exact ⟨_, rfl, rfl⟩` does not close `exists_localizedModelCategory`. Headlines: §1.3, §2.2.5, §3.4, §4.4 are named in the docstring with their missing carriers; §3.2 is stated for simplicial sets.
- Overlap check: read BordismFormalGroups §F6.5, StableHomotopyKTheory and GeneralAlgebraicKTheory (scope sections, main) and the #2270 hits for LimitsAndKanExtensions, InfinityCategoryFoundations, PresentableInfinityCategories, Straightening, PresheavesAndCompletions, DerivedInfinityCategories; chunks, enriched localization, Grothendieck/product comparison and the diagram homotopy-limit theorem: BordismFormalGroups §F6.5 (R04); Bousfield localization of model categories and Dugger's theorem: this Part (BordismFormalGroups §F6.1 is spectral only); the #2270 Parts cite this Part and own none of it.
- Source independence: 10 passages compared with 4 sources (HTT, HA, Dug01a, Dug01b), none shared beyond formulas; largest share HTT, 182 of 214 locators; contents compared with HTT: independent (Layers 1, 2, 3, 4 meet §A.3.4, §A.3.5 with A.3.2.27–28 and HA 1.3.4.10, §A.3.7 with Dugger, §A.3.6; Layer 3 before 4 is forced by §4.3.1 needing §3.4.5).
- Research link: Layers 1, 2 and 4 are the appendix results Lurie (2009) uses for straightening and for limits of ∞-categories; Layer 3 is Dugger's (2001) presentation theorem, behind HTT Prop. A.3.7.6 on presentable ∞-categories. Rests on the README's headline list and on HTT §A.3.7 as read.

## Not verifiable

- DK80 §7 (§2.4.1): the sources service resolves only the paywalled publisher page (uncertified); the locator and the statement were not compared with the text.
- Riehl's printed pages 177–178: read in the author's PDF, where Cor. 13.2.4 is on PDF page 194; the printed pagination was inferred from the contents page, not seen.
- The head's own signatures: the worker's build and signature extraction stop at the absent import; only the substituted scratch copy was elaborated.

## Source issues

- **Error** in HTT at Proposition A.3.6.15, proof, printed p. 903: the source says the fibre-product diagram is defined on pairs with a ≥ b using a map from W(a) towards Y(b); it should use an index c ≤ b ≤ a for W, since Y is covariant; affects the proof.
- **Misprint** in HTT at Lemma A.3.6.14, printed p. 902: the source says G is a diagram on A; it should be a diagram on the opposite poset, as pullback along the first projection requires; affects a stated result.
- **Misprint** in HTT at Notation A.3.4.7, printed p. 886: the source says assumption (a) of Proposition A.3.4.1; it should be Definition A.3.4.1; affects nothing.
- **Misprint** in HTT at Lemma A.3.4.15, proof, printed p. 891: the source says the second factor of G is an injective trivial cofibration; it should be a projective trivial fibration; affects the proof.
- **Misprint** in HTT at Corollary A.3.6.18, printed p. 905: the source says the limit term is the localization of all diagrams on C_∞; it should be of the projectively fibrant ones, as in the other terms; affects a stated result.
- **Misprint** in HTT at Proposition A.3.6.10, proof, printed p. 900: the source says the last map of the displayed composite ends at the class of P; it should end at the class of X; affects the proof.

## For the human reviewers

- **Scope.** The description asks maintainers to choose the owner of the material BordismFormalGroups §F6.5 item 1 (main, `README.md`:1539–1800) shares with this family; open #1807 moves the same material to GeneralizedCohomology §G2.11. R04 assumes main stays the owner.
- **Licence.** DK80 is cited by locator only (paywalled, uncertified). HTT, HA and Riehl were read from their authors' pages, Dug01a and Dug01b from arXiv v1.
- **Pin.** R01 and R02 disappear if the Tau Ceti pin is bumped to the commit the description names (8b9f13d993); that bump is outside this pull request and was not tested here.
