# GATE-PolynomialGaloisGroups~1: answers to the review of `b6c345d`

Commit `82f088f1` on the pull-request branch (not pushed). Files: `TauCetiRoadmap/PolynomialGaloisGroups/README.md`, `TauCetiRoadmap/PolynomialGaloisGroups/Suggested.lean`.

## H01 (roed-math) — applied

README Layer 1, "Imprimitivity gives a wreath embedding": the old text claimed that every transitive action with a nontrivial block embeds in `WreathProduct (Perm B) (block system)`. It now says the homomorphism is unconditional, is injective exactly when the action is **faithful**, and that only then does the block-system kernel embed in `∏ Perm(block)`. The `C₃ × C₄` counterexample is recorded as a negative Check (|G| = 12 against `2²·2 = 8`; kernel of order 6 against 4). In Lean, `toWreathProduct_injective` carries `[FaithfulSMul G α]` and is closed by Tau Ceti's `MulAction.IsBlock.toWreathProduct_injective_iff`, which proves the same "injective ↔ faithful" equivalence at the pin.

## H02 (roed-math) — applied

README Layer 1, product action: the old hypotheses were "primitive, not regular, |Λ| ≥ 3, ι finite and nonempty". They are now "**faithful**, primitive and not free on a nontrivial Λ, with ι finite", which are the hypotheses of `TauCeti.WreathProduct.isPreprimitive_product`. The `C₂ × C₃` on `C₃` counterexample is written out as a Check: a base element `(a,b)` sends the diagonal coset of `c` to the coset of `c + b − a`, and the swap sends it to the coset of `−c`. In Lean, `isPreprimitive_productAction` has `[FaithfulSMul D Λ]` and is closed by the Tau Ceti theorem.

## H03 (roed-math) — applied

Old `disc(x⁵ − x) = 256`, new `−256`, at README Layer 4 (the ⚠ collision paragraph) and in the Worked-examples non-examples. The Lean docstring that carried 256 was removed together with the inherited collision `example` (see H11). Check: for `x⁵ + ax + b`, `disc = 5⁵b⁴ + 4⁴a⁵`, which at `a = −1, b = 0` gives `−256`; the sign also follows from the one complex-conjugate pair among the roots `0, ±1, ±i`. The sextic `(X − 2)⁴(X² + 16)` was re-expanded to `X⁶ − 8X⁵ + 40X⁴ − 160X³ + 400X² − 512X + 256`, which is Dummit (2′) at `a = −1, b = 0`, so that example stays.

## H04 (roed-math) — applied

Worked examples, quartic table, `4T1` row: the discriminant entry changed from "a square" to "`125`, not a square". Check: `disc Φ_p = (−1)^((p−1)/2) p^(p−2) = 5³`. The other rows were recomputed with `disc(x⁴ + ax + b) = −27a⁴ + 256b³` and `disc(x⁴ + b) = 256b³`, giving 229, 576², −2048 and 256 = 16². They agree with the table.

## H05 (roed-math) — applied

Layer 10 step 1 no longer has the target `RadicalConverse.exists_normal_prime_index_subgroup` or the instructions for re-proving it. It now consumes `Group.IsSolvable.exists_normal_index_prime` from `TauCeti/GroupTheory/Solvable.lean`, line 78 at the pin, with the hypotheses `[Finite G] [Group.IsSolvable G] [Nontrivial G]`. The Layer 10 *Needs:* line, the "What Mathlib provides" list (five lemmas used only by the deleted helper are gone) and the order-of-work row were updated. `Suggested.lean` imports `TauCeti.GroupTheory.Solvable` and pins the lemma with `#check`.

## H06 (roed-math) — applied

README Layer 0, "Transport of the root dictionary across a base-field isomorphism": the old text asked for the root–embedding equivalence to be built from `IsAdjoinRoot.liftHom`. It now consumes `TauCeti.rootSetEquivAlgHomAdjoin` under the pulled-back scalar structure, together with `rootSetEquivAlgHomAdjoin_apply_gen` and `rootSetEquivAlgHomAdjoin_symm_apply` (`TauCeti/FieldTheory/IntermediateField/Adjoin/Embeddings.lean`, lines 36–58). The only new work it lists is the coefficient transport and its compatibility statements. The *Needs:* line names the Tau Ceti module, and `Suggested.lean` pins the declaration with `#check`.

## H07 (roed-math) — applied

README Layer 6, degree-5 route, step 4: the old text said "kernel has order 5". It now says the image in `S₄` has order at most 24, so `|ker| ≥ 120/24 = 5`, and the kernel is the core of the order-30 subgroup, so `|ker| ≤ 30`. The normal subgroups of `S₅` have orders 1, 60 and 120, and none lies in `[5, 30]`.

## H08 (roed-math) — applied

