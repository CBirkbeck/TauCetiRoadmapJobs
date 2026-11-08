# GATE-ErdosProgressionPowers~5: answers to human review

Pull request head before this round: `eb6d421`. Repair commits: `b47cdf32` (README) and `0a5da24b` (the `module` header of `TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean`), neither pushed.
One review comment, from roed-math (2026-11-06), raising two points.

## H01 (roed-math) — applied differently

The defect is real. On main, `Completed/LocalFieldsRamification` has Layer 3 (ramification and the filtration) and Layer 4 (tame quotient of the absolute Galois group). At the head of the open revision of that roadmap (`893faab`), those layers are gone: its Layers 0–2 are now complements, Sen's congruence and Hasse–Arf. That roadmap now lists the old material as pinned Tau Ceti declarations, and its *Downstream consumers* section sends consumers to those declarations. So the README's four citations of "LocalFieldsRamification Layers 3–4" (scope, supplier section, §1.1 *Needs*, Layer 1 *Dependencies*; lines 88–89, 415–427, 915, 1088 at `eb6d421`) would stop resolving once that revision merges.

The repair does not re-cite that revision's labels (*Lower numbering*, *Herbrand functions and upper numbering*, *Absolute Galois group*). Those labels are bullets in its Tau Ceti supplier list, not sections. The repair cites the Tau Ceti declarations themselves, which already exist at the pin (`2fd255d`), so the citations hold whichever pull request merges first. The changes:

- The section `### From TauCetiRoadmap.LocalFieldsRamification` is deleted.
- Its content moves to `### From Tau Ceti` (README lines 265–292), with the hypotheses as they are at the pin. The declarations, each checked at its file:
  - `TauCeti.LocalFieldsRamification.lowerRamificationGroup`, `lowerRamificationGroup_zero`, `lowerRamificationGroup_antitone` and `lowerRamificationGroup_eq_bot_of_largestLowerJump_lt` (`NumberTheory/LocalField/RamificationGroup.lean`, lines 99, 129, 134, 245);
  - `herbrand`, `inverseHerbrand` and `upperRamificationGroup` (`Herbrand/Basic.lean`, lines 258, 262, 421; these need `IsGalois K L`);
  - Herbrand's quotient theorem `map_restrictNormalHom_upperRamificationGroup` (`Herbrand/UpperQuotient.lean`, line 98);
  - `TauCeti.inertiaSubgroup` (`Unramified/Inertia/Basic.lean`, line 112) and `TauCeti.wildInertiaSubgroup` (`WildInertia.lean`, line 251);
  - `TauCeti.map_inertiaSubgroup_restrictNormalHom` (`Unramified/Inertia/Finite.lean`, line 57) and `TauCeti.map_wildInertiaSubgroup_restrictNormalHom` (`WildInertia.lean`, line 702).
- Scope, old → new: "LocalFieldsRamification Layers 3–4 own the lower and upper ramification filtrations, …" → "Tau Ceti owns the projective point-count trace and the ramification theory of nonarchimedean local fields that the conductors rest on: …" (lines 89–94).
- §1.1 *Needs* (line 934): "LocalFieldsRamification Layers 3–4" → Tau Ceti `TauCeti.inertiaSubgroup`, `TauCeti.wildInertiaSubgroup`, `…lowerRamificationGroup` and `…upperRamificationGroup`.
- Layer 1 *Dependencies* (line 1107): "LocalFieldsRamification Layers 3–4" → "Tau Ceti's local ramification filtrations, inertia and wild inertia (supplier contracts)".

No other citation of LocalFieldsRamification remains. The overlap check lists no other id that this README cites and an open pull request drops.

## H02 (roed-math) — disputed

After H01's repair, the README cites no LocalFieldsRamification layer, section or label at all. Every ramification object is cited by its Tau Ceti name at the pin, and those names are the same before and after the LocalFieldsRamification revision (its own supplier list names them). So that revision is not a dependency of this pull request, and the merge order of the two pull requests is unconstrained. Nothing in this roadmap is defined only by an open revision. The pull-request description needs no dependency note on this account.

