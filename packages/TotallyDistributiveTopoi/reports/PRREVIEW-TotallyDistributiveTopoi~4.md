# Review of TotallyDistributiveTopoi (pull request #1927 at 164f2f4)

**Verdict:** accepted

There are no findings. This is an incremental re-review of the 102 lines changed in the roadmap folder since ebcea05 (25 inserted, 77 deleted, in `README.md` and `Suggested.lean`). Both findings of the previous review are repaired, and the repairs introduce nothing new. The gate passes and `Suggested.lean` elaborates with only `sorry` warnings.

## Previous findings

- R01 — repaired: target 2.6 and `exists_himp_subobject_pullback` are deleted. Scope (lines 36–37) now ends Layer 2 at "with the site-level characterizations (Layer 2)". A grep of README and Lean for `Heyting`, `himp`, `Freyd`, `Frobenius`, `Subobject`, `⇨` and `2.6` finds nothing.
- R02 — repaired: README lines 300–302 now read "the transpose of `η` under `π₀ ⊣ Δ` is the identity, so `π₀` of each pullback projection `F_x ⟶ F` is constant at `x`, and `π₀ F ≅ ∐ₓ π₀ F_x` makes each `π₀ F_x` a point".

## Verified sound

**What changed.** The diff (`changes.md`) touches these passages:
- the Summary (lines 23–25);
- Scope, Owned here (lines 32–40);
- the Mathlib "Categories" contract, which drops `Subobject`, `Subobject.pullback` and `Subobject.exists` (lines 115–116);
- the GrothendieckTopoi 1.2 contract (lines 125–126);
- How to read the build (lines 141–148);
- the 2.2 route (lines 300–305);
- the deletion of 2.6;
- the Dependencies of Layer 2 (lines 431–432);
- the deletion of the Freyd reference;
- the deletion of the Lean theorem.

Each passage was read in full, together with what cites it or what it cites:
- Layer 2 *Needs:* lines: 2.2 still needs GrothendieckTopoi 1.2.
- The Lean `Site` section.
- GrothendieckTopoi at its head.
- Every roadmap that cites this one.

**Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/TotallyDistributiveTopoi'` is empty. The pull request changes only `README.md`, `Suggested.lean` and `metadata.toml` in its folder. The files outside the folder listed in `changes.md` come from the merge of main into the branch (164f2f4 is that merge commit), not from this pull request.

**Gate.**
- I ran the gate on this head with `--base origin/main`. Every check reports 0 and the result is OK:
  - set_option, blob, latex, tex, prnum;
  - sorry-data, sorry-examples, residue, private-paths;
  - imports, mathlib-subimports, no-import-mathlib, lean-lines;
  - statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences;
  - layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder, source-material.
- The worker's gate at the same head also reports `build=0`.

**Dependency check.** Output: `depcheck: 239 roadmaps, 2352 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. The only supplier is GrothendieckTopoi, an open new-roadmap pull request named in the description's depends-on list. Within Layer 2 the *Needs:* edges remain acyclic: 2.2–2.5 use 2.1, 2.4 uses 2.3, and 2.5 uses 2.4. That matches the new Dependencies text at lines 431–432.

**Elaboration.**
- `lake env lean` on `TauCetiRoadmap/TotallyDistributiveTopoi/Suggested.lean` exits 0 with exactly 20 `sorry` warnings, at lines 52, 71, 86, 93, 132, 140, 147, 155, 164, 183, 189, 195, 206, 211, 215, 220, 224, 229, 240 and 249. There is no other message.
- The file has 30 declarations: 10 definitions and 20 theorems, down from 31 with the removal of `exists_himp_subobject_pullback`.
- Form: one `public import Mathlib`, no `set_option`, no sorry'd data, `theorem` throughout. The `Site` section still binds only `C`, `[SmallCategory C]` and `J`, so nothing else depended on the deleted theorem.

**Signatures.** I added `#check @name` for all 30 declarations to a scratch copy and elaborated it once. Each elaborated type is the one the README states:
- `ι : Type u` with `L : Type u` on the Layer 1 theorems;
- `[J.Subcanonical]` only on `productsPreserveEpis_and_distrib_iff`;
- `[CompleteLinearOrder L] [DenselyOrdered L]` on `not_isCompletelySupPrime`;
- `[Projective P]` on `nonempty_isInitial_of_projective_sh_lowerIco`.

