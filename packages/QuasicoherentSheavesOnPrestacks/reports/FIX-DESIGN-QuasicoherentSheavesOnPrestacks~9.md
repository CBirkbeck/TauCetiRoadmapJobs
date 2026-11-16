# FIX-DESIGN-QuasicoherentSheavesOnPrestacks~9

Repair of the round-9 review of the QuasicoherentSheavesOnPrestacks design (two findings, both P3). Files changed: `packages/QuasicoherentSheavesOnPrestacks/design/README.md` and `packages/QuasicoherentSheavesOnPrestacks/design/plan.json`. `sources.toml` is unchanged: no new work is cited. The design has no `Suggested.lean`, so no Lean file was changed or elaborated.

## F01 (P3) — applied

Old → new: 6.3's two agreement sentences (§1.8 `Perf`, §1.28 lattice objects) and its §1.8 *Needs* entry are deleted; Layer 6 Dependencies "§§1.7–1.8" → "§1.7". The `Perf` agreement moves to 7.2 (now needs 1.5, 6.1, 6.3), the §1.28 agreement to 7.3 (now needs 6.1–6.3). Plan statements and prerequisites match.

Verified before applying. LanglandsParameterStacks §1.8 at its head (README line 390) defines `Perf` by chartwise dualizability, and its Check records `Perf(Λ)` for the free translation quotient. HabiroCohomologyFoundations §1.28 (line 821) describes the heart as modules with commuting invertible semilinear `Γ_i`, vector bundles as objects with finite projective underlying module, and perfect complexes as objects with perfect underlying complex.

How the repair differs from the suggestion, and why:

- **7.2.** The suggested sentence said "pullback to the chart". The statement now spells out why that is enough: the term on `G^{×_S n} ×_S X` is the pullback of the term on X along the map induced by any vertex `[0] → [n]`, and pullback is symmetric monoidal. The proof route says this is 6.3 on `[X/G]` plus 1.5. The general statement says "its chartwise dualizable objects, which is how §1.8 defines `Perf`", because it is about every action, not only §1.8's. The §1.8 agreement Check gains `Perf(Λ)`: `M ⊗_Λ O(Ĥ)` is dualizable exactly when M is perfect.
- **7.3.** The heart, vector bundle and perfect descriptions of §1.28 are written out. The proof route gives the argument the suggestion left implicit: 6.2(a) applies because `Spec C/ℤ^d` is a u-small colimit of affines. Every point lifts to `Spec C`. Coconnectivity is detected on the underlying object, through the induction left adjoint `⊕_γ γ^*`. A Check computes the unit's semilinear structure.
- **Pattern.** Pattern repaired in four other places:
  - Scope and ownership, LanglandsParameterStacks bullet: "7.2 and 6.3 … agree" → "7.2 … states the agreement".
  - Scope and ownership, HabiroCohomologyFoundations bullet: "7.3 and 6.3 agree there" → "7.3 states the agreement with both imports".
  - The two plan `suppliers` entries, which said "the case of 7.2 and 6.3" and "the lattice case of 7.3 and 6.3".
  - Because 7.2 now needs 1.5 directly, Layer 7 Dependencies "Layers 2–6" → "Layers 1–6", and "How to read the build" names Layer 1 for Layer 7.

  No other forward reference: a script comparison of all 33 targets shows every README *Needs* equal to the plan's `target:` prerequisites and no prerequisite at or after its own target.

## F02 (P3) — applied

Old → new (Conventions, Universes): "`Ĉat∞` is the ∞-category of locally (u+1)-small ∞-categories" → "the ∞-category of (u+1)-small ∞-categories, EnhancedDerivedSheaves' `Cat∞` (E0.5) formed in the universe u+1", with all (u+1)-small limits; 1.5(a) takes a (u+1)-small index K. The new Conventions text also says:

- the test-ring categories, every `Pts(X)`, every `Mod_A` and every `QCoh(X)` are (u+1)-small;
- `PreStk_T` is locally (u+1)-small but not (u+1)-small, so it is not an object of `Ĉat∞`;
- a witness: `Mod_ℤ` and `QCoh(BΓ × Spec k)`.

Pattern: every use of 1.5 indexes over `Pts(X)`, `Δ`, `Δ_s` or a bar construction. Plan 1.5 and 2.2 hypotheses updated to match.

Verified: EnhancedDerivedSheaves on main (README line 59) defines `Cat∞` as small quasicategories. E0.5 (line 246) and E0.8 (line 390) place presentable categories in universe u+1, locally u-small. So "`Cat∞` in universe u+1" is the right supplier name.

