# PELModuliPartII repair report

## REV-PKG-PELModuliPartII~5/F01 (P3) — applied

§2.3: "(LZ22, §10.2, equations (10.2.1)–(10.2.2), pp. 64–65.)" → "(LZ22, §10.1, p. 64; §10.2, equation (10.2.0.1) and the orthogonal decomposition following it, pp. 64–65.)". The mathematics is unchanged. The existing LZ22 manifest entry already covers §§10.1–10.2, pp. 63–65, and lists §2.3 under `cited_for`.

Evidence: LZ22 lines 2817–2819 (p. 64, §10.1) define `W_n` and say it is the split n-dimensional hermitian space. Line 2851 (p. 64) labels the framing isogeny (10.2.0.1). Lines 2854–2857 (p. 65) give norm ϖ for x₀ and the decomposition `V_{n+1}=W_n⊥⟨x₀⟩`, without an equation number. Lines 2871 and 2891 are Remarks 10.2.1 and 10.2.2, not equations.

Pattern search: I checked the README's 15 other "equation(s) (…)" locators against the cached texts by searching each label: Zhang21 (3.1)–(3.6), (6.1)–(6.6), (7.3)–(7.6); LL22 (2.20)–(2.22), (2.25), (4.8); LL21 (8.2); HLSY23 (2.1)–(2.6); Wu16 (3.21)–(3.26); Kraemer03 (4.3)–(4.11); RSZ21 (6.6)–(6.10); RSZ20 (4.10); RZ17 (8.1)–(8.2); LZ22 (2.11.0.1), (13.1.0.1). Every one is a real displayed-equation label. §2.3 was the only locator that named remarks as equations. The §2.5 and §9.10 locators already say "Remark 10.2.1", which is correct.

## REV-PKG-PELModuliPartII~5/F02 (P3) — applied

I confirmed both forward edges. Old §7.2 (localized smoothness) uses the local-model diagram "built as in §7.6" and lists §7.6 under Needs. Old §8.3 (local equations) quantifies over "the uniformization datum (V′,j,Λ′_p) of §8.4". Both edges are real prerequisites, so I kept them and reordered the sections. I used the order the review proposed: in it, the local-model comparison, whose statement imposes the wedge/spin and Krämer equations, comes after the exotic and Krämer models.

Former numbering → new: 7.2→7.6, 7.3→7.2, 7.4→7.3, 7.5→7.4, 7.6→7.5; 8.3→8.4, 8.4→8.3. Every other id is unchanged.

Section references updated:
- the headline list in the Summary;
- the Conventions sentence on the global Krämer model;
- the `Module.Grassmannian` and `IsRegularLocalRing` supplier bullets;
- the ShimuraCompactifications contract paragraph;
- the §0.4 Check;
- the Needs lines and prose of §§7.2–7.10, 8.1, 8.4–8.7, 9.6 and 9.9;
- the Layer 7 Examples;
- the Dependencies lists of Layers 8 and 9;
- the LL22 note in References;
- the `Suggested.lean` docstring;
- the `cited_for` lists in `sources.toml`.

References to other roadmaps that share these numbers were left alone: ShimuraCompactifications §7.5 and §7.18, and EndoscopicTransferAndUnitaryTraceComparison §7.6 and §8.3.

Mechanical results:
- A scan of all 76 Needs lines finds no forward edge inside the roadmap.
- The Dependencies list of each of Layers 7–9 equals the union of its Needs references to other layers.

I did not add a former-numbering table to the README. The roadmap is not on main. `roadmaps grep PELModuliPartII` finds no citation on main or in any open pull request. The only board package that cites it, GrossZagierAndArithmeticHeightsPartII, cites plan slugs (`U7 *global-integral-gluing*`, `U8 *integral-hecke-system*`), not section numbers. `design/plan.json` also uses slugs. No citation breaks, and a table would be process residue in a timeless README. The map is recorded here instead.

## REV-PKG-PELModuliPartII~5/F03 (P3) — applied

