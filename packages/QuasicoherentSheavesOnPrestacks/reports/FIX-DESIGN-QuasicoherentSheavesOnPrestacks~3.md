# Repair report: QuasicoherentSheavesOnPrestacks design, review round 3

Files changed: `packages/QuasicoherentSheavesOnPrestacks/design/README.md` and `packages/QuasicoherentSheavesOnPrestacks/design/plan.json`. `sources.toml` is unchanged because no new work is cited. There was one review (`REV-DESIGN-QuasicoherentSheavesOnPrestacks~2`) with one finding. The review's summary calls it R01; its heading calls it F01. It holds.

## REV-DESIGN-QuasicoherentSheavesOnPrestacks~2/F01 (P3) — applied

Old → new: `descendableCover_zariski` moves out of the "E5:descent" contract bullet into a new "E2.8" bullet. It is also added to the Scope line (E2.8), to the 3.2 *Needs:* line, to the Layer 3 Dependencies, and in `plan.json` to the 3.2 prerequisites and the supplier sections. The 3.2 Check is now scoped to the classical context and has a computed index.

**Verification.** In EnhancedDerivedSheaves on main, the declaration is stated at line 2427, under `### E2.8 h-descent on perfect schemes` (line 2399). The statement: for qcqs X and a finite cover by quasi-compact opens, `O_X → ∏ Rj_{i∗} O_{U_i}` is descendable in Dqc. `## Layer E5:descent` (line 1791) mentions it only in a Check at line 1836, which itself points to "Layer E2".

**Changes.**
- README line 20 (Scope and ownership): adds "the descendability of finite covers of qcqs schemes by quasi-compact opens (E2.8)".
- New contract bullet "E2.8". It states the supplier's hypotheses (qcqs X, a finite cover by quasi-compact opens). It also says how 3.2 applies the statement: on `X = Spec A` with `U_i = D(f_i)`, `Rj_{i∗}O_{U_i}` is `A[1/f_i]` because each `j_i` is affine, and the statement is carried to `D∞(A)` by `quasicoherentDerived_affine` (E1.8) and `derivedTensor_affine` (E1.8.DMA.1).
- The E5:descent bullet now names only `IsDescendable` and `moduleDescent`.
- 3.2 *Needs:* reads "E5:descent (`moduleDescent`), E2.8 (`descendableCover_zariski`), E1.8 (`quasicoherentDerived_affine`), E1.8.DMA.1 (`derivedTensor_affine`)". The Layer 3 Dependencies add E1.8, E1.8.DMA.1 and E2.8.
- `plan.json`: 3.2 prerequisites add `roadmap:EnhancedDerivedSheaves E2.8`, `E1.8` and `E1.8.DMA.1`. The supplier sections add `E2.8`, and the supplier `what` names the descendability of finite Zariski covers. Test `zariski_descendable` is rewritten to match the README.

**Why the repair goes slightly past the suggestion.**
- *The comparison sections.* E2.8 is a statement in `Dqc(X)` for schemes. Reading it as "`A → ∏ A[1/f_i]` is descendable in `D∞(A)`" needs two things: the affine comparison, and the tensor comparison that makes it a tensor-triangulated equivalence (descendability is membership in a thick tensor ideal). So E1.8 and E1.8.DMA.1 go into the 3.2 *Needs:* line. Both were already in the supplier contracts.
- *Scope of the Check.* E2.8 is stated for qcqs schemes, so the old unscoped Check ("A finite Zariski cover is descendable"), placed under 3.2's `CAlg^cn` statement, cited a supplier at a generality it does not have. The Check is now "in the classical context, for an ordinary ring A". This matches the 3.2 API bullet on descendable maps, which was already classical. The identification `D∞(A) ≃ Mod_A` comes from 1.2, which 3.2 already needs.

**Pattern search.** I checked every cited (section, declaration) pair against EnhancedDerivedSheaves on main, matching each cited section with the section where the name is defined (a bold statement head or a "Provide" line). That covers 72 parenthesised citations and the 13 supplier-contract bullets. There are no other mismatches. `descendableCover_zariski` was the only name cited under a section that mentions it only in a Check.

