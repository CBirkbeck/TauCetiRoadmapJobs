# FIX-DESIGN-QuasicoherentSheavesOnPrestacks~12

This round settles the two P3 findings of `REV-DESIGN-QuasicoherentSheavesOnPrestacks~11` (one review). Files changed:

- `packages/QuasicoherentSheavesOnPrestacks/design/README.md`
- `packages/QuasicoherentSheavesOnPrestacks/design/plan.json`
- `packages/QuasicoherentSheavesOnPrestacks/sources.toml`: new HTT and SAG locators on the existing `HTT` and `SAG` entries. No new work and no new key.

## F01 (P3) — applied differently

Old → new: 3.1 gains a local lifting criterion: `L u` is an effective epimorphism exactly when points lift fpqc-locally, hypercomplete case included. It rests on InfinityTopoi §§7.3.4–7.6.1, 8.4.1, 9.1.1, 9.2.3 and 14.1.1, HypercompletenessAndCoherence §1.2.1 and PresentableInfinityCategories §6.2.3. 3.3, 3.4, 6.2 and 7.1 cite it, and 4.1 cites §3.3.2.

**Verified.** The finding is right. The routes of 3.4, 4.1, 6.2 and 7.1 use effective epimorphisms and universal colimits with no supplier section named. InfinityTopoi is already a supplier, and the cited sections exist at its head (index of 2026-11-15) with the stated content.

**Why differently.** The suggested citations do not cover the step that the routes of 6.2 and 7.1 take.

- **The local-lifting step goes the wrong way.** InfinityTopoi §9.2.3 (HTT Lemma 6.2.4.5, HTT line 27932) proves only that local lifts give an effective epimorphism. 6.2 and 7.1 need the converse: an effective epimorphism of (hypercomplete) fpqc sheaves has fpqc-local lifts. §14.1.1 (HTT Proposition 7.2.1.14) does not give that converse. It reduces the question to 0-truncations, where a further 1-topos argument would still be needed.
- **The correct route for the converse.**
  - Pull back along the point (§7.5.1).
  - The image in `PreStk_T` of the pullback is the sieve of local lifts (§§7.6.1, 7.4.2, 7.3.4, 9.1.1; HTT Lemma 6.2.3.18).
  - L preserves image factorizations (§§7.4.1, 7.3.4), so it inverts the monomorphism of that sieve, which therefore covers (§8.4.1, HTT Lemma 6.2.2.16, HTT line 27258).
  - A covering sieve contains an fpqc cover (SAG Proposition A.3.2.1, SAG lines 64259–64283, pp. 1764–1765).
- **The hypercomplete case needs one more step.** `[X/G]` is a hypersheafification, and 6.2 takes its colimits in hypercomplete sheaves. The hypercompletion commutes with τ≤0 (PresentableInfinityCategories §6.2.3, HTT Proposition 5.5.6.28) and fixes 0-truncated objects (HypercompletenessAndCoherence §6.1.1). §14.1.1 in both ∞-topoi then gives the claim. This is where §14.1.1 actually enters.
- **3.4 uses a different input.** The review assigns §7.4 to 3.4, but the presheaf monomorphism `colim h_U → h_W` is not an effective epimorphism of `PreStk_T` (the doubled-plane Check of 3.4 has a fibre of two points). 3.4 instead uses the "if" direction (§9.2.3) and then §7.3.4. This needs `h_W` and `h_X` to be fpqc sheaves (Stacks tag 023Q, already in the manifest), and the route now says so.
- **4.1 needs a statement, not a definition.** Universality of colimits in `PreStk_T` is §3.3.2 (HTT Proposition 6.1.3.10(1), HTT line 25589: colimits in an ∞-topos are universal). §3.1.2 only defines universality.

The criterion is stated once, as a 3.1 API fact, because it concerns this roadmap's own fpqc topology on test rings (3.1). No roadmap states it. A search of the open heads and main for "effective epimorphism … lift" and for HTT 6.2.2.16 and 6.2.4.5 finds only InfinityTopoi itself and the proof of HypercompletenessAndCoherence §9.3.3, which uses the same argument inside a proof.

**What changed.**

