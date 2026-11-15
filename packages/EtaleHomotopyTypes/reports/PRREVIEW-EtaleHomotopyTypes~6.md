# Review of EtaleHomotopyTypes (pull request #1806 at eb2290e)

**Verdict:** needs changes

Incremental re-review of 130 changed lines since 62169a7. The gate passes and both description findings of the previous report are repaired; one finding, on the new §3.0b.

## R01 (P2) — §3.0b and the open revision of EtaleCohomologyFoundations §F.0.2 both own the induced homomorphism of finite étale fundamental groups

**Location:** `TauCetiRoadmap/EtaleHomotopyTypes/README.md` line 11: "The homomorphism of these groups induced by a morphism of schemes, which §F.0.2 does not name, is §3.0b here"; §3.0b (lines 517–531) with its three API bullets; `Suggested.lean` line 108.

**Claim:** The open revision of EtaleCohomologyFoundations (on main, merge order 44, earlier than this roadmap at 242) states the same map in §F.0.2 by the same construction, with the same API (continuity, functoriality, the field case). Two open pull requests each build one object; the roadmap on main is its owner.

**Witness:** EtaleCohomologyFoundations at its open head 0cefadf, README §F.0.2 lines 390–400 and `Suggested.lean` `EtaleFundamentalGroup.map`: whiskering by `TauCeti.FiniteEtaleScheme.pullback f`, transport along `pullbackCompFiberIso f x`; equal to `conjAut ∘ mapAut` here. Main (1a19c9f) §F.0.2 has no such map.