**Recomputed witness** (the new Check), for `ℤ → B = ℤ[1/2] × ℤ[1/3]`:
- The Mayer–Vietoris sequence `0 → ℤ → ℤ[1/2] ⊕ ℤ[1/3] → ℤ[1/6] → 0`, `(a, b) ↦ a − b`, is exact. Injectivity: `ℤ[1/2] ∩ ℤ[1/3] = ℤ`. Surjectivity: from `1 = u·3^b + v·2^a` we get `1/(2^a 3^b) = u/2^a + v/3^b`.
- So `I = fib(ℤ → B) = ℤ[1/6][−1]`.
- `I^{⊗2} = ℤ[1/6][−2]`, because `ℤ[1/6]` is flat and idempotent. Then `Hom(I^{⊗2}, ℤ) = Ext²_ℤ(ℤ[1/6], ℤ) = 0`, since ℤ is hereditary. So the index is at most 2.
- `I → ℤ` null would split `ℤ → B`. That is impossible, because `Hom(ℤ[1/2], ℤ) = Hom(ℤ[1/3], ℤ) = 0`. So the index is exactly 2.

## Checks run

**Dependency gate** (exact output, after the final edit). There is no UPWARD or CYCLE line.

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 243 roadmaps, 2386 edges, 0 problem(s)
```

**Citation resolver** on the edited README: no cross-roadmap citation and no Lean name found nowhere. The 7 leads in `scratch/citations.md` were supplier-roadmap names (SchemeAndStackFoundations, DerivedModuleAlgebra, EnhancedDerivedSheaves) that the resolver had looked for only in the pinned libraries. All of them now resolve, and the review verified them on main.

**Counts:** 33 targets and 116 tests in `plan.json`, as before; the 3.2 Check count is unchanged at 6. `plan.json` parses as JSON.

**`#check` pass:** not applicable. The design stage has no `Suggested.lean`, so no Lean declaration was added, changed or elaborated.

## Adversarial pass (changed statements)

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| E2.8 contract bullet, read on `Spec A` | `A = ℤ`, `f = (2, 3)`; `n = 1`, `f_1 = 1`; `n = 0` | `Rj_{i∗}O = A[1/f_i]` since `D(f_i) → Spec A` is affine; `(f_1) = A` gives the identity `A → A`, index 1 (agrees with E2.8's own Check "a single open `U = X` gives the identity, of index 1"); the empty family generates the unit ideal only for `A = 0`, and `0 → 0` has index 0 | sound | bullet added |
| 3.2 Check, classical scope | `CAlg^cn` versus `CRing` | E2.8 is stated for qcqs schemes only; the unscoped claim over `CAlg^cn` had no supplier at that generality | old Check overreached its citation | scoped to ordinary rings |
| 3.2 Check, index for `ℤ → ℤ[1/2] × ℤ[1/3]` | m = 1, 2 | `I = ℤ[1/6][−1]`; `Ext²_ℤ(ℤ[1/6], ℤ) = 0`, so index ≤ 2; `I → ℤ` null would split `ℤ → B`, but `Hom(ℤ[1/2], ℤ) = Hom(ℤ[1/3], ℤ) = 0`, so index ≠ 1 | index exactly 2 | value added |
| 3.2 Check, "the two descent equivalences coincide" | the same cover | it is faithfully flat (flat, and `Spec` jointly surjective since `(2, 3) = ℤ`); 3.2's Čech form `Mod_A ≃ lim_Δ Mod_{B^{⊗(•+1)}}` and `moduleDescent` are both extension of scalars to the same Čech nerve | sound | none |
| Transport along `quasicoherentDerived_affine`, `derivedTensor_affine` | thick tensor ideal generated by B | E1.8.DMA.1 gives `a_R(K ⊗ᴸ L) ≅ a_R K ⊗ᴸ a_R L` with unit, shifts, associativity and symmetry (EnhancedDerivedSheaves lines 890–902), so thick tensor ideals correspond; E5:descent also records that exact strong monoidal functors preserve descendability | sound | *Needs:* entries added |
| 1.2 identification `Mod_{θιA} ≃ D∞(A)` | `A = ℤ` | `Mod_ℤ = D∞(ℤ)` with unit `ℤ[0]` (1.2 Check) | sound | none |

## For the maintainer

- No name that another roadmap cites changed, and no section, layer or target id moved.
- Ownership against open pull requests: this repair adds no construction, only a corrected supplier citation, so ownership is unaffected. The citation is to EnhancedDerivedSheaves on main.
- No new source, and no `needs-references.toml` entry.
- No text in the review was treated as an instruction. Nothing suspicious was found.