- **3.1 API.** Two new bullets:
  - hypercomplete fpqc sheaves form an ∞-topos (HypercompletenessAndCoherence §1.2.1);
  - the local lifting criterion, with its proof route.
- **3.1 Check and *Needs*.** A new two-way Check: `L(∅ → Spec 0)` is an effective epimorphism, while `Spec 𝔽_p ⊔ Spec ℤ[1/p] → Spec ℤ` is surjective on primes but not one after L. *Needs* gains the sections listed above.
- **3.4 route.** `h_W` and `h_X` are fpqc sheaves (Stacks 023Q), the local lifting of 3.1 applies, and §7.3.4 turns the result into an equivalence. *Needs* gains "3.1 (… the local lifting criterion)" and §7.3.4.
- **4.1 API and *Needs*.** "X is the colimit of its points (2.1)" and InfinityTopoi §3.3.2.
- **6.2(a) route.** The colimit is taken in hypercomplete sheaves. §7.6.1 is applied to the map from the presheaf coproduct, whose hypersheafification is the sheaf coproduct, and then the local lifting of 3.1. *Needs* gains 3.1 (local lifting) and §7.6.1.
- **7.1 API.** `X → |G^{×_S •} ×_S X|` is an effective epimorphism (§7.1.1, the action groupoid being effective). L preserves effective epimorphisms (§7.4.1), and the local lifting of 3.1 does the rest. *Needs* gains §§7.1.1 and 7.4.1, and "3.1 (hypersheafification, local lifting)".
- **Conventions (Universes).** "the ∞-topos statements (7.1)" becomes "universal colimits, effective groupoid objects and effective epimorphisms (3.1, 3.3, 3.4, 4.1, 6.2, 7.1)". "hypercompletion (3.2, 3.4)" becomes "(3.1, 3.2, 3.4)".
- **Supplier contracts.**
  - The InfinityTopoi §3.3.2 bullet now says that a left exact presentation gives universal colimits (4.1).
  - Two new InfinityTopoi bullets cover effective epimorphisms (§§7.1.1, 7.3.1, 7.3.4, 7.4.1, 7.4.2, 7.5.1, 7.6.1, 14.1.1) and sheaves (§8.4.1, its injectivity step; §9.1.1, covering sieves as images; §9.2.3, local lifting). Each carries its HTT locator and the universe clause u+1.
  - HypercompletenessAndCoherence gains §1.2.1 (HTT Proposition 6.5.2.8 and the paragraph after it, HTT lines 31139–31180). PresentableInfinityCategories gains §6.2.3.
  - The Scope list mirrors all of this.
- **Dependencies.** Layer 3 gains InfinityTopoi §§7.3.1–14.1.1, HypercompletenessAndCoherence §1.2.1 and PresentableInfinityCategories §6.2.3. Layer 4 gains §3.3.2, Layer 6 §7.6.1, and Layer 7 §§7.1.1 and 7.4.1.
- **Plan.**
  - The InfinityTopoi, HypercompletenessAndCoherence and PresentableInfinityCategories supplier entries gain these sections.
  - 3.1 gains the API entries `hypercomplete_topos` and `local_lifting`, the test `local_lifting`, its prerequisites, and SAG A.3.2.1 in its locator.
  - The prerequisites of 3.3, 3.4, 4.1, 6.2 (now including `target:3.1`) and 7.1 follow. The statements of 4.1 `colimit_presentation`, 6.2 `connective_presentable` and 7.1 `geometric_quotient` are reworded to match.

**Same pattern elsewhere.** The route of 3.3(c) said only "`|U_•| → X` is an fpqc-local equivalence", with the same facts unsupplied. It now reads: the image of `U → X` in `PreStk_T` (InfinityTopoi §7.3.1, HTT Proposition 6.2.3.4, HTT line 27376) is a monomorphism with local lifts, hence inverted by L (3.1, local lifting; §7.3.4). The plan's 3.3 prerequisites gain §§7.3.1 and 7.3.4.

A scan of the README for "effective epimorphism", "universal", "lifts … after an fpqc cover" and "fpqc-locally" finds no other unsupplied use.

## F02 (P3) — applied

