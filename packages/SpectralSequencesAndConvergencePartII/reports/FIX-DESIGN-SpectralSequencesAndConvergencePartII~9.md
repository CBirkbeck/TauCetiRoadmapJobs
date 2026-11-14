# FIX-DESIGN-SpectralSequencesAndConvergencePartII~9

One review with two findings, both P3. Both were verified and applied.

## REV-DESIGN-SpectralSequencesAndConvergencePartII~8/F01 (P3) — applied

The finding is correct. On its own, the sentence for `gap:base-complete-convergence` allows an abstract `β`. The finding's witness shows why that matters: take `K = V[0]` with the trivial filtration and an automorphism `σ ≠ id` of `V`. Then `β′ ∘ E_∞(id) = σ`, while `gr(id) ∘ β = id`. So the identity is not a morphism of converging structures, and the third case of 1.4 needs that morphism.

Stacks defines convergence through the canonical map (stacks-012K line 3135, Definition 24.9: "via Lemma 24.6"). Base §7.5 is stated with Needs 5.2, so it supplies the canonical form.

Old → new, in README `## Exact supplier contracts` and in the plan's `needs`: "…converges strongly in every degree to `H^*(K)` with the induced filtration." → "…with the induced filtration, through the canonical isomorphisms of gap:base-induced-filtration."

Same pattern elsewhere: I checked every other contract that asserts a convergence.
- §§5.3 and 5.4 already carry the clause.
- §§3.4, 3.5 and 3.6 are statements about abstract structures with no filtered complex, so the clause does not apply.
- In the plan's target statements, convergence is read under the README's Conventions bullet *Convergence*.

No consumer changes, because the conclusion only gets stronger.

## REV-DESIGN-SpectralSequencesAndConvergencePartII~8/F02 (P3) — applied

The finding is correct. stacks-012K line 3131–3140 is Definition 24.9, tag 012U, printed pp. 64–65. The manifest and the References omitted it. mccleary2001 is cited in the README only in 5.2 (line 1475) and 6.1 (line 1566).

Old → new:
- **`sources.toml`, stacks-012K:** `locator` gains "§24 Definition 24.9 (tag 012U, line 3131–3140)". `cited_for` gains "Scope and ownership" and "Exact supplier contracts".
- **`sources.toml`, mccleary2001:** `cited_for` drops "6.2".
- **README References:** the stacks-012K entry gains "§24 (Definition 24.9, tag 012U)".

Same pattern elsewhere:
- **Lemma 26.2:** Scope and ownership cites stacks-012K Lemma 26.2. Its tag 09IZ (source line 3371) was missing from the manifest's §26 tag list, so I added it. The References already listed it.
- **6.2 locator:** the plan's 6.2 locator also cited "mccleary2001 Ch. 10 (uncertified)", while the README's 6.2 does not. I removed it from the plan so that the plan agrees with the README and the manifest.
- **Plan wording:** the plan's `gap:base-induced-filtration` gains "tag 012U", matching the README.

A mechanical cross-check now finds no gap between sources cited and `cited_for`, in either the README sections or the plan's target locators.

## Checks run

Dependency check (the command in the brief), exact output:

```text
candidate: SpectralSequencesAndConvergencePartII is not in the merge order yet; checked as if placed after ArithmeticGaloisDuality (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2170 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

Internal consistency, checked mechanically:
- `plan.json` parses, and `sources.toml` parses.
- The gap slugs in the README, in the plan's `gaps` and in the target prerequisites are the same set of 19.
- The plan has 90 tests, unchanged.
- The README contains no machine paths.

No gate failures were listed for this round.

`Suggested.lean`: none at the design stage, so there was no `#check @name` elaboration to run.

## Adversarial pass on the changed statements

| Statement | Instance | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| gap:base-complete-convergence (repaired) | `K = V[0]`, trivial filtration, over a field `k` | `E_1 = E_∞ = V` at `(0,0)`. `Zᵗ = Z_∞ = V`, `Bᵗ = B_∞ = 0`, so the canonical presentation is `id_V`. With the clause `β = id` is forced, `σ` is excluded, and `(id, id)` is a morphism. | The clause pins `β`. | applied |
| Same contract, positive control | `ℓ`-adic filtration of `ℤ_ℓ` in degree 0, in `ModuleCat ℤ_ℓ` | Hypotheses hold: complete, exhaustive, `d = 0` so regular, `E_1^{p,−p} = 0` for `p < 0`. `E_1^{p,−p} = ℓ^pℤ_ℓ/ℓ^{p+1}ℤ_ℓ = ℤ/ℓ` for `p ≥ 0`. Every class lifts to a cycle in `F^p` and there are no boundaries, so the presentation is `id_{ℤ/ℓ}` at each `p`. | The strengthened conclusion holds. | none |
| Same contract, negative control | `ℓ`-adic filtration of `ℤ` | Not complete, since `ℤ ≠ lim ℤ/ℓ^p = ℤ_ℓ`. The canonical presentation is invertible, `ℤ/ℓ` against `ℓ^pℤ/ℓ^{p+1}ℤ`, but `H^0` is not complete. | Hypotheses exclude it, as base §7.5's second Check says. | none |
| Same contract, mechanism | Route of base §7.5 | Regularity gives `Z_r` stationary, hence `Z_∞ = Zᵗ` once `W^n = 0`, which the lower bound on `E_1` gives. Exhaustiveness and exact sequential colimits give `B_∞ = Bᵗ` (base §5.4, continuity at `⊤`). | Both maps of the presentation are isomorphisms, so the clause is what the theorem proves. | none |
| stacks-012K locator | Line 3131–3140 | Line 3131 is "Definition 24.9.012U"; line 3133 is the page 65 marker; lines 3135–3140 are items (1)–(3). | Locator correct. | manifest and References |
| stacks-012K Lemma 26.2 tag | Line 3371 | Line 3371 reads "Lemma 26.2.09IZ". | 09IZ belongs in the §26 list. | manifest |
| mccleary2001 sections | Sections citing it | README 1475 (§5.2) and 1566 (§6.1); §6.2 (lines 1591–1649) has none. The plan's 6.2 locator cited it. | `cited_for` and the plan now agree with the README. | manifest and plan |

## Ownership

- No new target, construction or supplier was introduced.
- The contract change strengthens what is asked of SpectralSequencesAndConvergence §7.5 to what its own Needs (§5.2) and its source already give.
- Ownership against open pull requests is unchanged, since no new object needed a search.

## For the maintainer

- No Lean names, section ids or gap slugs changed, so no other roadmap's citation is affected.
- When `packages/SpectralSequencesAndConvergence/design/README.md` §7.5 is next revised, it could say "through the canonical presentation of 5.2" explicitly, as noted for its §5.2 in the previous round.
- The review's "For the human reviewers" items (the uncertified sources and the `grothendieck1957` operator-local licence) needed no change.
- The review text contained no suspicious instructions.