Nothing changed relative to the previous review apart from the deletion. `signatures.md` flags four definitions as "dropped `[Category.{u} E]`" (`ProductsPreserveEpis`, `ProductsDistribOverCoproducts`, `IsTotallyDistributive`, `IsPresheafTopos`). Those leads are false: the binder is present as `[inst : Category.{u_2, u_1} E]`.

**Padding probe.** In the same scratch copy, each of the 20 theorem bodies was replaced by `by first | rfl | infer_instance | simp | decide`. The result was 20 errors, one at each body (lines 56–250 of the copy), so none closes. No declaration restates a definition, mirrors a Check or computes a value.

**Headlines.** The Summary's end theorems (lines 9–25, now ending with 4.1) are each stated in `Suggested.lean`, with two exceptions:
- The localic forms of 3.4 are named as not statable in the module docstring. They need GrothendieckTopoi 7.1's `Frame.grothendieckTopology`, which is absent at the pin.
- The two one-line corollaries are named there too (`Sh ℝ` satisfies (B); a completely distributive frame is locally connected).

The deleted 2.6 was not a headline of the Summary's subject. Its removal leaves the docstring accurate.

**Supplier citations touched by the change**, resolved at GrothendieckTopoi's head 7d5de30 (the same head the previous review read):
- GrothendieckTopoi README §1.2 (lines 291–292) states `Balanced E` and "every morphism into an initial object is an isomorphism", each first for `Sheaf J (Type u)`. That is exactly the narrowed contract at lines 125–126. Those are the two facts the 2.2 route uses: an `Hom(Q, −)`-inverted map is mono and epi, hence iso; and `A ⟶ Δ ∅` is an isomorphism.
- Its Scope (line 69) cites this roadmap's §§2.4–2.5 and 3.5. Its Downstream consumers (lines 1471–1475) list 1.1, 1.2, 1.4, 2.3, 5.2, 5.6, 6.5 and 7.1 as consumed here, and cite this roadmap's 2.4 and 3.5. Nothing cites the deleted 2.6.
- `roadmaps grep 'exists_himp_subobject_pullback'` finds no match on main or at any open head. `roadmaps grep 'TotallyDistributiveTopoi'` finds only GrothendieckTopoi's four lines above.
- Lean names in GrothendieckTopoi's `Suggested.lean`:
  - `IsGrothendieckTopos` (102);
  - `isGrothendieckTopos_iff_giraudAxioms` (164);
  - `GeometricMorphism.IsEssential` (428);
  - `GeometricMorphism.isEssential_iff_preservesProducts` (434), which is the `citations.md` lead for README line 55;
  - `exists_equiv_presheaf_iff_essential_points` (466);
  - `epi_piMap_presheaf` (478);
  - `isIso_sigma_pi_presheaf` (484);
  - `Frame.grothendieckTopology` (496).

**Library declarations opened at the pin** (Mathlib under `.lake/packages/mathlib`):
- `constantSheaf` is `Functor.const Cᵒᵖ ⋙ presheafToSheaf J D` (Sites/ConstantSheaf.lean:64). It is a left adjoint to evaluation at a terminal object (`constantSheafAdj`). Hence `Δ` preserves coproducts, which gives `Δ(π₀ F) ≅ ∐_{π₀ F} ⊤`. It also preserves the terminal object, because `presheafToSheaf` preserves finite limits (Sites/Sheafification.lean:77).
- The `HasColimitsOfShape K (Sheaf J D)` instance (Sites/Limits.lean:214) is the anonymous `Sheaf.instHasColimitsOfShape`, the `citations.md` lead for README line 113. The Lean file uses it at line 34 and elaborates.
- `CompletelyDistribLattice.MinimalAxioms` (Order/CompleteBooleanAlgebra.lean:118) is unchanged.

**Ownership and overlaps.** For this roadmap's objects, `roadmaps grep` searched main and the open heads for:
- `IsPresheafTopos`, `ProductsPreserveEpis`, `ProductsDistribOverCoproducts`;
- "totally distributive", "completely join-prime", `IsConnectedElem`, `LowerIco`;
- "product(s) of epimorphisms", "essential subtopos", "completely distributive".