The References entry for Kappe–Warren no longer says that its two quadratics are the factors of `f` over `K(√Δ)`. It now says their roots are pair sums and pair products (Conrad (4.2), (4.3); `ConradCubicQuartic` lines 457–465). It also gives the `Φ₅` witness: the resolvent cubic `X³ − X² − 3X + 2` has `r′ = 2`, and the second quadratic is `(X − 1)²`. The reducibility form that Layer 4 states is now cited to Conrad, Theorem A.1 (`ConradCubicQuartic` lines 813–823, pp. 16–17), in a new entry. The source table row and the Cohen entry also point to Theorem A.1.

## H09 (roed-math) — applied

README Layer 6, classification theorems: "for each `n ≤ 5`" is now "for each `n` with `1 ≤ n ≤ 5`". The text gives the reason: `Fin 0` is pretransitive in Mathlib's sense while `TransitiveGroupIndex 0 = Fin 0` is empty. The polynomial form in Lean, `existsUnique_hasGaloisLabel_of_natDegree_le_five`, takes `Irreducible f`, which forces degree ≥ 1. It is stated with `sorry`.

## H10 (roed-math) — applied

`def TschirnhausAdmissible … := sorry` is deleted, along with the eight other sorry'd data definitions (`referenceSubgroup`, `tschirnhausPolynomial`, the three `ResolventSpec` instances, `registeredResolvent`, and the two order isomorphisms). The native `Polynomial.TschirnhausAdmissible` at the pin (`TauCeti/RingTheory/Polynomial/Tschirnhaus.lean`, line 406) is exactly `Set.InjOn (fun a ↦ aeval a T) (f.rootSet f.SplittingField)`, the definition the reviewer proposed. The headline `exists_le_map_conj_of_isRoot_tschirnhaus` is stated on it and closed by the Tau Ceti proof.

## H11 (roed-math) — applied

`Suggested.lean` keeps no local stand-ins. Each carrier of Layers 0–9 is the Tau Ceti declaration: `referenceSubgroup` and the label data, `HasGaloisLabel`, `ResolventSpec` with `quinticF20Spec`, `fullCycleType`, `WreathProduct`, `factorDegrees`, `QuinticCertificate`, and `HasFullSymmetricGaloisGroup`. The headline theorems are stated on these carriers and, where Tau Ceti proves them, closed by those proofs. The README "Names" section now lists each carrier with its Tau Ceti name and file. The import of `TauCetiRoadmap.NumberFieldArithmetic.Suggested` is replaced by Tau Ceti modules, since the supplied Dedekind theorem is at the pin as `TauCeti.NumberField.exists_gal_fullCycleType_eq_factorizationType`. The contract section says so. The file went from 1338 lines to 200, with 13 headline theorems, 3 of them `sorry` and 10 closed.

## H12 (roed-math) — applied

The claim "the layer numbering is a topological order" was false. The registered specifications name `referenceSubgroup`, and the quartic table and the quintic criterion read the transitive subgroups of `S₄` and `S₅`, all of which are Layer 6 material. Order of work now splits Layer 6 into a pure-group part, which depends only on Layer 1, and a field part, which depends on Layers 2–5. The table rows and the acyclicity rule were updated to match. The three Layer 4 *Needs:* lines now cite that part, with the pinned suppliers `TauCeti.referenceSubgroup`, `TauCeti.existsUnique_transitiveGroupLabel_four` and `TauCeti.existsUnique_transitiveGroupLabel_five`.

## H13 (roed-math) — applied

Milne, *Fields and Galois Theory* v5.10, is added to References and cited in Layer 10 by locator: Proposition 5.27 (`MilneFT` line 3267), Lemma 5.33 (line 3400), Theorem 5.34 (line 3409) and Proposition 4.16 (line 2217). The numbering was checked in the version read.

## H14 (roed-math) — answered

Confirmed on main: BelyiMaps §1.6 reads labels "for `n ≤ 11`", and its supplier table cites PolynomialGaloisGroups "Layers 6, 7". This roadmap has no Layer 7, and its scope excludes degrees 6–11. The BelyiMaps file is outside this pull request. The export section of this README now says the export is the Layer 6 label data for `1 ≤ n ≤ 5` only, and that labels in degrees 6–11 need another supplier. Narrowing the BelyiMaps contract is a change to BelyiMaps.

## H15 (roed-math) — answered

The corrections from the separate archive pull request that the review asks for (H01–H04, H07–H09) are now in this head on their own terms. Nothing here waits on that pull request, and the README cites none.

## Adversarial pass (changed or added statements)

