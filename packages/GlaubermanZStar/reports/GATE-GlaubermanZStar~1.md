# GATE-GlaubermanZStar~1: answers to human review

One comment needed an answer: a single dependency note, numbered H01.

## H01 (kim-em) — answered

Yes, this is correct, and the README already reflects it. LocalFiniteGroupTheory, ModularCharactersAndBlocks and OddOrderTheorem are this roadmap's only roadmap suppliers that are not on main. All three are new-folder pull requests, and none of them is in `ORDER.txt` yet, so this roadmap goes after all three. They are already named by section in `## Scope and ownership` and in `## Exact supplier contracts`.

Every section cited resolves at the supplier's head:
- LocalFiniteGroupTheory: L1 has `pPrimeCore`, `O_π(H ⧸ O_π(H)) = 1` and `O_π(N) = O_π(H) ⊓ N`. L4 has "p-rank 1 ⇒ cyclic or generalized quaternion for p = 2". L5 has `HasNormalPComplement` and its complement `O_{p′}(G)`.
- ModularCharactersAndBlocks (under `RepresentationTheory/`): M1, M2, M4, M5, M7 and M8 are all there. M8 explicitly exposes the `p = 2` section, principal-block and kernel theorems "to Z*".

The OddOrderTheorem dependency is limited to the generic Dade/induction comparison and does not touch the Feit–Thompson endpoint. The README already said "Layer 2 consumes that comparison alone; … nor anything of F0 or F3–F6, and no odd-order hypothesis enters". That locator is now exact. In `TauCetiRoadmap/GlaubermanZStar/README.md`:
- line 61: "OddOrderTheorem F2 owns the general Dade isometry and its comparison…" → "…the general Dade isometry (its §2.3) and its comparison … (its §2.4)".
- line 173: "F2:" → "F2, Layer 2 §2.4:".
- line 571 (*Needs:*): "OddOrderTheorem F2" → "OddOrderTheorem F2 §2.4".

OddOrderTheorem §2.4 ("Trivial complements and ordinary induction") proves that, on a Dade datum with every `H_a = ⊥`, the Dade isometry equals `Subgroup.indClassFunction L` on `CF(L, A)`. That is exactly the contract this roadmap states, and it asks nothing of `L` beyond the datum.

LocalFiniteGroupTheory's "Not on this roadmap" section names Glauberman's Z* theorem and Brauer–Suzuki as belonging to a separate roadmap resting on it. That confirms the ownership split; nothing is planned twice.

## Adversarial pass on the changed statements

Only supplier locators changed. No mathematical statement or Lean declaration changed.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Supplier contract "F2 §2.4: Dade map equals induction when every `H_a` is trivial; induction is an isometry on `CF(L, A)`" | `G = S₃`, `L = ⟨(12)⟩`, `A = {(12)}` (the supplier's own Check) | `(Ind f)(12) = #C_G((12)) / #C_L((12)) · 1 = 2/2 = 1`; `‖f‖² = 1/2`, `‖Ind f‖² = (3·1)/6 = 1/2` | holds | locator only |
| same, fusion not controlled | `G = S₃`, `L = A₃`, `A = A₃ ∖ {1}` | `‖ω − ω²‖² = 2`, `Ind(ω − ω²) = ρ − ρ = 0` | not a Dade datum, so it is excluded by the contract's "fusion controlled by `L`" | none needed |
| same, `A = ∅` | any `L` | `CF(L, ∅) = 0`, so the comparison is `0 = 0` | holds | none |
| "`H_a` trivial ⇔ `C_G(a) ≤ L`" (contract wording) | Dade datum: `C_G(a) = H_a ⋊ C_L(a)`; `S₃`, `L = ⟨(12)⟩`, `a = (12)` | `C_G(a) = ⟨(12)⟩ = C_L(a)`, so `H_a = 1` | holds | none |

## Suggested.lean signature check

`Suggested.lean` is unchanged. I compared the elaborated types in `signatures.md` with the README statements:
- **`InPrincipalTwoBlock`:** it does not carry `[Finite G]`. The definition is meaningful without it: `TauCeti.irreducibleCharacters ℂ G` and `Nat.card` both elaborate without it. The only theorem that uses it, `principalBlock_involution_section_constancy`, keeps `[Finite G]`. No change.
- **"line 92: unexpected token 'in'":** this comes from the scratch signature file, not from `Suggested.lean`. The module is 89 lines and builds cleanly.

## Ownership against open pull requests

I checked ModularCharactersAndBlocks and OddOrderTheorem at the sibling checkouts given in the brief. I read LocalFiniteGroupTheory at its pull-request head through `roadmaps show`.

## Build

`lake build TauCetiRoadmap.GlaubermanZStar.Suggested`: **Build completed successfully (8993 jobs).** It reports four `declaration uses 'sorry'` warnings, at lines 38, 48, 59 and 82.

## Direction check

```
NOT IN ORDER: GlaubermanZStar (insert it after its last supplier)
depcheck: 235 roadmaps, 2060 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. "NOT IN ORDER" is the design-stage case the brief says is not a defect.

## Gate

The gate fails, but only on depcheck:

```
gate GlaubermanZStar: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
  depcheck: NOT IN ORDER: GlaubermanZStar (insert it after its last supplier)
```

The only failing item is that same NOT IN ORDER line, which is the H01 point itself: the roadmap is placed after its three suppliers once they are in the order.

Commit: `1fd7422b GlaubermanZStar: review repairs (OddOrderTheorem supplier cited at F2 §2.3/§2.4)`. Not pushed.