None of them has another owner. The other hits:
- GrothendieckTopoi 6.5 states only the presheaf instances, as the Scope says.
- EnhancedDerivedSheaves (on main and at its open heads) states countable products of epimorphisms in a replete topos. That is a different hypothesis and a different index size.
- ClassifyingTopoi, a new neighbour in `overlaps.md`, owns geometric logic and classifying topoi. It hands nothing to this roadmap and claims none of its objects.

`overlaps.md`: no other open pull request changes this roadmap; nothing cited here is dropped; nothing dropped here is cited elsewhere.

**Seeded sample.** None of the sampled targets is in a changed passage: the sample is 1.1–1.4, 2.1, 2.3–2.5, 3.1 and 3.3–3.6, 4.1 and 4.2, and the diff touches 2.2, the frame text and the deleted 2.6. No reference entry other than Freyd's changed, and Freyd's was deleted. The source checks of the review of ebcea05 therefore stand:
- Raney 1952: Theorem 1, Definition 5, Theorem 2, §4 and §5.
- Lucyshyn-Wright arXiv:1108.4032v3: §1.1, §1.5, Theorem 1.5.3, Theorem 1.5.5, Remark 1.5.6, and Propositions 2.2, 5.1 and 5.3.

The README flags no locator as unverified.

**Adversarial table.** New rows carry values computed in this review. Carried rows are from the review of ebcea05 for statements this diff leaves untouched; they cite that report and repeat its computed values.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| **2.2 decomposition route (new text, lines 300–302)** | `Sh` of the two-point discrete space `{a, b}`, `F = (F_a, F_b)`; `Sh ℝ`, `F = Δ Bool`; `F` initial | Two points: `π₀(G_a, G_b) = G_a ⊔ G_b` and `Δ S = (S, S)`. `η_F` is the pair of inclusions. Its transpose `ε ∘ π₀ η_F` is `𝟙` on `F_a ⊔ F_b` (triangle identity). For `x ∈ F_a`, `F_x = ({x}, ∅)` and `π₀ p_x : {x} → F_a ⊔ F_b` hits `x`. `c_x = Δ(x)` transposes to `x ∘ !` on `π₀ ⊤ = {a, b}`, constant at `x` even though `π₀ ⊤` is not a point. `∐ₓ π₀ F_x = ∐ₓ {x} → F_a ⊔ F_b` is a bijection, so each `π₀ F_x = {x}`. `Sh ℝ`: `π₀ ⊤ = pt`, `π₀ Δ Bool = Bool`, `F_true = ⊤` with `π₀ F_true = pt`. Initial `F`: `π₀ F = ∅`, giving the empty coproduct | true | none |
| **GrothendieckTopoi 1.2 contract (narrowed, lines 125–126)** | Uses in 2.2 | Balanced: a map inverted by every `Hom(Q, −)` is mono and epi, and is iso by GrothendieckTopoi README line 291. Strict initial: `A ⟶ Δ ∅`, with `Δ ∅` initial because `Δ` is a left adjoint, is iso by line 292. Nothing in 2.2–4.2 uses subobject lattices (grep `Subobject`: 0 hits) | true | none |
| **Summary end theorems (lines 9–25) vs `Suggested.lean`** | Each clause | 1.2, 1.3, 1.4 (two theorems), 2.2, 2.3, 2.4 (two theorems), 2.5, 3.1, 3.2, 3.3, 3.5 (three theorems), 3.6 (three theorems), 4.1 and 4.2 are declared. 3.4 is named in the docstring. No clause refers to 2.6 | true | none |
| **Deletion of 2.6** | Cross-references | README and Lean: 0 hits for `2.6`, `Heyting`, `Freyd`. Other roadmaps: 0 hits for `exists_himp_subobject_pullback` | true | none |
| 1.1 `IsCompletelyDistributive` (carried) | `ι = PEmpty`; `κ i₀ = ∅`; `Opens ℝ` family; `unitInterval` | `⊤ = ⊤`; `⊥ = ⊥`; LHS `ℝ`, RHS `∅`; chain: `d < LHS` gives `RHS ≥ d` | true | none |
| 1.2 `isCompletelyDistributive_iff_le_sSup_iInter` (carried) | `ι = ∅`; non-lower pair in `unitInterval` | `⋂ = univ`, `sSup = ⊤`; sups `1, 1` with `⋂ = ∅`, so the lower-set hypothesis is needed | true | none |
| 1.3 `isLocallyConnected_iff` (carried) | Two-point discrete; Cantor; `Opens ℝ` | `{a}`, `{b}` connected and `⊤` not; Cantor: join of connected elements is `⊥ ≠ ⊤`; `ℝ` is locally connected and not completely distributive | true | none |
| 1.4 Raney; `not_isCompletelySupPrime` (carried) | Trivial `L`; `Bool × Bool`; `unitInterval` | `≅ LowerSet PEmpty`; two atoms, `≅` a 2-antichain; no prime, `sSup (Iio a) = a` | true | none |
| 2.1 (A), (B), predicates (carried) | `Type u`; `AddCommGrpCat`; `ι = ∅`; `K i₀ = ∅` | `9·\|A\|²` both sides; rank 18 vs 6; `1 ≅ 1`; `∅ = ∅`; `Ab`: `0 = 1`, not a presheaf topos | true | none |
| 2.2 `productsDistribOverCoproducts_sheaf_iff` (carried) | `Sh ℝ`; Cantor | `Δ Bool = ⊤ ⨿ ⊤`; on Cantor, `Γ(∏ₙ Δ Bool) ∋ id` is not locally constant | true | none |
| 2.3 `isRightAdjoint_presheafToSheaf_iff` (carried) | `J = ⊥`, `⊤`; `Opens ℝ`; `SingleObj (Multiplicative ℕ)` | `a = 𝟭`; `≌ PUnit`; `⋂ Sₙ` is the sieve of `∅`; `⋂ {m ≥ n} = ∅` | true | none |
| 2.4 both statements (carried) | `SingleObj (Multiplicative ℕ)`; `Opens ℝ`; `LowerIco` | Sheaves `≌ PSh(Bℤ)` while the cover intersection is empty, so subcanonicity is needed; intersections and (A) both fail; covers of `[0, a)` contain every `[0, b)` | true | none |
| 2.5 `isTotallyDistributive_sheaf_iff` (carried) | `Type u`; `Sh ℝ`; `Sh LowerIco` | `c = ev_PUnit`; total but not (A); both hold | true | none |
| 3.1–3.3 spatial forms (carried) | `PEmpty`; `ℝ`; discrete; Sierpiński; `ℚ`; Cantor | One object; both sides fail; `Set X`; primes `{o}`, `X`; not locally connected, so (B) fails | true | none |
| 3.5 `LowerIco` (three theorems, carried) | Opens; terminal sheaf; projective `P` | `⋃ Iio aₙ = Iio (sup aₙ)`; `∐_{c<1} [0, c) ⟶ ⊤` has no section; summand `(c, z, c′)` gives `c ≤ c′ < c` | true | none |
| 3.6 Cantor and `ℝ` (carried) | Clopen `V`; connected `W ⊆ ℝ` | Finite disjoint refinement glues; `W` lies in intervals of every length `1/(n+1)`, so `W = ∅` | true | none |
| 4.1, 4.2 (carried) | `Type u`; `Sh LowerIco`; Cantor; `Sh ℝ` | Both hold; projectives are only `0`; enough projectives without (B); (B) without enough projectives | true | none |

**Remarks** (no change asked of this folder):
- The pull request description still lists "continuous `ℤ_p`-sets" among the examples of (B) without (A). The README no longer contains that example, and the description could follow it.
- Stability of `⇨` under pullback is not yet stated in GrothendieckTopoi 1.2 at 7d5de30. Nothing here uses it; adding it there is a matter for that roadmap's own review.

## Not verifiable

- **Published Lucyshyn-Wright.** JPAA 216 (2012), doi:10.1016/j.jpaa.2012.03.018, resolves only to a paywalled page. Its locators were checked against arXiv:1108.4032v3, as the README states. They are unchanged in this diff.
- **SGA 4 IV, Exercice 7.6.** It is reached only through GrothendieckTopoi's citations and was not opened.
- **The Buffalo 1973 recording** (Research context) is a video, not a text. No target depends on it.
- **Zbl 0049.30304** was not opened.
- **2.3, 2.4 (first statement) and 3.4** are presented as the roadmap's own, with proofs. They have no literature locator, so they were checked only by the routes and instances in the table above.

## Source issues

- none