Old → new: in the 6.1 API, "(SAG Example 6.2.5.7, p. 495)" becomes "(SAG Example 6.2.5.7, p. 495, for colimits and extensions; the paragraph preceding SAG Proposition 6.2.6.3, p. 497, for the unit, tensor products and the symmetric monoidal structure)". The plan's 6.1 locator says the same.

**Verified.**

- SAG lines 18011–18016 (Example 6.2.5.7, p. 495) state closure under small colimits and extensions only.
- SAG lines 18085–18087 (p. 497, after the proof of Proposition 6.2.6.2 and before Proposition 6.2.6.3) state that `QCoh(X)^cn` contains `O_X`, is closed under tensor products and is symmetric monoidal.
- The manifest's SAG entry already lists §6.2.6.
- No other place in the README or plan cites Example 6.2.5.7.

## Checks run

**Dependency gate**, run after all edits:

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after HabiroCohomologyFoundations (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2244 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. All the new citations are to suppliers this roadmap already names: InfinityTopoi, HypercompletenessAndCoherence and PresentableInfinityCategories, all of the InfinityCategoryTheory family.

**Citations** (`roadmaps resolve` on the edited README): no cross-roadmap citation and no Lean name is found nowhere.

**README and plan agreement.** A script compared, for all 33 plan targets, every `roadmap:` and `target:` prerequisite with the README *Needs* line of the same target: 0 mismatches. `plan.json` and `sources.toml` parse, and the plan still has 33 targets.

**Style scan** of the README: no LaTeX delimiters, process words, pull-request numbers or machine paths.

**Lean.** The design stage has no `Suggested.lean`, so nothing was elaborated or `#check`ed. No Lean name was added.

**Sources.** Every new locator was read in the cached texts this round. The `HTT` locator gains:

- Example 5.2.8.16 (HTT line 17740)
- Proposition 5.5.6.28 (HTT line 23487)
- Lemma 6.2.2.16 (HTT line 27258, PDF p. 601)
- Propositions 6.2.3.4, 6.2.3.7 and 6.2.3.15 (HTT lines 27376, 27439 and 27611)
- Corollary 6.2.3.12 (HTT line 27523)
- Lemmas 6.2.3.13, 6.2.3.18 and 6.2.4.5 (HTT lines 27540, 27696 and 27932)
- Proposition 6.5.2.8 (HTT line 31139)
- Proposition 7.2.1.14 (HTT line 33572, PDF p. 741)

The `HTT` entry's `cited_for` gains 4.1 and 6.2. The `SAG` locator gains Proposition A.3.2.1 (SAG lines 64259–64283). No fetch was needed, and no reference request was written.

## Adversarial pass (new or changed statements)

| Statement | Instances tried | Values computed | Result, change |
| --- | --- | --- | --- |
| 3.1: a sieve covers iff it contains an fpqc cover (SAG A.3.2.1) | empty sieve on 0 and on ℤ; sieve generated by `{ℤ → ℤ[1/2], ℤ → ℤ[1/3]}`; hypothesis (d) | the empty family covers 0 (`0 → ∏_∅ = 0` is faithfully flat) but not ℤ; `ℤ → ℤ[1/2] × ℤ[1/3]` is faithfully flat; `(B₁ × B₂) ⊗_A A′ ≃ (B₁ ⊗_A A′) × (B₂ ⊗_A A′)`, so finite coproducts in `T^op` are universal; faithfully flat maps are stable under finite products | hypotheses (a)–(d) of A.3.2.1 hold in all three contexts |
| 3.1 local lifting, "only if" | `L(∅ → Spec 0)`; `Spec 𝔽_p → Spec ℤ`; unit of the constant `BΓ × Spec k` into its sheafification | at R = 0 the point lifts after the empty cover, and at R ≠ 0, `Map(0, R) = ∅`; for `Spec 𝔽_p → Spec ℤ` a lift of id along a cover forces each nonzero `R_i` to be a flat 𝔽_p-algebra, which is impossible, so no cover exists, matching 3.3's Check that it is not an fpqc surjection; a Γ-torsor over a k-algebra trivializes after a finite étale cover | holds |
| 3.1 local lifting, "if", and the new Check | `Spec ℤ[1/2] ⊔ Spec ℤ[1/3] → Spec ℤ`; `Spec 𝔽_p ⊔ Spec ℤ[1/p] → Spec ℤ` | the first lifts along the cover, so after L it is an effective epimorphism; the second is surjective on primes, but along any cover all nonzero `R_i` are `ℤ[1/p]`-algebras, so `𝔽_p ⊗ ∏R_i = 0 ≠ 𝔽_p = 𝔽_p ⊗ ℤ`, not faithfully flat | holds; the second instance is the negative-control Check |
| 3.1 local lifting, hypercomplete case | τ≤0 of hypercompletion; `Spec ℤ → B(ℤ/2)` | `τ≤0 H(Lu) ≃ H(τ≤0 Lu) = τ≤0 Lu`, since 0-truncated objects are hypercomplete; `τ≤0 B(ℤ/2)` is final in both ∞-topoi, and `τ≤0` of the atlas is the identity of the final object, an effective epimorphism in both | holds |
| 3.3(c) route (pattern repair) | `Spec 𝔽_p → Spec ℤ`; `Spec ℤ[1/2] ⊔ Spec ℤ[1/3] → Spec ℤ`; `∅ → Spec 0` | image subfunctor `{R : p = 0 in R}` with no local lifts of id, so nothing is concluded, matching 3.3's Check (ℚ killed); image `{R : 2 or 3 a unit}` with local lifts, so L inverts it; image ∅ with lifts after the empty cover, so `L∅ = Spec 0` | holds |
| 3.4 route | doubled plane, `R = k[x, y, a, b]/(ax + by − 1)`; `h_W` a sheaf | fibre over f is two points; on `D(x)`, `D(y)` the fibre is contractible, and `R → R_x × R_y` is faithfully flat since `ax + by = 1`; `h_W` is discrete and an fpqc sheaf (Stacks 023Q), so `L h_W = h_W` | holds; the presheaf monomorphism is not an effective epimorphism of `PreStk_T`, so §7.4.1 is not the input there |
| 4.1 universality | X = ∅; `X = Spec A`; `f = id` | `Pts(∅)` is empty, so the colimit is ∅ and Y = ∅; `Pts(Spec A)` has initial object `(A, id)`, so the colimit is `Spec f_id = Y`; for `f = id`, `colim Spec A = X` | holds |
| 6.2(a) route | empty index set; `X = Spec A ⊔ Spec B` in sheaves | sheaf colimit `L^hyp ∅ = Spec 0`, whose points at 0 lift after the empty cover; the sheaf coproduct is `Spec(A × B)`, whose point id lifts to the presheaf coproduct only after `{A × B → A, A × B → B}` | holds; the instance shows the cover is needed |
| 7.1 route | G = 1, X = ∅; `G = ℤ/2` constant, classical, R = ℝ, torsor `Spec ℂ` | `[∅/1] = Spec 0` with lifts after the empty cover; the nontrivial torsor does not lift at ℝ but lifts after the faithfully flat `ℝ → ℂ` | holds |
| Universe rule list | the new sections | effective epimorphisms and sheaves on `T^op` and `PreStk_T`, (u+1)-small T, each applied in u+1 | list extended to 3.1, 3.3, 3.4, 4.1, 6.2, 7.1 |
| 6.1 locator (F02) | SAG lines 18011–18016, 18085–18087 | colimits and extensions; unit, tensor products, symmetric monoidal structure | locator split |

## For the maintainer

- **Names and ids.** No name of this roadmap that other roadmaps cite changed. No section was renumbered, and no target was added or deleted. The plan gains two API entries and one test in 3.1.
- **Ownership.** The local lifting criterion is stated here because it is about this roadmap's fpqc topology on test rings (3.1). Its general ingredients are cited from InfinityTopoi and HypercompletenessAndCoherence. Ownership against open pull requests was checked through the tools' index of 2026-11-15 only.
- **Unread heads.** The new supplier sections belong to roadmaps of the open InfinityCategoryTheory family. They were read at its head through `roadmaps show` and can move before it merges.
- **Review text.** No suspicious instructions were found in it.
