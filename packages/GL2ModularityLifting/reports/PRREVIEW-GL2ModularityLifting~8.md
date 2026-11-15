# Review of GL2ModularityLifting (pull request #1071 at 038e4ea)

**Verdict:** accepted

Incremental re-review of the 48 lines changed since 2c701b5 (`README.md` 46, `Suggested.lean` 2, a docstring line). No finding.

## Previous findings

- R01 — repaired: the contract (`README.md` line 185) reads "the full-scope totally real irreducible implication of §5.8, “Full-scope irreducible lifting conditional on component support”, conditional on `CMComponentSupport`"; heading and name are at OrdinaryAutomorphicFormsAndModularityLifting's head (its lines 635, 639).
- R02 — repaired: lines 31, 65, 67 and `Suggested.lean` line 31 cite "the raw compatible-system carrier" and "the stronger arithmetic compatible family of that section, with its chosen `E_λ`-models"; both are in SmallRamificationAndAbelianVarietyBaseCases §5.0d (its lines 2001, 2034). The two stale names occur 0 times.
- R03 — repaired: lines 125, 1242, 1302, 1314 quote "Integral q-expansion and coherent Hecke theory", "Deligne–Serre eigenvalue lifting", "Residual modularity and the classical target"; line 1302 cites "AlgebraicModularFormsAndSerreWeights §§5.10 and 5.14". All five are headings at that head (lines 263, 1215, 1526, 1309, 1353).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §8.9, list of applications of Theorem 1.4 | each Paso of DP §2 and DP §3 | Theorem 1.4 invoked at dp lines 448/454 (w), 468/503 (q), 556 (`p_i`), 591 (3), 652 (N), 670 (5), 702 (§3, prime > 3): seven, as listed | sound | none |
| §8.9 (i) in Paso 1 | `k = 2`; `k = 3, w = 7` | `w > 2k` gives `w > 2k − 1 > 2k − 3`; `k = 2`: `w ≥ 5`, bad set `{1, 3}`; `k = 3`: `7 ∉ {3, 5}` (dp lines 367–369, 438–443) | sound | none |
| §8.9 (i) in Paso 2, and its new Check | primes `≡ 1 mod 4` above 5 | 5, 13, 17, …: least admissible `q = 13`; `{2·2 − 3, 2·2 − 1} = {1, 3}`; `13 ∉ {1, 3}`; dp lines 463–467 use Lemma 1.14, not Lemma 2.1 | sound | none |
| §8.9, "Lemma 2.1 could not supply it there" | hypotheses of Lemma 2.1 at q | conclusion only for `p ∈ S₁ ∪ {2, 3}` (dp line 512); q exceeds `S₁` and 5 (line 464); `ρ^{(1)}` system unramified at N until line 505 | sound | none |
| §8.9, Lemma 2.1 paraphrase | dp lines 507–512 | ramification set in `S ∪ {2, 3}` with `S = S₁ ∪ {N}` (line 506), so `S₁ ∪ {N, 2, 3}`; type at N dihedral; non-solvable image on `S₁ ∪ {2, 3}` | sound | none |
| §8.9, "which gives (i) by §7.5" | `p = 3`, image non-solvable | an index-2 subgroup of a non-solvable group is non-solvable; a reducible subgroup of `GL₂(𝔽̄_p)` lies in a Borel, solvable; so irreducible over `ℚ(√−3)` | sound | none |
| §8.9, Theorem 1.6 ranges | w; q; §3 auxiliary prime | `w > 2k ≥ 4` gives `w ≥ 5`; `q > 5`; prime `> 3` gives `≥ 5`; Theorem 1.6 needs `p ≥ 5` (dp line 166) | sound | none |
| §8.9, final-step Check | prime `p > 3` | `3 = 2·2 − 1` is the larger bad-dihedral prime of weight two, `1 = 2·2 − 3` is no prime; dp lines 696–698 | sound | none |
| §8.9 locators | DP arXiv v2 pages | Lemma 1.14 stated p. 8 (line 367); Paso 1 p. 10; Paso 2 pp. 10–11, Lemma 2.1 p. 11; proof of Lemma 2.3 p. 13; §3 p. 15; §2 runs pp. 10–15 (lines 429–688) | sound | none |
| §8.9 second paragraph | supplier and consumer heads | PotentialModularityAndCompatibleSystems §1.2 (its line 117) and §12.5 (1886), merge-order line 179, after this roadmap (178); AutomorphicGaloisRepresentations §7.3 (3709); ClassicalSerreModularity Paso targets (1382, 1407) | sound | none |
| §10.15, reworded statement | Pan Conjecture 1.0.1 and Theorem 1.0.2 | hypotheses matched 8 of 8: continuous, irreducible, odd, finitely ramified, potentially semistable, distinct weights, `χ̄₁ ⊕ χ̄₂`, `p = 3` exclusion (pan lines 76–83, 100–105) | sound | none |
| §10.15, attribution of cases | ordinary ratio `≠ 1`; ordinary ratio `= 1`; non-ordinary | Skinner–Wiles; Pan §6; Pan Theorem 7.1.1 (pan lines 106–109) | sound | none |
| §10.15, `p = 3` exclusion | swap `χ̄₁, χ̄₂`; `1 ⊕ ω₅` at `p = 5` | `ω² = 1` at `p = 3`, so ratio `ω` iff inverse ratio `ω`; at `p = 5` no exclusion, covered | sound | none |
| §12.8, family-hypothesis sentence (line 3006) | against lines 31, 33, 2994 | statement quantifies over `𝓕_i : RankTwoFamily` with "common arithmetic good polynomials"; the sentence now says the same; no all-member de Rham clause in line 2994 | consistent | none |
| §12.8 locator | DP §2 | pp. 10–15 (dp lines 429, 688); Pan Theorem 1.0.2 on p. 3 (pan line 100, page marker at 87) | sound | none |
| *Needs:* of §§12.6–12.8 and Layer 12 Dependencies | SmallRamificationAndAbelianVarietyBaseCases §5.0d | heading at its line 1988; merge-order line 122, before 178 | sound | none |
| *Needs:* lines 1121, 1894, 3024 | repeated items | 0 repeated items in any `*Needs:*` line of the README (scripted scan) | sound | none |
| Contract lines 65, 67 | §5.0d fields | coefficient field, bad set, good-place polynomials, members, realization fields `L_λ/E_λ`, operations, geometric-to-arithmetic adapter `X^n P(1/X)/P(0)` (its lines 2001–2020, 2046–2048) | sound | none |
| Line 1302, Deligne–Serre step | AlgebraicModularFormsAndSerreWeights §§5.10, 5.14 | §5.10: commuting family on a finite free module over a DVR, eigenvalues lift; §5.14: residual eigenvector in `L/ϖL` lifts preserving weight and level, `p ∤ N` | supports the step | none |

