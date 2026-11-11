# FIX-PKG-NonabelianLevelStructures~4: repair report

The review `REV-PKG-NonabelianLevelStructures~3` has two findings, F01 and F02. Files edited:

- `packages/NonabelianLevelStructures/README.md`.
- `packages/NonabelianLevelStructures/Suggested.lean`: one docstring locator only, "README §§7.6, 7.8" → "README §§7.6, 7.7". No declaration changed.
- The top-level `gaps` list of `packages/NonabelianLevelStructures/design/plan.json`: in `punctured-torus-nielsen` and `markoff-alternating-three-mod-four`, `neededBy` "7.8" → "7.7". I compared the JSON with `gaps` removed against HEAD, and the rest of the file is identical.

`metadata.toml` and `sources.toml` are unchanged. I fetched no source and wrote no `needs-references.toml`.

## F01 (P2) — applied

I checked the finding against main. NoncongruenceModularForms §3.5 (README lines 841–891; `Suggested.lean:211` `compositionFactor_of_isCongruenceSubgroup`) owns the composition-factor obstruction and the A_n/S_n noncongruence consequence for n ≥ 6. Its §1.1 owns the monodromy group PSL₂(ℤ)/core(Γ̄).

The edits:

- I deleted §7.7 ("Composition factors of congruence quotients": its target, route and Checks).
- §7.8 is renumbered §7.7. It now imports both supplier results and proves only the SL₂→PSL₂ adapter:
  - −I lies in the stabilizer Γ_y of a point of Y*.
  - Γ_y is the preimage of its image, of index d_p.
  - g Γ̄_y ↦ y·g⁻¹ is equivariant.
  - Γ_x ≤ Γ_y.
- New Checks: the trace triple witness for −I, Γ₁(3) (index 8 versus 4), the overgroup direction, and an index-5 congruence subgroup with A₅ monodromy.
- Other places I updated: the Scope sentence, a new deferral bullet, a new "From TauCetiRoadmap.NoncongruenceModularForms" contract, and the Layer 7 Dependencies. I dropped `nat_card_alternatingGroup` from the Mathlib contract, the Needs line and the Dependencies, because nothing uses it any more.

The same Scope sentence also claimed ownership of "the alternating containment at primes congruent to 3 modulo 4". That contradicts gap:markoff-alternating-three-mod-four, which requests it from ArithmeticDynamicsPartII, so I removed that claim too.

## F02 (P3) — applied

I verified the convention at the pin. `orbit_subgroup_eq_rightCoset` (`Mathlib/GroupTheory/Coset/Basic.lean:170`) identifies the orbit of left multiplication by H with `op a • s`, which is the right coset H a. The changes:

- §1.3 statement: "a left coset ⟨φ_x(γ∞^δ)⟩h" → "a right coset … (an orbit of left multiplication)".
- §1.3 API: "left coset" → "right coset … of the form ⟨φ_x(γ∞^δ)⟩h".
- §1.3 Check: "a set of left cosets" → "the set of right cosets ⟨u⟩g".
- §1.7 route: "on left cosets" → "on the right cosets ⟨h⁻¹u⁻¹h⟩x".

I added the S₃ negative-control Check (Hh = {(1 2 3), (2 3)} versus hH = {(1 2 3), (1 3)}). The Mathlib lemma is named in the Mathlib contract and in §1.3's Needs line. All the Hh formulas are kept.

Pattern search: no other "left coset" remains. "the left M_(u,h)-orbits in G" in §1.7 is correct as written, since these are orbits of left multiplication (the right cosets M x, [G : M] of them). `Suggested.lean` does not mention cosets.

## Checks run

- **Elaboration.** `lake env lean packages/NonabelianLevelStructures/Suggested.lean`, run from the content checkout, exited 0 in about 11 s. The only output was two warnings, `declaration uses sorry`, at lines 106 and 120. There is no `TauCeti.*` import, so nothing had to be built first.
- **Binder check.** I put `#check @name` for all nine declarations in a scratch copy and elaborated it; it exited 0. The types are unchanged from the scratch `signatures.md`:
  - `[Group G]` is retained everywhere, and `[Fintype G]` on `cuspVerticalExponent` and both theorems.
  - `simple_group_congruence` keeps its nonabelian, non-PSL₂(K) (same universe), prime, generation and `Nat.card G ≤ (ℓ^(r+1))^3` hypotheses.
  - No binder was lost and no change was needed.