## Build and gate

- Build repair: the module-system warning on `import Mathlib` ("consider adding `module` to the start of this file") is fixed. Line 1 of `TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean` was `import Mathlib`; it is now `module`, then a blank line, then the unchanged `import Mathlib`. Several roadmaps on main use the same header: CFSGBasicProperties, FiniteGroupExtensionSplitting, PositiveScalarCurvature and DiagrammaticCoherence. The gate's import rule accepts it (`imports=0`, `no-import-mathlib=0`). No other line of the file changed.
- `lake build TauCetiRoadmap.ErdosProgressionPowers.Suggested` (at `0a5da24b`): **Build completed successfully (18239 jobs).** The only warnings are the six `declaration uses 'sorry'` warnings on the headline theorems, at lines 49, 55, 61, 67, 76 and 84 (lines 47–82 before the two header lines were added). The module-system warning no longer appears.
- Gate summary line:
  `gate ErdosProgressionPowers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Direction check (`gate --depcheck … --movable`): `depcheck: 239 roadmaps, 2359 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.

## Supporting checks

- **Suggested.lean**: only the `module` header changed (above). No declaration text changed, so the elaborated types are the same; I did not re-run `#check @name` for the header change, because the only Lean commands available were the build and the gate. Before the header change, I compared each of the nine elaborated types in the job's `signatures.md` with its README statement: `term`, `primitive_solution` and `H` against Conventions and §0.1, `half_primes_divide_d` against §1.9, `effective_prime_bound` against §6.2, `fixed_exponent_finiteness` and `positive_fixed_exponent_finiteness` against §6.3, `fixed_length_finiteness` against §6.5, and `consecutiveProduct_not_perfectPower` against §7.1. Hypotheses and conclusions agree, and no section binder was dropped. No declaration changed.
- **Citations.** `roadmaps resolve` on the repaired README reports no Lean name found nowhere. Its one cross-roadmap lead, "ErdosSelfridge1975, §2.1" at line 1995, is a false positive: it is a source locator (ErdosSelfridge1975, §2.1, (13)–(16), pp. 296–297), not a roadmap citation.
- **Other citations** of the touched paragraphs were checked at the head of their open pull request: ArithmeticGaloisRepresentations §1.9 and §§3.1–3.3 exist there as "Reduction and the residual representation", "Finite wild image, breaks and the Swan conductor", "The Artin conductor and its integrality" and "Weil–Deligne and global conductors".
- **Ownership.** No new object is stated here. The repair moves a supplier from a roadmap to the pinned library, which is the owner that the LocalFieldsRamification revision itself names. RamificationOfCompleteDiscretelyValuedFields (earlier in the merge order) covers complete discretely valued fields with possibly imperfect residue field. The conductors here are at the primes of ℚ (finite residue fields), so Tau Ceti's local-field API is the right supplier.
- **Sources.** No new source is cited, and `needs-references.toml` was not written.

## Adversarial pass on the statements this round changed

The changed statements paraphrase pinned Tau Ceti declarations. Each row checks the paraphrase against the declaration at the pin, on computed instances. The ℚ₂(ζ₈) values are G = (ℤ/8)ˣ with G₀ = G₁ = G, G₂ = G₃ = {1,5} and G₄ = 1.