**Repair:** Line 11: replace the sentence with "The homomorphism of these groups induced by a morphism of schemes is owned by EtaleCohomologyFoundations §F.0.2, in its revision that names it, with its continuity, functoriality and field case; §3.0b records the definition on the library carrier that makes the product formulas of §§3.8a and 3.9a statable, by the same whiskering and transport." In §3.0b delete the three API bullets (they are §F.0.2's targets), keep the definition and its three Checks, and say in one clause that it is §F.0.2's map. Keep `fundamentalGroupMap` in `Suggested.lean` (a roadmap module cannot be imported; the name differs). Name the EtaleCohomologyFoundations revision as a dependency in the pull request description, after "They need one definition …": "the same map is stated by the open revision of EtaleCohomologyFoundations §F.0.2, which merges first".

## Previous findings

- R01 — repaired: description now reads "AnabelianGeometryAndNonabelianChabauty states the Schmidt–Stix results it uses on its own pointed carrier, independently of this roadmap."
- R02 — repaired: description now reads "the Lean states one real-bodied definition and two theorems with `sorry`" and "its only warnings being the two theorems that use `sorry`"; the head has exactly one `def` and two sorried theorems.

## Verified sound

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| `fundamentalGroupMap` (§3.0b) | types of each factor at the pin; id of Spec ℚ; Spec ℚ(i) → Spec ℚ; z ↦ z² on 𝔾_m over ℂ; trivial map as wrong model | `mapAut`: Aut(fiber a) → Aut(pullback f ⋙ fiber a); `pullbackCompFiberIso f a : pullback f ⋙ fiber a ≅ fiber (a ≫ f)`; id ↦ id; image G_ℚ(i), index 2; image 2ℤ̂(1), index 2; trivial map: image not open | definition sound; Checks true and exclude the trivial and the surjective model | ownership: R01 |
| `geometric_product_formula` (§3.8a) | X = Spec K; X = Y = 𝔾_m over ℂ; 𝔸¹ × 𝔸¹ over 𝔽̄_p; Y empty; hypotheses against SGA1 XIII 4.6(b) | π₁(Y) ≅ 1 × π₁(Y); ℤ̂(1)² on both sides; w^p − w = xy is not a product cover, excluded by `[CharZero K]`; empty Y excluded by `ConnectedSpace`; source: X qcqs, Y connected only (SGA1 line 12288) | true as stated; Lean binders equal README's (K algebraically closed of characteristic 0, X connected qcqs, Y connected) | none |
| `finiteEtale_product_formula` (§3.9a, seeded sample) | Y₁ = Y₂ = Spec ℝ over ℝ; Y₁ = Y₂ = Spec ℚ(i) over ℚ; k = ℂ; direction of the `eqToIso` transport | product Spec ℝ, group C₂; equalizer = diagonal of C₂ × C₂, order 2 (direct product: 4); ℚ(i) ⊗ ℚ(i) has 2 points, excluded by `GeometricallyConnected`; over ℂ base group trivial, equalizer = full product; transport lands in Aut(fiber((c ≫ fst) ≫ p₁)), the first map's target | true as stated; finite type = `LocallyOfFiniteType` + `QuasiCompact` on both factors, as README | none |
| One-tactic probe on the two theorems | `first \| rfl \| infer_instance \| simp \| exact ⟨_, fun _ => rfl⟩` on a scratch copy | 3 errors (unsolved goals on both, one type mismatch); neither closes | not padding | none |
| Description against the head | each sentence of the summary block and the prose; title | 1 `def`, 2 theorems, 2 `sorry` warnings; imports `Mathlib` and `TauCeti.AlgebraicGeometry.FiniteEtale.Fiber` only; folder not on `origin/main`, 3 files, 1268 insertions; outside-folder diff empty | no sentence contradicted; the dependency R01 asks for is the one addition | R01 |

The rows of the previous reviews for the untouched statements stand as in the previous review, of `62169a7`.

- Source locators checked against the text: 4 (SGA1 line 4750–4763, V §7, printed p. 116; SGA1 line 4767–4770; SS line 474, Lemma 2.9 proof, pp. 828–829; SGA1 line 12282, XIII Proposition 4.6, pp. 310–311); all support the statements. Seeded sample: only §3.9a falls in a changed passage.
- Library declarations opened at the pins: 48, every locator the diff changes or adds and the untouched ones of the same bullets. All at the stated lines, among them `SingularSet.lean` 50/56/66/74/102, `Galois/Topology.lean` 77 and 110–125, `Geometrically/Connected.lean` 40, `FiniteEtale/Fiber.lean` 51/117/179, `Galois/Category.lean` 106/111, `Galois/FundamentalGroup.lean` 219 (which assumes `IsGalois K Ω`, a separable closure, as the README says).
- Elaborated signatures: the three `#check` types of the worker's list compared with §§3.0b, 3.8a, 3.9a; no binder lost, nothing changed.
- Elaboration: `lake env lean TauCetiRoadmap/EtaleHomotopyTypes/Suggested.lean`: two `declaration uses sorry` warnings (lines 121, 141), nothing else.
- Gate, run on this head: every counter 0, `OK`. Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Duplication by object: no induced map on `Aut (fiber _)` and no product formula in the pinned `TauCeti/AlgebraicGeometry/FiniteEtale/`; no roadmap `Suggested.lean` on main or at an open head declares the three fully qualified names; the one shared object is R01's.
- Overlap check: read this round EtaleCohomologyFoundations (main and its open revision) and AnabelianGeometryAndNonabelianChabauty; the induced homomorphism of finite étale fundamental groups is shared with EtaleCohomologyFoundations §F.0.2, owner EtaleCohomologyFoundations (R01). EllAdicHomotopyTypesAndWeights, KanQuillen, SimplicialCategories, EnrichedLocalization, StableHomotopyKTheory, BordismFormalGroups stand as read in the previous review; the worker's overlap lists are unchanged.
- Source independence: changed passages only: 7 passages (§3.0b's definition and Checks, the sentence added to §3.9a, the scope sentence, the two new supplier bullets, three docstrings) compared with 2 sources (SGA1, SS), none shared; the arrangement was not compared again (a section was added, no layer added, removed or reordered).

## Not verifiable

- The description's "after 7 independent review rounds and 2 red-team rounds on the job board": the board's history is not among this review's inputs.
- Ownership against open pull requests was checked through the service's index of 2026-11-15T11:37:13Z only.
- Giraud, SGA4, FGV, BK, AM, Fr, SGA5: settled uncertified; no changed passage relies on their text.

## Source issues

- none

## For the human reviewers

- none