## Checks run

Dependency gate (the command of the brief):

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after HabiroCohomologyFoundations (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2234 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The edge count rose from 2232 to 2234 because 7.2 and 7.3 gained intra-roadmap edges. The supplier set is unchanged: LanglandsParameterStacks §1.8 and HabiroCohomologyFoundations §1.28 are still cited, now only from Layer 7.

`roadmaps resolve` on the README: no cross-roadmap citation and no roadmap Lean name found nowhere. The tool reports that it did not check Lean names outside TauCetiRoadmap on this host, so the nine library-name leads of the brief's citation list were neither confirmed nor refuted here; this round adds no new library name.

README ↔ plan: script comparison of *Needs* against `target:` prerequisites for all 33 targets. All agree; the only mismatches the script printed were two trailing-period parse artefacts, at 4.1 "2.1." and 6.1 "3.2.". The plan parses as JSON, and every target keeps at least three tests.

Style scan of the README: no LaTeX delimiters, process words, machine paths or pull-request numbers.

Lean: the design stage has no `Suggested.lean`, so no `#check` comparison was run, and none was needed.

## Adversarial pass (new or changed statements)

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 7.2, perfect objects = chartwise dualizable | trivial group `G = S`; translation action of G on itself; `X = ∅`; `BG_m` over ℤ; `B(ℤ/p) × Spec 𝔽_p` | constant bar construction, so `Perf(LX) = Perf(X)`; term on G is `π^*M` and `M = e^*π^*M`, so M is dualizable iff `π^*M` is, with no flatness needed; zero category, unique object dualizable; graded object with perfect underlying sum has finitely many weights (Layer 6 Example); unit O has term 𝔽_p on the chart, dualizable (6.3 Check) | holds |
| 7.2 Check, §1.8 translation quotient | Ĥ split reductive over Λ, `M = Λ`, `M = ⊕_ℕ Λ` | `O(Ĥ)` perfect over `O(Ĥ)`, so Λ is perfect; `⊕_ℕ O(Ĥ)` not perfect, so `⊕_ℕ Λ` is not; agrees with `Perf(Λ)` of §1.8 | holds |
| 7.3, heart of `D∞(C)^{hℤ^d}` | `d = 0`; ℤ acting trivially on `Spec ℚ`; `d = 1`, `C = ℚ[x^{±1}]`, `σ(x) = 2x` | C-modules; pairs (V, automorphism), coconnective iff V is: `Map(G_u, F_u)` contractible gives contractible fixed points, and `Ind M = M ⊗ ℚ[ℤ]` is connective; unit `(C, σ)`, while `id(x·1) = x ≠ 2x = σ(x)·id(1)` | holds; added as a Check |
| 7.3, vector bundles and perfect objects | zero module; `Ind(C) = ⊕_{n∈ℤ} C` at q = 1 | rank 0, in the heart and perfect; underlying module infinite free, so not perfect although compact (HabiroCohomologyFoundations §1.28 Check) | holds |
| 7.3, point lifting | value at A | `π₀(Map_T(C, A)_{hℤ^d}) = π₀Map_T(C, A)/ℤ^d`, a quotient of `π₀Map_T(C, A)` | every point lifts |
| 6.3 (shortened) | content unchanged; the deleted sentences moved verbatim in substance | statement, Checks and *Needs* re-read: no remaining use of Layer 7 | holds |
| Conventions, `Ĉat∞` | `Mod_ℤ`; `QCoh(∅)`; `QCoh(BΓ × Spec k)`; `PreStk_T`; `Ŝ` | objects form a set in u+1; limit over the empty `Pts(∅)`, the terminal category; limit over a (u+1)-small `Pts`; constant prestacks alone give (u+2)-many objects; not (u+1)-small | as stated |
| 1.5(a), (u+1)-small K | `K = ∅`, `Δ`, `Pts(X)`, `BΓ` | terminal limit; u-small; (u+1)-small by the Conventions; u-small | every use in Layers 2–8 satisfies it |

## For the maintainer

- No name that another roadmap cites changed. No section or target was renumbered. No new supplier, gap or source was added.
- LanglandsParameterStacks §1.8 and HabiroCohomologyFoundations §1.28 are still consumed, only from 7.2 and 7.3. Both were read at their open-PR heads (§1.8 at line 390, §1.28 at line 821); neither is on main.
- Ownership against open pull requests: the brief's `overlaps.md` lists no competing pull request and no dropped id. No new object was introduced, so no new ownership search was needed. Pull requests outside the brief's index were not checked.
- No suspicious instruction was found in the review text.