- **Dependency direction.** Exact output:

  ```text
  depcheck: 236 roadmaps, 2144 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line. The edge count went from 2143 to 2144: this is the new NoncongruenceModularForms edge, which goes to a roadmap on main.
- **Citations** (`roadmaps resolve`):
  - No Lean name is unresolved.
  - The one cross-roadmap lead is MappingClassGroupsAndCanonicalRepresentations §2.3. That is a board package (`packages/MappingClassGroupsAndCanonicalRepresentations/README.md:864`, "### 2.3 Teichmüller uniformization of the pointed moduli stack"), and it sits directly before this roadmap in the merge order (ORDER lines 291–292). It is a false positive of the main/open-head resolver, and it predates this round.
- **New supplier citations.** NoncongruenceModularForms §1.1 ("The modular triple"), §3.5 ("The order obstruction") and `compositionFactor_of_isCongruenceSubgroup` were checked on main at 38a5fb2:
  - `roadmaps overlaps NoncongruenceModularForms` reports no open pull request that changes it, drops one of its ids, or is the only place defining one.
  - The board folder for it holds reports only.

## Adversarial pass on added or changed statements

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| §1.3: H_(δ,x) is the right coset ⟨u⟩g | S₃, H = ⟨(1 2)⟩, h = (1 2 3), composition right to left | Hh = {(1 2 3), (2 3)}; hH = {(1 2 3), (1 3)}; both have size 2 | They differ, so the name matters. Added as a Check. |
| §1.3: orbit set ⟨u⟩∖G is a set of right cosets | G = 1; C₂ with u = 1 | 1 orbit; 2 orbits {e}, {h} (left and right agree in abelian groups) | The S₃ instance is the discriminating one. The right-coset label holds in all cases. |
| §1.7: α well defined on right cosets ⟨h⁻¹u⁻¹h⟩x | x′ = (h⁻¹u⁻¹h)^k x | ⟨u⟩h x′ = ⟨u⟩u^(−k)h x = ⟨u⟩h x | Well defined. Only the terminology changed. |
| §7.7 adapter: −I ∈ Γ_y | A = `[[1,1],[0,1]]`, B = `[[1,0],[1,1]]` | Triples of (A, B) and (A⁻¹, B⁻¹) are both (2, 2, 3); A⁻¹B⁻¹ = `[[2,−1],[−1,1]]` | Holds. Added as a Check. |
| §7.7 adapter: PSL₂-index of Γ̄_y = SL₂-index = d_p | Negative control Γ₁(3) (no −I); p = 5, 7, 11, …, 31 | In SL₂(𝔽₃) (order 24): Γ₁(3) has index 8; ±Γ₁(3) = Γ₀(3) (6 elements mod 3) has index 4. d_p = 10, 7, 22, 52, 85, 76, 115, 232, 217 | The equality needs −I. The d_p values match the Layer 7 Examples table. |
| §7.7 adapter: g Γ̄ ↦ y·g⁻¹ is well defined and equivariant | Right action of S₃ on {1, 2, 3} with y·g = g⁻¹(y), y = 1 | Stabilizer {e, (2 3)}; well-definedness and equivariance checked on all 6×2 and 6×6 pairs: True, True | Holds. Stated explicitly in §7.7. |
| §7.7 transfer Γ_x ≤ Γ_y | Overgroup and converse | Γ(n) ≤ Γ_x ≤ Γ_y makes Γ_y congruence. Conversely, SL₂(ℤ) is congruence but contains noncongruence subgroups | Correct direction. Added as a Check. |
| §7.7 application: d_p ≥ 10 ≥ 6 on P_MP | p = 5, 7 | d₅ = 10. d₇ = 7, but 7 ∉ P_MP: the roots of X² − 3X + 1 have order dividing 8 < 32√8 | Holds. |
| Imported consequence: A_n ≇ PSL₂(𝔽_ℓ) for n ≥ 6 | n = 5, 6, 10 | \|A₅\| = 60 = \|PSL₂(𝔽₅)\|, and the point stabilizer of PSL₂(ℤ) → A₅ on 5 points contains the image of Γ(5). \|A₆\| = 360. \|A₁₀\| = 1 814 400 against 60 and 168 | n = 5 is a congruence boundary case. n = 10 is obstructed. Added as a Check. |
| §7.7: A_(d_p) is a nonabelian simple composition factor of S_(d_p) | d = 10 | 1 ◁ A₁₀ ◁ S₁₀ with factors A₁₀ and C₂; A₁₀ is simple because 10 ≥ 5 | Holds. |
| Scope: Layer 7 ownership | gap:markoff-alternating-three-mod-four | Requested from ArithmeticDynamicsPartII in the contract and the plan, but claimed in Scope | Contradiction removed. |

## Ownership and supplier notes

- **The new supplier is on main.** NoncongruenceModularForms is on main, so this package may consume it, and it creates no upward edge. Its §3.5 is stated for subgroups Γ̄ ≤ PSL₂(ℤ) whose preimage is congruence. This roadmap now owns only the passage from point stabilizers in SL₂(ℤ) ≅ Out⁺(F₂) to that setting (the central-kernel hypothesis −I ∈ Γ_y), plus the Markoff application.
- **No second owner found.** I searched for the same objects (composition factors of SL₂(ℤ/n), congruence obstruction, noncongruence) with `roadmaps grep` across main and the open heads, and in the board packages. The only owner is NoncongruenceModularForms on main.
- **No citation of this roadmap breaks.** No roadmap cites any section of this one (`roadmaps grep NonabelianLevelStructures`; board packages). The only hits are ArithmeticDynamicsPartII describing what this roadmap consumes from it. So renumbering §7.8 to §7.7 needs no mapping.

## For the maintainer

- **Plan node out of date.** The `plan.json` node `NonabelianLevelStructures:NL.7/noncongruence-components` (outside the editable `gaps` list) still describes the old route: its own composition-factor argument with d_p ≥ 7, the `nat_card_alternatingGroup` prerequisite and a "Q-CONGRUENCE" request. The README is now the authority. A later design refresh could point that node at NoncongruenceModularForms §§1.1, 3.5.
- **Other roadmaps.** No other roadmap is affected. No Lean declaration name changed.
- **Untrusted text.** None of the review text contained instructions beyond its findings.
