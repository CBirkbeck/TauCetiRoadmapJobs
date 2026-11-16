# FIX-PKG-ShimuraVarietiesPartII~16

Repair of the two findings of REV-PKG-ShimuraVarietiesPartII~15. Both are P3 and both are right. Edited: `packages/ShimuraVarietiesPartII/README.md` only. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## F01 (P3) — applied

§5.4: the single *Needs:* line after the second theorem is deleted. One line now follows each statement:

1. integral Siegel map: §0.1; §2.1; §2.6; §3.6; §3.7; §3.8; §5.3; PELModuli; §RD.5.116; gap:fixer-stable-lattices.
2. Construction: the map above; §0.1; §§0.4–0.6; §3.8; §§4.1–4.6, 4.8–4.13; ShimuraVarieties §5.6.
3. normality and density: the construction; §1.9; §2.1; §2.6; §3.6; §3.8; §3.10; §4.4; §4.5; ShimuraVarieties §5.6; gap:local-models; gap:component-specialization.

**Verification.** I read §5.4 (README lines 1117–1150 before the edit). Its three statements share one *Needs:* line. That line puts the first theorem behind §4.13 (gap:noot-coarse-comparison) and gap:component-specialization, but the first theorem's sketch uses neither.

I counted statements and *Needs:* lines in every numbered section. §5.4 is the only section with more statements than *Needs:* lines. The other mismatches are 0.6, 1.9, 2.6, 3.10, 4.13, 5.10, 6.3 and 7.6, each with 1 statement and 2 lines. These are the last sections of their layers, so the count also picks up the layer's *Dependencies* line. They are not instances of the pattern.

**How the reviewer's repair was changed.** I used the reviewer's three lines with one addition: §0.1 also goes on the Construction's line. The Construction defines N as the normalization in Sh_(K_2)(G_2,X_2) of the closure of the image in a single-lattice Siegel model, and it pulls back that model's universal abelian scheme. This is the §0.1 construction (HT §1.3.5), not only a consequence of the theorem above.

I did not narrow the PELModuli item. The README cites "§§M4.5–M4.6, M6.1–M6.4" as one unit throughout, matching its supplier contract.

**Union.** Computed from the old and new text: the new lines contain every item of the old line. They also add "§0.1" and the two internal references ("the integral Siegel map above", "the construction above"). §0.1 is already in the Layer 5 *Dependencies* line, so no *Dependencies* line changes and no supplier edge changes.

**Repair test.** For the torus Check (T=Res_(Q(i)/Q)G_m, p=5, lattice Z_5e_1⊕Z_5e_2), the Siegel map's line contains no Layer 4 section and no Layer 4 gap.

## F02 (P3) — applied

§5.5 locator: "Lemma 2.2.8, p.10" → "Lemma 2.2.8, pp.10–11".

**Verification.** In the KZ extraction:
- the lemma opens with part (1) at KZ line 457, on p.10;
- the p.11 marker is KZ line 459;
- part (2), which §5.5 uses ("x_3 is ordinary exactly when x_1 is"), is at KZ lines 461–462, on p.11.

This is the README's only citation of the lemma. The KZ locator in `sources.toml` gives no page, so the manifest does not change.

**Same pattern elsewhere.** I scanned every single-page locator of the form "Lemma/Proposition/Theorem/Corollary/Definition/Remark n.n.n, p.N" in the README. For each one I looked up the source's page markers where the cited statement starts and where the next numbered item starts. One more statement crosses a page:

- **KP Theorem 4.2.7** (References, Source conventions and corrections). It was cited as "p.186". The statement opens on p.186 (KP line 2681, under the page marker for printed p.186). Its clauses on π and q come after the p.187 marker at KP line 2686, at KP lines 2688–2690. The torsor claim that KPZ §7.3.1(1) corrects is in the proof at KP lines 2697–2698, also on p.187. KPZ line 3783 confirms the correction is to the proof.
- **Repair:** "KP, Theorem 4.2.7, p.186" → "KP, Theorem 4.2.7 and its proof, pp.186–187".
- KPZ §7.3.1(1) is at KPZ lines 3782–3786, before the p.86 marker at line 3788, so "p.85" is right.