| Statement (README) | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| G₀ is the inertia group of the maximal ideal of 𝒪[L] (`lowerRamificationGroup_zero`) | L = K; ℚ₂(ζ₃)/ℚ₂ unramified; ℚ₂(i)/ℚ₂ | trivial group: G₀ = 1 = inertia. Unramified: e = 1, G₀ = 1. ℚ₂(i): e = 2, G₀ = G of order 2 | agrees; at the pin the statement uses `Ideal.inertia` of `maximalIdeal 𝒪[L]` | none |
| Lower filtration antitone, indexed by ℤ, defined for finite L/K (`lowerRamificationGroup`, `_antitone`) | ℚ₂(ζ₈)/ℚ₂; index i = −1 | orders 4, 4, 4, 2, 2, 1 for i = −1…4, non-increasing. G₋₁ = G by `lowerRamificationGroup_eq_top_of_le_neg_one` | agrees; the definition needs no `IsGalois` (variable block, lines 93–96) | wording "L/K is finite", no Galois hypothesis |
| Gᵢ trivial above the largest lower jump (`…_eq_bot_of_largestLowerJump_lt`) | ℚ₂(ζ₈); trivial group | ℚ₂(ζ₈): largest jump 3, G₄ = 1. Trivial group: jump = sInf{n : Gₙ = ⊥} − 1 = 0 − 1 = −1, and G₀ = ⊥ | agrees, degenerate case included | none |
| `G^v = G_{ψ(v)}` on `[−1, ∞)`, for L/K Galois (`upperRamificationGroup`, `herbrand`, `inverseHerbrand`) | ℚ₂(ζ₈)/ℚ₂ | φ has slope 1 on [0,1], 1/2 on [1,3], 1/4 after, so φ(3) = 2 and ψ(2) = 3, giving G² = G₃ = {1,5}. The upper breaks 1 and 2 are integers, consistent with Hasse–Arf | agrees; `herbrand` is declared after `variable [IsGalois K L]` (Herbrand/Basic.lean line 255) | "For L/K Galois" stated |
| Herbrand quotient theorem: for a finite tower M/L/K with L/K and M/K Galois, restriction maps G^v(M/K) onto G^v(L/K) | M = ℚ₂(ζ₈), L = ℚ₂(√2), H = {1,7}; v ∈ (1,2] and v ∈ (2,3] | v ∈ (1,2]: G^v(M/K) = {1,5}, and 5 ↦ nontrivial class in G/H. L/K has lower break 2 (v(2√2) = 3), so G^v(L/K) = whole group: equal. v ∈ (2,3]: ψ_{M/K}(v) > 3 gives G₄ = 1, and G^v(L/K) = 1: equal. The lower-numbering control fails, as it should: G₃H/H = G/H but (G/H)₃ = 1 | agrees; the pin's variables include `[IsGalois K L] [IsGalois K M]`, finiteness of L/K and M/L, and the scalar tower | "finite tower" added |
| I_K ⊇ P_K fix K^ur and K^t (`inertiaSubgroup`, `wildInertiaSubgroup`) | definitions at the pin | `inertiaSubgroup K = (maximalUnramifiedExtension K K̄).fixingSubgroup` and `wildInertiaSubgroup K = (maximalTameExtension K K̄).fixingSubgroup`. K^ur ⊆ K^t gives P_K ⊆ I_K | agrees | none |
| Restriction sends I_K onto G₀(L/K) and P_K onto G₁(L/K), for a finite Galois subextension L of K̄ with compatible local-field structure | ℚ₂(ζ₃) unramified; ℚ₃(√3) tame; ℚ₂(i) wild | Unramified: G₀ = 1, and I_K fixes L ⊆ K^ur. Tame ℚ₃(√3): G₁ = 1, and √3 ∈ K^t (m = 2, 3 ∤ 2). Wild ℚ₂(i): G₁ = G, and i ∉ K^t since K^t/K^ur has only odd ramification, so P_K maps onto G | agrees; the hypotheses at the pin are `IntermediateField K (AlgebraicClosure K)`, `Module.Finite`, `IsGalois` and the local-field instances on L | none |
| §1.1 *Needs* and Layer 1 *Dependencies* now name Tau Ceti instead of a roadmap layer | each named declaration | grep at the pin: all four declarations exist under the stated namespaces (`TauCeti`, `TauCeti.LocalFieldsRamification`) | resolves at the pin | lines 934, 1107 |