| statement | instances tried | values | result |
|---|---|---|---|
| `toWreathProduct_injective` | `C₃×C₄` on `ℤ/4`, `B={0,2}` (unfaithful); `S₃` on 3 points, `B` a singleton; trivial group on one point | 12 vs 8 (unfaithful case is excluded by the hypothesis); `S₃ ↪ S₁ ≀ S₃ ≅ S₃`; 1 ↪ 1 | holds with faithfulness |
| `isPreprimitive_productAction` | `C₂×C₃` on `C₃`, `ι = Fin 2`; `C₃` regular on 3 points; `S₃` on 3 points with `ι = Fin 2`; `ι` empty | 3 diagonal-coset blocks (excluded by faithful); regular case excluded by `¬IsCancelSMul`; `S₃ ≀ S₂` on 9 points is primitive; one point is primitive | holds |
| disc `x⁵ − x` | formula `5⁵b⁴ + 4⁴a⁵` | `0 + 256·(−1) = −256` | corrected |
| disc `Φ₅` | `(−1)^((p−1)/2) p^(p−2)` | `125` | corrected |
| quartic rows | `−27a⁴+256b³`, `256b³` | 229, 331776 = 576², −2048, 256 | unchanged |
| order-30 step | `|S₅|/|S₄|`, core ≤ K | `5 ≤ |ker| ≤ 30`; normal orders 1, 60, 120 | corrected |
| Kappe–Warren quadratics, `Φ₅` | `R₃ = X³ − X² − 3X + 2` | `R₃(2) = 0`; `X² − 2X + 1 = (X−1)²` does not divide `Φ₅` | corrected |
| `existsUnique_hasGaloisLabel_of_natDegree_le_five` | `n = 0` (subgroup form); linear `f`; `X²+1` over `ℝ`; degree 6 | `Fin 0` empty, so no label; `1T1` unique; `2T1`; degree 6 excluded by hypothesis | holds with `1 ≤ n` |
| `RadicalConverse.isSolvable_gal_iff_forall_rootSet_mem_solvableByRad` | `q = 0`; `q = c ≠ 0`; `X²+1`/`ℚ`; `x⁵−4x+2`; `(x⁵−4x+2)(x−1)` | trivial Gal and empty root set (true ↔ true); same; `C₂`, `±i` radical; `S₅` not solvable and roots not radical; root `1` radical but `S₅`, and the all-roots side is false | holds; the old "nonzero" restriction was unnecessary and is dropped in README and Lean |
| `RadicalConverse.finiteGalois_iff_image_mem_solvableByRad` | `E = F`; `ℚ(ζ₇)`; splitting field of `x⁵−4x+2` | trivial group, image in `F`; `C₆`, radical; `S₅`, not radical | holds |
| Layer 4 → Layer 6 dependency | quintic criterion needs "solvable transitive ≤ S₅ ⇒ ≤ conj F₂₀" | uses the degree-5 classification | recorded in *Needs:* lines |

## Mechanical signature check

All 13 declarations were appended as `#check @…` lines to a temporary copy of `Suggested.lean` and elaborated once; the file was then restored. Each elaborated type matched its README statement. No declaration uses a section `variable`, so no binder is dropped. Ten statements are closed by Tau Ceti proofs, which shows they agree with the pinned declarations. The other three use `sorry`: `existsUnique_hasGaloisLabel_of_natDegree_le_five` and the two Layer 10 theorems.

## Removed from `Suggested.lean`, and why

- The roughly 70 `sorry`'d `example`s, which the acceptance-test rules do not allow; their content stays as README targets.
- The nine `sorry`'d data definitions (H10, H11).
- The proved `splittingField_algEquiv_of_baseEquiv`, an API lemma that the Layer 0 README target keeps.
- The cubic-tower `example`s added by this pull request, which are value computations; the README worked-example paragraph keeps them as prose criteria.
- `finiteGalois_solvable_implies_image_mem_solvableByRad`, which is only `.mp` of the iff.

The README sentences that referred to these were updated.

## Ownership and citations

- `roadmaps grep 'solvableByRad'` finds no other roadmap that states the radical criterion, on main or at the open heads, so Layer 10 stays with this roadmap.
- Every Tau Ceti name now cited was checked at the pinned checkout: file and line for the H05, H06 and H10 names, and elaboration for everything in `Suggested.lean`.
- The BelyiMaps citation was checked on main (`d2e0f0d`).
- No `sources.toml` exists in the folder, and this job may edit only README and Lean. `ConradCubicQuartic` and `MilneFT` were fetched (author pages) but not entered in a manifest. Nothing is missing, and `needs-references.toml` lists nothing.

## Untrusted text

The review contained no instructions outside its mathematical claims.

## Build

`lake build TauCetiRoadmap.PolynomialGaloisGroups.Suggested`: Build completed successfully (9070 jobs). There are 3 `declaration uses 'sorry'` warnings, at lines 145, 184 and 196.

## Gate

`gate PolynomialGaloisGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`

On `b6c345d` the gate failed with sorry-data=9, sorry-examples=70, imports=1, residue=2, tex=1 and readme-ids-missing=1.

## Depcheck

`depcheck: 148 roadmaps, 1002 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