§3.7, first Check: "…would give 1." → "…would give 0 instead of 1." Recomputed: at n=2 the formal relative dimension is n−1=1 and the reduced-locus dimension is n/2−1=0, so the mistaken substitution gives 0. At n=4 the values are 3 and 1. The pattern search found the README's two other "would give" negative controls (§0.2 deformation count and Layer 1 rank raising), and both are correct: [K:ℚ_p]·(2[K:ℚ_p]−[K:ℚ_p])=[K:ℚ_p]², and (1,1)+(1,0)=(2,1).

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §2.3 locator: W_n split; x₀ of norm ϖ; `V_{n+1}=W_n⊥Lx₀` | q=3, L=ℚ₉/ℚ₃, n=2; norm-ϖ line versus norm-1 line | split hyperbolic W₂: det −1, valuation 0 (every unit of ℚ₃ is a norm from ℚ₉). Adding the norm-3 line gives det −3, valuation 1, so V₃ is nonsplit. Adding a norm-1 line gives valuation 0, so it is split. | Source lines 2817–2819 and 2851–2857 support both assertions | locator only |
| §3.7 Check (formal versus reduced dimension) | n=2, n=4 | n=2: relative dim 1, reduced dim 0, mistaken value 0. n=4: 3, 1, 1. Compared with the §3.4 relative dimension n−1 and the Layer 3 example Spf O_L̆[[t]] (dim 1 over O_L̆) | consistent | wording |
| Layer 7 order (new numbering) | every internal Needs edge | 7.3→7.2; 7.4→7.2; 7.5→7.2; 7.6→7.1, 7.5; 7.7→7.3, 7.5, 7.6; 7.8→7.4, 7.5; 7.9→7.5; 7.10→7.4, 7.8, 7.9 | all point backward | renumbered |
| Layer 8 order (new numbering) | every internal Needs edge | 8.1→7.2; 8.2→8.1; 8.3→8.2; 8.4→8.1, 8.2, 8.3, 7.5; 8.5→8.1, 8.2, 8.3; 8.6→7.2; 8.7→8.1, 7.6 | all point backward | renumbered |
| Layer 9 consumers of moved ids | §9.6, §9.9 | 9.6 needs old 7.4 (exotic model), now §7.3; 9.9 needs old 7.5 (Krämer), now §7.4; titles match | consistent | renumbered |
| Layer Dependencies lists | Layers 7, 8, 9 | Layer 8: {7.2, 7.5, 7.6} = the Needs references; Layer 9: {7.1, 7.3, 7.4, 7.9} = the Needs references | equal | updated |
| §8.4 reference to the uniformization datum | §8.4 statement | "(V′,j,Λ′_p) of §8.3" now points backward to the section that defines it | consistent | renumbered |

No statement, hypothesis or Check changed its mathematics apart from the F03 value. No other Check or worked example uses the moved objects in a way that depends on their numbers.

## Checks

- Elaboration: `lake env lean packages/PELModuliPartII/Suggested.lean`, run from the content checkout, exited 0 with no output. The file has only `import Mathlib` and no declarations, so no Tau Ceti module had to be built. The `#check @name` signature audit covers 0 of 0 declarations; nothing changed there. The only edit to the file is two section numbers in its docstring (§§7.2→7.6 and 8.3→8.4 in the headline list).
- Dependency check, exact output:

```text
depcheck: 245 roadmaps, 2239 edges, 0 problem(s)
```

  No UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation found nowhere, and no Lean name found nowhere.
- `sources.toml` and `metadata.toml` parse. No source was fetched, no manifest key was added, and no missing-reference request was written.

## Notes for the maintainer

- No gate failures were listed for this round.
- No name another roadmap cites changed: other roadmaps cite this roadmap by plan slug, and no Lean names were added or removed.
- The section renumbering in Layers 7 and 8 changes only README ids, listed in the map under F02. GrossZagierAndArithmeticHeightsPartII cites slugs and is unaffected.
- `design/plan.json` is unchanged; its gaps list did not need to change.
- Ownership against open pull requests was not re-checked this round: no repair introduced a new object or supplier edge.