The rows for untouched statements stand as in the previous review, of `2c701b5`.

- Gate, re-run on this head with `--base origin/main`: every check 0, `OK`; the worker's run has `build=0`.
- Dependency check: `depcheck: 245 roadmaps, 2250 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder: empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- `lake env lean` on `Suggested.lean`: two `sorry` warnings (lines 48, 87), nothing else. The only Lean change is docstring line 31; the five signatures equal the worker's signature file, and there is no `variable` block.
- Source lines read: DP 140–184, 364–369, 423–703; Pan 74–135; Tung dyadic 1797–1804; Emerton 145, 222, 245, 1437. Seeded sample: §8.9 lies in the changed text and was checked in full; §§10.1, 10.2, 10.11, 10.13 and the other sampled targets lie outside it.
- Cross-roadmap citations resolved at heads: 6 roadmaps (OrdinaryAutomorphicFormsAndModularityLifting, SmallRamificationAndAbelianVarietyBaseCases, AlgebraicModularFormsAndSerreWeights, PotentialModularityAndCompatibleSystems, AutomorphicGaloisRepresentations, ClassicalSerreModularity), 14 ids. No open roadmap cites §8.9, §10.15 or §12.8 by number.
- Pull-request text: the diff adds or drops no supplier, section or Lean declaration; the depends-on list already names all nineteen suppliers, including SmallRamificationAndAbelianVarietyBaseCases; no sentence of the title or description is contradicted by this head.
- Overlap check: read ClassicalSerreModularity, CompletedCohomologyAndLocalGlobalCompatibility, PotentialModularityAndCompatibleSystems (overlaps file: no pull request changes this roadmap, no dropped id); the changed text shares one object, the Khare–Wintenberger rank-two compatibility predicates and families through a lift, owner PotentialModularityAndCompatibleSystems §§1.2, 12.5, which §8.9 names as owner; the raw compatible-system carrier is SmallRamificationAndAbelianVarietyBaseCases §5.0d's, cited.
- Source independence: changed passages only; 5 passages compared with 2 sources (§8.9 main paragraph, its Lemma 2.1 clause and its two new Checks with DP lines 438–472, 507–512, 689–703; §10.15 with Pan lines 100–109), none shared beyond the standard phrases "almost strictly compatible system" and "non-solvable image"; largest share KW II, 58 of 205 locators; the diff adds, removes or reorders no layer, so contents were not compared again.

## Not verifiable

- Kisin, Moduli of finite flat group schemes, and modularity; Kisin, Modularity of 2-adic Barsotti–Tate representations; Kisin, Modularity for some geometric Galois representations: no readable legal copy, as in the previous review; no changed passage cites them.
- Supplier heads were read through `roadmaps show`; the line numbers above are those of the dumps.

## Source issues

- **Misprint** in Tung, dyadic (arXiv 1908.06174v3) at Theorem 8.0.3 (3), p. 38: the source says the residual representation is totally odd; it should be the characteristic-zero representation, `det ρ(c_v) = −1`, since at `p = 2` the residual condition is empty; affects a stated result.
- **Misprint** in Dieulefait–Pacetti (arXiv 2108.07577v2) at the proof of Theorem 1.4, p. 4: the source says Emerton's Theorem 1.2.1 removes Kisin's Hypothesis (1.2.6); it should be Emerton's Theorem 3.3.22 (see his Remark 1.2.5); affects the proof.

## For the human reviewers

- **Licence.** Three Kisin papers cited in Layers 3, 5 and 6 (finite flat group schemes; 2-adic Barsotti–Tate; Durham geometric representations) could not be read from a legal copy; their statements were checked only through KW II §10.2 and Gee's survey.
- **Scope.** The theorems of Layers 7–12 are stated conditionally on the named hypotheses LL1–LL3, CC1–CC5 and LC (`README.md`, "Conditional arithmetic hypotheses"), which the roadmap does not prove.