The other flagged items are on the cited page:
- KPZ Remark 7.1.4(1): lines 3207–3211, p.73.
- KPZ Remark 7.1.9(b): lines 3272–3274, p.74.
- KPZ Theorem 7.1.3(1): line 3196, p.73. The theorem's opening line 3191 is on p.72, but the README cites the part.
- KPZ Theorem 7.1.8: line 3254, p.74.
- KPZ Corollary 7.2.24: line 3768, p.85.
- KP Corollary 0.3: KP line 130, printed p.124.
- KP Lemma 4.6.2(2): line 3110, p.198.
- KP Corollary 4.6.18: line 3391, p.205.
- HT Lemma 1.3.9: line 818, p.18.
- KPZ Definition 3.1.4: line 712, p.16.
- KPZ Definition 7.2.7: line 3447, p.78.
- KZ Definition 4.2.2: line 1481, p.34.
- K17 Corollary 2.1.7: line 1381, p.31.

## Checks

- **Elaboration.** `lake env lean packages/ShimuraVarietiesPartII/Suggested.lean`, run from the content checkout: exit 0, no output. The file is unchanged: one `import Mathlib`, the module docstring, the namespace, no declarations.
- **`#check @name` comparison.** There were no inputs, since `Suggested.lean` declares no names. Nothing changed.
- **Dependency check.** The prescribed command with `--movable` exited with 0:

  ```text
  depcheck: 263 roadmaps, 2566 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line.
- **`roadmaps resolve`** on the README: no unresolved citation and no Lean name found nowhere.
- **Gaps.** The README has the same 22 `gap:` slugs as the `gaps` list of `design/plan.json`. The edit moved slugs between *Needs:* lines but added or removed none.

## Adversarial pass on the changed text

No mathematical statement, hypothesis, Check or Lean declaration changed. The pass checks that each new *Needs:* line matches its statement and route item by item, and that each changed locator matches the source text.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §5.4 first theorem, *Needs:* | each object in the statement and sketch | statement: §2.1 (triple), §3.8 (model), §0.1 (single-lattice Siegel model); sketch: §2.6 (auxiliary embedding), §5.3 (matched diagram), §§3.6–3.7 (component action, free kernel), gap:fixer-stable-lattices (Λ_0), §RD.5.116 and §0.1 (Zarhin), PELModuli §§M6.1–M6.4 (universal object); no §4.x, gap:noot-coarse-comparison or gap:component-specialization | 10 items, each used | new line |
| §5.4 first theorem, torus Check | T=Res_(Q(i)/Q)G_m, p=5, Z_5e_1⊕Z_5e_2 | map needs §2.1, §3.8, §0.1 only; the line has no Layer 4 item | not blocked behind Layer 4 | none |
| §5.4 Construction, *Needs:* | each named section | §3.8 (S_(K_2) and the non-neat quotient); §0.1 (N, HT §1.3.5); §§0.4–0.6 (tensors on N); §§4.1, 4.3, 4.6, 4.8 (defined); §§4.2, 4.4, 4.5, 4.9–4.13 (same proofs); ShimuraVarieties §5.6 (the §4.5 proof with §3.8) | 18 items plus the theorem, each used | new line, §0.1 added |
| §5.4 second theorem, *Needs:* | each step of the sketch | gap:local-models and GeometricSatakeAndFusionPartII §§3.1, 7.6; §3.10 (q, π); §4.4 (closed S_≤[b]); §2.1 (quasi-split); §4.5 (special point); §3.6 and §2.6 (pieces); §1.9 (local integrality); gap:component-specialization; ShimuraVarieties §5.6 with §3.8 (reduction of [h,g′]); class and tensors from the construction | 12 items plus the construction, each used | new line |
| Union of the three lines against the old line | set difference, computed | old∖new = ∅; new∖old = {§0.1, two internal references} | no input lost; §0.1 already in Layer 5 Dependencies | none |
| §5.5 locator, KZ Lemma 2.2.8 | KZ lines 457, 459, 461–462 | (1) on p.10; marker p.11 at line 459; (2) on p.11 | range pp.10–11 | p.10 → pp.10–11 |
| Corrections bullet, KP Theorem 4.2.7 | KP lines 2681, 2686, 2688–2690, 2697–2698; KPZ line 3783 | opens on p.186 (marker 66, offset 120); π, q clauses and the q_loc claim on p.187; KPZ corrects the proof | range pp.186–187 | p.186 → "and its proof, pp.186–187" |
| KPZ §7.3.1(1), p.85 | KPZ lines 3782–3788 | (1) at 3783–3786; p.86 marker at 3788 | p.85 correct | none |

## For the maintainer

- No names changed. `Suggested.lean` declares nothing, and no section, layer or target was renumbered, so no other roadmap's citation is affected.
- No supplier edge changed, and no gap was added or removed.
- Ownership against open pull requests was not re-examined: no object was added. No source was fetched and no `needs-references.toml` was written.
- Nothing in the review text was suspicious.
