# Review of GrothendieckTopoi (pull request #1520 at 38e9e22)

**Verdict:** accepted

An incremental re-review of the 43 lines changed since 6dbec25 (the four repairs of the previous review: the essential-morphism predicate, 4.4 Check 3, the Isbell 1972 locator, the build paragraph). Every previous finding is repaired, no repair introduced a problem, the gate passes at this head, and the file elaborates with `sorry` as its only warning. No finding.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/GrothendieckTopoi/Suggested.lean` line 430 reads `f.inverse.IsRightAdjoint`; README lines 208, 867, 880 and 1029 name `Functor.IsRightAdjoint`. The r13 witness `⟨f.direct, ⟨f.adj⟩⟩ : f.IsEssential` no longer typechecks (type mismatch `f.inverse ⊣ f.direct` against `f.direct ⊣ f.inverse`), and `f.IsEssential ↔ f.inverse.IsRightAdjoint` closes by `Iff.rfl`.
- R02 — repaired: README lines 716–720 identify `Comma Φ (𝟭 G)` as `F × Pointed(G)` with objects `(B : F, A : G, ⊤ ⟶ A)`, initial object `(∅, 𝟙 ⊤)`, and the fold map `(∅, ⊤ ⊔ ⊤) ⟶ (∅, 𝟙 ⊤)` with `⊤ ⊔ ⊤` pointed by the first injection as the non-invertible map (values below).
- R03 — repaired: README lines 1285–1286 cite "Theorem 3.12 and the paragraph following its proof, p. 30", and the reference entry (line 1516) matches; isbell1972 lines 998–1003 are the theorem and proof, lines 1004–1007 the paragraph with the countable-product clause.
- R04 — repaired: README lines 255–258 describe Layer 9 as delivering "the local cohomology sheaves, compared on a space with Tau Ceti's supported sections and local cohomology sheaves", matching the 9.4 heading and the Summary.

## Verified sound

**Gate, build, direction.** The worker's gate at 38e9e22 (`scratch/gate.md`) gives 0 on every check, `build=0`, OK. `lake env lean` on `TauCetiRoadmap/GrothendieckTopoi/Suggested.lean` from the worktree: exit 0, 40 `declaration uses sorry` warnings and nothing else. The dependency check run here:

```
depcheck: 245 roadmaps, 2465 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; GrothendieckTopoi is line 398 of the merge order. The three-dot diff outside the folder is empty. Pins unchanged: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (`lake-manifest.json` lines 22 and 10).

**Elaborated types of the touched declarations** (a scratch file importing the built module, `#check @name`): `GeometricMorphism.IsEssential : … → GeometricMorphism E F → Prop` over independent universes, as the README's definition; `isEssential_iff_preservesProducts` carries `hE`, `hF` and `f` with `f.IsEssential ↔ ∀ ι : Type u, PreservesLimitsOfShape (Discrete ι) f.inverse`, the 5.6 statement; `exists_equiv_presheaf_iff_essential_points` carries `hE` with the `u`-small family of essential points reflecting isomorphisms, the 6.5 statement. No binder lost: the `inst : Category.{u_1, u_1 + 1} E` forms are the universe-name artefacts noted since r10. The one-tactic probe (`first | infer_instance | rfl | simp`) fails on both headlines (`simp made no progress`), so neither is padding; the other 38 sorried theorems are untouched by the diff and keep r13's probe result.

**Library declarations opened at the pin.** `Functor.IsLeftAdjoint` (`Mathlib/CategoryTheory/Adjunction/Basic.lean` line 133: a right adjoint exists) and `Functor.IsRightAdjoint` (line 138: a left adjoint exists), so `f.inverse.IsRightAdjoint` is exactly "a further left adjoint `f_! ⊣ f^*`"; `Comma` (`Mathlib/CategoryTheory/Comma/Basic.lean` line 67, fields `left`, `right`, `hom : L.obj left ⟶ R.obj right`), confirming the objects `(B : F, A : G, ⊤ ⟶ A)` of R02's repair.

**Citations and ownership.** `scratch/citations.md`: no cross-roadmap citation missing; the 19 Lean-name leads are this roadmap's own declared names (`readme-ids-missing=0`), the generated Mathlib instance name of 2.4, `IsLocallyConnectedSite` (Mathlib's open work, named as such in Scope) and the AdicSpacesPartII `Topos.*` names resolved on main in r13. `scratch/overlaps.md`: no other open pull request changes this roadmap, no cited id dropped, none defined only by an open revision. TotallyDistributiveTopoi (#1927, consumer) names `Functor.IsRightAdjoint` and `GeometricMorphism.IsEssential` in its contract for GrothendieckTopoi 5.6 (its lines 104, 113, 282 via `roadmaps show --pr 1927`), so the repaired predicate matches what its consumer assumes. Ownership against the other open pull requests is as in r13 (`roadmaps grep --lean-only` over the open heads: only HigherToposTheory #1901 declares a differently qualified `IsGrothendieckTopos`); the diff adds no new object.

**Sources read at the locator.** isbell1972 lines 998–1000 (Theorem 3.12), 1001–1003 (its proof), 1004–1007 (the paragraph after the proof: the product locale is the product space exactly when the latter is hypercomplete, which holds for a countable product of completely metrizable spaces), printed page 30; the README's new wording "the paragraph following its proof" is what the text shows. The other locators of the changed passages (SGA 4 IV, Exercice 7.6 a), d), i)) are paywalled, as in r13, and unchanged.

**Adversarial pass.** Rows recomputed for the changed statements; the rest carried from r13.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 5.6 `IsEssential` (changed) | every `f`; étale of `Bool`; `Γ` of `Sh(ℚ)`; point `x` of `Sh(ℝ)` | `⟨f.direct, ⟨f.adj⟩⟩` is rejected (expected `f.direct ⊣ f.inverse`, got `f.inverse ⊣ f.direct`), so the predicate is no longer `True`; `S ↦ (S, S)` has left adjoint `(A, B) ↦ A ⊕ B` and preserves `(∏ Sᵢ, ∏ Sᵢ)`: both sides hold; on `ℚ`, `Δ(∏ₙ Bool)` has the locally constant maps `ℚ → 2^ℕ` as global sections and `∏ₙ Δ Bool` the continuous ones, `ℚ ↪ 2^ℕ` continuous and not locally constant: both sides fail; the stalk at `x ∈ ℝ` is not representable (no smallest neighbourhood): both sides fail | holds | none |
| 6.5 Roos (changed) | `Sh(ℝ)`; `B G`; monoid `{1, e}` | `Sh(ℝ)` has no essential point (every stalk at `x` fails as above), and `∏ₙ ∐ₖ ℓ(Iₙ,ₖ) ⟶ ⊤` is not epi, so neither side holds; `B G` has the essential point `G ↦ underlying set` (left adjoint `S ↦ G × S`) and is `Gᵒᵖ`-presheaves: both sides hold; `{1, e}`: two non-isomorphic essential points, presheaf topos on the two-object Karoubi envelope: both sides hold | holds | none |
| 4.4 Check 3 (changed) | `Φ = const ⊤`; `G` degenerate; `G = Type u` | objects `(B, A, ⊤ ⟶ A)` with `B` unconstrained since `Φ.obj B = ⊤`: `F × Pointed(G)`; maps `(⊤, 𝟙) → (A, a)` in `Pointed(G)` are the single map `a`, so `(∅, (⊤, 𝟙))` is initial; fold `⊤ ⊔ ⊤ → ⊤` composed with `ι₁` is `𝟙`, so it is a pointed map; if fold were an isomorphism then `ι₁ = ι₂`, and disjointness of coproducts (1.4, README line 336) makes `⊤ = ⊤ ×_{⊤ ⊔ ⊤} ⊤ = ∅`, degenerate; in `Type u`: `PUnit ⊔ PUnit` has 2 elements, `PUnit` has 1, not invertible | holds | none |
| 8.5 "Not targets" locator (changed) | isbell1972 lines 998–1007 | theorem at 998–1000, proof 1001–1003, countable-product clause at 1004–1007 on printed p. 30 | holds | none |
| Unchanged statements 1.1–1.4, 2.1–2.5, 3.1–3.3, 4.1–4.3, 4.5, 5.1–5.5, 6.1–6.4, 7.1–7.4, 8.1–8.4, 9.1–9.5, Convention 9 and their Checks | as in r13 (`scratch/previous/PRREVIEW-GrothendieckTopoi_r13.md`, table) | values in that report; the diff touches none of them | unchanged | none |

**Consistency.** With the corrected predicate, 5.6 agrees with 3.2 ("their inverse images have left adjoints"), with 5.2 (`Sh(ℚ)` not locally connected) and with every Check of 5.6 and 6.5; the 4.4 Check 3 argument uses only 1.2 (strict initial object) and 1.4 (disjoint coproducts), both stated earlier in the README.

**Principles.** No route-specific shortcut, no re-planned roadmap, no copied passage, no algorithm, no sorry'd data, no `set_option`; imports unchanged (`Mathlib` plus `TauCeti.Topology.Sheaves.LocalCohomology.Basic`, present at the pin).

**Declared gaps.** None declared (no readable `design/plan.json`), and the README states none.

## Not verifiable

- SGA 4 IV, Exercice 7.6 (a), (b), (d), (i), cited in the changed 5.6 and 6.5 passages: paywalled, as in r6–r13; the mathematics was recomputed in the table and the exercise numbers are cited by locator alone.

## Source issues

- none
